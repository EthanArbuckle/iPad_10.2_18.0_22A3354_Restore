@implementation RPBroadcastConfiguration

- (RPBroadcastConfiguration)initWithCoder:(id)a3
{
  id v4;
  RPBroadcastConfiguration *v5;
  id v6;
  void *v7;
  double v8;
  id v9;
  uint64_t v10;
  NSDictionary *videoCompressionProperties;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RPBroadcastConfiguration;
  v5 = -[RPBroadcastConfiguration init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("clipDuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v7, "doubleValue");
    v5->_clipDuration = v8;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDictionary), CFSTR("videoCompressionProperties"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    videoCompressionProperties = v5->_videoCompressionProperties;
    v5->_videoCompressionProperties = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_clipDuration));
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("clipDuration"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_videoCompressionProperties, "allValues"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
    objc_msgSend(v7, "encodeObject:forKey:", self->_videoCompressionProperties, CFSTR("videoCompressionProperties"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTimeInterval)clipDuration
{
  return self->_clipDuration;
}

- (void)setClipDuration:(NSTimeInterval)clipDuration
{
  self->_clipDuration = clipDuration;
}

- (NSDictionary)videoCompressionProperties
{
  return self->_videoCompressionProperties;
}

- (void)setVideoCompressionProperties:(NSDictionary *)videoCompressionProperties
{
  objc_storeStrong((id *)&self->_videoCompressionProperties, videoCompressionProperties);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoCompressionProperties, 0);
}

@end
