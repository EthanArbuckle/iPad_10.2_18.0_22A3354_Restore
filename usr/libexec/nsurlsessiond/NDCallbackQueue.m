@implementation NDCallbackQueue

- (void)performAllCallbacks
{
  NSMutableArray *v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_callbacks;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[NDCallbackQueue performCallback:](self, "performCallback:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)performCallback:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  char isKindOfClass;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  _QWORD v100[4];
  id v101;
  id v102;
  NDCallbackQueue *v103;
  id v104;
  id v105;
  _QWORD v106[4];
  id v107;
  id v108;
  NDCallbackQueue *v109;
  id v110;
  id v111;
  _QWORD v112[4];
  id v113;
  id v114;
  NDCallbackQueue *v115;
  id v116;
  id v117;
  _QWORD v118[4];
  id v119;
  id v120;
  NDCallbackQueue *v121;
  id v122;
  id v123;
  _QWORD v124[5];
  id v125;
  _QWORD v126[4];
  id v127;
  NDCallbackQueue *v128;
  id v129;
  id v130;
  _QWORD v131[5];
  id v132;
  _QWORD v133[4];
  id v134;
  NDCallbackQueue *v135;
  id v136;
  id v137;
  _QWORD v138[4];
  id v139;
  NDCallbackQueue *v140;
  id v141;
  _QWORD v142[4];
  id v143;
  NDCallbackQueue *v144;
  _QWORD v145[4];
  id v146;
  id v147;
  NDCallbackQueue *v148;
  id v149;
  id v150;
  _QWORD v151[4];
  id v152;
  id v153;
  id v154;
  NDCallbackQueue *v155;
  id v156;
  id v157;
  _QWORD v158[5];
  id v159;
  _QWORD v160[5];
  id v161;
  _QWORD v162[4];
  id v163;
  id v164;
  NDCallbackQueue *v165;
  id v166;
  id v167;
  _QWORD v168[4];
  id v169;
  NDCallbackQueue *v170;
  id v171;
  _QWORD v172[4];
  id v173;
  NDCallbackQueue *v174;
  id v175;
  id v176;
  _QWORD v177[4];
  id v178;
  NDCallbackQueue *v179;
  id v180;
  id v181;
  _QWORD v182[5];
  uint8_t buf[4];
  id v184;
  __int16 v185;
  id v186;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getClientProxy"));
  v6 = objc_msgSend(v4, "taskIdentifier");
  switch(objc_msgSend(v4, "type"))
  {
    case 0u:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
      v9 = objc_opt_class(NSNull);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectAtIndexedSubscript:", 0));

      }
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectAtIndexedSubscript:", 1));
      v70 = objc_opt_class(NSNull);
      if ((objc_opt_isKindOfClass(v69, v70) & 1) != 0)
      {
        v71 = 0;
      }
      else
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectAtIndexedSubscript:", 1));

      }
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectAtIndexedSubscript:", 2));

      v182[0] = _NSConcreteStackBlock;
      v182[1] = 3221225472;
      v182[2] = sub_100066200;
      v182[3] = &unk_1000B21E8;
      v182[4] = self;
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "remoteObjectProxyWithErrorHandler:", v182));
      v177[0] = _NSConcreteStackBlock;
      v177[1] = 3221225472;
      v177[2] = sub_10001AB6C;
      v177[3] = &unk_1000B2468;
      v181 = v6;
      v178 = WeakRetained;
      v179 = self;
      v180 = v4;
      objc_msgSend(v80, "backgroundTask:didCompleteWithError:taskMetrics:info:reply:", v6, v10, v71, v79, v177);

      goto LABEL_53;
    case 1u:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      if (objc_msgSend(v11, "count"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));

      }
      else
      {
        v13 = 0;
      }

      v81 = objc_opt_class(__NSCFURLSessionTaskInfo);
      isKindOfClass = objc_opt_isKindOfClass(v13, v81);
      v83 = v13;
      v84 = v83;
      v10 = v83;
      if ((isKindOfClass & 1) != 0)
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "pathToDownloadTaskFile"));
        if (v85
          || (v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "additionalProperties")),
              v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("pathToDownloadTaskFile"))),
              v86,
              v85))
        {
          v10 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v85, 0));

        }
        else
        {
          v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "downloadFileURL"));
        }

      }
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectAtIndexedSubscript:", 1));

      v89 = objc_opt_class(NSNull);
      if ((objc_opt_isKindOfClass(v88, v89) & 1) != 0)
        v90 = 0;
      else
        v90 = v88;
      v172[0] = _NSConcreteStackBlock;
      v172[1] = 3221225472;
      v172[2] = sub_100066264;
      v172[3] = &unk_1000B2468;
      v176 = v6;
      v173 = WeakRetained;
      v174 = self;
      v175 = v4;
      objc_msgSend(v99, "backgroundDownloadTask:didFinishDownloadingToURL:response:reply:", v6, v10, v90, v172);

      goto LABEL_53;
    case 2u:
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 1));

      v17 = (id)qword_1000C7158;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForTaskWithIdentifier:", v6));
        *(_DWORD *)buf = 138543618;
        v184 = v18;
        v185 = 2112;
        v186 = v10;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ performing auth challenge callback, challenge %@", buf, 0x16u);

      }
      v168[0] = _NSConcreteStackBlock;
      v168[1] = 3221225472;
      v168[2] = sub_10006634C;
      v168[3] = &unk_1000B2210;
      v19 = v4;
      v169 = v19;
      v170 = self;
      v20 = v16;
      v171 = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "remoteObjectProxyWithErrorHandler:", v168));
      v162[0] = _NSConcreteStackBlock;
      v162[1] = 3221225472;
      v162[2] = sub_1000663D4;
      v162[3] = &unk_1000B2238;
      v163 = v19;
      v164 = WeakRetained;
      v167 = v6;
      v22 = v20;
      v166 = v22;
      v165 = self;
      objc_msgSend(v21, "backgroundTask:didReceiveChallenge:reply:", v6, v10, v162);

      goto LABEL_53;
    case 3u:
      v23 = (id)qword_1000C7158;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForTaskWithIdentifier:", v6));
        *(_DWORD *)buf = 138543362;
        v184 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ performing did start app wake callback.", buf, 0xCu);

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));

      v160[0] = _NSConcreteStackBlock;
      v160[1] = 3221225472;
      v160[2] = sub_100066640;
      v160[3] = &unk_1000B23F0;
      v160[4] = self;
      v161 = v4;
      objc_msgSend(v99, "backgroundSessionDidStartAppWake:reply:", v10, v160);

      goto LABEL_53;
    case 4u:
      v26 = (id)qword_1000C7158;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForTaskWithIdentifier:", v6));
        *(_DWORD *)buf = 138543362;
        v184 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ performing did finish app wake callback.", buf, 0xCu);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", 0));

      v158[0] = _NSConcreteStackBlock;
      v158[1] = 3221225472;
      v158[2] = sub_10006664C;
      v158[3] = &unk_1000B23F0;
      v158[4] = self;
      v159 = v4;
      objc_msgSend(v99, "backgroundSessionDidFinishAppWake:reply:", v10, v158);

      goto LABEL_53;
    case 5u:
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", 0));

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", 1));

      v31 = (id)qword_1000C7158;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForTaskWithIdentifier:", v6, v95));
        *(_DWORD *)buf = 138543618;
        v184 = v32;
        v185 = 2112;
        v186 = v96;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ performing will send request callback, request %@", buf, 0x16u);

      }
      v151[0] = _NSConcreteStackBlock;
      v151[1] = 3221225472;
      v151[2] = sub_100066658;
      v151[3] = &unk_1000B2260;
      v33 = v4;
      v152 = v33;
      v34 = WeakRetained;
      v153 = v34;
      v157 = v6;
      v35 = v95;
      v156 = v35;
      v10 = v96;
      v154 = v10;
      v155 = self;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "remoteObjectProxyWithErrorHandler:", v151));
      v145[0] = _NSConcreteStackBlock;
      v145[1] = 3221225472;
      v145[2] = sub_100066774;
      v145[3] = &unk_1000B2288;
      v146 = v33;
      v147 = v34;
      v150 = v6;
      v37 = v35;
      v149 = v37;
      v148 = self;
      objc_msgSend(v36, "backgroundTask:_willSendRequestForEstablishedConnection:reply:", v6, v10, v145);

      goto LABEL_53;
    case 6u:
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectAtIndexedSubscript:", 0));

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", 1));
      v41 = objc_msgSend(v40, "intValue");

      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", 2));

      v44 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v184 = v10;
        v185 = 1024;
        LODWORD(v186) = (_DWORD)v41;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Performing open file at path callback for path %@ mode %d", buf, 0x12u);
      }
      v142[0] = _NSConcreteStackBlock;
      v142[1] = 3221225472;
      v142[2] = sub_1000668D4;
      v142[3] = &unk_1000B22B0;
      v45 = v4;
      v143 = v45;
      v144 = self;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "remoteObjectProxyWithErrorHandler:", v142));
      v138[0] = _NSConcreteStackBlock;
      v138[1] = 3221225472;
      v138[2] = sub_100066944;
      v138[3] = &unk_1000B22D8;
      v139 = v45;
      v47 = v43;
      v141 = v47;
      v140 = self;
      objc_msgSend(v46, "openFileAtPath:mode:withReply:", v10, v41, v138);

      goto LABEL_53;
    case 8u:
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      if (objc_msgSend(v48, "count"))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndexedSubscript:", 0));

      }
      else
      {
        v10 = 0;
      }

      v133[0] = _NSConcreteStackBlock;
      v133[1] = 3221225472;
      v133[2] = sub_100066A40;
      v133[3] = &unk_1000B2300;
      v137 = v6;
      v134 = WeakRetained;
      v135 = self;
      v91 = v4;
      v136 = v91;
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "remoteObjectProxyWithErrorHandler:", v133));
      v131[0] = _NSConcreteStackBlock;
      v131[1] = 3221225472;
      v131[2] = sub_100066B40;
      v131[3] = &unk_1000B23F0;
      v131[4] = self;
      v132 = v91;
      objc_msgSend(v92, "backgroundAVAssetDownloadTask:didResolveMediaSelectionProperyList:reply:", v6, v10, v131);

      goto LABEL_53;
    case 9u:
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", 0));

      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectAtIndexedSubscript:", 1));

      v60 = (id)qword_1000C7158;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForTaskWithIdentifier:", v6));
        *(_DWORD *)buf = 138543362;
        v184 = v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}@ performing begin delayed request callback", buf, 0xCu);

      }
      v118[0] = _NSConcreteStackBlock;
      v118[1] = 3221225472;
      v118[2] = sub_100066C58;
      v118[3] = &unk_1000B2328;
      v62 = v4;
      v119 = v62;
      v63 = WeakRetained;
      v120 = v63;
      v123 = v6;
      v64 = v98;
      v121 = self;
      v122 = v64;
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "remoteObjectProxyWithErrorHandler:", v118));
      v112[0] = _NSConcreteStackBlock;
      v112[1] = 3221225472;
      v112[2] = sub_100066D74;
      v112[3] = &unk_1000B2350;
      v113 = v62;
      v114 = v63;
      v117 = v6;
      v66 = v64;
      v115 = self;
      v116 = v66;
      objc_msgSend(v65, "backgroundTask:willBeginDelayedRequest:reply:", v6, v10, v112);

      goto LABEL_53;
    case 0xAu:
      v50 = (id)qword_1000C7158;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForTaskWithIdentifier:", v6));
        *(_DWORD *)buf = 138543362;
        v184 = v51;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ performing get auth headers for response callback.", buf, 0xCu);

      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectAtIndexedSubscript:", 0));

      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      v54 = (unint64_t)objc_msgSend(v53, "count") > 1;

      if (v54)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectAtIndexedSubscript:", 1));

      }
      else
      {
        v10 = 0;
      }
      v106[0] = _NSConcreteStackBlock;
      v106[1] = 3221225472;
      v106[2] = sub_100066EBC;
      v106[3] = &unk_1000B2328;
      v72 = v4;
      v107 = v72;
      v73 = WeakRetained;
      v108 = v73;
      v111 = v6;
      v74 = v97;
      v109 = self;
      v110 = v74;
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "remoteObjectProxyWithErrorHandler:", v106));
      v100[0] = _NSConcreteStackBlock;
      v100[1] = 3221225472;
      v100[2] = sub_100066FFC;
      v100[3] = &unk_1000B2378;
      v101 = v72;
      v102 = v73;
      v105 = v6;
      v76 = v74;
      v103 = self;
      v104 = v76;
      objc_msgSend(v75, "backgroundTask:getAuthHeadersForResponse:reply:", v6, v10, v100);

      goto LABEL_53;
    case 0xBu:
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
      if (objc_msgSend(v56, "count"))
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", 0));

      }
      else
      {
        v10 = 0;
      }

      v126[0] = _NSConcreteStackBlock;
      v126[1] = 3221225472;
      v126[2] = sub_100066B4C;
      v126[3] = &unk_1000B2300;
      v130 = v6;
      v127 = WeakRetained;
      v128 = self;
      v93 = v4;
      v129 = v93;
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "remoteObjectProxyWithErrorHandler:", v126));
      v124[0] = _NSConcreteStackBlock;
      v124[1] = 3221225472;
      v124[2] = sub_100066C4C;
      v124[3] = &unk_1000B23F0;
      v124[4] = self;
      v125 = v93;
      objc_msgSend(v94, "backgroundAVAssetDownloadTask:willDownloadVariants:reply:", v6, v10, v124);

