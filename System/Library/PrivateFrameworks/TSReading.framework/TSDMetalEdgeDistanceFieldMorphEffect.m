@implementation TSDMetalEdgeDistanceFieldMorphEffect

+ (void)willBeginWithDevice:(id)a3 pixelFormat:(unint64_t)a4 motionBlur:(BOOL)a5 motionBlurIgnoreTextureOpacity:(BOOL)a6
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!s_TSDMetalEdgeDistanceFieldMorphEffect_shader)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDDD6A8]);
    objc_msgSend(v7, "setPixelFormat:", a4);
    objc_msgSend(v7, "setBlendingEnabled:", 1);
    objc_msgSend(v7, "setRgbBlendOperation:", 0);
    objc_msgSend(v7, "setAlphaBlendOperation:", 0);
    objc_msgSend(v7, "setSourceRGBBlendFactor:", 1);
    objc_msgSend(v7, "setSourceAlphaBlendFactor:", 1);
    objc_msgSend(v7, "setDestinationRGBBlendFactor:", 5);
    objc_msgSend(v7, "setDestinationAlphaBlendFactor:", 5);
    v8 = -[TSDMetalShader initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:]([TSDMetalShader alloc], "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("TSDMetalEdgeDistanceField_Morph_VertexShader"), CFSTR("TSDMetalEdgeDistanceField_Morph_FragmentShader"), v10, CFSTR("KeynoteMetalLibrary"), v7);
    v9 = (void *)s_TSDMetalEdgeDistanceFieldMorphEffect_shader;
    s_TSDMetalEdgeDistanceFieldMorphEffect_shader = (uint64_t)v8;

  }
  +[TSDMetalEdgeDistanceField willBeginWithDevice:](TSDMetalEdgeDistanceField, "willBeginWithDevice:", v10);
  ++s_TSDMetalEdgeDistanceFieldMorphEffectPipelineReferenceCount;

}

+ (void)didEndWithDevice:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[TSDMetalEdgeDistanceField didEndWithDevice:](TSDMetalEdgeDistanceField, "didEndWithDevice:", a3);
  v3 = s_TSDMetalEdgeDistanceFieldMorphEffectPipelineReferenceCount;
  v4 = --s_TSDMetalEdgeDistanceFieldMorphEffectPipelineReferenceCount;
  if (v3 > 0)
  {
    if (v4)
      return;
LABEL_5:
    v8 = (void *)s_TSDMetalEdgeDistanceFieldMorphEffect_shader;
    s_TSDMetalEdgeDistanceFieldMorphEffect_shader = 0;

    return;
  }
  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDMetalEdgeDistanceFieldMorphEffect didEndWithDevice:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 553, CFSTR("overreleasing pipeline reference count!"));

  if (!s_TSDMetalEdgeDistanceFieldMorphEffectPipelineReferenceCount)
    goto LABEL_5;
}

- (TSDMetalEdgeDistanceFieldMorphEffect)initWithOutgoingTR:(id)a3 incomingTR:(id)a4 metalContext:(id)a5 motionBlur:(BOOL)a6 motionBlurIgnoreTextureOpacity:(BOOL)a7 capabilities:(id)a8
{
  _BOOL8 v9;
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  TSDMetalEdgeDistanceFieldMorphEffect *v55;
  unint64_t v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  id v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;

  v9 = a7;
  v10 = a6;
  v73 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v67 = a8;
  objc_msgSend(v16, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "willBeginWithDevice:pixelFormat:motionBlur:motionBlurIgnoreTextureOpacity:", v17, objc_msgSend(v16, "pixelFormat"), v10, v9);
  v68 = v17;
  objc_storeStrong((id *)&self->_metalDevice, v17);
  -[TSDMetalEdgeDistanceFieldMorphEffect p_actualPixelBoundsOfTexturedRectangle:](self, "p_actualPixelBoundsOfTexturedRectangle:", v14);
  v65 = v19;
  v66 = v18;
  v63 = v21;
  v64 = v20;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(v14, "textColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v9;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldMorphEffect initWithOutgoingTR:incomingTR:metalContext:motionBlur:motionBlurIgnoreTextureOpacity:capabilities:]");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 578, CFSTR("outgoingColor is nil!"));

    v9 = v24;
  }
  objc_msgSend(v22, "getRGBAComponents:", &v71);
  v27 = v71;
  v28 = v72;
  -[TSDMetalEdgeDistanceFieldMorphEffect p_actualPixelBoundsOfTexturedRectangle:](self, "p_actualPixelBoundsOfTexturedRectangle:", v15);
  v61 = v30;
  v62 = v29;
  v59 = v32;
  v60 = v31;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v15, "textColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldMorphEffect initWithOutgoingTR:incomingTR:metalContext:motionBlur:motionBlurIgnoreTextureOpacity:capabilities:]");
    v58 = v10;
    v35 = v9;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v36, v37, 586, CFSTR("incomingColor is nil!"));

    v9 = v35;
    v10 = v58;

  }
  *(float *)&v38 = *((double *)&v28 + 1);
  *(float *)&v39 = *(double *)&v28;
  v57 = __PAIR64__(v38, v39);
  *(float *)&v40 = *((double *)&v27 + 1);
  *(float *)&v41 = *(double *)&v27;
  objc_msgSend(v33, "getRGBAComponents:", &v69);
  *(float *)&v42 = *(double *)&v69;
  *(float *)&v43 = *((double *)&v69 + 1);
  *(float *)&v44 = *(double *)&v70;
  *(float *)&v45 = *((double *)&v70 + 1);
  objc_msgSend(v16, "device");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setupMetalTextureForDevice:", v46);

  objc_msgSend(v14, "metalTexture");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  v49 = v48;
  v51 = v50;
  objc_msgSend(v15, "metalTexture");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v55 = -[TSDMetalEdgeDistanceFieldMorphEffect initWithOutgoingTextureName:outgoingTextureSize:outgoingTextBounds:outgoingColor:incomingTextureName:incomingTextureSize:incomingTextBounds:incomingColor:metalContext:motionBlur:motionBlurIgnoreTextureOpacity:capabilities:](self, "initWithOutgoingTextureName:outgoingTextureSize:outgoingTextBounds:outgoingColor:incomingTextureName:incomingTextureSize:incomingTextBounds:incomingColor:metalContext:motionBlur:motionBlurIgnoreTextureOpacity:capabilities:", v47, v52, v16, v10, v9, v67, v49, v51, v66, v65, v64, v63, __PAIR64__(v40, v41), v57, v53, v54,
          v62,
          v61,
          v60,
          v59,
          __PAIR64__(v43, v42),
          __PAIR64__(v45, v44));

  return v55;
}

