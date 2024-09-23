@implementation _TVContentRating

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (_TVContentRating)init
{
  -[_TVContentRating doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (_TVContentRating)initWithRatingSystem:(int64_t)a3 ratingLabel:(id)a4 rank:(unint64_t)a5 ratingDescription:(id)a6
{
  id v10;
  id v11;
  _TVContentRating *v12;
  _TVContentRating *v13;
  uint64_t v14;
  NSString *ratingLabel;
  uint64_t v16;
  NSString *ratingDescription;
  objc_super v19;

  v10 = a4;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_TVContentRating;
  v12 = -[_TVContentRating init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_ratingSystem = a3;
    v14 = objc_msgSend(v10, "copy");
    ratingLabel = v13->_ratingLabel;
    v13->_ratingLabel = (NSString *)v14;

    v13->_rank = a5;
    v16 = objc_msgSend(v11, "copy");
    ratingDescription = v13->_ratingDescription;
    v13->_ratingDescription = (NSString *)v16;

  }
  return v13;
}

- (_TVContentRating)initWithRatingSystemString:(id)a3 ratingLabel:(id)a4 rank:(unint64_t)a5 ratingDescription:(id)a6
{
  id v10;
  id v11;
  _TVContentRating *v12;

  v10 = a6;
  v11 = a4;
  v12 = -[_TVContentRating initWithRatingSystem:ratingLabel:rank:ratingDescription:](self, "initWithRatingSystem:ratingLabel:rank:ratingDescription:", +[_TVContentRatingSystemUtilities ratingSystemForString:](_TVContentRatingSystemUtilities, "ratingSystemForString:", a3), v11, a5, v10);

  return v12;
}

- (_TVContentRating)initWithRatingSystem:(int64_t)a3 explicitContent:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 200;
  else
    v4 = 0;
  return -[_TVContentRating initWithRatingSystem:ratingLabel:rank:ratingDescription:](self, "initWithRatingSystem:ratingLabel:rank:ratingDescription:", a3, 0, v4, 0);
}

- (_TVContentRating)initWithStringRepresentation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _TVContentRating *v13;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "characterSetWithCharactersInString:", CFSTR("|"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "count");
  if (v8)
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)1)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v7, "objectAtIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)v8 < 3)
    {
      v10 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v7, "objectAtIndex:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "integerValue");

    if (v8 == (void *)3)
    {
LABEL_9:
      v8 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v7, "objectAtIndex:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    v9 = 0;
    v11 = 0;
  }
LABEL_10:
  v13 = -[_TVContentRating initWithRatingSystemString:ratingLabel:rank:ratingDescription:](self, "initWithRatingSystemString:ratingLabel:rank:ratingDescription:", v9, v11, v10, v8);

  return v13;
}

- (int64_t)ratingSystemKind
{
  return +[_TVContentRatingSystemUtilities ratingSystemKindForRatingSystem:](_TVContentRatingSystemUtilities, "ratingSystemKindForRatingSystem:", -[_TVContentRating ratingSystem](self, "ratingSystem"));
}

- (NSString)ratingSystemString
{
  return (NSString *)+[_TVContentRatingSystemUtilities stringForRatingSystem:](_TVContentRatingSystemUtilities, "stringForRatingSystem:", -[_TVContentRating ratingSystem](self, "ratingSystem"));
}

- (BOOL)isExplicitContent
{
  return -[_TVContentRating ratingSystem](self, "ratingSystem") == 1 && self->_rank == 200;
}

- (NSString)stringRepresentation
{
  id v3;
  void *v4;
  const __CFString *ratingLabel;
  const __CFString *ratingDescription;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  +[_TVContentRatingSystemUtilities stringForRatingSystem:](_TVContentRatingSystemUtilities, "stringForRatingSystem:", self->_ratingSystem);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@|"), v4);

  ratingLabel = (const __CFString *)self->_ratingLabel;
  if (!ratingLabel)
    ratingLabel = &stru_24FD41578;
  objc_msgSend(v3, "appendFormat:", CFSTR("%@|"), ratingLabel);
  objc_msgSend(v3, "appendFormat:", CFSTR("%lu|"), self->_rank);
  if (self->_ratingDescription)
    ratingDescription = (const __CFString *)self->_ratingDescription;
  else
    ratingDescription = &stru_24FD41578;
  objc_msgSend(v3, "appendString:", ratingDescription);
  return (NSString *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_TVContentRating;
  -[_TVContentRating description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVContentRating stringRepresentation](self, "stringRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _TVContentRating *v4;
  _TVContentRating *v5;
  _TVContentRating *v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = (_TVContentRating *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v19 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v7 = -[_TVContentRating ratingSystem](self, "ratingSystem");
        if (v7 != -[_TVContentRating ratingSystem](v6, "ratingSystem"))
          goto LABEL_10;
        v8 = -[_TVContentRating rank](self, "rank");
        if (v8 != -[_TVContentRating rank](v6, "rank"))
          goto LABEL_10;
        -[_TVContentRating ratingLabel](self, "ratingLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVContentRating ratingLabel](v6, "ratingLabel");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v9 == (void *)v10)
        {

        }
        else
        {
          v11 = (void *)v10;
          -[_TVContentRating ratingLabel](self, "ratingLabel");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            v19 = 0;
            goto LABEL_24;
          }
          v13 = (void *)v12;
          -[_TVContentRating ratingLabel](v6, "ratingLabel");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
            goto LABEL_18;
          v15 = (void *)v14;
          -[_TVContentRating ratingLabel](self, "ratingLabel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVContentRating ratingLabel](v6, "ratingLabel");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if (!v18)
          {
LABEL_10:
            v19 = 0;
LABEL_25:

            goto LABEL_26;
          }
        }
        -[_TVContentRating ratingDescription](self, "ratingDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVContentRating ratingDescription](v6, "ratingDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 != v11)
        {
          -[_TVContentRating ratingDescription](self, "ratingDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[_TVContentRating ratingDescription](v6, "ratingDescription");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              -[_TVContentRating ratingDescription](self, "ratingDescription");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[_TVContentRating ratingDescription](v6, "ratingDescription");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v21, "isEqual:", v22);

            }
            else
            {
              v19 = 0;
            }

            goto LABEL_23;
          }
LABEL_18:
          v19 = 0;
LABEL_23:

          goto LABEL_24;
        }
        v19 = 1;
LABEL_24:

        goto LABEL_25;
      }
    }
    v19 = 0;
  }
LABEL_26:

  return v19;
}

- (unint64_t)hash
{
  int64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[_TVContentRating ratingSystem](self, "ratingSystem");
  v4 = v3 ^ (2 * -[_TVContentRating rank](self, "rank"));
  -[_TVContentRating ratingLabel](self, "ratingLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[_TVContentRating ratingDescription](self, "ratingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (int64_t)ratingSystem
{
  return self->_ratingSystem;
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (NSString)ratingDescription
{
  return self->_ratingDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingDescription, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
}

@end
