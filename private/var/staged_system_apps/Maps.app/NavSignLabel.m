@implementation NavSignLabel

- (NavSignLabel)initWithCoder:(id)a3
{
  NavSignLabel *v3;
  NavSignLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavSignLabel;
  v3 = -[NavSignLabel initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[NavSignLabel _maps_commonInit](v3, "_maps_commonInit");
  return v4;
}

- (NavSignLabel)initWithFrame:(CGRect)a3
{
  NavSignLabel *v3;
  NavSignLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavSignLabel;
  v3 = -[NavSignLabel initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NavSignLabel _maps_commonInit](v3, "_maps_commonInit");
  return v4;
}

- (void)_maps_commonInit
{
  TextFirstLineCharacterRangeFinder *v3;
  TextFirstLineCharacterRangeFinder *rangeFinder;

  self->_inlineShieldAlpha = 1.0;
  self->_inlineShieldSize = 6;
  self->_perferredFontAdjustsFontSizeToFitWidth = 1;
  self->_preferredFontMinimumScaleFactor = 0.75;
  v3 = objc_alloc_init(TextFirstLineCharacterRangeFinder);
  rangeFinder = self->_rangeFinder;
  self->_rangeFinder = v3;

  self->_paragraphLineBreakMode = 4;
}

- (void)setPreferredFont:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_preferredFont;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preferredFont, a3);
      -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
      v7 = (unint64_t)v9;
    }
  }

}

- (void)setAlternateFont:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_alternateFont;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alternateFont, a3);
      -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
      v7 = (unint64_t)v9;
    }
  }

}

- (void)setMaxNumberOfLinesWithPreferredFont:(int64_t)a3
{
  if (self->_maxNumberOfLinesWithPreferredFont != a3)
  {
    self->_maxNumberOfLinesWithPreferredFont = a3;
    -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
  }
}

- (void)setMaxNumberOfTotalLines:(int64_t)a3
{
  if (self->_maxNumberOfTotalLines != a3)
  {
    self->_maxNumberOfTotalLines = a3;
    -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
  }
}

- (void)setTextAlternatives:(id)a3
{
  id v5;

  v5 = a3;
  if ((+[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", self->_textAlternatives) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textAlternatives, a3);
    -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
  }

}

- (void)setAlternateFontLineSpacing:(double)a3
{
  if (self->_alternateFontLineSpacing != a3)
  {
    self->_alternateFontLineSpacing = a3;
    -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
  }
}

- (void)setMaxNumberOfLinesWithLongestAlternative:(int64_t)a3
{
  if (self->_maxNumberOfLinesWithLongestAlternative != a3)
  {
    self->_maxNumberOfLinesWithLongestAlternative = a3;
    -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
  }
}

- (void)setInlineShieldAlpha:(double)a3
{
  if (self->_inlineShieldAlpha != a3)
  {
    self->_inlineShieldAlpha = a3;
    -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
  }
}

- (void)setPreferredFontMinimumScaleFactor:(double)a3
{
  if (self->_preferredFontMinimumScaleFactor != a3)
  {
    self->_preferredFontMinimumScaleFactor = a3;
    -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
  }
}

- (void)setPerferredFontAdjustsFontSizeToFitWidth:(BOOL)a3
{
  if (self->_perferredFontAdjustsFontSizeToFitWidth != a3)
  {
    self->_perferredFontAdjustsFontSizeToFitWidth = a3;
    -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
  }
}

- (void)setParagraphLineBreakMode:(int64_t)a3
{
  if (self->_paragraphLineBreakMode != a3)
  {
    self->_paragraphLineBreakMode = a3;
    -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
  }
}

- (void)setInlineShieldSize:(int64_t)a3
{
  if (self->_inlineShieldSize != a3)
  {
    self->_inlineShieldSize = a3;
    -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
  }
}

- (unint64_t)lineCount
{
  void *v3;
  void *v4;
  unint64_t v5;
  TextFirstLineCharacterRangeFinder *rangeFinder;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  TextFirstLineCharacterRangeFinder *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel attributedText](self, "attributedText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel attributedText](self, "attributedText"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100869828;
  v18[3] = &unk_1011D98F8;
  v18[4] = &v19;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", NSAttachmentAttributeName, 0, objc_msgSend(v4, "length"), 0, v18);

  if (*((_BYTE *)v20 + 24))
  {
    v5 = -[NavSignLabel maxNumberOfTotalLines](self, "maxNumberOfTotalLines");
    rangeFinder = self->_rangeFinder;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel attributedText](self, "attributedText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TextFirstLineCharacterRangeFinder lineRangesForText:](rangeFinder, "lineRangesForText:", v7));
    if (v5 >= (unint64_t)objc_msgSend(v8, "count"))
    {
      v14 = self->_rangeFinder;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel attributedText](self, "attributedText"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TextFirstLineCharacterRangeFinder lineRangesForText:](v14, "lineRangesForText:", v15));
      v9 = objc_msgSend(v16, "count");

    }
    else
    {
      v9 = -[NavSignLabel maxNumberOfTotalLines](self, "maxNumberOfTotalLines");
    }
  }
  else
  {
    -[NavSignLabel bounds](self, "bounds");
    -[NavSignLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0);
    v11 = v10;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel font](self, "font"));
    objc_msgSend(v7, "lineHeight");
    if (!(unint64_t)(v11 / v12))
    {
      v9 = 0;
      goto LABEL_8;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel font](self, "font"));
    objc_msgSend(v8, "lineHeight");
    v9 = (id)(v11 / v13);
  }

