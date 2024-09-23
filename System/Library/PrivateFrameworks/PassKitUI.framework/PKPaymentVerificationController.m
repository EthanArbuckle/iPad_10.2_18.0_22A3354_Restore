@implementation PKPaymentVerificationController

- (PKPaymentVerificationController)initWithPaymentPass:(id)a3 passView:(id)a4 webService:(id)a5 context:(int64_t)a6 delegate:(id)a7 setupDelegate:(id)a8 verificationContext:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  PKPaymentVerificationController *v19;
  PKPaymentVerificationController *v20;
  id v21;

  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = -[PKPaymentVerificationController initWithPaymentPass:webService:context:verificationContext:](self, "initWithPaymentPass:webService:context:verificationContext:", a3, a5, a6, a9);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_passView, a4);
    objc_storeWeak((id *)&v20->_setupDelegate, v18);
    objc_storeWeak((id *)&v20->_delegate, v17);
    v21 = -[PKPaymentVerificationController passSnapshot](v20, "passSnapshot");
  }

  return v20;
}

- (PKPaymentVerificationController)initWithPaymentPass:(id)a3 webService:(id)a4 context:(int64_t)a5 verificationContext:(int64_t)a6
{
  id v11;
  id v12;
  PKPaymentVerificationController *v13;
  PKPaymentVerificationController *v14;
  void *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentVerificationController;
  v13 = -[PKPaymentVerificationController init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pass, a3);
    objc_storeStrong((id *)&v14->_webService, a4);
    v14->_context = a5;
    v14->_verificationContext = a6;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v14, sel_sharedPaymentServiceChanged, *MEMORY[0x1E0D6B830], 0);

    -[PKPaymentVerificationController _queue_sharedPaymentWebServiceChanged](v14, "_queue_sharedPaymentWebServiceChanged");
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D6B830], 0);

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentVerificationController;
  -[PKPaymentVerificationController dealloc](&v4, sel_dealloc);
}

- (void)setPassView:(id)a3
{
  PKPassView *v5;
  UIImage *passSnapshot;
  PKPassView *v7;

  v5 = (PKPassView *)a3;
  if (self->_passView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_passView, a3);
    passSnapshot = self->_passSnapshot;
    self->_passSnapshot = 0;

    v5 = v7;
  }

}

- (id)passSnapshot
{
  void *passSnapshot;
  void *v4;
  UIImage *v5;
  UIImage *v6;

  passSnapshot = self->_passSnapshot;
  if (!passSnapshot)
  {
    passSnapshot = self->_passView;
    if (passSnapshot)
    {
      objc_msgSend(passSnapshot, "pass");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "loadImageSetSync:preheat:", 0, 1);

      -[PKPassView snapshotOfFrontFace](self->_passView, "snapshotOfFrontFace");
      v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v6 = self->_passSnapshot;
      self->_passSnapshot = v5;

      passSnapshot = self->_passSnapshot;
    }
  }
  return passSnapshot;
}

- (void)sharedPaymentServiceChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKPaymentVerificationController_sharedPaymentServiceChanged__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __62__PKPaymentVerificationController_sharedPaymentServiceChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sharedPaymentWebServiceChanged");
}

- (void)_queue_sharedPaymentWebServiceChanged
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[PKPaymentWebService verificationRecordForPass:](self->_webService, "verificationRecordForPass:", self->_pass);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (PKShowFakeVerificationChannels())
    {
      objc_msgSend(MEMORY[0x1E0D67770], "verificationRequestRecordForPass:", self->_pass);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  -[PKPaymentVerificationController setVerificationRecord:](self, "setVerificationRecord:", v3);
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Received updated record: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)setVerificationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_verificationRecord, a3);
  -[PKPaymentVerificationController _resetState](self, "_resetState");
  -[PKPaymentVerificationController _didChangePresentation](self, "_didChangePresentation");
  -[PKPaymentVerificationController _lookForBankAppIfNecessary](self, "_lookForBankAppIfNecessary");
}

- (void)_resetState
{
  NSString *installedBankAppBundleID;
  NSString *installedBankAppTitle;
  NSString *inStoreBankAppTitle;
  NSNumber *inStoreBankAppStoreID;

  installedBankAppBundleID = self->_installedBankAppBundleID;
  self->_installedBankAppBundleID = 0;

  installedBankAppTitle = self->_installedBankAppTitle;
  self->_installedBankAppTitle = 0;

  inStoreBankAppTitle = self->_inStoreBankAppTitle;
  self->_inStoreBankAppTitle = 0;

  inStoreBankAppStoreID = self->_inStoreBankAppStoreID;
  self->_inStoreBankAppStoreID = 0;

  self->_bankAppNotFound = 0;
}

- (void)_lookForBankAppIfNecessary
{
  PKVerificationRequestRecord *verificationRecord;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  verificationRecord = self->_verificationRecord;
  v4 = -[PKVerificationRequestRecord verificationStatus](verificationRecord, "verificationStatus");
  if (verificationRecord && ((unint64_t)(v4 - 2) < 2 || v4 == 4000))
  {
    -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "type");

      if (v8 == 5 && !-[PKPaymentVerificationController isBankAppInstalled](self, "isBankAppInstalled"))
        -[PKPaymentVerificationController performStoreLookupForBankAppWithCompletion:](self, "performStoreLookupForBankAppWithCompletion:", 0);
    }
  }
}

- (void)_didChangePresentation
{
  PKPaymentVerificationControllerDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "didChangeVerificationPresentation");

  }
}

- (BOOL)shouldDisabledVerificationButton
{
  return -[PKPaymentVerificationController _channelType](self, "_channelType") == 5 && self->_bankAppNotFound;
}

