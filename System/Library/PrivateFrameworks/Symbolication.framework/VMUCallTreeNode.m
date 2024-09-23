@implementation VMUCallTreeNode

+ (id)rootForSamples:(id)a3 symbolicator:(_CSTypeRef)a4 sampler:(id)a5 options:(unint64_t)a6
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  id v10;
  id v11;
  VMUCallTreeRoot *v12;
  uint64_t Task;
  uint64_t v14;
  VMUVMRegionIdentifier *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t BaseAddress;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id v31;
  void *v33;
  VMUVMRegionIdentifier *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t);
  void *v46;
  id v47;
  _QWORD *v48;
  _QWORD v49[6];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  opaque_2 = a4._opaque_2;
  opaque_1 = a4._opaque_1;
  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]([VMUCallTreeRoot alloc], "initWithSymbolicator:sampler:options:", opaque_1, opaque_2, v11, a6);
  Task = CSSymbolicatorGetTask();
  if ((_DWORD)Task)
  {
    v14 = Task;
    if (CSTaskIsTranslated())
    {
      v15 = -[VMUVMRegionIdentifier initWithTask:options:]([VMUVMRegionIdentifier alloc], "initWithTask:options:", v14, 1281);
      -[VMUVMRegionIdentifier regions](v15, "regions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMUCallTreeRoot setVMRegions:](v12, "setVMRegions:", v16);
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x3010000000;
      v49[4] = 0;
      v49[5] = 0;
      v49[3] = &unk_1A4E39779;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", VMUOAHRuntimeLocation());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = MEMORY[0x1E0C809B0];
      v44 = 3221225472;
      v45 = __63__VMUCallTreeNode_rootForSamples_symbolicator_sampler_options___block_invoke;
      v46 = &unk_1E4E01D88;
      v18 = v17;
      v47 = v18;
      v48 = v49;
      CSSymbolicatorForeachSymbolOwnerAtTime();
      if ((CSIsNull() & 1) == 0)
      {
        v34 = v15;
        BaseAddress = CSSymbolOwnerGetBaseAddress();
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v33 = v16;
        v20 = v16;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v40;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v40 != v22)
                objc_enumerationMutation(v20);
              v24 = *(_QWORD **)(*((_QWORD *)&v39 + 1) + 8 * i);
              v25 = BaseAddress - objc_msgSend(v24, "range", v33);
              if (v25 < v26)
              {
                -[VMUCallTreeRoot setCambriaRuntimeVMObjectID:](v12, "setCambriaRuntimeVMObjectID:", v24[14]);
                goto LABEL_14;
              }
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            if (v21)
              continue;
            break;
          }
        }
LABEL_14:

        v16 = v33;
        v15 = v34;
      }

      _Block_object_dispose(v49, 8);
    }
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = v10;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v50, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(v27);
        v31 = -[VMUCallTreeRoot addBacktrace:](v12, "addBacktrace:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), v33);
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v50, 16);
    }
    while (v28);
  }

  return v12;
}

void __63__VMUCallTreeNode_rootForSamples_symbolicator_sampler_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CSSymbolOwnerGetPath());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasPrefix:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || objc_msgSend(v7, "hasPrefix:", CFSTR("/usr/local/libexec/rosetta/runtime")))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v6 + 32) = a2;
    *(_QWORD *)(v6 + 40) = a3;
  }

}

+ (id)rootForSamples:(id)a3 symbolicator:(_CSTypeRef)a4
{
  return (id)objc_msgSend(a1, "rootForSamples:symbolicator:sampler:options:", a3, a4._opaque_1, a4._opaque_2, 0, 0);
}

+ (id)nodeWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6
{
  uint64_t v7;
  id v10;
  void *v11;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:address:count:numBytes:", v10, a4, v7, a6);

  return v11;
}

- (VMUCallTreeNode)initWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6
{
  id v11;
  VMUCallTreeNode *v12;
  VMUCallTreeNode *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VMUCallTreeNode;
  v12 = -[VMUCallTreeNode init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    v13->_count = a5;
    v13->_address = a4;
    v13->_numBytes = a6;
  }

  return v13;
}

- (unsigned)numChildren
{
  return self->_numChildren;
}

- (id)childAtIndex:(unsigned int)a3
{
  void **p_children;

  p_children = &self->_children;
  if (self->_numChildren != 1)
    p_children = (void **)((char *)*p_children + 8 * a3);
  return *p_children;
}

- (id)allChildren
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VMUCallTreeNode numChildren](self, "numChildren"))
  {
    v4 = 0;
    do
    {
      -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      v4 = (v4 + 1);
    }
    while (v4 < -[VMUCallTreeNode numChildren](self, "numChildren"));
  }
  return v3;
}

- (void)setChildren:(id)a3
{
  id v4;
  unsigned int numChildren;
  void **p_children;
  void **v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t i;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  numChildren = self->_numChildren;
  p_children = &self->_children;
  if (numChildren >= 2)
  {
    v7 = (void **)*p_children;
  }
  else
  {
    v7 = &self->_children;
    if (!numChildren)
      goto LABEL_9;
  }
  v8 = numChildren - 1;
  do
  {
    v9 = v8;
    v10 = v7[v8];
    v7[v8] = 0;

    --v8;
  }
  while (v9);
  if (self->_numChildren >= 2)
    free(v7);
LABEL_9:
  v11 = objc_msgSend(v4, "count");
  self->_numChildren = v11;
  if (v11 >= 2)
  {
    v12 = malloc_type_calloc(v11, 8uLL, 0x80040B8603338uLL);
    *p_children = v12;
    p_children = (void **)v12;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_storeStrong(&p_children[(v16 + i)], v19);
        v19[1] = self;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v16 += i;
    }
    while (v15);
  }

}

