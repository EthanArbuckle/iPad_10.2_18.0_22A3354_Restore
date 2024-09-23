@implementation PKDynamicProvisioningFieldsPageContent

- (PKDynamicProvisioningFieldsPageContent)initWithDictionary:(id)a3 fieldOptions:(id)a4 businessChatIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDynamicProvisioningFieldsPageContent *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PKPaymentSetupFieldLabel *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PKPaymentSetupFieldsModel *v30;
  PKPaymentSetupFieldsModel *fieldModel;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v39.receiver = self;
  v39.super_class = (Class)PKDynamicProvisioningFieldsPageContent;
  v11 = -[PKDynamicProvisioningPageContent initWithDictonary:](&v39, sel_initWithDictonary_, v8);
  if (v11)
  {
    v33 = v10;
    v34 = v8;
    objc_msgSend(v8, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFields"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v9, "PKDictionaryForKey:", v19, v33);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "safelyAddObject:", v21);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v16);
    }

    -[PKDynamicProvisioningPageContent learnMore](v11, "learnMore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "buttonTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v33;
    if (v23)
    {
      v24 = -[PKPaymentSetupField initWithIdentifier:]([PKPaymentSetupFieldLabel alloc], "initWithIdentifier:", v23);
      -[PKPaymentSetupFieldLabel setButtonTitle:](v24, "setButtonTitle:", v23);
      objc_msgSend(v22, "title");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupFieldLabel setDetailTitle:](v24, "setDetailTitle:", v25);

      objc_msgSend(v22, "subtitle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupFieldLabel setDetailSubtitle:](v24, "setDetailSubtitle:", v26);

      objc_msgSend(v22, "body");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupFieldLabel setDetailBody:](v24, "setDetailBody:", v27);

      -[PKPaymentSetupFieldLabel setBusinessChatIdentifier:](v24, "setBusinessChatIdentifier:", v33);
      objc_msgSend(v22, "businessChatIntentName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupFieldLabel setBusinessChatIntentName:](v24, "setBusinessChatIntentName:", v28);

      objc_msgSend(v22, "businessChatButtonTitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupFieldLabel setBusinessChatButtonTitle:](v24, "setBusinessChatButtonTitle:", v29);

      objc_msgSend(v13, "safelyAddObject:", v24);
    }
    v30 = -[PKPaymentSetupFieldsModel initWithPaymentSetupFields:]([PKPaymentSetupFieldsModel alloc], "initWithPaymentSetupFields:", v13);
    fieldModel = v11->_fieldModel;
    v11->_fieldModel = v30;

    v8 = v34;
  }

  return v11;
}

- (PKPaymentSetupFieldsModel)fieldModel
{
  return self->_fieldModel;
}

- (void)setFieldModel:(id)a3
{
  objc_storeStrong((id *)&self->_fieldModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldModel, 0);
}

@end
