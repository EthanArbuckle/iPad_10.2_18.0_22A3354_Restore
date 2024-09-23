@implementation UIKeyboardEmojiAndStickerCollectionInputView

+ (BOOL)wantsScreenTraits
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return CFSTR("UIKeyboardEmojiAndStickerCollectionInputView Preview");
}

- (UIKeyboardEmojiAndStickerCollectionInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  UIKeyboardEmojiAndStickerCollectionInputView *v34;
  os_log_t v35;
  OS_os_log *logger;
  void *v37;
  id v38;
  uint64_t v39;
  STKImageGlyphDataSource *imageGlyphDataSource;
  void *v41;
  uint64_t v42;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  void *v44;
  NSIndexPath *unavailableLaunchPath;
  UIKeyboardEmojiLayout *v46;
  UICollectionViewFlowLayout *flowLayout;
  UICollectionViewFlowLayout *v48;
  uint64_t v49;
  UICollectionViewCompositionalLayoutConfiguration *v50;
  UICollectionViewCompositionalLayout *v51;
  UIKeyboardEmojiAndStickerCollectionView *v52;
  uint64_t v53;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  UIKeyboardEmojiAndStickerCollectionView *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v64[4];
  id v65;
  objc_super v66;
  id location[5];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_msgSend(v15, "orientation");
  if (v15)
  {
    v17 = v16;
  }
  else
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "interfaceOrientation");

    +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v19, v17);
    v15 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  }
  v20 = v17 - 3;
  v21 = (unint64_t)(v17 - 3) <= 1 && objc_msgSend(v15, "idiom") != 1;
  self->_useWideAnimojiCell = v21;
  objc_msgSend(v13, "frame");
  v22 = 0.0;
  if (width != v23 && (!v15 || !v15[35]))
  {
    objc_msgSend(v13, "frame");
    v25 = (width - v24) * 0.5;
    v72.origin.x = x;
    v72.origin.y = y;
    v72.size.width = width;
    v72.size.height = height;
    v73 = CGRectInset(v72, v25, 0.0);
    x = v73.origin.x;
    y = v73.origin.y;
    width = v73.size.width;
    height = v73.size.height;
    objc_msgSend(v15, "bounds");
    if (v26 >= 812.0)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      v29 = v28;
      v31 = v30;

      if (v29 <= v31)
        v32 = v31;
      else
        v32 = v29;
      if (v29 >= v31)
        v33 = v31;
      else
        v33 = v29;
      if (v20 >= 2)
        v32 = v33;
      v22 = (width - v32) * 0.5;
      v74.origin.x = x;
      v74.origin.y = y;
      v74.size.width = width;
      v74.size.height = height;
      v75 = CGRectInset(v74, v22, 0.0);
      x = v75.origin.x;
      y = v75.origin.y;
      width = v75.size.width;
      height = v75.size.height;
    }
  }
  v66.receiver = self;
  v66.super_class = (Class)UIKeyboardEmojiAndStickerCollectionInputView;
  v34 = -[UIView initWithFrame:](&v66, sel_initWithFrame_, x, y, width, height);
  if (v34)
  {
    v35 = os_log_create("com.apple.uikit", "StickerCollectionInputView");
    logger = v34->_logger;
    v34->_logger = (OS_os_log *)v35;

    v68 = 0;
    v69 = &v68;
    v70 = 0x2050000000;
    v37 = (void *)_MergedGlobals_11_8;
    v71 = _MergedGlobals_11_8;
    if (!_MergedGlobals_11_8)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getSTKImageGlyphDataSourceClass_block_invoke_0;
      location[3] = &unk_1E16B14C0;
      location[4] = &v68;
      __getSTKImageGlyphDataSourceClass_block_invoke_0((uint64_t)location);
      v37 = (void *)v69[3];
    }
    v38 = objc_retainAutorelease(v37);
    _Block_object_dispose(&v68, 8);
    if (v38)
    {
      objc_msgSend(v38, "sharedInstance");
      v39 = objc_claimAutoreleasedReturnValue();
      imageGlyphDataSource = v34->_imageGlyphDataSource;
      v34->_imageGlyphDataSource = (STKImageGlyphDataSource *)v39;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObserver:selector:name:object:", v34, sel_updateDataSourceSnapshot, CFSTR("com.apple.stickerkit.ImageGlyphDataSourceDidUpdate"), 0);
    }
    else
    {
      v41 = v34->_imageGlyphDataSource;
      v34->_imageGlyphDataSource = 0;
    }

    +[UIKeyboardEmojiCategory setDoesShowStickers:](UIKeyboardEmojiCategory, "setDoesShowStickers:", -[UIKeyboardEmojiAndStickerCollectionInputView doesShowStickers](v34, "doesShowStickers"));
    v34->_frameInset = v22;
    +[UIKeyboardEmojiGraphicsTraits emojiGraphicsTraitsWithScreenTraits:](UIKeyboardEmojiGraphicsTraits, "emojiGraphicsTraitsWithScreenTraits:", v15);
    v42 = objc_claimAutoreleasedReturnValue();
    emojiGraphicsTraits = v34->_emojiGraphicsTraits;
    v34->_emojiGraphicsTraits = (UIKeyboardEmojiGraphicsTraits *)v42;

    +[UIColor clearColor](UIColor, "clearColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v34, "setBackgroundColor:", v44);

    -[UIView setOpaque:](v34, "setOpaque:", 0);
    -[UIKBKeyView updateForKeyplane:key:](v34, "updateForKeyplane:key:", v13, v14);
    v34->_isDraggingInputView = 0;
    unavailableLaunchPath = v34->_unavailableLaunchPath;
    v34->_unavailableLaunchPath = 0;

    v46 = objc_alloc_init(UIKeyboardEmojiLayout);
    flowLayout = v34->_flowLayout;
    v34->_flowLayout = &v46->super;

    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v34->_flowLayout, "setMinimumInteritemSpacing:", 0.0);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v34->_flowLayout, "setMinimumLineSpacing:", 0.0);
    -[UICollectionViewFlowLayout setScrollDirection:](v34->_flowLayout, "setScrollDirection:", objc_msgSend(v15, "isEmojiScrollingDirectionVertical") ^ 1);
    v48 = v34->_flowLayout;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[STKImageGlyphDataSource imageGlyphCompositionalLayout](v34->_imageGlyphDataSource, "imageGlyphCompositionalLayout");
      v49 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_31:
        v52 = [UIKeyboardEmojiAndStickerCollectionView alloc];
        -[UIView bounds](v34, "bounds");
        v53 = -[UIKeyboardEmojiAndStickerCollectionView initWithFrame:collectionViewLayout:emojiGraphicsTraits:](v52, "initWithFrame:collectionViewLayout:emojiGraphicsTraits:", v48, v34->_emojiGraphicsTraits);
        collectionView = v34->_collectionView;
        v34->_collectionView = (UIKeyboardEmojiAndStickerCollectionView *)v53;

        -[UICollectionView setPrefetchingEnabled:](v34->_collectionView, "setPrefetchingEnabled:", 1);
        v55 = v34->_collectionView;
        +[UIColor clearColor](UIColor, "clearColor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionView setBackgroundColor:](v55, "setBackgroundColor:", v56);

        -[UIView setAutoresizingMask:](v34->_collectionView, "setAutoresizingMask:", 18);
        -[UIView contentScaleFactor](v34, "contentScaleFactor");
        -[UIView setContentScaleFactor:](v34->_collectionView, "setContentScaleFactor:");
        -[UICollectionView setDelegate:](v34->_collectionView, "setDelegate:", v34);
        -[UIScrollView setShowsHorizontalScrollIndicator:](v34->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
        -[UIScrollView setShowsVerticalScrollIndicator:](v34->_collectionView, "setShowsVerticalScrollIndicator:", 0);
        -[UIScrollView panGestureRecognizer](v34->_collectionView, "panGestureRecognizer");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setMaximumNumberOfTouches:", 1);

        -[UIScrollView panGestureRecognizer](v34->_collectionView, "panGestureRecognizer");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setMinimumNumberOfTouches:", 1);

        -[UIScrollView panGestureRecognizer](v34->_collectionView, "panGestureRecognizer");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setFailsPastMaxTouches:", 1);

        -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v34->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("UICollectionElementKindSectionHeader"), CFSTR("kEmojiCategoryTitleIdentifier"));
        -[UIKeyboardEmojiAndStickerCollectionInputView configureDataSource](v34, "configureDataSource");
        -[UIKeyboardEmojiAndStickerCollectionInputView updateDataSourceSnapshotAnimated:](v34, "updateDataSourceSnapshotAnimated:", 0);
        v34->_hasCompletedInitialDisplay = 0;
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v34->_inputDelegateCanSupportAnimoji = objc_msgSend(v60, "canPasteImage");

        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "valueForKey:", CFSTR("com.apple.Animoji.StickerRecents.SplashVersion"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v34->_hasShownAnimojiFirstTimeExperience = v62 != 0;

        v34->_shouldRetryFetchingAnimojiRecents = 0;
        -[UIView addSubview:](v34, "addSubview:", v34->_collectionView);
        -[UIKeyboardEmojiAndStickerCollectionInputView _setupLongPressGestureRecognizer](v34, "_setupLongPressGestureRecognizer");
        -[UIKeyboardEmojiAndStickerCollectionInputView _setupTapGestureRecognizer](v34, "_setupTapGestureRecognizer");

        goto LABEL_32;
      }
      v50 = objc_alloc_init(UICollectionViewCompositionalLayoutConfiguration);
      -[UICollectionViewCompositionalLayoutConfiguration setScrollDirection:](v50, "setScrollDirection:", objc_msgSend(v15, "isEmojiScrollingDirectionVertical") ^ 1);
      objc_initWeak(location, v34);
      v51 = [UICollectionViewCompositionalLayout alloc];
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __88__UIKeyboardEmojiAndStickerCollectionInputView_initWithFrame_keyplane_key_screenTraits___block_invoke;
      v64[3] = &unk_1E16DB350;
      objc_copyWeak(&v65, location);
      v49 = -[UICollectionViewCompositionalLayout initWithSectionProvider:configuration:](v51, "initWithSectionProvider:configuration:", v64, v50);

      objc_destroyWeak(&v65);
      objc_destroyWeak(location);
      v48 = (UICollectionViewFlowLayout *)v50;
    }

    v48 = (UICollectionViewFlowLayout *)v49;
    goto LABEL_31;
  }
LABEL_32:

  return v34;
}

id __88__UIKeyboardEmojiAndStickerCollectionInputView_initWithFrame_keyplane_key_screenTraits___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  void *v8;

  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[103], "sectionLayoutForSectionIndex:environment:", a2, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_addDelegate:(id)a3
{
  id v4;
  NSHashTable *delegates;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    delegates = self->_delegates;
    v8 = v4;
    if (!delegates)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_delegates;
      self->_delegates = v6;

      delegates = self->_delegates;
    }
    -[NSHashTable addObject:](delegates, "addObject:", v8);
    v4 = v8;
  }

}

- (void)_removeDelegate:(id)a3
{
  id v4;
  NSUInteger v5;
  NSHashTable *delegates;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSHashTable removeObject:](self->_delegates, "removeObject:", v4);
    v5 = -[NSHashTable count](self->_delegates, "count");
    v4 = v7;
    if (!v5)
    {
      delegates = self->_delegates;
      self->_delegates = 0;

      v4 = v7;
    }
  }

}

- (void)_notifyDelegatesRearrangeModeChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_delegates, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "rearrangeStateChanged:", v3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)rearrangeStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *logger;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_185066000, logger, OS_LOG_TYPE_DEFAULT, "Rearrange state changed to: %{BOOL}d", (uint8_t *)v6, 8u);
  }
  -[UIKeyboardEmojiAndStickerCollectionInputView _setRearrangeMode:](self, "_setRearrangeMode:", v3);
}

- (void)_setupLongPressGestureRecognizer
{
  UILongPressGestureRecognizer *v3;
  UILongPressGestureRecognizer *longPressRecognizer;

  if (self->_longPressRecognizer)
    -[UIView removeGestureRecognizer:](self->_collectionView, "removeGestureRecognizer:");
  v3 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleLongPress_);
  longPressRecognizer = self->_longPressRecognizer;
  self->_longPressRecognizer = v3;

  -[UIGestureRecognizer setDelegate:](self->_longPressRecognizer, "setDelegate:", self);
  -[UIGestureRecognizer setEnabled:](self->_longPressRecognizer, "setEnabled:", 0);
  -[UIView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", self->_longPressRecognizer);
}

- (void)_handleLongPress:(id)a3
{
  UILongPressGestureRecognizer *v4;
  uint64_t v5;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UILongPressGestureRecognizer *v18;

  v4 = (UILongPressGestureRecognizer *)a3;
  if (self->_longPressRecognizer == v4 && self->_isRearranging)
  {
    v18 = v4;
    v5 = -[UIGestureRecognizer state](v4, "state") - 1;
    v4 = v18;
    switch(v5)
    {
      case 0:
        collectionView = self->_collectionView;
        -[UILongPressGestureRecognizer locationInView:](v18, "locationInView:", collectionView);
        -[UICollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          -[UICollectionView beginInteractiveMovementForItemAtIndexPath:](self->_collectionView, "beginInteractiveMovementForItemAtIndexPath:", v7);
          -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            -[UILongPressGestureRecognizer locationInView:](v18, "locationInView:", v8);
            v10 = v9;
            v12 = v11;
            objc_msgSend(v8, "frame");
            v14 = v13 * 0.5;
            objc_msgSend(v8, "frame");
            self->_touchOffsetForMovingCell.x = v14 - v10;
            self->_touchOffsetForMovingCell.y = v15 * 0.5 - v12;
          }
          else
          {
            self->_touchOffsetForMovingCell = (CGPoint)*MEMORY[0x1E0C9D538];
          }

        }
        else
        {
          -[UIKeyboardEmojiAndStickerCollectionInputView _setRearrangeMode:](self, "_setRearrangeMode:", 0);
        }

        goto LABEL_14;
      case 1:
        -[UILongPressGestureRecognizer locationInView:](v18, "locationInView:", self->_collectionView);
        -[UICollectionView updateInteractiveMovementTargetPosition:](self->_collectionView, "updateInteractiveMovementTargetPosition:", v16 + self->_touchOffsetForMovingCell.x, v17 + self->_touchOffsetForMovingCell.y);
        goto LABEL_14;
      case 2:
        -[UICollectionView endInteractiveMovement](self->_collectionView, "endInteractiveMovement");
        goto LABEL_14;
      case 3:
        -[UICollectionView cancelInteractiveMovement](self->_collectionView, "cancelInteractiveMovement");
LABEL_14:
        v4 = v18;
        break;
      default:
        break;
    }
  }

}

- (void)_setupTapGestureRecognizer
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *tapRecognizer;

  if (self->_tapRecognizer)
    -[UIView removeGestureRecognizer:](self->_collectionView, "removeGestureRecognizer:");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleTap_);
  tapRecognizer = self->_tapRecognizer;
  self->_tapRecognizer = v3;

  -[UIGestureRecognizer setEnabled:](self->_tapRecognizer, "setEnabled:", 0);
  -[UIGestureRecognizer setDelegate:](self->_tapRecognizer, "setDelegate:", self);
  -[UIView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", self->_tapRecognizer);
}

- (void)_handleTap:(id)a3
{
  UITapGestureRecognizer *v4;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  void *v6;
  UITapGestureRecognizer *v7;

  v4 = (UITapGestureRecognizer *)a3;
  if (self->_tapRecognizer == v4 && self->_isRearranging)
  {
    collectionView = self->_collectionView;
    v7 = v4;
    -[UITapGestureRecognizer locationInView:](v4, "locationInView:", collectionView);
    -[UICollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[UIKeyboardEmojiAndStickerCollectionInputView isStickersCategory:](self, "isStickersCategory:", objc_msgSend(v6, "section"))&& -[UIGestureRecognizer state](v7, "state") == UIGestureRecognizerStateEnded)
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView _setRearrangeMode:](self, "_setRearrangeMode:", 0);
    }

    v4 = v7;
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  char v8;
  char v9;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();
  }
  else
  {
    v8 = 0;
  }
  v9 = isKindOfClass | v8;

  return v9 & 1;
}

- (void)_setRearrangeMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (self->_isRearranging != a3)
  {
    self->_isRearranging = a3;
    -[UIKeyboardEmojiAndStickerCollectionInputView _notifyDelegatesRearrangeModeChanged:](self, "_notifyDelegatesRearrangeModeChanged:", a3);
  }
  if (v3)
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateActiveKey");

  }
  else
  {
    -[UICollectionView endInteractiveMovement](self->_collectionView, "endInteractiveMovement");
  }
  -[UIGestureRecognizer setEnabled:](self->_tapRecognizer, "setEnabled:", v3);
  -[UIGestureRecognizer setEnabled:](self->_longPressRecognizer, "setEnabled:", v3);
}

- (void)_updateRearrangeModeForCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  LODWORD(a4) = -[UIKeyboardEmojiAndStickerCollectionInputView isStickersCategory:](self, "isStickersCategory:", objc_msgSend(a4, "section"));
  v7 = v6;
  if ((_DWORD)a4)
  {
    objc_msgSend(v7, "setDelegate:", self);
    -[UIKeyboardEmojiAndStickerCollectionInputView _addDelegate:](self, "_addDelegate:", v7);
  }
  else
  {
    objc_msgSend(v7, "setDelegate:", 0);
    -[UIKeyboardEmojiAndStickerCollectionInputView _removeDelegate:](self, "_removeDelegate:", v7);
  }
  objc_msgSend(v7, "setRearrangeMode:", self->_isRearranging);

}

- (void)configureDataSource
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  UICollectionViewDiffableDataSource *v8;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  id v10;
  id v11;
  UICollectionViewDiffableDataSource *v12;
  UICollectionViewDiffableDataSource *dataSource;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location[2];

  objc_initWeak(location, self);
  v3 = objc_opt_class();
  v4 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke;
  v31[3] = &unk_1E16DB378;
  objc_copyWeak(&v32, location);
  +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v3, v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_2;
  v29[3] = &unk_1E16DB3A0;
  objc_copyWeak(&v30, location);
  +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v6, v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [UICollectionViewDiffableDataSource alloc];
  collectionView = self->_collectionView;
  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_3;
  v26[3] = &unk_1E16DB3C8;
  v10 = v7;
  v27 = v10;
  v11 = v5;
  v28 = v11;
  v12 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:](v8, "initWithCollectionView:cellProvider:", collectionView, v26);
  dataSource = self->_dataSource;
  self->_dataSource = v12;

  +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(), CFSTR("UICollectionElementKindSectionHeader"), &__block_literal_global_430);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(), CFSTR("UICollectionElementKindStickerButton"), &__block_literal_global_105);
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_6;
  v23[3] = &unk_1E16C74E8;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v24 = v15;
  v16 = v14;
  v25 = v16;
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](self->_dataSource, "setSupplementaryViewProvider:", v23);
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_7;
  v21[3] = &unk_1E16DB430;
  objc_copyWeak(&v22, location);
  -[UICollectionViewDiffableDataSource reorderingHandlers](self->_dataSource, "reorderingHandlers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCanReorderItemHandler:", v21);

  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_108;
  v19[3] = &unk_1E16DB458;
  objc_copyWeak(&v20, location);
  -[UICollectionViewDiffableDataSource reorderingHandlers](self->_dataSource, "reorderingHandlers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDidReorderHandler:", v19);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(location);
}

void __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v10, "setImageGlyph:", v8);
    objc_msgSend(WeakRetained, "_updateRearrangeModeForCell:atIndexPath:", v10, v7);
  }

}

