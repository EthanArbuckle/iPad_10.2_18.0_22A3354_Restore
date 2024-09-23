@implementation PKSharingMessageExtensionCarKeyPresenter

- (PKSharingMessageExtensionCarKeyPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4
{
  id v7;
  id v8;
  PKSharingMessageExtensionCarKeyPresenter *v9;
  PKSharingMessageExtensionCarKeyPresenter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSharingMessageExtensionCarKeyPresenter;
  v9 = -[PKSharingMessageExtensionCarKeyPresenter init](&v12, sel_init);
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
  PKSubcredentialInvitationMessage **p_message;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char IsTerminal;
  char v9;
  id v10;
  id *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_message = &self->_message;
  -[PKSubcredentialInvitationMessage phoneInvitation](self->_message, "phoneInvitation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSubcredentialInvitationMessage status](*p_message, "status");
  objc_initWeak(&location, self);
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    PKShareStatusToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "iMessage Extension: invitationIdentifier: %@ status: %@", buf, 0x16u);

  }
  -[PKSubcredentialInvitationMessage status](self->_message, "status");
  IsTerminal = PKShareStatusIsTerminal();
  if (v5)
    v9 = IsTerminal;
  else
    v9 = 1;
  if ((v9 & 1) == 0)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D66C90]);
    if (-[PKSubcredentialInvitationMessage isFromMe](self->_message, "isFromMe"))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke;
      v14[3] = &unk_1E3E66D60;
      v11 = &v15;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v10, "statusForSentSharingInvitationWithIdentifier:completion:", v5, v14);
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke_14;
      v12[3] = &unk_1E3E66D60;
      v11 = &v13;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v10, "statusForReceivedSharingInvitationWithIdentifier:completion:", v5, v12);
    }
    objc_destroyWeak(v11);

  }
  objc_destroyWeak(&location);

}

void __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke_2;
  v3[3] = &unk_1E3E66D38;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Updated sent status: %lu", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(WeakRetained[3], "setStatus:", *(_QWORD *)(a1 + 40));
  v5 = objc_loadWeakRetained(WeakRetained + 9);
  objc_msgSend(v5, "messageDidUpdate");

}