LABEL_8:
  _Block_object_dispose(&v19, 8);
  return (unint64_t)v9;
}

- (BOOL)shouldUseAlternateFont
{
  void *v3;
  unint64_t v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel alternateFont](self, "alternateFont"));
  if (v3 && -[NavSignLabel maxNumberOfLinesWithPreferredFont](self, "maxNumberOfLinesWithPreferredFont") >= 1)
  {
    v4 = -[NavSignLabel lineCount](self, "lineCount");
    v5 = v4 > -[NavSignLabel maxNumberOfLinesWithPreferredFont](self, "maxNumberOfLinesWithPreferredFont");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateLabelIfNeeded
{
  if (self->_needsUpdateLabel)
    -[NavSignLabel _updateLabel](self, "_updateLabel");
}

- (double)inlineShieldBaselineOffset:(unint64_t)a3 fromTop:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  NavSignLabel *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NavSignLabel *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel attributedText](self, "attributedText"));
  -[NavSignLabel bounds](self, "bounds");
  -[TextFirstLineCharacterRangeFinder setTextSize:](self->_rangeFinder, "setTextSize:", v8, v9);
  if (a3 == -1)
  {
    v10 = -[TextFirstLineCharacterRangeFinder lastLineCharacterRangeInText:](self->_rangeFinder, "lastLineCharacterRangeInText:", v7);
    goto LABEL_5;
  }
  if (!a3)
  {
    v10 = -[TextFirstLineCharacterRangeFinder firstLineCharacterRangeInText:](self->_rangeFinder, "firstLineCharacterRangeInText:", v7);
LABEL_5:
    v12 = (uint64_t)v10;
    v13 = v11;
    goto LABEL_10;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TextFirstLineCharacterRangeFinder lineRangesForText:](self->_rangeFinder, "lineRangesForText:", v7));
  if ((unint64_t)objc_msgSend(v14, "count") <= a3)
  {
    v13 = 0;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", a3));
    v12 = (uint64_t)objc_msgSend(v15, "rangeValue");
    v13 = v16;

  }
LABEL_10:
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_100869C00;
  v47 = sub_100869C10;
  v48 = 0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100869C18;
  v42[3] = &unk_1011D98F8;
  v42[4] = &v43;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", NSAttachmentAttributeName, v12, v13, 0, v42);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v44[5], "image"));

  if (v17)
  {
    if (-[NavSignLabel shouldUseAlternateFont](self, "shouldUseAlternateFont"))
      v18 = objc_claimAutoreleasedReturnValue(-[NavSignLabel alternateFont](self, "alternateFont"));
    else
      v18 = objc_claimAutoreleasedReturnValue(-[NavSignLabel preferredFont](self, "preferredFont"));
    v20 = (void *)v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v44[5], "image"));
    objc_msgSend(v21, "size");
    v23 = v22;
    objc_msgSend(v20, "lineHeight");
    v25 = v24;

    v19 = 0.0;
    if (v23 > v25)
    {
      v26 = (void *)v44[5];
      if (v4)
      {
        v27 = (NavSignLabel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "image"));
        -[NavSignLabel size](v27, "size");
        v29 = v28;
        objc_msgSend((id)v44[5], "bounds");
        v31 = v30;
        objc_msgSend(v20, "ascender");
        v33 = v29 + v31 - v32;
        v34 = self;
        v19 = UIRoundToViewScale(v34, v35, v33);

      }
      else
      {
        objc_msgSend(v26, "bounds");
        v37 = v36;
        objc_msgSend(v20, "descender");
        v39 = v37 - v38;
        v27 = self;
        v19 = UIRoundToViewScale(v27, v40, v39);
      }

    }
  }
  else
  {
    v19 = 0.0;
  }
  if (!v4)
    v19 = -v19;
  _Block_object_dispose(&v43, 8);

  return v19;
}

