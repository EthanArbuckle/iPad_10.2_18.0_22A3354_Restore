@implementation _PXDiagnosticsNotificationReplyHandle

- (_PXDiagnosticsNotificationReplyHandle)initWithIDNumber:(int64_t)a3 replyBlock:(id)a4
{
  id v6;
  _PXDiagnosticsNotificationReplyHandle *v7;
  _PXDiagnosticsNotificationReplyHandle *v8;
  uint64_t v9;
  id replyBlock;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXDiagnosticsNotificationReplyHandle;
  v7 = -[_PXDiagnosticsNotificationReplyHandle init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_idNumber = a3;
    v9 = objc_msgSend(v6, "copy");
    replyBlock = v8->_replyBlock;
    v8->_replyBlock = (id)v9;

  }
  return v8;
}

- (void)replyWithInfo:(id)a3
{
  id v4;
  void (**v5)(id, int64_t, id);

  v4 = a3;
  -[_PXDiagnosticsNotificationReplyHandle replyBlock](self, "replyBlock");
  v5 = (void (**)(id, int64_t, id))objc_claimAutoreleasedReturnValue();
  v5[2](v5, -[_PXDiagnosticsNotificationReplyHandle idNumber](self, "idNumber"), v4);

}

- (int64_t)idNumber
{
  return self->_idNumber;
}

- (id)replyBlock
{
  return self->_replyBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replyBlock, 0);
}

@end