void __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke_14(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke_2_15;
  v3[3] = &unk_1E3E66D38;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke_2_15(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Updated received status: %lu", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(WeakRetained[3], "setStatus:", *(_QWORD *)(a1 + 40));
  v5 = objc_loadWeakRetained(WeakRetained + 9);
  objc_msgSend(v5, "messageDidUpdate");

}

- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  PKAppletSubcredentialSharingRequest *v23;
  PKAppletSubcredentialSharingRequest *sharingRequest;
  void *v25;
  void *v26;
  id v27;
  PKContactResolver *contactResolver;
  id v29;
  void *v30;
  PKContactResolver *v31;
  PKContactResolver *v32;
  PKContactResolver *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  PKAppletSubcredentialSharingRequest *v50;
  id *v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  uint8_t *v58;
  id v59;
  _QWORD v60[5];
  id v61;
  uint8_t *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  uint8_t *v66;
  uint8_t *v67;
  id v68;
  uint8_t v69[8];
  uint8_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  id location;
  uint8_t buf[8];
  uint8_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Validate message for sending and present Oslo sheet", buf, 2u);
  }

  if ((PKiMessageIsActive() & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: iMessage is disabled", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
    PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_CANNOT_SHARE_CARKEY"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_IMESSAGE_DISABLED_BODY"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "showAlertWithTitle:message:button:", v13, v14, v15);

    goto LABEL_12;
  }
  if (!self || (unint64_t)objc_msgSend(v8, "count") < 2)
  {
    *(_QWORD *)buf = 0;
    v77 = buf;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__8;
    v80 = __Block_byref_object_dispose__8;
    objc_msgSend(v8, "firstObject");
    v81 = (id)objc_claimAutoreleasedReturnValue();
    if (PKIDSServiceContainsHandle())
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v69 = 0;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Sender address is the same as recipient!", v69, 2u);
      }

      v16 = objc_loadWeakRetained((id *)&self->_renderer);
      PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_CANNOT_SHARE_CARKEY"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_RECIPIENT_EQUAL_TO_SENDER"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "showAlertWithTitle:message:button:", v17, v18, v19);

      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }
    else
    {
      v20 = *((id *)v77 + 5);
      if (self)
      {
        -[PKSubcredentialInvitationMessage dataString](self->_message, "dataString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "pk_decodeHexadecimal");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v22, 0);
          v23 = (PKAppletSubcredentialSharingRequest *)objc_claimAutoreleasedReturnValue();
          sharingRequest = self->_sharingRequest;
          self->_sharingRequest = v23;

          -[PKAppletSubcredentialSharingRequest passIdentifier](self->_sharingRequest, "passIdentifier");
          v51 = (id *)objc_claimAutoreleasedReturnValue();
          -[PKPassLibraryDataProvider passWithUniqueID:](self->_passLibrary, "passWithUniqueID:", v51);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "paymentPass");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          -[PKAppletSubcredentialSharingRequest setPass:](self->_sharingRequest, "setPass:", v26);
          -[PKAppletSubcredentialSharingRequest setRecipientIdentifier:](self->_sharingRequest, "setRecipientIdentifier:", v20);
          v50 = self->_sharingRequest;
          v27 = v20;
          contactResolver = self->_contactResolver;
          if (!contactResolver)
          {
            v29 = objc_alloc_init(MEMORY[0x1E0C97298]);
            objc_msgSend(MEMORY[0x1E0D67400], "requiredContactKeys");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (PKContactResolver *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C60]), "initWithContactStore:keysToFetch:", v29, v30);
            v32 = self->_contactResolver;
            self->_contactResolver = v31;

            contactResolver = self->_contactResolver;
          }
          v33 = contactResolver;
          -[PKContactResolver contactForHandle:](v33, "contactForHandle:", v27);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D67400], "redactedDisplayNameForCounterpartHandle:contact:", v27, v34);
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v35;
          if (v35)
            v37 = (void *)v35;
          else
            v37 = v27;
          v38 = v37;

          -[PKAppletSubcredentialSharingRequest setRecipientName:](v50, "setRecipientName:", v38);
          v39 = objc_alloc_init(MEMORY[0x1E0D66B90]);
          v40 = objc_alloc(MEMORY[0x1E0D66DD8]);
          v41 = MEMORY[0x1E0C80D38];
          v42 = MEMORY[0x1E0C80D38];
          v43 = (void *)objc_msgSend(v40, "initWithQueue:", v41);

          objc_initWeak(&location, self);
          *(_QWORD *)v69 = 0;
          v70 = v69;
          v71 = 0x3032000000;
          v72 = __Block_byref_object_copy__8;
          v73 = __Block_byref_object_dispose__8;
          v74 = 0;
          v44 = MEMORY[0x1E0C809B0];
          v64[0] = MEMORY[0x1E0C809B0];
          v64[1] = 3221225472;
          v64[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke;
          v64[3] = &unk_1E3E66DB0;
          v45 = v43;
          v65 = v45;
          v66 = buf;
          v67 = v69;
          objc_copyWeak(&v68, &location);
          objc_msgSend(v39, "addOperation:", v64);
          v60[0] = v44;
          v60[1] = 3221225472;
          v60[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_30;
          v60[3] = &unk_1E3E66DD8;
          v60[4] = self;
          v46 = v45;
          v61 = v46;
          v62 = v69;
          objc_copyWeak(&v63, &location);
          objc_msgSend(v39, "addOperation:", v60);
          v56[0] = v44;
          v56[1] = 3221225472;
          v56[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_33;
          v56[3] = &unk_1E3E66E00;
          v47 = v46;
          v57 = v47;
          v58 = buf;
          objc_copyWeak(&v59, &location);
          objc_msgSend(v39, "addOperation:", v56);
          v54[0] = v44;
          v54[1] = 3221225472;
          v54[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_35;
          v54[3] = &unk_1E3E66E50;
          objc_copyWeak(&v55, &location);
          objc_msgSend(v39, "addOperation:", v54);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = v44;
          v52[1] = 3221225472;
          v52[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_40;
          v52[3] = &unk_1E3E66078;
          v53 = v10;
          v49 = (id)objc_msgSend(v39, "evaluateWithInput:completion:", v48, v52);

          objc_destroyWeak(&v55);
          objc_destroyWeak(&v59);

          objc_destroyWeak(&v63);
          objc_destroyWeak(&v68);

          _Block_object_dispose(v69, 8);
          objc_destroyWeak(&location);

          goto LABEL_29;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v69 = 0;
          _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Error: Sharing Request Data is nil. Cannot send invitation", v69, 2u);
        }

      }
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }
LABEL_29:
    _Block_object_dispose(buf, 8);

    goto LABEL_30;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Car Key is not available in group conversations", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
  PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_RECIPIENT_INVALID_GROUP"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "showAlertWithTitle:message:button:", v13, 0, v14);
LABEL_12:

  (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
LABEL_30:

}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v12 = *MEMORY[0x1E0D6A588];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2;
  v15[3] = &unk_1E3E66D88;
  v18 = *(_QWORD *)(a1 + 48);
  objc_copyWeak(&v20, (id *)(a1 + 56));
  v19 = *(_QWORD *)(a1 + 40);
  v13 = v9;
  v17 = v13;
  v14 = v8;
  v16 = v14;
  objc_msgSend(v10, "reachableDestinationsForDestination:service:completion:", v11, v12, v15);

  objc_destroyWeak(&v20);
}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (a3 || !objc_msgSend(v6, "count"))
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Unable to find reachable destinations for recipient", v12, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    -[PKSharingMessageExtensionCarKeyPresenter _presentIDSAlert]((uint64_t)WeakRetained);

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
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 48), "recipientIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_RECIPIENT_INVALID_FORMAT"), CFSTR("%@"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "showAlertWithTitle:message:button:", 0, v3, v4);

  }
}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_30(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "credential");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "supportedRadioTechnologies");

  if (v11 == 2)
  {
    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v14 = *MEMORY[0x1E0D6A588];
    v15 = *MEMORY[0x1E0D6A590];
    v16 = *MEMORY[0x1E0D34B80];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_31;
    v17[3] = &unk_1E3E61968;
    objc_copyWeak(&v20, (id *)(a1 + 56));
    v19 = v9;
    v18 = v8;
    objc_msgSend(v12, "checkDeviceSupportForDestinations:service:listenerID:capability:completion:", v13, v14, v15, v16, v17);

    objc_destroyWeak(&v20);
  }
  else
  {
    (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v8, 0);
  }

}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_31(uint64_t a1, char a2)
{
  id *WeakRetained;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t v11[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Cannot send Car Key because the recipient device only supports NFC keys.", v11, 2u);
      }

      v6 = objc_loadWeakRetained(WeakRetained + 9);
      PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_CANNOT_SHARE_CARKEY"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_NOT_SUPPORTED_RECIPIENT"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "showAlertWithTitle:message:button:", v7, v8, v9);

      objc_msgSend(WeakRetained[3], "setStatus:", 9);
      v10 = objc_loadWeakRetained(WeakRetained + 9);
      objc_msgSend(v10, "messageDidUpdate");

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_33(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v12 = *MEMORY[0x1E0D34240];
  v13 = *MEMORY[0x1E0D6A590];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_34;
  v16[3] = &unk_1E3E61968;
  objc_copyWeak(&v19, (id *)(a1 + 48));
  v14 = v9;
  v18 = v14;
  v15 = v8;
  v17 = v15;
  objc_msgSend(v10, "checkIDSStatusForDestination:service:listenerID:completion:", v11, v12, v13, v16);

  objc_destroyWeak(&v19);
}

