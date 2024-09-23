@implementation HAPCharacteristicValueTransition

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueTransition *v6;
  HAPCharacteristicValueTransition *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueTransition);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueTransition parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (HAPCharacteristicValueTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransition;
  return -[HAPCharacteristicValueTransition init](&v3, "init");
}

- (HAPCharacteristicValueTransition)initWithHAPInstanceID:(id)a3 controllerContext:(id)a4 endBehavior:(id)a5 linearTransition:(id)a6 linearDerivedTransition:(id)a7 valueUpdateTimeInterval:(id)a8 notifyValueChangeThreshold:(id)a9 notifyTimeIntervalThreshold:(id)a10
{
  id v17;
  HAPCharacteristicValueTransition *v18;
  HAPCharacteristicValueTransition *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)HAPCharacteristicValueTransition;
  v18 = -[HAPCharacteristicValueTransition init](&v28, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_HAPInstanceID, a3);
    objc_storeStrong((id *)&v19->_controllerContext, a4);
    objc_storeStrong((id *)&v19->_endBehavior, a5);
    objc_storeStrong((id *)&v19->_linearTransition, a6);
    objc_storeStrong((id *)&v19->_linearDerivedTransition, a7);
    objc_storeStrong((id *)&v19->_valueUpdateTimeInterval, a8);
    objc_storeStrong((id *)&v19->_notifyValueChangeThreshold, a9);
    objc_storeStrong((id *)&v19->_notifyTimeIntervalThreshold, a10);
  }

  return v19;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t Next;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE v65[9];

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = (uint64_t)objc_msgSend(v5, "length");
  if (v7 < 1)
  {
    v29 = 0;
    v30 = 0;
    v9 = 0;
    v10 = 0;
    v32 = 0;
    v11 = 0;
    v33 = 0;
    v34 = 0;
LABEL_29:
    -[HAPCharacteristicValueTransition setHAPInstanceID:](self, "setHAPInstanceID:", v29, v43);
    -[HAPCharacteristicValueTransition setControllerContext:](self, "setControllerContext:", v30);
    -[HAPCharacteristicValueTransition setEndBehavior:](self, "setEndBehavior:", v9);
    -[HAPCharacteristicValueTransition setLinearTransition:](self, "setLinearTransition:", v34);
    -[HAPCharacteristicValueTransition setLinearDerivedTransition:](self, "setLinearDerivedTransition:", v33);
    -[HAPCharacteristicValueTransition setValueUpdateTimeInterval:](self, "setValueUpdateTimeInterval:", v11);
    -[HAPCharacteristicValueTransition setNotifyValueChangeThreshold:](self, "setNotifyValueChangeThreshold:", v32);
    -[HAPCharacteristicValueTransition setNotifyTimeIntervalThreshold:](self, "setNotifyTimeIntervalThreshold:", v10);
    v37 = v33;
    v38 = v10;
    v39 = v9;
    v40 = v32;
    v8 = 0;
    v41 = v34;
    v31 = 1;
  }
  else
  {
    v43 = v5;
    v8 = 0;
    v48 = 0;
    v49 = 0;
    v9 = 0;
    v10 = 0;
    v45 = 0;
    v46 = 0;
    v11 = 0;
    v47 = 0;
    v12 = (unint64_t)v6 + v7;
    while (1)
    {
      v65[0] = 0;
      v63 = 0;
      v64 = 0;
      v62 = 0;
      Next = TLV8GetNext(v6, v12, v65, &v64, &v63, &v62);
      if ((_DWORD)Next)
        break;
      if (!v64)
      {
        v36 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));

        v8 = (id)v36;
        if (v36)
          goto LABEL_22;
        goto LABEL_28;
      }
      switch(v65[0])
      {
        case 1:
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
          v61 = v8;
          v15 = objc_claimAutoreleasedReturnValue(+[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v61));
          v16 = v61;

          v17 = v49;
          v49 = (void *)v15;
          break;
        case 2:
          v60 = v8;
          v18 = sub_100022878(2, (unint64_t)v6, v12, (unint64_t *)&v62, &v60);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v16 = v60;

          if (v16)
            goto LABEL_19;
          v59 = 0;
          v19 = objc_claimAutoreleasedReturnValue(+[NSData parsedFromData:error:](NSData, "parsedFromData:error:", v14, &v59));
          v16 = v59;
          v17 = v48;
          v48 = (void *)v19;
          break;
        case 3:
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
          v58 = v8;
          v20 = objc_claimAutoreleasedReturnValue(+[HAPCharacteristicValueTransitionEndBehaviorWrapper parsedFromData:error:](HAPCharacteristicValueTransitionEndBehaviorWrapper, "parsedFromData:error:", v14, &v58));
          v16 = v58;

          v17 = v9;
          v9 = (void *)v20;
          break;
        case 4:
          v57 = v8;
          v21 = sub_100022878(4, (unint64_t)v6, v12, (unint64_t *)&v62, &v57);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v16 = v57;

          if (v16)
            goto LABEL_19;
          v56 = 0;
          v22 = objc_claimAutoreleasedReturnValue(+[HAPCharacteristicValueLinearTransition parsedFromData:error:](HAPCharacteristicValueLinearTransition, "parsedFromData:error:", v14, &v56));
          v16 = v56;
          v17 = v47;
          v47 = (void *)v22;
          break;
        case 5:
          v55 = v8;
          v23 = sub_100022878(5, (unint64_t)v6, v12, (unint64_t *)&v62, &v55);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v23);
          v16 = v55;

          if (v16)
            goto LABEL_19;
          v54 = 0;
          v24 = objc_claimAutoreleasedReturnValue(+[HAPCharacteristicValueLinearDerivedTransition parsedFromData:error:](HAPCharacteristicValueLinearDerivedTransition, "parsedFromData:error:", v14, &v54));
          v16 = v54;
          v17 = v46;
          v46 = (void *)v24;
          break;
        case 6:
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
          v53 = v8;
          v25 = objc_claimAutoreleasedReturnValue(+[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v53));
          v16 = v53;

          v17 = v11;
          v11 = (void *)v25;
          break;
        case 7:
          v52 = v8;
          v26 = sub_100022878(7, (unint64_t)v6, v12, (unint64_t *)&v62, &v52);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v26);
          v16 = v52;

          if (v16)
            goto LABEL_19;
          v51 = 0;
          v27 = objc_claimAutoreleasedReturnValue(+[NSData parsedFromData:error:](NSData, "parsedFromData:error:", v14, &v51));
          v16 = v51;
          v17 = v45;
          v45 = (void *)v27;
          break;
        case 8:
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
          v50 = v8;
          v28 = objc_claimAutoreleasedReturnValue(+[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v50));
          v16 = v50;

          v17 = v10;
          v10 = (void *)v28;
          break;
        default:
          goto LABEL_20;
      }

