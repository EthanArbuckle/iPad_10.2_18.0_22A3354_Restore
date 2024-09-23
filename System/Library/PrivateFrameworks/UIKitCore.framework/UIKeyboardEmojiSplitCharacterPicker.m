@implementation UIKeyboardEmojiSplitCharacterPicker

+ (BOOL)wantsScreenTraits
{
  return 0;
}

- (UIKeyboardEmojiSplitCharacterPicker)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  UIKeyboardEmojiSplitCharacterPicker *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id WeakRetained;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  UICollectionViewFlowLayout *v31;
  UICollectionViewFlowLayout *flowLayout;
  UICollectionViewFlowLayout *v33;
  double v34;
  double v35;
  double v36;
  UIKeyboardEmojiCollectionView *v37;
  uint64_t v38;
  UIKeyboardEmojiCollectionView *collectionView;
  UIKeyboardEmojiCollectionView *v40;
  void *v41;
  objc_super v43;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v43.receiver = self;
  v43.super_class = (Class)UIKeyboardEmojiSplitCharacterPicker;
  v13 = -[UIView initWithFrame:](&v43, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v14, objc_msgSend(v15, "interfaceOrientation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardEmojiGraphicsTraits emojiGraphicsTraitsWithScreenTraits:](UIKeyboardEmojiGraphicsTraits, "emojiGraphicsTraitsWithScreenTraits:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    emojiGraphicsTraits = v13->super._emojiGraphicsTraits;
    v13->super._emojiGraphicsTraits = (UIKeyboardEmojiGraphicsTraits *)v17;

    +[UIColor clearColor](UIColor, "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13, "setBackgroundColor:", v19);

    -[UIView setOpaque:](v13, "setOpaque:", 0);
    -[UIKBKeyView updateForKeyplane:key:](v13, "updateForKeyplane:key:", v11, v12);
    v13->super._isDraggingInputView = 0;
    -[UIKeyboardEmojiKeyView emojiKeyManager](v13, "emojiKeyManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastViewedCategory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v13->_category, v21);

    +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB37E8];
    WeakRetained = objc_loadWeakRetained((id *)&v13->_category);
    objc_msgSend(v23, "numberWithInteger:", objc_msgSend(WeakRetained, "categoryType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v22, "containsObject:", v25);

    if ((v26 & 1) == 0)
    {
      +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "integerValue");

      +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v13->_category, v30);

    }
    v31 = objc_alloc_init(UICollectionViewFlowLayout);
    flowLayout = v13->super._flowLayout;
    v13->super._flowLayout = v31;

    -[UICollectionViewFlowLayout setScrollDirection:](v13->super._flowLayout, "setScrollDirection:", 0);
    v33 = v13->super._flowLayout;
    -[UIKeyboardEmojiGraphicsTraits emojiKeyWidth](v13->super._emojiGraphicsTraits, "emojiKeyWidth");
    v35 = v34;
    -[UIKeyboardEmojiGraphicsTraits emojiKeyWidth](v13->super._emojiGraphicsTraits, "emojiKeyWidth");
    -[UICollectionViewFlowLayout setItemSize:](v33, "setItemSize:", v35, v36);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v13->super._flowLayout, "setMinimumInteritemSpacing:", 0.0);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v13->super._flowLayout, "setMinimumLineSpacing:", 0.0);
    v37 = [UIKeyboardEmojiCollectionView alloc];
    -[UIView bounds](v13, "bounds");
    v38 = -[UIKeyboardEmojiCollectionView initWithFrame:collectionViewLayout:emojiGraphicsTraits:](v37, "initWithFrame:collectionViewLayout:emojiGraphicsTraits:", v13->super._flowLayout, v13->super._emojiGraphicsTraits);
    collectionView = v13->super._collectionView;
    v13->super._collectionView = (UIKeyboardEmojiCollectionView *)v38;

    v40 = v13->super._collectionView;
    +[UIColor clearColor](UIColor, "clearColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v40, "setBackgroundColor:", v41);

    -[UIView setAutoresizingMask:](v13->super._collectionView, "setAutoresizingMask:", 18);
    -[UICollectionView setDelegate:](v13->super._collectionView, "setDelegate:", v13);
    -[UICollectionView setDataSource:](v13->super._collectionView, "setDataSource:", v13);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v13->super._collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v13->super._collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v13->super._collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("UICollectionElementKindSectionHeader"), CFSTR("kEmojiCategoryTitleIdentifier"));
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v13->super._collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kEmojiCellIdentifier"));
    -[UIView addSubview:](v13, "addSubview:", v13->super._collectionView);

  }
  return v13;
}

