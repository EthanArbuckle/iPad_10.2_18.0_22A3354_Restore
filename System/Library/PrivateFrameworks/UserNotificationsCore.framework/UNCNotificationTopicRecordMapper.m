@implementation UNCNotificationTopicRecordMapper

- (UNCNotificationTopicRecordMapper)initWithBundle:(id)a3
{
  id v5;
  UNCNotificationTopicRecordMapper *v6;
  UNCNotificationTopicRecordMapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCNotificationTopicRecordMapper;
  v6 = -[UNCNotificationTopicRecordMapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundle, a3);

  return v7;
}

- (id)notificationTopicForNotificationTopicRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDF87E0];
  objc_msgSend(v4, "displayNameLocalizationKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BSCFBundle cfBundle](self->_bundle, "cfBundle");
  objc_msgSend(v4, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v7, 0, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v4, "priority");
  objc_msgSend(v4, "sortIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF8878], "topicWithIdentifier:displayName:priority:sortIdentifier:", v5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
