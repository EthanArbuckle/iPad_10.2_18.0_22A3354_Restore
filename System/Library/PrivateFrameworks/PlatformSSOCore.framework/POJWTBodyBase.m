@implementation POJWTBodyBase

id __34___POJWTBodyBase_initWithJWTData___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error with JWT body data."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (PO_LOG_POJWTBody_once != -1)
    dispatch_once(&PO_LOG_POJWTBody_once, &__block_literal_global_16);
  v2 = PO_LOG_POJWTBody_log;
  if (os_log_type_enabled((os_log_t)PO_LOG_POJWTBody_log, OS_LOG_TYPE_ERROR))
    __67__POWSTrustProcess_parseMexResponse_namespaces_policyXPath_action___block_invoke_cold_1((uint64_t)v1, v2);
  return v1;
}

@end
