@implementation REPriorityRelevanceProvider

- (REPriorityRelevanceProvider)initWithPriority:(float)a3
{
  REPriorityRelevanceProvider *result;
  objc_super v7;

  if (a3 < 0.0 || a3 > 1.0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The priority must be in the range 0.0 to 1.0"));
  v7.receiver = self;
  v7.super_class = (Class)REPriorityRelevanceProvider;
  result = -[RERelevanceProvider init](&v7, sel_init);
  if (result)
    result->_priority = a3;
  return result;
}

+ (id)relevanceSimulatorID
{
  return CFSTR("priority");
}

- (REPriorityRelevanceProvider)initWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  REPriorityRelevanceProvider *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("priority"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    self = -[REPriorityRelevanceProvider initWithPriority:](self, "initWithPriority:");
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dictionaryEncoding
{
  double v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("priority");
  *(float *)&v2 = self->_priority;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REPriorityRelevanceProvider;
  result = -[RERelevanceProvider copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_DWORD *)result + 8) = LODWORD(self->_priority);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  REPriorityRelevanceProvider *v4;
  BOOL v5;
  objc_super v7;

  v4 = (REPriorityRelevanceProvider *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REPriorityRelevanceProvider;
    v5 = -[RERelevanceProvider isEqual:](&v7, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_priority == v4->_priority;
  }

  return v5;
}

- (unint64_t)_hash
{
  double v2;
  void *v3;
  unint64_t v4;

  *(float *)&v2 = self->_priority;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REPriorityRelevanceProvider;
  -[REPriorityRelevanceProvider description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" priority=%f"), self->_priority);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (float)priority
{
  return self->_priority;
}

@end
