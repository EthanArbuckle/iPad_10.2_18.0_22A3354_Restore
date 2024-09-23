@implementation NSMutableArray

- (void)_maps_popToFirstContextOfClass:(Class)a3
{
  void *v4;
  _BYTE *v5;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray _maps_firstContextOfClass:](self, "_maps_firstContextOfClass:"));
    v5 = -[NSMutableArray indexOfObject:](self, "indexOfObject:", v4);

    if (v5 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL && v5 != (char *)-[NSMutableArray count](self, "count") - 1)
      -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v5 + 1, (_BYTE *)-[NSMutableArray count](self, "count") - (v5 + 1));
  }
}

- (void)_maps_popToLastContextOfClass:(Class)a3
{
  void *v4;
  _BYTE *v5;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray _maps_lastContextOfClass:](self, "_maps_lastContextOfClass:"));
    v5 = -[NSMutableArray indexOfObject:](self, "indexOfObject:", v4);

    if (v5 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL && v5 != (char *)-[NSMutableArray count](self, "count") - 1)
      -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v5 + 1, (_BYTE *)-[NSMutableArray count](self, "count") - (v5 + 1));
  }
}

- (void)trimToLength:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self, "count") > a3)
    -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", a3, (char *)-[NSMutableArray count](self, "count") - a3);
}

- (void)addObjectIfNotNil:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self, "addObject:");
}

- (void)_maps_moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  NSExceptionName v7;
  const __CFString *v8;
  id v9;

  if ((unint64_t)-[NSMutableArray count](self, "count") <= a3)
  {
    v7 = NSInvalidArgumentException;
    v8 = CFSTR("fromIndex out of bounds");
  }
  else
  {
    if ((char *)-[NSMutableArray count](self, "count") - 1 >= (char *)a4)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", a3));
      -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", a3);
      -[NSMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", v9, a4);
      goto LABEL_7;
    }
    v7 = NSInvalidArgumentException;
    v8 = CFSTR("toIndex out of bounds");
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v7, v8, 0));
  objc_msgSend(v9, "raise");
LABEL_7:

}

@end
