@implementation BRCTLLogCommand

- (BRCTLLogCommand)init
{
  BRCTLLogCommand *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *uuidToSection;
  NSNumber *page;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  NSMutableString *predicateString;
  NSPredicate *predicate;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *outputQueue;
  dispatch_semaphore_t v18;
  OS_dispatch_semaphore *outputSemaphore;
  NSDateFormatter *v20;
  NSDateFormatter *timestampFormatter;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)BRCTLLogCommand;
  v2 = -[BRCTLLogCommand init](&v23, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    uuidToSection = v2->_uuidToSection;
    v2->_uuidToSection = v3;

    page = v2->_page;
    v2->_page = (NSNumber *)&__kCFBooleanTrue;

    v6 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    startDate = v2->_startDate;
    v2->_startDate = (NSDate *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    endDate = v2->_endDate;
    v2->_endDate = (NSDate *)v8;

    predicateString = v2->_predicateString;
    v2->_predicateString = 0;

    predicate = v2->_predicate;
    v2->_predicate = 0;

    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(v13, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("log-output", v15);

    outputQueue = v2->_outputQueue;
    v2->_outputQueue = (OS_dispatch_queue *)v16;

    v18 = dispatch_semaphore_create(2000);
    outputSemaphore = v2->_outputSemaphore;
    v2->_outputSemaphore = (OS_dispatch_semaphore *)v18;

    v2->_timezoneAware = 1;
    v20 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    timestampFormatter = v2->_timestampFormatter;
    v2->_timestampFormatter = v20;

    -[NSDateFormatter setDateFormat:](v2->_timestampFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSZ"));
  }
  return v2;
}

- (void)computeRealOptionsForFd:(id)a3
{
  NSNumber *use_color;
  NSNumber *use_multiline;
  id v6;

  v6 = a3;
  if (v6 && isatty((int)objc_msgSend(v6, "intValue")))
  {
    if (!self->_use_color)
    {
      self->_use_color = (NSNumber *)&__kCFBooleanTrue;

    }
    if (!self->_use_multiline)
    {
      self->_use_multiline = (NSNumber *)&__kCFBooleanFalse;

    }
  }
  if (!-[NSNumber BOOLValue](self->_use_color, "BOOLValue"))
  {
    use_color = self->_use_color;
    self->_use_color = 0;

  }
  if (!-[NSNumber BOOLValue](self->_use_multiline, "BOOLValue"))
  {
    use_multiline = self->_use_multiline;
    self->_use_multiline = 0;

  }
}

- (void)_dumpLevel:(int)a3
{
  unsigned int v4;

  if (a3 >= 8)
    v4 = 8;
  else
    v4 = a3;
  -[BRCTermDumper startFgColor:attr:](self->_dumper, "startFgColor:attr:", dword_10001B558[v4], dword_10001B57C[v4]);
  -[BRCTermDumper puts:](self->_dumper, "puts:", off_100024A60[v4]);
}

- (id)_parseMessage:(const char *)a3
{
  char *v3;
  NSArray *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *regularExpressionReplacementInfos;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  char *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSArray *obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];

  v3 = (char *)a3;
  if (a3)
  {
    if (-[BRCTermDumper useColor](self->_dumper, "useColor"))
    {
      if (!self->_regularExpressionReplacementInfos)
      {
        v5 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("([0-9A-F]{8})-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}"), 0, 0));
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTermDumper startStringForFgColor:bgColor:attr:](self->_dumper, "startStringForFgColor:bgColor:attr:", 3, 0xFFFFFFFFLL, 0));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTermDumper stringForReset](self->_dumper, "stringForReset"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<$1>%@"), v7, v8));
        v51[0] = CFSTR("template");
        v51[1] = CFSTR("regex");
        v52[0] = v9;
        v52[1] = v6;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 2));
        -[NSArray addObject:](v5, "addObject:", v10);

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("\"([^\"]*)\"), 0, 0));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTermDumper startStringForFgColor:bgColor:attr:](self->_dumper, "startStringForFgColor:bgColor:attr:", 6, 0xFFFFFFFFLL, 0));

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTermDumper stringForReset](self->_dumper, "stringForReset"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\"$1\"%@"), v12, v13));

        v49[0] = CFSTR("template");
        v49[1] = CFSTR("regex");
        v50[0] = v14;
        v50[1] = v11;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 2));
        -[NSArray addObject:](v5, "addObject:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("'([^']*)'"), 0, 0));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTermDumper startStringForFgColor:bgColor:attr:](self->_dumper, "startStringForFgColor:bgColor:attr:", 6, 0xFFFFFFFFLL, 0));

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTermDumper stringForReset](self->_dumper, "stringForReset"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@'$1'%@"), v17, v18));

        v47[0] = CFSTR("template");
        v47[1] = CFSTR("regex");
        v48[0] = v19;
        v48[1] = v16;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));
        -[NSArray addObject:](v5, "addObject:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_100027F28, "componentsJoinedByString:", CFSTR("|")));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\\b(%@)\\b"), v21));

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v22, 0, 0));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTermDumper startStringForFgColor:bgColor:attr:](self->_dumper, "startStringForFgColor:bgColor:attr:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, 2));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTermDumper stringForReset](self->_dumper, "stringForReset"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@$1%@"), v24, v25));

        v45[0] = CFSTR("template");
        v45[1] = CFSTR("regex");
        v46[0] = v26;
        v46[1] = v23;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));
        -[NSArray addObject:](v5, "addObject:", v27);

        regularExpressionReplacementInfos = self->_regularExpressionReplacementInfos;
        self->_regularExpressionReplacementInfos = v5;

      }
      v3 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = self->_regularExpressionReplacementInfos;
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v41;
        do
        {
          v32 = 0;
          v33 = v3;
          do
          {
            if (*(_QWORD *)v41 != v31)
              objc_enumerationMutation(obj);
            v34 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v32);
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("regex")));
            v36 = objc_msgSend(v33, "length");
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("template")));
            v3 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByReplacingMatchesInString:options:range:withTemplate:", v33, 0, 0, v36, v37));

            v32 = (char *)v32 + 1;
            v33 = v3;
          }
          while (v30 != v32);
          v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v30);
      }

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)printLogWithFacility:(id)a3 subsystem:(id)a4 message:(const char *)a5 threadID:(unint64_t)a6 kind:(int)a7 sender:(id)a8 sendPID:(int)a9 depth:(int)a10 level:(int)a11 timestamp:(id)a12 timezone:(id)a13 sectionID:(id)a14 isOversize:(BOOL)a15 previousSectionID:(id)a16
{
  uint64_t v17;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSNumber *use_multiline;
  id v28;
  id v29;
  id v30;
  void *v31;
  Section *v32;
  unsigned int v33;
  uint64_t v34;
  id v35;
  const char *v36;
  BRCTermDumper *v37;
  const char *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  size_t v45;
  BRCTermDumper *dumper;
  const char *v47;
  unint64_t v48;
  unsigned int v49;
  const char *v50;
  id v51;
  id v52;
  id v53;
  size_t v54;
  size_t v55;
  char *v56;
  size_t v57;
  size_t v58;
  unsigned int v59;
  BRCTermDumper *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  Section *v65;
  id v66;
  void *v67;
  id v68;

  v17 = *(_QWORD *)&a7;
  v68 = a3;
  v21 = a4;
  v22 = a8;
  v23 = a12;
  v24 = a13;
  v25 = a14;
  v26 = a16;
  if (self->_timezoneAware)
    -[NSDateFormatter setTimeZone:](self->_timestampFormatter, "setTimeZone:", v24);
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](self->_timestampFormatter, "stringFromDate:", v23));
  if (-[NSNumber intValue](self->_level, "intValue") < 1 || -[NSNumber intValue](self->_level, "intValue") >= a11)
  {
    if ((_DWORD)v17 == 1)
    {
      -[BRCTermDumper startFgColor:attr:](self->_dumper, "startFgColor:attr:", 7, 18);
      -[BRCTermDumper write:](self->_dumper, "write:", "\n%s\n\n", a5);
      -[BRCTermDumper reset](self->_dumper, "reset");
      goto LABEL_64;
    }
    if (self->_digest)
    {
      if (a11 > 5)
        goto LABEL_64;
      use_multiline = self->_use_multiline;
      self->_use_multiline = (NSNumber *)&__kCFBooleanFalse;

      goto LABEL_10;
    }
    if ((_DWORD)v17 == 3 && v25)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToSection, "objectForKeyedSubscript:", v25));
      -[NSMutableDictionary removeObjectForKey:](self->_uuidToSection, "removeObjectForKey:", v25);
      v65 = 0;
    }
    else
    {
      if (!v25)
      {
LABEL_10:
        v65 = 0;
LABEL_11:
        v62 = 0;
        goto LABEL_23;
      }
      v65 = (Section *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToSection, "objectForKeyedSubscript:", v25));
      if (v65 && (_DWORD)v17 != 4 && (_DWORD)v17 != 2)
        goto LABEL_11;
      v28 = v26;
      v29 = v25;
      v61 = v24;
      v63 = v28;
      v30 = v22;
      if (v28)
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToSection, "objectForKeyedSubscript:"));
      else
        v31 = 0;
      v32 = -[Section initWithUUID:kind:depth:parent:]([Section alloc], "initWithUUID:kind:depth:parent:", v29, v17, a10, v31);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uuidToSection, "setObject:forKeyedSubscript:", v32, v29);
      v62 = 0;
      v65 = v32;
      v22 = v30;
      v24 = v61;
      v25 = v29;
      v26 = v63;
    }
