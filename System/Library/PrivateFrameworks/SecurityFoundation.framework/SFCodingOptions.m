@implementation SFCodingOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setEncoding:", *((_QWORD *)self->_codingOptionsInternal + 1));
  objc_msgSend(v4, "setEncryptionPassphrase:", *((_QWORD *)self->_codingOptionsInternal + 2));
  return v4;
}

- (int64_t)encoding
{
  return *((_QWORD *)self->_codingOptionsInternal + 1);
}

- (void)setEncoding:(int64_t)a3
{
  *((_QWORD *)self->_codingOptionsInternal + 1) = a3;
}

- (NSString)encryptionPassphrase
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_codingOptionsInternal + 2), "copy");
}

- (void)setEncryptionPassphrase:(id)a3
{
  uint64_t v4;
  _QWORD *codingOptionsInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  codingOptionsInternal = self->_codingOptionsInternal;
  v6 = (void *)codingOptionsInternal[2];
  codingOptionsInternal[2] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_codingOptionsInternal, 0);
}

@end
