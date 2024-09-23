@implementation NSIdRunStorage

- (void)_allocData:(unint64_t)a3
{
  self->super._runs = (_NSRunBlock *)NSAllocateCollectable(a3, 1uLL);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (void)_reallocData:(unint64_t)a3
{
  self->super._runs = (_NSRunBlock *)NSReallocateCollectable(self->super._runs, a3, 1uLL);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NSIdRunStorage;
  -[NSRunStorage dealloc](&v2, sel_dealloc);
}

@end
