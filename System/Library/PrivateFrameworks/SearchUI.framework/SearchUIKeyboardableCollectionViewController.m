@implementation SearchUIKeyboardableCollectionViewController

- (double)currentKeyboardHeight
{
  return self->_currentKeyboardHeight;
}

- (void)setCurrentKeyboardHeight:(double)a3
{
  self->_currentKeyboardHeight = a3;
}

- (UITextField)textField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_textField);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (void)setCollectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIKeyboardableCollectionViewController;
  v4 = a3;
  -[SearchUIKeyboardableCollectionViewController setCollectionView:](&v7, sel_setCollectionView_, v4);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setDelegate:", self, v7.receiver, v7.super_class);
  objc_msgSend(v4, "addGestureRecognizer:", v5);
  objc_msgSend(v4, "panGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "requireGestureRecognizerToFail:", v5);
}

- (SearchUIKeyboardableCollectionViewController)init
{
  SearchUIKeyboardableCollectionViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIKeyboardableCollectionViewController;
  v2 = -[SearchUIKeyboardableCollectionViewController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardFrameChanged_, *MEMORY[0x1E0DC4FD8], 0);

  }
  return v2;
}

- (void)setAdditionalKeyboardHeight:(double)a3
{
  self->_additionalKeyboardHeight = a3;
}

- (void)setTextField:(id)a3
{
  objc_storeWeak((id *)&self->_textField, a3);
}

- (SearchUIKeyboardableTableViewDelegate)interactionDelegate
{
  return (SearchUIKeyboardableTableViewDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  int v7;
  id v8;

  v4 = a3;
  -[SearchUIKeyboardableCollectionViewController adjustedVerticalOffset](self, "adjustedVerticalOffset");
  v6 = v5;
  v7 = objc_msgSend(v4, "isTracking");

  if (v7)
  {
    if (v6 > 0.0
      && -[SearchUIKeyboardableCollectionViewController contentIsTallEnoughToBeOccludedByCurrentKeyboardHeightAndTextField](self, "contentIsTallEnoughToBeOccludedByCurrentKeyboardHeightAndTextField")&& !+[SearchUIUtilities isMinimizedHardwareKeyboardMode](SearchUIUtilities, "isMinimizedHardwareKeyboardMode"))
    {
      -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resignFirstResponder");

    }
    else if (v6 < -50.0)
    {
      -[SearchUIKeyboardableCollectionViewController showKeyboard](self, "showKeyboard");
    }
  }
}

- (double)adjustedVerticalOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  objc_msgSend(v2, "adjustedContentInset");
  v6 = v4 + v5;

  return v6;
}

- (void)keyboardFrameChanged:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SearchUIKeyboardableCollectionViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tlks_screen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.width = v11;
  v24.size.height = v13;
  v26.origin.x = v17;
  v26.origin.y = v19;
  v26.size.width = v21;
  v26.size.height = v23;
  v25 = CGRectIntersection(v24, v26);
  -[SearchUIKeyboardableCollectionViewController setCurrentKeyboardHeight:](self, "setCurrentKeyboardHeight:", CGRectGetHeight(v25));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FD8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SearchUIKeyboardableCollectionViewController;
  -[SearchUIKeyboardableCollectionViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SearchUIKeyboardableCollectionViewController;
  -[SearchUIKeyboardableCollectionViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)addKeyCommandForKey:(id)a3 action:(SEL)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0DC3930];
  v7 = a3;
  objc_msgSend(v6, "keyCommandWithInput:modifierFlags:action:", v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIKeyboardableCollectionViewController addKeyCommand:](self, "addKeyCommand:", v8);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v7, 0x100000, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUIKeyboardableCollectionViewController addKeyCommand:](self, "addKeyCommand:", v9);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)isOnCard
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SearchUIKeyboardableCollectionViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (void)escapeButtonPressed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[SearchUIKeyboardableCollectionViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "action");
  objc_msgSend(v8, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendAction:to:from:forEvent:", v6, v7, 0, 0);

}

