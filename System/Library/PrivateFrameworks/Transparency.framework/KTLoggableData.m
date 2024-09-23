@implementation KTLoggableData

- (KTLoggableData)initWithClientData:(id)a3
{
  id v5;
  KTLoggableData *v6;
  KTLoggableData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KTLoggableData;
  v6 = -[KTLoggableData init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientData, a3);
    v7->_result = 2;
    *(_DWORD *)&v7->_successfulSync = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  -[KTLoggableData deviceID](self, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v4, CFSTR("deviceID"));

  -[KTLoggableData clientData](self, "clientData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v5, CFSTR("clientData"));

  -[KTLoggableData signature](self, "signature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v6, CFSTR("signature"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTLoggableData successfulSync](self, "successfulSync"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v7, CFSTR("successfulSync"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTLoggableData marked](self, "marked"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v8, CFSTR("marked"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTLoggableData notInSyncedData](self, "notInSyncedData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v9, CFSTR("notInSync"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTLoggableData result](self, "result"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v10, CFSTR("result"));

  -[KTLoggableData failure](self, "failure");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDE84F8];
    -[KTLoggableData failure](self, "failure");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cleanseErrorForXPC:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v14, CFSTR("failure"));

  }
  -[KTLoggableData build](self, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[KTLoggableData build](self, "build");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v16, CFSTR("build"));

  }
  -[KTLoggableData product](self, "product");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[KTLoggableData product](self, "product");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v18, CFSTR("product"));

  }
  -[KTLoggableData version](self, "version");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[KTLoggableData version](self, "version");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v20, CFSTR("version"));

  }
  -[KTLoggableData markExpiryDate](self, "markExpiryDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[KTLoggableData markExpiryDate](self, "markExpiryDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v22, CFSTR("markExpiry"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTLoggableData ktCapable](self, "ktCapable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v23, CFSTR("ktCapable"));

}

- (KTLoggableData)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  KTLoggableData *v14;
  KTLoggableData *v15;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("successfulSync"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("marked"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notInSync"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("result"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v7, CFSTR("failure"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ktCapable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("build"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("product"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("markExpiry"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[KTLoggableData initWithClientData:]([KTLoggableData alloc], "initWithClientData:", v4);
  v15 = v14;
  if (v14 && v23 && v22)
  {
    -[KTLoggableData setDeviceID:](v14, "setDeviceID:", v21);
    -[KTLoggableData setSignature:](v15, "setSignature:", v17);
    -[KTLoggableData setSuccessfulSync:](v15, "setSuccessfulSync:", objc_msgSend(v23, "BOOLValue"));
    -[KTLoggableData setMarked:](v15, "setMarked:", objc_msgSend(v22, "BOOLValue"));
    -[KTLoggableData setNotInSyncedData:](v15, "setNotInSyncedData:", objc_msgSend(v20, "BOOLValue"));
    -[KTLoggableData setResult:](v15, "setResult:", objc_msgSend(v19, "unsignedIntegerValue"));
    -[KTLoggableData setFailure:](v15, "setFailure:", v8);
    -[KTLoggableData setKtCapable:](v15, "setKtCapable:", objc_msgSend(v9, "BOOLValue"));
    -[KTLoggableData setBuild:](v15, "setBuild:", v10);
    -[KTLoggableData setProduct:](v15, "setProduct:", v11);
    -[KTLoggableData setVersion:](v15, "setVersion:", v12);
    -[KTLoggableData setMarkExpiryDate:](v15, "setMarkExpiryDate:", v13);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  KTLoggableData *v4;
  KTLoggableData *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  _BOOL4 v25;
  _BOOL4 v26;

  v4 = (KTLoggableData *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[KTLoggableData deviceID](self, "deviceID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTLoggableData deviceID](v5, "deviceID");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[KTLoggableData deviceID](self, "deviceID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTLoggableData deviceID](v5, "deviceID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToData:", v10);

        if (!v11)
          goto LABEL_19;
      }
      -[KTLoggableData clientData](self, "clientData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTLoggableData clientData](v5, "clientData");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v13 == (void *)v14)
      {

      }
      else
      {
        v15 = (void *)v14;
        -[KTLoggableData clientData](self, "clientData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTLoggableData clientData](v5, "clientData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToData:", v17);

        if (!v18)
          goto LABEL_19;
      }
      -[KTLoggableData signature](self, "signature");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTLoggableData signature](v5, "signature");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v19 == (void *)v20)
      {

      }
      else
      {
        v21 = (void *)v20;
        -[KTLoggableData signature](self, "signature");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTLoggableData signature](v5, "signature");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToData:", v23);

        if (!v24)
          goto LABEL_19;
      }
      v25 = -[KTLoggableData successfulSync](self, "successfulSync");
      if (v25 == -[KTLoggableData successfulSync](v5, "successfulSync"))
      {
        v26 = -[KTLoggableData ktCapable](self, "ktCapable");
        if (v26 == -[KTLoggableData ktCapable](v5, "ktCapable"))
        {
          v12 = 1;
          goto LABEL_20;
        }
      }
LABEL_19:
      v12 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  unint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("{\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTLoggableData deviceID](self, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[KTLoggableData deviceID](self, "deviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "kt_hexString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("    deviceId:%@\n"), v6);

  }
  -[KTLoggableData product](self, "product");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    -[KTLoggableData version](self, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_7;
  }
  -[KTLoggableData product](self, "product");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTLoggableData build](self, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTLoggableData version](self, "version");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    product: %@ build: %@ version:%@\n"), v9, v10, v11);

LABEL_7:
  -[KTLoggableData clientData](self, "clientData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "kt_hexString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    clientData:%@\n"), v13);

  -[KTLoggableData signature](self, "signature");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[KTLoggableData signature](self, "signature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "kt_hexString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("    signature:%@\n"), v16);

  }
  if (-[KTLoggableData ktCapable](self, "ktCapable"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    ktCapable:%@\n"), v17);
  -[KTLoggableData deviceIdHash](self, "deviceIdHash");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[KTLoggableData deviceIdHash](self, "deviceIdHash");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "kt_hexString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("    deviceIdHash:%@\n"), v20);

  }
  -[KTLoggableData clientDataHash](self, "clientDataHash");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[KTLoggableData clientDataHash](self, "clientDataHash");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "kt_hexString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("    clientDataHash:%@\n"), v23);

  }
  if (-[KTLoggableData notInSyncedData](self, "notInSyncedData"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    notInSyncedData:%@\n"), v24);
  if (-[KTLoggableData result](self, "result"))
  {
    v25 = -[KTLoggableData result](self, "result");
    v26 = CFSTR("OK");
    if (v25 == 2)
      v26 = CFSTR("Pending");
  }
  else
  {
    v26 = CFSTR("Failed");
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("    result:%@\n"), v26);
  -[KTLoggableData failure](self, "failure");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[KTLoggableData failure](self, "failure");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("    failure:%@\n"), v28);

  }
  if (-[KTLoggableData marked](self, "marked"))
  {
    -[KTLoggableData markExpiryDate](self, "markExpiryDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("    markedExpiryDate:%@\n"), v29);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("}\n"));
  return v3;
}

- (id)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTLoggableData deviceID](self, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[KTLoggableData deviceID](self, "deviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "kt_hexString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceID"));

  }
  -[KTLoggableData clientData](self, "clientData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "kt_hexString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("clientData"));

  -[KTLoggableData signature](self, "signature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "kt_hexString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("signature"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTLoggableData ktCapable](self, "ktCapable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ktCapable"));

  -[KTLoggableData version](self, "version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[KTLoggableData version](self, "version");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("version"));

  }
  -[KTLoggableData product](self, "product");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[KTLoggableData product](self, "product");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("product"));

  }
  -[KTLoggableData build](self, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[KTLoggableData build](self, "build");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("build"));

  }
  -[KTLoggableData deviceIdHash](self, "deviceIdHash");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[KTLoggableData deviceIdHash](self, "deviceIdHash");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "kt_hexString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("deviceIDHash"));

  }
  -[KTLoggableData clientDataHash](self, "clientDataHash");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[KTLoggableData clientDataHash](self, "clientDataHash");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "kt_hexString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("clientDataHash"));

  }
  if (-[KTLoggableData result](self, "result") != 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTLoggableData result](self, "result"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("result"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTLoggableData notInSyncedData](self, "notInSyncedData"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("notInSyncedData"));

    -[KTLoggableData failure](self, "failure");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[KTLoggableData failure](self, "failure");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "description");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("failure"));

    }
  }
  if (-[KTLoggableData marked](self, "marked"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTLoggableData marked](self, "marked"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("marked"));

    -[KTLoggableData markExpiryDate](self, "markExpiryDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "kt_toISO_8601_UTCString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("markedExpiryDate"));

  }
  return v3;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  -[KTLoggableData product](self, "product");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || (-[KTLoggableData version](self, "version"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[KTLoggableData build](self, "build");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      -[KTLoggableData deviceID](self, "deviceID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "kt_hexString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTLoggableData clientData](self, "clientData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "kt_hexString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("KTLoggableData: deviceId=%@, clientData=%@"), v6, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[KTLoggableData deviceID](self, "deviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "kt_hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTLoggableData product](self, "product");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTLoggableData build](self, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTLoggableData version](self, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTLoggableData clientData](self, "clientData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "kt_hexString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("KTLoggableData: deviceId=%@, version=%@,%@,%@ clientData=%@"), v6, v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v12;
}

+ (void)loggableDataForDeviceID:(id)a3 application:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __70__KTLoggableData_loggableDataForDeviceID_application_completionBlock___block_invoke;
  v16[3] = &unk_24DC8EBC8;
  v18 = v7;
  v19 = v9;
  v17 = v8;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __70__KTLoggableData_loggableDataForDeviceID_application_completionBlock___block_invoke_89;
  v14[3] = &unk_24DC8EA78;
  v15 = v19;
  v11 = v19;
  v12 = v7;
  v13 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v16, v14);

}

