@implementation WLKContinuationMetadata

- (WLKContinuationMetadata)initWithDictionary:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  WLKContinuationMetadata *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  WLKPlayable *v12;
  WLKPlayable *playable;
  uint64_t v14;
  NSString *deleteID;
  uint64_t v16;
  NSNumber *siriActionsExpirationEpochMillis;
  void *v18;
  uint64_t v19;
  NSArray *siriActionsCategories;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WLKContinuationMetadata;
  v8 = -[WLKContinuationMetadataBase initWithDictionary:context:](&v22, sel_initWithDictionary_context_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("playable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wlk_arrayForKey:", CFSTR("playables"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "firstObject");
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }
    if (v9)
    {
      v12 = -[WLKPlayable initWithDictionary:context:]([WLKPlayable alloc], "initWithDictionary:context:", v9, v7);
      playable = v8->_playable;
      v8->_playable = v12;

    }
    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("deleteId"));
    v14 = objc_claimAutoreleasedReturnValue();
    deleteID = v8->_deleteID;
    v8->_deleteID = (NSString *)v14;

    objc_msgSend(v6, "wlk_numberForKey:", CFSTR("siriActionsExpirationEpochMillis"));
    v16 = objc_claimAutoreleasedReturnValue();
    siriActionsExpirationEpochMillis = v8->_siriActionsExpirationEpochMillis;
    v8->_siriActionsExpirationEpochMillis = (NSNumber *)v16;

    objc_msgSend(v6, "wlk_arrayForKey:", CFSTR("siriActionsCategories"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    siriActionsCategories = v8->_siriActionsCategories;
    v8->_siriActionsCategories = (NSArray *)v19;

  }
  return v8;
}

- (WLKPlayable)playable
{
  return self->_playable;
}

- (NSString)deleteID
{
  return self->_deleteID;
}

- (NSNumber)siriActionsExpirationEpochMillis
{
  return self->_siriActionsExpirationEpochMillis;
}

- (NSArray)siriActionsCategories
{
  return self->_siriActionsCategories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriActionsCategories, 0);
  objc_storeStrong((id *)&self->_siriActionsExpirationEpochMillis, 0);
  objc_storeStrong((id *)&self->_deleteID, 0);
  objc_storeStrong((id *)&self->_playable, 0);
}

@end
