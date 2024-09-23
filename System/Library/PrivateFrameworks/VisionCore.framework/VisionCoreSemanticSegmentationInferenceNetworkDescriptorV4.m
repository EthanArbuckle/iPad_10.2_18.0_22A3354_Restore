@implementation VisionCoreSemanticSegmentationInferenceNetworkDescriptorV4

- (VisionCoreTensorDescriptor)personsMaskOutput
{
  void *v2;
  void *v3;

  -[VisionCoreInferenceNetworkDescriptor outputs](self, "outputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("person:0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VisionCoreTensorDescriptor *)v3;
}

- (NSArray)humanAttributesMasksOutput
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
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("skin:0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hair:0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("semantics-estimator/split_channels_1__2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("teeth:0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (VisionCoreTensorDescriptor)skyMaskOutput
{
  void *v2;
  void *v3;

  -[VisionCoreInferenceNetworkDescriptor outputs](self, "outputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sky:0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VisionCoreTensorDescriptor *)v3;
}

- (VisionCoreTensorDescriptor)glassesMaskOutput
{
  void *v2;
  void *v3;

  -[VisionCoreInferenceNetworkDescriptor outputs](self, "outputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("glasses:0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VisionCoreTensorDescriptor *)v3;
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreSemanticSegmentationInferenceNetworkDescriptorV4 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (VisionCoreSemanticSegmentationInferenceNetworkDescriptorV4 *)a3;
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
      v7.super_class = (Class)VisionCoreSemanticSegmentationInferenceNetworkDescriptorV4;
      v5 = -[VisionCoreInferenceNetworkDescriptor isEqual:](&v7, sel_isEqual_, v4);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (id)objectClassOutputNameForObjectClassID:(unint64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v8;

  if ((uint64_t)a3 > 383)
  {
    if (a3 != 0x1FFF && a3 != 384)
      goto LABEL_10;
  }
  else if (a3 != 13 && a3 != 60)
  {
LABEL_10:
    objc_msgSend(a1, "objectClassOutputNamesForObjectClassIDs:error:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v8)
    {
      objc_msgSend(v8, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    goto LABEL_13;
  }
  if (!a4)
    return 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("This method accepts individual object class ID only %lu"), a3);
  objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v5);
  v6 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v6;
}

+ (id)objectClassOutputNamesForObjectClassIDs:(unint64_t)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  if (_objectClassIDsToObjectOutputNames_onceToken != -1)
    dispatch_once(&_objectClassIDsToObjectOutputNames_onceToken, &__block_literal_global_944);
  v6 = (id)_objectClassIDsToObjectOutputNames_objectClassIDsToObjectClassOutputNames;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v13, "unsignedIntegerValue") & a3) != 0)
        {
          objc_msgSend(v6, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  v15 = objc_msgSend(v7, "count");
  if (a4 && !v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unknown object class ID %lu"), a3);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v17 = (void *)objc_msgSend(v7, "copy");

  return v17;
}

+ (id)semanticSegmentationV4AndReturnError:(id *)a3
{
  VisionCoreResourceVersion *v4;
  __CFString *v5;
  VisionCoreResourceVersion *v6;
  __CFString *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _BOOL4 v17;
  id v18;
  id v19;
  VisionCoreSemanticSegmentationInferenceNetworkDescriptorV4 *v20;
  VisionCoreProcessingDescriptorSpecifier *v21;
  VisionCoreSemanticSegmentationInferenceNetworkDescriptorV4 *v22;
  void *v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 1, 0, 0);
  v5 = CFSTR("personsemantics-u8-v4.espresso");
  v6 = v4;
  v7 = CFSTR("image:0");
  v8 = &unk_24E1E6520;
  objc_opt_self();
  +[VisionCoreEspressoUtils URLForModelNamed:error:](VisionCoreEspressoUtils, "URLForModelNamed:error:", CFSTR("personsemantics-u8-v4.espresso"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_msgSend(&unk_24E1E6520, "count");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v10);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = &unk_24E1E6520;
    v13 = objc_msgSend(&unk_24E1E6520, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(&unk_24E1E6520);
          objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24E1E6158, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        }
        v14 = objc_msgSend(&unk_24E1E6520, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v14);
    }

    v25 = 0;
    v26 = 0;
    v17 = +[VisionCoreEspressoUtils getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:](VisionCoreEspressoUtils, "getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:", &v26, &v25, v9, CFSTR("image:0"), 1111970369, v11, 0, a3);
    v18 = v26;
    v19 = v25;
    v20 = 0;
    if (v17)
    {
      v21 = -[VisionCoreProcessingDescriptorSpecifier initWithIdentifier:version:]([VisionCoreProcessingDescriptorSpecifier alloc], "initWithIdentifier:version:", CFSTR("VisionCoreInferenceNetworkIdentifierSemanticSegmentationV4"), v6);
      v22 = [VisionCoreSemanticSegmentationInferenceNetworkDescriptorV4 alloc];
      objc_msgSend(v19, "allValues");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[VisionCoreInferenceNetworkDescriptor initWithURL:specifier:networkHeadVersions:inputImage:outputs:confidencesOutput:](v22, "initWithURL:specifier:networkHeadVersions:inputImage:outputs:confidencesOutput:", v9, v21, 0, v18, v23, 0);

    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __96__VisionCoreSemanticSegmentationInferenceNetworkDescriptorV4__objectClassIDsToObjectOutputNames__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24E1E60B0;
  v2[1] = &unk_24E1E60C8;
  v3[0] = CFSTR("person:0");
  v3[1] = CFSTR("sky:0");
  v2[2] = &unk_24E1E60E0;
  v2[3] = &unk_24E1E60F8;
  v3[2] = CFSTR("skin:0");
  v3[3] = CFSTR("hair:0");
  v2[4] = &unk_24E1E6110;
  v2[5] = &unk_24E1E6128;
  v3[4] = CFSTR("semantics-estimator/split_channels_1__2");
  v3[5] = CFSTR("teeth:0");
  v2[6] = &unk_24E1E6140;
  v3[6] = CFSTR("glasses:0");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_objectClassIDsToObjectOutputNames_objectClassIDsToObjectClassOutputNames;
  _objectClassIDsToObjectOutputNames_objectClassIDsToObjectClassOutputNames = v0;

}

@end
