@implementation CRLPair

+ (CRLPair)pairWithFirst:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithFirst:second:", v7, v6);

  return (CRLPair *)v8;
}

+ (CRLPair)pairWithPair:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithPair:", v4);

  return (CRLPair *)v5;
}

+ (id)pair
{
  return objc_alloc_init((Class)a1);
}

- (CRLPair)initWithFirst:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  CRLPair *v8;
  CRLPair *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLPair;
  v8 = -[CRLPair init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[CRLPair p_SetFirst:](v8, "p_SetFirst:", v6);
    -[CRLPair p_SetSecond:](v9, "p_SetSecond:", v7);
  }

  return v9;
}

- (CRLPair)initWithPair:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLPair *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "first"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "second"));

  v7 = -[CRLPair initWithFirst:second:](self, "initWithFirst:second:", v5, v6);
  return v7;
}

- (CRLPair)init
{
  return -[CRLPair initWithFirst:second:](self, "initWithFirst:second:", 0, 0);
}

- (CRLPair)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLPair *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObject"));

  v7 = -[CRLPair initWithFirst:second:](self, "initWithFirst:second:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));
  objc_msgSend(v4, "encodeObject:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));
  objc_msgSend(v4, "encodeObject:", v6);

}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  CRLPair *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;

  v5 = (CRLPair *)a3;
  if (v5 == self)
  {
    v11 = 1;
  }
  else
  {
    v6 = objc_opt_class(CRLPair, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));
      v8 = objc_claimAutoreleasedReturnValue(-[CRLPair first](v5, "first"));
      if (v7 | v8 && !objc_msgSend((id)v7, "isEqual:", v8))
      {
        v11 = 0;
      }
      else
      {
        v9 = objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));
        v10 = objc_claimAutoreleasedReturnValue(-[CRLPair second](v5, "second"));
        if (v9 | v10)
          v11 = objc_msgSend((id)v9, "isEqual:", v10);
        else
          v11 = 1;

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;

  v4 = a3;
  v6 = (objc_class *)objc_opt_class(CRLPair, v5);
  v7 = sub_1002223BC(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
    goto LABEL_33;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "first"));

  if (v9 == v10)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));

  if (!v11)
    goto LABEL_33;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "first"));

  if (!v12)
    goto LABEL_12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));
  v14 = objc_opt_respondsToSelector(v13, "compare:");

  if ((v14 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235C40);
    v26 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF71DC(v26, self);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235C60);
    v27 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPair compare:]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPair.m"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 97, 0, "unable to perform comparison on %{public}@", objc_opt_class(v30, v31));
LABEL_32:

    goto LABEL_33;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "first"));
  v17 = (int64_t)objc_msgSend(v15, "compare:", v16);

  if (!v17)
  {
LABEL_7:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "second"));

    if (v18 == v19)
    {
      v17 = 0;
      goto LABEL_34;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "second"));

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));
        v23 = objc_opt_respondsToSelector(v22, "compare:");

        if ((v23 & 1) != 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "second"));
          v17 = (int64_t)objc_msgSend(v24, "compare:", v25);

          goto LABEL_34;
        }
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101235C80);
        v32 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF7114(v32, self);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101235CA0);
        v33 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE87A4(v33);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPair compare:]"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPair.m"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 114, 0, "unable to perform comparison on %{public}@", objc_opt_class(v30, v34));
        goto LABEL_32;
      }
LABEL_12:
      v17 = 1;
      goto LABEL_34;
    }
LABEL_33:
    v17 = -1;
  }
LABEL_34:

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v4, v6));

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));
  v6 = objc_msgSend(v5, "copyWithZone:", a3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));
  v8 = objc_msgSend(v7, "copyWithZone:", a3);

  v10 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, v9), "allocWithZone:", a3), "initWithFirst:second:", v6, v8);
  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));
  v6 = objc_msgSend(v5, "copyWithZone:", a3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));
  v8 = objc_msgSend(v7, "copyWithZone:", a3);

  v10 = objc_msgSend(objc_msgSend((id)objc_opt_class(CRLMutablePair, v9), "allocWithZone:", a3), "initWithFirst:second:", v6, v8);
  return v10;
}

- (void)p_SetFirst:(id)a3
{
  id v5;
  id *p_mFirst;
  id mFirst;
  id v8;

  v5 = a3;
  mFirst = self->mFirst;
  p_mFirst = &self->mFirst;
  if (mFirst != v5)
  {
    v8 = v5;
    objc_storeStrong(p_mFirst, a3);
    v5 = v8;
  }

}

- (void)p_SetSecond:(id)a3
{
  id v5;
  id *p_mSecond;
  id mSecond;
  id v8;

  v5 = a3;
  mSecond = self->mSecond;
  p_mSecond = &self->mSecond;
  if (mSecond != v5)
  {
    v8 = v5;
    objc_storeStrong(p_mSecond, a3);
    v5 = v8;
  }

}

- (id)first
{
  return self->mFirst;
}

- (id)second
{
  return self->mSecond;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mSecond, 0);
  objc_storeStrong(&self->mFirst, 0);
}

@end
