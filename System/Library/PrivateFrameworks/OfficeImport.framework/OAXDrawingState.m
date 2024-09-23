@implementation OAXDrawingState

- (OAXDrawingState)initWithClient:(id)a3
{
  id v5;
  OAXDrawingState *v6;
  OAXDrawingState *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *mShapeIdMap;
  NSMutableDictionary *v10;
  NSMutableDictionary *mDrawableIdToVmlShapeIdMap;
  NSMutableArray *v12;
  NSMutableArray *mGroupStack;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OAXDrawingState;
  v6 = -[OCXState init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mClient, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mShapeIdMap = v7->mShapeIdMap;
    v7->mShapeIdMap = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mDrawableIdToVmlShapeIdMap = v7->mDrawableIdToVmlShapeIdMap;
    v7->mDrawableIdToVmlShapeIdMap = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mGroupStack = v7->mGroupStack;
    v7->mGroupStack = v12;

  }
  return v7;
}

- (void)setOavState:(id)a3
{
  objc_storeStrong((id *)&self->mOavState, a3);
}

- (void)setTargetBlipCollection:(id)a3
{
  NSMutableDictionary *mSrcURLToTgtBlipIndexMap;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  OADBlipCollection *v8;

  v8 = (OADBlipCollection *)a3;
  if (self->mTgtBlipCollection != v8)
    objc_storeStrong((id *)&self->mTgtBlipCollection, a3);
  mSrcURLToTgtBlipIndexMap = self->mSrcURLToTgtBlipIndexMap;
  if (mSrcURLToTgtBlipIndexMap)
  {
    self->mSrcURLToTgtBlipIndexMap = 0;

  }
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = self->mSrcURLToTgtBlipIndexMap;
  self->mSrcURLToTgtBlipIndexMap = v6;

}

- (void)setPackagePart:(id)a3
{
  objc_storeStrong((id *)&self->mPackagePart, a3);
}

- (void)setStyleMatrix:(id)a3
{
  objc_storeStrong((id *)&self->mStyleMatrix, a3);
}

- (id)styleMatrix
{
  return self->mStyleMatrix;
}

- (id)packagePart
{
  return self->mPackagePart;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->mColorScheme, a3);
}

- (void)resetForNewDrawing
{
  -[NSMutableDictionary removeAllObjects](self->mShapeIdMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->mDrawableIdToVmlShapeIdMap, "removeAllObjects");
}

