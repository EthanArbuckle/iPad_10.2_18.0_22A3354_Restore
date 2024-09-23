@implementation AHhsu4ZRdIKDtY02

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v11;
  id v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  _saDhcJ9KwjsteHEu *p_var4;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  Z4jllpwHToTDp9hq *v24;
  id v25;
  kjAS9HuCdR1m5txL *v26;
  kjAS9HuCdR1m5txL *v27;
  kjAS9HuCdR1m5txL *v28;
  id v29;
  kjAS9HuCdR1m5txL *v30;
  NSObject *v31;
  NSObject *v32;
  unsigned int var0;
  unsigned int var1;
  unsigned int v36;
  id v38;
  _QWORD v39[5];
  _QWORD v40[5];
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
  __int16 v52;
  _BOOL4 v53;

  v38 = a6;
  v11 = a7;
  v12 = a8;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = sub_1000323CC;
  v46 = sub_1000323DC;
  v47 = 0;
  v41 = 0;
  v13 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v14 = (id)qword_1005185E0;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "sl", "enableTelemetry=YES", buf, 2u);
  }

  p_var4 = &a3->var4;
  v17 = objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4, &v41, v11, v12));
  v18 = (void *)v17;
  if (v41 || !v17)
  {
    v28 = (kjAS9HuCdR1m5txL *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:](eTBtehykeBvfpeTP, "hKjCyPlJs74k9vMV:"));
  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var26 + 1, &v41, v11, v12));
    v20 = (void *)v19;
    if (v41 || !v19)
    {
      v28 = (kjAS9HuCdR1m5txL *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:](eTBtehykeBvfpeTP, "hKjCyPlJs74k9vMV:"));
    }
    else
    {
      if (a3->var1 >= 2
        && (v36 = objc_msgSend(v18, "isEqualToString:", CFSTR(":biomeview:")),
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18)),
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "scheme")),
            v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("biome")),
            v22,
            v21,
            v36 | v23))
      {
        v24 = objc_opt_new(Z4jllpwHToTDp9hq);
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_1000323E4;
        v40[3] = &unk_1004CE9C0;
        v40[4] = &v42;
        v25 = -[Z4jllpwHToTDp9hq zjSRqCgYhfa1wFgr:nN3snF4sAp0Cxy6t:wRPFKB7h3xbveJFz:tNXuX79TcZPxzyjn:](v24, "zjSRqCgYhfa1wFgr:nN3snF4sAp0Cxy6t:wRPFKB7h3xbveJFz:tNXuX79TcZPxzyjn:", v20, v18, p_var4, v40);
        v26 = [kjAS9HuCdR1m5txL alloc];
        v27 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v26, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v43[5], v25);
      }
      else
      {
        v24 = objc_opt_new(ocfHk3pjIqg7tBvb);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10003241C;
        v39[3] = &unk_1004CE9C0;
        v39[4] = &v42;
        v29 = -[Z4jllpwHToTDp9hq zjSRqCgYhfa1wFgr:gqhuZKS8Xs6ugnFL:wRPFKB7h3xbveJFz:x1IqrF8Flbgd3Jhk:UtPlzRffoEpw7Ue1:](v24, "zjSRqCgYhfa1wFgr:gqhuZKS8Xs6ugnFL:wRPFKB7h3xbveJFz:x1IqrF8Flbgd3Jhk:UtPlzRffoEpw7Ue1:", v20, v18, p_var4, v39, a4);
        v30 = [kjAS9HuCdR1m5txL alloc];
        v27 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v30, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v43[5], v29);
      }
      v28 = v27;

    }
  }
  v31 = (id)qword_1005185E0;
  v32 = v31;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    var0 = a4->var0;
    var1 = a4->var1;
    *(_DWORD *)buf = 67240704;
    v49 = var0;
    v50 = 1026;
    v51 = var1;
    v52 = 1026;
    v53 = v41 != 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v13, "sl", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,e=%{public,signpost.telemetry:number2}d", buf, 0x14u);
  }

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
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;

  v8 = a5;
  v9 = a6;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  v26 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4, &v26, v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var26 + 1, &v26, v8, v9));
  objc_msgSend(v10, "encodeInt64:forKey:", 0x42A9F8AC261B9FEFLL, CFSTR("0x5563"));
  objc_msgSend(v10, "encodeObject:", v12);
  objc_msgSend(v10, "encodeObject:", v11);
  objc_msgSend(v10, "encodeInt32:forKey:", a3->var4.var1.var2.var1, CFSTR("0xd730"));
  if (a3->var4.var1.var2.var1)
  {
    v23 = v11;
    v24 = v9;
    v25 = v8;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = v15;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", *(_QWORD *)&a3->var4.var1.var2.var0[v13 + 16], *(unsigned int *)&a3->var4.var1.var2.var0[v13 + 8]));

      objc_msgSend(v10, "encodeObject:", v15);
      v17 = *(unsigned int *)&a3->var4.var1.var2.var0[v13 + 4];
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d 0x1f38"), v14));
      objc_msgSend(v10, "encodeInt32:forKey:", v17, v18);

      v19 = *(unsigned int *)&a3->var4.var1.var2.var0[v13];
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d 0x91f8"), v14));
      objc_msgSend(v10, "encodeInt32:forKey:", v19, v20);

      ++v14;
      v13 += 24;
    }
    while (v14 < a3->var4.var1.var2.var1);

    v9 = v24;
    v8 = v25;
    v11 = v23;
  }
  v21 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v21;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4));
  objc_msgSend(v5, "setSet:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var26 + 1));
  objc_msgSend(v5, "unionSet:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));
  return v8;
}

@end
