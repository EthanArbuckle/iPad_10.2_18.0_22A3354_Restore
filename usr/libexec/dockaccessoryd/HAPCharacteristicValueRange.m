@implementation HAPCharacteristicValueRange

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueRange *v6;
  HAPCharacteristicValueRange *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueRange);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueRange parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
    v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  return v7;
}

- (HAPCharacteristicValueRange)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueRange;
  return -[HAPCharacteristicValueRange init](&v3, "init");
}

- (HAPCharacteristicValueRange)initWithLowerBound:(id)a3 upperBound:(id)a4
{
  id v7;
  id v8;
  HAPCharacteristicValueRange *v9;
  HAPCharacteristicValueRange *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPCharacteristicValueRange;
  v9 = -[HAPCharacteristicValueRange init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lowerBound, a3);
    objc_storeStrong((id *)&v10->_upperBound, a4);
  }

  return v10;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t Next;
  id v14;
  void *v15;
  id v16;
  id *v17;
  void *v18;
  id v19;
  BOOL v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = (uint64_t)objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v9 = 0;
    v10 = 0;
LABEL_17:
    -[HAPCharacteristicValueRange setLowerBound:](self, "setLowerBound:", v10);
    -[HAPCharacteristicValueRange setUpperBound:](self, "setUpperBound:", v9);
    v11 = 0;
    v20 = 1;
    goto LABEL_25;
  }
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = (unint64_t)v7 + v8;
  while (1)
  {
    v32 = 0;
    v30 = 0;
    v31 = 0;
    v29 = 0;
    Next = TLV8GetNext(v7, v12, &v32, &v31, &v30, &v29);
    if ((_DWORD)Next)
      break;
    if (!v31)
    {
      v23 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));

      v11 = (void *)v23;
      if (!v23)
        goto LABEL_17;
LABEL_21:
      if (a4)
      {
        v22 = objc_retainAutorelease(v11);
        v11 = v22;
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    if (v32 == 2)
    {
      v26 = v11;
      v19 = sub_100022878(2, (unint64_t)v7, v12, (unint64_t *)&v29, &v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v16 = v26;

      if (!v16)
      {
        v25 = 0;
        v17 = (id *)&v25;
        v18 = v9;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData parsedFromData:error:](NSData, "parsedFromData:error:", v15, &v25));
LABEL_11:
        v16 = *v17;

      }
LABEL_12:

      v11 = v16;
      goto LABEL_13;
    }
    if (v32 == 1)
    {
      v28 = v11;
      v14 = sub_100022878(1, (unint64_t)v7, v12, (unint64_t *)&v29, &v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = v28;

      if (!v16)
      {
        v27 = 0;
        v17 = (id *)&v27;
        v18 = v10;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData parsedFromData:error:](NSData, "parsedFromData:error:", v15, &v27));
        goto LABEL_11;
      }
      goto LABEL_12;
    }
LABEL_13:
    v7 = v29;
    if ((unint64_t)v29 >= v12)
    {
      if (!v11)
        goto LABEL_17;
      goto LABEL_21;
    }
  }
  if (a4)
  {
    v21 = sub_100040DDC(Next);
    v22 = (id)objc_claimAutoreleasedReturnValue(v21);
LABEL_23:
    v20 = 0;
    *a4 = v22;
    goto LABEL_25;
  }
LABEL_24:
  v20 = 0;
