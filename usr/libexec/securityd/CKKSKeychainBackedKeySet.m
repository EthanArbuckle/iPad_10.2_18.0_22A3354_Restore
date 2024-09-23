@implementation CKKSKeychainBackedKeySet

- (CKKSKeychainBackedKeySet)initWithTLK:(id)a3 classA:(id)a4 classC:(id)a5 newUpload:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  CKKSKeychainBackedKeySet *v14;
  CKKSKeychainBackedKeySet *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CKKSKeychainBackedKeySet;
  v14 = -[CKKSKeychainBackedKeySet init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_tlk, a3);
    objc_storeStrong((id *)&v15->_classA, a4);
    objc_storeStrong((id *)&v15->_classC, a5);
    v15->_newUpload = a6;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKeySet tlk](self, "tlk"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKeySet classA](self, "classA"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKeySet classC](self, "classC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSKeychainBackedKeySet: tlk:%@, classA:%@, classC:%@, newUpload:%d>"), v3, v4, v5, -[CKKSKeychainBackedKeySet newUpload](self, "newUpload")));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKeySet tlk](self, "tlk"));
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("tlk"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKeySet classA](self, "classA"));
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("classA"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKeySet classC](self, "classC"));
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("classC"));

  objc_msgSend(v7, "encodeBool:forKey:", -[CKKSKeychainBackedKeySet newUpload](self, "newUpload"), CFSTR("newUpload"));
}

- (CKKSKeychainBackedKeySet)initWithCoder:(id)a3
{
  id v4;
  CKKSKeychainBackedKeySet *v5;
  id v6;
  uint64_t v7;
  CKKSKeychainBackedKey *tlk;
  id v9;
  uint64_t v10;
  CKKSKeychainBackedKey *classA;
  id v12;
  uint64_t v13;
  CKKSKeychainBackedKey *classC;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKKSKeychainBackedKeySet;
  v5 = -[CKKSKeychainBackedKeySet init](&v16, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKKSKeychainBackedKey), CFSTR("tlk"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    tlk = v5->_tlk;
    v5->_tlk = (CKKSKeychainBackedKey *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKKSKeychainBackedKey), CFSTR("classA"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    classA = v5->_classA;
    v5->_classA = (CKKSKeychainBackedKey *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKKSKeychainBackedKey), CFSTR("classC"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    classC = v5->_classC;
    v5->_classC = (CKKSKeychainBackedKey *)v13;

    v5->_newUpload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("newUpload"));
  }

  return v5;
}

- (CKKSKeychainBackedKey)tlk
{
  return (CKKSKeychainBackedKey *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTlk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CKKSKeychainBackedKey)classA
{
  return (CKKSKeychainBackedKey *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClassA:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CKKSKeychainBackedKey)classC
{
  return (CKKSKeychainBackedKey *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClassC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)newUpload
{
  return self->_newUpload;
}

- (void)setNewUpload:(BOOL)a3
{
  self->_newUpload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classC, 0);
  objc_storeStrong((id *)&self->_classA, 0);
  objc_storeStrong((id *)&self->_tlk, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