- (void)addChild:(id)a3
{
  _QWORD *v5;
  unsigned int numChildren;
  _QWORD *v7;
  id v8;
  void *children;
  void **v10;
  void *v11;
  id *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  v5 = a3;
  if (v5)
  {
    numChildren = self->_numChildren;
    v16 = v5;
    if (numChildren == 1)
    {
      children = self->_children;
      v10 = (void **)malloc_type_calloc(2uLL, 8uLL, 0x80040B8603338uLL);
      self->_children = v10;
      v11 = *v10;
      *v10 = children;
      v12 = v10 + 1;
      v8 = children;

      objc_storeStrong(v12, a3);
    }
    else if (numChildren)
    {
      v13 = malloc_type_realloc(self->_children, 8 * (numChildren + 1), 0x80040B8603338uLL);
      self->_children = v13;
      *((_QWORD *)v13 + self->_numChildren) = 0;
      v14 = self->_numChildren;
      v15 = v16;
      v8 = (id)*((_QWORD *)v13 + v14);
      *((_QWORD *)v13 + v14) = v15;
    }
    else
    {
      v7 = v5;
      v8 = self->_children;
      self->_children = v7;
    }

    ++self->_numChildren;
    v5 = v16;
    v16[1] = self;
  }

}

- (unsigned)sumOfChildCounts
{
  uint64_t v3;
  unsigned int v4;
  void *v5;

  if (!-[VMUCallTreeNode numChildren](self, "numChildren"))
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 += objc_msgSend(v5, "count");

    v3 = (v3 + 1);
  }
  while (v3 < -[VMUCallTreeNode numChildren](self, "numChildren"));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[VMUCallTreeNode setChildren:](self, "setChildren:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VMUCallTreeNode;
  -[VMUCallTreeNode dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VMUCallTreeNode;
  -[VMUCallTreeNode description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUCallTreeNode browserName](self, "browserName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("  %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)makeFakeRootForNode:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[VMUCallTreeNode nodeWithName:address:count:numBytes:](VMUCallTreeNode, "nodeWithName:address:count:numBytes:", 0, 0, objc_msgSend(v3, "count"), objc_msgSend(v3, "numBytes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setChildren:", v5);
  return v4;
}

- (id)parent
{
  return self->_parent;
}

- (unint64_t)address
{
  return self->_address;
}

- (unsigned)count
{
  return self->_count;
}

- (unint64_t)numBytes
{
  return self->_numBytes;
}

- (id)name
{
  return self->_name;
}

- (void)getBrowserName:(id)a3
{
  unint64_t numBytes;
  float v5;
  float v6;
  float v7;
  uint64_t v8;
  uint64_t count;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "setString:", &stru_1E4E04720);
  numBytes = self->_numBytes;
  if (numBytes)
  {
    v5 = (float)numBytes;
    if (numBytes < 0x100000)
    {
      if (numBytes < 0x400)
      {
        objc_msgSend(v11, "appendFormat:", CFSTR("%u (%qu bytes) %@"), self->_count, self->_numBytes, self->_name);
      }
      else
      {
        v7 = v5 * 0.00097656;
        if ((float)(v5 * 0.00097656) >= 10.0)
        {
          count = self->_count;
          if (v7 >= 100.0)
            objc_msgSend(v11, "appendFormat:", CFSTR("%u (%.0fK) %@"), count, v7, self->_name);
          else
            objc_msgSend(v11, "appendFormat:", CFSTR("%u (%.1fK) %@"), count, v7, self->_name);
        }
        else
        {
          objc_msgSend(v11, "appendFormat:", CFSTR("%u (%.2fK) %@"), self->_count, v7, self->_name);
        }
      }
    }
    else
    {
      v6 = v5 * 0.00000095367;
      if ((float)(v5 * 0.00000095367) >= 10.0)
      {
        v8 = self->_count;
        if (v6 >= 100.0)
          objc_msgSend(v11, "appendFormat:", CFSTR("%u (%.0fM) %@"), v8, v6, self->_name);
        else
          objc_msgSend(v11, "appendFormat:", CFSTR("%u (%.1fM) %@"), v8, v6, self->_name);
      }
      else
      {
        objc_msgSend(v11, "appendFormat:", CFSTR("%u (%.2fM) %@"), self->_count, v6, self->_name);
      }
    }
  }
  else
  {
    objc_msgSend(v11, "appendFormat:", CFSTR("%d %@"), self->_count, self->_name, v10);
  }

}

- (id)browserName
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[VMUCallTreeNode getBrowserName:](self, "getBrowserName:", v3);
  return v3;
}

- (BOOL)isPseudo
{
  return 0;
}

- (id)pseudoName
{
  return self->_name;
}

- (BOOL)symbolNameIsUnknown
{
  return -[NSString hasPrefix:](self->_name, "hasPrefix:", kVMUUnknownSymbolName[0]);
}

- (BOOL)isMallocBlockContentNode
{
  return !self->_address && -[NSString hasPrefix:](self->_name, "hasPrefix:", CFSTR("CONTENT:"));
}

