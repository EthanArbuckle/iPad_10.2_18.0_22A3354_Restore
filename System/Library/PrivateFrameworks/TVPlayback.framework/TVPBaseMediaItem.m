@implementation TVPBaseMediaItem

- (id)mediaItemMetadataForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_metadataDictionary, "objectForKey:", a3);
}

uint64_t __65__TVPBaseMediaItem_performMediaItemMetadataTransactionWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setMetadata:forProperty:postNotification:", a3, a2, 0);
}

- (TVPBaseMediaItem)init
{
  TVPBaseMediaItem *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TVPBaseMediaItem;
  v2 = -[TVPBaseMediaItem init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@)"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPBaseMediaItem _setMetadata:forProperty:postNotification:](v2, "_setMetadata:forProperty:postNotification:", v6, CFSTR("TVPMediaItemMetadataServiceIdentifier"), 0);

  }
  return v2;
}

- (void)performMediaItemMetadataTransactionWithBlock:(id)a3
{
  objc_class *v4;
  void (**v5)(_QWORD);
  NSMutableDictionary *v6;
  NSMutableDictionary *transactionDictionary;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  _QWORD v11[5];

  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = (void (**)(_QWORD))a3;
  v6 = (NSMutableDictionary *)objc_alloc_init(v4);
  transactionDictionary = self->_transactionDictionary;
  self->_transactionDictionary = v6;

  v5[2](v5);
  -[NSMutableDictionary allKeys](self->_transactionDictionary, "allKeys");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[TVPBaseMediaItem _postMetadataWillChangeNotificationWithMetadataProperties:](self, "_postMetadataWillChangeNotificationWithMetadataProperties:", v10);
    v8 = self->_transactionDictionary;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__TVPBaseMediaItem_performMediaItemMetadataTransactionWithBlock___block_invoke;
    v11[3] = &unk_24F15DDB0;
    v11[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v11);
    -[TVPBaseMediaItem _postMetadataDidChangeNotificationWithMetadataProperties:](self, "_postMetadataDidChangeNotificationWithMetadataProperties:", v10);
  }
  v9 = self->_transactionDictionary;
  self->_transactionDictionary = 0;

}

- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4
{
  id v6;
  NSMutableDictionary *transactionDictionary;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    transactionDictionary = self->_transactionDictionary;
    if (transactionDictionary)
      -[NSMutableDictionary setObject:forKey:](transactionDictionary, "setObject:forKey:", v8, v6);
    else
      -[TVPBaseMediaItem _setMetadata:forProperty:postNotification:](self, "_setMetadata:forProperty:postNotification:", v8, v6, 1);
  }

}

- (void)_setMetadata:(id)a3 forProperty:(id)a4 postNotification:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *metadataDictionary;
  void *v12;
  id v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v5 = a5;
  v17[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (!self->_metadataDictionary)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      metadataDictionary = self->_metadataDictionary;
      self->_metadataDictionary = v10;

    }
    if (v5)
    {
      v17[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPBaseMediaItem _postMetadataWillChangeNotificationWithMetadataProperties:](self, "_postMetadataWillChangeNotificationWithMetadataProperties:", v12);

    }
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v14 = self->_metadataDictionary;
      if (v13 != v8)
      {
        -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v8, v9);
        if (!v5)
          goto LABEL_13;
        goto LABEL_12;
      }
    }
    else
    {
      v14 = self->_metadataDictionary;
    }
    -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v9);
    if (v5)
    {
LABEL_12:
      v16 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPBaseMediaItem _postMetadataDidChangeNotificationWithMetadataProperties:](self, "_postMetadataDidChangeNotificationWithMetadataProperties:", v15);

    }
  }
LABEL_13:

}

- (void)_postMetadataWillChangeNotificationWithMetadataProperties:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("TVPMediaItemMetadataChangesKey");
  v9[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("TVPMediaItemMetadataWillChangeNotification"), self, v6);
}

- (void)_postMetadataDidChangeNotificationWithMetadataProperties:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("TVPMediaItemMetadataChangesKey");
  v9[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("TVPMediaItemMetadataDidChangeNotification"), self, v6);
}

- (BOOL)hasTrait:(id)a3
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TVPBaseMediaItem;
  -[TVPBaseMediaItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPBaseMediaItem mediaItemMetadataForProperty:](self, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDictionary, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

- (id)mediaItemURL
{
  return 0;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  return self == a3;
}

- (void)removeMediaItemMetadataForProperty:(id)a3
{
  id v4;
  NSMutableDictionary *transactionDictionary;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    transactionDictionary = self->_transactionDictionary;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (transactionDictionary)
      -[NSMutableDictionary setObject:forKey:](transactionDictionary, "setObject:forKey:", v6, v7);
    else
      -[TVPBaseMediaItem _setMetadata:forProperty:postNotification:](self, "_setMetadata:forProperty:postNotification:", v6, v7, 1);

    v4 = v7;
  }

}

- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6
{
  id v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6, a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TVPBaseMediaItem setMediaItemMetadata:forProperty:](self, "setMediaItemMetadata:forProperty:", v7, CFSTR("TVPMediaItemMetadataBookmarkNetTime"));

}

- (id)reportingDelegate
{
  return 0;
}

@end
