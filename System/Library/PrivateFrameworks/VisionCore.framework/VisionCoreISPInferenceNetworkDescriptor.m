@implementation VisionCoreISPInferenceNetworkDescriptor

- (VisionCoreISPInferenceNetworkDescriptor)initWithDescriptor:(id)a3 identifer:(id)a4 error:(id *)a5
{
  VisionCoreISPInferenceNetworkDescriptor *v6;
  uint64_t v7;
  ANSTInferencePostprocessor *anstPostProcessor;
  VisionCoreISPInferenceNetworkDescriptor *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VisionCoreISPInferenceNetworkDescriptor;
  v6 = -[VisionCoreANSTInferenceNetworkDescriptor initWithDescriptor:identifer:](&v11, sel_initWithDescriptor_identifer_, a3, a4);
  v7 = -[ANSTInferenceDescriptor newPostprocessorWithError:](v6->super._descriptor, "newPostprocessorWithError:", a5);
  anstPostProcessor = v6->_anstPostProcessor;
  v6->_anstPostProcessor = (ANSTInferencePostprocessor *)v7;

  if (v6->_anstPostProcessor)
    v9 = v6;
  else
    v9 = 0;

  return v9;
}

- (BOOL)requiresPostProcessing
{
  return 1;
}

- (__CVBuffer)_bufferForDescriptorName:(id)a3 postProcessingOutput:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __CVBuffer *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("$postprocessed$Person")))
  {
    v7 = objc_msgSend(v6, "personImageBuffer");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("$postprocessed$SalientPerson")))
  {
    v7 = objc_msgSend(v6, "salientPersonImageBuffer");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("$postprocessed$Skin")))
  {
    v7 = objc_msgSend(v6, "skinImageBuffer");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("$postprocessed$Hair")))
  {
    v7 = objc_msgSend(v6, "hairImageBuffer");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("$postprocessed$Sky")))
    {
      v8 = 0;
      goto LABEL_12;
    }
    v7 = objc_msgSend(v6, "skyImageBuffer");
  }
  v8 = (__CVBuffer *)v7;
LABEL_12:

  return v8;
}

- (unsigned)_orientationForDescriptorName:(id)a3 postProcessingOutput:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  unsigned int v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("$postprocessed$Person")))
  {
    v7 = objc_msgSend(v6, "personImageBufferOrientation");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("$postprocessed$SalientPerson")))
  {
    v7 = objc_msgSend(v6, "salientPersonImageBufferOrientation");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("$postprocessed$Skin")))
  {
    v7 = objc_msgSend(v6, "skinImageBufferOrientation");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("$postprocessed$Hair")))
  {
    v7 = objc_msgSend(v6, "hairImageBufferOrientation");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("$postprocessed$Sky")))
    {
      v8 = 0;
      goto LABEL_12;
    }
    v7 = objc_msgSend(v6, "skyImageBufferOrientation");
  }
  v8 = v7;
LABEL_12:

  return v8;
}

- (BOOL)performPostProcessingForInput:(id)a3 postProcessingOutput:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  ANSTInferencePostprocessor *v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __CVBuffer *v23;
  uint64_t v24;
  void *v25;
  int v26;
  int v27;
  id v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  VisionCoreISPInferenceNetworkObject *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  VisionCoreISPInferenceNetworkHandObject *v43;
  BOOL v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v55 = v8;
  v56 = a4;
  if (self->_anstPostProcessor)
  {
    v9 = objc_msgSend(v8, "inputImageBuffer");
    -[ANSTInferenceDescriptor inputPixelBufferDescriptorNamed:](self->super._descriptor, "inputPixelBufferDescriptorNamed:", CFSTR("input_image"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[VisionCoreANSTInferenceNetworkDescriptor _anstPixelBufferRepresentation:pixelBufferRepresentation:orientation:error:](self, "_anstPixelBufferRepresentation:pixelBufferRepresentation:orientation:error:", v52, v9, objc_msgSend(v55, "inputImageOrientation"), a5);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ANSTInferencePostprocessor setInputPixelBuffer:forInferenceInputDescriptor:withError:](self->_anstPostProcessor, "setInputPixelBuffer:forInferenceInputDescriptor:withError:", v51, v52, a5))
    {
      -[ANSTInferenceDescriptor allOutputTensorDescriptors](self->super._descriptor, "allOutputTensorDescriptors");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "inferenceOutputNamedObjects");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v50, "count");
      if (v10 == objc_msgSend(v53, "count"))
      {
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        obj = v50;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v70;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v70 != v12)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
              objc_msgSend(v14, "name");
              v15 = (ANSTInferencePostprocessor *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "dataForName:error:", v15, a5);
              v16 = (id)objc_claimAutoreleasedReturnValue();
              if (!v16)
              {
                if (a5)
                {
                  v48 = (void *)MEMORY[0x24BDD1540];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("missing %@ object"), v15);
                  v28 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v28);
                  v16 = 0;
                  v44 = 0;
                  *a5 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_55;
                }
                v16 = 0;
