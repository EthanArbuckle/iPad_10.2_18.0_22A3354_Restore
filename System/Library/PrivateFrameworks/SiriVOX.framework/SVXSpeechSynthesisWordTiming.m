@implementation SVXSpeechSynthesisWordTiming

- (SVXSpeechSynthesisWordTiming)initWithRange:(_NSRange)a3 timeInterval:(double)a4
{
  NSUInteger length;
  NSUInteger location;
  SVXSpeechSynthesisWordTiming *result;
  objc_super v8;

  length = a3.length;
  location = a3.location;
  v8.receiver = self;
  v8.super_class = (Class)SVXSpeechSynthesisWordTiming;
  result = -[SVXSpeechSynthesisWordTiming init](&v8, sel_init);
  if (result)
  {
    result->_range.location = location;
    result->_range.length = length;
    result->_timeInterval = a4;
  }
  return result;
}

- (id)description
{
  return -[SVXSpeechSynthesisWordTiming _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v9.receiver = self;
  v9.super_class = (Class)SVXSpeechSynthesisWordTiming;
  -[SVXSpeechSynthesisWordTiming description](&v9, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRange(self->_range);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {range = %@, timeInterval = %f}"), v5, v6, *(_QWORD *)&self->_timeInterval);

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", self->_range.location, self->_range.length);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SVXSpeechSynthesisWordTiming *v4;
  SVXSpeechSynthesisWordTiming *v5;
  uint64_t v6;
  BOOL v7;
  double timeInterval;
  double v9;

  v4 = (SVXSpeechSynthesisWordTiming *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v7 = 0;
      if (self->_range.location == -[SVXSpeechSynthesisWordTiming range](v5, "range") && self->_range.length == v6)
      {
        timeInterval = self->_timeInterval;
        -[SVXSpeechSynthesisWordTiming timeInterval](v5, "timeInterval");
        v7 = timeInterval == v9;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (SVXSpeechSynthesisWordTiming)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisWordTiming::range"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeValue");
  v8 = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXSpeechSynthesisWordTiming::timeInterval"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  return -[SVXSpeechSynthesisWordTiming initWithRange:timeInterval:](self, "initWithRange:timeInterval:", v6, v8, v11);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSUInteger location;
  NSUInteger length;
  id v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD1968];
  location = self->_range.location;
  length = self->_range.length;
  v7 = a3;
  objc_msgSend(v4, "valueWithRange:", location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v8, CFSTR("SVXSpeechSynthesisWordTiming::range"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeInterval);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v9, CFSTR("SVXSpeechSynthesisWordTiming::timeInterval"));

}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXSpeechSynthesisWordTimingMutation *);
  _SVXSpeechSynthesisWordTimingMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXSpeechSynthesisWordTimingMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXSpeechSynthesisWordTimingMutation initWithBaseModel:]([_SVXSpeechSynthesisWordTimingMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXSpeechSynthesisWordTimingMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXSpeechSynthesisWordTiming copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXSpeechSynthesisWordTimingMutation *);
  _SVXSpeechSynthesisWordTimingMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXSpeechSynthesisWordTimingMutation *))a3;
  v4 = objc_alloc_init(_SVXSpeechSynthesisWordTimingMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXSpeechSynthesisWordTimingMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
