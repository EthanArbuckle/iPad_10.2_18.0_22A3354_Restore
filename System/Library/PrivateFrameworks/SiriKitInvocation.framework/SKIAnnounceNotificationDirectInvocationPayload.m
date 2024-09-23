@implementation SKIAnnounceNotificationDirectInvocationPayload

- (SKIAnnounceNotificationDirectInvocationPayload)initWithNotification:(id)a3 appBundleId:(id)a4 appBundleIdOfLastAnnouncement:(id)a5 synchronousBurstIndex:(unint64_t)a6 isSameTypeAsLastAnnouncement:(BOOL)a7 timeSinceLastAnnouncement:(double)a8 announcementPlatform:(int64_t)a9 isMediaPlaying:(BOOL)a10
{
  uint64_t v11;

  LOWORD(v11) = a10;
  return -[SKIAnnounceNotificationDirectInvocationPayload initWithNotification:appBundleId:appBundleIdOfLastAnnouncement:synchronousBurstIndex:isSameTypeAsLastAnnouncement:timeSinceLastAnnouncement:announcementPlatform:isMediaPlaying:isBobbleCapableAnnouncement:summaries:](self, "initWithNotification:appBundleId:appBundleIdOfLastAnnouncement:synchronousBurstIndex:isSameTypeAsLastAnnouncement:timeSinceLastAnnouncement:announcementPlatform:isMediaPlaying:isBobbleCapableAnnouncement:summaries:", a3, a4, a5, a6, a7, a9, a8, v11, 0);
}

- (SKIAnnounceNotificationDirectInvocationPayload)initWithNotification:(id)a3 appBundleId:(id)a4 appBundleIdOfLastAnnouncement:(id)a5 synchronousBurstIndex:(unint64_t)a6 isSameTypeAsLastAnnouncement:(BOOL)a7 timeSinceLastAnnouncement:(double)a8 announcementPlatform:(int64_t)a9 isMediaPlaying:(BOOL)a10 isBobbleCapableAnnouncement:(BOOL)a11 summaries:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  SKIAnnounceNotificationDirectInvocationPayload *v23;
  uint64_t v24;
  UNNotification *notification;
  uint64_t v26;
  NSString *appBundleId;
  uint64_t v28;
  NSString *appBundleIdOfLastAnnouncement;
  uint64_t v30;
  NSArray *summaries;
  objc_super v33;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a12;
  v33.receiver = self;
  v33.super_class = (Class)SKIAnnounceNotificationDirectInvocationPayload;
  v23 = -[SKIAnnounceNotificationDirectInvocationPayload init](&v33, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v19, "copy");
    notification = v23->_notification;
    v23->_notification = (UNNotification *)v24;

    v26 = objc_msgSend(v20, "copy");
    appBundleId = v23->_appBundleId;
    v23->_appBundleId = (NSString *)v26;

    v28 = objc_msgSend(v21, "copy");
    appBundleIdOfLastAnnouncement = v23->_appBundleIdOfLastAnnouncement;
    v23->_appBundleIdOfLastAnnouncement = (NSString *)v28;

    v23->_synchronousBurstIndex = a6;
    v23->_isSameTypeAsLastAnnouncement = a7;
    v23->_timeSinceLastAnnouncement = a8;
    v23->_announcementPlatform = a9;
    v23->_isMediaPlaying = a10;
    v23->_isBobbleCapableAnnouncement = a11;
    v30 = objc_msgSend(v22, "copy");
    summaries = v23->_summaries;
    v23->_summaries = (NSArray *)v30;

  }
  return v23;
}

