@implementation AluminiumAuthenticator

+ (id)_defaultIncludedHeaders
{
  if (qword_1001754C8 != -1)
    dispatch_once(&qword_1001754C8, &stru_10013F3E8);
  return (id)qword_1001754C0;
}

- (AluminiumAuthenticator)initWithHexEncodedKey:(id)a3
{
  id v5;
  AluminiumAuthenticator *v6;
  uint64_t v7;
  NSData *key;
  NSData *v9;
  uint64_t v10;
  NSSet *defaultIncludedHeaders;
  AluminiumAuthenticator *v12;
  void *v14;
  objc_super v15;

  v5 = a3;
  if (!v5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AluminiumAuthenticator.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  v15.receiver = self;
  v15.super_class = (Class)AluminiumAuthenticator;
  v6 = -[AluminiumAuthenticator init](&v15, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_dataUsingHexEncoding"));
    key = v6->_key;
    v6->_key = (NSData *)v7;

    v9 = v6->_key;
    if (!v9 || !-[NSData length](v9, "length"))
    {
      v12 = 0;
      goto LABEL_9;
    }
    v10 = objc_claimAutoreleasedReturnValue(+[AluminiumAuthenticator _defaultIncludedHeaders](AluminiumAuthenticator, "_defaultIncludedHeaders"));
    defaultIncludedHeaders = v6->_defaultIncludedHeaders;
    v6->_defaultIncludedHeaders = (NSSet *)v10;

    v6->_defaultAlgorithm = 0;
  }
  v12 = v6;
LABEL_9:

  return v12;
}

- (AluminiumAuthenticator)initWithASCIIEncodedKey:(id)a3
{
  id v5;
  AluminiumAuthenticator *v6;
  uint64_t v7;
  NSData *key;
  NSData *v9;
  uint64_t v10;
  NSSet *defaultIncludedHeaders;
  AluminiumAuthenticator *v12;
  void *v14;
  objc_super v15;

  v5 = a3;
  if (!v5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AluminiumAuthenticator.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  v15.receiver = self;
  v15.super_class = (Class)AluminiumAuthenticator;
  v6 = -[AluminiumAuthenticator init](&v15, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 1));
    key = v6->_key;
    v6->_key = (NSData *)v7;

    v9 = v6->_key;
    if (!v9 || !-[NSData length](v9, "length"))
    {
      v12 = 0;
      goto LABEL_9;
    }
    v10 = objc_claimAutoreleasedReturnValue(+[AluminiumAuthenticator _defaultIncludedHeaders](AluminiumAuthenticator, "_defaultIncludedHeaders"));
    defaultIncludedHeaders = v6->_defaultIncludedHeaders;
    v6->_defaultIncludedHeaders = (NSSet *)v10;

    v6->_defaultAlgorithm = 0;
  }
  v12 = v6;
LABEL_9:

  return v12;
}

- (BOOL)addAuthenticationHeadersToRequest:(id)a3 error:(id *)a4
{
  return -[AluminiumAuthenticator addAuthenticationHeadersToRequest:includedHeaders:body:algorithm:error:](self, "addAuthenticationHeadersToRequest:includedHeaders:body:algorithm:error:", a3, 0, 0, 0xFFFFFFFFLL, a4);
}

