@implementation AMSupportHttpCopyProxySettings

void *__AMSupportHttpCopyProxySettings_block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/usr/lib/libReverseProxyDevice.dylib", 261);
  if (result)
  {
    v1 = result;
    AMSupportHttpCopyProxySettings_dl_RPRegisterForAvailability = (uint64_t (*)(_QWORD))dlsym(result, "RPRegisterForAvailability");
    AMSupportHttpCopyProxySettings_dl_RPRegistrationResume = (uint64_t (*)(_QWORD))dlsym(v1, "RPRegistrationResume");
    AMSupportHttpCopyProxySettings_dl_RPRegistrationInvalidate = (uint64_t (*)(_QWORD))dlsym(v1, "RPRegistrationInvalidate");
    result = dlsym(v1, "RPCopyProxyDictionaryWithOptions");
    AMSupportHttpCopyProxySettings_dl_RPCopyProxyDictionaryWithOptions = (uint64_t (*)(_QWORD, _QWORD))result;
  }
  return result;
}

intptr_t __AMSupportHttpCopyProxySettings_block_invoke_2(intptr_t result, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  intptr_t v8;
  const char *v9;
  char v10;

  v8 = result;
  switch(a2)
  {
    case 3:
      v9 = "AMSupportHttpCopyProxySettings: RPNotificationAborted";
      break;
    case 2:
      v9 = "AMSupportHttpCopyProxySettings: RPNotificationProxyUnavailable";
      break;
    case 1:
      AMSupportLogInternal(6, (uint64_t)"AMSupportHttpCopyProxySettings_block_invoke_2", (uint64_t)"Proxy available", a4, a5, a6, a7, a8, v10);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 32) + 8) + 24) = 1;
      v9 = "AMSupportHttpCopyProxySettings: RPNotificationProxyAvailable";
      break;
    default:
      return result;
  }
  AMSupportLogInternal(6, (uint64_t)"AMSupportHttpCopyProxySettings_block_invoke_2", (uint64_t)v9, a4, a5, a6, a7, a8, v10);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v8 + 40));
}

@end
