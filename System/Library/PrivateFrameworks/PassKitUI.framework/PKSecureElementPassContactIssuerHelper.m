@implementation PKSecureElementPassContactIssuerHelper

- (void)setPass:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  objc_storeStrong((id *)&self->_pass, a3);
  -[PKSecureElementPass devicePaymentApplications](self->_pass, "devicePaymentApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v11, "automaticSelectionCriteria", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
LABEL_8:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "type");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          self->_isAppleAccess = PKEqualObjects();

          if (self->_isAppleAccess)
            break;
          if (v14 == ++v16)
          {
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v14)
              goto LABEL_8;
            break;
          }
        }
      }

      if (self->_isAppleAccess)
        break;
      if (++v10 == v8)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)presentContactViewController:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  id v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  unint64_t v18;
  unsigned int v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id WeakRetained;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[6];

  v5 = PKUserInterfaceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  -[PKSecureElementPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADD8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSecureElementPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSecureElementPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADF0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSecureElementPass businessChatIdentifier](self->_pass, "businessChatIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSecureElementPass organizationName](self->_pass, "organizationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "length") != 0;
  v46 = v8;
  if (-[PKSecureElementPass hasAssociatedPeerPaymentAccount](self->_pass, "hasAssociatedPeerPaymentAccount"))
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_CONTACT_NAME"));
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (id)v11;
LABEL_6:

    v9 = v12;
    goto LABEL_7;
  }
  if (self->_featureIdentifier)
  {
    PKLocalizedFeatureString();
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (self->_isAppleAccess && -[PKSecureElementPass isAccessPass](self->_pass, "isAccessPass"))
  {
    -[PKSecureElementPass fieldForKey:](self->_pass, "fieldForKey:", *MEMORY[0x1E0D6ADE0]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "value");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    if (v41)
      v43 = (void *)v41;
    else
      v43 = v9;
    v12 = v43;

    v8 = v46;
    v9 = v40;
    goto LABEL_6;
  }
LABEL_7:
  v13 = a3 & v10;
  PKLocalizedPaymentString(CFSTR("CONTACT_ISSUER"), CFSTR("%@"), v9);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (v5 && ((v13 ^ 1) & 1) == 0)
  {
    -[PKSecureElementPass organizationName](self->_pass, "organizationName");
    v15 = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("CONTACT_ISSUER_BY_PHONE_MESSAGE"), CFSTR("%1$@%2$@"), v16, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v15;
  }
  v44 = v7;
  if (v5)
    v17 = 0;
  else
    v17 = v13;
  if (v6 && objc_msgSend(v6, "length"))
    v18 = (a3 >> 1) & 1;
  else
    LODWORD(v18) = 0;
  v45 = v6;
  if (v8)
  {
    if (objc_msgSend(v8, "length"))
      v19 = (a3 >> 2) & 1;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = 0;
  if ((a3 & 8) != 0 && v47)
    v20 = +[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat");
  if (v5)
    v21 = v18 + (unint64_t)v17 + v19 == v20 << 63 >> 63;
  else
    v21 = 0;
  v22 = v21;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v48, v14, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v24 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("CALL"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke;
    v52[3] = &unk_1E3E61D68;
    v52[4] = self;
    objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 0, v52);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v26);

    if (!(_DWORD)v18)
      goto LABEL_33;
  }
  else if (!(_DWORD)v18)
  {
LABEL_33:
    if (v19)
      goto LABEL_34;
    goto LABEL_38;
  }
  v30 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("EMAIL"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke_2;
  v51[3] = &unk_1E3E61D68;
  v51[4] = self;
  objc_msgSend(v30, "actionWithTitle:style:handler:", v31, 0, v51);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v32);

  if (v19)
  {
LABEL_34:
    v27 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("GO_TO_WEBSITE"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke_3;
    v50[3] = &unk_1E3E61D68;
    v50[4] = self;
    objc_msgSend(v27, "actionWithTitle:style:handler:", v28, 0, v50);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v29);

    if (!(_DWORD)v20)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_38:
  if ((_DWORD)v20)
  {
LABEL_39:
    v33 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("MESSAGE"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke_4;
    v49[3] = &unk_1E3E61D68;
    v49[4] = self;
    objc_msgSend(v33, "actionWithTitle:style:handler:", v34, 0, v49);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v35);

  }
LABEL_40:
  v36 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("CANCEL"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "actionWithTitle:style:handler:", v37, 1, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v38);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "contactIssuerHelper:didRequestPresentViewController:animated:completion:", self, v23, 1, 0);

}

uint64_t __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callIssuer");
}

uint64_t __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "emailIssuer");
}

uint64_t __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openIssuerWebsite");
}

