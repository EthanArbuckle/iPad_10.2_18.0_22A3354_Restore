@implementation BH7wjfNixdWGvjfQ

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  void *v11;
  uint64_t var0;
  uint64_t var4;
  void *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t i;
  void *v20;
  kjAS9HuCdR1m5txL *v21;
  kjAS9HuCdR1m5txL *v22;
  NSObject *v23;
  NSObject *v24;
  unsigned int v25;
  unsigned int var1;
  uint64_t v28;
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint8_t buf[4];
  unsigned int v42;
  __int16 v43;
  unsigned int v44;

  v30 = a6;
  v31 = a7;
  v32 = a8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[YIbYnDZMoU7hwSYC sharedInstance](YIbYnDZMoU7hwSYC, "sharedInstance"));
  v40 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_10000BF94;
  v38 = sub_10000BFA4;
  v39 = 0;
  var0 = a3->var4.var8.var0;
  var4 = a3->var4.var0.var4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", var4));
  v28 = var0;
  v15 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v16 = (id)qword_1005185E0;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "pk", "enableTelemetry=YES", buf, 2u);
  }

  if (v11)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v40, v31, v32));
    if (!v40)
    {
      if ((_DWORD)var4)
      {
        for (i = 0; i != var4; ++i)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", *(_QWORD *)&a3->var4.var2.var2[2 * i], *((unsigned int *)a3->var4.var0.var3 + i)));
          objc_msgSend(v14, "addObject:", v20);

        }
      }
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10000BFAC;
      v33[3] = &unk_1004CE808;
      v33[4] = &v34;
      v40 = (uint64_t)objc_msgSend(v11, "ZkTXckPDVjRWZuVM:QsX3tfdMvsGwvY0F:oMKZEzaKOVd8YlLk:withCompletion:", v18, v28, v14, v33);
    }
  }
  else
  {
    v18 = 0;
    v40 = 165000;
  }
  v21 = [kjAS9HuCdR1m5txL alloc];
  v22 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v21, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v35[5], v40);
  v23 = (id)qword_1005185E0;
  v24 = v23;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    v25 = a4->var0;
    var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    v42 = v25;
    v43 = 1026;
    v44 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v15, "pk", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  _Block_object_dispose(&v34, 8);
  return v22;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v17;

  v8 = a5;
  v9 = a6;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  v17 = 0;
  v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a3->var4.var0.var4);
  if (a3->var4.var0.var4)
  {
    v12 = 0;
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", *(_QWORD *)&a3->var4.var2.var2[2 * v12], *((unsigned int *)a3->var4.var0.var3 + v12)));
      objc_msgSend(v11, "addObject:", v13);

      ++v12;
    }
    while (v12 < a3->var4.var0.var4);
  }
  objc_msgSend(v10, "encodeObject:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v17, v8, v9));
  objc_msgSend(v10, "encodeObject:", v14);
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var8.var0, CFSTR("0x0x5bde"));
  objc_msgSend(v10, "encodeInt64:forKey:", 0x48A30D07AA9F179CLL, CFSTR("0x5563"));
  v15 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v15;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var7.var1, a4);
}

@end
