@implementation KNBuildBlur

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.Blur");
}

+ (int)animationCategory
{
  return 201;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_469A48;
}

+ (id)localizedMenuString:(int)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = KNBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Blur *BlurBuild*"), CFSTR("Blur"), CFSTR("Keynote")));

  return v5;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  const __CFString *v3;
  _UNKNOWN **v4;

  v3 = CFSTR("KNBuildAttributesDuration");
  v4 = &off_468FB8;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-builds-blur");
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

- (KNBuildBlur)initWithAnimationContext:(id)a3
{
  KNBuildBlur *v3;
  KNBuildBlur *v4;
  NSBundle *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  KNAnimParameterGroup *parameterGroup;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)KNBuildBlur;
  v3 = -[KNAnimationEffect initWithAnimationContext:](&v11, "initWithAnimationContext:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathForResource:ofType:", CFSTR("Blur"), CFSTR("parameterGroup")));

    v8 = objc_claimAutoreleasedReturnValue(+[KNAnimParameterGroup parameterGroupForFile:](KNAnimParameterGroup, "parameterGroupForFile:", v7));
    parameterGroup = v4->_parameterGroup;
    v4->_parameterGroup = (KNAnimParameterGroup *)v8;

  }
  return v4;
}

- (void)teardown
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *blurEffects;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_blurEffects;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "teardown", (_QWORD)v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  blurEffects = self->_blurEffects;
  self->_blurEffects = 0;

}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;
  CGRect v31;

  objc_msgSend(a3, "drawableFrame");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  MinX = CGRectGetMinX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MinY = CGRectGetMinY(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxX = CGRectGetMaxX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxY = CGRectGetMaxY(v27);
  if (width >= height)
    v12 = width;
  else
    v12 = height;
  v13 = TSDRectWithPoints(MinX - v12, MinY - v12, MaxX + v12, MaxY + v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v31.origin.x = v20;
  v31.origin.y = v21;
  v31.size.width = v22;
  v31.size.height = v23;
  v28.origin.x = v13;
  v28.origin.y = v15;
  v28.size.width = v17;
  v28.size.height = v19;
  v29 = CGRectIntersection(v28, v31);
  result = CGRectIntegral(v29);
  self->_animationRect = result;
  self->_drawableFrame.origin.x = x;
  self->_drawableFrame.origin.y = y;
  self->_drawableFrame.size.width = width;
  self->_drawableFrame.size.height = height;
  return result;
}

- (void)p_setupMVPMatricesWithContext:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double height;
  double v13;
  long double v14;
  long double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CATransform3D v20;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v23;
  CATransform3D v24;
  CATransform3D v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "textures"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  objc_msgSend(v5, "frameOnCanvas");
  v7 = v6 - CGRectGetMinX(self->_animationRect);
  objc_msgSend(v5, "frameOnCanvas");
  v9 = v8;
  objc_msgSend(v5, "frame");
  v11 = v9 + v10 - CGRectGetMaxY(self->_animationRect);
  CGRectGetWidth(self->_animationRect);
  CGRectGetHeight(self->_animationRect);
  height = self->_animationRect.size.height;
  -[KNAnimationContext fieldOfViewInRadians](self->super.mAnimationContext, "fieldOfViewInRadians");
  v14 = tan(v13 * 0.5);
  v15 = height / (v14 + v14);
  memset(&v25, 0, sizeof(v25));
  TSDTransform3DMakeProjection(&v25, -[KNAnimationContext fieldOfViewInRadians](self->super.mAnimationContext, "fieldOfViewInRadians"));
  memset(&v24, 0, sizeof(v24));
  CATransform3DMakeTranslation(&v24, self->_animationRect.size.width * -0.5, self->_animationRect.size.height * -0.5, -v15);
  memset(&v23, 0, sizeof(v23));
  CATransform3DMakeTranslation(&v23, v7, -v11, 0.0);
  self = (KNBuildBlur *)((char *)self + 152);
  a = v24;
  v20 = v25;
  CATransform3DConcat(&b, &a, &v20);
  v20 = v23;
  CATransform3DConcat(&a, &v20, &b);
  v16 = *(_OWORD *)&a.m33;
  *(_OWORD *)&self->_anon_30[16] = *(_OWORD *)&a.m31;
  *(_OWORD *)&self->_anon_30[32] = v16;
  v17 = *(_OWORD *)&a.m43;
  *(_OWORD *)&self->_anon_30[48] = *(_OWORD *)&a.m41;
  *(_OWORD *)&self->_anon_30[64] = v17;
  v18 = *(_OWORD *)&a.m13;
  self->super = *(KNAnimationEffect *)&a.m11;
  *(_OWORD *)&self->_parameterGroup = v18;
  v19 = *(_OWORD *)&a.m23;
  *(_OWORD *)&self->_metalShader = *(_OWORD *)&a.m21;
  *(_OWORD *)self->_anon_30 = v19;

}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4;

  v4 = a3;
  -[KNBuildBlur frameOfEffectWithContext:](self, "frameOfEffectWithContext:", v4);
  -[KNBuildBlur metalPrepareAnimationWithContext:](self, "metalPrepareAnimationWithContext:", v4);
  -[KNBuildBlur metalAnimationHasBegunWithContext:](self, "metalAnimationHasBegunWithContext:", v4);

}

