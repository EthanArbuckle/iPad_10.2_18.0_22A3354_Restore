@implementation NCRemoteSuggestionContentProvider

- (NCRemoteSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6 uuid:(id)a7
{
  id v13;
  NCRemoteSuggestionContentProvider *v14;
  NCRemoteSuggestionContentProvider *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)NCRemoteSuggestionContentProvider;
  v14 = -[NCNotificationManagementSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:](&v17, sel_initWithNotificationRequest_bundleDisplayName_managementDelegate_suggestionDelegate_, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_uuid, a7);

  return v15;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