LABEL_23:
    -[BRCTermDumper startFgColor:attr:](self->_dumper, "startFgColor:attr:", 0, 2);
    -[BRCTermDumper puts:len:](self->_dumper, "puts:len:", "[", 1);
    -[BRCTLLogCommand _dumpLevel:](self, "_dumpLevel:", a11);
    -[BRCTermDumper startFgColor:attr:](self->_dumper, "startFgColor:attr:", 0, 2);
    -[BRCTermDumper put:](self->_dumper, "put:", v67);
    -[BRCTermDumper puts:len:](self->_dumper, "puts:len:", "] ", 2);
    if (v22)
    {
      -[BRCTermDumper startFgColor:attr:](self->_dumper, "startFgColor:attr:", 2, 2);
      -[BRCTermDumper put:](self->_dumper, "put:", v22);
      -[BRCTermDumper write:](self->_dumper, "write:", "[%d] ", a9);
    }
    v66 = v21;
    v33 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.FileProvider"));
    v34 = a10;
    v64 = v26;
    if (!v68 || !v33)
    {
      if (!v68)
        goto LABEL_40;
      goto LABEL_38;
    }
    if ((objc_msgSend(v68, "isEqualToString:", CFSTR("default personal")) & 1) != 0
      || (objc_msgSend(v68, "isEqualToString:", CFSTR("default enterprise")) & 1) != 0
      || (objc_msgSend(v68, "isEqualToString:", CFSTR("fpfs")) & 1) != 0)
    {
LABEL_38:
      -[BRCTermDumper startFgColor:attr:](self->_dumper, "startFgColor:attr:", 5, 2);
      if (objc_msgSend(v68, "containsString:", CFSTR("enterprise")))
        -[BRCTermDumper write:](self->_dumper, "write:", "enterprise ");
LABEL_40:
      if (a15)
      {
        -[BRCTermDumper startFgColor:attr:](self->_dumper, "startFgColor:attr:", 3, 2);
        -[BRCTermDumper puts:](self->_dumper, "puts:", "oversize! ");
      }
      v39 = v24;
      -[BRCTermDumper startFgColor:attr:](self->_dumper, "startFgColor:attr:", 0, 2);
      if (!self->_digest)
        -[BRCTermDumper startFgColor:](self->_dumper, "startFgColor:", 3);
      -[BRCTermDumper reset](self->_dumper, "reset");
      if (self->_shorten)
      {
        v40 = v22;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLLogCommand _parseMessage:](self, "_parseMessage:", a5));
        v42 = v41;
        if (v41)
          a5 = (const char *)objc_msgSend(objc_retainAutorelease(v41), "UTF8String");

        v22 = v40;
      }
      v24 = v39;
      if (-[NSNumber BOOLValue](self->_use_multiline, "BOOLValue"))
      {
        v43 = v62;
        if (!v62)
        {
          if (a5 && *a5)
          {
            v44 = v34;
            do
            {
              v45 = strcspn(a5, "\n");
              -[BRCTermDumper puts:len:](self->_dumper, "puts:len:", "\n\t", 2);
              -[Section dumpPrefixWithKind:depth:to:](v65, "dumpPrefixWithKind:depth:to:", v17, v44, self->_dumper);
              -[BRCTermDumper puts:len:](self->_dumper, "puts:len:", a5, v45);
              v17 = 0;
              if (a5[v45] == 10)
                a5 += v45 + 1;
              else
                a5 += v45;
            }
            while (*a5);
          }
          -[BRCTermDumper puts:len:](self->_dumper, "puts:len:", "\n", 1);
          v21 = v66;
          v24 = v39;
          v43 = 0;
          v26 = v64;
          goto LABEL_63;
        }
        -[BRCTermDumper puts:len:](self->_dumper, "puts:len:", "\n\t", 2);
        objc_msgSend(v62, "dumpEndSectionTo:", self->_dumper);
        v26 = v64;
      }
      else
      {
        -[BRCTermDumper puts:len:](self->_dumper, "puts:len:", " ", 1);
        v43 = v62;
        v26 = v64;
        if (v62)
        {
          objc_msgSend(v62, "dumpEndSectionTo:", self->_dumper);
        }
        else
        {
          -[Section dumpPrefixWithKind:depth:to:](v65, "dumpPrefixWithKind:depth:to:", v17, v34, self->_dumper);
          -[BRCTermDumper puts:](self->_dumper, "puts:", a5);
          -[BRCTermDumper puts:len:](self->_dumper, "puts:len:", "\n", 1);
        }
      }
      v21 = v66;
