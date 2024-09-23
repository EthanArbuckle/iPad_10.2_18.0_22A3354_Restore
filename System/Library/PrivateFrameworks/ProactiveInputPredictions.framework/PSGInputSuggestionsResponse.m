@implementation PSGInputSuggestionsResponse

- (PSGInputSuggestionsResponse)initWithResponseItems:(id)a3 explanationSet:(id)a4
{
  id v7;
  id v8;
  PSGInputSuggestionsResponse *v9;
  PSGInputSuggestionsResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSGInputSuggestionsResponse;
  v9 = -[PSGInputSuggestionsResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_responseItems, a3);
    objc_storeStrong((id *)&v10->_explanationSet, a4);
  }

  return v10;
}

- (PSGInputSuggestionsResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  PSGInputSuggestionsResponse *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1DF0B9950]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ris"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PSGInputSuggestionsResponse initWithResponseItems:explanationSet:](self, "initWithResponseItems:explanationSet:", v9, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *responseItems;
  id v5;

  responseItems = self->_responseItems;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", responseItems, CFSTR("ris"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_explanationSet, CFSTR("eps"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  objc_opt_class();
  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    v6 = -[NSArray copyWithZone:](self->_responseItems, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = -[PSGInputSuggestionsExplanationSet copyWithZone:](self->_explanationSet, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

  }
  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4;
  _QWORD *v5;
  NSArray *responseItems;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  char v11;
  PSGInputSuggestionsExplanationSet *v12;
  PSGInputSuggestionsExplanationSet *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  responseItems = self->_responseItems;
  v7 = (NSArray *)*((id *)v4 + 2);
  if (responseItems == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = responseItems;
    v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_explanationSet;
  v13 = v12;
  if (v12 == (PSGInputSuggestionsExplanationSet *)v5[3])
    v11 = 1;
  else
    v11 = -[PSGInputSuggestionsExplanationSet isEqual:](v12, "isEqual:");

LABEL_10:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PSGInputSuggestionsResponse *v4;
  PSGInputSuggestionsResponse *v5;
  BOOL v6;

  v4 = (PSGInputSuggestionsResponse *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PSGInputSuggestionsResponse isEqualToResponse:](self, "isEqualToResponse:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_responseItems, "hash");
  return -[PSGInputSuggestionsExplanationSet hash](self->_explanationSet, "hash") - v3 + 32 * v3;
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("<PSGInputSuggestionsResponse ris:("));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_responseItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        objc_msgSend(v3, "appendString:", CFSTR("; "));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(") eps:%@>"), self->_explanationSet);
  objc_msgSend(v3, "appendString:", v10);

  return v3;
}

- (NSArray)responseItems
{
  return self->_responseItems;
}

- (PSGInputSuggestionsExplanationSet)explanationSet
{
  return self->_explanationSet;
}

- (double)triggeringTimeMillis
{
  return self->_triggeringTimeMillis;
}

- (void)setTriggeringTimeMillis:(double)a3
{
  self->_triggeringTimeMillis = a3;
}

- (int)triggeredItemsCount
{
  return self->_triggeredItemsCount;
}

- (void)setTriggeredItemsCount:(int)a3
{
  self->_triggeredItemsCount = a3;
}

- (double)servingTimeMillis
{
  return self->_servingTimeMillis;
}

- (void)setServingTimeMillis:(double)a3
{
  self->_servingTimeMillis = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanationSet, 0);
  objc_storeStrong((id *)&self->_responseItems, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
