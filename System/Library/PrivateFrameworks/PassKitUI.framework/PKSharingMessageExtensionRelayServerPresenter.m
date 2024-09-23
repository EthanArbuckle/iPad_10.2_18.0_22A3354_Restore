@implementation PKSharingMessageExtensionRelayServerPresenter

- (PKSharingMessageExtensionRelayServerPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4
{
  id v7;
  id v8;
  PKSharingMessageExtensionRelayServerPresenter *v9;
  PKSharingMessageExtensionRelayServerPresenter *v10;
  id v11;
  uint64_t v12;
  PKIDSIDQueryManager *idsManager;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKSharingMessageExtensionRelayServerPresenter;
  v9 = -[PKSharingMessageExtensionRelayServerPresenter init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetDevice, a3);
    objc_storeStrong((id *)&v10->_passLibrary, a4);
    v11 = objc_alloc(MEMORY[0x1E0D66DD8]);
    v12 = objc_msgSend(v11, "initWithQueue:", MEMORY[0x1E0C80D38]);
    idsManager = v10->_idsManager;
    v10->_idsManager = (PKIDSIDQueryManager *)v12;

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
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!-[PKSharingMessageExtensionCommonMessage isPending](self->_message, "isPending")
    && !-[PKSharingMessageExtensionCommonMessage isFromMe](self->_message, "isFromMe"))
  {
    -[PKSharingMessageExtensionRelayServerMessage phoneMailboxURL](self->_message, "phoneMailboxURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[PKSharingMessageExtensionRelayServerMessage provisioningCredentialHash](self->_message, "provisioningCredentialHash");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16
        && (-[PKPassLibraryDataProvider passForProvisioningCredentialHash:](self->_passLibrary, "passForProvisioningCredentialHash:", v16), v4 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "secureElementPass"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v4, v5))
      {
        -[PKSharingMessageExtensionRelayServerPresenter _setMessageStatusTo:pass:]((uint64_t)self, 1, v5);

      }
      else
      {
        -[PKSharingMessageExtensionRelayServerMessage carKeyReaderIdentifier](self->_message, "carKeyReaderIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          -[PKPassLibraryDataProvider paymentPasses](self->_passLibrary, "paymentPasses");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v8)
          {
            v9 = *(_QWORD *)v21;
            while (2)
            {
              for (i = 0; i != v8; ++i)
              {
                if (*(_QWORD *)v21 != v9)
                  objc_enumerationMutation(v7);
                v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
                objc_msgSend(v11, "pairedTerminalIdentifier");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "isEqualToString:", v6);

                if (v13)
                {
                  -[PKSharingMessageExtensionRelayServerPresenter _setMessageStatusTo:pass:]((uint64_t)self, 1, v11);

                  goto LABEL_20;
                }
              }
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
              if (v8)
                continue;
              break;
            }
          }

        }
        objc_initWeak(&location, self);
        targetDevice = self->_targetDevice;
        objc_msgSend(v3, "absoluteString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __68__PKSharingMessageExtensionRelayServerPresenter_extensionWillAppear__block_invoke;
        v17[3] = &unk_1E3E65F18;
        objc_copyWeak(&v18, &location);
        -[PKPaymentWebServiceTargetDeviceProtocol checkInvitationStatusForMailboxAddress:completion:](targetDevice, "checkInvitationStatusForMailboxAddress:completion:", v15, v17);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
LABEL_20:

      }
    }
    else
    {
      -[PKSharingMessageExtensionRelayServerPresenter _setMessageStatusTo:pass:]((uint64_t)self, 0, 0);
    }

  }
}

- (void)_setMessageStatusTo:(void *)a3 pass:
{
  id v5;
  void *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PKSharingMessageExtensionRelayServerPresenter__setMessageStatusTo_pass___block_invoke;
    block[3] = &unk_1E3E63480;
    v10 = a2;
    v8 = v5;
    v9 = a1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __68__PKSharingMessageExtensionRelayServerPresenter_extensionWillAppear__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (a2)
    v4 = 3;
  else
    v4 = 8;
  -[PKSharingMessageExtensionRelayServerPresenter _setMessageStatusTo:pass:]((uint64_t)WeakRetained, v4, 0);

}

- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  id WeakRetained;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  int v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  int v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  _QWORD *v58;
  uint8_t *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD *v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  _QWORD *v72;
  id v73;
  _QWORD v74[3];
  char v75;
  _QWORD v76[5];
  id v77;
  id v78;
  id v79;
  _QWORD *v80;
  _QWORD v81[5];
  id v82;
  id v83;
  _QWORD *v84;
  uint8_t buf[8];
  uint8_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  _QWORD v91[3];
  char v92;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
  {
    -[PKSharingMessageExtensionRelayServerMessage localProperties](self->_message, "localProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "partialInvite");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v8, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v17;
      if (PKIDSServiceContainsHandle())
      {
        PKLogFacilityTypeGetObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Sender address is the same as recipient!", buf, 2u);
        }

        objc_msgSend(v16, "pass");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isCarKeyPass");

        WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
        if (v20)
        {
          PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_CANNOT_SHARE_CARKEY"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_RECIPIENT_EQUAL_TO_SENDER"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
        }
        else
        {
          PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SEND_FAILURE_TO_SELF_TITLE"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_INVALID_RECIPIENT_SELF"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_OK_BUTTON"));
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "showAlertWithTitle:message:button:", v22, v23, v46);

        (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
      }
      else
      {
        v50 = v15;
        v51 = v9;
        v25 = (objc_class *)MEMORY[0x1E0C97298];
        v26 = v17;
        v27 = objc_alloc_init(v25);
        objc_msgSend(MEMORY[0x1E0D67400], "requiredContactKeys");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C60]), "initWithContactStore:keysToFetch:", v27, v28);
        objc_msgSend(v29, "contactForHandle:", v26);
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(MEMORY[0x1E0D67400], "redactedDisplayNameForCounterpartHandle:contact:", v26, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v30;
        objc_msgSend(v16, "setRecipientNickname:", v31);

        objc_msgSend(v16, "setRecipientHandle:", v26);
        v33 = objc_alloc_init(MEMORY[0x1E0D66B90]);
        PKShareAuthorizationPaymentRequest((PKPartialShareInvitation *)v16);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_loadWeakRetained((id *)&self->_renderer);
        objc_msgSend(v34, "presentationSceneIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(location, self);
        objc_msgSend(v16, "pass");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v35, "isCarKeyPass");
        v54 = v33;

        v36 = objc_msgSend(v16, "isHomeShare");
        v91[0] = 0;
        v91[1] = v91;
        v91[2] = 0x2020000000;
        v92 = 0;
        *(_QWORD *)buf = 0;
        v86 = buf;
        v87 = 0x3032000000;
        v88 = __Block_byref_object_copy__26;
        v89 = __Block_byref_object_dispose__26;
        v37 = MEMORY[0x1E0C809B0];
        v90 = 0;
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke;
        v81[3] = &unk_1E3E657A0;
        v81[4] = self;
        v38 = v26;
        v82 = v38;
        v39 = v16;
        v83 = v39;
        v84 = v91;
        objc_msgSend(v54, "addOperation:", v81);
        v76[0] = v37;
        v76[1] = 3221225472;
        v76[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_3;
        v76[3] = &unk_1E3E6D618;
        v76[4] = self;
        v77 = v38;
        v40 = v32;
        v78 = v40;
        v80 = v91;
        v41 = v39;
        v79 = v41;
        objc_msgSend(v54, "addOperation:", v76);
        v74[0] = 0;
        v74[1] = v74;
        v74[2] = 0x2020000000;
        v75 = 0;
        if (((v36 | v49 ^ 1) & 1) != 0)
        {
          v42 = v52;
          v43 = v54;
          if ((v36 & 1) != 0)
          {
            v61[0] = MEMORY[0x1E0C809B0];
            v61[1] = 3221225472;
            v61[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_11;
            v61[3] = &unk_1E3E65FB8;
            v44 = &v63;
            objc_copyWeak(&v63, location);
            v62 = v41;
            objc_msgSend(v54, "addOperation:", v61);
            v45 = v62;
          }
          else
          {
            v64[0] = MEMORY[0x1E0C809B0];
            v64[1] = 3221225472;
            v64[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_8;
            v64[3] = &unk_1E3E6D6B8;
            v66 = v74;
            v44 = &v67;
            objc_copyWeak(&v67, location);
            v65 = v41;
            objc_msgSend(v54, "addOperation:", v64);
            v45 = v65;
          }

          objc_destroyWeak(v44);
        }
        else
        {
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_5;
          v68[3] = &unk_1E3E6D690;
          v42 = v52;
          v69 = v52;
          v70 = v53;
          v72 = v74;
          objc_copyWeak(&v73, location);
          v71 = v41;
          v43 = v54;
          objc_msgSend(v54, "addOperation:", v68);

          objc_destroyWeak(&v73);
        }
        v15 = v50;
        v9 = v51;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_13;
        v56[3] = &unk_1E3E6D708;
        objc_copyWeak(&v60, location);
        v58 = v91;
        v59 = buf;
        v57 = v10;
        v48 = (id)objc_msgSend(v43, "evaluateWithInput:completion:", v47, v56);

        objc_destroyWeak(&v60);
        _Block_object_dispose(v74, 8);

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(v91, 8);
        objc_destroyWeak(location);

      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "iMessage Extension: ERROR missing invite!", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }

  }
  else
  {
    v11 = objc_loadWeakRetained((id *)&self->_renderer);
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SEND_FAILURE_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_INVALID_GROUP"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_OK_BUTTON"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "showAlertWithTitle:message:button:", v12, v13, v14);

    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[2];
  uint64_t (*v22)(_QWORD *, char);
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint8_t buf[8];
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  _QWORD *v31;

  v6 = a3;
  v7 = a4;
  v9 = a1[4];
  v8 = (void *)a1[5];
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v22 = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_2;
  v23 = &unk_1E3E699E0;
  v12 = (void *)a1[6];
  v11 = a1[7];
  v25 = v7;
  v26 = v11;
  v24 = v6;
  v13 = v6;
  v14 = v7;
  v15 = v8;
  v16 = v12;
  v17 = v21;
  if (v9)
  {
    if ((PKiMessageIsActive() & 1) != 0)
    {
      v18 = *(void **)(v9 + 32);
      v19 = *MEMORY[0x1E0D34240];
      *(_QWORD *)buf = v10;
      v28 = 3221225472;
      v29 = __115__PKSharingMessageExtensionRelayServerPresenter__checkIfMessageWillBeSentOverSMSToRecipient_invitation_completion___block_invoke;
      v30 = &unk_1E3E614F0;
      v31 = v17;
      objc_msgSend(v18, "checkIDSStatusForDestination:service:listenerID:completion:", v15, v19, CFSTR("ShareableCredentialsIDSStatusQueryListenerID"), buf);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "iMessage Extension: iMessage not active fror user.", buf, 2u);
      }

      v22(v17, 1);
    }
  }

}