- (BOOL)addAuthenticationHeadersToRequest:(id)a3 includedHeaders:(id)a4 body:(id)a5 algorithm:(unsigned int)defaultAlgorithm error:(id *)a7
{
  id v13;
  NSSet *v14;
  id v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  NSSet *v20;
  NSSet *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  id v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *i;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  unint64_t v61;
  AluminiumAuthenticator *v62;
  id v63;
  NSUInteger v64;
  id v65;
  id v66;
  char *v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;
  unint64_t v77;
  AluminiumAuthenticator *v78;
  void *v79;
  id v80;
  id v81;
  NSSet *v82;
  id v83;
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  NSErrorUserInfoKey v90;
  const __CFString *v91;
  _BYTE v92[128];
  NSErrorUserInfoKey v93;
  const __CFString *v94;
  NSErrorUserInfoKey v95;
  const __CFString *v96;

  v13 = a3;
  v14 = (NSSet *)a4;
  v15 = a5;
  if (v13)
  {
    if (!a7)
      goto LABEL_4;
    goto LABEL_3;
  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AluminiumAuthenticator.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

  if (a7)
LABEL_3:
    *a7 = 0;
LABEL_4:
  if (defaultAlgorithm == -1)
    defaultAlgorithm = self->_defaultAlgorithm;
  if (defaultAlgorithm < 6)
  {
    v16 = qword_1000F0090[defaultAlgorithm];
    if (-[NSData length](self->_key, "length") < v16)
    {
      if (a7)
      {
        v93 = NSLocalizedDescriptionKey;
        v94 = CFSTR("Key size too short");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
        v18 = 6;
LABEL_12:
        v19 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AluminiumAuthenticatorErrorDomain"), v18, v17));
LABEL_63:

        goto LABEL_64;
      }
      goto LABEL_13;
    }
    if (!v14)
      v14 = self->_defaultIncludedHeaders;
    v20 = v14;
    v21 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSSet _lowercaseSet](v14, "_lowercaseSet"));

    if (qword_1001754D0 != -1)
      dispatch_once(&qword_1001754D0, &stru_10013F408);
    v80 = v15;
    v77 = v16;
    v78 = self;
    if (!-[NSSet containsObject:](v21, "containsObject:", qword_1001754D8))
    {
      v22 = objc_claimAutoreleasedReturnValue(-[NSSet setByAddingObject:](v21, "setByAddingObject:", qword_1001754D8));

      v21 = (NSSet *)v22;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v21, "allObjects"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sortedArrayUsingSelector:", "compare:"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-HMAC-Sent-Timestamp")));
    v25 = v24;
    if (!v24 || !objc_msgSend(v24, "length"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v26, "timeIntervalSince1970");
      v28 = (uint64_t)(v27 * 1000.0);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), v28));
      objc_msgSend(v13, "addValue:forHTTPHeaderField:", v29, CFSTR("X-Apple-HMAC-Sent-Timestamp"));

    }
    v79 = v25;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URL"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("Host")));
    v82 = v21;
    if (-[NSSet containsObject:](v21, "containsObject:", CFSTR("host")) && (!v31 || !objc_msgSend(v31, "length")))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "host"));

      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "host"));
        objc_msgSend(v13, "addValue:forHTTPHeaderField:", v34, CFSTR("Host"));

      }
    }
    v81 = v31;
    v83 = v30;
    v35 = (void *)objc_opt_new(NSMutableArray, v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "HTTPMethod"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "lowercaseString"));
    v38 = objc_msgSend(v35, "_addHMACComponent:error:", v37, a7);

    v85 = v35;
    if (v38)
    {
      v39 = v83;
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "path"));
      v41 = v40;
      if (!v40)
        v40 = CFSTR("/");
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v40, "lowercaseString"));
      v43 = objc_msgSend(v35, "_addHMACComponent:error:", v42, a7);

      if (v43)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "query"));
        v14 = v82;
        v76 = v44;
        if (v44
          && (v45 = v44, objc_msgSend(v44, "length"))
          && !objc_msgSend(v85, "_addHMACComponent:error:", v45, a7))
        {
          v19 = 0;
          v56 = v79;
          v15 = v80;
        }
        else
        {
          v88 = 0u;
          v89 = 0u;
          v86 = 0u;
          v87 = 0u;
          v75 = v17;
          v46 = v17;
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v87;
            v84 = v46;
            while (2)
            {
              for (i = 0; i != v48; i = (char *)i + 1)
              {
                if (*(_QWORD *)v87 != v49)
                  objc_enumerationMutation(v84);
                v51 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)i);
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForHTTPHeaderField:", v51));
                v53 = v52;
                if (v52
                  && objc_msgSend(v52, "length")
                  && (!objc_msgSend(v85, "_addHMACComponent:error:", v51, a7)
                   || !objc_msgSend(v85, "_addHMACComponent:error:", v53, a7)))
                {

                  v19 = 0;
                  v56 = v79;
                  v15 = v80;
                  v17 = v75;
                  v39 = v83;
                  goto LABEL_60;
                }

              }
              v46 = v84;
              v48 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
              if (v48)
                continue;
              break;
            }
          }

          v15 = v80;
          if (v80 && objc_msgSend(v80, "length"))
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "base64EncodedStringWithOptions:", 0));
            v55 = v85;
            objc_msgSend(v85, "addObject:", v54);

          }
          else
          {
            v55 = v85;
            objc_msgSend(v85, "addObject:", &stru_100141020);
          }
          v39 = v83;
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "componentsJoinedByString:", CFSTR("|")));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "dataUsingEncoding:", 1));

          if (v58)
          {
            v74 = (uint64_t)&v74;
            v60 = v80;
            v61 = v77;
            __chkstk_darwin(v59);
            v62 = v78;
            v63 = -[NSData bytes](v78->_key, "bytes");
            v64 = -[NSData length](v62->_key, "length");
            v65 = objc_retainAutorelease(v58);
            v66 = objc_msgSend(v65, "bytes");
            v84 = v65;
            CCHmac(defaultAlgorithm, v63, v64, v66, (size_t)objc_msgSend(v65, "length"), (char *)&v74 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0));
            v67 = (char *)&v74 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
            v68 = v61;
            v15 = v60;
            v39 = v83;
            v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v67, v68, 0));
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "base64EncodedStringWithOptions:", 0));

            objc_msgSend(v13, "addValue:forHTTPHeaderField:", v70, CFSTR("X-Apple-HMAC-Digest"));
            v19 = 1;
            v17 = v75;
            v56 = v79;
            v14 = v82;
          }
          else
          {
            v84 = 0;
            v14 = v82;
            if (a7)
            {
              v90 = NSLocalizedDescriptionKey;
              v91 = CFSTR("Cannot encode HMAC text");
              v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1));
              *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AluminiumAuthenticatorErrorDomain"), 1, v71));

            }
            v19 = 0;
            v17 = v75;
            v56 = v79;
          }
