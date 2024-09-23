@implementation ICQMegaBackupNetworkRequest

void __51___ICQMegaBackupNetworkRequest__performURLRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51___ICQMegaBackupNetworkRequest__performURLRequest___block_invoke_2;
  v15[3] = &unk_1E8B38550;
  v15[4] = v10;
  v16 = v8;
  v17 = v7;
  v18 = v9;
  v12 = v9;
  v13 = v7;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __51___ICQMegaBackupNetworkRequest__performURLRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "handleURLResponse:data:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

@end
