@implementation HAPCharacteristicValueTransitionStart

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueTransitionStart *v6;
  HAPCharacteristicValueTransitionStart *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueTransitionStart);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueTransitionStart parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (HAPCharacteristicValueTransitionStart)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransitionStart;
  return -[HAPCharacteristicValueTransitionStart init](&v3, "init");
}

- (HAPCharacteristicValueTransitionStart)initWithTransitions:(id)a3
{
  id v4;
  HAPCharacteristicValueTransitionStart *v5;
  NSMutableArray *v6;
  NSMutableArray *transitions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPCharacteristicValueTransitionStart;
  v5 = -[HAPCharacteristicValueTransitionStart init](&v9, "init");
  if (v5)
  {
    v6 = (NSMutableArray *)objc_msgSend(v4, "mutableCopy");
    transitions = v5->_transitions;
    v5->_transitions = v6;

  }
  return v5;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t Next;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = (uint64_t)objc_msgSend(v6, "length");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v8 >= 1)
  {
    v10 = 0;
    v11 = (unint64_t)v7 + v8;
    while (1)
    {
      v27 = 0;
      v25 = 0;
      v26 = 0;
      v24 = 0;
      Next = TLV8GetNext(v7, v11, &v27, &v26, &v25, &v24);
      if ((_DWORD)Next)
      {
        if (a4)
        {
          v18 = sub_100040DDC(Next);
          v17 = (id)objc_claimAutoreleasedReturnValue(v18);
          goto LABEL_17;
        }
        goto LABEL_20;
      }
      if (!v26)
        break;
      if (v27 == 1)
      {
        v23 = v10;
        v13 = sub_100022878(1, (unint64_t)v7, v11, (unint64_t *)&v24, &v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = v23;

        if (!v15)
        {
          v22 = 0;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[HAPCharacteristicValueTransition parsedFromData:error:](HAPCharacteristicValueTransition, "parsedFromData:error:", v14, &v22));
          v15 = v22;
          if (!v15)
            objc_msgSend(v9, "addObject:", v16);

        }
        v10 = v15;
      }
      v7 = v24;
      if ((unint64_t)v24 >= v11)
      {
        if (!v10)
          goto LABEL_19;
LABEL_13:
        if (a4)
        {
          v17 = objc_retainAutorelease(v10);
          v10 = v17;
LABEL_17:
          v19 = 0;
          *a4 = v17;
          goto LABEL_21;
        }
LABEL_20:
        v19 = 0;
        goto LABEL_21;
      }
    }
    v20 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));

    v10 = (void *)v20;
    if (v20)
      goto LABEL_13;
  }
LABEL_19:
  -[HAPCharacteristicValueTransitionStart setTransitions:](self, "setTransitions:", v9);
  v10 = 0;
  v19 = 1;
LABEL_21:

  return v19;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id *v24;
  id v25;
  id v26;
  id *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[43];

  memset(v35, 0, 336);
  TLV8BufferInit(v35, 0xFFFFLL);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionStart transitions](self, "transitions"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v9 = 1;
    v28 = a3;
    while (1)
    {
      v10 = 0;
LABEL_4:
      if (*(_QWORD *)v31 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
      if ((v9 & 1) == 0)
      {
        v12 = TLV8BufferAppend(v35, 0, 0, 0);
        if ((_DWORD)v12)
          break;
      }
      v29 = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serializeWithError:", &v29, v28));
      v14 = v29;
      if (v14)
      {
        v22 = v14;

        v24 = v28;
        if (v28)
        {
          v26 = objc_retainAutorelease(v22);
          v22 = v26;
          goto LABEL_21;
        }
        goto LABEL_23;
      }
      v15 = objc_retainAutorelease(v13);
      v16 = (char *)objc_msgSend(v15, "bytes");
      v17 = (char *)objc_msgSend(v15, "length") + (_QWORD)v16;
      do
      {
        if (v17 - v16 >= 255)
          v18 = 255;
        else
          v18 = v17 - v16;
        v19 = TLV8BufferAppend(v35, 1, v16, v18);
        if ((_DWORD)v19)
        {
          v23 = v19;

          goto LABEL_19;
        }
        v16 += v18;
      }
      while (v16 < v17);

      v9 = 0;
      if ((id)++v10 != v7)
        goto LABEL_4;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v9 = 0;
      if (!v7)
        goto LABEL_17;
    }
    v23 = v12;
LABEL_19:

    v24 = v28;
    if (v28)
    {
      v25 = sub_100040DDC(v23);
      v26 = (id)objc_claimAutoreleasedReturnValue(v25);
      v22 = 0;
LABEL_21:
      v21 = 0;
      *v24 = v26;
      goto LABEL_24;
    }
    v22 = 0;
LABEL_23:
    v21 = 0;
  }
  else
  {
LABEL_17:

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v35[0], v35[1]));
    v22 = 0;
  }
LABEL_24:
  TLV8BufferFree(v35, v20);

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPCharacteristicValueTransitionStart *v4;
  void *v5;
  HAPCharacteristicValueTransitionStart *v6;

  v4 = +[HAPCharacteristicValueTransitionStart allocWithZone:](HAPCharacteristicValueTransitionStart, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionStart transitions](self, "transitions"));
  v6 = -[HAPCharacteristicValueTransitionStart initWithTransitions:](v4, "initWithTransitions:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPCharacteristicValueTransitionStart *v5;
  uint64_t v6;
  HAPCharacteristicValueTransitionStart *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v5 = (HAPCharacteristicValueTransitionStart *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPCharacteristicValueTransitionStart, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionStart transitions](self, "transitions"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionStart transitions](v7, "transitions"));
      if (v8 == v9)
      {
        v12 = 1;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionStart transitions](self, "transitions"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionStart transitions](v7, "transitions"));
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSString)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionStart transitions](self, "transitions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPCharacteristicValueTransitionStart transitions=%@>"), v2));

  return (NSString *)v3;
}

- (NSMutableArray)transitions
{
  return self->_transitions;
}

- (void)setTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_transitions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitions, 0);
}

@end
