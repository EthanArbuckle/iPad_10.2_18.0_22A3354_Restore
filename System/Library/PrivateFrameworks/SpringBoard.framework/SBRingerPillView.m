@implementation SBRingerPillView

- (SBRingerPillView)initWithActivatedForPreviewing:(BOOL)a3
{
  _BOOL4 v3;
  SBRingerPillView *v4;
  SBRingerPillView *v5;
  uint64_t v6;
  uint64_t v7;
  MTShadowView *shadowView;
  uint64_t v9;
  MTMaterialView *materialView;
  uint64_t v11;
  MTVisualStylingProvider *stylingProvider;
  id v13;
  void *v14;
  uint64_t v15;
  BSUICAPackageView *glyphView;
  SBRingerPillView *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSArray *glyphTintBackgroundLayers;
  uint64_t v29;
  NSArray *glyphTintShapeLayers;
  void *v31;
  UILabel *v32;
  UILabel *silentModeLabel;
  UILabel *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  UILabel *v38;
  void *v39;
  void *v40;
  UILabel *v41;
  UILabel *ringerLabel;
  UILabel *v43;
  void *v44;
  void *v45;
  UILabel *v46;
  void *v47;
  void *v48;
  UILabel *v49;
  UILabel *onLabel;
  UILabel *v51;
  void *v52;
  void *v53;
  UILabel *v54;
  void *v55;
  UILabel *v56;
  void *v57;
  void *v58;
  UILabel *v59;
  UILabel *offLabel;
  UILabel *v61;
  void *v62;
  void *v63;
  UILabel *v64;
  void *v65;
  UILabel *v66;
  void *v67;
  void *v68;
  SBRingerVolumeSliderView *v69;
  SBRingerVolumeSliderView *slider;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  objc_super v80;
  _BYTE v81[128];
  uint64_t v82;

  v3 = a3;
  v82 = *MEMORY[0x1E0C80C00];
  v80.receiver = self;
  v80.super_class = (Class)SBRingerPillView;
  v4 = -[SBRingerPillView init](&v80, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_activatedForPreviewing = v3;
    if (v3)
      v6 = 2;
    else
      v6 = 0;
    -[SBRingerPillView setOverrideUserInterfaceStyle:](v4, "setOverrideUserInterfaceStyle:", v6);
    v77 = 1065353216;
    v78 = xmmword_1D0E884D0;
    v79 = 0x4039000000000000;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D474A0]), "initWithShadowAttributes:maskCornerRadius:", &v77, 25.0);
    shadowView = v5->_shadowView;
    v5->_shadowView = (MTShadowView *)v7;

    -[SBRingerPillView addSubview:](v5, "addSubview:", v5->_shadowView);
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:", 54, 8);
    v9 = objc_claimAutoreleasedReturnValue();
    materialView = v5->_materialView;
    v5->_materialView = (MTMaterialView *)v9;

    -[MTMaterialView _setContinuousCornerRadius:](v5->_materialView, "_setContinuousCornerRadius:", 25.0);
    -[SBRingerPillView addSubview:](v5, "addSubview:", v5->_materialView);
    -[MTMaterialView visualStylingProviderForCategory:](v5->_materialView, "visualStylingProviderForCategory:", 2);
    v11 = objc_claimAutoreleasedReturnValue();
    stylingProvider = v5->_stylingProvider;
    v5->_stylingProvider = (MTVisualStylingProvider *)v11;

    v13 = objc_alloc(MEMORY[0x1E0D01910]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithPackageName:inBundle:", CFSTR("Mute"), v14);
    glyphView = v5->_glyphView;
    v5->_glyphView = (BSUICAPackageView *)v15;

    -[SBRingerPillView addSubview:](v5, "addSubview:", v5->_glyphView);
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v17 = v5;
    -[BSUICAPackageView publishedObjectNames](v5->_glyphView, "publishedObjectNames");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    if (!v19)
    {
      v72 = 0;
      v21 = 0;
      goto LABEL_26;
    }
    v20 = v19;
    v72 = 0;
    v21 = 0;
    v22 = *(_QWORD *)v74;
    while (1)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v74 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        if (objc_msgSend(v24, "hasSuffix:", CFSTR("-tint-shape")))
        {
          -[BSUICAPackageView publishedObjectWithName:](v17->_glyphView, "publishedObjectWithName:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v26 = v21;
            if (!v21)
              v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v21 = v26;
LABEL_20:
            objc_msgSend(v26, "addObject:", v25);
          }
        }
        else
        {
          if (!objc_msgSend(v24, "hasSuffix:", CFSTR("-tint-bg")))
            continue;
          -[BSUICAPackageView publishedObjectWithName:](v17->_glyphView, "publishedObjectWithName:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v26 = v72;
            if (!v72)
              v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v72 = v26;
            goto LABEL_20;
          }
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      if (!v20)
      {
LABEL_26:

        v27 = objc_msgSend(v72, "copy");
        v5 = v17;
        glyphTintBackgroundLayers = v17->_glyphTintBackgroundLayers;
        v17->_glyphTintBackgroundLayers = (NSArray *)v27;

        v29 = objc_msgSend(v21, "copy");
        glyphTintShapeLayers = v17->_glyphTintShapeLayers;
        v17->_glyphTintShapeLayers = (NSArray *)v29;

        -[SBRingerPillView _titleLabelColor](v17, "_titleLabelColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
        silentModeLabel = v5->_silentModeLabel;
        v5->_silentModeLabel = v32;

        v34 = v5->_silentModeLabel;
        objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = *MEMORY[0x1E0CEB558];
        objc_msgSend(v35, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB558], 4);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v34, "setFont:", v37);

        -[UILabel setTextColor:](v5->_silentModeLabel, "setTextColor:", v31);
        v38 = v5->_silentModeLabel;
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("RINGER_SILENT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](v38, "setText:", v40);

        -[SBRingerPillView addSubview:](v5, "addSubview:", v5->_silentModeLabel);
        v41 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
        ringerLabel = v5->_ringerLabel;
        v5->_ringerLabel = v41;

        v43 = v5->_ringerLabel;
        objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "preferredFontForTextStyle:hiFontStyle:", v36, 4);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v43, "setFont:", v45);

        -[UILabel setTextColor:](v5->_ringerLabel, "setTextColor:", v31);
        v46 = v5->_ringerLabel;
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("RINGER_VOLUME"), &stru_1E8EC7EC0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](v46, "setText:", v48);

        -[SBRingerPillView addSubview:](v5, "addSubview:", v5->_ringerLabel);
        v49 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
        onLabel = v5->_onLabel;
        v5->_onLabel = v49;

        v51 = v5->_onLabel;
        objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "preferredFontForTextStyle:hiFontStyle:", v36, 4);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v51, "setFont:", v53);

        v54 = v5->_onLabel;
        -[SBRingerPillView _subtitleLabelColor](v5, "_subtitleLabelColor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v54, "setTextColor:", v55);

        v56 = v5->_onLabel;
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("RINGER_ON"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](v56, "setText:", v58);

        -[SBRingerPillView addSubview:](v5, "addSubview:", v5->_onLabel);
        v59 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
        offLabel = v5->_offLabel;
        v5->_offLabel = v59;

        v61 = v5->_offLabel;
        objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "preferredFontForTextStyle:hiFontStyle:", v36, 4);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v61, "setFont:", v63);

        v64 = v5->_offLabel;
        -[SBRingerPillView _subtitleLabelColor](v5, "_subtitleLabelColor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v64, "setTextColor:", v65);

        v66 = v5->_offLabel;
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("RINGER_OFF"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](v66, "setText:", v68);

        -[SBRingerPillView addSubview:](v5, "addSubview:", v5->_offLabel);
        v69 = objc_alloc_init(SBRingerVolumeSliderView);
        slider = v5->_slider;
        v5->_slider = v69;

        -[SBRingerVolumeSliderView setValue:](v5->_slider, "setValue:", 0.7);
        -[SBRingerPillView addSubview:](v5, "addSubview:", v5->_slider);

        return v5;
      }
    }
  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  UILabel *ringerLabel;
  UILabel *onLabel;
  UILabel *offLabel;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  _BYTE v23[128];
  uint64_t v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v24 = *MEMORY[0x1E0C80C00];
  ringerLabel = self->_ringerLabel;
  v22[0] = self->_silentModeLabel;
  v22[1] = ringerLabel;
  onLabel = self->_onLabel;
  offLabel = self->_offLabel;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22[2] = onLabel;
  v22[3] = offLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "sizeThatFits:", width, height);
        if (v14 >= v12)
          v12 = v14;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
    v15 = v12 + 100.0;
  }
  else
  {
    v15 = 100.0;
  }

  v16 = fmax(v15, 196.0);
  v17 = 50.0;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  UILabel *ringerLabel;
  UILabel *offLabel;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
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
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
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
  MTShadowView *shadowView;
  void *v54;
  UILabel *v55;
  UILabel *silentModeLabel;
  UILabel *onLabel;
  UILabel *v58;
  SBRingerVolumeSliderView *slider;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  double v70;
  const __CFString *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
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
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  objc_super v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _QWORD v107[6];
  _QWORD v108[4];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v104.receiver = self;
  v104.super_class = (Class)SBRingerPillView;
  -[SBRingerPillView layoutSubviews](&v104, sel_layoutSubviews);
  -[SBRingerPillView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  UIRectGetCenter();
  -[SBRingerPillView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  ringerLabel = self->_ringerLabel;
  v108[0] = self->_silentModeLabel;
  v108[1] = ringerLabel;
  offLabel = self->_offLabel;
  v108[2] = self->_onLabel;
  v108[3] = offLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v101;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v101 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * i), "sizeToFit");
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
    }
    while (v16);
  }

  -[SBRingerVolumeSliderView setSize:](self->_slider, "setSize:", v8 + -100.0 + 2.0, 5.0);
  -[BSUICAPackageView setSize:](self->_glyphView, "setSize:", 35.0, 35.0);
  v90 = v6;
  v91 = v4;
  v88 = v10;
  v89 = v8;
  switch(self->_state)
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v19 = objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("silent");
      v70 = 0.25;
      break;
    case 2uLL:
      -[SBRingerPillView _titleLabelColor](self, "_titleLabelColor");
      v19 = objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("ringer");
      v70 = 0.2155;
      break;
    case 3uLL:
      -[SBRingerPillView _titleLabelColor](self, "_titleLabelColor");
      v19 = objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("ringer");
      v20 = 0.2155;
      goto LABEL_15;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v19 = objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("silent");
      v20 = 0.25;
