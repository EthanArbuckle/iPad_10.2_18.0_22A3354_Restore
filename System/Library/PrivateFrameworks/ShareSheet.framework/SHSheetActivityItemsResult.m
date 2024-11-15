@implementation SHSheetActivityItemsResult

- (SHSheetActivityItemsResult)initWithActivity:(id)a3 activityItemValues:(id)a4
{
  id v7;
  id v8;
  SHSheetActivityItemsResult *v9;
  SHSheetActivityItemsResult *v10;
  uint64_t v11;
  NSArray *activityItemValues;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SHSheetActivityItemsResult;
  v9 = -[SHSheetActivityItemsResult init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activity, a3);
    v11 = objc_msgSend(v8, "copy");
    activityItemValues = v10->_activityItemValues;
    v10->_activityItemValues = (NSArray *)v11;

    v10->_isPlaceholder = v7 == 0;
  }

  return v10;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (NSArray)activityItemValues
{
  return self->_activityItemValues;
}

- (NSArray)activityItemURLValues
{
  return self->_activityItemURLValues;
}

- (void)setActivityItemURLValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UISUISecurityContext)securityScopedURLs
{
  return self->_securityScopedURLs;
}

- (void)setSecurityScopedURLs:(id)a3
{
  objc_storeStrong((id *)&self->_securityScopedURLs, a3);
}

- (NSString)initialSocialText
{
  return self->_initialSocialText;
}

- (void)setInitialSocialText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)suggestedImageData
{
  return self->_suggestedImageData;
}

- (void)setSuggestedImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)suggestionAssetIdentifiers
{
  return self->_suggestionAssetIdentifiers;
}

- (void)setSuggestionAssetIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)recipientsHandles
{
  return self->_recipientsHandles;
}

- (void)setRecipientsHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_recipientsHandles, 0);
  objc_storeStrong((id *)&self->_suggestionAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestedImageData, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_initialSocialText, 0);
  objc_storeStrong((id *)&self->_securityScopedURLs, 0);
  objc_storeStrong((id *)&self->_activityItemURLValues, 0);
  objc_storeStrong((id *)&self->_activityItemValues, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