uint64_t __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_2(_QWORD *a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], 0);
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id WeakRetained;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  char v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  id v50;
  NSString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  _QWORD v63[2];
  uint64_t (*v64)(uint64_t, uint64_t);
  void *v65;
  id v66;
  id v67;
  uint8_t buf[8];
  uint64_t v69;
  uint64_t (*v70)(uint64_t, int);
  void *v71;
  id v72;
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;

  v6 = a3;
  v7 = a4;
  v9 = a1[4];
  v8 = (void *)a1[5];
  v10 = *(unsigned __int8 *)(*(_QWORD *)(a1[8] + 8) + 24);
  v12 = a1[6];
  v11 = (void *)a1[7];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v64 = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_4;
  v65 = &unk_1E3E61338;
  v66 = v6;
  v67 = v7;
  v60 = v6;
  v59 = v7;
  v62 = v8;
  v13 = v11;
  v14 = v63;
  v15 = v14;
  if (v9)
  {
    v61 = v14;
    objc_msgSend(v13, "share");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pass");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0D67688]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)v17;
    v20 = (void *)objc_msgSend(v18, "initWithPass:webService:paymentServiceProvider:queue:", v17, v19, 0, MEMORY[0x1E0C80D38]);

    if (v10)
      v21 = CFSTR("com.apple.SMS");
    else
      v21 = CFSTR("com.apple.UIKit.activity.Message");
    v58 = v20;
    objc_msgSend(v20, "shareInitiationActivationConfigurationForChannelBundleIdentifier:isRecipientKnownContact:", v21, v12 != 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activationOptions");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "defaultOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isBlocked"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(v9 + 40));
      if (v12 || v10)
      {
        PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SECURITY_CHANNEL_BLOCKED_SMS_TITLE"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SECURITY_CHANNEL_BLOCKED_SMS_BODY"), CFSTR("%@"), v62);
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SECURITY_CHANNEL_BLOCKED_TITLE"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SECURITY_CHANNEL_BLOCKED_BODY"));
        v27 = objc_claimAutoreleasedReturnValue();
      }
      v34 = (void *)v27;
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_OK_BUTTON"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "showAlertWithTitle:message:button:", v26, v34, v35);

      v15 = v61;
      v64((uint64_t)v61, 1);
      goto LABEL_16;
    }
    if (v24)
    {
      v28 = (void *)v23;
      if (v23)
        goto LABEL_11;
      v39 = objc_msgSend(v22, "allowUserEdit");
      PKLogFacilityTypeGetObject();
      v40 = objc_claimAutoreleasedReturnValue();
      v38 = v40;
      if ((v39 & 1) == 0)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v38, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Activation options required for SMS/iMessage share, adding them.", buf, 2u);
        }

        objc_msgSend(v16, "setActivationOptions:", v24);
        v15 = v61;
        v64((uint64_t)v61, 0);
        v36 = v57;
        goto LABEL_17;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v38, OS_LOG_TYPE_DEFAULT, "iMessage Extension: No activation options required SMS/iMessage.", buf, 2u);
      }

      if (v12)
      {
        v15 = v61;
        v64((uint64_t)v61, 0);
LABEL_16:
        v36 = v57;
        v28 = (void *)v23;
LABEL_17:
        v37 = v58;
LABEL_30:

        goto LABEL_31;
      }
      v50 = objc_loadWeakRetained((id *)(v9 + 40));
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SECURITY_CHANNEL_UNKNOWN_RECIPIENT_WARNING_TITLE"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SECURITY_CHANNEL_UNKNOWN_RECIPIENT_WARNING_BODY"), CFSTR("%@"), v62);
      v55 = v16;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_UPGRADE_SECURITY_BODY_CONTINUE_BUTTON"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SECURITY_CHANNEL_UNKNOWN_RECIPIENT_WARNING_CANCEL_BUTTON"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __161__PKSharingMessageExtensionRelayServerPresenter__checkIfMessageRequiresSecurityUpgradeToRecipient_isRecipientKnownContact_willSendOverSMS_invitation_completion___block_invoke;
      v75[3] = &unk_1E3E614F0;
      v76 = v61;
      objc_msgSend(v50, "showAlertWithTitle:message:button:destructiveButton:completion:", v53, v41, v42, v43, v75);

      v24 = 0;
      v16 = v55;

      v28 = (void *)v23;
      if (v23)
      {
LABEL_11:
        objc_msgSend(v28, "identifiers");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifiers");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = PKEqualObjects();

        if (v31)
        {
          PKLogFacilityTypeGetObject();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v33 = "iMessage Extension: Activation options for SMS/iMessage are same as what was configured.";
LABEL_28:
            _os_log_impl(&dword_19D178000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 2u);
          }
        }
        else
        {
          objc_msgSend(v16, "setActivationOptions:", v24);
          PKLogFacilityTypeGetObject();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v33 = "iMessage Extension: Activation options for SMS/iMessage are different then what was configured, switching.";
            goto LABEL_28;
          }
        }
        v36 = v57;
        v37 = v58;

        v15 = v61;
        v64((uint64_t)v61, 0);
        goto LABEL_30;
      }
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v38, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Prompting user to upgrade security for SMS/iMessage", buf, 2u);
    }

    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v69 = 3221225472;
    v70 = __161__PKSharingMessageExtensionRelayServerPresenter__checkIfMessageRequiresSecurityUpgradeToRecipient_isRecipientKnownContact_willSendOverSMS_invitation_completion___block_invoke_76;
    v71 = &unk_1E3E66EF0;
    v72 = v16;
    v73 = v24;
    v74 = v61;
    v54 = _Block_copy(buf);
    v56 = objc_loadWeakRetained((id *)(v9 + 40));
    if (v10)
    {
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_UPGRADE_SECURITY_SMS_TITLE"));
      v44 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pass");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizationKeyForPassType();
      v51 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(v51);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_UPGRADE_SECURITY_SMS_BODY_INCREASE_SECURITY_BUTTON"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("SHAREABLE_MESSAGES_UPGRADE_SECURITY_SMS_BODY_PROCEED_ANYWAY_BUTTON");
    }
    else
    {
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_UPGRADE_SECURITY_TITLE"));
      v44 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pass");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizationKeyForPassType();
      v51 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(v51);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_UPGRADE_SECURITY_BODY_CONTINUE_BUTTON"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("SHAREABLE_MESSAGES_UPGRADE_SECURITY_BODY_DOWNGRADE_SECURITY_BUTTON");
    }
    PKLocalizedShareableCredentialString(&v47->isa);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)v44;
    objc_msgSend(v56, "showAlertWithTitle:message:button:destructiveButton:completion:", v44, v45, v46, v48, v54);
    v36 = v57;

    v15 = v61;
    goto LABEL_17;
  }
