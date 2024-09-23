@implementation UIKeyboardLayoutDictation

+ (id)activeInstance
{
  return (id)gDictationLayout;
}

- (UIKeyboardLayoutDictation)initWithFrame:(CGRect)a3
{
  UIKeyboardLayoutDictation *v3;
  UIKeyboardLayoutDictation *v4;
  UIKeyboardLayoutDictation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardLayoutDictation;
  v3 = -[UIKeyboardLayout initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    objc_storeStrong((id *)&gDictationLayout, v4);
    v5 = v4;
  }

  return v4;
}

+ (BOOL)keyboardInputMode:(id)a3 supportsResizingOffsetForScreenTraits:(id)a4
{
  id v5;
  id v6;
  char v7;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "idiom") == 1
    || objc_msgSend(v6, "idiom") == 24
    || objc_msgSend(v6, "idiom") == 25
    || objc_msgSend(v6, "idiom") == 26
    || objc_msgSend(v6, "idiom") == 23)
  {
    v7 = 0;
  }
  else
  {
    v9 = objc_msgSend(v6, "orientation");
    v7 = 0;
    if (v5 && (unint64_t)(v9 - 1) <= 1)
    {
      KBStarLayoutString(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "hasPrefix:", CFSTR("HWR"));

    }
  }

  return v7;
}

+ (CGSize)keyboardSizeForInputMode:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v6 = a4;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyboardInputModeToReturn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardLayoutStar keyboardSizeForInputMode:screenTraits:keyboardType:](UIKeyboardLayoutStar, "keyboardSizeForInputMode:screenTraits:keyboardType:", v9, v6, a5);
  v11 = v10;
  v13 = v12;
  if (objc_msgSend((id)objc_opt_class(), "keyboardInputMode:supportsResizingOffsetForScreenTraits:", v9, v6))
  {
    +[UIKBResizingKeyplaneCoordinator savedResizingOffset](UIKBResizingKeyplaneCoordinator, "savedResizingOffset");
    v13 = v13 + v14;
  }
  v15 = +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit");
  if (!+[UIKeyboardImpl showsGlobeAndDictationKeysExternally](UIKeyboardImpl, "showsGlobeAndDictationKeysExternally"))
  {
    objc_msgSend(v6, "keyboardWidth");
    v11 = v16;
  }
  if (v15)
    v13 = 216.0;

  v17 = v11;
  v18 = v13;
  result.height = v18;
  result.width = v17;
  return result;
}

- (BOOL)visible
{
  void *v2;
  BOOL v3;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)_clipCornersOfView:(id)a3
{
  if (self->_backgroundView == a3)
    return -1;
  else
    return 0;
}

