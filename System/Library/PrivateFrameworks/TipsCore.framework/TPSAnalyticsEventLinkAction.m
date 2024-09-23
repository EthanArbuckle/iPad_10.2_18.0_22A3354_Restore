@implementation TPSAnalyticsEventLinkAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventLinkAction)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventLinkAction *v5;
  uint64_t v6;
  NSString *tipID;
  uint64_t v8;
  NSString *actionName;
  uint64_t v10;
  NSString *actionDirection;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSAnalyticsEventLinkAction;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_ID"));
    v6 = objc_claimAutoreleasedReturnValue();
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("link_action_name"));
    v8 = objc_claimAutoreleasedReturnValue();
    actionName = v5->_actionName;
    v5->_actionName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("link_action_direction"));
    v10 = objc_claimAutoreleasedReturnValue();
    actionDirection = v5->_actionDirection;
    v5->_actionDirection = (NSString *)v10;

  }
  return v5;
}

- (id)_initWithTipID:(id)a3 actionName:(id)a4 actionDirection:(id)a5
{
  id v9;
  id v10;
  id v11;
  TPSAnalyticsEventLinkAction *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventLinkAction;
  v12 = -[TPSAnalyticsEvent initWithDate:](&v15, sel_initWithDate_, 0);
  p_isa = (id *)&v12->super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tipID, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a5);
  }

  return p_isa;
}

+ (id)eventWithTipID:(id)a3 actionName:(id)a4 actionDirection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:actionName:actionDirection:", v10, v9, v8);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventLinkAction;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionName, CFSTR("link_action_name"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionDirection, CFSTR("link_action_direction"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("link_action"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tipID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_actionName, CFSTR("link_action_name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_actionDirection, CFSTR("link_action_direction"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("u65_flag"));

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

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
  objc_storeStrong((id *)&self->_actionName, a3);
}

- (NSString)actionDirection
{
  return self->_actionDirection;
}

- (void)setActionDirection:(id)a3
{
  objc_storeStrong((id *)&self->_actionDirection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionDirection, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