LABEL_19:
      v8 = v16;
LABEL_20:
      v6 = v62;
      if ((unint64_t)v62 >= v12)
      {
        if (v8)
        {
LABEL_22:
          v30 = v48;
          v29 = v49;
          if (a4)
          {
            v8 = objc_retainAutorelease(v8);
            v31 = 0;
            *a4 = v8;
          }
          else
          {
            v31 = 0;
          }
          goto LABEL_33;
        }
LABEL_28:
        v30 = v48;
        v29 = v49;
        v33 = v46;
        v34 = v47;
        v32 = v45;
        goto LABEL_29;
      }
    }
    if (a4)
    {
      v35 = sub_100040DDC(Next);
      v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v35);
    }
    else
    {
      v31 = 0;
    }
    v30 = v48;
    v29 = v49;
LABEL_33:
    v37 = v46;
    v41 = v47;
    v38 = v10;
    v39 = v9;
    v40 = v45;
  }

  return v31;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _OWORD v53[21];

  memset(v53, 0, sizeof(v53));
  TLV8BufferInit(v53, 0xFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition HAPInstanceID](self, "HAPInstanceID"));

  if (!v5)
  {
LABEL_13:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition controllerContext](self, "controllerContext"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition controllerContext](self, "controllerContext"));
      v51 = 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serializeWithError:", &v51));
      v8 = v51;

      if (v8)
        goto LABEL_15;
      v18 = objc_retainAutorelease(v16);
      v19 = (char *)objc_msgSend(v18, "bytes");
      v20 = (char *)objc_msgSend(v18, "length") + (_QWORD)v19;
      while (1)
      {
        v21 = v20 - v19 >= 255 ? 255 : v20 - v19;
        v22 = TLV8BufferAppend(v53, 2, v19, v21);
        if ((_DWORD)v22)
          break;
        v19 += v21;
        if (v19 >= v20)
        {

          goto LABEL_25;
        }
      }