- (id)blipRefForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[OADBlipCollection blips](self->mTgtBlipCollection, "blips");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState blipRefWithURL:blipArray:blipURLtoIndexMap:](self, "blipRefWithURL:blipArray:blipURLtoIndexMap:", v4, v5, self->mSrcURLToTgtBlipIndexMap);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "index");
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OADBlipRef blipRefWithIndex:name:blip:](OADBlipRef, "blipRefWithIndex:name:blip:", (v7 + 1), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)blipRefWithURL:(id)a3 blipArray:(id)a4 blipURLtoIndexMap:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _DWORD *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  OADSubBlip *v26;
  OAXBlipContext *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  OADBlip *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *context;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  v8 = a3;
  v43 = a4;
  v9 = a5;
  if (v8)
  {
    -[OCPPackagePart package](self->mPackagePart, "package");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "partForLocation:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "location");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByDeletingPathExtension");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v15;
      if (v15)
      {
        v16 = objc_msgSend(v15, "intValue");
        objc_msgSend(v43, "objectAtIndex:", (int)v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (_DWORD *)objc_msgSend(v17, "referenceCount");
        ++*v18;
        +[OADBlipRef blipRefWithIndex:name:blip:](OADBlipRef, "blipRefWithIndex:name:blip:", v16, v42, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = v14;
        -[OCPPackagePart package](self->mPackagePart, "package");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "contentTypeForPartLocation:", v8);
        v21 = objc_claimAutoreleasedReturnValue();

        v40 = (void *)v21;
        v22 = +[OADBlipRef blipTypeForContentType:](OADBlipRef, "blipTypeForContentType:", v21);
        if ((_DWORD)v22)
          goto LABEL_10;
        objc_msgSend(v8, "pathExtension");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = +[OADBlipRef blipTypeForExtension:](OADBlipRef, "blipTypeForExtension:", v23);

        if ((_DWORD)v22)
          goto LABEL_10;
        context = (void *)MEMORY[0x22E2DDB58]();
        -[OCPPackagePart package](self->mPackagePart, "package");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "partForLocation:", v8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "data");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = +[OADBlipRef blipTypeForImageData:](OADBlipRef, "blipTypeForImageData:", v25);

        objc_autoreleasePoolPop(context);
        if ((_DWORD)v22)
        {
LABEL_10:
          v26 = -[OADSubBlip initWithData:type:]([OADSubBlip alloc], "initWithData:type:", 0, v22);
          v27 = [OAXBlipContext alloc];
          -[OCPPackagePart package](self->mPackagePart, "package");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[OCXDelayedMediaContext initWithTargetLocation:package:](v27, "initWithTargetLocation:package:", v8, v28);

          v38 = (void *)v29;
          -[OCDDelayedNode setDelayedContext:](v26, "setDelayedContext:", v29);
          objc_msgSend(v11, "data");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[OADSubBlip setSizeInBytes:](v26, "setSizeInBytes:", objc_msgSend(v30, "length"));

          v31 = objc_alloc_init(OADBlip);
          -[OADBlip setMainSubBlip:](v31, "setMainSubBlip:", v26);
          objc_msgSend(v43, "addObject:", v31);
          *-[OADBlip referenceCount](v31, "referenceCount") = 1;
          v32 = objc_msgSend(v43, "count") - 1;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v33, v13);

          +[OADBlipRef blipRefWithIndex:name:blip:](OADBlipRef, "blipRefWithIndex:name:blip:", v32, v42, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[OCPPackagePart package](self->mPackagePart, "package");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "resetPartForLocation:", v8);

          v14 = v39;
        }
        else
        {
          +[OADBlipRef blipRefWithIndex:name:blip:](OADBlipRef, "blipRefWithIndex:name:blip:", 0xFFFFFFFFLL, 0, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v17 = v40;
      }

    }
    else
    {
      +[OADBlipRef blipRefWithIndex:name:blip:](OADBlipRef, "blipRefWithIndex:name:blip:", 0xFFFFFFFFLL, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[OADBlipRef blipRefWithIndex:name:blip:](OADBlipRef, "blipRefWithIndex:name:blip:", 0xFFFFFFFFLL, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (BOOL)isInsideGroup
{
  return -[NSMutableArray count](self->mGroupStack, "count") != 0;
}

- (id)client
{
  return self->mClient;
}

- (id)oavState
{
  return self->mOavState;
}

- (void)setDrawable:(id)a3 forShapeId:(unsigned int)a4
{
  uint64_t v4;
  NSMutableDictionary *mShapeIdMap;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)&a4;
  v11 = a3;
  mShapeIdMap = self->mShapeIdMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mShapeIdMap, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setId:", v4);
  v9 = self->mShapeIdMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v11, v10);

}

- (id)targetBlipCollection
{
  return self->mTgtBlipCollection;
}

- (void)setDocumentState:(id)a3
{
  id v4;

  v4 = a3;
  objc_storeWeak(&self->mDocumentState, v4);
  -[OAXDrawingState setupNSForXMLFormat:](self, "setupNSForXMLFormat:", objc_msgSend(v4, "xmlFormat"));

}

- (void)setTargetBulletBlipArray:(id)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *mSrcURLToTgtBulletBlipIndexMap;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->mTgtBulletBlips, a3);
  if (self->mTgtBulletBlips)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mSrcURLToTgtBulletBlipIndexMap = self->mSrcURLToTgtBulletBlipIndexMap;
    self->mSrcURLToTgtBulletBlipIndexMap = v5;

  }
}

- (void)setTableStyleCache:(id)a3
{
  objc_storeStrong((id *)&self->mTableStyleCache, a3);
}

- (void)setFontScheme:(id)a3
{
  objc_storeStrong((id *)&self->mFontScheme, a3);
}

- (void)setColorMap:(id)a3
{
  objc_storeStrong((id *)&self->mColorMap, a3);
}

- (id)tableStyleCache
{
  return self->mTableStyleCache;
}

- (NSMutableDictionary)sourceURLToTargetBlipIndexMap
{
  return self->mSrcURLToTgtBlipIndexMap;
}

- (NSMutableDictionary)sourceURLToTargetBulletBlipIndexMap
{
  return self->mSrcURLToTgtBulletBlipIndexMap;
}

