@implementation DenoiseFusePipeline

- (void)releaseAllBuffers
{
  __CVBuffer *similarityMap;
  __CVBuffer *gain;
  MTLBuffer *scratchBuffer;
  __CVBuffer *v6;
  InverseLTMBuffers *v7;
  __CVBuffer *v8;
  InverseLTMBuffers *v9;
  __CVBuffer *v10;
  InverseLTMBuffers *v11;
  __CVBuffer *v12;
  InverseLTMBuffers *v13;
  PyramidStorage *v14;
  PyramidStorage *v15;
  PyramidStorage *v16;
  PyramidStorage *v17;

  -[FigMetalContext waitForIdle](self->_metal, "waitForIdle");
  similarityMap = self->_similarityMap;
  if (similarityMap)
  {
    CFRelease(similarityMap);
    self->_similarityMap = 0;
  }
  gain = self->_gain;
  if (gain)
  {
    CFRelease(gain);
    self->_gain = 0;
  }
  scratchBuffer = self->_scratchBuffer;
  self->_scratchBuffer = 0;

  if (self->_onlySingleImageDenoising)
  {
    v6 = self->_denoisedAllocInternally[0];
    if (!v6)
      goto LABEL_8;
    goto LABEL_7;
  }
  -[BilateralGrid releaseResources](self->_bilateralGrid, "releaseResources");
  -[RegDense releaseResources](self->_regDense, "releaseResources");
  v6 = self->_denoisedAllocInternally[0];
  if (v6)
  {
LABEL_7:
    CFRelease(v6);
    self->_denoisedAllocInternally[0] = 0;
  }
LABEL_8:
  v7 = self->_inverseLTMBuffers[0];
  self->_inverseLTMBuffers[0] = 0;

  v8 = self->_denoisedAllocInternally[1];
  if (v8)
  {
    CFRelease(v8);
    self->_denoisedAllocInternally[1] = 0;
  }
  v9 = self->_inverseLTMBuffers[1];
  self->_inverseLTMBuffers[1] = 0;

  v10 = self->_denoisedAllocInternally[2];
  if (v10)
  {
    CFRelease(v10);
    self->_denoisedAllocInternally[2] = 0;
  }
  v11 = self->_inverseLTMBuffers[2];
  self->_inverseLTMBuffers[2] = 0;

  v12 = self->_denoisedAllocInternally[3];
  if (v12)
  {
    CFRelease(v12);
    self->_denoisedAllocInternally[3] = 0;
  }
  v13 = self->_inverseLTMBuffers[3];
  self->_inverseLTMBuffers[3] = 0;

  free(self->_morphology);
  self->_morphology = 0;
  -[AMBNRBuffers releaseBuffers](self->_ambnrBuffers[0], "releaseBuffers");
  v14 = self->_fusedBands[0];
  self->_fusedBands[0] = 0;

  v15 = self->_fusedDenoisedBands[0];
  self->_fusedDenoisedBands[0] = 0;

  -[AMBNRBuffers releaseBuffers](self->_ambnrBuffers[1], "releaseBuffers");
  v16 = self->_fusedBands[1];
  self->_fusedBands[1] = 0;

  v17 = self->_fusedDenoisedBands[1];
  self->_fusedDenoisedBands[1] = 0;

}

- (void)reset
{
  if (self->_resetAliasingForHDR)
  {
    -[PyramidStorage clearLevel:](self->_ambnrBuffers[1]->pyramid, "clearLevel:", 1);
    -[PyramidStorage clearLevel:](self->_ambnrBuffers[1]->laplacianPyramid, "clearLevel:", 1);
    self->_resetAliasingForHDR = 0;
  }
  -[NSMutableArray removeAllObjects](self->_recycledInputBuffers, "removeAllObjects");
  -[AMBNRBuffers releasePyramidsBottom](self->_ambnrBuffers[self->_pyrFormat], "releasePyramidsBottom");
  -[PyramidStorage clearLevel:](self->_fusedBands[self->_pyrFormat], "clearLevel:", 0);
  -[AMBNRBuffers releasePyramidsBottom](self->_ambnrBuffers[self->_pyrFormat], "releasePyramidsBottom");
  -[PyramidStorage clearLevel:](self->_fusedBands[self->_pyrFormat], "clearLevel:", 0);
  -[RegDense reset](self->_regDense, "reset");
  self->_currentFrame = 0;
  self->_denoisedAllocInternallyIndex = 0;
}

- (void)setForceHDRFusionReferenceFrame:(int)a3
{
  self->_forceHDRFusionReferenceFrame = a3;
}

- (int)denoiseFrame:(__CVBuffer *)a3 input:(__CVBuffer *)a4 exposure:(exposureParameters *)a5 tuningParams:(id)a6 highGainTuningParams:(id)a7 ltmCurves:(ltmCurves *)a8 recycleInput:(BOOL)a9
{
  id v15;
  id v16;
  void *v17;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  AMBNRBuffers **ambnrBuffers;
  AMBNRStage **ambnrStage;
  AMBNRBuffers *v22;
  uint64_t currentFrame;
  InverseLTMBuffers *v24;
  void *v25;
  int v26;
  uint64_t v28;
  __CVBuffer *v29;

  v29 = a4;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (!a4)
    goto LABEL_23;
  if (self->_currentFrame >= 4)
    goto LABEL_23;
  if ((v16 != 0) != (a8 != 0))
    goto LABEL_23;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, 0);
  if ((WidthOfPlane & 0xF) != 0
    || -[DenoiseFusePipeline resizeBuffersIfNeededWithWidth:height:](self, "resizeBuffersIfNeededWithWidth:height:", WidthOfPlane, HeightOfPlane))
  {
    goto LABEL_23;
  }
  if (!self->_fusionAlgo)
    goto LABEL_9;
  if (a3)
  {
LABEL_23:
    fig_log_get_emitter();
    FigDebugAssert3();
    v26 = FigSignalErrorAt();
    goto LABEL_22;
  }
  a3 = -[DenoiseFusePipeline getDenoisingOutputBuffer:](self, "getDenoisingOutputBuffer:", a4);
