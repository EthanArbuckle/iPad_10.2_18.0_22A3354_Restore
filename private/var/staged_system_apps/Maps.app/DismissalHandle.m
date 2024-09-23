@implementation DismissalHandle

- (void)dealloc
{
  id dismissalBlock;
  objc_super v4;

  dismissalBlock = self->_dismissalBlock;
  self->_dismissalBlock = 0;

  v4.receiver = self;
  v4.super_class = (Class)DismissalHandle;
  -[DismissalHandle dealloc](&v4, "dealloc");
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalBlock, 0);
}

@end
