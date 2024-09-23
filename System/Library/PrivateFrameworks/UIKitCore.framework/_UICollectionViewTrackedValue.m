@implementation _UICollectionViewTrackedValue

- (_UICollectionViewTrackedValue)init
{
  _UICollectionViewTrackedValue *v2;
  _UICollectionViewTrackedValue *v3;
  void *v4;
  double v5;
  double v6;
  int64_t v7;
  _UICollectionViewTrackedValueItem *v8;
  NSArray *values;
  uint64_t v10;
  NSArray *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UICollectionViewTrackedValue;
  v2 = -[_UICollectionViewTrackedValue init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isAccumulating = 1;
    v2->_trackedValue = 0.0;
    *(_OWORD *)&v2->_valuesCount = xmmword_186679F50;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = v5;

    if (v3->_valuesCount >= 1)
    {
      v7 = 0;
      do
      {
        v8 = objc_alloc_init(_UICollectionViewTrackedValueItem);
        -[_UICollectionViewTrackedValueItem setValue:](v8, "setValue:", 0.0);
        -[_UICollectionViewTrackedValueItem setTimeStamp:](v8, "setTimeStamp:", v6);
        values = v3->_values;
        if (values)
          -[NSArray arrayByAddingObject:](values, "arrayByAddingObject:", v8);
        else
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v3->_values;
        v3->_values = (NSArray *)v10;

        ++v7;
      }
      while (v7 < v3->_valuesCount);
    }
  }
  return v3;
}

- (void)addValue:(double)a3
{
  int64_t valuesCount;
  int64_t v6;
  NSArray *values;
  void *v8;
  id v9;

  if (self->_isAccumulating)
  {
    valuesCount = self->_valuesCount;
    v6 = self->_currentIndex + 1;
    values = self->_values;
    self->_currentIndex = v6 % valuesCount;
    -[NSArray objectAtIndex:](values, "objectAtIndex:");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    self->_trackedValue = a3;
    objc_msgSend(v9, "setValue:", a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v9, "setTimeStamp:");

  }
}

- (double)speed
{
  int64_t currentIndex;
  int64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  currentIndex = self->_currentIndex;
  if (currentIndex <= 0)
    currentIndex = self->_valuesCount;
  v4 = currentIndex - 1;
  -[NSArray objectAtIndex:](self->_values, "objectAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_values, "objectAtIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeStamp");
  v8 = v7;
  objc_msgSend(v6, "timeStamp");
  v9 = 0.0;
  if (v8 != v10)
  {
    objc_msgSend(v5, "value");
    v12 = v11;
    objc_msgSend(v6, "value");
    v14 = v12 - v13;
    objc_msgSend(v5, "timeStamp");
    v16 = v15;
    objc_msgSend(v6, "timeStamp");
    v9 = v14 / (v16 / v17);
  }

  return v9;
}

- (double)trackedValue
{
  return self->_trackedValue;
}

- (BOOL)isAccumulating
{
  return self->_isAccumulating;
}

- (void)setIsAccumulating:(BOOL)a3
{
  self->_isAccumulating = a3;
}

- (void)setTrackedValue:(double)a3
{
  self->_trackedValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
