@implementation REDailyRoutineRelevanceProvider

- (REDailyRoutineRelevanceProvider)init
{
  return -[REDailyRoutineRelevanceProvider initWithDailyRoutineType:](self, "initWithDailyRoutineType:", 2);
}

- (REDailyRoutineRelevanceProvider)initWithDailyRoutineType:(unint64_t)a3
{
  REDailyRoutineRelevanceProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REDailyRoutineRelevanceProvider;
  result = -[RERelevanceProvider init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

+ (id)relevanceSimulatorID
{
  return CFSTR("routine_type");
}

- (REDailyRoutineRelevanceProvider)initWithDictionary:(id)a3
{
  void *v4;
  uint64_t v5;
  REDailyRoutineRelevanceProvider *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("routine_type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "compare:options:", CFSTR("morning"), 1))
  {
    if (objc_msgSend(v4, "compare:options:", CFSTR("evening"), 1))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  v6 = -[REDailyRoutineRelevanceProvider initWithDailyRoutineType:](self, "initWithDailyRoutineType:", v5);

  return v6;
}

- (id)dictionaryEncoding
{
  unint64_t type;
  const __CFString *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  type = self->_type;
  if (type > 2)
    v3 = &stru_24CF92178;
  else
    v3 = off_24CF8CE98[type];
  v5 = CFSTR("routine_type");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REDailyRoutineRelevanceProvider;
  result = -[RERelevanceProvider copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 4) = self->_type;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  REDailyRoutineRelevanceProvider *v4;
  BOOL v5;
  objc_super v7;

  v4 = (REDailyRoutineRelevanceProvider *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REDailyRoutineRelevanceProvider;
    v5 = -[RERelevanceProvider isEqual:](&v7, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_type == v4->_type;
  }

  return v5;
}

- (unint64_t)_hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_type);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  unint64_t type;
  __CFString *v3;
  void *v4;
  void *v5;
  objc_super v7;

  type = self->_type;
  if (type > 2)
    v3 = 0;
  else
    v3 = off_24CF8CE98[type];
  v7.receiver = self;
  v7.super_class = (Class)REDailyRoutineRelevanceProvider;
  -[REDailyRoutineRelevanceProvider description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" type=%@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

@end
