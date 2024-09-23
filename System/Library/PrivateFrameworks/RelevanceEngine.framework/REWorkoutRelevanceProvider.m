@implementation REWorkoutRelevanceProvider

+ (id)relevanceSimulatorID
{
  return CFSTR("active_workout");
}

- (REWorkoutRelevanceProvider)initWithDictionary:(id)a3
{
  void *v4;
  REWorkoutRelevanceProvider *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REWorkoutRelevanceProvider initWithState:](self, "initWithState:", objc_msgSend(v4, "unsignedIntegerValue"));

  return v5;
}

- (id)dictionaryEncoding
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("state");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_state);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (REWorkoutRelevanceProvider)initWithState:(unint64_t)a3
{
  REWorkoutRelevanceProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REWorkoutRelevanceProvider;
  result = -[RERelevanceProvider init](&v5, sel_init);
  if (result)
    result->_state = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithState:", self->_state);
}

- (BOOL)isEqual:(id)a3
{
  REWorkoutRelevanceProvider *v4;
  BOOL v5;
  objc_super v7;

  v4 = (REWorkoutRelevanceProvider *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REWorkoutRelevanceProvider;
    v5 = -[RERelevanceProvider isEqual:](&v7, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_state == v4->_state;
  }

  return v5;
}

- (unint64_t)_hash
{
  return self->_state;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REWorkoutRelevanceProvider;
  -[REWorkoutRelevanceProvider description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" state=%lu"), self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)state
{
  return self->_state;
}

@end