- (void)dealloc
{
  objc_super v2;

  self->super._isDraggingInputView = 0;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardEmojiSplitCharacterPicker;
  -[UIKeyboardEmojiCollectionInputView dealloc](&v2, sel_dealloc);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSInteger v12;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v7 = -[UICollectionView numberOfItemsInSection:](self->super._collectionView, "numberOfItemsInSection:", 0, a4);
  if ((a5 || v7 <= 0) && (a5 != 1 || v7))
  {
    v12 = -[UICollectionView numberOfSections](self->super._collectionView, "numberOfSections") - 1;
    emojiGraphicsTraits = self->super._emojiGraphicsTraits;
    if (v12 == a5)
      -[UIKeyboardEmojiGraphicsTraits inputViewRightMostPadding](emojiGraphicsTraits, "inputViewRightMostPadding");
    else
      -[UIKeyboardEmojiGraphicsTraits sectionOffset](emojiGraphicsTraits, "sectionOffset");
    v11 = v14;
    v9 = 0.0;
  }
  else
  {
    -[UIKeyboardEmojiGraphicsTraits inputViewLeftMostPadding](self->super._emojiGraphicsTraits, "inputViewLeftMostPadding");
    v9 = v8;
    -[UIKeyboardEmojiGraphicsTraits sectionOffset](self->super._emojiGraphicsTraits, "sectionOffset");
    v11 = v10;
  }
  v15 = 8.0;
  v16 = 8.0;
  v17 = v9;
  result.right = v16;
  result.bottom = v11;
  result.left = v15;
  result.top = v17;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 12.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 6.0;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat v6;

  self->super._isDraggingInputView = 1;
  -[UIKeyboardEmojiSplitCharacterPicker snappedYOffsetForOffset:](self, "snappedYOffsetForOffset:", a3, a5->y, a4.y);
  a5->y = v6;
}

- (double)snappedYOffsetForOffset:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  UIKeyboardEmojiCollectionView *collectionView;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  -[UIScrollView contentSize](self->super._collectionView, "contentSize");
  v6 = v5;
  -[UIView bounds](self->super._collectionView, "bounds");
  v8 = v6 - v7;
  -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->super._collectionView, "emojiGraphicsTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputViewRightMostPadding");
  v11 = v8 - v10;

  collectionView = self->super._collectionView;
  if (v11 >= a3)
  {
    -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](collectionView, "emojiGraphicsTraits");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "inputViewLeftMostPadding");
    v22 = v21;

    if (v22 <= a3)
    {
      v40 = 0;
      v41 = &v40;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__128;
      v44 = __Block_byref_object_dispose__128;
      v45 = 0;
      -[UIView bounds](self->super._collectionView, "bounds");
      v25 = v24;
      -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->super._collectionView, "emojiGraphicsTraits");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "emojiKeyWidth");
      v28 = v27;
      -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->super._collectionView, "emojiGraphicsTraits");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "columnOffset");
      v31 = v30;

      -[UICollectionView collectionViewLayout](self->super._collectionView, "collectionViewLayout");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "layoutAttributesForElementsInRect:", 0.0, a3, v25, v28 + v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __63__UIKeyboardEmojiSplitCharacterPicker_snappedYOffsetForOffset___block_invoke;
      v39[3] = &unk_1E16D59F8;
      v39[4] = &v40;
      objc_msgSend(v33, "enumerateObjectsWithOptions:usingBlock:", 2, v39);

      -[UICollectionView layoutAttributesForItemAtIndexPath:](self->super._collectionView, "layoutAttributesForItemAtIndexPath:", v41[5]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "frame");
      v36 = v35;
      -[UIKeyboardEmojiGraphicsTraits columnOffset](self->super._emojiGraphicsTraits, "columnOffset");
      v19 = v36 - v37;

      _Block_object_dispose(&v40, 8);
      return v19;
    }
    -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->super._collectionView, "emojiGraphicsTraits");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputViewLeftMostPadding");
    v19 = -v23;
  }
  else
  {
    -[UIScrollView contentSize](collectionView, "contentSize");
    v14 = v13;
    -[UIView bounds](self->super._collectionView, "bounds");
    v16 = v14 - v15;
    -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->super._collectionView, "emojiGraphicsTraits");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputViewRightMostPadding");
    v19 = v16 + v18;
  }

  return v19;
}

