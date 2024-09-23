@implementation PRUISIncomingCallPosterContextNameVariations

- (PRUISIncomingCallPosterContextNameVariations)initWithNamesDictionary:(id)a3
{
  id v4;
  PRUISIncomingCallPosterContextNameVariations *v5;
  uint64_t v6;
  NSDictionary *namesDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISIncomingCallPosterContextNameVariations;
  v5 = -[PRUISIncomingCallPosterContextNameVariations init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    namesDictionary = v5->_namesDictionary;
    v5->_namesDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (id)nameForStyle:(int64_t)a3
{
  NSDictionary *namesDictionary;
  void *v4;
  void *v5;

  namesDictionary = self->_namesDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](namesDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "namesDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISIncomingCallPosterContextNameVariations namesDictionary](self, "namesDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = BSEqualDictionaries();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_namesDictionary);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (NSDictionary)namesDictionary
{
  return self->_namesDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namesDictionary, 0);
}

@end