- (unint64_t)_channelType
{
  void *v3;
  unint64_t v4;

  -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 5)
  {
    if (self->_bankAppNotFound)
    {
      if (-[PKPaymentPass supportsBarcodePayment](self->_pass, "supportsBarcodePayment"))
        return 5;
      else
        return 4;
    }
    else
    {
      return 5;
    }
  }
  return v4;
}

- (NSString)verificationTitleString
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = CFSTR("VERIFICATION_REQUIRED_TITLE");
  PKLocalizedPaymentString(CFSTR("VERIFICATION_REQUIRED_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKVerificationRequestRecord verificationStatus](self->_verificationRecord, "verificationStatus");
  if ((unint64_t)(v5 - 2) >= 2 && v5 != 4000)
  {
LABEL_6:
    PKLocalizedPaymentString(&v3->isa);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
    return (NSString *)v4;
  }
  -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (-[PKPaymentVerificationController _channelType](self, "_channelType") - 1 < 2)
      v3 = CFSTR("VERIFICATION_REQUESTED_TITLE");
    goto LABEL_6;
  }
  return (NSString *)v4;
}

- (NSString)verificationBodyString
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  -[PKPaymentVerificationController defaultVerificationBodyString](self, "defaultVerificationBodyString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKVerificationRequestRecord verificationStatus](self->_verificationRecord, "verificationStatus");
  if ((unint64_t)(v4 - 2) < 2 || v4 == 4000)
  {
    -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      switch(-[PKPaymentVerificationController _channelType](self, "_channelType"))
      {
        case 1uLL:
          objc_msgSend(v5, "contactPoint");
          v6 = objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("VERIFICATION_SENT_EMAIL"), CFSTR("%@"), v6);
          goto LABEL_16;
        case 2uLL:
          objc_msgSend(v5, "contactPoint");
          v6 = objc_claimAutoreleasedReturnValue();
          -[PKPaymentVerificationController _formattedPhoneNumber:forTextMessage:](self, "_formattedPhoneNumber:forTextMessage:", v6, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("VERIFICATION_SENT_TEXT"), CFSTR("%@"), v8);
          goto LABEL_10;
        case 3uLL:
          objc_msgSend(v5, "contactPoint");
          v6 = objc_claimAutoreleasedReturnValue();
          -[PKPaymentVerificationController _formattedPhoneNumber:forTextMessage:](self, "_formattedPhoneNumber:forTextMessage:", v6, 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("VERIFICATION_SENT_INCOMING_PHONE"), CFSTR("%@"), v8);
LABEL_10:
          v9 = objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        case 4uLL:
          -[PKPaymentVerificationController _verificationBodyStringForOutboundPhoneCallChannel:](self, "_verificationBodyStringForOutboundPhoneCallChannel:", v5);
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        case 5uLL:
          -[PKPaymentVerificationController _verificationBodyStringForBankAppChannel:](self, "_verificationBodyStringForBankAppChannel:", v5);
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        case 6uLL:
          PKLocalizedPaymentString(CFSTR("VERIFICATION_SENT_STATEMENT"));
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        case 7uLL:
          goto LABEL_19;
        case 8uLL:
          objc_msgSend(v5, "contactPoint");
          v6 = objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("VERIFICATION_URL"), CFSTR("%@"), v6);
LABEL_16:
          v9 = objc_claimAutoreleasedReturnValue();

LABEL_17:
          v3 = (void *)v6;
          break;
        default:
          -[PKPaymentVerificationController defaultVerificationBodyString](self, "defaultVerificationBodyString");
          v7 = objc_claimAutoreleasedReturnValue();
LABEL_14:
          v9 = v7;
          break;
      }

      v3 = (void *)v9;
    }
  }
  else
  {
    -[PKPaymentVerificationController defaultVerificationBodyString](self, "defaultVerificationBodyString");
    v5 = v3;
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_19:

  return (NSString *)v3;
}

- (id)defaultVerificationBodyString
{
  return (id)PKLocalizedPaymentString(CFSTR("VERIFICATION_REQUIRED_MESSAGE"));
}

- (id)_formattedPhoneNumber:(id)a3 forTextMessage:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  if ((objc_msgSend(v5, "containsString:", CFSTR("•")) & 1) != 0)
  {
    v6 = v5;
  }
  else if (v4)
  {
    v6 = (id)CPPhoneNumberCopyFormattedStringForTextMessage();
  }
  else
  {
    v6 = (id)CPPhoneNumberCopyFormattedStringForVoiceCall();
  }
  v7 = v6;

  return v7;
}

