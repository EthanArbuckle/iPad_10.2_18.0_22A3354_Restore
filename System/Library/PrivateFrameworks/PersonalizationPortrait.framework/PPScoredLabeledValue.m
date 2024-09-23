@implementation PPScoredLabeledValue

- (PPScoredLabeledValue)initWithLabeledValue:(id)a3 score:(double)a4 flags:(unsigned __int8)a5
{
  id v10;
  PPScoredLabeledValue *v11;
  PPScoredLabeledValue *v12;
  void *v14;
  objc_super v15;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPScoredLabeledValue.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("labeledValue"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PPScoredLabeledValue;
  v11 = -[PPScoredLabeledValue init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_labeledValue, a3);
    v12->_score = a4;
    v12->_flags = a5;
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPScoredLabeledValue lv:%@ s:%f f:%u>"), self->_labeledValue, *(_QWORD *)&self->_score, self->_flags);
}

- (int64_t)compare:(id)a3
{
  id v4;
  double score;
  double v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  score = self->_score;
  objc_msgSend(v4, "score");
  v7 = +[PPUtils compareDouble:withDouble:](PPUtils, "compareDouble:withDouble:", score, v6);
  if (!v7)
  {
    -[PPLabeledValue label](self->_labeledValue, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "labeledValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "compare:", v10);

  }
  return v7;
}

- (int64_t)reverseCompare:(id)a3
{
  return objc_msgSend(a3, "compare:", self);
}

- (PPScoredLabeledValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  unsigned __int8 v8;
  PPScoredLabeledValue *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lvl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sco"));
  v7 = v6;
  v8 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("fla"));

  v9 = -[PPScoredLabeledValue initWithLabeledValue:score:flags:](self, "initWithLabeledValue:score:flags:", v5, v8, v7);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  PPLabeledValue *labeledValue;
  id v5;

  labeledValue = self->_labeledValue;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", labeledValue, CFSTR("lvl"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sco"), self->_score);
  objc_msgSend(v5, "encodeInt32:forKey:", self->_flags, CFSTR("fla"));

}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = -[PPLabeledValue hash](self->_labeledValue, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  return self->_flags - v5 + 32 * v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  v6 = -[PPLabeledValue copyWithZone:](self->_labeledValue, "copyWithZone:", a3);
  objc_msgSend(v5, "scoredLabeledValueWithLabeledValue:score:flags:", v6, self->_flags, self->_score);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PPScoredLabeledValue *v4;
  PPScoredLabeledValue *v5;
  BOOL v6;

  v4 = (PPScoredLabeledValue *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPScoredLabeledValue isEqualToScoredLabeledValue:](self, "isEqualToScoredLabeledValue:", v5);

  return v6;
}

- (BOOL)isEqualToScoredLabeledValue:(id)a3
{
  id *v4;
  double *v5;
  PPLabeledValue *labeledValue;
  PPLabeledValue *v7;
  PPLabeledValue *v8;
  PPLabeledValue *v9;
  BOOL v10;
  BOOL v11;

  v4 = (id *)a3;
  v5 = (double *)v4;
  if (!v4)
    goto LABEL_8;
  labeledValue = self->_labeledValue;
  v7 = (PPLabeledValue *)v4[2];
  if (labeledValue == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = labeledValue;
    v10 = -[PPLabeledValue isEqual:](v9, "isEqual:", v8);

    if (!v10)
      goto LABEL_8;
  }
  if (self->_score != v5[3])
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v11 = self->_flags == *((unsigned __int8 *)v5 + 8);
LABEL_9:

  return v11;
}

- (PPLabeledValue)labeledValue
{
  return self->_labeledValue;
}

- (double)score
{
  return self->_score;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeledValue, 0);
}

+ (id)scoredLabeledValueWithLabeledValue:(id)a3 score:(double)a4 flags:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  void *v9;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabeledValue:score:flags:", v8, v5, a4);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
