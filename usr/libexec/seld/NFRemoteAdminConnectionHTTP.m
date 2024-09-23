@implementation NFRemoteAdminConnectionHTTP

- (NFRemoteAdminConnectionHTTP)initWithURL:(id)a3 SEID:(id)a4
{
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(3, "%c[%{public}s %{public}s]:%i API is deprecated!!", v12, ClassName, Name, 95);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v21 = v17;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 95;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i API is deprecated!!", buf, 0x22u);
  }

  return 0;
}

- (NFRemoteAdminConnectionHTTP)initWithURL:(id)a3 SEID:(id)a4 showProprietaryHeaders:(BOOL)a5 disableEVTrustValidation:(BOOL)a6
{
  id v10;
  id v11;
  NFRemoteAdminConnectionHTTP *v12;
  dispatch_semaphore_t v13;
  OS_dispatch_semaphore *sem;
  NSURL *v15;
  NSURL *baseURL;
  objc_super v18;
  _QWORD block[6];

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NFRemoteAdminConnectionHTTP;
  v12 = -[NFRemoteAdminConnectionHTTP init](&v18, "init");
  if (v12)
  {
    v13 = dispatch_semaphore_create(0);
    sem = v12->_sem;
    v12->_sem = (OS_dispatch_semaphore *)v13;

    if (objc_msgSend(v11, "length"))
      v15 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:", v11));
    else
      v15 = (NSURL *)v10;
    baseURL = v12->_baseURL;
    v12->_baseURL = v15;

    if (os_variant_has_internal_content("com.apple.nfc"))
      v12->_disableEVTrustValidation = a6;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100039B6C;
    block[3] = &unk_100054AA0;
    block[4] = v12;
    block[5] = "_getSessionWithProprietaryHeaders";
    if (qword_10005C3D8 != -1)
      dispatch_once(&qword_10005C3D8, block);
    objc_storeStrong((id *)&v12->_netSession, (id)qword_10005C3E0);
    v12->_proprietaryHeaders = a5;
  }

  return v12;
}

- (unsigned)connect
{
  return 0;
}

- (unsigned)disconnect
{
  NFRemoteAdminConnectionHTTP *v2;

  v2 = self;
  objc_sync_enter(v2);
  -[NSURLSessionTask cancel](v2->_netSessionTask, "cancel");
  objc_sync_exit(v2);

  return 0;
}

- (id)urlString
{
  return -[NSURL absoluteString](self->_url, "absoluteString");
}

