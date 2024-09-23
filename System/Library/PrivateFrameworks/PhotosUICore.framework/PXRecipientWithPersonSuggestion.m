@implementation PXRecipientWithPersonSuggestion

void __PXRecipientWithPersonSuggestion_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  PXRecipient *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v6, "address");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "addressKind");
    }
    else
    {
      PLSharingGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v18 = 138412290;
        v19 = v11;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "No best transport available for person suggestion:%@", (uint8_t *)&v18, 0xCu);
      }

      v9 = 0;
      v8 = 0;
    }
    v12 = -[PXRecipient initWithContact:address:nameComponents:recipientKind:]([PXRecipient alloc], "initWithContact:address:nameComponents:recipientKind:", v5, v8, 0, v9);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidAddressString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = 0;

    }
  }

}

@end
