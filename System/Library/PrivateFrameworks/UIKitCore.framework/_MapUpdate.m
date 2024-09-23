@implementation _MapUpdate

+ (id)itemInsertSection:(int64_t)a3 insertRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _MapUpdate *v7;

  length = a4.length;
  location = a4.location;
  v7 = objc_alloc_init(_MapUpdate);
  -[_MapUpdate setIsInsert:](v7, "setIsInsert:", 1);
  -[_MapUpdate setIsSectionUpdate:](v7, "setIsSectionUpdate:", 1);
  -[_MapUpdate setSection:](v7, "setSection:", a3);
  -[_MapUpdate setInsertRange:](v7, "setInsertRange:", location, length);
  return v7;
}

+ (id)itemInsertItemAtIndexPath:(id)a3 index:(int64_t)a4
{
  id v5;
  _MapUpdate *v6;
  uint64_t v7;

  v5 = a3;
  v6 = objc_alloc_init(_MapUpdate);
  -[_MapUpdate setIsInsert:](v6, "setIsInsert:", 1);
  -[_MapUpdate setInsertRange:](v6, "setInsertRange:", a4, 1);
  -[_MapUpdate setIndexPath:](v6, "setIndexPath:", v5);
  v7 = objc_msgSend(v5, "section");

  -[_MapUpdate setSection:](v6, "setSection:", v7);
  -[_MapUpdate setIndex:](v6, "setIndex:", a4);
  return v6;
}

+ (id)itemDeleteSection:(int64_t)a3 deleteRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _MapUpdate *v7;

  length = a4.length;
  location = a4.location;
  v7 = objc_alloc_init(_MapUpdate);
  -[_MapUpdate setIsDelete:](v7, "setIsDelete:", 1);
  -[_MapUpdate setIsSectionUpdate:](v7, "setIsSectionUpdate:", 1);
  -[_MapUpdate setSection:](v7, "setSection:", a3);
  -[_MapUpdate setDeleteRange:](v7, "setDeleteRange:", location, length);
  return v7;
}

+ (id)itemDeleteItemAtIndexPath:(id)a3 index:(int64_t)a4
{
  id v5;
  _MapUpdate *v6;
  uint64_t v7;

  v5 = a3;
  v6 = objc_alloc_init(_MapUpdate);
  -[_MapUpdate setIsDelete:](v6, "setIsDelete:", 1);
  -[_MapUpdate setIndexPath:](v6, "setIndexPath:", v5);
  v7 = objc_msgSend(v5, "section");

  -[_MapUpdate setSection:](v6, "setSection:", v7);
  -[_MapUpdate setIndex:](v6, "setIndex:", a4);
  -[_MapUpdate setDeleteRange:](v6, "setDeleteRange:", a4, 1);
  return v6;
}

+ (id)itemMoveSection:(int64_t)a3 toSection:(int64_t)a4 fromRange:(_NSRange)a5 toRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  NSUInteger v9;
  _MapUpdate *v12;

  length = a6.length;
  location = a6.location;
  v8 = a5.length;
  v9 = a5.location;
  v12 = objc_alloc_init(_MapUpdate);
  -[_MapUpdate setIsMove:](v12, "setIsMove:", 1);
  -[_MapUpdate setIsSectionUpdate:](v12, "setIsSectionUpdate:", 1);
  -[_MapUpdate setMoveFromSection:](v12, "setMoveFromSection:", a3);
  -[_MapUpdate setMoveToSection:](v12, "setMoveToSection:", a4);
  -[_MapUpdate setMoveFromRange:](v12, "setMoveFromRange:", v9, v8);
  -[_MapUpdate setMoveToRange:](v12, "setMoveToRange:", location, length);
  return v12;
}

+ (id)itemMoveFromIndexIndexPath:(id)a3 toIndexPath:(id)a4 fromIndex:(int64_t)a5 toIndex:(int64_t)a6
{
  id v9;
  id v10;
  _MapUpdate *v11;
  uint64_t v12;
  uint64_t v13;

  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(_MapUpdate);
  -[_MapUpdate setIsMove:](v11, "setIsMove:", 1);
  -[_MapUpdate setMoveFromIndexPath:](v11, "setMoveFromIndexPath:", v10);
  -[_MapUpdate setMoveToIndexPath:](v11, "setMoveToIndexPath:", v9);
  -[_MapUpdate setMoveFromRange:](v11, "setMoveFromRange:", a5, 1);
  -[_MapUpdate setMoveToRange:](v11, "setMoveToRange:", a6, 1);
  v12 = objc_msgSend(v10, "section");

  -[_MapUpdate setMoveFromSection:](v11, "setMoveFromSection:", v12);
  v13 = objc_msgSend(v9, "section");

  -[_MapUpdate setMoveToSection:](v11, "setMoveToSection:", v13);
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_MapUpdate isSectionUpdate](self, "isSectionUpdate"))
    objc_msgSend(v3, "appendString:", CFSTR("S"));
  if (-[_MapUpdate isMove](self, "isMove"))
  {
    NSStringFromRange(self->_moveFromRange);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromRange(self->_moveToRange);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("M(%@->%@)"), v4, v5);

