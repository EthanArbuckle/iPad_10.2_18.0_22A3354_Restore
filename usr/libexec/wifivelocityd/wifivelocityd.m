void sub_100003BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003BC8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003BD8(uint64_t a1)
{

}

void sub_100003BE0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  _QWORD block[4];
  id v22;
  uint64_t v23;
  id v24;
  int v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  v5 = a2;
  v6 = a3;
  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 136315650;
    v26 = "-[W5DiagnosticsModeManager _startDiagnosticsModeWithConfiguration:currentPeer:reply:]_block_invoke";
    v27 = 2114;
    v28 = v6;
    v29 = 2114;
    v30 = v5;
    v20 = 32;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s: [DM] start DM finished errors='%{public}@' mode='%{public}@'", &v25, v20);
  }

  v9 = *(_QWORD *)(a1 + 56);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);

  global_queue = dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003DE0;
  block[3] = &unk_1000D4FD0;
  v13 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v22 = v13;
  v23 = v14;
  v24 = v5;
  v15 = v5;
  dispatch_async(v12, block);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "processors"));
  objc_msgSend(v16, "removeObject:", *(_QWORD *)(a1 + 48));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"));
  objc_msgSend(v17, "osTransactionComplete:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = 0;

}

void sub_100003DE0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(*(id *)(a1 + 32), "role") != (id)8)
    objc_msgSend(*(id *)(a1 + 40), "_finishedProcessingDiagnosticMode:", *(_QWORD *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_10000413C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFString **v24;
  NSErrorUserInfoKey *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSErrorUserInfoKey v37;
  const __CFString *v38;
  NSErrorUserInfoKey v39;
  const __CFString *v40;
  int v41;
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v16 = sub_10008F56C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 56);
      v19 = *(void **)(a1 + 32);
      v41 = 136315650;
      v42 = "-[W5DiagnosticsModeManager stopDiagnosticsModeWithUUID:info:reply:]_block_invoke";
      v43 = 2112;
      v44 = v18;
      v45 = 2114;
      v46 = v19;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s: [DM] DM was not running on peer (%@) with uuid='%{public}@'", &v41, 32);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUIDString"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "uuid"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Diagnostic mode is running on this device, but the UUID provided (%@) doesn't match (%@)."), v20, v22));

    v23 = *(_QWORD *)(a1 + 64);
    v37 = NSLocalizedFailureReasonErrorKey;
    v38 = CFSTR("W5InternalErr");
    v24 = &v38;
    v25 = &v37;
    goto LABEL_11;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (!v8)
  {
    v26 = sub_10008F56C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(_QWORD *)(a1 + 32);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
      v41 = 136315650;
      v42 = "-[W5DiagnosticsModeManager stopDiagnosticsModeWithUUID:info:reply:]_block_invoke";
      v43 = 2114;
      v44 = v28;
      v45 = 2114;
      v46 = v29;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] %s: [DM] non-matching expected='%{public}@' found='%{public}@'", &v41, 32);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUIDString"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "UUIDString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Diagnostic mode is running on this device, but the UUID provided (%@) doesn't match (%@)."), v30, v32));

    v23 = *(_QWORD *)(a1 + 64);
    v39 = NSLocalizedFailureReasonErrorKey;
    v40 = CFSTR("W5InternalErr");
    v24 = &v40;
    v25 = &v39;
LABEL_11:
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v25, 1));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 9, v33));
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v34);

    goto LABEL_14;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localPeer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peerID"));
  v12 = sub_100089160(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = objc_alloc((Class)W5DiagnosticsModePeer);
  if (v13)
    v15 = (uint64_t)objc_msgSend(v13, "role");
  else
    v15 = 8;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localPeer"));
  v36 = objc_msgSend(v14, "initWithRole:peer:", v15, v35);

  objc_msgSend(*(id *)(a1 + 40), "_stopDiagnosticsMode:currentPeer:info:reply:", v5, v36, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
LABEL_14:

}

void sub_100004814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004834(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  id v25;

  v5 = a2;
  v6 = a3;
  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315394;
    v23 = "-[W5DiagnosticsModeManager _stopDiagnosticsMode:currentPeer:info:reply:]_block_invoke";
    v24 = 2114;
    v25 = v6;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s: [DM] stop DM finished errors='%{public}@'", &v22, 22);
  }

  v9 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v9 + 16))(*(_QWORD *)(a1 + 56), 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A40;
  block[3] = &unk_1000D4FD0;
  v19 = *(id *)(a1 + 32);
  v20 = v5;
  v21 = *(_QWORD *)(a1 + 40);
  v13 = v5;
  dispatch_async(v12, block);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "processors"));
  objc_msgSend(v14, "removeObject:", *(_QWORD *)(a1 + 48));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"));
  objc_msgSend(v15, "osTransactionComplete:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = 0;

}

void sub_100004A40(id *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(a1[4], "role") != (id)8
    || objc_msgSend(a1[4], "role") == (id)8 && objc_msgSend(a1[5], "state") == (id)5)
  {
    objc_msgSend(a1[6], "_finishedProcessingDiagnosticMode:", a1[5]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100004B98(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a2;
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "diagnosticsMode"));
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

uint64_t sub_1000054CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000057A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000057C8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD block[5];
  id v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315394;
    v21 = "-[W5DiagnosticsModeManager _updateDiagnosticsMode:incomingMode:currentPeer:reply:]_block_invoke";
    v22 = 2114;
    v23 = v6;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s: [DM] update DM finished errors='%{public}@'", &v20, 22);
  }

  v9 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v9 + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000059C0;
  block[3] = &unk_1000D5098;
  block[4] = *(_QWORD *)(a1 + 32);
  v19 = v5;
  v13 = v5;
  dispatch_async(v12, block);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "processors"));
  objc_msgSend(v14, "removeObject:", *(_QWORD *)(a1 + 40));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"));
  objc_msgSend(v15, "osTransactionComplete:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = 0;

}

void sub_1000059C0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "_finishedProcessingDiagnosticMode:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

W5DiagnosticsActionResult *sub_100005A5C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  W5DiagnosticsActionResult *v37;
  W5DiagnosticsActionResult *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  dispatch_semaphore_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  W5PeerDebugConfigurationRequest *v48;
  NSObject *v49;
  W5PeerDebugConfigurationRequest *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  W5WiFiSnifferRequest *v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  dispatch_time_t v74;
  W5DiagnosticsActionResult *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  uint64_t v83;
  NSObject *v84;
  void *v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  id *WeakRetained;
  void *v104;
  void *v105;
  uint64_t v106;
  NSObject *v107;
  void *v108;
  id v109;
  uint64_t v110;
  void *i;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  unsigned __int8 v119;
  void *v120;
  NSObject *v121;
  void *v122;
  uint64_t v123;
  dispatch_semaphore_t v124;
  id v125;
  W5PeerDiscoveryRequest *v126;
  void *v127;
  NSObject *v128;
  W5PeerDiscoveryRequest *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  NSObject *v133;
  void *v134;
  BOOL v135;
  uint64_t v136;
  void *v137;
  void *v138;
  BOOL v139;
  uint64_t v140;
  void *v141;
  void *v142;
  BOOL v143;
  uint64_t v144;
  void *v145;
  void *v146;
  id v147;
  dispatch_semaphore_t v148;
  W5PeerSnifferRequest *v149;
  NSObject *v150;
  W5PeerSnifferRequest *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  NSObject *v155;
  dispatch_time_t v156;
  uint64_t v157;
  NSObject *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  NSObject *v164;
  void *v165;
  void *v166;
  dispatch_time_t v167;
  uint64_t v168;
  NSObject *v169;
  void *v170;
  void *v171;
  W5DiagnosticsActionResult *v172;
  uint64_t v173;
  NSObject *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  W5DiagnosticsActionResult *v184;
  uint64_t v185;
  id v186;
  void *v187;
  id v188;
  dispatch_semaphore_t v189;
  W5PeerSnifferRequest *v190;
  uint64_t v191;
  void *v192;
  NSObject *v193;
  W5PeerSnifferRequest *v194;
  void *v195;
  void *v196;
  uint64_t v197;
  NSObject *v198;
  dispatch_time_t v199;
  uint64_t v200;
  NSObject *v201;
  void *v202;
  void *v203;
  W5DiagnosticsActionResult *v204;
  uint64_t v205;
  NSObject *v206;
  void *v207;
  void *v208;
  W5DiagnosticsActionResult *v209;
  dispatch_time_t v210;
  W5DiagnosticsActionResult *v211;
  uint64_t v213;
  NSObject *v214;
  void *v215;
  void *v216;
  W5DiagnosticsActionResult *v217;
  const char *v218;
  uint64_t v219;
  int v220;
  id v221;
  W5DiagnosticsActionResult *v222;
  id v223;
  _QWORD v225[4];
  NSObject *v226;
  _BYTE *v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  _QWORD v232[4];
  W5DiagnosticsActionResult *v233;
  uint64_t v234;
  id v235;
  id v236;
  _QWORD v237[4];
  NSObject *v238;
  _BYTE *v239;
  _QWORD v240[4];
  NSObject *v241;
  _BYTE *v242;
  _QWORD v243[5];
  _QWORD v244[4];
  id v245;
  NSObject *v246;
  _BYTE *v247;
  uint64_t *v248;
  uint64_t *v249;
  _QWORD v250[4];
  NSObject *v251;
  _BYTE *v252;
  uint64_t v253;
  uint64_t *v254;
  uint64_t v255;
  uint64_t (*v256)(uint64_t, uint64_t);
  void (*v257)(uint64_t);
  id v258;
  uint64_t v259;
  uint64_t *v260;
  uint64_t v261;
  uint64_t (*v262)(uint64_t, uint64_t);
  void (*v263)(uint64_t);
  id v264;
  _BYTE v265[128];
  NSErrorUserInfoKey v266;
  const __CFString *v267;
  NSErrorUserInfoKey v268;
  const __CFString *v269;
  NSErrorUserInfoKey v270;
  const __CFString *v271;
  _QWORD v272[6];
  NSErrorUserInfoKey v273;
  const __CFString *v274;
  NSErrorUserInfoKey v275;
  const __CFString *v276;
  NSErrorUserInfoKey v277;
  const __CFString *v278;
  NSErrorUserInfoKey v279;
  const __CFString *v280;
  NSErrorUserInfoKey v281;
  const __CFString *v282;
  _QWORD v283[2];
  _QWORD v284[2];
  NSErrorUserInfoKey v285;
  const __CFString *v286;
  void *v287;
  _BYTE buf[24];
  __int128 v289;
  id v290;
  __int16 v291;
  uint64_t v292;
  __int16 v293;
  uint64_t v294;
  __int16 v295;
  uint64_t v296;
  _BYTE location[24];
  __int128 v298;
  id v299;
  NSErrorUserInfoKey v300;
  const __CFString *v301;
  NSErrorUserInfoKey v302;
  const __CFString *v303;

  v223 = a3;
  v221 = a4;
  v6 = sub_10008F56C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = sub_100088ED0((unint64_t)a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v289) = 398;
    WORD2(v289) = 2080;
    *(_QWORD *)((char *)&v289 + 6) = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
    HIWORD(v289) = 2048;
    v290 = a2;
    v291 = 2112;
    v292 = (uint64_t)v9;
    v293 = 2112;
    v294 = (uint64_t)v221;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s (%s:%u) %s: [DM] action handler='%ld (%@)' info='%@'", buf, 68);

  }
  v222 = objc_alloc_init(W5DiagnosticsActionResult);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "peer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peerID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localIDSIdentifier"));
  if (v11 == v13)
  {
    v18 = 1;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "peer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "peerID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIDSIdentifier"));
    v18 = objc_msgSend(v15, "isEqual:", v17);

  }
  switch((unint64_t)a2)
  {
    case 0uLL:
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("DiagnosticsMode")));
      if (!v55)
      {
        v157 = sub_10008F56C();
        v158 = objc_claimAutoreleasedReturnValue(v157);
        if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
        {
          v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "peer"));
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v289) = 407;
          WORD2(v289) = 2080;
          *(_QWORD *)((char *)&v289 + 6) = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          HIWORD(v289) = 2114;
          v290 = v159;
          LODWORD(v218) = 48;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v158, 0, "[wifivelocity] %s (%s:%u) %s: no mode specified for sniffer peer='%{public}@'", buf, v218);

        }
        v302 = NSLocalizedFailureReasonErrorKey;
        v303 = CFSTR("W5ParamErr");
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v303, &v302, 1));
        v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v57));
        -[W5DiagnosticsActionResult setError:](v222, "setError:", v160);

        goto LABEL_162;
      }
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "info"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("PrimaryChannel")));

      if (!v57)
      {
        v173 = sub_10008F56C();
        v174 = objc_claimAutoreleasedReturnValue(v173);
        if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
        {
          v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "peer"));
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v289) = 414;
          WORD2(v289) = 2080;
          *(_QWORD *)((char *)&v289 + 6) = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          HIWORD(v289) = 2114;
          v290 = v175;
          LODWORD(v218) = 48;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v174, 0, "[wifivelocity] %s (%s:%u) %s: no channel specified for sniffer peer='%{public}@'", buf, v218);

        }
        v300 = NSLocalizedFailureReasonErrorKey;
        v301 = CFSTR("W5ParamErr");
        v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v301, &v300, 1));
        v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v176));
        -[W5DiagnosticsActionResult setError:](v222, "setError:", v177);

        v57 = 0;
        goto LABEL_162;
      }
      *(_QWORD *)location = 0;
      *(_QWORD *)&location[8] = location;
      *(_QWORD *)&location[16] = 0x3032000000;
      *(_QWORD *)&v298 = sub_100003BC8;
      *((_QWORD *)&v298 + 1) = sub_100003BD8;
      v299 = 0;
      v259 = 0;
      v260 = &v259;
      v261 = 0x3032000000;
      v262 = sub_100003BC8;
      v263 = sub_100003BD8;
      v264 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "uuid"));
      v253 = 0;
      v254 = &v253;
      v255 = 0x3032000000;
      v256 = sub_100003BC8;
      v257 = sub_100003BD8;
      v258 = 0;
      if (v18)
      {
        v58 = objc_alloc_init((Class)NSDateFormatter);
        objc_msgSend(v58, "setDateFormat:", CFSTR("yyyy-MM-dd_HH.mm.ss.SSS"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "stringFromDate:", v59));

        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "peer"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "name"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_ch%li_%@.pcap"), v62, objc_msgSend(v57, "channel"), v60));

        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")));
        v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "URLByAppendingPathComponent:", v63));
        v66 = (void *)v254[5];
        v254[5] = v65;

        v67 = objc_alloc_init(W5WiFiSnifferRequest);
        -[W5WiFiSnifferRequest setUuid:](v67, "setUuid:", v260[5]);
        -[W5WiFiSnifferRequest setChannel:](v67, "setChannel:", v57);
        -[W5WiFiSnifferRequest setDuration:](v67, "setDuration:", 86400.0);
        -[W5WiFiSnifferRequest setOutputFile:](v67, "setOutputFile:", v254[5]);
        -[W5WiFiSnifferRequest setMonitorMode:](v67, "setMonitorMode:", 1);
        -[W5WiFiSnifferRequest setTcpDump:](v67, "setTcpDump:", 1);
        -[W5WiFiSnifferRequest setNoAutoStop:](v67, "setNoAutoStop:", 1);
        -[W5WiFiSnifferRequest setRotationInterval:](v67, "setRotationInterval:", 900);
        v250[0] = _NSConcreteStackBlock;
        v250[1] = 3221225472;
        v250[2] = sub_100008684;
        v250[3] = &unk_1000D50E8;
        v252 = location;
        v68 = dispatch_semaphore_create(0);
        v251 = v68;
        -[W5WiFiSnifferRequest setReply:](v67, "setReply:", v250);
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "snifferManager"));
        objc_msgSend(v69, "addRequest:", v67);

        v70 = sub_10008F56C();
        v71 = objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          v72 = v260[5];
          v73 = v254[5];
          *(_DWORD *)buf = 136316930;
          *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v289) = 449;
          WORD2(v289) = 2112;
          *(_QWORD *)((char *)&v289 + 6) = v72;
          HIWORD(v289) = 2112;
          v290 = v57;
          v291 = 2048;
          v292 = 86400;
          v293 = 2048;
          v294 = 900;
          v295 = 2112;
          v296 = v73;
          LODWORD(v219) = 78;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v71, 0, "[wifivelocity] %s (%s:%u) Sniffer Request added to queue with UUID: %@, channel: %@, duration: %ld, rotation interval: %ld, outputFile: %@", buf, v219);
        }

        objc_msgSend(*(id *)(a1 + 32), "_storeSnifferInfo:peer:uuid:path:", v55, v223, v260[5], v254[5]);
        v74 = dispatch_time(0, 30000000000);
        if (dispatch_semaphore_wait(v68, v74) >= 1
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          *(_QWORD *)&buf[4] = 0x403E000000000000;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
        }

        v75 = v222;
      }
      else
      {
        v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "peer"));
        v188 = objc_msgSend(v187, "copy");

        objc_msgSend(v188, "setControlFlags:", 1);
        v189 = dispatch_semaphore_create(0);
        v190 = [W5PeerSnifferRequest alloc];
        v191 = v260[5];
        v287 = v57;
        v192 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v287, 1));
        v244[0] = _NSConcreteStackBlock;
        v244[1] = 3221225472;
        v244[2] = sub_1000086D0;
        v244[3] = &unk_1000D5110;
        v247 = location;
        v248 = &v253;
        v245 = v57;
        v249 = &v259;
        v193 = v189;
        v246 = v193;
        v194 = -[W5PeerSnifferRequest initWithPeer:requestType:duration:uuid:channels:config:reply:](v190, "initWithPeer:requestType:duration:uuid:channels:config:reply:", v188, 1, v191, v192, &off_1000E5F08, v244, 86400.0);

        v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerManager"));
        v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "runSnifferAtPeerWithRequest:", v194));

        if (v196)
        {
          v197 = sub_10008F56C();
          v198 = objc_claimAutoreleasedReturnValue(v197);
          if (os_log_type_enabled(v198, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v289) = 474;
            WORD2(v289) = 2114;
            *(_QWORD *)((char *)&v289 + 6) = v223;
            HIWORD(v289) = 2114;
            v290 = v196;
            LODWORD(v218) = 48;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v198, 0, "[wifivelocity] %s (%s:%u) sniffer start failed for peer='%{public}@' error='%{public}@'", buf, v218);
          }

          -[W5DiagnosticsActionResult setError:](v222, "setError:", v196);
        }
        else
        {
          v210 = dispatch_time(0, 30000000000);
          if (dispatch_semaphore_wait(v193, v210) >= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349056;
            *(_QWORD *)&buf[4] = 0x403E000000000000;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
          }
        }

        v75 = v222;
        if (v196)
          goto LABEL_161;
      }
      -[W5DiagnosticsActionResult setUuid:](v75, "setUuid:", v260[5]);
      -[W5DiagnosticsActionResult setError:](v75, "setError:", *(_QWORD *)(*(_QWORD *)&location[8] + 40));
      if (v260[5] && v254[5])
        objc_msgSend(*(id *)(a1 + 32), "_storeSnifferInfo:peer:uuid:path:", v55, v223);
      -[W5DiagnosticsActionResult setPeer:](v75, "setPeer:", v223);
LABEL_161:
      _Block_object_dispose(&v253, 8);

      _Block_object_dispose(&v259, 8);
      _Block_object_dispose(location, 8);

LABEL_162:
      goto LABEL_163;
    case 1uLL:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&v289 = sub_100003BC8;
      *((_QWORD *)&v289 + 1) = sub_100003BD8;
      v290 = 0;
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("DiagnosticsMode")));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "info"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKey:", CFSTR("UUID")));

      if (!v78)
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localStore"));
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "infoMatchingDiagnosticMode:", v76));

        if (!v80)
          goto LABEL_44;
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectForKey:", CFSTR("UUID")));
        v81 = sub_10008F56C();
        v82 = objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315906;
          *(_QWORD *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&location[12] = 2080;
          *(_QWORD *)&location[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&location[22] = 1024;
          LODWORD(v298) = 500;
          WORD2(v298) = 2114;
          *(_QWORD *)((char *)&v298 + 6) = v78;
          LODWORD(v218) = 38;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v82, 0, "[wifivelocity] %s (%s:%u) [DM] UUID for stopping sniffer='%{public}@' [local store]", location, v218);
        }

        if (!v78)
        {
LABEL_44:
          v83 = sub_10008F56C();
          v84 = objc_claimAutoreleasedReturnValue(v83);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "peer"));
            *(_DWORD *)location = 136315906;
            *(_QWORD *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            *(_WORD *)&location[12] = 2080;
            *(_QWORD *)&location[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&location[22] = 1024;
            LODWORD(v298) = 505;
            WORD2(v298) = 2114;
            *(_QWORD *)((char *)&v298 + 6) = v85;
            LODWORD(v218) = 38;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v84, 0, "[wifivelocity] %s (%s:%u) No UUID specified for sniffer peer='%{public}@'", location, v218);

          }
          v86 = sub_10008F56C();
          v87 = objc_claimAutoreleasedReturnValue(v86);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "uuid"));
            *(_DWORD *)location = 136316162;
            *(_QWORD *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            *(_WORD *)&location[12] = 2080;
            *(_QWORD *)&location[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&location[22] = 1024;
            LODWORD(v298) = 506;
            WORD2(v298) = 2080;
            *(_QWORD *)((char *)&v298 + 6) = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            HIWORD(v298) = 2112;
            v299 = v88;
            LODWORD(v218) = 48;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v87, 0, "[wifivelocity] %s (%s:%u) %s: using DM UUID (%@) to stop sniffer", location, v218);

          }
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "uuid"));
        }
      }
      if (v18)
      {
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "snifferManager"));
        v243[0] = _NSConcreteStackBlock;
        v243[1] = 3221225472;
        v243[2] = sub_100008798;
        v243[3] = &unk_1000D5138;
        v243[4] = buf;
        objc_msgSend(v89, "cancelRequestWithUUID:reply:", v78, v243);

        v90 = sub_10008F56C();
        v91 = objc_claimAutoreleasedReturnValue(v90);
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315906;
          *(_QWORD *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
          *(_WORD *)&location[12] = 2080;
          *(_QWORD *)&location[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&location[22] = 1024;
          LODWORD(v298) = 515;
          WORD2(v298) = 2112;
          *(_QWORD *)((char *)&v298 + 6) = v78;
          LODWORD(v218) = 38;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v91, 0, "[wifivelocity] %s (%s:%u) Cancelled Sniffer Request with UUID: %@", location, v218);
        }

      }
      else
      {
        v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "peer"));
        v147 = objc_msgSend(v146, "copy");

        objc_msgSend(v147, "setControlFlags:", 1);
        v148 = dispatch_semaphore_create(0);
        v149 = [W5PeerSnifferRequest alloc];
        v240[0] = _NSConcreteStackBlock;
        v240[1] = 3221225472;
        v240[2] = sub_1000087A8;
        v240[3] = &unk_1000D5160;
        v242 = buf;
        v150 = v148;
        v241 = v150;
        v151 = -[W5PeerSnifferRequest initWithPeer:requestType:duration:uuid:channels:config:reply:](v149, "initWithPeer:requestType:duration:uuid:channels:config:reply:", v147, 2, v78, 0, 0, v240, 0.0);
        v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerManager"));
        v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "runSnifferAtPeerWithRequest:", v151));

        if (v153)
        {
          v154 = sub_10008F56C();
          v155 = objc_claimAutoreleasedReturnValue(v154);
          if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136316162;
            *(_QWORD *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
            *(_WORD *)&location[12] = 2080;
            *(_QWORD *)&location[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&location[22] = 1024;
            LODWORD(v298) = 537;
            WORD2(v298) = 2114;
            *(_QWORD *)((char *)&v298 + 6) = v223;
            HIWORD(v298) = 2114;
            v299 = v153;
            LODWORD(v218) = 48;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v155, 0, "[wifivelocity] %s (%s:%u) sniffer stop failed for peer='%{public}@' error='%{public}@'", location, v218);
          }

          -[W5DiagnosticsActionResult setError:](v222, "setError:", v153);
        }
        else
        {
          v199 = dispatch_time(0, 30000000000);
          if (dispatch_semaphore_wait(v150, v199) >= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)location = 134349056;
            *(_QWORD *)&location[4] = 0x403E000000000000;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", location, 0xCu);
          }
        }

        if (v153)
        {
LABEL_146:

          _Block_object_dispose(buf, 8);
          goto LABEL_163;
        }
      }
      -[W5DiagnosticsActionResult setError:](v222, "setError:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      goto LABEL_146;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("DiagnosticsMode")));
      if (v19)
      {
        if (!v18)
        {
          v22 = objc_msgSend(objc_alloc((Class)W5DebugConfiguration), "initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolState:bluetoothState:", v19, 0, 0, 0, 0, 0);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          *(_QWORD *)&v289 = sub_100003BC8;
          *((_QWORD *)&v289 + 1) = sub_100003BD8;
          v290 = 0;
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "peer"));
          if (a2 == (void *)5)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "peer"));
            v43 = objc_msgSend(v42, "copy");

            objc_msgSend(v43, "setControlFlags:", 1);
            v41 = v43;
          }
          v44 = dispatch_semaphore_create(0);
          v279 = NSLocalizedFailureReasonErrorKey;
          v280 = CFSTR("W5TimeoutErr");
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v280, &v279, 1));
          v46 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 3, v45));
          v47 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v46;

          v48 = [W5PeerDebugConfigurationRequest alloc];
          v237[0] = _NSConcreteStackBlock;
          v237[1] = 3221225472;
          v237[2] = sub_1000087F4;
          v237[3] = &unk_1000D5188;
          v239 = buf;
          v49 = v44;
          v238 = v49;
          v50 = -[W5PeerDebugConfigurationRequest initWithPeer:type:debugConfiguration:reply:](v48, "initWithPeer:type:debugConfiguration:reply:", v41, 2, v22, v237);
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerManager"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "sendDebugConfigurationForPeerWithRequest:", v50));

          if (v52)
          {
            v53 = sub_10008F56C();
            v54 = objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)location = 136316162;
              *(_QWORD *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
              *(_WORD *)&location[12] = 2080;
              *(_QWORD *)&location[14] = "W5DiagnosticsModeManager.m";
              *(_WORD *)&location[22] = 1024;
              LODWORD(v298) = 607;
              WORD2(v298) = 2114;
              *(_QWORD *)((char *)&v298 + 6) = v223;
              HIWORD(v298) = 2114;
              v299 = v52;
              LODWORD(v218) = 48;
              _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v54, 0, "[wifivelocity] %s (%s:%u) [DM] failed to set dm for peer='%{public}@' error='%{public}@'", location, v218);
            }

            -[W5DiagnosticsActionResult setError:](v222, "setError:", v52);
          }
          else
          {
            v156 = dispatch_time(0, 30000000000);
            if (dispatch_semaphore_wait(v49, v156) >= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)location = 134349056;
              *(_QWORD *)&location[4] = 0x403E000000000000;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", location, 0xCu);
            }
            -[W5DiagnosticsActionResult setError:](v222, "setError:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          }

          _Block_object_dispose(buf, 8);
          goto LABEL_106;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "store"));
        objc_msgSend(v20, "updateStoreWithDiagnosticsMode:", v19);

        if ((objc_msgSend(v223, "role") & 4) == 0)
        {
LABEL_107:

          goto LABEL_163;
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "info"));
        v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("UUID")));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "info"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("path")));

        if (v24 && v22)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localStore"));
          v283[0] = CFSTR("UUID");
          v283[1] = CFSTR("path");
          v284[0] = v22;
          v284[1] = v24;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v284, v283, 2));
          objc_msgSend(v25, "addToStore:newInfo:", v19, v26);

LABEL_106:
          goto LABEL_107;
        }
        v168 = sub_10008F56C();
        v169 = objc_claimAutoreleasedReturnValue(v168);
        if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v289) = 571;
          WORD2(v289) = 2112;
          *(_QWORD *)((char *)&v289 + 6) = v223;
          LODWORD(v218) = 38;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v169, 0, "[wifivelocity] %s (%s:%u) [DM] Sniffer information missing from DM peer: %@", buf, v218);
        }

        v281 = NSLocalizedFailureReasonErrorKey;
        v282 = CFSTR("W5ParamErr");
        v170 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v282, &v281, 1));
        v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v170));
        -[W5DiagnosticsActionResult setError:](v222, "setError:", v171);

        v172 = v222;
      }
      else
      {
        v285 = NSLocalizedFailureReasonErrorKey;
        v286 = CFSTR("W5ParamErr");
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v286, &v285, 1));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v35));
        -[W5DiagnosticsActionResult setError:](v222, "setError:", v36);

        v37 = v222;
      }

      goto LABEL_22;
    case 6uLL:
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("DiagnosticsMode")));
      if (!v92)
      {
        v277 = NSLocalizedFailureReasonErrorKey;
        v278 = CFSTR("W5ParamErr");
        v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v278, &v277, 1));
        v162 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v161));
        -[W5DiagnosticsActionResult setError:](v222, "setError:", v162);

        goto LABEL_163;
      }
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "netUsageManager"));
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "uuid"));
      objc_msgSend(v93, "recordUsageToDate:", v94);

      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "objectForKey:", CFSTR("event")));
      v96 = objc_msgSend(v95, "integerValue");

      if (v96 == (id)1)
      {
        v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "netUsageManager"));
        v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "uuid"));
        objc_msgSend(v97, "stopPeriodicUsageMonitor:", v98);
      }
      else
      {
        if (v96)
          goto LABEL_136;
        v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "netUsageManager"));
        v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "uuid"));
        objc_msgSend(v97, "startPeriodicUsageMonitor:maxEntries:uuid:", 180, v98, 10.0);
      }

LABEL_136:
      goto LABEL_163;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("DiagnosticsMode")));
      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localStore"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "infoMatchingDiagnosticMode:", v27));

        switch((unint64_t)a2)
        {
          case 7uLL:
            if (v29)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("TestOutputDirectory")));
              v31 = v30 == 0;

              if (!v31)
              {
                v32 = sub_10008F56C();
                v33 = objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("TestOutputDirectory")));
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
                  *(_WORD *)&buf[22] = 1024;
                  LODWORD(v289) = 717;
                  WORD2(v289) = 2114;
                  *(_QWORD *)((char *)&v289 + 6) = v34;
                  LODWORD(v218) = 38;
                  _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v33, 0, "[wifivelocity] %s (%s:%u) [DM] tests have already been run for this fault output='%{public}@'", buf, v218);

                }
                goto LABEL_96;
              }
            }
            objc_msgSend(*(id *)(a1 + 32), "_runDiagnosticsForDiagnosticMode:", v27);
            break;
          case 8uLL:
            if (v29)
            {
              v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("analyticsCSVsOutputPath")));
              v135 = v134 == 0;

              if (!v135)
              {
                v136 = sub_10008F56C();
                v33 = objc_claimAutoreleasedReturnValue(v136);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("analyticsCSVsOutputPath")));
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
                  *(_WORD *)&buf[22] = 1024;
                  LODWORD(v289) = 724;
                  WORD2(v289) = 2114;
                  *(_QWORD *)((char *)&v289 + 6) = v137;
                  LODWORD(v218) = 38;
                  _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v33, 0, "[wifivelocity] %s (%s:%u) [DM] analytics CSVs have already been collected for this fault output='%{public}@'", buf, v218);

                }
                goto LABEL_96;
              }
            }
            objc_msgSend(*(id *)(a1 + 32), "_collectAnalyticsCSVsForDiagnosticMode:", v27);
            break;
          case 9uLL:
            if (v29)
            {
              v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("systemLogsOutputPath")));
              v139 = v138 == 0;

              if (!v139)
              {
                v140 = sub_10008F56C();
                v33 = objc_claimAutoreleasedReturnValue(v140);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("systemLogsOutputPath")));
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
                  *(_WORD *)&buf[22] = 1024;
                  LODWORD(v289) = 731;
                  WORD2(v289) = 2114;
                  *(_QWORD *)((char *)&v289 + 6) = v141;
                  LODWORD(v218) = 38;
                  _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v33, 0, "[wifivelocity] %s (%s:%u) [DM] system logarchive has already been collected for this fault output='%{public}@'", buf, v218);

                }
                goto LABEL_96;
              }
            }
            objc_msgSend(*(id *)(a1 + 32), "_collectSystemLogsForDiagnosticMode:", v27);
            break;
          case 0xAuLL:
            if (!v29
              || (v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("networkInfoOutputPath"))),
                  v143 = v142 == 0,
                  v142,
                  v143))
            {
              objc_msgSend(*(id *)(a1 + 32), "_collectNetworkInfoForDiagnosticMode:", v27);
            }
            else
            {
              v144 = sub_10008F56C();
              v33 = objc_claimAutoreleasedReturnValue(v144);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("networkInfoOutputPath")));
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
                *(_WORD *)&buf[22] = 1024;
                LODWORD(v289) = 738;
                WORD2(v289) = 2114;
                *(_QWORD *)((char *)&v289 + 6) = v145;
                LODWORD(v218) = 38;
                _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v33, 0, "[wifivelocity] %s (%s:%u) [DM] network info has already been collected for this fault output='%{public}@'", buf, v218);

              }
LABEL_96:

            }
            break;
          default:
            break;
        }

      }
      else
      {
        v266 = NSLocalizedFailureReasonErrorKey;
        v267 = CFSTR("W5ParamErr");
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v267, &v266, 1));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v39));
        -[W5DiagnosticsActionResult setError:](v222, "setError:", v40);

      }
      goto LABEL_163;
    case 0xBuLL:
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("DiagnosticsMode")));
      if (!v99)
      {
        v163 = sub_10008F56C();
        v164 = objc_claimAutoreleasedReturnValue(v163);
        if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v289) = 643;
          LODWORD(v218) = 28;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v164, 0, "[wifivelocity] %s (%s:%u) [DM] nil mode", buf, v218, v220);
        }

        v275 = NSLocalizedFailureReasonErrorKey;
        v276 = CFSTR("W5ParamErr");
        v165 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v276, &v275, 1));
        v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v165));
        -[W5DiagnosticsActionResult setError:](v222, "setError:", v166);

        goto LABEL_163;
      }
      objc_initWeak((id *)location, *(id *)(a1 + 32));
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "objectForKey:", CFSTR("event")));
      v101 = objc_msgSend(v100, "integerValue");

      if (v101)
      {
        if (v101 != (id)1)
        {
LABEL_133:
          objc_destroyWeak((id *)location);

          goto LABEL_163;
        }
        v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localStore"));
        WeakRetained = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "infoMatchingDiagnosticMode:", v99));

        if (WeakRetained)
        {
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "objectForKey:", CFSTR("tcpdumpPID")));
          v105 = v104;
          if (v104)
          {
            kill((pid_t)objc_msgSend(v104, "intValue"), 9);
LABEL_132:

            goto LABEL_133;
          }
          v213 = sub_10008F56C();
          v214 = objc_claimAutoreleasedReturnValue(v213);
          if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v289) = 691;
            LODWORD(v218) = 28;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v214, 0, "[wifivelocity] %s (%s:%u) [DM] nil PID. Failed to stop tcpump", buf, v218, v220);
          }

          v268 = NSLocalizedFailureReasonErrorKey;
          v269 = CFSTR("W5InternalErr");
          v215 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v269, &v268, 1));
          v216 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 9, v215));
          -[W5DiagnosticsActionResult setError:](v222, "setError:", v216);

          v217 = v222;
        }
        else
        {
          v200 = sub_10008F56C();
          v201 = objc_claimAutoreleasedReturnValue(v200);
          if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v289) = 681;
            LODWORD(v218) = 28;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v201, 0, "[wifivelocity] %s (%s:%u) [DM] nil localInfo", buf, v218, v220);
          }

          v270 = NSLocalizedFailureReasonErrorKey;
          v271 = CFSTR("W5ParamErr");
          v202 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v271, &v270, 1));
          v203 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v202));
          -[W5DiagnosticsActionResult setError:](v222, "setError:", v203);

          v204 = v222;
        }
      }
      else
      {
        WeakRetained = (id *)objc_loadWeakRetained((id *)location);
        v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[2], "wifi"));
        v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "interfaceName"));

        if (v105)
        {
          v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "uuid"));
          v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DM-%@_%@_tcpdump.pcap"), v179, v105));
          v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/run/com.apple.wifivelocity"), "stringByAppendingPathComponent:", v180));

          v272[0] = CFSTR("-i");
          v272[1] = v105;
          v272[2] = CFSTR("-G");
          v182 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), 900));
          v272[3] = v182;
          v272[4] = CFSTR("-w");
          v272[5] = v181;
          v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v272, 6));

          v232[0] = _NSConcreteStackBlock;
          v232[1] = 3221225472;
          v232[2] = sub_100008840;
          v232[3] = &unk_1000D51B0;
          v184 = v222;
          v185 = *(_QWORD *)(a1 + 32);
          v233 = v184;
          v234 = v185;
          v235 = v99;
          v186 = v181;
          v236 = v186;
          +[NSTask runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:](NSTask, "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:", CFSTR("/usr/sbin/tcpdump"), v183, v232, 0, &stru_1000D51F0, 0.0);

          goto LABEL_132;
        }
        v205 = sub_10008F56C();
        v206 = objc_claimAutoreleasedReturnValue(v205);
        if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v289) = 655;
          LODWORD(v218) = 28;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v206, 0, "[wifivelocity] %s (%s:%u) [DM] Unable to get WiFi interface name", buf, v218, v220);
        }

        v273 = NSLocalizedFailureReasonErrorKey;
        v274 = CFSTR("W5NotPermittedErr");
        v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v274, &v273, 1));
        v208 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 5, v207));
        -[W5DiagnosticsActionResult setError:](v222, "setError:", v208);

        v209 = v222;
      }
      objc_destroyWeak((id *)location);

LABEL_22:
      v38 = v222;
      goto LABEL_164;
    case 0xCuLL:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&v289 = sub_100003BC8;
      *((_QWORD *)&v289 + 1) = sub_100003BD8;
      v290 = objc_alloc_init((Class)NSMutableSet);
      v106 = sub_10008F56C();
      v107 = objc_claimAutoreleasedReturnValue(v106);
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315906;
        *(_QWORD *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
        *(_WORD *)&location[12] = 2080;
        *(_QWORD *)&location[14] = "W5DiagnosticsModeManager.m";
        *(_WORD *)&location[22] = 1024;
        LODWORD(v298) = 749;
        WORD2(v298) = 2114;
        *(_QWORD *)((char *)&v298 + 6) = v221;
        LODWORD(v218) = 38;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v107, 0, "[wifivelocity] %s (%s:%u) [DM] peers to discover='%{public}@'", location, v218);
      }

      v230 = 0u;
      v231 = 0u;
      v228 = 0u;
      v229 = 0u;
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("peers")));
      v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v228, v265, 16);
      if (!v109)
        goto LABEL_78;
      v110 = *(_QWORD *)v229;
      break;
    default:
      goto LABEL_163;
  }
  do
  {
    for (i = 0; i != v109; i = (char *)i + 1)
    {
      if (*(_QWORD *)v229 != v110)
        objc_enumerationMutation(v108);
      v112 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * (_QWORD)i);
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "peer"));
      v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "peerID"));

      if (v114)
      {
        v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "peer"));
        v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "peerID"));
        v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerManager"));
        v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "localIDSIdentifier"));
        v119 = objc_msgSend(v116, "isEqualToString:", v118);

        if ((v119 & 1) != 0)
          continue;
        v120 = *(void **)(*(_QWORD *)&buf[8] + 40);
        v121 = objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "peer"));
        v122 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject peerID](v121, "peerID"));
        objc_msgSend(v120, "addObject:", v122);

      }
      else
      {
        v123 = sub_10008F56C();
        v121 = objc_claimAutoreleasedReturnValue(v123);
        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315906;
          *(_QWORD *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&location[12] = 2080;
          *(_QWORD *)&location[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&location[22] = 1024;
          LODWORD(v298) = 755;
          WORD2(v298) = 2114;
          *(_QWORD *)((char *)&v298 + 6) = v112;
          LODWORD(v218) = 38;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v121, 0, "[wifivelocity] %s (%s:%u) [DM] nil peerID for peer='%{public}@'", location, v218);
        }
      }

    }
    v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v228, v265, 16);
  }
  while (v109);
LABEL_78:

  v124 = dispatch_semaphore_create(0);
  v125 = objc_alloc_init((Class)W5PeerDiscoveryConfiguration);
  objc_msgSend(v125, "setDiscoveryFlags:", 1);
  v126 = [W5PeerDiscoveryRequest alloc];
  v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v225[0] = _NSConcreteStackBlock;
  v225[1] = 3221225472;
  v225[2] = sub_100008B1C;
  v225[3] = &unk_1000D5218;
  v227 = buf;
  v128 = v124;
  v226 = v128;
  v129 = -[W5PeerDiscoveryRequest initWithConfiguration:uuid:handler:](v126, "initWithConfiguration:uuid:handler:", v125, v127, v225);

  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerManager"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "startPeerDiscoveryWithRequest:", v129));

  if (v131)
  {
    v132 = sub_10008F56C();
    v133 = objc_claimAutoreleasedReturnValue(v132);
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315906;
      *(_QWORD *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
      *(_WORD *)&location[12] = 2080;
      *(_QWORD *)&location[14] = "W5DiagnosticsModeManager.m";
      *(_WORD *)&location[22] = 1024;
      LODWORD(v298) = 774;
      WORD2(v298) = 2114;
      *(_QWORD *)((char *)&v298 + 6) = v131;
      LODWORD(v218) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v133, 0, "[wifivelocity] %s (%s:%u) peer discovery failed error='%{public}@'", location, v218);
    }

    -[W5DiagnosticsActionResult setError:](v222, "setError:", v131);
  }
  else
  {
    v167 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v128, v167) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 134349056;
      *(_QWORD *)&location[4] = 0x403E000000000000;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", location, 0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
LABEL_163:
  v38 = v222;
  v211 = v222;
LABEL_164:

  return v222;
}

void sub_100008578(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 208));
  _Unwind_Resume(a1);
}

void sub_100008684(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000086D0(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  v8 = a2;
  v9 = a5;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;
  v19 = v8;
  v12 = a4;

  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v9;
  v18 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100008798(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1000087A8(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000087F4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100008840(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_10008F56C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315906;
      v17 = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
      v18 = 2080;
      v19 = "W5DiagnosticsModeManager.m";
      v20 = 1024;
      v21 = 664;
      v22 = 2112;
      v23 = v6;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) [DM] Failed to start tcpdump with error: %@", &v16, 38);
    }

    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localStore"));
    v10 = *(_QWORD *)(a1 + 48);
    v14[0] = CFSTR("tcpdumpPID");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "processIdentifier")));
    v14[1] = CFSTR("tcpdumpOutputPath");
    v15[0] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", *(_QWORD *)(a1 + 56)));
    v15[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
    objc_msgSend(v9, "addToStore:newInfo:", v10, v13);

  }
}

void sub_100008A24(id a1, NSTask *a2, NSError *a3)
{
  NSError *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  NSError *v14;

  v3 = a3;
  v4 = sub_10008F56C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315906;
    v8 = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
    v9 = 2080;
    v10 = "W5DiagnosticsModeManager.m";
    v11 = 1024;
    v12 = 673;
    v13 = 2112;
    v14 = v3;
    v6 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) [DM] Tcpdump ended. Error: %@", &v7, v6);
  }

}

void sub_100008B1C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), "peerID"));
        objc_msgSend(v8, "removeObject:", v9);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t sub_10000A854(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000BE78(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;

  v3 = a2;
  v4 = sub_10008F56C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315906;
    v14 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]_block_invoke";
    v15 = 2080;
    v16 = "W5DiagnosticsModeManager.m";
    v17 = 1024;
    v18 = 1084;
    v19 = 2112;
    v20 = v3;
    v10 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) [DM] Stop Diagnostic Mode completed. Error: %@", &v13, v10);
  }

  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v11 = CFSTR("DiagnosticMode");
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  objc_msgSend(v6, "_notifyPeers:info:", v7, v9);

}

void sub_10000D944(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  W5LogItemRequestInternal *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  W5LogItemRequestInternal *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  const __CFString *v23;
  void *v24;
  _QWORD v25[3];
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  W5LogItemRequestInternal *v33;

  v5 = a4;
  v6 = sub_10008F56C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136315906;
    v27 = "-[W5DiagnosticsModeManager _collectNetworkInfoForDiagnosticMode:]_block_invoke";
    v28 = 2080;
    v29 = "W5DiagnosticsModeManager.m";
    v30 = 1024;
    v31 = 1362;
    v32 = 2112;
    v33 = v5;
    v22 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s (%s:%u) [DM] Network info log generation completed with receipt: %@", &v26, v22);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v9 = objc_alloc_init(W5LogItemRequestInternal);
  -[W5LogItemRequestInternal setUuid:](v9, "setUuid:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 90, 0));
  v25[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 4, &off_1000E6020));
  v25[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 6, 0));
  v25[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));
  -[W5LogItemRequestInternal setItemRequests:](v9, "setItemRequests:", v13);

  -[W5LogItemRequestInternal setFilename:](v9, "setFilename:", *(_QWORD *)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[W5LogItemRequestInternal setAddedAt:](v9, "setAddedAt:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "logManager"));
  objc_msgSend(v15, "addRequest:", v9);

  v16 = sub_10008F56C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136315906;
    v27 = "-[W5DiagnosticsModeManager _collectNetworkInfoForDiagnosticMode:]_block_invoke";
    v28 = 2080;
    v29 = "W5DiagnosticsModeManager.m";
    v30 = 1024;
    v31 = 1375;
    v32 = 2112;
    v33 = v9;
    LODWORD(v21) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s (%s:%u) Added to W5LogManager queue: %@", &v26, v21);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localStore"));
  v19 = *(_QWORD *)(a1 + 48);
  v23 = CFSTR("networkInfoCollectUUID");
  v24 = v8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
  objc_msgSend(v18, "addToStore:newInfo:", v19, v20);

}

uint64_t sub_10000E240(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  v5 = (id)a1[5];
  v6 = v4 == v5;
  if (a1[4])
    v7 = v4 == v5;
  else
    v7 = 0;
  if (v7)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "peers", 0));
    v6 = (uint64_t)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = (void *)a1[4];
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peer"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peerID"));
          if (objc_msgSend(v12, "isEqualToString:", v14))
          {
            v15 = a1[6] & (unint64_t)objc_msgSend(v11, "role");

            if (v15)
            {
              v6 = 1;
              goto LABEL_17;
            }
          }
          else
          {

          }
        }
        v6 = (uint64_t)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }
LABEL_17:

  }
  return v6;
}

uint64_t sub_10000E478(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  v5 = *(id *)(a1 + 40);
  v6 = v4 == v5;
  if (*(_QWORD *)(a1 + 32))
    v7 = v4 == v5;
  else
    v7 = 0;
  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "peers", 0));
    v6 = (uint64_t)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(a1 + 32);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "peer"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peerID"));
          LOBYTE(v11) = objc_msgSend(v11, "isEqualToString:", v13);

          if ((v11 & 1) != 0)
          {
            v6 = 1;
            goto LABEL_16;
          }
        }
        v6 = (uint64_t)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_16:

  }
  return v6;
}

id sub_10000E6B8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUIDString"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

id sub_10000ECC8()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1000FB670;
  v7 = qword_1000FB670;
  if (!qword_1000FB670)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000FFC4;
    v3[3] = &unk_1000D5380;
    v3[4] = &v4;
    sub_10000FFC4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000ED68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000FC60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

Class sub_10000FFC4(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;

  v6 = 0;
  if (!qword_1000FB678)
  {
    v7 = off_1000D53A0;
    v8 = 0;
    qword_1000FB678 = _sl_dlopen(&v7, &v6);
  }
  if (!qword_1000FB678)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *WiFiAnalyticsLibrary(void)"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("W5DiagnosticsModeManager.m"), 31, CFSTR("%s"), v6);

    goto LABEL_10;
  }
  if (v6)
    free(v6);
  result = objc_getClass("AnalyticsProcessor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getAnalyticsProcessorClass(void)_block_invoke"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("W5DiagnosticsModeManager.m"), 33, CFSTR("Unable to find class %s"), "AnalyticsProcessor");

LABEL_10:
    __break(1u);
  }
  qword_1000FB670 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000109AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000109D0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000109E0(uint64_t a1)
{

}

void sub_1000109E8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;

  v3 = a2;
  v4 = sub_10008F56C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v9 = 136315906;
      v10 = "-[W5NetUsageManager _getCurrentUsage]_block_invoke";
      v11 = 2080;
      v12 = "W5NetUsageManager.m";
      v13 = 1024;
      v14 = 93;
      v15 = 2048;
      v16 = objc_msgSend(v3, "count");
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) Got Network Usage for %ld entries", (const char *)&v9, 38);
    }

    v7 = objc_msgSend(v3, "copy");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(NSObject **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }
  else if (v6)
  {
    v9 = 136315650;
    v10 = "-[W5NetUsageManager _getCurrentUsage]_block_invoke";
    v11 = 2080;
    v12 = "W5NetUsageManager.m";
    v13 = 1024;
    v14 = 97;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) Failed to get Network Usage", (const char *)&v9, 28);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000111B8(uint64_t a1)
{
  double v2;
  id v3;
  uint64_t v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;

  v2 = *(double *)(a1 + 56);
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100011280;
  v9 = &unk_1000D53E8;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v12 = v3;
  v13 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v6, v2));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40), v6, v7, v8, v9, v10);

}

void sub_100011280(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  const char *v32;
  int v33;
  int v34;
  id v35;
  int v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  __int16 v44;
  _QWORD v45[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_getCurrentUsage"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v4 = sub_10008F56C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 136316162;
      v37 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]_block_invoke_2";
      v38 = 2080;
      v39 = "W5NetUsageManager.m";
      v40 = 1024;
      v41 = 158;
      v42 = 2048;
      v43 = objc_msgSend(v2, "count");
      v44 = 2114;
      v45[0] = v3;
      v33 = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) Recording Network Usage for %ld entries, at: %{public}@", &v36, v33);
    }

    v6 = -[W5WiFiNetUsageRecord init:usageData:]([W5WiFiNetUsageRecord alloc], "init:usageData:", v3, v2);
    v7 = *(void **)(a1 + 40);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
    v9 = sub_1000914E0((uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("netusage_%@.csv"), v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)));
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)));
    v16 = objc_msgSend(v15, "count");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)));
    v18 = v17;
    if (v14 >= v16)
    {
      objc_msgSend(v17, "addObject:", v12);
      v19 = v18;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", v14));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v35 = 0;
      v21 = objc_msgSend(v20, "removeItemAtURL:error:", v19, &v35);
      v22 = v35;

      v23 = sub_10008F56C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v36 = 136316418;
        v37 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]_block_invoke";
        v38 = 2080;
        v39 = "W5NetUsageManager.m";
        v40 = 1024;
        v41 = 168;
        v42 = 2112;
        v43 = v19;
        v44 = 1024;
        LODWORD(v45[0]) = v21;
        WORD2(v45[0]) = 2112;
        *(_QWORD *)((char *)v45 + 6) = v22;
        LODWORD(v32) = 54;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v24, 0, "[wifivelocity] %s (%s:%u) Remove file: %@, success: %d, error: %@", &v36, v32);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)));
      objc_msgSend(v25, "replaceObjectAtIndex:withObject:", v14, v12);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "usageData"));
    +[W5NetUsageManager writeProcNetUsage:ToFile:](W5NetUsageManager, "writeProcNetUsage:ToFile:", v26, v12);

    v27 = sub_10008F56C();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)));
      v30 = objc_msgSend(v29, "count");
      v36 = 136315906;
      v37 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]_block_invoke";
      v38 = 2080;
      v39 = "W5NetUsageManager.m";
      v40 = 1024;
      v41 = 177;
      v42 = 2048;
      v43 = v30;
      LODWORD(v32) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 0, "[wifivelocity] %s (%s:%u) Netusage periodic dump has %ld files", (const char *)&v36, v32, v34, v35);

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ((unint64_t)v14 + 1) % *(_QWORD *)(a1 + 56)));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v31, *(_QWORD *)(a1 + 48));

  }
}

void sub_100011F90(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v7 = objc_opt_class(NSNumber, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKey:", v16));
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKey:", v16));
    objc_msgSend(v11, "doubleValue");
    v13 = v10 - v12;

    v14 = a1[6];
    v15 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", v13);
    objc_msgSend(v14, "setObject:forKey:", v15, v16);

  }
  else
  {
    objc_msgSend(a1[6], "setObject:forKey:", v5, v16);
  }

}

void sub_1000127E8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  v12 = v5;
  if (!a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@\t%@\t%@\t%@\t%@\n"), CFSTR("Process Name"), CFSTR("WiFi In (Bytes)"), CFSTR("WiFi Out (Bytes)"), CFSTR("AWDL In (Bytes)"), CFSTR("AWDL Out (Bytes)"));
    v5 = v12;
  }
  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("procName")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("wifiInBytes")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("wifiOutBytes")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("awdlInBytes")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("awdlOutBytes")));
  objc_msgSend(v6, "appendFormat:", CFSTR("%@\t%@\t%@\t%@\t%@\n"), v7, v8, v9, v10, v11);

}

void sub_100013078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000130B0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000130C0(uint64_t a1)
{

}

void sub_1000130C8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  W5WiFiSnifferRequest *v19;
  id v20;
  void *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  dispatch_time_t v35;
  void *v36;
  W5WiFiSnifferRequest *v37;
  uint64_t v38;
  _QWORD block[5];
  W5WiFiSnifferRequest *v40;
  id v41;
  id obj;
  _QWORD v43[4];
  id v44;
  id v45;
  int v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  _BYTE v53[10];
  _BYTE v54[10];
  uint64_t v55;
  __int16 v56;
  void *v57;

  v7 = a2;
  v8 = v7;
  if (a3 == 1)
    *a4 = 1;
  if (v7)
  {
    v9 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v9, "setDateFormat:", CFSTR("yyyy-MM-dd_HH.mm.ss.SSS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v10));

    v12 = objc_msgSend(v8, "channel");
    v13 = objc_msgSend(v8, "channelWidth");
    v14 = objc_msgSend(v8, "band");
    if (*(_BYTE *)(a1 + 96))
      v15 = "nostop";
    else
      v15 = "remote";
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ch%li_%@_bw%ld_band%ld_%s.pcap"), v12, v11, v13, v14, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URLByAppendingPathComponent:", v16));

    v19 = objc_alloc_init(W5WiFiSnifferRequest);
    -[W5WiFiSnifferRequest setUuid:](v19, "setUuid:", *(_QWORD *)(a1 + 32));
    -[W5WiFiSnifferRequest setChannel:](v19, "setChannel:", v8);
    -[W5WiFiSnifferRequest setDuration:](v19, "setDuration:", *(double *)(a1 + 80));
    -[W5WiFiSnifferRequest setOutputFile:](v19, "setOutputFile:", v18);
    -[W5WiFiSnifferRequest setMonitorMode:](v19, "setMonitorMode:", 1);
    -[W5WiFiSnifferRequest setTcpDump:](v19, "setTcpDump:", 1);
    -[W5WiFiSnifferRequest setNoAutoStop:](v19, "setNoAutoStop:", *(unsigned __int8 *)(a1 + 96));
    if (*(_BYTE *)(a1 + 96))
      -[W5WiFiSnifferRequest setRotationInterval:](v19, "setRotationInterval:", *(_QWORD *)(a1 + 88));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000135C8;
    v43[3] = &unk_1000D5488;
    v44 = *(id *)(a1 + 32);
    v20 = v8;
    v45 = v20;
    -[W5WiFiSnifferRequest setReply:](v19, "setReply:", v43);
    v21 = *(void **)(a1 + 40);
    v22 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 0;
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v23 + 40);
    objc_msgSend(v21, "setUserAutoJoinDisabled:error:", v22, &obj);
    objc_storeStrong((id *)(v23 + 40), obj);
    v24 = sub_10008F56C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v16;
      v27 = v11;
      v28 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 0;
      v29 = objc_msgSend(*(id *)(a1 + 40), "userAutoJoinDisabled");
      v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v46 = 136316418;
      v47 = "-[W5PeerSnifferListener _runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:]_block_invoke";
      v48 = 2080;
      v49 = "W5PeerSnifferListener.m";
      v50 = 1024;
      v51 = 148;
      v52 = 1024;
      *(_DWORD *)v53 = v28;
      v11 = v27;
      v16 = v26;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)&v53[6] = v29;
      *(_WORD *)v54 = 2114;
      *(_QWORD *)&v54[2] = v30;
      LODWORD(v38) = 50;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v25, 0, "[wifivelocity] %s (%s:%u) Setting User Auto Join Disabled: %d, status: %d, error: %{public}@", &v46, v38);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "addRequest:", v19);
    v31 = sub_10008F56C();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = *(_QWORD *)(a1 + 32);
      v34 = (uint64_t)*(double *)(a1 + 80);
      v46 = 136316674;
      v47 = "-[W5PeerSnifferListener _runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:]_block_invoke";
      v48 = 2080;
      v49 = "W5PeerSnifferListener.m";
      v50 = 1024;
      v51 = 151;
      v52 = 2114;
      *(_QWORD *)v53 = v33;
      *(_WORD *)&v53[8] = 2114;
      *(_QWORD *)v54 = v20;
      *(_WORD *)&v54[8] = 2048;
      v55 = v34;
      v56 = 2114;
      v57 = v18;
      LODWORD(v38) = 68;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v32, 0, "[wifivelocity] %s (%s:%u) Sniffer Request added to queue with UUID: %{public}@, channel: %{public}@, duration: %ld, outputFile: %{public}@", &v46, v38);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKey:", v18, v20);
    v35 = dispatch_time(0, 1000000000 * (uint64_t)*(double *)(a1 + 80));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000136E0;
    block[3] = &unk_1000D4FD0;
    v36 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 48);
    v40 = v19;
    v41 = v36;
    v37 = v19;
    dispatch_after(v35, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

void sub_1000135C8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;

  v3 = a2;
  v4 = sub_10008F56C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 136316418;
    v10 = "-[W5PeerSnifferListener _runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:]_block_invoke_2";
    v11 = 2080;
    v12 = "W5PeerSnifferListener.m";
    v13 = 1024;
    v14 = 144;
    v15 = 2114;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    v19 = 2114;
    v20 = v3;
    v8 = 58;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) Sniffer Request with UUID: %{public}@, channel: %{public}@, replied with error: %{public}@", &v9, v8);
  }

}

void sub_1000136E0(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "uuid"));
  objc_msgSend(v2, "stopSnifferWithUUID:interface:", v3, *(_QWORD *)(a1 + 48));

}

void sub_100013934(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;

  v3 = a2;
  v4 = sub_10008F56C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v3;
    v7 = 22;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] Cancel Sniffer Request with UUID: %{public}@ replied: %{public}@", &v8, v7);
  }

}

void sub_1000141E8(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  NSError *v7;

  v2 = a2;
  v3 = sub_10008F56C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v2;
    v5 = 12;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] File Sender, Transfer Completion, error: %{public}@", &v6, v5);
  }

}

void sub_1000142A8(id a1, RPFileTransferProgress *a2)
{
  RPFileTransferProgress *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  RPFileTransferProgress *v7;

  v2 = a2;
  v3 = sub_10008F56C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v2;
    v5 = 12;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] File Sender, Transfer Progress: %{public}@", &v6, v5);
  }

}

void sub_100014368(id a1, RPFileTransferItem *a2, id a3)
{
  RPFileTransferItem *v4;
  void (**v5)(id, _QWORD);
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v9;
  RPFileTransferItem *v10;

  v4 = a2;
  v5 = (void (**)(id, _QWORD))a3;
  v6 = sub_10008F56C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v4;
    v8 = 12;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] File Sender, Received item: %{public}@", &v9, v8);
  }

  v5[2](v5, 0);
}

void sub_100014450(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  NSError *v7;

  v2 = a2;
  v3 = sub_10008F56C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v2;
    v5 = 12;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] File Sender, Item Completion, error: %{public}@", &v6, v5);
  }

}

void sub_10001474C(id a1, RPFileTransferProgress *a2)
{
  RPFileTransferProgress *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  RPFileTransferProgress *v7;

  v2 = a2;
  v3 = sub_10008F56C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v2;
    v5 = 12;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] File Receiver, Transfer Progress: %{public}@", &v6, v5);
  }

}

void sub_10001480C(uint64_t a1, void *a2, uint64_t a3)
{
  char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[18];

  v5 = a2;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, 0);
  v6 = sub_10008F56C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138543362;
    v25 = v5;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] File Receiver, Received Item: %{public}@", &v24, 12);
  }

  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", 420));
  objc_msgSend(v8, "setObject:forKey:", v9, NSFilePosixPermissions);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
  v23 = 0;
  v13 = objc_msgSend(v10, "setAttributes:ofItemAtPath:error:", v8, v12, &v23);
  v14 = v23;

  v15 = sub_10008F56C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (!v17)
      goto LABEL_9;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemURL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
    v24 = 136316162;
    v25 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]_block_invoke";
    v26 = 2080;
    v27 = "W5FileTransferManager.m";
    v28 = 1024;
    v29 = 168;
    v30 = 1024;
    *(_DWORD *)v31 = 420;
    *(_WORD *)&v31[4] = 2114;
    *(_QWORD *)&v31[6] = v19;
    LODWORD(v22) = 44;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) Set file permissions to %hd on: %{public}@", &v24, v22);
  }
  else
  {
    if (!v17)
      goto LABEL_9;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemURL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
    v24 = 136316162;
    v25 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]_block_invoke";
    v26 = 2080;
    v27 = "W5FileTransferManager.m";
    v28 = 1024;
    v29 = 171;
    v30 = 2114;
    *(_QWORD *)v31 = v14;
    *(_WORD *)&v31[8] = 2114;
    *(_QWORD *)&v31[10] = v19;
    LODWORD(v22) = 48;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) Unable to set file permissions, error: %{public}@ for: %{public}@", &v24, v22);
  }

LABEL_9:
  v20 = *(_QWORD *)(a1 + 32);
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemURL"));
    (*(void (**)(uint64_t, id, void *))(v20 + 16))(v20, v14, v21);

  }
}

void sub_100015160(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reply"));
  if (v5)
  {

    ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v5, 0);
  }
  else
  {
    v10 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v9);
  }

}

void sub_10001647C(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  NSError *v17;

  v3 = a2;
  v4 = a3;
  v5 = sub_10008F56C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136316162;
    v9 = "-[W5UserNotificationManager init]_block_invoke";
    v10 = 2080;
    v11 = "W5UserNotificationManager.m";
    v12 = 1024;
    v13 = 38;
    v14 = 1024;
    v15 = v3;
    v16 = 2114;
    v17 = v4;
    v7 = 44;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) Authorization for Notification: granted %d error %{public}@", &v8, v7);
  }

}

void sub_100016924(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  NSError *v13;

  v2 = a2;
  v3 = sub_10008F56C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315906;
    v7 = "-[W5UserNotificationManager dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:]_block_invoke";
    v8 = 2080;
    v9 = "W5UserNotificationManager.m";
    v10 = 1024;
    v11 = 86;
    v12 = 2114;
    v13 = v2;
    v5 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) Queued Notification with Error: %{public}@", &v6, v5);
  }

}

void sub_100017464(id a1)
{
  W5ActivityManager *v1;
  void *v2;

  v1 = objc_alloc_init(W5ActivityManager);
  v2 = (void *)qword_1000FB688;
  qword_1000FB688 = (uint64_t)v1;

}

void sub_100017708(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001778C;
  v5[3] = &unk_1000D56F0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v2 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v5, 5.0));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

void sub_10001778C(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000177E4;
  block[3] = &unk_1000D5268;
  block[4] = v1;
  dispatch_async(v2, block);
}

void sub_1000177E4(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t description;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  id v14;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = objc_msgSend(v1, "count");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager activeTransactions %lu", buf, 0xCu);
  }
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          description = os_transaction_get_description(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i));
          *(_DWORD *)buf = 136315138;
          v14 = (id)description;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager activeTransaction %s", buf, 0xCu);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void sub_100017A2C(_QWORD *a1)
{
  _QWORD *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;

  v2 = (_QWORD *)a1[4];
  if (!v2[2])
  {
    v3 = objc_msgSend(v2, "debugTimerEnabled");
    v2 = (_QWORD *)a1[4];
    if (v3)
    {
      objc_msgSend(v2, "debugTimer");
      v2 = (_QWORD *)a1[4];
    }
  }
  if (!v2[6])
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v5 = a1[4];
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v4;

    v2 = (_QWORD *)a1[4];
  }
  v7 = (void *)v2[1];
  if (v7 && objc_msgSend(v7, "isValid"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager osTransactionCreate, timer was running, invalidating and freeing", (uint8_t *)&v13, 2u);
    }
    objc_msgSend(*(id *)(a1[4] + 8), "invalidate");
    v8 = a1[4];
    v9 = *(void **)(v8 + 8);
    *(_QWORD *)(v8 + 8) = 0;

  }
  objc_msgSend(*(id *)(a1[4] + 24), "addObject:", a1[5]);
  ++*(_QWORD *)(a1[4] + 48);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[6];
    v11 = objc_msgSend(*(id *)(a1[4] + 24), "count");
    v12 = *(_QWORD *)(a1[4] + 48);
    v13 = 136315650;
    v14 = v10;
    v15 = 2048;
    v16 = v11;
    v17 = 2048;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager osTransactionCreate %s, active count is now %lu, total started is now %lu", (uint8_t *)&v13, 0x20u);
  }
}

void sub_100017CC8(_QWORD *a1)
{
  uint64_t description;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  double v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD block[6];
  uint8_t buf[4];
  double v16;
  __int16 v17;
  id v18;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    description = os_transaction_get_description(a1[4]);
    *(_DWORD *)buf = 136315138;
    v16 = *(double *)&description;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager osTransactionComplete %s", buf, 0xCu);
  }
  if ((objc_msgSend(*(id *)(a1[5] + 24), "containsObject:", a1[4]) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v12 = os_transaction_get_description(a1[4]);
      v13 = objc_msgSend(*(id *)(a1[5] + 24), "count");
      *(_DWORD *)buf = 136315394;
      v16 = *(double *)&v12;
      v17 = 2048;
      v18 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] W5ActivityManager osTransactionComplete %s, TRANSACTION NOT FOUND, active count is now %lu", buf, 0x16u);
    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1[5] + 24), "removeObject:", a1[4]);
  ++*(_QWORD *)(a1[5] + 64);
  if (!objc_msgSend(*(id *)(a1[5] + 24), "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentDomainForName:", CFSTR("com.apple.wifivelocity")));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("eager-exit-timeout")));
    if (v5)
    {
      NSLog(CFSTR("%s: Found preference value in domain: %@ key: %@"), "-[W5ActivityManager osTransactionComplete:]_block_invoke", CFSTR("com.apple.wifivelocity"), CFSTR("eager-exit-timeout"));
      v6 = objc_msgSend(v5, "intValue");
      if (v6 < 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager empty, eager exit timer disabled via defaults write", buf, 2u);
        }
        goto LABEL_21;
      }
      v7 = (double)v6;
    }
    else
    {
      v7 = 300.0;
    }
    v8 = *(void **)(a1[5] + 8);
    v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v9)
      {
        *(_DWORD *)buf = 134217984;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager empty, extending running eager exit timer to %f seconds", buf, 0xCu);
        v8 = *(void **)(a1[5] + 8);
      }
      if (objc_msgSend(v8, "isValid"))
        objc_msgSend(*(id *)(a1[5] + 8), "invalidate");
      v10 = a1[5];
      v11 = *(void **)(v10 + 8);
      *(_QWORD *)(v10 + 8) = 0;

    }
    else if (v9)
    {
      *(_DWORD *)buf = 134217984;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager empty, configuring eager exit timer in %f seconds", buf, 0xCu);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001802C;
    block[3] = &unk_1000D5768;
    block[4] = a1[5];
    *(double *)&block[5] = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
LABEL_21:

  }
}

void sub_10001802C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000180B4;
  v6[3] = &unk_1000D5740;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = v2;
  v3 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v3;

}

void sub_1000180B4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  double v12;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 64);
    objc_msgSend(*(id *)(v4 + 56), "timeIntervalSinceNow");
    v9 = 134218240;
    v10 = v5;
    v11 = 2048;
    v12 = -v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager Completed %lu transactions within uptime of %f seconds", (uint8_t *)&v9, 0x16u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 134217984;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager Attempting Daemon Eager Exit due to inactivity timeout of %f seconds", (uint8_t *)&v9, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_executeTimerBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "alternateExecutionBlockForCleanExit"));

  if (!v8
    && (xpc_transaction_try_exit_clean() & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager Cannot eager exit, still outstanding transactions", (uint8_t *)&v9, 2u);
  }

}

id sub_10001832C(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_100018EF8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100018F90(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_10001905C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
  {
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a3, 0);
  }
  else
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id *sub_10001908C(id *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id *v5;

  v5 = result;
  if (a3)
    result = (id *)objc_msgSend(result[4], "appendData:");
  if (a4)
    return (id *)objc_msgSend(v5[5], "appendData:", a4);
  return result;
}

uint64_t sub_1000190D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, 1);
  return result;
}

uint64_t sub_100019154(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000195CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "closeFile");
  objc_msgSend(*(id *)(a1 + 40), "closeFile");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

uint64_t sub_100019690(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000197FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
  {
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a3, 0);
  }
  else
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_10001982C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id result;

  v6 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v6, "writeData:");
  result = *(id *)(a1 + 40);
  if (result)
    return objc_msgSend(result, "writeData:", a4);
  return result;
}

void sub_1000198A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, int a12, uint64_t a13, __int16 a14, uint64_t a15, __int16 a16, int a17, __int16 a18, uint64_t a19)
{
  NSObject *v19;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v19 = sub_10008F56C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) [NSFileHandle writeData:] failed with exception %{public}@");
    objc_end_catch();
    JUMPOUT(0x100019874);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100019A30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, 1);
  return result;
}

void sub_10001A520(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Unwind_Resume(a1);
}

void sub_10001A57C(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_10001A58C(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_10001A598(uint64_t a1)
{
  void *v2;
  ssize_t v3;
  NSData *v4;
  NSObject *v5;
  _QWORD block[6];
  __int128 v7;
  _BYTE v8[4096];

  v2 = objc_autoreleasePoolPush();
  v3 = read(*(_DWORD *)(a1 + 64), v8, 0x1000uLL);
  if (v3 >= 1)
  {
    v4 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v8, v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A67C;
    block[3] = &unk_1000D58A8;
    v7 = *(_OWORD *)(a1 + 48);
    v5 = *(NSObject **)(a1 + 32);
    block[4] = *(_QWORD *)(a1 + 40);
    block[5] = v4;
    dispatch_async(v5, block);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10001A67C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v3 = a1[6];
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5], 0);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10001A6CC(uint64_t a1)
{

  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

void sub_10001A6FC(uint64_t a1)
{
  void *v2;
  ssize_t v3;
  NSData *v4;
  NSObject *v5;
  _QWORD block[6];
  __int128 v7;
  _BYTE v8[4096];

  v2 = objc_autoreleasePoolPush();
  v3 = read(*(_DWORD *)(a1 + 64), v8, 0x1000uLL);
  if (v3 >= 1)
  {
    v4 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v8, v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A7E0;
    block[3] = &unk_1000D58A8;
    v7 = *(_OWORD *)(a1 + 48);
    v5 = *(NSObject **)(a1 + 32);
    block[4] = *(_QWORD *)(a1 + 40);
    block[5] = v4;
    dispatch_async(v5, block);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10001A7E0(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v3 = a1[6];
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], 0, a1[5]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10001A830(uint64_t a1)
{

  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

void sub_10001A860(uint64_t a1)
{
  NSObject *v2;
  NSError *v3;
  signed int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[10];
  _QWORD block[5];
  NSErrorUserInfoKey v12;
  const __CFString *v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;

  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  v2 = *(NSObject **)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AB4C;
  block[3] = &unk_1000D5380;
  block[4] = *(_QWORD *)(a1 + 96);
  dispatch_async(v2, block);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
  {
    v14 = NSLocalizedFailureReasonErrorKey;
    v15 = CFSTR("W5TimeoutErr");
    v3 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "terminationStatus");
    if (v4)
    {
      v12 = NSLocalizedFailureReasonErrorKey;
      v13 = CFSTR("terminationStatus");
      v3 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v4, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    }
    else
    {
      v3 = 0;
    }
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001AB7C;
  v10[3] = &unk_1000D5948;
  v5 = *(_QWORD *)(a1 + 56);
  v10[4] = *(_QWORD *)(a1 + 48);
  v10[5] = v3;
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10[6] = v5;
  v10[7] = v8;
  v9 = *(_QWORD *)(a1 + 112);
  v10[8] = v6;
  v10[9] = v9;
  dispatch_async(v7, v10);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));

}

void sub_10001AB2C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10001AB4C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  objc_autoreleasePoolPop(v2);
}

void sub_10001AB7C(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  const __CFString *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;

  v2 = objc_autoreleasePoolPush();
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    if (*(_QWORD *)(a1 + 40))
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (error=%@)"), *(_QWORD *)(a1 + 40));
    else
      v5 = &stru_1000D8750;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(" "));
    v10 = 136316674;
    v11 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke";
    v12 = 2080;
    v13 = "W5TaskUtil.m";
    v14 = 1024;
    v15 = 451;
    v16 = 2114;
    v17 = v4;
    v18 = 2114;
    v19 = v5;
    v20 = 2114;
    v21 = v6;
    v22 = 2114;
    v23 = v7;
    v9 = 68;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) <%{public}@> END%{public}@ - '%{public}@ %{public}@'", &v10, v9);
  }
  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = 0;
  objc_autoreleasePoolPop(v2);
}

void sub_10001AD3C(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  dispatch_time_t v7;
  uint64_t v8;
  _QWORD v9[6];
  _QWORD block[5];
  int8x16_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "launch");
  v3 = *(NSObject **)(a1 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B1D8;
  block[3] = &unk_1000D5970;
  v4 = *(_QWORD *)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v11 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
  v5 = *(_QWORD *)(a1 + 88);
  v12 = v4;
  v13 = v5;
  dispatch_async(v3, block);
  v6 = *(double *)(a1 + 112);
  if (v6 > 0.0)
  {
    v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001B360;
    v9[3] = &unk_1000D5998;
    v8 = *(_QWORD *)(a1 + 104);
    v9[4] = *(_QWORD *)(a1 + 32);
    v9[5] = v8;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10001AFEC(void *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    objc_begin_catch(a1);
    JUMPOUT(0x10001AF24);
  }
  JUMPOUT(0x10001B01CLL);
}

void sub_10001B024(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  NSError *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSError *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;

  v2 = objc_autoreleasePoolPush();
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    v10 = NSLocalizedFailureReasonErrorKey;
    v11 = CFSTR("W5ResourceErr");
    v5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR(" "));
    v12 = 136316674;
    v13 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke";
    v14 = 2080;
    v15 = "W5TaskUtil.m";
    v16 = 1024;
    v17 = 486;
    v18 = 2114;
    v19 = v4;
    v20 = 2114;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = v7;
    v9 = 68;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) <%{public}@> START (error=%{public}@) - '%{public}@ %{public}@'", &v12, v9);
  }
  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  objc_autoreleasePoolPop(v2);
}

void sub_10001B1D8(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  const __CFString *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;

  v2 = objc_autoreleasePoolPush();
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    if (*(_QWORD *)(a1 + 40))
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (error=%@)"), *(_QWORD *)(a1 + 40));
    else
      v5 = &stru_1000D8750;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(" "));
    v10 = 136316674;
    v11 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke";
    v12 = 2080;
    v13 = "W5TaskUtil.m";
    v14 = 1024;
    v15 = 499;
    v16 = 2114;
    v17 = v4;
    v18 = 2114;
    v19 = v5;
    v20 = 2114;
    v21 = v6;
    v22 = 2114;
    v23 = v7;
    v9 = 68;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) <%{public}@> START%{public}@ - '%{public}@ %{public}@'", &v10, v9);
  }
  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10001B360(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return kill((pid_t)objc_msgSend(*(id *)(a1 + 32), "processIdentifier"), 9);
}

void sub_10001B38C(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  const __CFString *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;

  v2 = objc_autoreleasePoolPush();
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    if (*(_QWORD *)(a1 + 40))
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (error=%@)"), *(_QWORD *)(a1 + 40));
    else
      v5 = &stru_1000D8750;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(" "));
    v10 = 136316674;
    v11 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke_2";
    v12 = 2080;
    v13 = "W5TaskUtil.m";
    v14 = 1024;
    v15 = 541;
    v16 = 2114;
    v17 = v4;
    v18 = 2114;
    v19 = v5;
    v20 = 2114;
    v21 = v6;
    v22 = 2114;
    v23 = v7;
    v9 = 68;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) <%{public}@> START%{public}@ - '%{public}@ %{public}@'", &v10, v9);
  }
  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

void sub_10001B830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10001B854(uint64_t a1, void *a2, char a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001BB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10001BB4C(uint64_t a1, void *a2, char a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001BE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10001BE44(uint64_t a1, void *a2, char a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

__CFString *sub_10001C82C(unint64_t a1)
{
  __CFString *result;

  result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("? (%ld)"), a1);
  if (a1 <= 4)
    return off_1000D5A48[a1];
  return result;
}

id sub_10001C87C(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  int v5;
  __CFString *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  int v13;
  __CFString *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  id v20;
  __CFString *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v1 = objc_msgSend(objc_msgSend(a1, "scanRecord"), "objectForKeyedSubscript:", CFSTR("WPA_IE"));
  if (!v1)
    return 0;
  v2 = v1;
  v3 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v3, "appendString:", CFSTR("["));
  v4 = objc_msgSend(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IE_KEY_WPA_MCIPHER")), "intValue");
  v5 = (_DWORD)v4 - 1;
  if (((_DWORD)v4 - 1) < 5 && ((0x1Bu >> v5) & 1) != 0)
    v6 = off_1000D5A70[v5];
  else
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%i>"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("mcast=%@, "), v6);
  objc_msgSend(v3, "appendString:", CFSTR("ucast={ "));
  v23 = v2;
  v7 = objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IE_KEY_WPA_UCIPHERS"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "intValue");
        v13 = (_DWORD)v12 - 1;
        if (((_DWORD)v12 - 1) < 5 && ((0x1Bu >> v13) & 1) != 0)
          v14 = off_1000D5A70[v13];
        else
          v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%i>"), v12);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }
  objc_msgSend(v3, "appendString:", CFSTR("}, "));
  objc_msgSend(v3, "appendString:", CFSTR("auths={ "));
  v15 = objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("IE_KEY_WPA_AUTHSELS"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "intValue");
        if (v20 >= 3)
          v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%i>"), v20);
        else
          v21 = off_1000D5A98[(int)v20];
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v21);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v17);
  }
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

__CFString *sub_10001CBB0(uint64_t a1)
{
  int v1;

  v1 = a1 - 1;
  if ((a1 - 1) < 9 && ((0x19Fu >> v1) & 1) != 0)
    return off_1000D5AB0[v1];
  else
    return (__CFString *)+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%i>"), a1);
}

id sub_10001CC0C(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  __CFString *v15;
  id v16;
  unsigned int v17;
  unsigned int v18;
  const char *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v1 = objc_msgSend(objc_msgSend(a1, "scanRecord"), "objectForKeyedSubscript:", CFSTR("RSN_IE"));
  if (!v1)
    return 0;
  v2 = v1;
  v3 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v3, "appendString:", CFSTR("["));
  objc_msgSend(v3, "appendFormat:", CFSTR("mcast=%@, "), sub_10001CBB0((uint64_t)objc_msgSend(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IE_KEY_RSN_MCIPHER")), "intValue")));
  objc_msgSend(v3, "appendString:", CFSTR("ucast={ "));
  v4 = objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IE_KEY_RSN_UCIPHERS"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), sub_10001CBB0((uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v8), "intValue")));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }
  objc_msgSend(v3, "appendString:", CFSTR("}, "));
  objc_msgSend(v3, "appendString:", CFSTR("auths={ "));
  v21 = v2;
  v9 = objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IE_KEY_RSN_AUTHSELS"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v13), "intValue");
        if (v14 < 0x1A && ((0x30033FFu >> (char)v14) & 1) != 0)
          v15 = off_1000D5AF8[(int)v14];
        else
          v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%i>"), v14);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v15);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v11);
  }
  objc_msgSend(v3, "appendString:", CFSTR("}, "));
  v16 = objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("IE_KEY_RSN_CAPS"));
  v17 = objc_msgSend(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("MFP_CAPABLE")), "BOOLValue");
  v18 = objc_msgSend(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("MFP_REQUIRED")), "BOOLValue");
  v19 = "no";
  if (v17)
    v19 = "capable";
  if (v18)
    v19 = "required";
  objc_msgSend(v3, "appendFormat:", CFSTR("mfp=%s"), v19);
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

const __CFString *sub_10001CF4C(uint64_t a1)
{
  unint64_t v2;
  const char *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  _DWORD *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  _DWORD *v31;
  uint64_t v32;
  int v33;
  uint64_t i;
  int v35;
  uint64_t v36;
  _DWORD *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  _DWORD *v47;
  _DWORD *v48;
  _DWORD *v49;
  uint64_t v50;
  char __str[16384];
  _OWORD v52[25];
  _OWORD v53[25];

  if (!a1)
    return &stru_1000D8750;
  v2 = *(unsigned __int8 *)(a1 + 8980);
  if (v2 > 2)
    v3 = " INVALID";
  else
    v3 = off_1000D5A30[v2];
  v4 = snprintf(__str, 0x4000uLL, " \n AP STATUS DETERMINED AS: %s \n", v3);
  v5 = 0;
  memset((char *)&v53[6] + 15, 0, 289);
  memset((char *)&v52[1] + 8, 0, 376);
  strcpy((char *)v52, " Number of events     :");
  do
  {
    snprintf((char *)v52, 0x190uLL, "%s %u\t", (const char *)v52, *(unsigned __int16 *)(a1 + 8982 + v5));
    v5 += 2;
  }
  while (v5 != 32);
  strcpy((char *)v53, " Period Ranges [sec]  : 0\t 0-1\t 1-2\t 2-3\t 3-4\t 4-5\t 5-6\t 6-7\t 7-8\t 8-9\t 9-10\t 11-15\t 16-20\t 21-30\t 31-60\t 60+\n");
  v6 = snprintf(&__str[v4], 0x4000 - v4, " \n GENERAL RX RATE PERIOD REPORT \n") + (uint64_t)v4;
  v7 = v6 + snprintf(&__str[v6], 0x4000 - v6, "%s \n", (const char *)v52);
  v8 = snprintf(&__str[v7], 0x4000 - v7, "%s \n", (const char *)v53);
  v9 = 0;
  strcpy((char *)v52, " Number of events    :");
  memset(v53, 0, sizeof(v53));
  memset((char *)&v52[1] + 7, 0, 377);
  do
  {
    snprintf((char *)v52, 0x190uLL, "%s %u\t", (const char *)v52, *(unsigned __int16 *)(a1 + 9014 + v9));
    v9 += 2;
  }
  while (v9 != 32);
  strcpy((char *)v53, " Period Ranges [sec] : 0\t 0-1\t 1-2\t 2-3\t 3-4\t 4-5\t 5-6\t 6-7\t 7-8\t 8-9\t 9-10\t 11-15\t 16-20\t 21-30\t 31-60\t 60+\n");
  v10 = snprintf(&__str[v7 + v8], 0x4000 - (v7 + v8), " LINK DOWN LOW RX RATE PERIOD REPORT \n") + v7 + v8;
  v11 = v10 + snprintf(&__str[v10], 0x4000 - v10, "%s \n", (const char *)v52);
  v12 = v11 + snprintf(&__str[v11], 0x4000 - v11, "%s \n", (const char *)v53);
  memset(v52, 0, sizeof(v52));
  memset(v53, 0, sizeof(v53));
  v13 = snprintf(&__str[v12], 0x4000 - v12, " ERRORS SUMMARY: GUARD PERIOD START TIME ZERO EVENT \n") + v12;
  v14 = snprintf(&__str[v13], 0x4000 - v13, " Number of reports:     %d\t %d\t %d\t %d\t \n", *(_DWORD *)(a1 + 8908), *(_DWORD *)(a1 + 8912), *(_DWORD *)(a1 + 8916), *(_DWORD *)(a1 + 8920))+ v13;
  v15 = 0;
  v16 = v14 + snprintf(&__str[v14], 0x4000 - v14, " Guard Period reason:  FRTS\t SCAN\t PSF\t AW\t \n\n");
  v49 = (_DWORD *)a1;
  v17 = a1 + 64;
  v46 = *(_OWORD *)" Number of reports: ";
  strcpy((char *)&v45, "ports: ");
  v44 = *(_OWORD *)" Guard        Time: ";
  strcpy((char *)&v43, " Time: ");
  do
  {
    memset((char *)&v52[1] + 5, 0, 379);
    v52[0] = v46;
    *(_QWORD *)((char *)v52 + 13) = v45;
    memset((char *)&v53[1] + 5, 0, 368);
    v53[24] = 0u;
    v53[0] = v44;
    *(_QWORD *)((char *)v53 + 13) = v43;
    snprintf((char *)v53, 0x190uLL, " %s\t 16-20\t 21-30\t 31-40\t 41-50\t 51-100\t 101-200 201+\n", (const char *)v53);
    v18 = 0;
    v19 = 0;
    do
    {
      v19 += *(_DWORD *)(v17 + v18);
      snprintf((char *)v52, 0x190uLL, "%s\t %d", (const char *)v52, *(_DWORD *)(v17 + v18));
      v18 += 4;
    }
    while (v18 != 28);
    v20 = snprintf(&__str[v16], 0x4000 - v16, " ERRORS SUMMARY: LONG %s GUARD PERIOD - TOTAL %d  \n", off_1000D5A08[v15], v19)+ (uint64_t)v16;
    LODWORD(v20) = v20 + snprintf(&__str[v20], 0x4000 - v20, "%s \n", (const char *)v52);
    v16 = v20 + snprintf(&__str[(int)v20], 0x4000 - (int)v20, "%s \n", (const char *)v53);
    ++v15;
    v17 += 88;
  }
  while (v15 != 5);
  v21 = snprintf(&__str[v16], 0x4000 - v16, " \n ERRORS SUMMARY: INVALID PACKET AMOUNT REPORTS \n") + v16;
  v22 = v49;
  v23 = snprintf(&__str[v21], 0x4000 - v21, " Number of reports:       %d\t %d\t %d\t %d\t \n", v49[2212], v49[2213], v49[2214], v49[2215])+ v21;
  v24 = v23 + snprintf(&__str[v23], 0x4000 - v23, " Guard Period reason:     FRTS\t SCAN\t PSF\t AW\t \n");
  v25 = v24
      + snprintf(&__str[v24], 0x4000 - v24, " \n ERRORS SUMMARY: PACKET ARRIVAL TIME BEFORE GUARD TIME PERIOD REPORTS \n");
  v26 = snprintf(&__str[v25], 0x4000 - v25, " Number of packets:       %d\t %d\t %d\t %d\t \n", v22[2217], v22[2218], v22[2219], v22[2220])+ v25;
  v27 = snprintf(&__str[v26], 0x4000 - v26, " Number of guard periods: %d\t %d\t %d\t %d\t \n", v22[2222], v22[2223], v22[2224], v22[2225])+ v26;
  v28 = snprintf(&__str[v27], 0x4000 - v27, " Guard Period reason:     FRTS\t SCAN\t PSF\t AW\t \n");
  v29 = 0;
  v30 = v27 + v28;
  v31 = v49 + 1;
  v48 = v49 + 111;
  do
  {
    v47 = v31;
    memset((char *)&v53[1] + 5, 0, 379);
    v53[0] = v44;
    *(_QWORD *)((char *)v53 + 13) = v43;
    memset((char *)&v52[1] + 5, 0, 368);
    v52[24] = 0u;
    v52[0] = v46;
    *(_QWORD *)((char *)v52 + 13) = v45;
    v50 = v29;
    v32 = snprintf(&__str[v30], 0x4000 - v30, " \n GUARD TIME %s REPORT\n", off_1000D5A08[v29]) + (uint64_t)v30;
    v33 = snprintf(&__str[v32], 0x4000 - v32, " Guard Time distribution in 1 milisec granualty \n");
    for (i = 0; i != 15; ++i)
    {
      if (v47[i])
      {
        snprintf((char *)v53, 0x190uLL, "%s\t %d", (const char *)v53, i);
        snprintf((char *)v52, 0x190uLL, "%s\t %d", (const char *)v52, v47[i]);
      }
    }
    v35 = snprintf(&__str[(int)v32 + v33], 0x4000 - ((int)v32 + v33), "%s \n", (const char *)v52) + v32 + v33;
    v36 = 0;
    v30 = v35 + snprintf(&__str[v35], 0x4000 - v35, "%s \n", (const char *)v53);
    v37 = v48;
    v38 = v50;
    do
    {
      if (v22[22 * v38 + 1 + v36])
      {
        v39 = 0;
        v40 = 0;
        strcpy((char *)v53, " Time        Slots: ");
        strcpy((char *)v52, " Number of packets: ");
        memset((char *)&v53[1] + 5, 0, 379);
        memset((char *)&v52[1] + 5, 0, 379);
        do
        {
          if (v37[v39])
          {
            ++v40;
            snprintf((char *)v53, 0x190uLL, "%s\t %d", (const char *)v53, v39);
            snprintf((char *)v52, 0x190uLL, "%s\t %d", (const char *)v52, v37[v39]);
          }
          ++v39;
        }
        while (v39 != 22);
        if (v40)
        {
          v41 = snprintf(&__str[v30], 0x4000 - v30, " \n Packet distribution within the Guard Time %d [ time slot 1 milisecond] \n", v36)+ (uint64_t)v30;
          LODWORD(v41) = v41 + snprintf(&__str[v41], 0x4000 - v41, "%s \n", (const char *)v52);
          v30 = v41 + snprintf(&__str[(int)v41], 0x4000 - (int)v41, "%s \n", (const char *)v53);
        }
        v22 = v49;
        v38 = v50;
      }
      ++v36;
      v37 += 20;
    }
    while (v36 != 22);
    v29 = v38 + 1;
    v31 = v47 + 22;
    v48 += 400;
  }
  while (v29 != 5);
  return (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", __str, 4);
}

void sub_10001E2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E334(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001E344(uint64_t a1)
{

}

void sub_10001E34C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315906;
    v17 = "-[W5PeerDiagnosticsListener _runDiagnostics:uuid:configuration:]_block_invoke";
    v18 = 2080;
    v19 = "W5PeerDiagnosticsListener.m";
    v20 = 1024;
    v21 = 98;
    v22 = 2114;
    v23 = v6;
    v15 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) [DEBUG] Hit reply block %{public}@", &v16, v15);
  }

  objc_msgSend(*(id *)(a1 + 32), "lock");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v9 = objc_msgSend(v5, "copy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = objc_msgSend(v6, "copy");
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "unlock");

}

void sub_10001F020(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = objc_autoreleasePoolPush();
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F090;
  v4[3] = &unk_1000D5BF8;
  v3 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "__cancelActiveRequestAndReply:", v4);
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10001F090(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001F0F4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "__cancelActiveRequestAndReply:", 0);
  objc_autoreleasePoolPop(v2);
}

void sub_10001F294(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void (**v5)(id, NSError *);
  uint64_t v6;
  uint64_t v7;
  NSErrorUserInfoKey v8;
  const __CFString *v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(a1 + 32), "__pendingRequestWithUUID:", *(_QWORD *)(a1 + 40));
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "reply"))
    {
      v5 = (void (**)(id, NSError *))objc_msgSend(v4, "reply");
      v10 = NSLocalizedFailureReasonErrorKey;
      v11 = CFSTR("W5CancelledErr");
      v5[2](v5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)));
    }
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v4);
  }
  else if (objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "uuid"), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "__cancelActiveRequestAndReply:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      v8 = NSLocalizedFailureReasonErrorKey;
      v9 = CFSTR("W5ParamErr");
      (*(void (**)(uint64_t, NSError *))(v7 + 16))(v7, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1)));
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10001F4A8(uint64_t a1)
{
  void *v2;
  void *v3;
  NSAssertionHandler *v4;
  const void *v5;
  id v6;
  void *v7;
  NSAssertionHandler *v8;
  __int128 v9;
  uint64_t v10;
  void *v11;

  v2 = objc_autoreleasePoolPush();
  if (!qword_1000FB690)
  {
    v9 = off_1000D5D08;
    v10 = 0;
    qword_1000FB690 = _sl_dlopen(&v9, 0);
  }
  if (qword_1000FB690)
  {
    *(_QWORD *)&v9 = 0;
    *((_QWORD *)&v9 + 1) = &v9;
    v10 = 0x2020000000;
    v3 = off_1000FB698;
    v11 = off_1000FB698;
    if (!off_1000FB698)
    {
      v4 = sub_100024BF0();
      v3 = dlsym(v4, "CoreCaptureControlCreate");
      *(_QWORD *)(*((_QWORD *)&v9 + 1) + 24) = v3;
      off_1000FB698 = v3;
    }
    _Block_object_dispose(&v9, 8);
    if (!v3)
    {
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CoreCaptureControlRef soft_CoreCaptureControlCreate(CFAllocatorRef)"), CFSTR("W5WiFiPerfLoggingManager.m"), 19, CFSTR("%s"), dlerror());
      goto LABEL_15;
    }
    v5 = (const void *)((uint64_t (*)(const CFAllocatorRef))v3)(kCFAllocatorDefault);
    if (v5)
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "UTF8String");
      *(_QWORD *)&v9 = 0;
      *((_QWORD *)&v9 + 1) = &v9;
      v10 = 0x2020000000;
      v7 = off_1000FB6A0;
      v11 = off_1000FB6A0;
      if (!off_1000FB6A0)
      {
        v8 = sub_100024BF0();
        v7 = dlsym(v8, "CoreCaptureControlCaptureWithComponentDirectory");
        *(_QWORD *)(*((_QWORD *)&v9 + 1) + 24) = v7;
        off_1000FB6A0 = v7;
      }
      _Block_object_dispose(&v9, 8);
      if (v7)
      {
        ((void (*)(const void *, const char *, id))v7)(v5, "WiFi", v6);
        CFRelease(v5);
        goto LABEL_12;
      }
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Boolean soft_CoreCaptureControlCaptureWithComponentDirectory(CoreCaptureControlRef, const char *, const char *)"), CFSTR("W5WiFiPerfLoggingManager.m"), 23, CFSTR("%s"), dlerror());
LABEL_15:
      __break(1u);
    }
  }
LABEL_12:
  objc_autoreleasePoolPop(v2);
}

void sub_10001F6EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001F7CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__dumpCoreCaptureLogsWithReason:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("wifiperf[%@]"), objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "uuid"), "UUIDString"), "substringToIndex:", 5)));
}

void sub_100020230(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020288;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020288(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_1000202D4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_1000202F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020348;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020348(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100020394(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_1000203B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020408;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020408(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100020454(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100020470(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000204C8;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000204C8(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100020514(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100020530(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020588;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020588(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_1000205D4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_1000205F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020648;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020648(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100020694(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_1000206B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020708;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020708(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100020754(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100020770(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000207C8;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000207C8(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100020814(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100020830(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020888;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020888(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_1000208D4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100021008(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021060;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021060(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_1000210AC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_1000210C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021120;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021120(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_10002116C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100021188(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000211E0;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000211E0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_10002122C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100021248(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000212A0;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000212A0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_1000212EC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100021308(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021360;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021360(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_1000213AC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_1000213C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021420;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021420(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_10002146C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100021488(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000214E0;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000214E0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_10002152C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_1000216C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD v6[2];

  objc_msgSend(*(id *)(a1 + 32), "__runToolWithOutputFileHandle:launchPath:arguments:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), CFSTR("/usr/local/bin/apple80211"), &off_1000E7458);
  objc_msgSend(*(id *)(a1 + 32), "__runToolWithOutputFileHandle:launchPath:arguments:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), CFSTR("/usr/local/bin/apple80211"), &off_1000E7470);
  objc_msgSend(*(id *)(a1 + 32), "__runToolWithOutputFileHandle:launchPath:arguments:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), CFSTR("/usr/local/bin/apple80211"), &off_1000E7488);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 64);
  v6[0] = objc_msgSend(objc_msgSend(*(id *)(v2 + 8), "awdl"), "interfaceName");
  v6[1] = CFSTR("-dbg=print_sr");
  objc_msgSend((id)v2, "__runToolWithOutputFileHandle:launchPath:arguments:", v3, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  if (v4)
  {
    v5 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

void sub_1000217E4(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
}

void sub_100021D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021DB4;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021DB4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100021E00(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100021E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021E74;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021E74(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100021EC0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100021EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021F34;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021F34(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100021F80(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100021F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021FF4;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021FF4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100022040(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_10002205C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000220B4;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000220B4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100022100(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3)
    v3 = 48;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + v3));
}

void sub_100022294(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD v6[2];

  objc_msgSend(*(id *)(a1 + 32), "__runToolWithOutputFileHandle:launchPath:arguments:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), CFSTR("/usr/local/bin/apple80211"), &off_1000E74A0);
  objc_msgSend(*(id *)(a1 + 32), "__runToolWithOutputFileHandle:launchPath:arguments:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), CFSTR("/usr/local/bin/apple80211"), &off_1000E74B8);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 80);
  v6[0] = objc_msgSend(objc_msgSend(*(id *)(v2 + 8), "nan"), "interfaceName");
  v6[1] = CFSTR("-dbg=print_nan_avail");
  objc_msgSend((id)v2, "__runToolWithOutputFileHandle:launchPath:arguments:", v3, CFSTR("/usr/local/bin/apple80211"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  if (v4)
  {
    v5 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

void sub_1000223A0(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
}

void sub_1000225DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022634;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100022634(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100022674(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
}

id sub_1000228A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__setupWatchdogTask");
}

uint64_t sub_100024AE8(uint64_t a1)
{
  void (**v2)(id, NSError *);
  uint64_t result;
  NSErrorUserInfoKey v4;
  const __CFString *v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "reply"))
  {
    v2 = (void (**)(id, NSError *))objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "reply");
    v4 = NSLocalizedFailureReasonErrorKey;
    v5 = CFSTR("W5CancelledErr");
    v2[2](v2, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1)));
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "__nextRequest");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

NSAssertionHandler *sub_100024BF0()
{
  NSAssertionHandler *v0;
  id v1;
  NSString *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000FB690)
  {
    v5 = off_1000D5D08;
    v6 = 0;
    qword_1000FB690 = _sl_dlopen(&v5, &v4);
  }
  v0 = (NSAssertionHandler *)qword_1000FB690;
  if (!qword_1000FB690)
  {
    v0 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *CoreCaptureControlLibrary(void)");
    v1 = -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v0, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("W5WiFiPerfLoggingManager.m"), 15, CFSTR("%s"), v4);
    __break(1u);
    goto LABEL_7;
  }
  v1 = v4;
  if (v4)
LABEL_7:
    free(v1);
  return v0;
}

void sub_1000252A8(id a1)
{
  id v1;
  void *v2;

  v1 = -[W5BufferPool initBuffersWithSize:bufferCount:]([W5BufferPool alloc], "initBuffersWithSize:bufferCount:", compression_encode_scratch_buffer_size(COMPRESSION_LZFSE), 2);
  v2 = (void *)qword_1000FB6A8;
  qword_1000FB6A8 = (uint64_t)v1;

}

void sub_100025A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1000260BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100026100(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("timer")));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("timer")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("timer")));
      if (objc_msgSend(v7, "isValid"))
        objc_msgSend(v7, "invalidate");

    }
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("timer"));

}

void sub_1000261F0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("timer")));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("timer")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("timer")));
      if (objc_msgSend(v7, "isValid"))
        objc_msgSend(v7, "invalidate");

    }
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("timer"));

}

void sub_1000266F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10002672C(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000267BC;
  v3[3] = &unk_1000D56F0;
  v3[4] = *(_QWORD *)(a1 + 40);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v3, 10.0));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("timer"));

}

id sub_1000267BC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "freeIdleBufferOfTimer:", a2);
}

void sub_100026960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100026ACC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000276F4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__setupCallbacks");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "resume");
  objc_autoreleasePoolPop(v2);
}

intptr_t sub_100027944(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_10002794C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100027954(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_10002795C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100027AC8(uint64_t a1)
{
  id v2;
  id result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = objc_alloc_init((Class)W5Peer);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setPeerID:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setModel:", objc_msgSend(*(id *)(a1 + 32), "__model"));
  v2 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/System/Library/CoreServices/SystemVersion.plist")), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setBuild:", objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ProductBuildVersion")));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setVersion:", objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ProductVersion")));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setOs:", objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ProductName")));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setName:", sub_10008EF3C());
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "peerID");
  if (!result)
  {
    result = *(id *)(*(_QWORD *)(a1 + 32) + 80);
    if (result)
    {
      result = objc_msgSend(result, "localIDSIdentifier");
      if (result)
        return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setPeerID:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "localIDSIdentifier"));
    }
  }
  return result;
}

void sub_100028100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  id v7;
  id v8;
  BOOL v9;
  int64_t v10;
  uint64_t v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;

  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a4, a3);
  v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Reason"));
  v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CleanupDelay"));
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (!v9)
  {
    if (v8)
      v10 = 1000000000 * (_QWORD)objc_msgSend(v8, "unsignedIntegerValue");
    else
      v10 = 120000000000;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3052000000;
    v15[3] = sub_100028258;
    v15[4] = sub_100028268;
    v16 = 0;
    v11 = os_transaction_create("com.apple.wifivelocity.cleanup");
    objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", "com.apple.wifivelocity.cleanup", v11);
    v16 = v11;
    v12 = dispatch_time(0, v10);
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100028274;
    v14[3] = &unk_1000D5D48;
    v14[4] = a3;
    v14[5] = v15;
    dispatch_after(v12, v13, v14);
    _Block_object_dispose(v15, 8);
  }
}

void sub_100028258(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_100028268(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_100028274(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;

  v2 = objc_autoreleasePoolPush();
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "path");
    v6[0] = 67109378;
    v6[1] = 120;
    v7 = 2114;
    v8 = v4;
    v5 = 18;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] CLEANUP temporary WiFi log content (delay=%ds, path='%{public}@')", v6, v5);
  }
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(*(id *)(a1 + 32), "path"), 0);
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100028478(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100028564(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000287C8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000288D4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100028EBC(uint64_t a1)
{
  void *v2;
  id v3;
  NSError *v4;
  uint64_t v5;
  NSErrorUserInfoKey v6;
  const __CFString *v7;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v3 = objc_alloc_init((Class)W5LogItemReceipt);
  objc_msgSend(v3, "setRequest:", *(_QWORD *)(a1 + 32));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setStartedAt:");
  objc_msgSend(v3, "startedAt");
  objc_msgSend(v3, "setCompletedAt:");
  v6 = NSLocalizedFailureReasonErrorKey;
  v7 = CFSTR("W5NotSupportedErr");
  v4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 4, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, NSError *, _QWORD, id))(v5 + 16))(v5, v4, 0, v3);
  objc_autoreleasePoolPop(v2);
}

void sub_100029480(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x400], 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1000294BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029518;
  v4[3] = &unk_1000D5998;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100029518(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "__updatedStatusWithEvent:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100029550(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000295AC;
  v4[3] = &unk_1000D5998;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_1000295AC(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "__updatedStatusWithEvent:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_1000295E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029640;
  v4[3] = &unk_1000D5998;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100029640(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "__updatedStatusWithEvent:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100029678(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000296D4;
  v4[3] = &unk_1000D5998;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_1000296D4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "__updatedStatusWithEvent:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002970C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029768;
  v4[3] = &unk_1000D5998;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100029768(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "__updatedStatusWithEvent:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_1000297A0(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD v3[5];
  __int128 v4;
  uint64_t v5;

  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100029810;
  v3[3] = &unk_1000D63D8;
  v3[4] = a2;
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  dispatch_async(v2, v3);
}

void sub_100029810(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  char v4;
  void *v5;

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(*(id *)(a1 + 32), "eventID") == (id)18)
  {
    v3 = objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "corewifi"), "powerOn");
    v4 = IOPMIsASleep(objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "pm"), "caps"));
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v3 || (v4 & 1) != 0)
      objc_msgSend(v5, "pauseMonitoring");
    else
      objc_msgSend(v5, "resumeMonitoringAfterDelay:", 10.0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "__updatedStatusWithEvent:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_1000298C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002991C;
  v4[3] = &unk_1000D5998;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002991C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "__updatedStatusWithEvent:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100029954(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD v3[5];
  __int128 v4;
  uint64_t v5;

  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000299C4;
  v3[3] = &unk_1000D63D8;
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v3[4] = a2;
  dispatch_async(v2, v3);
}

void sub_1000299C4(_QWORD *a1)
{
  void *v2;
  unsigned int v3;
  char v4;
  void *v5;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "corewifi"), "powerOn");
  v4 = IOPMIsASleep(objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "pm"), "caps"));
  v5 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v3 || (v4 & 1) != 0)
    objc_msgSend(v5, "pauseMonitoring");
  else
    objc_msgSend(v5, "resumeMonitoringAfterDelay:", 10.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "__updatedStatusWithEvent:", a1[4]);
  objc_autoreleasePoolPop(v2);
}

void sub_100029A64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029AC0;
  v4[3] = &unk_1000D5998;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100029AC0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "__updatedStatusWithEvent:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100029AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029B54;
  v4[3] = &unk_1000D5998;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100029B54(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "__updatedStatusWithEvent:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100029B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029BE8;
  v4[3] = &unk_1000D5998;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100029BE8(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "__updatedStatusWithEvent:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100029C20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029C7C;
  v4[3] = &unk_1000D5998;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100029C7C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "__updatedStatusWithEvent:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100029CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029D10;
  v4[3] = &unk_1000D5998;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_100029D10(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "__updatedStatusWithEvent:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100029D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5;
  NSObject *v6;
  _QWORD block[9];

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029DAC;
  block[3] = &unk_1000D5E60;
  block[4] = a2;
  block[5] = a3;
  *(double *)&block[8] = a5;
  block[6] = a4;
  block[7] = v5;
  dispatch_async(v6, block);
}

void sub_100029DAC(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 36);
  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("UUID"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("CompletedDiagnosticsTest"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("NextDiagnosticsTest"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 64)), CFSTR("PercentComplete"));
  objc_msgSend(v3, "setInfo:", v4);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "__completedDiagnosticsTest:", v3);
  objc_autoreleasePoolPop(v2);
}

void sub_100029E98(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD block[5];
  __int128 v4;

  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029F00;
  block[3] = &unk_1000D5EB0;
  block[4] = a2;
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, block);
}

void sub_100029F00(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addEvent:", a1[4]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "__updatedStatusWithEvent:", a1[4]);
  objc_autoreleasePoolPop(v2);
}

void sub_100029F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5;
  NSObject *v6;
  _QWORD block[9];

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029FB0;
  block[3] = &unk_1000D5E60;
  block[4] = a2;
  block[5] = a3;
  *(double *)&block[8] = a5;
  block[6] = a4;
  block[7] = v5;
  dispatch_async(v6, block);
}

void sub_100029FB0(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 37);
  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("UUID"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("CollectedLogItem"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("NextLogItem"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 64)), CFSTR("PercentComplete"));
  objc_msgSend(v3, "setInfo:", v4);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "__collectedLogItem:", v3);
  objc_autoreleasePoolPop(v2);
}

void sub_10002A09C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A0FC;
  block[3] = &unk_1000D5F28;
  block[5] = a3;
  block[6] = v3;
  block[4] = a2;
  dispatch_async(v4, block);
}

void sub_10002A0FC(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "__collectLogItem:reply:", a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

void sub_10002A138(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD block[5];
  __int128 v4;

  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A1A0;
  block[3] = &unk_1000D5EB0;
  block[4] = a2;
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, block);
}

void sub_10002A1A0(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addEvent:", a1[4]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "__updatedStatusWithEvent:", a1[4]);
  objc_autoreleasePoolPop(v2);
}

void sub_10002A1EC(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD block[5];
  __int128 v4;

  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A254;
  block[3] = &unk_1000D5EB0;
  block[4] = a2;
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, block);
}

void sub_10002A254(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addEvent:", a1[4]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "__updatedStatusWithEvent:", a1[4]);
  objc_autoreleasePoolPop(v2);
}

void sub_10002A2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002A2FC;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10002A2FC(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = objc_autoreleasePoolPush();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(v8, "eventIDs"), "containsObject:", &off_1000E2E80))
          objc_msgSend(objc_msgSend(objc_msgSend(v8, "connection"), "remoteObjectProxy"), "receivedEvent:", *(_QWORD *)(a1 + 40));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "handlePeerFaultEvent:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10002A494(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusMonitoring");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  objc_autoreleasePoolPop(v2);
}

void sub_10002A530(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusMonitoring");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  objc_autoreleasePoolPop(v2);
}

void sub_10002A5CC(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(a1 + 32), "__localPeer");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v4 && objc_msgSend(v4, "localIDSIdentifier"))
    objc_msgSend(v3, "setPeerID:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "localIDSIdentifier"));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
  objc_autoreleasePoolPop(v2);
}

void sub_10002A6A8(_QWORD *a1)
{
  void *v2;
  W5PeerStatusRequest *v3;
  uint64_t v4;
  W5PeerStatusRequest *v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;
  _QWORD v11[5];

  v2 = objc_autoreleasePoolPush();
  if (a1[4])
  {
    v3 = [W5PeerStatusRequest alloc];
    v4 = a1[4];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002A7B8;
    v11[3] = &unk_1000D5FA0;
    v11[4] = a1[6];
    v5 = -[W5PeerStatusRequest initWithPeer:reply:](v3, "initWithPeer:reply:", v4, v11);
    v6 = objc_msgSend(*(id *)(a1[5] + 80), "queryStatusForPeerWithRequest:", v5);
    if (v6)
    {
      v7 = v6;
      v8 = a1[6];
      if (v8)
        (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v7, 0);
    }
    if (v5)
      CFRelease(v5);
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002A7CC;
    v9[3] = &unk_1000D5FF0;
    v10 = *(_OWORD *)(a1 + 5);
    objc_msgSend((id)v10, "__queryStatusAndReply:", v9);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002A7B8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10002A7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002A824;
  v5[3] = &unk_1000D5FC8;
  v5[4] = a3;
  v5[5] = v3;
  dispatch_async(v4, v5);
}

void sub_10002A824(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002A8C0(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  W5PeerDatabaseRequest *v7;
  uint64_t v8;
  uint64_t v9;
  W5PeerDatabaseRequest *v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[5];

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)a1[4];
  if (!v3
    || *(_QWORD *)(a1[5] + 176)
    && (objc_msgSend(objc_msgSend(v3, "peerID"), "isEqualToString:", objc_msgSend(*(id *)(a1[5] + 176), "peerID")) & 1) != 0)
  {
    v4 = (void *)a1[5];
    v5 = a1[6];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002AA14;
    v14[3] = &unk_1000D6040;
    v6 = a1[7];
    v14[4] = v4;
    v14[5] = v6;
    objc_msgSend(v4, "__queryDatabaseAndReply:reply:", v5, v14);
  }
  else
  {
    v7 = [W5PeerDatabaseRequest alloc];
    v8 = a1[4];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002AA00;
    v15[3] = &unk_1000D6018;
    v9 = a1[6];
    v15[4] = a1[7];
    v10 = -[W5PeerDatabaseRequest initWithPeer:fetch:reply:](v7, "initWithPeer:fetch:reply:", v8, v9, v15);
    v11 = objc_msgSend(*(id *)(a1[5] + 80), "queryDatabaseForPeerWithRequest:", v10);
    if (v11)
    {
      v12 = v11;
      v13 = a1[7];
      if (v13)
        (*(void (**)(uint64_t, id, _QWORD))(v13 + 16))(v13, v12, 0);
    }
    if (v10)
      CFRelease(v10);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002AA00(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10002AA14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AA70;
  block[3] = &unk_1000D60B8;
  block[5] = a3;
  block[6] = v3;
  block[4] = a2;
  dispatch_async(v4, block);
}

void sub_10002AA70(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];
  __int128 v11;
  uint64_t v12;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[4];
  v4 = sub_10008F56C();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = a1[4];
      *(_DWORD *)v10 = 136315906;
      *(_QWORD *)&v10[4] = "-[W5Engine xpcConnection:queryDatabaseForPeer:fetch:reply:]_block_invoke_4";
      *(_WORD *)&v10[12] = 2080;
      *(_QWORD *)&v10[14] = "W5Engine.m";
      *(_WORD *)&v10[22] = 1024;
      LODWORD(v11) = 1057;
      WORD2(v11) = 2112;
      *(_QWORD *)((char *)&v11 + 6) = v6;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) W5Engine __queryDatabaseAndReply has error %@", v10, 38, *(_OWORD *)v10, *(_QWORD *)&v10[16], v11, v12);
    }
  }
  else if (v5)
  {
    v8 = a1[5];
    v7 = a1[6];
    *(_DWORD *)v10 = 136316162;
    *(_QWORD *)&v10[4] = "-[W5Engine xpcConnection:queryDatabaseForPeer:fetch:reply:]_block_invoke";
    *(_WORD *)&v10[12] = 2080;
    *(_QWORD *)&v10[14] = "W5Engine.m";
    *(_WORD *)&v10[22] = 1024;
    LODWORD(v11) = 1059;
    WORD2(v11) = 2112;
    *(_QWORD *)((char *)&v11 + 6) = v7;
    HIWORD(v11) = 2112;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) W5Engine __queryDatabaseAndReply ok %@ reply %@", v10, 48, *(_OWORD *)v10, *(_QWORD *)&v10[16], v11, v8);
  }
  v9 = a1[6];
  if (v9)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

void sub_10002AC68(_QWORD *a1)
{
  void *v2;
  W5PeerFileRequest *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  W5PeerFileRequest *v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];

  v2 = objc_autoreleasePoolPush();
  v3 = [W5PeerFileRequest alloc];
  v4 = a1[4];
  v5 = a1[5];
  v12[0] = _NSConcreteStackBlock;
  v12[2] = sub_10002AD34;
  v12[3] = &unk_1000D6018;
  v6 = a1[7];
  v7 = *(_QWORD *)(a1[6] + 96);
  v12[1] = 3221225472;
  v12[4] = v6;
  v8 = -[W5PeerFileRequest initWithPeer:requestType:remotePath:transferManager:reply:](v3, "initWithPeer:requestType:remotePath:transferManager:reply:", v4, 1, v5, v7, v12);
  v9 = objc_msgSend(*(id *)(a1[6] + 80), "requestFileFromPeerWithRequest:", v8);
  if (v9)
  {
    v10 = v9;
    v11 = a1[7];
    if (v11)
      (*(void (**)(uint64_t, id, _QWORD))(v11 + 16))(v11, v10, 0);
  }
  if (v8)
    CFRelease(v8);
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002AD34(uint64_t result, uint64_t a2, void *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(result + 32);
  if (v3)
    return (*(uint64_t (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, objc_msgSend(a3, "firstObject"));
  return result;
}

void sub_10002ADD8(_QWORD *a1)
{
  void *v2;
  W5PeerFileRequest *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  W5PeerFileRequest *v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];

  v2 = objc_autoreleasePoolPush();
  v3 = [W5PeerFileRequest alloc];
  v4 = a1[4];
  v5 = a1[5];
  v12[0] = _NSConcreteStackBlock;
  v12[2] = sub_10002AEA4;
  v12[3] = &unk_1000D6018;
  v6 = a1[7];
  v7 = *(_QWORD *)(a1[6] + 96);
  v12[1] = 3221225472;
  v12[4] = v6;
  v8 = -[W5PeerFileRequest initWithPeer:requestType:remotePath:transferManager:reply:](v3, "initWithPeer:requestType:remotePath:transferManager:reply:", v4, 2, v5, v7, v12);
  v9 = objc_msgSend(*(id *)(a1[6] + 80), "requestFileFromPeerWithRequest:", v8);
  if (v9)
  {
    v10 = v9;
    v11 = a1[7];
    if (v11)
      (*(void (**)(uint64_t, id, _QWORD))(v11 + 16))(v11, v10, 0);
  }
  if (v8)
    CFRelease(v8);
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002AEA4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10002AF14(_QWORD *a1)
{
  void *v2;
  W5PeerDebugConfigurationRequest *v3;
  uint64_t v4;
  W5PeerDebugConfigurationRequest *v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;
  _QWORD v11[5];

  v2 = objc_autoreleasePoolPush();
  if (a1[4])
  {
    v3 = [W5PeerDebugConfigurationRequest alloc];
    v4 = a1[4];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002B02C;
    v11[3] = &unk_1000D6090;
    v11[4] = a1[6];
    v5 = -[W5PeerDebugConfigurationRequest initWithPeer:type:debugConfiguration:reply:](v3, "initWithPeer:type:debugConfiguration:reply:", v4, 1, 0, v11);
    v6 = objc_msgSend(*(id *)(a1[5] + 80), "sendDebugConfigurationForPeerWithRequest:", v5);
    if (v6)
    {
      v7 = v6;
      v8 = a1[6];
      if (v8)
        (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v7, 0);
    }
    if (v5)
      CFRelease(v5);
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002B040;
    v9[3] = &unk_1000D60E0;
    v10 = *(_OWORD *)(a1 + 5);
    objc_msgSend((id)v10, "__queryDebugConfigurationAndReply:", v9);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002B02C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10002B040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B09C;
  block[3] = &unk_1000D60B8;
  block[5] = a3;
  block[6] = v3;
  block[4] = a2;
  dispatch_async(v4, block);
}

void sub_10002B09C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

void sub_10002B134(_QWORD *a1)
{
  void *v2;
  W5PeerDebugConfigurationRequest *v3;
  uint64_t v4;
  uint64_t v5;
  W5PeerDebugConfigurationRequest *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  __int128 v12;
  _QWORD v13[5];

  v2 = objc_autoreleasePoolPush();
  if (a1[4])
  {
    v3 = [W5PeerDebugConfigurationRequest alloc];
    v4 = a1[4];
    v5 = a1[5];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002B248;
    v13[3] = &unk_1000D6090;
    v13[4] = a1[7];
    v6 = -[W5PeerDebugConfigurationRequest initWithPeer:type:debugConfiguration:reply:](v3, "initWithPeer:type:debugConfiguration:reply:", v4, 2, v5, v13);
    v7 = objc_msgSend(*(id *)(a1[6] + 80), "sendDebugConfigurationForPeerWithRequest:", v6);
    if (v7)
    {
      v8 = v7;
      v9 = a1[7];
      if (v9)
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);
    }
    if (v6)
      CFRelease(v6);
  }
  else
  {
    v10 = a1[5];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002B25C;
    v11[3] = &unk_1000D6108;
    v12 = *((_OWORD *)a1 + 3);
    objc_msgSend((id)v12, "__setDebugConfiguration:reply:", v10, v11);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002B248(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10002B25C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B2B4;
  v4[3] = &unk_1000D5FC8;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002B2B4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002B350(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  void *context;
  _QWORD v24[4];
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  int v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  unsigned int v44;
  __int16 v45;
  uint64_t v46;

  context = objc_autoreleasePoolPush();
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v3 = v2;
  v4 = sub_10008F56C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "UUIDString"), "substringToIndex:", 5);
    v6 = objc_msgSend(*(id *)(a1 + 40), "processName");
    v7 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "processIdentifier");
    v8 = *(_QWORD *)(a1 + 48);
    v33 = 136316674;
    v34 = "-[W5Engine xpcConnection:runDiagnostics:configuration:uuid:reply:]_block_invoke";
    v35 = 2080;
    v36 = "W5Engine.m";
    v37 = 1024;
    v38 = 1181;
    v39 = 2114;
    v40 = (uint64_t)v5;
    v41 = 2114;
    v42 = v6;
    v43 = 1024;
    v44 = v7;
    v45 = 2114;
    v46 = v8;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) RECEIVED DIAGNOSTICS REQUEST (uuid=%{public}@) from %{public}@ (%d) with configuration %{public}@ and items:", &v33, 64);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = a1;
  v9 = *(void **)(a1 + 56);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v15 = sub_10008F56C();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = W5DescriptionForDiagnosticsTestID(objc_msgSend(v14, "testID"));
          v17 = objc_msgSend(v14, "testID");
          v33 = 136316162;
          v34 = "-[W5Engine xpcConnection:runDiagnostics:configuration:uuid:reply:]_block_invoke";
          v35 = 2080;
          v36 = "W5Engine.m";
          v37 = 1024;
          v38 = 1184;
          v39 = 2114;
          v40 = v16;
          v41 = 2048;
          v42 = v17;
          LODWORD(v21) = 48;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) TEST: %{public}@ (%ld)", &v33, v21);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }
  v19 = *(_QWORD *)(v22 + 48);
  v18 = *(_QWORD *)(v22 + 56);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002B670;
  v24[3] = &unk_1000D6158;
  v20 = *(_OWORD *)(v22 + 64);
  v25 = *(_OWORD *)(v22 + 32);
  v26 = v20;
  v27 = v3;
  objc_msgSend((id)v20, "__runDiagnostics:configuration:uuid:reply:", v18, v19, (_QWORD)v25, v24);
  objc_autoreleasePoolPop(context);
}

void sub_10002B670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  id v7;
  id v8;
  unsigned int v9;
  double v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  _QWORD block[7];
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  double v29;

  v6 = sub_10008F56C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "UUIDString"), "substringToIndex:", 5);
    v8 = objc_msgSend(*(id *)(a1 + 40), "processName");
    v9 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "processIdentifier");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v11 = v10 - *(double *)(a1 + 64);
    v16 = 136316674;
    v17 = "-[W5Engine xpcConnection:runDiagnostics:configuration:uuid:reply:]_block_invoke";
    v18 = 2080;
    v19 = "W5Engine.m";
    v20 = 1024;
    v21 = 1189;
    v22 = 2114;
    v23 = v7;
    v24 = 2114;
    v25 = v8;
    v26 = 1024;
    v27 = v9;
    v28 = 2048;
    v29 = v11;
    v14 = 64;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) COMPLETED DIAGNOSTICS REQUEST (uuid=%{public}@) from %{public}@ (%d), took %.6fs", &v16, v14);
  }
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B81C;
  block[3] = &unk_1000D60B8;
  block[5] = a3;
  block[6] = v12;
  block[4] = a2;
  dispatch_async(v13, block);
}

void sub_10002B81C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002BB94(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10002BEA4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD v10[4];
  __int128 v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  uint64_t v25;

  v2 = objc_autoreleasePoolPush();
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "substringToIndex:", 5);
    v5 = objc_msgSend(*(id *)(a1 + 32), "processName");
    v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "connection"), "processIdentifier");
    v7 = *(_QWORD *)(a1 + 40);
    v12 = 136316674;
    v13 = "-[W5Engine xpcConnection:startDiagnosticsModeWithConfiguration:reply:]_block_invoke";
    v14 = 2080;
    v15 = "W5Engine.m";
    v16 = 1024;
    v17 = 1250;
    v18 = 2114;
    v19 = v4;
    v20 = 2114;
    v21 = v5;
    v22 = 1024;
    v23 = v6;
    v24 = 2114;
    v25 = v7;
    v9 = 64;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) RECEIVED START DIAGNOSTICS MODE (uuid=%{public}@) from %{public}@ (%d) with configuration: %{public}@", &v12, v9);
  }
  v8 = *(_QWORD *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002C040;
  v10[3] = &unk_1000D61A8;
  v11 = *(_OWORD *)(a1 + 48);
  objc_msgSend(*(id *)(v11 + 112), "startDiagnosticsModeWithConfiguration:reply:", v8, v10);
  objc_autoreleasePoolPop(v2);
}

void sub_10002C040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C09C;
  block[3] = &unk_1000D60B8;
  block[5] = a3;
  block[6] = v3;
  block[4] = a2;
  dispatch_async(v4, block);
}

void sub_10002C09C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

void sub_10002C138(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD v11[4];
  __int128 v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  uint64_t v26;

  v2 = objc_autoreleasePoolPush();
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "UUIDString"), "substringToIndex:", 5);
    v5 = objc_msgSend(*(id *)(a1 + 40), "processName");
    v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "processIdentifier");
    v7 = *(_QWORD *)(a1 + 48);
    v13 = 136316674;
    v14 = "-[W5Engine xpcConnection:stopDiagnosticsModeWithUUID:info:reply:]_block_invoke";
    v15 = 2080;
    v16 = "W5Engine.m";
    v17 = 1024;
    v18 = 1269;
    v19 = 2114;
    v20 = v4;
    v21 = 2114;
    v22 = v5;
    v23 = 1024;
    v24 = v6;
    v25 = 2114;
    v26 = v7;
    v10 = 64;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) RECEIVED STOP DIAGNOSTICS MODE (uuid=%{public}@) from %{public}@ (%d) with configuration: %{public}@", &v13, v10);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002C2D4;
  v11[3] = &unk_1000D6108;
  v12 = *(_OWORD *)(a1 + 56);
  objc_msgSend(*(id *)(v12 + 112), "stopDiagnosticsModeWithUUID:info:reply:", v8, v9, v11);
  objc_autoreleasePoolPop(v2);
}

void sub_10002C2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002C32C;
  v4[3] = &unk_1000D5FC8;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002C32C(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002C3C8(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  _QWORD v15[5];
  _QWORD block[6];
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  uint64_t v30;

  v2 = objc_autoreleasePoolPush();
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "substringToIndex:", 5);
    v5 = objc_msgSend(*(id *)(a1 + 32), "processName");
    v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "connection"), "processIdentifier");
    v7 = *(_QWORD *)(a1 + 40);
    v17 = 136316674;
    v18 = "-[W5Engine xpcConnection:queryDiagnosticsModeForPeer:info:reply:]_block_invoke";
    v19 = 2080;
    v20 = "W5Engine.m";
    v21 = 1024;
    v22 = 1288;
    v23 = 2114;
    v24 = v4;
    v25 = 2114;
    v26 = v5;
    v27 = 1024;
    v28 = v6;
    v29 = 2114;
    v30 = v7;
    v14 = 64;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) RECEIVED QUERY DIAGNOSTICS MODE (uuid=%{public}@) from %{public}@ (%d) with configuration: %{public}@", &v17, v14);
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002C634;
    v15[3] = &unk_1000D61F8;
    v15[4] = v8;
    v10 = v15;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Filter"))
      && objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Filter")), "integerValue") == (id)2)
    {
      v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 112), "allDiagnostics");
    }
    else
    {
      v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 112), "activeDiagnostics");
    }
    v12 = *(_QWORD *)(a1 + 64);
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002C5F4;
    block[3] = &unk_1000D5FC8;
    block[4] = v11;
    block[5] = v12;
    v10 = block;
    v9 = v13;
  }
  dispatch_async(v9, v10);
  objc_autoreleasePoolPop(v2);
}

void sub_10002C5F4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002C634(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSErrorUserInfoKey v4;
  const __CFString *v5;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = NSLocalizedFailureReasonErrorKey;
    v5 = CFSTR("W5NotSupportedErr");
    (*(void (**)(uint64_t, NSError *, _QWORD))(v3 + 16))(v3, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 4, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1)), 0);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002C768(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  unsigned int v19;
  id v20;
  id v21;
  NSString *v22;
  id v23;
  id v24;
  id v25;
  const __CFString *v26;
  NSString *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  void *context;
  _QWORD v39[4];
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  int v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  id v57;
  __int16 v58;
  unsigned int v59;
  __int16 v60;
  uint64_t v61;

  context = objc_autoreleasePoolPush();
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v3 = v2;
  v4 = sub_10008F56C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "UUIDString"), "substringToIndex:", 5);
    v6 = objc_msgSend(*(id *)(a1 + 40), "processName");
    v7 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "processIdentifier");
    v8 = *(_QWORD *)(a1 + 48);
    v48 = 136316674;
    v49 = "-[W5Engine xpcConnection:collectLogs:configuration:uuid:reply:]_block_invoke";
    v50 = 2080;
    v51 = "W5Engine.m";
    v52 = 1024;
    v53 = 1321;
    v54 = 2114;
    v55 = (uint64_t)v5;
    v56 = 2114;
    v57 = v6;
    v58 = 1024;
    v59 = v7;
    v60 = 2114;
    v61 = v8;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) RECEIVED LOG REQUEST (uuid=%{public}@) from %{public}@ (%d) with configuration %{public}@ and items:", &v48, 64);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v37 = a1;
  v9 = *(void **)(a1 + 56);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v15 = sub_10008F56C();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = W5DescriptionForLogItemID(objc_msgSend(v14, "itemID"));
          v17 = objc_msgSend(v14, "itemID");
          v48 = 136316162;
          v49 = "-[W5Engine xpcConnection:collectLogs:configuration:uuid:reply:]_block_invoke";
          v50 = 2080;
          v51 = "W5Engine.m";
          v52 = 1024;
          v53 = 1324;
          v54 = 2114;
          v55 = v16;
          v56 = 2048;
          v57 = v17;
          LODWORD(v36) = 48;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) LOG ITEM: %{public}@ (%ld)", &v48, v36);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v11);
  }
  v18 = objc_msgSend(*(id *)(v37 + 64), "__localPeer");
  v19 = objc_msgSend(objc_msgSend(*(id *)(v37 + 48), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v20 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v20, "setDateFormat:", CFSTR("yyyy-MM-dd_HH.mm.ss.SSS"));
  v21 = objc_msgSend(v20, "stringFromDate:", +[NSDate date](NSDate, "date"));
  v22 = (NSString *)objc_msgSend(*(id *)(v37 + 48), "objectForKeyedSubscript:", CFSTR("Reason"));
  if (!v22)
    v22 = -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.WiFiVelocity")), "localizedStringForKey:value:table:", CFSTR("kW5LocWiFiDiagnosticsName"), CFSTR("WiFiDiagnostics"), 0);
  v23 = objc_msgSend(v18, "os");
  v24 = objc_msgSend(v18, "model");
  v25 = objc_msgSend(v18, "build");
  v26 = &stru_1000D8750;
  if (v19)
    v26 = CFSTR(".tgz");
  v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@_%@_%@_%@%@"), v22, v21, v23, v24, v25, v26);
  v28 = getuid();
  v29 = getgid();
  v31 = *(_QWORD *)(v37 + 56);
  v30 = *(void **)(v37 + 64);
  v32 = *(_QWORD *)(v37 + 48);
  v33 = objc_msgSend(*(id *)(v37 + 40), "additionalLog");
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10002CBC4;
  v39[3] = &unk_1000D6248;
  v34 = *(_OWORD *)(v37 + 32);
  v42 = v3;
  v35 = *(_OWORD *)(v37 + 64);
  v40 = v34;
  v41 = v35;
  objc_msgSend(v30, "__collectLogs:configuration:additionalLog:filename:uid:gid:uuid:reply:", v31, v32, v33, v27, v28, v29, (_QWORD)v34, v39);
  objc_autoreleasePoolPop(context);
}

void sub_10002CBC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v8;
  id v9;
  id v10;
  unsigned int v11;
  double v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  _QWORD block[8];
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  double v31;
  __int16 v32;
  uint64_t v33;

  v8 = sub_10008F56C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "UUIDString"), "substringToIndex:", 5);
    v10 = objc_msgSend(*(id *)(a1 + 40), "processName");
    v11 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "processIdentifier");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v13 = v12 - *(double *)(a1 + 64);
    v18 = 136316930;
    v19 = "-[W5Engine xpcConnection:collectLogs:configuration:uuid:reply:]_block_invoke";
    v20 = 2080;
    v21 = "W5Engine.m";
    v22 = 1024;
    v23 = 1348;
    v24 = 2114;
    v25 = v9;
    v26 = 2114;
    v27 = v10;
    v28 = 1024;
    v29 = v11;
    v30 = 2048;
    v31 = v13;
    v32 = 2114;
    v33 = a4;
    v16 = 74;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) COMPLETED LOG REQUEST (uuid=%{public}@) from %{public}@ (%d), took %.6fs, outputURL='%{public}@'", &v18, v16);
  }
  v14 = *(_QWORD *)(a1 + 56);
  v15 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CD84;
  block[3] = &unk_1000D6220;
  block[4] = a2;
  block[5] = a3;
  block[6] = a4;
  block[7] = v14;
  dispatch_async(v15, block);
}

void sub_10002CD84(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[7];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5], a1[6]);
  objc_autoreleasePoolPop(v2);
}

void sub_10002CE24(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  id v6;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSString *v12;
  __CFString *v13;
  id v14;
  id v15;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  NSString *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  unsigned int v25;
  void *context;
  _QWORD v27[4];
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  int v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  id v44;

  context = objc_autoreleasePoolPush();
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v3 = v2;
  v4 = sub_10008F56C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(objc_msgSend(a1[4], "UUIDString"), "substringToIndex:", 5);
    v6 = objc_msgSend(a1[5], "processName");
    v7 = objc_msgSend(objc_msgSend(a1[5], "connection"), "processIdentifier");
    v8 = a1[6];
    v31 = 136316674;
    v32 = "-[W5Engine xpcConnection:collectLogsDiagnosticMode:uuid:reply:]_block_invoke";
    v33 = 2080;
    v34 = "W5Engine.m";
    v35 = 1024;
    v36 = 1365;
    v37 = 2114;
    v38 = v5;
    v39 = 2114;
    v40 = v6;
    v41 = 1024;
    v42 = v7;
    v43 = 2114;
    v44 = v8;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) RECEIVED LOG REQUEST (uuid=%{public}@) from %{public}@ (%d) with configuration %{public}@", &v31, 64);
  }
  v9 = objc_msgSend(a1[7], "__localPeer");
  v25 = objc_msgSend(objc_msgSend(a1[6], "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v10 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v10, "setDateFormat:", CFSTR("yyyy.MM.dd_HH-mm-ssZZZZZ"));
  objc_msgSend(v10, "setTimeZone:", +[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
  v11 = objc_msgSend(objc_msgSend(v10, "stringFromDate:", +[NSDate date](NSDate, "date")), "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), &stru_1000D8750);
  v12 = (NSString *)objc_msgSend(a1[6], "objectForKeyedSubscript:", CFSTR("Reason"));
  if (!v12)
    v12 = -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.WiFiVelocity")), "localizedStringForKey:value:table:", CFSTR("kW5LocWiFiNetworkDiagnosticsName"), CFSTR("WiFiNetworkDiagnostics"), 0);
  if (objc_msgSend(objc_msgSend(v9, "model"), "containsString:", CFSTR("AudioAccessory")))
    v13 = (__CFString *)objc_msgSend(objc_msgSend(v9, "name"), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1000D8750);
  else
    v13 = &stru_1000D8750;
  if ((unint64_t)-[__CFString length](v13, "length") >= 9)
    v13 = (__CFString *)-[__CFString substringToIndex:](v13, "substringToIndex:", 8);
  v14 = objc_msgSend(objc_msgSend(v9, "os"), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("-"));
  v15 = objc_msgSend(v9, "model");
  if (-[__CFString length](v13, "length"))
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_%@"), v13);
  else
    v16 = &stru_1000D8750;
  v17 = objc_msgSend(v9, "build");
  v18 = CFSTR(".tgz");
  if (!v25)
    v18 = &stru_1000D8750;
  v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@_%@_%@%@_%@%@"), v12, v11, v14, v15, v16, v17, v18);
  v20 = getuid();
  v21 = getgid();
  v22 = a1[6];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002D1E4;
  v27[3] = &unk_1000D6248;
  v23 = *((_OWORD *)a1 + 2);
  v30 = v3;
  v24 = *(_OWORD *)(a1 + 7);
  v28 = v23;
  v29 = v24;
  objc_msgSend((id)v24, "__collectLogsDiagnosticMode:outputName:uid:gid:uuid:reply:", v22, v19, v20, v21, (_QWORD)v23, v27);
  objc_autoreleasePoolPop(context);
}

void sub_10002D1E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v8;
  id v9;
  id v10;
  unsigned int v11;
  double v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  _QWORD block[8];
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  double v31;
  __int16 v32;
  uint64_t v33;

  v8 = sub_10008F56C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "UUIDString"), "substringToIndex:", 5);
    v10 = objc_msgSend(*(id *)(a1 + 40), "processName");
    v11 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "processIdentifier");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v13 = v12 - *(double *)(a1 + 64);
    v18 = 136316930;
    v19 = "-[W5Engine xpcConnection:collectLogsDiagnosticMode:uuid:reply:]_block_invoke";
    v20 = 2080;
    v21 = "W5Engine.m";
    v22 = 1024;
    v23 = 1394;
    v24 = 2114;
    v25 = v9;
    v26 = 2114;
    v27 = v10;
    v28 = 1024;
    v29 = v11;
    v30 = 2048;
    v31 = v13;
    v32 = 2114;
    v33 = a4;
    v16 = 74;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) COMPLETED LOG REQUEST (uuid=%{public}@) from %{public}@ (%d), took %.6fs, outputURL='%{public}@'", &v18, v16);
  }
  v14 = *(_QWORD *)(a1 + 56);
  v15 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D3A4;
  block[3] = &unk_1000D6220;
  block[4] = a2;
  block[5] = a3;
  block[6] = a4;
  block[7] = v14;
  dispatch_async(v15, block);
}

void sub_10002D3A4(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[7];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5], a1[6]);
  objc_autoreleasePoolPop(v2);
}

void sub_10002D448(double *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[7];
  _QWORD v13[10];
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[6];

  v2 = objc_autoreleasePoolPush();
  v3 = *((_QWORD *)a1 + 4);
  if (v3)
  {
    v4 = (void *)*((_QWORD *)a1 + 5);
    v5 = *((_QWORD *)a1 + 6);
    v6 = a1[9];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002D63C;
    v18[3] = &unk_1000D6298;
    v7 = *((_QWORD *)a1 + 8);
    v18[4] = v4;
    v18[5] = v7;
    objc_msgSend(v4, "__runWiFiSnifferOnPeer:channels:duration:uuid:reply:", v3, v5, 0, v18, v6);
  }
  else
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3052000000;
    v16[3] = sub_100028258;
    v16[4] = sub_100028268;
    v17 = 0;
    v17 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3052000000;
    v14[3] = sub_100028258;
    v14[4] = sub_100028268;
    v15 = 0;
    v15 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
    v8 = dispatch_group_create();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002D6DC;
    v13[3] = &unk_1000D62E8;
    v10 = *((_QWORD *)a1 + 5);
    v9 = (void *)*((_QWORD *)a1 + 6);
    v13[4] = v8;
    v13[5] = v10;
    *(double *)&v13[9] = a1[9];
    *(double *)&v13[6] = a1[7];
    v13[7] = v16;
    v13[8] = v14;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);
    v11 = *(NSObject **)(*((_QWORD *)a1 + 5) + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002D7BC;
    block[3] = &unk_1000D6310;
    *(double *)&block[4] = a1[8];
    block[5] = v16;
    block[6] = v14;
    dispatch_group_notify(v8, v11, block);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002D610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10002D63C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  NSObject *v6;
  _QWORD block[9];

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D69C;
  block[3] = &unk_1000D6270;
  block[7] = a5;
  block[8] = v5;
  block[4] = a2;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(v6, block);
}

void sub_10002D69C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[8];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5], a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

id sub_10002D6DC(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  __int128 v12;

  if (a3 == 1)
    *a4 = 1;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6 = *(double *)(a1 + 72);
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002D770;
  v11[3] = &unk_1000D62C0;
  v12 = *(_OWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 32);
  v11[4] = a2;
  v11[5] = v9;
  return objc_msgSend(v7, "__runWiFiSnifferOnChannel:duration:uuid:tcpDump:reply:", a2, v8, 0, v11, v6);
}

void sub_10002D770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    a3 = a2;
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  objc_msgSend(v5, "setObject:forKey:", a3, v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_10002D7BC(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 0);
  return result;
}

void sub_10002D854(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  id v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[6];

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v6 = *(double *)(a1 + 72);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002D940;
    v13[3] = &unk_1000D6298;
    v7 = *(_QWORD *)(a1 + 64);
    v13[4] = v4;
    v13[5] = v7;
    objc_msgSend(v4, "__runWiFiSnifferOnPeer:channels:duration:uuid:reply:", v3, v5, 0, v13, v6);
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:");
    v9 = *(double *)(a1 + 72);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002D9F0;
    v12[3] = &unk_1000D6360;
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 64);
    v12[4] = *(_QWORD *)(a1 + 40);
    v12[5] = v11;
    objc_msgSend(v4, "__runWiFiSnifferOnChannel:duration:uuid:tcpDump:reply:", v8, v10, 1, v12, v9);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002D940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  NSObject *v5;
  _QWORD block[7];

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D99C;
  block[3] = &unk_1000D60B8;
  block[5] = a4;
  block[6] = v4;
  block[4] = a2;
  dispatch_async(v5, block);
}

void sub_10002D99C(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "allValues"));
  objc_autoreleasePoolPop(v2);
}

void sub_10002D9F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DA4C;
  block[3] = &unk_1000D60B8;
  block[5] = a3;
  block[6] = v3;
  block[4] = a2;
  dispatch_async(v4, block);
}

void sub_10002DA4C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[6];
  if (v3)
  {
    v4 = a1[4];
    v5 = a1[5];
    (*(void (**)(uint64_t, uint64_t, NSArray *))(v3 + 16))(v3, v4, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002DB4C(uint64_t a1)
{
  void *v2;
  W5PeerDiscoveryRequest *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  __int128 v8;

  v2 = objc_autoreleasePoolPush();
  v3 = [W5PeerDiscoveryRequest alloc];
  v4 = *(_QWORD *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002DBF8;
  v7[3] = &unk_1000D6388;
  v8 = *(_OWORD *)(a1 + 40);
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 80), "startPeerDiscoveryWithRequest:", -[W5PeerDiscoveryRequest initWithConfiguration:uuid:handler:](v3, "initWithConfiguration:uuid:handler:", v4, (_QWORD)v8, v7));
  v6 = *(_QWORD *)(a1 + 64);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002DBF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  uint64_t result;
  NSObject *v9;
  const char *v10;
  const __CFString *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  if (a2 | a3)
  {
    v6 = objc_alloc((Class)W5PeerDiscoveryEvent);
    v7 = *(_QWORD *)(a1 + 32);
    v11 = CFSTR("UUID");
    v12 = v7;
    return (uint64_t)objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "remoteObjectProxy"), "receivedPeerDiscoveryEvent:", objc_msgSend(v6, "initWithPeersFound:peersLost:info:", a2, a3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
  else
  {
    v9 = sub_10008F56C();
    result = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
    {
      v13 = 136315650;
      v14 = "-[W5Engine xpcConnection:startPeerDiscoveryWithConfiguration:uuid:reply:]_block_invoke_2";
      v15 = 2080;
      v16 = "W5Engine.m";
      v17 = 1024;
      v18 = 1482;
      LODWORD(v10) = 28;
      return _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) not sending peer discovery event, no peers found/lost", (const char *)&v13, v10, (_DWORD)v11);
    }
  }
  return result;
}

void sub_10002DDB4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__cancelPeerDiscoveryWithUUID:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  objc_autoreleasePoolPop(v2);
}

void sub_10002DF48(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)a1[4];
  v4 = a1[5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002DFBC;
  v7[3] = &unk_1000D6108;
  v5 = a1[6];
  v6 = a1[7];
  v7[4] = v3;
  v7[5] = v6;
  objc_msgSend(v3, "__runWiFiPerfLoggingWithConfiguration:uuid:reply:", v4, v5, v7);
  objc_autoreleasePoolPop(v2);
}

void sub_10002DFBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002E014;
  v4[3] = &unk_1000D5FC8;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002E014(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002E0AC(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[6];

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)a1[4];
  v4 = a1[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002E120;
  v6[3] = &unk_1000D6108;
  v5 = a1[6];
  v6[4] = v3;
  v6[5] = v5;
  objc_msgSend(v3, "__cancelDiagnosticsWithUUID:reply:", v4, v6);
  objc_autoreleasePoolPop(v2);
}

void sub_10002E120(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002E178;
  v4[3] = &unk_1000D5FC8;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002E178(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002E210(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[6];

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)a1[4];
  v4 = a1[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002E284;
  v6[3] = &unk_1000D6108;
  v5 = a1[6];
  v6[4] = v3;
  v6[5] = v5;
  objc_msgSend(v3, "__cancelCollectLogsWithUUID:reply:", v4, v6);
  objc_autoreleasePoolPop(v2);
}

void sub_10002E284(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002E2DC;
  v4[3] = &unk_1000D5FC8;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002E2DC(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002E374(_QWORD *a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[6];

  v2 = objc_autoreleasePoolPush();
  if (a1[4])
  {
    v3 = objc_alloc_init((Class)W5Peer);
    objc_msgSend(v3, "setPeerID:", a1[4]);
    objc_msgSend(v3, "setDiscoveryFlags:", 1);
    objc_msgSend(v3, "setControlFlags:", 1);
    v4 = (void *)a1[5];
    v5 = a1[6];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002E470;
    v11[3] = &unk_1000D6108;
    v6 = a1[7];
    v11[4] = v4;
    v11[5] = v6;
    objc_msgSend(v4, "__cancelWiFiSnifferWithUUID:peer:reply:", v5, v3, v11);
  }
  else
  {
    v7 = (void *)a1[5];
    v8 = a1[6];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002E504;
    v10[3] = &unk_1000D6108;
    v9 = a1[7];
    v10[4] = v7;
    v10[5] = v9;
    objc_msgSend(v7, "__cancelWiFiSnifferWithUUID:reply:", v8, v10);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002E470(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002E4C8;
  v4[3] = &unk_1000D5FC8;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002E4C8(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002E504(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002E55C;
  v4[3] = &unk_1000D5FC8;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002E55C(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002E5F4(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];
  _QWORD v9[6];

  v2 = objc_autoreleasePoolPush();
  v4 = a1[4];
  v3 = (void *)a1[5];
  v5 = a1[6];
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002E6A8;
    v9[3] = &unk_1000D6108;
    v6 = a1[7];
    v9[4] = v3;
    v9[5] = v6;
    objc_msgSend(v3, "__cancelWiFiSnifferWithUUID:peer:reply:", v5, v4, v9);
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002E73C;
    v8[3] = &unk_1000D6108;
    v7 = a1[7];
    v8[4] = v3;
    v8[5] = v7;
    objc_msgSend(v3, "__cancelWiFiSnifferWithUUID:reply:", v5, v8);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002E6A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002E700;
  v4[3] = &unk_1000D5FC8;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002E700(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002E73C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002E794;
  v4[3] = &unk_1000D5FC8;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002E794(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002E82C(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[6];

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)a1[4];
  v4 = a1[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002E8A0;
  v6[3] = &unk_1000D6108;
  v5 = a1[6];
  v6[4] = v3;
  v6[5] = v5;
  objc_msgSend(v3, "__cancelWiFiPerfLoggingWithUUID:reply:", v4, v6);
  objc_autoreleasePoolPop(v2);
}

void sub_10002E8A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002E8F8;
  v4[3] = &unk_1000D5FC8;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10002E8F8(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10002E990(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[4];
  if (v3)
  {
    objc_msgSend(*(id *)(a1[5] + 184), "startMonitoringFaultEventsForPeer:reply:", v3, a1[6]);
  }
  else
  {
    v4 = a1[6];
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002EA40(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[4];
  if (v3)
  {
    objc_msgSend(*(id *)(a1[5] + 184), "stopMonitoringFaultEventsForPeer:reply:", v3, a1[6]);
  }
  else
  {
    v4 = a1[6];
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002EAF0(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 184), "submitFaultEvent:", a1[5]);
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  objc_autoreleasePoolPop(v2);
}

void sub_10002EB94(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[4];
  if (v3)
  {
    objc_msgSend(*(id *)(a1[5] + 184), "queryFaultEventCacheForPeer:reply:", v3, a1[6]);
  }
  else
  {
    v4 = a1[6];
    if (v4)
      (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, objc_msgSend(*(id *)(a1[5] + 184), "faultEventCache"));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002F108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_10002F154(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "addObject:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10002F188(uint64_t a1)
{
  id v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  uint64_t result;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "processName");
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "processIdentifier");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "effectiveUserIdentifier");
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "effectiveGroupIdentifier");
  v6 = sub_10008F56C();
  result = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
  {
    v9 = 136316674;
    v10 = "-[W5Engine listener:shouldAcceptNewConnection:]_block_invoke_2";
    v11 = 2080;
    v12 = "W5Engine.m";
    v13 = 1024;
    v14 = 1748;
    v15 = 2114;
    v16 = v2;
    v17 = 1024;
    v18 = v3;
    v19 = 1024;
    v20 = v4;
    v21 = 1024;
    v22 = v5;
    v8 = 56;
    return _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) INTERRUPTED XPC CONNECTION %{public}@ [pid=%d, euid=%d, egid=%d]", &v9, v8);
  }
  return result;
}

void sub_10002F2E8(uint64_t a1)
{
  id v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  __int128 v7;
  __int128 v8;
  NSObject *v9;
  int v10;
  _QWORD block[4];
  __int128 v12;
  __int128 v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "processName");
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "processIdentifier");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "effectiveUserIdentifier");
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "effectiveGroupIdentifier");
  v6 = sub_10008F56C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136316674;
    v15 = "-[W5Engine listener:shouldAcceptNewConnection:]_block_invoke";
    v16 = 2080;
    v17 = "W5Engine.m";
    v18 = 1024;
    v19 = 1760;
    v20 = 2114;
    v21 = v2;
    v22 = 1024;
    v23 = v3;
    v24 = 1024;
    v25 = v4;
    v26 = 1024;
    v27 = v5;
    v10 = 56;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) INVALIDATED XPC CONNECTION %{public}@ [pid=%d, euid=%d, egid=%d]", &v14, v10);
  }
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 48);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_10002F48C;
  block[3] = &unk_1000D63D8;
  v12 = v7;
  v13 = v8;
  dispatch_async(v9, block);
}

void sub_10002F48C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];

  v2 = objc_autoreleasePoolPush();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "activeRequests");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        switch((unint64_t)objc_msgSend(v8, "type"))
        {
          case 1uLL:
            objc_msgSend(*(id *)(a1 + 32), "__cancelDiagnosticsWithUUID:reply:", objc_msgSend(v8, "uuid"), 0);
            break;
          case 2uLL:
            objc_msgSend(*(id *)(a1 + 32), "__cancelCollectLogsWithUUID:reply:", objc_msgSend(v8, "uuid"), 0);
            break;
          case 3uLL:
            objc_msgSend(*(id *)(a1 + 32), "__cancelWiFiSnifferWithUUID:reply:", objc_msgSend(v8, "uuid"), 0);
            break;
          case 4uLL:
            objc_msgSend(*(id *)(a1 + 32), "__cancelPeerDiscoveryWithUUID:", objc_msgSend(v8, "uuid"));
            break;
          case 5uLL:
            objc_msgSend(*(id *)(a1 + 32), "__cancelWiFiPerfLoggingWithUUID:reply:", objc_msgSend(v8, "uuid"), 0);
            break;
          default:
            continue;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "faultEventMonitoringPeers", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "stopMonitoringFaultEventsForPeer:reply:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)j), 0);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }
  -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "additionalLog"), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setExportedObject:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = 0;
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusMonitoring");
  objc_autoreleasePoolPop(v2);
}

void sub_10002FEF8(id a1, BGRepeatingSystemTask *a2)
{
  NSObject *v3;
  NSPredicate *v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  int v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  _BYTE v14[12];
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100030170;
  v9[3] = &unk_1000D5380;
  v9[4] = &v10;
  -[BGRepeatingSystemTask setExpirationHandler:](a2, "setExpirationHandler:", v9);
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v14 = 136315650;
    *(_QWORD *)&v14[4] = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke";
    v15 = 2080;
    v16 = "W5Engine.m";
    v17 = 1024;
    v18 = 1907;
    LODWORD(v7) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) [START] Sniffer Capture Cleanup Task", v14, v7, v8);
  }
  v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("pathExtension='pcap'"));
  sub_100090AB4(CFSTR("/var/run/com.apple.wifivelocity"), (uint64_t)v4, 7, (_BYTE *)v11 + 24);
  v5 = sub_10008F56C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v14 = 136315650;
    *(_QWORD *)&v14[4] = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke";
    v15 = 2080;
    v16 = "W5Engine.m";
    v17 = 1024;
    v18 = 1909;
    LODWORD(v7) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) [END] Sniffer Capture Cleanup Task", v14, v7, v8);
  }
  if (*((_BYTE *)v11 + 24))
  {
    *(_QWORD *)v14 = 0;
    if ((-[BGRepeatingSystemTask setTaskExpiredWithRetryAfter:error:](a2, "setTaskExpiredWithRetryAfter:error:", v14, 0.0) & 1) == 0)
    {
      v6 = *(const __CFString **)v14;
      if (!*(_QWORD *)v14)
        v6 = CFSTR("Unknown");
      NSLog(CFSTR("Failed to expire task with error: %@"), v6);
      -[BGRepeatingSystemTask setTaskCompleted](a2, "setTaskCompleted");
    }
  }
  else
  {
    -[BGRepeatingSystemTask setTaskCompleted](a2, "setTaskCompleted");
  }
  _Block_object_dispose(&v10, 8);
}

void sub_10003014C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100030170(uint64_t a1)
{
  NSObject *v1;
  uint64_t result;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v1 = sub_10008F56C();
  result = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
  {
    v4 = 136315650;
    v5 = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke_2";
    v6 = 2080;
    v7 = "W5Engine.m";
    v8 = 1024;
    v9 = 1904;
    v3 = 28;
    return _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v1, 0, "[wifivelocity] %s (%s:%u) Sniffer Cleanup Task was expired", (const char *)&v4, v3);
  }
  return result;
}

void sub_100030258(uint64_t a1, void *a2)
{
  NSObject *v4;
  NSCompoundPredicate *v5;
  NSObject *v6;
  const __CFString *v7;
  const char *v8;
  int v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  _BYTE v16[12];
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000304F8;
  v10[3] = &unk_1000D5380;
  v10[4] = &v11;
  objc_msgSend(a2, "setExpirationHandler:", v10);
  v4 = sub_10008F56C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v16 = 136315650;
    *(_QWORD *)&v16[4] = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke";
    v17 = 2080;
    v18 = "W5Engine.m";
    v19 = 1024;
    v20 = 1936;
    LODWORD(v8) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) [START] DE Output Cleanup Task", v16, v8, v9);
  }
  v15 = *(_OWORD *)(a1 + 32);
  v5 = +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 2));
  sub_100090AB4(CFSTR("/var/run/com.apple.wifivelocity"), (uint64_t)v5, 7, (_BYTE *)v12 + 24);
  v6 = sub_10008F56C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v16 = 136315650;
    *(_QWORD *)&v16[4] = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke";
    v17 = 2080;
    v18 = "W5Engine.m";
    v19 = 1024;
    v20 = 1938;
    LODWORD(v8) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) [END] DE Output Cleanup Task", v16, v8, v9);
  }
  if (*((_BYTE *)v12 + 24))
  {
    *(_QWORD *)v16 = 0;
    if ((objc_msgSend(a2, "setTaskExpiredWithRetryAfter:error:", v16, 0.0) & 1) == 0)
    {
      v7 = *(const __CFString **)v16;
      if (!*(_QWORD *)v16)
        v7 = CFSTR("Unknown");
      NSLog(CFSTR("Failed to expire task with error: %@"), v7);
      objc_msgSend(a2, "setTaskCompleted");
    }
  }
  else
  {
    objc_msgSend(a2, "setTaskCompleted");
  }
  _Block_object_dispose(&v11, 8);
}

void sub_1000304D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000304F8(uint64_t a1)
{
  NSObject *v1;
  uint64_t result;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v1 = sub_10008F56C();
  result = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
  {
    v4 = 136315650;
    v5 = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke_2";
    v6 = 2080;
    v7 = "W5Engine.m";
    v8 = 1024;
    v9 = 1933;
    v3 = 28;
    return _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v1, 0, "[wifivelocity] %s (%s:%u) DE Cleanup Task was expired", (const char *)&v4, v3);
  }
  return result;
}

NSXPCInterface *sub_100030C0C()
{
  NSXPCInterface *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;

  v0 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___W5XPCRequestDelegate);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v1), 0), "startBrowsingAndReply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v2), 0), "stopBrowsingAndReply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v3), 0), "startAdvertisingAndReply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v4), 0), "stopAdvertisingAndReply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v5), 0), "startMonitoringEvents:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v6), 0), "stopMonitoringEvents:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v7), 0), "queryPeerCacheAndReply:", 0, 1);
  v9 = objc_opt_class(NSArray, v8);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(W5Peer, v10), 0), "queryPeerCacheAndReply:", 1, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v11), 0), "queryLocalPeerAndReply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v12), 0), "queryLocalPeerAndReply:", 1, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v13), 0), "queryStatusForPeer:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v14), 0), "queryStatusForPeer:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Status, v15), 0), "queryStatusForPeer:reply:", 1, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v16), 0), "listFilesFromPeer:remoteDirPath:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSURL, v17), 0), "listFilesFromPeer:remoteDirPath:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v18), 0), "listFilesFromPeer:remoteDirPath:reply:", 0, 1);
  v20 = objc_opt_class(NSArray, v19);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, objc_opt_class(NSURL, v21), 0), "listFilesFromPeer:remoteDirPath:reply:", 1, 1);
  v23 = objc_opt_class(NSArray, v22);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, objc_opt_class(W5DiagnosticsTestRequest, v24), 0), "runDiagnostics:configuration:uuid:reply:", 0, 0);
  v26 = objc_opt_class(NSDictionary, v25);
  v28 = objc_opt_class(NSArray, v27);
  v30 = objc_opt_class(NSNumber, v29);
  v32 = objc_opt_class(NSString, v31);
  v34 = objc_opt_class(W5Peer, v33);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v26, v28, v30, v32, v34, objc_opt_class(W5DiagnosticsTestRequest, v35), 0), "runDiagnostics:configuration:uuid:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v36), 0), "runDiagnostics:configuration:uuid:reply:", 2, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v37), 0), "runDiagnostics:configuration:uuid:reply:", 0, 1);
  v39 = objc_opt_class(NSArray, v38);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v39, objc_opt_class(W5DiagnosticsTestResult, v40), 0), "runDiagnostics:configuration:uuid:reply:", 1, 1);
  v42 = objc_opt_class(NSArray, v41);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v42, objc_opt_class(W5Peer, v43), 0), "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:", 0, 0);
  v45 = objc_opt_class(NSArray, v44);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v45, objc_opt_class(W5DiagnosticsTestRequest, v46), 0), "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:", 1, 0);
  v48 = objc_opt_class(NSDictionary, v47);
  v50 = objc_opt_class(NSArray, v49);
  v52 = objc_opt_class(NSNumber, v51);
  v54 = objc_opt_class(NSString, v53);
  v56 = objc_opt_class(W5Peer, v55);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v48, v50, v52, v54, v56, objc_opt_class(W5DiagnosticsTestRequest, v57), 0), "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:", 2, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v58), 0), "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:", 3, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v59), 0), "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:", 0, 1);
  v61 = objc_opt_class(NSArray, v60);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v61, objc_opt_class(W5DiagnosticsTestResult, v62), 0), "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:", 1, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v63), 0), "registerRemoteDiagnosticEventsForPeer:configuration:reply:", 0, 0);
  v65 = objc_opt_class(NSDictionary, v64);
  v67 = objc_opt_class(NSArray, v66);
  v69 = objc_opt_class(NSNumber, v68);
  v71 = objc_opt_class(NSString, v70);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v65, v67, v69, v71, objc_opt_class(W5Peer, v72), 0), "registerRemoteDiagnosticEventsForPeer:configuration:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v73), 0), "registerRemoteDiagnosticEventsForPeer:configuration:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v74), 0), "unregisterRemoteDiagnosticEventsForPeer:configuration:reply:", 0, 0);
  v76 = objc_opt_class(NSDictionary, v75);
  v78 = objc_opt_class(NSArray, v77);
  v80 = objc_opt_class(NSNumber, v79);
  v82 = objc_opt_class(NSString, v81);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v76, v78, v80, v82, objc_opt_class(W5Peer, v83), 0), "unregisterRemoteDiagnosticEventsForPeer:configuration:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v84), 0), "unregisterRemoteDiagnosticEventsForPeer:configuration:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v85), 0), "queryRegisteredDiagnosticsPeersWithReply:", 0, 1);
  v87 = objc_opt_class(NSArray, v86);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v87, objc_opt_class(W5DiagnosticsModePeer, v88), 0), "queryRegisteredDiagnosticsPeersWithReply:", 1, 1);
  v90 = objc_opt_class(NSDictionary, v89);
  v92 = objc_opt_class(NSArray, v91);
  v94 = objc_opt_class(NSNumber, v93);
  v96 = objc_opt_class(NSString, v95);
  v98 = objc_opt_class(W5Peer, v97);
  v100 = objc_opt_class(W5DiagnosticsModePeer, v99);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v90, v92, v94, v96, v98, v100, objc_opt_class(W5WiFiChannel, v101), 0), "startDiagnosticsModeWithConfiguration:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5DiagnosticsMode, v102), 0), "startDiagnosticsModeWithConfiguration:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v103), 0), "startDiagnosticsModeWithConfiguration:reply:", 1, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v104), 0), "stopDiagnosticsModeWithUUID:info:reply:", 0, 0);
  v106 = objc_opt_class(NSDictionary, v105);
  v108 = objc_opt_class(NSArray, v107);
  v110 = objc_opt_class(NSNumber, v109);
  v112 = objc_opt_class(NSString, v111);
  v114 = objc_opt_class(W5Peer, v113);
  v116 = objc_opt_class(W5DiagnosticsModePeer, v115);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v106, v108, v110, v112, v114, v116, objc_opt_class(W5WiFiChannel, v117), 0), "stopDiagnosticsModeWithUUID:info:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v118), 0), "stopDiagnosticsModeWithUUID:info:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v119), 0), "queryDiagnosticsModeForPeer:info:reply:", 0, 0);
  v121 = objc_opt_class(NSDictionary, v120);
  v123 = objc_opt_class(NSArray, v122);
  v125 = objc_opt_class(NSNumber, v124);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v121, v123, v125, objc_opt_class(NSString, v126), 0), "queryDiagnosticsModeForPeer:info:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v127), 0), "queryDiagnosticsModeForPeer:info:reply:", 0, 1);
  v129 = objc_opt_class(NSArray, v128);
  v131 = objc_opt_class(W5DiagnosticsMode, v130);
  v133 = objc_opt_class(NSUUID, v132);
  v135 = objc_opt_class(NSDictionary, v134);
  v137 = objc_opt_class(NSURL, v136);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v129, v131, v133, v135, v137, objc_opt_class(W5WiFiChannel, v138), 0), "queryDiagnosticsModeForPeer:info:reply:", 1, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v139), 0), "queryDebugConfigurationForPeer:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v140), 0), "queryDebugConfigurationForPeer:reply:", 0, 1);
  v142 = objc_opt_class(W5DebugConfiguration, v141);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v142, objc_opt_class(W5DiagnosticsMode, v143), 0), "queryDebugConfigurationForPeer:reply:", 1, 1);
  v145 = objc_opt_class(W5DebugConfiguration, v144);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v145, objc_opt_class(W5DiagnosticsMode, v146), 0), "setDebugConfiguration:peer:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v147), 0), "setDebugConfiguration:peer:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v148), 0), "setDebugConfiguration:peer:reply:", 0, 1);
  v150 = objc_opt_class(NSArray, v149);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v150, objc_opt_class(W5LogItemRequest, v151), 0), "collectLogs:configuration:uuid:reply:", 0, 0);
  v153 = objc_opt_class(NSDictionary, v152);
  v155 = objc_opt_class(NSArray, v154);
  v157 = objc_opt_class(NSNumber, v156);
  v159 = objc_opt_class(NSString, v158);
  v161 = objc_opt_class(W5Peer, v160);
  v163 = objc_opt_class(W5DiagnosticsTestRequest, v162);
  v165 = objc_opt_class(W5LogItemRequest, v164);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v153, v155, v157, v159, v161, v163, v165, objc_opt_class(NSURL, v166), 0), "collectLogs:configuration:uuid:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v167), 0), "collectLogs:configuration:uuid:reply:", 2, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v168), 0), "collectLogs:configuration:uuid:reply:", 0, 1);
  v170 = objc_opt_class(NSArray, v169);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v170, objc_opt_class(W5LogItemReceipt, v171), 0), "collectLogs:configuration:uuid:reply:", 1, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSURL, v172), 0), "collectLogs:configuration:uuid:reply:", 2, 1);
  v174 = objc_opt_class(NSDictionary, v173);
  v176 = objc_opt_class(NSArray, v175);
  v178 = objc_opt_class(NSNumber, v177);
  v180 = objc_opt_class(NSString, v179);
  v182 = objc_opt_class(W5Peer, v181);
  v184 = objc_opt_class(W5DiagnosticsTestRequest, v183);
  v186 = objc_opt_class(W5LogItemRequest, v185);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v174, v176, v178, v180, v182, v184, v186, objc_opt_class(NSURL, v187), 0), "collectLogsDiagnosticMode:uuid:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v188), 0), "collectLogsDiagnosticMode:uuid:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v189), 0), "collectLogsDiagnosticMode:uuid:reply:", 0, 1);
  v191 = objc_opt_class(NSArray, v190);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v191, objc_opt_class(W5LogItemReceipt, v192), 0), "collectLogsDiagnosticMode:uuid:reply:", 1, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSURL, v193), 0), "collectLogsDiagnosticMode:uuid:reply:", 2, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5PeerDiscoveryConfiguration, v194), 0), "startPeerDiscoveryWithConfiguration:uuid:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v195), 0), "startPeerDiscoveryWithConfiguration:uuid:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v196), 0), "startPeerDiscoveryWithConfiguration:uuid:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v197), 0), "stopPeerDiscoveryWithUUID:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v198), 0), "stopPeerDiscoveryWithUUID:reply:", 0, 1);
  v200 = objc_opt_class(NSArray, v199);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v200, objc_opt_class(W5WiFiChannel, v201), 0), "runWiFiSnifferOnChannels:duration:peer:uuid:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v202), 0), "runWiFiSnifferOnChannels:duration:peer:uuid:reply:", 2, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v203), 0), "runWiFiSnifferOnChannels:duration:peer:uuid:reply:", 3, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v204), 0), "runWiFiSnifferOnChannels:duration:peer:uuid:reply:", 0, 1);
  v206 = objc_opt_class(NSDictionary, v205);
  v208 = objc_opt_class(W5WiFiChannel, v207);
  v210 = objc_opt_class(NSError, v209);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v206, v208, v210, objc_opt_class(NSNull, v211), 0), "runWiFiSnifferOnChannels:duration:peer:uuid:reply:", 1, 1);
  v213 = objc_opt_class(NSDictionary, v212);
  v215 = objc_opt_class(W5WiFiChannel, v214);
  v217 = objc_opt_class(NSURL, v216);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v213, v215, v217, objc_opt_class(NSNull, v218), 0), "runWiFiSnifferOnChannels:duration:peer:uuid:reply:", 2, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v219), 0), "runWiFiSnifferOnChannels:duration:peer:uuid:reply:", 3, 1);
  v221 = objc_opt_class(NSArray, v220);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v221, objc_opt_class(W5WiFiChannel, v222), 0), "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v223), 0), "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:", 2, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v224), 0), "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:", 3, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v225), 0), "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:", 0, 1);
  v227 = objc_opt_class(NSArray, v226);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v227, objc_opt_class(NSURL, v228), 0), "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:", 1, 1);
  v230 = objc_opt_class(NSDictionary, v229);
  v232 = objc_opt_class(NSArray, v231);
  v234 = objc_opt_class(NSNumber, v233);
  v236 = objc_opt_class(NSString, v235);
  v238 = objc_opt_class(W5Peer, v237);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v230, v232, v234, v236, v238, objc_opt_class(NSURL, v239), 0), "runWiFiPerformanceLoggingWithConfiguration:uuid:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v240), 0), "runWiFiPerformanceLoggingWithConfiguration:uuid:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v241), 0), "runWiFiPerformanceLoggingWithConfiguration:uuid:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v242), 0), "cancelRequestWithUUID:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v243), 0), "cancelRequestWithUUID:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSUUID, v244), 0), "cancelRequestWithUUID:OnPeer:OfType:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v245), 0), "cancelRequestWithUUID:OnPeer:OfType:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSNumber, v246), 0), "cancelRequestWithUUID:OnPeer:OfType:reply:", 2, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v247), 0), "cancelRequestWithUUID:OnPeer:OfType:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v248), 0), "cancelAllRequestsAndReply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v249), 0), "log:timestamp:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v250), 0), "startMonitoringFaultEventsForPeer:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v251), 0), "startMonitoringFaultEventsForPeer:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v252), 0), "stopMonitoringFaultEventsForPeer:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v253), 0), "stopMonitoringFaultEventsForPeer:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Event, v254), 0), "submitFaultEvent:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v255), 0), "submitFaultEvent:reply:", 0, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v256), 0), "queryFaultEventCacheForPeer:reply:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v257), 0), "queryFaultEventCacheForPeer:reply:", 0, 1);
  v259 = objc_opt_class(NSArray, v258);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v259, objc_opt_class(W5Event, v260), 0), "queryFaultEventCacheForPeer:reply:", 1, 1);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Peer, v261), 0), "queryDatabaseForPeer:fetch:reply:", 0, 0);
  v263 = objc_opt_class(NSFetchRequest, v262);
  v265 = objc_opt_class(NSDate, v264);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v263, v265, objc_opt_class(NSSet, v266), 0), "queryDatabaseForPeer:fetch:reply:", 1, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSError, v267), 0), "queryDatabaseForPeer:fetch:reply:", 0, 1);
  v269 = objc_opt_class(NSDate, v268);
  v271 = objc_opt_class(NSArray, v270);
  v273 = objc_opt_class(NSDictionary, v272);
  v275 = objc_opt_class(NSNumber, v274);
  v277 = objc_opt_class(NSString, v276);
  v279 = objc_opt_class(NSUUID, v278);
  v281 = objc_opt_class(NSMutableSet, v280);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v269, v271, v273, v275, v277, v279, v281, objc_opt_class(NSNull, v282), 0), "queryDatabaseForPeer:fetch:reply:", 1, 1);
  return v0;
}

NSXPCInterface *sub_100032924()
{
  NSXPCInterface *v0;
  uint64_t v1;
  uint64_t v2;

  v0 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___W5XPCEventDelegate);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Event, v1), 0), "receivedEvent:", 0, 0);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v0, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5PeerDiscoveryEvent, v2), 0), "receivedPeerDiscoveryEvent:", 0, 0);
  return v0;
}

id sub_100032AE4(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[6];

  v2 = objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "corewifi"), "networkName");
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "__initialTests");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100032B74;
  v6[3] = &unk_1000D6490;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = v2;
  return objc_msgSend(v3, "__runDiagnosticsTests:reply:", v4, v6);
}

void sub_100032B74(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  block[0] = _NSConcreteStackBlock;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = sub_100032BD4;
  block[3] = &unk_1000D6468;
  v6 = a2;
  v5 = v2;
  dispatch_async(v3, block);
}

void sub_100032BD4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  dispatch_time_t v6;
  __int128 v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  __int128 v12;

  v2 = objc_autoreleasePoolPush();
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v3 = *(_QWORD *)(a1 + 32);
    if (v4 - *(double *)(v3 + 56) > 0.0)
    {
      v5 = *(_QWORD *)(a1 + 48);
      if (v5 < 1)
      {
        *(_QWORD *)(v3 + 64) = v5;
        v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
        v10 = dispatch_time(0, 10000000000);
        dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      else
      {
        v6 = dispatch_time(0, 2000000000);
        v11[0] = _NSConcreteStackBlock;
        v7 = *(_OWORD *)(a1 + 32);
        v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
        v11[1] = 3221225472;
        v11[2] = sub_100032CCC;
        v11[3] = &unk_1000D5C48;
        v12 = v7;
        dispatch_after(v6, v8, v11);
      }
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100032CCC(uint64_t a1)
{
  void *v2;
  double *v3;
  double v4;
  id v5;
  _QWORD v6[4];
  __int128 v7;

  v2 = objc_autoreleasePoolPush();
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v3 = *(double **)(a1 + 32);
    if (v4 - v3[7] > 0.0)
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "__followupTests");
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100032D80;
      v6[3] = &unk_1000D6490;
      v7 = *(_OWORD *)(a1 + 32);
      objc_msgSend(v3, "__runDiagnosticsTests:reply:", v5, v6);
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100032D80(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  block[0] = _NSConcreteStackBlock;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = sub_100032DE0;
  block[3] = &unk_1000D6468;
  v6 = a2;
  v5 = v2;
  dispatch_async(v3, block);
}

void sub_100032DE0(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  dispatch_time_t v11;

  v2 = objc_autoreleasePoolPush();
  if (*(_BYTE *)(a1[4] + 48))
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v3 = a1[4];
    if (v4 - *(double *)(v3 + 56) > 0.0)
    {
      v5 = a1[6];
      if (v5 >= 1 && v5 != *(_QWORD *)(v3 + 64))
      {
        v6 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1[4] + 16), "wifi"), "interfaceName"), CFSTR("InterfaceName"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a1[6]), CFSTR("WiFiDropReason"));
        if (a1[5])
          v7 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1[4] + 24), "diagnosticsHistory"), "objectForKey:", a1[5]), "allValues");
        else
          v7 = 0;
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("DiagnosticsTestResults"));
        v8 = objc_alloc_init((Class)W5Event);
        objc_msgSend(v8, "setEventID:", 35);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v8, "setTimestamp:");
        objc_msgSend(v8, "setInfo:", v6);
        v3 = a1[4];
        v9 = *(_QWORD *)(v3 + 72);
        if (v9)
        {
          (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);
          v3 = a1[4];
        }
      }
      *(_QWORD *)(v3 + 64) = a1[6];
      v10 = *(NSObject **)(a1[4] + 40);
      v11 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_1000330AC(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_1000331A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD block[7];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v17 = a1;
    v7 = 7;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "didPass", v17) & 1) == 0)
        {
          v11 = objc_msgSend(v10, "testID");
          switch((unint64_t)v11)
          {
            case 3uLL:
              v12 = v7 < 2;
              v13 = 2;
              goto LABEL_12;
            case 4uLL:
            case 5uLL:
            case 8uLL:
            case 0xAuLL:
              continue;
            case 6uLL:
              v12 = v7 < 3;
              v13 = 3;
LABEL_12:
              if (!v12)
                v7 = v13;
              break;
            case 7uLL:
              if (v7 >= 5)
                v7 = 5;
              break;
            case 9uLL:
              if (v7 >= 4)
                v7 = 4;
              break;
            case 0xBuLL:
              if (v7 >= 6)
                v7 = 6;
              break;
            default:
              if (v11 == (id)52)
                v7 = 1;
              break;
          }
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
    if (v7 >= 7)
      v14 = 0;
    else
      v14 = v7;
    a1 = v17;
  }
  else
  {
    v14 = 0;
  }
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033384;
  block[3] = &unk_1000D64B8;
  block[5] = v15;
  block[6] = v14;
  block[4] = a3;
  dispatch_async(v16, block);
}

void sub_100033384(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[5];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[6], a1[4]);
  objc_autoreleasePoolPop(v2);
}

void sub_100033610(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 48))
  {
    *(_BYTE *)(v3 + 48) = 1;
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    if (v4)
      dispatch_source_set_timer(v4, 0, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_1000336C0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 48))
  {
    *(_BYTE *)(v3 + 48) = 0;
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    if (v4)
      dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10003376C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 40);
  if (v4)
  {
    dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v3 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v3 + 56) = 0x7FEFFFFFFFFFFFFFLL;
  objc_autoreleasePoolPop(v2);
}

void sub_100033818(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  dispatch_time_t v8;
  double v9;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 48))
  {
    v4 = *(double *)(v3 + 56);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v5 = *(double *)(a1 + 40);
    if (v4 > v6 + v5)
    {
      v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
      if (v7)
      {
        v8 = dispatch_time(0, (uint64_t)((v5 + 1.0) * 1000000000.0));
        dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      *(double *)(*(_QWORD *)(a1 + 32) + 56) = v9 + *(double *)(a1 + 40);
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100033F38(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_100034004(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_1000340FC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD handler[5];
  int out_token;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 1;
    v4 = *(id *)(a1 + 32);
    out_token = 0;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000341F8;
    handler[3] = &unk_1000D6508;
    handler[4] = v5;
    notify_register_dispatch("com.apple.system.powersources.source", &out_token, v6, handler);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = out_token;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 8);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000343DC;
    v9[3] = &unk_1000D6508;
    v9[4] = v7;
    notify_register_dispatch("com.apple.system.powersources.lowbattery", &out_token, v8, v9);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20) = out_token;
  }
  objc_autoreleasePoolPop(v2);
}

void sub_1000341F8(uint64_t a1)
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034264;
  block[3] = &unk_1000D5C98;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void sub_100034264(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  _QWORD v6[4];

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 15);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  v5[0] = CFSTR("PowerSourceType");
  v6[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "powerSourceType"));
  v5[1] = CFSTR("BatteryEstimatedTime");
  objc_msgSend(*(id *)(a1 + 32), "estimatedTimeRemaining");
  v6[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[2] = CFSTR("BatteryLevel");
  objc_msgSend(*(id *)(a1 + 32), "internalBatteryLevel");
  v6[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[3] = CFSTR("BatteryWarningLevel");
  v6[3] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "batteryWarningLevel"));
  objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 4));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  objc_autoreleasePoolPop(v2);
}

void sub_1000343DC(uint64_t a1)
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034448;
  block[3] = &unk_1000D5C98;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void sub_100034448(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  _QWORD v6[4];

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 17);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  v5[0] = CFSTR("PowerSourceType");
  v6[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "powerSourceType"));
  v5[1] = CFSTR("BatteryEstimatedTime");
  objc_msgSend(*(id *)(a1 + 32), "estimatedTimeRemaining");
  v6[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[2] = CFSTR("BatteryLevel");
  objc_msgSend(*(id *)(a1 + 32), "internalBatteryLevel");
  v6[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[3] = CFSTR("BatteryWarningLevel");
  v6[3] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "batteryWarningLevel"));
  objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 4));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  objc_autoreleasePoolPop(v2);
}

void sub_100034618(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 0;
    notify_cancel(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16));
    notify_cancel(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 20));

  }
  objc_autoreleasePoolPop(v2);
}

void sub_100034850(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(CFTimeInterval *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = IOPSGetTimeRemainingEstimate();
  objc_autoreleasePoolPop(v2);
}

void sub_100034918(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  uint64_t v4;

  v2 = objc_autoreleasePoolPush();
  v3 = (__CFString *)IOPSGetProvidingPowerSourceType(0);
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("AC Power")) & 1) != 0)
  {
    v4 = 1;
LABEL_7:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
    goto LABEL_8;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("Battery Power")) & 1) != 0)
  {
    v4 = 2;
    goto LABEL_7;
  }
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("UPS Power")))
  {
    v4 = 3;
    goto LABEL_7;
  }
LABEL_8:
  objc_autoreleasePoolPop(v2);
}

void sub_100034A3C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = IOPSGetBatteryWarningLevel();
  objc_autoreleasePoolPop(v2);
}

void sub_100034BB0(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  dispatch_time_t v12;
  uint64_t v13;
  void *v14;
  dispatch_time_t v15;
  uint64_t v16;
  void *v17;
  dispatch_time_t v18;
  uint64_t v19;
  void *v20;
  dispatch_time_t v21;
  uint64_t v22;
  void *v23;
  dispatch_time_t v24;
  uint64_t v25;
  void *v26;
  dispatch_time_t v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[7];
  _QWORD v34[7];
  _QWORD v35[7];
  _QWORD v36[7];
  _QWORD v37[7];
  _QWORD v38[7];
  _QWORD v39[7];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  uint64_t v55;
  uint8_t buf[4];
  uint64_t v57;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5DebugConfiguration);
  v50 = 0;
  v51 = &v50;
  v52 = 0x3052000000;
  v53 = sub_100035334;
  v54 = sub_100035344;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3052000000;
  v43 = sub_100035334;
  v44 = sub_100035344;
  v45 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = *(void **)(a1 + 32);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100035350;
  v39[3] = &unk_1000D59E8;
  v39[5] = &v50;
  v39[6] = &v46;
  v39[4] = v4;
  objc_msgSend(v5, "queryWiFiDebugLoggingAndReply:", v39);
  v6 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v6) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v8 = v51;
  v9 = (void *)v51[5];
  if (v9)
    goto LABEL_48;
  if (*((_BYTE *)v47 + 24))
    v10 = 1;
  else
    v10 = -1;
  v11 = *(void **)(a1 + 32);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100035394;
  v38[3] = &unk_1000D59E8;
  v38[6] = &v46;
  v38[4] = v4;
  v38[5] = &v50;
  objc_msgSend(v11, "__queryMegaWiFiProfileInstalledAndReply:", v38);
  v12 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v12) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v8 = v51;
  v9 = (void *)v51[5];
  if (v9)
    goto LABEL_48;
  if (*((_BYTE *)v47 + 24))
    v13 = 1;
  else
    v13 = -1;
  v14 = *(void **)(a1 + 32);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000353D8;
  v37[3] = &unk_1000D59E8;
  v37[6] = &v46;
  v37[4] = v4;
  v37[5] = &v50;
  objc_msgSend(v14, "__queryNoLoggingWiFiProfileInstalledAndReply:", v37);
  v15 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v15) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v8 = v51;
  v9 = (void *)v51[5];
  if (v9)
    goto LABEL_48;
  if (*((_BYTE *)v47 + 24))
    v16 = 1;
  else
    v16 = -1;
  v17 = *(void **)(a1 + 32);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10003541C;
  v36[3] = &unk_1000D59E8;
  v36[6] = &v46;
  v36[4] = v4;
  v36[5] = &v50;
  objc_msgSend(v17, "queryEAPOLDebugLoggingAndReply:", v36);
  v18 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v18) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v8 = v51;
  v9 = (void *)v51[5];
  if (v9)
    goto LABEL_48;
  if (*((_BYTE *)v47 + 24))
    v19 = 1;
  else
    v19 = -1;
  v20 = *(void **)(a1 + 32);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100035460;
  v35[3] = &unk_1000D59E8;
  v35[6] = &v46;
  v35[4] = v4;
  v35[5] = &v50;
  objc_msgSend(v20, "queryBluetoothDebugLoggingAndReply:", v35);
  v21 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v21) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v8 = v51;
  v9 = (void *)v51[5];
  if (v9)
    goto LABEL_48;
  if (*((_BYTE *)v47 + 24))
    v22 = 1;
  else
    v22 = -1;
  v23 = *(void **)(a1 + 32);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000354A4;
  v34[3] = &unk_1000D59E8;
  v34[5] = &v50;
  v34[6] = &v46;
  v34[4] = v4;
  objc_msgSend(v23, "querySTBCAndReply:", v34);
  v24 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v24) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v8 = v51;
  v9 = (void *)v51[5];
  if (v9)
    goto LABEL_48;
  v25 = *((_BYTE *)v47 + 24) ? 1 : -1;
  v26 = *(void **)(a1 + 32);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000354E8;
  v33[3] = &unk_1000D6530;
  v33[6] = &v40;
  v33[4] = v4;
  v33[5] = &v50;
  objc_msgSend(v26, "queryDiagnosticsModeAndReply:", v33);
  v27 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v27) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v8 = v51;
  v9 = (void *)v51[5];
  if (v9
    || (v28 = objc_alloc((Class)W5DebugConfiguration),
        v7 = objc_msgSend(v28, "initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolState:bluetoothState:stbcState:", v41[5], v10, v13, v16, v19, v22, v25), v8 = v51, (v9 = (void *)v51[5]) != 0))
  {
LABEL_48:
    v29 = *(_QWORD *)(a1 + 40);
    if (v29)
    {
      v30 = objc_msgSend(v9, "copy", v7);
      v7 = 0;
LABEL_52:
      (*(void (**)(uint64_t, id, id))(v29 + 16))(v29, v30, v7);
      v8 = v51;
    }
  }
  else
  {
    v29 = *(_QWORD *)(a1 + 40);
    if (v29)
    {
      v30 = 0;
      goto LABEL_52;
    }
  }
  v31 = (id)v8[5];
  v32 = (id)v41[5];
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  objc_autoreleasePoolPop(v2);
}

void sub_1000352FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Unwind_Resume(exception_object);
}

void sub_100035334(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_100035344(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

intptr_t sub_100035350(uint64_t a1, void *a2, char a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100035394(uint64_t a1, void *a2, char a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_1000353D8(uint64_t a1, void *a2, char a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_10003541C(uint64_t a1, void *a2, char a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100035460(uint64_t a1, void *a2, char a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_1000354A4(uint64_t a1, void *a2, char a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_1000354E8(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000356EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100035710(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a3, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000357B8(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  _BOOL8 v5;
  dispatch_time_t v6;
  void *v7;
  _BOOL8 v8;
  dispatch_time_t v9;
  void *v10;
  _BOOL8 v11;
  dispatch_time_t v12;
  void *v13;
  _BOOL8 v14;
  dispatch_time_t v15;
  void *v16;
  _BOOL8 v17;
  dispatch_time_t v18;
  void *v19;
  _BOOL8 v20;
  dispatch_time_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  dispatch_time_t v26;
  uint64_t v27;
  int v28;
  _QWORD v29[6];
  _QWORD v30[6];
  _QWORD v31[6];
  _QWORD v32[6];
  _QWORD v33[6];
  _QWORD v34[6];
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  uint64_t v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  id v49;

  v2 = objc_autoreleasePoolPush();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3052000000;
  v39 = sub_100035334;
  v40 = sub_100035344;
  v41 = 0;
  v3 = dispatch_semaphore_create(0);
  if (!objc_msgSend(*(id *)(a1 + 32), "wifi"))
    goto LABEL_40;
  v4 = *(void **)(a1 + 40);
  v5 = objc_msgSend(*(id *)(a1 + 32), "wifi") == (id)1;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100035EF4;
  v35[3] = &unk_1000D6580;
  v35[4] = v3;
  v35[5] = &v36;
  objc_msgSend(v4, "setWiFiDebugLoggingEnabled:reply:", v5, v35);
  v6 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v3, v6) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v43 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  if (!v37[5])
  {
LABEL_40:
    if (!objc_msgSend(*(id *)(a1 + 32), "megaWiFiProfile"))
      goto LABEL_41;
    v7 = *(void **)(a1 + 40);
    v8 = objc_msgSend(*(id *)(a1 + 32), "megaWiFiProfile") == (id)1;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100035F28;
    v34[3] = &unk_1000D6580;
    v34[4] = v3;
    v34[5] = &v36;
    objc_msgSend(v7, "__setMegaWiFiProfileInstalled:reply:", v8, v34);
    v9 = dispatch_time(0, 4000000000);
    if (dispatch_semaphore_wait(v3, v9) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v43 = 0x4010000000000000;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
    }
    if (!v37[5])
    {
LABEL_41:
      if (!objc_msgSend(*(id *)(a1 + 32), "noLoggingWiFiProfile"))
        goto LABEL_42;
      v10 = *(void **)(a1 + 40);
      v11 = objc_msgSend(*(id *)(a1 + 32), "noLoggingWiFiProfile") == (id)1;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100035F5C;
      v33[3] = &unk_1000D6580;
      v33[4] = v3;
      v33[5] = &v36;
      objc_msgSend(v10, "__setNoLoggingWiFiProfileInstalled:reply:", v11, v33);
      v12 = dispatch_time(0, 4000000000);
      if (dispatch_semaphore_wait(v3, v12) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        v43 = 0x4010000000000000;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
      }
      if (!v37[5])
      {
LABEL_42:
        if (!objc_msgSend(*(id *)(a1 + 32), "eapol"))
          goto LABEL_43;
        v13 = *(void **)(a1 + 40);
        v14 = objc_msgSend(*(id *)(a1 + 32), "eapol") == (id)1;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100035F90;
        v32[3] = &unk_1000D6580;
        v32[4] = v3;
        v32[5] = &v36;
        objc_msgSend(v13, "setEAPOLDebugLoggingEnabled:reply:", v14, v32);
        v15 = dispatch_time(0, 4000000000);
        if (dispatch_semaphore_wait(v3, v15) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          v43 = 0x4010000000000000;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
        }
        if (!v37[5])
        {
LABEL_43:
          if (objc_msgSend(*(id *)(a1 + 32), "bluetooth"))
          {
            v16 = *(void **)(a1 + 40);
            v17 = objc_msgSend(*(id *)(a1 + 32), "bluetooth") == (id)1;
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_100035FC4;
            v31[3] = &unk_1000D6580;
            v31[4] = v3;
            v31[5] = &v36;
            objc_msgSend(v16, "setBluetoothDebugLoggingEnabled:reply:", v17, v31);
            v18 = dispatch_time(0, 4000000000);
            if (dispatch_semaphore_wait(v3, v18) >= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              v43 = 0x4010000000000000;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
            }
          }
          if (objc_msgSend(*(id *)(a1 + 32), "stbc"))
          {
            v19 = *(void **)(a1 + 40);
            v20 = objc_msgSend(*(id *)(a1 + 32), "stbc") == (id)1;
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_100035FF8;
            v30[3] = &unk_1000D6580;
            v30[4] = v3;
            v30[5] = &v36;
            objc_msgSend(v19, "setSTBCEnabled:reply:", v20, v30);
            v21 = dispatch_time(0, 4000000000);
            if (dispatch_semaphore_wait(v3, v21) >= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              v43 = 0x4010000000000000;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
            }
          }
          v22 = sub_10008F56C();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = objc_msgSend(*(id *)(a1 + 32), "diagnosticsMode");
            *(_DWORD *)buf = 136315906;
            v43 = (uint64_t)"-[W5DebugManager setDebugConfiguration:reply:]_block_invoke";
            v44 = 2080;
            v45 = "W5DebugManager.m";
            v46 = 1024;
            v47 = 342;
            v48 = 2114;
            v49 = v23;
            v28 = 38;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] %s (%s:%u) diagnosticsMode='%{public}@'", buf, v28);
          }
          if (objc_msgSend(*(id *)(a1 + 32), "diagnosticsMode"))
          {
            v24 = *(void **)(a1 + 40);
            v25 = objc_msgSend(*(id *)(a1 + 32), "diagnosticsMode");
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_10003602C;
            v29[3] = &unk_1000D6580;
            v29[4] = v3;
            v29[5] = &v36;
            objc_msgSend(v24, "setDiagnosticsMode:reply:", v25, v29);
            v26 = dispatch_time(0, 4000000000);
            if (dispatch_semaphore_wait(v3, v26) >= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              v43 = 0x4010000000000000;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
            }
          }
        }
      }
    }
  }
  v27 = *(_QWORD *)(a1 + 48);
  if (v27)
    (*(void (**)(uint64_t, id))(v27 + 16))(v27, objc_msgSend((id)v37[5], "copy"));
  _Block_object_dispose(&v36, 8);
  objc_autoreleasePoolPop(v2);
}

void sub_100035ECC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100035EF4(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100035F28(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100035F5C(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100035F90(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100035FC4(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100035FF8(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_10003602C(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100036150(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "activeDiagnostics");
  if (v3)
    v4 = objc_msgSend(v3, "firstObject");
  else
    v4 = 0;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v4);
  objc_autoreleasePoolPop(v2);
}

void sub_100036228(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v2 = objc_autoreleasePoolPush();
  v3 = a1[5];
  v4 = *(void **)(a1[4] + 16);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000362A0;
  v5[3] = &unk_1000D5BF8;
  v5[4] = a1[6];
  objc_msgSend(v4, "updateDiagnosticsMode:reply:", v3, v5);
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_1000362A0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100036548(uint64_t a1)
{
  void *v2;
  const void *v3;
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;

  v2 = objc_autoreleasePoolPush();
  v3 = (const void *)WiFiManagerClientCreate(kCFAllocatorDefault, 0);
  v4 = (const __CFBoolean *)WiFiManagerClientCopyProperty(v3, kWiFiLoggingFileEnabledKey);
  if (v4)
  {
    v5 = v4;
    v6 = CFBooleanGetValue(v4) != 0;
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_alloc((Class)OSLogPreferencesSubsystem), "initWithName:", CFSTR("com.apple.WiFiManager"));
  if (!v6 || (v8 = v7, objc_msgSend(v7, "effectiveEnabledLevel") != (id)4))
  {
    v9 = 0;
    if (!v3)
      goto LABEL_10;
    goto LABEL_9;
  }
  v9 = objc_msgSend(v8, "effectivePersistedLevel") == (id)4;
  if (v3)
LABEL_9:
    CFRelease(v3);
LABEL_10:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, _BOOL8))(v10 + 16))(v10, 0, v9);
  objc_autoreleasePoolPop(v2);
}

void sub_1000366B8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const void *v4;
  const CFBooleanRef *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;

  v2 = objc_autoreleasePoolPush();
  v3 = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
  v4 = (const void *)v3;
  v5 = &kCFBooleanTrue;
  if (!*(_BYTE *)(a1 + 48))
    v5 = &kCFBooleanFalse;
  WiFiManagerClientSetProperty(v3, kWiFiLoggingFileEnabledKey, *v5);
  v6 = objc_msgSend(objc_alloc((Class)OSLogPreferencesSubsystem), "initWithName:", CFSTR("com.apple.WiFiManager"));
  v7 = v6;
  if (*(_BYTE *)(a1 + 48))
    v8 = 4;
  else
    v8 = 1;
  objc_msgSend(v6, "setPersistedLevel:", v8);
  if (*(_BYTE *)(a1 + 48))
    v9 = 4;
  else
    v9 = 1;
  objc_msgSend(v7, "setEnabledLevel:", v9);
  if (*(_BYTE *)(a1 + 48))
    v10 = CFSTR("debug");
  else
    v10 = CFSTR("inherit");
  objc_msgSend(*(id *)(a1 + 32), "setOSLogPreferenceLevel:enableOvserizeMessages:subsystem:", v10, 1, CFSTR("com.apple.WiFiManager"));
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
  if (v4)
    CFRelease(v4);
  objc_autoreleasePoolPop(v2);
}

void sub_100036A40(uint64_t a1)
{
  void *v2;
  id v3;
  _BOOL8 v4;
  uint64_t v5;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(objc_alloc((Class)OSLogPreferencesSubsystem), "initWithName:", CFSTR("com.apple.eapol"));
  v4 = objc_msgSend(*(id *)(a1 + 32), "__getEAPOLDebugFlagsEnabled")
    && objc_msgSend(v3, "effectiveEnabledLevel") == (id)4
    && objc_msgSend(v3, "effectivePersistedLevel") == (id)4;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _BOOL8))(v5 + 16))(v5, 0, v4);
  objc_autoreleasePoolPop(v2);
}

void sub_100036B54(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(objc_alloc((Class)OSLogPreferencesSubsystem), "initWithName:", CFSTR("com.apple.eapol"));
  v4 = v3;
  if (*(_BYTE *)(a1 + 48))
    v5 = 4;
  else
    v5 = 1;
  objc_msgSend(v3, "setPersistedLevel:", v5);
  if (*(_BYTE *)(a1 + 48))
    v6 = 4;
  else
    v6 = 1;
  objc_msgSend(v4, "setEnabledLevel:", v6);
  if (*(_BYTE *)(a1 + 48))
    v7 = CFSTR("debug");
  else
    v7 = CFSTR("inherit");
  objc_msgSend(*(id *)(a1 + 32), "setOSLogPreferenceLevel:enableOvserizeMessages:subsystem:", v7, 1, CFSTR("com.apple.eapol"));
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "__setEAPOLDebugFlagsEnabled:error:", *(unsigned __int8 *)(a1 + 48), &v9);
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v9);
  objc_autoreleasePoolPop(v2);
}

void sub_100036CC0(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  const void *v6;
  id v7;
  NSError *v8;
  uint64_t v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;
  NSErrorUserInfoKey v12;
  const __CFString *v13;

  v2 = objc_autoreleasePoolPush();
  v3 = SCDynamicStoreKeyCreate(kCFAllocatorDefault, CFSTR("State:/Network/mDNSResponder/DebugState"));
  if (v3)
  {
    v4 = v3;
    v5 = (void *)SCDynamicStoreCopyValue(0, v3);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(objc_msgSend(v5, "objectForKey:", CFSTR("VerboseLogging")), "BOOLValue");
      CFRelease(v6);
      v8 = 0;
    }
    else
    {
      v10 = NSLocalizedFailureReasonErrorKey;
      v11 = CFSTR("SCError()");
      v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCFErrorDomainSystemConfiguration, SCError(), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
      v7 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v12 = NSLocalizedFailureReasonErrorKey;
    v13 = CFSTR("SCError()");
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCFErrorDomainSystemConfiguration, SCError(), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v7 = 0;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, NSError *, id))(v9 + 16))(v9, v8, v7);
  objc_autoreleasePoolPop(v2);
}

_QWORD *sub_100036EDC(_QWORD *result, uint64_t a2, int a3)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  if (*((unsigned __int8 *)result + 56) != a3)
  {
    v4 = (void *)result[4];
    v3 = result[5];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100036F44;
    v5[3] = &unk_1000D5BF8;
    v5[4] = result[6];
    return objc_msgSend(v4, "__toggleDNSLoggingWithQueue:reply:", v3, v5);
  }
  return result;
}

uint64_t sub_100036F44(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100037128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100037148(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (a2)
  {
    dispatch_io_close(*(dispatch_io_t *)(a1 + 32), 0);
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  }
  else
  {
    v6 = objc_autoreleasePoolPush();
    objc_msgSend(*(id *)(a1 + 40), "appendData:", a3);
    v7 = objc_msgSend(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", *(_QWORD *)(a1 + 40), 4), "componentsSeparatedByString:", CFSTR("\n"));
    objc_msgSend(*(id *)(a1 + 40), "setData:", objc_msgSend(objc_msgSend(v7, "lastObject"), "dataUsingEncoding:", 4));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11);
          if (objc_msgSend(*(id *)(a1 + 48), "count"))
          {
            v13 = 0;
            do
            {
              if (objc_msgSend(v12, "hasSuffix:", objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v13)))*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v13;
              ++v13;
            }
            while (v13 < (unint64_t)objc_msgSend(*(id *)(a1 + 48), "count"));
          }
          v11 = (char *)v11 + 1;
        }
        while (v11 != v9);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
    objc_autoreleasePoolPop(v6);
  }
}

uint64_t (**sub_1000373B4(uint64_t a1, uint64_t a2))(id, _QWORD, BOOL)
{
  uint64_t (**result)(id, _QWORD, BOOL);
  _QWORD v3[4];

  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100037450;
    v3[3] = &unk_1000D5DE8;
    return (uint64_t (**)(id, _QWORD, BOOL))+[W5DebugManager __setOpenDirectoryLoggingEnabled:queue:reply:](W5DebugManager, "__setOpenDirectoryLoggingEnabled:queue:reply:", 1, *(_QWORD *)(a1 + 32), v3);
  }
  else
  {
    result = *(uint64_t (***)(id, _QWORD, BOOL))(a1 + 40);
    if (result)
      return (uint64_t (**)(id, _QWORD, BOOL))result[2](result, 0, a2 == 0);
  }
  return result;
}

uint64_t (**sub_100037450(uint64_t a1, uint64_t a2))(void)
{
  uint64_t (**result)(void);
  _QWORD v3[4];

  if (a2)
  {
    result = *(uint64_t (***)(void))(a1 + 40);
    if (result)
      return (uint64_t (**)(void))result[2]();
  }
  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000374E4;
    v3[3] = &unk_1000D6660;
    return (uint64_t (**)(void))+[W5DebugManager __mostRecentLogWithSuffix:logPath:queue:reply:](W5DebugManager, "__mostRecentLogWithSuffix:logPath:queue:reply:", &off_1000E7EC0, CFSTR("/var/log/opendirectoryd.log"), *(_QWORD *)(a1 + 32), v3);
  }
  return result;
}

uint64_t sub_1000374E4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t (*v4)(void);

  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    result = *(_QWORD *)(a1 + 40);
    if (!result)
      return result;
    v4 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    +[W5DebugManager __setOpenDirectoryLoggingEnabled:queue:reply:](W5DebugManager, "__setOpenDirectoryLoggingEnabled:queue:reply:", 0, *(_QWORD *)(a1 + 32), 0);
    result = *(_QWORD *)(a1 + 40);
    if (!result)
      return result;
    v4 = *(uint64_t (**)(void))(result + 16);
  }
  return v4();
}

uint64_t (**sub_100037988(uint64_t a1, uint64_t a2))(void)
{
  uint64_t (**result)(void);
  _QWORD v3[4];

  if (a2)
  {
    result = *(uint64_t (***)(void))(a1 + 40);
    if (result)
      return (uint64_t (**)(void))result[2]();
  }
  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100037A10;
    v3[3] = &unk_1000D5DE8;
    return (uint64_t (**)(void))+[NSTask runTaskWithLaunchPath:arguments:reply:](NSTask, "runTaskWithLaunchPath:arguments:reply:", *(_QWORD *)(a1 + 32), &off_1000E7EF0, v3);
  }
  return result;
}

uint64_t (**sub_100037A10(uint64_t a1, uint64_t a2))(void)
{
  uint64_t (**result)(void);

  if (!a2)
    return (uint64_t (**)(void))+[NSTask runTaskWithLaunchPath:arguments:reply:](NSTask, "runTaskWithLaunchPath:arguments:reply:", *(_QWORD *)(a1 + 32), &off_1000E7F08, *(_QWORD *)(a1 + 40));
  result = *(uint64_t (***)(void))(a1 + 40);
  if (result)
    return (uint64_t (**)(void))result[2]();
  return result;
}

uint64_t sub_100037B10(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t (*v4)(void);
  id v5;

  if (a2)
  {
    result = *(_QWORD *)(a1 + 40);
    if (!result)
      return result;
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", *(_QWORD *)(a1 + 32), 4);
  if (objc_msgSend(v5, "containsString:", CFSTR("APBrowser*:level=info")))
    objc_msgSend(v5, "containsString:", CFSTR("APBonjour*:level=info"));
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_100037C14(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = objc_autoreleasePoolPush();
  if (objc_opt_class(MCProfileConnection, v3)
    && (v4 = objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "installedProfileIdentifiers"), v11 = 0u, v12 = 0u, v13 = 0u, v14 = 0u, (v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16)) != 0))
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "containsString:", CFSTR("wifi.megawifi")) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 16))(v10, 0, v9);
  objc_autoreleasePoolPop(v2);
}

uint64_t (**sub_100037DB4(uint64_t a1, uint64_t a2, int a3))(id, _QWORD)
{
  uint64_t (**result)(id, _QWORD);
  _UNKNOWN **v4;
  void ***v5;
  void **v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;

  if (a2 || *(unsigned __int8 *)(a1 + 40) != a3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v11 = _NSConcreteStackBlock;
      v12 = 3221225472;
      v13 = sub_100037EA0;
      v14 = &unk_1000D5BF8;
      v15 = *(_QWORD *)(a1 + 32);
      v4 = &off_1000E7F50;
      v5 = &v11;
    }
    else
    {
      v6 = _NSConcreteStackBlock;
      v7 = 3221225472;
      v8 = sub_100037EB4;
      v9 = &unk_1000D5BF8;
      v10 = *(_QWORD *)(a1 + 32);
      v4 = &off_1000E7F68;
      v5 = &v6;
    }
    return (uint64_t (**)(id, _QWORD))+[NSTask runTaskWithLaunchPath:arguments:reply:](NSTask, "runTaskWithLaunchPath:arguments:reply:", CFSTR("/usr/local/bin/profilectl"), v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    result = *(uint64_t (***)(id, _QWORD))(a1 + 32);
    if (result)
      return (uint64_t (**)(id, _QWORD))result[2](result, 0);
  }
  return result;
}

uint64_t sub_100037EA0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100037EB4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100037F30(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = objc_autoreleasePoolPush();
  if (objc_opt_class(MCProfileConnection, v3)
    && (v4 = objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "installedProfileIdentifiers"), v11 = 0u, v12 = 0u, v13 = 0u, v14 = 0u, (v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16)) != 0))
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "containsString:", CFSTR("wifi.nologging")) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 16))(v10, 0, v9);
  objc_autoreleasePoolPop(v2);
}

uint64_t (**sub_1000380D0(uint64_t a1, uint64_t a2, int a3))(id, _QWORD)
{
  uint64_t (**result)(id, _QWORD);
  _UNKNOWN **v4;
  void ***v5;
  void **v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;

  if (a2 || *(unsigned __int8 *)(a1 + 40) != a3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v11 = _NSConcreteStackBlock;
      v12 = 3221225472;
      v13 = sub_1000381BC;
      v14 = &unk_1000D5BF8;
      v15 = *(_QWORD *)(a1 + 32);
      v4 = &off_1000E7F80;
      v5 = &v11;
    }
    else
    {
      v6 = _NSConcreteStackBlock;
      v7 = 3221225472;
      v8 = sub_1000381D0;
      v9 = &unk_1000D5BF8;
      v10 = *(_QWORD *)(a1 + 32);
      v4 = &off_1000E7F98;
      v5 = &v6;
    }
    return (uint64_t (**)(id, _QWORD))+[NSTask runTaskWithLaunchPath:arguments:reply:](NSTask, "runTaskWithLaunchPath:arguments:reply:", CFSTR("/usr/local/bin/profilectl"), v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    result = *(uint64_t (***)(id, _QWORD))(a1 + 32);
    if (result)
      return (uint64_t (**)(id, _QWORD))result[2](result, 0);
  }
  return result;
}

uint64_t sub_1000381BC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000381D0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100038610(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_1000386DC(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_100038778(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "__nextRequest");
  objc_autoreleasePoolPop(v2);
}

void sub_100038914(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void (**v5)(id, NSError *, _QWORD);
  uint64_t v6;
  void (**v7)(id, NSError *, _QWORD);
  uint64_t v8;
  uint64_t v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;
  NSErrorUserInfoKey v12;
  const __CFString *v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(a1 + 32), "__pendingRequestWithUUID:", *(_QWORD *)(a1 + 40));
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "reply"))
    {
      v5 = (void (**)(id, NSError *, _QWORD))objc_msgSend(v4, "reply");
      v14 = NSLocalizedFailureReasonErrorKey;
      v15 = CFSTR("W5CancelledErr");
      v5[2](v5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)), 0);
    }
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", v4);
  }
  else if (objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uuid"), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reply"))
    {
      v7 = (void (**)(id, NSError *, _QWORD))objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reply");
      v12 = NSLocalizedFailureReasonErrorKey;
      v13 = CFSTR("W5CancelledErr");
      v7[2](v7, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)), 0);
    }
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      v10 = NSLocalizedFailureReasonErrorKey;
      v11 = CFSTR("W5ParamErr");
      (*(void (**)(uint64_t, NSError *))(v9 + 16))(v9, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)));
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100038BBC(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  objc_msgSend(*(id *)(a1 + 32), "resetNetworkServiceOrderForTeardown");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_100038CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100038CDC(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_100038CEC(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_100038CF8(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__purgeDiagnosticsHistory");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_100038E70(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[16];

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0x8000000000000000;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] Restoring network service order before teardown", v4, 2u);
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    }
    +[W5DiagnosticsManager __setNetworkServiceOrder:](W5DiagnosticsManager, "__setNetworkServiceOrder:", v3);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", CFSTR("/var/run/wifivelocity-tmp"), 0);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100039070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100039088(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[9];

  block[0] = _NSConcreteStackBlock;
  block[2] = sub_1000390F0;
  block[3] = &unk_1000D66B0;
  v3 = a1[4];
  v4 = a1[5];
  v5 = *(NSObject **)(v3 + 40);
  block[1] = 3221225472;
  block[4] = v4;
  block[5] = a2;
  block[6] = a3;
  block[7] = v3;
  block[8] = a1[6];
  dispatch_async(v5, block);
}

void sub_1000390F0(uint64_t a1)
{
  void *v2;
  id v3;
  dispatch_time_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(*(id *)(a1 + 32), "reply"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "reply");
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  v4 = dispatch_time(0, 120000000000);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000391B4;
  block[3] = &unk_1000D5380;
  block[4] = v5;
  dispatch_after(v4, v6, block);

  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 56) = 0;
  objc_msgSend(*(id *)(a1 + 56), "__nextRequest");
  objc_autoreleasePoolPop(v2);
}

void sub_1000391B4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = 0;
  objc_autoreleasePoolPop(v2);
}

void sub_100039B2C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  dispatch_block_t v5;
  dispatch_time_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[7];
  _QWORD block[4];
  __int128 v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD v19[3];
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  int v27;
  id v28;

  v2 = +[NSMutableArray array](NSMutableArray, "array");
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = sub_100038CDC;
  v25 = sub_100038CEC;
  v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v3 = dispatch_queue_create(0, 0);
  v4 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("Timeout")), "unsignedIntegerValue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039E5C;
  block[3] = &unk_1000D6750;
  v13 = *(_OWORD *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v3;
  v16 = v2;
  v17 = v19;
  v18 = &v21;
  v5 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "concurrentQueue"), "addOperationWithBlock:", v5);
  if (v4)
    v6 = dispatch_time(0, 1000000 * (_QWORD)v4);
  else
    v6 = -1;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003A394;
  v11[3] = &unk_1000D6778;
  v11[4] = v19;
  v11[5] = &v21;
  v11[6] = dispatch_block_wait(v5, v6);
  dispatch_sync(v3, v11);
  if (objc_msgSend((id)v22[5], "code") == (id)3)
  {
    v7 = sub_10008F56C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 134217984;
      v28 = v4;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] DIAGNOSTICS TIMEOUT (timeout=%lums)", &v27);
    }
  }
  else if (objc_msgSend((id)v22[5], "code") == (id)6)
  {
    v8 = sub_10008F56C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] DIAGNOSTICS CANCELLED");
    }
  }
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, objc_msgSend((id)v22[5], "copy"), v2);
  v10 = (id)v22[5];
  dispatch_release(v3);
  _Block_release(v5);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);
}

void sub_100039E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100039E5C(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  id v4;
  int8x16_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[4];
  int8x16_t v11;
  id v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _QWORD v24[4];

  v2 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  while (v2 < (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count")
       && !*((_BYTE *)v21 + 24)
       && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v3 = objc_autoreleasePoolPush();
    v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v2);
    v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    v6 = *(_QWORD *)(a1 + 40);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100039FD4;
    block[3] = &unk_1000D6728;
    v19 = v2;
    v7 = *(NSObject **)(v6 + 40);
    v11 = v5;
    v12 = v4;
    v13 = *(_OWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 80);
    v16 = &v20;
    v17 = v9;
    v18 = v24;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = v8;
    dispatch_sync(v7, block);
    objc_autoreleasePoolPop(v3);
    ++v2;
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
}

void sub_100039FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100039FD4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char *v13;
  id v14;
  _QWORD v15[6];
  _QWORD block[7];

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(*(id *)(a1 + 32), "includeEvents"))
  {
    if (!*(_QWORD *)(a1 + 112))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120);
      if (v3)
        (*(void (**)(uint64_t, id, _QWORD, id, double))(v3 + 16))(v3, objc_msgSend(*(id *)(a1 + 32), "uuid"), 0, objc_msgSend(*(id *)(a1 + 48), "copy"), 0.0);
    }
  }
  v4 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", objc_msgSend(*(id *)(a1 + 48), "configuration"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "copy"), CFSTR("InternalUUID"));
  v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v5, "setConfiguration:", v4);
  v6 = objc_msgSend(*(id *)(a1 + 40), "__runDiagnosticsTest:", v5);
  if (v6)
  {
    objc_msgSend(v6, "setConfiguration:", objc_msgSend(*(id *)(a1 + 48), "configuration"));
    objc_msgSend(*(id *)(a1 + 40), "__updateDiagnosticsHistoryWithResult:", v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003A27C;
    block[3] = &unk_1000D6700;
    v7 = *(_QWORD *)(a1 + 80);
    block[5] = v6;
    block[6] = v7;
    v8 = *(NSObject **)(a1 + 56);
    block[4] = *(_QWORD *)(a1 + 64);
    dispatch_sync(v8, block);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "uuid"), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "uuid")) ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v9 = *(NSObject **)(a1 + 56);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003A2BC;
    v15[3] = &unk_1000D63B0;
    v10 = *(_QWORD *)(a1 + 96);
    v15[4] = *(_QWORD *)(a1 + 80);
    v15[5] = v10;
    dispatch_sync(v9, v15);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8)
                                                                           + 24)
                                                               + 1.0;
  if (objc_msgSend(*(id *)(a1 + 32), "includeEvents"))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120);
    if (v11)
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "uuid");
      v13 = *(char **)(a1 + 112);
      if (v13 >= (char *)objc_msgSend(*(id *)(a1 + 72), "count") - 1)
        v14 = 0;
      else
        v14 = objc_msgSend(objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 112) + 1), "copy");
      (*(void (**)(uint64_t, id, id, id, double))(v11 + 16))(v11, v12, v6, v14, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 72), "count")* 100.0);
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10003A27C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10003A2BC(uint64_t a1)
{
  void *v2;
  NSErrorUserInfoKey v3;
  const __CFString *v4;

  v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v3 = NSLocalizedFailureReasonErrorKey;
    v4 = CFSTR("W5CancelledErr");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[NSError copy](+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1)), "copy");
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10003A394(_QWORD *a1)
{
  void *v2;
  NSErrorUserInfoKey v3;
  const __CFString *v4;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  if (a1[6])
  {

    v3 = NSLocalizedFailureReasonErrorKey;
    v4 = CFSTR("W5TimeoutErr");
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = -[NSError copy](+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1)), "copy");
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10003BE10(uint64_t a1)
{
  void *v2;
  NSMutableDictionary *v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[6];

  v2 = objc_autoreleasePoolPush();
  v3 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", objc_msgSend(*(id *)(a1 + 32), "configuration"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("InternalUUID"));
  v4 = objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v4, "setConfiguration:", v3);
  v5 = objc_msgSend(*(id *)(a1 + 48), "__runDiagnosticsTest:", v4);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setConfiguration:", objc_msgSend(*(id *)(a1 + 32), "configuration"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003BEFC;
    v8[3] = &unk_1000D5C48;
    v7 = *(NSObject **)(a1 + 56);
    v8[4] = *(_QWORD *)(a1 + 64);
    v8[5] = v6;
    dispatch_sync(v7, v8);
  }
  objc_autoreleasePoolPop(v2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void sub_10003BEFC(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10003BF2C(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  id v4;

  v2 = objc_autoreleasePoolPush();
  v3 = CFSTR("ConcurrentResults");
  v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
  objc_autoreleasePoolPop(v2);
}

void sub_1000415B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100041600()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = sub_100038CDC;
  v7 = sub_100038CEC;
  v0 = qword_1000FB6C8;
  v8 = qword_1000FB6C8;
  if (!qword_1000FB6C8)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10004730C;
    v2[3] = &unk_1000D5380;
    v2[4] = &v3;
    sub_10004730C((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000416AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000416C4()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = sub_100038CDC;
  v7 = sub_100038CEC;
  v0 = qword_1000FB6D0;
  v8 = qword_1000FB6D0;
  if (!qword_1000FB6D0)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_1000474A0;
    v2[3] = &unk_1000D5380;
    v2[4] = &v3;
    sub_1000474A0((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100041770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100041788(uint64_t a1, void *a2, void *a3)
{
  void *v6;

  v6 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "lock");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(a3, "copy");
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  objc_autoreleasePoolPop(v6);
}

void sub_100041BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_100041C04(uint64_t a1, void *a2, void *a3)
{
  void *v6;

  v6 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "lock");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(a3, "copy");
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  objc_autoreleasePoolPop(v6);
}

uint64_t sub_100042858(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  id v15;

  v6 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a3);
  objc_msgSend(v6, "floatValue");
  v9 = v8;
  objc_msgSend(v7, "floatValue");
  if (v9 > v10)
    return 1;
  objc_msgSend(v7, "floatValue");
  v13 = v12;
  objc_msgSend(v6, "floatValue");
  v11 = -1;
  if (v13 <= v14)
  {
    v15 = objc_msgSend(a2, "channel");
    if ((uint64_t)v15 <= (uint64_t)objc_msgSend(a3, "channel"))
      return 1;
  }
  return v11;
}

void sub_1000449F4(id a1)
{
  qword_1000FB6D8 = (uint64_t)objc_msgSend(&off_1000E7FF8, "copy");
}

void sub_100045E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose((const void *)(v10 - 144), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100045E54(uint64_t a1, void *a2)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_alloc_init((Class)W5PingResult);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAddress:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setInterfaceName:", objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "wifi"), "interfaceName"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCount:", (int)objc_msgSend(a2, "numPingsTransmitted"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTimeout:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setWait:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setInterval:", 1.0);
  objc_msgSend(a2, "packetLossRate");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPacketLoss:");
  objc_msgSend(a2, "averageRoundtripTime");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAvg:", v5 * 1000.0);
  objc_msgSend(a2, "minRoundtripTime");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMin:", v6 * 1000.0);
  objc_msgSend(a2, "maxRoundtripTime");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMax:", v7 * 1000.0);
  objc_msgSend(a2, "standardDeviationRoundtripTime");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setStddev:", v8 * 1000.0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setStartedAt:", *(double *)(a1 + 64));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setEndedAt:");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  objc_autoreleasePoolPop(v4);
}

void sub_100046ED0(uint64_t a1)
{
  CFHostCancelInfoResolution(*(CFHostRef *)(a1 + 32), kCFHostAddresses);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_100047298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_1000472B8(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3 && objc_msgSend(a2, "length"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

Class sub_10004730C(uint64_t a1)
{
  Class result;

  sub_1000473B4();
  result = objc_getClass("NPTPerformanceTestConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    qword_1000FB6C8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  else
  {
    result = (Class)-[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getNPTPerformanceTestConfigurationClass(void)_block_invoke"), CFSTR("W5DiagnosticsManager.m"), 51, CFSTR("Unable to find class %s"), "NPTPerformanceTestConfiguration");
    __break(1u);
  }
  return result;
}

void sub_1000473B4()
{
  id v0;
  NSAssertionHandler *v1;
  NSString *v2;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_1000FB6C0)
  {
    v4 = off_1000D68C0;
    v5 = 0;
    qword_1000FB6C0 = _sl_dlopen(&v4, &v3);
  }
  if (!qword_1000FB6C0)
  {
    v1 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *NPTKitLibrary(void)");
    v0 = -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("W5DiagnosticsManager.m"), 50, CFSTR("%s"), v3);
    __break(1u);
    goto LABEL_7;
  }
  v0 = v3;
  if (v3)
LABEL_7:
    free(v0);
}

Class sub_1000474A0(uint64_t a1)
{
  Class result;

  sub_1000473B4();
  result = objc_getClass("NPTPerformanceTest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    qword_1000FB6D0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  else
  {
    result = (Class)-[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getNPTPerformanceTestClass(void)_block_invoke"), CFSTR("W5DiagnosticsManager.m"), 53, CFSTR("Unable to find class %s"), "NPTPerformanceTest");
    __break(1u);
  }
  return result;
}

Class sub_100047548(uint64_t a1)
{
  Class result;
  NSAssertionHandler *v3;
  NSString *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  v5 = 0;
  if (!qword_1000FB6E8)
  {
    v6 = off_1000D68D8;
    v7 = 0;
    qword_1000FB6E8 = _sl_dlopen(&v6, &v5);
  }
  if (!qword_1000FB6E8)
  {
    v3 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *IMFoundationLibrary(void)");
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("W5DiagnosticsManager.m"), 45, CFSTR("%s"), v5);
    goto LABEL_10;
  }
  if (v5)
    free(v5);
  result = objc_getClass("IMPingTest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getIMPingTestClass(void)_block_invoke"), CFSTR("W5DiagnosticsManager.m"), 46, CFSTR("Unable to find class %s"), "IMPingTest");
LABEL_10:
    __break(1u);
  }
  qword_1000FB6F0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

void sub_100047BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;
  id *v29;
  id *v30;

  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100047C34(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;

  v2 = sub_10008F56C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "-[W5RapportClient _configureDiscoveryClient]_block_invoke";
    v8 = 2080;
    v9 = "W5RapportClient.m";
    v10 = 1024;
    v11 = 101;
    v5 = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) rapport discovery session invalidated", (const char *)&v6, v5);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateRapportClient");

}

void sub_100047D2C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100047DE8;
  v6[3] = &unk_1000D6920;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_100047DE8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleDeviceFound:", *(_QWORD *)(a1 + 32));

}

void sub_100047E24(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleDeviceLost:", v3);

}

void sub_100047E70(id a1, RPCompanionLinkDevice *a2)
{
  RPCompanionLinkDevice *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  RPCompanionLinkDevice *v13;

  v2 = a2;
  v3 = sub_10008F56C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315906;
    v7 = "-[W5RapportClient _configureDiscoveryClient]_block_invoke_5";
    v8 = 2080;
    v9 = "W5RapportClient.m";
    v10 = 1024;
    v11 = 122;
    v12 = 2114;
    v13 = v2;
    v5 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) local device updated inDevice='%{public}@'", &v6, v5);
  }

}

void sub_10004858C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000485B8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    v4 = sub_10008F56C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = "-[W5RapportClient startDiscoveringDevices]_block_invoke";
      v10 = 2080;
      v11 = "W5RapportClient.m";
      v12 = 1024;
      v13 = 179;
      v14 = 2114;
      v15 = v3;
      v7 = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) W5RapportDiscoveryRequest activation of rapport discovery client falied, error: %{public}@", &v8, v7);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setDiscoveringDevices:", 0);

  }
}

void sub_100048AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100048B18(id a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  v1 = sub_10008F56C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315650;
    v5 = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
    v6 = 2080;
    v7 = "W5RapportClient.m";
    v8 = 1024;
    v9 = 223;
    v3 = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v2, 0, "[wifivelocity] %s (%s:%u) rapport client invalidated", (const char *)&v4, v3);
  }

}

void sub_100048BF8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  _BYTE location[12];
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = sub_10008F56C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      *(_DWORD *)location = 136316162;
      *(_QWORD *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
      v35 = 2080;
      v36 = "W5RapportClient.m";
      v37 = 1024;
      v38 = 231;
      v39 = 2114;
      v40 = v8;
      v41 = 2114;
      v42 = v3;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) failed to activate rapport request='%{public}@' error='%{public}@'", location, 48);
    }

    if (objc_msgSend(v3, "code") == (id)-71146)
    {
      v9 = sub_10008F56C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(void **)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        *(_DWORD *)location = 136316162;
        *(_QWORD *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
        v35 = 2080;
        v36 = "W5RapportClient.m";
        v37 = 1024;
        v38 = 234;
        v39 = 2114;
        v40 = v11;
        v41 = 2114;
        v42 = v12;
        LODWORD(v28) = 48;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) Service unsupported on device='%{public}@' for request='%{public}@'", location, v28);
      }

    }
    v13 = *(void **)(a1 + 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[W5RapportResponse responseWithPayload:options:error:](W5RapportResponse, "responseWithPayload:options:error:", 0, 0, v3));
    objc_msgSend(v13, "handleResponse:", v14);
  }
  else
  {
    if (v7)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
      v16 = objc_msgSend(*(id *)(a1 + 32), "controlFlags");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "requestPayload"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
      *(_DWORD *)location = 136316674;
      *(_QWORD *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
      v35 = 2080;
      v36 = "W5RapportClient.m";
      v37 = 1024;
      v38 = 241;
      v39 = 2114;
      v40 = v15;
      v41 = 2048;
      v42 = v16;
      v43 = 2114;
      v44 = v17;
      v45 = 2114;
      v46 = v18;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) sending request='%{public}@' flags='%ld' payload='%{public}@ to='%{public}@'", location, 68);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "requestPayload"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "encode"));

    if (v14)
    {
      objc_initWeak((id *)location, WeakRetained);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10004915C;
      v29[3] = &unk_1000D6A60;
      objc_copyWeak(&v31, (id *)location);
      v30 = *(id *)(a1 + 32);
      objc_msgSend(WeakRetained, "sendRequestID:request:options:responseHandler:", v20, v14, 0, v29);

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v21 = sub_10008F56C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(void **)(a1 + 32);
        *(_DWORD *)location = 136315906;
        *(_QWORD *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
        v35 = 2080;
        v36 = "W5RapportClient.m";
        v37 = 1024;
        v38 = 244;
        v39 = 2114;
        v40 = v23;
        LODWORD(v28) = 38;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] %s (%s:%u) failed to encode payload for request='%{public}@'", location, v28);
      }

      v24 = *(void **)(a1 + 32);
      v32 = NSLocalizedFailureReasonErrorKey;
      v33 = CFSTR("W5ParamErr");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v25));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[W5RapportResponse responseWithPayload:options:error:](W5RapportResponse, "responseWithPayload:options:error:", 0, 0, v26));
      objc_msgSend(v24, "handleResponse:", v27);

      v14 = 0;
    }
  }

}

void sub_100049130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004915C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  char v16;
  const char *v17;
  char *v18;
  id v19;
  size_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  int v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("statusFlags")));
  v12 = objc_msgSend(v11, "unsignedIntValue");

  v13 = sub_10008F56C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v30 = WeakRetained;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v16 = 0;
    v17 = (const char *)&unk_1000A8606;
    do
    {
      v18 = (char *)(v17 + 1);
      if (((v12 >> v16) & 1) != 0)
      {
        v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", v18, 1);
        objc_msgSend(v15, "addObject:", v19);
        v20 = (size_t)objc_msgSend(v19, "length");

      }
      else
      {
        v20 = strlen(v17 + 1);
      }
      v17 = &v18[v20 + 1];
      v16 = *v17;
    }
    while (*v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsJoinedByString:", CFSTR(" ")));

    v31 = 136316418;
    v32 = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
    v33 = 2080;
    v34 = "W5RapportClient.m";
    v35 = 1024;
    v36 = 257;
    v37 = 2114;
    v38 = v21;
    v39 = 2114;
    v40 = v7;
    v41 = 2114;
    v42 = v8;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) transport='%{public}@' inResponse='%{public}@' inOptions='%{public}@'", &v31, 58);

    WeakRetained = v30;
  }

  if (v9)
  {
    v22 = sub_10008F56C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(void **)(a1 + 32);
      v31 = 136316162;
      v32 = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
      v33 = 2080;
      v34 = "W5RapportClient.m";
      v35 = 1024;
      v36 = 259;
      v37 = 2114;
      v38 = v24;
      v39 = 2114;
      v40 = v9;
      LODWORD(v29) = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v23, 0, "[wifivelocity] %s (%s:%u) failed to recieve response from rapport request='%{public}@' error='%{public}@'", &v31, v29);
    }

    v25 = *(void **)(a1 + 32);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[W5RapportResponse responseWithPayload:options:error:](W5RapportResponse, "responseWithPayload:options:error:", 0, v8, v9));
    objc_msgSend(v25, "handleResponse:", v26);
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "responsePayloadClass"), "payloadFromDictionary:", v7));
    v27 = *(void **)(a1 + 32);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[W5RapportResponse responseWithPayload:options:error:](W5RapportResponse, "responseWithPayload:options:error:", v26, v8, 0));
    objc_msgSend(v27, "handleResponse:", v28);

  }
  objc_msgSend(WeakRetained, "invalidate");

}

void sub_10004968C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000496A4(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_1000496B4(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_1000496C0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__wifi");
  objc_autoreleasePoolPop(v2);
}

void sub_100049804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004981C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__bluetooth");
  objc_autoreleasePoolPop(v2);
}

void sub_100049B74(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_100049C40(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_100049D0C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_100049DD8(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_100049EA4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_100049F70(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004A03C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004A108(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004A1D4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004A2A0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004A36C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004A438(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004A504(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004A5A0(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, objc_msgSend(*(id *)(a1 + 32), "__queryStatusIncludingWiFiScanCache:", 1));
  objc_autoreleasePoolPop(v2);
}

void sub_10004A6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004A6BC(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__queryStatusIncludingWiFiScanCache:", 1);
  objc_autoreleasePoolPop(v2);
}

void sub_10004A7AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004A7C4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__queryWiFiStatusIncludingScanCache:", 0);
  objc_autoreleasePoolPop(v2);
}

void sub_10004A8B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004A8CC(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__queryAWDLStatus");
  objc_autoreleasePoolPop(v2);
}

void sub_10004A9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004A9D0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__queryBluetoothStatus");
  objc_autoreleasePoolPop(v2);
}

void sub_10004AABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004AAD4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__queryNetworkStatus");
  objc_autoreleasePoolPop(v2);
}

void sub_10004ABC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004ABD8(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__queryPowerStatus");
  objc_autoreleasePoolPop(v2);
}

void sub_10004ACC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004ACE0(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = objc_autoreleasePoolPush();
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKeyedSubscript:");
    if (!v3)
    {
      v3 = objc_msgSend(*(id *)(a1 + 40), "__queryStatusIncludingWiFiScanCache:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 32));
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v3;
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004ADB4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObjectForKey:");
  objc_autoreleasePoolPop(v2);
}

void sub_10004AE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004AEB4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004AF4C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "__wifi"), "startEventMonitoring");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "startEventMonitoring");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "startEventMonitoring");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "startEventMonitoring");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "startEventMonitoring");
  objc_msgSend(*(id *)(a1 + 32), "__forceUpdateTrigger");
  objc_autoreleasePoolPop(v2);
}

void sub_10004B010(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "__wifi"), "stopEventMonitoring");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "stopEventMonitoring");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "stopEventMonitoring");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "stopEventMonitoring");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "stopEventMonitoring");
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  if (v3)
  {
    dispatch_source_cancel(v3);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  }
  objc_autoreleasePoolPop(v2);
}

id sub_10004B154(uint64_t a1)
{
  NSObject *v2;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;

  v2 = sub_10008F56C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315906;
    v6 = "-[W5StatusManager __forceUpdateTrigger]_block_invoke";
    v7 = 2080;
    v8 = "W5StatusManager.m";
    v9 = 1024;
    v10 = 543;
    v11 = 1024;
    v12 = 10;
    v4 = 34;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v2, 0, "[wifivelocity] %s (%s:%u) force status update (interval=%d)", (const char *)&v5, v4);
  }
  return objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
}

id sub_10004B2F8(uint64_t a1)
{
  NSObject *v2;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 24));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  v2 = sub_10008F56C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315906;
    v6 = "-[W5StatusManager __updateStatusCoalesce]_block_invoke";
    v7 = 2080;
    v8 = "W5StatusManager.m";
    v9 = 1024;
    v10 = 574;
    v11 = 1024;
    v12 = 5;
    v4 = 34;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v2, 0, "[wifivelocity] %s (%s:%u) coalesced status update (interval=%d)", (const char *)&v5, v4);
  }
  return objc_msgSend(*(id *)(a1 + 32), "__updateStatus");
}

void sub_10004CA2C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10004CBC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004CC20;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004CC20(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10004CC70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004CCC8;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004CCC8(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10004CD18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004CD70;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004CD70(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10004CDC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004CE18;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004CE18(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10004CE68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004CEC0;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004CEC0(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10004CF10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004CF68;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004CF68(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10004CFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004D010;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004D010(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10004D060(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004D0B8;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10004D0B8(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__updateStatusCoalesce");
  objc_msgSend(*(id *)(a1 + 32), "__addEvent:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10004D478(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

id sub_10004D6A8(void *a1)
{
  id v2;
  NSString *v3;

  if (!a1)
    return 0;
  v2 = objc_alloc_init((Class)W5WiFiPreferredNetwork);
  objc_msgSend(v2, "setSsid:", objc_msgSend(a1, "SSID"));
  objc_msgSend(v2, "setSsidString:", objc_msgSend(a1, "networkName"));
  objc_msgSend(v2, "setIsEnabled:", objc_msgSend(a1, "isAutoJoinDisabled") ^ 1);
  objc_msgSend(v2, "setLastJoinedTimestamp:", objc_msgSend(a1, "lastJoinedAt"));
  objc_msgSend(v2, "setSecurity:", sub_10004F454((uint64_t)objc_msgSend(a1, "supportedSecurityTypes"), (uint64_t)objc_msgSend(a1, "WEPSubtype"), (uint64_t)objc_msgSend(a1, "WAPISubtype")));
  objc_msgSend(v2, "setIsCaptive:", objc_msgSend(a1, "isCaptive"));
  objc_msgSend(v2, "setIsPasspoint:", objc_msgSend(a1, "isPasspoint"));
  objc_msgSend(v2, "setDomainName:", objc_msgSend(a1, "domainName"));
  objc_msgSend(v2, "setIsHidden:", objc_msgSend(a1, "hiddenState") == (id)1);
  if (objc_msgSend(v2, "isPasspoint"))
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("wifivelocityd.preferrednetwork.passpoint.%@"), objc_msgSend(v2, "domainName"));
  else
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("wifivelocityd.preferrednetwork.ssid.%@"), objc_msgSend(v2, "ssidString"));
  objc_msgSend(v2, "setIdentifier:", v3);
  return v2;
}

id sub_10004DAFC(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id result;
  uint64_t (**v8)(id, id);
  void *v9;
  id v10;
  id v11;
  NSNumber *v12;
  const __CFString *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSNumber *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;

  v4 = (uint64_t)objc_msgSend(objc_msgSend(a2, "eventID"), "type");
  if (v4 > 14)
  {
    if (v4 == 15)
    {
      v5 = *(void **)(a1 + 32);
      v6 = 1;
    }
    else
    {
      if (v4 != 16)
        goto LABEL_11;
      v5 = *(void **)(a1 + 32);
      v6 = 0;
    }
    objc_msgSend(v5, "__updateAWDLRealTimeMode:", v6);
  }
  else if (v4 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "__clearLinkQualityUpdates");
    objc_msgSend(*(id *)(a1 + 32), "__updateLastAssociatedSSID");
  }
  else if (v4 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "__clearLinkQualityUpdates");
  }
LABEL_11:
  result = objc_msgSend(*(id *)(a1 + 32), "updatedWiFiCallback");
  if (result)
  {
    v8 = (uint64_t (**)(id, id))objc_msgSend(*(id *)(a1 + 32), "updatedWiFiCallback");
    if (a2)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v10 = objc_alloc_init((Class)W5Event);
      v11 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(objc_msgSend(a2, "eventID"), "interfaceName"), CFSTR("InterfaceName"));
      objc_msgSend(objc_msgSend(a2, "timestamp"), "timeIntervalSinceReferenceDate");
      objc_msgSend(v10, "setTimestamp:");
      switch((unint64_t)objc_msgSend(objc_msgSend(a2, "eventID"), "type"))
      {
        case 1uLL:
          objc_msgSend(v10, "setEventID:", 18);
          v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "powerOn"));
          v13 = CFSTR("WiFiPowerOn");
          goto LABEL_30;
        case 2uLL:
          objc_msgSend(v10, "setEventID:", 19);
          objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v9, "SSID"), CFSTR("WiFiSSID"));
          v12 = (NSNumber *)objc_msgSend(v9, "networkName");
          v13 = CFSTR("WiFiSSIDString");
          goto LABEL_30;
        case 3uLL:
          objc_msgSend(v10, "setEventID:", 20);
          v12 = (NSNumber *)objc_msgSend(v9, "BSSID");
          v13 = CFSTR("WiFiBSSID");
          goto LABEL_30;
        case 4uLL:
          objc_msgSend(v10, "setEventID:", 24);
          v12 = (NSNumber *)objc_msgSend(v9, "countryCode");
          v13 = CFSTR("WiFiCountryCode");
          goto LABEL_30;
        case 6uLL:
          v14 = objc_msgSend(a2, "info");
          v15 = objc_msgSend(v14, "objectForKeyedSubscript:", CWFEventLinkChangeStatusKey);
          objc_msgSend(v10, "setEventID:", 22);
          objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v15, "isLinkDown") ^ 1), CFSTR("WiFiLinkUp"));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v15, "reason")), CFSTR("WiFiLinkChangeReason"));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v15, "subreason")), CFSTR("WiFiLinkChangeSubreason"));
          v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v15, "isInvoluntaryLinkDown"));
          v13 = CFSTR("WiFiLinkChangeInvoluntary");
          goto LABEL_30;
        case 7uLL:
          v16 = objc_msgSend(a2, "info");
          v17 = objc_msgSend(v16, "objectForKeyedSubscript:", CWFEventLinkQualityMetricKey);
          v18 = (NSNumber *)objc_alloc_init((Class)W5WiFiLinkQualityUpdate);
          -[NSNumber setRssi:](v18, "setRssi:", objc_msgSend(v17, "RSSI"));
          objc_msgSend(v17, "txRate");
          -[NSNumber setTxRate:](v18, "setTxRate:", (uint64_t)v19);
          *(float *)&v20 = (float)(unint64_t)objc_msgSend(v17, "CCA");
          -[NSNumber setCca:](v18, "setCca:", v20);
          objc_msgSend(objc_msgSend(v17, "updatedAt"), "timeIntervalSinceReferenceDate");
          -[NSNumber setTimestamp:](v18, "setTimestamp:");
          objc_msgSend(v10, "setEventID:", 25);
          v13 = CFSTR("WiFiLinkQualityUpdate");
          v21 = v11;
          v12 = v18;
          goto LABEL_31;
        case 8uLL:
          objc_msgSend(v10, "setEventID:", 23);
          v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "opMode"));
          v13 = CFSTR("WiFiMode");
          goto LABEL_30;
        case 0xEuLL:
          v22 = objc_msgSend(a2, "info");
          if (objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", CWFEventRoamStatusKey), "endedAt"))
          {
            v23 = v10;
            v24 = 31;
          }
          else
          {
            v23 = v10;
            v24 = 30;
          }
          goto LABEL_33;
        case 0xFuLL:
          v23 = v10;
          v24 = 32;
          goto LABEL_33;
        case 0x10uLL:
          v23 = v10;
          v24 = 33;
          goto LABEL_33;
        case 0x11uLL:
          v23 = v10;
          v24 = 2;
          goto LABEL_33;
        case 0x12uLL:
          v23 = v10;
          v24 = 8;
LABEL_33:
          objc_msgSend(v23, "setEventID:", v24);
          break;
        case 0x17uLL:
          objc_msgSend(v10, "setEventID:", 14);
          objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "EAP8021XControlMode")), CFSTR("EAPControlMode"));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "EAP8021XSupplicantState")), CFSTR("EAPSupplicantState"));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "EAP8021XControlState")), CFSTR("EAPControlState"));
          v12 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "EAP8021XClientStatus"));
          v13 = CFSTR("EAPClientStatus");
          goto LABEL_30;
        case 0x18uLL:
          objc_msgSend(v10, "setEventID:", 11);
          v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "reachabilityFlags"));
          v13 = CFSTR("NetworkReachability");
LABEL_30:
          v21 = v11;
LABEL_31:
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v12, v13);
          break;
        default:
          break;
      }
      objc_msgSend(v10, "setInfo:", v11);
    }
    else
    {
      v10 = 0;
    }
    return (id)v8[2](v8, v10);
  }
  return result;
}

void sub_10004E04C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void (**v14)(id, id);

  v9 = objc_autoreleasePoolPush();
  v10 = objc_alloc_init((Class)W5Event);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "setTimestamp:");
  v11 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(a6, "interfaceName"), CFSTR("InterfaceName"));
  if (a3 <= 48)
  {
    if (a3 == 20)
    {
      v12 = v10;
      v13 = 21;
      goto LABEL_12;
    }
    if (a3 == 34)
    {
      v12 = v10;
      v13 = 26;
      goto LABEL_12;
    }
  }
  else
  {
    switch(a3)
    {
      case '1':
        v12 = v10;
        v13 = 27;
        goto LABEL_12;
      case '6':
        objc_msgSend(a6, "__clearLinkQualityUpdates");
        objc_msgSend(v10, "setEventID:", 29);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(objc_alloc((Class)W5WiFiChannel), "initWithChannel:flags:", *(unsigned int *)(a4 + 12), *(unsigned int *)(a4 + 16)), CFSTR("WiFiChannel"));
        break;
      case '7':
        v12 = v10;
        v13 = 28;
LABEL_12:
        objc_msgSend(v12, "setEventID:", v13);
        break;
    }
  }
  if (objc_msgSend(v10, "eventID"))
  {
    objc_msgSend(v10, "setInfo:", v11);
    if (objc_msgSend(a6, "updatedWiFiCallback"))
    {
      v14 = (void (**)(id, id))objc_msgSend(a6, "updatedWiFiCallback");
      v14[2](v14, v10);
    }
  }
  objc_autoreleasePoolPop(v9);
}

void sub_10004E214(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 48))
  {
    *(_BYTE *)(v3 + 48) = 1;
    v4 = *(id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "__startEventMonitoring");
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004E310(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 48))
  {
    *(_BYTE *)(v3 + 48) = 0;
    objc_msgSend(*(id *)(a1 + 32), "__stopEventMonitoring");

  }
  objc_autoreleasePoolPop(v2);
}

void sub_10004E3B4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = *(_BYTE *)(a1 + 40);
  objc_autoreleasePoolPop(v2);
}

void sub_10004E438(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "SSID"), "copy");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "networkName"), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004E500(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  objc_autoreleasePoolPop(v2);
}

void sub_10004E58C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count") == (id)10)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectAtIndex:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10004E690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004E6A8(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_10004E6B8(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_10004E6C4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  objc_autoreleasePoolPop(v2);
}

id sub_10004E830(id result)
{
  if (result)
    return objc_msgSend(objc_alloc((Class)W5WiFiChannel), "initWithChannel:flags:", objc_msgSend(result, "channel"), objc_msgSend(result, "flags"));
  return result;
}

void sub_10004E93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004E954(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10004EA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004EA58(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  objc_autoreleasePoolPop(v2);
}

id sub_10004ED40(void *a1)
{
  id v2;
  id v3;
  const __CFString *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _UNKNOWN **v9;
  unsigned int v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  id v15;
  unint64_t v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;

  if (!a1)
    return 0;
  v2 = objc_alloc_init((Class)W5WiFiScanResult);
  objc_msgSend(v2, "setScanRecord:", objc_msgSend(a1, "scanRecord"));
  objc_msgSend(v2, "setSsid:", objc_msgSend(a1, "SSID"));
  objc_msgSend(v2, "setSsidString:", objc_msgSend(a1, "networkName"));
  objc_msgSend(v2, "setBssid:", objc_msgSend(a1, "BSSID"));
  objc_msgSend(v2, "setChannel:", sub_10004E830(objc_msgSend(a1, "channel")));
  objc_msgSend(v2, "setCountryCode:", objc_msgSend(a1, "countryCode"));
  objc_msgSend(v2, "setBeaconInterval:", objc_msgSend(a1, "beaconInterval"));
  objc_msgSend(v2, "setRssi:", objc_msgSend(a1, "RSSI"));
  objc_msgSend(v2, "setNoise:", objc_msgSend(a1, "noise"));
  objc_msgSend(v2, "setIsIBSS:", objc_msgSend(a1, "isIBSS"));
  objc_msgSend(v2, "setIsAppleSWAP:", objc_msgSend(a1, "isAppleSWAP"));
  objc_msgSend(v2, "setIsPasspoint:", objc_msgSend(a1, "isPasspoint"));
  objc_msgSend(v2, "setIsPersonalHotspot:", objc_msgSend(a1, "isPersonalHotspot"));
  v3 = objc_msgSend(a1, "airPortBaseStationModel");
  switch((unint64_t)v3)
  {
    case 'f':
      v4 = CFSTR("AirPort Express (802.11 b/g)");
      break;
    case 'g':
    case 'n':
    case 'o':
    case 'p':
    case 'v':
      goto LABEL_6;
    case 'h':
      v4 = CFSTR("AirPort Extreme 802.11n (1st Generation)");
      break;
    case 'i':
      v4 = CFSTR("AirPort Extreme 802.11n w/ Gigabit Ethernet (2nd Generation)");
      break;
    case 'j':
      v4 = CFSTR("Time Capsule (1st Generation)");
      break;
    case 'k':
      v4 = CFSTR("AirPort Express 802.11n (1st Generation)");
      break;
    case 'l':
      v4 = CFSTR("AirPort Extreme 802.11n w/ Simultaneous Dual-Band (3rd Generation)");
      break;
    case 'm':
      v4 = CFSTR("Time Capsule w/ Simultaneous Dual-Band (2nd Generation)");
      break;
    case 'q':
      v4 = CFSTR("Time Capsule w/ Simultaneous Dual-Band (3rd Generation)");
      break;
    case 'r':
      v4 = CFSTR("AirPort Extreme 802.11n w/ Simultaneous Dual-Band (4th Generation)");
      break;
    case 's':
      v4 = CFSTR("AirPort Express 802.11n w/ Simultaneous Dual-Band (2nd Generation)");
      break;
    case 't':
      v4 = CFSTR("Time Capsule w/ Simultaneous Dual-Band (4th Generation)");
      break;
    case 'u':
      v4 = CFSTR("AirPort Extreme 802.11n w/ Simultaneous Dual-Band (5th Generation)");
      break;
    case 'w':
      v4 = CFSTR("Time Capsule 802.11ac (5th Generation)");
      break;
    case 'x':
      v4 = CFSTR("AirPort Extreme 802.11ac (6th Generation)");
      break;
    default:
      if (v3 == (id)3)
        v4 = CFSTR("AirPort Extreme (802.11 b/g)");
      else
LABEL_6:
        v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("? (%ld)"), v3);
      break;
  }
  objc_msgSend(v2, "setAirPortBaseStationModelName:", v4);
  objc_msgSend(v2, "setSupportedPHYModes:", objc_msgSend(a1, "supportedPHYModes"));
  v5 = objc_msgSend(a1, "supportedSecurityTypes");
  v6 = objc_msgSend(a1, "WAPISubtype");
  v7 = +[NSMutableArray array](NSMutableArray, "array");
  v8 = v7;
  if ((v5 & 0x80) != 0)
  {
    objc_msgSend(v7, "addObject:", &off_1000E3288);
    if ((v5 & 0x20) == 0)
    {
LABEL_22:
      if ((v5 & 8) == 0)
        goto LABEL_23;
      goto LABEL_29;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(v8, "addObject:", &off_1000E3270);
  if ((v5 & 8) == 0)
  {
LABEL_23:
    if ((v5 & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v8, "addObject:", &off_1000E32A0);
  if ((v5 & 0x40) == 0)
  {
LABEL_24:
    if ((v5 & 0x10) == 0)
      goto LABEL_25;
LABEL_31:
    objc_msgSend(v8, "addObject:", &off_1000E30D8);
    goto LABEL_32;
  }
LABEL_30:
  objc_msgSend(v8, "addObject:", &off_1000E3120);
  if ((v5 & 0x10) != 0)
    goto LABEL_31;
LABEL_25:
  if (v5 == (id)4)
  {
    v9 = &off_1000E30A8;
    goto LABEL_38;
  }
LABEL_32:
  if ((v5 & 1) != 0)
    objc_msgSend(v8, "addObject:", &off_1000E3090);
  if (v5 != (id)2)
    goto LABEL_39;
  if (v6 == (id)2)
    v9 = &off_1000E3168;
  else
    v9 = &off_1000E3330;
LABEL_38:
  objc_msgSend(v8, "addObject:", v9);
LABEL_39:
  objc_msgSend(v2, "setSupportedSecurityTypes:", objc_msgSend(v8, "copy"));
  v10 = objc_msgSend(a1, "isWEP");
  v11 = objc_msgSend(a1, "WPAUnicastCiphers");
  v12 = (unint64_t)objc_msgSend(a1, "WPAMulticastCipher");
  if ((objc_msgSend(v11, "containsObject:", &off_1000E32E8) & 1) != 0
    || ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1 ? (LODWORD(v13) = 1) : (LODWORD(v13) = v10),
        objc_msgSend(v11, "containsObject:", &off_1000E3300)))
  {
    LODWORD(v13) = 1;
  }
  v14 = objc_msgSend(v11, "containsObject:", &off_1000E3318);
  v15 = objc_msgSend(a1, "RSNUnicastCiphers");
  v16 = (unint64_t)objc_msgSend(a1, "RSNMulticastCipher");
  if ((objc_msgSend(v15, "containsObject:", &off_1000E32E8) & 1) != 0
    || ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1 ? (v13 = 1) : (v13 = v13),
        objc_msgSend(v15, "containsObject:", &off_1000E3300)))
  {
    v13 = 1;
  }
  v17 = objc_msgSend(v15, "containsObject:", &off_1000E3318);
  if (v16 == 2)
    v18 = 1;
  else
    v18 = v17;
  v19 = v18 | v14;
  if (v12 == 2)
    v20 = 1;
  else
    v20 = v19;
  objc_msgSend(v2, "setSupportsWEPCipher:", v13);
  objc_msgSend(v2, "setSupportsTKIPCipher:", v20);
  return v2;
}

uint64_t sub_10004F454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 == 128)
    return 12;
  if ((a1 & 0x20) != 0)
  {
    if ((a1 & 8) != 0)
      return 10;
    else
      return 11;
  }
  else if ((a1 & 8) != 0)
  {
    return 9;
  }
  else
  {
    v4 = 2;
    v5 = 14;
    if (a3 != 2)
      v5 = 15;
    if (a1 != 2)
      v5 = 0;
    v6 = 8;
    if (a2 != 5)
      v6 = 1;
    if ((a1 & 1) != 0)
      v5 = v6;
    if (a1 != 4)
      v4 = v5;
    v7 = 3;
    if ((a1 & 4) == 0)
      v7 = 4;
    if ((a1 & 0x10) != 0)
      v4 = v7;
    v8 = 5;
    if ((a1 & 0x10) != 0)
      v8 = 6;
    if ((a1 & 0x40) != 0)
      return v8;
    else
      return v4;
  }
}

void sub_10004F5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004F5DC(uint64_t a1)
{
  void *v2;
  id *v3;
  id v4;

  v2 = objc_autoreleasePoolPush();
  v3 = *(id **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = objc_msgSend(v3[10], "objectForKeyedSubscript:");
    if (!v4)
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "preferredNetworksList");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    v4 = objc_msgSend(v3, "preferredNetworksList");
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v4;
  objc_autoreleasePoolPop(v2);
}

void sub_10004F6B4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "removeObjectForKey:");
  objc_autoreleasePoolPop(v2);
}

void sub_10004FC18(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "__ipv6SetupConfig"), "objectForKeyedSubscript:", kSCPropNetIPv6ConfigMethod);
  if (objc_msgSend(v3, "isEqualToString:", kSCValNetIPv6ConfigMethodAutomatic))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", kSCValNetIPv6ConfigMethodLinkLocal))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", kSCValNetIPv6ConfigMethodManual))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", kSCValNetIPv6ConfigMethodRouterAdvertisement))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = 4;
  }
  else
  {
    v6 = objc_msgSend(v3, "isEqualToString:", kSCValNetIPv6ConfigMethod6to4);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v6)
      v5 = 5;
    else
      v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(_QWORD *)(v4 + 24) = v5;
  objc_autoreleasePoolPop(v2);
}

void sub_10004FDC0(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig"), "objectForKeyedSubscript:", kSCPropNetIPv4ConfigMethod);
  if (objc_msgSend(v3, "isEqualToString:", kSCValNetIPv4ConfigMethodAutomatic))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", kSCValNetIPv4ConfigMethodLinkLocal))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", kSCValNetIPv4ConfigMethodDHCP))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", kSCValNetIPv4ConfigMethodManual))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", kSCValNetIPv4ConfigMethodBOOTP))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", kSCValNetIPv4ConfigMethodINFORM))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = 6;
  }
  else
  {
    v6 = objc_msgSend(v3, "isEqualToString:", kSCValNetIPv4ConfigMethodPPP);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v6)
      v5 = 7;
    else
      v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(_QWORD *)(v4 + 24) = v5;
  objc_autoreleasePoolPop(v2);
}

void sub_10004FFB8(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(*(id *)(a1 + 32), "__dnsSetupConfig"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_autoreleasePoolPop(v2);
}

void sub_100050090(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(a1 + 32), "__proxiesSetupConfig");
  if (objc_msgSend(v3, "count") != (id)2)
  {
    if (objc_msgSend(v3, "count"))
      goto LABEL_9;
LABEL_8:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_9;
  }
  v4 = objc_msgSend(v3, "objectForKeyedSubscript:", kSCPropNetProxiesExceptionsList);
  if (objc_msgSend(v4, "count") == (id)2
    && objc_msgSend(v4, "containsObject:", CFSTR("*.local"))
    && objc_msgSend(v4, "containsObject:", CFSTR("169.254/16"))
    && (objc_msgSend(objc_msgSend(v3, "objectForKeyedSubscript:", kSCPropNetProxiesFTPPassive), "BOOLValue") & 1) != 0)
  {
    goto LABEL_8;
  }
LABEL_9:
  objc_autoreleasePoolPop(v2);
}

void sub_100050864(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10005095C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSNotificationCenter *v5;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 1;
    v4 = *(id *)(a1 + 32);
    -[BluetoothManager maskLocalDeviceEvents:](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "maskLocalDeviceEvents:", 0);
    v5 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "__ios__handleBTAvailabilityNotification:", BluetoothAvailabilityChangedNotification, 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "__ios__handleBTPowerNotification:", BluetoothPowerChangedNotification, 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "__ios__handleBTConnectabiliyNotification:", BluetoothConnectabilityChangedNotification, 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "__ios__handleBTDiscoveryNotification:", BluetoothDiscoveryStateChangedNotification, 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "__ios__handleBTAdvertisingNotification:", BluetoothAdvertisingStateChangedNotification, 0);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100050AD4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 0;
    -[BluetoothManager maskLocalDeviceEvents:](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "maskLocalDeviceEvents:", 0xFFFFFFFFLL);
    -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", *(_QWORD *)(a1 + 32));

  }
  objc_autoreleasePoolPop(v2);
}

void sub_100050BC8(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -[BluetoothManager powerState](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "powerState") == 2;
  objc_autoreleasePoolPop(v2);
}

void sub_100050CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100050CD4(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_100050CE4(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_100050CF0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(-[BluetoothManager localAddress](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "localAddress"), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_100050DC4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -[BluetoothManager isDiscoverable](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "isDiscoverable");
  objc_autoreleasePoolPop(v2);
}

void sub_100050E94(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -[BluetoothManager connectable](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "connectable");
  objc_autoreleasePoolPop(v2);
}

void sub_100050F64(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -[BluetoothManager available](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "available");
  objc_autoreleasePoolPop(v2);
}

void sub_100051034(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -[BluetoothManager deviceScanningInProgress](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "deviceScanningInProgress");
  objc_autoreleasePoolPop(v2);
}

void sub_1000510D0(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  objc_autoreleasePoolPop(v2);
}

void sub_1000511A0(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  objc_autoreleasePoolPop(v2);
}

void sub_100051270(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  objc_autoreleasePoolPop(v2);
}

void sub_100051340(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  objc_autoreleasePoolPop(v2);
}

void sub_100051410(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 3);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  objc_autoreleasePoolPop(v2);
}

void sub_100051F58(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "__nextRequest");
  objc_autoreleasePoolPop(v2);
}

void sub_1000520F4(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void (**v5)(id, NSError *);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id *v11;
  void (**v12)(id, _QWORD);
  uint64_t v13;
  uint64_t v14;
  NSErrorUserInfoKey v15;
  const __CFString *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(a1 + 32), "__pendingRequestWithUUID:", *(_QWORD *)(a1 + 40));
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "reply"))
    {
      v5 = (void (**)(id, NSError *))objc_msgSend(v4, "reply");
      v17 = NSLocalizedFailureReasonErrorKey;
      v18 = CFSTR("W5CancelledErr");
      v5[2](v5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)));
    }
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", v4);
  }
  else if (objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "requestInfo"), "uuid"), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    if (v8)
    {
      kill((pid_t)objc_msgSend(v8, "processIdentifier"), 9);

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
      v7 = *(_QWORD *)(a1 + 32);
    }
    v9 = *(void **)(v7 + 32);
    if (v9)
    {
      kill((pid_t)objc_msgSend(v9, "processIdentifier"), 9);

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
      v7 = *(_QWORD *)(a1 + 32);
    }
    v10 = objc_msgSend(objc_msgSend(*(id *)(v7 + 56), "requestInfo"), "tcpDump");
    v11 = *(id **)(a1 + 32);
    if ((v10 & 1) == 0)
    {
      objc_msgSend(v11, "stopSniffingActiveRequestWithError:", 0);
      goto LABEL_24;
    }
    if (objc_msgSend(objc_msgSend(v11[7], "requestInfo"), "reply"))
    {
      v12 = (void (**)(id, _QWORD))objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "requestInfo"), "reply");
      v12[2](v12, 0);
    }
    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      v15 = NSLocalizedFailureReasonErrorKey;
      v16 = CFSTR("W5ParamErr");
      (*(void (**)(uint64_t, NSError *))(v14 + 16))(v14, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)));
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
    && +[W5FeatureAvailability isInternalBuild](W5FeatureAvailability, "isInternalBuild"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeNotificationWithUUID:", *(_QWORD *)(a1 + 40));
  }
LABEL_24:
  objc_autoreleasePoolPop(v2);
}

void sub_1000524A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 64);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000524FC;
  v4[3] = &unk_1000D5C48;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000524FC(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(id *)(a1 + 40);
  objc_autoreleasePoolPop(v2);
}

void sub_100052DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052E08;
  block[3] = &unk_1000D58F8;
  block[4] = a3;
  block[5] = v3;
  block[6] = a2;
  dispatch_async(v4, block);
}

void sub_100052E08(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = sub_10008F56C();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 136315906;
      v10 = "-[W5WiFiSniffManager __nextRequest]_block_invoke_2";
      v11 = 2080;
      v12 = "W5WiFiSniffManager.m";
      v13 = 1024;
      v14 = 378;
      v15 = 2114;
      v16 = v6;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) tcpdump failed to start %{public}@", &v9, 38);
    }
    if (objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "requestInfo"), "reply"))
    {
      v7 = (void (**)(id, _QWORD))objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "requestInfo"), "reply");
      v7[2](v7, *(_QWORD *)(a1 + 32));
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) = 0;
    objc_msgSend(*(id *)(a1 + 40), "__nextRequest");
  }
  else
  {
    if (v5)
    {
      v9 = 136315650;
      v10 = "-[W5WiFiSniffManager __nextRequest]_block_invoke";
      v11 = 2080;
      v12 = "W5WiFiSniffManager.m";
      v13 = 1024;
      v14 = 389;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) tcpdump started", (const char *)&v9, 28);
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v8 + 16))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:", CFSTR("WiFi Disconnected"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), CFSTR("Sniffer on Channel"), objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(v8 + 56), "requestInfo"), "channel"), "snifferDescription")), CFSTR("WiFi will remain disconnected while sniffer log collection is active."), 0, objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "requestInfo"), "uuid"), 0);
      v8 = *(_QWORD *)(a1 + 40);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = *(id *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "__setupWatchdogTask");
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100053084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v6;
  NSObject *v7;
  _QWORD v8[6];

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 16))
  {
    v6 = +[W5FeatureAvailability isInternalBuild](W5FeatureAvailability, "isInternalBuild");
    v4 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      objc_msgSend(*(id *)(v4 + 16), "removeNotificationWithUUID:", objc_msgSend(objc_msgSend(*(id *)(v4 + 56), "requestInfo"), "uuid"));
      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  v7 = *(NSObject **)(v4 + 64);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100053130;
  v8[3] = &unk_1000D5C48;
  v8[4] = v4;
  v8[5] = a3;
  dispatch_async(v7, v8);
}

void sub_100053130(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "requestInfo"), "reply"))
  {
    v3 = (void (**)(id, _QWORD))objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "requestInfo"), "reply");
    if (objc_msgSend(*(id *)(a1 + 40), "code") == (id)3)
      v4 = 0;
    else
      v4 = *(_QWORD *)(a1 + 40);
    v3[2](v3, v4);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  if (v6)
  {
    kill((pid_t)objc_msgSend(v6, "processIdentifier"), 9);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    v5 = *(_QWORD *)(a1 + 32);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  objc_msgSend(*(id *)(a1 + 32), "__nextRequest");
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10005320C(uint64_t a1, uint64_t a2)
{
  void (**v4)(id, _QWORD);
  uint64_t result;
  NSObject *v6;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;

  if (a2)
  {
    if (objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "requestInfo"), "reply"))
    {
      v4 = (void (**)(id, _QWORD))objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "requestInfo"), "reply");
      v4[2](v4, a2);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    return (uint64_t)objc_msgSend(*(id *)(a1 + 32), "__nextRequest");
  }
  else
  {
    v6 = sub_10008F56C();
    result = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
    {
      v8 = 136315650;
      v9 = "-[W5WiFiSniffManager __nextRequest]_block_invoke_3";
      v10 = 2080;
      v11 = "W5WiFiSniffManager.m";
      v12 = 1024;
      v13 = 440;
      v7 = 28;
      return _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) Sniff via bhound is active", (const char *)&v8, v7);
    }
  }
  return result;
}

void sub_1000533F0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) == 0;
  objc_autoreleasePoolPop(v2);
}

void sub_100053480(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSErrorUserInfoKey v7;
  const __CFString *v8;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  if ((objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "requestInfo"), "tcpDump") & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    v7 = NSLocalizedFailureReasonErrorKey;
    v8 = CFSTR("W5CancelledErr");
    objc_msgSend(v3, "stopSniffingActiveRequestWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1)));
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  if (v5)
  {
    kill((pid_t)objc_msgSend(v5, "processIdentifier"), 9);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    v4 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(void **)(v4 + 32);
  if (v6)
  {
    kill((pid_t)objc_msgSend(v6, "processIdentifier"), 9);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

id sub_1000539E0(uint64_t a1)
{
  NSObject *v2;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "timeoutTimer")
    && !dispatch_source_testcancel((dispatch_source_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "timeoutTimer")))
  {
    dispatch_source_cancel((dispatch_source_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "timeoutTimer"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setTimeoutTimer:", 0);
  v2 = sub_10008F56C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315650;
    v6 = "-[W5WiFiSniffManager startSniffingWithRequest:interfaceName:reply:]_block_invoke";
    v7 = 2080;
    v8 = "W5WiFiSniffManager.m";
    v9 = 1024;
    v10 = 613;
    v4 = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v2, 0, "[wifivelocity] %s (%s:%u) Sniffer timer ended", (const char *)&v5, v4);
  }
  return objc_msgSend(*(id *)(a1 + 32), "stopSniffingActiveRequestWithError:", 0);
}

uint64_t sub_100055B74()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = sub_100058028;
  v7 = sub_100058038;
  v0 = qword_1000FB6F8;
  v8 = qword_1000FB6F8;
  if (!qword_1000FB6F8)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10007735C;
    v2[3] = &unk_1000D5380;
    v2[4] = &v3;
    sub_10007735C((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100055C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100055CC0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_100055D8C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_100055E58(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_1000562DC(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  W5LogItemRequestInternal *v15;
  uint64_t v16;
  NSObject *v17;
  W5LogItemRequestInternal *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  NSErrorDomain v22;
  const __CFString **v23;
  NSErrorUserInfoKey *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  _QWORD v31[7];
  _QWORD v32[7];
  W5LogItemRequest *v33;
  W5LogItemRequest *v34;
  NSErrorUserInfoKey v35;
  const __CFString *v36;
  NSErrorUserInfoKey v37;
  const __CFString *v38;
  NSErrorUserInfoKey v39;
  const __CFString *v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;
  int v43;
  uint64_t v44;

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "itemRequests"), "count") != (id)1
    || objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "itemRequests"), "firstObject"), "itemID") != (id)56)
  {
    if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "itemRequests"), "count") != (id)1
      || objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "itemRequests"), "firstObject"), "itemID") != (id)79)
    {
      if (objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("CacheSysdiagnose")), "BOOLValue"))
      {
        v14 = sub_10008F56C();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v43) = 0;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] Cached content for sysdiagnose will be generated before processing request", &v43, 2);
        }
        v15 = objc_alloc_init(W5LogItemRequestInternal);
        -[W5LogItemRequestInternal setUuid:](v15, "setUuid:", +[NSUUID UUID](NSUUID, "UUID"));
        v34 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 56, 0);
        -[W5LogItemRequestInternal setItemRequests:](v15, "setItemRequests:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
        -[W5LogItemRequestInternal setConfiguration:](v15, "setConfiguration:", &off_1000E6070);
        -[W5LogItemRequestInternal setFilename:](v15, "setFilename:", -[NSUUID UUIDString](-[W5LogItemRequestInternal uuid](v15, "uuid"), "UUIDString"));
        -[W5LogItemRequestInternal setAdditionalLog:](v15, "setAdditionalLog:", 0);
        -[W5LogItemRequestInternal setUid:](v15, "setUid:", objc_msgSend(*(id *)(a1 + 32), "uid"));
        -[W5LogItemRequestInternal setGid:](v15, "setGid:", objc_msgSend(*(id *)(a1 + 32), "gid"));
        -[W5LogItemRequestInternal setIncludeEvents:](v15, "setIncludeEvents:", 0);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100056C98;
        v32[3] = &unk_1000D6BC8;
        v16 = *(_QWORD *)(a1 + 32);
        v32[4] = *(_QWORD *)(a1 + 40);
        v32[5] = v15;
        v32[6] = v16;
        -[W5LogItemRequestInternal setReply:](v15, "setReply:", v32);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "addObject:", v15);
        v17 = sub_10008F56C();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v43) = 0;
          LODWORD(v30) = 2;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] Cached content for sysdiagnose (BT) will be generated before processing request", &v43, v30);
        }
        v18 = objc_alloc_init(W5LogItemRequestInternal);
        -[W5LogItemRequestInternal setUuid:](v18, "setUuid:", +[NSUUID UUID](NSUUID, "UUID"));
        v33 = +[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 79, 0);
        -[W5LogItemRequestInternal setItemRequests:](v18, "setItemRequests:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
        -[W5LogItemRequestInternal setConfiguration:](v18, "setConfiguration:", &off_1000E6098);
        -[W5LogItemRequestInternal setFilename:](v18, "setFilename:", -[NSUUID UUIDString](-[W5LogItemRequestInternal uuid](v18, "uuid"), "UUIDString"));
        -[W5LogItemRequestInternal setAdditionalLog:](v18, "setAdditionalLog:", 0);
        -[W5LogItemRequestInternal setUid:](v18, "setUid:", objc_msgSend(*(id *)(a1 + 32), "uid"));
        -[W5LogItemRequestInternal setGid:](v18, "setGid:", objc_msgSend(*(id *)(a1 + 32), "gid"));
        -[W5LogItemRequestInternal setIncludeEvents:](v18, "setIncludeEvents:", 0);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100057134;
        v31[3] = &unk_1000D6BC8;
        v19 = *(_QWORD *)(a1 + 32);
        v31[4] = *(_QWORD *)(a1 + 40);
        v31[5] = v18;
        v31[6] = v19;
        -[W5LogItemRequestInternal setReply:](v18, "setReply:", v31);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "addObject:", v18);
      }
      goto LABEL_22;
    }
    v10 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("AllowCachedSysdiagnose")), "BOOLValue");
    v11 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      if (*(_QWORD *)(v11 + 184))
      {
        v12 = sub_10008F56C();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(_QWORD *)(a1 + 32);
          v43 = 138543362;
          v44 = v13;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] Replying with cached content for sysdiagnose (BT) request (%{public}@)", &v43, 12);
        }
        v8 = *(_QWORD *)(a1 + 32);
        v7 = *(_QWORD **)(a1 + 40);
        v9 = v7[23];
        goto LABEL_15;
      }
      if (objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(v11 + 56), "configuration"), "objectForKeyedSubscript:", CFSTR("CachedSysdiagnose")), "BOOLValue"))
      {
        v27 = sub_10008F56C();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v43) = 0;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] Cached content being generated, enqueueing sysdiagnose (BT) request", &v43, 2);
        }
        goto LABEL_41;
      }
      if (objc_msgSend(*(id *)(a1 + 40), "__logItems:containsID:", objc_msgSend(*(id *)(a1 + 40), "__expandLogItems:configuration:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "itemRequests"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "configuration")), 14))
      {
        v29 = sub_10008F56C();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v43) = 0;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v29, 0, "[wifivelocity] Active request contains sysdiagnose, replying immediately with EDEADLK", &v43, 2);
        }
        if (objc_msgSend(*(id *)(a1 + 32), "reply"))
        {
          v21 = objc_msgSend(*(id *)(a1 + 32), "reply");
          v22 = NSPOSIXErrorDomain;
          v37 = NSLocalizedFailureReasonErrorKey;
          v38 = CFSTR("EDEADLK");
          v23 = &v38;
          v24 = &v37;
          goto LABEL_34;
        }
        goto LABEL_23;
      }
LABEL_22:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "addObject:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "__nextRequest");
      goto LABEL_23;
    }
    if (!objc_msgSend((id)v11, "__logItems:containsID:", objc_msgSend((id)v11, "__expandLogItems:configuration:", objc_msgSend(*(id *)(v11 + 56), "itemRequests"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "configuration")), 14))goto LABEL_22;
    v25 = sub_10008F56C();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v43) = 0;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v25, 0, "[wifivelocity] Active request contains sysdiagnose, replying immediately with EDEADLK", &v43, 2);
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "reply"))
      goto LABEL_23;
    v21 = objc_msgSend(*(id *)(a1 + 32), "reply");
    v22 = NSPOSIXErrorDomain;
    v35 = NSLocalizedFailureReasonErrorKey;
    v36 = CFSTR("EDEADLK");
    v23 = &v36;
    v24 = &v35;
LABEL_34:
    (*((void (**)(id, NSError *, _QWORD, _QWORD))v21 + 2))(v21, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, 11, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v24, 1)), 0, 0);
    goto LABEL_23;
  }
  v3 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("AllowCachedSysdiagnose")), "BOOLValue");
  v4 = *(_QWORD *)(a1 + 40);
  if (!v3)
  {
    if (!objc_msgSend((id)v4, "__logItems:containsID:", objc_msgSend((id)v4, "__expandLogItems:configuration:", objc_msgSend(*(id *)(v4 + 56), "itemRequests"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "configuration")), 14))goto LABEL_22;
    v20 = sub_10008F56C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v43) = 0;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v20, 0, "[wifivelocity] Active request contains sysdiagnose, replying immediately with EDEADLK", &v43, 2);
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "reply"))
      goto LABEL_23;
    v21 = objc_msgSend(*(id *)(a1 + 32), "reply");
    v22 = NSPOSIXErrorDomain;
    v39 = NSLocalizedFailureReasonErrorKey;
    v40 = CFSTR("EDEADLK");
    v23 = &v40;
    v24 = &v39;
    goto LABEL_34;
  }
  if (*(_QWORD *)(v4 + 176))
  {
    v5 = sub_10008F56C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v43 = 138543362;
      v44 = v6;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] Replying with cached content for sysdiagnose request (%{public}@)", &v43, 12);
    }
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD **)(a1 + 40);
    v9 = v7[22];
LABEL_15:
    objc_msgSend(v7, "__replyWithCachedSysdiagnoseContentForRequest:temporaryURL:", v8, v9);
    goto LABEL_23;
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(v4 + 56), "configuration"), "objectForKeyedSubscript:", CFSTR("CachedSysdiagnose")), "BOOLValue"))
  {
    v26 = sub_10008F56C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v43) = 0;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v26, 0, "[wifivelocity] Cached content being generated, enqueueing sysdiagnose request", &v43, 2);
    }
LABEL_41:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "addObject:", *(_QWORD *)(a1 + 32));
    goto LABEL_23;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "__logItems:containsID:", objc_msgSend(*(id *)(a1 + 40), "__expandLogItems:configuration:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "itemRequests"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "configuration")), 14))goto LABEL_22;
  v28 = sub_10008F56C();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v43) = 0;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 0, "[wifivelocity] Active request contains sysdiagnose, replying immediately with EDEADLK", &v43, 2);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "reply"))
  {
    v21 = objc_msgSend(*(id *)(a1 + 32), "reply");
    v22 = NSPOSIXErrorDomain;
    v41 = NSLocalizedFailureReasonErrorKey;
    v42 = CFSTR("EDEADLK");
    v23 = &v42;
    v24 = &v41;
    goto LABEL_34;
  }
LABEL_23:
  objc_autoreleasePoolPop(v2);
}

void sub_100056C98(int8x16_t *a1, uint64_t a2, uint64_t a3)
{
  int8x16_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  uint64_t v9;
  uint64_t v10;

  v7[1] = 3221225472;
  v3 = vextq_s8(a1[2], a1[2], 8uLL);
  v4 = a1[2].i64[0];
  v7[0] = _NSConcreteStackBlock;
  v7[2] = sub_100056D04;
  v7[3] = &unk_1000D6BA0;
  v5 = *(NSObject **)(v4 + 40);
  v8 = v3;
  v6 = a1[3].i64[0];
  v9 = a3;
  v10 = v6;
  dispatch_async(v5, v7);
}

void sub_100056D04(id *a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  unint64_t v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  int8x16_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  _QWORD block[4];
  int8x16_t v16;
  id v17;
  int v18;
  id v19;

  v2 = objc_autoreleasePoolPush();
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(objc_msgSend(objc_msgSend(a1[4], "uuid"), "UUIDString"), "substringToIndex:", 5);
    v18 = 138543362;
    v19 = v4;
    v14 = 12;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] Cached content for sysdiagnose generated (uuid=%{public}@), will review pending requests", &v18, v14);
  }
  if (*((_QWORD *)a1[5] + 22))
  {
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(*((id *)a1[5] + 22), "path"), 0);

  }
  *((_QWORD *)a1[5] + 22) = objc_msgSend(a1[6], "copy");
  v5 = +[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet");
  if (objc_msgSend(*((id *)a1[5] + 6), "count"))
  {
    v6 = 0;
    do
    {
      v7 = objc_msgSend(*((id *)a1[5] + 6), "objectAtIndexedSubscript:", v6);
      if (objc_msgSend(objc_msgSend(v7, "itemRequests"), "count") == (id)1
        && objc_msgSend(objc_msgSend(objc_msgSend(v7, "itemRequests"), "firstObject"), "itemID") == (id)56
        && objc_msgSend(objc_msgSend(objc_msgSend(a1[7], "configuration"), "objectForKeyedSubscript:", CFSTR("AllowCachedSysdiagnose")), "BOOLValue"))
      {
        v8 = sub_10008F56C();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138543362;
          v19 = v7;
          LODWORD(v13) = 12;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] Replying with cached content for sysdiagnose request (%{public}@)", &v18, v13);
        }
        objc_msgSend(a1[5], "__replyWithCachedSysdiagnoseContentForRequest:temporaryURL:", v7, a1[6]);
        objc_msgSend(v5, "addIndex:", v6);
      }
      ++v6;
    }
    while (v6 < (unint64_t)objc_msgSend(*((id *)a1[5] + 6), "count"));
  }
  objc_msgSend(*((id *)a1[5] + 6), "removeObjectsAtIndexes:", v5);
  v9 = dispatch_time(0, 480000000000);
  block[1] = 3221225472;
  v10 = vextq_s8(*(int8x16_t *)(a1 + 5), *(int8x16_t *)(a1 + 5), 8uLL);
  v11 = a1[5];
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100056FDC;
  block[3] = &unk_1000D58F8;
  v12 = *((_QWORD *)v11 + 5);
  v16 = v10;
  v17 = a1[4];
  dispatch_after(v9, v12, block);
  objc_autoreleasePoolPop(v2);
}

void sub_100056FDC(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  int v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  __int16 v10;
  id v11;

  v2 = objc_autoreleasePoolPush();
  if (*(_QWORD *)(a1 + 32) && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "isEqual:"))
  {
    v3 = sub_10008F56C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "uuid"), "UUIDString"), "substringToIndex:", 5);
      v5 = objc_msgSend(*(id *)(a1 + 32), "path");
      v7[0] = 67109634;
      v7[1] = 480;
      v8 = 2114;
      v9 = v4;
      v10 = 2114;
      v11 = v5;
      v6 = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] CLEANUP cached content for sysdiagnose (delay=%ds, uuid=%{public}@, path='%{public}@')", v7, v6);
    }
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "path"), 0);

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176) = 0;
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100057134(int8x16_t *a1, uint64_t a2, uint64_t a3)
{
  int8x16_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  uint64_t v9;
  uint64_t v10;

  v7[1] = 3221225472;
  v3 = vextq_s8(a1[2], a1[2], 8uLL);
  v4 = a1[2].i64[0];
  v7[0] = _NSConcreteStackBlock;
  v7[2] = sub_1000571A0;
  v7[3] = &unk_1000D6BA0;
  v5 = *(NSObject **)(v4 + 40);
  v8 = v3;
  v6 = a1[3].i64[0];
  v9 = a3;
  v10 = v6;
  dispatch_async(v5, v7);
}

void sub_1000571A0(id *a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  unint64_t v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  int8x16_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  _QWORD block[4];
  int8x16_t v16;
  id v17;
  int v18;
  id v19;

  v2 = objc_autoreleasePoolPush();
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(objc_msgSend(objc_msgSend(a1[4], "uuid"), "UUIDString"), "substringToIndex:", 5);
    v18 = 138543362;
    v19 = v4;
    v14 = 12;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] Cached content for sysdiagnose (BT) generated (uuid=%{public}@), will review pending requests", &v18, v14);
  }
  if (*((_QWORD *)a1[5] + 23))
  {
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(*((id *)a1[5] + 23), "path"), 0);

  }
  *((_QWORD *)a1[5] + 23) = objc_msgSend(a1[6], "copy");
  v5 = +[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet");
  if (objc_msgSend(*((id *)a1[5] + 6), "count"))
  {
    v6 = 0;
    do
    {
      v7 = objc_msgSend(*((id *)a1[5] + 6), "objectAtIndexedSubscript:", v6);
      if (objc_msgSend(objc_msgSend(v7, "itemRequests"), "count") == (id)1
        && objc_msgSend(objc_msgSend(objc_msgSend(v7, "itemRequests"), "firstObject"), "itemID") == (id)79
        && objc_msgSend(objc_msgSend(objc_msgSend(a1[7], "configuration"), "objectForKeyedSubscript:", CFSTR("AllowCachedSysdiagnose")), "BOOLValue"))
      {
        v8 = sub_10008F56C();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138543362;
          v19 = v7;
          LODWORD(v13) = 12;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] Replying with cached content for sysdiagnose (BT) request (%{public}@)", &v18, v13);
        }
        objc_msgSend(a1[5], "__replyWithCachedSysdiagnoseContentForRequest:temporaryURL:", v7, a1[6]);
        objc_msgSend(v5, "addIndex:", v6);
      }
      ++v6;
    }
    while (v6 < (unint64_t)objc_msgSend(*((id *)a1[5] + 6), "count"));
  }
  objc_msgSend(*((id *)a1[5] + 6), "removeObjectsAtIndexes:", v5);
  v9 = dispatch_time(0, 480000000000);
  block[1] = 3221225472;
  v10 = vextq_s8(*(int8x16_t *)(a1 + 5), *(int8x16_t *)(a1 + 5), 8uLL);
  v11 = a1[5];
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100057478;
  block[3] = &unk_1000D58F8;
  v12 = *((_QWORD *)v11 + 5);
  v16 = v10;
  v17 = a1[4];
  dispatch_after(v9, v12, block);
  objc_autoreleasePoolPop(v2);
}

void sub_100057478(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  int v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  __int16 v10;
  id v11;

  v2 = objc_autoreleasePoolPush();
  if (*(_QWORD *)(a1 + 32) && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "isEqual:"))
  {
    v3 = sub_10008F56C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "uuid"), "UUIDString"), "substringToIndex:", 5);
      v5 = objc_msgSend(*(id *)(a1 + 32), "path");
      v7[0] = 67109634;
      v7[1] = 480;
      v8 = 2114;
      v9 = v4;
      v10 = 2114;
      v11 = v5;
      v6 = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] CLEANUP cached content for sysdiagnose (BT) (delay=%ds, uuid=%{public}@, path='%{public}@')", v7, v6);
    }
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "path"), 0);

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) = 0;
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10005762C(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;
  NSErrorUserInfoKey v12;
  const __CFString *v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(a1 + 32), "__pendingRequestWithUUID:", *(_QWORD *)(a1 + 40));
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "reply"))
    {
      v5 = objc_msgSend(v4, "reply");
      v14 = NSLocalizedFailureReasonErrorKey;
      v15 = CFSTR("W5CancelledErr");
      (*((void (**)(id, NSError *, _QWORD, _QWORD))v5 + 2))(v5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)), 0, 0);
    }
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", v4);
  }
  else if (objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uuid"), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reply"))
    {
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reply");
      v12 = NSLocalizedFailureReasonErrorKey;
      v13 = CFSTR("W5CancelledErr");
      (*((void (**)(id, NSError *, _QWORD, _QWORD))v7 + 2))(v7, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)), 0, 0);
    }
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      v10 = NSLocalizedFailureReasonErrorKey;
      v11 = CFSTR("W5ParamErr");
      (*(void (**)(uint64_t, NSError *))(v9 + 16))(v9, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)));
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10005792C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allValues", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        kill((pid_t)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "processIdentifier"), 9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

int64_t sub_100057EEC(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a2, "compare:", a3);
}

void sub_100058010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100058028(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_100058038(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_100058044(uint64_t a1, NSError *a2, void *a3, uint64_t a4)
{
  id v8;
  unsigned int v9;
  NSURL *v10;
  id v11;
  NSFileManager *v12;
  NSURL *v13;
  NSURL *v14;
  NSFileManager *v15;
  void (**v16)(id, NSError *, NSURL *, _QWORD);
  NSError *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  _QWORD block[9];
  char v23;
  NSError *v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];

  v8 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("CleanupDelay"));
  v9 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  if (a3)
  {
    v21 = a3;
    v24 = 0;
    v10 = -[NSURL URLByAppendingPathComponent:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")), "URLByAppendingPathComponent:", objc_msgSend(*(id *)(a1 + 32), "filename"));
    if (v9)
    {
      sub_10008F5AC(v21, v10, &v24);
    }
    else
    {
      v12 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
      v28[0] = &off_1000E3348;
      v27[0] = NSFilePosixPermissions;
      v27[1] = NSFileOwnerAccountID;
      v28[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "uid"));
      v27[2] = NSFileGroupOwnerAccountID;
      v28[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "gid"));
      -[NSFileManager setAttributes:ofItemAtPath:error:](v12, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3), objc_msgSend(v21, "path"), 0);
    }
    v13 = v10;
    if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("Reason")))
    {
      v14 = -[NSURL URLByAppendingPathComponent:](-[NSURL URLByAppendingPathComponent:](-[NSFileManager containerURLForSecurityApplicationGroupIdentifier:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.wifi.logs")), "URLByAppendingPathComponent:", CFSTR("previous")), "URLByAppendingPathComponent:", objc_msgSend(*(id *)(a1 + 32), "filename"));
      sub_10009009C(v10, v14, &v24);
      v15 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
      v26[0] = &off_1000E3348;
      v25[0] = NSFilePosixPermissions;
      v25[1] = NSFileOwnerAccountID;
      v26[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "uid"));
      v25[2] = NSFileGroupOwnerAccountID;
      v26[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "gid"));
      -[NSFileManager setAttributes:ofItemAtPath:error:](v15, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3), -[NSURL path](v14, "path"), 0);
    }
    a3 = v21;
    if (objc_msgSend(*(id *)(a1 + 32), "reply"))
    {
      v16 = (void (**)(id, NSError *, NSURL *, _QWORD))objc_msgSend(*(id *)(a1 + 32), "reply");
      if (v24)
        v17 = v24;
      else
        v17 = a2;
      v16[2](v16, v17, v13, a4);
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "reply"))
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "reply");
    (*((void (**)(id, NSError *, _QWORD, _QWORD))v11 + 2))(v11, a2, 0, 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "clearCachedStatusWithUUID:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"));
  objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "wifi"), "clearCachedPreferredNetworksListWithUUID:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"));
  objc_msgSend(*(id *)(a1 + 40), "__purgeFilesInDirectory:matching:maxAge:maxCount:", -[NSURL path](-[NSURL URLByAppendingPathComponent:](-[NSFileManager containerURLForSecurityApplicationGroupIdentifier:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.wifi.logs")), "URLByAppendingPathComponent:", CFSTR("previous")), "path"), 0, 604800, 20);
  objc_msgSend(*(id *)(a1 + 40), "__purgeFilesInDirectory:matching:maxAge:maxCount:", CFSTR("/var/run/com.apple.wifivelocity/wifiperf"), 0, 21600, 10);
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_1000584A8;
  block[3] = &unk_1000D6C58;
  v19 = *(_QWORD *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v20 = *(NSObject **)(v18 + 40);
  block[1] = 3221225472;
  block[4] = v18;
  block[5] = v8;
  v23 = v9;
  block[6] = v19;
  block[7] = a3;
  block[8] = *(_QWORD *)(a1 + 48);
  dispatch_async(v20, block);
}

void sub_1000584A8(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  int64_t v8;
  dispatch_time_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD block[4];
  __int128 v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  char v21;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allKeys");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allKeys");
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "allKeys");
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "allKeys");
  v7 = *(void **)(a1 + 40);
  if (v7)
    v8 = 1000000000 * (_QWORD)objc_msgSend(v7, "unsignedIntegerValue");
  else
    v8 = 120000000000;
  v9 = dispatch_time(0, v8);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000585D4;
  block[3] = &unk_1000D6C30;
  v21 = *(_BYTE *)(a1 + 72);
  v14 = *(_OWORD *)(a1 + 48);
  v15 = v3;
  v16 = v10;
  v17 = v4;
  v18 = v5;
  v12 = *(_QWORD *)(a1 + 64);
  v19 = v6;
  v20 = v12;
  dispatch_after(v9, v11, block);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  objc_msgSend(*(id *)(a1 + 32), "__nextRequest");
  objc_autoreleasePoolPop(v2);
}

void sub_1000585D4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  int v16;
  id v17;

  v2 = objc_autoreleasePoolPush();
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "uuid");
    v16 = 138543362;
    v17 = v4;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] CLEANUP temporary log request resources (uuid=%{public}@)", &v16, 12);
  }
  if (*(_BYTE *)(a1 + 96))
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(*(id *)(a1 + 40), "path"), 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(void **)(a1 + 48);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 72), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
        if (v10)
          kill((pid_t)objc_msgSend(v10, "processIdentifier"), 9);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 72), "removeObjectsForKeys:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 80), "removeObjectsForKeys:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 160), "removeObjectsForKeys:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 168), "removeObjectsForKeys:", *(_QWORD *)(a1 + 80));
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = 0;
  objc_autoreleasePoolPop(v2);
}

void sub_10005DD38(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  unsigned int v9;
  const char *v10;
  NSString *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  int v17;
  NSString *v18;
  _BYTE v19[128];

  v2 = objc_autoreleasePoolPush();
  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", v3, objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", +[NSMutableString string](NSMutableString, "string"), objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(void **)(a1 + 48);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "uuid"), "UUIDString"));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v6);
  }
  v9 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "configuration"), "objectForKeyedSubscript:", CFSTR("UseMegaWiFiProfileLimits")), "BOOLValue");
  v10 = "NOT ";
  if (v9)
    v10 = "";
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MegaWiFi profile %sinstalled\n"), v10);
  objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")), "appendString:", v11);
  v12 = sub_10008F56C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543362;
    v18 = v11;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %{public}@", &v17, 12);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10005DF88(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  dispatch_block_t v5;
  dispatch_time_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[9];
  _QWORD v14[7];
  _QWORD block[4];
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  NSObject *v19;
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD v23[3];
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;

  v2 = +[NSMutableArray array](NSMutableArray, "array");
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = sub_100058028;
  v29 = sub_100058038;
  v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v3 = dispatch_queue_create(0, 0);
  v4 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("Timeout")), "unsignedIntegerValue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005E1F4;
  block[3] = &unk_1000D6CF8;
  v16 = *(_OWORD *)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 56);
  v19 = v3;
  v20 = v2;
  v21 = v23;
  v22 = &v25;
  v5 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "concurrentQueue"), "addOperationWithBlock:", v5);
  if (v4)
    v6 = dispatch_time(0, 1000000 * (_QWORD)v4);
  else
    v6 = -1;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005E804;
  v14[3] = &unk_1000D6778;
  v14[4] = v23;
  v14[5] = &v25;
  v14[6] = dispatch_block_wait(v5, v6);
  dispatch_sync(v3, v14);
  v13[0] = _NSConcreteStackBlock;
  v13[2] = sub_10005E8F4;
  v13[3] = &unk_1000D6D20;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(NSObject **)(v7 + 88);
  v13[1] = 3221225472;
  v13[7] = &v25;
  v13[8] = v4;
  v10 = *(_QWORD *)(a1 + 32);
  v13[4] = v7;
  v13[5] = v10;
  v13[6] = v8;
  dispatch_sync(v9, v13);
  v11 = *(_QWORD *)(a1 + 72);
  if (v11)
    (*(void (**)(uint64_t, id, _QWORD, id))(v11 + 16))(v11, objc_msgSend((id)v26[5], "copy"), *(_QWORD *)(a1 + 56), v2);
  v12 = (id)v26[5];
  dispatch_release(v3);
  _Block_release(v5);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
}

void sub_10005E1C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10005E1F4(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  __int128 v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  __int128 v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD v23[7];
  _QWORD block[4];
  int8x16_t v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[5];

  v2 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  while (v2 < (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count")
       && !*((_BYTE *)v29 + 24)
       && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v3 = objc_autoreleasePoolPush();
    v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v2);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005E4E4;
    block[3] = &unk_1000D6CA8;
    v27 = v2;
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 40);
    v25 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    v26 = v4;
    dispatch_sync(v5, block);
    v6 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", objc_msgSend(v4, "configuration"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("OutputDirectory"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), CFSTR("HomeDirectory"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "uuid"), "UUIDString"), "copy"), CFSTR("InternalUUID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "includeEvents")), CFSTR("IncludeEvents"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "configuration"), "objectForKeyedSubscript:", CFSTR("UseMegaWiFiProfileLimits")), CFSTR("UseMegaWiFiProfileLimits"));
    v7 = objc_msgSend(v4, "copy");
    objc_msgSend(v7, "setConfiguration:", v6);
    v8 = objc_msgSend(*(id *)(a1 + 40), "__collectLogItem:error:", v7, 0);
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "setRequest:", v4);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10005E568;
      v23[3] = &unk_1000D6700;
      v10 = *(_QWORD *)(a1 + 88);
      v23[5] = v9;
      v23[6] = v10;
      v11 = *(NSObject **)(a1 + 72);
      v23[4] = *(_QWORD *)(a1 + 80);
      dispatch_sync(v11, v23);
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005E5A8;
    v14[3] = &unk_1000D6CD0;
    v19 = &v28;
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 40);
    v15 = *(_OWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 72);
    v20 = *(_OWORD *)(a1 + 88);
    v16 = v13;
    v17 = v9;
    v21 = v32;
    v22 = v2;
    v18 = *(_QWORD *)(a1 + 32);
    dispatch_sync(v12, v14);
    objc_autoreleasePoolPop(v3);
    ++v2;
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);
}

void sub_10005E4B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10005E4E4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(*(id *)(a1 + 32), "includeEvents"))
  {
    if (!*(_QWORD *)(a1 + 56))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208);
      if (v3)
        (*(void (**)(uint64_t, id, _QWORD, id, double))(v3 + 16))(v3, objc_msgSend(*(id *)(a1 + 32), "uuid"), 0, objc_msgSend(*(id *)(a1 + 48), "copy"), 0.0);
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10005E568(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10005E5A8(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  char *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  __int128 v10;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uuid"), "isEqual:", objc_msgSend(*(id *)(a1 + 40), "uuid")) ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v3 = *(NSObject **)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005E72C;
    v9[3] = &unk_1000D63B0;
    v10 = *(_OWORD *)(a1 + 80);
    dispatch_sync(v3, v9);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                          + 24)
                                                              + 1.0;
  if (objc_msgSend(*(id *)(a1 + 40), "includeEvents"))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "uuid");
      v6 = *(char **)(a1 + 104);
      v7 = *(_QWORD *)(a1 + 56);
      if (v6 >= (char *)objc_msgSend(*(id *)(a1 + 64), "count") - 1)
        v8 = 0;
      else
        v8 = objc_msgSend(objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 104) + 1), "copy");
      (*(void (**)(uint64_t, id, uint64_t, id, double))(v4 + 16))(v4, v5, v7, v8, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24)/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "count")* 100.0);
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10005E72C(uint64_t a1)
{
  void *v2;
  NSErrorUserInfoKey v3;
  const __CFString *v4;

  v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v3 = NSLocalizedFailureReasonErrorKey;
    v4 = CFSTR("W5CancelledErr");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[NSError copy](+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1)), "copy");
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10005E804(_QWORD *a1)
{
  void *v2;
  NSErrorUserInfoKey v3;
  const __CFString *v4;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  if (a1[6])
  {

    v3 = NSLocalizedFailureReasonErrorKey;
    v4 = CFSTR("W5TimeoutErr");
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = -[NSError copy](+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1)), "copy");
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10005E8F4(uint64_t a1)
{
  NSString *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  id v6;
  const char *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSArray *v16;
  id v17;
  NSUInteger v18;
  const char *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *context;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  int v36;
  const __CFString *v37;

  context = objc_autoreleasePoolPush();
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "code") == (id)3)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("COLLECTION TIMEOUT (timeout=%lums)"), *(_QWORD *)(a1 + 64));
    objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")), "appendFormat:", CFSTR("\n%@\n"), v2);
    v3 = sub_10008F56C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 138543362;
      v37 = (const __CFString *)v2;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %{public}@", &v36, 12);
    }
  }
  else if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "code") == (id)6)
  {
    objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")), "appendFormat:", CFSTR("\n%@\n"), CFSTR("COLLECTION CANCELLED"));
    v4 = sub_10008F56C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 138543362;
      v37 = CFSTR("COLLECTION CANCELLED");
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %{public}@", &v36, 12);
    }
  }
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count");
  v7 = "";
  if (!v6)
    v7 = " None";
  objc_msgSend(v5, "appendFormat:", CFSTR("\nINCOMPLETE:%s\n"), v7);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")), "allValues");
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(objc_msgSend(v12, "configuration"), "objectForKeyedSubscript:", CFSTR("NameOverride"));
        v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
        v15 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "uuid"), "UUIDString"), "substringToIndex:", 5);
        if (!v13)
          v13 = (id)W5DescriptionForLogItemID(objc_msgSend(v12, "itemID"));
        objc_msgSend(v14, "appendFormat:", CFSTR("[%@] %@\n"), v15, v13);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v9);
  }
  v16 = -[NSFileManager subpathsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "subpathsOfDirectoryAtPath:error:", objc_msgSend(*(id *)(a1 + 48), "path"), 0);
  v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
  v18 = -[NSArray count](v16, "count");
  v19 = "";
  if (!v18)
    v19 = " None";
  objc_msgSend(v17, "appendFormat:", CFSTR("\nPATHS:%s\n"), v19);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v16);
        objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")), "appendFormat:", CFSTR("./%@\n"), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j));
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v21);
  }
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "path"), "stringByAppendingPathComponent:", CFSTR("debug-log.txt")), objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")), "dataUsingEncoding:", 4), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObjectForKey:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObjectForKey:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"));
  objc_autoreleasePoolPop(context);
}

int64_t sub_10005F540(id a1, W5DiagnosticsTestResult *a2, W5DiagnosticsTestResult *a3)
{
  double v4;
  double v5;
  double v6;

  -[W5DiagnosticsTestResult testCompleted](a2, "testCompleted");
  v5 = v4;
  -[W5DiagnosticsTestResult testCompleted](a3, "testCompleted");
  if (v5 <= v6)
    return 1;
  else
    return -1;
}

void sub_100060F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100060F34(uint64_t a1, void *a2, void *a3, void *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a3, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(a4, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100064184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100064670(uint64_t a1, uint64_t a2)
{
  int8x16_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[4];
  int8x16_t v9;
  uint64_t v10;
  uint64_t v11;
  NSURL *v12;

  block[1] = 3221225472;
  v3 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v4 = *(_QWORD *)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_10006476C;
  block[3] = &unk_1000D6BA0;
  v5 = *(NSObject **)(v4 + 40);
  v9 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  v10 = a2;
  v11 = v6;
  dispatch_async(v5, block);
  v12 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_tcpdump.pcap"), *(_QWORD *)(a1 + 64)));
  objc_msgSend(*(id *)(a1 + 56), "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

void sub_10006476C(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (a1[4])
  {
    objc_msgSend(*(id *)(a1[5] + 72), "setObject:forKeyedSubscript:", a1[6]);
    objc_msgSend(*(id *)(a1[5] + 80), "setObject:forKeyedSubscript:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", a1[7]), a1[4]);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_1000647C8(int8x16_t *a1)
{
  int8x16_t v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[4];
  int8x16_t v5;

  v4[1] = 3221225472;
  v1 = vextq_s8(a1[2], a1[2], 8uLL);
  v2 = a1[2].i64[0];
  v4[0] = _NSConcreteStackBlock;
  v4[2] = sub_100064828;
  v4[3] = &unk_1000D5C48;
  v3 = *(NSObject **)(v2 + 40);
  v5 = v1;
  dispatch_async(v3, v4);
}

void sub_100064828(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "setObject:forKeyedSubscript:", 0);
  objc_autoreleasePoolPop(v2);
}

void sub_100064978(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if (v3)
    kill((pid_t)objc_msgSend(v3, "processIdentifier"), 2);
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if (v4)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:", v4, *(_QWORD *)(a1 + 48), 0x7FFFFFFFFFFFFFFFLL, *(unsigned __int8 *)(a1 + 64), 0, 1.79769313e308);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 56), "setRelativeURLs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100064CA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100064CC8(uint64_t a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = objc_msgSend(*(id *)(a1 + 40), "__calculateSizeAtPath:", objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2)));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100064D50;
  v5[3] = &unk_1000D6E28;
  v4 = *(NSObject **)(a1 + 56);
  v5[4] = *(_QWORD *)(a1 + 64);
  v5[5] = v3;
  dispatch_sync(v4, v5);
}

void sub_100064D50(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += *(_QWORD *)(a1 + 40);
  objc_autoreleasePoolPop(v2);
}

int64_t sub_100065B0C(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a3, "compare:", a2);
}

int64_t sub_100065E64(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a3, "compare:", a2);
}

id sub_1000665F0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "__filterCoreCaptureContent:", a2);
}

id sub_100066904(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "__filterCoreCaptureContent:", a2);
}

void sub_100066DCC(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  int v5;
  const __CFString *v6;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("InternalUUID"))), "appendString:", CFSTR("Filtered known networks for customer install without MegaWiFi profile\n"));
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = CFSTR("Filtered known networks for customer install without MegaWiFi profile\n");
    v4 = 12;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %{public}@", &v5, v4);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10006700C(id a1)
{
  uint64_t v1;
  const void *v2;

  v1 = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
  if (v1)
  {
    v2 = (const void *)v1;
    WiFiManagerClientDumpLogs(v1, 0);
    CFRelease(v2);
  }
}

void sub_10006A238(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_10006A290(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(objc_msgSend(*(id *)(a1[4] + 160), "objectForKeyedSubscript:", a1[5]), "unsignedIntegerValue");
  objc_autoreleasePoolPop(v2);
}

void sub_10006A2D4(uint64_t a1)
{
  NSMutableDictionary *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[7];

  v2 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", objc_msgSend(*(id *)(a1 + 32), "configuration"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("OutputDirectory"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("HomeDirectory"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("InternalUUID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 104)), CFSTR("IncludeEvents"));
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v3, "setConfiguration:", v2);
  v4 = objc_msgSend(*(id *)(a1 + 64), "__collectLogItem:error:", v3, 0);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setRequest:", *(_QWORD *)(a1 + 32));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006A3FC;
    block[3] = &unk_1000D6700;
    v6 = *(_QWORD *)(a1 + 96);
    block[5] = v5;
    block[6] = v6;
    v7 = *(NSObject **)(a1 + 72);
    block[4] = *(_QWORD *)(a1 + 80);
    dispatch_sync(v7, block);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));
}

void sub_10006A3FC(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10006A43C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  objc_autoreleasePoolPop(v2);
}

void sub_10006A46C(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 160), "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1[6]), a1[5]);
  objc_autoreleasePoolPop(v2);
}

void sub_10006A4B4(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (a1[4])
    objc_msgSend(*(id *)(a1[5] + 168), "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[6]), a1[4]);
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10006AE28(uint64_t a1, uint64_t a2)
{
  const __CFString *Group;

  if (!IOReportChannelGetGroup(a2))
    return 16;
  Group = (const __CFString *)IOReportChannelGetGroup(a2);
  return 16 * (CFStringFind(Group, (CFStringRef)*(_QWORD *)(a1 + 32), 1uLL).location == -1);
}

uint64_t sub_10006AE7C(uint64_t a1, uint64_t a2)
{
  const __CFString *Group;

  if (!IOReportChannelGetGroup(a2))
    return 16;
  Group = (const __CFString *)IOReportChannelGetGroup(a2);
  return 16 * (CFStringFind(Group, (CFStringRef)*(_QWORD *)(a1 + 32), 1uLL).location == -1);
}

uint64_t sub_10006AED0(uint64_t a1, uint64_t a2)
{
  const __CFString *SubGroup;

  if (!IOReportChannelGetSubGroup(a2))
    return 16;
  SubGroup = (const __CFString *)IOReportChannelGetSubGroup(a2);
  return 16 * (CFStringFind(SubGroup, (CFStringRef)*(_QWORD *)(a1 + 32), 1uLL).location == -1);
}

intptr_t sub_10006CF34(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 136315906;
    v8 = "-[W5LogManager __collectDeviceAnalyticsStore:]_block_invoke";
    v9 = 2080;
    v10 = "W5LogManager.m";
    v11 = 1024;
    v12 = 7123;
    v13 = 2114;
    v14 = v4;
    v6 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) Device Analytics Store File:%{public}@", &v7, v6);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t sub_10006D470(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 136315906;
    v8 = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]_block_invoke";
    v9 = 2080;
    v10 = "W5LogManager.m";
    v11 = 1024;
    v12 = 7187;
    v13 = 2114;
    v14 = v4;
    v6 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) Device Analytics Deployment Graph File:%{public}@", &v7, v6);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t sub_10006DB5C(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 136315906;
    v8 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]_block_invoke";
    v9 = 2080;
    v10 = "W5LogManager.m";
    v11 = 1024;
    v12 = 7257;
    v13 = 2112;
    v14 = v4;
    v6 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) Device Analytics CSV Files:%@", &v7, v6);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t sub_10006E0D0(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10006E65C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%d"), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48)), 1, 0, objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "corewifi"), "interfaceName"), 10, 1.0, 1.0, 1.0);
}

intptr_t sub_10006E6E0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancelAllOperations");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10006EF04(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10006F470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  uint64_t v53;

  _Block_object_dispose((const void *)(v53 - 176), 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void sub_10006F4BC(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  if (v3)
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "objectForKeyedSubscript:", v3);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"));
      v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("Requests"));
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "uuid"), "UUIDString"));
            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }
    }
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10006F62C(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(objc_msgSend(*(id *)(a1[4] + 160), "objectForKeyedSubscript:", a1[5]), "unsignedIntegerValue");
  objc_autoreleasePoolPop(v2);
}

void sub_10006F670(uint64_t a1)
{
  id v2;
  NSObject *v3;
  _QWORD block[5];
  __int128 v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "__collectIndividual:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
  v3 = *(NSObject **)(a1 + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F6EC;
  block[3] = &unk_1000D6FC0;
  v5 = *(_OWORD *)(a1 + 56);
  block[4] = v2;
  dispatch_sync(v3, block);
}

void sub_10006F6EC(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10006F738(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  NSNumber *v4;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (*(_QWORD *)(a1 + 56))
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_alloc_init((Class)W5LogItemReceipt);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRequest:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setStartedAt:", *(double *)(a1 + 64));
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setCompletedAt:");
    v3 = CFSTR("TimeoutOccurred");
    v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)(a1 + 56) != 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10006F870(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 160), "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1[6]), a1[5]);
  objc_autoreleasePoolPop(v2);
}

void sub_10006F8B8(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (a1[4])
    objc_msgSend(*(id *)(a1[5] + 168), "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[6]), a1[4]);
  objc_autoreleasePoolPop(v2);
}

void sub_100070530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_100070574(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  NSString *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  NSString *v11;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v4 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("NameOverride"));
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "stringFromDate:", +[NSDate date](NSDate, "date"));
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "substringToIndex:", 5);
  if (!v4)
    v4 = *(id *)(a1 + 48);
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [%@] BEGIN   %@\n"), v5, v6, v4);
  objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "objectForKeyedSubscript:", v3), "appendString:", v7);
  v8 = sub_10008F56C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v7;
    LODWORD(v9) = 12;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %{public}@", &v10, v9);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_1000706F0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "additionalLog"), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_100070734(_QWORD *a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = objc_autoreleasePoolPush();
  if (a1[4])
    v3 = objc_msgSend(objc_msgSend(*(id *)(a1[5] + 160), "objectForKeyedSubscript:"), "unsignedIntegerValue");
  else
    v3 = 0;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v3;
  if (a1[6])
    v4 = objc_msgSend(objc_msgSend(*(id *)(a1[5] + 168), "objectForKeyedSubscript:"), "unsignedLongLongValue");
  else
    v4 = 0;
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v4;
  objc_autoreleasePoolPop(v2);
}

void sub_1000707B4(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  NSString *v12;
  id v13;
  id v14;
  NSString *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  NSString *v22;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("InternalUUID"));
  v4 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", CFSTR("NameOverride"));
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "info"), "objectForKeyedSubscript:", CFSTR("TimeoutOccurred")), "BOOLValue");
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "stringFromDate:", +[NSDate date](NSDate, "date"));
    v8 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "substringToIndex:", 5);
    if (v6)
    {
      if (!v4)
        v4 = (id)W5DescriptionForLogItemID(objc_msgSend(*(id *)(a1 + 32), "itemID"));
      objc_msgSend(*(id *)(a1 + 40), "completedAt");
      v10 = v9;
      objc_msgSend(*(id *)(a1 + 40), "startedAt");
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [%@] TIMEOUT %@, took %.6fs\n"), v7, v8, v4, v10 - v11);
    }
    else
    {
      if (!v4)
        v4 = (id)W5DescriptionForLogItemID(objc_msgSend(*(id *)(a1 + 32), "itemID"));
      objc_msgSend(*(id *)(a1 + 40), "completedAt");
      v17 = v16;
      objc_msgSend(*(id *)(a1 + 40), "startedAt");
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [%@] END     %@, took %.6fs\n"), v7, v8, v4, v17 - v18);
    }
    v15 = v12;
    objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "objectForKeyedSubscript:", v3), "setObject:forKeyedSubscript:", 0, objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"));
  }
  else
  {
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "stringFromDate:", +[NSDate date](NSDate, "date"));
    v14 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "substringToIndex:", 5);
    if (!v4)
      v4 = (id)W5DescriptionForLogItemID(objc_msgSend(*(id *)(a1 + 32), "itemID"));
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [%@] ERROR   %@, not collected\n"), v13, v14, v4);
  }
  objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "objectForKeyedSubscript:", v3), "appendString:", v15);
  v19 = sub_10008F56C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543362;
    v22 = v15;
    LODWORD(v20) = 12;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %{public}@", &v21, v20);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100070E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_100070EB4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uuid"), "copy");
  objc_autoreleasePoolPop(v2);
}

id sub_100070EF8(uint64_t a1, void *a2, void *a3)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(a2, "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(a3, "copy");
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

void sub_10007515C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose((const void *)(v10 - 144), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007518C(uint64_t a1, void *a2)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_alloc_init((Class)W5PingResult);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAddress:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setInterfaceName:", objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "wifi"), "interfaceName"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCount:", (int)objc_msgSend(a2, "numPingsTransmitted"));
  objc_msgSend(a2, "packetLossRate");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPacketLoss:");
  objc_msgSend(a2, "averageRoundtripTime");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAvg:", v5 * 1000.0);
  objc_msgSend(a2, "minRoundtripTime");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMin:", v6 * 1000.0);
  objc_msgSend(a2, "maxRoundtripTime");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMax:", v7 * 1000.0);
  objc_msgSend(a2, "standardDeviationRoundtripTime");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setStddev:", v8 * 1000.0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setStartedAt:", *(double *)(a1 + 64));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setEndedAt:");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  objc_autoreleasePoolPop(v4);
}

void sub_100075DEC(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  NSAssertionHandler *v4;
  const void *v5;
  id v6;
  id v7;
  void *v8;
  NSAssertionHandler *v9;
  __int128 v10;
  uint64_t v11;
  void *v12;

  if (*(_QWORD *)(a1 + 32))
    v2 = *(__CFString **)(a1 + 32);
  else
    v2 = CFSTR("WiFi");
  if (!qword_1000FB728)
  {
    v10 = off_1000D70E0;
    v11 = 0;
    qword_1000FB728 = _sl_dlopen(&v10, 0);
  }
  if (qword_1000FB728)
  {
    *(_QWORD *)&v10 = 0;
    *((_QWORD *)&v10 + 1) = &v10;
    v11 = 0x2020000000;
    v3 = off_1000FB730;
    v12 = off_1000FB730;
    if (!off_1000FB730)
    {
      v4 = sub_10007781C();
      v3 = dlsym(v4, "CoreCaptureControlCreate");
      *(_QWORD *)(*((_QWORD *)&v10 + 1) + 24) = v3;
      off_1000FB730 = v3;
    }
    _Block_object_dispose(&v10, 8);
    if (v3)
    {
      v5 = (const void *)((uint64_t (*)(const CFAllocatorRef))v3)(kCFAllocatorDefault);
      if (!v5)
        return;
      v6 = -[__CFString UTF8String](v2, "UTF8String");
      v7 = objc_msgSend(*(id *)(a1 + 40), "UTF8String");
      *(_QWORD *)&v10 = 0;
      *((_QWORD *)&v10 + 1) = &v10;
      v11 = 0x2020000000;
      v8 = off_1000FB738;
      v12 = off_1000FB738;
      if (!off_1000FB738)
      {
        v9 = sub_10007781C();
        v8 = dlsym(v9, "CoreCaptureControlCaptureWithComponentDirectory");
        *(_QWORD *)(*((_QWORD *)&v10 + 1) + 24) = v8;
        off_1000FB738 = v8;
      }
      _Block_object_dispose(&v10, 8);
      if (v8)
      {
        ((void (*)(const void *, id, id))v8)(v5, v6, v7);
        CFRelease(v5);
        return;
      }
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Boolean soft_CoreCaptureControlCaptureWithComponentDirectory(CoreCaptureControlRef, const char *, const char *)"), CFSTR("W5LogManager.m"), 57, CFSTR("%s"), dlerror());
    }
    else
    {
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CoreCaptureControlRef soft_CoreCaptureControlCreate(CFAllocatorRef)"), CFSTR("W5LogManager.m"), 53, CFSTR("%s"), dlerror());
    }
    __break(1u);
  }
}

void sub_10007603C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100076508(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  id v11;
  id v12;
  DNSServiceErrorType v13;
  NSObject *v14;
  DNSServiceErrorType v15;
  NSObject *v16;
  DNSServiceRef sdRef;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;

  if ((a2 & 2) != 0)
  {
    v11 = objc_msgSend(a11, "addDomain:rdlen:", a9, a8);
    if (v11)
    {
      v12 = v11;
      sdRef = (DNSServiceRef)objc_msgSend(a11, "serviceRef");
      v13 = DNSServiceQueryRecord(&sdRef, 0x4000u, 0, -[NSString cStringUsingEncoding:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_services._dns-sd._udp.%@"), v12), "cStringUsingEncoding:", 4), 0xCu, 1u, (DNSServiceQueryRecordReply)sub_10007790C, a11);
      if (v13)
      {
        v15 = v13;
        v16 = sub_10008F56C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 136315906;
          v19 = "_ServiceBrowserDomainsQueryCallback";
          v20 = 2080;
          v21 = "W5LogManager.m";
          v22 = 1024;
          v23 = 10133;
          v24 = 1024;
          LODWORD(v25) = v15;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) DNSServiceQueryRecord failed. Error: %d", &v18, 34);
        }
      }
    }
    else
    {
      v14 = sub_10008F56C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315906;
        v19 = "_ServiceBrowserDomainsQueryCallback";
        v20 = 2080;
        v21 = "W5LogManager.m";
        v22 = 1024;
        v23 = 10127;
        v24 = 2112;
        v25 = 0;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) Failed to add domain: %@", &v18, 38);
      }
    }
  }
}

id sub_100076EDC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = a1[4];
  v2 = a1[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100076F50;
  v4[3] = &unk_1000D5CE8;
  v4[4] = a1[6];
  return +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:](NSTask, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", v1, v2, 0, 0, 0, v4, 2.0);
}

uint64_t sub_100076F50(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

Class sub_10007735C(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_1000FB700)
  {
    v3 = off_1000D7080;
    v4 = 0;
    qword_1000FB700 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("WADeviceAnalyticsClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  qword_1000FB6F8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

Class sub_100077414(uint64_t a1)
{
  uint64_t v2;
  Class result;
  NSAssertionHandler *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v6 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = qword_1000FB710;
  v10 = qword_1000FB710;
  if (!qword_1000FB710)
  {
    v11 = *(_OWORD *)off_1000D7098;
    v12 = 0;
    v2 = _sl_dlopen(&v11, &v6);
    v8[3] = v2;
    qword_1000FB710 = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    v4 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *libsysdiagnoseLibrary(void)");
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("W5LogManager.m"), 69, CFSTR("%s"), v6);
    goto LABEL_10;
  }
  if (v6)
    free(v6);
  result = objc_getClass("Libsysdiagnose");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getLibsysdiagnoseClass(void)_block_invoke"), CFSTR("W5LogManager.m"), 70, CFSTR("Unable to find class %s"), "Libsysdiagnose");
LABEL_10:
    __break(1u);
  }
  qword_1000FB708 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

void sub_1000775BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000775DC(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int v4;

  v2 = +[NSMutableString string](NSMutableString, "string");
  v3 = 0;
  while (*(_BYTE *)(a1 + v3))
  {
    if ((*(_BYTE *)(a1 + v3) - 127) >= 0xA1u)
      objc_msgSend(v2, "appendFormat:", CFSTR("%c"), *(char *)(a1 + v3));
    else
      objc_msgSend(v2, "appendString:", CFSTR("."));
    if (++v3 == 32)
      return objc_msgSend(v2, "copy");
  }
  if (v3 <= 0x1F)
  {
    v4 = 32 - v3;
    do
    {
      objc_msgSend(v2, "appendString:", CFSTR(" "));
      --v4;
    }
    while (v4);
  }
  return objc_msgSend(v2, "copy");
}

Class sub_1000776B0(uint64_t a1)
{
  Class result;
  NSAssertionHandler *v3;
  NSString *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  v5 = 0;
  if (!qword_1000FB718)
  {
    v6 = off_1000D70C8;
    v7 = 0;
    qword_1000FB718 = _sl_dlopen(&v6, &v5);
  }
  if (!qword_1000FB718)
  {
    v3 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *IMFoundationLibrary(void)");
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("W5LogManager.m"), 65, CFSTR("%s"), v5);
    goto LABEL_10;
  }
  if (v5)
    free(v5);
  result = objc_getClass("IMPingTest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getIMPingTestClass(void)_block_invoke"), CFSTR("W5LogManager.m"), 66, CFSTR("Unable to find class %s"), "IMPingTest");
LABEL_10:
    __break(1u);
  }
  qword_1000FB720 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

NSAssertionHandler *sub_10007781C()
{
  NSAssertionHandler *v0;
  id v1;
  NSString *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000FB728)
  {
    v5 = off_1000D70E0;
    v6 = 0;
    qword_1000FB728 = _sl_dlopen(&v5, &v4);
  }
  v0 = (NSAssertionHandler *)qword_1000FB728;
  if (!qword_1000FB728)
  {
    v0 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *CoreCaptureControlLibrary(void)");
    v1 = -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v0, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("W5LogManager.m"), 49, CFSTR("%s"), v4);
    __break(1u);
    goto LABEL_7;
  }
  v1 = v4;
  if (v4)
LABEL_7:
    free(v1);
  return v0;
}

void sub_10007790C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  id v11;
  void *v12;
  DNSServiceErrorType v13;
  NSObject *v14;
  DNSServiceErrorType v15;
  NSObject *v16;
  DNSServiceRef sdRef;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  DNSServiceErrorType v27;

  if ((a2 & 2) != 0)
  {
    v11 = objc_msgSend(a11, "addServiceType:rdlen:fullname:", a9, a8);
    if (v11)
    {
      v12 = v11;
      sdRef = (DNSServiceRef)objc_msgSend(a11, "serviceRef");
      v13 = DNSServiceBrowse(&sdRef, 0x4000u, 0, (const char *)objc_msgSend(objc_msgSend(v12, "objectAtIndexedSubscript:", 0), "cStringUsingEncoding:", 4), (const char *)objc_msgSend(objc_msgSend(v12, "objectAtIndexedSubscript:", 1), "cStringUsingEncoding:", 4), (DNSServiceBrowseReply)sub_100077B1C, a11);
      if (v13)
      {
        v15 = v13;
        v16 = sub_10008F56C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 136316162;
          v19 = "_ServiceBrowserServicesQueryCallback";
          v20 = 2080;
          v21 = "W5LogManager.m";
          v22 = 1024;
          v23 = 10102;
          v24 = 2112;
          v25 = v12;
          v26 = 1024;
          v27 = v15;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) DNSServiceBrowse for: %@ failed. Error: %d", &v18, 44);
        }
      }
    }
    else
    {
      v14 = sub_10008F56C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315906;
        v19 = "_ServiceBrowserServicesQueryCallback";
        v20 = 2080;
        v21 = "W5LogManager.m";
        v22 = 1024;
        v23 = 10098;
        v24 = 2112;
        v25 = 0;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) Failed to add serviceType: %@", &v18, 38);
      }
    }
  }
}

void sub_100077B1C(uint64_t a1, char a2, uint32_t a3, uint64_t a4, const char *a5, const char *a6, const char *a7, void *a8)
{
  DNSServiceErrorType v13;
  NSObject *v14;
  DNSServiceErrorType v15;
  NSObject *v16;
  DNSServiceRef sdRef;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  DNSServiceErrorType v31;

  if ((a2 & 2) != 0)
  {
    if ((objc_msgSend(a8, "addServiceInstance:serviceType:domain:", a5, a6, a7) & 1) != 0)
    {
      sdRef = (DNSServiceRef)objc_msgSend(a8, "serviceRef");
      v13 = DNSServiceResolve(&sdRef, 0x4000u, a3, a5, a6, a7, (DNSServiceResolveReply)sub_100077D20, a8);
      if (v13)
      {
        v15 = v13;
        v16 = sub_10008F56C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 136316674;
          v19 = "_ServiceBrowserBrowseCallback";
          v20 = 2080;
          v21 = "W5LogManager.m";
          v22 = 1024;
          v23 = 10072;
          v24 = 2080;
          v25 = a5;
          v26 = 2080;
          v27 = a6;
          v28 = 2080;
          v29 = a7;
          v30 = 1024;
          v31 = v15;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) DNSServiceResolve for:  %s, %s, %s failed. Error: %d", &v18, 64);
        }
      }
    }
    else
    {
      v14 = sub_10008F56C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136316418;
        v19 = "_ServiceBrowserBrowseCallback";
        v20 = 2080;
        v21 = "W5LogManager.m";
        v22 = 1024;
        v23 = 10068;
        v24 = 2080;
        v25 = a5;
        v26 = 2080;
        v27 = a6;
        v28 = 2080;
        v29 = a7;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) Failed to add serviceInstance: %s, %s, %s", &v18, 58);
      }
    }
  }
}

uint64_t sub_100077D20(uint64_t a1, uint64_t a2, uint32_t a3, uint64_t a4, uint64_t a5, const char *a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  NSArray *v13;
  uint64_t result;
  int v15;
  NSObject *v16;
  const char *v17;
  int v18;
  DNSServiceRef sdRef;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  _QWORD v32[2];

  v32[0] = a10;
  v32[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), a5);
  v13 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2);
  objc_msgSend(a10, "addBrowseContext:", v13);
  sdRef = (DNSServiceRef)objc_msgSend(a10, "serviceRef");
  result = DNSServiceGetAddrInfo(&sdRef, 0x4000u, a3, 3u, a6, (DNSServiceGetAddrInfoReply)sub_100077EB0, v13);
  if ((_DWORD)result)
  {
    v15 = result;
    v16 = sub_10008F56C();
    result = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)result)
    {
      v20 = 136316418;
      v21 = "_ServiceBrowserResolveCallback";
      v22 = 2080;
      v23 = "W5LogManager.m";
      v24 = 1024;
      v25 = 10046;
      v26 = 2080;
      v27 = a5;
      v28 = 2080;
      v29 = a6;
      v30 = 1024;
      v31 = v15;
      LODWORD(v17) = 54;
      return _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) DNSServiceGetAddrInfo for: (%s, %s) failed. Error: %d", (const char *)&v20, v17, v18, (const char *)sdRef);
    }
  }
  return result;
}

id sub_100077EB0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id result;

  result = objc_msgSend(a8, "count");
  if ((a2 & 2) != 0 && result == (id)2)
    return objc_msgSend(objc_msgSend(a8, "objectAtIndexedSubscript:", 0), "addBrowseResult:hostname:address:interfaceIndex:", objc_msgSend(a8, "objectAtIndexedSubscript:", 1), a5, a6, a3);
  return result;
}

void sub_100079FC8(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10007A0B8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD handler[5];

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 20))
  {
    *(_BYTE *)(v3 + 20) = 1;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10007A154;
    handler[3] = &unk_1000D6508;
    handler[4] = v5;
    notify_register_dispatch("com.apple.powermanagement.systempowerstate", (int *)(v5 + 16), v6, handler);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007A154(uint64_t a1)
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A1C0;
  block[3] = &unk_1000D5C98;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void sub_10007A1C0(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  const __CFString *v5;
  NSNumber *v6;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 16);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  v5 = CFSTR("SystemPowerStateCaps");
  v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "caps"));
  objc_msgSend(v3, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  objc_autoreleasePoolPop(v2);
}

void sub_10007A318(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 20))
  {
    *(_BYTE *)(v3 + 20) = 0;
    notify_cancel(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16));

  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007ACB0(id a1)
{
  W5CloudStore *v1;
  void *v2;

  v1 = objc_alloc_init(W5CloudStore);
  v2 = (void *)qword_1000FB740;
  qword_1000FB740 = (uint64_t)v1;

}

void sub_10007C138(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000FB750;
  qword_1000FB750 = (uint64_t)v1;

}

id sub_10007C2C8()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1000FB760;
  v7 = qword_1000FB760;
  if (!qword_1000FB760)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10007D95C;
    v3[3] = &unk_1000D5380;
    v3[4] = &v4;
    sub_10007D95C((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10007C368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007C458(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_getWAAnalyticsAccess"));
  objc_msgSend(v1, "reset");

}

void sub_10007C6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007C6EC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10007C6FC(uint64_t a1)
{

}

void sub_10007C704(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 39);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7 = CFSTR("LastHourFaultsStatus");
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v3, "setInfo:", v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

  objc_autoreleasePoolPop(v2);
}

void sub_10007C7FC(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 40);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7 = CFSTR("LastHourLinkTestsStatus");
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v3, "setInfo:", v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

  objc_autoreleasePoolPop(v2);
}

void sub_10007C8F4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)W5Event);
  objc_msgSend(v3, "setEventID:", 41);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7 = CFSTR("LastHourRecoveriesStatus");
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v3, "setInfo:", v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

  objc_autoreleasePoolPop(v2);
}

void sub_10007CAE8(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_performFetch:error:", v3, &obj));
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_10007D20C(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  id v12;
  int v13;
  id v14;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)a1[4];
  v5 = a1[5];
  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_performFetch:error:", v5, &v12));
  v7 = v12;
  if (v7)
  {
    v8 = sub_10008F56C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      v11 = 12;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] Will return error %@", &v13, v11);
    }

  }
  v10 = a1[6];
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v7, v6);

  objc_autoreleasePoolPop(v3);
  objc_autoreleasePoolPop(v2);
}

void sub_10007D3EC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = 0;

  v5 = objc_retainBlock(*(id *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v5;

  objc_autoreleasePoolPop(v2);
}

void sub_10007D4EC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = 0;

  v5 = objc_retainBlock(*(id *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v5;

  objc_autoreleasePoolPop(v2);
}

void sub_10007D5EC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = 0;

  v5 = objc_retainBlock(*(id *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v5;

  objc_autoreleasePoolPop(v2);
}

void sub_10007D694(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  _WORD v9[8];

  v2 = objc_autoreleasePoolPush();
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v3 = sub_10008F56C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 0;
      v8 = 2;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] W5DatabaseManager startEventMonitoring", v9, v8);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v6 + 16), "persistentStoreCoordinator"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v6, "remoteStoreUpdate:", NSPersistentStoreRemoteChangeNotification, v7);

  }
  objc_autoreleasePoolPop(v2);
}

void sub_10007D800(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  _WORD v7[8];

  v2 = objc_autoreleasePoolPush();
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v3 = sub_10008F56C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 0;
      v6 = 2;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] W5DatabaseManager stopEventMonitoring", v7, v6);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:", *(_QWORD *)(a1 + 32));

  }
  objc_autoreleasePoolPop(v2);
}

Class sub_10007D95C(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;

  v6 = 0;
  if (!qword_1000FB768)
  {
    v7 = off_1000D7190;
    v8 = 0;
    qword_1000FB768 = _sl_dlopen(&v7, &v6);
  }
  if (!qword_1000FB768)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *WiFiAnalyticsLibrary(void)"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("W5DatabaseManager.m"), 19, CFSTR("%s"), v6);

    goto LABEL_10;
  }
  if (v6)
    free(v6);
  result = objc_getClass("WAAnalyticsAccess");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getWAAnalyticsAccessClass(void)_block_invoke"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("W5DatabaseManager.m"), 21, CFSTR("Unable to find class %s"), "WAAnalyticsAccess");

LABEL_10:
    __break(1u);
  }
  qword_1000FB760 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10007DDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007DDD0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_10007DDE0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_10007DDEC(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10007DED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007DEF0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10007DFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007DFF4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10007E0C4(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32);
  objc_autoreleasePoolPop(v2);
}

void sub_10007E184(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33);
  objc_autoreleasePoolPop(v2);
}

void sub_10007E260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007E278(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_10007E54C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, int a12, uint64_t a13, __int16 a14, uint64_t a15, __int16 a16, int a17, __int16 a18, uint64_t a19)
{
  NSObject *v19;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v19 = sub_10008F56C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) [NSFileHandle writeData:] failed with exception %{public}@");
    objc_end_catch();
    JUMPOUT(0x10007E518);
  }
  _Unwind_Resume(exception_object);
}

void sub_10007E674(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = objc_autoreleasePoolPush();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)a1[4];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
      if ((uint64_t)objc_msgSend(v8, "integerValue") < 1 || (uint64_t)objc_msgSend(v8, "integerValue") > 41)
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    objc_msgSend(*(id *)(a1[5] + 24), "addObjectsFromArray:", a1[4]);
  }
  objc_msgSend(*(id *)(a1[5] + 80), "xpcConnection:startMonitoringEvents:reply:", a1[5], a1[4], a1[6]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007E804(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = objc_autoreleasePoolPush();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)a1[4];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
      if ((uint64_t)objc_msgSend(v8, "integerValue") < 1 || (uint64_t)objc_msgSend(v8, "integerValue") > 41)
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    objc_msgSend(*(id *)(a1[5] + 24), "removeObjectsInArray:", a1[4]);
  }
  objc_msgSend(*(id *)(a1[5] + 80), "xpcConnection:stopMonitoringEvents:reply:", a1[5], a1[4], a1[6]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007E990(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "xpcConnection:queryLocalPeerAndReply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10007EA20(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:queryStatusForPeer:reply:", a1[4], a1[5], a1[6]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007EAB4(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:queryDatabaseForPeer:fetch:reply:", a1[4], a1[5], a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007EB48(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:requestFileFromPeer:remoteFilePath:reply:", a1[4], a1[5], a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007EBDC(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:listFilesFromPeer:remoteDirPath:reply:", a1[4], a1[5], a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007EC70(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:queryDebugConfigurationForPeer:reply:", a1[4], a1[5], a1[6]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007ED04(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:setDebugConfiguration:peer:reply:", a1[4], a1[5], a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007ED9C(uint64_t a1)
{
  void *v2;
  W5ActiveRequest *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void **v7;
  uint64_t v8;
  __n128 (*v9)(uint64_t, uint64_t, uint64_t);
  void *v10;
  uint64_t v11;
  W5ActiveRequest *v12;
  uint64_t v13;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 1);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Peer"));
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", objc_msgSend(v4, "peerID"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", objc_msgSend(v4, "type") != (id)6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "addObject:", v3);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(v5 + 80);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10007EEAC;
  v10 = &unk_1000D71D8;
  v11 = v5;
  v12 = v3;
  v13 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v6, "xpcConnection:runDiagnostics:configuration:uuid:reply:");
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007EEAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  __n128 result;
  _QWORD block[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  block[0] = _NSConcreteStackBlock;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = sub_10007EF18;
  block[3] = &unk_1000D71B0;
  v8 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v10 = a3;
  v11 = v5;
  v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void sub_10007EF18(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 16), "removeObject:", a1[5]);
  v3 = a1[8];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007EFC0(uint64_t a1)
{
  void *v2;
  W5ActiveRequest *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void **v7;
  uint64_t v8;
  __n128 (*v9)(uint64_t, uint64_t, uint64_t);
  void *v10;
  uint64_t v11;
  W5ActiveRequest *v12;
  uint64_t v13;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 1);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Peer"));
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", objc_msgSend(v4, "peerID"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", objc_msgSend(v4, "type") != (id)6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "addObject:", v3);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(v5 + 80);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10007F0D0;
  v10 = &unk_1000D71D8;
  v11 = v5;
  v12 = v3;
  v13 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v6, "xpcConnection:runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:");
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007F0D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  __n128 result;
  _QWORD block[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  block[0] = _NSConcreteStackBlock;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = sub_10007F13C;
  block[3] = &unk_1000D71B0;
  v8 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v10 = a3;
  v11 = v5;
  v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void sub_10007F13C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 16), "removeObject:", a1[5]);
  v3 = a1[8];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007F1E0(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:registerRemoteDiagnosticEventsForPeer:configuration:reply:", a1[4], a1[5], a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007F274(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:unregisterRemoteDiagnosticEventsForPeer:configuration:reply:", a1[4], a1[5], a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007F304(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "xpcConnection:queryRegisteredDiagnosticsPeersWithReply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10007F394(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:startDiagnosticsModeWithConfiguration:reply:", a1[4], a1[5], a1[6]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007F428(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:stopDiagnosticsModeWithUUID:info:reply:", a1[4], a1[5], a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007F4BC(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:queryDiagnosticsModeForPeer:info:reply:", a1[4], a1[5], a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007F554(uint64_t a1)
{
  void *v2;
  W5ActiveRequest *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void **v7;
  uint64_t v8;
  __n128 (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v10;
  uint64_t v11;
  W5ActiveRequest *v12;
  uint64_t v13;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 2);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Peer"));
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", objc_msgSend(v4, "peerID"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", objc_msgSend(v4, "type") != (id)6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "addObject:", v3);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(v5 + 80);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10007F664;
  v10 = &unk_1000D7228;
  v11 = v5;
  v12 = v3;
  v13 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v6, "xpcConnection:collectLogs:configuration:uuid:reply:");
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007F664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v4;
  NSObject *v5;
  uint64_t v6;
  __n128 result;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8[0] = _NSConcreteStackBlock;
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v8[1] = 3221225472;
  v8[2] = sub_10007F6D0;
  v8[3] = &unk_1000D7200;
  v9 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = v6;
  dispatch_async(v5, v8);
  return result;
}

void sub_10007F6D0(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 16), "removeObject:", a1[5]);
  v3 = a1[9];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, a1[6], a1[7], a1[8]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007F778(uint64_t a1)
{
  void *v2;
  W5ActiveRequest *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void **v8;
  uint64_t v9;
  __n128 (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v11;
  uint64_t v12;
  W5ActiveRequest *v13;
  uint64_t v14;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 2);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Peer"));
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", objc_msgSend(v4, "peerID"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", objc_msgSend(v4, "type") != (id)6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "addObject:", v3);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(void **)(v5 + 80);
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10007F884;
  v11 = &unk_1000D7228;
  v12 = v5;
  v13 = v3;
  v14 = v6;
  objc_msgSend(v7, "xpcConnection:collectLogsDiagnosticMode:uuid:reply:");
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007F884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v4;
  NSObject *v5;
  uint64_t v6;
  __n128 result;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8[0] = _NSConcreteStackBlock;
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v8[1] = 3221225472;
  v8[2] = sub_10007F8F0;
  v8[3] = &unk_1000D7200;
  v9 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = v6;
  dispatch_async(v5, v8);
  return result;
}

void sub_10007F8F0(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 16), "removeObject:", a1[5]);
  v3 = a1[9];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, a1[6], a1[7], a1[8]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007F998(_QWORD *a1)
{
  void *v2;
  W5ActiveRequest *v3;
  uint64_t v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void *v9;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 4);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", a1[4]);
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", 0);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", 1);
  objc_msgSend(*(id *)(a1[5] + 16), "addObject:", v3);
  v4 = a1[5];
  v5 = *(void **)(v4 + 80);
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_10007FA7C;
  v9 = &unk_1000D6108;
  objc_msgSend(v5, "xpcConnection:startPeerDiscoveryWithConfiguration:uuid:reply:", _NSConcreteStackBlock, 3221225472, sub_10007FA7C, &unk_1000D6108, v4, a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007FA7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007FAD4;
  v4[3] = &unk_1000D5FC8;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

void sub_10007FAD4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10007FB6C(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:stopPeerDiscoveryWithUUID:reply:", a1[4], a1[5], a1[6]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007FC08(uint64_t a1)
{
  void *v2;
  W5ActiveRequest *v3;
  uint64_t v4;
  void *v5;
  double v6;
  void **v7;
  uint64_t v8;
  __n128 (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v10;
  uint64_t v11;
  W5ActiveRequest *v12;
  uint64_t v13;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 3);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(_QWORD *)(a1 + 32));
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", objc_msgSend(*(id *)(a1 + 40), "peerID"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "addObject:", v3);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(v4 + 80);
  v6 = *(double *)(a1 + 72);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10007FCF4;
  v10 = &unk_1000D7278;
  v11 = v4;
  v12 = v3;
  v13 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v5, "xpcConnection:runWiFiSnifferOnChannels:duration:peer:uuid:reply:", v6);
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007FCF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __int128 v5;
  NSObject *v6;
  uint64_t v7;
  __n128 result;
  _QWORD block[4];
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_OWORD *)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  v6 = *(NSObject **)(v5 + 8);
  block[1] = 3221225472;
  block[2] = sub_10007FD64;
  block[3] = &unk_1000D7250;
  v10 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v14 = a5;
  v15 = v7;
  v11 = a2;
  v12 = a3;
  v13 = a4;
  dispatch_async(v6, block);
  return result;
}

void sub_10007FD64(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 16), "removeObject:", a1[5]);
  v3 = a1[10];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, a1[6], a1[7], a1[8], a1[9]);
  objc_autoreleasePoolPop(v2);
}

void sub_10007FE14(uint64_t a1)
{
  void *v2;
  W5ActiveRequest *v3;
  uint64_t v4;
  void *v5;
  double v6;
  void **v7;
  uint64_t v8;
  __n128 (*v9)(uint64_t, uint64_t, uint64_t);
  void *v10;
  uint64_t v11;
  W5ActiveRequest *v12;
  uint64_t v13;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 3);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(_QWORD *)(a1 + 32));
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", objc_msgSend(*(id *)(a1 + 40), "peerID"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "addObject:", v3);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(v4 + 80);
  v6 = *(double *)(a1 + 72);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10007FF00;
  v10 = &unk_1000D71D8;
  v11 = v4;
  v12 = v3;
  v13 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v5, "xpcConnection:runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:", v6);
  objc_autoreleasePoolPop(v2);
}

__n128 sub_10007FF00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  __n128 result;
  _QWORD block[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  block[0] = _NSConcreteStackBlock;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = sub_10007FF6C;
  block[3] = &unk_1000D71B0;
  v8 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v10 = a3;
  v11 = v5;
  v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void sub_10007FF6C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 16), "removeObject:", a1[5]);
  v3 = a1[8];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_100080010(uint64_t a1)
{
  void *v2;
  W5ActiveRequest *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void **v7;
  uint64_t v8;
  __n128 (*v9)(uint64_t, uint64_t);
  void *v10;
  uint64_t v11;
  W5ActiveRequest *v12;
  uint64_t v13;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(W5ActiveRequest);
  -[W5ActiveRequest setType:](v3, "setType:", 5);
  -[W5ActiveRequest setUuid:](v3, "setUuid:", *(_QWORD *)(a1 + 32));
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Peer")), "peerID"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "addObject:", v3);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(v4 + 80);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100080100;
  v10 = &unk_1000D72C8;
  v11 = v4;
  v12 = v3;
  v13 = v5;
  objc_msgSend(v6, "xpcConnection:runWiFiPerformanceLoggingWithConfiguration:uuid:reply:");
  objc_autoreleasePoolPop(v2);
}

__n128 sub_100080100(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = _NSConcreteStackBlock;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v6[1] = 3221225472;
  v6[2] = sub_100080168;
  v6[3] = &unk_1000D6130;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void sub_100080168(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 16), "removeObject:", a1[5]);
  v3 = a1[7];
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, a1[6]);
  objc_autoreleasePoolPop(v2);
}

void sub_10008020C(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(a1 + 32), "__activeRequestWithUUID:", *(_QWORD *)(a1 + 40));
  if (v3)
  {
    v4 = v3;
    switch((unint64_t)objc_msgSend(v3, "type"))
    {
      case 1uLL:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "xpcConnection:cancelDiagnosticsWithUUID:peerID:reply:", *(_QWORD *)(a1 + 32), objc_msgSend(v4, "uuid"), objc_msgSend(v4, "peerID"), 0);
        break;
      case 2uLL:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "xpcConnection:cancelCollectLogsWithUUID:peerID:reply:", *(_QWORD *)(a1 + 32), objc_msgSend(v4, "uuid"), objc_msgSend(v4, "peerID"), 0);
        break;
      case 3uLL:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "xpcConnection:cancelWiFiSnifferWithUUID:peerID:reply:", *(_QWORD *)(a1 + 32), objc_msgSend(v4, "uuid"), objc_msgSend(v4, "peerID"), 0);
        break;
      case 5uLL:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "xpcConnection:cancelWiFiPerformanceLoggingWithUUID:peerID:reply:", *(_QWORD *)(a1 + 32), objc_msgSend(v4, "uuid"), objc_msgSend(v4, "peerID"), 0);
        break;
      default:
        break;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v4);
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  objc_autoreleasePoolPop(v2);
}

void sub_1000803D4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = objc_autoreleasePoolPush();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(v8, "type");
        if (v9 == (id)3)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "xpcConnection:cancelWiFiSnifferWithUUID:peerID:reply:", *(_QWORD *)(a1 + 32), objc_msgSend(v8, "uuid"), objc_msgSend(v8, "peerID"), 0);
        }
        else if (v9 == (id)2)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "xpcConnection:cancelCollectLogsWithUUID:peerID:reply:", *(_QWORD *)(a1 + 32), objc_msgSend(v8, "uuid"), objc_msgSend(v8, "peerID"), 0);
        }
        else if (v9 == (id)1)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "xpcConnection:cancelDiagnosticsWithUUID:peerID:reply:", *(_QWORD *)(a1 + 32), objc_msgSend(v8, "uuid"), objc_msgSend(v8, "peerID"), 0);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
  objc_autoreleasePoolPop(v2);
}

void sub_10008061C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  if (a1[8] == 1)
    objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:cancelWiFiSnifferWithUUID:peer:reply:", a1[4], a1[5], a1[6], 0);
  v3 = a1[7];
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  objc_autoreleasePoolPop(v2);
}

void sub_1000806D8(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "__logMessage:timestamped:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  objc_autoreleasePoolPop(v2);
}

void sub_10008077C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 24), "addObject:", &off_1000E3A38);
  v3 = a1[4];
  if (!a1[5])
  {
    v5 = *(void **)(v3 + 80);
LABEL_7:
    objc_msgSend(v5, "xpcConnection:startMonitoringFaultEventsForPeer:reply:");
    goto LABEL_8;
  }
  if ((objc_msgSend(*(id *)(v3 + 72), "containsObject:", a1[5]) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1[4] + 72), "addObject:", a1[5]);
    v5 = *(void **)(a1[4] + 80);
    goto LABEL_7;
  }
  v4 = a1[6];
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
LABEL_8:
  objc_autoreleasePoolPop(v2);
}

void sub_100080870(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (a1[4])
    objc_msgSend(*(id *)(a1[5] + 72), "removeObject:");
  objc_msgSend(*(id *)(a1[5] + 24), "removeObject:", &off_1000E3A38);
  objc_msgSend(*(id *)(a1[5] + 80), "xpcConnection:stopMonitoringFaultEventsForPeer:reply:", a1[5], a1[4], a1[6]);
  objc_autoreleasePoolPop(v2);
}

void sub_10008092C(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:submitFaultEvent:reply:", a1[4], a1[5], a1[6]);
  objc_autoreleasePoolPop(v2);
}

void sub_1000809C0(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 80), "xpcConnection:queryFaultEventCacheForPeer:reply:", a1[4], a1[5], a1[6]);
  objc_autoreleasePoolPop(v2);
}

void sub_100080C70(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void (**v45)(_QWORD, _QWORD);
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  NSErrorUserInfoKey v63;
  const __CFString *v64;
  _BYTE v65[128];

  v7 = a2;
  v57 = a3;
  v55 = a4;
  v56 = v7;
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ResponsePeer")));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RequestPeer")));
  if (!v8)
    v8 = objc_alloc_init((Class)W5Peer);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", RPOptionSenderIDSDeviceID));
  objc_msgSend(v8, "setPeerID:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", RPOptionSenderDeviceName));
  objc_msgSend(v8, "setName:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", RPOptionSenderModelID));
  objc_msgSend(v8, "setModel:", v11);

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Type")));
  switch((unint64_t)objc_msgSend(v54, "integerValue"))
  {
    case 1uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "faultEventCache"));
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      if (!v13)
        goto LABEL_24;
      v14 = *(_QWORD *)v60;
      break;
    case 2uLL:
      v29 = *(id *)(a1 + 32);
      objc_sync_enter(v29);
      v30 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      if (!v30)
      {
        v31 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(void **)(v32 + 16);
        *(_QWORD *)(v32 + 16) = v31;

        objc_msgSend(*(id *)(a1 + 32), "__unarchiveNotifyPeers");
        v30 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      }
      objc_msgSend(v30, "addObject:", v8);
      objc_msgSend(*(id *)(a1 + 32), "__archiveNotifyPeers");
      if (!v55)
        goto LABEL_35;
      goto LABEL_34;
    case 3uLL:
      v29 = *(id *)(a1 + 32);
      objc_sync_enter(v29);
      v34 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      if (!v34)
      {
        v35 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v36 = *(_QWORD *)(a1 + 32);
        v37 = *(void **)(v36 + 16);
        *(_QWORD *)(v36 + 16) = v35;

        objc_msgSend(*(id *)(a1 + 32), "__unarchiveNotifyPeers");
        v34 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      }
      objc_msgSend(v34, "removeObject:", v8);
      objc_msgSend(*(id *)(a1 + 32), "__archiveNotifyPeers");
      if (v55)
LABEL_34:
        (*((void (**)(id, _QWORD, _QWORD))v55 + 2))(v55, 0, 0);
LABEL_35:
      objc_sync_exit(v29);

      goto LABEL_49;
    case 4uLL:
      v38 = *(id *)(a1 + 32);
      objc_sync_enter(v38);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "countForObject:", v8))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Event")));
        v40 = v39;
        if (v39)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "peer"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "peerID"));

          if (!v42)
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peerID"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "peer"));
            objc_msgSend(v44, "setPeerID:", v43);

          }
          objc_msgSend(*(id *)(a1 + 32), "__addFaultEvent:", v40);
          v45 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "faultEventHandler"));
          ((void (**)(_QWORD, void *))v45)[2](v45, v40);

        }
        if (v55)
          (*((void (**)(id, _QWORD, _QWORD))v55 + 2))(v55, 0, 0);

      }
      else
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "diagnosticsModeManager"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "diagnosticsModeManager"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localPeer"));
        v49 = objc_msgSend(v46, "registeredRoleForPeer:", v48);

        if (v49 == (id)16)
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Event")));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "diagnosticsModeManager"));
          objc_msgSend(v51, "handlePeerFaultEvent:", v50);

        }
        else if (v55)
        {
          v63 = NSLocalizedFailureReasonErrorKey;
          v64 = CFSTR("ENXIO");
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 6, v52));
          (*((void (**)(id, void *, _QWORD))v55 + 2))(v55, v53, 0);

        }
      }
      objc_sync_exit(v38);

      goto LABEL_49;
    default:
      goto LABEL_49;
  }
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(_QWORD *)v60 != v14)
        objc_enumerationMutation(v12);
      v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "peer"));
      if (v17 == v8)
      {

LABEL_17:
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "peer"));
        objc_msgSend(v23, "setPeerID:", 0);
        goto LABEL_21;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "peer"));
      v19 = v18;
      if (v18)
        v20 = v8 != 0;
      else
        v20 = 0;
      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "peer"));
        v22 = objc_msgSend(v21, "isEqual:", v8);

        if (v22)
          goto LABEL_17;
      }
      else
      {

      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "peer"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "peerID"));
      v26 = v25 == 0;

      if (!v26)
        continue;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "peerID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "peer"));
      objc_msgSend(v27, "setPeerID:", v23);

LABEL_21:
    }
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  }
  while (v13);
LABEL_24:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v12, CFSTR("Cache"));
  if (v55)
    (*((void (**)(id, _QWORD, void *))v55 + 2))(v55, 0, v28);

LABEL_49:
}

void sub_100081308(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000814DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000814F4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = a4;
  if (!v15)
  {
    v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    if (!v10)
    {
      v11 = objc_alloc_init((Class)NSCountedSet);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 24);
      *(_QWORD *)(v12 + 24) = v11;

      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    }
    objc_msgSend(v10, "addObject:", *(_QWORD *)(a1 + 40));
    objc_sync_exit(v9);

  }
  v14 = *(_QWORD *)(a1 + 48);
  if (v14)
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);

}

void sub_1000815BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100081770(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10008178C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100081918(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a2;
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Cache")));
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v6);

  }
}

int64_t sub_1000823B4(id a1, W5Event *a2, W5Event *a3)
{
  W5Event *v4;
  W5Event *v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  -[W5Event timestamp](v4, "timestamp");
  v7 = v6;
  -[W5Event timestamp](v5, "timestamp");
  if (v7 <= v8)
  {
    -[W5Event timestamp](v5, "timestamp");
    v11 = v10;
    -[W5Event timestamp](v4, "timestamp");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

void sub_100082AF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100082B48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void sub_100082B54(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (v10)
  {
    v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
    objc_sync_exit(v9);

  }
}

void sub_100082BDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100082C84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100082D50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000840C4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;

  v2 = sub_10008F56C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "-[W5RapportServer _configureCompaionLinkClient]_block_invoke";
    v8 = 2080;
    v9 = "W5RapportServer.m";
    v10 = 1024;
    v11 = 76;
    v5 = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) rapport discovery session invalidated", (const char *)&v6, v5);
  }

  return objc_msgSend(*(id *)(a1 + 32), "invalidateDiscoveryClient");
}

void sub_10008441C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  W5RapportClientRequest *v30;
  id v31;
  W5RapportClientRequest *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void **v42;
  uint64_t v43;
  void (*v44)(uint64_t, void *, void *);
  void *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  W5RapportClientRequest *v51;

  v7 = a2;
  v8 = a4;
  v9 = *(void **)(a1 + 32);
  v10 = a3;
  v11 = objc_msgSend(v9, "requestPayloadClass");
  if (!v11)
  {
    v16 = 0;
    goto LABEL_12;
  }
  v12 = sub_100091474();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v49 = (id)objc_opt_class(v11, v14);
    v15 = v49;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5RapportServer payloadFromDictionary", "%@", buf, 0xCu);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "payloadFromDictionary:", v7));
  v17 = sub_100091474();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = os_signpost_enabled(v18);
  if (v16)
  {
    if (v19)
    {
      v21 = (void *)objc_opt_class(v11, v20);
      *(_DWORD *)buf = 138412290;
      v49 = v21;
      v22 = v21;
      v23 = "%@";
LABEL_10:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5RapportServer payloadFromDictionary", v23, buf, 0xCu);

    }
  }
  else if (v19)
  {
    v24 = (void *)objc_opt_class(v11, v20);
    *(_DWORD *)buf = 138412290;
    v49 = v24;
    v22 = v24;
    v23 = "%@ Failure";
    goto LABEL_10;
  }

LABEL_12:
  v25 = sub_100091474();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_signpost_enabled(v26))
  {
    v28 = (void *)objc_opt_class(v11, v27);
    *(_DWORD *)buf = 138412290;
    v49 = v28;
    v29 = v28;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5RapportClientRequest initWithPayload", "%@", buf, 0xCu);

  }
  v30 = [W5RapportClientRequest alloc];
  v42 = _NSConcreteStackBlock;
  v43 = 3221225472;
  v44 = sub_10008486C;
  v45 = &unk_1000D7448;
  v31 = v8;
  v46 = v31;
  v47 = v11;
  v32 = -[W5RapportClientRequest initWithPayload:options:handler:](v30, "initWithPayload:options:handler:", v16, v10, &v42);

  v33 = sub_10008F56C();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    *(_DWORD *)buf = 138543618;
    v49 = v35;
    v50 = 2114;
    v51 = v32;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v34, 0, "[wifivelocity] handling incoming connection identifier='%{public}@' clientRequest='%{public}@'", buf, 22, v42, v43, v44, v45);

  }
  v36 = sub_100091474();
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_signpost_enabled(v37))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    *(_DWORD *)buf = 138412290;
    v49 = v38;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5PeerRequestListener handleClientRequest", "%@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "handleClientRequest:", v32);
  v39 = sub_100091474();
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_signpost_enabled(v40))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    *(_DWORD *)buf = 138412290;
    v49 = v41;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerRequestListener handleClientRequest", "%@", buf, 0xCu);

  }
}

void sub_10008486C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "encode"));
  v8 = v6;
  if (!v7)
  {
    v9 = sub_10008F56C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = (const char *)v5;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] failed to encode payload for response='%{public}@'", buf, 12);
    }

    v28 = NSLocalizedFailureReasonErrorKey;
    v29 = CFSTR("W5EncodingErr");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 8, v11));

  }
  v12 = sub_10008F56C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[W5RapportServer _registerRequestsForListener:rapportClient:]_block_invoke";
    v26 = 2114;
    v27 = v7;
    LODWORD(v23) = 22;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s: sending response payload='%{public}@'", buf, v23);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v14 = sub_100091474();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_signpost_enabled(v15);
  if (v8)
  {
    if (v16)
    {
      v18 = (void *)objc_opt_class(*(_QWORD *)(a1 + 40), v17);
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
      *(_DWORD *)buf = 138412546;
      v25 = (const char *)v18;
      v26 = 2112;
      v27 = v20;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5RapportClientRequest initWithPayload", "%@ Error=%@", buf, 0x16u);

    }
  }
  else if (v16)
  {
    v21 = (char *)objc_opt_class(*(_QWORD *)(a1 + 40), v17);
    *(_DWORD *)buf = 138412290;
    v25 = v21;
    v22 = v21;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5RapportClientRequest initWithPayload", "%@", buf, 0xCu);

  }
}

void sub_100086BA0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

id sub_100086BCC(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (((unint64_t)objc_msgSend(v10, "role", (_QWORD)v14) & a2) != 0)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    v11 = v4;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

void sub_100086D14(uint64_t a1)
{
  id WeakRetained;
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100086DC4;
  v7[3] = &unk_1000D74B8;
  v5 = *(id *)(a1 + 32);
  v8 = WeakRetained;
  v9 = v5;
  v6 = WeakRetained;
  dispatch_async(v4, v7);

}

void sub_100086DC4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "operationErrors"));
  (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);

  objc_autoreleasePoolPop(v2);
}

void sub_100087EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,id location)
{
  id *v59;

  objc_destroyWeak(v59);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100087F28(uint64_t a1)
{
  id WeakRetained;
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100087FD8;
  v7[3] = &unk_1000D74B8;
  v5 = *(id *)(a1 + 32);
  v8 = WeakRetained;
  v9 = v5;
  v6 = WeakRetained;
  dispatch_async(v4, v7);

}

void sub_100087FD8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "operationErrors"));
  (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);

  objc_autoreleasePoolPop(v2);
}

void sub_10008898C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 224));
  _Unwind_Resume(a1);
}

void sub_1000889B8(id *a1)
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  global_queue = dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088A78;
  block[3] = &unk_1000D7508;
  v6 = a1[5];
  v5 = a1[4];
  objc_copyWeak(&v7, a1 + 6);
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
}

void sub_100088A78(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;

  v2 = objc_autoreleasePoolPush();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "operationErrors"));
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v4, v6);

  objc_autoreleasePoolPop(v2);
}

void sub_100088C18(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100088C3C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  unint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  v6 = sub_10008F56C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 64);
      v10 = *(void **)(a1 + 32);
      v11 = sub_100088ED0(v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
      v23 = 136316162;
      v24 = "-[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]_block_invoke";
      v25 = 2048;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      v29 = 2114;
      v30 = v12;
      v31 = 2114;
      v32 = v13;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s: [DM] failed to run action=%ld (%@) on peer='%{public}@' error='%{public}@'", &v23, 52);

    }
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "operationErrors"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 64)));
    v21 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
    v22 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    -[NSObject addObject:](v7, "addObject:", v16);

  }
  else if (v8)
  {
    v17 = *(_QWORD *)(a1 + 64);
    v18 = sub_100088ED0(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = *(void **)(a1 + 32);
    v23 = 136315906;
    v24 = "-[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]_block_invoke";
    v25 = 2048;
    v26 = v17;
    v27 = 2112;
    v28 = v19;
    v29 = 2114;
    v30 = v20;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s: [DM] successful run action=%ld (%@) on peer='%{public}@'", &v23, 42);

  }
}

const __CFString *sub_100088ED0(unint64_t a1)
{
  if (a1 > 0xC)
    return CFSTR("Unknown");
  else
    return off_1000D7550[a1];
}

id sub_100088FC8(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a1;
  v19 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (((unint64_t)objc_msgSend(v10, "role") & a3) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peer"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peerID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peer"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peerID"));
          v15 = objc_msgSend(v12, "isEqualToString:", v14);

          if (v15)
          {
            v16 = v10;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

id sub_100089160(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a1;
  v4 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peer"));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peerID"));
        if ((id)v11 == v4)
        {

LABEL_13:
          v16 = v9;
          goto LABEL_14;
        }
        v12 = (void *)v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peer"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peerID"));
        v15 = objc_msgSend(v14, "isEqualToString:", v4);

        if (v15)
          goto LABEL_13;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v16 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_14:

  return v16;
}

void sub_10008B1D8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10008B204(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleRapportDeviceFound:", v3);

}

void sub_10008B24C(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleRapportDeviceLost:", v3);

}

void sub_10008BA54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  W5PeerGenericResponsePayload *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  int v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(W5PeerGenericResponsePayload);
  -[W5PeerGenericResponsePayload setInfo:](v7, "setInfo:", v6);
  v8 = sub_10008F56C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136316162;
    v14 = "-[W5PeerGenericRequestListener handleClientRequest:]_block_invoke";
    v15 = 2080;
    v16 = "W5PeerGenericRequestListener.m";
    v17 = 1024;
    v18 = 25;
    v19 = 2114;
    v20 = v5;
    v21 = 2114;
    v22 = v6;
    v12 = 48;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) SEND RESPONSE (error=%{public}@, info=%{public}@)", &v13, v12);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "handler"));
  if (v10)
  {
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "handler"));
    ((void (**)(_QWORD, W5PeerGenericResponsePayload *, id))v11)[2](v11, v7, v5);

  }
}

uint64_t start()
{
  void *v0;
  id v1;
  NSString *v2;
  W5Engine *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v7;
  _QWORD handler[5];
  sigaction v9;
  uint8_t buf[4];
  id v11;

  v0 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(objc_msgSend(&off_1000E3B10, "stringValue"), "UTF8String");
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "[wifivelocity] STARTUP! (v%{public}s)", buf, 0xCu);
  }
  v1 = objc_msgSend(CFSTR("/private"), "stringByAppendingPathComponent:", NSTemporaryDirectory());
  if (objc_msgSend(v1, "hasSuffix:", CFSTR("/")))
    v1 = objc_msgSend(v1, "substringToIndex:", (char *)objc_msgSend(v1, "length") - 1);
  v2 = -[NSURL path](-[NSFileManager containerURLForSecurityApplicationGroupIdentifier:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.wifi.logs")), "path");
  if (-[NSString hasSuffix:](v2, "hasSuffix:", CFSTR("/")))
    v2 = -[NSString substringToIndex:](v2, "substringToIndex:", (char *)-[NSString length](v2, "length") - 1);
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("com.apple.wifivelocity")), 0);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("com.apple.wifivelocity")), 0, 0, 0);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/log/com.apple.wifivelocity"), 0, 0, 0);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/run/com.apple.wifivelocity"), 0, 0, 0);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", -[NSString stringByAppendingPathComponent:](v2, "stringByAppendingPathComponent:", CFSTR("previous")), 0, 0, 0);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000D7600);
  v3 = objc_alloc_init(W5Engine);
  if (+[W5FeatureAvailability diagnosticsModeEnabled](W5FeatureAvailability, "diagnosticsModeEnabled")
    && _os_feature_enabled_impl("WiFiVelocity", "RapportServer"))
  {
    xpc_set_event_stream_handler("com.apple.rapport.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000D7648);
  }
  if (!v3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      objc_autoreleasePoolPop(v0);
      return 0;
    }
    *(_WORD *)buf = 0;
    v7 = "[wifivelocity] FAILED to initialize WiFiVelocity engine";
LABEL_19:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v7, buf, 2u);
    goto LABEL_17;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(_QWORD *)&v9.sa_mask = 0;
  sigaction(15, &v9, 0);
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  if (!v4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v7 = "[wifivelocity] FAILED to setup SIGTERM catcher";
    goto LABEL_19;
  }
  v5 = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10008E4B8;
  handler[3] = &unk_1000D5C98;
  handler[4] = v3;
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(v5);
  objc_autoreleasePoolPop(v0);
  -[W5Engine run](v3, "run");
  dispatch_source_cancel(v5);
  dispatch_release(v5);
  return 0;
}

void sub_10008DD3C(id a1, OS_xpc_object *a2)
{
  const char *string;
  const char *v3;
  size_t v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  dispatch_time_t v8;
  _QWORD block[7];
  _BYTE buf[24];
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    v3 = string;
    v4 = strlen(string);
    if (!strncmp(v3, "com.apple.wifivelocity-wake-120", v4))
    {
      v5 = 120;
    }
    else if (!strncmp(v3, "com.apple.wifivelocity-wake-240", v4))
    {
      v5 = 240;
    }
    else if (!strncmp(v3, "com.apple.wifivelocity-wake-600", v4))
    {
      v5 = 600;
    }
    else if (!strncmp(v3, "com.apple.wifivelocity-wake-86400", v4))
    {
      v5 = 86400;
    }
    else
    {
      if (strncmp(v3, "com.apple.private.alloy.wifivelocity.idslaunchnotification", v4))
        return;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] IDS-based launch\n", buf, 2u);
      }
      v5 = 60;
    }
    v6 = -[NSString substringToIndex:](-[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString"), "substringToIndex:", 5);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = v5;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] [%{public}@] BEGIN keepalive for %{public}lds\n", buf, 0x16u);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v11 = sub_10008DFD8;
    v12 = sub_10008DFE8;
    v13 = 0;
    v7 = os_transaction_create("com.apple.wifivelocity.keepalive.notifyd");
    objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", "com.apple.wifivelocity.keepalive.notifyd", v7);
    v13 = v7;
    v8 = dispatch_time(0, 1000000000 * v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008DFF4;
    block[3] = &unk_1000D7628;
    block[5] = buf;
    block[6] = v5;
    block[4] = v6;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
    _Block_object_dispose(buf, 8);
  }
}

void sub_10008DFD8(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_10008DFE8(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_10008DFF4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = a1[4];
    v3 = a1[6];
    v4 = 138543618;
    v5 = v2;
    v6 = 2050;
    v7 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] [%{public}@] END keepalive for %{public}lds\n", (uint8_t *)&v4, 0x16u);
  }
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = 0;
}

void sub_10008E0E0(id a1, OS_xpc_object *a2)
{
  const char *string;
  NSString *v4;
  uint64_t v5;
  dispatch_time_t v6;
  xpc_object_t reply;
  void *v8;
  uint8_t v9[8];
  _QWORD block[7];
  _BYTE buf[24];
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = string;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] RAPPORT WAKE! event='%s'", buf, 0xCu);
    if (string)
      goto LABEL_3;
  }
  else if (string)
  {
LABEL_3:
    v4 = -[NSString substringToIndex:](-[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString"), "substringToIndex:", 5);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = 60;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] [%{public}@] BEGIN RAPPORT keepalive for %{public}lds\n", buf, 0x16u);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v12 = sub_10008DFD8;
    v13 = sub_10008DFE8;
    v14 = 0;
    v5 = os_transaction_create("com.apple.wifivelocity.keepalive.rapport");
    objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", "com.apple.wifivelocity.keepalive.rapport", v5);
    v14 = v5;
    v6 = dispatch_time(0, 60000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008E3CC;
    block[3] = &unk_1000D7628;
    block[6] = 60;
    block[4] = v4;
    block[5] = buf;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    if ((xpc_dictionary_expects_reply(a2) & 1) != 0)
    {
      reply = xpc_dictionary_create_reply(a2);
      v8 = reply;
      if (reply)
      {
        xpc_dictionary_send_reply(reply);
        xpc_release(v8);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] failed to create rapport reply.", v9, 2u);
      }
    }
    _Block_object_dispose(buf, 8);
    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] bailing out early, no rapport event name.", buf, 2u);
  }
}

void sub_10008E3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10008E3CC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = a1[4];
    v3 = a1[6];
    v4 = 138543618;
    v5 = v2;
    v6 = 2050;
    v7 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] [%{public}@] END keepalive for %{public}lds\n", (uint8_t *)&v4, 0x16u);
  }
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = 0;
}

id sub_10008E4B8(uint64_t a1)
{
  void *v2;
  uint8_t v4[16];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] signal event handler called, exiting", buf, 2u);
  }
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] calling exit(EXIT_FAILURE)", v4, 2u);
    }
    exit(1);
  }
  return objc_msgSend(v2, "terminateAndNotify:", &stru_1000D7668);
}

void sub_10008E578(id a1)
{
  uint8_t v1[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] calling exit(143)", v1, 2u);
  }
  exit(143);
}

_UNKNOWN **sub_10008EEF4()
{
  return &off_1000E88E0;
}

id sub_10008EF00()
{
  return objc_msgSend(&off_1000E88E0, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(&off_1000E88E0, "count"));
}

CFStringRef sub_10008EF3C()
{
  CFStringRef result;
  CFStringRef v1;
  NSString *v2;

  result = SCDynamicStoreCopyComputerName(0, 0);
  if (result)
  {
    v1 = result;
    v2 = +[NSString stringWithString:](NSString, "stringWithString:", result);
    CFRelease(v1);
    return (CFStringRef)v2;
  }
  return result;
}

id sub_10008EF88()
{
  io_registry_entry_t v0;
  io_object_t v1;
  void *CFProperty;
  const void *v3;
  id v4;
  mach_port_t mainPort;

  mainPort = 0;
  if (IOMainPort(bootstrap_port, &mainPort))
    return 0;
  v0 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v0)
    return 0;
  v1 = v0;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v0, CFSTR("boot-args"), kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    IOObjectRelease(v1);
    return 0;
  }
  v3 = CFProperty;
  v4 = objc_msgSend(CFProperty, "componentsSeparatedByCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  IOObjectRelease(v1);
  CFRelease(v3);
  return v4;
}

void sub_10008F048(uint64_t a1, int a2)
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  io_registry_entry_t v8;
  io_registry_entry_t v9;
  uint64_t v10;
  id v11;
  id v12;
  kern_return_t v13;
  uint64_t v14;
  mach_error_t v15;
  uint64_t v16;
  const __CFString *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[24];
  __int128 v22;
  uint64_t v23;
  __int128 v24;

  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", sub_10008EF88());
  v5 = v4;
  if (!v4)
    goto LABEL_35;
  v6 = objc_msgSend(v4, "containsObject:", a1);
  if (a2)
  {
    if (v6)
    {
      if (qword_1000FB780 != -1)
        dispatch_once(&qword_1000FB780, &stru_1000D7688);
      v7 = qword_1000FB778;
      if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 136315906;
        *(_QWORD *)&v21[4] = "W5UpdateBootargs";
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "W5MiscUtil.m";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 133;
        WORD2(v22) = 2114;
        *(_QWORD *)((char *)&v22 + 6) = a1;
        LODWORD(v20) = 38;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s (%s:%u) %{public}@ is already in current boot-args", v21, v20, *(_QWORD *)v21, *(_OWORD *)&v21[8], v22);
      }
      goto LABEL_35;
    }
  }
  else if ((v6 & 1) == 0)
  {
    if (qword_1000FB780 != -1)
      dispatch_once(&qword_1000FB780, &stru_1000D7688);
    v19 = qword_1000FB778;
    if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v21 = 136315906;
      *(_QWORD *)&v21[4] = "W5UpdateBootargs";
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "W5MiscUtil.m";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 134;
      WORD2(v22) = 2114;
      *(_QWORD *)((char *)&v22 + 6) = a1;
      LODWORD(v20) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) %{public}@ is not present current in boot-args", v21, v20, *(_QWORD *)v21, *(_OWORD *)&v21[8], v22);
    }
    goto LABEL_35;
  }
  HIDWORD(v20) = 0;
  if (IOMainPort(bootstrap_port, (mach_port_t *)&v20 + 1)
    || (v8 = IORegistryEntryFromPath(HIDWORD(v20), "IODeviceTree:/options")) == 0)
  {
LABEL_35:

    return;
  }
  v9 = v8;
  if (qword_1000FB780 != -1)
    dispatch_once(&qword_1000FB780, &stru_1000D7688);
  v10 = qword_1000FB778;
  if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
    *(_DWORD *)v21 = 136315906;
    *(_QWORD *)&v21[4] = "W5UpdateBootargs";
    *(_WORD *)&v21[12] = 2080;
    *(_QWORD *)&v21[14] = "W5MiscUtil.m";
    *(_WORD *)&v21[22] = 1024;
    LODWORD(v22) = 143;
    WORD2(v22) = 2114;
    *(_QWORD *)((char *)&v22 + 6) = v11;
    LODWORD(v20) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) Existing boot-args: %{public}@", v21, v20);
  }
  if (a2)
    objc_msgSend(v5, "addObject:", a1);
  else
    objc_msgSend(v5, "removeObject:", a1);
  v12 = objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
  v13 = IORegistryEntrySetCFProperty(v9, CFSTR("boot-args"), v12);
  if (v13)
  {
    v15 = v13;
    if (qword_1000FB780 != -1)
      dispatch_once(&qword_1000FB780, &stru_1000D7688);
    v16 = qword_1000FB778;
    if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
    {
      if (a2)
        v17 = CFSTR("add");
      else
        v17 = CFSTR("remove");
      v18 = mach_error_string(v15);
      *(_DWORD *)v21 = 136316418;
      *(_QWORD *)&v21[4] = "W5UpdateBootargs";
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "W5MiscUtil.m";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 151;
      WORD2(v22) = 2114;
      *(_QWORD *)((char *)&v22 + 6) = v17;
      HIWORD(v22) = 2114;
      LOWORD(v24) = 2082;
      *(_QWORD *)((char *)&v24 + 2) = v18;
      LODWORD(v20) = 58;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) Unable to %{public}@ boot-arg: %{public}@, return: %{public}s", v21, v20, *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, a1, v24);
    }
  }
  else
  {
    if (qword_1000FB780 != -1)
      dispatch_once(&qword_1000FB780, &stru_1000D7688);
    v14 = qword_1000FB778;
    if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v21 = 136315906;
      *(_QWORD *)&v21[4] = "W5UpdateBootargs";
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "W5MiscUtil.m";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 153;
      WORD2(v22) = 2114;
      *(_QWORD *)((char *)&v22 + 6) = v12;
      LODWORD(v20) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) Updated device boot-args to: %{public}@", v21, v20, *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, v23, v24);
    }
  }

  IOObjectRelease(v9);
}

uint64_t sub_10008F56C()
{
  if (qword_1000FB780 != -1)
    dispatch_once(&qword_1000FB780, &stru_1000D7688);
  return qword_1000FB778;
}

uint64_t sub_10008F5AC(void *a1, void *a2, NSError **a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  off_t st_size;
  id v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  NSDictionary *v17;
  NSErrorDomain v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSInteger v23;
  uint64_t v25;
  stat v26;
  NSError *v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;
  NSErrorUserInfoKey v30;
  const __CFString *v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  int v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  id v41;
  __int16 v42;
  off_t v43;
  __int16 v44;
  id v45;

  v27 = 0;
  memset(&v26, 0, sizeof(v26));
  stat((const char *)objc_msgSend(objc_msgSend(a1, "path"), "UTF8String"), &v26);
  if (qword_1000FB780 != -1)
    dispatch_once(&qword_1000FB780, &stru_1000D7688);
  v6 = qword_1000FB778;
  v7 = os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v7)
  {
    v8 = objc_msgSend(a1, "path");
    st_size = v26.st_size;
    v10 = objc_msgSend(a2, "path");
    v34 = 136316418;
    v35 = "W5CreateTarball";
    v36 = 2080;
    v37 = "W5MiscUtil.m";
    v38 = 1024;
    v39 = 388;
    v40 = 2114;
    v41 = v8;
    v42 = 2048;
    v43 = st_size;
    v44 = 2114;
    v45 = v10;
    v7 = _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) Archiving '%{public}@' (size=%lld) --> '%{public}@'", &v34, 58);
  }
  v11 = archive_write_new(v7);
  if (!v11)
  {
    v32 = NSLocalizedFailureReasonErrorKey;
    v33 = CFSTR("ENOMEM");
    v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v18 = NSPOSIXErrorDomain;
    v19 = 12;
LABEL_17:
    v27 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, v19, v17);
    goto LABEL_18;
  }
  if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(a1, "path")))
  {
    v30 = NSLocalizedFailureReasonErrorKey;
    v31 = CFSTR("ENOENT");
    v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v18 = NSPOSIXErrorDomain;
    v19 = 2;
    goto LABEL_17;
  }
  archive_write_add_filter_gzip(v11);
  archive_write_set_format_pax(v11);
  v12 = archive_write_open_filename(v11, objc_msgSend(objc_msgSend(a2, "path"), "UTF8String"));
  if (v12)
  {
    v20 = v12;
    v28 = NSLocalizedFailureReasonErrorKey;
    v29 = CFSTR("err");
    v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v18 = NSPOSIXErrorDomain;
    v19 = v20;
    goto LABEL_17;
  }
  if ((sub_10008FAC8(v11, a1, objc_msgSend(objc_msgSend(a2, "lastPathComponent"), "stringByDeletingPathExtension"), (id *)&v27) & 1) != 0)
  {
    if (qword_1000FB780 != -1)
      dispatch_once(&qword_1000FB780, &stru_1000D7688);
    v13 = qword_1000FB778;
    if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(a1, "path");
      v15 = objc_msgSend(a2, "path");
      v34 = 136316162;
      v35 = "W5CreateTarball";
      v36 = 2080;
      v37 = "W5MiscUtil.m";
      v38 = 1024;
      v39 = 412;
      v40 = 2114;
      v41 = v14;
      v42 = 2114;
      v43 = (off_t)v15;
      LODWORD(v25) = 48;
      v16 = 1;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) Successfuly archived '%{public}@' --> '%{public}@'", &v34, v25);
    }
    else
    {
      v16 = 1;
    }
    goto LABEL_22;
  }
LABEL_18:
  if (qword_1000FB780 != -1)
    dispatch_once(&qword_1000FB780, &stru_1000D7688);
  v21 = qword_1000FB778;
  v16 = 0;
  if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_msgSend(a2, "path");
    v23 = -[NSError code](v27, "code");
    v35 = "W5CreateTarball";
    v36 = 2080;
    v34 = 136316162;
    v37 = "W5MiscUtil.m";
    v38 = 1024;
    v39 = 408;
    v40 = 2114;
    v41 = v22;
    v42 = 2048;
    v43 = v23;
    LODWORD(v25) = 48;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v21, 0, "[wifivelocity] %s (%s:%u) FAILED to create archive '%{public}@', returned error %ld", &v34, v25);
    v16 = 0;
  }
LABEL_22:
  if (a3 && v27)
    *a3 = v27;
  if (v11)
    archive_write_free(v11);
  return v16;
}

uint64_t sub_10008FAC8(uint64_t a1, void *a2, void *a3, id *a4)
{
  void *v8;
  uint64_t v9;
  id v10;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[12];
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  id v49;
  __int16 v50;
  off_t st_size;
  stat v52;

  v41 = 0;
  v8 = objc_autoreleasePoolPush();
  if (!objc_msgSend(a2, "checkResourceIsReachableAndReturnError:", &v41))
    goto LABEL_33;
  v40 = 0;
  if (!objc_msgSend(a2, "getResourceValue:forKey:error:", &v40, NSURLIsDirectoryKey, &v41))
    goto LABEL_33;
  if (objc_msgSend(v40, "BOOLValue"))
  {
    memset(&v52, 0, sizeof(v52));
    stat((const char *)objc_msgSend(objc_msgSend(a2, "path"), "UTF8String"), &v52);
    if (qword_1000FB780 != -1)
      dispatch_once(&qword_1000FB780, &stru_1000D7688);
    v9 = qword_1000FB778;
    if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(a2, "path");
      *(_QWORD *)&v43[4] = "__W5ArchiveAddURLToArchive";
      v44 = 2080;
      *(_DWORD *)v43 = 136316162;
      v45 = "W5MiscUtil.m";
      v46 = 1024;
      v47 = 341;
      v48 = 2114;
      v49 = v10;
      v50 = 2048;
      st_size = v52.st_size;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) Adding contents of directory '%{public}@' (size=%lld) to archive...", v43, 48);
    }
    v11 = -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a2, 0, 0, &v41);
    if (v11)
    {
      v12 = v11;
      v34 = a4;
      v13 = v8;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v37;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v37 != v16)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v17);
            v35 = 0;
            if ((sub_10008FAC8(a1, v18, objc_msgSend(a3, "stringByAppendingPathComponent:", objc_msgSend(v18, "lastPathComponent")), &v35) & 1) == 0)
            {
              if (qword_1000FB780 != -1)
                dispatch_once(&qword_1000FB780, &stru_1000D7688);
              v19 = qword_1000FB778;
              if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
              {
                v33 = objc_msgSend(a2, "path");
                v20 = objc_msgSend(v35, "code");
                *(_DWORD *)v43 = 136316162;
                *(_QWORD *)&v43[4] = "__W5ArchiveAddURLToArchive";
                v44 = 2080;
                v45 = "W5MiscUtil.m";
                v46 = 1024;
                v47 = 351;
                v48 = 2114;
                v49 = v33;
                v50 = 2048;
                st_size = (off_t)v20;
                LODWORD(v32) = 48;
                _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) FAILED to add directory archive entry '%{public}@', returned error %ld", v43, v32);
              }
            }
            v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          v21 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
          v15 = v21;
        }
        while (v21);
      }
      v22 = 1;
      v8 = v13;
      a4 = v34;
      goto LABEL_25;
    }
    if (qword_1000FB780 != -1)
      dispatch_once(&qword_1000FB780, &stru_1000D7688);
    v26 = qword_1000FB778;
    if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(a2, "path");
      v28 = objc_msgSend(v41, "code");
      *(_QWORD *)&v43[4] = "__W5ArchiveAddURLToArchive";
      v44 = 2080;
      *(_DWORD *)v43 = 136316162;
      v45 = "W5MiscUtil.m";
      v46 = 1024;
      v47 = 344;
      v48 = 2114;
      v49 = v27;
      v50 = 2048;
      st_size = (off_t)v28;
      LODWORD(v32) = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v26, 0, "[wifivelocity] %s (%s:%u) FAILED to get contents at URL '%{public}@', returned error %ld", v43, v32);
    }
LABEL_33:
    v22 = 0;
    goto LABEL_25;
  }
  *(_QWORD *)v43 = 0;
  if ((sub_100091664(a1, a2, a3, (NSError **)v43) & 1) == 0)
  {
    if (qword_1000FB780 != -1)
      dispatch_once(&qword_1000FB780, &stru_1000D7688);
    v29 = qword_1000FB778;
    if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_msgSend(a2, "path");
      v31 = objc_msgSend(*(id *)v43, "code");
      *(_QWORD *)&v52.st_mode = "__W5ArchiveAddURLToArchive";
      WORD2(v52.st_ino) = 2080;
      v52.st_dev = 136316162;
      *(__darwin_ino64_t *)((char *)&v52.st_ino + 6) = (__darwin_ino64_t)"W5MiscUtil.m";
      HIWORD(v52.st_gid) = 1024;
      v52.st_rdev = 359;
      *((_WORD *)&v52.st_rdev + 2) = 2114;
      *(_QWORD *)((char *)&v52.st_rdev + 6) = v30;
      HIWORD(v52.st_atimespec.tv_sec) = 2048;
      v52.st_atimespec.tv_nsec = (uint64_t)v31;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v29, 0, "[wifivelocity] %s (%s:%u) FAILED to add file archive entry '%{public}@', returned error %ld", &v52, 48);
    }
  }
  v22 = 1;
LABEL_25:
  v23 = v41;
  objc_autoreleasePoolPop(v8);
  v24 = v41;
  if (a4 && v41)
    *a4 = v41;
  return v22;
}

uint64_t sub_10009009C(void *a1, void *a2, NSError **a3)
{
  uint64_t v6;
  id v7;
  off_t st_size;
  id v9;
  uint64_t v10;
  id v11;
  int v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t result;
  NSDictionary *v18;
  NSErrorDomain v19;
  uint64_t v20;
  NSError *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSInteger v25;
  uint64_t v26;
  stat v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;
  NSErrorUserInfoKey v30;
  const __CFString *v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  int v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  id v41;
  __int16 v42;
  off_t v43;
  __int16 v44;
  id v45;

  memset(&v27, 0, sizeof(v27));
  stat((const char *)objc_msgSend(objc_msgSend(a1, "path"), "UTF8String"), &v27);
  if (qword_1000FB780 != -1)
    dispatch_once(&qword_1000FB780, &stru_1000D7688);
  v6 = qword_1000FB778;
  if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(a1, "path");
    st_size = v27.st_size;
    v9 = objc_msgSend(a2, "path");
    v34 = 136316418;
    v35 = "W5CopyUsingBOMCopier";
    v36 = 2080;
    v37 = "W5MiscUtil.m";
    v38 = 1024;
    v39 = 490;
    v40 = 2114;
    v41 = v7;
    v42 = 2048;
    v43 = st_size;
    v44 = 2114;
    v45 = v9;
    LODWORD(v26) = 58;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) Copying '%{public}@' (size=%lld) --> '%{public}@'", &v34, v26);
  }
  v10 = BOMCopierNew(-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(objc_msgSend(a2, "path"), "stringByDeletingLastPathComponent"), 1, 0, 0));
  if (v10)
  {
    if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(a1, "path")))
    {
      v21 = 0;
      goto LABEL_20;
    }
    HIBYTE(v26) = 0;
    if (-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend(a1, "path"), (char *)&v26 + 7))
    {
      v11 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("copyResources"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("copyExtendedAttributes"));
      v12 = BOMCopierCopyWithOptions(v10, objc_msgSend(a1, "fileSystemRepresentation"), objc_msgSend(a2, "fileSystemRepresentation"), v11);
      if (!v12)
      {
        if (qword_1000FB780 != -1)
          dispatch_once(&qword_1000FB780, &stru_1000D7688);
        v13 = qword_1000FB778;
        if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_msgSend(a1, "path");
          v15 = objc_msgSend(a2, "path");
          v34 = 136316162;
          v35 = "W5CopyUsingBOMCopier";
          v36 = 2080;
          v37 = "W5MiscUtil.m";
          v38 = 1024;
          v39 = 520;
          v40 = 2114;
          v41 = v14;
          v42 = 2114;
          v43 = (off_t)v15;
          LODWORD(v26) = 48;
          v16 = 1;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) Successfuly copied using BOMCopier '%{public}@' --> '%{public}@'", &v34, v26);
        }
        else
        {
          v16 = 1;
        }
LABEL_14:
        BOMCopierFree(v10);
        return v16;
      }
      v22 = v12;
      v28 = NSLocalizedFailureReasonErrorKey;
      v29 = CFSTR("err");
      v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v19 = NSPOSIXErrorDomain;
      v20 = v22;
    }
    else
    {
      v30 = NSLocalizedFailureReasonErrorKey;
      v31 = CFSTR("ENOENT");
      v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v19 = NSPOSIXErrorDomain;
      v20 = 2;
    }
  }
  else
  {
    v32 = NSLocalizedFailureReasonErrorKey;
    v33 = CFSTR("ENOMEM");
    v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v19 = NSPOSIXErrorDomain;
    v20 = 12;
  }
  v21 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, v20, v18);
LABEL_20:
  if (qword_1000FB780 != -1)
    dispatch_once(&qword_1000FB780, &stru_1000D7688);
  v23 = qword_1000FB778;
  if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_msgSend(a1, "path");
    v25 = -[NSError code](v21, "code");
    v35 = "W5CopyUsingBOMCopier";
    v36 = 2080;
    v34 = 136316162;
    v37 = "W5MiscUtil.m";
    v38 = 1024;
    v39 = 516;
    v40 = 2114;
    v41 = v24;
    v42 = 2048;
    v43 = v25;
    LODWORD(v26) = 48;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v23, 0, "[wifivelocity] %s (%s:%u) FAILED to copy using BOMCopier '%{public}@', returned error %ld", &v34, v26);
  }
  if (a3 && v21)
    *a3 = v21;
  v16 = 0;
  result = 0;
  if (v10)
    goto LABEL_14;
  return result;
}

id sub_100090628()
{
  id v0;
  id v1;
  uint64_t v2;
  void *i;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *j;
  uint64_t v10;
  void *k;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *m;
  id obj;
  id obja;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CFTypeRef result;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];

  v0 = +[NSMutableString string](NSMutableString, "string");
  v1 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v1, "setObject:forKeyedSubscript:", kSecClassGenericPassword, kSecClass);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", CFSTR("AirPort"), kSecAttrService);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", kSecMatchLimitAll, kSecMatchLimit);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnAttributes);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &__kCFBooleanTrue);
  result = 0;
  v2 = SecItemCopyMatching((CFDictionaryRef)v1, &result);
  if ((_DWORD)v2)
  {
    objc_msgSend(v0, "appendFormat:", CFSTR("FAILED to query syncable WiFi keychain item attributes, returned error %d\n\n"), v2);
  }
  else
  {
    objc_msgSend(v0, "appendFormat:", CFSTR("SYNCABLE ITEMS: (%lu)\n\n"), objc_msgSend((id)result, "count"));
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = (id)result;
    v23 = objc_msgSend((id)result, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v23)
    {
      v21 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v21)
            objc_enumerationMutation(obj);
          v4 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v5 = objc_msgSend(objc_msgSend(v4, "allKeys"), "sortedArrayUsingSelector:", "caseInsensitiveCompare:");
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
          if (v6)
          {
            v7 = v6;
            v8 = *(_QWORD *)v34;
            do
            {
              for (j = 0; j != v7; j = (char *)j + 1)
              {
                if (*(_QWORD *)v34 != v8)
                  objc_enumerationMutation(v5);
                objc_msgSend(v0, "appendFormat:", CFSTR("%@ : %@\n"), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j), objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j)));
              }
              v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
            }
            while (v7);
          }
          objc_msgSend(v0, "appendString:", CFSTR("\n"));
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v23);
    }
  }
  if (result)
    CFRelease(result);
  result = 0;
  objc_msgSend(v1, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kSecAttrSynchronizable);
  v10 = SecItemCopyMatching((CFDictionaryRef)v1, &result);
  if ((_DWORD)v10)
  {
    objc_msgSend(v0, "appendFormat:", CFSTR("FAILED to query non-syncable WiFi keychain item attributes, returned error %d\n\n"), v10);
  }
  else
  {
    objc_msgSend(v0, "appendFormat:", CFSTR("NON-SYNCABLE ITEMS: (%lu)\n\n"), objc_msgSend((id)result, "count"));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obja = (id)result;
    v24 = objc_msgSend((id)result, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    if (v24)
    {
      v22 = *(_QWORD *)v30;
      do
      {
        for (k = 0; k != v24; k = (char *)k + 1)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(obja);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)k);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v13 = objc_msgSend(objc_msgSend(v12, "allKeys"), "sortedArrayUsingSelector:", "caseInsensitiveCompare:");
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v42, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v26;
            do
            {
              for (m = 0; m != v15; m = (char *)m + 1)
              {
                if (*(_QWORD *)v26 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(v0, "appendFormat:", CFSTR("%@ : %@\n"), *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)m), objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)m)));
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v42, 16);
            }
            while (v15);
          }
          objc_msgSend(v0, "appendString:", CFSTR("\n"));
        }
        v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
      }
      while (v24);
    }
  }
  if (result)
    CFRelease(result);
  return v0;
}

uint64_t sub_100090AB4(const __CFString *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  NSFileManager *v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  const __CFString *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  NSCalendar *v19;
  NSInteger v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v31;
  int v32;
  uint64_t v33;
  NSArray *obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  _BYTE v51[18];
  __int16 v52;
  _BOOL4 v53;
  _BYTE v54[128];
  NSURLResourceKey v55;

  if (qword_1000FB780 != -1)
    dispatch_once(&qword_1000FB780, &stru_1000D7688);
  v7 = qword_1000FB778;
  if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
  {
    v42 = 136316418;
    v43 = "W5DeleteFilesAtPath";
    v44 = 2080;
    v45 = "W5MiscUtil.m";
    v46 = 1024;
    v47 = 648;
    v48 = 2114;
    v49 = a1;
    v50 = 2114;
    *(_QWORD *)v51 = a2;
    *(_WORD *)&v51[8] = 2048;
    *(_QWORD *)&v51[10] = a3;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s (%s:%u) [START] File Deletion Request, path: %{public}@, filter: %{public}@, threshold: %ld", &v42, 58);
  }
  v40 = 0;
  v41 = 0;
  if (*a4)
  {
    if (qword_1000FB780 != -1)
      dispatch_once(&qword_1000FB780, &stru_1000D7688);
    v26 = qword_1000FB778;
    if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
    {
      v42 = 136315650;
      v43 = "W5DeleteFilesAtPath";
      v44 = 2080;
      v45 = "W5MiscUtil.m";
      v46 = 1024;
      v47 = 656;
      LODWORD(v31) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v26, 0, "[wifivelocity] %s (%s:%u) [STOP] File Deletion Request", &v42, v31);
      goto LABEL_49;
    }
LABEL_55:
    v28 = 0;
    goto LABEL_52;
  }
  v8 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v9 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", a1, 1);
  v55 = NSURLCreationDateKey;
  v10 = -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:](v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1), 4, &v41);
  if (v10)
  {
    obj = -[NSArray filteredArrayUsingPredicate:](v10, "filteredArrayUsingPredicate:", a2);
    if (qword_1000FB780 != -1)
      dispatch_once(&qword_1000FB780, &stru_1000D7688);
    v11 = qword_1000FB778;
    if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[NSArray count](obj, "count");
      v42 = 136316162;
      v43 = "W5DeleteFilesAtPath";
      v44 = 2080;
      v45 = "W5MiscUtil.m";
      v46 = 1024;
      v47 = 667;
      v48 = 2048;
      v49 = v12;
      v50 = 2114;
      *(_QWORD *)v51 = CFSTR("/var/run/com.apple.wifivelocity");
      LODWORD(v31) = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] %s (%s:%u) Found %lu files in %{public}@ matching filter", &v42, v31);
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v54, 16);
    if (v13)
    {
      v14 = v13;
      v33 = 0;
      v15 = *(_QWORD *)v37;
      v32 = 136316418;
LABEL_13:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(obj);
        if (*a4)
          break;
        v17 = *(__CFString **)(*((_QWORD *)&v36 + 1) + 8 * v16);
        -[__CFString getResourceValue:forKey:error:](v17, "getResourceValue:forKey:error:", &v40, NSURLCreationDateKey, &v41);
        if (v41)
        {
          if (qword_1000FB780 != -1)
            dispatch_once(&qword_1000FB780, &stru_1000D7688);
          v18 = qword_1000FB778;
          if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
          {
            v42 = 136315906;
            v43 = "W5DeleteFilesAtPath";
            v44 = 2080;
            v45 = "W5MiscUtil.m";
            v46 = 1024;
            v47 = 675;
            v48 = 2114;
            v49 = v17;
            LODWORD(v31) = 38;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) Could not get creation date for: %{public}@", &v42, v31);
          }
        }
        else
        {
          v19 = +[NSCalendar currentCalendar](NSCalendar, "currentCalendar");
          v20 = -[NSDateComponents day](-[NSCalendar components:fromDate:toDate:options:](v19, "components:fromDate:toDate:options:", 16, v40, +[NSDate date](NSDate, "date"), 0), "day");
          if (qword_1000FB780 != -1)
            dispatch_once(&qword_1000FB780, &stru_1000D7688);
          v21 = qword_1000FB778;
          if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
          {
            v42 = 136316674;
            v43 = "W5DeleteFilesAtPath";
            v44 = 2080;
            v45 = "W5MiscUtil.m";
            v46 = 1024;
            v47 = 682;
            v48 = 2114;
            v49 = v17;
            v50 = 2114;
            *(_QWORD *)v51 = v40;
            *(_WORD *)&v51[8] = 2048;
            *(_QWORD *)&v51[10] = v20;
            v52 = 1024;
            v53 = v20 >= a3;
            LODWORD(v31) = 64;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v21, 0, "[wifivelocity] %s (%s:%u) %{public}@, Creation Date: %{public}@, Delta from Today: %ld days, Delete: %d", &v42, v31);
          }
          if (v20 >= a3)
          {
            v22 = -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", v17, &v41);
            if (qword_1000FB780 != -1)
              dispatch_once(&qword_1000FB780, &stru_1000D7688);
            v23 = qword_1000FB778;
            if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
            {
              v42 = 136316418;
              v43 = "W5DeleteFilesAtPath";
              v44 = 2080;
              v45 = "W5MiscUtil.m";
              v46 = 1024;
              v47 = 687;
              v48 = 2112;
              v49 = v17;
              v50 = 1024;
              *(_DWORD *)v51 = v22;
              *(_WORD *)&v51[4] = 2112;
              *(_QWORD *)&v51[6] = v41;
              LODWORD(v31) = 54;
              _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v23, 0, "[wifivelocity] %s (%s:%u) Attempted to delete: %@, success: %d, error: %@", &v42, v31);
            }
            v24 = v33;
            if (!v41)
              v24 = v33 + 1;
            v33 = v24;
          }
        }
        if (v14 == (id)++v16)
        {
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v54, 16);
          if (v14)
            goto LABEL_13;
          goto LABEL_50;
        }
      }
      if (qword_1000FB780 != -1)
        dispatch_once(&qword_1000FB780, &stru_1000D7688);
      v25 = qword_1000FB778;
      if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
      {
        v42 = 136315650;
        v43 = "W5DeleteFilesAtPath";
        v44 = 2080;
        v45 = "W5MiscUtil.m";
        v46 = 1024;
        v47 = 670;
        LODWORD(v31) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v25, 0, "[wifivelocity] %s (%s:%u) [STOP] File Deletion Request", (const char *)&v42, v31, 136316418);
        goto LABEL_50;
      }
LABEL_51:
      v28 = v33;
      goto LABEL_52;
    }
    goto LABEL_49;
  }
  if (qword_1000FB780 != -1)
    dispatch_once(&qword_1000FB780, &stru_1000D7688);
  v27 = qword_1000FB778;
  if (!os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
    goto LABEL_55;
  v42 = 136316162;
  v43 = "W5DeleteFilesAtPath";
  v44 = 2080;
  v45 = "W5MiscUtil.m";
  v46 = 1024;
  v47 = 664;
  v48 = 2114;
  v49 = CFSTR("/var/run/com.apple.wifivelocity");
  v50 = 2114;
  *(_QWORD *)v51 = v41;
  LODWORD(v31) = 48;
  _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] %s (%s:%u) Unable to list contents of: %{public}@, error: %{public}@", &v42, v31);
LABEL_49:
  v33 = 0;
LABEL_50:
  if (qword_1000FB780 == -1)
    goto LABEL_51;
  dispatch_once(&qword_1000FB780, &stru_1000D7688);
  v28 = v33;
LABEL_52:
  v29 = qword_1000FB778;
  if (os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT))
  {
    v42 = 136315650;
    v43 = "W5DeleteFilesAtPath";
    v44 = 2080;
    v45 = "W5MiscUtil.m";
    v46 = 1024;
    v47 = 695;
    LODWORD(v31) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v29, 0, "[wifivelocity] %s (%s:%u) [END] File Deletion Request", (const char *)&v42, v31, v32);
  }
  return v28;
}

void sub_100091448(id a1)
{
  qword_1000FB778 = (uint64_t)os_log_create("com.apple.wifivelocity", "");
}

uint64_t sub_100091474()
{
  if (qword_1000FB790 != -1)
    dispatch_once(&qword_1000FB790, &stru_1000D76A8);
  return qword_1000FB788;
}

void sub_1000914B4(id a1)
{
  qword_1000FB788 = (uint64_t)os_log_create("com.apple.wifivelocity", "Default");
}

id sub_1000914E0(uint64_t a1)
{
  return +[NSISO8601DateFormatter stringFromDate:timeZone:formatOptions:](NSISO8601DateFormatter, "stringFromDate:timeZone:formatOptions:", a1, +[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"), 1907);
}

uint64_t sub_100091520(unsigned __int8 *a1, unint64_t a2, unsigned __int8 *a3, _QWORD *a4)
{
  unsigned int v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  char v10;
  char v11;
  uint64_t result;

  if (a2 && (uint64_t)(a2 - (_QWORD)a1) < 1)
    return 4294960546;
  v4 = *a1;
  if (!*a1)
    goto LABEL_28;
  v5 = a1;
  do
  {
    if (v4 > 0x3F)
      return 4294960554;
    v6 = &v5[v4 + 1];
    if (v6 - a1 > 255)
      return 4294960554;
    if (a2 && (unint64_t)v6 >= a2)
      return 4294960546;
    v7 = v5 + 1;
    do
    {
      v8 = *v7;
      if (((char)*v7 - 32) <= 0x5E)
      {
        if (*v7 - 32 <= 0x3C && ((1 << (v8 - 32)) & 0x1000000000004001) != 0)
          *a3++ = 92;
LABEL_24:
        *a3++ = v8;
        goto LABEL_25;
      }
      if ((*v7 & 0x80) != 0)
        goto LABEL_24;
      *a3 = 92;
      if (v8 <= 0x63u)
        v10 = 48;
      else
        v10 = 49;
      a3[1] = v10;
      if (v8 >= 0x64u)
        v11 = v8 / 0xAu - 10;
      else
        v11 = v8 / 0xAu;
      a3[2] = v11 + 48;
      a3[3] = (v8 % 0xAu) | 0x30;
      a3 += 4;
LABEL_25:
      ++v7;
    }
    while (v7 < v6);
    *a3++ = 46;
    v4 = *v6;
    v5 = v6;
  }
  while (*v6);
  if (v6 == a1)
  {
LABEL_28:
    *a3++ = 46;
    v6 = a1;
  }
  *a3 = 0;
  result = 0;
  if (a4)
    *a4 = v6 + 1;
  return result;
}

uint64_t sub_100091664(uint64_t a1, void *a2, void *a3, NSError **a4)
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  ssize_t v16;
  ssize_t v17;
  uint64_t v18;
  uint64_t v19;
  NSDictionary *v21;
  NSErrorDomain v22;
  uint64_t v23;
  int v24;
  NSError *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  stat v31;
  _BYTE v32[8192];
  NSErrorUserInfoKey v33;
  const __CFString *v34;
  NSErrorUserInfoKey v35;
  const __CFString *v36;
  NSErrorUserInfoKey v37;
  const __CFString *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  _BYTE v42[24];
  __int16 v43;
  off_t st_size;

  memset(&v31, 0, sizeof(v31));
  stat((const char *)objc_msgSend(objc_msgSend(a2, "path"), "UTF8String"), &v31);
  if (qword_1000FB780 != -1)
    dispatch_once(&qword_1000FB780, &stru_1000D7688);
  v8 = qword_1000FB778;
  v9 = os_log_type_enabled((os_log_t)qword_1000FB778, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v9)
  {
    v10 = objc_msgSend(a2, "path");
    v40 = "__W5ArchiveAddFileURLToArchive";
    v41 = 2080;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v42 = "W5MiscUtil.m";
    *(_WORD *)&v42[8] = 1024;
    *(_DWORD *)&v42[10] = 276;
    *(_WORD *)&v42[14] = 2114;
    *(_QWORD *)&v42[16] = v10;
    v43 = 2048;
    st_size = v31.st_size;
    v9 = _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) Adding file '%{public}@' (size=%lld) to archive", buf, 48);
  }
  v11 = archive_entry_new(v9);
  v12 = v11;
  if (v11)
  {
    archive_entry_copy_stat(v11, &v31);
    archive_entry_set_pathname(v12, objc_msgSend(a3, "UTF8String"));
    archive_entry_set_perm(v12, 420);
    v13 = archive_write_header(a1, v12);
    if (v13)
    {
      v24 = v13;
      v35 = NSLocalizedFailureReasonErrorKey;
      v36 = CFSTR("err");
      v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v13, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v26 = (const char *)objc_msgSend(a3, "UTF8String");
        v27 = archive_error_string(a1);
        *(_DWORD *)buf = 136446722;
        v40 = v26;
        v41 = 1026;
        *(_DWORD *)v42 = v24;
        *(_WORD *)&v42[4] = 2082;
        *(_QWORD *)&v42[6] = v27;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] archive_write_header() FAILED for %{public}s, returned %{public}d (%{public}s)", buf, 0x1Cu);
      }
      goto LABEL_21;
    }
    v14 = open((const char *)objc_msgSend(objc_msgSend(a2, "path"), "UTF8String"), 0);
    if ((v14 & 0x80000000) == 0)
    {
      v15 = v14;
      v16 = read(v14, v32, 0x2000uLL);
      if (v16 < 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v30 = (const char *)objc_msgSend(a3, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v40 = v30;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] Unexpected zero-length file encountered for %{public}s", buf, 0xCu);
        }
        v18 = 0;
      }
      else
      {
        v17 = v16;
        v18 = 0;
        do
        {
          v18 += archive_write_data(a1, v32, v17);
          v17 = read(v15, v32, 0x2000uLL);
        }
        while (v17 > 0);
      }
      close(v15);
      if (v18 != v31.st_size && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v29 = (const char *)objc_msgSend(a3, "UTF8String");
        *(_DWORD *)buf = 136446722;
        v40 = v29;
        v41 = 2050;
        *(_QWORD *)v42 = v31.st_size;
        *(_WORD *)&v42[8] = 2050;
        *(_QWORD *)&v42[10] = v18;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] Bytes written does not equal file size (file='%{public}s', size=%{public}lld, written=%{public}zd)", buf, 0x20u);
      }
      v19 = 1;
      goto LABEL_13;
    }
    v28 = *__error();
    v33 = NSLocalizedFailureReasonErrorKey;
    v34 = CFSTR("errno");
    v21 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v22 = NSPOSIXErrorDomain;
    v23 = v28;
  }
  else
  {
    v37 = NSLocalizedFailureReasonErrorKey;
    v38 = CFSTR("ENOMEM");
    v21 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v22 = NSPOSIXErrorDomain;
    v23 = 12;
  }
  v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, v23, v21);
LABEL_21:
  v19 = 0;
  if (a4 && v25)
  {
    v19 = 0;
    *a4 = v25;
  }
LABEL_13:
  if (v12)
    archive_entry_free(v12);
  return v19;
}

void sub_100091FBC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_100091FD8(id a1)
{
  NSObject *v1;
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;

  v1 = sub_10008F56C();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315650;
    v4 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]_block_invoke";
    v5 = 2080;
    v6 = "W5PeerDiagnosticsManager.m";
    v7 = 1024;
    v8 = 139;
    v2 = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v1, 0, "[wifivelocity] %s (%s:%u) rapport discovery session invalidated", (const char *)&v3, v2);
  }
}

void sub_1000920B0(id a1, RPCompanionLinkDevice *a2)
{
  NSObject *v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  RPCompanionLinkDevice *v12;

  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315906;
    v6 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]_block_invoke";
    v7 = 2080;
    v8 = "W5PeerDiagnosticsManager.m";
    v9 = 1024;
    v10 = 142;
    v11 = 2114;
    v12 = a2;
    v4 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) found device:%{public}@", &v5, v4);
  }
}

void sub_100092198(id a1, RPCompanionLinkDevice *a2)
{
  NSObject *v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  RPCompanionLinkDevice *v12;

  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315906;
    v6 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]_block_invoke";
    v7 = 2080;
    v8 = "W5PeerDiagnosticsManager.m";
    v9 = 1024;
    v10 = 145;
    v11 = 2114;
    v12 = a2;
    v4 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) lost device:%{public}@", &v5, v4);
  }
}

id sub_100092280(uint64_t a1)
{
  __int128 v1;
  void *v2;
  _QWORD v4[4];
  __int128 v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4[2] = sub_1000922DC;
  v4[3] = &unk_1000D7730;
  v5 = v1;
  return objc_msgSend(v2, "activateWithCompletion:", v4);
}

intptr_t sub_1000922DC(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;

  if (a2)
  {
    v4 = sub_10008F56C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]_block_invoke_2";
      v9 = 2080;
      v10 = "W5PeerDiagnosticsManager.m";
      v11 = 1024;
      v12 = 161;
      v13 = 2114;
      v14 = a2;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) PeerDiagnostics activation of rapport disovery client falied, error: %{public}@", &v7, 38);
    }
    v5 = *(void **)(a1 + 32);
    objc_sync_enter(v5);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    objc_sync_exit(v5);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100092520(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  int v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v16 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = objc_alloc_init((Class)NSMutableSet);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = a1;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "activeDevices");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v43, 16);
  if (v4)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "idsDeviceIdentifier")
          && !objc_msgSend(v2, "containsObject:", objc_msgSend(v7, "idsDeviceIdentifier")))
        {
          v9 = sub_10008F56C();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v25 = 136315906;
            v26 = "-[W5PeerDiagnosticsManager beginPeerDiscovery]_block_invoke";
            v27 = 2080;
            v28 = "W5PeerDiagnosticsManager.m";
            v29 = 1024;
            v30 = 222;
            v31 = 2114;
            v32 = v7;
            LODWORD(v14) = 38;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) counting device %{public}@", &v25, v14);
          }
          objc_msgSend(v2, "addObject:", objc_msgSend(v7, "idsDeviceIdentifier"));
          if (objc_msgSend(v7, "model")
            && ((objc_msgSend(objc_msgSend(v7, "model"), "containsString:", CFSTR("iPhone")) & 1) != 0
             || objc_msgSend(objc_msgSend(v7, "model"), "containsString:", CFSTR("iPad"))))
          {
            ++v20;
          }
          else if (objc_msgSend(v7, "model")
                 && objc_msgSend(objc_msgSend(v7, "model"), "containsString:", CFSTR("Mac")))
          {
            ++v19;
          }
          else if (objc_msgSend(v7, "model")
                 && objc_msgSend(objc_msgSend(v7, "model"), "containsString:", CFSTR("AppleTV")))
          {
            ++v17;
          }
          else if (objc_msgSend(v7, "model"))
          {
            v18 += objc_msgSend(objc_msgSend(v7, "model"), "containsString:", CFSTR("Watch"));
          }
        }
        else
        {
          v8 = sub_10008F56C();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v25 = 136315906;
            v26 = "-[W5PeerDiagnosticsManager beginPeerDiscovery]_block_invoke";
            v27 = 2080;
            v28 = "W5PeerDiagnosticsManager.m";
            v29 = 1024;
            v30 = 219;
            v31 = 2114;
            v32 = v7;
            LODWORD(v14) = 38;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) skipping device %{public}@", &v25, v14);
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v43, 16);
    }
    while (v4);
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
  }
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "localDevice"), "model"), CFSTR("DeviceModel"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", +[NSDate date](NSDate, "date"), CFSTR("Timestamp"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v20), CFSTR("numberOfIOSDevices"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v17), CFSTR("numberOfTVOSDevices"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v19), CFSTR("numberOfMacOSDevices"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v18), CFSTR("numberOfWatchOSDevices"));
  v10 = sub_10008F56C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("DeviceModel"));
    v12 = objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Timestamp"));
    v25 = 136317186;
    v26 = "-[W5PeerDiagnosticsManager beginPeerDiscovery]_block_invoke";
    v27 = 2080;
    v28 = "W5PeerDiagnosticsManager.m";
    v29 = 1024;
    v30 = 249;
    v31 = 2114;
    v32 = v11;
    v33 = 2114;
    v34 = v12;
    v35 = 2048;
    v36 = v20;
    v37 = 2048;
    v38 = v17;
    v39 = 2048;
    v40 = v19;
    v41 = 2048;
    v42 = v18;
    LODWORD(v14) = 88;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) Device model %{public}@, timestamp %{public}@, found iOS devices %lu, tvOS devices %lu, macOS devices %lu, watchOS devices %lu", &v25, v14);
  }
  v13 = *(void **)(v15 + 40);
  objc_sync_enter(v13);

  *(_QWORD *)(*(_QWORD *)(v15 + 40) + 32) = objc_msgSend(v16, "copy");
  objc_sync_exit(v13);
  objc_msgSend(*(id *)(v15 + 40), "invalidateDiscoveryClient");
  dispatch_release(*(dispatch_object_t *)(v15 + 32));
}

void sub_100092AB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100092B54(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "registerRequestHandler");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100092BC0;
  v5[3] = &unk_1000D6B78;
  v5[4] = v2;
  return objc_msgSend(v3, "activateWithCompletion:", v5);
}

intptr_t sub_100092BC0(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;

  if (a2)
  {
    v4 = sub_10008F56C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = "-[W5PeerDiagnosticsManager registerCallbacksAndActivate]_block_invoke_2";
      v9 = 2080;
      v10 = "W5PeerDiagnosticsManager.m";
      v11 = 1024;
      v12 = 271;
      v13 = 2114;
      v14 = a2;
      v6 = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) PeerDiagnostics activation of rapport disovery client falied, error: %{public}@", &v7, v6);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100092D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;
  NSObject *v6;
  uint64_t result;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;

  v5 = objc_msgSend(*(id *)(a1 + 32), "localDiagnostics");
  (*(void (**)(uint64_t, id, _QWORD, _QWORD))(a4 + 16))(a4, v5, 0, 0);
  v6 = sub_10008F56C();
  result = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
  {
    v9 = 136315906;
    v10 = "-[W5PeerDiagnosticsManager registerRequestHandler]_block_invoke";
    v11 = 2080;
    v12 = "W5PeerDiagnosticsManager.m";
    v13 = 1024;
    v14 = 294;
    v15 = 2114;
    v16 = v5;
    v8 = 38;
    return _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) received peerdiagnostics request, response %{public}@", &v9, v8);
  }
  return result;
}

void sub_100093238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100093260(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_100093270(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t sub_10009327C()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = sub_100093260;
  v7 = sub_100093270;
  v0 = qword_1000FB798;
  v8 = qword_1000FB798;
  if (!qword_1000FB798)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_1000942B8;
    v2[3] = &unk_1000D5380;
    v2[4] = &v3;
    sub_1000942B8((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100093328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100093340(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;

  if (a3)
  {
    v4 = sub_10008F56C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "-[W5PeerDiagnosticsManager getDPSSummary]_block_invoke";
      v10 = 2080;
      v11 = "W5PeerDiagnosticsManager.m";
      v12 = 1024;
      v13 = 339;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) Failed to obtain DPS summarized logs from wifianalyticsd", (const char *)&v8, 28);
    }
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    objc_sync_enter(v7);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(a2, "copy");
    objc_sync_exit(v7);
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void sub_10009349C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000936F0(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;

  v2 = sub_10008F56C();
  result = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 136315906;
    v7 = "-[W5PeerDiagnosticsManager requestDiagnostics:completionBlock:]_block_invoke";
    v8 = 2080;
    v9 = "W5PeerDiagnosticsManager.m";
    v10 = 1024;
    v11 = 385;
    v12 = 2114;
    v13 = v4;
    v5 = 38;
    return _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v2, 0, "[wifivelocity] %s (%s:%u) session client with device %{public}@ invalidated", &v6, v5);
  }
  return result;
}

id sub_1000937DC(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSDictionary *v6;
  void *v7;
  int v8;
  _QWORD v9[5];
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;

  if (a2)
  {
    v4 = sub_10008F56C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315906;
      v13 = "-[W5PeerDiagnosticsManager requestDiagnostics:completionBlock:]_block_invoke";
      v14 = 2080;
      v15 = "W5PeerDiagnosticsManager.m";
      v16 = 1024;
      v17 = 391;
      v18 = 2114;
      v19 = a2;
      v8 = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) session client falied to activate, error: %{public}@", &v12, v8);
    }
    return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10 = RPOptionAllowUnauthenticated;
    v11 = &__kCFBooleanTrue;
    v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10009396C;
    v9[3] = &unk_1000D77A8;
    v7 = *(void **)(a1 + 32);
    v9[4] = *(_QWORD *)(a1 + 40);
    return objc_msgSend(v7, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.proximity.peerdiagnosticslink"), &__NSDictionary0__struct, v6, v9);
  }
}

uint64_t sub_10009396C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100093EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

id sub_100093EF8(uint64_t a1)
{
  void *v1;
  int8x16_t v2;
  __int128 v3;
  _QWORD v5[5];
  int8x16_t v6;
  __int128 v7;

  v1 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100093F64;
  v5[3] = &unk_1000D77D0;
  v5[4] = v1;
  v2 = *(int8x16_t *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 56);
  v6 = vextq_s8(v2, v2, 8uLL);
  v7 = v3;
  return objc_msgSend(v1, "requestDiagnostics:completionBlock:", v2.i64[0], v5);
}

void sub_100093F64(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _BYTE v10[24];
  __int128 v11;
  uint64_t v12;
  __int128 v13;

  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    objc_sync_enter(v4);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
    v5 = objc_msgSend(*(id *)(a1 + 40), "count");
    objc_sync_exit(v4);
    v6 = sub_10008F56C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(*(id *)(a1 + 48), "model");
      *(_DWORD *)v10 = 136316418;
      *(_QWORD *)&v10[4] = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]_block_invoke_2";
      *(_WORD *)&v10[12] = 2080;
      *(_QWORD *)&v10[14] = "W5PeerDiagnosticsManager.m";
      *(_WORD *)&v10[22] = 1024;
      LODWORD(v11) = 454;
      WORD2(v11) = 2114;
      *(_QWORD *)((char *)&v11 + 6) = v7;
      HIWORD(v11) = 2114;
      LOWORD(v13) = 2048;
      *(_QWORD *)((char *)&v13 + 2) = v5;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) response from peer %{public}@: %{public}@, total responses %lu", v10, 58, *(_OWORD *)v10, *(_QWORD *)&v10[16], v11, a2, v13);
    }
  }
  else
  {
    v8 = sub_10008F56C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v10 = 136315906;
      *(_QWORD *)&v10[4] = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]_block_invoke";
      *(_WORD *)&v10[12] = 2080;
      *(_QWORD *)&v10[14] = "W5PeerDiagnosticsManager.m";
      *(_WORD *)&v10[22] = 1024;
      LODWORD(v11) = 457;
      WORD2(v11) = 2114;
      *(_QWORD *)((char *)&v11 + 6) = v9;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) no response from peer %{public}@", v10, 38, *(_OWORD *)v10, *(_QWORD *)&v10[16], v11, v12, v13);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_100094158(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10009416C(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "localDiagnostics");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("LocalDevice"));
  v3 = *(void **)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v2);
  objc_sync_exit(v3);
  v4 = sub_10008F56C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315906;
    v6 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]_block_invoke";
    v7 = 2080;
    v8 = "W5PeerDiagnosticsManager.m";
    v9 = 1024;
    v10 = 471;
    v11 = 2114;
    v12 = v2;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) local diagnostics %{public}@", &v5, 38);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1000942A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class sub_1000942B8(uint64_t a1)
{
  Class result;
  NSAssertionHandler *v3;
  NSString *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  v5 = 0;
  if (!qword_1000FB7A0)
  {
    v6 = off_1000D7818;
    v7 = 0;
    qword_1000FB7A0 = _sl_dlopen(&v6, &v5);
  }
  if (!qword_1000FB7A0)
  {
    v3 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *WiFiAnalyticsLibrary(void)");
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("W5PeerDiagnosticsManager.m"), 22, CFSTR("%s"), v5);
    goto LABEL_10;
  }
  if (v5)
    free(v5);
  result = objc_getClass("WAClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getWAClientClass(void)_block_invoke"), CFSTR("W5PeerDiagnosticsManager.m"), 24, CFSTR("Unable to find class %s"), "WAClient");
LABEL_10:
    __break(1u);
  }
  qword_1000FB798 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

id objc_msgSend_AWDL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDL");
}

id objc_msgSend_AWDLAFTxMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLAFTxMode");
}

id objc_msgSend_AWDLAvailabilityWindowAPAlignment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLAvailabilityWindowAPAlignment");
}

id objc_msgSend_AWDLContinuousElectionAlgorithmEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLContinuousElectionAlgorithmEnabled");
}

id objc_msgSend_AWDLElectionMetric(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLElectionMetric");
}

id objc_msgSend_AWDLElectionParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLElectionParameters");
}

id objc_msgSend_AWDLElectionRSSIThresholds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLElectionRSSIThresholds");
}

id objc_msgSend_AWDLEncryptionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLEncryptionType");
}

id objc_msgSend_AWDLExtensionStateMachineParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLExtensionStateMachineParameters");
}

id objc_msgSend_AWDLGuardTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLGuardTime");
}

id objc_msgSend_AWDLMasterChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLMasterChannel");
}

id objc_msgSend_AWDLOpMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLOpMode");
}

id objc_msgSend_AWDLPeerTrafficRegistration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLPeerTrafficRegistration");
}

id objc_msgSend_AWDLPresenceMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLPresenceMode");
}

id objc_msgSend_AWDLSecondaryMasterChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLSecondaryMasterChannel");
}

id objc_msgSend_AWDLSidecarDiagnostics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLSidecarDiagnostics");
}

id objc_msgSend_AWDLSocialTimeSlots(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLSocialTimeSlots");
}

id objc_msgSend_AWDLStatistics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLStatistics");
}

id objc_msgSend_AWDLStrategy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLStrategy");
}

id objc_msgSend_AWDLSyncChannelSequence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLSyncChannelSequence");
}

id objc_msgSend_AWDLSyncEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLSyncEnabled");
}

id objc_msgSend_AWDLSyncParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLSyncParameters");
}

id objc_msgSend_AWDLSyncState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AWDLSyncState");
}

id objc_msgSend_BSSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BSSID");
}

id objc_msgSend_CCA(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CCA");
}

id objc_msgSend_DNSServerAddresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DNSServerAddresses");
}

id objc_msgSend_DTIMInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DTIMInterval");
}

id objc_msgSend_EAP8021XClientStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "EAP8021XClientStatus");
}

id objc_msgSend_EAP8021XControlMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "EAP8021XControlMode");
}

id objc_msgSend_EAP8021XControlState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "EAP8021XControlState");
}

id objc_msgSend_EAP8021XSupplicantState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "EAP8021XSupplicantState");
}

id objc_msgSend_IPv4Addresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IPv4Addresses");
}

id objc_msgSend_IPv4RouterAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IPv4RouterAddress");
}

id objc_msgSend_IPv6Addresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IPv6Addresses");
}

id objc_msgSend_IPv6RouterAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IPv6RouterAddress");
}

id objc_msgSend_LQMSummary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "LQMSummary");
}

id objc_msgSend_MACAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MACAddress");
}

id objc_msgSend_MCSIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MCSIndex");
}

id objc_msgSend_PHYMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PHYMode");
}

id objc_msgSend_RSNMulticastCipher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "RSNMulticastCipher");
}

id objc_msgSend_RSNUnicastCiphers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "RSNUnicastCiphers");
}

id objc_msgSend_RSSI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "RSSI");
}

id objc_msgSend_SSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SSID");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingPathExtension");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_WAPISubtype(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "WAPISubtype");
}

id objc_msgSend_WEPSubtype(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "WEPSubtype");
}

id objc_msgSend_WPAMulticastCipher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "WPAMulticastCipher");
}

id objc_msgSend_WPAUnicastCiphers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "WPAUnicastCiphers");
}

id objc_msgSend___activeRequestWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__activeRequestWithUUID:");
}

id objc_msgSend___addEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__addEvent:");
}

id objc_msgSend___addFaultEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__addFaultEvent:");
}

id objc_msgSend___address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__address");
}

id objc_msgSend___adjust5GHzWeights_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__adjust5GHzWeights:");
}

id objc_msgSend___airDropDiscoverableMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__airDropDiscoverableMode");
}

id objc_msgSend___allowedClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__allowedClasses");
}

id objc_msgSend___ambiguousSSIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ambiguousSSIDs");
}

id objc_msgSend___applyChannelWeights_supportedChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__applyChannelWeights:supportedChannels:");
}

id objc_msgSend___archiveEventCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__archiveEventCache");
}

id objc_msgSend___archiveNotifyPeers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__archiveNotifyPeers");
}

id objc_msgSend___bluetooth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__bluetooth");
}

id objc_msgSend___browseBonjourInstancesWithServiceType_duration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__browseBonjourInstancesWithServiceType:duration:");
}

id objc_msgSend___calculateSizeAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__calculateSizeAtPath:");
}

id objc_msgSend___cancelActiveRequestAndReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__cancelActiveRequestAndReply:");
}

id objc_msgSend___cancelCollectLogsWithUUID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__cancelCollectLogsWithUUID:reply:");
}

id objc_msgSend___cancelDiagnosticsWithUUID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__cancelDiagnosticsWithUUID:reply:");
}

id objc_msgSend___cancelPeerDiscoveryWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__cancelPeerDiscoveryWithUUID:");
}

id objc_msgSend___cancelWiFiPerfLoggingWithUUID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__cancelWiFiPerfLoggingWithUUID:reply:");
}

id objc_msgSend___cancelWiFiSnifferWithUUID_peer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__cancelWiFiSnifferWithUUID:peer:reply:");
}

id objc_msgSend___cancelWiFiSnifferWithUUID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__cancelWiFiSnifferWithUUID:reply:");
}

id objc_msgSend___channelNumbersForWiFiChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__channelNumbersForWiFiChannels:");
}

id objc_msgSend___channelWeightsForChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__channelWeightsForChannel:");
}

id objc_msgSend___channelWeightsForScanResults_supportedChannels_rssiThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__channelWeightsForScanResults:supportedChannels:rssiThreshold:");
}

id objc_msgSend___clearLinkQualityUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__clearLinkQualityUpdates");
}

id objc_msgSend___collect3barsCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect3barsCache:");
}

id objc_msgSend___collectAWDLStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectAWDLStatus:");
}

id objc_msgSend___collectAdditionalLog_url_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectAdditionalLog:url:");
}

id objc_msgSend___collectAirPlayLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectAirPlayLogs:");
}

id objc_msgSend___collectBluetoothLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectBluetoothLogs:");
}

id objc_msgSend___collectBluetoothStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectBluetoothStatus:");
}

id objc_msgSend___collectBonjourRecords_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectBonjourRecords:");
}

id objc_msgSend___collectCoreCapture24_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectCoreCapture24:");
}

id objc_msgSend___collectCoreCapture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectCoreCapture:");
}

id objc_msgSend___collectCoreCaptureDump_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectCoreCaptureDump:");
}

id objc_msgSend___collectCrashesAndSpins24_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectCrashesAndSpins24:");
}

id objc_msgSend___collectDatapathStats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectDatapathStats:");
}

id objc_msgSend___collectDeviceAnalyticsDeploymentGraph_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectDeviceAnalyticsDeploymentGraph:");
}

id objc_msgSend___collectDeviceAnalyticsEntityCSVs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectDeviceAnalyticsEntityCSVs:");
}

id objc_msgSend___collectDeviceAnalyticsStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectDeviceAnalyticsStore:");
}

id objc_msgSend___collectDextCoreDump_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectDextCoreDump:");
}

id objc_msgSend___collectDiagnostics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectDiagnostics:");
}

id objc_msgSend___collectEAP8021XLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectEAP8021XLogs:");
}

id objc_msgSend___collectEventHistory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectEventHistory:");
}

id objc_msgSend___collectFileAtURL_outputDirectory_maxAge_maxSize_compress_remainingSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:");
}

id objc_msgSend___collectFilesInDirectories_include_exclude_maxAge_maxCount_maxSize_outputDirectory_compress_remainingSize_contentFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:");
}

id objc_msgSend___collectFilteredWiFiManagerLogArchiveWithOutputURL_compress_age_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectFilteredWiFiManagerLogArchiveWithOutputURL:compress:age:");
}

id objc_msgSend___collectIPConfigurationLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectIPConfigurationLogs:");
}

id objc_msgSend___collectIndividual_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectIndividual:error:");
}

id objc_msgSend___collectLeakyAPStats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectLeakyAPStats:");
}

id objc_msgSend___collectLogItem_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectLogItem:error:");
}

id objc_msgSend___collectLogItem_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectLogItem:reply:");
}

id objc_msgSend___collectLogItemCallout_baseURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectLogItemCallout:baseURL:error:");
}

id objc_msgSend___collectLogs_configuration_additionalLog_filename_uid_gid_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectLogs:configuration:additionalLog:filename:uid:gid:uuid:reply:");
}

id objc_msgSend___collectLogsDiagnosticMode_outputName_uid_gid_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectLogsDiagnosticMode:outputName:uid:gid:uuid:reply:");
}

id objc_msgSend___collectNetUsageFiles_uuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectNetUsageFiles:uuid:");
}

id objc_msgSend___collectNetworkCountersPOST(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectNetworkCountersPOST");
}

id objc_msgSend___collectNetworkCountersPRE(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectNetworkCountersPRE");
}

id objc_msgSend___collectNetworkPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectNetworkPreferences:");
}

id objc_msgSend___collectNetworkStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectNetworkStatus:");
}

id objc_msgSend___collectPeerDiagnostics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectPeerDiagnostics:");
}

id objc_msgSend___collectPerSSIDDiagnosticsHistory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectPerSSIDDiagnosticsHistory:");
}

id objc_msgSend___collectPreviouslyCollected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectPreviouslyCollected:");
}

id objc_msgSend___collectSharingLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectSharingLogs:");
}

id objc_msgSend___collectSystemConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectSystemConfiguration:");
}

id objc_msgSend___collectSystemLogs24_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectSystemLogs24:");
}

id objc_msgSend___collectSystemLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectSystemLogs:");
}

id objc_msgSend___collectTCPDump_POST_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectTCPDump_POST:");
}

id objc_msgSend___collectTCPDump_PRE_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectTCPDump_PRE:");
}

id objc_msgSend___collectWiFiCountersPOST(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiCountersPOST");
}

id objc_msgSend___collectWiFiCountersPRE(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiCountersPRE");
}

id objc_msgSend___collectWiFiDeviceConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiDeviceConfig");
}

id objc_msgSend___collectWiFiDeviceConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiDeviceConfig:");
}

id objc_msgSend___collectWiFiLogs24_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiLogs24:");
}

id objc_msgSend___collectWiFiLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiLogs:");
}

id objc_msgSend___collectWiFiLogsDump_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiLogsDump:");
}

id objc_msgSend___collectWiFiMemoryStatsWithFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiMemoryStatsWithFilename:");
}

id objc_msgSend___collectWiFiMemoryUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiMemoryUsage:");
}

id objc_msgSend___collectWiFiPerfLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiPerfLogs:");
}

id objc_msgSend___collectWiFiPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiPreferences:");
}

id objc_msgSend___collectWiFiScanResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiScanResults:");
}

id objc_msgSend___collectWiFiStatsCLI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiStatsCLI:");
}

id objc_msgSend___collectWiFiStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiStatus:");
}

id objc_msgSend___collectWiFiVelocityLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWiFiVelocityLog:");
}

id objc_msgSend___collectWirelessProxLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectWirelessProxLogs:");
}

id objc_msgSend___collect_CFNetworkPing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_CFNetworkPing:");
}

id objc_msgSend___collect_IMFoundationPing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_IMFoundationPing:");
}

id objc_msgSend___collect_arp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_arp:");
}

id objc_msgSend___collect_configd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_configd:");
}

id objc_msgSend___collect_darwinup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_darwinup:");
}

id objc_msgSend___collect_hosts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_hosts:");
}

id objc_msgSend___collect_ifconfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_ifconfig:");
}

id objc_msgSend___collect_ioreg_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_ioreg:");
}

id objc_msgSend___collect_ipconfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_ipconfig:");
}

id objc_msgSend___collect_kextstat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_kextstat:");
}

id objc_msgSend___collect_mobilewifitool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_mobilewifitool:");
}

id objc_msgSend___collect_ndp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_ndp:");
}

id objc_msgSend___collect_netstat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_netstat:");
}

id objc_msgSend___collect_ping_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_ping:");
}

id objc_msgSend___collect_pmset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_pmset:");
}

id objc_msgSend___collect_security_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_security:");
}

id objc_msgSend___collect_spindump_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_spindump:");
}

id objc_msgSend___collect_swvers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_swvers:");
}

id objc_msgSend___collect_sysdiagnose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_sysdiagnose:");
}

id objc_msgSend___collect_top_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_top:");
}

id objc_msgSend___collect_traceroute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_traceroute:");
}

id objc_msgSend___collect_wl_cca_get_stats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_wl_cca_get_stats:");
}

id objc_msgSend___collect_wl_curpower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collect_wl_curpower:");
}

id objc_msgSend___collectedLogItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__collectedLogItem:");
}

id objc_msgSend___completedDiagnosticsTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__completedDiagnosticsTest:");
}

id objc_msgSend___concurrentConnectivityDiagnosticsTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__concurrentConnectivityDiagnosticsTest");
}

id objc_msgSend___configurationDiagnosticsLogItemWithTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__configurationDiagnosticsLogItemWithTimeout:");
}

id objc_msgSend___connectivityDiagnosticsLogItemWithTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__connectivityDiagnosticsLogItemWithTimeout:");
}

id objc_msgSend___defaultDiagnosticsTests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__defaultDiagnosticsTests");
}

id objc_msgSend___detectLocalIPv4Address_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__detectLocalIPv4Address:");
}

id objc_msgSend___dnsLoggingEnabledWithQueue_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__dnsLoggingEnabledWithQueue:reply:");
}

id objc_msgSend___dnsSetupConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__dnsSetupConfig");
}

id objc_msgSend___dnssdBrowseAll_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__dnssdBrowseAll:");
}

id objc_msgSend___dnssdCacheAndState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__dnssdCacheAndState:");
}

id objc_msgSend___downloadSpeedtestWithFileSize_timeout_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__downloadSpeedtestWithFileSize:timeout:error:");
}

id objc_msgSend___dumpCoreCaptureLogsWithReason_component_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__dumpCoreCaptureLogsWithReason:component:");
}

id objc_msgSend___dumpWiFiLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__dumpWiFiLogs");
}

id objc_msgSend___endWiFiStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__endWiFiStats");
}

id objc_msgSend___environmentDiagnosticsLogItemWithTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__environmentDiagnosticsLogItemWithTimeout:");
}

id objc_msgSend___expandLogItems_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__expandLogItems:configuration:");
}

id objc_msgSend___fastConnectivityDiagnosticsLogItemWithTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__fastConnectivityDiagnosticsLogItemWithTimeout:");
}

id objc_msgSend___filteredChannelWeights_channels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__filteredChannelWeights:channels:");
}

id objc_msgSend___followupTests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__followupTests");
}

id objc_msgSend___forceUpdateTrigger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__forceUpdateTrigger");
}

id objc_msgSend___getEAPOLDebugFlagsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__getEAPOLDebugFlagsEnabled");
}

id objc_msgSend___initialTests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__initialTests");
}

id objc_msgSend___ios__deviceList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ios__deviceList");
}

id objc_msgSend___ipv4SetupConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ipv4SetupConfig");
}

id objc_msgSend___ipv6SetupConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ipv6SetupConfig");
}

id objc_msgSend___isAppleDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__isAppleDevice");
}

id objc_msgSend___isCloudPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__isCloudPaired");
}

id objc_msgSend___isConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__isConnected");
}

id objc_msgSend___isDefaultCountryCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__isDefaultCountryCode:");
}

id objc_msgSend___isDoubleNATWithTracerouteOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__isDoubleNATWithTracerouteOutput:");
}

id objc_msgSend___isLowEnergy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__isLowEnergy");
}

id objc_msgSend___isPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__isPaired");
}

id objc_msgSend___isSnifferSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__isSnifferSupported");
}

id objc_msgSend___localPeer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__localPeer");
}

id objc_msgSend___logAWDLStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logAWDLStatus:");
}

id objc_msgSend___logBTCProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logBTCProfile:");
}

id objc_msgSend___logBluetoothStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logBluetoothStatus:");
}

id objc_msgSend___logDiagnosticsPingResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logDiagnosticsPingResults:");
}

id objc_msgSend___logDiagnosticsTestResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logDiagnosticsTestResults:");
}

id objc_msgSend___logItems_containsID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItems:containsID:");
}

id objc_msgSend___logItemsForABCWithReason_filteredContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForABCWithReason:filteredContent:");
}

id objc_msgSend___logItemsForBTSysdiagnoseWithFilteredContent_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForBTSysdiagnoseWithFilteredContent:timeout:");
}

id objc_msgSend___logItemsForBackgroundEventWithReason_filteredContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForBackgroundEventWithReason:filteredContent:");
}

id objc_msgSend___logItemsForDatapathStallEventWithFilteredContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForDatapathStallEventWithFilteredContent:");
}

id objc_msgSend___logItemsForDumpLogsEventWithReason_filteredContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForDumpLogsEventWithReason:filteredContent:");
}

id objc_msgSend___logItemsForFeedbackAssistant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForFeedbackAssistant");
}

id objc_msgSend___logItemsForInternalWiFiSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForInternalWiFiSettings");
}

id objc_msgSend___logItemsForSysdiagnoseWithFilteredContent_useMegaWiFiProfileLimits_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForSysdiagnoseWithFilteredContent:useMegaWiFiProfileLimits:timeout:");
}

id objc_msgSend___logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent_useMegaWiFiProfileLimits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent:useMegaWiFiProfileLimits:");
}

id objc_msgSend___logItemsForTapToRadar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForTapToRadar");
}

id objc_msgSend___logItemsForWiFiDiagnosticsApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForWiFiDiagnosticsApp");
}

id objc_msgSend___logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:");
}

id objc_msgSend___logMessage_timestamped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logMessage:timestamped:");
}

id objc_msgSend___logNetworkStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logNetworkStatus:");
}

id objc_msgSend___logScanResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logScanResults:");
}

id objc_msgSend___logTxPower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logTxPower:");
}

id objc_msgSend___logWiFiStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__logWiFiStatus:");
}

id objc_msgSend___majorClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__majorClass");
}

id objc_msgSend___minorClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__minorClass");
}

id objc_msgSend___model(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__model");
}

id objc_msgSend___mostRecentInDirectories_include_exclude_maxAge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__mostRecentInDirectories:include:exclude:maxAge:");
}

id objc_msgSend___mostRecentInDirectories_matchingPrefix_matchingSuffix_excludingPrefix_excludingSuffix_maxAge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:");
}

id objc_msgSend___mostRecentLogWithSuffix_logPath_queue_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__mostRecentLogWithSuffix:logPath:queue:reply:");
}

id objc_msgSend___name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__name");
}

id objc_msgSend___nextRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__nextRequest");
}

id objc_msgSend___occupiedChannelsForScanResults_supportedChannels_rssiThreshold_ignoreChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:");
}

id objc_msgSend___only2GHzChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__only2GHzChannels:");
}

id objc_msgSend___only2GHz_1_6_11_14_Channels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__only2GHz_1_6_11_14_Channels:");
}

id objc_msgSend___only5GHz20MHz40MHzChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__only5GHz20MHz40MHzChannels:");
}

id objc_msgSend___only5GHz40MHzChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__only5GHz40MHzChannels:");
}

id objc_msgSend___only5GHzChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__only5GHzChannels:");
}

id objc_msgSend___only5GHzNonDFSChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__only5GHzNonDFSChannels:");
}

id objc_msgSend___orderedChannelWeights_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__orderedChannelWeights:");
}

id objc_msgSend___overlappingChannelsForChannel_supportedChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__overlappingChannelsForChannel:supportedChannels:");
}

id objc_msgSend___parsePingOutput_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__parsePingOutput:result:");
}

id objc_msgSend___pendingRequestWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__pendingRequestWithUUID:");
}

id objc_msgSend___performCFPingWithAddress_count_timeout_trafficClass_networkServiceType_dataLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:");
}

id objc_msgSend___performCurlWithAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__performCurlWithAddress:");
}

id objc_msgSend___performDNSResolution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__performDNSResolution:");
}

id objc_msgSend___performLoadViaNSURLSessionWithAddress_usingTimeout_andForceWiFiInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__performLoadViaNSURLSessionWithAddress:usingTimeout:andForceWiFiInterface:");
}

id objc_msgSend___performPing6WithAddress_count_wait_trafficClass_interfaceName_dataLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__performPing6WithAddress:count:wait:trafficClass:interfaceName:dataLength:");
}

id objc_msgSend___performPingUsingIMFoundationWithAddress_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__performPingUsingIMFoundationWithAddress:timeout:");
}

id objc_msgSend___performPingWithAddress_count_timeout_wait_interval_trafficClass_interfaceName_dataLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__performPingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:");
}

id objc_msgSend___performTracerouteWithAddress_maxTTL_waittime_queries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__performTracerouteWithAddress:maxTTL:waittime:queries:");
}

id objc_msgSend___ping6WithAddress_count_wait_trafficClass_interfaceName_dataLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ping6WithAddress:count:wait:trafficClass:interfaceName:dataLength:");
}

id objc_msgSend___pingBroadcast_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__pingBroadcast:");
}

id objc_msgSend___pingSubnet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__pingSubnet:");
}

id objc_msgSend___pingUsingCFNetworkWithAddress_count_timeout_trafficClass_networkServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:");
}

id objc_msgSend___pingUsingIMFoundationWithAddress_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__pingUsingIMFoundationWithAddress:timeout:");
}

id objc_msgSend___pingWithAddress_count_timeout_wait_interval_trafficClass_interfaceName_dataLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:");
}

id objc_msgSend___possibleCoreCapturePathsWithComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__possibleCoreCapturePathsWithComponent:");
}

id objc_msgSend___possibleTempWiFiLogPaths(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__possibleTempWiFiLogPaths");
}

id objc_msgSend___preferredNetworkWithNetworkName_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__preferredNetworkWithNetworkName:configuration:");
}

id objc_msgSend___proxiesSetupConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__proxiesSetupConfig");
}

id objc_msgSend___purgeDiagnosticsHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__purgeDiagnosticsHistory");
}

id objc_msgSend___purgeFilesInDirectory_matching_maxAge_maxCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__purgeFilesInDirectory:matching:maxAge:maxCount:");
}

id objc_msgSend___purgeObsoleteFaultEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__purgeObsoleteFaultEvents");
}

id objc_msgSend___queryAWDLStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryAWDLStatus");
}

id objc_msgSend___queryBluetoothStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryBluetoothStatus");
}

id objc_msgSend___queryDatabaseAndReply_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryDatabaseAndReply:reply:");
}

id objc_msgSend___queryDebugConfigurationAndReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryDebugConfigurationAndReply:");
}

id objc_msgSend___queryDiagnosticsModes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryDiagnosticsModes");
}

id objc_msgSend___queryLastHourFaultsStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryLastHourFaultsStatus");
}

id objc_msgSend___queryLastHourLinkTestsStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryLastHourLinkTestsStatus");
}

id objc_msgSend___queryLastHourRecoveriesStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryLastHourRecoveriesStatus");
}

id objc_msgSend___queryMegaWiFiProfileInstalledAndReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryMegaWiFiProfileInstalledAndReply:");
}

id objc_msgSend___queryNetworkStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryNetworkStatus");
}

id objc_msgSend___queryNoLoggingWiFiProfileInstalledAndReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryNoLoggingWiFiProfileInstalledAndReply:");
}

id objc_msgSend___queryPowerStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryPowerStatus");
}

id objc_msgSend___queryStatusAndReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryStatusAndReply:");
}

id objc_msgSend___queryStatusIncludingWiFiScanCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryStatusIncludingWiFiScanCache:");
}

id objc_msgSend___queryWiFiStatusIncludingScanCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryWiFiStatusIncludingScanCache:");
}

id objc_msgSend___replyWithCachedSysdiagnoseContentForRequest_temporaryURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__replyWithCachedSysdiagnoseContentForRequest:temporaryURL:");
}

id objc_msgSend___resetNetworkServiceOrderFromFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__resetNetworkServiceOrderFromFile");
}

id objc_msgSend___resolveBonjourInstance_serviceType_duration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__resolveBonjourInstance:serviceType:duration:");
}

id objc_msgSend___runDiagnostics_configuration_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__runDiagnostics:configuration:uuid:reply:");
}

id objc_msgSend___runDiagnosticsTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__runDiagnosticsTest:");
}

id objc_msgSend___runDiagnosticsTests_configuration_timeout_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__runDiagnosticsTests:configuration:timeout:error:");
}

id objc_msgSend___runDiagnosticsTests_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__runDiagnosticsTests:reply:");
}

id objc_msgSend___runRequest_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__runRequest:reply:");
}

id objc_msgSend___runToolWithOutputFileHandle_launchPath_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__runToolWithOutputFileHandle:launchPath:arguments:");
}

id objc_msgSend___runToolWithOutputFileHandle_readFromStandardError_launchPath_arguments_addCommand_addTimestamps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:");
}

id objc_msgSend___runWiFiPerfLoggingWithConfiguration_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__runWiFiPerfLoggingWithConfiguration:uuid:reply:");
}

id objc_msgSend___runWiFiSnifferOnChannel_duration_uuid_tcpDump_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__runWiFiSnifferOnChannel:duration:uuid:tcpDump:reply:");
}

id objc_msgSend___runWiFiSnifferOnPeer_channels_duration_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__runWiFiSnifferOnPeer:channels:duration:uuid:reply:");
}

id objc_msgSend___scanResultWithNetworkName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__scanResultWithNetworkName:");
}

id objc_msgSend___setDebugConfiguration_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__setDebugConfiguration:reply:");
}

id objc_msgSend___setEAPOLDebugFlagsEnabled_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__setEAPOLDebugFlagsEnabled:error:");
}

id objc_msgSend___setMegaWiFiProfileInstalled_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__setMegaWiFiProfileInstalled:reply:");
}

id objc_msgSend___setNetworkServiceOrder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__setNetworkServiceOrder:");
}

id objc_msgSend___setNoLoggingWiFiProfileInstalled_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__setNoLoggingWiFiProfileInstalled:reply:");
}

id objc_msgSend___setOpenDirectoryLoggingEnabled_queue_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__setOpenDirectoryLoggingEnabled:queue:reply:");
}

id objc_msgSend___setValue_key_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__setValue:key:domain:");
}

id objc_msgSend___setupCallbacks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__setupCallbacks");
}

id objc_msgSend___setupWatchdogTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__setupWatchdogTask");
}

id objc_msgSend___setupWiFiStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__setupWiFiStats");
}

id objc_msgSend___startAWDLPerfLogging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__startAWDLPerfLogging");
}

id objc_msgSend___startAWDLQueryTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__startAWDLQueryTimer");
}

id objc_msgSend___startCoreCaptureTriggerTimerWithInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__startCoreCaptureTriggerTimerWithInterval:");
}

id objc_msgSend___startEventMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__startEventMonitoring");
}

id objc_msgSend___startNANQueryTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__startNANQueryTimer");
}

id objc_msgSend___startP2PPerfLogging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__startP2PPerfLogging");
}

id objc_msgSend___startPerfLogging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__startPerfLogging");
}

id objc_msgSend___startWiFiStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__startWiFiStats");
}

id objc_msgSend___stopEventMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__stopEventMonitoring");
}

id objc_msgSend___teardownWiFiStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__teardownWiFiStats");
}

id objc_msgSend___temporaryDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__temporaryDirectory");
}

id objc_msgSend___testAWDLEnabledWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testAWDLEnabledWithConfiguration:");
}

id objc_msgSend___testAWDLRealtimeWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testAWDLRealtimeWithConfiguration:");
}

id objc_msgSend___testAirPortBaseStationWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testAirPortBaseStationWithConfiguration:");
}

id objc_msgSend___testAmbiguousNetworkNameWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testAmbiguousNetworkNameWithConfiguration:");
}

id objc_msgSend___testBTCoexWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testBTCoexWithConfiguration:");
}

id objc_msgSend___testCaptivePortalWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testCaptivePortalWithConfiguration:");
}

id objc_msgSend___testConcurrentWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testConcurrentWithConfiguration:");
}

id objc_msgSend___testConflictingCountryCodeWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testConflictingCountryCodeWithConfiguration:");
}

id objc_msgSend___testConflictingPHYMode11acWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testConflictingPHYMode11acWithConfiguration:");
}

id objc_msgSend___testConflictingPHYMode11nWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testConflictingPHYMode11nWithConfiguration:");
}

id objc_msgSend___testConflictingSecurityTypePNLWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testConflictingSecurityTypePNLWithConfiguration:");
}

id objc_msgSend___testCongested2GHzWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testCongested2GHzWithConfiguration:");
}

id objc_msgSend___testCongested5GHzWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testCongested5GHzWithConfiguration:");
}

id objc_msgSend___testCongestedChannelUsingCCAWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testCongestedChannelUsingCCAWithConfiguration:");
}

id objc_msgSend___testCongestedChannelWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testCongestedChannelWithConfiguration:");
}

id objc_msgSend___testCurlApple(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testCurlApple");
}

id objc_msgSend___testCustomDNS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testCustomDNS");
}

id objc_msgSend___testCustomIPv4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testCustomIPv4");
}

id objc_msgSend___testCustomIPv6(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testCustomIPv6");
}

id objc_msgSend___testCustomWebProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testCustomWebProxy");
}

id objc_msgSend___testDetectDoubleNAT(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testDetectDoubleNAT");
}

id objc_msgSend___testDiscoverPeerTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testDiscoverPeerTypes");
}

id objc_msgSend___testDownloadSpeedWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testDownloadSpeedWithConfiguration:");
}

id objc_msgSend___testHT402GHzWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testHT402GHzWithConfiguration:");
}

id objc_msgSend___testHiddenNetworkWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testHiddenNetworkWithConfiguration:");
}

id objc_msgSend___testHighBTConnectedWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testHighBTConnectedWithConfiguration:");
}

id objc_msgSend___testHighBTPairedWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testHighBTPairedWithConfiguration:");
}

id objc_msgSend___testIPv4Assigned(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testIPv4Assigned");
}

id objc_msgSend___testIPv6Assigned(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testIPv6Assigned");
}

id objc_msgSend___testLargePNLWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testLargePNLWithConfiguration:");
}

id objc_msgSend___testLeakyAP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testLeakyAP");
}

id objc_msgSend___testLegacyRates11bWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testLegacyRates11bWithConfiguration:");
}

id objc_msgSend___testLegacySecurityWEPWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testLegacySecurityWEPWithConfiguration:");
}

id objc_msgSend___testLegacySecurityWPAWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testLegacySecurityWPAWithConfiguration:");
}

id objc_msgSend___testLongBeaconIntervalWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testLongBeaconIntervalWithConfiguration:");
}

id objc_msgSend___testLongDTIMInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testLongDTIMInterval");
}

id objc_msgSend___testNoSecurityWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testNoSecurityWithConfiguration:");
}

id objc_msgSend___testPNLContainsHiddenWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testPNLContainsHiddenWithConfiguration:");
}

id objc_msgSend___testPasspointWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testPasspointWithConfiguration:");
}

id objc_msgSend___testPeerDiagnostics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testPeerDiagnostics");
}

id objc_msgSend___testPeerTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testPeerTypes");
}

id objc_msgSend___testPing6AWDLWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testPing6AWDLWithConfiguration:");
}

id objc_msgSend___testPingLANUsingCFNetworkWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testPingLANUsingCFNetworkWithConfiguration:");
}

id objc_msgSend___testPingLANUsingIMFoundation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testPingLANUsingIMFoundation");
}

id objc_msgSend___testPingLANWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testPingLANWithConfiguration:");
}

id objc_msgSend___testPingWANUsingCFNetworkWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testPingWANUsingCFNetworkWithConfiguration:");
}

id objc_msgSend___testPingWANUsingIMFoundation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testPingWANUsingIMFoundation");
}

id objc_msgSend___testPingWANWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testPingWANWithConfiguration:");
}

id objc_msgSend___testPoorSignalWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testPoorSignalWithConfiguration:");
}

id objc_msgSend___testReachApple(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testReachApple");
}

id objc_msgSend___testReachabilityToPeersWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testReachabilityToPeersWithConfiguration:");
}

id objc_msgSend___testResolveDNS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testResolveDNS");
}

id objc_msgSend___testRetrieveApple(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testRetrieveApple");
}

id objc_msgSend___testRetrieveAppleForceWiFiWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testRetrieveAppleForceWiFiWithConfiguration:");
}

id objc_msgSend___testUploadSpeedWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testUploadSpeedWithConfiguration:");
}

id objc_msgSend___testWiFiHiddenScanResultsWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testWiFiHiddenScanResultsWithConfiguration:");
}

id objc_msgSend___testWiFiIsPrimaryIPv4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testWiFiIsPrimaryIPv4");
}

id objc_msgSend___testWiFiIsPrimaryIPv6(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testWiFiIsPrimaryIPv6");
}

id objc_msgSend___testWiFiLink(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testWiFiLink");
}

id objc_msgSend___testWiFiNoScanResultsWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testWiFiNoScanResultsWithConfiguration:");
}

id objc_msgSend___testiOSPersonalHotspotWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__testiOSPersonalHotspotWithConfiguration:");
}

id objc_msgSend___toggleDNSLoggingWithQueue_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__toggleDNSLoggingWithQueue:reply:");
}

id objc_msgSend___unarchiveEventCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__unarchiveEventCache");
}

id objc_msgSend___unarchiveNotifyPeers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__unarchiveNotifyPeers");
}

id objc_msgSend___updateAWDLRealTimeMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__updateAWDLRealTimeMode:");
}

id objc_msgSend___updateDiagnosticsHistoryWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__updateDiagnosticsHistoryWithResult:");
}

id objc_msgSend___updateLastAssociatedSSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__updateLastAssociatedSSID");
}

id objc_msgSend___updateStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__updateStatus");
}

id objc_msgSend___updateStatusCoalesce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__updateStatusCoalesce");
}

id objc_msgSend___updateStatusMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__updateStatusMonitoring");
}

id objc_msgSend___updatedStatusWithEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__updatedStatusWithEvent:");
}

id objc_msgSend___uploadSpeedtestWithFileSize_timeout_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__uploadSpeedtestWithFileSize:timeout:error:");
}

id objc_msgSend___valueForKey_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__valueForKey:domain:");
}

id objc_msgSend___waitForLogRequestToComplete_maxWait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__waitForLogRequestToComplete:maxWait:");
}

id objc_msgSend___wifi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__wifi");
}

id objc_msgSend___wlCLIWithArguments_outputFileHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__wlCLIWithArguments:outputFileHandle:");
}

id objc_msgSend___wlCLIWithArguments_outputFileHandle_addCommand_addTimestamps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:");
}

id objc_msgSend___wlCLIWithArguments_outputFilePath_outputData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__wlCLIWithArguments:outputFilePath:outputData:");
}

id objc_msgSend___writeDiagnosticModeToFile_file_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__writeDiagnosticModeToFile:file:");
}

id objc_msgSend___writePeerStatusToFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__writePeerStatusToFile:");
}

id objc_msgSend__actionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_actionHandler");
}

id objc_msgSend__activePeersWithDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_activePeersWithDiscoveryFlags:");
}

id objc_msgSend__archiveAndCollectLogs_logCollectionPath_outputDirectory_maxWait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:");
}

id objc_msgSend__canStartMode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_canStartMode:error:");
}

id objc_msgSend__collectAnalyticsCSVsForDiagnosticMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectAnalyticsCSVsForDiagnosticMode:");
}

id objc_msgSend__collectNetworkInfoForDiagnosticMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectNetworkInfoForDiagnosticMode:");
}

id objc_msgSend__collectSystemLogsForDiagnosticMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectSystemLogsForDiagnosticMode:");
}

id objc_msgSend__configureCompaionLinkClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureCompaionLinkClient");
}

id objc_msgSend__configureDiscoveryClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureDiscoveryClient");
}

id objc_msgSend__connectionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectionInfo");
}

id objc_msgSend__currentVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentVersion");
}

id objc_msgSend__deconstructServiceType_rdlen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deconstructServiceType:rdlen:");
}

id objc_msgSend__diagnosticsModeFilteredWithPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_diagnosticsModeFilteredWithPredicate:");
}

id objc_msgSend__discoveryRequestsContainsRapportRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_discoveryRequestsContainsRapportRequest");
}

id objc_msgSend__executeTimerBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_executeTimerBlock");
}

id objc_msgSend__featureAvailabilityDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_featureAvailabilityDefaults");
}

id objc_msgSend__finishedProcessingDiagnosticMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finishedProcessingDiagnosticMode:");
}

id objc_msgSend__getCachedDiagnosticsMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getCachedDiagnosticsMode:");
}

id objc_msgSend__getCachedLocalStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getCachedLocalStore:");
}

id objc_msgSend__getCurrentUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getCurrentUsage");
}

id objc_msgSend__getProcNetUsageWithName_inUsageData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getProcNetUsageWithName:inUsageData:");
}

id objc_msgSend__getWAAnalyticsAccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getWAAnalyticsAccess");
}

id objc_msgSend__handleDeviceFound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleDeviceFound:");
}

id objc_msgSend__handleDeviceLost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleDeviceLost:");
}

id objc_msgSend__handleRapportDeviceFound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleRapportDeviceFound:");
}

id objc_msgSend__handleRapportDeviceLost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleRapportDeviceLost:");
}

id objc_msgSend__homeDiagnosticsDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_homeDiagnosticsDomain");
}

id objc_msgSend__invalidateRapportClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateRapportClient");
}

id objc_msgSend__ipStringFromAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_ipStringFromAddress:");
}

id objc_msgSend__isFaultSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isFaultSupported:");
}

id objc_msgSend__listFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_listFiles:");
}

id objc_msgSend__newPeersDiscovered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newPeersDiscovered:");
}

id objc_msgSend__notifyPeers_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifyPeers:info:");
}

id objc_msgSend__peerListeners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_peerListeners");
}

id objc_msgSend__peersLost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_peersLost:");
}

id objc_msgSend__performFetch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performFetch:error:");
}

id objc_msgSend__queryDebugConfigurationForPeer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queryDebugConfigurationForPeer:reply:");
}

id objc_msgSend__registerRequestsForListener_rapportClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerRequestsForListener:rapportClient:");
}

id objc_msgSend__runAction_peer_info_handler_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_runAction:peer:info:handler:completion:");
}

id objc_msgSend__runDiagnostics_uuid_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_runDiagnostics:uuid:configuration:");
}

id objc_msgSend__runDiagnosticsForDiagnosticMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_runDiagnosticsForDiagnosticMode:");
}

id objc_msgSend__runSnifferOnChannels_interface_duration_noAutoStop_rotationInternal_uuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:");
}

id objc_msgSend__scheduleRepeatingCleanupTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleRepeatingCleanupTasks");
}

id objc_msgSend__sendRapportRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendRapportRequest:");
}

id objc_msgSend__setHomeDiagnosticsDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setHomeDiagnosticsDomain:");
}

id objc_msgSend__setupRapportClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupRapportClient");
}

id objc_msgSend__setupWithTargetID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupWithTargetID:");
}

id objc_msgSend__shouldShowNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowNotification:");
}

id objc_msgSend__showSuggestedStartNotificationForEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showSuggestedStartNotificationForEvent:");
}

id objc_msgSend__showSuggestedStopNotificationForEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showSuggestedStopNotificationForEvent:");
}

id objc_msgSend__startDiagnosticsModeWithConfiguration_currentPeer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startDiagnosticsModeWithConfiguration:currentPeer:reply:");
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stop");
}

id objc_msgSend__stopDiagnosticsMode_currentPeer_info_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopDiagnosticsMode:currentPeer:info:reply:");
}

id objc_msgSend__stopPeerDiscoveryWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopPeerDiscoveryWithRequest:");
}

id objc_msgSend__storeSnifferInfo_peer_uuid_path_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_storeSnifferInfo:peer:uuid:path:");
}

id objc_msgSend__updateCachedDiagnosticsMode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateCachedDiagnosticsMode:error:");
}

id objc_msgSend__updateCachedLocalStore_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateCachedLocalStore:error:");
}

id objc_msgSend__updateDiagnosticsMode_incomingMode_currentPeer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDiagnosticsMode:incomingMode:currentPeer:reply:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessWithOptions:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activeBFD(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeBFD");
}

id objc_msgSend_activeDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeDevices");
}

id objc_msgSend_activeDiagnostics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeDiagnostics");
}

id objc_msgSend_activeFileHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeFileHandle");
}

id objc_msgSend_activePCap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activePCap");
}

id objc_msgSend_activePeers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activePeers");
}

id objc_msgSend_activeRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeRequests");
}

id objc_msgSend_addBarrierBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addBarrierBlock:");
}

id objc_msgSend_addBrowseContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addBrowseContext:");
}

id objc_msgSend_addDomain_rdlen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDomain:rdlen:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEvent:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addItem:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRequest:");
}

id objc_msgSend_addServiceInstance_serviceType_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addServiceInstance:serviceType:domain:");
}

id objc_msgSend_addServiceType_rdlen_fullname_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addServiceType:rdlen:fullname:");
}

id objc_msgSend_addToStore_newInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addToStore:newInfo:");
}

id objc_msgSend_addedAt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addedAt");
}

id objc_msgSend_additionalLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionalLog");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
}

id objc_msgSend_airDropDiscoverableMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airDropDiscoverableMode");
}

id objc_msgSend_airPortBaseStationModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airPortBaseStationModel");
}

id objc_msgSend_airPortBaseStationModelName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airPortBaseStationModelName");
}

id objc_msgSend_allDiagnostics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allDiagnostics");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_alternateExecutionBlockForCleanExit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternateExecutionBlockForCleanExit");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_appStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appStore");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "available");
}

id objc_msgSend_averageRoundtripTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "averageRoundtripTime");
}

id objc_msgSend_avg(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avg");
}

id objc_msgSend_awdl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "awdl");
}

id objc_msgSend_awdlStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "awdlStatus");
}

id objc_msgSend_awdlStrategy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "awdlStrategy");
}

id objc_msgSend_awdlSyncEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "awdlSyncEnabled");
}

id objc_msgSend_band(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "band");
}

id objc_msgSend_batteryWarningLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryWarningLevel");
}

id objc_msgSend_beaconInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beaconInterval");
}

id objc_msgSend_beginPeerDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginPeerDiscovery");
}

id objc_msgSend_beginWiFiDefaultRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginWiFiDefaultRoute");
}

id objc_msgSend_bluetooth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetooth");
}

id objc_msgSend_bluetoothStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothStatus");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bootArgs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bootArgs");
}

id objc_msgSend_browseAllResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "browseAllResults");
}

id objc_msgSend_bssid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bssid");
}

id objc_msgSend_btcConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btcConfig");
}

id objc_msgSend_btcMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btcMode");
}

id objc_msgSend_btcProfiles2GHz(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btcProfiles2GHz");
}

id objc_msgSend_btcProfiles5GHz(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btcProfiles5GHz");
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "build");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cachedLinkQualityMetric(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedLinkQualityMetric");
}

id objc_msgSend_cachedPreferredNetworksListWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedPreferredNetworksListWithUUID:");
}

id objc_msgSend_cachedStatusWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedStatusWithUUID:");
}

id objc_msgSend_calculateUsageDelta_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateUsageDelta:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAllOperations");
}

id objc_msgSend_cancelRequestWithUUID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelRequestWithUUID:reply:");
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capabilities");
}

id objc_msgSend_caps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caps");
}

id objc_msgSend_cca(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cca");
}

id objc_msgSend_chainAck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chainAck");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channel");
}

id objc_msgSend_channelWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channelWidth");
}

id objc_msgSend_channels(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channels");
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_clearCachedPreferredNetworksListWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearCachedPreferredNetworksListWithUUID:");
}

id objc_msgSend_clearCachedStatusWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearCachedStatusWithUUID:");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFile");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collectLogsDiagnosticMode_outputName_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectLogsDiagnosticMode:outputName:reply:");
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "command");
}

id objc_msgSend_companionLinkDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "companionLinkDevice");
}

id objc_msgSend_completedAt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completedAt");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_concurrentQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "concurrentQueue");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_configureDiscoveryClientAndActivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureDiscoveryClientAndActivate");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectable");
}

id objc_msgSend_connectedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedDevices");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerURLForSecurityApplicationGroupIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsAtPath:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controlFlags");
}

id objc_msgSend_convertCSVArrayToKeyValueDictArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertCSVArrayToKeyValueDictArray:");
}

id objc_msgSend_convertKeyValueDictArrayToCSVArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertKeyValueDictArrayToCSVArray:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_copyPeriodicNetUsageToDir_uuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPeriodicNetUsageToDir:uuid:");
}

id objc_msgSend_corewifi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "corewifi");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForFetchRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countForFetchRequest:error:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countryCode");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentKnownNetworkProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentKnownNetworkProfile");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentNetwork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentNetwork");
}

id objc_msgSend_currentPeer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPeer");
}

id objc_msgSend_currentPreferredNetwork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPreferredNetwork");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentScanResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentScanResult");
}

id objc_msgSend_currentVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentVersion");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithCapacity:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_debugManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugManager");
}

id objc_msgSend_debugTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugTimer");
}

id objc_msgSend_debugTimerEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugTimerEnabled");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConfiguration");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSound");
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultTimeZone");
}

id objc_msgSend_deregisterTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterTaskWithIdentifier:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_desense(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "desense");
}

id objc_msgSend_desenseLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "desenseLevel");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceScanningInProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceScanningInProgress");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devices");
}

id objc_msgSend_diagnostics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnostics");
}

id objc_msgSend_diagnosticsHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsHistory");
}

id objc_msgSend_diagnosticsMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsMode");
}

id objc_msgSend_diagnosticsModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsModeEnabled");
}

id objc_msgSend_diagnosticsModeManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsModeManager");
}

id objc_msgSend_diagnosticsModeMatchingPeerID_state_role_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsModeMatchingPeerID:state:role:");
}

id objc_msgSend_diagnosticsModeMatchingUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsModeMatchingUUID:");
}

id objc_msgSend_diagnosticsModeWithState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsModeWithState:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didPass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didPass");
}

id objc_msgSend_disassociate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disassociate");
}

id objc_msgSend_discoveryClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryClient");
}

id objc_msgSend_discoveryFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryFlags");
}

id objc_msgSend_discoveryRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryRequests");
}

id objc_msgSend_dispatchNotificationWithTitle_subtitle_body_type_UUID_actionURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_dnsAddresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dnsAddresses");
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainName");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dumpDeploymentGraphJSONFileWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpDeploymentGraphJSONFileWithCompletion:");
}

id objc_msgSend_dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion_batchSize_maxAge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:");
}

id objc_msgSend_dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion_batchSize_maxAge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_eapol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eapol");
}

id objc_msgSend_eapolControlMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eapolControlMode");
}

id objc_msgSend_eapolSupplicantState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eapolSupplicantState");
}

id objc_msgSend_effectiveEnabledLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveEnabledLevel");
}

id objc_msgSend_effectiveGroupIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveGroupIdentifier");
}

id objc_msgSend_effectivePersistedLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectivePersistedLevel");
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveUserIdentifier");
}

id objc_msgSend_encode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encode");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endWiFiDefaultRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endWiFiDefaultRoute");
}

id objc_msgSend_endedAt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endedAt");
}

id objc_msgSend_entitiesByName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitiesByName");
}

id objc_msgSend_entityName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entityName");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorStr(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorStr");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_escapedPatternForString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "escapedPatternForString:");
}

id objc_msgSend_estimatedTimeRemaining(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "estimatedTimeRemaining");
}

id objc_msgSend_eventHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventHistory");
}

id objc_msgSend_eventID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventID");
}

id objc_msgSend_eventIDWithType_interfaceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventIDWithType:interfaceName:");
}

id objc_msgSend_eventIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventIDs");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_fastestSupportedPHYMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fastestSupportedPHYMode");
}

id objc_msgSend_faultEventCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "faultEventCache");
}

id objc_msgSend_faultEventHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "faultEventHandler");
}

id objc_msgSend_faultEventMonitoringPeers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "faultEventMonitoringPeers");
}

id objc_msgSend_fetchFileHandleForInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchFileHandleForInterface:");
}

id objc_msgSend_fetchLastHourFaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchLastHourFaults");
}

id objc_msgSend_fetchLastHourLinkTests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchLastHourLinkTests");
}

id objc_msgSend_fetchLastHourRecoveries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchLastHourRecoveries");
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequest");
}

id objc_msgSend_fetchRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestWithEntityName:");
}

id objc_msgSend_fetchedResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchedResults");
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileCreationDate");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDescriptor");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandleForUpdatingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForUpdatingAtPath:");
}

id objc_msgSend_fileHandleForWritingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForWritingAtPath:");
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileModificationDate");
}

id objc_msgSend_filePaths(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filePaths");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileType");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filename");
}

id objc_msgSend_files(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "files");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_filteredSetUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredSetUsingPredicate:");
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finish");
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flags");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_gatherPeerDiagnostics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gatherPeerDiagnostics");
}

id objc_msgSend_gatherPeerTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gatherPeerTypes");
}

id objc_msgSend_getBufferFromPool(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBufferFromPool");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getDPSSummary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDPSSummary");
}

id objc_msgSend_getDpsStatsandReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDpsStatsandReply:");
}

id objc_msgSend_getLQMSummary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLQMSummary");
}

id objc_msgSend_getMinNotificationInterval_notificationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMinNotificationInterval:notificationType:");
}

id objc_msgSend_getPairOfBuffersFromPool(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPairOfBuffersFromPool");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getWiFiStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getWiFiStatus");
}

id objc_msgSend_gid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gid");
}

id objc_msgSend_globalDNSServerAddresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalDNSServerAddresses");
}

id objc_msgSend_globalIPv4Addresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalIPv4Addresses");
}

id objc_msgSend_globalIPv4InterfaceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalIPv4InterfaceName");
}

id objc_msgSend_globalIPv4NetworkServiceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalIPv4NetworkServiceID");
}

id objc_msgSend_globalIPv4NetworkServiceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalIPv4NetworkServiceName");
}

id objc_msgSend_globalIPv4RouterAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalIPv4RouterAddress");
}

id objc_msgSend_globalIPv6Addresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalIPv6Addresses");
}

id objc_msgSend_globalIPv6InterfaceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalIPv6InterfaceName");
}

id objc_msgSend_globalIPv6NetworkServiceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalIPv6NetworkServiceID");
}

id objc_msgSend_globalIPv6NetworkServiceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalIPv6NetworkServiceName");
}

id objc_msgSend_globalIPv6RouterAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalIPv6RouterAddress");
}

id objc_msgSend_guardInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "guardInterval");
}

id objc_msgSend_handleClientRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleClientRequest:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handlePeerFaultEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePeerFaultEvent:");
}

id objc_msgSend_handleResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleResponse:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handler");
}

id objc_msgSend_hardwareMACAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hardwareMACAddress");
}

id objc_msgSend_hasDirectoryPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDirectoryPath");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_hiddenState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hiddenState");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsDeviceIdentifier");
}

id objc_msgSend_includeEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "includeEvents");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSet");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "info");
}

id objc_msgSend_infoMatchingDiagnosticMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoMatchingDiagnosticMode:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_init_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init:");
}

id objc_msgSend_init_usageData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init:usageData:");
}

id objc_msgSend_initBuffersWithSize_bufferCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initBuffersWithSize:bufferCount:");
}

id objc_msgSend_initDiagnosticsMode_wifiState_megaWiFiProfileState_noLoggingWiFiProfileState_eapolState_bluetoothState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolState:bluetoothState:");
}

id objc_msgSend_initDiagnosticsMode_wifiState_megaWiFiProfileState_noLoggingWiFiProfileState_eapolState_bluetoothState_stbcState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initDiagnosticsMode:wifiState:megaWiFiProfileState:noLoggingWiFiProfileState:eapolState:bluetoothState:stbcState:");
}

id objc_msgSend_initFileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFileURLWithPath:");
}

id objc_msgSend_initFileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFileURLWithPath:isDirectory:");
}

id objc_msgSend_initWithAddress_wifi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAddress:wifi:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithArray_copyItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:copyItems:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithChannel_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChannel:flags:");
}

id objc_msgSend_initWithCompanionLinkDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCompanionLinkDevice:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfiguration_uuid_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:uuid:handler:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:error:");
}

id objc_msgSend_initWithCoreWiFiInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoreWiFiInterface:");
}

id objc_msgSend_initWithCurrentPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCurrentPeer:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDatabaseAccessManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDatabaseAccessManager:");
}

id objc_msgSend_initWithDebugManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDebugManager:");
}

id objc_msgSend_initWithDiagnosticsManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDiagnosticsManager:");
}

id objc_msgSend_initWithDiagnosticsModeManager_statusManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDiagnosticsModeManager:statusManager:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDouble:");
}

id objc_msgSend_initWithFileDescriptor_closeOnDealloc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:closeOnDealloc:");
}

id objc_msgSend_initWithFileDescriptor_datalinkType_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:datalinkType:delegate:delegateQueue:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInteger:");
}

id objc_msgSend_initWithInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInterface:");
}

id objc_msgSend_initWithInterface_snifferManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInterface:snifferManager:");
}

id objc_msgSend_initWithInterface_statusManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInterface:statusManager:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithNetUsageManager_peerManager_userNotificationManager_snifferManager_statusManager_logManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNetUsageManager:peerManager:userNotificationManager:snifferManager:statusManager:logManager:");
}

id objc_msgSend_initWithPayload_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPayload:options:error:");
}

id objc_msgSend_initWithPayload_options_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPayload:options:handler:");
}

id objc_msgSend_initWithPeer_diagnostics_configuration_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeer:diagnostics:configuration:uuid:reply:");
}

id objc_msgSend_initWithPeer_fetch_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeer:fetch:reply:");
}

id objc_msgSend_initWithPeer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeer:reply:");
}

id objc_msgSend_initWithPeer_requestType_duration_uuid_channels_config_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeer:requestType:duration:uuid:channels:config:reply:");
}

id objc_msgSend_initWithPeer_requestType_remotePath_transferManager_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeer:requestType:remotePath:transferManager:reply:");
}

id objc_msgSend_initWithPeer_type_debugConfiguration_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeer:type:debugConfiguration:reply:");
}

id objc_msgSend_initWithPeerManager_diagnosticsModeManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeerManager:diagnosticsModeManager:");
}

id objc_msgSend_initWithPeersFound_peersLost_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeersFound:peersLost:info:");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithRequestListeners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequestListeners:");
}

id objc_msgSend_initWithRole_peer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRole:peer:");
}

id objc_msgSend_initWithSaveFileName_dataLinkTypeValue_sizeLimit_countLimit_circularSaveFiles_timestampSaveFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSaveFileName:dataLinkTypeValue:sizeLimit:countLimit:circularSaveFiles:timestampSaveFiles:");
}

id objc_msgSend_initWithServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceType:");
}

id objc_msgSend_initWithStatusManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStatusManager:");
}

id objc_msgSend_initWithStatusManager_andUserNotificationManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStatusManager:andUserNotificationManager:");
}

id objc_msgSend_initWithStatusManager_diagnosticsManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStatusManager:diagnosticsManager:");
}

id objc_msgSend_initWithStatusManager_diagnosticsManager_peerDiagnosticsManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStatusManager:diagnosticsManager:peerDiagnosticsManager:");
}

id objc_msgSend_initWithStatusManager_peerDiagnosticsManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStatusManager:peerDiagnosticsManager:");
}

id objc_msgSend_initWithStoreIdentifier_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStoreIdentifier:type:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithSummaryFaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSummaryFaults:");
}

id objc_msgSend_initWithSummaryLinkTests_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSummaryLinkTests:");
}

id objc_msgSend_initWithSummaryRecoveries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSummaryRecoveries:");
}

id objc_msgSend_initWithTransferManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTransferManager:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithWorkspace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWorkspace:");
}

id objc_msgSend_initWithXPCConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithXPCConnection:");
}

id objc_msgSend_initWorkspaceWithService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWorkspaceWithService:");
}

id objc_msgSend_initializeReceiverWithTargetID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeReceiverWithTargetID:");
}

id objc_msgSend_initializeSenderWithTargetID_peerPublicKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeSenderWithTargetID:peerPublicKey:");
}

id objc_msgSend_insertString_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertString:atIndex:");
}

id objc_msgSend_installedProfileIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedProfileIdentifiers");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interface");
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceName");
}

id objc_msgSend_interfaceNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceNames");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalBatteryLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalBatteryLevel");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAndCancel");
}

id objc_msgSend_invalidateDiscoveryClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateDiscoveryClient");
}

id objc_msgSend_ipv4Addresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ipv4Addresses");
}

id objc_msgSend_ipv4ConfigMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ipv4ConfigMethod");
}

id objc_msgSend_ipv4RouterAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ipv4RouterAddress");
}

id objc_msgSend_ipv6Addresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ipv6Addresses");
}

id objc_msgSend_ipv6ConfigMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ipv6ConfigMethod");
}

id objc_msgSend_ipv6RouterAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ipv6RouterAddress");
}

id objc_msgSend_is2GHz(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is2GHz");
}

id objc_msgSend_is5GHz(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is5GHz");
}

id objc_msgSend_is6GHz(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is6GHz");
}

id objc_msgSend_is6GHzPSC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is6GHzPSC");
}

id objc_msgSend_isAWDLRealTimeMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAWDLRealTimeMode");
}

id objc_msgSend_isAppleDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleDevice");
}

id objc_msgSend_isAppleReachable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleReachable");
}

id objc_msgSend_isAppleSWAP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleSWAP");
}

id objc_msgSend_isAutoJoinDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutoJoinDisabled");
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAvailable");
}

id objc_msgSend_isCaptive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCaptive");
}

id objc_msgSend_isCloudPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCloudPaired");
}

id objc_msgSend_isConnectable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnectable");
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnected");
}

id objc_msgSend_isDFS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDFS");
}

id objc_msgSend_isDiscoverable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDiscoverable");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToPeerDiscoveryRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToPeerDiscoveryRequest:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExecutableFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExecutableFileAtPath:");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isIBSS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIBSS");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isInvoluntaryLinkDown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInvoluntaryLinkDown");
}

id objc_msgSend_isLinkDown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLinkDown");
}

id objc_msgSend_isLowEnergy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLowEnergy");
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPaired");
}

id objc_msgSend_isPasspoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasspoint");
}

id objc_msgSend_isPersonalHotspot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPersonalHotspot");
}

id objc_msgSend_isReadableFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReadableFileAtPath:");
}

id objc_msgSend_isRequestActiveOrPending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRequestActiveOrPending:");
}

id objc_msgSend_isScanning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isScanning");
}

id objc_msgSend_isUsingCustomDNSSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUsingCustomDNSSettings");
}

id objc_msgSend_isUsingCustomProxySetting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUsingCustomProxySetting");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_isWEP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWEP");
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemID");
}

id objc_msgSend_itemRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemRequests");
}

id objc_msgSend_itemURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemURL");
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_knownNetworkProfilesWithProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knownNetworkProfilesWithProperties:");
}

id objc_msgSend_lastAssociatedSSIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastAssociatedSSIDString");
}

id objc_msgSend_lastHrFaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastHrFaults");
}

id objc_msgSend_lastHrLinkTests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastHrLinkTests");
}

id objc_msgSend_lastHrRecoveries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastHrRecoveries");
}

id objc_msgSend_lastJoinedAt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastJoinedAt");
}

id objc_msgSend_lastNotificationTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastNotificationTimestamp");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launch");
}

id objc_msgSend_leakyAPStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leakyAPStats");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_linkQualityMetricData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkQualityMetricData");
}

id objc_msgSend_linkQualityUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkQualityUpdates");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener");
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listeners");
}

id objc_msgSend_localAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localAddress");
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localDevice");
}

id objc_msgSend_localDiagnostics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localDiagnostics");
}

id objc_msgSend_localDiagnosticsStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localDiagnosticsStore");
}

id objc_msgSend_localIDSIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localIDSIdentifier");
}

id objc_msgSend_localPeer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localPeer");
}

id objc_msgSend_localStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localStore");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_lockBufferPool(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockBufferPool");
}

id objc_msgSend_logManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logManager");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "macAddress");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainObjectContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainObjectContext");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_majorClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "majorClass");
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedObjectModel");
}

id objc_msgSend_maskLocalDeviceEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maskLocalDeviceEvents:");
}

id objc_msgSend_max(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "max");
}

id objc_msgSend_maxFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxFiles");
}

id objc_msgSend_maxRoundtripTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxRoundtripTime");
}

id objc_msgSend_maxSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxSize");
}

id objc_msgSend_mcsIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mcsIndex");
}

id objc_msgSend_megaWiFiProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "megaWiFiProfile");
}

id objc_msgSend_min(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "min");
}

id objc_msgSend_minRoundtripTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minRoundtripTime");
}

id objc_msgSend_minorClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minorClass");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mode");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "model");
}

id objc_msgSend_monitorMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorMode");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nan");
}

id objc_msgSend_netUsageManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "netUsageManager");
}

id objc_msgSend_network(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "network");
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkName");
}

id objc_msgSend_networkServiceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkServiceID");
}

id objc_msgSend_networkStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkStatus");
}

id objc_msgSend_noAutoStop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noAutoStop");
}

id objc_msgSend_noLoggingWiFiProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noLoggingWiFiProfile");
}

id objc_msgSend_noise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noise");
}

id objc_msgSend_notifyPeersWithFaultEvent_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyPeersWithFaultEvent:info:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numPingsTransmitted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numPingsTransmitted");
}

id objc_msgSend_numberOfMatchesInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfMatchesInString:options:range:");
}

id objc_msgSend_numberOfSpacialStreams(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfSpacialStreams");
}

id objc_msgSend_numberOfSpatialStreams(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfSpatialStreams");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offsetInFile");
}

id objc_msgSend_opMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "opMode");
}

id objc_msgSend_openPcapForInterface_datalinkType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openPcapForInterface:datalinkType:");
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operatingSystemVersion");
}

id objc_msgSend_operationErrors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationErrors");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedSet");
}

id objc_msgSend_os(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "os");
}

id objc_msgSend_osTransactionComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "osTransactionComplete:");
}

id objc_msgSend_osTransactionCreate_transaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "osTransactionCreate:transaction:");
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "output");
}

id objc_msgSend_outputFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputFile");
}

id objc_msgSend_packetLoss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "packetLoss");
}

id objc_msgSend_packetLossRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "packetLossRate");
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedDevices");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pauseMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseMonitoring");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payload");
}

id objc_msgSend_payloadFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadFromDictionary:");
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peer");
}

id objc_msgSend_peerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerID");
}

id objc_msgSend_peerManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerManager");
}

id objc_msgSend_peerPublicKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerPublicKey");
}

id objc_msgSend_peerStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerStatus");
}

id objc_msgSend_peers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peers");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_performFetch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performFetch:");
}

id objc_msgSend_performScanOnChannels_translate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performScanOnChannels:translate:");
}

id objc_msgSend_performScanWithParameters_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performScanWithParameters:error:");
}

id objc_msgSend_performSensing_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSensing:error:");
}

id objc_msgSend_performSensingWithParameters_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSensingWithParameters:error:");
}

id objc_msgSend_performStartOperationsWithConfiguration_handler_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performStartOperationsWithConfiguration:handler:completion:");
}

id objc_msgSend_performStopOperationsForMode_handler_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performStopOperationsForMode:handler:completion:");
}

id objc_msgSend_performUpdateOperationsForMode_incomingMode_handler_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performUpdateOperationsForMode:incomingMode:handler:completion:");
}

id objc_msgSend_performanceTestWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performanceTestWithConfiguration:");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentStoreCoordinator");
}

id objc_msgSend_phyMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phyMode");
}

id objc_msgSend_pm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pm");
}

id objc_msgSend_power(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "power");
}

id objc_msgSend_powerOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerOn");
}

id objc_msgSend_powerSourceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerSourceType");
}

id objc_msgSend_powerState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerState");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferredNetworksList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredNetworksList");
}

id objc_msgSend_prepareTemplateAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareTemplateAndReturnError:");
}

id objc_msgSend_primaryDNSAddresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryDNSAddresses");
}

id objc_msgSend_primaryIPv4Addresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryIPv4Addresses");
}

id objc_msgSend_primaryIPv4InterfaceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryIPv4InterfaceName");
}

id objc_msgSend_primaryIPv4Router(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryIPv4Router");
}

id objc_msgSend_primaryIPv4ServiceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryIPv4ServiceID");
}

id objc_msgSend_primaryIPv4ServiceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryIPv4ServiceName");
}

id objc_msgSend_primaryIPv6Addresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryIPv6Addresses");
}

id objc_msgSend_primaryIPv6InterfaceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryIPv6InterfaceName");
}

id objc_msgSend_primaryIPv6Router(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryIPv6Router");
}

id objc_msgSend_primaryIPv6ServiceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryIPv6ServiceID");
}

id objc_msgSend_primaryIPv6ServiceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryIPv6ServiceName");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processName");
}

id objc_msgSend_processWAMessageMetric_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processWAMessageMetric:data:");
}

id objc_msgSend_processors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processors");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_publicKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicKey");
}

id objc_msgSend_publicKeySelf(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicKeySelf");
}

id objc_msgSend_queryBluetoothDebugLoggingAndReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryBluetoothDebugLoggingAndReply:");
}

id objc_msgSend_queryDatabaseForPeerWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryDatabaseForPeerWithRequest:");
}

id objc_msgSend_queryDebugConfigurationAndReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryDebugConfigurationAndReply:");
}

id objc_msgSend_queryDebugConfigurationAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryDebugConfigurationAndReturnError:");
}

id objc_msgSend_queryDiagnosticsModeAndReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryDiagnosticsModeAndReply:");
}

id objc_msgSend_queryEAPOLDebugLoggingAndReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryEAPOLDebugLoggingAndReply:");
}

id objc_msgSend_queryFaultEventCacheForPeer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryFaultEventCacheForPeer:reply:");
}

id objc_msgSend_querySTBCAndReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "querySTBCAndReply:");
}

id objc_msgSend_queryStatusForPeerWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryStatusForPeerWithRequest:");
}

id objc_msgSend_queryWiFiDebugLoggingAndReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryWiFiDebugLoggingAndReply:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_rangeOfData_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfData:options:range:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rapportClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rapportClient");
}

id objc_msgSend_reachabilityFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reachabilityFlags");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reason");
}

id objc_msgSend_receivedEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedEvent:");
}

id objc_msgSend_receivedPeerDiscoveryEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedPeerDiscoveryEvent:");
}

id objc_msgSend_recordUsageToDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordUsageToDate:");
}

id objc_msgSend_registerDiagnosticModePeer_configuration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDiagnosticModePeer:configuration:error:");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_registerPeer_role_configuration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerPeer:role:configuration:error:");
}

id objc_msgSend_registerPeerListeners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerPeerListeners:");
}

id objc_msgSend_registerRequestHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerRequestHandler");
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerRequestID:options:handler:");
}

id objc_msgSend_registeredPeers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registeredPeers");
}

id objc_msgSend_registeredPeersForFaultType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registeredPeersForFaultType:");
}

id objc_msgSend_registeredRoleForPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registeredRoleForPeer:");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_relativeURLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativeURLs");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remotePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remotePath");
}

id objc_msgSend_removeAllDeliveredNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllDeliveredNotifications");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAllPendingNotificationRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllPendingNotificationRequests");
}

id objc_msgSend_removeDeliveredNotificationsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDeliveredNotificationsWithIdentifiers:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeNotificationWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeNotificationWithUUID:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_reply(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reply");
}

id objc_msgSend_requestAuthorizationWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestAuthorizationWithOptions:completionHandler:");
}

id objc_msgSend_requestDiagnostics_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestDiagnostics:completionBlock:");
}

id objc_msgSend_requestFileFromPeerWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestFileFromPeerWithRequest:");
}

id objc_msgSend_requestHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestHandler");
}

id objc_msgSend_requestInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestInfo");
}

id objc_msgSend_requestPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestPayload");
}

id objc_msgSend_requestPayloadClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestPayloadClass");
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestType");
}

id objc_msgSend_requestWithIdentifier_content_trigger_destinations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithIdentifier:content:trigger:destinations:");
}

id objc_msgSend_requestWithItemID_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithItemID:configuration:");
}

id objc_msgSend_requestWithTestID_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithTestID:configuration:");
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resetNetworkServiceOrderForTeardown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetNetworkServiceOrderForTeardown");
}

id objc_msgSend_resetWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetWithCompletionHandler:");
}

id objc_msgSend_responseHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseHandler");
}

id objc_msgSend_responsePayloadClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responsePayloadClass");
}

id objc_msgSend_responseWithPayload_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseWithPayload:options:error:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_resumeMonitoringAfterDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeMonitoringAfterDelay:");
}

id objc_msgSend_retrieveConnectedPeripheralsWithServices_allowAll_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveConnectedPeripheralsWithServices:allowAll:");
}

id objc_msgSend_retrievePairedPeers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievePairedPeers");
}

id objc_msgSend_returnBufferToPool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "returnBufferToPool:");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_rotationInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rotationInterval");
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssi");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runDiagnosticsOnPeerWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runDiagnosticsOnPeerWithRequest:");
}

id objc_msgSend_runSnifferAtPeerWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runSnifferAtPeerWithRequest:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:error:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_launchHandler_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:launchHandler:reply:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_outputData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:outputData:error:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_outputData_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:outputData:reply:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_outputFilePath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:outputFilePath:error:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_outputFilePath_launchHandler_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:outputFilePath:launchHandler:reply:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:reply:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_didLaunch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_didLaunch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_outputFilePath_errorFilePath_redirectErrorToOutput_launchHandler_didLaunch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_outputFilePath_errorFilePath_redirectErrorToOutput_launchHandler_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:");
}

id objc_msgSend_runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:");
}

id objc_msgSend_rxRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rxRate");
}

id objc_msgSend_scanCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanCache:");
}

id objc_msgSend_scanRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanRecord");
}

id objc_msgSend_scheduleRepeatingTask_interval_repeatingTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleRepeatingTask:interval:repeatingTask:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_security(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "security");
}

id objc_msgSend_securityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "securityType");
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToEndOfFile");
}

id objc_msgSend_seekToFileOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToFileOffset:");
}

id objc_msgSend_selfPublicKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selfPublicKey");
}

id objc_msgSend_semaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "semaphore");
}

id objc_msgSend_sendDebugConfigurationForPeerWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDebugConfigurationForPeerWithRequest:");
}

id objc_msgSend_sendMessageToDevice_request_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessageToDevice:request:");
}

id objc_msgSend_sendRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRequest:");
}

id objc_msgSend_sendRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRequestID:request:options:responseHandler:");
}

id objc_msgSend_serviceRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceRef");
}

id objc_msgSend_serviceTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceTypes");
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setActiveBFD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveBFD:");
}

id objc_msgSend_setActiveFileHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveFileHandle:");
}

id objc_msgSend_setActivePCap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivePCap:");
}

id objc_msgSend_setActivityLabels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivityLabels:");
}

id objc_msgSend_setAddedAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddedAt:");
}

id objc_msgSend_setAdditionalLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditionalLog:");
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddress:");
}

id objc_msgSend_setAirDropDiscoverableMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAirDropDiscoverableMode:");
}

id objc_msgSend_setAirPortBaseStationModelName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAirPortBaseStationModelName:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArguments:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setAvg_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAvg:");
}

id objc_msgSend_setAwdl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwdl:");
}

id objc_msgSend_setAwdlElectionParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwdlElectionParameters:");
}

id objc_msgSend_setAwdlMasterChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwdlMasterChannel:");
}

id objc_msgSend_setAwdlOpMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwdlOpMode:");
}

id objc_msgSend_setAwdlSecondaryMasterChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwdlSecondaryMasterChannel:");
}

id objc_msgSend_setAwdlSidecarDiagnostics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwdlSidecarDiagnostics:");
}

id objc_msgSend_setAwdlStrategy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwdlStrategy:");
}

id objc_msgSend_setAwdlSyncChannelSequence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwdlSyncChannelSequence:");
}

id objc_msgSend_setAwdlSyncEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwdlSyncEnabled:");
}

id objc_msgSend_setAwdlSyncParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwdlSyncParameters:");
}

id objc_msgSend_setAwdlSyncState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwdlSyncState:");
}

id objc_msgSend_setBatteryWarningLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatteryWarningLevel:");
}

id objc_msgSend_setBeaconInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBeaconInterval:");
}

id objc_msgSend_setBluetooth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetooth:");
}

id objc_msgSend_setBluetoothDebugLoggingEnabled_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothDebugLoggingEnabled:reply:");
}

id objc_msgSend_setBluetoothDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothDevice:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBssid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBssid:");
}

id objc_msgSend_setBuild_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBuild:");
}

id objc_msgSend_setCacheOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCacheOnly:");
}

id objc_msgSend_setCachedScanResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachedScanResults:");
}

id objc_msgSend_setCapabilities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCapabilities:");
}

id objc_msgSend_setCca_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCca:");
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannel:");
}

id objc_msgSend_setChannel_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannel:error:");
}

id objc_msgSend_setChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannels:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setCollectLogItemCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCollectLogItemCallback:");
}

id objc_msgSend_setCollectMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCollectMetadata:");
}

id objc_msgSend_setCollectedItemCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCollectedItemCallback:");
}

id objc_msgSend_setCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommand:");
}

id objc_msgSend_setCompletedAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletedAt:");
}

id objc_msgSend_setCompletedTestCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletedTestCallback:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setControlFlags:");
}

id objc_msgSend_setCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCount:");
}

id objc_msgSend_setCountryCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCountryCode:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDataLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataLength:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDebugConfiguration_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDebugConfiguration:reply:");
}

id objc_msgSend_setDefaultActionURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultActionURL:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestinationDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDestinationDevice:");
}

id objc_msgSend_setDeviceChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceChangedHandler:");
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceFoundHandler:");
}

id objc_msgSend_setDeviceLostHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceLostHandler:");
}

id objc_msgSend_setDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevices:");
}

id objc_msgSend_setDiagnosticsMode_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiagnosticsMode:reply:");
}

id objc_msgSend_setDiagnosticsModeManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiagnosticsModeManager:");
}

id objc_msgSend_setDiagnosticsModes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiagnosticsModes:");
}

id objc_msgSend_setDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDictionary:");
}

id objc_msgSend_setDidPass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidPass:");
}

id objc_msgSend_setDiscoveringDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveringDevices:");
}

id objc_msgSend_setDiscoveryClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryClient:");
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryFlags:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDnsAddresses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDnsAddresses:");
}

id objc_msgSend_setDomainName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDomainName:");
}

id objc_msgSend_setDownloadSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadSize:");
}

id objc_msgSend_setDroppedWiFiConnectionCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDroppedWiFiConnectionCallback:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEAPOLDebugLoggingEnabled_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEAPOLDebugLoggingEnabled:reply:");
}

id objc_msgSend_setEapolControlMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEapolControlMode:");
}

id objc_msgSend_setEapolSupplicantState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEapolSupplicantState:");
}

id objc_msgSend_setEnabledLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabledLevel:");
}

id objc_msgSend_setEndedAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndedAt:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setErrorStr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrorStr:");
}

id objc_msgSend_setEventHandler_eventID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandler:eventID:");
}

id objc_msgSend_setEventID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventID:");
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExpirationHandler:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFaultEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFaultEventHandler:");
}

id objc_msgSend_setFaultEventManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFaultEventManager:");
}

id objc_msgSend_setFetchRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchRequest:");
}

id objc_msgSend_setFetchedResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchedResults:");
}

id objc_msgSend_setFilePaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilePaths:");
}

id objc_msgSend_setFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilename:");
}

id objc_msgSend_setFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFiles:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setGid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGid:");
}

id objc_msgSend_setGuardInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGuardInterval:");
}

id objc_msgSend_setHTTPMaximumConnectionsPerHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPMaximumConnectionsPerHost:");
}

id objc_msgSend_setHardwareMACAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHardwareMACAddress:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIncludeEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludeEvents:");
}

id objc_msgSend_setIncludeHiddenNetworks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludeHiddenNetworks:");
}

id objc_msgSend_setIncludeProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludeProperties:");
}

id objc_msgSend_setInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInfo:");
}

id objc_msgSend_setInterfaceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterfaceName:");
}

id objc_msgSend_setInterfaceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterfaceType:");
}

id objc_msgSend_setInternalBatteryLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInternalBatteryLevel:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInterruptionLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionLevel:");
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterval:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIpv4Addresses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIpv4Addresses:");
}

id objc_msgSend_setIpv4ConfigMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIpv4ConfigMethod:");
}

id objc_msgSend_setIpv4RouterAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIpv4RouterAddress:");
}

id objc_msgSend_setIpv6Addresses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIpv6Addresses:");
}

id objc_msgSend_setIpv6ConfigMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIpv6ConfigMethod:");
}

id objc_msgSend_setIpv6RouterAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIpv6RouterAddress:");
}

id objc_msgSend_setIsAWDLRealTimeMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAWDLRealTimeMode:");
}

id objc_msgSend_setIsAppleDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAppleDevice:");
}

id objc_msgSend_setIsAppleReachable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAppleReachable:");
}

id objc_msgSend_setIsAppleSWAP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAppleSWAP:");
}

id objc_msgSend_setIsCaptive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsCaptive:");
}

id objc_msgSend_setIsCloudPaired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsCloudPaired:");
}

id objc_msgSend_setIsConnectable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsConnectable:");
}

id objc_msgSend_setIsConnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsConnected:");
}

id objc_msgSend_setIsDiscoverable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDiscoverable:");
}

id objc_msgSend_setIsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsEnabled:");
}

id objc_msgSend_setIsHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsHidden:");
}

id objc_msgSend_setIsIBSS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsIBSS:");
}

id objc_msgSend_setIsLowEnergy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLowEnergy:");
}

id objc_msgSend_setIsPaired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPaired:");
}

id objc_msgSend_setIsPasspoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPasspoint:");
}

id objc_msgSend_setIsPersonalHotspot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPersonalHotspot:");
}

id objc_msgSend_setIsScanning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsScanning:");
}

id objc_msgSend_setIsSnifferSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsSnifferSupported:");
}

id objc_msgSend_setItemRequests_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemRequests:");
}

id objc_msgSend_setItemURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemURL:");
}

id objc_msgSend_setLastHrFaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastHrFaults:");
}

id objc_msgSend_setLastHrLinkTests_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastHrLinkTests:");
}

id objc_msgSend_setLastHrRecoveries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastHrRecoveries:");
}

id objc_msgSend_setLastJoinedPreferredNetwork_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastJoinedPreferredNetwork:");
}

id objc_msgSend_setLastJoinedScanResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastJoinedScanResult:");
}

id objc_msgSend_setLastJoinedTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastJoinedTimestamp:");
}

id objc_msgSend_setLaunchPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchPath:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLinkQualityUpdates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLinkQualityUpdates:");
}

id objc_msgSend_setLocalDeviceUpdatedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalDeviceUpdatedHandler:");
}

id objc_msgSend_setLocalPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalPeer:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLogRedactionDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogRedactionDisabled:");
}

id objc_msgSend_setLowBatteryCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLowBatteryCallback:");
}

id objc_msgSend_setMacAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMacAddress:");
}

id objc_msgSend_setMajorClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMajorClass:");
}

id objc_msgSend_setMax_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMax:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMaxFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxFiles:");
}

id objc_msgSend_setMaxSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxSize:");
}

id objc_msgSend_setMcsIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcsIndex:");
}

id objc_msgSend_setMergeScanResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMergeScanResults:");
}

id objc_msgSend_setMin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMin:");
}

id objc_msgSend_setMinDurationBetweenInstances_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinDurationBetweenInstances:");
}

id objc_msgSend_setMinorClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinorClass:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModel:");
}

id objc_msgSend_setMonitorMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonitorMode:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNetwork_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNetwork:");
}

id objc_msgSend_setNetworkServiceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNetworkServiceID:");
}

id objc_msgSend_setNoAutoStop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNoAutoStop:");
}

id objc_msgSend_setNoise_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNoise:");
}

id objc_msgSend_setNumberOfReports_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfReports:");
}

id objc_msgSend_setNumberOfSpacialStreams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfSpacialStreams:");
}

id objc_msgSend_setOSLogPreferenceLevel_enableOvserizeMessages_subsystem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOSLogPreferenceLevel:enableOvserizeMessages:subsystem:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpMode:");
}

id objc_msgSend_setOperationErrors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOperationErrors:");
}

id objc_msgSend_setOs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOs:");
}

id objc_msgSend_setOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutput:");
}

id objc_msgSend_setOutputFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputFile:");
}

id objc_msgSend_setPacketLoss_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPacketLoss:");
}

id objc_msgSend_setPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeer:");
}

id objc_msgSend_setPeerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerID:");
}

id objc_msgSend_setPeerPublicKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerPublicKey:");
}

id objc_msgSend_setPeerStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerStatus:");
}

id objc_msgSend_setPeripheral_centralManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeripheral:centralManager:");
}

id objc_msgSend_setPersistedLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistedLevel:");
}

id objc_msgSend_setPersistentDomain_forName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistentDomain:forName:");
}

id objc_msgSend_setPhyMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhyMode:");
}

id objc_msgSend_setPingCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPingCallback:");
}

id objc_msgSend_setPlaceLabels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaceLabels:");
}

id objc_msgSend_setPower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPower:");
}

id objc_msgSend_setPowerOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerOn:");
}

id objc_msgSend_setPowerSourceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerSourceType:");
}

id objc_msgSend_setPowerStateCaps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerStateCaps:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPrimaryDNSAddresses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryDNSAddresses:");
}

id objc_msgSend_setPrimaryIPv4Addresses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryIPv4Addresses:");
}

id objc_msgSend_setPrimaryIPv4InterfaceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryIPv4InterfaceName:");
}

id objc_msgSend_setPrimaryIPv4Router_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryIPv4Router:");
}

id objc_msgSend_setPrimaryIPv4ServiceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryIPv4ServiceID:");
}

id objc_msgSend_setPrimaryIPv4ServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryIPv4ServiceName:");
}

id objc_msgSend_setPrimaryIPv6Addresses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryIPv6Addresses:");
}

id objc_msgSend_setPrimaryIPv6InterfaceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryIPv6InterfaceName:");
}

id objc_msgSend_setPrimaryIPv6ServiceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryIPv6ServiceID:");
}

id objc_msgSend_setPrimaryIPv6ServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryIPv6ServiceName:");
}

id objc_msgSend_setProgressHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressHandler:");
}

id objc_msgSend_setPublicKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPublicKey:");
}

id objc_msgSend_setRapportClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRapportClient:");
}

id objc_msgSend_setReceivedItemHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReceivedItemHandler:");
}

id objc_msgSend_setRelativeURLs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelativeURLs:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemotePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemotePath:");
}

id objc_msgSend_setReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReply:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRequestCachePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestCachePolicy:");
}

id objc_msgSend_setRequestHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestHandler:");
}

id objc_msgSend_setRequestInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestInfo:");
}

id objc_msgSend_setRequestType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestType:");
}

id objc_msgSend_setRequiresExternalPower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiresExternalPower:");
}

id objc_msgSend_setRequiresNetworkConnectivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiresNetworkConnectivity:");
}

id objc_msgSend_setResponseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponseHandler:");
}

id objc_msgSend_setResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResult:");
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultType:");
}

id objc_msgSend_setResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResults:");
}

id objc_msgSend_setRotationInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRotationInterval:");
}

id objc_msgSend_setRssi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRssi:");
}

id objc_msgSend_setSTBCEnabled_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSTBCEnabled:reply:");
}

id objc_msgSend_setScanFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanFlags:");
}

id objc_msgSend_setScanRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanRecord:");
}

id objc_msgSend_setSecurity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecurity:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setSharedInstanceQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSharedInstanceQueue:");
}

id objc_msgSend_setShouldIgnoreDoNotDisturb_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldIgnoreDoNotDisturb:");
}

id objc_msgSend_setShouldIgnoreDowntime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldIgnoreDowntime:");
}

id objc_msgSend_setShouldSuppressDefaultAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldSuppressDefaultAction:");
}

id objc_msgSend_setShouldWakeDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldWakeDevice:");
}

id objc_msgSend_setSmartCCADesenseSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSmartCCADesenseSupported:");
}

id objc_msgSend_setSmartCCADesenseUSBPresence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSmartCCADesenseUSBPresence:");
}

id objc_msgSend_setSnaplen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSnaplen:");
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSound:");
}

id objc_msgSend_setSsid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSsid:");
}

id objc_msgSend_setSsidString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSsidString:");
}

id objc_msgSend_setStandardError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStandardError:");
}

id objc_msgSend_setStandardInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStandardInput:");
}

id objc_msgSend_setStandardOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStandardOutput:");
}

id objc_msgSend_setStartedAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartedAt:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatus:");
}

id objc_msgSend_setStddev_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStddev:");
}

id objc_msgSend_setStopNotificationUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStopNotificationUUID:");
}

id objc_msgSend_setSubmitMetric_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubmitMetric:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setSupportedChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedChannels:");
}

id objc_msgSend_setSupportedPHYModes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedPHYModes:");
}

id objc_msgSend_setSupportedSecurityTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedSecurityTypes:");
}

id objc_msgSend_setSupportsTKIPCipher_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsTKIPCipher:");
}

id objc_msgSend_setSupportsWEPCipher_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsWEPCipher:");
}

id objc_msgSend_setTargetID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetID:");
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskCompleted");
}

id objc_msgSend_setTaskExpiredWithRetryAfter_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskExpiredWithRetryAfter:error:");
}

id objc_msgSend_setTcpDump_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTcpDump:");
}

id objc_msgSend_setTemporaryDirectoryURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTemporaryDirectoryURL:");
}

id objc_msgSend_setTestCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestCompleted:");
}

id objc_msgSend_setTestID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestID:");
}

id objc_msgSend_setTestRequests_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestRequests:");
}

id objc_msgSend_setTestStarted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestStarted:");
}

id objc_msgSend_setTests_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTests:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeout:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTrafficClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrafficClass:");
}

id objc_msgSend_setTxRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTxRate:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUid:");
}

id objc_msgSend_setUpdatedAWDLStatusCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedAWDLStatusCallback:");
}

id objc_msgSend_setUpdatedBluetoothCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedBluetoothCallback:");
}

id objc_msgSend_setUpdatedBluetoothStatusCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedBluetoothStatusCallback:");
}

id objc_msgSend_setUpdatedFaultsCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedFaultsCallback:");
}

id objc_msgSend_setUpdatedLinkTestsCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedLinkTestsCallback:");
}

id objc_msgSend_setUpdatedNetworkStatusCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedNetworkStatusCallback:");
}

id objc_msgSend_setUpdatedPowerManagementCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedPowerManagementCallback:");
}

id objc_msgSend_setUpdatedPowerSourceCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedPowerSourceCallback:");
}

id objc_msgSend_setUpdatedPowerStatusCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedPowerStatusCallback:");
}

id objc_msgSend_setUpdatedRecoveriesCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedRecoveriesCallback:");
}

id objc_msgSend_setUpdatedWiFiCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedWiFiCallback:");
}

id objc_msgSend_setUpdatedWiFiStatusCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdatedWiFiStatusCallback:");
}

id objc_msgSend_setUploadSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUploadSize:");
}

id objc_msgSend_setUsageData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsageData:");
}

id objc_msgSend_setUserAutoJoinDisabled_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserAutoJoinDisabled:error:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setWait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWait:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsNotificationResponsesDelivered");
}

id objc_msgSend_setWantsUpdates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsUpdates:");
}

id objc_msgSend_setWiFiDebugLoggingEnabled_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWiFiDebugLoggingEnabled:reply:");
}

id objc_msgSend_setWifi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWifi:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedActivityManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedActivityManager");
}

id objc_msgSend_sharedAnalyticsProcessor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAnalyticsProcessor");
}

id objc_msgSend_sharedClientWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedClientWithIdentifier:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedDeviceAnalyticsClientWithPersist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDeviceAnalyticsClientWithPersist");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedObject");
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPairingAgent");
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedScheduler");
}

id objc_msgSend_sharedStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedStore");
}

id objc_msgSend_sharedW5BufferPool(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedW5BufferPool");
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutdown");
}

id objc_msgSend_smartCCADesenseSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "smartCCADesenseSupported");
}

id objc_msgSend_smartCCADesenseUSBPresence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "smartCCADesenseUSBPresence");
}

id objc_msgSend_snaplen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snaplen");
}

id objc_msgSend_snifferDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snifferDescription");
}

id objc_msgSend_snifferManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snifferManager");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_comparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:comparator:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:selector:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "speed");
}

id objc_msgSend_ssid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ssid");
}

id objc_msgSend_ssidString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ssidString");
}

id objc_msgSend_standardDeviationRoundtripTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardDeviationRoundtripTime");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startBrowsing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startBrowsing");
}

id objc_msgSend_startDiagnosticsModeWithConfiguration_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDiagnosticsModeWithConfiguration:reply:");
}

id objc_msgSend_startDiscoveringDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDiscoveringDevices");
}

id objc_msgSend_startDownloadWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDownloadWithCompletion:");
}

id objc_msgSend_startEventMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startEventMonitoring");
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoring");
}

id objc_msgSend_startMonitoringEvent_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringEvent:error:");
}

id objc_msgSend_startMonitoringFaultEventsForPeer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringFaultEventsForPeer:reply:");
}

id objc_msgSend_startPeerDiscoveryWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPeerDiscoveryWithRequest:");
}

id objc_msgSend_startPeriodicUsageMonitor_maxEntries_uuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPeriodicUsageMonitor:maxEntries:uuid:");
}

id objc_msgSend_startSniffingWithRequest_interfaceName_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSniffingWithRequest:interfaceName:reply:");
}

id objc_msgSend_startUploadWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUploadWithCompletion:");
}

id objc_msgSend_startW5FileReceiverWithPeerPublicKey_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startW5FileReceiverWithPeerPublicKey:reply:");
}

id objc_msgSend_startW5FileSenderForFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startW5FileSenderForFile:");
}

id objc_msgSend_startWithTimeout_queue_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithTimeout:queue:completionHandler:");
}

id objc_msgSend_startedAt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedAt");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusFlags");
}

id objc_msgSend_statusManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusManager");
}

id objc_msgSend_stbc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stbc");
}

id objc_msgSend_stddev(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stddev");
}

id objc_msgSend_stopAllRepeatingTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAllRepeatingTasks");
}

id objc_msgSend_stopBrowsing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopBrowsing");
}

id objc_msgSend_stopDiagnosticsModeWithUUID_info_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopDiagnosticsModeWithUUID:info:reply:");
}

id objc_msgSend_stopDiscoveryingDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopDiscoveryingDevices");
}

id objc_msgSend_stopEventMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopEventMonitoring");
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoring");
}

id objc_msgSend_stopMonitoringAllEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringAllEvents");
}

id objc_msgSend_stopMonitoringFaultEventsForPeer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringFaultEventsForPeer:reply:");
}

id objc_msgSend_stopNotificationUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopNotificationUUID");
}

id objc_msgSend_stopPeerDiscoveryWithRequestUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopPeerDiscoveryWithRequestUUID:");
}

id objc_msgSend_stopPeriodicUsageMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopPeriodicUsageMonitor:");
}

id objc_msgSend_stopSnifferWithUUID_interface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSnifferWithUUID:interface:");
}

id objc_msgSend_stopSniffingActiveRequestWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSniffingActiveRequestWithError:");
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "store");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongestSupportedSecurity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strongestSupportedSecurity");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_submitFaultEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitFaultEvent:");
}

id objc_msgSend_submitTaskRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitTaskRequest:error:");
}

id objc_msgSend_subpathsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subpathsOfDirectoryAtPath:error:");
}

id objc_msgSend_subreason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subreason");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_supportedChannels(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedChannels");
}

id objc_msgSend_supportedChannelsWithCountryCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedChannelsWithCountryCode:");
}

id objc_msgSend_supportedPHYModes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedPHYModes");
}

id objc_msgSend_supportedSecurityTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedSecurityTypes");
}

id objc_msgSend_supportsPHYMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsPHYMode:");
}

id objc_msgSend_supportsSecurity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSecurity:");
}

id objc_msgSend_supportsTKIPCipher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsTKIPCipher");
}

id objc_msgSend_supportsWEPCipher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsWEPCipher");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_sysdiagnoseWithMetadata_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sysdiagnoseWithMetadata:withError:");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_targetID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetID");
}

id objc_msgSend_taskRequestForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskRequestForIdentifier:");
}

id objc_msgSend_tcpDump(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tcpDump");
}

id objc_msgSend_teardownAndNotify_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teardownAndNotify:");
}

id objc_msgSend_terminateAndNotify_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateAndNotify:");
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminationStatus");
}

id objc_msgSend_testCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCompleted");
}

id objc_msgSend_testID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testID");
}

id objc_msgSend_testRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testRequests");
}

id objc_msgSend_testStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testStarted");
}

id objc_msgSend_tests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tests");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimer");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_timestampFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestampFor:");
}

id objc_msgSend_txChainPower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "txChainPower");
}

id objc_msgSend_txRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "txRate");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uid");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unregisterDiagnosticModePeer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterDiagnosticModePeer:error:");
}

id objc_msgSend_unregisterPeer_role_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterPeer:role:error:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateDiagnosticsMode_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDiagnosticsMode:reply:");
}

id objc_msgSend_updateStoreWithDiagnosticsMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStoreWithDiagnosticsMode:");
}

id objc_msgSend_updateStoreWithInfo_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStoreWithInfo:info:");
}

id objc_msgSend_updatedAt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatedAt");
}

id objc_msgSend_updatedWiFiCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatedWiFiCallback");
}

id objc_msgSend_usageData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageData");
}

id objc_msgSend_usageToDateWithOptionsFor_nameKind_options_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageToDateWithOptionsFor:nameKind:options:reply:");
}

id objc_msgSend_userAutoJoinDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAutoJoinDisabled");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_utf8ValueSafe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utf8ValueSafe");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_virtualInterfaceNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "virtualInterfaceNames");
}

id objc_msgSend_waDeviceAnalyticsClientExists(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waDeviceAnalyticsClientExists");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "width");
}

id objc_msgSend_wifi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifi");
}

id objc_msgSend_wifiStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiStatus");
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:");
}

id objc_msgSend_writeProcNetUsage_ToFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeProcNetUsage:ToFile:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_xpcConnection_cancelCollectLogsWithUUID_peerID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:cancelCollectLogsWithUUID:peerID:reply:");
}

id objc_msgSend_xpcConnection_cancelDiagnosticsWithUUID_peerID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:cancelDiagnosticsWithUUID:peerID:reply:");
}

id objc_msgSend_xpcConnection_cancelWiFiPerformanceLoggingWithUUID_peerID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:cancelWiFiPerformanceLoggingWithUUID:peerID:reply:");
}

id objc_msgSend_xpcConnection_cancelWiFiSnifferWithUUID_peer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:cancelWiFiSnifferWithUUID:peer:reply:");
}

id objc_msgSend_xpcConnection_cancelWiFiSnifferWithUUID_peerID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:cancelWiFiSnifferWithUUID:peerID:reply:");
}

id objc_msgSend_xpcConnection_collectLogs_configuration_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:collectLogs:configuration:uuid:reply:");
}

id objc_msgSend_xpcConnection_collectLogsDiagnosticMode_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:collectLogsDiagnosticMode:uuid:reply:");
}

id objc_msgSend_xpcConnection_listFilesFromPeer_remoteDirPath_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:listFilesFromPeer:remoteDirPath:reply:");
}

id objc_msgSend_xpcConnection_queryDatabaseForPeer_fetch_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:queryDatabaseForPeer:fetch:reply:");
}

id objc_msgSend_xpcConnection_queryDebugConfigurationForPeer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:queryDebugConfigurationForPeer:reply:");
}

id objc_msgSend_xpcConnection_queryDiagnosticsModeForPeer_info_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:queryDiagnosticsModeForPeer:info:reply:");
}

id objc_msgSend_xpcConnection_queryFaultEventCacheForPeer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:queryFaultEventCacheForPeer:reply:");
}

id objc_msgSend_xpcConnection_queryLocalPeerAndReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:queryLocalPeerAndReply:");
}

id objc_msgSend_xpcConnection_queryRegisteredDiagnosticsPeersWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:queryRegisteredDiagnosticsPeersWithReply:");
}

id objc_msgSend_xpcConnection_queryStatusForPeer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:queryStatusForPeer:reply:");
}

id objc_msgSend_xpcConnection_registerRemoteDiagnosticEventsForPeer_configuration_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:registerRemoteDiagnosticEventsForPeer:configuration:reply:");
}

id objc_msgSend_xpcConnection_requestFileFromPeer_remoteFilePath_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:requestFileFromPeer:remoteFilePath:reply:");
}

id objc_msgSend_xpcConnection_runDiagnostics_configuration_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:runDiagnostics:configuration:uuid:reply:");
}

id objc_msgSend_xpcConnection_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:");
}

id objc_msgSend_xpcConnection_runWiFiPerformanceLoggingWithConfiguration_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:runWiFiPerformanceLoggingWithConfiguration:uuid:reply:");
}

id objc_msgSend_xpcConnection_runWiFiSnifferOnChannels_duration_peer_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:runWiFiSnifferOnChannels:duration:peer:uuid:reply:");
}

id objc_msgSend_xpcConnection_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:");
}

id objc_msgSend_xpcConnection_setDebugConfiguration_peer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:setDebugConfiguration:peer:reply:");
}

id objc_msgSend_xpcConnection_startDiagnosticsModeWithConfiguration_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:startDiagnosticsModeWithConfiguration:reply:");
}

id objc_msgSend_xpcConnection_startMonitoringEvents_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:startMonitoringEvents:reply:");
}

id objc_msgSend_xpcConnection_startMonitoringFaultEventsForPeer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:startMonitoringFaultEventsForPeer:reply:");
}

id objc_msgSend_xpcConnection_startPeerDiscoveryWithConfiguration_uuid_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:startPeerDiscoveryWithConfiguration:uuid:reply:");
}

id objc_msgSend_xpcConnection_stopDiagnosticsModeWithUUID_info_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:stopDiagnosticsModeWithUUID:info:reply:");
}

id objc_msgSend_xpcConnection_stopMonitoringEvents_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:stopMonitoringEvents:reply:");
}

id objc_msgSend_xpcConnection_stopMonitoringFaultEventsForPeer_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:stopMonitoringFaultEventsForPeer:reply:");
}

id objc_msgSend_xpcConnection_stopPeerDiscoveryWithUUID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:stopPeerDiscoveryWithUUID:reply:");
}

id objc_msgSend_xpcConnection_submitFaultEvent_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:submitFaultEvent:reply:");
}

id objc_msgSend_xpcConnection_unregisterRemoteDiagnosticEventsForPeer_configuration_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection:unregisterRemoteDiagnosticEventsForPeer:configuration:reply:");
}
