@implementation FMDJSONEncoder

- (FMDJSONEncoder)init
{
  FMDJSONEncoder *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *container;
  NSMutableArray *v5;
  NSMutableArray *stack;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDJSONEncoder;
  v2 = -[FMDJSONEncoder init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    container = v2->_container;
    v2->_container = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    stack = v2->_stack;
    v2->_stack = v5;

  }
  return v2;
}

- (FMDJSONEncoder)initWithRootObject:(id)a3 error:(id *)a4
{
  id v6;
  FMDJSONEncoder *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *container;
  NSMutableArray *v10;
  NSMutableArray *stack;
  id v12;
  id v13;
  void *v14;
  FMDJSONEncoder *v15;
  id v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FMDJSONEncoder;
  v7 = -[FMDJSONEncoder init](&v18, "init");
  if (!v7)
    goto LABEL_6;
  v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  container = v7->_container;
  v7->_container = v8;

  v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  stack = v7->_stack;
  v7->_stack = v10;

  v17 = 0;
  v12 = -[FMDJSONEncoder processObject:error:](v7, "processObject:error:", v6, &v17);
  v13 = v17;
  if (v13)
  {
    v14 = v13;
    if (a4)
      *a4 = objc_retainAutorelease(v13);

    v15 = 0;
  }
  else
  {
LABEL_6:
    v15 = v7;
  }

  return v15;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(0x%p)"), objc_opt_class(self, a2), self);
}

- (BOOL)encodeObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void **p_vtable;
  id v13;
  FMDJSONEncoder *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  unsigned __int8 v30;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = sub_10005303C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_100229068();

  p_vtable = &OBJC_METACLASS___FMDRequestAckWipe.vtable;
  if (v8)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

    if (v13 == v8)
    {
      v14 = (FMDJSONEncoder *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
      -[FMDJSONEncoder setObject:forKey:](v14, "setObject:forKey:", v8, v9);
    }
    else
    {
      v32 = 0;
      v14 = -[FMDJSONEncoder initWithRootObject:error:]([FMDJSONEncoder alloc], "initWithRootObject:error:", v8, &v32);
      v15 = v32;
      if (v15)
      {
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v17));

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed Key: %@"), v9));
        objc_msgSend(v18, "setObject:forKey:", v19, NSLocalizedRecoverySuggestionErrorKey);

        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
        if (v20)
        {
          v21 = (void *)v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", NSLocalizedFailureReasonErrorKey));

          if (v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", NSLocalizedFailureReasonErrorKey));
            objc_msgSend(v18, "setObject:forKey:", v25, NSLocalizedFailureReasonErrorKey);

          }
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "domain"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, objc_msgSend(v16, "code"), v18));

        p_vtable = (void **)(&OBJC_METACLASS___FMDRequestAckWipe + 24);
        goto LABEL_19;
      }
      if ((id)-[FMDJSONEncoder rootType](v14, "rootType") == (id)1)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
        v29 = objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder stack](v14, "stack"));
LABEL_18:
        v26 = (void *)v29;
        objc_msgSend(v18, "setObject:forKey:", v29, v9);
        v27 = 0;
LABEL_19:

        goto LABEL_20;
      }
      if (!-[FMDJSONEncoder rootType](v14, "rootType"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
        v29 = objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](v14, "container"));
        goto LABEL_18;
      }
    }
  }
  else
  {
    v28 = sub_10005303C();
    v14 = (FMDJSONEncoder *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEBUG))
      sub_100229008();
  }
  v27 = 0;
LABEL_20:

  v30 = objc_msgSend(p_vtable + 392, "checkAndSetOutError:WithError:", a5, v27);
  return v30;
}

- (BOOL)encodeObjects:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  FMDJSONEncoder *v18;
  FMDJSONEncoder *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v7 = a3;
  v8 = a4;
  v9 = sub_10005303C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1002290D0();

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v16);
        v18 = [FMDJSONEncoder alloc];
        v37 = 0;
        v19 = -[FMDJSONEncoder initWithRootObject:error:](v18, "initWithRootObject:error:", v17, &v37);
        v20 = v37;
        if (v20)
        {
          v24 = v20;

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "userInfo"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v25));

          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed Key: %@"), v8));
          objc_msgSend(v22, "setObject:forKey:", v26, NSLocalizedRecoverySuggestionErrorKey);

          v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "userInfo"));
          if (v27)
          {
            v28 = (void *)v27;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "userInfo"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", NSLocalizedFailureReasonErrorKey));

            if (v30)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "userInfo"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", NSLocalizedFailureReasonErrorKey));
              objc_msgSend(v22, "setObject:forKey:", v32, NSLocalizedFailureReasonErrorKey);

            }
          }
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "domain"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v33, objc_msgSend(v24, "code"), v22));

          goto LABEL_16;
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](v19, "container"));
        objc_msgSend(v11, "addObject:", v21);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v14)
        continue;
      break;
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
  objc_msgSend(v22, "setObject:forKey:", v11, v8);
  v23 = 0;
