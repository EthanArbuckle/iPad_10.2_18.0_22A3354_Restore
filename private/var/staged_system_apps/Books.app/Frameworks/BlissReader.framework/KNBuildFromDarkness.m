@implementation KNBuildFromDarkness

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.FromDarkness");
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
  return &off_469B20;
}

+ (id)localizedMenuString:(int)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = KNBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Fade and Scale"), CFSTR("Fade and Scale"), CFSTR("Keynote")));

  return v5;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 2.5));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v2, CFSTR("KNBuildAttributesDuration")));

  return v3;
}

+ (id)customAttributes
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[4];
  _QWORD v22[4];

  v22[0] = CFSTR("KNBuildCustomAttributesShine");
  v21[0] = &off_4693E0;
  v21[1] = &off_4693F8;
  v2 = KNBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Shine *Fade and Scale Build*"), CFSTR("Shine"), CFSTR("Keynote")));
  v22[1] = v4;
  v22[2] = &off_469428;
  v21[2] = &off_469410;
  v21[3] = &off_469440;
  v5 = KNBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Select to use a shine effect during the build."), &stru_43D7D8, CFSTR("Keynote")));
  v22[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 4));

  v20[0] = CFSTR("KNBuildCustomAttributesScaleAmount");
  v19[0] = &off_4693E0;
  v19[1] = &off_4693F8;
  v9 = KNBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Scale *Fade and Scale Build*"), CFSTR("Scale"), CFSTR("Keynote")));
  v20[1] = v11;
  v20[2] = &off_469458;
  v19[2] = &off_469410;
  v19[3] = &off_469470;
  v20[3] = &off_469488;
  v20[4] = &off_4694B8;
  v19[4] = &off_4694A0;
  v19[5] = &off_469440;
  v12 = KNBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Adjust how much the object\\U2019s size changes."), &stru_43D7D8, CFSTR("Keynote")));
  v20[5] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 6));

  v18[0] = v8;
  v18[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));

  return v16;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-builds-fromDarkness");
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("KNBuildCustomAttributesShine"), a4, a5, *(_QWORD *)&a6, a7, a8));
  if (!v9
    || (v10 = (void *)v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("KNBuildCustomAttributesScaleAmount"))),
        v11,
        v10,
        !v11))
  {
    v12 = objc_msgSend(*a3, "mutableCopy");
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("KNBuildCustomAttributesShine"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_4694D0, CFSTR("KNBuildCustomAttributesScaleAmount"));
    v13 = objc_retainAutorelease(v12);
    *a3 = v13;

  }
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

- (KNBuildFromDarkness)initWithAnimationContext:(id)a3
{
  KNBuildFromDarkness *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  KNAnimParameterGroup *parameterGroup;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KNBuildFromDarkness;
  v3 = -[KNAnimationEffect initWithAnimationContext:](&v10, "initWithAnimationContext:", a3);
  if (v3)
  {
    v4 = KNBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathForResource:ofType:", CFSTR("FromDarkness"), CFSTR("parameterGroup")));

    v7 = objc_claimAutoreleasedReturnValue(+[KNAnimParameterGroup parameterGroupForFile:](KNAnimParameterGroup, "parameterGroupForFile:", v6));
    parameterGroup = v3->_parameterGroup;
    v3->_parameterGroup = (KNAnimParameterGroup *)v7;

  }
  return v3;
}

