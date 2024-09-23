@implementation TUIIndexMapper

- (TUIIndexMapper)initWithCount:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIIndexMapper;
  if (-[TUIIndexMapper init](&v4, "init"))
    operator new();
  return 0;
}

- (id)changeLog
{
  return 0;
}

- (void)dealloc
{
  void *mapper;
  objc_super v4;

  mapper = self->_mapper;
  if (mapper)
  {
    sub_997F8((uint64_t)mapper);
    operator delete();
  }
  v4.receiver = self;
  v4.super_class = (Class)TUIIndexMapper;
  -[TUIIndexMapper dealloc](&v4, "dealloc");
}

- (unint64_t)count
{
  _QWORD *mapper;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  BOOL v7;
  unint64_t v8;

  mapper = self->_mapper;
  v3 = mapper[6];
  v4 = (v3 & ((uint64_t)mapper[9] >> 63)) + mapper[9];
  v5 = mapper[10] + (v3 & ((uint64_t)mapper[10] >> 63));
  if (v4 >= v3)
    v4 = v3;
  if (v5 + 1 < v3)
    v6 = v5 + 1;
  else
    v6 = v3;
  v7 = v6 <= v4;
  v8 = v6 - v4;
  if (v7)
    return 0;
  else
    return v8;
}

- (unint64_t)oldCount
{
  _QWORD *mapper;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  BOOL v7;
  unint64_t v8;

  mapper = self->_mapper;
  v3 = mapper[7];
  v4 = (v3 & ((uint64_t)mapper[9] >> 63)) + mapper[9];
  v5 = mapper[10] + (v3 & ((uint64_t)mapper[10] >> 63));
  if (v4 >= v3)
    v4 = v3;
  if (v5 + 1 < v3)
    v6 = v5 + 1;
  else
    v6 = v3;
  v7 = v6 <= v4;
  v8 = v6 - v4;
  if (v7)
    return 0;
  else
    return v8;
}

- (void)deleteAtIndex:(unint64_t)a3
{
  _QWORD *mapper;

  mapper = self->_mapper;
  sub_9989C((uint64_t)mapper, a3, 1, 0);
  --mapper[6];
}

- (void)insertAtIndex:(unint64_t)a3
{
  _QWORD *mapper;

  mapper = self->_mapper;
  sub_9A5EC(mapper, a3, 1);
  ++mapper[6];
}

- (void)updateAtIndex:(unint64_t)a3
{
  sub_9989C((uint64_t)self->_mapper, a3, 1, 1);
}

- (void)moveFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  sub_98400((uint64_t **)self->_mapper, a3, a4);
}

- (unint64_t)mapFromIndex:(unint64_t)a3
{
  return sub_9A9D8((uint64_t)self->_mapper, a3, 0, 0);
}

- (unint64_t)mapToIndex:(unint64_t)a3
{
  return sub_984D4((_QWORD *)self->_mapper, a3, 0);
}

- (id)insertedIndexes
{
  return sub_9855C((uint64_t)self->_mapper);
}

- (id)updatedIndexes
{
  return sub_98634((uint64_t)self->_mapper);
}

- (id)fetchIndexes
{
  return sub_98714((uint64_t)self->_mapper);
}

- (void)trimWithStart:(int64_t)a3 end:(int64_t)a4
{
  _QWORD *mapper;

  mapper = self->_mapper;
  mapper[9] = a3;
  mapper[10] = a4;
  sub_9AA58(mapper, a3, a4);
  sub_9ABF0(mapper, a3, a4);
}

- (void)computeUpdatesWithBlock:(id)a3
{
  sub_9884C((_QWORD *)self->_mapper, a3);
}

- (void)dump
{
  sub_98DD0((__CFString *)self->_mapper);
}

@end