- (double)inlineShieldFirstBaselineTopOffset
{
  double v2;

  -[NavSignLabel inlineShieldBaselineOffset:fromTop:](self, "inlineShieldBaselineOffset:fromTop:", 0, 1);
  return fmax(v2, 0.0);
}

- (double)inlineShieldLastBaselineBottomOffset
{
  double v2;

  -[NavSignLabel inlineShieldBaselineOffset:fromTop:](self, "inlineShieldBaselineOffset:fromTop:", -1, 0);
  return fmin(v2, 0.0);
}

- (UILayoutGuide)textTrailingLayoutGuide
{
  UILayoutGuide *textTrailingLayoutGuide;
  UILayoutGuide *v4;
  UILayoutGuide *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *textTrailingLayoutGuideWidthConstraint;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  _QWORD v20[4];

  textTrailingLayoutGuide = self->_textTrailingLayoutGuide;
  if (!textTrailingLayoutGuide)
  {
    v4 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    v5 = self->_textTrailingLayoutGuide;
    self->_textTrailingLayoutGuide = v4;

    -[NavSignLabel addLayoutGuide:](self, "addLayoutGuide:", self->_textTrailingLayoutGuide);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_textTrailingLayoutGuide, "widthAnchor"));
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:", 0.0));
    textTrailingLayoutGuideWidthConstraint = self->_textTrailingLayoutGuideWidthConstraint;
    self->_textTrailingLayoutGuideWidthConstraint = v7;

    v20[0] = self->_textTrailingLayoutGuideWidthConstraint;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_textTrailingLayoutGuide, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel leadingAnchor](self, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
    v20[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_textTrailingLayoutGuide, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel topAnchor](self, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    v20[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_textTrailingLayoutGuide, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel bottomAnchor](self, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v20[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    textTrailingLayoutGuide = self->_textTrailingLayoutGuide;
  }
  return textTrailingLayoutGuide;
}

- (BOOL)_fitsMaxNumberOfLines:(int64_t)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;

  if (!a3)
    return 1;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[NavSignLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 0);
  v11 = v10;
  -[NavSignLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", a3, x, y, width, height);
  return v11 <= v12;
}

- (void)_setNeedsUpdateLabel
{
  _QWORD block[5];

  if (!self->_needsUpdateLabel)
  {
    self->_needsUpdateLabel = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10086A018;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_updateLabel
{
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];

  if (self->_needsUpdateLabel)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel textAlternatives](self, "textAlternatives"));
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      -[NavSignLabel bounds](self, "bounds");
      v6 = v5;
      -[NavSignLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[NavSignLabel setNumberOfLines:](self, "setNumberOfLines:", -[NavSignLabel maxNumberOfTotalLines](self, "maxNumberOfTotalLines"));
      -[NavSignLabel setAdjustsFontSizeToFitWidth:](self, "setAdjustsFontSizeToFitWidth:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel textAlternatives](self, "textAlternatives"));
      v8 = objc_msgSend(v7, "count");

      v9 = 0;
      if (v8)
      {
        do
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel textAlternatives](self, "textAlternatives"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel _attributedStringFromServerString:](self, "_attributedStringFromServerString:", v11));
          -[NavSignLabel setAttributedText:](self, "setAttributedText:", v12);

          if (-[NavSignLabel _fitsMaxNumberOfLines:bounds:](self, "_fitsMaxNumberOfLines:bounds:", -[NavSignLabel maxNumberOfLinesWithLongestAlternative](self, "maxNumberOfLinesWithLongestAlternative"), 0.0, 0.0, v6, 1.79769313e308))
          {
            break;
          }
          ++v9;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel textAlternatives](self, "textAlternatives"));
          v14 = objc_msgSend(v13, "count");

        }
        while (v9 < (unint64_t)v14);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel delegate](self, "delegate"));
      objc_msgSend(v15, "navSignLabel:didSelectAlternate:", self, v9);

      v16 = objc_claimAutoreleasedReturnValue(-[NavSignLabel alternateFont](self, "alternateFont"));
      if (v16
        && (v17 = (void *)v16,
            v18 = -[NavSignLabel _fitsMaxNumberOfLines:bounds:](self, "_fitsMaxNumberOfLines:bounds:", -[NavSignLabel maxNumberOfLinesWithPreferredFont](self, "maxNumberOfLinesWithPreferredFont"), 0.0, 0.0, v6, 1.79769313e308), v17, (v18 & 1) == 0))
      {
        v20 = objc_alloc_init((Class)NSMutableParagraphStyle);
        -[NavSignLabel alternateFontLineSpacing](self, "alternateFontLineSpacing");
        v22 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel alternateFont](self, "alternateFont"));
        objc_msgSend(v23, "lineHeight");
        v25 = v22 - v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel alternateFont](self, "alternateFont"));
        objc_msgSend(v26, "leading");
        v28 = v25 + v27;

        if (v28 >= 0.0)
          objc_msgSend(v20, "setLineSpacing:", v28);
        objc_msgSend(v20, "setLineBreakMode:", -[NavSignLabel paragraphLineBreakMode](self, "paragraphLineBreakMode"));
        LODWORD(v29) = 1036831949;
        objc_msgSend(v20, "setHyphenationFactor:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel attributedText](self, "attributedText"));
        v31 = objc_msgSend(v30, "mutableCopy");

        v35[0] = NSFontAttributeName;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel alternateFont](self, "alternateFont"));
        v35[1] = NSParagraphStyleAttributeName;
        v36[0] = v32;
        v36[1] = v20;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel attributedText](self, "attributedText"));
        objc_msgSend(v31, "addAttributes:range:", v33, 0, objc_msgSend(v34, "length"));

        -[NavSignLabel setAttributedText:](self, "setAttributedText:", v31);
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel preferredFont](self, "preferredFont"));

        if (v19)
        {
          -[NavSignLabel preferredFontMinimumScaleFactor](self, "preferredFontMinimumScaleFactor");
          -[NavSignLabel setMinimumScaleFactor:](self, "setMinimumScaleFactor:");
          -[NavSignLabel setAdjustsFontSizeToFitWidth:](self, "setAdjustsFontSizeToFitWidth:", -[NavSignLabel perferredFontAdjustsFontSizeToFitWidth](self, "perferredFontAdjustsFontSizeToFitWidth"));
        }
      }
    }
    else
    {
      -[NavSignLabel setAttributedText:](self, "setAttributedText:", 0);
    }
    self->_needsUpdateLabel = 0;
  }
}

