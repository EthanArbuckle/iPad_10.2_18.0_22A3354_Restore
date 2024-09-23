@implementation SESDesignatedKey

+ (id)withAID:(id)a3 slotNumber:(int64_t)a4 keyIdentifier:(id)a5 assetACL:(id)a6 assetACLAttestation:(id)a7 operationApprovalVersion:(int64_t)a8 designation:(int64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (_QWORD *)objc_opt_new();
  v19 = (void *)v18[3];
  v18[3] = v14;
  v20 = v14;

  v18[4] = a4;
  v21 = (void *)v18[2];
  v18[2] = v15;
  v22 = v15;

  v23 = (void *)v18[5];
  v18[5] = v16;
  v24 = v16;

  v25 = (void *)v18[6];
  v18[6] = v17;

  v18[7] = a8;
  v18[1] = a9;
  return v18;
}

+ (id)fromDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("slotNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      SESDefaultLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v15 = 138412546;
        v16 = objc_opt_class();
        v17 = 2112;
        v18 = CFSTR("slotNumber");
        _os_log_impl(&dword_20A048000, v7, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
      }
      v12 = 0;
      goto LABEL_34;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("keyIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      SESDefaultLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v15 = 138412546;
        v16 = objc_opt_class();
        v17 = 2112;
        v18 = CFSTR("keyIdentifier");
        _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
      }
      v12 = 0;
      goto LABEL_33;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("assetACL"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      SESDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v15 = 138412546;
        v16 = objc_opt_class();
        v17 = 2112;
        v18 = CFSTR("assetACL");
        _os_log_impl(&dword_20A048000, v9, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
      }
      v12 = 0;
      goto LABEL_32;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("assetACLAttestation"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      SESDefaultLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v15 = 138412546;
        v16 = objc_opt_class();
        v17 = 2112;
        v18 = CFSTR("assetACLAttestation");
        _os_log_impl(&dword_20A048000, v10, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
      }
      v12 = 0;
      goto LABEL_31;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("oaVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("designation"));
      v11 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)(v4 + 24), v5);
        *(_QWORD *)(v4 + 32) = -[NSObject integerValue](v6, "integerValue");
        objc_storeStrong((id *)(v4 + 16), v7);
        objc_storeStrong((id *)(v4 + 40), v8);
        objc_storeStrong((id *)(v4 + 48), v9);
        *(_QWORD *)(v4 + 56) = -[NSObject integerValue](v10, "integerValue");
        *(_QWORD *)(v4 + 8) = -[NSObject integerValue](v11, "integerValue");
        v12 = (id)v4;
LABEL_30:

LABEL_31:
LABEL_32:

LABEL_33:
LABEL_34:

        goto LABEL_35;
      }
      SESDefaultLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v15 = 138412546;
        v16 = objc_opt_class();
        v17 = 2112;
        v18 = CFSTR("designation");
        _os_log_impl(&dword_20A048000, v13, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
      }

    }
    else
    {
      SESDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v15 = 138412546;
        v16 = objc_opt_class();
        v17 = 2112;
        v18 = CFSTR("oaVersion");
        _os_log_impl(&dword_20A048000, v11, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
      }
    }
    v12 = 0;
    goto LABEL_30;
  }
  SESDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v15 = 138412546;
    v16 = objc_opt_class();
    v17 = 2112;
    v18 = CFSTR("AID");
    _os_log_impl(&dword_20A048000, v6, OS_LOG_TYPE_FAULT, "Wrong type (%@) for key (%@)", (uint8_t *)&v15, 0x16u);
  }
  v12 = 0;
LABEL_35:

  return v12;
}

- (id)asDictionary
{
  int64_t slotNumber;
  void *v4;
  NSData *keyIdentifier;
  NSData *assetACLAttestation;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x24BDAC8D0];
  slotNumber = self->_slotNumber;
  v12[0] = self->_aid;
  v11[0] = CFSTR("AID");
  v11[1] = CFSTR("slotNumber");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", slotNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  keyIdentifier = self->_keyIdentifier;
  v12[1] = v4;
  v12[2] = keyIdentifier;
  v11[2] = CFSTR("keyIdentifier");
  v11[3] = CFSTR("assetACL");
  assetACLAttestation = self->_assetACLAttestation;
  v12[3] = self->_assetACL;
  v12[4] = assetACLAttestation;
  v11[4] = CFSTR("assetACLAttestation");
  v11[5] = CFSTR("oaVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_operationApprovalVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v7;
  v11[6] = CFSTR("designation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_designation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)designation
{
  return self->_designation;
}

- (NSData)keyIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)aid
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)slotNumber
{
  return self->_slotNumber;
}

- (NSData)assetACL
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)assetACLAttestation
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)operationApprovalVersion
{
  return self->_operationApprovalVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetACLAttestation, 0);
  objc_storeStrong((id *)&self->_assetACL, 0);
  objc_storeStrong((id *)&self->_aid, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end
