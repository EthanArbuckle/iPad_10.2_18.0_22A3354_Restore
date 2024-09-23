@implementation UIGestureRecognizerTransformAnalyzer

- (UIGestureRecognizerTransformAnalyzer)init
{
  UIGestureRecognizerTransformAnalyzer *v2;
  UIGestureRecognizerTransformAnalyzer *v3;
  UIGestureRecognizerTransformAnalyzerInfo *v9;
  UIGestureRecognizerTransformAnalyzerInfo *smoothedInfo;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIGestureRecognizerTransformAnalyzer;
  v2 = -[UIGestureRecognizerTransformAnalyzer init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v2->_translationWeight = _Q0;
    v2->_rotationWeight = 1.0;
    v9 = objc_alloc_init(UIGestureRecognizerTransformAnalyzerInfo);
    smoothedInfo = v3->_smoothedInfo;
    v3->_smoothedInfo = v9;

  }
  return v3;
}

- (void)reset
{
  -[UIGestureRecognizerTransformAnalyzerInfo _reset](self->_smoothedInfo, "_reset");
}

- (id)analyzeTouches:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  uint64_t i;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  float v39;
  double v40;
  double v41;
  double v42;
  float v43;
  double v44;
  UIGestureRecognizerTransformAnalyzerInfo *v45;
  UIGestureRecognizerTransformAnalyzerInfo *smoothedInfo;
  double v47;
  UIGestureRecognizerTransformAnalyzerInfo *v48;
  double v49;
  UIGestureRecognizerTransformAnalyzerInfo *v50;
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
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  int v67;
  double v69;
  double v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v8 = 0.0;
  if (v5)
  {
    v9 = v5;
    if (v5 == 1)
    {
      objc_msgSend(v4, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_locationInSceneReferenceSpace");
      v12 = v11;
      v14 = v13;
      objc_msgSend(v10, "_previousLocationInSceneReferenceSpace");
      v16 = v12 - v15;
      v18 = v14 - v17;
      v6 = vabdd_f64(v12, v15);
      v7 = vabdd_f64(v14, v17);

      v19 = 0.0;
    }
    else
    {
      v20 = _CentroidOfTouches(v4, 0);
      v69 = v21;
      v70 = v20;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v22 = v4;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v72;
        v26 = 0.0;
        v27 = v7;
        v28 = v6;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v72 != v25)
              objc_enumerationMutation(v22);
            v30 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
            objc_msgSend(v30, "_locationInSceneReferenceSpace", *(_QWORD *)&v69);
            v32 = v31;
            v34 = v33;
            objc_msgSend(v30, "_previousLocationInSceneReferenceSpace");
            v36 = v32 - v35;
            v38 = v34 - v37;
            v28 = v28 + v32 - v35;
            v27 = v27 + v34 - v37;
            v6 = v6 + vabdd_f64(v32, v35);
            v7 = v7 + vabdd_f64(v34, v37);
            v39 = (v34 - v69) * (v34 - v69) + (v32 - v70) * (v32 - v70);
            v40 = sqrtf(v39);
            v41 = (v32 - v70) / v40;
            v42 = (v34 - v69) / v40;
            v8 = v8 + v38 * v42 + v36 * v41;
            v26 = v26 + v36 * v42 - v38 * v41;
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
        }
        while (v24);
      }
      else
      {
        v26 = 0.0;
        v27 = v7;
        v28 = v6;
      }

      v16 = v28 / (double)v9;
      v18 = v27 / (double)v9;
      v6 = v6 / (double)v9;
      v7 = v7 / (double)v9;
      v19 = v8 / (double)v9;
      v8 = v26 / (double)v9;
    }
  }
  else
  {
    v19 = 0.0;
    v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v16 = *MEMORY[0x1E0C9D538];
  }
  v43 = v18 * v18 + v16 * v16;
  v44 = sqrtf(v43);
  v45 = objc_alloc_init(UIGestureRecognizerTransformAnalyzerInfo);
  -[UIGestureRecognizerTransformAnalyzerInfo _setTranslation:](v45, "_setTranslation:", v16, v18);
  -[UIGestureRecognizerTransformAnalyzerInfo _setTranslationMagnitude:](v45, "_setTranslationMagnitude:", v44);
  -[UIGestureRecognizerTransformAnalyzerInfo _setAbsoluteTranslation:](v45, "_setAbsoluteTranslation:", v6, v7);
  -[UIGestureRecognizerTransformAnalyzerInfo _setScale:](v45, "_setScale:", v19);
  -[UIGestureRecognizerTransformAnalyzerInfo _setRotation:](v45, "_setRotation:", v8);
  smoothedInfo = self->_smoothedInfo;
  -[UIGestureRecognizerTransformAnalyzerInfo translationMagnitude](smoothedInfo, "translationMagnitude");
  -[UIGestureRecognizerTransformAnalyzerInfo _setTranslationMagnitude:](smoothedInfo, "_setTranslationMagnitude:", v47 * 0.6 + v44 * 0.4);
  v48 = self->_smoothedInfo;
  -[UIGestureRecognizerTransformAnalyzerInfo scale](v48, "scale");
  -[UIGestureRecognizerTransformAnalyzerInfo _setScale:](v48, "_setScale:", v49 * 0.6 + v19 * 0.4);
  v50 = self->_smoothedInfo;
  -[UIGestureRecognizerTransformAnalyzerInfo rotation](v50, "rotation");
  -[UIGestureRecognizerTransformAnalyzerInfo _setRotation:](v50, "_setRotation:", v51 * 0.6 + v8 * 0.4);
  -[UIGestureRecognizerTransformAnalyzerInfo translation](self->_smoothedInfo, "translation");
  v53 = v52 * 0.6 + v16 * 0.4;
  -[UIGestureRecognizerTransformAnalyzerInfo translation](self->_smoothedInfo, "translation");
  -[UIGestureRecognizerTransformAnalyzerInfo _setTranslation:](self->_smoothedInfo, "_setTranslation:", v53, v54 * 0.6 + v18 * 0.4);
  -[UIGestureRecognizerTransformAnalyzerInfo absoluteTranslation](self->_smoothedInfo, "absoluteTranslation");
  v56 = v55 * 0.6 + v6 * 0.4;
  -[UIGestureRecognizerTransformAnalyzerInfo absoluteTranslation](self->_smoothedInfo, "absoluteTranslation");
  -[UIGestureRecognizerTransformAnalyzerInfo _setAbsoluteTranslation:](self->_smoothedInfo, "_setAbsoluteTranslation:", v56, v57 * 0.6 + v7 * 0.4);
  -[UIGestureRecognizerTransformAnalyzerInfo translationMagnitude](self->_smoothedInfo, "translationMagnitude");
  v59 = fabs(v58) * self->_translationWeight;
  -[UIGestureRecognizerTransformAnalyzerInfo scale](self->_smoothedInfo, "scale");
  v61 = fabs(v60) * self->_pinchingWeight;
  -[UIGestureRecognizerTransformAnalyzerInfo rotation](self->_smoothedInfo, "rotation");
  v63 = fabs(v62) * self->_rotationWeight;
  v64 = 1.0;
  if (v61 <= 0.0)
    v65 = 1.0;
  else
    v65 = v61;
  if (v63 <= 0.0)
    v66 = 1.0;
  else
    v66 = v63;
  if (v59 / v65 <= 1.4 || v59 / v66 <= 1.4)
  {
    if (v59 > 0.0)
      v64 = v59;
    if (v61 / v64 <= 1.4 || v61 / v66 <= 1.4)
    {
      if (v63 / v64 <= 1.4 || v63 / v65 <= 1.4)
      {
        self->_dominantComponent = 0;
        goto LABEL_33;
      }
      v67 = 3;
    }
    else
    {
      v67 = 2;
    }
  }
  else
  {
    v67 = 1;
  }
  self->_dominantComponent = v67;
LABEL_33:

  return v45;
}

- (double)translationWeight
{
  return self->_translationWeight;
}

- (void)setTranslationWeight:(double)a3
{
  self->_translationWeight = a3;
}

- (double)pinchingWeight
{
  return self->_pinchingWeight;
}

- (void)setPinchingWeight:(double)a3
{
  self->_pinchingWeight = a3;
}

- (double)rotationWeight
{
  return self->_rotationWeight;
}

- (void)setRotationWeight:(double)a3
{
  self->_rotationWeight = a3;
}

- (int)dominantComponent
{
  return self->_dominantComponent;
}

- (UIGestureRecognizerTransformAnalyzerInfo)smoothedInfo
{
  return self->_smoothedInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smoothedInfo, 0);
}

@end
