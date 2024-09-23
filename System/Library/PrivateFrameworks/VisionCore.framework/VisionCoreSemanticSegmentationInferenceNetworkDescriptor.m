@implementation VisionCoreSemanticSegmentationInferenceNetworkDescriptor

- (id)objectMaskDescriptorsForObjectClassIDs:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  +[VisionCoreSemanticSegmentationInferenceNetworkDescriptor objectClassOutputNamesForObjectClassIDs:error:](VisionCoreSemanticSegmentationInferenceNetworkDescriptor, "objectClassOutputNamesForObjectClassIDs:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreSemanticSegmentationInferenceNetworkDescriptor objectMaskDescriptorsForObjectClassNames:error:](self, "objectMaskDescriptorsForObjectClassNames:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)objectMaskDescriptorsForObjectClassNames:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
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
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[VisionCoreInferenceNetworkDescriptor outputs](self, "outputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (a4 && !v15)
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Descriptor with name %@ doesn't exist"), v14);
          objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v17);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v7, "addObject:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreSemanticSegmentationInferenceNetworkDescriptor *v4;
  BOOL v5;
  objc_super v7;

  v4 = (VisionCoreSemanticSegmentationInferenceNetworkDescriptor *)a3;
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
      v7.super_class = (Class)VisionCoreSemanticSegmentationInferenceNetworkDescriptor;
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
  void *v6;
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
  +[VisionCoreSemanticSegmentationInferenceNetworkDescriptor _objectClassIDsToObjectOutputNames]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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

+ (id)objectClassIDsToObjectClassesDetectionStatusIndexes:(unint64_t)a3 error:(id *)a4
{
  void *v6;
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
  +[VisionCoreSemanticSegmentationInferenceNetworkDescriptor _objectClassIDsToObjectClassesDetectionStatusIndexes]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
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
          objc_msgSend(v7, "setObject:forKey:", v14, v13);

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

+ (id)objectClassNamesToObjectClassesDetectionStatusIndexes:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[VisionCoreSemanticSegmentationInferenceNetworkDescriptor _objectClassIDsToObjectOutputNames]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VisionCoreSemanticSegmentationInferenceNetworkDescriptor _objectClassIDsToObjectClassesDetectionStatusIndexes]();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    while (2)
    {
      v11 = v7;
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v11);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v5, "allKeysForObject:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (!v14 || objc_msgSend(v14, "count") != 1)
        {
          v7 = v11;
          if (a4)
          {
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unexpected object class name %@ or unexpected number of class IDs (%@)"), v13, v15);
            objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v19);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v18 = 0;
          goto LABEL_14;
        }
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v17, v13);

      }
      v7 = v11;
      v9 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
        continue;
      break;
    }
  }

  v18 = (void *)objc_msgSend(v6, "copy");
LABEL_14:

  return v18;
}