LABEL_9:
  if (!a3)
    goto LABEL_23;
  ambnrBuffers = self->_ambnrBuffers;
  if (-[PyramidStorage setPixelBuffer:level:metal:](self->_ambnrBuffers[self->_pyrFormat]->pyramid, "setPixelBuffer:level:metal:", a4, 0, self->_metal))
  {
    goto LABEL_23;
  }
  if (-[PyramidStorage setPixelBuffer:level:texUsage:metal:](ambnrBuffers[self->_pyrFormat]->denoisedPyramid[self->_currentFrame], "setPixelBuffer:level:texUsage:metal:", a3, 0, 23, self->_metal))
  {
    goto LABEL_23;
  }
  ambnrStage = self->_ambnrStage;
  v22 = ambnrBuffers[self->_pyrFormat];
  if (-[AMBNRStage setResourcesWithPyramid:laplacianPyramid:denoisedPyramid:](self->_ambnrStage[self->_currentFrame], "setResourcesWithPyramid:laplacianPyramid:denoisedPyramid:", v22->pyramid, v22->laplacianPyramid, v22->denoisedPyramid[self->_currentFrame]))
  {
    goto LABEL_23;
  }
  if (-[PyramidStage useM2M](ambnrStage[self->_currentFrame]->_pyramidStage, "useM2M"))
    -[FigMetalContext waitForIdle](self->_metal, "waitForIdle");
  if (a8)
  {
    -[InverseLTMBuffers setToneCurves:](self->_inverseLTMBuffers[self->_currentFrame], "setToneCurves:", a8);
    currentFrame = self->_currentFrame;
    v24 = self->_inverseLTMBuffers[currentFrame];
  }
  else
  {
    v24 = 0;
    currentFrame = self->_currentFrame;
  }
  LOBYTE(v28) = self->_fusionAlgo == 3;
  if (-[AMBNRStage run:metalContext:exposure:tuningParams:highGainTuningParams:ltmBuffers:correctBias:](ambnrStage[currentFrame], "run:metalContext:exposure:tuningParams:highGainTuningParams:ltmBuffers:correctBias:", self->_gain, self->_metal, a5, v15, v17, v24, v28))
  {
    goto LABEL_23;
  }
  if (a9)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v29, "^{__CVBuffer=}");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_recycledInputBuffers, "addObject:", v25);

  }
  v26 = 0;
  ++self->_currentFrame;
LABEL_22:

  return v26;
}

