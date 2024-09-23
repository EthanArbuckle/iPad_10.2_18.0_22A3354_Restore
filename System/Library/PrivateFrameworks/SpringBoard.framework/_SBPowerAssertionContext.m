@implementation _SBPowerAssertionContext

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)collectionBlock
{
  return self->_collectionBlock;
}

- (void)setCollectionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_collectionBlock, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end
