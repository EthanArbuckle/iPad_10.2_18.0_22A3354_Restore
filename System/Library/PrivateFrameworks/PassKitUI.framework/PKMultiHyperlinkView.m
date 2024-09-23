@implementation PKMultiHyperlinkView

- (void)pk_applyAppearance:(id)a3
{
  id v4;

  objc_msgSend(a3, "footerHyperlinkColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMultiHyperlinkView setLinkTextColor:](self, "setLinkTextColor:", v4);

}

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (PKMultiHyperlinkView)init
{
  return -[PKMultiHyperlinkView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKMultiHyperlinkView)initWithFrame:(CGRect)a3
{
  PKMultiHyperlinkView *v3;
  uint64_t v4;
  UITextView *textView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKMultiHyperlinkView;
  v3 = -[PKMultiHyperlinkView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v4 = objc_claimAutoreleasedReturnValue();
    textView = v3->_textView;
    v3->_textView = (UITextView *)v4;

    -[UITextView setDelegate:](v3->_textView, "setDelegate:", v3);
    -[UITextView setSelectable:](v3->_textView, "setSelectable:", 1);
    -[UITextView setUserInteractionEnabled:](v3->_textView, "setUserInteractionEnabled:", 1);
    -[UITextView _setInteractiveTextSelectionDisabled:](v3->_textView, "_setInteractiveTextSelectionDisabled:", 1);
    v3->_textAlignment = -[UITextView textAlignment](v3->_textView, "textAlignment");
    -[PKMultiHyperlinkView addSubview:](v3, "addSubview:", v3->_textView);
    -[PKMultiHyperlinkView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CF8]);
  }
  return v3;
}

- (void)setText:(id)a3
{
  id v5;
  NSString *text;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  text = self->_text;
  v9 = (NSString *)v5;
  v7 = text;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_text, a3);
    -[PKMultiHyperlinkView _updateText](self, "_updateText");
  }
LABEL_9:

}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[PKMultiHyperlinkView _updateText](self, "_updateText");
  }
}

- (void)setSources:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sources, a3);
    -[PKMultiHyperlinkView _updateText](self, "_updateText");
  }

}

- (void)setTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[PKMultiHyperlinkView _updateText](self, "_updateText");
  }

}

- (void)setLinkTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_linkTextColor, a3);
    -[PKMultiHyperlinkView _updateText](self, "_updateText");
  }

}

- (void)setTextFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textFont, a3);
    -[PKMultiHyperlinkView _updateText](self, "_updateText");
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKMultiHyperlinkView;
  -[PKMultiHyperlinkView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKMultiHyperlinkView bounds](self, "bounds");
  -[PKMultiHyperlinkView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKMultiHyperlinkView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width;
  double y;
  double x;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = -[PKMultiHyperlinkView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", width, 1.79769313e308);
  v11 = v10;
  if (!a4)
  {
    v12 = x + width - width;
    if (!v9)
      v12 = x;
    -[UITextView setFrame:](self->_textView, "setFrame:", v12, y, width, v10);
  }
  v13 = width;
  v14 = v11;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)_rangesForTag:(id)a3 inText:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[/%@]"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "rangeOfString:", v7);
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    do
    {
      objc_msgSend(v6, "replaceCharactersInRange:withString:", v9, v11, &stru_1E3E7D690);
      v14 = objc_msgSend(v6, "rangeOfString:", v8);
      v11 = 0;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      if (v14 != 0x7FFFFFFFFFFFFFFFLL && v14 > v9)
      {
        v16 = v13;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v9, v14 - v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v17);

        objc_msgSend(v6, "replaceCharactersInRange:withString:", v14, v16, &stru_1E3E7D690);
        v15 = objc_msgSend(v6, "rangeOfString:", v7);
        v11 = v18;
      }
      v9 = v15;
    }
    while (v15 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v19 = (void *)objc_msgSend(v12, "copy");

  return v19;
}