- (void)p_teardown
{
  -[KNBuildFromDarkness metalTeardownAnimationsWithContext:](self, "metalTeardownAnimationsWithContext:", 0);
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double MinX;
  double MaxX;
  double MaxY;
  double MidX;
  double MidY;
  double Width;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect *p_frameRect;
  double MinY;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "drawableFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  self->_drawableFrame.origin.x = v5;
  self->_drawableFrame.origin.y = v7;
  self->_drawableFrame.size.width = v9;
  self->_drawableFrame.size.height = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("KNBuildCustomAttributesScaleAmount")));
  objc_msgSend(v15, "doubleValue");
  v17 = v16 / 100.0;

  v32.origin.x = v6;
  v32.origin.y = v8;
  v32.size.width = v10;
  v32.size.height = v12;
  MinX = CGRectGetMinX(v32);
  v33.origin.x = v6;
  v33.origin.y = v8;
  v33.size.width = v10;
  v33.size.height = v12;
  MinY = CGRectGetMinY(v33);
  v34.origin.x = v6;
  v34.origin.y = v8;
  v34.size.width = v10;
  v34.size.height = v12;
  MaxX = CGRectGetMaxX(v34);
  v35.origin.x = v6;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  MaxY = CGRectGetMaxY(v35);
  if (v17 > 1.0 && vabdd_f64(1.0, v17) >= 0.00999999978)
  {
    v36.origin.x = v6;
    v36.origin.y = v8;
    v36.size.width = v10;
    v36.size.height = v12;
    MidX = CGRectGetMidX(v36);
    v37.origin.x = v6;
    v37.origin.y = v8;
    v37.size.width = v10;
    v37.size.height = v12;
    MidY = CGRectGetMidY(v37);
    v38.origin.x = v6;
    v38.origin.y = v8;
    v38.size.width = v10;
    v38.size.height = v12;
    Width = CGRectGetWidth(v38);
    v39.origin.x = v6;
    v39.origin.y = v8;
    v39.size.width = v10;
    v39.size.height = v12;
    v24 = v17 * Width * 0.5;
    v25 = v17 * CGRectGetHeight(v39) * 0.5;
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v26 = CGRectGetMinX(v40);
    if (v26 >= MidX - v24)
      MinX = v26;
    else
      MinX = MidX - v24;
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v27 = CGRectGetMinY(v41);
    if (v27 < MidY - v25)
      v27 = MidY - v25;
    MinY = v27;
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v28 = CGRectGetMaxX(v42);
    if (v28 >= MidX + v24)
      MaxX = MidX + v24;
    else
      MaxX = v28;
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v29 = CGRectGetMaxY(v43);
    if (v29 >= MidY + v25)
      MaxY = MidY + v25;
    else
      MaxY = v29;
  }
  p_frameRect = &self->_frameRect;
  v44.origin.x = TSDRectWithPoints(MinX, MinY, MaxX, MaxY);
  *p_frameRect = v44;
  result = CGRectIntegral(v44);
  *p_frameRect = result;
  return result;
}

