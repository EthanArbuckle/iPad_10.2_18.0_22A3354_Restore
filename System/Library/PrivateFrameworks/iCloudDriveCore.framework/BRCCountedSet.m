@implementation BRCCountedSet

- (void)addObject:(id)a3
{
  objc_super v3;

  ++self->_totalCount;
  v3.receiver = self;
  v3.super_class = (Class)BRCCountedSet;
  -[BRCCountedSet addObject:](&v3, sel_addObject_, a3);
}

- (void)removeObject:(id)a3
{
  id v4;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRCCountedSet;
  v4 = a3;
  if (-[BRCCountedSet countForObject:](&v6, sel_countForObject_, v4))
    --self->_totalCount;
  v5.receiver = self;
  v5.super_class = (Class)BRCCountedSet;
  -[BRCCountedSet removeObject:](&v5, sel_removeObject_, v4);

}

- (unint64_t)totalCount
{
  return self->_totalCount;
}

@end
