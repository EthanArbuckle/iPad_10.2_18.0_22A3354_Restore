@implementation AddressBookAddress

+ (void)initialize
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = objc_opt_self(AddressBookAddress);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", a1, "didReceiveMemoryWarning", UIApplicationDidReceiveMemoryWarningNotification, 0);

  }
}

- (BOOL)isEqual:(id)a3
{
  AddressBookAddress *v4;
  uint64_t v5;
  AddressBookAddress *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = (AddressBookAddress *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v5 = objc_opt_class(AddressBookAddress);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress contact](self, "contact"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress contact](v6, "contact"));
      if (objc_msgSend(v7, "isEqual:", v8))
        v9 = -[CNLabeledValue isEqual:](self->_address, "isEqual:", v6->_address);
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)singleAddressForContact:(id)a3
{
  id v3;
  AddressBookAddress *v4;
  void *v5;
  void *v6;
  AddressBookAddress *v7;

  v3 = a3;
  v4 = [AddressBookAddress alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "postalAddresses"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = -[AddressBookAddress initWithContact:addressValue:](v4, "initWithContact:addressValue:", v3, v6);

  return v7;
}

- (AddressBookAddress)initWithContact:(id)a3 addressValue:(id)a4
{
  id v6;
  id v7;
  AddressBookAddress *v8;
  id v9;
  NSObject *v10;
  AddressBookAddress *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CNContact *v18;
  CNContact *contact;
  CNLabeledValue *v20;
  CNLabeledValue *address;
  uint64_t v22;
  NSString *contactIdentifier;
  uint64_t v24;
  NSString *addressIdentifier;
  void *v26;
  double v27;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;

  v6 = a3;
  v7 = a4;
  v8 = -[AddressBookAddress init](self, "init");
  if (v8)
  {
    v9 = sub_10040E5B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      v18 = (CNContact *)objc_msgSend(v6, "copy");
      contact = v8->_contact;
      v8->_contact = v18;

      v20 = (CNLabeledValue *)objc_msgSend(v7, "copy");
      address = v8->_address;
      v8->_address = v20;

      v22 = objc_claimAutoreleasedReturnValue(-[CNContact identifier](v8->_contact, "identifier"));
      contactIdentifier = v8->_contactIdentifier;
      v8->_contactIdentifier = (NSString *)v22;

      v24 = objc_claimAutoreleasedReturnValue(-[CNLabeledValue identifier](v8->_address, "identifier"));
      addressIdentifier = v8->_addressIdentifier;
      v8->_addressIdentifier = (NSString *)v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v26, "timeIntervalSinceReferenceDate");
      v8->_timestamp = v27;

      goto LABEL_10;
    }
    v11 = v8;
    v12 = (objc_class *)objc_opt_class(v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_8;
      }

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_8:

    *(_DWORD *)buf = 138543875;
    v30 = v17;
    v31 = 2113;
    v32 = v6;
    v33 = 2113;
    v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] initialising with contact %{private}@ / %{private}@", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (id)initForTest
{
  id v3;
  NSObject *v4;
  AddressBookAddress *v5;
  AddressBookAddress *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint8_t buf[4];
  __CFString *v15;

  v3 = sub_10040E5B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] initialising for test", buf, 0xCu);

  }
  return -[AddressBookAddress init](self, "init");
}

- (AddressBookAddress)init
{
  AddressBookAddress *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AddressBookAddress;
  v2 = -[AddressBookAddress init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "storeUpdated:", CNContactStoreDidChangeNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "storeUpdated:", CFSTR("CorrectedMapItemsUpdated"), 0);

  }
  return v2;
}

- (AddressBookAddress)initWithRecordID:(int)a3 addressID:(int)a4
{
  uint64_t v5;
  AddressBookAddress *v6;
  id v7;
  NSObject *v8;
  AddressBookAddress *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  CNContact *contact;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  uint64_t v27;
  NSString *addressIdentifier;
  uint64_t v29;
  NSString *contactIdentifier;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;

  v5 = *(_QWORD *)&a3;
  v6 = -[AddressBookAddress init](self, "init");
  if (!v6)
    return v6;
  v7 = sub_10040E5B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v6;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

    *(_DWORD *)buf = 138543874;
    v38 = v15;
    v39 = 2048;
    v40 = (int)v5;
    v41 = 2048;
    v42 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] initialising with record ID %ld, address ID %ld", buf, 0x20u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v6->_timestamp = v17;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contactForRecordId:", v5));
  contact = v6->_contact;
  v6->_contact = (CNContact *)v19;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact postalAddresses](v6->_contact, "postalAddresses"));
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if (a4 == -1)
        {
          objc_storeStrong((id *)&v6->_address, *(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i));

          goto LABEL_23;
        }
        if (!v6->_address)
          objc_storeStrong((id *)&v6->_address, *(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i));
        if (objc_msgSend(v26, "iOSLegacyIdentifier") == a4)
          objc_storeStrong((id *)&v6->_address, v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v23)
        continue;
      break;
    }
  }

