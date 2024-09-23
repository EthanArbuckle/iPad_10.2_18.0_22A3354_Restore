@implementation PKASCAssociatedReaderIDReaderCA

- (PKASCAssociatedReaderIDReaderCA)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKASCAssociatedReaderIDReaderCA *v9;
  PKASCAssociatedReaderIDReaderCA *v10;
  id *p_isa;
  objc_super v13;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "PKStringForKey:", CFSTR("publicKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pk_decodeHexadecimal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "PKStringForKey:", CFSTR("attestation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "pk_decodeHexadecimal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    if (v6 && v8)
    {
      v13.receiver = self;
      v13.super_class = (Class)PKASCAssociatedReaderIDReaderCA;
      v10 = -[PKASCAssociatedReaderIDReaderCA init](&v13, sel_init);
      p_isa = (id *)&v10->super.isa;
      if (v10)
      {
        objc_storeStrong((id *)&v10->_publicKey, v6);
        objc_storeStrong(p_isa + 2, v8);
      }
      self = p_isa;
      v9 = self;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSData hexEncoding](self->_publicKey, "hexEncoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("publicKey"));

  -[NSData hexEncoding](self->_attestation, "hexEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("attestation"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKASCAssociatedReaderIDReaderCA)initWithCoder:(id)a3
{
  id v4;
  PKASCAssociatedReaderIDReaderCA *v5;
  uint64_t v6;
  NSData *publicKey;
  uint64_t v8;
  NSData *attestation;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKASCAssociatedReaderIDReaderCA;
  v5 = -[PKASCAssociatedReaderIDReaderCA init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attestation"));
    v8 = objc_claimAutoreleasedReturnValue();
    attestation = v5->_attestation;
    v5->_attestation = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *publicKey;
  id v5;

  publicKey = self->_publicKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", publicKey, CFSTR("publicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attestation, CFSTR("attestation"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSData hexEncoding](self->_publicKey, "hexEncoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData hexEncoding](self->_attestation, "hexEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<publicKey: '%@'; attestation: '%@';>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_publicKey)
    objc_msgSend(v3, "addObject:");
  if (self->_attestation)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKASCAssociatedReaderIDReaderCA *v4;
  PKASCAssociatedReaderIDReaderCA *v5;
  BOOL v6;

  v4 = (PKASCAssociatedReaderIDReaderCA *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKASCAssociatedReaderIDReaderCA isEqualToASCAssociatedReaderIDReaderCA:](self, "isEqualToASCAssociatedReaderIDReaderCA:", v5);

  return v6;
}

- (BOOL)isEqualToASCAssociatedReaderIDReaderCA:(id)a3
{
  _QWORD *v4;
  NSData *publicKey;
  NSData *v6;
  BOOL v7;
  char v8;
  NSData *attestation;
  NSData *v11;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  publicKey = self->_publicKey;
  v6 = (NSData *)v4[1];
  if (publicKey)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((-[NSData isEqual:](publicKey, "isEqual:") & 1) != 0)
      goto LABEL_11;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if (publicKey != v6)
    goto LABEL_8;
LABEL_11:
  attestation = self->_attestation;
  v11 = (NSData *)v4[2];
  if (attestation && v11)
    v8 = -[NSData isEqual:](attestation, "isEqual:");
  else
    v8 = attestation == v11;
LABEL_9:

  return v8;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (NSData)attestation
{
  return self->_attestation;
}

- (void)setAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_attestation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestation, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end
