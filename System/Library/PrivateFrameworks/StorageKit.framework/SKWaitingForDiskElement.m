@implementation SKWaitingForDiskElement

- (NSDictionary)diskDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDiskDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)block
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_diskDictionary, 0);
}

@end