LABEL_63:

      goto LABEL_64;
    }
    v35 = objc_retainAutorelease(v68);
    v36 = (const char *)objc_msgSend(v35, "UTF8String");
    -[BRCTermDumper startFgColor:attr:](self->_dumper, "startFgColor:attr:", 6, 2);
    if (!strcmp(v36, "com.apple.FileProvider.LocalStorage"))
    {
      dumper = self->_dumper;
      v47 = "local";
      v48 = 5;
    }
    else if (!strncmp(v36, "com.apple.CloudDocs.MobileDocumentsFileProvider", 0x2FuLL))
    {
      dumper = self->_dumper;
      v47 = "clouddocs";
      v48 = 9;
    }
    else
    {
      if (!strncmp(v36, "com.apple.CloudDocs.FileProvider", 0x20uLL))
      {
        v49 = objc_msgSend(v35, "hasSuffix:", CFSTR(".data"));
        v50 = "docs";
        if (v49)
          v50 = "data";
        -[BRCTermDumper write:](self->_dumper, "write:", "icloud.%s", v50);
        goto LABEL_89;
      }
      if (!strncmp(v36, "com.apple.icloud.drive.fileprovider", 0x23uLL))
      {
        v51 = v25;
        v52 = v24;
        v53 = v22;
        v54 = strlen(v36);
        if (v54 == 35)
        {
          -[BRCTermDumper puts:](self->_dumper, "puts:", "icloud.default");
        }
        else
        {
          v57 = v54;
          if (objc_msgSend(v35, "hasSuffix:", CFSTR(".data")))
          {
            -[BRCTermDumper write:](self->_dumper, "write:", "icloud.data[%c%c]", (v36[35] + 1), (v36[35] + 2));
          }
          else
          {
            v59 = objc_msgSend(v35, "hasSuffix:", CFSTR(".documents"));
            v60 = self->_dumper;
            if (v59)
              -[BRCTermDumper write:](v60, "write:", "icloud.docs[%c%c]", (v36[35] + 1), (v36[35] + 2));
            else
              -[BRCTermDumper puts:len:](v60, "puts:len:", v36, v57);
          }
        }
        v22 = v53;
        v24 = v52;
        v25 = v51;
        goto LABEL_89;
      }
      if (!strncmp(v36, "com.example.FruitBasket.Provider", 0x20uLL))
      {
        v55 = strlen(v36);
        if (v55 == 32)
          goto LABEL_79;
        v48 = v55;
        dumper = self->_dumper;
        if (v48 >= 0x2A)
        {
          v56 = (char *)(v36 + 33);
LABEL_85:
          -[BRCTermDumper write:](dumper, "write:", "FruitBasket.%.8s", v56);
          goto LABEL_89;
        }
      }
      else
      {
        if (strncmp(v36, "com.apple.FruitBasket.Provider", 0x1EuLL))
        {
          v37 = self->_dumper;
          v38 = v36;
LABEL_80:
          -[BRCTermDumper puts:](v37, "puts:", v38);
          goto LABEL_89;
        }
        v58 = strlen(v36);
        if (v58 == 30)
        {
LABEL_79:
          v37 = self->_dumper;
          v38 = "FruitBasket.default";
          goto LABEL_80;
        }
        v48 = v58;
        dumper = self->_dumper;
        if (v48 >= 0x28)
        {
          v56 = (char *)(v36 + 31);
          goto LABEL_85;
        }
      }
      v47 = v36;
    }
    -[BRCTermDumper puts:len:](dumper, "puts:len:", v47, v48);
