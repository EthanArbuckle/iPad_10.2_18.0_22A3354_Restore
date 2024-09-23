@implementation WLKPlayEvent

- (WLKPlayEvent)initWithDictionary:(id)a3
{
  id v4;
  WLKPlayEvent *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleID;
  void *v9;
  uint64_t v10;
  NSString *channelID;
  void *v12;
  uint64_t v13;
  NSString *externalPlayableID;
  void *v15;
  uint64_t v16;
  NSString *showID;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSDate *occurrenceDate;
  WLKPlayEvent *v23;
  objc_super v25;

  v4 = a3;
  if (v4)
  {
    v25.receiver = self;
    v25.super_class = (Class)WLKPlayEvent;
    v5 = -[WLKPlayEvent init](&v25, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("bundleId"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      bundleID = v5->_bundleID;
      v5->_bundleID = (NSString *)v7;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("channelId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      channelID = v5->_channelID;
      v5->_channelID = (NSString *)v10;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("externalPlayableId"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      externalPlayableID = v5->_externalPlayableID;
      v5->_externalPlayableID = (NSString *)v13;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("showId"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      showID = v5->_showID;
      v5->_showID = (NSString *)v16;

      v5->_played = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("isDone"), 0);
      objc_msgSend(v4, "wlk_numberForKey:", CFSTR("mediaLengthInSeconds"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_duration = (double)(unint64_t)objc_msgSend(v18, "unsignedIntegerValue");

      objc_msgSend(v4, "wlk_numberForKey:", CFSTR("playCursorInSeconds"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_elapsedTime = (double)(unint64_t)objc_msgSend(v19, "unsignedIntegerValue");

      objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("occurredAt"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      occurrenceDate = v5->_occurrenceDate;
      v5->_occurrenceDate = (NSDate *)v21;

    }
    self = v5;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (WLKPlayEvent)init
{
  return -[WLKPlayEvent initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_played)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p playableID:%@ played:%@ elapsed:%lu Date:%@>"), v5, self, self->_externalPlayableID, v7, (unint64_t)self->_elapsedTime, self->_occurrenceDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)externalPlayableID
{
  return self->_externalPlayableID;
}

- (NSString)showID
{
  return self->_showID;
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)occurrenceDate
{
  return self->_occurrenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceDate, 0);
  objc_storeStrong((id *)&self->_showID, 0);
  objc_storeStrong((id *)&self->_externalPlayableID, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
