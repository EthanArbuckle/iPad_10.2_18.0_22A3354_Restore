@implementation PyramidStorage

- (int)setPixelBuffer:(__CVBuffer *)a3 level:(int)a4 texUsage:(unint64_t)a5 metal:(id)a6 alignDims:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  __CVBuffer **pixelBuffer;
  __CVBuffer *v14;
  __CVBuffer *v15;
  unsigned int v16;
  MTLTexture *v17;
  uint64_t v18;
  MTLTexture *v19;
  uint64_t v20;
  MTLTexture *v21;
  MTLTexture *v22;
  MTLTexture *v23;
  char *v24;
  MTLTexture *v25;
  uint64_t v26;
  void *v27;
  int v28;

  v7 = a7;
  v12 = a6;
  if (a4 < 0 || self->levels <= a4)
    goto LABEL_20;
  pixelBuffer = self->pixelBuffer;
  v14 = self->pixelBuffer[a4];
  if (v14)
  {
    CFRelease(v14);
    pixelBuffer[a4] = 0;
  }
  v15 = self->pixelBuffer2[a4];
  if (v15)
  {
    CFRelease(v15);
    self->pixelBuffer2[a4] = 0;
  }
  pixelBuffer[a4] = a3;
  if (a3)
    CFRetain(a3);
  v16 = 1;
  if (v7)
    v16 = 1 << self->levels;
  objc_msgSend(v12, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:alignmentFactor:", a3, 10, a5, 0, v16);
  v17 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v18 = a4;
  v19 = self->textureY[v18];
  self->textureY[v18] = v17;

  if (!self->textureY[v18])
    goto LABEL_20;
  v20 = v16 <= 1 ? 1 : v16 >> 1;
  objc_msgSend(v12, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:alignmentFactor:", a3, 30, a5, 1, v20);
  v21 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v22 = self->textureUV[a4];
  self->textureUV[a4] = v21;

  if (!self->textureUV[a4])
    goto LABEL_20;
  objc_msgSend(v12, "rebindTex:format:usage:plane:xFactor:", self->textureY[a4], 30, a5, 0, 2);
  v23 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v24 = (char *)self + v18 * 8;
  v25 = self->textureY_RG[v18];
  self->textureY_RG[v18] = v23;

  if (!self->textureY_RG[v18])
    goto LABEL_20;
  objc_msgSend(v12, "rebindTex:format:usage:plane:xFactor:", self->textureUV[a4], 23, a5, 1, 1);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)*((_QWORD *)v24 + 102);
  *((_QWORD *)v24 + 102) = v26;

  if (*((_QWORD *)v24 + 102))
  {
    v28 = 0;
    self->isFP16[a4] = 0;
  }
  else
  {
LABEL_20:
    fig_log_get_emitter();
    FigDebugAssert3();
    v28 = FigSignalErrorAt();
  }

  return v28;
}

- (void)releaseBuffers
{
  uint64_t v3;

  if (self->levels >= 1)
  {
    v3 = 0;
    do
    {
      -[PyramidStorage clearLevel:](self, "clearLevel:", v3);
      v3 = (v3 + 1);
    }
    while ((int)v3 < self->levels);
  }
}

