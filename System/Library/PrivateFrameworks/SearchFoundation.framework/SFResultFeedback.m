@implementation SFResultFeedback

- (SFResultFeedback)initWithResult:(id)a3
{
  id v5;
  SFResultFeedback *v6;
  SFResultFeedback *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFResultFeedback;
  v6 = -[SFFeedback init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_result, a3);
    v7->super._queryId = objc_msgSend(v5, "queryId");
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFResultFeedback;
  v4 = -[SFFeedback copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[SFResultFeedback result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[3];
  v4[3] = v6;

  return v4;
}

- (SFResultFeedback)initWithCoder:(id)a3
{
  id v4;
  SFResultFeedback *v5;
  uint64_t v6;
  SFSearchResult *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFResultFeedback;
  v5 = -[SFFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("result"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v5->_result;
    v5->_result = (SFSearchResult *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFResultFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_result, CFSTR("result"), v5.receiver, v5.super_class);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)SFResultFeedback;
  -[SFFeedback description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFResultFeedback result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SFSearchResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
