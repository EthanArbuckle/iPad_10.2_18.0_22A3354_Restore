@implementation PXContentSyndicationAttributionInfo

- (PXContentSyndicationAttributionInfo)initWithAsset:(id)a3
{
  id v6;
  PXContentSyndicationAttributionInfo *v7;
  PXContentSyndicationAttributionInfo *v8;
  uint64_t v9;
  PXContentSyndicationPhotoKitSocialLayerHighlightProvider *highlightProvider;
  uint64_t v11;
  NSString *axDescriptionForSyndicationLoadingIndicator;
  PXContentSyndicationPhotoKitSocialLayerHighlightProvider *v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationAttributionInfo.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v20.receiver = self;
  v20.super_class = (Class)PXContentSyndicationAttributionInfo;
  v7 = -[PXContentSyndicationAttributionInfo init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_asset, a3);
    if ((objc_msgSend(v6, "px_isSyndicatedAsset") & 1) != 0
      || objc_msgSend(v6, "px_wasSavedThroughSyndication"))
    {
      if (objc_msgSend(v6, "px_canLoadSyndicationAttributionInfo"))
      {
        +[PXContentSyndicationPhotoKitSocialLayerHighlightProvider sharedInstance](PXContentSyndicationPhotoKitSocialLayerHighlightProvider, "sharedInstance");
        v9 = objc_claimAutoreleasedReturnValue();
        highlightProvider = v8->_highlightProvider;
        v8->_highlightProvider = (PXContentSyndicationPhotoKitSocialLayerHighlightProvider *)v9;

        v8->_syndicationAttributionInfoIsLoading = 1;
        PXLocalizedStringFromTable(CFSTR("AX_LABEL_SYNDICATION_ATTRIBUTION_LOADING"), CFSTR("PhotosUICore"));
        v11 = objc_claimAutoreleasedReturnValue();
        axDescriptionForSyndicationLoadingIndicator = v8->_axDescriptionForSyndicationLoadingIndicator;
        v8->_axDescriptionForSyndicationLoadingIndicator = (NSString *)v11;

        objc_initWeak(&location, v8);
        v13 = v8->_highlightProvider;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __53__PXContentSyndicationAttributionInfo_initWithAsset___block_invoke;
        v17[3] = &unk_1E511CEE0;
        objc_copyWeak(&v18, &location);
        -[PXContentSyndicationPhotoKitSocialLayerHighlightProvider fetchSocialLayerHighlightForAsset:completion:](v13, "fetchSocialLayerHighlightForAsset:completion:", v6, v17);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v8;
}

- (NSString)syndicationSenderDisplayName
{
  NSString *syndicationSenderDisplayName;
  void *v4;
  __CFString *v5;
  NSString *v6;

  syndicationSenderDisplayName = self->_syndicationSenderDisplayName;
  if (!syndicationSenderDisplayName)
  {
    -[PXContentSyndicationAttributionInfo contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "_nameStringForContact:", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = &stru_1E5149688;
    }
    v6 = self->_syndicationSenderDisplayName;
    self->_syndicationSenderDisplayName = &v5->isa;

    syndicationSenderDisplayName = self->_syndicationSenderDisplayName;
  }
  return syndicationSenderDisplayName;
}

- (NSString)senderAppName
{
  NSString *senderAppName;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  senderAppName = self->_senderAppName;
  if (!senderAppName)
  {
    -[PXContentSyndicationAttributionInfo asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syndicatedAppDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_senderAppName;
    self->_senderAppName = v6;

    senderAppName = self->_senderAppName;
  }
  return senderAppName;
}

- (NSAttributedString)syndicationSharedWithInMessagesAttributedTitle
{
  NSAttributedString *syndicationSharedWithInMessagesAttributedTitle;
  void *v4;
  void *v5;
  NSAttributedString *v6;
  NSAttributedString *v7;
  void *v9;

  syndicationSharedWithInMessagesAttributedTitle = self->_syndicationSharedWithInMessagesAttributedTitle;
  if (!syndicationSharedWithInMessagesAttributedTitle)
  {
    PXLocalizedStringFromTable(CFSTR("SYNDICATION_ATTRIBUTION_SHARED_WITH_YOU_IN_MESSAGES"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationAttributionInfo syndicationSenderDisplayName](self, "syndicationSenderDisplayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringWithValidatedFormat(v4, CFSTR("%@"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXContentSyndicationAttributionInfo _applyAttributesToTitle:](PXContentSyndicationAttributionInfo, "_applyAttributesToTitle:", v5, v9);
    v6 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_syndicationSharedWithInMessagesAttributedTitle;
    self->_syndicationSharedWithInMessagesAttributedTitle = v6;

    syndicationSharedWithInMessagesAttributedTitle = self->_syndicationSharedWithInMessagesAttributedTitle;
  }
  return syndicationSharedWithInMessagesAttributedTitle;
}

- (NSAttributedString)savedFromTitle
{
  NSAttributedString *savedFromTitle;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSAttributedString *v10;
  NSAttributedString *v11;
  NSAttributedString *v12;
  void *v14;

  savedFromTitle = self->_savedFromTitle;
  if (!savedFromTitle)
  {
    -[PXContentSyndicationAttributionInfo senderAppName](self, "senderAppName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationAttributionInfo _sfaAttributes](self, "_sfaAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      PXLocalizedStringFromTable(CFSTR("ATTRIBUTION_SAVED_FROM_APP"), CFSTR("PhotosUICore"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_stringConvertedToHTMLString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringWithValidatedFormat(v6, CFSTR("%@"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3778], "px_attributedStringWithHTMLString:defaultAttributes:", v7, v5, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXContentSyndicationAttributionInfo _updateAppNameColorForAttributedString:defaultFontValue:](self, "_updateAppNameColorForAttributedString:defaultFontValue:", v8, v9);

      v10 = (NSAttributedString *)objc_msgSend(v8, "copy");
      v11 = self->_savedFromTitle;
      self->_savedFromTitle = v10;

    }
    else
    {
      PXLocalizedStringFromTable(CFSTR("ATTRIBUTION_SAVED_FROM"), CFSTR("PhotosUICore"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v5);
      v8 = self->_savedFromTitle;
      self->_savedFromTitle = v12;
    }

    savedFromTitle = self->_savedFromTitle;
  }
  return savedFromTitle;
}

- (UIImage)senderThumbnailImage
{
  UIImage *senderThumbnailImage;
  void *v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  senderThumbnailImage = self->_senderThumbnailImage;
  if (!senderThumbnailImage)
  {
    -[PXContentSyndicationAttributionInfo contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ThumbnailImageDataFromAttributionContact(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v5);
      v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v7 = self->_senderThumbnailImage;
      self->_senderThumbnailImage = v6;

    }
    senderThumbnailImage = self->_senderThumbnailImage;
  }
  return senderThumbnailImage;
}

- (void)fetchAppIconThumbnailImageWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PXContentSyndicationAttributionInfo senderAppName](self, "senderAppName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PXContentSyndicationAttributionInfo createSyndicatedAppIconWithSize:scale:completion:](self, "createSyndicatedAppIconWithSize:scale:completion:", v5, 32.0, 32.0, 3.0);

}

- (void)createSyndicatedAppIconWithSize:(CGSize)a3 scale:(double)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  CGFloat v19;
  CGFloat v20;
  double v21;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  -[PXContentSyndicationAttributionInfo asset](self, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "curationProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "importedByBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXContentSyndicationAttributionInfo appIconFetchQueue](PXContentSyndicationAttributionInfo, "appIconFetchQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PXContentSyndicationAttributionInfo_createSyndicatedAppIconWithSize_scale_completion___block_invoke;
  block[3] = &unk_1E511CF08;
  v19 = width;
  v20 = height;
  v21 = a4;
  v17 = v12;
  v18 = v9;
  v14 = v9;
  v15 = v12;
  dispatch_async(v13, block);

}

- (NSString)syndicationAttributionIdentifier
{
  NSString *syndicationAttributionIdentifier;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  syndicationAttributionIdentifier = self->_syndicationAttributionIdentifier;
  if (!syndicationAttributionIdentifier)
  {
    -[PXContentSyndicationAttributionInfo highlight](self, "highlight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = -[NSObject copy](v7, "copy");
      v9 = self->_syndicationAttributionIdentifier;
      self->_syndicationAttributionIdentifier = v8;

    }
    else
    {
      PLSyndicationUIGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[PXContentSyndicationAttributionInfo asset](self, "asset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v4;
        v15 = 2114;
        v16 = v11;
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Attribution Info: No SLAttribution found for highlight: %{public}@ asset UUID: %{public}@", (uint8_t *)&v13, 0x16u);

      }
    }

    syndicationAttributionIdentifier = self->_syndicationAttributionIdentifier;
  }
  return syndicationAttributionIdentifier;
}

- (NSString)axDescriptionForSyndicationContactImage
{
  NSString *axDescriptionForSyndicationContactImage;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  axDescriptionForSyndicationContactImage = self->_axDescriptionForSyndicationContactImage;
  if (!axDescriptionForSyndicationContactImage)
  {
    -[PXContentSyndicationAttributionInfo syndicationSenderDisplayName](self, "syndicationSenderDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      PXLocalizedStringFromTable(CFSTR("AX_LABEL_SYNDICATION_ATTRIBUTION_CONTACT_IMAGE"), CFSTR("PhotosUICore"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_axDescriptionForSyndicationContactImage;
      self->_axDescriptionForSyndicationContactImage = v6;

    }
    axDescriptionForSyndicationContactImage = self->_axDescriptionForSyndicationContactImage;
  }
  return axDescriptionForSyndicationContactImage;
}

- (NSString)axDescriptionForSyndicationReplyButton
{
  NSString *axDescriptionForSyndicationReplyButton;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  axDescriptionForSyndicationReplyButton = self->_axDescriptionForSyndicationReplyButton;
  if (!axDescriptionForSyndicationReplyButton)
  {
    -[PXContentSyndicationAttributionInfo syndicationSenderDisplayName](self, "syndicationSenderDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      PXLocalizedStringFromTable(CFSTR("AX_LABEL_SYNDICATION_ATTRIBUTION_REPLY_BUTTON"), CFSTR("PhotosUICore"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_axDescriptionForSyndicationReplyButton;
      self->_axDescriptionForSyndicationReplyButton = v6;

    }
    axDescriptionForSyndicationReplyButton = self->_axDescriptionForSyndicationReplyButton;
  }
  return axDescriptionForSyndicationReplyButton;
}

- (void)setHighlight:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_highlight, a3);
  self->_syndicationAttributionInfoIsLoading = 0;
  self->_hasSyndicationAttributionInfo = a3 != 0;
  -[PXContentSyndicationAttributionInfo changeDelegate](self, "changeDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syndicationAttributionInfoDidChange:", self);

}

- (void)_invalidateAttributedStrings
{
  NSAttributedString *savedFromTitle;

  savedFromTitle = self->_savedFromTitle;
  self->_savedFromTitle = 0;

}

- (id)_sfaAttributes
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  PXCappedFontWithTextStyle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DC1140];
  v7[0] = *MEMORY[0x1E0DC1138];
  v7[1] = v3;
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateAppNameColorForAttributedString:(id)a3 defaultFontValue:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0DC1138];
  v8 = objc_msgSend(v5, "length");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__PXContentSyndicationAttributionInfo__updateAppNameColorForAttributedString_defaultFontValue___block_invoke;
  v11[3] = &unk_1E511CF30;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, v11);

}

- (NSString)receivingGroupDisplayName
{
  NSString *receivingGroupDisplayName;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  receivingGroupDisplayName = self->_receivingGroupDisplayName;
  if (!receivingGroupDisplayName)
  {
    self->_receivingGroupDisplayName = (NSString *)&stru_1E5149688;
    -[PXContentSyndicationAttributionInfo highlight](self, "highlight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "attributions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "isGroupConversation"))
      {
        objc_msgSend(v7, "groupDisplayName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (NSString *)objc_msgSend(v8, "copy");
        v10 = self->_receivingGroupDisplayName;
        self->_receivingGroupDisplayName = v9;

      }
    }

    receivingGroupDisplayName = self->_receivingGroupDisplayName;
  }
  return receivingGroupDisplayName;
}

