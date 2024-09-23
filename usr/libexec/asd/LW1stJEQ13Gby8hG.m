@implementation LW1stJEQ13Gby8hG

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  uint64_t v10;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  _eipjLVDiD7LNwlPc *v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  _eipjLVDiD7LNwlPc *v25;
  void *v26;
  NSObject *v27;
  kjAS9HuCdR1m5txL *v28;
  kjAS9HuCdR1m5txL *v29;
  NSObject *v30;
  NSObject *v31;
  unsigned int var0;
  unsigned int var1;
  uint64_t v35;
  uint8_t buf[4];
  unsigned int v37;
  __int16 v38;
  unsigned int v39;
  _QWORD v40[2];
  _QWORD v41[2];
  void *v42;

  v10 = *(_QWORD *)&a5;
  v13 = a6;
  v14 = a8;
  v35 = 0;
  v15 = qword_1005185E0;
  v16 = a7;
  v17 = os_signpost_id_generate(v15);
  v18 = (id)qword_1005185E0;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "idf", "enableTelemetry=YES", buf, 2u);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU eJSthhES04gLkDjz:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:eZh1LWn1FH2uQtPX:](Yp00msaYdVlZesvU, "eJSthhES04gLkDjz:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:eZh1LWn1FH2uQtPX:", &a3->var4, v16, v14, &v35));
  if (v35)
  {
    v21 = a4;
    v22 = 0;
    v23 = 0;
  }
  else if (objc_msgSend(v20, "BOOLValue"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "PLMCCRRqEw4moT9R:UtPlzRffoEpw7Ue1:SFkZRA5Ek9YzhDRs:TWWnmIjkBlMfHmma:", a3->var4.var0.var3, a4, v10, v14));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "GyF0atX3JpCKc9pK"));
    v35 = (uint64_t)objc_msgSend(v23, "qfSDGTGvqd3Hruzg");
    if (v35)
    {
      v22 = 0;
    }
    else if (v24)
    {
      v40[0] = CFSTR("s");
      v40[1] = CFSTR("v");
      v41[0] = &__kCFBooleanTrue;
      v41[1] = v24;
      v25 = a4;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));
      v42 = v26;
      v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));

      a4 = v25;
    }
    else
    {
      v27 = qword_1005185D0;
      if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_FAULT))
        sub_1003D6EFC(v27);
      v22 = 0;
      v35 = 171001;
    }
    v21 = a4;

  }
  else
  {
    v21 = a4;
    v23 = 0;
    v35 = 0;
    v22 = &off_1004F4F20;
  }
  v28 = [kjAS9HuCdR1m5txL alloc];
  v29 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v28, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v22, v35);
  v30 = (id)qword_1005185E0;
  v31 = v30;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    var0 = v21->var0;
    var1 = v21->var1;
    *(_DWORD *)buf = 67240448;
    v37 = var0;
    v38 = 1026;
    v39 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, v17, "idf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  return v29;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  uint64_t v17;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  v17 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var15.var2.var1, &v17, v10, v9));

  v14 = objc_msgSend(v11, "jCbmcix0xxhNVOSS:TWWnmIjkBlMfHmma:", a3->var4.var0.var3, v9);
  objc_msgSend(v12, "encodeInt64:forKey:", 0x434A3129DEC70B42, CFSTR("0x5563"));
  objc_msgSend(v12, "encodeObject:", v13);
  objc_msgSend(v12, "encodeInt64:forKey:", a3->var4.var1.var0.var1, CFSTR("0xfd1e"));
  objc_msgSend(v12, "encodeInt64:forKey:", v14, CFSTR("0x07aa"));
  v15 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v12);

  return v15;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = objc_alloc_init((Class)NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForIntExpression:](Yp00msaYdVlZesvU, "listDependenciesForIntExpression:", &a3->var4));
  objc_msgSend(v6, "setSet:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "listDependenciesForDataframe:", a3->var4.var0.var3));
  objc_msgSend(v6, "unionSet:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v6));
  return v9;
}

@end