uint64_t __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_34(uint64_t a1, char a2)
{
  NSObject *v3;
  id WeakRetained;
  uint8_t v6[16];

  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Recipient doesn't support imessage", v6, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[PKSharingMessageExtensionCarKeyPresenter _presentIDSAlert]((uint64_t)WeakRetained);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_35(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id *WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v18 = v7;
    PKPaymentRequestFromSharingRequest();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D67670];
    v14 = objc_loadWeakRetained(WeakRetained + 9);
    objc_msgSend(v14, "presentationSceneIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_37;
    v22[3] = &unk_1E3E66E28;
    objc_copyWeak(&v23, v10);
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_3;
    v19[3] = &unk_1E3E61338;
    v21 = v9;
    v20 = v8;
    v17 = (id)objc_msgSend(v13, "authorizeForRequest:presentationSceneIdentifier:authHandler:completion:", v12, v15, v22, v19);

    objc_destroyWeak(&v23);
    v7 = v18;
  }

}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_37(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD *v19;
  id v20;
  id v21;
  id *val;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  val = (id *)objc_loadWeakRetained(v4);
  v7 = v6;
  v8 = v5;
  if (val)
  {
    objc_initWeak(&location, val);
    v9 = val[6];
    objc_msgSend(v9, "recipientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke;
    v23[3] = &unk_1E3E66F40;
    v11 = v9;
    v24 = v11;
    v25 = v7;
    objc_copyWeak(&v27, &location);
    v26 = v8;
    v12 = v10;
    v13 = v23;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "targetDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(val[6], "credential");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke;
    v29[3] = &unk_1E3E66FB8;
    v30 = v15;
    v31 = v14;
    v18 = v12;
    v32 = v18;
    v19 = v13;
    v33 = v19;
    v20 = v14;
    v21 = v15;
    objc_msgSend(v21, "paymentWebService:credentialWithIdentifier:completion:", v20, v17, v29);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

}

uint64_t __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_3(uint64_t a1, char a2)
{
  NSObject *v3;
  uint8_t v5[16];

  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Unable to authorize for share or unable to create share", v5, 2u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_40(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_msgSend(a4, "isCanceled");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didTapMessage
{
  BOOL v3;
  void *v4;
  id v5;
  _QWORD v6[6];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = -[PKSubcredentialInvitationMessage isFromMe](self->_message, "isFromMe");
  if (-[PKSubcredentialInvitationMessage status](self->_message, "status") - 4 >= 0xFFFFFFFFFFFFFFFDLL && !v3)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__8;
    v19 = __Block_byref_object_dispose__8;
    -[PKSubcredentialInvitationMessage phoneInvitation](self->_message, "phoneInvitation");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__8;
    v13 = __Block_byref_object_dispose__8;
    -[PKSubcredentialInvitationMessage watchInvitation](self->_message, "watchInvitation");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16[5], "partnerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PKSharingMessageExtensionCarKeyPresenter _attemptToOpenPhoneInvitation:watchInvitation:]((uint64_t)self, (void *)v16[5], (void *)v10[5]);
    }
    else
    {
      v5 = objc_alloc_init(MEMORY[0x1E0D672B0]);
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __57__PKSharingMessageExtensionCarKeyPresenter_didTapMessage__block_invoke;
      v6[3] = &unk_1E3E66EA0;
      objc_copyWeak(&v7, &location);
      v6[4] = &v15;
      v6[5] = &v9;
      objc_msgSend(v5, "subcredentialInvitationsWithCompletion:", v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);

    }
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
  }
}

- (void)_attemptToOpenPhoneInvitation:(void *)a3 watchInvitation:
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  __CFString *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v6, "addCarKeyPassConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 16), "canAddSecureElementPassWithConfiguration:", v7);
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9 && v8)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Open subcredential invitation with phoneInvitationIdentifier: %@", buf, 0xCu);
      }

      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v10;
          _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Open subcredential invitation with watchInvitationIdentifier: %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shoebox://%@/?%@=%@&%@=%@"), *MEMORY[0x1E0D69A18], *MEMORY[0x1E0D69A08], v9, *MEMORY[0x1E0D69A10], v10);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shoebox://%@/?%@=%@"), *MEMORY[0x1E0D69A18], *MEMORY[0x1E0D69A08], v9, v18, v19);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "openAppURL:", v16);
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412546;
        v21 = v9;
        v22 = 1024;
        v23 = v8;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Fail to open subcredential invitation with phoneInvitationIdentifier: %@, canOpen: %d", buf, 0x12u);
      }

      if (v10)
        v13 = CFSTR("CARKEY_NOT_SUPPORTED_BODY_TRY_WATCH");
      else
        v13 = CFSTR("CARKEY_NOT_SUPPORTED_BODY");
      PKLocalizedCredentialString(&v13->isa);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      PKLocalizedCredentialString(CFSTR("CARKEY_NOT_SUPPORTED_TITLE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "showAlertWithTitle:message:button:", v16, v14, v17);

    }
  }
}

