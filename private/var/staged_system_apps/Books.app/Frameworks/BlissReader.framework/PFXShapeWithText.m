@implementation PFXShapeWithText

- (PFXShapeWithText)init
{
  PFXShapeWithText *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFXShapeWithText;
  v2 = -[PFXShapeWithText init](&v4, "init");
  if (v2)
    v2->mTextBlockPropertyMap = (TSSPropertyMap *)objc_msgSend(objc_alloc((Class)TSSPropertyMap), "initWithCapacity:", 3);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXShapeWithText;
  -[PFXDrawable dealloc](&v3, "dealloc");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  __objc2_class **v9;
  id v10;
  id v11;
  double v12;
  objc_super v14;

  v5 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v6 = objc_msgSend(a3, "currentHtmlStackEntry");
  v7 = objc_msgSend(v6, "currentEntryMediaState");
  v14.receiver = self;
  v14.super_class = (Class)PFXShapeWithText;
  -[PFXDrawable mapStartElementWithState:](&v14, "mapStartElementWithState:", a3);
  v8 = objc_msgSend(a3, "isTOC");
  v9 = off_424F10;
  if (!v8)
    v9 = off_424F08;
  v10 = objc_msgSend(objc_alloc((Class)objc_opt_class(*v9)), "initWithContext:string:stylesheet:kind:", objc_msgSend(a3, "tspContext"), &stru_43D7D8, objc_msgSend(v5, "stylesheet"), 3);
  objc_msgSend(v7, "setOverriddenStorage:", v10);
  objc_msgSend(a3, "setCfiPathForInfo:fromStackEntry:", v10, v6);

  if (+[PFAIDualDrawable shouldImportInCurrentLayoutWithStackEntry:state:](PFAIDualDrawable, "shouldImportInCurrentLayoutWithStackEntry:state:", v6, a3))
  {
    objc_msgSend(a3, "setUniqueIdForInfo:fromStackEntry:", v10, v6);
  }
  v11 = objc_alloc_init((Class)objc_msgSend(a3, "textBodyClass"));
  -[PFXShapeWithText setBodyMapper:](self, "setBodyMapper:", v11);

  -[PFXBody mapStartElementWithState:](-[PFXShapeWithText bodyMapper](self, "bodyMapper"), "mapStartElementWithState:", a3);
  -[PFXDrawablePlacement bounds](self->super.mPlacement, "bounds");
  objc_msgSend(v7, "setBlockWidth:", v12);
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  char *v9;
  id v10;
  uint64_t v11;
  id v12;
  double y;
  id v14;
  id v15;
  id v16;
  id v17;
  TSDInfoGeometry *v18;
  id v19;
  id v20;
  char *i;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v5 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v6 = objc_msgSend(a3, "currentHtmlStackEntry");
  v7 = objc_msgSend(v6, "currentEntryMediaState");
  -[PFXShapeWithText setBodyMapper:](self, "setBodyMapper:", 0);
  v8 = objc_msgSend(v7, "storage");
  v9 = (char *)objc_msgSend(v7, "childResultCount");
  v10 = 0;
  if (v9 == (_BYTE *)&dword_0 + 1)
  {
    v10 = objc_msgSend(v7, "childResultAtIndex:", 0);
    v11 = objc_opt_class(TSWPShapeInfo);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      objc_msgSend(v10, "setValuesForProperties:", self->mTextBlockPropertyMap);
      objc_msgSend(v10, "setContainedStorage:", v8);
      -[PFXShapeWithText updateLineHintsWithShape:readerState:](self, "updateLineHintsWithShape:readerState:", v10, a3);
      v12 = objc_alloc_init((Class)NSMutableArray);
      objc_msgSend(v7, "setOverriddenStorage:", 0);
LABEL_7:
      for (i = 0; i != v9; ++i)
        objc_msgSend(v12, "addObject:", objc_msgSend(v7, "childResultAtIndex:", i));
      goto LABEL_9;
    }
  }
  v12 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v8, "characterCount"))
  {
    v24 = objc_msgSend(objc_alloc((Class)TSWPShapeStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), 0, self->mTextBlockPropertyMap, 0);
    objc_msgSend(objc_msgSend(v5, "stylesheet"), "addStyle:", v24);
    y = CGPointZero.y;
    -[PFXDrawablePlacement bounds](self->super.mPlacement, "bounds");
    v14 = objc_msgSend(objc_alloc((Class)TSDBezierPathSource), "initWithBezierPath:", +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", CGPointZero.x, y));
    v25 = v6;
    v15 = objc_alloc((Class)TSWPShapeInfo);
    v16 = v10;
    v17 = objc_msgSend(a3, "tspContext");
    v18 = -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry");
    v19 = v17;
    v10 = v16;
    v20 = objc_msgSend(v15, "initWithContext:geometry:style:pathSource:wpStorage:", v19, v18, v24, v14, v8);
    objc_msgSend(v20, "setTextUserEditable:", 0);
    objc_msgSend(v12, "addObject:", v20);

    v6 = v25;
  }
  objc_msgSend(v7, "setOverriddenStorage:", 0);
  if (v9)
    goto LABEL_7;
LABEL_9:
  if (objc_msgSend(v12, "count") == (char *)&dword_0 + 1)
  {
    v22 = objc_msgSend(v12, "lastObject");
  }
  else
  {
    v23 = objc_msgSend(v12, "count");
    v22 = v12;
    if ((unint64_t)v23 < 2)
      goto LABEL_13;
  }
  objc_msgSend(v7, "setResult:", v22);
LABEL_13:

  v26.receiver = self;
  v26.super_class = (Class)PFXShapeWithText;
  -[PFXDrawable mapEndElementWithState:](&v26, "mapEndElementWithState:", a3);
  if (objc_msgSend(a3, "isInsideWidget"))
    objc_msgSend(v6, "addChildAttributesToParentForResult:", v10);
}

- (TSSPropertyMap)textBlockPropertyMap
{
  return self->mTextBlockPropertyMap;
}

- (PFXBody)bodyMapper
{
  return self->mBodyMapper;
}

- (void)setBodyMapper:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
