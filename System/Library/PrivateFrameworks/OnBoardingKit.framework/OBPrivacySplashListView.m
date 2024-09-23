@implementation OBPrivacySplashListView

- (OBPrivacySplashListView)initWithContentList:(id)a3 dataDetectorTypes:(unint64_t)a4
{
  return -[OBPrivacySplashListView initWithContentList:dataDetectorTypes:displayingPrivacyPane:](self, "initWithContentList:dataDetectorTypes:displayingPrivacyPane:", a3, a4, 0);
}

- (OBPrivacySplashListView)initWithContentList:(id)a3 dataDetectorTypes:(unint64_t)a4 displayingPrivacyPane:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  OBPrivacySplashListView *v11;
  uint64_t v12;
  NSMutableArray *textViews;
  uint64_t v14;
  NSMutableArray *stackedIconTextLists;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  OBStackedIconTextList *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  UITextView *footerTextView;
  unint64_t v54;
  OBPrivacySplashListView *v55;
  id v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  _BYTE v67[128];
  uint64_t v68;

  v5 = a5;
  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v66.receiver = self;
  v66.super_class = (Class)OBPrivacySplashListView;
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v57 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v58 = *MEMORY[0x1E0C9D648];
  v11 = -[OBPrivacySplashListView initWithFrame:](&v66, sel_initWithFrame_);
  if (v11)
  {
    v12 = objc_opt_new();
    textViews = v11->_textViews;
    v11->_textViews = (NSMutableArray *)v12;

    v14 = objc_opt_new();
    stackedIconTextLists = v11->_stackedIconTextLists;
    v11->_stackedIconTextLists = (NSMutableArray *)v14;

    -[OBPrivacySplashListView setDisplayingPrivacyPane:](v11, "setDisplayingPrivacyPane:", v5);
    -[OBPrivacySplashListView setAxis:](v11, "setAxis:", 1);
    -[OBPrivacySplashListView setBaselineRelativeArrangement:](v11, "setBaselineRelativeArrangement:", 1);
    if (objc_msgSend(v8, "count"))
    {
      v16 = 0;
      v17 = *MEMORY[0x1E0DC49E8];
      v18 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v19 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v20 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      v60 = *MEMORY[0x1E0DC1178];
      v55 = v11;
      v56 = v8;
      v54 = a4;
      while (1)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v16, v54);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "text");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          break;
        objc_msgSend(v21, "bullets");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          v59 = v16;
          v23 = -[OBStackedIconTextList initWithFrame:]([OBStackedIconTextList alloc], "initWithFrame:", v58, v57, v9, v10);
          -[OBStackedIconTextList setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[OBStackedIconTextList setLayoutMargins:](v23, "setLayoutMargins:", 0.0, 20.0, 0.0, 20.0);
          -[OBStackedIconTextList setLayoutMarginsRelativeArrangement:](v23, "setLayoutMarginsRelativeArrangement:", 1);
          -[OBStackedIconTextList setDataDetectorTypes:](v23, "setDataDetectorTypes:", a4);
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v61 = v21;
          objc_msgSend(v21, "bullets");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v63;
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v63 != v37)
                  objc_enumerationMutation(v34);
                v39 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                objc_msgSend(v39, "icon");
                v40 = (void *)objc_claimAutoreleasedReturnValue();

                if (v40)
                {
                  objc_msgSend(v39, "icon");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "icon");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "size");
                  v44 = v43;
                  v46 = v45;
                }
                else
                {
                  +[OBImage systemImageNamed:](OBImage, "systemImageNamed:", CFSTR("circle.fill"));
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "imageWithTintColor:renderingMode:", v47, 1);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();

                  v46 = 6.0;
                  v44 = 6.0;
                }

                objc_msgSend(v39, "text");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                -[OBStackedIconTextList addEntryWithIcon:iconSize:text:](v23, "addEntryWithIcon:iconSize:text:", v41, v48, v44, v46);

              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
            }
            while (v36);
          }

          v11 = v55;
          -[OBPrivacySplashListView addArrangedSubview:](v55, "addArrangedSubview:", v23);
          -[OBPrivacySplashListView stackedIconTextLists](v55, "stackedIconTextLists");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v23);
          v8 = v56;
          a4 = v54;
          v16 = v59;
          goto LABEL_18;
        }
LABEL_19:

        if (++v16 >= (unint64_t)objc_msgSend(v8, "count"))
          goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0DC3E50], "textViewUsingTextLayoutManager:", 0);
      v23 = (OBStackedIconTextList *)objc_claimAutoreleasedReturnValue();
      -[OBStackedIconTextList setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[OBStackedIconTextList setTextContainerInset:](v23, "setTextContainerInset:", v17, v18, v19, v20);
      -[OBStackedIconTextList textContainer](v23, "textContainer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setLineFragmentPadding:", 0.0);

      -[OBStackedIconTextList setEditable:](v23, "setEditable:", 0);
      -[OBStackedIconTextList setSelectable:](v23, "setSelectable:", 1);
      -[OBStackedIconTextList setScrollEnabled:](v23, "setScrollEnabled:", 0);
      -[OBStackedIconTextList setDataDetectorTypes:](v23, "setDataDetectorTypes:", a4);
      objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "mutableCopy");

      objc_msgSend(v26, "setSpansAllLines:", 1);
      v27 = objc_alloc(MEMORY[0x1E0CB3778]);
      v61 = v21;
      objc_msgSend(v21, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v27, "initWithString:", v28);

      objc_msgSend(v29, "addAttribute:value:range:", v60, v26, 0, objc_msgSend(v29, "length"));
      -[OBStackedIconTextList setAttributedText:](v23, "setAttributedText:", v29);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBStackedIconTextList setBackgroundColor:](v23, "setBackgroundColor:", v30);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBStackedIconTextList setTextColor:](v23, "setTextColor:", v31);

      -[OBPrivacySplashListView addArrangedSubview:](v11, "addArrangedSubview:", v23);
      -[OBPrivacySplashListView textViews](v11, "textViews");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v23);

