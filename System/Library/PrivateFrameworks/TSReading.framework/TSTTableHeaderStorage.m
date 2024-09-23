@implementation TSTTableHeaderStorage

- (TSTTableHeaderStorage)initWithOwner:(id)a3
{
  TSTTableHeaderStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTTableHeaderStorage;
  v4 = -[TSPContainedObject initWithOwner:](&v6, sel_initWithOwner_);
  if (v4)
    v4->mBuckets[0] = -[TSTTableHeaderStorageBucket initWithContext:]([TSTTableHeaderStorageBucket alloc], "initWithContext:", objc_msgSend(a3, "context"));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mBuckets[0] = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTTableHeaderStorage;
  -[TSTTableHeaderStorage dealloc](&v3, sel_dealloc);
}

- (id)headerForKey:(unsigned int)a3 willModify:(BOOL)a4
{
  return -[TSTTableHeaderStorageBucket headerForKey:willModify:](self->mBuckets[0], "headerForKey:willModify:", *(_QWORD *)&a3, a4);
}

- (id)headerForKey:(unsigned int)a3 willModify:(BOOL)a4 createIfNotThere:(BOOL)a5
{
  return -[TSTTableHeaderStorageBucket headerForKey:willModify:createIfNotThere:](self->mBuckets[0], "headerForKey:willModify:createIfNotThere:", *(_QWORD *)&a3, a4, a5);
}

- (void)setHeader:(id)a3 forKey:(unsigned int)a4
{
  -[TSTTableHeaderStorageBucket setHeader:forKey:](self->mBuckets[0], "setHeader:forKey:", a3, *(_QWORD *)&a4);
}

- (void)removeHeaderForKey:(unsigned int)a3
{
  -[TSTTableHeaderStorageBucket removeHeaderForKey:](self->mBuckets[0], "removeHeaderForKey:", *(_QWORD *)&a3);
}

- (void)removeAllHeaders
{
  -[TSTTableHeaderStorageBucket removeAllHeaders](self->mBuckets[0], "removeAllHeaders");
}

- (void)makeHeadersPerformSelector:(SEL)a3 willModify:(BOOL)a4
{
  -[TSTTableHeaderStorageBucket makeHeadersPerformSelector:willModify:](self->mBuckets[0], "makeHeadersPerformSelector:willModify:", a3, a4);
}

- (void)applyFunction:(void *)a3 withState:(void *)a4 willModify:(BOOL)a5
{
  -[TSTTableHeaderStorageBucket applyFunction:withState:willModify:](self->mBuckets[0], "applyFunction:withState:willModify:", a3, a4, a5);
}

- (void)shiftKeysAtIndex:(unsigned int)a3 amount:(int)a4
{
  -[TSTTableHeaderStorageBucket shiftKeysAtIndex:amount:](self->mBuckets[0], "shiftKeysAtIndex:amount:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (int64_t)count
{
  return -[TSTTableHeaderStorageBucket count](self->mBuckets[0], "count");
}

- (unsigned)minKey
{
  return -[TSTTableHeaderStorageBucket minKey](self->mBuckets[0], "minKey");
}

- (unsigned)maxKey
{
  return -[TSTTableHeaderStorageBucket maxKey](self->mBuckets[0], "maxKey");
}

- (unsigned)upperBound:(unsigned int)a3
{
  return -[TSTTableHeaderStorageBucket upperBound:](self->mBuckets[0], "upperBound:", *(_QWORD *)&a3);
}

- (unsigned)lowerBound:(unsigned int)a3
{
  return -[TSTTableHeaderStorageBucket lowerBound:](self->mBuckets[0], "lowerBound:", *(_QWORD *)&a3);
}

@end
