@implementation HAPCharacteristicValueLinearTransition

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueLinearTransition *v6;
  HAPCharacteristicValueLinearTransition *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueLinearTransition);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueLinearTransition parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (HAPCharacteristicValueLinearTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueLinearTransition;
  return -[HAPCharacteristicValueLinearTransition init](&v3, "init");
}

- (HAPCharacteristicValueLinearTransition)initWithTransitionPoints:(id)a3 startBehavior:(id)a4
{
  id v6;
  id v7;
  HAPCharacteristicValueLinearTransition *v8;
  NSMutableArray *v9;
  NSMutableArray *transitionPoints;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPCharacteristicValueLinearTransition;
  v8 = -[HAPCharacteristicValueLinearTransition init](&v12, "init");
  if (v8)
  {
    v9 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
    transitionPoints = v8->_transitionPoints;
    v8->_transitionPoints = v9;

    objc_storeStrong((id *)&v8->_startBehavior, a4);
  }

  return v8;
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
  void *v17;
  uint64_t v18;
  BOOL v19;
  id *v20;
  id v21;
  id v22;
  uint64_t v23;
  id *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = (uint64_t)objc_msgSend(v6, "length");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v8 < 1)
  {
    v11 = 0;
LABEL_17:
    -[HAPCharacteristicValueLinearTransition setTransitionPoints:](self, "setTransitionPoints:", v9, v25);
    -[HAPCharacteristicValueLinearTransition setStartBehavior:](self, "setStartBehavior:", v11);
    v10 = 0;
    v19 = 1;
    goto LABEL_25;
  }
  v25 = a4;
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

      v10 = (void *)v23;
      if (!v23)
        goto LABEL_17;
LABEL_21:
      v20 = v25;
      if (v25)
      {
        v22 = objc_retainAutorelease(v10);
        v10 = v22;
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    if (v32 == 2)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
      v26 = v10;
      v18 = objc_claimAutoreleasedReturnValue(+[HAPCharacteristicValueTransitionLinearStartConditionWrapper parsedFromData:error:](HAPCharacteristicValueTransitionLinearStartConditionWrapper, "parsedFromData:error:", v15, &v26));
      v16 = v26;

      v17 = v11;
      v11 = (void *)v18;
      goto LABEL_11;
    }
    if (v32 == 1)
    {
      v28 = v10;
      v14 = sub_100022878(1, (unint64_t)v7, v12, (unint64_t *)&v29, &v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = v28;

      if (!v16)
      {
        v27 = 0;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[HAPCharacteristicValueTransitionPoint parsedFromData:error:](HAPCharacteristicValueTransitionPoint, "parsedFromData:error:", v15, &v27));
        v16 = v27;
        if (!v16)
          objc_msgSend(v9, "addObject:", v17);
LABEL_11:

      }
      v10 = v16;
    }
    v7 = v29;
    if ((unint64_t)v29 >= v12)
    {
      if (!v10)
        goto LABEL_17;
      goto LABEL_21;
    }
  }
  v20 = v25;
  if (v25)
  {
    v21 = sub_100040DDC(Next);
    v22 = (id)objc_claimAutoreleasedReturnValue(v21);
LABEL_23:
    v19 = 0;
    *v20 = v22;
    goto LABEL_25;
  }
LABEL_24:
  v19 = 0;
LABEL_25:

  return v19;
}

