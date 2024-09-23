@implementation NDFRjmNSzUL5yu9I

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  kjAS9HuCdR1m5txL *v14;
  kjAS9HuCdR1m5txL *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SEL v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  unsigned int var0;
  unsigned int v45;
  kjAS9HuCdR1m5txL *v46;
  unsigned int var1;
  id v50;
  void *v51;
  NSString *aSelectorName;
  void *v53;
  void *v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  uint64_t *v60;
  _QWORD *v61;
  _saDhcJ9KwjsteHEu *p_var4;
  BOOL v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _QWORD v67[3];
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint8_t buf[4];
  unsigned int v77;
  __int16 v78;
  unsigned int v79;

  v50 = a6;
  v55 = a7;
  v56 = a8;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = sub_1000098A4;
  v74 = sub_1000098B4;
  v75 = 0;
  v69 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v68 = 0;
  var1 = a3->var1;
  v11 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v12 = (id)qword_1005185E0;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "bi", "enableTelemetry=YES", buf, 2u);
  }

  aSelectorName = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*s"), a3->var4.var1.var0.var1, a3->var4.var0.var0));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var15.var2.var1, &v69, v55, v56));
  if (v69)
  {
    v14 = [kjAS9HuCdR1m5txL alloc];
    v15 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v14, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v71[5], v69);
    goto LABEL_39;
  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a3->var4.var6.var4.var0));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a3->var4.var6.var4.var0));
  if (a3->var4.var6.var4.var0)
  {
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)a3->var4.var0.var3 + v16 * 4, &v69, v55, v56));
      v19 = (void *)v18;
      if (v69)
        v20 = 1;
      else
        v20 = v18 == 0;
      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v54, "addObject:", v21);

      }
      else
      {
        objc_msgSend(v54, "addObject:", v18);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var9.var6.var4[v16], &v69, v55, v56));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionWithFormat:](NSExpression, "expressionWithFormat:", v22));
      if (v69 || !v22)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v53, "addObject:", v24);

      }
      else
      {
        objc_msgSend(v53, "addObject:", v23);
      }

      ++v17;
      v16 += 34;
    }
    while (v17 < a3->var4.var6.var4.var0);
  }
  v25 = NSSelectorFromString(aSelectorName);
  if ((objc_opt_respondsToSelector(BMStreams, v25) & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[BMStreams valueForKey:](BMStreams, "valueForKey:", aSelectorName));
    v27 = v26;
    if (var1 < 2)
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "publisherFromStartTime:", 0.0));
    else
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", 0, 0, 0, 0, 1));
    v33 = (void *)v28;
    goto LABEL_32;
  }
  v29 = BiomeLibrary();
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v66 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "streamWithIdentifier:error:", aSelectorName, &v66));
  v31 = v66;

  if (var1 > 1)
  {
    v32 = objc_msgSend(objc_alloc((Class)BMPublisherOptions), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, 0, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "publisherWithOptions:", v32));

    if (!v31)
      goto LABEL_31;
LABEL_28:
    v34 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D6D68((uint64_t)aSelectorName, (uint64_t)v31, v34);
    v69 = 168003;
    goto LABEL_31;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "publisher"));
  if (v31)
    goto LABEL_28;
LABEL_31:

LABEL_32:
  v35 = objc_alloc_init((Class)NSMutableArray);
  v36 = (void *)v71[5];
  v71[5] = (uint64_t)v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v51));
  v38 = v37;
  if (v37)
  {
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1000098BC;
    v64[3] = &unk_1004CE610;
    v65 = v37;
    v39 = objc_retainBlock(v64);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "filterWithIsIncluded:", v39));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000098D0;
    v57[3] = &unk_1004CE678;
    p_var4 = &a3->var4;
    v58 = v54;
    v63 = var1 > 1;
    v59 = v53;
    v60 = &v70;
    v61 = v67;
    v41 = objc_msgSend(v40, "sinkWithCompletion:shouldContinue:", &stru_1004CE650, v57);

  }
  else
  {
    v69 = 168004;
  }

  v42 = (id)qword_1005185E0;
  v43 = v42;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    var0 = a4->var0;
    v45 = a4->var1;
    *(_DWORD *)buf = 67240448;
    v77 = var0;
    v78 = 1026;
    v79 = v45;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, v11, "bi", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  v46 = [kjAS9HuCdR1m5txL alloc];
  v15 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v46, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v71[5], v69);

LABEL_39:
  _Block_object_dispose(v67, 8);
  _Block_object_dispose(&v70, 8);

  return v15;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8;
  id v9;
  id v10;
  __objc2_class *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  __objc2_class *v24;
  void *v25;
  id v26;
  void *v28;
  void *v29;
  void *v30;
  _KUwyEjpVZR65eUyl *v31;
  void *v32;
  uint64_t v33;

  v8 = a5;
  v9 = a6;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  objc_msgSend(v10, "encodeInt64:forKey:", 0x195A0A8200DBA60CLL, CFSTR("0x5563"));
  v33 = 0;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*s"), a3->var4.var1.var0.var1, a3->var4.var0.var0));
  objc_msgSend(v10, "encodeObject:");
  v11 = ASClass101288420;
  v30 = v10;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var15.var2.var1, &v33, v8, v9));
  objc_msgSend(v10, "encodeObject:");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a3->var4.var6.var4.var0));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a3->var4.var6.var4.var0));
  if (a3->var4.var6.var4.var0)
  {
    v13 = 0;
    v14 = 0;
    v31 = a3;
    do
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(&v11[75], "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)a3->var4.var0.var3 + v13 * 4, &v33, v8, v9));
      v16 = (void *)v15;
      if (v33)
        v17 = 1;
      else
        v17 = v15 == 0;
      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v12, "addObject:", v18);

      }
      else
      {
        objc_msgSend(v12, "addObject:", v15);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&v11[75], "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var9.var6.var4[v13], &v33, v8, v9));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionWithFormat:](NSExpression, "expressionWithFormat:", v19));
      if (v33 || !v19)
      {
        v21 = v9;
        v22 = v8;
        v23 = v12;
        v24 = v11;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v32, "addObject:", v25);

        v11 = v24;
        v12 = v23;
        v8 = v22;
        v9 = v21;
        a3 = v31;
      }
      else
      {
        objc_msgSend(v32, "addObject:", v20);
      }

      ++v14;
      v13 += 34;
    }
    while (v14 < a3->var4.var6.var4.var0);
  }
  objc_msgSend(v30, "encodeObject:", v12);
  objc_msgSend(v30, "encodeObject:", v32);
  objc_msgSend(v30, "encodeInt64:forKey:", a3->var4.var5.var2, CFSTR("0x0x5bde"));
  v26 = objc_msgSend(&v11[75], "cv2QAcQ2CDdiHuN6:", v30);

  return (unint64_t)v26;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var15.var2.var1));
  objc_msgSend(v5, "setSet:", v6);

  if (a3->var4.var6.var4.var0)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", (char *)a3->var4.var0.var3 + v7 * 4));
      objc_msgSend(v5, "unionSet:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var9.var6.var4[v7]));
      objc_msgSend(v5, "unionSet:", v10);

      ++v8;
      v7 += 34;
    }
    while (v8 < a3->var4.var6.var4.var0);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));

  return v11;
}

@end
