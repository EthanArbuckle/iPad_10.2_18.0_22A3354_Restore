@implementation PSPhotosTCCGridCell

- (PSPhotosTCCGridCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void (*PXTCCSettingsGridTitleSymbolLoc)(void);
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void (*PXTCCSettingsGridSubtitleSymbolLoc)(void);
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  PSPhotosTCCGridCell *v39;
  void *v40;
  objc_super v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];
  __int128 v47;
  Class (*v48)(uint64_t);
  void *v49;
  uint64_t *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)PSPhotosTCCGridCell;
  v37 = a4;
  v38 = a5;
  v39 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v41, sel_initWithStyle_reuseIdentifier_specifier_, a3, v37);
  if (v39)
  {
    -[PSPhotosTCCGridCell contentView](v39, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSPhotosTCCGridCell setTranslatesAutoresizingMaskIntoConstraints:](v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "setAxis:", 1);
    objc_msgSend(v40, "addSubview:", v7);
    v32 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 16.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v34;
    objc_msgSend(v7, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v8, 16.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v9;
    objc_msgSend(v40, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 16.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v12;
    objc_msgSend(v40, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 12.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v16);

    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v17 = (void *)getPXTCCPhotoGridViewClass_softClass;
    v45 = getPXTCCPhotoGridViewClass_softClass;
    if (!getPXTCCPhotoGridViewClass_softClass)
    {
      *(_QWORD *)&v47 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v47 + 1) = 3221225472;
      v48 = __getPXTCCPhotoGridViewClass_block_invoke;
      v49 = &unk_1E4A65650;
      v50 = &v42;
      __getPXTCCPhotoGridViewClass_block_invoke((uint64_t)&v47);
      v17 = (void *)v43[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v42, 8);
    if (v18)
    {
      objc_msgSend(v18, "photoGridViewForSettings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "layer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setCornerRadius:", 6.0);

        objc_msgSend(v20, "setClipsToBounds:", 1);
        objc_msgSend(v7, "addArrangedSubview:", v20);
        objc_msgSend(v7, "setCustomSpacing:afterView:", v20, 12.0);
      }

    }
    v22 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFont:", v23);

    objc_msgSend(v22, "setNumberOfLines:", 0);
    if (!PhotosUICoreLibraryCore_frameworkLibrary)
    {
      v47 = xmmword_1E4A66178;
      v48 = 0;
      PhotosUICoreLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (PhotosUICoreLibraryCore_frameworkLibrary && getPXTCCSettingsGridTitleSymbolLoc())
    {
      PXTCCSettingsGridTitleSymbolLoc = (void (*)(void))getPXTCCSettingsGridTitleSymbolLoc();
      if (!PXTCCSettingsGridTitleSymbolLoc)
        goto LABEL_22;
      PXTCCSettingsGridTitleSymbolLoc();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v25);

    }
    objc_msgSend(v7, "addArrangedSubview:", v22);
    objc_msgSend(v7, "setCustomSpacing:afterView:", v22, 2.0);
    v26 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v27);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v28);

    objc_msgSend(v26, "setNumberOfLines:", 0);
    if (!PhotosUICoreLibraryCore_frameworkLibrary)
    {
      v47 = xmmword_1E4A66178;
      v48 = 0;
      PhotosUICoreLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (!PhotosUICoreLibraryCore_frameworkLibrary || !getPXTCCSettingsGridSubtitleSymbolLoc())
      goto LABEL_20;
    PXTCCSettingsGridSubtitleSymbolLoc = (void (*)(void))getPXTCCSettingsGridSubtitleSymbolLoc();
    if (PXTCCSettingsGridSubtitleSymbolLoc)
    {
      PXTCCSettingsGridSubtitleSymbolLoc();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v30);

LABEL_20:
      objc_msgSend(v7, "addArrangedSubview:", v26);

      goto LABEL_21;
    }
LABEL_22:
    PSPNCreateFormattedStringWithCountry_cold_1();
    __break(1u);
  }
LABEL_21:

  return v39;
}

@end
