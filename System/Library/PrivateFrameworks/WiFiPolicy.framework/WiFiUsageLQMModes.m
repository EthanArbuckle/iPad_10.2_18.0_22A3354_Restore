@implementation WiFiUsageLQMModes

- (WiFiUsageLQMModes)initWithValue:(id)a3 andOccurrences:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WiFiUsageLQMModes *v10;
  WiFiUsageLQMModes *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)WiFiUsageLQMModes;
    v11 = -[WiFiUsageLQMModes init](&v13, sel_init);
    objc_storeStrong((id *)&v11->_value, a3);
    objc_storeStrong((id *)&v11->_occurrences, a4);
    self = v11;
    v10 = self;
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{% 2d : %@}"), -[NSNumber unsignedIntValue](self->_occurrences, "unsignedIntValue"), self->_value);
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSNumber)occurrences
{
  return self->_occurrences;
}

- (void)setOccurrences:(id)a3
{
  objc_storeStrong((id *)&self->_occurrences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrences, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