- (id)initWithOutgoingTextureName:(double)a3 outgoingTextureSize:(double)a4 outgoingTextBounds:(double)a5 outgoingColor:(double)a6 incomingTextureName:(double)a7 incomingTextureSize:(uint64_t)a8 incomingTextBounds:(void *)a9 incomingColor:(void *)a10 metalContext:(void *)a11 motionBlur:(uint64_t)a12 motionBlurIgnoreTextureOpacity:(uint64_t)a13 capabilities:(void *)a14
{
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  double v60;
  double v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  objc_super v64;

  v38 = a9;
  v39 = a10;
  v40 = a11;
  v41 = a14;
  v64.receiver = a1;
  v64.super_class = (Class)TSDMetalEdgeDistanceFieldMorphEffect;
  v42 = objc_msgSendSuper2(&v64, sel_init);
  if (v42)
  {
    objc_msgSend(v40, "device");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)*((_QWORD *)v42 + 30);
    *((_QWORD *)v42 + 30) = v43;

    v45 = a3 / 3.0;
    if (a2 > a3 / 3.0)
      v45 = a2;
    v46 = a22 / 3.0;
    if (a21 > a22 / 3.0)
      v46 = a21;
    v60 = a7;
    v61 = a6;
    v47 = round(v45 * -0.05);
    v48 = round(v46 * -0.05);
    +[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:](TSDMetalEdgeDistanceField, "distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:", v38, 0, 1, 0, v40, v41, a2, a3, 0.0, v47, 0.0, v47, 1.0);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)*((_QWORD *)v42 + 32);
    *((_QWORD *)v42 + 32) = v49;

    +[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:](TSDMetalEdgeDistanceField, "distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:", v39, 0, 1, 0, v40, v41, a21, a22, 0.0, v48, 0.0, v48, 1.0);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)*((_QWORD *)v42 + 33);
    *((_QWORD *)v42 + 33) = v51;

    CGAffineTransformMakeScale(&v63, a2 / (double)objc_msgSend(*((id *)v42 + 32), "width"), a3 / (double)objc_msgSend(*((id *)v42 + 32), "height"));
    v53 = *(_OWORD *)&v63.c;
    *((_OWORD *)v42 + 7) = *(_OWORD *)&v63.a;
    *((_OWORD *)v42 + 8) = v53;
    *((_OWORD *)v42 + 9) = *(_OWORD *)&v63.tx;
    v54 = *((_OWORD *)v42 + 8);
    *(_OWORD *)&v62.a = *((_OWORD *)v42 + 7);
    *(_OWORD *)&v62.c = v54;
    *(_OWORD *)&v62.tx = *((_OWORD *)v42 + 9);
    CGAffineTransformTranslate(&v63, &v62, -v47 / a2, -0.0 / a3);
    v55 = *(_OWORD *)&v63.c;
    *((_OWORD *)v42 + 7) = *(_OWORD *)&v63.a;
    *((_OWORD *)v42 + 8) = v55;
    *((_OWORD *)v42 + 9) = *(_OWORD *)&v63.tx;
    CGAffineTransformMakeScale(&v63, a21 / (double)objc_msgSend(*((id *)v42 + 33), "width"), a22 / (double)objc_msgSend(*((id *)v42 + 33), "height"));
    v56 = *(_OWORD *)&v63.c;
    *((_OWORD *)v42 + 10) = *(_OWORD *)&v63.a;
    *((_OWORD *)v42 + 11) = v56;
    *((_OWORD *)v42 + 12) = *(_OWORD *)&v63.tx;
    v57 = *((_OWORD *)v42 + 11);
    *(_OWORD *)&v62.a = *((_OWORD *)v42 + 10);
    *(_OWORD *)&v62.c = v57;
    *(_OWORD *)&v62.tx = *((_OWORD *)v42 + 12);
    CGAffineTransformTranslate(&v63, &v62, -v48 / a21, -0.0 / a22);
    v58 = *(_OWORD *)&v63.c;
    *((_OWORD *)v42 + 10) = *(_OWORD *)&v63.a;
    *((_OWORD *)v42 + 11) = v58;
    *((_OWORD *)v42 + 12) = *(_OWORD *)&v63.tx;
    *((double *)v42 + 2) = a4;
    *((double *)v42 + 3) = a5;
    *((double *)v42 + 4) = v61;
    *((double *)v42 + 5) = v60;
    *((_QWORD *)v42 + 6) = a23;
    *((_QWORD *)v42 + 7) = a24;
    *((_QWORD *)v42 + 8) = a25;
    *((_QWORD *)v42 + 9) = a26;
    *((_DWORD *)v42 + 20) = a17;
    *((_DWORD *)v42 + 21) = a18;
    *((_DWORD *)v42 + 22) = a19;
    *((_DWORD *)v42 + 23) = a20;
    *((_DWORD *)v42 + 24) = a27;
    *((_DWORD *)v42 + 25) = a28;
    *((_DWORD *)v42 + 26) = a29;
    *((_DWORD *)v42 + 27) = a30;
  }

  return v42;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDMetalEdgeDistanceFieldMorphEffect teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)TSDMetalEdgeDistanceFieldMorphEffect;
  -[TSDMetalEdgeDistanceFieldMorphEffect dealloc](&v3, sel_dealloc);
}

