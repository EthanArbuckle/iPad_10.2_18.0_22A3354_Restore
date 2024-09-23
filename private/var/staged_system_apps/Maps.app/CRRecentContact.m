@implementation CRRecentContact

- (void)updateModel:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRRecentContact metadata](self, "metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CRRecentContactMetadataFrom));

  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v10 = 0;
    goto LABEL_21;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CRRecentContactMetadataFromDisplayName));
  v8 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CRRecentContactMetadataFromAddress));

  v12 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    v13 = v11;
  else
    v13 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CRRecentContactMetadataFromAddressKind));

  if ((objc_msgSend(v14, "isEqual:", CRAddressKindEmail) & 1) != 0)
  {
    v15 = (id *)&CNContactEmailAddressesKey;
  }
  else
  {
    if (!objc_msgSend(v14, "isEqual:", CRAddressKindPhoneNumber))
    {
      v16 = 0;
LABEL_17:
      v18 = v9;
      if (!v18)
        v18 = v13;
      v10 = v18;
      goto LABEL_20;
    }
    v15 = (id *)&CNContactPhoneNumbersKey;
  }
  v16 = *v15;
  if (!v13)
    goto LABEL_17;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "senderNameForAddress:ofType:", v13, v16));

  if (!v10)
    goto LABEL_17;
LABEL_20:

LABEL_21:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRRecentContact address](self, "address"));
  objc_msgSend(v21, "setFirstLine:", v19);

  if (v10)
  {
    objc_msgSend(v21, "setSecondLine:", v10);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRRecentContact address](self, "address"));
    objc_msgSend(v21, "setSecondLine:", v20);

  }
  objc_msgSend(v21, "setDebugSubtitle:", CFSTR("[Recent Contact]"));

}

- (id)entryWithTicket:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend(objc_alloc((Class)GEORPSuggestionEntry), "initWithType:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRRecentContact address](self, "address"));
  objc_msgSend(v4, "safeAddDisplayLine:", v5);

  return v4;
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRRecentContact mostRecentDate](self, "mostRecentDate"));
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), -[CRRecentContact contactID](self, "contactID"));
}

@end
