@implementation SFRequestMessage

- (void)invalidate
{
  id responseHandler;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFRequestMessage;
  -[SFMessage invalidate](&v4, sel_invalidate);
  responseHandler = self->_responseHandler;
  self->_responseHandler = 0;

}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
}

@end
