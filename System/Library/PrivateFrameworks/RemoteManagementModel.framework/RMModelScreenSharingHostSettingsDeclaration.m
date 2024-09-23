@implementation RMModelScreenSharingHostSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.screensharing.host.settings");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("MaximumVirtualDisplays");
  v6[1] = CFSTR("PortBase");
  v6[2] = CFSTR("PreventCopyFilesFromHost");
  v6[3] = CFSTR("PreventCopyFilesToHost");
  v6[4] = CFSTR("PreventHighPerformanceConnections");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_opt_new();
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 maximumVirtualDisplays:(id)a4 portBase:(id)a5 preventCopyFilesFromHost:(id)a6 preventCopyFilesToHost:(id)a7 preventHighPerformanceConnections:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;

  v13 = a3;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setDeclarationType:", CFSTR("com.apple.configuration.screensharing.host.settings"));
  if (v13)
  {
    objc_msgSend(v19, "setDeclarationIdentifier:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDeclarationIdentifier:", v21);

  }
  objc_msgSend(v19, "setPayloadMaximumVirtualDisplays:", v18);

  objc_msgSend(v19, "setPayloadPortBase:", v17);
  v22 = (void *)MEMORY[0x24BDBD1C0];
  if (v16)
    v23 = v16;
  else
    v23 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v19, "setPayloadPreventCopyFilesFromHost:", v23);

  if (v15)
    v24 = v15;
  else
    v24 = v22;
  objc_msgSend(v19, "setPayloadPreventCopyFilesToHost:", v24);

  if (v14)
    v25 = v14;
  else
    v25 = v22;
  objc_msgSend(v19, "setPayloadPreventHighPerformanceConnections:", v25);

  objc_msgSend(v19, "updateServerToken");
  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.screensharing.host.settings"));
  if (v3)
  {
    objc_msgSend(v4, "setDeclarationIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeclarationIdentifier:", v6);

  }
  objc_msgSend(v4, "updateServerToken");

  return v4;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = &unk_251629F88;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626298);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516262B0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelScreenSharingHostSettingsDeclaration allowedPayloadKeys](RMModelScreenSharingHostSettingsDeclaration, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("MaximumVirtualDisplays"), CFSTR("payloadMaximumVirtualDisplays"), 0, 0, a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("PortBase"), CFSTR("payloadPortBase"), 0, 0, a5))
    {
      v13 = 0;
      if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("PreventCopyFilesFromHost"), CFSTR("payloadPreventCopyFilesFromHost"), 0, MEMORY[0x24BDBD1C0], a5))
      {
        v13 = 0;
        if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("PreventCopyFilesToHost"), CFSTR("payloadPreventCopyFilesToHost"), 0, MEMORY[0x24BDBD1C0], a5))
        {
          v13 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("PreventHighPerformanceConnections"), CFSTR("payloadPreventHighPerformanceConnections"), 0, MEMORY[0x24BDBD1C0], a5);
        }
      }
    }
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_opt_new();
  -[RMModelScreenSharingHostSettingsDeclaration payloadMaximumVirtualDisplays](self, "payloadMaximumVirtualDisplays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("MaximumVirtualDisplays"), v5, 0, 0);

  -[RMModelScreenSharingHostSettingsDeclaration payloadPortBase](self, "payloadPortBase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("PortBase"), v6, 0, 0);

  -[RMModelScreenSharingHostSettingsDeclaration payloadPreventCopyFilesFromHost](self, "payloadPreventCopyFilesFromHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDBD1C0];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("PreventCopyFilesFromHost"), v7, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelScreenSharingHostSettingsDeclaration payloadPreventCopyFilesToHost](self, "payloadPreventCopyFilesToHost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("PreventCopyFilesToHost"), v9, 0, v8);

  -[RMModelScreenSharingHostSettingsDeclaration payloadPreventHighPerformanceConnections](self, "payloadPreventHighPerformanceConnections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("PreventHighPerformanceConnections"), v10, 0, v8);

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RMModelScreenSharingHostSettingsDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadMaximumVirtualDisplays, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSNumber copy](self->_payloadPortBase, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSNumber copy](self->_payloadPreventCopyFilesFromHost, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[NSNumber copy](self->_payloadPreventCopyFilesToHost, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  v13 = -[NSNumber copy](self->_payloadPreventHighPerformanceConnections, "copy");
  v14 = (void *)v4[10];
  v4[10] = v13;

  return v4;
}

- (NSNumber)payloadMaximumVirtualDisplays
{
  return self->_payloadMaximumVirtualDisplays;
}

- (void)setPayloadMaximumVirtualDisplays:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)payloadPortBase
{
  return self->_payloadPortBase;
}

- (void)setPayloadPortBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadPreventCopyFilesFromHost
{
  return self->_payloadPreventCopyFilesFromHost;
}

- (void)setPayloadPreventCopyFilesFromHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadPreventCopyFilesToHost
{
  return self->_payloadPreventCopyFilesToHost;
}

- (void)setPayloadPreventCopyFilesToHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadPreventHighPerformanceConnections
{
  return self->_payloadPreventHighPerformanceConnections;
}

- (void)setPayloadPreventHighPerformanceConnections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPreventHighPerformanceConnections, 0);
  objc_storeStrong((id *)&self->_payloadPreventCopyFilesToHost, 0);
  objc_storeStrong((id *)&self->_payloadPreventCopyFilesFromHost, 0);
  objc_storeStrong((id *)&self->_payloadPortBase, 0);
  objc_storeStrong((id *)&self->_payloadMaximumVirtualDisplays, 0);
}

@end
