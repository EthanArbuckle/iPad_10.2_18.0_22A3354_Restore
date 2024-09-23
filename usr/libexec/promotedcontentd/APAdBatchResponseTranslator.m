@implementation APAdBatchResponseTranslator

- (id)translate:(id *)a3
{
  id *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  APAdBatchResponseTranslator *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v29;
  unsigned int v30;
  void *v31;
  unsigned int v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  unsigned int v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  APAdBatchResponseTranslator *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *i;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  APAdDataResponseTranslator *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  APAdDataResponseTranslator *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id obj;
  id *v99;
  id *v100;
  void *v101;
  void *v102;
  APAdBatchResponseTranslator *v103;
  uint64_t v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t v110[128];
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  _BYTE v114[10];
  void *v115;

  if (a3)
  {
    v3 = a3;
    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "logAdResponsesAsText"));

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formattedText"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchResponseTranslator fixupFormattedText:](self, "fixupFormattedText:", v8));

        v10 = APLogForCategory(21);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v112 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "APPBAdBatchResponse text:\n%{private}@", buf, 0xCu);
        }

      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v103 = self;
    if (*v3)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v3, "domain"));
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.ap.HTTPError"));

      if (v14)
      {
        v15 = (char *)objc_msgSend(*v3, "code");
        v16 = 4509;
        if ((unint64_t)(v15 - 500) >= 0x64)
          v16 = 0;
        if ((unint64_t)(v15 - 400) >= 0x64)
          v17 = v16;
        else
          v17 = 4508;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](self, "requester"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "requestIdentifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Server returned HTTP error %ld for request %@"), v15, v19));
        *v3 = (id)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", v17, v20));

      }
      v21 = *v3;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](self, "requester"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "requestIdentifier"));
      v24 = self;
      goto LABEL_16;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
    v30 = objc_msgSend(v29, "hasError");

    if (!v30)
    {
LABEL_32:
      if (*v3)
      {
LABEL_39:
        v60 = APLogForCategory(21);
        v61 = objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](self, "requester"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "requestIdentifier"));
          v64 = objc_msgSend(*v3, "code");
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v3, "localizedDescription"));
          *(_DWORD *)buf = 138543874;
          v112 = v63;
          v113 = 2048;
          *(_QWORD *)v114 = v64;
          self = v103;
          *(_WORD *)&v114[8] = 2114;
          v115 = v65;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "Content with ID %{public}@ failed verification with error code %ld: %{public}@", buf, 0x20u);

        }
LABEL_42:
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
        v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "ads"));
        if (v67)
        {
          v68 = (void *)v67;
          v69 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "ads"));
          v71 = objc_msgSend(v70, "count");

          if (v71)
          {
            v102 = v12;
            v100 = v3;
            v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            v106 = 0u;
            v107 = 0u;
            v108 = 0u;
            v109 = 0u;
            v72 = v103;
            v73 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](v103, "response"));
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "ads"));

            obj = v74;
            v105 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
            if (v105)
            {
              v104 = *(_QWORD *)v107;
              v75 = 1;
              do
              {
                for (i = 0; i != v105; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v107 != v104)
                    objc_enumerationMutation(obj);
                  v77 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)i);
                  v78 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](v72, "requester"));
                  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "adOriginalRequesterId"));
                  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "requestFromRequestID:", v79));

                  if (v80)
                  {
                    v81 = [APAdDataResponseTranslator alloc];
                    v82 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](v72, "requester"));
                    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "identifier"));
                    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "UUIDString"));
                    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "context"));
                    v86 = -[APAdDataResponseTranslator initWithResponse:forRequester:contentIdentifier:withContext:placement:](v81, "initWithResponse:forRequester:contentIdentifier:withContext:placement:", v77, v82, v84, v85, objc_msgSend(v80, "placementType"));

                    v87 = (void *)objc_claimAutoreleasedReturnValue(-[APAdDataResponseTranslator translate:](v86, "translate:", v100));
                    if (objc_msgSend(v80, "placementType") == (id)7)
                      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
                    else
                      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "identifier"));
                    v89 = v88;
                    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "UUIDString"));
                    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "content"));
                    objc_msgSend(v91, "setIdentifier:", v90);

                    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "content"));
                    objc_msgSend(v92, "setReceivedReferenceTime:", v101);

                    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "privateContent"));
                    objc_msgSend(v93, "setSequenceNumber:", v75);

                    v72 = v103;
                    v94 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](v103, "response"));
                    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "batchId"));
                    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "privateContent"));
                    objc_msgSend(v96, "setBatchResponseID:", v95);

                    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "adOriginalRequesterId"));
                    objc_msgSend(v87, "setAdOriginalRequesterId:", v97);

                    objc_msgSend(v102, "addObject:", v87);
                    v75 = (v75 + 1);

                  }
                }
                v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
              }
              while (v105);
            }

            v25 = v102;
            v26 = v25;
            goto LABEL_21;
          }
        }
        else
        {

        }
        v21 = *v3;
        if (!*v3)
          goto LABEL_17;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](v103, "requester"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "requestIdentifier"));
        v24 = v103;
