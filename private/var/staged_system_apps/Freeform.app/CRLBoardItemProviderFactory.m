@implementation CRLBoardItemProviderFactory

- (CRLBoardItemProviderFactory)initWithBoardItemFactory:(id)a3
{
  id v4;
  CRLBoardItemProviderFactory *v5;
  CRLBoardItemProviderFactory *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLBoardItemProviderFactory;
  v5 = -[CRLBoardItemProviderFactory init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_boardItemFactory, v4);

  return v6;
}

- (id)styleMappingProvidersForPasteboardBoardItems:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  CRLStyleMappingBoardItemProvider *v12;
  CRLStyleMappingBoardItemProvider *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v4));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
          v12 = [CRLStyleMappingBoardItemProvider alloc];
          v13 = -[CRLStyleMappingBoardItemProvider initWithIngestibleBoardItem:](v12, "initWithIngestibleBoardItem:", v11, (_QWORD)v15);
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)providersForBoardItemsFromTextStorages:(id)a3 position:(CGPoint)a4 keepHighlights:(BOOL)a5
{
  double y;
  double x;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  CRLTextBoxingBoardItemProvider *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  y = a4.y;
  x = a4.x;
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = v8;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v15, "hasVisibleContent"))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemProviderFactory geometryForTextBoxWithPosition:](self, "geometryForTextBoxWithPosition:", x, y));
            v17 = -[CRLTextBoxingBoardItemProvider initWithTextStorage:geometry:]([CRLTextBoxingBoardItemProvider alloc], "initWithTextStorage:geometry:", v15, v16);
            if (v17)
            {
              if (!v12)
                v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v9, "count")));
              objc_msgSend(v12, "addObject:", v17);
            }
            x = x + 15.0;
            y = y + 15.0;

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    v8 = v19;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)providersForBoardItemsFromImportedText:(id)a3
{
  id v4;
  void *v5;
  CRLTextBoxingBoardItemProvider *v6;
  CRLTextBoxingBoardItemProvider *v7;
  void *v8;
  CRLTextBoxingBoardItemProvider *v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemProviderFactory geometryForTextBoxWithPosition:](self, "geometryForTextBoxWithPosition:", CGPointZero.x, CGPointZero.y));
    v6 = -[CRLTextBoxingBoardItemProvider initWithTextString:geometry:]([CRLTextBoxingBoardItemProvider alloc], "initWithTextString:geometry:", v4, v5);
    v7 = v6;
    if (v6)
    {
      v10 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)providersForBoardItemsFromImportedRichText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CRLTextBoxingBoardItemProvider *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemProviderFactory extractPasteboardBoardItemsFrom:](self, "extractPasteboardBoardItemsFrom:", v4));
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPStorageSanitizer filterText:removingAttachments:](CRLWPStorageSanitizer, "filterText:removingAttachments:", v4, 1));
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemProviderFactory geometryForTextBoxWithPosition:](self, "geometryForTextBoxWithPosition:", CGPointZero.x, CGPointZero.y));
    v9 = -[CRLTextBoxingBoardItemProvider initWithRichTextString:geometry:]([CRLTextBoxingBoardItemProvider alloc], "initWithRichTextString:geometry:", v7, v8);
    objc_msgSend(v5, "addObject:", v9);

  }
  return v5;
}

- (id)extractPasteboardBoardItemsFrom:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = objc_msgSend(v3, "length");
  if (objc_msgSend(v3, "containsAttachmentsInRange:", 0, v5))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002EB1E0;
    v7[3] = &unk_10124EF60;
    v8 = v4;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", NSAttachmentAttributeName, 0, v5, 0, v7);

  }
  return v4;
}

- (id)providersForBoardItemsFromURLs:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crl_arrayByTransformingWithBlock:", &stru_10124EFA0));
  else
    v4 = 0;

  return v4;
}

- (id)providerForBoardItemFromDetectedImportableURL:(id)a3 fallbackBoardItemProvider:(id)a4
{
  id v5;
  id v6;
  CRLURLBoardItemProvider *v7;

  v5 = a3;
  v6 = a4;
  if (+[CRLURLBoardItemProvider canInitWithURL:](CRLURLBoardItemProvider, "canInitWithURL:", v5))
    v7 = -[CRLURLBoardItemProvider initWithURL:fallbackBoardItemProvider:isDetectedURL:suggestedName:]([CRLURLBoardItemProvider alloc], "initWithURL:fallbackBoardItemProvider:isDetectedURL:suggestedName:", v5, v6, 1, 0);
  else
    v7 = 0;

  return v7;
}

- (id)geometryForTextBoxWithPosition:(CGPoint)a3
{
  CRLCanvasMutableInfoGeometry *v3;

  v3 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasMutableInfoGeometry alloc], "initWithPosition:size:", a3.x, a3.y, CGSizeZero.width, CGSizeZero.height);
  -[CRLCanvasMutableInfoGeometry setWidthValid:](v3, "setWidthValid:", 0);
  -[CRLCanvasMutableInfoGeometry setHeightValid:](v3, "setHeightValid:", 0);
  return v3;
}

- (_TtC8Freeform19CRLBoardItemFactory)boardItemFactory
{
  return (_TtC8Freeform19CRLBoardItemFactory *)objc_loadWeakRetained((id *)&self->_boardItemFactory);
}

- (void)setBoardItemFactory:(id)a3
{
  objc_storeWeak((id *)&self->_boardItemFactory, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_boardItemFactory);
}

@end
