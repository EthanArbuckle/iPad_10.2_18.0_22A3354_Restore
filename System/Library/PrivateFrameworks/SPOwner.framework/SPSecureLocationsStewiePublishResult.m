@implementation SPSecureLocationsStewiePublishResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPSecureLocationsStewiePublishResult)init
{
  SPSecureLocationsStewiePublishResult *v2;
  SPSecureLocationsStewiePublishResult *v3;
  NSDate *lastPublished;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPSecureLocationsStewiePublishResult;
  v2 = -[SPSecureLocationsStewiePublishResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    lastPublished = v2->_lastPublished;
    v2->_lastPublished = 0;

    v3->_nextAllowedPublish = 0.0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPSecureLocationsStewiePublishResult *v4;
  void *v5;

  v4 = objc_alloc_init(SPSecureLocationsStewiePublishResult);
  -[SPSecureLocationsStewiePublishResult lastPublished](self, "lastPublished");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSecureLocationsStewiePublishResult setLastPublished:](v4, "setLastPublished:", v5);

  -[SPSecureLocationsStewiePublishResult nextAllowedPublish](self, "nextAllowedPublish");
  -[SPSecureLocationsStewiePublishResult setNextAllowedPublish:](v4, "setNextAllowedPublish:");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *lastPublished;
  id v5;

  lastPublished = self->_lastPublished;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lastPublished, CFSTR("lastPublished"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("nextAllowedPublish"), self->_nextAllowedPublish);

}

- (SPSecureLocationsStewiePublishResult)initWithCoder:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *lastPublished;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastPublished"));
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastPublished = self->_lastPublished;
  self->_lastPublished = v5;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("nextAllowedPublish"));
  v8 = v7;

  self->_nextAllowedPublish = v8;
  return self;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<lastPublished %@, nextAllowedPublish %f>"), self->_lastPublished, *(_QWORD *)&self->_nextAllowedPublish);
}

- (NSDate)lastPublished
{
  return self->_lastPublished;
}

- (void)setLastPublished:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)nextAllowedPublish
{
  return self->_nextAllowedPublish;
}

- (void)setNextAllowedPublish:(double)a3
{
  self->_nextAllowedPublish = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPublished, 0);
}

@end
