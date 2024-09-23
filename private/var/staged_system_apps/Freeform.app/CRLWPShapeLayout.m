@implementation CRLWPShapeLayout

- (CRLWPShapeLayout)initWithInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  CRLWPShapeLayout *v10;
  CRLWPShapeLayout *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125ECB0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3588C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125ECD0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeLayout initWithInfo:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 25, 0, "Info is wrong class for layout.");

  }
  v18.receiver = self;
  v18.super_class = (Class)CRLWPShapeLayout;
  v10 = -[CRLShapeLayout initWithInfo:](&v18, "initWithInfo:", v4);
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout wpShapeInfo](v10, "wpShapeInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "text"));

    if (!v13)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125ECF0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E357E0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125ED10);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeLayout initWithInfo:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeLayout.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 27, 0, "invalid nil value for '%{public}s'", "self.wpShapeInfo.text");

    }
  }

  return v11;
}

- (_TtC8Freeform14CRLWPShapeItem)wpShapeInfo
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (_TtC8Freeform14CRLWPShapeItem *)v8;
}

- (void)setSupportsInstructionalText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a3;
  BYTE4(self->super.mDynamicPatternOffsetsBySubpath) = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout textLayout](self, "textLayout"));
  v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      -[CRLWPShapeLayout createTextLayout](self, "createTextLayout");
      return;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout textLayout](self, "textLayout"));
    objc_msgSend(v10, "invalidateTextLayout");
    v7 = v10;
    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storage"));
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    objc_msgSend(*(id *)((char *)&self->_storageRangeToFontSizeDict + 3), "removeFromParent");
    v7 = *(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3);
    *(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3) = 0;
LABEL_8:

  }
}

- (id)childInfosForChildLayouts
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLWPShapeLayout;
  v3 = -[CRLCanvasLayout childInfosForChildLayouts](&v9, "childInfosForChildLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  if (-[CRLWPShapeLayout p_shouldCreateTextLayout](self, "p_shouldCreateTextLayout")
    && *(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout wpShapeInfo](self, "wpShapeInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
    objc_msgSend(v5, "addObject:", v7);

  }
  return v5;
}

- (void)updateChildrenFromInfo
{
  objc_super v3;

  -[CRLWPShapeLayout createTextLayout](self, "createTextLayout");
  v3.receiver = self;
  v3.super_class = (Class)CRLWPShapeLayout;
  -[CRLCanvasLayout updateChildrenFromInfo](&v3, "updateChildrenFromInfo");
}

- (void)createTextLayout
{
  -[CRLWPShapeLayout createTextLayoutForScribble:](self, "createTextLayoutForScribble:", 0);
}

- (void)createTextLayoutForScribble:(BOOL)a3
{
  id *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  id v20;
  _TtC8Freeform11CRLWPLayout *v21;
  void *v22;
  void *v23;
  _TtC8Freeform11CRLWPLayout *v24;
  void *v25;
  void *v26;
  id v27;
  _BOOL4 v28;
  id v29;

  v3 = (id *)((char *)&self->_storageRangeToFontSizeDict + 3);
  if (!*(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3))
  {
    v28 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "canvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));

    *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v9).n128_u64[0];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mostSpecificSelectionOfClass:", v11, v10));
    *(_QWORD *)&v14 = objc_opt_class(CRLWPSelection, v13).n128_u64[0];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mostSpecificSelectionOfClass:", v15, v14));
    v17 = 0;
    if (v16 && v12)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "boardItems"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemLayout boardItem](self, "boardItem"));
      if (objc_msgSend(v18, "containsObject:", v19))
      {
        v20 = objc_msgSend(v8, "indexForSelection:", v16);
        v17 = v20 > objc_msgSend(v8, "indexForSelection:", v12);
      }
      else
      {
        v17 = 0;
      }

    }
    v21 = [_TtC8Freeform11CRLWPLayout alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout wpShapeInfo](self, "wpShapeInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "text"));
    v24 = -[CRLWPLayout initWithInfo:](v21, "initWithInfo:", v23);

    if (v17
      || -[CRLWPShapeLayout supportsInstructionalText](self, "supportsInstructionalText")
      || -[CRLWPShapeLayout autosizeFlagsFor:](self, "autosizeFlagsFor:", v24)
      || (v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout wpShapeInfo](self, "wpShapeInfo")),
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "text")),
          v27 = objc_msgSend(v26, "length"),
          v26,
          v25,
          v27)
      || v28)
    {
      if (!*v3)
      {
        objc_storeStrong(v3, v24);
        -[CRLCanvasAbstractLayout insertChild:atIndex:](self, "insertChild:atIndex:", *v3, 0);
        -[CRLWPShapeLayout p_invalidateTextLayout](self, "p_invalidateTextLayout");
      }
    }

  }
}

