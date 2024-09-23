@implementation USOMatchInfo

- (USOMatchInfo)init
{
  return -[USOMatchInfo initWithMatchSignalBitSet:](self, "initWithMatchSignalBitSet:", 0);
}

- (USOMatchInfo)initWithMatchSignalBitSet:(unsigned int)a3
{
  USOMatchInfo *v4;
  USOMatchInfo *v5;
  uint64_t v6;
  NSMutableArray *matchedAliasTypes;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)USOMatchInfo;
  v4 = -[USOMatchInfo init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_matchSignalBitSet = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    matchedAliasTypes = v5->_matchedAliasTypes;
    v5->_matchedAliasTypes = (NSMutableArray *)v6;

  }
  return v5;
}

- (USOMatchInfo)initWithMatchSignalBitSet:(unsigned int)a3 matchScore:(float)a4 maxTokenCount:(unsigned int)a5 matchedTokenCount:(unsigned int)a6 maxStopWordCount:(unsigned int)a7 matchedStopWordCount:(unsigned int)a8 editDistance:(unsigned int)a9 maxAliasCount:(unsigned int)a10 matchedAliasCount:(unsigned int)a11 matchedAliasTypes:(id)a12
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v20;
  USOMatchInfo *v21;
  double v22;
  USOMatchInfo *v23;
  uint64_t v24;
  NSNumber *matchScore;
  uint64_t v26;
  NSNumber *maxTokenCount;
  uint64_t v28;
  NSNumber *matchedTokenCount;
  uint64_t v30;
  NSNumber *maxStopWordCount;
  uint64_t v32;
  NSNumber *matchedStopWordCount;
  uint64_t v34;
  NSNumber *editDistance;
  uint64_t v36;
  NSNumber *maxAliasCount;
  uint64_t v38;
  NSNumber *matchedAliasCount;
  uint64_t v40;
  NSMutableArray *matchedAliasTypes;
  objc_super v43;

  v12 = *(_QWORD *)&a9;
  v13 = *(_QWORD *)&a8;
  v14 = *(_QWORD *)&a7;
  v15 = *(_QWORD *)&a6;
  v16 = *(_QWORD *)&a5;
  v20 = a12;
  v43.receiver = self;
  v43.super_class = (Class)USOMatchInfo;
  v21 = -[USOMatchInfo init](&v43, sel_init);
  v23 = v21;
  if (v21)
  {
    v21->_matchSignalBitSet = a3;
    *(float *)&v22 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v24 = objc_claimAutoreleasedReturnValue();
    matchScore = v23->_matchScore;
    v23->_matchScore = (NSNumber *)v24;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16);
    v26 = objc_claimAutoreleasedReturnValue();
    maxTokenCount = v23->_maxTokenCount;
    v23->_maxTokenCount = (NSNumber *)v26;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
    v28 = objc_claimAutoreleasedReturnValue();
    matchedTokenCount = v23->_matchedTokenCount;
    v23->_matchedTokenCount = (NSNumber *)v28;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
    v30 = objc_claimAutoreleasedReturnValue();
    maxStopWordCount = v23->_maxStopWordCount;
    v23->_maxStopWordCount = (NSNumber *)v30;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
    v32 = objc_claimAutoreleasedReturnValue();
    matchedStopWordCount = v23->_matchedStopWordCount;
    v23->_matchedStopWordCount = (NSNumber *)v32;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v34 = objc_claimAutoreleasedReturnValue();
    editDistance = v23->_editDistance;
    v23->_editDistance = (NSNumber *)v34;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a10);
    v36 = objc_claimAutoreleasedReturnValue();
    maxAliasCount = v23->_maxAliasCount;
    v23->_maxAliasCount = (NSNumber *)v36;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a11);
    v38 = objc_claimAutoreleasedReturnValue();
    matchedAliasCount = v23->_matchedAliasCount;
    v23->_matchedAliasCount = (NSNumber *)v38;

    if (v20)
    {
      v40 = objc_msgSend(v20, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v40 = objc_claimAutoreleasedReturnValue();
    }
    matchedAliasTypes = v23->_matchedAliasTypes;
    v23->_matchedAliasTypes = (NSMutableArray *)v40;

  }
  return v23;
}

- (void)addAliasType:(unsigned int)a3
{
  NSMutableArray *matchedAliasTypes;
  id v4;

  matchedAliasTypes = self->_matchedAliasTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](matchedAliasTypes, "addObject:", v4);

}