LABEL_16:

  v34 = +[FMDJSONEncoder checkAndSetOutError:WithError:](FMDJSONEncoder, "checkAndSetOutError:WithError:", a5, v23);
  return v34;
}

- (void)encodeString:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (v10)
  {
    v8 = objc_opt_class(NSString, v6);
    if ((objc_opt_isKindOfClass(v10, v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
      objc_msgSend(v9, "setObject:forKey:", v10, v7);

    }
  }

}

- (void)encodeNumber:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (v10)
  {
    v8 = objc_opt_class(NSNumber, v6);
    if ((objc_opt_isKindOfClass(v10, v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
      objc_msgSend(v9, "setObject:forKey:", v10, v7);

    }
  }

}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)encodeUnsignedInteger:(unint64_t)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  id v6;
  double v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
  *(float *)&v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
  objc_msgSend(v9, "setObject:forKey:", v8, v6);

}

- (void)encodeObjectTypeUsingClass:(Class)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class objectType](a3, "objectType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class objectTypeKey](a3, "objectTypeKey"));
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (id)processObject:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  int64_t v36;

  v6 = a3;
  v7 = sub_10005303C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v6;
    v35 = 2048;
    v36 = -[FMDJSONEncoder rootType](self, "rootType");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "processObject:%@ root-type:%lu", buf, 0x16u);
  }

  v9 = sub_10005303C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1002291A0(self, v10);

  if ((objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___FMDCodable) & 1) != 0)
  {
    v11 = objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___FMDCodableCollection);
    v12 = sub_10005303C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      if (v14)
        sub_100229138(v13, v15, v16, v17, v18, v19, v20, v21);

      v30 = 0;
      v22 = (id *)&v30;
      -[FMDJSONEncoder encodeCollectionObject:error:](self, "encodeCollectionObject:error:", v6, &v30);
    }
    else
    {
      if (v14)
        sub_10022916C(v13, v15, v16, v17, v18, v19, v20, v21);

      -[FMDJSONEncoder setRootType:](self, "setRootType:", 0);
      v29 = 0;
      v22 = (id *)&v29;
      objc_msgSend(v6, "encodeWithFMDCoder:error:", self, &v29);
    }
    v25 = *v22;
    if (!v25)
    {
      if (-[FMDJSONEncoder rootType](self, "rootType"))
      {
        if ((id)-[FMDJSONEncoder rootType](self, "rootType") != (id)1)
        {
          v24 = 0;
          goto LABEL_16;
        }
        v28 = objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder stack](self, "stack"));
      }
      else
      {
        v28 = objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
      }
      v26 = (void *)v28;
      v24 = 0;
      goto LABEL_17;
    }
    v24 = v25;
  }
  else
  {
    v31 = NSLocalizedFailureReasonErrorKey;
    v32 = CFSTR("Object not supported by encoder");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONEncoderError"), -1, v23));

  }
LABEL_16:
  v26 = 0;
LABEL_17:
  +[FMDJSONEncoder checkAndSetOutError:WithError:](FMDJSONEncoder, "checkAndSetOutError:WithError:", a4, v24);

  return v26;
}

- (BOOL)encodeCollectionObject:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];

  v6 = a3;
  v7 = sub_10005303C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100229258();

  v10 = objc_opt_class(NSArray, v9);
  if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
  {
    -[FMDJSONEncoder setRootType:](self, "setRootType:", 1);
    v33 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder encodeArrayCollectionObject:error:](self, "encodeArrayCollectionObject:error:", v6, &v33));
    v13 = v33;
    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder stack](self, "stack"));
      objc_msgSend(v14, "addObjectsFromArray:", v12);
LABEL_6:

    }
LABEL_7:

