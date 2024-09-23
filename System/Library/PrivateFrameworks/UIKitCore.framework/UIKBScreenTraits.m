@implementation UIKBScreenTraits

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screen, 0);
}

+ (UIKBScreenTraits)traitsWithScreen:(id)a3 orientation:(int64_t)a4
{
  id v5;
  UIKBScreenTraits *v6;

  v5 = a3;
  v6 = -[UIKBScreenTraits initWithScreen:orientation:allowFloating:ignoreRemoteKeyboard:]([UIKBScreenTraits alloc], "initWithScreen:orientation:allowFloating:ignoreRemoteKeyboard:", v5, a4, 1, 0);

  return v6;
}

- (CGSize)keyboardScreenReferenceSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_activeKeyboardWindowForScreen:", self->_screen);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "keyboardScreenReferenceSize");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    -[UIScreen _referenceBounds](self->_screen, "_referenceBounds");
    v5 = v8;
    v7 = v9;
  }

  v10 = v5;
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIKBScreenTraits)initWithScreen:(id)a3 orientation:(int64_t)a4 allowFloating:(BOOL)a5 ignoreRemoteKeyboard:(BOOL)a6
{
  _BOOL4 v7;
  id v10;
  UIKBScreenTraits *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  int64_t v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  void *v30;
  void *v31;
  int IsEmojiPoster;
  BOOL v33;
  UIKBScreenTraits *v34;
  double v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double keyboardWidth;
  double v52;
  double v53;
  double v54;
  double v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD block[4];
  UIKBScreenTraits *v61;
  objc_super v62;
  _BYTE v63[128];
  uint64_t v64;

  v7 = a5;
  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v62.receiver = self;
  v62.super_class = (Class)UIKBScreenTraits;
  v11 = -[UIKBScreenTraits init](&v62, sel_init);
  if (v11)
  {
    if (!v10 || objc_msgSend(v10, "_userInterfaceIdiom") == -1)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v12;
    }
    objc_msgSend((id)objc_opt_class(), "_activeKeyboardWindowForScreen:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_activeUCBWindowForScreen:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v11->_screen, v10);
    v15 = objc_msgSend(v13, "_keyboardOrientation");
    if ((!a4 || v15 == a4) && v13)
    {
      objc_msgSend(v13, "bounds");
      v11->_bounds.origin.x = v16;
      v11->_bounds.origin.y = v17;
      v11->_bounds.size.width = v18;
      v11->_bounds.size.height = v19;
      v20 = objc_msgSend(v13, "_keyboardOrientation");
    }
    else
    {
      -[UIScreen _boundsForInterfaceOrientation:](v11->_screen, "_boundsForInterfaceOrientation:", a4);
      v11->_bounds.origin.x = v21;
      v11->_bounds.origin.y = v22;
      v11->_bounds.size.width = v23;
      v11->_bounds.size.height = v24;
      v20 = a4;
    }
    v11->_orientation = v20;
    objc_msgSend(v14, "bounds");
    v11->_assistantViewWindowBounds.origin.x = v25;
    v11->_assistantViewWindowBounds.origin.y = v26;
    v11->_assistantViewWindowBounds.size.width = v27;
    v11->_assistantViewWindowBounds.size.height = v28;
    -[UIScreen traitCollection](v11->_screen, "traitCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_touchInput = objc_msgSend(v29, "primaryInteractionModel") == 1;

    -[UIScreen traitCollection](v11->_screen, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_knobInput = objc_msgSend(v30, "primaryInteractionModel") == 2;

    -[UIScreen traitCollection](v11->_screen, "traitCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_touchpadInput = objc_msgSend(v31, "primaryInteractionModel") == 8;

    v11->_isLinear = 0;
    v11->_isFirstPartyStickers = _UIApplicationIsFirstPartyStickers();
    IsEmojiPoster = _UIApplicationIsEmojiPoster();
    v33 = 0;
    if (IsEmojiPoster)
      v33 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
    v11->_isEmojiPosterOniPad = v33;
    v11->_isStickerPickerService = _UIApplicationIsStickerPickerService();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__UIKBScreenTraits_initWithScreen_orientation_allowFloating_ignoreRemoteKeyboard___block_invoke;
    block[3] = &unk_1E16B1B28;
    v34 = v11;
    v61 = v34;
    if (qword_1ECD7F028 != -1)
      dispatch_once(&qword_1ECD7F028, block);
    if (_MergedGlobals_1137)
      v34->_preferredEmojiScrollingDirection = 1;
    if (v7 && +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    {
      +[UIKeyboardImpl floatingScreenWidthToEmulate](UIKeyboardImpl, "floatingScreenWidthToEmulate");
      v34->_keyboardWidth = v35;
      v34->_assistantViewWidth = v35;
      v34->_isKeyboardMinorEdgeWidth = 1;
      v34->_isFloating = 1;
    }
    else if (v11->_isFirstPartyStickers)
    {
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v36 = (id)objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        if (v36)
        {
          v38 = *(_QWORD *)v57;
          while (2)
          {
            for (i = 0; i != v36; i = (char *)i + 1)
            {
              if (*(_QWORD *)v57 != v38)
                objc_enumerationMutation(v37);
              v40 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
              if ((objc_msgSend(v40, "_isTextEffectsWindow", (_QWORD)v56) & 1) == 0)
              {
                v36 = v40;
                goto LABEL_33;
              }
            }
            v36 = (id)objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
            if (v36)
              continue;
            break;
          }
        }
LABEL_33:

      }
      objc_msgSend(v36, "rootViewController", (_QWORD)v56);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "bounds");
      v34->_keyboardWidth = v44;

      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        keyboardWidth = v34->_keyboardWidth;
        if (keyboardWidth > 767.0)
          keyboardWidth = 767.0;
        v34->_keyboardWidth = keyboardWidth;
      }
      v34->_isKeyboardMinorEdgeWidth = 1;
      v34->_isEmulatingIdiom = 1;
      v34->_idiomToEmulate = 0;

    }
    else if (v11->_isEmojiPosterOniPad)
    {
      v34->_isKeyboardMinorEdgeWidth = 1;
      +[UIKeyboardImpl floatingScreenWidthToEmulate](UIKeyboardImpl, "floatingScreenWidthToEmulate");
      v34->_keyboardWidth = v41;
      v34->_assistantViewWidth = v41;
      v34->_isEmulatingIdiom = 1;
      v34->_idiomToEmulate = 0;
    }
    else
    {
      if (!v13 || a6)
        -[UIScreen _boundsForInterfaceOrientation:](v11->_screen, "_boundsForInterfaceOrientation:", a4);
      else
        objc_msgSend(v13, "bounds");
      v34->_keyboardWidth = v52;
      v34->_assistantViewWidth = v11->_assistantViewWindowBounds.size.width;
      -[UIScreen _referenceBounds](v11->_screen, "_referenceBounds");
      if (v53 >= v54)
        v55 = v54;
      else
        v55 = v53;
      v34->_isKeyboardMinorEdgeWidth = v55 == v34->_keyboardWidth;
      if (objc_msgSend(v10, "_userInterfaceIdiom") == 2 || objc_msgSend(v10, "_userInterfaceIdiom") == 8)
      {
        v11->_isLinear = 1;
        if (objc_msgSend(v10, "_userInterfaceIdiom") == 8)
        {
          v34->_isEmulatingIdiom = 1;
          v34->_idiomToEmulate = 2;
        }
      }
    }
    __asm { FMOV            V0.2D, #1.0 }
    v34->_stretchFactor = _Q0;

  }
  return v11;
}

+ (id)_activeKeyboardWindowForScreen:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "oldPathForSnapshot");

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "containerWindow");
  else
    objc_msgSend(v6, "keyboardWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v3, "_userInterfaceIdiom");
  if (v9 == 3)
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  return v8;
}