LABEL_25:

  return v20;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  void *v27;
  id v29;
  id v30;
  _OWORD v31[21];

  memset(v31, 0, sizeof(v31));
  TLV8BufferInit(v31, 0xFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange lowerBound](self, "lowerBound"));

  if (!v5)
  {
LABEL_10:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange upperBound](self, "upperBound"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange upperBound](self, "upperBound"));
      v29 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serializeWithError:", &v29));
      v8 = v29;

      if (v8)
        goto LABEL_12;
      v19 = objc_retainAutorelease(v7);
      v20 = (char *)objc_msgSend(v19, "bytes");
      v21 = (char *)objc_msgSend(v19, "length") + (_QWORD)v20;
      do
      {
        if (v21 - v20 >= 255)
          v22 = 255;
        else
          v22 = v21 - v20;
        v23 = TLV8BufferAppend(v31, 2, v20, v22);
        if ((_DWORD)v23)
          v24 = 0;
        else
          v24 = v22;
        v20 += v24;
        if ((_DWORD)v23)
          v25 = 1;
        else
          v25 = v20 >= v21;
      }
      while (!v25);
      v18 = v23;

      if ((_DWORD)v18)
      {
LABEL_28:
        if (a3)
        {
          v26 = sub_100040DDC(v18);
          v17 = (id)objc_claimAutoreleasedReturnValue(v26);
          v8 = 0;
          goto LABEL_30;
        }
        v8 = 0;
LABEL_33:
        v27 = 0;
        goto LABEL_34;
      }
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v31[0]));
    v8 = 0;
    goto LABEL_34;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange lowerBound](self, "lowerBound"));
  v30 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serializeWithError:", &v30));
  v8 = v30;

  if (!v8)
  {
    v9 = objc_retainAutorelease(v7);
    v10 = (char *)objc_msgSend(v9, "bytes");
    v11 = (char *)objc_msgSend(v9, "length") + (_QWORD)v10;
    while (1)
    {
      v12 = v11 - v10 >= 255 ? 255 : v11 - v10;
      v13 = TLV8BufferAppend(v31, 1, v10, v12);
      if ((_DWORD)v13)
        break;
      v10 += v12;
      if (v10 >= v11)
      {

        goto LABEL_10;
      }
    }
    v18 = v13;

    goto LABEL_28;
  }
LABEL_12:

  if (!a3)
    goto LABEL_33;
  v17 = objc_retainAutorelease(v8);
  v8 = v17;
LABEL_30:
  v27 = 0;
  *a3 = v17;
LABEL_34:
  TLV8BufferFree(v31, v16);

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPCharacteristicValueRange *v4;
  void *v5;
  void *v6;
  HAPCharacteristicValueRange *v7;

  v4 = +[HAPCharacteristicValueRange allocWithZone:](HAPCharacteristicValueRange, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange lowerBound](self, "lowerBound"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange upperBound](self, "upperBound"));
  v7 = -[HAPCharacteristicValueRange initWithLowerBound:upperBound:](v4, "initWithLowerBound:upperBound:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  uint64_t v5;
  HAPCharacteristicValueRange *v6;
  uint64_t v7;
  HAPCharacteristicValueRange *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v6 = (HAPCharacteristicValueRange *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    v7 = objc_opt_class(HAPCharacteristicValueRange, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange lowerBound](self, "lowerBound"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange lowerBound](v8, "lowerBound"));
      if (v9 != v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange lowerBound](self, "lowerBound"));
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange lowerBound](v8, "lowerBound"));
        if (!objc_msgSend(v11, "isEqual:", v3))
        {
          v12 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v18 = v11;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange upperBound](self, "upperBound"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange upperBound](v8, "upperBound"));
      if (v13 == v14)
      {
        v12 = 1;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange upperBound](self, "upperBound"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange upperBound](v8, "upperBound"));
        v12 = objc_msgSend(v15, "isEqual:", v16);

      }
      v11 = v18;
      if (v9 == v10)
        goto LABEL_14;
      goto LABEL_13;
    }
    v12 = 0;
  }
LABEL_15:

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange lowerBound](self, "lowerBound"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueRange upperBound](self, "upperBound"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPCharacteristicValueRange lowerBound=%@, upperBound=%@>"), v3, v4));

  return (NSString *)v5;
}

- (NSData)lowerBound
{
  return self->_lowerBound;
}

- (void)setLowerBound:(id)a3
{
  objc_storeStrong((id *)&self->_lowerBound, a3);
}

- (NSData)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(id)a3
{
  objc_storeStrong((id *)&self->_upperBound, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upperBound, 0);
  objc_storeStrong((id *)&self->_lowerBound, 0);
}

@end
