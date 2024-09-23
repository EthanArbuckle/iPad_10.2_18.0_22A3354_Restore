@implementation ISOperation

void __52__ISOperation_SUScriptPost__sendCompletionCallback___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x24BDBCE30]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "success");
  v5 = (_QWORD *)MEMORY[0x24BDBD270];
  if (!v4)
    v5 = (_QWORD *)MEMORY[0x24BDBD268];
  v6 = (id)objc_msgSend(v2, "initWithObjects:", v3, *v5, 0);
  objc_msgSend(*(id *)(a1 + 32), "callWebScriptMethod:withArguments:", CFSTR("call"), v6);

}

@end
