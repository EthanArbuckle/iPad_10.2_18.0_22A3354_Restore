@implementation SPRecentTopic

- (SPRecentTopic)initWithTopic:(id)a3 score:(id)a4 engagementDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  SPRecentTopic *v12;
  SPRecentTopic *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SPRecentTopic;
  v12 = -[SPRecentTopic init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topic, a3);
    objc_storeStrong((id *)&v13->_score, a4);
    objc_storeStrong((id *)&v13->_engagementDate, a5);
  }

  return v13;
}

- (SFTopic)topic
{
  return self->_topic;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSDate)engagementDate
{
  return self->_engagementDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementDate, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
