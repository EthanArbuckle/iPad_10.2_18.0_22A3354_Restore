@implementation PFAITocConfigBody

- (void)createBodiesWithState:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  THModelBodyTextInfo *v14;

  v4 = objc_msgSend(a3, "pageInfo");
  +[PFXDrawablePlacement boundsWithProperties:readerState:](PFXDrawablePlacement, "boundsWithProperties:readerState:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "paginatedState"), "pageCache"), "pageWithIndex:", 0), a3);
  v9 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithPosition:size:", v5, v6, v7, v8);
  v14 = -[THModelBodyTextInfo initWithContext:geometry:]([THModelBodyTextInfo alloc], "initWithContext:geometry:", objc_msgSend(a3, "tspContext"), v9);
  v10 = objc_msgSend(objc_alloc((Class)TSSPropertyMap), "initWithCapacity:", 3);
  v11 = objc_msgSend(objc_alloc((Class)TSWPColumns), "initWithColumnCount:", 1);
  objc_msgSend(v10, "setObject:forProperty:", v11, 148);

  v12 = objc_alloc_init((Class)TSWPPadding);
  objc_msgSend(v10, "setObject:forProperty:", v12, 146);

  objc_msgSend(v10, "setIntValue:forProperty:", 0, 149);
  v13 = objc_msgSend(objc_alloc((Class)TSWPColumnStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), CFSTR("BOGUS Column Style Name"), v10, 0);
  -[THModelBodyTextInfo setColumnStyle:](v14, "setColumnStyle:", v13);
  -[THModelBodyTextInfo setExteriorTextWrap:](v14, "setExteriorTextWrap:", +[TSDExteriorTextWrap exteriorTextWrap](TSDExteriorTextWrap, "exteriorTextWrap"));
  objc_msgSend(v4, "addBodyBoxInfo:insertContext:", v14, 0);
  +[PFAITocConfigDrawablePlacement cacheDrawable:readerState:](PFAITocConfigDrawablePlacement, "cacheDrawable:readerState:", v14, a3);

}

- (void)addDrawablesToPageZOrderWithState:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = objc_msgSend(a3, "pageInfo");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "pageDrawableList", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(objc_msgSend(v4, "drawablesZOrder"), "addDrawable:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFAITocConfigBody;
  v4 = -[PFXBody mapStartElementWithState:](&v6, "mapStartElementWithState:");
  if (v4)
    objc_msgSend(objc_msgSend(a3, "thNodeBody"), "setNodeUniqueID:forInfo:", objc_msgSend(a3, "nodeGUID"), objc_msgSend(objc_msgSend(a3, "thNodeBody"), "bodyStorage"));
  return v4;
}

- (void)mapEndElementWithState:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFAITocConfigBody;
  -[PFXBody mapEndElementWithState:](&v5, "mapEndElementWithState:");
  if (xmlStrEqual((const xmlChar *)"body", (const xmlChar *)objc_msgSend(objc_msgSend(a3, "currentXmlStackEntry"), "xmlElementName")))
  {
    -[PFAITocConfigBody createBodiesWithState:](self, "createBodiesWithState:", a3);
    -[PFAITocConfigBody addDrawablesToPageZOrderWithState:](self, "addDrawablesToPageZOrderWithState:", a3);
  }
}

@end
