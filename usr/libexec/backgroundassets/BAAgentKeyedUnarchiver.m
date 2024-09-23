@implementation BAAgentKeyedUnarchiver

- (BAAgentCore)agentCore
{
  return (BAAgentCore *)objc_loadWeakRetained((id *)&self->_agentCore);
}

- (void)setAgentCore:(id)a3
{
  objc_storeWeak((id *)&self->_agentCore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_agentCore);
}

@end