- (id)_verificationBodyStringForOutboundPhoneCallChannel:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "contactPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length") || self->_bankAppNotFound)
  {
    -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  -[PKPaymentVerificationController _formattedPhoneNumber:forTextMessage:](self, "_formattedPhoneNumber:forTextMessage:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("VERIFICATION_SENT_OUTGOING_PHONE"), CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_verificationBodyStringForBankAppChannel:(id)a3
{
  PKPaymentPass *pass;
  id v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  pass = self->_pass;
  v5 = a3;
  v6 = -[PKPaymentPass supportsBarcodePayment](pass, "supportsBarcodePayment");
  objc_msgSend(v5, "contactPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v6 & 1) != 0)
    PKLocalizedAquamanString(CFSTR("ACCOUNT_VERIFICATION_SENT_BANK_APP"), CFSTR("%@"), v7);
  else
    PKLocalizedPaymentString(CFSTR("VERIFICATION_SENT_BANK_APP"), CFSTR("%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    -[PKPaymentVerificationController defaultVerificationBodyString](self, "defaultVerificationBodyString");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (NSString)continueVerificationButtonTitle
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = -[PKVerificationRequestRecord verificationStatus](self->_verificationRecord, "verificationStatus");
  if (((unint64_t)(v3 - 2) < 2 || v3 == 4000)
    && (-[PKVerificationRequestRecord channel](self->_verificationRecord, "channel"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    switch(-[PKPaymentVerificationController _channelType](self, "_channelType"))
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 6uLL:
        v5 = CFSTR("ENTER_CODE_BUTTON");
        goto LABEL_7;
      case 4uLL:
        -[PKPaymentPass organizationName](self->_pass, "organizationName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("CALL_ISSUER_BUTTON"), CFSTR("%@"), v8);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 5uLL:
        -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentVerificationController _continueVerificationButtonTitleForBankAppChannel:](self, "_continueVerificationButtonTitleForBankAppChannel:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v6 = (void *)v9;
        break;
      case 8uLL:
        -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "contactPoint");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("OPEN_BANK_URL_BUTTON"), CFSTR("%@"), v10);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        goto LABEL_6;
    }

  }
  else
  {
LABEL_6:
    v5 = CFSTR("COMPLETE_VERIFICATION_TITLE");
LABEL_7:
    PKLocalizedPaymentString(&v5->isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (id)_continueVerificationButtonTitleForBankAppChannel:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  -[PKPaymentVerificationController _bankAppName](self, "_bankAppName", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentVerificationController isBankAppInstalled](self, "isBankAppInstalled"))
  {
    PKLocalizedPaymentString(CFSTR("OPEN_BANK_APP_BUTTON"), CFSTR("%@"), v4);
LABEL_5:
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (self->_inStoreBankAppTitle)
  {
    PKLocalizedPaymentString(CFSTR("VIEW_BANK_APP_BUTTON"), CFSTR("%@"), v4);
    goto LABEL_5;
  }
  if (!self->_bankAppNotFound)
  {
    v6 = 0;
    goto LABEL_7;
  }
  PKLocalizedPaymentString(CFSTR("NOT_AVAILABLE"));
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (NSString)alternateMethodButtonTitle
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = -[PKVerificationRequestRecord verificationStatus](self->_verificationRecord, "verificationStatus");
  if (((unint64_t)(v3 - 2) < 2 || v3 == 4000)
    && (-[PKVerificationRequestRecord channel](self->_verificationRecord, "channel"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = -[PKPaymentVerificationController _channelType](self, "_channelType");
    if (v5)
    {
      PKLocalizedPaymentString(CFSTR("TRY_AGAIN_BUTTON"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (id)_bankAppName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *installedBankAppTitle;

  -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactPoint");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else if (-[PKPaymentVerificationController isBankAppInstalled](self, "isBankAppInstalled")
         && (installedBankAppTitle = self->_installedBankAppTitle) != 0
         || (installedBankAppTitle = self->_inStoreBankAppTitle) != 0)
  {
    v7 = installedBankAppTitle;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isBankAppInstalled
{
  NSString *installedBankAppBundleID;
  void *v4;
  dispatch_semaphore_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *installedBankAppTitle;
  _QWORD v14[4];
  id v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  installedBankAppBundleID = self->_installedBankAppBundleID;
  if (!installedBankAppBundleID)
  {
    -[PKPaymentVerificationController _bankAppStoreIDs](self, "_bankAppStoreIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x3032000000;
      v21 = __Block_byref_object_copy__15;
      v22 = __Block_byref_object_dispose__15;
      v23 = 0;
      v5 = dispatch_semaphore_create(0);
      v6 = objc_alloc_init(MEMORY[0x1E0DAF640]);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __53__PKPaymentVerificationController_isBankAppInstalled__block_invoke;
      v14[3] = &unk_1E3E69D70;
      v15 = v4;
      v17 = &v18;
      v7 = v5;
      v16 = v7;
      objc_msgSend(v6, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", v15, v14);
      dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
      v8 = (void *)v19[5];
      if (v8)
      {
        objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0DAFCE8]);
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        v10 = self->_installedBankAppBundleID;
        self->_installedBankAppBundleID = v9;

        objc_msgSend((id)v19[5], "valueForProperty:", *MEMORY[0x1E0DAFD18]);
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        installedBankAppTitle = self->_installedBankAppTitle;
        self->_installedBankAppTitle = v11;

      }
      _Block_object_dispose(&v18, 8);

    }
    installedBankAppBundleID = self->_installedBankAppBundleID;
  }
  return installedBankAppBundleID != 0;
}

void __53__PKPaymentVerificationController_isBankAppInstalled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v18 = a1;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(a1 + 32);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v24;
    v3 = *MEMORY[0x1E0DAFD08];
LABEL_3:
    v4 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v15)
        objc_enumerationMutation(obj);
      v5 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v4);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v6 = v17;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v20 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v11, "valueForProperty:", v3);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqual:", v5);

            if (v13)
            {
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v18 + 48) + 8) + 40), v11);
              goto LABEL_16;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_16:

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v18 + 48) + 8) + 40))
        break;
      if (++v4 == v16)
      {
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v16)
          goto LABEL_3;
        break;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v18 + 40));
}

