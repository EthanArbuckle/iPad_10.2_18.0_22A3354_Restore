@implementation SKADatabaseTransientSubscriptionHistory

- (SKADatabaseTransientSubscriptionHistory)initWithCoreDataTransientSubscriptionHistory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SKADatabaseTransientSubscriptionHistory *v7;

  v4 = a3;
  objc_msgSend(v4, "channelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastSubscriptionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SKADatabaseTransientSubscriptionHistory initWithChannelIdentifier:lastSubscriptionDate:](self, "initWithChannelIdentifier:lastSubscriptionDate:", v5, v6);
  return v7;
}

- (SKADatabaseTransientSubscriptionHistory)initWithChannelIdentifier:(id)a3 lastSubscriptionDate:(id)a4
{
  id v6;
  id v7;
  SKADatabaseTransientSubscriptionHistory *v8;
  uint64_t v9;
  NSString *channelIdentifier;
  uint64_t v11;
  NSDate *lastSubscriptionDate;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SKADatabaseTransientSubscriptionHistory;
  v8 = -[SKADatabaseTransientSubscriptionHistory init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    channelIdentifier = v8->_channelIdentifier;
    v8->_channelIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    lastSubscriptionDate = v8->_lastSubscriptionDate;
    v8->_lastSubscriptionDate = (NSDate *)v11;

  }
  return v8;
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (NSDate)lastSubscriptionDate
{
  return self->_lastSubscriptionDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSubscriptionDate, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end
