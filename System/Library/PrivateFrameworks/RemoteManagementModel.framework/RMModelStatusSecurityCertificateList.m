@implementation RMModelStatusSecurityCertificateList

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("_removed");
  v6[2] = CFSTR("declaration-identifier");
  v6[3] = CFSTR("subject-summary");
  v6[4] = CFSTR("is-identity");
  v6[5] = CFSTR("data");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return CFSTR("security.certificate.list");
}

- (BOOL)isArrayValue
{
  return 1;
}

+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 declarationIdentifier:(id)a5 subjectSummary:(id)a6 isIdentity:(id)a7 data:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setStatusIdentifier:", v18);

  if (v17)
    v20 = v17;
  else
    v20 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v19, "setStatusRemoved:", v20);

  objc_msgSend(v19, "setStatusDeclarationIdentifier:", v16);
  objc_msgSend(v19, "setStatusSubjectSummary:", v15);

  objc_msgSend(v19, "setStatusIsIdentity:", v14);
  objc_msgSend(v19, "setStatusData:", v13);

  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 subjectSummary:(id)a4 isIdentity:(id)a5 data:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setStatusIdentifier:", v12);

  objc_msgSend(v13, "setStatusSubjectSummary:", v11);
  objc_msgSend(v13, "setStatusIsIdentity:", v10);

  objc_msgSend(v13, "setStatusData:", v9);
  return v13;
}

+ (id)supportedOS
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[6];
  _QWORD v29[8];

  v29[6] = *MEMORY[0x24BDAC8D0];
  v28[0] = &unk_25162B200;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628368);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628380);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  v28[1] = &unk_25162B218;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628398);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516283B0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  v28[2] = &unk_25162B230;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516283C8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516283E0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  v28[3] = &unk_25162B248;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516283F8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628410);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v4;
  v28[4] = &unk_25162B260;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628428);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628440);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v7;
  v28[5] = &unk_25162B278;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628458);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251628470);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a4;
  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelStatusSecurityCertificateList allowedStatusKeys](RMModelStatusSecurityCertificateList, "allowedStatusKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (!-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("identifier"), CFSTR("statusIdentifier"), 1, 0, a5))goto LABEL_7;
  v14 = 0;
  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("_removed"), CFSTR("statusRemoved"), 0, MEMORY[0x24BDBD1C0], a5))
  {
    v14 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("declaration-identifier"), CFSTR("statusDeclarationIdentifier"), 0, 0, a5))
    {
      if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("subject-summary"), CFSTR("statusSubjectSummary"), 1, 0, a5)&& -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("is-identity"), CFSTR("statusIsIdentity"), 1, 0, a5))
      {
        v14 = -[RMModelPayloadBase loadDataFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:](self, "loadDataFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:", v8, CFSTR("data"), CFSTR("statusData"), 1, 0, v6, a5);
        goto LABEL_8;
      }
LABEL_7:
      v14 = 0;
    }
  }
LABEL_8:

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  -[RMModelStatusSecurityCertificateList statusIdentifier](self, "statusIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("identifier"), v6, 1, 0);

  -[RMModelStatusSecurityCertificateList statusRemoved](self, "statusRemoved");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("_removed"), v7, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelStatusSecurityCertificateList statusDeclarationIdentifier](self, "statusDeclarationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("declaration-identifier"), v8, 0, 0);

  -[RMModelStatusSecurityCertificateList statusSubjectSummary](self, "statusSubjectSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("subject-summary"), v9, 1, 0);

  -[RMModelStatusSecurityCertificateList statusIsIdentity](self, "statusIsIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("is-identity"), v10, 1, 0);

  -[RMModelStatusSecurityCertificateList statusData](self, "statusData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeDataIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:](self, "serializeDataIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:", v5, CFSTR("data"), v11, 1, 0, v3);

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RMModelStatusSecurityCertificateList;
  v4 = -[RMModelPayloadBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_statusRemoved, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_statusDeclarationIdentifier, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_statusSubjectSummary, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_statusIsIdentity, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSData copy](self->_statusData, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  return v4;
}

- (NSString)statusIdentifier
{
  return self->_statusIdentifier;
}

- (void)setStatusIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)statusRemoved
{
  return self->_statusRemoved;
}

- (void)setStatusRemoved:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)statusDeclarationIdentifier
{
  return self->_statusDeclarationIdentifier;
}

- (void)setStatusDeclarationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)statusSubjectSummary
{
  return self->_statusSubjectSummary;
}

- (void)setStatusSubjectSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)statusIsIdentity
{
  return self->_statusIsIdentity;
}

- (void)setStatusIsIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)statusData
{
  return self->_statusData;
}

- (void)setStatusData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusData, 0);
  objc_storeStrong((id *)&self->_statusIsIdentity, 0);
  objc_storeStrong((id *)&self->_statusSubjectSummary, 0);
  objc_storeStrong((id *)&self->_statusDeclarationIdentifier, 0);
  objc_storeStrong((id *)&self->_statusRemoved, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end