- (void)teardown
{
  if (!self->_didTeardown)
    self->_didTeardown = 1;
}

- (CGContext)newContextFromTexture:(id)a3
{
  id v3;
  void *v4;
  CGImage *v5;
  CGImage *v6;
  double Width;
  CGContext *v8;
  CGRect v10;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = (CGImage *)objc_msgSend(v3, "image")) != 0)
  {
    v6 = v5;
    Width = (double)CGImageGetWidth(v5);
    CGImageGetHeight(v6);
    v8 = TSDBitmapContextCreate(3, Width);
    v10.origin.x = TSDRectWithSize();
    CGContextDrawImage(v8, v10, v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGRect)p_actualPixelBoundsOfTexturedRectangle:(id)a3
{
  id v4;
  CGContext *v5;
  CGContext *v6;
  size_t BytesPerRow;
  _BYTE *Data;
  _BYTE *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  int64_t v28;
  double v29;
  uint64_t v30;
  size_t v31;
  unint64_t v32;
  size_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  float v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  unint64_t v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  void *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  float v73;
  double v74;
  unint64_t v75;
  uint64_t v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  float v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  CGRect result;

  v4 = a3;
  v5 = -[TSDMetalEdgeDistanceFieldMorphEffect newContextFromTexture:](self, "newContextFromTexture:", v4);
  v6 = v5;
  if (v5 && (BytesPerRow = CGBitmapContextGetBytesPerRow(v5), (Data = CGBitmapContextGetData(v6)) != 0))
  {
    v9 = Data;
    objc_msgSend(v4, "size");
    v11 = v10;
    objc_msgSend(v4, "contentRect");
    v13 = v12;
    objc_msgSend(v4, "size");
    v15 = v14;
    objc_msgSend(v4, "contentRect");
    v17 = vcvtmd_s64_f64(v15 * v16);
    objc_msgSend(v4, "size");
    v19 = v18;
    objc_msgSend(v4, "contentRect");
    v21 = v20;
    objc_msgSend(v4, "size");
    v23 = v22;
    objc_msgSend(v4, "contentRect");
    v27 = vcvtpd_s64_f64(v23 * v26);
    if (v17 >= v27)
    {
LABEL_11:
      CGContextRelease(v6);
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldMorphEffect p_actualPixelBoundsOfTexturedRectangle:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, v40, 717, CFSTR("Couldn't find non-zero pixel from bottom!"));

    }
    else
    {
      v28 = vcvtmd_s64_f64(v11 * v13);
      v29 = v19 * v21;
      v30 = vcvtpd_s64_f64(v19 * v21);
      v31 = BytesPerRow >> 2;
      v32 = (unint64_t)(v28 + (_DWORD)v17 * (BytesPerRow >> 2)) << 32;
      v33 = BytesPerRow >> 2 << 32;
      v34 = v17;
      while (1)
      {
        v35 = v32;
        v36 = v30;
        if (v30 > v28)
        {
          while (1)
          {
            LOBYTE(v29) = v9[(v35 >> 30) + 3];
            v37 = (double)*(unint64_t *)&v29 * 0.00390640259;
            v29 = v37;
            if (v29 > 0.05)
              break;
            --v36;
            v35 += 0x100000000;
            if (v28 == v36)
              goto LABEL_10;
          }
          if (v34 != -1)
            break;
        }
LABEL_10:
        ++v34;
        v32 += v33;
        if (v34 == v27)
          goto LABEL_11;
      }
      v52 = (double)v34;
      v53 = ((unint64_t)(v31 * (v27 - 1)) << 32) + (v28 << 32);
      do
      {
        if (v27 <= v17)
        {
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", -1.0, v52, 0.00390640259, 0.05);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldMorphEffect p_actualPixelBoundsOfTexturedRectangle:]");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = CFSTR("Couldn't find non-zero pixel from top!");
          v62 = v58;
          v63 = v59;
          v64 = v60;
          v65 = 735;
          goto LABEL_25;
        }
        --v27;
        v54 = -1.0;
        v55 = v53;
        v56 = v30 - v28;
        if (v30 > v28)
        {
          while (1)
          {
            LOBYTE(v24) = v9[(v55 >> 30) + 3];
            v57 = (double)*(unint64_t *)&v24 * 0.00390640259;
            v24 = v57;
            if (v24 > 0.05)
              break;
            v55 += 0x100000000;
            if (!--v56)
              goto LABEL_22;
          }
          v54 = (double)v27;
        }
LABEL_22:
        v53 -= v33;
      }
      while (v54 == -1.0);
      if (v30 <= v28)
      {
LABEL_34:
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldMorphEffect p_actualPixelBoundsOfTexturedRectangle:]");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = CFSTR("Couldn't find non-zero pixel from left!");
        v62 = v58;
        v63 = v59;
        v64 = v60;
        v65 = 755;
      }
      else
      {
        v66 = (uint64_t)v52;
        *(_QWORD *)&v67 = (uint64_t)v52;
        v68 = (double)(uint64_t)v52;
        v69 = (unint64_t)(v28 + (uint64_t)v52 * (_DWORD)v31) << 32;
        v70 = v28;
        while (1)
        {
          v71 = (uint64_t)v52 + 1;
          v72 = v69;
          if (v54 >= v68)
          {
            while (1)
            {
              LOBYTE(v67) = v9[(v72 >> 30) + 3];
              v73 = (double)*(unint64_t *)&v67 * 0.00390640259;
              v67 = v73;
              if (v67 > 0.05)
                break;
              v67 = (double)v71;
              v72 += v33;
              ++v71;
              if (v54 < v67)
                goto LABEL_33;
            }
            if (v70 != -1)
              break;
          }
LABEL_33:
          ++v70;
          v69 += 0x100000000;
          if (v70 == v30)
            goto LABEL_34;
        }
        v74 = (double)v70;
        v75 = (unint64_t)(v30 + v66 * v31 - 1) << 32;
        v76 = v66 + 1;
        while (v30 > v28)
        {
          --v30;
          v77 = -1.0;
          v78 = v76;
          v79 = v75;
          if (v54 >= v68)
          {
            while (1)
            {
              LOBYTE(v25) = v9[(v79 >> 30) + 3];
              v80 = (double)*(unint64_t *)&v25 * 0.00390640259;
              v25 = v80;
              if (v25 > 0.05)
                break;
              v25 = (double)v78;
              v79 += v33;
              ++v78;
              if (v54 < v25)
                goto LABEL_42;
            }
            v77 = (double)v30;
          }
LABEL_42:
          v75 -= 0x100000000;
          if (v77 != -1.0)
          {
            v81 = TSDAddPoints(v74, v52, 0.5);
            v83 = v82;
            v84 = TSDAddPoints(v77, v54, 0.5);
            v86 = v85;
            objc_msgSend(v4, "size");
            v87 = TSDRectWithSize();
            v90 = TSDNormalizedPointInRect(v81, v83, v87, v88, v89);
            v92 = v91;
            objc_msgSend(v4, "size");
            v93 = TSDRectWithSize();
            v96 = TSDNormalizedPointInRect(v84, v86, v93, v94, v95);
            v41 = TSDRectWithPoints(v90, v92, v96);
            v42 = v97;
            v43 = v98;
            v44 = v99;
            CGContextRelease(v6);
            goto LABEL_14;
          }
        }
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", v74);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldMorphEffect p_actualPixelBoundsOfTexturedRectangle:]");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = CFSTR("Couldn't find non-zero pixel from right!");
        v62 = v58;
        v63 = v59;
        v64 = v60;
        v65 = 775;
      }