- (CATransform3D)p_transformForPercent:(SEL)a3 centerPoint:(double)a4
{
  double y;
  double x;
  CGFloat v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CATransform3D *result;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CATransform3D v43;
  CATransform3D v44;

  y = a5.y;
  x = a5.x;
  v9 = TSUMix(self->_scaleMax, *(double *)&self[1].super.super.isa, a4);
  v11 = *(_OWORD *)&self->_baseTransform.m31;
  v10 = *(_OWORD *)&self->_baseTransform.m33;
  v12 = *(_OWORD *)&self->_baseTransform.m23;
  *(_OWORD *)&retstr->m31 = v11;
  *(_OWORD *)&retstr->m33 = v10;
  v13 = *(_OWORD *)&self->_baseTransform.m33;
  v15 = *(_OWORD *)&self->_baseTransform.m41;
  v14 = *(_OWORD *)&self->_baseTransform.m43;
  *(_OWORD *)&retstr->m41 = v15;
  *(_OWORD *)&retstr->m43 = v14;
  v16 = *(_OWORD *)&self->_baseTransform.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->_baseTransform.m11;
  *(_OWORD *)&retstr->m13 = v16;
  v17 = *(_OWORD *)&self->_baseTransform.m23;
  v19 = *(_OWORD *)&self->_baseTransform.m11;
  v18 = *(_OWORD *)&self->_baseTransform.m13;
  v20 = *(_OWORD *)&self->_baseTransform.m21;
  *(_OWORD *)&retstr->m21 = v20;
  *(_OWORD *)&retstr->m23 = v17;
  *(_OWORD *)&v43.m31 = v11;
  *(_OWORD *)&v43.m33 = v13;
  v21 = *(_OWORD *)&self->_baseTransform.m43;
  *(_OWORD *)&v43.m41 = v15;
  *(_OWORD *)&v43.m43 = v21;
  *(_OWORD *)&v43.m11 = v19;
  *(_OWORD *)&v43.m13 = v18;
  *(_OWORD *)&v43.m21 = v20;
  *(_OWORD *)&v43.m23 = v12;
  CATransform3DTranslate(&v44, &v43, x, y, 0.0);
  v22 = *(_OWORD *)&v44.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v44.m31;
  *(_OWORD *)&retstr->m33 = v22;
  v23 = *(_OWORD *)&v44.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v44.m41;
  *(_OWORD *)&retstr->m43 = v23;
  v24 = *(_OWORD *)&v44.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v44.m11;
  *(_OWORD *)&retstr->m13 = v24;
  v25 = *(_OWORD *)&v44.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v44.m21;
  *(_OWORD *)&retstr->m23 = v25;
  v26 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v43.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v43.m33 = v26;
  v27 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v43.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v43.m43 = v27;
  v28 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v43.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v43.m13 = v28;
  v29 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v43.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v43.m23 = v29;
  CATransform3DScale(&v44, &v43, v9, v9, 1.0);
  v30 = *(_OWORD *)&v44.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v44.m31;
  *(_OWORD *)&retstr->m33 = v30;
  v31 = *(_OWORD *)&v44.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v44.m41;
  *(_OWORD *)&retstr->m43 = v31;
  v32 = *(_OWORD *)&v44.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v44.m11;
  *(_OWORD *)&retstr->m13 = v32;
  v33 = *(_OWORD *)&v44.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v44.m21;
  *(_OWORD *)&retstr->m23 = v33;
  v34 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v43.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v43.m33 = v34;
  v35 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v43.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v43.m43 = v35;
  v36 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v43.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v43.m13 = v36;
  v37 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v43.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v43.m23 = v37;
  result = CATransform3DTranslate(&v44, &v43, -x, -y, 0.0);
  v39 = *(_OWORD *)&v44.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v44.m31;
  *(_OWORD *)&retstr->m33 = v39;
  v40 = *(_OWORD *)&v44.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v44.m41;
  *(_OWORD *)&retstr->m43 = v40;
  v41 = *(_OWORD *)&v44.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v44.m11;
  *(_OWORD *)&retstr->m13 = v41;
  v42 = *(_OWORD *)&v44.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v44.m21;
  *(_OWORD *)&retstr->m23 = v42;
  return result;
}

