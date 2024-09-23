@implementation _UIKeyboardHandwritingLink

- (_UIKeyboardHandwritingLink)init
{
  _UIKeyboardHandwritingLink *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIKeyboardHandwritingLink;
  v2 = -[_UIKeyboardHandwritingLink init](&v9, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34___UIKeyboardHandwritingLink_init__block_invoke;
    v6[3] = &unk_1E16B22E0;
    objc_copyWeak(&v7, &location);
    v4 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationWillEnterForegroundNotification"), 0, 0, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  _UIKeyboardHandwritingLink *v4;
  void *v5;
  objc_super v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidateList");
  v4 = (_UIKeyboardHandwritingLink *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCandidateList:", 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyboardHandwritingLink;
  -[UIResponder dealloc](&v6, sel_dealloc);
}

- (void)reloadInputViews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardHandwritingLink;
  -[UIResponder reloadInputViews](&v5, sel_reloadInputViews);
  if (-[UIResponder isFirstResponder](self, "isFirstResponder"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInputMode:userInitiated:", CFSTR("intl_HWR"), 0);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCandidateList:", self);

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  id WeakRetained;
  void *v5;
  objc_super v7;

  if (-[UIResponder isFirstResponder](self, "isFirstResponder"))
    return 1;
  objc_msgSend((id)UIApp, "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_fallbackResponder, v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackResponder);
  objc_msgSend(WeakRetained, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_previousResponder, v5);

  v7.receiver = self;
  v7.super_class = (Class)_UIKeyboardHandwritingLink;
  if (-[UIResponder becomeFirstResponder](&v7, sel_becomeFirstResponder))
    return 1;
  objc_storeWeak((id *)&self->_previousResponder, 0);
  objc_storeWeak((id *)&self->_fallbackResponder, 0);
  return 0;
}

- (BOOL)shouldRestoreResponder
{
  UIResponder **p_previousResponder;
  id WeakRetained;
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;

  p_previousResponder = &self->_previousResponder;
  WeakRetained = objc_loadWeakRetained((id *)&self->_previousResponder);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_previousResponder);
    objc_msgSend(v4, "inputView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 1;
    }
    else
    {
      v7 = objc_loadWeakRetained((id *)p_previousResponder);
      objc_msgSend(v7, "inputAccessoryView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8 != 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  id WeakRetained;
  void *v5;
  _UIKeyboardHandwritingLink *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIKeyboardHandwritingLink;
  v3 = -[UIResponder resignFirstResponder](&v9, sel_resignFirstResponder);
  if (v3)
  {
    if (-[_UIKeyboardHandwritingLink shouldRestoreResponder](self, "shouldRestoreResponder"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_previousResponder);
      objc_msgSend(WeakRetained, "becomeFirstResponder");

    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidateList");
    v6 = (_UIKeyboardHandwritingLink *)objc_claimAutoreleasedReturnValue();

    if (v6 == self)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCandidateList:", 0);

    }
    objc_storeWeak((id *)&self->_previousResponder, 0);
    objc_storeWeak((id *)&self->_fallbackResponder, 0);
  }
  return v3;
}

- (id)nextResponder
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_previousResponder);
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = WeakRetained;
  else
    v5 = objc_loadWeakRetained((id *)&self->_fallbackResponder);
  v6 = v5;

  return v6;
}

- (void)sendStrokes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[UIResponder isFirstResponder](self, "isFirstResponder"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Not first responder, can't handle %@"), v5);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addInputObject:", v5);

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
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  v16 = v8;
  objc_msgSend(v8, "candidates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UIKeyboardHandwritingLink isDeleteCandidate:](self, "isDeleteCandidate:", v10);

  if (v11)
  {
    if (self->_justDeleted)
    {
      -[_UIKeyboardHandwritingLink setCandidateSet:](self, "setCandidateSet:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardHandwritingLink candidateSet](self, "candidateSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "candidates");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __78___UIKeyboardHandwritingLink_setCandidates_inlineText_inlineRect_maxX_layout___block_invoke;
      v17[3] = &unk_1E16D7668;
      v18 = v12;
      v15 = v12;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

      self->_justDeleted = 1;
    }
  }
  else
  {
    -[_UIKeyboardHandwritingLink setCandidateSet:](self, "setCandidateSet:", v16);
    self->_justDeleted = 0;
  }
  -[_UIKeyboardHandwritingLink candidatesUpdated](self, "candidatesUpdated");

}

- (void)setUIKeyboardCandidateListDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_candidateListDelegate, a3);
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
    -[_UIKeyboardHandwritingLink candidateSet](self, "candidateSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", self->_selectedIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_UIKeyboardHandwritingLink isDeleteCandidate:](self, "isDeleteCandidate:", v6))
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
  objc_destroyWeak((id *)&self->_candidateListDelegate);
  objc_destroyWeak((id *)&self->_fallbackResponder);
  objc_destroyWeak((id *)&self->_previousResponder);
}

@end
