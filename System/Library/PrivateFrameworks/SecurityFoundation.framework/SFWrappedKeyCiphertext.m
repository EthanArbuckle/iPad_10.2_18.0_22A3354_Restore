@implementation SFWrappedKeyCiphertext

- (SFWrappedKeyCiphertext)initWithCiphertext:(id)a3 ciphertextKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SFWrappedKeyCiphertext *v10;
  SFWrappedKeyCiphertext *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 338, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ciphertext"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFEncryptionOperation.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ciphertextKey"));

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)SFWrappedKeyCiphertext;
  v10 = -[_SFCiphertext initWithCiphertext:](&v15, sel_initWithCiphertext_, v7);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)v10->_wrappedKeyCiphertextInternal + 1, a4);

  return v11;
}

- (_SFCiphertext)ciphertextKey
{
  return (_SFCiphertext *)*((id *)self->_wrappedKeyCiphertextInternal + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wrappedKeyCiphertextInternal, 0);
}

@end