void __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "toString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(WeakRetained, "emojiKeyManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastUsedVariantEmojiForEmojiString:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setEmoji:", v11);
      if (v11)
      {
        objc_msgSend(WeakRetained, "emojiKeyWidthForGlyph:", v6);
        objc_msgSend(v15, "setEmojiFontSize:", (uint64_t)v12);
        objc_msgSend(v15, "setHighlightPadding:", 0.0);
        if (os_variant_has_internal_diagnostics())
        {
          v13 = (void *)objc_opt_class();
          objc_msgSend(v11, "emojiString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setUnreleasedHighlight:", objc_msgSend(v13, "shouldHighlightEmoji:", v14));

        }
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(v15, "setEmoji:", 0);
    }
    objc_msgSend(v15, "setNoResultsCell:", 1);
    v11 = 0;
LABEL_8:

  }
}

id __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD *v11;
  void *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(getSTKImageGlyphClass(), "imageGlyphForGlyphIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "type") == 3 || !objc_msgSend(v10, "type"))
    v11 = (_QWORD *)(a1 + 32);
  else
    v11 = (_QWORD *)(a1 + 40);
  objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *v11, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;

  v7 = a4;
  v8 = a2;
  v9 = objc_msgSend(a3, "isEqualToString:", CFSTR("UICollectionElementKindStickerButton"));
  v10 = 40;
  if (v9)
    v10 = 32;
  objc_msgSend(v8, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(_QWORD *)(a1 + v10), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(getSTKImageGlyphClass(), "imageGlyphForGlyphIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)WeakRetained + 103), "indexPathForItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(WeakRetained, "isStickersCategory:", objc_msgSend(v6, "section"));
  v8 = v7;
  if (*((_BYTE *)WeakRetained + 654))
    v9 = v7;
  else
    v9 = 0;
  v10 = *((_QWORD *)WeakRetained + 92);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138413058;
    v13 = v3;
    v14 = 1024;
    v15 = v8;
    v16 = 1024;
    v17 = v9;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Attempted to reorder item identifier: %@, isSticker: %{BOOL}d, canReorder: %{BOOL}d, path:%@", (uint8_t *)&v12, 0x22u);
  }

  return v9;
}

void __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_108(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "difference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (!objc_msgSend(v11, "changeType"))
          {
            v12 = objc_msgSend(v11, "associatedIndex");
            v13 = objc_msgSend(v11, "index");
            if (v12 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_16;
            v15 = v13;
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(WeakRetained[103], "moveItemFromIndex:toIndex:completionHandler:", v12, v15, &__block_literal_global_113_0);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
LABEL_16:

  }
}

- (void)updateDataSourceSnapshot
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[UIKeyboardEmojiAndStickerCollectionInputView updateDataSourceSnapshotAnimated:](self, "updateDataSourceSnapshotAnimated:", self->_hasCompletedInitialDisplay);
  v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__UIKeyboardEmojiAndStickerCollectionInputView_updateDataSourceSnapshot__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __72__UIKeyboardEmojiAndStickerCollectionInputView_updateDataSourceSnapshot__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 653) = 1;
  return result;
}

- (void)updateDataSourceSnapshotAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (!-[UIKeyboardEmojiAndStickerCollectionInputView isSearching](self, "isSearching"))
  {
    -[STKImageGlyphDataSource snapshot](self->_imageGlyphDataSource, "snapshot");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiAndStickerCollectionInputView updateDataSourceWithSnapshot:animated:](self, "updateDataSourceWithSnapshot:animated:", v5, v3);

  }
}

- (void)updateDataSourceWithSnapshot:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSIndexPath *unavailableLaunchPath;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  NSIndexPath *v12;
  NSIndexPath *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  id location;

  v4 = a4;
  v6 = a3;
  if (pthread_main_np() == 1)
  {
    unavailableLaunchPath = self->_unavailableLaunchPath;
    if (unavailableLaunchPath)
    {
      v8 = -[NSIndexPath section](unavailableLaunchPath, "section");
      if (objc_msgSend(v6, "numberOfSections") <= v8
        || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v6, "numberOfItemsInSection:", v9),
            v11 = -[NSIndexPath item](self->_unavailableLaunchPath, "item"),
            v9,
            v10 <= v11))
      {
        v12 = 0;
      }
      else
      {
        v12 = self->_unavailableLaunchPath;
        v4 = 0;
      }
      v13 = self->_unavailableLaunchPath;
      self->_unavailableLaunchPath = 0;

    }
    else
    {
      v12 = 0;
    }
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v6, v4);
    if (v12)
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView updateToIndexPath:](self, "updateToIndexPath:", v12);
      -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reloadForCategory:withSender:", -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", -[NSIndexPath section](v12, "section")), self);

    }
  }
  else
  {
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __86__UIKeyboardEmojiAndStickerCollectionInputView_updateDataSourceWithSnapshot_animated___block_invoke;
    v15[3] = &unk_1E16C2F48;
    objc_copyWeak(&v17, &location);
    v16 = v6;
    v18 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __86__UIKeyboardEmojiAndStickerCollectionInputView_updateDataSourceWithSnapshot_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "updateDataSourceWithSnapshot:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (UIKeyboardEmojiAndStickerCollectionInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  return -[UIKeyboardEmojiAndStickerCollectionInputView initWithFrame:keyplane:key:screenTraits:](self, "initWithFrame:keyplane:key:screenTraits:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[UIKeyboardMediaController sharedKeyboardMediaController](UIKeyboardMediaController, "sharedKeyboardMediaController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  self->_isDraggingInputView = 0;
  self->_showingVariants = 0;
  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearEmojiKeyboardPreferenceClient");

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiAndStickerCollectionInputView;
  -[UIKBKeyView dealloc](&v5, sel_dealloc);
}

- (void)setContentScaleFactor:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiAndStickerCollectionInputView;
  -[UIView setContentScaleFactor:](&v5, sel_setContentScaleFactor_);
  -[UIView setContentScaleFactor:](self->_collectionView, "setContentScaleFactor:", a3);
}

- (void)dimKeys:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardEmojiAndStickerCollectionInputView;
  -[UIKBKeyView dimKeys:](&v7, sel_dimKeys_, v4);
  -[UIView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__UIKeyboardEmojiAndStickerCollectionInputView_dimKeys___block_invoke;
    v6[3] = &unk_1E16BE348;
    v6[4] = self;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  }

}

void __56__UIKeyboardEmojiAndStickerCollectionInputView_dimKeys___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if ((objc_msgSend(a2, "integerValue") & 4) != 0)
  {
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:");
    *a4 = 1;
  }

}

- (void)setHitTestResponder:(id)a3
{
  UIKBEmojiHitTestResponder **p_hitTestResponder;
  id v5;

  p_hitTestResponder = &self->_hitTestResponder;
  v5 = a3;
  objc_storeWeak((id *)p_hitTestResponder, v5);
  -[UIKeyboardEmojiAndStickerCollectionView setHitTestResponder:](self->_collectionView, "setHitTestResponder:", v5);

}

- (BOOL)_userHasSelectedSkinToneEmoji
{
  void *v3;
  char v4;
  void *v5;
  BOOL isFirstPartyStickers;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiPopoverPresented");

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isFirstPartyStickers = 1;
  if ((objc_msgSend(v5, "hasDisplayedSkinToneHelp") & 1) == 0 && (v4 & 1) == 0)
  {
    emojiGraphicsTraits = self->_emojiGraphicsTraits;
    if (emojiGraphicsTraits)
      isFirstPartyStickers = emojiGraphicsTraits->_isFirstPartyStickers;
    else
      isFirstPartyStickers = 0;
  }

  return isFirstPartyStickers;
}

- (void)_setUserHasSelectedSkinToneEmoji:(BOOL)a3
{
  id v3;

  if (a3)
  {
    +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didDisplaySkinToneHelp");

  }
}

- (id)emojiBaseFirstCharacterString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", objc_msgSend(a3, "_firstLongCharacter"));
}

- (id)emojiBaseString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getEMFStringUtilitiesClass_0(), "_baseStringForEmojiString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)skinToneWasUsedForEmoji:(id)a3
{
  id v4;
  void *v5;
  int v6;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  BOOL v8;

  v4 = a3;
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasLastUsedVariantForEmojiString:", v4);

  if (v6)
  {
    emojiGraphicsTraits = self->_emojiGraphicsTraits;
    if (emojiGraphicsTraits)
      v8 = !emojiGraphicsTraits->_isFirstPartyStickers;
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)baseStringIsCoupleEmoji:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getEMFStringUtilitiesClass_0(), "_baseStringForEmojiString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(getEMFEmojiCategoryClass_2(), "_isCoupleMultiSkinToneEmoji:", v4);
  return (char)v3;
}

- (id)subTreeHitTest:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  void *v8;
  uint64_t v9;

  y = a3.y;
  x = a3.x;
  v6 = 0;
  if (-[UIView pointInside:withEvent:](self, "pointInside:withEvent:", 0))
  {
    if (self->_isRearranging)
    {
      v6 = 0;
      return v6;
    }
    collectionView = self->_collectionView;
    -[UIView convertPoint:fromView:](collectionView, "convertPoint:fromView:", self, x, y);
    -[UIKeyboardEmojiAndStickerCollectionView closestCellForPoint:](collectionView, "closestCellForPoint:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView treeForStickerCell:](self, "treeForStickerCell:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v6 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v8, "emoji");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
LABEL_12:

        return v6;
      }
      -[UIKeyboardEmojiAndStickerCollectionInputView treeForCell:](self, "treeForCell:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v9;
    goto LABEL_12;
  }
  return v6;
}

- (BOOL)isCellMostlyOffscreen:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  double v9;
  double MidY;
  double v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  -[UIView frame](self, "frame");
  if (MidX < CGRectGetMinX(v13))
    return 1;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v9 = CGRectGetMidX(v14);
  -[UIView frame](self, "frame");
  if (v9 > CGRectGetMaxX(v15))
    return 1;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MidY = CGRectGetMidY(v16);
  -[UIView frame](self, "frame");
  if (MidY < CGRectGetMinY(v17))
    return 1;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v12 = CGRectGetMidY(v18);
  -[UIView frame](self, "frame");
  return v12 > CGRectGetMaxY(v19);
}

- (CGRect)cellRectToRevealFullCell:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  _BOOL4 v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double MaxY;
  void *v24;
  double v25;
  UIKeyboardEmojiAndStickerCollectionView *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double MaxX;
  void *v51;
  double v52;
  UIKeyboardEmojiAndStickerCollectionView *v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double MinY;
  void *v73;
  double v74;
  UIKeyboardEmojiAndStickerCollectionView *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double MinX;
  void *v97;
  double v98;
  UIKeyboardEmojiAndStickerCollectionView *v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  collectionView = self->_collectionView;
  -[UIView superview](self, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = x;
  v126 = y;
  -[UIView convertRect:toView:](collectionView, "convertRect:toView:", v9, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit");
  v19 = v11;
  v20 = v13;
  v21 = v15;
  v22 = v17;
  if (!v18)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v19);
    -[UIView superview](self, "superview");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "frame");
    v52 = CGRectGetMaxX(v134);

    if (MaxX <= v52)
    {
      v149.origin.x = v11;
      v149.origin.y = v13;
      v149.size.width = v15;
      v149.size.height = v17;
      MinX = CGRectGetMinX(v149);
      -[UIView superview](self, "superview");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "frame");
      v98 = CGRectGetMinX(v150);

      if (MinX >= v98)
        goto LABEL_38;
      v99 = self->_collectionView;
      -[UIScrollView contentOffset](v99, "contentOffset");
      v101 = v100;
      v151.origin.x = v11;
      v151.origin.y = v13;
      v151.size.width = v15;
      v151.size.height = v17;
      v102 = CGRectGetMinX(v151);
      -[UIView superview](self, "superview");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "frame");
      v104 = v102 - CGRectGetMinX(v152);

      v105 = -v104;
      if (v104 >= 0.0)
        v105 = v104;
      v106 = v101 - v105;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
      v108 = v106 - v107;
      -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
      -[UICollectionView setContentOffset:animated:](v99, "setContentOffset:animated:", 1, v108);
      v153.origin.x = v11;
      v153.origin.y = v13;
      v153.size.width = v15;
      v153.size.height = v17;
      v109 = CGRectGetMinX(v153);
      -[UIView superview](self, "superview");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "frame");
      v111 = v109 - CGRectGetMinX(v154);

      if (v111 >= 0.0)
        v111 = -v111;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
      v113 = v111 - v112;
      v155.origin.x = v11;
      v155.origin.y = v13;
      v155.size.width = v15;
      v155.size.height = v17;
      v114 = CGRectGetMinX(v155);
      -[UIView superview](self, "superview");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "frame");
      v116 = v114 + CGRectGetMinX(v156);

      if (v116 < 0.0)
        v116 = -v116;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
      v118 = v116 + v117;
      v47 = v125 + v118;
      v71 = v113 + v118;
    }
    else
    {
      v53 = self->_collectionView;
      -[UIScrollView contentOffset](v53, "contentOffset");
      v55 = v54;
      v135.origin.x = v11;
      v135.origin.y = v13;
      v135.size.width = v15;
      v135.size.height = v17;
      v56 = CGRectGetMaxX(v135);
      -[UIView superview](self, "superview");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "frame");
      v58 = v56 - CGRectGetMaxX(v136);

      if (v58 < 0.0)
        v58 = -v58;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
      v60 = v55 + v58 + v59;
      -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
      -[UICollectionView setContentOffset:animated:](v53, "setContentOffset:animated:", 1, v60);
      v137.origin.x = v11;
      v137.origin.y = v13;
      v137.size.width = v15;
      v137.size.height = v17;
      v61 = CGRectGetMaxX(v137);
      -[UIView superview](self, "superview");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "frame");
      v63 = v61 - CGRectGetMaxX(v138);

      if (v63 < 0.0)
        v63 = -v63;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
      v65 = v63 + v64;
      v139.origin.x = v11;
      v139.origin.y = v13;
      v139.size.width = v15;
      v139.size.height = v17;
      v66 = CGRectGetMaxX(v139);
      -[UIView superview](self, "superview");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "frame");
      v68 = v66 - CGRectGetMaxX(v140);

      if (v68 < 0.0)
        v68 = -v68;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
      v70 = v68 + v69;
      v47 = v125 - v70;
      v71 = v65 - v70;
    }
    width = width - v71;
    v48 = v126 + 0.0;
    goto LABEL_39;
  }
  MaxY = CGRectGetMaxY(*(CGRect *)&v19);
  -[UIView superview](self, "superview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v25 = CGRectGetMaxY(v127);

  if (MaxY <= v25)
  {
    v141.origin.x = v11;
    v141.origin.y = v13;
    v141.size.width = v15;
    v141.size.height = v17;
    MinY = CGRectGetMinY(v141);
    -[UIView superview](self, "superview");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "frame");
    v74 = CGRectGetMinY(v142);

    if (MinY < v74)
    {
      v75 = self->_collectionView;
      -[UIScrollView contentOffset](v75, "contentOffset");
      v122 = v76;
      -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
      v78 = v77;
      v143.origin.x = v11;
      v143.origin.y = v13;
      v143.size.width = v15;
      v143.size.height = v17;
      v124 = height;
      v79 = CGRectGetMinY(v143);
      -[UIView superview](self, "superview");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "frame");
      v81 = CGRectGetMinY(v144);

      v82 = 0.0;
      if (v79 < v81)
        v82 = 1.0;
      v83 = v78 - v82;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
      -[UICollectionView setContentOffset:animated:](v75, "setContentOffset:animated:", 1, v122, v83 - v84);
      v145.origin.x = v11;
      v145.origin.y = v13;
      v145.size.width = v15;
      v145.size.height = v17;
      v85 = CGRectGetMinY(v145);
      -[UIView superview](self, "superview");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "frame");
      v87 = CGRectGetMinY(v146);

      if (v85 >= v87)
        v88 = 0.0;
      else
        v88 = 1.0;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
      v90 = v89 + v88;
      v147.origin.x = v11;
      v147.origin.y = v13;
      v147.size.width = v15;
      v147.size.height = v17;
      v91 = CGRectGetMinY(v147);
      -[UIView superview](self, "superview");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "frame");
      v93 = CGRectGetMinY(v148);

      if (v91 >= v93)
        v94 = 0.0;
      else
        v94 = -1.0;
      -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
      v47 = v125 + 0.0;
      v48 = v126 + v90;
      v49 = v90 + v94 - v95;
      v37 = v124;
      goto LABEL_28;
    }
LABEL_38:
    v47 = v125;
    v48 = v126;
    goto LABEL_39;
  }
  v26 = self->_collectionView;
  -[UIScrollView contentOffset](v26, "contentOffset");
  v123 = v27;
  -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
  v29 = v28;
  v128.origin.x = v11;
  v128.origin.y = v13;
  v128.size.width = v15;
  v128.size.height = v17;
  v30 = width;
  v31 = height;
  v32 = CGRectGetMaxY(v128);
  -[UIView superview](self, "superview");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  v34 = v32 - CGRectGetMaxY(v129);

  if (v34 < 0.0)
    v34 = -v34;
  -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
  v36 = v34 + v35;
  v37 = v31;
  width = v30;
  -[UICollectionView setContentOffset:animated:](v26, "setContentOffset:animated:", 1, v123, v29 + v36);
  v130.origin.x = v11;
  v130.origin.y = v13;
  v130.size.width = v15;
  v130.size.height = v17;
  v38 = CGRectGetMaxY(v130);
  -[UIView superview](self, "superview");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "frame");
  v40 = v38 - CGRectGetMaxY(v131);

  if (v40 < 0.0)
    v40 = -v40;
  -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
  v42 = v40 + v41;
  v132.origin.x = v11;
  v132.origin.y = v13;
  v132.size.width = v15;
  v132.size.height = v17;
  v43 = CGRectGetMaxY(v132);
  -[UIView superview](self, "superview");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "frame");
  v45 = v43 - CGRectGetMaxY(v133);

  if (v45 < 0.0)
    v45 = -v45;
  -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
  v47 = v125 + 0.0;
  v48 = v126 - v42;
  v49 = v45 + v46 - v42;
LABEL_28:
  height = v37 - v49;
LABEL_39:
  v119 = v47;
  v120 = width;
  v121 = height;
  result.size.height = v121;
  result.size.width = v120;
  result.origin.y = v48;
  result.origin.x = v119;
  return result;
}