LABEL_23:
  v27 = objc_claimAutoreleasedReturnValue(-[CNLabeledValue identifier](v6->_address, "identifier"));
  addressIdentifier = v6->_addressIdentifier;
  v6->_addressIdentifier = (NSString *)v27;

  v29 = objc_claimAutoreleasedReturnValue(-[CNContact identifier](v6->_contact, "identifier"));
  contactIdentifier = v6->_contactIdentifier;
  v6->_contactIdentifier = (NSString *)v29;

  return v6;
}

- (AddressBookAddress)initWithCNContactIdentifier:(id)a3 addressIdentifier:(id)a4
{
  id v6;
  AddressBookAddress *v7;
  id v8;
  NSObject *v9;
  AddressBookAddress *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  CNContact *contact;
  CNContact *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  NSString *addressIdentifier;
  uint64_t v33;
  NSString *contactIdentifier;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;

  v6 = a3;
  v37 = a4;
  v7 = -[AddressBookAddress init](self, "init");
  if (!v7)
    goto LABEL_23;
  v8 = sub_10040E5B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = v7;
    v11 = (objc_class *)objc_opt_class(v10);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_8;
      }

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

    *(_DWORD *)buf = 138543874;
    v44 = v16;
    v45 = 2114;
    v46 = v6;
    v47 = 2114;
    v48 = v37;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] initialising with contact ID %{public}@, address ID %{public}@", buf, 0x20u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  v7->_timestamp = v18;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contactForCNContactIdentifier:", v6));
  contact = v7->_contact;
  v7->_contact = (CNContact *)v20;

  v22 = v7->_contact;
  if (v22)
  {
    v36 = v6;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact postalAddresses](v22, "postalAddresses"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          if (!v7->_address)
            objc_storeStrong((id *)&v7->_address, *(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
          v30 = objc_msgSend(v29, "isEqualToString:", v37);

          if (v30)
          {
            objc_storeStrong((id *)&v7->_address, v28);

            goto LABEL_22;
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v25)
          continue;
        break;
      }
    }

LABEL_22:
    v31 = objc_claimAutoreleasedReturnValue(-[CNLabeledValue identifier](v7->_address, "identifier"));
    addressIdentifier = v7->_addressIdentifier;
    v7->_addressIdentifier = (NSString *)v31;

    v33 = objc_claimAutoreleasedReturnValue(-[CNContact identifier](v7->_contact, "identifier"));
    contactIdentifier = v7->_contactIdentifier;
    v7->_contactIdentifier = (NSString *)v33;

    v6 = v36;
  }
LABEL_23:

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AddressBookAddress;
  -[AddressBookAddress dealloc](&v4, "dealloc");
}

- (MKMapItem)geocodedMapItem
{
  MKMapItem *geocodedMapItem;
  void *v4;
  MKMapItem *v5;
  MKMapItem *v6;
  id v7;
  NSObject *v8;
  AddressBookAddress *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *contactIdentifier;
  MKMapItem *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  MKMapItem *v24;

  geocodedMapItem = self->_geocodedMapItem;
  if (!geocodedMapItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v5 = (MKMapItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItemFormShortcutForCNIdentifier:", self->_contactIdentifier));
    v6 = self->_geocodedMapItem;
    self->_geocodedMapItem = v5;

    v7 = sub_10040E5B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      geocodedMapItem = self->_geocodedMapItem;
      return geocodedMapItem;
    }
    v9 = self;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

    contactIdentifier = self->_contactIdentifier;
    v17 = self->_geocodedMapItem;
    *(_DWORD *)buf = 138543875;
    v20 = v15;
    v21 = 2114;
    v22 = contactIdentifier;
    v23 = 2113;
    v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] resolved map item shortcut for identifier %{public}@: %{private}@", buf, 0x20u);

    goto LABEL_9;
  }
  return geocodedMapItem;
}

