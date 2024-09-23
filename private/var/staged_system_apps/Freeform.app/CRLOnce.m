@implementation CRLOnce

- (CRLOnce)init
{
  CRLOnce *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLOnce;
  v2 = -[CRLOnce init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.freeform.CRLOnce", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLOnce *v4;
  NSObject *queue;
  CRLOnce *v6;
  CRLOnce *v7;
  _QWORD v9[4];
  CRLOnce *v10;
  CRLOnce *v11;

  v4 = objc_alloc_init(CRLOnce);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001B92E0;
  v9[3] = &unk_10122D3D8;
  v6 = v4;
  v10 = v6;
  v11 = self;
  dispatch_sync(queue, v9);
  v7 = v6;

  return v7;
}

- (void)performBlockOnce:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B936C;
  block[3] = &unk_101231F00;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