LABEL_57:
                v44 = 0;
                goto LABEL_58;
              }
              -[VisionCoreANSTInferenceNetworkDescriptor _anstTensorDataRepresentation:data:error:](self, "_anstTensorDataRepresentation:data:error:", v14, v16, a5);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[ANSTInferencePostprocessor setInputTensorData:forInferenceOutputDescriptor:withError:](self->_anstPostProcessor, "setInputTensorData:forInferenceOutputDescriptor:withError:", v17, v14, a5);

              if (!v18)
                goto LABEL_57;

            }
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
            if (v11)
              continue;
            break;
          }
        }

      }
      -[ANSTInferencePostprocessor processedOutputPixelBufferDescriptors](self->_anstPostProcessor, "processedOutputPixelBufferDescriptors");
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v66;
        while (2)
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v66 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
            objc_msgSend(v22, "name");
            v16 = (id)objc_claimAutoreleasedReturnValue();
            v23 = -[VisionCoreISPInferenceNetworkDescriptor _bufferForDescriptorName:postProcessingOutput:](self, "_bufferForDescriptorName:postProcessingOutput:", v16, v56);
            v24 = -[VisionCoreISPInferenceNetworkDescriptor _orientationForDescriptorName:postProcessingOutput:](self, "_orientationForDescriptorName:postProcessingOutput:", v16, v56);
            if (!v23)
            {
              if (a5)
              {
                v47 = (void *)MEMORY[0x24BDD1540];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("missing %@ object"), v16);
                v28 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v28);
                v44 = 0;
                *a5 = (id)objc_claimAutoreleasedReturnValue();
                v15 = (ANSTInferencePostprocessor *)obj;
                goto LABEL_55;
              }
LABEL_51:
              v44 = 0;
              v15 = (ANSTInferencePostprocessor *)obj;
              goto LABEL_58;
            }
            -[VisionCoreANSTInferenceNetworkDescriptor _anstPixelBufferRepresentation:pixelBufferRepresentation:orientation:error:](self, "_anstPixelBufferRepresentation:pixelBufferRepresentation:orientation:error:", v22, v23, v24, a5);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[ANSTInferencePostprocessor setOutputPixelBuffer:forProcessedOutputDescriptor:withError:](self->_anstPostProcessor, "setOutputPixelBuffer:forProcessedOutputDescriptor:withError:", v25, v22, a5);

            if (!v26)
              goto LABEL_51;

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
          if (v19)
            continue;
          break;
        }
      }

      v27 = -[ANSTInferencePostprocessor processWithError:](self->_anstPostProcessor, "processWithError:", a5);
      v15 = self->_anstPostProcessor;
      v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (v27)
      {
        v73 = 0;
        v74 = &v73;
        v75 = 0x2020000000;
        v29 = (_QWORD *)getANSTObjectCategoryHandSymbolLoc_ptr;
        v76 = getANSTObjectCategoryHandSymbolLoc_ptr;
        if (!getANSTObjectCategoryHandSymbolLoc_ptr)
        {
          v30 = (void *)ANSTKitLibrary();
          v29 = dlsym(v30, "ANSTObjectCategoryHand");
          v74[3] = (uint64_t)v29;
          getANSTObjectCategoryHandSymbolLoc_ptr = (uint64_t)v29;
        }
        _Block_object_dispose(&v73, 8);
        if (!v29)
          goto LABEL_61;
        -[ANSTInferencePostprocessor trackedObjectsOfCategory:](v15, "trackedObjectsOfCategory:", *v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0;
        v74 = &v73;
        v75 = 0x2020000000;
        v32 = (_QWORD *)getANSTObjectCategoryFullBodySymbolLoc_ptr;
        v76 = getANSTObjectCategoryFullBodySymbolLoc_ptr;
        if (!getANSTObjectCategoryFullBodySymbolLoc_ptr)
        {
          v33 = (void *)ANSTKitLibrary();
          v32 = dlsym(v33, "ANSTObjectCategoryFullBody");
          v74[3] = (uint64_t)v32;
          getANSTObjectCategoryFullBodySymbolLoc_ptr = (uint64_t)v32;
        }
        _Block_object_dispose(&v73, 8);
        if (!v32)
        {
LABEL_61:
          dlerror();
          abort_report_np();
          __break(1u);
        }
        -[ANSTInferencePostprocessor trackedObjectsOfCategory:](v15, "trackedObjectsOfCategory:", *v32);
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v34 = (id)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
        if (v35)
        {
          v36 = *(_QWORD *)v62;
          do
          {
            for (k = 0; k != v35; ++k)
            {
              if (*(_QWORD *)v62 != v36)
                objc_enumerationMutation(v34);
              v38 = -[VisionCoreISPInferenceNetworkObject initWithANSTObject:]([VisionCoreISPInferenceNetworkObject alloc], "initWithANSTObject:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k));
              objc_msgSend(v16, "addObject:", v38);

            }
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
          }
          while (v35);
        }

        objc_msgSend(v56, "setFullBodyResults:", v16);
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v39 = v31;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
        if (v40)
        {
          v41 = *(_QWORD *)v58;
          do
          {
            for (m = 0; m != v40; ++m)
            {
              if (*(_QWORD *)v58 != v41)
                objc_enumerationMutation(v39);
              v43 = -[VisionCoreISPInferenceNetworkHandObject initWithANSTHand:]([VisionCoreISPInferenceNetworkHandObject alloc], "initWithANSTHand:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * m));
              objc_msgSend(v28, "addObject:", v43);

            }
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
          }
          while (v40);
        }

        objc_msgSend(v56, "setHands:", v28);
        v44 = 1;
      }
      else
      {
        v44 = 0;
      }
LABEL_55:

LABEL_58:
    }
    else
    {
      v44 = 0;
    }

  }
  else
  {
    if (a5)
    {
      v45 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_anstPostProcessor instance nil"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "VisionCoreErrorForInternalErrorWithLocalizedDescription:", v46);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v44 = 0;
  }

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anstPostProcessor, 0);
}

