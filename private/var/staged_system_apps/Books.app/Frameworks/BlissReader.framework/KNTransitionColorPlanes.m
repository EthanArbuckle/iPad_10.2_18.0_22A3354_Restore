@implementation KNTransitionColorPlanes

- (KNTransitionColorPlanes)initWithAnimationContext:(id)a3
{
  KNTransitionColorPlanes *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KNTransitionColorPlanes;
  result = -[KNAnimationEffect initWithAnimationContext:](&v4, "initWithAnimationContext:", a3);
  if (result)
    result->_colorCount = 3.0;
  return result;
}

- (void)p_teardown
{
  TSDMetalMotionBlurEffect *motionBlurMetalEffect;
  TSDMetalShader *metalShader;

  motionBlurMetalEffect = self->_motionBlurMetalEffect;
  self->_motionBlurMetalEffect = 0;

  metalShader = self->_metalShader;
  self->_metalShader = 0;

}

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.KLNColorPlanes");
}

+ (int)animationCategory
{
  return 202;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_469850;
}

+ (unint64_t)directionType
{
  return 4;
}

+ (id)defaultAttributes
{
  const __CFString *v3;
  _UNKNOWN **v4;

  v3 = CFSTR("KNTransitionAttributesDuration");
  v4 = &off_468F48;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-trans-colorPlanes");
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 2;
}

- (CATransform3D)p_mvpMatrixWithTexture:(SEL)a3 direction:(id)a4 percent:(unint64_t)a5 colorIndex:(double)a6
{
  int v7;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  KNAnimationContext *mAnimationContext;
  unint64_t v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  double v41;
  CGFloat v42;
  double v43;
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
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  double v68;
  CGFloat v69;
  double v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CATransform3D *result;
  CATransform3D v80;
  CATransform3D v81;
  CATransform3D v82;

  v7 = a7;
  v12 = a4;
  v13 = TSUReverseSquare(a6);
  objc_msgSend(v12, "size");
  v15 = v14;
  v17 = v16;
  v18 = TSUSineMap(a6 + a6);
  v19 = TSUSineMap(a6);
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext)
    -[KNAnimationContext slideProjectionMatrix](mAnimationContext, "slideProjectionMatrix");
  else
    memset(&v82, 0, sizeof(v82));
  v21 = a5 - 11;
  v22 = sin(v13 * -2.0 * 3.14159265);
  objc_msgSend(v12, "offset");
  v24 = v23;
  objc_msgSend(v12, "offset");
  CATransform3DTranslate(retstr, &v82, v24, v25, 0.0);
  v26 = 1.0;
  if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 0xC)
    v26 = -1.0;
  if (v21 >= 2)
    v27 = v17;
  else
    v27 = v15;
  v28 = v19 * 180.0 * 0.0174532925;
  v29 = v13 * v22 * v27;
  v30 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v80.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v80.m33 = v30;
  v31 = v27 * v18 * 0.25;
  v32 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v80.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v80.m43 = v32;
  v33 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v80.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v80.m13 = v33;
  v34 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v80.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v80.m23 = v34;
  if (v21 >= 2)
    v35 = v26;
  else
    v35 = 0.0;
  if (v21 >= 2)
    v36 = 0.0;
  else
    v36 = v26;
  CATransform3DTranslate(&v81, &v80, 0.0, 0.0, v29);
  v37 = *(_OWORD *)&v81.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v81.m31;
  *(_OWORD *)&retstr->m33 = v37;
  v38 = *(_OWORD *)&v81.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v81.m41;
  *(_OWORD *)&retstr->m43 = v38;
  v39 = *(_OWORD *)&v81.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v81.m11;
  *(_OWORD *)&retstr->m13 = v39;
  v40 = *(_OWORD *)&v81.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v81.m21;
  *(_OWORD *)&retstr->m23 = v40;
  objc_msgSend(v12, "size", *(_OWORD *)&v80.m11, *(_OWORD *)&v80.m13, *(_OWORD *)&v80.m21, *(_OWORD *)&v80.m23, *(_OWORD *)&v80.m31, *(_OWORD *)&v80.m33, *(_OWORD *)&v80.m41, *(_OWORD *)&v80.m43);
  v42 = v41 * 0.5;
  objc_msgSend(v12, "size");
  v44 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v80.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v80.m33 = v44;
  v45 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v80.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v80.m43 = v45;
  v46 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v80.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v80.m13 = v46;
  v47 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v80.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v80.m23 = v47;
  CATransform3DTranslate(&v81, &v80, v42, v43 * 0.5, 0.0);
  v48 = *(_OWORD *)&v81.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v81.m31;
  *(_OWORD *)&retstr->m33 = v48;
  v49 = *(_OWORD *)&v81.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v81.m41;
  *(_OWORD *)&retstr->m43 = v49;
  v50 = *(_OWORD *)&v81.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v81.m11;
  *(_OWORD *)&retstr->m13 = v50;
  v51 = *(_OWORD *)&v81.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v81.m21;
  *(_OWORD *)&retstr->m23 = v51;
  v52 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v80.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v80.m33 = v52;
  v53 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v80.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v80.m43 = v53;
  v54 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v80.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v80.m13 = v54;
  v55 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v80.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v80.m23 = v55;
  CATransform3DRotate(&v81, &v80, v28, v35, v36, 0.0);
  v56 = *(_OWORD *)&v81.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v81.m31;
  *(_OWORD *)&retstr->m33 = v56;
  v57 = *(_OWORD *)&v81.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v81.m41;
  *(_OWORD *)&retstr->m43 = v57;
  v58 = *(_OWORD *)&v81.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v81.m11;
  *(_OWORD *)&retstr->m13 = v58;
  v59 = *(_OWORD *)&v81.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v81.m21;
  *(_OWORD *)&retstr->m23 = v59;
  v60 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v80.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v80.m33 = v60;
  v61 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v80.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v80.m43 = v61;
  v62 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v80.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v80.m13 = v62;
  v63 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v80.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v80.m23 = v63;
  CATransform3DTranslate(&v81, &v80, 0.0, 0.0, v31 * (double)(v7 - 1));
  v64 = *(_OWORD *)&v81.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v81.m31;
  *(_OWORD *)&retstr->m33 = v64;
  v65 = *(_OWORD *)&v81.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v81.m41;
  *(_OWORD *)&retstr->m43 = v65;
  v66 = *(_OWORD *)&v81.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v81.m11;
  *(_OWORD *)&retstr->m13 = v66;
  v67 = *(_OWORD *)&v81.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v81.m21;
  *(_OWORD *)&retstr->m23 = v67;
  objc_msgSend(v12, "size");
  v69 = v68 * -0.5;
  objc_msgSend(v12, "size");
  v71 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v80.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v80.m33 = v71;
  v72 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v80.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v80.m43 = v72;
  v73 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v80.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v80.m13 = v73;
  v74 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v80.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v80.m23 = v74;
  CATransform3DTranslate(&v81, &v80, v69, v70 * -0.5, 0.0);
  v75 = *(_OWORD *)&v81.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v81.m31;
  *(_OWORD *)&retstr->m33 = v75;
  v76 = *(_OWORD *)&v81.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v81.m41;
  *(_OWORD *)&retstr->m43 = v76;
  v77 = *(_OWORD *)&v81.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v81.m11;
  *(_OWORD *)&retstr->m13 = v77;
  v78 = *(_OWORD *)&v81.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v81.m21;
  *(_OWORD *)&retstr->m23 = v78;

  return result;
}