LABEL_64:
      v9 = v22;

      if (a3)
        goto LABEL_11;
      goto LABEL_65;
    }
LABEL_25:
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition endBehavior](self, "endBehavior"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition endBehavior](self, "endBehavior"));
      v50 = 0;
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "serializeWithError:", &v50));
      v8 = v50;

      if (v8)
        goto LABEL_3;
      v7 = objc_retainAutorelease(v7);
      v10 = TLV8BufferAppend(v53, 3, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
      if ((_DWORD)v10)
        goto LABEL_5;

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearTransition](self, "linearTransition"));

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearTransition](self, "linearTransition"));
      v49 = 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "serializeWithError:", &v49));
      v8 = v49;

      if (!v8)
      {
        v18 = objc_retainAutorelease(v16);
        v27 = (char *)objc_msgSend(v18, "bytes");
        v28 = (char *)objc_msgSend(v18, "length") + (_QWORD)v27;
        while (1)
        {
          v29 = v28 - v27 >= 255 ? 255 : v28 - v27;
          v22 = TLV8BufferAppend(v53, 4, v27, v29);
          if ((_DWORD)v22)
            goto LABEL_64;
          v27 += v29;
          if (v27 >= v28)
          {

            goto LABEL_38;
          }
        }
      }
    }
    else
    {
LABEL_38:
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearDerivedTransition](self, "linearDerivedTransition"));

      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearDerivedTransition](self, "linearDerivedTransition"));
        v48 = 0;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "serializeWithError:", &v48));
        v8 = v48;

        if (!v8)
        {
          v18 = objc_retainAutorelease(v16);
          v32 = (char *)objc_msgSend(v18, "bytes");
          v33 = (char *)objc_msgSend(v18, "length") + (_QWORD)v32;
          while (1)
          {
            v34 = v33 - v32 >= 255 ? 255 : v33 - v32;
            v22 = TLV8BufferAppend(v53, 5, v32, v34);
            if ((_DWORD)v22)
              goto LABEL_64;
            v32 += v34;
            if (v32 >= v33)
            {

              goto LABEL_47;
            }
          }
        }
      }
      else
      {
LABEL_47:
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition valueUpdateTimeInterval](self, "valueUpdateTimeInterval"));

        if (v35)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition valueUpdateTimeInterval](self, "valueUpdateTimeInterval"));
          v47 = 0;
          v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "serializeWithError:", &v47));
          v8 = v47;

          if (v8)
            goto LABEL_3;
          v7 = objc_retainAutorelease(v7);
          v10 = TLV8BufferAppend(v53, 6, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
          if ((_DWORD)v10)
            goto LABEL_5;

        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyValueChangeThreshold](self, "notifyValueChangeThreshold"));

        if (!v37)
        {
LABEL_60:
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](self, "notifyTimeIntervalThreshold"));

          if (!v42)
            goto LABEL_63;
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](self, "notifyTimeIntervalThreshold"));
          v45 = 0;
          v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "serializeWithError:", &v45));
          v8 = v45;

          if (v8)
            goto LABEL_3;
          v7 = objc_retainAutorelease(v7);
          v10 = TLV8BufferAppend(v53, 8, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
          goto LABEL_5;
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyValueChangeThreshold](self, "notifyValueChangeThreshold"));
        v46 = 0;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "serializeWithError:", &v46));
        v8 = v46;

        if (!v8)
        {
          v18 = objc_retainAutorelease(v16);
          v39 = (char *)objc_msgSend(v18, "bytes");
          v40 = (char *)objc_msgSend(v18, "length") + (_QWORD)v39;
          while (1)
          {
            v41 = v40 - v39 >= 255 ? 255 : v40 - v39;
            v22 = TLV8BufferAppend(v53, 7, v39, v41);
            if ((_DWORD)v22)
              goto LABEL_64;
            v39 += v41;
            if (v39 >= v40)
            {

              goto LABEL_60;
            }
          }
        }
      }
    }
