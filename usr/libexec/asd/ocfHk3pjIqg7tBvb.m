@implementation ocfHk3pjIqg7tBvb

- (int64_t)dOcbonNWKg7PJwsF:(int64_t)a3 QlGRpofDrDPpBRod:(int64_t)a4 mfJ8r89KwA6nfqNY:(sqlite3 *)a5
{
  int64_t result;
  int64_t v6;

  result = a3;
  if (a3 > 22)
  {
    switch(a3)
    {
      case 513:
        return 13714;
      case 257:
        return 13713;
      case 23:
        return 13702;
      default:
LABEL_16:
        v6 = 13799;
        if (a4 == 1)
          v6 = 13710;
        if (a4)
          return v6;
        else
          return 13700;
    }
  }
  else
  {
    switch(a3)
    {
      case 7:
        result = 13715;
        break;
      case 8:
      case 9:
      case 11:
      case 12:
      case 14:
      case 15:
      case 16:
        goto LABEL_16;
      case 10:
        result = 13716;
        break;
      case 13:
        result = 13717;
        break;
      case 17:
        result = 13711;
        break;
      case 18:
        result = 13712;
        break;
      default:
        if (a3)
          goto LABEL_16;
        break;
    }
  }
  return result;
}

- (unsigned)hi5ump20ke7n4x6o:(id)a3 hikv315wqxcu0dpl:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  uint64_t v11;

  v5 = a4;
  v9 = 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("/var/mobile/Library/Accounts/Accounts3.sqlite")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\\s*%@\\s*%@"), CFSTR("zusername"), CFSTR("(IS|IS NOT|LIKE|GLOB|=|<|>)"), CFSTR("[A-Z0-9a-z\\._%+-]+")));
    v11 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v6, 1, &v11));
    v8 = objc_msgSend(v7, "numberOfMatchesInString:options:range:", v5, 8, 0, objc_msgSend(v5, "length"));

    if (v8)
      v9 = 0;
  }

  return v9;
}

+ (id)sharedInstance
{
  if (qword_1005115F0 != -1)
    dispatch_once(&qword_1005115F0, &stru_1004CEE40);
  return (id)qword_1005115E8;
}

