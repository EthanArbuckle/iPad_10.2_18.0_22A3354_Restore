@implementation LLPrncEYq6on80YB

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t var0;
  void *v16;
  id v17;
  id v18;
  kjAS9HuCdR1m5txL *v19;
  kjAS9HuCdR1m5txL *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  kjAS9HuCdR1m5txL *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  _BOOL8 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  _BOOL4 v68;
  id v69;
  void *v70;
  kjAS9HuCdR1m5txL *v71;
  kjAS9HuCdR1m5txL *v72;
  uint64_t v73;
  kjAS9HuCdR1m5txL *v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *i;
  unsigned int var1;
  os_signpost_id_t spid;
  void *v82;
  unint64_t v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  id v88;
  id obj;
  id obja;
  id v91;
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  uint8_t buf[8];
  __int16 v100;
  unsigned int v101;
  _BYTE v102[128];

  v11 = a6;
  v91 = a7;
  v85 = a8;
  v98 = 0;
  v82 = v11;
  v92 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a3->var4.var9.var1);
  v93 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a3->var4.var9.var1);
  v88 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", a3->var4.var9.var1);
  var1 = a3->var1;
  v12 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v13 = (id)qword_1005185E0;
  v14 = v13;
  spid = v12;
  v83 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ma", "enableTelemetry=YES", buf, 2u);
  }

  var0 = a3->var4.var8.var0;
  if ((unint64_t)objc_msgSend(v91, "count") <= var0)
  {
    v86 = 0;
    v20 = (kjAS9HuCdR1m5txL *)objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:](eTBtehykeBvfpeTP, "hKjCyPlJs74k9vMV:", 161005));
    v87 = 0;
    v21 = 0;
LABEL_9:
    v16 = 0;
    v17 = 0;
    v84 = 0;
    obj = 0;
    goto LABEL_10;
  }
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectAtIndexedSubscript:", a3->var4.var8.var0));
  v98 = objc_msgSend(v86, "qfSDGTGvqd3Hruzg");
  if (v98)
  {
    v87 = 0;
    v77 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    obj = 0;
LABEL_7:
    v19 = [kjAS9HuCdR1m5txL alloc];
    v20 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v19, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v17, v98);
    v21 = v77;
    v84 = v18;
    goto LABEL_10;
  }
  if (var1 < 2)
  {
    v87 = 0;
    v77 = 0;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var26.var2[0].var3, &v98, v91, v85));
    if (v98)
    {
      v27 = [kjAS9HuCdR1m5txL alloc];
      v87 = 0;
      v20 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v27, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, v98);
      goto LABEL_9;
    }
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v21));
    v77 = v21;
  }
  if (!a3->var4.var9.var1)
  {
LABEL_28:
    if (var1 == 2)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "GyF0atX3JpCKc9pK"));
      obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "filteredArrayUsingPredicate:", v87));

    }
    else
    {
      obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "GyF0atX3JpCKc9pK"));
    }
    v84 = objc_alloc_init((Class)NSMutableArray);
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    obj = obja;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
    if (v36)
    {
      v16 = 0;
      v75 = v36;
      v76 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v75; i = (char *)i + 1)
        {
          if (*(_QWORD *)v95 != v76)
            objc_enumerationMutation(obj);
          v37 = *(id *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)i);
          v38 = objc_alloc_init((Class)NSMutableDictionary);

          v16 = v38;
          if (a3->var4.var9.var1)
          {
            v39 = 0;
            while (1)
            {
              switch(*(_DWORD *)(a3->var4.var11.var1 + 4 * v39))
              {
                case 1:
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectAtIndexedSubscript:", v39));
                  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectAtIndexedSubscript:", v39));
                  objc_msgSend(v16, "setObject:forKey:", v40, v41);

                  goto LABEL_55;
                case 2:
                  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectAtIndexedSubscript:", v39));
                  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v60));
                  v62 = objc_msgSend(v61, "evaluateWithObject:substitutionVariables:", v37, 0);

                  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v62));
                  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectAtIndexedSubscript:", v39));
                  objc_msgSend(v16, "setObject:forKey:", v63, v64);

                  goto LABEL_55;
                case 3:
                  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectAtIndexedSubscript:", v39));
                  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionWithFormat:](NSExpression, "expressionWithFormat:", v48));
                  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "expressionValueWithObject:context:", v37, 0));

                  if (v50)
                  {
                    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectAtIndexedSubscript:", v39));
                    objc_msgSend(v16, "setObject:forKey:", v50, v51);

                  }
                  goto LABEL_45;
                case 4:
                  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v39));
                  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKeyedSubscript:", v52));

                  if (v50)
                  {
                    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectAtIndexedSubscript:", v39));
                    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v53));

                    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v50));
                    v56 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", v55, 0, 0);
                    v57 = objc_msgSend(v56, "numberOfMatchesInString:options:range:", v54, 0, 0, objc_msgSend(v54, "length")) != 0;

                    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v57));
                    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectAtIndexedSubscript:", v39));
                    objc_msgSend(v16, "setObject:forKey:", v58, v59);

                  }
