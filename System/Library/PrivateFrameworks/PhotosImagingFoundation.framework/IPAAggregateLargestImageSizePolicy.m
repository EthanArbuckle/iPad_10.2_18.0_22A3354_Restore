@implementation IPAAggregateLargestImageSizePolicy

- (IPAAggregateLargestImageSizePolicy)initWithPolicies:(id)a3
{
  id v5;
  IPAAggregateLargestImageSizePolicy *v6;
  IPAAggregateLargestImageSizePolicy *v7;
  IPAAggregateLargestImageSizePolicy *v9;
  SEL v10;
  objc_super v11;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v11.receiver = self;
    v11.super_class = (Class)IPAAggregateLargestImageSizePolicy;
    v6 = -[IPAAggregateLargestImageSizePolicy init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_policies, a3);

    return v7;
  }
  else
  {
    v9 = (IPAAggregateLargestImageSizePolicy *)_PFAssertFailHandler();
    return (IPAAggregateLargestImageSizePolicy *)-[IPAAggregateLargestImageSizePolicy isBestFitPolicy](v9, v10);
  }
}

- (BOOL)isBestFitPolicy
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_policies;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isBestFitPolicy", (_QWORD)v9))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (CGSize)transformSize:(CGSize)a3
{
  double height;
  double width;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v22 = *MEMORY[0x1E0C80C00];
  if (a3.width < 0.0 || a3.height < 0.0)
  {
    NSStringFromSize(a3);
    objc_claimAutoreleasedReturnValue();
    _PFAssertFailHandler();
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_policies;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "transformSize:", width, height);
        if (v13 * v14 > v10)
        {
          v9 = v14;
          v10 = v13 * v14;
          v11 = v13;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
    v11 = 0.0;
  }

  v15 = v11;
  v16 = v9;
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)transformScaleForSize:(CGSize)a3
{
  double height;
  double width;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  height = a3.height;
  width = a3.width;
  v18 = *MEMORY[0x1E0C80C00];
  if (a3.width < 0.0 || a3.height < 0.0)
  {
    NSStringFromSize(a3);
    objc_claimAutoreleasedReturnValue();
    _PFAssertFailHandler();
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_policies;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "transformScaleForSize:", width, height);
        if (v11 > v9)
          v9 = v11;
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> %@"), objc_opt_class(), self, self->_policies);
}

- (IPAAggregateLargestImageSizePolicy)initWithCoder:(id)a3
{
  id v3;
  IPAAggregateLargestImageSizePolicy *v4;
  uint64_t v5;
  NSArray *policies;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPAAggregateLargestImageSizePolicy;
  v3 = a3;
  v4 = -[IPAImageSizePolicy initWithCoder:](&v8, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("policies"), v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();

  policies = v4->_policies;
  v4->_policies = (NSArray *)v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IPAAggregateLargestImageSizePolicy;
  v4 = a3;
  -[IPAImageSizePolicy encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_policies, CFSTR("policies"), v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  return -[NSArray isEqualToArray:](self->_policies, "isEqualToArray:", *((_QWORD *)a3 + 1));
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_policies, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
}

@end
