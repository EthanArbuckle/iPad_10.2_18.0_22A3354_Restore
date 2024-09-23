@implementation RWITCPConnection

_BYTE *__33___RWITCPConnection_sendMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BYTE *result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  +[_RWITCPRelayMessage TCPRelayMessageWithPayload:](_RWITCPRelayMessage, "TCPRelayMessageWithPayload:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  result = *(_BYTE **)(a1 + 32);
  if (result[41])
    return (_BYTE *)objc_msgSend(result, "_setOutputSourceSuspended:", 0);
  return result;
}

uint64_t __40___RWITCPConnection__createOutputSource__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleOutput");
}

uint64_t __40___RWITCPConnection__createOutputSource__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 43) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchSourceCancelled");
}

void __39___RWITCPConnection__closeOutputStream__block_invoke(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
    objc_msgSend(v4, "tcpConnectionDidClose:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __39___RWITCPConnection__createInputSource__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInput");
}

uint64_t __39___RWITCPConnection__createInputSource__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 42) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchSourceCancelled");
}

void __50___RWITCPConnection__processIncomingBytes_length___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tcpConnection:didReceiveMessage:", v3, v4);

  }
}

@end
