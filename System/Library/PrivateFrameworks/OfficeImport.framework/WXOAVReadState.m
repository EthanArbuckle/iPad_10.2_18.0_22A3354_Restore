@implementation WXOAVReadState

- (WXOAVReadState)initWithWXReadState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  WXOAVReadState *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *mNextVmlShapeIdToTextBoxMap;
  objc_super v11;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "packagePart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)WXOAVReadState;
  v7 = -[OAVReadState initWithClient:packagePart:](&v11, sel_initWithClient_packagePart_, v5, v6);

  objc_storeWeak((id *)&v7->mWxState, v4);
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mNextVmlShapeIdToTextBoxMap = v7->mNextVmlShapeIdToTextBoxMap;
  v7->mNextVmlShapeIdToTextBoxMap = v8;

  LODWORD(v6) = v7->super.super.super.mXMLFormat;
  if ((_DWORD)v6 != objc_msgSend(v4, "xmlFormat"))
    -[OCXState setupNSForXMLFormat:](v7, "setupNSForXMLFormat:", objc_msgSend(v4, "xmlFormat"));

  return v7;
}

- (id)wxReadState
{
  return objc_loadWeakRetained((id *)&self->mWxState);
}

- (id)currentParagraph
{
  return self->mParagraph;
}

- (void)setCurrentParagraph:(id)a3
{
  objc_storeStrong((id *)&self->mParagraph, a3);
}

- (id)nextVmlShapeIdToTextBoxMap
{
  return self->mNextVmlShapeIdToTextBoxMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNextVmlShapeIdToTextBoxMap, 0);
  objc_storeStrong((id *)&self->mParagraph, 0);
  objc_destroyWeak((id *)&self->mWxState);
}

@end
