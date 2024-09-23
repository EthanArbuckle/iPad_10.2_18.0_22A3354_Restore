@implementation MFConversationViewCellSizeTracker

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015C400;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA130 != -1)
    dispatch_once(&qword_1005AA130, block);
  return (id)qword_1005AA128;
}

- (MFConversationViewCellSizeTracker)init
{
  MFConversationViewCellSizeTracker *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *intrinsicCellSizes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFConversationViewCellSizeTracker;
  v2 = -[MFConversationViewCellSizeTracker init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    intrinsicCellSizes = v2->_intrinsicCellSizes;
    v2->_intrinsicCellSizes = v3;

  }
  return v2;
}

- (CGSize)displaySizeForCellWithItemID:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  char isKindOfClass;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "defaultCellSizeForTracker:", self);
  v7 = v6;
  v9 = v8;
  v10 = objc_msgSend(WeakRetained, "conversationViewCellSizeTracker:expansionStatusForMessageWithItemID:", self, v4);
  v11 = objc_opt_class(MFGeneratedSummaryCollectionItemID);
  isKindOfClass = objc_opt_isKindOfClass(v4, v11);
  if (v10 != (id)3)
  {
    if (v10 == (id)2)
    {
      objc_msgSend(WeakRetained, "defaultSemiExpandedHeightForTracker:", self);
      v14 = v13;
      goto LABEL_11;
    }
    v14 = v9;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_11;
  }
  -[MFConversationViewCellSizeTracker intrinsicSizeForCellWithItemID:](self, "intrinsicSizeForCellWithItemID:", v4);
  if (CGSizeZero.height == v16 && CGSizeZero.width == v15)
    v14 = v9;
  else
    v14 = v16;
LABEL_11:
  if (objc_msgSend(WeakRetained, "isDisplayingSingleMessageForTracker:", self))
  {
    v18 = objc_opt_class(EMMessageCollectionItemID);
    if ((objc_opt_isKindOfClass(v4, v18) & 1) != 0)
    {
      if (objc_msgSend(WeakRetained, "isQuickReplyForTracker:", self))
      {
        objc_msgSend(WeakRetained, "quickReplyHeightForTracker:", self);
        v20 = v14 + v19;
        v21 = v9 - v19;
        if (v20 <= v9)
          v9 = v21;
        else
          v9 = v14;
      }
      else if (v14 >= v9)
      {
        v9 = v14;
      }
      objc_msgSend(WeakRetained, "initialScrollOffsetForTracker:", self);
      if (v9 + v22 >= 0.0)
        v14 = v9 + v22;
      else
        v14 = v9;
    }
  }

  v23 = v7;
  v24 = v14;
  result.height = v24;
  result.width = v23;
  return result;
}

- (CGSize)intrinsicSizeForCellWithItemID:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  CGFloat width;
  double v7;
  CGFloat height;
  double v9;
  double v10;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_intrinsicCellSizes, "objectForKey:", a3));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "CGSizeValue");
    width = v5;
    height = v7;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }

  v9 = width;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)intrinsicSizesForCellsWithItemIDs:(id)a3
{
  id v4;
  NSMutableDictionary *intrinsicCellSizes;
  id WeakRetained;
  void *v7;
  void *v8;

  v4 = a3;
  intrinsicCellSizes = self->_intrinsicCellSizes;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "defaultCellSizeForTracker:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectsForKeys:notFoundMarker:](intrinsicCellSizes, "objectsForKeys:notFoundMarker:", v4, v7));

  return v8;
}

- (void)setIntrinsicSize:(CGSize)a3 forCellWithItemID:(id)a4
{
  double height;
  double width;
  void *v7;
  id v8;

  height = a3.height;
  width = a3.width;
  v8 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", width, height));
  -[NSMutableDictionary setObject:forKey:](self->_intrinsicCellSizes, "setObject:forKey:", v7, v8);

}

- (void)resetAllCellSizes
{
  -[NSMutableDictionary removeAllObjects](self->_intrinsicCellSizes, "removeAllObjects");
}

- (void)resetCellSizesForCellsWithItemIDs:(id)a3
{
  -[NSMutableDictionary removeObjectsForKeys:](self->_intrinsicCellSizes, "removeObjectsForKeys:", a3);
}

- (MFConversationViewCellSizeTrackerDelegate)delegate
{
  return (MFConversationViewCellSizeTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_intrinsicCellSizes, 0);
}

@end
