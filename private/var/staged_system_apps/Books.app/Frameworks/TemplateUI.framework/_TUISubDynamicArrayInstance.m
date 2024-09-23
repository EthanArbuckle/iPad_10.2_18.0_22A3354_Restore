@implementation _TUISubDynamicArrayInstance

- (unint64_t)countForGeneration:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TUISubDynamicArrayInstance;
  v4 = -[_TUIDynamicArrayInstance countForGeneration:](&v6, "countForGeneration:", a3);
  return TUIIndexMapperComputeCount((unint64_t)v4, self->_start, self->_end);
}

- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  int64_t start;
  uint64_t v12;
  objc_super v13;
  objc_super v14;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = a5;
  start = self->_start;
  if (start < 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)_TUISubDynamicArrayInstance;
    start += -[_TUIDynamicArrayInstance countForGeneration:](&v14, "countForGeneration:", v9);
  }
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v12 = start + location;
  v13.receiver = self;
  v13.super_class = (Class)_TUISubDynamicArrayInstance;
  -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](&v13, "fetchDataForRange:generation:block:", v12, length, v9, v10);

}

- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t start;
  id v12;
  objc_super v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  start = self->_start;
  if (start < 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)_TUISubDynamicArrayInstance;
    start += -[_TUIDynamicArrayInstance countForGeneration:](&v14, "countForGeneration:", v9);
  }
  v12 = objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v12, "shiftIndexesStartingAtIndex:by:", 0, start);
  v13.receiver = self;
  v13.super_class = (Class)_TUISubDynamicArrayInstance;
  -[_TUIDynamicArrayInstance fetchDataForIndexes:generation:block:](&v13, "fetchDataForIndexes:generation:block:", v12, v9, v10);

}

- (int64_t)start
{
  return self->_start;
}

- (void)setStart:(int64_t)a3
{
  self->_start = a3;
}

- (int64_t)end
{
  return self->_end;
}

- (void)setEnd:(int64_t)a3
{
  self->_end = a3;
}

@end