- (void)rightArrowPressed
{
  if (objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR"))
    -[SearchUIKeyboardableCollectionViewController selectHighlightedRow](self, "selectHighlightedRow");
  else
    -[SearchUIKeyboardableCollectionViewController goBack](self, "goBack");
}

- (void)leftArrowPressed
{
  if (objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR"))
    -[SearchUIKeyboardableCollectionViewController goBack](self, "goBack");
  else
    -[SearchUIKeyboardableCollectionViewController selectHighlightedRow](self, "selectHighlightedRow");
}

- (void)goBack
{
  id v2;
  id v3;

  -[SearchUIKeyboardableCollectionViewController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (void)returnKeyPressed
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    -[SearchUIKeyboardableCollectionViewController indexPathToSelectForKeyboardOnQuickReturn](self, "indexPathToSelectForKeyboardOnQuickReturn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIKeyboardableCollectionViewController highlightNextRowAtIndexPath:upward:](self, "highlightNextRowAtIndexPath:upward:", v6, 0);

  }
  -[SearchUIKeyboardableCollectionViewController selectHighlightedRow](self, "selectHighlightedRow");
}

- (id)indexPathToSelectForKeyboardOnQuickReturn
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
}

- (void)highlightRowAtIndexPath:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5 || objc_msgSend(0, "section") == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectItemAtIndexPath:animated:scrollPosition:", v5, 0, 0);

  }
}

- (void)upArrowPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "modifierFlags");
  v8 = objc_msgSend(v17, "section");
  v9 = objc_msgSend(v17, "row");
  if (v17)
  {
    if (objc_msgSend(v17, "row") < 1)
    {
      v10 = objc_msgSend(v17, "section");
      v11 = v10 - 1;
      if (v10 < 1)
      {
        -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        if ((v7 & 0x100000) != 0)
        {
          v9 = 0;
        }
        else
        {
          -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v12, "numberOfItemsInSection:", v11) - 1;

        }
        v8 = v11;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      v9 = 0;
    }
    else
    {
      v9 = objc_msgSend(v17, "row") - 1;
    }
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIKeyboardableCollectionViewController highlightNextRowAtIndexPath:upward:](self, "highlightNextRowAtIndexPath:upward:", v14, 1);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "becomeFirstResponder");

    if (objc_msgSend(v17, "section") == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SearchUIKeyboardableCollectionViewController moveCursorToBeginning](self, "moveCursorToBeginning");
    }
    else
    {
      -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "selectAll:", 0);

    }
  }

}

- (void)downArrowPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v4 = a3;
  -[SearchUIKeyboardableCollectionViewController moveCursorToEnd](self, "moveCursorToEnd");
  -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "modifierFlags");
  v8 = objc_msgSend(v20, "section");
  objc_msgSend(v20, "row");
  if (v20)
  {
    -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v20, "section"));
    v11 = objc_msgSend(v20, "row") + 1;

    if (v10 <= v11)
    {
      v12 = 0;
      v8 = objc_msgSend(v20, "section") + 1;
    }
    else if ((v7 & 0x100000) != 0)
    {
      v13 = objc_msgSend(v20, "section") + 1;
      -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "numberOfSections");

      if (v13 >= v15)
      {
        -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v16, "numberOfItemsInSection:", objc_msgSend(v20, "section")) - 1;

      }
      else
      {
        v12 = 0;
        v8 = v13;
      }
    }
    else
    {
      v12 = objc_msgSend(v20, "row") + 1;
    }
  }
  else
  {
    v8 = 0;
    v12 = 0;
  }
  -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 >= objc_msgSend(v17, "numberOfSections"))
    goto LABEL_13;
  -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "numberOfItemsInSection:", v8);

  if (v12 < v19)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v12, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIKeyboardableCollectionViewController highlightNextRowAtIndexPath:upward:](self, "highlightNextRowAtIndexPath:upward:", v17, 0);
LABEL_13:

  }
}