- (unsigned)performRequest:(id)a3 body:(id)a4 header:(id)a5 response:(id)a6 responseHeader:(id)a7 httpStatus:(int64_t *)a8 duration:(double *)a9 sessionError:(id *)a10
{
  id v14;
  NSURL *baseURL;
  NSURL *v16;
  NSURL *url;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSBundle *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v40;
  const char *ClassName;
  const char *Name;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  NFRemoteAdminConnectionHTTP *v50;
  NSURLSession *netSession;
  id v52;
  uint64_t v53;
  NSURLSessionTask *netSessionTask;
  uint64_t v55;
  NFRemoteAdminConnectionHTTP *v56;
  NSURLSessionTask *v57;
  int v58;
  void *v59;
  void (*v60)(uint64_t, const char *, ...);
  objc_class *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  objc_class *v68;
  int v69;
  const char *v70;
  const char *v71;
  void *v72;
  void (*v73)(uint64_t, const char *, ...);
  objc_class *v74;
  uint64_t v75;
  const char *v76;
  const char *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  objc_class *v82;
  int v83;
  const char *v84;
  const char *v85;
  void *v86;
  unsigned int v87;
  void *context;
  id v90;
  void *v91;
  void *v92;
  __CFString *v93;
  void *v95;
  void *v96;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  void *v104;
  _QWORD v106[5];
  id v107;
  id v108;
  uint8_t *v109;
  uint64_t *v110;
  uint8_t *v111;
  uint64_t *v112;
  SEL v113;
  int64_t *v114;
  id v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  id v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  int v125;
  uint8_t buf[8];
  _BYTE v127[26];
  __int16 v128;
  id v129;
  uint8_t v130[8];
  _BYTE v131[40];

  v103 = a3;
  v101 = a4;
  v100 = a5;
  v98 = a6;
  v99 = a7;
  v122 = 0;
  v123 = &v122;
  v124 = 0x2020000000;
  v125 = 6;
  v116 = 0;
  v117 = &v116;
  v118 = 0x3032000000;
  v119 = sub_10003AC74;
  v120 = sub_10003AC84;
  v121 = 0;
  v95 = objc_autoreleasePoolPush();
  *(_QWORD *)v130 = 0;
  *(_QWORD *)v131 = v130;
  *(_QWORD *)&v131[8] = 0x3032000000;
  *(_QWORD *)&v131[16] = sub_10003AC74;
  *(_QWORD *)&v131[24] = sub_10003AC84;
  *(_QWORD *)&v131[32] = 0;
  v14 = objc_msgSend(v103, "length");
  baseURL = self->_baseURL;
  if (v14)
    v16 = (NSURL *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](baseURL, "URLByAppendingPathComponent:", v103));
  else
    v16 = (NSURL *)-[NSURL copy](baseURL, "copy");
  url = self->_url;
  self->_url = v16;

  objc_storeStrong((id *)(*(_QWORD *)v131 + 40), self->_url);
  if (!v101)
  {
    v96 = 0;
    goto LABEL_8;
  }
  v115 = 0;
  v18 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v101, 0, &v115));
  v19 = v115;
  v20 = v19;
  v96 = (void *)v18;
  if (v18)
  {

LABEL_8:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", *(_QWORD *)(*(_QWORD *)v131 + 40), 1, 30.0));
    objc_msgSend(v21, "setHTTPMethod:", CFSTR("POST"));
    v104 = v21;
    v102 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", CFSTR("application/json"), CFSTR("Content-Type"), 0);
    if (v100)
      objc_msgSend(v102, "addEntriesFromDictionary:", v100);
    if (self->_proprietaryHeaders)
    {
      context = objc_autoreleasePoolPush();
      if ((NFIsSimulator() & 1) != 0)
        v93 = CFSTR("Simulator");
      else
        v93 = (__CFString *)MGCopyAnswer(CFSTR("ProductType"), 0);
      v92 = (void *)MGCopyAnswer(CFSTR("ProductName"), 0);
      v91 = (void *)MGCopyAnswer(CFSTR("ProductVersion"), 0);
      v22 = NFBuildVersion();
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v90 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@"), v93);
      v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@;%@;%@"), v92, v91, v23);
      v25 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "infoDictionary"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", kCFBundleVersionKey));

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "infoDictionary"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", kCFBundleVersionKey));

      v32 = objc_alloc((Class)NSString);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bundleIdentifier"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bundleIdentifier"));
      v35 = objc_msgSend(v32, "initWithFormat:", CFSTR("%@/%@ (%@/%@)"), v33, v28, v34, v31);

      v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<%@> <%@> <%@>"), v90, v24, v35);
      objc_autoreleasePoolPop(context);
      objc_msgSend(v102, "setObject:forKey:", v36, CFSTR("X-Apple-Client-Info"));

      objc_autoreleasePoolPop(objc_autoreleasePoolPush());
    }
    objc_msgSend(v104, "setAllHTTPHeaderFields:", v102);
    objc_msgSend(v104, "setHTTPBody:", v96);
    if (byte_10005C3E8)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(self);
        if (class_isMetaClass(Class))
          v40 = 43;
        else
          v40 = 45;
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        Logger(6, "%c[%{public}s %{public}s]:%i [TSM] Request Header: %@", v40, ClassName, Name, 300, v102);
      }
      v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v44 = NFSharedLogGetLogger(v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = object_getClass(self);
        if (class_isMetaClass(v46))
          v47 = 43;
        else
          v47 = 45;
        v48 = object_getClassName(self);
        v49 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v47;
        *(_WORD *)v127 = 2082;
        *(_QWORD *)&v127[2] = v48;
        *(_WORD *)&v127[10] = 2082;
        *(_QWORD *)&v127[12] = v49;
        *(_WORD *)&v127[20] = 1024;
        *(_DWORD *)&v127[22] = 300;
        v128 = 2112;
        v129 = v102;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Request Header: %@", buf, 0x2Cu);
      }

      sub_10002DD88("[TSM] Request Body: ", v101);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)v127 = buf;
    *(_QWORD *)&v127[8] = 0x2020000000;
    *(_QWORD *)&v127[16] = 0;
    v50 = self;
    objc_sync_enter(v50);
    netSession = v50->_netSession;
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_10003AC8C;
    v106[3] = &unk_100055088;
    v106[4] = v50;
    v113 = a2;
    v107 = v99;
    v109 = buf;
    v110 = &v116;
    v111 = v130;
    v114 = a8;
    v112 = &v122;
    v52 = v98;
    v108 = v52;
    v53 = objc_claimAutoreleasedReturnValue(-[NSURLSession dataTaskWithRequest:completionHandler:](netSession, "dataTaskWithRequest:completionHandler:", v104, v106));
    netSessionTask = v50->_netSessionTask;
    v50->_netSessionTask = (NSURLSessionTask *)v53;

    v55 = mach_continuous_time();
    -[NSURLSessionTask resume](v50->_netSessionTask, "resume");

    objc_sync_exit(v50);
    if (v50->_netSessionTask)
      dispatch_semaphore_wait((dispatch_semaphore_t)v50->_sem, 0xFFFFFFFFFFFFFFFFLL);
    v56 = v50;
    objc_sync_enter(v56);
    v57 = v50->_netSessionTask;
    v50->_netSessionTask = 0;

    -[NSURLSession flushWithCompletionHandler:](v50->_netSession, "flushWithCompletionHandler:", &stru_1000550A8);
    objc_sync_exit(v56);

    if (a9)
      *a9 = (double)(unint64_t)GetElapsedTimeInMillisecondsFromMachTime(*(_QWORD *)(*(_QWORD *)v127 + 24), v55)
          / 1000.0;
    if (byte_10005C3E8 && objc_msgSend(v52, "count"))
      sub_10002DD88("[TSM] Response Body: ", v52);
    _Block_object_dispose(buf, 8);

    v58 = 1;
    goto LABEL_46;
  }
  v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v60 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v59);
  if (v60)
  {
    v61 = object_getClass(self);
    if (class_isMetaClass(v61))
      v62 = 43;
    else
      v62 = 45;
    v63 = object_getClassName(self);
    v64 = sel_getName(a2);
    v60(3, "%c[%{public}s %{public}s]:%i JSON serialization failed: %{public}@", v62, v63, v64, 273, v20);
  }
  v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v66 = NFSharedLogGetLogger(v65);
  v67 = objc_claimAutoreleasedReturnValue(v66);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
  {
    v68 = object_getClass(self);
    if (class_isMetaClass(v68))
      v69 = 43;
    else
      v69 = 45;
    v70 = object_getClassName(self);
    v71 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v69;
    *(_WORD *)v127 = 2082;
    *(_QWORD *)&v127[2] = v70;
    *(_WORD *)&v127[10] = 2082;
    *(_QWORD *)&v127[12] = v71;
    *(_WORD *)&v127[20] = 1024;
    *(_DWORD *)&v127[22] = 273;
    v128 = 2114;
    v129 = v20;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i JSON serialization failed: %{public}@", buf, 0x2Cu);
  }

  v58 = 0;
