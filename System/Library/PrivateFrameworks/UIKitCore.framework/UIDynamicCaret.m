@implementation UIDynamicCaret

- (UIDynamicCaret)initWithFrame:(CGRect)a3
{
  UIDynamicCaret *v3;
  UIDynamicCaret *v4;
  _UIDynamicCaretInput *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _UIDynamicCaretInput *v10;
  _UIDynamicCaretAlternatives *v11;
  _UIDynamicCaretNoContentView *v12;
  _UIDynamicCaretHelpLabel *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)UIDynamicCaret;
  v3 = -[UIImageView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UIView setMultipleTouchEnabled:](v4, "setMultipleTouchEnabled:", 0);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
    v4->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v5 = [_UIDynamicCaretInput alloc];
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[_UIDynamicCaretInput initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    -[UIDynamicCaret setInputView:](v4, "setInputView:", v10);

    v11 = -[_UIDynamicCaretAlternatives initWithFrame:]([_UIDynamicCaretAlternatives alloc], "initWithFrame:", v6, v7, v8, v9);
    -[UIDynamicCaret setAlternativesView:](v4, "setAlternativesView:", v11);

    v12 = -[_UIDynamicCaretNoContentView initWithImage:]([_UIDynamicCaretNoContentView alloc], "initWithImage:", 0);
    -[UIDynamicCaret setNoContentView:](v4, "setNoContentView:", v12);

    v13 = -[_UIDynamicCaretHelpLabel initWithImage:]([_UIDynamicCaretHelpLabel alloc], "initWithImage:", 0);
    -[UIDynamicCaret setHelpLabel:](v4, "setHelpLabel:", v13);

    -[UIDynamicCaret inputView](v4, "inputView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v4, "addSubview:", v14);

    -[UIDynamicCaret alternativesView](v4, "alternativesView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v4, "addSubview:", v15);

    -[UIDynamicCaret noContentView](v4, "noContentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v4, "addSubview:", v16);

    -[UIDynamicCaret helpLabel](v4, "helpLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v4, "addSubview:", v17);

    -[UIDynamicCaret displayAlternatives:](v4, "displayAlternatives:", 0);
    -[UIDynamicCaret noContentView](v4, "noContentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlpha:", 0.0);

    -[UIDynamicCaret helpLabel](v4, "helpLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlpha:", 0.0);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIDynamicCaret;
  -[UIImageView layoutSubviews](&v12, sel_layoutSubviews);
  -[UIDynamicCaret helpLabel](self, "helpLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[UIDynamicCaret helpLabel](self, "helpLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  -[UIView frame](self, "frame");
  v10 = v9;
  -[UIDynamicCaret helpLabel](self, "helpLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", 0.0, v10, v6, v8);

}

- (void)displayAlternatives:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[UIDynamicCaret inputView](self, "inputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  -[UIDynamicCaret alternativesView](self, "alternativesView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v3 ^ 1);

}

- (id)backgroundImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__UIDynamicCaret_backgroundImage__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (qword_1ECD7AFC8 != -1)
    dispatch_once(&qword_1ECD7AFC8, block);
  return (id)_MergedGlobals_11_13;
}

void __33__UIDynamicCaret_backgroundImage__block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "contentScaleFactor");
  _UIGraphicsBeginImageContextWithOptions(0, 0, 80.0, 40.0, v1);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.07, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");

  +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, 0.0, 0.0, 80.0, 40.0, 20.0, 20.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fill");

  _UIGraphicsGetImageFromCurrentImageContext(0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v6, "resizableImageWithCapInsets:", 39.0, 40.0, 0.0, 40.0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_11_13;
  _MergedGlobals_11_13 = v4;

}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  id v5;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIDynamicCaret setIsActive:](self, "setIsActive:", 1);
    -[UIImageView image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[UIDynamicCaret backgroundImage](self, "backgroundImage");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self, "setImage:", v5);

    }
  }
}

- (BOOL)isActive
{
  void *v2;
  char v3;

  UIKeyboardGetCurrentInputMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("intl_HWR"));

  return v3;
}

- (void)setIsActive:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstResponder");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "_requiresKeyboardWhenFirstResponder"))
    {
      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDelegate:", v6);

    }
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInputMode:userInitiated:", CFSTR("intl_HWR"), 0);

  }
}

- (void)setDocumentHasContent:(BOOL)a3
{
  double v4;
  void *v5;
  id v6;

  if (a3)
    v4 = 0.0;
  else
    v4 = 1.0;
  -[UIDynamicCaret noContentView](self, "noContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  -[UIDynamicCaret helpLabel](self, "helpLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v4);

}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDynamicCaret;
  -[UIImageView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.height);
}

