@implementation eTBtehykeBvfpeTP

+ (id)hKjCyPlJs74k9vMV:(int64_t)a3
{
  kjAS9HuCdR1m5txL *v4;
  int64_t v5;

  v4 = [kjAS9HuCdR1m5txL alloc];
  if (a3)
    v5 = a3;
  else
    v5 = 150;
  return -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v4, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, v5);
}

+ (id)rsNB9HkZVEH0l6fT:(char *)a3 gsx0MJUoOpcxcozG:(unsigned int)a4
{
  _BYTE *v6;
  _BYTE *v7;
  void *v8;

  v6 = malloc_type_malloc(a4 + 1, 0x95BFE890uLL);
  if (v6)
  {
    v7 = v6;
    memcpy(v6, a3, a4);
    v7[a4] = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
    free(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (eTBtehykeBvfpeTP)initWithdEyUJuqYjUufZYGN:(id)a3 CYjHC6NGGdOD33W9:(_XqnwpLSFrBke2fSP *)a4 g8citQiyynNCr9c4:(_nc5BBnMiYo0TSmWP *)a5
{
  id v8;
  eTBtehykeBvfpeTP *v9;
  uint64_t var2;
  uint64_t var0;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *Uh5ScKFVtUOjeURk;
  NSMutableArray *v18;
  NSMutableArray *qnmnskUkG0QuvlrL;
  NSMutableArray *v20;
  NSMutableArray *i4KDOQicW9Xd5WBz;
  uint64_t i;
  uint64_t j;
  void *v24;
  Gpvs7B00ytMM3bTs *v25;
  Gpvs7B00ytMM3bTs *evaluatorManager;
  objc_super v28;
  _QWORD v29[3];
  _QWORD v30[3];

  v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)eTBtehykeBvfpeTP;
  v9 = -[eTBtehykeBvfpeTP init](&v28, "init");
  if (v9)
  {
    var2 = a5->var2;
    var0 = a5->var0;
    v29[0] = CFSTR("cg");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", a4->var2));
    v30[0] = v12;
    v29[1] = CFSTR("bc");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a4->var1));
    v30[1] = v13;
    v29[2] = CFSTR("kv");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a4->var0));
    v30[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));

    v16 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", var2);
    Uh5ScKFVtUOjeURk = v9->_Uh5ScKFVtUOjeURk;
    v9->_Uh5ScKFVtUOjeURk = v16;

    v18 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", var2);
    qnmnskUkG0QuvlrL = v9->_qnmnskUkG0QuvlrL;
    v9->_qnmnskUkG0QuvlrL = v18;

    v20 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", var0);
    i4KDOQicW9Xd5WBz = v9->_i4KDOQicW9Xd5WBz;
    v9->_i4KDOQicW9Xd5WBz = v20;

    if ((_DWORD)var2)
    {
      for (i = 0; i != var2; ++i)
      {
        -[NSMutableArray setObject:atIndexedSubscript:](v9->_Uh5ScKFVtUOjeURk, "setObject:atIndexedSubscript:", &off_1004F4A50, i);
        -[NSMutableArray setObject:atIndexedSubscript:](v9->_qnmnskUkG0QuvlrL, "setObject:atIndexedSubscript:", &off_1004F4A68, i);
      }
    }
    if ((_DWORD)var0)
    {
      for (j = 0; j != var0; ++j)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[kjAS9HuCdR1m5txL cR9LfsxC1Nz4IZKu](kjAS9HuCdR1m5txL, "cR9LfsxC1Nz4IZKu"));
        -[NSMutableArray setObject:atIndexedSubscript:](v9->_i4KDOQicW9Xd5WBz, "setObject:atIndexedSubscript:", v24, j);

      }
    }
    v25 = -[Gpvs7B00ytMM3bTs initWithdEyUJuqYjUufZYGN:Po0NnEfbQHpSgzj7:jHoy3L8RogTTbjjB:X5iUjoUzZPsj1b68:]([Gpvs7B00ytMM3bTs alloc], "initWithdEyUJuqYjUufZYGN:Po0NnEfbQHpSgzj7:jHoy3L8RogTTbjjB:X5iUjoUzZPsj1b68:", v8, v15, a5->var5, a5->var4);
    evaluatorManager = v9->_evaluatorManager;
    v9->_evaluatorManager = v25;

  }
  return v9;
}

