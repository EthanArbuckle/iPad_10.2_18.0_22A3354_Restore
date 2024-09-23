@implementation PKTransactionAuthenticationContext

- (PKTransactionAuthenticationContext)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSData *v10;
  NSData *nonce;
  void *v12;
  NSData *v13;
  NSData *signingKeyMaterial;
  void *v15;
  NSData *v16;
  NSData *partialSignature;
  objc_super v19;

  v4 = a3;
  if (v4)
  {
    v19.receiver = self;
    v19.super_class = (Class)PKTransactionAuthenticationContext;
    self = -[PKTransactionAuthenticationContext init](&v19, sel_init);
    if (self)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("PINFormat"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_paymentPINFormat = PKTransactionAuthenticationPINFormatFromString(v5);

      objc_msgSend(v4, "PKArrayForKey:", CFSTR("authenticationMechanisms"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      self->_requestedAuthenticationMechanisms = PKTransactionAuthenticationMechanismFromStrings(v6);

      objc_msgSend(v4, "PKArrayForKey:", CFSTR("processedAuthenticationMechanisms"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_processedAuthenticationMechanisms = PKTransactionAuthenticationMechanismFromStrings(v7);

      objc_msgSend(v4, "PKArrayForKey:", CFSTR("dataCollectedAuthenticationMechanisms"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self->_dataCollectedAuthenticationMechanisms = PKTransactionAuthenticationMechanismFromStrings(v8);

      self->_complete = objc_msgSend(v4, "PKBoolForKey:", CFSTR("complete"));
      objc_msgSend(v4, "PKStringForKey:", CFSTR("nonce"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pk_decodeHexadecimal");
      v10 = (NSData *)objc_claimAutoreleasedReturnValue();
      nonce = self->_nonce;
      self->_nonce = v10;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("signingKeyMaterial"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
      {
        v13 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 0);
        signingKeyMaterial = self->_signingKeyMaterial;
        self->_signingKeyMaterial = v13;

      }
      objc_msgSend(v4, "PKStringForKey:", CFSTR("partialTransactionDetailsSignature"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        v16 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v15, 0);
        partialSignature = self->_partialSignature;
        self->_partialSignature = v16;

      }
    }
  }

  return self;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  int64_t paymentPINFormat;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  paymentPINFormat = self->_paymentPINFormat;
  v6 = CFSTR("complex");
  if (paymentPINFormat != 2)
    v6 = 0;
  if (paymentPINFormat == 1)
    v7 = CFSTR("sixDigits");
  else
    v7 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PINFormat"));
  PKTransactionAuthenticationMechanismToStrings(self->_requestedAuthenticationMechanisms);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("authenticationMechanisms"));

  PKTransactionAuthenticationMechanismToStrings(self->_processedAuthenticationMechanisms);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("processedAuthenticationMechanisms"));

  PKTransactionAuthenticationMechanismToStrings(self->_dataCollectedAuthenticationMechanisms);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("dataCollectedAuthenticationMechanisms"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_complete);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("complete"));

  -[NSData hexEncoding](self->_nonce, "hexEncoding");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("nonce"));

  -[NSData base64EncodedStringWithOptions:](self->_signingKeyMaterial, "base64EncodedStringWithOptions:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("signingKeyMaterial"));

  -[NSData base64EncodedStringWithOptions:](self->_partialSignature, "base64EncodedStringWithOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("partialTransactionDetailsSignature"));

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  PKTransactionAuthenticationMechanismToStrings(self->_requestedAuthenticationMechanisms);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<PKTransactionAuthenticationContext, requested auth mechanisms: %@, PIN format: %ld, nonce: %tu bytes, signing key material: %tu bytes, partial signature: %tu bytes>"), v4, self->_paymentPINFormat, -[NSData length](self->_nonce, "length"), -[NSData length](self->_signingKeyMaterial, "length"), -[NSData length](self->_partialSignature, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t paymentPINFormat;
  id v5;

  paymentPINFormat = self->_paymentPINFormat;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", paymentPINFormat, CFSTR("PINFormat"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_requestedAuthenticationMechanisms, CFSTR("authenticationMechanisms"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_processedAuthenticationMechanisms, CFSTR("processedAuthenticationMechanisms"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dataCollectedAuthenticationMechanisms, CFSTR("dataCollectedAuthenticationMechanisms"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_complete, CFSTR("complete"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signingKeyMaterial, CFSTR("signingKeyMaterial"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_partialSignature, CFSTR("partialTransactionDetailsSignature"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_authenticationFailure, CFSTR("authenticationError"));

}

- (PKTransactionAuthenticationContext)initWithCoder:(id)a3
{
  id v4;
  PKTransactionAuthenticationContext *v5;
  uint64_t v6;
  NSData *nonce;
  uint64_t v8;
  NSData *signingKeyMaterial;
  uint64_t v10;
  NSData *partialSignature;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionAuthenticationContext;
  v5 = -[PKTransactionAuthenticationContext init](&v13, sel_init);
  if (v5)
  {
    v5->_paymentPINFormat = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PINFormat"));
    v5->_requestedAuthenticationMechanisms = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("authenticationMechanisms"));
    v5->_processedAuthenticationMechanisms = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("processedAuthenticationMechanisms"));
    v5->_dataCollectedAuthenticationMechanisms = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dataCollectedAuthenticationMechanisms"));
    v5->_complete = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("complete"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v6 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signingKeyMaterial"));
    v8 = objc_claimAutoreleasedReturnValue();
    signingKeyMaterial = v5->_signingKeyMaterial;
    v5->_signingKeyMaterial = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partialTransactionDetailsSignature"));
    v10 = objc_claimAutoreleasedReturnValue();
    partialSignature = v5->_partialSignature;
    v5->_partialSignature = (NSData *)v10;

    v5->_authenticationFailure = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("authenticationError"));
  }

  return v5;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_nonce);
  objc_msgSend(v3, "safelyAddObject:", self->_signingKeyMaterial);
  objc_msgSend(v3, "safelyAddObject:", self->_partialSignature);
  v4 = (void *)objc_msgSend(v3, "copy");
  v5 = PKCombinedHash(17, v4);

  v6 = self->_requestedAuthenticationMechanisms - v5 + 32 * v5;
  v7 = self->_processedAuthenticationMechanisms - v6 + 32 * v6;
  v8 = self->_dataCollectedAuthenticationMechanisms - v7 + 32 * v7;
  v9 = self->_complete - v8 + 32 * v8;
  v10 = self->_authenticationFailure - v9 + 32 * v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKTransactionAuthenticationContext *v4;
  PKTransactionAuthenticationContext *v5;
  BOOL v6;

  v4 = (PKTransactionAuthenticationContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransactionAuthenticationContext isEqualToTransactionAuthenticationContext:](self, "isEqualToTransactionAuthenticationContext:", v5);

  return v6;
}

- (BOOL)isEqualToTransactionAuthenticationContext:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSData *nonce;
  NSData *v7;
  NSData *signingKeyMaterial;
  NSData *v9;
  NSData *partialSignature;
  NSData *v11;
  char v12;

  v4 = a3;
  v5 = v4;
  if (self->_paymentPINFormat != v4[5]
    || self->_requestedAuthenticationMechanisms != v4[2]
    || self->_processedAuthenticationMechanisms != v4[3]
    || self->_dataCollectedAuthenticationMechanisms != v4[4]
    || self->_complete != *((unsigned __int8 *)v4 + 8)
    || self->_authenticationFailure != v4[9])
  {
    goto LABEL_19;
  }
  nonce = self->_nonce;
  v7 = (NSData *)v5[6];
  if (nonce && v7)
  {
    if ((-[NSData isEqual:](nonce, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (nonce != v7)
  {
    goto LABEL_19;
  }
  signingKeyMaterial = self->_signingKeyMaterial;
  v9 = (NSData *)v5[7];
  if (!signingKeyMaterial || !v9)
  {
    if (signingKeyMaterial == v9)
      goto LABEL_15;
LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  if ((-[NSData isEqual:](signingKeyMaterial, "isEqual:") & 1) == 0)
    goto LABEL_19;
LABEL_15:
  partialSignature = self->_partialSignature;
  v11 = (NSData *)v5[8];
  if (partialSignature && v11)
    v12 = -[NSData isEqual:](partialSignature, "isEqual:");
  else
    v12 = partialSignature == v11;
LABEL_20:

  return v12;
}

- (unint64_t)requestedAuthenticationMechanisms
{
  return self->_requestedAuthenticationMechanisms;
}

- (void)setRequestedAuthenticationMechanisms:(unint64_t)a3
{
  self->_requestedAuthenticationMechanisms = a3;
}

- (unint64_t)processedAuthenticationMechanisms
{
  return self->_processedAuthenticationMechanisms;
}

- (void)setProcessedAuthenticationMechanisms:(unint64_t)a3
{
  self->_processedAuthenticationMechanisms = a3;
}

- (unint64_t)dataCollectedAuthenticationMechanisms
{
  return self->_dataCollectedAuthenticationMechanisms;
}

- (void)setDataCollectedAuthenticationMechanisms:(unint64_t)a3
{
  self->_dataCollectedAuthenticationMechanisms = a3;
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (int64_t)paymentPINFormat
{
  return self->_paymentPINFormat;
}

- (void)setPaymentPINFormat:(int64_t)a3
{
  self->_paymentPINFormat = a3;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)signingKeyMaterial
{
  return self->_signingKeyMaterial;
}

- (void)setSigningKeyMaterial:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)partialSignature
{
  return self->_partialSignature;
}

- (void)setPartialSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)authenticationFailure
{
  return self->_authenticationFailure;
}

- (void)setAuthenticationFailure:(int64_t)a3
{
  self->_authenticationFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialSignature, 0);
  objc_storeStrong((id *)&self->_signingKeyMaterial, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end
