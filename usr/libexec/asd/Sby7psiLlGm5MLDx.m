@implementation Sby7psiLlGm5MLDx

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12;
  id v13;
  C7RiKwi0qHUD3RW9 *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  kjAS9HuCdR1m5txL *v28;
  kjAS9HuCdR1m5txL *v29;
  kjAS9HuCdR1m5txL *v30;
  NSObject *v31;
  NSObject *v32;
  unsigned int var0;
  unsigned int var1;
  void *v35;
  void *v36;
  id v38;
  void *v39;
  _QWORD v40[4];
  C7RiKwi0qHUD3RW9 *v41;
  NSObject *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  unsigned int v51;
  __int16 v52;
  unsigned int v53;
  __int16 v54;
  int v55;

  v38 = a6;
  v12 = a7;
  v13 = a8;
  v47 = 0;
  v48 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v14 = objc_opt_new(C7RiKwi0qHUD3RW9);
  v15 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v16 = (id)qword_1005185E0;
  v17 = v16;
  v18 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "csc", "enableTelemetry=YES", buf, 2u);
  }

  v19 = objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4, v45 + 3, v12, v13));
  v20 = (void *)v19;
  if (v45[3] || !v19)
  {
    v30 = (kjAS9HuCdR1m5txL *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:](eTBtehykeBvfpeTP, "hKjCyPlJs74k9vMV:", v38));
    v31 = (id)qword_1005185E0;
    v32 = v31;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      var0 = a4->var0;
      var1 = a4->var1;
      *(_DWORD *)buf = 67240704;
      v51 = var0;
      v52 = 1026;
      v53 = var1;
      v54 = 1026;
      v55 = 1;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v15, "csc", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,e=%{public,signpost.telemetry:number2}d", buf, 0x14u);
    }

    goto LABEL_17;
  }
  v21 = dispatch_group_create();
  dispatch_group_enter(v21);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100010E6C;
  v40[3] = &unk_1004CEA08;
  v43 = &v44;
  v41 = v14;
  v22 = v21;
  v42 = v22;
  -[C7RiKwi0qHUD3RW9 f7RoJXIsBwkuxLd1:completionBlock:fNW54jBXJAcsCk:](v41, "f7RoJXIsBwkuxLd1:completionBlock:fNW54jBXJAcsCk:", v20, v40, &v48, v38);
  dispatch_group_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  v23 = (id)qword_1005185E0;
  v24 = v23;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    v25 = a4->var0;
    v26 = a4->var1;
    *(_DWORD *)buf = 67240704;
    v51 = v25;
    v52 = 1026;
    v53 = v26;
    v54 = 1026;
    v55 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v15, "csc", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,e=%{public,signpost.telemetry:number2}d", buf, 0x14u);
  }

  v27 = v45[3];
  if (v27)
  {
    v28 = [kjAS9HuCdR1m5txL alloc];
    v29 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v28, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, v45[3]);
    v30 = 0;
  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v48));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v35, CFSTR("cnt")));
    v49 = v36;
    v29 = (kjAS9HuCdR1m5txL *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));

    v30 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v29, 0);
  }

  if (!v27)
  {
LABEL_17:
    v30 = v30;
    v29 = v30;
  }

  _Block_object_dispose(&v44, 8);
  return v29;
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

  objc_msgSend(v10, "encodeInt64:forKey:", 0x27A4692BF11E14BALL, CFSTR("0x5563"));
  objc_msgSend(v10, "encodeObject:", v11);
  v12 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v12;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4, a4);
}

@end
