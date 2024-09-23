@implementation SBUIActionViewLabel

- (SBUIActionViewLabel)initWithFrame:(CGRect)a3
{
  SBUIActionViewLabel *v3;
  id v4;
  uint64_t v5;
  UILabel *label;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  const __CFString *v15;
  UILabel *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)SBUIActionViewLabel;
  v3 = -[SBUIActionViewLabel initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBUIActionViewLabel addSubview:](v3, "addSubview:", v3->_label);
    v7 = (void *)MEMORY[0x24BDD1628];
    v17 = CFSTR("label");
    v18[0] = v3->_label;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[label]|"), 0, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateConstraints:", v9);

    v10 = (void *)MEMORY[0x24BDD1628];
    v15 = CFSTR("label");
    v16 = v3->_label;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[label]|"), 0, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateConstraints:", v12);

  }
  return v3;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UILabel alignmentRectInsets](self->_label, "alignmentRectInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  UILabel *label;
  void *v10;
  UILabel *emojiLabel;
  id v12;
  UILabel *v13;
  UILabel *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  void *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  void *v24;
  void *v25;
  UILabel *v26;
  UILabel *v27;
  _QWORD v28[4];
  UILabel *v29;
  id v30;
  const __CFString *v31;
  UILabel *v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_text, a3);
    v30 = 0;
    objc_msgSend(v5, "sbui_rangesOfEmojiTokens:", &v30);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v30;
    if (objc_msgSend(v6, "count"))
    {
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __31__SBUIActionViewLabel_setText___block_invoke;
      v28[3] = &unk_24D4D0578;
      v29 = (UILabel *)v5;
      v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199F42EC](v28);
      label = self->_label;
      ((void (**)(_QWORD, void *))v8)[2](v8, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAttributedText:](label, "setAttributedText:", v10);

      emojiLabel = self->_emojiLabel;
      if (!emojiLabel)
      {
        v12 = objc_alloc(MEMORY[0x24BDF6B68]);
        v13 = (UILabel *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        v14 = self->_emojiLabel;
        self->_emojiLabel = v13;

        v15 = self->_emojiLabel;
        -[SBUIActionViewLabel font](self, "font");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v15, "setFont:", v16);

        -[UILabel setLineBreakMode:](self->_emojiLabel, "setLineBreakMode:", -[SBUIActionViewLabel lineBreakMode](self, "lineBreakMode"));
        -[UILabel setNumberOfLines:](self->_emojiLabel, "setNumberOfLines:", -[SBUIActionViewLabel numberOfLines](self, "numberOfLines"));
        -[UILabel setTextAlignment:](self->_emojiLabel, "setTextAlignment:", -[SBUIActionViewLabel textAlignment](self, "textAlignment"));
        -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_emojiLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[SBUIActionViewLabel addSubview:](self, "addSubview:", self->_emojiLabel);
        v17 = (void *)MEMORY[0x24BDD1628];
        v18 = self->_emojiLabel;
        v33 = CFSTR("emojiLabel");
        v34[0] = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[emojiLabel]|"), 0, 0, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "activateConstraints:", v20);

        v21 = (void *)MEMORY[0x24BDD1628];
        v22 = self->_emojiLabel;
        v31 = CFSTR("emojiLabel");
        v32 = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[emojiLabel]|"), 0, 0, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "activateConstraints:", v24);

        emojiLabel = self->_emojiLabel;
      }
      ((void (**)(_QWORD, id))v8)[2](v8, v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAttributedText:](emojiLabel, "setAttributedText:", v25);

      v26 = v29;
    }
    else
    {
      -[UILabel setText:](self->_label, "setText:", v5);
      v27 = self->_emojiLabel;
      if (!v27)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[UILabel removeFromSuperview](v27, "removeFromSuperview");
      v26 = self->_emojiLabel;
      self->_emojiLabel = 0;
    }

    goto LABEL_9;
  }
LABEL_10:

}

id __31__SBUIActionViewLabel_setText___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSRange v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", *(_QWORD *)(a1 + 32));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = *MEMORY[0x24BDF6600];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v10 = *(NSString **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v21 = v8;
        objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = NSRangeFromString(v10);
        objc_msgSend(v4, "addAttributes:range:", v12, v13.location, v13.length);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

- (UIFont)font
{
  return -[UILabel font](self->_label, "font");
}

- (void)setFont:(id)a3
{
  UILabel *label;
  id v5;

  label = self->_label;
  v5 = a3;
  -[UILabel setFont:](label, "setFont:", v5);
  -[UILabel setFont:](self->_emojiLabel, "setFont:", v5);

}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[UILabel setTextColor:](self->_label, "setTextColor:", v5);
  }

}

- (int64_t)textAlignment
{
  return -[UILabel textAlignment](self->_label, "textAlignment");
}

- (void)setTextAlignment:(int64_t)a3
{
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:");
  -[UILabel setTextAlignment:](self->_emojiLabel, "setTextAlignment:", a3);
}

- (int64_t)lineBreakMode
{
  return -[UILabel lineBreakMode](self->_label, "lineBreakMode");
}

- (void)setLineBreakMode:(int64_t)a3
{
  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:");
  -[UILabel setLineBreakMode:](self->_emojiLabel, "setLineBreakMode:", a3);
}

- (int64_t)numberOfLines
{
  return -[UILabel numberOfLines](self->_label, "numberOfLines");
}

- (void)setNumberOfLines:(int64_t)a3
{
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:");
  -[UILabel setNumberOfLines:](self->_emojiLabel, "setNumberOfLines:", a3);
}

- (void)_mt_applyVisualStyling:(id)a3
{
  -[UILabel _mt_applyVisualStyling:](self->_label, "_mt_applyVisualStyling:", a3);
}

- (void)mt_removeAllVisualStyling
{
  UILabel *label;
  id v4;

  -[UILabel mt_removeAllVisualStyling](self->_label, "mt_removeAllVisualStyling");
  -[UILabel setAlpha:](self->_label, "setAlpha:", 1.0);
  label = self->_label;
  -[SBUIActionViewLabel textColor](self, "textColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](label, "setTextColor:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