- (CNContact)contact
{
  CNContact *contact;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNContact *v9;
  CNContact *v10;
  void *v11;
  void *v12;
  CNContact *v13;
  CNContact *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  contact = self->_contact;
  if (!contact)
  {
    -[PXContentSyndicationAttributionInfo highlight](self, "highlight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "attributions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "sender");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contact");
      v9 = (CNContact *)objc_claimAutoreleasedReturnValue();
      v10 = self->_contact;
      self->_contact = v9;

      if (!self->_contact)
      {
        objc_msgSend(v7, "relatedPersons");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "contact");
        v13 = (CNContact *)objc_claimAutoreleasedReturnValue();
        v14 = self->_contact;
        self->_contact = v13;

        if (!self->_contact)
        {
          PLUIGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            -[PXContentSyndicationAttributionInfo asset](self, "asset");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "uuid");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 138412546;
            v20 = v5;
            v21 = 2114;
            v22 = v17;
            _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Info Panel attribution: Contact not found for highlight: %@ asset UUID: %{public}@", (uint8_t *)&v19, 0x16u);

          }
        }
      }

    }
    contact = self->_contact;
  }
  return contact;
}

- (void)_handleAttributionChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id location;

  -[PXContentSyndicationAttributionInfo syndicationSenderDisplayName](self, "syndicationSenderDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContentSyndicationAttributionInfo syndicationSharedWithInMessagesAttributedTitle](self, "syndicationSharedWithInMessagesAttributedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[PXContentSyndicationAttributionInfo contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ThumbnailImageDataFromAttributionContact(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXContentSyndicationAttributionInfo setContact:](self, "setContact:", 0);
  -[PXContentSyndicationAttributionInfo setSenderThumbnailImage:](self, "setSenderThumbnailImage:", 0);
  -[PXContentSyndicationAttributionInfo setSyndicationSenderDisplayName:](self, "setSyndicationSenderDisplayName:", 0);
  objc_initWeak(&location, self);
  -[PXContentSyndicationAttributionInfo contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PXContentSyndicationAttributionInfo__handleAttributionChanges__block_invoke;
  v13[3] = &unk_1E511CF58;
  objc_copyWeak(&v17, &location);
  v10 = v3;
  v14 = v10;
  v11 = v5;
  v15 = v11;
  v12 = v7;
  v16 = v12;
  -[PXContentSyndicationAttributionInfo _fetchContactWithIdentifier:completion:](self, "_fetchContactWithIdentifier:completion:", v9, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_fetchContactWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    +[PXContentSyndicationAttributionInfo _sharedContactFetchSerialQueue](PXContentSyndicationAttributionInfo, "_sharedContactFetchSerialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__PXContentSyndicationAttributionInfo__fetchContactWithIdentifier_completion___block_invoke;
    v15[3] = &unk_1E5148CE0;
    v16 = v6;
    v17 = v7;
    dispatch_async(v8, v15);

    v9 = v16;
  }
  else
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[PXContentSyndicationAttributionInfo asset](self, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v12;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Info Panel attribution: No contact to fetch with asset UUID: %{public}@", buf, 0xCu);

    }
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0CB2D68];
    v19 = CFSTR("Contact ID nil while attempting to fetch contact.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", CFSTR("PhotosUISyndicationDomain"), 0, v9);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);

  }
}

