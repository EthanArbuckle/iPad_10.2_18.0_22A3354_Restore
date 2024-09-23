@implementation SCRDKGSPacket

- (unsigned)command
{
  return self->_command;
}

- (void)setCommand:(unsigned __int8)a3
{
  self->_command = a3;
}

- (unsigned)subCommand
{
  return self->_subCommand;
}

- (void)setSubCommand:(unsigned __int8)a3
{
  self->_subCommand = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
