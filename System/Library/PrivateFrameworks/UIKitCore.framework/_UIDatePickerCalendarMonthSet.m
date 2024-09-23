@implementation _UIDatePickerCalendarMonthSet

- (_UIDatePickerCalendarMonthSet)initWithCalendar:(id)a3 rangeLength:(unint64_t)a4
{
  id v8;
  _UIDatePickerCalendarMonthSet *v9;
  _UIDatePickerCalendarMonthSet *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (a4)
  {
    if ((a4 & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarMonthSet.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rangeLength > 0"));

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarMonthSet.m"), 34, CFSTR("length needs to be an odd number."));

LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)_UIDatePickerCalendarMonthSet;
  v9 = -[_UIDatePickerCalendarMonthSet init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendar, a3);
    v10->_rangeLength = a4;
    -[_UIDatePickerCalendarMonthSet _clearLoadedData](v10, "_clearLoadedData");
  }

  return v10;
}

- (void)_clearLoadedData
{
  _UIDatePickerCalendarMonth *referenceMonth;
  NSMutableIndexSet *v4;
  NSMutableIndexSet *loadedMonthOffsets;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *loadedMonths;

  referenceMonth = self->_referenceMonth;
  self->_referenceMonth = 0;

  v4 = (NSMutableIndexSet *)objc_opt_new();
  loadedMonthOffsets = self->_loadedMonthOffsets;
  self->_loadedMonthOffsets = v4;

  v6 = (NSMutableOrderedSet *)objc_opt_new();
  loadedMonths = self->_loadedMonths;
  self->_loadedMonths = v6;

}

- (void)_ensureReferenceMonthWithFallbackMonth:(id)a3
{
  id v5;
  _UIDatePickerCalendarMonth **p_referenceMonth;
  _UIDatePickerCalendarMonth *referenceMonth;
  id v8;

  v5 = a3;
  referenceMonth = self->_referenceMonth;
  p_referenceMonth = &self->_referenceMonth;
  if (!referenceMonth)
  {
    v8 = v5;
    objc_storeStrong((id *)p_referenceMonth, a3);
    v5 = v8;
  }

}

- (id)_monthAtOffset:(int64_t)a3
{
  _UIDatePickerCalendarMonth *v5;
  NSCalendar *calendar;
  _UIDatePickerCalendarMonth *referenceMonth;
  NSCalendar *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIDatePickerCalendarMonth *v12;
  void *v14;

  if (!self->_referenceMonth)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarMonthSet.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_referenceMonth"));

    if (a3)
      goto LABEL_3;
LABEL_8:
    v5 = self->_referenceMonth;
    goto LABEL_9;
  }
  if (!a3)
    goto LABEL_8;
LABEL_3:
  if ((a3 & 0x8000000000000000) == 0
    && -[NSMutableIndexSet containsIndex:](self->_loadedMonthOffsets, "containsIndex:", a3))
  {
    -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_loadedMonths, "objectAtIndexedSubscript:", -[NSMutableIndexSet countOfIndexesInRange:](self->_loadedMonthOffsets, "countOfIndexesInRange:", 0, a3));
    v5 = (_UIDatePickerCalendarMonth *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v12 = v5;
    return v12;
  }
  calendar = self->_calendar;
  referenceMonth = self->_referenceMonth;
  v8 = calendar;
  -[_UIDatePickerCalendarDateComponent date](referenceMonth, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setMonth:", a3);
  -[NSCalendar dateByAddingComponents:toDate:options:](v8, "dateByAddingComponents:toDate:options:", v10, v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UIDatePickerCalendarDateComponent initWithDate:calendar:]([_UIDatePickerCalendarMonth alloc], "initWithDate:calendar:", v11, v8);

  return v12;
}

- (__UISignedRange)_offsetRangeForMonth:(id)a3
{
  id v4;
  _UIDatePickerCalendarMonth *referenceMonth;
  NSCalendar *v6;
  _UIDatePickerCalendarMonth *v7;
  _UIDatePickerCalendarMonth *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t rangeLength;
  int64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __UISignedRange result;

  v4 = a3;
  -[_UIDatePickerCalendarMonthSet _ensureReferenceMonthWithFallbackMonth:](self, "_ensureReferenceMonthWithFallbackMonth:", v4);
  referenceMonth = self->_referenceMonth;
  v6 = self->_calendar;
  v7 = (_UIDatePickerCalendarMonth *)v4;
  v8 = referenceMonth;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _offsetForMonth(NSCalendar * _Nonnull __strong, _UIDatePickerCalendarMonth * _Nonnull __strong, _UIDatePickerCalendarMonth * _Nonnull __strong)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_UIDatePickerCalendarMonthSet.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("month"));

    if (v8)
      goto LABEL_4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _offsetForMonth(NSCalendar * _Nonnull __strong, _UIDatePickerCalendarMonth * _Nonnull __strong, _UIDatePickerCalendarMonth * _Nonnull __strong)");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("_UIDatePickerCalendarMonthSet.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("calendar"));

  if (!v7)
    goto LABEL_9;
