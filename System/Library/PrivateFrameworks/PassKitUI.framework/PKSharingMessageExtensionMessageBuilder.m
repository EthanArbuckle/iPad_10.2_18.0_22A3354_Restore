@implementation PKSharingMessageExtensionMessageBuilder

+ (void)messageFromConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  PKShareableCredentialMessage *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  uint8_t buf[16];

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PKShareableCredentialMessage);
  objc_msgSend(v6, "credentialsMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  if (v9 < 2)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ownerDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SHARE_ONE_SHAREABLE_CREDENTIAL_PASS_IMESSAGE_CAPTION"), CFSTR("%@"), v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PKLocalizedShareableCredentialString(CFSTR("SHARE_MULTIPLE_SHAREABLE_CREDENTIAL_PASS_IMESSAGE_CAPTION"), CFSTR("%lu"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PKShareableCredentialMessage setCaption:](v7, "setCaption:", v10);

  if ((PKHidePlaceholderImageIniMessage() & 1) != 0)
  {
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Not including imagine in iMessage because of rdar://61852456 (Always failed to send shared Pass through iMessage via Ven1)", buf, 2u);
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v8, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithCGImage:", objc_msgSend(v17, "passThumbnailImage"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKShareableCredentialMessage setPassThumbnailImage:](v7, "setPassThumbnailImage:", v18);

  }
  objc_msgSend(v8, "pk_arrayByApplyingBlock:", &__block_literal_global_55);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShareableCredentialMessage setShareableCredentials:](v7, "setShareableCredentials:", v19);
  v20 = objc_alloc_init(MEMORY[0x1E0CC6940]);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6938]), "initWithAlternateLayout:", v20);
  v22 = objc_alloc(MEMORY[0x1E0CC6930]);
  v23 = objc_alloc_init(MEMORY[0x1E0CC6948]);
  v24 = (void *)objc_msgSend(v22, "initWithSession:", v23);

  -[PKShareableCredentialMessage urlRepresentation](v7, "urlRepresentation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setURL:", v25);

  objc_msgSend(v24, "setRequiresValidation:", 1);
  objc_msgSend(v24, "setLayout:", v21);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PKSharingMessageExtensionMessageBuilder_messageFromConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_1E3E618A0;
  v29 = v24;
  v30 = v5;
  v26 = v24;
  v27 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

id __86__PKSharingMessageExtensionMessageBuilder_messageFromConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v2 = (objc_class *)MEMORY[0x1E0D67678];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v3, "cardConfigurationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCardConfigurationIdentifier:", v5);

  objc_msgSend(v3, "credentialIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCredentialIdentifier:", v6);

  objc_msgSend(v3, "credentialIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "SHA256Hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCredentialIdentifierHash:", v10);

  objc_msgSend(v3, "preview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ownerDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOwnerDisplayName:", v12);

  objc_msgSend(v3, "provisioningTarget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nonce");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNonce:", v14);

  objc_msgSend(v3, "sharingInstanceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSharingInstanceIdentifier:", v15);
  objc_msgSend(v4, "setStatus:", 1);
  return v4;
}

uint64_t __86__PKSharingMessageExtensionMessageBuilder_messageFromConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)messageFromInvitation:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a1, "messageFromInvitation:analyticsSessionToken:completionHandler:", a3, 0, a4);
}