- (BOOL)p_shouldCreateTextLayout
{
  void *v4;
  unsigned __int8 v5;

  if (-[CRLShapeLayout pathIsLineSegment](self, "pathIsLineSegment"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
  v5 = objc_msgSend(v4, "isFreehandDrawingShape");

  return v5 ^ 1;
}

- (id)dependentLayouts
{
  NSArray *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLWPShapeLayout;
  v3 = -[CRLCanvasLayout dependentLayouts](&v12, "dependentLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout textLayout](self, "textLayout"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[CRLWPShapeLayout autosizes](self, "autosizes");

    if ((v7 & 1) == 0)
    {
      if (v4)
        v8 = objc_msgSend(v4, "mutableCopy");
      else
        v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout textLayout](self, "textLayout"));
      objc_msgSend(v9, "addObject:", v10);

      v4 = v9;
    }
  }
  return v4;
}

- (CRLWrapSegments)interiorWrapSegments
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  CRLWrapSegments *v13;
  void *v14;

  v3 = *(void **)(&self->_supportsInstructionalText + 2);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout wpShapeInfo](self, "wpShapeInfo"));
    objc_msgSend(v4, "textInset");
    v6 = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stroke"));

    if (v8 && objc_msgSend(v8, "shouldRender"))
    {
      objc_msgSend(v8, "width");
      v6 = v9 * 0.5 + v6;
      v10 = objc_msgSend(v8, "join");
    }
    else
    {
      v10 = 0;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout pathSource](self, "pathSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interiorWrapPathForInset:joinStyle:", v10, v6));

    v13 = -[CRLWrapSegments initWithPath:]([CRLWrapSegments alloc], "initWithPath:", v12);
    v14 = *(void **)(&self->_supportsInstructionalText + 2);
    *(_QWORD *)(&self->_supportsInstructionalText + 2) = v13;

    v3 = *(void **)(&self->_supportsInstructionalText + 2);
  }
  return (CRLWrapSegments *)v3;
}

- (id)pathSource
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  CRLPathSource *v15;
  objc_super v17;

  if (*(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3)
    && -[CRLWPShapeLayout autosizes](self, "autosizes"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_storageRangeToFontSizeDict + 3), "geometry"));
    objc_msgSend(v3, "size");
    v5 = v4;
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stroke"));

    if (v9 && objc_msgSend(v9, "shouldRender"))
    {
      objc_msgSend(v9, "width");
      v5 = v5 + v10;
      objc_msgSend(v9, "width");
      v7 = v7 + v11;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathSource"));
    v14 = objc_msgSend(v13, "copy");

    objc_msgSend(v14, "setNaturalSize:", v5, v7);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CRLWPShapeLayout;
    v15 = -[CRLShapeLayout pathSource](&v17, "pathSource");
    v14 = (id)objc_claimAutoreleasedReturnValue(v15);
  }
  return v14;
}

- (void)processChangedProperty:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLWPShapeLayout;
  -[CRLShapeLayout processChangedProperty:](&v5, "processChangedProperty:");
  if (a3 - 25 <= 1)
  {
    if (-[CRLWPShapeLayout autosizes](self, "autosizes"))
      -[CRLWPShapeLayout invalidateSize](self, "invalidateSize");
    if (a3 == 26
      && ((-[CRLWPShapeLayout p_shouldCreateTextLayout](self, "p_shouldCreateTextLayout") ^ (*(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3) == 0)) & 1) == 0)
    {
      -[CRLCanvasLayout invalidateChildren](self, "invalidateChildren");
    }
  }
  -[CRLWPShapeLayout t_invalidateTextLayoutAfterPropertyChanged:](self, "t_invalidateTextLayoutAfterPropertyChanged:", a3);
}

- (void)t_invalidateTextLayoutAfterPropertyChanged:(unint64_t)a3
{
  if (a3 - 25 < 7 || a3 == 19 || a3 == 7)
    -[CRLWPShapeLayout p_invalidateTextLayout](self, "p_invalidateTextLayout");
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  objc_super v4;

  if (-[CRLWPShapeLayout autosizes](self, "autosizes"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeLayout;
  return -[CRLCanvasLayout canAspectRatioLockBeChangedByUser](&v4, "canAspectRatioLockBeChangedByUser");
}

- (BOOL)resizeMayChangeAspectRatio
{
  objc_super v4;

  if (-[CRLWPShapeLayout autosizes](self, "autosizes"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeLayout;
  return -[CRLCanvasLayout resizeMayChangeAspectRatio](&v4, "resizeMayChangeAspectRatio");
}

- (void)setGeometry:(id)a3
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
  void *v15;
  void *v16;
  double v17;
  double v18;
  CRLCanvasLayoutGeometry *v19;
  CRLCanvasLayoutGeometry *v20;
  CGAffineTransform v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CRLWPShapeLayout;
  -[CRLShapeLayout setGeometry:](&v22, "setGeometry:", a3);
  if (*(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3)
    && -[CRLWPShapeLayout autosizes](self, "autosizes"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_storageRangeToFontSizeDict + 3), "geometry"));
    objc_msgSend(v4, "size");
    v6 = v5;
    v8 = v7;

    -[CRLShapeLayout pathBounds](self, "pathBounds");
    v10 = v9;
    v12 = v11;
    v13 = -v9;
    v14 = -v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stroke"));

    if (v16)
    {
      if (objc_msgSend(v16, "shouldRender"))
      {
        objc_msgSend(v16, "width");
        v18 = v17 * 0.5;
        v13 = v18 - v10;
        v14 = v18 - v12;
      }
    }
    v19 = [CRLCanvasLayoutGeometry alloc];
    CGAffineTransformMakeTranslation(&v21, v13, v14);
    v20 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v19, "initWithSize:transform:", &v21, v6, v8);
    objc_msgSend(*(id *)((char *)&self->_storageRangeToFontSizeDict + 3), "setGeometry:", v20);

  }
}

