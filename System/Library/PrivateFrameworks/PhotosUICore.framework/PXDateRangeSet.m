@implementation PXDateRangeSet

- (PXDateRangeSet)init
{
  PXDateRangeSet *v2;
  NSMutableArray *v3;
  NSMutableArray *dateRanges;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXDateRangeSet;
  v2 = -[PXDateRangeSet init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dateRanges = v2->__dateRanges;
    v2->__dateRanges = v3;

  }
  return v2;
}

- (PXDateRangeSet)initWithDateRange:(id)a3
{
  id v4;
  PXDateRangeSet *v5;
  uint64_t v6;
  NSMutableArray *dateRanges;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDateRangeSet;
  v5 = -[PXDateRangeSet init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v4, 0);
    dateRanges = v5->__dateRanges;
    v5->__dateRanges = (NSMutableArray *)v6;

  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PXMutableDateRangeSet *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(PXMutableDateRangeSet);
  -[PXDateRangeSet _dateRanges](self, "_dateRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[PXDateRangeSet set_dateRanges:](v4, "set_dateRanges:", v6);

  return v4;
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[PXDateRangeSet _dateRanges](self, "_dateRanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PXDateRangeSet *v4;
  NSMutableArray *dateRanges;
  char v6;

  v4 = (PXDateRangeSet *)a3;
  if (v4 == self)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  dateRanges = self->__dateRanges;
  if (dateRanges == v4->__dateRanges)
LABEL_5:
    v6 = 1;
  else
    v6 = -[NSMutableArray isEqualToArray:](dateRanges, "isEqualToArray:");
LABEL_7:

  return v6;
}

- (id)dateRanges
{
  void *v2;
  void *v3;

  -[PXDateRangeSet _dateRanges](self, "_dateRanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PXDateRangeSet;
  -[PXDateRangeSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDateRangeSet _dateRanges](self, "_dateRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ dateRanges=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableArray)_dateRanges
{
  return self->__dateRanges;
}

- (void)set_dateRanges:(id)a3
{
  objc_storeStrong((id *)&self->__dateRanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dateRanges, 0);
}

+ (id)dateRangeSetWithDateRange:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDateRange:", v3);

  return v4;
}

+ (id)dateRangeSet
{
  return objc_alloc_init((Class)a1);
}

@end
