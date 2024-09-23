@implementation TBJoinAnalyticsEvent

+ (id)joinRecommendationEventWithSource:(unint64_t)a3 action:(unint64_t)a4 BSSID:(id)a5 latitude:(id)a6 longitude:(id)a7 score:(id)a8 visibleDuration:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  TBJoinAnalyticsEvent *v20;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = objc_alloc_init(TBJoinAnalyticsEvent);
  -[TBJoinAnalyticsEvent setType:](v20, "setType:", 0);
  -[TBJoinAnalyticsEvent setSource:](v20, "setSource:", a3);
  -[TBJoinAnalyticsEvent setAction:](v20, "setAction:", a4);
  -[TBJoinAnalyticsEvent setBssid:](v20, "setBssid:", v19);

  -[TBJoinAnalyticsEvent setLatitude:](v20, "setLatitude:", v18);
  -[TBJoinAnalyticsEvent setLongitude:](v20, "setLongitude:", v17);

  -[TBJoinAnalyticsEvent setScore:](v20, "setScore:", v16);
  -[TBJoinAnalyticsEvent setVisibleDuration:](v20, "setVisibleDuration:", v15);

  return v20;
}

+ (id)joinAlertEventWithSource:(unint64_t)a3 action:(unint64_t)a4 visibleDuration:(id)a5
{
  id v7;
  TBJoinAnalyticsEvent *v8;

  v7 = a5;
  v8 = objc_alloc_init(TBJoinAnalyticsEvent);
  -[TBJoinAnalyticsEvent setType:](v8, "setType:", 1);
  -[TBJoinAnalyticsEvent setSource:](v8, "setSource:", a3);
  -[TBJoinAnalyticsEvent setAction:](v8, "setAction:", a4);
  -[TBJoinAnalyticsEvent setVisibleDuration:](v8, "setVisibleDuration:", v7);

  return v8;
}

- (NSDictionary)eventDictionary
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TBJoinAnalyticsEvent action](self, "action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("action"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TBJoinAnalyticsEvent source](self, "source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("source"));

  -[TBJoinAnalyticsEvent bssid](self, "bssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TBJoinAnalyticsEvent bssid](self, "bssid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("BSSID"));

  }
  -[TBJoinAnalyticsEvent latitude](self, "latitude");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TBJoinAnalyticsEvent latitude](self, "latitude");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("latitude"));

  }
  -[TBJoinAnalyticsEvent longitude](self, "longitude");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TBJoinAnalyticsEvent longitude](self, "longitude");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("longitude"));

  }
  -[TBJoinAnalyticsEvent score](self, "score");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TBJoinAnalyticsEvent score](self, "score");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("score"));

  }
  -[TBJoinAnalyticsEvent visibleDuration](self, "visibleDuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TBJoinAnalyticsEvent visibleDuration](self, "visibleDuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("visibleDuration"));

  }
  return (NSDictionary *)v3;
}

- (NSString)eventName
{
  if (!-[TBJoinAnalyticsEvent type](self, "type"))
    return (NSString *)CFSTR("com.apple.wifi.3bars.join_recommendation");
  if (-[TBJoinAnalyticsEvent type](self, "type") == 1)
    return (NSString *)CFSTR("com.apple.wifi.3bars.join_alert");
  return 0;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  objc_storeStrong((id *)&self->_latitude, a3);
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  objc_storeStrong((id *)&self->_longitude, a3);
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (NSNumber)visibleDuration
{
  return self->_visibleDuration;
}

- (void)setVisibleDuration:(id)a3
{
  self->_visibleDuration = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
}

@end
