@implementation SPRPINData

- (SPRPINData)initWithPinCipherBlob:(id)a3 pinKeyBlob:(id)a4 casd:(id)a5 pinAppletAttestationData:(id)a6 pinKEKHash:(id)a7 isPinBypass:(BOOL)a8
{
  NSData *v14;
  NSData *v15;
  NSData *v16;
  NSData *v17;
  NSData *v18;
  NSData *pinBlock;
  NSData *pinCipherBlob;
  NSData *v21;
  NSData *pinKeyBlob;
  NSData *v23;
  NSData *casd;
  NSData *v25;
  NSData *pinAppletAttestationData;
  NSData *v27;
  NSData *pinKEKHash;

  v14 = (NSData *)a3;
  v15 = (NSData *)a4;
  v16 = (NSData *)a5;
  v17 = (NSData *)a6;
  v18 = (NSData *)a7;
  pinBlock = self->_pinBlock;
  self->_pinBlock = 0;

  pinCipherBlob = self->_pinCipherBlob;
  self->_pinCipherBlob = v14;
  v21 = v14;

  pinKeyBlob = self->_pinKeyBlob;
  self->_pinKeyBlob = v15;
  v23 = v15;

  casd = self->_casd;
  self->_casd = v16;
  v25 = v16;

  pinAppletAttestationData = self->_pinAppletAttestationData;
  self->_pinAppletAttestationData = v17;
  v27 = v17;

  pinKEKHash = self->_pinKEKHash;
  self->_pinKEKHash = v18;

  self->_isPinBypass = a8;
  return self;
}

- (SPRPINData)initWithPinBlock:(id)a3 casd:(id)a4 pinAppletAttestationData:(id)a5 pinKEKHash:(id)a6
{
  NSData *v10;
  NSData *v11;
  NSData *v12;
  NSData *v13;
  NSData *pinBlock;
  NSData *v15;
  NSData *casd;
  NSData *v17;
  NSData *pinAppletAttestationData;
  NSData *v19;
  NSData *pinKEKHash;

  v10 = (NSData *)a3;
  v11 = (NSData *)a4;
  v12 = (NSData *)a5;
  v13 = (NSData *)a6;
  pinBlock = self->_pinBlock;
  self->_pinBlock = v10;
  v15 = v10;

  casd = self->_casd;
  self->_casd = v11;
  v17 = v11;

  pinAppletAttestationData = self->_pinAppletAttestationData;
  self->_pinAppletAttestationData = v12;
  v19 = v12;

  pinKEKHash = self->_pinKEKHash;
  self->_pinKEKHash = v13;

  self->_isPinBypass = 0;
  return self;
}

