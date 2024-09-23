@implementation MessageListStatusIndicatorManager

- (void)_setUpIndicatorViews
{
  NSMutableArray *statusIndicatorViews;
  NSMutableArray *v4;
  NSMutableArray *v5;
  uint64_t i;
  id v7;
  void *v8;

  statusIndicatorViews = self->_statusIndicatorViews;
  if (statusIndicatorViews)
    -[NSMutableArray makeObjectsPerformSelector:](statusIndicatorViews, "makeObjectsPerformSelector:", "removeFromSuperview");
  v4 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 12);
  v5 = self->_statusIndicatorViews;
  self->_statusIndicatorViews = v4;

  for (i = 0; i != 12; ++i)
  {
    v7 = objc_alloc_init((Class)UIImageView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListStatusIndicatorManager _accessibilityIdentifierForTier:](self, "_accessibilityIdentifierForTier:", i));
    objc_msgSend(v7, "setAccessibilityIdentifier:", v8);

    -[NSMutableArray addObject:](self->_statusIndicatorViews, "addObject:", v7);
  }
}

- (id)_accessibilityIdentifierForTier:(unint64_t)a3
{
  uint64_t *v3;
  uint64_t v4;
  id *v5;

  v3 = &qword_1004C9730[a3];
  if (a3 >= 3)
    v3 = (uint64_t *)((char *)&unk_1004C9748 + 8 * a3 - 24);
  v4 = *v3;
  if ((v4 & 1) != 0)
  {
    v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewUnread;
  }
  else if ((v4 & 4) != 0)
  {
    v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewFlagged;
  }
  else if ((v4 & 2) != 0)
  {
    v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewVIP;
  }
  else if ((v4 & 0x100) != 0)
  {
    v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewBlockedSender;
  }
  else if ((v4 & 0x20) != 0)
  {
    v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewAttachment;
  }
  else if ((v4 & 0x18) != 0)
  {
    v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewRepliedForwarded;
  }
  else if ((v4 & 0x40) != 0)
  {
    v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewNotify;
  }
  else
  {
    if ((v4 & 0x80) == 0)
      return 0;
    v5 = (id *)&MSAccessibilityIdentifierMailMessageCellViewMute;
  }
  return *v5;
}

- (id)_createStatusIndicatorViews:(unint64_t)a3
{
  NSMutableArray *statusIndicatorViews;
  unint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  double v18;
  NSMutableArray *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  _OWORD v28[3];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  if (pthread_main_np() != 1)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListStatusIndicatorManager.m"), 202, CFSTR("Current thread must be main"));

  }
  if (a3 == 3)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListStatusIndicatorManager.m"), 203, CFSTR("Cannot create status indicator views for MessageStatusIndicatorPositionsAll"));

  }
  statusIndicatorViews = self->_statusIndicatorViews;
  if (!statusIndicatorViews || -[NSMutableArray count](statusIndicatorViews, "count") != (id)12)
    -[MessageListStatusIndicatorManager _setUpIndicatorViews](self, "_setUpIndicatorViews");
  if (-[MessageStatusIndicatorManager effectiveIndicatorOptions](self, "effectiveIndicatorOptions"))
  {
    v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v26 = (uint64_t)&v26;
    if (a3 == 2)
      v7 = 3;
    else
      v7 = 0;
    v8 = (((uint64_t)(a3 << 63) >> 63) & 3) + (((uint64_t)(a3 << 62) >> 63) & 9);
    if (v8)
    {
      v9 = (uint64_t *)((char *)&unk_1004C9748 + 8 * v7 - 24);
      v10 = &qword_1004C9730[v7];
      do
      {
        if (v7 >= 3)
          v11 = v9;
        else
          v11 = v10;
        v12 = *v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageStatusIndicatorManager statusIndicatorColorWithOptionsMask:](self, "statusIndicatorColorWithOptionsMask:", *v11, v26));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageStatusIndicatorManager statusIndicatorImageWithOptionsMask:](self, "statusIndicatorImageWithOptionsMask:", v12));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_statusIndicatorViews, "objectAtIndexedSubscript:", v7));
        v16 = v15;
        if (v14)
        {
          objc_msgSend(v15, "setImage:", v14);
          objc_msgSend(v16, "setTintColor:", v13);
          objc_msgSend(v16, "setTintAdjustmentMode:", 1);
          v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
          v28[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
          v28[1] = v17;
          v28[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
          objc_msgSend(v16, "setTransform:", v28);
          v18 = 1.0;
          objc_msgSend(v27, "addObject:", v16);
        }
        else
        {
          v18 = 0.0;
        }
        objc_msgSend(v16, "mf_setAlpha:", v18);

        ++v9;
        ++v10;
        ++v7;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = self->_statusIndicatorViews;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v30;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v22), "mf_setAlpha:", 0.0);
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v20);
    }

    v27 = &__NSArray0__struct;
  }
  return v27;
}

