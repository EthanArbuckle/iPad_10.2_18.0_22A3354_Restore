@implementation GNRProcessor

- (int)_perFrameProcessing:(id)a3 input:(opaqueCMSampleBuffer *)a4 cfp:(frameProperties_t *)a5
{
  _QWORD *v8;
  uint64_t v9;
  _BOOL4 v10;
  _BOOL4 isMultiFrameProcessing;
  unsigned int fusionAlgo;
  BOOL v13;
  unsigned int v14;
  DenoiseFusePipeline *denoiseFusePipeline;
  __CVBuffer *outputPixelBuffer;
  char v17;
  CVImageBufferRef ImageBuffer;
  uint64_t v19;
  unsigned __int16 *v20;
  char v21;
  int v22;
  int aggregateErr;
  void *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  uint64_t v30;

  v8 = a3;
  v9 = v8[2];
  if (v9)
  {
    v10 = a5->exposureParams.gain < *(float *)(v9 + 96);
    if (!a5->isPreBracketedFrame)
    {
LABEL_5:
      isMultiFrameProcessing = self->_isMultiFrameProcessing;
      fusionAlgo = self->_fusionAlgo;
      v13 = fusionAlgo < 4;
      v14 = 0xEu >> (fusionAlgo & 0xF);
      -[DenoiseFusePipeline setAllowModifyingInputBuffers:](self->_denoiseFusePipeline, "setAllowModifyingInputBuffers:", self->_allowModifyingInputBuffers);
      denoiseFusePipeline = self->_denoiseFusePipeline;
      if (isMultiFrameProcessing)
        outputPixelBuffer = 0;
      else
        outputPixelBuffer = self->_outputPixelBuffer;
      v17 = v13 & v14;
      ImageBuffer = CMSampleBufferGetImageBuffer(a4);
      if (v10)
        v19 = v8[2];
      else
        v19 = 0;
      if (v10)
        v20 = &a5->ltmCurves.ltmLut[31];
      else
        v20 = 0;
      if (self->_allowModifyingInputBuffers)
        v21 = v17;
      else
        v21 = 0;
      LOBYTE(v30) = v21;
      v22 = -[DenoiseFusePipeline denoiseFrame:input:exposure:tuningParams:highGainTuningParams:ltmCurves:recycleInput:](denoiseFusePipeline, "denoiseFrame:input:exposure:tuningParams:highGainTuningParams:ltmCurves:recycleInput:", outputPixelBuffer, ImageBuffer, &a5->exposureParams, v8[1], v19, v20, v30);
      aggregateErr = self->_aggregateErr;
      if (!aggregateErr && v22)
      {
        self->_aggregateErr = 3;
LABEL_33:
        fig_log_get_emitter();
        FigDebugAssert3();
        goto LABEL_35;
      }
      if (aggregateErr)
        goto LABEL_33;
      if (self->_fusionAlgo == 3 && a5->exposureParams.original_exposure_bias < 0.0)
      {
        self->_registrationReferenceFrameIndex = self->_cntBracketSampleBuffers - 1;
        -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", CMSampleBufferGetImageBuffer(a4), 10, 23, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[DenoiseFusePipeline baseLayer:](self->_denoiseFusePipeline, "baseLayer:", v24);
        v26 = self->_aggregateErr;
        if (!v26 && v25)
        {
          self->_aggregateErr = 19;
LABEL_27:
          fig_log_get_emitter();
          FigDebugAssert3();

          goto LABEL_35;
        }
        if (v26)
          goto LABEL_27;

      }
      -[FigMetalContext waitForSchedule](self->_metal, "waitForSchedule");
      v27 = -[GNRProcessor _registerImages:](self, "_registerImages:", 0);
      v28 = self->_aggregateErr;
      if (v28 || !v27)
      {
        if (!v28)
          goto LABEL_35;
      }
      else
      {
        self->_aggregateErr = 1;
      }
      goto LABEL_33;
    }
  }
  else
  {
    v10 = 0;
    if (!a5->isPreBracketedFrame)
      goto LABEL_5;
  }
LABEL_35:

  return 0;
}

- (void)loadBracketMetadata:(id)a3 cfp:(frameProperties_t *)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  getExposureParameters(v14, (uint64_t)&a4->exposureParams, self->_disableispDGainFactorFix);
  LOBYTE(a4->ltmCurves.ltmLut[30]) = getLTMCurvesFromMetadata(v14, &a4->ltmCurves.ltmLut[31]) == 0;
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE11C28]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(&a4[1].exposureParams.is_long + 2) = v10 != 0;

  if (self->_isMultiFrameProcessing)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE11BF8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    a4->bracketedCaptureSequenceNumber = objc_msgSend(v11, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE11D10]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    a4->isPreBracketedFrame = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE11BE8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    a4->averageFocusScore = objc_msgSend(v13, "longLongValue");

    a4->metadataHasROI = getROIMetadata((uint64_t)v14, (uint64_t)&a4->ROI, a5, a6) == 0;
  }

}

- (int)_appendFrames:(opaqueCMSampleBuffer *)a3 cfp:(frameProperties_t *)a4
{
  opaqueCMSampleBuffer *v7;
  float original_exposure_bias;
  opaqueCMSampleBuffer *ev0SampleBuffer;
  uint64_t v10;
  opaqueCMSampleBuffer *v11;
  uint64_t cntBracketSampleBuffers;

  if (a4->isPreBracketedFrame)
  {
    if (a3)
      v7 = (opaqueCMSampleBuffer *)CFRetain(a3);
    else
      v7 = 0;
    self->_prebracketedEV0SampleBuffer = v7;
    memcpy(&self->_prebracketedProperties, a4, 0x1110uLL);
    return 0;
  }
  if (self->_fusionAlgo == 3)
  {
    original_exposure_bias = a4->exposureParams.original_exposure_bias;
    if (original_exposure_bias >= 0.0)
    {
      if (original_exposure_bias != 0.0)
        goto LABEL_11;
      ev0SampleBuffer = self->_ev0SampleBuffer;
      self->_ev0SampleBuffer = a3;
      if (a3)
        CFRetain(a3);
      v10 = 13264;
      if (!ev0SampleBuffer)
        goto LABEL_10;
    }
    else
    {
      ev0SampleBuffer = self->_evmSampleBuffer;
      self->_evmSampleBuffer = a3;
      if (a3)
        CFRetain(a3);
      v10 = 8880;
      if (!ev0SampleBuffer)
        goto LABEL_10;
    }
    CFRelease(ev0SampleBuffer);
LABEL_10:
    memcpy((char *)self + v10, a4, 0x1110uLL);
  }
LABEL_11:
  if (a3)
    v11 = (opaqueCMSampleBuffer *)CFRetain(a3);
  else
    v11 = 0;
  cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
  self->_bracketSampleBuffers[cntBracketSampleBuffers] = v11;
  memcpy((char *)self->_bracketProperties + 4368 * (int)cntBracketSampleBuffers, a4, 0x1110uLL);
  ++self->_cntBracketSampleBuffers;
  return 0;
}

- (void)setProcessingType:(int)a3
{
  int v4;
  BOOL v5;

  v4 = 0;
  self->_processingType = a3;
  v5 = 0;
  switch(a3)
  {
    case 1:
    case 6:
      v4 = 1;
      v5 = 1;
      break;
    case 2:
    case 7:
      v5 = 1;
      v4 = 2;
      break;
    case 3:
    case 4:
    case 5:
    case 8:
      break;
    case 9:
      v5 = 1;
      v4 = 3;
      break;
    default:
      v5 = 0;
      break;
  }
  self->_fusionAlgo = v4;
  self->_isMultiFrameProcessing = v5;
  -[DenoiseFusePipeline reset](self->_denoiseFusePipeline, "reset");
  -[DenoiseFusePipeline setFusionMode:](self->_denoiseFusePipeline, "setFusionMode:", self->_fusionAlgo);
}

