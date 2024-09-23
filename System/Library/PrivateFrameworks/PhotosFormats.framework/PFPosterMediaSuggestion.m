@implementation PFPosterMediaSuggestion

- (PFPosterMediaSuggestion)initWithAssetUUID:(id)a3 suggestionUUID:(id)a4 suggestionSubtype:(unsigned __int16)a5
{
  uint64_t v5;
  id v8;
  id v9;
  PFPosterMediaSuggestion *v10;
  PFPosterMediaSuggestion *v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PFPosterMediaSuggestion;
  v10 = -[PFPosterMedia initWithAssetUUID:](&v13, sel_initWithAssetUUID_, v8);
  v11 = v10;
  if (v10)
  {
    -[PFPosterMedia setMediaType:](v10, "setMediaType:", 2);
    -[PFPosterMediaSuggestion setSuggestionUUID:](v11, "setSuggestionUUID:", v9);
    -[PFPosterMedia setSubpath:](v11, "setSubpath:", v8);
    -[PFPosterMediaSuggestion setSuggestionSubtype:](v11, "setSuggestionSubtype:", v5);
  }

  return v11;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)PFPosterMediaSuggestion;
  -[PFPosterMedia description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterMediaSuggestion suggestionUUID](self, "suggestionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ suggestionUUID: %@; subtype: %hu>"),
                 v4,
                 v5,
                 -[PFPosterMediaSuggestion suggestionSubtype](self, "suggestionSubtype"));

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFPosterMediaSuggestion;
  v4 = -[PFPosterMedia copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[PFPosterMediaSuggestion suggestionUUID](self, "suggestionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuggestionUUID:", v5);

  objc_msgSend(v4, "setSuggestionSubtype:", -[PFPosterMediaSuggestion suggestionSubtype](self, "suggestionSubtype"));
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFPosterMediaSuggestion;
  v3 = -[PFPosterMedia hash](&v7, sel_hash);
  -[PFPosterMediaSuggestion suggestionUUID](self, "suggestionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ (2 * objc_msgSend(v4, "hash"));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PFPosterMediaSuggestion *v4;
  PFPosterMediaSuggestion *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (PFPosterMediaSuggestion *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v10.receiver = self;
      v10.super_class = (Class)PFPosterMediaSuggestion;
      if (-[PFPosterMedia isEqual:](&v10, sel_isEqual_, v5))
      {
        -[PFPosterMediaSuggestion suggestionUUID](self, "suggestionUUID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PFPosterMediaSuggestion suggestionUUID](v5, "suggestionUUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 == v7)
          v8 = 1;
        else
          v8 = objc_msgSend(v6, "isEqual:", v7);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFPosterMediaSuggestion;
  v4 = a3;
  -[PFPosterMedia encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[PFPosterMediaSuggestion suggestionUUID](self, "suggestionUUID", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("suggestionUUID"));

  objc_msgSend(v4, "encodeInt:forKey:", -[PFPosterMediaSuggestion suggestionSubtype](self, "suggestionSubtype"), CFSTR("suggestionSubtype"));
}

- (PFPosterMediaSuggestion)initWithCoder:(id)a3
{
  id v4;
  PFPosterMediaSuggestion *v5;
  uint64_t v6;
  NSString *suggestionUUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFPosterMediaSuggestion;
  v5 = -[PFPosterMedia initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestionUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    suggestionUUID = v5->_suggestionUUID;
    v5->_suggestionUUID = (NSString *)v6;

    v5->_suggestionSubtype = objc_msgSend(v4, "decodeIntForKey:", CFSTR("suggestionSubtype"));
  }

  return v5;
}

- (NSString)suggestionUUID
{
  return self->_suggestionUUID;
}

- (void)setSuggestionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionUUID, a3);
}

- (unsigned)suggestionSubtype
{
  return self->_suggestionSubtype;
}

- (void)setSuggestionSubtype:(unsigned __int16)a3
{
  self->_suggestionSubtype = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
