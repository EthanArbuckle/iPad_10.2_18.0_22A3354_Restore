@implementation HSMessageProcessor

- (HSMessageProcessor)init
{
  HSMessageProcessor *v2;
  uint64_t v3;
  HSSepUtil *sepUtil;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HSMessageProcessor;
  v2 = -[HSMessageProcessor init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[HSSepUtil sharedSingleton](HSSepUtil, "sharedSingleton"));
    sepUtil = v2->_sepUtil;
    v2->_sepUtil = (HSSepUtil *)v3;

  }
  return v2;
}

- (int)processMessagev1:(id)a3 response:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v5 = a3;
  if (v5)
  {
    NSLog(CFSTR("Processing Message in v1 format"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FNPluginManager sharedManager](FNPluginManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageStr"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getClient:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    NSLog(CFSTR("Message : %@"), v9);

    objc_msgSend(v8, "sendMessage:response:", v5, a4);
    v10 = 0;
  }
  else
  {
    *a4 = objc_msgSend(objc_alloc((Class)HSMessageResponse), "initWithName:statusCode:", CFSTR("Error"), &off_100011F78);
    v10 = 2;
  }

  return v10;
}

- (int)rebootDevice:(id *)a3
{
  NSMutableDictionary *v4;
  void *v5;
  dispatch_time_t v6;
  void *v7;

  v4 = sub_100003BEC();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = dispatch_time(0, 2000000000);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, &stru_100010800);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("Status"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &stru_1000108C0, CFSTR("Error"));
  if (a3)
    *a3 = objc_retainAutorelease(v5);

  return 0;
}

- (int)processMessage:(id)a3 response:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  HSMessageProcessor *v96;
  id v97;
  id *v98;
  void *v99;
  void *v100;
  id v101;

  v6 = a3;
  v100 = v6;
  if (!a4)
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "lastPathComponent"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Input response dictionary pointer is NULL.")));
    v26 = 4;
    sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v85, v86, v87, v88, v89, v90, (uint64_t)v84);

    v101 = 0;
    v9 = 0;
    v12 = 0;
    v99 = 0;
    goto LABEL_23;
  }
  v7 = v6;
  v96 = self;
  v98 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v8, CFSTR("Status"), &stru_1000108C0, CFSTR("Error"), &stru_1000108C0, CFSTR("Output"), 0, CFSTR("Data"), 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  v101 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v10, CFSTR("Status"), &stru_1000108C0, CFSTR("Error"), CFSTR("Success"), CFSTR("Output"), &stru_1000108C0, CFSTR("Data"), 0));

  v11 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Command")));
    v13 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v14 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
      v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("command = %@"), v14));
      sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v17, v18, v19, v20, v21, v22, (uint64_t)v16);

      a4 = v98;
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("SepUtil")))
      {
        v23 = -[HSSepUtil processSepUtilCommand:response:](v96->_sepUtil, "processSepUtilCommand:response:", v7, v98);
      }
      else if (objc_msgSend(v14, "isEqualToString:", CFSTR("GetLogs")))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "lastPathComponent"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start processing the %@ command"), v14, 99, v91));
        sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v44, v45, v46, v47, v48, v49, (uint64_t)v42);

        v23 = sub_100009FF0(v98);
      }
      else
      {
        if (!objc_msgSend(v14, "isEqualToString:", CFSTR("PerformComponentCheckReboot")))
        {
          v26 = 4;
          goto LABEL_14;
        }
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "lastPathComponent"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start processing the %@ command"), v14, 99, v91));
        sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v53, v54, v55, v56, v57, v58, (uint64_t)v51);

        v23 = -[HSMessageProcessor rebootDevice:](v96, "rebootDevice:", v98);
      }
      v26 = v23;
LABEL_14:
      v12 = v14;
      goto LABEL_15;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastPathComponent"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Command is not a string. This is not supported\n")));
    v26 = 4;
    sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v35, v36, v37, v38, v39, v40, (uint64_t)v34);

    objc_msgSend(v9, "setObject:forKey:", CFSTR("Command is not a string. This is not supported"), CFSTR("Error"));
    v14 = 0;
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastPathComponent"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Message is not a dictionary. This is not supported\n")));
    v26 = 4;
    sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v27, v28, v29, v30, v31, v32, (uint64_t)v25);

    objc_msgSend(v9, "setObject:forKey:", CFSTR("Message is not a dictionary. This is not supported"), CFSTR("Error"));
    v14 = 0;
    v12 = 0;
  }
  a4 = v98;
LABEL_15:
  v59 = *a4;
  v99 = v14;
  if (*a4 || !v9)
  {
    if (v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "valueForKey:", CFSTR("Output")));
      if (!objc_msgSend(v60, "length"))
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a4, "valueForKey:", CFSTR("Error")));
        if (objc_msgSend(v61, "length"))
        {

        }
        else
        {
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a4, "valueForKey:", CFSTR("Status")));
          v97 = objc_msgSend(v80, "integerValue");

          if (v97)
            goto LABEL_23;
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a4, "valueForKey:", CFSTR("Data")));
          if (!v60
            || (v81 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v60, v81) & 1) != 0)
            && !objc_msgSend(v60, "length")
            || (v82 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v60, v82) & 1) != 0)
            && !objc_msgSend(v60, "count"))
          {
            *a4 = objc_retainAutorelease(v101);
          }
        }
      }

    }
  }
  else
  {
    v9 = objc_retainAutorelease(v9);
    *a4 = v9;
  }
LABEL_23:
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "lastPathComponent"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %@"), "-[HSMessageProcessor processMessage:response:]", 128, *a4));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v64, v65, v66, v67, v68, v69, (uint64_t)v63);

  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "lastPathComponent"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("rval = %d"), v26, 128, v94));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v73, v74, v75, v76, v77, v78, (uint64_t)v71);

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentCheckUtil, 0);
  objc_storeStrong((id *)&self->_sepUtil, 0);
}

@end