- (void)p_drawWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float64_t v22;
  float64x2_t v23;
  float32x2_t v24;
  float32x2_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  float64x2_t v40;
  float32x2_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  double v47;
  double v48;
  uint64_t v49;
  float64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  id v62;
  double v63;
  double v64;
  id v65;
  double v66;
  float64x2_t v67;
  float64_t v68;
  float32x2_t v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  float64x2_t v78;
  float v79;
  float v80;
  float32x4_t v81;
  unsigned int v82;
  float64_t v83;
  double v84;
  float64_t v85;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  objc_msgSend(v4, "percent");
  v8 = v7;
  objc_msgSend(v6, "duration");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));

  LODWORD(v4) = objc_msgSend(v11, "isBuildOut");
  if ((_DWORD)v4)
    v8 = 1.0 - v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v13 = TSDRectWithSize(objc_msgSend(v12, "size"));
  v17 = TSDCenterOfRect(v13, v14, v15, v16);
  v19 = v18;
  -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("Scale Timing"), v8);
  if (!BYTE2(self->_scaleMin))
    v20 = 1.0 - v20;
  -[KNBuildFromDarkness p_transformForPercent:centerPoint:](self, "p_transformForPercent:centerPoint:", v20, v17, v19);
  if (BYTE1(self->_scaleMin))
  {
    -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("Scale Timing"), TSUClamp(v8 + 1.0 / (v10 * -60.0), 0.0, 1.0));
    if (!BYTE2(self->_scaleMin))
      v21 = 1.0 - v21;
    -[KNBuildFromDarkness p_transformForPercent:centerPoint:](self, "p_transformForPercent:centerPoint:", v21, v17, v19);
    -[TSDMetalMotionBlurEffect velocityScale](self->_metalMotionBlurEffect, "velocityScale");
    v23.f64[1] = v22;
    *(float32x2_t *)&self->_anon_140[135] = vcvt_f32_f64(v23);
    *(float32x4_t *)&self->_anon_140[71] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
    *(float32x4_t *)&self->_anon_140[87] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
    *(float32x4_t *)&self->_anon_140[103] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
    *(float32x4_t *)&self->_anon_140[119] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
    *(float32x2_t *)&v23.f64[0] = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.a);
    v24 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.c);
    v25 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.tx);
    *(_DWORD *)&self->_anon_140[159] = 0;
    *(float64_t *)&self->_anon_140[151] = v23.f64[0];
    *(_DWORD *)&self->_anon_140[175] = 0;
    *(float32x2_t *)&self->_anon_140[167] = v24;
    *(_DWORD *)&self->_anon_140[191] = 1065353216;
    *(float32x2_t *)&self->_anon_140[183] = v25;
  }
  -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("Opacity Timing"), v8);
  v27 = v26;
  objc_msgSend(v12, "singleTextureOpacity");
  v29 = v27 * v28;
  if (LOBYTE(self->_scaleMin))
  {
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Gradient BeginTime"));
    v31 = v30;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Gradient EndTime"));
    v33 = v32;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Gradient Size"));
    v35 = v34;
    v36 = TSUClamp((v8 - v31) / (v33 - v31), 0.0, 1.0);
    v84 = TSDMixFloats(v37, -v35, 1.0, v36);
    v39 = TSDMixFloats(v38, 0.0, v35 + 1.0, v36);
    v40.f64[0] = v84;
    v40.f64[1] = v39;
    v41 = vcvt_f32_f64(v40);
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Bevel Angle Begin"));
    v43 = v42;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Bevel Angle End"));
    v45 = v44;
    v46 = -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("Bevel Angle Timing"), v8);
    v48 = TSDMixFloats(v46, v43, v45, v47);
    v50 = TSDDeltaFromAngle(v49, v48 * 0.0174532925);
    v83 = v51;
    v85 = v50;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Bevel Opacity"));
    v53 = v52;
    -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("Bevel Timing"), v8);
    v55 = v53 * v54;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Shine XPosition Begin"));
    v57 = v56;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Shine XPosition End"));
    v59 = v58;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Shine Angle"));
    v61 = v60;
    v62 = -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("Shine Move Timing"), v8);
    v64 = TSDMixFloats(v62, v57, v59, v63);
    v65 = objc_msgSend(v12, "size");
    *(float *)&v66 = v64 * v66;
    v82 = LODWORD(v66);
    v67.f64[0] = TSDDeltaFromAngle(v65, v61 * 0.0174532925);
    v67.f64[1] = v68;
    v69 = vadd_f32((float32x2_t)v82, vcvt_f32_f64(v67));
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Shine Size"));
    v71 = v70;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Shine Opacity"));
    v73 = v72;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Shine Opacity EndTime"));
    -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", CFSTR("Shine Opacity Timing"), TSUClamp(v8 / v74, 0.0, 1.0));
    v76 = v73 * v75;
    *(float32x2_t *)&self->_anon_200[39] = v41;
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Gradient Affects Highlights Amount"));
    *(float *)&v77 = v77;
    *(_DWORD *)&self->_anon_200[47] = LODWORD(v77);
    v78.f64[0] = v85;
    v78.f64[1] = v83;
    *(float32x2_t *)&self->_anon_200[31] = vcvt_f32_f64(v78);
    *(float *)v78.f64 = v55;
    *(_DWORD *)&self->_anon_200[23] = LODWORD(v78.f64[0]);
    *(_QWORD *)&self->_anon_200[55] = v82;
    *(float32x2_t *)&self->_anon_200[63] = v69;
    *(float *)v78.f64 = v71;
    v79 = v76;
    *(_DWORD *)&self->_anon_200[71] = LODWORD(v78.f64[0]);
    self->_unshinyFragmentInput.Opacity = v79;
    v80 = v29;
    *(float *)&self->_anon_200[15] = v80;
  }
  else
  {
    v80 = v29;
  }
  v81 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
  *(float32x4_t *)&self->_anon_100[7] = v81;
  *(float32x4_t *)&self->_anon_100[23] = v81;
  *(float32x4_t *)&self->_anon_100[39] = v81;
  *(float32x4_t *)&self->_anon_100[55] = v81;
  *(float32x4_t *)&self->_anon_140[7] = v81;
  *(float32x4_t *)&self->_anon_140[23] = v81;
  *(float32x4_t *)&self->_anon_140[39] = v81;
  *(float32x4_t *)&self->_anon_140[55] = v81;
  *(float *)&self->_edgeTextureName = v80;

}