- (int)setPixelBufferFloat16:(__CVBuffer *)a3 chromaBuffer:(__CVBuffer *)a4 level:(int)a5 metal:(id)a6
{
  id v10;
  __CVBuffer **pixelBuffer;
  __CVBuffer *v12;
  __CVBuffer **pixelBuffer2;
  __CVBuffer *v14;
  uint64_t v15;
  __CVBuffer *v16;
  MTLTexture *v17;
  MTLTexture *v18;
  MTLTexture *v19;
  MTLTexture *v20;
  MTLTexture *v21;
  char *v22;
  MTLTexture *v23;
  uint64_t v24;
  void *v25;
  int v26;

  v10 = a6;
  if (a5 < 0 || self->levels <= a5)
    goto LABEL_17;
  pixelBuffer = self->pixelBuffer;
  v12 = self->pixelBuffer[a5];
  if (v12)
  {
    CFRelease(v12);
    pixelBuffer[a5] = 0;
  }
  pixelBuffer2 = self->pixelBuffer2;
  v14 = self->pixelBuffer2[a5];
  if (v14)
    CFRelease(v14);
  v15 = a5;
  pixelBuffer[v15] = a3;
  pixelBuffer2[v15] = a4;
  v16 = a4;
  if (a3)
  {
    CFRetain(a3);
    v16 = pixelBuffer2[a5];
  }
  if (v16)
    CFRetain(v16);
  objc_msgSend(v10, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, 25, 23, 0);
  v17 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v18 = self->textureY[a5];
  self->textureY[a5] = v17;

  if (!self->textureY[a5])
    goto LABEL_17;
  objc_msgSend(v10, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a4, 65, 23, 0);
  v19 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v20 = self->textureUV[a5];
  self->textureUV[a5] = v19;

  if (!self->textureUV[a5])
    goto LABEL_17;
  objc_msgSend(v10, "rebindTex:format:usage:plane:xFactor:", self->textureY[a5], 65, 23, 0, 2);
  v21 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v22 = (char *)self + v15 * 8;
  v23 = self->textureY_RG[v15];
  self->textureY_RG[v15] = v21;

  if (!self->textureY_RG[v15])
    goto LABEL_17;
  objc_msgSend(v10, "rebindTex:format:usage:plane:xFactor:", self->textureUV[a5], 53, 23, 0, 1);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)*((_QWORD *)v22 + 102);
  *((_QWORD *)v22 + 102) = v24;

  if (*((_QWORD *)v22 + 102))
  {
    v26 = 0;
    self->isFP16[a5] = 1;
  }
  else
  {
LABEL_17:
    fig_log_get_emitter();
    FigDebugAssert3();
    v26 = FigSignalErrorAt();
  }

  return v26;
}

- (void)dealloc
{
  objc_super v3;

  -[PyramidStorage releaseBuffers](self, "releaseBuffers");
  v3.receiver = self;
  v3.super_class = (Class)PyramidStorage;
  -[PyramidStorage dealloc](&v3, sel_dealloc);
}

- (int)setPixelBuffer:(__CVBuffer *)a3 level:(int)a4 texUsage:(unint64_t)a5 metal:(id)a6
{
  return -[PyramidStorage setPixelBuffer:level:texUsage:metal:alignDims:](self, "setPixelBuffer:level:texUsage:metal:alignDims:", a3, *(_QWORD *)&a4, a5, a6, 0);
}