- (void)invalidateSize
{
  unint64_t v3;
  BOOL v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLWPShapeLayout;
  -[CRLCanvasLayout invalidateSize](&v5, "invalidateSize");
  if (*(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3))
  {
    v3 = -[CRLWPShapeLayout autosizeFlagsFor:](self, "autosizeFlagsFor:");
    if (v3)
      v4 = (v3 & 0xF) == 15;
    else
      v4 = 1;
    if (!v4)
      -[CRLWPShapeLayout invalidatePath](self, "invalidatePath");
  }
}

- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  __int128 v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  _OWORD v20[3];
  objc_super v21;

  v5 = a5;
  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRLWPShapeLayout;
  v9 = *(_OWORD *)&a4->c;
  v20[0] = *(_OWORD *)&a4->a;
  v20[1] = v9;
  v20[2] = *(_OWORD *)&a4->tx;
  -[CRLShapeLayout transferLayoutGeometryToInfo:withAdditionalTransform:assertIfInDocument:](&v21, "transferLayoutGeometryToInfo:withAdditionalTransform:assertIfInDocument:", v8, v20, v5);
  objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v10);
  v12 = sub_1002223BC(v11, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (-[CRLWPShapeLayout autosizes](self, "autosizes"))
  {
    -[CRLWPShapeLayout autosizePositionOffset](self, "autosizePositionOffset");
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geometry"));
    v17 = objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "position");
    objc_msgSend(v17, "setPosition:", sub_1000603B8(v18, v19, v15));
    objc_msgSend(v13, "setGeometry:", v17);

  }
}

- (CGAffineTransform)computeLayoutTransform
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v13;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v16;
  CGAffineTransform v17;

  if (-[CRLWPShapeLayout autosizes](self, "autosizes"))
  {
    memset(&v17, 0, sizeof(v17));
    -[CRLWPShapeLayout autosizedTransform](self, "autosizedTransform");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"));
    objc_msgSend(v5, "position");
    v7 = v6;
    v9 = v8;

    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeTranslation(&t2, v7, v9);
    t1 = v17;
    CGAffineTransformConcat(&v16, &t1, &t2);
    -[CRLShapeLayout pathBounds](self, "pathBounds");
    *(_OWORD *)&retstr->a = 0u;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    t1 = v16;
    return CGAffineTransformTranslate(retstr, &t1, v10, v11);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLWPShapeLayout;
    return (CGAffineTransform *)-[CGAffineTransform computeLayoutTransform](&v13, "computeLayoutTransform");
  }
}

- (CGAffineTransform)autosizedTransform
{
  CGAffineTransform *result;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"));
  -[CRLWPShapeLayout autosizedTransformForInfoGeometry:](self, "autosizedTransformForInfoGeometry:", v5);

  return result;
}

- (CGAffineTransform)autosizedTransformForInfoGeometry:(SEL)a3
{
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  __int128 v15;
  CGAffineTransform *result;
  id v17;

  v17 = a4;
  *(_QWORD *)&v7 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v6).n128_u64[0];
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v7));
  v11 = sub_100221D0C(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    -[CRLShapeLayout pathBoundsWithoutStroke](self, "pathBoundsWithoutStroke");
    objc_msgSend(v12, "autosizedTransformForInfoGeometry:size:", v17, v13, v14);
  }
  else
  {
    v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }

  return result;
}

