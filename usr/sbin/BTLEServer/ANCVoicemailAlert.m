@implementation ANCVoicemailAlert

- (ANCVoicemailAlert)initWithVoicemail:(id)a3 manager:(id)a4 contactStore:(id)a5 queue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ANCVoicemailAlert *v15;
  ANCVoicemailAlert *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ANCVoicemailAlert;
  v15 = -[ANCAlert initWithCategoryID:](&v18, "initWithCategoryID:", 3);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_voicemail, a3);
    objc_storeStrong((id *)&v16->_manager, a4);
    objc_storeStrong((id *)&v16->_contactStore, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
  }

  return v16;
}

- (id)appIdentifier
{
  return CFSTR("com.apple.mobilephone");
}

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "senderDestinationID"));

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
  v17 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert contactStore](self, "contactStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contactUsingContactStore:withKeysToFetch:", v8, v6));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v9, 0));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "senderDestinationID"));
    v14 = TUHomeCountryCode();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = TUFormattedPhoneNumber(v13, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v16);

  }
  return v10;
}

- (id)subtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  NSString *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "senderDestinationID"));

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert contactStore](self, "contactStore"));
  v26 = CNContactPhoneNumbersKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactUsingContactStore:withKeysToFetch:", v6, v7));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "senderDestinationID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v10));

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "phoneNumbers", 0));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "value"));
          v18 = objc_msgSend(v11, "isEqual:", v17);

          if (v18)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "label"));
            v13 = (id)objc_claimAutoreleasedReturnValue(+[CNLabeledValue localizedStringForLabel:](CNLabeledValue, "localizedStringForLabel:", v20));

            goto LABEL_14;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)message
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("VOICEMAIL"), CFSTR("Voicemail"), 0));

  return v3;
}

- (id)date
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "date"));

  return v3;
}

- (BOOL)hasPositiveAction
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callbackDestinationID"));
  if (objc_msgSend(v4, "length"))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "senderDestinationID"));
    v5 = objc_msgSend(v7, "length") != 0;

  }
  return v5;
}

- (BOOL)hasNegativeAction
{
  return 1;
}

- (id)positiveActionLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CALL_BACK"), CFSTR("Call Back"), 0));

  return v3;
}

- (id)negativeActionLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DELETE"), CFSTR("Delete"), 0));

  return v3;
}

- (BOOL)performPositiveAction
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callbackDestinationID"));
  v5 = objc_msgSend(v4, "length");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
  v7 = v6;
  if (v5)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callbackDestinationID"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "senderDestinationID"));
    v10 = objc_msgSend(v9, "length");

    if (!v10)
      return 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "senderDestinationID"));
  }
  v11 = (void *)v8;

  if (!v11)
    return 0;
  v12 = objc_alloc_init((Class)TUCallProviderManager);
  v13 = objc_alloc((Class)TUDialRequest);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "telephonyProvider"));
  v15 = objc_msgSend(v13, "initWithProvider:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", v11));
  objc_msgSend(v15, "setHandle:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert queue](self, "queue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter callCenterWithQueue:](TUCallCenter, "callCenterWithQueue:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dialWithRequest:", v15));
  v20 = v19 != 0;

  return v20;
}

- (BOOL)performNegativeAction
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert manager](self, "manager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ANCVoicemailAlert voicemail](self, "voicemail"));
  v5 = objc_msgSend(v3, "trashVoicemail:", v4);

  return 1;
}

- (VMVoicemail)voicemail
{
  return self->_voicemail;
}

- (void)setVoicemail:(id)a3
{
  objc_storeStrong((id *)&self->_voicemail, a3);
}

- (VMVoicemailManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_voicemail, 0);
}

@end
