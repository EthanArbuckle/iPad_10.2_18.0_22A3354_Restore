@implementation UNNotificationSystemSettings

- (UNNotificationSystemSettings)initWithShowPreviewsSetting:(int64_t)a3 announcementSetting:(int64_t)a4 announcementHeadphonesSetting:(int64_t)a5 announcementCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10
{
  return -[UNNotificationSystemSettings initWithShowPreviewsSetting:announcementSetting:announcementHeadphonesSetting:announcementCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:modifiedSettings:](self, "initWithShowPreviewsSetting:announcementSetting:announcementHeadphonesSetting:announcementCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:modifiedSettings:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (UNNotificationSystemSettings)initWithShowPreviewsSetting:(int64_t)a3 announcementSetting:(int64_t)a4 announcementHeadphonesSetting:(int64_t)a5 announcementCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10 modifiedSettings:(unint64_t)a11
{
  return -[UNNotificationSystemSettings initWithShowPreviewsSetting:announcementSetting:announcementHeadphonesSetting:announcementCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:remoteNotificationsSetting:modifiedSettings:](self, "initWithShowPreviewsSetting:announcementSetting:announcementHeadphonesSetting:announcementCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:remoteNotificationsSetting:modifiedSettings:", a3, a4, a5, a6, a7, a8, a9, a10, 0, a11);
}

- (UNNotificationSystemSettings)initWithShowPreviewsSetting:(int64_t)a3 announcementSetting:(int64_t)a4 announcementHeadphonesSetting:(int64_t)a5 announcementCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10 remoteNotificationsSetting:(int64_t)a11 modifiedSettings:(unint64_t)a12
{
  id v19;
  UNNotificationSystemSettings *v20;
  UNNotificationSystemSettings *v21;
  objc_super v23;

  v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)UNNotificationSystemSettings;
  v20 = -[UNNotificationSystemSettings init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_showPreviewsSetting = a3;
    v20->_announcementSetting = a4;
    v20->_announcementHeadphonesSetting = a5;
    v20->_announcementCarPlaySetting = a6;
    v20->_scheduledDeliverySetting = a7;
    objc_storeStrong((id *)&v20->_scheduledDeliveryTimes, a8);
    v21->_notificationListDisplayStyleSetting = a10;
    v21->_remoteNotificationsSetting = a11;
    v21->_scheduledDeliveryShowNextSummarySetting = a9;
    v21->_modifiedSettings = a12;
  }

  return v21;
}

- (id)description
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x24BDD17C8];
  v15 = objc_opt_class();
  -[UNNotificationSystemSettings showPreviewsSetting](self, "showPreviewsSetting");
  UNShowPreviewsSettingString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSystemSettings announcementSetting](self, "announcementSetting");
  UNNotificationSettingString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSystemSettings announcementHeadphonesSetting](self, "announcementHeadphonesSetting");
  UNNotificationSettingString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSystemSettings _stringforAnnouncementCarPlaySetting:](self, "_stringforAnnouncementCarPlaySetting:", -[UNNotificationSystemSettings announcementCarPlaySetting](self, "announcementCarPlaySetting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSystemSettings scheduledDeliverySetting](self, "scheduledDeliverySetting");
  UNNotificationSettingString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSystemSettings scheduledDeliveryTimes](self, "scheduledDeliveryTimes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSystemSettings _stringForScheduledDeliveryTimes:](self, "_stringForScheduledDeliveryTimes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSystemSettings scheduledDeliveryShowNextSummarySetting](self, "scheduledDeliveryShowNextSummarySetting");
  UNNotificationSettingString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSystemSettings _stringForNotificationListDisplayStyleSetting:](self, "_stringForNotificationListDisplayStyleSetting:", self->_notificationListDisplayStyleSetting);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSystemSettings remoteNotificationsSetting](self, "remoteNotificationsSetting");
  UNNotificationSettingString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p; showPreviewsSetting: %@; announcementSetting: %@; announcementHeadphonesSetting: %@; announcementCarPlaySetting: %@; scheduledDeliverySetting: %@; scheduledDeliveryTimes: %@; scheduledDeliveryShowNextSummarySetting: %@; notificationListDisplayStyleSetting: %@; remoteNotificationsSetting: %@"),
    v15,
    self,
    v14,
    v13,
    v3,
    v4,
    v5,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings showPreviewsSetting](self, "showPreviewsSetting"), CFSTR("showPreviewsSetting"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings announcementSetting](self, "announcementSetting"), CFSTR("announcementSetting"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings announcementHeadphonesSetting](self, "announcementHeadphonesSetting"), CFSTR("announcementHeadphonesSetting"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings announcementCarPlaySetting](self, "announcementCarPlaySetting"), CFSTR("announcementCarPlaySetting"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"), CFSTR("scheduledDeliverySetting"));
  -[UNNotificationSystemSettings scheduledDeliveryTimes](self, "scheduledDeliveryTimes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("scheduledDeliveryTimes"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings scheduledDeliveryShowNextSummarySetting](self, "scheduledDeliveryShowNextSummarySetting"), CFSTR("scheduledDeliveryShowNextSummarySetting"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_notificationListDisplayStyleSetting, CFSTR("notificationListDisplayStyleSetting"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"), CFSTR("remoteNotificationsSetting"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationSystemSettings modifiedSettings](self, "modifiedSettings"), CFSTR("modifiedSettings"));

}

