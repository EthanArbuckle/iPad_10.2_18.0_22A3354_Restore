@implementation OBPasscodeFieldDot

- (OBPasscodeFieldDot)init
{
  OBPasscodeFieldDot *v2;
  OBPasscodeFieldDot *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBPasscodeFieldDot;
  v2 = -[OBPasscodeFieldDot initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[OBPasscodeFieldDot layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", 10.0);

    -[OBPasscodeFieldDot layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksToBounds:", 1);

    -[OBPasscodeFieldDot layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderWidth:", 2.0);

    -[OBPasscodeFieldDot _updateView](v3, "_updateView");
  }
  return v3;
}

- (void)setFilled:(BOOL)a3
{
  if (self->_filled != a3)
  {
    self->_filled = a3;
    -[OBPasscodeFieldDot _updateView](self, "_updateView");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 20.0;
  v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBPasscodeFieldDot;
  -[OBPasscodeFieldDot traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[OBPasscodeFieldDot _updateView](self, "_updateView");
}

- (void)_updateView
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (-[OBPasscodeFieldDot isFilled](self, "isFilled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "CGColor");
    -[OBPasscodeFieldDot layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    -[OBPasscodeFieldDot layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  }
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v11, "CGColor");
  -[OBPasscodeFieldDot layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderColor:", v9);

}

- (BOOL)isFilled
{
  return self->_filled;
}

@end