LABEL_25:
      objc_msgSend(v62, "handleFailureInFunction:file:lineNumber:description:", v63, v64, v65, v61);

      CGContextRelease(v6);
    }
    v41 = *MEMORY[0x24BDBF090];
    v42 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v43 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v44 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    CGContextRelease(v6);
    objc_msgSend(v4, "size");
    v41 = TSDRectWithSize();
    v42 = v45;
    v43 = v46;
    v44 = v47;
  }
LABEL_14:

  v48 = v41;
  v49 = v42;
  v50 = v43;
  v51 = v44;
  result.size.height = v51;
  result.size.width = v50;
  result.origin.y = v49;
  result.origin.x = v48;
  return result;
}

- (BOOL)p_fillScanlineCenters:(CGPoint *)a3 scanlineMinMaxZeroes:(CGPoint *)a4 samples:(unint64_t)a5 fromTexture:(id)a6 textureSize:(CGSize)a7
{
  double height;
  double width;
  id v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  char v23;
  char *v24;
  double v25;
  double v26;
  char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  double v31;
  unsigned int v32;
  void *v35;
  double v36;
  double v37;
  BOOL v38;
  BOOL v39;
  uint64_t v40;
  BOOL v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  double *p_x;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  unsigned int v54;
  double v55;
  int64x2_t v56;
  _BOOL8 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  float64x2_t v68;
  uint64_t v69;
  CGPoint *v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  CGPoint *v74;
  double v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  _QWORD v79[7];

  height = a7.height;
  width = a7.width;
  v12 = a6;
  v74 = a3;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_50:
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldMorphEffect p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:]");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, v63, 828, CFSTR("scanlineZeroes is NULL!"));

    if (a5)
      goto LABEL_4;
    goto LABEL_51;
  }
  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldMorphEffect p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:]");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, v60, 827, CFSTR("scanlineCenters is NULL!"));

  if (!a4)
    goto LABEL_50;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_51:
  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldMorphEffect p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:]");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "handleFailureInFunction:file:lineNumber:description:", v65, v66, 829, CFSTR("sampleCount is 0!"));

