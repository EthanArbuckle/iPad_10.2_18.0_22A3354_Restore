@implementation FPteRld7NoAzBRMo

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  unsigned int var0;
  unsigned int var1;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  kjAS9HuCdR1m5txL *v28;
  _QWORD v30[2];
  _QWORD v31[2];
  uint8_t buf[4];
  unsigned int v33;
  __int16 v34;
  unsigned int v35;

  v11 = a6;
  v12 = a7;
  v13 = a8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FnfDbwO2lFcwJMJU sharedInstance](FnfDbwO2lFcwJMJU, "sharedInstance"));
  v15 = objc_alloc_init((Class)NSMutableArray);
  v16 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v17 = (id)qword_1005185E0;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "pn", "enableTelemetry=YES", buf, 2u);
  }

  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "N6iJbZh5ycxf9a3z"));
  v20 = (id)qword_1005185E0;
  v21 = v20;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    var0 = a4->var0;
    var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    v33 = var0;
    v34 = 1026;
    v35 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v16, "pn", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  if (v19)
    v24 = 0;
  else
    v24 = 141001;
  if (v19)
    v25 = (__CFString *)v19;
  else
    v25 = &stru_1004F2E38;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v24, CFSTR("ec")));
  v30[1] = CFSTR("ph");
  v31[0] = v26;
  v31[1] = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
  objc_msgSend(v15, "addObject:", v27);

  v28 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v15, 0);
  return v28;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6;
  unint64_t v7;

  v6 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  objc_msgSend(v6, "encodeInt64:forKey:", 0x594EAC2DD9E5ADEFLL, CFSTR("0x5563"));
  v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v6);

  return v7;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set", a3, a4));
}

@end
