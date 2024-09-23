@implementation RMProtocolStatusReport_StatusReason

+ (NSSet)allowedReportKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Code");
  v6[1] = CFSTR("Description");
  v6[2] = CFSTR("Details");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithCode:(id)a3 description:(id)a4 details:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setReportCode:", v9);

  objc_msgSend(v10, "setReportDescription:", v8);
  objc_msgSend(v10, "setReportDetails:", v7);

  return v10;
}

+ (id)buildRequiredOnlyWithCode:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setReportCode:", v3);

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMProtocolStatusReport_StatusReason allowedReportKeys](RMProtocolStatusReport_StatusReason, "allowedReportKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  if (objc_msgSend(v11, "count"))
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_7;
  }
  if (!-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Code"), CFSTR("reportCode"), 1, 0, a5))
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v16 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Description"), CFSTR("reportDescription"), 0, 0, a5))
  {
    LOWORD(v18) = a4;
    v16 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Details"), CFSTR("reportDetails"), objc_opt_class(), 0, 0, v18, a5);
  }
LABEL_8:

  return v16;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  signed __int16 v12;

  v5 = (void *)objc_opt_new();
  -[RMProtocolStatusReport_StatusReason reportCode](self, "reportCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Code"), v6, 1, 0);

  -[RMProtocolStatusReport_StatusReason reportDescription](self, "reportDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Description"), v7, 0, 0);

  -[RMProtocolStatusReport_StatusReason reportDetails](self, "reportDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__RMProtocolStatusReport_StatusReason_serializeWithType___block_invoke;
  v11[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v12 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Details"), v8, v11, 0, 0);

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RMProtocolStatusReport_StatusReason;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_reportCode, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_reportDescription, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[RMModelAnyPayload copy](self->_reportDetails, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)reportCode
{
  return self->_reportCode;
}

- (void)setReportCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)reportDescription
{
  return self->_reportDescription;
}

- (void)setReportDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RMModelAnyPayload)reportDetails
{
  return self->_reportDetails;
}

- (void)setReportDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportDetails, 0);
  objc_storeStrong((id *)&self->_reportDescription, 0);
  objc_storeStrong((id *)&self->_reportCode, 0);
}

@end
