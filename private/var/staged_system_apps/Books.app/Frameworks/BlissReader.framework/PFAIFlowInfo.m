@implementation PFAIFlowInfo

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIFlowInfo;
  -[PFAIFlowInfo dealloc](&v3, "dealloc");
}

+ (double)lengthForAttribute:(const char *)a3 contentState:(id)a4
{
  double result;

  +[PFXStyleUtilities pointLengthInString:readerState:](PFXStyleUtilities, "pointLengthInString:readerState:", objc_msgSend(objc_msgSend(a4, "currentStackEntry"), "valueForAttribute:", a3), a4);
  return result;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  PFSStyleSelector *v7;
  double v8;
  double v9;
  THModelFlowPageInfo *v10;
  id v11;

  v5 = objc_msgSend(a3, "currentStackEntry");
  v6 = objc_msgSend(a3, "flowState");
  v7 = objc_alloc_init(PFSStyleSelector);
  PFSStyleSimpleSelector::setElement((PFSStyleSimpleSelector *)-[PFSStyleSelector addSimpleSelector](v7, "addSimpleSelector"), "html");
  PFSStyleSimpleSelector::setElement((PFSStyleSimpleSelector *)-[PFSStyleSelector addSimpleSelector](v7, "addSimpleSelector"), "body");
  -[PFSStyleSelector freeze](v7, "freeze");
  self->mPropertySet = (PFSPropertySet *)objc_msgSend(objc_msgSend(v6, "styleCache"), "createPropertySetWithSelector:", v7);

  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", -[PFSPropertySet valueForProperty:](self->mPropertySet, "valueForProperty:", PFXPropNmApplePubHeadHeight[0]), a3);
  v9 = v8;
  v10 = -[THModelPageInfo initWithContext:]([THModelFlowPageInfo alloc], "initWithContext:", objc_msgSend(a3, "tspContext"));
  v11 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithSize:", 768.0, v9);
  -[THModelPageInfo setGeometry:](v10, "setGeometry:", v11);
  -[THModelPageInfo setAutosizes:](v10, "setAutosizes:", 1);
  objc_msgSend(objc_msgSend(v6, "contentNodeBody"), "addPageInfo:", v10);

  objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", 1);
  objc_msgSend(objc_msgSend(v5, "paginatedState"), "setProcessOrientation:", 0);
  objc_msgSend(v6, "takeHintsFromState:", objc_msgSend(a3, "paginatedState"));
  objc_msgSend(a3, "setInFlowHeader:", 1);
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  THModelBodyTextInfo *v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v5 = objc_msgSend(a3, "flowState");
  v6 = objc_opt_class(NSArray);
  *(_QWORD *)&v7 = TSUDynamicCast(v6, -[PFSPropertySet valueForProperty:](self->mPropertySet, "valueForProperty:", "margin")).n128_u64[0];
  v9 = v8;
  v10 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  if (objc_msgSend(v8, "count", v7) == &dword_4)
  {
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v9, "objectAtIndex:", 0), a3);
    v12 = v13;
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v9, "objectAtIndex:", 1), a3);
    v11 = v14;
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v9, "objectAtIndex:", 3), a3);
    v10 = v15;
  }
  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", -[PFSPropertySet valueForProperty:](self->mPropertySet, "valueForProperty:", PFXPropNmApplePubHeadHeight[0]), a3);
  v17 = v16;
  v18 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "contentNodeBody"), "pages"), "lastObject");
  v19 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithPosition:size:", v10, v12 + v17, 768.0 - (v10 + v11), 0.0);
  v20 = -[THModelBodyTextInfo initWithContext:geometry:]([THModelBodyTextInfo alloc], "initWithContext:geometry:", objc_msgSend(a3, "tspContext"), v19);

  -[THModelBodyTextInfo setAutosizes:](v20, "setAutosizes:", 1);
  v21 = objc_msgSend(objc_alloc((Class)TSSPropertyMap), "initWithCapacity:", 3);
  v22 = objc_msgSend(objc_alloc((Class)TSWPColumns), "initWithColumnCount:", 1);
  objc_msgSend(v21, "setObject:forProperty:", v22, 148);

  v23 = objc_msgSend(objc_alloc((Class)TSWPPadding), "initWithTopInset:leftInset:bottomInset:rightInset:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v21, "setObject:forProperty:", v23, 146);

  objc_msgSend(v21, "setIntValue:forProperty:", 0, 149);
  v24 = objc_msgSend(objc_alloc((Class)TSWPColumnStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), CFSTR("Flow Column Style"), v21, 0);
  -[THModelBodyTextInfo setColumnStyle:](v20, "setColumnStyle:", v24);

  objc_msgSend(v18, "addBodyBoxInfo:insertContext:", v20, 0);
  objc_msgSend(objc_msgSend(v18, "drawablesZOrder"), "addDrawable:", v20);
  objc_msgSend(objc_msgSend(v18, "drawablesZOrder"), "addDrawable:", objc_msgSend(v5, "bodyStorage"));

  objc_msgSend(objc_msgSend(a3, "paginatedState"), "takeHintsFromState:", v5);
  objc_msgSend(a3, "setInFlowHeader:", 0);
}

@end
