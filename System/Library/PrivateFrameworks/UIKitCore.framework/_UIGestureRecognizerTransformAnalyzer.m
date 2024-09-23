@implementation _UIGestureRecognizerTransformAnalyzer

- (void)setRotationWeight:(double)a3
{
  self->_rotationWeight = a3;
}

- (void)setTranslationWeight:(double)a3
{
  self->_translationWeight = a3;
}

- (_UIGestureRecognizerTransformAnalyzer)init
{
  _UIGestureRecognizerTransformAnalyzer *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIGestureRecognizerTransformAnalyzer;
  result = -[_UIGestureRecognizerTransformAnalyzer init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_translationWeight = _Q0;
    result->_rotationWeight = 1.0;
  }
  return result;
}

- (void)reset
{
  self->_lowPassTranslationMagnitudeDelta = 0.0;
  self->_lowPassScaleDelta = 0.0;
  self->_lowPassRotationDelta = 0.0;
}

- (void)setPinchingWeight:(double)a3
{
  self->_pinchingWeight = a3;
}

- (void)analyzeTouches:(id)a3
{
  int v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  float v41;
  double v42;
  double v43;
  double translationWeight;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  int64_t v52;
  double v53;
  double v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "count");
  v6 = v5;
  if (v5 == 1)
  {
    objc_msgSend(a3, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_locationInSceneReferenceSpace");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v7, "_previousLocationInSceneReferenceSpace");
    v13 = v9 - v12;
    v15 = v11 - v14;

LABEL_12:
    v39 = 0.0;
    v40 = 0.0;
    goto LABEL_15;
  }
  v13 = *MEMORY[0x1E0C9D538];
  v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v5 < 1)
    goto LABEL_12;
  v16 = _CentroidOfTouches(a3, 0);
  v18 = v17;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v19 = a3;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v56;
    v23 = 0.0;
    v24 = 0.0;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v56 != v22)
          objc_enumerationMutation(v19);
        v26 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v26, "_locationInSceneReferenceSpace", (_QWORD)v55);
        v28 = v27;
        v30 = v29;
        objc_msgSend(v26, "_previousLocationInSceneReferenceSpace");
        v32 = v28 - v31;
        v34 = v30 - v33;
        v13 = v13 + v32;
        v15 = v15 + v34;
        v35 = (v28 - v16) * (v28 - v16) + (v30 - v18) * (v30 - v18);
        v36 = sqrtf(v35);
        v37 = (v28 - v16) / v36;
        v38 = (v30 - v18) / v36;
        v24 = v24 + v32 * v37 + v34 * v38;
        v23 = v23 + v32 * v38 - v34 * v37;
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v21);
  }
  else
  {
    v23 = 0.0;
    v24 = 0.0;
  }

  v13 = v13 / (double)v6;
  v40 = v24 / (double)v6 * 0.4;
  v39 = v23 / (double)v6 * 0.4;
  v15 = v15 / (double)v6;
LABEL_15:
  v41 = v15 * v15 + v13 * v13;
  v42 = self->_lowPassTranslationMagnitudeDelta * 0.6 + sqrtf(v41) * 0.4;
  v43 = v40 + self->_lowPassScaleDelta * 0.6;
  translationWeight = self->_translationWeight;
  v45 = self->_lowPassRotationDelta * 0.6;
  self->_lowPassTranslationMagnitudeDelta = v42;
  self->_lowPassScaleDelta = v43;
  v46 = v39 + v45;
  self->_lowPassRotationDelta = v46;
  v47 = translationWeight * fabs(v42);
  v48 = fabs(v43) * self->_pinchingWeight;
  v49 = fabs(v46) * self->_rotationWeight;
  v50 = 1.0;
  if (v48 <= 0.0)
    v51 = 1.0;
  else
    v51 = v48;
  if (v48 != 0.0 && v47 / v51 <= 1.4)
    goto LABEL_24;
  if (v49 > 0.0)
    v50 = v49;
  v52 = 1;
  if (v49 != 0.0 && v47 / v50 <= 1.4)
  {
LABEL_24:
    v53 = 1.0;
    if (v47 <= 0.0)
      v54 = 1.0;
    else
      v54 = v47;
    if (v47 != 0.0 && v48 / v54 <= 1.4)
      goto LABEL_36;
    if (v49 > 0.0)
      v53 = v49;
    v52 = 2;
    if (v49 != 0.0 && v48 / v53 <= 1.4)
    {
LABEL_36:
      if (v47 != 0.0 && v49 / v54 <= 1.4 || (v52 = 3, v48 != 0.0) && v49 / v51 <= 1.4)
        v52 = 0;
    }
  }
  self->_dominantComponent = v52;
}

- (double)translationWeight
{
  return self->_translationWeight;
}

- (double)pinchingWeight
{
  return self->_pinchingWeight;
}

- (double)rotationWeight
{
  return self->_rotationWeight;
}

- (int64_t)dominantComponent
{
  return self->_dominantComponent;
}

@end
