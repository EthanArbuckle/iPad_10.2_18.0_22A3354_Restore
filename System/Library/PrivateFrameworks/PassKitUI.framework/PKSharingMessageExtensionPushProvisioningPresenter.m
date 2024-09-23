@implementation PKSharingMessageExtensionPushProvisioningPresenter

- (PKSharingMessageExtensionPushProvisioningPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4
{
  id v7;
  id v8;
  PKSharingMessageExtensionPushProvisioningPresenter *v9;
  PKSharingMessageExtensionPushProvisioningPresenter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSharingMessageExtensionPushProvisioningPresenter;
  v9 = -[PKSharingMessageExtensionPushProvisioningPresenter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetDevice, a3);
    objc_storeStrong((id *)&v10->_passLibrary, a4);
  }

  return v10;
}

+ (Class)messageClass
{
  return (Class)objc_opt_class();
}

- (PKSharingMessageExtensionMessage)message
{
  return (PKSharingMessageExtensionMessage *)self->_message;
}

- (void)setMessage:(id)a3
{
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_message, a3);

}

- (void)extensionWillAppear
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  _QWORD v9[5];

  -[PKSharingMessageExtensionPushProvisioningPresenter _passInLibraryForMessage]((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShareableCredentialMessage shareableCredentials](self->_message, "shareableCredentials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStatus:", 2);

    -[PKShareableCredentialMessage setShareableCredentials:](self->_message, "setShareableCredentials:", v5);
    -[PKShareableCredentialMessage setIsPassInLibrary:](self->_message, "setIsPassInLibrary:", 1);
  }
  else
  {
    -[PKShareableCredentialMessage setIsPassInLibrary:](self->_message, "setIsPassInLibrary:", 0);
    if (!-[PKShareableCredentialMessage isPending](self->_message, "isPending"))
    {
      targetDevice = self->_targetDevice;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __73__PKSharingMessageExtensionPushProvisioningPresenter_extensionWillAppear__block_invoke;
      v9[3] = &unk_1E3E77AA0;
      v9[4] = self;
      -[PKPaymentWebServiceTargetDeviceProtocol statusForShareableCredentials:completion:](targetDevice, "statusForShareableCredentials:completion:", v5, v9);
      goto LABEL_6;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
  objc_msgSend(WeakRetained, "messageDidUpdate");

LABEL_6:
}

- (id)_passInLibraryForMessage
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1 && (objc_msgSend(*(id *)(a1 + 24), "isFromMe") & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(a1 + 24), "shareableCredentials", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v12;
LABEL_6:
      v6 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 16);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "credentialIdentifierHash");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "passForProvisioningCredentialHash:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          break;
        if (v4 == ++v6)
        {
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v4)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

void __73__PKSharingMessageExtensionPushProvisioningPresenter_extensionWillAppear__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__PKSharingMessageExtensionPushProvisioningPresenter_extensionWillAppear__block_invoke_2;
  v6[3] = &unk_1E3E61388;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __73__PKSharingMessageExtensionPushProvisioningPresenter_extensionWillAppear__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setShareableCredentials:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "messageDidUpdate");

}

- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  NSObject *v8;
  PKShareableCredentialMessage *message;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id *v37;
  id *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  uint8_t *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  __int128 *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  __int128 *p_buf;
  uint8_t *v62;
  id v63;
  uint8_t v64[8];
  uint8_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  id location;
  uint8_t v71[128];
  __int128 buf;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v39 = a4;
  v41 = a5;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    message = self->_message;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = message;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Validate before sending iMessage: %@", (uint8_t *)&buf, 0xCu);
  }

  if ((PKiMessageIsActive() & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(v40, "count") < 2)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v73 = 0x3032000000;
      v74 = __Block_byref_object_copy__54;
      v75 = __Block_byref_object_dispose__54;
      objc_msgSend(v40, "firstObject");
      v76 = (id)objc_claimAutoreleasedReturnValue();
      if (PKIDSServiceContainsHandle())
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v64 = 0;
          _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Sender address is the same as recipient!", v64, 2u);
        }

        WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
        PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SEND_FAILURE_TO_SELF_TITLE"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_INVALID_RECIPIENT_SELF"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_OK_BUTTON"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "showAlertWithTitle:message:button:", v19, v20, v21);

        (*((void (**)(id, _QWORD, _QWORD))v41 + 2))(v41, 0, 0);
      }
      else
      {
        v42 = objc_alloc_init(MEMORY[0x1E0D66B90]);
        v22 = objc_alloc(MEMORY[0x1E0D66DD8]);
        v23 = MEMORY[0x1E0C80D38];
        v24 = MEMORY[0x1E0C80D38];
        v25 = (void *)objc_msgSend(v22, "initWithQueue:", v23);

        objc_initWeak(&location, self);
        *(_QWORD *)v64 = 0;
        v65 = v64;
        v66 = 0x3032000000;
        v67 = __Block_byref_object_copy__54;
        v68 = __Block_byref_object_dispose__54;
        v69 = 0;
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke;
        v59[3] = &unk_1E3E66DB0;
        v26 = v25;
        v60 = v26;
        p_buf = &buf;
        v62 = v64;
        v37 = &v63;
        objc_copyWeak(&v63, &location);
        objc_msgSend(v42, "addOperation:", v59);
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_33;
        v55[3] = &unk_1E3E66E00;
        v36 = v26;
        v56 = v36;
        v57 = &buf;
        v38 = &v58;
        objc_copyWeak(&v58, &location);
        objc_msgSend(v42, "addOperation:", v55);
        v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v53 = 0u;
        v54 = 0u;
        v52 = 0u;
        v51 = 0u;
        -[PKShareableCredentialMessage shareableCredentials](self->_message, "shareableCredentials");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
        if (v29)
        {
          v30 = *(_QWORD *)v52;
          do
          {
            v31 = 0;
            do
            {
              if (*(_QWORD *)v52 != v30)
                objc_enumerationMutation(v28);
              v32 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v31);
              v47[0] = MEMORY[0x1E0C809B0];
              v47[1] = 3221225472;
              v47[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_37;
              v47[3] = &unk_1E3E77B18;
              objc_copyWeak(&v50, &location);
              v49 = v64;
              v47[4] = v32;
              v48 = v27;
              objc_msgSend(v42, "addOperation:", v47, v36, v37, v38);

              objc_destroyWeak(&v50);
              ++v31;
            }
            while (v29 != v31);
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
          }
          while (v29);
        }

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_45;
        v43[3] = &unk_1E3E67198;
        objc_copyWeak(&v46, &location);
        v34 = v27;
        v44 = v34;
        v45 = v41;
        v35 = (id)objc_msgSend(v42, "evaluateWithInput:completion:", v33, v43);

        objc_destroyWeak(&v46);
        objc_destroyWeak(v38);

        objc_destroyWeak(v37);
        _Block_object_dispose(v64, 8);

        objc_destroyWeak(&location);
      }
      _Block_object_dispose(&buf, 8);

    }
    else
    {
      v10 = objc_loadWeakRetained((id *)&self->_renderer);
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SEND_FAILURE_TITLE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_INVALID_GROUP"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_OK_BUTTON"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "showAlertWithTitle:message:button:", v11, v12, v13);

      (*((void (**)(id, _QWORD, _QWORD))v41 + 2))(v41, 0, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "iMessage Extension: iMessage is disabled", (uint8_t *)&buf, 2u);
    }

    v14 = objc_loadWeakRetained((id *)&self->_renderer);
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SEND_FAILURE_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_IMESSAGE_DISABLED_BODY"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_OK_BUTTON"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "showAlertWithTitle:message:button:", v15, v16, v17);

    (*((void (**)(id, _QWORD, _QWORD))v41 + 2))(v41, 0, 0);
  }

}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2;
  v14[3] = &unk_1E3E66D88;
  v17 = *(_QWORD *)(a1 + 48);
  objc_copyWeak(&v19, (id *)(a1 + 56));
  v18 = *(_QWORD *)(a1 + 40);
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  objc_msgSend(v10, "reachableDestinationsForDestination:service:completion:", v11, CFSTR("com.apple.private.alloy.harmony.pushprovisioning"), v14);

  objc_destroyWeak(&v19);
}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (a3 || !objc_msgSend(v6, "count"))
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = CFSTR("com.apple.private.alloy.harmony.pushprovisioning");
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "iMessage Extension: IDSBatchIDQueryController service %@ returned no reachable destinations", (uint8_t *)&v12, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    -[PKSharingMessageExtensionPushProvisioningPresenter _presentIDSAlert]((uint64_t)WeakRetained);

  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_presentIDSAlert
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SEND_FAILURE_TITLE"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_INVALID_RECIPIENT"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_OK_BUTTON"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "showAlertWithTitle:message:button:", v1, v2, v3);

  }
}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_33(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v11 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(*(_QWORD *)(v10 + 8) + 40);
  v13 = *MEMORY[0x1E0D34240];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_34;
  v16[3] = &unk_1E3E77AC8;
  v19 = v10;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  v14 = v9;
  v18 = v14;
  v15 = v8;
  v17 = v15;
  objc_msgSend(v11, "checkIDSStatusForDestination:service:listenerID:completion:", v12, v13, CFSTR("ShareableCredentialsIDSStatusQueryListenerID"), v16);

  objc_destroyWeak(&v20);
}