- (void)_setSuppressStoreUpdateNotifications:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  AddressBookAddress *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AddressBookAddress *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;

  if (self->_suppressStoreUpdateNotifications != a3)
  {
    v3 = a3;
    self->_suppressStoreUpdateNotifications = a3;
    v5 = sub_10040E5B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (!v7)
      {
LABEL_10:

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v15, "removeObserver:name:object:", self, CNContactStoreDidChangeNotification, 0);

        return;
      }
      v8 = self;
      v9 = (objc_class *)objc_opt_class(v8);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
        v13 = v12;
        if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

          goto LABEL_9;
        }

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_9:

      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] suppressing store update notifications", buf, 0xCu);

      goto LABEL_10;
    }
    if (!v7)
      goto LABEL_18;
    v16 = self;
    v17 = (objc_class *)objc_opt_class(v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

        goto LABEL_17;
      }

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_17:

    *(_DWORD *)buf = 138543362;
    v25 = v22;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] resuming store update notifications, will update immediately", buf, 0xCu);

LABEL_18:
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "addObserver:selector:name:object:", self, "storeUpdated:", CNContactStoreDidChangeNotification, 0);

    -[AddressBookAddress storeUpdated:](self, "storeUpdated:", 0);
  }
}

- (void)storeUpdated:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  AddressBookAddress *v7;
  AddressBookAddress *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  id v18;
  NSObject *v19;
  AddressBookAddress *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  NSString *v28;
  NSString *v29;
  GCDTimer *v30;
  GCDTimer *deferredAddressResolutionTimer;
  id v32;
  NSObject *v33;
  AddressBookAddress *v34;
  AddressBookAddress *v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  _QWORD v42[4];
  NSString *v43;
  NSString *v44;
  id v45;
  _QWORD block[4];
  id v47;
  id v48;
  id location;
  uint8_t buf[4];
  __CFString *v51;
  __int16 v52;
  uint64_t v53;

  v4 = a3;
  v5 = sub_10040E5B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138543618;
    v51 = v14;
    v52 = 2114;
    v53 = (uint64_t)v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] store updated from %{public}@...", buf, 0x16u);

  }
  objc_initWeak(&location, self);
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v32 = sub_10040E5B8();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
LABEL_30:

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10040F994;
      block[3] = &unk_1011AD1E8;
      objc_copyWeak(&v48, &location);
      v47 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v48);
      goto LABEL_31;
    }
    v34 = self;
    v35 = v34;
    if (!v34)
    {
      v41 = CFSTR("<nil>");
      goto LABEL_29;
    }
    v36 = (objc_class *)objc_opt_class(v34);
    v37 = NSStringFromClass(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    if ((objc_opt_respondsToSelector(v35, "accessibilityIdentifier") & 1) != 0)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v35, "performSelector:", "accessibilityIdentifier"));
      v40 = v39;
      if (v39 && (objc_msgSend(v39, "isEqualToString:", v38) & 1) == 0)
      {
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v38, v35, v40));

        goto LABEL_27;
      }

    }
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v38, v35));
LABEL_27:

LABEL_29:
    *(_DWORD *)buf = 138543362;
    v51 = v41;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%{public}@] ... dispatching to main queue to process notification", buf, 0xCu);

    goto LABEL_30;
  }
  -[AddressBookAddress _cancelDeferredAddressResolutionTimerIfNeeded](self, "_cancelDeferredAddressResolutionTimerIfNeeded");
  v16 = self->_contactIdentifier;
  v17 = self->_addressIdentifier;
  v18 = sub_10040E5B8();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = self;
    v21 = (objc_class *)objc_opt_class(v20);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if ((objc_opt_respondsToSelector(v20, "accessibilityIdentifier") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v20, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && (objc_msgSend(v24, "isEqualToString:", v23) & 1) == 0)
      {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, v20, v25));

        goto LABEL_18;
      }

    }
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, v20));
LABEL_18:

    *(_DWORD *)buf = 138543618;
    v51 = v26;
    v52 = 2048;
    v53 = 0x3FF199999999999ALL;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] scheduling deferred address resolution in %#.1lfs", buf, 0x16u);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress _addressResolutionQueue](self, "_addressResolutionQueue"));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10040F9D4;
  v42[3] = &unk_1011B5540;
  objc_copyWeak(&v45, &location);
  v28 = v16;
  v43 = v28;
  v29 = v17;
  v44 = v29;
  v30 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:repeating:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:repeating:block:", v27, 0, v42, 1.1));
  deferredAddressResolutionTimer = self->_deferredAddressResolutionTimer;
  self->_deferredAddressResolutionTimer = v30;

  objc_destroyWeak(&v45);
