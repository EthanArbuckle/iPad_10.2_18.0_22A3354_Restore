@implementation SecureElementManager

+ (id)getInstance
{
  if (qword_10034BBD8 != -1)
    dispatch_once(&qword_10034BBD8, &stru_100304CD0);
  return (id)qword_10034BBD0;
}

- (SecureElementManager)init
{
  SecureElementManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SecureElementManager;
  v2 = -[SecureElementManager init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_create("com.apple.seserviced.secureelement", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    +[SecureElement setQueueKey:](SecureElement, "setQueueKey:", v2->_queue);
  }
  return v2;
}

- (id)getNFManager
{
  NFManagerProtocol *nfManager;
  _QWORD *v4;
  NFManagerProtocol *v5;
  NFManagerProtocol *v6;

  nfManager = self->_nfManager;
  if (!nfManager)
  {
    v4 = sub_100051628((uint64_t)NearFieldManager, self->_queue);
    v5 = (NFManagerProtocol *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_nfManager;
    self->_nfManager = v5;

    nfManager = self->_nfManager;
  }
  return nfManager;
}

- (void)injectNFManager:(id)a3
{
  objc_storeStrong((id *)&self->_nfManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nfManager, 0);
}

@end