- (void)_handleContactFetchCompletion:(id)a3 error:(id)a4 oldSyndicationSenderDisplayName:(id)a5 oldSyndicationSharedWithTitle:(id)a6 oldImageData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  id v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12)
  {
    PLUIGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[PXContentSyndicationAttributionInfo asset](self, "asset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v19;
      v32 = 2112;
      v33 = v13;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Info Panel attribution: Contact refresh failed for asset UUID: %{public}@ with error: %@", buf, 0x16u);

    }
  }
  -[PXContentSyndicationAttributionInfo setContact:](self, "setContact:", v12);
  -[PXContentSyndicationAttributionInfo syndicationSenderDisplayName](self, "syndicationSenderDisplayName");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20 == v14)
  {

  }
  else
  {
    v21 = objc_msgSend(v14, "isEqualToString:", v20);

    if (!v21)
      goto LABEL_12;
  }
  v29 = v13;
  -[PXContentSyndicationAttributionInfo syndicationSharedWithInMessagesAttributedTitle](self, "syndicationSharedWithInMessagesAttributedTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "copy");
  if (v23 == v15)
  {

  }
  else
  {
    v24 = objc_msgSend(v15, "isEqualToString:", v23);

    if ((v24 & 1) == 0)
    {

      v13 = v29;
LABEL_12:
      v25 = v16;

LABEL_15:
      -[PXContentSyndicationAttributionInfo changeDelegate](self, "changeDelegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "syndicationAttributionInfoDidChange:", self);

      goto LABEL_16;
    }
  }
  _ThumbnailImageDataFromAttributionContact(v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v16;
  v27 = objc_msgSend(v16, "isEqualToData:", v26);

  v13 = v29;
  if ((v27 & 1) == 0)
    goto LABEL_15;
LABEL_16:

}

- (void)setSyndicationSenderDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSenderAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSyndicationSharedWithInMessagesAttributedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSavedFromTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)syndicationAttributionInfoIsLoading
{
  return self->_syndicationAttributionInfoIsLoading;
}

- (void)setSyndicationAttributionInfoIsLoading:(BOOL)a3
{
  self->_syndicationAttributionInfoIsLoading = a3;
}

- (BOOL)hasSyndicationAttributionInfo
{
  return self->_hasSyndicationAttributionInfo;
}

- (void)setHasSyndicationAttributionInfo:(BOOL)a3
{
  self->_hasSyndicationAttributionInfo = a3;
}

- (PXContentSyndicationAttributionInfoChangeDelegate)changeDelegate
{
  return (PXContentSyndicationAttributionInfoChangeDelegate *)objc_loadWeakRetained((id *)&self->_changeDelegate);
}

- (void)setChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_changeDelegate, a3);
}

