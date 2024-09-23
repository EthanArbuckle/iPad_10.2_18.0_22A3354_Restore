@implementation PUParallaxLayerLayoutInfo

- (id)initWithDeviceOrientation:(void *)a3 containerFrame:(char)a4 visibleFrame:(void *)a5 settlingEffectFrame:(char)a6 headroomFrame:(void *)a7 headroomVisibilityAmount:(char)a8 styleIsHighKey:(double)a9 primaryStyleColor:(double)a10 canApplyParallax:(double)a11 parallaxVector:(double)a12 parallaxAmount:(CGFloat)a13 visibilityAmount:(CGFloat)a14 visibilityEdge:(CGFloat)a15 animateChanges:(CGFloat)a16
{
  id v45;
  id *v46;
  id *v47;
  void *v49;
  objc_super v50;
  CGRect v51;

  v45 = a5;
  v51.origin.x = a13;
  v51.origin.y = a14;
  v51.size.width = a15;
  v51.size.height = a16;
  if (CGRectIsEmpty(v51))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUParallaxLayerLayoutInfo.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CGRectIsEmpty(visibleFrame)"));

  }
  v50.receiver = a1;
  v50.super_class = (Class)PUParallaxLayerLayoutInfo;
  v46 = (id *)objc_msgSendSuper2(&v50, sel_init);
  v47 = v46;
  if (v46)
  {
    v46[2] = a3;
    *((double *)v46 + 10) = a9;
    *((double *)v46 + 11) = a10;
    *((double *)v46 + 12) = a11;
    *((double *)v46 + 13) = a12;
    *((CGFloat *)v46 + 14) = a13;
    *((CGFloat *)v46 + 15) = a14;
    *((CGFloat *)v46 + 16) = a15;
    *((CGFloat *)v46 + 17) = a16;
    v46[18] = a17;
    v46[19] = a18;
    v46[20] = a19;
    v46[21] = a20;
    v46[22] = a21;
    v46[23] = a22;
    v46[24] = a23;
    v46[25] = a24;
    *((_BYTE *)v46 + 8) = a4;
    objc_storeStrong(v46 + 3, a5);
    *((_BYTE *)v47 + 9) = a6;
    v47[8] = a26;
    v47[9] = a27;
    v47[4] = a25;
    v47[5] = a28;
    v47[6] = a29;
    v47[7] = a7;
    *((_BYTE *)v47 + 10) = a8;
  }

  return v47;
}

