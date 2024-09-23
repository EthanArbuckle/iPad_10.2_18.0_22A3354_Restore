@implementation TACircularBuffer

- (id)objectsMatchingPredicate:(id)a3
{
  return (id)-[NSMutableArray filteredArrayUsingPredicate:](self->_buffer, "filteredArrayUsingPredicate:", a3);
}

- (id)bufferCopy
{
  return (id)-[NSMutableArray copy](self->_buffer, "copy");
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_buffer, "count");
}

- (id)firstObject
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->_buffer, "count");
  if (v3)
  {
    -[NSMutableArray firstObject](self->_buffer, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)lastObject
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->_buffer, "count");
  if (v3)
  {
    -[NSMutableArray lastObject](self->_buffer, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)add:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self->_capacity
    && (-[NSMutableArray addObject:](self->_buffer, "addObject:", v4),
        -[NSMutableArray count](self->_buffer, "count") > self->_capacity))
  {
    -[TACircularBuffer dropOldestElement](self, "dropOldestElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __50__TACircularBuffer_removeUntilFirstPredicateFail___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2) ^ 1;
}

- (id)removeUntilFirstPredicateFail:(id)a3
{
  id v4;
  NSMutableArray *buffer;
  id v6;
  uint64_t v7;
  id i;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  buffer = self->_buffer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__TACircularBuffer_removeUntilFirstPredicateFail___block_invoke;
  v12[3] = &unk_24D8156A8;
  v6 = v4;
  v13 = v6;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](buffer, "indexOfObjectPassingTest:", v12);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = -[NSMutableArray count](self->_buffer, "count");
  for (i = objc_alloc_init(MEMORY[0x24BDBCEB8]); v7; --v7)
  {
    -[TACircularBuffer dropOldestElement](self, "dropOldestElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(i, "addObject:", v9);

  }
  v10 = (void *)objc_msgSend(i, "copy");

  return v10;
}

- (id)dropOldestElement
{
  void *v3;

  if (-[NSMutableArray count](self->_buffer, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_buffer, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_buffer, "removeObjectAtIndex:", 0);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (TACircularBuffer)initWithCapacity:(unint64_t)a3
{
  TACircularBuffer *v4;
  NSMutableArray *v5;
  NSMutableArray *buffer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TACircularBuffer;
  v4 = -[TACircularBuffer init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    buffer = v4->_buffer;
    v4->_buffer = v5;

    v4->_capacity = a3;
  }
  return v4;
}

- (id)insert:(id)a3 at:(unint64_t)a4
{
  void *v5;

  if (self->_capacity <= a4
    || (-[NSMutableArray insertObject:atIndex:](self->_buffer, "insertObject:atIndex:", a3),
        -[NSMutableArray count](self->_buffer, "count") <= self->_capacity))
  {
    v5 = 0;
  }
  else
  {
    -[TACircularBuffer dropOldestElement](self, "dropOldestElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)firstObjectMatchingTest:(id)a3 withOptions:(unint64_t)a4
{
  uint64_t v5;
  void *v6;

  v5 = -[NSMutableArray indexOfObjectWithOptions:passingTest:](self->_buffer, "indexOfObjectWithOptions:passingTest:", a4, a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_buffer, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)removeWithPredicate:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *buffer;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  TACircularBuffer *v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  buffer = self->_buffer;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __40__TACircularBuffer_removeWithPredicate___block_invoke;
  v15[3] = &unk_24D8156A8;
  v16 = v4;
  v7 = v4;
  -[NSMutableArray indexesOfObjectsPassingTest:](buffer, "indexesOfObjectsPassingTest:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __40__TACircularBuffer_removeWithPredicate___block_invoke_2;
  v12[3] = &unk_24D8156D0;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = self;
  v9 = v13;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v12);
  -[NSMutableArray removeObjectsAtIndexes:](self->_buffer, "removeObjectsAtIndexes:", v8);
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

uint64_t __40__TACircularBuffer_removeWithPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
}

void __40__TACircularBuffer_removeWithPredicate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)removeLastObject
{
  void *v3;

  if (-[NSMutableArray count](self->_buffer, "count"))
  {
    -[NSMutableArray lastObject](self->_buffer, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_buffer, "removeLastObject");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)getObjectAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_buffer, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_buffer, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[TACircularBuffer buffer](self, "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[TACircularBuffer capacity](self, "capacity") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  unint64_t v11;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[TACircularBuffer buffer](self, "buffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9
      || (-[TACircularBuffer buffer](self, "buffer"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "buffer"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v11 = -[TACircularBuffer capacity](self, "capacity");
      v10 = v11 == objc_msgSend(v7, "capacity");
      if (v8 == v9)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[TACircularBuffer buffer](self, "buffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; buffer: '%@'; capacity: '%lu'>"),
    v4,
    self,
    v5,
    -[TACircularBuffer capacity](self, "capacity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TACircularBuffer)initWithCoder:(id)a3
{
  id v4;
  TACircularBuffer *v5;
  uint64_t v6;
  NSMutableArray *buffer;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TACircularBuffer;
  v5 = -[TACircularBuffer init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("Buffer"));
    v6 = objc_claimAutoreleasedReturnValue();
    buffer = v5->_buffer;
    v5->_buffer = (NSMutableArray *)v6;

    v5->_capacity = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Capacity"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *buffer;
  id v5;

  buffer = self->_buffer;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", buffer, CFSTR("Buffer"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_capacity, CFSTR("Capacity"));

}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