- (CGPoint)autosizePositionOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[CRLWPShapeLayout autosizePositionOffsetForFixedWidth:height:](self, "autosizePositionOffsetForFixedWidth:height:", 1, 1);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)autosizePositionOffsetForFixedWidth:(BOOL)a3 height:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float64x2_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  v4 = a4;
  v5 = a3;
  -[CRLWPShapeLayout autosizedTransform](self, "autosizedTransform");
  -[CRLShapeLayout pathBoundsWithoutStroke](self, "pathBoundsWithoutStroke");
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"));
  v12 = objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;
  if ((objc_msgSend(v12, "widthValid") & 1) == 0 && v5)
  {
    objc_msgSend(v12, "setWidthValid:", 1);
    v14 = v8;
  }
  if ((objc_msgSend(v12, "heightValid") & 1) == 0 && v4)
  {
    objc_msgSend(v12, "setHeightValid:", 1);
    v16 = v10;
  }
  objc_msgSend(v12, "setSize:", v14, v16);
  -[CRLWPShapeLayout autosizedTransformForInfoGeometry:](self, "autosizedTransformForInfoGeometry:", v12);
  v17 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, CGPointZero.y), (float64x2_t)0, CGPointZero.x));
  v18 = sub_1000603B8(v17.f64[0], v17.f64[1], v17.f64[0]);
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (void)invalidatePath
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeLayout;
  -[CRLShapeLayout invalidatePath](&v4, "invalidatePath");
  -[CRLCanvasLayout invalidateChildren](self, "invalidateChildren");
  v3 = *(void **)(&self->_supportsInstructionalText + 2);
  *(_QWORD *)(&self->_supportsInstructionalText + 2) = 0;

}

- (void)p_invalidateTextLayout
{
  objc_msgSend(*(id *)((char *)&self->_storageRangeToFontSizeDict + 3), "invalidateTextLayout");
}

- (id)bidirectionalSizeDependentLayouts
{
  NSArray *v3;
  void *v4;
  unint64_t v5;
  void *v7;
  uint64_t v8;
  objc_super v10;
  uint64_t v11;
  uint64_t v12;

  v10.receiver = self;
  v10.super_class = (Class)CRLWPShapeLayout;
  v3 = -[CRLCanvasLayout bidirectionalSizeDependentLayouts](&v10, "bidirectionalSizeDependentLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[CRLWPShapeLayout autosizeFlagsFor:](self, "autosizeFlagsFor:", *(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3));
  if ((~(_BYTE)v5 & 0xF) != 0 && v5 && *(NSDictionary **)((char *)&self->_storageRangeToFontSizeDict + 3) != 0)
  {
    if (objc_msgSend(v4, "count"))
    {
      v11 = *(uint64_t *)((char *)&self->_storageRangeToFontSizeDict + 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v4));

      v4 = v7;
    }
    else
    {
      v12 = *(uint64_t *)((char *)&self->_storageRangeToFontSizeDict + 3);
      v8 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    }

    v4 = (void *)v8;
  }
  return v4;
}

- (id)textWrapper
{
  if (-[CRLWPShapeLayout autosizes](self, "autosizes"))
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[CRLWPInteriorTextWrapController sharedInteriorTextWrapController](CRLWPInteriorTextWrapController, "sharedInteriorTextWrapController"));
}

- (CGRect)rectInRootForSelectionPath:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CRLWPShapeLayout p_rectInRootForSelectionPath:useParagraphModeRects:](self, "p_rectInRootForSelectionPath:useParagraphModeRects:", a3, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)rectInRootForZoomingToSelectionPath:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CRLWPShapeLayout p_rectInRootForSelectionPath:useParagraphModeRects:](self, "p_rectInRootForSelectionPath:useParagraphModeRects:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)rectInRootOfAutoZoomContextOfSelectionPath:(id)a3
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometryInRoot](self, "geometryInRoot", a3));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)viewScaleForZoomingToSelectionPath:(id)a3 targetPointSize:(double)a4
{
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;

  v6 = a3;
  *(_QWORD *)&v8 = objc_opt_class(CRLWPSelection, v7).n128_u64[0];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mostSpecificSelectionOfClass:", v9, v8));

  v11 = 0.0;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout makeStorageRangeToFontSizeDict](self, "makeStorageRangeToFontSizeDict"));
    if (objc_msgSend(v12, "count"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allValues"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
      objc_msgSend(v14, "floatValue");
      v11 = v15;

    }
    else
    {
      -[CRLWPShapeLayout defaultFontSize](self, "defaultFontSize");
      v11 = v16;
    }

  }
  if (v11 <= 0.0)
    v17 = 0.0;
  else
    v17 = a4 / v11;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "canvas"));
  objc_msgSend(v19, "viewScale");
  v21 = v20;

  if (v21 < v17)
    v21 = v17;

  return v21;
}