+ (id)_activeUCBWindowForScreen:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "_activeKeyboardWindowForScreen:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualModeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldShowWithinAppWindow");

  if (v6)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerWindow");
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  return v3;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (int64_t)idiom
{
  int64_t result;
  double v4;
  double v5;
  double v6;
  double v7;

  result = _mockIdiom;
  if (_mockIdiom == -1)
  {
    if (self->_isEmulatingIdiom)
    {
      return self->_idiomToEmulate;
    }
    else
    {
      result = -[UIScreen _userInterfaceIdiom](self->_screen, "_userInterfaceIdiom");
      if (result == 1)
      {
        if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
        {
          -[UIScreen bounds](self->_screen, "bounds");
          if (v4 >= v5)
            v6 = v5;
          else
            v6 = v4;
          v7 = _UIScreenReferenceBoundsSizeForType(0xFuLL);
          return v6 >= (v7 + _UIScreenReferenceBoundsSizeForType(0x27uLL)) * 0.5;
        }
        else
        {
          return 1;
        }
      }
    }
  }
  return result;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CGRect)assistantViewWindowBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_assistantViewWindowBounds.origin.x;
  y = self->_assistantViewWindowBounds.origin.y;
  width = self->_assistantViewWindowBounds.size.width;
  height = self->_assistantViewWindowBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)assistantViewWidth
{
  return self->_assistantViewWidth;
}

