@implementation PMMTelephonyConnection

- (PMMTelephonyConnection)init
{
  PMMTelephonyConnection *v2;
  PMMTelephonyConnection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PMMTelephonyConnection;
  v2 = -[PMMTelephonyConnection init](&v5, sel_init);
  v3 = v2;
  if (v2)
    v2->_ctServerConnnectionRef = (__CTServerConnection *)_CTServerConnectionCreate();
  return v3;
}

- (void)dealloc
{
  __CTServerConnection *ctServerConnnectionRef;
  objc_super v4;

  ctServerConnnectionRef = self->_ctServerConnnectionRef;
  if (ctServerConnnectionRef)
  {
    CFRelease(ctServerConnnectionRef);
    self->_ctServerConnnectionRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PMMTelephonyConnection;
  -[PMMTelephonyConnection dealloc](&v4, sel_dealloc);
}

- (BOOL)phoneCallActiveOrHeld
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_ctServerConnnectionRef)
  {
    v2 = _CTServerConnectionIsAnyCallActiveOrHeld();
    if ((_DWORD)v2)
    {
      __atxlog_handle_pmm();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v7 = v2;
        v8 = 1024;
        v9 = HIDWORD(v2);
        _os_log_impl(&dword_2188D0000, v3, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionIsAnyCallActiveOrHeld failed %d, %d", buf, 0xEu);
      }

    }
    __atxlog_handle_pmm();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v7 = 0;
      _os_log_impl(&dword_2188D0000, v4, OS_LOG_TYPE_DEFAULT, "PhoneCallState is %{BOOL}d", buf, 8u);
    }
  }
  else
  {
    __atxlog_handle_pmm();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D0000, v4, OS_LOG_TYPE_DEFAULT, "Telephony Connection is NULL", buf, 2u);
    }
  }

  return 0;
}

@end