- (id)treeForStickerCell:(id)a3
{
  id v4;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
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
  void *v31;
  UIGraphicsImageRenderer *v32;
  double v33;
  double v34;
  UIGraphicsImageRenderer *v35;
  id v36;
  void *v37;
  void *v38;
  UIKeyboardEmojiAndStickerCollectionView *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double x;
  double y;
  double width;
  double height;
  UIKBShape *v53;
  void *v54;
  void *v55;
  _QWORD v57[4];
  id v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v4 = a3;
  collectionView = self->_collectionView;
  objc_msgSend(v4, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIView superview](self, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](collectionView, "convertRect:toView:", v14, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  if (-[UIKeyboardEmojiAndStickerCollectionInputView isCellMostlyOffscreen:](self, "isCellMostlyOffscreen:", v16, v18, v20, v22)|| (objc_msgSend(v4, "frame"), -[UIKeyboardEmojiAndStickerCollectionInputView cellRectToRevealFullCell:](self, "cellRectToRevealFullCell:"), !v4))
  {
    v38 = 0;
  }
  else
  {
    v27 = v23;
    v28 = v24;
    v29 = v25;
    v30 = v26;
    objc_msgSend(v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = [UIGraphicsImageRenderer alloc];
    objc_msgSend(v31, "bounds");
    v35 = -[UIGraphicsImageRenderer initWithSize:](v32, "initWithSize:", v33, v34);
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_treeForStickerCell___block_invoke;
    v57[3] = &unk_1E16B5018;
    v36 = v31;
    v58 = v36;
    -[UIGraphicsImageRenderer imageWithActions:](v35, "imageWithActions:", v57);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setState:", 2);
    objc_msgSend(v38, "setDisplayImage:", v37);
    objc_msgSend(v38, "setName:", CFSTR("EmojiPopupKey"));
    objc_msgSend(v38, "setDisplayType:", 57);
    objc_msgSend(v38, "setInteractionType:", 2);
    if (self->_selectedPopupKey)
      -[UIKeyboardEmojiAndStickerCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
    v39 = self->_collectionView;
    -[UIView superview](self, "superview");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:toView:](v39, "convertRect:toView:", v40, v27, v28, v29, v30);
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;

    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
    v59.origin.y = v44 - (v48 - v48) * 0.5;
    v59.origin.x = v42 - (v46 - v46) * 0.5;
    v59.size.width = v46;
    v59.size.height = v48;
    v60 = CGRectInset(v59, -2.0, -2.0);
    x = v60.origin.x;
    y = v60.origin.y;
    width = v60.size.width;
    height = v60.size.height;
    v61 = CGRectInset(v60, -1.0, -1.0);
    v53 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, x, y, width, height, v61.origin.x, v61.origin.y, v61.size.width, v61.size.height);
    objc_msgSend(v38, "setShape:", v53);

    -[UIKBKeyView key](self, "key");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setParentKey:", v54);

    objc_msgSend(v4, "imageGlyph");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forProperty:", v55, CFSTR("UIKBAssociatedImageGlyph"));

  }
  return v38;
}

uint64_t __67__UIKeyboardEmojiAndStickerCollectionInputView_treeForStickerCell___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "bounds");
  return objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
}

- (id)treeForCell:(id)a3
{
  id v4;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  void *v58;
  id EMFStringUtilitiesClass_0;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _BOOL4 v68;
  uint64_t v69;
  __CFString **v70;
  void *v71;
  _BOOL4 v72;
  void *v73;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  BOOL v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  UIKeyboardEmojiGraphicsTraits *v79;
  BOOL v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  UIKeyboardEmojiAndStickerCollectionView *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double MaxX;
  double v106;
  UIKeyboardEmojiGraphicsTraits *v107;
  id *p_collectionView;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  id v114;
  double v115;
  double v116;
  UIKBShape *v117;
  void *v118;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  UIKeyboardEmojiAndStickerCollectionInputView *v124;
  void *v125;
  id obj;
  _QWORD v127[4];
  id v128;
  uint64_t *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t v142;
  _BYTE v143[128];
  uint64_t v144;
  CGRect v145;
  CGRect v146;

  v144 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  collectionView = self->_collectionView;
  v123 = v4;
  objc_msgSend(v4, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v124 = self;
  -[UIView superview](self, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:toView:](collectionView, "convertRect:toView:", v14, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  if (-[UIKeyboardEmojiAndStickerCollectionInputView isCellMostlyOffscreen:](v124, "isCellMostlyOffscreen:", v16, v18, v20, v22))
  {
    v23 = 0;
LABEL_59:
    v33 = v123;
    goto LABEL_60;
  }
  objc_msgSend(v123, "frame");
  -[UIKeyboardEmojiAndStickerCollectionInputView cellRectToRevealFullCell:](v124, "cellRectToRevealFullCell:");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[UICollectionView indexPathForCell:](v124->_collectionView, "indexPathForCell:", v123);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiAndStickerCollectionInputView setTappedSkinToneEmoji:](v124, "setTappedSkinToneEmoji:", v32);

  v33 = v123;
  if (v123)
  {
    objc_msgSend(v123, "emoji");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setState:", 2);
    objc_msgSend(v23, "setName:", CFSTR("EmojiPopupKey"));
    objc_msgSend(v122, "emojiString");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDisplayString:", v120);
    objc_msgSend(v23, "setRepresentedString:", v120);
    objc_msgSend(v23, "setDisplayType:", 0);
    objc_msgSend(v23, "setInteractionType:", 2);
    if (v124->_selectedPopupKey)
      -[UIKeyboardEmojiAndStickerCollectionInputView resetSelectionIfNeeded](v124, "resetSelectionIfNeeded");
    if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "dictationTipController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "emojiString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "signalDictationInsertionTip:", v36);

    }
    v139 = 0;
    v140 = &v139;
    v141 = 0x2050000000;
    v37 = (void *)getEMFEmojiTokenClass_softClass_2;
    v142 = getEMFEmojiTokenClass_softClass_2;
    if (!getEMFEmojiTokenClass_softClass_2)
    {
      v134 = MEMORY[0x1E0C809B0];
      v135 = 3221225472;
      v136 = (uint64_t)__getEMFEmojiTokenClass_block_invoke_4;
      v137 = (uint64_t)&unk_1E16B14C0;
      v138 = &v139;
      __getEMFEmojiTokenClass_block_invoke_4((uint64_t)&v134);
      v37 = (void *)v140[3];
    }
    v38 = objc_retainAutorelease(v37);
    _Block_object_dispose(&v139, 8);
    objc_msgSend(v122, "emojiString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "emojiTokenWithString:localeData:", v39, 0);
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v121, "supportsSkinToneVariants"))
      goto LABEL_47;
    objc_msgSend(v121, "_skinToneVariantStrings");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v40, "count") + 1);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    obj = v40;
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v143, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v131;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v131 != v42)
            objc_enumerationMutation(obj);
          v44 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * i);
          v45 = (void *)objc_msgSend(v23, "copy");
          objc_msgSend(v45, "setRepresentedString:", v44);
          objc_msgSend(v45, "representedString");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setDisplayString:", v46);

          objc_msgSend(v45, "setDisplayType:", 0);
          v47 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v23, "name");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "representedString");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "stringWithFormat:", CFSTR("%@/%@"), v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setName:", v50);

          objc_msgSend(v45, "setOverrideDisplayString:", 0);
          objc_msgSend(v125, "addObject:", v45);
          objc_msgSend(obj, "firstObject");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v49) = objc_msgSend(v51, "isEqualToString:", v44);

          if ((_DWORD)v49)
          {
            +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 8);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setDisplayType:", 50);
            objc_msgSend(v52, "setInteractionType:", 0);
            v53 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v23, "name");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "stringWithFormat:", CFSTR("%@/Divider"), v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setName:", v55);

            objc_msgSend(v52, "setState:", 1);
            objc_msgSend(v125, "addObject:", v52);

          }
        }
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v143, 16);
      }
      while (v41);
    }

    objc_msgSend(v122, "emojiString");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[UIKeyboardEmojiAndStickerCollectionInputView baseStringIsCoupleEmoji:](v124, "baseStringIsCoupleEmoji:", v56);

    if (v57)
    {
      v58 = (void *)objc_msgSend(v23, "copy");
      EMFStringUtilitiesClass_0 = getEMFStringUtilitiesClass_0();
      objc_msgSend(v122, "emojiString");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(EMFStringUtilitiesClass_0, "_baseStringForEmojiString:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setRepresentedString:", v61);

      objc_msgSend(v58, "representedString");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setDisplayString:", v62);

      objc_msgSend(v58, "setDisplayType:", 0);
      v63 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v23, "name");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "representedString");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringWithFormat:", CFSTR("%@/%@"), v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setName:", v66);

      objc_msgSend(v58, "setOverrideDisplayString:", 0);
      objc_msgSend(v125, "insertObject:atIndex:", v58, 0);

    }
    objc_msgSend(v122, "emojiString");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = -[UIKeyboardEmojiAndStickerCollectionInputView skinToneWasUsedForEmoji:](v124, "skinToneWasUsedForEmoji:", v67);

    if (v68)
    {
      v134 = 0;
      v135 = (uint64_t)&v134;
      v136 = 0x2020000000;
      v137 = 0x7FFFFFFFFFFFFFFFLL;
      v127[0] = MEMORY[0x1E0C809B0];
      v127[1] = 3221225472;
      v127[2] = __60__UIKeyboardEmojiAndStickerCollectionInputView_treeForCell___block_invoke;
      v127[3] = &unk_1E16CEFB0;
      v128 = v122;
      v129 = &v134;
      objc_msgSend(v125, "enumerateObjectsUsingBlock:", v127);
      objc_msgSend(v23, "setSelectedVariantIndex:", *(_QWORD *)(v135 + 24));

      _Block_object_dispose(&v134, 8);
    }
    v69 = -[UIView effectiveUserInterfaceLayoutDirection](v124, "effectiveUserInterfaceLayoutDirection");
    v70 = UIKBAttributeValueFixedLeftStr;
    if (v69 != 1)
      v70 = UIKBAttributeValueFixedRightStr;
    objc_msgSend(v23, "setVariantPopupBias:", *v70);
    objc_msgSend(v23, "setSubtrees:", v125);
    objc_msgSend(v122, "emojiString");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = -[UIKeyboardEmojiAndStickerCollectionInputView baseStringIsCoupleEmoji:](v124, "baseStringIsCoupleEmoji:", v71);

    objc_msgSend(v122, "emojiString");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIKeyboardEmojiAndStickerCollectionInputView skinToneWasUsedForEmoji:](v124, "skinToneWasUsedForEmoji:", v73))
    {
      emojiGraphicsTraits = v124->_emojiGraphicsTraits;
      if (emojiGraphicsTraits)
      {
        v75 = !emojiGraphicsTraits->_isFirstPartyStickers;

        if (v75)
        {
LABEL_29:
          if (v72)
            v76 = 13;
          else
            v76 = 11;
          v77 = 4;
LABEL_44:
          objc_msgSend(v23, "setVariantType:", v76);
          objc_msgSend(v23, "setState:", v77);
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend(v81, "isEmojiPopoverPresented");

          if (v82)
          {
            objc_storeStrong((id *)&v124->_selectedPopupKey, v23);
            v124->_showingVariants = 1;
            v124->_currentVariantRow = 0;
            -[UIKeyboardEmojiAndStickerCollectionInputView tappedSkinToneEmoji](v124, "tappedSkinToneEmoji");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = (void *)objc_msgSend(v83, "copy");
            -[UIKeyboardEmojiAndStickerCollectionInputView setSelectedIndexPath:](v124, "setSelectedIndexPath:", v84);

          }
LABEL_47:
          v85 = v124->_collectionView;
          -[UIView superview](v124, "superview");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView convertRect:toView:](v85, "convertRect:toView:", v86, v25 + 0.0, v27 + 1.0, v29, v31);
          v88 = v87;
          v90 = v89;
          v92 = v91;
          v94 = v93;

          if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
            || +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
          {
            -[UIKeyboardEmojiGraphicsTraits fakeEmojiKeySize](v124->_emojiGraphicsTraits, "fakeEmojiKeySize");
            v104 = v90 - (v103 - v94) * 0.5;
            v100 = v88 - (v102 - v92) * 0.5 + 0.0;
            v96 = v102 + 1.0;
            v101 = v104 + -2.0;
            v98 = v103 + 3.0;
            v145.origin.x = v100;
            v145.origin.y = v104 + -2.0;
            v145.size.width = v96;
            v145.size.height = v98;
            MaxX = CGRectGetMaxX(v145);
            -[UIView bounds](v124->_collectionView, "bounds");
            if (MaxX > v106)
            {
              if (objc_msgSend(v122, "supportsSkinToneVariants"))
              {
                v107 = v124->_emojiGraphicsTraits;
                if (!v107 || !v107->_isFirstPartyStickers)
                {
                  p_collectionView = (id *)&v124->_collectionView;
                  -[UIView bounds](v124->_collectionView, "bounds");
                  v110 = v109;
                  v146.origin.x = v100;
                  v146.origin.y = v101;
                  v146.size.width = v96;
                  v146.size.height = v98;
                  v111 = CGRectGetMaxX(v146);
                  -[UIView bounds](v124->_collectionView, "bounds");
                  if (v111 - v112 >= 0.0)
                    v113 = v111 - v112;
                  else
                    v113 = -(v111 - v112);
                  v114 = *p_collectionView;
                  objc_msgSend(*p_collectionView, "contentOffset");
                  v116 = v115;
                  objc_msgSend(*p_collectionView, "contentOffset");
                  objc_msgSend(v114, "setContentOffset:animated:", 1, v116 + v113);
                  v100 = v110 - v96;
                }
              }
            }
          }
          else
          {
            -[UIKeyboardEmojiGraphicsTraits fakeEmojiKeySize](v124->_emojiGraphicsTraits, "fakeEmojiKeySize");
            v96 = v95;
            v98 = v97;
            v99 = (v97 - v94) * 0.5;
            v100 = v88 - (v95 - v92) * 0.5;
            v101 = v90 - v99;
          }
          v117 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, v100, v101, v96, v98, v100, v101, v96, v98);
          objc_msgSend(v23, "setShape:", v117);

          -[UIKBKeyView key](v124, "key");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setParentKey:", v118);

          objc_msgSend(v23, "setObject:forProperty:", v122, CFSTR("UIKBAssociatedEmoji"));
          goto LABEL_59;
        }
LABEL_40:
        if (v72)
          v76 = 12;
        else
          v76 = 10;
        v77 = 16;
        goto LABEL_44;
      }
    }
    else
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView tappedSkinToneEmoji](v124, "tappedSkinToneEmoji");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v78, "section")
        || !-[UIKeyboardEmojiAndStickerCollectionInputView _userHasSelectedSkinToneEmoji](v124, "_userHasSelectedSkinToneEmoji"))
      {

        goto LABEL_40;
      }
      v79 = v124->_emojiGraphicsTraits;
      if (v79)
      {
        v80 = !v79->_isFirstPartyStickers;

        if (v80)
          goto LABEL_29;
        goto LABEL_40;
      }

    }
    goto LABEL_29;
  }
  v23 = 0;
LABEL_60:

  return v23;
}

void __60__UIKeyboardEmojiAndStickerCollectionInputView_treeForCell___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "representedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "emojiString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (BOOL)genderEmojiBaseStringNeedVariantSelector:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("⛹")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("🏋")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("🕵"));
  }

  return v4;
}

- (id)selectedChildSkinToneEmoji:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "selectedVariantIndex") == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  objc_msgSend(v3, "subtrees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v3, "selectedVariantIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_4:
    objc_msgSend(v3, "objectForProperty:", CFSTR("UIKBAssociatedEmoji"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForProperty:", CFSTR("UIKBAssociatedEmoji"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v6, objc_msgSend(v7, "variantMask"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (int64_t)didInputSubTree:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __CFString **v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  int64_t v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)UIKeyboardEmojiAndStickerCollectionInputView;
  v5 = -[UIKBKeyView didInputSubTree:](&v45, sel_didInputSubTree_, v4);
  objc_msgSend(v4, "objectForProperty:", CFSTR("UIKBAssociatedEmoji"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForProperty:", CFSTR("UIKBAssociatedImageGlyph"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (objc_msgSend(v6, "supportsSkinToneVariants"))
    {
      if (objc_msgSend(v4, "state") == 16)
      {
        v9 = objc_msgSend(v4, "selectedVariantIndex");
        objc_msgSend(v4, "subtrees");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v9 < objc_msgSend(v10, "count");

      }
      else
      {
        v11 = 0;
      }
      if (!-[UIKeyboardEmojiAndStickerCollectionInputView _userHasSelectedSkinToneEmoji](self, "_userHasSelectedSkinToneEmoji", v8))v5 = 1;
      v44 = v5;
      -[UIKeyboardEmojiAndStickerCollectionInputView selectedChildSkinToneEmoji:](self, "selectedChildSkinToneEmoji:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v4, "subtrees");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "representedString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "emojiString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateSkinToneBaseKey:variantUsed:", v15, v17);

      }
      collectionView = self->_collectionView;
      -[UIKeyboardEmojiAndStickerCollectionInputView tappedSkinToneEmoji](self, "tappedSkinToneEmoji");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "emoji");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "emojiString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiAndStickerCollectionInputView emojiBaseString:](self, "emojiBaseString:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "emojiString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiAndStickerCollectionInputView emojiBaseString:](self, "emojiBaseString:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v23, "isEqualToString:", v25);

      if (v26)
      {
        objc_msgSend(v20, "setEmoji:", v12);
        if (os_variant_has_internal_diagnostics())
        {
          v41 = (void *)objc_opt_class();
          objc_msgSend(v12, "emojiString");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setUnreleasedHighlight:", objc_msgSend(v41, "shouldHighlightEmoji:", v42));

        }
      }

      v8 = v43;
      v5 = v44;
    }
    else
    {
      v12 = v6;
    }
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastUsedInputModeForCurrentContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "primaryLanguage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v30 = objc_claimAutoreleasedReturnValue();

    if (v30)
      v31 = (__CFString *)v30;
    else
      v31 = CFSTR("en_US");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isEmojiPopoverVisibleOrDismissing");

    if (!v33)
      goto LABEL_27;
    -[UIKeyboardEmojiAndStickerCollectionInputView emojiSearchField](self, "emojiSearchField");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "text");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "length"))
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView tappedSkinToneEmoji](self, "tappedSkinToneEmoji");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "section");

      if (!v37)
      {
        v38 = UIKBAnalyticsEmojiInputTypePopoverSearch;
LABEL_26:
        +[UIKBAnalyticsDispatcher emojiInsertedByMethod:inputType:](UIKBAnalyticsDispatcher, "emojiInsertedByMethod:inputType:", CFSTR("Touch"), *v38);
LABEL_27:
        -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "emojiUsed:language:", v12, v31);

        goto LABEL_28;
      }
    }
    else
    {

    }
    v38 = UIKBAnalyticsEmojiInputTypePopover;
    goto LABEL_26;
  }
  if (v7)
    -[UIKeyboardEmojiAndStickerCollectionInputView insertImageGlyph:dismiss:](self, "insertImageGlyph:dismiss:", v7, 0);
LABEL_28:
  objc_msgSend(v4, "setObject:forProperty:", 0, CFSTR("UIKBAssociatedImageGlyph"));
  objc_msgSend(v4, "setObject:forProperty:", 0, CFSTR("UIKBAssociatedEmoji"));

  return v5;
}

- (void)insertImageGlyph:(id)a3 dismiss:(BOOL)a4
{
  id v6;
  _QWORD v7[4];
  BOOL v8;
  _QWORD v9[5];
  BOOL v10;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__UIKeyboardEmojiAndStickerCollectionInputView_insertImageGlyph_dismiss___block_invoke;
    v9[3] = &unk_1E16DB480;
    v9[4] = self;
    v10 = a4;
    objc_msgSend(v6, "createUIStickerWithLoadAllRepresentations:completionHandler:", 1, v9);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__UIKeyboardEmojiAndStickerCollectionInputView_insertImageGlyph_dismiss___block_invoke_2;
    v7[3] = &__block_descriptor_33_e20_v16__0___UISticker_8l;
    v8 = a4;
    objc_msgSend(v6, "createUIStickerWithCompletionHandler:", v7);
  }

}

void __73__UIKeyboardEmojiAndStickerCollectionInputView_insertImageGlyph_dismiss___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0CB37D0];
    v4 = a2;
    objc_msgSend(v3, "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = CFSTR("UIEmojiAndStickerShouldInsertNotificationUserInfoSceneKey");
    objc_msgSend(*(id *)(a1 + 32), "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = CFSTR("UIEmojiAndStickerShouldInsertNotificationUserInfoShouldDismissKey");
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("UIEmojiAndStickerShouldInsertNotification"), v4, v9);

  }
}

void __73__UIKeyboardEmojiAndStickerCollectionInputView_insertImageGlyph_dismiss___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0CB37D0];
    v4 = a2;
    objc_msgSend(v3, "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("UIEmojiAndStickerShouldInsertNotificationUserInfoShouldDismissKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("UIEmojiAndStickerShouldInsertNotification"), v4, v7);

  }
}

