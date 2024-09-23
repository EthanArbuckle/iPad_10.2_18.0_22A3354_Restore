@implementation WebBackgroundTaskController

+ (id)sharedController
{
  id result;

  if (byte_1ECE81CA9 == 1)
    return (id)qword_1ECE81CB8;
  result = objc_alloc_init((Class)a1);
  qword_1ECE81CB8 = (uint64_t)result;
  byte_1ECE81CA9 = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebBackgroundTaskController;
  -[WebBackgroundTaskController dealloc](&v3, sel_dealloc);
}

- (unint64_t)startBackgroundTaskWithExpirationHandler:(id)a3
{
  uint64_t (**backgroundTaskStartBlock)(id, id);

  backgroundTaskStartBlock = (uint64_t (**)(id, id))self->_backgroundTaskStartBlock;
  if (backgroundTaskStartBlock)
    return backgroundTaskStartBlock[2](backgroundTaskStartBlock, a3);
  else
    return self->_invalidBackgroundTaskIdentifier;
}

- (void)endBackgroundTaskWithIdentifier:(unint64_t)a3
{
  void (**backgroundTaskEndBlock)(id, unint64_t);

  backgroundTaskEndBlock = (void (**)(id, unint64_t))self->_backgroundTaskEndBlock;
  if (backgroundTaskEndBlock)
    backgroundTaskEndBlock[2](backgroundTaskEndBlock, a3);
}

- (unint64_t)invalidBackgroundTaskIdentifier
{
  return self->_invalidBackgroundTaskIdentifier;
}

- (void)setInvalidBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_invalidBackgroundTaskIdentifier = a3;
}

- (id)backgroundTaskStartBlock
{
  return self->_backgroundTaskStartBlock;
}

- (void)setBackgroundTaskStartBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)backgroundTaskEndBlock
{
  return self->_backgroundTaskEndBlock;
}

- (void)setBackgroundTaskEndBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
