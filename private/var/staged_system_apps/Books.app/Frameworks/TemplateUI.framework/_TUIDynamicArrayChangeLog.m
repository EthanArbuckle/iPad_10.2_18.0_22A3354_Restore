@implementation _TUIDynamicArrayChangeLog

- (_TUIDynamicArrayChangeLog)initWithGeneration:(id)a3 initialCount:(unint64_t)a4 updater:(id)a5
{
  id v9;
  TUIDynamicArrayUpdating *v10;
  _TUIDynamicArrayChangeLog *v11;
  _TUIDynamicArrayChangeLog *v12;
  NSMutableString *v13;
  NSMutableString *changes;
  objc_super v16;

  v9 = a3;
  v10 = (TUIDynamicArrayUpdating *)a5;
  v16.receiver = self;
  v16.super_class = (Class)_TUIDynamicArrayChangeLog;
  v11 = -[_TUIDynamicArrayChangeLog init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_generation, a3);
    v12->_initialCount = a4;
    v12->_finalCount = a4;
    v13 = objc_opt_new(NSMutableString);
    changes = v12->_changes;
    v12->_changes = v13;

    v12->_updater = v10;
    -[NSMutableString appendFormat:](v12->_changes, "appendFormat:", CFSTR("S%lu;"), v12->_initialCount);
  }

  return v12;
}

- (NSString)changes
{
  return (NSString *)-[NSMutableString copy](self->_changes, "copy");
}

- (void)insertItemAtIndex:(unint64_t)a3
{
  -[NSMutableString appendFormat:](self->_changes, "appendFormat:", CFSTR("I%lu;"), a3);
  ++self->_finalCount;
  -[TUIDynamicArrayUpdating insertItemAtIndex:](self->_updater, "insertItemAtIndex:", a3);
}

- (void)deleteItemAtIndex:(unint64_t)a3
{
  -[NSMutableString appendFormat:](self->_changes, "appendFormat:", CFSTR("D%lu;"), a3);
  --self->_finalCount;
  -[TUIDynamicArrayUpdating deleteItemAtIndex:](self->_updater, "deleteItemAtIndex:", a3);
}

- (void)updateItemAtIndex:(unint64_t)a3
{
  -[NSMutableString appendFormat:](self->_changes, "appendFormat:", CFSTR("U%lu;"), a3);
  -[TUIDynamicArrayUpdating updateItemAtIndex:](self->_updater, "updateItemAtIndex:", a3);
}

- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  -[NSMutableString appendFormat:](self->_changes, "appendFormat:", CFSTR("U%lu->%lu;"), a3, a4);
  -[TUIDynamicArrayUpdating moveItemFromIndex:toIndex:](self->_updater, "moveItemFromIndex:toIndex:", a3, a4);
}

- (void)finalizeUpdates
{
  -[NSMutableString appendFormat:](self->_changes, "appendFormat:", CFSTR("F%lu;"), self->_finalCount);
  self->_updater = 0;
}

- (id)generation
{
  return self->_generation;
}

- (unint64_t)initialCount
{
  return self->_initialCount;
}

- (unint64_t)finalCount
{
  return self->_finalCount;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_generation, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
