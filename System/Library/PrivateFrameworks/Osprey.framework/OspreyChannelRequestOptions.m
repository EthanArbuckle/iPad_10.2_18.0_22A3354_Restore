@implementation OspreyChannelRequestOptions

- (OspreyChannelRequestOptions)init
{
  OspreyChannelRequestOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OspreyChannelRequestOptions;
  result = -[OspreyChannelRequestOptions init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_compressionEnabled = 257;
  return result;
}

- (void)applyToOspreyMutableRequest:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setCompressionEnabled:", -[OspreyChannelRequestOptions isCompressionEnabled](self, "isCompressionEnabled"));
  objc_msgSend(v4, "setForceHTTPv2:", -[OspreyChannelRequestOptions forceHTTPv2](self, "forceHTTPv2"));

}

- (BOOL)isCompressionEnabled
{
  return self->_compressionEnabled;
}

- (void)setCompressionEnabled:(BOOL)a3
{
  self->_compressionEnabled = a3;
}

- (BOOL)forceHTTPv2
{
  return self->_forceHTTPv2;
}

- (void)setForceHTTPv2:(BOOL)a3
{
  self->_forceHTTPv2 = a3;
}

@end
