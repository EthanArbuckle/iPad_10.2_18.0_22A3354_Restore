@implementation SPISELFMessageBuilder

- (SPISELFMessageBuilder)init
{
  SPISELFMessageBuilder *v3;
  POWSchemaProvisionalPOWUsage *v4;
  POWSchemaProvisionalPOWClientEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPISELFMessageBuilder;
  v3 = -[SPISELFMessageBuilder init](&v7, sel_init);
  if (v3 == self)
  {
    v4 = objc_alloc_init(POWSchemaProvisionalPOWUsage);
    -[SPISELFMessageBuilder setUsageMsg:](self, "setUsageMsg:", v4);

    v5 = objc_alloc_init(POWSchemaProvisionalPOWClientEvent);
    -[SPISELFMessageBuilder setPowClientEventMsg:](self, "setPowClientEventMsg:", v5);

  }
  return v3;
}

- (void)addProcess:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[SPISELFMessageBuilder usageMsg](self, "usageMsg");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProcess:", +[SPISELFProcessAdapter translateProcess:](SPISELFProcessAdapter, "translateProcess:", v3));

}

- (void)addProcessUsage:(SPIResourceUsage *)a3
{
  void *v5;
  POWSchemaProvisionalPOWProcessUsage *v6;

  v6 = objc_alloc_init(POWSchemaProvisionalPOWProcessUsage);
  -[POWSchemaProvisionalPOWProcessUsage setCpuCycles:](v6, "setCpuCycles:", a3->cpuCycles);
  -[POWSchemaProvisionalPOWProcessUsage setCpuInstructions:](v6, "setCpuInstructions:", a3->cpuInstructions);
  -[POWSchemaProvisionalPOWProcessUsage setMemoryFootprint:](v6, "setMemoryFootprint:", a3->memPhysFootprint);
  -[SPISELFMessageBuilder usageMsg](self, "usageMsg");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProcessUsage:", v6);

}

- (void)addContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPISELFMessageBuilder usageMsg](self, "usageMsg");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContextForUsage:", v5);

}

- (void)addRequestLinkInfoForComponent:(int)a3 identifier:(id)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a3;
  v6 = (objc_class *)MEMORY[0x1E0D9A498];
  v7 = a4;
  v10 = objc_alloc_init(v6);
  objc_msgSend(v10, "setComponent:", v4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v7);

  objc_msgSend(v10, "setUuid:", v8);
  -[SPISELFMessageBuilder powClientEventMsg](self, "powClientEventMsg");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLink:", v10);

}

- (id)buildMessage
{
  void *v3;
  void *v4;

  -[SPISELFMessageBuilder powClientEventMsg](self, "powClientEventMsg");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPISELFMessageBuilder usageMsg](self, "usageMsg");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUsage:", v4);

  return -[SPISELFMessageBuilder powClientEventMsg](self, "powClientEventMsg");
}

- (POWSchemaProvisionalPOWClientEvent)powClientEventMsg
{
  return self->_powClientEventMsg;
}

- (void)setPowClientEventMsg:(id)a3
{
  objc_storeStrong((id *)&self->_powClientEventMsg, a3);
}

- (POWSchemaProvisionalPOWUsage)usageMsg
{
  return self->_usageMsg;
}

- (void)setUsageMsg:(id)a3
{
  objc_storeStrong((id *)&self->_usageMsg, a3);
}

- (POWSchemaProvisionalPOWProcessUsage)procUsageMsg
{
  return self->_procUsageMsg;
}

- (void)setProcUsageMsg:(id)a3
{
  objc_storeStrong((id *)&self->_procUsageMsg, a3);
}

- (SISchemaInstrumentationMessage)eventContextMsg
{
  return self->_eventContextMsg;
}

- (void)setEventContextMsg:(id)a3
{
  objc_storeStrong((id *)&self->_eventContextMsg, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventContextMsg, 0);
  objc_storeStrong((id *)&self->_procUsageMsg, 0);
  objc_storeStrong((id *)&self->_usageMsg, 0);
  objc_storeStrong((id *)&self->_powClientEventMsg, 0);
}

@end
