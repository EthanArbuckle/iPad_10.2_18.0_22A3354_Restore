@implementation CRLPdfTaggerTextColumnOwnerContext

- (CRLPdfTaggerTextColumnOwnerContext)initWithStateOfTagger:(id)a3 columns:(id)a4 storage:(id)a5 limitSelection:(id)a6
{
  id v11;
  id v12;
  id v13;
  CRLPdfTaggerTextColumnOwnerContext *v14;
  CRLPdfTaggerTextColumnOwnerContext *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CRLPdfTaggerTextColumnOwnerContext;
  v14 = -[CRLPdfTaggerContext initWithStateOfTagger:](&v17, "initWithStateOfTagger:", a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_columns, a4);
    objc_storeWeak((id *)&v15->_storage, v12);
    objc_storeWeak((id *)&v15->_limitSelection, v13);
  }

  return v15;
}

- (NSArray)columns
{
  return self->_columns;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  return (_TtC8Freeform12CRLWPStorage *)objc_loadWeakRetained((id *)&self->_storage);
}

- (CRLWPSelection)limitSelection
{
  return (CRLWPSelection *)objc_loadWeakRetained((id *)&self->_limitSelection);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_limitSelection);
  objc_destroyWeak((id *)&self->_storage);
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
