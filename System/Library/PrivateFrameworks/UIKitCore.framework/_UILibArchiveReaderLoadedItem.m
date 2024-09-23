@implementation _UILibArchiveReaderLoadedItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_UILibArchiveReaderLoadedItem;
  -[_UIArchiveItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ seq = %d"), v4, self->_sequenceIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)sequenceIndex
{
  return self->_sequenceIndex;
}

- (void)setSequenceIndex:(int64_t)a3
{
  self->_sequenceIndex = a3;
}

@end
