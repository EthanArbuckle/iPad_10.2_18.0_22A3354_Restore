@implementation UIOMenuLeafPerformAction

void __91___UIOMenuLeafPerformAction_initWithMenuElement_pasteAuthenticationMesage_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __64___UIOMenuLeafPerformAction_handleClientActionToOverlayService___block_invoke(uint64_t a1)
{
  _UIOMenuLeafPerformResponse *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "canSendResponse"))
  {
    v2 = -[BSActionResponse initWithInfo:error:]([_UIOMenuLeafPerformResponse alloc], "initWithInfo:error:", 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "sendResponse:", v2);

  }
}

@end
