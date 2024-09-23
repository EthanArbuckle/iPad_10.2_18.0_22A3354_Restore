@implementation MSPSharedTripContact

+ (id)contactValueFromSuggestionsContact:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = objc_alloc((Class)MSPSharedTripContact);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "handleValue"));

  v6 = objc_msgSend(v4, "initWithContactHandle:", v5);
  return v6;
}

+ (id)contactValuesFromSuggestionsContacts:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripContact contactValueFromSuggestionsContact:](MSPSharedTripContact, "contactValueFromSuggestionsContact:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), (_QWORD)v13));
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = objc_msgSend(v4, "copy");
  }
  else
  {
    v11 = &__NSArray0__struct;
  }

  return v11;
}

- (id)suggestionContactValue
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)MapsSuggestionsContact);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSPSharedTripContact stringValue](self, "stringValue"));
  v5 = objc_msgSend(v3, "initWithHandleValue:", v4);

  return v5;
}

+ (void)_maps_prepareForFirstUse
{
  if (qword_1014D33F0 != -1)
    dispatch_once(&qword_1014D33F0, &stru_1011C8DC0);
}

+ (id)_maps_contactsMatchingQuery:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  id v35;
  void *v36;
  objc_class *v37;
  NSString *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  id v43;
  void **v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void *v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  __CFString *v53;
  __int16 v54;
  id v55;

  v4 = a3;
  v5 = objc_alloc_init((Class)CNContactStore);
  v6 = objc_alloc((Class)CNContactFetchRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "properties"));
  v9 = objc_msgSend(v6, "initWithKeysToFetch:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingName:](CNContact, "predicateForContactsMatchingName:", v4));
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(v9, "setSortOrder:", 1);
  v51 = 0;
  v45 = _NSConcreteStackBlock;
  v46 = 3221225472;
  v47 = sub_1009A4BBC;
  v48 = &unk_1011DD958;
  v11 = objc_alloc_init((Class)NSMutableArray);
  v49 = v11;
  v50 = a1;
  objc_msgSend(v5, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, &v51, &v45);
  v12 = v51;
  if (v12)
  {
    v13 = sub_10043237C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      goto LABEL_13;
    }
    v15 = a1;
    v16 = v15;
    if (!v15)
    {
      v22 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v17 = (objc_class *)objc_opt_class(v15);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
      {
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21, v45, v46, v47, v48));

        goto LABEL_9;
      }

    }
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543618;
    v53 = v22;
    v54 = 2112;
    v55 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] [ContactFetching] error searching for contacts: %@", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:
  v23 = objc_msgSend(v11, "count");
  v24 = sub_10043237C();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
  if (!v23)
  {
    if (!v26)
    {
LABEL_35:

      v43 = &__NSArray0__struct;
      goto LABEL_36;
    }
    v35 = a1;
    v36 = v35;
    if (!v35)
    {
      v42 = CFSTR("<nil>");
      goto LABEL_34;
    }
    v37 = (objc_class *)objc_opt_class(v35);
    v38 = NSStringFromClass(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    if ((objc_opt_respondsToSelector(v36, "accessibilityIdentifier") & 1) != 0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "performSelector:", "accessibilityIdentifier"));
      v41 = v40;
      if (v40 && !objc_msgSend(v40, "isEqualToString:", v39))
      {
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v39, v36, v41));

        goto LABEL_29;
      }

    }
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v39, v36));
LABEL_29:

LABEL_34:
    *(_DWORD *)buf = 138543362;
    v53 = v42;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}@] [ContactFetching] no match found", buf, 0xCu);

    goto LABEL_35;
  }
  if (v26)
  {
    v27 = a1;
    v28 = v27;
    if (!v27)
    {
      v34 = CFSTR("<nil>");
      goto LABEL_31;
    }
    v29 = (objc_class *)objc_opt_class(v27);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    if ((objc_opt_respondsToSelector(v28, "accessibilityIdentifier") & 1) != 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "performSelector:", "accessibilityIdentifier"));
      v33 = v32;
      if (v32 && !objc_msgSend(v32, "isEqualToString:", v31))
      {
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v31, v28, v33));

        goto LABEL_21;
      }

    }
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v31, v28));
LABEL_21:

LABEL_31:
    *(_DWORD *)buf = 138543618;
    v53 = v34;
    v54 = 2112;
    v55 = v11;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}@] [ContactFetching] found %@", buf, 0x16u);

  }
  v43 = objc_msgSend(v11, "copy");
LABEL_36:

  return v43;
}

@end
