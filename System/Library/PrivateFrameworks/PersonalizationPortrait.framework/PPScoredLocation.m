@implementation PPScoredLocation

- (PPScoredLocation)initWithLocation:(id)a3 score:(double)a4 sentimentScore:(double)a5
{
  id v10;
  PPScoredLocation *v11;
  PPScoredLocation *v12;
  void *v14;
  objc_super v15;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPScoredLocation.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PPScoredLocation;
  v11 = -[PPScoredLocation init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_location, a3);
    v12->_score = a4;
    v12->_sentimentScore = a5;
  }

  return v12;
}

- (PPScoredLocation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PPScoredLocation *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scr"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sent"));
  v9 = v8;

  if (v5)
  {
    self = -[PPScoredLocation initWithLocation:score:sentimentScore:](self, "initWithLocation:score:sentimentScore:", v5, v7, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  PPLocation *location;
  id v5;

  location = self->_location;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", location, CFSTR("loc"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("scr"), self->_score);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sent"), self->_sentimentScore);

}

- (BOOL)isEqualToScoredLocation:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  v5 = v4
    && -[PPLocation isEqualToLocation:](self->_location, "isEqualToLocation:", *((_QWORD *)v4 + 1))
    && self->_score == v4[2]
    && self->_sentimentScore == v4[3];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PPScoredLocation *v4;
  PPScoredLocation *v5;
  BOOL v6;

  v4 = (PPScoredLocation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPScoredLocation isEqualToScoredLocation:](self, "isEqualToScoredLocation:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[PPLocation hash](self->_location, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sentimentScore);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  return v7;
}

- (PPLocation)location
{
  return self->_location;
}

- (double)score
{
  return self->_score;
}

- (double)sentimentScore
{
  return self->_sentimentScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
