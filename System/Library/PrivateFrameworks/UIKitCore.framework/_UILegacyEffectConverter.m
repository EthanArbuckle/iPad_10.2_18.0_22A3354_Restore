@implementation _UILegacyEffectConverter

- (void)applyBackdropSettings:(id)a3 toEffectDescriptor:(id)a4 environment:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  id v27;
  double v28;
  uint64_t v29;
  void *v30;
  id v31;
  double v32;
  int v33;
  uint64_t *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  unsigned int v54;
  float v55;
  unsigned int v56;
  double v57;
  float v58;
  double v59;
  float v60;
  unsigned int v61;
  unsigned int v62;
  float v63;
  float v64;
  float v65;
  int v66;
  int v67;
  float v68;
  float v69;
  int v70;
  float v71;
  float v72;
  int v73;
  int v74;
  float v75;
  float v76;
  int v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  int v83;
  unint64_t v84;
  float v85;
  float v86;
  unint64_t v87;
  int v88;
  int v89;
  unint64_t v90;
  float v91;
  float v92;
  unint64_t v93;
  float v94;
  float v95;
  unint64_t v96;
  float v97;
  unint64_t v98;
  unint64_t v99;
  float v100;
  int v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  int v108;
  int v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  unint64_t v115;
  unsigned int v116;
  float v117;
  unsigned int v118;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "blurRadius");
  v11 = v10;
  objc_msgSend(v7, "scale");
  if (v11 > 0.0 || v12 > 0.0)
    _UIBlurEffectAddBlurFilterEntry(v8, v9, v11, v12);
  if (objc_msgSend(v7, "usesGrayscaleTintView"))
  {
    if ((objc_msgSend(v7, "lightenGrayscaleWithSourceOver") & 1) != 0
      || (objc_msgSend(v7, "grayscaleTintAlpha"), v13 > 0.0))
    {
      if (objc_msgSend(v7, "lightenGrayscaleWithSourceOver"))
      {
        v14 = *MEMORY[0x1E0CD2DE0];
        objc_msgSend(v7, "grayscaleTintLevel");
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "grayscaleTintAlpha");
      }
      else
      {
        v14 = *MEMORY[0x1E0CD2ED8];
        objc_msgSend(v7, "grayscaleTintLevel");
        v18 = v17;
        objc_msgSend(v7, "grayscaleTintAlpha");
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v18, v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 1.0;
      }
      v20 = +[_UIOverlayEffectViewEntry newEntryWithFilterType:color:alpha:](_UIOverlayEffectViewEntry, "newEntryWithFilterType:color:alpha:", v14, v15, v16);

      objc_msgSend(v8, "addOverlay:", v20);
    }
  }
  if (objc_msgSend(v7, "usesColorTintView"))
  {
    objc_msgSend(v7, "colorTint");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      objc_msgSend(v7, "colorTintAlpha");
      v24 = v23;

      if (v24 > 0.0)
      {
        v25 = *MEMORY[0x1E0CD2ED8];
        objc_msgSend(v7, "colorTint");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "colorTintAlpha");
        v27 = +[_UIOverlayEffectViewEntry newEntryWithFilterType:color:alpha:](_UIOverlayEffectViewEntry, "newEntryWithFilterType:color:alpha:", v25, v26);
        objc_msgSend(v8, "addOverlay:", v27);

      }
    }
  }
  if (objc_msgSend(v7, "usesColorBurnTintView"))
  {
    objc_msgSend(v7, "colorBurnTintAlpha");
    if (v28 > 0.0)
    {
      v29 = *MEMORY[0x1E0CD2BC0];
      objc_msgSend(v7, "colorBurnTintLevel");
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "colorBurnTintAlpha");
      v31 = +[_UIOverlayEffectViewEntry newEntryWithFilterType:color:alpha:](_UIOverlayEffectViewEntry, "newEntryWithFilterType:color:alpha:", v29, v30);
      objc_msgSend(v8, "addOverlay:", v31);

    }
  }
  if (objc_msgSend(v7, "usesDarkeningTintView"))
  {
    objc_msgSend(v7, "darkeningTintAlpha");
    if (v32 > 0.0)
    {
      v33 = objc_msgSend(v7, "darkenWithSourceOver");
      v34 = (uint64_t *)MEMORY[0x1E0CD2C30];
      if (!v33)
        v34 = (uint64_t *)MEMORY[0x1E0CD2C28];
      v35 = *v34;
      objc_msgSend(v7, "darkeningTintHue");
      v37 = v36;
      objc_msgSend(v7, "darkeningTintSaturation");
      v39 = v38;
      objc_msgSend(v7, "darkeningTintBrightness");
      +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v37, v39, v40, 1.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "darkeningTintAlpha");
      v42 = +[_UIOverlayEffectViewEntry newEntryWithFilterType:color:alpha:](_UIOverlayEffectViewEntry, "newEntryWithFilterType:color:alpha:", v35, v41);
      objc_msgSend(v8, "addOverlay:", v42);

    }
  }
  objc_msgSend(v7, "saturationDeltaFactor");
  if (v43 != 1.0)
  {
    objc_msgSend(v7, "saturationDeltaFactor");
    +[UIColorEffect colorEffectSaturate:](UIColorEffect, "colorEffectSaturate:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_filterEntry");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addFilterEntry:", v45);

  }
  objc_msgSend(v7, "colorOffsetMatrix");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v7, "colorOffsetMatrix");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47)
    {
      objc_msgSend(v47, "CAColorMatrixValue");
      v83 = v101;
      v85 = v102;
      v49 = v104;
      v50 = v105;
      v51 = v106;
      v91 = v107;
      v92 = v100;
      v86 = v103;
      v88 = v108;
      v89 = v109;
      v52 = v112;
      v94 = v110;
      v95 = v111;
      v53 = v114;
      v97 = v113;
      v98 = v115;
      v54 = v116;
      v55 = v117;
      v56 = v118;
    }
    else
    {
      v56 = 0;
      v55 = 0.0;
      v54 = 0;
      v98 = 0;
      v53 = 0.0;
      v95 = 0.0;
      v97 = 0.0;
      v52 = 0.0;
      v92 = 0.0;
      v94 = 0.0;
      v88 = 0;
      v89 = 0;
      v91 = 0.0;
      v51 = 0.0;
      v50 = 0.0;
      v49 = 0.0;
      v85 = 0.0;
      v86 = 0.0;
      v83 = 0;
    }

    v60 = v91;
    v58 = v92;
    v61 = HIDWORD(v98);
    v62 = v98;
    v64 = v95;
    v63 = v97;
    v65 = v94;
    v67 = v88;
    v66 = v89;
    v69 = v85;
    v68 = v86;
    v70 = v83;
  }
  else
  {
    objc_msgSend(v7, "colorOffsetAlpha");
    v58 = v57 * 0.8 + 1.0 - v57;
    v59 = (1.0 - v57) * 0.0;
    v49 = v59 - v57 * 0.5;
    v53 = v57 * 0.5 + v59;
    v50 = v57 * 0.9 + v59;
    v51 = v57 + 1.0 - v57;
    v60 = v57 * 0.1 + v59;
    v52 = v57 * 0.5 + 1.0 - v57;
    v56 = 0;
    v55 = 1.0;
    v54 = 0;
    v61 = 0;
    v62 = 0;
    v63 = v53;
    v64 = v53;
    v65 = v53;
    v66 = 0;
    v67 = 0;
    v68 = v53;
    v69 = v49;
    v70 = 0;
  }
  v96 = __PAIR64__(LODWORD(v63), LODWORD(v64));
  v84 = __PAIR64__(LODWORD(v50), LODWORD(v51));
  v99 = __PAIR64__(v61, v62);
  v87 = __PAIR64__(LODWORD(v53), LODWORD(v52));
  v100 = v58;
  v90 = __PAIR64__(v56, v54);
  v93 = __PAIR64__(LODWORD(v65), LODWORD(v55));
  v101 = v70;
  v102 = v69;
  v103 = v68;
  v104 = v49;
  v105 = v50;
  v106 = v51;
  v107 = v60;
  v108 = v67;
  v109 = v66;
  v110 = v65;
  v111 = v64;
  v112 = v52;
  v113 = v63;
  v114 = v53;
  v115 = __PAIR64__(v61, v62);
  v116 = v54;
  v117 = v55;
  v118 = v56;
  v71 = v58;
  v72 = v60;
  v73 = v66;
  v74 = v67;
  v75 = v68;
  v76 = v69;
  v77 = v70;
  if (!_UICAColorMatrixIsIdentity(&v100))
  {
    v100 = v71;
    v101 = v77;
    v102 = v76;
    v103 = v75;
    v104 = v49;
    v105 = *((float *)&v84 + 1);
    v106 = *(float *)&v84;
    v107 = v72;
    v108 = v74;
    v109 = v73;
    v110 = *((float *)&v93 + 1);
    v111 = *(float *)&v96;
    v112 = *(float *)&v87;
    v113 = *((float *)&v96 + 1);
    v114 = *((float *)&v87 + 1);
    v115 = v99;
    v116 = v90;
    v117 = *(float *)&v93;
    v118 = HIDWORD(v90);
    +[UIColorEffect _colorEffectCAMatrix:](UIColorEffect, "_colorEffectCAMatrix:", &v100);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "_filterEntry");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addFilterEntry:", v79);

  }
  objc_msgSend(v7, "zoom", v84, v87, v90, v93, v96, v99);
  if (v80 > 0.0)
  {
    objc_msgSend(v7, "zoom");
    +[_UIZoomEffect zoomEffectWithMagnitude:](_UIZoomEffect, "zoomEffectWithMagnitude:");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "_viewEntry");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addViewEffect:", v82);

  }
}