LABEL_31:
  objc_destroyWeak(&location);

}

- (void)_cancelDeferredAddressResolutionTimerIfNeeded
{
  id v3;
  NSObject *v4;
  AddressBookAddress *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  GCDTimer *deferredAddressResolutionTimer;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;

  if (self->_deferredAddressResolutionTimer)
  {
    v3 = sub_100408630();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      -[GCDTimer invalidate](self->_deferredAddressResolutionTimer, "invalidate");
      deferredAddressResolutionTimer = self->_deferredAddressResolutionTimer;
      self->_deferredAddressResolutionTimer = 0;

      return;
    }
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_8;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_8:

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GCDTimer fireDate](self->_deferredAddressResolutionTimer, "fireDate"));
    objc_msgSend(v12, "timeIntervalSinceNow");
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2048;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] cancelling previous deferred address resolution timer (had %#.1lfs to go)", buf, 0x16u);

    goto LABEL_9;
  }
}

- (id)_addressResolutionQueue
{
  OS_dispatch_queue *addressResolutionQueue;
  id v4;
  NSObject *v5;
  AddressBookAddress *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *v16;
  uint8_t buf[4];
  void *v19;

  addressResolutionQueue = self->_addressResolutionQueue;
  if (!addressResolutionQueue)
  {
    v4 = sub_10040E5B8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.AddressBook.AddressResolution", v14);
      v16 = self->_addressResolutionQueue;
      self->_addressResolutionQueue = v15;

      addressResolutionQueue = self->_addressResolutionQueue;
      return addressResolutionQueue;
    }
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] initialising address resolution queue", buf, 0xCu);

    goto LABEL_9;
  }
  return addressResolutionQueue;
}

- (void)_resolveContactIdentifier:(id)a3 addressIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, void *);
  id v11;
  NSObject *v12;
  AddressBookAddress *v13;
  AddressBookAddress *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *i;
  void *v29;
  id v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void (**v36)(id, id, void *);
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  __CFString *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, void *))a5;
  v11 = sub_10040E5B8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = self;
    v14 = v13;
    if (!v13)
    {
      v20 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v15 = (objc_class *)objc_opt_class(v13);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
      v19 = v18;
      if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
      {
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

        goto LABEL_8;
      }

    }
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543874;
    v44 = v20;
    v45 = 2114;
    v46 = v8;
    v47 = 2114;
    v48 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] will resolve contact ID %{public}@, address ID %{public}@", buf, 0x20u);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contactForCNContactIdentifier:", v8));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "postalAddresses"));
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v24)
  {
    v25 = v24;
    v34 = v22;
    v35 = v21;
    v36 = v10;
    v37 = v8;
    v26 = 0;
    v27 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(v23);
        v29 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v9, "length"))
        {
          v30 = v29;

          if (-[PersistentAddressBookAddress addressID](self, "addressID") == -1)
          {
            v33 = 0;
            goto LABEL_26;
          }
          v26 = v30;
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
        v32 = objc_msgSend(v31, "isEqualToString:", v9);

        if (v32)
        {
          v30 = v29;

          v21 = v35;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mapItemFormShortcutForCNIdentifier:", v9));
          v10 = v36;
          v8 = v37;
          goto LABEL_27;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v25)
        continue;
      break;
    }
    v33 = 0;
    v30 = v26;
LABEL_26:
    v10 = v36;
    v8 = v37;
    v21 = v35;
LABEL_27:
    v22 = v34;
  }
  else
  {
    v33 = 0;
    v30 = 0;
  }

  v10[2](v10, v30, v33);
}