- (void)renderFrameWithContext:(id)a3
{
  -[KNBuildBlur metalRenderFrameWithContext:](self, "metalRenderFrameWithContext:", a3);
}

- (void)animationDidEndWithContext:(id)a3
{
  id v4;

  v4 = a3;
  -[KNBuildBlur metalAnimationDidEndWithContext:](self, "metalAnimationDidEndWithContext:", v4);
  -[KNBuildBlur metalTeardownAnimationsWithContext:](self, "metalTeardownAnimationsWithContext:", v4);

}

- (void)p_prepareAnimationWithContext:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGSize size;
  CATransform3D *p_projectionMatrix;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  uint64_t v16;
  id v17;
  TSDMetalShader *v18;
  TSDMetalShader *metalShader;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  KNBuildBlur *v28;
  double v29;
  double v30;
  NSMutableArray *v31;
  void *v32;
  id v33;
  id v34;
  unint64_t v35;
  uint64_t v36;
  void *i;
  void *v38;
  KNGaussianBlurEffect *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  NSMutableArray *blurEffects;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  void *v51;
  _OWORD v52[8];
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
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];

  v4 = a3;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  self->_drawableFrame.origin.x = v5;
  self->_drawableFrame.origin.y = v6;
  self->_drawableFrame.size.width = v7;
  self->_drawableFrame.size.height = v8;
  size = self->_drawableFrame.size;
  self->_animationRect.origin = self->_drawableFrame.origin;
  self->_animationRect.size = size;
  p_projectionMatrix = &self->_projectionMatrix;
  -[KNAnimationEffect perspectiveMVPMatrixWithContext:](self, "perspectiveMVPMatrixWithContext:", v4);
  v11 = v62;
  *(_OWORD *)&self->_projectionMatrix.m31 = v61;
  *(_OWORD *)&self->_projectionMatrix.m33 = v11;
  v12 = v64;
  *(_OWORD *)&self->_projectionMatrix.m41 = v63;
  *(_OWORD *)&self->_projectionMatrix.m43 = v12;
  v13 = v58;
  *(_OWORD *)&self->_projectionMatrix.m11 = v57;
  *(_OWORD *)&self->_projectionMatrix.m13 = v13;
  v14 = v60;
  *(_OWORD *)&self->_projectionMatrix.m21 = v59;
  *(_OWORD *)&self->_projectionMatrix.m23 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "device"));
  v17 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v17, "setPixelFormat:", objc_msgSend(v15, "pixelFormat"));
  objc_msgSend(v17, "setBlendingEnabled:", 1);
  objc_msgSend(v17, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v17, "setDestinationAlphaBlendFactor:", 5);
  v47 = v17;
  v48 = (void *)v16;
  v18 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("KNBuildBlurVertexShader"), CFSTR("KNBuildBlurFragmentShader"), v16, CFSTR("KeynoteMetalLibrary"), v17);
  metalShader = self->_metalShader;
  self->_metalShader = v18;

  v20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m21), *(float64x2_t *)&self->_projectionMatrix.m23);
  v21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m31), *(float64x2_t *)&self->_projectionMatrix.m33);
  v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m41), *(float64x2_t *)&self->_projectionMatrix.m43);
  *(float32x4_t *)self->_anon_30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m11), *(float64x2_t *)&self->_projectionMatrix.m13);
  *(float32x4_t *)&self->_anon_30[16] = v20;
  *(float32x4_t *)&self->_anon_30[32] = v21;
  *(float32x4_t *)&self->_anon_30[48] = v22;
  v51 = v4;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Blur Steps"));
  v25 = v24;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Blur Radius Max"));
  v27 = v26;
  v28 = self;
  -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Half Size Radius Every"));
  v30 = v29;
  v31 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v49 = v15;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "commandQueue"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "commandBuffer"));
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v23;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v33)
  {
    v34 = v33;
    v35 = (unint64_t)fmax(v25, 1.0);
    v36 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v36)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        v39 = -[KNGaussianBlurEffect initWithContext:]([KNGaussianBlurEffect alloc], "initWithContext:", v51);
        v40 = *(_OWORD *)&p_projectionMatrix->m33;
        v52[4] = *(_OWORD *)&p_projectionMatrix->m31;
        v52[5] = v40;
        v41 = *(_OWORD *)&p_projectionMatrix->m43;
        v52[6] = *(_OWORD *)&p_projectionMatrix->m41;
        v52[7] = v41;
        v42 = *(_OWORD *)&p_projectionMatrix->m13;
        v52[0] = *(_OWORD *)&p_projectionMatrix->m11;
        v52[1] = v42;
        v43 = *(_OWORD *)&p_projectionMatrix->m23;
        v52[2] = *(_OWORD *)&p_projectionMatrix->m21;
        v52[3] = v43;
        -[KNGaussianBlurEffect setMVPMatrix:](v39, "setMVPMatrix:", v52);
        -[KNGaussianBlurEffect setTexture:](v39, "setTexture:", v38);
        objc_msgSend(v38, "singleTextureOpacity");
        -[KNGaussianBlurEffect setOpacity:](v39, "setOpacity:");
        -[KNGaussianBlurEffect setupEffectIfNecessary](v39, "setupEffectIfNecessary");
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimationContext capabilities](v28->super.mAnimationContext, "capabilities"));
        -[KNGaussianBlurEffect createBlurTexturesWithBlurSteps:maxBlurRadius:stepsToDecreaseRadius:commandBuffer:capabilities:](v39, "createBlurTexturesWithBlurSteps:maxBlurRadius:stepsToDecreaseRadius:commandBuffer:capabilities:", v35, v32, v44, v27, v30);

        -[NSMutableArray addObject:](v31, "addObject:", v39);
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v34);
  }

  objc_msgSend(v32, "commit");
  blurEffects = v28->_blurEffects;
  v28->_blurEffects = v31;

}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "animatedBuild"));
  v5 = objc_msgSend(v4, "isBuildIn");

  if (v5)
    -[KNBuildBlur p_prepareAnimationWithContext:](self, "p_prepareAnimationWithContext:", v6);

}