- (void)p_setupMetalEdgeDistanceTextureWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  MTLTexture *v26;
  MTLTexture *edgeDistanceTexture;
  double v28;
  float64x2_t v29;
  float64_t v30;
  float64_t v31;
  void *v32;
  id v33;

  v4 = a3;
  if (!self->_edgeDistanceTexture)
  {
    v33 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "textures"));
    if (objc_msgSend(v6, "count") != (char *)&dword_0 + 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFromDarkness p_setupMetalEdgeDistanceTextureWithContext:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFromDarkness.m"));
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 397, CFSTR("Effect expects one texture. Passed (%lu) textures."), objc_msgSend(v6, "count"));

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Bevel Size"));
    v12 = v11 / 100.0;
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v14 = v13;
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    if (v14 >= v15)
      v16 = v15;
    else
      v16 = v14;
    v17 = v12 * v16;
    v18 = v12 * v16;
    *(float *)&self->_anon_200[19] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metalTextureWithContext:", v5));
    v20 = v19;
    if (v19)
    {
      v21 = (double)(unint64_t)objc_msgSend(v19, "width");
      v22 = (double)(unint64_t)objc_msgSend(v20, "height");
      v32 = v5;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "metalContext"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimationContext capabilities](self->super.mAnimationContext, "capabilities"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:](TSDMetalEdgeDistanceField, "distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:", v20, (uint64_t)(v17 + v17), 1, 0, v23, v24, v21, v22, TSDEdgeInsetsZero[0].f64[0], TSDEdgeInsetsZero[0].f64[1], TSDEdgeInsetsZero[1].f64[0], TSDEdgeInsetsZero[1].f64[1], 1.0));
      v26 = (MTLTexture *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));
      edgeDistanceTexture = self->_edgeDistanceTexture;
      self->_edgeDistanceTexture = v26;

      v5 = v32;
      objc_msgSend(v10, "size");
      v31 = v28;
      objc_msgSend(v10, "size");
      v29.f64[0] = v31;
      v29.f64[1] = v30;
      *(float32x2_t *)&self->_anon_200[7] = vcvt_f32_f64(v29);
    }

    v4 = v33;
  }

}

