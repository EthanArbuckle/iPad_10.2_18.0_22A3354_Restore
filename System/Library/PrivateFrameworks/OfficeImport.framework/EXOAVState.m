@implementation EXOAVState

- (EXReadState)exState
{
  return (EXReadState *)objc_loadWeakRetained((id *)&self->mEXReadState);
}

- (EXOAVState)initWithEXReadState:(id)a3 packagePart:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  EXOAVState *v9;
  id v10;
  int mXMLFormat;
  id v12;
  int v13;
  id WeakRetained;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v16.receiver = self;
  v16.super_class = (Class)EXOAVState;
  v9 = -[OAVReadState initWithClient:packagePart:](&v16, sel_initWithClient_packagePart_, v8, v7);
  v10 = objc_storeWeak((id *)&v9->mEXReadState, v6);
  mXMLFormat = v9->super.super.super.mXMLFormat;
  v12 = v10;
  v13 = objc_msgSend(v6, "xmlFormat");

  if (mXMLFormat != v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v9->mEXReadState);
    -[OCXState setupNSForXMLFormat:](v9, "setupNSForXMLFormat:", objc_msgSend(WeakRetained, "xmlFormat"));

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mEXReadState);
}

@end
