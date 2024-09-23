@implementation HAPCharacteristicEnableEventCompletionTuple

+ (id)enableEventCompletionTupleWithHandler:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  HAPCharacteristicEnableEventCompletionTuple *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HAPCharacteristicEnableEventCompletionTuple);
  -[HAPCharacteristicEnableEventCompletionTuple setHandler:](v7, "setHandler:", v6);

  -[HAPCharacteristicEnableEventCompletionTuple setCompletionQueue:](v7, "setCompletionQueue:", v5);
  return v7;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