LABEL_46:
  _Block_object_dispose(v130, 8);

  objc_autoreleasePoolPop(v95);
  if (v58)
  {
    if (a10)
      *a10 = objc_retainAutorelease((id)v117[5]);
    if (v117[5])
    {
      v72 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v73 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v72);
      if (v73)
      {
        v74 = object_getClass(self);
        if (class_isMetaClass(v74))
          v75 = 43;
        else
          v75 = 45;
        v76 = object_getClassName(self);
        v77 = sel_getName(a2);
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v117[5], "description"));
        v73(3, "%c[%{public}s %{public}s]:%i NetSessionError=%{public}@", v75, v76, v77, 454, v78);

      }
      v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v80 = NFSharedLogGetLogger(v79);
      v81 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        v82 = object_getClass(self);
        if (class_isMetaClass(v82))
          v83 = 43;
        else
          v83 = 45;
        v84 = object_getClassName(self);
        v85 = sel_getName(a2);
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v117[5], "description"));
        *(_DWORD *)v130 = 67110146;
        *(_DWORD *)&v130[4] = v83;
        *(_WORD *)v131 = 2082;
        *(_QWORD *)&v131[2] = v84;
        *(_WORD *)&v131[10] = 2082;
        *(_QWORD *)&v131[12] = v85;
        *(_WORD *)&v131[20] = 1024;
        *(_DWORD *)&v131[22] = 454;
        *(_WORD *)&v131[26] = 2114;
        *(_QWORD *)&v131[28] = v86;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NetSessionError=%{public}@", v130, 0x2Cu);

      }
    }
    v87 = *((_DWORD *)v123 + 6);
  }
  else
  {
    v87 = 22;
  }
  _Block_object_dispose(&v116, 8);

  _Block_object_dispose(&v122, 8);
  return v87;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __SecTrust *v16;
  void *v17;
  NSObject *v18;
  _QWORD *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  void *specific;
  uint64_t Logger;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  int v48;
  const char *Name;
  _BOOL4 v50;
  const char *v51;
  int v52;
  uint64_t v53;
  void *v54;
  _QWORD v55[2];
  void (*v56)(uint64_t, int);
  void *v57;
  id v58;
  id v59;
  uint8_t buf[4];
  int v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  int v69;
  void **result;
  _BYTE v71[32];
  id v72;
  const char *v73;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "protectionSpace"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "authenticationMethod"));
  if (objc_msgSend(v13, "isEqualToString:", NSURLAuthenticationMethodServerTrust))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegateQueue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "underlyingQueue"));

    if (!v15)
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v39 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v43 = 45;
        if (isMetaClass)
          v43 = 43;
        v39(3, "%c[%{public}s %{public}s]:%i session delegate queue is nil", v43, ClassName, Name, 549);
      }
      v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v45 = NFSharedLogGetLogger(v44);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = object_getClass(self);
        if (class_isMetaClass(v47))
          v48 = 43;
        else
          v48 = 45;
        LODWORD(result) = 67109890;
        HIDWORD(result) = v48;
        *(_WORD *)v71 = 2082;
        *(_QWORD *)&v71[2] = object_getClassName(self);
        *(_WORD *)&v71[10] = 2082;
        *(_QWORD *)&v71[12] = sel_getName(a2);
        *(_WORD *)&v71[20] = 1024;
        *(_DWORD *)&v71[22] = 549;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i session delegate queue is nil", (uint8_t *)&result, 0x22u);
      }

      NFSimulateCrash(57005, "session delegate queue is nil");
      exit(-1);
    }
    v16 = (__SecTrust *)objc_msgSend(v12, "serverTrust");
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegateQueue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "underlyingQueue"));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v56 = sub_10003CAB4;
    v57 = &unk_1000550F8;
    v59 = v11;
    v58 = v12;
    v18 = v17;
    v19 = v55;
    v20 = v19;
    if (self)
    {
      if (v16)
      {
        result = _NSConcreteStackBlock;
        *(_QWORD *)v71 = 3221225472;
        *(_QWORD *)&v71[8] = sub_10003BF9C;
        *(_QWORD *)&v71[16] = &unk_1000550D0;
        *(_QWORD *)&v71[24] = self;
        v73 = "_trustPassesExtendedValidation:queue:completionHandler:";
        v21 = v19;
        v72 = v21;
        v22 = SecTrustEvaluateAsyncWithError(v16, v18, &result);
        if ((_DWORD)v22)
        {
          v23 = v22;
          v53 = (uint64_t)v21;
          v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v25 = NFLogGetLogger(v24);
          if (v25)
          {
            v26 = (void (*)(uint64_t, const char *, ...))v25;
            v27 = object_getClass(self);
            v50 = class_isMetaClass(v27);
            v51 = object_getClassName(self);
            v28 = sel_getName("_trustPassesExtendedValidation:queue:completionHandler:");
            v29 = 45;
            if (v50)
              v29 = 43;
            v26(3, "%c[%{public}s %{public}s]:%i Trust eval error: %d", v29, v51, v28, 536, v23);
          }
          v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v31 = NFSharedLogGetLogger(v30);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = object_getClass(self);
            if (class_isMetaClass(v33))
              v34 = 43;
            else
              v34 = 45;
            v52 = v34;
            v35 = object_getClassName(self);
            v36 = sel_getName("_trustPassesExtendedValidation:queue:completionHandler:");
            *(_DWORD *)buf = 67110146;
            v61 = v52;
            v62 = 2082;
            v63 = v35;
            v64 = 2082;
            v65 = v36;
            v66 = 1024;
            v67 = 536;
            v68 = 1024;
            v69 = v23;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Trust eval error: %d", buf, 0x28u);
          }

          v56(v53, 0);
        }

      }
      else
      {
        v56((uint64_t)v19, 0);
      }
    }

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netSessionTask, 0);
  objc_storeStrong((id *)&self->_netSession, 0);
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