- (void)alternativeTappedAtIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
  -[UIKeyboardCandidateListDelegate candidateListAcceptCandidate:](self->_candidateListDelegate, "candidateListAcceptCandidate:", self);
  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  -[UIDynamicCaret displayAlternatives:](self, "displayAlternatives:", 0);
  self->_justDeleted = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (void *)UIApp;
  v6 = a3;
  objc_msgSend(v5, "_disableTouchCoalescingWithCount:", objc_msgSend(v6, "count"));
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "locationInView:", self);
  v9 = v8;
  v11 = v10;

  -[UIDynamicCaret inputView](self, "inputView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v12, "isHidden");

  if ((_DWORD)v6)
  {
    -[UIDynamicCaret alternativesView](self, "alternativesView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_selectedIndex = objc_msgSend(v13, "indexOfButtonForPoint:", v9, v11);

    -[UIDynamicCaret alternativesView](self, "alternativesView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "highlightButtonAtIndex:", self->_selectedIndex);
  }
  else
  {
    -[UIDynamicCaret inputView](self, "inputView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startTouchAtPoint:", v9, v11);
  }

  -[UIDynamicCaret setDocumentHasContent:](self, "setDocumentHasContent:", 1);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  char v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  objc_msgSend(a3, "anyObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  -[UIDynamicCaret inputView](self, "inputView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInking");

  if ((v10 & 1) != 0)
  {
    -[UIDynamicCaret inputView](self, "inputView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTouchAtPoint:", v6, v8);

  }
  else
  {
    objc_msgSend(v15, "previousLocationInView:", self);
    if (sqrt((v6 - v12) * (v6 - v12) + (v8 - v13) * (v8 - v13)) > 1.0)
    {
      self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
      -[UIDynamicCaret inputView](self, "inputView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startTouchAtPoint:", v6, v8);

      -[UIDynamicCaret displayAlternatives:](self, "displayAlternatives:", 0);
    }
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (v6)
    objc_msgSend((id)UIApp, "_enableTouchCoalescingWithCount:", objc_msgSend(v15, "count"));
  objc_msgSend(v15, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", self);
  v9 = v8;
  v11 = v10;

  -[UIDynamicCaret inputView](self, "inputView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isInking");

  if ((v13 & 1) != 0)
  {
    -[UIDynamicCaret inputView](self, "inputView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endTouchAtPoint:", v9, v11);

  }
  else
  {
    -[UIDynamicCaret alternativeTappedAtIndex:](self, "alternativeTappedAtIndex:", self->_selectedIndex);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIDynamicCaret touchesEnded:withEvent:](self, "touchesEnded:withEvent:", a3, 0);
}

- (BOOL)isDeleteCandidate:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DELETE"));

  return v4;
}

- (void)setCandidates:(id)a3 inlineText:(id)a4 inlineRect:(CGRect)a5 maxX:(double)a6 layout:(BOOL)a7
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v19 = a3;
  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  -[UIDynamicCaret candidateSet](self, "candidateSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "candidates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "candidates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = -[UIDynamicCaret isDeleteCandidate:](self, "isDeleteCandidate:", v13);

  if ((_DWORD)v10)
  {
    if (self->_justDeleted)
    {
      -[UIDynamicCaret setCandidateSet:](self, "setCandidateSet:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDynamicCaret candidateSet](self, "candidateSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "candidates");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __66__UIDynamicCaret_setCandidates_inlineText_inlineRect_maxX_layout___block_invoke;
      v20[3] = &unk_1E16D7668;
      v17 = v14;
      v21 = v17;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);

      -[UIDynamicCaret alternativesView](self, "alternativesView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setButtonLabels:", v17);

      if (objc_msgSend(v11, "length"))
        -[UIDynamicCaret displayAlternatives:](self, "displayAlternatives:", 1);
      self->_justDeleted = 1;

    }
  }
  else
  {
    -[UIDynamicCaret setCandidateSet:](self, "setCandidateSet:", v19);
    -[UIDynamicCaret displayAlternatives:](self, "displayAlternatives:", 0);
    self->_justDeleted = 0;
  }

}

void __66__UIDynamicCaret_setCandidates_inlineText_inlineRect_maxX_layout___block_invoke(uint64_t a1, void *a2, unint64_t a3, BOOL *a4)
{
  void *v6;
  void *v7;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(a2, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  *a4 = a3 > 3;
}

- (void)setUIKeyboardCandidateListDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_candidateListDelegate, a3);
}

- (BOOL)hasCandidates
{
  return self->_candidateSet != 0;
}

- (BOOL)isExtendedList
{
  return 0;
}

- (BOOL)isFloatingList
{
  return 0;
}

- (BOOL)showCandidate:(id)a3
{
  return 0;
}

- (id)currentCandidate
{
  id v2;
  void *v4;
  void *v5;
  void *v6;

  if (self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    -[UIDynamicCaret candidateSet](self, "candidateSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", self->_selectedIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[UIDynamicCaret isDeleteCandidate:](self, "isDeleteCandidate:", v6))
      v2 = 0;
    else
      v2 = v6;

  }
  return v2;
}

- (unint64_t)currentIndex
{
  return self->_selectedIndex;
}

- (id)keyboardBehaviors
{
  return 0;
}

- (id)statisticsIdentifier
{
  return 0;
}

- (unint64_t)selectedSortIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (_UIDynamicCaretInput)inputView
{
  return self->_inputView;
}

- (void)setInputView:(id)a3
{
  objc_storeStrong((id *)&self->_inputView, a3);
}

- (_UIDynamicCaretAlternatives)alternativesView
{
  return self->_alternativesView;
}

- (void)setAlternativesView:(id)a3
{
  objc_storeStrong((id *)&self->_alternativesView, a3);
}

- (_UIDynamicCaretNoContentView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
  objc_storeStrong((id *)&self->_noContentView, a3);
}

- (_UIDynamicCaretHelpLabel)helpLabel
{
  return self->_helpLabel;
}

- (void)setHelpLabel:(id)a3
{
  objc_storeStrong((id *)&self->_helpLabel, a3);
}

- (TIKeyboardCandidateResultSet)candidateSet
{
  return self->_candidateSet;
}

- (void)setCandidateSet:(id)a3
{
  objc_storeStrong((id *)&self->_candidateSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateSet, 0);
  objc_storeStrong((id *)&self->_helpLabel, 0);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_alternativesView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_candidateListDelegate, 0);
}

@end
