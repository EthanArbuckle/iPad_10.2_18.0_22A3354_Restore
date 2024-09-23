@implementation VisionCoreANSTInferenceNetworkDescriptor

- (VisionCoreANSTInferenceNetworkDescriptor)initWithDescriptor:(id)a3 identifer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  VisionCoreImageTensorDescriptor *v18;
  VisionCoreResourceVersion *v19;
  VisionCoreProcessingDescriptorSpecifier *v20;
  VisionCoreProcessingDescriptorSpecifier *v21;
  VisionCoreANSTInferenceNetworkDescriptor *v22;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)&self->_descriptor, a3);
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "assetURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  VisionCoreTensorDescriptorsFromANSTDescriptors(v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "outputDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  VisionCoreTensorDescriptorsFromANSTDescriptors(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allInputPixelBufferDescriptors");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = -[VisionCoreImageTensorDescriptor initWithANSTPixelBufferDescriptor:]([VisionCoreImageTensorDescriptor alloc], "initWithANSTPixelBufferDescriptor:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17));
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  v19 = -[VisionCoreResourceVersion initWithMajor:]([VisionCoreResourceVersion alloc], "initWithMajor:", 1);
  v20 = [VisionCoreProcessingDescriptorSpecifier alloc];

  v21 = -[VisionCoreProcessingDescriptorSpecifier initWithIdentifier:version:](v20, "initWithIdentifier:version:", v7, v19);
  v22 = -[VisionCoreInferenceNetworkDescriptor initWithURL:specifier:networkHeadVersions:inputs:outputs:inputImages:confidencesOutput:](self, "initWithURL:specifier:networkHeadVersions:inputs:outputs:inputImages:confidencesOutput:", v26, v21, 0, v24, v10, v12, 0);

  return v22;
}

- (id)URL
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VisionCoreANSTInferenceNetworkDescriptor;
  -[VisionCoreInferenceNetworkDescriptor URL](&v9, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("file://"));

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v2, "VisionCoreFileSystemPathAndReturnError:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v2;
  }

  return v7;
}

- (BOOL)requiresPostProcessing
{
  return 0;
}

- (id)_outputDescriptorWithName:(id)a3 postProcessor:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "processedOutputDescriptors");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "name", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_anstTensorDataRepresentation:(id)a3 data:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "sizeInBytes");
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v10 = (void *)getANSTTensorDataClass_softClass;
  v20 = getANSTTensorDataClass_softClass;
  if (!getANSTTensorDataClass_softClass)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __getANSTTensorDataClass_block_invoke;
    v16[3] = &unk_24E1DBC38;
    v16[4] = &v17;
    __getANSTTensorDataClass_block_invoke((uint64_t)v16);
    v10 = (void *)v18[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v17, 8);
  v12 = [v11 alloc];
  v13 = objc_retainAutorelease(v8);
  v14 = (void *)objc_msgSend(v12, "initWithDescriptor:dataPointer:length:deallocator:error:", v7, objc_msgSend(v13, "bytes"), v9, 0, a5);

  return v14;
}

- (id)_anstPixelBufferRepresentation:(id)a3 pixelBufferRepresentation:(__CVBuffer *)a4 orientation:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = *(_QWORD *)&a5;
  v9 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v10 = (void *)getANSTPixelBufferClass_softClass;
  v18 = getANSTPixelBufferClass_softClass;
  if (!getANSTPixelBufferClass_softClass)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getANSTPixelBufferClass_block_invoke;
    v14[3] = &unk_24E1DBC38;
    v14[4] = &v15;
    __getANSTPixelBufferClass_block_invoke((uint64_t)v14);
    v10 = (void *)v16[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v15, 8);
  v12 = (void *)objc_msgSend([v11 alloc], "initWithDescriptor:pixelBuffer:orientation:error:", v9, a4, v7, a6);

  return v12;
}

- (id)postProcessingOutputDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)-[ANSTInferenceDescriptor newPostprocessorWithError:](self->_descriptor, "newPostprocessorWithError:", 0);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "processedOutputDescriptors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    VisionCoreTensorDescriptorsFromANSTDescriptors(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5
{
  return objc_alloc_init(VisionCoreProcessingDescriptor);
}

@end