- (int)StartKTraceEventForBracketFrame:(id)a3
{
  id v4;
  void *v5;
  _DWORD *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;

  v4 = a3;
  v5 = v4;
  v6 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (!*MEMORY[0x24BDC0B48])
  {
    v22 = 0;
    goto LABEL_31;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE11C58]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE11D10]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE11BF8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "intValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE11D08]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE11A48]);

  if (self->_processingType != 9)
  {
    if (v14)
      v22 = 822150528;
    else
      v22 = 822149824;
    if (*v6 != 1)
      goto LABEL_31;
    goto LABEL_30;
  }
  if (!self->_isMultiFrameProcessing)
  {
    v22 = 0;
    if (*v6 != 1)
      goto LABEL_31;
    goto LABEL_30;
  }
  if (v14)
    v15 = 740;
  else
    v15 = 220;
  v16 = v15 + 822149824;
  if (v14)
    v17 = 736;
  else
    v17 = 216;
  v18 = v17 + 822149824;
  if (v9 == 0.0)
    v16 = v18;
  if (v14)
    v19 = 732;
  else
    v19 = 212;
  v20 = v19 + 822149824;
  if (v9 < 0.0)
    v16 = v20;
  if (v14)
    v21 = 728;
  else
    v21 = 208;
  if (v11)
    v22 = v21 + 822149824;
  else
    v22 = v16;
  if (*v6 == 1)
LABEL_30:
    kdebug_trace();
LABEL_31:

  return v22;
}

- (int)processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v3;
  __CVBuffer *ImageBuffer;
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  uint64_t v10;
  void *v11;
  size_t WidthOfPlane;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  DeviceParameters *v26;
  FusionDeviceParameters *v27;
  FusionDeviceParameters *fusion;
  int v29;
  DeviceParameters *deviceTuningParams;
  int v31;
  int aggregateErr;
  __CVPixelBufferPool *outputPixelBufferPool;
  _BOOL4 v34;
  int v35;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  const __CFDictionary *v40;
  void *v41;
  void *v42;
  __CVBuffer *v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  CMGetAttachment(a3, (CFStringRef)*MEMORY[0x24BE11A80], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11D70]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = *MEMORY[0x24BDC56D0];
  v46[0] = &unk_24D670228;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = -[GNRProcessor StartKTraceEventForBracketFrame:](self, "StartKTraceEventForBracketFrame:", v7);
  if (!a3)
  {
    fig_log_get_emitter();
    v38 = v3;
    LODWORD(v37) = 0;
    FigDebugAssert3();
    v29 = FigSignalErrorAt();
    v11 = 0;
    goto LABEL_33;
  }
  v11 = malloc_type_calloc(1uLL, 0x1110uLL, 0x1000040D6CA7AEAuLL);
  if (!v11)
  {
    fig_log_get_emitter();
    v38 = v3;
    LODWORD(v37) = 0;
    FigDebugAssert3();
    v29 = -12786;
    goto LABEL_33;
  }
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(ImageBuffer, 0);
  v43 = ImageBuffer;
  v44 = v11;
  -[GNRProcessor loadBracketMetadata:cfp:width:height:](self, "loadBracketMetadata:cfp:width:height:", v7, v11, WidthOfPlane, CVPixelBufferGetHeightOfPlane(ImageBuffer, 0));
  if (!self->_requestTuningParams)
  {
    v29 = 0;
LABEL_15:
    if (!self->_hasBeenSetup)
    {
      -[GNRProcessor _oneTimeSetupUsingAttributes:fallbackPixelBuffer:](self, "_oneTimeSetupUsingAttributes:fallbackPixelBuffer:", CVPixelBufferGetAttributes(), v43);
      aggregateErr = self->_aggregateErr;
      if (aggregateErr)
        goto LABEL_29;
    }
    if (self->_outputPixelBuffer)
    {
LABEL_26:
      v35 = -[GNRProcessor _appendFrames:cfp:](self, "_appendFrames:cfp:", a3, v44, v37, v38);
      aggregateErr = self->_aggregateErr;
      if (aggregateErr || !v35)
      {
        if (!aggregateErr)
        {
          -[GNRProcessor _perFrameProcessing:input:cfp:](self, "_perFrameProcessing:input:cfp:", self->_deviceTuningParams, a3, v44);
          aggregateErr = self->_aggregateErr;
          if (!aggregateErr)
            goto LABEL_32;
        }
      }
      else
      {
        aggregateErr = 2;
        self->_aggregateErr = 2;
      }
      goto LABEL_29;
    }
    outputPixelBufferPool = self->_outputPixelBufferPool;
    if (outputPixelBufferPool)
    {
      v34 = CVPixelBufferPoolCreatePixelBufferWithAuxAttributes((CFAllocatorRef)*MEMORY[0x24BDBD240], outputPixelBufferPool, v9, &self->_outputPixelBuffer) != 0;
      aggregateErr = self->_aggregateErr;
      if (aggregateErr)
        goto LABEL_25;
    }
    else
    {
      v34 = 1;
      aggregateErr = self->_aggregateErr;
      if (aggregateErr)
        goto LABEL_25;
    }
    if (v34)
    {
      aggregateErr = 7;
      self->_aggregateErr = 7;
      goto LABEL_29;
    }
LABEL_25:
    if (!aggregateErr)
      goto LABEL_26;
LABEL_29:
    fig_log_get_emitter();
    v38 = v3;
    LODWORD(v37) = aggregateErr;
    FigDebugAssert3();
    goto LABEL_32;
  }
  v39 = v10;
  v40 = v9;
  v42 = v7;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_tuningParams, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NoiseModel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_processingType);
  v15 = v8;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_tuningParams, "objectForKeyedSubscript:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Fusion"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_processingType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v15;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_tuningParams, "objectForKeyedSubscript:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("HighGainNoiseModel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_processingType);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v39;
    if (!v17)
      goto LABEL_36;
  }
  else
  {
    v25 = 0;
    v10 = v39;
    if (!v17)
      goto LABEL_36;
  }
  objc_storeStrong((id *)&self->_deviceTuningParams->nm, v17);
  objc_storeStrong((id *)&self->_deviceTuningParams->nmHighGain, v25);
  if (!self->_isMultiFrameProcessing)
  {
    deviceTuningParams = self->_deviceTuningParams;
    fusion = deviceTuningParams->fusion;
    deviceTuningParams->fusion = 0;
    goto LABEL_13;
  }
  if (v21)
  {
    v26 = self->_deviceTuningParams;
    v27 = v21;
    fusion = v26->fusion;
    v26->fusion = v27;
LABEL_13:

    v29 = 0;
    self->_requestTuningParams = 0;
    v31 = 1;
    goto LABEL_14;
  }
LABEL_36:
  fig_log_get_emitter();
  v38 = v3;
  LODWORD(v37) = 0;
  FigDebugAssert3();
  v29 = FigSignalErrorAt();
  v31 = 0;
LABEL_14:

  v8 = v41;
  v7 = v42;
  v9 = v40;
  if (v31)
    goto LABEL_15;
LABEL_32:
  v11 = v44;
LABEL_33:
  -[GNRProcessor EndKTraceEventForBracketFrame:ktraceCode:](self, "EndKTraceEventForBracketFrame:ktraceCode:", v7, v10, v37, v38);
  free(v11);

  return v29;
}

void __31__GNRProcessor_processSequence__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
    if (*MEMORY[0x24BDC0B48] != 1)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v2, "status");
  if (*MEMORY[0x24BDC0B48] == 1)
LABEL_5:
    kdebug_trace();
LABEL_6:

}

void __57__GNRProcessor_EndKTraceEventForBracketFrame_ktraceCode___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
    if (*MEMORY[0x24BDC0B48] != 1)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v2, "status");
  if (*MEMORY[0x24BDC0B48] == 1)
LABEL_5:
    kdebug_trace();
LABEL_6:

}

