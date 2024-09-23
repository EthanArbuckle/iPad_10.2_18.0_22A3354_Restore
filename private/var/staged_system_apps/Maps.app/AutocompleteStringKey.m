@implementation AutocompleteStringKey

- (AutocompleteStringKey)init
{

  return 0;
}

- (AutocompleteStringKey)initWithString:(id)a3
{
  id v4;
  AutocompleteStringKey *v5;
  uint64_t v6;
  NSString *string;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AutocompleteStringKey;
  v5 = -[AutocompleteStringKey init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
    string = v5->_string;
    v5->_string = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_string, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AutocompleteStringKey *v4;
  AutocompleteStringKey *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (AutocompleteStringKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(AutocompleteStringKey), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = -[NSString isEqualToString:](self->_string, "isEqualToString:", v5->_string);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("key - %@"), self->_string);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
