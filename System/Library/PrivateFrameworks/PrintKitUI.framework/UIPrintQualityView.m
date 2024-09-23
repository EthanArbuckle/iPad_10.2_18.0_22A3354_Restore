@implementation UIPrintQualityView

- (UIPrintQualityView)initWithFrame:(CGRect)a3 printInfo:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UIPrintQualityView *v10;
  UIPrintQualityView *v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIPrintQualityView;
  v10 = -[UIPrintQualityView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[UIPrintQualityView setPrintInfo:](v10, "setPrintInfo:", v9);
    -[UIPrintQualityView loadViews](v11, "loadViews");
    -[UIPrintQualityView printInfo](v11, "printInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:forKeyPath:options:context:", v11, 0x1E9D98878, 0, 0);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIPrintQualityView printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98878);

  v4.receiver = self;
  v4.super_class = (Class)UIPrintQualityView;
  -[UIPrintQualityView dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__UIPrintQualityView_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __69__UIPrintQualityView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFromPrintInfo");
}

- (void)loadViews
{
  UIPrintSegmentedSlider *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[9];

  v73[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(UIPrintSegmentedSlider);
  -[UIPrintQualityView setQualitySlider:](self, "setQualitySlider:", v3);

  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 3.0;
  objc_msgSend(v4, "setMinimumValue:", v5);

  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 5.0;
  objc_msgSend(v6, "setMaximumValue:", v7);

  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSegmented:", 1);

  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSnapsToSegment:", 1);

  -[UIPrintQualityView printInfo](self, "printInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (float)objc_msgSend(v10, "quality");
  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = v11;
  objc_msgSend(v12, "setValue:", v13);

  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_changeQuality_, 4096);

  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView addSubview:](self, "addSubview:", v16);

  v17 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[UIPrintQualityView setDraftLabel:](self, "setDraftLabel:", v17);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Draft"), CFSTR("Draft"), CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView draftLabel](self, "draftLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v19);

  -[UIPrintQualityView draftLabel](self, "draftLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeToFit");

  -[UIPrintQualityView draftLabel](self, "draftLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIPrintQualityView draftLabel](self, "draftLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView addSubview:](self, "addSubview:", v23);

  v24 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[UIPrintQualityView setNormalLabel:](self, "setNormalLabel:", v24);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Normal"), CFSTR("Normal"), CFSTR("Localizable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView normalLabel](self, "normalLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setText:", v26);

  -[UIPrintQualityView normalLabel](self, "normalLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sizeToFit");

  -[UIPrintQualityView normalLabel](self, "normalLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIPrintQualityView normalLabel](self, "normalLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView addSubview:](self, "addSubview:", v30);

  v31 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[UIPrintQualityView setBestLabel:](self, "setBestLabel:", v31);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Best"), CFSTR("Best"), CFSTR("Localizable"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView bestLabel](self, "bestLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setText:", v33);

  -[UIPrintQualityView bestLabel](self, "bestLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sizeToFit");

  -[UIPrintQualityView bestLabel](self, "bestLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIPrintQualityView bestLabel](self, "bestLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView addSubview:](self, "addSubview:", v37);

  v38 = (void *)MEMORY[0x1E0CB3718];
  v63 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v70, 5, 0, self, 5, 1.0, 20.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v69;
  v39 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 6, 0, v68, 6, 1.0, 20.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v67;
  v40 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintQualityView draftLabel](self, "draftLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v66, 5, 0, v65, 5, 1.0, 0.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v64;
  v41 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintQualityView normalLabel](self, "normalLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v62, 9, 0, v61, 9, 1.0, 0.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v73[3] = v60;
  v42 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintQualityView normalLabel](self, "normalLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView draftLabel](self, "draftLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v59, 12, 0, v43, 12, 1.0, 0.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v73[4] = v44;
  v45 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintQualityView bestLabel](self, "bestLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v46, 6, 0, v47, 6, 1.0, 0.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v73[5] = v48;
  v49 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintQualityView bestLabel](self, "bestLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView draftLabel](self, "draftLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 12, 0, v51, 12, 1.0, 0.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v73[6] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 7);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "activateConstraints:", v53);

  v54 = (void *)MEMORY[0x1E0CB3718];
  v71[0] = CFSTR("qualitySlider");
  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = CFSTR("draftLabel");
  v72[0] = v55;
  -[UIPrintQualityView draftLabel](self, "draftLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v56;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[qualitySlider]-[draftLabel]-|"), 0, 0, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityView addConstraints:](self, "addConstraints:", v58);

}

- (void)changeQuality:(id)a3
{
  float v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "value");
  v5 = (uint64_t)v4;
  -[UIPrintQualityView printInfo](self, "printInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQuality:", v5);

}

- (void)updateFromPrintInfo
{
  float v3;
  void *v4;
  double v5;
  id v6;

  -[UIPrintQualityView printInfo](self, "printInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (float)objc_msgSend(v6, "quality");
  -[UIPrintQualityView qualitySlider](self, "qualitySlider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = v3;
  objc_msgSend(v4, "setValue:", v5);

}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
  objc_storeStrong((id *)&self->_printInfo, a3);
}

- (UIPrintSegmentedSlider)qualitySlider
{
  return self->_qualitySlider;
}

- (void)setQualitySlider:(id)a3
{
  objc_storeStrong((id *)&self->_qualitySlider, a3);
}

- (UILabel)draftLabel
{
  return self->_draftLabel;
}

- (void)setDraftLabel:(id)a3
{
  objc_storeStrong((id *)&self->_draftLabel, a3);
}

- (UILabel)normalLabel
{
  return self->_normalLabel;
}

- (void)setNormalLabel:(id)a3
{
  objc_storeStrong((id *)&self->_normalLabel, a3);
}

- (UILabel)bestLabel
{
  return self->_bestLabel;
}

- (void)setBestLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bestLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestLabel, 0);
  objc_storeStrong((id *)&self->_normalLabel, 0);
  objc_storeStrong((id *)&self->_draftLabel, 0);
  objc_storeStrong((id *)&self->_qualitySlider, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
}

@end