- (GNRProcessor)initWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  GNRProcessor *v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *tuningParams;
  NSMutableDictionary *v22;
  NSMutableDictionary *tuningParamsPlist;
  uint64_t v24;
  NSDictionary *debugConfigurationOptions;
  void *v26;
  id v27;
  uint64_t v28;
  FigMetalContext *metal;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  DenoiseFusePipeline *v34;
  void *v35;
  DenoiseFusePipeline *denoiseFusePipeline;
  RegWarp *v37;
  RegWarp *registrationPipelineRW;
  DeviceParameters *v39;
  DeviceParameters *deviceTuningParams;
  NSMutableDictionary *v41;
  NSMutableDictionary *sidecar;
  _QWORD v44[5];
  objc_super v45;
  const __CFString *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v46 = CFSTR("gnr.Metadata.DisableispDGainFactorFix");
  v47[0] = &unk_24D670210;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  loadDefaultsWritesWithPrefix();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x24BE11E08];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11E08]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isAsynchronous = objc_msgSend(v10, "integerValue");

  }
  else
  {
    self->_isAsynchronous = 1;
  }

  v11 = *MEMORY[0x24BE11DF8];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11DF8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_ctxCreateSynchronization = objc_msgSend(v13, "integerValue");

  }
  else
  {
    self->_ctxCreateSynchronization = 2;
  }

  v14 = *MEMORY[0x24BE11E10];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11E10]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

  }
  else
  {
    v17 = 0;
  }

  v45.receiver = self;
  v45.super_class = (Class)GNRProcessor;
  v18 = -[GNRProcessor init](&v45, sel_init);
  if (!v18)
  {
    v19 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11B18]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_29;
  v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  tuningParams = v18->_tuningParams;
  v18->_tuningParams = v20;

  v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  tuningParamsPlist = v18->_tuningParamsPlist;
  v18->_tuningParamsPlist = v22;

  if (-[GNRProcessor getOptions:](v18, "getOptions:", v19))
    goto LABEL_29;
  loadDefaultsWritesWithPrefix();
  v24 = objc_claimAutoreleasedReturnValue();
  debugConfigurationOptions = v18->_debugConfigurationOptions;
  v18->_debugConfigurationOptions = (NSDictionary *)v24;

  -[NSDictionary objectForKeyedSubscript:](v18->_debugConfigurationOptions, "objectForKeyedSubscript:", CFSTR("gnr.Metadata.DisableispDGainFactorFix"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v18->_disableispDGainFactorFix = objc_msgSend(v26, "BOOLValue");

  v27 = objc_alloc(MEMORY[0x24BE11A10]);
  v28 = objc_msgSend(v27, "initWithLibraryData:ofSize:andOptionalCommandQueue:", &default_metallib, default_metallib_len, 0);
  metal = v18->_metal;
  v18->_metal = (FigMetalContext *)v28;

  if (!v28)
  {
LABEL_19:
    v34 = 0;
    goto LABEL_28;
  }
  v30 = *MEMORY[0x24BE11B10];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11B10]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_gpuPriority = objc_msgSend(v32, "integerValue");

    if (!-[FigMetalContext setQueuePriority:](v18->_metal, "setQueuePriority:", v18->_gpuPriority))goto LABEL_16;
LABEL_29:
    fig_log_get_emitter();
    FigDebugAssert3();
    v34 = 0;
    goto LABEL_28;
  }
  v18->_gpuPriority = 1;

  if (-[FigMetalContext setQueuePriority:](v18->_metal, "setQueuePriority:", v18->_gpuPriority))goto LABEL_29;
LABEL_16:
  if ((v17 & 1) != 0)
  {
    v33 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11E00]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v35, "BOOLValue");

  }
  v34 = -[DenoiseFusePipeline initWithContext:supportsHDR:onlySingleImageDenoising:]([DenoiseFusePipeline alloc], "initWithContext:supportsHDR:onlySingleImageDenoising:", v18->_metal, v33, v17);
  denoiseFusePipeline = v18->_denoiseFusePipeline;
  v18->_denoiseFusePipeline = v34;

  if (v34)
  {
    -[DenoiseFusePipeline setSidecarWriter:](v18->_denoiseFusePipeline, "setSidecarWriter:", v18);
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __32__GNRProcessor_initWithOptions___block_invoke;
    v44[3] = &__block_descriptor_40_e11_v16__0i8i12lu32l8;
    v44[4] = v18;
    -[DenoiseFusePipeline setFusionReferenceSelectionBlock:](v18->_denoiseFusePipeline, "setFusionReferenceSelectionBlock:", v44);
    v18->_requestTuningParams = 1;
    v18->_cntBracketSampleBuffers = 0;
    if ((v17 & 1) == 0)
    {
      v37 = objc_alloc_init(RegWarp);
      registrationPipelineRW = v18->_registrationPipelineRW;
      v18->_registrationPipelineRW = v37;

    }
    v18->_hasBeenSetup = 0;
    v18->_fusionOptions = 0;
    v18->_referenceFrameIndex = -1;
    v18->_registrationReferenceFrameIndex = -1;
    v39 = objc_alloc_init(DeviceParameters);
    deviceTuningParams = v18->_deviceTuningParams;
    v18->_deviceTuningParams = v39;

    v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sidecar = v18->_sidecar;
    v18->_sidecar = v41;

    v34 = v18;
  }
  else
  {
    fwrite("Unable to create DenoiseFusePipeline\n", 0x25uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  }
LABEL_28:

  return (GNRProcessor *)v34;
}

- (void)resetState
{
  opaqueCMSampleBuffer *prebracketedEV0SampleBuffer;
  int *p_cntBracketSampleBuffers;
  opaqueCMSampleBuffer *evmSampleBuffer;
  opaqueCMSampleBuffer *ev0SampleBuffer;
  uint64_t v7;
  opaqueCMSampleBuffer **bracketSampleBuffers;
  frameProperties_t *bracketProperties;
  opaqueCMSampleBuffer *v10;
  opaqueCMSampleBuffer *buffer;
  __CVBuffer *outputPixelBuffer;

  -[DenoiseFusePipeline reset](self->_denoiseFusePipeline, "reset");
  self->_aggregateErr = 0;
  prebracketedEV0SampleBuffer = self->_prebracketedEV0SampleBuffer;
  if (prebracketedEV0SampleBuffer)
  {
    CFRelease(prebracketedEV0SampleBuffer);
    self->_prebracketedEV0SampleBuffer = 0;
  }
  p_cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  evmSampleBuffer = self->_evmSampleBuffer;
  if (evmSampleBuffer)
  {
    CFRelease(evmSampleBuffer);
    self->_evmSampleBuffer = 0;
  }
  ev0SampleBuffer = self->_ev0SampleBuffer;
  if (ev0SampleBuffer)
  {
    CFRelease(ev0SampleBuffer);
    self->_ev0SampleBuffer = 0;
  }
  if (*p_cntBracketSampleBuffers >= 1)
  {
    v7 = 0;
    bracketSampleBuffers = self->_bracketSampleBuffers;
    bracketProperties = self->_bracketProperties;
    do
    {
      v10 = bracketSampleBuffers[v7];
      if (v10)
      {
        CFRelease(v10);
        bracketSampleBuffers[v7] = 0;
      }
      bzero(bracketProperties, 0x1110uLL);
      ++v7;
      bracketProperties = (frameProperties_t *)((char *)bracketProperties + 4368);
    }
    while (v7 < *p_cntBracketSampleBuffers);
  }
  buffer = self->_errorRecoveryData.buffer;
  if (buffer)
  {
    CFRelease(buffer);
    self->_errorRecoveryData.buffer = 0;
  }
  self->_requestTuningParams = 1;
  *p_cntBracketSampleBuffers = 0;
  self->_referenceFrameIndex = -1;
  self->_registrationReferenceFrameIndex = -1;
  outputPixelBuffer = self->_outputPixelBuffer;
  if (outputPixelBuffer)
  {
    CFRelease(outputPixelBuffer);
    self->_outputPixelBuffer = 0;
  }
  bzero(&self->_prebracketedProperties, 0x1110uLL);
  bzero(&self->_evmProperties, 0x1110uLL);
  -[DenoiseFusePipeline setForceHDRFusionReferenceFrame:](self->_denoiseFusePipeline, "setForceHDRFusionReferenceFrame:", 0xFFFFFFFFLL);
  *(_OWORD *)&self->_anon_8970[192] = 0u;
  *(_OWORD *)&self->_anon_8970[176] = 0u;
  *(_OWORD *)&self->_anon_8970[160] = 0u;
  *(_OWORD *)&self->_anon_8970[144] = 0u;
  *(_OWORD *)&self->_anon_8970[128] = 0u;
  *(_OWORD *)&self->_anon_8970[112] = 0u;
  *(_OWORD *)&self->_anon_8970[96] = 0u;
  *(_OWORD *)&self->_anon_8970[80] = 0u;
  *(_OWORD *)&self->_anon_8970[64] = 0u;
  *(_OWORD *)&self->_anon_8970[48] = 0u;
  *(_OWORD *)&self->_anon_8970[32] = 0u;
  *(_OWORD *)&self->_anon_8970[16] = 0u;
  *(_OWORD *)self->_anon_8970 = 0u;
  *(_OWORD *)&self->_fusionConf.longest = 0u;
  *(_OWORD *)&self->_fusionConf.fusionAlgo = 0u;
}

- (void)finishPendingProcessing
{
  -[FigMetalContext waitForIdle](self->_metal, "waitForIdle");
}

