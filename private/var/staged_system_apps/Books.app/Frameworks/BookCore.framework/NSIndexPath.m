@implementation NSIndexPath

- (id)im_stringValue
{
  _QWORD *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = malloc_type_malloc(8 * -[NSIndexPath length](self, "length"), 0x100004000313F17uLL);
  -[NSIndexPath getIndexes:](self, "getIndexes:", v3);
  v4 = objc_alloc_init((Class)NSMutableArray);
  if (-[NSIndexPath length](self, "length"))
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v3[v5]));
      objc_msgSend(v4, "addObject:", v6);

      ++v5;
    }
    while (v5 < -[NSIndexPath length](self, "length"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR("/")));
  free(v3);

  return v7;
}

@end
