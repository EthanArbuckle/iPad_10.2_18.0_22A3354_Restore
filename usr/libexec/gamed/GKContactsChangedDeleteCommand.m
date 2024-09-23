@implementation GKContactsChangedDeleteCommand

- (GKContactsChangedDeleteCommand)initWithContactID:(id)a3
{
  id v5;
  GKContactsChangedDeleteCommand *v6;
  GKContactsChangedDeleteCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKContactsChangedDeleteCommand;
  v6 = -[GKContactsChangedDeleteCommand init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contactID, a3);

  return v7;
}

- (id)executeWithContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedDeleteCommand contactID](self, "contactID"));
  +[GKCDContactInfo _gkDeleteObjectsWithContactIdentifier:withContext:](GKCDContactInfo, "_gkDeleteObjectsWithContactIdentifier:withContext:", v5, v4);

  return 0;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactID, 0);
}

@end
