@implementation VkXK63cfqO3KtJwc

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v11;
  id v12;
  uint64_t var1;
  void *v14;
  unint64_t var0;
  id v16;
  id v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  kjAS9HuCdR1m5txL *v21;
  id v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  unsigned int v30;
  unsigned int v31;
  const char *v32;
  const char *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  uint32_t v36;
  NSObject *v37;
  NSObject *v38;
  unsigned int v39;
  unsigned int v40;
  os_signpost_id_t v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  unsigned int v47;
  unsigned int v48;
  _BOOL4 v50;
  os_signpost_id_t spid;
  void *v53;
  uint8_t buf[4];
  unsigned int v55;
  __int16 v56;
  unsigned int v57;
  __int16 v58;
  int v59;

  v11 = a6;
  v12 = a8;
  var1 = a3->var1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PJXBDBF1h0EU80dy sharedInstance](PJXBDBF1h0EU80dy, "sharedInstance"));
  if ((_DWORD)var1 == 1)
  {
    var0 = a3->var4.var0.var0;
    v16 = objc_msgSend(v11, "jCbmcix0xxhNVOSS:TWWnmIjkBlMfHmma:", var0, v12);
    v53 = v11;
    if ((a5 & 2) != 0)
      goto LABEL_24;
    v17 = v16;
    v18 = v14;
    v50 = 0;
    goto LABEL_11;
  }
  var0 = a3->var4.var0.var0;
  v19 = sub_10000A624((a5 >> 4) & 1, a3->var4.var5.var3, 0);
  if (((v19 == 0) & (a5 >> 1)) != 0)
    v20 = 2;
  else
    v20 = v19;
  if (v20 != 3)
  {
    v22 = objc_msgSend(v11, "jCbmcix0xxhNVOSS:TWWnmIjkBlMfHmma:", var0, v12);
    v53 = v11;
    if (v20 > 1)
      goto LABEL_24;
    v17 = v22;
    v50 = v20 == 1;
    v18 = v14;
LABEL_11:
    v23 = os_signpost_id_generate((os_log_t)qword_1005185E0);
    v24 = (id)qword_1005185E0;
    v25 = v24;
    spid = v23;
    v26 = v23 - 1;
    if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, spid, "cdf", "enableTelemetry=NO", buf, 2u);
    }

    v14 = v18;
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tuV7J33gT8DSDOWz:forDFVersion:", v17, var1));
    if (v27)
    {
      v21 = (kjAS9HuCdR1m5txL *)v27;
      v28 = (id)qword_1005185E0;
      v29 = v28;
      if (v26 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v28))
        goto LABEL_34;
      v30 = a4->var0;
      v31 = a4->var1;
      *(_DWORD *)buf = 67240704;
      v55 = v30;
      v56 = 1026;
      v57 = v31;
      v58 = 1026;
      v59 = 1;
      v32 = "cdf";
      v33 = "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,h=%{public,signpost.telemetry:number2}d";
      v34 = v29;
      v35 = spid;
      v36 = 20;
LABEL_33:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, v35, v32, v33, buf, v36);
LABEL_34:

      goto LABEL_35;
    }
    if (v50)
    {
      v21 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", &__NSArray0__struct, 163002);
LABEL_35:
      v11 = v53;
      goto LABEL_36;
    }
    v37 = (id)qword_1005185E0;
    v38 = v37;
    if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      v39 = a4->var0;
      v40 = a4->var1;
      *(_DWORD *)buf = 67240704;
      v55 = v39;
      v56 = 1026;
      v57 = v40;
      v58 = 1026;
      v59 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_END, spid, "cdf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,h=%{public,signpost.telemetry:number2}d", buf, 0x14u);
    }

LABEL_24:
    v41 = os_signpost_id_generate((os_log_t)qword_1005185E0);
    v42 = (id)qword_1005185E0;
    v43 = v42;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "mdf", "enableTelemetry=NO", buf, 2u);
    }

    v21 = (kjAS9HuCdR1m5txL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "PLMCCRRqEw4moT9R:UtPlzRffoEpw7Ue1:SFkZRA5Ek9YzhDRs:TWWnmIjkBlMfHmma:", var0, a4, a5 & 0xFFFFFFFD, v12));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[kjAS9HuCdR1m5txL setWgZJLy8f4tn41Pge:](v21, "setWgZJLy8f4tn41Pge:", v44);

    v45 = a4->var0;
    if ((_DWORD)var1 == 1)
      objc_msgSend(v14, "r2wriXQ3o6jv840j:gXKoR0dNwQUyaeOl:lEWFPyiFIAJ2uoyd:", a3, v45, v21);
    else
      objc_msgSend(v14, "qSbwrv1Q3SgLu8BN:gXKoR0dNwQUyaeOl:lEWFPyiFIAJ2uoyd:", a3, v45, v21);
    v46 = (id)qword_1005185E0;
    v29 = v46;
    if (v41 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v46))
      goto LABEL_34;
    v47 = a4->var0;
    v48 = a4->var1;
    *(_DWORD *)buf = 67240448;
    v55 = v47;
    v56 = 1026;
    v57 = v48;
    v32 = "mdf";
    v33 = "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d";
    v34 = v29;
    v35 = v41;
    v36 = 14;
    goto LABEL_33;
  }
  v21 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", &__NSArray0__struct, 163003);
LABEL_36:

  return v21;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8;
  id v9;
  id v10;
  unsigned int var1;
  id v12;
  int64_t *p_var3;
  const __CFString *v14;
  unint64_t v15;

  v8 = a4;
  v9 = a6;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  var1 = a3->var1;
  objc_msgSend(v10, "encodeInt32:forKey:", var1, CFSTR("0x6595"));
  if (var1 == 2)
  {
    v12 = objc_msgSend(v8, "jCbmcix0xxhNVOSS:TWWnmIjkBlMfHmma:", a3->var4.var0.var0, v9);
    objc_msgSend(v10, "encodeInt64:forKey:", 0x7784FD561BB2380BLL, CFSTR("0x5563"));
    objc_msgSend(v10, "encodeInt64:forKey:", a3->var4.var11.var1, CFSTR("0x43a0"));
    p_var3 = &a3->var4.var5.var3;
    v14 = CFSTR("0xfa5b");
    goto LABEL_5;
  }
  if (var1 == 1)
  {
    v12 = objc_msgSend(v8, "jCbmcix0xxhNVOSS:TWWnmIjkBlMfHmma:", a3->var4.var0.var0, v9);
    objc_msgSend(v10, "encodeInt64:forKey:", 0x7784FD561BB2380BLL, CFSTR("0x5563"));
    p_var3 = &a3->var4.var11.var1;
    v14 = CFSTR("0xdb4");
LABEL_5:
    objc_msgSend(v10, "encodeInt64:forKey:", *p_var3, v14);
    objc_msgSend(v10, "encodeInt64:forKey:", v12, CFSTR("0x07aa"));
  }
  v15 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v10);

  return v15;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5;
  void *v6;
  unsigned int var1;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = v5;
  var1 = a3->var1;
  if (var1 == 2 || var1 == 1)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "listDependenciesForDataframe:", a3->var4.var0.var0));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v9 = (void *)v8;

  return v9;
}

@end