void __57__PKSharingMessageExtensionCarKeyPresenter_didTapMessage__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__PKSharingMessageExtensionCarKeyPresenter_didTapMessage__block_invoke_2;
    v13[3] = &unk_1E3E66E78;
    v13[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "pk_anyObjectPassingTest:", v13);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __57__PKSharingMessageExtensionCarKeyPresenter_didTapMessage__block_invoke_3;
    v12[3] = &unk_1E3E66E78;
    v12[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "pk_anyObjectPassingTest:", v12);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    -[PKSharingMessageExtensionCarKeyPresenter _attemptToOpenPhoneInvitation:watchInvitation:]((uint64_t)WeakRetained, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }

}

uint64_t __57__PKSharingMessageExtensionCarKeyPresenter_didTapMessage__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = PKEqualObjects();
  return v6;
}

uint64_t __57__PKSharingMessageExtensionCarKeyPresenter_didTapMessage__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = PKEqualObjects();
  return v6;
}

void __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = objc_alloc_init(MEMORY[0x1E0D66C90]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke_2;
  v5[3] = &unk_1E3E66F18;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "sendSharingInvitationWithRequest:auth:completion:", v3, v4, v5);

  objc_destroyWeak(&v8);
}

void __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
  {
LABEL_10:
    (*((void (**)(void))a1[5] + 2))();
    goto LABEL_11;
  }
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v5 || v6)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Sharing failed with error: %@", buf, 0xCu);
    }

    goto LABEL_10;
  }
  if (v9)
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Sharing succeeded with share: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "credential");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke_58;
  v13[3] = &unk_1E3E66EF0;
  v13[4] = WeakRetained;
  v14 = v5;
  v15 = a1[5];
  objc_msgSend(v11, "paymentWebService:addPassShare:onCredential:withCompletion:", v10, v14, v12, v13);