- (id)_bankAppStoreIDs
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[PKPaymentPass storeIdentifiers](self->_pass, "storeIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[PKPaymentPass storeIdentifiers](self->_pass, "storeIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v10);

  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (void)performStoreLookupForBankAppWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  void (**v9)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[PKPaymentVerificationController _bankAppStoreIDs](self, "_bankAppStoreIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__PKPaymentVerificationController_performStoreLookupForBankAppWithCompletion___block_invoke;
    v7[3] = &unk_1E3E69D98;
    v7[4] = self;
    v8 = v5;
    v9 = v4;
    v6 = PKLookupAppStoreApplications(v8, v7);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

void __78__PKPaymentVerificationController_performStoreLookupForBankAppWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PKPaymentVerificationController_performStoreLookupForBankAppWithCompletion___block_invoke_2;
  v7[3] = &unk_1E3E622D8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __78__PKPaymentVerificationController_performStoreLookupForBankAppWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "displayName");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

    objc_msgSend(v3, "appStoreIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v7;

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v10 + 32) && !*(_QWORD *)(v10 + 8))
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 48);
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "None of the specified bank apps (%@) were found installed or on the store, will fall back to Outbound Call (Customer Service) verification", (uint8_t *)&v14, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 48) = 1;
  }
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
    (*(void (**)(void))(v13 + 16))();
  objc_msgSend(*(id *)(a1 + 40), "_didChangePresentation");

}

- (id)verificationURL
{
  void *v2;
  void *v3;

  -[PKPaymentVerificationController verificationURLComponents](self, "verificationURLComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)verificationSecureURL
{
  void *v2;
  void *v3;

  -[PKPaymentVerificationController verificationURLComponents](self, "verificationURLComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScheme:", CFSTR("https"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)verificationURLComponents
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3998]);
  -[PKPaymentVerificationController verificationRecord](self, "verificationRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "channel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v3, "initWithString:", v6);

  -[PKPaymentVerificationController pass](self, "pass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "deviceAccountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v10, "setScheme:", *MEMORY[0x1E0D6BCA8]);
  objc_msgSend(v10, "setHost:", *MEMORY[0x1E0D6BC00]);
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("deviceAccountIdentifier"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("success"), CFSTR("true"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setQueryItems:", v13);

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("deviceAccountIdentifier"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v15 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v8, "primaryAccountNumberSuffix");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queryItemWithName:value:", CFSTR("primaryAccountNumberSuffix"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  v18 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v10, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "absoluteString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "queryItemWithName:value:", CFSTR("redirectUrl"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setQueryItems:", v22);

  return v24;
}

- (void)_isAppClipVerificationURLWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PKPaymentVerificationController verificationURL](self, "verificationURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D107F0]), "initWithURL:", v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKPaymentVerificationController__isAppClipVerificationURLWithCompletion___block_invoke;
  v8[3] = &unk_1E3E69DC0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "requestMetadataWithCompletion:", v8);

}

uint64_t __75__PKPaymentVerificationController__isAppClipVerificationURLWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)bankAppStoreID
{
  return self->_inStoreBankAppStoreID;
}

- (id)_outboundCallPhoneNumber
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 bankAppNotFound;

  -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_4;
  -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "type") != 5)
  {
LABEL_5:

    return v4;
  }
  bankAppNotFound = self->_bankAppNotFound;

  if (bankAppNotFound)
  {
LABEL_4:
    -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
    v5 = v4;
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v4;
}

- (void)canPerformVerificationInline:(id)a3
{
  PKVerificationRequestRecord *verificationRecord;
  void (**v5)(id, _QWORD);
  uint64_t v6;
  id v7;

  verificationRecord = self->_verificationRecord;
  v5 = (void (**)(id, _QWORD))a3;
  -[PKVerificationRequestRecord channel](verificationRecord, "channel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (v6)
    -[PKPaymentVerificationController _canPerformVerificationInlineForChannel:completion:](self, "_canPerformVerificationInlineForChannel:completion:", v6, v5);
  else
    v5[2](v5, 0);

}

- (void)canPerformAnyVerificationInline:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[7];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v15 = v4;
    v6 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[PKVerificationRequestRecord allChannels](self->_verificationRecord, "allChannels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
          v19[0] = v9;
          v19[1] = 3221225472;
          v19[2] = __67__PKPaymentVerificationController_canPerformAnyVerificationInline___block_invoke;
          v19[3] = &unk_1E3E63610;
          v19[4] = self;
          v19[5] = v12;
          v19[6] = v24;
          objc_msgSend(v6, "addOperation:", v19, v15);
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v8);
    }

    v5 = v15;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __67__PKPaymentVerificationController_canPerformAnyVerificationInline___block_invoke_3;
    v16[3] = &unk_1E3E69DE8;
    v17 = v15;
    v18 = v24;
    v14 = (id)objc_msgSend(v6, "evaluateWithInput:completion:", v13, v16);

    _Block_object_dispose(v24, 8);
  }

}

void __67__PKPaymentVerificationController_canPerformAnyVerificationInline___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)a1[4];
  v9 = a1[5];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__PKPaymentVerificationController_canPerformAnyVerificationInline___block_invoke_2;
  v13[3] = &unk_1E3E699E0;
  v10 = a1[6];
  v15 = v7;
  v16 = v10;
  v14 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "_canPerformVerificationInlineForChannel:completion:", v9, v13);

}

uint64_t __67__PKPaymentVerificationController_canPerformAnyVerificationInline___block_invoke_2(_QWORD *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 == 2)
  {
    if (!a2)
    {
      v3 = 2;
      return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(a1[5] + 16))(a1[5], a1[4], v3 == 1);
    }
    v4 = 1;
    goto LABEL_8;
  }
  if (!v3)
  {
    v4 = 1;
    if (!a2)
      v4 = 2;
LABEL_8:
    *(_QWORD *)(v2 + 24) = v4;
    v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  }
  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(a1[5] + 16))(a1[5], a1[4], v3 == 1);
}

