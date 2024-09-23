@implementation NSIndexPath

- (id)crl_indexPathByPrependingIndex:(unint64_t)a3
{
  NSUInteger v5;
  unint64_t *v6;
  unint64_t *v7;
  void *v8;
  id v10;

  v5 = -[NSIndexPath length](self, "length");
  v6 = (unint64_t *)malloc_type_malloc(8 * (v5 + 1), 0x100004000313F17uLL);
  if (!v6)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSMallocException, CFSTR("Failed to allocate indexBuffer."), 0));
    objc_exception_throw(v10);
  }
  v7 = v6;
  -[NSIndexPath getIndexes:range:](self, "getIndexes:range:", v6 + 1, 0, v5);
  *v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndexes:length:](NSIndexPath, "indexPathWithIndexes:length:", v7, v5 + 1));
  free(v7);
  return v8;
}

@end