LABEL_11:
}

void __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke_58(uint64_t a1, char a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  char v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke_2_59;
  v4[3] = &unk_1E3E66EC8;
  v7 = a2;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke_2_59(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id WeakRetained;
  void *v27;
  void *v28;
  uint64_t v30;
  NSObject *oslog;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[4];
  const char *v39;
  __int16 v40;
  void *v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 134217984;
    v43 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Added receipts to target device: %ld", buf, 0xCu);
  }
  oslog = v2;

  v4 = *(id **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  if (v4)
  {
    v30 = a1;
    objc_msgSend(v4[6], "credential");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pairedReaderIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4[6], "credential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "supportedRadioTechnologies");

    objc_msgSend(v4[6], "credential");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "brandIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4[6], "credential");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "partnerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v5;
    objc_msgSend(v5, "credentialShares");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "isForWatch");
          v20 = v4[3];
          if (v19)
          {
            objc_msgSend(v20, "watchInvitation");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setIdentifier:", v22);

            objc_msgSend(v13, "uuidIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setSharingSessionIdentifier:", v23);

            objc_msgSend(v21, "setPairedReaderIdentifier:", v33);
            objc_msgSend(v21, "setSupportedRadioTechnologies:", v8);
            objc_msgSend(v21, "setPartnerIdentifier:", v12);
            objc_msgSend(v21, "setBrandIdentifier:", v10);
            objc_msgSend(v4[3], "setWatchInvitation:", v21);
          }
          else
          {
            objc_msgSend(v20, "phoneInvitation");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setIdentifier:", v24);

            objc_msgSend(v13, "uuidIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setSharingSessionIdentifier:", v25);

            objc_msgSend(v21, "setPairedReaderIdentifier:", v33);
            objc_msgSend(v21, "setSupportedRadioTechnologies:", v8);
            objc_msgSend(v21, "setPartnerIdentifier:", v12);
            objc_msgSend(v21, "setBrandIdentifier:", v10);
            objc_msgSend(v4[3], "setPhoneInvitation:", v21);
          }

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
      }
      while (v15);
    }

    objc_msgSend(v4[3], "setStatus:", 2);
    objc_msgSend(v4[3], "setDataString:", 0);
    objc_msgSend(v4[3], "setUniqueIdentifier:", 0);
    WeakRetained = objc_loadWeakRetained(v4 + 9);
    objc_msgSend(WeakRetained, "messageDidUpdate");

    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4[3], "phoneInvitation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v38 = 136315394;
      v39 = "-[PKSharingMessageExtensionCarKeyPresenter _addShareToMessage:]";
      v40 = 2112;
      v41 = v27;
      _os_log_impl(&dword_19D178000, oslog, OS_LOG_TYPE_DEFAULT, "iMessage Extension: %s: phoneInvitationIdentifier: %@", v38, 0x16u);

    }
    a1 = v30;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4[3], "watchInvitation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v38 = 136315394;
      v39 = "-[PKSharingMessageExtensionCarKeyPresenter _addShareToMessage:]";
      v40 = 2112;
      v41 = v28;
      _os_log_impl(&dword_19D178000, oslog, OS_LOG_TYPE_DEFAULT, "iMessage Extension: %s: watchInvitationIdentifier: %@", v38, 0x16u);

    }
    v5 = v13;
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = a1[4];
  v5 = a1[5];
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke_2;
  v8[3] = &unk_1E3E66F90;
  v9 = a1[6];
  v10 = v3;
  v11 = a1[4];
  v12 = a1[5];
  v13 = a1[7];
  v7 = v3;
  objc_msgSend(v4, "paymentWebService:passSharesForCredentialIdentifier:completion:", v5, v6, v8);

}

