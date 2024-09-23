@implementation GQdxG3xjQCtxhh8w

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12;
  id v13;
  id v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  C7RiKwi0qHUD3RW9 *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  unsigned int v25;
  unsigned int var1;
  kjAS9HuCdR1m5txL *v27;
  kjAS9HuCdR1m5txL *v28;
  C7RiKwi0qHUD3RW9 *v30;
  unsigned int var0;
  _eipjLVDiD7LNwlPc *v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  unsigned int v49;
  __int16 v50;
  unsigned int v51;

  v12 = a6;
  v13 = a7;
  v14 = a8;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = sub_100020904;
  v46 = sub_100020914;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v15 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v16 = (id)qword_1005185E0;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "ch", "enableTelemetry=YES", buf, 2u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, v39 + 3, v13, v14));
  if (v39[3])
  {
    v19 = 0;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)&a3->var4.var26 + 144, v39 + 3, v13, v14));
    if (!v39[3])
    {
      v32 = a4;
      v33 = v12;
      v20 = objc_opt_new(C7RiKwi0qHUD3RW9);
      v21 = dispatch_group_create();
      dispatch_group_enter(v21);
      var0 = a3->var4.var8.var0;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10002091C;
      v34[3] = &unk_1004CE6A0;
      v36 = &v38;
      v37 = &v42;
      v22 = v21;
      v35 = v22;
      v30 = v20;
      -[C7RiKwi0qHUD3RW9 hSmO2OC6etXclsKP:edrv2qHmtbt1iEyf:QsX3tfdMvsGwvY0F:completion:](v20, "hSmO2OC6etXclsKP:edrv2qHmtbt1iEyf:QsX3tfdMvsGwvY0F:completion:", v18, v19, var0, v34);
      dispatch_group_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

      a4 = v32;
      v12 = v33;

    }
  }
  v23 = (id)qword_1005185E0;
  v24 = v23;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    v25 = a4->var0;
    var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    v49 = v25;
    v50 = 1026;
    v51 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v15, "ch", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  v27 = [kjAS9HuCdR1m5txL alloc];
  v28 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v27, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v43[5], v39[3]);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v28;
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

  v8 = a6;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  objc_msgSend(v10, "encodeInt64:forKey:", 0x9F34F2F6C05E11C5, CFSTR("0x5563"));
  v15 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v15, v9, v8));
  objc_msgSend(v10, "encodeObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)&a3->var4.var26 + 144, &v15, v9, v8));

  objc_msgSend(v10, "encodeObject:", v12);
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

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", (char *)&a3->var4.var26 + 144));
  objc_msgSend(v5, "unionSet:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));
  return v8;
}

@end