LABEL_4:
  v13 = (uint64_t)width;
  memset(v79, 0, 24);
  v79[3] = (uint64_t)width;
  v72 = 8 * (uint64_t)width;
  v73 = (uint64_t)height;
  v79[4] = (uint64_t)height;
  v79[5] = 1;
  v14 = (char *)malloc_type_malloc(v72 * (uint64_t)height, 0xDEA0744CuLL);
  objc_msgSend(v12, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v14, v72, v79, 0);
  v15 = (void *)objc_opt_new();
  if (a5)
  {
    v16 = 0;
    v17 = 0;
    v18 = (double)(a5 + 2);
    v19 = (double)(v13 - 1);
    v75 = (double)v13;
    v68 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v13), 0);
    v20 = 2 - v13;
    v69 = v13;
    v70 = a4;
    v71 = a5;
    do
    {
      v77 = v16 + 1;
      v78 = v17;
      v21 = (double)(unint64_t)((v16 + 1) * v73) / v18;
      v22 = (unint64_t)v21;
      v76 = (unint64_t)v21;
      if (v13 < 3)
      {
        v28 = -1000;
      }
      else
      {
        v23 = 0;
        v24 = &v14[8 * v22 * v13];
        v25 = COERCE_FLOAT(((*((unsigned __int16 *)v24 + 4) << 16) & 0x80000000 | (((*((unsigned __int16 *)v24 + 4) >> 10) & 0x1F) << 23) | ((*((_WORD *)v24 + 4) & 0x3FF) << 13))+ 939524096);
        v26 = COERCE_FLOAT(((*(unsigned __int16 *)v24 << 16) & 0x80000000 | (((*(unsigned __int16 *)v24 >> 10) & 0x1F) << 23) | ((*(_WORD *)v24 & 0x3FF) << 13))+ 939524096);
        v27 = &v14[v72 * v22 + 16];
        v28 = -1000;
        v29 = 1.79769313e308;
        v30 = 1;
        do
        {
          v31 = v26;
          v32 = *(unsigned __int16 *)v27;
          v27 += 8;
          v26 = v25;
          v25 = COERCE_FLOAT(((v32 << 16) & 0x80000000 | (((v32 >> 10) & 0x1F) << 23) | ((v32 & 0x3FF) << 13)) + 939524096);
          if (v26 >= v31 && v26 >= v25 && v26 != v25)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v30);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v35);

          }
          v36 = fabs(v26);
          v37 = fabs(v29);
          v38 = v36 < v37;
          v39 = v36 >= v37;
          if (v36 < v37)
            v21 = v26;
          else
            v21 = v29;
          if (v38)
            v40 = v30;
          else
            v40 = v28;
          v41 = (v23 & 1) == 0;
          v23 = (v23 & 1) != 0 || v39;
          if (v41)
            v29 = v21;
          if (v41)
            v28 = v40;
          ++v30;
        }
        while (v20 + v30 != 1);
      }
      v42 = -1.0;
      v43 = -1.0;
      if (objc_msgSend(v15, "count", v21))
      {
        objc_msgSend(v15, "firstObject");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "doubleValue");
        v43 = v45 / v75;

      }
      v13 = v69;
      if ((unint64_t)objc_msgSend(v15, "count") >= 2)
      {
        objc_msgSend(v15, "lastObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "doubleValue");
        v42 = v47 / v75;

      }
      p_x = &v74[v16].x;
      *p_x = v43;
      p_x[1] = v42;
      if (v42 <= v19)
      {
        a5 = v71;
        v50 = &v14[v72 - 8 + v72 * v76];
        v51 = -1000;
        v52 = 1.79769313e308;
        v53 = v69;
        while (1)
        {
          v49 = v51;
          v54 = *(unsigned __int16 *)v50;
          v50 -= 8;
          v51 = v53;
          v55 = fabs(v52);
          v52 = COERCE_FLOAT(((v54 << 16) & 0x80000000 | (((v54 >> 10) & 0x1F) << 23) | ((v54 & 0x3FF) << 13)) + 939524096);
          if (fabs(v52) > v55)
            break;
          --v53;
          if (v42 > (double)(v51 - 2))
          {
            v49 = v51;
            break;
          }
        }
      }
      else
      {
        v49 = -1000;
        a5 = v71;
      }
      v56.i64[0] = v28;
      v56.i64[1] = v49;
      v70[v16] = (CGPoint)vdivq_f64(vcvtq_f64_s64(v56), v68);
      v57 = v42 != -1.0 || v43 != -1.0;
      v17 = v78 + v57;
      objc_msgSend(v15, "removeAllObjects");
      ++v16;
    }
    while (v77 != a5);
  }
  else
  {
    v17 = 0;
  }
  free(v14);

  return v17 > a5 >> 1;
}

