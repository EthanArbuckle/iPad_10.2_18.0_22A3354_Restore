@implementation VisionCoreFaceprintInferenceNetworkDescriptor

+ (id)FPrev3_1FArev1_3_MD2AndReturnError:(id *)a3
{
  VisionCoreResourceVersion *v5;
  VisionCoreResourceVersion *v6;
  VisionCoreResourceVersion *v7;
  void *v8;

  v5 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 3, 1, 0);
  v6 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 3, 1, 0);
  v7 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 1, 3, 0);
  +[VisionCoreFaceprintInferenceNetworkDescriptor faceprintInferenceNetworkDescriptorForIndentifier:modelName:aneModelName:pixelFotmatType:faceAnalyzerDetectorVersion:faceprintVersion:faceattributesVersion:error:]((uint64_t)a1, CFSTR("FPrev3_1FArev1_3_MD2"), CFSTR("facerec_fp3.1_fa1.3.espresso"), 0, v5, v6, v7, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)FPrev4_0FArev1_4_MD2AndReturnError:(id *)a3
{
  VisionCoreResourceVersion *v5;
  VisionCoreResourceVersion *v6;
  VisionCoreResourceVersion *v7;
  void *v8;

  v5 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 4, 0, 0);
  v6 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 4, 0, 0);
  v7 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 1, 4, 0);
  +[VisionCoreFaceprintInferenceNetworkDescriptor faceprintInferenceNetworkDescriptorForIndentifier:modelName:aneModelName:pixelFotmatType:faceAnalyzerDetectorVersion:faceprintVersion:faceattributesVersion:error:]((uint64_t)a1, CFSTR("FPrev4_0FArev1_4_MD2"), CFSTR("facerec_fp4.0_fa1.4_md2_2_fp16.espresso"), CFSTR("facerec_fp4.0_fa1.4_md2_2_fp16_dev_op.espresso"), v5, v6, v7, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)faceprintInferenceNetworkDescriptorForIndentifier:(uint64_t)a1 modelName:(void *)a2 aneModelName:(void *)a3 pixelFotmatType:(void *)a4 faceAnalyzerDetectorVersion:(void *)a5 faceprintVersion:(void *)a6 faceattributesVersion:(void *)a7 error:(uint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  VisionCoreFaceprintInferenceNetworkDescriptor *(*v34)(uint64_t, uint64_t);
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  int v43;

  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = objc_opt_self();
  v32 = MEMORY[0x24BDAC760];
  v33 = 3221225472;
  v34 = __211__VisionCoreFaceprintInferenceNetworkDescriptor_faceprintInferenceNetworkDescriptorForIndentifier_modelName_aneModelName_pixelFotmatType_faceAnalyzerDetectorVersion_faceprintVersion_faceattributesVersion_error___block_invoke;
  v35 = &unk_24E1DBAE0;
  v36 = v15;
  v37 = v16;
  v41 = v17;
  v42 = v20;
  v43 = 1111970369;
  v38 = v14;
  v39 = v18;
  v40 = v19;
  v21 = v17;
  v22 = v19;
  v23 = v18;
  v24 = v14;
  v25 = v16;
  v26 = v15;
  v27 = (void *)MEMORY[0x2207A662C](&v32);
  +[VisionCoreFrameworkManager sharedManager](VisionCoreFrameworkManager, "sharedManager", v32, v33, v34, v35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "inferenceNetworkDescriptorsCache");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForIdentifier:creationBlock:error:", v24, v27, a8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)ANESpecificURL
{
  NSURL *aneSpecificModelURL;
  objc_super v4;

  aneSpecificModelURL = self->_aneSpecificModelURL;
  if (aneSpecificModelURL)
    return aneSpecificModelURL;
  v4.receiver = self;
  v4.super_class = (Class)VisionCoreFaceprintInferenceNetworkDescriptor;
  -[VisionCoreEspressoNetworkDescriptor ANESpecificURL](&v4, sel_ANESpecificURL);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)outputForFaceAttribute:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_outputNameForFaceAttribute:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VisionCoreInferenceNetworkDescriptor outputNamed:error:](self, "outputNamed:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VisionCoreFaceprintInferenceNetworkDescriptor;
  v4 = a3;
  -[VisionCoreInferenceNetworkDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceprintOutput, CFSTR("faceprintOutput"), v5.receiver, v5.super_class);

}