- (void)p_drawWithMetalContext:(id)a3 renderEncoder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int8x8_t v18;
  void *v19;
  double colorCount;
  unint64_t v21;
  float32x4_t *v22;
  double v23;
  char **v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  float64x2_t v29;
  float64_t v30;
  float64x2_t v31;
  float64_t v32;
  float64x2_t v33;
  TSDMetalMotionBlurEffect *motionBlurMetalEffect;
  double v35;
  double v36;
  TSDMetalMotionBlurEffect *v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  float64_t v48;
  float64_t v49;
  float64_t v50;
  _OWORD v51[8];
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metalContext"));
  v9 = objc_msgSend(v8, "currentBuffer");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textures"));
  v46 = objc_msgSend(v6, "direction");
  objc_msgSend(v6, "percent");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
  v44 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metalContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metalTextureWithContext:", v15));

  v47 = v6;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metalContext"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metalTextureWithContext:", v17));

  if (v16 && v45)
  {
    v18 = vbic_s8(vbsl_s8((int8x8_t)vcgtd_u64(2uLL, (unint64_t)v46 - 13), (int8x8_t)0x3F80000000000000, (int8x8_t)1065353216), (int8x8_t)vcgtd_f64(0.5, v12));
    v19 = v12 >= 0.5 ? v16 : v45;
    objc_msgSend(v7, "setFragmentTexture:atIndex:", v19, 0);
    *((int8x8_t *)&self[3].super.mAnimationContext + 20 * (_QWORD)v9) = v18;
    colorCount = self->_colorCount;
    if (colorCount > 0.0)
    {
      v21 = 0;
      v22 = (float32x4_t *)&self[1] + 10 * (_QWORD)v9;
      v23 = 0.0;
      v24 = &selRef__accessibilityElementsInDirection_withCount_originalElement_;
      do
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[TSUColor colorWithHue:saturation:brightness:alpha:](TSUColor, "colorWithHue:saturation:brightness:alpha:", v23 / colorCount, 1.0, 1.0, 1.0 / colorCount));
        objc_msgSend(v25, "redComponent");
        v50 = v26;
        objc_msgSend(v25, "greenComponent");
        v49 = v27;
        objc_msgSend(v25, "blueComponent");
        v48 = v28;
        objc_msgSend(v25, "alphaComponent");
        v29.f64[0] = v48;
        v29.f64[1] = v30;
        v31.f64[0] = v50;
        v31.f64[1] = v49;
        v22[9] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v31), v29);
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        -[KNTransitionColorPlanes p_mvpMatrixWithTexture:direction:percent:colorIndex:](self, "p_mvpMatrixWithTexture:direction:percent:colorIndex:", v13, v46, v21, v12);
        if (objc_msgSend(v47, "isMotionBlurred"))
        {
          -[TSDMetalMotionBlurEffect velocityScale](self->_motionBlurMetalEffect, "velocityScale");
          v33.f64[1] = v32;
          *(float32x2_t *)v22[8].f32 = vcvt_f32_f64(v33);
          motionBlurMetalEffect = self->_motionBlurMetalEffect;
          if (motionBlurMetalEffect)
          {
            v56 = v72;
            v57 = v73;
            v58 = v74;
            v59 = v75;
            v52 = v68;
            v53 = v69;
            v54 = v70;
            v55 = v71;
            -[TSDMetalMotionBlurEffect adjustTransformForMotionBlurBuffer:](motionBlurMetalEffect, "adjustTransformForMotionBlurBuffer:", &v52);
          }
          else
          {
            v66 = 0u;
            v67 = 0u;
            v64 = 0u;
            v65 = 0u;
            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
          }
          v72 = v64;
          v73 = v65;
          v74 = v66;
          v75 = v67;
          v68 = v60;
          v69 = v61;
          v70 = v62;
          v71 = v63;
          objc_msgSend(v47, "duration");
          v36 = TSUClamp(v12 + 1.0 / (v35 * -60.0), 0.0, 1.0);
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          -[KNTransitionColorPlanes p_mvpMatrixWithTexture:direction:percent:colorIndex:](self, "p_mvpMatrixWithTexture:direction:percent:colorIndex:", v13, v46, v21, v36);
          v37 = self->_motionBlurMetalEffect;
          if (v37)
          {
            v51[4] = v64;
            v51[5] = v65;
            v51[6] = v66;
            v51[7] = v67;
            v51[0] = v60;
            v51[1] = v61;
            v51[2] = v62;
            v51[3] = v63;
            -[TSDMetalMotionBlurEffect adjustTransformForMotionBlurBuffer:](v37, "adjustTransformForMotionBlurBuffer:", v51);
          }
          else
          {
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
          }
          v24 = &selRef__accessibilityElementsInDirection_withCount_originalElement_;
          v60 = v52;
          v61 = v53;
          v66 = v58;
          v67 = v59;
          v64 = v56;
          v65 = v57;
          v62 = v54;
          v63 = v55;
          v38 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v54), v55);
          v39 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v56), v57);
          v40 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v58), v59);
          v22[4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v52), v53);
          v22[5] = v38;
          v22[6] = v39;
          v22[7] = v40;
        }
        v41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v70), v71);
        v42 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v72), v73);
        v43 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v74), v75);
        *v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v68), v69);
        v22[1] = v41;
        v22[2] = v42;
        v22[3] = v43;
        objc_msgSend(v7, "setVertexBytes:length:atIndex:", v22, 160, 1);
        objc_msgSend(*(id *)((char *)&self->super.super.isa + *((int *)v24 + 630)), "setPipelineStateWithEncoder:vertexBytes:", v7, v22);
        -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_metalColorDataBuffer, "drawWithEncoder:atIndex:", v7, 0);

        v23 = (double)++v21;
        colorCount = self->_colorCount;
      }
      while (colorCount > (double)v21);
    }
  }

}

