@implementation WBSSiteMetadataFetchOperation

- (WBSSiteMetadataFetchOperation)init
{

  return 0;
}

- (WBSSiteMetadataFetchOperation)initWithRequest:(id)a3
{
  id v5;
  WBSSiteMetadataFetchOperation *v6;
  WBSSiteMetadataFetchOperation *v7;
  WBSSiteMetadataFetchOperation *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSiteMetadataFetchOperation;
  v6 = -[WBSSiteMetadataFetchOperation init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___WBSSiteMetadataFetchOperation;
  objc_msgSendSuper2(&v8, sel_keyPathsForValuesAffectingValueForKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("isExecuting")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("isFinished")))
  {
    objc_msgSend(v5, "setByAddingObject:", CFSTR("status"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

- (BOOL)isExecuting
{
  return -[WBSSiteMetadataFetchOperation _status](self, "_status") == 1;
}

- (BOOL)isFinished
{
  return -[WBSSiteMetadataFetchOperation _status](self, "_status") == 2;
}

- (WBSSiteMetadataRequest)request
{
  return self->_request;
}

- (int64_t)_status
{
  return self->_status;
}

- (void)_setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