- (double)p_errorFromApplyingTextureAdjustment:(id)a3 toOutgoingValue:(double)a4 incomingValue:(double)a5 sample:(unint64_t)a6 sampleCount:(unint64_t)a7
{
  double var0;
  double result;
  double var2;
  double var1;
  double v14;
  double v15;
  double v16;

  var0 = a3.var0;
  result = 0.0;
  if (a4 >= 0.0 && a5 >= 0.0)
  {
    var2 = a3.var2;
    var1 = a3.var1;
    v14 = (double)(a6 + 1) / (double)(a7 + 2);
    -[TSDMetalTextureInfo size](self->_outgoingTextureInfo, "size");
    -[TSDMetalEdgeDistanceFieldMorphEffect p_affineTransformWithTextureAdjustment:textureSize:](self, "p_affineTransformWithTextureAdjustment:textureSize:", var0, var1, var2, v15, v16);
    return vabdd_f64(v14 * 0.0 + 0.0 * a4 + 0.0, a5);
  }
  return result;
}

- (double)p_errorFromApplyingTextureAdjustment:(id)a3 toOutgoingScanlineCenters:(CGPoint *)a4 outgoingScanlineZeroes:(CGPoint *)a5 incomingScanlineCenters:(CGPoint *)a6 incomingScanlineZeroes:(CGPoint *)a7 samples:(unint64_t)a8
{
  double var2;
  double var1;
  double var0;
  uint64_t v13;
  CGFloat *p_y;
  CGFloat *v15;
  CGFloat *v16;
  CGFloat *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  if (!a8)
    return 0.0;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v13 = 0;
  p_y = &a7->y;
  v15 = &a4->y;
  v16 = &a5->y;
  v17 = &a6->y;
  v18 = 0.0;
  do
  {
    v19 = *v15;
    v20 = *v17;
    -[TSDMetalEdgeDistanceFieldMorphEffect p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:](self, "p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:", v13, a8, var0, var1, var2, *(v15 - 1), *(v17 - 1));
    v22 = v21 + 0.0;
    -[TSDMetalEdgeDistanceFieldMorphEffect p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:](self, "p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:", v13, a8, var0, var1, var2, v19, v20);
    v24 = v22 + v23;
    v25 = *v16;
    v26 = *p_y;
    -[TSDMetalEdgeDistanceFieldMorphEffect p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:](self, "p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:", v13, a8, var0, var1, var2, *(v16 - 1), *(p_y - 1));
    v28 = v27 + 0.0;
    -[TSDMetalEdgeDistanceFieldMorphEffect p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:](self, "p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:", v13++, a8, var0, var1, var2, v25, v26);
    p_y += 2;
    v18 = v18 + v24 + (v28 + v29) * 0.25;
    v15 += 2;
    v16 += 2;
    v17 += 2;
  }
  while (a8 != v13);
  return v18;
}

- (CGAffineTransform)p_affineTransformWithTextureAdjustment:(SEL)a3 textureSize:(id)a4
{
  retstr->a = a4.var2;
  retstr->b = 0.0;
  retstr->c = a4.var0;
  retstr->d = 1.0;
  retstr->tx = a4.var1;
  retstr->ty = 0.0;
  return self;
}

