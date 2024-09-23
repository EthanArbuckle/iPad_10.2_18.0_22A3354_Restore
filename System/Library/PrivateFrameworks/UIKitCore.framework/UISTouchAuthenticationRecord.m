@implementation UISTouchAuthenticationRecord

void __69___UISTouchAuthenticationRecord_UIKit__authenticationRecordForTouch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _BOOL8 v12;
  id v13;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  if (v3)
    v5 = *(void **)(v3 + 392);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v4, "setSecurityAnalysis:", v6);

  v7 = *(_QWORD **)(a1 + 40);
  if (v7)
    v7 = (_QWORD *)v7[119];
  v8 = v7;
  objc_msgSend(v4, "setHostBundleId:", v8);

  v9 = *(_QWORD **)(a1 + 40);
  if (v9)
    v9 = (_QWORD *)v9[117];
  v10 = v9;
  objc_msgSend(v4, "setHostSDKVersion:", v10);

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    v12 = *(unsigned __int8 *)(v11 + 906) != 0;
  else
    v12 = 0;
  objc_msgSend(v4, "setHostIsInternal:", v12);
  _UIMainBundleIdentifier();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceBundleId:", v13);

}

@end
