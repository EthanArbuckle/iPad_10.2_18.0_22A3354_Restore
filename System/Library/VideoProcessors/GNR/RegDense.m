@implementation RegDense

- (unint64_t)computeScratchBufferOffsets
{
  double v2;
  uint64_t v4;
  uint64_t v5;
  RegPyrFusionResources *v6;
  unint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  LODWORD(v2) = 1068149419;
  +[RegPyrFusion calculatePyramidDimensions:pyrWidths:pyrHeights:topLevelIndex:maxDim:minDim:](RegPyrFusion, "calculatePyramidDimensions:pyrWidths:pyrHeights:topLevelIndex:maxDim:minDim:", &v19, &v9, 10, 1024, 32, v2);
  v4 = v19;
  v5 = v9;
  v6 = self->_sfRegPyrBuffers;
  v6->offsets.interimNextShiftMap = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v4, v5, 65);
  v6->offsets.nonRefDerivTex = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v19, v9, 70);
  v6->offsets.prevShiftMap = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v19, v9, 70);
  v6->offsets.shiftMapWeight = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v19, v9, 115);
  v6->offsets.refDerivTex = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v19, v9, 70);
  v6->offsets.refTextureY[1] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v19, v9, 25);
  v6->offsets.refTextureY[2] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v20, v10, 25);
  v6->offsets.refTextureY[3] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v21, v11, 25);
  v6->offsets.refTextureY[4] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v22, v12, 25);
  v6->offsets.refTextureY[5] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v23, v13, 25);
  v6->offsets.refTextureY[6] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v24, v14, 25);
  v6->offsets.refTextureY[7] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v25, v15, 25);
  v6->offsets.refTextureY[8] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v26, v16, 25);
  v6->offsets.refTextureY[9] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v27, v17, 25);
  v6->offsets.refTextureY[10] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v28, v18, 25);
  v6->offsets.nonRefTextureY[1] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v19, v9, 25);
  v6->offsets.nonRefTextureY[2] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v20, v10, 25);
  v6->offsets.nonRefTextureY[3] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v21, v11, 25);
  v6->offsets.nonRefTextureY[4] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v22, v12, 25);
  v6->offsets.nonRefTextureY[5] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v23, v13, 25);
  v6->offsets.nonRefTextureY[6] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v24, v14, 25);
  v6->offsets.nonRefTextureY[7] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v25, v15, 25);
  v6->offsets.nonRefTextureY[8] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v26, v16, 25);
  v6->offsets.nonRefTextureY[9] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v27, v17, 25);
  v6->offsets.nonRefTextureY[10] = -[RegDense computeBufferOffset:width:height:format:](self, "computeBufferOffset:width:height:format:", &v8, v28, v18, 25);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[RegDense releaseResources](self, "releaseResources");
  v3.receiver = self;
  v3.super_class = (Class)RegDense;
  -[RegDense dealloc](&v3, sel_dealloc);
}