LABEL_9:
    return v3;
  }
  if (-[_MapUpdate isDelete](self, "isDelete"))
  {
    NSStringFromRange(self->_deleteRange);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("D(%@)"), v4);
    goto LABEL_9;
  }
  if (-[_MapUpdate isInsert](self, "isInsert"))
  {
    NSStringFromRange(self->_insertRange);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("I(%@)"), v4);
    goto LABEL_9;
  }
  return v3;
}

- (id)reverseUpdateItem
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;

  if (!-[_MapUpdate isDelete](self, "isDelete"))
  {
    if (!-[_MapUpdate isInsert](self, "isInsert"))
    {
      if (!-[_MapUpdate isMove](self, "isMove"))
      {
        v19 = 0;
        return v19;
      }
      if (-[_MapUpdate isSectionUpdate](self, "isSectionUpdate"))
      {
        v12 = -[_MapUpdate moveToSection](self, "moveToSection");
        v13 = -[_MapUpdate moveFromSection](self, "moveFromSection");
        v14 = -[_MapUpdate moveToRange](self, "moveToRange");
        v16 = v15;
        v17 = -[_MapUpdate moveFromRange](self, "moveFromRange");
        +[_MapUpdate itemMoveSection:toSection:fromRange:toRange:](_MapUpdate, "itemMoveSection:toSection:fromRange:toRange:", v12, v13, v14, v16, v17, v18);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      -[_MapUpdate moveToIndexPath](self, "moveToIndexPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MapUpdate moveFromIndexPath](self, "moveFromIndexPath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MapUpdate itemMoveFromIndexIndexPath:toIndexPath:fromIndex:toIndex:](_MapUpdate, "itemMoveFromIndexIndexPath:toIndexPath:fromIndex:toIndex:", v10, v21, -[_MapUpdate moveToRange](self, "moveToRange"), -[_MapUpdate moveFromRange](self, "moveFromRange"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
      return v19;
    }
    if (-[_MapUpdate isSectionUpdate](self, "isSectionUpdate"))
    {
      v7 = -[_MapUpdate section](self, "section");
      v8 = -[_MapUpdate insertRange](self, "insertRange");
      +[_MapUpdate itemDeleteSection:deleteRange:](_MapUpdate, "itemDeleteSection:deleteRange:", v7, v8, v9);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    -[_MapUpdate indexPath](self, "indexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MapUpdate itemDeleteItemAtIndexPath:index:](_MapUpdate, "itemDeleteItemAtIndexPath:index:", v10, -[_MapUpdate index](self, "index"));
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v19 = (void *)v11;
    goto LABEL_14;
  }
  if (!-[_MapUpdate isSectionUpdate](self, "isSectionUpdate"))
  {
    -[_MapUpdate indexPath](self, "indexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MapUpdate itemInsertItemAtIndexPath:index:](_MapUpdate, "itemInsertItemAtIndexPath:index:", v10, -[_MapUpdate index](self, "index"));
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v3 = -[_MapUpdate section](self, "section");
  v4 = -[_MapUpdate deleteRange](self, "deleteRange");
  +[_MapUpdate itemInsertSection:insertRange:](_MapUpdate, "itemInsertSection:insertRange:", v3, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v19 = (void *)v6;
  return v19;
}

- (BOOL)isSectionUpdate
{
  return self->_isSectionUpdate;
}

- (void)setIsSectionUpdate:(BOOL)a3
{
  self->_isSectionUpdate = a3;
}

- (BOOL)isInsert
{
  return self->_isInsert;
}

- (void)setIsInsert:(BOOL)a3
{
  self->_isInsert = a3;
}

- (BOOL)isDelete
{
  return self->_isDelete;
}

- (void)setIsDelete:(BOOL)a3
{
  self->_isDelete = a3;
}

- (BOOL)isMove
{
  return self->_isMove;
}

- (void)setIsMove:(BOOL)a3
{
  self->_isMove = a3;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (NSIndexPath)moveFromIndexPath
{
  return self->_moveFromIndexPath;
}

- (void)setMoveFromIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_moveFromIndexPath, a3);
}

- (NSIndexPath)moveToIndexPath
{
  return self->_moveToIndexPath;
}

- (void)setMoveToIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_moveToIndexPath, a3);
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (_NSRange)insertRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_insertRange.length;
  location = self->_insertRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setInsertRange:(_NSRange)a3
{
  self->_insertRange = a3;
}

- (_NSRange)deleteRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_deleteRange.length;
  location = self->_deleteRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setDeleteRange:(_NSRange)a3
{
  self->_deleteRange = a3;
}

- (int64_t)moveFromSection
{
  return self->_moveFromSection;
}

- (void)setMoveFromSection:(int64_t)a3
{
  self->_moveFromSection = a3;
}

- (int64_t)moveToSection
{
  return self->_moveToSection;
}

- (void)setMoveToSection:(int64_t)a3
{
  self->_moveToSection = a3;
}

- (_NSRange)moveFromRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_moveFromRange.length;
  location = self->_moveFromRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setMoveFromRange:(_NSRange)a3
{
  self->_moveFromRange = a3;
}

- (_NSRange)moveToRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_moveToRange.length;
  location = self->_moveToRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setMoveToRange:(_NSRange)a3
{
  self->_moveToRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveToIndexPath, 0);
  objc_storeStrong((id *)&self->_moveFromIndexPath, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
}

@end
