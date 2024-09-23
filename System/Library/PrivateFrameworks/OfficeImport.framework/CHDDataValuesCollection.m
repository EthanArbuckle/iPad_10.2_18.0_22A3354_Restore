@implementation CHDDataValuesCollection

- (CHDDataValuesCollection)init
{
  CHDDataValuesCollection *v2;
  CHDDataValuesCollection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHDDataValuesCollection;
  v2 = -[CHDDataValuesCollection init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->mContainsStringValue = 0;
    v2->mDataValueCount = 0;
    -[CHDDataValuesCollection setupBufferForValues:](v2, "setupBufferForValues:", 0);
  }
  return v3;
}

- (void)setupBufferForValues:(unint64_t)a3
{
  __CFData *Mutable;

  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  self->mPackedValues = Mutable;
  if (Mutable)
    CFDataIncreaseLength(Mutable, 32 * a3);
}

- (unint64_t)count
{
  return self->mDataValueCount;
}

- (CHDDataValuesCollection)initWithDataPointCount:(unint64_t)a3
{
  CHDDataValuesCollection *v4;
  CHDDataValuesCollection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHDDataValuesCollection;
  v4 = -[CHDDataValuesCollection init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mContainsStringValue = 0;
    v4->mDataValueCount = 0;
    -[CHDDataValuesCollection setupBufferForValues:](v4, "setupBufferForValues:", a3);
  }
  return v5;
}

- (BOOL)addDataPoint:(CHDDataPoint *)a3
{
  UInt8 *MutableBytePtr;
  unint64_t v6;
  unint64_t Length;
  UInt8 *v8;
  unint64_t *v9;

  MutableBytePtr = CFDataGetMutableBytePtr(self->mPackedValues);
  if (MutableBytePtr)
  {
    v6 = 32 * self->mDataValueCount + 32;
    Length = CFDataGetLength(self->mPackedValues);
    v8 = MutableBytePtr;
    if (v6 > Length)
    {
      CFDataIncreaseLength(self->mPackedValues, 32);
      v8 = CFDataGetMutableBytePtr(self->mPackedValues);
    }
    v9 = (unint64_t *)&v8[32 * self->mDataValueCount];
    *v9 = a3->index;
    EDValue::operator=((uint64_t)(v9 + 1), &a3->value.type);
    v9[3] = a3->contentFormatId;
    ++self->mDataValueCount;
    if (!self->mContainsStringValue && EDValue::isStringType(&a3->value))
      self->mContainsStringValue = 1;
  }
  return MutableBytePtr != 0;
}

- (void)finishReading
{
  __CFDictionary *mIndexToDataValueMap;
  __CFDictionary *Mutable;
  char *v5;
  CHDDataPoint *v6;

  mIndexToDataValueMap = self->mIndexToDataValueMap;
  if (mIndexToDataValueMap)
  {
    CFRelease(mIndexToDataValueMap);
    self->mIndexToDataValueMap = 0;
  }
  Mutable = CFDictionaryCreateMutable(0, self->mDataValueCount, 0, 0);
  self->mIndexToDataValueMap = Mutable;
  if (Mutable && self->mDataValueCount)
  {
    v5 = 0;
    do
    {
      v6 = -[CHDDataValuesCollection dataPointAtIndex:](self, "dataPointAtIndex:", v5);
      if (v6)
        CFDictionarySetValue(self->mIndexToDataValueMap, (const void *)v6->index, v5);
      ++v5;
    }
    while ((unint64_t)v5 < self->mDataValueCount);
  }
}

- (CHDDataPoint)dataPointAtIndex:(unint64_t)a3
{
  UInt8 *MutableBytePtr;
  BOOL v6;

  MutableBytePtr = CFDataGetMutableBytePtr(self->mPackedValues);
  if (MutableBytePtr)
    v6 = self->mDataValueCount > a3;
  else
    v6 = 0;
  if (v6)
    return (CHDDataPoint *)&MutableBytePtr[32 * a3];
  else
    return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[CHDDataValuesCollection cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)CHDDataValuesCollection;
  -[CHDDataValuesCollection dealloc](&v3, sel_dealloc);
}

