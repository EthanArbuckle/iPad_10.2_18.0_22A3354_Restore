@implementation HAPCharacteristicValueLinearDerivedTransition

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueLinearDerivedTransition *v6;
  HAPCharacteristicValueLinearDerivedTransition *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueLinearDerivedTransition);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueLinearDerivedTransition parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (HAPCharacteristicValueLinearDerivedTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueLinearDerivedTransition;
  return -[HAPCharacteristicValueLinearDerivedTransition init](&v3, "init");
}

- (HAPCharacteristicValueLinearDerivedTransition)initWithTransitionPoints:(id)a3 sourceHAPInstanceID:(id)a4 sourceValueRange:(id)a5
{
  id v8;
  id v9;
  id v10;
  HAPCharacteristicValueLinearDerivedTransition *v11;
  NSMutableArray *v12;
  NSMutableArray *transitionPoints;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicValueLinearDerivedTransition;
  v11 = -[HAPCharacteristicValueLinearDerivedTransition init](&v15, "init");
  if (v11)
  {
    v12 = (NSMutableArray *)objc_msgSend(v8, "mutableCopy");
    transitionPoints = v11->_transitionPoints;
    v11->_transitionPoints = v12;

    objc_storeStrong((id *)&v11->_sourceHAPInstanceID, a4);
    objc_storeStrong((id *)&v11->_sourceValueRange, a5);
  }

  return v11;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t Next;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  id *v22;
  id v23;
  id v24;
  uint64_t v25;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = (uint64_t)objc_msgSend(v5, "length");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v7 < 1)
  {
    v10 = 0;
    v11 = 0;
LABEL_20:
    -[HAPCharacteristicValueLinearDerivedTransition setTransitionPoints:](self, "setTransitionPoints:", v8, a4);
    -[HAPCharacteristicValueLinearDerivedTransition setSourceHAPInstanceID:](self, "setSourceHAPInstanceID:", v11);
    -[HAPCharacteristicValueLinearDerivedTransition setSourceValueRange:](self, "setSourceValueRange:", v10);
    v9 = 0;
    v21 = 1;
    goto LABEL_28;
  }
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = (unint64_t)v6 + v7;
  while (1)
  {
    v36 = 0;
    v34 = 0;
    v35 = 0;
    v33 = 0;
    Next = TLV8GetNext(v6, v12, &v36, &v35, &v34, &v33);
    if ((_DWORD)Next)
      break;
    if (!v35)
    {
      v25 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));

      v9 = (void *)v25;
      if (!v25)
        goto LABEL_20;
LABEL_24:
      v22 = a4;
      if (a4)
      {
        v24 = objc_retainAutorelease(v9);
        v9 = v24;
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    switch(v36)
    {
      case 3:
        v29 = v9;
        v18 = sub_100022878(3, (unint64_t)v6, v12, (unint64_t *)&v33, &v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v16 = v29;

        if (!v16)
        {
          v28 = 0;
          v19 = objc_claimAutoreleasedReturnValue(+[HAPCharacteristicValueRange parsedFromData:error:](HAPCharacteristicValueRange, "parsedFromData:error:", v15, &v28));
          v16 = v28;
          v17 = v10;
          v10 = (void *)v19;
          goto LABEL_14;
        }
LABEL_15:

        v9 = v16;
        break;
      case 2:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
        v30 = v9;
        v20 = objc_claimAutoreleasedReturnValue(+[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v15, &v30));
        v16 = v30;

        v17 = v11;
        v11 = (void *)v20;
        goto LABEL_14;
      case 1:
        v32 = v9;
        v14 = sub_100022878(1, (unint64_t)v6, v12, (unint64_t *)&v33, &v32);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = v32;

        if (v16)
          goto LABEL_15;
        v31 = 0;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[HAPCharacteristicValueLinearDerivedTransitionPoint parsedFromData:error:](HAPCharacteristicValueLinearDerivedTransitionPoint, "parsedFromData:error:", v15, &v31));
        v16 = v31;
        if (!v16)
          objc_msgSend(v8, "addObject:", v17);
LABEL_14:

        goto LABEL_15;
    }
    v6 = v33;
    if ((unint64_t)v33 >= v12)
    {
      if (!v9)
        goto LABEL_20;
      goto LABEL_24;
    }
  }
  v22 = a4;
  if (a4)
  {
    v23 = sub_100040DDC(Next);
    v24 = (id)objc_claimAutoreleasedReturnValue(v23);
LABEL_26:
    v21 = 0;
    *v22 = v24;
    goto LABEL_28;
  }
