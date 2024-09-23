@implementation UIDictationStreamingOperation

- (void)start
{
  void *v3;
  void *v4;
  objc_super v5;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPerformingStreamingEditingOperation:", 1);

  v5.receiver = self;
  v5.super_class = (Class)UIDictationStreamingOperation;
  -[UIDictationStreamingOperation start](&v5, sel_start);
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPerformingStreamingEditingOperation:", 0);

}

- (int64_t)selectionChangeDelta
{
  return self->_selectionChangeDelta;
}

- (void)setSelectionChangeDelta:(int64_t)a3
{
  self->_selectionChangeDelta = a3;
}

@end
