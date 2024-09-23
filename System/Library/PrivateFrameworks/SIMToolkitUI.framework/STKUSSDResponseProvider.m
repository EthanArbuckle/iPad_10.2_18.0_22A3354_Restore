@implementation STKUSSDResponseProvider

void __41___STKUSSDResponseProvider_sendResponse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_216439000, v2, OS_LOG_TYPE_DEFAULT, "_STKUSSDResponseProvider: sendResponse: _options:%@", (uint8_t *)&v5, 0xCu);
  }
  if (*(_QWORD *)(a1 + 40) == 1)
    v4 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cancelSIMToolkitUSSDSession:", 0);
}

_QWORD *__58___STKUSSDResponseProvider_sendResponse_withStringResult___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[6];
  if (v1 == 1)
    return (id)objc_msgSend(*(id *)(result[4] + 16), "cancelSIMToolkitUSSDSession:", 0);
  if (!v1)
    return (id)objc_msgSend(*(id *)(result[4] + 16), "sendSIMToolkitUSSDResponse:response:", 0, result[5]);
  return result;
}

@end