LABEL_27:
  v21 = 0;
LABEL_28:

  return v21;
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
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  void *v37;
  id *v39;
  HAPCharacteristicValueLinearDerivedTransition *v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _QWORD v49[43];

  memset(v49, 0, 336);
  TLV8BufferInit(v49, 0xFFFFLL);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v40 = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition transitionPoints](self, "transitionPoints"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (!v6)
  {
LABEL_17:

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](v40, "sourceHAPInstanceID"));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](v40, "sourceHAPInstanceID"));
      v42 = 0;
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "serializeWithError:", &v42));
      v22 = v42;

      if (v22)
        goto LABEL_29;
      v5 = objc_retainAutorelease(v5);
      v23 = TLV8BufferAppend(v49, 2, objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
      if ((_DWORD)v23)
      {
        v24 = v23;
        goto LABEL_45;
      }

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](v40, "sourceValueRange"));

    if (!v28)
      goto LABEL_51;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](v40, "sourceValueRange"));
    v41 = 0;
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "serializeWithError:", &v41));
    v22 = v41;

    if (!v22)
    {
      v30 = a3;
      v5 = objc_retainAutorelease(v5);
      v31 = (char *)objc_msgSend(v5, "bytes");
      v32 = (char *)objc_msgSend(v5, "length") + (_QWORD)v31;
      do
      {
        if (v32 - v31 >= 255)
          v33 = 255;
        else
          v33 = v32 - v31;
        v34 = TLV8BufferAppend(v49, 3, v31, v33);
        if ((_DWORD)v34)
          v35 = 0;
        else
          v35 = v33;
        v31 += v35;
        if ((_DWORD)v34)
          v36 = 1;
        else
          v36 = v31 >= v32;
      }
      while (!v36);
      v24 = v34;
      a3 = v30;
      goto LABEL_45;
    }
LABEL_29:
    v24 = 0;
    goto LABEL_45;
  }
  v7 = v6;
  v8 = *(_QWORD *)v45;
  v9 = 1;
  v39 = a3;
  while (1)
  {
    v10 = 0;
LABEL_4:
    if (*(_QWORD *)v45 != v8)
      objc_enumerationMutation(v5);
    v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
    if ((v9 & 1) == 0)
    {
      v12 = TLV8BufferAppend(v49, 0, 0, 0);
      if ((_DWORD)v12)
        break;
    }
    v43 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serializeWithError:", &v43));
    v14 = v43;
    if (v14)
    {
      v22 = v14;

      v24 = 0;
      goto LABEL_44;
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
      v19 = TLV8BufferAppend(v49, 1, v16, v18);
      if ((_DWORD)v19)
      {
        v24 = v19;

        a3 = v39;
        goto LABEL_22;
      }
      v16 += v18;
    }
    while (v16 < v17);

    v9 = 0;
    if ((id)++v10 != v7)
      goto LABEL_4;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    v9 = 0;
    a3 = v39;
    if (!v7)
      goto LABEL_17;
  }
  v24 = v12;
  v22 = 0;
LABEL_44:
  a3 = v39;
LABEL_45:

  if (v22)
  {
    if (a3)
    {
      v27 = objc_retainAutorelease(v22);
      v22 = v27;
      goto LABEL_48;
    }
LABEL_49:
    v37 = 0;
    goto LABEL_52;
  }
  if (!(_DWORD)v24)
  {
LABEL_51:
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v49[0], v49[1]));
    v22 = 0;
    goto LABEL_52;
  }
