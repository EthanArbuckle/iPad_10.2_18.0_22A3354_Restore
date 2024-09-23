@implementation CNMutableContact

+ (id)contactForHandle:(id)a3 isoCountryCode:(id)a4 metadataCache:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)CNMutableContact);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));
  if (objc_msgSend(v12, "length"))
  {
    if (v10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "suggestedContactForHandle:isoCountryCode:metadataCache:", v8, v9, v10));
      v14 = v13;
      if (v13)
      {
        v15 = v13;

        v11 = v15;
      }
      v16 = objc_msgSend(objc_alloc((Class)TUMetadataDestinationID), "initWithDestinationID:isoCountryCode:", v12, v9);
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadataForDestinationID:", v16));
        v18 = objc_msgSend(v17, "metadataForProvider:", objc_opt_class(TUMapsMetadataCacheDataProvider));
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        if (v19)
          objc_msgSend(v11, "setOrganizationName:", v19);

      }
    }
    v20 = v12;
    v21 = objc_msgSend(v8, "type");
    if (v21 == (id)2)
    {
      v22 = (id)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithDigits:countryCode:](CNPhoneNumber, "phoneNumberWithDigits:countryCode:", v20, v9));
    }
    else
    {
      if (v21 != (id)1)
        goto LABEL_15;
      v22 = objc_msgSend(objc_alloc((Class)CNSocialProfile), "initWithUrlString:username:userIdentifier:service:", 0, v20, 0, 0);
    }
    v23 = v22;

    v20 = v23;
LABEL_15:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CNLabeledValue labeledValueWithLabel:value:](CNLabeledValue, "labeledValueWithLabel:value:", 0, v20));
    v25 = objc_msgSend(v8, "type");
    if (v25 == (id)3)
    {
      v28 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
      objc_msgSend(v11, "setEmailAddresses:", v26);
    }
    else if (v25 == (id)2)
    {
      v29 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
      objc_msgSend(v11, "setPhoneNumbers:", v26);
    }
    else
    {
      if (v25 != (id)1)
      {
LABEL_22:

        goto LABEL_23;
      }
      v30 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
      objc_msgSend(v11, "setSocialProfiles:", v26);
    }

    goto LABEL_22;
  }
LABEL_23:

  return v11;
}

+ (id)contactForRecentCall:(id)a3 metadataCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleForCHRecentCall:](TUHandle, "handleForCHRecentCall:", v6));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "isoCountryCode"));
    if (objc_msgSend(v8, "type") == (id)2)
    {
      if (!objc_msgSend(v9, "length"))
      {
        v10 = objc_msgSend(v6, "callStatus");
        v13 = v10 == kCHCallStatusConnectedOutgoing
           || v10 == kCHCallStatusAnsweredElsewhere
           || v10 == kCHCallStatusMissed;
        v14 = TUCountryCodeForIncomingCall(v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);

        v9 = (void *)v15;
      }
      if (objc_msgSend(v9, "length"))
      {
        v16 = TUHomeCountryCode();
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if ((objc_msgSend(v9, "isEqualToString:", v17) & 1) == 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));
          v19 = TUNumberToDial(v18, v9, v17, 0, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

          v21 = objc_msgSend(objc_alloc((Class)TUHandle), "initWithType:value:", objc_msgSend(v8, "type"), v20);
          v8 = v21;
        }

      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "contactForHandle:isoCountryCode:metadataCache:", v8, v9, v7));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageURL"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      objc_msgSend(v12, "setOrganizationName:", v23);

      objc_msgSend(v12, "setContactType:", 1);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)suggestedContactForHandle:(id)a3 isoCountryCode:(id)a4 metadataCache:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "providers"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v28;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v12)
        objc_enumerationMutation(v10);
      v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13);
      v15 = objc_opt_class(TUSuggestionsMetadataCacheDataProvider);
      if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        break;
      if (v11 == (id)++v13)
      {
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v18 = (void *)objc_opt_class(v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value", (_QWORD)v27));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "newestSuggestedContactForDestinationID:", v19));

    if (!v11)
    {
      v16 = 0;
      goto LABEL_17;
    }
    v16 = objc_msgSend(v11, "mutableCopy");
    v20 = objc_alloc((Class)TUMetadataDestinationID);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
    v17 = objc_msgSend(v20, "initWithDestinationID:isoCountryCode:", v21, v8);

    if (v17)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadataForDestinationID:", v17));
      v23 = objc_msgSend(v22, "metadataForProvider:", objc_opt_class(TUMapsMetadataCacheDataProvider));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if (objc_msgSend(v24, "length"))
      {
        objc_msgSend(v16, "setContactType:", 1);
        objc_msgSend(v16, "setOrganizationName:", v24);
      }

    }
  }
  else
  {
LABEL_9:
    v16 = 0;
    v17 = v10;
  }

LABEL_17:
  v25 = v16;

  return v25;
}

@end