- (void)shouldDismissModalDisplayView:(id)a3
{
  void (**v4)(void);
  void (**v5)(void);

  -[UIKeyboardEmojiAndStickerCollectionInputView _setUserHasSelectedSkinToneEmoji:](self, "_setUserHasSelectedSkinToneEmoji:", 1);
  -[UIKeyboardEmojiAndStickerCollectionInputView completionBlock](self, "completionBlock");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v4[2]();
    -[UIKeyboardEmojiAndStickerCollectionInputView setCompletionBlock:](self, "setCompletionBlock:", 0);
    v4 = v5;
  }

}

- (void)willDisplayModalActionView:(id)a3 withSubTreeKeyView:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UILabel *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  UIView *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  UIKBEmojiAndStickerSnapshotSizingView *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  UILayoutGuide *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  UIView *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  UIKeyboardEmojiAndStickerCollectionInputView *v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  int v75;
  void *v76;
  id v77;
  void *v78;
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[4];

  v82[2] = *MEMORY[0x1E0C80C00];
  v77 = a4;
  v8 = a3;
  -[UIKeyboardEmojiAndStickerCollectionInputView setCompletionBlock:](self, "setCompletionBlock:", a5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView renderConfig](self, "renderConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "whiteText");

  if (v11)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (uint64_t)v12;
  }
  else
  {
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBEmojiLightControlSymbolColor")));
    v13 = objc_claimAutoreleasedReturnValue();
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v78 = v12;
  v14 = +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit");
  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    v75 = 0;
  }
  else
  {
    -[UIKBKeyView renderConfig](self, "renderConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v15, "isFloating") ^ 1;

  }
  v74 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v71 = self;
  v16 = -[UIView _keyboardOrientation](self, "_keyboardOrientation") - 3;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferencesActions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rivenSizeFactor:", 1.0);
  v20 = v19;

  v21 = 1.67;
  if (v16 < 2)
    v21 = 1.75;
  if (v14)
    v22 = 0.423;
  else
    v22 = 0.366;
  if (v14)
    v23 = 50.0;
  else
    v23 = 0.0;
  if (!v14)
    v21 = 1.0;
  v24 = 0.96;
  if (v20 <= 1.0)
    v24 = 1.0;
  v25 = v21 * v24;
  v26 = objc_alloc_init(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "addSubview:", v26);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 3, 0, v8, 3, 1.0, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v27);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 1, 0, v8, 1, 1.0, 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v28);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 2, 0, v8, 2, 1.0, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v29);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 8, 0, v8, 8, v22, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v30);

  v31 = objc_alloc_init(UILabel);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setUserInteractionEnabled:](v31, "setUserInteractionEnabled:", 0);
  v76 = (void *)v13;
  v32 = *(_QWORD *)off_1E1678D90;
  v81[0] = *(_QWORD *)off_1E1678D98;
  v69 = v81[0];
  v81[1] = v32;
  v82[0] = v13;
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 13.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(getEMFEmojiCategoryClass_2(), "localizedSkinToneEmojiDescription");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v34, "initWithString:attributes:", v35, v73);

  -[UILabel setNumberOfLines:](v31, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](v31, "setTextAlignment:", 1);
  -[UILabel setAttributedText:](v31, "setAttributedText:", v72);
  -[UIView addSubview:](v26, "addSubview:", v31);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 9, 0, v26, 9, v25, 0.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v36);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 3, 0, v26, 3, 1.0, 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v37);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 4, 0, v26, 4, 1.0, 0.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v38);

  v39 = (void *)MEMORY[0x1E0D156E0];
  -[UIKeyboardEmojiGraphicsTraits alertTextWidth](v71->_emojiGraphicsTraits, "alertTextWidth");
  objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 7, 0, 0, 0, 0.0, v40 - v23);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v41);

  v42 = objc_alloc_init(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "addSubview:", v42);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, 4, 0, v8, 4, 1.0, 0.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v43);

  v67 = v42;
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, 8, 0, v8, 8, 0.086, 0.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v44);

  +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v79[1] = v32;
  v80[0] = v78;
  v79[0] = v69;
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v46;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = objc_alloc(MEMORY[0x1E0CB3498]);
  _UILocalizedStringInSystemLanguage(CFSTR("OK"), CFSTR("OK"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v47, "initWithString:attributes:", v48, v70);

  objc_msgSend(v45, "setAttributedTitle:forState:", v68, 0);
  objc_msgSend(v45, "addTarget:action:forControlEvents:", v71, sel_shouldDismissModalDisplayView_, 64);
  objc_msgSend(v8, "addSubview:", v45);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 9, 0, v8, 9, v25, 0.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v49);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 4, 0, v42, 3, 1.0, 6.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v50);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 7, 0, v31, 7, 1.0, 0.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v51);

  objc_msgSend(v77, "snapshotViewAfterScreenUpdates:", 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v52, "setUserInteractionEnabled:", 0);
  v53 = -[UIKBEmojiAndStickerSnapshotSizingView initWithSnapshotView:]([UIKBEmojiAndStickerSnapshotSizingView alloc], "initWithSnapshotView:", v52);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if ((v74 & v75) != 0)
    v54 = -25.0;
  else
    v54 = 0.0;
  objc_msgSend(v8, "addSubview:", v53);
  LODWORD(v55) = 1148829696;
  -[UIView setContentHuggingPriority:forAxis:](v53, "setContentHuggingPriority:forAxis:", 1, v55);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v53, 9, 0, v8, 9, v25, 0.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v56);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v53, 3, 0, v31, 4, 1.0, v54);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v57);

  v58 = objc_alloc_init(UILayoutGuide);
  objc_msgSend(v8, "addLayoutGuide:", v58);

  -[UILayoutGuide topAnchor](v58, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](v53, "bottomAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v61);

  -[UILayoutGuide bottomAnchor](v58, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v64);

  -[UILayoutGuide heightAnchor](v58, "heightAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintGreaterThanOrEqualToConstant:", 6.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v66);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v9);
}

- (BOOL)_shouldShowRecentlyUsedMedia
{
  return 0;
}

- (void)didTearDownRecentsViewForKeyboardMediaController:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__UIKeyboardEmojiAndStickerCollectionInputView_didTearDownRecentsViewForKeyboardMediaController___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __97__UIKeyboardEmojiAndStickerCollectionInputView_didTearDownRecentsViewForKeyboardMediaController___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 650) = 0;
  return result;
}

- (void)didInsertMediaForKeyboardMediaController:(id)a3
{
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissEmojiPopoverIfNecessaryWithCompletion:", 0);

}

- (void)didPresentCardForKeyboardMediaController:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[UIKeyboardEmojiAndStickerCollectionInputView emojiSearchField](self, "emojiSearchField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView emojiSearchField](self, "emojiSearchField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didPresentMemojiCard");

}

- (void)didDismissCardForKeyboardMediaController:(id)a3
{
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didDismissMemojiCard");

}

- (BOOL)doesSupportImageGlyph
{
  return self->_imageGlyphDataSource != 0;
}

- (int64_t)numberOfPrefixCategories
{
  if (-[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph"))
    return -[STKImageGlyphDataSource emojiCategoryIndex](self->_imageGlyphDataSource, "emojiCategoryIndex");
  else
    return 0;
}

- (int64_t)numberOfPrefixSections
{
  if (-[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph"))
    return -[STKImageGlyphDataSource emojiPrefixSectionCount](self->_imageGlyphDataSource, "emojiPrefixSectionCount");
  else
    return 0;
}

- (BOOL)doesShowMemoji
{
  int v3;

  v3 = -[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph");
  if (v3)
    LOBYTE(v3) = -[STKImageGlyphDataSource canShowMemoji](self->_imageGlyphDataSource, "canShowMemoji");
  return v3;
}

- (BOOL)doesShowStickers
{
  int v3;

  v3 = -[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph");
  if (v3)
    LOBYTE(v3) = -[STKImageGlyphDataSource canShowStickers](self->_imageGlyphDataSource, "canShowStickers");
  return v3;
}

- (BOOL)isMemojiCategory:(int64_t)a3
{
  if (-[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph")
    && !-[UIKeyboardEmojiAndStickerCollectionInputView isSearching](self, "isSearching"))
  {
    return -[STKImageGlyphDataSource isMemojiSection:](self->_imageGlyphDataSource, "isMemojiSection:", a3);
  }
  else
  {
    return 0;
  }
}

- (BOOL)isStickersCategory:(int64_t)a3
{
  int v5;

  v5 = -[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph");
  if (v5)
    LOBYTE(v5) = -[STKImageGlyphDataSource isStickerSection:](self->_imageGlyphDataSource, "isStickerSection:", a3);
  return v5;
}

- (BOOL)isSearchCategory:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[UIKeyboardEmojiAndStickerCollectionInputView isSearching](self, "isSearching");
  if (v5)
    LOBYTE(v5) = -[UIKeyboardEmojiAndStickerCollectionInputView numberOfPrefixSections](self, "numberOfPrefixSections") == a3;
  return v5;
}

- (BOOL)isRecentCategory:(int64_t)a3
{
  if (-[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    return -[STKImageGlyphDataSource isRecentSection:](self->_imageGlyphDataSource, "isRecentSection:", a3);
  }
  else
  {
    return 0;
  }
}

- (BOOL)isEmojiCategory:(int64_t)a3
{
  _BOOL4 v5;
  BOOL v6;

  v5 = -[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph");
  v6 = -[UIKeyboardEmojiAndStickerCollectionInputView isSearchCategory:](self, "isSearchCategory:", a3);
  if (!v5)
    return !v6;
  if (v6)
    return 0;
  return -[STKImageGlyphDataSource isEmojiSection:](self->_imageGlyphDataSource, "isEmojiSection:", a3);
}

- (int64_t)memojiCategoryIndex
{
  return -[STKImageGlyphDataSource memojiCategoryIndex](self->_imageGlyphDataSource, "memojiCategoryIndex");
}

- (int64_t)stickersCategoryIndex
{
  return -[STKImageGlyphDataSource stickersCategoryIndex](self->_imageGlyphDataSource, "stickersCategoryIndex");
}

- (int64_t)recentCategoryIndex
{
  return -[STKImageGlyphDataSource recentCategoryIndex](self->_imageGlyphDataSource, "recentCategoryIndex");
}

- (int64_t)emojiCategoryIndex
{
  return -[STKImageGlyphDataSource emojiCategoryIndex](self->_imageGlyphDataSource, "emojiCategoryIndex");
}

- (int64_t)memojiSectionIndex
{
  void *v2;
  void *v3;
  int64_t v4;

  -[STKImageGlyphDataSource indexPathForCategoryIndex:](self->_imageGlyphDataSource, "indexPathForCategoryIndex:", -[UIKeyboardEmojiAndStickerCollectionInputView memojiCategoryIndex](self, "memojiCategoryIndex"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "section");
  else
    v4 = 0;

  return v4;
}

- (int64_t)stickersSectionIndex
{
  void *v3;
  void *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[STKImageGlyphDataSource indexPathForCategoryIndex:](self->_imageGlyphDataSource, "indexPathForCategoryIndex:", -[UIKeyboardEmojiAndStickerCollectionInputView stickersCategoryIndex](self, "stickersCategoryIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "section");
  }
  else
  {
    v6 = -[UIKeyboardEmojiAndStickerCollectionInputView numberOfPrefixSections](self, "numberOfPrefixSections");
    v7 = 2;
    if (v6 > 2)
      v7 = v6;
    v5 = v7 - 2;
  }

  return v5;
}

- (int64_t)recentSectionIndex
{
  void *v3;
  void *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[STKImageGlyphDataSource indexPathForCategoryIndex:](self->_imageGlyphDataSource, "indexPathForCategoryIndex:", -[UIKeyboardEmojiAndStickerCollectionInputView recentCategoryIndex](self, "recentCategoryIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "section");
  }
  else
  {
    v6 = -[UIKeyboardEmojiAndStickerCollectionInputView numberOfPrefixSections](self, "numberOfPrefixSections");
    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;
    v5 = v7 - 1;
  }

  return v5;
}

- (int64_t)emojiSectionIndex
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[STKImageGlyphDataSource indexPathForCategoryIndex:](self->_imageGlyphDataSource, "indexPathForCategoryIndex:", -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryIndex](self, "emojiCategoryIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "section");
  else
    v5 = -[UIKeyboardEmojiAndStickerCollectionInputView numberOfPrefixSections](self, "numberOfPrefixSections");
  v6 = v5;

  return v6;
}

- (id)recentsIndexPath
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, -[UIKeyboardEmojiAndStickerCollectionInputView recentSectionIndex](self, "recentSectionIndex"));
}

- (double)categoryHeaderHeight
{
  return 0.0;
}

- (double)categoryHeaderFontSize
{
  return 0.0;
}

- (double)emojiKeyWidthForGlyph:(id)a3
{
  double v4;
  void *v5;
  uint64_t v6;
  double v7;

  v4 = 0.0;
  if (objc_msgSend(a3, "stickerSourceType") == 2)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1 && !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    {
      if ((unint64_t)(-[UIView _keyboardOrientation](self, "_keyboardOrientation") - 3) >= 2)
        v4 = 0.0;
      else
        v4 = -6.0;
    }
  }
  -[UIKeyboardEmojiAndStickerCollectionInputView emojiKeyWidth](self, "emojiKeyWidth");
  return v4 + v7;
}

- (double)emojiKeyWidth
{
  double result;

  -[UIKeyboardEmojiGraphicsTraits emojiKeyWidth](self->_emojiGraphicsTraits, "emojiKeyWidth");
  return result;
}

- (double)topPadding
{
  double result;

  -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v5;
  int64_t v6;

  if (-[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph", a3))
    return -[STKImageGlyphDataSource numberOfSections](self->_imageGlyphDataSource, "numberOfSections");
  +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!-[UIKeyboardEmojiAndStickerCollectionInputView showingRecents](self, "showingRecents"))
    v6 += -[UIKeyboardEmojiAndStickerCollectionInputView isSearching](self, "isSearching");
  return v6;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v9;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  id v14;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = -[UIKeyboardEmojiAndStickerCollectionInputView isStickersCategory:](self, "isStickersCategory:", objc_msgSend(v11, "section"));
  v13 = v11;
  if (!v12)
  {
    if (-[UIKeyboardEmojiAndStickerCollectionInputView isStickersCategory:](self, "isStickersCategory:", objc_msgSend(v10, "section")))
    {
      v13 = v10;
    }
    else
    {
      v13 = v9;
    }
  }
  v14 = v13;

  return v14;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v13;
  void *v14;
  int64_t v15;

  if (-[UIKeyboardEmojiAndStickerCollectionInputView isSearchCategory:](self, "isSearchCategory:", a4)
    && -[UIKeyboardEmojiAndStickerCollectionInputView isSearching](self, "isSearching"))
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
      return 1;
    v8 = -[UIKeyboardEmojiGraphicsTraits prepolulatedRecentCount](self->_emojiGraphicsTraits, "prepolulatedRecentCount");
    -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 > v8)
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "count");

    }
    return v8;
  }
  else if (-[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph"))
  {
    return -[STKImageGlyphDataSource numberOfItemsInSection:](self->_imageGlyphDataSource, "numberOfItemsInSection:", a4);
  }
  else
  {
    +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", a4));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emoji");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    return v15;
  }
}

- (BOOL)hasVerticalScrolling
{
  return -[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection") == UICollectionViewScrollDirectionVertical;
}

+ (BOOL)shouldHighlightEmoji:(id)a3
{
  return +[UIKeyboardEmoji shouldHighlightEmoji:](UIKeyboardEmoji, "shouldHighlightEmoji:", a3);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  v7 = objc_msgSend(v5, "item");
  if (-[UIKeyboardEmojiAndStickerCollectionInputView isSearchCategory:](self, "isSearchCategory:", v6)
    || -[UIKeyboardEmojiAndStickerCollectionInputView isEmojiCategory:](self, "isEmojiCategory:", v6))
  {
    -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](self->_collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kEmojiCellIdentifier"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIKeyboardEmojiAndStickerCollectionInputView isSearchCategory:](self, "isSearchCategory:", v6)
      && (-[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v9))
    {
      -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](self->_collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kEmojiCellIdentifier"), v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (!v12)
      {
        objc_msgSend(v10, "setEmoji:", 0);
        objc_msgSend(v10, "setNoResultsCell:", 1);
        goto LABEL_25;
      }
      -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v7 >= v14)
      {
        objc_msgSend(v10, "setEmoji:", 0);
        goto LABEL_25;
      }
      -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "type");
        if (v17 == 1)
        {
          -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](self->_collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kStickerCellIdentifier"), v5);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setImageGlyph:", v16);
          goto LABEL_30;
        }
        if (v17 == 3)
        {
          objc_msgSend(v16, "toString");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v18, +[UIKeyboardEmojiCategory hasVariantsForEmoji:](UIKeyboardEmojiCategory, "hasVariantsForEmoji:", v18));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }

LABEL_25:
          v20 = 0;
          goto LABEL_29;
        }
      }
      v8 = v10;
    }
    else if (-[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph"))
    {
      -[STKImageGlyphDataSource itemAtIndexPath:](self->_imageGlyphDataSource, "itemAtIndexPath:", v5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v21;
      if (v21)
      {
        objc_msgSend(v21, "toString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastUsedVariantEmojiForEmojiString:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v19, v23);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v8;
LABEL_15:

        if (v20)
        {
          v8 = v10;
          goto LABEL_20;
        }
LABEL_29:
        v10 = v10;
        v16 = v20;
        v32 = v10;
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", v6));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "emoji");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v16, "objectAtIndex:", v7);
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v20 = (void *)v25;
          -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "emojiString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastUsedVariantEmojiForEmojiString:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setEmojiString:", v28);

LABEL_20:
          objc_msgSend(v8, "setEmoji:", v20);
          -[UIKeyboardEmojiAndStickerCollectionInputView emojiKeyWidth](self, "emojiKeyWidth");
          objc_msgSend(v8, "setEmojiFontSize:", (uint64_t)v29);
          if (os_variant_has_internal_diagnostics())
          {
            v30 = (void *)objc_opt_class();
            objc_msgSend(v20, "emojiString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setUnreleasedHighlight:", objc_msgSend(v30, "shouldHighlightEmoji:", v31));

          }
          goto LABEL_28;
        }
      }
    }

    v20 = 0;
LABEL_28:
    v10 = v8;
    goto LABEL_29;
  }
  -[UIKeyboardEmojiAndStickerCollectionInputView stickerCellForIndexPath:](self, "stickerCellForIndexPath:", v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v32;
}

- (id)stickerCellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](self->_collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kStickerCellIdentifier"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph"))
  {
    -[STKImageGlyphDataSource itemAtIndexPath:](self->_imageGlyphDataSource, "itemAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageGlyph:", v6);
    -[UIKeyboardEmojiAndStickerCollectionInputView _updateRearrangeModeForCell:atIndexPath:](self, "_updateRearrangeModeForCell:atIndexPath:", v5, v4);

  }
  return v5;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  void *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  int64_t v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  double v33;
  void *v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  emojiGraphicsTraits = self->_emojiGraphicsTraits;
  if (emojiGraphicsTraits && emojiGraphicsTraits->_isFirstPartyStickers && !objc_msgSend(v10, "section"))
  {
    v13 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("kEmojiCategoryTitleIdentifier"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection") == UICollectionViewScrollDirectionVertical)
  {
    -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->_emojiGraphicsTraits, "inputViewLeftMostPadding");
    v15 = v14;
    -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](self->_emojiGraphicsTraits, "inputViewRightMostPadding");
    objc_msgSend(v13, "setInsets:", 0.0, v15, 0.0, v16);
  }
  v17 = objc_msgSend(v11, "section");
  v18 = -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", v17);
  if (-[UIKeyboardEmojiAndStickerCollectionInputView isMemojiCategory:](self, "isMemojiCategory:", v17))
  {
    v19 = CFSTR("Memoji");
LABEL_13:
    _UILocalizedStringInSystemLanguage(v19, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (-[UIKeyboardEmojiAndStickerCollectionInputView isStickersCategory:](self, "isStickersCategory:", v17))
  {
    v19 = CFSTR("Stickers");
    goto LABEL_13;
  }
  if (-[UIKeyboardEmojiAndStickerCollectionInputView isSearchCategory:](self, "isSearchCategory:", v17))
  {
    v19 = CFSTR("Results");
    goto LABEL_13;
  }
  +[UIKeyboardEmojiCategory displayName:](UIKeyboardEmojiCategory, "displayName:", v18);
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v21 = (void *)v20;
  objc_msgSend(v13, "setHeaderName:", v20);
  -[UIKeyboardEmojiAndStickerCollectionInputView categoryHeaderFontSize](self, "categoryHeaderFontSize");
  objc_msgSend(v13, "setHeaderFontSize:");
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "_keyboardGraphicsQuality");

  -[UIKBKeyView renderConfig](self, "renderConfig");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "whiteText");
  if (v23 == 10)
  {
    if ((v25 & 1) == 0)
    {
      v26 = 0.51372549;
      v27 = 0.517647059;
      v28 = 0.529411765;
LABEL_20:
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v26, v27, v28, 1.0);
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
  }
  else if ((v25 & 1) == 0)
  {
    v26 = 0.647;
    v27 = 0.651;
    v28 = 0.663;
    goto LABEL_20;
  }
  +[UIColor whiteColor](UIColor, "whiteColor");
  v29 = objc_claimAutoreleasedReturnValue();
LABEL_21:
  v30 = (void *)v29;
  objc_msgSend(v13, "setHeaderTextColor:", v29);

  -[UIKBKeyView renderConfig](self, "renderConfig");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "whiteText");
  v33 = 0.4;
  if (!v32)
    v33 = 1.0;
  objc_msgSend(v13, "setHeaderOpacity:", v33);

  -[UIKBKeyView renderConfig](self, "renderConfig");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUseVibrantBlend:", objc_msgSend(v34, "whiteText"));

LABEL_24:
  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  v10 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0.0;
    if (!objc_msgSend(v9, "scrollDirection"))
    {
      emojiGraphicsTraits = self->_emojiGraphicsTraits;
      if (emojiGraphicsTraits && !a5 && emojiGraphicsTraits->_isFirstPartyStickers)
      {
        v10 = *MEMORY[0x1E0C9D820];
        v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      else
      {
        objc_msgSend(v8, "bounds");
        v10 = v15;
        -[UIKeyboardEmojiAndStickerCollectionInputView categoryHeaderHeight](self, "categoryHeaderHeight");
        v11 = v16;
      }
    }
  }
  else
  {
    v11 = 0.0;
  }

  v13 = v10;
  v14 = v11;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)deleteImageGlyph:(id)a3 atPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__UIKeyboardEmojiAndStickerCollectionInputView_deleteImageGlyph_atPath___block_invoke;
    v9[3] = &unk_1E16B1500;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    objc_msgSend(v8, "performDeleteWithCompletionHandler:", v9);

    objc_destroyWeak(&v11);
  }

  objc_destroyWeak(&location);
}