- (id)nameWithoutOffset
{
  uint64_t v3;
  NSString *name;
  NSString *v5;

  v3 = -[NSString rangeOfString:](self->_name, "rangeOfString:", CFSTR(" + "));
  name = self->_name;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = name;
  }
  else
  {
    -[NSString substringToIndex:](name, "substringToIndex:");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)nameWithStringsForSymbol:(id)a3 library:(id)a4 loadAddress:(id)a5 offset:(id)a6 address:(id)a7 suffix:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v13)
    objc_msgSend(v18, "appendFormat:", CFSTR("%@%@%@"), CFSTR("  (in "), v13, CFSTR(")"));
  if (v14)
    objc_msgSend(v19, "appendFormat:", CFSTR("%@%@"), CFSTR("  load address "), v14);
  if (v15)
    objc_msgSend(v19, "appendFormat:", CFSTR("%@%@"), CFSTR(" + "), v15);
  if (v16)
    objc_msgSend(v19, "appendFormat:", CFSTR("%@%@%@"), CFSTR("  ["), v16, CFSTR("]"));
  if (v17)
    objc_msgSend(v19, "appendString:", v17);

  return v19;
}

- (void)parseNameIntoSymbol:(id *)a3 library:(id *)a4 loadAddress:(unint64_t *)a5 offset:(unint64_t *)a6 address:(unint64_t *)a7 suffix:(id *)a8
{
  void *v14;
  void *v15;
  id v16;

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  if (a8)
    *a8 = 0;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", self->_name);
  objc_msgSend(v16, "setCharactersToBeSkipped:", 0);
  objc_msgSend(v16, "scanUpToString:intoString:", CFSTR("  (in "), a3);
  objc_msgSend(v16, "scanString:intoString:", CFSTR("  (in "), 0);
  objc_msgSend(v16, "scanUpToString:intoString:", CFSTR(")"), a4);
  objc_msgSend(v16, "scanString:intoString:", CFSTR(")"), 0);
  if (objc_msgSend(v16, "scanString:intoString:", CFSTR("  load address "), 0))
    objc_msgSend(v16, "scanHexLongLong:", a5);
  if (objc_msgSend(v16, "scanString:intoString:", CFSTR(" + "), 0)
    && (objc_msgSend(v16, "scanHexLongLong:", a6) & 1) == 0)
  {
    objc_msgSend(v16, "scanLongLong:", a6);
  }
  if (objc_msgSend(v16, "scanString:intoString:", CFSTR("  ["), 0))
  {
    objc_msgSend(v16, "scanHexLongLong:", a7);
    objc_msgSend(v16, "scanString:intoString:", CFSTR("]"), 0);
  }
  v14 = v16;
  if (a8)
  {
    objc_msgSend(v16, "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v16, "scanLocation"));
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    v14 = v16;
  }

}

- (id)findOrAddChildWithName:(id)a3 address:(unint64_t)a4 nodeSearchType:(int)a5 isLeafNode:(BOOL)a6
{
  id v9;
  void *v10;
  uint64_t numChildren;
  void **p_children;
  uint64_t v13;
  void *v14;
  id v15;

  v9 = a3;
  v10 = v9;
  numChildren = self->_numChildren;
  p_children = &self->_children;
  if (numChildren >= 2)
    p_children = (void **)*p_children;
  if (a5 == 2)
  {
    if ((_DWORD)numChildren)
    {
      v13 = 0;
      while (!objc_msgSend(*((id *)p_children[v13] + 2), "isEqualToString:", v10))
      {
        if (++v13 >= (unint64_t)self->_numChildren)
          goto LABEL_13;
      }
      v15 = p_children[v13];
      goto LABEL_16;
    }
  }
  else if (a5 == 1 && (_DWORD)numChildren)
  {
    while (*((id *)*p_children + 2) != v9)
    {
      ++p_children;
      if (!--numChildren)
        goto LABEL_13;
    }
    v15 = *p_children;
LABEL_16:
    v14 = v15;
    goto LABEL_17;
  }
LABEL_13:
  objc_msgSend((id)objc_opt_class(), "nodeWithName:address:count:numBytes:", v10, a4, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUCallTreeNode addChild:](self, "addChild:", v14);
LABEL_17:

  return v14;
}

- (id)findOrAddChildWithName:(id)a3 address:(unint64_t)a4
{
  return -[VMUCallTreeNode findOrAddChildWithName:address:nodeSearchType:isLeafNode:](self, "findOrAddChildWithName:address:nodeSearchType:isLeafNode:", a3, a4, 2, 0);
}

- (int64_t)compareSizeAndCount:(id)a3
{
  int64_t v3;
  BOOL v4;
  int64_t v5;

  v3 = *((_QWORD *)a3 + 4) - self->_numBytes;
  if (!v3)
    v3 = *((unsigned int *)a3 + 10) - (unint64_t)self->_count;
  v4 = v3 < 0;
  v5 = v3 != 0;
  if (v4)
    return -1;
  else
    return v5;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  NSComparisonResult v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t address;
  unint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v4 = a3;
  v5 = -[VMUCallTreeNode compareSizeAndCount:](self, "compareSizeAndCount:", v4);
  if (v5 == NSOrderedSame)
  {
    if (self->_address && -[NSString containsString:](self->_name, "containsString:", CFSTR("  (in ")))
    {
      v6 = (void *)MEMORY[0x1A85A9758]();
      v20 = 0;
      v21 = 0;
      v19 = 0;
      -[VMUCallTreeNode parseNameIntoSymbol:library:loadAddress:offset:address:suffix:](self, "parseNameIntoSymbol:library:loadAddress:offset:address:suffix:", &v21, &v20, 0, 0, 0, &v19);
      v7 = v21;
      v8 = v20;
      v9 = v19;
      v17 = 0;
      v18 = 0;
      v16 = 0;
      objc_msgSend(v4, "parseNameIntoSymbol:library:loadAddress:offset:address:suffix:", &v18, &v17, 0, 0, 0, &v16);
      v10 = v18;
      v11 = v17;
      v12 = v16;
      if (v7)
      {
        if (v10)
        {
          v5 = objc_msgSend(v7, "compare:", v10);
          if (v5)
            goto LABEL_22;
        }
      }
      if (v8)
      {
        if (v11)
        {
          v5 = objc_msgSend(v8, "compare:", v11);
          if (v5)
            goto LABEL_22;
        }
      }
      if (v9)
      {
        if (v12)
        {
          v5 = objc_msgSend(v9, "compare:", v12);
          if (v5)
            goto LABEL_22;
        }
      }
      if (-[VMUCallTreeNode numChildren](self, "numChildren") && !objc_msgSend(v4, "numChildren"))
        goto LABEL_17;
      if (!-[VMUCallTreeNode numChildren](self, "numChildren") && objc_msgSend(v4, "numChildren"))
      {
        v5 = NSOrderedDescending;
        goto LABEL_22;
      }
      address = self->_address;
      v14 = v4[3];
      if (address >= v14)
        v5 = (unint64_t)(address > v14);
      else
LABEL_17:
        v5 = NSOrderedAscending;
LABEL_22:

      objc_autoreleasePoolPop(v6);
      goto LABEL_23;
    }
    v5 = -[NSString compare:](self->_name, "compare:", v4[2]);
  }
LABEL_23:

  return v5;
}

- (int64_t)comparePuttingRetainCycleNodesAtTop:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  int v11;
  int v12;
  int64_t v13;

  v4 = (id *)a3;
  -[VMUCallTreeNode parent](self, "parent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    objc_msgSend(v4, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_13;
  }
  v9 = v4[4];
  if (!self->_numBytes)
  {
    if (v9)
    {
      v13 = -1;
      goto LABEL_15;
    }
LABEL_13:
    v13 = -[VMUCallTreeNode compare:](self, "compare:", v4);
    goto LABEL_15;
  }
  if (!v9)
  {
    v13 = 1;
    goto LABEL_15;
  }
  v10 = -[NSString containsString:](self->_name, "containsString:", kVMURootRetainCycle[0]);
  v11 = objc_msgSend(v4[2], "containsString:", kVMURootRetainCycle[0]);
  v12 = !v10;
  if (v11 | !v10)
    v13 = 1;
  else
    v13 = -1;
  if (v11 != v12)
    goto LABEL_13;
LABEL_15:

  return v13;
}

