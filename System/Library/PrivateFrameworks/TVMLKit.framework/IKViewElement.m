@implementation IKViewElement

void __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "jsContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "retrieveJSElementForViewElement:jsContext:", *(_QWORD *)(a1 + 48), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51938]), "initWithAppContext:document:owner:", *(_QWORD *)(a1 + 32), v5, v8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_2;
    block[3] = &unk_24EB86A48;
    v17 = *(id *)(a1 + 56);
    v15 = v9;
    v16 = v6;
    v10 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_3;
    v11[3] = &unk_24EB86A70;
    v13 = *(id *)(a1 + 56);
    v12 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v11);

    v7 = v13;
  }

}

uint64_t __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_4(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  uint64_t v8;

  if (!a2 || a3)
  {
    v7 = v3;
    v8 = v4;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_5;
    block[3] = &unk_24EB85320;
    v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __95__IKViewElement_TVMLKitAdditions__retrievePresentationDocumentWithResponder_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