- (id)_attributedStringKeyForString:(id)a3 font:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v13 = a3;
  v14 = a4;
  v6 = a4;
  v7 = a3;
  -[NavSignLabel inlineShieldAlpha](self, "inlineShieldAlpha", v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v15 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NavSignLabel inlineShieldSize](self, "inlineShieldSize")));
  v16 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NavSignLabel shouldRemoveTextStartingAtFirstNewline](self, "shouldRemoveTextStartingAtFirstNewline")));
  v17 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 5));

  return v11;
}

- (id)_attributedStringFromServerString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  int64_t v17;
  double v18;
  double v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v45[5];
  _QWORD v46[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel preferredFont](self, "preferredFont"));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NavSignLabel font](self, "font"));
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel _attributedStringKeyForString:font:](self, "_attributedStringKeyForString:font:", v4, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel stringCache](self, "stringCache"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));

  if (v11)
  {
    v12 = objc_opt_class(NSNull);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      v13 = 0;
    else
      v13 = v11;
    v14 = v13;
  }
  else
  {
    -[NavSignLabel inlineShieldAlpha](self, "inlineShieldAlpha");
    v16 = v15;
    v17 = -[NavSignLabel inlineShieldSize](self, "inlineShieldSize");
    -[NavSignLabel _car_dynamicPointScaleValue](self, "_car_dynamicPointScaleValue");
    v19 = v18;
    v46[0] = v8;
    v45[0] = NSFontAttributeName;
    v45[1] = MKServerFormattedStringArtworkAlphaAttributeKey;
    v20 = v8;
    v21 = v4;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
    v46[1] = v22;
    v45[2] = MKServerFormattedStringArtworkSizeAttributeKey;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17));
    v46[2] = v23;
    v46[3] = &off_10126FA00;
    v45[3] = MKServerFormattedStringArtworkFeatureTypeAttributeKey;
    v45[4] = MKServerFormattedStringArtworkScaleAttributeKey;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
    v46[4] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 5));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "multiPartAttributedStringWithAttributes:", v25));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "attributedString"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_maps_attributedStringByReplacingWhitespaceToAvoidOrphanWords"));
    if (objc_msgSend(v28, "length"))
      v29 = v28;
    else
      v29 = 0;
    v30 = v29;

    if (-[NavSignLabel shouldRemoveTextStartingAtFirstNewline](self, "shouldRemoveTextStartingAtFirstNewline"))
    {
      if (objc_msgSend(v30, "length"))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "string"));
        v32 = objc_msgSend(v31, "rangeOfString:", CFSTR("\n"));
        v34 = v33;

        if (v32 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
        {
          if (v34)
          {
            v35 = (char *)((_BYTE *)objc_msgSend(v30, "length") - v32);
            v36 = objc_msgSend(v30, "mutableCopy");
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mutableString"));
            objc_msgSend(v37, "deleteCharactersInRange:", v32, v35);

            v38 = objc_msgSend(v36, "copy");
            v30 = v38;
          }
        }
      }
    }
    if (objc_msgSend(v30, "length"))
      v39 = v30;
    else
      v39 = 0;
    v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel stringCache](self, "stringCache"));
    v42 = v41;
    if (v40)
    {
      objc_msgSend(v41, "setObject:forKey:", v40, v9);
    }
    else
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v42, "setObject:forKey:", v43, v9);

    }
    v11 = v40;

    v14 = v11;
  }

  return v14;
}