- (CGRect)p_rectInRootForSelectionPath:(id)a3 useParagraphModeRects:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  double v8;
  CGFloat x;
  double v10;
  CGFloat y;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGRect v50;
  CGRect result;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometryInRoot](self, "geometryInRoot"));
  objc_msgSend(v7, "frame");
  x = v8;
  y = v10;
  width = v12;
  height = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvas"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvasController"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "modelsForSelectionPath:", v6));
  *(_QWORD *)&v21 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v20).n128_u64[0];
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout textLayout](self, "textLayout", v21));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "storage"));
  v26 = sub_100221D0C(v23, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  if (v27 && objc_msgSend(v19, "containsObject:", v27))
  {
    *(_QWORD *)&v29 = objc_opt_class(CRLWPSelection, v28).n128_u64[0];
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mostSpecificSelectionOfClass:", v30, v29));
    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout textLayout](self, "textLayout"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "columns"));
      +[CRLWPColumn rectForSelection:withColumns:useParagraphModeRects:](CRLWPColumn, "rectForSelection:withColumns:useParagraphModeRects:", v31, v33, v4);
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;

      v50.origin.x = v35;
      v50.origin.y = v37;
      v50.size.width = v39;
      v50.size.height = v41;
      if (CGRectIsNull(v50))
      {
        x = CGRectNull.origin.x;
        y = CGRectNull.origin.y;
        width = CGRectNull.size.width;
        height = CGRectNull.size.height;
      }
      else
      {
        -[CRLCanvasAbstractLayout rectInRoot:](self, "rectInRoot:", v35, v37, v39, v41);
        x = v42;
        y = v43;
        width = v44;
        height = v45;
      }
    }

  }
  v46 = x;
  v47 = y;
  v48 = width;
  v49 = height;
  result.size.height = v49;
  result.size.width = v48;
  result.origin.y = v47;
  result.origin.x = v46;
  return result;
}

- (id)captureDynamicInfoGeometryToBeginDynamicOperation
{
  void *v3;
  id v4;
  objc_super v6;

  if (-[CRLWPShapeLayout autosizes](self, "autosizes"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"));
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLWPShapeLayout;
    v4 = -[CRLShapeLayout captureDynamicInfoGeometryToBeginDynamicOperation](&v6, "captureDynamicInfoGeometryToBeginDynamicOperation");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  return v3;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  CRLCanvasCommandSelectionBehavior *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CRLCanvasCommandSelectionBehavior *v40;
  void *v41;
  _TtC8Freeform15CRLCommandGroup *v42;
  void *v43;
  id v44;
  CGAffineTransform v45;
  _OWORD v46[3];
  CGAffineTransform v47;
  CGAffineTransform v48;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CRLWPShapeLayout;
  -[CRLShapeLayout takeSizeFromTracker:](&v49, "takeSizeFromTracker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "knob"));
  v6 = objc_msgSend(v5, "tag");

  if (!sub_100260F28(v6) || !-[CRLWPShapeLayout autosizes](self, "autosizes"))
    goto LABEL_49;
  if (-[CRLCanvasLayout isInTopLevelContainerForEditing](self, "isInTopLevelContainerForEditing"))
  {
    if (v4)
    {
      objc_msgSend(v4, "flippedIfNecessaryTransformForLayout:", self);
      goto LABEL_9;
    }
  }
  else if (v4)
  {
    objc_msgSend(v4, "transformForLayout:", self);
    goto LABEL_9;
  }
  memset(&v47, 0, sizeof(v47));
LABEL_9:
  v48 = v47;
  memset(&v47, 0, sizeof(v47));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalPureGeometry](self, "originalPureGeometry"));
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "transform");
  else
    memset(v46, 0, sizeof(v46));
  v45 = v48;
  sub_100079650(&v45, v46, &v47);

  v45 = v47;
  v9 = sub_10007922C(&v45.a);
  if (v9 != 1.0 && fabs(v9 + -1.0) >= 0.000000999999997)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rep"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "infoForTransforming"));
    objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v12);
    isKindOfClass = objc_opt_isKindOfClass(v11, v13);

    if ((isKindOfClass & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvas"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvasController"));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "commandController"));
      v19 = *(_QWORD *)(&self->super.mOkayToSetGeometry + 3);
      if (!v19)
      {
        v20 = objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout makeStorageRangeToFontSizeDict](self, "makeStorageRangeToFontSizeDict"));
        v21 = *(void **)(&self->super.mOkayToSetGeometry + 3);
        *(_QWORD *)(&self->super.mOkayToSetGeometry + 3) = v20;

        if ((objc_opt_respondsToSelector(v4, "isEnqueueingCommandsInRealTime") & 1) == 0)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125ED30);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E3598C();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125ED50);
          v22 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeLayout takeSizeFromTracker:]"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeLayout.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 497, 0, "Resize tracker should be able to say if it is enqueueing commands in real time.");

        }
        if ((objc_opt_respondsToSelector(v4, "isEnqueueingCommandsInRealTime") & 1) != 0
          && objc_msgSend(v4, "isEnqueueingCommandsInRealTime"))
        {
          if ((objc_msgSend(v18, "isGroupOpen") & 1) == 0)
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125ED70);
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100E3590C();
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125ED90);
            v25 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100DE7468(v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeLayout takeSizeFromTracker:]"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeLayout.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 499, 0, "There should already be a command group open if we are enqueueing in real time.");

          }
        }
        else
        {
          objc_msgSend(v18, "openGroup");
          objc_msgSend(v18, "enableProgressiveEnqueuingInCurrentGroup");
          BYTE3(self->super.mDynamicPatternOffsetsBySubpath) = 1;
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "geometry"));
        if (objc_msgSend(v29, "widthValid"))
          v30 = objc_msgSend(v29, "heightValid");
        else
          v30 = 0;
        if (-[CRLWPShapeLayout autosizes](self, "autosizes") && (v30 & 1) == 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rep"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layout"));
          v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "finalInfoGeometryForResize"));

          if (!v33)
            v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentGeometryForLayout:", self));
          v43 = (void *)v33;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rep"));
          v44 = objc_msgSend(v34, "newCommandToApplyGeometry:toInfo:", v33, v28);

          v35 = [CRLCanvasCommandSelectionBehavior alloc];
          v36 = v17;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvasEditor"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "editorController"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "selectionPath"));
          v40 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:selectionPath:selectionFlags:](v35, "initWithCanvasEditor:type:selectionPath:selectionFlags:", v37, 2, v39, 4);

          v17 = v36;
          objc_msgSend(v18, "enqueueCommand:withSelectionBehavior:", v44, v40);

        }
        v19 = *(_QWORD *)(&self->super.mOkayToSetGeometry + 3);
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout commandsToSetFontSizesWithFontRangeToSizeDict:scale:](self, "commandsToSetFontSizesWithFontRangeToSizeDict:scale:", v19, v9));
      v42 = -[CRLCommandGroup initWithCommands:]([_TtC8Freeform15CRLCommandGroup alloc], "initWithCommands:", v41);
      objc_msgSend(v18, "enqueueCommand:", v42);

    }
  }
