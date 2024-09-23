@implementation _UICollectionLayoutFramesQueryOffsets

- (_UICollectionLayoutFramesQueryOffsets)init
{
  objc_super v2;

  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)_UICollectionLayoutFramesQueryOffsets;
    self = -[_UICollectionLayoutFramesQueryOffsets init](&v2, sel_init);
    if (self)
    {
      self->_frameOffset = (CGPoint)*MEMORY[0x1E0C9D538];
      self->_indexOffset = 0;
      self->_supplementaryIndexOffset = 0;
    }
  }
  return self;
}

@end
