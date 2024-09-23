@implementation _UIActivityResourceLoader

- (_UIActivityResourceLoader)initWithQueue:(id)a3 loadBlock:(id)a4
{
  id v7;
  id v8;
  _UIActivityResourceLoader *v9;
  _UIActivityResourceLoader *v10;
  uint64_t v11;
  id loadBlock;
  dispatch_group_t v13;
  OS_dispatch_group *group;
  id resource;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIActivityResourceLoader;
  v9 = -[_UIActivityResourceLoader init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = MEMORY[0x1A1AE9514](v8);
    loadBlock = v10->_loadBlock;
    v10->_loadBlock = (id)v11;

    v13 = dispatch_group_create();
    group = v10->_group;
    v10->_group = (OS_dispatch_group *)v13;

    resource = v10->_resource;
    v10->_resource = 0;

  }
  return v10;
}

- (void)_loadResourceWithBlock:(id)a3
{
  void *v4;
  id resource;

  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  resource = self->_resource;
  self->_resource = v4;

}

- (void)loadResourceIfNeeded
{
  id loadBlock;
  void *v4;
  id v5;
  NSObject *group;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  loadBlock = self->_loadBlock;
  if (loadBlock)
  {
    v4 = (void *)MEMORY[0x1A1AE9514](loadBlock, a2);
    v5 = self->_loadBlock;
    self->_loadBlock = 0;

    location = 0;
    objc_initWeak(&location, self);
    group = self->_group;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49___UIActivityResourceLoader_loadResourceIfNeeded__block_invoke;
    block[3] = &unk_1E4002A00;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    v8 = v4;
    dispatch_group_async(group, queue, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_getResourceWithBlock:(id)a3
{
  (*((void (**)(id, id))a3 + 2))(a3, self->_resource);
}

- (void)getResourceWithBlock:(id)a3
{
  void (**v4)(id, id);
  NSObject *group;
  _QWORD block[4];
  void (**v7)(id, id);
  id v8;
  id location;

  v4 = (void (**)(id, id))a3;
  if (self->_loadBlock)
  {
    -[_UIActivityResourceLoader loadResourceIfNeeded](self, "loadResourceIfNeeded");
  }
  else if (!dispatch_group_wait((dispatch_group_t)self->_group, 0))
  {
    v4[2](v4, self->_resource);
    goto LABEL_5;
  }
  location = 0;
  objc_initWeak(&location, self);
  group = self->_group;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___UIActivityResourceLoader_getResourceWithBlock___block_invoke;
  block[3] = &unk_1E4002A00;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
LABEL_5:

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resource, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong(&self->_loadBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
