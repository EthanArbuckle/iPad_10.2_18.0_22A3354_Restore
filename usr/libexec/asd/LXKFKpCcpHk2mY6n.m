@implementation LXKFKpCcpHk2mY6n

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  unsigned int var1;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  uint64_t var4;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  unsigned int var0;
  unsigned int v25;
  kjAS9HuCdR1m5txL *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  unsigned int v31;
  unsigned int v32;
  _BOOL4 v33;
  kjAS9HuCdR1m5txL *v34;
  uint64_t v35;
  uint64_t v36;
  _eipjLVDiD7LNwlPc *v38;
  id v39;
  C7RiKwi0qHUD3RW9 *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  NSObject *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[4];
  unsigned int v58;
  __int16 v59;
  unsigned int v60;
  __int16 v61;
  int v62;

  v38 = a4;
  v39 = a6;
  v41 = a7;
  v42 = a8;
  var1 = a3->var1;
  v40 = objc_opt_new(C7RiKwi0qHUD3RW9);
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_10000B3AC;
  v55 = sub_10000B3BC;
  v56 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v12 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v13 = (id)qword_1005185E0;
  v14 = v13;
  v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "cs", "enableTelemetry=YES", buf, 2u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4, v48 + 3, v41, v42));
  v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a3->var4.var2.var3);
  if (a3->var4.var2.var3)
  {
    v18 = 0;
    do
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", *(_QWORD *)&a3->var4.var1.var1.var0[8 * v18], a3->var4.var2.var2[v18], v38, v39));
      objc_msgSend(v17, "addObject:", v19);

      ++v18;
    }
    while (v18 < a3->var4.var2.var3);
  }
  if (var1 == 2)
    var4 = a3->var4.var2.var4;
  else
    var4 = 100;
  if (v48[3])
    v21 = 1;
  else
    v21 = v16 == 0;
  if (v21)
  {
    v22 = (id)qword_1005185E0;
    v23 = v22;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      var0 = v38->var0;
      v25 = v38->var1;
      *(_DWORD *)buf = 67240704;
      v58 = var0;
      v59 = 1026;
      v60 = v25;
      v61 = 1026;
      v62 = 1;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v12, "cs", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,e=%{public,signpost.telemetry:number2}d", buf, 0x14u);
    }

    v26 = (kjAS9HuCdR1m5txL *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:](eTBtehykeBvfpeTP, "hKjCyPlJs74k9vMV:", v48[3]));
  }
  else
  {
    v27 = dispatch_group_create();
    dispatch_group_enter(v27);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10000B3C4;
    v43[3] = &unk_1004CE768;
    v45 = &v47;
    v46 = &v51;
    v28 = v27;
    v44 = v28;
    -[C7RiKwi0qHUD3RW9 pRfmPXmMPeo7rsRf:N3UHg1ij3irF9uUu:QsX3tfdMvsGwvY0F:completionBlock:](v40, "pRfmPXmMPeo7rsRf:N3UHg1ij3irF9uUu:QsX3tfdMvsGwvY0F:completionBlock:", v16, v17, var4, v43);
    dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
    v29 = (id)qword_1005185E0;
    v30 = v29;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      v31 = v38->var0;
      v32 = v38->var1;
      v33 = v48[3] != 0;
      *(_DWORD *)buf = 67240704;
      v58 = v31;
      v59 = 1026;
      v60 = v32;
      v61 = 1026;
      v62 = v33;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, v12, "cs", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,e=%{public,signpost.telemetry:number2}d", buf, 0x14u);
    }

    if (v48[3])
    {
      v34 = [kjAS9HuCdR1m5txL alloc];
      v35 = 0;
      v36 = v48[3];
    }
    else
    {
      v34 = [kjAS9HuCdR1m5txL alloc];
      v36 = 0;
      v35 = v52[5];
    }
    v26 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v34, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v35, v36, v38);

  }
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v26;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8;
  id v9;
  id v10;
  unsigned int var1;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  uint64_t var4;
  unint64_t v17;
  uint64_t v19;

  v8 = a5;
  v9 = a6;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  var1 = a3->var1;
  v19 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4, &v19, v8, v9));
  v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a3->var4.var2.var3);
  if (a3->var4.var2.var3)
  {
    v14 = 0;
    do
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", *(_QWORD *)&a3->var4.var1.var1.var0[8 * v14], a3->var4.var2.var2[v14]));
      objc_msgSend(v13, "addObject:", v15);

      ++v14;
    }
    while (v14 < a3->var4.var2.var3);
  }
  if (var1 == 2)
    var4 = a3->var4.var2.var4;
  else
    var4 = 100;
  objc_msgSend(v10, "encodeInt64:forKey:", 0x76B410A5C9FCBEC4, CFSTR("0x5563"));
  objc_msgSend(v10, "encodeObject:", v12);
  objc_msgSend(v10, "encodeObject:", v13);
  objc_msgSend(v10, "encodeInt32:forKey:", var4, CFSTR("0x0x5bde"));
  v17 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v17;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4, a4);
}

@end