- (int64_t)comparePuttingMainThreadFirst:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;

  v4 = (id *)a3;
  -[VMUCallTreeNode name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasPrefix:", kVMUThreadNamePrefix)
    && ((objc_msgSend(v5, "rangeOfString:", kVMUMainThreadName[0]), v7)
     || (objc_msgSend(v5, "rangeOfString:", kVMUMainThreadDispatchQueueName), v8)))
  {
    v9 = -1;
  }
  else if (objc_msgSend(v6, "hasPrefix:", kVMUThreadNamePrefix)
         && ((objc_msgSend(v6, "rangeOfString:", kVMUMainThreadName[0]), v10)
          || (objc_msgSend(v6, "rangeOfString:", kVMUMainThreadDispatchQueueName), v11)))
  {
    v9 = 1;
  }
  else
  {
    v9 = -[VMUCallTreeNode compareSizeAndCount:](self, "compareSizeAndCount:", v4);
    if (!v9)
    {
      v12 = objc_msgSend((id)kVMUThreadNamePrefix, "length");
      if (-[NSString length](self->_name, "length") <= v12)
      {
        v14 = 0;
      }
      else
      {
        -[NSString substringFromIndex:](self->_name, "substringFromIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "longLongValue");

      }
      if (objc_msgSend(v4[2], "length") <= v12)
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(v4[2], "substringFromIndex:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "longLongValue");

      }
      if (v14 < v16)
        v9 = -1;
      else
        v9 = 1;
    }
  }

  return v9;
}