LABEL_89:
    -[BRCTermDumper puts:len:](self->_dumper, "puts:len:", " ", 1);
    v34 = a10;
    goto LABEL_38;
  }
LABEL_64:

}

- (void)pushSection:(id)a3 forThread:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sectionsByThread, "objectForKeyedSubscript:", v6));
  if (!v7)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sectionsByThread, "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

- (void)getDepth:(int *)a3 current:(id *)a4 previous:(id *)a5 forThread:(id)a6
{
  id v10;
  void *v11;
  id v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  int *v27;
  id *v28;
  id *v29;
  id v30;
  char *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sectionsByThread, "objectForKeyedSubscript:", v10));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = v11;
  v13 = (char *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v27 = a3;
    v28 = a4;
    v29 = a5;
    v30 = v10;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)v34;
    obj = v12;
    do
    {
      v19 = 0;
      v31 = v17;
      v20 = v17 + 1;
      do
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v27, v28, v29, v30));

        if (v21 == v22)
        {
          v15 = &v19[(_QWORD)v20];
          v16 = 0;
        }
        else
        {
          ++v16;
        }
        ++v19;
      }
      while (v14 != v19);
      v12 = obj;
      v17 = &v14[(_QWORD)v31];
      v14 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);

    a4 = v28;
    *v27 = v16;
    a5 = v29;
    v10 = v30;
    if (v16)
    {
      *v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectAtIndex:", &v15[v16 - 1]));
      if (v16 != 1)
        *v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectAtIndex:", &v15[v16 - 2]));
    }
  }
  else
  {

    *a3 = 0;
  }
  v23 = *a4;
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v23 == v24)
    sub_100016FD8();

  v25 = *a5;
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v25 == v26)
    sub_100017000();

}

- (void)outputEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSString *v28;
  NSString *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  const char *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  BRCTLLogCommand *v60;
  BRCTLLogCommand *v61;
  id v62;
  id v63;
  char *__endptr[2];

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  if (objc_msgSend(v4, "eventType") == (id)1024)
  {
    v6 = v4;
    v7 = objc_msgSend(v6, "messageType");
    v8 = 0;
    if (v7 <= 1)
    {
      if (v7)
      {
        if (v7 == 1)
          v8 = 6;
      }
      else
      {
        v8 = 5;
      }
    }
    else
    {
      switch(v7)
      {
        case 2:
          v8 = 7;
          break;
        case 16:
          v8 = 3;
          break;
        case 17:
          v8 = 2;
          break;
      }
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventMessage"));

    if (!v9)
      objc_msgSend(v6, "setEventMessage:", CFSTR("<libtrace was unable to decode this message>"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "threadID")));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventMessage")));
    v12 = (const char *)objc_msgSend(v11, "UTF8String");

    if (self->_quickMode)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "category"));
      v60 = self;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subsystem"));
      v52 = objc_msgSend(v6, "threadID");
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "processImagePath"));
      v58 = v10;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));
      v16 = objc_msgSend(v6, "processID");
      v17 = v5;
      v18 = v4;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timezone"));
      LOBYTE(v46) = objc_msgSend(v6, "br_isOversize");
      LODWORD(v45) = v8;
      -[BRCTLLogCommand printLogWithFacility:subsystem:message:threadID:kind:sender:sendPID:depth:level:timestamp:timezone:sectionID:isOversize:previousSectionID:](v60, "printLogWithFacility:subsystem:message:threadID:kind:sender:sendPID:depth:level:timestamp:timezone:sectionID:isOversize:previousSectionID:", v56, v54, v13, v52, 0, v15, v16, v45, v19, v20, 0, v46, 0);

      v4 = v18;
      v5 = v17;

      v10 = v58;