LABEL_15:

    if (a3)
    {
LABEL_16:
      v13 = objc_retainAutorelease(v8);
      v8 = v13;
      goto LABEL_17;
    }
LABEL_66:
    v17 = 0;
    goto LABEL_67;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition HAPInstanceID](self, "HAPInstanceID"));
  v52 = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serializeWithError:", &v52));
  v8 = v52;

  if (v8)
  {
LABEL_3:
    v9 = 0;
    goto LABEL_6;
  }
  v7 = objc_retainAutorelease(v7);
  v10 = TLV8BufferAppend(v53, 1, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  if (!(_DWORD)v10)
  {

    goto LABEL_13;
  }
LABEL_5:
  v9 = v10;
LABEL_6:

  if (v8)
  {
    if (!a3)
      goto LABEL_66;
    goto LABEL_16;
  }
  if (!(_DWORD)v9)
  {
LABEL_63:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v53[0]));
    v8 = 0;
    goto LABEL_67;
  }
  if (!a3)
  {
LABEL_65:
    v8 = 0;
    goto LABEL_66;
  }
LABEL_11:
  v12 = sub_100040DDC(v9);
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  v8 = 0;
LABEL_17:
  v17 = 0;
  *a3 = v13;
LABEL_67:
  TLV8BufferFree(v53, v11);

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPCharacteristicValueTransition *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HAPCharacteristicValueTransition *v13;

  v4 = +[HAPCharacteristicValueTransition allocWithZone:](HAPCharacteristicValueTransition, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition HAPInstanceID](self, "HAPInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition controllerContext](self, "controllerContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition endBehavior](self, "endBehavior"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearTransition](self, "linearTransition"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearDerivedTransition](self, "linearDerivedTransition"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition valueUpdateTimeInterval](self, "valueUpdateTimeInterval"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyValueChangeThreshold](self, "notifyValueChangeThreshold"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](self, "notifyTimeIntervalThreshold"));
  v13 = -[HAPCharacteristicValueTransition initWithHAPInstanceID:controllerContext:endBehavior:linearTransition:linearDerivedTransition:valueUpdateTimeInterval:notifyValueChangeThreshold:notifyTimeIntervalThreshold:](v4, "initWithHAPInstanceID:controllerContext:endBehavior:linearTransition:linearDerivedTransition:valueUpdateTimeInterval:notifyValueChangeThreshold:notifyTimeIntervalThreshold:", v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  uint64_t v5;
  HAPCharacteristicValueTransition *v6;
  uint64_t v7;
  HAPCharacteristicValueTransition *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  v6 = (HAPCharacteristicValueTransition *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    v7 = objc_opt_class(HAPCharacteristicValueTransition, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition HAPInstanceID](self, "HAPInstanceID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition HAPInstanceID](v8, "HAPInstanceID"));
      if (v9 != v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition HAPInstanceID](self, "HAPInstanceID"));
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition HAPInstanceID](v8, "HAPInstanceID"));
        v66 = v11;
        if (!objc_msgSend(v11, "isEqual:", v3))
        {
          v12 = 0;
          goto LABEL_43;
        }
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition controllerContext](self, "controllerContext"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition controllerContext](v8, "controllerContext"));
      if (v13 != v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition controllerContext](self, "controllerContext"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition controllerContext](v8, "controllerContext"));
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v12 = 0;
LABEL_41:

LABEL_42:
          if (v9 == v10)
          {
LABEL_44:

            goto LABEL_45;
          }
LABEL_43:

          goto LABEL_44;
        }
        v63 = v15;
      }
      v16 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition endBehavior](self, "endBehavior"));
      v17 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition endBehavior](v8, "endBehavior"));
      v64 = (void *)v16;
      v18 = v16 == v17;
      v19 = (void *)v17;
      if (!v18)
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition endBehavior](self, "endBehavior"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition endBehavior](v8, "endBehavior"));
        if (!objc_msgSend(v61, "isEqual:"))
        {
          v12 = 0;
          v20 = v19;
          v21 = v64;
LABEL_39:

LABEL_40:
          v15 = v63;
          if (v13 == v14)
            goto LABEL_42;
          goto LABEL_41;
        }
      }
      v59 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearTransition](self, "linearTransition"));
      v62 = v3;
      v58 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearTransition](v8, "linearTransition"));
      if (v59 != v58)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearTransition](self, "linearTransition"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearTransition](v8, "linearTransition"));
        v57 = v22;
        if (!objc_msgSend(v22, "isEqual:"))
        {
          v20 = v19;
          v12 = 0;
          v23 = (void *)v58;
          v24 = (void *)v59;
LABEL_37:

LABEL_38:
          v21 = v64;
          v3 = v62;
          if (v64 == v20)
            goto LABEL_40;
          goto LABEL_39;
        }
      }
      v25 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearDerivedTransition](self, "linearDerivedTransition"));
      v54 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearDerivedTransition](v8, "linearDerivedTransition"));
      v55 = (void *)v25;
      if (v25 != v54)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearDerivedTransition](self, "linearDerivedTransition"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearDerivedTransition](v8, "linearDerivedTransition"));
        v51 = v26;
        if (!objc_msgSend(v26, "isEqual:"))
        {
          v20 = v19;
          v12 = 0;
          v28 = (void *)v54;
          v27 = v55;
LABEL_35:

LABEL_36:
          v23 = (void *)v58;
          v24 = (void *)v59;
          if (v59 == v58)
            goto LABEL_38;
          goto LABEL_37;
        }
      }
      v29 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition valueUpdateTimeInterval](self, "valueUpdateTimeInterval"));
      v52 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition valueUpdateTimeInterval](v8, "valueUpdateTimeInterval"));
      v53 = (void *)v29;
      if (v29 != v52)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition valueUpdateTimeInterval](self, "valueUpdateTimeInterval"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition valueUpdateTimeInterval](v8, "valueUpdateTimeInterval"));
        v48 = v30;
        if (!objc_msgSend(v30, "isEqual:"))
        {
          v20 = v19;
          v12 = 0;
          v31 = (void *)v52;
LABEL_33:

LABEL_34:
          v28 = (void *)v54;
          v27 = v55;
          if (v55 == (void *)v54)
            goto LABEL_36;
          goto LABEL_35;
        }
      }
      v32 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyValueChangeThreshold](self, "notifyValueChangeThreshold"));
      v45 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyValueChangeThreshold](v8, "notifyValueChangeThreshold"));
      v46 = (void *)v32;
      v49 = v13;
      if (v32 == v45
        || (v33 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyValueChangeThreshold](self, "notifyValueChangeThreshold")), v43 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyValueChangeThreshold](v8, "notifyValueChangeThreshold")), v44 = v33, objc_msgSend(v33, "isEqual:")))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](self, "notifyTimeIntervalThreshold", v19));
        v35 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](v8, "notifyTimeIntervalThreshold"));
        if (v34 == (void *)v35)
        {

          v12 = 1;
        }
        else
        {
          v36 = (void *)v35;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](self, "notifyTimeIntervalThreshold"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](v8, "notifyTimeIntervalThreshold"));
          v12 = objc_msgSend(v37, "isEqual:", v38);

        }
        v39 = (void *)v45;
        v40 = v46;
        v20 = v42;
        if (v46 == (void *)v45)
        {
LABEL_32:

          v31 = (void *)v52;
          v13 = v49;
          if (v53 == (void *)v52)
            goto LABEL_34;
          goto LABEL_33;
        }
      }
      else
      {
        v20 = v19;
        v12 = 0;
        v39 = (void *)v45;
        v40 = v46;
      }

      goto LABEL_32;
    }
    v12 = 0;
  }
