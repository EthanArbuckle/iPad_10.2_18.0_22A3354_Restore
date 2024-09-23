@implementation ACMobileShimCopyTicket

uint64_t __ACMobileShimCopyTicket_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  id v4;
  ACMDelegate *v5;
  id v6;
  ACMAppleConnect *v7;
  CFPropertyListRef v8;
  void *v9;
  _QWORD v11[4];
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 48);
  v1 = *(_QWORD *)(a1 + 56);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __ACMobileShimCopyTicket_block_invoke_2;
  v11[3] = &unk_24FCE4F30;
  v3 = *(_OWORD *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 64);
  v12 = v3;
  v14 = *(_QWORD *)(a1 + 80);
  v4 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v5 = objc_alloc_init(ACMDelegate);
  -[ACMDelegate setCopyTicketCompletion:](v5, "setCopyTicketCompletion:", v11);
  v6 = +[ACMRequest authenticationRequest](ACMRequest, "authenticationRequest");
  objc_msgSend(v6, "setRealm:", CFSTR("APPLECONNECT.APPLE.COM"));
  objc_msgSend(v6, "setAppID:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1205));
  objc_msgSend(v6, "setAppIDKey:", CFSTR("D134F7CA19FC87A2BD841EE11F2A825C058040C92792F87B7E1C04B40291F620"));
  objc_msgSend(v6, "setUserName:", v2);
  v7 = +[ACMAppleConnect sharedInstance](ACMAppleConnect, "sharedInstance");
  -[ACMAppleConnect setDelegate:](v7, "setDelegate:", v5);
  v8 = CFPreferencesCopyAppValue(CFSTR("ACLogLevel"), CFSTR("com.apple.ACMobileShim"));
  if (v8)
  {
    v9 = (void *)v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ACMAppleConnect setLogLevel:](v7, "setLogLevel:", (int)objc_msgSend(v9, "intValue"));
  }
  -[ACMAppleConnect authenticateWithRequest:password:](v7, "authenticateWithRequest:password:", v6, v1);
  return objc_msgSend(v4, "drain");
}

void __ACMobileShimCopyTicket_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v6;
  id v7;
  _QWORD *v8;
  id v9;

  v6 = *(_QWORD **)(a1 + 48);
  if (v6)
  {
    if (a2)
    {
      v7 = a2;
      v6 = *(_QWORD **)(a1 + 48);
    }
    *v6 = a2;
  }
  v8 = *(_QWORD **)(a1 + 56);
  if (v8)
  {
    if (a3)
    {
      v9 = a3;
      v8 = *(_QWORD **)(a1 + 56);
    }
    *v8 = a3;
  }
  if (a2 && !a3)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 64));
}

@end