LABEL_22:
  if (!a3)
  {
    v22 = 0;
    goto LABEL_49;
  }
  v26 = sub_100040DDC(v24);
  v27 = (id)objc_claimAutoreleasedReturnValue(v26);
  v22 = 0;
LABEL_48:
  v37 = 0;
  *a3 = v27;
LABEL_52:
  TLV8BufferFree(v49, v25);

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPCharacteristicValueLinearDerivedTransition *v4;
  void *v5;
  void *v6;
  void *v7;
  HAPCharacteristicValueLinearDerivedTransition *v8;

  v4 = +[HAPCharacteristicValueLinearDerivedTransition allocWithZone:](HAPCharacteristicValueLinearDerivedTransition, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition transitionPoints](self, "transitionPoints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](self, "sourceHAPInstanceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](self, "sourceValueRange"));
  v8 = -[HAPCharacteristicValueLinearDerivedTransition initWithTransitionPoints:sourceHAPInstanceID:sourceValueRange:](v4, "initWithTransitionPoints:sourceHAPInstanceID:sourceValueRange:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;
  HAPCharacteristicValueLinearDerivedTransition *v7;
  uint64_t v8;
  HAPCharacteristicValueLinearDerivedTransition *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v7 = (HAPCharacteristicValueLinearDerivedTransition *)a3;
  if (self == v7)
  {
    v12 = 1;
  }
  else
  {
    v8 = objc_opt_class(HAPCharacteristicValueLinearDerivedTransition, v6);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition transitionPoints](self, "transitionPoints"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition transitionPoints](v9, "transitionPoints"));
      if (v10 != v11)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition transitionPoints](self, "transitionPoints"));
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition transitionPoints](v9, "transitionPoints"));
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v12 = 0;
          goto LABEL_19;
        }
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](self, "sourceHAPInstanceID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](v9, "sourceHAPInstanceID"));
      if (v13 == v14)
      {
        v27 = v13;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](self, "sourceHAPInstanceID"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](v9, "sourceHAPInstanceID"));
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v12 = 0;
          goto LABEL_17;
        }
        v26 = v15;
        v27 = v13;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](self, "sourceValueRange"));
      v17 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](v9, "sourceValueRange"));
      if (v16 == (void *)v17)
      {

        v12 = 1;
      }
      else
      {
        v18 = (void *)v17;
        v25 = v3;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](self, "sourceValueRange"));
        v24 = v4;
        v20 = v11;
        v21 = v10;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](v9, "sourceValueRange"));
        v12 = objc_msgSend(v19, "isEqual:", v22);

        v10 = v21;
        v11 = v20;
        v4 = v24;

        v3 = v25;
      }
      v15 = v26;
      v13 = v27;
      if (v27 == v14)
      {
LABEL_18:

        if (v10 == v11)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition transitionPoints](self, "transitionPoints"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](self, "sourceHAPInstanceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](self, "sourceValueRange"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPCharacteristicValueLinearDerivedTransition transitionPoints=%@, sourceHAPInstanceID=%@, sourceValueRange=%@>"), v3, v4, v5));

  return (NSString *)v6;
}

- (NSMutableArray)transitionPoints
{
  return self->_transitionPoints;
}

- (void)setTransitionPoints:(id)a3
{
  objc_storeStrong((id *)&self->_transitionPoints, a3);
}

- (HAPTLVUnsignedNumberValue)sourceHAPInstanceID
{
  return self->_sourceHAPInstanceID;
}

- (void)setSourceHAPInstanceID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceHAPInstanceID, a3);
}

- (HAPCharacteristicValueRange)sourceValueRange
{
  return self->_sourceValueRange;
}

- (void)setSourceValueRange:(id)a3
{
  objc_storeStrong((id *)&self->_sourceValueRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceValueRange, 0);
  objc_storeStrong((id *)&self->_sourceHAPInstanceID, 0);
  objc_storeStrong((id *)&self->_transitionPoints, 0);
}

@end
