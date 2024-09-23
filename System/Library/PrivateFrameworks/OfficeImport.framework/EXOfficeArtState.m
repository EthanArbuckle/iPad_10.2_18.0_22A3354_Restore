@implementation EXOfficeArtState

- (EXOfficeArtState)initWithExcelState:(id)a3
{
  id v4;
  EXOfficeArtClient *v5;
  EXOfficeArtState *v6;
  EXOfficeArtState *v7;
  id v8;
  int mXMLFormat;
  id v10;
  int v11;
  id WeakRetained;
  objc_super v14;

  v4 = a3;
  v5 = objc_alloc_init(EXOfficeArtClient);
  v14.receiver = self;
  v14.super_class = (Class)EXOfficeArtState;
  v6 = -[OAXDrawingState initWithClient:](&v14, sel_initWithClient_, v5);
  v7 = v6;
  if (v6)
  {
    v8 = objc_storeWeak((id *)&v6->mExcelState, v4);
    mXMLFormat = v7->super.super.super.mXMLFormat;
    v10 = v8;
    v11 = objc_msgSend(v4, "xmlFormat");

    if (mXMLFormat != v11)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v7->mExcelState);
      -[OAXDrawingState setupNSForXMLFormat:](v7, "setupNSForXMLFormat:", objc_msgSend(WeakRetained, "xmlFormat"));

    }
  }

  return v7;
}

- (EXReadState)excelState
{
  return (EXReadState *)objc_loadWeakRetained((id *)&self->mExcelState);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mExcelState);
}

@end
