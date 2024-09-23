@implementation TTVectorTimestamp

- (TTVectorTimestamp)init
{
  TTVectorTimestamp *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *clock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TTVectorTimestamp;
  v2 = -[TTVectorTimestamp init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    clock = v2->_clock;
    v2->_clock = v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TTVectorTimestamp *v4;

  v4 = objc_alloc_init(TTVectorTimestamp);
  -[TTVectorTimestamp mergeWithTimestamp:](v4, "mergeWithTimestamp:", self);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TTVectorTimestamp compareTo:](self, "compareTo:", v4) == 0;

  return v5;
}

- (id)clockElementForUUID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_clock, "objectForKeyedSubscript:", a3);
}

- (unint64_t)clockForUUID:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_clock, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "clock");

  return v4;
}

- (unint64_t)subclockForUUID:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_clock, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "subclock");

  return v4;
}

- (void)setClock:(unint64_t)a3 forUUID:(id)a4
{
  NSMutableDictionary *clock;
  id v7;
  TTVectorTimestampElement *v8;
  TTVectorTimestampElement *v9;

  clock = self->_clock;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](clock, "objectForKeyedSubscript:", v7);
  v8 = (TTVectorTimestampElement *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = objc_alloc_init(TTVectorTimestampElement);
  v9 = v8;
  -[TTVectorTimestampElement setClock:](v8, "setClock:", a3);
  -[NSMutableDictionary setObject:forKey:](self->_clock, "setObject:forKey:", v9, v7);

}

- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5
{
  id v8;
  TTVectorTimestampElement *v9;

  v8 = a5;
  v9 = objc_alloc_init(TTVectorTimestampElement);
  -[TTVectorTimestampElement setClock:](v9, "setClock:", a3);
  -[TTVectorTimestampElement setSubclock:](v9, "setSubclock:", a4);
  -[NSMutableDictionary setObject:forKey:](self->_clock, "setObject:forKey:", v9, v8);

}

- (void)incrementClockForUUID:(id)a3
{
  id v4;

  v4 = a3;
  -[TTVectorTimestamp setClock:forUUID:](self, "setClock:forUUID:", -[TTVectorTimestamp clockForUUID:](self, "clockForUUID:", v4) + 1, v4);

}

- (id)allUUIDs
{
  return (id)-[NSMutableDictionary allKeys](self->_clock, "allKeys");
}

- (id)sortedUUIDs
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allKeys](self->_clock, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_TTCompare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)compareTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E20];
  -[TTVectorTimestamp allUUIDs](self, "allUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v10)
  {

    v24 = 0;
    goto LABEL_22;
  }
  v11 = v10;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v28;
  obj = v9;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v28 != v14)
        objc_enumerationMutation(obj);
      v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
      -[TTVectorTimestamp clockElementForUUID:](self, "clockElementForUUID:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clockElementForUUID:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "clock");
      if (v19 >= objc_msgSend(v18, "clock"))
      {
        v20 = objc_msgSend(v17, "clock");
        if (v20 > objc_msgSend(v18, "clock"))
        {
          v12 = 1;
          goto LABEL_12;
        }
        v21 = objc_msgSend(v17, "subclock");
        if (v21 >= objc_msgSend(v18, "subclock"))
        {
          v22 = objc_msgSend(v17, "subclock");
          v12 |= v22 > objc_msgSend(v18, "subclock");
          goto LABEL_12;
        }
      }
      v13 = 1;
LABEL_12:

      if ((v13 & 1) != 0 && (v12 & 1) != 0)
      {
        v13 = 1;
        v9 = obj;
        v23 = 4;
        goto LABEL_20;
      }
    }
    v9 = obj;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
      continue;
    break;
  }
  if ((v12 & 1) != 0)
    v23 = 4;
  else
    v23 = 0;
LABEL_20:

  v24 = v23 | v13 & 1;
LABEL_22:

  return v24;
}

- (void)mergeWithTimestamp:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "allUUIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[TTVectorTimestamp clockElementForUUID:](self, "clockElementForUUID:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "clockElementForUUID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "clock");
        v13 = v10;
        if (v12 <= objc_msgSend(v11, "clock"))
        {
          v14 = objc_msgSend(v10, "clock");
          if (v14 != objc_msgSend(v11, "clock")
            || (v15 = objc_msgSend(v10, "subclock"), v13 = v10, v15 <= objc_msgSend(v11, "subclock")))
          {
            v13 = v11;
          }
        }
        -[TTVectorTimestamp setClock:subclock:forUUID:](self, "setClock:subclock:forUUID:", objc_msgSend(v13, "clock"), objc_msgSend(v13, "subclock"), v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p>(\n"), v5, self);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TTVectorTimestamp sortedUUIDs](self, "sortedUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[TTVectorTimestamp clockElementForUUID:](self, "clockElementForUUID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("  %@:%lu.%lu\n"), v11, objc_msgSend(v12, "clock"), objc_msgSend(v12, "subclock"));

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "appendString:", CFSTR(")"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clock, 0);
}

- (TTVectorTimestamp)initWithData:(id)a3
{
  id v4;
  TTVectorMultiTimestamp *v5;
  void *v6;
  TTVectorTimestamp *v7;

  v4 = a3;
  v5 = -[TTVectorMultiTimestamp initWithData:andCapacity:]([TTVectorMultiTimestamp alloc], "initWithData:andCapacity:", v4, 1);
  -[TTVectorMultiTimestamp timestamps](v5, "timestamps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (TTVectorTimestamp *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (TTVectorTimestamp)initWithArchive:(const void *)a3
{
  TTVectorMultiTimestamp *v4;
  void *v5;
  TTVectorTimestamp *v6;

  v4 = -[TTVectorMultiTimestamp initWithArchive:andCapacity:]([TTVectorMultiTimestamp alloc], "initWithArchive:andCapacity:", a3, 1);
  -[TTVectorMultiTimestamp timestamps](v4, "timestamps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (TTVectorTimestamp *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)saveToArchive:(void *)a3
{
  TTVectorMultiTimestamp *v5;
  void *v6;
  TTVectorMultiTimestamp *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = [TTVectorMultiTimestamp alloc];
  v8[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TTVectorMultiTimestamp initWithTimestamps:](v5, "initWithTimestamps:", v6);

  -[TTVectorMultiTimestamp saveToArchive:](v7, "saveToArchive:", a3);
}

- (id)serialize
{
  TTVectorMultiTimestamp *v3;
  void *v4;
  TTVectorMultiTimestamp *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [TTVectorMultiTimestamp alloc];
  v8[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TTVectorMultiTimestamp initWithTimestamps:](v3, "initWithTimestamps:", v4);

  -[TTVectorMultiTimestamp serialize](v5, "serialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
