@implementation CTClientDelegate

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  id v6;
  void (**fOnCellMonitorUpdateCb)(id, id, id);
  id v8;

  v8 = a3;
  v6 = a4;
  fOnCellMonitorUpdateCb = (void (**)(id, id, id))self->_fOnCellMonitorUpdateCb;
  if (fOnCellMonitorUpdateCb)
    fOnCellMonitorUpdateCb[2](fOnCellMonitorUpdateCb, v8, v6);

}

- (void)dealloc
{
  id fOnCellMonitorUpdateCb;
  objc_super v4;

  fOnCellMonitorUpdateCb = self->_fOnCellMonitorUpdateCb;
  self->_fOnCellMonitorUpdateCb = 0;

  v4.receiver = self;
  v4.super_class = (Class)CTClientDelegate;
  -[CTClientDelegate dealloc](&v4, "dealloc");
}

- (id)fOnCellMonitorUpdateCb
{
  return self->_fOnCellMonitorUpdateCb;
}

- (void)setFOnCellMonitorUpdateCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fOnCellMonitorUpdateCb, 0);
}

@end
