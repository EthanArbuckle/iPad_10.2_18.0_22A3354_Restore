@implementation PLDuplicateDetectorSortKey

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)sortKey:(id)a3 reverse:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  PLDuplicateDetectorSortKey *v8;
  void *v10;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDuplicateDetectorPostProcessing.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v8 = objc_alloc_init(PLDuplicateDetectorSortKey);
  -[PLDuplicateDetectorSortKey setKey:](v8, "setKey:", v7);
  -[PLDuplicateDetectorSortKey setReverse:](v8, "setReverse:", v4);

  return v8;
}

@end
