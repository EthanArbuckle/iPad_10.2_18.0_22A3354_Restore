@implementation CRLPdfTaggerContext

- (CRLPdfTaggerContext)initWithStateOfTagger:(id)a3
{
  id v4;
  CRLPdfTaggerContext *v5;
  uint64_t v6;
  CRLPdfTaggerState *taggerState;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLPdfTaggerContext;
  v5 = -[CRLPdfTaggerContext init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "state"));
    taggerState = v5->_taggerState;
    v5->_taggerState = (CRLPdfTaggerState *)v6;

  }
  return v5;
}

- (CRLPdfTaggerState)taggerState
{
  return self->_taggerState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taggerState, 0);
}

@end
