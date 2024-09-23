@implementation WFCompactFileThumbnailViewController

- (WFCompactFileThumbnailViewController)initWithFileType:(id)a3 filename:(id)a4
{
  id v7;
  id v8;
  WFCompactFileThumbnailViewController *v9;
  WFCompactFileThumbnailViewController *v10;
  uint64_t v11;
  NSString *filename;
  WFCompactFileThumbnailViewController *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFCompactFileThumbnailViewController;
  v9 = -[WFCompactFileThumbnailViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileType, a3);
    v11 = objc_msgSend(v8, "copy");
    filename = v10->_filename;
    v10->_filename = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  WFCompactFileThumbnailViewController *v36;
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
  objc_super v61;
  _QWORD v62[12];

  v62[10] = *MEMORY[0x24BDAC8D0];
  v61.receiver = self;
  v61.super_class = (Class)WFCompactFileThumbnailViewController;
  -[WFCompactFileThumbnailViewController loadView](&v61, sel_loadView);
  -[WFCompactFileThumbnailViewController fileType](self, "fileType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentIcon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UIImage");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v60);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFCompactFileThumbnailViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  objc_msgSend(MEMORY[0x24BEBD640], "wf_disclosureImage");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v59);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFCompactFileThumbnailViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v7);

  v10 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[WFCompactFileThumbnailViewController filename](self, "filename");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v12);

  objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v10, "setTextAlignment:", 4);
  objc_msgSend(v10, "setNumberOfLines:", 5);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v13) = 1132068864;
  objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 0, v13);
  -[WFCompactFileThumbnailViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v10);

  v42 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v5, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactFileThumbnailViewController view](self, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintGreaterThanOrEqualToAnchor:constant:", v56, 12.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v55;
  objc_msgSend(v5, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactFileThumbnailViewController view](self, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:constant:", v52, -12.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v51;
  objc_msgSend(v5, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactFileThumbnailViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 16.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v46;
  v50 = v5;
  objc_msgSend(v5, "centerYAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v43;
  objc_msgSend(v10, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactFileThumbnailViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 12.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v37;
  objc_msgSend(v10, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactFileThumbnailViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, -12.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v32;
  objc_msgSend(v10, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 12.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v29;
  objc_msgSend(v7, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:constant:", v27, 20.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v62[7] = v26;
  v41 = v7;
  objc_msgSend(v7, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = self;
  -[WFCompactFileThumbnailViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -16.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62[8] = v18;
  objc_msgSend(v7, "centerYAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactFileThumbnailViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v62[9] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "activateConstraints:", v23);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD828]), "initWithDelegate:", v36);
  -[WFCompactFileThumbnailViewController view](v36, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addInteraction:", v24);

}

- (double)contentHeightForWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;

  -[WFCompactFileThumbnailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[WFCompactFileThumbnailViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", a3, *(double *)(MEMORY[0x24BEBE588] + 8));
  v7 = v6;

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFCompactFileThumbnailViewController;
  v4 = a3;
  -[WFCompactFileThumbnailViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[WFCompactFileThumbnailViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[WFCompactThumbnailViewController invalidateContentSize](self, "invalidateContentSize");
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc(MEMORY[0x24BEBDA30]);
  -[WFCompactFileThumbnailViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithView:", v6);

  objc_msgSend(MEMORY[0x24BEBD818], "effectWithPreview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD848], "styleWithEffect:shape:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (WFFileType)fileType
{
  return self->_fileType;
}

- (NSString)filename
{
  return self->_filename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
}

@end
