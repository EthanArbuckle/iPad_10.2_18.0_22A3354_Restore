@implementation UIPointerStyle

+ (id)_makeStyleWithHoverStyle:(id)a3 view:(id)a4 convertAutomatic:(BOOL)a5
{
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  id v18[7];
  char v19;
  _QWORD v20[5];

  sub_18575EC90();
  v7 = (char *)a3 + OBJC_IVAR___UIHoverStyle__effect;
  swift_beginAccess();
  sub_1851E75D8((uint64_t)v7, (uint64_t)v20);
  v8 = *(void **)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 8);
  v9 = *(void **)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 16);
  v10 = *(void **)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 24);
  v11 = *(void **)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 32);
  v12 = *(void **)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 40);
  v13 = *(void **)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 48);
  v14 = *((_BYTE *)a3 + OBJC_IVAR___UIHoverStyle__shape + 56);
  v18[0] = *(id *)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape);
  v18[1] = v8;
  v18[2] = v9;
  v18[3] = v10;
  v18[4] = v11;
  v18[5] = v12;
  v18[6] = v13;
  v19 = v14;
  v15 = a4;
  sub_1852287BC(v18[0], (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, v14);
  sub_185773B48(v20, (uint64_t)v18, (uint64_t)v15);
  return v16;
}

