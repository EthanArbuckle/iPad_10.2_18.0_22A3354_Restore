@implementation VUIAppReloadContext

- (id)reloadData
{
  return self->_reloadData;
}

- (void)setReloadData:(id)a3
{
  objc_storeStrong(&self->_reloadData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reloadData, 0);
}

@end
