@implementation TPSAnalyticsEventHLPContentViewed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventHLPContentViewed)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventHLPContentViewed *v5;
  uint64_t v6;
  NSString *topicID;
  uint64_t v8;
  NSString *topicTitle;
  uint64_t v10;
  NSString *source;
  uint64_t v12;
  NSString *interfaceStyle;
  uint64_t v14;
  NSString *fromTopicID;
  uint64_t v16;
  NSString *externalURLString;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventHLPContentViewed;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topic_ID"));
    v6 = objc_claimAutoreleasedReturnValue();
    topicID = v5->_topicID;
    v5->_topicID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topic_title"));
    v8 = objc_claimAutoreleasedReturnValue();
    topicTitle = v5->_topicTitle;
    v5->_topicTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("view_src"));
    v10 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
    v12 = objc_claimAutoreleasedReturnValue();
    interfaceStyle = v5->_interfaceStyle;
    v5->_interfaceStyle = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("from_topic_ID"));
    v14 = objc_claimAutoreleasedReturnValue();
    fromTopicID = v5->_fromTopicID;
    v5->_fromTopicID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("external_link"));
    v16 = objc_claimAutoreleasedReturnValue();
    externalURLString = v5->_externalURLString;
    v5->_externalURLString = (NSString *)v16;

  }
  return v5;
}

- (id)_initWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 interfaceStyle:(id)a6 fromTopicID:(id)a7 externalURLString:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  TPSAnalyticsEventHLPContentViewed *v17;
  TPSAnalyticsEventHLPContentViewed *v18;
  void *v19;
  char v20;
  uint64_t v21;
  NSString *fromTopicID;
  void *v23;
  char v24;
  uint64_t v25;
  NSString *externalURLString;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)TPSAnalyticsEventHLPContentViewed;
  v17 = -[TPSAnalyticsEvent initWithDate:](&v28, sel_initWithDate_, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_topicID, a3);
    objc_storeStrong((id *)&v18->_topicTitle, a4);
    objc_storeStrong((id *)&v18->_source, a5);
    objc_storeStrong((id *)&v18->_interfaceStyle, a6);
    -[TPSAnalyticsEventHLPContentViewed fromTopicID](v18, "fromTopicID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", &stru_1E39608B8);

    if ((v20 & 1) == 0)
    {
      -[TPSAnalyticsEventHLPContentViewed fromTopicID](v18, "fromTopicID");
      v21 = objc_claimAutoreleasedReturnValue();
      fromTopicID = v18->_fromTopicID;
      v18->_fromTopicID = (NSString *)v21;

    }
    -[TPSAnalyticsEventHLPContentViewed externalURLString](v18, "externalURLString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", &stru_1E39608B8);

    if ((v24 & 1) == 0)
    {
      -[TPSAnalyticsEventHLPContentViewed externalURLString](v18, "externalURLString");
      v25 = objc_claimAutoreleasedReturnValue();
      externalURLString = v18->_externalURLString;
      v18->_externalURLString = (NSString *)v25;

    }
  }

  return v18;
}

+ (id)eventWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 interfaceStyle:(id)a6 fromTopicID:(id)a7 externalURLString:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTopicID:topicTitle:source:interfaceStyle:fromTopicID:externalURLString:", v19, v18, v17, v16, v15, v14);

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventHLPContentViewed;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_topicID, CFSTR("topic_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_topicTitle, CFSTR("topic_title"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_source, CFSTR("view_src"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_interfaceStyle, CFSTR("mode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fromTopicID, CFSTR("from_topic_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalURLString, CFSTR("external_link"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("HLPContentViewed"));
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
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSAnalyticsEventHLPContentViewed topicID](self, "topicID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("topic_ID"));

  -[TPSAnalyticsEventHLPContentViewed topicTitle](self, "topicTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("topic_title"));

  -[TPSAnalyticsEventHLPContentViewed source](self, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("view_src"));

  -[TPSAnalyticsEventHLPContentViewed interfaceStyle](self, "interfaceStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("mode"));

  -[TPSAnalyticsEventHLPContentViewed fromTopicID](self, "fromTopicID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("from_topic_ID"));

  -[TPSAnalyticsEventHLPContentViewed externalURLString](self, "externalURLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("external_link"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("u65_flag"));

  return v3;
}

- (NSString)topicID
{
  return self->_topicID;
}

- (NSString)topicTitle
{
  return self->_topicTitle;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)interfaceStyle
{
  return self->_interfaceStyle;
}

- (NSString)externalURLString
{
  return self->_externalURLString;
}

- (NSString)fromTopicID
{
  return self->_fromTopicID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromTopicID, 0);
  objc_storeStrong((id *)&self->_externalURLString, 0);
  objc_storeStrong((id *)&self->_interfaceStyle, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_topicTitle, 0);
  objc_storeStrong((id *)&self->_topicID, 0);
}

@end