+ (id)semanticSegmentationV6AndReturnError:(id *)a3
{
  VisionCoreResourceVersion *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  VisionCoreE5RTProgramLibraryCompilationOptions *v12;
  void *v13;

  v4 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 1, 0, 0);
  v5 = CFSTR("camalgoseg.flows.lowres-s2h6ysbnuy_82500.bundle/camalgoseg.flows.lowres-s2h6ysbnuy_82500.mil");
  objc_opt_self();
  objc_msgSend(CFSTR("camalgoseg.flows.lowres-s2h6ysbnuy_82500.bundle/camalgoseg.flows.lowres-s2h6ysbnuy_82500.mil"), "stringByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VisionCoreEspressoUtils URLForResourceFileNamed:error:](VisionCoreEspressoUtils, "URLForResourceFileNamed:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || !+[VisionCoreE5RTProgramLibrary isProgramLibraryAtURL:](VisionCoreE5RTProgramLibrary, "isProgramLibraryAtURL:", v7)|| (+[VisionCoreE5RTProgramLibrary programLibraryForURL:error:](VisionCoreE5RTProgramLibrary, "programLibraryForURL:error:", v7, a3), (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[VisionCoreEspressoUtils URLForResourceFileNamed:error:](VisionCoreEspressoUtils, "URLForResourceFileNamed:error:", CFSTR("camalgoseg.flows.lowres-s2h6ysbnuy_82500.bundle/camalgoseg.flows.lowres-s2h6ysbnuy_82500.mil"), a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9
      || !+[VisionCoreE5RTModelSource isModelSourceURL:](VisionCoreE5RTModelSource, "isModelSourceURL:", v9)|| (+[VisionCoreE5RTModelSource modelSourceFromURL:error:](VisionCoreE5RTModelSource, "modelSourceFromURL:error:", v9, a3), (v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v13 = 0;
      goto LABEL_10;
    }
    v11 = (void *)v10;
    v12 = objc_alloc_init(VisionCoreE5RTProgramLibraryCompilationOptions);
    +[VisionCoreE5RTProgramLibrary compileModelSource:options:error:](VisionCoreE5RTProgramLibrary, "compileModelSource:options:error:", v11, v12, a3);
    v8 = objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v13 = 0;
      goto LABEL_11;
    }
  }
  +[VisionCoreE5RTInferenceFunctionDescriptor descriptorForProgramLibrary:functionName:inputImageName:outputNames:confidencesOutputName:labelsFileName:error:](VisionCoreSemanticSegmentationInferenceNetworkDescriptor, "descriptorForProgramLibrary:functionName:inputImageName:outputNames:confidencesOutputName:labelsFileName:error:", v8, CFSTR("main"), CFSTR("image"), &unk_24E1E6538, 0, 0, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
LABEL_10:

LABEL_11:
  return v13;
}

+ (id)_objectClassIDsToObjectOutputNames
{
  objc_opt_self();
  if (_objectClassIDsToObjectOutputNames_onceToken_1757 != -1)
    dispatch_once(&_objectClassIDsToObjectOutputNames_onceToken_1757, &__block_literal_global_1758);
  return (id)_objectClassIDsToObjectOutputNames_objectClassIDsToObjectClassOutputNames_1759;
}

+ (id)_objectClassIDsToObjectClassesDetectionStatusIndexes
{
  objc_opt_self();
  if (_objectClassIDsToObjectClassesDetectionStatusIndexes_onceToken != -1)
    dispatch_once(&_objectClassIDsToObjectClassesDetectionStatusIndexes_onceToken, &__block_literal_global_48);
  return (id)_objectClassIDsToObjectClassesDetectionStatusIndexes_objectClassIDsToObjectClassesDetectionStatusIndexes;
}

void __112__VisionCoreSemanticSegmentationInferenceNetworkDescriptor__objectClassIDsToObjectClassesDetectionStatusIndexes__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24E1E6188;
  v2[1] = &unk_24E1E61A0;
  v3[0] = &unk_24E1E62C0;
  v3[1] = &unk_24E1E62D8;
  v2[2] = &unk_24E1E6278;
  v2[3] = &unk_24E1E6260;
  v3[2] = &unk_24E1E62F0;
  v3[3] = &unk_24E1E6308;
  v2[4] = &unk_24E1E6230;
  v2[5] = &unk_24E1E6248;
  v3[4] = &unk_24E1E6320;
  v3[5] = &unk_24E1E6338;
  v2[6] = &unk_24E1E61D0;
  v2[7] = &unk_24E1E61E8;
  v3[6] = &unk_24E1E6350;
  v3[7] = &unk_24E1E6368;
  v2[8] = &unk_24E1E61B8;
  v2[9] = &unk_24E1E6200;
  v3[8] = &unk_24E1E6380;
  v3[9] = &unk_24E1E6398;
  v2[10] = &unk_24E1E6218;
  v2[11] = &unk_24E1E6290;
  v3[10] = &unk_24E1E63B0;
  v3[11] = &unk_24E1E63C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_objectClassIDsToObjectClassesDetectionStatusIndexes_objectClassIDsToObjectClassesDetectionStatusIndexes;
  _objectClassIDsToObjectClassesDetectionStatusIndexes_objectClassIDsToObjectClassesDetectionStatusIndexes = v0;

}

void __94__VisionCoreSemanticSegmentationInferenceNetworkDescriptor__objectClassIDsToObjectOutputNames__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[13];
  _QWORD v3[14];

  v3[13] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24E1E6188;
  v2[1] = &unk_24E1E61A0;
  v3[0] = CFSTR("person");
  v3[1] = CFSTR("sky");
  v2[2] = &unk_24E1E61B8;
  v2[3] = &unk_24E1E61D0;
  v3[2] = CFSTR("skin");
  v3[3] = CFSTR("hair");
  v2[4] = &unk_24E1E61E8;
  v2[5] = &unk_24E1E6200;
  v3[4] = CFSTR("beard");
  v3[5] = CFSTR("teeth");
  v2[6] = &unk_24E1E6218;
  v2[7] = &unk_24E1E6230;
  v3[6] = CFSTR("glasses");
  v3[7] = CFSTR("cat");
  v2[8] = &unk_24E1E6248;
  v2[9] = &unk_24E1E6260;
  v3[8] = CFSTR("dog");
  v3[9] = CFSTR("water");
  v2[10] = &unk_24E1E6278;
  v2[11] = &unk_24E1E6290;
  v3[10] = CFSTR("foliage");
  v3[11] = CFSTR("handheld_object");
  v2[12] = &unk_24E1E62A8;
  v3[12] = CFSTR("class_area");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_objectClassIDsToObjectOutputNames_objectClassIDsToObjectClassOutputNames_1759;
  _objectClassIDsToObjectOutputNames_objectClassIDsToObjectClassOutputNames_1759 = v0;

}

@end
