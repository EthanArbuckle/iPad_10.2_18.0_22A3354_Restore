@implementation MOEventSharedWithYou

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *itemURL;
  id v5;

  itemURL = self->_itemURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemURL, CFSTR("itemURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemSenders, CFSTR("itemSenders"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemRecipients, CFSTR("itemRecipients"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_itemIsPinned, CFSTR("itemIsPinned"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_itemShareDirection != 0, CFSTR("itemShareDirection"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemSyndicationStatus, CFSTR("itemSyndicationStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemAttributionsCount, CFSTR("itemAttributionsCount"));

}

- (MOEventSharedWithYou)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MOEventSharedWithYou *v6;
  id v7;
  uint64_t v8;
  NSURL *itemURL;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSArray *itemSenders;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSArray *itemRecipients;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSNumber *itemAttributionsCount;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MOEventSharedWithYou;
  v6 = -[MOEventSharedWithYou init](&v23, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL, v5), CFSTR("itemURL"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    itemURL = v6->_itemURL;
    v6->_itemURL = (NSURL *)v8;

    v11 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("itemSenders"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    itemSenders = v6->_itemSenders;
    v6->_itemSenders = (NSArray *)v12;

    v15 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSString, v14), CFSTR("itemRecipients"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    itemRecipients = v6->_itemRecipients;
    v6->_itemRecipients = (NSArray *)v16;

    v6->_itemIsPinned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("itemIsPinned"));
    v6->_itemShareDirection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("itemShareDirection"));
    v6->_itemSyndicationStatus = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("itemSyndicationStatus"));
    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v18), CFSTR("itemAttributionsCount"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    itemAttributionsCount = v6->_itemAttributionsCount;
    v6->_itemAttributionsCount = (NSNumber *)v20;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventSharedWithYou *v4;

  v4 = objc_alloc_init(MOEventSharedWithYou);
  objc_storeStrong((id *)&v4->_itemURL, self->_itemURL);
  objc_storeStrong((id *)&v4->_itemSenders, self->_itemSenders);
  objc_storeStrong((id *)&v4->_itemRecipients, self->_itemRecipients);
  v4->_itemIsPinned = self->_itemIsPinned;
  v4->_itemShareDirection = self->_itemShareDirection;
  v4->_itemSyndicationStatus = self->_itemSyndicationStatus;
  objc_storeStrong((id *)&v4->_itemAttributionsCount, self->_itemAttributionsCount);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_itemURL, "absoluteString"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mask"));
  v6 = (void *)v5;
  if (self->_itemIsPinned)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("itemURL, %@, itemIsPinned, %@, itemShareDirection, %lu, itemAttributionsCount, %@"), v5, v7, self->_itemShareDirection, self->_itemAttributionsCount);

  return v8;
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemURL, a3);
}

- (NSArray)itemSenders
{
  return self->_itemSenders;
}

- (void)setItemSenders:(id)a3
{
  objc_storeStrong((id *)&self->_itemSenders, a3);
}

- (NSArray)itemRecipients
{
  return self->_itemRecipients;
}

- (void)setItemRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_itemRecipients, a3);
}

- (unint64_t)itemShareDirection
{
  return self->_itemShareDirection;
}

- (void)setItemShareDirection:(unint64_t)a3
{
  self->_itemShareDirection = a3;
}

- (BOOL)itemIsPinned
{
  return self->_itemIsPinned;
}

- (void)setItemIsPinned:(BOOL)a3
{
  self->_itemIsPinned = a3;
}

- (unint64_t)itemSyndicationStatus
{
  return self->_itemSyndicationStatus;
}

- (void)setItemSyndicationStatus:(unint64_t)a3
{
  self->_itemSyndicationStatus = a3;
}

- (NSNumber)itemAttributionsCount
{
  return self->_itemAttributionsCount;
}

- (void)setItemAttributionsCount:(id)a3
{
  objc_storeStrong((id *)&self->_itemAttributionsCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemAttributionsCount, 0);
  objc_storeStrong((id *)&self->_itemRecipients, 0);
  objc_storeStrong((id *)&self->_itemSenders, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
}

@end