- (void)_handleResolvedAddress:(id)a3 geocodedMapItem:(id)a4
{
  CNLabeledValue *v6;
  MKMapItem *v7;
  id v8;
  NSObject *v9;
  AddressBookAddress *v10;
  AddressBookAddress *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  CNLabeledValue *address;
  CNLabeledValue *v19;
  NSString *v20;
  NSString *addressIdentifier;
  MKMapItem *geocodedMapItem;
  MKMapItem *v23;
  MKMapItem *generatedMapItemCache;
  NSString *v25;
  NSString *contactIdentifier;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  CNLabeledValue *v30;
  __int16 v31;
  MKMapItem *v32;

  v6 = (CNLabeledValue *)a3;
  v7 = (MKMapItem *)a4;
  v8 = sub_10040E5B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = self;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_8;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543875;
    v28 = v17;
    v29 = 2113;
    v30 = v6;
    v31 = 2113;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] storing resolved address and map item (address: %{private}@, mapItem: %{private}@", buf, 0x20u);

  }
  address = self->_address;
  self->_address = v6;
  v19 = v6;

  v20 = (NSString *)objc_claimAutoreleasedReturnValue(-[CNLabeledValue identifier](v19, "identifier"));
  addressIdentifier = self->_addressIdentifier;
  self->_addressIdentifier = v20;

  geocodedMapItem = self->_geocodedMapItem;
  self->_geocodedMapItem = v7;
  v23 = v7;

  generatedMapItemCache = self->_generatedMapItemCache;
  self->_generatedMapItemCache = 0;

  v25 = (NSString *)objc_claimAutoreleasedReturnValue(-[CNContact identifier](self->_contact, "identifier"));
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v25;

}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_contactIdentifier, "hash");
  return -[NSString hash](self->_contactIdentifier, "hash") ^ v3;
}

- (CNLabeledValue)addressValue
{
  return self->_address;
}

- (NSString)localizedLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CNLabeledValue label](self->_address, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNLabeledValue localizedStringForLabel:](CNLabeledValue, "localizedStringForLabel:", v2));

  return (NSString *)v3;
}

- (MKMapItem)generatedMapItem
{
  MKMapItem *geocodedMapItem;
  id v4;
  NSObject *v5;
  AddressBookAddress *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  id v17;
  void *v18;
  MKMapItem *v19;
  MKMapItem *generatedMapItemCache;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;

  geocodedMapItem = self->_geocodedMapItem;
  if (!geocodedMapItem)
  {
    geocodedMapItem = self->_generatedMapItemCache;
    if (!geocodedMapItem)
    {
      v4 = sub_10040E5B8();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CNLabeledValue value](self->_address, "value"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionaryRepresentation"));

        v15 = objc_alloc((Class)GEOMapItemAssistant);
        LODWORD(v16) = 0;
        LODWORD(v22) = 0;
        v17 = objc_msgSend(v15, "initWithWithLocation:addressDictionary:name:businessURL:phoneNumber:sessionID:muid:attributionID:sampleSizeForUserRatingScore:normalizedUserRatingScore:", 0, v14, 0, 0, 0, 0, v16, 0, 0, v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress contact](self, "contact"));
        v19 = (MKMapItem *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithContact:geoMapItem:](MKMapItem, "_itemWithContact:geoMapItem:", v18, v17));
        generatedMapItemCache = self->_generatedMapItemCache;
        self->_generatedMapItemCache = v19;

        geocodedMapItem = self->_generatedMapItemCache;
        return geocodedMapItem;
      }
      v6 = self;
      v7 = (objc_class *)objc_opt_class(v6);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
        v11 = v10;
        if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

          goto LABEL_9;
        }

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_9:

      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] generating map item cache", buf, 0xCu);

      goto LABEL_10;
    }
  }
  return geocodedMapItem;
}

- (NSString)shortAddress
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress generatedMapItem](self, "generatedMapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_addressFormattedAsShortenedAddress"));

  return (NSString *)v3;
}

- (NSString)singleLineAddress
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress generatedMapItem](self, "generatedMapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_addressFormattedAsSinglelineAddress"));

  return (NSString *)v3;
}