- (void)p_setupMetalAnimationWithContext:(id)a3 texturedRect:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  TSDMetalMotionBlurEffect *v21;
  TSDMetalMotionBlurEffect *metalMotionBlurEffect;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  TSDMetalShader *v27;
  TSDMetalShader *metalShader;
  TSDMetalShader *v29;
  uint64_t v30;
  TSDMTLDataBuffer *v31;
  TSDMTLDataBuffer *mtlDataBuffer;
  id v33;

  v33 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "metalContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
  v9 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v9, "setPixelFormat:", objc_msgSend(v7, "pixelFormat"));
  objc_msgSend(v9, "setBlendingEnabled:", 1);
  objc_msgSend(v9, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v9, "setDestinationAlphaBlendFactor:", 5);
  if (BYTE1(self->_scaleMin))
  {
    v10 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    objc_msgSend(v10, "setPixelFormat:", objc_msgSend(v7, "pixelFormat"));
    v11 = objc_alloc((Class)TSDMetalMotionBlurEffect);
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v13 = v12;
    v15 = v14;
    -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
    v17 = v16;
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "randomGenerator"));
    v21 = (TSDMetalMotionBlurEffect *)objc_msgSend(v11, "initWithFramebufferSize:slideSize:randomGenerator:metalContext:", v20, v7, v13, v15, v17, v19);
    metalMotionBlurEffect = self->_metalMotionBlurEffect;
    self->_metalMotionBlurEffect = v21;

    -[TSDMetalMotionBlurEffect setIsSingleObject:](self->_metalMotionBlurEffect, "setIsSingleObject:", 1);
  }
  else
  {
    v10 = 0;
  }
  if (LOBYTE(self->_scaleMin))
  {
    v23 = CFSTR("buildFromDarknessMotionBlurFragmentShader");
    if (BYTE1(self->_scaleMin))
      v24 = CFSTR("buildFromDarknessMotionBlurVertexShader");
    else
      v24 = CFSTR("buildFromDarknessVertexShader");
    if (!BYTE1(self->_scaleMin))
      v23 = CFSTR("buildFromDarknessFragmentShader");
    v25 = v23;
    v26 = v24;
    v27 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:", v26, v25, v8, CFSTR("KeynoteMetalLibrary"), v9, v10);

    metalShader = self->_metalShader;
    self->_metalShader = v27;
  }
  else
  {
    v29 = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initDefaultTextureAndOpacityMotionBlurShaderWithDevice:colorAttachment:velocityAttachment:motionBlur:", v8, v9, v10, BYTE1(self->_scaleMin));
    metalShader = self->_metalShader;
    self->_metalShader = v29;
  }

  objc_msgSend(v6, "size");
  v31 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v8, TSDRectWithSize(v30));
  mtlDataBuffer = self->_mtlDataBuffer;
  self->_mtlDataBuffer = v31;

}

- (void)p_setupMetalTransformWithContext:(id)a3 texturedRect:(id)a4
{
  TSDMetalMotionBlurEffect *metalMotionBlurEffect;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[8];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[KNAnimationEffect mvpMatrixWithContext:](self, "mvpMatrixWithContext:", a3, a4);
  if (BYTE1(self->_scaleMin))
  {
    metalMotionBlurEffect = self->_metalMotionBlurEffect;
    if (metalMotionBlurEffect)
    {
      v10[4] = v23;
      v10[5] = v24;
      v10[6] = v25;
      v10[7] = v26;
      v10[0] = v19;
      v10[1] = v20;
      v10[2] = v21;
      v10[3] = v22;
      -[TSDMetalMotionBlurEffect adjustTransformForMotionBlurBuffer:](metalMotionBlurEffect, "adjustTransformForMotionBlurBuffer:", v10);
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
    }
    v23 = v15;
    v24 = v16;
    v25 = v17;
    v26 = v18;
    v19 = v11;
    v20 = v12;
    v21 = v13;
    v22 = v14;
  }
  v6 = v24;
  *(_OWORD *)&self->_baseTransform.m31 = v23;
  *(_OWORD *)&self->_baseTransform.m33 = v6;
  v7 = v26;
  *(_OWORD *)&self->_baseTransform.m41 = v25;
  *(_OWORD *)&self->_baseTransform.m43 = v7;
  v8 = v20;
  *(_OWORD *)&self->_baseTransform.m11 = v19;
  *(_OWORD *)&self->_baseTransform.m13 = v8;
  v9 = v22;
  *(_OWORD *)&self->_baseTransform.m21 = v21;
  *(_OWORD *)&self->_baseTransform.m23 = v9;
}