void __72__UIKeyboardEmojiAndStickerCollectionInputView_deleteImageGlyph_atPath___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[103], "deleteItem:completionHandler:", *(_QWORD *)(a1 + 32), &__block_literal_global_189);

}

- (BOOL)showingRecents
{
  return 0;
}

- (int64_t)emojiCategoryTypeForSection:(int64_t)a3
{
  if (-[UIKeyboardEmojiAndStickerCollectionInputView isMemojiCategory:](self, "isMemojiCategory:"))
    return 13;
  if (-[UIKeyboardEmojiAndStickerCollectionInputView isStickersCategory:](self, "isStickersCategory:", a3))
    return 14;
  if (-[UIKeyboardEmojiAndStickerCollectionInputView isRecentCategory:](self, "isRecentCategory:", a3))
    return 0;
  return -[UIKeyboardEmojiAndStickerCollectionInputView translatedEmojiCategoryForSection:](self, "translatedEmojiCategoryForSection:", a3);
}

- (int64_t)translatedEmojiCategoryForSection:(int64_t)a3
{
  int64_t v5;
  int64_t v6;

  v5 = -[UIKeyboardEmojiAndStickerCollectionInputView numberOfPrefixSections](self, "numberOfPrefixSections");
  v6 = -[UIKeyboardEmojiAndStickerCollectionInputView numberOfPrefixCategories](self, "numberOfPrefixCategories");
  return +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", (a3 - v5 + v6) & ~((a3 - v5 + v6) >> 63));
}

- (int64_t)sectionForCategoryType:(int64_t)a3
{
  unint64_t v5;
  int64_t v6;

  switch(a3)
  {
    case 0:
      return -[UIKeyboardEmojiAndStickerCollectionInputView recentSectionIndex](self, "recentSectionIndex");
    case 14:
      return -[UIKeyboardEmojiAndStickerCollectionInputView stickersSectionIndex](self, "stickersSectionIndex");
    case 13:
      return -[UIKeyboardEmojiAndStickerCollectionInputView memojiSectionIndex](self, "memojiSectionIndex");
  }
  v5 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:");
  v6 = -[UIKeyboardEmojiAndStickerCollectionInputView emojiSectionIndex](self, "emojiSectionIndex");
  return v6
       + v5
       - -[UIKeyboardEmojiAndStickerCollectionInputView numberOfPrefixCategories](self, "numberOfPrefixCategories");
}

- (BOOL)handleKeyEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  UIKBTree *selectedPopupKey;

  v4 = a3;
  if (objc_msgSend(v4, "keyCode"))
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView emojiSearchField](self, "emojiSearchField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "markedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      if ((objc_msgSend(v4, "keyCode") == 44 || objc_msgSend(v4, "keyCode") == 40)
        && -[UIKeyboardEmojiAndStickerCollectionInputView handleSelectionEvent:](self, "handleSelectionEvent:", v4))
      {
        goto LABEL_13;
      }
      if (self->_showingVariants)
      {
        selectedPopupKey = self->_selectedPopupKey;
        if (selectedPopupKey)
        {
          if (-[UIKBTree variantType](selectedPopupKey, "variantType") == 12
            || -[UIKBTree variantType](self->_selectedPopupKey, "variantType") == 13)
          {
            if (-[UIKeyboardEmojiAndStickerCollectionInputView handleKeyInputForFamilySelector:](self, "handleKeyInputForFamilySelector:", v4))
            {
LABEL_13:
              v7 = 1;
              goto LABEL_4;
            }
          }
          else if (-[UIKeyboardEmojiAndStickerCollectionInputView handleKeyInputForVariantSelector:](self, "handleKeyInputForVariantSelector:", v4))
          {
            goto LABEL_13;
          }
        }
      }
      v7 = -[UIKeyboardEmojiAndStickerCollectionInputView handleKeyInputForCollectionViewNavigation:](self, "handleKeyInputForCollectionViewNavigation:", v4);
      goto LABEL_4;
    }
  }
  v7 = 0;
LABEL_4:

  return v7;
}

- (BOOL)handleKeyInputForVariantSelector:(id)a3
{
  id v4;
  unint64_t selectedVariant;
  void *v6;
  unint64_t v7;
  int64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  UIKBTree *v12;
  int64_t v13;
  void *v14;
  void *v15;
  int v16;
  int64_t v17;
  int64_t v18;
  BOOL v19;
  int64_t v20;
  void *v21;
  UIKBTree *selectedPopupKey;
  void *v23;
  void *v24;
  void *v25;
  int v26;

  v4 = a3;
  if (objc_msgSend(v4, "modifiersEqual:", 0))
  {
    switch(-[UIKeyboardEmojiAndStickerCollectionInputView keyCodeForCurrentEnvironmentFromKeyCode:](self, "keyCodeForCurrentEnvironmentFromKeyCode:", objc_msgSend(v4, "keyCode")))
    {
      case 'O':
        if (-[UIKBTree selectedVariantIndex](self->_selectedPopupKey, "selectedVariantIndex") == 0x7FFFFFFFFFFFFFFFLL
          || (selectedVariant = self->_selectedVariant,
              -[UIKBTree subtrees](self->_selectedPopupKey, "subtrees"),
              v6 = (void *)objc_claimAutoreleasedReturnValue(),
              v7 = objc_msgSend(v6, "count") - 1,
              v6,
              selectedVariant >= v7))
        {
          v8 = 0;
        }
        else
        {
          v8 = self->_selectedVariant + 1;
        }
        self->_selectedVariant = v8;
        -[UIKBTree subtrees](self->_selectedPopupKey, "subtrees");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndex:", self->_selectedVariant);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "interactionType");

        v17 = self->_selectedVariant;
        if (v16)
          goto LABEL_25;
        ++v17;
        goto LABEL_24;
      case 'P':
        if (-[UIKBTree selectedVariantIndex](self->_selectedPopupKey, "selectedVariantIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {
          self->_selectedVariant = 0;
        }
        else
        {
          v18 = self->_selectedVariant;
          v19 = v18 < 1;
          v20 = v18 - 1;
          if (v19)
          {
            -[UIKBTree subtrees](self->_selectedPopupKey, "subtrees");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            self->_selectedVariant = objc_msgSend(v23, "count") - 1;

          }
          else
          {
            self->_selectedVariant = v20;
          }
        }
        -[UIKBTree subtrees](self->_selectedPopupKey, "subtrees");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndex:", self->_selectedVariant);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "interactionType");

        v17 = self->_selectedVariant;
        if (!v26)
        {
          --v17;
LABEL_24:
          self->_selectedVariant = v17;
        }
LABEL_25:
        -[UIKBTree setSelectedVariantIndex:](self->_selectedPopupKey, "setSelectedVariantIndex:", v17);
        -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v21;
        selectedPopupKey = self->_selectedPopupKey;
        goto LABEL_26;
      case 'Q':
        -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateState:forKey:", 2, self->_selectedPopupKey);

        self->_showingVariants = 0;
        v12 = self->_selectedPopupKey;
        self->_selectedPopupKey = 0;

        -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardEmojiAndStickerCollectionInputView updateHighlightForIndexPath:scrollIfNeeded:animateScroll:](self, "updateHighlightForIndexPath:scrollIfNeeded:animateScroll:", v9, 0, 0);
        goto LABEL_27;
      case 'R':
        if (-[UIKBTree selectedVariantIndex](self->_selectedPopupKey, "selectedVariantIndex") == 0x7FFFFFFFFFFFFFFFLL)
          v13 = 0;
        else
          v13 = -[UIKBTree selectedVariantIndex](self->_selectedPopupKey, "selectedVariantIndex");
        self->_selectedVariant = v13;
        -[UIKBTree setSelectedVariantIndex:](self->_selectedPopupKey, "setSelectedVariantIndex:");
        -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v21;
        selectedPopupKey = self->_selectedPopupKey;
LABEL_26:
        objc_msgSend(v21, "updateState:forKey:", 16, selectedPopupKey);
LABEL_27:
        v10 = 1;
        break;
      default:
        if (!self->_selectedPopupKey)
          goto LABEL_8;
        -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updateState:forKey:", 2, self->_selectedPopupKey);
        v10 = 0;
        break;
    }

  }
  else
  {
LABEL_8:
    v10 = 0;
  }

  return v10;
}

- (BOOL)handleKeyInputForCollectionViewNavigation:(id)a3
{
  id v4;
  BOOL v5;
  int v7;
  int v8;
  int v9;
  int v10;
  _BOOL4 v11;
  UIUserInterfaceLayoutDirection v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  int64_t v33;
  id v34;
  UIKeyboardEmojiAndStickerCollectionInputView *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  int v41;
  int v42;
  _BOOL4 v43;
  char v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  int v48;
  unint64_t v49;
  _BOOL4 v50;
  _BOOL4 v51;
  uint64_t v52;
  NSInteger v53;
  int64_t v54;
  int v55;
  int v56;
  void *v57;
  BOOL v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  unint64_t v64;
  char v65;
  int v66;
  int64_t v67;
  int64_t v68;
  _BOOL4 v69;
  int64_t v70;
  _BOOL4 v71;
  NSInteger v72;
  _BOOL4 v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  _BOOL4 v78;
  unint64_t v79;
  uint64_t v80;
  int64_t v81;
  int64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int64_t v91;

  v4 = a3;
  if ((objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 44) & 1) != 0
    || (objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 158) & 1) != 0)
  {
    goto LABEL_3;
  }
  if ((objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 79) & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 79, 0x100000);
  if ((objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 80) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 80, 0x100000);
  if ((objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 82) & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 82, 0x100000);
  if ((objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 81) & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 81, 0x100000);
  v11 = -[UIKeyboardEmojiAndStickerCollectionInputView hasVerticalScrolling](self, "hasVerticalScrolling");
  v12 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft)
    v13 = v7;
  else
    v13 = v8;
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft)
    v7 = v8;
  if (v11)
    v14 = v9;
  else
    v14 = v13;
  if (v11)
    v15 = v10;
  else
    v15 = v7;
  v87 = v15;
  if (v11)
    v16 = v13;
  else
    v16 = v9;
  if (v11)
    v17 = v7;
  else
    v17 = v10;
  -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v88 = v14;
    v89 = v17;
    -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v19, "section");

    -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "item");

  }
  else
  {
    if (-[UIKeyboardEmojiAndStickerCollectionInputView isSearching](self, "isSearching") && ((v7 | v13) & 1) != 0)
      goto LABEL_3;
    v89 = v17;
    -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sortedArrayUsingSelector:", sel_compare_);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v86 = v23;
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "section");
    v21 = objc_msgSend(v24, "item");
    v91 = v25;
    if (!(v25 | v21))
      v21 = -[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
    v88 = v14;
    if (-[UIKeyboardEmojiAndStickerCollectionInputView isSearching](self, "isSearching"))
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (!v27)
        v91 = -[UIKeyboardEmojiAndStickerCollectionInputView recentSectionIndex](self, "recentSectionIndex") + 1;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21, v91);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiAndStickerCollectionInputView setSelectedIndexPath:](self, "setSelectedIndexPath:", v28);

  }
  v29 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v91);
  if (v11)
    v30 = 8;
  else
    v30 = 5;
  if (v11)
    v31 = 7;
  else
    v31 = 8;
  if (-[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph"))
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[UIKeyboardEmojiAndStickerCollectionInputView rowsInSection:](self, "rowsInSection:", objc_msgSend(v32, "section"));
    v34 = v4;
    v35 = self;
    v36 = v18;
    v37 = v29;
    v38 = v21;
    v39 = v31;
    v40 = v33;

    v30 = v40;
    v31 = v39;
    v21 = v38;
    v29 = v37;
    v18 = v36;
    self = v35;
    v4 = v34;
  }
  if (v89)
  {
    if (v18)
    {
      v41 = v88;
      if (v21 >= v29 - 1)
      {
        v53 = -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections");
        v42 = 0;
        v54 = v91;
        if (v91 < v53 - 1)
        {
          v21 = 0;
          v54 = v91 + 1;
        }
        v91 = v54;
      }
      else
      {
        v42 = 0;
        ++v21;
      }
      v44 = 1;
      goto LABEL_89;
    }
    v42 = 0;
    v44 = 1;
    v52 = 1;
    v41 = v88;
LABEL_90:
    if (-[UIKeyboardEmojiAndStickerCollectionInputView isSearching](self, "isSearching")
      && v91 == -[UIKeyboardEmojiAndStickerCollectionInputView recentSectionIndex](self, "recentSectionIndex"))
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v21 < objc_msgSend(v57, "count");

      if (v58)
      {
        v59 = v91;
      }
      else
      {
        v21 = 0;
        v59 = 1;
      }
      if (((v58 | v44) & 1) != 0 || ((v41 ^ 1) & 1) != 0)
        goto LABEL_100;
      -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "count");

      if (!v61)
      {
        v21 = 0;
        v59 = 1;
        goto LABEL_100;
      }
      -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v62, "count") - 1;

    }
    v59 = v91;
LABEL_100:
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21, v59);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiAndStickerCollectionInputView updateHighlightForIndexPath:scrollIfNeeded:animateScroll:](self, "updateHighlightForIndexPath:scrollIfNeeded:animateScroll:", v63, v52, v52 & v42);

    v5 = 1;
    goto LABEL_4;
  }
  if (v16)
  {
    v43 = -[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
    v44 = v87;
    if (v18)
    {
      v45 = v91 < 2 && v43;
      if (v21 > v45)
      {
        v42 = 0;
        --v21;
LABEL_88:
        v41 = 1;
LABEL_89:
        v52 = 1;
        goto LABEL_90;
      }
      if (v91 >= 1)
      {
        v42 = 0;
        v21 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v91 - 1) - 1;
        v41 = 1;
        v52 = 1;
        --v91;
        goto LABEL_90;
      }
    }
    v42 = 0;
    goto LABEL_88;
  }
  if (v87)
  {
    if (v18)
      v46 = v30;
    else
      v46 = 0;
    v47 = !-[UIScrollView isScrollAnimating](self->_collectionView, "isScrollAnimating");
    v48 = objc_msgSend(v4, "modifiersEqual:", 0x100000);
    v90 = v48 | v47;
    if (v48)
      v49 = v30 * v31;
    else
      v49 = v46;
    v50 = -[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
    if (v91)
      v51 = 0;
    else
      v51 = v50;
    if (!v18 && !v48)
    {
      v44 = 1;
      v52 = 1;
LABEL_103:
      v41 = v88;
      v42 = v90;
      goto LABEL_90;
    }
    v64 = v49 + v21 - v29;
    if (v49 + v21 < v29)
    {
      v44 = 1;
      v52 = 1;
      v21 += v49;
      goto LABEL_103;
    }
    v41 = v88;
    if (v91 + 1 >= -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections"))
    {
      v21 = v29 - 1;
      v44 = 1;
      v52 = 1;
    }
    else
    {
      v77 = v29 % v30;
      v78 = v51;
      if (v51)
        v79 = 0;
      else
        v79 = v30;
      if (v77 <= 0)
        v79 = 0;
      v80 = v77 - v79 + v64;
      if (v80 >= -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v91 + 1)
        || v80 < 0)
      {
        v80 = v21 % v30;
      }
      if (v78)
      {
        if (v80 <= 0)
        {
          v21 %= v30;
          v52 = 1;
          v44 = 1;
        }
        else
        {
          v21 = v80 - 1;
          v44 = 1;
          v52 = 1;
        }
        v91 = 1;
      }
      else
      {
        v44 = 1;
        v52 = 1;
        v21 = v80;
        ++v91;
      }
    }
LABEL_153:
    v42 = v90;
    goto LABEL_90;
  }
  if (v88)
  {
    v55 = !-[UIScrollView isScrollAnimating](self->_collectionView, "isScrollAnimating");
    v56 = objc_msgSend(v4, "modifiersEqual:", 0x100000);
    v42 = v56 | v55;
    if (!v18 && !v56)
    {
      v44 = 0;
      goto LABEL_88;
    }
    v90 = v56 | v55;
    if (!v56)
      v31 = 1;
    v68 = v21 - v31 * v30;
    v69 = -[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
    if (v91)
      v70 = 0;
    else
      v70 = v69;
    if (v68 >= v70)
    {
      v44 = 0;
      v41 = 1;
      v52 = 1;
      v21 = v68;
    }
    else if (v91 < 1)
    {
      v44 = 0;
      v41 = 1;
      v52 = 1;
      v21 = v70;
    }
    else
    {
      v71 = v69;
      v72 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v91 - 1);
      v73 = v91 == 1;
      if (v73 && v71)
        v74 = 1;
      else
        v74 = v70;
      v75 = v30 + v72 / v30 * v30 - v72;
      if (v73 && v71)
        v75 = 0;
      if ((uint64_t)(v72 + v68 + v75) >= v72)
        v76 = v30;
      else
        v76 = 0;
      v21 = v75 + v72 + v21 + v30 * ~v31 - v76;
      v41 = 1;
      do
        v21 += v30;
      while ((uint64_t)v21 < v74);
      v44 = 0;
      v52 = 1;
      --v91;
    }
    goto LABEL_153;
  }
  v65 = objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 43);
  v66 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 43, 0x20000);
  if ((v65 & 1) != 0 || v66)
  {
    if (v66)
    {
      if (v91 <= 0)
      {
        v44 = 0;
        v41 = 0;
        v42 = 0;
        v91 = 0;
        v21 = -[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
        goto LABEL_89;
      }
      v67 = v91 - 1;
    }
    else
    {
      if (v91 >= -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections") - 1)
      {
        v91 = -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections") - 1;
        v44 = 0;
        v41 = 0;
        v42 = 0;
        v21 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:") - 1;
        goto LABEL_89;
      }
      v67 = v91 + 1;
    }
    v91 = v67;
    v81 = v67;
    v82 = -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", v67);
    -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "reloadForCategory:withSender:", v82, self);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v81);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiAndStickerCollectionInputView updateToIndexPath:](self, "updateToIndexPath:", v84);

    -[UIKeyboardEmojiAndStickerCollectionInputView category](self, "category");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v85, "lastVisibleFirstEmojiIndex");

    v44 = 0;
    v41 = 0;
    v52 = 0;
    v42 = 0;
    if (!(v21 | v81))
    {
      v91 = 0;
      v21 = -[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia");
    }
    goto LABEL_90;
  }
