@implementation VUIPlaybackReporterVPAFPlaylistItem

- (VUIPlaybackReporterVPAFPlaylistItem)initWithPosition:(unint64_t)a3 duration:(unint64_t)a4 eventData:(id)a5
{
  id v8;
  VUIPlaybackReporterVPAFPlaylistItem *v9;
  VUIPlaybackReporterVPAFPlaylistItem *v10;
  uint64_t v11;
  NSArray *eventData;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)VUIPlaybackReporterVPAFPlaylistItem;
  v9 = -[VUIPlaybackReporterVPAFPlaylistItem init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_startOverallPosition = a3;
    v9->_duration = a4;
    if (a4)
    {
      v9->_timeRange.location = a3;
      v9->_timeRange.length = a4;
    }
    if (v8)
    {
      v15[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v11 = objc_claimAutoreleasedReturnValue();
      eventData = v10->_eventData;
      v10->_eventData = (NSArray *)v11;

    }
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)VUIPlaybackReporterVPAFPlaylistItem;
  -[VUIPlaybackReporterVPAFPlaylistItem description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRange(self->_timeRange);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_eventData, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ range:%@ data:%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)startOverallPosition
{
  return self->_startOverallPosition;
}

- (void)setStartOverallPosition:(unint64_t)a3
{
  self->_startOverallPosition = a3;
}

- (NSArray)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (_NSRange)timeRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_timeRange.length;
  location = self->_timeRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTimeRange:(_NSRange)a3
{
  self->_timeRange = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
}

@end