+ (void)messageFromInvitation:(id)a3 analyticsSessionToken:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  PKSharingMessageExtensionRelayServerMessage *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  PKSharingMessageExtensionRelayServerLocalProperties *v18;
  uint64_t v19;
  PKSharingMessageExtensionRelayServerMessage *v20;
  id v21;
  void (**v22)(_QWORD);
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[16];
  _QWORD v30[4];
  PKSharingMessageExtensionRelayServerMessage *v31;
  void (**v32)(_QWORD);
  _QWORD aBlock[4];
  PKSharingMessageExtensionRelayServerMessage *v34;
  id v35;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "share");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0D676A0], "displayInformationForAccessPass:webService:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_alloc_init(PKSharingMessageExtensionRelayServerMessage);
  objc_msgSend(v12, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionCommonMessage setTitle:](v13, "setTitle:", v14);

  objc_msgSend(v12, "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionCommonMessage setSubtitle:](v13, "setSubtitle:", v15);

  v16 = objc_msgSend(v10, "status");
  if (v16)
    v17 = v16;
  else
    v17 = 3;
  -[PKSharingMessageExtensionRelayServerMessage setStatus:](v13, "setStatus:", v17);
  v18 = objc_alloc_init(PKSharingMessageExtensionRelayServerLocalProperties);
  -[PKSharingMessageExtensionRelayServerLocalProperties setPartialInvite:](v18, "setPartialInvite:", v7);
  -[PKSharingMessageExtensionRelayServerLocalProperties setAnalyticsSessionToken:](v18, "setAnalyticsSessionToken:", v9);

  -[PKSharingMessageExtensionRelayServerMessage setLocalProperties:](v13, "setLocalProperties:", v18);
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__PKSharingMessageExtensionMessageBuilder_messageFromInvitation_analyticsSessionToken_completionHandler___block_invoke;
  aBlock[3] = &unk_1E3E61850;
  v20 = v13;
  v34 = v20;
  v21 = v8;
  v35 = v21;
  v22 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((PKHidePlaceholderImageIniMessage() & 1) != 0)
  {
    PKLogFacilityTypeGetObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "Not including image in iMessage because of rdar://61852456 (Always failed to send shared Pass through iMessage via Ven1)", buf, 2u);
    }

    v22[2](v22);
  }
  else
  {
    objc_msgSend(v12, "imageURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v30[0] = v19;
      v30[1] = 3221225472;
      v30[2] = __105__PKSharingMessageExtensionMessageBuilder_messageFromInvitation_analyticsSessionToken_completionHandler___block_invoke_3;
      v30[3] = &unk_1E3E632B8;
      v31 = v20;
      v32 = v22;
      PKCommonCachedImageFromURL(v24, v30);

    }
    else
    {
      v28 = v11;
      v25 = (void *)MEMORY[0x1E0DC3870];
      PKPassKitUIBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "imageNamed:inBundle:", CFSTR("Generic-Shared-Key"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharingMessageExtensionCommonMessage setThumbnail:](v20, "setThumbnail:", v27);

      v11 = v28;
      v22[2](v22);
    }

  }
}

void __105__PKSharingMessageExtensionMessageBuilder_messageFromInvitation_analyticsSessionToken_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = objc_alloc_init(MEMORY[0x1E0CC6940]);
  objc_msgSend(*(id *)(a1 + 32), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCaption:", v3);

  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubcaption:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6938]), "initWithAlternateLayout:", v2);
  v6 = objc_alloc(MEMORY[0x1E0CC6930]);
  v7 = objc_alloc_init(MEMORY[0x1E0CC6948]);
  v8 = (void *)objc_msgSend(v6, "initWithSession:", v7);

  objc_msgSend(*(id *)(a1 + 32), "urlRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setURL:", v9);

  objc_msgSend(v8, "setRequiresValidation:", 1);
  objc_msgSend(v8, "setLayout:", v5);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __105__PKSharingMessageExtensionMessageBuilder_messageFromInvitation_analyticsSessionToken_completionHandler___block_invoke_2;
  v12[3] = &unk_1E3E618A0;
  v10 = *(id *)(a1 + 40);
  v13 = v8;
  v14 = v10;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __105__PKSharingMessageExtensionMessageBuilder_messageFromInvitation_analyticsSessionToken_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __105__PKSharingMessageExtensionMessageBuilder_messageFromInvitation_analyticsSessionToken_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  UIImage *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0D66DF8];
    v5 = a3;
    v6 = [v4 alloc];
    UIImagePNGRepresentation(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v6, "initWithData:scale:", v7, 3.0);
    objc_msgSend(MEMORY[0x1E0D66E08], "constraintsWithAspectFillToSize:", 242.0, 152.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOutputScale:", 3.0);
    objc_msgSend(v8, "resizedImageWithConstraints:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 32);
    v12 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(v10, "imageData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithData:scale:", v13, 3.0);
    objc_msgSend(v11, "setThumbnail:", v14);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)messageFromSharingRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  PKSubcredentialInvitationMessage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  PKSubcredentialInvitationMessage *v27;
  id v28;
  id v29;
  id v30;
  void (**v31)(_QWORD);
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  PKSubcredentialInvitationMessage *v42;
  void (**v43)(_QWORD);
  _QWORD aBlock[4];
  PKSubcredentialInvitationMessage *v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v37 = a4;
  v5 = a3;
  v6 = objc_alloc_init(PKSubcredentialInvitationMessage);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "hexEncoding");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialInvitationMessage setDataString:](v6, "setDataString:");
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "passWithUniqueID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "organizationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "length", v37);
    v15 = objc_msgSend(v11, "length");
    v16 = v15 + 1;
    if (v14 > v15 + 1)
    {
      v17 = v15;
      if (objc_msgSend(v13, "hasPrefix:", v11))
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", v17));

        if (v19)
        {
          objc_msgSend(v13, "substringFromIndex:", v16);
          v20 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v20;
        }
      }
    }
  }
  v21 = objc_alloc_init(MEMORY[0x1E0D66AA0]);
  objc_msgSend(v21, "setIssuer:", v11);
  objc_msgSend(v21, "setDeviceModel:", v13);
  objc_msgSend(v21, "setForWatch:", 0);
  -[PKSubcredentialInvitationMessage setPhoneInvitation:](v6, "setPhoneInvitation:", v21);
  PKLogFacilityTypeGetObject();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v21;
    _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "Compose message with invitation for phone: %@", buf, 0xCu);
  }

  v23 = objc_alloc_init(MEMORY[0x1E0D66AA0]);
  objc_msgSend(v23, "setIssuer:", v11);
  objc_msgSend(v23, "setDeviceModel:", v13);
  objc_msgSend(v21, "setForWatch:", 1);
  -[PKSubcredentialInvitationMessage setWatchInvitation:](v6, "setWatchInvitation:", v23);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v23;
    _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "Compose message with invitation for watch: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialInvitationMessage setUniqueIdentifier:](v6, "setUniqueIdentifier:", v25);

  v26 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKSharingMessageExtensionMessageBuilder_messageFromSharingRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E3E622D8;
  v27 = v6;
  v45 = v27;
  v28 = v11;
  v46 = v28;
  v29 = v13;
  v47 = v29;
  v30 = v37;
  v48 = v30;
  v31 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((PKHidePlaceholderImageIniMessage() & 1) != 0)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "Not including image in iMessage because of rdar://61852456 (Always failed to send shared Pass through iMessage via Ven1)", buf, 2u);
    }

    v31[2](v31);
  }
  else
  {
    +[PKHeroCardExplanationHeaderView recommendedCardImageSize](PKHeroCardExplanationHeaderView, "recommendedCardImageSize");
    v33 = v32;
    v35 = v34;
    +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v26;
    v40[1] = 3221225472;
    v40[2] = __87__PKSharingMessageExtensionMessageBuilder_messageFromSharingRequest_completionHandler___block_invoke_3;
    v40[3] = &unk_1E3E67AF0;
    v41 = v10;
    v42 = v27;
    v43 = v31;
    objc_msgSend(v36, "snapshotWithPass:size:completion:", v41, v40, v33, v35);

  }
}