LABEL_3:
  v5 = 0;
LABEL_4:

  return v5;
}

- (BOOL)handleKeyInputForFamilySelector:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  unint64_t currentVariantRow;
  int64_t v9;
  void *v10;
  int64_t selectedVariant;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  void *v20;
  UIKBTree *selectedPopupKey;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  BOOL v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  int64_t v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "modifiersEqual:", 0);
  if (v5)
  {
    -[UIKBTree selectedVariantIndices](self->_selectedPopupKey, "selectedVariantIndices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (!v7)
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E1A94658);
    currentVariantRow = self->_currentVariantRow;
    if (currentVariantRow <= objc_msgSend(v7, "count") - 1)
    {
      v9 = self->_currentVariantRow;
    }
    else
    {
      v9 = 0;
      self->_currentVariantRow = 0;
    }
    objc_msgSend(v7, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_selectedVariant = objc_msgSend(v10, "integerValue");

    switch(-[UIKeyboardEmojiAndStickerCollectionInputView keyCodeForCurrentEnvironmentFromKeyCode:](self, "keyCodeForCurrentEnvironmentFromKeyCode:", objc_msgSend(v4, "keyCode")))
    {
      case 'O':
        selectedVariant = self->_selectedVariant;
        if (selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
          v12 = 0;
        else
          v12 = selectedVariant + 1;
        goto LABEL_25;
      case 'P':
        v13 = self->_selectedVariant;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = 0;
        }
        else
        {
          if (v13 < 1)
            goto LABEL_26;
          v12 = v13 - 1;
        }
LABEL_25:
        self->_selectedVariant = v12;
LABEL_26:
        v23 = self->_currentVariantRow;
        v24 = (void *)MEMORY[0x1E0CB37E8];
        goto LABEL_27;
      case 'Q':
        v14 = -[UIKBTree popupDirection](self->_selectedPopupKey, "popupDirection");
        v15 = self->_currentVariantRow;
        if (v15 < objc_msgSend(v7, "count")
          && (self->_selectedVariant != 0x7FFFFFFFFFFFFFFFLL
           || -[UIKBTree popupDirection](self->_selectedPopupKey, "popupDirection") == 2))
        {
          v16 = -[UIKBTree popupDirection](self->_selectedPopupKey, "popupDirection");
          v17 = self->_currentVariantRow;
          if (v16 == 2 && !v17)
          {
            if (self->_selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
            {
              v17 = -1;
              self->_currentVariantRow = -1;
            }
            else
            {
              v17 = 0;
            }
          }
          if (v17 == objc_msgSend(v7, "count") - 1)
            objc_msgSend(v7, "addObject:", &unk_1E1A99480);
          ++self->_currentVariantRow;
          objc_msgSend(v7, "objectAtIndex:");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          self->_selectedVariant = objc_msgSend(v33, "integerValue");

          if (self->_selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
          {
            self->_selectedVariant = 0;
            v34 = self->_currentVariantRow;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v34, v35);

          }
          -[UIKBTree setSelectedVariantIndices:](self->_selectedPopupKey, "setSelectedVariantIndices:", v7);
          -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "updateState:forKey:", 16, self->_selectedPopupKey);

          if (v14 != 1)
            goto LABEL_30;
          v37 = objc_msgSend(v7, "count");
          -[UIKBTree selectedVariantIndices](self->_selectedPopupKey, "selectedVariantIndices");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "count");

          if (v37 <= v39)
            goto LABEL_30;
        }
        goto LABEL_22;
      case 'R':
        v18 = -[UIKBTree popupDirection](self->_selectedPopupKey, "popupDirection");
        v19 = self->_currentVariantRow;
        if (v18 == 2 && !v19)
        {
LABEL_22:
          -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "updateState:forKey:", 2, self->_selectedPopupKey);

          self->_showingVariants = 0;
          selectedPopupKey = self->_selectedPopupKey;
          self->_selectedPopupKey = 0;

          -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardEmojiAndStickerCollectionInputView updateHighlightForIndexPath:scrollIfNeeded:animateScroll:](self, "updateHighlightForIndexPath:scrollIfNeeded:animateScroll:", v22, 0, 0);
          goto LABEL_29;
        }
        v27 = v19 < 1;
        v28 = v19 - 1;
        if (!v27)
        {
          self->_currentVariantRow = v28;
          goto LABEL_55;
        }
        if (-[UIKBTree popupDirection](self->_selectedPopupKey, "popupDirection") != 1)
          goto LABEL_55;
        v41 = -[UIKBTree selectedVariantIndex](self->_selectedPopupKey, "selectedVariantIndex");
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        -[UIKBTree selectedVariantIndices](self->_selectedPopupKey, "selectedVariantIndices");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (!v29)
          goto LABEL_43;
        v30 = v29;
        v31 = *(_QWORD *)v44;
        break;
      default:
        goto LABEL_28;
    }
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(obj);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "integerValue") == 0x7FFFFFFFFFFFFFFFLL)
        {

          goto LABEL_54;
        }
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v30)
        continue;
      break;
    }
LABEL_43:

    if (v41)
    {
      self->_currentVariantRow = objc_msgSend(v7, "count");
      objc_msgSend(v7, "addObject:", &unk_1E1A99480);
      goto LABEL_55;
    }
LABEL_54:
    self->_currentVariantRow = 0;
LABEL_55:
    objc_msgSend(v7, "objectAtIndex:", self->_currentVariantRow);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    self->_selectedVariant = objc_msgSend(v40, "integerValue");

    if (self->_selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_selectedVariant = 0;
      v23 = self->_currentVariantRow;
      v24 = (void *)MEMORY[0x1E0CB37E8];
LABEL_27:
      objc_msgSend(v24, "numberWithInteger:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v23, v25);

    }
LABEL_28:
    -[UIKBTree setSelectedVariantIndices:](self->_selectedPopupKey, "setSelectedVariantIndices:", v7);
    -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateState:forKey:", 16, self->_selectedPopupKey);
LABEL_29:

LABEL_30:
  }

  return v5;
}

- (BOOL)_handleInitialSelectionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;

  v4 = a3;
  -[UIKeyboardEmojiAndStickerCollectionInputView emojiSearchField](self, "emojiSearchField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 44) && !objc_msgSend(v6, "length")
    || objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 40)
    && objc_msgSend(v6, "length")
    && (-[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v14 = 0;
      goto LABEL_15;
    }
    v12 = (void *)v11;
    if (-[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia")&& !objc_msgSend(v12, "section")&& !objc_msgSend(v12, "item"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    -[UIKeyboardEmojiAndStickerCollectionInputView updateHighlightForIndexPath:scrollIfNeeded:animateScroll:](self, "updateHighlightForIndexPath:scrollIfNeeded:animateScroll:", v12, 0, 0);

  }
  else
  {
    if (!objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 40))
    {
      v14 = 0;
      goto LABEL_17;
    }
    -[UIKeyboardEmojiAndStickerCollectionInputView setIsSearching:](self, "setIsSearching:", 0);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissEmojiPopoverIfNecessaryWithCompletion:", &__block_literal_global_195_1);
  }
  v14 = 1;
LABEL_15:

LABEL_17:
  return v14;
}

void __77__UIKeyboardEmojiAndStickerCollectionInputView__handleInitialSelectionEvent___block_invoke()
{
  id v0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "clearForwardingInputDelegateAndResign:", 0);

}

- (BOOL)_handleVariantSelectionEvent:(id)a3
{
  id v4;
  int v5;
  int v6;
  char v7;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 44);
  v6 = objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 40);

  v7 = v5 | v6;
  if ((v5 | v6) == 1)
  {
    collectionView = self->_collectionView;
    -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardEmojiAndStickerCollectionInputView selectedChildSkinToneEmoji:](self, "selectedChildSkinToneEmoji:", self->_selectedPopupKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree selectedVariantIndices](self->_selectedPopupKey, "selectedVariantIndices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      -[UIKBTree selectedVariantIndices](self->_selectedPopupKey, "selectedVariantIndices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      if (!v16)
      {
        -[UIKBTree setSelectedVariantIndex:](self->_selectedPopupKey, "setSelectedVariantIndex:", 0);
        -[UIKeyboardEmojiAndStickerCollectionInputView selectedChildSkinToneEmoji:](self, "selectedChildSkinToneEmoji:", self->_selectedPopupKey);
        v17 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v17;
      }
    }
    -[UIKBTree setObject:forProperty:](self->_selectedPopupKey, "setObject:forProperty:", v11, CFSTR("UIKBAssociatedEmoji"));
    objc_msgSend(v10, "setEmoji:", v11);
    -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateState:forKey:", 2, self->_selectedPopupKey);

    -[UIKeyboardEmojiAndStickerCollectionInputView didInputSubTree:](self, "didInputSubTree:", self->_selectedPopupKey);
    if (v5)
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiAndStickerCollectionInputView updateHighlightForIndexPath:scrollIfNeeded:animateScroll:](self, "updateHighlightForIndexPath:scrollIfNeeded:animateScroll:", v19, 0, 0);

    }
    else if (!v6)
    {
LABEL_9:

      return v7;
    }
    -[UIKeyboardEmojiAndStickerCollectionInputView insertSelectedEmoji:shouldDismissPopover:](self, "insertSelectedEmoji:shouldDismissPopover:", v11, v5 ^ 1u);
    goto LABEL_9;
  }
  return v7;
}

- (BOOL)_handleBaseKeySelectionEvent:(id)a3
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  NSObject *v30;
  char v31;
  uint8_t buf[16];
  uint8_t v33[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 44);
  v6 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 44, 0x80000);
  v7 = objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 40);
  v8 = objc_msgSend(v4, "equalsKeyCode:modifiers:", 40, 0x80000);
  collectionView = self->_collectionView;
  -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v33 = 0;
          _os_log_fault_impl(&dword_185066000, v30, OS_LOG_TYPE_FAULT, "Memoji cell is selected. Unsupported.", v33, 2u);
        }

      }
      else
      {
        v16 = _handleBaseKeySelectionEvent____s_category_0;
        if (!_handleBaseKeySelectionEvent____s_category_0)
        {
          v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v16, (unint64_t *)&_handleBaseKeySelectionEvent____s_category_0);
        }
        v17 = *(NSObject **)(v16 + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Memoji cell is selected. Unsupported.", buf, 2u);
        }
      }
      goto LABEL_14;
    }
    objc_msgSend(v11, "emoji");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiAndStickerCollectionInputView treeForCell:](self, "treeForCell:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIKeyboardEmojiAndStickerCollectionInputView keySupportsVariants:](self, "keySupportsVariants:", v14))
    {
      -[UIKBKeyView factory](self, "factory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "popupKeyUsesCustomKeyContentView:", v14))
      {
        if (objc_msgSend(v14, "selectedVariantIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {

LABEL_17:
          self->_currentVariantRow = 0;
          objc_msgSend(v14, "selectedVariantIndices");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            objc_msgSend(v19, "firstObject");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "integerValue");

            if (v22 == 0x7FFFFFFFFFFFFFFFLL)
              v23 = 0;
            else
              v23 = v22;
            self->_selectedVariant = v23;
          }
          objc_msgSend(v11, "setSelected:", 0);
          objc_storeStrong((id *)&self->_selectedPopupKey, v14);
          v18 = 1;
          self->_showingVariants = 1;
          -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "updateState:forKey:", 16, v14);

          goto LABEL_34;
        }
        v31 = objc_msgSend(v4, "modifiersEqual:", 0x80000);

        if ((v31 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
      v25 = objc_msgSend(v14, "selectedVariantIndex");
      v26 = v5 | v7;
      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        v26 = 0;
      if ((v26 | v6 | v8) == 1)
      {
        objc_msgSend(v11, "setSelected:", 0);
        if (objc_msgSend(v14, "selectedVariantIndex") != 0x7FFFFFFFFFFFFFFFLL)
          self->_selectedVariant = objc_msgSend(v14, "selectedVariantIndex");
        objc_storeStrong((id *)&self->_selectedPopupKey, v14);
        v18 = 1;
        self->_showingVariants = 1;
        -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "updateState:forKey:", 16, v14);

        goto LABEL_34;
      }
    }
    if (v5)
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiAndStickerCollectionInputView updateHighlightForIndexPath:scrollIfNeeded:animateScroll:](self, "updateHighlightForIndexPath:scrollIfNeeded:animateScroll:", v28, 0, 0);

      -[UIKeyboardEmojiAndStickerCollectionInputView insertSelectedEmoji:shouldDismissPopover:](self, "insertSelectedEmoji:shouldDismissPopover:", v13, 0);
      v18 = 1;
    }
    else if ((_DWORD)v7)
    {
      v18 = 1;
      -[UIKeyboardEmojiAndStickerCollectionInputView insertSelectedEmoji:shouldDismissPopover:](self, "insertSelectedEmoji:shouldDismissPopover:", v13, 1);
    }
    else
    {
      v18 = 0;
    }
LABEL_34:

    goto LABEL_35;
  }
  if ((v5 | v7) == 1)
  {
    objc_msgSend(v11, "imageGlyph");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiAndStickerCollectionInputView insertImageGlyph:dismiss:](self, "insertImageGlyph:dismiss:", v12, v7);

  }
LABEL_14:
  v18 = 1;
LABEL_35:

  return v18;
}

- (BOOL)handleSelectionEvent:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "modifierFlags") && !objc_msgSend(v4, "modifiersEqual:", 0x80000))
  {
    v7 = 0;
  }
  else
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (self->_showingVariants)
        v6 = -[UIKeyboardEmojiAndStickerCollectionInputView _handleVariantSelectionEvent:](self, "_handleVariantSelectionEvent:", v4);
      else
        v6 = -[UIKeyboardEmojiAndStickerCollectionInputView _handleBaseKeySelectionEvent:](self, "_handleBaseKeySelectionEvent:", v4);
    }
    else
    {
      v6 = -[UIKeyboardEmojiAndStickerCollectionInputView _handleInitialSelectionEvent:](self, "_handleInitialSelectionEvent:", v4);
    }
    v7 = v6;
  }

  return v7;
}

- (void)updateHighlightForIndexPath:(id)a3 scrollIfNeeded:(BOOL)a4 animateScroll:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  void *v16;
  UIKeyboardEmojiAndStickerCollectionView *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v5 = a5;
  v6 = a4;
  v20 = a3;
  -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "section");
  v10 = objc_msgSend(v20, "section");

  if (v9 != v10)
  {
    v11 = -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", objc_msgSend(v20, "section"));
    -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadCategoryForIndexPath:withSender:", v20, self);

    -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadForCategory:withSender:", v11, self);

    +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiAndStickerCollectionInputView setCategory:](self, "setCategory:", v14);

  }
  -[UIKeyboardEmojiAndStickerCollectionInputView setSelectedIndexPath:](self, "setSelectedIndexPath:", v20);
  collectionView = self->_collectionView;
  -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v16, 0, 0);

  if (-[UIKeyboardEmojiAndStickerCollectionInputView cellShouldScrollWhenSelectedAtIndexPath:](self, "cellShouldScrollWhenSelectedAtIndexPath:", v20)&& v6)
  {
    v17 = self->_collectionView;
    -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection"))
      v19 = 16;
    else
      v19 = 2;
    -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](v17, "scrollToItemAtIndexPath:atScrollPosition:animated:", v18, v19, v5);

  }
  -[UIKeyboardEmojiAndStickerCollectionInputView updateLastSeenItemForIndexPath:](self, "updateLastSeenItemForIndexPath:", v20);

}

- (void)insertSelectedEmoji:(id)a3 shouldDismissPopover:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString **v15;
  void *v16;
  __CFString **v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UIKBTree *selectedPopupKey;
  id v27;

  v4 = a4;
  v27 = a3;
  -[UIKeyboardEmojiAndStickerCollectionInputView updatePreferencesForSelectedEmoji:](self, "updatePreferencesForSelectedEmoji:", v27);
  -[UIKeyboardEmojiAndStickerCollectionInputView emojiSearchInputViewController](self, "emojiSearchInputViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textDocumentProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "emojiString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertText:", v8);

  -[UIKeyboardEmojiAndStickerCollectionInputView emojiSearchField](self, "emojiSearchField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "section");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    v15 = UIKBAnalyticsEmojiSelectionMethodReturnKey;
    if (!v4)
      v15 = UIKBAnalyticsEmojiSelectionMethodSpaceBar;
    objc_msgSend(v13, "insertedEmojiFromPopover:selectionMethod:", v27, *v15);
  }
  else
  {
    objc_msgSend(v27, "emojiString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = UIKBAnalyticsEmojiSelectionMethodReturnKey;
    if (!v4)
      v17 = UIKBAnalyticsEmojiSelectionMethodSpaceBar;
    objc_msgSend(v14, "emojiSearchWillInsertEmoji:forSearchQuery:selectionMethod:inputType:", v16, v10, *v17, CFSTR("PopoverSearch"));

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activeLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    objc_msgSend(v27, "emojiString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createKeyEventForStringAction:forKey:inputFlags:", v22, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleKeyUIEvent:dismiss:", v23, v4);

  }
  if (v4)
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dismissEmojiPopoverIfNecessaryWithCompletion:", &__block_literal_global_199_0);

  }
  selectedPopupKey = self->_selectedPopupKey;
  self->_selectedPopupKey = 0;

  self->_showingVariants = 0;
}

void __89__UIKeyboardEmojiAndStickerCollectionInputView_insertSelectedEmoji_shouldDismissPopover___block_invoke()
{
  id v0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "clearForwardingInputDelegateAndResign:", 0);

}

