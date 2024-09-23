@implementation VUIStreamingBookmark

- (VUIStreamingBookmark)initWithAbsoluteResumeTime:(id)a3 absoluteTimestamp:(id)a4 relativeResumeTime:(id)a5 relativeBookmarkTimestamp:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  VUIStreamingBookmark *v14;
  VUIStreamingBookmark *v15;
  uint64_t v16;
  NSNumber *absoluteResumeTime;
  uint64_t v18;
  NSDate *absoluteBookmarkTimestamp;
  uint64_t v20;
  NSNumber *relativeResumeTime;
  uint64_t v22;
  NSDate *relativeBookmarkTimestamp;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = 0;
  if (v10 && v11)
  {
    v25.receiver = self;
    v25.super_class = (Class)VUIStreamingBookmark;
    v15 = -[VUIStreamingBookmark init](&v25, sel_init);
    if (v15)
    {
      v16 = objc_msgSend(v10, "copy");
      absoluteResumeTime = v15->_absoluteResumeTime;
      v15->_absoluteResumeTime = (NSNumber *)v16;

      v18 = objc_msgSend(v11, "copy");
      absoluteBookmarkTimestamp = v15->_absoluteBookmarkTimestamp;
      v15->_absoluteBookmarkTimestamp = (NSDate *)v18;

      v20 = objc_msgSend(v12, "copy");
      relativeResumeTime = v15->_relativeResumeTime;
      v15->_relativeResumeTime = (NSNumber *)v20;

      v22 = objc_msgSend(v13, "copy");
      relativeBookmarkTimestamp = v15->_relativeBookmarkTimestamp;
      v15->_relativeBookmarkTimestamp = (NSDate *)v22;

    }
    self = v15;
    v14 = self;
  }

  return v14;
}

- (NSNumber)absoluteResumeTime
{
  return self->_absoluteResumeTime;
}

- (void)setAbsoluteResumeTime:(id)a3
{
  objc_storeStrong((id *)&self->_absoluteResumeTime, a3);
}

- (NSDate)absoluteBookmarkTimestamp
{
  return self->_absoluteBookmarkTimestamp;
}

- (void)setAbsoluteBookmarkTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_absoluteBookmarkTimestamp, a3);
}

- (NSNumber)relativeResumeTime
{
  return self->_relativeResumeTime;
}

- (void)setRelativeResumeTime:(id)a3
{
  objc_storeStrong((id *)&self->_relativeResumeTime, a3);
}

- (NSDate)relativeBookmarkTimestamp
{
  return self->_relativeBookmarkTimestamp;
}

- (void)setRelativeBookmarkTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_relativeBookmarkTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeBookmarkTimestamp, 0);
  objc_storeStrong((id *)&self->_relativeResumeTime, 0);
  objc_storeStrong((id *)&self->_absoluteBookmarkTimestamp, 0);
  objc_storeStrong((id *)&self->_absoluteResumeTime, 0);
}

@end