- ($1AB5FA073B851C12C2339EC22442E995)textureMatchingTextureAdjustment
{
  double skewOffset;
  double scale;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  double v10;
  double v11;
  long double v12;
  double v13;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double skew;
  _BYTE v25[160];
  _BYTE v26[160];
  _BYTE v27[160];
  _BYTE v28[160];
  uint64_t v29;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v29 = *MEMORY[0x24BDAC8D0];
  if (self->_didSetupTextureAdjustment)
  {
    skewOffset = self->_textureAdjustment.skewOffset;
    skew = self->_textureAdjustment.skew;
    scale = self->_textureAdjustment.scale;
  }
  else
  {
    -[TSDMetalTextureInfo name](self->_outgoingTextureInfo, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDMetalTextureInfo size](self->_outgoingTextureInfo, "size");
    v6 = -[TSDMetalEdgeDistanceFieldMorphEffect p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:](self, "p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:", v28, v27, 10, v5);

    scale = 1.0;
    skew = 0.0;
    if (v6)
    {
      -[TSDMetalTextureInfo name](self->_incomingTextureInfo, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSDMetalTextureInfo size](self->_incomingTextureInfo, "size");
      v8 = -[TSDMetalEdgeDistanceFieldMorphEffect p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:](self, "p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:", v26, v25, 10, v7);

      skewOffset = 0.0;
      if (v8)
      {
        v9 = 0;
        v21 = 0.0;
        v22 = 0.0;
        v10 = 1.79769313e308;
        v11 = 1.0;
        skew = 0.0;
        do
        {
          v12 = 1.0 / exp2((double)v9);
          v23 = v12 * 0.5;
          v13 = v12 * 0.25;
          for (i = -1; i != 2; ++i)
          {
            for (j = -1; j != 2; ++j)
            {
              for (k = -1; k != 2; ++k)
              {
                -[TSDMetalEdgeDistanceFieldMorphEffect p_errorFromApplyingTextureAdjustment:toOutgoingScanlineCenters:outgoingScanlineZeroes:incomingScanlineCenters:incomingScanlineZeroes:samples:](self, "p_errorFromApplyingTextureAdjustment:toOutgoingScanlineCenters:outgoingScanlineZeroes:incomingScanlineCenters:incomingScanlineZeroes:samples:", v28, v27, v26, v25, 10, v21 + (double)i * v23, v22 + (double)j * v23, v11 + (double)k * v13);
                if (v17 < v10)
                {
                  v10 = v17;
                  skew = v21 + (double)i * v23;
                  skewOffset = v22 + (double)j * v23;
                  scale = v11 + (double)k * v13;
                }
              }
            }
          }
          ++v9;
          v11 = scale;
          v21 = skew;
          v22 = skewOffset;
        }
        while (v9 != 10);
      }
    }
    else
    {
      skewOffset = 0.0;
    }
    self->_textureAdjustment.skew = skew;
    self->_textureAdjustment.skewOffset = skewOffset;
    self->_textureAdjustment.scale = scale;
    self->_didSetupTextureAdjustment = 1;
  }
  v18 = skew;
  v19 = skewOffset;
  v20 = scale;
  result.var2 = v20;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (void)encodeWith:(id)a3 morphPercent:(double)a4 MVPMatrix:(CATransform3D *)a5 opacity:(double)a6 outgoingTextureMatrix:(CGAffineTransform *)a7 incomingTextureMatrix:(CGAffineTransform *)a8
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  float32x2_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  $43F634250C0E94E2A09AB0840E4770D1 incomingTextColor;
  void *v32;
  void *v33;
  CGAffineTransform v34;
  float32x4_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v14 = a3;
  if (self->_didTeardown)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalEdgeDistanceFieldMorphEffect encodeWith:morphPercent:MVPMatrix:opacity:outgoingTextureMatrix:incomingTextureMatrix:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 1116, CFSTR("Trying to draw after calling teardown!"));

  }
  v18 = *(_OWORD *)&self->_outgoingTextureEdgeInsetsAdjustmentMatrix.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_outgoingTextureEdgeInsetsAdjustmentMatrix.a;
  *(_OWORD *)&t1.c = v18;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_outgoingTextureEdgeInsetsAdjustmentMatrix.tx;
  v19 = *(_OWORD *)&a7->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a7->a;
  *(_OWORD *)&t2.c = v19;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a7->tx;
  CGAffineTransformConcat(&v34, &t1, &t2);
  v20 = *(_OWORD *)&v34.c;
  *(_OWORD *)&a7->a = *(_OWORD *)&v34.a;
  *(_OWORD *)&a7->c = v20;
  *(_OWORD *)&a7->tx = *(_OWORD *)&v34.tx;
  v21 = *(_OWORD *)&self->_incomingTextureEdgeInsetsAdjustmentMatrix.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_incomingTextureEdgeInsetsAdjustmentMatrix.a;
  *(_OWORD *)&t1.c = v21;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_incomingTextureEdgeInsetsAdjustmentMatrix.tx;
  v22 = *(_OWORD *)&a8->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a8->a;
  *(_OWORD *)&t2.c = v22;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a8->tx;
  CGAffineTransformConcat(&v34, &t1, &t2);
  v23 = *(_OWORD *)&v34.c;
  *(_OWORD *)&a8->a = *(_OWORD *)&v34.a;
  *(_OWORD *)&a8->c = v23;
  *(_OWORD *)&a8->tx = *(_OWORD *)&v34.tx;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v24 = vcvt_f32_f64(*(float64x2_t *)&a7->a);
  *(float32x2_t *)&v23 = vcvt_f32_f64(*(float64x2_t *)&a7->c);
  v25 = vcvt_f32_f64(*(float64x2_t *)&a7->tx);
  DWORD2(v36) = 0;
  *(float32x2_t *)&v36 = v24;
  DWORD2(v37) = 0;
  *(_QWORD *)&v37 = v23;
  DWORD2(v38) = 1065353216;
  *(float32x2_t *)&v38 = v25;
  v26 = vcvt_f32_f64(*(float64x2_t *)&a8->a);
  *(float32x2_t *)&v23 = vcvt_f32_f64(*(float64x2_t *)&a8->c);
  v27 = vcvt_f32_f64(*(float64x2_t *)&a8->tx);
  DWORD2(v39) = 0;
  *(float32x2_t *)&v39 = v26;
  DWORD2(v40) = 0;
  *(_QWORD *)&v40 = v23;
  DWORD2(v41) = 1065353216;
  *(float32x2_t *)&v41 = v27;
  v28 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m21), *(float64x2_t *)&a5->m23);
  v29 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m31), *(float64x2_t *)&a5->m33);
  v30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m41), *(float64x2_t *)&a5->m43);
  *(float32x4_t *)&v34.a = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m11), *(float64x2_t *)&a5->m13);
  *(float32x4_t *)&v34.c = v28;
  *(float32x4_t *)&v34.tx = v29;
  v35 = v30;
  t1.b = 0.0;
  v26.f32[0] = a4;
  *(float *)&v23 = a6;
  *(_QWORD *)&t1.a = __PAIR64__(v26.u32[0], v23);
  incomingTextColor = self->_incomingTextColor;
  *($43F634250C0E94E2A09AB0840E4770D1 *)&t1.c = self->_outgoingTextColor;
  *($43F634250C0E94E2A09AB0840E4770D1 *)&t1.tx = incomingTextColor;
  objc_msgSend((id)s_TSDMetalEdgeDistanceFieldMorphEffect_shader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v14, &v34, &t1);
  -[TSDMetalTextureInfo name](self->_outgoingTextureInfo, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFragmentTexture:atIndex:", v32, 0);

  -[TSDMetalTextureInfo name](self->_incomingTextureInfo, "name");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFragmentTexture:atIndex:", v33, 1);

}

