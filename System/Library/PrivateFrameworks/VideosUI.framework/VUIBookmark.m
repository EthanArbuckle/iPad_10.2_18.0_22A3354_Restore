@implementation VUIBookmark

- (VUIBookmark)initWithKey:(id)a3
{
  id v5;
  VUIBookmark *v6;
  VUIBookmark *v7;
  VUIBookmark *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)VUIBookmark;
    v6 = -[VUIBookmark init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_key, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (VUIBookmark)initWithCoder:(id)a3
{
  id v4;
  VUIBookmark *v5;
  uint64_t v6;
  VUIBookmarkKey *key;
  double v8;
  void *v9;
  uint64_t v10;
  NSDate *bookmarkTimestamp;
  objc_super v13;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Coder must allow keyed coding."));
  v13.receiver = self;
  v13.super_class = (Class)VUIBookmark;
  v5 = -[VUIBookmark init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TVSBookmark.Key"));
    v6 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (VUIBookmarkKey *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TVSBookmark.BookmarkTime"));
    v5->_bookmarkTime = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TVSBookmark.BookmarkTimestamp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    bookmarkTimestamp = v5->_bookmarkTimestamp;
    v5->_bookmarkTimestamp = (NSDate *)v10;

    v5->_playCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TVSBookmark.PlayCount"));
    v5->_hasBeenPlayed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TVSBookmark.HasBeenPlayed"));
    v5->_hasBeenRented = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TVSBookmark.HasBeenRented"));
    v5->_isMarkedAsUnwatched = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TVSBookmark.IsMarkedAsUnwatched"));
    v5->_hasFakeTimestamp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TVSBookmark.HasFakeTimestamp"));
  }

  return v5;
}

- (VUIBookmark)init
{
  objc_exception_throw(CFSTR("Don't use this method"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Coder must allow keyed coding."));
  -[VUIBookmark key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("TVSBookmark.Key"));

  -[VUIBookmark bookmarkTime](self, "bookmarkTime");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("TVSBookmark.BookmarkTime"));
  -[VUIBookmark bookmarkTimestamp](self, "bookmarkTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("TVSBookmark.BookmarkTimestamp"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[VUIBookmark playCount](self, "playCount"), CFSTR("TVSBookmark.PlayCount"));
  objc_msgSend(v6, "encodeBool:forKey:", -[VUIBookmark hasBeenPlayed](self, "hasBeenPlayed"), CFSTR("TVSBookmark.HasBeenPlayed"));
  objc_msgSend(v6, "encodeBool:forKey:", -[VUIBookmark hasBeenRented](self, "hasBeenRented"), CFSTR("TVSBookmark.HasBeenRented"));
  objc_msgSend(v6, "encodeBool:forKey:", -[VUIBookmark isMarkedAsUnwatched](self, "isMarkedAsUnwatched"), CFSTR("TVSBookmark.IsMarkedAsUnwatched"));
  objc_msgSend(v6, "encodeBool:forKey:", -[VUIBookmark hasFakeTimestamp](self, "hasFakeTimestamp"), CFSTR("TVSBookmark.HasFakeTimestamp"));

}

- (id)_copyWithResultClass:(Class)a3
{
  uint64_t v4;

  v4 = objc_msgSend([a3 alloc], "initWithKey:", self->_key);
  *(double *)(v4 + 24) = self->_bookmarkTime;
  objc_storeStrong((id *)(v4 + 32), self->_bookmarkTimestamp);
  *(_BYTE *)(v4 + 11) = self->_hasFakeTimestamp;
  *(_QWORD *)(v4 + 40) = self->_playCount;
  *(_BYTE *)(v4 + 8) = self->_hasBeenPlayed;
  *(_BYTE *)(v4 + 9) = self->_hasBeenRented;
  *(_BYTE *)(v4 + 10) = self->_isMarkedAsUnwatched;
  return (id)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (-[VUIBookmark isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    return self;
  else
    return -[VUIBookmark _copyWithResultClass:](self, "_copyWithResultClass:", objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[VUIBookmark _copyWithResultClass:](self, "_copyWithResultClass:", objc_opt_class());
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)VUIBookmark;
  -[VUIBookmark description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: key=[%@], bookmarkTime=%f, playCount=%d, hasBeenPlayed=%d, hasBeenRented=%d, isMarkedAsUnwatched=%d, bookmarkTimestamp=%@"), v4, self->_key, *(_QWORD *)&self->_bookmarkTime, self->_playCount, self->_hasBeenPlayed, self->_hasBeenRented, self->_isMarkedAsUnwatched, self->_bookmarkTimestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setBookmarkTimeWithoutUpdatingTimestamp:(double)a3
{
  self->_bookmarkTime = a3;
}

- (void)_setBookmarkTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkTimestamp, a3);
}

- (void)_setPlayCount:(unint64_t)a3
{
  self->_playCount = a3;
}

- (void)_setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
}

- (void)_setHasBeenRented:(BOOL)a3
{
  self->_hasBeenRented = a3;
}

- (void)_setIsMarkedAsUnwatched:(BOOL)a3
{
  self->_isMarkedAsUnwatched = a3;
}

- (BOOL)hasRemoteData
{
  void *v2;
  BOOL v3;

  -[VUIBookmark bookmarkTimestamp](self, "bookmarkTimestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (VUIBookmarkKey)key
{
  return self->_key;
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (NSDate)bookmarkTimestamp
{
  return self->_bookmarkTimestamp;
}

- (unint64_t)playCount
{
  return self->_playCount;
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (BOOL)hasBeenRented
{
  return self->_hasBeenRented;
}

- (BOOL)isMarkedAsUnwatched
{
  return self->_isMarkedAsUnwatched;
}

- (BOOL)hasFakeTimestamp
{
  return self->_hasFakeTimestamp;
}

- (void)setHasFakeTimestamp:(BOOL)a3
{
  self->_hasFakeTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkTimestamp, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