LABEL_16:
        -[APAdBatchResponseTranslator _addContentDataWithErrorForError:identifier:toResults:journeyStartRelayValues:](v24, "_addContentDataWithErrorForError:identifier:toResults:journeyStartRelayValues:", v21, v23, v12, 0);

LABEL_17:
        v25 = v12;
        v26 = v25;
        goto LABEL_21;
      }
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
      v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "ads"));
      if (v52)
      {
        v53 = (void *)v52;
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "ads"));
        v56 = objc_msgSend(v55, "count");

        self = v103;
        if (v56)
          goto LABEL_38;
      }
      else
      {

      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](self, "requester"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "requestIdentifier"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AdBatchResponse contained no ads for request %@"), v58));
      *v3 = (id)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", 4504, v59));

      self = v103;
LABEL_38:
      if (!*v3)
        goto LABEL_42;
      goto LABEL_39;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
    v32 = objc_msgSend(v31, "error");

    if (v32 == 1)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
      v39 = objc_msgSend(v33, "errorDetails");
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](self, "requester"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "requestIdentifier"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Server returned No_Qualified error %u for request %@"), v39, v36));
      v38 = 4510;
    }
    else
    {
      if (v32 != 2)
      {
        v99 = v3;
        v40 = APLogForCategory(21);
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](self, "requester"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "requestIdentifier"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
          v45 = objc_msgSend(v44, "error");
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](v103, "response"));
          v47 = objc_msgSend(v46, "errorDetails");
          *(_DWORD *)buf = 138543874;
          v112 = v43;
          v113 = 1024;
          *(_DWORD *)v114 = v45;
          *(_WORD *)&v114[4] = 1024;
          *(_DWORD *)&v114[6] = v47;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Serving returned AdBatchRequest for content %{public}@ with unknown error %u and error details %u", buf, 0x18u);

          self = v103;
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
        v48 = objc_msgSend(v33, "error");
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
        v49 = objc_msgSend(v35, "errorDetails");
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](self, "requester"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "requestIdentifier"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Server returned unrecognized error %u with details %u for request %@"), v48, v49, v37));
        v3 = v99;
        *v99 = (id)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", 4510, v50));

        goto LABEL_31;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
      v34 = objc_msgSend(v33, "errorDetails");
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](self, "requester"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "requestIdentifier"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Server returned configuration error %u for request %@"), v34, v36));
      v38 = 4505;
    }
    *v3 = (id)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", v38, v37));
LABEL_31:

    self = v103;
    goto LABEL_32;
  }
  v27 = APLogForCategory(21);
  v25 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error is nil.", buf, 2u);
  }
  v26 = &__NSArray0__struct;
LABEL_21:

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalReps, 0);
}

+ (Class)translatesClass
{
  return (Class)objc_opt_class(APPBAdBatchResponse, a2);
}

