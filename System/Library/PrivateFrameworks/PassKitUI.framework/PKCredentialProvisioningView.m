@implementation PKCredentialProvisioningView

- (PKCredentialProvisioningView)initWithContext:(id)a3
{
  id v5;
  PKCredentialProvisioningView *v6;
  PKCredentialProvisioningView *v7;
  id *p_context;
  void *v9;
  char v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  NSString *templateIdentifier;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PKCredentialPairingExplanationHeaderView *v24;
  void *v25;
  PKCredentialPairingExplanationHeaderView *v26;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKCredentialProvisioningView;
  v6 = -[PKProvisioningProgressView init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    p_context = (id *)&v6->_context;
    objc_storeStrong((id *)&v6->_context, a3);
    objc_msgSend(*p_context, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportedRadioTechnologies");

    v7->_supportsUWB = (v10 & 2) >> 1;
    if ((v10 & 2) != 0)
      v11 = CFSTR("CAR_KEY_PAIRING_UWB_BODY");
    else
      v11 = CFSTR("CAR_KEY_PAIRING_BODY");
    objc_msgSend(*p_context, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "provisioningTemplateIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    templateIdentifier = v7->_templateIdentifier;
    v7->_templateIdentifier = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "provisioningString:templateIdentifier:", CFSTR("CAR_KEY_PAIRING_PROGRESS_TITLE"), v7->_templateIdentifier);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[PKProvisioningProgressView setPrimaryText:](v7, "setPrimaryText:", v16);
    }
    else
    {
      PKLocalizedCredentialString(CFSTR("CAR_KEY_PAIRING_PROGRESS_TITLE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKProvisioningProgressView setPrimaryText:](v7, "setPrimaryText:", v17);

    }
    -[PKProvisioningProgressView secondaryLabel](v7, "secondaryLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "provisioningString:templateIdentifier:", v11, v7->_templateIdentifier);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v18, "setText:", v19);
    }
    else
    {
      PKLocalizedCredentialString(&v11->isa);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setText:", v20);

    }
    -[PKProvisioningProgressView progressLabel](v7, "progressLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "provisioningString:templateIdentifier:", CFSTR("CAR_KEY_PAIRING_CONNECTING"), v7->_templateIdentifier);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v21, "setText:", v22);
    }
    else
    {
      PKLocalizedCredentialString(CFSTR("CAR_KEY_PAIRING_CONNECTING"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setText:", v23);

    }
    v24 = [PKCredentialPairingExplanationHeaderView alloc];
    objc_msgSend(*p_context, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PKCredentialPairingExplanationHeaderView initWithConfiguration:](v24, "initWithConfiguration:", v25);
    -[PKProvisioningProgressView setHeaderView:](v7, "setHeaderView:", v26);

  }
  return v7;
}

- (void)setState:(int64_t)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (self->_state != a3)
  {
    self->_state = a3;
    -[PKProvisioningProgressView progressView](self, "progressView");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[PKProvisioningProgressView progressLabel](self, "progressLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    switch(a3)
    {
      case 0:
        objc_msgSend(v5, "setText:", 0);
        break;
      case 2:
      case 5:
      case 6:
      case 8:
        LODWORD(v6) = 0;
        objc_msgSend(v17, "setProgress:", v6);
        objc_msgSend(v17, "setHidden:", 0);
        objc_msgSend(v7, "setHidden:", 0);
        break;
      case 7:
        objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "provisioningString:templateIdentifier:", CFSTR("CAR_KEY_PAIRING_PROGRESS"), self->_templateIdentifier);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v7, "setText:", v9);
        }
        else
        {
          PKLocalizedCredentialString(CFSTR("CAR_KEY_PAIRING_PROGRESS"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setText:", v15);

        }
        LODWORD(v10) = 0.75;
        if (!self->_supportsUWB)
          *(float *)&v10 = 0.5;
        v11 = 15.0;
        if (!self->_supportsUWB)
          v11 = 3.0;
        goto LABEL_17;
      case 11:
        v10 = 5.0;
        v11 = 2.0;
        if (self->_supportsUWB)
          v11 = 5.0;
        LODWORD(v10) = 1065017672;
LABEL_17:
        objc_msgSend(v17, "_setProgressAnimated:duration:delay:options:", 196612, v10, v11, 0.0);
        break;
      case 16:
        LODWORD(v6) = 1.0;
        objc_msgSend(v17, "_setProgressAnimated:duration:delay:options:", 196612, v6, 0.5, 0.0);
        -[PKProvisioningProgressView secondaryLabel](self, "secondaryLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "provisioningString:templateIdentifier:", CFSTR("CAR_KEY_PAIRING_FINISHED_BODY"), self->_templateIdentifier);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v12, "setText:", v14);
        }
        else
        {
          PKLocalizedCredentialString(CFSTR("CAR_KEY_PAIRING_FINISHED_BODY"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setText:", v16);

        }
        break;
      default:
        break;
    }

  }
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
