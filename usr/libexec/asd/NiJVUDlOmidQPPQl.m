@implementation NiJVUDlOmidQPPQl

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  kjAS9HuCdR1m5txL *v19;
  char *v20;
  NSObject *v21;
  NSObject *v22;
  unsigned int v23;
  unsigned int var1;
  kjAS9HuCdR1m5txL *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *group;
  unint64_t var9;
  __int128 v31;
  char *var2;
  char *v33;
  char *v34;
  char *var0;
  unint64_t v36;
  void *v37;
  dispatch_time_t timeout;
  id v39;
  _TtC3asd20ASFinanceStoreHelper *v40;
  _QWORD v41[4];
  _TtC3asd20ASFinanceStoreHelper *v42;
  NSObject *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint8_t buf[4];
  unsigned int v57;
  __int16 v58;
  unsigned int v59;

  v39 = a6;
  v12 = a7;
  v13 = a8;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = sub_1000132FC;
  v50 = sub_10001330C;
  v51 = 0;
  v40 = objc_alloc_init(_TtC3asd20ASFinanceStoreHelper);
  v14 = dispatch_group_create();
  timeout = dispatch_time(0, 1000000 * a3->var3);
  v15 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v16 = (id)qword_1005185E0;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "fk", "enableTelemetry=YES", buf, 2u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var26.var2[0].var3, v53 + 3, v12, v13));
  if (v53[3])
  {
    v19 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, 174002);
  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)&a3->var4.var26 + 176, v53 + 3, v12, v13));
    if (v53[3])
    {
      v19 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, 174002);
    }
    else
    {
      dispatch_group_enter(v14);
      var0 = a3->var4.var0.var1.var0;
      v36 = a3->var4.var0.var0;
      v33 = a3->var4.var0.var1.var2[0].var0;
      v34 = a3->var4.var1.var0.var2[0].var0;
      var2 = a3->var4.var1.var0.var2[0].var2;
      v31 = *(_OWORD *)((char *)&a3->var4.var26 + 312);
      v20 = a3->var4.var1.var2.var2[1].var2;
      var9 = a3->var4.var23.var9;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100013314;
      v41[3] = &unk_1004CEA58;
      v44 = &v46;
      v42 = v40;
      v45 = &v52;
      v43 = v14;
      group = v43;
      -[ASFinanceStoreHelper queryTransactionsWithStartDateOffset:endDateOffset:transactionSources:locationType:locationFilterDistance:lat:lon:maxCount:sortOrder:sortByAttributes:attributes:completionHandler:](v42, "queryTransactionsWithStartDateOffset:endDateOffset:transactionSources:locationType:locationFilterDistance:lat:lon:maxCount:sortOrder:sortByAttributes:attributes:completionHandler:", v36, var0, v34, v33, var2, v18, v37, v31, var9, v20, v41);
      v21 = (id)qword_1005185E0;
      v22 = v21;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        v23 = a4->var0;
        var1 = a4->var1;
        *(_DWORD *)buf = 67240448;
        v57 = v23;
        v58 = 1026;
        v59 = var1;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v15, "fk", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
      }

      if (dispatch_group_wait(group, timeout))
      {
        v25 = [kjAS9HuCdR1m5txL alloc];
        v26 = 0;
        v27 = 174003;
      }
      else
      {
        v25 = [kjAS9HuCdR1m5txL alloc];
        v26 = v47[5];
        v27 = v53[3];
      }
      v19 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v25, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v26, v27);

    }
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  return v19;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;

  v15 = 0;
  v8 = a6;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var26.var2[0].var3, &v15, v9, v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)&a3->var4.var26 + 176, &v15, v9, v8));

  objc_msgSend(v10, "encodeInt64:forKey:", 0x9E55F39E67408347, CFSTR("0x5563"));
  objc_msgSend(v10, "encodeObject:", v11);
  objc_msgSend(v10, "encodeObject:", v12);
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var0.var0, CFSTR("0x1753"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var11.var1, CFSTR("0x1fa8"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var5.var3, CFSTR("0x1fa8"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var5.var4, CFSTR("0x275a"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var23.var7, CFSTR("0x0x5bde"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var23.var8, CFSTR("0x9097"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var23.var9, CFSTR("0x38bb"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var23.var10, CFSTR("0xf71a"));
  v13 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v13;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set](NSSet, "set", a3, a4);
}

@end