- (int)setPixelBuffer:(__CVBuffer *)a3 level:(int)a4 metal:(id)a5
{
  return -[PyramidStorage setPixelBuffer:level:texUsage:metal:](self, "setPixelBuffer:level:texUsage:metal:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->textureUV_packed[19], 0);
  objc_storeStrong((id *)&self->textureUV_packed[18], 0);
  objc_storeStrong((id *)&self->textureUV_packed[17], 0);
  objc_storeStrong((id *)&self->textureUV_packed[16], 0);
  objc_storeStrong((id *)&self->textureUV_packed[15], 0);
  objc_storeStrong((id *)&self->textureUV_packed[14], 0);
  objc_storeStrong((id *)&self->textureUV_packed[13], 0);
  objc_storeStrong((id *)&self->textureUV_packed[12], 0);
  objc_storeStrong((id *)&self->textureUV_packed[11], 0);
  objc_storeStrong((id *)&self->textureUV_packed[10], 0);
  objc_storeStrong((id *)&self->textureUV_packed[9], 0);
  objc_storeStrong((id *)&self->textureUV_packed[8], 0);
  objc_storeStrong((id *)&self->textureUV_packed[7], 0);
  objc_storeStrong((id *)&self->textureUV_packed[6], 0);
  objc_storeStrong((id *)&self->textureUV_packed[5], 0);
  objc_storeStrong((id *)&self->textureUV_packed[4], 0);
  objc_storeStrong((id *)&self->textureUV_packed[3], 0);
  objc_storeStrong((id *)&self->textureUV_packed[2], 0);
  objc_storeStrong((id *)&self->textureUV_packed[1], 0);
  objc_storeStrong((id *)self->textureUV_packed, 0);
  objc_storeStrong((id *)&self->textureY_RG[19], 0);
  objc_storeStrong((id *)&self->textureY_RG[18], 0);
  objc_storeStrong((id *)&self->textureY_RG[17], 0);
  objc_storeStrong((id *)&self->textureY_RG[16], 0);
  objc_storeStrong((id *)&self->textureY_RG[15], 0);
  objc_storeStrong((id *)&self->textureY_RG[14], 0);
  objc_storeStrong((id *)&self->textureY_RG[13], 0);
  objc_storeStrong((id *)&self->textureY_RG[12], 0);
  objc_storeStrong((id *)&self->textureY_RG[11], 0);
  objc_storeStrong((id *)&self->textureY_RG[10], 0);
  objc_storeStrong((id *)&self->textureY_RG[9], 0);
  objc_storeStrong((id *)&self->textureY_RG[8], 0);
  objc_storeStrong((id *)&self->textureY_RG[7], 0);
  objc_storeStrong((id *)&self->textureY_RG[6], 0);
  objc_storeStrong((id *)&self->textureY_RG[5], 0);
  objc_storeStrong((id *)&self->textureY_RG[4], 0);
  objc_storeStrong((id *)&self->textureY_RG[3], 0);
  objc_storeStrong((id *)&self->textureY_RG[2], 0);
  objc_storeStrong((id *)&self->textureY_RG[1], 0);
  objc_storeStrong((id *)self->textureY_RG, 0);
  objc_storeStrong((id *)&self->textureUV[19], 0);
  objc_storeStrong((id *)&self->textureUV[18], 0);
  objc_storeStrong((id *)&self->textureUV[17], 0);
  objc_storeStrong((id *)&self->textureUV[16], 0);
  objc_storeStrong((id *)&self->textureUV[15], 0);
  objc_storeStrong((id *)&self->textureUV[14], 0);
  objc_storeStrong((id *)&self->textureUV[13], 0);
  objc_storeStrong((id *)&self->textureUV[12], 0);
  objc_storeStrong((id *)&self->textureUV[11], 0);
  objc_storeStrong((id *)&self->textureUV[10], 0);
  objc_storeStrong((id *)&self->textureUV[9], 0);
  objc_storeStrong((id *)&self->textureUV[8], 0);
  objc_storeStrong((id *)&self->textureUV[7], 0);
  objc_storeStrong((id *)&self->textureUV[6], 0);
  objc_storeStrong((id *)&self->textureUV[5], 0);
  objc_storeStrong((id *)&self->textureUV[4], 0);
  objc_storeStrong((id *)&self->textureUV[3], 0);
  objc_storeStrong((id *)&self->textureUV[2], 0);
  objc_storeStrong((id *)&self->textureUV[1], 0);
  objc_storeStrong((id *)self->textureUV, 0);
  objc_storeStrong((id *)&self->textureY[19], 0);
  objc_storeStrong((id *)&self->textureY[18], 0);
  objc_storeStrong((id *)&self->textureY[17], 0);
  objc_storeStrong((id *)&self->textureY[16], 0);
  objc_storeStrong((id *)&self->textureY[15], 0);
  objc_storeStrong((id *)&self->textureY[14], 0);
  objc_storeStrong((id *)&self->textureY[13], 0);
  objc_storeStrong((id *)&self->textureY[12], 0);
  objc_storeStrong((id *)&self->textureY[11], 0);
  objc_storeStrong((id *)&self->textureY[10], 0);
  objc_storeStrong((id *)&self->textureY[9], 0);
  objc_storeStrong((id *)&self->textureY[8], 0);
  objc_storeStrong((id *)&self->textureY[7], 0);
  objc_storeStrong((id *)&self->textureY[6], 0);
  objc_storeStrong((id *)&self->textureY[5], 0);
  objc_storeStrong((id *)&self->textureY[4], 0);
  objc_storeStrong((id *)&self->textureY[3], 0);
  objc_storeStrong((id *)&self->textureY[2], 0);
  objc_storeStrong((id *)&self->textureY[1], 0);
  objc_storeStrong((id *)self->textureY, 0);
}

- (void)clearLevel:(int)a3
{
  int levels;
  __CVBuffer **pixelBuffer;
  __CVBuffer *v6;
  uint64_t v7;
  __CVBuffer *v8;
  Class *v9;
  Class v10;
  Class v11;
  Class v12;
  Class v13;

  levels = self->levels;
  if (levels)
  {
    if (a3 < 0 || levels <= a3)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      pixelBuffer = self->pixelBuffer;
      v6 = self->pixelBuffer[a3];
      v7 = a3;
      if (v6)
      {
        CFRelease(v6);
        pixelBuffer[v7] = 0;
      }
      v8 = self->pixelBuffer2[v7];
      if (v8)
      {
        CFRelease(v8);
        self->pixelBuffer2[v7] = 0;
      }
      v9 = &self->super.isa + v7;
      v10 = v9[42];
      v9[42] = 0;

      v11 = v9[62];
      v9[62] = 0;

      v12 = v9[82];
      v9[82] = 0;

      v13 = v9[102];
      v9[102] = 0;

      self->isFP16[v7] = 0;
    }
  }
}