void __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v3;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v6, "credentialShares");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v30 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
              objc_msgSend(v12, "channelTransportIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 32));

              if (v14)
                objc_msgSend(v4, "addObject:", v12);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
          }
          while (v9);
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v22);
  }

  if (objc_msgSend(v4, "count"))
  {
    v15 = objc_alloc_init(MEMORY[0x1E0D66C90]);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke_3;
    v23[3] = &unk_1E3E66F68;
    v16 = *(_QWORD *)(a1 + 40);
    v24 = *(id *)(a1 + 48);
    v25 = *(id *)(a1 + 56);
    v26 = v4;
    v27 = *(id *)(a1 + 40);
    v28 = *(id *)(a1 + 64);
    objc_msgSend(v15, "rescindInvitations:onCredential:withCompletion:", v26, v16, v23);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v38 = v18;
      _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "iMessage Extension: No outstanding invites found to recipient: %@", buf, 0xCu);
    }

    v19 = *(_QWORD *)(a1 + 64);
    if (v19)
      (*(void (**)(void))(v19 + 16))();
  }

}

void __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  NSObject *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Failed to rescind outstanding invites: %@", buf, 0xCu);
    }
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke_62;
    v9[3] = &unk_1E3E614F0;
    v10 = *(id *)(a1 + 64);
    objc_msgSend(v5, "paymentWebService:removeSharingInvitationReceipts:onCredential:withCompletion:", v6, v7, v8, v9);
    v4 = v10;
  }

}

