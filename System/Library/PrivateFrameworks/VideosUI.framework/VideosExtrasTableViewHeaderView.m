@implementation VideosExtrasTableViewHeaderView

- (VideosExtrasTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  VideosExtrasTableViewHeaderView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)VideosExtrasTableViewHeaderView;
  v3 = -[VideosExtrasTableViewHeaderView initWithReuseIdentifier:](&v35, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[VideosExtrasTableViewHeaderView frame](v3, "frame");
    v5 = (void *)objc_msgSend(v4, "initWithFrame:");
    -[VideosExtrasTableViewHeaderView setBackgroundView:](v3, "setBackgroundView:", v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__dynamicTypeDidChange, *MEMORY[0x1E0DC48E8], 0);

    -[VideosExtrasTableViewHeaderView textLabel](v3, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initForAutolayout");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    -[VideosExtrasTableViewHeaderView contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v8);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initForAutolayout");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v12);

    -[VideosExtrasTableViewHeaderView contentView](v3, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v11);

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = (void *)MEMORY[0x1E0CB3718];
    -[VideosExtrasTableViewHeaderView contentView](v3, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0DC49E8];
    v18 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v19 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v20 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    objc_msgSend(v15, "constraintsByAttachingView:toView:alongEdges:insets:", v8, v16, 11, *MEMORY[0x1E0DC49E8], v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scale");
    objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 8, 0, 0, 0, 1.0, 1.0 / v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0CB3718];
    -[VideosExtrasTableViewHeaderView contentView](v3, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintsByAttachingView:toView:alongEdges:insets:", v11, v27, 14, v17, v18, v19, v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "scale");
    objc_msgSend(v29, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 8, 0, 0, 0, 1.0, 1.0 / v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addObjectsFromArray:", v21);
    objc_msgSend(v14, "addObject:", v25);
    objc_msgSend(v14, "addObjectsFromArray:", v28);
    objc_msgSend(v14, "addObject:", v32);
    -[VideosExtrasTableViewHeaderView contentView](v3, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addConstraints:", v14);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasTableViewHeaderView;
  -[VideosExtrasTableViewHeaderView dealloc](&v4, sel_dealloc);
}

- (void)configureForHeaderElement:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "colorWithWhite:alpha:", 0.0, 0.4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasTableViewHeaderView backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[VideosExtrasTableViewHeaderView textLabel](self, "textLabel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v9);

  objc_msgSend(v5, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configureForIKTextElement:fontDescriptor:textStyle:capitalize:", v10, v12, v11, 1);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[VideosExtrasTableViewHeaderView textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v6 + 15.0;
  v8 = v4;
  result.height = v7;
  result.width = v8;
  return result;
}

@end
