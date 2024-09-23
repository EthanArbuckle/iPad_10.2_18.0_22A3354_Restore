@implementation PREMultiHeadPredictionItem

- (PREMultiHeadPredictionItem)initWithScore:(id)a3 label:(id)a4
{
  id v8;
  id v9;
  PREMultiHeadPredictionItem *v10;
  PREMultiHeadPredictionItem *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PREMultiHeadPredictionItem.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("score"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PREMultiHeadPredictionItem;
  v10 = -[PREMultiHeadPredictionItem init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_score, a3);
    objc_storeStrong((id *)&v11->_label, a4);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *score;
  id v5;

  score = self->_score;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", score, CFSTR("score"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));

}

- (PREMultiHeadPredictionItem)initWithCoder:(id)a3
{
  id v4;
  PREMultiHeadPredictionItem *v5;
  uint64_t v6;
  NSNumber *score;
  uint64_t v8;
  NSString *label;
  PREMultiHeadPredictionItem *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PREMultiHeadPredictionItem;
  v5 = -[PREMultiHeadPredictionItem init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("score"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v10 = 0;
      goto LABEL_6;
    }
    score = v5->_score;
    v5->_score = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v8 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v8;

  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (id)description
{
  objc_super v3;

  if (self->_label)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PREMultiHeadPredictionItem score:%@ label:%@>"), self->_score, self->_label);
  v3.receiver = self;
  v3.super_class = (Class)PREMultiHeadPredictionItem;
  -[PREMultiHeadPredictionItem description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)score
{
  return self->_score;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_score, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
