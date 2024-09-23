@implementation ICLearnMoreTextView

- (void)awakeFromNib
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICLearnMoreTextView;
  -[ICLearnMoreTextView awakeFromNib](&v4, sel_awakeFromNib);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_updateForAccessibilityDarkerSystemColors, *MEMORY[0x1E0DC4508], 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[ICLearnMoreTextView tapGestureRecognizer](self, "tapGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICLearnMoreTextView tapGestureRecognizer](self, "tapGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLearnMoreTextView removeGestureRecognizer:](self, "removeGestureRecognizer:", v5);

    -[ICLearnMoreTextView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)ICLearnMoreTextView;
  -[ICLearnMoreTextView dealloc](&v6, sel_dealloc);
}

- (void)resetTextView
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3498]);
  -[ICLearnMoreTextView setAttributedText:](self, "setAttributedText:", v3);

  -[ICLearnMoreTextView tapGestureRecognizer](self, "tapGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICLearnMoreTextView tapGestureRecognizer](self, "tapGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLearnMoreTextView removeGestureRecognizer:](self, "removeGestureRecognizer:", v5);

    -[ICLearnMoreTextView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", 0);
  }
  -[ICLearnMoreTextView setIsShowingLearnMore:](self, "setIsShowingLearnMore:", 0);
}

- (void)setText:(id)a3 font:(id)a4 color:(id)a5 lineSpacing:(double)a6 addLearnMore:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  void *v14;
  id v15;

  v7 = a7;
  v15 = a3;
  v12 = a4;
  v13 = a5;
  if (objc_msgSend(v15, "length"))
  {
    -[ICLearnMoreTextView attributedString:withColor:font:](self, "attributedString:withColor:font:", v15, v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLearnMoreTextView setAttributedText:font:lineSpacing:addLearnMore:](self, "setAttributedText:font:lineSpacing:addLearnMore:", v14, v12, v7, a6);

  }
  else
  {
    -[ICLearnMoreTextView resetTextView](self, "resetTextView");
  }
  -[ICLearnMoreTextView setIsShowingLearnMore:](self, "setIsShowingLearnMore:", v7);

}

- (void)setAttributedText:(id)a3 addLearnMore:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a4;
  v17 = a3;
  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend(v17, "attributesAtIndex:effectiveRange:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "ICLearnMoreLinkColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        -[ICLearnMoreTextView tintColor](self, "tintColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR(" Learn more…"), CFSTR(" Learn more…"), 0, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v9, v7);
      v11 = objc_msgSend(v10, "length");
      objc_msgSend(v10, "addAttribute:value:range:", CFSTR("ICLearnMoreTag"), MEMORY[0x1E0C9AAB0], 0, v11);
      objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v8, 0, objc_msgSend(v10, "length"));
      v12 = (void *)objc_msgSend(v17, "mutableCopy");
      objc_msgSend(v12, "appendAttributedString:", v10);
      v13 = objc_msgSend(v12, "copy");

      -[ICLearnMoreTextView tapGestureRecognizer](self, "tapGestureRecognizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tapGesture_);
        -[ICLearnMoreTextView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v15);

        -[ICLearnMoreTextView tapGestureRecognizer](self, "tapGestureRecognizer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLearnMoreTextView addGestureRecognizer:](self, "addGestureRecognizer:", v16);

      }
      v17 = (id)v13;
    }

  }
  -[ICLearnMoreTextView setIsShowingLearnMore:](self, "setIsShowingLearnMore:", v4);
  -[ICLearnMoreTextView setAttributedText:](self, "setAttributedText:", v17);

}

- (void)setAttributedText:(id)a3 font:(id)a4 lineSpacing:(double)a5 addLearnMore:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
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
  id v21;

  v6 = a6;
  v21 = a3;
  v10 = a4;
  -[ICLearnMoreTextView resetTextView](self, "resetTextView");
  if (objc_msgSend(v21, "length"))
  {
    v11 = (void *)objc_msgSend(v21, "mutableCopy");
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "ICLearnMoreLinkColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR(" Learn more…"), CFSTR(" Learn more…"), 0, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLearnMoreTextView attributedString:withColor:font:](self, "attributedString:withColor:font:", v13, v12, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      v16 = objc_msgSend(v15, "length");
      objc_msgSend(v15, "addAttribute:value:range:", CFSTR("ICLearnMoreTag"), MEMORY[0x1E0C9AAB0], 0, v16);
      objc_msgSend(v11, "appendAttributedString:", v15);

    }
    v17 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v17, "setAlignment:", 1);
    objc_msgSend(v17, "setLineSpacing:", a5);
    objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v17, 0, objc_msgSend(v11, "length"));
    -[ICLearnMoreTextView setAttributedText:](self, "setAttributedText:", v11);
    if (v6)
    {
      -[ICLearnMoreTextView tapGestureRecognizer](self, "tapGestureRecognizer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tapGesture_);
        -[ICLearnMoreTextView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v19);

        -[ICLearnMoreTextView tapGestureRecognizer](self, "tapGestureRecognizer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLearnMoreTextView addGestureRecognizer:](self, "addGestureRecognizer:", v20);

      }
    }

  }
  -[ICLearnMoreTextView setIsShowingLearnMore:](self, "setIsShowingLearnMore:", v6);

}

