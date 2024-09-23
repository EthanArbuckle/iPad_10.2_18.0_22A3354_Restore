@implementation CKContainer

void __76__CKContainer_Metadata__wf_fetchDeviceRecordsWithCursor_results_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    objc_sync_exit(v9);

  }
}

void __76__CKContainer_Metadata__wf_fetchDeviceRecordsWithCursor_results_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "wf_fetchDeviceRecordsWithCursor:results:completion:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      goto LABEL_6;
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();
LABEL_6:

}

@end