- (int64_t)keyCodeForCurrentEnvironmentFromKeyCode:(int64_t)a3
{
  UIUserInterfaceLayoutDirection v4;
  int64_t v5;
  int64_t v6;

  v4 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v5 = 80;
  v6 = 79;
  if (a3 != 80)
    v6 = a3;
  if (a3 != 79)
    v5 = v6;
  if (v4 == UIUserInterfaceLayoutDirectionRightToLeft)
    return v5;
  else
    return a3;
}

- (void)updatePreferencesForSelectedEmoji:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;

  v4 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastUsedInputModeForCurrentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (const __CFString *)v8;
  else
    v9 = CFSTR("en_US");
  v13 = (__CFString *)v9;
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emojiUsed:language:", v4, v13);

  -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiAndStickerCollectionInputView updateLastSeenItemForIndexPath:](self, "updateLastSeenItemForIndexPath:", v12);

  }
}

- (void)updateLastSeenItemForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", objc_msgSend(v4, "section")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiAndStickerCollectionInputView setCategory:](self, "setCategory:", v5);

  v6 = objc_msgSend(v4, "item");
  -[UIKeyboardEmojiAndStickerCollectionInputView category](self, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLastVisibleFirstEmojiIndex:", v6);

  -[UIKeyboardEmojiAndStickerCollectionInputView category](self, "category");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastViewedCategory:", v9);

}

- (void)resetSelectionIfNeeded
{
  void *v3;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  void *v5;
  NSIndexPath *selectedIndexPath;
  UIKBTree *selectedPopupKey;

  -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    collectionView = self->_collectionView;
    -[UIKeyboardEmojiAndStickerCollectionInputView selectedIndexPath](self, "selectedIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView deselectItemAtIndexPath:animated:](collectionView, "deselectItemAtIndexPath:animated:", v5, 0);

    selectedIndexPath = self->_selectedIndexPath;
    self->_selectedIndexPath = 0;

    selectedPopupKey = self->_selectedPopupKey;
    self->_selectedPopupKey = 0;

    self->_showingVariants = 0;
  }
}

- (BOOL)keySupportsVariants:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "variantType") == 10
    || objc_msgSend(v3, "variantType") == 12
    || objc_msgSend(v3, "variantType") == 11
    || objc_msgSend(v3, "variantType") == 13;

  return v4;
}

- (BOOL)cellShouldScrollWhenSelectedAtIndexPath:(id)a3
{
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v10;
  UIKeyboardEmojiAndStickerCollectionView *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  collectionView = self->_collectionView;
  v5 = a3;
  -[UIView bounds](collectionView, "bounds");
  v22 = CGRectInset(v21, 0.0, -1.0);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = self->_collectionView;
  objc_msgSend(v10, "bounds");
  -[UIView convertRect:fromView:](v11, "convertRect:fromView:", v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v25.origin.x = v13;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  v26 = CGRectIntersection(v23, v25);
  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  LOBYTE(v11) = !CGRectEqualToRect(v24, v26);

  return (char)v11;
}

- (void)emojiSearchTextFieldWillBecomeActive:(id)a3
{
  void *v4;
  void *v5;

  -[UIKeyboardEmojiAndStickerCollectionInputView emojiSearchField](self, "emojiSearchField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView renderConfig](self, "renderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setRenderConfig:", v5);

  -[UIKeyboardEmojiAndStickerCollectionView setIsInSearchPopover:](self->_collectionView, "setIsInSearchPopover:", 1);
}

- (void)emojiSearchTextFieldDidBecomeActive:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changePreferredEmojiSearchInputModeForInputDelegate:", v3);

}

- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3
{
  id v4;

  -[UIKeyboardEmojiAndStickerCollectionInputView setIsSearching:](self, "setIsSearching:", 0);
  -[UIKeyboardEmojiAndStickerCollectionView setIsInSearchPopover:](self->_collectionView, "setIsInSearchPopover:", 0);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearForwardingInputDelegateAndResign:", 0);

}

- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAssistantView");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("UIKeyboardSwitchedAwayFromEmoji"), 0);

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hardwareInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentInputMode:", v6);

}

- (void)emojiSearchTextFieldWillClear:(id)a3
{
  -[UIKeyboardEmojiAndStickerCollectionInputView setIsSearching:](self, "setIsSearching:", 0);
  -[UIKeyboardEmojiAndStickerCollectionInputView setSearchResults:](self, "setSearchResults:", MEMORY[0x1E0C9AA60]);
  -[UIKeyboardEmojiAndStickerCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
}

- (void)emojiSearchTextFieldDidReset:(id)a3
{
  _BOOL4 v4;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  _QWORD v6[5];
  _QWORD v7[5];

  v4 = -[UIKeyboardEmojiAndStickerCollectionInputView isSearching](self, "isSearching", a3);
  -[UIKeyboardEmojiAndStickerCollectionInputView setIsSearching:](self, "setIsSearching:", 0);
  -[UIKeyboardEmojiAndStickerCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
  if (v4)
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView setSearchResults:](self, "setSearchResults:", MEMORY[0x1E0C9AA60]);
    if (!-[UIKeyboardEmojiAndStickerCollectionInputView showingRecents](self, "showingRecents"))
    {
      collectionView = self->_collectionView;
      v6[4] = self;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __77__UIKeyboardEmojiAndStickerCollectionInputView_emojiSearchTextFieldDidReset___block_invoke;
      v7[3] = &unk_1E16B1B28;
      v7[4] = self;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __77__UIKeyboardEmojiAndStickerCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_2;
      v6[3] = &unk_1E16B3FD8;
      -[UICollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", v7, v6);
    }
  }
}

void __77__UIKeyboardEmojiAndStickerCollectionInputView_emojiSearchTextFieldDidReset___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 608);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteSections:", v2);

}

uint64_t __77__UIKeyboardEmojiAndStickerCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __77__UIKeyboardEmojiAndStickerCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_3;
  v2[3] = &unk_1E16B1B28;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

uint64_t __77__UIKeyboardEmojiAndStickerCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "reloadData");
}

- (void)setSearchResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSArray *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *searchResults;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (!-[UIKeyboardEmojiAndStickerCollectionInputView isSearching](self, "isSearching"))
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView setIsSearching:](self, "setIsSearching:", 1);
      -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiAndStickerCollectionInputView recentsIndexPath](self, "recentsIndexPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadCategoryForIndexPath:withSender:", v6, self);

      -[UIKeyboardEmojiAndStickerCollectionInputView updateOffsetForSearchResultsAnimated:](self, "updateOffsetForSearchResultsAnimated:", 1);
    }
    -[UIKeyboardEmojiAndStickerCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
    -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = objc_msgSend(v4, "count");

    if (v8 == v9)
    {
      if (objc_msgSend(v4, "count"))
      {
        objc_msgSend(v4, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "isEqual:", v12) ^ 1;

      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 1;
    }
    v17 = (NSArray *)objc_msgSend(v4, "copy");
    searchResults = self->_searchResults;
    self->_searchResults = v17;

    -[STKImageGlyphDataSource snapshot](self->_imageGlyphDataSource, "snapshot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[UIKeyboardEmojiAndStickerCollectionInputView recentSectionIndex](self, "recentSectionIndex"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[UIKeyboardEmojiAndStickerCollectionInputView emojiSectionIndex](self, "emojiSectionIndex"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deleteSectionsWithIdentifiers:", v20);

    v25 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertSectionsWithIdentifiers:beforeSectionWithIdentifier:", v21, v19);

    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "bs_compactMap:", &__block_literal_global_205_1);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = CFSTR("emoji:::");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v22;
    objc_msgSend(v15, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v22, v16);

    -[UIKeyboardEmojiAndStickerCollectionInputView updateDataSourceWithSnapshot:animated:](self, "updateDataSourceWithSnapshot:animated:", v15, 0);
    if (v13)
      -[UIKeyboardEmojiAndStickerCollectionInputView updateOffsetForSearchResultsAnimated:](self, "updateOffsetForSearchResultsAnimated:", 0);

  }
  else
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView setIsSearching:](self, "setIsSearching:", 0);
    -[UIKeyboardEmojiAndStickerCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
    v14 = self->_searchResults;
    self->_searchResults = (NSArray *)MEMORY[0x1E0C9AA60];

    -[UIKeyboardEmojiAndStickerCollectionInputView updateDataSourceSnapshotAnimated:](self, "updateDataSourceSnapshotAnimated:", 0);
    -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiAndStickerCollectionInputView recentsIndexPath](self, "recentsIndexPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reloadCategoryForIndexPath:withSender:", v16, self);
  }

}

id __65__UIKeyboardEmojiAndStickerCollectionInputView_setSearchResults___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  CGFloat v16;
  double v17;
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
  CGFloat v29;
  double v30;
  double Height;
  double v32;
  double v33;
  double Width;
  double v35;
  double v36;
  double v37;
  CGSize result;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v7 = a3;
  v8 = a5;
  -[UIKeyboardEmojiAndStickerCollectionInputView topPadding](self, "topPadding");
  v10 = v9;
  -[UIKeyboardEmojiAndStickerCollectionInputView categoryHeaderHeight](self, "categoryHeaderHeight");
  v12 = v11;
  if (-[UIKeyboardEmojiAndStickerCollectionInputView isSearching](self, "isSearching"))
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView searchResults](self, "searchResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {

    }
    else
    {
      v14 = objc_msgSend(v8, "section");

      if (!v14)
      {
        -[UIKeyboardEmojiAndStickerCollectionInputView emojiKeyWidth](self, "emojiKeyWidth");
        v25 = v24;
        -[UIKeyboardEmojiGraphicsTraits minimumInteritemSpacing](self->_emojiGraphicsTraits, "minimumInteritemSpacing");
        v27 = (v25 + v26 + 1.0) * 6.0;
        -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
        v18 = v27 + v28 + v28;
        objc_msgSend(v7, "bounds");
        v29 = CGRectGetHeight(v40) - v12;
        -[UIKeyboardEmojiGraphicsTraits bottomPadding](self->_emojiGraphicsTraits, "bottomPadding");
        v19 = v29 - v30;
        goto LABEL_11;
      }
    }
  }
  if (!-[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia")|| objc_msgSend(v8, "section")|| objc_msgSend(v8, "item"))
  {
    if (-[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph"))
    {
      v15 = (double)-[UIKeyboardEmojiAndStickerCollectionInputView rowsInSection:](self, "rowsInSection:", objc_msgSend(v8, "section"));
      objc_msgSend(v7, "bounds");
      v16 = (CGRectGetHeight(v39) - v12) / v15;
      -[UIKeyboardEmojiGraphicsTraits bottomPadding](self->_emojiGraphicsTraits, "bottomPadding");
      v18 = v16 - v17 - v10;
      v19 = v18;
    }
    else
    {
      -[UIKeyboardEmojiGraphicsTraits emojiKeyWidth](self->_emojiGraphicsTraits, "emojiKeyWidth");
      v18 = v20;
      -[UIKeyboardEmojiGraphicsTraits emojiKeyWidth](self->_emojiGraphicsTraits, "emojiKeyWidth");
      v19 = v21;
    }
  }
  else
  {
    objc_msgSend(v7, "bounds");
    Height = CGRectGetHeight(v41);
    -[UIKeyboardEmojiGraphicsTraits bottomPadding](self->_emojiGraphicsTraits, "bottomPadding");
    v33 = v32;
    if (-[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection"))
    {
      v19 = Height - v12 - v33;
      if (self->_useWideAnimojiCell)
        v18 = v19 + v19;
      else
        v18 = v19;
    }
    else
    {
      objc_msgSend(v7, "bounds");
      Width = CGRectGetWidth(v42);
      -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->_emojiGraphicsTraits, "inputViewLeftMostPadding");
      v36 = Width - v35;
      -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](self->_emojiGraphicsTraits, "inputViewRightMostPadding");
      v18 = v36 - v37;
      objc_msgSend(v7, "bounds");
      v19 = CGRectGetWidth(v43) * 0.166666667;
    }
  }
LABEL_11:

  v22 = v18;
  v23 = v19;
  result.height = v23;
  result.width = v22;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  NSInteger v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UICollectionViewScrollDirection v16;
  BOOL v17;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSInteger v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UIEdgeInsets result;

  v7 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0, a4);
  -[UIKeyboardEmojiGraphicsTraits sectionOffset](self->_emojiGraphicsTraits, "sectionOffset");
  v9 = v8;
  -[UIKeyboardEmojiGraphicsTraits bottomPadding](self->_emojiGraphicsTraits, "bottomPadding");
  v11 = v10;
  -[UIKeyboardEmojiAndStickerCollectionInputView topPadding](self, "topPadding");
  v13 = v12;
  -[UIKeyboardEmojiAndStickerCollectionInputView categoryHeaderHeight](self, "categoryHeaderHeight");
  v15 = v14;
  v16 = -[UICollectionViewFlowLayout scrollDirection](self->_flowLayout, "scrollDirection");
  if (a5)
    v17 = 1;
  else
    v17 = v7 <= 0;
  v18 = !v17;
  if (v16 == UICollectionViewScrollDirectionVertical)
  {
    if ((v18 & 1) != 0 || a5 == 1 && !v7)
    {
      -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->_emojiGraphicsTraits, "inputViewLeftMostPadding");
      v20 = v21;
      -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](self->_emojiGraphicsTraits, "inputViewRightMostPadding");
      v11 = v9;
    }
    else
    {
      v23 = -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections") - 1;
      -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->_emojiGraphicsTraits, "inputViewLeftMostPadding");
      v20 = v24;
      -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](self->_emojiGraphicsTraits, "inputViewRightMostPadding");
      if (v23 != a5)
        v11 = v9;
    }
    goto LABEL_20;
  }
  if ((v18 & 1) == 0 && (a5 != 1 || v7))
  {
    v13 = v13 + v15;
    v20 = 0.0;
    if (-[UICollectionView numberOfSections](self->_collectionView, "numberOfSections") - 1 != a5)
      goto LABEL_21;
    -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](self->_emojiGraphicsTraits, "inputViewRightMostPadding");
LABEL_20:
    v9 = v22;
    goto LABEL_21;
  }
  v13 = v13 + v15;
  -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->_emojiGraphicsTraits, "inputViewLeftMostPadding");
  v20 = v19;
LABEL_21:
  v25 = v13;
  v26 = v20;
  v27 = v11;
  v28 = v9;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;

  v8 = a3;
  v9 = a4;
  if (!a5
    && -[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia"))
  {
    -[UIKeyboardEmojiGraphicsTraits minimumInteritemSpacing](self->_emojiGraphicsTraits, "minimumInteritemSpacing");
LABEL_6:
    v11 = v10;
    goto LABEL_7;
  }
  v11 = 0.0;
  if (!-[UIKeyboardEmojiAndStickerCollectionInputView isMemojiCategory:](self, "isMemojiCategory:", a5))
  {
    -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
    goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;

  v8 = a3;
  v9 = a4;
  if (!a5
    && -[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia"))
  {
    -[UIKeyboardEmojiGraphicsTraits minimumLineSpacing](self->_emojiGraphicsTraits, "minimumLineSpacing");
LABEL_6:
    v11 = v10;
    goto LABEL_7;
  }
  v11 = 0.0;
  if (!-[UIKeyboardEmojiAndStickerCollectionInputView isMemojiCategory:](self, "isMemojiCategory:", a5))
  {
    -[UIKeyboardEmojiGraphicsTraits minimumInteritemSpacing](self->_emojiGraphicsTraits, "minimumInteritemSpacing");
    goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;

  v8 = a4;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "willDisplay");
  if (!self->_hasShownAnimojiCell
    && -[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia")&& !objc_msgSend(v7, "item")&& !objc_msgSend(v7, "section"))
  {
    self->_hasShownAnimojiCell = 1;
    ADClientAddValueForScalarKey();
  }

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "didEndDisplaying");

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_isDraggingInputView = 1;
  -[UIKeyboardEmojiAndStickerCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded", a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKeyboardEmojiAndStickerCollectionInputView handleScrollViewDynamicPagination:](self, "handleScrollViewDynamicPagination:", v4);
  if (_UIApplicationIsFirstPartyStickers())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("contentOffsetY");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "contentOffset");
    objc_msgSend(v6, "numberWithDouble:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardEmojiCollectionInputViewDidScroll"), 0, v9);

  }
  if (!self->_isRearranging)
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deactivateActiveKey");

  }
  -[UIKeyboardEmojiAndStickerCollectionInputView currentlyFocusedSection](self, "currentlyFocusedSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "section");
  if (self->_currentSection != v12)
  {
    v13 = v12;
    self->_currentSection = v12;
    -[UIKeyboardEmojiAndStickerCollectionInputView _setRearrangeMode:](self, "_setRearrangeMode:", 0);
    if (self->_isDraggingInputView)
    {
      -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reloadCategoryForIndexPath:withSender:", v11, self);

      -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "reloadForCategory:withSender:", -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", v13), self);

    }
  }

}

- (void)handleScrollViewDynamicPagination:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "contentOffset");
    objc_msgSend(v4, "paginationOriginForContentOffset:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v8, "setPagingEnabled:", 1);
      objc_msgSend(v5, "doubleValue");
      v7 = 0.0;
    }
    else
    {
      objc_msgSend(v8, "setPagingEnabled:", 0);
      v6 = *MEMORY[0x1E0C9D538];
      v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    objc_msgSend(v8, "_setPagingOrigin:", v6, v7);

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat v6;

  self->_isDraggingInputView = 1;
  -[UIKeyboardEmojiAndStickerCollectionInputView snappedXOffsetForOffset:scrubbing:](self, "snappedXOffsetForOffset:scrubbing:", 0, a5->x, a4.y);
  a5->x = v6;
}

- (id)itemInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__157;
  v16 = __Block_byref_object_dispose__157;
  v17 = 0;
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutAttributesForElementsInRect:", x, y, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__UIKeyboardEmojiAndStickerCollectionInputView_itemInRect___block_invoke;
  v11[3] = &unk_1E16D59F8;
  v11[4] = &v12;
  objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __59__UIKeyboardEmojiAndStickerCollectionInputView_itemInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (!objc_msgSend(v9, "representedElementCategory"))
  {
    objc_msgSend(v9, "indexPath");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

- (id)currentlyFocusedSection
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSInteger v7;
  NSInteger v8;
  void *v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", self->_currentSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiAndStickerCollectionInputView trulyVisibleIndexPaths](self, "trulyVisibleIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", (unint64_t)((2* ((5 * objc_msgSend(v4, "count")) & 0x1FFFFFFFFFFFFFFFuLL)* (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64) >> 2);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "section") || objc_msgSend(v6, "item"))
    {
      v7 = -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections") - 1;
      v8 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v7);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8 - 1, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v10)
      {
        objc_msgSend(v4, "lastObject");
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v11;
      }
    }
    else
    {
      v9 = v5;
      v5 = v6;
    }

    v3 = v5;
  }

  return v3;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  self->_isDraggingInputView = 0;
  -[UIKeyboardEmojiAndStickerCollectionInputView currentlyFocusedSection](self, "currentlyFocusedSection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiAndStickerCollectionInputView trulyVisibleIndexPaths](self, "trulyVisibleIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__UIKeyboardEmojiAndStickerCollectionInputView_scrollViewDidEndDecelerating___block_invoke;
  v9[3] = &unk_1E16DB4E8;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "bs_filter:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardEmojiAndStickerCollectionInputView updateLastSeenItemForIndexPath:](self, "updateLastSeenItemForIndexPath:", v7);
}

BOOL __77__UIKeyboardEmojiAndStickerCollectionInputView_scrollViewDidEndDecelerating___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "section");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "section");
}

