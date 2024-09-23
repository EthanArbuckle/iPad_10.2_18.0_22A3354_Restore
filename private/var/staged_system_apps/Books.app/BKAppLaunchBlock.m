@implementation BKAppLaunchBlock

- (unint64_t)conditionMask
{
  return self->_conditionMask;
}

- (NSString)blockID
{
  return self->_blockID;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void)setConditionMask:(unint64_t)a3
{
  self->_conditionMask = a3;
}

- (void)setBlockID:(id)a3
{
  objc_storeStrong((id *)&self->_blockID, a3);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BKAppLaunchBlock)init
{
  BKAppLaunchBlock *v2;
  void *v3;
  uint64_t v4;
  NSString *blockID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAppLaunchBlock;
  v2 = -[BKAppLaunchBlock init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    blockID = v2->_blockID;
    v2->_blockID = (NSString *)v4;

  }
  return v2;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockID, 0);
  objc_storeStrong(&self->_block, 0);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  unint64_t conditionMask;
  id v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  conditionMask = self->_conditionMask;
  v7 = objc_retainBlock(self->_block);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p c=%lx b=%@ id=%@>"), v5, self, conditionMask, v7, self->_blockID));

  return v8;
}

- (unint64_t)flags
{
  return self->_flags;
}

@end