- (int)processSequence
{
  uint64_t v2;
  DeviceParameters **p_deviceTuningParams;
  opaqueCMSampleBuffer **bracketSampleBuffers;
  void *v6;
  void *v7;
  int v8;
  _BOOL4 isMultiFrameProcessing;
  int v10;
  int v11;
  int v12;
  _DWORD *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[7];
  int v23;

  p_deviceTuningParams = &self->_deviceTuningParams;
  bracketSampleBuffers = self->_bracketSampleBuffers;
  CMGetAttachment(self->_bracketSampleBuffers[0], (CFStringRef)*MEMORY[0x24BE11A80], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11D08]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE11A48]);

  isMultiFrameProcessing = self->_isMultiFrameProcessing;
  if (v8)
    v10 = 822150548;
  else
    v10 = 822150024;
  if (v8)
    v11 = 822150544;
  else
    v11 = 822150020;
  if (self->_isMultiFrameProcessing)
    v12 = v10;
  else
    v12 = v11;
  v13 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
  {
    kdebug_trace();
    isMultiFrameProcessing = self->_isMultiFrameProcessing;
  }
  if (isMultiFrameProcessing)
  {
    if (self->_aggregateErr
      || (-[GNRProcessor _multiFrameProcessing](self, "_multiFrameProcessing"), self->_isMultiFrameProcessing))
    {
      v14 = *((unsigned int *)p_deviceTuningParams + 15);
      if ((int)v14 >= 0)
        bracketSampleBuffers += v14;
    }
  }
  if (*bracketSampleBuffers)
  {
    v15 = -[GNRProcessor _prepareOutput:params:](self, "_prepareOutput:params:", *bracketSampleBuffers, *p_deviceTuningParams);
    if (v15)
    {
      fig_log_get_emitter();
      v21 = v2;
      LODWORD(v20) = v15;
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    v21 = v2;
    LODWORD(v20) = 0;
    FigDebugAssert3();
    v15 = FigSignalErrorAt();
  }
  if (*v13)
  {
    v16 = *((int *)p_deviceTuningParams + 14);
    -[DeviceParameters commandQueue](p_deviceTuningParams[2], "commandQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "commandBuffer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setLabel:", CFSTR("KTRACE_END_MTL"));
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __31__GNRProcessor_processSequence__block_invoke;
    v22[3] = &__block_descriptor_60_e28_v16__0___MTLCommandBuffer__8l;
    v23 = v12;
    v22[5] = 0;
    v22[6] = 0;
    v22[4] = v16;
    objc_msgSend(v18, "addCompletedHandler:", v22);
    objc_msgSend(v18, "commit");

  }
  -[GNRProcessor resetState](self, "resetState", v20, v21);

  return v15;
}

- (int)_prepareOutput:(opaqueCMSampleBuffer *)a3 params:(id)a4
{
  uint64_t v4;
  unsigned int *p_cntBracketSampleBuffers;
  _QWORD *v8;
  void *v9;
  uint64_t SampleTimingInfoArray;
  void *SampleBuffer;
  void *v12;
  opaqueCMSampleBuffer *buffer;
  void (**callback)(id, uint64_t, opaqueCMSampleBuffer *);
  __CVBuffer *ImageBuffer;
  id v16;
  const __CFString *v17;
  int aggregateErr;
  __CVBuffer *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  int v29;
  void *v30;
  int v31;
  uint64_t v33;
  uint64_t v34;
  opaqueCMSampleBuffer *target;
  _QWORD *v36;
  CMSampleTimingInfo timingArrayOut;

  p_cntBracketSampleBuffers = (unsigned int *)&self->_cntBracketSampleBuffers;
  v8 = a4;
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", p_cntBracketSampleBuffers[80]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)*p_cntBracketSampleBuffers <= 0
    || (-[GNRProcessor _selectErrorRecoveryFrame](self, "_selectErrorRecoveryFrame"), !self->_errorRecoveryData.buffer))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    SampleTimingInfoArray = FigSignalErrorAt();
    v12 = 0;
    buffer = 0;
    callback = (void (**)(id, uint64_t, opaqueCMSampleBuffer *))self->_callback;
    if (!callback)
      goto LABEL_53;
LABEL_52:
    callback[2](callback, SampleTimingInfoArray, buffer);
    goto LABEL_53;
  }
  target = a3;
  SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &timingArrayOut, 0);
  if ((_DWORD)SampleTimingInfoArray)
  {
    fig_log_get_emitter();
    v34 = v4;
    LODWORD(v33) = SampleTimingInfoArray;
    FigDebugAssert3();
    if (self->_aggregateErr)
    {
LABEL_5:
      CMSampleBufferGetImageBuffer(self->_errorRecoveryData.buffer);
      SampleBuffer = (void *)CreateSampleBuffer();
      if (self->_aggregateErr)
        goto LABEL_13;
      goto LABEL_11;
    }
  }
  else if (self->_aggregateErr)
  {
    goto LABEL_5;
  }
  SampleBuffer = (void *)CreateSampleBuffer();
  if (self->_aggregateErr)
    goto LABEL_13;
LABEL_11:
  if (!SampleBuffer)
    self->_aggregateErr = 8;
LABEL_13:
  CMPropagateAttachments(self->_errorRecoveryData.buffer, SampleBuffer);
  ImageBuffer = CMSampleBufferGetImageBuffer(self->_errorRecoveryData.buffer);
  CVBufferPropagateAttachments(ImageBuffer, self->_outputPixelBuffer);
  v16 = objc_alloc(MEMORY[0x24BDBCED8]);
  v17 = (const __CFString *)*MEMORY[0x24BE11A80];
  v12 = (void *)objc_msgSend(v16, "initWithDictionary:", CMGetAttachment(SampleBuffer, (CFStringRef)*MEMORY[0x24BE11A80], 0));
  aggregateErr = self->_aggregateErr;
  v36 = v8;
  if (self->_isMultiFrameProcessing)
  {
    if (aggregateErr)
    {
      v19 = CMSampleBufferGetImageBuffer(self->_errorRecoveryData.buffer);
      if (-[DenoiseFusePipeline denoiseSingleImage:input:exposure:tuningParams:highGainTuningParams:ltmCurves:](self->_denoiseFusePipeline, "denoiseSingleImage:input:exposure:tuningParams:highGainTuningParams:ltmCurves:", self->_outputPixelBuffer, v19, &self->_errorRecoveryData.info.exposureParams.blue_gain, v8[1], 0, 0))
      {
        v20 = 10;
      }
      else
      {
        v20 = 0;
      }
      CVBufferPropagateAttachments(v19, self->_outputPixelBuffer);
      v21 = v9;
      v9 = &unk_24D670240;
    }
    else
    {
      v22 = (void *)MEMORY[0x24BDD16E0];
      -[GNRProcessor _computeFusionEffectiveness:](self, "_computeFusionEffectiveness:", *p_cntBracketSampleBuffers);
      objc_msgSend(v22, "numberWithFloat:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("TemporalFusionFactor"));
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
    if (!aggregateErr)
      goto LABEL_23;
    v21 = v9;
    v9 = 0;
  }

LABEL_23:
  v23 = self->_aggregateErr;
  if (v23 >= 255)
    v23 = 255;
  if ((int)*p_cntBracketSampleBuffers <= 15)
    v24 = *p_cntBracketSampleBuffers << 8;
  else
    v24 = 3840;
  v25 = v24 | v23;
  v26 = p_cntBracketSampleBuffers[80];
  if (v26 <= 15)
    v27 = v26 << 12;
  else
    v27 = 61440;
  v28 = p_cntBracketSampleBuffers[72];
  if (v28 <= 0xF)
    v29 = v28 << 16;
  else
    v29 = 983040;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v25 | v27 | v29, v33, v34);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, CFSTR("GNRMethod"));

  if (self->_isMultiFrameProcessing)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", CMGetAttachment(target, v17, 0), CFSTR("ReferenceFrameMetadata"));
    if (self->_isMultiFrameProcessing)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("NO"), *MEMORY[0x24BE11D10]);
  }
  CMSetAttachment(SampleBuffer, v17, v12, 1u);
  if (v20)
  {
    buffer = self->_errorRecoveryData.buffer;
    if (buffer)
      CFRetain(self->_errorRecoveryData.buffer);
    if (SampleBuffer)
      CFRelease(SampleBuffer);

    v9 = 0;
    self->_aggregateErr = v20;
  }
  else
  {
    buffer = (opaqueCMSampleBuffer *)SampleBuffer;
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE11DF0]);
  v31 = self->_aggregateErr;
  v8 = v36;
  if (!v31)
  {
LABEL_50:
    if (!self->_isAsynchronous)
      goto LABEL_57;
    goto LABEL_51;
  }
  if (v31 == 1)
  {
    SampleTimingInfoArray = 4294949895;
    goto LABEL_50;
  }
  if (v31 != 6)
  {
    SampleTimingInfoArray = 4294949896;
    if (!self->_isAsynchronous)
      goto LABEL_57;
LABEL_51:
    -[GNRProcessor finishScheduling](self, "finishScheduling");
    callback = (void (**)(id, uint64_t, opaqueCMSampleBuffer *))self->_callback;
    if (!callback)
      goto LABEL_53;
    goto LABEL_52;
  }
  SampleTimingInfoArray = 4294949894;
  if (self->_isAsynchronous)
    goto LABEL_51;