uint64_t __67__PKPaymentVerificationController_canPerformAnyVerificationInline___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 2);
}

- (void)_canPerformVerificationInlineForChannel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__PKPaymentVerificationController__canPerformVerificationInlineForChannel_completion___block_invoke;
    aBlock[3] = &unk_1E3E669E0;
    v9 = v6;
    v15 = v9;
    v16 = v7;
    v10 = _Block_copy(aBlock);
    v11 = objc_msgSend(v9, "type");
    if (v11 == 8)
    {
      if (!-[PKPaymentVerificationController isBankAppInstalled](self, "isBankAppInstalled"))
      {
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __86__PKPaymentVerificationController__canPerformVerificationInlineForChannel_completion___block_invoke_102;
        v12[3] = &unk_1E3E614F0;
        v13 = v10;
        -[PKPaymentVerificationController _isAppClipVerificationURLWithCompletion:](self, "_isAppClipVerificationURLWithCompletion:", v12);

        goto LABEL_7;
      }
    }
    else if (v11 == 2)
    {
      (*((void (**)(void *, uint64_t))v10 + 2))(v10, 1);
LABEL_7:

      goto LABEL_8;
    }
    (*((void (**)(void *, _QWORD))v10 + 2))(v10, 0);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __86__PKPaymentVerificationController__canPerformVerificationInlineForChannel_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v5 = CFSTR("Yes");
    else
      v5 = CFSTR("No");
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Can perform verification inline: '%@' for '%@'", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __86__PKPaymentVerificationController__canPerformVerificationInlineForChannel_completion___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)selectOtherVerificationMethod
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = -[PKVerificationRequestRecord verificationStatus](self->_verificationRecord, "verificationStatus");
  if ((unint64_t)(v3 - 2) < 2 || v3 == 4000)
  {
    -[PKPaymentVerificationController goToPreviousStep](self, "goToPreviousStep");
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Cannot present other verification methods for fields", v5, 2u);
    }

  }
}

- (void)continueVerification
{
  uint64_t v3;

  v3 = -[PKVerificationRequestRecord verificationStatus](self->_verificationRecord, "verificationStatus");
  if ((unint64_t)(v3 - 2) < 2 || v3 == 4000)
    -[PKPaymentVerificationController continueVerificationUsingMethods](self, "continueVerificationUsingMethods");
  else
    -[PKPaymentVerificationController retryCurrentStep](self, "retryCurrentStep");
}

- (void)continueVerificationUsingMethods
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PKVerificationRequestRecord channel](self->_verificationRecord, "channel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeDescriptionUnlocalized");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Continuing verification with selected channel: '%@'", (uint8_t *)&v6, 0xCu);

  }
  switch(-[PKPaymentVerificationController _channelType](self, "_channelType"))
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 6uLL:
      -[PKPaymentVerificationController _presentVerificatonEntryCompletionViewController](self, "_presentVerificatonEntryCompletionViewController");
      break;
    case 4uLL:
      -[PKPaymentVerificationController completeVerificationUsingOutboundCall](self, "completeVerificationUsingOutboundCall");
      break;
    case 5uLL:
      -[PKPaymentVerificationController _completeVerificationUsingBankApp](self, "_completeVerificationUsingBankApp");
      break;
    case 8uLL:
      -[PKPaymentVerificationController completeVerificationUsingURL](self, "completeVerificationUsingURL");
      break;
    default:
      -[PKPaymentVerificationController retryCurrentStep](self, "retryCurrentStep");
      break;
  }
}

- (void)goToPreviousStep
{
  id v3;

  -[PKVerificationRequestRecord previousStepIdentifier](self->_verificationRecord, "previousStepIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKVerificationRequestRecord setCurrentStepIdentifier:](self->_verificationRecord, "setCurrentStepIdentifier:", v3);
  -[PKPaymentWebService updateVerificationRecord:](self->_webService, "updateVerificationRecord:", self->_verificationRecord);
  -[PKPaymentVerificationController _presentVerificationViewController](self, "_presentVerificationViewController");

}

- (void)_completeVerificationUsingBankApp
{
  id WeakRetained;
  NSObject *v4;
  NSObject *v5;
  PKStoreProductViewPresenter *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  if (-[PKPaymentVerificationController isBankAppInstalled](self, "isBankAppInstalled"))
  {
    -[PKPaymentVerificationController launchBankApp](self, "launchBankApp");
  }
  else if (self->_inStoreBankAppStoreID)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

    if (WeakRetained)
    {
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Skipping completeVerificationUsingBankApp because flow item delegate present", buf, 2u);
      }

    }
    else
    {
      v6 = -[PKStoreProductViewPresenter initWithProductDelegate:]([PKStoreProductViewPresenter alloc], "initWithProductDelegate:", 0);
      -[PKStoreProductViewPresenter loadProductForItemIdentifier:customProductPageIdentifier:](v6, "loadProductForItemIdentifier:customProductPageIdentifier:", self->_inStoreBankAppStoreID, 0);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __68__PKPaymentVerificationController__completeVerificationUsingBankApp__block_invoke;
      v7[3] = &unk_1E3E69E10;
      v7[4] = self;
      -[PKStoreProductViewPresenter presentStoreViewWithBlock:](v6, "presentStoreViewWithBlock:", v7);

    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "No matching bank app installed and no app matching app found in store, there was possibly a store lookup error", buf, 2u);
    }

    self->_bankAppNotFound = 1;
  }
}