LABEL_53:
      break;
    default:
      break;
  }

}

- (NDCallbackQueue)initWithDelegate:(id)a3
{
  id v4;
  NDCallbackQueue *v5;
  NDCallbackQueue *v6;
  uint64_t v7;
  NSMutableArray *callbacks;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NDCallbackQueue;
  v5 = -[NDCallbackQueue init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[NDCallbackQueue setDelegate:](v5, "setDelegate:", v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    callbacks = v6->_callbacks;
    v6->_callbacks = (NSMutableArray *)v7;

  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)drainCallbacksForTaskIdentifier:(unint64_t)a3
{
  void *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_callbacks;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "taskIdentifier") == (id)a3)
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j);
        -[NDCallbackQueue drainCallback:](self, "drainCallback:", v15, (_QWORD)v16);
        -[NSMutableArray removeObject:](self->_callbacks, "removeObject:", v15);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_callbacks, "count");
}

- (void)addPendingCallback:(id)a3 wakeRequirement:(int64_t)a4
{
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[NSMutableArray addObject:](self->_callbacks, "addObject:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getClientProxy"));

  if (v7)
  {
    -[NDCallbackQueue performCallback:](self, "performCallback:", v8);
  }
  else if (a4)
  {
    objc_msgSend(WeakRetained, "wakeUpClient:", a4);
  }

}