- (void)p_setupAnimationWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textures"));
  if (objc_msgSend(v4, "count") != (char *)&dword_0 + 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFromDarkness p_setupAnimationWithContext:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFromDarkness.m"));
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 486, CFSTR("Effect expects one texture. Passed (%lu) textures."), objc_msgSend(v4, "count"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  -[KNBuildFromDarkness p_setupMetalTransformWithContext:texturedRect:](self, "p_setupMetalTransformWithContext:texturedRect:", v19, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "animatedBuild"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attributes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("KNBuildCustomAttributesScaleAmount")));
  objc_msgSend(v11, "doubleValue");
  v13 = v12 / 100.0;

  BYTE2(self->_scaleMin) = 1;
  self->_scaleMax = 1.0;
  self[1].super.super.isa = (Class)0x3FF0000000000000;
  BYTE1(self->_scaleMin) = objc_msgSend(v19, "isMotionBlurred");
  if (fabs(v13 + -1.0) >= 0.01)
  {
    if (v13 >= 1.0)
    {
      if (v13 > 1.0)
      {
        BYTE2(self->_scaleMin) = 0;
        -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Scale Max"));
        *(double *)&self[1].super.super.isa = TSUMix(1.0, v15, v13 + -1.0);
      }
    }
    else
    {
      -[KNAnimParameterGroup valueForConstant:](self->_parameterGroup, "valueForConstant:", CFSTR("Scale Min"));
      self->_scaleMax = TSUMix(v14, 1.0, v13);
    }
  }
  else
  {
    BYTE1(self->_scaleMin) = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "animatedBuild"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attributes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("KNBuildCustomAttributesShine")));
  LOBYTE(self->_scaleMin) = objc_msgSend(v18, "BOOLValue");

  -[KNBuildFromDarkness p_setupMetalAnimationWithContext:texturedRect:](self, "p_setupMetalAnimationWithContext:texturedRect:", v19, v8);
}

- (void)renderFrameWithContext:(id)a3
{
  -[KNBuildFromDarkness metalRenderFrameWithContext:](self, "metalRenderFrameWithContext:", a3);
}

- (void)p_metalSetupWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TSDMetalMotionBlurEffect *metalMotionBlurEffect;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[8];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v4 = a3;
  if (!self->_isMetalSetupComplete)
  {
    -[KNBuildFromDarkness p_setupAnimationWithContext:](self, "p_setupAnimationWithContext:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textures"));
    if (objc_msgSend(v5, "count") != (char *)&dword_0 + 1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFromDarkness p_metalSetupWithContext:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFromDarkness.m"));
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 538, CFSTR("Effect expects one texture. Passed (%lu) textures."), objc_msgSend(v5, "count"));

    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[KNAnimationEffect mvpMatrixWithContext:](self, "mvpMatrixWithContext:", v4);
    if (BYTE1(self->_scaleMin))
    {
      metalMotionBlurEffect = self->_metalMotionBlurEffect;
      if (metalMotionBlurEffect)
      {
        v14[4] = v27;
        v14[5] = v28;
        v14[6] = v29;
        v14[7] = v30;
        v14[0] = v23;
        v14[1] = v24;
        v14[2] = v25;
        v14[3] = v26;
        -[TSDMetalMotionBlurEffect adjustTransformForMotionBlurBuffer:](metalMotionBlurEffect, "adjustTransformForMotionBlurBuffer:", v14);
      }
      else
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
      }
      v27 = v19;
      v28 = v20;
      v29 = v21;
      v30 = v22;
      v23 = v15;
      v24 = v16;
      v25 = v17;
      v26 = v18;
    }
    v10 = v28;
    *(_OWORD *)&self->_baseTransform.m31 = v27;
    *(_OWORD *)&self->_baseTransform.m33 = v10;
    v11 = v30;
    *(_OWORD *)&self->_baseTransform.m41 = v29;
    *(_OWORD *)&self->_baseTransform.m43 = v11;
    v12 = v24;
    *(_OWORD *)&self->_baseTransform.m11 = v23;
    *(_OWORD *)&self->_baseTransform.m13 = v12;
    v13 = v26;
    *(_OWORD *)&self->_baseTransform.m21 = v25;
    *(_OWORD *)&self->_baseTransform.m23 = v13;
    self->_isMetalSetupComplete = 1;

  }
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animatedBuild"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("KNBuildCustomAttributesShine")));
  LOBYTE(self->_scaleMin) = objc_msgSend(v6, "BOOLValue");

  -[KNBuildFromDarkness p_metalSetupWithContext:](self, "p_metalSetupWithContext:", v9);
  if (!LOBYTE(self->_scaleMin)
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animatedBuild")),
        v8 = objc_msgSend(v7, "isBuildIn"),
        v7,
        v8))
  {
    -[KNBuildFromDarkness p_setupMetalEdgeDistanceTextureWithContext:](self, "p_setupMetalEdgeDistanceTextureWithContext:", v9);
  }

}

