@implementation BKLaunchOperationQueue

- (void)addOperationWithBlock:(id)a3
{
  id v4;
  NSObject *activeQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  activeQueue = self->_activeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100033DB8;
  v7[3] = &unk_1008E7680;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(activeQueue, v7);
  self->_hasNewBlocks = 1;
  os_unfair_lock_unlock(&self->_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeQueue, 0);
  objc_storeStrong((id *)&self->_underlyingQueue, 0);
  objc_storeStrong((id *)&self->_signpostLog, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setQosClass:(unsigned int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  unsigned int qosClass;
  OS_dispatch_queue *v7;
  const char *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *activeQueue;
  OS_dispatch_queue *v15;

  v3 = *(_QWORD *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  qosClass = self->_qosClass;
  if (qosClass != (_DWORD)v3)
  {
    self->_qosClass = v3;
    if ((_DWORD)v3)
    {
      v7 = (OS_dispatch_queue *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@@0x%x"), self->_name, v3)));
      v8 = (const char *)-[OS_dispatch_queue UTF8String](v7, "UTF8String");
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = dispatch_queue_attr_make_with_qos_class(v10, (dispatch_qos_class_t)v3, 0);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v8, v12, (dispatch_queue_t)self->_underlyingQueue);
      activeQueue = self->_activeQueue;
      self->_activeQueue = v13;

    }
    else
    {
      v15 = self->_underlyingQueue;
      v7 = self->_activeQueue;
      self->_activeQueue = v15;
    }

    if (qosClass < v3 && self->_hasNewBlocks)
      dispatch_async((dispatch_queue_t)self->_activeQueue, &stru_1008EE978);
  }
  os_unfair_lock_unlock(p_lock);
}

- (BKLaunchOperationQueue)initWithName:(id)a3 signpostLog:(id)a4 targetQueue:(id)a5 activate:(BOOL)a6
{
  id v11;
  NSObject *v12;
  NSObject *v13;
  BKLaunchOperationQueue *v14;
  BKLaunchOperationQueue *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_attr_t initially_inactive;
  uint64_t v21;
  const char *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *underlyingQueue;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v26.receiver = self;
  v26.super_class = (Class)BKLaunchOperationQueue;
  v14 = -[BKLaunchOperationQueue init](&v26, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_signpostLog, a4);
    v15->_signpostID = os_signpost_id_make_with_pointer(v12, v15);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_UNSPECIFIED, 0);
    v19 = objc_claimAutoreleasedReturnValue(v18);

    if (!a6)
    {
      initially_inactive = dispatch_queue_attr_make_initially_inactive(v19);
      v21 = objc_claimAutoreleasedReturnValue(initially_inactive);

      v19 = v21;
    }
    v22 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    if (v13)
      v23 = dispatch_queue_create_with_target_V2(v22, v19, v13);
    else
      v23 = dispatch_queue_create(v22, v19);
    underlyingQueue = v15->_underlyingQueue;
    v15->_underlyingQueue = (OS_dispatch_queue *)v23;

    objc_storeStrong((id *)&v15->_activeQueue, v15->_underlyingQueue);
    v15->_lock._os_unfair_lock_opaque = 0;

  }
  return v15;
}

- (void)waitUntilAllOperationsAreFinished
{
  os_unfair_lock_s *p_lock;
  OS_dispatch_queue *activeQueue;
  NSObject *v5;

  p_lock = &self->_lock;
  do
  {
    os_unfair_lock_lock(p_lock);
    activeQueue = self->_activeQueue;
    self->_hasNewBlocks = 0;
    v5 = activeQueue;
    os_unfair_lock_unlock(p_lock);
    dispatch_sync(v5, &stru_1008EE998);

    os_unfair_lock_lock(p_lock);
    LODWORD(v5) = self->_hasNewBlocks;
    os_unfair_lock_unlock(p_lock);
  }
  while ((_DWORD)v5);
}

- (void)dealloc
{
  objc_super v3;

  dispatch_activate((dispatch_object_t)self->_underlyingQueue);
  v3.receiver = self;
  v3.super_class = (Class)BKLaunchOperationQueue;
  -[BKLaunchOperationQueue dealloc](&v3, "dealloc");
}

- (void)activate
{
  dispatch_activate((dispatch_object_t)self->_underlyingQueue);
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

@end