uint64_t __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_34(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  id WeakRetained;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Recipient %@ doesn't support imessage", (uint8_t *)&v7, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    -[PKSharingMessageExtensionPushProvisioningPresenter _presentIDSAlert]((uint64_t)WeakRetained);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_37(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v20 = v7;
    v21 = objc_alloc(MEMORY[0x1E0D67568]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKIDSNormalizedAddress();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "credentialIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cardConfigurationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sharingInstanceIdentifier");
    v15 = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "nonce");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "initWithAppleIdentifier:appleIdentifierType:provisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:nonce:", v12, 2, v13, v14, v16, v17);

    v8 = v15;
    v18 = (void *)WeakRetained[1];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_39;
    v23[3] = &unk_1E3E77AF0;
    v19 = *(void **)(a1 + 40);
    v23[4] = *(_QWORD *)(a1 + 32);
    v24 = v19;
    objc_copyWeak(&v27, (id *)(a1 + 56));
    v26 = v9;
    v25 = v15;
    objc_msgSend(v18, "prepareProvisioningTarget:checkFamilyCircle:completion:", v22, 1, v23);

    objc_destroyWeak(&v27);
    v7 = v20;
  }

}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_39(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v7;
    v16 = 1024;
    v17 = a3;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Sending provisioning target %@ (family circle: %d).", buf, 0x12u);
  }

  if (v7)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (v10)
  {
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v11, "setEncryptedPushProvisioningTarget:", v7);
    objc_msgSend(v11, "setStatus:", 1);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "iMessage Extension: prepareProvisioningTarget error: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_40;
    block[3] = &unk_1E3E61310;
    objc_copyWeak(&v13, (id *)(a1 + 64));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v13);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_40(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 4);
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SEND_FAILURE_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SHARING_ERROR"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_OK_BUTTON"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "showAlertWithTitle:message:button:", v3, v4, v5);

    WeakRetained = v6;
  }

}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_45(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_3;
  v7[3] = &unk_1E3E689E0;
  objc_copyWeak(&v11, a1 + 6);
  v8 = v5;
  v9 = a1[4];
  v10 = a1[5];
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v11);
}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
    {
      v3 = (void *)*((_QWORD *)WeakRetained + 3);
      v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
      objc_msgSend(v3, "setShareableCredentials:", v4);

      v5 = objc_loadWeakRetained((id *)WeakRetained + 4);
      objc_msgSend(v5, "messageDidUpdate");

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "iMessage Extension: presenter deallocated", v7, 2u);
    }

  }
}

