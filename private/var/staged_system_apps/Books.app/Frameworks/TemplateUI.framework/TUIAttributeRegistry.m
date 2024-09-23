@implementation TUIAttributeRegistry

+ (unsigned)registerCustomAttributeWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int16 v9;
  uint64_t v10;
  void *v11;
  id *v12;
  unsigned __int16 v14;
  unsigned __int16 *v15;

  v4 = a3;
  if (v4)
  {
    v5 = sub_804D0();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));
    v8 = v7;
    if (v7)
    {
      v9 = (unsigned __int16)objc_msgSend(v7, "integerValue");
    }
    else
    {
      if (qword_2CB520 != -1)
        dispatch_once(&qword_2CB520, &stru_240178);
      v10 = qword_2CB518;
      v14 = (unsigned __int16)objc_msgSend(v6, "count");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v14));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v4);

      v15 = &v14;
      v12 = (id *)sub_15008(v10, &v14, (uint64_t)&std::piecewise_construct, &v15);
      objc_storeStrong(v12 + 3, a3);
      v9 = v14;
    }

  }
  else
  {
    v9 = -1;
  }

  return v9;
}

+ (unsigned)attributeWithName:(id)a3
{
  id v4;
  unsigned int v5;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "lookupAttributeWithName:", v4);
  if (v5 == 0xFFFF)
  {
    v7 = objc_alloc((Class)NSException);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@' not defined/registered"), v4));
    v9 = objc_msgSend(v7, "initWithName:reason:userInfo:", CFSTR("InvalidAttribute"), v8, 0);

    objc_exception_throw(v9);
  }

  return v5;
}

+ (id)nameForAttribute:(unsigned __int16)a3
{
  uint64_t **v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  unsigned __int16 v9;

  v9 = a3;
  if (qword_2CB520 != -1)
    dispatch_once(&qword_2CB520, &stru_240178);
  v3 = sub_1529C((_QWORD *)qword_2CB518, &v9);
  if (!v3)
  {
    v5 = objc_alloc((Class)NSException);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v9));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@' not defined/registered"), v6));
    v8 = objc_msgSend(v5, "initWithName:reason:userInfo:", CFSTR("InvalidAttribute"), v7, 0);

    objc_exception_throw(v8);
  }
  return v3[3];
}

+ (unsigned)lookupAttributeWithName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v3 = a3;
  if (v3)
  {
    v4 = sub_804D0();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v3));
    v7 = v6;
    if (v6)
      v8 = (unsigned __int16)objc_msgSend(v6, "integerValue");
    else
      v8 = -1;

  }
  else
  {
    v8 = -1;
  }

  return v8;
}

@end
