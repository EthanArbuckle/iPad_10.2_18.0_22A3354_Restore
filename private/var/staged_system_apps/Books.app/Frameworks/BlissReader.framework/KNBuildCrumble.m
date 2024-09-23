@implementation KNBuildCrumble

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.Crumble");
}

+ (int)animationCategory
{
  return 203;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_469AA8;
}

+ (id)defaultAttributes
{
  const __CFString *v3;
  _UNKNOWN **v4;

  v3 = CFSTR("KNBuildAttributesDuration");
  v4 = &off_468FD8;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-builds-crumble");
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  uint64_t v8;
  id v11;
  void *v12;
  void *v13;
  id v14;

  if (a7)
  {
    v8 = *(_QWORD *)&a6;
    *a4 = CFSTR("apple:dissolve");
    v11 = KNBundle();
    v14 = (id)objc_claimAutoreleasedReturnValue(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("%@ builds were exported as Dissolve."), &stru_43D7D8, CFSTR("Keynote")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedMenuString:", v8));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13));

  }
}

- (KNBuildCrumble)initWithAnimationContext:(id)a3
{
  KNBuildCrumble *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  KNAnimParameterGroup *parameterGroup;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KNBuildCrumble;
  v3 = -[KNAnimationEffect initWithAnimationContext:](&v10, "initWithAnimationContext:", a3);
  if (v3)
  {
    v4 = KNBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathForResource:ofType:", CFSTR("Crumble"), CFSTR("parameterGroup")));

    v7 = objc_claimAutoreleasedReturnValue(+[KNAnimParameterGroup parameterGroupForFile:](KNAnimParameterGroup, "parameterGroupForFile:", v6));
    parameterGroup = v3->_parameterGroup;
    v3->_parameterGroup = (KNAnimParameterGroup *)v7;

  }
  return v3;
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;
  CGRect v39;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "textures"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v5, "contentRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  MinX = CGRectGetMinX(v31);
  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v13;
  MinY = CGRectGetMinY(v32);
  v33.origin.x = v7;
  v33.origin.y = v9;
  v33.size.width = v11;
  v33.size.height = v13;
  MaxX = CGRectGetMaxX(v33);
  v34.origin.x = v7;
  v34.origin.y = v9;
  v34.size.width = v11;
  v34.size.height = v13;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect", CGRectGetMaxY(v34));
  MaxY = CGRectGetMaxY(v35);
  if (v11 >= v13)
    v18 = v11;
  else
    v18 = v13;
  if (v18 >= 200.0)
    v19 = v18;
  else
    v19 = 200.0;
  v20 = TSDRectWithPoints(MinX - v19, MinY - v19, MaxX + v19, v19 * 0.5 + MaxY);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v39.origin.x = v27;
  v39.origin.y = v28;
  v39.size.width = v29;
  v39.size.height = v30;
  v36.origin.x = v20;
  v36.origin.y = v22;
  v36.size.width = v24;
  v36.size.height = v26;
  v37 = CGRectIntersection(v36, v39);
  result = CGRectIntegral(v37);
  self->_animationRect = result;
  self->_drawableFrame.origin.x = v7;
  self->_drawableFrame.origin.y = v9;
  self->_drawableFrame.size.width = v11;
  self->_drawableFrame.size.height = v13;
  return result;
}

- (void)p_setupMVPMatricesWithContext:(id)a3 device:(id)a4
{
  void *v6;
  void *v7;
  CGRect *p_animationRect;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double height;
  double v14;
  long double v15;
  long double v16;
  CATransform3D *p_projectionMatrix;
  CATransform3D *p_shadowFBOProjectionMatrix;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  double width;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CATransform3D v30;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v33;
  CATransform3D v34;
  CATransform3D v35;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "textures"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  objc_msgSend(v7, "frameOnCanvas");
  p_animationRect = &self->_animationRect;
  v10 = v9 - CGRectGetMinX(self->_animationRect);
  objc_msgSend(v7, "frameOnCanvas");
  v12 = v11 - CGRectGetMaxY(self->_animationRect);
  height = self->_animationRect.size.height;
  -[KNAnimationContext fieldOfViewInRadians](self->super.mAnimationContext, "fieldOfViewInRadians");
  v15 = tan(v14 * 0.5);
  v16 = height / (v15 + v15);
  memset(&v35, 0, sizeof(v35));
  TSDTransform3DMakeProjection(&v35, -[KNAnimationContext fieldOfViewInRadians](self->super.mAnimationContext, "fieldOfViewInRadians"));
  memset(&v34, 0, sizeof(v34));
  CATransform3DMakeTranslation(&v34, self->_animationRect.size.width * -0.5, self->_animationRect.size.height * -0.5, -v16);
  memset(&v33, 0, sizeof(v33));
  CATransform3DMakeTranslation(&v33, v10, -v12, 0.0);
  p_projectionMatrix = &self->_projectionMatrix;
  a = v34;
  v30 = v35;
  CATransform3DConcat(&b, &a, &v30);
  v30 = v33;
  CATransform3DConcat(&a, &v30, &b);
  p_shadowFBOProjectionMatrix = &self->_shadowFBOProjectionMatrix;
  v19 = *(_OWORD *)&a.m33;
  *(_OWORD *)&p_projectionMatrix->m31 = *(_OWORD *)&a.m31;
  *(_OWORD *)&p_projectionMatrix->m33 = v19;
  v20 = *(_OWORD *)&a.m43;
  *(_OWORD *)&p_projectionMatrix->m41 = *(_OWORD *)&a.m41;
  *(_OWORD *)&p_projectionMatrix->m43 = v20;
  v21 = *(_OWORD *)&a.m13;
  *(_OWORD *)&p_projectionMatrix->m11 = *(_OWORD *)&a.m11;
  *(_OWORD *)&p_projectionMatrix->m13 = v21;
  v22 = *(_OWORD *)&a.m23;
  *(_OWORD *)&p_projectionMatrix->m21 = *(_OWORD *)&a.m21;
  *(_OWORD *)&p_projectionMatrix->m23 = v22;
  if (a4)
  {
    width = p_animationRect->size.width;
    v24 = p_animationRect->size.height;
    v25 = 0.0;
  }
  else
  {
    width = p_animationRect->size.width;
    v25 = p_animationRect->size.height;
    v24 = 0.0;
  }
  TSDTransform3DMakeOrtho(0.0, width, v24, v25, -1.0, 1.0);
  v26 = *(_OWORD *)&a.m33;
  *(_OWORD *)&p_shadowFBOProjectionMatrix->m31 = *(_OWORD *)&a.m31;
  *(_OWORD *)&p_shadowFBOProjectionMatrix->m33 = v26;
  v27 = *(_OWORD *)&a.m43;
  *(_OWORD *)&p_shadowFBOProjectionMatrix->m41 = *(_OWORD *)&a.m41;
  *(_OWORD *)&p_shadowFBOProjectionMatrix->m43 = v27;
  v28 = *(_OWORD *)&a.m13;
  *(_OWORD *)&p_shadowFBOProjectionMatrix->m11 = *(_OWORD *)&a.m11;
  *(_OWORD *)&p_shadowFBOProjectionMatrix->m13 = v28;
  v29 = *(_OWORD *)&a.m23;
  *(_OWORD *)&p_shadowFBOProjectionMatrix->m21 = *(_OWORD *)&a.m21;
  *(_OWORD *)&p_shadowFBOProjectionMatrix->m23 = v29;

}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4;

  v4 = a3;
  -[KNBuildCrumble frameOfEffectWithContext:](self, "frameOfEffectWithContext:", v4);
  -[KNBuildCrumble metalPrepareAnimationWithContext:](self, "metalPrepareAnimationWithContext:", v4);

}

