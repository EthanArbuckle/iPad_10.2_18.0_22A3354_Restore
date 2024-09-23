@implementation PLInvitationRecordsChangeNotification

+ (id)notificationWithAlbum:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithObject:snapshot:changedObjects:", v7, v6, 0);

  return v8;
}

- (id)userInfo
{
  NSDictionary *userInfo;
  NSDictionary *v4;
  NSDictionary *v5;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (BOOL)invitationRecordsDidChange
{
  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  return self->_invitationRecordsDidChange;
}

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("PLInvitationRecordsDidChangeNotification");
  return CFSTR("PLInvitationRecordsDidChangeNotification");
}

- (PLGenericAlbum)album
{
  void *v3;
  void *v4;

  -[PLContainerChangeNotification object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE38B040))
  {
    -[PLContainerChangeNotification object](self, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (PLGenericAlbum *)v4;
}

- (void)_calculateDiffs
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  self->_invitationRecordsDidChange = 0;
  -[PLInvitationRecordsChangeNotification album](self, "album");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE3B1010);

  if (v4)
  {
    -[PLContainerChangeNotification snapshot](self, "snapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "hasSnapshotValueForProperty:", CFSTR("invitationRecords")))
    {
      objc_msgSend(v6, "snapshotValueForProperty:", CFSTR("invitationRecords"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

    }
    else
    {
      v8 = 0;
    }
    -[PLInvitationRecordsChangeNotification album](self, "album");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invitationRecords");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    self->_invitationRecordsDidChange = v8 != v11;
  }
  -[PLContainerChangeNotification _setDidCalculateDiffs:](self, "_setDidCalculateDiffs:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
