@implementation WFGlyphPickerCell

- (WFGlyphPickerCell)initWithFrame:(CGRect)a3
{
  WFGlyphPickerCell *v3;
  WFGlyphView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFGlyphPickerCell *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WFGlyphPickerCell;
  v3 = -[WFGlyphPickerCell initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(WFGlyphView);
    -[WFGlyphView setGlyphInsets:](v4, "setGlyphInsets:", 8.0, 8.0, 8.0, 8.0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGlyphView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[WFGlyphView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFGlyphPickerCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v4);

    objc_storeWeak((id *)&v3->_glyphView, v4);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGlyphPickerCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[WFGlyphPickerCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 10.0);

    v11 = *MEMORY[0x24BDE58E8];
    -[WFGlyphPickerCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerCurve:", v11);

    _NSDictionaryOfVariableBindings(CFSTR("glyphView"), v4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[glyphView]|"), 0, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGlyphPickerCell addConstraints:](v3, "addConstraints:", v15);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[glyphView]|"), 0, 0, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGlyphPickerCell addConstraints:](v3, "addConstraints:", v16);

    v17 = v3;
  }

  return v3;
}

- (BOOL)outline
{
  void *v2;
  char v3;

  -[WFGlyphPickerCell glyphView](self, "glyphView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "outline");

  return v3;
}

- (void)setOutline:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFGlyphPickerCell glyphView](self, "glyphView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutline:", v3);

}

- (unsigned)glyphCharacter
{
  void *v2;
  unsigned __int16 v3;

  -[WFGlyphPickerCell glyphView](self, "glyphView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "glyphCharacter");

  return v3;
}

- (void)setGlyphCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[WFGlyphPickerCell glyphView](self, "glyphView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGlyphCharacter:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WFGlyphPickerCell glyphView](self, "glyphView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGlyphColor:", v7);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WFGlyphPickerCell;
  -[WFGlyphPickerCell setSelected:](&v7, sel_setSelected_);
  if (v3)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray5Color");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGlyphPickerCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BEBDF00];
  v3 = -[WFGlyphPickerCell isSelected](self, "isSelected");
  v4 = *MEMORY[0x24BEBDF30];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (id)accessibilityLabel
{
  -[WFGlyphPickerCell glyphCharacter](self, "glyphCharacter");
  return (id)WFNameForGlyphCharacter();
}

- (WFGlyphView)glyphView
{
  return (WFGlyphView *)objc_loadWeakRetained((id *)&self->_glyphView);
}

- (void)setGlyphView:(id)a3
{
  objc_storeWeak((id *)&self->_glyphView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_glyphView);
}

@end
