@implementation BCLazyValue

- (BCLazyValue)init
{
  BCLazyValue *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCLazyValue;
  result = -[BCLazyValue init](&v3, "init");
  if (result)
  {
    result->_onceToken = 0;
    result->_flags = 0;
  }
  __dmb(0xBu);
  return result;
}

+ (id)objectSyncProducer:(id)a3
{
  id v3;
  BCLazyValue *v4;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(BCLazyValue);
    -[BCLazyValue setSyncProducer:](v4, "setSyncProducer:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objectAsyncProducer:(id)a3
{
  id v3;
  BCLazyValue *v4;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(BCLazyValue);
    -[BCLazyValue setAsyncProducer:](v4, "setAsyncProducer:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)value
{
  int64_t *p_onceToken;
  int64_t onceToken;
  NSObject *sync;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  id (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD block[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_144D08;
  v22 = sub_144D18;
  v23 = 0;
  onceToken = self->_onceToken;
  p_onceToken = &self->_onceToken;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_144D20;
  block[3] = &unk_28B960;
  block[4] = self;
  if (onceToken != -1)
    dispatch_once(p_onceToken, block);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_144D58;
  v15 = sub_144D80;
  v16 = 0;
  sync = self->_sync;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_144D88;
  v10[3] = &unk_28F2B8;
  v10[4] = self;
  v10[5] = &v18;
  v10[6] = &v11;
  dispatch_sync(sync, v10);
  v6 = objc_retainBlock((id)v12[5]);
  v7 = v6;
  if (v6)
    (*((void (**)(id))v6 + 2))(v6);

  v8 = (id)v19[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (id)syncProducer
{
  return self->_syncProducer;
}

- (void)setSyncProducer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)asyncProducer
{
  return self->_asyncProducer;
}

- (void)setAsyncProducer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_asyncProducer, 0);
  objc_storeStrong(&self->_syncProducer, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_sync, 0);
}

@end
