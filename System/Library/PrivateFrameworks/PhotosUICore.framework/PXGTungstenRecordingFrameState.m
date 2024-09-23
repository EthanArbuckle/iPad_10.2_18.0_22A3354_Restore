@implementation PXGTungstenRecordingFrameState

- (PXGTungstenRecordingFrameState)init
{
  PXGTungstenRecordingFrameState *v2;
  uint64_t v3;
  NSMutableIndexSet *spriteIndexes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGTungstenRecordingFrameState;
  v2 = -[PXGTungstenRecordingFrameState init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v3 = objc_claimAutoreleasedReturnValue();
    spriteIndexes = v2->_spriteIndexes;
    v2->_spriteIndexes = (NSMutableIndexSet *)v3;

  }
  return v2;
}

- (void)addRecordedSpriteIndex:(unsigned int)a3
{
  -[NSMutableIndexSet addIndex:](self->_spriteIndexes, "addIndex:", a3);
}

- (void)addRecordedSpriteIndexes:(id)a3
{
  -[NSMutableIndexSet addIndexes:](self->_spriteIndexes, "addIndexes:", a3);
}

- (NSIndexSet)recordedSpriteIndexes
{
  return (NSIndexSet *)self->_spriteIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteIndexes, 0);
}

@end
