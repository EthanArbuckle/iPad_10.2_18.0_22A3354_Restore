@implementation FroFlbyYlUw5zsSg

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  _saDhcJ9KwjsteHEu *p_var4;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  os_signpost_id_t v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  unsigned int var0;
  unsigned int var1;
  kjAS9HuCdR1m5txL *v36;
  kjAS9HuCdR1m5txL *v37;
  _eipjLVDiD7LNwlPc *v39;
  unint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  unsigned int v43;
  __int16 v44;
  unsigned int v45;
  _QWORD v46[2];
  _QWORD v47[2];
  void *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  void *v51;

  v41 = 0;
  p_var4 = &a3->var4;
  v12 = a8;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", p_var4, &v41, v13, v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var26 + 1, &v41, v13, v12));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var26 + 2, &v41, v13, v12));

  if (objc_msgSend(v16, "length"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "containerURLForSecurityApplicationGroupIdentifier:", v16));

    if (!v18)
      v41 = 167002;
  }
  else
  {
    v18 = 0;
  }
  v19 = 0;
  if (!v41 && v15 && v14)
  {
    v20 = os_signpost_id_generate((os_log_t)qword_1005185E0);
    v21 = (id)qword_1005185E0;
    v22 = v21;
    v40 = v20 - 1;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "sud", "enableTelemetry=YES", buf, 2u);
    }

    v23 = objc_alloc((Class)NSUserDefaults);
    v39 = a4;
    if (v18)
      v24 = objc_msgSend(v23, "_initWithSuiteName:container:", v14, v18);
    else
      v24 = objc_msgSend(v23, "initWithSuiteName:", v14);
    v25 = v24;
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", v15));
    v27 = (void *)v26;
    if (v26)
    {
      v49[0] = CFSTR("v");
      v49[1] = CFSTR("ec");
      v50[0] = v26;
      v50[1] = &off_1004F4B88;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 2));
      v51 = v28;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
    }
    else
    {
      if (v25)
        v29 = 167000;
      else
        v29 = 167001;
      v41 = v29;
      v46[0] = CFSTR("v");
      v46[1] = CFSTR("ec");
      v47[0] = &__NSDictionary0__struct;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
      v47[1] = v28;
      v30 = v20;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 2));
      v48 = v31;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));

      v20 = v30;
    }

    v32 = (id)qword_1005185E0;
    v33 = v32;
    if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      var0 = v39->var0;
      var1 = v39->var1;
      *(_DWORD *)buf = 67240448;
      v43 = var0;
      v44 = 1026;
      v45 = var1;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v20, "sud", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
    }

  }
  v36 = [kjAS9HuCdR1m5txL alloc];
  v37 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v36, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v19, v41);

  return v37;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v16;
  _QWORD v17[3];

  v8 = a5;
  v9 = a6;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  objc_msgSend(v10, "encodeInt64:forKey:", 0x6301FA738391F0F9, CFSTR("0x5563"));
  v11 = 0;
  v16 = 0;
  v17[0] = &a3->var4.var1.var1;
  v17[1] = &a3->var4.var1.var2;
  v17[2] = &a3->var4;
  while (1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", v17[v11], &v16, v8, v9));
    v13 = v12;
    if (v16)
      break;
    if (v12)
      objc_msgSend(v10, "encodeObject:", v12);

    if (++v11 == 3)
      goto LABEL_8;
  }

LABEL_8:
  v14 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v14;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5;
  _saDhcJ9KwjsteHEu *p_var4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc_init((Class)NSMutableSet);
  p_var4 = &a3->var4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var26 + 1));
  objc_msgSend(v5, "setSet:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var26 + 2));
  objc_msgSend(v5, "unionSet:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", p_var4));
  objc_msgSend(v5, "unionSet:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));
  return v10;
}

@end