- (id)yVPDC4E5nNW5DSMa:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 TWWnmIjkBlMfHmma:(id)a6
{
  uint64_t v6;
  id v10;
  YNHF5E1zsUQomY0e *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  v11 = -[YNHF5E1zsUQomY0e initWithtaDFBApmLBObrNlM:itCyNcNHxjurvzrS:]([YNHF5E1zsUQomY0e alloc], "initWithtaDFBApmLBObrNlM:itCyNcNHxjurvzrS:", a3, self);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10000E504;
  v19 = sub_10000E514;
  v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000E51C;
  v14[3] = &unk_1004CE9C0;
  v14[4] = &v15;
  -[YNHF5E1zsUQomY0e nQ82YhFf5OQDL4Qk:UtPlzRffoEpw7Ue1:SFkZRA5Ek9YzhDRs:TWWnmIjkBlMfHmma:](v11, "nQ82YhFf5OQDL4Qk:UtPlzRffoEpw7Ue1:SFkZRA5Ek9YzhDRs:TWWnmIjkBlMfHmma:", v14, a4, v6, v10);
  v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (id)PLMCCRRqEw4moT9R:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 TWWnmIjkBlMfHmma:(id)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  unint64_t v17;

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  if (-[eTBtehykeBvfpeTP hi5ump20ke7n4x6o:](self, "hi5ump20ke7n4x6o:", a3))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[Gpvs7B00ytMM3bTs rk4Hn364TkSyMq2q:version:](self->_evaluatorManager, "rk4Hn364TkSyMq2q:version:", a3->var0, a3->var1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_i4KDOQicW9Xd5WBz));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "compute:UtPlzRffoEpw7Ue1:SFkZRA5Ek9YzhDRs:jAVr67FQ6j4EzsgV:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", a3, a4, v6, self, v12, v10));

    v14 = -[eTBtehykeBvfpeTP jCbmcix0xxhNVOSS:TWWnmIjkBlMfHmma:](self, "jCbmcix0xxhNVOSS:TWWnmIjkBlMfHmma:", a3, v10);
    objc_msgSend(v13, "setJmiV9VW8P3Gxz1H7:", v14);
    v15 = v13;

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:](eTBtehykeBvfpeTP, "hKjCyPlJs74k9vMV:", 151));
    v17 = -[eTBtehykeBvfpeTP jCbmcix0xxhNVOSS:TWWnmIjkBlMfHmma:](self, "jCbmcix0xxhNVOSS:TWWnmIjkBlMfHmma:", a3, v10);

    objc_msgSend(v16, "setJmiV9VW8P3Gxz1H7:", v17);
    v15 = v16;
  }

  return v15;
}

- (id)listDependenciesForDataframe:(_KUwyEjpVZR65eUyl *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Gpvs7B00ytMM3bTs rk4Hn364TkSyMq2q:version:](self->_evaluatorManager, "rk4Hn364TkSyMq2q:version:", a3->var0, a3->var1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "listDependencies:jAVr67FQ6j4EzsgV:", a3, self));

  return v6;
}

- (void)KKbGrSwDukIWFRjI:(_JqTz0JeuAWNFxnUl *)a3 i4KDOQicW9Xd5WBz:(id)a4 TWWnmIjkBlMfHmma:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;

  v9 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU eJSthhES04gLkDjz:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:eZh1LWn1FH2uQtPX:](Yp00msaYdVlZesvU, "eJSthhES04gLkDjz:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:eZh1LWn1FH2uQtPX:", &a3->var1, a4, a5, &v9));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9));
  -[NSMutableArray setObject:atIndexedSubscript:](self->_qnmnskUkG0QuvlrL, "setObject:atIndexedSubscript:", v8, a3->var0);

  if (v7)
    -[NSMutableArray setObject:atIndexedSubscript:](self->_Uh5ScKFVtUOjeURk, "setObject:atIndexedSubscript:", v7, a3->var0);

}

