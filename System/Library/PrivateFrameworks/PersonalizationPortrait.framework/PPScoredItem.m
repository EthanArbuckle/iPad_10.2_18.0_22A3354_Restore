@implementation PPScoredItem

- (PPScoredItem)initWithItem:(id)a3 score:(double)a4 resultPosition:(unsigned __int16)a5 resultCount:(unsigned __int16)a6
{
  id v11;
  PPScoredItem *v12;
  PPScoredItem *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PPScoredItem;
  v12 = -[PPScoredItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_item, a3);
    v13->_score = a4;
    v13->_resultPosition = a5;
    v13->_resultCount = a6;
  }

  return v13;
}

- (PPScoredItem)initWithItem:(id)a3 score:(double)a4
{
  return -[PPScoredItem initWithItem:score:resultPosition:resultCount:](self, "initWithItem:score:resultPosition:resultCount:", a3, 0, 0, a4);
}

- (PPScoredItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  unsigned int v8;
  unsigned __int16 v9;
  unsigned int v10;
  PPScoredItem *v11;

  v4 = a3;
  if (initWithCoder___pasOnceToken4 != -1)
    dispatch_once(&initWithCoder___pasOnceToken4, &__block_literal_global_2638);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder___pasExprOnceResult, CFSTR("item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score")),
        v7 = v6,
        v8 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("rps")),
        HIWORD(v8))
    || (v9 = v8, v10 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("rct")), HIWORD(v10)))
  {
    v11 = 0;
  }
  else
  {
    self = -[PPScoredItem initWithItem:score:resultPosition:resultCount:](self, "initWithItem:score:resultPosition:resultCount:", v5, v9, (unsigned __int16)v10, v7);
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSCopying *item;
  id v5;

  item = self->_item;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", item, CFSTR("item"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("score"), self->_score);
  objc_msgSend(v5, "encodeInt32:forKey:", self->_resultPosition, CFSTR("rps"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_resultCount, CFSTR("rct"));

}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSCopying hash](self->_item, "hash");
  v4 = self->_resultPosition - v3 + 32 * v3;
  return self->_resultCount - v4 + 32 * v4;
}

- (BOOL)isEqualToScoredItem:(id)a3
{
  void *v3;
  void *v4;
  PPScoredItem *v6;
  PPScoredItem *v7;
  NSCopying *item;
  NSCopying *v9;
  int v10;
  BOOL v11;
  int resultPosition;
  int resultCount;
  double score;
  double v15;

  v6 = (PPScoredItem *)a3;
  v7 = v6;
  if (v6 == self)
  {
    v11 = 1;
    goto LABEL_20;
  }
  if (!v6)
  {
    v11 = 0;
    goto LABEL_20;
  }
  item = self->_item;
  v9 = item;
  if (!item)
  {
    -[PPScoredItem item](v6, "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v10 = 0;
      goto LABEL_12;
    }
    v9 = self->_item;
  }
  -[PPScoredItem item](v7, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSCopying isEqual:](v9, "isEqual:", v4))
  {
    v11 = 0;
    goto LABEL_17;
  }
  v10 = 1;
LABEL_12:
  resultPosition = self->_resultPosition;
  if (resultPosition != -[PPScoredItem resultPosition](v7, "resultPosition")
    || (resultCount = self->_resultCount, resultCount != -[PPScoredItem resultCount](v7, "resultCount")))
  {
    v11 = 0;
    if (!v10)
      goto LABEL_18;
    goto LABEL_17;
  }
  score = self->_score;
  -[PPScoredItem score](v7, "score");
  v11 = vabdd_f64(score, v15) < 0.00000001;
  if ((v10 & 1) != 0)
LABEL_17:

LABEL_18:
  if (!item)

LABEL_20:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PPScoredItem *v4;
  BOOL v5;

  v4 = (PPScoredItem *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PPScoredItem isEqualToScoredItem:](self, "isEqualToScoredItem:", v4);
  }

  return v5;
}

- (NSCopying)item
{
  return self->_item;
}

- (double)score
{
  return self->_score;
}

- (unsigned)resultPosition
{
  return self->_resultPosition;
}

- (unsigned)resultCount
{
  return self->_resultCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

void __30__PPScoredItem_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = (void *)MEMORY[0x18D7805AC]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v1);
  v5 = (void *)initWithCoder___pasExprOnceResult;
  initWithCoder___pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