- (id)contentDataWithError:(id)a3 identifier:(id)a4 journeyStartRelayValues:(id)a5
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  char *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  APContentDataInternal *v18;
  void *v19;
  void *v20;
  APContentDataInternal *v21;
  int v23;
  id v24;

  v6 = a3;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.ap.AdValidationErrorDomain"));

  if (v9)
  {
    v10 = (char *)objc_msgSend(v6, "code");
    if ((unint64_t)(v10 - 4505) >= 5)
      v11 = 1021;
    else
      v11 = qword_1001B8398[(_QWORD)(v10 - 4505)];
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.ap.DaemonDiscardedErrorDomain"));

    if (v13)
    {
      if (objc_msgSend(v6, "code") == (id)2600)
      {
        v11 = 1020;
      }
      else
      {
        v16 = APLogForCategory(21);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v23 = 134217984;
          v24 = objc_msgSend(v6, "code");
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%ld is not a valid discard reason.", (uint8_t *)&v23, 0xCu);
        }

        v11 = 0;
      }
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v15 = objc_msgSend(v14, "isEqualToString:", NSURLErrorDomain);

      if (v15)
        v11 = 1010;
      else
        v11 = 0;
    }
  }
  v18 = [APContentDataInternal alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
  v21 = -[APContentDataInternal initWithUnfilledReason:error:contentIdentifier:contextIdentifier:containerSize:placementType:journeyStartRelayValues:](v18, "initWithUnfilledReason:error:contentIdentifier:contextIdentifier:containerSize:placementType:journeyStartRelayValues:", v11, v6, v20, 0, -1, v7, 0.0, 0.0);

  return v21;
}

- (void)_addContentDataWithErrorForError:(id)a3 identifier:(id)a4 toResults:(id)a5 journeyStartRelayValues:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;

  v10 = a3;
  if (v10)
  {
    v11 = a5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APAdBatchResponseTranslator contentDataWithError:identifier:journeyStartRelayValues:](self, "contentDataWithError:identifier:journeyStartRelayValues:", v10, a4, a6));
    objc_msgSend(v11, "addObject:", v12);

    v13 = APLogForCategory(21);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "content"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      v17 = 138543618;
      v18 = v16;
      v19 = 2114;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Content %{public}@ is being returned with an error: %{public}@", (uint8_t *)&v17, 0x16u);

    }
  }

}