- (void)highlightNextRowAtIndexPath:(id)a3 upward:(BOOL)a4
{
  id v5;

  -[SearchUIKeyboardableCollectionViewController indexPathForNextSelectableIndexPath:upward:](self, "indexPathForNextSelectableIndexPath:upward:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "section") != 0x7FFFFFFFFFFFFFFFLL)
    -[SearchUIKeyboardableCollectionViewController scrollIndexPathToVisible:](self, "scrollIndexPathToVisible:", v5);
  -[SearchUIKeyboardableCollectionViewController highlightRowAtIndexPath:](self, "highlightRowAtIndexPath:", v5);

}

- (id)indexPathForNextSelectableIndexPath:(id)a3 upward:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "row") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "section") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    goto LABEL_4;
  }
  v9 = objc_msgSend(v6, "section");
  v10 = v9;
  if (!v4)
  {
    -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "numberOfSections");

    if (v10 < v15)
    {
      while (1)
      {
        if (v10 == objc_msgSend(v6, "section"))
          v16 = objc_msgSend(v6, "row");
        else
          v16 = 0;
        while (1)
        {
          -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "numberOfItemsInSection:", v10);

          if (v16 >= v18)
            break;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v16, v10);
          v7 = (id)objc_claimAutoreleasedReturnValue();
          if (-[SearchUIKeyboardableCollectionViewController canHighlightRowAtIndexPath:](self, "canHighlightRowAtIndexPath:", v7))
          {
            goto LABEL_4;
          }

          ++v16;
        }
        ++v10;
        -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "numberOfSections");

        v7 = 0;
        if (v10 >= v20)
          goto LABEL_4;
      }
    }
LABEL_26:
    v7 = 0;
    goto LABEL_4;
  }
  if (v9 < 0)
    goto LABEL_26;
  while (1)
  {
    if (v10 == objc_msgSend(v6, "section"))
    {
      v11 = objc_msgSend(v6, "row");
      if ((v11 & 0x8000000000000000) == 0)
        break;
      goto LABEL_14;
    }
    -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "numberOfItemsInSection:", v10) - 1;

    if ((v11 & 0x8000000000000000) == 0)
      break;
LABEL_14:
    v7 = 0;
    v13 = v10-- < 1;
    if (v13)
      goto LABEL_4;
  }
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v11, v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (-[SearchUIKeyboardableCollectionViewController canHighlightRowAtIndexPath:](self, "canHighlightRowAtIndexPath:", v7))
    {
      break;
    }

    v13 = v11-- <= 0;
    if (v13)
      goto LABEL_14;
  }
LABEL_4:

  return v7;
}

- (void)selectHighlightedRow
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SearchUIKeyboardableCollectionViewController scrollIndexPathToVisible:](self, "scrollIndexPathToVisible:", v6);
    -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectItemAtIndexPath:animated:scrollPosition:", v6, 0, 0);

  }
}

- (BOOL)canHighlightRowAtIndexPath:(id)a3
{
  return 1;
}

- (void)moveCursorToBeginning
{
  void *v3;
  id v4;

  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIKeyboardableCollectionViewController moveCursorToPosition:](self, "moveCursorToPosition:", v3);

}

- (void)moveCursorToEnd
{
  void *v3;
  id v4;

  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIKeyboardableCollectionViewController moveCursorToPosition:](self, "moveCursorToPosition:", v3);

}

- (void)moveCursorToPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textRangeFromPosition:toPosition:", v4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedTextRange:", v5);

}

- (void)scrollIndexPathToVisible:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 0, 0);

  -[SearchUIKeyboardableCollectionViewController interactionDelegate](self, "interactionDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didBeginScrolling");

}

- (double)contentHeight
{
  void *v2;
  double v3;
  double v4;

  -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSize");
  v4 = v3;

  return v4;
}