- (void)renderFrameWithContext:(id)a3
{
  -[KNBuildCrumble metalRenderFrameWithContext:](self, "metalRenderFrameWithContext:", a3);
}

- (id)p_texturedRectFromImagePath:(id)a3 metalContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUImage imageWithContentsOfFile:](TSUImage, "imageWithContentsOfFile:", a3));
  v7 = objc_msgSend(v6, "CGImage");

  v8 = objc_msgSend(objc_alloc((Class)TSDTexturedRectangle), "initWithCGImage:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device"));

  objc_msgSend(v8, "setupMetalTextureForDevice:", v9);
  return v8;
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  TSDTexturedRectangle *v14;
  TSDTexturedRectangle *metalSmokeTexture;
  id v21;
  TSDMetalRenderTarget *v22;
  TSDMetalRenderTarget *shadowRenderTarget;
  id v24;
  TSDMetalRenderTarget *v25;
  TSDMetalRenderTarget *blurRenderTarget;
  id v27;
  TSDMetalShader *v28;
  TSDMetalShader *metalShadowShatterSystemShader;
  TSDMetalShader *v30;
  TSDMetalShader *metalShatterSystemShader;
  TSDMetalShader *v32;
  TSDMetalShader *metalSmokeSystemShader;
  TSDMetalShader *v34;
  TSDMetalShader *metalBlurShader;
  uint64_t v36;
  TSDMTLDataBuffer *v37;
  TSDMTLDataBuffer *metalBlurDataBuffer;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  char *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  unint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  TSDMetalShader *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  KNBuildCrumbleSystem *v72;
  KNBuildCrumbleSystem *shatterSystem;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double height;
  KNBuildShadowSystem *v81;
  KNBuildShadowSystem *shadowShatterSystem;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  KNBuildSmokeSystem *v88;
  KNBuildSmokeSystem *smokeSystem;
  double v90;
  const __CFString *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  float v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  double v106;
  double v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  TSDMetalShader *v112;
  TSDMetalShader *metalFboShader;
  uint64_t v114;
  TSDMTLDataBuffer *v115;
  TSDMTLDataBuffer *metalFboDataBuffer;
  double v117;
  double v118;
  CGFloat x;
  CGFloat y;
  float32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  double v124;
  double v125;
  double v126;
  float32x4_t v127;
  double v128;
  float32x4_t v129;
  double v130;
  $C1DFD4E0A10081BF298E754D91354697 v131;
  float32x4_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  CATransform3D v140;
  CATransform3D v141;
  CATransform3D v142;
  float64x2_t v143;
  float64x2_t v144;
  float64x2_t v145;
  float64x2_t v146;
  float64x2_t v147;
  float64x2_t v148;
  float64x2_t v149;
  float64x2_t v150;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
  if (objc_msgSend(v5, "count") != (char *)&dword_0 + 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildCrumble metalPrepareAnimationWithContext:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildCrumble.m"));
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 368, CFSTR("Effect expects one texture. Passed (%lu) textures."), objc_msgSend(v5, "count"));

  }
  v137 = v5;
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v11 = KNBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathForResource:ofType:", CFSTR("KNBuildAnvil-Smoke"), CFSTR("png")));

  v135 = (void *)v13;
  v14 = (TSDTexturedRectangle *)objc_claimAutoreleasedReturnValue(-[KNBuildCrumble p_texturedRectFromImagePath:metalContext:](self, "p_texturedRectFromImagePath:metalContext:", v13, v6));
  metalSmokeTexture = self->_metalSmokeTexture;
  self->_metalSmokeTexture = v14;

  -[KNBuildCrumble frameOfEffectWithContext:](self, "frameOfEffectWithContext:", v4);
  -[KNBuildCrumble p_setupMVPMatricesWithContext:device:](self, "p_setupMVPMatricesWithContext:device:", v4, v7);
  __asm { FMOV            V1.2D, #0.5 }
  self->_shadowFboSize = (CGSize)vrndaq_f64(vmulq_f64((float64x2_t)self->_animationRect.size, _Q1));
  v21 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v21, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  v22 = (TSDMetalRenderTarget *)objc_msgSend(objc_alloc((Class)TSDMetalRenderTarget), "initWithSize:metalContext:", v6, self->_shadowFboSize.width, self->_shadowFboSize.height);
  shadowRenderTarget = self->_shadowRenderTarget;
  self->_shadowRenderTarget = v22;

  v24 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v24, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  objc_msgSend(v24, "setBlendingEnabled:", 1);
  objc_msgSend(v24, "setSourceRGBBlendFactor:", 1);
  objc_msgSend(v24, "setSourceAlphaBlendFactor:", 1);
  objc_msgSend(v24, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v24, "setDestinationAlphaBlendFactor:", 5);
  v25 = (TSDMetalRenderTarget *)objc_msgSend(objc_alloc((Class)TSDMetalRenderTarget), "initWithSize:metalContext:", v6, self->_shadowFboSize.width, self->_shadowFboSize.height);
  blurRenderTarget = self->_blurRenderTarget;
  self->_blurRenderTarget = v25;

  v27 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v27, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  objc_msgSend(v27, "setBlendingEnabled:", 1);
  objc_msgSend(v27, "setSourceRGBBlendFactor:", 1);
  objc_msgSend(v27, "setSourceAlphaBlendFactor:", 1);
  objc_msgSend(v27, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v27, "setDestinationAlphaBlendFactor:", 5);
  v134 = v21;
  v28 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("buildCrumbleVertexShader"), CFSTR("buildCrumbleFragmentShader"), v7, CFSTR("KeynoteMetalLibrary"), v21);
  metalShadowShatterSystemShader = self->_metalShadowShatterSystemShader;
  self->_metalShadowShatterSystemShader = v28;

  v30 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("buildCrumbleVertexShader"), CFSTR("buildCrumbleFragmentShader"), v7, CFSTR("KeynoteMetalLibrary"), v27);
  metalShatterSystemShader = self->_metalShatterSystemShader;
  self->_metalShatterSystemShader = v30;

  v32 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("buildCrumbleSmokeVertexShader"), CFSTR("buildCrumbleSmokeFragmentShader"), v7, CFSTR("KeynoteMetalLibrary"), v27);
  metalSmokeSystemShader = self->_metalSmokeSystemShader;
  self->_metalSmokeSystemShader = v32;

  v133 = v24;
  v34 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultGaussianBlurShaderWithDevice:colorAttachment:halfSizedRadius:", v7, v24, 0);
  metalBlurShader = self->_metalBlurShader;
  self->_metalBlurShader = v34;

  v136 = (void *)v7;
  v37 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:textureFlipped:device:", 1, v7, TSDRectWithSize(v36));
  metalBlurDataBuffer = self->_metalBlurDataBuffer;
  self->_metalBlurDataBuffer = v37;

  objc_msgSend(v139, "frame");
  v40 = v39;
  v42 = v41;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v44 = v43;
  v46 = v45;
  objc_msgSend(v4, "duration");
  v130 = v47;
  v48 = (char *)objc_msgSend(v4, "direction");
  if ((objc_msgSend(v138, "isBuildIn") & 1) != 0)
  {
    v49 = v4;
  }
  else
  {
    v49 = v4;
    switch((unint64_t)v48)
    {
      case 0xBuLL:
        v48 = (char *)&dword_C;
        break;
      case 0xCuLL:
        v48 = (_BYTE *)(&dword_8 + 3);
        break;
      case 0xDuLL:
        v48 = (_BYTE *)(&dword_C + 2);
        break;
      case 0xEuLL:
        v48 = (_BYTE *)(&dword_C + 1);
        break;
      case 0xFuLL:
      case 0x10uLL:
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x19uLL:
      case 0x1AuLL:
      case 0x1BuLL:
      case 0x1CuLL:
      case 0x1DuLL:
      case 0x1EuLL:
      case 0x21uLL:
      case 0x22uLL:
      case 0x23uLL:
      case 0x24uLL:
      case 0x25uLL:
      case 0x26uLL:
      case 0x27uLL:
      case 0x28uLL:
        break;
      case 0x15uLL:
        v48 = (char *)&dword_18;
        break;
      case 0x16uLL:
        v48 = (_BYTE *)(&dword_14 + 3);
        break;
      case 0x17uLL:
        v48 = (_BYTE *)(&dword_14 + 2);
        break;
      case 0x18uLL:
        v48 = (_BYTE *)(&dword_14 + 1);
        break;
      case 0x1FuLL:
        v48 = (_BYTE *)&stru_20;
        break;
      case 0x20uLL:
        v48 = (_BYTE *)(&dword_1C + 3);
        break;
      case 0x29uLL:
        v48 = (_BYTE *)(&stru_20 + 10);
        break;
      case 0x2AuLL:
        v48 = (_BYTE *)(&stru_20 + 9);
        break;
      case 0x2BuLL:
        v48 = (_BYTE *)(&stru_20 + 12);
        break;
      case 0x2CuLL:
        v48 = (_BYTE *)(&stru_20 + 11);
        break;
      default:
        switch((unint64_t)v48)
        {
          case 'o':
            v48 = (_BYTE *)(&stru_68 + 8);
            break;
          case 'p':
            v48 = (_BYTE *)(&stru_68 + 7);
            break;
          case 'r':
            v48 = (_BYTE *)(&stru_68 + 11);
            break;
          case 's':
            v48 = (_BYTE *)(&stru_68 + 10);
            break;
          case 'y':
            v48 = (_BYTE *)(&stru_68 + 18);
            break;
          case 'z':
            v48 = (_BYTE *)(&stru_68 + 17);
            break;
          default:
            goto LABEL_5;
        }
        break;
    }
  }