uint64_t __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)callIssuer
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  PKSecureElementPassContactIssuerHelper *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  id v34;
  char *v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _QWORD v50[4];

  v50[1] = *MEMORY[0x1E0C80C00];
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v34 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "contactIssuerHelper:didRequestPresentViewController:animated:completion:", self, v34, 1, 0);

    return;
  }
  if (PKUserInterfaceIdiomSupportsLargeLayouts())
  {
    -[PKSecureElementPassContactIssuerHelper presentContactViewController:](self, "presentContactViewController:", 1);
    return;
  }
  -[PKSecureElementPass organizationName](self->_pass, "organizationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3990];
  v50[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appearanceWhenContainedInInstancesOfClasses:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 2);

  -[PKSecureElementPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E0DC3448];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __52__PKSecureElementPassContactIssuerHelper_callIssuer__block_invoke;
    v46[3] = &unk_1E3E61D68;
    v47 = v9;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v47, 0, v46);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v12);

  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v30 = self;
  -[PKSecureElementPass backFieldBuckets](self->_pass, "backFieldBuckets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v43;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v43 != v32)
          objc_enumerationMutation(obj);
        v35 = v13;
        v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v13);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v39 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              if (objc_msgSend(v20, "dataDetectorTypes") == 1)
              {
                objc_msgSend(v20, "label");
                v21 = (id)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v20, "value");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21)
                  v23 = v22 == 0;
                else
                  v23 = 1;
                if (v23)
                {
                  if (!v21)
                  {
                    v21 = v22;
                    if (!v21)
                    {
LABEL_25:
                      v4 = 0;
                      v10 = v22;
                      continue;
                    }
                  }
                }
                else
                {
                  objc_msgSend(v21, "stringByAppendingFormat:", CFSTR("\n%@"), v22);
                  v24 = objc_claimAutoreleasedReturnValue();

                  v21 = (id)v24;
                  if (!v24)
                    goto LABEL_25;
                }
                v25 = (void *)MEMORY[0x1E0DC3448];
                v36[0] = MEMORY[0x1E0C809B0];
                v36[1] = 3221225472;
                v36[2] = __52__PKSecureElementPassContactIssuerHelper_callIssuer__block_invoke_2;
                v36[3] = &unk_1E3E61D68;
                v10 = v22;
                v37 = v10;
                objc_msgSend(v25, "actionWithTitle:style:handler:", v21, 0, v36);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "addAction:", v26);

                v4 = v21;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
          }
          while (v17);
        }

        v13 = v35 + 1;
      }
      while (v35 + 1 != (char *)v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v33);
  }

  PKLocalizedString(CFSTR("REMOVE_SHEET_CANCEL"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v27, 1, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v28);

  v29 = objc_loadWeakRetained((id *)&v30->_delegate);
  objc_msgSend(v29, "contactIssuerHelper:didRequestPresentViewController:animated:completion:", v30, v5, 1, 0);

}

void __52__PKSecureElementPassContactIssuerHelper_callIssuer__block_invoke()
{
  void *v0;
  id v1;

  PKTelephoneURLFromPhoneNumber();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

void __52__PKSecureElementPassContactIssuerHelper_callIssuer__block_invoke_2()
{
  void *v0;
  id v1;

  PKTelephoneURLFromPhoneNumber();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

- (void)openIssuerWebsite
{
  void *WeakRetained;
  void *v4;
  id v5;

  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "contactIssuerHelper:didRequestPresentViewController:animated:completion:", self, v5, 1, 0);
  }
  else
  {
    -[PKSecureElementPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADF0]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "openURL:configuration:completionHandler:", WeakRetained, 0, 0);

    }
  }

}

- (void)emailIssuer
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "contactIssuerHelper:didRequestPresentViewController:animated:completion:", self, v12, 1, 0);

  }
  else if (-[objc_class canSendMail](getMFMailComposeViewControllerClass_0(), "canSendMail"))
  {
    v4 = objc_alloc_init(getMFMailComposeViewControllerClass_0());
    objc_msgSend(v4, "setMailComposeDelegate:", self);
    -[PKSecureElementPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADD8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setToRecipients:", v6);

    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "contactIssuerHelper:didRequestPresentViewController:animated:completion:", self, v4, 1, 0);

  }
  else
  {
    -[PKSecureElementPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADD8]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mailto:%@"), v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "openURL:configuration:completionHandler:", v11, 0, 0);

    }
  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "contactIssuerHelper:didRequestDismissViewControllerAnimated:completion:", self, 1, 0);

}

- (PKSecureElementPassContactIssuerHelperDelegate)delegate
{
  return (PKSecureElementPassContactIssuerHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (id)openBusinessChatHandler
{
  return self->_openBusinessChatHandler;
}

- (void)setOpenBusinessChatHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_openBusinessChatHandler, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
