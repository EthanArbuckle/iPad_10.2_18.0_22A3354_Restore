@implementation UpdateAndReportServices

- (UpdateAndReportServices)initWithServices:(BOOL)a3 needToReport:(BOOL)a4 service:(id)a5
{
  UpdateAndReportServices *v8;
  UpdateAndReportServices *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UpdateAndReportServices;
  v8 = -[UpdateAndReportServices init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_update = a3;
    v8->_report = a4;
    v8->_block = _Block_copy(a5);
  }
  return v9;
}

- (void)dealloc
{
  id block;
  objc_super v4;

  block = self->_block;
  if (block)

  v4.receiver = self;
  v4.super_class = (Class)UpdateAndReportServices;
  -[UpdateAndReportServices dealloc](&v4, sel_dealloc);
}

- (BOOL)update
{
  return self->_update;
}

- (BOOL)report
{
  return self->_report;
}

- (id)block
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

@end