- (void)setSenderThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_senderThumbnailImage, a3);
}

- (void)setSyndicationAttributionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationAttributionIdentifier, a3);
}

- (NSString)axDescriptionForSyndicationLoadingIndicator
{
  return self->_axDescriptionForSyndicationLoadingIndicator;
}

- (void)setAxDescriptionForSyndicationContactImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setAxDescriptionForSyndicationReplyButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (void)setReceivingGroupDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (PXContentSyndicationPhotoKitSocialLayerHighlightProvider)highlightProvider
{
  return self->_highlightProvider;
}

- (void)setHighlightProvider:(id)a3
{
  objc_storeStrong((id *)&self->_highlightProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightProvider, 0);
  objc_storeStrong((id *)&self->_receivingGroupDisplayName, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_axDescriptionForSyndicationReplyButton, 0);
  objc_storeStrong((id *)&self->_axDescriptionForSyndicationContactImage, 0);
  objc_storeStrong((id *)&self->_axDescriptionForSyndicationLoadingIndicator, 0);
  objc_storeStrong((id *)&self->_syndicationAttributionIdentifier, 0);
  objc_storeStrong((id *)&self->_senderThumbnailImage, 0);
  objc_destroyWeak((id *)&self->_changeDelegate);
  objc_storeStrong((id *)&self->_savedFromTitle, 0);
  objc_storeStrong((id *)&self->_syndicationSharedWithInMessagesAttributedTitle, 0);
  objc_storeStrong((id *)&self->_senderAppName, 0);
  objc_storeStrong((id *)&self->_syndicationSenderDisplayName, 0);
}