LABEL_63:

      goto LABEL_64;
    }
    -[NSMutableArray addObject:](self->_allEvents, "addObject:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "category"));

    if (!v21)
      goto LABEL_63;
    v22 = 7;
    if (!strncmp(v12, "[CRIT] ", 7uLL))
    {
      v23 = 2;
    }
    else
    {
      v22 = 8;
      if (!strncmp(v12, "[ERROR] ", 8uLL))
      {
        v23 = 3;
      }
      else
      {
        v22 = 10;
        if (!strncmp(v12, "[WARNING] ", 0xAuLL))
        {
          v23 = 4;
        }
        else
        {
          v22 = 9;
          if (!strncmp(v12, "[NOTICE] ", 9uLL))
          {
            v23 = 5;
          }
          else
          {
            v22 = 7;
            if (!strncmp(v12, "[INFO] ", 7uLL))
            {
              v23 = 6;
            }
            else
            {
              v22 = 8;
              v23 = 7;
              if (strncmp(v12, "[DEBUG] ", 8uLL))
              {
                v24 = strncmp(v12, "[NOTIF] ", 8uLL);
                if (v24)
                  v23 = v8;
                else
                  v23 = 7;
                v22 = 8 * (v24 == 0);
              }
            }
          }
        }
      }
    }
    if (-[NSNumber intValue](self->_level, "intValue") && v23 > -[NSNumber intValue](self->_level, "intValue"))
      goto LABEL_63;
    v25 = &v12[v22];
    if (!strncmp(v25, "┏", 3uLL))
    {
      v25 += 3;
      __endptr[0] = 0;
      v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llx.%@.%llx"), objc_msgSend(v6, "processUniqueID"), v10, strtoll(v25, __endptr, 16));
      v27 = objc_claimAutoreleasedReturnValue(v28);
      v26 = 2;
    }
    else
    {
      v26 = 3;
      if (strncmp(v25, "┗", 3uLL))
      {
        if (!strncmp(v25, "┣", 3uLL))
        {
          v26 = 4;
        }
        else
        {
          if (strncmp(v25, "┳", 3uLL))
          {
            v27 = 0;
            goto LABEL_52;
          }
          v26 = 5;
        }
      }
      v25 += 3;
      __endptr[0] = 0;
      v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llx.%llx"), objc_msgSend(v6, "processUniqueID"), strtoll(v25, __endptr, 16));
      v27 = objc_claimAutoreleasedReturnValue(v29);
    }
    if (__endptr[0] != v25)
    {
      if (*__endptr[0] == 32)
        v25 = __endptr[0] + 1;
      else
        v25 = __endptr[0];
      switch((_DWORD)v26)
      {
        case 5:
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          -[BRCTLLogCommand pushSection:forThread:](self, "pushSection:forThread:", v30, v10);

          -[BRCTLLogCommand pushSection:forThread:](self, "pushSection:forThread:", v27, v10);
          v26 = 5;
          break;
        case 4:
          -[BRCTLLogCommand pushSection:forThread:](self, "pushSection:forThread:", v27, v10);
          v26 = 4;
          break;
        case 2:
          -[BRCTLLogCommand pushSection:forThread:](self, "pushSection:forThread:", v27, v10);
          v26 = 2;
          break;
      }
LABEL_55:
      v51 = (void *)v27;
      v53 = v25;
      v55 = v23;
      v57 = v5;
      v59 = v4;
      LODWORD(__endptr[0]) = 0;
      v62 = 0;
      v63 = 0;
      -[BRCTLLogCommand getDepth:current:previous:forThread:](self, "getDepth:current:previous:forThread:", __endptr, &v63, &v62, v10);
      v49 = v63;
      v31 = v62;
      v61 = self;
      v50 = v26;
      if ((_DWORD)v26 == 3)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sectionsByThread, "objectForKeyedSubscript:", v10));
        objc_msgSend(v32, "removeLastObject");
        v33 = v31;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastObject"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

        v36 = v34 == v35;
        v31 = v33;
        if (!v36)
          goto LABEL_61;
      }
      else
      {
        if ((_DWORD)v26 != 4)
        {
LABEL_62:
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "category"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subsystem"));
          v47 = objc_msgSend(v6, "threadID");
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "processImagePath"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "lastPathComponent"));
          v40 = objc_msgSend(v6, "processID");
          v41 = __endptr[0];
          v42 = v10;
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timezone"));
          LOBYTE(v46) = objc_msgSend(v6, "br_isOversize");
          LODWORD(v45) = v55;
          -[BRCTLLogCommand printLogWithFacility:subsystem:message:threadID:kind:sender:sendPID:depth:level:timestamp:timezone:sectionID:isOversize:previousSectionID:](v61, "printLogWithFacility:subsystem:message:threadID:kind:sender:sendPID:depth:level:timestamp:timezone:sectionID:isOversize:previousSectionID:", v48, v37, v53, v47, v50, v39, __PAIR64__(v41, v40), v45, v43, v44, v49, v46, v31);

          v10 = v42;
          v5 = v57;
          v4 = v59;
          goto LABEL_63;
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sectionsByThread, "objectForKeyedSubscript:", v10));
      }
      objc_msgSend(v32, "removeLastObject");
LABEL_61:

      goto LABEL_62;
    }
LABEL_52:
    v26 = 0;
    goto LABEL_55;
  }
LABEL_64:
  objc_autoreleasePoolPop(v5);

}

- (BOOL)outputEvents:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  BRCTermDumper *dumper;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    dumper = self->_dumper;
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "description")));
    -[BRCTermDumper write:](dumper, "write:", "error while reading logs: %s", objc_msgSend(v9, "UTF8String"));

  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v7);
          -[BRCTLLogCommand outputEvent:](self, "outputEvent:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13));
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }
  }

  return a4 == 0;
}

- (BOOL)activityStream:(id)a3 results:(id)a4
{
  return -[BRCTLLogCommand outputEvents:error:](self, "outputEvents:error:", a4, 0);
}

- (void)streamDidFail:(id)a3 error:(id)a4
{
  -[BRCTLLogCommand outputEvents:error:](self, "outputEvents:error:", 0, a4);
}

- (void)streamDidStop:(id)a3
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dumpSema);
}