uint64_t __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke_62(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Successfully rescinded all outstanding invites", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)propertiesForMessage:(id)a3
{
  id v3;
  PKSharingMessageExtensionViewProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = objc_alloc_init(PKSharingMessageExtensionViewProperties);
  objc_msgSend(v3, "phoneInvitation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "issuer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setLeftTitleText:](v4, "setLeftTitleText:", v6);

  objc_msgSend(v3, "phoneInvitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setRightTitleText:](v4, "setRightTitleText:", v8);

  PKLocalizedCredentialString(CFSTR("CAR_KEY_PASS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setTitle:](v4, "setTitle:", v9);

  PKLocalizedString(CFSTR("WALLET"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setSubtitle:](v4, "setSubtitle:", v10);

  -[PKSharingMessageExtensionViewProperties setFallbackCardImageName:](v4, "setFallbackCardImageName:", *MEMORY[0x1E0D6B9D0]);
  v11 = objc_msgSend(v3, "isFromMe");
  v12 = objc_msgSend(v3, "status");

  switch(v12)
  {
    case 0:
      v13 = CFSTR("SUBCREDENTIAL_MESSAGES_STATE_INVITATION_UNKNOWN");
      goto LABEL_12;
    case 1:
      PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_STATE_INVITATION_ACCEPTED"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharingMessageExtensionViewProperties setSubtitle:](v4, "setSubtitle:", v16);

      if ((v11 & 1) != 0)
        return v4;
      v15 = CFSTR("SUBCREDENTIAL_MESSAGES_TEXT_VIEW");
      goto LABEL_9;
    case 2:
    case 3:
    case 4:
    case 5:
      if (v11)
      {
        v13 = CFSTR("SUBCREDENTIAL_MESSAGES_STATE_INVITATION_PENDING");
LABEL_12:
        PKLocalizedCredentialString(&v13->isa);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSharingMessageExtensionViewProperties setSubtitle:](v4, "setSubtitle:", v17);
      }
      else
      {
        PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_STATE_INVITATION_WAITING"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSharingMessageExtensionViewProperties setSubtitle:](v4, "setSubtitle:", v14);

        v15 = CFSTR("SUBCREDENTIAL_MESSAGES_TEXT_ADD");
LABEL_9:
        PKLocalizedCredentialString(&v15->isa);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSharingMessageExtensionViewProperties setButtonText:](v4, "setButtonText:", v17);
      }

      return v4;
    case 6:
    case 7:
      v13 = CFSTR("SUBCREDENTIAL_MESSAGES_STATE_INVITATION_REVOKED");
      goto LABEL_12;
    case 8:
      v13 = CFSTR("SUBCREDENTIAL_MESSAGES_STATE_INVITATION_CANCELED");
      goto LABEL_12;
    case 9:
      v13 = CFSTR("SUBCREDENTIAL_MESSAGES_STATE_INVITATION_NOT_SUPPORTED");
      goto LABEL_12;
    default:
      return v4;
  }
}

- (void)setMessageFromShare:(id)a3 pass:(id)a4 completion:(id)a5
{
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  PKSharingMessageExtensionCarKeyPresenter *v38;
  _QWORD v39[5];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v37 = a5;
  v38 = self;
  targetDevice = self->_targetDevice;
  v9 = a4;
  v10 = a3;
  v36 = v9;
  objc_msgSend(v9, "uniqueID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceTargetDeviceProtocol entitlementsForPassIdentifier:](targetDevice, "entitlementsForPassIdentifier:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v12, "sharedEntitlements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "entitlementIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v17);
  }

  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v22 = v13;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v42 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v14, "containsObject:", v28);

        if (v29)
          objc_msgSend(v21, "addObject:", v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v24);
  }

  v30 = (void *)objc_msgSend(v21, "copy");
  v31 = objc_alloc(MEMORY[0x1E0D66AA8]);
  objc_msgSend(v36, "paymentPass");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)objc_msgSend(v31, "initWithPaymentPass:entitlements:", v32, v30);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __80__PKSharingMessageExtensionCarKeyPresenter_setMessageFromShare_pass_completion___block_invoke;
  v39[3] = &unk_1E3E66FE0;
  v39[4] = v38;
  v40 = v37;
  v34 = v37;
  +[PKSharingMessageExtensionMessageBuilder messageURLFromSharingRequest:completionHandler:](PKSharingMessageExtensionMessageBuilder, "messageURLFromSharingRequest:completionHandler:", v33, v39);

}

void __80__PKSharingMessageExtensionCarKeyPresenter_setMessageFromShare_pass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKSubcredentialInvitationMessage *v4;

  v3 = a2;
  v4 = -[PKSubcredentialInvitationMessage initWithURL:]([PKSubcredentialInvitationMessage alloc], "initWithURL:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setMessage:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

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
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_sharingRequest, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
  objc_storeStrong(&self->_authorizationCoordinatorHandler, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
}

@end
