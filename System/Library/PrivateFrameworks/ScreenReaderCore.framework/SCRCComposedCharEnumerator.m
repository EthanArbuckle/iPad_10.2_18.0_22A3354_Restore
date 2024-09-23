@implementation SCRCComposedCharEnumerator

- (SCRCComposedCharEnumerator)initWithString:(id)a3
{
  id v5;
  SCRCComposedCharEnumerator *v6;
  SCRCComposedCharEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCRCComposedCharEnumerator;
  v6 = -[SCRCComposedCharEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_string, a3);

  return v7;
}

- (id)nextObject
{
  void *v2;
  uint64_t v4;

  if (!self->_done)
  {
    if (self->_indexOfCurrentComposedCharacter < -[NSString length](self->_string, "length"))
    {
      -[NSString scrc_composedCharacterAtIndex:](self->_string, "scrc_composedCharacterAtIndex:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v2, "originalLength");
      if (v4)
      {
        self->_indexOfCurrentComposedCharacter += v4;
        return v2;
      }

    }
    v2 = 0;
    self->_done = 1;
    return v2;
  }
  v2 = 0;
  return v2;
}

- (id)allObjects
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SCRCComposedCharEnumerator nextObject](self, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5);
      -[SCRCComposedCharEnumerator nextObject](self, "nextObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  self->_done = 0;
  self->_indexOfCurrentComposedCharacter = 0;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