+ (UIPointerStyle)styleWithEffect:(UIPointerEffect *)effect shape:(UIPointerShape *)shape
{
  UIPointerEffect *v5;
  UIPointerShape *v6;
  void *v7;
  UIPointerEffect *v8;
  UIPointerShape *v9;
  UIPointerEffect *v10;
  BOOL v11;
  UIPointerShape *v12;
  uint64_t v13;
  uint64_t v14;
  UIPointerShape *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
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
  _BOOL4 v36;
  double v37;
  UIPointerShape *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  __objc2_class *v44;
  _BYTE *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  UIPointerEffect *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  double v98;
  char v99;
  uint64_t v100;

  v5 = effect;
  v6 = shape;
  -[UIPointerEffect preview](v5, "preview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIPointerEffect allowsSanitization](v5, "allowsSanitization"))
  {
    v11 = 0;
    goto LABEL_38;
  }
  v8 = v5;
  v9 = v6;
  v10 = v8;
  if (+[_UIPointerAccessibilityEffect shouldApplyAccessibilityEffect](_UIPointerAccessibilityEffect, "shouldApplyAccessibilityEffect"))
  {
    +[_UIPointerAccessibilityEffect _effectWithInputEffect:](_UIPointerAccessibilityEffect, "_effectWithInputEffect:", v10);
    v5 = (UIPointerEffect *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = (UIPointerShape *)v10;
LABEL_36:

    goto LABEL_37;
  }
  if ((-[UIPointerEffect options](v10, "options") & 0x100) != 0)
  {
    -[UIPointerEffect preview](v10, "preview");
    v12 = (UIPointerShape *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    if (v9)
      v15 = v9;
    else
      v15 = v12;
    -[UIPointerShape size](v15, "size");
    *(_QWORD *)&v18 = _UISizeRespectingTransformsFromPreview(v12, v16, v17).n128_u64[0];
    v20 = v19;
    +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sizeRuleSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "explicitRequestMultiplier");
    v24 = v23;
    objc_msgSend(v22, "genericSizeRuleThreshold");
    v26 = v25;
    objc_msgSend(v22, "narrowAspectRuleMinorDimensionThreshold");
    v28 = v27;
    objc_msgSend(v22, "narrowAspectRuleMajorDimensionThreshold");
    v30 = v29;
    objc_msgSend(v22, "pointerSizeRuleMinorDimensionThreshold");
    v32 = v31;
    objc_msgSend(v22, "pointerSizeRuleMajorDimensionThreshold");
    v34 = 1.0;
    if (v13 != v14)
      v34 = v24;
    v35 = v34 * v30;
    if (v18 <= v28 && v20 <= v35 || (v20 > v26 * v34 ? (v36 = 1) : (v36 = v18 > v26 * v34), v20 <= v28 && v18 <= v35))
      v36 = 0;
    v37 = v34 * v33;
    if ((v18 > v32 || v20 > v37) && (v20 > v32 || v18 > v37))
    {

      if (v36)
      {
        +[UIPointerEffect effectWithPreview:](UIPointerHoverEffect, "effectWithPreview:", v12);
        v5 = (UIPointerEffect *)objc_claimAutoreleasedReturnValue();
        -[UIPointerEffect setPrefersShadow:](v5, "setPrefersShadow:", (-[UIPointerEffect options](v10, "options") >> 4) & 1);
        -[UIPointerEffect set_tintViewTakesOnPointerShape:](v5, "set_tintViewTakesOnPointerShape:", 1);
        v11 = (-[UIPointerEffect options](v10, "options") & 0x20) == 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {

    }
    if (v13 != v14)
    {
      v11 = 0;
      v5 = v10;
      goto LABEL_36;
    }
    v38 = v12;
    -[UIPointerShape parameters](v38, "parameters");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "visiblePath");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {

    }
    else
    {
      -[UIPointerShape view](v38, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "backgroundColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "_isOpaque");

      if (v43)
      {
        v44 = UIPointerLiftEffect;
LABEL_34:
        -[__objc2_class effectWithPreview:](v44, "effectWithPreview:", v38);
        v5 = (UIPointerEffect *)objc_claimAutoreleasedReturnValue();
        v11 = 0;
        goto LABEL_35;
      }
    }
    v44 = UIPointerHighlightEffect;
    goto LABEL_34;
  }
  v11 = 0;
  v5 = v10;
LABEL_37:

LABEL_38:
  v45 = (_BYTE *)objc_opt_new();
  objc_msgSend(v45, "setType:", 1);
  objc_msgSend(v45, "setPointerEffect:", v5);
  objc_msgSend(v45, "setOptions:", -[UIPointerEffect options](v5, "options"));
  objc_msgSend(v45, "setConstrainedAxes:", -[UIPointerEffect constrainedAxes](v5, "constrainedAxes"));
  v45[312] = v11;
  if (!v6)
  {
    v54 = v5;
    -[UIPointerEffect preview](v54, "preview");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "parameters");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v55, "_previewMode") == 1)
    {
      if (objc_msgSend(v56, "_isSingleLineText"))
      {
        objc_msgSend(v55, "size");
        v58 = v57;
        v60 = v59;
        v61 = 0.0;
        v62 = 0.0;
        v63 = 4.0;
LABEL_57:
        +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v61, v62, v58, v60, v63);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_58;
      }
      objc_msgSend(v56, "_setTextPathInsets:", -2.0, -3.0, -2.0, -3.0);
      objc_msgSend(v56, "_setTextPathCornerRadius:", 4.0);
      objc_msgSend(v56, "visiblePath");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v56, "visiblePath");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v64)
      {
        -[UIPointerEffect settings](v54, "settings");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "defaultPointerCornerRadius");
        v70 = v69;

        objc_msgSend(v55, "view");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "bounds");
        v73 = v72;
        v75 = v74;
        v77 = v76;
        v79 = v78;
        objc_msgSend(v55, "target");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "center");
        v82 = v81;
        v84 = v83;
        objc_msgSend(v55, "target");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "container");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "_currentScreenScale");
        UIRectCenteredAboutPointScale(v73, v75, v77, v79, v82, v84, v87);
        v89 = v88;
        v91 = v90;
        v93 = v92;
        v95 = v94;

        objc_msgSend(v55, "view");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "_cornerRadius");
        v98 = v97;

        if (v98 >= v70)
          v63 = v98;
        else
          v63 = v70;
        v61 = v89;
        v62 = v91;
        v58 = v93;
        v60 = v95;
        goto LABEL_57;
      }
      objc_msgSend(v56, "visiblePath");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      _UIPathConvertedToPreviewContainerSpace(v65, v55);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_58:
    objc_msgSend(v45, "setPointerShape:", v67);

    v99 = objc_msgSend(v45, "options");
    v100 = objc_msgSend(v45, "options");
    if ((v99 & 1) != 0)
      v53 = v100 | 0x800;
    else
      v53 = v100 | 0x40;
    v6 = 0;
    goto LABEL_62;
  }
  if (!dyld_program_sdk_at_least() || _UIIsPrivateMainBundle())
  {
    -[UIPointerShape path](v6, "path");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      -[UIPointerShape path](v6, "path");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      _UIPathConvertedToPreviewContainerSpace(v47, v7);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v48);
      v49 = objc_claimAutoreleasedReturnValue();

      v6 = (UIPointerShape *)v49;
    }
  }
  objc_msgSend(v45, "setPointerShape:", v6);
  if ((objc_msgSend(v45, "options") & 1) != 0)
  {
    objc_msgSend(v45, "pointerShape");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_opt_class();
    v52 = objc_opt_class();

    if (v51 != v52)
    {
      v53 = objc_msgSend(v45, "options") | 0x800;
LABEL_62:
      objc_msgSend(v45, "setOptions:", v53);
    }
  }
  -[UIPointerEffect defaultPointerCornerRadius](v5, "defaultPointerCornerRadius");
  -[UIPointerShape setDefaultCornerRadius:](v6, "setDefaultCornerRadius:");

  return (UIPointerStyle *)v45;
}

