@implementation PKContactlessCardIngester

- (PKContactlessCardIngester)initWithPaymentSetupProduct:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PKContactlessCardIngester *v8;
  void *v9;
  uint64_t v10;
  NSString *pushTopic;
  uint64_t v12;
  PKPaymentProvisioningMethodMetadata *readerModeProvisioningMetadata;
  dispatch_queue_t v14;
  OS_dispatch_queue *contactlessCardIngesterQueue;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKContactlessCardIngester;
  v8 = -[PKContactlessCardIngester init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryRegionTopic");
    v10 = objc_claimAutoreleasedReturnValue();
    pushTopic = v8->_pushTopic;
    v8->_pushTopic = (NSString *)v10;

    objc_msgSend(v6, "provisioningMethodMetadataForType:", CFSTR("readerMode"));
    v12 = objc_claimAutoreleasedReturnValue();
    readerModeProvisioningMetadata = v8->_readerModeProvisioningMetadata;
    v8->_readerModeProvisioningMetadata = (PKPaymentProvisioningMethodMetadata *)v12;

    objc_storeWeak((id *)&v8->_delegate, v7);
    v14 = dispatch_queue_create("com.apple.passkit.contactlesscardingester", 0);
    contactlessCardIngesterQueue = v8->_contactlessCardIngesterQueue;
    v8->_contactlessCardIngesterQueue = (OS_dispatch_queue *)v14;

  }
  return v8;
}

- (void)invalidate
{
  -[PKContactlessCardIngester _cancelCardIngestion](self, "_cancelCardIngestion");
  -[PKContactlessCardIngester _stopListeningToRemoteAdminEvents](self, "_stopListeningToRemoteAdminEvents");
}

- (void)ingestCardWithSuccessHandler:(id)a3
{
  id v4;
  NSObject *contactlessCardIngesterQueue;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  contactlessCardIngesterQueue = self->_contactlessCardIngesterQueue;
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PKContactlessCardIngester_ingestCardWithSuccessHandler___block_invoke;
  v9[3] = &unk_1E2ABE058;
  v9[4] = self;
  v10 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_21;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  v8 = v4;
  dispatch_async(contactlessCardIngesterQueue, block);

}

uint64_t __58__PKContactlessCardIngester_ingestCardWithSuccessHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_startListeningToRemoteAdminEventsIfRequired");
  return objc_msgSend(*(id *)(a1 + 32), "_ingestCardWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)ingestCardWithCardSessionToken:(id)a3 successHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *contactlessCardIngesterQueue;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD block[4];
  id v17;

  v6 = a3;
  v7 = a4;
  contactlessCardIngesterQueue = self->_contactlessCardIngesterQueue;
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PKContactlessCardIngester_ingestCardWithCardSessionToken_successHandler___block_invoke;
  v13[3] = &unk_1E2ABE030;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v10 = v13;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_21;
  block[3] = &unk_1E2ABD9A0;
  v17 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(contactlessCardIngesterQueue, block);

}

uint64_t __75__PKContactlessCardIngester_ingestCardWithCardSessionToken_successHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_startListeningToRemoteAdminEventsIfRequired");
  return objc_msgSend(*(id *)(a1 + 32), "_ingestCardWithCardSessionToken:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_cancelCardIngestion
{
  uint64_t v2;
  NSObject *contactlessCardIngesterQueue;
  _QWORD *v4;
  _QWORD v5[5];
  _QWORD block[4];
  id v7;

  v2 = MEMORY[0x1E0C809B0];
  contactlessCardIngesterQueue = self->_contactlessCardIngesterQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PKContactlessCardIngester__cancelCardIngestion__block_invoke;
  v5[3] = &unk_1E2ABE120;
  v5[4] = self;
  v4 = v5;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_21;
  block[3] = &unk_1E2ABD9A0;
  v7 = v4;
  dispatch_async(contactlessCardIngesterQueue, block);

}

void __49__PKContactlessCardIngester__cancelCardIngestion__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelCardIngestion");

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = 0;

}

+ (id)debugDescriptionForStatus:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 - 1 > 0xC)
    v3 = CFSTR("Unknown");
  else
    v3 = off_1E2ADB360[a3 - 1];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu - %@"), a3, v3);
}

