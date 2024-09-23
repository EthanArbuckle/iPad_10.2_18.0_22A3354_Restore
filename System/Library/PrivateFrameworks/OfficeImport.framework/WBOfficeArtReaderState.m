@implementation WBOfficeArtReaderState

- (WBOfficeArtReaderState)initWithClient:(Class)a3
{
  WBOfficeArtReaderState *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WBOfficeArtReaderState;
  result = -[OABReaderState initWithClient:](&v4, sel_initWithClient_, a3);
  if (result)
    result->mCurrentTextType = -1;
  return result;
}

- (void)setReader:(id)a3
{
  objc_storeWeak((id *)&self->mReader, a3);
}

- (void)setCurrentTextType:(int)a3
{
  self->mCurrentTextType = a3;
}

- (int)currentTextType
{
  return self->mCurrentTextType;
}

- (WBReader)reader
{
  return (WBReader *)objc_loadWeakRetained((id *)&self->mReader);
}

- (id)xmlDrawingState
{
  WXReadState *mXmlDocumentState;
  id WeakRetained;
  void *v5;
  WXReadState *v6;
  WXReadState *v7;
  void *v8;
  void *v9;

  mXmlDocumentState = self->mXmlDocumentState;
  if (!mXmlDocumentState)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mReader);
    objc_msgSend(WeakRetained, "targetDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(WXReadState);
    v7 = self->mXmlDocumentState;
    self->mXmlDocumentState = v6;

    -[WXReadState drawingState](self->mXmlDocumentState, "drawingState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABDrawable setUpXmlDrawingState:withBinaryReaderState:targetDocument:colorMap:](OABDrawable, "setUpXmlDrawingState:withBinaryReaderState:targetDocument:colorMap:", v8, self, v5, v9);

    mXmlDocumentState = self->mXmlDocumentState;
  }
  return -[WXReadState drawingState](mXmlDocumentState, "drawingState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mXmlDocumentState, 0);
  objc_destroyWeak((id *)&self->mReader);
}

@end
