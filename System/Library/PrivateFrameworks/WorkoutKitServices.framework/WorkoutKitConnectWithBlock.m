@implementation WorkoutKitConnectWithBlock

void ___WorkoutKitConnectWithBlock_block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void ___WorkoutKitConnectWithBlock_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v2, "_xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("Connection to %@ invalidated, reason: %s"), CFSTR("com.apple.WorkoutKitXPCService"), xpc_connection_copy_invalidation_reason());

  }
  else
  {
    v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Connection to %@ invalidated, reason: %s"), CFSTR("com.apple.WorkoutKitXPCService"), "null XPC connection");
  }
  v7 = (void *)MEMORY[0x24BDD1540];
  v8 = *MEMORY[0x24BDD0B88];
  v11 = *MEMORY[0x24BDD0BA0];
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, -100, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v10);
}

@end
