@implementation CHChannelUndoState

- (void)dealloc
{
  objc_super v3;

  ChannelStateDestroy((uint64_t)self->_pOZChannel, 1);
  v3.receiver = self;
  v3.super_class = (Class)CHChannelUndoState;
  -[CHChannelUndoState dealloc](&v3, sel_dealloc);
}

- (CHChannelUndoState)initWithChannel:(id)a3
{
  return -[CHChannelUndoState initWithChannel:flagsOnly:](self, "initWithChannel:flagsOnly:", a3, 0);
}

- (CHChannelUndoState)initWithChannel:(id)a3 flagsOnly:(BOOL)a4
{
  _BOOL4 v4;
  CHChannelUndoState *v6;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CHChannelUndoState;
  v6 = -[CHChannelUndoState init](&v8, sel_init);
  if (v6)
  {
    v6->_pOZChannel = ChannelStateCopy((OZChannelBase *)objc_msgSend(a3, "ozChannel"), v4);
    v6->_flagsOnly = v4;
  }
  return v6;
}

- (void)restoreChannel:(id)a3
{
  objc_msgSend(a3, "_replaceChannel:flagsOnly:", self->_pOZChannel, self->_flagsOnly);
}

- (BOOL)flagsOnly
{
  return self->_flagsOnly;
}

@end
