@implementation NCNotificationManagementSuggestionContentProvider

- (NCNotificationManagementSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6
{
  id v9;
  NCNotificationManagementSuggestionContentProvider *v10;
  NCNotificationManagementSuggestionContentProvider *v11;
  objc_super v13;

  v9 = a6;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationManagementSuggestionContentProvider;
  v10 = -[NCNotificationManagementContentProvider initWithNotificationRequest:managementDelegate:](&v13, sel_initWithNotificationRequest_managementDelegate_, a3, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_suggestionDelegate, v9);
    v11->_auxiliaryOptionsVisible = 1;
  }

  return v11;
}

- (NSString)auxiliaryOptionsSummaryText
{
  return self->_auxiliaryOptionsSummaryText;
}

- (void)setAuxiliaryOptionsSummaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)auxiliaryOptionsVisible
{
  return self->_auxiliaryOptionsVisible;
}

- (void)setAuxiliaryOptionsVisible:(BOOL)a3
{
  self->_auxiliaryOptionsVisible = a3;
}

- (NCNotificationManagementSuggestionDelegate)suggestionDelegate
{
  return (NCNotificationManagementSuggestionDelegate *)objc_loadWeakRetained((id *)&self->_suggestionDelegate);
}

- (void)setSuggestionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionDelegate);
  objc_storeStrong((id *)&self->_auxiliaryOptionsSummaryText, 0);
}

@end
