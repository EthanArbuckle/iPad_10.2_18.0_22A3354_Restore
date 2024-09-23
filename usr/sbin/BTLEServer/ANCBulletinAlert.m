@implementation ANCBulletinAlert

- (ANCBulletinAlert)initWithBulletin:(id)a3 observer:(id)a4 categoryID:(unsigned __int8)a5
{
  uint64_t v5;
  id v9;
  id v10;
  ANCBulletinAlert *v11;
  ANCBulletinAlert *v12;
  objc_super v14;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ANCBulletinAlert;
  v11 = -[ANCAlert initWithCategoryID:](&v14, "initWithCategoryID:", v5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bulletin, a3);
    objc_storeStrong((id *)&v12->_observer, a4);
  }

  return v12;
}

- (BOOL)isSilent
{
  ANCBulletinAlert *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v4 = objc_msgSend(v3, "isLoading");
  LOBYTE(v2) = v4 | -[ANCAlert silent](v2, "silent");

  return (char)v2;
}

- (id)appIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sectionID"));

  return v3;
}

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithValidUnicode"));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionID"));

    if (!v9)
    {
      v8 = 0;
      return v8;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v11));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedName"));
  }

  return v8;
}

- (id)subtitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithValidUnicode"));

  return v4;
}

- (id)message
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "message"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithValidUnicode"));

  return v4;
}

- (id)date
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "date"));

  return v3;
}

- (BOOL)hasNegativeAction
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v3 = objc_msgSend(v2, "clearable");

  return v3;
}

- (id)negativeActionLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CLEAR"), CFSTR("Clear"), 0));

  return v3;
}

- (BOOL)performNegativeAction
{
  BBObserver *observer;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  observer = self->_observer;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionID"));
  -[BBObserver clearBulletins:inSection:](observer, "clearBulletins:inSection:", v5, v7);

  return 1;
}

- (BOOL)hasExtraContent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v3 = objc_msgSend(v2, "primaryAttachmentType") != 0;

  return v3;
}

- (id)updateDNDEventDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionID"));
  objc_msgSend(v4, "setBundleIdentifier:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "threadID"));
  v9 = objc_msgSend(v8, "length");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "threadID"));
    objc_msgSend(v4, "setThreadIdentifier:", v11);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("req-%@"), v11));
    objc_msgSend(v4, "setThreadIdentifier:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filterCriteria"));
  objc_msgSend(v4, "setFilterCriteria:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publisherMatchID"));
  objc_msgSend(v4, "setIdentifier:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "communicationContext"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sender"));
    v20 = objc_alloc_init((Class)DNDMutableContactHandle);
    v21 = objc_msgSend(v19, "handleType");
    if (v21 == (id)1)
      v22 = 1;
    else
      v22 = 2 * (v21 == (id)2);
    objc_msgSend(v20, "setType:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "handle"));
    objc_msgSend(v20, "setValue:", v23);

    objc_msgSend(v4, "setSender:", v20);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  if (objc_msgSend(v24, "ignoresQuietMode"))
  {

LABEL_12:
    v27 = 2;
LABEL_13:
    objc_msgSend(v4, "setUrgency:", v27);
    goto LABEL_14;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v26 = objc_msgSend(v25, "interruptionLevel");

  if (v26 == (id)3)
    goto LABEL_12;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v32 = objc_msgSend(v31, "interruptionLevel");

  if (v32 == (id)2)
  {
    v27 = 1;
    goto LABEL_13;
  }
LABEL_14:
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ANCBulletinAlert bulletin](self, "bulletin"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "contentType"));

  if ((objc_msgSend(v29, "isEqualToString:", BBBulletinContentTypeMessagingDirect) & 1) != 0)
  {
    v30 = 3;
  }
  else if ((objc_msgSend(v29, "isEqualToString:", BBBulletinContentTypeMessagingGroup) & 1) != 0)
  {
    v30 = 4;
  }
  else if ((objc_msgSend(v29, "isEqualToString:", BBBulletinContentTypeVoicemail) & 1) != 0
         || (objc_msgSend(v29, "isEqualToString:", BBBulletinContentTypeMissedCall) & 1) != 0
         || (objc_msgSend(v29, "isEqualToString:", BBBulletinContentTypeCallOther) & 1) != 0)
  {
    v30 = 2;
  }
  else
  {
    v30 = objc_msgSend(v29, "isEqualToString:", BBBulletinContentTypeIncomingCall);
  }
  objc_msgSend(v4, "setType:", v30);

  return v4;
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
  objc_storeStrong((id *)&self->_bulletin, a3);
}

- (BBObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
}

@end
