@implementation BKLibraryUpdateHoldAssertion

- (BKLibraryUpdateHoldAssertion)initWithRelease:(id)a3
{
  id v4;
  BKLibraryUpdateHoldAssertion *v5;
  id v6;
  id releaseBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryUpdateHoldAssertion;
  v5 = -[BKLibraryUpdateHoldAssertion init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    releaseBlock = v5->_releaseBlock;
    v5->_releaseBlock = v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BKLibraryUpdateHoldAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryUpdateHoldAssertion;
  -[BKLibraryUpdateHoldAssertion dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  id releaseBlock;
  void (**v4)(void);

  v4 = (void (**)(void))objc_retainBlock(self->_releaseBlock);
  if (v4)
    v4[2]();
  releaseBlock = self->_releaseBlock;
  self->_releaseBlock = 0;

}

- (id)releaseBlock
{
  return self->_releaseBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_releaseBlock, 0);
}

@end
