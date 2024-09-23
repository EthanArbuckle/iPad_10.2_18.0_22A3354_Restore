@implementation RIBdWx6IE2Tv357l

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void **v21;
  NSObject *v22;
  NSObject *v23;
  unsigned int var0;
  unsigned int var1;
  kjAS9HuCdR1m5txL *v26;
  kjAS9HuCdR1m5txL *v27;
  void *v29;
  uint64_t v30;
  uint8_t buf[4];
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  _QWORD v35[2];
  _QWORD v36[2];
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];
  void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  void *v43;

  v30 = 0;
  v9 = objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4, &v30, a7, a8));
  v10 = (void *)v9;
  v11 = 0;
  v12 = 0;
  if (v30)
    v13 = 1;
  else
    v13 = v9 == 0;
  if (v13)
    goto LABEL_18;
  v14 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v15 = (id)qword_1005185E0;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "pl", "enableTelemetry=YES", buf, 2u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v10, 0));
  v12 = v17;
  if (!v17 || (objc_msgSend(v17, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    v30 = 157;
    v42[0] = &__NSDictionary0__struct;
    v41[0] = CFSTR("v");
    v41[1] = CFSTR("ec");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 157));
    v42[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 2));
    v43 = v20;
    v21 = &v43;
    goto LABEL_13;
  }
  v18 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v12, 0));
  v19 = (void *)v18;
  if (v18)
  {
    v35[0] = CFSTR("v");
    v35[1] = CFSTR("ec");
    v36[0] = v18;
    v36[1] = &off_1004F49C0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
    v37 = v20;
    v21 = &v37;
LABEL_13:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 1));
    goto LABEL_14;
  }
  v30 = 158;
  v38[0] = CFSTR("v");
  v38[1] = CFSTR("ec");
  v39[0] = &__NSDictionary0__struct;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 158));
  v39[1] = v20;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2));
  v40 = v29;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));

LABEL_14:
  v22 = (id)qword_1005185E0;
  v23 = v22;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    var0 = a4->var0;
    var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    v32 = var0;
    v33 = 1026;
    v34 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v14, "pl", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

LABEL_18:
  v26 = [kjAS9HuCdR1m5txL alloc];
  v27 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v26, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v11, v30);

  return v27;
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4, &v14, v9, v8));

  objc_msgSend(v10, "encodeInt64:forKey:", 0xF6509D9806D22585, CFSTR("0x5563"));
  objc_msgSend(v10, "encodeObject:", v11);
  v12 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v12;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4, a4);
}

@end
