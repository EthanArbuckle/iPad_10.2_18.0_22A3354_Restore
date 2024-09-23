@implementation RadioRequestContext

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setUsesLocalNetworking:", self->_usesLocalNetworking);
  objc_msgSend(v4, "setSAPSession:", self->_SAPSession);
  return v4;
}

- (SSVFairPlaySAPSession)SAPSession
{
  return self->_SAPSession;
}

- (void)setSAPSession:(id)a3
{
  objc_storeStrong((id *)&self->_SAPSession, a3);
}

- (BOOL)usesLocalNetworking
{
  return self->_usesLocalNetworking;
}

- (void)setUsesLocalNetworking:(BOOL)a3
{
  self->_usesLocalNetworking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SAPSession, 0);
}

@end