LABEL_45:

                  goto LABEL_55;
                case 5:
                  *(_QWORD *)buf = 0;
                  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectAtIndexedSubscript:", v39));
                  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v39));
                  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKeyedSubscript:", v43));

                  +[Yp00msaYdVlZesvU otlAmd6vMhhfwQLu:withObject:errorValue:](Yp00msaYdVlZesvU, "otlAmd6vMhhfwQLu:withObject:errorValue:", v42, v37, buf);
                  if (*(_QWORD *)buf)
                  {
                    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("ec")));
                    v47 = v46 == 0;

                    if (!v47)
                      goto LABEL_54;
LABEL_52:
                    objc_msgSend(v16, "setObject:forKey:", &off_1004F4AC8, CFSTR("ec"));
                    goto LABEL_54;
                  }
                  v65 = v45;
                  +[Yp00msaYdVlZesvU otlAmd6vMhhfwQLu:withObject:errorValue:](Yp00msaYdVlZesvU, "otlAmd6vMhhfwQLu:withObject:errorValue:", v44, v37, buf);
                  if (*(_QWORD *)buf)
                  {
                    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("ec")));
                    v68 = v67 == 0;

                    if (!v68)
                      goto LABEL_54;
                    goto LABEL_52;
                  }
                  v69 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v65, v66);
                  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectAtIndexedSubscript:", v39));
                  objc_msgSend(v16, "setObject:forKey:", v69, v70);

LABEL_54:
LABEL_55:
                  if (++v39 >= (unint64_t)a3->var4.var9.var1)
                    goto LABEL_56;
                  break;
                default:
                  v20 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v84, -27052);

                  v17 = 0;
                  goto LABEL_70;
              }
            }
          }
LABEL_56:
          objc_msgSend(v84, "addObject:", v16);

        }
        v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
      }
      while (v75);
    }
    else
    {
      v16 = 0;
    }

    if (var1 == 3)
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "filteredArrayUsingPredicate:", v87));
      v18 = v84;
    }
    else
    {
      v17 = v84;
      v18 = v17;
    }
    goto LABEL_7;
  }
  v28 = 0;
  v29 = 0;
  while (1)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", a3->var4.var5.var3 + v28, &v98, v91, v85));
    if (v98)
    {
      v71 = [kjAS9HuCdR1m5txL alloc];
      v20 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v71, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, v98);

      goto LABEL_69;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", a3->var4.var5.var4 + v28, &v98, v91, v85));
    if (v98)
    {
      v72 = [kjAS9HuCdR1m5txL alloc];
      v73 = (uint64_t)v98;
LABEL_65:
      v20 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v72, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, v73);
      goto LABEL_68;
    }
    objc_msgSend(v92, "addObject:", v30);
    objc_msgSend(v93, "addObject:", v31);
    v32 = *(_DWORD *)(a3->var4.var11.var1 + 4 * v29);
    if ((v32 - 1) >= 3)
      break;
LABEL_27:

    ++v29;
    v28 += 136;
    if (v29 >= a3->var4.var9.var1)
      goto LABEL_28;
  }
  if ((v32 - 4) > 1)
  {
    v72 = [kjAS9HuCdR1m5txL alloc];
    v73 = 161;
    goto LABEL_65;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", a3->var4.var23.var4 + v28, &v98, v91, v85));
  if (!v98)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v29));
    objc_msgSend(v88, "setObject:forKey:", v33, v34);

    goto LABEL_27;
  }
  v74 = [kjAS9HuCdR1m5txL alloc];
  v20 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v74, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", 0, v98);

LABEL_68:
LABEL_69:
  v16 = 0;
  v17 = 0;
  v84 = 0;
  obj = 0;
