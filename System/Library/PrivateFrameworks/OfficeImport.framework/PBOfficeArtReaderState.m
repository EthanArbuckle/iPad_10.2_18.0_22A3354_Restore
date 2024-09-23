@implementation PBOfficeArtReaderState

- (PBOfficeArtReaderState)initWithPresentationState:(id)a3
{
  id v4;
  PBOfficeArtReaderState *v5;
  PBOfficeArtReaderState *v6;

  v4 = a3;
  v5 = -[OABReaderState initWithClient:](self, "initWithClient:", objc_opt_class());
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->mPresentationState, v4);

  return v6;
}

- (PBPresentationReaderState)presentationState
{
  return (PBPresentationReaderState *)objc_loadWeakRetained((id *)&self->mPresentationState);
}

- (id)xmlDrawingState
{
  PXPresentationState *mXmlDocumentState;
  id WeakRetained;
  void *v5;
  PXPresentationState *v6;
  PXPresentationState *v7;
  void *v8;

  mXmlDocumentState = self->mXmlDocumentState;
  if (!mXmlDocumentState)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mPresentationState);
    objc_msgSend(WeakRetained, "tgtPresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(PXPresentationState);
    v7 = self->mXmlDocumentState;
    self->mXmlDocumentState = v6;

    -[PXPresentationState officeArtState](self->mXmlDocumentState, "officeArtState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABDrawable setUpXmlDrawingState:withBinaryReaderState:targetDocument:colorMap:](OABDrawable, "setUpXmlDrawingState:withBinaryReaderState:targetDocument:colorMap:", v8, self, v5, 0);

    mXmlDocumentState = self->mXmlDocumentState;
  }
  return -[PXPresentationState officeArtState](mXmlDocumentState, "officeArtState");
}

- (id)xmlDocumentState
{
  void *v2;
  void *v3;
  void *v4;

  -[PBOfficeArtReaderState xmlDrawingState](self, "xmlDrawingState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)drawableOnTgtSlideForShapeId:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;

  -[OABReaderState drawableForShapeId:](self, "drawableForShapeId:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PBOfficeArtReaderState presentationState](self, "presentationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tgtSlide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      while (1)
      {
        objc_msgSend(v6, "drawables");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "containsObject:", v4);

        if ((v8 & 1) != 0)
          break;
        objc_msgSend(v6, "parentSlideBase");
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v9;
        if (!v9)
          goto LABEL_5;
      }
    }
    else
    {
LABEL_5:
      v6 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mPresentationState);
  objc_storeStrong((id *)&self->mXmlDocumentState, 0);
}

@end
