@implementation SWCGetServerConnection

void ___SWCGetServerConnection_block_invoke()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (qword_1ED1B6278 != -1)
    dispatch_once(&qword_1ED1B6278, &__block_literal_global_93);
  v0 = qword_1ED1B6270;
  if (os_log_type_enabled((os_log_t)qword_1ED1B6270, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138543362;
    v2 = CFSTR("com.apple.SharedWebCredentials");
    _os_log_impl(&dword_1A855A000, v0, OS_LOG_TYPE_DEFAULT, "disconnect event interruption received for service %{public}@", (uint8_t *)&v1, 0xCu);
  }
}

void ___SWCGetServerConnection_block_invoke_2()
{
  NSObject *v0;
  void *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (qword_1ED1B6278 != -1)
    dispatch_once(&qword_1ED1B6278, &__block_literal_global_93);
  v0 = qword_1ED1B6270;
  if (os_log_type_enabled((os_log_t)qword_1ED1B6270, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 138543362;
    v3 = CFSTR("com.apple.SharedWebCredentials");
    _os_log_impl(&dword_1A855A000, v0, OS_LOG_TYPE_DEFAULT, "disconnect event invalidation received for service %{public}@", (uint8_t *)&v2, 0xCu);
  }
  os_unfair_lock_lock(&gLock);
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = 0;

  os_unfair_lock_unlock(&gLock);
}

@end
