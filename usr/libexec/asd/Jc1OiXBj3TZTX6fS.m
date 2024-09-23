@implementation Jc1OiXBj3TZTX6fS

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t var0;
  void *v19;
  void *v20;
  kjAS9HuCdR1m5txL *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  unint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  unsigned int v29;
  unsigned int var1;
  kjAS9HuCdR1m5txL *v31;
  kjAS9HuCdR1m5txL *v32;
  os_signpost_id_t spid;
  id v35;
  uint8_t buf[4];
  unsigned int v37;
  __int16 v38;
  unsigned int v39;

  v12 = a6;
  v13 = a7;
  v14 = a8;
  v35 = 0;
  v15 = objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v35, v13, v14));
  v16 = 0;
  v17 = (void *)v15;
  if (v35 || !v15)
  {
LABEL_15:
    v31 = [kjAS9HuCdR1m5txL alloc];
    v21 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v31, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v16, v35);
    goto LABEL_16;
  }
  var0 = a3->var4.var8.var0;
  if ((unint64_t)objc_msgSend(v13, "count") > var0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", a3->var4.var8.var0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF.%@.integerValue != 0"), v17));
    v35 = objc_msgSend(v19, "qfSDGTGvqd3Hruzg");
    if (v35)
    {
      v16 = 0;
    }
    else
    {
      v22 = os_signpost_id_generate((os_log_t)qword_1005185E0);
      v23 = (id)qword_1005185E0;
      v24 = v23;
      spid = v22;
      v25 = v22 - 1;
      if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, spid, "fi", "enableTelemetry=YES", buf, 2u);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "GyF0atX3JpCKc9pK"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "filteredArrayUsingPredicate:", v20));

      v27 = (id)qword_1005185E0;
      v28 = v27;
      if (v25 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v27))
      {
        v29 = a4->var0;
        var1 = a4->var1;
        *(_DWORD *)buf = 67240448;
        v37 = v29;
        v38 = 1026;
        v39 = var1;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "fi", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
      }

      v20 = 0;
    }

    goto LABEL_15;
  }
  v16 = 0;
  v21 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, 161011);
LABEL_16:
  v32 = v21;

  return v32;
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

  v8 = a5;
  v9 = a6;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  v15 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v15, v8, v9));
  objc_msgSend(v10, "encodeInt64:forKey:", 0x4AED952FCE4039C2, CFSTR("0x5563"));
  objc_msgSend(v10, "encodeObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a3->var4.var8.var0));
  objc_msgSend(v10, "encodeInt64:forKey:", objc_msgSend(v12, "JmiV9VW8P3Gxz1H7"), CFSTR("0x07aa"));
  v13 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v13;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var7.var1));
  objc_msgSend(v5, "setSet:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var4.var8.var0));
  objc_msgSend(v5, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));
  return v8;
}

@end