- (void)setSourceURLToTargetBlipIndexMap:(id)a3
{
  objc_storeStrong((id *)&self->mSrcURLToTgtBlipIndexMap, a3);
}

- (void)setSourceURLToTargetBulletBlipIndexMap:(id)a3
{
  objc_storeStrong((id *)&self->mSrcURLToTgtBulletBlipIndexMap, a3);
}

- (id)popGroup
{
  void *v3;

  -[OAXDrawingState peekGroup](self, "peekGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->mGroupStack, "removeLastObject");
  return v3;
}

- (id)drawableForShapeId:(unsigned int)a3
{
  NSMutableDictionary *mShapeIdMap;
  void *v4;
  void *v5;

  mShapeIdMap = self->mShapeIdMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mShapeIdMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bulletBlipRefForURL:(id)a3
{
  -[OAXDrawingState blipRefWithURL:blipArray:blipURLtoIndexMap:](self, "blipRefWithURL:blipArray:blipURLtoIndexMap:", a3, self->mTgtBulletBlips, self->mSrcURLToTgtBulletBlipIndexMap);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)documentState
{
  return objc_loadWeakRetained(&self->mDocumentState);
}

- (id)colorScheme
{
  return self->mColorScheme;
}

- (id)colorMap
{
  return self->mColorMap;
}

- (id)fontScheme
{
  return self->mFontScheme;
}

- (void)clearTargetBlipCollection
{
  OADBlipCollection *mTgtBlipCollection;
  NSMutableDictionary *mSrcURLToTgtBlipIndexMap;

  mTgtBlipCollection = self->mTgtBlipCollection;
  self->mTgtBlipCollection = 0;

  mSrcURLToTgtBlipIndexMap = self->mSrcURLToTgtBlipIndexMap;
  self->mSrcURLToTgtBlipIndexMap = 0;

}

- (OAXDrawingState)init
{

  return 0;
}

- (id)appVersion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[OAXDrawingState packagePart](self, "packagePart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "package");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vmlShapeIdForDrawableId:(unsigned int)a3
{
  NSMutableDictionary *mDrawableIdToVmlShapeIdMap;
  void *v4;
  void *v5;

  mDrawableIdToVmlShapeIdMap = self->mDrawableIdToVmlShapeIdMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mDrawableIdToVmlShapeIdMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setVmlShapeId:(id)a3 forDrawableId:(unsigned int)a4
{
  NSMutableDictionary *mDrawableIdToVmlShapeIdMap;
  void *v7;
  id v8;

  v8 = a3;
  mDrawableIdToVmlShapeIdMap = self->mDrawableIdToVmlShapeIdMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mDrawableIdToVmlShapeIdMap, "setObject:forKey:", v8, v7);

}

- (void)pushGroup:(id)a3
{
  -[NSMutableArray addObject:](self->mGroupStack, "addObject:", a3);
}

- (id)peekGroup
{
  return (id)-[NSMutableArray lastObject](self->mGroupStack, "lastObject");
}

- (void)replaceGroupStack:(id)a3
{
  objc_storeStrong((id *)&self->mGroupStack, a3);
}

- (void)setupNSForXMLFormat:(int)a3
{
  CXNamespace *v5;
  CXNamespace *v6;
  CXNamespace *v7;
  CXNamespace *v8;
  CXNamespace *v9;
  CXNamespace *v10;
  CXNamespace *v11;
  CXNamespace *v12;
  CXNamespace *v13;
  CXNamespace *v14;
  CXNamespace *v15;
  CXNamespace *v16;
  CXNamespace *v17;
  CXNamespace *v18;
  CXNamespace *v19;
  CXNamespace *v20;
  CXNamespace *v21;
  CXNamespace *v22;
  CXNamespace *v23;
  CXNamespace *v24;
  CXNamespace *v25;
  CXNamespace *v26;
  CXNamespace *v27;
  CXNamespace *v28;
  CXNamespace *v29;
  CXNamespace *v30;
  CXNamespace *v31;
  CXNamespace *v32;
  CXNamespace *v33;
  CXNamespace *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)OAXDrawingState;
  -[OCXState setupNSForXMLFormat:](&v35, sel_setupNSForXMLFormat_);
  v5 = [CXNamespace alloc];
  v6 = v5;
  if (a3)
  {
    v7 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/main");
    v8 = -[CXNamespace initWithUri:fallbackNamespace:](v6, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/drawingml/main", v7);
    -[OAXDrawingState setOAXMainNamespace:](self, "setOAXMainNamespace:", v8);

    v9 = [CXNamespace alloc];
    v10 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/chart");
    v11 = -[CXNamespace initWithUri:fallbackNamespace:](v9, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/drawingml/chart", v10);
    -[OAXDrawingState setOAXChartNamespace:](self, "setOAXChartNamespace:", v11);

    v12 = [CXNamespace alloc];
    v13 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/chartDrawing");
    v14 = -[CXNamespace initWithUri:fallbackNamespace:](v12, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/drawingml/chartDrawing", v13);
    -[OAXDrawingState setOAXChartDrawingNamespace:](self, "setOAXChartDrawingNamespace:", v14);

    v15 = [CXNamespace alloc];
    v16 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/lockedCanvas");
    v17 = -[CXNamespace initWithUri:fallbackNamespace:](v15, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/drawingml/lockedCanvas", v16);
    -[OAXDrawingState setOAXLockedCanvasNamespace:](self, "setOAXLockedCanvasNamespace:", v17);

    v18 = [CXNamespace alloc];
    v19 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/picture");
    v20 = -[CXNamespace initWithUri:fallbackNamespace:](v18, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/drawingml/picture", v19);
    -[OAXDrawingState setOAXPictureNamespace:](self, "setOAXPictureNamespace:", v20);

    v21 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/table");
    -[OAXDrawingState setOAXTableNamespace:](self, "setOAXTableNamespace:", v21);

    v22 = [CXNamespace alloc];
    v23 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/wordprocessingml/2006/main");
    v24 = -[CXNamespace initWithUri:fallbackNamespace:](v22, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/wordprocessingml/main", v23);
    -[OAXDrawingState setOAXWordProcessingMLNamespace:](self, "setOAXWordProcessingMLNamespace:", v24);

    v25 = [CXNamespace alloc];
    v26 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/math");
    v27 = -[CXNamespace initWithUri:fallbackNamespace:](v25, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/officeDocument/math", v26);
    -[OAXDrawingState setOAXMathNamespace:](self, "setOAXMathNamespace:", v27);

  }
  else
  {
    v28 = -[CXNamespace initWithUri:](v5, "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/main");
    -[OAXDrawingState setOAXMainNamespace:](self, "setOAXMainNamespace:", v28);

    v29 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/chart");
    -[OAXDrawingState setOAXChartNamespace:](self, "setOAXChartNamespace:", v29);

    v30 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/chartDrawing");
    -[OAXDrawingState setOAXChartDrawingNamespace:](self, "setOAXChartDrawingNamespace:", v30);

    v31 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/lockedCanvas");
    -[OAXDrawingState setOAXLockedCanvasNamespace:](self, "setOAXLockedCanvasNamespace:", v31);

    v32 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/picture");
    -[OAXDrawingState setOAXPictureNamespace:](self, "setOAXPictureNamespace:", v32);

    v33 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/table");
    -[OAXDrawingState setOAXTableNamespace:](self, "setOAXTableNamespace:", v33);

    v34 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/wordprocessingml/2006/main");
    -[OAXDrawingState setOAXWordProcessingMLNamespace:](self, "setOAXWordProcessingMLNamespace:", v34);

    v26 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/math");
    -[OAXDrawingState setOAXMathNamespace:](self, "setOAXMathNamespace:", v26);
  }

  -[OAXDrawingState setOAXCompatNamespace:](self, "setOAXCompatNamespace:", OAXCompatNamespace);
  -[OAXDrawingState setOAXChart2012Namespace:](self, "setOAXChart2012Namespace:", OAXChart2012Namespace);
  -[OAXDrawingState setOAXDrawing2010Namespace:](self, "setOAXDrawing2010Namespace:", OAXDrawing2010Namespace);
}

- (CXNamespace)OAXMainNamespace
{
  return self->mOAXMainNamespace;
}

- (void)setOAXMainNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mOAXMainNamespace, a3);
}

- (CXNamespace)OAXChartNamespace
{
  return self->mOAXChartNamespace;
}

- (void)setOAXChartNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mOAXChartNamespace, a3);
}

- (CXNamespace)OAXChartDrawingNamespace
{
  return self->mOAXChartDrawingNamespace;
}

- (void)setOAXChartDrawingNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mOAXChartDrawingNamespace, a3);
}

- (CXNamespace)OAXCompatNamespace
{
  return self->mOAXCompatNamespace;
}

- (void)setOAXCompatNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mOAXCompatNamespace, a3);
}

- (CXNamespace)OAXLockedCanvasNamespace
{
  return self->mOAXLockedCanvasNamespace;
}

- (void)setOAXLockedCanvasNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mOAXLockedCanvasNamespace, a3);
}