- (int)allocateResourcesForWidth:(unint64_t)a3 height:(unint64_t)a4 scratchBuffer:(id)a5
{
  id v6;
  double v7;
  PyramidStorage *nonRefPyramid;
  uint64_t v9;
  PyramidStorage *v10;
  unint64_t *p_refDerivTex;
  unint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  MTLTexture *v15;
  int v16;
  void *v17;
  RegPyrFusionResources *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MTLTexture **textureY;
  MTLTexture *v24;
  uint64_t v25;
  uint64_t v26;
  MTLTexture *v27;
  uint64_t v28;
  MTLTexture *v29;
  uint64_t v30;
  MTLTexture *v31;
  uint64_t v32;
  MTLTexture *v33;
  uint64_t v34;
  MTLTexture *v35;
  uint64_t v36;
  MTLTexture *v37;
  __CVBuffer *PixelBuffer;
  __CVBuffer *v39;
  IOSurfaceRef IOSurface;
  uint64_t v41;
  MTLTexture *confidenceMap;
  MTLTexture *v43;
  MTLTexture *blendingWeight;
  RegPyrFusionResources *v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[2];
  _BYTE v57[132];
  _DWORD v58[20];
  unsigned int v59[19];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  v48 = self->_sfRegPyrBuffers;
  LODWORD(v7) = 1068149419;
  +[RegPyrFusion calculatePyramidDimensions:pyrWidths:pyrHeights:topLevelIndex:maxDim:minDim:](RegPyrFusion, "calculatePyramidDimensions:pyrWidths:pyrHeights:topLevelIndex:maxDim:minDim:", v59, v58, 10, 1024, 32, v7);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  nonRefPyramid = self->_nonRefPyramid;
  v56[0] = self->_refPyramid;
  v56[1] = nonRefPyramid;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v51)
  {
    v50 = *(_QWORD *)v53;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v50)
        objc_enumerationMutation(obj);
      v10 = *(PyramidStorage **)(*((_QWORD *)&v52 + 1) + 8 * v9);
      v10->levels = 11;
      p_refDerivTex = &v48->offsets.refTextureY[19];
      if (v10 == self->_refPyramid)
        p_refDerivTex = &v48->offsets.refDerivTex;
      if (v10->levels >= 2)
        break;
LABEL_5:
      if (++v9 == v51)
      {
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        if (!v51)
          goto LABEL_17;
        goto LABEL_4;
      }
    }
    v12 = p_refDerivTex + 1;
    v13 = 1;
    while (1)
    {
      -[FigMetalContext create2DTextureFromBuffer:offset:width:height:format:usage:](self->_metal, "create2DTextureFromBuffer:offset:width:height:format:usage:", v6, v12[v13], v58[v13 + 19], *(unsigned int *)&v57[4 * v13 + 128], 25, 23);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v10->textureY[v13];
      v10->textureY[v13] = (MTLTexture *)v14;

      if (!v10->textureY[v13])
        break;
      if (++v13 >= v10->levels)
        goto LABEL_5;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = FigSignalErrorAt();

    goto LABEL_16;
  }
LABEL_17:

  self->_pyrConfidence->levels = 4;
  if (self->_pyrConfidence->levels > 2)
  {
    v19 = 2;
    while (1)
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, a3 >> v19, a4 >> v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setUsage:", 7);
      -[FigMetalContext device](self->_metal, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "newTextureWithDescriptor:", v20);
      textureY = self->_pyrConfidence->textureY;
      v24 = textureY[v19];
      textureY[v19] = (MTLTexture *)v22;

      if (!self->_pyrConfidence->textureY[v19])
        break;

      if (++v19 >= self->_pyrConfidence->levels)
        goto LABEL_21;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = FigSignalErrorAt();

LABEL_16:
    v17 = v6;
    v18 = v48;
    goto LABEL_36;
  }
