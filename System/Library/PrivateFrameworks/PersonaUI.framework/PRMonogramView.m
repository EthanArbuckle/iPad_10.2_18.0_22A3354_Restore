@implementation PRMonogramView

- (PRMonogramView)initWithFrame:(CGRect)a3
{
  PRMonogramView *v3;
  PRMonogramView *v4;
  uint64_t v5;
  CAGradientLayer *circleGradientLayer;
  CAGradientLayer *v7;
  void *v8;
  id v9;
  uint64_t v10;
  UITextField *textField;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PRMonogramView;
  v3 = -[PRMonogramView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PRMonogramView setCircular:](v3, "setCircular:", 1);
    +[PRMonogram plateOverlayLayer](PRMonogram, "plateOverlayLayer");
    v5 = objc_claimAutoreleasedReturnValue();
    circleGradientLayer = v4->_circleGradientLayer;
    v4->_circleGradientLayer = (CAGradientLayer *)v5;

    v7 = v4->_circleGradientLayer;
    -[PRMonogramView bounds](v4, "bounds");
    -[CAGradientLayer setFrame:](v7, "setFrame:");
    -[PRMonogramView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSublayer:", v4->_circleGradientLayer);

    v9 = objc_alloc(MEMORY[0x24BDF6EA8]);
    -[PRMonogramView bounds](v4, "bounds");
    v10 = objc_msgSend(v9, "initWithFrame:");
    textField = v4->_textField;
    v4->_textField = (UITextField *)v10;

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTintColor:](v4->_textField, "setTintColor:", v12);

    -[UITextField setTextAlignment:](v4->_textField, "setTextAlignment:", 1);
    -[UITextField setAdjustsFontSizeToFitWidth:](v4->_textField, "setAdjustsFontSizeToFitWidth:", 0);
    -[UITextField setEnabled:](v4->_textField, "setEnabled:", 0);
    -[UITextField setAutocapitalizationType:](v4->_textField, "setAutocapitalizationType:", 3);
    -[UITextField setAutocorrectionType:](v4->_textField, "setAutocorrectionType:", 1);
    -[UITextField setSpellCheckingType:](v4->_textField, "setSpellCheckingType:", 1);
    -[UITextField setReturnKeyType:](v4->_textField, "setReturnKeyType:", 9);
    -[UITextField setKeyboardType:](v4->_textField, "setKeyboardType:", 13);
    -[UITextField setDelegate:](v4->_textField, "setDelegate:", v4);
    -[PRMonogramView addSubview:](v4, "addSubview:", v4->_textField);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[PRMonogram removeObserver:forKeyPath:](self->_monogram, "removeObserver:forKeyPath:", self, CFSTR("text"));
  -[PRMonogram removeObserver:forKeyPath:](self->_monogram, "removeObserver:forKeyPath:", self, CFSTR("fontIndex"));
  -[PRMonogram removeObserver:forKeyPath:](self->_monogram, "removeObserver:forKeyPath:", self, CFSTR("color"));
  v3.receiver = self;
  v3.super_class = (Class)PRMonogramView;
  -[PRMonogramView dealloc](&v3, sel_dealloc);
}

- (void)setMonogram:(id)a3
{
  PRMonogram *v5;
  PRMonogram **p_monogram;
  PRMonogram *monogram;
  PRMonogram *v8;

  v5 = (PRMonogram *)a3;
  p_monogram = &self->_monogram;
  monogram = self->_monogram;
  if (monogram != v5)
  {
    v8 = v5;
    -[PRMonogram removeObserver:forKeyPath:](monogram, "removeObserver:forKeyPath:", self, CFSTR("text"));
    -[PRMonogram removeObserver:forKeyPath:](*p_monogram, "removeObserver:forKeyPath:", self, CFSTR("fontIndex"));
    -[PRMonogram removeObserver:forKeyPath:](*p_monogram, "removeObserver:forKeyPath:", self, CFSTR("color"));
    objc_storeStrong((id *)&self->_monogram, a3);
    -[PRMonogram addObserver:forKeyPath:options:context:](*p_monogram, "addObserver:forKeyPath:options:context:", self, CFSTR("text"), 1, 0);
    -[PRMonogram addObserver:forKeyPath:options:context:](*p_monogram, "addObserver:forKeyPath:options:context:", self, CFSTR("fontIndex"), 1, 0);
    -[PRMonogram addObserver:forKeyPath:options:context:](*p_monogram, "addObserver:forKeyPath:options:context:", self, CFSTR("color"), 1, 0);
    -[PRMonogramView _updateTextLabel](self, "_updateTextLabel");
    v5 = v8;
  }

}