- (id)fixupFormattedText:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  id v81;
  _BYTE v82[128];

  v3 = a3;
  v81 = 0;
  v4 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", CFSTR("unfilledReasonCode:\\ \"(\\w+)\\\"), 0, &v81);
  v5 = v81;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
  v7 = v6;
  if (v6)
    v8 = v5 == 0;
  else
    v8 = 0;
  if (v8 && (unint64_t)objc_msgSend(v6, "numberOfRanges") >= 2)
  {
    v9 = objc_msgSend(v7, "rangeAtIndex:", 1);
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v9, v10));
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("InventoryUnavailable")) & 1) != 0)
    {
      v12 = 201;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("GlobalExclusion")) & 1) != 0)
    {
      v12 = 202;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PolicyExclusion")) & 1) != 0)
    {
      v12 = 203;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LimitExceeded")) & 1) != 0)
    {
      v12 = 204;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("AdsDisabledInIssue")))
    {
      v12 = 205;
    }
    else
    {
      v12 = 201;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12));
    v14 = objc_msgSend(v3, "length");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unfilledReasonCode: %@"), v13));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, v14, v15));

    v3 = (id)v16;
  }
  v80 = v5;
  v17 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", CFSTR("specification\\ \\{.\\s+type:\\ \\\"(\\w+)\\\".\\}"), 8, &v80);
  v18 = v80;

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
  v72 = v19;
  if (v19)
  {
    v20 = v19;
    if (objc_msgSend(v19, "count"))
    {
      if (!v18)
      {
        v71 = v7;
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(_QWORD *)v77 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i);
              if ((unint64_t)objc_msgSend(v26, "numberOfRanges") >= 2)
              {
                v27 = objc_msgSend(v26, "rangeAtIndex:", 1);
                v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v27, v28));
                if ((objc_msgSend(v29, "isEqualToString:", CFSTR("Banner")) & 1) != 0)
                {
                  v30 = 0;
                }
                else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("Interstitial")) & 1) != 0)
                {
                  v30 = 2;
                }
                else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("IABMediumRectangle")) & 1) != 0)
                {
                  v30 = 4;
                }
                else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("Audio")) & 1) != 0)
                {
                  v30 = 5;
                }
                else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("Video")) & 1) != 0)
                {
                  v30 = 8;
                }
                else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("Flexible")) & 1) != 0)
                {
                  v30 = 9;
                }
                else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("Native")) & 1) != 0)
                {
                  v30 = 10;
                }
                else if (objc_msgSend(v29, "isEqualToString:", CFSTR("Sponsorship")))
                {
                  v30 = 11;
                }
                else
                {
                  v30 = 0;
                }

                v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v30));
                v32 = objc_msgSend(v3, "length");
                v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("specification {\n   type: %@\n}"), v31));
                v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, v32, v33));

                v3 = (id)v34;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
          }
          while (v23);
        }

        v18 = 0;
        v7 = v71;
      }
    }
  }
  v75 = v18;
  v35 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", CFSTR("action:\\ \\\"(\\w+)\\\"), 0, &v75);
  v36 = v75;

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
  if (v37 && !v36 && (unint64_t)objc_msgSend(v37, "numberOfRanges") >= 2)
  {
    v38 = objc_msgSend(v37, "rangeAtIndex:", 1);
    v40 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v38, v39));
    if ((objc_msgSend(v40, "isEqualToString:", CFSTR("None")) & 1) != 0)
    {
      v41 = 0;
    }
    else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("Web")) & 1) != 0)
    {
      v41 = 1;
    }
    else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("Storyboard")) & 1) != 0)
    {
      v41 = 2;
    }
    else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("iTunesStore")) & 1) != 0)
    {
      v41 = 8;
    }
    else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("WebView")) & 1) != 0)
    {
      v41 = 10;
    }
    else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("App")) & 1) != 0)
    {
      v41 = 11;
    }
    else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("MRAID")) & 1) != 0)
    {
      v41 = 12;
    }
    else if (objc_msgSend(v40, "isEqualToString:", CFSTR("WebVideo")))
    {
      v41 = 13;
    }
    else
    {
      v41 = 0;
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v41));
    v43 = objc_msgSend(v3, "length");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("action: %@"), v42));
    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, v43, v44));

    v3 = (id)v45;
  }
  v74 = v36;
  v46 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", CFSTR("transitionType:\\ \\\"(\\w+)\\\"), 0, &v74);
  v47 = v74;

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
  if (v48 && !v47 && (unint64_t)objc_msgSend(v48, "numberOfRanges") >= 2)
  {
    v49 = 1;
    v50 = objc_msgSend(v48, "rangeAtIndex:", 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v50, v51));
    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("Slide")) & 1) == 0)
    {
      if (objc_msgSend(v52, "isEqualToString:", CFSTR("Fade")))
        v49 = 2;
      else
        v49 = 1;
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v49));
    v54 = objc_msgSend(v3, "length");
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("transitionType: %@"), v53));
    v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, v54, v55));

    v3 = (id)v56;
  }
  v73 = v47;
  v57 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", CFSTR("adPrivacyMarkPosition:\\ \\\"(\\w+)\\\"), 0, &v73);
  v58 = v73;

  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
  if (v59)
  {
    v60 = v72;
    if (!v58 && (unint64_t)objc_msgSend(v59, "numberOfRanges") >= 2)
    {
      v61 = objc_msgSend(v59, "rangeAtIndex:", 1);
      v63 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v61, v62));
      if ((objc_msgSend(v63, "isEqualToString:", CFSTR("BottomRight")) & 1) != 0)
      {
        v64 = 0;
      }
      else if ((objc_msgSend(v63, "isEqualToString:", CFSTR("TopRight")) & 1) != 0)
      {
        v64 = 1;
      }
      else if ((objc_msgSend(v63, "isEqualToString:", CFSTR("TopLeft")) & 1) != 0)
      {
        v64 = 2;
      }
      else if ((objc_msgSend(v63, "isEqualToString:", CFSTR("BottomLeft")) & 1) != 0)
      {
        v64 = 3;
      }
      else if (objc_msgSend(v63, "isEqualToString:", CFSTR("NoAdPrivacyMark")))
      {
        v64 = 4;
      }
      else
      {
        v64 = 0;
      }

      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v64));
      v66 = objc_msgSend(v3, "length");
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("adPrivacyMarkPosition: %@"), v65));
      v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, v66, v67));

      v3 = (id)v68;
    }
  }
  else
  {
    v60 = v72;
  }
  v69 = v3;

  return v69;
}

- (NSMutableSet)internalReps
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInternalReps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