void __87__PKSharingMessageExtensionMessageBuilder_messageFromSharingRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;

  v2 = objc_alloc_init(MEMORY[0x1E0CC6940]);
  PKPassKitCoreBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("SubcredentialMessageFallbackMedia"), CFSTR("png"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaFileURL:", v4);

  PKLocalizedCredentialString(CFSTR("CARKEY_NOT_SUPPORTED_BODY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCaption:", v5);

  PKLocalizedString(CFSTR("WALLET"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubcaption:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6938]), "initWithAlternateLayout:", v2);
  v8 = objc_alloc(MEMORY[0x1E0CC6930]);
  v9 = objc_alloc_init(MEMORY[0x1E0CC6948]);
  v10 = (void *)objc_msgSend(v8, "initWithSession:", v9);

  objc_msgSend(*(id *)(a1 + 32), "urlRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setURL:", v11);

  objc_msgSend(v10, "setRequiresValidation:", 1);
  objc_msgSend(v10, "setLayout:", v7);
  PKLocalizedCredentialString(CFSTR("CARKEY_ACCESSIBILITY_SUBCREDENTIAL_LABEL"), CFSTR("%@%@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v12);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKSharingMessageExtensionMessageBuilder_messageFromSharingRequest_completionHandler___block_invoke_2;
  block[3] = &unk_1E3E618A0;
  v13 = *(id *)(a1 + 56);
  v16 = v10;
  v17 = v13;
  v14 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __87__PKSharingMessageExtensionMessageBuilder_messageFromSharingRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __87__PKSharingMessageExtensionMessageBuilder_messageFromSharingRequest_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Finished snapshotting pass %@ with resulting snapshot %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setPassThumbnailImage:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)messageURLFromSharingRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__PKSharingMessageExtensionMessageBuilder_messageURLFromSharingRequest_completionHandler___block_invoke;
  v8[3] = &unk_1E3E67B18;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "messageFromSharingRequest:completionHandler:", a3, v8);

}

void __90__PKSharingMessageExtensionMessageBuilder_messageURLFromSharingRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "URL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

@end
