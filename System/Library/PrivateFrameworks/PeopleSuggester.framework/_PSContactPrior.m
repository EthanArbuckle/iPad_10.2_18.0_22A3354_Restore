@implementation _PSContactPrior

- (_PSContactPrior)initWithContactIdentifier:(id)a3 priorScore:(float)a4 rank:(unsigned int)a5 modelName:(id)a6 modelVersion:(id)a7
{
  id v12;
  id v13;
  id v14;
  _PSContactPrior *v15;
  uint64_t v16;
  NSString *contactIdentifier;
  CNContact *contact;
  uint64_t v19;
  NSString *modelName;
  uint64_t v21;
  NSString *modelVersion;
  objc_super v24;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)_PSContactPrior;
  v15 = -[_PSContactPrior init](&v24, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    contactIdentifier = v15->_contactIdentifier;
    v15->_contactIdentifier = (NSString *)v16;

    contact = v15->_contact;
    v15->_contact = 0;

    v15->_priorScore = a4;
    v15->_rank = a5;
    v19 = objc_msgSend(v13, "copy");
    modelName = v15->_modelName;
    v15->_modelName = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    modelVersion = v15->_modelVersion;
    v15->_modelVersion = (NSString *)v21;

  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[_PSContactPrior contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_contactIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[_PSContactPrior priorScore](self, "priorScore");
  v8 = v7;
  NSStringFromSelector(sel_priorScore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = v8;
  objc_msgSend(v4, "encodeFloat:forKey:", v9, v10);

  v11 = -[_PSContactPrior rank](self, "rank");
  NSStringFromSelector(sel_rank);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt32:forKey:", v11, v12);

  -[_PSContactPrior modelName](self, "modelName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_modelName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[_PSContactPrior modelVersion](self, "modelVersion");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_modelVersion);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, v15);

}

- (_PSContactPrior)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  _PSContactPrior *v20;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_contactIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_priorScore);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeFloatForKey:", v8);
  v10 = v9;

  NSStringFromSelector(sel_rank);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeInt32ForKey:", v11);

  v13 = objc_opt_class();
  NSStringFromSelector(sel_modelName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  NSStringFromSelector(sel_modelVersion);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v19) = v10;
  v20 = -[_PSContactPrior initWithContactIdentifier:priorScore:rank:modelName:modelVersion:](self, "initWithContactIdentifier:priorScore:rank:modelName:modelVersion:", v7, v12, v15, v18, v19);

  return v20;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_contactIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _PSContactPrior *v4;
  _PSContactPrior *v5;
  _PSContactPrior *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (_PSContactPrior *)a3;
  v5 = v4;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[_PSContactPrior contactIdentifier](self, "contactIdentifier");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          -[_PSContactPrior modelName](self, "modelName");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            v20 = 0;
LABEL_23:

            goto LABEL_24;
          }
          v10 = (void *)v9;
          -[_PSContactPrior modelVersion](self, "modelVersion");
          v11 = objc_claimAutoreleasedReturnValue();
          if (!v11)
            goto LABEL_17;
          v12 = (void *)v11;
          -[_PSContactPrior contactIdentifier](v6, "contactIdentifier");
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v20 = 0;
LABEL_21:

            goto LABEL_22;
          }
          v14 = (void *)v13;
          -[_PSContactPrior modelName](v6, "modelName");
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
            goto LABEL_19;
          v16 = (void *)v15;
          -[_PSContactPrior modelVersion](v6, "modelVersion");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            -[_PSContactPrior contactIdentifier](self, "contactIdentifier");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSContactPrior contactIdentifier](v6, "contactIdentifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v8, "isEqualToString:", v10))
            {
              -[_PSContactPrior modelName](self, "modelName");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PSContactPrior modelName](v6, "modelName");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "isEqualToString:", v14))
              {
                -[_PSContactPrior modelVersion](self, "modelVersion");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[_PSContactPrior modelVersion](v6, "modelVersion");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v18, "isEqualToString:", v19);

LABEL_20:
                goto LABEL_21;
              }
LABEL_19:
              v20 = 0;
              goto LABEL_20;
            }
LABEL_17:
            v20 = 0;
LABEL_22:

            goto LABEL_23;
          }
        }
        v20 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    v20 = 0;
  }
LABEL_25:

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _PSContactPrior *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[_PSContactPrior init](+[_PSContactPrior allocWithZone:](_PSContactPrior, "allocWithZone:", a3), "init");
  -[_PSContactPrior contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactPrior setContactIdentifier:](v4, "setContactIdentifier:", v5);

  -[_PSContactPrior priorScore](self, "priorScore");
  -[_PSContactPrior setPriorScore:](v4, "setPriorScore:");
  -[_PSContactPrior setRank:](v4, "setRank:", -[_PSContactPrior rank](self, "rank"));
  -[_PSContactPrior modelName](self, "modelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactPrior setModelName:](v4, "setModelName:", v6);

  -[_PSContactPrior modelVersion](self, "modelVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactPrior setModelVersion:](v4, "setModelVersion:", v7);

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_PSContactPrior contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactPrior contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactPrior priorScore](self, "priorScore");
  v8 = v7;
  v9 = -[_PSContactPrior rank](self, "rank");
  -[_PSContactPrior modelName](self, "modelName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactPrior modelVersion](self, "modelVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> contactIdentifier: %@, contact: %@, priorScore: %f, rank: %d, modelName: %@, modelVersion: %@"), v4, self, v5, v6, *(_QWORD *)&v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (float)priorScore
{
  return self->_priorScore;
}

- (void)setPriorScore:(float)a3
{
  self->_priorScore = a3;
}

- (unsigned)rank
{
  return self->_rank;
}

- (void)setRank:(unsigned int)a3
{
  self->_rank = a3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