- (NSString)compositeName
{
  void *v3;
  void *v4;

  if (-[AddressBookAddress isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress contact](self, "contact"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v3, 0));

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)waypointCompositeName
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  unsigned int v12;
  int v13;
  void *v14;
  const __CFString *v15;
  void *v17;

  if (-[AddressBookAddress isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress compositeName](self, "compositeName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress localizedLabel](self, "localizedLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedCapitalizedString"));

    if (!v3 || !v5)
    {
      v10 = v3;
LABEL_18:

      return (NSString *)v10;
    }
    v6 = -[AddressBookAddress addressType](self, "addressType");
    switch(v6)
    {
      case 3u:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Contact_Address_Book_School_Location_Waypoint_Name");
        break;
      case 2u:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Contact_Address_Book_Work_Location_Waypoint_Name");
        break;
      case 1u:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Contact_Address_Book_Home_Location_Waypoint_Name");
        break;
      default:
        v12 = -[CNLabeledValue iOSLegacyIdentifier](self->_address, "iOSLegacyIdentifier");
        v13 = CNContactIOSLegacyIdentifierInvalid;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v14;
        if (v12 == v13)
          v15 = CFSTR("Contact_Address_Book_Find_My_Cached_Location_Waypoint_Name");
        else
          v15 = CFSTR("Contact_Address_Book_Other_Location_Waypoint_Name");
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v15, CFSTR("localized string not found"), 0));
        v17 = v5;
        goto LABEL_17;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));
LABEL_17:
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v3, v17));

    goto LABEL_18;
  }
  v10 = 0;
  return (NSString *)v10;
}

- (NSString)phoneticName
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  AddressBookAddress *v7;
  AddressBookAddress *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  void *v19;

  if (!-[AddressBookAddress isValid](self, "isValid"))
    return (NSString *)0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress contact](self, "contact"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v3, 1));

  v5 = sub_10040E5B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_9;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543619;
    v17 = v14;
    v18 = 2113;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] generated phonetic name %{private}@", buf, 0x16u);

  }
  return (NSString *)v4;
}

- (NSString)spokenNameForNavigation
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  AddressBookAddress *v7;
  AddressBookAddress *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  void *v19;

  if (!-[AddressBookAddress isValid](self, "isValid"))
    return (NSString *)0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress contact](self, "contact"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_spokenNameForNavigation"));

  v5 = sub_10040E5B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_9;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543619;
    v17 = v14;
    v18 = 2113;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] generated spoken name for navigation: %{private}@", buf, 0x16u);

  }
  return (NSString *)v4;
}

- (int)addressType
{
  void *v3;
  id v4;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress contact](self, "contact"));
  v4 = objc_msgSend(v3, "contactType");

  if (v4)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNLabeledValue label](self->_address, "label"));
  v7 = objc_msgSend(v6, "isEqualToString:", CNLabelHome);

  if ((v7 & 1) != 0)
    return 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNLabeledValue label](self->_address, "label"));
  v9 = objc_msgSend(v8, "isEqualToString:", CNLabelWork);

  if ((v9 & 1) != 0)
    return 2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNLabeledValue label](self->_address, "label"));
  v11 = objc_msgSend(v10, "isEqualToString:", CNLabelSchool);

  if ((v11 & 1) == 0)
    return 0;
  return 3;
}

- (BOOL)isMeCard
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "meCard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  LOBYTE(self) = objc_msgSend(v5, "isEqualToString:", self->_contactIdentifier);

  return (char)self;
}

- (BOOL)isHomeWorkSchoolAddress
{
  unsigned int v3;

  v3 = -[AddressBookAddress isMeCard](self, "isMeCard");
  if (v3)
  {
    v3 = -[AddressBookAddress addressType](self, "addressType");
    if (v3 != 1)
      LOBYTE(v3) = -[AddressBookAddress addressType](self, "addressType") == 2
                || -[AddressBookAddress addressType](self, "addressType") == 3;
  }
  return v3;
}

- (NSDictionary)addressDictionary
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CNLabeledValue value](self->_address, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionaryRepresentation"));
  v4 = objc_msgSend(v3, "copy");

  return (NSDictionary *)v4;
}

- (BOOL)isValid
{
  return -[NSString length](self->_contactIdentifier, "length") != 0;
}

- (BOOL)hasStreetAddress
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CNLabeledValue value](self->_address, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "street"));
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)compositeNameMatchesForSearchString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress compositeName](self, "compositeName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_prefixMatchesForSearchString:", v4));

  return v6;
}