- (id)primaryStatusIndicatorImage
{
  uint64_t v3;
  void *v4;
  BOOL v5;

  v3 = 0;
  do
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageStatusIndicatorManager statusIndicatorImageWithOptionsMask:](self, "statusIndicatorImageWithOptionsMask:", qword_1004C9730[v3]));
    if (v4)
      v5 = 1;
    else
      v5 = v3 == 2;
    ++v3;
  }
  while (!v5);
  return v4;
}

- (id)verticalStatusIndicatorViews
{
  return -[MessageListStatusIndicatorManager _createStatusIndicatorViews:](self, "_createStatusIndicatorViews:", 1);
}

- (CGRect)_layoutHorizontalStatusIndicatorViewsInRect:(CGRect)a3 contentView:(id)a4 midX:(double)MidX pointY:(double)a6 shouldAlignWithCenter:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  unsigned int v17;
  double v18;
  id v19;
  _QWORD *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double MinX;
  id v26;
  id v27;
  char v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  double v56;
  double v57;
  BOOL v58;
  _BYTE v59[128];
  CGRect v60;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  if (pthread_main_np() != 1)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListStatusIndicatorManager.m"), 151, CFSTR("Current thread must be main"));

  }
  v17 = objc_msgSend(v16, "mf_prefersRightToLeftInterfaceLayout");
  -[MessageStatusIndicatorManager midXToMidXSpacing](self, "midXToMidXSpacing");
  if (!v17)
    v18 = -v18;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10003C7B0;
  v54[3] = &unk_10051F808;
  v56 = v18;
  v58 = a7;
  v19 = v16;
  v55 = v19;
  v57 = a6;
  v20 = objc_retainBlock(v54);
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  if ((v17 & 1) != 0)
    MinX = CGRectGetMinX(*(CGRect *)&v21);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v21);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v26 = (id)objc_claimAutoreleasedReturnValue(-[MessageListStatusIndicatorManager horizontalStatusIndicatorViews](self, "horizontalStatusIndicatorViews", MinX));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v27)
  {
    v28 = 0;
    v29 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "image", (_QWORD)v50));
        objc_msgSend(v32, "size");
        v34 = v33;
        v36 = v35;

        v37 = ((double (*)(_QWORD *, _QWORD, double, double, double, double, double))v20[2])(v20, v28 & 1, 0.0, 0.0, v34, v36, MidX);
        v39 = v38;
        v41 = v40;
        v43 = v42;
        objc_msgSend(v31, "setFrame:");
        objc_msgSend(v31, "frame");
        MidX = CGRectGetMidX(v60);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "superview"));
        LODWORD(v32) = v44 == 0;

        if ((_DWORD)v32)
          objc_msgSend(v19, "addSubview:", v31);
        v28 = 1;
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v27);
  }
  else
  {
    v37 = CGRectZero.origin.x;
    v39 = CGRectZero.origin.y;
    v41 = CGRectZero.size.width;
    v43 = CGRectZero.size.height;
  }

  v45 = v37;
  v46 = v39;
  v47 = v41;
  v48 = v43;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
  return result;
}

- (id)horizontalStatusIndicatorViews
{
  return -[MessageListStatusIndicatorManager _createStatusIndicatorViews:](self, "_createStatusIndicatorViews:", 2);
}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011E3DC;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9FD0 != -1)
    dispatch_once(&qword_1005A9FD0, block);
  return (id)qword_1005A9FC8;
}

- (NSArray)statusIndicatorViews
{
  return (NSArray *)-[NSMutableArray copy](self->_statusIndicatorViews, "copy");
}

