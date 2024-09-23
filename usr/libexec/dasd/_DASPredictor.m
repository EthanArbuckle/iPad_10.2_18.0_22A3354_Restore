@implementation _DASPredictor

+ (id)predictorWithKnowledgeStore:(id)a3 withQueue:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend((id)objc_opt_class(a1), "predictorWithKnowledgeStore:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = v6;
  v11 = v10;
  if (!v10)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v11 = dispatch_queue_create("com.apple.daspredictor", v13);

  }
  objc_msgSend(v9, "setQueue:", v11);

  return v9;
}

- (void)launchLikelihoodPredictionForApp:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035944;
  block[3] = &unk_10015DAA0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async((dispatch_queue_t)queue, block);

}

- (void)pluginLikelihoodWithHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035A14;
  v7[3] = &unk_10015DAC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);

}

- (void)deviceActivityLikelihood:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035ADC;
  v7[3] = &unk_10015DAC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