LABEL_21:
  v17 = v6;
  v18 = v48;
  if (self->_refPyramid->levels >= 2)
  {
    v25 = 1;
    do
    {
      -[FigMetalContext create2DTextureFromBuffer:offset:width:height:format:usage:](self->_metal, "create2DTextureFromBuffer:offset:width:height:format:usage:", v6, v48->offsets.interimNextShiftMap, ((int)v58[v25 + 19] >> 1), *(unsigned int *)&v57[4 * v25 + 128], 115, 23);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v48->interim[v25];
      v48->interim[v25] = (MTLTexture *)v26;

      if (!v48->interim[v25])
        goto LABEL_38;
      -[FigMetalContext create2DTextureFromBuffer:offset:width:height:format:usage:](self->_metal, "create2DTextureFromBuffer:offset:width:height:format:usage:", v6, v48->offsets.refDerivTex, v58[v25 + 19], *(unsigned int *)&v57[4 * v25 + 128], 70, 23);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v48->refDerivTex[v25];
      v48->refDerivTex[v25] = (MTLTexture *)v28;

      if (!v48->refDerivTex[v25])
        goto LABEL_38;
      -[FigMetalContext create2DTextureFromBuffer:offset:width:height:format:usage:](self->_metal, "create2DTextureFromBuffer:offset:width:height:format:usage:", v6, v48->offsets.nonRefDerivTex, v58[v25 + 19], *(unsigned int *)&v57[4 * v25 + 128], 70, 23);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v48->nonRefDerivTex[v25];
      v48->nonRefDerivTex[v25] = (MTLTexture *)v30;

      if (!v48->nonRefDerivTex[v25])
        goto LABEL_38;
      -[FigMetalContext create2DTextureFromBuffer:offset:width:height:format:usage:](self->_metal, "create2DTextureFromBuffer:offset:width:height:format:usage:", v6, v48->offsets.prevShiftMap, v58[v25 + 19], *(unsigned int *)&v57[4 * v25 + 128], 65, 23);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v48->prevShiftMap[v25];
      v48->prevShiftMap[v25] = (MTLTexture *)v32;

      if (!v48->prevShiftMap[v25])
        goto LABEL_38;
      -[FigMetalContext create2DTextureFromBuffer:offset:width:height:format:usage:](self->_metal, "create2DTextureFromBuffer:offset:width:height:format:usage:", v6, v48->offsets.interimNextShiftMap, v58[v25 + 19], *(unsigned int *)&v57[4 * v25 + 128], 65, 23);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v48->nextShiftMap[v25];
      v48->nextShiftMap[v25] = (MTLTexture *)v34;

      if (!v48->nextShiftMap[v25])
        goto LABEL_38;
      -[FigMetalContext create2DTextureFromBuffer:offset:width:height:format:usage:](self->_metal, "create2DTextureFromBuffer:offset:width:height:format:usage:", v6, v48->offsets.shiftMapWeight, v58[v25 + 19], *(unsigned int *)&v57[4 * v25 + 128], 115, 23);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v48->shiftMapWeight[v25];
      v48->shiftMapWeight[v25] = (MTLTexture *)v36;

      if (!v48->shiftMapWeight[v25])
        goto LABEL_38;
    }
    while (++v25 < self->_refPyramid->levels);
  }
  PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
  if (!PixelBuffer)
  {
LABEL_38:
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = FigSignalErrorAt();
    goto LABEL_36;
  }
  v39 = PixelBuffer;
  IOSurface = CVPixelBufferGetIOSurface(PixelBuffer);
  if (!IOSurface)
    goto LABEL_40;
  -[FigMetalContext bindIOSurfaceToMTL2DTexture:pixelFormat:usage:width:height:plane:](self->_metal, "bindIOSurfaceToMTL2DTexture:pixelFormat:usage:width:height:plane:", IOSurface, 25, 23, (int)v59[0], v58[0], 0);
  v41 = objc_claimAutoreleasedReturnValue();
  confidenceMap = v48->confidenceMap;
  v48->confidenceMap = (MTLTexture *)v41;

  if (!v48->confidenceMap)
    goto LABEL_40;
  -[FigMetalContext create2DTextureFromBuffer:offset:width:height:format:usage:](self->_metal, "create2DTextureFromBuffer:offset:width:height:format:usage:", v6, v48->offsets.nonRefDerivTex, v59[0], v58[0], 25, 23);
  v43 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  blendingWeight = self->_blendingWeight;
  self->_blendingWeight = v43;

  if (self->_blendingWeight)
  {
    v16 = 0;
  }
  else
  {
LABEL_40:
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = FigSignalErrorAt();
  }
  CFRelease(v39);
LABEL_36:

  return v16;
}