- (void)metalAnimationWillBeginWithContext:(id)a3
{
  id v4;

  v4 = a3;
  -[KNBuildFromDarkness metalPrepareAnimationWithContext:](self, "metalPrepareAnimationWithContext:", v4);
  -[KNBuildFromDarkness metalAnimationHasBegunWithContext:](self, "metalAnimationHasBegunWithContext:", v4);

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
    -[KNBuildFromDarkness p_setupMetalEdgeDistanceTextureWithContext:](self, "p_setupMetalEdgeDistanceTextureWithContext:", v6);

}

- (void)metalRenderFrameWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  TSDMetalShader *metalShader;
  int *v14;
  uint64_t v15;
  TSDMetalMotionBlurEffect *metalMotionBlurEffect;
  void *v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metalContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderEncoder"));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFromDarkness metalRenderFrameWithContext:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFromDarkness.m"));
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 581, CFSTR("invalid nil value for '%s'"), "workingEncoder");

  }
  if (BYTE1(self->_scaleMin))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[TSDMetalMotionBlurEffect bindColorAndVelocityWithMetalContext:shouldFillBackground:](self->_metalMotionBlurEffect, "bindColorAndVelocityWithMetalContext:shouldFillBackground:", v4, 0));

    v5 = (void *)v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "textures"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metalTextureWithContext:", v4));

  if (v12 && self->_edgeDistanceTexture)
  {
    -[KNBuildFromDarkness p_drawWithContext:](self, "p_drawWithContext:", v18);
    metalShader = self->_metalShader;
    if (LOBYTE(self->_scaleMin))
    {
      if (BYTE1(self->_scaleMin))
        v14 = &OBJC_IVAR___KNBuildFromDarkness__vertexInputMB;
      else
        v14 = &OBJC_IVAR___KNBuildFromDarkness__vertexInput;
      -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](metalShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v5, (char *)self + *v14, &self->_anon_200[7]);
      objc_msgSend(v5, "setFragmentTexture:atIndex:", self->_edgeDistanceTexture, 1);
    }
    else
    {
      if (BYTE1(self->_scaleMin))
        v15 = 320;
      else
        v15 = 256;
      -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](metalShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v5, (char *)self + v15, &self->_edgeTextureName);
    }
    objc_msgSend(v5, "setFragmentTexture:atIndex:", v12, 0);
    -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_mtlDataBuffer, "drawWithEncoder:atIndex:", v5, -[TSDMetalShader bufferIndex](self->_metalShader, "bufferIndex"));
    if (BYTE1(self->_scaleMin))
    {
      metalMotionBlurEffect = self->_metalMotionBlurEffect;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderEncoder"));
      -[TSDMetalMotionBlurEffect drawResultWithWorkingRenderEncoder:destinationRenderEncoder:](metalMotionBlurEffect, "drawResultWithWorkingRenderEncoder:destinationRenderEncoder:", v5, v17);

    }
  }

}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  TSDMetalShader *metalShader;
  TSDMTLDataBuffer *mtlDataBuffer;
  TSDMetalMotionBlurEffect *metalMotionBlurEffect;
  MTLTexture *edgeDistanceTexture;

  metalShader = self->_metalShader;
  self->_metalShader = 0;

  mtlDataBuffer = self->_mtlDataBuffer;
  self->_mtlDataBuffer = 0;

  metalMotionBlurEffect = self->_metalMotionBlurEffect;
  self->_metalMotionBlurEffect = 0;

  edgeDistanceTexture = self->_edgeDistanceTexture;
  self->_edgeDistanceTexture = 0;

  self->_isMetalSetupComplete = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeDistanceTexture, 0);
  objc_storeStrong((id *)&self->_metalMotionBlurEffect, 0);
  objc_storeStrong((id *)&self->_mtlDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalShader, 0);
  objc_storeStrong((id *)&self->_parameterGroup, 0);
}

@end
