@implementation HAPDataValueTransformer

+ (Class)expectedTransformedClassForFormat:(unint64_t)a3
{
  uint64_t v3;

  if (a3 - 1 > 0xC)
    return (Class)0;
  v3 = objc_opt_class(NSData, a2);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v3);
}

+ (BOOL)isValidFormat:(unint64_t)a3
{
  return (a3 < 0x10) & (0x3FFEu >> a3);
}

+ (id)defaultDataValueTransformer
{
  return (id)qword_1002716A8;
}

+ (void)initialize
{
  HAPDataValueTransformer *v2;
  void *v3;

  if (!qword_1002716A8)
  {
    v2 = objc_alloc_init(HAPDataValueTransformer);
    v3 = (void *)qword_1002716A8;
    qword_1002716A8 = (uint64_t)v2;

  }
}

- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  id v30;
  unsigned __int8 v31;
  uint64_t v32;
  unsigned __int16 v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  __CFString *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  objc_super v55;
  _BYTE buf[12];
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  NSErrorUserInfoKey v61;
  void *v62;

  v8 = a3;
  if (!v8)
  {
    if (+[HAPDataValueTransformer isValidFormat:](HAPDataValueTransformer, "isValidFormat:", a4))
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
LABEL_11:
      v16 = v14;
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  v55.receiver = self;
  v55.super_class = (Class)HAPDataValueTransformer;
  v9 = -[HAPValueTransformer transformedValue:format:error:](&v55, "transformedValue:format:error:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if ((v11 & 1) == 0)
    goto LABEL_17;
  if (!+[HAPDataValueTransformer isValidFormat:](HAPDataValueTransformer, "isValidFormat:", a4))
  {
LABEL_9:
    v15 = objc_opt_class(NSData, v12);
    if ((objc_opt_isKindOfClass(v8, v15) & 1) != 0)
    {
LABEL_10:
      v14 = v8;
      goto LABEL_11;
    }
    v17 = sub_1000741FC(a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid format type '%@' for value of class '%@'"), v18, objc_opt_class(v8, v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    v23 = sub_10007CCE4(0, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = sub_10007CD2C(0);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v26;
      v57 = 2112;
      v58 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@[HAPDataValueTransformer] %@", buf, 0x16u);

    }
    if (a5)
    {
      v61 = NSLocalizedDescriptionKey;
      v62 = v21;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6717, v27));

    }
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  switch(a4)
  {
    case 1uLL:
      v29 = objc_opt_class(NSNumber, v12);
      if ((objc_opt_isKindOfClass(v8, v29) & 1) == 0)
        goto LABEL_69;
      v30 = v8;
      if (objc_msgSend(v30, "compare:", &off_100245708) == (id)1
        || objc_msgSend(v30, "compare:", &off_100245720) == (id)-1)
      {
        goto LABEL_65;
      }
      v31 = objc_msgSend(v30, "unsignedCharValue");
      goto LABEL_39;
    case 2uLL:
      v32 = objc_opt_class(NSNumber, v12);
      if ((objc_opt_isKindOfClass(v8, v32) & 1) == 0)
        goto LABEL_69;
      v30 = v8;
      if (objc_msgSend(v30, "compare:", &off_100245738) == (id)1
        || objc_msgSend(v30, "compare:", &off_100245720) == (id)-1)
      {
        goto LABEL_65;
      }
      v33 = (unsigned __int16)objc_msgSend(v30, "unsignedShortValue");
      goto LABEL_44;
    case 3uLL:
      v34 = objc_opt_class(NSNumber, v12);
      if ((objc_opt_isKindOfClass(v8, v34) & 1) == 0)
        goto LABEL_69;
      v30 = v8;
      if (objc_msgSend(v30, "compare:", &off_100245750) == (id)1
        || objc_msgSend(v30, "compare:", &off_100245720) == (id)-1)
      {
        goto LABEL_65;
      }
      v35 = objc_msgSend(v30, "unsignedIntValue");
      goto LABEL_49;
    case 4uLL:
      v36 = objc_opt_class(NSNumber, v12);
      if ((objc_opt_isKindOfClass(v8, v36) & 1) == 0)
        goto LABEL_69;
      v30 = v8;
      if (objc_msgSend(v30, "compare:", &off_100245768) == (id)1
        || objc_msgSend(v30, "compare:", &off_100245720) == (id)-1)
      {
        goto LABEL_65;
      }
      v37 = objc_msgSend(v30, "unsignedLongLongValue");
      goto LABEL_54;
    case 5uLL:
      v38 = objc_opt_class(NSNumber, v12);
      if ((objc_opt_isKindOfClass(v8, v38) & 1) == 0)
        goto LABEL_69;
      v30 = v8;
      if (objc_msgSend(v30, "compare:", &off_100245648) == (id)1
        || objc_msgSend(v30, "compare:", &off_100245660) == (id)-1)
      {
        goto LABEL_65;
      }
      v31 = objc_msgSend(v30, "charValue");
LABEL_39:
      buf[0] = v31;
      v39 = 1;
      goto LABEL_64;
    case 6uLL:
      v40 = objc_opt_class(NSNumber, v12);
      if ((objc_opt_isKindOfClass(v8, v40) & 1) == 0)
        goto LABEL_69;
      v30 = v8;
      if (objc_msgSend(v30, "compare:", &off_100245678) == (id)1
        || objc_msgSend(v30, "compare:", &off_100245690) == (id)-1)
      {
        goto LABEL_65;
      }
      v33 = (unsigned __int16)objc_msgSend(v30, "shortValue");
LABEL_44:
      *(_WORD *)buf = v33;
      v39 = 2;
      goto LABEL_64;
    case 7uLL:
      v41 = objc_opt_class(NSNumber, v12);
      if ((objc_opt_isKindOfClass(v8, v41) & 1) == 0)
        goto LABEL_69;
      v30 = v8;
      if (objc_msgSend(v30, "compare:", &off_1002456A8) == (id)1
        || objc_msgSend(v30, "compare:", &off_1002456C0) == (id)-1)
      {
        goto LABEL_65;
      }
      v35 = objc_msgSend(v30, "intValue");
LABEL_49:
      *(_DWORD *)buf = v35;
      goto LABEL_63;
    case 8uLL:
      v42 = objc_opt_class(NSNumber, v12);
      if ((objc_opt_isKindOfClass(v8, v42) & 1) == 0)
        goto LABEL_69;
      v30 = v8;
      if (objc_msgSend(v30, "compare:", &off_1002456D8) == (id)1
        || objc_msgSend(v30, "compare:", &off_1002456F0) == (id)-1)
      {
        goto LABEL_65;
      }
      v37 = objc_msgSend(v30, "longLongValue");
LABEL_54:
      *(_QWORD *)buf = v37;
      v39 = 8;
      goto LABEL_64;
    case 9uLL:
      buf[0] = 0;
      if ((objc_msgSend(v8, "isEqual:", &__kCFBooleanFalse) & 1) != 0)
        goto LABEL_58;
      if (!objc_msgSend(v8, "isEqual:", &__kCFBooleanTrue))
        goto LABEL_17;
      buf[0] = 1;
LABEL_58:
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 1));
      goto LABEL_11;
    case 0xAuLL:
      v43 = objc_opt_class(NSNumber, v12);
      if ((objc_opt_isKindOfClass(v8, v43) & 1) == 0)
        goto LABEL_69;
      v30 = v8;
      if (objc_msgSend(v30, "compare:", &off_100245848) == (id)1
        || objc_msgSend(v30, "compare:", &off_100245858) == (id)-1)
      {
LABEL_65:
        v16 = 0;
      }
      else
      {
        objc_msgSend(v30, "floatValue");
        *(_DWORD *)buf = v44;
LABEL_63:
        v39 = 4;
LABEL_64:
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, v39));
      }

      break;
    case 0xBuLL:
      v45 = objc_opt_class(NSString, v12);
      if ((objc_opt_isKindOfClass(v8, v45) & 1) == 0)
        goto LABEL_69;
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
      goto LABEL_11;
    case 0xCuLL:
    case 0xDuLL:
      v13 = objc_opt_class(NSData, v12);
      if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
        goto LABEL_10;
      goto LABEL_69;
    default:
