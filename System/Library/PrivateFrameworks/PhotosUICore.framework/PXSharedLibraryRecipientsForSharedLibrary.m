@implementation PXSharedLibraryRecipientsForSharedLibrary

void __PXSharedLibraryRecipientsForSharedLibrary_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  PXRecipient *v6;
  void *v7;
  PXRecipient *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "emailAddress");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumber");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 | v5)
  {
    v6 = [PXRecipient alloc];
    objc_msgSend(v3, "nameComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXRecipient initWithEmailAddress:phoneNumber:nameComponents:](v6, "initWithEmailAddress:phoneNumber:nameComponents:", v4, v5, v7);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  }
  else
  {
    PLSharedLibraryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Failed to create recipient for participant with no address: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

@end