- (unint64_t)tierForIndicator:(unint64_t)a3
{
  unint64_t result;
  uint64_t *v4;
  uint64_t *i;
  uint64_t *v6;

  result = 0;
  v4 = qword_1004C9730;
  for (i = qword_1004C9730; ; ++i)
  {
    v6 = result >= 3 ? v4 : i;
    if ((*v6 & a3) != 0)
      break;
    ++result;
    ++v4;
    if (result == 12)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (LayoutStatusIndicatorInfo)layoutStatusIndicatorViewsInRect:(SEL)a3 contentView:(CGRect)a4 verticalPositions:(id)a5 avatarVerticalPostions:(id)a6 horizontalPoint:(id)a7 shouldAlignWithCenter:(CGPoint)a8
{
  double width;
  double x;
  id v15;
  CGSize size;
  double v17;
  double v18;
  double v19;
  double MinY;
  double MaxY;
  void *v22;
  id v23;
  void *v24;
  id v25;
  _BOOL4 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __n128 v36;
  double v37;
  void *v38;
  float v39;
  float v40;
  __n128 v41;
  void *v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  LayoutStatusIndicatorInfo *result;
  void *v48;
  CGPoint v49;
  _BOOL4 v50;
  double y;
  double height;
  id v53;
  id v55;
  CGRect v56;
  CGRect v57;

  v50 = a9;
  v49 = a8;
  y = a4.origin.y;
  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  v55 = a5;
  v53 = a6;
  v15 = a7;
  if (pthread_main_np() != 1)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("MessageListStatusIndicatorManager.m"), 249, CFSTR("Current thread must be main"));

  }
  size = CGRectZero.size;
  retstr->var0.origin = CGRectZero.origin;
  retstr->var0.size = size;
  retstr->var1 = 0;
  v17 = x;
  size.width = y;
  v18 = width;
  v19 = height;
  MinY = CGRectGetMinY(*(CGRect *)((char *)&size - 8));
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  MaxY = CGRectGetMaxY(v56);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListStatusIndicatorManager verticalStatusIndicatorViews](self, "verticalStatusIndicatorViews"));
  v23 = objc_msgSend(v15, "count");
  v24 = v53;
  if (v23)
    v24 = v15;
  v25 = v24;
  v26 = v50 || objc_msgSend(v15, "count") != 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  while (v28 < (unint64_t)objc_msgSend(v22, "count", *(_QWORD *)&v49.x, *(_QWORD *)&v49.y))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndex:", v28));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "image"));
    objc_msgSend(v31, "size");
    v33 = v32;
    v35 = v34;

    v36.n128_f64[0] = (width - v33) * 0.5;
    v37 = UIRoundToViewScale(0, v36);
    if (v29 >= (unint64_t)objc_msgSend(v25, "count")
      || (v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndex:", v29)),
          objc_msgSend(v38, "floatValue"),
          v40 = v39,
          ++v29,
          v38,
          v40 == 0.0))
    {
      objc_msgSend(v30, "setAlpha:", 0.0);
    }
    else
    {
      v41.n128_f64[0] = v35 * 0.5;
      if (!v26)
        v41.n128_f64[0] = v35;
      MinY = v40 - UIRoundToViewScale(v55, v41);
      retstr->var1 = ++v27;
    }
    objc_msgSend(v30, "setFrame:", x + v37, MinY, v33, v35);
    objc_msgSend(v30, "frame");
    if (CGRectGetMaxY(v57) > MaxY)
    {
      objc_msgSend(v30, "setAlpha:", 0.0);
      retstr->var1 = v27 - 1;

      break;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "superview"));

    if (!v42)
      objc_msgSend(v55, "addSubview:", v30);

    ++v28;
  }
  -[MessageListStatusIndicatorManager _layoutHorizontalStatusIndicatorViewsInRect:contentView:midX:pointY:shouldAlignWithCenter:](self, "_layoutHorizontalStatusIndicatorViewsInRect:contentView:midX:pointY:shouldAlignWithCenter:", v55, v50, x, y, width, height, v49.x, v49.y);
  retstr->var0.origin.x = v43;
  retstr->var0.origin.y = v44;
  retstr->var0.size.width = v45;
  retstr->var0.size.height = v46;

  return result;
}

- (void)prepareForReuse
{
  NSMutableArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  -[MessageStatusIndicatorManager setFlagColors:](self, "setFlagColors:", 0);
  -[MessageStatusIndicatorManager setIndicatorOptions:](self, "setIndicatorOptions:", 0);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_statusIndicatorViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "setImage:", 0, (_QWORD)v8);
        objc_msgSend(v7, "removeFromSuperview");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusIndicatorViews, 0);
}

@end