- (void)_updateMapItemClientAttributes
{
  void *v3;
  id v4;
  NSObject *v5;
  AddressBookAddress *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  id v21;
  void *v22;
  void *v23;
  MKMapItem *v24;
  MKMapItem *geocodedMapItem;
  uint8_t buf[4];
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_geocodedMapItem, "_geoMapItem"));
  if (!v3)
    goto LABEL_16;
  v4 = sub_10040E5B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] updating map item client attributes", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_clientAttributes"));
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = objc_alloc_init((Class)GEOMapItemClientAttributes);
  v16 = v15;

  v17 = -[AddressBookAddress addressType](self, "addressType");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress contact](self, "contact"));
  if (v18)
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v18, 0));
  else
    v19 = 0;
  v20 = -[AddressBookAddress isMeCard](self, "isMeCard");
  v21 = objc_alloc_init((Class)GEOMapItemAddressBookAttributes);
  objc_msgSend(v21, "setAddressType:", v17);
  objc_msgSend(v21, "setIsMe:", v20);
  objc_msgSend(v21, "setName:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CNLabeledValue identifier](self->_address, "identifier"));
  objc_msgSend(v21, "setAddressIdentifier:", v22);

  objc_msgSend(v16, "setAddressBookAttributes:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:clientAttributes:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:clientAttributes:", v3, v16));
  v24 = (MKMapItem *)objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v23, 0);
  geocodedMapItem = self->_geocodedMapItem;
  self->_geocodedMapItem = v24;

LABEL_16:
}

- (id)thumbnailIconWithScale:(double)a3 size:(unint64_t)a4
{
  unsigned int v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  AddressBookAddress *v12;
  AddressBookAddress *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  id v20;
  NSObject *v21;
  AddressBookAddress *v22;
  AddressBookAddress *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  float v30;
  uint64_t v31;
  float v32;
  void *v33;
  uint8_t buf[4];
  __CFString *v36;
  __int16 v37;
  double v38;
  __int16 v39;
  unint64_t v40;

  v7 = -[AddressBookAddress addressType](self, "addressType");
  switch(v7)
  {
    case 3u:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
      break;
    case 2u:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
      break;
    case 1u:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
      break;
    default:
      goto LABEL_16;
  }
  v9 = (void *)v8;
  if (v8)
  {
    v10 = sub_10040E5B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_29:

      v31 = objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v9, a4, 0, a3));
      goto LABEL_30;
    }
    v12 = self;
    v13 = v12;
    if (!v12)
    {
      v19 = CFSTR("<nil>");
      goto LABEL_28;
    }
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_15;
      }

    }
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_15:

LABEL_28:
    v32 = a3;
    *(_DWORD *)buf = 138543874;
    v36 = v19;
    v37 = 2048;
    v38 = v32;
    v39 = 2048;
    v40 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] generating thumbnail for scale %#.1lf, size %lu", buf, 0x20u);

    goto LABEL_29;
  }
LABEL_16:
  v20 = sub_10040E5B8();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = self;
    v23 = v22;
    if (!v22)
    {
      v29 = CFSTR("<nil>");
      goto LABEL_25;
    }
    v24 = (objc_class *)objc_opt_class(v22);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if ((objc_opt_respondsToSelector(v23, "accessibilityIdentifier") & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v23, "performSelector:", "accessibilityIdentifier"));
      v28 = v27;
      if (v27 && !objc_msgSend(v27, "isEqualToString:", v26))
      {
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v26, v23, v28));

        goto LABEL_23;
      }

    }
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v26, v23));
LABEL_23:

LABEL_25:
    v30 = a3;
    *(_DWORD *)buf = 138543874;
    v36 = v29;
    v37 = 2048;
    v38 = v30;
    v39 = 2048;
    v40 = a4;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}@] generating marker thumbnail for scale %#.1lf, size %lu", buf, 0x20u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress geocodedMapItem](self, "geocodedMapItem"));
  v31 = objc_claimAutoreleasedReturnValue(+[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v9, a4, 0, a3));
LABEL_30:
  v33 = (void *)v31;

  return v33;
}

+ (id)_geocodedMapItemsByAddress
{
  if (qword_1014D2470 != -1)
    dispatch_once(&qword_1014D2470, &stru_1011B5560);
  return (id)qword_1014D2468;
}

+ (id)_completionsByAddress
{
  if (qword_1014D2480 != -1)
    dispatch_once(&qword_1014D2480, &stru_1011B5580);
  return (id)qword_1014D2478;
}

+ (id)_completionQueue
{
  if (qword_1014D2490 != -1)
    dispatch_once(&qword_1014D2490, &stru_1011B55A0);
  return (id)qword_1014D2488;
}

