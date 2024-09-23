@implementation PSTimeZoneTableCell

- (void)prepareForReuse
{
  ALCity *city;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSTimeZoneTableCell;
  -[PSTimeZoneTableCell prepareForReuse](&v4, sel_prepareForReuse);
  city = self->_city;
  self->_city = 0;

}

- (void)setCity:(id)a3
{
  ALCity **p_city;
  id v6;
  void *v7;
  id v8;

  p_city = &self->_city;
  objc_storeStrong((id *)&self->_city, a3);
  v6 = a3;
  -[ALCity displayNameIncludingCountry:](*p_city, "displayNameIncludingCountry:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PSTimeZoneTableCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

}

- (id)_contentString
{
  return (id)-[ALCity displayNameIncludingCountry:withFormat:](self->_city, "displayNameIncludingCountry:withFormat:", 1, CFSTR("%@\n%@"));
}

- (ALCity)city
{
  return self->_city;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
}

@end