- (void)drainCallback:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;

  v4 = a3;
  if ((objc_msgSend(v4, "hasBeenCalled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    switch(objc_msgSend(v4, "type"))
    {
      case 2u:
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
        v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));

        v8 = (id)qword_1000C7158;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForTaskWithIdentifier:", objc_msgSend(v4, "taskIdentifier")));
          v21 = 138543362;
          v22 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ draining authentication challenge callback", (uint8_t *)&v21, 0xCu);

        }
        goto LABEL_5;
      case 5u:
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
        v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));

        v11 = (id)qword_1000C7158;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForTaskWithIdentifier:", objc_msgSend(v4, "taskIdentifier")));
          v21 = 138543362;
          v22 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ draining willSendRequest callback", (uint8_t *)&v21, 0xCu);

        }
        v7[2](v7, 0, 0);
        goto LABEL_18;
      case 6u:
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
        v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 2));

        v14 = (id)qword_1000C7158;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForTaskWithIdentifier:", objc_msgSend(v4, "taskIdentifier")));
          v21 = 138543362;
          v22 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ draining openFileAtPath callback", (uint8_t *)&v21, 0xCu);

        }
        ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), _QWORD))v7[2])(v7, 0);
        goto LABEL_18;
      case 9u:
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
        v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 1));

        v8 = (id)qword_1000C7158;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForTaskWithIdentifier:", objc_msgSend(v4, "taskIdentifier")));
          v21 = 138543362;
          v22 = v17;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ draining willBeginDelayedRequest callback", (uint8_t *)&v21, 0xCu);

        }
LABEL_5:

        v7[2](v7, 2, 0);
        goto LABEL_18;
      case 0xAu:
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "args"));
        v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", 0));

        v19 = (id)qword_1000C7158;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "descriptionForTaskWithIdentifier:", objc_msgSend(v4, "taskIdentifier")));
          v21 = 138543362;
          v22 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ draining getAuthHeadersForResponse callback", (uint8_t *)&v21, 0xCu);

        }
        ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), _QWORD, _QWORD, _QWORD))v7[2])(v7, 0, 0, 0);
LABEL_18:

        break;
      default:
        break;
    }
    objc_msgSend(v4, "setHasBeenCalled:", 1);

  }
}

- (void)addPendingCallbackToFront:(id)a3
{
  -[NSMutableArray insertObject:atIndex:](self->_callbacks, "insertObject:atIndex:", a3, 0);
}

- (NDCallbackQueueDelegate)delegate
{
  return (NDCallbackQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbacks, 0);
}

@end
