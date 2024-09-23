@implementation WiFiUsageChannel

- (WiFiUsageChannel)initWithChannel:(unint64_t)a3 flags:(unint64_t)a4 band:(int)a5 width:(unint64_t)a6 isDFS:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v9;
  WiFiUsageChannel *v12;
  WiFiUsageChannel *v13;
  objc_super v15;

  v7 = a7;
  v9 = *(_QWORD *)&a5;
  v15.receiver = self;
  v15.super_class = (Class)WiFiUsageChannel;
  v12 = -[WiFiUsageChannel init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[WiFiUsageChannel setChannel:](v12, "setChannel:", a3);
    -[WiFiUsageChannel setChannelFlags:](v13, "setChannelFlags:", a4);
    -[WiFiUsageChannel setBand:](v13, "setBand:", v9);
    -[WiFiUsageChannel setChannelWidth:](v13, "setChannelWidth:", a6);
    -[WiFiUsageChannel setIsDFSChannel:](v13, "setIsDFSChannel:", v7);
  }
  return v13;
}

- (WiFiUsageChannel)initWithChannel:(unint64_t)a3 flags:(unint64_t)a4 isDFS:(BOOL)a5
{
  _BOOL8 v5;
  WiFiUsageChannel *v8;
  WiFiUsageChannel *v9;
  objc_super v11;

  v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)WiFiUsageChannel;
  v8 = -[WiFiUsageChannel init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[WiFiUsageChannel setChannel:](v8, "setChannel:", a3);
    -[WiFiUsageChannel setChannelFlags:](v9, "setChannelFlags:", a4);
    -[WiFiUsageChannel setBand:](v9, "setBand:", +[WiFiUsagePrivacyFilter bandFromFlags:](WiFiUsagePrivacyFilter, "bandFromFlags:", a4));
    -[WiFiUsageChannel setChannelWidth:](v9, "setChannelWidth:", +[WiFiUsagePrivacyFilter channelWidthFromFlags:](WiFiUsagePrivacyFilter, "channelWidthFromFlags:", a4));
    -[WiFiUsageChannel setIsDFSChannel:](v9, "setIsDFSChannel:", v5);
  }
  return v9;
}

- (WiFiUsageChannel)initWithChannel:(unint64_t)a3 flags:(unint64_t)a4
{
  WiFiUsageChannel *v6;
  WiFiUsageChannel *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageChannel;
  v6 = -[WiFiUsageChannel init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[WiFiUsageChannel setChannel:](v6, "setChannel:", a3);
    -[WiFiUsageChannel setChannelFlags:](v7, "setChannelFlags:", a4);
    -[WiFiUsageChannel setBand:](v7, "setBand:", +[WiFiUsagePrivacyFilter bandFromFlags:](WiFiUsagePrivacyFilter, "bandFromFlags:", a4));
    -[WiFiUsageChannel setChannelWidth:](v7, "setChannelWidth:", +[WiFiUsagePrivacyFilter channelWidthFromFlags:](WiFiUsagePrivacyFilter, "channelWidthFromFlags:", a4));
  }
  return v7;
}

+ (id)channelWithBssDetails:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v4, "channel");
  v7 = objc_msgSend(v4, "channelFlags");
  v8 = objc_msgSend(v4, "band");
  v9 = objc_msgSend(v4, "channelWidth");

  return (id)objc_msgSend(v5, "initWithChannel:flags:band:width:isDFS:", v6, v7, v8, v9, 0);
}

+ (id)channelWithChannelInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CHANNELINFO_CH_NUM"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CHANNELINFO_DFS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithChannel:flags:band:width:isDFS:", objc_msgSend(v5, "integerValue"), 0, +[WiFiUsagePrivacyFilter bandFromChanInfo:](WiFiUsagePrivacyFilter, "bandFromChanInfo:", v4), 0, objc_msgSend(v6, "BOOLValue"));
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)channelWithScanChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CHANNEL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CHANNEL_FLAGS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithChannel:flags:", objc_msgSend(v5, "integerValue"), objc_msgSend(v6, "integerValue"));
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateDFSInfoFromSupportedChannels:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "member:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[WiFiUsageChannel setIsDFSChannel:](self, "setIsDFSChannel:", objc_msgSend(v4, "isDFSChannel"));
    v4 = v5;
  }

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%Xu_%lu"), self->_band, self->_channel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[WiFiUsageChannel isEqualToChannel:](self, "isEqualToChannel:", v4);

  return v5;
}

- (BOOL)isEqualToChannel:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "channel");
  if (v5 == -[WiFiUsageChannel channel](self, "channel"))
  {
    v6 = objc_msgSend(v4, "band");
    v7 = v6 == -[WiFiUsageChannel band](self, "band");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)result + 2) = self->_channel;
  *((_QWORD *)result + 3) = self->_channelFlags;
  *((_DWORD *)result + 3) = self->_band;
  *((_QWORD *)result + 4) = self->_channelWidth;
  *((_BYTE *)result + 8) = self->_isDFSChannel;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", -[WiFiUsageChannel band](self, "band"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WiFiUsageChannel channel](self, "channel");
  v6 = -[WiFiUsageChannel isDFSChannel](self, "isDFSChannel");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{band:%@ channel:%lu isDFS:%@}"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_channel = a3;
}

- (int)band
{
  return self->_band;
}

- (void)setBand:(int)a3
{
  self->_band = a3;
}

- (BOOL)isDFSChannel
{
  return self->_isDFSChannel;
}

- (void)setIsDFSChannel:(BOOL)a3
{
  self->_isDFSChannel = a3;
}

- (unint64_t)channelFlags
{
  return self->_channelFlags;
}

- (void)setChannelFlags:(unint64_t)a3
{
  self->_channelFlags = a3;
}

- (unint64_t)channelWidth
{
  return self->_channelWidth;
}

- (void)setChannelWidth:(unint64_t)a3
{
  self->_channelWidth = a3;
}

@end