LABEL_3:
  if (v8)
    goto LABEL_4;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _offsetForMonth(NSCalendar * _Nonnull __strong, _UIDatePickerCalendarMonth * _Nonnull __strong, _UIDatePickerCalendarMonth * _Nonnull __strong)");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_UIDatePickerCalendarMonthSet.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("referenceMonth"));

LABEL_4:
  if (v8 == v7)
  {
    v12 = 0;
  }
  else
  {
    -[_UIDatePickerCalendarDateComponent date](v8, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerCalendarDateComponent date](v7, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar components:fromDate:toDate:options:](v6, "components:fromDate:toDate:options:", 8, v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "month");
  }

  rangeLength = self->_rangeLength;
  v14 = v12 - (rangeLength >> 1);
  v15 = rangeLength;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (unint64_t)_shiftReferenceMonthToFitOffsetMonthsIfNecessary:(__UISignedRange)a3
{
  int64_t var0;
  unint64_t v5;
  void *v7;
  _UIDatePickerCalendarMonth *v8;
  _UIDatePickerCalendarMonth *referenceMonth;
  _UIDatePickerCalendarMonth *v10;

  var0 = a3.var0;
  if (!self->_referenceMonth)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.var0, a3.var1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarMonthSet.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_referenceMonth"));

    if ((var0 & 0x8000000000000000) == 0)
      return 0;
LABEL_5:
    v5 = -var0;
    -[_UIDatePickerCalendarMonthSet _monthAtOffset:](self, "_monthAtOffset:", var0, a3.var1);
    v8 = (_UIDatePickerCalendarMonth *)objc_claimAutoreleasedReturnValue();
    referenceMonth = self->_referenceMonth;
    self->_referenceMonth = v8;
    v10 = v8;

    -[NSMutableIndexSet shiftIndexesStartingAtIndex:by:](self->_loadedMonthOffsets, "shiftIndexesStartingAtIndex:by:", 0, v5);
    return v5;
  }
  if (a3.var0 < 0)
    goto LABEL_5;
  return 0;
}

