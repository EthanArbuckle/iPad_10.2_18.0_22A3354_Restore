@implementation STSXPCHelperClientEntitlementChecker

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id result;
  BOOL xpcHelperClientTransceiveProxyListenerAccess;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  result = (id)objc_msgSend_init(v7, v8, v9);
  if (result)
  {
    if (self)
      xpcHelperClientTransceiveProxyListenerAccess = self->_xpcHelperClientTransceiveProxyListenerAccess;
    else
      xpcHelperClientTransceiveProxyListenerAccess = 0;
    *((_BYTE *)result + 8) = xpcHelperClientTransceiveProxyListenerAccess;
  }
  return result;
}

@end
