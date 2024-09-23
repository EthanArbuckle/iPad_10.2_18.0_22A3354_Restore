@implementation VSAlertForError

void __VSAlertForError_block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a1[4];
  v6 = a2;
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDF8E30]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "containsIndex:", a3))
    v9 = 2;
  else
    v9 = 0;
  v10 = (void *)MEMORY[0x24BDF67E8];
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __VSAlertForError_block_invoke_2;
  v15 = &unk_24FE19F50;
  v18 = a1[7];
  v16 = a1[5];
  v17 = a1[4];
  v19 = a3;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v6, v9, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[6], "addAction:", v11, v12, v13, v14, v15);
}

void __VSAlertForError_block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF8BE0], "sharedDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v2, sel_didPresentErrorWithRecovery_contextInfo_, objc_msgSend(*(id *)(a1 + 48), "copy"));

}

uint64_t __VSAlertForError_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

@end