- (id)pseudoNodeTopOfStackChild
{
  unsigned int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int count;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = -[VMUCallTreeNode numChildren](self, "numChildren");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    do
    {
      -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v5 += *(_DWORD *)(v8 + 40);
      v6 += *(_QWORD *)(v8 + 32);

      v7 = (v7 + 1);
    }
    while (v4 != (_DWORD)v7);
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  count = self->_count;
  v10 = count - v5;
  if (count == v5)
  {
    v11 = 0;
  }
  else
  {
    v12 = self->_numBytes - v6;
    -[VMUCallTreeNode pseudoName](self, "pseudoName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUCallTreeNode nodeWithName:address:count:numBytes:](VMUCallTreePseudoNode, "nodeWithName:address:count:numBytes:", v13, self->_address, v10, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)sortedChildrenWithPseudoNode:(id)a3 withCompare:(SEL)a4
{
  id v6;
  unsigned int numChildren;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  numChildren = self->_numChildren;
  if (!v6)
  {
    if (numChildren == 1)
    {
      v15[0] = self->_children;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (numChildren)
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", self->_children);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sortedArrayUsingSelector:", a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  if (!numChildren)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v11 = (void *)v12;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_numChildren)
  {
    v9 = 0;
    do
    {
      -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

      v9 = (v9 + 1);
    }
    while (v9 < self->_numChildren);
  }
  objc_msgSend(v8, "sortedArrayUsingSelector:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v11;
}

- (id)sortedChildrenWithPseudoNode
{
  unsigned int numChildren;
  void *v4;
  _DWORD *v5;
  void *v6;
  void *v7;

  numChildren = self->_numChildren;
  if (numChildren == 1)
  {
    v5 = self->_children;
    v6 = v5;
    if (v5 && v5[10] == self->_count)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      return v4;
    }
LABEL_8:
    -[VMUCallTreeNode pseudoNodeTopOfStackChild](self, "pseudoNodeTopOfStackChild");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUCallTreeNode sortedChildrenWithPseudoNode:withCompare:](self, "sortedChildrenWithPseudoNode:withCompare:", v7, sel_compare_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (numChildren)
  {
    v6 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)largestTopOfStackPath
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  VMUCallTreeNode *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = self;
  -[VMUCallTreeNode sortedChildrenWithPseudoNode](self, "sortedChildrenWithPseudoNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "largestTopOfStackPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v11, "lastObject");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = v10;
        }
        v13 = v12;
        v14 = objc_msgSend(v12, "count");
        if (v14 > v7)
        {
          v15 = v14;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count") + 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "addObject:", v18);
          objc_msgSend(v16, "addObjectsFromArray:", v11);
          v7 = v15;
          v3 = v16;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_printCallTreeToFile:(__sFILE *)a3 cumulativeOutput:(id)a4 indentString:(id)a5 branchPointCount:(unsigned int)a6 topFunctions:(id)a7 options:(unint64_t)a8
{
  id v12;
  NSMapTable *v13;
  void *v14;
  id *v15;
  id *v16;
  id v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  unsigned int v23;
  id v24;
  VMUCallTreeNode *v25;
  const char *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  char v37;
  char *v38;
  void *v39;
  id v40;
  id *v41;
  void *v42;
  uint64_t v43;
  unsigned int v44;
  void *v45;
  NSMapTable *table;
  BOOL v48;
  void *v50;
  id v51;

  v51 = a4;
  v12 = a5;
  v13 = (NSMapTable *)a7;
  v14 = (void *)MEMORY[0x1A85A9758]();
  table = v13;
  if (v13 || (a8 & 1) != 0)
  {
    -[VMUCallTreeNode pseudoNodeTopOfStackChild](self, "pseudoNodeTopOfStackChild");
    v16 = (id *)objc_claimAutoreleasedReturnValue();
    v15 = v16;
    if (v16)
    {
      if (v13)
      {
        if (objc_msgSend(v16, "symbolNameIsUnknown"))
        {
          v17 = v15[2];
        }
        else
        {
          objc_msgSend(v15, "nameWithoutOffset");
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;
        v19 = NSMapGet(table, v17);
        if (!v19)
        {
          v19 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
          *v19 = 0;
          v19[1] = 0;
          NSMapInsertKnownAbsent(table, v18, v19);
        }
        v20 = (uint64_t)v15[4] + v19[1];
        *v19 += *((unsigned int *)v15 + 10);
        v19[1] = v20;

      }
      if (!-[VMUCallTreeNode numChildren](self, "numChildren"))
        goto LABEL_76;
    }
  }
  else
  {
    v15 = 0;
  }
  v21 = sel_compare_;
  if ((a8 & 0x80) == 0)
  {
    if ((a8 & 0x40) != 0)
    {
      v21 = sel_comparePuttingRetainCycleNodesAtTop_;
    }
    else if (!self->_parent
           || !self->_numChildren && -[NSString hasPrefix:](self->_name, "hasPrefix:", kVMUThreadNamePrefix))
    {
      v21 = sel_comparePuttingMainThreadFirst_;
    }
  }
  if ((a8 & 1) == 0)
  {

    v15 = 0;
  }
  -[VMUCallTreeNode sortedChildrenWithPseudoNode:withCompare:](self, "sortedChildrenWithPseudoNode:withCompare:", v15, v21);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v45, "count");
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 1024);
  if (v22 <= 1)
    v23 = a6;
  else
    v23 = a6 + 1;
  v44 = v23;
  -[VMUCallTreeNode parent](self, "parent");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v42 = v14;
  if (v24)
  {
    v25 = self;
  }
  else
  {
    v25 = self;
    if (-[VMUCallTreeNode numBytes](self, "numBytes"))
    {
      if (-[VMUCallTreeNode numChildren](self, "numChildren") < 2)
        goto LABEL_28;
      if (v51)
        v40 = v51;
      else
        v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 256);
      v24 = v40;
      if (v12)
        objc_msgSend(v40, "appendString:", v12);
      -[VMUCallTreeNode getBrowserName:](self, "getBrowserName:", v50);
      objc_msgSend(v24, "appendFormat:", CFSTR("%@%@\n"), v50, kVMURootNodeNameForMallocCallTrees[0]);
      objc_msgSend(v12, "appendString:", CFSTR("  "));
      if (!v51)
      {
        v24 = objc_retainAutorelease(v24);
        fputs((const char *)objc_msgSend(v24, "UTF8String"), a3);
      }
    }
  }

LABEL_28:
  v41 = v15;
  if ((a8 & 8) != 0)
    v26 = "   ";
  else
    v26 = "  ";
  v27 = v50;
  if (v22)
  {
    v28 = 0;
    v48 = 0;
    v29 = 2;
    if ((a8 & 8) != 0)
      v29 = 3;
    v43 = v29;
    do
    {
      objc_msgSend(v45, "objectAtIndex:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1A85A9758]();
      if (v51)
        v32 = v51;
      else
        v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 256);
      v33 = v32;
      -[VMUCallTreeNode parent](v25, "parent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34 || -[VMUCallTreeNode numChildren](v25, "numChildren") < 2)
      {

      }
      else if (objc_msgSend(v30, "numChildren") != 0 || v48)
      {
        if ((a8 & 2) != 0)
        {
          objc_msgSend(v33, "appendString:", CFSTR("\n"));
        }
        else if ((a8 & 4) != 0)
        {
          objc_msgSend(v33, "appendFormat:", CFSTR("%@----\n"), v12);
        }
      }
      v48 = objc_msgSend(v30, "numChildren") != 0;
      if (v12)
        objc_msgSend(v33, "appendString:", v12);
      -[VMUCallTreeNode parent](v25, "parent");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      if (v28 == 10 && v35 && v22 >= 0xC && objc_msgSend(v30, "numChildren") <= 1)
      {
        v37 = objc_msgSend(v30, "isMallocBlockContentNode");

        if ((v37 & 1) != 0)
        {
          objc_msgSend(v33, "appendFormat:", CFSTR("%lu ADDITIONAL CHILDREN\n"), v22 - 10);

          objc_autoreleasePoolPop(v31);
          v27 = v50;
          break;
        }
      }
      else
      {

      }
      v27 = v50;
      if ((a8 & 0x40) != 0 && !objc_msgSend(v30, "count"))
      {
        objc_msgSend(v30, "name");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setString:", v39);

        v27 = v50;
      }
      else
      {
        objc_msgSend(v30, "getBrowserName:", v50);
      }
      v25 = self;
      objc_msgSend(v33, "appendFormat:", CFSTR("%@\n"), v27);
      if (v12)
      {
        v38 = (char *)v26;
        if ((a8 & 8) == 0)
        {
          v38 = (char *)v26;
          if (v22 >= 2)
          {
            v38 = (char *)v26;
            if (v28 < v22 - 1)
              v38 = off_1E4E01DA8[v44 & 3];
          }
        }
        objc_msgSend(v12, "appendFormat:", CFSTR("%s"), v38);
      }
      if (!v51)
        fputs((const char *)objc_msgSend(objc_retainAutorelease(v33), "UTF8String"), a3);

      objc_autoreleasePoolPop(v31);
      objc_msgSend(v30, "_printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:", a3, v51, v12, v44, table, a8);
      if (v12)
        objc_msgSend(v12, "deleteCharactersInRange:", objc_msgSend(v12, "length") - v43);

      ++v28;
    }
    while (v22 != v28);
  }

  v15 = v41;
  v14 = v42;
LABEL_76:

  objc_autoreleasePoolPop(v14);
}

- (void)countFunctionOccurrencesInTree:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "addObject:", self->_name);
  v4 = -[VMUCallTreeNode numChildren](self, "numChildren");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    do
    {
      -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "countFunctionOccurrencesInTree:", v8);

      v6 = (v6 + 1);
    }
    while (v5 != (_DWORD)v6);
  }

}

- (id)fullOutputWithThreshold:(unsigned int)a3 showPseudoNodes:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  VMUCallTreeNode *v11;
  id v12;
  void *v13;
  NSMapTable *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  unint64_t v22;
  id v23;
  NSMapTable *v24;
  void *v25;
  NSMapTable *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  const void *v33;
  unint64_t v34;
  void *context;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, void *, void *);
  void *v46;
  NSMapTable *v47;
  _BYTE v48[128];
  uint64_t v49;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v49 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 259);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", CFSTR("Call graph:\n"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 128);
  objc_msgSend(v9, "setString:", kVMUCallTreeInitialIndentation);
  v37 = (void *)v8;
  v38 = v9;
  -[VMUCallTreeNode _printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:](self, "_printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:", 0, v7, v9, 0, v8, v4);
  objc_msgSend(v7, "appendString:", CFSTR("\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("Total number in stack (recursive counted multiple, when >=%d):\n"), v5);
  v10 = v7;
  v11 = self;
  context = (void *)MEMORY[0x1A85A9758]();
  v12 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  -[VMUCallTreeNode countFunctionOccurrencesInTree:](v11, "countFunctionOccurrencesInTree:", v12);
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = MEMORY[0x1E0C809B0];
  v44 = 3221225472;
  v45 = __printTotalNumberInStack_block_invoke;
  v46 = &unk_1E4E01DD0;
  v14 = (NSMapTable *)v12;
  v47 = v14;
  objc_msgSend(v13, "sortedArrayUsingComparator:", &v43);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        v22 = -[NSMapTable countForObject:](v14, "countForObject:", v21);
        if (v22 >= v5)
          objc_msgSend(v10, "appendFormat:", CFSTR("        %lu       %@\n"), v22, v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v18);
  }

  objc_msgSend(v10, "appendFormat:", CFSTR("\n"));
  objc_autoreleasePoolPop(context);

  objc_msgSend(v10, "appendString:", CFSTR("Sort by top of stack, same collapsed (when >= 5):\n"));
  v23 = v10;
  v24 = v37;
  NSAllMapTableKeys(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = MEMORY[0x1E0C809B0];
  v44 = 3221225472;
  v45 = __printCollapsedTops_block_invoke;
  v46 = &unk_1E4E01DD0;
  v26 = v24;
  v47 = v26;
  objc_msgSend(v25, "sortedArrayUsingComparator:", &v43);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v28 = v27;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(v28);
        v33 = *(const void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        v34 = *(_QWORD *)NSMapGet(v26, v33);
        if (v34 >= 5)
          objc_msgSend(v23, "appendFormat:", CFSTR("        %@        %lu\n"), v33, v34);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v30);
  }

  return v23;
}

