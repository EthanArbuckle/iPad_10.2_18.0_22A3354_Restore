@implementation SFRemoteAutoFillScanAction

+ (void)actionForURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SFRemoteAutoFillScanAction_actionForURL_completion___block_invoke;
  v9[3] = &unk_1E482DFC8;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __54__SFRemoteAutoFillScanAction_actionForURL_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  SFRemoteAutoFillScanAction *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SFRemoteAutoFillScanAction *v8;
  SFRemoteAutoFillScanAction *v9;

  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("https://autofill.apple.com/"));

  if (v3)
  {
    if (gLogCategory_SFRemoteAutoFillScanAction <= 50
      && (gLogCategory_SFRemoteAutoFillScanAction != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = objc_alloc_init(SFRemoteAutoFillScanAction);
    SFLocalizedStringForKey(CFSTR("PROX_AUTOFILL_QR_MESSAGE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRemoteAutoFillScanAction setMessage:](v8, "setMessage:", v5);

    SFLocalizedStringForKey(CFSTR("PROX_AUTOFILL_QR_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRemoteAutoFillScanAction setTitle:](v8, "setTitle:", v6);

    -[SFRemoteAutoFillScanAction setUrl:](v8, "setUrl:", *(_QWORD *)(a1 + 32));
    v4 = v8;
  }
  else
  {
    v4 = 0;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v9 = v4;
    (*(void (**)(uint64_t))(v7 + 16))(v7);
    v4 = v9;
  }

}

- (void)performWithCompletion:(id)a3
{
  id v4;
  SFClient *v5;
  NSURL *url;
  SFClient *v7;
  id v8;
  _QWORD v9[4];
  SFClient *v10;
  id v11;

  v4 = a3;
  if (gLogCategory_SFRemoteAutoFillScanAction <= 50
    && (gLogCategory_SFRemoteAutoFillScanAction != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = objc_alloc_init(SFClient);
  url = self->_url;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__SFRemoteAutoFillScanAction_performWithCompletion___block_invoke;
  v9[3] = &unk_1E482FB00;
  v10 = v5;
  v11 = v4;
  v7 = v5;
  v8 = v4;
  -[SFClient triggerProximityAutoFillDetectedWithURL:completion:](v7, "triggerProximityAutoFillDetectedWithURL:completion:", url, v9);

}

void __52__SFRemoteAutoFillScanAction_performWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    if (gLogCategory_SFRemoteAutoFillScanAction <= 60
      && (gLogCategory_SFRemoteAutoFillScanAction != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_SFRemoteAutoFillScanAction <= 50
         && (gLogCategory_SFRemoteAutoFillScanAction != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
