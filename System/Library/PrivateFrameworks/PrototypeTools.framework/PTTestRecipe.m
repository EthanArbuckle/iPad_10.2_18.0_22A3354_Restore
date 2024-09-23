@implementation PTTestRecipe

- (id)_initWithTitle:(id)a3 prepareBlock:(id)a4 cleanupBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  PTTestRecipe *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  id prepareBlock;
  uint64_t v16;
  id cleanupBlock;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PTTestRecipe;
  v11 = -[PTTestRecipe init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    prepareBlock = v11->_prepareBlock;
    v11->_prepareBlock = (id)v14;

    v16 = objc_msgSend(v10, "copy");
    cleanupBlock = v11->_cleanupBlock;
    v11->_cleanupBlock = (id)v16;

  }
  return v11;
}

- (void)_activate
{
  void (**prepareBlock)(void);

  prepareBlock = (void (**)(void))self->_prepareBlock;
  if (prepareBlock)
    prepareBlock[2]();
}

- (void)_deactivate
{
  void (**cleanupBlock)(void);

  cleanupBlock = (void (**)(void))self->_cleanupBlock;
  if (cleanupBlock)
    cleanupBlock[2]();
}

- (void)invalidate
{
  id prepareBlock;
  id cleanupBlock;
  void (**invalidationHandler)(void);

  prepareBlock = self->_prepareBlock;
  self->_prepareBlock = 0;

  cleanupBlock = self->_cleanupBlock;
  self->_cleanupBlock = 0;

  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
  }
  self->_invalidationHandler = 0;

}

- (NSString)title
{
  return self->_title;
}

- (id)prepareBlock
{
  return self->_prepareBlock;
}

- (void)setPrepareBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)cleanupBlock
{
  return self->_cleanupBlock;
}

- (void)setCleanupBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PTTestRecipeInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong(&self->_cleanupBlock, 0);
  objc_storeStrong(&self->_prepareBlock, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (BOOL)_wantsEvent:(int64_t)a3
{
  OUTLINED_FUNCTION_1();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)_handleEvent:(int64_t)a3
{
  OUTLINED_FUNCTION_1();
  NSRequestConcreteImplementation();
}

@end
