@implementation REMotionRelevanceProvider

+ (id)relevanceSimulatorID
{
  return CFSTR("motion");
}

- (REMotionRelevanceProvider)initWithDictionary:(id)a3
{
  void *v4;
  REMotionRelevanceProvider *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("motion_type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REMotionRelevanceProvider initWithMotionTypes:](self, "initWithMotionTypes:", objc_msgSend(v4, "unsignedIntegerValue"));

  return v5;
}

- (id)dictionaryEncoding
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_motionTypes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("motion_type"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (REMotionRelevanceProvider)initWithMotionTypes:(unint64_t)a3
{
  REMotionRelevanceProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMotionRelevanceProvider;
  result = -[RERelevanceProvider init](&v5, sel_init);
  if (result)
    result->_motionTypes = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMotionTypes:", self->_motionTypes);
}

- (BOOL)isEqual:(id)a3
{
  REMotionRelevanceProvider *v4;
  BOOL v5;
  objc_super v7;

  v4 = (REMotionRelevanceProvider *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REMotionRelevanceProvider;
    v5 = -[RERelevanceProvider isEqual:](&v7, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_motionTypes == v4->_motionTypes;
  }

  return v5;
}

- (unint64_t)_hash
{
  return self->_motionTypes;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REMotionRelevanceProvider;
  -[REMotionRelevanceProvider description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" motionTypes=%lu"), self->_motionTypes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)motionTypes
{
  return self->_motionTypes;
}

@end
