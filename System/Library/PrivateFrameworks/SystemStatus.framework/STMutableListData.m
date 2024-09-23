@implementation STMutableListData

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STListData initWithListData:](+[STListData allocWithZone:](STListData, "allocWithZone:", a3), self);
}

- (void)setObjects:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *objects;
  id v10;

  v10 = a3;
  v4 = -[NSMutableArray isEqual:](self->super._objects, "isEqual:", v10);
  v5 = v10;
  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v10, "mutableCopy");
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    objects = self->super._objects;
    self->super._objects = v8;

    v5 = v10;
  }

}

- (void)addObject:(id)a3
{
  -[NSMutableArray addObject:](self->super._objects, "addObject:", a3);
}

- (void)removeObject:(id)a3
{
  uint64_t v4;

  v4 = -[NSMutableArray indexOfObject:](self->super._objects, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->super._objects, "removeObjectAtIndex:", v4);
}

- (void)removeAllOccurrencesOfObject:(id)a3
{
  -[NSMutableArray removeObject:](self->super._objects, "removeObject:", a3);
}

- (BOOL)applyDiff:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v4, "applyToMutableListData:", self);

  return isKindOfClass & 1;
}

@end
