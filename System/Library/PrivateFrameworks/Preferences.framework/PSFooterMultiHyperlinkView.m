@implementation PSFooterMultiHyperlinkView

- (PSFooterMultiHyperlinkView)initWithSpecifier:(id)a3
{
  id v4;
  PSFooterMultiHyperlinkView *v5;
  PSFooterMultiHyperlinkView *v6;

  v4 = a3;
  v5 = -[PSFooterMultiHyperlinkView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
    -[PSFooterMultiHyperlinkView refreshContentsWithSpecifier:](v5, "refreshContentsWithSpecifier:", v4);

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
  void *v14;
  id v15;

  v15 = a3;
  -[PSFooterMultiHyperlinkView setupSubviewsAndContstraints](self, "setupSubviewsAndContstraints");
  objc_msgSend(v15, "propertyForKey:", CFSTR("headerFooterHyperlinkButtonTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PSFooterMultiHyperlinkView setText:](self, "setText:", v4);
  }
  else
  {
    objc_msgSend(v15, "propertyForKey:", CFSTR("footerText"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSFooterMultiHyperlinkView setText:](self, "setText:", v5);

  }
  objc_msgSend(v15, "propertyForKey:", CFSTR("headerFooterHyperlinkButtonURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterMultiHyperlinkView setURL:](self, "setURL:", v6);

  objc_msgSend(v15, "propertyForKey:", CFSTR("footerHyperlinkRange"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = NSRangeFromString(v7);
    -[PSFooterMultiHyperlinkView setLinkRange:](self, "setLinkRange:", v9.location, v9.length);
  }
  objc_msgSend(v15, "propertyForKey:", CFSTR("footerHyperlinkAction"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    -[PSFooterMultiHyperlinkView setAction:](self, "setAction:", NSSelectorFromString(v10));
    objc_msgSend(v15, "propertyForKey:", CFSTR("footerHyperlinkTarget"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nonretainedObjectValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSFooterMultiHyperlinkView setTarget:](self, "setTarget:", v13);

  }
  objc_msgSend(v15, "propertyForKey:", CFSTR("footerHyperlinkLinkSpecs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    -[PSFooterMultiHyperlinkView setLinkSpecs:](self, "setLinkSpecs:", v14);
  -[PSFooterMultiHyperlinkView _linkify](self, "_linkify");

}

- (void)setupSubviewsAndContstraints
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
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
  void *v46;
  id v47;

  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4 = objc_alloc_init(MEMORY[0x1E0CEAB18]);
  -[PSFooterMultiHyperlinkView setTextView:](self, "setTextView:", v4);

  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowsVerticalScrollIndicator:", 0);

  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEditable:", 0);

  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelectable:", 1);

  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScrollEnabled:", 0);

  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineFragmentPadding:", 0.0);

  v14 = *MEMORY[0x1E0CEB4B0];
  v15 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v16 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v17 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextContainerInset:", v14, v15, v16, v17);

  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setInteractiveTextSelectionDisabled:", 1);

  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);

  -[PSFooterMultiHyperlinkView contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v22);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterMultiHyperlinkView contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutMarginsGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObject:", v28);

  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterMultiHyperlinkView contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "layoutMarginsGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObject:", v34);

  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterMultiHyperlinkView contentView](self, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "layoutMarginsGuide");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObject:", v40);

  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSFooterMultiHyperlinkView contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "layoutMarginsGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObject:", v46);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v47);
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
    -[PSFooterMultiHyperlinkView textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", text);

    -[PSFooterMultiHyperlinkView linkRange](self, "linkRange");
    if (v9)
      -[PSFooterMultiHyperlinkView _linkify](self, "_linkify");
    -[PSFooterMultiHyperlinkView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
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
    -[PSFooterMultiHyperlinkView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[PSFooterMultiHyperlinkView _linkify](self, "_linkify");
  }

}

- (void)setLinkSpecs:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[PSFooterMultiHyperlinkView linkSpecs](self, "linkSpecs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v7);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_linkSpecs, a3);
    -[PSFooterMultiHyperlinkView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[PSFooterMultiHyperlinkView _linkify](self, "_linkify");
  }

}

- (void)setLinkRange:(_NSRange)a3
{
  void *v5;

  if (self->_linkRange.location != a3.location || self->_linkRange.length != a3.length)
  {
    self->_linkRange = a3;
    -[PSFooterMultiHyperlinkView text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[PSFooterMultiHyperlinkView _linkify](self, "_linkify");
  }
}

- (void)_linkify
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSArray *linkSpecs;
  void *v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSArray *v22;
  NSArray *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *rangeLinkSpecMap;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  NSMutableDictionary *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  void *v42;
  _QWORD v43[3];
  NSRange v44;

  v43[1] = *MEMORY[0x1E0C80C00];
  -[PSFooterMultiHyperlinkView text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  -[PSFooterMultiHyperlinkView linkRange](self, "linkRange");
  if (v4
    && (-[PSFooterMultiHyperlinkView URL](self, "URL"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = -[PSFooterMultiHyperlinkView linkRange](self, "linkRange");
    v8 = v7;
    -[PSFooterMultiHyperlinkView URL](self, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSFooterMultiHyperlinkViewLinkSpec specWithRange:url:](PSFooterMultiHyperlinkViewLinkSpec, "specWithRange:url:", v6, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    linkSpecs = self->_linkSpecs;
    if (!linkSpecs)
    {
      v43[0] = v10;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = (void **)v43;
LABEL_12:
      objc_msgSend(v12, "arrayWithObjects:count:", v13, 1);
      v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  else
  {
    -[PSFooterMultiHyperlinkView linkRange](self, "linkRange");
    if (!v14)
      goto LABEL_14;
    -[PSFooterMultiHyperlinkView target](self, "target");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_14;
    v16 = (void *)v15;
    v17 = -[PSFooterMultiHyperlinkView action](self, "action");

    if (!v17)
      goto LABEL_14;
    v18 = -[PSFooterMultiHyperlinkView linkRange](self, "linkRange");
    v20 = v19;
    -[PSFooterMultiHyperlinkView target](self, "target");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSFooterMultiHyperlinkViewLinkSpec specWithRange:target:action:](PSFooterMultiHyperlinkViewLinkSpec, "specWithRange:target:action:", v18, v20, v21, -[PSFooterMultiHyperlinkView action](self, "action"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    linkSpecs = self->_linkSpecs;
    if (!linkSpecs)
    {
      v42 = v10;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = &v42;
      goto LABEL_12;
    }
  }
  -[NSArray arrayByAddingObject:](linkSpecs, "arrayByAddingObject:", v10);
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v23 = self->_linkSpecs;
  self->_linkSpecs = v22;

LABEL_14:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  rangeLinkSpecMap = self->_rangeLinkSpecMap;
  self->_rangeLinkSpecMap = v24;

  v26 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[PSFooterMultiHyperlinkView text](self, "text");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithString:", v27);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[PSFooterMultiHyperlinkView linkSpecs](self, "linkSpecs", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v38 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v35 = self->_rangeLinkSpecMap;
        v44.location = objc_msgSend(v34, "linkRange");
        NSStringFromRange(v44);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setValue:forKey:](v35, "setValue:forKey:", v34, v36);

        -[PSFooterMultiHyperlinkView _addLinkSpec:toAttrStr:](self, "_addLinkSpec:toAttrStr:", v34, v28);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v31);
  }

}

- (void)_addLinkSpec:(id)a3 toAttrStr:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  _BOOL4 IsAccessibilityCategory;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[PSListController appearance](PSListController, "appearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "altTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[PSListController appearance](PSListController, "appearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "altTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PreferencesTableViewFooterColor();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  +[PSListController appearance](PSListController, "appearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "footerHyperlinkColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[PSListController appearance](PSListController, "appearance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "footerHyperlinkColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[PSFooterMultiHyperlinkView text](self, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "preferredContentSizeCategory");
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v19);

  if (IsAccessibilityCategory)
  {
    v21 = (void *)objc_opt_new();
    LODWORD(v22) = 1055286886;
    objc_msgSend(v21, "setHyphenationFactor:", v22);
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E0CEA0D0], v21, 0, v17);

  }
  v23 = *MEMORY[0x1E0CEA098];
  PreferencesTableViewFooterFont();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v23, v24, 0, v17);

  v25 = *MEMORY[0x1E0CEA0A0];
  -[PSFooterMultiHyperlinkView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v25, v26, 0, v17);

  v27 = objc_msgSend(v6, "linkRange");
  if (-[PSFooterMultiHyperlinkView isValidLinkRange:](self, "isValidLinkRange:", v27, v28))
  {
    -[PSFooterMultiHyperlinkView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v6, "linkRange");
    objc_msgSend(v7, "addAttribute:value:range:", v25, v29, v30, v31);

    v32 = *MEMORY[0x1E0CEA0C0];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E4A69238);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v6, "linkRange");
    objc_msgSend(v7, "addAttribute:value:range:", v32, v33, v34, v35);

    v36 = *MEMORY[0x1E0CEA180];
    v37 = objc_msgSend(v6, "linkRange");
    objc_msgSend(v7, "addAttribute:value:range:", v36, MEMORY[0x1E0C9AAA0], v37, v38);
  }
  -[PSFooterMultiHyperlinkView textView](self, "textView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAttributedText:", v7);

  if (v15)
  {
    v43 = v25;
    -[PSFooterMultiHyperlinkView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v15);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSFooterMultiHyperlinkView textView](self, "textView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setLinkTextAttributes:", v41);

  }
}

- (BOOL)isValidLinkRange:(_NSRange)a3
{
  BOOL v3;
  NSUInteger v4;
  void *v5;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v4 = a3.location + a3.length;
  -[PSFooterMultiHyperlinkView text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 <= objc_msgSend(v5, "length");

  return v3;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSMutableDictionary *rangeLinkSpecMap;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  rangeLinkSpecMap = self->_rangeLinkSpecMap;
  NSStringFromRange(a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary valueForKey:](rangeLinkSpecMap, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "action");
    objc_msgSend(v8, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)SFPerformSelector();

  }
  return v9 == 0;
}

- (void)_accessibilitySetInterfaceStyleIntent:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSFooterMultiHyperlinkView;
  -[PSFooterMultiHyperlinkView _accessibilitySetInterfaceStyleIntent:](&v4, sel__accessibilitySetInterfaceStyleIntent_, a3);
  -[PSFooterMultiHyperlinkView _linkify](self, "_linkify");
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

- (NSArray)linkSpecs
{
  return self->_linkSpecs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkSpecs, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_rangeLinkSpecMap, 0);
}

@end