- (id)fullOutputWithThreshold:(unsigned int)a3
{
  return -[VMUCallTreeNode fullOutputWithThreshold:showPseudoNodes:](self, "fullOutputWithThreshold:showPseudoNodes:", *(_QWORD *)&a3, 1);
}

- (BOOL)callTreeHasBranches
{
  VMUCallTreeNode *v2;
  id *p_isa;
  unsigned int v4;
  id *v5;
  BOOL v6;

  v2 = self;
  if (!v2)
    return 0;
  p_isa = (id *)&v2->super.isa;
  do
  {
    v4 = objc_msgSend(p_isa, "numChildren");
    if (v4 != 1)
      break;
    v5 = (id *)p_isa[6];

    p_isa = v5;
  }
  while (v5);
  v6 = v4 > 1;

  return v6;
}

- (id)stringFromCallTreeWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_new();
  if ((a3 & 0x10) != 0 || -[VMUCallTreeNode callTreeHasBranches](self, "callTreeHasBranches"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 128);
    v7 = v6;
    if ((a3 & 0x20) == 0)
      objc_msgSend(v6, "setString:", kVMUCallTreeInitialIndentation);
  }
  else
  {
    v7 = 0;
  }
  -[VMUCallTreeNode _printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:](self, "_printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:", 0, v5, v7, 0, 0, a3);

  return v5;
}

