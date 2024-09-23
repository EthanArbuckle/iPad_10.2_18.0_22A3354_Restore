@implementation PKPeerPaymentRequiredFieldsPage

- (PKPeerPaymentRequiredFieldsPage)initWithDictionary:(id)a3 fieldOptions:(id)a4
{
  id v6;
  PKPeerPaymentRequiredFieldsPage *v7;
  uint64_t v8;
  NSString *localizedTitle;
  uint64_t v10;
  NSString *localizedDescription;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *requiredFields;
  PKPeerPaymentRequiredFieldsPage *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _QWORD v39[3];
  _QWORD v40[3];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PKPeerPaymentRequiredFieldsPage;
  v7 = -[PKPeerPaymentRequiredFieldsPage init](&v38, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("localizedTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v7->_localizedTitle;
    v7->_localizedTitle = (NSString *)v8;

    objc_msgSend(v6, "objectForKey:", CFSTR("localizedDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v7->_localizedDescription;
    v7->_localizedDescription = (NSString *)v10;

    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFields"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v15)
    {
      v16 = v15;
      v31 = v7;
      v32 = v6;
      v17 = 0;
      v18 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v20, "lowercaseString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("disclosure_footer"));

          v17 |= v22;
          objc_msgSend(v33, "PKDictionaryForKey:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", v20, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "safelyAddObject:", v24);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v16);

      v7 = v31;
      v6 = v32;
      if ((v17 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

    }
    v39[0] = CFSTR("fieldType");
    v39[1] = CFSTR("position");
    v40[0] = CFSTR("footer");
    v40[1] = CFSTR("inline");
    v39[2] = CFSTR("defaultValue");
    PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_TABLE_FOOTER"), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("disclosure_footer"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v27);

LABEL_13:
    v28 = objc_msgSend(v13, "copy");
    requiredFields = v7->_requiredFields;
    v7->_requiredFields = (NSArray *)v28;

  }
  return v7;
}

- (NSArray)requiredFields
{
  return self->_requiredFields;
}

- (void)setRequiredFields:(id)a3
{
  objc_storeStrong((id *)&self->_requiredFields, a3);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_requiredFields, 0);
}

@end
