@implementation ProcessDuplicates

void ___ProcessDuplicates_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___ProcessDuplicates_block_invoke_3;
  v3[3] = &unk_1E5148D08;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

}

void ___ProcessDuplicates_block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v3 = objc_msgSend(v2, "internal_processIdenticalDuplicatesWithError:", &v12);
  v4 = v12;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ProcessDuplicates_block_invoke_4;
  block[3] = &unk_1E513CB38;
  v5 = *(id *)(a1 + 32);
  v11 = v3;
  v8 = v5;
  v9 = v4;
  v10 = *(id *)(a1 + 40);
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void ___ProcessDuplicates_block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  char v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___ProcessDuplicates_block_invoke_5;
  v3[3] = &unk_1E51473C0;
  v6 = *(_BYTE *)(a1 + 56);
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

void ___ProcessDuplicates_block_invoke_5(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = CFSTR("Processing succeeded");
  if (!*(_BYTE *)(a1 + 48))
    v2 = CFSTR("Processing failed");
  v3 = (void *)MEMORY[0x1E0DC3450];
  v4 = *(void **)(a1 + 32);
  v5 = v2;
  objc_msgSend(v4, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v7);

  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v8, 1, 0);
}

@end
