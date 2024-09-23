@implementation PKSubcredentialInvitationFlowController

- (PKSubcredentialInvitationFlowController)initWithDelegate:(id)a3
{
  id v4;
  PKSubcredentialInvitationFlowController *v5;
  PKSubcredentialInvitationFlowController *v6;

  v4 = a3;
  v5 = -[PKSubcredentialInvitationFlowController init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)nextViewControllerFromProvisioningOperation:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  PKSubcredentialInvitationActivationViewController *v15;
  void *v16;
  PKSubcredentialInvitationActivationViewController *v17;
  PKSubcredentialInvitationAcceptedViewController *v18;
  PKSubcredentialInvitationAcceptedViewController *v19;
  id v20;

  v20 = a3;
  v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    objc_msgSend(v20, "provisioningContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "provisionedPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v20, "operation");
    switch(v9)
    {
      case 2:
        goto LABEL_15;
      case 1:
LABEL_12:
        if (v8)
        {
          v18 = [PKSubcredentialInvitationAcceptedViewController alloc];
          objc_msgSend(v20, "provisioningContext");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[PKSubcredentialInvitationAcceptedViewController initWithFlowController:context:](v18, "initWithFlowController:context:", self, v12);
          v6[2](v6, v19);

          goto LABEL_14;
        }
LABEL_15:
        v6[2](v6, 0);
        break;
      case 0:
        objc_msgSend(v20, "provisioningContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localDeviceInvitation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "originalInvitationMessage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "activationOptions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "containsOptionOfType:", 3) & 1) != 0)
        {
          v14 = 0;
          if (!v8)
            goto LABEL_11;
        }
        else
        {
          v14 = objc_msgSend(v13, "containsOptionOfType:", 2) ^ 1;
          if (!v8)
          {
LABEL_11:

            goto LABEL_12;
          }
        }
        if (!v14)
        {
          v15 = [PKSubcredentialInvitationActivationViewController alloc];
          objc_msgSend(v20, "provisioningContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[PKSubcredentialInvitationActivationViewController initWithFlowController:context:](v15, "initWithFlowController:context:", self, v16);
          v6[2](v6, v17);

LABEL_14:
          break;
        }
        goto LABEL_11;
    }
  }

}

- (void)provisioningFinishedWithOperation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKSubcredentialInvitationFlowController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__PKSubcredentialInvitationFlowController_provisioningFinishedWithOperation___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PKSubcredentialInvitationFlowController _handOffToFlowManagerFromOperation:completion:](self, "_handOffToFlowManagerFromOperation:completion:", v5, v6);

}

void __77__PKSubcredentialInvitationFlowController_provisioningFinishedWithOperation___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "provisioningContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "operation");
    v9 = 134217984;
    v10 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Provisioning was finished on operation: %ld", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "provisionedPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "subcredentialProvisioningFlowController:didFinishWithPass:error:", v6, v7, v8);

}

- (void)provisioningWasCanceledWithOperation:(id)a3
{
  NSObject *v5;
  id WeakRetained;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = objc_msgSend(a3, "operation");
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Provisioning was cancelled on operation: %ld", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userCanceledPairingWithSubcredentialProvisioningFlowController:", self);

}

- (void)_handOffToFlowManagerFromOperation:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "provisioningContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  objc_msgSend(v7, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKHeadUnitPairingFlowBridge startHeadUnitPairingFlowWithContext:navController:provisioningController:completion:](PKHeadUnitPairingFlowBridge, "startHeadUnitPairingFlowWithContext:navController:provisioningController:completion:", v9, v8, 0, v5);

}

- (id)localDeviceProvisioningViewModelForOperation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PKSubcredentialProvisioningViewModel *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "provisioningContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localDeviceInvitation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKSubcredentialProvisioningViewModel initWithDelegate:]([PKSubcredentialProvisioningViewModel alloc], "initWithDelegate:", v3);
  v7 = objc_msgSend(v5, "type") != 1;
  -[PKSubcredentialProvisioningViewModel provisioningController](v6, "provisioningController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingSessionWithDelegate:startSession:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0D676E0]);
  v11 = objc_msgSend(v4, "acceptRemoteDeviceInvitation") ^ 1;
  objc_msgSend(v4, "localDeviceWebService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteDeviceWebService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithSession:invitation:metadata:declineRelatedInvitations:localDeviceWebService:remoteDeviceWebService:", v9, v5, 0, v11, v12, v13);

  -[PKSubcredentialProvisioningViewModel setConfig:](v6, "setConfig:", v14);
  return v6;
}

