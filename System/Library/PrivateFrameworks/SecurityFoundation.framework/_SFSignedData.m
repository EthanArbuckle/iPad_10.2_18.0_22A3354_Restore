@implementation _SFSignedData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSignedData)initWithData:(id)a3 signature:(id)a4
{
  id v6;
  id v7;
  _SFSignedData *v8;
  SFSignedData_Ivars *v9;
  id signedDataInternal;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SFSignedData;
  v8 = -[_SFSignedData init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(SFSignedData_Ivars);
    signedDataInternal = v8->_signedDataInternal;
    v8->_signedDataInternal = v9;

    v11 = objc_msgSend(v6, "copy");
    v12 = v8->_signedDataInternal;
    v13 = (void *)v12[1];
    v12[1] = v11;

    v14 = objc_msgSend(v7, "copy");
    v15 = v8->_signedDataInternal;
    v16 = (void *)v15[2];
    v15[2] = v14;

  }
  return v8;
}

- (_SFSignedData)initWithCoder:(id)a3
{
  id v4;
  _SFSignedData *v5;
  SFSignedData_Ivars *v6;
  id signedDataInternal;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFSignedData;
  v5 = -[_SFSignedData init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(SFSignedData_Ivars);
    signedDataInternal = v5->_signedDataInternal;
    v5->_signedDataInternal = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_data"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v5->_signedDataInternal;
    v10 = (void *)v9[1];
    v9[1] = v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_signature"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v5->_signedDataInternal;
    v13 = (void *)v12[2];
    v12[2] = v11;

    v14 = v5->_signedDataInternal;
    if (!v14[1] || !v14[2])
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB28A8];
      v22 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to deserialize object of type %@"), objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4865, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "failWithError:", v19);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *((_QWORD *)self->_signedDataInternal + 1);
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("_data"));
  objc_msgSend(v5, "encodeObject:forKey:", *((_QWORD *)self->_signedDataInternal + 2), CFSTR("_signature"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:signature:", *((_QWORD *)self->_signedDataInternal + 1), *((_QWORD *)self->_signedDataInternal + 2));
}

- (NSData)data
{
  return (NSData *)*((id *)self->_signedDataInternal + 1);
}

- (NSData)signature
{
  return (NSData *)*((id *)self->_signedDataInternal + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_signedDataInternal, 0);
}

@end
