@implementation UITextView(IC)

- (BOOL)ic_shouldEnableBlockQuoteForAttachmentsOnlySelection
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _BOOL8 v19;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  objc_msgSend(a1, "textStorage");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0;
  v3 = (void *)v2;
  objc_msgSend(a1, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {

    return 0;
  }
  objc_msgSend(a1, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "selectedRange");
  v9 = objc_msgSend(v6, "ic_rangeIsValid:", v7, v8);

  if (!v9)
    return 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_msgSend(a1, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "selectedRange");
  v14 = objc_msgSend(v11, "paragraphRangeForRange:", v12, v13);
  v16 = v15;

  objc_msgSend(a1, "textStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0DC10F8];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70__UITextView_IC__ic_shouldEnableBlockQuoteForAttachmentsOnlySelection__block_invoke;
  v21[3] = &unk_1E5C24488;
  v21[6] = &v22;
  v21[4] = a1;
  v21[5] = &v26;
  objc_msgSend(v17, "enumerateAttribute:inRange:options:usingBlock:", v18, v14, v16, 0, v21);

  if (*((_BYTE *)v27 + 24))
    v19 = *((_BYTE *)v23 + 24) == 0;
  else
    v19 = 0;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return v19;
}

- (id)ic_selectedRanges
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3B18];
  v2 = objc_msgSend(a1, "selectedRange");
  objc_msgSend(v1, "valueWithRange:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ic_pkTiledView
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "subviews");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)ic_scrollRangeToVisible:()IC consideringInsets:animated:
{
  double v11;
  double v12;
  id v13;

  objc_msgSend(a1, "contentSize");
  if (v12 <= 0.0 || v11 <= 0.0)
    objc_msgSend(a1, "layoutIfNeeded");
  objc_msgSend(a1, "ic_textRangeFromCharacterRange:", a3, a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "firstRectForRange:", v13);
  objc_msgSend(a1, "ic_scrollRectToVisible:animated:consideringInsets:", a6, a5);

}

- (void)ic_scrollRangeToTop:()IC
{
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (a3 < v8)
    {
      objc_msgSend(a1, "ic_textRangeFromCharacterRange:", a3, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "firstRectForRange:", v9);
      v11 = v10;
      v13 = v12;

      objc_msgSend(a1, "setContentOffset:", 0.0, v11 + v13 + 1.0);
    }
  }
}

- (void)setIc_selectedRanges:()IC
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rangeValue");
    objc_msgSend(a1, "setSelectedRange:", v5, v6);

  }
}

- (uint64_t)ic_markedTextRange
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "markedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "markedTextRange");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(a1, "ic_characterRangeFromTextRange:", v3);

  }
  else
  {
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (uint64_t)ic_characterRangeFromTextRange:()IC
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(a1, "offsetFromPosition:toPosition:", v5, v6);
  objc_msgSend(a1, "offsetFromPosition:toPosition:", v6, v7);

  return v8;
}

- (id)ic_textRangeFromCharacterRange:()IC
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "beginningOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "positionFromPosition:offset:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "positionFromPosition:offset:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textRangeFromPosition:toPosition:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)ic_characterRangeFromTextPosition:()IC
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "offsetFromPosition:toPosition:", v5, v4);

  return v6;
}

- (uint64_t)ic_visibleRange
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MinY;
  double v8;
  double MaxY;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  objc_msgSend(a1, "visibleTextRect");
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  MidX = CGRectGetMidX(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MinY = CGRectGetMinY(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v8 = CGRectGetMidX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MaxY = CGRectGetMaxY(v18);
  objc_msgSend(a1, "closestPositionToPoint:", MidX, MinY);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "closestPositionToPoint:", v8, MaxY);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textRangeFromPosition:toPosition:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(a1, "ic_characterRangeFromTextRange:", v12);

  return v13;
}

