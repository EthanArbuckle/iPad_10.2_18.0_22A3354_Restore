@implementation STStorageSizeBlockOperation

+ (id)operationWithSizeBlock:(id)a3
{
  id v3;
  STStorageSizeBlockOperation *v4;

  v3 = a3;
  v4 = objc_alloc_init(STStorageSizeBlockOperation);
  -[STStorageSizeBlockOperation setSizeBlock:](v4, "setSizeBlock:", v3);

  return v4;
}

- (void)main
{
  void *v3;
  uint64_t (**sizeBlock)(void);
  uint64_t v5;
  id v6;
  id v7;

  -[STStorageSizeBlockOperation app](self, "app");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sizeBlock = (uint64_t (**)(void))self->_sizeBlock;
  v7 = 0;
  v5 = sizeBlock[2]();
  v6 = v7;
  -[STStorageOperation setError:](self, "setError:", v6);
  -[STStorageSizeOperation setSize:](self, "setSize:", v5);

}

- (STStorageApp)app
{
  return (STStorageApp *)objc_getProperty(self, a2, 264, 1);
}

- (void)setApp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (id)sizeBlock
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void)setSizeBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sizeBlock, 0);
  objc_storeStrong((id *)&self->_app, 0);
}

@end
