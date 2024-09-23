@implementation Y1qhGFeay19f76Cw

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  NSFileAttributeType v34;
  void *v35;
  void *i;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  unsigned int var0;
  unsigned int var1;
  kjAS9HuCdR1m5txL *v55;
  kjAS9HuCdR1m5txL *v56;
  _eipjLVDiD7LNwlPc *v58;
  os_signpost_id_t v59;
  void *v60;
  void *v61;
  unint64_t v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id obj;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id v86;
  stat v87;
  uint64_t v88;
  uint8_t buf[4];
  unsigned int v90;
  __int16 v91;
  unsigned int v92;
  _QWORD v93[10];
  _QWORD v94[10];
  _BYTE v95[128];

  v11 = a7;
  v12 = a8;
  v88 = 0;
  v13 = a3->var1 >= 2 && a3->var4.var8.var0 != 0;
  memset(&v87, 0, sizeof(v87));
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v88, v11, v12));
  v67 = v12;
  v68 = v11;
  if (v88)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v66 = 0;
  }
  else
  {
    v23 = objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)&a3->var4.var26 + 144, &v88, v11, v12));
    v66 = (void *)v23;
    if (v88)
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
    }
    else
    {
      v24 = v23;
      v25 = os_signpost_id_generate((os_log_t)qword_1005185E0);
      v26 = (id)qword_1005185E0;
      v27 = v26;
      v62 = v25 - 1;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "fp", "enableTelemetry=YES", buf, 2u);
      }
      v59 = v25;

      v28 = objc_alloc_init((Class)NSFileManager);
      v21 = v28;
      if (a3->var4.var8.var0)
      {
        v58 = a4;
        v19 = 0;
        v63 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "enumeratorAtPath:", v73));
        v65 = v63;
      }
      else
      {
        v86 = 0;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "contentsOfDirectoryAtPath:error:", v73, &v86));
        v20 = v86;
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectEnumerator"));
        if (v20)
        {
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v22 = 0;
          v88 = 162;
          v14 = v65;
          goto LABEL_50;
        }
        v58 = a4;
        v63 = 0;
      }
      v61 = v19;
      v70 = v21;
      v64 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", v24, 0, 0);
      v29 = objc_alloc_init((Class)NSMutableArray);
      if (a3->var4.var9.var1)
      {
        v30 = 0;
        v31 = 0;
        do
        {
          v32 = v30;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "nextObject"));

          if (!v30)
            break;
          if (objc_msgSend(v64, "numberOfMatchesInString:options:range:", v30, 0, 0, objc_msgSend(v30, "length")))
          {
            objc_msgSend(v29, "addObject:", v30);
            ++v31;
          }
          if (v13 && (unint64_t)objc_msgSend(v63, "level") > a3->var4.var8.var0)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "fileAttributes"));
            v34 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("NSFileType")));

            if (v34 == NSFileTypeDirectory)
              objc_msgSend(v63, "skipDescendants");
          }
        }
        while (v31 < a3->var4.var9.var1);
      }
      else
      {
        v30 = 0;
      }
      v60 = v30;
      v69 = objc_alloc_init((Class)NSMutableArray);
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      obj = v29;
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
      v35 = 0;
      if (v74)
      {
        v72 = *(_QWORD *)v83;
        v21 = v70;
        do
        {
          for (i = 0; i != v74; i = (char *)i + 1)
          {
            if (*(_QWORD *)v83 != v72)
              objc_enumerationMutation(obj);
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v73, *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i)));
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v37));
            v81 = v35;
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "attributesOfItemAtPath:error:", v37, &v81));
            v77 = v81;

            v40 = objc_retainAutorelease(v37);
            stat((const char *)objc_msgSend(v40, "fileSystemRepresentation"), &v87);
            v75 = v40;
            v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "lastPathComponent"));
            v76 = v38;
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "path"));
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", NSFilePosixPermissions));
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", NSFileSize));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", NSFileType));
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)v87.st_atimespec.tv_sec));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", NSFileModificationDate));
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)v87.st_ctimespec.tv_sec));
            v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", NSFileCreationDate));
            v47 = (void *)v46;
            v48 = (void *)v41;
            if (v41 && v80 && v79 && v78 && v42 && v43 && v44 && v45 && v46)
            {
              v93[0] = CFSTR("fn");
              v93[1] = CFSTR("fd");
              v94[0] = v41;
              v94[1] = v80;
              v93[2] = CFSTR("pp");
              v93[3] = CFSTR("fs");
              v94[2] = v79;
              v94[3] = v78;
              v93[4] = CFSTR("ft");
              v93[5] = CFSTR("lat");
              v94[4] = v42;
              v94[5] = v43;
              v93[6] = CFSTR("lmt");
              v93[7] = CFSTR("lst");
              v94[6] = v44;
              v94[7] = v45;
              v94[8] = v46;
              v93[8] = CFSTR("fct");
              v93[9] = CFSTR("ec");
              v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v77, "code")));
              v94[9] = v49;
              v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v94, v93, 10));

              objc_msgSend(v69, "addObject:", v50);
              v21 = v70;
            }

            v35 = v77;
          }
          v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
        }
        while (v74);
      }
      else
      {
        v21 = v70;
      }
      v20 = v35;

      v51 = (id)qword_1005185E0;
      v52 = v51;
      if (v62 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
      {
        var0 = v58->var0;
        var1 = v58->var1;
        *(_DWORD *)buf = 67240448;
        v90 = var0;
        v91 = 1026;
        v92 = var1;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, v59, "fp", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
      }

      v22 = v60;
      v19 = v61;
      v16 = v64;
      v14 = v65;
      v15 = v63;
      v17 = v69;
      v18 = obj;
    }
  }
LABEL_50:
  v55 = [kjAS9HuCdR1m5txL alloc];
  v56 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v55, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v17, v88);

  return v56;
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", &a3->var4.var7.var1, &v15, v9, v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)&a3->var4.var26 + 144, &v15, v9, v8));

  objc_msgSend(v10, "encodeInt64:forKey:", 0xC24A388BC1F4D127, CFSTR("0x5563"));
  objc_msgSend(v10, "encodeObject:", v11);
  objc_msgSend(v10, "encodeObject:", v12);
  objc_msgSend(v10, "encodeInt32:forKey:", a3->var4.var9.var1, CFSTR("0x49b7"));
  objc_msgSend(v10, "encodeInt32:forKey:", a3->var4.var8.var0, CFSTR("0xd61f"));
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", (char *)&a3->var4.var26 + 144));
  objc_msgSend(v5, "setSet:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var7.var1));
  objc_msgSend(v5, "unionSet:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));
  return v8;
}

@end