- (void)setFusionReferenceSelectionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (int)resizeBuffersIfNeededWithWidth:(unint64_t)a3 height:(unint64_t)a4
{
  int v7;
  AMBNRBuffers **ambnrBuffers;
  PyramidStorage *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  MTLBuffer *v13;
  MTLBuffer *scratchBuffer;
  MTLBuffer *v15;
  MTLTexture *v16;
  MTLTexture *ltmChromaTex;
  MTLTexture *v18;
  MTLTexture *v19;
  MTLTexture *ltmLumaTex;
  int v21;
  _BOOL4 allowModifyingInputBuffers;
  AMBNRBuffers *v23;
  PyramidStorage *v24;
  MTLTexture *v25;
  PyramidStorage *v26;
  int pyrFormat;
  PyramidStorage *v28;
  PyramidStorage *v29;
  int v30;
  int v31;
  PyramidStorage *v32;
  int v33;
  PyramidStorage *v34;
  MTLBuffer *v35;
  int v36;
  AMBNRBuffers *v37;
  PyramidStorage *v38;
  MTLTexture *v39;
  MTLBuffer *v40;
  AMBNRBuffers *v41;
  MTLBuffer *v42;
  int v43;
  int v44;
  __CVBuffer *PixelBuffer;
  __CVBuffer *v46;
  InverseLTMBuffers *v47;
  InverseLTMBuffers *v48;
  InverseLTMBuffers *v49;
  InverseLTMBuffers *v50;
  InverseLTMBuffers *v51;
  InverseLTMBuffers *v52;
  InverseLTMBuffers *v53;
  InverseLTMBuffers *v54;
  int v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  PyramidStorage *v60;
  PyramidStorage *v61;
  PyramidStorage *v62;
  PyramidStorage *v63;
  PyramidStorage *v64;
  PyramidStorage *v65;
  __int128 v66;
  uint64_t v67;

  if (*(_OWORD *)&self->_lastWidth == __PAIR128__(a4, a3))
  {
    v7 = 0;
  }
  else
  {
    -[DenoiseFusePipeline releaseAllBuffers](self, "releaseAllBuffers");
    -[DenoiseFusePipeline reset](self, "reset");
    v7 = 1;
  }
  ambnrBuffers = self->_ambnrBuffers;
  v63 = self->_ambnrBuffers[0]->pyramid;
  v62 = self->_ambnrBuffers[0]->laplacianPyramid;
  v61 = self->_ambnrBuffers[0]->denoisedPyramid[self->_currentFrame];
  v9 = self->_ambnrBuffers[1]->pyramid;
  v64 = self->_ambnrBuffers[1]->laplacianPyramid;
  v65 = self->_ambnrBuffers[1]->denoisedPyramid[self->_currentFrame];
  v60 = v9;
  if (!self->_supportsHDR)
    goto LABEL_20;
  if ((v7 & 1) != 0 || !self->_scratchBuffer)
  {
    v10 = ((2 * (_DWORD)a3 + 63) & 0xFFFFFFC0) * (a4 + (a4 >> 1));
    v11 = -[RegDense computeScratchBufferOffsets](self->_regDense, "computeScratchBufferOffsets");
    if (v10 <= v11)
      v10 = v11;
    -[FigMetalContext device](self->_metal, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (MTLBuffer *)objc_msgSend(v12, "newBufferWithLength:options:", v10, 0);
    scratchBuffer = self->_scratchBuffer;
    self->_scratchBuffer = v13;

    v15 = self->_scratchBuffer;
    if (!v15)
      goto LABEL_66;
    -[FigMetalContext create2DTextureFromBuffer:offset:width:height:format:usage:](self->_metal, "create2DTextureFromBuffer:offset:width:height:format:usage:", v15, 0, a3 >> 1, a4 >> 1, 65, 23);
    v16 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    ltmChromaTex = self->_ltmChromaTex;
    self->_ltmChromaTex = v16;

    v18 = self->_ltmChromaTex;
    if (!v18
      || (-[FigMetalContext create2DTextureFromBuffer:offset:width:height:format:usage:](self->_metal, "create2DTextureFromBuffer:offset:width:height:format:usage:", self->_scratchBuffer, -[MTLTexture height](self->_ltmChromaTex, "height")* -[MTLTexture bufferBytesPerRow](v18, "bufferBytesPerRow"), a3, a4, 25, 23), v19 = (MTLTexture *)objc_claimAutoreleasedReturnValue(), ltmLumaTex = self->_ltmLumaTex, self->_ltmLumaTex = v19, ltmLumaTex, !self->_ltmLumaTex))
    {
LABEL_66:
      fig_log_get_emitter();
      v58 = v59;
      LODWORD(v57) = 0;
LABEL_67:
      FigDebugAssert3();
      v55 = FigSignalErrorAt();
      if (!v55)
        goto LABEL_60;
      goto LABEL_71;
    }
    v21 = -[RegDense allocateResourcesForWidth:height:scratchBuffer:](self->_regDense, "allocateResourcesForWidth:height:scratchBuffer:", a3, a4, self->_scratchBuffer);
    if (v21)
    {
      v55 = v21;
      fig_log_get_emitter();
      v58 = v59;
      LODWORD(v57) = v55;
      goto LABEL_70;
    }
    v67 = 0;
    v66 = xmmword_216F95F28;
    -[BilateralGrid allocateResourcesWithConfiguration:width:height:](self->_bilateralGrid, "allocateResourcesWithConfiguration:width:height:", &v66, a3, a4);
    if (!self->_supportsHDR)
    {
LABEL_20:
      v26 = v9;
      pyrFormat = self->_pyrFormat;
      v28 = v63;
      if (pyrFormat == 1)
        v28 = v26;
      v29 = v28;
      if (v29->pixelBuffer[1]
        || (v30 = +[AMBNRBuffers createAMBNRPyramidFromWidth:height:pyramid:metal:useHalfFloat:scratchBuffer:offset:](AMBNRBuffers, "createAMBNRPyramidFromWidth:height:pyramid:metal:useHalfFloat:scratchBuffer:offset:", a3, a4, v29, self->_metal, pyrFormat == 1, 0, 0)) == 0)
      {

        v31 = self->_pyrFormat;
        v32 = v62;
        if (v31 == 1)
          v32 = v64;
        v29 = v32;
        if (v29->pixelBuffer[1]
          || (v30 = +[AMBNRBuffers createAMBNRPyramidFromWidth:height:pyramid:metal:useHalfFloat:scratchBuffer:offset:](AMBNRBuffers, "createAMBNRPyramidFromWidth:height:pyramid:metal:useHalfFloat:scratchBuffer:offset:", a3, a4, v29, self->_metal, v31 == 1, 0, 0)) == 0)
        {

          v33 = self->_pyrFormat;
          v34 = v61;
          if (v33 == 1)
            v34 = v65;
          v29 = v34;
          if (v29->pixelBuffer[1]
            || (v30 = +[AMBNRBuffers createAMBNRPyramidFromWidth:height:pyramid:metal:useHalfFloat:scratchBuffer:offset:](AMBNRBuffers, "createAMBNRPyramidFromWidth:height:pyramid:metal:useHalfFloat:scratchBuffer:offset:", a3, a4, v29, self->_metal, v33 == 1, 0, 0)) == 0)
          {

            goto LABEL_55;
          }
        }
      }
      v55 = v30;
      fig_log_get_emitter();
      v58 = v59;
      LODWORD(v57) = v55;
      FigDebugAssert3();

LABEL_71:
      -[DenoiseFusePipeline releaseAllBuffers](self, "releaseAllBuffers", v57, v58);
      goto LABEL_60;
    }
  }
  allowModifyingInputBuffers = self->_allowModifyingInputBuffers;
  *(_QWORD *)&v66 = 0;
  if (allowModifyingInputBuffers && ((v23 = self->_ambnrBuffers[1], v9 == v23->pyramid) || v9 == v23->laplacianPyramid))
  {
    v35 = self->_scratchBuffer;
  }
  else
  {
    if (v9->textureY[1])
    {
      v24 = v64;
      v25 = v64->textureY[1];
      if (!allowModifyingInputBuffers)
        goto LABEL_40;
      goto LABEL_38;
    }
    v35 = 0;
  }
  v36 = +[AMBNRBuffers createAMBNRPyramidFromWidth:height:pyramid:metal:useHalfFloat:scratchBuffer:offset:](AMBNRBuffers, "createAMBNRPyramidFromWidth:height:pyramid:metal:useHalfFloat:scratchBuffer:offset:", a3, a4, v9, self->_metal, 1, v35, &v66);
  if (v36)
    goto LABEL_61;
  v36 = +[AMBNRBuffers bindFP16PyramidToU8:pyr_u8:metal:](AMBNRBuffers, "bindFP16PyramidToU8:pyr_u8:metal:", v9, v63, self->_metal);
  if (v36)
    goto LABEL_61;
  v24 = v64;
  v25 = v64->textureY[1];
  if (!allowModifyingInputBuffers)
    goto LABEL_40;
LABEL_38:
  v37 = self->_ambnrBuffers[1];
  if (v24 == v37->pyramid || v24 == v37->laplacianPyramid)
  {
    v40 = self->_scratchBuffer;
    goto LABEL_45;
  }
LABEL_40:
  if (v25)
  {
    v38 = v65;
    v39 = v65->textureY[1];
    if (!allowModifyingInputBuffers)
      goto LABEL_50;
    goto LABEL_48;
  }
  v40 = 0;
LABEL_45:
  v36 = +[AMBNRBuffers createAMBNRPyramidFromWidth:height:pyramid:metal:useHalfFloat:scratchBuffer:offset:](AMBNRBuffers, "createAMBNRPyramidFromWidth:height:pyramid:metal:useHalfFloat:scratchBuffer:offset:", a3, a4, v24, self->_metal, 1, v40, &v66);
  if (v36)
    goto LABEL_61;
  v36 = +[AMBNRBuffers bindFP16PyramidToU8:pyr_u8:metal:](AMBNRBuffers, "bindFP16PyramidToU8:pyr_u8:metal:", v24, v62, self->_metal);
  if (v36)
    goto LABEL_61;
  v38 = v65;
  v39 = v65->textureY[1];
  if (!allowModifyingInputBuffers)
    goto LABEL_50;
LABEL_48:
  v41 = self->_ambnrBuffers[1];
  if (v38 == v41->pyramid || v38 == v41->laplacianPyramid)
  {
    v42 = self->_scratchBuffer;
    goto LABEL_53;
  }
LABEL_50:
  if (v39)
    goto LABEL_55;
  v42 = 0;
  v38 = v65;
LABEL_53:
  v36 = +[AMBNRBuffers createAMBNRPyramidFromWidth:height:pyramid:metal:useHalfFloat:scratchBuffer:offset:](AMBNRBuffers, "createAMBNRPyramidFromWidth:height:pyramid:metal:useHalfFloat:scratchBuffer:offset:", a3, a4, v38, self->_metal, 1, v42, &v66);
  if (v36
    || (v36 = +[AMBNRBuffers bindFP16PyramidToU8:pyr_u8:metal:](AMBNRBuffers, "bindFP16PyramidToU8:pyr_u8:metal:", v38, v61, self->_metal)) != 0)
  {
LABEL_61:
    v55 = v36;
    fig_log_get_emitter();
    v58 = v59;
    LODWORD(v57) = v55;
LABEL_70:
    FigDebugAssert3();
    goto LABEL_71;
  }
LABEL_55:
  objc_storeStrong((id *)&self->_fusedBands[self->_pyrFormat], ambnrBuffers[self->_pyrFormat]->pyramid);
  objc_storeStrong((id *)&self->_fusedDenoisedBands[self->_pyrFormat], ambnrBuffers[self->_pyrFormat]->laplacianPyramid);
  v43 = -[MTLTexture width](self->_fusedBands[self->_pyrFormat]->textureY[3], "width");
  v44 = -[MTLTexture height](self->_fusedBands[self->_pyrFormat]->textureY[3], "height");
  -[MTLTexture width](self->_fusedBands[self->_pyrFormat]->textureY[1], "width");
  -[MTLTexture height](self->_fusedBands[self->_pyrFormat]->textureY[1], "height");
  if (v7)
  {
    PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
    self->_similarityMap = PixelBuffer;
    if (PixelBuffer)
    {
      v46 = (__CVBuffer *)CreatePixelBuffer();
      self->_gain = v46;
      if (v46)
      {
        self->_morphology = (char *)malloc_type_malloc(v43 * v44, 0x100004077774924uLL);
        v47 = -[InverseLTMBuffers initWithMetal:]([InverseLTMBuffers alloc], "initWithMetal:", self->_metal);
        v48 = self->_inverseLTMBuffers[0];
        self->_inverseLTMBuffers[0] = v47;

        v49 = -[InverseLTMBuffers initWithMetal:]([InverseLTMBuffers alloc], "initWithMetal:", self->_metal);
        v50 = self->_inverseLTMBuffers[1];
        self->_inverseLTMBuffers[1] = v49;

        v51 = -[InverseLTMBuffers initWithMetal:]([InverseLTMBuffers alloc], "initWithMetal:", self->_metal);
        v52 = self->_inverseLTMBuffers[2];
        self->_inverseLTMBuffers[2] = v51;

        v53 = -[InverseLTMBuffers initWithMetal:]([InverseLTMBuffers alloc], "initWithMetal:", self->_metal);
        v54 = self->_inverseLTMBuffers[3];
        self->_inverseLTMBuffers[3] = v53;

        goto LABEL_59;
      }
    }
    fig_log_get_emitter();
    v58 = v59;
    LODWORD(v57) = 0;
    goto LABEL_67;
  }
LABEL_59:
  v55 = 0;
  self->_lastWidth = a3;
  self->_lastHeight = a4;
LABEL_60:

  return v55;
}

- (void)setSidecarWriter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!self->_onlySingleImageDenoising)
  {
    -[FusionRemixStage setSidecarWriter:](self->_fusionRemixStage, "setSidecarWriter:", v4);
    v4 = v5;
  }
  objc_storeWeak((id *)&self->_sidecarWriter, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fusionReferenceSelectionBlock, 0);
  objc_destroyWeak((id *)&self->_sidecarWriter);
  objc_storeStrong((id *)&self->_inverseLTMBuffers[3], 0);
  objc_storeStrong((id *)&self->_inverseLTMBuffers[2], 0);
  objc_storeStrong((id *)&self->_inverseLTMBuffers[1], 0);
  objc_storeStrong((id *)self->_inverseLTMBuffers, 0);
  objc_storeStrong((id *)&self->_ltmChromaTex, 0);
  objc_storeStrong((id *)&self->_ltmLumaTex, 0);
  objc_storeStrong((id *)&self->_scratchBuffer, 0);
  objc_storeStrong((id *)&self->_regDense, 0);
  objc_storeStrong((id *)&self->_bilateralGrid, 0);
  objc_storeStrong((id *)&self->_recycledInputBuffers, 0);
  objc_storeStrong((id *)&self->_fusedDenoisedBands[1], 0);
  objc_storeStrong((id *)self->_fusedDenoisedBands, 0);
  objc_storeStrong((id *)&self->_fusedBands[1], 0);
  objc_storeStrong((id *)self->_fusedBands, 0);
  objc_storeStrong((id *)&self->_fusionRemixStage, 0);
  objc_storeStrong((id *)&self->_ambnrBuffers[1], 0);
  objc_storeStrong((id *)self->_ambnrBuffers, 0);
  objc_storeStrong((id *)&self->_ambnrStage[3], 0);
  objc_storeStrong((id *)&self->_ambnrStage[2], 0);
  objc_storeStrong((id *)&self->_ambnrStage[1], 0);
  objc_storeStrong((id *)self->_ambnrStage, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (int)setFusionMode:(int)a3
{
  self->_fusionAlgo = a3;
  if (a3 >= 3)
  {
    if (a3 == 3)
    {
      self->_pyrFormat = 1;
      return 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
  }
  else
  {
    self->_pyrFormat = 0;
    return 0;
  }
}

- (DenoiseFusePipeline)initWithContext:(id)a3 supportsHDR:(BOOL)a4 onlySingleImageDenoising:(BOOL)a5
{
  id v9;
  DenoiseFusePipeline *v10;
  DenoiseFusePipeline *v11;
  AMBNRStage *v12;
  AMBNRStage *v13;
  AMBNRStage *v14;
  AMBNRStage *v15;
  AMBNRStage *v16;
  AMBNRStage *v17;
  AMBNRStage *v18;
  AMBNRStage *v19;
  FusionRemixStage *v20;
  FusionRemixStage *fusionRemixStage;
  AMBNRBuffers *v22;
  AMBNRBuffers *v23;
  PyramidStorage *v24;
  PyramidStorage *v25;
  AMBNRBuffers *v26;
  AMBNRBuffers *v27;
  PyramidStorage *v28;
  PyramidStorage *v29;
  BilateralGrid *v30;
  BilateralGrid *bilateralGrid;
  RegDense *v32;
  RegDense *regDense;
  NSMutableArray *v34;
  NSMutableArray *recycledInputBuffers;
  DenoiseFusePipeline *v36;
  objc_super v38;

  v9 = a3;
  v38.receiver = self;
  v38.super_class = (Class)DenoiseFusePipeline;
  v10 = -[DenoiseFusePipeline init](&v38, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_13;
  v10->_supportsHDR = a4;
  v10->_onlySingleImageDenoising = a5;
  objc_storeStrong((id *)&v10->_metal, a3);
  v12 = -[AMBNRStage init:onlySingleImageDenoising:]([AMBNRStage alloc], "init:onlySingleImageDenoising:", v11->_metal, v11->_onlySingleImageDenoising);
  v13 = v11->_ambnrStage[0];
  v11->_ambnrStage[0] = v12;

  if (!v11->_ambnrStage[0])
    goto LABEL_12;
  v14 = -[AMBNRStage init:onlySingleImageDenoising:]([AMBNRStage alloc], "init:onlySingleImageDenoising:", v11->_metal, v11->_onlySingleImageDenoising);
  v15 = v11->_ambnrStage[1];
  v11->_ambnrStage[1] = v14;

  if (!v11->_ambnrStage[1])
    goto LABEL_12;
  v16 = -[AMBNRStage init:onlySingleImageDenoising:]([AMBNRStage alloc], "init:onlySingleImageDenoising:", v11->_metal, v11->_onlySingleImageDenoising);
  v17 = v11->_ambnrStage[2];
  v11->_ambnrStage[2] = v16;

  if (!v11->_ambnrStage[2])
    goto LABEL_12;
  v18 = -[AMBNRStage init:onlySingleImageDenoising:]([AMBNRStage alloc], "init:onlySingleImageDenoising:", v11->_metal, v11->_onlySingleImageDenoising);
  v19 = v11->_ambnrStage[3];
  v11->_ambnrStage[3] = v18;

  if (!v11->_ambnrStage[3])
    goto LABEL_12;
  if (!v11->_onlySingleImageDenoising)
  {
    v20 = -[FusionRemixStage initBandFusion:]([FusionRemixStage alloc], "initBandFusion:", v11->_metal);
    fusionRemixStage = v11->_fusionRemixStage;
    v11->_fusionRemixStage = v20;

    if (!v11->_fusionRemixStage)
      goto LABEL_12;
  }
  v22 = objc_alloc_init(AMBNRBuffers);
  v23 = v11->_ambnrBuffers[0];
  v11->_ambnrBuffers[0] = v22;

  v24 = v11->_fusedBands[0];
  v11->_fusedBands[0] = 0;

  v25 = v11->_fusedDenoisedBands[0];
  v11->_fusedDenoisedBands[0] = 0;

  v26 = objc_alloc_init(AMBNRBuffers);
  v27 = v11->_ambnrBuffers[1];
  v11->_ambnrBuffers[1] = v26;

  v28 = v11->_fusedBands[1];
  v11->_fusedBands[1] = 0;

  v29 = v11->_fusedDenoisedBands[1];
  v11->_fusedDenoisedBands[1] = 0;

  if (!v11->_onlySingleImageDenoising)
  {
    v30 = -[BilateralGrid initWithContext:]([BilateralGrid alloc], "initWithContext:", v11->_metal);
    bilateralGrid = v11->_bilateralGrid;
    v11->_bilateralGrid = v30;

    if (!v11->_bilateralGrid
      || (v32 = -[RegDense initWithMetalContext:]([RegDense alloc], "initWithMetalContext:", v11->_metal), regDense = v11->_regDense, v11->_regDense = v32, regDense, !v11->_regDense))
    {
LABEL_12:
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
LABEL_13:
      v36 = 0;
      goto LABEL_14;
    }
  }
  v11->_currentFrame = 0;
  v11->_denoisedAllocInternallyIndex = 0;
  v11->_forceHDRFusionReferenceFrame = -1;
  v34 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  recycledInputBuffers = v11->_recycledInputBuffers;
  v11->_recycledInputBuffers = v34;

  v36 = v11;
LABEL_14:

  return v36;
}

- (void)dealloc
{
  objc_super v3;

  -[DenoiseFusePipeline releaseAllBuffers](self, "releaseAllBuffers");
  v3.receiver = self;
  v3.super_class = (Class)DenoiseFusePipeline;
  -[DenoiseFusePipeline dealloc](&v3, sel_dealloc);
}

- (void)setAllowModifyingInputBuffers:(BOOL)a3
{
  self->_allowModifyingInputBuffers = a3;
}

- (__CVBuffer)getDenoisingOutputBuffer:(__CVBuffer *)a3
{
  void *v5;
  __CVBuffer *v6;
  __CVBuffer *result;
  uint64_t denoisedAllocInternallyIndex;

  CVPixelBufferGetWidthOfPlane(a3, 0);
  CVPixelBufferGetHeightOfPlane(a3, 0);
  if (-[NSMutableArray count](self->_recycledInputBuffers, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_recycledInputBuffers, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CVBuffer *)objc_msgSend(v5, "pointerValue");
    -[NSMutableArray removeObjectAtIndex:](self->_recycledInputBuffers, "removeObjectAtIndex:", 0);

    return v6;
  }
  else
  {
    LODWORD(denoisedAllocInternallyIndex) = self->_denoisedAllocInternallyIndex;
    if ((int)denoisedAllocInternallyIndex < 4
      && ((result = self->_denoisedAllocInternally[(int)denoisedAllocInternallyIndex]) != 0
       || (result = (__CVBuffer *)CreatePixelBuffer(),
           denoisedAllocInternallyIndex = self->_denoisedAllocInternallyIndex,
           (self->_denoisedAllocInternally[denoisedAllocInternallyIndex] = result) != 0)))
    {
      self->_denoisedAllocInternallyIndex = denoisedAllocInternallyIndex + 1;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      return 0;
    }
  }
  return result;
}

- (__CVBuffer)getDenoisedFrame:(int)a3
{
  return self->_ambnrBuffers[self->_pyrFormat]->denoisedPyramid[a3]->pixelBuffer[0];
}

- (int)denoiseSingleImage:(__CVBuffer *)a3 input:(__CVBuffer *)a4 exposure:(exposureParameters *)a5 tuningParams:(id)a6 highGainTuningParams:(id)a7 ltmCurves:(ltmCurves *)a8
{
  id v14;
  id v15;
  uint64_t v17;

  v14 = a7;
  v15 = a6;
  -[DenoiseFusePipeline reset](self, "reset");
  -[DenoiseFusePipeline setFusionMode:](self, "setFusionMode:", 0);
  LOBYTE(v17) = 0;
  LODWORD(a8) = -[DenoiseFusePipeline denoiseFrame:input:exposure:tuningParams:highGainTuningParams:ltmCurves:recycleInput:](self, "denoiseFrame:input:exposure:tuningParams:highGainTuningParams:ltmCurves:recycleInput:", a3, a4, a5, v15, v14, a8, v17);

  return (int)a8;
}

- (int)baseLayer:(id)a3
{
  int result;

  result = -[BilateralGrid filter:output:](self->_bilateralGrid, "filter:output:", a3, 0);
  if (result)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (int)reAliasPyramid:(id)a3 withPixelBuffer:(__CVBuffer *)a4
{
  id *v6;
  void *v7;
  void *v8;
  int v9;

  v6 = (id *)a3;
  -[FigMetalContext device](self->_metal, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newBufferWithIOSurface:", CVPixelBufferGetIOSurface(a4));

  if (!v8
    || +[AMBNRBuffers aliasAMBNRPyramidLevel:lvl:width:height:useHalfFloat:metal:scratchBuffer:offset:](AMBNRBuffers, "aliasAMBNRPyramidLevel:lvl:width:height:useHalfFloat:metal:scratchBuffer:offset:", v6, 1, objc_msgSend(v6[43], "width"), objc_msgSend(v6[43], "height"), 1, self->_metal, v8, 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v9 = FigSignalErrorAt();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int)reAliasPyramidsIntoIntermediateBuffersUsingOutput:(__CVBuffer *)a3
{
  PyramidStorage **fusedBands;
  void *v6;
  int v7;
  void *v8;
  __CVBuffer *v9;

  fusedBands = self->_fusedBands;
  -[MTLTexture buffer](self->_fusedBands[self->_pyrFormat]->textureY[1], "buffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[DenoiseFusePipeline reAliasPyramid:withPixelBuffer:](self, "reAliasPyramid:withPixelBuffer:", fusedBands[self->_pyrFormat], a3);
    if (v7)
    {
      LODWORD(v8) = v7;
      fig_log_get_emitter();
      FigDebugAssert3();
      return (int)v8;
    }
    self->_resetAliasingForHDR = 1;
  }
  -[MTLTexture buffer](self->_fusedDenoisedBands[self->_pyrFormat]->textureY[1], "buffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return (int)v8;
  v9 = -[DenoiseFusePipeline getDenoisingOutputBuffer:](self, "getDenoisingOutputBuffer:", a3);
  if (v9)
  {
    LODWORD(v8) = -[DenoiseFusePipeline reAliasPyramid:withPixelBuffer:](self, "reAliasPyramid:withPixelBuffer:", self->_fusedDenoisedBands[self->_pyrFormat], v9);
    if ((_DWORD)v8)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      self->_resetAliasingForHDR = 1;
    }
    return (int)v8;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)fuseImages:(__CVBuffer *)a3 config:(FusionConfiguration *)a4 properties:(frameProperties_t *)a5 pbEV0Properties:(frameProperties_t *)a6 tuningParams:(id)a7 validBufferRect:(CGRect)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  FusionBuffers *v18;
  PyramidStorage **fusedBands;
  uint64_t currentFrame;
  exposureParameters *p_exposureParams;
  _OWORD *v22;
  __int128 v23;
  AMBNRBuffers **ambnrBuffers;
  int fusionAlgo;
  id fusionReferenceSelectionBlock;
  int v27;
  int v28;
  int forceHDRFusionReferenceFrame;
  float v31;
  void (**v32)(id, _QWORD);
  uint64_t v33;
  _OWORD v34[10];
  uint64_t v35;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v35 = *MEMORY[0x24BDAC8D0];
  v17 = a7;
  v18 = objc_alloc_init(FusionBuffers);
  v33 = 0;
  if (!a3)
  {
    fig_log_get_emitter();
LABEL_39:
    FigDebugAssert3();
    v28 = FigSignalErrorAt();
    goto LABEL_20;
  }
  fusedBands = self->_fusedBands;
  if (-[PyramidStorage setPixelBuffer:level:texUsage:metal:](self->_fusedBands[self->_pyrFormat], "setPixelBuffer:level:texUsage:metal:", a3, 0, 23, self->_metal)|| self->_fusionAlgo == 3&& -[DenoiseFusePipeline reAliasPyramidsIntoIntermediateBuffersUsingOutput:](self, "reAliasPyramidsIntoIntermediateBuffersUsingOutput:", a3))
  {
    fig_log_get_emitter();
    goto LABEL_34;
  }
  v18->morphology = self->_morphology;
  v18->similarityMap = self->_similarityMap;
  objc_storeStrong((id *)&v18->scratchBuffer, self->_scratchBuffer);
  objc_storeStrong((id *)&v18->ltmLumaTex, self->_ltmLumaTex);
  objc_storeStrong((id *)&v18->ltmChromaTex, self->_ltmChromaTex);
  -[FusionRemixStage setROI:](self->_fusionRemixStage, "setROI:", x, y, width, height);
  if (self->_fusionAlgo == 3)
    -[FusionRemixStage setToneCurvesWithLtmEVM:ltmEv0:](self->_fusionRemixStage, "setToneCurvesWithLtmEVM:ltmEv0:", &a5->ltmCurves.ltmLut[2184 * a4[7].fusionAlgo + 31], &a6->ltmCurves.ltmLut[31]);
  memset(v34, 0, sizeof(v34));
  currentFrame = self->_currentFrame;
  if ((int)currentFrame >= 1)
  {
    p_exposureParams = &a5->exposureParams;
    v22 = v34;
    do
    {
      v23 = *(_OWORD *)&p_exposureParams->exposure_time;
      *v22 = *(_OWORD *)&p_exposureParams->gain;
      v22[1] = v23;
      *((_QWORD *)v22 + 4) = *(_QWORD *)&p_exposureParams->exposure_bias;
      p_exposureParams = (exposureParameters *)((char *)p_exposureParams + 4368);
      v22 = (_OWORD *)((char *)v22 + 40);
      --currentFrame;
    }
    while (currentFrame);
  }
  ambnrBuffers = self->_ambnrBuffers;
  if (-[FusionRemixStage prepareForFusion:config:fusedPyramid:preAllocatedBuffers:exposures:tuningParams:](self->_fusionRemixStage, "prepareForFusion:config:fusedPyramid:preAllocatedBuffers:exposures:tuningParams:", self->_ambnrBuffers[self->_pyrFormat], a4, fusedBands[self->_pyrFormat], v18, v34, v17))
  {
    goto LABEL_31;
  }
  fusionAlgo = self->_fusionAlgo;
  if (fusionAlgo != 3)
  {
    if (fusionAlgo != 2)
    {
LABEL_16:
      v27 = 0;
LABEL_17:
      a3 = 0;
      goto LABEL_18;
    }
    if (!-[FusionRemixStage selectOisFusionMode:config:exposures:tuningParams:outputFusionMode:](self->_fusionRemixStage, "selectOisFusionMode:config:exposures:tuningParams:outputFusionMode:", ambnrBuffers[self->_pyrFormat], a4, v34, v17, &v33))
    {
      fusionReferenceSelectionBlock = self->_fusionReferenceSelectionBlock;
      if (fusionReferenceSelectionBlock)
        (*((void (**)(id, _QWORD, _QWORD))fusionReferenceSelectionBlock + 2))(fusionReferenceSelectionBlock, self->_fusionAlgo, v33);
      goto LABEL_16;
    }
    fig_log_get_emitter();
LABEL_34:
    FigDebugAssert3();
    v28 = FigSignalErrorAt();
    a3 = 0;
    goto LABEL_20;
  }
  forceHDRFusionReferenceFrame = self->_forceHDRFusionReferenceFrame;
  if (forceHDRFusionReferenceFrame == -1)
  {
    if (-[FusionRemixStage selectHdrFusionReferenceFrame:config:exposures:tuningParams:outputFusionMode:](self->_fusionRemixStage, "selectHdrFusionReferenceFrame:config:exposures:tuningParams:outputFusionMode:", ambnrBuffers[self->_pyrFormat], a4, v34, v17, (char *)&v33 + 4))
    {
      fig_log_get_emitter();
      goto LABEL_34;
    }
    v27 = HIDWORD(v33);
    v32 = (void (**)(id, _QWORD))self->_fusionReferenceSelectionBlock;
    if (v32)
      goto LABEL_27;
  }
  else
  {
    v31 = *((float *)&v34[1] + 10 * forceHDRFusionReferenceFrame + 3);
    if (v31 < 0.0)
    {
      v27 = 1;
      HIDWORD(v33) = 1;
      v32 = (void (**)(id, _QWORD))self->_fusionReferenceSelectionBlock;
      if (!v32)
        goto LABEL_28;
LABEL_27:
      v32[2](v32, self->_fusionAlgo);
      v27 = HIDWORD(v33);
      goto LABEL_28;
    }
    if (v31 != 0.0)
    {
LABEL_31:
      fig_log_get_emitter();
      goto LABEL_34;
    }
    v27 = 2;
    HIDWORD(v33) = 2;
    v32 = (void (**)(id, _QWORD))self->_fusionReferenceSelectionBlock;
    if (v32)
      goto LABEL_27;
  }
LABEL_28:
  if (v27 != 1)
    goto LABEL_17;
  -[RegDense runWithAmbnrBuffers:ambnrStage:referenceFrameIndex:nonReferenceFrameIndex:homography:scratchBuffer:config:exposures:](self->_regDense, "runWithAmbnrBuffers:ambnrStage:referenceFrameIndex:nonReferenceFrameIndex:homography:scratchBuffer:config:exposures:", ambnrBuffers[self->_pyrFormat], self->_ambnrStage[0], a4[7].fusionAlgo, a4, v34);
  a3 = self->_regDense->_pyrConfidence;
  v27 = HIDWORD(v33);
LABEL_18:
  if (-[FusionRemixStage runImageFusion:config:fusedPyramid:fusedDenoisedPyramid:preAllocatedBuffers:denoiser:bilateralGrid:exposures:tuningParams:confidence:hdrFusionMode:oisFusionMode:](self->_fusionRemixStage, "runImageFusion:config:fusedPyramid:fusedDenoisedPyramid:preAllocatedBuffers:denoiser:bilateralGrid:exposures:tuningParams:confidence:hdrFusionMode:oisFusionMode:", ambnrBuffers[self->_pyrFormat], a4, fusedBands[self->_pyrFormat], self->_fusedDenoisedBands[self->_pyrFormat], v18, self->_ambnrStage[0]->_denoiseRemixStage, self->_bilateralGrid, v34, v17, a3, __PAIR64__(v33, v27)))
  {
    fig_log_get_emitter();
    goto LABEL_39;
  }
  v28 = 0;
LABEL_20:

  return v28;
}

- (SidecarWriter)sidecarWriter
{
  return (SidecarWriter *)objc_loadWeakRetained((id *)&self->_sidecarWriter);
}

- (int)forceHDRFusionReferenceFrame
{
  return self->_forceHDRFusionReferenceFrame;
}

- (BOOL)allowModifyingInputBuffers
{
  return self->_allowModifyingInputBuffers;
}

- (id)fusionReferenceSelectionBlock
{
  return self->_fusionReferenceSelectionBlock;
}

@end
