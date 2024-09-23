@implementation UISTouchAuthenticationRecord

void __127___UISTouchAuthenticationRecord_initWithSecurityAnalysis_timestamp_hostBundleId_hostSDKVersion_hostIsInternal_serviceBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSecurityAnalysis:", v3);
  objc_msgSend(v4, "setHostBundleId:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setHostSDKVersion:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setHostIsInternal:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(v4, "setServiceBundleId:", *(_QWORD *)(a1 + 56));

}

@end
