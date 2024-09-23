@implementation TPSAnalyticsEventAnimationFinished

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventAnimationFinished)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventAnimationFinished *v5;
  uint64_t v6;
  NSString *tipID;
  uint64_t v8;
  NSString *animationSource;
  uint64_t v10;
  NSString *collectionID;
  uint64_t v12;
  NSString *correlationID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventAnimationFinished;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_ID"));
    v6 = objc_claimAutoreleasedReturnValue();
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("animation_source"));
    v8 = objc_claimAutoreleasedReturnValue();
    animationSource = v5->_animationSource;
    v5->_animationSource = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collection_ID"));
    v10 = objc_claimAutoreleasedReturnValue();
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_correlation_ID"));
    v12 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v12;

    v5->_animationFinished = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("animation_finished"));
  }

  return v5;
}

- (id)_initWithTipID:(id)a3 animationFinished:(BOOL)a4 animationSource:(id)a5 collectionID:(id)a6 correlationID:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TPSAnalyticsEventAnimationFinished *v17;
  TPSAnalyticsEventAnimationFinished *v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)TPSAnalyticsEventAnimationFinished;
  v17 = -[TPSAnalyticsEvent initWithDate:](&v20, sel_initWithDate_, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_tipID, a3);
    objc_storeStrong((id *)&v18->_animationSource, a5);
    v18->_animationFinished = a4;
    objc_storeStrong((id *)&v18->_collectionID, a6);
    objc_storeStrong((id *)&v18->_correlationID, a7);
  }

  return v18;
}

+ (id)eventWithTipID:(id)a3 animationFinished:(BOOL)a4 animationSource:(id)a5 collectionID:(id)a6 correlationID:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:animationFinished:animationSource:collectionID:correlationID:", v15, v9, v14, v13, v12);

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventAnimationFinished;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_animationSource, CFSTR("animation_source"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_animationFinished, CFSTR("animation_finished"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("animation_finished"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSAnalyticsEventAnimationFinished tipID](self, "tipID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("tip_ID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_animationFinished);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("animation_finished"));

  -[TPSAnalyticsEventAnimationFinished animationSource](self, "animationSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("animation_source"));

  -[TPSAnalyticsEventAnimationFinished collectionID](self, "collectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("collection_ID"));

  -[TPSAnalyticsEventAnimationFinished correlationID](self, "correlationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("tip_correlation_ID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("u65_flag"));

  return v3;
}

- (BOOL)animationFinished
{
  return self->_animationFinished;
}

- (void)setAnimationFinished:(BOOL)a3
{
  self->_animationFinished = a3;
}

- (NSString)animationSource
{
  return self->_animationSource;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
  objc_storeStrong((id *)&self->_tipID, a3);
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_storeStrong((id *)&self->_collectionID, a3);
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
  objc_storeStrong((id *)&self->_correlationID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
  objc_storeStrong((id *)&self->_animationSource, 0);
}

@end
