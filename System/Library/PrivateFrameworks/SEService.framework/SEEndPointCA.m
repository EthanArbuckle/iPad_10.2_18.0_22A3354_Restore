@implementation SEEndPointCA

+ (id)endPointCAWithIdentifier:(id)a3 subjectIdentifier:(id)a4 instanceAID:(id)a5 secureElementAttestation:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (v12 && v13 && v15 && a7)
  {
    v17 = objc_opt_new();
    objc_storeStrong((id *)(v17 + 8), a3);
    objc_storeStrong((id *)(v17 + 24), a4);
    objc_storeStrong((id *)(v17 + 40), a6);
    v18 = v14;
    v19 = *(void **)(v17 + 16);
    *(_QWORD *)(v17 + 16) = v18;
  }
  else
  {
    if (!a7)
    {
      v17 = 0;
      goto LABEL_10;
    }
    SESDefaultLogObject();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v17 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return (id)v17;
}

- (id)encodeWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)decodeWithData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = a3;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  -[SEEndPointCA identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointCA instanceAID](self, "instanceAID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asHexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointCA subjectIdentifier](self, "subjectIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointCA secureElementAttestation](self, "secureElementAttestation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asHexString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointCA certificates](self, "certificates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Identifier : %@ InstanceAID %@ : {\n\tsubjectIdentifier : %@\n\tsecureElementAttestation : %@\n\tcertificates (%lu) : {\n"), v4, v6, v7, v9, objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SEEndPointCA certificates](self, "certificates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "asHexString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendFormat:", CFSTR("\t\t : %@,\n"), v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "appendString:", CFSTR("\t}\n}"));
  return v11;
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v3 = (void *)objc_opt_new();
  -[SEEndPointCA identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SEEndPointCA identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));

  }
  -[SEEndPointCA subjectIdentifier](self, "subjectIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SEEndPointCA subjectIdentifier](self, "subjectIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("subjectIdentifier"));

  }
  -[SEEndPointCA instanceAID](self, "instanceAID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SEEndPointCA instanceAID](self, "instanceAID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("instanceAID"));

  }
  -[SEEndPointCA certificates](self, "certificates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __25__SEEndPointCA_dumpState__block_invoke;
  v13[3] = &unk_24C2BCE88;
  v11 = v3;
  v14 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

  return v11;
}

void __25__SEEndPointCA_dumpState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "asHexString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("certificate-%u"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SEEndPointCA identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[SEEndPointCA subjectIdentifier](self, "subjectIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subjectIdentifier"));

  -[SEEndPointCA secureElementAttestation](self, "secureElementAttestation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("secureElementAttestation"));

  -[SEEndPointCA certificates](self, "certificates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("certificates"));

  -[SEEndPointCA instanceAID](self, "instanceAID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("instanceAID"));

}

- (SEEndPointCA)initWithCoder:(id)a3
{
  id v4;
  SEEndPointCA *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *subjectIdentifier;
  uint64_t v10;
  NSData *secureElementAttestation;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *certificates;
  uint64_t v17;
  NSData *instanceAID;
  NSObject *v19;
  uint64_t v20;
  NSData *v21;
  uint8_t buf[16];
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SEEndPointCA;
  v5 = -[SEEndPointCA init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subjectIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    subjectIdentifier = v5->_subjectIdentifier;
    v5->_subjectIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementAttestation"));
    v10 = objc_claimAutoreleasedReturnValue();
    secureElementAttestation = v5->_secureElementAttestation;
    v5->_secureElementAttestation = (NSData *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("certificates"));
    v15 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("instanceAID"));
    v17 = objc_claimAutoreleasedReturnValue();
    instanceAID = v5->_instanceAID;
    v5->_instanceAID = (NSData *)v17;

    if (!v5->_instanceAID)
    {
      SESDefaultLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A048000, v19, OS_LOG_TYPE_INFO, "InstanceAID missing in CA, assuming legacy (CCC) AID", buf, 2u);
      }

      objc_msgSend(CFSTR("A000000809434343444B417631"), "hexStringAsData");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v5->_instanceAID;
      v5->_instanceAID = (NSData *)v20;

    }
  }

  return v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)instanceAID
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)subjectIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)secureElementAttestation
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElementAttestation, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_subjectIdentifier, 0);
  objc_storeStrong((id *)&self->_instanceAID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
