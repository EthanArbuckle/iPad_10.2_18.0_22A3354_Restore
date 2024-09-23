@implementation PKDiff

- (PKDiff)init
{
  PKDiff *v2;
  NSMutableArray *v3;
  NSMutableArray *hunks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDiff;
  v2 = -[PKDiff init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    hunks = v2->_hunks;
    v2->_hunks = v3;

  }
  return v2;
}

- (void)addHunkWithKey:(id)a3 oldValue:(id)a4 newValue:(id)a5 message:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  id v15;
  NSMutableArray *hunks;
  void *v17;
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18 = 0;
  v14 = -[PKDiff getHunkForKey:oldValue:newValue:message:](self, "getHunkForKey:oldValue:newValue:message:", v10, &v18, 0, 0);
  v15 = v18;
  if (v14)
  {
    -[PKDiff removeHunkForKey:](self, "removeHunkForKey:", v10);
    if ((objc_msgSend(v15, "isEqual:", v12) & 1) == 0)
      -[PKDiff addHunkWithKey:oldValue:newValue:message:](self, "addHunkWithKey:oldValue:newValue:message:", v10, v15, v12, v13);
  }
  else if (v10)
  {
    hunks = self->_hunks;
    +[PKDiffHunk hunkWithKey:oldValue:newValue:message:](PKDiffHunk, "hunkWithKey:oldValue:newValue:message:", v10, v11, v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](hunks, "addObject:", v17);

  }
}

- (int64_t)hunkCount
{
  return -[NSMutableArray count](self->_hunks, "count");
}

- (void)key:(id *)a3 oldValue:(id *)a4 newValue:(id *)a5 message:(id *)a6 forHunkAtIndex:(int64_t)a7
{
  void *v11;
  id v12;

  -[NSMutableArray objectAtIndex:](self->_hunks, "objectAtIndex:", a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a3)
  {
    objc_msgSend(v11, "key");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v12;
  }
  if (a4)
  {
    objc_msgSend(v12, "valueOld");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v12;
  }
  if (a5)
  {
    objc_msgSend(v12, "valueNew");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v12;
  }
  if (a6)
  {
    objc_msgSend(v12, "message");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v12;
  }

}

- (void)enumerateHunks:(id)a3
{
  void (**v4)(id, void *, void *, void *, void *, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v14;

  v4 = (void (**)(id, void *, void *, void *, void *, _BYTE *))a3;
  v5 = -[NSMutableArray count](self->_hunks, "count");
  if (v5)
  {
    v6 = 0;
    v7 = v5 - 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_hunks, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      objc_msgSend(v8, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueOld");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueNew");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "message");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v9, v10, v11, v12, &v14);

      LODWORD(v9) = v14;
      if ((_DWORD)v9)
        break;
    }
    while (v7 != v6++);
  }

}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __21__PKDiff_description__block_invoke;
  v7[3] = &unk_1E2ACEFA0;
  v8 = v3;
  v4 = v3;
  -[PKDiff enumerateHunks:](self, "enumerateHunks:", v7);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p card:%@ %@>"), objc_opt_class(), self, self->_passUniqueID, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __21__PKDiff_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ -> %@ (%@)"), a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (BOOL)getHunkForKey:(id)a3 oldValue:(id *)a4 newValue:(id *)a5 message:(id *)a6
{
  unint64_t v10;
  void *v11;
  void *v12;

  v10 = -[PKDiff _hunkIndexForKey:](self, "_hunkIndexForKey:", a3);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray objectAtIndex:](self->_hunks, "objectAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a4)
    {
      objc_msgSend(v11, "valueOld");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a5)
    {
      objc_msgSend(v12, "valueNew");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a6)
    {
      objc_msgSend(v12, "message");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)removeHunkForKey:(id)a3
{
  unint64_t v4;

  v4 = -[PKDiff _hunkIndexForKey:](self, "_hunkIndexForKey:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_hunks, "removeObjectAtIndex:", v4);
}

- (void)addHunksFromDiff:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__PKDiff_addHunksFromDiff___block_invoke;
  v3[3] = &unk_1E2ACEFA0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateHunks:", v3);
}

uint64_t __27__PKDiff_addHunksFromDiff___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "addHunkWithKey:oldValue:newValue:message:", a2, a3, a4, a5);
}

- (id)anyKey
{
  void *v2;
  void *v3;

  -[NSMutableArray lastObject](self->_hunks, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NSMutableArray arrayByAddingObject:](self->_hunks, "arrayByAddingObject:", self->_passUniqueID);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKCombinedHash(17, v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKDiff *v4;
  PKDiff *v5;
  BOOL v6;

  v4 = (PKDiff *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKDiff isEqualToDiff:](self, "isEqualToDiff:", v5);

  return v6;
}

- (BOOL)isEqualToDiff:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  if (-[NSMutableArray isEqual:](self->_hunks, "isEqual:", v4[1]))
    v5 = -[NSString isEqual:](self->_passUniqueID, "isEqual:", v4[2]);
  else
    v5 = 0;

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  NSComparisonResult v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (!v4)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[NSString caseInsensitiveCompare:](self->_passUniqueID, "caseInsensitiveCompare:", *((_QWORD *)v4 + 2));
    if (v5 == NSOrderedSame)
    {
      v6 = -[NSMutableArray count](self->_hunks, "count");
      if (v6 > objc_msgSend(*((id *)v4 + 1), "count"))
      {
LABEL_5:
        v5 = NSOrderedDescending;
        goto LABEL_9;
      }
      v9 = -[NSMutableArray count](self->_hunks, "count");
      if (v9 >= objc_msgSend(*((id *)v4 + 1), "count"))
      {
        if (-[NSMutableArray count](self->_hunks, "count"))
        {
          v10 = 0;
          do
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_hunks, "objectAtIndexedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)v4 + 1), "objectAtIndexedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = objc_msgSend(v11, "compare:", v12);

            if (v5)
              break;
            ++v10;
          }
          while (v10 < -[NSMutableArray count](self->_hunks, "count"));
        }
        else
        {
          v5 = NSOrderedSame;
        }
      }
      else
      {
        v5 = NSOrderedAscending;
      }
    }
  }
  else
  {
    v7 = objc_opt_class();
    if (v7 < objc_opt_class())
      v5 = NSOrderedAscending;
    else
      v5 = NSOrderedDescending;
  }
LABEL_9:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiff)initWithCoder:(id)a3
{
  id v4;
  PKDiff *v5;
  uint64_t v6;
  NSString *passUniqueID;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *hunks;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKDiff;
  v5 = -[PKDiff init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
    v6 = objc_claimAutoreleasedReturnValue();
    passUniqueID = v5->_passUniqueID;
    v5->_passUniqueID = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("hunks"));
    v11 = objc_claimAutoreleasedReturnValue();
    hunks = v5->_hunks;
    v5->_hunks = (NSMutableArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *hunks;
  id v5;

  hunks = self->_hunks;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", hunks, CFSTR("hunks"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passUniqueID, CFSTR("uniqueID"));

}

- (unint64_t)_hunkIndexForKey:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = -[NSMutableArray count](self->_hunks, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_hunks, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v4);

      if ((v10 & 1) != 0)
        break;
      if (v6 == ++v7)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)passManifestHash
{
  return self->_passManifestHash;
}

- (void)setPassManifestHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passManifestHash, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_hunks, 0);
}

@end
