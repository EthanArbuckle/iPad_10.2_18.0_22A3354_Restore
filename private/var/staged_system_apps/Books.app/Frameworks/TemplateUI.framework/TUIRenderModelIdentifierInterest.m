@implementation TUIRenderModelIdentifierInterest

- (TUIRenderModelIdentifierInterest)initWithQueue:(id)a3 interests:(id)a4
{
  id v7;
  id v8;
  TUIRenderModelIdentifierInterest *v9;
  TUIRenderModelIdentifierInterest *v10;
  NSArray *v11;
  NSArray *interests;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIRenderModelIdentifierInterest;
  v9 = -[TUIRenderModelIdentifierInterest init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = (NSArray *)objc_msgSend(v8, "copy");
    interests = v10->_interests;
    v10->_interests = v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[TUIRenderModelIdentifierInterest invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUIRenderModelIdentifierInterest;
  -[TUIRenderModelIdentifierInterest dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  NSArray *interests;
  OS_dispatch_queue *queue;
  NSArray *v5;
  NSObject *v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD block[4];
  NSArray *v10;

  queue = self->_queue;
  interests = self->_interests;
  if (queue)
  {
    v5 = interests;
    v6 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15B6CC;
    block[3] = &unk_241D08;
    v10 = v5;
    v7 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    sub_15B6D4(interests);
  }
  v8 = self->_interests;
  self->_interests = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