- (void)didTapMessage
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  PKShareableCredentialMessage *v7;
  void *v8;
  id v9;
  int IsCurrentlyAvailable;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  UIImage *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  PKShareableCredentialMessage *v22;
  const char *v23;
  PKShareableCredentialMessage *message;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  PKShareableCredentialMessage *v30;
  __int16 v31;
  PKShareableCredentialMessage *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[PKSharingMessageExtensionPushProvisioningPresenter _passInLibraryForMessage]((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!-[PKShareableCredentialMessage isShareAcceptable](self->_message, "isShareAcceptable"))
      goto LABEL_15;
    -[PKShareableCredentialMessage shareableCredentials](self->_message, "shareableCredentials");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_arrayByApplyingBlock:", &__block_literal_global_202);
    v7 = (PKShareableCredentialMessage *)objc_claimAutoreleasedReturnValue();

    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v28;
    if (v8)
    {
      IsCurrentlyAvailable = PKPassbookIsCurrentlyAvailable();
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (IsCurrentlyAvailable)
      {
        v27 = v9;
        if (v12)
        {
          *(_DWORD *)buf = 138412290;
          v30 = v7;
          _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Open shareable credential with encrypted provisioning targets %@", buf, 0xCu);
        }

        v25 = (void *)MEMORY[0x1E0CB3940];
        v13 = *MEMORY[0x1E0D6B6F0];
        v14 = *MEMORY[0x1E0D6B6E8];
        objc_msgSend(v8, "hexEncoding");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *MEMORY[0x1E0D6B6F8];
        -[PKShareableCredentialMessage passThumbnailImage](self->_message, "passThumbnailImage");
        v26 = v8;
        v17 = (UIImage *)objc_claimAutoreleasedReturnValue();
        UIImagePNGRepresentation(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "hexEncoding");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("shoebox://%@/?%@=%@&%@=%@"), v13, v14, v15, v16, v19);
        v11 = objc_claimAutoreleasedReturnValue();

        v8 = v26;
        WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "openAppURL:", v21);

        v9 = v27;
        goto LABEL_14;
      }
      if (v12)
      {
        message = self->_message;
        *(_DWORD *)buf = 138412546;
        v30 = message;
        v31 = 2112;
        v32 = v7;
        v23 = "iMessage Extension: Unable to open shareable credential as passbook is not available: %@ %@";
        goto LABEL_13;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_message;
        *(_DWORD *)buf = 138412546;
        v30 = v22;
        v31 = 2112;
        v32 = v7;
        v23 = "iMessage Extension: Open shareable credential with no encrypted provisioning targets: %@ %@";
LABEL_13:
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  v4 = objc_loadWeakRetained((id *)&self->_renderer);
  objc_msgSend(v3, "passURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openAppURL:", v5);

LABEL_15:
}

uint64_t __67__PKSharingMessageExtensionPushProvisioningPresenter_didTapMessage__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encryptedPushProvisioningTarget");
}

+ (id)propertiesForMessage:(id)a3
{
  id v3;
  PKSharingMessageExtensionViewProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = objc_alloc_init(PKSharingMessageExtensionViewProperties);
  objc_msgSend(v3, "caption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setTitle:](v4, "setTitle:", v5);

  objc_msgSend(v3, "passThumbnailImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PKSharingMessageExtensionViewProperties setCardImage:](v4, "setCardImage:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("placeholder"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharingMessageExtensionViewProperties setCardImage:](v4, "setCardImage:", v7);

  }
  v8 = objc_msgSend(v3, "isFromMe");
  objc_msgSend(v3, "shareableCredentials");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "status");

  switch(v11)
  {
    case 0:
      goto LABEL_7;
    case 1:
      if (v8)
        v12 = CFSTR("SHAREABLE_MESSAGES_EXTENSION_SUBTITLE_TEXT_AVAILABLE_SENDER");
      else
LABEL_7:
        v12 = CFSTR("SHAREABLE_MESSAGES_EXTENSION_SUBTITLE_TEXT_WALLET");
      goto LABEL_12;
    case 2:
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_EXTENSION_SUBTITLE_TEXT_CONSUMED"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharingMessageExtensionViewProperties setSubtitle:](v4, "setSubtitle:", v13);

      if (!objc_msgSend(v3, "isPassInLibrary"))
        break;
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_EXTENSION_BUTTON_TEXT_VIEW"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharingMessageExtensionViewProperties setButtonText:](v4, "setButtonText:", v14);
      goto LABEL_13;
    case 3:
      v12 = CFSTR("SHAREABLE_MESSAGES_EXTENSION_SUBTITLE_TEXT_REVOKED");
      goto LABEL_12;
    case 4:
      v12 = CFSTR("SHAREABLE_MESSAGES_EXTENSION_SUBTITLE_TEXT_EXPIRED");
LABEL_12:
      PKLocalizedShareableCredentialString(&v12->isa);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharingMessageExtensionViewProperties setSubtitle:](v4, "setSubtitle:", v14);
LABEL_13:

      break;
    default:
      break;
  }
  if (objc_msgSend(v3, "isShareAcceptable"))
  {
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_EXTENSION_BUTTON_TEXT_ADD"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharingMessageExtensionViewProperties setButtonText:](v4, "setButtonText:", v15);

  }
  return v4;
}

- (PKSharingMessageExtensionRenderer)renderer
{
  return (PKSharingMessageExtensionRenderer *)objc_loadWeakRetained((id *)&self->_renderer);
}

- (void)setRenderer:(id)a3
{
  objc_storeWeak((id *)&self->_renderer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderer);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
}

@end
