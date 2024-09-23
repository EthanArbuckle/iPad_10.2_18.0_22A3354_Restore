@implementation PKPaymentDocumentSubmissionController

- (PKPaymentDocumentSubmissionController)initWithSetupDelegate:(id)a3 context:(int64_t)a4 acceptableDocuments:(id)a5 featureIdentifier:(unint64_t)a6 localizationBundle:(id)a7 preferredLanguage:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PKPaymentDocumentSubmissionController *v18;
  PKPaymentDocumentSubmissionController *v19;
  NSBundle *v20;
  NSBundle *localizationBundle;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id *p_selectedDocument;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  int v34;
  id v35;
  id v37;
  id v38;
  id v39;
  PKPaymentDocumentSubmissionController *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = -[PKPaymentDocumentSubmissionController init](self, "init");
  v19 = v18;
  if (v18)
  {
    v18->_context = a4;
    v18->_featureIdentifier = a6;
    objc_storeWeak((id *)&v18->_setupDelegate, v14);
    v39 = v14;
    v37 = v16;
    if (v16)
    {
      v20 = (NSBundle *)v16;
    }
    else
    {
      PKPassKitBundle();
      v20 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    }
    localizationBundle = v19->_localizationBundle;
    v19->_localizationBundle = v20;

    v40 = v19;
    objc_storeStrong((id *)&v19->_preferredLanguage, a8);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v38 = v15;
    v22 = v15;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v42;
      p_selectedDocument = (id *)&v19->_selectedDocument;
LABEL_7:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v25)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v27);
        objc_msgSend(v28, "countryCode");
        v29 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29 == CFSTR("USA")
          || v29
          && ((v31 = objc_msgSend(CFSTR("USA"), "isEqualToString:", v29), v30, (v31 & 1) != 0)
           || (v32 = v30, v32 == CFSTR("US"))
           || (v33 = v32, v34 = objc_msgSend(CFSTR("US"), "isEqualToString:", v32), v33, v34)))
        {
          if ((unint64_t)(objc_msgSend(v28, "documentType") - 1) <= 1)
            objc_storeStrong(p_selectedDocument, v28);
        }
        v35 = *p_selectedDocument;

        if (v35)
          break;
        if (v24 == ++v27)
        {
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          if (v24)
            goto LABEL_7;
          break;
        }
      }
    }

    v14 = v39;
    v19 = v40;
    v16 = v37;
    v15 = v38;
    if (!v40->_selectedDocument)
      -[PKPaymentDocumentSubmissionController setState:](v40, "setState:", 1);
  }

  return v19;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  if (!a3)
  {
    -[PKPaymentDocumentSubmissionController setFrontID:](self, "setFrontID:");
    -[PKPaymentDocumentSubmissionController setBackID:](self, "setBackID:", 0);
    -[PKPaymentDocumentSubmissionController setSide:](self, "setSide:", 0);
  }
}

- (id)nextViewController
{
  unint64_t state;
  void *v3;

  state = self->_state;
  if (state <= 0xA && ((0x77Fu >> state) & 1) != 0)
    v3 = (void *)objc_msgSend(objc_alloc(*off_1E3E74D80[state]), "initWithController:context:featureIdentifier:", self, self->_context, self->_featureIdentifier);
  else
    v3 = 0;
  return v3;
}

- (void)capturedImage:(id)a3
{
  id v4;
  void *v5;
  int64_t side;
  id v7;

  v4 = a3;
  v5 = v4;
  if (self->_state == 2)
  {
    self->_state = 3;
    side = self->_side;
    v7 = v4;
    if (side == 1)
    {
      -[PKPaymentDocumentSubmissionController setBackID:](self, "setBackID:", v4);
    }
    else
    {
      if (side)
      {
LABEL_7:
        -[PKPaymentDocumentSubmissionController stateChanged](self, "stateChanged");
        v5 = v7;
        goto LABEL_8;
      }
      -[PKPaymentDocumentSubmissionController setFrontID:](self, "setFrontID:", v4);
    }
    v5 = v7;
    if (self->_state != 2)
      goto LABEL_7;
  }
LABEL_8:

}

- (void)userWantsToContinue
{
  if (!self->_state)
  {
    self->_state = 2;
    -[PKPaymentDocumentSubmissionController stateChanged](self, "stateChanged");
  }
}

