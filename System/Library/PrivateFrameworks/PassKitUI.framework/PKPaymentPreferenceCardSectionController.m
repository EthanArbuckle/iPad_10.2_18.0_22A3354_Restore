@implementation PKPaymentPreferenceCardSectionController

- (id)newOptionItemForSubPreference:(id)a3 hasErrorHandler:(id)a4
{
  id v6;
  id v7;
  PKPaymentPreferenceCardOptionListItem *v8;
  void *v9;
  PKPaymentPreferenceCardOptionListItem *v10;

  v6 = a4;
  v7 = a3;
  v8 = [PKPaymentPreferenceCardOptionListItem alloc];
  -[PKPaymentPreferenceSectionController preference](self, "preference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKPaymentPreferenceOptionListItem initWithPreference:inSectionPreference:hasErrorHandler:](v8, "initWithPreference:inSectionPreference:hasErrorHandler:", v7, v9, v6);

  return v10;
}

@end
