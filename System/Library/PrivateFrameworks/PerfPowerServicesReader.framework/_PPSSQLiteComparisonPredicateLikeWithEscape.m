@implementation _PPSSQLiteComparisonPredicateLikeWithEscape

- (_PPSSQLiteComparisonPredicateLikeWithEscape)initWithProperty:(id)a3 value:(id)a4 escapeCharacter:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PPSSQLiteComparisonPredicateLikeWithEscape *v11;
  uint64_t v12;
  NSString *escapeCharacter;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PPSSQLiteComparisonPredicateLikeWithEscape;
  v11 = -[PPSSQLiteComparisonPredicate initWithProperty:value:comparisonType:](&v15, sel_initWithProperty_value_comparisonType_, v8, v9, 7);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    escapeCharacter = v11->_escapeCharacter;
    v11->_escapeCharacter = (NSString *)v12;

  }
  return v11;
}

- (id)sqlForEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PPSSQLitePropertyPredicate property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disambiguatedSQLForProperty:shouldEscape:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@ LIKE ? ESCAPE '%@')"), v6, self->_escapeCharacter);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)escapeCharacter
{
  return self->_escapeCharacter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_escapeCharacter, 0);
}

@end
