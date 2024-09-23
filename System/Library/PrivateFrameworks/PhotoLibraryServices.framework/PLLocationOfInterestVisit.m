@implementation PLLocationOfInterestVisit

- (PLLocationOfInterestVisit)initWithIdentifier:(id)a3 visitInterval:(id)a4 confidence:(double)a5
{
  id v10;
  id v11;
  void *v12;
  PLLocationOfInterestVisit *v13;
  PLLocationOfInterestVisit *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLocationOfInterestVisit.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLocationOfInterestVisit.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visitInterval != nil"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PLLocationOfInterestVisit;
  v13 = -[PLLocationOfInterestVisit init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_visitInterval, a4);
    v14->_confidence = a5;
  }

  return v14;
}

- (PLLocationOfInterestVisit)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PLLocationOfInterestVisit *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visitInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
  v7 = -[PLLocationOfInterestVisit initWithIdentifier:visitInterval:confidence:](self, "initWithIdentifier:visitInterval:confidence:", v5, v6);
  if (v7)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationOfInterest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addVisit:", v7);

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;
  id WeakRetained;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_visitInterval, CFSTR("visitInterval"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);
  WeakRetained = objc_loadWeakRetained((id *)&self->_locationOfInterest);
  objc_msgSend(v5, "encodeObject:forKey:", WeakRetained, CFSTR("locationOfInterest"));

}

- (void)setLocationOfInterest:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_locationOfInterest);
  if (WeakRetained != obj || (objc_msgSend(obj, "isEqual:", obj) & 1) == 0)
  {
    objc_msgSend(WeakRetained, "removeVisit:", self);
    objc_storeWeak((id *)&self->_locationOfInterest, obj);
    objc_msgSend(obj, "addVisit:", self);
  }

}

- (BOOL)isEqual:(id)a3
{
  PLLocationOfInterestVisit *v4;
  NSUUID *identifier;
  void *v6;
  char v7;

  v4 = (PLLocationOfInterestVisit *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      -[PLLocationOfInterestVisit identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSUUID isEqual:](identifier, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PLLocationOfInterestVisit;
  -[PLLocationOfInterestVisit description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, self->_visitInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDateInterval)visitInterval
{
  return self->_visitInterval;
}

- (double)confidence
{
  return self->_confidence;
}

- (PLLocationOfInterest)locationOfInterest
{
  return (PLLocationOfInterest *)objc_loadWeakRetained((id *)&self->_locationOfInterest);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_locationOfInterest);
  objc_storeStrong((id *)&self->_visitInterval, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