LABEL_5:
  v50 = sqrt(sqrt(v40 * (v42 / v46) / v44));
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Smoke Particles Count"));
  v126 = v50 * v51;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Crumble Points"));
  v53 = (unint64_t)(v50 * v52);
  -[TSDTexturedRectangle size](self->_metalSmokeTexture, "size");
  v55 = v54;
  v57 = v56;
  if (v44 >= v46)
    v58 = v46;
  else
    v58 = v44;
  v128 = v58;
  v59 = v58 / v55;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Smoke Scale Begin"));
  v61 = TSDMultiplySizeScalar(v55, v57, v59 * v60);
  v124 = v62;
  v125 = v61;
  objc_msgSend(v139, "size");
  v64 = v63;
  v66 = v65;
  v67 = self->_metalShatterSystemShader;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Crumble Cells Split"));
  v69 = v68;
  v70 = v49;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "randomGenerator"));
  v72 = +[KNBuildCrumbleSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:shader:percentOfCellsToSplit:randomGenerator:metalContext:](KNBuildCrumbleSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:shader:percentOfCellsToSplit:randomGenerator:metalContext:", v53, v48, v67, v71, v6, v64, v66, v44, v46, v130, v69);
  shatterSystem = self->_shatterSystem;
  self->_shatterSystem = v72;

  v74 = (double)-[KNBuildCrumbleSystem triangleCount](self->_shatterSystem, "triangleCount");
  objc_msgSend(v139, "size");
  v76 = v75;
  v78 = v77;
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "randomGenerator"));
  height = CGSizeZero.height;
  v81 = (KNBuildShadowSystem *)+[KNBuildShadowSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildShadowSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v48, v79, self->_metalShadowShatterSystemShader, v6, CGSizeZero.width, height, v74, 1.0, v76, v78, v44, v46, *(_QWORD *)&v130);
  shadowShatterSystem = self->_shadowShatterSystem;
  self->_shadowShatterSystem = v81;

  objc_msgSend(v139, "size");
  v84 = v83;
  v86 = v85;
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "randomGenerator"));
  v88 = (KNBuildSmokeSystem *)+[KNBuildSmokeSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildSmokeSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v48, v87, self->_metalSmokeSystemShader, v6, v125, v124, (double)(unint64_t)v126, 1.0, v84, v86, v44, v46, *(_QWORD *)&v130);
  smokeSystem = self->_smokeSystem;
  self->_smokeSystem = v88;

  -[KNBuildShadowSystem setCrumbleSystem:](self->_shadowShatterSystem, "setCrumbleSystem:", self->_shatterSystem);
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Rotation Max"));
  -[KNBuildCrumbleSystem setRotationMax:](self->_shatterSystem, "setRotationMax:", v90 * 0.0174532925);
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("LifeSpan Randomness"));
  -[KNBuildCrumbleSystem setLifeSpanRandomness:](self->_shatterSystem, "setLifeSpanRandomness:");
  if (v48 == (_BYTE *)&stru_20.maxprot + 3)
    v91 = CFSTR("LifeSpan Delay For Random");
  else
    v91 = CFSTR("LifeSpan Delay");
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", v91);
  -[KNBuildCrumbleSystem setLifeSpanDelay:](self->_shatterSystem, "setLifeSpanDelay:");
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Crumble Speed Max"));
  -[KNBuildCrumbleSystem setSpeedMax:](self->_shatterSystem, "setSpeedMax:", v128 * v92);
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Crumble Speed Max Limiter"));
  -[KNBuildCrumbleSystem setSpeedMaxLimiter:](self->_shatterSystem, "setSpeedMaxLimiter:");
  -[KNBuildCrumbleSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](self->_shatterSystem, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, CGSizeZero.width, height);
  -[KNBuildCrumbleSystem rotationMax](self->_shatterSystem, "rotationMax");
  -[KNBuildShadowSystem setRotationMax:](self->_shadowShatterSystem, "setRotationMax:");
  -[KNBuildCrumbleSystem lifeSpanRandomness](self->_shatterSystem, "lifeSpanRandomness");
  -[KNBuildShadowSystem setLifeSpanRandomness:](self->_shadowShatterSystem, "setLifeSpanRandomness:");
  -[KNBuildCrumbleSystem lifeSpanDelay](self->_shatterSystem, "lifeSpanDelay");
  -[KNBuildShadowSystem setLifeSpanDelay:](self->_shadowShatterSystem, "setLifeSpanDelay:");
  -[KNBuildCrumbleSystem speedMax](self->_shatterSystem, "speedMax");
  -[KNBuildShadowSystem setSpeedMax:](self->_shadowShatterSystem, "setSpeedMax:");
  -[KNBuildCrumbleSystem speedMaxLimiter](self->_shatterSystem, "speedMaxLimiter");
  -[KNBuildShadowSystem setSpeedMaxLimiter:](self->_shadowShatterSystem, "setSpeedMaxLimiter:");
  -[KNBuildShadowSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](self->_shadowShatterSystem, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, CGSizeZero.width, height);
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Smoke Rotation Max"));
  -[KNBuildSmokeSystem setRotationMax:](self->_smokeSystem, "setRotationMax:", v93 * 0.0174532925);
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Smoke Scale Max"));
  -[KNBuildSmokeSystem setScaleMax:](self->_smokeSystem, "setScaleMax:");
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", v91);
  -[KNBuildSmokeSystem setLifeSpanDelay:](self->_smokeSystem, "setLifeSpanDelay:");
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Smoke Speed Max"));
  -[KNBuildSmokeSystem setSpeedMax:](self->_smokeSystem, "setSpeedMax:", v128 * v94);
  -[KNBuildSmokeSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](self->_smokeSystem, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, CGSizeZero.width, height);
  -[KNAnimationEffect perspectiveMVPMatrixWithContext:](self, "perspectiveMVPMatrixWithContext:", v70);
  v131 = ($C1DFD4E0A10081BF298E754D91354697)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v143), v144);
  v129 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v145), v146);
  v127 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v147), v148);
  v132 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v149), v150);
  *(_DWORD *)&self->_anon_68[44] = 0;
  *($C1DFD4E0A10081BF298E754D91354697 *)&self->_crumbleUniforms.Percent = v131;
  *(float32x4_t *)&self->_crumbleUniforms.Gravity = v129;
  *(float32x4_t *)&self->_crumbleUniforms.CrackStartTime = v127;
  *(float32x4_t *)&self->_anon_68[8] = v132;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v96 = v95 * 1.5;
  *(float *)&self->_anon_68[40] = v96;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Shadow Opacity Ramp Up"));
  *(float *)&v97 = v97;
  *(_DWORD *)&self->_anon_68[48] = LODWORD(v97);
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Crack Amount"));
  *(float *)&v98 = v98 / 1000.0;
  *(_DWORD *)&self->_anon_68[60] = LODWORD(v98);
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Crack Start Time"));
  *(float *)&v99 = v99;
  *(float *)&self->_anon_68[56] = -*(float *)&v99;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Shadow Opacity"));
  *(float *)&v100 = v100;
  *(_DWORD *)&self->_anon_68[52] = LODWORD(v100);
  -[KNBuildCrumbleSystem rotationMax](self->_shatterSystem, "rotationMax");
  *(float *)&v101 = v101;
  *(_DWORD *)&self->_anon_68[32] = LODWORD(v101);
  -[KNBuildCrumbleSystem speedMax](self->_shatterSystem, "speedMax");
  *(float *)&v102 = v102;
  *(_DWORD *)&self->_anon_68[36] = LODWORD(v102);
  *(_DWORD *)&self->_anon_d8[44] = 1065353216;
  v103 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m21), *(float64x2_t *)&self->_projectionMatrix.m23);
  v104 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m31), *(float64x2_t *)&self->_projectionMatrix.m33);
  v105 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m41), *(float64x2_t *)&self->_projectionMatrix.m43);
  *(float32x4_t *)&self->_crumbleShadowUniforms.Percent = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m11), *(float64x2_t *)&self->_projectionMatrix.m13);
  *(float32x4_t *)&self->_crumbleShadowUniforms.Gravity = v103;
  *(float32x4_t *)&self->_crumbleShadowUniforms.CrackStartTime = v104;
  *(float32x4_t *)&self->_anon_d8[8] = v105;
  *(_DWORD *)&self->_anon_d8[40] = *(_DWORD *)&self->_anon_68[40];
  *(_OWORD *)&self->_anon_d8[48] = *(_OWORD *)&self->_anon_68[48];
  *(_QWORD *)&self->_anon_d8[32] = *(_QWORD *)&self->_anon_68[32];
  self->_smokeUniforms = v131;
  *(float32x4_t *)self->_anon_130 = v129;
  *(float32x4_t *)&self->_anon_130[16] = v127;
  *(float32x4_t *)&self->_anon_130[32] = v132;
  -[KNBuildSmokeSystem rotationMax](self->_smokeSystem, "rotationMax");
  *(float *)&v106 = v106;
  *(_DWORD *)&self->_anon_130[48] = LODWORD(v106);
  -[KNBuildSmokeSystem speedMax](self->_smokeSystem, "speedMax");
  *(float *)&v107 = v107;
  *(_DWORD *)&self->_anon_130[52] = LODWORD(v107);
  v108 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_shadowFBOProjectionMatrix.m21), *(float64x2_t *)&self->_shadowFBOProjectionMatrix.m23);
  v109 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_shadowFBOProjectionMatrix.m31), *(float64x2_t *)&self->_shadowFBOProjectionMatrix.m33);
  v110 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_shadowFBOProjectionMatrix.m41), *(float64x2_t *)&self->_shadowFBOProjectionMatrix.m43);
  *(float32x4_t *)self->_anon_340 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_shadowFBOProjectionMatrix.m11), *(float64x2_t *)&self->_shadowFBOProjectionMatrix.m13);
  *(float32x4_t *)&self->_anon_340[16] = v108;
  *(float32x4_t *)&self->_anon_340[32] = v109;
  *(float32x4_t *)&self->_anon_340[48] = v110;
  __asm { FMOV            V1.2D, #1.0 }
  self[1].super.super.isa = (Class)vcvt_f32_f64(vdivq_f64(_Q1, (float64x2_t)self->_animationRect.size));
  LOBYTE(self[1].super.mAnimationContext) = 0;
  v112 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureShaderWithDevice:colorAttachment:", v136, v27);
  metalFboShader = self->_metalFboShader;
  self->_metalFboShader = v112;

  v115 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v136, TSDRectWithSize(v114));
  metalFboDataBuffer = self->_metalFboDataBuffer;
  self->_metalFboDataBuffer = v115;

  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  memset(&v142, 0, sizeof(v142));
  TSDTransform3DMakeOrtho(0.0, v117, v118, 0.0, -1.0, 1.0);
  x = self->_animationRect.origin.x;
  y = self->_animationRect.origin.y;
  memset(&v140, 0, sizeof(v140));
  CATransform3DTranslate(&v141, &v140, x, y, 0.0);
  v142 = v141;
  v121 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v141.m21), *(float64x2_t *)&v141.m23);
  v122 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v141.m31), *(float64x2_t *)&v141.m33);
  v123 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v141.m41), *(float64x2_t *)&v141.m43);
  *(float32x4_t *)self->_anon_300 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v141.m11), *(float64x2_t *)&v141.m13);
  *(float32x4_t *)&self->_anon_300[16] = v121;
  *(float32x4_t *)&self->_anon_300[32] = v122;
  *(float32x4_t *)&self->_anon_300[48] = v123;

}

