@implementation SFLookupHintRelevancyFeedback

- (SFLookupHintRelevancyFeedback)initWithContext:(id)a3 hintRange:(_NSRange)a4 domain:(id)a5 discarded:(BOOL)a6 grade:(unint64_t)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  SFLookupHintRelevancyFeedback *v16;
  SFLookupHintRelevancyFeedback *v17;
  objc_super v19;

  length = a4.length;
  location = a4.location;
  v14 = a3;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SFLookupHintRelevancyFeedback;
  v16 = -[SFFeedback init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_context, a3);
    v17->_hintRange.location = location;
    v17->_hintRange.length = length;
    objc_storeStrong((id *)&v17->_domain, a5);
    v17->_discarded = a6;
    v17->_grade = a7;
  }

  return v17;
}

- (SFLookupHintRelevancyFeedback)initWithCoder:(id)a3
{
  id v4;
  SFLookupHintRelevancyFeedback *v5;
  uint64_t v6;
  NSString *context;
  NSString *v8;
  uint64_t v9;
  NSString *domain;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFLookupHintRelevancyFeedback;
  v5 = -[SFFeedback initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_context"));
    v6 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hintRange"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5->_hintRange = NSRangeFromString(v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domain"));
    v9 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v9;

    v5->_discarded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_discarded"));
    v5->_grade = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_grade"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFLookupHintRelevancyFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("_context"), v6.receiver, v6.super_class);
  NSStringFromRange(self->_hintRange);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_hintRange"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_domain, CFSTR("_domain"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_discarded, CFSTR("_discarded"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_grade, CFSTR("_grade"));

}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_NSRange)hintRange
{
  _NSRange *p_hintRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_hintRange = &self->_hintRange;
  location = self->_hintRange.location;
  length = p_hintRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setHintRange:(_NSRange)a3
{
  self->_hintRange = a3;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)discarded
{
  return self->_discarded;
}

- (void)setDiscarded:(BOOL)a3
{
  self->_discarded = a3;
}

- (unint64_t)grade
{
  return self->_grade;
}

- (void)setGrade:(unint64_t)a3
{
  self->_grade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