LABEL_69:
      v46 = sub_10007CCE4(0, v12);
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = sub_10007CD2C(0);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        v50 = sub_1000741FC(a4);
        v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
        v53 = (void *)objc_opt_class(v8, v52);
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v49;
        v57 = 2112;
        v58 = v51;
        v59 = 2112;
        v60 = v53;
        v54 = v53;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}@[HAPDataValueTransformer] Invalid format/class (%@/%@) combination.", buf, 0x20u);

      }
      if (!a5)
        goto LABEL_17;
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6737, 0));
      break;
  }
LABEL_18:

  return v16;
}

- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  void *v38;

  v8 = a3;
  if (v8
    && (v32.receiver = self,
        v32.super_class = (Class)HAPDataValueTransformer,
        v9 = -[HAPValueTransformer reverseTransformedValue:format:error:](&v32, "reverseTransformedValue:format:error:", v8, a4, a5), v10 = (void *)objc_claimAutoreleasedReturnValue(v9), v11 = objc_msgSend(v8, "isEqual:", v10), v10, !v11))
  {
    v20 = 0;
  }
  else if (+[HAPDataValueTransformer isValidFormat:](HAPDataValueTransformer, "isValidFormat:", a4))
  {
    v13 = v8;
    v14 = v13;
    switch(a4)
    {
      case 1uLL:
        if (objc_msgSend(v13, "length") != (id)1)
          goto LABEL_34;
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v14), "bytes")));
        goto LABEL_41;
      case 2uLL:
        if (objc_msgSend(v13, "length") != (id)2)
          goto LABEL_34;
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v14), "bytes")));
        goto LABEL_41;
      case 3uLL:
        if (objc_msgSend(v13, "length") != (id)4)
          goto LABEL_34;
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)objc_msgSend(objc_retainAutorelease(v14), "bytes")));
        goto LABEL_41;
      case 4uLL:
        if (objc_msgSend(v13, "length") != (id)8)
          goto LABEL_34;
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)objc_msgSend(objc_retainAutorelease(v14), "bytes")));
        goto LABEL_41;
      case 5uLL:
        if (objc_msgSend(v13, "length") != (id)1)
          goto LABEL_34;
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithChar:](NSNumber, "numberWithChar:", *(char *)objc_msgSend(objc_retainAutorelease(v14), "bytes")));
        goto LABEL_41;
      case 6uLL:
        if (objc_msgSend(v13, "length") != (id)2)
          goto LABEL_34;
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", *(__int16 *)objc_msgSend(objc_retainAutorelease(v14), "bytes")));
        goto LABEL_41;
      case 7uLL:
        if (objc_msgSend(v13, "length") != (id)4)
          goto LABEL_34;
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)objc_msgSend(objc_retainAutorelease(v14), "bytes")));
        goto LABEL_41;
      case 8uLL:
        if (objc_msgSend(v13, "length") != (id)8)
          goto LABEL_34;
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", *(_QWORD *)objc_msgSend(objc_retainAutorelease(v14), "bytes")));
        goto LABEL_41;
      case 9uLL:
        if (objc_msgSend(v13, "length") != (id)1)
          goto LABEL_34;
        if (*(_BYTE *)objc_msgSend(objc_retainAutorelease(v14), "bytes") == 1)
          v21 = &__kCFBooleanTrue;
        else
          v21 = &__kCFBooleanFalse;
        v15 = v21;
        goto LABEL_41;
      case 0xAuLL:
        if (objc_msgSend(v13, "length") != (id)4)
          goto LABEL_34;
        LODWORD(v22) = *(_DWORD *)objc_msgSend(objc_retainAutorelease(v14), "bytes");
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
        goto LABEL_41;
      case 0xBuLL:
        v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v13, 4);
        goto LABEL_41;
      default:
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
        {
          v15 = v13;
LABEL_41:
          v20 = v15;
        }
        else
        {
          if (!objc_msgSend(v14, "length"))
            goto LABEL_39;
LABEL_34:
          v24 = sub_10007CCE4(0, v23);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = sub_10007CD2C(0);
            v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
            v28 = sub_1000741FC(a4);
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "length")));
            *(_DWORD *)buf = 138543874;
            v34 = v27;
            v35 = 2112;
            v36 = (unint64_t)v29;
            v37 = 2112;
            v38 = v30;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@[HAPDataValueTransformer] Invalid format/data length (%@/%@) combination.", buf, 0x20u);

          }
          if (a5)
          {
            v20 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6737, 0));
          }
          else
          {
LABEL_39:
            v20 = 0;
          }
        }

        break;
    }
  }
  else
  {
    v16 = sub_10007CCE4(0, v12);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = sub_10007CD2C(0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138543618;
      v34 = v19;
      v35 = 2048;
      v36 = a4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPDataValueTransformer] Invalid format '%tu', returning value unchanged", buf, 0x16u);

    }
    v20 = v8;
  }

  return v20;
}

@end