+ (UIPointerStyle)styleWithShape:(UIPointerShape *)shape constrainedAxes:(UIAxis)axes
{
  UIPointerShape *v5;
  void *v6;

  v5 = shape;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setPointerShape:", v5);

  objc_msgSend(v6, "setType:", 2);
  objc_msgSend(v6, "setOptions:", 1);
  objc_msgSend(v6, "setConstrainedAxes:", axes);
  return (UIPointerStyle *)v6;
}

+ (UIPointerStyle)hiddenPointerStyle
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setType:", 0);
  return (UIPointerStyle *)v2;
}

+ (UIPointerStyle)systemPointerStyle
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setType:", 2);
  objc_msgSend(v2, "setOptions:", 2049);
  return (UIPointerStyle *)v2;
}

- (void)setEffect:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIPointerStyle setPointerEffect:](self, "setPointerEffect:", v4);

}

- (UITargetedPreview)targetedPreview
{
  void *v2;
  void *v3;

  -[UIPointerStyle pointerEffect](self, "pointerEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITargetedPreview *)v3;
}

- (CGPoint)_pointerSlipFactor
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
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
  double v22;
  double v23;
  char v24;
  double v25;
  double v26;
  CGPoint result;

  if (-[UIPointerStyle type](self, "type") != 1 || (-[UIPointerStyle options](self, "options") & 1) != 0)
  {
    -[UIPointerStyle pointerShape](self, "pointerShape");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inherentConstrainedSlip");
    v16 = v15;
    v18 = v17;
  }
  else
  {
    -[UIPointerStyle pointerEffect](self, "pointerEffect");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPointerStyle pointerShape](self, "pointerShape");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v6 = v5;
    v8 = v7;

    objc_msgSend(v3, "overrideSlipPoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "overrideSlipPoints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "CGPointValue");
      v12 = v11;
      v14 = v13;

    }
    else
    {
      objc_msgSend(v3, "slipFactor");
      v20 = v19;
      v22 = v21;
      objc_msgSend(v3, "maxSlip");
      v12 = fmax(fmin(v6 * v20, v23), 0.0);
      v14 = fmax(fmin(v8 * v22, v23), 0.0);
    }
    v16 = v12 / v6;
    v18 = v14 / v8;
  }

  v24 = -[UIPointerStyle constrainedAxes](self, "constrainedAxes");
  v25 = 1.0;
  if ((v24 & 1) != 0)
    v26 = v16;
  else
    v26 = 1.0;
  if ((v24 & 2) != 0)
    v25 = v18;
  result.y = v25;
  result.x = v26;
  return result;
}

- (CGPoint)_contentSlipFactor
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char v12;
  double v13;
  double v14;
  CGPoint result;

  v3 = 1.0;
  v4 = 1.0;
  if (-[UIPointerStyle type](self, "type") == 1)
  {
    if ((-[UIPointerStyle options](self, "options") & 0x200) != 0)
    {
      -[UIPointerStyle _pointerSlipFactor](self, "_pointerSlipFactor");
      v3 = v10;
      v4 = v11;
    }
    else
    {
      -[UIPointerStyle pointerEffect](self, "pointerEffect");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parallaxAmount");
      v7 = v6;

      -[UIPointerStyle _pointerSlipFactor](self, "_pointerSlipFactor");
      v3 = v7 * v8;
      v4 = v7 * v9;
    }
  }
  v12 = -[UIPointerStyle constrainedAxes](self, "constrainedAxes");
  if ((v12 & 1) != 0)
    v13 = v3;
  else
    v13 = 1.0;
  if ((v12 & 2) != 0)
    v14 = v4;
  else
    v14 = 1.0;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)_contentSlipMappedToRegionSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  height = a3.height;
  width = a3.width;
  -[UIPointerStyle _contentSlipFactor](self, "_contentSlipFactor");
  v7 = v6;
  v9 = v8;
  if (-[UIPointerStyle type](self, "type") == 1)
  {
    -[UIPointerStyle pointerShape](self, "pointerShape");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v7 = fmin(v7 * v11 / (width * 0.5), 1.0);
    v9 = fmin(v9 * v12 / (height * 0.5), 1.0);

  }
  v13 = v7;
  v14 = v9;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)_pointerSlipMappedToRegionSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  height = a3.height;
  width = a3.width;
  -[UIPointerStyle _pointerSlipFactor](self, "_pointerSlipFactor");
  v7 = v6;
  v9 = v8;
  if (-[UIPointerStyle type](self, "type") == 1 && (-[UIPointerStyle options](self, "options") & 1) == 0)
  {
    -[UIPointerStyle pointerShape](self, "pointerShape");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v7 = fmin(v7 * v11 / (width * 0.5), 1.0);
    v9 = fmin(v9 * v12 / (height * 0.5), 1.0);

  }
  v13 = v7;
  v14 = v9;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)_adaptForNonSystemEffectSupportingEnvironment
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (-[UIPointerStyle type](self, "type") == 1)
  {
    -[UIPointerStyle pointerEffect](self, "pointerEffect");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIPointerStyle pointerEffect](self, "pointerEffect");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIPointerEffect effectWithPreview:](_UIPointerPencilHighlightEffect, "effectWithPreview:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPointerStyle setPointerEffect:](self, "setPointerEffect:", v7);

    }
    -[UIPointerStyle pointerEffect](self, "pointerEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "options");

    -[UIPointerStyle setOptions:](self, "setOptions:", v9 | 0x8000);
  }
}

