#!/usr/bin/env nextflow

nextflow.enable.dsl=2

// Include the specific pipeline based on the parameter
if (params.pipeline == "metagenomic") {
    include { metagenomic } from "${projectDir}/pipelines/metagenomic/metagenomic"
} else if (params.pipeline == "metatranscriptomic" ) {    
    include { metatranscriptomic } from "${projectDir}/pipelines/metatranscriptomic/metatranscriptomic"
}    

workflow {
    // print launchDir
    println "launchDir: ${launchDir}"
    // print projectDir
    println "projectDir: ${projectDir}"
    if (params.pipeline == "metagenomic") {
        metagenomic()
    } else if (params.pipeline == "metatranscriptomic") {
        metatranscriptomic()
    }
}