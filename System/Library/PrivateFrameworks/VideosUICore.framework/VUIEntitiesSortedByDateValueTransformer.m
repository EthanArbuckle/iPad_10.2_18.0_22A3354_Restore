@implementation VUIEntitiesSortedByDateValueTransformer

- (VUIEntitiesSortedByDateValueTransformer)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VUIEntitiesSortedByDateValueTransformer)initWithDateForEntityBlock:(id)a3
{
  id v4;
  VUIEntitiesSortedByDateValueTransformer *v5;
  uint64_t v6;
  id dateForEntityBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIEntitiesSortedByDateValueTransformer;
  v5 = -[VUIEntitiesSortedByDateValueTransformer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dateForEntityBlock = v5->_dateForEntityBlock;
    v5->_dateForEntityBlock = (id)v6;

  }
  return v5;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(_QWORD *, uint64_t, uint64_t, _BYTE *);
  void *v21;
  id v22;
  id v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD v26[4];

  v4 = a3;
  -[VUIEntitiesSortedByDateValueTransformer dateForEntityBlock](self, "dateForEntityBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUISortUtilities descendingDateSortComparatorWithBlock:](VUISortUtilities, "descendingDateSortComparatorWithBlock:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingComparator:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VUIEntitiesSortedByDateValueTransformer maxEntities](self, "maxEntities");
  v9 = objc_msgSend(v7, "count");
  if (v9)
  {
    v10 = v9;
    -[VUIEntitiesSortedByDateValueTransformer earliestDate](self, "earliestDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[VUIEntitiesSortedByDateValueTransformer dateForEntityBlock](self, "dateForEntityBlock");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x2020000000;
      v26[3] = 0;
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __60__VUIEntitiesSortedByDateValueTransformer_transformedValue___block_invoke;
      v21 = &unk_1E9F2C680;
      v13 = v12;
      v23 = v13;
      v24 = v26;
      v25 = v8;
      v22 = v11;
      objc_msgSend(v7, "indexesOfObjectsPassingTest:", &v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectsAtIndexes:", v14, v18, v19, v20, v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(v26, 8);
    }
    else
    {
      if (v8 && v10 > v8)
      {
        objc_msgSend(v7, "subarrayWithRange:", 0, v8);
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = v7;
      }
      v15 = v16;
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

uint64_t __60__VUIEntitiesSortedByDateValueTransformer_transformedValue___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  (*(void (**)(void))(a1[5] + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) >= a1[7])
  {
    v8 = 0;
    *a4 = 1;
  }
  else if (objc_msgSend(v6, "compare:", a1[4]) == 1)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)maxEntities
{
  return self->_maxEntities;
}

- (void)setMaxEntities:(unint64_t)a3
{
  self->_maxEntities = a3;
}

- (NSDate)earliestDate
{
  return self->_earliestDate;
}

- (void)setEarliestDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)dateForEntityBlock
{
  return self->_dateForEntityBlock;
}

- (void)setDateForEntityBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateForEntityBlock, 0);
  objc_storeStrong((id *)&self->_earliestDate, 0);
}

@end
