@implementation ICPDFEncryptionStateChecker

- (ICPDFEncryptionStateChecker)initWithPDFURL:(id)a3
{
  id v4;
  ICPDFEncryptionStateChecker *v5;
  uint64_t v6;
  NSURL *pdfURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPDFEncryptionStateChecker;
  v5 = -[ICPDFEncryptionStateChecker init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    pdfURL = v5->_pdfURL;
    v5->_pdfURL = (NSURL *)v6;

  }
  return v5;
}

- (unint64_t)encryptionState
{
  void *v3;
  const __CFURL *v4;
  CGPDFDocument *v5;
  uint64_t v6;

  if (!self->_encryptionState)
  {
    -[ICPDFEncryptionStateChecker pdfURL](self, "pdfURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[ICPDFEncryptionStateChecker pdfURL](self, "pdfURL");
      v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v5 = CGPDFDocumentCreateWithURL(v4);

      if (v5)
      {
        if (CGPDFDocumentIsEncrypted(v5))
          v6 = 1;
        else
          v6 = 2;
        -[ICPDFEncryptionStateChecker setEncryptionState:](self, "setEncryptionState:", v6);
        CGPDFDocumentRelease(v5);
      }
    }
  }
  return self->_encryptionState;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICPDFEncryptionStateChecker *v4;
  void *v5;
  ICPDFEncryptionStateChecker *v6;

  v4 = +[ICPDFEncryptionStateChecker allocWithZone:](ICPDFEncryptionStateChecker, "allocWithZone:", a3);
  -[ICPDFEncryptionStateChecker pdfURL](self, "pdfURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICPDFEncryptionStateChecker initWithPDFURL:](v4, "initWithPDFURL:", v5);

  -[ICPDFEncryptionStateChecker setEncryptionState:](v6, "setEncryptionState:", self->_encryptionState);
  return v6;
}

- (NSURL)pdfURL
{
  return self->_pdfURL;
}

- (void)setEncryptionState:(unint64_t)a3
{
  self->_encryptionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfURL, 0);
}

@end