- (void)setupBackgroundViewForNewSplitTraits:(id)a3
{
  unint64_t v4;
  void *v5;
  UIKBBackgroundView *backgroundView;
  UIKBBackgroundView *v7;
  UIKBBackgroundView *v8;
  UIKBBackgroundView *v9;
  UIKBTree *keyplane;
  UIKBTree *v11;
  UIKBTree *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  UIKBBackgroundView *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  id v42;

  v42 = a3;
  v4 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  v5 = v42;
  if (v4 == 1)
  {
    backgroundView = self->_backgroundView;
    if (v42)
    {
      if (!backgroundView)
      {
        v7 = [UIKBBackgroundView alloc];
        -[UIView bounds](self, "bounds");
        v8 = -[UIKBBackgroundView initWithFrame:](v7, "initWithFrame:");
        v9 = self->_backgroundView;
        self->_backgroundView = v8;

        backgroundView = self->_backgroundView;
      }
      -[UIView addSubview:](self, "addSubview:", backgroundView);
      -[UIView bounds](self, "bounds");
      -[UIView setFrame:](self->_backgroundView, "setFrame:");
      keyplane = self->_keyplane;
      if (keyplane)
      {
        self->_keyplane = 0;

      }
      +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 2);
      v11 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
      v12 = self->_keyplane;
      self->_keyplane = v11;

      -[UIKBTree setVisualStyle:](self->_keyplane, "setVisualStyle:", 103);
      -[UIKBTree setName:](self->_keyplane, "setName:", CFSTR("iPad-dictation-split"));
      +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setName:", CFSTR("split-left"));
      +[UIKBShape shape](UIKBShape, "shape");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "leftFrame");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      objc_msgSend(v14, "setFrame:");
      objc_msgSend(v14, "setPaddedFrame:", v16, v18, v20, v22);
      objc_msgSend(v13, "setShape:", v14);
      -[UIKBTree subtrees](self->_keyplane, "subtrees");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v13);

      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_boundsForInterfaceOrientation:", -[UIView _keyboardOrientation](self, "_keyboardOrientation"));
      v26 = v25;

      +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setName:", CFSTR("split-right"));
      objc_msgSend(v42, "rightFrame");
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v34 = v26 - v30;
      +[UIKBShape shape](UIKBShape, "shape");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setFrame:", v34, v29, v31, v33);
      objc_msgSend(v35, "setPaddedFrame:", v34, v29, v31, v33);
      objc_msgSend(v27, "setShape:", v35);
      -[UIKBTree subtrees](self->_keyplane, "subtrees");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObject:", v27);

      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
      -[UIView setNeedsDisplay](self->_backgroundView, "setNeedsDisplay");
      v37 = self->_backgroundView;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "_inheritedRenderConfig");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBBackgroundView setRenderConfig:](v37, "setRenderConfig:", v39);

      -[UIKBBackgroundView refreshStyleForKeyplane:inputTraits:](self->_backgroundView, "refreshStyleForKeyplane:inputTraits:", self->_keyplane, self->super._inputTraits);
      objc_msgSend(v13, "frame");
      -[UIView setFrame:](self->_backgroundView, "setFrame:", 0.0, 0.0, v26);
      -[UIView frame](self, "frame");
      v41 = v40;
      -[UIView frame](self, "frame");
      -[UIView setFrame:](self, "setFrame:", v41);

    }
    else
    {
      -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
      v13 = self->_backgroundView;
      self->_backgroundView = 0;
    }

    v5 = v42;
  }

}

- (void)showKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive"))
  {
    v23.receiver = self;
    v23.super_class = (Class)UIKeyboardLayoutDictation;
    -[UIKeyboardLayout showKeyboardWithInputTraits:screenTraits:splitTraits:](&v23, sel_showKeyboardWithInputTraits_screenTraits_splitTraits_, v8, v9, v10);
    -[UIKeyboardLayoutDictation setupBackgroundViewForNewSplitTraits:](self, "setupBackgroundViewForNewSplitTraits:", v10);
    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisplayDelegate:", 0);

    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self, "addSubview:", v12);

    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "automaticAppearanceEnabled");

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAutomaticAppearanceEnabled:", 1);

    -[UIView superview](self, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[UIView superview](self, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bounds](self, "bounds");
      +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_didChangeKeyplaneWithContext:", v21);

    }
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAutomaticAppearanceEnabled:", v15);

  }
}

- (void)setRenderConfig:(id)a3
{
  void *v4;
  UIKeyboardLayoutDictation *v5;
  int v6;
  id v7;

  v7 = a3;
  +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (UIKeyboardLayoutDictation *)objc_claimAutoreleasedReturnValue();
  if (v5 != self)
  {

LABEL_5:
    goto LABEL_6;
  }
  v6 = +[UIDictationController viewMode](UIDictationController, "viewMode");

  if (v6 == 2)
  {
    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRenderConfig:", v7);
    goto LABEL_5;
  }
LABEL_6:
  -[UIKBBackgroundView setRenderConfig:](self->_backgroundView, "setRenderConfig:", v7);

}

- (void)layoutSubviews
{
  void *v3;
  UIKeyboardLayoutDictation *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  objc_super v15;

  +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (UIKeyboardLayoutDictation *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[UIView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

    v15.receiver = self;
    v15.super_class = (Class)UIKeyboardLayoutDictation;
    -[UIView layoutSubviews](&v15, sel_layoutSubviews);
  }
}

- (BOOL)shouldFadeFromLayout
{
  return 0;
}

- (BOOL)shouldFadeToLayout
{
  return 1;
}

- (CGSize)splitLeftSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIKBTree frameForKeylayoutName:](self->_keyplane, "frameForKeylayoutName:", CFSTR("split-left"));
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)currentKeyplane
{
  return self->_keyplane;
}

- (BOOL)usesAutoShift
{
  return 1;
}

- (CGRect)dragGestureRectInView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
