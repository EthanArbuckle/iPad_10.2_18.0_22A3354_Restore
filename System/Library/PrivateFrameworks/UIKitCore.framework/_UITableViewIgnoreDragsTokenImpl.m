@implementation _UITableViewIgnoreDragsTokenImpl

- (void)dealloc
{
  objc_super v3;

  -[_UITableViewIgnoreDragsTokenImpl endIgnoringDrags](self, "endIgnoringDrags");
  v3.receiver = self;
  v3.super_class = (Class)_UITableViewIgnoreDragsTokenImpl;
  -[_UITableViewIgnoreDragsTokenImpl dealloc](&v3, sel_dealloc);
}

- (void)endIgnoringDrags
{
  id didEndHandler;
  void (**v4)(void);

  v4 = (void (**)(void))_Block_copy(self->_didEndHandler);
  if (v4)
  {
    didEndHandler = self->_didEndHandler;
    self->_didEndHandler = 0;

    v4[2]();
  }

}

- (_UITableViewIgnoreDragsTokenImpl)initWithDidEndHandler:(id)a3
{
  id v4;
  _UITableViewIgnoreDragsTokenImpl *v5;
  uint64_t v6;
  id didEndHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITableViewIgnoreDragsTokenImpl;
  v5 = -[_UITableViewIgnoreDragsTokenImpl init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    didEndHandler = v5->_didEndHandler;
    v5->_didEndHandler = (id)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didEndHandler, 0);
}

@end