- (void)metalRenderFrameWithContext:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  CGSize shadowFboSize;
  __int128 v33;

  v4 = a3;
  objc_msgSend(v4, "percent");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));

  objc_msgSend(v8, "singleTextureOpacity");
  v10 = v9;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Smoke Opacity"));
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metalTextureWithContext:", v13));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "commandQueue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "commandBuffer"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalRenderTarget passDescriptor](self->_shadowRenderTarget, "passDescriptor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "renderCommandEncoderWithDescriptor:", v18));

    v30 = 0;
    v31 = 0;
    shadowFboSize = self->_shadowFboSize;
    v33 = xmmword_3150E0;
    objc_msgSend(v19, "setViewport:", &v30);
    v20 = v6;
    v21 = v10;
    *(float *)&self->_anon_d8[24] = v20;
    *(float *)&self->_anon_d8[28] = v21;
    objc_msgSend(v19, "setFragmentTexture:atIndex:", v14, 0);
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalShadowShatterSystemShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v19, &self->_crumbleShadowUniforms, &self->_crumbleShadowUniforms);
    -[KNBuildShadowSystem drawMetalWithEncoder:](self->_shadowShatterSystem, "drawMetalWithEncoder:", v19);
    objc_msgSend(v19, "endEncoding");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalRenderTarget passDescriptor](self->_blurRenderTarget, "passDescriptor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "renderCommandEncoderWithDescriptor:", v22));

    v30 = 0;
    v31 = 0;
    shadowFboSize = self->_shadowFboSize;
    v33 = xmmword_3150E0;
    objc_msgSend(v23, "setViewport:", &v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalRenderTarget texture](self->_shadowRenderTarget, "texture"));
    objc_msgSend(v23, "setFragmentTexture:atIndex:", v24, 0);

    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalBlurShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v23, self->_anon_340, &self[1]);
    -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalBlurDataBuffer, "drawWithEncoder:atIndex:", v23, -[TSDMetalShader bufferIndex](self->_metalBlurShader, "bufferIndex"));
    objc_msgSend(v23, "endEncoding");
    objc_msgSend(v17, "commit");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "renderEncoder"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TSDMetalRenderTarget texture](self->_blurRenderTarget, "texture"));
    objc_msgSend(v26, "setFragmentTexture:atIndex:", v27, 0);

    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_metalFboShader, "setPipelineStateWithEncoder:vertexBytes:", v26, self->_anon_300);
    -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalFboDataBuffer, "drawWithEncoder:atIndex:", v26, -[TSDMetalShader bufferIndex](self->_metalFboShader, "bufferIndex"));
    *(float *)&self->_anon_68[24] = v20;
    *(float *)&self->_anon_68[28] = v21;
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_metalShatterSystemShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v26, &self->_crumbleUniforms, &self->_crumbleUniforms);
    objc_msgSend(v26, "setFragmentTexture:atIndex:", v14, 0);
    -[KNBuildCrumbleSystem drawMetalWithEncoder:](self->_shatterSystem, "drawMetalWithEncoder:", v26);
    v28 = v12;
    *(float *)&self->_anon_130[56] = v20;
    *(float *)&self->_anon_130[60] = v28;
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_metalSmokeSystemShader, "setPipelineStateWithEncoder:vertexBytes:", v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TSDTexturedRectangle metalTexture](self->_metalSmokeTexture, "metalTexture"));
    objc_msgSend(v26, "setFragmentTexture:atIndex:", v29, 0);

    -[KNBuildSmokeSystem drawMetalWithEncoder:](self->_smokeSystem, "drawMetalWithEncoder:", v26);
  }

}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  TSDMetalShader *metalShatterSystemShader;
  TSDMetalShader *metalShadowShatterSystemShader;
  TSDMetalShader *metalSmokeSystemShader;
  TSDMetalShader *metalFboShader;
  TSDMTLDataBuffer *metalFboDataBuffer;
  TSDMetalShader *metalBlurShader;
  TSDMTLDataBuffer *metalBlurDataBuffer;
  TSDMetalRenderTarget *shadowRenderTarget;
  TSDMetalRenderTarget *blurRenderTarget;

  metalShatterSystemShader = self->_metalShatterSystemShader;
  self->_metalShatterSystemShader = 0;

  metalShadowShatterSystemShader = self->_metalShadowShatterSystemShader;
  self->_metalShadowShatterSystemShader = 0;

  metalSmokeSystemShader = self->_metalSmokeSystemShader;
  self->_metalSmokeSystemShader = 0;

  metalFboShader = self->_metalFboShader;
  self->_metalFboShader = 0;

  metalFboDataBuffer = self->_metalFboDataBuffer;
  self->_metalFboDataBuffer = 0;

  metalBlurShader = self->_metalBlurShader;
  self->_metalBlurShader = 0;

  metalBlurDataBuffer = self->_metalBlurDataBuffer;
  self->_metalBlurDataBuffer = 0;

  shadowRenderTarget = self->_shadowRenderTarget;
  self->_shadowRenderTarget = 0;

  blurRenderTarget = self->_blurRenderTarget;
  self->_blurRenderTarget = 0;

  -[TSDTexturedRectangle teardown](self->_metalSmokeTexture, "teardown");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurRenderTarget, 0);
  objc_storeStrong((id *)&self->_shadowRenderTarget, 0);
  objc_storeStrong((id *)&self->_metalBlurDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalBlurShader, 0);
  objc_storeStrong((id *)&self->_metalFboDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalFboShader, 0);
  objc_storeStrong((id *)&self->_metalSmokeSystemShader, 0);
  objc_storeStrong((id *)&self->_metalShadowShatterSystemShader, 0);
  objc_storeStrong((id *)&self->_metalShatterSystemShader, 0);
  objc_storeStrong((id *)&self->_metalSmokeTexture, 0);
  objc_storeStrong((id *)&self->_smokeSystem, 0);
  objc_storeStrong((id *)&self->_shadowShatterSystem, 0);
  objc_storeStrong((id *)&self->_shatterSystem, 0);
  objc_storeStrong((id *)&self->_parameterGroup, 0);
}

@end