- (BOOL)contentIsTallEnoughToBeOccludedByCurrentKeyboardHeightAndTextField
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  double Height;
  double MinY;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  BOOL v28;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "convertRect:toView:", 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[SearchUIKeyboardableCollectionViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "screen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  Height = CGRectGetHeight(v30);

  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  MinY = CGRectGetMinY(v31);
  -[SearchUIKeyboardableCollectionViewController additionalKeyboardHeight](self, "additionalKeyboardHeight");
  if (v18 <= 0.0)
  {
    -[SearchUIKeyboardableCollectionViewController currentKeyboardHeight](self, "currentKeyboardHeight");
    v19 = v20;
  }
  else
  {
    v19 = Height - MinY;
  }
  -[SearchUIKeyboardableCollectionViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIKeyboardableCollectionViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  objc_msgSend(v21, "convertRect:toView:", 0);
  v23 = CGRectGetMinY(v32);

  if (v19 == 0.0)
    return 0;
  -[SearchUIKeyboardableCollectionViewController contentHeight](self, "contentHeight");
  v25 = v23 + v24;
  -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "adjustedContentInset");
  v28 = v25 + v27 + 2.0 > Height - v19;

  return v28;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double Height;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  CGRect v22;

  v21 = a3;
  -[SearchUIKeyboardableCollectionViewController interactionDelegate](self, "interactionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SearchUIKeyboardableCollectionViewController interactionDelegate](self, "interactionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didBeginScrolling");

    -[SearchUIKeyboardableCollectionViewController interactionDelegate](self, "interactionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldMonitorScrollingPastBottomOfContent");

    if (v7)
    {
      -[SearchUIKeyboardableCollectionViewController collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contentOffset");
      v10 = v9;
      objc_msgSend(v8, "contentSize");
      v12 = v11;
      objc_msgSend(v8, "bounds");
      Height = CGRectGetHeight(v22);
      objc_msgSend(v8, "adjustedContentInset");
      v15 = v14;
      objc_msgSend(v8, "panGestureRecognizer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "velocityInView:", v17);
      if (v18 < 0.0)
      {
        if (-[SearchUIKeyboardableCollectionViewController contentIsTallEnoughToBeOccludedByCurrentKeyboardHeightAndTextField](self, "contentIsTallEnoughToBeOccludedByCurrentKeyboardHeightAndTextField"))
        {
          if (v10 < v12 - Height + v15)
            goto LABEL_6;
          -[SearchUIKeyboardableCollectionViewController currentKeyboardHeight](self, "currentKeyboardHeight");
          v20 = v19;

          if (v20 != 0.0)
          {
LABEL_11:

            goto LABEL_12;
          }
        }
        else
        {

        }
        objc_msgSend(v21, "setScrollEnabled:", 0);
        objc_msgSend(v21, "setScrollEnabled:", 1);
        -[SearchUIKeyboardableCollectionViewController interactionDelegate](self, "interactionDelegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "didScrollPastBottomOfContent");
        goto LABEL_10;
      }
LABEL_6:

LABEL_10:
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v6;

  if (a4.y > 0.0
    && !-[SearchUIKeyboardableCollectionViewController shouldHideTableCellsUnderKeyboard](self, "shouldHideTableCellsUnderKeyboard", a3, a5, a4.x)&& -[SearchUIKeyboardableCollectionViewController contentIsTallEnoughToBeOccludedByCurrentKeyboardHeightAndTextField](self, "contentIsTallEnoughToBeOccludedByCurrentKeyboardHeightAndTextField")&& !+[SearchUIUtilities isMinimizedHardwareKeyboardMode](SearchUIUtilities, "isMinimizedHardwareKeyboardMode"))
  {
    -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

  }
}

- (void)showKeyboard
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRunningTest");

  if ((v4 & 1) == 0
    && -[SearchUIKeyboardableCollectionViewController _appearState](self, "_appearState") - 1 <= 1)
  {
    -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFirstResponder");

    if (v6)
    {
      -[SearchUIKeyboardableCollectionViewController selectAllTextInTextField](self, "selectAllTextInTextField");
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__SearchUIKeyboardableCollectionViewController_showKeyboard__block_invoke;
      block[3] = &unk_1EA1F62F0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

void __60__SearchUIKeyboardableCollectionViewController_showKeyboard__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "selectAllTextInTextField");
}

- (void)selectAllTextInTextField
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;

  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEmpty") & 1) != 0)
    goto LABEL_6;
  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "start");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginningOfDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqual:", v9))
  {

LABEL_6:
    goto LABEL_7;
  }
  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selectedTextRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "end");
  v17 = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endOfDocument");
  v14 = v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "isEqual:", v13);

  if ((v16 & 1) == 0)
  {
LABEL_7:
    -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectAll:", 0);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 0;
}

- (double)additionalKeyboardHeight
{
  return self->_additionalKeyboardHeight;
}

- (BOOL)shouldHideTableCellsUnderKeyboard
{
  return self->_shouldHideTableCellsUnderKeyboard;
}

- (void)setShouldHideTableCellsUnderKeyboard:(BOOL)a3
{
  self->_shouldHideTableCellsUnderKeyboard = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_destroyWeak((id *)&self->_textField);
}

@end
