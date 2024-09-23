@implementation SATaskAggregationIdentifier

- (id)initWithBinary:(void *)a3 sharedCache:(void *)a4 rcid:
{
  id v8;
  id v9;
  id *v10;
  objc_super v12;

  v8 = a2;
  v9 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SATaskAggregationIdentifier;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      a1[3] = a4;
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  const char *v6;
  _QWORD *v7;
  const char *v8;
  SABinary *v9;
  BOOL v10;
  SASharedCache *v11;
  SASharedCache *sharedCache;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v7 = v5;
    if (v5)
    {
      v9 = (SABinary *)objc_getProperty(v5, v6, 8, 1);
      if (v9 != self->_binary)
      {
        v10 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v11 = (SASharedCache *)objc_getProperty(v7, v8, 16, 1);
      if (v11 != self->_sharedCache)
        goto LABEL_7;
      sharedCache = (SASharedCache *)v7[3];
    }
    else
    {
      if (self->_binary)
      {
        v10 = 0;
        v9 = 0;
        goto LABEL_11;
      }
      sharedCache = self->_sharedCache;
      if (sharedCache)
      {
        v9 = 0;
        v11 = 0;
LABEL_7:
        v10 = 0;
LABEL_10:

        goto LABEL_11;
      }
      v9 = 0;
      v11 = 0;
    }
    v10 = sharedCache == (SASharedCache *)self->_rcid;
    goto LABEL_10;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  return self->_rcid | (unint64_t)self->_binary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedCache, 0);
  objc_storeStrong((id *)&self->_binary, 0);
}

@end