- (void)metalAnimationHasBegunWithContext:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "animatedBuild"));
  v5 = objc_msgSend(v4, "isBuildOut");

  if (v5)
    -[KNBuildBlur p_prepareAnimationWithContext:](self, "p_prepareAnimationWithContext:", v6);

}

- (void)metalRenderFrameWithContext:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  double v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  objc_msgSend(v4, "percent");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  v8 = objc_msgSend(v7, "isBuildIn");

  if (v8)
    v6 = 1.0 - v6;
  -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("Opacity Fade"), v6);
  v10 = v9;
  -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("Blur Radius Curve"), sqrt(v6));
  v12 = v11;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = self->_blurEffects;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 1.0 - v10;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "texture", (_QWORD)v24));
        objc_msgSend(v20, "singleTextureOpacity");
        v22 = v21;

        objc_msgSend(v19, "setOpacity:", v16 * v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
        objc_msgSend(v19, "renderEffectAtPercent:withContext:", v23, v12);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

}

- (void)p_teardownBlurEffects
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *blurEffects;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_blurEffects;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "teardown", (_QWORD)v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  blurEffects = self->_blurEffects;
  self->_blurEffects = 0;

}

- (void)metalAnimationDidEndWithContext:(id)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "animatedBuild"));
  v5 = objc_msgSend(v4, "isBuildOut");

  if (v5)
    -[KNBuildBlur p_teardownBlurEffects](self, "p_teardownBlurEffects");
}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  if (self->_blurEffects)
    -[KNBuildBlur p_teardownBlurEffects](self, "p_teardownBlurEffects", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalShader, 0);
  objc_storeStrong((id *)&self->_blurEffects, 0);
  objc_storeStrong((id *)&self->_parameterGroup, 0);
}

@end