- (BOOL)supportsSplit
{
  return self->_supportsSplit;
}

- (CGSize)stretchFactor
{
  double width;
  double height;
  CGSize result;

  width = self->_stretchFactor.width;
  height = self->_stretchFactor.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (BOOL)resizeKeyboardHeight
{
  return self->_resizeKeyboardHeight;
}

- (double)keyboardWidth
{
  return self->_keyboardWidth;
}

- (BOOL)isSplit
{
  return self->_isSplit;
}

- (BOOL)centerFilled
{
  return self->_centerFilled;
}

- (void)setSupportsSplit:(BOOL)a3
{
  self->_supportsSplit = a3;
}

- (void)setStretchFactor:(CGSize)a3
{
  self->_stretchFactor = a3;
}

- (void)setKeyboardBarHeight:(double)a3
{
  self->_keyboardBarHeight = a3;
}

- (void)setIsSplit:(BOOL)a3
{
  self->_isSplit = a3;
}

- (void)setCenterFilled:(BOOL)a3
{
  self->_centerFilled = a3;
}

void __82__UIKBScreenTraits_initWithScreen_orientation_allowFloating_ignoreRemoteKeyboard___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  id v4;

  if (qword_1ECD7F030 != -1)
    dispatch_once(&qword_1ECD7F030, &__block_literal_global_353);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForPreferenceKey:", CFSTR("VerticalScrollingInEmojiKeyboard"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = (objc_msgSend(v4, "BOOLValue") & 1) != 0 || *(_BYTE *)(*(_QWORD *)(a1 + 32) + 35) != 0;
  _MergedGlobals_1137 = v3;

}

+ (id)fullScreenTraitsWithScreen:(id)a3 orientation:(int64_t)a4
{
  id v5;
  UIKBScreenTraits *v6;

  v5 = a3;
  v6 = -[UIKBScreenTraits initWithScreen:orientation:allowFloating:ignoreRemoteKeyboard:]([UIKBScreenTraits alloc], "initWithScreen:orientation:allowFloating:ignoreRemoteKeyboard:", v5, a4, 0, 0);

  return v6;
}

+ (id)traitsForInputModeWithScreen:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[UIKBScreenTraits initForInputModeWithScreen:]([UIKBScreenTraits alloc], "initForInputModeWithScreen:", v3);

  return v4;
}

+ (UIKBScreenTraits)traitsWithScreen:(id)a3 orientation:(int64_t)a4 ignoreRemoteKeyboard:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  UIKBScreenTraits *v8;

  v5 = a5;
  v7 = a3;
  v8 = -[UIKBScreenTraits initWithScreen:orientation:allowFloating:ignoreRemoteKeyboard:]([UIKBScreenTraits alloc], "initWithScreen:orientation:allowFloating:ignoreRemoteKeyboard:", v7, a4, 1, v5);

  return v8;
}

+ (id)traitsForPopoverEmulatingWidth:(double)a3 minorEdge:(BOOL)a4 orientation:(int64_t)a5 idiom:(int64_t)a6
{
  UIKBScreenTraits *v9;

  v9 = -[UIKBScreenTraits initWithScreen:orientation:allowFloating:ignoreRemoteKeyboard:]([UIKBScreenTraits alloc], "initWithScreen:orientation:allowFloating:ignoreRemoteKeyboard:", 0, a5, 0, 0);
  v9->_keyboardWidth = a3;
  v9->_assistantViewWidth = a3;
  *(_WORD *)&v9->_isKeyboardMinorEdgeWidth = 257;
  v9->_orientation = a5;
  v9->_isEmulatingIdiom = 1;
  v9->_idiomToEmulate = a6;
  return v9;
}

+ (id)traitsForRemoteEmojiKeyboardForHostWidth:(double)a3 clientWidth:(double)a4 minorEdge:(BOOL)a5 orientation:(int64_t)a6 idiom:(int64_t)a7 isPopover:(BOOL)a8
{
  _BOOL4 v8;
  UIKBScreenTraits *v14;

  v8 = a8;
  v14 = -[UIKBScreenTraits initWithScreen:orientation:allowFloating:ignoreRemoteKeyboard:]([UIKBScreenTraits alloc], "initWithScreen:orientation:allowFloating:ignoreRemoteKeyboard:", 0, a6, 0, 0);
  v14->_keyboardWidth = a4;
  v14->_assistantViewWidth = a4;
  v14->_hostKeyboardWidth = a3;
  v14->_isKeyboardMinorEdgeWidth = a5;
  v14->_orientation = a6;
  v14->_isEmulatingIdiom = 1;
  v14->_idiomToEmulate = a7;
  v14->_isInPopover = v8;
  if (v8)
    v14->_preferredEmojiScrollingDirection = 1;
  v14->_isStickerPickerServiceCollectionView = 1;
  return v14;
}