void __70__KTLoggableData_loggableDataForDeviceID_application_completionBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_2 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_2, &__block_literal_global_2);
    v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_2;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21A250000, v11, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v12, 0xCu);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_2 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_2, &__block_literal_global_87);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_2;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)a1[4];
      v10 = a1[5];
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous fetch for device status for %@ device %@", (uint8_t *)&v12, 0x16u);
    }
    objc_msgSend(v5, "getLoggableDataForDeviceId:application:completionBlock:", a1[5], a1[4], a1[6]);
  }

}

void __70__KTLoggableData_loggableDataForDeviceID_application_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_2;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_2 = (uint64_t)v0;

}

void __70__KTLoggableData_loggableDataForDeviceID_application_completionBlock___block_invoke_86()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_2;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_2 = (uint64_t)v0;

}

uint64_t __70__KTLoggableData_loggableDataForDeviceID_application_completionBlock___block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)loggableDataForDeviceID:(id)a3 completionBlock:(id)a4
{
  +[KTLoggableData loggableDataForDeviceID:application:completionBlock:](KTLoggableData, "loggableDataForDeviceID:application:completionBlock:", a3, CFSTR("IDS"), a4);
}

+ (BOOL)isAccountKTCapable:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "ktCapable", (_QWORD)v12))
          {
            v10 = 0;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_12:

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

+ (void)combineLoggableDatasForUI:(id)a3 byAdding:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "deviceID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "result"))
          v14 = v13 == 0;
        else
          v14 = 1;
        if (v14)
        {
          objc_msgSend(v11, "deviceID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (NSData)deviceID
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSData)clientData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)successfulSync
{
  return self->_successfulSync;
}

- (void)setSuccessfulSync:(BOOL)a3
{
  self->_successfulSync = a3;
}

- (BOOL)ktCapable
{
  return self->_ktCapable;
}

- (void)setKtCapable:(BOOL)a3
{
  self->_ktCapable = a3;
}

- (NSString)build
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBuild:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)product
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProduct:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (unint64_t)result
{
  return self->_result;
}

- (void)setResult:(unint64_t)a3
{
  self->_result = a3;
}

- (NSError)failure
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFailure:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDate)markExpiryDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMarkExpiryDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)marked
{
  return self->_marked;
}

- (void)setMarked:(BOOL)a3
{
  self->_marked = a3;
}

- (NSData)deviceIdHash
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeviceIdHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setClientDataHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)notInSyncedData
{
  return self->_notInSyncedData;
}

- (void)setNotInSyncedData:(BOOL)a3
{
  self->_notInSyncedData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_deviceIdHash, 0);
  objc_storeStrong((id *)&self->_markExpiryDate, 0);
  objc_storeStrong((id *)&self->_failure, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
