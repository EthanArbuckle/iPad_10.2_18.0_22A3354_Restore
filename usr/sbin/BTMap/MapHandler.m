@implementation MapHandler

- (MapHandler)init
{
  MapHandler *v2;
  NSMutableSet *v3;
  NSMutableSet *pendingSendGuids;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapHandler;
  v2 = -[MapHandler init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingSendGuids = v2->_pendingSendGuids;
    v2->_pendingSendGuids = v3;

  }
  return v2;
}

- (MapHandlerDelegate)delegate
{
  return (MapHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)pendingSendGuids
{
  return self->_pendingSendGuids;
}

- (void)setPendingSendGuids:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSendGuids, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSendGuids, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
