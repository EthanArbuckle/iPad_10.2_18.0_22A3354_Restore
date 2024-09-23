@implementation STKSIMToolkitResponseProvider

id __47___STKSIMToolkitResponseProvider_sendResponse___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendSIMToolkitUserActivity:", 0);
}

void __47___STKSIMToolkitResponseProvider_sendResponse___block_invoke_16(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "valueForKey:", *MEMORY[0x24BDC2F00]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendSIMToolkitResponse:session:response:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v3, objc_msgSend(*(id *)(a1 + 32), "_responseFromResponseType:", *(_QWORD *)(a1 + 40)));

}

void __62___STKSIMToolkitResponseProvider_sendResponse_withBOOLResult___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "valueForKey:", *MEMORY[0x24BDC2F00]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendSIMToolkitBooleanResponse:session:response:yesNo:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v3, objc_msgSend(*(id *)(a1 + 32), "_responseFromResponseType:", *(_QWORD *)(a1 + 40)), *(unsigned __int8 *)(a1 + 48));

}

void __64___STKSIMToolkitResponseProvider_sendResponse_withStringResult___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "valueForKey:", *MEMORY[0x24BDC2F00]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendSIMToolkitStringResponse:session:response:string:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v3, objc_msgSend(*(id *)(a1 + 32), "_responseFromResponseType:", *(_QWORD *)(a1 + 48)), *(_QWORD *)(a1 + 40));

}

void __63___STKSIMToolkitResponseProvider_sendSuccessWithSelectedIndex___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "valueForKey:", *MEMORY[0x24BDC2F00]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "selectSIMToolkitListItem:session:response:index:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v4, *MEMORY[0x24BDC2E38], v2);

}

@end
