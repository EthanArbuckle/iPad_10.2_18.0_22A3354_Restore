@implementation UIKeyboardEmojiCollectionView

- (UIKeyboardEmojiCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4 emojiGraphicsTraits:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  _BYTE *v12;
  UIKeyboardEmojiCollectionView *v13;
  UIKeyboardEmojiCollectionView *v14;
  NSMutableArray *v15;
  NSMutableArray *gestureRecognizersToEnable;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UIKeyboardEmojiCollectionView;
  v13 = -[UICollectionView initWithFrame:collectionViewLayout:](&v19, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_emojiGraphicsTraits, a5);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    gestureRecognizersToEnable = v14->_gestureRecognizersToEnable;
    v14->_gestureRecognizersToEnable = v15;

    if (v12 && v12[8])
      -[UIScrollView _setAutomaticContentOffsetAdjustmentEnabled:](v14, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v14, sel_willCancelVariants_, CFSTR("UIKeyboardWillCancelEmojiVariants"), 0);

  }
  return v14;
}

- (void)layoutSubviews
{
  void *v3;
  _QWORD v4[5];

  -[UICollectionView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __47__UIKeyboardEmojiCollectionView_layoutSubviews__block_invoke;
    v4[3] = &unk_1E16B1B28;
    v4[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
  }
}

id __47__UIKeyboardEmojiCollectionView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)UIKeyboardEmojiCollectionView;
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

- (id)backgroundColor
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (id)closestCellForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
  void *v36;
  BOOL v37;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  y = a3.y;
  x = a3.x;
  -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[UIKeyboardEmojiGraphicsTraits emojiKeyWidth](self->_emojiGraphicsTraits, "emojiKeyWidth");
    v9 = v8 * 0.5;
    v10 = y - v8 * 0.5;
    -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x, y + v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "frame");
      v16 = vabdd_f64(CGRectGetMaxY(v39), y);
      objc_msgSend(v15, "frame");
      v17 = v16 < vabdd_f64(CGRectGetMinY(v40), y);
    }
    else
    {
      -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x - v9, y);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x - v9, v10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x - v9, y + v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x + v9, v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x + v9, y + v9);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "frame");
        v31 = vabdd_f64(CGRectGetMaxY(v43), y);
        objc_msgSend(v26, "frame");
        v32 = vabdd_f64(CGRectGetMinY(v44), y);
        objc_msgSend(v13, "frame");
        v33 = vabdd_f64(CGRectGetMaxX(v45), x);
        objc_msgSend(v28, "frame");
        v34 = vabdd_f64(CGRectGetMinX(v46), x);
        v35 = v33 < v34 && v31 < v32;
        v36 = v13;
        if (!v35)
        {
          v37 = v33 >= v34 || v31 < v32;
          v36 = v26;
          if (v37)
          {
            if (v31 >= v32 || v33 < v34)
              v36 = v30;
            else
              v36 = v28;
          }
        }
        v7 = v36;

        goto LABEL_11;
      }
      -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x - v9, y);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UICollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:", x + v9, y);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "frame");
      v21 = vabdd_f64(CGRectGetMaxX(v41), x);
      objc_msgSend(v15, "frame");
      v17 = v21 < vabdd_f64(CGRectGetMinX(v42), x);
    }
    if (v17)
      v22 = v13;
    else
      v22 = v15;
    v7 = v22;

LABEL_11:
    goto LABEL_12;
  }
  -[UICollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v7;
}

- (void)disableConflictingGestureRecognizers
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIView superview](self, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(v4, "gestureRecognizers", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend(v10, "isEnabled"))
              {
                -[NSMutableArray addObject:](self->_gestureRecognizersToEnable, "addObject:", v10);
                objc_msgSend(v10, "setEnabled:", 0);
              }
            }
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

      objc_msgSend(v4, "superview");
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
    }
    while (v11);
  }
}

