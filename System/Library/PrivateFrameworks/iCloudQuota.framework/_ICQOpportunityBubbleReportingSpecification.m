@implementation _ICQOpportunityBubbleReportingSpecification

- (_ICQOpportunityBubbleReportingSpecification)initWithServerDictionary:(id)a3
{
  id v4;
  _ICQOpportunityBubbleReportingSpecification *v5;
  _ICQOpportunityBubbleReportingSpecification *v6;
  uint64_t v7;
  NSDictionary *dimissServerParam;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ICQOpportunityBubbleReportingSpecification;
  v5 = -[_ICQOpportunityBubbleReportingSpecification init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_ICQOpportunityBubbleReportingSpecification _setDisplayRuleFromServerDict:](v5, "_setDisplayRuleFromServerDict:", v4);
    -[_ICQOpportunityBubbleReportingSpecification _getDismissReportingRuleFromServerDict:](v6, "_getDismissReportingRuleFromServerDict:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    dimissServerParam = v6->_dimissServerParam;
    v6->_dimissServerParam = (NSDictionary *)v7;

  }
  return v6;
}

- (void)_setDisplayRuleFromServerDict:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rulesForDisplay"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("delegateDecision"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    self->_displayRuleType = 1;
  }
  else
  {
    self->_displayRuleType = 2;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("alwaysShow"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("true"));

    if (v6)
      self->_displayRuleServerAlwaysShow = 1;
    else
      self->_displayRuleServerAlwaysShow = 0;
  }

}

- (id)_getDismissReportingRuleFromServerDict:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  int v11;
  const char *Name;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("onDismiss"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onDismiss"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("UNIFIED_MESSAGING"));

  if (v6)
  {
    self->_dismissRuleType = 1;
LABEL_4:
    v7 = v4;
    goto LABEL_10;
  }
  self->_dismissRuleType = 2;
  objc_storeStrong((id *)&self->_dimissServerParam, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_4;
  if (v4)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      v11 = 136315394;
      Name = class_getName(v9);
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v11, 0x16u);
    }

  }
  v7 = 0;
LABEL_10:

  return v7;
}

- (NSDictionary)dimissServerParam
{
  return self->_dimissServerParam;
}

- (void)setDimissServerParam:(id)a3
{
  objc_storeStrong((id *)&self->_dimissServerParam, a3);
}

- (unint64_t)displayRuleType
{
  return self->_displayRuleType;
}

- (void)setDisplayRuleType:(unint64_t)a3
{
  self->_displayRuleType = a3;
}

- (unint64_t)dismissRuleType
{
  return self->_dismissRuleType;
}

- (void)setDismissRuleType:(unint64_t)a3
{
  self->_dismissRuleType = a3;
}

- (BOOL)displayRuleServerAlwaysShow
{
  return self->_displayRuleServerAlwaysShow;
}

- (void)setDisplayRuleServerAlwaysShow:(BOOL)a3
{
  self->_displayRuleServerAlwaysShow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimissServerParam, 0);
}

@end
