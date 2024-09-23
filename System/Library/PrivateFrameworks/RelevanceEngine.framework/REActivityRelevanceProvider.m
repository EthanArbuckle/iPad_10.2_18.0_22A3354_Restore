@implementation REActivityRelevanceProvider

+ (id)relevanceSimulatorID
{
  return CFSTR("activity_rings");
}

- (REActivityRelevanceProvider)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  REActivityRelevanceProvider *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("energy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exercise"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stand"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[REActivityRelevanceProvider initWithActiveEnergyState:exerciseTimeState:standHourState:](self, "initWithActiveEnergyState:exerciseTimeState:standHourState:", objc_msgSend(v5, "BOOLValue"), objc_msgSend(v6, "BOOLValue"), objc_msgSend(v7, "BOOLValue"));
  return v8;
}

- (id)dictionaryEncoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_closedActiveEngergy);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("energy"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_closedExerciseTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("exercise"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_closedStandHour);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("stand"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (REActivityRelevanceProvider)initWithActiveEnergyState:(BOOL)a3 exerciseTimeState:(BOOL)a4 standHourState:(BOOL)a5
{
  REActivityRelevanceProvider *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REActivityRelevanceProvider;
  result = -[RERelevanceProvider init](&v9, sel_init);
  if (result)
  {
    result->_closedStandHour = a5;
    result->_closedExerciseTime = a4;
    result->_closedActiveEngergy = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithActiveEnergyState:exerciseTimeState:standHourState:", self->_closedActiveEngergy, self->_closedExerciseTime, self->_closedStandHour);
}

- (BOOL)isEqual:(id)a3
{
  REActivityRelevanceProvider *v4;
  unsigned __int8 *v5;
  BOOL v6;
  objc_super v8;

  v4 = (REActivityRelevanceProvider *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)REActivityRelevanceProvider;
    if (-[RERelevanceProvider isEqual:](&v8, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = self->_closedStandHour == v5[34]
        && self->_closedExerciseTime == v5[33]
        && self->_closedActiveEngergy == v5[32];

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)_hash
{
  return self->_closedStandHour | (16 * self->_closedExerciseTime) | ((unint64_t)self->_closedActiveEngergy << 8);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REActivityRelevanceProvider;
  -[REActivityRelevanceProvider description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_closedStandHour);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_closedExerciseTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_closedActiveEngergy);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" stand=%@, exercise=%@, energy=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)closedActiveEngergy
{
  return self->_closedActiveEngergy;
}

- (BOOL)closedExerciseTime
{
  return self->_closedExerciseTime;
}

- (BOOL)closedStandHour
{
  return self->_closedStandHour;
}

@end