uint64_t __68__PKPaymentVerificationController__completeVerificationUsingBankApp__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestDelegatePresentationOfViewController:completion:", a2, a3);
}

- (void)completeVerificationUsingURL
{
  if (-[PKPaymentVerificationController isBankAppInstalled](self, "isBankAppInstalled"))
    -[PKPaymentVerificationController launchBankApp](self, "launchBankApp");
  else
    -[PKPaymentVerificationController _accessBankVerificationURLAsAppClip](self, "_accessBankVerificationURLAsAppClip");
}

- (void)launchBankApp
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[8];
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  if (self->_installedBankAppBundleID)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Starting bank app verification", v12, 2u);
    }

    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PKPaymentPass appLaunchURL](self->_pass, "appLaunchURL");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v14[0] = CFSTR("verify");
      v13[0] = CFSTR("action");
      v13[1] = CFSTR("passTypeIdentifier");
      -[PKPaymentPass passTypeIdentifier](self->_pass, "passTypeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v7;
      v13[2] = CFSTR("serialNumber");
      -[PKPaymentPass serialNumber](self->_pass, "serialNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKURLByAppendingQueryParams();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D22D78]);
    }
    objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKOpenApplication(self->_installedBankAppBundleID, v11);

  }
}

- (void)_accessBankVerificationURLAsAppClip
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[PKPaymentVerificationController verificationURL](self, "verificationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D107F8]), "initWithURL:", v3);
  objc_msgSend(v4, "setShouldReturnErrorOnUserCancellation:", 1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PKPaymentVerificationController__accessBankVerificationURLAsAppClip__block_invoke;
  v6[3] = &unk_1E3E64E38;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "requestClipWithCompletion:", v6);

}

void __70__PKPaymentVerificationController__accessBankVerificationURLAsAppClip__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentVerificationController__accessBankVerificationURLAsAppClip__block_invoke_2;
  block[3] = &unk_1E3E64908;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __70__PKPaymentVerificationController__accessBankVerificationURLAsAppClip__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  if (*(_BYTE *)(a1 + 48))
  {
    PKLogFacilityTypeGetObject();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_19D178000, v1, OS_LOG_TYPE_DEFAULT, "Starting app clip verification", v2, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_accessBankVerificationURLAsWebPage:", *(_QWORD *)(a1 + 40));
  }
}

- (void)_accessBankVerificationURLAsWebPage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id buf[2];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Starting web url verification", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6 = objc_alloc(getASWebAuthenticationSessionClass());
  v7 = *MEMORY[0x1E0D6BCA8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PKPaymentVerificationController__accessBankVerificationURLAsWebPage___block_invoke;
  v9[3] = &unk_1E3E69E38;
  objc_copyWeak(&v10, buf);
  v8 = (void *)objc_msgSend(v6, "initWithURL:callbackURLScheme:completionHandler:", v4, v7, v9);
  objc_msgSend(v8, "setPresentationContextProvider:", self);
  objc_msgSend(v8, "start");

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);

}

void __71__PKPaymentVerificationController__accessBankVerificationURLAsWebPage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  char v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_23;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v5 || v6)
  {
    if (v9)
    {
      v20 = 138412290;
      v21 = v6;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "URL verification returned error %@", (uint8_t *)&v20, 0xCu);
    }

    objc_msgSend(v6, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getASWebAuthenticationSessionErrorDomain();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12;
    v15 = v13;
    if (v14 == v15)
    {

    }
    else
    {
      v16 = v15;
      if (!v14 || !v15)
      {

        goto LABEL_22;
      }
      v17 = objc_msgSend(v14, "isEqualToString:", v15);

      if ((v17 & 1) == 0)
        goto LABEL_22;
    }
    if (objc_msgSend(v6, "code") == 1)
    {
      objc_msgSend(WeakRetained, "clearSelectedChannel");
      goto LABEL_23;
    }
LABEL_22:
    objc_msgSend(WeakRetained, "goToPreviousStep");
    goto LABEL_23;
  }
  if (v9)
  {
    v20 = 138412290;
    v21 = v5;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "URL verification returned callbackURL %@", (uint8_t *)&v20, 0xCu);
  }

  objc_msgSend(WeakRetained, "_updateVerificationStatusToComplete");
  v10 = objc_loadWeakRetained(WeakRetained + 10);

  if (v10)
  {
    v11 = objc_loadWeakRetained(WeakRetained + 10);
    objc_msgSend(v11, "didFinishVerification");
LABEL_20:

    goto LABEL_23;
  }
  v18 = objc_loadWeakRetained(WeakRetained + 8);
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    v11 = objc_loadWeakRetained(WeakRetained + 8);
    objc_msgSend(v11, "dismissVerificationViewControllerAnimated:", 1);
    goto LABEL_20;
  }
LABEL_23:

}

- (void)completeVerificationUsingOutboundCall
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Starting outbound call verification", buf, 2u);
  }

  -[PKPaymentVerificationController _outboundCallPhoneNumber](self, "_outboundCallPhoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKTelephoneURLFromPhoneNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canOpenURL:", v5);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__PKPaymentVerificationController_completeVerificationUsingOutboundCall__block_invoke;
    v9[3] = &unk_1E3E62288;
    v9[4] = self;
    objc_msgSend(v8, "openURL:options:completionHandler:", v5, MEMORY[0x1E0C9AA70], v9);

  }
}

uint64_t __72__PKPaymentVerificationController_completeVerificationUsingOutboundCall__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "clearSelectedChannel");
  return result;
}

