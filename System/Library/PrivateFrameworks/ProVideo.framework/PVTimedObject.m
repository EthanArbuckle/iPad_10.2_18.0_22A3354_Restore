@implementation PVTimedObject

+ (id)timedObjectWithTime:(id *)a3
{
  id v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v4 = objc_alloc((Class)a1);
  v6 = *a3;
  return (id)objc_msgSend(v4, "initWithTime:", &v6);
}

+ (id)timedObjectWithTime:(id *)a3 object:(id)a4
{
  id v6;
  id v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v6 = a4;
  v7 = objc_alloc((Class)a1);
  v10 = *a3;
  v8 = (void *)objc_msgSend(v7, "initWithTime:object:", &v10, v6);

  return v8;
}

- (PVTimedObject)init
{
  __int128 v3;
  uint64_t v4;

  v3 = *MEMORY[0x1E0CA2E68];
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  return -[PVTimedObject initWithTime:](self, "initWithTime:", &v3);
}

- (PVTimedObject)initWithTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  return -[PVTimedObject initWithTime:object:](self, "initWithTime:object:", &v4, 0);
}

- (PVTimedObject)initWithObject:(id)a3
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x1E0CA2E68];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  return -[PVTimedObject initWithTime:object:](self, "initWithTime:object:", &v4, a3);
}

- (PVTimedObject)initWithTime:(id *)a3 object:(id)a4
{
  id v6;
  PVTimedObject *v7;
  PVTimedObject *v8;
  __int128 v10;
  int64_t var3;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PVTimedObject;
  v7 = -[PVTimedObject init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v10 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[PVTimedObject setTime:](v7, "setTime:", &v10);
    -[PVTimedObject setObject:](v8, "setObject:", v6);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVTimedObject)initWithCoder:(id)a3
{
  id v4;
  PVTimedObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v4 = a3;
  v5 = (PVTimedObject *)objc_alloc_init((Class)objc_opt_class());

  if (v5 && objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVTimedObject_CodingVersion")) == 1)
  {
    if (v4)
    {
      objc_msgSend(v4, "decodeCMTimeForKey:", CFSTR("PVTimedObject_Time"));
    }
    else
    {
      v14 = 0uLL;
      v15 = 0;
    }
    v12 = v14;
    v13 = v15;
    -[PVTimedObject setTime:](v5, "setTime:", &v12);
    objc_msgSend(v4, "allowedClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v6, CFSTR("PVTimedObject_Object"), &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    -[PVTimedObject setObject:](v5, "setObject:", v7);

    if (v8)
      v9 = (id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PVTimedObject_Object"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  _BYTE v10[24];

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", 1, CFSTR("PVTimedObject_CodingVersion"));
  -[PVTimedObject time](self, "time");
  objc_msgSend(v4, "encodeCMTime:forKey:", v10, CFSTR("PVTimedObject_Time"));
  -[PVTimedObject object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PVTimedObject object](self, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("PVTimedObject_ObjectClass"));

    -[PVTimedObject object](self, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("PVTimedObject_Object"));

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BYTE v8[24];

  -[PVTimedObject time](self, "time", a3);
  -[PVTimedObject object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  +[PVTimedObject timedObjectWithTime:object:](PVTimedObject, "timedObjectWithTime:object:", v8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PVTimedObject *v4;
  PVTimedObject *v5;
  PVTimedObject *v6;
  char v7;
  void *v8;
  void *v9;
  CMTime v11;
  CMTime time1;

  v4 = (PVTimedObject *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if (self == v4)
  {
    v7 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[PVTimedObject time](self, "time");
    -[PVTimedObject time](v6, "time");
    if (CMTimeCompare(&time1, &v11))
    {
      v7 = 0;
    }
    else
    {
      -[PVTimedObject object](self, "object");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PVTimedObject object](v6, "object");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
LABEL_6:
    v7 = 0;
  }
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[PVTimedObject object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v6 = 0;
  v7 = 0;
  v8 = 0;
  -[PVTimedObject time](self, "time");
  return v6 ^ v4 ^ (int)v7 ^ (unint64_t)HIDWORD(v7) ^ v8;
}

- (id)description
{
  const __CFAllocator *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  CMTime time;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  -[PVTimedObject time](self, "time");
  v4 = (__CFString *)CMTimeCopyDescription(v3, &time);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PVTimedObject;
  -[PVTimedObject description](&v12, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVTimedObject object](self, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@\n\ttime:   %@\n\tobject: %@"), v6, v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)findTimedObjectInSortedArray:(id)a3 atTime:(id *)a4 returnFirstObjectForTimeBeforeFirst:(BOOL)a5 returnLastObjectForTimeAfterLast:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  const __CFArray *v9;
  const __CFArray *v10;
  uint64_t v11;
  CFIndex v12;
  void *v13;
  CFIndex v14;
  CFIndex v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  CMTime time1;
  CMTime time2;
  CFRange v23;

  v6 = a6;
  v7 = a5;
  v9 = (const __CFArray *)a3;
  v10 = v9;
  if (v9)
  {
    v11 = -[__CFArray count](v9, "count");
    if (v11)
    {
      v12 = v11;
      time2 = (CMTime)*a4;
      +[PVTimedObject timedObjectWithTime:](PVTimedObject, "timedObjectWithTime:", &time2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23.location = 0;
      v23.length = v12;
      v14 = CFArrayBSearchValues(v10, v23, v13, (CFComparatorFunction)compareTimedObjects, 0);
      if (v14 >= v12)
      {
        if (v6)
        {
          -[__CFArray lastObject](v10, "lastObject");
          v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        v15 = v14;
        if ((v14 & 0x8000000000000000) == 0)
        {
          -[__CFArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
            objc_msgSend(v16, "time");
          else
            memset(&time1, 0, sizeof(time1));
          time2 = (CMTime)*a4;
          if (CMTimeCompare(&time1, &time2) >= 1)
          {
            if (!v15)
            {
              if (v7)
              {
                -[__CFArray firstObject](v10, "firstObject");
                v18 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v18 = 0;
              }
              goto LABEL_16;
            }
            -[__CFArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", v15 - 1);
            v19 = objc_claimAutoreleasedReturnValue();

            v17 = (void *)v19;
          }
          v18 = v17;
          v17 = v18;
LABEL_16:

          goto LABEL_17;
        }
      }
      v18 = 0;
      goto LABEL_17;
    }
  }
  v18 = 0;
LABEL_18:

  return v18;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (NSSecureCoding)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