LABEL_49:

}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  CRLCanvasCommandSelectionBehavior *v36;
  void *v37;
  void *v38;
  void *v39;
  CRLCanvasCommandSelectionBehavior *v40;
  void *v41;
  _TtC8Freeform15CRLCommandGroup *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  CGAffineTransform v48;
  _OWORD v49[3];
  CGAffineTransform v50[2];
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)CRLWPShapeLayout;
  -[CRLShapeLayout takeFreeTransformFromTracker:](&v51, "takeFreeTransformFromTracker:", v4);
  if ((objc_msgSend(v4, "isResizing") & 1) != 0)
  {
    if (-[CRLWPShapeLayout autosizes](self, "autosizes"))
    {
      v5 = 0uLL;
      memset(&v50[1], 0, sizeof(CGAffineTransform));
      if (v4)
      {
        objc_msgSend(v4, "resizeTransformForLayout:", self);
        v5 = 0uLL;
      }
      *(_OWORD *)&v50[0].c = v5;
      *(_OWORD *)&v50[0].tx = v5;
      *(_OWORD *)&v50[0].a = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalPureGeometry](self, "originalPureGeometry"));
      v7 = v6;
      if (v6)
        objc_msgSend(v6, "transform");
      else
        memset(v49, 0, sizeof(v49));
      v48 = v50[1];
      sub_100079650(&v48, v49, v50);

      v48 = v50[0];
      v9 = sub_10007922C(&v48.a);
      if (v9 != 1.0 && fabs(v9 + -1.0) >= 0.000000999999997)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvas"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "repForLayout:", self));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "infoForTransforming"));
        objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v14);
        isKindOfClass = objc_opt_isKindOfClass(v13, v15);

        if ((isKindOfClass & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvas"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "canvasController"));

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "commandController"));
          v21 = *(_QWORD *)(&self->super.mOkayToSetGeometry + 3);
          if (!v21)
          {
            v22 = objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout makeStorageRangeToFontSizeDict](self, "makeStorageRangeToFontSizeDict"));
            v23 = *(void **)(&self->super.mOkayToSetGeometry + 3);
            *(_QWORD *)(&self->super.mOkayToSetGeometry + 3) = v22;

            v47 = v20;
            if ((objc_opt_respondsToSelector(v4, "isEnqueueingCommandsInRealTime") & 1) == 0)
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              v46 = v19;
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10125EDB0);
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100E35A8C();
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10125EDD0);
              v24 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100DE7468(v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeLayout takeFreeTransformFromTracker:]"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeLayout.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 570, 0, "Resize tracker should be able to say if it is enqueueing commands in real time.");

              v19 = v46;
            }
            if ((objc_opt_respondsToSelector(v4, "isEnqueueingCommandsInRealTime") & 1) != 0
              && objc_msgSend(v4, "isEnqueueingCommandsInRealTime"))
            {
              if ((objc_msgSend(v20, "isGroupOpen") & 1) == 0)
              {
                +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_10125EDF0);
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  sub_100E35A0C();
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_10125EE10);
                v27 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  sub_100DE7468(v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeLayout takeFreeTransformFromTracker:]"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeLayout.m"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 572, 0, "There should already be a command group open if we are enqueueing in real time.");

              }
            }
            else
            {
              objc_msgSend(v20, "openGroup");
              objc_msgSend(v20, "enableProgressiveEnqueuingInCurrentGroup");
              BYTE3(self->super.mDynamicPatternOffsetsBySubpath) = 1;
            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "geometry"));
            if (objc_msgSend(v31, "widthValid"))
              v32 = objc_msgSend(v31, "heightValid");
            else
              v32 = 0;
            if (-[CRLWPShapeLayout autosizes](self, "autosizes") && (v32 & 1) == 0)
            {
              v33 = v19;
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout"));
              v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "finalInfoGeometryForResize"));

              if (!v35)
                v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentGeometryForLayout:", self));
              v44 = (void *)v35;
              v43 = objc_msgSend(v12, "newCommandToApplyGeometry:toInfo:", v35, v30);
              v36 = [CRLCanvasCommandSelectionBehavior alloc];
              v19 = v33;
              v45 = v30;
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "canvasEditor"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "editorController"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "selectionPath"));
              v40 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:selectionPath:selectionFlags:](v36, "initWithCanvasEditor:type:selectionPath:selectionFlags:", v37, 2, v39, 4);

              v30 = v45;
              v20 = v47;
              objc_msgSend(v47, "enqueueCommand:withSelectionBehavior:", v43, v40);

            }
            v21 = *(_QWORD *)(&self->super.mOkayToSetGeometry + 3);
          }
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout commandsToSetFontSizesWithFontRangeToSizeDict:scale:](self, "commandsToSetFontSizesWithFontRangeToSizeDict:scale:", v21, v9, v43));
          v42 = -[CRLCommandGroup initWithCommands:]([_TtC8Freeform15CRLCommandGroup alloc], "initWithCommands:", v41);
          objc_msgSend(v20, "enqueueCommand:", v42);

        }
      }
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout textLayout](self, "textLayout"));
    objc_msgSend(v8, "invalidatePosition");

  }
}