- (CXNamespace)OAXPictureNamespace
{
  return self->mOAXPictureNamespace;
}

- (void)setOAXPictureNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mOAXPictureNamespace, a3);
}

- (CXNamespace)OAXTableNamespace
{
  return self->mOAXTableNamespace;
}

- (void)setOAXTableNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mOAXTableNamespace, a3);
}

- (CXNamespace)OAXWordProcessingMLNamespace
{
  return self->mOAXWordProcessingMLNamespace;
}

- (void)setOAXWordProcessingMLNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mOAXWordProcessingMLNamespace, a3);
}

- (CXNamespace)OAXDrawing2010Namespace
{
  return self->mOAXDrawing2010Namespace;
}

- (void)setOAXDrawing2010Namespace:(id)a3
{
  objc_storeStrong((id *)&self->mOAXDrawing2010Namespace, a3);
}

- (CXNamespace)OAXChart2012Namespace
{
  return self->mOAXChart2012Namespace;
}

- (void)setOAXChart2012Namespace:(id)a3
{
  objc_storeStrong((id *)&self->mOAXChart2012Namespace, a3);
}

- (CXNamespace)OAXMathNamespace
{
  return self->mOAXMathNamespace;
}

- (void)setOAXMathNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mOAXMathNamespace, a3);
}