- (void)_presentVerificationViewController
{
  void *v3;
  PKPaymentVerificationMethodsViewController *v4;
  id WeakRetained;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PKVerificationRequestRecord currentStepIdentifier](self->_verificationRecord, "currentStepIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v4 = (PKPaymentVerificationMethodsViewController *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v4->super.super.super.super.super, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19D178000, &v4->super.super.super.super.super, OS_LOG_TYPE_DEFAULT, "Presenting verification VC for Step: '%@'", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  if (WeakRetained)
  {
    if (os_log_type_enabled(&v4->super.super.super.super.super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_19D178000, &v4->super.super.super.super.super, OS_LOG_TYPE_DEFAULT, "Skipping presentVerificationViewController because flow item delegate present", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    v4 = -[PKPaymentVerificationMethodsViewController initWithVerificationController:]([PKPaymentVerificationMethodsViewController alloc], "initWithVerificationController:", self);
    -[PKPaymentVerificationMethodsViewController setProvisioningController:](v4, "setProvisioningController:", self->_provisioningController);
    -[PKPaymentVerificationController _wrapViewControllerAndRequestDelegatePresentationOfView:](self, "_wrapViewControllerAndRequestDelegatePresentationOfView:", v4);
  }

}

- (void)_presentVerificatonEntryCompletionViewController
{
  id WeakRetained;
  NSObject *v4;
  PKPaymentSetupVerificationCompletionViewController *v5;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Skipping presentVerificatonEntryCompletionViewController because flow item delegate present", buf, 2u);
    }

  }
  else
  {
    v5 = -[PKPaymentSetupVerificationCompletionViewController initWithVerificationController:mode:offerOtherMethods:]([PKPaymentSetupVerificationCompletionViewController alloc], "initWithVerificationController:mode:offerOtherMethods:", self, 0, self->_verificationContext == 2);
    -[PKPaymentSetupVerificationCompletionViewController setProvisioningController:](v5, "setProvisioningController:", self->_provisioningController);
    -[PKPaymentVerificationController _wrapViewControllerAndRequestDelegatePresentationOfView:](self, "_wrapViewControllerAndRequestDelegatePresentationOfView:", v5);

  }
}

- (void)clearSelectedChannel
{
  NSObject *v3;
  PKVerificationRequestRecord *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Clearing selected verification channel", v5, 2u);
  }

  v4 = self->_verificationRecord;
  -[PKVerificationRequestRecord setChannel:](v4, "setChannel:", 0);
  -[PKVerificationRequestRecord setVerificationStatus:](v4, "setVerificationStatus:", 2);
  -[PKPaymentVerificationController setVerificationRecord:](self, "setVerificationRecord:", v4);
  -[PKPaymentWebService updateVerificationRecord:](self->_webService, "updateVerificationRecord:", v4);

}

- (void)_updateVerificationStatusToComplete
{
  NSObject *v3;
  PKVerificationRequestRecord *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Marking verification as complete", v5, 2u);
  }

  v4 = self->_verificationRecord;
  -[PKVerificationRequestRecord setVerificationStatus:](v4, "setVerificationStatus:", 3);
  -[PKPaymentVerificationController setVerificationRecord:](self, "setVerificationRecord:", v4);
  -[PKPaymentWebService updateVerificationRecord:](self->_webService, "updateVerificationRecord:", v4);

}

- (void)_wrapViewControllerAndRequestDelegatePresentationOfView:(id)a3
{
  PKPortraitNavigationController *v4;
  PKPortraitNavigationController *v5;
  PKPortraitNavigationController *v6;
  PKPortraitNavigationController *v7;
  PKPortraitNavigationController *v8;

  v4 = (PKPortraitNavigationController *)a3;
  v5 = v4;
  if (self->_verificationContext)
  {
    v7 = -[PKPortraitNavigationController initWithRootViewController:]([PKPortraitNavigationController alloc], "initWithRootViewController:", v4);
    -[PKPortraitNavigationController setDelegate:](v7, "setDelegate:", self);
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v7, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      -[PKPortraitNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
    }

    v6 = v7;
  }
  else
  {
    v6 = v4;
  }
  v8 = v6;
  -[PKPaymentVerificationController _requestDelegatePresentationOfViewController:completion:](self, "_requestDelegatePresentationOfViewController:completion:", v6, 0);

}

- (void)_requestDelegatePresentationOfViewController:(id)a3 completion:(id)a4
{
  int64_t context;
  id v7;
  id v8;
  id WeakRetained;

  context = self->_context;
  v7 = a4;
  v8 = a3;
  PKPaymentSetupApplyContextAppearance(context, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentVerificationViewController:animated:completion:", v8, 1, v7);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  PKPaymentSetupApplyContextAppearance(self->_context, a4);
}

- (void)performVerificationOptionsRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  PKPaymentWebService *webService;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Fetching verification options", buf, 2u);
  }

  -[PKVerificationRequestRecord currentStepIdentifier](self->_verificationRecord, "currentStepIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stepIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 && v9)
    objc_msgSend(v6, "setStepIdentifier:", v9);
  webService = self->_webService;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__PKPaymentVerificationController_performVerificationOptionsRequest_completion___block_invoke;
  v13[3] = &unk_1E3E69E88;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  -[PKPaymentWebService verificationOptionsForRequest:completion:](webService, "verificationOptionsForRequest:completion:", v6, v13);

}