LABEL_31:

}

uint64_t __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
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
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0D67670];
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_6;
  v22[3] = &unk_1E3E6D640;
  v24 = *(_QWORD *)(a1 + 56);
  objc_copyWeak(&v25, (id *)(a1 + 64));
  v23 = *(id *)(a1 + 48);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_7;
  v17[3] = &unk_1E3E6D668;
  objc_copyWeak(&v21, (id *)(a1 + 64));
  v20 = *(_QWORD *)(a1 + 56);
  v14 = v9;
  v19 = v14;
  v15 = v8;
  v18 = v15;
  v16 = (id)objc_msgSend(v10, "authorizeForRequest:presentationSceneIdentifier:authHandler:completion:", v11, v12, v22, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v25);

}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  _QWORD *WeakRetained;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v5 = (id *)(a1 + 48);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  -[PKSharingMessageExtensionRelayServerPresenter _createShareFromInvite:externalizedAuth:completion:](WeakRetained, *(void **)(a1 + 32), v7, v6);

}

- (void)_createShareFromInvite:(void *)a3 externalizedAuth:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v10 = (void *)a1[1];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __100__PKSharingMessageExtensionRelayServerPresenter__createShareFromInvite_externalizedAuth_completion___block_invoke;
    v11[3] = &unk_1E3E6D730;
    objc_copyWeak(&v13, &location);
    v12 = v9;
    objc_msgSend(v10, "createShareForPartialShareInvitation:authorization:completion:", v7, v8, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

uint64_t __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  -[PKSharingMessageExtensionRelayServerPresenter _reportAuthenticationEventWithSuccess:]((uint64_t)WeakRetained, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_reportAuthenticationEventWithSuccess:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  PKShareInitiationAnalyticsReporter *v6;
  void *v7;
  PKShareInitiationAnalyticsReporter *v8;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 24), "localProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "partialInvite");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "analyticsSessionToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = [PKShareInitiationAnalyticsReporter alloc];
      objc_msgSend(v4, "pass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PKShareInitiationAnalyticsReporter initWithPass:sessionToken:](v6, "initWithPass:sessionToken:", v7, v5);

    }
    else
    {
      v8 = 0;
    }

    -[PKShareInitiationAnalyticsReporter sendAuthenticationEventForSuccess:specifics:](v8, "sendAuthenticationEventForSuccess:specifics:", a2, 0);
  }
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
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
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0D67670];
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_9;
  v19[3] = &unk_1E3E6D640;
  v21 = *(_QWORD *)(a1 + 40);
  objc_copyWeak(&v22, (id *)(a1 + 48));
  v20 = *(id *)(a1 + 32);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_10;
  v14[3] = &unk_1E3E6D668;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  v17 = *(_QWORD *)(a1 + 40);
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  objc_msgSend(v10, "authorizeDeviceOwnerWithAuthHandler:completion:", v19, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);

}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  _QWORD *WeakRetained;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v5 = (id *)(a1 + 48);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  -[PKSharingMessageExtensionRelayServerPresenter _createShareFromInvite:externalizedAuth:completion:](WeakRetained, *(void **)(a1 + 32), v7, v6);

}