- (unsigned)pDYAPbGDBo6ZMVXG:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v3 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = objc_msgSend(&off_1004F4EF0, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v27;
LABEL_3:
    v8 = 0;
    v9 = v6;
    while (1)
    {
      if (*(_QWORD *)v27 != v7)
        objc_enumerationMutation(&off_1004F4EF0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\\s*%@\\s*%@"), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v8), CFSTR("[!=|~<>]+"), CFSTR("[A-Z0-9a-z\\._%+-]+")));
      v25 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v10, 1, &v25));
      v6 = v25;

      if (objc_msgSend(v11, "numberOfMatchesInString:options:range:", v3, 8, 0, objc_msgSend(v3, "length")))
        break;

      v8 = (char *)v8 + 1;
      v9 = v6;
      if (v5 == v8)
      {
        v5 = objc_msgSend(&off_1004F4EF0, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
    v6 = 0;
LABEL_11:
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = objc_msgSend(&off_1004F4F08, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    if (!v12)
    {
      v18 = 1;
      goto LABEL_21;
    }
    v13 = v12;
    v14 = *(_QWORD *)v22;
LABEL_13:
    v15 = 0;
    v16 = v6;
    while (1)
    {
      if (*(_QWORD *)v22 != v14)
        objc_enumerationMutation(&off_1004F4F08);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\\s*%@\\s*%@"), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v15), CFSTR("[!=|~<>]+"), CFSTR("[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}")));
      v20 = v16;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v17, 1, &v20));
      v6 = v20;

      if (objc_msgSend(v11, "numberOfMatchesInString:options:range:", v3, 8, 0, objc_msgSend(v3, "length")))
        break;

      v15 = (char *)v15 + 1;
      v16 = v6;
      if (v13 == v15)
      {
        v13 = objc_msgSend(&off_1004F4F08, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
        v18 = 1;
        if (v13)
          goto LABEL_13;
        goto LABEL_21;
      }
    }
  }

  v18 = 0;
LABEL_21:

  return v18;
}

- (unsigned)hi5ump20ke7n4x6o:(_KUwyEjpVZR65eUyl *)a3
{
  void *v4;

  if (a3->var0 - 1 > 1)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", a3->var4.var0.var0, a3->var4.var1.var0.var1));
  LOBYTE(self) = -[eTBtehykeBvfpeTP pDYAPbGDBo6ZMVXG:](self, "pDYAPbGDBo6ZMVXG:", v4);

  return self;
}

- (unint64_t)jCbmcix0xxhNVOSS:(_KUwyEjpVZR65eUyl *)a3 TWWnmIjkBlMfHmma:(id)a4
{
  Gpvs7B00ytMM3bTs *evaluatorManager;
  uint64_t var0;
  uint64_t var1;
  id v9;
  void *v10;
  void *v11;
  id v12;

  evaluatorManager = self->_evaluatorManager;
  var0 = a3->var0;
  var1 = a3->var1;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[Gpvs7B00ytMM3bTs rk4Hn364TkSyMq2q:version:](evaluatorManager, "rk4Hn364TkSyMq2q:version:", var0, var1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_i4KDOQicW9Xd5WBz));
  v12 = objc_msgSend(v10, "computeHash:jAVr67FQ6j4EzsgV:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", a3, self, v11, v9);

  return (unint64_t)v12;
}

- (NSMutableArray)i4KDOQicW9Xd5WBz
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setI4KDOQicW9Xd5WBz:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)Uh5ScKFVtUOjeURk
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUh5ScKFVtUOjeURk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)qnmnskUkG0QuvlrL
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQnmnskUkG0QuvlrL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (Gpvs7B00ytMM3bTs)evaluatorManager
{
  return (Gpvs7B00ytMM3bTs *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEvaluatorManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluatorManager, 0);
  objc_storeStrong((id *)&self->_qnmnskUkG0QuvlrL, 0);
  objc_storeStrong((id *)&self->_Uh5ScKFVtUOjeURk, 0);
  objc_storeStrong((id *)&self->_i4KDOQicW9Xd5WBz, 0);
}

@end
