@implementation ICQUIINDaemonConnectionSoftLinking

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)getINDaemonConnectionClass_softClass_2;
  v15 = getINDaemonConnectionClass_softClass_2;
  v5 = MEMORY[0x24BDAC760];
  if (!getINDaemonConnectionClass_softClass_2)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getINDaemonConnectionClass_block_invoke_2;
    v11[3] = &unk_24E3F3868;
    v11[4] = &v12;
    __getINDaemonConnectionClass_block_invoke_2((uint64_t)v11);
    v4 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  v7 = objc_alloc_init(v6);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __69__ICQUIINDaemonConnectionSoftLinking_renewCredentialsWithCompletion___block_invoke;
  v9[3] = &unk_24E3F4790;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "renewCredentialsWithCompletion:", v9);

}

void __69__ICQUIINDaemonConnectionSoftLinking_renewCredentialsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = a2;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Renew credential results: %lu - error: %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
