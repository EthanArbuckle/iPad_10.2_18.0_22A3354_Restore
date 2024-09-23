@implementation _SFPBMailResultDetails

- (_SFPBMailResultDetails)initWithFacade:(id)a3
{
  id v4;
  _SFPBMailResultDetails *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBMailResultDetails *v10;

  v4 = a3;
  v5 = -[_SFPBMailResultDetails init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasDataSources"))
      -[_SFPBMailResultDetails setDataSources:](v5, "setDataSources:", objc_msgSend(v4, "dataSources"));
    objc_msgSend(v4, "suggestionScore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "suggestionScore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      -[_SFPBMailResultDetails setSuggestionScore:](v5, "setSuggestionScore:");

    }
    objc_msgSend(v4, "skgMegadomeSpotlightIndexEntries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "skgMegadomeSpotlightIndexEntries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMailResultDetails setSkgMegadomeSpotlightIndexEntries:](v5, "setSkgMegadomeSpotlightIndexEntries:", objc_msgSend(v9, "intValue"));

    }
    v10 = v5;
  }

  return v5;
}

- (void)setDataSources:(int)a3
{
  self->_dataSources = a3;
}

- (void)setSuggestionScore:(float)a3
{
  self->_suggestionScore = a3;
}

- (void)setSkgMegadomeSpotlightIndexEntries:(int)a3
{
  self->_skgMegadomeSpotlightIndexEntries = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBMailResultDetailsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_SFPBMailResultDetails dataSources](self, "dataSources"))
    PBDataWriterWriteInt32Field();
  -[_SFPBMailResultDetails suggestionScore](self, "suggestionScore");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  v5 = -[_SFPBMailResultDetails skgMegadomeSpotlightIndexEntries](self, "skgMegadomeSpotlightIndexEntries");
  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int dataSources;
  float suggestionScore;
  float v7;
  BOOL v8;
  int skgMegadomeSpotlightIndexEntries;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (dataSources = self->_dataSources, dataSources == objc_msgSend(v4, "dataSources"))
    && (suggestionScore = self->_suggestionScore, objc_msgSend(v4, "suggestionScore"), suggestionScore == v7))
  {
    skgMegadomeSpotlightIndexEntries = self->_skgMegadomeSpotlightIndexEntries;
    v8 = skgMegadomeSpotlightIndexEntries == objc_msgSend(v4, "skgMegadomeSpotlightIndexEntries");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t dataSources;
  float suggestionScore;
  BOOL v5;
  double v6;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;

  dataSources = self->_dataSources;
  suggestionScore = self->_suggestionScore;
  v5 = suggestionScore < 0.0;
  if (suggestionScore == 0.0)
  {
    v10 = 0;
  }
  else
  {
    v6 = suggestionScore;
    v7 = -v6;
    if (!v5)
      v7 = v6;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v10 += (unint64_t)v9;
    }
    else
    {
      v10 -= (unint64_t)fabs(v9);
    }
  }
  return v10 ^ (2654435761 * dataSources) ^ (2654435761 * self->_skgMegadomeSpotlightIndexEntries);
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dataSources)
  {
    v4 = -[_SFPBMailResultDetails dataSources](self, "dataSources");
    if (v4 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E4042190 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dataSources"));

  }
  if (self->_skgMegadomeSpotlightIndexEntries)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBMailResultDetails skgMegadomeSpotlightIndexEntries](self, "skgMegadomeSpotlightIndexEntries"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("skgMegadomeSpotlightIndexEntries"));

  }
  if (self->_suggestionScore != 0.0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBMailResultDetails suggestionScore](self, "suggestionScore");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("suggestionScore"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBMailResultDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBMailResultDetails)initWithJSON:(id)a3
{
  void *v4;
  _SFPBMailResultDetails *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBMailResultDetails initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBMailResultDetails)initWithDictionary:(id)a3
{
  id v4;
  _SFPBMailResultDetails *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBMailResultDetails *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBMailResultDetails;
  v5 = -[_SFPBMailResultDetails init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataSources"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailResultDetails setDataSources:](v5, "setDataSources:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[_SFPBMailResultDetails setSuggestionScore:](v5, "setSuggestionScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("skgMegadomeSpotlightIndexEntries"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailResultDetails setSkgMegadomeSpotlightIndexEntries:](v5, "setSkgMegadomeSpotlightIndexEntries:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (int)dataSources
{
  return self->_dataSources;
}

- (float)suggestionScore
{
  return self->_suggestionScore;
}

- (int)skgMegadomeSpotlightIndexEntries
{
  return self->_skgMegadomeSpotlightIndexEntries;
}

@end
