@implementation PXPresentationState

- (PXPresentationState)init
{
  PXPresentationState *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mModelObjects;
  PXOfficeArtClient *v5;
  OAXDrawingState *v6;
  OAXDrawingState *mOfficeArtState;
  PXVmlState *v8;
  OAVReadState *mOAVState;
  OAXTableStyleCache *v10;
  OAXTableStyleCache *mTableStyleCache;
  NSMutableDictionary *v12;
  NSMutableDictionary *mSlideURLToIndexMap;
  NSMutableDictionary *v14;
  NSMutableDictionary *mCommentAuthorIdToIndexMap;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXPresentationState;
  v2 = -[OCXState init](&v17, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mModelObjects = v2->mModelObjects;
    v2->mModelObjects = v3;

    v5 = -[PXOfficeArtClient initWithState:]([PXOfficeArtClient alloc], "initWithState:", v2);
    v6 = -[OAXDrawingState initWithClient:]([OAXDrawingState alloc], "initWithClient:", v5);
    mOfficeArtState = v2->mOfficeArtState;
    v2->mOfficeArtState = v6;

    v8 = -[OAVReadState initWithClient:packagePart:]([PXVmlState alloc], "initWithClient:packagePart:", objc_opt_class(), 0);
    mOAVState = v2->mOAVState;
    v2->mOAVState = &v8->super;

    -[OAXDrawingState setDocumentState:](v2->mOfficeArtState, "setDocumentState:", v2);
    -[OAXDrawingState setOavState:](v2->mOfficeArtState, "setOavState:", v2->mOAVState);
    -[OAVReadState setOaxState:](v2->mOAVState, "setOaxState:", v2->mOfficeArtState);
    v10 = objc_alloc_init(OAXTableStyleCache);
    mTableStyleCache = v2->mTableStyleCache;
    v2->mTableStyleCache = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mSlideURLToIndexMap = v2->mSlideURLToIndexMap;
    v2->mSlideURLToIndexMap = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mCommentAuthorIdToIndexMap = v2->mCommentAuthorIdToIndexMap;
    v2->mCommentAuthorIdToIndexMap = v14;

    +[PXPresentationState setPptChartGraphicPropertyDefaultBlock:](PXPresentationState, "setPptChartGraphicPropertyDefaultBlock:", v2->mOfficeArtState);
  }
  return v2;
}

- (void)setCancelDelegate:(id)a3
{
  objc_storeStrong((id *)&self->mCancel, a3);
}

- (void)setTgtPresentation:(id)a3
{
  OAXDrawingState *mOfficeArtState;
  void *v6;
  OAXDrawingState *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->mTgtPresentation, a3);
  mOfficeArtState = self->mOfficeArtState;
  objc_msgSend(v9, "blips");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState setTargetBlipCollection:](mOfficeArtState, "setTargetBlipCollection:", v6);

  v7 = self->mOfficeArtState;
  objc_msgSend(v9, "bulletBlips");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState setTargetBulletBlipArray:](v7, "setTargetBulletBlipArray:", v8);

}

- (void)setSlideIndex:(int64_t)a3 forSlideURL:(id)a4
{
  NSMutableDictionary *mSlideURLToIndexMap;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  mSlideURLToIndexMap = self->mSlideURLToIndexMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mSlideURLToIndexMap, "setObject:forKey:", v7, v8);

}

- (id)tableStyleCache
{
  return self->mTableStyleCache;
}

- (id)officeArtState
{
  return self->mOfficeArtState;
}

- (BOOL)isCancelled
{
  return -[TCCancelDelegate isCancelled](self->mCancel, "isCancelled");
}

- (id)tgtPresentation
{
  return self->mTgtPresentation;
}

- (void)resetOfficeArtState
{
  void *v3;
  void *v4;
  OAXDrawingState *mOfficeArtState;
  PXOfficeArtClient *v6;
  OAXDrawingState *v7;
  OAXDrawingState *v8;
  OAXDrawingState *v9;
  void *v10;
  OAXDrawingState *v11;
  void *v12;
  id v13;

  -[OAXDrawingState styleMatrix](self->mOfficeArtState, "styleMatrix");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState sourceURLToTargetBlipIndexMap](self->mOfficeArtState, "sourceURLToTargetBlipIndexMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState sourceURLToTargetBulletBlipIndexMap](self->mOfficeArtState, "sourceURLToTargetBulletBlipIndexMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  mOfficeArtState = self->mOfficeArtState;
  self->mOfficeArtState = 0;

  v6 = -[PXOfficeArtClient initWithState:]([PXOfficeArtClient alloc], "initWithState:", self);
  v7 = -[OAXDrawingState initWithClient:]([OAXDrawingState alloc], "initWithClient:", v6);
  v8 = self->mOfficeArtState;
  self->mOfficeArtState = v7;

  -[OAXDrawingState setDocumentState:](self->mOfficeArtState, "setDocumentState:", self);
  -[OAXDrawingState setOavState:](self->mOfficeArtState, "setOavState:", self->mOAVState);
  -[OAVReadState setOaxState:](self->mOAVState, "setOaxState:", self->mOfficeArtState);
  v9 = self->mOfficeArtState;
  -[OCDDocument blips](self->mTgtPresentation, "blips");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState setTargetBlipCollection:](v9, "setTargetBlipCollection:", v10);

  v11 = self->mOfficeArtState;
  -[PDPresentation bulletBlips](self->mTgtPresentation, "bulletBlips");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState setTargetBulletBlipArray:](v11, "setTargetBulletBlipArray:", v12);

  -[OAXDrawingState setStyleMatrix:](self->mOfficeArtState, "setStyleMatrix:", v13);
  -[OAXDrawingState setSourceURLToTargetBlipIndexMap:](self->mOfficeArtState, "setSourceURLToTargetBlipIndexMap:", v3);
  -[OAXDrawingState setSourceURLToTargetBulletBlipIndexMap:](self->mOfficeArtState, "setSourceURLToTargetBulletBlipIndexMap:", v4);
  +[PXPresentationState setPptChartGraphicPropertyDefaultBlock:](PXPresentationState, "setPptChartGraphicPropertyDefaultBlock:", self->mOfficeArtState);

}

