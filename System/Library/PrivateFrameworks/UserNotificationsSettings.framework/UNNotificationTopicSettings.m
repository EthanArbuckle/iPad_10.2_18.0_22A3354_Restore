@implementation UNNotificationTopicSettings

- (UNNotificationTopicSettings)initWithTopic:(id)a3 settings:(id)a4
{
  return -[UNNotificationTopicSettings initWithTopic:settings:muteAssertion:](self, "initWithTopic:settings:muteAssertion:", a3, a4, 0);
}

- (UNNotificationTopicSettings)initWithTopic:(id)a3 settings:(id)a4 muteAssertion:(id)a5
{
  id v8;
  id v9;
  id v10;
  UNNotificationTopicSettings *v11;
  uint64_t v12;
  UNNotificationTopic *topic;
  uint64_t v14;
  UNNotificationSettings *topicSettings;
  uint64_t v16;
  UNNotificationMuteAssertion *muteAssertion;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UNNotificationTopicSettings;
  v11 = -[UNNotificationTopicSettings init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    topic = v11->_topic;
    v11->_topic = (UNNotificationTopic *)v12;

    v14 = objc_msgSend(v9, "copy");
    topicSettings = v11->_topicSettings;
    v11->_topicSettings = (UNNotificationSettings *)v14;

    v16 = objc_msgSend(v10, "copy");
    muteAssertion = v11->_muteAssertion;
    v11->_muteAssertion = (UNNotificationMuteAssertion *)v16;

  }
  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[UNNotificationTopicSettings topic](self, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationTopicSettings topicSettings](self, "topicSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationTopicSettings muteAssertion](self, "muteAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; topic: %@, settings: %@, muteAssertion: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[UNNotificationTopicSettings topic](self, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("topic"));

  -[UNNotificationTopicSettings topicSettings](self, "topicSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("topicSettings"));

  -[UNNotificationTopicSettings muteAssertion](self, "muteAssertion");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("muteAssertion"));

}

- (UNNotificationTopicSettings)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UNNotificationTopicSettings *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topicSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("muteAssertion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[UNNotificationTopicSettings initWithTopic:settings:muteAssertion:](self, "initWithTopic:settings:muteAssertion:", v5, v6, v7);
  return v8;
}

- (UNNotificationTopic)topic
{
  return self->_topic;
}

- (UNNotificationSettings)topicSettings
{
  return self->_topicSettings;
}

- (UNNotificationMuteAssertion)muteAssertion
{
  return self->_muteAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteAssertion, 0);
  objc_storeStrong((id *)&self->_topicSettings, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