- (void)_updateText
{
  void *v3;
  UIColor *textColor;
  UIColor *v5;
  UIColor *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  PKMultiHyperlinkView *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  UIFont *textFont;
  UITextView *textView;
  UIColor *linkTextColor;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  UIColor *v53;
  void *v54;
  PKMultiHyperlinkView *v55;
  NSArray *obj;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  void *v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;
  _QWORD v76[3];

  v76[1] = *MEMORY[0x1E0C80C00];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], (void *)*MEMORY[0x1E0DC48D8], 0x8000, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  textColor = self->_textColor;
  if (textColor)
  {
    v5 = textColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3D78], "_defaultTextColorForTableViewStyle:isSectionHeader:", 1, 0);
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = (void *)-[NSString mutableCopy](self->_text, "mutableCopy");
  -[PKMultiHyperlinkView _rangesForTag:inText:](self, "_rangesForTag:inText:", CFSTR("indent"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultiHyperlinkView _rangesForTag:inText:](self, "_rangesForTag:inText:", CFSTR("secondary"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC1140];
  v75 = *MEMORY[0x1E0DC1140];
  v76[0] = v6;
  v53 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v7;
  v54 = v3;
  PKAttributedStringByParsingEmphasisInString(v7, v3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v14 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v14, "setHeadIndent:", 15.0);
  objc_msgSend(v14, "setFirstLineHeadIndent:", 0.0);
  objc_msgSend(v14, "setParagraphSpacing:", 2.0);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v67;
    v19 = *MEMORY[0x1E0DC1178];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v67 != v18)
          objc_enumerationMutation(v15);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "rangeValue");
        objc_msgSend(v13, "addAttribute:value:range:", v19, v14, v21, v22);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    }
    while (v17);
  }
  v55 = self;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v23 = v9;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v63 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "rangeValue");
        objc_msgSend(v13, "addAttribute:value:range:", v10, v29, v30, v31);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    }
    while (v25);
  }
  v50 = v10;
  v51 = v15;
  v52 = v14;
  v49 = v23;

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v32 = v55;
  obj = v55->_sources;
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v59;
    v36 = *MEMORY[0x1E0DC1160];
    v37 = *MEMORY[0x1E0DC1248];
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v59 != v35)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * k), "linkText");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v57, "rangeOfString:", v39);
        v42 = v41;
        if (-[PKMultiHyperlinkView _isLinkRangeValid:](v32, "_isLinkRangeValid:", v40, v41))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E3E7D690);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addAttribute:value:range:", v36, v43, v40, v42);

          v32 = v55;
          objc_msgSend(v13, "addAttribute:value:range:", v37, MEMORY[0x1E0C9AAA0], v40, v42);
        }

      }
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    }
    while (v34);
  }

  textFont = v32->_textFont;
  if (textFont)
    objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], textFont, 0, objc_msgSend(v57, "length"));
  -[UITextView setAttributedText:](v32->_textView, "setAttributedText:", v13);
  textView = v32->_textView;
  v70 = v50;
  linkTextColor = v32->_linkTextColor;
  v47 = linkTextColor;
  if (!linkTextColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v71 = v47;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setLinkTextAttributes:](textView, "setLinkTextAttributes:", v48);

  if (!linkTextColor)
  -[UITextView setTextAlignment:](v55->_textView, "setTextAlignment:", v55->_textAlignment);
  -[PKMultiHyperlinkView setNeedsLayout](v55, "setNeedsLayout");

}

- (BOOL)_isLinkRangeValid:(_NSRange)a3
{
  return a3.location != 0x7FFFFFFFFFFFFFFFLL
      && a3.length != 0
      && a3.location + a3.length <= -[NSString length](self->_text, "length");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSUInteger location;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  void *v20;
  NSArray *obj;
  NSUInteger range2;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  NSRange v30;
  NSRange v31;

  range2 = a5.length;
  location = a5.location;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_sources;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "linkText");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "text");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "rangeOfString:", v14);
        v18 = v17;

        v30.location = v16;
        v30.length = v18;
        v31.location = location;
        v31.length = range2;
        if (NSIntersectionRange(v30, v31).length)
        {
          objc_msgSend(v13, "action");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          if (v19)
            (*(void (**)(uint64_t))(v19 + 16))(v19);

        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  return 0;
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (UIFont)textFont
{
  return self->_textFont;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_textFont, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