uint64_t __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_10(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  -[PKSharingMessageExtensionRelayServerPresenter _reportAuthenticationEventWithSuccess:]((uint64_t)WeakRetained, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_11(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  _QWORD *WeakRetained;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_12;
  v12[3] = &unk_1E3E61338;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  -[PKSharingMessageExtensionRelayServerPresenter _createShareFromInvite:externalizedAuth:completion:](WeakRetained, v9, 0, v12);

}

uint64_t __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_12(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2 ^ 1u);
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  uint64_t v12;
  id v13;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_14;
  block[3] = &unk_1E3E6D6E0;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  v12 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v8 = *(_OWORD *)(a1 + 32);
  v6 = (id)v8;
  v11 = v8;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_14(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t v12[16];
  uint8_t buf[16];
  uint8_t v14[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      PKLogFacilityTypeGetObject();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Recipient doesn't support imessage so sending raw share url.", buf, 2u);
      }

      objc_msgSend(WeakRetained[3], "phoneMailboxURL");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
    v7 = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v7)
    {
      if (!v8)
        goto LABEL_17;
    }
    else if (!v8)
    {
LABEL_16:
      objc_msgSend(WeakRetained[3], "setLocalProperties:", 0);
      v11 = objc_loadWeakRetained(WeakRetained + 5);
      objc_msgSend(v11, "messageDidUpdate");

LABEL_17:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_18;
    }
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Using override url", v12, 2u);
    }

    objc_msgSend(WeakRetained[3], "setOverrideURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    goto LABEL_16;
  }
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "iMessage Extension: presenter deallocated", v14, 2u);
  }