LABEL_45:

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition HAPInstanceID](self, "HAPInstanceID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition controllerContext](self, "controllerContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition endBehavior](self, "endBehavior"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearTransition](self, "linearTransition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition linearDerivedTransition](self, "linearDerivedTransition"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition valueUpdateTimeInterval](self, "valueUpdateTimeInterval"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyValueChangeThreshold](self, "notifyValueChangeThreshold"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](self, "notifyTimeIntervalThreshold"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPCharacteristicValueTransition HAPInstanceID=%@, controllerContext=%@, endBehavior=%@, linearTransition=%@, linearDerivedTransition=%@, valueUpdateTimeInterval=%@, notifyValueChangeThreshold=%@, notifyTimeIntervalThreshold=%@>"), v3, v4, v5, v6, v7, v8, v9, v10));

  return (NSString *)v11;
}

- (HAPTLVUnsignedNumberValue)HAPInstanceID
{
  return self->_HAPInstanceID;
}

- (void)setHAPInstanceID:(id)a3
{
  objc_storeStrong((id *)&self->_HAPInstanceID, a3);
}

- (NSData)controllerContext
{
  return self->_controllerContext;
}

- (void)setControllerContext:(id)a3
{
  objc_storeStrong((id *)&self->_controllerContext, a3);
}

- (HAPCharacteristicValueTransitionEndBehaviorWrapper)endBehavior
{
  return self->_endBehavior;
}

- (void)setEndBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_endBehavior, a3);
}

- (HAPCharacteristicValueLinearTransition)linearTransition
{
  return self->_linearTransition;
}

- (void)setLinearTransition:(id)a3
{
  objc_storeStrong((id *)&self->_linearTransition, a3);
}

- (HAPCharacteristicValueLinearDerivedTransition)linearDerivedTransition
{
  return self->_linearDerivedTransition;
}

- (void)setLinearDerivedTransition:(id)a3
{
  objc_storeStrong((id *)&self->_linearDerivedTransition, a3);
}

- (HAPTLVUnsignedNumberValue)valueUpdateTimeInterval
{
  return self->_valueUpdateTimeInterval;
}

- (void)setValueUpdateTimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_valueUpdateTimeInterval, a3);
}

- (NSData)notifyValueChangeThreshold
{
  return self->_notifyValueChangeThreshold;
}

- (void)setNotifyValueChangeThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_notifyValueChangeThreshold, a3);
}

- (HAPTLVUnsignedNumberValue)notifyTimeIntervalThreshold
{
  return self->_notifyTimeIntervalThreshold;
}

- (void)setNotifyTimeIntervalThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_notifyTimeIntervalThreshold, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyTimeIntervalThreshold, 0);
  objc_storeStrong((id *)&self->_notifyValueChangeThreshold, 0);
  objc_storeStrong((id *)&self->_valueUpdateTimeInterval, 0);
  objc_storeStrong((id *)&self->_linearDerivedTransition, 0);
  objc_storeStrong((id *)&self->_linearTransition, 0);
  objc_storeStrong((id *)&self->_endBehavior, 0);
  objc_storeStrong((id *)&self->_controllerContext, 0);
  objc_storeStrong((id *)&self->_HAPInstanceID, 0);
}

@end
