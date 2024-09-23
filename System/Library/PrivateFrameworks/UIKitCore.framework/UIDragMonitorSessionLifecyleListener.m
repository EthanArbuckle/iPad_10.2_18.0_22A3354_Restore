@implementation UIDragMonitorSessionLifecyleListener

void __82___UIDragMonitorSessionLifecyleListener_dragDidBeginWithSession_identifier_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _UIDragMonitorSession *v4;

  v4 = -[_UIDragMonitorSession initWithSessionIdentifier:remoteControlProxy:]([_UIDragMonitorSession alloc], "initWithSessionIdentifier:remoteControlProxy:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dragMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dragMonitor:didBeginDragSession:", v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  -[_UIDragMonitorSession connect](v4, "connect");

}

void __74___UIDragMonitorSessionLifecyleListener_dragDidEndWithSession_identifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dragMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dragMonitor:didEndDragSessionWithIdentifier:", v2, v3);

}

@end