- (void)userApprovedCapturedID
{
  int64_t side;
  uint64_t v4;

  if (self->_state == 3)
  {
    side = self->_side;
    if (side == 1)
      goto LABEL_7;
    if (side)
      return;
    v4 = -[PKDocumentRequest documentType](self->_selectedDocument, "documentType");
    if ((unint64_t)(v4 - 1) < 2)
    {
      *(_OWORD *)&self->_state = xmmword_19DF17370;
LABEL_10:
      -[PKPaymentDocumentSubmissionController stateChanged](self, "stateChanged");
      return;
    }
    if (!v4)
LABEL_7:
      -[PKPaymentDocumentSubmissionController uploadID](self, "uploadID");
    if (self->_state != 3)
      goto LABEL_10;
  }
}

- (void)userRejectedCapturedID
{
  int64_t side;

  if (self->_state == 3)
  {
    PKAnalyticsSendEventForFeature();
    self->_state = 2;
    side = self->_side;
    if (side == 1)
    {
      -[PKPaymentDocumentSubmissionController setBackID:](self, "setBackID:", 0);
    }
    else
    {
      if (side)
        goto LABEL_8;
      -[PKPaymentDocumentSubmissionController setFrontID:](self, "setFrontID:", 0);
    }
    if (self->_state == 3)
      return;
LABEL_8:
    -[PKPaymentDocumentSubmissionController stateChanged](self, "stateChanged");
  }
}

- (void)captureFailedWithError:(id)a3
{
  int64_t state;

  state = self->_state;
  self->_state = 4;
  if (state != 4)
    -[PKPaymentDocumentSubmissionController stateChanged](self, "stateChanged", a3);
}

- (void)scanAgain
{
  int64_t state;

  state = self->_state;
  -[PKPaymentDocumentSubmissionController setFrontID:](self, "setFrontID:", 0);
  -[PKPaymentDocumentSubmissionController setBackID:](self, "setBackID:", 0);
  *(_OWORD *)&self->_state = xmmword_19DEE2040;
  if (state != 2)
    -[PKPaymentDocumentSubmissionController stateChanged](self, "stateChanged");
}

- (void)uploadID
{
  -[PKPaymentDocumentSubmissionController setState:](self, "setState:", 6);
}

- (void)tryUploadAgain
{
  int64_t state;

  state = self->_state;
  -[PKPaymentDocumentSubmissionController uploadID](self, "uploadID");
  if (state != self->_state)
    -[PKPaymentDocumentSubmissionController stateChanged](self, "stateChanged");
}

- (void)userWantsToCancel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PKPaymentDocumentSubmissionController_userWantsToCancel__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __58__PKPaymentDocumentSubmissionController_userWantsToCancel__block_invoke(uint64_t a1)
{
  char v2;
  id *v3;
  id v4;
  id WeakRetained;

  PKAnalyticsSendEventForFeature();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  v2 = objc_opt_respondsToSelector();
  v3 = *(id **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained(v3 + 3);
    objc_msgSend(WeakRetained, "viewControllerDidCancelSetupFlow:", v4);

  }
  else
  {
    objc_msgSend(v3, "terminateSetupFlow");
  }

}

- (void)terminateSetupFlow
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PKPaymentDocumentSubmissionController_terminateSetupFlow__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __59__PKPaymentDocumentSubmissionController_terminateSetupFlow__block_invoke(uint64_t a1)
{
  char v2;
  id v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  v2 = objc_opt_respondsToSelector();
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = v3;
  if ((v2 & 1) != 0)
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", v3);
  else
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)stateChanged
{
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  PKPaymentDocumentSubmissionController *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__PKPaymentDocumentSubmissionController_stateChanged__block_invoke;
    v4[3] = &unk_1E3E61388;
    v5 = WeakRetained;
    v6 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __53__PKPaymentDocumentSubmissionController_stateChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "captureController:didChangeStateTo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)side
{
  return self->_side;
}

- (void)setSide:(int64_t)a3
{
  self->_side = a3;
}

- (PKPaymentDocumentSubmissionControllerDelegate)delegate
{
  return (PKPaymentDocumentSubmissionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKDocumentRequest)selectedDocument
{
  return self->_selectedDocument;
}

- (void)setSelectedDocument:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDocument, a3);
}

- (UIImage)frontID
{
  return self->_frontID;
}

- (void)setFrontID:(id)a3
{
  objc_storeStrong((id *)&self->_frontID, a3);
}

- (UIImage)backID
{
  return self->_backID;
}

- (void)setBackID:(id)a3
{
  objc_storeStrong((id *)&self->_backID, a3);
}

- (NSBundle)localizationBundle
{
  return self->_localizationBundle;
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_localizationBundle, 0);
  objc_storeStrong((id *)&self->_backID, 0);
  objc_storeStrong((id *)&self->_frontID, 0);
  objc_storeStrong((id *)&self->_selectedDocument, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
