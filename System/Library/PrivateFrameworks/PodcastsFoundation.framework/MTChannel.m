@implementation MTChannel

+ (id)predicateForChannelWithStoreId:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("storeId"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForChannelStoreIds:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("storeId"), a3);
}

+ (id)predicateForSingleShowChannel
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == 1 || %K == 1"), CFSTR("availableShowCount"), CFSTR("showCount"));
}

+ (id)predicateForMultiShowChannel
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 1 || %K > 1"), CFSTR("availableShowCount"), CFSTR("showCount"));
}

+ (id)predicateForFollowedChannel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0"), CFSTR("followedShowCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForSubscribedChannel
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES"), CFSTR("subscriptionActive"));
}

+ (id)predicateForLibraryChannel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  +[MTChannel predicateForMultiShowChannel](MTChannel, "predicateForMultiShowChannel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v4 = (void *)MEMORY[0x1E0CB3528];
  +[MTChannel predicateForSubscribedChannel](MTChannel, "predicateForSubscribedChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  +[MTChannel predicateForFollowedChannel](MTChannel, "predicateForFollowedChannel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)createOrFindChannelFromFeedChannelItem:(id)a3 personalizedRequest:(BOOL)a4 context:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "storeId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longLongValue");

  objc_msgSend(v8, "channelForStoreId:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("MTChannel"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStoreId:", v10);
  }
  objc_msgSend(v7, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setName:", v12);

  objc_msgSend(v7, "displayType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisplayType:", v13);

  objc_msgSend(v7, "artworkURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setArtworkURL:", v14);

  objc_msgSend(v7, "logoImageURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLogoImageURL:", v15);

  objc_msgSend(v7, "logoImageWidth");
  objc_msgSend(v11, "setLogoImageWidth:");
  objc_msgSend(v7, "logoImageHeight");
  objc_msgSend(v11, "setLogoImageHeight:");
  objc_msgSend(v7, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v16);

  objc_msgSend(v7, "uberBackgroundJoeColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUberBackgroundJoeColor:", v17);

  objc_msgSend(v7, "uberBackgroundImageURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUberBackgroundImageURL:", v18);

  objc_msgSend(v7, "url");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUrl:", v19);

  objc_msgSend(v11, "setShowCount:", objc_msgSend(v7, "showCount"));
  if (v6)
    objc_msgSend(v11, "setAvailableShowCount:", objc_msgSend(v7, "availableShowCount"));
  objc_msgSend(v7, "subscriptionName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20 && objc_msgSend(v20, "length"))
  {
    objc_msgSend(v11, "setSubscriptionName:", v21);
  }
  else if ((objc_msgSend(v11, "subscriptionActive") & 1) == 0)
  {
    objc_msgSend(v7, "fallbackSubscriptionName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSubscriptionName:", v22);

  }
  return v11;
}

+ (id)sortDescriptorsForLibraryChannelsPage:(BOOL)a3
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("interest.interestValue"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("name"), 1, sel_localizedStandardCompare_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    v5 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("subscriptionActive"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("name"), 1, sel_localizedStandardCompare_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v4;
    v5 = v8;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)resolvedShowCount
{
  if (-[MTChannel availableShowCount](self, "availableShowCount") < 1)
    return -[MTChannel showCount](self, "showCount");
  else
    return -[MTChannel availableShowCount](self, "availableShowCount");
}

- (BOOL)isMultiShow
{
  return -[MTChannel resolvedShowCount](self, "resolvedShowCount") > 1;
}

- (BOOL)isSingleShow
{
  return -[MTChannel resolvedShowCount](self, "resolvedShowCount") < 2;
}

@end
