@implementation OS

void __46__OS_remote_service_proxySocketOverRemoteXPC___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "removeObject:", WeakRetained);

}

@end
