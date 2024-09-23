@implementation _PASLPDictionaryEnumerator

- (_PASLPDictionaryEnumerator)initWithLazyPlistReader:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  _PASLPDictionaryEnumerator *v9;
  _PASLPDictionaryEnumerator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PASLPDictionaryEnumerator;
  v9 = -[_PASLPDictionaryEnumerator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reader, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (id)nextObject
{
  void *v3;
  _PASLPDictionaryContext *context;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AFDC98](self, a2);
  context = self->_context;
  if (context && self->_ofs < context->_count)
  {
    -[_PASLPReaderProtocol keyAtIndex:usingDictionaryContext:](self->_reader, "keyAtIndex:usingDictionaryContext:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ++self->_ofs;
  }
  else
  {
    v5 = 0;
  }
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