- (id)clientChartGraphicPropertyDefaultsBlock
{
  return self->_clientChartGraphicPropertyDefaultsBlock;
}

- (void)setClientChartGraphicPropertyDefaultsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientChartGraphicPropertyDefaultsBlock, 0);
  objc_destroyWeak(&self->mDocumentState);
  objc_storeStrong((id *)&self->mOAXMathNamespace, 0);
  objc_storeStrong((id *)&self->mOAXChart2012Namespace, 0);
  objc_storeStrong((id *)&self->mOAXDrawing2010Namespace, 0);
  objc_storeStrong((id *)&self->mOAXWordProcessingMLNamespace, 0);
  objc_storeStrong((id *)&self->mOAXTableNamespace, 0);
  objc_storeStrong((id *)&self->mOAXPictureNamespace, 0);
  objc_storeStrong((id *)&self->mOAXLockedCanvasNamespace, 0);
  objc_storeStrong((id *)&self->mOAXCompatNamespace, 0);
  objc_storeStrong((id *)&self->mOAXChartDrawingNamespace, 0);
  objc_storeStrong((id *)&self->mOAXChartNamespace, 0);
  objc_storeStrong((id *)&self->mOAXMainNamespace, 0);
  objc_storeStrong((id *)&self->mGroupStack, 0);
  objc_storeStrong((id *)&self->mFontScheme, 0);
  objc_storeStrong((id *)&self->mColorMap, 0);
  objc_storeStrong((id *)&self->mColorScheme, 0);
  objc_storeStrong((id *)&self->mOavState, 0);
  objc_storeStrong((id *)&self->mSrcURLToTgtBulletBlipIndexMap, 0);
  objc_storeStrong((id *)&self->mTgtBulletBlips, 0);
  objc_storeStrong((id *)&self->mSrcURLToTgtBlipIndexMap, 0);
  objc_storeStrong((id *)&self->mTgtBlipCollection, 0);
  objc_storeStrong((id *)&self->mDrawableIdToVmlShapeIdMap, 0);
  objc_storeStrong((id *)&self->mShapeIdMap, 0);
  objc_storeStrong((id *)&self->mTableStyleCache, 0);
  objc_storeStrong((id *)&self->mStyleMatrix, 0);
  objc_storeStrong((id *)&self->mPackagePart, 0);
  objc_storeStrong((id *)&self->mClient, 0);
}

@end