- (id)stringFromCallTreeIndentIfNoBranches:(BOOL)a3 showPseudoNodes:(BOOL)a4
{
  uint64_t v4;

  v4 = 16;
  if (!a3)
    v4 = 0;
  return -[VMUCallTreeNode stringFromCallTreeWithOptions:](self, "stringFromCallTreeWithOptions:", v4 | a4);
}

- (id)stringFromCallTreeIndentIfNoBranches:(BOOL)a3
{
  return -[VMUCallTreeNode stringFromCallTreeIndentIfNoBranches:showPseudoNodes:](self, "stringFromCallTreeIndentIfNoBranches:showPseudoNodes:", a3, 1);
}

- (void)printCallTreeToFile:(__sFILE *)a3 cumulativeOutput:(id)a4 options:(unint64_t)a5
{
  objc_class *v8;
  id v9;
  id v10;

  v8 = (objc_class *)MEMORY[0x1E0CB37A0];
  v9 = a4;
  v10 = (id)objc_msgSend([v8 alloc], "initWithCapacity:", 128);
  objc_msgSend(v10, "setString:", kVMUCallTreeInitialIndentation);
  -[VMUCallTreeNode _printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:](self, "_printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:", a3, v9, v10, 0, 0, a5);

}

- (void)printCallTreeToFile:(__sFILE *)a3
{
  -[VMUCallTreeNode printCallTreeToFile:cumulativeOutput:options:](self, "printCallTreeToFile:cumulativeOutput:options:", a3, 0, 0);
}

- (void)printCallTree
{
  -[VMUCallTreeNode printCallTreeToFile:](self, "printCallTreeToFile:", *MEMORY[0x1E0C80C20]);
}

- (id)invertedNode
{
  VMUCallTreeNode *v3;
  NSString *name;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;

  v3 = objc_alloc_init(VMUCallTreeNode);
  name = v3->_name;
  v3->_name = (NSString *)&stru_1E4E04720;

  v5 = (void *)MEMORY[0x1A85A9758]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VMUCallTreeNode numChildren](self, "numChildren");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    do
    {
      -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      invertRecursiveWithNewInvertedRoot(v10, v3, v6);

      v9 = (v9 + 1);
    }
    while (v8 != (_DWORD)v9);
  }

  objc_autoreleasePoolPop(v5);
  return v3;
}

- (id)filterOutSymbols:(id)a3 required:(id)a4
{
  id v6;
  id v7;
  VMUCallTreeNode *v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  _DWORD *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  int v21;
  void *v22;
  _QWORD *v23;
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  if (-[NSString length](self->_name, "length") && (objc_msgSend(v6, "containsObject:", self->_name) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v26 = 0;
    -[VMUCallTreeNode parseNameIntoSymbol:library:loadAddress:offset:address:suffix:](self, "parseNameIntoSymbol:library:loadAddress:offset:address:suffix:", &v26, 0, 0, 0, 0, 0);
    v9 = v26;
    if (objc_msgSend(v9, "length") && (objc_msgSend(v6, "containsObject:", v9) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      if (v7 && objc_msgSend(v7, "containsObject:", v9))
      {

        v7 = 0;
      }
      v10 = -[VMUCallTreeNode numChildren](self, "numChildren");
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = 0;
        do
        {
          -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v12);
          v14 = (_DWORD *)objc_claimAutoreleasedReturnValue();
          v13 += v14[10];

          v12 = (v12 + 1);
        }
        while (v11 != (_DWORD)v12);
        v25 = v9;
        if (v13 == self->_count
          || (-[VMUCallTreeNode pseudoName](self, "pseudoName"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v6, "containsObject:", v15),
              v15,
              (v16 & 1) != 0))
        {
          v17 = 0;
        }
        else
        {
          v17 = self->_count - v13;
        }
        v18 = 0;
        v19 = 0;
        v20 = 0;
        if (v11 <= 1)
          v21 = 1;
        else
          v21 = v11;
        do
        {
          -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v18, v25);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "filterOutSymbols:required:", v6, v7);
          v23 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            if (!v19)
              v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v19, "addObject:", v23);
            v17 = objc_msgSend(v23, "count") + v17;
            v20 += v23[4];
          }

          v18 = (v18 + 1);
        }
        while (v21 != (_DWORD)v18);
        if (!-[NSString length](self->_name, "length") || (_DWORD)v17)
        {
          objc_msgSend((id)objc_opt_class(), "nodeWithName:address:count:numBytes:", self->_name, self->_address, v17, v20);
          v8 = (VMUCallTreeNode *)objc_claimAutoreleasedReturnValue();
          -[VMUCallTreeNode setChildren:](v8, "setChildren:", v19);
        }
        else
        {
          v8 = 0;
        }
        v9 = v25;

      }
      else
      {
        v8 = self;
      }
    }

  }
  return v8;
}

