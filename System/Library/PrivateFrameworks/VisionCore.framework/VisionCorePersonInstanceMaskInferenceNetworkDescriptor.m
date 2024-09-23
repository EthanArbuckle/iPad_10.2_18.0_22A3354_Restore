@implementation VisionCorePersonInstanceMaskInferenceNetworkDescriptor

- (NSArray)personInstanceMasksOutput
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  -[VisionCoreInferenceNetworkDescriptor outputs](self, "outputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("person_instances_1:0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("person_instances_2:0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("person_instances_3:0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("person_instances_4:0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)personInstanceMaskConfidencesOutput
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[VisionCoreInferenceNetworkDescriptor outputs](self, "outputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("person_instance_confidences:0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)isEqual:(id)a3
{
  VisionCorePersonInstanceMaskInferenceNetworkDescriptor *v4;
  BOOL v5;
  objc_super v7;

  v4 = (VisionCorePersonInstanceMaskInferenceNetworkDescriptor *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7.receiver = self;
      v7.super_class = (Class)VisionCorePersonInstanceMaskInferenceNetworkDescriptor;
      v5 = -[VisionCoreInferenceNetworkDescriptor isEqual:](&v7, sel_isEqual_, v4);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (id)personInstanceMaskV1AndReturnError:(id *)a3
{
  VisionCoreResourceVersion *v4;
  __CFString *v5;
  VisionCoreResourceVersion *v6;
  __CFString *v7;
  id v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  _BOOL4 v18;
  id v19;
  id v20;
  VisionCorePersonInstanceMaskInferenceNetworkDescriptor *v21;
  VisionCoreProcessingDescriptorSpecifier *v22;
  VisionCorePersonInstanceMaskInferenceNetworkDescriptor *v23;
  void *v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 1, 0, 0);
  v5 = CFSTR("HyperDETR-u8-v1.1.espresso");
  v6 = v4;
  v7 = CFSTR("image");
  v8 = &unk_24E1E6550;
  v9 = CFSTR("person_instance_confidences:0");
  objc_opt_self();
  +[VisionCoreEspressoUtils URLForModelNamed:error:](VisionCoreEspressoUtils, "URLForModelNamed:error:", CFSTR("HyperDETR-u8-v1.1.espresso"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(&unk_24E1E6550, "count");
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v11);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = &unk_24E1E6550;
    v14 = objc_msgSend(&unk_24E1E6550, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(&unk_24E1E6550);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_24E1E63E0, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        }
        v15 = objc_msgSend(&unk_24E1E6550, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v15);
    }

    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_24E1E63E0, CFSTR("person_instance_confidences:0"));
    v26 = 0;
    v27 = 0;
    v18 = +[VisionCoreEspressoUtils getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:](VisionCoreEspressoUtils, "getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:", &v27, &v26, v10, CFSTR("image"), 1111970369, v12, 0, a3);
    v19 = v27;
    v20 = v26;
    v21 = 0;
    if (v18)
    {
      v22 = -[VisionCoreProcessingDescriptorSpecifier initWithIdentifier:version:]([VisionCoreProcessingDescriptorSpecifier alloc], "initWithIdentifier:version:", CFSTR("VisionCoreInferenceNetworkIdentifierPersonInstanceMask"), v6);
      v23 = [VisionCorePersonInstanceMaskInferenceNetworkDescriptor alloc];
      objc_msgSend(v20, "allValues");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[VisionCoreInferenceNetworkDescriptor initWithURL:specifier:networkHeadVersions:inputImage:outputs:confidencesOutput:](v23, "initWithURL:specifier:networkHeadVersions:inputImage:outputs:confidencesOutput:", v10, v22, 0, v19, v24, 0);

    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