- (id)remoteDeviceProvisioningViewModelForOperation:(id)a3
{
  id v3;
  void *v4;
  PKSubcredentialProvisioningViewModel *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "provisioningContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKSubcredentialProvisioningViewModel initWithDelegate:]([PKSubcredentialProvisioningViewModel alloc], "initWithDelegate:", v3);

  v6 = objc_alloc(MEMORY[0x1E0D676E8]);
  objc_msgSend(v4, "remoteDeviceInvitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "acceptLocalDeviceInvitation") ^ 1;
  objc_msgSend(v4, "localDeviceWebService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteDeviceWebService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithInvitation:canRequestInvitation:declineRelatedInvitations:localDeviceWebService:remoteDeviceWebService:", v7, 0, v8, v9, v10);

  -[PKSubcredentialProvisioningViewModel setConfig:](v5, "setConfig:", v11);
  return v5;
}

- (id)alertForOperation:(id)a3 withError:(id)a4 retryHandler:(id)a5 cancelationHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSError *v45;
  int v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  const __CFString *v61;
  const __CFString *v62;
  uint64_t v63;
  __CFString *v64;
  uint64_t v65;
  uint64_t v66;
  __CFString *v67;
  uint64_t v68;
  uint64_t v69;
  NSString *p_isa;
  PKSubcredentialInvitationFlowController *v71;
  void *v72;
  void *v73;
  NSError *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  NSObject *v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  BOOL v85;
  uint8_t buf[4];
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    objc_msgSend(v10, "provisioningContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "provisionedPass");
    v15 = objc_claimAutoreleasedReturnValue();

    -[NSObject domain](v11, "domain");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v78, "isEqualToString:", *MEMORY[0x1E0D6B9E8]))
    {
      PKLogFacilityTypeGetObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v78;
        _os_log_impl(&dword_19D178000, v21, OS_LOG_TYPE_DEFAULT, "Unexpected domain to create alert from: %@", buf, 0xCu);
      }

      v22 = 0;
      v20 = 0;
      v79 = 0;
      v80 = 0;
      goto LABEL_12;
    }
    v75 = v12;
    -[NSObject userInfo](v11, "userInfo");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v74 = (NSError *)objc_claimAutoreleasedReturnValue();
    -[NSError domain](v74, "domain");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[NSError code](v74, "code");
    v85 = 0;
    PKSharingDisplayableError(v74, &v85);
    v17 = objc_claimAutoreleasedReturnValue();
    v72 = (void *)v17;
    if (v17)
    {
      v18 = v17;
      PKTitleForDisplayableError();
      v19 = objc_claimAutoreleasedReturnValue();
      MEMORY[0x1A1AE46BC](v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (void *)v19;
      if (v85)
      {
        PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
        v79 = objc_claimAutoreleasedReturnValue();
        v80 = 0;
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("TRY_AGAIN_BUTTON_TITLE"));
        v79 = 0;
        v80 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v79 = 0;
      v80 = 0;
      v20 = 0;
      v77 = 0;
    }
    v42 = v76;
    LODWORD(v43) = objc_msgSend(v76, "isEqualToString:", *MEMORY[0x1E0D69DC8]);
    v71 = self;
    if ((_DWORD)v43)
    {
      -[PKSubcredentialInvitationFlowController localizedIssuerNameForProvisioningOperation:](self, "localizedIssuerNameForProvisioningOperation:", v10);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v74;
      PKAlertForSubcredentialDisplayableErrorWithCancelHandler(v74, v44, v13);
      v15 = objc_claimAutoreleasedReturnValue();

      v46 = 1;
      goto LABEL_52;
    }
    if (objc_msgSend(v76, "isEqualToString:", *MEMORY[0x1E0CB32E8]) && (v16 == -1001 || v16 == -1009))
    {
      PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_CONNECTIVITY_BODY"));
      v48 = objc_claimAutoreleasedReturnValue();

      if (v12)
        PKLocalizedString(CFSTR("CANCEL_BUTTON_TITLE"));
      else
        PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
      v54 = objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("TRY_AGAIN_BUTTON_TITLE"));
      v50 = v80;
      v79 = v54;
      v80 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v48;
      self = v71;
    }
    else
    {
      if ((objc_msgSend(v76, "isEqualToString:", *MEMORY[0x1E0D6BCB8]) & 1) == 0
        && !objc_msgSend(v76, "isEqualToString:", *MEMORY[0x1E0D6B0B8]))
      {
        PKSubcredentialProvisioningDisplayableDAError();
        v51 = objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          v52 = (void *)v51;
          PKLogFacilityTypeGetObject();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v87 = v52;
            _os_log_impl(&dword_19D178000, v53, OS_LOG_TYPE_DEFAULT, "Will display DA error: %@", buf, 0xCu);
          }

          v50 = v52;
          v11 = v50;
        }
        else
        {
          v50 = 0;
        }
        v47 = v77;
        goto LABEL_43;
      }
      -[NSError localizedFailureReason](v74, "localizedFailureReason");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSError localizedRecoverySuggestion](v74, "localizedRecoverySuggestion");
      v49 = objc_claimAutoreleasedReturnValue();

      PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
      v50 = v79;
      v79 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v49;
    }
    LOBYTE(v43) = 0;
