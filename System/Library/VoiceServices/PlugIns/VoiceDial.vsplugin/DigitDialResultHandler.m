@implementation DigitDialResultHandler

- (id)actionForRecognitionResult:(id)a3
{
  id v4;
  uint64_t v5;
  VoiceDialRecognitionAction *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  DigitDialResultValidator *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  VoiceDialRecognitionAction *v32;
  void *v34;
  void *v35;
  DigitDialResultValidator *v36;
  id v37;
  id v38;
  id v39;

  v4 = a3;
  VoiceDialCopyErrorActionForResult(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (VoiceDialRecognitionAction *)v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v38 = 0;
    v39 = 0;
    DigitDialPhoneNumberFromResult(v4, &v39, &v38);
    v13 = v39;
    v12 = v38;
    v14 = objc_alloc_init(DigitDialResultValidator);
    v15 = -[DigitDialResultValidator indexOfValidPhoneNumber:](v14, "indexOfValidPhoneNumber:", v13);
    v7 = 0;
    v8 = 0;
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = v15;
      objc_msgSend(v13, "objectAtIndex:", v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v7, "length"))
    {
      v36 = v14;
      v37 = v12;
      TUNetworkCountryCode();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      TUFormattedPhoneNumber();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_alloc(MEMORY[0x24BEB4970]);
      objc_msgSend(MEMORY[0x24BEB49E8], "handleWithDestinationID:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "initWithHandle:", v19);

      -[DigitDialResultHandler contactsDataProvider](self, "contactsDataProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)v20;
      objc_msgSend(v21, "executeFetchRequest:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "localizedName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "contactLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0x24BDD1000uLL;
      v34 = v22;
      if (v23)
      {
        v25 = (void *)MEMORY[0x24BDD17C8];
        VoiceDialBundle();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CONFIRMED_DISPLAY_NAME_LABEL_FORMAT_CALLING_%@"), &stru_24E19F250, CFSTR("Feedback"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "contactLabel");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", v27, v28);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0x24BDD1000;
      }
      else
      {
        VoiceDialBundle();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CONFIRMED_DISPLAY_STRING"), &stru_24E19F250, CFSTR("Feedback"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v6 = -[VoiceDialRecognitionAction initWithPhoneNumber:uid:]([VoiceDialRecognitionAction alloc], "initWithPhoneNumber:uid:", v7, 0xFFFFFFFFLL);
      -[VSRecognitionAction setResultDisplayString:](v6, "setResultDisplayString:", v10);
      v29 = *(void **)(v24 + 1992);
      VoiceDialSpokenLocalizedString(CFSTR("CONFIRMED_SPOKEN_DIGIT_DIAL_FORMAT"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", v30, v8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSRecognitionAction setSpokenFeedbackString:](v6, "setSpokenFeedbackString:", v31);

      -[VSRecognitionAction setStatusDisplayString:](v6, "setStatusDisplayString:", v11);
      v14 = v36;
      v12 = v37;
    }
    else
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v6 = 0;
    }

  }
  v32 = v6;

  return v32;
}

- (TUContactsDataProvider)contactsDataProvider
{
  TUContactsDataProvider *contactsDataProvider;
  id v4;
  id v5;
  TUContactsDataProvider *v6;
  TUContactsDataProvider *v7;

  contactsDataProvider = self->_contactsDataProvider;
  if (!contactsDataProvider)
  {
    v4 = objc_alloc(MEMORY[0x24BEB4968]);
    v5 = objc_alloc_init(MEMORY[0x24BDBACF8]);
    v6 = (TUContactsDataProvider *)objc_msgSend(v4, "initWithContactsDataSource:", v5);
    v7 = self->_contactsDataProvider;
    self->_contactsDataProvider = v6;

    contactsDataProvider = self->_contactsDataProvider;
  }
  return contactsDataProvider;
}

- (void)setContactsDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_contactsDataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsDataProvider, 0);
}

@end
