@implementation MOContextString

- (MOContextString)initWithIdentifier:(id)a3 string:(id)a4
{
  id v7;
  id v8;
  MOContextString *v9;
  MOContextString *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOContextString;
  v9 = -[MOContextString init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stringIdentifier, a3);
    objc_storeStrong((id *)&v10->_textString, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *stringIdentifier;
  id v5;

  stringIdentifier = self->_stringIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", stringIdentifier, CFSTR("stringIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_textString, CFSTR("textString"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextDimensions, CFSTR("contextDimensions"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("accuracy"), self->_accuracy);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("satisfaction"), self->_satisfaction);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contentType, CFSTR("contentType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_promptIndex, CFSTR("promptIndex"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("totalScore"), self->_totalScore);

}

- (MOContextString)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MOContextString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *contextDimensions;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOContextString initWithIdentifier:string:](self, "initWithIdentifier:string:", v5, v6);
  if (v7)
  {
    v7->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("contextDimensions"));
    v11 = objc_claimAutoreleasedReturnValue();
    contextDimensions = v7->_contextDimensions;
    v7->_contextDimensions = (NSArray *)v11;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("accuracy"));
    v7->_accuracy = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("satisfaction"));
    v7->_satisfaction = v14;
    v7->_contentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentType"));
    v7->_promptIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("promptIndex"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("totalScore"));
    v7->_totalScore = v15;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSUUID *stringIdentifier;
  void *v7;
  NSString *textString;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());
  stringIdentifier = self->_stringIdentifier;
  objc_msgSend(v4, "stringIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(stringIdentifier) = -[NSUUID isEqual:](stringIdentifier, "isEqual:", v7);

  textString = self->_textString;
  objc_msgSend(v4, "textString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(textString) = -[NSString isEqual:](textString, "isEqual:", v9);
  return v5 & stringIdentifier & textString;
}

+ (id)describeSource:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return off_251442600[a3 - 1];
}

- (id)describeSource
{
  return +[MOContextString describeSource:](MOContextString, "describeSource:", -[MOContextString source](self, "source"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MOContextString stringIdentifier](self, "stringIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextString textString](self, "textString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextString describeSource](self, "describeSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextString contextDimensions](self, "contextDimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MOContextString contentType](self, "contentType");
  v9 = -[MOContextString promptIndex](self, "promptIndex");
  -[MOContextString totalScore](self, "totalScore");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("stringIdentifier, %@, string, %@, source, %@, contextDimensions, %@, contentType, %lu, promptIndex, %lu, totalScore, %f"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOContextString *v4;
  void *v5;
  void *v6;
  MOContextString *v7;
  void *v8;

  v4 = [MOContextString alloc];
  -[MOContextString stringIdentifier](self, "stringIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextString textString](self, "textString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOContextString initWithIdentifier:string:](v4, "initWithIdentifier:string:", v5, v6);

  -[MOContextString contextDimensions](self, "contextDimensions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextString setContextDimensions:](v7, "setContextDimensions:", v8);

  -[MOContextString setSource:](v7, "setSource:", -[MOContextString source](self, "source"));
  -[MOContextString accuracy](self, "accuracy");
  -[MOContextString setAccuracy:](v7, "setAccuracy:");
  -[MOContextString satisfaction](self, "satisfaction");
  -[MOContextString setSatisfaction:](v7, "setSatisfaction:");
  -[MOContextString setContentType:](v7, "setContentType:", -[MOContextString contentType](self, "contentType"));
  -[MOContextString setPromptIndex:](v7, "setPromptIndex:", -[MOContextString promptIndex](self, "promptIndex"));
  -[MOContextString totalScore](self, "totalScore");
  -[MOContextString setTotalScore:](v7, "setTotalScore:");
  return v7;
}

- (NSString)textString
{
  return self->_textString;
}

- (void)setTextString:(id)a3
{
  objc_storeStrong((id *)&self->_textString, a3);
}

- (NSUUID)stringIdentifier
{
  return self->_stringIdentifier;
}

- (void)setStringIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stringIdentifier, a3);
}

- (NSArray)contextDimensions
{
  return self->_contextDimensions;
}

- (void)setContextDimensions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(double)a3
{
  self->_accuracy = a3;
}

- (double)satisfaction
{
  return self->_satisfaction;
}

- (void)setSatisfaction:(double)a3
{
  self->_satisfaction = a3;
}

- (unint64_t)promptIndex
{
  return self->_promptIndex;
}

- (void)setPromptIndex:(unint64_t)a3
{
  self->_promptIndex = a3;
}

- (double)totalScore
{
  return self->_totalScore;
}

- (void)setTotalScore:(double)a3
{
  self->_totalScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextDimensions, 0);
  objc_storeStrong((id *)&self->_stringIdentifier, 0);
  objc_storeStrong((id *)&self->_textString, 0);
}

+ (id)fromBiome:(id)a3
{
  id v3;
  MOContextString *v4;
  void *v5;
  void *v6;
  MOContextString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [MOContextString alloc];
  objc_msgSend(v3, "stringIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOContextString initWithIdentifier:string:](v4, "initWithIdentifier:string:", v5, v6);

  v8 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "dimensions", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        +[MOContextDimension fromBiome:](MOContextDimension, "fromBiome:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[MOContextString setContextDimensions:](v7, "setContextDimensions:", v8);
  return v7;
}

@end
