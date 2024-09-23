@implementation NSDictionary

- (BOOL)tui_hasProperty:(id)a3
{
  return a3 != 0;
}

- (id)tui_valueForProperty:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:"));
  else
    return 0;
}

- (id)dictionaryByAddingEntriesFromDictionary:(id)a3
{
  NSDictionary *v4;
  id v5;
  NSDictionary *v6;

  v4 = self;
  if (a3)
  {
    v5 = a3;
    v6 = (NSDictionary *)-[NSDictionary mutableCopy](v4, "mutableCopy");
    -[NSDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v5);

    v4 = v6;
  }
  return v4;
}

@end