- (void)encodeWith:(id)a3 morphPercent:(double)a4 MVPMatrix:(CATransform3D *)a5 opacity:(double)a6 generateTextureMatrices:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  __int128 v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  double width;
  double height;
  double v38;
  double v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  _OWORD v42[8];
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGRect v47;
  CGRect v48;

  v7 = a7;
  v12 = a3;
  v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v46.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v46.c = v13;
  *(_OWORD *)&v46.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v45.a = *(_OWORD *)&v46.a;
  *(_OWORD *)&v45.c = v13;
  *(_OWORD *)&v45.tx = *(_OWORD *)&v46.tx;
  if (v7)
  {
    if (!-[TSDMetalEdgeDistanceFieldMorphEffect isTextStyleIdenticalExceptSize](self, "isTextStyleIdenticalExceptSize"))
      goto LABEL_5;
    v14 = *MEMORY[0x24BDBF090];
    v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v47.origin.x = *(CGFloat *)MEMORY[0x24BDBF090];
    v47.origin.y = v15;
    v47.size.width = v16;
    v47.size.height = v17;
    if (CGRectEqualToRect(v47, self->_outgoingTextBounds)
      || (v48.origin.x = v14,
          v48.origin.y = v15,
          v48.size.width = v16,
          v48.size.height = v17,
          CGRectEqualToRect(v48, self->_incomingTextBounds)))
    {
LABEL_5:
      -[TSDMetalEdgeDistanceFieldMorphEffect textureMatchingTextureAdjustment](self, "textureMatchingTextureAdjustment");
      v18 = TSDMetalEdgeDistanceFieldTextureAdjustmentMix();
      v20 = v19;
      v22 = v21;
      v23 = TSDMetalEdgeDistanceFieldTextureAdjustmentMix();
      v25 = v24;
      v27 = v26;
      -[TSDMetalTextureInfo size](self->_outgoingTextureInfo, "size");
      -[TSDMetalEdgeDistanceFieldMorphEffect p_affineTransformWithTextureAdjustment:textureSize:](self, "p_affineTransformWithTextureAdjustment:textureSize:", v18, v20, v22, v28, v29);
      -[TSDMetalTextureInfo size](self->_incomingTextureInfo, "size");
      -[TSDMetalEdgeDistanceFieldMorphEffect p_affineTransformWithTextureAdjustment:textureSize:](self, "p_affineTransformWithTextureAdjustment:textureSize:", v23, v25, v27, v30, v31);
    }
    else
    {
      width = self->_outgoingTextBounds.size.width;
      if (width > 0.2)
      {
        height = self->_outgoingTextBounds.size.height;
        if (height > 0.2)
        {
          v38 = self->_incomingTextBounds.size.width;
          if (v38 > 0.2)
          {
            v39 = self->_incomingTextBounds.size.height;
            if (v39 > 0.2)
            {
              TSDTransformConvertingRectToRectAtPercent((uint64_t)&v44, self->_outgoingTextBounds.origin.x, width, height, self->_incomingTextBounds.origin.x, self->_incomingTextBounds.origin.y, v38, v39, a4);
              CGAffineTransformInvert(&v46, &v44);
              TSDTransformConvertingRectToRectAtPercent((uint64_t)&v43, self->_incomingTextBounds.origin.x, self->_incomingTextBounds.size.width, self->_incomingTextBounds.size.height, self->_outgoingTextBounds.origin.x, self->_outgoingTextBounds.origin.y, self->_outgoingTextBounds.size.width, self->_outgoingTextBounds.size.height, 1.0 - a4);
              CGAffineTransformInvert(&v45, &v43);
            }
          }
        }
      }
    }
  }
  v32 = *(_OWORD *)&a5->m33;
  v42[4] = *(_OWORD *)&a5->m31;
  v42[5] = v32;
  v33 = *(_OWORD *)&a5->m43;
  v42[6] = *(_OWORD *)&a5->m41;
  v42[7] = v33;
  v34 = *(_OWORD *)&a5->m13;
  v42[0] = *(_OWORD *)&a5->m11;
  v42[1] = v34;
  v35 = *(_OWORD *)&a5->m23;
  v42[2] = *(_OWORD *)&a5->m21;
  v42[3] = v35;
  v41 = v46;
  v40 = v45;
  -[TSDMetalEdgeDistanceFieldMorphEffect encodeWith:morphPercent:MVPMatrix:opacity:outgoingTextureMatrix:incomingTextureMatrix:](self, "encodeWith:morphPercent:MVPMatrix:opacity:outgoingTextureMatrix:incomingTextureMatrix:", v12, v42, &v41, &v40, a4, a6);

}

- (TSDMetalTextureInfo)outgoingTextureInfo
{
  return self->_outgoingTextureInfo;
}

- (TSDMetalTextureInfo)incomingTextureInfo
{
  return self->_incomingTextureInfo;
}

- (BOOL)isTextStyleIdenticalExceptSize
{
  return self->isTextStyleIdenticalExceptSize;
}

- (void)setIsTextStyleIdenticalExceptSize:(BOOL)a3
{
  self->isTextStyleIdenticalExceptSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingTextureInfo, 0);
  objc_storeStrong((id *)&self->_outgoingTextureInfo, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
}

@end
