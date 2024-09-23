@implementation PXCaptionHashtagsEntryView

- (PXCaptionHashtagsEntryView)initWithFrame:(CGRect)a3
{
  PXCaptionHashtagsEntryView *v3;
  void *v4;
  int v5;
  _PXUITextView *v6;
  uint64_t v7;
  _PXUITextView *textView;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  _PXUITextView *v19;
  void *v20;
  _PXUITextView *v21;
  void *v22;
  uint64_t v23;
  UIButton *moreButton;
  UIButton *v25;
  void *v26;
  UIButton *v27;
  void *v28;
  void *v29;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)PXCaptionHashtagsEntryView;
  v3 = -[PXCaptionHashtagsEntryView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "captionWidgetEnableHashtags");

    v6 = [_PXUITextView alloc];
    v7 = -[_PXUITextView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textView = v3->_textView;
    v3->_textView = (_PXUITextView *)v7;

    -[_PXUITextView setDelegate:](v3->_textView, "setDelegate:", v3);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXUITextView setTextColor:](v3->_textView, "setTextColor:", v9);

    v36 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXUITextView setLinkTextAttributes:](v3->_textView, "setLinkTextAttributes:", v11);

    if (v5)
      v12 = 9;
    else
      v12 = 0;
    -[_PXUITextView setKeyboardType:](v3->_textView, "setKeyboardType:", v12);
    -[_PXUITextView setEditable:](v3->_textView, "setEditable:", 0);
    -[_PXUITextView setDataDetectorTypes:](v3->_textView, "setDataDetectorTypes:", 2);
    -[_PXUITextView setScrollEnabled:](v3->_textView, "setScrollEnabled:", 0);
    -[_PXUITextView layoutManager](v3->_textView, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsNonContiguousLayout:", 1);

    -[_PXUITextView setShowsHorizontalScrollIndicator:](v3->_textView, "setShowsHorizontalScrollIndicator:", 0);
    -[_PXUITextView setShowsVerticalScrollIndicator:](v3->_textView, "setShowsVerticalScrollIndicator:", 0);
    -[_PXUITextView textContainerInset](v3->_textView, "textContainerInset");
    v31 = v14;
    v32 = v15;
    v33 = v16;
    v34 = v17;
    -[_PXUITextView font](v3->_textView, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CTFontGetLanguageAwareOutsets();

    -[_PXUITextView setTextContainerInset:](v3->_textView, "setTextContainerInset:", v31, v32, v33, v34);
    v19 = v3->_textView;
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel__handleEscape_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXUITextView addKeyCommand:](v19, "addKeyCommand:", v20);

    v21 = v3->_textView;
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x100000, sel__handleReturn_);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXUITextView addKeyCommand:](v21, "addKeyCommand:", v22);

    -[PXCaptionHashtagsEntryView addSubview:](v3, "addSubview:", v3->_textView);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v23 = objc_claimAutoreleasedReturnValue();
    moreButton = v3->_moreButton;
    v3->_moreButton = (UIButton *)v23;

    v25 = v3->_moreButton;
    PXLocalizedStringFromTable(CFSTR("PXWidgetCaptionAndHashtagsMoreTitle"), CFSTR("PhotosUICore"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v25, "setTitle:forState:", v26, 0);

    v27 = v3->_moreButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v27, "setTitleColor:forState:", v28, 0);

    -[UIButton addTarget:action:forControlEvents:](v3->_moreButton, "addTarget:action:forControlEvents:", v3, sel_moreButtonTapped_, 64);
    -[PXCaptionHashtagsEntryView insertSubview:aboveSubview:](v3, "insertSubview:aboveSubview:", v3->_moreButton, v3->_textView);
    -[PXCaptionHashtagsEntryView _updateFonts](v3, "_updateFonts");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v3, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v4;

  -[PXCaptionHashtagsEntryView _updateFonts](self, "_updateFonts", a3);
  -[PXCaptionHashtagsEntryView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captionHashtagsEntryViewPreferredHeightDidChange:", self);

}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double result;

  v3 = a3;
  if (a3 == 0.0)
  {
    -[PXCaptionHashtagsEntryView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v3 = v6;

  }
  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lineFragmentPadding");
  v10 = v9;

  -[PXCaptionHashtagsEntryView _preferredHeight:forWidth:](self, "_preferredHeight:forWidth:", 0, v3 + v10 * 2.0);
  return result;
}

