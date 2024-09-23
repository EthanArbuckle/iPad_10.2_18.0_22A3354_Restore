@implementation PFEIBody

- (id)_columnStyleWithReaderState:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = objc_msgSend(objc_alloc((Class)TSWPColumns), "initWithColumnCount:", 1);
  v5 = objc_msgSend(objc_alloc((Class)TSWPPadding), "initWithTopInset:leftInset:bottomInset:rightInset:", 0.0, 0.0, 0.0, 0.0);
  v6 = objc_msgSend(objc_alloc((Class)TSSPropertyMap), "initWithCapacity:", 3);
  objc_msgSend(v6, "setObject:forProperty:", v4, 148);
  objc_msgSend(v6, "setObject:forProperty:", v5, 146);
  objc_msgSend(v6, "setIntValue:forProperty:", 0, 149);
  v7 = objc_msgSend(objc_alloc((Class)TSWPColumnStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), CFSTR("Flow Column Style"), v6, 0);

  return v7;
}

- (id)_propertySetForFlowBodyWithStyleCache:(id)a3
{
  PFSStyleSelector *v4;
  id v5;

  v4 = objc_alloc_init(PFSStyleSelector);
  PFSStyleSimpleSelector::setElement((PFSStyleSimpleSelector *)-[PFSStyleSelector addSimpleSelector](v4, "addSimpleSelector"), "html");
  PFSStyleSimpleSelector::setElement((PFSStyleSimpleSelector *)-[PFSStyleSelector addSimpleSelector](v4, "addSimpleSelector"), "body");
  -[PFSStyleSelector freeze](v4, "freeze");
  v5 = objc_msgSend(a3, "createPropertySetWithSelector:", v4);

  return v5;
}

- (void)_createNodeContentsWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  double v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  THModelBodyTextInfo *v20;
  THModelFlowPageInfo *v21;

  v5 = objc_msgSend(a3, "orientationState");
  v6 = objc_msgSend(v5, "contentNodeBody");
  v7 = -[PFEIBody _propertySetForFlowBodyWithStyleCache:](self, "_propertySetForFlowBodyWithStyleCache:", objc_msgSend(v5, "styleCache"));
  v21 = -[THModelPageInfo initWithContext:]([THModelFlowPageInfo alloc], "initWithContext:", objc_msgSend(a3, "tspContext"));
  v8 = 0.0;
  -[THModelPageInfo setGeometry:](v21, "setGeometry:", objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithSize:", 768.0, 0.0));
  -[THModelPageInfo setAutosizes:](v21, "setAutosizes:", 1);
  v9 = objc_opt_class(NSArray);
  *(_QWORD *)&v10 = TSUDynamicCast(v9, objc_msgSend(v7, "valueForProperty:", "margin")).n128_u64[0];
  v12 = v11;
  v13 = 0.0;
  v14 = 0.0;
  if (objc_msgSend(v11, "count", v10) == &dword_4)
  {
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v12, "objectAtIndex:", 0), a3);
    v16 = v15;
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v12, "objectAtIndex:", 1), a3);
    v13 = v17;
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v12, "objectAtIndex:", 3), a3);
    v14 = v18;
    v8 = v16 + 0.0;
  }
  v19 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithPosition:size:", v14, v8, 768.0 - (v13 + v14), 0.0);
  v20 = -[THModelBodyTextInfo initWithContext:geometry:]([THModelBodyTextInfo alloc], "initWithContext:geometry:", objc_msgSend(a3, "tspContext"), v19);
  -[THModelBodyTextInfo setAutosizes:](v20, "setAutosizes:", 1);
  -[THModelBodyTextInfo setColumnStyle:](v20, "setColumnStyle:", -[PFEIBody _columnStyleWithReaderState:](self, "_columnStyleWithReaderState:", a3));
  -[THModelPageInfo addBodyBoxInfo:insertContext:](v21, "addBodyBoxInfo:insertContext:", v20, 0);
  -[THDrawablesZOrder addDrawable:](-[THModelPageInfo drawablesZOrder](v21, "drawablesZOrder"), "addDrawable:", v20);
  -[THDrawablesZOrder addDrawable:](-[THModelPageInfo drawablesZOrder](v21, "drawablesZOrder"), "addDrawable:", objc_msgSend(v5, "bodyStorage"));
  objc_msgSend(v6, "addPageInfo:", v21);

}

- (BOOL)mapStartElementWithState:(id)a3
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFEIBody;
  -[PFXBody mapStartElementWithState:](&v6, "mapStartElementWithState:");
  -[PFEIBody _createNodeContentsWithState:](self, "_createNodeContentsWithState:", a3);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "orientationState"), "contentNodeBody"), "setNodeUniqueID:forInfo:", objc_msgSend(a3, "nodeGUID"), objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "storage"));
  objc_msgSend(a3, "setCfiPathForCurrentStorage");
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFEIBody;
  -[PFXBody mapEndElementWithState:](&v9, "mapEndElementWithState:");
  v4 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "orientationState"), "contentNodeBody"), "pages");
  if (objc_msgSend(v4, "count") != (char *)&dword_0 + 1)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIBody mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIBody.mm"), 146, CFSTR("Unexpected number of pages."));
  if (objc_msgSend(v4, "count") == (char *)&dword_0 + 1)
  {
    v5 = objc_opt_class(THModelFlowPageInfo);
    *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(v4, "lastObject")).n128_u64[0];
    v8 = v7;
    if (!v7)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v6), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIBody mapEndElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIBody.mm"), 150, CFSTR("invalid nil value for '%s'"), "flowPageInfo");
    objc_msgSend(v8, "setHasBodyFlow:", 1, v6);
  }
}

@end
