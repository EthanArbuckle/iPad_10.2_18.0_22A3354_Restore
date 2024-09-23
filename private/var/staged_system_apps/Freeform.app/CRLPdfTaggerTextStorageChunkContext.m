@implementation CRLPdfTaggerTextStorageChunkContext

- (CRLPdfTaggerTextStorageChunkContext)initWithStateOfTagger:(id)a3 textStorageChunk:(id)a4 limitSelection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  CRLPdfTaggerTextStorageChunkContext *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "columns"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storage"));
  v15.receiver = self;
  v15.super_class = (Class)CRLPdfTaggerTextStorageChunkContext;
  v13 = -[CRLPdfTaggerTextColumnOwnerContext initWithStateOfTagger:columns:storage:limitSelection:](&v15, "initWithStateOfTagger:columns:storage:limitSelection:", v8, v11, v12, v10);

  if (v13)
    objc_storeStrong((id *)&v13->_textStorageChunk, a4);

  return v13;
}

- (CRLWPRep)textStorageChunk
{
  return self->_textStorageChunk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStorageChunk, 0);
}

@end