LABEL_57:
  -[GNRProcessor finishPendingProcessing](self, "finishPendingProcessing");
  callback = (void (**)(id, uint64_t, opaqueCMSampleBuffer *))self->_callback;
  if (callback)
    goto LABEL_52;
LABEL_53:
  if (buffer)
    CFRelease(buffer);

  return SampleTimingInfoArray;
}

- (BOOL)isTele
{
  void *v2;
  void *v3;
  char v4;

  CMGetAttachment(self->_bracketSampleBuffers[0], (CFStringRef)*MEMORY[0x24BE11A80], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE11D08]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE11A48]);

  return v4;
}

- (int)_registerImages:(BOOL)a3
{
  _BOOL4 v3;
  int *p_cntBracketSampleBuffers;
  uint64_t registrationReferenceFrameIndex;
  int v7;
  _DWORD *v8;
  uint64_t v9;
  BOOL *v10;
  int v11;
  uint64_t v12;
  int v13;
  BOOL *p_registrationComplete;
  __int128 v15;
  __int128 v16;
  char v17;
  __CVBuffer *v18;
  _OWORD *v19;
  __int128 v20;
  __CVBuffer *ImageBuffer;
  int aggregateErr;
  BOOL *p_hasValidRegistration;
  BOOL v25;
  frameProperties_t *bracketProperties;
  _OWORD v28[2];
  int v29;

  v3 = a3;
  p_cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  registrationReferenceFrameIndex = self->_registrationReferenceFrameIndex;
  v7 = self->_registrationReferenceFrameIndex;
  -[GNRProcessor isTele](self, "isTele");
  v8 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  if (v3 && v7 < 0)
    goto LABEL_50;
  if (v7 < 0)
    goto LABEL_41;
  LODWORD(v9) = *p_cntBracketSampleBuffers;
  if (*p_cntBracketSampleBuffers <= v7)
    goto LABEL_41;
  v10 = &self->_bracketProperties[0].isPreBracketedFrame + 4368 * registrationReferenceFrameIndex;
  if (!v10[96])
  {
    v19 = (_OWORD *)MEMORY[0x24BDAEDF8];
    *((_OWORD *)v10 + 9) = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
    v20 = v19[1];
    *((_OWORD *)v10 + 7) = *v19;
    *((_OWORD *)v10 + 8) = v20;
    *((_WORD *)v10 + 48) = 257;
    if (*((_BYTE *)p_cntBracketSampleBuffers + 316))
    {
      ImageBuffer = -[DenoiseFusePipeline getDenoisedFrame:](self->_denoiseFusePipeline, "getDenoisedFrame:", registrationReferenceFrameIndex);
      if (!ImageBuffer)
        goto LABEL_50;
    }
    else
    {
      ImageBuffer = CMSampleBufferGetImageBuffer(self->_bracketSampleBuffers[registrationReferenceFrameIndex]);
      if (!ImageBuffer)
        goto LABEL_50;
    }
    aggregateErr = self->_aggregateErr;
    if (!v10[56] && aggregateErr == 0)
    {
      self->_aggregateErr = 18;
    }
    else if (!aggregateErr)
    {
      bracketProperties = self->_bracketProperties;
      if (!objc_msgSend(*((id *)p_cntBracketSampleBuffers + 34), "runIterativeWithRefImage:regionOfInterest:", ImageBuffer, *((double *)v10 + 8), *((double *)v10 + 9), *((double *)v10 + 10), *((double *)v10 + 11)))
      {
        LODWORD(v9) = *p_cntBracketSampleBuffers;
        v11 = 1;
        if (*p_cntBracketSampleBuffers >= 1)
          goto LABEL_9;
        goto LABEL_29;
      }
LABEL_50:
      fig_log_get_emitter();
      FigDebugAssert3();
      v13 = FigSignalErrorAt();
      goto LABEL_42;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_41:
    v13 = 0;
    goto LABEL_42;
  }
  bracketProperties = self->_bracketProperties;
  v11 = 0;
  if ((int)v9 >= 1)
  {
LABEL_9:
    v12 = 0;
    v13 = 0;
    p_registrationComplete = &self->_bracketProperties[0].registrationComplete;
    while (1)
    {
      if (!*p_registrationComplete)
      {
        *p_registrationComplete = 1;
        if (*((_BYTE *)p_cntBracketSampleBuffers + 316))
        {
          v18 = -[DenoiseFusePipeline getDenoisedFrame:](self->_denoiseFusePipeline, "getDenoisedFrame:", v12);
          if (!v18)
            goto LABEL_47;
        }
        else
        {
          v18 = CMSampleBufferGetImageBuffer(self->_bracketSampleBuffers[v12]);
          if (!v18)
          {
LABEL_47:
            fig_log_get_emitter();
            FigDebugAssert3();
            v13 = FigSignalErrorAt();
            goto LABEL_48;
          }
        }
        v29 = 0;
        memset(v28, 0, sizeof(v28));
        v13 = objc_msgSend(*((id *)p_cntBracketSampleBuffers + 34), "runIterativeWithNonRefImage:outputTransform:", v18, v28);
        if (v13)
        {
          v17 = 0;
        }
        else
        {
          HIDWORD(v15) = HIDWORD(v28[0]);
          v16 = *(_OWORD *)((char *)v28 + 12);
          *((_OWORD *)p_registrationComplete + 1) = v28[0];
          *((_OWORD *)p_registrationComplete + 2) = v16;
          *(_QWORD *)&v15 = *((_QWORD *)&v28[1] + 1);
          DWORD2(v15) = v29;
          *((_OWORD *)p_registrationComplete + 3) = v15;
          ++v11;
          v17 = 1;
        }
        p_registrationComplete[1] = v17;
        LODWORD(v9) = *p_cntBracketSampleBuffers;
      }
      ++v12;
      p_registrationComplete += 4368;
      if (v12 >= (int)v9)
        goto LABEL_30;
    }
  }
LABEL_29:
  v13 = 0;
LABEL_30:
  if ((int)v9 < 1)
  {
LABEL_48:
    if (*MEMORY[0x24BDC0B48] != 1)
      return v13;
    goto LABEL_43;
  }
  v8 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (v3)
  {
    p_hasValidRegistration = &bracketProperties->hasValidRegistration;
    v25 = 1;
    v9 = v9;
    do
    {
      while (v25)
      {
        v25 = *p_hasValidRegistration;
        p_hasValidRegistration += 4368;
        if (!--v9)
          goto LABEL_36;
      }
      v25 = 0;
      p_hasValidRegistration += 4368;
      --v9;
    }
    while (v9);
LABEL_36:
    if (!v25)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v13 = FigSignalErrorAt();
      if (*v8 == 1)
        goto LABEL_43;
      return v13;
    }
  }
LABEL_42:
  if (*v8 == 1)
LABEL_43:
    kdebug_trace();
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_referenceFrameSelectionHandlerBlock, 0);
  objc_storeStrong((id *)&self->_sidecar, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_registrationPipelineRW, 0);
  objc_storeStrong((id *)&self->_deviceTuningParams, 0);
  objc_storeStrong((id *)&self->_denoiseFusePipeline, 0);
  objc_storeStrong((id *)&self->_debugConfigurationOptions, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_tuningParamsPlist, 0);
  objc_storeStrong((id *)&self->_tuningParams, 0);
}

- (void)purgeResources
{
  __CVBuffer *outputPixelBuffer;
  opaqueCMSampleBuffer *buffer;
  __CVPixelBufferPool *outputPixelBufferPool;

  -[GNRProcessor finishPendingProcessing](self, "finishPendingProcessing");
  -[DenoiseFusePipeline releaseAllBuffers](self->_denoiseFusePipeline, "releaseAllBuffers");
  outputPixelBuffer = self->_outputPixelBuffer;
  if (outputPixelBuffer)
  {
    CFRelease(outputPixelBuffer);
    self->_outputPixelBuffer = 0;
  }
  buffer = self->_errorRecoveryData.buffer;
  if (buffer)
  {
    CFRelease(buffer);
    self->_errorRecoveryData.buffer = 0;
  }
  outputPixelBufferPool = self->_outputPixelBufferPool;
  if (outputPixelBufferPool)
  {
    CVPixelBufferPoolRelease(outputPixelBufferPool);
    self->_outputPixelBufferPool = 0;
  }
  self->_hasBeenSetup = 0;
}

