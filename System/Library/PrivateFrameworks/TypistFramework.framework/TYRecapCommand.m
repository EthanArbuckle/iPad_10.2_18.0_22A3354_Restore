@implementation TYRecapCommand

- (TYRecapCommand)initWithCommandType:(int)a3 commandString:(id)a4 commandDescription:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  TYRecapCommand *v10;
  TYRecapCommand *v11;
  objc_super v13;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TYRecapCommand;
  v10 = -[TYRecapCommand init](&v13, sel_init);
  v11 = v10;
  if (v10)
    -[TYRecapCommand updateCommand:commandString:commandDescription:](v10, "updateCommand:commandString:commandDescription:", v6, v8, v9);

  return v11;
}

- (void)updateCommand:(int)a3 commandString:(id)a4 commandDescription:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  -[TYRecapCommand setRecapWaitOverrideInterval:](self, "setRecapWaitOverrideInterval:", 0.0);
  -[TYRecapCommand setCommandType:](self, "setCommandType:", v6);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TYRecapCommand setCommandString:](self, "setCommandString:", v11);
  -[TYRecapCommand setCommandDescription:](self, "setCommandDescription:", v8);

  -[TYRecapCommand commandString](self, "commandString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(" "));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v6 == 1)
  {
    objc_msgSend(MEMORY[0x24BE7CE50], "eventStreamWithCLIArguments:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TYRecapCommand setEventStream:](self, "setEventStream:", v15);

  }
  else
  {
    -[TYRecapCommand setEventStream:](self, "setEventStream:", 0);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[TYRecapCommand commandDescription](self, "commandDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TYRecapCommand commandString](self, "commandString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n(%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)commandType
{
  return self->_commandType;
}

- (void)setCommandType:(int)a3
{
  self->_commandType = a3;
}

- (NSString)commandString
{
  return self->_commandString;
}

- (void)setCommandString:(id)a3
{
  objc_storeStrong((id *)&self->_commandString, a3);
}

- (NSString)commandDescription
{
  return self->_commandDescription;
}

- (void)setCommandDescription:(id)a3
{
  objc_storeStrong((id *)&self->_commandDescription, a3);
}

- (RCPSyntheticEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_eventStream, a3);
}

- (double)recapWaitOverrideInterval
{
  return self->_recapWaitOverrideInterval;
}

- (void)setRecapWaitOverrideInterval:(double)a3
{
  self->_recapWaitOverrideInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_commandDescription, 0);
  objc_storeStrong((id *)&self->_commandString, 0);
}

@end