LABEL_18:
}

void __100__PKSharingMessageExtensionRelayServerPresenter__createShareFromInvite_externalizedAuth_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__PKSharingMessageExtensionRelayServerPresenter__createShareFromInvite_externalizedAuth_completion___block_invoke_2;
  v9[3] = &unk_1E3E689E0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __100__PKSharingMessageExtensionRelayServerPresenter__createShareFromInvite_externalizedAuth_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSError *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3 && !*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v3, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "absoluteString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PKSharingLoggableMailboxAddress();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v14;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "iMessage Extension: using share url: %{public}@", buf, 0xCu);

      }
      v15 = WeakRetained[3];
      v23 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMailboxURLS:", v16);

      v17 = WeakRetained[3];
      objc_msgSend(*(id *)(a1 + 32), "expectedProvisioningCredentialHash");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setProvisioningCredentialHash:", v18);

      v19 = WeakRetained[3];
      objc_msgSend(*(id *)(a1 + 32), "expectedPairedReaderIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCarKeyReaderIdentifier:", v20);

      v21 = WeakRetained[3];
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_EXTENSION_BUTTON_TEXT_ADD"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setButtonTitle:", v22);

      objc_msgSend(WeakRetained[3], "setActionURL:", v6);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v25 = v5;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Unable to create share with error %@", buf, 0xCu);
      }

      PKSharingDisplayableError(*(NSError **)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pkSharingError:", 7);
        v7 = (NSError *)objc_claimAutoreleasedReturnValue();
        PKSharingDisplayableError(v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v8 = objc_loadWeakRetained(WeakRetained + 5);
      PKTitleForDisplayableError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1A1AE46BC](v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_OK_BUTTON"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "showAlertWithTitle:message:button:", v9, v10, v11);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)didTapMessage
{
  unint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id WeakRetained;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!-[PKSharingMessageExtensionCommonMessage isPending](self->_message, "isPending")
    && !-[PKSharingMessageExtensionCommonMessage isFromMe](self->_message, "isFromMe"))
  {
    v3 = -[PKSharingMessageExtensionRelayServerMessage status](self->_message, "status");
    -[PKSharingMessageExtensionRelayServerMessage localProperties](self->_message, "localProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passUniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (PKShareStatusIsPending())
    {
      -[PKSharingMessageExtensionRelayServerMessage phoneMailboxURL](self->_message, "phoneMailboxURL");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
LABEL_21:

LABEL_22:
        return;
      }
      v8 = (objc_class *)MEMORY[0x1E0CB3998];
      v9 = v6;
      v10 = (void *)objc_msgSend([v8 alloc], "initWithURL:resolvingAgainstBaseURL:", v9, 0);

      objc_msgSend(v10, "queryItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "pk_containsObjectPassingTest:", &__block_literal_global_105);

      if (!v12)
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v9, 0);
        objc_msgSend(v22, "queryItems");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v23, "mutableCopy");
        v25 = v24;
        if (v24)
          v26 = v24;
        else
          v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v29 = v26;

        v30 = objc_alloc(MEMORY[0x1E0CB39D8]);
        v31 = (void *)objc_msgSend(v30, "initWithName:value:", *MEMORY[0x1E0D6BB60], *MEMORY[0x1E0D69538]);
        objc_msgSend(v29, "addObject:", v31);

        objc_msgSend(v22, "setQueryItems:", v29);
        WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
        objc_msgSend(v22, "URL");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "openAppURL:", v33);

        goto LABEL_21;
      }
      if (PKPassbookIsCurrentlyAvailable())
      {
        v13 = objc_alloc(MEMORY[0x1E0C99E98]);
        v14 = (void *)MEMORY[0x1E0CB3940];
        -[NSObject absoluteString](v9, "absoluteString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("com.apple.Home-private://sharing/%@"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v13, "initWithString:", v16);

        v18 = objc_loadWeakRetained((id *)&self->_renderer);
        objc_msgSend(v18, "openAppURL:", v17);

        goto LABEL_21;
      }
      PKLogFacilityTypeGetObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject absoluteString](v9, "absoluteString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        PKSharingLoggableMailboxAddress();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v28;
        _os_log_impl(&dword_19D178000, v21, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Silently failing to present Home URL (%@) as passbook is not available.", buf, 0xCu);

      }
    }
    else
    {
      if (v3 != 1 || !v5)
        goto LABEL_22;
      if (!PKPassbookIsCurrentlyAvailable())
      {
        PKLogFacilityTypeGetObject();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v5;
          _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Silently failing to present Wallet URL for %@ as passbook is not available.", buf, 0xCu);
        }
        goto LABEL_21;
      }
      v19 = objc_alloc(MEMORY[0x1E0C99E98]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wallet://%@/%@"), *MEMORY[0x1E0D6BC10], v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v19, "initWithString:", v20);

      v21 = objc_loadWeakRetained((id *)&self->_renderer);
      -[NSObject openAppURL:](v21, "openAppURL:", v7);
    }

    goto LABEL_21;
  }
}

