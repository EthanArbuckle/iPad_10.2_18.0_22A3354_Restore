@implementation TPSAnalyticsEvent

- (NSString)deliveryInfoVersion
{
  return self->_deliveryInfoVersion;
}

- (void)log
{
  id v3;

  +[TPSAnalyticsEventController sharedInstance](TPSAnalyticsEventController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logAnalyticsEvent:", self);

}

- (void)setDataProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  NSString *deliveryInfoVersion;
  NSString *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataProvider, obj);
    deliveryInfoVersion = self->_deliveryInfoVersion;
    if (deliveryInfoVersion)
    {
      v7 = deliveryInfoVersion;
      v8 = self->_deliveryInfoVersion;
      self->_deliveryInfoVersion = v7;
    }
    else
    {
      -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deliveryInfoVersion");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = self->_deliveryInfoVersion;
      self->_deliveryInfoVersion = v9;

    }
    v5 = obj;
  }

}

- (TPSAnalyticsDataProvider)dataProvider
{
  return (TPSAnalyticsDataProvider *)objc_loadWeakRetained((id *)&self->_dataProvider);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryInfoVersion, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_dataProvider);
}

- (TPSAnalyticsEvent)initWithDate:(id)a3
{
  id v4;
  TPSAnalyticsEvent *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TPSAnalyticsEvent;
  v5 = -[TPSAnalyticsEvent init](&v7, sel_init);
  if (v5)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_date, v4);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)analyticsEventRepresentation
{
  void *v2;
  void *v3;

  -[TPSAnalyticsEvent mutableAnalyticsEventRepresentation](self, "mutableAnalyticsEventRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (TPSAnalyticsEvent)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEvent *v5;
  uint64_t v6;
  NSDate *date;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAnalyticsEvent;
  v5 = -[TPSAnalyticsEvent init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_date, CFSTR("date"));
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDeliveryInfoVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)eventName
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4();
  return &stru_1E39608B8;
}

- (id)mutableAnalyticsEventRepresentation
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4();
  return 0;
}

@end
