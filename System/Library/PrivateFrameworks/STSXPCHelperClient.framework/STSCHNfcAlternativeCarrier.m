@implementation STSCHNfcAlternativeCarrier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STSCHNfcAlternativeCarrier;
  v4 = a3;
  -[STSCHAlternativeCarrier encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_maxLc, CFSTR("maxLc"), v7.receiver, v7.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_maxLe, CFSTR("maxLe"));

}

- (STSCHNfcAlternativeCarrier)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  STSCHNfcAlternativeCarrier *v6;
  const char *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSCHNfcAlternativeCarrier;
  v6 = -[STSCHAlternativeCarrier initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_maxLc = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("maxLc"));
    v6->_maxLe = objc_msgSend_decodeIntegerForKey_(v4, v7, (uint64_t)CFSTR("maxLe"));
  }

  return v6;
}

- (STSCHNfcAlternativeCarrier)initWithMaxLcField:(int64_t)a3 maxLeField:(int64_t)a4 auxiliaryRecords:(id)a5
{
  id v8;
  STSCHNfcAlternativeCarrier *v9;
  const char *v10;
  STSCHNfcAlternativeCarrier *v11;
  int64_t v12;
  int64_t v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  objc_super v21;

  v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)STSCHNfcAlternativeCarrier;
  v9 = -[STSCHNfcAlternativeCarrier init](&v21, sel_init);
  v11 = v9;
  if (v9)
  {
    v12 = 4096;
    if (a3 >= 1)
      v13 = a3;
    else
      v13 = 4096;
    v9->_maxLc = v13;
    if (a4 >= 1)
      v12 = a4;
    v9->_maxLe = v12;
    objc_msgSend_setType_(v9, v10, 3);
    objc_msgSend_setPowerState_(v11, v14, 1);
    objc_msgSend_setAuxiliaryRecords_(v11, v15, (uint64_t)v8);
    objc_msgSend__createCarrierConfigurationRecord(v11, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCarrierRecord_(v11, v19, (uint64_t)v18);

  }
  return v11;
}

- (STSCHNfcAlternativeCarrier)initWithNdefRecordBundle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  STSCHNfcAlternativeCarrier *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  _BYTE *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  unsigned __int8 *v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unint64_t v37;
  unsigned __int8 v38;
  STSCHNfcAlternativeCarrier *v39;
  __CFString *v40;
  uint64_t v41;
  uint64_t v43;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)STSCHNfcAlternativeCarrier;
  v7 = -[STSCHAlternativeCarrier initWithNdefRecordBundle:](&v44, sel_initWithNdefRecordBundle_, v4);
  if (!v7)
    goto LABEL_19;
  objc_msgSend_configurationRecord(v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_payload(v8, v9, v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (_BYTE *)objc_msgSend_bytes(v11, v12, v13);

  objc_msgSend_configurationRecord(v4, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_payload(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_length(v20, v21, v22);

  v7->_maxLc = -1;
  v7->_maxLe = -1;
  if (v23 <= 0)
  {
    v40 = CFSTR("Invalid payload length");
    v41 = 67;
    goto LABEL_23;
  }
  if (*v14 != 1)
  {
    v40 = CFSTR("Invalid version");
    v41 = 72;
    goto LABEL_23;
  }
  if ((unint64_t)v23 < 2)
  {
LABEL_19:
    v39 = v7;
    goto LABEL_24;
  }
  v26 = v23 - 1;
  v27 = v14 + 1;
  v28 = v14 + 1;
  while (1)
  {
    v30 = *v28;
    v28 += 2;
    v29 = v30;
    v31 = v26 - 2;
    v32 = v26 - 2 - v30;
    if (v26 - 2 < v30)
      break;
    v33 = v27[1];
    if ((_DWORD)v33 == 2)
    {
      v7->_maxLe = 0;
      if ((_DWORD)v29)
      {
        v37 = 0;
        v35 = v29 - 1;
        do
        {
          v7->_maxLe = v37 << 8;
          v38 = *v28++;
          v7->_maxLe = v38 | (v37 << 8);
          LODWORD(v29) = v29 - 1;
          v37 = v38 | (v37 << 8);
        }
        while ((_BYTE)v29);
        goto LABEL_16;
      }
    }
    else
    {
      if ((_DWORD)v33 != 1)
      {
        sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSCHNfcAlternativeCarrier initWithNdefRecordBundle:]", 101, v7, CFSTR("Unrecognized tag: 0x%X"), v24, v25, v33);
        v28 += v29;
        v31 = v32;
        goto LABEL_18;
      }
      v7->_maxLc = 0;
      if ((_DWORD)v29)
      {
        v34 = 0;
        v35 = v29 - 1;
        do
        {
          v7->_maxLc = v34 << 8;
          v36 = *v28++;
          v7->_maxLc = v36 | (v34 << 8);
          LODWORD(v29) = v29 - 1;
          v34 = v36 | (v34 << 8);
        }
        while ((_BYTE)v29);
LABEL_16:
        v31 = v26 - v35 - 3;
      }
    }
LABEL_18:
    v26 = v31;
    v27 = v28;
    if (v31 <= 0)
      goto LABEL_19;
  }
  v40 = CFSTR("Invalid tag length");
  v41 = 86;
LABEL_23:
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHNfcAlternativeCarrier initWithNdefRecordBundle:]", v41, v7, v40, v24, v25, v43);
  v39 = 0;
LABEL_24:

  return v39;
}

+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int isNfcConfigurationRecord;
  id v11;
  const char *v12;
  void *v13;

  v4 = a3;
  objc_msgSend_configurationRecord(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isNfcConfigurationRecord = objc_msgSend_isNfcConfigurationRecord(v7, v8, v9);

  if (isNfcConfigurationRecord)
  {
    v11 = objc_alloc((Class)a1);
    v13 = (void *)objc_msgSend_initWithNdefRecordBundle_(v11, v12, (uint64_t)v4);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_createCarrierConfigurationRecord
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  STSNDEFRecord *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  __int16 v20;
  char v21;
  char v22;
  char v23;
  __int16 v24;
  char v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)&unk_20A0305C1, 17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(CFSTR("nfc"), v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 769;
  v21 = 1;
  v22 = (unsigned __int16)objc_msgSend_maxLc(self, v6, v7) >> 8;
  v23 = objc_msgSend_maxLc(self, v8, v9);
  v24 = 515;
  v25 = (unsigned __int16)objc_msgSend_maxLe(self, v10, v11) >> 8;
  v26 = objc_msgSend_maxLe(self, v12, v13);
  v14 = [STSNDEFRecord alloc];
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v15, (uint64_t)&v20, 9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_initWithFormat_type_identifier_payload_(v14, v17, 4, v3, v5, v16);

  return v18;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend_powerState(self, a2, v2);
  v8 = objc_msgSend_maxLc(self, v6, v7);
  v11 = objc_msgSend_maxLe(self, v9, v10);
  objc_msgSend_auxiliaryRecords(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v15, (uint64_t)CFSTR("{ type=nfc,powerState=%lu,maxLc=%ld,maxLe=%ld,aux=%@ }"), v5, v8, v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int64_t)maxLc
{
  return self->_maxLc;
}

- (void)setMaxLc:(int64_t)a3
{
  self->_maxLc = a3;
}

- (int64_t)maxLe
{
  return self->_maxLe;
}

- (void)setMaxLe:(int64_t)a3
{
  self->_maxLe = a3;
}

@end