- (NSUInteger)ic_rangeFromRect:()IC
{
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  void *v14;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger location;
  NSRange v22;
  NSRange v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  MinX = CGRectGetMinX(*(CGRect *)&a2);
  v24.origin.x = a2;
  v24.origin.y = a3;
  v24.size.width = a4;
  v24.size.height = a5;
  MinY = CGRectGetMinY(v24);
  v25.origin.x = a2;
  v25.origin.y = a3;
  v25.size.width = a4;
  v25.size.height = a5;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = a2;
  v26.origin.y = a3;
  v26.size.width = a4;
  v26.size.height = a5;
  MaxY = CGRectGetMaxY(v26);
  objc_msgSend(a1, "characterRangeAtPoint:", MinX, MinY);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "characterRangeAtPoint:", MaxX, MaxY);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(a1, "ic_characterRangeFromTextRange:", v14);
  v18 = v17;
  v23.location = objc_msgSend(a1, "ic_characterRangeFromTextRange:", v15);
  v23.length = v19;
  v22.location = v16;
  v22.length = v18;
  location = NSUnionRange(v22, v23).location;

  return location;
}

- (double)ic_rectForRange:()IC
{
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  const char *v30;
  __int128 v31;
  __int128 v32;

  v7 = a3 + a4;
  objc_msgSend(a1, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_range");
  v10 = v9;

  if (v7 > v10)
    return *MEMORY[0x1E0C9D648];
  if (ICInternalSettingsIsTextKit2Enabled()
    && (objc_msgSend(a1, "textLayoutManager"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    objc_msgSend(a1, "textLayoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ic_rectForRange:", a3, a4);
    v11 = v14;
  }
  else
  {
    objc_msgSend(a1, "textContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "layoutManager");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v13 && v15)
    {
      v27 = 0;
      v28 = (double *)&v27;
      v29 = 0x4010000000;
      v30 = "";
      v17 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      v31 = *MEMORY[0x1E0C9D648];
      v32 = v17;
      objc_msgSend(a1, "textStorage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __34__UITextView_IC__ic_rectForRange___block_invoke;
      v20[3] = &unk_1E5C24438;
      v25 = a3;
      v26 = a4;
      v21 = v16;
      v22 = a1;
      v24 = &v27;
      v23 = v13;
      objc_msgSend(v18, "coordinateReading:", v20);

      v11 = v28[4];
      _Block_object_dispose(&v27, 8);
    }
    else
    {
      v11 = *MEMORY[0x1E0C9D648];
    }

  }
  return v11;
}

- (id)ic_imageForRange:()IC
{
  void *v7;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  CGRect v27;

  if (ICInternalSettingsIsTextKit2Enabled()
    && (objc_msgSend(a1, "textLayoutManager"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[UITextView(IC) ic_imageForRange:]", 1, 0, CFSTR("Unavailable in TextKit 2"));
  }
  else
  {
    objc_msgSend(a1, "ic_rectForRange:", a3, a4);
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;
    if (!CGRectIsEmpty(v27))
    {
      objc_msgSend(a1, "layoutManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "convertSize:toView:", 0, width, height);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v14, v15);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __35__UITextView_IC__ic_imageForRange___block_invoke;
      v19[3] = &unk_1E5C24460;
      v20 = v13;
      v21 = a3;
      v22 = a4;
      v23 = x;
      v24 = y;
      v25 = width;
      v26 = height;
      v17 = v13;
      objc_msgSend(v16, "imageWithActions:", v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      return v12;
    }
  }
  v12 = 0;
  return v12;
}

- (id)ic_pkSelectionInteraction
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ic_pkTiledView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "selectionInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)ic_textContainerOrigin
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "textContainer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "textContainerOrigin");
  v3 = v2;

  return v3;
}

- (id)containerViewForAttachments
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!containerViewForAttachments_UITextContainerViewClass)
    containerViewForAttachments_UITextContainerViewClass = (uint64_t)NSClassFromString(CFSTR("_UITextContainerView"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v1, "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;

          v1 = v8;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return v1;
}

- (void)ic_scrollRangeToVisible:()IC animated:completionHandler:
{
  id v10;

  v10 = a6;
  objc_msgSend(a1, "ic_rectForRange:", a3, a4);
  objc_msgSend(a1, "ic_scrollRectToVisible:animated:completionHandler:", a5, v10);

}

- (void)ic_scrollRectToVisible:()IC animated:completionHandler:
{
  id v14;

  v14 = a8;
  objc_msgSend(a1, "ic_scrollRectToVisible:animated:consideringInsets:", a7, 1, a2, a3, a4, a5);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
    dispatchMainAfterDelay();
  }

}

@end
