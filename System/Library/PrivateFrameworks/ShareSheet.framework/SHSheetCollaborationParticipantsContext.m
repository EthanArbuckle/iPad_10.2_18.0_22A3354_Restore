@implementation SHSheetCollaborationParticipantsContext

+ (id)defaultContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SHSheetCollaborationParticipantsContext *v10;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Participants Header Text"), CFSTR("Create Link"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Participants Supplementary Text"), CFSTR("Create a link by adding people who you‘d like to collaborate with"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Participants Confirm Button Text"), CFSTR("Share Link"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Participants Loading Text"), CFSTR("Creating Link"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SHSheetCollaborationParticipantsContext initWithHeaderTitle:supplementaryText:confirmButtonText:loadingText:]([SHSheetCollaborationParticipantsContext alloc], "initWithHeaderTitle:supplementaryText:confirmButtonText:loadingText:", v3, v5, v7, v9);
  return v10;
}

- (SHSheetCollaborationParticipantsContext)initWithHeaderTitle:(id)a3 supplementaryText:(id)a4 confirmButtonText:(id)a5 loadingText:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SHSheetCollaborationParticipantsContext *v14;
  uint64_t v15;
  NSString *headerTitle;
  uint64_t v17;
  NSString *supplementaryText;
  uint64_t v19;
  NSString *confirmButtonText;
  uint64_t v21;
  NSString *loadingText;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SHSheetCollaborationParticipantsContext;
  v14 = -[SHSheetCollaborationParticipantsContext init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    headerTitle = v14->_headerTitle;
    v14->_headerTitle = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    supplementaryText = v14->_supplementaryText;
    v14->_supplementaryText = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    confirmButtonText = v14->_confirmButtonText;
    v14->_confirmButtonText = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    loadingText = v14->_loadingText;
    v14->_loadingText = (NSString *)v21;

  }
  return v14;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)supplementaryText
{
  return self->_supplementaryText;
}

- (NSString)confirmButtonText
{
  return self->_confirmButtonText;
}

- (NSString)loadingText
{
  return self->_loadingText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingText, 0);
  objc_storeStrong((id *)&self->_confirmButtonText, 0);
  objc_storeStrong((id *)&self->_supplementaryText, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end
