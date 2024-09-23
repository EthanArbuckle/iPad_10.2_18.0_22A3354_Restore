@implementation UIURLDragPreviewView

+ (id)viewWithTitle:(id)a3 URL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setTitle:", v6);

  objc_msgSend(v7, "setUrl:", v5);
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", 10000.0, 10000.0);
  objc_msgSend(v7, "setFrame:", v8, v9, v10, v11);
  return v7;
}

+ (id)viewWithURL:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setUrl:", v3);

  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", 10000.0, 10000.0);
  objc_msgSend(v4, "setFrame:", v5, v6, v7, v8);
  return v4;
}

+ (id)viewWithTitle:(id)a3 URLText:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setTitle:", v6);

  objc_msgSend(v7, "setUrlText:", v5);
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", 10000.0, 10000.0);
  objc_msgSend(v7, "setFrame:", v8, v9, v10, v11);
  return v7;
}

+ (id)viewWithURLText:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setUrlText:", v3);

  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", 10000.0, 10000.0);
  objc_msgSend(v4, "setFrame:", v5, v6, v7, v8);
  return v4;
}

+ (id)_titleFont
{
  void *v2;
  void *v3;

  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleFootnote"), 2, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_urlFont
{
  void *v2;
  void *v3;

  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleFootnote"), 0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;

  if (!URLFormattingLibraryCore_frameworkLibrary)
    URLFormattingLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!URLFormattingLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *URLFormattingLibrary(void)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIURLDragPreviewView.m"), 18, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
}

- (UIURLDragPreviewView)initWithFrame:(CGRect)a3
{
  UIURLDragPreviewView *v3;
  UIURLDragPreviewView *v4;
  uint64_t v5;
  UILabel *titleLabel;
  void *v7;
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
  uint64_t v18;
  UILabel *urlLabel;
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
  uint64_t v36;
  NSArray *urlOnlyConstraints;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSArray *titleAndUrlConstraints;
  void *v43;
  void *v44;
  objc_super v46;
  void *v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)UIURLDragPreviewView;
  v3 = -[UIView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = objc_opt_new();
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v5;

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_titleLabel, "setAdjustsFontSizeToFitWidth:", 0);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 4);
    +[UIURLDragPreviewView _titleFont](UIURLDragPreviewView, "_titleFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v7);

    +[UIColor labelColor](UIColor, "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v8);

    -[UIView addSubview:](v4, "addSubview:", v4->_titleLabel);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView topAnchor](v4->_titleLabel, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v4, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    -[UIView leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    -[UIView trailingAnchor](v4->_titleLabel, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    v18 = objc_opt_new();
    urlLabel = v4->_urlLabel;
    v4->_urlLabel = (UILabel *)v18;

    -[UILabel setNumberOfLines:](v4->_urlLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_urlLabel, "setAdjustsFontSizeToFitWidth:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_urlLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setLineBreakMode:](v4->_urlLabel, "setLineBreakMode:", 4);
    +[UIURLDragPreviewView _urlFont](UIURLDragPreviewView, "_urlFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_urlLabel, "setFont:", v20);

    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_urlLabel, "setTextColor:", v21);

    -[UIView addSubview:](v4, "addSubview:", v4->_urlLabel);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_urlLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView bottomAnchor](v4->_urlLabel, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

    -[UIView leadingAnchor](v4->_urlLabel, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[UIView trailingAnchor](v4->_urlLabel, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    -[UIView topAnchor](v4->_urlLabel, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v4, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v33;
    -[UIView heightAnchor](v4->_titleLabel, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 0.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v36 = objc_claimAutoreleasedReturnValue();
    urlOnlyConstraints = v4->_urlOnlyConstraints;
    v4->_urlOnlyConstraints = (NSArray *)v36;

    -[UIView firstBaselineAnchor](v4->_urlLabel, "firstBaselineAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView lastBaselineAnchor](v4->_titleLabel, "lastBaselineAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 17.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v41 = objc_claimAutoreleasedReturnValue();
    titleAndUrlConstraints = v4->_titleAndUrlConstraints;
    v4->_titleAndUrlConstraints = (NSArray *)v41;

    -[UIView widthAnchor](v4, "widthAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintLessThanOrEqualToConstant:", 400.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

    -[UIView setNeedsUpdateConstraints](v4, "setNeedsUpdateConstraints");
  }
  return v4;
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  title = self->_title;
  self->_title = v5;

  -[UILabel setText:](self->_titleLabel, "setText:", v4);
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setUrl:(id)a3
{
  id v4;
  NSURL *v5;
  NSURL *url;
  NSString *urlText;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = (NSURL *)objc_msgSend(v4, "copy");
  url = self->_url;
  self->_url = v5;

  urlText = self->_urlText;
  self->_urlText = 0;

  objc_msgSend(v4, "_lp_simplifiedDisplayString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_urlLabel, "setText:", v8);
  -[UILabel text](self->_urlLabel, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
    -[UILabel setText:](self->_urlLabel, "setText:", &stru_1E16EDF20);
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setUrlText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *urlText;
  NSURL *url;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  urlText = self->_urlText;
  self->_urlText = v5;

  url = self->_url;
  self->_url = 0;

  -[UILabel setText:](self->_urlLabel, "setText:", v4);
  -[UILabel text](self->_urlLabel, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
    -[UILabel setText:](self->_urlLabel, "setText:", &stru_1E16EDF20);
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIURLDragPreviewView;
  -[UIView updateConstraints](&v12, sel_updateConstraints);
  -[UILabel text](self->_titleLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_urlLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", v4))
  {

  }
  else
  {
    -[UILabel text](self->_titleLabel, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL absoluteString](self->_url, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (!v7)
      goto LABEL_5;
  }
  -[UILabel setText:](self->_titleLabel, "setText:", 0);
LABEL_5:
  -[UILabel text](self->_titleLabel, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
    v10 = 2;
  else
    v10 = 3;
  if (v9)
    v11 = 3;
  else
    v11 = 2;
  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIURLDragPreviewView__titleLabel[v10]));
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIURLDragPreviewView__titleLabel[v11]));
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)urlText
{
  return self->_urlText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlText, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_urlOnlyConstraints, 0);
  objc_storeStrong((id *)&self->_titleAndUrlConstraints, 0);
  objc_storeStrong((id *)&self->_urlLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