- (void)_oneTimeSetupUsingAttributes:(id)a3 fallbackPixelBuffer:(__CVBuffer *)a4
{
  -[GNRProcessor _createResourcesUsingAttributes:pixelBuffer:](self, "_createResourcesUsingAttributes:pixelBuffer:", a3, a4);
  if (self->_aggregateErr)
    self->_aggregateErr = 11;
  else
    self->_hasBeenSetup = 1;
}

- (void)_selectErrorRecoveryFrame
{
  int *p_cntBracketSampleBuffers;
  opaqueCMSampleBuffer **bracketSampleBuffers;
  opaqueCMSampleBuffer *v5;
  uint64_t v6;
  opaqueCMSampleBuffer *v7;
  opaqueCMSampleBuffer *buffer;
  int v9;
  int fusionAlgo;
  int v11;
  uint64_t v12;
  BOOL *p_is_long;
  opaqueCMSampleBuffer *v14;
  opaqueCMSampleBuffer *v15;
  opaqueCMSampleBuffer *prebracketedEV0SampleBuffer;
  opaqueCMSampleBuffer *v17;
  opaqueCMSampleBuffer *v18;
  opaqueCMSampleBuffer *v19;
  opaqueCMSampleBuffer *v20;
  frameProperties_t *p_prebracketedProperties;
  opaqueCMSampleBuffer *v22;

  p_cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  self->_errorRecoveryData.buffer = 0;
  if (self->_cntBracketSampleBuffers < 1)
    return;
  bracketSampleBuffers = self->_bracketSampleBuffers;
  v5 = self->_bracketSampleBuffers[0];
  self->_errorRecoveryData.buffer = v5;
  if (v5)
    CFRetain(v5);
  memcpy(&self->_errorRecoveryData.info.averageFocusScore, self->_bracketProperties, 0x1110uLL);
  if (*((_BYTE *)p_cntBracketSampleBuffers + 317))
  {
    v6 = p_cntBracketSampleBuffers[81];
    if ((v6 & 0x80000000) == 0)
    {
      v7 = bracketSampleBuffers[v6];
      if (v7)
      {
        if (self->_aggregateErr)
        {
          buffer = self->_errorRecoveryData.buffer;
          self->_errorRecoveryData.buffer = v7;
          CFRetain(v7);
          if (buffer)
            CFRelease(buffer);
          v9 = p_cntBracketSampleBuffers[81];
LABEL_37:
          p_prebracketedProperties = (frameProperties_t *)((char *)self->_bracketProperties + 4368 * v9);
          goto LABEL_38;
        }
      }
    }
  }
  fusionAlgo = self->_fusionAlgo;
  switch(fusionAlgo)
  {
    case 1:
      prebracketedEV0SampleBuffer = self->_prebracketedEV0SampleBuffer;
      v17 = self->_errorRecoveryData.buffer;
      if (!prebracketedEV0SampleBuffer)
      {
        v22 = bracketSampleBuffers[p_cntBracketSampleBuffers[78]];
        self->_errorRecoveryData.buffer = v22;
        if (v22)
          CFRetain(v22);
        if (v17)
          CFRelease(v17);
        v9 = p_cntBracketSampleBuffers[78];
        goto LABEL_37;
      }
      self->_errorRecoveryData.buffer = prebracketedEV0SampleBuffer;
      CFRetain(prebracketedEV0SampleBuffer);
      if (v17)
      {
        v18 = v17;
LABEL_29:
        CFRelease(v18);
      }
LABEL_30:
      p_prebracketedProperties = &self->_prebracketedProperties;
LABEL_38:
      memcpy(&self->_errorRecoveryData.info.averageFocusScore, p_prebracketedProperties, 0x1110uLL);
      return;
    case 3:
      v19 = self->_prebracketedEV0SampleBuffer;
      if (!v19)
        return;
      v20 = self->_errorRecoveryData.buffer;
      self->_errorRecoveryData.buffer = v19;
      CFRetain(v19);
      if (v20)
      {
        v18 = v20;
        goto LABEL_29;
      }
      goto LABEL_30;
    case 2:
      v11 = *p_cntBracketSampleBuffers;
      if (*p_cntBracketSampleBuffers >= 1)
      {
        v12 = 0;
        p_is_long = &self->_bracketProperties[0].exposureParams.is_long;
        do
        {
          if (*p_is_long)
          {
            v14 = self->_errorRecoveryData.buffer;
            v15 = bracketSampleBuffers[v12];
            self->_errorRecoveryData.buffer = v15;
            if (v15)
              CFRetain(v15);
            if (v14)
              CFRelease(v14);
            memcpy(&self->_errorRecoveryData.info.averageFocusScore, p_is_long - 52, 0x1110uLL);
            v11 = *p_cntBracketSampleBuffers;
          }
          p_is_long += 4368;
          ++v12;
        }
        while (v12 < v11);
      }
      break;
  }
}

- (void)setReferenceFrameSelectionHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 35464);
}

- (void)onOutput:(id)a3
{
  void *v4;
  id callback;

  v4 = (void *)MEMORY[0x219A0603C](a3, a2);
  callback = self->_callback;
  self->_callback = v4;

}

- (void)finishScheduling
{
  -[FigMetalContext waitForSchedule](self->_metal, "waitForSchedule");
}

- (int)setValue:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE11E30]))
  {
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE11E38]))
    {
      v9 = -[GNRProcessor setPropertyForReferenceFrameIndex:](self, "setPropertyForReferenceFrameIndex:", objc_msgSend(v6, "intValue"));
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDDCF70]))
      {
        -[GNRProcessor setAllowModifyingInputBuffers:](self, "setAllowModifyingInputBuffers:", objc_msgSend(v6, "BOOLValue"));
        v8 = 0;
        goto LABEL_13;
      }
      if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE11E40]))
      {
        v9 = -[GNRProcessor _shortFramesDelivered](self, "_shortFramesDelivered");
      }
      else
      {
        if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE11E18]))
        {
          -[GNRProcessor setEnforceReferenceFrameIndex:](self, "setEnforceReferenceFrameIndex:", objc_msgSend(v6, "BOOLValue"));
          v8 = 0;
          goto LABEL_13;
        }
        v9 = FigSignalErrorAt();
      }
    }
    v8 = v9;
    goto LABEL_13;
  }
  -[GNRProcessor setProcessingType:](self, "setProcessingType:", objc_msgSend(v6, "intValue"));
  v8 = 0;
LABEL_13:

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[GNRProcessor resetState](self, "resetState");
  -[GNRProcessor purgeResources](self, "purgeResources");
  v3.receiver = self;
  v3.super_class = (Class)GNRProcessor;
  -[GNRProcessor dealloc](&v3, sel_dealloc);
}

- (int)getOptions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  if (v21
    && self->_tuningParams
    && self->_tuningParamsPlist
    && (objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("DefaultSensorIDs")),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = v6;
      v20 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v9, v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "allKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "containsObject:", v12) & 1) == 0)
          {
            objc_msgSend(v11, "allKeys");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
            v15 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v15;
          }
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("GNRParameters"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            get_tuning_for_sensor_id(v12, v17, self->_tuningParams, self->_tuningParamsPlist);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
    }

    v18 = 0;
  }
  else
  {
    v18 = -1;
  }

  return v18;
}

- (void)EndKTraceEventForBracketFrame:(id)a3 ktraceCode:(int)a4
{
  id v6;
  void *v7;
  _DWORD *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  int v13;
  uint64_t processingType;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[7];
  int v19;

  v6 = a3;
  v7 = v6;
  v8 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48])
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11C58]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11BF8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    if (*v8)
    {
      processingType = self->_processingType;
      v15 = v13;
      -[FigMetalContext commandQueue](self->_metal, "commandQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "commandBuffer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setLabel:", CFSTR("KTRACE_END_MTL"));
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __57__GNRProcessor_EndKTraceEventForBracketFrame_ktraceCode___block_invoke;
      v18[3] = &__block_descriptor_60_e28_v16__0___MTLCommandBuffer__8l;
      v19 = a4;
      v18[4] = processingType;
      v18[5] = v15;
      v18[6] = (int)v11;
      objc_msgSend(v17, "addCompletedHandler:", v18);
      objc_msgSend(v17, "commit");

    }
  }

}