- (int)dumpOrStreamLogArchiveToFd:(int)a3
{
  void *v4;
  void *v5;
  OS_dispatch_semaphore *v6;
  OS_dispatch_semaphore *dumpSema;
  NSMutableDictionary *v8;
  NSMutableDictionary *sectionsByThread;
  NSString *log_path;
  id v11;
  FILE *v12;
  const char *v13;
  int *v14;
  char *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSDate *v21;
  const char *v22;
  _QWORD *v23;
  _QWORD *v24;
  stat *v25;
  FILE *v26;
  void *v27;
  void *v28;
  int v29;
  NSDate *startDate;
  void *v31;
  NSDate *v32;
  NSDate *v33;
  NSDate *v34;
  NSDate *endDate;
  _QWORD v37[2];
  uint64_t (*v38)(uint64_t, void *);
  void *v39;
  BRCTLLogCommand *v40;
  _QWORD v41[5];
  stat v42;
  _QWORD v43[3];
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  size_t __linecapp;
  char *__linep;
  NSPredicate *predicate;

  predicate = self->_predicate;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &predicate, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v4));

  v6 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  dumpSema = self->_dumpSema;
  self->_dumpSema = v6;

  v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  sectionsByThread = self->_sectionsByThread;
  self->_sectionsByThread = v8;

  log_path = self->_log_path;
  if (!log_path)
  {
    if (self->_waitForMoreMessages)
    {
LABEL_9:
      v11 = objc_alloc_init((Class)OSActivityStream);
      objc_msgSend(v11, "setEventFilter:", 4);
      objc_msgSend(v11, "setPredicate:", v5);
      objc_msgSend(v11, "setOptions:", 772);
      objc_msgSend(v11, "setDelegate:", self);
      objc_msgSend(v11, "start");

LABEL_33:
      v16 = 0;
LABEL_34:
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_dumpSema, 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_35;
    }
LABEL_12:
    v17 = objc_alloc_init((Class)OSLogPersistence);
    if (self->_log_path)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:"));
      objc_msgSend(v17, "setLogArchive:", v18);

    }
    objc_msgSend(v17, "setPredicate:", v5);
    objc_msgSend(v17, "setOptions:", 2147483651);
    if (-[NSNumber BOOLValue](self->_page, "BOOLValue"))
      -[BRCTermDumper startPager](self->_dumper, "startPager");
    if (self->_lastDateComponent)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "endDate"));
      v20 = v19;
      if (v19)
        v21 = v19;
      else
        v21 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      startDate = self->_startDate;
      self->_startDate = v21;

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian));
      v32 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "dateByAddingComponents:toDate:options:", self->_lastDateComponent, self->_startDate, 0));
      v33 = self->_startDate;
      self->_startDate = v32;

    }
    v34 = self->_startDate;
    endDate = self->_endDate;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100006CF8;
    v41[3] = &unk_100024AD8;
    v41[4] = self;
    objc_msgSend(v17, "enumerateFromStartDate:toEndDate:withBlock:", v34, endDate, v41);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_dumpSema);
    dispatch_sync((dispatch_queue_t)self->_outputQueue, &stru_100024B18);

    goto LABEL_33;
  }
  if (-[NSString isEqualToString:](log_path, "isEqualToString:", CFSTR("-")))
  {
    if (!self->_waitForMoreMessages)
    {
LABEL_19:
      if (-[NSNumber BOOLValue](self->_page, "BOOLValue"))
        -[BRCTermDumper startPager](self->_dumper, "startPager");
      v22 = -[NSString fileSystemRepresentation](self->_log_path, "fileSystemRepresentation");
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v38 = sub_100006DC4;
      v39 = &unk_100024B40;
      v40 = self;
      v23 = v37;
      v45 = 0;
      v46 = &v45;
      v47 = 0x3032000000;
      v48 = sub_100007978;
      v49 = sub_100007988;
      v50 = 0;
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      v44 = 1;
      *(_QWORD *)&v42.st_dev = _NSConcreteStackBlock;
      v42.st_ino = 3221225472;
      *(_QWORD *)&v42.st_uid = sub_100007990;
      *(_QWORD *)&v42.st_rdev = &unk_100024DF0;
      v42.st_atimespec.tv_nsec = (uint64_t)v43;
      v42.st_mtimespec.tv_sec = (__darwin_time_t)&v45;
      v24 = v23;
      v42.st_atimespec.tv_sec = (__darwin_time_t)v24;
      v25 = &v42;
      if (!strcmp(v22, "-"))
      {
        v26 = __stdinp;
        if (__stdinp)
          goto LABEL_23;
      }
      else
      {
        v26 = fopen(v22, "r");
        if (v26)
        {
LABEL_23:
          __linecapp = 0;
          __linep = 0;
          if (getline(&__linep, &__linecapp, v26) < 0)
          {
            v29 = 0;
          }
          else
          {
            while (1)
            {
              v27 = objc_autoreleasePoolPush();
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __linep));
              if (!v28)
                break;
              v29 = (*(uint64_t (**)(stat *, void *))&v42.st_uid)(v25, v28);
              if (v29 < 0)
                goto LABEL_38;

              objc_autoreleasePoolPop(v27);
              if (getline(&__linep, &__linecapp, v26) < 0)
                goto LABEL_39;
            }
            v29 = -1;
LABEL_38:

            objc_autoreleasePoolPop(v27);
          }
LABEL_39:
          if (feof(v26))
            v16 = v29;
          else
            v16 = -1;
          free(__linep);
          if (v26 != __stdinp)
            fclose(v26);

          if ((v16 & 0x80000000) == 0)
          {
            v16 = v29;
            if (v46[5])
              v16 = ((uint64_t (*)(_QWORD *))v38)(v24);
          }
          goto LABEL_47;
        }
      }

      v16 = -1;
