@implementation VisionCoreVideoSegmentationInferenceNetworkDescriptor

- (BOOL)requiresPostProcessing
{
  void *v2;
  void *v3;
  int v4;

  -[VisionCoreProcessingDescriptor specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier512x384")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier576x320")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier384x512")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier320x576")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier384x512")) & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier320x576")) ^ 1;
  }

  return v4;
}

- (BOOL)postProcessRegularFrameForInferenceOutputMattingBuffer:(id)a3 postProcessingOutputMaskImageBuffer:(__CVBuffer *)a4 postProcessingOutputMaskImageOrientation:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v21;
  char v22;
  id v23;
  void *v24;
  void *v25;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  CVPixelBufferRetain(a4);
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384")) & 1) != 0)goto LABEL_6;
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320")) & 1) != 0)
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier320x576")))
  {

    goto LABEL_5;
  }
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier384x512"));

  if ((v22 & 1) == 0)
  {
    v23 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[VisionCoreProcessingDescriptor identifier](self, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("Requires regular frame network configuration. %@ was specified"), v24);

    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidOperationWithLocalizedDescription:", v25);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    goto LABEL_18;
  }
LABEL_7:
  v14 = (void *)-[ANSTInferenceDescriptor newPostprocessorWithError:](self->super._descriptor, "newPostprocessorWithError:", a6);
  if (v14)
  {
    -[ANSTInferenceDescriptor outputTensorDescriptorNamed:](self->super._descriptor, "outputTensorDescriptorNamed:", CFSTR("output_matting"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VisionCoreANSTInferenceNetworkDescriptor _anstTensorDataRepresentation:data:error:](self, "_anstTensorDataRepresentation:data:error:", v15, v10, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      && !objc_msgSend(v14, "setInputTensorData:forInferenceOutputDescriptor:withError:", v16, v15, a6))
    {
      v19 = 0;
    }
    else
    {
      -[VisionCoreANSTInferenceNetworkDescriptor _outputDescriptorWithName:postProcessor:](self, "_outputDescriptorWithName:postProcessor:", CFSTR("output_mask"), v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreANSTInferenceNetworkDescriptor _anstPixelBufferRepresentation:pixelBufferRepresentation:orientation:error:](self, "_anstPixelBufferRepresentation:pixelBufferRepresentation:orientation:error:", v17, a4, v7, a6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "setOutputPixelBuffer:forProcessedOutputDescriptor:withError:", v18, v17, a6) & 1) != 0)
        v19 = objc_msgSend(v14, "processWithError:", a6);
      else
        v19 = 0;

    }
  }
  else
  {
    v19 = 0;
  }

LABEL_18:
  CVPixelBufferRelease(a4);

  return v19;
}

- (BOOL)postProcessUpdateFrameForInferenceOutputKey:(id)a3 inferenceOutputValue:(id)a4 inferenceOutputMatting:(id)a5 postProcessingOutputKey:(id)a6 postProcessingOutputValue:(id)a7 postProcessingOutputMaskImageBuffer:(__CVBuffer *)a8 postProcessingOutputMaskOrientation:(unsigned int)a9 error:(id *)a10
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  CVPixelBufferRef texture;
  id v49;

  v16 = a3;
  v17 = a4;
  v49 = a5;
  v47 = a6;
  v46 = a7;
  texture = a8;
  CVPixelBufferRetain(a8);
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384")) & 1) != 0)goto LABEL_6;
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320")) & 1) != 0)
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier320x576")))
  {

    goto LABEL_5;
  }
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier384x512"));

  if ((v33 & 1) == 0)
  {
    v34 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[VisionCoreProcessingDescriptor identifier](self, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("Requires update frame network configuration. %@ was specified"), v35);

    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidOperationWithLocalizedDescription:", v36);
    *a10 = (id)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    goto LABEL_28;
  }
