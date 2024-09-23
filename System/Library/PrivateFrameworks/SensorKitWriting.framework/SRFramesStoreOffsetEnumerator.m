@implementation SRFramesStoreOffsetEnumerator

- (void)dealloc
{
  objc_super v2;

  self->_framesStore = 0;
  v2.receiver = self;
  v2.super_class = (Class)SRFramesStoreOffsetEnumerator;
  -[SRFramesStoreOffsetEnumerator dealloc](&v2, sel_dealloc);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var0)
    a3->var0 = self->_offset;
  return -[SRFrameStore countByEnumeratingWithState:objects:count:](self->_framesStore, "countByEnumeratingWithState:objects:count:");
}

@end
