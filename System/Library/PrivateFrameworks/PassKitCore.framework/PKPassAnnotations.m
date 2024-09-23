@implementation PKPassAnnotations

- (void)setSortingState:(int64_t)a3
{
  self->_sortingState = a3;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sortingState;
  id v5;

  sortingState = self->_sortingState;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", sortingState, CFSTR("sortingState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_archivedTimestamp, CFSTR("archivedTimestamp"));

}

- (int64_t)sortingState
{
  return self->_sortingState;
}

- (PKPassAnnotations)initWithCoder:(id)a3
{
  id v4;
  PKPassAnnotations *v5;
  uint64_t v6;
  NSDate *archivedTimestamp;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAnnotations;
  v5 = -[PKPassAnnotations init](&v9, sel_init);
  if (v5)
  {
    v5->_sortingState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sortingState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archivedTimestamp"));
    v6 = objc_claimAutoreleasedReturnValue();
    archivedTimestamp = v5->_archivedTimestamp;
    v5->_archivedTimestamp = (NSDate *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassAnnotations *v4;

  v4 = -[PKPassAnnotations init](+[PKPassAnnotations allocWithZone:](PKPassAnnotations, "allocWithZone:", a3), "init");
  v4->_sortingState = self->_sortingState;
  objc_storeStrong((id *)&v4->_archivedTimestamp, self->_archivedTimestamp);
  return v4;
}

- (PKPassAnnotations)initWithDictionary:(id)a3
{
  id v4;
  PKPassAnnotations *v5;
  uint64_t v6;
  NSDate *archivedTimestamp;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAnnotations;
  v5 = -[PKPassAnnotations init](&v9, sel_init);
  if (v5)
  {
    v5->_sortingState = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("sortingState"));
    objc_msgSend(v4, "PKDateForKey:", CFSTR("archivedTimestamp"));
    v6 = objc_claimAutoreleasedReturnValue();
    archivedTimestamp = v5->_archivedTimestamp;
    v5->_archivedTimestamp = (NSDate *)v6;

  }
  return v5;
}

- (PKPassAnnotations)initWithSortingState:(int64_t)a3
{
  PKPassAnnotations *v4;
  PKPassAnnotations *v5;
  uint64_t v6;
  NSDate *archivedTimestamp;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassAnnotations;
  v4 = -[PKPassAnnotations init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_sortingState = a3;
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v6 = objc_claimAutoreleasedReturnValue();
      archivedTimestamp = v5->_archivedTimestamp;
      v5->_archivedTimestamp = (NSDate *)v6;
    }
    else
    {
      archivedTimestamp = v4->_archivedTimestamp;
      v4->_archivedTimestamp = 0;
    }

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t sortingState;
  NSDate *archivedTimestamp;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = a3;
  sortingState = self->_sortingState;
  if (sortingState == objc_msgSend(v4, "sortingState"))
  {
    archivedTimestamp = self->_archivedTimestamp;
    objc_msgSend(v4, "archivedTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (archivedTimestamp && v7)
      v9 = -[NSDate isEqual:](archivedTimestamp, "isEqual:", v7);
    else
      v9 = archivedTimestamp == (NSDate *)v7;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (self->_archivedTimestamp)
  {
    v6[0] = self->_archivedTimestamp;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PKCombinedHash(17, v3);

  }
  else
  {
    v4 = PKCombinedHash(17, 0);
  }
  return self->_sortingState - v4 + 32 * v4;
}

- (NSDate)archivedTimestamp
{
  return self->_archivedTimestamp;
}

- (void)setArchivedTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_archivedTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedTimestamp, 0);
}

@end