- (void)tapGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  -[ICLearnMoreTextView layoutManager](self, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", self);
  v7 = v6;
  v9 = v8;

  -[ICLearnMoreTextView textContainerInset](self, "textContainerInset");
  v11 = v7 - v10;
  -[ICLearnMoreTextView textContainerInset](self, "textContainerInset");
  v13 = v9 - v12;
  -[ICLearnMoreTextView textContainer](self, "textContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v5, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v14, 0, v11, v13);

  -[ICLearnMoreTextView textStorage](self, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v15 < v17)
  {
    -[ICLearnMoreTextView textStorage](self, "textStorage", 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "attribute:atIndex:effectiveRange:", CFSTR("ICLearnMoreTag"), v15, &v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      -[ICLearnMoreTextView didTapLearnMore](self, "didTapLearnMore");

  }
}

- (void)didTapLearnMore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ICLearnMoreTextView helpTopic](self, "helpTopic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.helpTopic) != nil)", "-[ICLearnMoreTextView didTapLearnMore]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.helpTopic");
  -[ICLearnMoreTextView parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.parentViewController.view.window) != nil)", "-[ICLearnMoreTextView didTapLearnMore]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.parentViewController.view.window");
  -[ICLearnMoreTextView helpTopic](self, "helpTopic");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICLearnMoreTextView parentViewController](self, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICHelp presentWithTopic:presentingViewController:](ICHelp, "presentWithTopic:presentingViewController:", v8, v7);

}

- (id)attributedString:(id)a3 withColor:(id)a4 font:(id)a5
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  void *v15;

  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = (__CFString *)a3;
  objc_msgSend(v9, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1138]);
  if (v7)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC1140]);
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v10)
    v14 = v10;
  else
    v14 = &stru_1E5C2F8C0;
  v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v12);

  return v15;
}

- (void)sizeToFitWidthUsingHeightConstraint:(id)a3
{
  double v4;
  double v5;
  id v6;

  v6 = a3;
  -[ICLearnMoreTextView frame](self, "frame");
  -[ICLearnMoreTextView sizeThatFits:](self, "sizeThatFits:", v4, 3.40282347e38);
  objc_msgSend(v6, "setConstant:", v5);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  _BOOL4 v3;

  v3 = -[ICLearnMoreTextView isShowingLearnMore](self, "isShowingLearnMore");
  if (v3)
    -[ICLearnMoreTextView didTapLearnMore](self, "didTapLearnMore");
  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;

  if (UIAccessibilityIsVoiceOverRunning())
    return *MEMORY[0x1E0DC46C0];
  v3 = *MEMORY[0x1E0DC4690];
  if (UIAccessibilityIsSwitchControlRunning())
    return *MEMORY[0x1E0DC4660];
  else
    return v3;
}

- (id)accessibilityHint
{
  void *v3;
  uint64_t v4;

  -[ICLearnMoreTextView accessibilityUserDefinedHint](self, "accessibilityUserDefinedHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length") && -[ICLearnMoreTextView isShowingLearnMore](self, "isShowingLearnMore"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Double tap to learn more."), CFSTR("Double tap to learn more."), 0, 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (BOOL)_accessibilityHasTextOperations
{
  return 0;
}

- (void)updateForAccessibilityDarkerSystemColors
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR(" Learn more…"), CFSTR(" Learn more…"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLearnMoreTextView text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfString:", v3);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICLearnMoreTextView attributedText](self, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v12 = 0;
    v13 = 0;
    objc_msgSend(v7, "attributesAtIndex:effectiveRange:", v5, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0DC3658], "ICLearnMoreLinkColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0DC1140]);
    objc_msgSend(v7, "setAttributes:range:", v9, v12, v13);
    v11 = (void *)objc_msgSend(v7, "copy");
    -[ICLearnMoreTextView setAttributedText:](self, "setAttributedText:", v11);

  }
}

- (NSString)helpTopic
{
  return self->_helpTopic;
}

- (void)setHelpTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2792);
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (BOOL)isShowingLearnMore
{
  return self->_isShowingLearnMore;
}

- (void)setIsShowingLearnMore:(BOOL)a3
{
  self->_isShowingLearnMore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_helpTopic, 0);
}

@end
