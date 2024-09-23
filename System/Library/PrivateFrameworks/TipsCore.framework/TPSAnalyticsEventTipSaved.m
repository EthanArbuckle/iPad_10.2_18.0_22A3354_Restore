@implementation TPSAnalyticsEventTipSaved

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipSaved)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventTipSaved *v5;
  uint64_t v6;
  NSString *tipID;
  uint64_t v8;
  NSString *correlationID;
  uint64_t v10;
  NSString *collectionID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSAnalyticsEventTipSaved;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_ID"));
    v6 = objc_claimAutoreleasedReturnValue();
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_correlation_ID"));
    v8 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collection_ID"));
    v10 = objc_claimAutoreleasedReturnValue();
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v10;

    v5->_saved = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("save_flag"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventTipSaved;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_saved, CFSTR("save_flag"));

}

- (id)_initWithTipID:(id)a3 saved:(BOOL)a4 correlationID:(id)a5 collectionID:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  TPSAnalyticsEventTipSaved *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)TPSAnalyticsEventTipSaved;
  v15 = -[TPSAnalyticsEvent initWithDate:](&v17, sel_initWithDate_, v14);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_tipID, a3);
    v15->_saved = a4;
    objc_storeStrong((id *)&v15->_correlationID, a5);
    objc_storeStrong((id *)&v15->_collectionID, a6);
  }

  return v15;
}

+ (id)eventWithTipID:(id)a3 saved:(BOOL)a4 correlationID:(id)a5 collectionID:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:saved:correlationID:collectionID:", v12, v7, v11, v10);

  return v13;
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("tip_saved"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSAnalyticsEventTipSaved tipID](self, "tipID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("tip_ID"));

  -[TPSAnalyticsEventTipSaved correlationID](self, "correlationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("tip_correlation_ID"));

  -[TPSAnalyticsEventTipSaved collectionID](self, "collectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("collection_ID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TPSAnalyticsEventTipSaved saved](self, "saved"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("save_flag"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("u65_flag"));

  return v3;
}

- (BOOL)saved
{
  return self->_saved;
}

- (void)setSaved:(BOOL)a3
{
  self->_saved = a3;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
  objc_storeStrong((id *)&self->_tipID, a3);
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
