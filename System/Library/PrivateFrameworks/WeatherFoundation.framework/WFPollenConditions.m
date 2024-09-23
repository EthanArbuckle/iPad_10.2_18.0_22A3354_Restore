@implementation WFPollenConditions

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[WFPollenConditions date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)v5[1];
  v5[1] = v7;

  v5[2] = -[WFPollenConditions timeOfDay](self, "timeOfDay");
  v5[3] = -[WFPollenConditions grassIndex](self, "grassIndex");
  v5[4] = -[WFPollenConditions ragweedIndex](self, "ragweedIndex");
  v5[5] = -[WFPollenConditions treeIndex](self, "treeIndex");
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFPollenConditions)initWithCoder:(id)a3
{
  id v4;
  WFPollenConditions *v5;
  uint64_t v6;
  NSDate *date;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFPollenConditions;
  v5 = -[WFPollenConditions init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFPollenConditionsDateKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v5->_timeOfDay = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFPollenConditionsTimeOfDayKey"));
    v5->_grassIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFPollenConditionsGrassIndexKey"));
    v5->_ragweedIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFPollenConditionsRagweedIndexKey"));
    v5->_treeIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFPollenConditionsTreeIndexKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WFPollenConditions date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("WFPollenConditionsDateKey"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[WFPollenConditions timeOfDay](self, "timeOfDay"), CFSTR("WFPollenConditionsTimeOfDayKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[WFPollenConditions grassIndex](self, "grassIndex"), CFSTR("WFPollenConditionsGrassIndexKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[WFPollenConditions ragweedIndex](self, "ragweedIndex"), CFSTR("WFPollenConditionsRagweedIndexKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[WFPollenConditions treeIndex](self, "treeIndex"), CFSTR("WFPollenConditionsTreeIndexKey"));

}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  self->_timeOfDay = a3;
}

- (unint64_t)grassIndex
{
  return self->_grassIndex;
}

- (void)setGrassIndex:(unint64_t)a3
{
  self->_grassIndex = a3;
}

- (unint64_t)ragweedIndex
{
  return self->_ragweedIndex;
}

- (void)setRagweedIndex:(unint64_t)a3
{
  self->_ragweedIndex = a3;
}

- (unint64_t)treeIndex
{
  return self->_treeIndex;
}

- (void)setTreeIndex:(unint64_t)a3
{
  self->_treeIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