- (void)cleanup
{
  __CFData *mPackedValues;
  UInt8 *MutableBytePtr;
  unint64_t v5;
  EDValue *v6;
  EDValue *v7;
  __CFDictionary *mIndexToDataValueMap;

  mPackedValues = self->mPackedValues;
  if (mPackedValues)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedValues);
    if (self->mDataValueCount)
    {
      v5 = 0;
      v6 = (EDValue *)(MutableBytePtr + 8);
      do
      {
        EDValue::~EDValue(v6);
        ++v5;
        v6 = v7 + 2;
      }
      while (v5 < self->mDataValueCount);
    }
    CFRelease(self->mPackedValues);
    self->mPackedValues = 0;
  }
  mIndexToDataValueMap = self->mIndexToDataValueMap;
  if (mIndexToDataValueMap)
  {
    CFRelease(mIndexToDataValueMap);
    self->mIndexToDataValueMap = 0;
  }
}

- (id)dataValueAtIndex:(unint64_t)a3
{
  CHDDataPoint *v3;
  CHDDataPoint *v4;
  void *v5;

  v3 = -[CHDDataValuesCollection dataPointAtIndex:](self, "dataPointAtIndex:", a3);
  if (v3)
  {
    v4 = v3;
    +[CHDDataValue dataValueWithIndex:value:](CHDDataValue, "dataValueWithIndex:value:", v4->index, &v4->value);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentFormatId:", v4->contentFormatId);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)containsStringValue
{
  return self->mContainsStringValue;
}

- (BOOL)addDataValue:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = -[CHDDataValuesCollection addDataPoint:](self, "addDataPoint:", objc_msgSend(v4, "dataPoint"));
  else
    v6 = 0;

  return v6;
}

- (id)dataValueWithIndex:(unint64_t)a3
{
  CHDDataPoint *v3;
  CHDDataPoint *v4;
  void *v5;

  v3 = -[CHDDataValuesCollection dataPointWithIndex:](self, "dataPointWithIndex:", a3);
  if (v3)
  {
    v4 = v3;
    +[CHDDataValue dataValueWithIndex:value:](CHDDataValue, "dataValueWithIndex:value:", v4->index, &v4->value);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentFormatId:", v4->contentFormatId);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (CHDDataPoint)dataPointWithIndex:(unint64_t)a3
{
  __CFDictionary *mIndexToDataValueMap;
  CHDDataPoint *result;
  uint64_t v7;
  void *value;

  mIndexToDataValueMap = self->mIndexToDataValueMap;
  if (mIndexToDataValueMap)
  {
    value = 0;
    if (CFDictionaryGetValueIfPresent(mIndexToDataValueMap, (const void *)a3, (const void **)&value))
      return -[CHDDataValuesCollection dataPointAtIndex:](self, "dataPointAtIndex:", value);
    return 0;
  }
  if (!self->mDataValueCount)
    return 0;
  v7 = 0;
  while (1)
  {
    result = -[CHDDataValuesCollection dataPointAtIndex:](self, "dataPointAtIndex:", v7);
    if (result)
    {
      if (result->index == a3)
        break;
    }
    if (++v7 >= self->mDataValueCount)
      return 0;
  }
  return result;
}

- (void)resetWithDataPointCount:(unint64_t)a3
{
  if (self->mDataValueCount == a3)
  {
    -[CHDDataValuesCollection cleanup](self, "cleanup");
    -[CHDDataValuesCollection setupBufferForValues:](self, "setupBufferForValues:", a3);
  }
  self->mContainsStringValue = 0;
  self->mDataValueCount = 0;
}

- (id)contentFormatAtIndex:(unint64_t)a3 resources:(id)a4
{
  id v6;
  CHDDataPoint *v7;
  void *v8;

  v6 = a4;
  v7 = -[CHDDataValuesCollection dataPointAtIndex:](self, "dataPointAtIndex:", a3);
  if (v7)
  {
    objc_msgSend(v6, "contentFormats");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectWithKey:", v7->contentFormatId);
    v7 = (CHDDataPoint *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (unint64_t)maxDataPointIndex
{
  unint64_t mDataValueCount;
  unint64_t result;

  mDataValueCount = self->mDataValueCount;
  if (!mDataValueCount)
    return 0;
  result = -[CHDDataValuesCollection dataPointAtIndex:](self, "dataPointAtIndex:", mDataValueCount - 1);
  if (result)
    return *(_QWORD *)result;
  return result;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDDataValuesCollection;
  -[CHDDataValuesCollection description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