- (void)_ingestCardWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id cardSessionTokenCompletionHandler;
  id v7;
  NSString *pushTopic;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;

  v4 = a3;
  v5 = _Block_copy(v4);
  cardSessionTokenCompletionHandler = self->_cardSessionTokenCompletionHandler;
  self->_cardSessionTokenCompletionHandler = v5;

  objc_initWeak(&location, self);
  v7 = PKGetClassNFRemoteAdminCardIngestionRequest();
  pushTopic = self->_pushTopic;
  -[PKPaymentProvisioningMethodMetadata readerModeMetadata](self->_readerModeProvisioningMetadata, "readerModeMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cardIngestionRequestWithServerIdentifier:sessionToken:readerModeMetadata:maxDetectionTimeout:", pushTopic, 0, v9, 60000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PKContactlessCardIngester__ingestCardWithCompletion___block_invoke;
  v12[3] = &unk_1E2ADB340;
  v12[4] = self;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v11, "ingestCard:withCompletionHandler:", v10, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __55__PKContactlessCardIngester__ingestCardWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13[2];
  _QWORD block[4];
  id v15;

  v5 = a2;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__PKContactlessCardIngester__ingestCardWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2AC7F08;
  objc_copyWeak(v13, (id *)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 32);
  v13[1] = a3;
  v11[4] = v8;
  v12 = v5;
  v9 = v11;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_21;
  block[3] = &unk_1E2ABD9A0;
  v15 = v9;
  v10 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(v13);
}

void __55__PKContactlessCardIngester__ingestCardWithCompletion___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[7])
  {
    objc_msgSend(*(id *)(a1 + 32), "_displayableErrorForSPStatusCode:seldError:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)*((_QWORD *)v3 + 7);
      *((_QWORD *)v3 + 7) = 0;

      v6 = objc_loadWeakRetained((id *)v3 + 5);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)v3 + 5);
        objc_msgSend(v8, "contactlessCardIngester:didFailToIngestCardWithError:resetProvisioning:isRecoverable:", v3, v4, 1, (*(_QWORD *)(a1 + 56) > 0xCuLL) | (0x103u >> *(_QWORD *)(a1 + 56)) & 1);

      }
    }

  }
  if (*(_QWORD *)(a1 + 56) != -1)
  {
    v11 = CFSTR("code");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

- (void)_ingestCardWithCardSessionToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id disableCardCompletionHandler;
  id v10;
  NSString *pushTopic;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = _Block_copy(v7);
  disableCardCompletionHandler = self->_disableCardCompletionHandler;
  self->_disableCardCompletionHandler = v8;

  objc_initWeak(&location, self);
  v10 = PKGetClassNFRemoteAdminCardIngestionRequest();
  pushTopic = self->_pushTopic;
  -[PKPaymentProvisioningMethodMetadata readerModeMetadata](self->_readerModeProvisioningMetadata, "readerModeMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cardIngestionRequestWithServerIdentifier:sessionToken:readerModeMetadata:maxDetectionTimeout:", pushTopic, v6, v12, 60000);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__PKContactlessCardIngester__ingestCardWithCardSessionToken_completion___block_invoke;
  v15[3] = &unk_1E2ADB340;
  v15[4] = self;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v14, "ingestCard:withCompletionHandler:", v13, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __72__PKContactlessCardIngester__ingestCardWithCardSessionToken_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13[2];
  _QWORD block[4];
  id v15;

  v5 = a2;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__PKContactlessCardIngester__ingestCardWithCardSessionToken_completion___block_invoke_2;
  v11[3] = &unk_1E2AC7F08;
  objc_copyWeak(v13, (id *)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 32);
  v13[1] = a3;
  v11[4] = v8;
  v12 = v5;
  v9 = v11;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_21;
  block[3] = &unk_1E2ABD9A0;
  v15 = v9;
  v10 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(v13);
}

void __72__PKContactlessCardIngester__ingestCardWithCardSessionToken_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  id v6;
  char v7;
  id v8;
  void (**v9)(void);
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[8])
  {
    objc_msgSend(*(id *)(a1 + 32), "_displayableErrorForSPStatusCode:seldError:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 56);
      v6 = objc_loadWeakRetained(v3 + 5);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained(v3 + 5);
        objc_msgSend(v8, "contactlessCardIngester:didFailToIngestCardWithError:resetProvisioning:isRecoverable:", v3, v4, v5 != 0, (*(_QWORD *)(a1 + 56) > 0xCuLL) | (0x103u >> *(_QWORD *)(a1 + 56)) & 1);

      }
    }
    else
    {
      v9 = (void (**)(void))v3[8];
      if (v9)
        v9[2]();
    }
    v10 = v3[8];
    v3[8] = 0;

  }
  if (*(_QWORD *)(a1 + 56) != -1)
  {
    v13 = CFSTR("code");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

- (void)readerModeCardSessionToken:(id)a3
{
  id v4;
  NSObject *contactlessCardIngesterQueue;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  contactlessCardIngesterQueue = self->_contactlessCardIngesterQueue;
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__PKContactlessCardIngester_readerModeCardSessionToken___block_invoke;
  v9[3] = &unk_1E2ABE0D0;
  v9[4] = self;
  v10 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_21;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  v8 = v4;
  dispatch_async(contactlessCardIngesterQueue, block);

}

uint64_t __56__PKContactlessCardIngester_readerModeCardSessionToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = 0;

  }
  return AnalyticsSendEvent();
}

