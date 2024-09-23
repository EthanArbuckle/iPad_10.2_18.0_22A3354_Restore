@implementation CRLPdfTaggerOneColumnTextOwnerContext

- (CRLPdfTaggerOneColumnTextOwnerContext)initWithStateOfTagger:(id)a3 textColumn:(id)a4 limitSelection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  CRLPdfTaggerOneColumnTextOwnerContext *v13;
  objc_super v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storage"));
  v15.receiver = self;
  v15.super_class = (Class)CRLPdfTaggerOneColumnTextOwnerContext;
  v13 = -[CRLPdfTaggerTextColumnOwnerContext initWithStateOfTagger:columns:storage:limitSelection:](&v15, "initWithStateOfTagger:columns:storage:limitSelection:", v8, v11, v12, v10);

  if (v13)
    objc_storeStrong((id *)&v13->_textColumn, a4);

  return v13;
}

- (CRLWPColumn)textColumn
{
  return (CRLWPColumn *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTextColumn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColumn, 0);
}

@end