LABEL_7:
  v21 = (void *)-[ANSTInferenceDescriptor newPostprocessorWithError:](self->super._descriptor, "newPostprocessorWithError:", a10);
  if (v21)
  {
    v44 = v17;
    v45 = v16;
    -[ANSTInferenceDescriptor outputTensorDescriptorNamed:](self->super._descriptor, "outputTensorDescriptorNamed:", CFSTR("key"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VisionCoreANSTInferenceNetworkDescriptor _anstTensorDataRepresentation:data:error:](self, "_anstTensorDataRepresentation:data:error:", v22, v16, a10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23
      && !objc_msgSend(v21, "setInputTensorData:forInferenceOutputDescriptor:withError:", v23, v22, a10))
    {
      v31 = 0;
    }
    else
    {
      -[ANSTInferenceDescriptor outputTensorDescriptorNamed:](self->super._descriptor, "outputTensorDescriptorNamed:", CFSTR("value"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreANSTInferenceNetworkDescriptor _anstTensorDataRepresentation:data:error:](self, "_anstTensorDataRepresentation:data:error:", v43, v44, a10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24
        && !objc_msgSend(v21, "setInputTensorData:forInferenceOutputDescriptor:withError:", v24, v43, a10))
      {
        v31 = 0;
      }
      else
      {
        -[ANSTInferenceDescriptor outputTensorDescriptorNamed:](self->super._descriptor, "outputTensorDescriptorNamed:", CFSTR("output_matting"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[VisionCoreANSTInferenceNetworkDescriptor _anstTensorDataRepresentation:data:error:](self, "_anstTensorDataRepresentation:data:error:", v42, v49, a10);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41
          && !objc_msgSend(v21, "setInputTensorData:forInferenceOutputDescriptor:withError:", v41, v42, a10))
        {
          v31 = 0;
        }
        else
        {
          -[VisionCoreANSTInferenceNetworkDescriptor _outputDescriptorWithName:postProcessor:](self, "_outputDescriptorWithName:postProcessor:", CFSTR("output_mask"), v21);
          v25 = objc_claimAutoreleasedReturnValue();
          -[VisionCoreANSTInferenceNetworkDescriptor _anstPixelBufferRepresentation:pixelBufferRepresentation:orientation:error:](self, "_anstPixelBufferRepresentation:pixelBufferRepresentation:orientation:error:", v25, texture, a9, a10);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)v25;
          v40 = objc_msgSend(v21, "setOutputPixelBuffer:forProcessedOutputDescriptor:withError:", v38, v25, a10);
          -[VisionCoreANSTInferenceNetworkDescriptor _outputDescriptorWithName:postProcessor:](self, "_outputDescriptorWithName:postProcessor:", CFSTR("key"), v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[VisionCoreANSTInferenceNetworkDescriptor _anstTensorDataRepresentation:data:error:](self, "_anstTensorDataRepresentation:data:error:", v26, v47, a10);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v21, "setOutputTensorData:forProcessedOutputDescriptor:withError:", v27, v26, a10);
          -[VisionCoreANSTInferenceNetworkDescriptor _outputDescriptorWithName:postProcessor:](self, "_outputDescriptorWithName:postProcessor:", CFSTR("value"), v21);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[VisionCoreANSTInferenceNetworkDescriptor _anstTensorDataRepresentation:data:error:](self, "_anstTensorDataRepresentation:data:error:", v29, v46, a10);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v40 & objc_msgSend(v21, "setOutputTensorData:forProcessedOutputDescriptor:withError:", v30, v29, a10) & v28 & 1) != 0)v31 = objc_msgSend(v21, "processWithError:", a10);
          else
            v31 = 0;

        }
      }

    }
    v17 = v44;
    v16 = v45;
  }
  else
  {
    v31 = 0;
  }

LABEL_28:
  CVPixelBufferRelease(texture);

  return v31;
}

