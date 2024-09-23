@implementation GTEntitlementCheckingConnection

- (GTEntitlementCheckingConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4
{
  GTEntitlementCheckingConnection *v4;
  os_log_t v5;
  OS_os_log *log;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GTEntitlementCheckingConnection;
  v4 = -[GTLocalXPCConnection initWithTransactionScopedXPCConnection:messageQueue:](&v8, "initWithTransactionScopedXPCConnection:messageQueue:", a3, a4);
  if (v4)
  {
    v5 = os_log_create("com.apple.gputools.transport", "EntitlementConnection");
    log = v4->_log;
    v4->_log = (OS_os_log *)v5;

  }
  return v4;
}

- (BOOL)isTrusted
{
  void *v3;
  SecTaskRef v4;
  NSObject *log;
  __SecTask *v6;
  NSObject *v7;
  CFTypeRef v8;
  CFErrorRef v9;
  CFErrorRef v10;
  OS_os_log *v11;
  CFStringRef v12;
  CFErrorRef v13;
  uint32_t v14;
  _BOOL4 v15;
  void *v16;
  CFTypeID v17;
  int v18;
  audit_token_t v20;
  CFErrorRef error;
  audit_token_t token;

  memset(&v20, 0, sizeof(v20));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GTLocalXPCConnection connection](self, "connection"));
  xpc_connection_get_audit_token(v3, &v20);

  token = v20;
  v4 = SecTaskCreateWithAuditToken(0, &token);
  log = self->_log;
  if (v4)
  {
    v6 = v4;
    v7 = log;
    error = 0;
    v8 = SecTaskCopyValueForEntitlement(v6, CFSTR("com.apple.private.gputools.client"), &error);
    v9 = error;
    if (error)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        token.val[0] = 138412290;
        *(_QWORD *)&token.val[1] = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to copy com.apple.private.gputools.client entitlement value, %@", (uint8_t *)&token, 0xCu);
        v9 = error;
      }
      v10 = v9;
    }
    else
    {
      v16 = (void *)v8;
      if (!v8)
        goto LABEL_7;
      v17 = CFGetTypeID(v8);
      if (v17 == CFBooleanGetTypeID())
      {
        v18 = CFEqual(v16, kCFBooleanTrue);
        CFRelease(v16);

        if (v18)
        {
LABEL_17:
          CFRelease(v6);
          LOBYTE(v15) = 1;
          return v15;
        }
LABEL_8:
        v11 = self->_log;
        error = 0;
        v12 = SecTaskCopySigningIdentifier(v6, &error);
        if (v12)
        {
          v13 = (CFErrorRef)v12;
          if (CFEqual(v12, CFSTR("com.apple.gputoolstransportd")))
          {
            v14 = ~SecTaskGetCodeSignStatus(v6) & 0x24000001;
            CFRelease(v13);

            if (v14)
              goto LABEL_23;
            goto LABEL_17;
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
          {
            token.val[0] = 138412290;
            *(_QWORD *)&token.val[1] = error;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_ERROR, "Failed to retrieve signing identifier, %@", (uint8_t *)&token, 0xCu);
          }
          v13 = error;
          if (!error)
            goto LABEL_22;
        }
        CFRelease(v13);
LABEL_22:

LABEL_23:
        CFRelease(v6);
        goto LABEL_24;
      }
      v10 = (CFErrorRef)v16;
    }
    CFRelease(v10);
LABEL_7:

    goto LABEL_8;
  }
  v15 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
  if (v15)
  {
    LOWORD(token.val[0]) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create task from audit token", (uint8_t *)&token, 2u);
LABEL_24:
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end
