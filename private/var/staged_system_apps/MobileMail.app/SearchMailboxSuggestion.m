@implementation SearchMailboxSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)suggestionForMailboxes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithMailboxes:", v4);

  return v5;
}

- (SearchMailboxSuggestion)initWithMailboxes:(id)a3
{
  id v4;
  SearchMailboxSuggestion *v5;
  NSArray *v6;
  NSArray *mailboxes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchMailboxSuggestion;
  v5 = -[SearchMailboxSuggestion init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    mailboxes = v5->_mailboxes;
    v5->_mailboxes = v6;

  }
  return v5;
}

- (SearchMailboxSuggestion)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  NSSet *v6;
  void *v7;
  void *v8;
  SearchMailboxSuggestion *v9;

  v4 = a3;
  v5 = objc_opt_class(NSArray);
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(EMMailbox), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("EFPropertyKey_mailboxes")));

  v9 = -[SearchMailboxSuggestion initWithMailboxes:](self, "initWithMailboxes:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_opt_self(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxes"));
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_self.mailboxes"));

}

- (id)category
{
  return +[MUISearchSuggestionCategory mailboxCategory](MUISearchSuggestionCategory, "mailboxCategory");
}

- (id)title
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchMailboxSuggestion mailboxes](self, "mailboxes"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 >= 2)
  {
    v5 = sub_1001D2528();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1003957C4(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchMailboxSuggestion mailboxes](self, "mailboxes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));

  return v16;
}

- (id)subtitle
{
  NSString *subtitle;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSBundle *v24;
  void *v25;
  void *v26;
  void *v27;
  NSString *v28;
  NSString *v29;

  subtitle = self->_subtitle;
  if (!subtitle)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchMailboxSuggestion mailboxes](self, "mailboxes"));
    v5 = objc_msgSend(v4, "count");

    if ((unint64_t)v5 >= 2)
    {
      v6 = sub_1001D2528();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1003957F8(v7, v8, v9, v10, v11, v12, v13, v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchMailboxSuggestion mailboxes](self, "mailboxes"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "parent"));
    if (v18)
    {
      do
      {
        if ((objc_msgSend(v18, "isTopLevelMailbox") & 1) != 0)
          break;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
        objc_msgSend(v15, "insertObject:atIndex:", v19, 0);

        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "parent"));
        v18 = (void *)v20;
      }
      while (v20);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[EMMailbox receivingAccounts](EMMailbox, "receivingAccounts"));
    if ((unint64_t)objc_msgSend(v21, "count") >= 2)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "account"));

      if (!v22)
      {
LABEL_13:
        v24 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SearchMailboxSuggestion));
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SEARCH_MAILBOX_SEPARATOR"), &stru_100531B00, CFSTR("Main")));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsJoinedByString:", v26));
        v28 = (NSString *)objc_msgSend(v27, "copy");
        v29 = self->_subtitle;
        self->_subtitle = v28;

        subtitle = self->_subtitle;
        return subtitle;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "account"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
      objc_msgSend(v15, "insertObject:atIndex:", v23, 0);

    }
    goto LABEL_13;
  }
  return subtitle;
}

- (id)contactIdentifier
{
  return 0;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

@end