LABEL_47:

      _Block_object_dispose(v43, 8);
      _Block_object_dispose(&v45, 8);

      dispatch_semaphore_signal((dispatch_semaphore_t)self->_dumpSema);
      dispatch_sync((dispatch_queue_t)self->_outputQueue, &stru_100024B60);
      goto LABEL_34;
    }
    goto LABEL_9;
  }
  memset(&v42, 0, sizeof(v42));
  if ((stat(-[NSString fileSystemRepresentation](self->_log_path, "fileSystemRepresentation"), &v42) & 0x80000000) == 0)
  {
    if (self->_waitForMoreMessages)
      goto LABEL_9;
    if ((v42.st_mode & 0xF000) != 0x4000)
      goto LABEL_19;
    goto LABEL_12;
  }
  v12 = __stderrp;
  v13 = -[NSString fileSystemRepresentation](self->_log_path, "fileSystemRepresentation");
  v14 = __error();
  v15 = strerror(*v14);
  v16 = -1;
LABEL_35:

  return v16;
}

- (int)dumpToFd:(int)a3
{
  uint64_t v3;
  void *v5;
  BRCTermDumper *v6;
  BRCTermDumper *dumper;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
  -[BRCTLLogCommand computeRealOptionsForFd:](self, "computeRealOptionsForFd:", v5);

  v6 = (BRCTermDumper *)objc_msgSend(objc_alloc((Class)BRCTermDumper), "initWithFd:forceColor:darkMode:", v3, -[NSNumber BOOLValue](self->_use_color, "BOOLValue"), self->_darkMode);
  dumper = self->_dumper;
  self->_dumper = v6;

  return -[BRCTLLogCommand dumpOrStreamLogArchiveToFd:](self, "dumpOrStreamLogArchiveToFd:", v3);
}

+ (id)dateFromUTF8String:(const char *)a3
{
  void *v3;
  NSDateFormatter *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  v4 = objc_opt_new(NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ssZZZ"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v4, "dateFromString:", v3));
  if (!v5)
  {
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v4, "dateFromString:", v3));
    if (!v5)
    {
      -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v4, "dateFromString:", v3));
      if (!v5)
      {
        -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", CFSTR("yyyy-MM-dd"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v4, "dateFromString:", v3));
      }
    }
  }

  return v5;
}

+ (id)dateComponentsFromUTF8String:(const char *)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDateComponents *v16;
  uint64_t v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  v4 = objc_msgSend(v3, "length");
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("^(\\d+)([mhd])$"), 0, &v18));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstMatchInString:options:range:", v3, 0, 0, v4));
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "rangeAtIndex:", 1);
    v10 = v9;
    v11 = objc_msgSend(v7, "rangeAtIndex:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v11, v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v8, v10));
    v15 = -(uint64_t)objc_msgSend(v14, "integerValue");

    v16 = objc_opt_new(NSDateComponents);
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("m")))
    {
      -[NSDateComponents setMinute:](v16, "setMinute:", v15);
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("h")))
    {
      -[NSDateComponents setHour:](v16, "setHour:", v15);
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("d")))
    {
      -[NSDateComponents setDay:](v16, "setDay:", v15);
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)buildPredicateString:(id)a3
{
  NSMutableString *predicateString;
  id v5;
  NSMutableString *v6;
  NSMutableString *v7;

  predicateString = self->_predicateString;
  v5 = a3;
  if (predicateString)
  {
    -[NSMutableString appendString:](predicateString, "appendString:", CFSTR(" || "));
  }
  else
  {
    v6 = objc_opt_new(NSMutableString);
    v7 = self->_predicateString;
    self->_predicateString = v6;

  }
  -[NSMutableString appendString:](self->_predicateString, "appendString:", a3);

}