- (VisionCoreFaceprintInferenceNetworkDescriptor)initWithCoder:(id)a3
{
  id v4;
  VisionCoreFaceprintInferenceNetworkDescriptor *v5;
  uint64_t v6;
  VisionCoreTensorDescriptor *faceprintOutput;
  VisionCoreFaceprintInferenceNetworkDescriptor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VisionCoreFaceprintInferenceNetworkDescriptor;
  v5 = -[VisionCoreInferenceNetworkDescriptor initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceprintOutput")),
        v6 = objc_claimAutoreleasedReturnValue(),
        faceprintOutput = v5->_faceprintOutput,
        v5->_faceprintOutput = (VisionCoreTensorDescriptor *)v6,
        faceprintOutput,
        !v5->_faceprintOutput))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreFaceprintInferenceNetworkDescriptor *v4;
  VisionCoreFaceprintInferenceNetworkDescriptor *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (VisionCoreFaceprintInferenceNetworkDescriptor *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)VisionCoreFaceprintInferenceNetworkDescriptor,
          -[VisionCoreInferenceNetworkDescriptor isEqual:](&v10, sel_isEqual_, v4)))
    {
      v5 = v4;
      -[VisionCoreFaceprintInferenceNetworkDescriptor faceprintOutput](self, "faceprintOutput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreFaceprintInferenceNetworkDescriptor faceprintOutput](v5, "faceprintOutput");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (VisionCoreTensorDescriptor)faceprintOutput
{
  return self->_faceprintOutput;
}

- (NSArray)faceAttributes
{
  return self->_faceAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceAttributes, 0);
  objc_storeStrong((id *)&self->_aneSpecificModelURL, 0);
  objc_storeStrong((id *)&self->_faceprintOutput, 0);
}

+ (id)_outputNameForFaceAttribute:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("softmax_%@_output"), v5);
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", CFSTR("illegal face attribute"));
    v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

VisionCoreFaceprintInferenceNetworkDescriptor *__211__VisionCoreFaceprintInferenceNetworkDescriptor_faceprintInferenceNetworkDescriptorForIndentifier_modelName_aneModelName_pixelFotmatType_faceAnalyzerDetectorVersion_faceprintVersion_faceattributesVersion_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  VisionCoreFaceprintInferenceNetworkDescriptor *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  id v28;
  id v29;
  VisionCoreProcessingDescriptorSpecifier *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v41;
  id v42;
  VisionCoreFaceprintInferenceNetworkDescriptor *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD block[5];
  _QWORD v57[2];
  _QWORD v58[2];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  +[VisionCoreEspressoUtils URLForModelNamed:error:](VisionCoreEspressoUtils, "URLForModelNamed:error:", *(_QWORD *)(a1 + 32), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    +[VisionCoreEspressoUtils URLForModelNamed:error:](VisionCoreEspressoUtils, "URLForModelNamed:error:", v5, a2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_4:
      v7 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    v6 = 0;
  }
  v49 = (void *)v6;
  v8 = *(id *)(a1 + 48);
  v9 = objc_opt_self();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__VisionCoreFaceprintInferenceNetworkDescriptor_faceattributesForDescriptorIndentifier___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v9;
  if (faceattributesForDescriptorIndentifier__onceToken != -1)
    dispatch_once(&faceattributesForDescriptorIndentifier__onceToken, block);
  objc_msgSend((id)faceattributesForDescriptorIndentifier__descriptorIndentifiersToFaceattributes, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24E1E6170, CFSTR("flatten_output"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24E1E6170, CFSTR("confidence"));
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v53 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend((id)objc_opt_class(), "_outputNameForFaceAttribute:error:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i), a2);
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v7 = 0;
          v20 = v12;
          v22 = v49;
          goto LABEL_24;
        }
        v18 = (void *)v17;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24E1E6170, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      if (v14)
        continue;
      break;
    }
  }

  v50 = 0;
  v51 = 0;
  v19 = +[VisionCoreEspressoUtils getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:](VisionCoreEspressoUtils, "getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:", &v51, &v50, v4, CFSTR("data"), *(unsigned int *)(a1 + 88), v11, 0, a2);
  v20 = v51;
  v21 = v50;
  v7 = 0;
  v22 = v49;
  if (v19)
  {
    v57[0] = CFSTR("VisionCoreFaceprintInferenceNetworkHeadIdentifierFaceprint");
    v57[1] = CFSTR("VisionCoreFaceprintInferenceNetworkHeadIdentifierFaceAttributes");
    v23 = *(_QWORD *)(a1 + 64);
    v58[0] = *(_QWORD *)(a1 + 56);
    v58[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [VisionCoreFaceprintInferenceNetworkDescriptor alloc];
    v25 = *(void **)(a1 + 72);
    v46 = v49;
    v48 = v21;
    v44 = v21;
    v26 = CFSTR("flatten_output");
    v45 = v12;
    v43 = v7;
    v47 = v24;
    if (v7)
    {
      v27 = CFSTR("confidence");
      v42 = v20;
      v41 = v24;
      v28 = v25;
      v29 = v4;
      v30 = -[VisionCoreProcessingDescriptorSpecifier initWithIdentifier:version:]([VisionCoreProcessingDescriptorSpecifier alloc], "initWithIdentifier:version:", CFSTR("VisionCoreInferenceNetworkIdentifierFaceprint"), v28);

      v31 = v44;
      objc_msgSend(v44, "allValues");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("confidence"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = -[VisionCoreInferenceNetworkDescriptor initWithURL:specifier:networkHeadVersions:inputImage:outputs:confidencesOutput:](v43, "initWithURL:specifier:networkHeadVersions:inputImage:outputs:confidencesOutput:", v29, v30, v41, v42, v32, v33);
      v22 = v49;
      v35 = v45;
      if (v34)
      {
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("flatten_output"));
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = *(void **)(v34 + 64);
        *(_QWORD *)(v34 + 64) = v36;

        v38 = objc_msgSend(v45, "copy");
        v39 = *(void **)(v34 + 80);
        *(_QWORD *)(v34 + 80) = v38;

        objc_storeStrong((id *)(v34 + 72), v49);
      }
      v7 = (VisionCoreFaceprintInferenceNetworkDescriptor *)(id)v34;

    }
    else
    {
      v22 = v49;
      v31 = v44;
      v35 = v45;
    }

    v21 = v48;
  }

LABEL_24:
LABEL_25:

  return v7;
}

