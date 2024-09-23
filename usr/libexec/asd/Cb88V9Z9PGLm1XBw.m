@implementation Cb88V9Z9PGLm1XBw

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t var0;
  kjAS9HuCdR1m5txL *v21;
  kjAS9HuCdR1m5txL *v22;
  NSObject *v23;
  NSObject *v24;
  unsigned int v25;
  unsigned int var1;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint8_t buf[4];
  unsigned int v37;
  __int16 v38;
  unsigned int v39;

  v12 = a6;
  v13 = a7;
  v14 = a8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[YIbYnDZMoU7hwSYC sharedInstance](YIbYnDZMoU7hwSYC, "sharedInstance"));
  v34 = 0;
  v35 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_100021410;
  v33 = sub_100021420;
  v16 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v17 = (id)qword_1005185E0;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "pkc", "enableTelemetry=YES", buf, 2u);
  }

  if (v15)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v35, v13, v14));
    if (!v35)
    {
      var0 = a3->var4.var8.var0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100021428;
      v28[3] = &unk_1004CE808;
      v28[4] = &v29;
      v35 = (uint64_t)objc_msgSend(v15, "y8DihfZYjxGbiiEE:QsX3tfdMvsGwvY0F:withCompletion:", v19, var0, v28);
    }
  }
  else
  {
    v19 = 0;
    v35 = 165000;
  }
  v21 = [kjAS9HuCdR1m5txL alloc];
  v22 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v21, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v30[5], v35);
  v23 = (id)qword_1005185E0;
  v24 = v23;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    v25 = a4->var0;
    var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    v37 = v25;
    v38 = 1026;
    v39 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v16, "pkc", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  _Block_object_dispose(&v29, 8);
  return v22;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v14;

  v8 = a6;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  v14 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v14, v9, v8));

  objc_msgSend(v10, "encodeObject:", v11);
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var8.var0, CFSTR("0x0x5bde"));
  objc_msgSend(v10, "encodeInt64:forKey:", 0xD52E3C5CA2F5DFECLL, CFSTR("0x5563"));
  v12 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v12;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var7.var1, a4);
}

@end