+ (int)pyramidMemorySize:(unsigned __int16)a3 height:(unsigned __int16)a4 overlapLevels:(BOOL)a5 allocLevel0:(BOOL)a6 levels:(unsigned __int8)a7 lumaFormat:(unint64_t)a8 chromaFormat:(unint64_t)a9 outSize:(unint64_t *)a10 metal:(id)a11
{
  _BOOL4 v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  int v36;
  unint64_t v38;
  _BOOL4 v39;
  unsigned int v40;
  unsigned int v41;
  id v42;

  v39 = a5;
  v40 = a7;
  v12 = a6;
  v41 = a4;
  v13 = a3;
  v42 = a11;
  if (a10
    && (v13 & 1) == 0
    && (v41 & 1) == 0
    && a9 | a8
    && (v14 = !v12, v40 > !v12)
    && (!a8 || objc_msgSend(v42, "getPixelSizeInBytes:", a8) && a8 <= 0x37 && ((1 << a8) & 0xE0000003D07C00) != 0)
    && (!a9
     || objc_msgSend(v42, "getPixelSizeInBytes:", a9)
     && a9 - 30 <= 0x23
     && ((1 << (a9 - 30)) & 0xF4000001FLL) != 0))
  {
    v38 = a8;
    v15 = 0;
    do
    {
      while (1)
      {
        v16 = v13;
        v17 = v13 >> v14;
        v18 = v41 >> v14;
        v19 = v42;
        objc_msgSend(v19, "device");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "deviceLinearTextureAlignmentBytes");

        v22 = objc_msgSend(v19, "getPixelSizeInBytes:", v38);
        v23 = v22 * v17;
        v24 = v22 * v17 % v21;
        if (v24)
          v23 = v22 * v17 + v21 - v24;
        v25 = v23 * v18;
        v26 = v17 >> 1;
        v27 = v18 >> 1;
        v28 = v19;
        objc_msgSend(v28, "device");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "deviceLinearTextureAlignmentBytes");

        v31 = objc_msgSend(v28, "getPixelSizeInBytes:", a9);
        v32 = v31 * v26;
        v33 = v31 * v26 % v30;
        if (v33)
          v32 = v31 * v26 + v30 - v33;
        v34 = v32 * v27;
        if (v39)
          break;
        v15 += v25 + v34;
        ++v14;
        v13 = v16;
        if (v40 == v14)
          goto LABEL_28;
      }
      if (v15 <= v25)
        v35 = v25;
      else
        v35 = v15;
      if (v35 <= v34)
        v15 = v34;
      else
        v15 = v35;
      ++v14;
      v13 = v16;
    }
    while (v40 != v14);
LABEL_28:
    v36 = 0;
    *a10 = v15;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v36 = FigSignalErrorAt();
  }

  return v36;
}

+ (int)pyramidMemorySize:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 lumaFormat:(unint64_t)a7 chromaFormat:(unint64_t)a8 outSize:(unint64_t *)a9 metal:(id)a10
{
  return +[PyramidStorage pyramidMemorySize:height:overlapLevels:allocLevel0:levels:lumaFormat:chromaFormat:outSize:metal:](PyramidStorage, "pyramidMemorySize:height:overlapLevels:allocLevel0:levels:lumaFormat:chromaFormat:outSize:metal:", a3, a4, 0, a5, a6, a7, a8, a9, a10);
}