+ (void)setMockIdiom:(int64_t)a3
{
  _mockIdiom = a3;
}

- (id)initForInputModeWithScreen:(id)a3
{
  id v4;
  UIKBScreenTraits *v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIKBScreenTraits;
  v5 = -[UIKBScreenTraits init](&v8, sel_init);
  if (v5)
  {
    if (!v4)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v4, "_userInterfaceIdiom") == -1)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v6;
    }
    objc_storeStrong((id *)&v5->_screen, v4);
  }

  return v5;
}

- (void)updateForTextInputTraits:(id)a3 supportedInteractionModel:(unint64_t)a4
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (-[UIScreen _userInterfaceIdiom](self->_screen, "_userInterfaceIdiom", a3) == 3)
  {
    if (UIKeyboardCarPlayRequiresTouch())
      v6 = 1;
    else
      v6 = a4;
    switch(v6)
    {
      case 1uLL:
        v7 = 26;
        v8 = 24;
        v9 = 25;
        break;
      case 8uLL:
        v7 = 24;
        v8 = 25;
        v9 = 26;
        break;
      case 2uLL:
        v7 = 26;
        v8 = 25;
        v9 = 24;
        break;
      default:
        return;
    }
    *((_BYTE *)&self->super.isa + v9) = 1;
    *((_BYTE *)&self->super.isa + v8) = 0;
    *((_BYTE *)&self->super.isa + v7) = 0;
  }
}

- (void)updateForLinearLayout:(BOOL)a3
{
  self->_isLinear = a3;
}

- (BOOL)isEmojiScrollingDirectionVertical
{
  return self->_preferredEmojiScrollingDirection == 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("; idiom = %d"), -[UIKBScreenTraits idiom](self, "idiom"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; isFloating = %d"), -[UIKBScreenTraits isFloating](self, "isFloating"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; touchInput = %d"), -[UIKBScreenTraits touchInput](self, "touchInput"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; knobInput = %d"), -[UIKBScreenTraits knobInput](self, "knobInput"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; touchpadInput = %d"),
    -[UIKBScreenTraits touchpadInput](self, "touchpadInput"));
  -[UIKBScreenTraits keyboardWidth](self, "keyboardWidth");
  objc_msgSend(v3, "appendFormat:", CFSTR("; keyboardWidth = %f"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("; isKeyboardMinorEdgeWidth = %d"),
    -[UIKBScreenTraits isKeyboardMinorEdgeWidth](self, "isKeyboardMinorEdgeWidth"));
  if (self->_keyboardBarHeight > 0.0)
  {
    -[UIKBScreenTraits keyboardBarHeight](self, "keyboardBarHeight");
    objc_msgSend(v3, "appendFormat:", CFSTR("; keyboardBarHeight = %f"), v5);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (BOOL)knobInput
{
  return self->_knobInput;
}

- (BOOL)touchInput
{
  return self->_touchInput;
}

- (BOOL)touchpadInput
{
  return self->_touchpadInput;
}

- (void)setKeyboardWidth:(double)a3
{
  self->_keyboardWidth = a3;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (BOOL)isKeyboardMinorEdgeWidth
{
  return self->_isKeyboardMinorEdgeWidth;
}

- (double)keyboardBarHeight
{
  return self->_keyboardBarHeight;
}

- (BOOL)isInPopover
{
  return self->_isInPopover;
}

- (int64_t)preferredEmojiScrollingDirection
{
  return self->_preferredEmojiScrollingDirection;
}

- (void)setPreferredEmojiScrollingDirection:(int64_t)a3
{
  self->_preferredEmojiScrollingDirection = a3;
}

- (void)setAssistantViewWidth:(double)a3
{
  self->_assistantViewWidth = a3;
}

- (void)setAssistantViewWindowBounds:(CGRect)a3
{
  self->_assistantViewWindowBounds = a3;
}

- (BOOL)isLinear
{
  return self->_isLinear;
}

- (void)setResizeKeyboardHeight:(BOOL)a3
{
  self->_resizeKeyboardHeight = a3;
}

- (double)keyboardHeightAdjustment
{
  return self->_keyboardHeightAdjustment;
}

- (void)setKeyboardHeightAdjustment:(double)a3
{
  self->_keyboardHeightAdjustment = a3;
}

- (CGSize)preferredContentSizeInPopover
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSizeInPopover.width;
  height = self->_preferredContentSizeInPopover.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSizeInPopover:(CGSize)a3
{
  self->_preferredContentSizeInPopover = a3;
}

@end
