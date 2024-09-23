@implementation PSFooterHyperlinkView

- (PSFooterHyperlinkView)initWithSpecifier:(id)a3
{
  id v4;
  PSFooterHyperlinkView *v5;
  PSFooterHyperlinkView *v6;

  v4 = a3;
  v5 = -[PSFooterHyperlinkView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[PSFooterHyperlinkView setupSubviewsAndContstraints](v5, "setupSubviewsAndContstraints");
    -[PSFooterHyperlinkView refreshContentsWithSpecifier:](v6, "refreshContentsWithSpecifier:", v4);
  }

  return v6;
}

- (void)refreshContentsWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSRange v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[PSFooterHyperlinkView setText:](self, "setText:", 0);
  -[PSFooterHyperlinkView setURL:](self, "setURL:", 0);
  objc_msgSend(v14, "propertyForKey:", CFSTR("headerFooterHyperlinkButtonTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PSFooterHyperlinkView setText:](self, "setText:", v4);
  }
  else
  {
    objc_msgSend(v14, "propertyForKey:", CFSTR("footerText"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSFooterHyperlinkView setText:](self, "setText:", v5);

  }
  objc_msgSend(v14, "propertyForKey:", CFSTR("headerFooterHyperlinkButtonURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterHyperlinkView setURL:](self, "setURL:", v6);

  objc_msgSend(v14, "propertyForKey:", CFSTR("footerHyperlinkRange"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = NSRangeFromString(v7);
    -[PSFooterHyperlinkView setLinkRange:](self, "setLinkRange:", v9.location, v9.length);
  }
  objc_msgSend(v14, "propertyForKey:", CFSTR("footerHyperlinkAction"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    -[PSFooterHyperlinkView setAction:](self, "setAction:", NSSelectorFromString(v10));
    objc_msgSend(v14, "propertyForKey:", CFSTR("footerHyperlinkTarget"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nonretainedObjectValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSFooterHyperlinkView setTarget:](self, "setTarget:", v13);

  }
  -[PSFooterHyperlinkView _linkify](self, "_linkify");

}

- (void)setupSubviewsAndContstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  v3 = objc_alloc_init(MEMORY[0x1E0CEAB18]);
  -[PSFooterHyperlinkView setTextView:](self, "setTextView:", v3);

  -[PSFooterHyperlinkView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterHyperlinkView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[PSFooterHyperlinkView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 0);

  -[PSFooterHyperlinkView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEditable:", 0);

  -[PSFooterHyperlinkView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectable:", 1);

  -[PSFooterHyperlinkView textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setScrollEnabled:", 0);

  -[PSFooterHyperlinkView textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLineFragmentPadding:", 0.0);

  v13 = *MEMORY[0x1E0CEB4B0];
  v14 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v15 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v16 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[PSFooterHyperlinkView textView](self, "textView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextContainerInset:", v13, v14, v15, v16);

  -[PSFooterHyperlinkView textView](self, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setInteractiveTextSelectionDisabled:", 1);

  -[PSFooterHyperlinkView textView](self, "textView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDelegate:", self);

  -[PSFooterHyperlinkView contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterHyperlinkView textView](self, "textView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  -[PSFooterHyperlinkView textView](self, "textView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterHyperlinkView contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layoutMarginsGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObject:", v27);

  -[PSFooterHyperlinkView textView](self, "textView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterHyperlinkView contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layoutMarginsGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObject:", v33);

  -[PSFooterHyperlinkView textView](self, "textView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterHyperlinkView contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layoutMarginsGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObject:", v39);

  -[PSFooterHyperlinkView textView](self, "textView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterHyperlinkView contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "layoutMarginsGuide");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObject:", v45);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v46);
}

- (void)setText:(id)a3
{
  BOOL v5;
  void *v6;
  NSString *text;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = -[NSString isEqualToString:](self->_text, "isEqualToString:", v10);
  v6 = v10;
  if (!v5)
  {
    objc_storeStrong((id *)&self->_text, a3);
    text = self->_text;
    -[PSFooterHyperlinkView textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", text);

    -[PSFooterHyperlinkView linkRange](self, "linkRange");
    if (v9)
      -[PSFooterHyperlinkView _linkify](self, "_linkify");
    -[PSFooterHyperlinkView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v6 = v10;
  }

}

- (void)setURL:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSURL isEqual:](self->_URL, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_URL, a3);
    -[PSFooterHyperlinkView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[PSFooterHyperlinkView _linkify](self, "_linkify");
  }

}

- (void)setLinkRange:(_NSRange)a3
{
  void *v5;

  if (self->_linkRange.location != a3.location || self->_linkRange.length != a3.length)
  {
    self->_linkRange = a3;
    -[PSFooterHyperlinkView text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[PSFooterHyperlinkView _linkify](self, "_linkify");
  }
}

- (void)_linkify
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  _BOOL4 IsAccessibilityCategory;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  -[PSFooterHyperlinkView text](self, "text");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PSFooterHyperlinkView linkRange](self, "linkRange");
    v6 = v5;

    if (v6)
    {
      +[PSListController appearance](PSListController, "appearance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "altTextColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        +[PSListController appearance](PSListController, "appearance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "altTextColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        PreferencesTableViewFooterColor();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }

      +[PSListController appearance](PSListController, "appearance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "footerHyperlinkColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        +[PSListController appearance](PSListController, "appearance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "footerHyperlinkColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[PSFooterHyperlinkView text](self, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      v17 = objc_alloc(MEMORY[0x1E0CB3778]);
      -[PSFooterHyperlinkView text](self, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithString:", v18);

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferredContentSizeCategory");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v21);

      if (IsAccessibilityCategory)
      {
        v23 = (void *)objc_opt_new();
        LODWORD(v24) = 1055286886;
        objc_msgSend(v23, "setHyphenationFactor:", v24);
        objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E0CEA0D0], v23, 0, v16);

      }
      v25 = *MEMORY[0x1E0CEA098];
      PreferencesTableViewFooterFont();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAttribute:value:range:", v25, v26, 0, v16);

      v27 = *MEMORY[0x1E0CEA0A0];
      -[PSFooterHyperlinkView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAttribute:value:range:", v27, v28, 0, v16);

      if (-[PSFooterHyperlinkView isValidLinkRange](self, "isValidLinkRange"))
      {
        -[PSFooterHyperlinkView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v14);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[PSFooterHyperlinkView linkRange](self, "linkRange");
        objc_msgSend(v19, "addAttribute:value:range:", v27, v29, v30, v31);

        v32 = *MEMORY[0x1E0CEA0C0];
        -[PSFooterHyperlinkView URL](self, "URL");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
          -[PSFooterHyperlinkView URL](self, "URL");
        else
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E4A69238);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[PSFooterHyperlinkView linkRange](self, "linkRange");
        objc_msgSend(v19, "addAttribute:value:range:", v32, v34, v35, v36);

        v37 = *MEMORY[0x1E0CEA180];
        v38 = -[PSFooterHyperlinkView linkRange](self, "linkRange");
        objc_msgSend(v19, "addAttribute:value:range:", v37, MEMORY[0x1E0C9AAA0], v38, v39);
      }
      -[PSFooterHyperlinkView textView](self, "textView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setAttributedText:", v19);

      if (v14)
      {
        v44 = v27;
        -[PSFooterHyperlinkView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v14);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSFooterHyperlinkView textView](self, "textView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setLinkTextAttributes:", v42);

      }
    }
  }
}

- (BOOL)isValidLinkRange
{
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  if (-[PSFooterHyperlinkView linkRange](self, "linkRange") == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v4 = -[PSFooterHyperlinkView linkRange](self, "linkRange");
  -[PSFooterHyperlinkView linkRange](self, "linkRange");
  v6 = v5 + v4;
  -[PSFooterHyperlinkView text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6 <= objc_msgSend(v7, "length");

  return v3;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  void *v6;
  void *v7;
  id v8;

  -[PSFooterHyperlinkView target](self, "target", a3, a4, a5.location, a5.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PSFooterHyperlinkView action](self, "action");
    -[PSFooterHyperlinkView target](self, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)SFPerformSelector();

  }
  return v6 == 0;
}

- (void)_accessibilitySetInterfaceStyleIntent:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSFooterHyperlinkView;
  -[PSFooterHyperlinkView _accessibilitySetInterfaceStyleIntent:](&v4, sel__accessibilitySetInterfaceStyleIntent_, a3);
  -[PSFooterHyperlinkView _linkify](self, "_linkify");
}

- (NSString)text
{
  return self->_text;
}

- (NSURL)URL
{
  return self->_URL;
}

- (_NSRange)linkRange
{
  _NSRange *p_linkRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_linkRange = &self->_linkRange;
  location = self->_linkRange.location;
  length = p_linkRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