LABEL_18:
      v21 = v61;
      goto LABEL_19;
    }
LABEL_20:
    -[OBPrivacySplashListView updateSpacing](v11, "updateSpacing");
    -[OBPrivacySplashListView updateTextAlignment](v11, "updateTextAlignment");
    -[OBPrivacySplashListView updateFonts](v11, "updateFonts");
    -[OBPrivacySplashListView textViews](v11, "textViews");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacySplashListView _updateTextViewsForLinkUITreatment:](v11, "_updateTextViewsForLinkUITreatment:", v49);

    -[OBPrivacySplashListView textViews](v11, "textViews");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "lastObject");
    v51 = objc_claimAutoreleasedReturnValue();
    footerTextView = v11->_footerTextView;
    v11->_footerTextView = (UITextView *)v51;

  }
  return v11;
}

- (void)updateSpacing
{
  _BOOL4 v3;
  double v4;
  void *v5;
  BOOL v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[OBPrivacySplashListView displayingPrivacyPane](self, "displayingPrivacyPane");
  v4 = 46.0;
  if (!v3)
    v4 = 30.0;
  objc_msgSend(v10, "scaledValueForValue:", v4);
  -[OBPrivacySplashListView setSpacing:](self, "setSpacing:");
  -[OBPrivacySplashListView textViews](self, "textViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_6;
  v6 = -[OBPrivacySplashListView displayingPrivacyPane](self, "displayingPrivacyPane");

  if (!v6)
  {
    objc_msgSend(v10, "scaledValueForValue:", 46.0);
    v8 = v7;
    -[OBPrivacySplashListView textViews](self, "textViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacySplashListView setCustomSpacing:afterView:](self, "setCustomSpacing:afterView:", v9, v8);

LABEL_6:
  }

}

- (void)updateFonts
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;

  -[OBPrivacySplashListView textViews](self, "textViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    v6 = *MEMORY[0x1E0DC4B10];
    v7 = *MEMORY[0x1E0DC4A88];
    do
    {
      -[OBPrivacySplashListView textViews](self, "textViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v7;
      if (v5)
      {
        if (-[OBPrivacySplashListView displayingPrivacyPane](self, "displayingPrivacyPane", v7))
          v10 = v7;
        else
          v10 = v6;
      }
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFont:", v11);

      ++v5;
      -[OBPrivacySplashListView textViews](self, "textViews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

    }
    while (v13 > v5);
  }
}

- (void)updateTextAlignment
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (+[OBViewUtilities shouldUseAccessibilityLayout](OBViewUtilities, "shouldUseAccessibilityLayout"))
    v3 = 4;
  else
    v3 = 1;
  if (-[OBPrivacySplashListView displayingPrivacyPane](self, "displayingPrivacyPane"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[OBPrivacySplashListView textViews](self, "textViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setTextAlignment:", v3);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  else
  {
    -[OBPrivacySplashListView textViews](self, "textViews");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextAlignment:", v3);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBPrivacySplashListView;
  -[OBPrivacySplashListView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[OBPrivacySplashListView updateTextAlignment](self, "updateTextAlignment");
  -[OBPrivacySplashListView updateSpacing](self, "updateSpacing");
  -[OBPrivacySplashListView updateFonts](self, "updateFonts");
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBPrivacySplashListView;
  -[OBPrivacySplashListView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[OBPrivacySplashListView textViews](self, "textViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashListView _updateTextViewsForLinkUITreatment:](self, "_updateTextViewsForLinkUITreatment:", v3);

}

- (void)_updateTextViewsForLinkUITreatment:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x1E0DC1140];
    v9 = *MEMORY[0x1E0DC1248];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        if (-[OBPrivacySplashListView underlineLinks](self, "underlineLinks"))
        {
          v18[0] = v8;
          -[OBPrivacySplashListView tintColor](self, "tintColor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18[1] = v9;
          v19[0] = v12;
          v19[1] = &unk_1E37BC5C8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setLinkTextAttributes:", v13);

        }
        else
        {
          objc_msgSend(v11, "setLinkTextAttributes:", 0);
        }
        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

}

- (UITextView)footerTextView
{
  return self->_footerTextView;
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

- (BOOL)displayingPrivacyPane
{
  return self->_displayingPrivacyPane;
}

- (void)setDisplayingPrivacyPane:(BOOL)a3
{
  self->_displayingPrivacyPane = a3;
}

- (NSMutableArray)textViews
{
  return self->_textViews;
}

- (void)setTextViews:(id)a3
{
  objc_storeStrong((id *)&self->_textViews, a3);
}

- (NSMutableArray)stackedIconTextLists
{
  return self->_stackedIconTextLists;
}

- (void)setStackedIconTextLists:(id)a3
{
  objc_storeStrong((id *)&self->_stackedIconTextLists, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackedIconTextLists, 0);
  objc_storeStrong((id *)&self->_textViews, 0);
  objc_storeStrong((id *)&self->_footerTextView, 0);
}

@end