- (void)setBordered:(BOOL)a3
{
  if (self->_bordered != a3)
  {
    self->_bordered = a3;
    -[PRMonogramView _updateTextLabel](self, "_updateTextLabel");
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
    self->_selected = a3;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
  -[UITextField setEnabled:](self->_textField, "setEnabled:");
}

- (void)setCircular:(BOOL)a3
{
  if (self->_circular != a3)
  {
    self->_circular = a3;
    -[PRMonogramView _updateCornerRadii](self, "_updateCornerRadii");
  }
}

- (void)textFieldResignFirstResponder
{
  -[UITextField resignFirstResponder](self->_textField, "resignFirstResponder");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  objc_super v11;

  v10 = a3;
  if (self->_monogram == a4)
  {
    dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("color"))
      || objc_msgSend(v10, "isEqualToString:", CFSTR("text"))
      || objc_msgSend(v10, "isEqualToString:", CFSTR("fontIndex")))
    {
      -[PRMonogramView _updateTextLabel](self, "_updateTextLabel");
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PRMonogramView;
    -[PRMonogramView observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
  }

}

- (void)_updateTextLabel
{
  double Height;
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v19;
  unint64_t v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  _QWORD v37[2];
  CGRect v38;

  v37[1] = *MEMORY[0x24BDAC8D0];
  -[PRMonogramView bounds](self, "bounds");
  Height = CGRectGetHeight(v38);
  +[PRMonogram fontForIndex:plateDiameter:](PRMonogram, "fontForIndex:plateDiameter:", -[PRMonogram fontIndex](self->_monogram, "fontIndex"), Height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PRMonogram fontIndex](self->_monogram, "fontIndex");
  objc_msgSend(v4, "pointSize");
  +[PRMonogram kerningForFontIndex:fontSize:](PRMonogram, "kerningForFontIndex:fontSize:", v5);
  v7 = v6;
  if (self->_bordered)
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5);
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v8 = objc_claimAutoreleasedReturnValue();
  v36 = *MEMORY[0x24BEBB368];
  v37[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField editRect](self->_textField, "editRect");
  v11 = v10 + Height * -0.200000003;
  -[PRMonogram text](self->_monogram, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BEBB378];
  v34[0] = *MEMORY[0x24BEBB360];
  v34[1] = v13;
  v35[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeWithAttributes:", v15);
  v17 = v16;

  if (v11 > 0.0 && v17 > v11)
  {
    +[PRMonogram fontForIndex:plateDiameter:](PRMonogram, "fontForIndex:plateDiameter:", -[PRMonogram fontIndex](self->_monogram, "fontIndex"), Height * (v11 / v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = -[PRMonogram fontIndex](self->_monogram, "fontIndex");
    objc_msgSend(v19, "pointSize");
    +[PRMonogram kerningForFontIndex:fontSize:](PRMonogram, "kerningForFontIndex:fontSize:", v20);
    v7 = v21;
    v4 = v19;
  }
  if (v7 != 0.0)
  {
    v22 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v23, v13);

    v24 = objc_msgSend(v22, "copy");
    v9 = (void *)v24;
  }
  v25 = objc_alloc(MEMORY[0x24BDD1458]);
  -[PRMonogram text](self->_monogram, "text");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[PRMonogram text](self->_monogram, "text");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v25, "initWithString:attributes:", v27, v9);

  }
  else
  {
    v28 = (void *)objc_msgSend(v25, "initWithString:attributes:", &stru_24C3CF300, v9);
  }

  -[UITextField attributedText](self->_textField, "attributedText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqual:", v28);

  if ((v30 & 1) == 0)
    -[UITextField setAttributedText:](self->_textField, "setAttributedText:", v28);
  -[UITextField font](self->_textField, "font");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqual:", v4);

  if ((v32 & 1) == 0)
    -[UITextField setFont:](self->_textField, "setFont:", v4);

}

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRMonogramView;
  -[PRMonogramView layoutSubviews](&v8, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[PRMonogramView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[CAGradientLayer setFrame:](self->_circleGradientLayer, "setFrame:");

  -[PRMonogramView _updateCornerRadii](self, "_updateCornerRadii");
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  -[PRMonogramView bounds](self, "bounds");
  -[UITextField setFrame:](self->_textField, "setFrame:", PRRectScale(v4, v5, v6, v7, 0.899999976, 1.0));
  -[PRMonogramView _updateTextLabel](self, "_updateTextLabel");
}

- (void)_updateCornerRadii
{
  _BOOL4 v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;

  v3 = -[PRMonogramView isCircular](self, "isCircular");
  v4 = 0.0;
  if (v3)
  {
    -[PRMonogramView bounds](self, "bounds", 0.0);
    PRRectGetMinLength(v5, v6, v7, v8);
    v4 = v9 * 0.5;
  }
  -[CAGradientLayer setCornerRadius:](self->_circleGradientLayer, "setCornerRadius:", v4);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[UITextField resignFirstResponder](self->_textField, "resignFirstResponder", a3);
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "endOfDocument");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textRangeFromPosition:toPosition:", v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedTextRange:", v5);

}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  PRMonogram *monogram;
  PRMonogram *v8;

  v8 = (PRMonogram *)a3;
  -[PRMonogram text](v8, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[PRMonogram text](v8, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    monogram = self->_monogram;
  }
  else
  {
    -[PRMonogram text](self->_monogram, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    monogram = v8;
  }
  -[PRMonogram setText:](monogram, "setText:", v6);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend(v8, "markedTextRange"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v8, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", location, length, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v15 = objc_msgSend(v14, "length");
    v16 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __76__PRMonogramView_textField_shouldChangeCharactersInRange_replacementString___block_invoke;
    v20[3] = &unk_24C3CF220;
    v20[4] = &v21;
    objc_msgSend(v14, "enumerateSubstringsInRange:options:usingBlock:", 0, v15, 2, v20);
    v17 = v22[3];
    v11 = v17 < 3;
    if (v17 == 2)
    {
      v18[0] = v16;
      v18[1] = 3221225472;
      v18[2] = __76__PRMonogramView_textField_shouldChangeCharactersInRange_replacementString___block_invoke_2;
      v18[3] = &unk_24C3CEFE8;
      v19 = v8;
      dispatch_async(MEMORY[0x24BDAC9B8], v18);

    }
    _Block_object_dispose(&v21, 8);

  }
  return v11;
}

uint64_t __76__PRMonogramView_textField_shouldChangeCharactersInRange_replacementString___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __76__PRMonogramView_textField_shouldChangeCharactersInRange_replacementString___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resignFirstResponder");
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRMonogramView;
  -[PRMonogramView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[PRMonogramView _updateTextLabel](self, "_updateTextLabel");
  -[PRMonogramView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  -[CAGradientLayer setRasterizationScale:](self->_circleGradientLayer, "setRasterizationScale:");

}

- (PRMonogram)monogram
{
  return self->_monogram;
}

- (BOOL)bordered
{
  return self->_bordered;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogram, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_circleGradientLayer, 0);
}

@end
