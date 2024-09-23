@implementation SFMailResultDetails

- (SFMailResultDetails)initWithProtobuf:(id)a3
{
  id v4;
  SFMailResultDetails *v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  SFMailResultDetails *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFMailResultDetails;
  v5 = -[SFMailResultDetails init](&v12, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "dataSources"))
      -[SFMailResultDetails setDataSources:](v5, "setDataSources:", objc_msgSend(v4, "dataSources"));
    objc_msgSend(v4, "suggestionScore");
    if (v6 != 0.0)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "suggestionScore");
      objc_msgSend(v7, "numberWithFloat:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailResultDetails setSuggestionScore:](v5, "setSuggestionScore:", v8);

    }
    if (objc_msgSend(v4, "skgMegadomeSpotlightIndexEntries"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "skgMegadomeSpotlightIndexEntries"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailResultDetails setSkgMegadomeSpotlightIndexEntries:](v5, "setSkgMegadomeSpotlightIndexEntries:", v9);

    }
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDataSources:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dataSources = a3;
}

- (BOOL)hasDataSources
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFMailResultDetails)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMailResultDetails *v6;
  SFMailResultDetails *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBMailResultDetails initWithData:]([_SFPBMailResultDetails alloc], "initWithData:", v5);
  v7 = -[SFMailResultDetails initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMailResultDetails *v6;

  v4 = a3;
  v6 = -[_SFPBMailResultDetails initWithFacade:]([_SFPBMailResultDetails alloc], "initWithFacade:", self);
  -[_SFPBMailResultDetails data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMailResultDetails *v2;
  void *v3;

  v2 = -[_SFPBMailResultDetails initWithFacade:]([_SFPBMailResultDetails alloc], "initWithFacade:", self);
  -[_SFPBMailResultDetails dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMailResultDetails *v2;
  void *v3;

  v2 = -[_SFPBMailResultDetails initWithFacade:]([_SFPBMailResultDetails alloc], "initWithFacade:", self);
  -[_SFPBMailResultDetails jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDataSources:", -[SFMailResultDetails dataSources](self, "dataSources"));
  -[SFMailResultDetails suggestionScore](self, "suggestionScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSuggestionScore:", v6);

  -[SFMailResultDetails skgMegadomeSpotlightIndexEntries](self, "skgMegadomeSpotlightIndexEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSkgMegadomeSpotlightIndexEntries:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFMailResultDetails *v5;
  SFMailResultDetails *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;

  v5 = (SFMailResultDetails *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    if (-[SFMailResultDetails isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      v7 = -[SFMailResultDetails dataSources](self, "dataSources");
      if (v7 != -[SFMailResultDetails dataSources](v6, "dataSources"))
      {
        v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
      -[SFMailResultDetails suggestionScore](self, "suggestionScore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailResultDetails suggestionScore](v6, "suggestionScore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v12 = 0;
LABEL_21:

        goto LABEL_22;
      }
      -[SFMailResultDetails suggestionScore](self, "suggestionScore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[SFMailResultDetails suggestionScore](self, "suggestionScore");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMailResultDetails suggestionScore](v6, "suggestionScore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v11))
        {
          v12 = 0;
LABEL_19:

LABEL_20:
          goto LABEL_21;
        }
        v22 = v11;
      }
      -[SFMailResultDetails skgMegadomeSpotlightIndexEntries](self, "skgMegadomeSpotlightIndexEntries");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailResultDetails skgMegadomeSpotlightIndexEntries](v6, "skgMegadomeSpotlightIndexEntries");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if ((v13 == 0) == (v14 != 0))
      {

        v12 = 0;
      }
      else
      {
        -[SFMailResultDetails skgMegadomeSpotlightIndexEntries](self, "skgMegadomeSpotlightIndexEntries");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[SFMailResultDetails skgMegadomeSpotlightIndexEntries](self, "skgMegadomeSpotlightIndexEntries");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMailResultDetails skgMegadomeSpotlightIndexEntries](v6, "skgMegadomeSpotlightIndexEntries");
          v21 = v3;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v20, "isEqual:", v18);

          v3 = v21;
        }
        else
        {

          v12 = 1;
        }
      }
      v11 = v22;
      if (!v10)
        goto LABEL_20;
      goto LABEL_19;
    }
    v12 = 0;
  }
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[SFMailResultDetails dataSources](self, "dataSources");
  -[SFMailResultDetails suggestionScore](self, "suggestionScore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[SFMailResultDetails skgMegadomeSpotlightIndexEntries](self, "skgMegadomeSpotlightIndexEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (int)dataSources
{
  return self->_dataSources;
}

- (NSNumber)suggestionScore
{
  return self->_suggestionScore;
}

- (void)setSuggestionScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)skgMegadomeSpotlightIndexEntries
{
  return self->_skgMegadomeSpotlightIndexEntries;
}

- (void)setSkgMegadomeSpotlightIndexEntries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skgMegadomeSpotlightIndexEntries, 0);
  objc_storeStrong((id *)&self->_suggestionScore, 0);
}

@end
