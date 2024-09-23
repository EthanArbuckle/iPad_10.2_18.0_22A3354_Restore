@implementation _PASLPDictionaryContext

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_enumerationCache);
}

- (NSCache)enumerationCache
{
  return (NSCache *)objc_loadWeakRetained((id *)&self->_enumerationCache);
}

- (_PASLPDictionaryContext)initWithStorage:(const unsigned int *)a3 count:(unint64_t)a4
{
  _PASLPDictionaryContext *result;
  void *v9;
  objc_super v10;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLPReaderCommon.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storage"));

  }
  v10.receiver = self;
  v10.super_class = (Class)_PASLPDictionaryContext;
  result = -[_PASLPDictionaryContext init](&v10, sel_init);
  if (result)
  {
    result->_storage = a3;
    result->_count = a4;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_count;
}

- (BOOL)isEqual:(id)a3
{
  _PASLPDictionaryContext *v4;
  _PASLPDictionaryContext *v5;
  _PASLPDictionaryContext *v6;

  v4 = (_PASLPDictionaryContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self)
      LOBYTE(self) = self->_storage == v6->_storage && self->_count == v6->_count;

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (void)setEnumerationCache:(id)a3
{
  objc_storeWeak((id *)&self->_enumerationCache, a3);
}

@end
