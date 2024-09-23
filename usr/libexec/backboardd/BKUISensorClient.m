@implementation BKUISensorClient

- (void)dealloc
{
  objc_super v3;

  -[BSProcessDeathWatcher invalidate](self->_deathWatcher, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKUISensorClient;
  -[BKUISensorClient dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deathWatcher, 0);
  objc_storeStrong((id *)&self->_modeToRestoreAfterEstimatedProx, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