- (SPRPINData)initWithPinBlock:(id)a3 casd:(id)a4 pinAppletAttestationData:(id)a5 pinKEKHash:(id)a6 isPinBypass:(BOOL)a7
{
  NSData *v12;
  NSData *v13;
  NSData *v14;
  NSData *v15;
  NSData *pinBlock;
  NSData *v17;
  NSData *casd;
  NSData *v19;
  NSData *pinAppletAttestationData;
  NSData *v21;
  NSData *pinKEKHash;

  v12 = (NSData *)a3;
  v13 = (NSData *)a4;
  v14 = (NSData *)a5;
  v15 = (NSData *)a6;
  pinBlock = self->_pinBlock;
  self->_pinBlock = v12;
  v17 = v12;

  casd = self->_casd;
  self->_casd = v13;
  v19 = v13;

  pinAppletAttestationData = self->_pinAppletAttestationData;
  self->_pinAppletAttestationData = v14;
  v21 = v14;

  pinKEKHash = self->_pinKEKHash;
  self->_pinKEKHash = v15;

  self->_isPinBypass = a7;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRPINData)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSData *v9;
  NSData *pinBlock;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSData *v15;
  NSData *pinCipherBlob;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSData *v21;
  NSData *pinKeyBlob;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSData *v27;
  NSData *casd;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSData *v33;
  NSData *pinAppletAttestationData;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSData *v39;
  NSData *pinKEKHash;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("pinBlock"), v7, v8);
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  pinBlock = self->_pinBlock;
  self->_pinBlock = v9;

  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("pinCipherBlob"), v13, v14);
  v15 = (NSData *)objc_claimAutoreleasedReturnValue();
  pinCipherBlob = self->_pinCipherBlob;
  self->_pinCipherBlob = v15;

  v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("pinKeyBlob"), v19, v20);
  v21 = (NSData *)objc_claimAutoreleasedReturnValue();
  pinKeyBlob = self->_pinKeyBlob;
  self->_pinKeyBlob = v21;

  v23 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("casd"), v25, v26);
  v27 = (NSData *)objc_claimAutoreleasedReturnValue();
  casd = self->_casd;
  self->_casd = v27;

  v29 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, (uint64_t)CFSTR("pinAppletAttestationData"), v31, v32);
  v33 = (NSData *)objc_claimAutoreleasedReturnValue();
  pinAppletAttestationData = self->_pinAppletAttestationData;
  self->_pinAppletAttestationData = v33;

  v35 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, (uint64_t)CFSTR("pinKEKHash"), v37, v38);
  v39 = (NSData *)objc_claimAutoreleasedReturnValue();
  pinKEKHash = self->_pinKEKHash;
  self->_pinKEKHash = v39;

  v45 = objc_msgSend_decodeBoolForKey_(v4, v41, (uint64_t)CFSTR("isPinBypass"), v42, v43, v44);
  self->_isPinBypass = v45;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *pinBlock;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  pinBlock = self->_pinBlock;
  v26 = a3;
  objc_msgSend_encodeObject_forKey_(v26, v5, (uint64_t)pinBlock, (uint64_t)CFSTR("pinBlock"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v26, v8, (uint64_t)self->_pinCipherBlob, (uint64_t)CFSTR("pinCipherBlob"), v9, v10);
  objc_msgSend_encodeObject_forKey_(v26, v11, (uint64_t)self->_pinKeyBlob, (uint64_t)CFSTR("pinKeyBlob"), v12, v13);
  objc_msgSend_encodeObject_forKey_(v26, v14, (uint64_t)self->_casd, (uint64_t)CFSTR("casd"), v15, v16);
  objc_msgSend_encodeObject_forKey_(v26, v17, (uint64_t)self->_pinAppletAttestationData, (uint64_t)CFSTR("pinAppletAttestationData"), v18, v19);
  objc_msgSend_encodeObject_forKey_(v26, v20, (uint64_t)self->_pinKEKHash, (uint64_t)CFSTR("pinKEKHash"), v21, v22);
  objc_msgSend_encodeBool_forKey_(v26, v23, self->_isPinBypass, (uint64_t)CFSTR("isPinBypass"), v24, v25);

}

- (NSData)pinBlock
{
  return self->_pinBlock;
}

- (NSData)pinCipherBlob
{
  return self->_pinCipherBlob;
}

- (NSData)pinKeyBlob
{
  return self->_pinKeyBlob;
}

- (NSData)casd
{
  return self->_casd;
}

- (NSData)pinAppletAttestationData
{
  return self->_pinAppletAttestationData;
}

- (NSData)pinKEKHash
{
  return self->_pinKEKHash;
}

- (BOOL)isPinBypass
{
  return self->_isPinBypass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinKEKHash, 0);
  objc_storeStrong((id *)&self->_pinAppletAttestationData, 0);
  objc_storeStrong((id *)&self->_casd, 0);
  objc_storeStrong((id *)&self->_pinKeyBlob, 0);
  objc_storeStrong((id *)&self->_pinCipherBlob, 0);
  objc_storeStrong((id *)&self->_pinBlock, 0);
}

@end
