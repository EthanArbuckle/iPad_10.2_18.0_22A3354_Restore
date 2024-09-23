@implementation PKSharingFetchInvitationFromMailboxAddress

void __PKSharingFetchInvitationFromMailboxAddress_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(void **)(a1 + 32);
  if (v4 || !v5)
  {
    objc_msgSend(v5, "invalidate");
    PKLogFacilityTypeGetObject(0x20uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Unable to handle share invitation link. Error: %@", buf, 0xCu);
    }

    _PKSharingDisplayableError(v4, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pkSharingError:", 6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _PKSharingDisplayableError(v10, 0, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __PKSharingFetchInvitationFromMailboxAddress_block_invoke_10;
    v11[3] = &unk_1E2AC8BB8;
    v12 = v5;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v12, "handleOutstandingMessage:", v11);

    v9 = v12;
  }

}

void __PKSharingFetchInvitationFromMailboxAddress_block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, 0);
  if (objc_msgSend(v5, "type") == 1)
  {
    v6 = v5;
    if ((PKIsPhone() & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      PKLogFacilityTypeGetObject(0x20uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Warning, tried to find embedded mailbox address on unsupported device!", (uint8_t *)&v15, 2u);
      }

      v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_msgSend(v6, "embeddedAddressForDeviceType:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      PKLogFacilityTypeGetObject(0x20uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        PKPassCredentialShareTargetDeviceToString(v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Found embedded message url for device '%@', following.", (uint8_t *)&v15, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "relinquishWithCompletion:", 0);
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      PKSharingFetchInvitationFromMailboxAddress(v12, *(_QWORD *)(a1 + 40));
    }
    else
    {

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "pkSharingError:", 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _PKSharingDisplayableError(v9, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v8 + 16))(v8, 0, 0, v10);

  }
}

@end