- (void)layoutSubviews
{
  double width;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavSignLabel;
  -[NavSignLabel layoutSubviews](&v7, "layoutSubviews");
  width = self->_width;
  -[NavSignLabel bounds](self, "bounds");
  if (width != v4)
  {
    -[NavSignLabel bounds](self, "bounds");
    self->_width = v5;
    -[NavSignLabel _setNeedsUpdateLabel](self, "_setNeedsUpdateLabel");
  }
  -[NavSignLabel updateLabelIfNeeded](self, "updateLabelIfNeeded");
  if (-[NSLayoutConstraint isActive](self->_textTrailingLayoutGuideWidthConstraint, "isActive"))
  {
    -[NavSignLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", -[NavSignLabel maxNumberOfLinesWithLongestAlternative](self, "maxNumberOfLinesWithLongestAlternative"), 0.0, 0.0, self->_width, 1.79769313e308);
    -[NSLayoutConstraint setConstant:](self->_textTrailingLayoutGuideWidthConstraint, "setConstant:", v6);
  }
}

- (UIFont)preferredFont
{
  return self->_preferredFont;
}

- (double)preferredFontMinimumScaleFactor
{
  return self->_preferredFontMinimumScaleFactor;
}

- (BOOL)perferredFontAdjustsFontSizeToFitWidth
{
  return self->_perferredFontAdjustsFontSizeToFitWidth;
}

- (UIFont)alternateFont
{
  return self->_alternateFont;
}

- (double)alternateFontLineSpacing
{
  return self->_alternateFontLineSpacing;
}

- (int64_t)maxNumberOfLinesWithPreferredFont
{
  return self->_maxNumberOfLinesWithPreferredFont;
}

- (int64_t)maxNumberOfLinesWithLongestAlternative
{
  return self->_maxNumberOfLinesWithLongestAlternative;
}

- (int64_t)maxNumberOfTotalLines
{
  return self->_maxNumberOfTotalLines;
}

- (int64_t)paragraphLineBreakMode
{
  return self->_paragraphLineBreakMode;
}

- (double)inlineShieldAlpha
{
  return self->_inlineShieldAlpha;
}

- (int64_t)inlineShieldSize
{
  return self->_inlineShieldSize;
}

- (NSArray)textAlternatives
{
  return self->_textAlternatives;
}

- (NSCache)stringCache
{
  return self->_stringCache;
}

- (void)setStringCache:(id)a3
{
  objc_storeStrong((id *)&self->_stringCache, a3);
}

- (BOOL)shouldRemoveTextStartingAtFirstNewline
{
  return self->_shouldRemoveTextStartingAtFirstNewline;
}

- (void)setShouldRemoveTextStartingAtFirstNewline:(BOOL)a3
{
  self->_shouldRemoveTextStartingAtFirstNewline = a3;
}

- (NavSignLabelDelegate)delegate
{
  return (NavSignLabelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stringCache, 0);
  objc_storeStrong((id *)&self->_textAlternatives, 0);
  objc_storeStrong((id *)&self->_alternateFont, 0);
  objc_storeStrong((id *)&self->_preferredFont, 0);
  objc_storeStrong((id *)&self->_textTrailingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_textTrailingLayoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_rangeFinder, 0);
}

@end
