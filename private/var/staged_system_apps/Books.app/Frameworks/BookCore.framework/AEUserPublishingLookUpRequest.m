@implementation AEUserPublishingLookUpRequest

+ (id)_keyProfileFromAEKeyProfile:(id)a3
{
  id v3;
  id *v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kAEUserPublishingLookProfileURL")) & 1) != 0)
  {
    v4 = (id *)&AMSLookupKeyProfileURL;
LABEL_7:
    v5 = (__CFString *)*v4;
    goto LABEL_8;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kAEUserPublishingLookProfileProduct")) & 1) != 0)
  {
    v4 = (id *)&AMSLookupKeyProfileProduct;
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kAEUserPublishingLookProfileLockUp")) & 1) != 0)
  {
    v4 = (id *)&AMSLookupKeyProfileLockup;
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("kAEUserPublishingLookProfileDescriptionLockUp")))
    v5 = CFSTR("description-lockup");
  else
    v5 = 0;
LABEL_8:

  return v5;
}

+ (BOOL)isEnabled
{
  return NSClassFromString(CFSTR("AMSLookup")) != 0;
}

+ (id)resultsDictionaryFromLookupResult:(id)a3
{
  return _objc_msgSend(a3, "valueForProperty:", AMSLookupPropertyResults);
}

- (AEUserPublishingLookUpRequest)initWithAdamIDs:(id)a3 keyProfile:(id)a4
{
  id v6;
  id v7;
  AEUserPublishingLookUpRequest *v8;
  Class v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  AMSLookup *v16;
  AMSLookup *lookup;
  NSArray *v18;
  NSArray *itemIdentifiers;

  v6 = a3;
  v7 = a4;
  v8 = -[AEUserPublishingLookUpRequest init](self, "init");
  if (v8)
  {
    v9 = NSClassFromString(CFSTR("AMSLookup"));
    if (v9)
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));

      v14 = objc_msgSend((id)objc_opt_class(v8), "_keyProfileFromAEKeyProfile:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (AMSLookup *)objc_msgSend([v10 alloc], "initWithBag:caller:keyProfile:", v11, v13, v15);
      lookup = v8->_lookup;
      v8->_lookup = v16;

      v18 = (NSArray *)objc_msgSend(v6, "copy");
      itemIdentifiers = v8->_itemIdentifiers;
      v8->_itemIdentifiers = v18;

    }
  }

  return v8;
}

- (void)cancel
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AEUserPublishingLookUpRequest lookupResultPromise](self, "lookupResultPromise"));
  objc_msgSend(v2, "cancel");

}

- (void)startWithLookupBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingLookUpRequest lookup](self, "lookup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingLookUpRequest itemIdentifiers](self, "itemIdentifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "performLookupWithBundleIdentifiers:itemIdentifiers:", 0, v6));
  -[AEUserPublishingLookUpRequest setLookupResultPromise:](self, "setLookupResultPromise:", v7);

  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingLookUpRequest lookupResultPromise](self, "lookupResultPromise"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_5726C;
  v10[3] = &unk_28DB30;
  objc_copyWeak(&v12, &location);
  v9 = v4;
  v11 = v9;
  objc_msgSend(v8, "addFinishBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (id)resultWithTimeout:(double)a3 Error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingLookUpRequest lookup](self, "lookup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingLookUpRequest itemIdentifiers](self, "itemIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "performLookupWithBundleIdentifiers:itemIdentifiers:", 0, v8));
  -[AEUserPublishingLookUpRequest setLookupResultPromise:](self, "setLookupResultPromise:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingLookUpRequest lookupResultPromise](self, "lookupResultPromise"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resultWithTimeout:error:", a4, a3));

  return v11;
}

- (AMSLookup)lookup
{
  return self->_lookup;
}

- (void)setLookup:(id)a3
{
  objc_storeStrong((id *)&self->_lookup, a3);
}

- (AMSPromise)lookupResultPromise
{
  return self->_lookupResultPromise;
}

- (void)setLookupResultPromise:(id)a3
{
  objc_storeStrong((id *)&self->_lookupResultPromise, a3);
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_lookupResultPromise, 0);
  objc_storeStrong((id *)&self->_lookup, 0);
}

@end