- (BOOL)isEqual:(id)a3
{
  PUParallaxLayerLayoutInfo *v4;
  PUParallaxLayerLayoutInfo *v5;
  int64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
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
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  _BOOL4 v55;
  id v56;
  id v57;
  void *v58;
  char v59;
  _BOOL4 v60;
  _BOOL4 v61;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  unint64_t v75;
  _BOOL4 v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v4 = (PUParallaxLayerLayoutInfo *)a3;
  if (self == v4)
  {
    LOBYTE(v60) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PUParallaxLayerLayoutInfo deviceOrientation](self, "deviceOrientation");
      if (v6 != -[PUParallaxLayerLayoutInfo deviceOrientation](v5, "deviceOrientation"))
        goto LABEL_17;
      -[PUParallaxLayerLayoutInfo containerFrame](self, "containerFrame");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[PUParallaxLayerLayoutInfo containerFrame](v5, "containerFrame");
      v81.origin.x = v15;
      v81.origin.y = v16;
      v81.size.width = v17;
      v81.size.height = v18;
      v77.origin.x = v8;
      v77.origin.y = v10;
      v77.size.width = v12;
      v77.size.height = v14;
      if (!CGRectEqualToRect(v77, v81))
        goto LABEL_17;
      -[PUParallaxLayerLayoutInfo visibleFrame](self, "visibleFrame");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      -[PUParallaxLayerLayoutInfo visibleFrame](v5, "visibleFrame");
      v82.origin.x = v27;
      v82.origin.y = v28;
      v82.size.width = v29;
      v82.size.height = v30;
      v78.origin.x = v20;
      v78.origin.y = v22;
      v78.size.width = v24;
      v78.size.height = v26;
      if (!CGRectEqualToRect(v78, v82))
        goto LABEL_17;
      -[PUParallaxLayerLayoutInfo settlingEffectFrame](self, "settlingEffectFrame");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      -[PUParallaxLayerLayoutInfo settlingEffectFrame](v5, "settlingEffectFrame");
      v83.origin.x = v39;
      v83.origin.y = v40;
      v83.size.width = v41;
      v83.size.height = v42;
      v79.origin.x = v32;
      v79.origin.y = v34;
      v79.size.width = v36;
      v79.size.height = v38;
      if (!CGRectEqualToRect(v79, v83))
        goto LABEL_17;
      -[PUParallaxLayerLayoutInfo headroomFrame](self, "headroomFrame");
      v44 = v43;
      v46 = v45;
      v48 = v47;
      v50 = v49;
      -[PUParallaxLayerLayoutInfo headroomFrame](v5, "headroomFrame");
      v84.origin.x = v51;
      v84.origin.y = v52;
      v84.size.width = v53;
      v84.size.height = v54;
      v80.origin.x = v44;
      v80.origin.y = v46;
      v80.size.width = v48;
      v80.size.height = v50;
      if (!CGRectEqualToRect(v80, v84))
        goto LABEL_17;
      v55 = -[PUParallaxLayerLayoutInfo styleIsHighKey](self, "styleIsHighKey");
      if (v55 != -[PUParallaxLayerLayoutInfo styleIsHighKey](v5, "styleIsHighKey"))
        goto LABEL_17;
      -[PUParallaxLayerLayoutInfo primaryStyleColor](self, "primaryStyleColor");
      v56 = (id)objc_claimAutoreleasedReturnValue();
      -[PUParallaxLayerLayoutInfo primaryStyleColor](v5, "primaryStyleColor");
      v57 = (id)objc_claimAutoreleasedReturnValue();
      if (v56 == v57)
      {

      }
      else
      {
        v58 = v57;
        v59 = objc_msgSend(v56, "isEqual:", v57);

        if ((v59 & 1) == 0)
          goto LABEL_17;
      }
      -[PUParallaxLayerLayoutInfo headroomVisibilityAmount](self, "headroomVisibilityAmount");
      -[PUParallaxLayerLayoutInfo headroomVisibilityAmount](v5, "headroomVisibilityAmount");
      if (PXFloatApproximatelyEqualToFloat())
      {
        v61 = -[PUParallaxLayerLayoutInfo canApplyParallax](self, "canApplyParallax");
        if (v61 == -[PUParallaxLayerLayoutInfo canApplyParallax](v5, "canApplyParallax"))
        {
          -[PUParallaxLayerLayoutInfo parallaxVector](self, "parallaxVector");
          v64 = v63;
          v66 = v65;
          -[PUParallaxLayerLayoutInfo parallaxVector](v5, "parallaxVector");
          LOBYTE(v60) = 0;
          if (v64 != v68 || v66 != v67)
            goto LABEL_18;
          -[PUParallaxLayerLayoutInfo parallaxAmount](self, "parallaxAmount");
          v70 = v69;
          -[PUParallaxLayerLayoutInfo parallaxAmount](v5, "parallaxAmount");
          if (vabdd_f64(v70, v71) <= 0.00000999999975)
          {
            -[PUParallaxLayerLayoutInfo visibilityAmount](self, "visibilityAmount");
            v73 = v72;
            -[PUParallaxLayerLayoutInfo visibilityAmount](v5, "visibilityAmount");
            if (vabdd_f64(v73, v74) <= 0.00000999999975)
            {
              v75 = -[PUParallaxLayerLayoutInfo visibilityEdge](self, "visibilityEdge");
              if (v75 == -[PUParallaxLayerLayoutInfo visibilityEdge](v5, "visibilityEdge"))
              {
                v76 = -[PUParallaxLayerLayoutInfo animateChanges](self, "animateChanges");
                v60 = v76 ^ -[PUParallaxLayerLayoutInfo animateChanges](v5, "animateChanges") ^ 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
LABEL_17:
      LOBYTE(v60) = 0;
LABEL_18:

      goto LABEL_19;
    }
    LOBYTE(v60) = 0;
  }
LABEL_19:

  return v60;
}

- (CGRect)viewFrameForLayerFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUParallaxLayerLayoutInfo visibleFrame](self, "visibleFrame");
  v12 = x - v11;
  v13 = 0.0;
  v14 = 0.0;
  if (v9 != 0.0)
  {
    v12 = v12 / v9;
    v14 = width / v9;
  }
  v15 = y - v8;
  if (v10 != 0.0)
  {
    v15 = v15 / v10;
    v13 = height / v10;
  }
  -[PUParallaxLayerLayoutInfo containerFrame](self, "containerFrame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  if ((unint64_t)(-[PUParallaxLayerLayoutInfo deviceOrientation](self, "deviceOrientation") - 3) <= 1)
  {
    PXRectTransposed();
    v17 = v24;
    v19 = v25;
    v21 = v26;
    v23 = v27;
  }
  v28 = v17 + v12 * v21;
  v29 = v19 + v15 * v23;
  v30 = v14 * v21;
  v31 = v13 * v23;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGAffineTransform)additionalTransform
{
  return PUPosterAdditionalTransformForDeviceOrientation((CGAffineTransform *)-[PUParallaxLayerLayoutInfo deviceOrientation](self, "deviceOrientation"), (uint64_t)retstr);
}

- (CGAffineTransform)additionalContentTransform
{
  uint64_t v5;
  __int128 v6;
  CGAffineTransform *result;
  double v8;
  double v9;

  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  result = -[PUParallaxLayerLayoutInfo deviceOrientation](self, "deviceOrientation");
  if ((unint64_t)result >= 3)
  {
    -[PUParallaxLayerLayoutInfo containerFrame](self, "containerFrame");
    PXSizeTranspose();
    PXSizeSubtract();
    return CGAffineTransformMakeTranslation(retstr, v8 * 0.5, v9 * 0.5);
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PUParallaxLayerLayoutInfo containerFrame](self, "containerFrame");
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v20);
  -[PUParallaxLayerLayoutInfo visibleFrame](self, "visibleFrame");
  v6 = CGRectCreateDictionaryRepresentation(v21);
  -[PUParallaxLayerLayoutInfo settlingEffectFrame](self, "settlingEffectFrame");
  v7 = CGRectCreateDictionaryRepresentation(v22);
  if (-[PUParallaxLayerLayoutInfo canApplyParallax](self, "canApplyParallax"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  -[PUParallaxLayerLayoutInfo parallaxVector](self, "parallaxVector");
  v10 = v9;
  -[PUParallaxLayerLayoutInfo parallaxVector](self, "parallaxVector");
  v12 = v11;
  -[PUParallaxLayerLayoutInfo parallaxAmount](self, "parallaxAmount");
  v14 = v13;
  -[PUParallaxLayerLayoutInfo visibilityAmount](self, "visibilityAmount");
  v16 = v15;
  if (-[PUParallaxLayerLayoutInfo animateChanges](self, "animateChanges"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p container=%@ visible=%@ settling=%@ canDoParallax=%@ parallaxVec=(%.2f, %.2f) parallaxAmt=%.2f visiblityAmt=%.2f animate=%@>"), v4, self, DictionaryRepresentation, v6, v7, v8, v10, v12, v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (CGRect)containerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containerFrame.origin.x;
  y = self->_containerFrame.origin.y;
  width = self->_containerFrame.size.width;
  height = self->_containerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)visibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleFrame.origin.x;
  y = self->_visibleFrame.origin.y;
  width = self->_visibleFrame.size.width;
  height = self->_visibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)settlingEffectFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_settlingEffectFrame.origin.x;
  y = self->_settlingEffectFrame.origin.y;
  width = self->_settlingEffectFrame.size.width;
  height = self->_settlingEffectFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)headroomFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_headroomFrame.origin.x;
  y = self->_headroomFrame.origin.y;
  width = self->_headroomFrame.size.width;
  height = self->_headroomFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)styleIsHighKey
{
  return self->_styleIsHighKey;
}

- (UIColor)primaryStyleColor
{
  return self->_primaryStyleColor;
}

- (double)headroomVisibilityAmount
{
  return self->_headroomVisibilityAmount;
}

- (BOOL)canApplyParallax
{
  return self->_canApplyParallax;
}

- (CGPoint)parallaxVector
{
  double x;
  double y;
  CGPoint result;

  x = self->_parallaxVector.x;
  y = self->_parallaxVector.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)parallaxAmount
{
  return self->_parallaxAmount;
}

- (double)visibilityAmount
{
  return self->_visibilityAmount;
}

- (unint64_t)visibilityEdge
{
  return self->_visibilityEdge;
}

- (BOOL)animateChanges
{
  return self->_animateChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryStyleColor, 0);
}

@end
