@implementation STSCHWiFiAwareSecurityInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *cipherSuite;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  id v10;

  cipherSuite = self->_cipherSuite;
  v10 = a3;
  objc_msgSend_encodeObject_forKey_(v10, v5, (uint64_t)cipherSuite, CFSTR("cipherSuite"));
  objc_msgSend_encodeObject_forKey_(v10, v6, (uint64_t)self->_dhInfo, CFSTR("dhInfo"));
  objc_msgSend_encodeObject_forKey_(v10, v7, (uint64_t)self->_passphrase, CFSTR("passphrase"));
  objc_msgSend_encodeObject_forKey_(v10, v8, (uint64_t)self->_datapathPmk, CFSTR("datapathPmk"));
  objc_msgSend_encodeObject_forKey_(v10, v9, (uint64_t)self->_datapathPmkID, CFSTR("datapathPmkID"));

}

- (STSCHWiFiAwareSecurityInfo)initWithCoder:(id)a3
{
  id v4;
  STSCHWiFiAwareSecurityInfo *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSArray *cipherSuite;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSArray *dhInfo;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSString *passphrase;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSData *datapathPmk;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSData *datapathPmkID;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)STSCHWiFiAwareSecurityInfo;
  v5 = -[STSCHWiFiAwareSecurityInfo init](&v35, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v10, CFSTR("cipherSuite"));
    v12 = objc_claimAutoreleasedReturnValue();
    cipherSuite = v5->_cipherSuite;
    v5->_cipherSuite = (NSArray *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend_setWithObjects_(v14, v17, v15, v16, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, CFSTR("dhInfo"));
    v20 = objc_claimAutoreleasedReturnValue();
    dhInfo = v5->_dhInfo;
    v5->_dhInfo = (NSArray *)v20;

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, CFSTR("passphrase"));
    v24 = objc_claimAutoreleasedReturnValue();
    passphrase = v5->_passphrase;
    v5->_passphrase = (NSString *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, CFSTR("datapathPmk"));
    v28 = objc_claimAutoreleasedReturnValue();
    datapathPmk = v5->_datapathPmk;
    v5->_datapathPmk = (NSData *)v28;

    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, CFSTR("datapathPmkID"));
    v32 = objc_claimAutoreleasedReturnValue();
    datapathPmkID = v5->_datapathPmkID;
    v5->_datapathPmkID = (NSData *)v32;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  STSCHWiFiAwareSecurityInfo *v4;
  STSCHWiFiAwareSecurityInfo *v5;
  STSCHWiFiAwareSecurityInfo *v6;
  NSArray *cipherSuite;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  NSArray *dhInfo;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSString *passphrase;
  void *v29;
  const char *v30;
  int isEqualToString;
  NSData *datapathPmk;
  void *v33;
  const char *v34;
  int v35;
  NSData *datapathPmkID;
  void *v37;
  const char *v38;
  char isEqualToData;

  v4 = (STSCHWiFiAwareSecurityInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToData = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    cipherSuite = self->_cipherSuite;
    objc_msgSend_cipherSuite(v6, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(cipherSuite) = objc_msgSend_isEqualToArray_(cipherSuite, v11, (uint64_t)v10);

    if (!(_DWORD)cipherSuite)
      goto LABEL_15;
    dhInfo = self->_dhInfo;
    objc_msgSend_dhInfo(v6, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(dhInfo) = objc_msgSend_isEqualToArray_(dhInfo, v16, (uint64_t)v15);

    if (!(_DWORD)dhInfo)
      goto LABEL_15;
    v19 = objc_msgSend_length(self->_passphrase, v17, v18);
    objc_msgSend_passphrase(v6, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_length(v22, v23, v24);

    if (v19 != v25)
      goto LABEL_15;
    passphrase = self->_passphrase;
    if (passphrase)
    {
      objc_msgSend_passphrase(v6, v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(passphrase, v30, (uint64_t)v29);

      if (!isEqualToString)
        goto LABEL_15;
    }
    datapathPmk = self->_datapathPmk;
    if (!datapathPmk
      || (objc_msgSend_datapathPmk(v6, v26, v27),
          v33 = (void *)objc_claimAutoreleasedReturnValue(),
          v35 = objc_msgSend_isEqualToData_(datapathPmk, v34, (uint64_t)v33),
          v33,
          v35))
    {
      datapathPmkID = self->_datapathPmkID;
      if (datapathPmkID)
      {
        objc_msgSend_datapathPmkID(v6, v26, v27);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToData = objc_msgSend_isEqualToData_(datapathPmkID, v38, (uint64_t)v37);

      }
      else
      {
        isEqualToData = 1;
      }
    }
    else
    {
LABEL_15:
      isEqualToData = 0;
    }

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;

  if (self->_datapathPmk)
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("PMK & PMKID %@available"), &stru_24C2B35E8);
  else
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("PMK & PMKID %@available"), CFSTR("not "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_description(self->_cipherSuite, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(self->_passphrase, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(self->_dhInfo, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v14, (uint64_t)CFSTR("cipherSuite=%@, password=%@, DH=%@, %@"), v7, v10, v13, v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (STSCHWiFiAwareSecurityInfo)initWithCipherSuites:(id)a3 dhInfo:(id)a4 passphrase:(id)a5
{
  id v8;
  id v9;
  id v10;
  STSCHWiFiAwareSecurityInfo *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  NSArray *cipherSuite;
  id v16;
  const char *v17;
  uint64_t v18;
  NSArray *dhInfo;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)STSCHWiFiAwareSecurityInfo;
  v11 = -[STSCHWiFiAwareSecurityInfo init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BDBCE30]);
    v14 = objc_msgSend_initWithArray_(v12, v13, (uint64_t)v8);
    cipherSuite = v11->_cipherSuite;
    v11->_cipherSuite = (NSArray *)v14;

    v16 = objc_alloc(MEMORY[0x24BDBCE30]);
    v18 = objc_msgSend_initWithArray_(v16, v17, (uint64_t)v9);
    dhInfo = v11->_dhInfo;
    v11->_dhInfo = (NSArray *)v18;

    objc_storeStrong((id *)&v11->_passphrase, a5);
  }

  return v11;
}

- (STSCHWiFiAwareSecurityInfo)initWithPMK:(id)a3 pmkID:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  STSCHWiFiAwareSecurityInfo *v11;
  id *p_isa;
  STSCHWiFiAwareSecurityInfo *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend_length(v8, v9, v10) == 16)
  {
    v15.receiver = self;
    v15.super_class = (Class)STSCHWiFiAwareSecurityInfo;
    v11 = -[STSCHWiFiAwareSecurityInfo init](&v15, sel_init);
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_datapathPmk, a3);
      objc_storeStrong(p_isa + 5, a4);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)asData
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  NSArray *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  NSArray *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  NSString *passphrase;
  const char *v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  const char *v37;
  void *v38;
  const char *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_data(MEMORY[0x24BDBCEC8], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_cipherSuite, v5, v6))
  {
    v49 = objc_msgSend_count(self->_cipherSuite, v7, v8) + 1;
    objc_msgSend_appendBytes_length_(v4, v9, (uint64_t)&v49, 1);
    objc_msgSend_appendBytes_length_(v4, v10, (uint64_t)&unk_20A030501, 1);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v11 = self->_cipherSuite;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v45, v51, 16);
    if (v13)
    {
      v16 = v13;
      v17 = *(_QWORD *)v46;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v46 != v17)
            objc_enumerationMutation(v11);
          v49 = objc_msgSend_unsignedCharValue(*(void **)(*((_QWORD *)&v45 + 1) + 8 * v18), v14, v15);
          objc_msgSend_appendBytes_length_(v4, v19, (uint64_t)&v49, 1);
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v45, v51, 16);
      }
      while (v16);
    }

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v20 = self->_dhInfo;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v41, v50, 16);
  if (v22)
  {
    v25 = v22;
    v26 = *(_QWORD *)v42;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(v20);
        objc_msgSend_asData(*(void **)(*((_QWORD *)&v41 + 1) + 8 * v27), v23, v24, (_QWORD)v41);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendData_(v4, v29, (uint64_t)v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v41, v50, 16);
    }
    while (v25);
  }

  passphrase = self->_passphrase;
  if (passphrase && objc_msgSend_length(passphrase, v30, v31))
  {
    v49 = objc_msgSend_length(self->_passphrase, v33, v34) + 1;
    objc_msgSend_appendBytes_length_(v4, v35, (uint64_t)&v49, 1);
    objc_msgSend_appendBytes_length_(v4, v36, (uint64_t)&unk_20A030502, 1);
    objc_msgSend_dataUsingEncoding_(self->_passphrase, v37, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendData_(v4, v39, (uint64_t)v38);

  }
  return v4;
}

- (NSArray)cipherSuite
{
  return self->_cipherSuite;
}

- (void)setCipherSuite:(id)a3
{
  objc_storeStrong((id *)&self->_cipherSuite, a3);
}

- (NSArray)dhInfo
{
  return self->_dhInfo;
}

- (void)setDhInfo:(id)a3
{
  objc_storeStrong((id *)&self->_dhInfo, a3);
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(id)a3
{
  objc_storeStrong((id *)&self->_passphrase, a3);
}

- (NSData)datapathPmk
{
  return self->_datapathPmk;
}

- (void)setDatapathPmk:(id)a3
{
  objc_storeStrong((id *)&self->_datapathPmk, a3);
}

- (NSData)datapathPmkID
{
  return self->_datapathPmkID;
}

- (void)setDatapathPmkID:(id)a3
{
  objc_storeStrong((id *)&self->_datapathPmkID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datapathPmkID, 0);
  objc_storeStrong((id *)&self->_datapathPmk, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_dhInfo, 0);
  objc_storeStrong((id *)&self->_cipherSuite, 0);
}

@end
