@implementation _SFKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
  objc_storeStrong(&self->_keyInternal, 0);
}

- (_SFKey)initWithAttributes:(id)a3
{
  id v4;
  _SFKey *v5;
  SFKey_Ivars *v6;
  id keyInternal;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFKey;
  v5 = -[_SFKey init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(SFKey_Ivars);
    keyInternal = v5->_keyInternal;
    v5->_keyInternal = v6;

    v8 = objc_msgSend(v4, "copyWithZone:", 0);
    v9 = v5->_keyInternal;
    v10 = (void *)v9[1];
    v9[1] = v8;

  }
  return v5;
}

+ (Class)_attributesClass
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SFKey.m"), 583, CFSTR("attempt to get attributes class from abstract base class SFKey - must be provided by subclass"));

  return 0;
}

+ (id)_specifierForSecKey:(__SecKey *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SFKey.m"), 589, CFSTR("attempt to get sec key specifier from abstract base class SFKey - must be provided by subclass"));

  return 0;
}

- (_SFKey)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("attempt to initialize abstract base class %@ - initialize a concrete subclass instead"), v10);
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
}

- (id)initRandomKeyWithSpecifier:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("attempt to creata random key for abstract base class %@ - initialize a concrete subclass instead"), v6);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v8);
}

- (BOOL)isEqual:(id)a3
{
  _SFKey *v4;
  _SFKey *v5;
  _SFKey *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_SFKey *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFKey keyData](self, "keyData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFKey keyData](v6, "keyData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_SFKeySpecifier)keySpecifier
{
  void *v2;
  void *v3;

  objc_msgSend(*((id *)self->_keyInternal + 1), "keySpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (_SFKeySpecifier *)v3;
}

- (NSString)keyDomain
{
  void *v2;
  void *v3;

  objc_msgSend(*((id *)self->_keyInternal + 1), "keyDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSData)keyData
{
  return self->_keyData;
}

@end
