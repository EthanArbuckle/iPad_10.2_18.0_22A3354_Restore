@implementation PKCacheScoreItem

- (PKCacheScoreItem)init
{
  PKCacheScoreItem *v2;
  uint64_t v3;
  NSDate *insertDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKCacheScoreItem;
  v2 = -[PKCacheScoreItem init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    insertDate = v2->_insertDate;
    v2->_insertDate = (NSDate *)v3;

  }
  return v2;
}

- (BOOL)hasExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[NSDate dateByAddingTimeInterval:](self->_insertDate, "dateByAddingTimeInterval:", 10368000.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) == -1;

  return v4;
}

- (BOOL)isNewerThan:(id)a3
{
  return -[NSDate compare:](self->_insertDate, "compare:", *((_QWORD *)a3 + 1)) != NSOrderedAscending;
}

- (PKCacheScoreItem)initWithCoder:(id)a3
{
  id v4;
  PKCacheScoreItem *v5;
  uint64_t v6;
  NSDate *insertDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCacheScoreItem;
  v5 = -[PKCacheScoreItem init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
    v6 = objc_claimAutoreleasedReturnValue();
    insertDate = v5->_insertDate;
    v5->_insertDate = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_insertDate, CFSTR("d"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertDate, 0);
}

@end