- (void)buildPredicateFromString
{
  NSMutableString *predicateString;
  NSMutableString *v4;
  NSMutableString *v5;
  NSPredicate *v6;
  NSPredicate *predicate;
  NSMutableString *v8;

  predicateString = self->_predicateString;
  if (!predicateString || !-[NSMutableString length](predicateString, "length"))
  {
    v4 = (NSMutableString *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("subsystem == \"com.apple.FileProvider\" || subsystem == \"com.apple.clouddocs\" || subsystem == \"com.apple.revisiond\")));
    v5 = self->_predicateString;
    self->_predicateString = v4;

  }
  v6 = (NSPredicate *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", self->_predicateString));
  predicate = self->_predicate;
  self->_predicate = v6;

  v8 = self->_predicateString;
  self->_predicateString = 0;

}

- (void)parseOption:(int)a3 arg:(const char *)a4
{
  const __CFString *v5;
  id v6;
  void *endDate;
  id *p_endDate;
  NSString *v9;
  void *home_path;
  id v11;
  NSPredicate *v12;
  id v13;
  NSNumber *v14;
  NSString *v15;
  NSNumber *v16;
  NSNumber *v17;
  id v18;
  NSNumber *v19;
  NSNumber *v20;
  NSNumber *v21;
  id v22;
  void *v23;
  id v24;

  switch(a3)
  {
    case 'D':
      v5 = CFSTR("(subsystem == \"com.apple.FileProvider\" && subsystem == \"com.apple.LiveFS\")");
      goto LABEL_25;
    case 'E':
      v6 = objc_msgSend((id)objc_opt_class(self, a2), "dateFromUTF8String:", a4);
      endDate = (void *)objc_claimAutoreleasedReturnValue(v6);
      v24 = endDate;
      if (!endDate)
        endDate = self->_endDate;
      p_endDate = (id *)&self->_endDate;
      goto LABEL_33;
    case 'F':
      v5 = CFSTR("subsystem == \"com.apple.FileProvider\" || subsystem == \"com.apple.FruitBasket\" || subsystem == \"com.example.FruitBasket\");
      goto LABEL_25;
    case 'H':
      v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
      home_path = self->_home_path;
      self->_home_path = v9;
      goto LABEL_23;
    case 'N':
      v5 = CFSTR("(process == \"Provider\" && (subsystem == \"com.apple.network\" || sender == \"CFNetwork\")");
      goto LABEL_25;
    case 'S':
      v11 = objc_msgSend((id)objc_opt_class(self, a2), "dateFromUTF8String:", a4);
      endDate = (void *)objc_claimAutoreleasedReturnValue(v11);
      v24 = endDate;
      if (!endDate)
        endDate = self->_startDate;
      p_endDate = (id *)&self->_startDate;
      goto LABEL_33;
    case 'a':
      v12 = (NSPredicate *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
      home_path = self->_predicate;
      self->_predicate = v12;
      goto LABEL_23;
    case 'b':
      v5 = CFSTR("subsystem == \"com.apple.clouddocs\");
      goto LABEL_25;
    case 'c':
      v13 = sub_10000A8BC(99, a4, &off_100027F70);
      v14 = (NSNumber *)objc_claimAutoreleasedReturnValue(v13);
      home_path = self->_use_color;
      self->_use_color = v14;
      goto LABEL_23;
    case 'd':
      v15 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
      home_path = self->_log_path;
      self->_log_path = v15;
      goto LABEL_23;
    case 'f':
      v5 = CFSTR("subsystem == \"com.apple.FileProvider\" || (subsystem == \"com.apple.clouddocs\" && senderImagePath ENDSWITH \"com.apple.CloudDocs.MobileDocumentsFileProvider\")");
      goto LABEL_25;
    case 'g':
      v5 = CFSTR("subsystem == \"com.apple.revisiond\");
      goto LABEL_25;
    case 'i':
      v5 = CFSTR("subsystem == \"com.apple.prequelite\" || subsystem == \"com.apple.clouddocs\");
      goto LABEL_25;
    case 'k':
      self->_darkMode = 1;
      return;
    case 'l':
      v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", strtoll(a4, 0, 10));
      v17 = (NSNumber *)objc_claimAutoreleasedReturnValue(v16);
      home_path = self->_level;
      self->_level = v17;
      goto LABEL_23;
    case 'm':
      v18 = sub_10000A8BC(109, a4, &off_100027F70);
      v19 = (NSNumber *)objc_claimAutoreleasedReturnValue(v18);
      home_path = self->_use_multiline;
      self->_use_multiline = v19;
      goto LABEL_23;
    case 'n':
      v20 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", strtoll(a4, 0, 10));
      v21 = (NSNumber *)objc_claimAutoreleasedReturnValue(v20);
      home_path = self->_initial_count;
      self->_initial_count = v21;
LABEL_23:

      return;
    case 'o':
      v5 = CFSTR("subsystem == \"com.apple.FileProvider\" && category == \"local-storage\");
LABEL_25:
      -[BRCTLLogCommand buildPredicateString:](self, "buildPredicateString:", v5);
      return;
    case 'p':
      v24 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", optarg));
      -[BRCTLLogCommand buildPredicateString:](self, "buildPredicateString:", v24);
      goto LABEL_37;
    case 'q':
      self->_quickMode = 1;
      return;
    case 's':
      self->_digest = 1;
      return;
    case 't':
      self->_shorten = 1;
      return;
    case 'u':
      v22 = objc_msgSend((id)objc_opt_class(self, a2), "dateComponentsFromUTF8String:", a4);
      endDate = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = endDate;
      if (!endDate)
        endDate = self->_lastDateComponent;
      p_endDate = (id *)&self->_lastDateComponent;
LABEL_33:
      objc_storeStrong(p_endDate, endDate);
      goto LABEL_37;
    case 'w':
      self->_waitForMoreMessages = 1;
      return;
    case 'x':
      v24 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", optarg));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("senderImagePath CONTAINS \"%@\"), v24));
      -[BRCTLLogCommand buildPredicateString:](self, "buildPredicateString:", v23);

LABEL_37:
      break;
    case 'z':
      self->_timezoneAware = 0;
      -[NSDateFormatter setDateFormat:](self->_timestampFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
      break;
    default:
      return;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampFormatter, 0);
  objc_storeStrong((id *)&self->_sectionsByThread, 0);
  objc_storeStrong((id *)&self->_allEvents, 0);
  objc_storeStrong((id *)&self->_dumpSema, 0);
  objc_storeStrong((id *)&self->_regularExpressionReplacementInfos, 0);
  objc_storeStrong((id *)&self->_uuidToSection, 0);
  objc_storeStrong((id *)&self->_outputSemaphore, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_dumper, 0);
  objc_storeStrong((id *)&self->_predicateString, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_lastDateComponent, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_home_path, 0);
  objc_storeStrong((id *)&self->_log_path, 0);
  objc_storeStrong((id *)&self->_initial_count, 0);
  objc_storeStrong((id *)&self->_use_multiline, 0);
  objc_storeStrong((id *)&self->_page, 0);
  objc_storeStrong((id *)&self->_use_color, 0);
}

@end
