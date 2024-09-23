@implementation BABlock

- (BABlock)initWithToken:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  BABlock *v9;
  BABlock *v10;
  id v11;
  id block;
  OS_dispatch_source *fireByTimer;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BABlock;
  v9 = -[BABlock init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_token, a3);
    v11 = objc_retainBlock(v8);
    block = v10->_block;
    v10->_block = v11;

    fireByTimer = v10->_fireByTimer;
    v10->_fireByTimer = 0;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  BABlock *v4;
  uint64_t v5;
  BABlock *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = (BABlock *)a3;
  v6 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_7;
  }
  if (-[BABlock isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(BABlock, v5)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BABlock token](v6, "token"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BABlock token](self, "token"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
LABEL_5:
    v9 = 0;
  }
LABEL_7:

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BABlock token](self, "token"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)executeWithSuccessfulDequeue:(BOOL)a3
{
  _BOOL8 v3;
  BABlock *v4;
  unsigned __int8 v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[BABlock blockFired](v4, "blockFired");
  if ((v5 & 1) != 0)
  {
    objc_sync_exit(v4);
  }
  else
  {
    v4->_blockFired = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BABlock fireByTimer](v4, "fireByTimer"));

    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[BABlock fireByTimer](v4, "fireByTimer"));
      dispatch_source_cancel(v7);

    }
    objc_sync_exit(v4);

    v8 = objc_claimAutoreleasedReturnValue(-[BABlock block](v4, "block"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BABlock token](v4, "token"));
    (*(void (**)(uint64_t, _BOOL8, void *))(v8 + 16))(v8, v3, v9);

    v4 = (BABlock *)v8;
  }

  return v5 ^ 1;
}

- (id)block
{
  return self->_block;
}

- (NSUUID)token
{
  return self->_token;
}

- (OS_dispatch_source)fireByTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFireByTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)blockFired
{
  return self->_blockFired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireByTimer, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