- (USOMatchInfo)initWithCoder:(id)a3
{
  id v4;
  USOMatchInfo *v5;
  uint64_t v6;
  NSNumber *matchScore;
  uint64_t v8;
  NSNumber *maxTokenCount;
  uint64_t v10;
  NSNumber *matchedTokenCount;
  uint64_t v12;
  NSNumber *maxStopWordCount;
  uint64_t v14;
  NSNumber *matchedStopWordCount;
  uint64_t v16;
  NSNumber *editDistance;
  uint64_t v18;
  NSNumber *maxAliasCount;
  uint64_t v20;
  NSNumber *matchedAliasCount;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSMutableArray *matchedAliasTypes;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)USOMatchInfo;
  v5 = -[USOMatchInfo init](&v28, sel_init);
  if (v5)
  {
    v5->_matchSignalBitSet = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("matchSignalBitSet"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchScore"));
    v6 = objc_claimAutoreleasedReturnValue();
    matchScore = v5->_matchScore;
    v5->_matchScore = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxTokenCount"));
    v8 = objc_claimAutoreleasedReturnValue();
    maxTokenCount = v5->_maxTokenCount;
    v5->_maxTokenCount = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchedTokenCount"));
    v10 = objc_claimAutoreleasedReturnValue();
    matchedTokenCount = v5->_matchedTokenCount;
    v5->_matchedTokenCount = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxStopWordCount"));
    v12 = objc_claimAutoreleasedReturnValue();
    maxStopWordCount = v5->_maxStopWordCount;
    v5->_maxStopWordCount = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchedStopWordCount"));
    v14 = objc_claimAutoreleasedReturnValue();
    matchedStopWordCount = v5->_matchedStopWordCount;
    v5->_matchedStopWordCount = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("editDistance"));
    v16 = objc_claimAutoreleasedReturnValue();
    editDistance = v5->_editDistance;
    v5->_editDistance = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxAliasCount"));
    v18 = objc_claimAutoreleasedReturnValue();
    maxAliasCount = v5->_maxAliasCount;
    v5->_maxAliasCount = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchedAliasCount"));
    v20 = objc_claimAutoreleasedReturnValue();
    matchedAliasCount = v5->_matchedAliasCount;
    v5->_matchedAliasCount = (NSNumber *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("matchedAliasTypes"));
    v25 = objc_claimAutoreleasedReturnValue();
    matchedAliasTypes = v5->_matchedAliasTypes;
    v5->_matchedAliasTypes = (NSMutableArray *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[USOMatchInfo matchSignalBitSet](self, "matchSignalBitSet"), CFSTR("matchSignalBitSet"));
  -[USOMatchInfo matchScore](self, "matchScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("matchScore"));

  -[USOMatchInfo maxTokenCount](self, "maxTokenCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("maxTokenCount"));

  -[USOMatchInfo matchedTokenCount](self, "matchedTokenCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("matchedTokenCount"));

  -[USOMatchInfo maxStopWordCount](self, "maxStopWordCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("maxStopWordCount"));

  -[USOMatchInfo matchedStopWordCount](self, "matchedStopWordCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("matchedStopWordCount"));

  -[USOMatchInfo editDistance](self, "editDistance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("editDistance"));

  -[USOMatchInfo maxAliasCount](self, "maxAliasCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("maxAliasCount"));

  -[USOMatchInfo matchedAliasCount](self, "matchedAliasCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("matchedAliasCount"));

  -[USOMatchInfo matchedAliasTypes](self, "matchedAliasTypes");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("matchedAliasTypes"));

}

- (unsigned)matchSignalBitSet
{
  return self->_matchSignalBitSet;
}

- (void)setMatchSignalBitSet:(unsigned int)a3
{
  self->_matchSignalBitSet = a3;
}

- (NSNumber)matchScore
{
  return self->_matchScore;
}

- (void)setMatchScore:(id)a3
{
  objc_storeStrong((id *)&self->_matchScore, a3);
}

- (NSNumber)maxTokenCount
{
  return self->_maxTokenCount;
}

- (void)setMaxTokenCount:(id)a3
{
  objc_storeStrong((id *)&self->_maxTokenCount, a3);
}

- (NSNumber)matchedTokenCount
{
  return self->_matchedTokenCount;
}

- (void)setMatchedTokenCount:(id)a3
{
  objc_storeStrong((id *)&self->_matchedTokenCount, a3);
}

- (NSNumber)maxStopWordCount
{
  return self->_maxStopWordCount;
}

- (void)setMaxStopWordCount:(id)a3
{
  objc_storeStrong((id *)&self->_maxStopWordCount, a3);
}

- (NSNumber)matchedStopWordCount
{
  return self->_matchedStopWordCount;
}

- (void)setMatchedStopWordCount:(id)a3
{
  objc_storeStrong((id *)&self->_matchedStopWordCount, a3);
}

- (NSNumber)editDistance
{
  return self->_editDistance;
}

- (void)setEditDistance:(id)a3
{
  objc_storeStrong((id *)&self->_editDistance, a3);
}

- (NSNumber)maxAliasCount
{
  return self->_maxAliasCount;
}

- (void)setMaxAliasCount:(id)a3
{
  objc_storeStrong((id *)&self->_maxAliasCount, a3);
}

- (NSNumber)matchedAliasCount
{
  return self->_matchedAliasCount;
}

- (void)setMatchedAliasCount:(id)a3
{
  objc_storeStrong((id *)&self->_matchedAliasCount, a3);
}

- (NSMutableArray)matchedAliasTypes
{
  return self->_matchedAliasTypes;
}

- (void)setMatchedAliasTypes:(id)a3
{
  objc_storeStrong((id *)&self->_matchedAliasTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedAliasTypes, 0);
  objc_storeStrong((id *)&self->_matchedAliasCount, 0);
  objc_storeStrong((id *)&self->_maxAliasCount, 0);
  objc_storeStrong((id *)&self->_editDistance, 0);
  objc_storeStrong((id *)&self->_matchedStopWordCount, 0);
  objc_storeStrong((id *)&self->_maxStopWordCount, 0);
  objc_storeStrong((id *)&self->_matchedTokenCount, 0);
  objc_storeStrong((id *)&self->_maxTokenCount, 0);
  objc_storeStrong((id *)&self->_matchScore, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
