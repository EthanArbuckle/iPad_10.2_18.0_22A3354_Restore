@implementation EBOfficeArtReaderState

- (EBOfficeArtReaderState)initWithReaderState:(id)a3
{
  id v4;
  EBOfficeArtReaderState *v5;
  EBOfficeArtReaderState *v6;

  v4 = a3;
  v5 = -[OABReaderState initWithClient:](self, "initWithClient:", objc_opt_class());
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->mReaderState, v4);

  return v6;
}

- (EBReaderState)readerState
{
  return (EBReaderState *)objc_loadWeakRetained((id *)&self->mReaderState);
}

- (id)xmlDrawingState
{
  EXReadState *mXmlDocumentState;
  EXReadState *v4;
  EXReadState *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  mXmlDocumentState = self->mXmlDocumentState;
  if (!mXmlDocumentState)
  {
    v4 = -[EXReadState initWithWorkbookPart:cancelDelegate:]([EXReadState alloc], "initWithWorkbookPart:cancelDelegate:", 0, 0);
    v5 = self->mXmlDocumentState;
    self->mXmlDocumentState = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->mReaderState);
    objc_msgSend(WeakRetained, "workbook");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[EXReadState setWorkbook:](self->mXmlDocumentState, "setWorkbook:", v7);
    -[EXReadState officeArtState](self->mXmlDocumentState, "officeArtState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clearTargetBlipCollection");

    -[EXReadState officeArtState](self->mXmlDocumentState, "officeArtState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDWorkbook impliedColorMap](EDWorkbook, "impliedColorMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABDrawable setUpXmlDrawingState:withBinaryReaderState:targetDocument:colorMap:](OABDrawable, "setUpXmlDrawingState:withBinaryReaderState:targetDocument:colorMap:", v9, self, v7, v10);

    mXmlDocumentState = self->mXmlDocumentState;
  }
  return -[EXReadState officeArtState](mXmlDocumentState, "officeArtState");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mReaderState);
  objc_storeStrong((id *)&self->mXmlDocumentState, 0);
}

@end