- (void)endDynamicOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  if (BYTE3(self->super.mDynamicPatternOffsetsBySubpath))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));

    objc_msgSend(v6, "closeGroup");
    BYTE3(self->super.mDynamicPatternOffsetsBySubpath) = 0;

  }
  v7 = *(void **)(&self->super.mOkayToSetGeometry + 3);
  *(_QWORD *)(&self->super.mOkayToSetGeometry + 3) = 0;

  v8.receiver = self;
  v8.super_class = (Class)CRLWPShapeLayout;
  -[CRLShapeLayout endDynamicOperation](&v8, "endDynamicOperation");
}

- (id)childSearchTargets
{
  void *v3;
  unsigned __int8 v4;
  NSArray *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPShapeLayout textLayout](self, "textLayout"));
  v4 = objc_msgSend(v3, "isInstructional");

  if ((v4 & 1) != 0)
    return &__NSArray0__struct;
  v7.receiver = self;
  v7.super_class = (Class)CRLWPShapeLayout;
  v6 = -[CRLCanvasLayout childSearchTargets](&v7, "childSearchTargets");
  return (id)objc_claimAutoreleasedReturnValue(v6);
}

- (_TtC8Freeform11CRLWPLayout)textLayout
{
  return *(_TtC8Freeform11CRLWPLayout **)((char *)&self->_storageRangeToFontSizeDict + 3);
}

- (BOOL)supportsInstructionalText
{
  return BYTE4(self->super.mDynamicPatternOffsetsBySubpath);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->_supportsInstructionalText + 2), 0);
  objc_storeStrong((id *)((char *)&self->_storageRangeToFontSizeDict + 3), 0);
  objc_storeStrong((id *)(&self->super.mOkayToSetGeometry + 3), 0);
}