LABEL_15:
      v70 = v20;
      break;
    default:
      v19 = 0;
      v71 = 0;
      v70 = 0.0;
      break;
  }
  -[UILabel frame](self->_silentModeLabel, "frame");
  UIRectCenteredAboutPointScale();
  v86 = v22;
  v87 = v21;
  v84 = v24;
  v85 = v23;
  -[UILabel frame](self->_ringerLabel, "frame");
  UIRectCenteredAboutPointScale();
  v82 = v26;
  v83 = v25;
  v80 = v28;
  v81 = v27;
  -[UILabel frame](self->_onLabel, "frame");
  UIRectCenteredAboutPointScale();
  v78 = v30;
  v79 = v29;
  v76 = v32;
  v77 = v31;
  -[UILabel frame](self->_offLabel, "frame");
  UIRectCenteredAboutPointScale();
  v74 = v34;
  v75 = v33;
  v72 = v36;
  v73 = v35;
  -[SBRingerVolumeSliderView frame](self->_slider, "frame");
  UIRectCenteredAboutPointScale();
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  -[BSUICAPackageView frame](self->_glyphView, "frame");
  UIRectCenteredAboutPointScale();
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;
  -[UILabel setFrame:](self->_silentModeLabel, "setFrame:", v87, v86, v85, v84);
  -[UILabel setFrame:](self->_ringerLabel, "setFrame:", v83, v82, v81, v80);
  -[UILabel setFrame:](self->_onLabel, "setFrame:", v79, v78, v77, v76);
  -[UILabel setFrame:](self->_offLabel, "setFrame:", v75, v74, v73, v72);
  -[SBRingerVolumeSliderView setFrame:](self->_slider, "setFrame:", v38, v40, v42, v44);
  -[BSUICAPackageView setFrame:](self->_glyphView, "setFrame:", v46, v48, v50, v52);
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", v91, v90, v89, v88);
  shadowView = self->_shadowView;
  -[MTShadowView frameWithContentWithFrame:](shadowView, "frameWithContentWithFrame:", v91, v90, v89, v88);
  -[MTShadowView setFrame:](shadowView, "setFrame:");
  v54 = (void *)v19;
  -[SBRingerPillView _setGlyphTintColor:animationDuration:](self, "_setGlyphTintColor:animationDuration:", v19, v70);
  -[BSUICAPackageView setState:](self->_glyphView, "setState:", v71);
  v55 = self->_ringerLabel;
  silentModeLabel = self->_silentModeLabel;
  v107[0] = self->_glyphView;
  v107[1] = v55;
  onLabel = self->_onLabel;
  v58 = self->_offLabel;
  v107[2] = silentModeLabel;
  v107[3] = onLabel;
  slider = self->_slider;
  v107[4] = v58;
  v107[5] = slider;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 6);
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v60 = (id)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v97;
    do
    {
      for (j = 0; j != v62; ++j)
      {
        if (*(_QWORD *)v97 != v63)
          objc_enumerationMutation(v60);
        objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * j), "setAlpha:", 0.0);
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
    }
    while (v62);
  }

  -[SBRingerPillView _visibleViewsForState:](self, "_visibleViewsForState:", self->_state);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v93;
    do
    {
      for (k = 0; k != v67; ++k)
      {
        if (*(_QWORD *)v93 != v68)
          objc_enumerationMutation(v65);
        objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * k), "setAlpha:", 1.0);
      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
    }
    while (v67);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  UIColor *glyphTintColor;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBRingerPillView;
  -[SBRingerPillView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  glyphTintColor = self->_glyphTintColor;
  if (glyphTintColor)
  {
    -[SBRingerPillView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColor resolvedColorWithTraitCollection:](glyphTintColor, "resolvedColorWithTraitCollection:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRingerPillView _updateGlyphWithStaticColor:animationSettings:](self, "_updateGlyphWithStaticColor:animationSettings:", v6, v7);

  }
}

- (id)_visibleViewsForState:(unint64_t)a3
{
  int *v3;
  UILabel **p_offLabel;
  id result;
  BSUICAPackageView *glyphView;
  UILabel *v7;
  UILabel *ringerLabel;
  UILabel *offLabel;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1uLL:
      v10[0] = self->_onLabel;
      v3 = &OBJC_IVAR___SBRingerPillView__silentModeLabel;
      p_offLabel = (UILabel **)v10;
      goto LABEL_7;
    case 2uLL:
      offLabel = self->_offLabel;
      v3 = &OBJC_IVAR___SBRingerPillView__silentModeLabel;
      p_offLabel = &offLabel;
      goto LABEL_7;
    case 3uLL:
      ringerLabel = self->_ringerLabel;
      v3 = &OBJC_IVAR___SBRingerPillView__slider;
      p_offLabel = &ringerLabel;
      goto LABEL_7;
    case 4uLL:
      v7 = self->_ringerLabel;
      v3 = &OBJC_IVAR___SBRingerPillView__slider;
      p_offLabel = &v7;
LABEL_7:
      glyphView = self->_glyphView;
      p_offLabel[1] = *(UILabel **)((char *)&self->super.super.super.isa + *v3);
      p_offLabel[2] = (UILabel *)glyphView;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[SBRingerPillView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSliderValue:(float)a3
{
  -[SBRingerVolumeSliderView setValue:](self->_slider, "setValue:", a3);
}

- (void)setSliderValue:(double)a3 animated:(BOOL)a4
{
  -[SBRingerVolumeSliderView setValue:animated:](self->_slider, "setValue:animated:", a4, a3);
}

- (void)_setGlyphTintColor:(id)a3 animationDuration:(double)a4
{
  UIColor *v7;
  UIColor *glyphTintColor;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  UIColor *v13;
  void *v14;
  void *v15;
  UIColor *v16;

  v7 = (UIColor *)a3;
  glyphTintColor = self->_glyphTintColor;
  if (glyphTintColor != v7)
  {
    v16 = v7;
    v9 = -[UIColor isEqual:](glyphTintColor, "isEqual:", v7);
    v7 = v16;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_glyphTintColor, a3);
      v10 = (void *)MEMORY[0x1E0D016B0];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "settingsWithDuration:timingFunction:", v11, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = self->_glyphTintColor;
      -[SBRingerPillView traitCollection](self, "traitCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIColor resolvedColorWithTraitCollection:](v13, "resolvedColorWithTraitCollection:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRingerPillView _updateGlyphWithStaticColor:animationSettings:](self, "_updateGlyphWithStaticColor:animationSettings:", v15, v12);

      v7 = v16;
    }
  }

}

- (void)_updateGlyphWithStaticColor:(id)a3 animationSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  SBRingerPillView *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v30 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v29 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v29, "CGColor");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = self;
  v12 = self->_glyphTintShapeLayers;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v8, "_basicAnimationForView:withKeyPath:", 0, CFSTR("fillColor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "setToValue:", v9);
          objc_msgSend(v17, "addAnimation:forKey:", v19, v11);
        }
        objc_msgSend(v17, "setFillColor:", v9);

      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v14);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = v28->_glyphTintBackgroundLayers;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v8, "_basicAnimationForView:withKeyPath:", 0, CFSTR("backgroundColor"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          objc_msgSend(v26, "setToValue:", v9);
          objc_msgSend(v25, "addAnimation:forKey:", v27, v11);
        }
        objc_msgSend(v25, "setBackgroundColor:", v9);

      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v22);
  }

}

