@implementation SPKeySyncRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SPKeySyncRecord *v4;
  SPKeySyncRecord *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SPKeySyncRecord *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPKeySyncRecord identifier](v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPKeySyncRecord identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7)
        && (v8 = -[SPKeySyncRecord lastIndexObserved](v5, "lastIndexObserved"),
            v8 == -[SPKeySyncRecord lastIndexObserved](self, "lastIndexObserved")))
      {
        -[SPKeySyncRecord lastIndexObservationDate](v5, "lastIndexObservationDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPKeySyncRecord lastIndexObservationDate](self, "lastIndexObservationDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToDate:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSDate *lastIndexObservationDate;
  unint64_t v5;

  v3 = -[NSUUID hash](self->_identifier, "hash");
  lastIndexObservationDate = self->_lastIndexObservationDate;
  v5 = self->_lastIndexObserved ^ v3;
  return v5 ^ -[NSDate hash](lastIndexObservationDate, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[SPKeySyncRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIdentifier:", v6);

  objc_msgSend(v4, "setLastIndexObserved:", -[SPKeySyncRecord lastIndexObserved](self, "lastIndexObserved"));
  -[SPKeySyncRecord lastIndexObservationDate](self, "lastIndexObservationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setLastIndexObservationDate:", v8);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("lastIndexObserved"), (double)self->_lastIndexObserved);
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastIndexObservationDate, CFSTR("lastIndexObservationDate"));

}

- (SPKeySyncRecord)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  double v7;
  NSDate *v8;
  NSDate *lastIndexObservationDate;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastIndexObserved"));
  self->_lastIndexObserved = (unint64_t)v7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastIndexObservationDate"));
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();

  lastIndexObservationDate = self->_lastIndexObservationDate;
  self->_lastIndexObservationDate = v8;

  return self;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)lastIndexObserved
{
  return self->_lastIndexObserved;
}

- (void)setLastIndexObserved:(unint64_t)a3
{
  self->_lastIndexObserved = a3;
}

- (NSDate)lastIndexObservationDate
{
  return self->_lastIndexObservationDate;
}

- (void)setLastIndexObservationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastIndexObservationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