- (int64_t)zjSRqCgYhfa1wFgr:(id)a3 gqhuZKS8Xs6ugnFL:(id)a4 wRPFKB7h3xbveJFz:(_e97N3ZJrnSwhQeNK *)a5 x1IqrF8Flbgd3Jhk:(id)a6 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a7
{
  id v11;
  id v12;
  void (**v13)(id, kjAS9HuCdR1m5txL *);
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  int v19;
  int64_t v20;
  kjAS9HuCdR1m5txL *v21;
  sqlite3 *v22;
  id v23;
  int v24;
  int v25;
  void *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  _DWORD *v30;
  int v31;
  NSNumber *v32;
  uint64_t v33;
  NSNumber *v34;
  NSNumber *v35;
  void *v36;
  void *v37;
  NSString *v38;
  kjAS9HuCdR1m5txL *v39;
  ocfHk3pjIqg7tBvb *v41;
  id v42;
  id v43;
  void *v44;
  sqlite3_stmt *ppStmt;
  sqlite3 *ppDb;

  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, kjAS9HuCdR1m5txL *))a6;
  ppStmt = 0;
  ppDb = 0;
  v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a5->var3);
  v15 = objc_alloc_init((Class)NSMutableArray);
  if (-[ocfHk3pjIqg7tBvb hi5ump20ke7n4x6o:hikv315wqxcu0dpl:](self, "hi5ump20ke7n4x6o:hikv315wqxcu0dpl:", v12, v11))
  {
    v43 = v12;
    v44 = v15;
    if (a5->var3)
    {
      v16 = 0;
      v17 = 0;
      do
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", *(_QWORD *)((char *)a5->var2 + v16 + 16), *(unsigned int *)((char *)a5->var2 + v16 + 8)));
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v18, v17);

        ++v17;
        v16 += 24;
      }
      while (v17 < a5->var3);
    }
    v19 = sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), &ppDb, 1, 0);
    if (v19)
    {
      v20 = -[ocfHk3pjIqg7tBvb dOcbonNWKg7PJwsF:QlGRpofDrDPpBRod:mfJ8r89KwA6nfqNY:](self, "dOcbonNWKg7PJwsF:QlGRpofDrDPpBRod:mfJ8r89KwA6nfqNY:", v19, 0, ppDb);
LABEL_36:
      v15 = v44;
      v39 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v44, v20);
      v13[2](v13, v39);

      sqlite3_finalize(ppStmt);
      sqlite3_close(ppDb);
      goto LABEL_37;
    }
    v22 = ppDb;
    v42 = v11;
    v23 = objc_retainAutorelease(v11);
    v24 = sqlite3_prepare_v2(v22, (const char *)objc_msgSend(v23, "UTF8String"), (int)objc_msgSend(v23, "lengthOfBytesUsingEncoding:", 4), &ppStmt, 0);
    if (v24)
    {
      v20 = -[ocfHk3pjIqg7tBvb dOcbonNWKg7PJwsF:QlGRpofDrDPpBRod:mfJ8r89KwA6nfqNY:](self, "dOcbonNWKg7PJwsF:QlGRpofDrDPpBRod:mfJ8r89KwA6nfqNY:", v24, 1, ppDb);
      goto LABEL_36;
    }
    v41 = self;
    v25 = sqlite3_step(ppStmt);
    v26 = 0;
    while (v25 == 100)
    {
      v27 = objc_alloc_init((Class)NSMutableDictionary);

      if (a5->var3)
      {
        v28 = 0;
        v29 = 0;
        while (2)
        {
          v30 = (_DWORD *)((char *)a5->var2 + v28);
          v31 = v30[1];
          switch(*v30)
          {
            case 1:
              v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sqlite3_column_double(ppStmt, v31));
              v33 = objc_claimAutoreleasedReturnValue(v32);
              goto LABEL_18;
            case 2:
              v34 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", sqlite3_column_int(ppStmt, v31));
              v33 = objc_claimAutoreleasedReturnValue(v34);
              goto LABEL_18;
            case 3:
              v35 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", sqlite3_column_int64(ppStmt, v31));
              v33 = objc_claimAutoreleasedReturnValue(v35);
LABEL_18:
              v36 = (void *)v33;
              goto LABEL_19;
            case 4:
              v38 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, v31));
              v36 = (void *)objc_claimAutoreleasedReturnValue(v38);
              if (!v36)
                goto LABEL_20;
LABEL_19:
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v29, v41));
              objc_msgSend(v27, "setObject:forKey:", v36, v37);

LABEL_20:
              ++v29;
              v28 += 24;
              if (v29 >= a5->var3)
                break;
              continue;
            default:

              v20 = 138;
              goto LABEL_35;
          }
          break;
        }
      }
      objc_msgSend(v44, "addObject:", v27, v41);
      v25 = sqlite3_step(ppStmt);
      v26 = v27;
    }
    if (v25 > 20)
    {
      if (v25 == 21)
      {
LABEL_33:

        v20 = -1;
        goto LABEL_35;
      }
      if (v25 != 101)
      {
LABEL_34:
        v20 = -[ocfHk3pjIqg7tBvb dOcbonNWKg7PJwsF:QlGRpofDrDPpBRod:mfJ8r89KwA6nfqNY:](v41, "dOcbonNWKg7PJwsF:QlGRpofDrDPpBRod:mfJ8r89KwA6nfqNY:", v25, 2, ppDb, v41);

        goto LABEL_35;
      }
    }
    else if (v25)
    {
      if (v25 != 1)
        goto LABEL_34;
      goto LABEL_33;
    }

    v20 = 0;
LABEL_35:
    v11 = v42;
    v12 = v43;
    goto LABEL_36;
  }
  v20 = 152;
  v21 = (kjAS9HuCdR1m5txL *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:](eTBtehykeBvfpeTP, "hKjCyPlJs74k9vMV:", 152));
  v13[2](v13, v21);

LABEL_37:
  return v20;
}

@end
