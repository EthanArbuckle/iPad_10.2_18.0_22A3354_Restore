@implementation _SFAESKeySpecifier

- (void).cxx_destruct
{
  objc_storeStrong(&self->_aesKeySpecifierInternal, 0);
}

- (_SFAESKeySpecifier)initWithBitSize:(int64_t)a3
{
  _SFAESKeySpecifier *v4;
  SFAESKeySpecifier_Ivars *v5;
  id aesKeySpecifierInternal;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFAESKeySpecifier;
  v4 = -[_SFAESKeySpecifier init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(SFAESKeySpecifier_Ivars);
    aesKeySpecifierInternal = v4->_aesKeySpecifierInternal;
    v4->_aesKeySpecifierInternal = v5;

    *((_QWORD *)v4->_aesKeySpecifierInternal + 1) = a3;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBitSize:", *((_QWORD *)self->_aesKeySpecifierInternal + 1));
}

- (int64_t)keyLengthInBytes
{
  unint64_t v2;
  int64_t result;
  void *v6;

  v2 = *((_QWORD *)self->_aesKeySpecifierInternal + 1);
  if (v2 < 3)
    return 8 * v2 + 16;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFKey.m"), 305, CFSTR("unexected AES key bit size"));

  return result;
}

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFAESKeySpecifier)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFAESKeySpecifier;
  return -[_SFAESKeySpecifier init](&v4, sel_init, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_SFAESKeySpecifier;
  -[_SFAESKeySpecifier description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ bitSize: %ld"), v4, 8 * -[_SFAESKeySpecifier keyLengthInBytes](self, "keyLengthInBytes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)bitSize
{
  return *((_QWORD *)self->_aesKeySpecifierInternal + 1);
}

- (void)setBitSize:(int64_t)a3
{
  *((_QWORD *)self->_aesKeySpecifierInternal + 1) = a3;
}

- (int64_t)blockSize
{
  return 16;
}

@end