- (id)_titleLabelColor
{
  if (self->_activatedForPreviewing)
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_subtitleLabelColor
{
  if (self->_activatedForPreviewing)
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)state
{
  return self->_state;
}

- (float)sliderValue
{
  return self->_sliderValue;
}

- (MTShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_materialView, a3);
}

- (MTVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (void)setStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_stylingProvider, a3);
}

- (BSUICAPackageView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphView, a3);
}

- (UILabel)silentModeLabel
{
  return self->_silentModeLabel;
}

- (void)setSilentModeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_silentModeLabel, a3);
}

- (UILabel)ringerLabel
{
  return self->_ringerLabel;
}

- (void)setRingerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_ringerLabel, a3);
}

- (UILabel)onLabel
{
  return self->_onLabel;
}

- (void)setOnLabel:(id)a3
{
  objc_storeStrong((id *)&self->_onLabel, a3);
}

- (UILabel)offLabel
{
  return self->_offLabel;
}

- (void)setOffLabel:(id)a3
{
  objc_storeStrong((id *)&self->_offLabel, a3);
}

- (SBRingerVolumeSliderView)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (UIColor)glyphTintColor
{
  return self->_glyphTintColor;
}

- (void)setGlyphTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_glyphTintColor, a3);
}

- (NSArray)glyphTintBackgroundLayers
{
  return self->_glyphTintBackgroundLayers;
}

- (void)setGlyphTintBackgroundLayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (NSArray)glyphTintShapeLayers
{
  return self->_glyphTintShapeLayers;
}

- (void)setGlyphTintShapeLayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (BOOL)isActivatedForPreviewing
{
  return self->_activatedForPreviewing;
}

- (void)setActivatedForPreviewing:(BOOL)a3
{
  self->_activatedForPreviewing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphTintShapeLayers, 0);
  objc_storeStrong((id *)&self->_glyphTintBackgroundLayers, 0);
  objc_storeStrong((id *)&self->_glyphTintColor, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_offLabel, 0);
  objc_storeStrong((id *)&self->_onLabel, 0);
  objc_storeStrong((id *)&self->_ringerLabel, 0);
  objc_storeStrong((id *)&self->_silentModeLabel, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end
