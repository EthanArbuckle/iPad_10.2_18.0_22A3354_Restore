@implementation _DASWidgetRefreshBudget

- (_DASWidgetRefreshBudget)initWithName:(id)a3 widgetBudgetID:(id)a4 capacity:(double)a5 balance:(double)a6 allocationType:(unsigned __int8)a7
{
  uint64_t v7;
  id v13;
  _DASWidgetRefreshBudget *v14;
  _DASWidgetRefreshBudget *v15;
  objc_super v17;

  v7 = a7;
  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_DASWidgetRefreshBudget;
  v14 = -[_DASBudget initWithName:capacity:balance:allocationType:lastModulatedDate:](&v17, "initWithName:capacity:balance:allocationType:lastModulatedDate:", a3, v7, 0, a5, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_widgetBudgetID, a4);

  return v15;
}

- (_DASWidgetRefreshBudget)initWithDictionary:(id)a3
{
  id v4;
  _DASWidgetRefreshBudget *v5;
  uint64_t v6;
  NSString *widgetBudgetID;
  uint64_t v8;
  NSString *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DASWidgetRefreshBudget;
  v5 = -[_DASBudget initWithDictionary:](&v11, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("budgetID")));
    widgetBudgetID = v5->_widgetBudgetID;
    v5->_widgetBudgetID = (NSString *)v6;

    if (!v5->_widgetBudgetID)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("widgetID")));
      v9 = v5->_widgetBudgetID;
      v5->_widgetBudgetID = (NSString *)v8;

    }
  }

  return v5;
}

+ (id)budgetWithName:(id)a3 widgetBudgetID:(id)a4 capacity:(double)a5 balance:(double)a6 allocationType:(unsigned __int8)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;

  v7 = a7;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithName:widgetBudgetID:capacity:balance:allocationType:", v13, v12, v7, a5, a6);

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudget name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple.dasd.widget_"), &stru_1001617C8));

  -[_DASBudget balance](self, "balance");
  v6 = v5;
  -[_DASBudget capacity](self, "capacity");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<_DASWidgetBudget %@: %12.2lf/%12.2lf>"), v4, v6, v7));

  return v8;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_DASWidgetRefreshBudget;
  v3 = -[_DASBudget dictionaryRepresentation](&v7, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_widgetBudgetID, CFSTR("budgetID"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DASWidgetRefreshBudget;
  v4 = a3;
  -[_DASBudget encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_widgetBudgetID, CFSTR("budgetID"), v5.receiver, v5.super_class);

}

- (_DASWidgetRefreshBudget)initWithCoder:(id)a3
{
  id v4;
  _DASWidgetRefreshBudget *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_DASWidgetRefreshBudget;
  v5 = -[_DASBudget initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("budgetID")));
    -[_DASWidgetRefreshBudget setWidgetBudgetID:](v5, "setWidgetBudgetID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudget widgetBudgetID](v5, "widgetBudgetID"));
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("widgetID")));
      -[_DASWidgetRefreshBudget setWidgetBudgetID:](v5, "setWidgetBudgetID:", v8);

    }
  }

  return v5;
}

- (NSString)widgetBudgetID
{
  return self->_widgetBudgetID;
}

- (void)setWidgetBudgetID:(id)a3
{
  objc_storeStrong((id *)&self->_widgetBudgetID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetBudgetID, 0);
}

@end