- (double)minimumHeightInEdit
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCaptionHashtagsEntryView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");

  objc_msgSend(v3, "textContainerInset");
  objc_msgSend(v3, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  PXFloatCeilingToPixel();
  v7 = v6;

  -[PXCaptionHashtagsEntryView _maxHeight](self, "_maxHeight");
  PXFloatCeilingToPixel();
  v9 = v8;
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "sizeThatFits:", v10, v11);
  v13 = v12;
  PXFloatCeilingToPixel();
  if (v7 >= v13)
    v15 = v7;
  else
    v15 = v13;
  if (v14 <= v9)
    v16 = v15;
  else
    v16 = v9;

  return v16;
}

- (UIEdgeInsets)textContainerInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textContainerInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (NSString)text
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E5149688;
  v5 = v3;

  return v5;
}

- (void)setOriginalText:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *v7;
  NSString *originalText;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSString *v13;

  v13 = (NSString *)a3;
  v4 = self->_originalText;
  if (v4 == v13)
  {

LABEL_9:
    v6 = v13;
    goto LABEL_10;
  }
  v5 = -[NSString isEqualToString:](v13, "isEqualToString:", v4);

  v6 = v13;
  if (!v5)
  {
    v7 = (NSString *)-[NSString copy](v13, "copy");
    originalText = self->_originalText;
    self->_originalText = v7;

    if (v13 && -[NSString length](v13, "length"))
    {
      PXLocalizedStringFromTable(CFSTR("PXWidgetCaptionAndHashtagsAXLabel"), CFSTR("PhotosUICore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXUITextView setAccessibilityLabel:](self->_textView, "setAccessibilityLabel:", v9);

    }
    -[PXCaptionHashtagsEntryView textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", self->_originalText) & 1) != 0)
    {

    }
    else
    {
      v12 = -[PXCaptionHashtagsEntryView isEditing](self, "isEditing");

      v6 = v13;
      if (v12)
        goto LABEL_10;
      -[PXCaptionHashtagsEntryView resetToOriginalText](self, "resetToOriginalText");
    }
    goto LABEL_9;
  }
LABEL_10:

}

- (void)setSpec:(id)a3
{
  PXWidgetSpec *v5;
  void *v6;
  void *v7;
  PXWidgetSpec *v8;

  v5 = (PXWidgetSpec *)a3;
  if (self->_spec != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCaptionHashtagsEntryView textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[PXCaptionHashtagsEntryView _updateFonts](self, "_updateFonts");
    v5 = v8;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  int64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  _BOOL4 v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD *v60;
  uint64_t *v61;
  uint64_t *v62;
  int64_t v63;
  double v64;
  BOOL v65;
  uint64_t v66;
  double *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  __CFString *v75;
  _QWORD v76[4];
  _QWORD v77[4];
  id v78;
  double v79;
  uint64_t v80;
  double v81;
  CGFloat v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  -[PXCaptionHashtagsEntryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  if ((PXSizeIsEmpty() & 1) == 0)
  {
    -[PXCaptionHashtagsEntryView textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCaptionHashtagsEntryView moreButton](self, "moreButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCaptionHashtagsEntryView textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lineFragmentPadding");
    v12 = v11;

    v13 = v4 + v12 * 2.0;
    v14 = -v12;
    v15 = (void *)MEMORY[0x1E0DC3F10];
    v16 = MEMORY[0x1E0C809B0];
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __44__PXCaptionHashtagsEntryView_layoutSubviews__block_invoke;
    v77[3] = &unk_1E51490B0;
    v17 = v7;
    v78 = v17;
    v79 = -v12;
    v80 = 0;
    v81 = v13;
    v82 = v6;
    objc_msgSend(v15, "performWithoutAnimation:", v77);
    v18 = -[PXCaptionHashtagsEntryView isEditing](self, "isEditing");
    if (!v18)
    {
      objc_msgSend(v17, "text");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCaptionHashtagsEntryView originalText](self, "originalText");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      if ((v21 & 1) == 0)
      {
        -[PXCaptionHashtagsEntryView originalText](self, "originalText");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setText:", v22);

      }
    }
    v23 = -[PXCaptionHashtagsEntryView _shouldShowMoreButton](self, "_shouldShowMoreButton");
    if (v23)
    {
      objc_msgSend(v8, "sizeToFit");
      objc_msgSend(v8, "layoutIfNeeded");
      objc_msgSend(v8, "titleLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "frame");
      v26 = v25;

      objc_msgSend(v8, "frame");
      v28 = v27;
      v30 = v29;
      v31 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXCaptionHashtagsEntryView semanticContentAttribute](self, "semanticContentAttribute"));
      v32 = v12;
      if (!v31)
      {
        v83.origin.y = 0.0;
        v83.origin.x = -v12;
        v83.size.width = v13;
        v83.size.height = v6;
        v32 = CGRectGetMaxX(v83) - v28 - v12;
      }
      v56 = v18;
      v84.origin.y = 0.0;
      v84.origin.x = -v12;
      v84.size.width = v13;
      v84.size.height = v6;
      objc_msgSend(v8, "setFrame:", v32, v26 + CGRectGetMaxY(v84) - v30, v28, v30);
      -[PXCaptionHashtagsEntryView _ellipsisWidth](self, "_ellipsisWidth");
      v34 = v33;
      v35 = v12 + v28 + 16.0 + v33;
      v36 = v16;
      if (!v31)
      {
        v85.origin.y = 0.0;
        v85.origin.x = v14;
        v85.size.width = v13;
        v85.size.height = v6;
        v35 = CGRectGetWidth(v85) - v35;
      }
      objc_msgSend(v17, "text");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[PXCaptionHashtagsEntryView _currentMaxLines](self, "_currentMaxLines");
      v76[0] = 0;
      v76[1] = v76;
      v76[2] = 0x2020000000;
      v76[3] = 1;
      v70 = 0;
      v71 = &v70;
      v72 = 0x3032000000;
      v73 = __Block_byref_object_copy__147479;
      v74 = __Block_byref_object_dispose__147480;
      v75 = CFSTR("…");
      objc_msgSend(v17, "layoutManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "numberOfGlyphs");
      v66 = 0;
      v67 = (double *)&v66;
      v68 = 0x2020000000;
      v69 = 0;
      v57[0] = v36;
      v57[1] = 3221225472;
      v57[2] = __44__PXCaptionHashtagsEntryView_layoutSubviews__block_invoke_267;
      v57[3] = &unk_1E512DD80;
      v63 = v38;
      v60 = v76;
      v61 = &v66;
      v41 = v39;
      v58 = v41;
      v65 = v31 == 0;
      v64 = v35;
      v42 = v37;
      v59 = v42;
      v62 = &v70;
      objc_msgSend(v41, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v40, v57);
      objc_msgSend(v17, "setText:", v71[5]);
      objc_msgSend(v8, "frame");
      v18 = v56;
      v44 = v43;
      v46 = v45;
      v48 = v47;
      v49 = 0;
      v50 = v14;
      v51 = v13;
      v52 = v6;
      if (v31)
        v53 = CGRectGetMinX(*(CGRect *)&v50) + v67[3] - v34 + -16.0 - v28;
      else
        v53 = v34 + CGRectGetMinX(*(CGRect *)&v50) + v67[3] + 16.0;
      objc_msgSend(v8, "setFrame:", v53, v44, v46, v48);

      _Block_object_dispose(&v66, 8);
      _Block_object_dispose(&v70, 8);

      _Block_object_dispose(v76, 8);
    }
    objc_msgSend(v8, "setHidden:", !v23);
    if (v18)
    {
      LOBYTE(v70) = 0;
      -[PXCaptionHashtagsEntryView _preferredHeight:](self, "_preferredHeight:", &v70);
      objc_msgSend(v17, "setScrollEnabled:", (_BYTE)v70 == 0);
      if (objc_msgSend(v17, "isScrollEnabled"))
      {
        v54 = objc_msgSend(v17, "selectedRange");
        objc_msgSend(v17, "scrollRangeToVisible:", v54, v55);
      }
    }

  }
}

- (void)exitEditing
{
  id v2;

  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)resetToOriginalText
{
  void *v3;
  void *v4;

  -[PXCaptionHashtagsEntryView originalText](self, "originalText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[PXCaptionHashtagsEntryView _addLinkAttributeToHashtagsInTextView](self, "_addLinkAttributeToHashtagsInTextView");
}

- (void)moreButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[PXCaptionHashtagsEntryView _hideShowButton](self, "_hideShowButton", a3);
  -[PXCaptionHashtagsEntryView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captionHashtagsEntryViewRequestFocus:", self);

  -[PXCaptionHashtagsEntryView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captionHashtagsEntryViewPreferredHeightDidChange:", self);

}

- (BOOL)isEditing
{
  void *v2;
  char v3;

  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (void)setFont:(id)a3
{
  UIFont *v5;
  char v6;
  UIFont *v7;

  v7 = (UIFont *)a3;
  v5 = self->_font;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[UIFont isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_font, a3);
      -[PXCaptionHashtagsEntryView setCachedEllipsisWidth:](self, "setCachedEllipsisWidth:", 0.0);
    }
  }

}

- (void)_handleEscape:(id)a3
{
  -[PXCaptionHashtagsEntryView resetToOriginalText](self, "resetToOriginalText", a3);
  -[PXCaptionHashtagsEntryView exitEditing](self, "exitEditing");
}

- (double)_ellipsisWidth
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[PXCaptionHashtagsEntryView cachedEllipsisWidth](self, "cachedEllipsisWidth");
  v4 = v3;
  -[PXCaptionHashtagsEntryView cachedEllipsisWidth](self, "cachedEllipsisWidth");
  if (v5 == 0.0)
  {
    v10 = *MEMORY[0x1E0DC1138];
    -[PXCaptionHashtagsEntryView font](self, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("…"), "sizeWithAttributes:", v7);
    v4 = v8;

    -[PXCaptionHashtagsEntryView setCachedEllipsisWidth:](self, "setCachedEllipsisWidth:", v4);
  }
  return v4;
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A85CC970](8, 0x8000, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCaptionHashtagsEntryView setFont:](self, "setFont:", v3);
  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  -[PXCaptionHashtagsEntryView moreButton](self, "moreButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v3);

  -[PXCaptionHashtagsEntryView spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sizeClass");

  if (v8 == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v3)
  {
    v11 = *MEMORY[0x1E0DC1140];
    v17[0] = *MEMORY[0x1E0DC1138];
    v17[1] = v11;
    v18[0] = v3;
    v18[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  PXLocalizedStringFromTable(CFSTR("PXWidgetCaptionAndHashtagsPlaceholderTitle"), CFSTR("PhotosUICore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v12);
  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAttributedPlaceholder:", v15);

}

- (void)_addLinkAttributeToHashtagsInTextView
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "captionWidgetEnableHashtags");

  if (v4)
  {
    -[PXCaptionHashtagsEntryView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
    {
      -[PXCaptionHashtagsEntryView textView](self, "textView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "removeAttribute:range:", *MEMORY[0x1E0DC1160], 0, objc_msgSend(v7, "length"));
      PLParseHashtags();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __67__PXCaptionHashtagsEntryView__addLinkAttributeToHashtagsInTextView__block_invoke;
      v11[3] = &unk_1E512DDA8;
      v12 = v7;
      v9 = v7;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);
      self->_numberOfHashtagsInText = objc_msgSend(v8, "count");

    }
  }
}

- (void)_removeLinkAttributeInTextView
{
  void *v2;
  uint64_t v3;
  id v4;

  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textStorage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v4, "length");
  objc_msgSend(v4, "removeAttribute:range:", *MEMORY[0x1E0DC1160], 0, v3);

}

- (int64_t)_currentMaxLines
{
  void *v2;
  uint64_t v3;

  -[PXCaptionHashtagsEntryView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verticalSizeClass");

  if (v3 == 1)
    return 2;
  else
    return 3;
}

- (double)_maxHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContainerInset");
  v5 = v4;
  v7 = v6;

  v8 = v5 + v7;
  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lineHeight");
  v12 = v11;

  return v8 + v12 * (double)-[PXCaptionHashtagsEntryView _currentMaxLines](self, "_currentMaxLines");
}

- (double)_preferredHeight:(BOOL *)a3
{
  double result;

  -[PXCaptionHashtagsEntryView _preferredHeight:forWidth:](self, "_preferredHeight:forWidth:", a3, 0.0);
  return result;
}

- (double)_preferredHeight:(BOOL *)a3 forWidth:(double)a4
{
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;

  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXCaptionHashtagsEntryView isEditing](self, "isEditing");
  if (v8
    || (objc_msgSend(v7, "text"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PXCaptionHashtagsEntryView originalText](self, "originalText"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "isEqualToString:", v10),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v7, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCaptionHashtagsEntryView originalText](self, "originalText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v13);

  }
  objc_msgSend(v7, "layoutManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ensureLayoutForTextContainer:", v15);

  objc_msgSend(v7, "layoutIfNeeded");
  -[PXCaptionHashtagsEntryView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayScale");

  objc_msgSend(v7, "textContainerInset");
  objc_msgSend(v7, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lineHeight");
  PXFloatCeilingToPixel();
  v19 = v18;

  -[PXCaptionHashtagsEntryView _maxHeight](self, "_maxHeight");
  PXFloatCeilingToPixel();
  v21 = v20;
  objc_msgSend(v7, "frame");
  if (a4 == 0.0)
    v24 = v22;
  else
    v24 = a4;
  objc_msgSend(v7, "sizeThatFits:", v24, v23);
  v26 = v25;
  PXFloatCeilingToPixel();
  v28 = v27;
  if (v8)
  {
    -[PXCaptionHashtagsEntryView maxHeightInEditMode](self, "maxHeightInEditMode");
    if (v29 == 0.0)
      -[PXCaptionHashtagsEntryView setMaxHeightInEditMode:](self, "setMaxHeightInEditMode:", v26);
    -[PXCaptionHashtagsEntryView maxHeightInEditMode](self, "maxHeightInEditMode");
    if (v19 >= v30)
      v30 = v19;
    -[PXCaptionHashtagsEntryView setMaxHeightInEditMode:](self, "setMaxHeightInEditMode:", v30);
    -[PXCaptionHashtagsEntryView maxHeightInEditMode](self, "maxHeightInEditMode");
    PXFloatCeilingToPixel();
    v32 = v28 <= v31;
    if (v28 > v31)
      v26 = v31;
  }
  else
  {
    if (-[PXCaptionHashtagsEntryView showAllText](self, "showAllText"))
      goto LABEL_21;
    if (v28 < v19)
    {
      v32 = 1;
      v26 = v19;
      goto LABEL_22;
    }
    if (v28 <= v21)
    {
LABEL_21:
      v32 = 1;
    }
    else
    {
      v32 = 0;
      v26 = v21;
    }
  }
LABEL_22:
  if (a3)
    *a3 = v32;
  if (v12)
    objc_msgSend(v7, "setText:", v12);

  return v26;
}

- (BOOL)_shouldShowMoreButton
{
  char v4;

  if (-[PXCaptionHashtagsEntryView showAllText](self, "showAllText"))
    return 0;
  v4 = 0;
  -[PXCaptionHashtagsEntryView _preferredHeight:](self, "_preferredHeight:", &v4);
  return v4 == 0;
}

- (BOOL)_needsUpdateSize:(BOOL *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  -[PXCaptionHashtagsEntryView _preferredHeight:](self, "_preferredHeight:", a3);
  -[PXCaptionHashtagsEntryView frame](self, "frame");
  -[PXCaptionHashtagsEntryView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");

  PXFloatRoundToPixel();
  v6 = v5;
  PXFloatRoundToPixel();
  return v6 != v7;
}

- (void)_hideShowButton
{
  id v3;

  -[PXCaptionHashtagsEntryView setShowAllText:](self, "setShowAllText:", 1);
  -[PXCaptionHashtagsEntryView moreButton](self, "moreButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

- (void)textViewDidChange:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;
  char v8;

  if (-[PXCaptionHashtagsEntryView isEditing](self, "isEditing", a3))
  {
    v8 = 1;
    if (-[PXCaptionHashtagsEntryView _needsUpdateSize:](self, "_needsUpdateSize:", &v8))
    {
      -[PXCaptionHashtagsEntryView delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "captionHashtagsEntryViewPreferredHeightDidChange:", self);

    }
    v5 = v8 == 0;
    -[PXCaptionHashtagsEntryView textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScrollEnabled:", v5);

  }
  else
  {
    -[PXCaptionHashtagsEntryView _addLinkAttributeToHashtagsInTextView](self, "_addLinkAttributeToHashtagsInTextView");
    -[PXCaptionHashtagsEntryView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "captionHashtagsEntryViewDidEndEditing:", self);

  }
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  BOOL v14;

  v4 = a3;
  -[PXCaptionHashtagsEntryView delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[PXCaptionHashtagsEntryView delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "captionHashtagsEntryViewShouldBeginEditing:", self),
        v7,
        v6,
        !v8))
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v4, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCaptionHashtagsEntryView originalText](self, "originalText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      -[PXCaptionHashtagsEntryView originalText](self, "originalText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setText:", v12);

    }
    -[PXCaptionHashtagsEntryView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "captionHashtagsEntryViewWillBeginEditing:", self);

    v14 = 1;
  }

  return v14;
}

- (BOOL)textViewShouldEndEditing:(id)a3
{
  PXCaptionHashtagsEntryView *v3;
  void *v4;

  v3 = self;
  -[PXCaptionHashtagsEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "captionHashtagsEntryViewShouldEndEditing:", v3);

  return (char)v3;
}

- (void)textViewDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  char v12;

  -[PXCaptionHashtagsEntryView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captionHashtagsEntryViewDidBeginEditing:", self);

  -[PXCaptionHashtagsEntryView _hideShowButton](self, "_hideShowButton");
  -[PXCaptionHashtagsEntryView _removeLinkAttributeInTextView](self, "_removeLinkAttributeInTextView");
  v5 = (void *)MEMORY[0x1E0C99E08];
  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "typingAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObjectForKey:", *MEMORY[0x1E0DC1160]);
  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTypingAttributes:", v8);

  v12 = 1;
  -[PXCaptionHashtagsEntryView _preferredHeight:](self, "_preferredHeight:", &v12);
  v10 = v12 == 0;
  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScrollEnabled:", v10);

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[PXCaptionHashtagsEntryView textView](self, "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PXCaptionHashtagsEntryView textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEditable:", 0);

    -[PXCaptionHashtagsEntryView text](self, "text");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[PXCaptionHashtagsEntryView text](self, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        PXLocalizedStringFromTable(CFSTR("PXWidgetCaptionAndHashtagsAXLabel"), CFSTR("PhotosUICore"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXCaptionHashtagsEntryView textView](self, "textView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAccessibilityLabel:", v11);

      }
    }
    -[PXCaptionHashtagsEntryView _addLinkAttributeToHashtagsInTextView](self, "_addLinkAttributeToHashtagsInTextView");
    -[PXCaptionHashtagsEntryView delegate](self, "delegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "captionHashtagsEntryViewDidEndEditing:", self);

  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return a6 == 0;
}

- (PXCaptionHashtagsEntryViewDelegate)delegate
{
  return (PXCaptionHashtagsEntryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)originalText
{
  return self->_originalText;
}

- (double)maxHeightInEditMode
{
  return self->_maxHeightInEditMode;
}

- (void)setMaxHeightInEditMode:(double)a3
{
  self->_maxHeightInEditMode = a3;
}

- (unint64_t)numberOfHashtagsInText
{
  return self->_numberOfHashtagsInText;
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (_PXUITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (BOOL)showAllText
{
  return self->_showAllText;
}

- (void)setShowAllText:(BOOL)a3
{
  self->_showAllText = a3;
}

- (UIFont)font
{
  return self->_font;
}

- (double)cachedEllipsisWidth
{
  return self->_cachedEllipsisWidth;
}

- (void)setCachedEllipsisWidth:(double)a3
{
  self->_cachedEllipsisWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __67__PXCaptionHashtagsEntryView__addLinkAttributeToHashtagsInTextView__block_invoke(uint64_t a1, NSString *a2, void *a3)
{
  id v5;
  NSRange v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = NSRangeFromString(a2);
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("photos-navigation://search?hashtag=%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v12 = *(void **)(a1 + 32);
      v14 = *MEMORY[0x1E0DC1160];
      v15[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAttributes:range:", v13, v6.location, v6.length);

    }
  }

}

uint64_t __44__PXCaptionHashtagsEntryView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __44__PXCaptionHashtagsEntryView_layoutSubviews__block_invoke_267(uint64_t a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, uint64_t a10, unint64_t a11, uint64_t a12, _BYTE *a13)
{
  uint64_t v13;
  uint64_t v14;
  BOOL v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  double *v29;
  double v30;
  uint64_t v31;
  double v32;
  CGRect v33;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(_QWORD *)(v13 + 24);
  if (v14 != *(_QWORD *)(a1 + 72))
    goto LABEL_12;
  v33.origin.x = a6;
  v33.origin.y = a7;
  v33.size.width = a8;
  v33.size.height = a9;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CGRectGetMaxX(v33);
  v19 = __CFADD__(a12 - 1, a11);
  v20 = a12 - 1 + a11;
  if (v19)
    goto LABEL_9;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "locationForGlyphAtIndex:", v20);
    v22 = v21;
    if ((objc_msgSend(*(id *)(a1 + 32), "propertyForGlyphAtIndex:", v20) & 7) != 0)
      goto LABEL_8;
    v23 = *(double *)(a1 + 80);
    if (!*(_BYTE *)(a1 + 88))
      break;
    if (v22 <= v23)
    {
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v30 = *(double *)(v28 + 24);
      v29 = (double *)(v28 + 24);
      if (v30 <= v23)
        goto LABEL_9;
      goto LABEL_16;
    }
LABEL_8:
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v22;
    if (--v20 < a11)
      goto LABEL_9;
  }
  if (v22 < v23)
    goto LABEL_8;
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v32 = *(double *)(v31 + 24);
  v29 = (double *)(v31 + 24);
  if (v32 >= v23)
    goto LABEL_9;
LABEL_16:
  *v29 = v22;
  --v20;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", 0, objc_msgSend(*(id *)(a1 + 32), "characterIndexForGlyphAtIndex:", v20) + 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "length"))
  {
    objc_msgSend(v24, "stringByAppendingString:", CFSTR("…"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
  *a13 = 1;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(_QWORD *)(v13 + 24);
LABEL_12:
  *(_QWORD *)(v13 + 24) = v14 + 1;
}

@end