- (void)_createResourcesUsingAttributes:(id)a3 pixelBuffer:(__CVBuffer *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  void *v15;
  int PixelBufferPool;
  DenoiseFusePipeline *denoiseFusePipeline;
  int v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = *MEMORY[0x24BDC5708];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDC5708]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDC5650];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDC5650]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (!a4)
    {
      v15 = v6;
LABEL_22:
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_23;
    }
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, 0);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v6);
    if (v8)
    {
      if (v11)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", WidthOfPlane);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v7);

      if (v11)
        goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", HeightOfPlane);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, v9);

    goto LABEL_9;
  }
  WidthOfPlane = (int)objc_msgSend(v8, "intValue");
  HeightOfPlane = (int)objc_msgSend(v11, "intValue");
  v15 = v6;
LABEL_10:
  if (!WidthOfPlane || !HeightOfPlane)
    goto LABEL_22;
  PixelBufferPool = CreatePixelBufferPool();
  if (!self->_aggregateErr && PixelBufferPool)
  {
    self->_aggregateErr = 14;
    goto LABEL_22;
  }
  if (PixelBufferPool)
    goto LABEL_22;
  denoiseFusePipeline = self->_denoiseFusePipeline;
  if (denoiseFusePipeline)
  {
    v18 = -[DenoiseFusePipeline resizeBuffersIfNeededWithWidth:height:](denoiseFusePipeline, "resizeBuffersIfNeededWithWidth:height:", WidthOfPlane, HeightOfPlane);
    if (self->_aggregateErr || !v18)
    {
      if (!v18)
        goto LABEL_23;
    }
    else
    {
      self->_aggregateErr = 16;
    }
    goto LABEL_22;
  }
LABEL_23:

}

uint64_t __32__GNRProcessor_initWithOptions___block_invoke(uint64_t result, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  uint64_t v6;

  if (a2 == 2)
  {
    v6 = *(_QWORD *)(result + 32);
    v5 = (unsigned int *)(v6 + 4368 * *(int *)(v6 + 35448) + 17668);
    result = *(_QWORD *)(v6 + 35464);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *v5);
  }
  else if (a2 == 3)
  {
    v3 = *(_QWORD *)(result + 32);
    v4 = 13268;
    if (a3 == 1)
      v4 = 8884;
    v5 = (unsigned int *)(v3 + v4);
    result = *(_QWORD *)(v3 + 35464);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *v5);
  }
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<FigSampleBufferProcessor_GNR %p>"), self);
}

- (void)prepareForProcessingPixelBuffersWithAttributes:(id)a3
{
  -[GNRProcessor _oneTimeSetupUsingAttributes:fallbackPixelBuffer:](self, "_oneTimeSetupUsingAttributes:fallbackPixelBuffer:", a3, 0);
}

- (int)copyValue:(void *)a3 forProperty:(id)a4
{
  return FigSignalErrorAt();
}

- (int)setPropertyForReferenceFrameIndex:(int)a3
{
  int *p_cntBracketSampleBuffers;
  uint64_t cntBracketSampleBuffers;
  uint64_t v7;
  unsigned __int16 *v8;
  BOOL *p_registrationComplete;
  int *p_bracketedCaptureSequenceNumber;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL *v14;
  uint64_t v15;
  int v16;
  BOOL v17;

  p_cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  self->_referenceFrameIndex = -1;
  cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
  if ((int)cntBracketSampleBuffers < 1)
  {
    v11 = 0xFFFFFFFFLL;
    if (self->_fusionAlgo != 3)
      goto LABEL_18;
LABEL_12:
    -[DenoiseFusePipeline setForceHDRFusionReferenceFrame:](self->_denoiseFusePipeline, "setForceHDRFusionReferenceFrame:", v11);
    goto LABEL_23;
  }
  v7 = 0;
  v8 = &self->_bracketProperties[1].ltmCurves.ltmLut[30];
  p_registrationComplete = &self->_bracketProperties[0].registrationComplete;
  p_bracketedCaptureSequenceNumber = &self->_bracketProperties[0].bracketedCaptureSequenceNumber;
  v11 = 0xFFFFFFFFLL;
  do
  {
    if (*p_bracketedCaptureSequenceNumber == a3)
    {
      self->_referenceFrameIndex = v7;
      v11 = v7;
    }
    p_bracketedCaptureSequenceNumber += 1092;
    ++v7;
  }
  while (cntBracketSampleBuffers != v7);
  if (self->_fusionAlgo == 3)
    goto LABEL_12;
  if ((v11 & 0x80000000) != 0 || (_DWORD)v11 == self->_registrationReferenceFrameIndex)
    goto LABEL_18;
  if (cntBracketSampleBuffers >= 2)
  {
    v12 = cntBracketSampleBuffers & 0xFFFFFFFE;
    v13 = v12;
    do
    {
      *p_registrationComplete = 0;
      *(_BYTE *)v8 = 0;
      v8 += 4368;
      p_registrationComplete += 8736;
      v13 -= 2;
    }
    while (v13);
    if (v12 == cntBracketSampleBuffers)
      goto LABEL_18;
  }
  else
  {
    v12 = 0;
  }
  v14 = &self->_bracketProperties[0].registrationComplete + 4368 * v12;
  v15 = cntBracketSampleBuffers - v12;
  do
  {
    *v14 = 0;
    v14 += 4368;
    --v15;
  }
  while (v15);
LABEL_18:
  self->_registrationReferenceFrameIndex = v11;
  v16 = -[GNRProcessor _registerImages:](self, "_registerImages:", 0);
  if (self->_aggregateErr)
    v17 = 1;
  else
    v17 = v16 == 0;
  if (!v17)
    self->_aggregateErr = 1;
LABEL_23:
  if (p_cntBracketSampleBuffers[81] < 0)
    return FigSignalErrorAt();
  else
    return 0;
}

- (float)_computeFusionEffectiveness:(unsigned int)a3
{
  return 1.0
       / sqrtf((float)(self->_deviceTuningParams->fusion->temporalFusionEffectivenessPerBracket * (float)(a3 - 1)) + 1.0);
}

- (int)_multiFrameProcessing
{
  int *p_cntBracketSampleBuffers;
  int v4;
  int fusionAlgo;
  int v6;
  _DWORD *v7;
  int v8;
  int aggregateErr;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[7];
  int v22;

  p_cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  if (-[GNRProcessor isTele](self, "isTele"))
    v4 = 822150540;
  else
    v4 = 822149836;
  fusionAlgo = self->_fusionAlgo;
  v6 = p_cntBracketSampleBuffers[78];
  v7 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (fusionAlgo == 3)
  {
    if (v6 < 0)
      goto LABEL_34;
  }
  else if ((v6 & 0x80000000) == 0
         || (v6 = -[GNRProcessor _getSharpestFrame](self, "_getSharpestFrame"),
             p_cntBracketSampleBuffers[78] = v6,
             fusionAlgo = self->_fusionAlgo,
             fusionAlgo != 3))
  {
    if (fusionAlgo == 1)
    {
      v10 = *((_QWORD *)p_cntBracketSampleBuffers + 41);
      if (v10)
        (*(void (**)(_QWORD, _QWORD))(v10 + 16))(*((_QWORD *)p_cntBracketSampleBuffers + 41), *((unsigned int *)&self->_bracketProperties[0].bracketedCaptureSequenceNumber + 1092 * v6));
    }
    goto LABEL_16;
  }
  v8 = LOBYTE(self->_evmProperties.ltmCurves.ltmLut[30]);
  if (LOBYTE(self->_evmProperties.ltmCurves.ltmLut[30]))
    v8 = LOBYTE(self->_prebracketedProperties.ltmCurves.ltmLut[30]);
  aggregateErr = self->_aggregateErr;
  if (!(aggregateErr | v8))
  {
    self->_aggregateErr = 17;
LABEL_34:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_35;
  }
  if (aggregateErr)
    goto LABEL_34;
LABEL_16:
  if (*((_BYTE *)p_cntBracketSampleBuffers + 316))
    -[GNRProcessor finishPendingProcessing](self, "finishPendingProcessing");
  v11 = -[GNRProcessor _registerImages:](self, "_registerImages:", 1);
  v12 = self->_aggregateErr;
  if (!v12 && v11)
  {
    self->_aggregateErr = 1;
    goto LABEL_34;
  }
  if (v12)
    goto LABEL_34;
  v13 = -[GNRProcessor _computeRegistrationOrder](self, "_computeRegistrationOrder");
  v14 = self->_aggregateErr;
  if (!v14 && v13)
  {
    self->_aggregateErr = 15;
    goto LABEL_34;
  }
  if (v14)
    goto LABEL_34;
  if (*v7 == 1)
    kdebug_trace();
  v15 = -[GNRProcessor _fuseImages:](self, "_fuseImages:", self->_outputPixelBuffer);
  v16 = self->_aggregateErr;
  if (!v16 && v15)
  {
    self->_aggregateErr = 6;
    goto LABEL_34;
  }
  if (v16)
    goto LABEL_34;
LABEL_35:
  if (*v7)
  {
    v17 = *p_cntBracketSampleBuffers;
    objc_msgSend(*((id *)p_cntBracketSampleBuffers + 35), "commandQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "commandBuffer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setLabel:", CFSTR("KTRACE_END_MTL"));
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __37__GNRProcessor__multiFrameProcessing__block_invoke;
    v21[3] = &__block_descriptor_60_e28_v16__0___MTLCommandBuffer__8l;
    v22 = v4;
    v21[5] = 0;
    v21[6] = 0;
    v21[4] = v17;
    objc_msgSend(v19, "addCompletedHandler:", v21);
    objc_msgSend(v19, "commit");

  }
  return 0;
}

void __37__GNRProcessor__multiFrameProcessing__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
    if (*MEMORY[0x24BDC0B48] != 1)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v2, "status");
  if (*MEMORY[0x24BDC0B48] == 1)