- (double)contentScale
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v43;
  double v44;
  double v45;
  double v46;
  CGRect v47;
  CGRect v48;

  v3 = 1.0;
  if ((-[UIPointerStyle options](self, "options") & 0x20) != 0)
  {
    -[UIPointerStyle targetedPreview](self, "targetedPreview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIPointerStyle pointerMergesWithContent](self, "pointerMergesWithContent")
      || (-[UIPointerStyle options](self, "options") & 1) != 0)
    {
      objc_msgSend(v4, "size");
      v7 = v10;
      v9 = v11;
    }
    else
    {
      -[UIPointerStyle pointerShape](self, "pointerShape");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "size");
      v7 = v6;
      v9 = v8;

    }
    v12 = _UISizeRespectingTransformsFromPreview(v4, v7, v9).n128_f64[0];
    if (v12 >= v13)
      v14 = v12;
    else
      v14 = v13;
    -[UIPointerStyle pointerEffect](self, "pointerEffect");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scaleUpPoints");
    v3 = (v14 + v16) / v14;

    if (self->_determineScaleAutomatically)
    {
      -[UIPointerStyle targetedPreview](self, "targetedPreview");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "size");
      v19 = v18;
      v21 = v20;
      objc_msgSend(v17, "target");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "transform");
        v24 = v44;
        v25 = v43;
        v26 = v46;
        v27 = v45;
      }
      else
      {
        v26 = 0.0;
        v24 = 0.0;
        v27 = 0.0;
        v25 = 0.0;
      }
      v28 = v21 * v27 + v19 * v25;
      v29 = v21 * v26 + v19 * v24;

      objc_msgSend(v17, "target");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "container");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bounds");
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;

      v47.origin.x = v33;
      v47.origin.y = v35;
      v47.size.width = v37;
      v47.size.height = v39;
      v40 = CGRectGetWidth(v47) / v28;
      v48.origin.x = v33;
      v48.origin.y = v35;
      v48.size.width = v37;
      v48.size.height = v39;
      v41 = CGRectGetWidth(v48) / v29;
      if (v40 < v41)
        v41 = v40;
      v3 = fmax(fmin(v3, v41), 1.0);

    }
  }
  return v3;
}

- (double)_pointerIntensityForMaterialLuminance:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;

  -[UIPointerStyle pointerShape](self, "pointerShape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    if (!self->_type)
      goto LABEL_7;
LABEL_6:
    -[UIPointerStyle options](self, "options");
    -[UIPointerStyle pointerMergesWithContent](self, "pointerMergesWithContent");
    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "materialUsage");
  if (self->_type && v6 != 2)
    goto LABEL_6;
LABEL_7:
  PSIntensityForLuminanceAndUsage();
  v8 = v7;

  return v8;
}

- (BOOL)pointerUnderlapsContent
{
  int64_t v3;

  v3 = -[UIPointerStyle type](self, "type");
  if (v3)
    LOBYTE(v3) = (-[UIPointerStyle options](self, "options") & 1) == 0;
  return v3;
}

- (BOOL)pointerMergesWithContent
{
  return (-[UIPointerStyle options](self, "options") >> 1) & 1;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[UIPointerStyle type](self, "type");
  if (v5 > 2)
    v6 = CFSTR("<unknown>");
  else
    v6 = off_1E16D7818[v5];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; type = %@>"), v4, self, v6);
}