- (void)enableConflictingGestureRecognizers
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_gestureRecognizersToEnable;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setEnabled:", 1, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_gestureRecognizersToEnable, "removeAllObjects");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  v30 = a3;
  v6 = a4;
  if (-[UIKeyboardEmojiCollectionView isInSearchPopover](self, "isInSearchPopover"))
  {
    objc_msgSend(v30, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", self);
    -[UIKeyboardEmojiCollectionView closestCellForPoint:](self, "closestCellForPoint:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "emoji");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "clearForwardingInputDelegateAndResign:", 0);

      }
    }

  }
  if (-[UIScrollView isDragging](self, "isDragging")
    || (-[UIScrollView contentOffset](self, "contentOffset"), v11 < 0.0))
  {
    v12 = 0;
  }
  else
  {
    -[UIScrollView contentOffset](self, "contentOffset");
    v14 = v13;
    -[UIView bounds](self, "bounds");
    v16 = v14 + v15;
    -[UIScrollView contentSize](self, "contentSize");
    v12 = v16 <= v17;
  }
  if (_AXSVoiceOverTouchEnabled())
  {
    -[UICollectionView collectionViewLayout](self, "collectionViewLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "scrollDirection");

    if (v19
      || -[UIScrollView isDragging](self, "isDragging")
      || (-[UIScrollView contentOffset](self, "contentOffset"), v20 < 0.0))
    {
      v21 = 0;
    }
    else
    {
      -[UIScrollView contentOffset](self, "contentOffset");
      v26 = v25;
      -[UIView bounds](self, "bounds");
      v28 = v26 + v27;
      -[UIScrollView contentSize](self, "contentSize");
      v21 = v28 <= v29;
    }
    if (v19 != 1)
      v12 = 0;
    if (v21)
      goto LABEL_19;
  }
  if (v12)
  {
LABEL_19:
    -[UICollectionView setScrollEnabled:](self, "setScrollEnabled:", 0);
    -[UIKeyboardEmojiCollectionView disableConflictingGestureRecognizers](self, "disableConflictingGestureRecognizers");
    -[UICollectionView indexPathsForSelectedItems](self, "indexPathsForSelectedItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView deselectItemAtIndexPath:animated:](self, "deselectItemAtIndexPath:animated:", v23, 0);

    -[UIKeyboardEmojiCollectionView hitTestResponder](self, "hitTestResponder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "touchesBegan:withEvent:", v30, v6);

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!-[UIScrollView isDragging](self, "isDragging"))
  {
    -[UIKeyboardEmojiCollectionView hitTestResponder](self, "hitTestResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "touchesMoved:withEvent:", v8, v6);

    self->_touchDidMove = 1;
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!-[UIScrollView isDragging](self, "isDragging"))
  {
    -[UIKeyboardEmojiCollectionView hitTestResponder](self, "hitTestResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "touchesEnded:withEvent:", v8, v6);

  }
  -[UICollectionView setScrollEnabled:](self, "setScrollEnabled:", 1);
  -[UIKeyboardEmojiCollectionView enableConflictingGestureRecognizers](self, "enableConflictingGestureRecognizers");

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!-[UIScrollView isDragging](self, "isDragging"))
  {
    -[UIKeyboardEmojiCollectionView hitTestResponder](self, "hitTestResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "touchesCancelled:withEvent:", v8, v6);

  }
  -[UICollectionView setScrollEnabled:](self, "setScrollEnabled:", 1);
  -[UIKeyboardEmojiCollectionView enableConflictingGestureRecognizers](self, "enableConflictingGestureRecognizers");

}

- (void)willCancelVariants:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double MidX;
  double MidY;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;

  v18 = a3;
  -[UIView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v18, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("touch"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "frame");
    MidX = CGRectGetMidX(v19);
    objc_msgSend(v6, "frame");
    MidY = CGRectGetMidY(v20);
    -[UIView superview](self, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v11, MidX, MidY);
    v13 = v12;
    v15 = v14;

    -[UIKeyboardEmojiCollectionView closestCellForPoint:](self, "closestCellForPoint:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "emojiLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "willCancelVariantsWithTouch:", v8);

  }
}

- (UIKeyboardEmojiGraphicsTraits)emojiGraphicsTraits
{
  return (UIKeyboardEmojiGraphicsTraits *)objc_getProperty(self, a2, 3280, 1);
}

- (UIResponder)hitTestResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_hitTestResponder);
}

- (void)setHitTestResponder:(id)a3
{
  objc_storeWeak((id *)&self->_hitTestResponder, a3);
}

- (BOOL)isInSearchPopover
{
  return self->_isInSearchPopover;
}

- (void)setIsInSearchPopover:(BOOL)a3
{
  self->_isInSearchPopover = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hitTestResponder);
  objc_storeStrong((id *)&self->_gestureRecognizersToEnable, 0);
  objc_storeStrong((id *)&self->_lastTouchedEmojiCell, 0);
  objc_storeStrong((id *)&self->_emojiGraphicsTraits, 0);
}

@end
