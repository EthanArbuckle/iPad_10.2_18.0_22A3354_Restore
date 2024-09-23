@implementation IJ2i1jyVHK2GU5Sj

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v10;
  id v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t var0;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  kjAS9HuCdR1m5txL *v23;
  kjAS9HuCdR1m5txL *v24;
  NSObject *v25;
  NSObject *v26;
  unsigned int v27;
  unsigned int var1;
  uint64_t v31;
  uint8_t buf[4];
  unsigned int v33;
  __int16 v34;
  unsigned int v35;
  void *v36;

  v10 = a7;
  v11 = a8;
  v31 = 0;
  v12 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v13 = (id)qword_1005185E0;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "sdf", "enableTelemetry=YES", buf, 2u);
  }

  var0 = a3->var4.var8.var0;
  if ((unint64_t)objc_msgSend(v10, "count") <= var0)
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v31 = 161021;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", a3->var4.var8.var0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v31, v10, v11));
    if (v31)
    {
      v18 = 0;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "GyF0atX3JpCKc9pK"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", v17, a3->var4.var9.var1 != 0));
      v36 = v20;
      v21 = v11;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sortedArrayUsingDescriptors:", v22));

      v11 = v21;
    }
  }
  v23 = [kjAS9HuCdR1m5txL alloc];
  v24 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v23, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v18, v31);
  v25 = (id)qword_1005185E0;
  v26 = v25;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    v27 = a4->var0;
    var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    v33 = v27;
    v34 = 1026;
    v35 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v12, "sdf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  return v24;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t var1;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v16;

  v8 = a6;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  objc_msgSend(v10, "encodeInt64:forKey:", 0x16EF48EF37AF2E13, CFSTR("0x5563"));
  v16 = 0;
  var1 = a3->var4.var9.var1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a3->var4.var8.var0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v16, v9, v8));

  objc_msgSend(v10, "encodeObject:", v13);
  objc_msgSend(v10, "encodeInt64:forKey:", objc_msgSend(v12, "JmiV9VW8P3Gxz1H7"), CFSTR("0x07aa"));
  objc_msgSend(v10, "encodeInt64:forKey:", var1, CFSTR("0x9097"));
  v14 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v14;
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

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var4.var8.var0));
  objc_msgSend(v5, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));
  return v8;
}

@end