- (NSArray)compatibleDescriptors
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canTransitionInPlaceToEffectWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (-[UIPointerStyle type](self, "type") == 1)
  {
    -[UIPointerStyle targetedPreview](self, "targetedPreview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetedPreview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setType:", -[UIPointerStyle type](self, "type"));
  objc_msgSend(v4, "setOptions:", -[UIPointerStyle options](self, "options"));
  objc_msgSend(v4, "setConstrainedAxes:", -[UIPointerStyle constrainedAxes](self, "constrainedAxes"));
  -[UIPointerStyle pointerEffect](self, "pointerEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPointerEffect:", v6);

  -[UIPointerStyle pointerShape](self, "pointerShape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPointerShape:", v8);

  v4[312] = self->_determineScaleAutomatically;
  objc_msgSend(v4, "set_suppressesMirroring:", -[UIPointerStyle _suppressesMirroring](self, "_suppressesMirroring"));
  -[UIPointerStyle accessories](self, "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessories:", v9);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  UIPointerStyle *v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  int v17;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;

  v4 = (UIPointerStyle *)a3;
  if (v4 == self)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = objc_msgSend(v5, "type");
      if (v6 != -[UIPointerStyle type](self, "type")
        || (v7 = objc_msgSend(v5, "options"), v7 != -[UIPointerStyle options](self, "options"))
        || (v8 = objc_msgSend(v5, "constrainedAxes"), v8 != -[UIPointerStyle constrainedAxes](self, "constrainedAxes")))
      {
        LOBYTE(v14) = 0;
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v5, "pointerEffect");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPointerStyle pointerEffect](self, "pointerEffect");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v12 = v10;
      v13 = v12;
      if (v11 == v12)
      {

      }
      else
      {
        LOBYTE(v14) = 0;
        v15 = v12;
        v16 = v11;
        if (!v11 || !v12)
          goto LABEL_27;
        v17 = objc_msgSend(v11, "isEqual:", v12);

        if (!v17)
        {
          LOBYTE(v14) = 0;
LABEL_28:

          goto LABEL_14;
        }
      }
      objc_msgSend(v5, "pointerShape");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPointerStyle pointerShape](self, "pointerShape");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v19;
      v21 = v20;
      v15 = v21;
      if (v16 == v21)
      {

      }
      else
      {
        LOBYTE(v14) = 0;
        v22 = v21;
        v23 = v16;
        if (!v16 || !v21)
          goto LABEL_25;
        v14 = objc_msgSend(v16, "isEqual:", v21);

        if (!v14)
          goto LABEL_27;
      }
      if (v5[312] != self->_determineScaleAutomatically)
      {
        LOBYTE(v14) = 0;
        goto LABEL_27;
      }
      objc_msgSend(v5, "accessories");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPointerStyle accessories](self, "accessories");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = UIEqual(v23, v22);
LABEL_25:

LABEL_27:
      goto LABEL_28;
    }
    LOBYTE(v14) = 0;
  }
LABEL_15:

  return v14;
}

- (unint64_t)hash
{
  int64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _BOOL8 determineScaleAutomatically;
  void *v11;
  unint64_t v12;

  v3 = -[UIPointerStyle type](self, "type");
  v4 = -[UIPointerStyle options](self, "options") ^ v3;
  v5 = v4 ^ -[UIPointerStyle constrainedAxes](self, "constrainedAxes");
  -[UIPointerStyle pointerEffect](self, "pointerEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[UIPointerStyle pointerShape](self, "pointerShape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  determineScaleAutomatically = self->_determineScaleAutomatically;
  -[UIPointerStyle accessories](self, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9 ^ objc_msgSend(v11, "hash") ^ determineScaleAutomatically;

  return v12;
}

- (BOOL)_suppressesMirroring
{
  return self->_suppressesMirroring;
}

- (void)set_suppressesMirroring:(BOOL)a3
{
  self->_suppressesMirroring = a3;
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(NSArray *)accessories
{
  objc_setProperty_nonatomic_copy(self, a2, accessories, 320);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)constrainedAxes
{
  return self->_constrainedAxes;
}

- (void)setConstrainedAxes:(unint64_t)a3
{
  self->_constrainedAxes = a3;
}

- (UIPointerEffect)pointerEffect
{
  return self->_pointerEffect;
}

- (void)setPointerEffect:(id)a3
{
  objc_storeStrong((id *)&self->_pointerEffect, a3);
}

- (UIPointerShape)pointerShape
{
  return self->_pointerShape;
}

- (void)setPointerShape:(id)a3
{
  objc_storeStrong((id *)&self->_pointerShape, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerShape, 0);
  objc_storeStrong((id *)&self->_pointerEffect, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

@end
