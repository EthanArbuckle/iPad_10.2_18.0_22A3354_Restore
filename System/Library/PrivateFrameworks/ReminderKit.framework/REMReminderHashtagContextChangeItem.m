@implementation REMReminderHashtagContextChangeItem

- (REMReminderHashtagContextChangeItem)initWithReminderChangeItem:(id)a3
{
  id v5;
  REMReminderHashtagContextChangeItem *v6;
  REMReminderHashtagContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderHashtagContextChangeItem;
  v6 = -[REMReminderHashtagContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reminderChangeItem, a3);

  return v7;
}

- (NSSet)hashtags
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hashtags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSSet *)v6;
}

- (void)addHashtag:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Adding hashtag {reminderChangeItem: %@, hashtag: %@}", (uint8_t *)&v11, 0x16u);

  }
  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hashtags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v9, "addObject:", v4);
  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHashtags:", v9);

}

- (id)addHashtagWithType:(int64_t)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  REMHashtag *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  REMHashtag *v14;

  v6 = a4;
  v7 = +[REMHashtag newObjectID](REMHashtag, "newObjectID");
  -[REMReminderHashtagContextChangeItem nameWithDisallowedCharactersReplaced:](self, "nameWithDisallowedCharactersReplaced:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [REMHashtag alloc];
  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[REMHashtag initWithObjectID:accountID:reminderID:type:name:](v9, "initWithObjectID:accountID:reminderID:type:name:", v7, v11, v13, a3, v8);

  -[REMReminderHashtagContextChangeItem addHashtag:](self, "addHashtag:", v14);
  return v14;
}

- (id)addHashtagWithType:(int64_t)a3 name:(id)a4 creationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  REMHashtag *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  REMHashtag *v17;

  v8 = a5;
  v9 = a4;
  v10 = +[REMHashtag newObjectID](REMHashtag, "newObjectID");
  -[REMReminderHashtagContextChangeItem nameWithDisallowedCharactersReplaced:](self, "nameWithDisallowedCharactersReplaced:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [REMHashtag alloc];
  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[REMHashtag initWithObjectID:accountID:reminderID:type:name:creationDate:](v12, "initWithObjectID:accountID:reminderID:type:name:creationDate:", v10, v14, v16, a3, v11, v8);

  -[REMReminderHashtagContextChangeItem addHashtag:](self, "addHashtag:", v17);
  return v17;
}

- (id)nameWithDisallowedCharactersReplaced:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "hashtagTokenAllowedCharacters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", &stru_1E67FB1F0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)removeHashtag:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Removing hashtag {reminderChangeItem: %@, hashtag: %@}", (uint8_t *)&v11, 0x16u);

  }
  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hashtags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObject:", v4);
  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHashtags:", v9);

}

- (void)removeAllHashtags
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hashtags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    +[REMLogStore write](REMLogStore, "write");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1B4A39000, v6, OS_LOG_TYPE_INFO, "Removing all hashtags {reminderChangeItem: %@}", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHashtags:", v8);

  }
}

- (void)undeleteHashtagWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hashtagIDsToUndelete");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHashtagIDsToUndelete:", v6);

}

- (void)cancelUndeleteHashtagWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hashtagIDsToUndelete");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v9, "removeObject:", v4);
  v7 = (void *)objc_msgSend(v9, "copy");
  -[REMReminderHashtagContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHashtagIDsToUndelete:", v7);

}

- (REMReminderChangeItem)reminderChangeItem
{
  return self->_reminderChangeItem;
}

- (void)setReminderChangeItem:(id)a3
{
  objc_storeStrong((id *)&self->_reminderChangeItem, a3);
}

- (NSMutableSet)mutableHashtags
{
  return self->_mutableHashtags;
}

- (void)setMutableHashtags:(id)a3
{
  objc_storeStrong((id *)&self->_mutableHashtags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableHashtags, 0);
  objc_storeStrong((id *)&self->_reminderChangeItem, 0);
}

@end
