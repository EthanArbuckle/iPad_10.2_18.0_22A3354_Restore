@implementation RMProtocolStatusReport_Errors

+ (NSSet)allowedReportKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("StatusItem");
  v6[1] = CFSTR("Reasons");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithStatusItem:(id)a3 reasons:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setReportStatusItem:", v6);

  objc_msgSend(v7, "setReportReasons:", v5);
  return v7;
}

+ (id)buildRequiredOnlyWithStatusItem:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setReportStatusItem:", v3);

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
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMProtocolStatusReport_Errors allowedReportKeys](RMProtocolStatusReport_Errors, "allowedReportKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  if (objc_msgSend(v11, "count"))
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v18 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    if (!-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("StatusItem"), CFSTR("reportStatusItem"), 1, 0, a5))goto LABEL_6;
    LOWORD(v17) = a4;
    LOBYTE(a5) = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Reasons"), CFSTR("reportReasons"), objc_opt_class(), 0, 0, 0, v17, a5);
  }

  return (char)a5;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  signed __int16 v11;

  v5 = (void *)objc_opt_new();
  -[RMProtocolStatusReport_Errors reportStatusItem](self, "reportStatusItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("StatusItem"), v6, 1, 0);

  -[RMProtocolStatusReport_Errors reportReasons](self, "reportReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__RMProtocolStatusReport_Errors_serializeWithType___block_invoke;
  v10[3] = &__block_descriptor_34_e59___NSDictionary_16__0__RMProtocolStatusReport_StatusReason_8l;
  v11 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Reasons"), v7, v10, 0, 0);

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RMProtocolStatusReport_Errors;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_reportStatusItem, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_reportReasons, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)reportStatusItem
{
  return self->_reportStatusItem;
}

- (void)setReportStatusItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)reportReasons
{
  return self->_reportReasons;
}

- (void)setReportReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportReasons, 0);
  objc_storeStrong((id *)&self->_reportStatusItem, 0);
}

@end
