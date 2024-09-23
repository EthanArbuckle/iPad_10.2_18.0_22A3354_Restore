@implementation Yp00msaYdVlZesvU

+ (id)HeSoUpzppdCV64Ik:(_JOUEz2LcleEhhpFW *)a3 xNtFS0jGMQPgkTi7:(int64_t *)a4 i4KDOQicW9Xd5WBz:(id)a5
{
  id v7;
  char *var2;
  void *v9;
  unint64_t var4;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  char *v15;
  char *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unsigned int v24;
  void *v25;

  v7 = a5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", a3->var0, a3->var1));
  var2 = a3->var2;
  if (var2)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", a3->var2, a3->var3));
  else
    v9 = 0;
  var4 = a3->var4;
  v11 = objc_msgSend(v7, "count");
  v12 = a3->var4;
  if ((unint64_t)v11 > var4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v12));
    v14 = objc_msgSend(v13, "qfSDGTGvqd3Hruzg");
    *a4 = (int64_t)v14;
    if (v14)
    {
      var2 = 0;
      v15 = 0;
LABEL_19:
      v16 = var2;

      goto LABEL_20;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionWithFormat:](NSExpression, "expressionWithFormat:", v25));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "GyF0atX3JpCKc9pK"));
    v15 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "expressionValueWithObject:context:", v19, 0));

    v20 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v15, v20) & 1) != 0)
    {
      v21 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
    }
    else
    {
      v22 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v15, v22) & 1) != 0)
      {
        var2 = v15;
        v15 = var2;
LABEL_18:

        goto LABEL_19;
      }
      if (!var2)
      {
        v24 = a3->var4;
        if (v24 >= 0x3E7)
          v24 = 999;
        *a4 = v24 + 16000;
        goto LABEL_18;
      }
      v21 = v9;
    }
    var2 = v21;
    goto LABEL_18;
  }
  v15 = 0;
  v16 = 0;
  if (v12 >= 0x3E7)
    v17 = 999;
  else
    v17 = v12;
  *a4 = (v17 + 16000);
LABEL_20:

  return v16;
}

+ (id)yv5QRLoFvJ66jYJS:(_uPR6qtVQRSW46QVd *)a3 xNtFS0jGMQPgkTi7:(int64_t *)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  void *v8;
  char *var6;
  void *v10;
  _JOUEz2LcleEhhpFW *var2;
  id v12;
  char *i;
  void *v14;
  void *v15;
  uint64_t v16;
  char *j;
  char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v24;
  id v25;
  void *v27;

  v25 = a5;
  v24 = a6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", a3->var0, a3->var1));
  var6 = (char *)a3->var6;
  switch((int)var6)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      v10 = 0;
      var2 = a3->var2;
      goto LABEL_7;
    case 4:
    case 6:
      v10 = 0;
      var2 = a3->var3;
      var6 = (char *)a3->var5;
      goto LABEL_7;
    case 5:
      if (objc_msgSend(v24, "count"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastObject"));
        var6 = (char *)objc_msgSend(v10, "count");
        var2 = 0;
LABEL_7:
        v27 = v10;
        if (a3->var6 == 5)
        {
          if (var6)
          {
            for (i = 0; i != var6; ++i)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("$%d"), i));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", i));
              if (v15)
              {
                v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v14, v15));

                v8 = (void *)v16;
              }

            }
          }
        }
        else if (var6)
        {
          for (j = 0; j != var6; ++j)
          {
            if ((a3->var6 | 2) == 6)
              v18 = (char *)a3->var4[(_QWORD)j];
            else
              v18 = j;
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("$%d"), v18));
            v20 = objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU HeSoUpzppdCV64Ik:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:](Yp00msaYdVlZesvU, "HeSoUpzppdCV64Ik:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:", var2, a4, v25));
            v21 = (void *)v20;
            if (*a4 || !v20)
            {

              v12 = 0;
              goto LABEL_26;
            }
            v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v19, v20));

            ++var2;
            v8 = (void *)v22;
          }
          v8 = (void *)v22;
        }
      }
      else
      {
        v27 = 0;
        *a4 = 164002;
      }
      v12 = v8;
      v8 = v12;
LABEL_26:

LABEL_27:
      return v12;
    default:
      v12 = 0;
      goto LABEL_27;
  }
}

+ (id)dependenciesForStringExpression:(_JOUEz2LcleEhhpFW *)a3
{
  return +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var4);
}

