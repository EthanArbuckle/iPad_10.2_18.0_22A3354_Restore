@implementation TPSAnalyticsEventSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventSession)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventSession *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TPSAnalyticsEventSession;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_collectionsViewed = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("collections_viewed"));
    v5->_tipsViewed = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("tips_viewed"));
  }

  return v5;
}

- (id)_initWithCollectionsViewed:(int64_t)a3 tipsViewed:(int64_t)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSAnalyticsEventSession;
  result = -[TPSAnalyticsEvent initWithDate:](&v7, sel_initWithDate_, 0);
  if (result)
  {
    *((_QWORD *)result + 4) = a3;
    *((_QWORD *)result + 5) = a4;
  }
  return result;
}

+ (id)eventWithCollectionsViewed:(int64_t)a3 tipsViewed:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithCollectionsViewed:tipsViewed:", a3, a4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventSession;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_collectionsViewed, CFSTR("collections_viewed"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_tipsViewed, CFSTR("tips_viewed"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("session"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_collectionsViewed);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("collections_viewed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_tipsViewed);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("tips_viewed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("u65_flag"));

  return v3;
}

- (int64_t)collectionsViewed
{
  return self->_collectionsViewed;
}

- (int64_t)tipsViewed
{
  return self->_tipsViewed;
}

@end
