@implementation SignedObjectHolder

- (NSData)object
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signedObject](self, "signedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "object"));

  return (NSData *)v3;
}

- (void)setObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signedObject](self, "signedObject"));
  objc_msgSend(v5, "setObject:", v4);

}

- (Signature)signature
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signedObject](self, "signedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "signature"));

  return (Signature *)v3;
}

- (void)setSignature:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signedObject](self, "signedObject"));
  objc_msgSend(v5, "setSignature:", v4);

}

- (BOOL)hasSignature
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signedObject](self, "signedObject"));
  v3 = objc_msgSend(v2, "hasSignature");

  return v3;
}

- (id)data
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signedObject](self, "signedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "data"));

  return v3;
}

- (SignedObjectHolder)init
{
  SignedObjectHolder *v2;
  SignedObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SignedObjectHolder;
  v2 = -[SignedObjectHolder init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(SignedObject);
    -[SignedObjectHolder setSignedObject:](v2, "setSignedObject:", v3);

  }
  return v2;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](SignedObject, "parseFromData:error:", a3, a4));
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "signedTypeWithObject:", v5));
  else
    v6 = 0;

  return v6;
}

+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SignedObjectHolder *v14;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = objc_opt_class(a1, v11);
  if (v12 == objc_opt_class(SignedObjectHolder, v13))
  {
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("AbstractClassException"), CFSTR("This is an abstract class. To use it, please subclass."), 0)));
    objc_exception_throw(v16);
  }
  v14 = objc_alloc_init(SignedObjectHolder);

  return v14;
}

+ (id)signedTypeWithObject:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SignedObjectHolder *v8;
  id v10;

  v4 = a3;
  v6 = objc_opt_class(a1, v5);
  if (v6 == objc_opt_class(SignedObjectHolder, v7))
  {
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("AbstractClassException"), CFSTR("This is an abstract class. To use it, please subclass."), 0)));
    objc_exception_throw(v10);
  }
  v8 = objc_alloc_init(SignedObjectHolder);

  return v8;
}

- (id)signatureDiagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[3];

  v15[0] = CFSTR("signature");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signature](self, "signature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "signature"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  v16[0] = v5;
  v15[1] = CFSTR("signingKeySpkiHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signature](self, "signature"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signingKeySpkihash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
  v16[1] = v8;
  v15[2] = CFSTR("algorithm");
  v9 = Signature_SignatureAlgorithm_EnumDescriptor();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signature](self, "signature"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textFormatNameForValue:", objc_msgSend(v11, "algorithm")));
  v16[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));

  return v13;
}

- (id)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder object](self, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("object"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signatureDiagnosticsJsonDictionary](self, "signatureDiagnosticsJsonDictionary"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("signature"));

  return v3;
}

- (unint64_t)verifyWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  v3 = objc_opt_class(self, a2);
  if (v3 == objc_opt_class(SignedObjectHolder, v4))
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("AbstractClassException"), CFSTR("This is an abstract class. To use it, please subclass."), 0)));
    objc_exception_throw(v6);
  }
  return 0;
}

- (SignedObject)signedObject
{
  return (SignedObject *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSignedObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (TransparencySignatureVerifier)verifier
{
  return (TransparencySignatureVerifier *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVerifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_signedObject, 0);
}

@end