- (unint64_t)computeBufferOffset:(unint64_t *)a3 width:(int)a4 height:(int)a5 format:(unint64_t)a6
{
  uint64_t v8;
  unint64_t result;

  v8 = (-[FigMetalContext getPixelSizeInBytes:](self->_metal, "getPixelSizeInBytes:", a6) * a4 + 63) & 0xFFFFFFC0;
  result = *a3;
  *a3 += v8 * a5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingWeight, 0);
  objc_storeStrong((id *)&self->_homographyMatrixBuffer, 0);
  objc_storeStrong((id *)&self->_sfRegPyrBuffers, 0);
  objc_storeStrong((id *)&self->_nonRefPyramid, 0);
  objc_storeStrong((id *)&self->_refPyramid, 0);
  objc_storeStrong((id *)&self->_sfRegPyr, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_pyrConfidence, 0);
}

- (RegDense)initWithMetalContext:(id)a3
{
  id v5;
  RegDense *v6;
  RegDense *v7;
  uint64_t v8;
  RegPyrFusionResources *sfRegPyrBuffers;
  uint64_t v10;
  PyramidStorage *refPyramid;
  uint64_t v12;
  PyramidStorage *nonRefPyramid;
  uint64_t v14;
  PyramidStorage *pyrConfidence;
  RegPyrFusion *v16;
  RegPyrFusion *sfRegPyr;
  void *v18;
  uint64_t v19;
  RegDenseShaders *shaders;
  void *v21;
  uint64_t v22;
  MTLBuffer *homographyMatrixBuffer;
  RegDense *v24;
  RegDense *v25;
  int v27;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RegDense;
  v6 = -[RegDense init](&v28, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  objc_storeStrong((id *)&v6->_metal, a3);
  v8 = objc_opt_new();
  sfRegPyrBuffers = v7->_sfRegPyrBuffers;
  v7->_sfRegPyrBuffers = (RegPyrFusionResources *)v8;

  v10 = objc_opt_new();
  refPyramid = v7->_refPyramid;
  v7->_refPyramid = (PyramidStorage *)v10;

  v12 = objc_opt_new();
  nonRefPyramid = v7->_nonRefPyramid;
  v7->_nonRefPyramid = (PyramidStorage *)v12;

  v14 = objc_opt_new();
  pyrConfidence = v7->_pyrConfidence;
  v7->_pyrConfidence = (PyramidStorage *)v14;

  v16 = -[RegPyrFusion initWithMetalContext:]([RegPyrFusion alloc], "initWithMetalContext:", v7->_metal);
  sfRegPyr = v7->_sfRegPyr;
  v7->_sfRegPyr = v16;

  if (v7->_sfRegPyr)
  {
    +[RegDenseShared sharedInstance](RegDenseShared, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getShaders:", v7->_metal);
    v19 = objc_claimAutoreleasedReturnValue();
    shaders = v7->_shaders;
    v7->_shaders = (RegDenseShaders *)v19;

    if (v7->_shaders)
    {
      -[FigMetalContext prewarmInternalMetalShadersForFormatsList:](v7->_metal, "prewarmInternalMetalShadersForFormatsList:", &unk_24D670460);
      -[FigMetalContext device](v7->_metal, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "newBufferWithLength:options:", 48, 0);
      homographyMatrixBuffer = v7->_homographyMatrixBuffer;
      v7->_homographyMatrixBuffer = (MTLBuffer *)v22;

      if (v7->_homographyMatrixBuffer)
        goto LABEL_5;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v27 = FigSignalErrorAt();
  v24 = 0;
  if (!v27)
LABEL_5:
    v24 = v7;
  v25 = v24;

  return v25;
}

- (void)releaseResources
{
  RegPyrFusionResources *v3;
  RegPyrFusionResources *sfRegPyrBuffers;
  MTLTexture *blendingWeight;

  -[PyramidStorage releaseBuffers](self->_refPyramid, "releaseBuffers");
  -[PyramidStorage releaseBuffers](self->_nonRefPyramid, "releaseBuffers");
  -[PyramidStorage releaseBuffers](self->_pyrConfidence, "releaseBuffers");
  v3 = (RegPyrFusionResources *)objc_opt_new();
  sfRegPyrBuffers = self->_sfRegPyrBuffers;
  self->_sfRegPyrBuffers = v3;

  blendingWeight = self->_blendingWeight;
  self->_blendingWeight = 0;

}

- (void)reset
{
  PyramidStorage *pyrConfidence;
  MTLTexture *v4;
  MTLTexture *v5;

  -[PyramidStorage clearLevel:](self->_refPyramid, "clearLevel:", 0);
  -[PyramidStorage clearLevel:](self->_nonRefPyramid, "clearLevel:", 0);
  pyrConfidence = self->_pyrConfidence;
  v4 = pyrConfidence->textureY[0];
  pyrConfidence->textureY[0] = 0;

  v5 = self->_pyrConfidence->textureY[1];
  self->_pyrConfidence->textureY[1] = 0;

}

- (int)pyramidConfidence:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (-[FigMetalContext commandQueue](self->_metal, "commandQueue"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "commandBuffer"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    objc_msgSend(v8, "colorAttachments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTexture:", v6);

    objc_msgSend(v10, "renderCommandEncoderWithDescriptor:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", v15, 0, 0);

      objc_msgSend(v14, "setFragmentTexture:atIndex:", v7, 0);
      objc_msgSend(v14, "setRenderPipelineState:", self->_shaders->_confPipeline);
      objc_msgSend(v14, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
      objc_msgSend(v14, "endEncoding");
      objc_msgSend(v10, "commit");

      v16 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v16 = FigSignalErrorAt();

    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = FigSignalErrorAt();
  }

  return v16;
}

- (int)blendingWeightUsing:(id)a3 and:(id)a4 homography:(id *)a5 relativeBrightness:(float)a6
{
  FigMetalContext *metal;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  int64x2_t v23;
  uint64_t v24;
  _QWORD v25[3];
  float v26;

  v26 = a6;
  metal = self->_metal;
  v10 = a4;
  v11 = a3;
  -[FigMetalContext commandQueue](metal, "commandQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "commandBuffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTexture:atIndex:", v11, 0);
  objc_msgSend(v14, "setTexture:atIndex:", v10, 1);

  -[RegPyrFusion shiftMap](self->_sfRegPyr, "shiftMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTexture:atIndex:", v15, 2);

  -[RegPyrFusion confidenceMap](self->_sfRegPyr, "confidenceMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTexture:atIndex:", v16, 3);

  objc_msgSend(v14, "setTexture:atIndex:", self->_blendingWeight, 4);
  v17 = (_OWORD *)-[MTLBuffer contents](self->_homographyMatrixBuffer, "contents");
  v18 = *((_OWORD *)a5 + 2);
  v19 = *(_OWORD *)a5;
  v17[1] = *((_OWORD *)a5 + 1);
  v17[2] = v18;
  *v17 = v19;
  objc_msgSend(v14, "setBuffer:offset:atIndex:", self->_homographyMatrixBuffer, 0, 0);
  objc_msgSend(v14, "setBytes:length:atIndex:", &v26, 4, 1);
  v20 = (((unint64_t)objc_msgSend(v11, "width") >> 1) + 7) >> 3;
  v21 = objc_msgSend(v11, "height");

  objc_msgSend(v14, "setComputePipelineState:", self->_shaders->_getBlendingWeightPipeline);
  v25[0] = v20;
  v25[1] = ((v21 >> 1) + 7) >> 3;
  v25[2] = 1;
  v23 = vdupq_n_s64(8uLL);
  v24 = 1;
  objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", v25, &v23);
  objc_msgSend(v14, "endEncoding");
  objc_msgSend(v13, "commit");

  return 0;
}

- (int)warpFrame:(__CVBuffer *)a3 output:(__CVBuffer *)a4 homography:(id *)a5 config:(FusionConfiguration *)a6
{
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int64x2_t v28;
  uint64_t v29;
  _QWORD v30[3];

  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, 10, 17, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, 30, 17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a4, 10, 22, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a4, 30, 22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v15, "width");
  v25 = objc_msgSend(v15, "height");
  v18 = 24;
  if (a6->fusionAlgo == 3)
    v18 = 32;
  objc_msgSend(v13, "setComputePipelineState:", *(Class *)((char *)&self->_shaders->super.isa + v18));
  v27 = (void *)v14;
  objc_msgSend(v13, "setTexture:atIndex:", v14, 0);
  objc_msgSend(v13, "setTexture:atIndex:", v15, 1);
  -[RegPyrFusion shiftMap](self->_sfRegPyr, "shiftMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTexture:atIndex:", v19, 2);

  objc_msgSend(v13, "setTexture:atIndex:", v16, 3);
  objc_msgSend(v13, "setTexture:atIndex:", v17, 4);
  if (a5)
  {
    v20 = (_OWORD *)-[MTLBuffer contents](self->_homographyMatrixBuffer, "contents");
    v21 = *((_OWORD *)a5 + 2);
    v22 = *(_OWORD *)a5;
    v20[1] = *((_OWORD *)a5 + 1);
    v20[2] = v21;
    *v20 = v22;
    objc_msgSend(v13, "setBuffer:offset:atIndex:", self->_homographyMatrixBuffer, 0, 0);
    if (a6->fusionAlgo == 3)
    {
      objc_msgSend(v13, "setTexture:atIndex:", self->_blendingWeight, 5);
    }
    else
    {
      -[RegPyrFusion confidenceMap](self->_sfRegPyr, "confidenceMap");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTexture:atIndex:", v23, 5);

    }
  }
  v30[0] = (unint64_t)(v26 + 7) >> 3;
  v30[1] = (unint64_t)(v25 + 7) >> 3;
  v30[2] = 1;
  v28 = vdupq_n_s64(8uLL);
  v29 = 1;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v30, &v28);
  objc_msgSend(v13, "endEncoding");
  objc_msgSend(v12, "commit");

  return 0;
}

- (int)copy420Buffer:(__CVBuffer *)a3 output:(__CVBuffer *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, 10, 17, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, 30, 17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a4, 10, 22, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a4, 30, 22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "blitCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = objc_msgSend(v9, "width");
  v22 = objc_msgSend(v9, "height");
  v23 = 1;
  objc_msgSend(v13, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v7, 0, 0, &v24, &v21, v9, 0, 0, &v18);
  objc_msgSend(v13, "endEncoding");
  objc_msgSend(v12, "blitCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v10, "width");
  v16 = objc_msgSend(v10, "height");
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = v15;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v22 = v16;
  v23 = 1;
  objc_msgSend(v14, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v8, 0, 0, &v24, &v21, v10, 0, 0, &v18);
  objc_msgSend(v14, "endEncoding");
  objc_msgSend(v12, "commit");

  return 0;
}

- (int)runWithAmbnrBuffers:(id)a3 ambnrStage:(id)a4 referenceFrameIndex:(int)a5 nonReferenceFrameIndex:(int)a6 homography:(id *)a7 scratchBuffer:(__CVBuffer *)a8 config:(FusionConfiguration *)a9 exposures:(exposureParameters *)a10
{
  _QWORD *v16;
  uint64_t v17;
  size_t Width;
  size_t Height;
  __int128 v20;
  double v21;
  id *v22;
  int v23;
  id *v25;
  _OWORD v26[2];
  __int128 v27;
  uint64_t v28;
  float v29;
  float v30;
  uint64_t v31;
  float v32;
  float v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  float v38;
  float v39;
  uint64_t v40;
  float v41;
  float v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _OWORD v63[2];
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v25 = (id *)a4;
  v17 = a5;
  Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(v16[v17 + 3] + 16));
  Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(v16[v17 + 3] + 16));
  -[PyramidStorage setPixelBuffer:level:metal:](self->_refPyramid, "setPixelBuffer:level:metal:", *(_QWORD *)(v16[v17 + 3] + 16), 0, self->_metal);
  -[PyramidStorage setPixelBuffer:level:metal:](self->_nonRefPyramid, "setPixelBuffer:level:metal:", *(_QWORD *)(v16[a6 + 3] + 16), 0, self->_metal);
  -[RegPyrFusion setResourcesWithRefPyramid:nonRefPyramid:resources:](self->_sfRegPyr, "setResourcesWithRefPyramid:nonRefPyramid:resources:", self->_refPyramid, self->_nonRefPyramid, self->_sfRegPyrBuffers);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v20 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
  v26[0] = *MEMORY[0x24BDAEDF8];
  v26[1] = v20;
  v27 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
  v31 = 0;
  v32 = (float)(Width - 1);
  v33 = (float)(Height - 1);
  v28 = 0;
  v29 = v32;
  v30 = v33;
  v34 = v26[0];
  v35 = v20;
  v36 = v27;
  v40 = 0;
  v41 = v32;
  v42 = v33;
  v37 = 0;
  v38 = v32;
  v39 = v33;
  if (-[RegPyrFusion registerImagesWithReferenceCam:calibInfo:](self->_sfRegPyr, "registerImagesWithReferenceCam:calibInfo:", 1, v26)|| a9->fusionAlgo == 3&& (*(float *)&v21 = sqrtf(getRelativeBrightness(&a10[a9[7].fusionAlgo].gain, &a10[a9[7].frameCount].gain)), -[RegDense blendingWeightUsing:and:homography:relativeBrightness:](self, "blendingWeightUsing:and:homography:relativeBrightness:", self->_refPyramid->textureY[1], self->_nonRefPyramid->textureY[1], a7, v21))|| -[RegDense warpFrame:output:homography:config:](self, "warpFrame:output:homography:config:", self->_nonRefPyramid->pixelBuffer[0], a8, a7,
         a9)
    || -[RegDense copy420Buffer:output:](self, "copy420Buffer:output:", a8, self->_nonRefPyramid->pixelBuffer[0]))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v23 = FigSignalErrorAt();
    v22 = v25;
  }
  else
  {
    v22 = v25;
    if (objc_msgSend((id)v16[a6 + 3], "setPixelBuffer:level:metal:", self->_nonRefPyramid->pixelBuffer[0], 0, self->_metal)|| objc_msgSend(v25[1], "setResourcesWithPyramid:", v16[a6 + 3]))
    {
      goto LABEL_15;
    }
    v64 = 1084227584;
    v63[0] = xmmword_216F95EA0;
    v63[1] = unk_216F95EB0;
    if (objc_msgSend(v25[1], "useM2M"))
      -[FigMetalContext waitForIdle](self->_metal, "waitForIdle");
    if (objc_msgSend(v25[1], "runWithFilters:", v63))
    {
LABEL_15:
      fig_log_get_emitter();
      FigDebugAssert3();
      v23 = FigSignalErrorAt();
    }
    else
    {
      objc_storeStrong((id *)self->_pyrConfidence->textureY, self->_sfRegPyrBuffers->confidenceMap);
      objc_storeStrong((id *)&self->_pyrConfidence->textureY[1], self->_sfRegPyrBuffers->confidenceMap);
      -[RegDense pyramidConfidence:input:](self, "pyramidConfidence:input:", self->_pyrConfidence->textureY[2], self->_pyrConfidence->textureY[1]);
      -[RegDense pyramidConfidence:input:](self, "pyramidConfidence:input:", self->_pyrConfidence->textureY[3], self->_pyrConfidence->textureY[2]);
      v23 = 0;
    }
  }

  return v23;
}

@end
