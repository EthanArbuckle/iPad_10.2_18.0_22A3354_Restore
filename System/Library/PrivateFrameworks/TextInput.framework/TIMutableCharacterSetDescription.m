@implementation TIMutableCharacterSetDescription

- (id)copyWithZone:(_NSZone *)a3
{
  TICharacterSetDescription *v4;
  int64_t v5;
  void *v6;
  void *v7;
  TICharacterSetDescription *v8;

  v4 = +[TICharacterSetDescription allocWithZone:](TICharacterSetDescription, "allocWithZone:", a3);
  v5 = -[TICharacterSetDescription baseIdentifier](self, "baseIdentifier");
  -[TICharacterSetDescription charactersAddedToBase](self, "charactersAddedToBase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TICharacterSetDescription charactersRemovedFromBase](self, "charactersRemovedFromBase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TICharacterSetDescription initWithBase:additionalCharacters:removedCharacters:inverted:](v4, "initWithBase:additionalCharacters:removedCharacters:inverted:", v5, v6, v7, -[TICharacterSetDescription inverted](self, "inverted"));

  return v8;
}

- (void)addCharactersInString:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  -[TICharacterSetDescription clearCachedCharacterSet](self, "clearCachedCharacterSet");
  -[TICharacterSetDescription charactersAddedToBase](self, "charactersAddedToBase");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (id)v5;
  else
    v7 = v4;
  -[TICharacterSetDescription setCharactersAddedToBase:](self, "setCharactersAddedToBase:", v7);

}

- (void)removeCharactersInString:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  -[TICharacterSetDescription clearCachedCharacterSet](self, "clearCachedCharacterSet");
  -[TICharacterSetDescription charactersRemovedFromBase](self, "charactersRemovedFromBase");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (id)v5;
  else
    v7 = v4;
  -[TICharacterSetDescription setCharactersRemovedFromBase:](self, "setCharactersRemovedFromBase:", v7);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