- (id)filterOutSymbols:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithArray:", v5);

  -[VMUCallTreeNode filterOutSymbols:required:](self, "filterOutSymbols:required:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)chargeLibrariesInSet:(id)a3 toCaller:(id)a4 parentLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A85A9758]();
  v22 = 0;
  -[VMUCallTreeNode parseNameIntoSymbol:library:loadAddress:offset:address:suffix:](self, "parseNameIntoSymbol:library:loadAddress:offset:address:suffix:", 0, &v22, 0, 0, 0, 0);
  v12 = v22;
  if (!objc_msgSend(v12, "length"))
    goto LABEL_9;
  if (v8)
  {
    if ((objc_msgSend(v8, "containsObject:", v12) & 1) != 0)
      goto LABEL_4;
LABEL_9:
    v14 = v10;
    if (v9)
    {
LABEL_7:
      objc_msgSend(v9, "findOrAddChildWithName:address:nodeSearchType:isLeafNode:", self->_name, self->_address, 1, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(v15 + 40) += self->_count;
      *(_QWORD *)(v15 + 32) += self->_numBytes;

      v9 = (id)v15;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (!isSystemPath((const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String")))
    goto LABEL_9;
LABEL_4:
  if (v10)
  {
    v13 = objc_msgSend(v12, "isEqualToString:", v10);
    v14 = v12;

    if ((v13 & 1) != 0)
      goto LABEL_12;
    if (v9)
      goto LABEL_7;
LABEL_10:
    objc_msgSend((id)objc_opt_class(), "nodeWithName:address:count:numBytes:", self->_name, self->_address, self->_count, self->_numBytes);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v14 = 0;
LABEL_12:
  v16 = -[VMUCallTreeNode numChildren](self, "numChildren");
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    do
    {
      -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v19, "chargeLibrariesInSet:toCaller:parentLibrary:", v8, v9, v14);

      v18 = (v18 + 1);
    }
    while (v17 != (_DWORD)v18);
  }

  objc_autoreleasePoolPop(v11);
  return v9;
}

- (id)chargeLibrariesToCallers:(id)a3 keepBoundaries:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E60];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithArray:", v7);

  if (v4)
    v9 = CFSTR("KEEP-BOUNDARIES PLACEHOLDER");
  else
    v9 = 0;
  -[VMUCallTreeNode chargeLibrariesInSet:toCaller:parentLibrary:](self, "chargeLibrariesInSet:toCaller:parentLibrary:", v8, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)pruneCount:(unsigned int)a3
{
  VMUCallTreeNode *v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  _DWORD *v10;
  void *v11;
  void *v12;

  if (self->_count >= a3)
  {
    v4 = *(_QWORD *)&a3;
    v6 = -[VMUCallTreeNode numChildren](self, "numChildren");
    if (v6)
    {
      v7 = v6;
      objc_msgSend((id)objc_opt_class(), "nodeWithName:address:count:numBytes:", self->_name, self->_address, self->_count, self->_numBytes);
      v3 = (VMUCallTreeNode *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = 0;
      do
      {
        -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v9);
        v10 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10[10] >= v4)
        {
          objc_msgSend(v10, "pruneCount:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v12);

        }
        v9 = (v9 + 1);
      }
      while (v7 != (_DWORD)v9);
      -[VMUCallTreeNode setChildren:](v3, "setChildren:", v8);

    }
    else
    {
      v3 = self;
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)pruneMallocSize:(unint64_t)a3
{
  VMUCallTreeNode *v3;
  unsigned int v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;

  if (self->_numBytes >= a3)
  {
    v6 = -[VMUCallTreeNode numChildren](self, "numChildren");
    if (v6)
    {
      v7 = v6;
      objc_msgSend((id)objc_opt_class(), "nodeWithName:address:count:numBytes:", self->_name, self->_address, self->_count, self->_numBytes);
      v3 = (VMUCallTreeNode *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = 0;
      do
      {
        -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v9);
        v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10[4] >= a3)
        {
          objc_msgSend(v10, "pruneMallocSize:", a3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v12);

        }
        v9 = (v9 + 1);
      }
      while (v7 != (_DWORD)v9);
      -[VMUCallTreeNode setChildren:](v3, "setChildren:", v8);

    }
    else
    {
      v3 = self;
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