void __78__PXContentSyndicationAttributionInfo__fetchContactWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C966A8];
  v18[0] = *MEMORY[0x1E0C966E8];
  v18[1] = v2;
  v3 = *MEMORY[0x1E0C96890];
  v18[2] = *MEMORY[0x1E0C967C0];
  v18[3] = v3;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v17 = 0;
  objc_msgSend(v6, "unifiedContactWithIdentifier:keysToFetch:error:", v7, v5, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__PXContentSyndicationAttributionInfo__fetchContactWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E5145688;
  v10 = *(id *)(a1 + 40);
  v15 = v9;
  v16 = v10;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __78__PXContentSyndicationAttributionInfo__fetchContactWithIdentifier_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __64__PXContentSyndicationAttributionInfo__handleAttributionChanges__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 7);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleContactFetchCompletion:error:oldSyndicationSenderDisplayName:oldSyndicationSharedWithTitle:oldImageData:", v7, v6, a1[4], a1[5], a1[6]);

}

void __95__PXContentSyndicationAttributionInfo__updateAppNameColorForAttributedString_defaultFontValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "fontDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "symbolicTraits");

    if ((v10 & 2) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1138], *(_QWORD *)(a1 + 40), a3, a4);
      v11 = *(void **)(a1 + 32);
      v12 = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAttribute:value:range:", v12, v13, a3, a4);

      *a5 = 1;
    }
  }

}