- (id)serializeWithError:(id *)a3
{
  id v5;
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
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  id *v29;
  HAPCharacteristicValueLinearTransition *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _OWORD v38[21];

  memset(v38, 0, sizeof(v38));
  TLV8BufferInit(v38, 0xFFFFLL);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v30 = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition transitionPoints](self, "transitionPoints"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    v9 = 1;
    v29 = a3;
    while (1)
    {
      v10 = 0;
LABEL_4:
      if (*(_QWORD *)v34 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
      if ((v9 & 1) == 0)
      {
        v12 = TLV8BufferAppend(v38, 0, 0, 0);
        if ((_DWORD)v12)
          break;
      }
      v32 = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serializeWithError:", &v32, v29));
      v14 = v32;
      if (v14)
      {
        v22 = v14;

        v23 = 0;
        goto LABEL_27;
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
        v19 = TLV8BufferAppend(v38, 1, v16, v18);
        if ((_DWORD)v19)
        {
          v23 = v19;

          a3 = v29;
          goto LABEL_21;
        }
        v16 += v18;
      }
      while (v16 < v17);

      v9 = 0;
      if ((id)++v10 != v7)
        goto LABEL_4;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v9 = 0;
      a3 = v29;
      if (!v7)
        goto LABEL_17;
    }
    v23 = v12;
    v22 = 0;
LABEL_27:
    a3 = v29;
  }
  else
  {
LABEL_17:

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition startBehavior](v30, "startBehavior"));
    if (!v20)
      goto LABEL_34;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition startBehavior](v30, "startBehavior"));
    v31 = 0;
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "serializeWithError:", &v31));
    v22 = v31;

    if (v22)
    {
      v23 = 0;
    }
    else
    {
      v5 = objc_retainAutorelease(v5);
      v23 = TLV8BufferAppend(v38, 2, objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
    }
  }

  if (v22)
  {
    if (a3)
    {
      v26 = objc_retainAutorelease(v22);
      v22 = v26;
      goto LABEL_31;
    }
LABEL_32:
    v27 = 0;
    goto LABEL_35;
  }
  if (!(_DWORD)v23)
  {
LABEL_34:
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v38[0], v29));
    v22 = 0;
    goto LABEL_35;
  }
LABEL_21:
  if (!a3)
  {
    v22 = 0;
    goto LABEL_32;
  }
  v25 = sub_100040DDC(v23);
  v26 = (id)objc_claimAutoreleasedReturnValue(v25);
  v22 = 0;
LABEL_31:
  v27 = 0;
  *a3 = v26;
LABEL_35:
  TLV8BufferFree(v38, v24);

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPCharacteristicValueLinearTransition *v4;
  void *v5;
  void *v6;
  HAPCharacteristicValueLinearTransition *v7;

  v4 = +[HAPCharacteristicValueLinearTransition allocWithZone:](HAPCharacteristicValueLinearTransition, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition transitionPoints](self, "transitionPoints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition startBehavior](self, "startBehavior"));
  v7 = -[HAPCharacteristicValueLinearTransition initWithTransitionPoints:startBehavior:](v4, "initWithTransitionPoints:startBehavior:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  uint64_t v5;
  HAPCharacteristicValueLinearTransition *v6;
  uint64_t v7;
  HAPCharacteristicValueLinearTransition *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v6 = (HAPCharacteristicValueLinearTransition *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    v7 = objc_opt_class(HAPCharacteristicValueLinearTransition, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition transitionPoints](self, "transitionPoints"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition transitionPoints](v8, "transitionPoints"));
      if (v9 != v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition transitionPoints](self, "transitionPoints"));
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition transitionPoints](v8, "transitionPoints"));
        if (!objc_msgSend(v11, "isEqual:", v3))
        {
          v12 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v18 = v11;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition startBehavior](self, "startBehavior"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition startBehavior](v8, "startBehavior"));
      if (v13 == v14)
      {
        v12 = 1;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition startBehavior](self, "startBehavior"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition startBehavior](v8, "startBehavior"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition transitionPoints](self, "transitionPoints"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearTransition startBehavior](self, "startBehavior"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPCharacteristicValueLinearTransition transitionPoints=%@, startBehavior=%@>"), v3, v4));

  return (NSString *)v5;
}

- (NSMutableArray)transitionPoints
{
  return self->_transitionPoints;
}

- (void)setTransitionPoints:(id)a3
{
  objc_storeStrong((id *)&self->_transitionPoints, a3);
}

- (HAPCharacteristicValueTransitionLinearStartConditionWrapper)startBehavior
{
  return self->_startBehavior;
}

- (void)setStartBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_startBehavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startBehavior, 0);
  objc_storeStrong((id *)&self->_transitionPoints, 0);
}

@end
