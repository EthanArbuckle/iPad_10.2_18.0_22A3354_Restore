@implementation TPSAnalyticsEventAnimationLoadTime

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventAnimationLoadTime)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventAnimationLoadTime *v5;
  uint64_t v6;
  NSString *tipID;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPSAnalyticsEventAnimationLoadTime;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_ID"));
    v6 = objc_claimAutoreleasedReturnValue();
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("animation_load_time"));
    v5->_animationLoadTime = v8;
  }

  return v5;
}

- (id)_initWithTipID:(id)a3 animationLoadTime:(double)a4
{
  id v7;
  void *v8;
  TPSAnalyticsEventAnimationLoadTime *v9;
  objc_super v11;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)TPSAnalyticsEventAnimationLoadTime;
  v9 = -[TPSAnalyticsEvent initWithDate:](&v11, sel_initWithDate_, v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_tipID, a3);
    v9->_animationLoadTime = a4;
  }

  return v9;
}

+ (id)eventWithTipID:(id)a3 animationLoadTime:(double)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:animationLoadTime:", v6, a4);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventAnimationLoadTime;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("animation_load_time"), self->_animationLoadTime);

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("animation_load_time"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tipID, CFSTR("tip_ID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ceil(self->_animationLoadTime));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("animation_load_time"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("u65_flag"));

  return v3;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
  objc_storeStrong((id *)&self->_tipID, a3);
}

- (double)animationLoadTime
{
  return self->_animationLoadTime;
}

- (void)setAnimationLoadTime:(double)a3
{
  self->_animationLoadTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