+ (void)didReceiveMemoryWarning
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_geocodedMapItemsByAddress"));
  objc_msgSend(v2, "removeAllObjects");

}

- (void)forwardGeocodeAddress:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  AddressBookAddress *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  id *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id location;
  uint8_t buf[4];
  void *v26;

  v4 = a3;
  objc_initWeak(&location, self);
  if (!self->_geocodedMapItem)
  {
    v16 = objc_msgSend((id)objc_opt_class(self), "_completionQueue");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100411D0C;
    v18[3] = &unk_1011B0300;
    v14 = &v20;
    objc_copyWeak(&v20, &location);
    v18[4] = self;
    v19 = v4;
    dispatch_async(v17, v18);

    v15 = &v19;
    goto LABEL_12;
  }
  v5 = sub_10040E5B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && (objc_msgSend(v11, "isEqualToString:", v10) & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] will not forward geocode address, already have geocoded map item, returning that", buf, 0xCu);

  }
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100411C8C;
    block[3] = &unk_1011B0520;
    v14 = &v23;
    objc_copyWeak(&v23, &location);
    v15 = &v22;
    v22 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
LABEL_12:

    objc_destroyWeak(v14);
  }
  objc_destroyWeak(&location);

}

- (OS_dispatch_queue)addressResolutionQueue
{
  return self->_addressResolutionQueue;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (CNContact)contact
{
  return (CNContact *)objc_getProperty(self, a2, 88, 1);
}

- (void)setContact:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)addressIdentifier
{
  return self->_addressIdentifier;
}

- (void)setAddressValue:(id)a3
{
  objc_storeStrong((id *)&self->_addressValue, a3);
}

- (void)setGeocodedMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_geocodedMapItem, a3);
}

- (NSError)geocodingError
{
  return self->_geocodingError;
}

- (MapsLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_locationOfInterest, a3);
}

- (MKMapItem)generatedMapItemCache
{
  return self->_generatedMapItemCache;
}

- (void)setGeneratedMapItemCache:(id)a3
{
  objc_storeStrong((id *)&self->_generatedMapItemCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedMapItemCache, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_geocodingError, 0);
  objc_storeStrong((id *)&self->_geocodedMapItem, 0);
  objc_storeStrong((id *)&self->_addressValue, 0);
  objc_storeStrong((id *)&self->_addressIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_addressResolutionQueue, 0);
  objc_storeStrong((id *)&self->_shortAddress, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_deferredAddressResolutionTimer, 0);
}

- (id)_carMeCardTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress addressValue](self, "addressValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "label"));

  if (objc_msgSend(v3, "isEqualToString:", CNLabelHome))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("CarPlay Me Card Home");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CNLabelWork))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("CarPlay Me Card Work");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CNLabelSchool))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("CarPlay Me Card School");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CNLabelOther))
    {
      v7 = v3;
      goto LABEL_10;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("CarPlay Me Card Other");
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

LABEL_10:
  return v7;
}

- (void)updateModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress geocodedMapItem](self, "geocodedMapItem"));
  objc_msgSend(v4, "setMapItem:", v5);

  if (-[AddressBookAddress isMeCard](self, "isMeCard"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress _carMeCardTitle](self, "_carMeCardTitle"));
    v7 = CFSTR("me");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress compositeName](self, "compositeName"));
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress compositeName](self, "compositeName"));
      v7 = CFSTR("composite");
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress shortAddress](self, "shortAddress"));
      v7 = CFSTR("address");
    }
  }
  objc_msgSend(v4, "setFirstLine:", v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress singleLineAddress](self, "singleLineAddress"));
  objc_msgSend(v4, "setSecondLine:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Contacts %@]"), v7));
  objc_msgSend(v4, "setDebugSubtitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  if (!v12)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10049E114;
    v13[3] = &unk_1011AF308;
    v14 = v4;
    -[AddressBookAddress forwardGeocodeAddress:](self, "forwardGeocodeAddress:", v13);

  }
}

- (id)entryWithTicket:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (-[AddressBookAddress isValid](self, "isValid", a3))
  {
    v4 = objc_msgSend(objc_alloc((Class)GEORPSuggestionEntry), "initWithType:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress compositeName](self, "compositeName"));
    objc_msgSend(v4, "safeAddDisplayLine:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress singleLineAddress](self, "singleLineAddress"));
    objc_msgSend(v4, "safeAddDisplayLine:", v6);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