LABEL_70:
  v21 = v77;
LABEL_10:
  v22 = (id)qword_1005185E0;
  v23 = v22;
  if (v83 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    v24 = a4->var0;
    v25 = a4->var1;
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)&buf[4] = v24;
    v100 = 1026;
    v101 = v25;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, spid, "ma", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  return v20;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8;
  id v9;
  void *v10;
  unint64_t var1;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;

  v8 = a5;
  v31 = a6;
  v9 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  v32 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a3->var4.var8.var0));
  v30 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a3->var4.var9.var1);
  v29 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a3->var4.var9.var1);
  v28 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", a3->var4.var9.var1);
  objc_msgSend(v9, "encodeInt64:forKey:", 0x594EAC2DD9E5ADEFLL, CFSTR("0x5563"));
  objc_msgSend(v9, "encodeInt64:forKey:", a3->var1, CFSTR("0x6595"));
  objc_msgSend(v9, "encodeInt64:forKey:", objc_msgSend(v10, "JmiV9VW8P3Gxz1H7"), CFSTR("0x07aa"));
  objc_msgSend(v9, "encodeInt64:forKey:", a3->var4.var9.var1, CFSTR("0x89bc"));
  LODWORD(var1) = a3->var4.var9.var1;
  if ((_DWORD)var1)
  {
    v12 = 0;
    do
    {
      v13 = *(unsigned int *)(a3->var4.var11.var1 + 4 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d 0xa8c1"), v12));
      objc_msgSend(v9, "encodeInt32:forKey:", v13, v14);

      ++v12;
      var1 = a3->var4.var9.var1;
    }
    while (v12 < var1);
  }
  v27 = v10;
  if (a3->var1 > 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var26.var2[0].var3, &v32, v8, v31));
    objc_msgSend(v9, "encodeObject:", v15);

    LODWORD(var1) = a3->var4.var9.var1;
  }
  v26 = v9;
  if ((_DWORD)var1)
  {
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", a3->var4.var5.var3 + v16, &v32, v8, v31));
      objc_msgSend(v30, "addObject:", v18);
      v19 = *(_DWORD *)(a3->var4.var11.var1 + 4 * v17);
      if ((v19 - 1) >= 3)
      {
        if ((v19 - 4) >= 2)
        {
          v20 = 0;
        }
        else
        {
          v21 = objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", a3->var4.var5.var4 + v16, &v32, v8, v31));
          if (v21)
            objc_msgSend(v29, "addObject:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", a3->var4.var23.var4 + v16, &v32, v8, v31));
          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17));
            objc_msgSend(v28, "setObject:forKey:", v22, v23);

          }
          v20 = (void *)v21;
        }
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", a3->var4.var5.var4 + v16, &v32, v8, v31));
        if (v20)
          objc_msgSend(v29, "addObject:", v20);
      }

      ++v17;
      v16 += 136;
    }
    while (v17 < a3->var4.var9.var1);
  }
  objc_msgSend(v26, "encodeObject:", v30);
  objc_msgSend(v26, "encodeObject:", v29);
  objc_msgSend(v26, "encodeObject:", v28);
  v24 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v26);

  return v24;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3->var4.var8.var0));
  objc_msgSend(v5, "addObject:", v6);

  if (a3->var4.var9.var1)
  {
    v7 = 0;
    v8 = 0;
    while (1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", a3->var4.var5.var3 + v7));
      objc_msgSend(v5, "unionSet:", v9);

      v10 = *(_DWORD *)(a3->var4.var11.var1 + 4 * v8);
      if ((v10 - 1) < 3)
        break;
      if ((v10 - 4) < 2)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", a3->var4.var5.var4 + v7));
        objc_msgSend(v5, "unionSet:", v12);

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", a3->var4.var23.var4 + v7));
        objc_msgSend(v5, "unionSet:", v11);
        goto LABEL_7;
      }
LABEL_8:
      ++v8;
      v7 += 136;
      if (v8 >= a3->var4.var9.var1)
        goto LABEL_9;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", a3->var4.var5.var4 + v7));
    objc_msgSend(v5, "unionSet:", v11);
LABEL_7:

    goto LABEL_8;
  }
LABEL_9:
  if (a3->var1 == 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var26.var2[0].var3));
    objc_msgSend(v5, "addObject:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));

  return v14;
}

@end