- (UNNotificationSystemSettings)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  UNNotificationSystemSettings *v16;
  uint64_t v18;

  v3 = a3;
  v18 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("showPreviewsSetting"));
  v4 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("announcementSetting"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("announcementHeadphonesSetting"));
  v6 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("announcementCarPlaySetting"));
  v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("scheduledDeliverySetting"));
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("scheduledDeliveryTimes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("scheduledDeliveryShowNextSummarySetting"));
  v13 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("notificationListDisplayStyleSetting"));
  v14 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("remoteNotificationsSetting"));
  v15 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("modifiedSettings"));

  v16 = -[UNNotificationSystemSettings initWithShowPreviewsSetting:announcementSetting:announcementHeadphonesSetting:announcementCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:remoteNotificationsSetting:modifiedSettings:](self, "initWithShowPreviewsSetting:announcementSetting:announcementHeadphonesSetting:announcementCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:remoteNotificationsSetting:modifiedSettings:", v18, v4, v5, v6, v7, v11, v12, v13, v14, v15);
  return v16;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  UNMutableNotificationSystemSettings *v10;
  UNMutableNotificationSystemSettings *v12;

  v12 = [UNMutableNotificationSystemSettings alloc];
  v4 = -[UNNotificationSystemSettings showPreviewsSetting](self, "showPreviewsSetting");
  v5 = -[UNNotificationSystemSettings announcementSetting](self, "announcementSetting");
  v6 = -[UNNotificationSystemSettings announcementHeadphonesSetting](self, "announcementHeadphonesSetting");
  v7 = -[UNNotificationSystemSettings announcementCarPlaySetting](self, "announcementCarPlaySetting");
  v8 = -[UNNotificationSystemSettings scheduledDeliverySetting](self, "scheduledDeliverySetting");
  -[UNNotificationSystemSettings scheduledDeliveryTimes](self, "scheduledDeliveryTimes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UNNotificationSystemSettings initWithShowPreviewsSetting:announcementSetting:announcementHeadphonesSetting:announcementCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:remoteNotificationsSetting:modifiedSettings:](v12, "initWithShowPreviewsSetting:announcementSetting:announcementHeadphonesSetting:announcementCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:remoteNotificationsSetting:modifiedSettings:", v4, v5, v6, v7, v8, v9, -[UNNotificationSystemSettings scheduledDeliveryShowNextSummarySetting](self, "scheduledDeliveryShowNextSummarySetting"), self->_notificationListDisplayStyleSetting, -[UNNotificationSystemSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"), -[UNNotificationSystemSettings modifiedSettings](self, "modifiedSettings"));

  return v10;
}

- (id)_stringforAnnouncementCarPlaySetting:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return off_24C3C80C0[a3];
}

- (id)_stringForScheduledDeliveryTimes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("HH:mm"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = CFSTR("[");
    do
    {
      v10 = 0;
      v11 = v9;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(v4, "dateFromComponents:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "stringFromDate:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR(" %@,"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v15);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v9;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v9 = CFSTR("[");
  }

  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR(" ]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_stringForNotificationListDisplayStyleSetting:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Standard");
  if (a3 == 1)
    v3 = CFSTR("Stack");
  if (a3 == 2)
    return CFSTR("Hidden");
  else
    return (id)v3;
}

- (int64_t)showPreviewsSetting
{
  return self->_showPreviewsSetting;
}

- (int64_t)announcementSetting
{
  return self->_announcementSetting;
}

- (int64_t)announcementHeadphonesSetting
{
  return self->_announcementHeadphonesSetting;
}

- (int64_t)announcementCarPlaySetting
{
  return self->_announcementCarPlaySetting;
}

- (int64_t)scheduledDeliverySetting
{
  return self->_scheduledDeliverySetting;
}

- (NSArray)scheduledDeliveryTimes
{
  return self->_scheduledDeliveryTimes;
}

- (int64_t)scheduledDeliveryShowNextSummarySetting
{
  return self->_scheduledDeliveryShowNextSummarySetting;
}

- (int64_t)notificationListDisplayStyleSetting
{
  return self->_notificationListDisplayStyleSetting;
}

- (int64_t)remoteNotificationsSetting
{
  return self->_remoteNotificationsSetting;
}

- (unint64_t)modifiedSettings
{
  return self->_modifiedSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledDeliveryTimes, 0);
}

@end
