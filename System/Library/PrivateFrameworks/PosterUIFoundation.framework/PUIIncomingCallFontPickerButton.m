@implementation PUIIncomingCallFontPickerButton

- (void)configureWithFont:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUIIncomingCallFontPickerButton;
  v7 = a4;
  -[PUIStyleFontPickerButton configureWithFont:text:](&v9, sel_configureWithFont_text_, v6, v7);
  if (objc_msgSend(v7, "length", v9.receiver, v9.super_class) == 1)
  {
    -[PUIIncomingCallFontPickerButton imageRepresentingFont:text:](self, "imageRepresentingFont:text:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[PUIIncomingCallFontPickerButton displayImage:](self, "displayImage:", v8);
    else
      -[PUIIncomingCallFontPickerButton displayText:usingFont:](self, "displayText:usingFont:", CFSTR("Aa"), v6);
  }
  else
  {
    -[PUIIncomingCallFontPickerButton displayText:usingFont:](self, "displayText:usingFont:", v7, v6);
    v8 = v7;
  }

}

- (void)displayText:(id)a3 usingFont:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
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
  id v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[PUIIncomingCallFontPickerButton contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[PUIIncomingCallFontPickerButton contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    v12 = objc_opt_class();
    v13 = v11;
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

  }
  else
  {
    objc_msgSend(v10, "removeFromSuperview");

    v15 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v15, "setMinimumScaleFactor:", 0.5);
    objc_msgSend(v15, "setTextAlignment:", 1);
    objc_msgSend(v15, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUIIncomingCallFontPickerButton addSubview:](self, "addSubview:", v15);
    v24 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v15, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIIncomingCallFontPickerButton topAnchor](self, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 4.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v27;
    objc_msgSend(v15, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIIncomingCallFontPickerButton bottomAnchor](self, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, -4.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v23;
    objc_msgSend(v15, "leadingAnchor");
    v30 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIIncomingCallFontPickerButton leadingAnchor](self, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 4.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v18;
    objc_msgSend(v15, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIIncomingCallFontPickerButton trailingAnchor](self, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -4.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v22);

    v7 = v30;
    objc_storeStrong((id *)&self->_contentView, v15);
  }
  objc_msgSend(v15, "setFont:", v6);

  objc_msgSend(v15, "setText:", v7);
}

- (void)displayImage:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
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
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PUIIncomingCallFontPickerButton contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[PUIIncomingCallFontPickerButton contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = objc_opt_class();
    v10 = v8;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

  }
  else
  {
    objc_msgSend(v7, "removeFromSuperview");

    v12 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", v13);

    objc_msgSend(v12, "setContentMode:", 1);
    LODWORD(v14) = 1144750080;
    objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 0, v14);
    LODWORD(v15) = 1144750080;
    objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 1, v15);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUIIncomingCallFontPickerButton addSubview:](self, "addSubview:", v12);
    v24 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v12, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIIncomingCallFontPickerButton topAnchor](self, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v27;
    objc_msgSend(v12, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIIncomingCallFontPickerButton bottomAnchor](self, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v23;
    objc_msgSend(v12, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIIncomingCallFontPickerButton leadingAnchor](self, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v18;
    objc_msgSend(v12, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIIncomingCallFontPickerButton trailingAnchor](self, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v22);

    objc_storeStrong((id *)&self->_contentView, v12);
  }
  objc_msgSend(v12, "setImage:", v4);

}

- (id)imageRepresentingFont:(id)a3 text:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v5 = (void *)MEMORY[0x24BDF6A70];
  v6 = a4;
  -[PUIStyleFontPickerButton contentFont](self, "contentFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pui_UIFontWithName:forRole:includingFallbackFonts:", v8, *MEMORY[0x24BE74D58], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStyleFontPickerButton contentFont](self, "contentFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pointSize");
  v11 = objc_msgSend(v9, "fontWithSize:");

  v12 = -[PUIIncomingCallFontPickerButton glyphForText:usingFontRef:](self, "glyphForText:usingFontRef:", v6, v11);
  if ((_DWORD)v12)
  {
    -[PUIIncomingCallFontPickerButton imageFromGlyph:fromFontRef:](self, "imageFromGlyph:fromFontRef:", v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = v13;

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)imageFromGlyph:(unsigned __int16)a3 fromFontRef:(__CTFont *)a4
{
  const CGPath *PathForGlyph;
  double v6;
  double v7;
  double v8;
  double v9;
  const CGPath *v10;
  CGContext *CurrentContext;
  id v12;
  id v13;
  void *v14;
  CGAffineTransform v16;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGSize v23;
  CGRect PathBoundingBox;

  PathForGlyph = CTFontCreatePathForGlyph(a4, a3, 0);
  -[PUIStyleFontPickerButton cellSize](self, "cellSize");
  v7 = v6;
  v9 = v8;
  PathBoundingBox = CGPathGetPathBoundingBox(PathForGlyph);
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, (v7 - PathBoundingBox.size.width) * 0.5 - PathBoundingBox.origin.x, (v9 - PathBoundingBox.size.height) * 0.5 - PathBoundingBox.origin.y);
  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeScale(&v21, 1.0, -1.0);
  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeTranslation(&v20, 0.0, v9);
  memset(&v19, 0, sizeof(v19));
  t1 = v21;
  v16 = v20;
  CGAffineTransformConcat(&t2, &t1, &v16);
  t1 = v22;
  CGAffineTransformConcat(&v19, &t1, &t2);
  v10 = (const CGPath *)MEMORY[0x249514A94](PathForGlyph, &v19);
  -[PUIStyleFontPickerButton cellSize](self, "cellSize");
  UIGraphicsBeginImageContextWithOptions(v23, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v12, "CGColor"));

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v13, "CGColor"));

  CGContextAddPath(CurrentContext, v10);
  CGContextDrawPath(CurrentContext, kCGPathFillStroke);
  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v14;
}

- (unsigned)glyphForText:(id)a3 usingFontRef:(__CTFont *)a4
{
  id v5;
  CFIndex v6;
  unint64_t v7;
  uint64_t v8;
  unsigned __int16 *v9;
  unsigned __int16 v10;
  int v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (2 * v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = objc_msgSend(v5, "getCharacters:range:", (char *)v13 - v7, 0, v6);
  MEMORY[0x24BDAC7A8](v8);
  v9 = (unsigned __int16 *)((char *)v13 - v7);
  CTFontGetGlyphsForCharacters(a4, (const UniChar *)((char *)v13 - v7), (CGGlyph *)((char *)v13 - v7), v6);
  if (v6)
  {
    while (1)
    {
      v11 = *v9++;
      v10 = v11;
      if (v11)
        break;
      if (!--v6)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v10 = 0;
  }

  return v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUIIncomingCallFontPickerButton;
  -[PUIIncomingCallFontPickerButton traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[PUIStyleFontPickerButton contentFont](self, "contentFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStyleFontPickerButton contentText](self, "contentText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIIncomingCallFontPickerButton configureWithFont:text:](self, "configureWithFont:text:", v4, v5);

}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
