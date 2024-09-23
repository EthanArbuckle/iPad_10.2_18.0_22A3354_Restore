@implementation TVRCPINEntryAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCPINEntryAttributes)initWithDigitCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  TVRCPINEntryAttributes *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TVRCPINEntryAttributes initWithGroupLengths:](self, "initWithGroupLengths:", v5);

  return v6;
}

- (TVRCPINEntryAttributes)initWithGroupLengths:(id)a3
{
  id v4;
  TVRCPINEntryAttributes *v5;
  uint64_t v6;
  NSArray *groupLengths;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRCPINEntryAttributes;
  v5 = -[TVRCPINEntryAttributes init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    groupLengths = v5->_groupLengths;
    v5->_groupLengths = (NSArray *)v6;

  }
  return v5;
}

- (TVRCPINEntryAttributes)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  TVRCPINEntryAttributes *v9;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("groupLengths"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[TVRCPINEntryAttributes initWithGroupLengths:](self, "initWithGroupLengths:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_groupLengths, CFSTR("groupLengths"));
}

- (unint64_t)totalDigitCount
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_groupLengths;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfDigitGroups
{
  return -[NSArray count](self->_groupLengths, "count");
}

- (unint64_t)numberOfDigitsInGroup:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  if (-[NSArray count](self->_groupLengths, "count") <= a3)
    return 0;
  -[NSArray objectAtIndex:](self->_groupLengths, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  if (-[NSArray count](self->_groupLengths, "count"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("; pattern="));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_groupLengths;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      v8 = 1;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
          if ((v8 & 1) == 0)
            objc_msgSend(v3, "appendString:", CFSTR("-"));
          for (i = objc_msgSend(v10, "unsignedIntegerValue"); i; --i)
            objc_msgSend(v3, "appendString:", CFSTR("X"));
          v8 = 0;
          ++v9;
        }
        while (v9 != v6);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v8 = 0;
      }
      while (v6);
    }

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupLengths, 0);
}

@end