LABEL_60:

        }
        goto LABEL_62;
      }
      v19 = 0;
      v56 = v79;
    }
    else
    {
      v19 = 0;
      v56 = v79;
      v39 = v83;
    }
    v15 = v80;
    v14 = v82;
LABEL_62:

    goto LABEL_63;
  }
  if (a7)
  {
    v95 = NSLocalizedDescriptionKey;
    v96 = CFSTR("Invalid HMAC algorithm");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1));
    v18 = 2;
    goto LABEL_12;
  }
LABEL_13:
  v19 = 0;
LABEL_64:

  return v19;
}

- (BOOL)verifyAuthenticationWithRequest:(__CFHTTPMessage *)a3 error:(id *)a4
{
  return -[AluminiumAuthenticator verifyAuthenticationWithRequest:includedHeaders:algorithm:error:](self, "verifyAuthenticationWithRequest:includedHeaders:algorithm:error:", a3, 0, 0xFFFFFFFFLL, a4);
}

- (BOOL)verifyAuthenticationWithRequest:(__CFHTTPMessage *)a3 includedHeaders:(id)a4 algorithm:(unsigned int)defaultAlgorithm error:(id *)a6
{
  NSSet *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  const __CFString **v18;
  NSErrorUserInfoKey *v19;
  BOOL v20;
  NSSet *v22;
  NSSet *v23;
  uint64_t v24;
  void *v25;
  CFURLRef v26;
  __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  CFURLRef v36;
  CFDataRef v37;
  uint64_t v38;
  const __CFString *v39;
  __CFString *v40;
  id v41;
  __CFString *v42;
  id v43;
  unsigned int v44;
  CFDataRef v45;
  CFDataRef v46;
  void *v47;
  id v48;
  __CFString *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  AluminiumAuthenticator *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  unsigned __int8 v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  CFURLRef v70;
  unint64_t v71;
  AluminiumAuthenticator *v72;
  NSSet *v73;
  __CFString *v74;
  id v75;
  CFDataRef v76;
  id v77;
  uint64_t *v78;
  __CFString *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  NSErrorUserInfoKey v84;
  const __CFString *v85;
  NSErrorUserInfoKey v86;
  const __CFString *v87;
  _BYTE v88[128];
  NSErrorUserInfoKey v89;
  const __CFString *v90;
  NSErrorUserInfoKey v91;
  const __CFString *v92;
  NSErrorUserInfoKey v93;
  const __CFString *v94;
  NSErrorUserInfoKey v95;
  const __CFString *v96;
  NSErrorUserInfoKey v97;
  const __CFString *v98;

  v11 = (NSSet *)a4;
  if (!a3)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AluminiumAuthenticator.m"), 354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != NULL"));

    if (!a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a6)
