@implementation SMUNPSManager

- (SMUNPSManager)init
{
  SMUNPSManager *v2;
  NPSManager *v3;
  NPSManager *syncManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SMUNPSManager;
  v2 = -[SMUNPSManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NPSManager *)objc_alloc_init(MEMORY[0x24BE6B2C8]);
    syncManager = v2->_syncManager;
    v2->_syncManager = v3;

  }
  return v2;
}

- (void)synchronizeNanoDomain:(id)a3 keys:(id)a4
{
  -[NPSManager synchronizeNanoDomain:keys:](self->_syncManager, "synchronizeNanoDomain:keys:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncManager, 0);
}

@end
