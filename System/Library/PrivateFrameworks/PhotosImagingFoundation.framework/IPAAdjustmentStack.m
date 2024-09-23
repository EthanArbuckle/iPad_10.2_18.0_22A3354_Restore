@implementation IPAAdjustmentStack

- (IPAAdjustmentStack)init
{
  IPAAdjustmentStack *v2;
  IPAAdjustmentStack *v3;
  NSArray *adjustments;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IPAAdjustmentStack;
  v2 = -[IPAAdjustmentStack init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    adjustments = v2->_adjustments;
    v2->_adjustments = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[IPAAdjustmentStack versionInfo](self, "versionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVersionInfo:", v5);

  -[IPAAdjustmentStack adjustments](self, "adjustments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustments:", v6);

  return v4;
}

- (id)minimumVersionForFormat:(id)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[IPAAdjustmentStack isEqualToAdjustmentStack:](self, "isEqualToAdjustmentStack:", v4);

  return v5;
}

- (BOOL)isEqualToAdjustmentStack:(id)a3
{
  NSArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;

  v4 = self->_adjustments;
  objc_msgSend(a3, "adjustments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSArray count](v4, "count");
  if (v6 == objc_msgSend(v5, "count"))
  {
    if (v6)
    {
      v7 = 0;
      v8 = v6 - 1;
      do
      {
        -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToAdjustment:", v10);

        if (!v11)
          break;
      }
      while (v8 != v7++);
    }
    else
    {
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p "), objc_opt_class(), self);
  -[IPAAdjustmentStack versionInfo](self, "versionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("versionInfo=%@"), v4);

  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_adjustments;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "debugDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("adjustments=[%@]"), v12);

  -[IPAAdjustmentStack _debugDescriptionSuffix](self, "_debugDescriptionSuffix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" "));
    objc_msgSend(v3, "appendString:", v13);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));

  return v3;
}

- (id)_debugDescriptionSuffix
{
  return 0;
}

- (IPAAdjustmentVersionInfo)versionInfo
{
  return self->_versionInfo;
}

- (void)setVersionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)adjustments
{
  return self->_adjustments;
}

- (void)setAdjustments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustments, 0);
  objc_storeStrong((id *)&self->_versionInfo, 0);
}

@end