- (void)readerModeCardIngestionStatus:(unint64_t)a3
{
  PKContactlessCardIngesterDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (a3 - 1 >= 0xC)
      a3 = 13;
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "contactlessCardIngester:didUpdateCardIngestionStatus:", self, a3);

  }
}

- (void)_stopListeningToRemoteAdminEvents
{
  void *v3;

  objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterEventListener:", self);

  self->_listening = 0;
}

- (void)_startListeningToRemoteAdminEventsIfRequired
{
  void *v3;

  if (!self->_listening)
  {
    objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerEventListener:", self);

    self->_listening = 1;
  }
}

- (id)_displayableErrorForSPStatusCode:(unint64_t)a3 seldError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSNumberFormatter *currencyNumberFormatter;
  void *v14;
  NSNumberFormatter *v15;
  NSNumberFormatter *v16;
  NSUInteger v17;
  uint64_t v18;
  void *v20;

  v6 = a4;
  PKLocalizedPaymentString(CFSTR("READER_MODE_ERROR_CARD_COULD_NOT_BE_ADDED_TITLE"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  switch(a3)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      if (v6)
      {
        if (objc_msgSend(v6, "code") == 4)
          goto LABEL_2;
        if (objc_msgSend(v6, "code") == 2)
          v10 = 2;
        else
          v10 = 1;
        PKDisplayableErrorForCommonType(v10, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
          break;
      }
      else
      {
        v8 = 0;
      }
      goto LABEL_23;
    case 0uLL:
      goto LABEL_23;
    case 1uLL:
      v9 = CFSTR("READER_MODE_INGEST_ERROR_CARD_READ_ERROR");
      goto LABEL_21;
    case 2uLL:
    case 3uLL:
    case 6uLL:
LABEL_2:
      v9 = CFSTR("READER_MODE_INGEST_ERROR_CARD_NOT_SUPPORTED_MESSAGE");
      goto LABEL_21;
    case 4uLL:
    case 5uLL:
      v9 = CFSTR("READER_MODE_INGEST_ERROR_CARD_INACTIVE");
      goto LABEL_21;
    case 7uLL:
      v9 = CFSTR("READER_MODE_INGEST_ERROR_CARD_INVALID");
      goto LABEL_21;
    case 8uLL:
      PKLocalizedPaymentString(CFSTR("READER_MODE_INGEST_ERROR_CARD_IN_TRANSIT_TITLE"), 0);
      v11 = objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("READER_MODE_INGEST_ERROR_CARD_IN_TRANSIT_MESSAGE"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)v11;
      break;
    case 9uLL:
      v9 = CFSTR("READER_MODE_INGEST_ERROR_SERVER_DOWN");
      goto LABEL_21;
    case 0xAuLL:
      -[PKPaymentProvisioningMethodMetadata minimumReaderModeBalance](self->_readerModeProvisioningMetadata, "minimumReaderModeBalance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        currencyNumberFormatter = self->_currencyNumberFormatter;
        if (!currencyNumberFormatter)
        {
          -[PKPaymentProvisioningMethodMetadata currency](self->_readerModeProvisioningMetadata, "currency");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          PKMutableNumberFormatterForCurrencyCode(v14);
          v15 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
          v16 = self->_currencyNumberFormatter;
          self->_currencyNumberFormatter = v15;

          if ((objc_msgSend(v12, "pk_isIntegralNumber") & 1) != 0)
            v17 = 0;
          else
            v17 = -[NSNumberFormatter maximumFractionDigits](self->_currencyNumberFormatter, "maximumFractionDigits");
          -[NSNumberFormatter setMinimumFractionDigits:](self->_currencyNumberFormatter, "setMinimumFractionDigits:", v17);
          currencyNumberFormatter = self->_currencyNumberFormatter;
        }
        -[NSNumberFormatter stringFromNumber:](currencyNumberFormatter, "stringFromNumber:", v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("READER_MODE_INGEST_ERROR_INSUFFICIENT_BALANCE_WITH_MINIMUM_FORMAT"), CFSTR("%@"), v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        PKLocalizedPaymentString(CFSTR("READER_MODE_INGEST_ERROR_INSUFFICIENT_BALANCE"), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

      break;
    case 0xBuLL:
      v9 = CFSTR("READER_MODE_INGEST_ERROR_EXPIRED");
      goto LABEL_21;
    case 0xCuLL:
      v9 = CFSTR("READER_MODE_INGEST_ERROR_RATE_LIMITED");
LABEL_21:
      PKLocalizedPaymentString(&v9->isa, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  PKDisplayableErrorCustomWithType(-1, v7, v8, 0, 0);
  v18 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v18;
LABEL_23:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disableCardCompletionHandler, 0);
  objc_storeStrong(&self->_cardSessionTokenCompletionHandler, 0);
  objc_storeStrong((id *)&self->_contactlessCardIngesterQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currencyNumberFormatter, 0);
  objc_storeStrong((id *)&self->_readerModeProvisioningMetadata, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
}

@end