- (void)animationWillBeginWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  TSDMetalMotionBlurEffect *v23;
  TSDMetalMotionBlurEffect *motionBlurMetalEffect;
  unsigned int v25;
  __CFString *v26;
  __CFString *v27;
  unsigned int v28;
  __CFString *v29;
  __CFString *v30;
  TSDMetalShader *v31;
  TSDMetalShader *metalShader;
  TSDMTLDataBuffer *v33;
  TSDMTLDataBuffer *metalColorDataBuffer;
  id v35;

  v35 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "textures"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "metalContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "metalContext"));
  v9 = objc_msgSend(v8, "pixelFormat");

  v10 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v10, "setPixelFormat:", v9);
  objc_msgSend(v10, "setBlendingEnabled:", 1);
  objc_msgSend(v10, "setDestinationRGBBlendFactor:", 1);
  objc_msgSend(v10, "setDestinationAlphaBlendFactor:", 1);
  v11 = 0;
  if (objc_msgSend(v35, "isMotionBlurred"))
  {
    v11 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    objc_msgSend(v11, "setPixelFormat:", v9);
    objc_msgSend(v11, "setDestinationRGBBlendFactor:", 1);
    objc_msgSend(v11, "setDestinationAlphaBlendFactor:", 5);
    v12 = objc_alloc((Class)TSDMetalMotionBlurEffect);
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v14 = v13;
    v16 = v15;
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v18 = v17;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "randomGenerator"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "metalContext"));
    v23 = (TSDMetalMotionBlurEffect *)objc_msgSend(v12, "initWithFramebufferSize:slideSize:randomGenerator:metalContext:", v21, v22, v14, v16, v18, v20);
    motionBlurMetalEffect = self->_motionBlurMetalEffect;
    self->_motionBlurMetalEffect = v23;

  }
  v25 = objc_msgSend(v35, "isMotionBlurred");
  v26 = CFSTR("transitionColorPlanesVertexShader");
  if (v25)
    v26 = CFSTR("transitionColorPlanesMBVertexShader");
  v27 = v26;
  v28 = objc_msgSend(v35, "isMotionBlurred");
  v29 = CFSTR("transitionColorPlanesFragmentShader");
  if (v28)
    v29 = CFSTR("transitionColorPlanesMBFragmentShader");
  v30 = v29;
  v31 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:", v27, v30, v7, CFSTR("KeynoteMetalLibrary"), v10, v11);

  metalShader = self->_metalShader;
  self->_metalShader = v31;

  v33 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v7, TSDRectWithSize(objc_msgSend(v5, "size")));
  metalColorDataBuffer = self->_metalColorDataBuffer;
  self->_metalColorDataBuffer = v33;

}