LABEL_21:
    goto LABEL_22;
  }
  v15 = objc_opt_class(NSDictionary, v11);
  if ((objc_opt_isKindOfClass(v6, v15) & 1) != 0)
  {
    -[FMDJSONEncoder setRootType:](self, "setRootType:", 0);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v17)
    {
      v19 = v17;
      v20 = *(_QWORD *)v30;
LABEL_11:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v21);
        v23 = objc_opt_class(NSString, v18);
        if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
          break;
        if (v19 == (id)++v21)
        {
          v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          if (v19)
            goto LABEL_11;

          v28 = 0;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder encodeStringKeysDictionaryCollectionObject:error:](self, "encodeStringKeysDictionaryCollectionObject:error:", v16, &v28));
          v13 = v28;
          if (!v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](self, "container"));
            objc_msgSend(v14, "addEntriesFromDictionary:", v12);
            goto LABEL_6;
          }
          goto LABEL_7;
        }
      }
    }

    -[FMDJSONEncoder encodeObjectTypeUsingClass:](self, "encodeObjectTypeUsingClass:", objc_opt_class(v16, v24));
    v27 = 0;
    objc_msgSend(v16, "encodeWithFMDCoder:error:", self, &v27);
    v13 = v27;
    goto LABEL_21;
  }
  v13 = 0;
LABEL_22:
  v25 = +[FMDJSONEncoder checkAndSetOutError:WithError:](FMDJSONEncoder, "checkAndSetOutError:WithError:", a4, v13);

  return v25;
}

- (id)encodeArrayCollectionObject:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  FMDJSONEncoder *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v5 = a3;
  v6 = sub_10005303C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1002292B8();

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v10)
  {
    v27 = 0;
    goto LABEL_24;
  }
  v12 = v10;
  v29 = a4;
  v13 = *(_QWORD *)v32;
LABEL_5:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v32 != v13)
      objc_enumerationMutation(v9);
    v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v14);
    v16 = objc_opt_class(NSString, v11);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
    {
      v18 = objc_opt_class(NSNumber, v17);
      if ((objc_opt_isKindOfClass(v15, v18) & 1) == 0)
      {
        v20 = objc_opt_class(NSNull, v19);
        if ((objc_opt_isKindOfClass(v15, v20) & 1) == 0)
          break;
      }
    }
    objc_msgSend(v8, "addObject:", v15, v29);
LABEL_12:
    if (v12 == (id)++v14)
    {
      v26 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      v12 = v26;
      if (!v26)
      {
        v27 = 0;
        goto LABEL_22;
      }
      goto LABEL_5;
    }
  }
  v21 = objc_alloc_init(FMDJSONEncoder);
  v30 = 0;
  v22 = -[FMDJSONEncoder processObject:error:](v21, "processObject:error:", v15, &v30);
  v23 = v30;
  if (!v23)
  {
    if ((id)-[FMDJSONEncoder rootType](v21, "rootType") == (id)1)
      v24 = objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder stack](v21, "stack"));
    else
      v24 = objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](v21, "container"));
    v25 = (void *)v24;
    objc_msgSend(v8, "addObject:", v24, v29);

    goto LABEL_12;
  }
  v27 = v23;

LABEL_22:
  a4 = v29;
LABEL_24:

  +[FMDJSONEncoder checkAndSetOutError:WithError:](FMDJSONEncoder, "checkAndSetOutError:WithError:", a4, v27);
  return v8;
}

- (id)encodeStringKeysDictionaryCollectionObject:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _UNKNOWN **v13;
  _UNKNOWN **v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char isKindOfClass;
  uint64_t v21;
  FMDJSONEncoder *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  _UNKNOWN **v29;
  _UNKNOWN **v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  id *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;

  v5 = a3;
  v6 = sub_10005303C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "encodeStringKeysDictionaryCollectionObject:%@", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v10)
  {
    v33 = 0;
    goto LABEL_25;
  }
  v11 = v10;
  v38 = a4;
  v12 = *(_QWORD *)v42;
  v13 = &ACErrorKeychainDomain_ptr;
  v14 = &ACErrorKeychainDomain_ptr;
LABEL_5:
  v15 = 0;
  v39 = v11;
  while (1)
  {
    if (*(_QWORD *)v42 != v12)
      objc_enumerationMutation(v9);
    v16 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v16));
    v19 = objc_opt_class(v13[233], v18);
    isKindOfClass = objc_opt_isKindOfClass(v17, v19);

    v22 = (FMDJSONEncoder *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v16));
    if ((isKindOfClass & 1) != 0)
      goto LABEL_12;
    v23 = objc_opt_class(v14[222], v21);
    v24 = objc_opt_isKindOfClass(v22, v23);

    v22 = (FMDJSONEncoder *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v16));
    if ((v24 & 1) != 0)
      goto LABEL_12;
    v26 = objc_opt_class(NSNull, v25);
    v27 = objc_opt_isKindOfClass(v22, v26);

    if ((v27 & 1) == 0)
      break;
    v22 = (FMDJSONEncoder *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v16));
