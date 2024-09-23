@implementation VideosExtrasDetailTextCell

- (VideosExtrasDetailTextCell)initWithFrame:(CGRect)a3
{
  VideosExtrasDetailTextCell *v3;
  uint64_t v4;
  UILabel *label;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasDetailTextCell;
  v3 = -[VideosExtrasDetailTextCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
    label = v3->_label;
    v3->_label = (UILabel *)v4;

    -[UILabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:](v3->_label, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    -[VideosExtrasDetailTextCell addSubview:](v3, "addSubview:", v3->_label);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v3->_label, v3, 15, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasDetailTextCell addConstraints:](v3, "addConstraints:", v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__dynamicTypeDidChange, *MEMORY[0x1E0DC48E8], 0);

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
  v4.super_class = (Class)VideosExtrasDetailTextCell;
  -[VideosExtrasDetailTextCell dealloc](&v4, sel_dealloc);
}

- (void)configureForTextElement:(id)a3 style:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0DC3658];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasDetailTextCell setBackgroundColor:](self, "setBackgroundColor:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_label, "setBackgroundColor:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_label, "setTextColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel configureForIKTextElement:fontDescriptor:textStyle:](self->_label, "configureForIKTextElement:fontDescriptor:textStyle:", v8, v12, v7);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