LABEL_43:

    v42 = v76;
    v77 = v47;
    if (!v47 || !v20)
    {
      switch(-[NSObject code](v11, "code"))
      {
        case 0:
        case 1:
        case 16:
        case 24:
        case 25:
          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
          v15 = objc_claimAutoreleasedReturnValue();

          -[PKSubcredentialInvitationFlowController localizedIssuerNameForProvisioningOperation:](self, "localizedIssuerNameForProvisioningOperation:", v10);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCredentialString(CFSTR("CARKEY_FAILED_ADDING_KEY"), CFSTR("%@"), v56);
          v43 = objc_claimAutoreleasedReturnValue();

          PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
          v57 = objc_claimAutoreleasedReturnValue();

          v46 = 1;
          v79 = v57;
          v42 = v76;
          v20 = (void *)v43;
          LOBYTE(v43) = 0;
          goto LABEL_79;
        case 2:
        case 3:
        case 4:
        case 6:
        case 10:
        case 14:
        case 17:
        case 18:
          PKLogFacilityTypeGetObject();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            goto LABEL_49;
          *(_WORD *)buf = 0;
          goto LABEL_48;
        case 5:
        case 7:
        case 8:
        case 9:
          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
          v58 = objc_claimAutoreleasedReturnValue();

          -[PKSubcredentialInvitationFlowController localizedIssuerNameForProvisioningOperation:](self, "localizedIssuerNameForProvisioningOperation:", v10);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCredentialString(CFSTR("CARKEY_FAILED_ADDING_KEY_CAN_RETRY"), CFSTR("%@"), v59);
          v15 = objc_claimAutoreleasedReturnValue();

          if (v75)
            PKLocalizedString(CFSTR("CANCEL_BUTTON_TITLE"));
          else
            PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
          v43 = objc_claimAutoreleasedReturnValue();

          PKLocalizedPaymentString(CFSTR("TRY_AGAIN_BUTTON_TITLE"));
          v63 = objc_claimAutoreleasedReturnValue();

          v46 = 1;
          v79 = v43;
          v80 = v63;
          v20 = v15;
          v77 = (void *)v58;
          v45 = v74;
          v42 = v76;
          LOBYTE(v43) = 0;
          goto LABEL_52;
        case 11:
          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
          v60 = objc_claimAutoreleasedReturnValue();

          v61 = CFSTR("CARKEY_KEY_ALREADY_EXISTIS_BODY_WATCH");
          v62 = CFSTR("CARKEY_KEY_ALREADY_EXISTIS_BODY");
          goto LABEL_82;
        case 12:
        case 15:
          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
          v60 = objc_claimAutoreleasedReturnValue();

          v61 = CFSTR("CARKEY_INVITATION_NEEDS_RESEND_WATCH");
          v62 = CFSTR("CARKEY_INVITATION_EXPIRED");
          goto LABEL_82;
        case 13:
          if (v15)
          {
            PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
            v15 = objc_claimAutoreleasedReturnValue();

            v64 = CFSTR("CARKEY_INVITATION_NEEDS_RESEND_WATCH");
LABEL_78:
            PKLocalizedCredentialString(&v64->isa);
            v69 = objc_claimAutoreleasedReturnValue();

            PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
            v43 = objc_claimAutoreleasedReturnValue();

            v46 = 1;
            v79 = v43;
            LOBYTE(v43) = 0;
            v20 = (void *)v69;
            v42 = v76;
LABEL_79:
            v77 = v15;
            goto LABEL_51;
          }
          PKLogFacilityTypeGetObject();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
LABEL_48:
            _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Unexpected failure reason", buf, 2u);
          }
LABEL_49:

          break;
        case 19:
          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
          v65 = objc_claimAutoreleasedReturnValue();

          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_CONNECTIVITY_BODY"));
          v15 = objc_claimAutoreleasedReturnValue();

          PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
          v43 = objc_claimAutoreleasedReturnValue();

          PKLocalizedPaymentString(CFSTR("TRY_AGAIN_BUTTON_TITLE"));
          v66 = objc_claimAutoreleasedReturnValue();

          v46 = 1;
          v79 = v43;
          v80 = v66;
          LOBYTE(v43) = 0;
          v20 = v15;
          v77 = (void *)v65;
          v42 = v76;
          goto LABEL_51;
        case 20:
          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
          v60 = objc_claimAutoreleasedReturnValue();

          v61 = CFSTR("CARKEY_DEVICE_NOT_SUPPORTED_WATCH");
          v62 = CFSTR("CARKEY_DEVICE_NOT_SUPPORTED");
          goto LABEL_82;
        case 21:
          PKLocalizedPaymentString(CFSTR("OS_VERSION_UPDATE_REQUIRED_ERROR_TITLE"));
          v60 = objc_claimAutoreleasedReturnValue();

          if (v15)
            v67 = CFSTR("OS_VERSION_UPDATE_REQUIRED_ERROR_MESSAGE_WATCH");
          else
            v67 = CFSTR("OS_VERSION_UPDATE_REQUIRED_ERROR_MESSAGE_IPHONE");
          PKLocalizedPaymentString(&v67->isa);
          v68 = objc_claimAutoreleasedReturnValue();
          goto LABEL_86;
        case 22:
          v46 = 0;
          goto LABEL_51;
        case 23:
          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
          v15 = objc_claimAutoreleasedReturnValue();

          v64 = CFSTR("CARKEY_FAILED_ADDING_KEY_BT_LIMIT");
          goto LABEL_78;
        case 26:
          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
          v60 = objc_claimAutoreleasedReturnValue();

          v61 = CFSTR("CARKEY_NFC_ONLY_NOT_SUPPORTED_ERROR_BODY_WATCH");
          v62 = CFSTR("CARKEY_NFC_ONLY_NOT_SUPPORTED_ERROR_BODY");
          goto LABEL_82;
        case 27:
          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
          v60 = objc_claimAutoreleasedReturnValue();

          v61 = CFSTR("CARKEY_CAR_NOT_SUPPORTED_WATCH");
          v62 = CFSTR("CARKEY_CAR_NOT_SUPPORTED");
LABEL_82:
          if (v15)
            p_isa = &v61->isa;
          else
            p_isa = &v62->isa;
          PKLocalizedCredentialString(p_isa);
          v68 = objc_claimAutoreleasedReturnValue();
LABEL_86:
          v15 = v68;

          PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
          v43 = objc_claimAutoreleasedReturnValue();

          v46 = 1;
          v79 = v43;
          LOBYTE(v43) = 0;
          v20 = v15;
          v77 = (void *)v60;
          v42 = v76;
          goto LABEL_51;
        default:
          break;
      }
    }
    v46 = 1;
