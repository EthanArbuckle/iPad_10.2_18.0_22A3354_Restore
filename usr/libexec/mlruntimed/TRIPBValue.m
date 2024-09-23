@implementation TRIPBValue

+ (id)mlr_listValueWithNSArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_opt_new(TRIPBListValue);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valuesArray", (_QWORD)v14));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[TRIPBValue mlr_valueWithObject:](TRIPBValue, "mlr_valueWithObject:", v10));
        objc_msgSend(v11, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)mlr_valueWithObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_opt_new(TRIPBValue);
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    objc_msgSend(v5, "setStringValue:", v4);
    goto LABEL_12;
  }
  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    objc_msgSend(v4, "doubleValue");
    objc_msgSend(v5, "setNumberValue:");
    goto LABEL_12;
  }
  v8 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TRIPBStruct mlr_structWithDictionary:](TRIPBStruct, "mlr_structWithDictionary:", v4));
    objc_msgSend(v5, "setStructValue:", v9);
LABEL_9:

    goto LABEL_12;
  }
  v10 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mlr_listValueWithNSArray:", v4));
    objc_msgSend(v5, "setListValue:", v9);
    goto LABEL_9;
  }
  v11 = objc_opt_class(TRIPBValue);
  if ((objc_opt_isKindOfClass(v4, v11) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("obj=%@"), v4, NSLocalizedDescriptionKey));
    v18 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Unexpected type in obj"), v15));

    objc_exception_throw(v16);
  }
  v12 = v4;

  v5 = v12;
LABEL_12:

  return v5;
}

+ (id)mlr_valueWithBoolValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new(TRIPBValue);
  objc_msgSend(v4, "setBoolValue:", v3);
  return v4;
}

+ (id)mlr_valueWithNullValue
{
  void *v2;

  v2 = (void *)objc_opt_new(TRIPBValue);
  objc_msgSend(v2, "setNullValue:", 0);
  return v2;
}

@end