- (BOOL)postProcessUpdateFrameForInferenceOutputKey:(id)a3 inferenceOutputValue:(id)a4 postProcessingOutputKey:(id)a5 postProcessingOutputValue:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  int v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  char v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384")) & 1) != 0)goto LABEL_6;
  v17 = v14;
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320")) & 1) != 0)
  {
LABEL_5:

    v14 = v17;
LABEL_6:

    goto LABEL_7;
  }
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier320x576")))
  {

    goto LABEL_5;
  }
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v31 = v15;
  v32 = v12;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v33, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier384x512"));

  v12 = v32;
  v15 = v31;

  v14 = v17;
  if ((v43 & 1) != 0)
  {
LABEL_7:
    v20 = (void *)-[ANSTInferenceDescriptor newPostprocessorWithError:](self->super._descriptor, "newPostprocessorWithError:", a7);
    if (v20)
    {
      v42 = v15;
      -[ANSTInferenceDescriptor outputTensorDescriptorNamed:](self->super._descriptor, "outputTensorDescriptorNamed:", CFSTR("key"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreANSTInferenceNetworkDescriptor _anstTensorDataRepresentation:data:error:](self, "_anstTensorDataRepresentation:data:error:", v21, v12, a7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22
        && !objc_msgSend(v20, "setInputTensorData:forInferenceOutputDescriptor:withError:", v22, v21, a7))
      {
        v30 = 0;
      }
      else
      {
        -[ANSTInferenceDescriptor outputTensorDescriptorNamed:](self->super._descriptor, "outputTensorDescriptorNamed:", CFSTR("value"));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v13;
        v25 = (void *)v23;
        v41 = v24;
        -[VisionCoreANSTInferenceNetworkDescriptor _anstTensorDataRepresentation:data:error:](self, "_anstTensorDataRepresentation:data:error:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26
          && !objc_msgSend(v20, "setInputTensorData:forInferenceOutputDescriptor:withError:", v26, v25, a7))
        {
          v30 = 0;
        }
        else
        {
          v40 = v12;
          -[VisionCoreANSTInferenceNetworkDescriptor _outputDescriptorWithName:postProcessor:](self, "_outputDescriptorWithName:postProcessor:", CFSTR("key"), v20);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v14;
          -[VisionCoreANSTInferenceNetworkDescriptor _anstTensorDataRepresentation:data:error:](self, "_anstTensorDataRepresentation:data:error:", v27, v14, a7);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v20, "setOutputTensorData:forProcessedOutputDescriptor:withError:");
          -[VisionCoreANSTInferenceNetworkDescriptor _outputDescriptorWithName:postProcessor:](self, "_outputDescriptorWithName:postProcessor:", CFSTR("value"), v20);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[VisionCoreANSTInferenceNetworkDescriptor _anstTensorDataRepresentation:data:error:](self, "_anstTensorDataRepresentation:data:error:", v28, v42, a7);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          if (objc_msgSend(v20, "setOutputTensorData:forProcessedOutputDescriptor:withError:", v29, v28, a7)&& v37)
          {
            v30 = objc_msgSend(v20, "processWithError:", a7);
          }

          v14 = v39;
          v12 = v40;
        }

        v13 = v41;
      }

      v15 = v42;
    }
    else
    {
      v30 = 0;
    }
    goto LABEL_24;
  }
  if (!a7)
  {
    v30 = 0;
    goto LABEL_25;
  }
  v34 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[VisionCoreProcessingDescriptor identifier](self, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("Requires update frame network configuration. %@ was specified"), v35);

  v14 = v17;
  objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidOperationWithLocalizedDescription:", v20);
  v30 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

LABEL_25:
  return v30;
}

+ (id)_configurationForIdentifer:(id)a3 version:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "major");
  v8 = objc_msgSend(v6, "major");

  if (((objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier512x384")) & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384")) & 1) != 0|| objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384")))&& v7 == 1)
  {
    v9 = objc_alloc((Class)getANSTViSegHQInferenceConfigurationClass());
    v10 = 0x10000;
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  if (((objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier576x320")) & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320")) & 1) != 0|| objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320")))&& v7 == 1)
  {
    v9 = objc_alloc((Class)getANSTViSegHQInferenceConfigurationClass());
    v10 = 0x10000;
LABEL_11:
    v11 = 1;
LABEL_18:
    v12 = (void *)objc_msgSend(v9, "initWithVersion:resolution:", v10, v11);
    goto LABEL_19;
  }
  if (((objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier512x384")) & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384")) & 1) != 0|| objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384")))&& v8 == 2)
  {
    v9 = objc_alloc((Class)getANSTViSegHQInferenceConfigurationClass());
    v10 = 0x20000;
    goto LABEL_17;
  }
  if (((objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier576x320")) & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320")) & 1) != 0|| objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320")))&& v8 == 2)
  {
    v9 = objc_alloc((Class)getANSTViSegHQInferenceConfigurationClass());
    v10 = 0x20000;
    goto LABEL_11;
  }
  if (((objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier384x512")) & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier384x512")) & 1) != 0|| objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier384x512")))&& v8 == 2)
  {
    v9 = objc_alloc((Class)getANSTViSegHQInferenceConfigurationClass());
    v10 = 0x20000;
    v11 = 2;
    goto LABEL_18;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier320x576")) & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier320x576")) & 1) != 0)
  {
    if (v8 != 2)
    {
      v12 = 0;
      goto LABEL_19;
    }
    goto LABEL_36;
  }
  v12 = 0;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier320x576"))&& v8 == 2)
  {
LABEL_36:
    v9 = objc_alloc((Class)getANSTViSegHQInferenceConfigurationClass());
    v10 = 0x20000;
    v11 = 3;
    goto LABEL_18;
  }
