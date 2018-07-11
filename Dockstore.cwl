#!/usr/bin/env cwl-runner

class: CommandLineTool
id: "Delly"
label: "Delly tool"
cwlVersion: v1.0

doc: |
  A Docker container for SV analysis using Delly tool. 
   
s:author:
  - class: s:Person
    s:name: Anmol J. Hemrom

requirements:
  - class: DockerRequirement
    dockerPull: "anmoljh/docker-delly"

inputs:
  noindels:
    type: boolean
    doc: 'no small InDel calling'
    inputBinding:
      position: 1
      prefix: "-n"
  genome:
    type: File
    doc: 'Input genome file'
    secondaryFiles:
      - .fai
    inputBinding:
      position: 2
      prefix: "-g"
  exclude:
    type: File
    doc: 'Exclude file'
    inputBinding:
      position: 3
      prefix: "-x"
  output:
    type: string
    doc: 'Output filename'
    inputBinding:
      position: 4
      prefix: "-o"
  tumor-bam:
    type: File
    doc: 'Tumor bam-file'
    secondaryFiles:
      - .bai
    inputBinding:
      position: 5
  normal-bam:
    type: File
    doc: 'Normal bam-file'
    secondaryFiles:
      - .bai
    inputBinding:
      position: 6

outputs:
  bcf-outputs:
    type:
      type: array
      items: File
    doc: 'BCF Output files'
    outputBinding:
      glob: sv.bcf*

baseCommand: ["delly", "call"]