- (void)setModelObject:(id)a3 forLocation:(id)a4
{
  NSMutableDictionary *mModelObjects;
  void *v7;
  id v8;

  v8 = a3;
  mModelObjects = self->mModelObjects;
  objc_msgSend(a4, "absoluteURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mModelObjects, "setObject:forKey:", v8, v7);

}

- (id)modelObjectForLocation:(id)a3
{
  NSMutableDictionary *mModelObjects;
  void *v4;
  void *v5;

  mModelObjects = self->mModelObjects;
  objc_msgSend(a3, "absoluteURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mModelObjects, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (TCCancelDelegate)cancelDelegate
{
  return self->mCancel;
}

- (int64_t)slideIndexForSlideURL:(id)a3
{
  NSMutableDictionary *mSlideURLToIndexMap;
  void *v4;
  void *v5;
  int64_t v6;

  mSlideURLToIndexMap = self->mSlideURLToIndexMap;
  objc_msgSend(a3, "absoluteURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mSlideURLToIndexMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "integerValue");
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

- (id)oavState
{
  return self->mOAVState;
}

+ (void)setPptChartGraphicPropertyDefaultBlock:(id)a3
{
  objc_msgSend(a3, "setClientChartGraphicPropertyDefaultsBlock:", &__block_literal_global_103);
}

id __62__PXPresentationState_setPptChartGraphicPropertyDefaultBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = a3;
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_class();
        TSUDynamicCast(v10, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("AutomaticChartMarkerSize"), (_QWORD)v16)
          && objc_msgSend(v4, "hasStroke"))
        {
          v12 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v4, "stroke");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "width");
          objc_msgSend(v12, "numberWithDouble:", floor(v14 * 2.0 + 3.0));
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_12;
        }

      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)setupNSForXMLFormat:(int)a3
{
  uint64_t v3;
  CXNamespace *v5;
  CXNamespace *v6;
  CXNamespace *v7;
  CXNamespace *v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPresentationState;
  -[OCXState setupNSForXMLFormat:](&v9, sel_setupNSForXMLFormat_);
  v5 = [CXNamespace alloc];
  v6 = v5;
  if ((_DWORD)v3)
  {
    v7 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/presentationml/2006/main");
    v8 = -[CXNamespace initWithUri:fallbackNamespace:](v6, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/presentationml/main", v7);
    -[PXPresentationState setPXPresentationMLNamespace:](self, "setPXPresentationMLNamespace:", v8);

  }
  else
  {
    v7 = -[CXNamespace initWithUri:](v5, "initWithUri:", "http://schemas.openxmlformats.org/presentationml/2006/main");
    -[PXPresentationState setPXPresentationMLNamespace:](self, "setPXPresentationMLNamespace:", v7);
  }

  -[OAXDrawingState setupNSForXMLFormat:](self->mOfficeArtState, "setupNSForXMLFormat:", v3);
  -[OCXState setupNSForXMLFormat:](self->mOAVState, "setupNSForXMLFormat:", v3);
}

- (NSMutableDictionary)commentAuthorIdToIndexMap
{
  return self->mCommentAuthorIdToIndexMap;
}

- (CXNamespace)PXPresentationMLNamespace
{
  return self->mPXPresentationMLNamespace;
}

- (void)setPXPresentationMLNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mPXPresentationMLNamespace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCommentAuthorIdToIndexMap, 0);
  objc_storeStrong((id *)&self->mPXPresentationMLNamespace, 0);
  objc_storeStrong((id *)&self->mCancel, 0);
  objc_storeStrong((id *)&self->mTgtPresentation, 0);
  objc_storeStrong((id *)&self->mSlideURLToIndexMap, 0);
  objc_storeStrong((id *)&self->mTableStyleCache, 0);
  objc_storeStrong((id *)&self->mOAVState, 0);
  objc_storeStrong((id *)&self->mOfficeArtState, 0);
  objc_storeStrong((id *)&self->mModelObjects, 0);
}

@end
