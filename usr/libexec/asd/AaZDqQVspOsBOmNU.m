@implementation AaZDqQVspOsBOmNU

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v10;
  id v11;
  id v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  kjAS9HuCdR1m5txL *v29;
  kjAS9HuCdR1m5txL *v30;
  NSObject *v31;
  NSObject *v32;
  unsigned int var0;
  unsigned int var1;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  os_signpost_id_t v43;
  id v45;
  uint64_t v46;
  uint8_t buf[4];
  unsigned int v48;
  __int16 v49;
  unsigned int v50;
  _QWORD v51[6];
  _QWORD v52[6];
  void *v53;

  v10 = a8;
  v11 = a7;
  v12 = objc_alloc_init((Class)NSPersonNameComponentsFormatter);
  v46 = 0;
  v13 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v14 = (id)qword_1005185E0;
  v15 = v14;
  v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "np", "enableTelemetry=YES", buf, 2u);
  }
  v43 = v13;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4, &v46, v11, v10));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "personNameComponentsFromString:", v17));
  v19 = v18;
  if (v18)
  {
    v51[0] = CFSTR("gn");
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "givenName"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string:orDefault:](NSString, "string:orDefault:", v41, &stru_1004F2E38));
    v52[0] = v40;
    v51[1] = CFSTR("mn");
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "middleName"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string:orDefault:](NSString, "string:orDefault:", v39, &stru_1004F2E38));
    v52[1] = v38;
    v51[2] = CFSTR("fn");
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "familyName"));
    v42 = v17;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string:orDefault:](NSString, "string:orDefault:", v37, &stru_1004F2E38));
    v52[2] = v36;
    v51[3] = CFSTR("np");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "namePrefix"));
    v45 = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string:orDefault:](NSString, "string:orDefault:", v20, &stru_1004F2E38));
    v52[3] = v21;
    v51[4] = CFSTR("ns");
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "nameSuffix"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string:orDefault:](NSString, "string:orDefault:", v22, &stru_1004F2E38));
    v52[4] = v23;
    v51[5] = CFSTR("nn");
    v24 = v16;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "nickname"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string:orDefault:](NSString, "string:orDefault:", v25, &stru_1004F2E38));
    v52[5] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 6));
    v53 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));

    v16 = v24;
    v12 = v45;

    v17 = v42;
  }
  else
  {
    v28 = 0;
  }
  v29 = [kjAS9HuCdR1m5txL alloc];
  v30 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v29, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v28, v46);
  v31 = (id)qword_1005185E0;
  v32 = v31;
  if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    var0 = a4->var0;
    var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    v48 = var0;
    v49 = 1026;
    v50 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v43, "np", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  return v30;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4, a4);
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

  objc_msgSend(v10, "encodeInt64:forKey:", 0x2B0DF39217DBC87ELL, CFSTR("0x5563"));
  objc_msgSend(v10, "encodeObject:", v11);
  v12 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v12;
}

@end
