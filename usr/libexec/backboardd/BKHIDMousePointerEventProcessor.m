@implementation BKHIDMousePointerEventProcessor

- (BKMousePointerController)mousePointerController
{
  os_unfair_lock_s *p_lock;
  BKMousePointerController *v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = self->_mousePointerController;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  int64_t result;

  result = (int64_t)self->_mousePointerController;
  if (result)
    return (int64_t)objc_msgSend((id)result, "processEvent:sender:dispatcher:", a3, a4, a5);
  return result;
}

- (BKHIDMousePointerEventProcessor)init
{
  BKHIDMousePointerEventProcessor *v2;
  BKHIDMousePointerEventProcessor *v3;
  BKMousePointerServiceServer *v4;
  BKMousePointerServiceServer *mousePointerServiceServer;
  void *v6;
  BKMousePointerController *v7;
  BKMousePointerController *mousePointerController;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKHIDMousePointerEventProcessor;
  v2 = -[BKHIDMousePointerEventProcessor init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(BKMousePointerServiceServer);
    mousePointerServiceServer = v3->_mousePointerServiceServer;
    v3->_mousePointerServiceServer = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKMousePointerController standardConfiguration](BKMousePointerController, "standardConfiguration"));
    objc_msgSend(v6, "setServiceServer:", v3->_mousePointerServiceServer);
    v7 = -[BKMousePointerController initWithConfiguration:]([BKMousePointerController alloc], "initWithConfiguration:", v6);
    mousePointerController = v3->_mousePointerController;
    v3->_mousePointerController = v7;

    -[BKMousePointerServiceServer activateWithMousePointerController:](v3->_mousePointerServiceServer, "activateWithMousePointerController:", v3->_mousePointerController);
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mousePointerServiceServer, 0);
  objc_storeStrong((id *)&self->_mousePointerController, 0);
}

@end
