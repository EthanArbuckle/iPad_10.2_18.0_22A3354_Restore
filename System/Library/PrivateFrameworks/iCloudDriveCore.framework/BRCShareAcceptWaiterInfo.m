@implementation BRCShareAcceptWaiterInfo

- (BRCShareAcceptWaiterInfo)init
{
  BRCShareAcceptWaiterInfo *v2;
  uint64_t v3;
  NSMutableArray *waiterBlocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRCShareAcceptWaiterInfo;
  v2 = -[BRCShareAcceptWaiterInfo init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    waiterBlocks = v2->_waiterBlocks;
    v2->_waiterBlocks = (NSMutableArray *)v3;

  }
  return v2;
}

- (NSMutableArray)waiterBlocks
{
  return self->_waiterBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waiterBlocks, 0);
}

@end