uint64_t __70__PKSharingMessageExtensionRelayServerPresenter__isMailboxURLForHome___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKEqualObjects())
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = PKEqualObjects();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __115__PKSharingMessageExtensionRelayServerPresenter__checkIfMessageWillBeSentOverSMSToRecipient_invitation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __161__PKSharingMessageExtensionRelayServerPresenter__checkIfMessageRequiresSecurityUpgradeToRecipient_isRecipientKnownContact_willSendOverSMS_invitation_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint8_t v5[16];

  if (a2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "User opted to not send to unknown contact", v5, 2u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __161__PKSharingMessageExtensionRelayServerPresenter__checkIfMessageRequiresSecurityUpgradeToRecipient_isRecipientKnownContact_willSendOverSMS_invitation_completion___block_invoke_76(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("Y");
    if (a2)
      v5 = CFSTR("N");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Upgrading security for SMS/iMessage: %@", (uint8_t *)&v7, 0xCu);
  }

  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setActivationOptions:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (id)propertiesForMessage:(id)a3
{
  id v3;
  PKSharingMessageExtensionViewProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init(PKSharingMessageExtensionViewProperties);
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setTitle:](v4, "setTitle:", v5);

  objc_msgSend(v3, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setSubtitle:](v4, "setSubtitle:", v6);

  objc_msgSend(v3, "thumbnail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setCardImage:](v4, "setCardImage:", v7);

  v8 = objc_msgSend(v3, "isFromMe");
  objc_msgSend(v3, "localProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "status");

  if ((unint64_t)(v10 - 2) >= 2)
  {
    if (v10 == 1)
    {
      v11 = CFSTR("SHAREABLE_MESSAGES_EXTENSION_BUTTON_TEXT_VIEW");
      goto LABEL_7;
    }
  }
  else if ((v8 & 1) == 0 && objc_msgSend(v9, "hasCheckedStatus"))
  {
    v11 = CFSTR("SHAREABLE_MESSAGES_EXTENSION_BUTTON_TEXT_ADD");
LABEL_7:
    PKLocalizedShareableCredentialString(&v11->isa);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharingMessageExtensionViewProperties setButtonText:](v4, "setButtonText:", v12);

  }
  return v4;
}

void __74__PKSharingMessageExtensionRelayServerPresenter__setMessageStatusTo_pass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKSharingMessageExtensionRelayServerLocalProperties *v7;
  PKSharingMessageExtensionRelayServerLocalProperties *v8;
  void *v9;
  id WeakRetained;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    PKShareStatusToString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Updating message status to %@ for pass %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setStatus:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "localProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(PKSharingMessageExtensionRelayServerLocalProperties);
  v8 = v7;

  -[PKSharingMessageExtensionRelayServerLocalProperties setHasCheckedStatus:](v8, "setHasCheckedStatus:", 1);
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionRelayServerLocalProperties setPassUniqueIdentifier:](v8, "setPassUniqueIdentifier:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setLocalProperties:", v8);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(WeakRetained, "messageDidUpdate");

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
  objc_storeStrong((id *)&self->_idsManager, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
}

@end
