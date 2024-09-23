@implementation SKADatabaseRemovedUser

- (SKADatabaseRemovedUser)initWithCoreDataRemovedUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SKADatabaseRemovedUser *v9;

  v4 = a3;
  objc_msgSend(v4, "removedHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presenceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateRemoved");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SKADatabaseRemovedUser initWithHandle:statusTypeIdentifier:presenceIdentifier:dateRemoved:](self, "initWithHandle:statusTypeIdentifier:presenceIdentifier:dateRemoved:", v5, v6, v7, v8);
  return v9;
}

- (SKADatabaseRemovedUser)initWithHandle:(id)a3 statusTypeIdentifier:(id)a4 presenceIdentifier:(id)a5 dateRemoved:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SKADatabaseRemovedUser *v14;
  uint64_t v15;
  NSString *handle;
  uint64_t v17;
  NSString *statusTypeIdentifier;
  uint64_t v19;
  NSString *presenceIdentifier;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SKADatabaseRemovedUser;
  v14 = -[SKADatabaseRemovedUser init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    handle = v14->_handle;
    v14->_handle = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    statusTypeIdentifier = v14->_statusTypeIdentifier;
    v14->_statusTypeIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    presenceIdentifier = v14->_presenceIdentifier;
    v14->_presenceIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v14->_dateRemoved, a6);
  }

  return v14;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (NSString)presenceIdentifier
{
  return self->_presenceIdentifier;
}

- (NSDate)dateRemoved
{
  return self->_dateRemoved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRemoved, 0);
  objc_storeStrong((id *)&self->_presenceIdentifier, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