+ (id)_configurationForIdentifer:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)getANSTISPInferenceConfigurationClass_softClass;
  v14 = getANSTISPInferenceConfigurationClass_softClass;
  if (!getANSTISPInferenceConfigurationClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getANSTISPInferenceConfigurationClass_block_invoke;
    v10[3] = &unk_24E1DBC38;
    v10[4] = &v11;
    __getANSTISPInferenceConfigurationClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v5, "defaultConfigurationForVersion:withError:", 0x10000, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isEqualToString:", CFSTR("VisionCoreISPInferenceNetworkIdentifier512x384"));
  v8 = 0;
  if ((v7 & 1) != 0)
    goto LABEL_6;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("VisionCoreISPInferenceNetworkIdentifier512x384")))
  {
    v8 = 1;
LABEL_6:
    objc_msgSend(v6, "setResolution:", v8);
  }

  return v6;
}

+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  VisionCoreISPInferenceNetworkDescriptor *v9;

  v6 = a3;
  +[VisionCoreISPInferenceNetworkDescriptor _configurationForIdentifer:](VisionCoreISPInferenceNetworkDescriptor, "_configurationForIdentifer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getANSTISPInferenceDescriptorClass(), "descriptorWithConfiguration:error:", v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = -[VisionCoreISPInferenceNetworkDescriptor initWithDescriptor:identifer:error:]([VisionCoreISPInferenceNetworkDescriptor alloc], "initWithDescriptor:identifer:error:", v8, v6, a5);
  else
    v9 = 0;

  return v9;
}

+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 objectTrackingEnabled:(BOOL)a5 segmentationEnabled:(BOOL)a6 lowFrameRate:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  id v12;
  void *v13;
  void *v14;
  VisionCoreISPInferenceNetworkDescriptor *v15;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  +[VisionCoreISPInferenceNetworkDescriptor _configurationForIdentifer:](VisionCoreISPInferenceNetworkDescriptor, "_configurationForIdentifer:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObjectTrackingEnabled:", v11);
  objc_msgSend(v13, "setSegmentationEnabled:", v10);
  if (v9)
    objc_msgSend(v13, "setFrameRate:", 1);
  objc_msgSend(getANSTISPInferenceDescriptorClass(), "descriptorWithConfiguration:error:", v13, a8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = -[VisionCoreISPInferenceNetworkDescriptor initWithDescriptor:identifer:error:]([VisionCoreISPInferenceNetworkDescriptor alloc], "initWithDescriptor:identifer:error:", v14, v12, a8);
  else
    v15 = 0;

  return v15;
}

@end
