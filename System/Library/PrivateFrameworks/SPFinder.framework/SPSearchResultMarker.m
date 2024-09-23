@implementation SPSearchResultMarker

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPSearchResultMarker)initWithCoder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPSearchResultMarker setDate:](self, "setDate:", v5);
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPSearchResultMarker date](self, "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("date"));

}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