+ (int)overlappingLevelsMemorySize:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 lumaFormat:(unint64_t)a7 chromaFormat:(unint64_t)a8 outSize:(unint64_t *)a9 metal:(id)a10
{
  return +[PyramidStorage pyramidMemorySize:height:overlapLevels:allocLevel0:levels:lumaFormat:chromaFormat:outSize:metal:](PyramidStorage, "pyramidMemorySize:height:overlapLevels:allocLevel0:levels:lumaFormat:chromaFormat:outSize:metal:", a3, a4, 1, a5, a6, a7, a8, a9, a10);
}

+ (int)allocatePyramidWithWidth:(unsigned __int16)a3 height:(unsigned __int16)a4 overlapLevels:(BOOL)a5 allocLevel0:(BOOL)a6 levels:(unsigned __int8)a7 texUsage:(unint64_t)a8 scratchBuffer:(id)a9 offset:(unint64_t *)a10 lumaFormat:(unint64_t)a11 chromaFormat:(unint64_t)a12 outPyramid:(id)a13 metal:(id)a14
{
  unsigned int v14;
  _BOOL4 v15;
  id v16;
  _DWORD *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  int v22;
  unint64_t v23;
  BOOL v24;
  char v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  const void *v47;
  uint64_t v48;
  const void *v49;
  unint64_t v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  _BOOL4 v85;
  char v86;
  _DWORD *v87;
  _DWORD *v88;
  unsigned int v89;
  unsigned int v90;
  id v91;
  id v92;
  unint64_t v93;
  void *v94;
  void *v95;
  unint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v101;
  uint64_t v102;

  v14 = a7;
  v15 = a6;
  v85 = a5;
  v89 = a4;
  v90 = a3;
  v16 = a9;
  v17 = a13;
  v91 = a14;
  if (a10)
  {
    v18 = *a10;
    if ((v90 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
    v18 = 0;
    if ((v90 & 1) != 0)
      goto LABEL_26;
  }
  if ((v89 & 1) != 0)
    goto LABEL_26;
  v19 = a12;
  if (__PAIR128__(a12, a11) == 0)
    goto LABEL_26;
  v20 = !v15;
  if (v20 >= v14)
    goto LABEL_26;
  if (a11)
  {
    v84 = 30;
    switch(a11)
    {
      case 0xAuLL:
        goto LABEL_13;
      case 0xBuLL:
        v84 = 31;
        v82 = a10;
        if (!a12)
          goto LABEL_42;
        goto LABEL_14;
      case 0xCuLL:
        v84 = 32;
        v82 = a10;
        if (!a12)
          goto LABEL_42;
        goto LABEL_14;
      case 0xDuLL:
        v84 = 33;
        v82 = a10;
        if (!a12)
          goto LABEL_42;
        goto LABEL_14;
      case 0xEuLL:
        v84 = 34;
        v82 = a10;
        if (!a12)
          goto LABEL_42;
        goto LABEL_14;
      case 0x14uLL:
        v84 = 60;
        v82 = a10;
        if (!a12)
          goto LABEL_42;
        goto LABEL_14;
      case 0x16uLL:
        v84 = 62;
        v82 = a10;
        if (!a12)
          goto LABEL_42;
        goto LABEL_14;
      case 0x17uLL:
        v84 = 63;
        v82 = a10;
        if (!a12)
          goto LABEL_42;
        goto LABEL_14;
      case 0x18uLL:
        v84 = 64;
        v82 = a10;
        if (!a12)
          goto LABEL_42;
        goto LABEL_14;
      case 0x19uLL:
        v84 = 65;
        v82 = a10;
        if (!a12)
          goto LABEL_42;
        goto LABEL_14;
      case 0x35uLL:
        v84 = 103;
        v82 = a10;
        if (!a12)
          goto LABEL_42;
        goto LABEL_14;
      case 0x36uLL:
        v84 = 104;
        v82 = a10;
        if (!a12)
          goto LABEL_42;
        goto LABEL_14;
      case 0x37uLL:
        v84 = 105;
        v82 = a10;
        if (!a12)
          goto LABEL_42;
        goto LABEL_14;
      default:
        goto LABEL_26;
    }
  }
  v84 = 0;
LABEL_13:
  v82 = a10;
  if (a12)
  {
LABEL_14:
    v21 = a12 - 30;
    if (a12 - 30 > 0x23)
      goto LABEL_26;
    if (((1 << v21) & 0x1F) == 0)
    {
      if (((1 << v21) & 0xF40000000) != 0)
      {
        v83 = 53;
        goto LABEL_43;
      }
LABEL_26:
      fig_log_get_emitter();
      FigDebugAssert3();
      v22 = FigSignalErrorAt();
      v95 = 0;

      goto LABEL_105;
    }
    v83 = 23;
  }
  else
  {
LABEL_42:
    v83 = 0;
  }
LABEL_43:
  v23 = v18;
  if (!v17)
    goto LABEL_26;
  v93 = 0;
  v94 = 0;
  v95 = 0;
  v17[2] = v14;
  if (a11)
    v24 = 0;
  else
    v24 = a12 == 65;
  v87 = v17 + 244;
  v88 = v17;
  v26 = v24 || a11 == 25;
  v86 = v26;
  v27 = &v17[2 * v20];
  v92 = v16;
  do
  {
    v96 = v23;
    v29 = v90 >> v20;
    v102 = v20;
    v30 = v89 >> v20;
    objc_msgSend(v91, "device");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "deviceLinearTextureAlignmentBytes");

    v33 = objc_msgSend(v91, "getPixelSizeInBytes:", a11);
    v34 = v33 * v29;
    v35 = v33 * v29 % v32;
    if (v35)
      v34 = v33 * v29 + v32 - v35;
    v97 = v34;
    v36 = v19;
    v37 = v29 >> 1;
    v38 = v91;
    objc_msgSend(v38, "device");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "deviceLinearTextureAlignmentBytes");

    v41 = objc_msgSend(v38, "getPixelSizeInBytes:", v36);
    v42 = v41 * v37;
    v43 = v41 * v37 % v40;
    if (v43)
      v42 = v41 * v37 + v40 - v43;
    v99 = v42;
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a11, v29, v30, 0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setUsage:", a8);
    v44 = v36;
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v36, v37, v30 >> 1, 0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setUsage:", a8);
    if (a11)
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v84, v37, v30, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v45)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v22 = FigSignalErrorAt();
        v95 = 0;
        v16 = v92;
        goto LABEL_111;
      }
      objc_msgSend(v45, "setUsage:", a8);
      v95 = v45;
    }
    if (v36)
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v83, v37, v30 >> 1, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v92;
      if (!v46)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v22 = FigSignalErrorAt();
        v94 = 0;
        goto LABEL_111;
      }
      objc_msgSend(v46, "setUsage:", a8);
      v94 = v46;
    }
    else
    {
      v16 = v92;
    }
    *((_BYTE *)v87 + v102) = v86;
    v47 = (const void *)v27[2];
    v48 = v99;
    if (v47)
    {
      CFRelease(v47);
      v27[2] = 0;
    }
    v49 = (const void *)v27[22];
    if (v49)
    {
      CFRelease(v49);
      v27[22] = 0;
    }
    v50 = v97 * v30;
    v51 = (void *)v27[42];
    v27[42] = 0;
    v52 = v99 * (v30 >> 1);

    v53 = (void *)v27[82];
    v27[82] = 0;

    v54 = (void *)v27[62];
    v27[62] = 0;

    v55 = (void *)v27[102];
    v27[102] = 0;

    if (v16)
    {
      if (!a11)
      {
        v17 = v88;
        v28 = v98;
        v19 = v44;
        if (!v44)
          goto LABEL_55;
LABEL_91:
        v74 = objc_msgSend(v16, "newTextureWithDescriptor:offset:bytesPerRow:", v28, v23, v99);
        v75 = (void *)v27[62];
        v27[62] = v74;

        if (!v27[62]
          || (v76 = objc_msgSend(v16, "newTextureWithDescriptor:offset:bytesPerRow:", v94, v23, v99),
              v77 = (void *)v27[102],
              v27[102] = v76,
              v77,
              !v27[102]))
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v22 = FigSignalErrorAt();
          goto LABEL_115;
        }
        v78 = v93;
        if (v93 <= v52)
          v78 = v52;
        v93 = v78;
        if (v85)
          v79 = 0;
        else
          v79 = v52;
        v23 += v79;
        goto LABEL_55;
      }
      v56 = objc_msgSend(v16, "newTextureWithDescriptor:offset:bytesPerRow:", v101, v23, v97);
      v57 = (void *)v27[42];
      v27[42] = v56;

      v28 = v98;
      if (!v27[42]
        || (v58 = objc_msgSend(v16, "newTextureWithDescriptor:offset:bytesPerRow:", v95, v23, v97),
            v59 = (void *)v27[82],
            v27[82] = v58,
            v59,
            !v27[82]))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v22 = FigSignalErrorAt();
        v17 = v88;
        goto LABEL_115;
      }
      v60 = v93;
      if (v93 <= v50)
        v60 = v50;
      v93 = v60;
      if (v85)
        v61 = 0;
      else
        v61 = v50;
      v23 += v61;
      v17 = v88;
      v19 = v44;
      if (v44)
        goto LABEL_91;
    }
    else
    {
      if (a11)
      {
        objc_msgSend(v38, "device");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (void *)objc_msgSend(v62, "newBufferWithLength:options:", v50, 0);

        v64 = objc_msgSend(v63, "newTextureWithDescriptor:offset:bytesPerRow:", v101, 0, v97);
        v65 = (void *)v27[42];
        v27[42] = v64;

        if (!v27[42]
          || (v66 = objc_msgSend(v63, "newTextureWithDescriptor:offset:bytesPerRow:", v95, 0, v97),
              v67 = (void *)v27[82],
              v27[82] = v66,
              v67,
              !v27[82]))
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v16 = v92;
          v22 = FigSignalErrorAt();

LABEL_111:
          v17 = v88;
          v28 = v98;
LABEL_115:

          goto LABEL_104;
        }

        v16 = v92;
        v48 = v99;
      }
      v19 = v36;
      if (v36)
      {
        objc_msgSend(v38, "device");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)objc_msgSend(v68, "newBufferWithLength:options:", v52, 0);

        v28 = v98;
        v70 = objc_msgSend(v69, "newTextureWithDescriptor:offset:bytesPerRow:", v98, 0, v48);
        v71 = (void *)v27[62];
        v27[62] = v70;

        v23 = v96;
        if (!v27[62])
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v17 = v88;
LABEL_114:
          v22 = FigSignalErrorAt();

          goto LABEL_115;
        }
        v72 = objc_msgSend(v69, "newTextureWithDescriptor:offset:bytesPerRow:", v94, 0, v48);
        v73 = (void *)v27[102];
        v27[102] = v72;

        v17 = v88;
        if (!v27[102])
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_114;
        }

      }
      else
      {
        v17 = v88;
        v28 = v98;
        v23 = v96;
      }
    }
