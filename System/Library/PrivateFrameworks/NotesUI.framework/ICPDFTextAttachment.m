@implementation ICPDFTextAttachment

- (id)supportedPresentationSizes
{
  if (supportedPresentationSizes_onceToken_1 != -1)
    dispatch_once(&supportedPresentationSizes_onceToken_1, &__block_literal_global_19);
  return (id)supportedPresentationSizes_supportedSizes_1;
}

void __49__ICPDFTextAttachment_supportedPresentationSizes__block_invoke()
{
  void *v0;

  v0 = (void *)supportedPresentationSizes_supportedSizes_1;
  supportedPresentationSizes_supportedSizes_1 = (uint64_t)&unk_1E5C71A78;

}

- (ICPDFEncryptionStateChecker)encryptionStateChecker
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  ICPDFEncryptionStateChecker *v8;
  ICPDFEncryptionStateChecker *encryptionStateChecker;

  if (!self->_encryptionStateChecker)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "attachmentType");

    if (v4 == 6)
    {
      -[ICAbstractTextAttachment attachment](self, "attachment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "media");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mediaURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = -[ICPDFEncryptionStateChecker initWithPDFURL:]([ICPDFEncryptionStateChecker alloc], "initWithPDFURL:", v7);
        encryptionStateChecker = self->_encryptionStateChecker;
        self->_encryptionStateChecker = v8;

      }
    }
  }
  return self->_encryptionStateChecker;
}

- (signed)effectiveAttachmentViewSizeForTextContainer:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICPDFTextAttachment;
  v4 = -[ICBaseTextAttachment effectiveAttachmentViewSizeForTextContainer:](&v11, sel_effectiveAttachmentViewSizeForTextContainer_, a3);
  if (v4 != 1)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachmentModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPreviews");

    if ((v7 & 1) == 0)
    {
      -[ICPDFTextAttachment encryptionStateChecker](self, "encryptionStateChecker");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "encryptionState");

      if (v9 != 2)
        LOWORD(v4) = 1;
    }
  }
  return v4;
}

- (void)setEncryptionStateChecker:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionStateChecker, 0);
}

@end