LABEL_12:
    objc_msgSend(v8, "setObject:forKey:", v22, v16);
LABEL_13:

    if (v11 == (id)++v15)
    {
      v36 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      v11 = v36;
      if (!v36)
      {
        v33 = 0;
        goto LABEL_23;
      }
      goto LABEL_5;
    }
  }
  v28 = v12;
  v29 = v13;
  v30 = v14;
  v22 = objc_alloc_init(FMDJSONEncoder);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v16));
  v40 = 0;
  v32 = -[FMDJSONEncoder processObject:error:](v22, "processObject:error:", v31, &v40);
  v33 = v40;

  if (!v33)
  {
    if ((id)-[FMDJSONEncoder rootType](v22, "rootType") == (id)1)
      v34 = objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder stack](v22, "stack"));
    else
      v34 = objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder container](v22, "container"));
    v35 = (void *)v34;
    v14 = v30;
    objc_msgSend(v8, "setObject:forKey:", v34, v16);

    v13 = v29;
    v12 = v28;
    v11 = v39;
    goto LABEL_13;
  }

LABEL_23:
  a4 = v38;
LABEL_25:

  +[FMDJSONEncoder checkAndSetOutError:WithError:](FMDJSONEncoder, "checkAndSetOutError:WithError:", a4, v33);
  return v8;
}

- (id)encodedDataWithRootObject:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  NSData *v13;
  void *v14;
  id v15;
  id v17;
  id v18[3];
  NSErrorUserInfoKey v19;
  const __CFString *v20;

  v8 = a3;
  if (!v8)
  {
    v19 = NSLocalizedFailureReasonErrorKey;
    v20 = CFSTR("object is nil");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMJSONEncoderError"), -1, v9));
LABEL_8:
    v15 = v10;
    v14 = 0;
    goto LABEL_9;
  }
  v18[0] = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder processObject:error:](self, "processObject:error:", v8, v18));
  v10 = v18[0];
  if (v10)
    v12 = 1;
  else
    v12 = v9 == 0;
  if (v12)
    goto LABEL_8;
  v17 = 0;
  v13 = +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v9, objc_msgSend((id)objc_opt_class(self, v11), "convertToNSJSONWritingOptions:", a4), &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v17;
LABEL_9:

  +[FMDJSONEncoder checkAndSetOutError:WithError:](FMDJSONEncoder, "checkAndSetOutError:WithError:", a5, v15);
  return v14;
}

+ (BOOL)checkAndSetOutError:(id *)a3 WithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a4;
  if (v5)
  {
    v6 = sub_10005303C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100229318();

    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }

  return v5 == 0;
}

+ (unint64_t)convertToNSJSONWritingOptions:(unint64_t)a3
{
  if (a3 - 1 >= 3)
    return 0;
  else
    return a3;
}

+ (id)encodedDataWithRootObject:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7;
  FMDJSONEncoder *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  FMDJSONEncoder *v16;
  __int16 v17;
  id v18;

  v7 = a3;
  v8 = objc_alloc_init(FMDJSONEncoder);
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ start encoding of object: %@", buf, 0x16u);
  }

  v14 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder encodedDataWithRootObject:options:error:](v8, "encodedDataWithRootObject:options:error:", v7, a4, &v14));
  v12 = v14;
  +[FMDJSONEncoder checkAndSetOutError:WithError:](FMDJSONEncoder, "checkAndSetOutError:WithError:", a5, v12);

  return v11;
}

+ (id)encodedDataWithRootObject:(id)a3 error:(id *)a4
{
  id v5;
  FMDJSONEncoder *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v12;
  uint8_t buf[4];
  FMDJSONEncoder *v14;
  __int16 v15;
  id v16;

  v5 = a3;
  v6 = objc_alloc_init(FMDJSONEncoder);
  v7 = sub_1000031B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ start encoding of object: %@", buf, 0x16u);
  }

  v12 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDJSONEncoder encodedDataWithRootObject:options:error:](v6, "encodedDataWithRootObject:options:error:", v5, 3, &v12));
  v10 = v12;
  +[FMDJSONEncoder checkAndSetOutError:WithError:](FMDJSONEncoder, "checkAndSetOutError:WithError:", a4, v10);

  return v9;
}

- (NSMutableDictionary)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
  objc_storeStrong((id *)&self->_stack, a3);
}

- (int64_t)rootType
{
  return self->_rootType;
}

- (void)setRootType:(int64_t)a3
{
  self->_rootType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
