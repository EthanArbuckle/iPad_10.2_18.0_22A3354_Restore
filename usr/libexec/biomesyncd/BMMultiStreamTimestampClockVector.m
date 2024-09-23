@implementation BMMultiStreamTimestampClockVector

- (BMMultiStreamTimestampClockVector)init
{
  BMMultiStreamTimestampClockVector *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *vectorClock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BMMultiStreamTimestampClockVector;
  v2 = -[BMMultiStreamTimestampClockVector init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    vectorClock = v2->_vectorClock;
    v2->_vectorClock = v3;

  }
  return v2;
}

- (void)setVectorClockTo:(id)a3 forStreamIdentifier:(id)a4
{
  if (a3)
  {
    if (a4)
      -[NSMutableDictionary setValue:forKey:](self->_vectorClock, "setValue:forKey:");
  }
}

- (id)timestampClockVectorForStreamIdentifier:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_vectorClock, "objectForKey:"));
  else
    return 0;
}

- (id)allKeys
{
  return -[NSMutableDictionary allKeys](self->_vectorClock, "allKeys");
}

- (id)description
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary description](self->_vectorClock, "description"));
  v5 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@"), v4);

  return v5;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_alloc((Class)NSOrderedSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMMultiStreamTimestampClockVector allKeys](self, "allKeys"));
  v5 = objc_msgSend(v3, "initWithArray:", v4);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_vectorClock, "valueForKey:", v12, (_QWORD)v16));
        v14 = (unint64_t)objc_msgSend(v12, "hash");
        v10 ^= v14 ^ (unint64_t)objc_msgSend(v13, "hash");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  BOOL v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v6 = objc_opt_class(BMMultiStreamTimestampClockVector, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = objc_alloc((Class)NSSet);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMMultiStreamTimestampClockVector allKeys](self, "allKeys"));
    v9 = objc_msgSend(v7, "initWithArray:", v8);

    v10 = objc_alloc((Class)NSSet);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
    v12 = objc_msgSend(v10, "initWithArray:", v11);

    if (objc_msgSend(v9, "isEqual:", v12))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v13 = v9;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v14)
      {
        v15 = v14;
        v24 = v12;
        v16 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[BMMultiStreamTimestampClockVector timestampClockVectorForStreamIdentifier:](self, "timestampClockVectorForStreamIdentifier:", v18));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestampClockVectorForStreamIdentifier:", v18));
            v21 = objc_msgSend(v19, "compareToVector:", v20);

            if (v21)
            {
              v22 = 0;
              goto LABEL_15;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v15)
            continue;
          break;
        }
        v22 = 1;
LABEL_15:
        v12 = v24;
      }
      else
      {
        v22 = 1;
      }

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_vectorClock, CFSTR("vectorClock"));
}

- (BMMultiStreamTimestampClockVector)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  BMMultiStreamTimestampClockVector *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *vectorClock;
  objc_super v15;
  _QWORD v16[3];

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BMMultiStreamTimestampClockVector;
  v6 = -[BMMultiStreamTimestampClockVector init](&v15, "init");
  if (v6)
  {
    v16[0] = objc_opt_class(NSString, v5);
    v16[1] = objc_opt_class(NSDictionary, v7);
    v16[2] = objc_opt_class(CKDistributedTimestampClockVector, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("vectorClock")));
    v12 = (NSMutableDictionary *)objc_msgSend(v11, "mutableCopy");
    vectorClock = v6->_vectorClock;
    v6->_vectorClock = v12;

  }
  return v6;
}

- (id)serialize:(id *)a3
{
  return +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)deserialize:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;

  if (a3)
  {
    v5 = a3;
    v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(BMMultiStreamTimestampClockVector, v6), v5, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorClock, 0);
}

@end
