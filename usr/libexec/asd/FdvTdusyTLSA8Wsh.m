@implementation FdvTdusyTLSA8Wsh

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v11;
  id v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  __int128 v19;
  BOOL v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  unsigned int var0;
  unsigned int var1;
  os_signpost_id_t v35;
  NSObject *v36;
  NSObject *v37;
  VHJG14dpou8WUEOf *v38;
  VHJG14dpou8WUEOf *v39;
  unint64_t v40;
  uint64_t var4;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  unsigned int v45;
  unsigned int v46;
  NSObject *v47;
  NSObject *v48;
  unsigned int v49;
  unsigned int v50;
  kjAS9HuCdR1m5txL *v51;
  kjAS9HuCdR1m5txL *v52;
  __int128 v54;
  os_signpost_id_t spid;
  id v57;
  unint64_t v58;
  void *v59;
  _QWORD v60[5];
  uint8_t buf[8];
  uint8_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint8_t v68[4];
  int v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;

  v57 = a6;
  v11 = a7;
  v12 = a8;
  v13 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v14 = (id)qword_1005185E0;
  v15 = v14;
  spid = v13;
  v58 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "wp", "enableTelemetry=YES", buf, 2u);
  }

  v67 = 0;
  *(_QWORD *)buf = 0;
  v62 = buf;
  v63 = 0x3032000000;
  v64 = sub_100014998;
  v65 = sub_1000149A8;
  v66 = 0;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", a3->var4.var0.var2));
  v16 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v17 = (id)qword_1005185E0;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v68 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "wp_1", "enableTelemetry=YES", v68, 2u);
  }

  v20 = v67 == 0;
  if (a3->var4.var0.var2 && !v67)
  {
    v21 = 0;
    v22 = 0;
    *(_QWORD *)&v19 = 67109634;
    v54 = v19;
    do
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)a3->var4.var0.var3 + v21, &v67, v11, v12, v54));
      if (v23)
        v24 = v67 == 0;
      else
        v24 = 0;
      if (v24)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)a3->var4.var0.var3 + v21 + 136, &v67, v11, v12));
        if (v26)
          v27 = v67 == 0;
        else
          v27 = 0;
        if (v27)
        {
          objc_msgSend(v59, "setObject:forKeyedSubscript:", v26, v23);
        }
        else
        {
          v28 = qword_1005185D0;
          if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v68 = v54;
            v69 = v22;
            v70 = 2112;
            v71 = (uint64_t)v23;
            v72 = 2048;
            v73 = v67;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "WP Skipping %d (%@) due to error %ld", v68, 0x1Cu);
          }
        }

      }
      else
      {
        v25 = qword_1005185D0;
        if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v68 = 67109376;
          v69 = v22;
          v70 = 2048;
          v71 = v67;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "WP Skipping %d due to error %ld", v68, 0x12u);
        }
      }

      ++v22;
      v20 = v67 == 0;
      if (v22 >= a3->var4.var0.var2)
        break;
      v21 += 272;
    }
    while (!v67);
  }
  if (v20)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v67, v11, v12));
    if (v67)
    {
      v30 = qword_1005185D0;
      if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
        sub_1003D7120(&v67, v30);
    }
  }
  else
  {
    v29 = 0;
  }
  v31 = (id)qword_1005185E0;
  v32 = v31;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    var0 = a4->var0;
    var1 = a4->var1;
    *(_DWORD *)v68 = 67240448;
    v69 = var0;
    v70 = 1026;
    LODWORD(v71) = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v16, "wp_1", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", v68, 0xEu);
  }

  if (!v67)
  {
    v35 = os_signpost_id_generate((os_log_t)qword_1005185E0);
    v36 = (id)qword_1005185E0;
    v37 = v36;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)v68 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "wp_2", "enableTelemetry=YES", v68, 2u);
    }

    v38 = -[VHJG14dpou8WUEOf initWithZKQesNL3BCNYUjZw:]([VHJG14dpou8WUEOf alloc], "initWithZKQesNL3BCNYUjZw:", v59);
    v39 = v38;
    if (v38)
    {
      v40 = a3->var4.var0.var0;
      var4 = a3->var4.var0.var4;
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_1000149B0;
      v60[3] = &unk_1004CEAE0;
      v60[4] = buf;
      v42 = -[VHJG14dpou8WUEOf Dp2N5iuaONVuK1T4:JMJGqFLtbMZn4EGN:QsX3tfdMvsGwvY0F:withCompletion:](v38, "Dp2N5iuaONVuK1T4:JMJGqFLtbMZn4EGN:QsX3tfdMvsGwvY0F:withCompletion:", v29, v40, var4, v60);
    }
    else
    {
      v42 = 170003;
    }
    v67 = v42;

    v43 = (id)qword_1005185E0;
    v44 = v43;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      v45 = a4->var0;
      v46 = a4->var1;
      *(_DWORD *)v68 = 67240448;
      v69 = v45;
      v70 = 1026;
      LODWORD(v71) = v46;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, v35, "wp_2", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", v68, 0xEu);
    }

  }
  v47 = (id)qword_1005185E0;
  v48 = v47;
  if (v58 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    v49 = a4->var0;
    v50 = a4->var1;
    *(_DWORD *)v68 = 67240448;
    v69 = v49;
    v70 = 1026;
    LODWORD(v71) = v50;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_END, spid, "wp", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", v68, 0xEu);
  }

  v51 = [kjAS9HuCdR1m5txL alloc];
  v52 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v51, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", *((_QWORD *)v62 + 5), v67);

  _Block_object_dispose(buf, 8);
  return v52;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v20;

  v8 = a5;
  v9 = a6;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  v20 = 0;
  objc_msgSend(v10, "encodeInt64:forKey:", 0xD65B10DF4565AAELL, CFSTR("0x5563"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var0.var0, CFSTR("0xca8b"));
  objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var0.var4, CFSTR("0x9d77"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v20, v8, v9));
  objc_msgSend(v10, "encodeObject:", v11);
  if (a3->var4.var0.var2)
  {
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)a3->var4.var0.var3 + v12, &v20, v8, v9));
      v15 = objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)a3->var4.var0.var3 + v12 + 136, &v20, v8, v9));
      v16 = (void *)v15;
      if (v14)
        v17 = v15 == 0;
      else
        v17 = 1;
      if (!v17)
      {
        objc_msgSend(v10, "encodeObject:", v14);
        objc_msgSend(v10, "encodeObject:", v16);
      }

      ++v13;
      v12 += 272;
    }
    while (v13 < a3->var4.var0.var2);
  }
  v18 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v18;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var7.var1));
  objc_msgSend(v5, "setSet:", v6);

  if (a3->var4.var0.var2)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", (char *)a3->var4.var0.var3 + v7));
      objc_msgSend(v5, "unionSet:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", (char *)a3->var4.var0.var3 + v7 + 136));
      objc_msgSend(v5, "unionSet:", v10);

      ++v8;
      v7 += 272;
    }
    while (v8 < a3->var4.var0.var2);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));

  return v11;
}

@end