- (void)renderFrameWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TSDMetalMotionBlurEffect *motionBlurMetalEffect;
  void *v10;
  uint64_t v11;
  TSDMetalMotionBlurEffect *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metalContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderEncoder"));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionColorPlanes renderFrameWithContext:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionColorPlanes.m"));
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 294, CFSTR("invalid nil value for '%s'"), "workingEncoder");

  }
  if (objc_msgSend(v14, "isMotionBlurred"))
  {
    motionBlurMetalEffect = self->_motionBlurMetalEffect;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metalContext"));
    v11 = objc_claimAutoreleasedReturnValue(-[TSDMetalMotionBlurEffect bindColorAndVelocityWithMetalContext:shouldFillBackground:](motionBlurMetalEffect, "bindColorAndVelocityWithMetalContext:shouldFillBackground:", v10, 0));

    v5 = (void *)v11;
  }
  -[KNTransitionColorPlanes p_drawWithMetalContext:renderEncoder:](self, "p_drawWithMetalContext:renderEncoder:", v14, v5);
  if (objc_msgSend(v14, "isMotionBlurred"))
  {
    v12 = self->_motionBlurMetalEffect;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderEncoder"));
    -[TSDMetalMotionBlurEffect drawResultWithWorkingRenderEncoder:destinationRenderEncoder:](v12, "drawResultWithWorkingRenderEncoder:destinationRenderEncoder:", v5, v13);

  }
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  id v9;

  if (a6 == 3 && a8 <= 0x174876E7FFLL && a7)
  {
    v9 = objc_retainAutorelease(objc_msgSend(*a3, "mutableCopy"));
    *a3 = v9;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalColorDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalShader, 0);
  objc_storeStrong((id *)&self->_motionBlurMetalEffect, 0);
}

@end