LABEL_19:

  return v12;
}

+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  VisionCoreVideoSegmentationInferenceNetworkDescriptor *v18;
  id ANSTViSegHQRegularFrameInferenceDescriptorClass;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "major") != 1)
  {
    objc_msgSend(a1, "supportedIdentifersForVersion:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v8);

    if ((v12 & 1) == 0)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", CFSTR("network identifier not supported by the specified version"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
LABEL_17:
      v18 = 0;
      goto LABEL_33;
    }
    +[VisionCoreVideoSegmentationInferenceNetworkDescriptor _configurationForIdentifer:version:](VisionCoreVideoSegmentationInferenceNetworkDescriptor, "_configurationForIdentifer:version:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier512x384")) & 1) != 0|| (objc_msgSend(v8, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier576x320")) & 1) != 0|| (objc_msgSend(v8, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier384x512")) & 1) != 0|| objc_msgSend(v8, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier320x576")))
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x2050000000;
      v14 = (void *)getANSTViSegHQInitialFrameInferenceDescriptorClass_softClass;
      v25 = getANSTViSegHQInitialFrameInferenceDescriptorClass_softClass;
      if (!getANSTViSegHQInitialFrameInferenceDescriptorClass_softClass)
      {
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __getANSTViSegHQInitialFrameInferenceDescriptorClass_block_invoke;
        v21[3] = &unk_24E1DBC38;
        v21[4] = &v22;
        __getANSTViSegHQInitialFrameInferenceDescriptorClass_block_invoke((uint64_t)v21);
        v14 = (void *)v23[3];
      }
      v15 = objc_retainAutorelease(v14);
      _Block_object_dispose(&v22, 8);
    }
    else
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384")) & 1) != 0|| (objc_msgSend(v8, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320")) & 1) != 0|| (objc_msgSend(v8, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier384x512")) & 1) != 0|| objc_msgSend(v8, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier320x576")))
      {
        ANSTViSegHQRegularFrameInferenceDescriptorClass = getANSTViSegHQRegularFrameInferenceDescriptorClass();
      }
      else
      {
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384")) & 1) == 0&& (objc_msgSend(v8, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320")) & 1) == 0&& (objc_msgSend(v8, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier384x512")) & 1) == 0&& !objc_msgSend(v8, "isEqualToString:", CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier320x576")))
        {
          goto LABEL_29;
        }
        ANSTViSegHQRegularFrameInferenceDescriptorClass = getANSTViSegHQUpdateFrameInferenceDescriptorClass();
      }
      v15 = ANSTViSegHQRegularFrameInferenceDescriptorClass;
    }
    objc_msgSend(v15, "descriptorWithConfiguration:error:", v13, a5);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      v18 = -[VisionCoreANSTInferenceNetworkDescriptor initWithDescriptor:identifer:]([VisionCoreVideoSegmentationInferenceNetworkDescriptor alloc], "initWithDescriptor:identifer:", v16, v8);

LABEL_32:
      goto LABEL_33;
    }
LABEL_29:
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", CFSTR("Unrecognized descriptorIdentifier"));
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_32;
  }
  if (!a5)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableDescriptorIdentifier:version:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v18 = 0;
  *a5 = v10;
LABEL_33:

  return v18;
}

+ (id)supportedIdentifersForVersion:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[12];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "major") == 1)
  {
    v10[0] = CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier512x384");
    v10[1] = CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier576x320");
    v10[2] = CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384");
    v10[3] = CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320");
    v10[4] = CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384");
    v10[5] = CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320");
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = v10;
    v6 = 6;
  }
  else
  {
    if (objc_msgSend(v3, "major") != 2)
    {
      v7 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_7;
    }
    v9[0] = CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier512x384");
    v9[1] = CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier576x320");
    v9[2] = CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier512x384");
    v9[3] = CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier576x320");
    v9[4] = CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier512x384");
    v9[5] = CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier576x320");
    v9[6] = CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier384x512");
    v9[7] = CFSTR("VisionCoreVideoSegmentationInitialFrameInferenceNetworkIdentifier320x576");
    v9[8] = CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier384x512");
    v9[9] = CFSTR("VisionCoreVideoSegmentationRegularFrameInferenceNetworkIdentifier320x576");
    v9[10] = CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier384x512");
    v9[11] = CFSTR("VisionCoreVideoSegmentationUpdateFrameInferenceNetworkIdentifier320x576");
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = v9;
    v6 = 12;
  }
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

@end
