@implementation TXRDeferredImageInfo

- (TXRDeferredImageInfo)init
{
  TXRDeferredImageInfo *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *infoLoaded;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TXRDeferredImageInfo;
  v2 = -[TXRDeferredImageInfo init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    infoLoaded = v2->_infoLoaded;
    v2->_infoLoaded = (OS_dispatch_semaphore *)v3;

  }
  return v2;
}

- (void)signalLoaded
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_infoLoaded);
}

- (TXRImageInfo)info
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_infoLoaded, 0xFFFFFFFFFFFFFFFFLL);
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_infoLoaded, 0);
}

@end