LABEL_51:
    v45 = v74;
LABEL_52:

    if ((v43 & 1) == 0)
    {
      if (v46)
      {
        self = v71;
        v22 = v77;
        v12 = v75;
LABEL_12:
        if (objc_msgSend(v22, "length") && objc_msgSend(v20, "length"))
        {
          v23 = v79;
        }
        else
        {
          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
          v24 = objc_claimAutoreleasedReturnValue();

          -[PKSubcredentialInvitationFlowController localizedIssuerNameForProvisioningOperation:](self, "localizedIssuerNameForProvisioningOperation:", v10);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCredentialString(CFSTR("CARKEY_FAILED_ADDING_KEY"), CFSTR("%@"), v25);
          v26 = objc_claimAutoreleasedReturnValue();

          PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
          v27 = objc_claimAutoreleasedReturnValue();

          v23 = (void *)v27;
          v20 = (void *)v26;
          v22 = (void *)v24;
        }
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v22, v20, 1);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v13 && v23)
        {
          v28 = (void *)MEMORY[0x1E0DC3448];
          v83[0] = MEMORY[0x1E0C809B0];
          v83[1] = 3221225472;
          v83[2] = __103__PKSubcredentialInvitationFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke;
          v83[3] = &unk_1E3E61CA8;
          v84 = v13;
          objc_msgSend(v28, "actionWithTitle:style:handler:", v23, 1, v83);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addAction:](v15, "addAction:", v29);

        }
        if (v12)
        {
          v30 = v23;
          v31 = v10;
          v32 = v13;
          v33 = v12;
          if (v80)
          {
            v34 = v22;
            v35 = v11;
            v36 = v20;
            v37 = (void *)MEMORY[0x1E0DC3448];
            v81[0] = MEMORY[0x1E0C809B0];
            v81[1] = 3221225472;
            v81[2] = __103__PKSubcredentialInvitationFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke_2;
            v81[3] = &unk_1E3E61CA8;
            v38 = v33;
            v82 = v33;
            v39 = v38;
            objc_msgSend(v37, "actionWithTitle:style:handler:", v80, 0, v81);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addAction:](v15, "addAction:", v40);

            v20 = v36;
            v11 = v35;
            v22 = v34;
            v12 = v39;

          }
          v13 = v32;
          v10 = v31;
          v23 = v30;
        }
        v41 = v78;
        goto LABEL_57;
      }
      v15 = 0;
    }
    v41 = v78;
    v23 = v79;
    v22 = v77;
    v12 = v75;
