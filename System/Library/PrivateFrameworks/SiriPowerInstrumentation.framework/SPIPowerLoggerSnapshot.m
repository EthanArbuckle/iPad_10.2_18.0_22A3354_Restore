@implementation SPIPowerLoggerSnapshot

- (SPIPowerLoggerSnapshot)init
{

  return 0;
}

- (SPIPowerLoggerSnapshot)initWithPowerLogger:(id)a3 usage:(SPIResourceUsage *)a4 captureTimestamp:(unint64_t)a5
{
  id v9;
  char *v10;
  SPIPowerLoggerSnapshot *v11;
  __int128 v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SPIPowerLoggerSnapshot;
  v10 = -[SPIPowerLoggerSnapshot init](&v14, sel_init);
  v11 = (SPIPowerLoggerSnapshot *)v10;
  if (v10)
  {
    v12 = *(_OWORD *)&a4->cpuCycles;
    *((_QWORD *)v10 + 3) = a4->memPhysFootprint;
    *(_OWORD *)(v10 + 8) = v12;
    objc_storeStrong((id *)v10 + 4, a3);
    v11->_captureTimestamp = a5;
  }

  return v11;
}

- (void)logWithEventContext:(id)a3
{
  id v4;
  SPISELFMessageBuilder *v5;

  v4 = a3;
  v5 = objc_alloc_init(SPISELFMessageBuilder);
  -[SPIPowerLoggerSnapshot buildAndEmitWithMessageBuilder:eventContext:](self, "buildAndEmitWithMessageBuilder:eventContext:", v5, v4);

}

- (void)logWithEventContext:(id)a3 componentName:(int)a4 identifier:(id)a5
{
  uint64_t v6;
  id v8;
  SPISELFMessageBuilder *v9;
  SPISELFMessageBuilder *v10;
  id v11;

  v6 = *(_QWORD *)&a4;
  v11 = a3;
  v8 = a5;
  v9 = objc_alloc_init(SPISELFMessageBuilder);
  v10 = v9;
  if (v8)
    -[SPISELFMessageBuilder addRequestLinkInfoForComponent:identifier:](v9, "addRequestLinkInfoForComponent:identifier:", v6, v8);
  -[SPIPowerLoggerSnapshot buildAndEmitWithMessageBuilder:eventContext:](self, "buildAndEmitWithMessageBuilder:eventContext:", v10, v11);

}

- (void)buildAndEmitWithMessageBuilder:(id)a3 eventContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BYTE v11[24];

  v6 = a4;
  v7 = a3;
  -[SPIPowerLoggerSnapshot powerLogger](self, "powerLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addProcess:", objc_msgSend(v8, "process"));

  -[SPIPowerLoggerSnapshot usage](self, "usage");
  objc_msgSend(v7, "addProcessUsage:", v11);
  objc_msgSend(v7, "addContext:", v6);

  objc_msgSend(v7, "buildMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D978A0], "sharedStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitMessage:timestamp:", v9, -[SPIPowerLoggerSnapshot captureTimestamp](self, "captureTimestamp"));

}

- (void)logWithEventContext:(id)a3 turnIdentifier:(id)a4
{
  -[SPIPowerLoggerSnapshot logWithEventContext:componentName:identifier:](self, "logWithEventContext:componentName:identifier:", a3, 2, a4);
}

- (void)logWithEventContext:(id)a3 asrIdentifier:(id)a4
{
  -[SPIPowerLoggerSnapshot logWithEventContext:componentName:identifier:](self, "logWithEventContext:componentName:identifier:", a3, 8, a4);
}

- (void)logWithEventContext:(id)a3 ttsIdentifier:(id)a4
{
  -[SPIPowerLoggerSnapshot logWithEventContext:componentName:identifier:](self, "logWithEventContext:componentName:identifier:", a3, 13, a4);
}

- (void)logWithEventContext:(id)a3 requestIdentifier:(id)a4
{
  -[SPIPowerLoggerSnapshot logWithEventContext:componentName:identifier:](self, "logWithEventContext:componentName:identifier:", a3, 1, a4);
}

- (SPIResourceUsage)usage
{
  *retstr = *(SPIResourceUsage *)&self->cpuInstructions;
  return self;
}

- (SPIPowerLogger)powerLogger
{
  return self->_powerLogger;
}

- (unint64_t)captureTimestamp
{
  return self->_captureTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLogger, 0);
}

@end