+ (id)listDependenciesForStringType:(_uPR6qtVQRSW46QVd *)a3
{
  unsigned int *p_var6;
  unsigned int var6;
  _JOUEz2LcleEhhpFW *var3;
  uint64_t v7;
  id v8;
  void *v9;
  void *v11;

  p_var6 = &a3->var6;
  var6 = a3->var6;
  if (var6 >= 4)
  {
    if (var6 != 4 && var6 != 6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      return v11;
    }
    var3 = a3->var3;
    p_var6 = &a3->var5;
  }
  else
  {
    var3 = a3->var2;
  }
  v7 = *p_var6;
  v8 = objc_alloc_init((Class)NSMutableSet);
  if ((int)v7 >= 1)
  {
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU dependenciesForStringExpression:](Yp00msaYdVlZesvU, "dependenciesForStringExpression:", var3));
      objc_msgSend(v8, "addObject:", v9);

      ++var3;
      --v7;
    }
    while (v7);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v8));

  return v11;
}

+ (id)listDependenciesForIntExpression:(_TvmAC17dBJf7RbKu *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var2));
  objc_msgSend(v4, "addObject:", v5);

  if (a3->var0 - 1 < 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var3));
    objc_msgSend(v4, "unionSet:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v4));

  return v7;
}

+ (double)otlAmd6vMhhfwQLu:(id)a3 withObject:(id)a4 errorValue:(int64_t *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  double v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionWithFormat:](NSExpression, "expressionWithFormat:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "expressionValueWithObject:context:", v7, 0));
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  return v11;
}

+ (id)eJSthhES04gLkDjz:(_TvmAC17dBJf7RbKu *)a3 i4KDOQicW9Xd5WBz:(id)a4 TWWnmIjkBlMfHmma:(id)a5 eZh1LWn1FH2uQtPX:(int64_t *)a6
{
  id v9;
  id v10;
  unint64_t var2;
  void *v12;
  void *v13;
  _UNKNOWN **v14;
  void *v15;
  _UNKNOWN **v16;
  id v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  int64_t v27;
  void *v29;
  void *v30;
  uint64_t v31;
  int64_t v32;

  v9 = a4;
  v10 = a5;
  v32 = 0;
  var2 = a3->var2;
  if ((unint64_t)objc_msgSend(v9, "count") <= var2)
  {
    *a6 = -27806;
    v14 = &off_1004F4BB8;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a3->var2));
    if (a3->var0 - 1 > 1)
      v13 = 0;
    else
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var3, &v32, v9, v10));
    if (v32)
    {
      *a6 = v32;
      v14 = &off_1004F4BB8;
    }
    else
    {
      switch(a3->var0)
      {
        case 1u:
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v13));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "GyF0atX3JpCKc9pK"));
          v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v30, "evaluateWithObject:substitutionVariables:", v15, 0)));

          *a6 = 0;
          v17 = 0;
          break;
        case 2u:
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionWithFormat:](NSExpression, "expressionWithFormat:", v13));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "GyF0atX3JpCKc9pK"));
          v29 = v21;
          v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "expressionValueWithObject:context:", v22, 0));

          v23 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v17, v23) & 1) != 0)
          {
            v17 = v17;

            v16 = (_UNKNOWN **)v17;
          }
          else
          {
            v24 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v17, v24) & 1) == 0)
            {
              *a6 = 134002;

              goto LABEL_22;
            }
            v31 = 0;
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v17));
            v26 = objc_msgSend(v25, "scanLongLong:", &v31);

            if (v26)
            {
              v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v31));
              v27 = 0;
            }
            else
            {
              v16 = &off_1004F4BB8;
              v27 = 134001;
            }
            *a6 = v27;

          }
          break;
        case 3u:
          v20 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v12, "qfSDGTGvqd3Hruzg")));
          goto LABEL_13;
        case 4u:
          v20 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v12, "yOtBxuHAYKqZrNQN")));
LABEL_13:
          v16 = (_UNKNOWN **)v20;
          goto LABEL_14;
        case 5u:
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "wgZJLy8f4tn41Pge"));
          objc_msgSend(v18, "timeIntervalSinceNow");
          v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19 * -1000.0));

LABEL_14:
          v17 = 0;
          *a6 = 0;
          break;
        default:
          v17 = 0;
          *a6 = 133;
LABEL_22:
          v16 = &off_1004F4BB8;
          break;
      }
      v14 = v16;

    }
  }

  return v14;
}

+ (unint64_t)cv2QAcQ2CDdiHuN6:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  unsigned __int8 md[32];

  v3 = a3;
  objc_msgSend(v3, "finishEncoding");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "encodedData")));
  v5 = objc_msgSend(v4, "bytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "encodedData"));
  CC_SHA256(v5, (CC_LONG)objc_msgSend(v6, "length"), md);

  v7 = *(_QWORD *)md;
  return v7;
}

@end
