@implementation SCRCThreadedWeakLinkedObject

- (SCRCThreadedWeakLinkedObject)init
{
  SCRCThreadedWeakLinkedObject *v2;
  NSLock *v3;
  NSLock *releaseLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCRCThreadedWeakLinkedObject;
  v2 = -[SCRCThreadedWeakLinkedObject init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    releaseLock = v2->_releaseLock;
    v2->_releaseLock = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseLock, 0);
}

@end
