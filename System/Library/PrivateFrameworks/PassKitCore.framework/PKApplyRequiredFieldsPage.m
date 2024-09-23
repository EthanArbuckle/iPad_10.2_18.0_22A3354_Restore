@implementation PKApplyRequiredFieldsPage

- (PKApplyRequiredFieldsPage)initWithDictionary:(id)a3 fieldOptions:(id)a4 featureApplication:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PKApplyRequiredFieldsPage *v11;
  objc_super v13;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "businessChatIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PKApplyRequiredFieldsPage;
  v11 = -[PKDynamicProvisioningFieldsPageContent initWithDictionary:fieldOptions:businessChatIdentifier:](&v13, sel_initWithDictionary_fieldOptions_businessChatIdentifier_, v9, v8, v10);

  return v11;
}

@end
