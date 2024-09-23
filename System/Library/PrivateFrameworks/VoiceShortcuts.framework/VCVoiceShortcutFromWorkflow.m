@implementation VCVoiceShortcutFromWorkflow

void __VCVoiceShortcutFromWorkflow_block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;

  v3 = (objc_class *)MEMORY[0x1E0DC7950];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "associatedAppBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v18, "length");
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 56), "associatedAppBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)*MEMORY[0x1E0DC7FD8];
  }
  objc_msgSend(*(id *)(a1 + 56), "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "modificationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "lastRunDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "runEventsCount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v14 = (void *)objc_msgSend(v17, "initWithIdentifier:phrase:shortcutName:shortcutDescription:associatedAppBundleIdentifier:dateCreated:dateLastModified:lastRunDate:runEventsCount:shortcut:keyImageData:error:", v16, v6, v6, v7, v9, v10, v11, v12, v13, v4, 0, &v19);

  v15 = v19;
  if (v8)

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

uint64_t __VCVoiceShortcutFromWorkflow_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
