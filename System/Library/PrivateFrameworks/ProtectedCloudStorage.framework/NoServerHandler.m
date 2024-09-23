@implementation NoServerHandler

- (NoServerHandler)initWithHandler:(id)a3
{
  id v4;
  NoServerHandler *v5;
  uint64_t v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NoServerHandler;
  v5 = -[NoServerHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1AF4156AC](v4);
    handler = v5->_handler;
    v5->_handler = (id)v6;

  }
  return v5;
}

- (void)call
{
  id handler;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x1AF4156AC](self->_handler, a2);
  handler = self->_handler;
  self->_handler = 0;

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (id)handler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
