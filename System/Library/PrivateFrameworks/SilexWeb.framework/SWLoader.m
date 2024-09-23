@implementation SWLoader

+ (id)loaderWithBlock:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = MEMORY[0x219A22DDC](v4);

  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)load
{
  void (**v2)(void);

  -[SWLoader loadBlock](self, "loadBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (id)loadBlock
{
  return self->_loadBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadBlock, 0);
}

@end