- (id)notificationIdentifier
{
  void *v2;
  void *v3;

  -[UNNotification request](self->_notification, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SKIAnnounceNotificationDirectInvocationPayload notification](self, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("notification"));

  -[SKIAnnounceNotificationDirectInvocationPayload appBundleId](self, "appBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("appBundleId"));

  -[SKIAnnounceNotificationDirectInvocationPayload appBundleIdOfLastAnnouncement](self, "appBundleIdOfLastAnnouncement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("appBundleIdOfLastAnnouncement"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SKIAnnounceNotificationDirectInvocationPayload synchronousBurstIndex](self, "synchronousBurstIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("synchronousBurstIndex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SKIAnnounceNotificationDirectInvocationPayload announcementPlatform](self, "announcementPlatform"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("announcementPlatform"));

  -[SKIAnnounceNotificationDirectInvocationPayload summaries](self, "summaries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("summaries"));

  objc_msgSend(v10, "encodeBool:forKey:", -[SKIAnnounceNotificationDirectInvocationPayload isMediaPlaying](self, "isMediaPlaying"), CFSTR("isMediaPlaying"));
  objc_msgSend(v10, "encodeBool:forKey:", -[SKIAnnounceNotificationDirectInvocationPayload isSameTypeAsLastAnnouncement](self, "isSameTypeAsLastAnnouncement"), CFSTR("isSameTypeAsLastAnnouncement"));
  -[SKIAnnounceNotificationDirectInvocationPayload timeSinceLastAnnouncement](self, "timeSinceLastAnnouncement");
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("timeSinceLastAnnouncement"));
  objc_msgSend(v10, "encodeBool:forKey:", -[SKIAnnounceNotificationDirectInvocationPayload isBobbleCapableAnnouncement](self, "isBobbleCapableAnnouncement"), CFSTR("isBobbleCapableAnnouncement"));

}

- (SKIAnnounceNotificationDirectInvocationPayload)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  char v18;
  SKIAnnounceNotificationDirectInvocationPayload *v19;
  uint64_t v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleIdOfLastAnnouncement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("summaries"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("synchronousBurstIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("announcementPlatform"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  LOBYTE(v13) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isMediaPlaying"));
  v15 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isSameTypeAsLastAnnouncement"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("timeSinceLastAnnouncement"));
  v17 = v16;
  v18 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isBobbleCapableAnnouncement"));

  BYTE1(v21) = v18;
  LOBYTE(v21) = (_BYTE)v13;
  v19 = -[SKIAnnounceNotificationDirectInvocationPayload initWithNotification:appBundleId:appBundleIdOfLastAnnouncement:synchronousBurstIndex:isSameTypeAsLastAnnouncement:timeSinceLastAnnouncement:announcementPlatform:isMediaPlaying:isBobbleCapableAnnouncement:summaries:](self, "initWithNotification:appBundleId:appBundleIdOfLastAnnouncement:synchronousBurstIndex:isSameTypeAsLastAnnouncement:timeSinceLastAnnouncement:announcementPlatform:isMediaPlaying:isBobbleCapableAnnouncement:summaries:", v4, v5, v6, v12, v15, v14, v17, v21, v10);

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)appBundleIdOfLastAnnouncement
{
  return self->_appBundleIdOfLastAnnouncement;
}

- (void)setAppBundleIdOfLastAnnouncement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)synchronousBurstIndex
{
  return self->_synchronousBurstIndex;
}

- (void)setSynchronousBurstIndex:(unint64_t)a3
{
  self->_synchronousBurstIndex = a3;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  self->_isMediaPlaying = a3;
}

- (BOOL)isSameTypeAsLastAnnouncement
{
  return self->_isSameTypeAsLastAnnouncement;
}

- (void)setIsSameTypeAsLastAnnouncement:(BOOL)a3
{
  self->_isSameTypeAsLastAnnouncement = a3;
}

- (double)timeSinceLastAnnouncement
{
  return self->_timeSinceLastAnnouncement;
}

- (void)setTimeSinceLastAnnouncement:(double)a3
{
  self->_timeSinceLastAnnouncement = a3;
}

- (int64_t)announcementPlatform
{
  return self->_announcementPlatform;
}

- (void)setAnnouncementPlatform:(int64_t)a3
{
  self->_announcementPlatform = a3;
}

- (BOOL)isBobbleCapableAnnouncement
{
  return self->_isBobbleCapableAnnouncement;
}

- (void)setIsBobbleCapableAnnouncement:(BOOL)a3
{
  self->_isBobbleCapableAnnouncement = a3;
}

- (NSArray)summaries
{
  return self->_summaries;
}

- (void)setSummaries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaries, 0);
  objc_storeStrong((id *)&self->_appBundleIdOfLastAnnouncement, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end
