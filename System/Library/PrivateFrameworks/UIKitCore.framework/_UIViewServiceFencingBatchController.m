@implementation _UIViewServiceFencingBatchController

- (_UIViewServiceFencingBatchController)init
{
  _UIViewServiceFencingBatchController *v2;
  uint64_t v3;
  NSMutableSet *suspendedProxies;
  uint64_t v5;
  NSMutableSet *pendingProxies;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIViewServiceFencingBatchController;
  v2 = -[_UIViewServiceFencingBatchController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    suspendedProxies = v2->_suspendedProxies;
    v2->_suspendedProxies = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    pendingProxies = v2->_pendingProxies;
    v2->_pendingProxies = (NSMutableSet *)v5;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingProxies, 0);
  objc_storeStrong((id *)&self->_suspendedProxies, 0);
}

@end