+ (id)sharedConverter
{
  if (qword_1ECD7CC48 != -1)
    dispatch_once(&qword_1ECD7CC48, &__block_literal_global_42);
  return (id)_MergedGlobals_953;
}

- (void)applyVibrancyConfig:(id)a3 toEffectDescriptor:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "contentConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      objc_msgSend(v8, "setTextShouldRenderWithTintColor:", 1);
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke;
    v17[3] = &unk_1E16B53F0;
    v18 = v8;
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_2;
    v15[3] = &unk_1E16B5418;
    v16 = v18;
    _UILegacyEffectConvertLayerConfig(v9, v17, v15);

  }
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_3;
  v12[3] = &unk_1E16B5468;
  v13 = v8;
  v14 = a2;
  v12[4] = self;
  v11 = v8;
  objc_msgSend(v7, "enumerateLayerConfigs:", v12);

}

- (id)backdropSettingsForBlurStyle:(int64_t)a3
{
  return (id)objc_opt_new();
}

- (id)vibrancyConfigForHighQualityVibrancyStyle:(int64_t)a3
{
  return (id)objc_opt_new();
}

- (id)vibrancyConfigForLowQualityVibrancyStyle:(int64_t)a3
{
  return (id)objc_opt_new();
}

- (id)vibrancyConfigForReducedTransperancyVibrancyStyle:(int64_t)a3
{
  return (id)objc_opt_new();
}

@end
