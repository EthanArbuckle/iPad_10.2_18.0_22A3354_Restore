@implementation RMProtocolStatusReport

+ (id)requestWithStatusItems:(id)a3 errors:(id)a4 fullReport:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setReportStatusItems:", v9);

  objc_msgSend(v10, "setReportErrors:", v8);
  if (v7)
    v11 = v7;
  else
    v11 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v10, "setReportFullReport:", v11);

  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  uint64_t v11;
  uint64_t v12;

  v8 = a3;
  LOWORD(v11) = a4;
  if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("StatusItems"), CFSTR("reportStatusItems"), objc_opt_class(), 1, 0, v11, a5))
  {
    LOWORD(v12) = a4;
    v9 = 0;
    if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Errors"), CFSTR("reportErrors"), objc_opt_class(), 0, 1, 0, v12, a5))
    {
      v9 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("FullReport"), CFSTR("reportFullReport"), 0, MEMORY[0x24BDBD1C0], a5);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  signed __int16 v13;
  _QWORD v14[4];
  signed __int16 v15;

  v5 = (void *)objc_opt_new();
  -[RMProtocolStatusReport reportStatusItems](self, "reportStatusItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __44__RMProtocolStatusReport_serializeWithType___block_invoke;
  v14[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v15 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("StatusItems"), v6, v14, 1, 0);

  -[RMProtocolStatusReport reportErrors](self, "reportErrors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __44__RMProtocolStatusReport_serializeWithType___block_invoke_2;
  v12[3] = &__block_descriptor_34_e53___NSDictionary_16__0__RMProtocolStatusReport_Errors_8l;
  v13 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Errors"), v8, v12, 1, 0);

  -[RMProtocolStatusReport reportFullReport](self, "reportFullReport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("FullReport"), v9, 0, MEMORY[0x24BDBD1C0]);

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

uint64_t __44__RMProtocolStatusReport_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __44__RMProtocolStatusReport_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
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
  v12.super_class = (Class)RMProtocolStatusReport;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[RMModelAnyPayload copy](self->_reportStatusItems, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_reportErrors, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_reportFullReport, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (RMModelAnyPayload)reportStatusItems
{
  return self->_reportStatusItems;
}

- (void)setReportStatusItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)reportErrors
{
  return self->_reportErrors;
}

- (void)setReportErrors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)reportFullReport
{
  return self->_reportFullReport;
}

- (void)setReportFullReport:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportFullReport, 0);
  objc_storeStrong((id *)&self->_reportErrors, 0);
  objc_storeStrong((id *)&self->_reportStatusItems, 0);
}

uint64_t __51__RMProtocolStatusReport_Errors_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __57__RMProtocolStatusReport_StatusReason_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

@end
