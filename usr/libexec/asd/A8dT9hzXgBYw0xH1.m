@implementation A8dT9hzXgBYw0xH1

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
  NSMutableSet *v18;
  id v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  kjAS9HuCdR1m5txL *v27;
  kjAS9HuCdR1m5txL *v28;
  NSObject *v29;
  NSObject *v30;
  unsigned int v31;
  unsigned int var1;
  void *v34;
  os_signpost_id_t v35;
  id v36;
  unint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint8_t buf[4];
  unsigned int v45;
  __int16 v46;
  unsigned int v47;
  _BYTE v48[128];

  v10 = a7;
  v11 = a8;
  v43 = 0;
  v12 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v13 = (id)qword_1005185E0;
  v14 = v13;
  v38 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ddf", "enableTelemetry=YES", buf, 2u);
  }

  var0 = a3->var4.var8.var0;
  if ((unint64_t)objc_msgSend(v10, "count") <= var0)
  {
    v17 = 0;
    v16 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v43 = 161031;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", a3->var4.var8.var0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v43, v10, v11));
    if (v43)
    {
      v18 = 0;
      v19 = 0;
      v20 = 0;
    }
    else
    {
      v35 = v12;
      v36 = v11;
      v18 = objc_opt_new(NSMutableSet);
      v20 = objc_opt_new(NSMutableArray);
      v34 = v16;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "GyF0atX3JpCKc9pK"));
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v23)
              objc_enumerationMutation(v19);
            v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "valueForKey:", v17));
            if (v26 && (-[NSMutableSet containsObject:](v18, "containsObject:", v26) & 1) == 0)
            {
              -[NSMutableArray addObject:](v20, "addObject:", v25);
              -[NSMutableSet addObject:](v18, "addObject:", v26);
            }

          }
          v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        }
        while (v22);
      }

      v12 = v35;
      v11 = v36;
      v16 = v34;
    }
  }
  v27 = [kjAS9HuCdR1m5txL alloc];
  v28 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v27, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v20, v43);
  v29 = (id)qword_1005185E0;
  v30 = v29;
  if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    v31 = a4->var0;
    var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    v45 = v31;
    v46 = 1026;
    v47 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, v12, "ddf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

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
  v15 = 0;
  objc_msgSend(v10, "encodeInt64:forKey:", 0x9571AA7E8FC7EA84, CFSTR("0x5563"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a3->var4.var8.var0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v15, v9, v8));

  objc_msgSend(v10, "encodeObject:", v12);
  objc_msgSend(v10, "encodeInt64:forKey:", objc_msgSend(v11, "JmiV9VW8P3Gxz1H7"), CFSTR("0x07aa"));
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

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var4.var8.var0));
  objc_msgSend(v5, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));
  return v8;
}

@end