LABEL_57:

    goto LABEL_58;
  }
  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Unable to create valid alert, no error set", buf, 2u);
  }
  v15 = 0;
LABEL_58:

  return v15;
}

uint64_t __103__PKSubcredentialInvitationFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__PKSubcredentialInvitationFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)localizedIssuerNameForProvisioningOperation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a3, "provisioningContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localDeviceInvitation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "issuer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    PKLocalizedCredentialString(CFSTR("GENERIC_PARTNER_NAME"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (void)canAttemptLocalDeviceProvisioningWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, uint64_t, _QWORD);

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (v6)
  {
    v11 = v6;
    objc_msgSend(a3, "localDeviceInvitation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isThirdPartyCrossPlatformInvitation"))
    {
      v11[2](v11, 1, 0);
    }
    else
    {
      objc_msgSend(v7, "supportedRadioTechnologies");
      if (PKRadioTechnologyForConfigurationTechnology())
      {
        objc_msgSend(v7, "pairedReaderIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "localDevicePassMatchingPairedTerminalIdentifier:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 && objc_msgSend(a1, "isPassPersonalizedOrPersonalizing:", v9))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6B9E8], 11, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v10);

        }
        else
        {
          v11[2](v11, 1, 0);
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6B9E8], 20, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v8);
      }

    }
    v6 = v11;
  }

}

+ (void)canAttemptRemoteDeviceProvisioningWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v5, "remoteDeviceWebService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v5, "remoteDeviceInvitation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addCarKeyPassConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __100__PKSubcredentialInvitationFlowController_canAttemptRemoteDeviceProvisioningWithContext_completion___block_invoke;
      v13[3] = &unk_1E3E6B4A8;
      v14 = v7;
      v15 = v8;
      v18 = v6;
      v16 = v5;
      v17 = v10;
      v11 = v10;
      objc_msgSend(v15, "paymentWebService:canAddSecureElementPassWithConfiguration:completion:", v14, v11, v13);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Target device not found", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
    }

  }
}

void __100__PKSubcredentialInvitationFlowController_canAttemptRemoteDeviceProvisioningWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "targetDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paymentWebService:supportedRegionFeatureOfType:", *(_QWORD *)(a1 + 32), 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "friendSharingOSVersionRequirement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "deviceVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "deviceClass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "versionMeetsRequirements:deviceClass:", v9, v10);

    if ((v11 & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "remoteDeviceInvitation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __100__PKSubcredentialInvitationFlowController_canAttemptRemoteDeviceProvisioningWithContext_completion___block_invoke_92;
        v21[3] = &unk_1E3E63438;
        v22 = *(id *)(a1 + 64);
        objc_msgSend(v12, "paymentWebService:canAcceptInvitation:withCompletionV2:", v13, v14, v21);

      }
      else
      {
        PKLogFacilityTypeGetObject();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "Unable to check if remote device can accept invite", buf, 2u);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Sharing is not supported to remote device", buf, 2u);
      }

      v18 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6B9E8], 20, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v19);

    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v24 = v16;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Device cannot add secure element pass with configuration: %@. Error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __100__PKSubcredentialInvitationFlowController_canAttemptRemoteDeviceProvisioningWithContext_completion___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Remote device cannot accept invite: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)localDevicePassMatchingPairedTerminalIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[16];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D66F08]);
    -[NSObject passesOfType:](v4, "passesOfType:", 1);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "secureElementPass", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "pairedTerminalIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v3);

          if (v12)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Unable to find pass matching an unspecified paired terminal identifier.", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isPassPersonalizedOrPersonalizing:(id)a3
{
  id v3;
  char v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "isDevicePrimaryPaymentApplicationPersonalized");
  v5 = objc_msgSend(v3, "effectiveContactlessPaymentApplicationState");

  if (v5 == 2)
    return 1;
  else
    return v4;
}

- (PKSubcredentialProvisioningFlowControllerDelegate)delegate
{
  return (PKSubcredentialProvisioningFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