void __88__VisionCoreFaceprintInferenceNetworkDescriptor_faceattributesForDescriptorIndentifier___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("FPrev3_1FArev1_3_MD2");
  +[VisionCoreFaceprintInferenceNetworkDescriptor faceAttributesV1_3]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("FPrev4_0FArev1_4_MD2");
  v5[0] = v0;
  objc_opt_self();
  +[VisionCoreFaceprintInferenceNetworkDescriptor faceAttributesV1_3]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)faceattributesForDescriptorIndentifier__descriptorIndentifiersToFaceattributes;
  faceattributesForDescriptorIndentifier__descriptorIndentifiersToFaceattributes = v2;

}

+ (id)faceAttributesV1_3
{
  objc_opt_self();
  if (faceAttributesV1_3_onceToken != -1)
    dispatch_once(&faceAttributesV1_3_onceToken, &__block_literal_global_1447);
  return (id)faceAttributesV1_3_faceAttributes;
}

void __67__VisionCoreFaceprintInferenceNetworkDescriptor_faceAttributesV1_3__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[19];

  v2[18] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("UNKNOWN_0");
  v2[1] = CFSTR("UNKNOWN_1");
  v2[2] = CFSTR("UNKNOWN_2");
  v2[3] = CFSTR("UNKNOWN_3");
  v2[4] = CFSTR("UNKNOWN_4");
  v2[5] = CFSTR("UNKNOWN_5");
  v2[6] = CFSTR("UNKNOWN_6");
  v2[7] = CFSTR("UNKNOWN_7");
  v2[8] = CFSTR("UNKNOWN_8");
  v2[9] = CFSTR("UNKNOWN_9");
  v2[10] = CFSTR("UNKNOWN_10");
  v2[11] = CFSTR("UNKNOWN_11");
  v2[12] = CFSTR("UNKNOWN_12");
  v2[13] = CFSTR("UNKNOWN_13");
  v2[14] = CFSTR("UNKNOWN_14");
  v2[15] = CFSTR("UNKNOWN_15");
  v2[16] = CFSTR("UNKNOWN_16");
  v2[17] = CFSTR("UNKNOWN_17");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)faceAttributesV1_3_faceAttributes;
  faceAttributesV1_3_faceAttributes = v0;

}

@end