LABEL_3:
    *a6 = 0;
LABEL_4:
  v12 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(a3, CFSTR("X-Apple-HMAC-Digest"));
  v13 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(a3, CFSTR("X-Apple-HMAC-Sent-Timestamp"));
  if (!v12 || !-[__CFString length](v12, "length"))
  {
    if (a6)
    {
      v97 = NSLocalizedDescriptionKey;
      v98 = CFSTR("Missing digest header in HTTP request");
      v18 = &v98;
      v19 = &v97;
LABEL_19:
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v19, 1));
      v20 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AluminiumAuthenticatorErrorDomain"), 3, v14));
      goto LABEL_20;
    }
LABEL_21:
    v20 = 0;
    goto LABEL_22;
  }
  if (!v13 || !-[__CFString length](v13, "length"))
  {
    if (a6)
    {
      v95 = NSLocalizedDescriptionKey;
      v96 = CFSTR("Missing timestamp header in HTTP request");
      v18 = &v96;
      v19 = &v95;
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(uint64_t)-[__CFString integerValue](v13, "integerValue") / 1000.0));
  if (v14)
  {
    if (defaultAlgorithm == -1)
      defaultAlgorithm = self->_defaultAlgorithm;
    if (defaultAlgorithm >= 6)
    {
      if (a6)
      {
        v91 = NSLocalizedDescriptionKey;
        v92 = CFSTR("Invalid HMAC algorithm");
        v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1));
        v17 = 2;
        goto LABEL_27;
      }
    }
    else
    {
      v15 = qword_1000F0090[defaultAlgorithm];
      if (-[NSData length](self->_key, "length") >= v15)
      {
        if (!v11)
          v11 = self->_defaultIncludedHeaders;
        v72 = self;
        v22 = v11;
        v23 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSSet _lowercaseSet](v11, "_lowercaseSet"));

        if (qword_1001754D0 != -1)
          dispatch_once(&qword_1001754D0, &stru_10013F428);
        v71 = v15;
        if (!-[NSSet containsObject:](v23, "containsObject:", qword_1001754D8))
        {
          v24 = objc_claimAutoreleasedReturnValue(-[NSSet setByAddingObject:](v23, "setByAddingObject:", qword_1001754D8));

          v23 = (NSSet *)v24;
        }
        v73 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v23, "allObjects"));
        v75 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sortedArrayUsingSelector:", "compare:"));

        v26 = CFHTTPMessageCopyRequestURL(a3);
        v27 = (__CFString *)CFHTTPMessageCopyRequestMethod(a3);
        v29 = (void *)objc_opt_new(NSMutableArray, v28);
        v74 = v27;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v27, "lowercaseString"));
        LODWORD(v79) = objc_msgSend(v29, "_addHMACComponent:error:", v30, a6);

        v77 = v29;
        if (!(_DWORD)v79)
          goto LABEL_56;
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v26, "path"));
        v79 = v31;
        if (!v31)
          v31 = CFSTR("/");
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v31, "lowercaseString"));
        v33 = objc_msgSend(v29, "_addHMACComponent:error:", v32, a6);

        if (v33)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL query](v26, "query"));
          v35 = v34;
          v36 = v26;
          if (v34
            && objc_msgSend(v34, "length")
            && !objc_msgSend(v77, "_addHMACComponent:error:", v35, a6))
          {
            v20 = 0;
            v11 = v73;
            v49 = v74;
          }
          else
          {
            v68 = v35;
            v69 = v14;
            v70 = v26;
            v82 = 0u;
            v83 = 0u;
            v80 = 0u;
            v81 = 0u;
            v37 = (CFDataRef)v75;
            v79 = (__CFString *)-[__CFData countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
            if (v79)
            {
              v78 = *(uint64_t **)v81;
              v76 = v37;
LABEL_44:
              v38 = 0;
              while (1)
              {
                if (*(uint64_t **)v81 != v78)
                  objc_enumerationMutation(v37);
                v39 = *(const __CFString **)(*((_QWORD *)&v80 + 1) + 8 * v38);
                v40 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(a3, v39);
                v41 = v40;
                if (v40)
                {
                  v42 = v40;
                  v43 = -[__CFString length](v40, "length");
                  v41 = v42;
                  if (v43)
                  {
                    if (!objc_msgSend(v77, "_addHMACComponent:error:", v39, a6))
                    {
                      v20 = 0;
                      v11 = v73;
                      v49 = v74;
                      v41 = v42;
LABEL_59:
                      v35 = v68;
                      v14 = v69;
                      goto LABEL_71;
                    }
                    v44 = objc_msgSend(v77, "_addHMACComponent:error:", v42, a6);
                    v41 = v42;
                    v37 = v76;
                    if (!v44)
                    {
                      v20 = 0;
                      v11 = v73;
                      v49 = v74;
                      goto LABEL_59;
                    }
                  }
                }

                if (v79 == (__CFString *)++v38)
                {
                  v79 = (__CFString *)-[__CFData countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
                  if (v79)
                    goto LABEL_44;
                  break;
                }
              }
            }

            v45 = CFHTTPMessageCopyBody(a3);
            v46 = v45;
            if (v45 && -[__CFData length](v45, "length"))
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedStringWithOptions:](v46, "base64EncodedStringWithOptions:", 0));
              v48 = v77;
              objc_msgSend(v77, "addObject:", v47);

            }
            else
            {
              v48 = v77;
              objc_msgSend(v77, "addObject:", &stru_100141020);
            }
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "componentsJoinedByString:", CFSTR("|")));
            v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "dataUsingEncoding:", 1));

            v41 = (id)v51;
            v14 = v69;
            v76 = v46;
            if (v51)
            {
              v78 = &v66;
              v53 = v71;
              __chkstk_darwin(v52);
              v54 = v72;
              v56 = v55;
              v67 = -[NSData bytes](v72->_key, "bytes");
              v72 = -[NSData length](v54->_key, "length");
              v79 = v56;
              v57 = objc_retainAutorelease(v56);
              v58 = -[__CFString bytes](v57, "bytes");
              v59 = -[__CFString length](v57, "length");
              CCHmac(defaultAlgorithm, v67, (size_t)v72, v58, (size_t)v59, (char *)&v66 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0));
              v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", (char *)&v66 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0), v53, 0));
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "base64EncodedStringWithOptions:", 0));

              v62 = objc_msgSend(v61, "isEqualToString:", v12);
              v20 = v62;
              if (a6 && (v62 & 1) == 0)
              {
                v84 = NSLocalizedDescriptionKey;
                v85 = CFSTR("HMAC verification failed");
                v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1));
                *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AluminiumAuthenticatorErrorDomain"), 5, v63));

              }
              v41 = v79;
              v11 = v73;
              v49 = v74;
            }
            else
            {
              v49 = v74;
              if (a6)
              {
                v86 = NSLocalizedDescriptionKey;
                v87 = CFSTR("Cannot encode HMAC text");
                v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1));
                *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AluminiumAuthenticatorErrorDomain"), 1, v64));

                v41 = 0;
              }
              v20 = 0;
              v11 = v73;
            }
            v35 = v68;
LABEL_71:

            v36 = v70;
          }

        }
        else
        {
LABEL_56:
          v20 = 0;
          v36 = v26;
          v11 = v73;
          v49 = v74;
        }

        v16 = v75;
        goto LABEL_74;
      }
      if (a6)
      {
        v89 = NSLocalizedDescriptionKey;
        v90 = CFSTR("Key size too short");
        v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
        v17 = 6;
LABEL_27:
        v20 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AluminiumAuthenticatorErrorDomain"), v17, v16));
LABEL_74:

        goto LABEL_20;
      }
    }
  }
  else if (a6)
  {
    v93 = NSLocalizedDescriptionKey;
    v94 = CFSTR("Invalid timestamp value in HTTP request");
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
    v17 = 4;
    goto LABEL_27;
  }
  v20 = 0;
LABEL_20:

LABEL_22:
  return v20;
}

- (NSSet)defaultIncludedHeaders
{
  return self->_defaultIncludedHeaders;
}

- (void)setDefaultIncludedHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)defaultAlgorithm
{
  return self->_defaultAlgorithm;
}

- (void)setDefaultAlgorithm:(unsigned int)a3
{
  self->_defaultAlgorithm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultIncludedHeaders, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