void __80__PKPaymentVerificationController_performVerificationOptionsRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKPaymentVerificationController_performVerificationOptionsRequest_completion___block_invoke_2;
  block[3] = &unk_1E3E69E60;
  v16 = a2;
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v8;
  v15 = v9;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __80__PKPaymentVerificationController_performVerificationOptionsRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if (*(_QWORD *)(a1 + 64) == 1)
    objc_msgSend(*(id *)(a1 + 32), "setVerificationRecord:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)performVerificationUpdateRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  PKPaymentWebService *webService;
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "channel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKVerificationRequestRecord currentStepIdentifier](self->_verificationRecord, "currentStepIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stepIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 && v9)
    objc_msgSend(v6, "setStepIdentifier:", v9);
  v11 = v8 != 0;
  webService = self->_webService;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PKPaymentVerificationController_performVerificationUpdateRequest_completion___block_invoke;
  v14[3] = &unk_1E3E69F00;
  v16 = v11;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  -[PKPaymentWebService updateVerification:completion:](webService, "updateVerification:completion:", v6, v14);

}

void __79__PKPaymentVerificationController_performVerificationUpdateRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  char v19;

  v7 = a3;
  v8 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__PKPaymentVerificationController_performVerificationUpdateRequest_completion___block_invoke_2;
  v13[3] = &unk_1E3E69ED8;
  v18 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v14 = v7;
  v15 = v9;
  v19 = *(_BYTE *)(a1 + 48);
  v16 = v8;
  v17 = v10;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __79__PKPaymentVerificationController_performVerificationUpdateRequest_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 64) == 1)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Updated verification record: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setVerificationRecord:", *(_QWORD *)(a1 + 32));
    if (objc_msgSend(*(id *)(a1 + 32), "verificationStatus") == 3 && !*(_BYTE *)(a1 + 72))
    {
      v6 = *(void **)(a1 + 40);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __79__PKPaymentVerificationController_performVerificationUpdateRequest_completion___block_invoke_118;
      v9[3] = &unk_1E3E69EB0;
      v7 = *(id *)(a1 + 56);
      v8 = *(_QWORD *)(a1 + 64);
      v10 = v7;
      v11 = v8;
      objc_msgSend(v6, "_downloadAndAddPassWithCompletion:", v9);

    }
    else
    {
      v4 = *(_QWORD *)(a1 + 56);
      if (v4)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __79__PKPaymentVerificationController_performVerificationUpdateRequest_completion___block_invoke_118(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 40), a2);
  return result;
}

- (void)submitVerificationCode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PKPaymentWebService *webService;
  PKPaymentPass *pass;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Submitting verification code", buf, 2u);
  }

  webService = self->_webService;
  pass = self->_pass;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke;
  v12[3] = &unk_1E3E69F50;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  -[PKPaymentWebService submitVerificationCode:verificationData:forPass:completion:](webService, "submitVerificationCode:verificationData:forPass:completion:", v6, 0, pass, v12);

}

void __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke_2;
  block[3] = &unk_1E3E69E60;
  v16 = a2;
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v8;
  v15 = v9;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 == 1)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Successfully submitted verification code. Downloading pass.", buf, 2u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke_120;
    v10[3] = &unk_1E3E69F28;
    v5 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    v12 = v5;
    v6 = *(id *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v13 = v6;
    v14 = v7;
    objc_msgSend(v11, "_downloadAndAddPassWithCompletion:", v10);

  }
  else
  {
    if (v4)
    {
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Failed to submit verification code with error: %@", buf, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

void __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke_120(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke_2_121;
  block[3] = &unk_1E3E69E60;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v11 = v5;
  v12 = v6;
  v10 = v3;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke_2_121(uint64_t a1)
{
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_downloadAndAddPassWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Downloading verified pass", buf, 2u);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67240]), "initWithSecureElementPass:", self->_pass);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67558]), "initWithDestinationWebService:managingWebService:", self->_webService, self->_webService);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PKPaymentVerificationController__downloadAndAddPassWithCompletion___block_invoke;
  v10[3] = &unk_1E3E69F78;
  v11 = v7;
  v12 = v4;
  v8 = v7;
  v9 = v4;
  objc_msgSend(v8, "ingestProvisioningPassData:cloudStoreCoordinatorDelegate:moreInfoURLs:ingestionProperties:sid:completion:", v6, 0, 0, 0, &stru_1E3E7D690, v10);

}

uint64_t __69__PKPaymentVerificationController__downloadAndAddPassWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a6);
  return result;
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  PKPaymentVerificationControllerFlowDelegate **p_flowDelegate;
  id WeakRetained;
  id v6;
  id v7;
  void *v8;

  p_flowDelegate = &self->_flowDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  if (WeakRetained
    || (p_flowDelegate = &self->_delegate, v6 = objc_loadWeakRetained((id *)&self->_delegate), v6, v6))
  {
    v7 = objc_loadWeakRetained((id *)p_flowDelegate);
    objc_msgSend(v7, "presentationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (PKPaymentVerificationControllerDelegate)delegate
{
  return (PKPaymentVerificationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (PKPaymentVerificationControllerFlowDelegate)flowDelegate
{
  return (PKPaymentVerificationControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
}

- (void)setFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowDelegate, a3);
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (int64_t)verificationContext
{
  return self->_verificationContext;
}

- (void)setVerificationContext:(int64_t)a3
{
  self->_verificationContext = a3;
}

- (PKVerificationRequestRecord)verificationRecord
{
  return self->_verificationRecord;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningController, a3);
}

- (PKPassView)passView
{
  return self->_passView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_verificationRecord, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_passSnapshot, 0);
  objc_storeStrong((id *)&self->_inStoreBankAppStoreID, 0);
  objc_storeStrong((id *)&self->_inStoreBankAppTitle, 0);
  objc_storeStrong((id *)&self->_installedBankAppTitle, 0);
  objc_storeStrong((id *)&self->_installedBankAppBundleID, 0);
}

@end
