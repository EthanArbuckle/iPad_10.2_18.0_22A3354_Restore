@implementation TSPLazyReferenceArray

- (TSPLazyReferenceArray)init
{
  TSPLazyReferenceArray *v2;
  NSMutableArray *v3;
  NSMutableArray *references;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSPLazyReferenceArray;
  v2 = -[TSPLazyReferenceArray init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    references = v2->_references;
    v2->_references = v3;

  }
  return v2;
}

- (TSPLazyReferenceArray)initWithCapacity:(unint64_t)a3
{
  TSPLazyReferenceArray *v4;
  uint64_t v5;
  NSMutableArray *references;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSPLazyReferenceArray;
  v4 = -[TSPLazyReferenceArray init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
    references = v4->_references;
    v4->_references = (NSMutableArray *)v5;

  }
  return v4;
}

- (TSPLazyReferenceArray)initWithArray:(id)a3
{
  _QWORD *v4;
  TSPLazyReferenceArray *v5;
  uint64_t v6;
  NSMutableArray *references;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)TSPLazyReferenceArray;
    v5 = -[TSPLazyReferenceArray init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v4[1]);
      references = v5->_references;
      v5->_references = (NSMutableArray *)v6;

    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TSPLazyReferenceArray;
    v5 = -[TSPLazyReferenceArray initWithArray:](&v9, sel_initWithArray_, v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPLazyReferenceArray copyWithZone:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPLazyReferenceArray.mm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 63, CFSTR("Use -mutableCopy instead of -copy"));

  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPLazyReferenceArray mutableCopyWithZone:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPLazyReferenceArray.mm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 70, CFSTR("Implement copying for TSPLazyReferenceArray"));

  return 0;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_references, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSMutableArray objectAtIndex:](self->_references, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)referenceAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_references, "objectAtIndex:", a3);
}

- (id)objectsAtIndexes:(id)a3
{
  id v4;
  TSPLazyReferenceArray *v5;
  void *v6;
  TSPLazyReferenceArray *v7;

  v4 = a3;
  v5 = [TSPLazyReferenceArray alloc];
  -[NSMutableArray objectsAtIndexes:](self->_references, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TSPLazyReferenceArray initWithArray:](v5, "initWithArray:", v6);

  return v7;
}

- (id)subarrayWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  TSPLazyReferenceArray *v6;
  void *v7;
  TSPLazyReferenceArray *v8;

  length = a3.length;
  location = a3.location;
  v6 = [TSPLazyReferenceArray alloc];
  -[NSMutableArray subarrayWithRange:](self->_references, "subarrayWithRange:", location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TSPLazyReferenceArray initWithArray:](v6, "initWithArray:", v7);

  return v8;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  unint64_t v10;
  unint64_t v11;
  id *v12;
  unint64_t v13;
  void *v14;
  void *v15;

  var0 = a3->var0;
  if (!a3->var0)
    a3->var2 = &self->_mutations;
  v10 = -[NSMutableArray count](self->_references, "count");
  if (v10 <= var0)
    return 0;
  if (v10 - var0 < a5)
    a5 = v10 - var0;
  if (a5)
  {
    v11 = var0;
    v12 = a4;
    v13 = a5;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_references, "objectAtIndex:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "object");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *v12++ = v15;

      ++v11;
      --v13;
    }
    while (v13);
  }
  a3->var0 = a5 + var0;
  a3->var1 = a4;
  return a5;
}

- (void)addObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *references;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSMutableArray addObject:](self->_references, "addObject:", v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPLazyReferenceArray addObject:]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPLazyReferenceArray.mm");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 131, CFSTR("Don't put non-TSPObjects in TSPLazyReferenceArray"));

    }
    references = self->_references;
    +[TSPLazyReference referenceForObject:](TSPLazyReference, "referenceForObject:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](references, "addObject:", v8);

  }
  ++self->_mutations;

}

- (void)addReference:(id)a3
{
  -[NSMutableArray addObject:](self->_references, "addObject:", a3);
  ++self->_mutations;
}

- (void)addObjectsFromArray:(id)a3
{
  _QWORD *v4;
  objc_super v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSMutableArray addObjectsFromArray:](self->_references, "addObjectsFromArray:", v4[1]);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSPLazyReferenceArray;
    -[TSPLazyReferenceArray addObjectsFromArray:](&v5, sel_addObjectsFromArray_, v4);
  }
  ++self->_mutations;

}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *references;
  void *v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSMutableArray insertObject:atIndex:](self->_references, "insertObject:atIndex:", v11, a4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPLazyReferenceArray insertObject:atIndex:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPLazyReferenceArray.mm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 164, CFSTR("Don't put non-TSPObjects in TSPLazyReferenceArray"));

    }
    references = self->_references;
    +[TSPLazyReference referenceForObject:](TSPLazyReference, "referenceForObject:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](references, "insertObject:atIndex:", v10, a4);

  }
  ++self->_mutations;

}

- (void)removeLastObject
{
  -[NSMutableArray removeLastObject](self->_references, "removeLastObject");
  ++self->_mutations;
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->_references, "removeObjectAtIndex:", a3);
  ++self->_mutations;
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  -[NSMutableArray removeObjectsInRange:](self->_references, "removeObjectsInRange:", a3.location, a3.length);
  ++self->_mutations;
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *references;
  void *v10;
  id v11;

  v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_references, "replaceObjectAtIndex:withObject:", a3, v11);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPLazyReferenceArray replaceObjectAtIndex:withObject:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPLazyReferenceArray.mm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 199, CFSTR("Don't put non-TSPObjects in TSPLazyReferenceArray"));

    }
    references = self->_references;
    +[TSPLazyReference referenceForObject:](TSPLazyReference, "referenceForObject:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray replaceObjectAtIndex:withObject:](references, "replaceObjectAtIndex:withObject:", a3, v10);

  }
  ++self->_mutations;

}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromArray:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v7;
  objc_super v8;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](self->_references, "replaceObjectsInRange:withObjectsFromArray:", location, length, v7[1]);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TSPLazyReferenceArray;
    -[TSPLazyReferenceArray replaceObjectsInRange:withObjectsFromArray:](&v8, sel_replaceObjectsInRange_withObjectsFromArray_, location, length, v7);
  }
  ++self->_mutations;

}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromArray:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  _QWORD *v10;
  objc_super v11;

  length = a5.length;
  location = a5.location;
  v7 = a3.length;
  v8 = a3.location;
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:](self->_references, "replaceObjectsInRange:withObjectsFromArray:range:", v8, v7, v10[1], location, length);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TSPLazyReferenceArray;
    -[TSPLazyReferenceArray replaceObjectsInRange:withObjectsFromArray:range:](&v11, sel_replaceObjectsInRange_withObjectsFromArray_range_, v8, v7, v10, location, length);
  }
  ++self->_mutations;

}

- (NSArray)references
{
  return &self->_references->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_references, 0);
}

@end
