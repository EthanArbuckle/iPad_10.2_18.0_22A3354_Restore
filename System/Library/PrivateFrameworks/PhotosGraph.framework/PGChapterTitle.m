@implementation PGChapterTitle

- (PGChapterTitle)initWithLocalizedTitleString:(id)a3 chapterDateInterval:(id)a4
{
  id v6;
  id v7;
  PGChapterTitle *v8;
  uint64_t v9;
  NSString *localizedTitleString;
  uint64_t v11;
  NSDateInterval *chapterDateInterval;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGChapterTitle;
  v8 = -[PGChapterTitle init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    localizedTitleString = v8->_localizedTitleString;
    v8->_localizedTitleString = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    chapterDateInterval = v8->_chapterDateInterval;
    v8->_chapterDateInterval = (NSDateInterval *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PGChapterTitle *v4;
  uint64_t v5;
  char v6;
  PGChapterTitle *v7;
  NSDateInterval *chapterDateInterval;
  void *v9;
  NSString *localizedTitleString;
  void *v11;

  v4 = (PGChapterTitle *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      chapterDateInterval = self->_chapterDateInterval;
      -[PGChapterTitle chapterDateInterval](v7, "chapterDateInterval");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSDateInterval isEqualToDateInterval:](chapterDateInterval, "isEqualToDateInterval:", v9))
      {
        localizedTitleString = self->_localizedTitleString;
        -[PGChapterTitle localizedTitleString](v7, "localizedTitleString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[NSString isEqualToString:](localizedTitleString, "isEqualToString:", v11);

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PGChapterTitle localizedTitleString](self, "localizedTitleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("title"));

  -[PGChapterTitle chapterDateInterval](self, "chapterDateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("startDate"));

  -[PGChapterTitle chapterDateInterval](self, "chapterDateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("endDate"));

  return v3;
}

- (NSString)localizedTitleString
{
  return self->_localizedTitleString;
}

- (NSDateInterval)chapterDateInterval
{
  return self->_chapterDateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterDateInterval, 0);
  objc_storeStrong((id *)&self->_localizedTitleString, 0);
}

@end