void __88__PXContentSyndicationAttributionInfo_createSyndicatedAppIconWithSize_scale_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareImagesForImageDescriptors:", v4);

  objc_msgSend(v2, "imageForDescriptor:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "placeholder"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("appstore.app"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5)
    {
      v7 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(v5, "CGImage"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_6:
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__PXContentSyndicationAttributionInfo_createSyndicatedAppIconWithSize_scale_completion___block_invoke_2;
  v10[3] = &unk_1E5148CE0;
  v8 = *(id *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __88__PXContentSyndicationAttributionInfo_createSyndicatedAppIconWithSize_scale_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53__PXContentSyndicationAttributionInfo_initWithAsset___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setHighlight:", v3);

  if (!v3)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_loadWeakRetained(v2);
      objc_msgSend(v6, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Unexpected nil highlight for asset UUID: %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
}

+ (id)appIconFetchQueue
{
  if (appIconFetchQueue_onceToken != -1)
    dispatch_once(&appIconFetchQueue_onceToken, &__block_literal_global_46078);
  return (id)appIconFetchQueue_serialQueue;
}

+ (id)_sharedContactFetchSerialQueue
{
  if (_sharedContactFetchSerialQueue_onceToken != -1)
    dispatch_once(&_sharedContactFetchSerialQueue_onceToken, &__block_literal_global_129_46076);
  return (id)_sharedContactFetchSerialQueue_serialQueue;
}

+ (id)_nameStringForContact:(id)a3
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 0);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString length](v6, "length"))
    {
      objc_msgSend(v5, "emailAddresses");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v8, "value");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
LABEL_6:
            v10 = objc_msgSend(v9, "copy");

            v6 = (__CFString *)v10;
LABEL_16:

            goto LABEL_17;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "px_descriptionForAssertionMessage");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXContentSyndicationAttributionInfo.m"), 383, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("emailValue"), v20, v22);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXContentSyndicationAttributionInfo.m"), 383, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("emailValue"), v20);
        }

        goto LABEL_6;
      }
      objc_msgSend(v5, "phoneNumbers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        PLUIGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v5;
          _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Info Panel attribution: No display string found for attribution contact: %@", buf, 0xCu);
        }

        goto LABEL_15;
      }
      objc_msgSend(v12, "value");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_11:
          objc_msgSend(v13, "stringValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "copy");

          v6 = (__CFString *)v15;
LABEL_15:

          goto LABEL_16;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "px_descriptionForAssertionMessage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXContentSyndicationAttributionInfo.m"), 389, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("phoneNumberValue"), v25, v27);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXContentSyndicationAttributionInfo.m"), 389, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("phoneNumberValue"), v25);
      }

      goto LABEL_11;
    }
  }
  else
  {
    v6 = &stru_1E5149688;
  }
LABEL_17:

  return v6;
}

+ (id)_applyAttributesToTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PXContentSyndicationAttributionInfo _primaryFont](PXContentSyndicationAttributionInfo, "_primaryFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXContentSyndicationAttributionInfo _displayNameFont](PXContentSyndicationAttributionInfo, "_displayNameFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC1140];
  v16[0] = *MEMORY[0x1E0DC1138];
  v6 = v16[0];
  v16[1] = v7;
  v17[0] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[1] = v7;
  v15[0] = v5;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:italicizedAttributes:", v3, v9, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_primaryFont
{
  return (id)PXCappedFontWithTextStyle();
}

+ (id)_displayNameFont
{
  return (id)PXCappedFontWithTextStyleAndWeight();
}

void __69__PXContentSyndicationAttributionInfo__sharedContactFetchSerialQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  px_dispatch_queue_create_serial();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_sharedContactFetchSerialQueue_serialQueue;
  _sharedContactFetchSerialQueue_serialQueue = v0;

}

void __56__PXContentSyndicationAttributionInfo_appIconFetchQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  px_dispatch_queue_create_serial();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appIconFetchQueue_serialQueue;
  appIconFetchQueue_serialQueue = v0;

}

@end
