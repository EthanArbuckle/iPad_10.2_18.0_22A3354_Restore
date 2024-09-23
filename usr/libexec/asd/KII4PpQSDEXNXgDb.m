@implementation KII4PpQSDEXNXgDb

- (KII4PpQSDEXNXgDb)initWithSmoothFunctions:(_yo6ptGgiZw8VbWk1 *)a3 X5iUjoUzZPsj1b68:(int64_t)a4
{
  KII4PpQSDEXNXgDb *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KII4PpQSDEXNXgDb;
  result = -[KII4PpQSDEXNXgDb init](&v7, "init");
  if (result)
  {
    result->_jHoy3L8RogTTbjjB = a3;
    result->_X5iUjoUzZPsj1b68 = a4;
  }
  return result;
}

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v13;
  id v14;
  id v15;
  int64_t var0;
  uint64_t var1;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  kjAS9HuCdR1m5txL *v24;
  id v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  unsigned int v29;
  unsigned int v30;
  kjAS9HuCdR1m5txL *v31;
  kjAS9HuCdR1m5txL *v32;
  _eipjLVDiD7LNwlPc *v34;
  os_signpost_id_t spid;
  id v37;
  uint64_t v38;
  uint8_t buf[4];
  unsigned int v40;
  __int16 v41;
  unsigned int v42;

  v13 = a6;
  v14 = a7;
  v15 = a8;
  v38 = 0;
  var0 = a3->var4.var8.var0;
  var1 = a3->var4.var9.var1;
  v18 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v19 = (id)qword_1005185E0;
  v20 = v19;
  spid = v18;
  v21 = v18 - 1;
  if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, spid, "smf", "enableTelemetry=YES", buf, 2u);
  }

  if (self->_X5iUjoUzZPsj1b68 <= var0)
  {
    v31 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, 164000);
  }
  else
  {
    v34 = a4;
    v37 = v15;
    v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", var1);
    if ((_DWORD)var1)
    {
      v23 = 0;
      while (1)
      {
        v24 = (kjAS9HuCdR1m5txL *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU HeSoUpzppdCV64Ik:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:](Yp00msaYdVlZesvU, "HeSoUpzppdCV64Ik:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:", a3->var4.var5.var3 + 32 * v23, &v38, v14, v34));
        if (v38)
          break;
        objc_msgSend(v22, "setObject:atIndexedSubscript:", v24, v23);

        if (++v23 == var1)
          goto LABEL_9;
      }
      v32 = [kjAS9HuCdR1m5txL alloc];
      v31 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v32, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, v38);
    }
    else
    {
LABEL_9:
      v25 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v37);
      objc_msgSend(v25, "addObject:", v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "PLMCCRRqEw4moT9R:UtPlzRffoEpw7Ue1:SFkZRA5Ek9YzhDRs:TWWnmIjkBlMfHmma:", &self->_jHoy3L8RogTTbjjB[var0].var1, v34, a5, v25));
      v27 = (id)qword_1005185E0;
      v28 = v27;
      if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        v29 = v34->var0;
        v30 = v34->var1;
        *(_DWORD *)buf = 67240448;
        v40 = v29;
        v41 = 1026;
        v42 = v30;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "smf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
      }

      v24 = v26;
      v31 = v24;
    }

    v15 = v37;
  }

  return v31;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t var1;
  int64_t var0;
  uint64_t v16;
  id v17;
  uint64_t i;
  void *v19;
  unint64_t v20;
  uint64_t v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  var0 = a3->var4.var8.var0;
  var1 = a3->var4.var9.var1;
  v22 = 0;
  objc_msgSend(v13, "encodeInt64:forKey:", 0xBDE2F5530BB436CLL, CFSTR("0x5563"));
  if (self->_X5iUjoUzZPsj1b68 <= var0)
    v16 = -1;
  else
    v16 = (uint64_t)objc_msgSend(v10, "jCbmcix0xxhNVOSS:TWWnmIjkBlMfHmma:", &self->_jHoy3L8RogTTbjjB[var0].var1, v12);
  objc_msgSend(v13, "encodeInt64:forKey:", v16, CFSTR("0x07aa"));
  v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", var1);
  if ((_DWORD)var1)
  {
    for (i = 0; i != var1; ++i)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU HeSoUpzppdCV64Ik:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:](Yp00msaYdVlZesvU, "HeSoUpzppdCV64Ik:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:", a3->var4.var5.var3 + 32 * i, &v22, v11));
      objc_msgSend(v17, "setObject:atIndexedSubscript:", v19, i);

    }
  }
  objc_msgSend(v13, "encodeObject:", v17);
  v20 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v13);

  return v20;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v6;
  id v7;
  uint64_t var1;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableSet);
  var1 = a3->var4.var9.var1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "listDependenciesForDataframe:", &self->_jHoy3L8RogTTbjjB[a3->var4.var8.var0].var1));
  objc_msgSend(v7, "setSet:", v9);

  if ((_DWORD)var1)
  {
    v10 = 0;
    v11 = 32 * var1;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU dependenciesForStringExpression:](Yp00msaYdVlZesvU, "dependenciesForStringExpression:", a3->var4.var5.var3 + v10));
      objc_msgSend(v7, "addObject:", v12);

      v10 += 32;
    }
    while (v11 != v10);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v7));

  return v13;
}

- (_yo6ptGgiZw8VbWk1)jHoy3L8RogTTbjjB
{
  return self->_jHoy3L8RogTTbjjB;
}

- (void)setJHoy3L8RogTTbjjB:(_yo6ptGgiZw8VbWk1 *)a3
{
  self->_jHoy3L8RogTTbjjB = a3;
}

- (int64_t)X5iUjoUzZPsj1b68
{
  return self->_X5iUjoUzZPsj1b68;
}

- (void)setX5iUjoUzZPsj1b68:(int64_t)a3
{
  self->_X5iUjoUzZPsj1b68 = a3;
}

@end
