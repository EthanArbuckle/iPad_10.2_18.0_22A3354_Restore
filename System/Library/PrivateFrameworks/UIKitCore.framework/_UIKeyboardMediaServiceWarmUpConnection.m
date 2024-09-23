@implementation _UIKeyboardMediaServiceWarmUpConnection

+ (void)warmUp
{
  id v2;

  +[_UIKeyboardMediaServiceWarmUpConnection sharedConnection](_UIKeyboardMediaServiceWarmUpConnection, "sharedConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "warmUp");

}

+ (id)sharedConnection
{
  if (qword_1ECD81980 != -1)
    dispatch_once(&qword_1ECD81980, &__block_literal_global_530);
  return (id)_MergedGlobals_1244;
}

- (void)warmUp
{
  NSObject *queue;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;
  _QWORD block[5];

  queue = self->_queue;
  if (!queue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.UIKeyboardMediaServiceWarmUpQueue", v4);
    v6 = self->_queue;
    self->_queue = v5;

    queue = self->_queue;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