- (BOOL)autosizes
{
  CRLWPShapeLayout *v2;
  _TtC8Freeform11CRLWPLayout *v3;
  _TtC8Freeform11CRLWPLayout *v4;
  unint64_t v5;

  v2 = self;
  v3 = -[CRLWPShapeLayout textLayout](v2, "textLayout");
  if (v3)
  {
    v4 = v3;
    v5 = -[CRLWPShapeLayout autosizeFlagsFor:](v2, "autosizeFlagsFor:", v3);

    return v5 != 0;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)autosizeFlagsFor:(id)a3
{
  id v4;
  CRLWPShapeLayout *v5;
  unint64_t v6;

  v4 = a3;
  v5 = self;
  v6 = _sSo16CRLWPShapeLayoutC8FreeformE13autosizeFlags3forSo013CRLWPAutoSizeE0VAC11CRLWPLayoutC_tF_0();

  return v6;
}

- (int64_t)verticalAlignmentFor:(id)a3
{
  id v4;
  CRLWPShapeLayout *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = _sSo16CRLWPShapeLayoutC8FreeformE17verticalAlignment3forSo013CRLWPVerticalE0VAC11CRLWPLayoutC_tF_0();

  return v6;
}

- (CGRect)nonAutosizedFrameFor:(id)a3
{
  id v4;
  CRLWPShapeLayout *v5;
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

  v4 = a3;
  v5 = self;
  v6 = CRLWPShapeLayout.nonAutosizedFrame(for:)((uint64_t)v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;

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

- (CGRect)autosizedFrameFor:(id)a3 textSize:(CGSize)a4
{
  id v5;
  CRLWPShapeLayout *v6;
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
  CGRect result;

  v5 = a3;
  v6 = self;
  v7 = _sSo16CRLWPShapeLayoutC8FreeformE14autosizedFrame3for8textSizeSo6CGRectVAC11CRLWPLayoutC_So6CGSizeVtF_0();
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)dependentsOf:(id)a3
{
  id v4;
  CRLWPShapeLayout *v5;
  double *v6;
  Class isa;

  v4 = a3;
  v5 = self;
  v6 = CRLWPShapeLayout.dependents(of:)(v4);

  sub_1004B8930(0, (unint64_t *)&qword_1013FC960, off_101229810);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (Class)repClassFor:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1004B8930(0, &qword_1013F0520, off_101229A28);
  return (Class)swift_getObjCClassFromMetadata(v3, v4);
}

- (BOOL)descendersCannotClip
{
  return 0;
}

- (id)interiorWrapSegmentsFor:(id)a3
{
  id v4;
  CRLWPShapeLayout *v5;
  _TtC8Freeform11CRLWPLayout *v6;
  _TtC8Freeform11CRLWPLayout *v7;
  id v8;
  char v9;
  CRLWrapSegments *v10;

  v4 = a3;
  v5 = self;
  v6 = -[CRLWPShapeLayout textLayout](v5, "textLayout");
  if (v6)
  {
    v7 = v6;
    type metadata accessor for CRLWPLayout();
    v8 = v4;
    v9 = static NSObject.== infix(_:_:)(v8, v7);

    v10 = 0;
    if ((v9 & 1) != 0)
      v10 = -[CRLWPShapeLayout interiorWrapSegments](v5, "interiorWrapSegments");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)maxAutoGrowLineWidthFor:(id)a3
{
  return 500.0;
}

- (double)maxAutoGrowBlockHeightFor:(id)a3
{
  return 16000.0;
}

- (int64_t)naturalAlignmentFor:(id)a3
{
  return 4;
}

- (BOOL)textLayoutShouldWrapAroundExternalDrawables:(id)a3
{
  return 1;
}

- (BOOL)textLayoutShouldLayoutVertically:(id)a3
{
  return 0;
}

- (double)defaultFontSize
{
  CRLWPShapeLayout *v2;
  double v3;

  v2 = self;
  v3 = CRLWPShapeLayout.defaultFontSize()();

  return v3;
}

- (id)makeStorageRangeToFontSizeDict
{
  CRLWPShapeLayout *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = CRLWPShapeLayout.makeStorageRangeToFontSizeDict()();

  sub_1004B8930(0, (unint64_t *)&qword_10140B930, NSValue_ptr);
  sub_1004B8930(0, (unint64_t *)&qword_1013F07F0, NSNumber_ptr);
  sub_10075ADF0();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (id)commandsToSetFontSizesWithFontRangeToSizeDict:(id)a3 scale:(double)a4
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  CRLWPShapeLayout *v11;
  double *v12;
  Class isa;

  v7 = sub_1004B8930(0, (unint64_t *)&qword_10140B930, NSValue_ptr);
  v8 = sub_1004B8930(0, (unint64_t *)&qword_1013F07F0, NSNumber_ptr);
  v9 = sub_10075ADF0();
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8, v9);
  v11 = self;
  v12 = sub_100759928(v10, a4);

  swift_bridgeObjectRelease(v10);
  type metadata accessor for CRLCommand();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v12);
  return isa;
}

- (CRLFill)instructionalTextCharacterFill
{
  return (CRLFill *)0;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  CRLWPShapeLayout *v4;
  double v5;
  double v6;

  v4 = self;
  _sSo16CRLWPShapeLayoutC8FreeformE5width14forColumnIndex9bodyWidth12CoreGraphics7CGFloatVSu_AItF_0();
  v6 = v5;

  return v6;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 target:(id)a5 outWidth:(double *)a6 outGap:(double *)a7
{
  CRLWPShapeLayout *v13;
  double v14;

  swift_unknownObjectRetain(a5);
  v13 = self;
  v14 = sub_10075AA98(a3, a6, a7, a4);
  swift_unknownObjectRelease(a5);

  return v14;
}

- (UIEdgeInsets)adjustedInsetsForTarget:(id)a3
{
  CRLWPShapeLayout *v5;
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
  UIEdgeInsets result;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = _sSo16CRLWPShapeLayoutC8FreeformE14adjustedInsets3forSo06UIEdgeE0VSo17CRLWPLayoutTarget_pSg_tF_0();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_unknownObjectRelease(a3);

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (CRLWPPadding)layoutMargins
{
  return (CRLWPPadding *)objc_msgSend(objc_allocWithZone((Class)CRLWPPadding), "init");
}

- (unint64_t)columnCount
{
  return 1;
}

- (BOOL)alwaysStartsNewTarget
{
  return 1;
}

- (BOOL)shrinkTextToFit
{
  CRLWPShapeLayout *v2;
  char v3;

  v2 = self;
  v3 = CRLWPShapeLayout.shrinkTextToFit.getter();

  return v3 & 1;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

@end
