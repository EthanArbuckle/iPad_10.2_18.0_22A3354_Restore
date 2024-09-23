@implementation SFResultsReceivedAfterTimeoutFeedback

- (SFResultsReceivedAfterTimeoutFeedback)initWithResults:(id)a3
{
  id v4;
  SFResultsReceivedAfterTimeoutFeedback *v5;
  uint64_t v6;
  NSArray *results;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFResultsReceivedAfterTimeoutFeedback;
  v5 = -[SFFeedback init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    results = v5->_results;
    v5->_results = (NSArray *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFResultsReceivedAfterTimeoutFeedback;
  v4 = -[SFFeedback copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[SFResultsReceivedAfterTimeoutFeedback results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[3];
  v4[3] = v6;

  return v4;
}

- (SFResultsReceivedAfterTimeoutFeedback)initWithCoder:(id)a3
{
  id v4;
  SFResultsReceivedAfterTimeoutFeedback *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *results;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFResultsReceivedAfterTimeoutFeedback;
  v5 = -[SFFeedback initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_results"));
    v9 = objc_claimAutoreleasedReturnValue();
    results = v5->_results;
    v5->_results = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFResultsReceivedAfterTimeoutFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_results, CFSTR("_results"), v5.receiver, v5.super_class);

}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