- (id)trulyVisibleIndexPaths
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[9];

  -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[UIView bounds](self->_collectionView, "bounds");
  v8 = v7;
  v10 = v9;
  -[UICollectionView visibleCells](self->_collectionView, "visibleCells");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__UIKeyboardEmojiAndStickerCollectionInputView_trulyVisibleIndexPaths__block_invoke;
  v15[3] = &unk_1E16DB510;
  v15[5] = v4;
  v15[6] = v6;
  v15[7] = v8;
  v15[8] = v10;
  v15[4] = self;
  objc_msgSend(v11, "bs_compactMap:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_214_1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __70__UIKeyboardEmojiAndStickerCollectionInputView_trulyVisibleIndexPaths__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CGRect v6;
  CGRect v7;

  v3 = a2;
  objc_msgSend(v3, "frame");
  v7 = CGRectIntersection(v6, *(CGRect *)(a1 + 40));
  if (CGRectIsNull(v7))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "indexPathForCell:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t __70__UIKeyboardEmojiAndStickerCollectionInputView_trulyVisibleIndexPaths__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "section");
  if (v6 == objc_msgSend(v5, "section"))
  {
    v7 = objc_msgSend(v4, "item");
    if (v7 == objc_msgSend(v5, "item"))
    {
      v8 = 0;
      goto LABEL_9;
    }
    v9 = objc_msgSend(v4, "item");
    v10 = objc_msgSend(v5, "item");
  }
  else
  {
    v9 = objc_msgSend(v4, "section");
    v10 = objc_msgSend(v5, "section");
  }
  if (v9 < v10)
    v8 = -1;
  else
    v8 = 1;
LABEL_9:

  return v8;
}

- (int64_t)indexForPrettyCategoryDisplay:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;

  v4 = a3;
  if (self->_collectionView
    && (-[UIKeyboardEmojiAndStickerCollectionInputView category](self, "category"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "categoryType"),
        v5,
        v7 = -[UIKeyboardEmojiAndStickerCollectionInputView sectionForCategoryType:](self, "sectionForCategoryType:", v6), v7 < -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections"))&& (v8 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v7), objc_msgSend(v4, "lastVisibleFirstEmojiIndex") >= v8))
  {
    v9 = v8 - 1;
  }
  else
  {
    v9 = objc_msgSend(v4, "lastVisibleFirstEmojiIndex");
  }

  return v9;
}

- (int64_t)rowsInSection:(int64_t)a3
{
  if (!-[UIKeyboardEmojiAndStickerCollectionInputView doesSupportImageGlyph](self, "doesSupportImageGlyph"))
    return 4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[STKImageGlyphDataSource numberOfRowsInSection:](self->_imageGlyphDataSource, "numberOfRowsInSection:", a3);
  if (-[UIKeyboardEmojiAndStickerCollectionInputView isEmojiCategory:](self, "isEmojiCategory:", a3))
    return 4;
  if (-[UIKeyboardEmojiAndStickerCollectionInputView isRecentCategory:](self, "isRecentCategory:", a3))
    return 4;
  return 3;
}

- (void)didMoveToWindow
{
  UIKeyboardEmojiAndStickerCollectionInputView *v2;
  void *v3;
  void *v4;
  id *p_category;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  NSIndexPath *v31;
  void *unavailableLaunchPath;
  void *v33;
  void *v34;
  objc_super v35;
  CGRect v36;

  v2 = self;
  v35.receiver = self;
  v35.super_class = (Class)UIKeyboardEmojiAndStickerCollectionInputView;
  -[UIView didMoveToWindow](&v35, sel_didMoveToWindow);
  -[UIView layoutIfNeeded](v2->_collectionView, "layoutIfNeeded");
  -[UIKeyboardEmojiKeyView emojiKeyManager](v2, "emojiKeyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastViewedCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_category = (id *)&v2->_category;
  objc_storeWeak((id *)&v2->_category, v4);

  +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  WeakRetained = objc_loadWeakRetained((id *)&v2->_category);
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(WeakRetained, "categoryType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "containsObject:", v9);

  if ((v10 & 1) == 0)
  {
    +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(p_category, v14);

  }
  v15 = objc_loadWeakRetained(p_category);
  v2->_currentSection = -[UIKeyboardEmojiAndStickerCollectionInputView sectionForCategoryType:](v2, "sectionForCategoryType:", objc_msgSend(v15, "categoryType"));

  -[UIView window](v2, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (v2->_inputDelegateCanSupportAnimoji
      && !v2->_hasShownAnimojiFirstTimeExperience
      && -[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](v2, "_shouldShowRecentlyUsedMedia"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView category](v2, "category");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[UIKeyboardEmojiAndStickerCollectionInputView sectionForCategoryType:](v2, "sectionForCategoryType:", objc_msgSend(v18, "categoryType"));

      v20 = (void *)MEMORY[0x1E0CB36B0];
      -[UIKeyboardEmojiAndStickerCollectionInputView category](v2, "category");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "indexPathForItem:inSection:", -[UIKeyboardEmojiAndStickerCollectionInputView indexForPrettyCategoryDisplay:](v2, "indexForPrettyCategoryDisplay:", v21), v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[UICollectionView layoutAttributesForItemAtIndexPath:](v2->_collectionView, "layoutAttributesForItemAtIndexPath:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    v36.origin.x = v24;
    v36.origin.y = v26;
    v36.size.width = v28;
    v36.size.height = v30;
    if (CGRectEqualToRect(v36, *MEMORY[0x1E0C9D648]))
    {
      v31 = v17;
      unavailableLaunchPath = v2->_unavailableLaunchPath;
      v2->_unavailableLaunchPath = v31;
    }
    else
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView updateToIndexPath:](v2, "updateToIndexPath:", v17);
      -[UIKeyboardEmojiKeyView emojiKeyManager](v2, "emojiKeyManager");
      unavailableLaunchPath = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(unavailableLaunchPath, "reloadCategoryForIndexPath:withSender:", v17, v2);
    }

  }
  -[UIView window](v2, "window");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
    v2 = 0;
  +[UIKeyboardMediaController sharedKeyboardMediaController](UIKeyboardMediaController, "sharedKeyboardMediaController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setDelegate:", v2);

}

- (void)updateToCategory:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t isDraggingInputView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double MinY;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MinX;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  id v49;
  id v50;

  -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateActiveKey");

  -[UIKeyboardEmojiAndStickerCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
  -[UIKeyboardEmojiAndStickerCollectionInputView category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "categoryType");

  if (v7 == a3)
  {
    if (!a3)
    {
      -[UIKeyboardEmojiAndStickerCollectionInputView category](self, "category");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "lastVisibleFirstEmojiIndex") == 1)
      {
        isDraggingInputView = self->_isDraggingInputView;

LABEL_11:
        -[UIKeyboardEmojiAndStickerCollectionInputView category](self, "category");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setLastVisibleFirstEmojiIndex:", isDraggingInputView);

        -[UIKeyboardEmojiAndStickerCollectionInputView category](self, "category");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }

    }
    isDraggingInputView = 1;
    goto LABEL_11;
  }
  +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", a3);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setLastVisibleFirstEmojiIndex:", objc_msgSend(v10, "lastVisibleFirstEmojiIndexforCategory:", v49));

  if (!a3 && !objc_msgSend(v49, "lastVisibleFirstEmojiIndex"))
    objc_msgSend(v49, "setLastVisibleFirstEmojiIndex:", 1);
  -[UIKeyboardEmojiAndStickerCollectionInputView setCategory:](self, "setCategory:", v49);
  -[UIKeyboardEmojiAndStickerCollectionInputView category](self, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isDraggingInputView = -[UIKeyboardEmojiAndStickerCollectionInputView indexForPrettyCategoryDisplay:](self, "indexForPrettyCategoryDisplay:", v11);

  v12 = v49;
LABEL_12:
  v50 = v12;
  v14 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", objc_msgSend(v12, "categoryType"));
  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", isDraggingInputView, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView layoutAttributesForItemAtIndexPath:](collectionView, "layoutAttributesForItemAtIndexPath:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = -[UIKeyboardEmojiAndStickerCollectionInputView hasVerticalScrolling](self, "hasVerticalScrolling");
  v27 = v19;
  v28 = v21;
  v29 = v23;
  v30 = v25;
  if (v26)
  {
    MinY = CGRectGetMinY(*(CGRect *)&v27);
    -[UIKeyboardEmojiAndStickerCollectionInputView categoryHeaderHeight](self, "categoryHeaderHeight");
    v33 = MinY - v32;
    -[UIKeyboardEmojiAndStickerCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sectionOffset");
    v36 = v33 - v35;

    -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
    v38 = v37;
  }
  else
  {
    MinX = CGRectGetMinX(*(CGRect *)&v27);
    -[UIKeyboardEmojiAndStickerCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "inputViewLeftMostPadding");
    v42 = MinX - v41;

    -[UIKeyboardEmojiAndStickerCollectionInputView snappedXOffsetForOffset:scrubbing:](self, "snappedXOffsetForOffset:scrubbing:", 0, v42);
    v38 = v43;
    -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
    v36 = v44;
  }
  -[UIView bounds](self->_collectionView, "bounds");
  v46 = v45;
  -[UIView bounds](self->_collectionView, "bounds");
  -[UIScrollView scrollRectToVisible:animated:](self->_collectionView, "scrollRectToVisible:animated:", 0, v38, v36, v46);
  -[UIKeyboardEmojiAndStickerCollectionInputView category](self, "category");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setLastViewedCategory:", v47);

}

- (void)updateToIndexPath:(id)a3
{
  UIUserInterfaceLayoutDirection v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v5 = -[UIKeyboardEmojiAndStickerCollectionInputView isEmojiCategory:](self, "isEmojiCategory:", objc_msgSend(v8, "section"))|| -[UIKeyboardEmojiAndStickerCollectionInputView isRecentCategory:](self, "isRecentCategory:", objc_msgSend(v8, "section"));
  if (v5 == (v4 == UIUserInterfaceLayoutDirectionRightToLeft))
    v6 = 32;
  else
    v6 = 8;
  if (-[UIKeyboardEmojiAndStickerCollectionInputView hasVerticalScrolling](self, "hasVerticalScrolling"))
    v7 = 1;
  else
    v7 = v6;
  -[UIKeyboardEmojiAndStickerCollectionInputView targetRectForIndexPath:atScrollPosition:](self, "targetRectForIndexPath:atScrollPosition:", v8, v7);
  -[UIScrollView scrollRectToVisible:animated:](self->_collectionView, "scrollRectToVisible:animated:", 0);
  self->_currentSection = objc_msgSend(v8, "section");
  -[UIKeyboardEmojiAndStickerCollectionInputView updateLastSeenItemForIndexPath:](self, "updateLastSeenItemForIndexPath:", v8);

}

- (CGRect)targetRectForIndexPath:(id)a3 atScrollPosition:(unint64_t)a4
{
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double MinY;
  void *v29;
  double v30;
  double v31;
  double MaxX;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double MinX;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGRect v48;
  CGRect result;

  v6 = a3;
  -[UICollectionView layoutAttributesForItemAtIndexPath:](self->_collectionView, "layoutAttributesForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v48.origin.x = v9;
  v48.origin.y = v11;
  v48.size.width = v13;
  v48.size.height = v15;
  if (CGRectEqualToRect(v48, *MEMORY[0x1E0C9D648]))
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView targetRectForSectionIndex:](self, "targetRectForSectionIndex:", objc_msgSend(v6, "section"));
    v18 = v17;
    v20 = v19;
    v22 = v21;
  }
  else
  {
    v23 = -[UIKeyboardEmojiAndStickerCollectionInputView hasVerticalScrolling](self, "hasVerticalScrolling");
    v24 = v9;
    v25 = v11;
    v26 = v13;
    v27 = v15;
    if (v23)
    {
      MinY = CGRectGetMinY(*(CGRect *)&v24);
      -[UIKeyboardEmojiAndStickerCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "sectionOffset");
      v20 = MinY - v30;

      -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
      v18 = v31;
    }
    else
    {
      if (a4 == 32)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v24);
        -[UIKeyboardEmojiAndStickerCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "inputViewRightMostPadding");
        v35 = MaxX + v34;
        -[UIView bounds](self->_collectionView, "bounds");
        v37 = v35 - v36;
      }
      else
      {
        MinX = CGRectGetMinX(*(CGRect *)&v24);
        -[UIKeyboardEmojiAndStickerCollectionView emojiGraphicsTraits](self->_collectionView, "emojiGraphicsTraits");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "inputViewLeftMostPadding");
        v37 = MinX - v39;
      }

      -[UIKeyboardEmojiAndStickerCollectionInputView snappedXOffsetForOffset:scrubbing:](self, "snappedXOffsetForOffset:scrubbing:", 0, v37);
      v18 = v40;
      -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
      v20 = v41;
    }
    -[UIView bounds](self->_collectionView, "bounds");
    v22 = v42;
    -[UIView bounds](self->_collectionView, "bounds");
  }
  v43 = v16;

  v44 = v18;
  v45 = v20;
  v46 = v22;
  v47 = v43;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (CGRect)targetRectForSectionIndex:(int64_t)a3
{
  void *v4;
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
  double v15;
  double v16;
  CGRect result;

  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "targetRectForSectionIndex:", a3);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)updateOffsetForSearchResultsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  id v9;

  v3 = a3;
  -[UIKeyboardEmojiAndStickerCollectionInputView hitTestResponder](self, "hitTestResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateActiveKey");

  -[UIKeyboardEmojiAndStickerCollectionInputView resetSelectionIfNeeded](self, "resetSelectionIfNeeded");
  if (-[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == UIUserInterfaceLayoutDirectionRightToLeft)
    v6 = 32;
  else
    v6 = 8;
  v7 = v6 | -[UIKeyboardEmojiAndStickerCollectionInputView hasVerticalScrolling](self, "hasVerticalScrolling");
  collectionView = self->_collectionView;
  -[UIKeyboardEmojiAndStickerCollectionInputView recentsIndexPath](self, "recentsIndexPath");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v9, v7, v3);

}

- (double)pointInScrollingDirection:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[UIKeyboardEmojiAndStickerCollectionInputView hasVerticalScrolling](self, "hasVerticalScrolling"))
    return y;
  else
    return x;
}

- (double)distanceInScrollingDirection:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if (-[UIKeyboardEmojiAndStickerCollectionInputView hasVerticalScrolling](self, "hasVerticalScrolling"))
    return height;
  else
    return width;
}

- (double)scrollingStartPoint
{
  double result;

  if (-[UIKeyboardEmojiAndStickerCollectionInputView hasVerticalScrolling](self, "hasVerticalScrolling"))
    return 0.0;
  -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->_emojiGraphicsTraits, "inputViewLeftMostPadding");
  return result;
}

- (double)scrollingEndPoint
{
  _BOOL4 v3;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  double result;

  v3 = -[UIKeyboardEmojiAndStickerCollectionInputView hasVerticalScrolling](self, "hasVerticalScrolling");
  emojiGraphicsTraits = self->_emojiGraphicsTraits;
  if (v3)
    -[UIKeyboardEmojiGraphicsTraits bottomPadding](emojiGraphicsTraits, "bottomPadding");
  else
    -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](emojiGraphicsTraits, "inputViewRightMostPadding");
  return result;
}

- (int64_t)updateToCategoryWithOffsetPercentage:(double)a3
{
  double Height;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  UIKeyboardEmojiAndStickerCollectionView *collectionView;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  CGRect v34;

  -[UIView bounds](self->_collectionView, "bounds");
  Height = CGRectGetHeight(v34);
  -[UIKeyboardEmojiAndStickerCollectionInputView categoryHeaderHeight](self, "categoryHeaderHeight");
  v7 = v6;
  v8 = 0.0;
  v9 = 0.0;
  if (-[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia"))
  {
    if (self->_useWideAnimojiCell)
      v9 = Height - v7 + Height - v7;
    else
      v9 = Height - v7;
  }
  if (-[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia"))
  {
    -[UIKeyboardEmojiGraphicsTraits sectionOffset](self->_emojiGraphicsTraits, "sectionOffset");
    v8 = v9 + v10 - self->_frameInset;
  }
  -[UIScrollView contentSize](self->_collectionView, "contentSize");
  -[UIKeyboardEmojiAndStickerCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:");
  v12 = v11 - v8;
  -[UIView bounds](self->_collectionView, "bounds");
  -[UIKeyboardEmojiAndStickerCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:", v13, v14);
  v16 = v15 * 0.5 * round(ceil(v12 / (v15 * 0.5)) * a3);
  -[UIKeyboardEmojiAndStickerCollectionInputView emojiKeyWidth](self, "emojiKeyWidth");
  v18 = v17;
  -[UIKeyboardEmojiGraphicsTraits columnOffset](self->_emojiGraphicsTraits, "columnOffset");
  -[UIKeyboardEmojiAndStickerCollectionInputView snappedXOffsetForOffset:scrubbing:](self, "snappedXOffsetForOffset:scrubbing:", 1, (v18 + v19 + v19) * round(v16 / (v18 + v19 + v19)));
  v21 = v8 + v20;
  v22 = -[UIKeyboardEmojiAndStickerCollectionInputView hasVerticalScrolling](self, "hasVerticalScrolling");
  -[UIScrollView contentOffset](self->_collectionView, "contentOffset");
  if (v22)
    v25 = v23;
  else
    v25 = v21;
  if (!v22)
    v21 = v24;
  collectionView = self->_collectionView;
  -[UIView bounds](collectionView, "bounds");
  v28 = v27;
  -[UIView bounds](self->_collectionView, "bounds");
  -[UIScrollView scrollRectToVisible:animated:](collectionView, "scrollRectToVisible:animated:", 0, v25, v21, v28);
  -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sortedArrayUsingSelector:", sel_compare_);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v30, "objectAtIndex:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", objc_msgSend(v31, "section"));

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (UIKeyboardEmojiCategory)category
{
  return (UIKeyboardEmojiCategory *)objc_loadWeakRetained((id *)&self->_category);
}

- (void)setCategory:(id)a3
{
  objc_storeWeak((id *)&self->_category, a3);
}

- (BOOL)isDraggingInputView
{
  return self->_isDraggingInputView;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 760);
}

- (UIKBEmojiHitTestResponder)hitTestResponder
{
  return (UIKBEmojiHitTestResponder *)objc_loadWeakRetained((id *)&self->_hitTestResponder);
}

- (NSIndexPath)tappedSkinToneEmoji
{
  return (NSIndexPath *)objc_loadWeakRetained((id *)&self->_tappedSkinToneEmoji);
}

- (void)setTappedSkinToneEmoji:(id)a3
{
  objc_storeWeak((id *)&self->_tappedSkinToneEmoji, a3);
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (TUIEmojiSearchInputViewController)emojiSearchInputViewController
{
  return self->_emojiSearchInputViewController;
}

- (void)setEmojiSearchInputViewController:(id)a3
{
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, a3);
}

- (TUIEmojiSearchTextField)emojiSearchField
{
  return self->_emojiSearchField;
}

- (void)setEmojiSearchField:(id)a3
{
  objc_storeStrong((id *)&self->_emojiSearchField, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (NSIndexPath)unavailableLaunchPath
{
  return self->_unavailableLaunchPath;
}

- (void)setUnavailableLaunchPath:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableLaunchPath, a3);
}

- (BOOL)isSearching
{
  return self->_isSearching;
}

- (void)setIsSearching:(BOOL)a3
{
  self->_isSearching = a3;
}

- (STKImageGlyphDataSource)imageGlyphDataSource
{
  return self->_imageGlyphDataSource;
}

- (void)setImageGlyphDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_imageGlyphDataSource, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_imageGlyphDataSource, 0);
  objc_storeStrong((id *)&self->_unavailableLaunchPath, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_emojiSearchField, 0);
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_destroyWeak((id *)&self->_tappedSkinToneEmoji);
  objc_destroyWeak((id *)&self->_hitTestResponder);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak((id *)&self->_category);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_selectedPopupKey, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_emojiGraphicsTraits, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