- (_NSRange)_loadOffsetRange:(__UISignedRange)a3
{
  unint64_t var1;
  int64_t var0;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(_QWORD *, uint64_t, uint64_t);
  void *v32;
  _UIDatePickerCalendarMonthSet *v33;
  id v34;
  id v35;
  uint64_t *v36;
  SEL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  _NSRange result;

  var1 = a3.var1;
  var0 = a3.var0;
  if (!self->_referenceMonth)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarMonthSet.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_referenceMonth"));

  }
  v7 = -[_UIDatePickerCalendarMonthSet _shiftReferenceMonthToFitOffsetMonthsIfNecessary:](self, "_shiftReferenceMonthToFitOffsetMonthsIfNecessary:", var0, var1)+ var0;
  if (v7 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarMonthSet.m"), 137, CFSTR("After adjusting the reference month, the requested range should no longer be negative."));

  }
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v7, var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "removeIndexes:", self->_loadedMonthOffsets);
  v38 = 0;
  v39 = &v38;
  v40 = 0x3010000000;
  v41 = &unk_18685B0AF;
  v42 = xmmword_186679030;
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __50___UIDatePickerCalendarMonthSet__loadOffsetRange___block_invoke;
  v32 = &unk_1E16B8310;
  v36 = &v38;
  v37 = a2;
  v33 = self;
  v10 = v8;
  v34 = v10;
  v11 = v9;
  v35 = v11;
  objc_msgSend(v11, "enumerateRangesUsingBlock:", &v29);
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (v39[4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    v14 = -[NSMutableOrderedSet count](self->_loadedMonths, "count");
    v15 = -[NSMutableIndexSet countOfIndexesInRange:](self->_loadedMonthOffsets, "countOfIndexesInRange:", 0, v39[4]);
    v12 = v15;
    v16 = v39[4];
    v13 = v39[5];
    if (v16 >= v16 + v13)
    {
      v19 = v39[5];
    }
    else
    {
      v17 = v15;
      do
      {
        -[_UIDatePickerCalendarMonthSet _monthAtOffset:](self, "_monthAtOffset:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableOrderedSet insertObject:atIndex:](self->_loadedMonths, "insertObject:atIndex:", v18, v17++);

        ++v16;
        v19 = v39[5];
      }
      while (v16 < v19 + v39[4]);
      v16 = v39[4];
    }
    -[NSMutableIndexSet addIndexesInRange:](self->_loadedMonthOffsets, "addIndexesInRange:", v16, v19);
    v20 = -[NSMutableOrderedSet count](self->_loadedMonths, "count");
    if (v20 != v39[5] + v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[NSMutableOrderedSet count](self->_loadedMonths, "count");
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarMonthSet.m"), 173, CFSTR("Invalid update: invalid number of loaded months. The number of loaded months after the update (%lu) must be equal to the number of loaded months before the update (%lu) plus the number of months inserted (%lu)."), v27, v14, v39[5], v29, v30, v31, v32, v33, v34);

    }
    v21 = -[NSMutableOrderedSet count](self->_loadedMonths, "count");
    if (v21 != -[NSMutableIndexSet count](self->_loadedMonthOffsets, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarMonthSet.m"), 174, CFSTR("Internal inconsistency: the number of loaded months (%lu) must be equal to the number of stored month offsets (%lu)."), -[NSMutableOrderedSet count](self->_loadedMonths, "count"), -[NSMutableIndexSet count](self->_loadedMonthOffsets, "count"));

    }
  }

  _Block_object_dispose(&v38, 8);
  v22 = v12;
  v23 = v13;
  result.length = v23;
  result.location = v22;
  return result;
}

- (void)reloadWithMonthsAroundMonth:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIDatePickerCalendarMonthSet _clearLoadedData](self, "_clearLoadedData");
  -[_UIDatePickerCalendarMonthSet insertMonthsAroundMonth:loadedIndexRange:](self, "insertMonthsAroundMonth:loadedIndexRange:", v4, 0);

}

- (void)insertMonthsAroundMonth:(id)a3 loadedIndexRange:(_NSRange *)a4
{
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;

  v6 = -[_UIDatePickerCalendarMonthSet _offsetRangeForMonth:](self, "_offsetRangeForMonth:", a3);
  v8 = -[_UIDatePickerCalendarMonthSet _loadOffsetRange:](self, "_loadOffsetRange:", v6, v7);
  if (a4)
  {
    a4->location = v8;
    a4->length = v9;
  }
}

- (id)loadedMonths
{
  return (id)-[NSMutableOrderedSet array](self->_loadedMonths, "array");
}

- (id)monthAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableOrderedSet objectAtIndex:](self->_loadedMonths, "objectAtIndex:", a3);
}

- (unint64_t)indexOfMonth:(id)a3
{
  return -[NSMutableOrderedSet indexOfObject:](self->_loadedMonths, "indexOfObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedMonths, 0);
  objc_storeStrong((id *)&self->_loadedMonthOffsets, 0);
  objc_storeStrong((id *)&self->_referenceMonth, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
