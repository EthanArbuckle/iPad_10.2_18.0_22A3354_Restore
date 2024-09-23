@implementation ALUManager

- (ALUManager)initWithDelegate:(id)a3 queue:(id)a4
{

  return 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ALUManager;
  -[ALUManager dealloc](&v2, sel_dealloc);
}

- (BOOL)_handleALUMessageTypeLinkAdviceWithPayload:(id)a3
{
  return 0;
}

- (BOOL)_handleALUMessageTypeTransferStatsWithPayload:(id)a3
{
  return 0;
}

- (ALUManagerDelegate)delegate
{
  return (ALUManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