LABEL_5:
    kdebug_trace();
LABEL_6:

}

- (int)_fuseImages:(__CVBuffer *)a3
{
  double *v3;
  int result;
  int v5;

  v3 = (double *)(&self->_bracketProperties[0].isPreBracketedFrame + 4368 * self->_registrationReferenceFrameIndex);
  result = -[DenoiseFusePipeline fuseImages:config:properties:pbEV0Properties:tuningParams:validBufferRect:](self->_denoiseFusePipeline, "fuseImages:config:properties:pbEV0Properties:tuningParams:validBufferRect:", a3, &self->_fusionConf, v3[8], v3[9], v3[10], v3[11]);
  v5 = result;
  if (result)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v5;
  }
  return result;
}

- (int)_getSharpestFrame
{
  uint64_t cntBracketSampleBuffers;
  uint64_t v3;
  int64_t *p_averageFocusScore;
  int64_t v5;
  int result;
  BOOL v7;
  uint64_t v8;
  int64_t *v9;
  int64_t v10;
  BOOL v11;

  cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
  if ((int)cntBracketSampleBuffers < 1)
    return -1;
  if (self->_fusionAlgo == 2)
  {
    v3 = 0;
    p_averageFocusScore = &self->_bracketProperties[0].averageFocusScore;
    v5 = 0x8000000000000000;
    result = -1;
    do
    {
      if (!*((_BYTE *)p_averageFocusScore + 44))
      {
        v7 = v5 < *p_averageFocusScore;
        if (v5 <= *p_averageFocusScore)
          v5 = *p_averageFocusScore;
        if (v7)
          result = v3;
      }
      ++v3;
      p_averageFocusScore += 546;
    }
    while (cntBracketSampleBuffers != v3);
  }
  else
  {
    v8 = 0;
    v9 = &self->_bracketProperties[0].averageFocusScore;
    v10 = 0x8000000000000000;
    result = -1;
    do
    {
      v11 = v10 < *v9;
      if (v10 <= *v9)
        v10 = *v9;
      if (v11)
        result = v8;
      ++v8;
      v9 += 546;
    }
    while (cntBracketSampleBuffers != v8);
  }
  return result;
}

- (int)_computeRegistrationOrder
{
  int *p_cntBracketSampleBuffers;
  int fusionAlgo;
  uint64_t v4;
  uint64_t v5;
  float *p_original_exposure_bias;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  BOOL *p_is_long;
  int v12;
  int *p_longest;
  uint64_t v14;
  unsigned __int16 *v15;
  __int128 v16;
  __int128 v17;

  p_cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  fusionAlgo = self->_fusionAlgo;
  if (fusionAlgo == 3)
  {
    *(_DWORD *)&self->_anon_8970[200] = -1;
    *(_QWORD *)&self->_anon_8970[192] = -1;
    v4 = *p_cntBracketSampleBuffers;
    if ((int)v4 >= 1)
    {
      v5 = 0;
      p_original_exposure_bias = &self->_bracketProperties[0].exposureParams.original_exposure_bias;
      v7 = -1;
      v8 = -1;
      v9 = -1;
      do
      {
        if (*p_original_exposure_bias < 0.0)
        {
          *(_DWORD *)&self->_anon_8970[192] = v5;
          v9 = v5;
        }
        else if (*p_original_exposure_bias == 0.0)
        {
          *(_DWORD *)&self->_anon_8970[196] = v5;
          v8 = v5;
        }
        else if (*p_original_exposure_bias > 0.0)
        {
          *(_DWORD *)&self->_anon_8970[200] = v5;
          v7 = v5;
        }
        ++v5;
        p_original_exposure_bias += 1092;
      }
      while (v4 != v5);
      if ((v9 & 0x80000000) == 0
        && (v8 & 0x80000000) == 0
        && (v7 & 0x80000000) == 0
        && self->_registrationReferenceFrameIndex == v9)
      {
LABEL_23:
        p_longest = &self->_fusionConf.longest;
        v14 = v4;
        v15 = &self->_bracketProperties[0].ltmCurves.ltmLut[6];
        do
        {
          v16 = *(_OWORD *)v15;
          v17 = *((_OWORD *)v15 + 2);
          *((_OWORD *)p_longest + 1) = *((_OWORD *)v15 + 1);
          *((_OWORD *)p_longest + 2) = v17;
          *(_OWORD *)p_longest = v16;
          p_longest += 12;
          v15 += 2184;
          --v14;
        }
        while (v14);
        goto LABEL_25;
      }
    }
  }
  else
  {
    *(_DWORD *)&self->_anon_8970[188] = -1;
    v4 = *p_cntBracketSampleBuffers;
    if ((int)v4 < 1)
    {
      if (fusionAlgo != 2)
      {
LABEL_25:
        *(_DWORD *)&self->_anon_8970[184] = self->_registrationReferenceFrameIndex;
        self->_anon_8970[180] = self->_deviceTuningParams->fusion->fixPyramidAlignment;
        *(_DWORD *)&self->_anon_8970[176] = v4;
        self->_fusionConf.fusionAlgo = fusionAlgo;
        return 0;
      }
    }
    else
    {
      v10 = 0;
      p_is_long = &self->_bracketProperties[0].exposureParams.is_long;
      v12 = -1;
      do
      {
        if (*p_is_long)
        {
          *(_DWORD *)&self->_anon_8970[188] = v10;
          v12 = v10;
        }
        p_is_long += 4368;
        ++v10;
      }
      while (v4 != v10);
      if (fusionAlgo != 2 || (v12 & 0x80000000) == 0)
        goto LABEL_23;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_shortFramesDelivered
{
  int *p_registrationReferenceFrameIndex;
  int registrationReferenceFrameIndex;
  int v5;

  if (self->_fusionAlgo == 2)
  {
    p_registrationReferenceFrameIndex = &self->_registrationReferenceFrameIndex;
    registrationReferenceFrameIndex = self->_registrationReferenceFrameIndex;
    if (registrationReferenceFrameIndex < 0)
      registrationReferenceFrameIndex = -[GNRProcessor _getSharpestFrame](self, "_getSharpestFrame");
    *p_registrationReferenceFrameIndex = registrationReferenceFrameIndex;
    v5 = -[GNRProcessor _registerImages:](self, "_registerImages:", 0);
    if (!self->_aggregateErr)
    {
      if (v5)
        self->_aggregateErr = 1;
    }
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)processingType
{
  return self->_processingType;
}

- (BOOL)allowModifyingInputBuffers
{
  return self->_allowModifyingInputBuffers;
}

- (void)setAllowModifyingInputBuffers:(BOOL)a3
{
  self->_allowModifyingInputBuffers = a3;
}

- (int)referenceFrameIndex
{
  return self->_referenceFrameIndex;
}

- (void)setReferenceFrameIndex:(int)a3
{
  self->_referenceFrameIndex = a3;
}

- (BOOL)enforceReferenceFrameIndex
{
  return self->_enforceReferenceFrameIndex;
}

- (void)setEnforceReferenceFrameIndex:(BOOL)a3
{
  self->_enforceReferenceFrameIndex = a3;
}

- (id)referenceFrameSelectionHandlerBlock
{
  return self->_referenceFrameSelectionHandlerBlock;
}

@end
