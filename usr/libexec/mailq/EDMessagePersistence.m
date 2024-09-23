@implementation EDMessagePersistence

- (id)deliveryInfoForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MessageDeliveryInfo *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EDMessagePersistence cachedMetadataJSONForKey:messageID:](self, "cachedMetadataJSONForKey:messageID:", CFSTR("maild.deliveryInfo"), v6));

    v8 = -[MessageDeliveryInfo initWithJSON:]([MessageDeliveryInfo alloc], "initWithJSON:", v7);
  }
  else
  {
    v8 = objc_alloc_init(MessageDeliveryInfo);
  }

  return v8;
}

- (void)setDeliveryInfo:(id)a3 forMessage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "encodedAsJSON"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
    -[EDMessagePersistence setCachedMetadataJSON:forKey:messageID:](self, "setCachedMetadataJSON:forKey:messageID:", v7, CFSTR("maild.deliveryInfo"), v8);

  }
}

- (int64_t)mailDropDeliveryStateForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  signed int v9;
  int64_t v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EDMessagePersistence cachedMetadataJSONForKey:messageID:](self, "cachedMetadataJSONForKey:messageID:", CFSTR("maild.mailDropDeliveryState"), v6));

    if (v7)
    {
      v8 = objc_msgSend(v7, "intValue");
      if (v8 - 9 >= 0xFFFFFFF8)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setMailDropDeliveryState:(int64_t)a3 forMessage:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  if (v6)
  {
    v8 = v6;
    if (a3)
    {
      a3 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3));
      v6 = v8;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
    -[EDMessagePersistence setCachedMetadataJSON:forKey:messageID:](self, "setCachedMetadataJSON:forKey:messageID:", a3, CFSTR("maild.mailDropDeliveryState"), v7);

    v6 = v8;
  }

}

@end