void __63__UIKeyboardEmojiSplitCharacterPicker_snappedYOffsetForOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

- (void)didMoveToWindow
{
  id WeakRetained;
  unint64_t v4;
  UIKeyboardEmojiCollectionView *collectionView;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  UIKeyboardEmojiCollectionView *v18;
  double MinY;
  void *v20;
  double v21;
  objc_super v22;
  CGRect v23;

  v22.receiver = self;
  v22.super_class = (Class)UIKeyboardEmojiSplitCharacterPicker;
  -[UIKeyboardEmojiCollectionInputView didMoveToWindow](&v22, sel_didMoveToWindow);
  WeakRetained = objc_loadWeakRetained((id *)&self->_category);
  v4 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", objc_msgSend(WeakRetained, "categoryType"));

  collectionView = self->super._collectionView;
  v6 = (void *)MEMORY[0x1E0CB36B0];
  v7 = objc_loadWeakRetained((id *)&self->_category);
  objc_msgSend(v6, "indexPathForItem:inSection:", -[UIKeyboardEmojiCollectionInputView indexForPrettyCategoryDisplay:](self, "indexForPrettyCategoryDisplay:", v7), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView layoutAttributesForItemAtIndexPath:](collectionView, "layoutAttributesForItemAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = self->super._collectionView;
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  MinY = CGRectGetMinY(v23);
  -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->super._collectionView, "emojiGraphicsTraits");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "inputViewLeftMostPadding");
  -[UICollectionView setContentOffset:animated:](v18, "setContentOffset:animated:", 0, 0.0, MinY - v21);

  -[UIView layoutIfNeeded](self->super._collectionView, "layoutIfNeeded");
}

- (void)updateToCategory:(int64_t)a3
{
  void *v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  int64_t v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  UIKeyboardEmojiCollectionView *collectionView;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  UIKeyboardEmojiCollectionView *v25;
  double v26;
  double v27;
  double MinY;
  void *v29;
  double v30;
  void *v31;
  id obj;
  CGRect v33;

  -[UIKeyboardEmojiCollectionInputView hitTestResponder](self, "hitTestResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateActiveKey");

  if (-[UICollectionView numberOfItemsInSection:](self->super._collectionView, "numberOfItemsInSection:", +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", a3)) >= 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_category);
    v7 = objc_msgSend(WeakRetained, "categoryType");

    if (v7 == a3)
    {
      v8 = objc_loadWeakRetained((id *)&self->_category);
      objc_msgSend(v8, "setLastVisibleFirstEmojiIndex:", 0);

      obj = objc_loadWeakRetained((id *)&self->_category);
      v9 = 0;
    }
    else
    {
      +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", a3);
      obj = (id)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "setLastVisibleFirstEmojiIndex:", objc_msgSend(v10, "lastVisibleFirstEmojiIndexforCategory:", obj));

      v11 = objc_storeWeak((id *)&self->_category, obj);
      v9 = -[UIKeyboardEmojiCollectionInputView indexForPrettyCategoryDisplay:](self, "indexForPrettyCategoryDisplay:", obj);

    }
    v12 = objc_loadWeakRetained((id *)&self->_category);
    v13 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", objc_msgSend(v12, "categoryType"));

    collectionView = self->super._collectionView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView layoutAttributesForItemAtIndexPath:](collectionView, "layoutAttributesForItemAtIndexPath:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v25 = self->super._collectionView;
    -[UIScrollView contentOffset](v25, "contentOffset");
    v27 = v26;
    v33.origin.x = v18;
    v33.origin.y = v20;
    v33.size.width = v22;
    v33.size.height = v24;
    MinY = CGRectGetMinY(v33);
    -[UIKeyboardEmojiCollectionView emojiGraphicsTraits](self->super._collectionView, "emojiGraphicsTraits");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "inputViewLeftMostPadding");
    -[UICollectionView setContentOffset:animated:](v25, "setContentOffset:animated:", 0, v27, MinY - v30);

    -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setLastViewedCategory:", obj);

  }
}

- (id)category
{
  return objc_loadWeakRetained((id *)&self->_category);
}

- (void)setCategory:(id)a3
{
  objc_storeWeak((id *)&self->_category, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_category);
}

@end
