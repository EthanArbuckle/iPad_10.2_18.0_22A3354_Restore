@implementation LazRaN3HgWYPPpKq

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12;
  id v13;
  id v14;
  unsigned int var1;
  uint64_t v16;
  void *v17;
  kjAS9HuCdR1m5txL *v18;
  uint64_t v19;
  kjAS9HuCdR1m5txL *v20;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  unsigned int var0;
  unsigned int v28;
  kjAS9HuCdR1m5txL *v29;
  kjAS9HuCdR1m5txL *v30;
  kjAS9HuCdR1m5txL *v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  unsigned int v40;
  __int16 v41;
  unsigned int v42;

  v12 = a6;
  v13 = a7;
  v14 = a8;
  var1 = a3->var1;
  v16 = objc_claimAutoreleasedReturnValue(+[XxyDq1mpwtvCuJnm sharedInstance](XxyDq1mpwtvCuJnm, "sharedInstance"));
  v17 = (void *)v16;
  if (var1 == 5)
  {
    if (a3->var4.var1.var0.var1 - 4097 >= 0xFFFFF000 && a3->var4.var5.var2 < 6)
      goto LABEL_13;
    goto LABEL_9;
  }
  if (var1 != 4)
  {
    v18 = [kjAS9HuCdR1m5txL alloc];
    v19 = -27209;
    goto LABEL_11;
  }
  if (a3->var4.var1.var0.var1 - 4097 < 0xFFFFF000 || a3->var4.var5.var2 > 5 || a3->var4.var5.var3 >= 300001)
  {
LABEL_9:
    v18 = [kjAS9HuCdR1m5txL alloc];
    v19 = 155;
LABEL_11:
    v20 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v18, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, v19);
    goto LABEL_12;
  }
LABEL_13:
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_100017B90;
  v37 = sub_100017BA0;
  v38 = 0;
  if (v16)
  {
    v22 = os_signpost_id_generate((os_log_t)qword_1005185E0);
    v23 = (id)qword_1005185E0;
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "lo", "enableTelemetry=YES", buf, 2u);
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100017BA8;
    v32[3] = &unk_1004CE808;
    v32[4] = &v33;
    objc_msgSend(v17, "UupMWO2j2nYek7xf:exi2C8VfynTXu5cU:TYPlhTGwKuAdWgfx:TWWnmIjkBlMfHmma:", v32, a3, v12, v14);
    v25 = (id)qword_1005185E0;
    v26 = v25;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      var0 = a4->var0;
      v28 = a4->var1;
      *(_DWORD *)buf = 67240448;
      v40 = var0;
      v41 = 1026;
      v42 = v28;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v22, "lo", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
    }

    v29 = [kjAS9HuCdR1m5txL alloc];
    v30 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v29, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v34[5], 0);
  }
  else
  {
    v31 = [kjAS9HuCdR1m5txL alloc];
    v30 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v31, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v34[5], 139001);
  }
  v20 = v30;
  _Block_object_dispose(&v33, 8);

LABEL_12:
  return v20;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v7;
  uint64_t var1;
  void *v9;
  unint64_t v10;

  v7 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  var1 = a3->var1;
  objc_msgSend(v7, "encodeInt64:forKey:", 0x76DF2CA55E370785, CFSTR("0x5563"));
  objc_msgSend(v7, "encodeInt32:forKey:", var1, CFSTR("0x6595"));
  if ((_DWORD)var1 == 5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", a3->var4.var0.var0, a3->var4.var1.var0.var1));
    objc_msgSend(v7, "encodeObject:", v9);
    objc_msgSend(v7, "encodeInt32:forKey:", a3->var4.var5.var2, CFSTR("0xb18e"));
    goto LABEL_5;
  }
  if ((_DWORD)var1 == 4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", a3->var4.var0.var0, a3->var4.var1.var0.var1));
    objc_msgSend(v7, "encodeObject:", v9);
    objc_msgSend(v7, "encodeInt64:forKey:", a3->var4.var5.var3, CFSTR("0x9efa"));
    objc_msgSend(v7, "encodeInt32:forKey:", a3->var4.var5.var2, CFSTR("0xb18e"));
    objc_msgSend(v7, "encodeInt64:forKey:", a3->var4.var5.var4, CFSTR("0xf16f"));
LABEL_5:

  }
  v10 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v7);

  return v10;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3->var1 == 5)
  {
    v5 = objc_alloc_init((Class)NSMutableSet);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForIntExpression:](Yp00msaYdVlZesvU, "listDependenciesForIntExpression:", &a3->var4.var15.var2.var1));
    objc_msgSend(v5, "setSet:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForIntExpression:](Yp00msaYdVlZesvU, "listDependenciesForIntExpression:", (char *)&a3->var4.var26 + 168));
    objc_msgSend(v5, "unionSet:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }
  return v8;
}

@end
