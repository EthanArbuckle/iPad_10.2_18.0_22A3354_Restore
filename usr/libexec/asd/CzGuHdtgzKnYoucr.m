@implementation CzGuHdtgzKnYoucr

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12;
  id v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  _TtC3asd20ASFinanceStoreHelper *v17;
  NSObject *v18;
  uint64_t v19;
  unint64_t var0;
  char *v21;
  void *v22;
  char *v23;
  char *v24;
  char *var2;
  unint64_t var7;
  char *v27;
  void *v28;
  char *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  unsigned int v33;
  unsigned int var1;
  kjAS9HuCdR1m5txL *v35;
  uint64_t v36;
  kjAS9HuCdR1m5txL *v37;
  kjAS9HuCdR1m5txL *v39;
  void *v40;
  void *v41;
  void *v42;
  os_signpost_id_t v43;
  _eipjLVDiD7LNwlPc *v44;
  id v45;
  void *v46;
  dispatch_time_t timeout;
  unint64_t v48;
  _TtC3asd20ASFinanceStoreHelper *v49;
  _TtC3asd20ASFinanceStoreHelper *v50;
  void *v51;
  _QWORD v52[4];
  _TtC3asd20ASFinanceStoreHelper *v53;
  NSObject *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  uint8_t buf[4];
  unsigned int v69;
  __int16 v70;
  unsigned int v71;

  v45 = a6;
  v12 = a7;
  v13 = a8;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v14 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v15 = (id)qword_1005185E0;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "fkc", "enableTelemetry=YES", buf, 2u);
  }

  v43 = v14;
  v44 = a4;
  v17 = objc_alloc_init(_TtC3asd20ASFinanceStoreHelper);
  v18 = dispatch_group_create();
  timeout = dispatch_time(0, 1000000 * a3->var3);
  v19 = objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var26.var2[0].var3, v62 + 3, v12, v13));
  v48 = v14 - 1;
  v49 = v17;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)&a3->var4.var26 + 176, v62 + 3, v12, v13));
  dispatch_group_enter(v18);
  var0 = a3->var4.var0.var0;
  v21 = a3->var4.var0.var1.var0;
  v22 = v13;
  v23 = a3->var4.var1.var0.var2[0].var0;
  v24 = a3->var4.var0.var1.var2[0].var0;
  v46 = (void *)v19;
  var2 = a3->var4.var1.var0.var2[0].var2;
  var7 = a3->var4.var23.var7;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100008474;
  v52[3] = &unk_1004CE5E8;
  v55 = &v57;
  v53 = v49;
  v56 = &v61;
  v54 = v18;
  v50 = v53;
  v27 = v21;
  v28 = v12;
  v29 = var2;
  v30 = v54;
  -[ASFinanceStoreHelper countTransactionsWithStartDateOffset:endDateOffset:transactionSources:locationType:locationFilterDistance:lat:lon:maxCount:completionHandler:](v53, "countTransactionsWithStartDateOffset:endDateOffset:transactionSources:locationType:locationFilterDistance:lat:lon:maxCount:completionHandler:", var0, v27, v23, v24, v29, v46, v51, var7, v52);
  v31 = (id)qword_1005185E0;
  v32 = v31;
  if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    v33 = v44->var0;
    var1 = v44->var1;
    *(_DWORD *)buf = 67240448;
    v69 = v33;
    v70 = 1026;
    v71 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v43, "fkc", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  if (dispatch_group_wait(v30, timeout))
  {
    v35 = [kjAS9HuCdR1m5txL alloc];
    v36 = 174003;
  }
  else
  {
    if (!v62[3])
    {
      v39 = [kjAS9HuCdR1m5txL alloc];
      v65 = CFSTR("c");
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v58[3]));
      v66 = v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
      v67 = v41;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v67, 1));
      v37 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v39, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v42, 0);

      goto LABEL_12;
    }
    v35 = [kjAS9HuCdR1m5txL alloc];
    v36 = v62[3];
  }
  v37 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v35, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, v36);
LABEL_12:

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  return v37;
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

  objc_msgSend(v10, "encodeInt64:forKey:", 0x935167CDF835AA98, CFSTR("0x5563"));
  objc_msgSend(v10, "encodeObject:", v11);
  objc_msgSend(v10, "encodeObject:", v12);
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var0.var0, CFSTR("0x1753"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var11.var1, CFSTR("0x1fa8"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var5.var3, CFSTR("0x1fa8"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var5.var4, CFSTR("0x275a"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var23.var7, CFSTR("0x0x5bde"));
  v13 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v13;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set](NSSet, "set", a3, a4);
}

@end