LABEL_55:

    v20 = v102 + 1;
    ++v27;
  }
  while (v17[2] > (int)v102 + 1);
  if (v82)
  {
    v22 = 0;
    v80 = v93;
    if (!v85)
      v80 = 0;
    *v82 = v80 + v23;
  }
  else
  {
    v22 = 0;
  }
LABEL_104:

LABEL_105:
  return v22;
}

+ (int)allocatePyramidWithWidth:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 texUsage:(unint64_t)a7 scratchBuffer:(id)a8 offset:(unint64_t *)a9 lumaFormat:(unint64_t)a10 chromaFormat:(unint64_t)a11 outPyramid:(id)a12 metal:(id)a13
{
  return +[PyramidStorage allocatePyramidWithWidth:height:overlapLevels:allocLevel0:levels:texUsage:scratchBuffer:offset:lumaFormat:chromaFormat:outPyramid:metal:](PyramidStorage, "allocatePyramidWithWidth:height:overlapLevels:allocLevel0:levels:texUsage:scratchBuffer:offset:lumaFormat:chromaFormat:outPyramid:metal:", a3, a4, 0, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

+ (int)allocateOverlappingLevelsWithWidth:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 texUsage:(unint64_t)a7 scratchBuffer:(id)a8 offset:(unint64_t *)a9 lumaFormat:(unint64_t)a10 chromaFormat:(unint64_t)a11 outPyramid:(id)a12 metal:(id)a13
{
  return +[PyramidStorage allocatePyramidWithWidth:height:overlapLevels:allocLevel0:levels:texUsage:scratchBuffer:offset:lumaFormat:chromaFormat:outPyramid:metal:](PyramidStorage, "allocatePyramidWithWidth:height:overlapLevels:allocLevel0:levels:texUsage:scratchBuffer:offset:lumaFormat:chromaFormat:outPyramid:metal:", a3, a4, 1, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

+ (id)createTextureAlias:(id)a3
{
  _DWORD *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_opt_new();
    v5 = (_BYTE *)v4;
    if (v4)
    {
      *(_DWORD *)(v4 + 8) = v3[2];
      if ((int)v3[2] >= 1)
      {
        v6 = 0;
        v7 = 976;
        do
        {
          objc_storeStrong((id *)&v5[v6 * 4 + 336], *(id *)&v3[v6 + 84]);
          objc_storeStrong((id *)&v5[v6 * 4 + 496], *(id *)&v3[v6 + 124]);
          objc_storeStrong((id *)&v5[v6 * 4 + 656], *(id *)&v3[v6 + 164]);
          objc_storeStrong((id *)&v5[v6 * 4 + 816], *(id *)&v3[v6 + 204]);
          v5[v7] = *((_BYTE *)v3 + v7);
          v8 = v7 - 975;
          ++v7;
          v6 += 2;
        }
        while (v8 < (int)v3[2]);
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v5 = 0;
  }

  return v5;
}

- (int)setLumaTexture:(id)a3 chromaTexture:(id)a4 level:(int)a5 metal:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  id *v17;
  id *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  Class *v23;
  Class v24;
  int v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (a5 < 0)
    goto LABEL_13;
  if (self->levels <= a5)
    goto LABEL_13;
  v14 = objc_msgSend(v11, "pixelFormat");
  if ((v14 == 25) != (objc_msgSend(v12, "pixelFormat") == 65))
    goto LABEL_13;
  v15 = v14 == 25;
  v16 = a5;
  self->isFP16[a5] = v15;
  v17 = (id *)&self->textureY[a5];
  objc_storeStrong(v17, a3);
  if (!*v17)
    goto LABEL_13;
  v18 = (id *)(&self->super.isa + v16);
  objc_storeStrong(v18 + 62, a4);
  if (!v18[62])
    goto LABEL_13;
  objc_msgSend(v13, "rebindTex:format:usage:plane:xFactor:", *v17, objc_msgSend(v12, "pixelFormat"), 23, objc_msgSend(v11, "iosurfacePlane"), 2);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v18[82];
  v18[82] = (id)v19;

  if (!v18[82])
    goto LABEL_13;
  v21 = self->isFP16[v16] ? 53 : 23;
  objc_msgSend(v13, "rebindTex:format:usage:plane:xFactor:", v18[62], v21, 23, objc_msgSend(v12, "iosurfacePlane"), 1);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = &self->super.isa + v16;
  v24 = v23[102];
  v23[102] = (Class)v22;

  if (v23[102])
  {
    v25 = 0;
  }
  else
  {
LABEL_13:
    fig_log_get_emitter();
    FigDebugAssert3();
    v25 = FigSignalErrorAt();
  }

  return v25;
}

- (int)setPixelBufferForLuma:(__CVBuffer *)a3 optionalChroma:(__CVBuffer *)a4 level:(int)a5 metal:(id)a6
{
  uint64_t v7;

  if (a4)
    return -[PyramidStorage setPixelBufferFloat16:chromaBuffer:level:metal:](self, "setPixelBufferFloat16:chromaBuffer:level:metal:", a3, a4, *(_QWORD *)&a5, a6);
  v7 = 23;
  if (!a5)
    v7 = 17;
  return -[PyramidStorage setPixelBuffer:level:texUsage:metal:alignDims:](self, "setPixelBuffer:level:texUsage:metal:alignDims:", a3, *(_QWORD *)&a5, v7, a6, a5 == 0);
}

@end
