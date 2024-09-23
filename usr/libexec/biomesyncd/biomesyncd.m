void sub_100005F7C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_100005FC0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_companionLinkClientInvalidated");

}

void sub_100005FEC(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_companionLinkClientDiscoveredDevice:", v3);

}

void sub_100006034(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_companionLinkClientLostDevice:", v3);

}

void sub_10000607C(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_companionLinkClientActivatedWithError:", v3);

}

uint64_t sub_100006C30(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_100006C44(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_100006C58(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

void sub_100006D04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

BOOL sub_100008428(uint64_t a1, uint64_t a2)
{
  return a2 == 0x7FFFFFFFFFFFFFFELL - a1;
}

NSIndexSet *sub_10000843C(uint64_t a1)
{
  return +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a1, 0x7FFFFFFFFFFFFFFELL - a1);
}

const __CFString *sub_100008ED8(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_100068B18[a1 - 1];
}

void sub_100009380(id a1, NSDictionary *a2)
{
  +[BMCoreAnalyticsEvents sendSyncSessionLog:](BMCoreAnalyticsEvents, "sendSyncSessionLog:", a2);
}

void sub_1000093D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000097E8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000AFA0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "requestTimeoutDidFire");

}

id sub_10000B55C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerRequests");
}

id sub_10000B5E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startServerWithCompletion:", *(_QWORD *)(a1 + 40));
}

id sub_10000B6FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchAtomBatchesIsReciprocal:reason:activity:completionHandler:", 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_10000B7E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchAtomBatchesFromDevices:isReciprocal:reason:activity:completionHandler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void sub_10000BC64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  NSErrorUserInfoKey v36;
  void *v37;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v8 = objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = (NSMutableDictionary *)v8;
  else
    v10 = objc_opt_new(NSMutableDictionary);
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  v13 = objc_msgSend(v12, "isEqual:", CFSTR("BMRapportErrorDomain"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));
    if (v14)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, NSLocalizedDescriptionKey);
    }
    else
    {
      v36 = NSLocalizedDescriptionKey;
      v15 = BMRapportErrorToString((unint64_t)objc_msgSend(v6, "code"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v37 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v17, NSLocalizedDescriptionKey);

    }
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v30 = a1;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deliveredToDevices"));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "rapportIdentifier"));
        v25 = objc_msgSend(v24, "isEqual:", v5);

        if (v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v26, CFSTR("Device"));

          goto LABEL_19;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v20)
        continue;
      break;
    }
  }
LABEL_19:

  v27 = *(void **)(v30 + 40);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v28, objc_msgSend(v6, "code"), v11));
  objc_msgSend(v27, "addObject:", v29);

}

void sub_10000C540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40)
{
  id *v40;

  objc_destroyWeak(v40);
  objc_destroyWeak(location);
  objc_destroyWeak(&a30);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a40);
  _Unwind_Resume(a1);
}

void sub_10000C59C(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (id *)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buildAtomBatchRequestWithIsReciprocal:syncReason:sequenceNumber:transportType:device:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), 0, 2, v3));
  if (v6)
  {
    +[BMSyncCore resetEagerExitTimer](BMSyncCore, "resetEagerExitTimer");
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[3], "objectForKey:", *(_QWORD *)(a1 + 40)));
    -[NSObject markAsInFlightToDevice:](v7, "markAsInFlightToDevice:", v3);
    v8 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v5, "siteSuffix"));
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: sending request to device: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(*v5, "sendFetchAtomBatchesRequest:toDevice:forRequest:", v6, v3, v7);
  }
  else
  {
    v11 = __biome_log_for_category(11);
    v7 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000416B8();
  }

}

void sub_10000C738(id *a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  v4 = __biome_log_for_category(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "siteSuffix"));
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: request timed out because no devices are nearby", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 9, 0));
  v9 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  objc_msgSend(WeakRetained, "completeRequest:deliveredToDevices:withErrors:", v3, &__NSArray0__struct, v8);

}

void sub_10000CC68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id a46)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a36);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a46);
  _Unwind_Resume(a1);
}

void sub_10000CCCC(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (id *)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buildAtomBatchRequestWithIsReciprocal:syncReason:sequenceNumber:transportType:device:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), 0, 2, v3));
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[3], "objectForKey:", *(_QWORD *)(a1 + 40)));
    -[NSObject markAsInFlightToDevice:](v7, "markAsInFlightToDevice:", v3);
    v8 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v5, "siteSuffix"));
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: sending request to device: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(*v5, "sendFetchAtomBatchesRequest:toDevice:forRequest:", v6, v3, v7);
  }
  else
  {
    v11 = __biome_log_for_category(11);
    v7 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000416B8();
  }

}

void sub_10000CE5C(id *a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  v4 = __biome_log_for_category(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "siteSuffix"));
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: request timed out because no devices are nearby", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 9, 0));
  v9 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  objc_msgSend(WeakRetained, "completeRequest:deliveredToDevices:withErrors:", v3, &__NSArray0__struct, v8);

}

void sub_10000D09C(_QWORD *a1, void *a2, void *a3, void *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = (void *)a1[7];
  v10 = a4;
  v11 = a3;
  v12 = a2;
  objc_msgSend(v6, "handleFetchAtomBatchesResponse:options:error:fromDevice:forRequest:isReciprocal:", v12, v11, v10, v7, v8, objc_msgSend(v9, "isReciprocalRequest"));

}

void sub_10000D968(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  dispatch_queue_t *WeakRetained;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  __CFString *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  NSObject *v25;
  const __CFString **v26;
  NSErrorUserInfoKey *v27;
  uint64_t v28;
  NSObject *v29;
  const __CFString **v30;
  NSErrorUserInfoKey *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  id *v36;
  void *v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  BMAtomBatchChunker *v57;
  BMFetchAtomBatchesResponse *v58;
  void *v59;
  void *v60;
  BMAtomBatchChunker *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  const __CFString *v68;
  id v69;
  BMFetchAtomBatchesResponse *v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  void *v74;
  const __CFString *v75;
  BMFetchAtomBatchesResponse *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  BMFetchAtomBatchesResponse *v84;
  _BOOL4 v85;
  uint64_t v86;
  BMAtomBatchChunker *v87;
  unsigned int v88;
  unsigned __int8 v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  dispatch_queue_t *v94;
  __CFString *v95;
  _QWORD v96[5];
  NSErrorUserInfoKey v97;
  const __CFString *v98;
  NSErrorUserInfoKey v99;
  const __CFString *v100;
  NSErrorUserInfoKey v101;
  const __CFString *v102;
  NSErrorUserInfoKey v103;
  const __CFString *v104;
  NSErrorUserInfoKey v105;
  const __CFString *v106;
  NSErrorUserInfoKey v107;
  const __CFString *v108;
  uint8_t buf[4];
  uint64_t v110;
  __int16 v111;
  const __CFString *v112;
  __int16 v113;
  id v114;
  __int16 v115;
  id v116;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(WeakRetained[9]);
  +[BMSyncCore resetEagerExitTimer](BMSyncCore, "resetEagerExitTimer");
  v95 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", RPOptionSenderIDSDeviceID));
  v11 = __biome_log_for_category(11);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "siteSuffix"));
    v14 = v95;
    v15 = -[__CFString length](v95, "length");
    if ((unint64_t)v15 >= 9)
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v95, "substringToIndex:", 8));
    *(_DWORD *)buf = 138413058;
    v110 = (uint64_t)v13;
    v111 = 2112;
    v112 = v14;
    v113 = 2112;
    v114 = v7;
    v115 = 2112;
    v116 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: received request BMRapportDevice[%@] %@ %@", buf, 0x2Au);
    if ((unint64_t)v15 >= 9)

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("senderModelID")));
  if (v17 && (v18 = objc_opt_class(NSString, v16), (objc_opt_isKindOfClass(v17, v18) & 1) != 0))
  {
    v94 = WeakRetained;
    v19 = BMDevicePlatformFromModelString(v17);
    if (v19)
    {
      v20 = v19;
      v93 = v7;
      v21 = (unint64_t)+[BMDeviceMetadataUtils platform](BMDeviceMetadataUtils, "platform");
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", RPOptionStatusFlags));
      v23 = objc_msgSend(v22, "unsignedLongValue");

      if ((v20 & 0xFFFFFFFFFFFFFFFDLL) == 5 || (v21 & 0xFFFFFFFFFFFFFFFDLL) == 5)
      {
        if ((*(_QWORD *)&v23 & 0x82000) == 0)
        {
          v50 = __biome_log_for_category(11);
          v51 = objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            sub_1000418D0();

          v101 = NSLocalizedDescriptionKey;
          v102 = CFSTR("Outside home");
          v26 = &v102;
          v27 = &v101;
          goto LABEL_43;
        }
      }
      else if ((v23 & 0x80000) == 0)
      {
        v24 = __biome_log_for_category(11);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1000419CC();

        v103 = NSLocalizedDescriptionKey;
        v104 = CFSTR("Cross account");
        v26 = &v104;
        v27 = &v103;
LABEL_43:
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v27, 1));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 8, v32));
        (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v33);
        WeakRetained = v94;
        goto LABEL_20;
      }
      v37 = *(void **)(a1 + 32);
      v36 = (id *)(a1 + 32);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "accountFromRapportOptions:", v8));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v36, "createDistributedSyncManagerForAccount:", v32));
      if (!v33)
      {
        v46 = __biome_log_for_category(11);
        v47 = objc_claimAutoreleasedReturnValue(v46);
        WeakRetained = v94;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          sub_10004194C();

        v99 = NSLocalizedDescriptionKey;
        v100 = CFSTR("Failed to create sync manager");
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1));
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 0, v48));
        (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v49);
        goto LABEL_61;
      }
      v88 = objc_msgSend(*v36, "protocolVersion");
      v38 = -[BMPeerToPeerMessage initFromDictionary:]([BMPeerToPeerMessage alloc], "initFromDictionary:", v7);
      v91 = v38;
      if (+[BMDeviceMetadataUtils currentlyInGameMode](BMDeviceMetadataUtils, "currentlyInGameMode"))
      {
        v39 = __biome_log_for_category(11);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v36, "siteSuffix"));
          *(_DWORD *)buf = 138412290;
          v110 = (uint64_t)v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: device is currently in game mode, evaluating request reason to determine policy", buf, 0xCu);

        }
        if ((v40, v38 = v91, v20 == 6) && !objc_msgSend(v91, "syncReason")
          || objc_msgSend(v91, "syncReason") != (id)5 && objc_msgSend(v91, "syncReason") != (id)7)
        {
          v79 = __biome_log_for_category(11);
          v80 = objc_claimAutoreleasedReturnValue(v79);
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v36, "siteSuffix"));
            *(_DWORD *)buf = 138412290;
            v110 = (uint64_t)v81;
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: incoming request is not a user initiated force triggered sync, responding to request with temporarily unavailable", buf, 0xCu);

          }
          v97 = NSLocalizedDescriptionKey;
          v98 = CFSTR("Currently in Game Mode");
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1));
          v70 = (BMFetchAtomBatchesResponse *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 11, v49));
          (*((void (**)(id, _QWORD, _QWORD, BMFetchAtomBatchesResponse *))v9 + 2))(v9, 0, 0, v70);
          v7 = v93;
          WeakRetained = v94;
          v48 = v91;
          goto LABEL_60;
        }
      }
      v7 = v93;
      v92 = -[BMFetchAtomBatchesRequest initFromDictionary:]([BMFetchAtomBatchesRequest alloc], "initFromDictionary:", v93);
      if (objc_msgSend(v38, "protocolVersion") == (id)1)
      {
        v42 = __biome_log_for_category(11);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v36, "siteSuffix"));
          *(_DWORD *)buf = 138412290;
          v110 = (uint64_t)v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: replying with CKXUncompressedFormatVersion atom batch", buf, 0xCu);

        }
        v86 = v88;
        v89 = 1;
        v45 = v92;
      }
      else
      {
        v52 = objc_msgSend(v38, "protocolVersion");
        v53 = v88;
        if (v52 != (id)v88)
        {
          v72 = __biome_log_for_category(11);
          v73 = objc_claimAutoreleasedReturnValue(v72);
          v49 = v92;
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v36, "siteSuffix"));
            v75 = (const __CFString *)objc_msgSend(v91, "protocolVersion");
            *(_DWORD *)buf = 138412802;
            v110 = (uint64_t)v74;
            v111 = 2048;
            v112 = v75;
            v113 = 1024;
            LODWORD(v114) = v88;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: mismatched protocol version %lu, expected %d", buf, 0x1Cu);

            v53 = v88;
          }

          v76 = objc_opt_new(BMFetchAtomBatchesResponse);
          -[BMPeerToPeerMessage setProtocolVersion:](v76, "setProtocolVersion:", v53);
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "peerStatusTracker"));
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "localDeviceUpdatingIfNeccesaryWithProtocolVersion:", objc_msgSend(*v36, "protocolVersion")));
          -[BMPeerToPeerMessage setPeer:](v76, "setPeer:", v78);

          v70 = v76;
          -[BMPeerToPeerMessage setWalltime:](v76, "setWalltime:", CFAbsoluteTimeGetCurrent());
          -[BMPeerToPeerMessage setSyncReason:](v76, "setSyncReason:", objc_msgSend(v92, "syncReason"));
          v71 = (void *)objc_claimAutoreleasedReturnValue(-[BMFetchAtomBatchesResponse dictionaryRepresentation](v76, "dictionaryRepresentation"));
          v87 = (BMAtomBatchChunker *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 7, 0));
          (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v71, 0);
          v48 = v91;
          goto LABEL_59;
        }
        v45 = v92;
        v86 = v88;
        v89 = objc_msgSend(v92, "atomBatchVersion");
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "vectorClock"));
      v55 = objc_claimAutoreleasedReturnValue(+[BMMultiStreamVectorClockConverter multiStreamVectorClockToTimestampVectorClock:](BMMultiStreamVectorClockConverter, "multiStreamVectorClockToTimestampVectorClock:", v54));

      v84 = (BMFetchAtomBatchesResponse *)v55;
      v56 = objc_claimAutoreleasedReturnValue(+[BMMultiStreamVectorClockConverter multiStreamRangeClockVectorFromIndexClockVectors:](BMMultiStreamVectorClockConverter, "multiStreamRangeClockVectorFromIndexClockVectors:", v55));
      v57 = -[BMAtomBatchChunker initWithChunkerPolicy:]([BMAtomBatchChunker alloc], "initWithChunkerPolicy:", v94[5]);
      v83 = (void *)v56;
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "atomBatchesInClockVector:targetPlatform:transportType:direction:ckFormatVersion:chunker:", v56, v20, 2, 2, v89, v57));
      v58 = objc_opt_new(BMFetchAtomBatchesResponse);
      -[BMPeerToPeerMessage setProtocolVersion:](v58, "setProtocolVersion:", v86);
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "peerStatusTracker"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localDeviceUpdatingIfNeccesaryWithProtocolVersion:", objc_msgSend(*v36, "protocolVersion")));
      -[BMPeerToPeerMessage setPeer:](v58, "setPeer:", v60);

      -[BMPeerToPeerMessage setWalltime:](v58, "setWalltime:", CFAbsoluteTimeGetCurrent());
      -[BMPeerToPeerMessage setSyncReason:](v58, "setSyncReason:", objc_msgSend(v92, "syncReason"));
      -[BMFetchAtomBatchesResponse setUnseenPeers:](v58, "setUnseenPeers:", &__NSArray0__struct);
      -[BMFetchAtomBatchesResponse setAtomBatches:](v58, "setAtomBatches:", v90);
      v87 = v57;
      v61 = v57;
      v49 = v92;
      -[BMFetchAtomBatchesResponse setMoreComing:](v58, "setMoreComing:", -[BMAtomBatchChunker moreComing](v61, "moreComing"));
      -[BMFetchAtomBatchesResponse setBatchSequenceNumber:](v58, "setBatchSequenceNumber:", objc_msgSend(v92, "batchSequenceNumber"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "deletedLocationsForTransportType:", 2));
      -[BMFetchAtomBatchesResponse setDeletedLocations:](v58, "setDeletedLocations:", v62);

      v63 = objc_claimAutoreleasedReturnValue(-[BMFetchAtomBatchesResponse dictionaryRepresentation](v58, "dictionaryRepresentation"));
      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v9 + 2))(v9, v63, 0, 0);
      v82 = (void *)v63;
      v85 = (objc_msgSend(v92, "isReciprocalRequest") & 1) == 0
         && objc_msgSend(v92, "batchSequenceNumber", v63) == 0;
      v64 = __biome_log_for_category(11);
      v65 = objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(*v36, "siteSuffix"));
        v67 = (void *)v66;
        v68 = CFSTR("NO");
        if (v85)
          v68 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v110 = v66;
        v111 = 2112;
        v112 = v68;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: should issue reciprocal request, %@", buf, 0x16u);

      }
      v7 = v93;
      if (v85)
      {
        v69 = *v36;
        v96[0] = _NSConcreteStackBlock;
        v96[1] = 3221225472;
        v96[2] = sub_10000E620;
        v96[3] = &unk_100068C78;
        v96[4] = v69;
        objc_msgSend(v69, "fetchAtomBatchesIsReciprocal:reason:activity:completionHandler:", 1, 6, 0, v96);
      }

      v48 = v91;
      v71 = v83;
      v70 = v84;
LABEL_59:

      WeakRetained = v94;
LABEL_60:

LABEL_61:
      goto LABEL_20;
    }
    v34 = __biome_log_for_category(11);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_100041854();

    v105 = NSLocalizedDescriptionKey;
    v106 = CFSTR("Unknown platform");
    v30 = &v106;
    v31 = &v105;
  }
  else
  {
    v28 = __biome_log_for_category(11);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_1000417D8();

    v107 = NSLocalizedDescriptionKey;
    v108 = CFSTR("Unable to determine sender model info");
    v30 = &v108;
    v31 = &v107;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v31, 1));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 8, v32));
  (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v33);
LABEL_20:

}

void sub_10000E620(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = __biome_log_for_category(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "siteSuffix"));
    v11 = 138412802;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: fetch completion handler is reciprocal, YES, deviceIdentifiers, %@, errors, %@", (uint8_t *)&v11, 0x20u);

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

void sub_10000F2F4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_10000F354(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void sub_10000F3D4(id a1)
{
  dispatch_queue_global_t global_queue;
  dispatch_source_t v2;
  void *v3;
  NSObject *v4;

  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
  v3 = (void *)qword_10007BDE0;
  qword_10007BDE0 = (uint64_t)v2;

  dispatch_source_set_timer((dispatch_source_t)qword_10007BDE0, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_event_handler((dispatch_source_t)qword_10007BDE0, &stru_100068D00);
  dispatch_activate((dispatch_object_t)qword_10007BDE0);

}

BOOL sub_10000FA24(id a1, id a2)
{
  id v2;
  id v3;

  v2 = a2;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

  return v3 != v2;
}

void sub_1000105B8(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1000105E8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSErrorUserInfoKey v5;
  uint64_t v6;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") <= 1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
    if (!v2)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = *(_QWORD *)(a1 + 32);
  v5 = NSMultipleUnderlyingErrorsKey;
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 1, v4));

  if (v2)
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_100010A04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100010CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010CF8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleResponseUUID:response:options:error:handler:", *(_QWORD *)(a1 + 40), v7, v8, v9, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v12 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      if (v7)
        v15 = v7;
      else
        v15 = v9;
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BMRapportClient[%@]: Warning: ignoring response arriving after deallocation: %@", (uint8_t *)&v16, 0x16u);
    }

  }
}

void sub_100011B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011B40(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a4;
  return result;
}

void start()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;
  int v6;
  char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  BMSyncCore *v17;
  BMSyncServiceServer *v18;
  void *v19;
  NSObject *v20;
  BMSyncCore *v21;
  NSObject *v22;
  BMSyncCore *v23;
  dispatch_queue_attr_t v24;
  NSObject *v25;
  dispatch_queue_t v26;
  id v27;
  NSObject *v28;
  BMSyncCore *v29;
  BMSyncCore *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  void *v34;
  dispatch_source_t v35;
  void *v36;
  void **v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  id v41;
  NSObject *v42;
  BMSyncCore *v43;
  _QWORD v44[4];
  NSObject *v45;
  BMSyncCore *v46;
  _QWORD v47[4];
  NSObject *v48;
  BMSyncCore *v49;
  _QWORD handler[4];
  NSObject *v51;
  BMSyncCore *v52;
  uint64_t v53;
  uint8_t buf[8];
  uint8_t v55[4];
  uint64_t v56;

  v0 = objc_autoreleasePoolPush();
  bzero(v55, 0x400uLL);
  if ((_set_user_dir_suffix("com.apple.biomesyncd") & 1) != 0)
  {
    if (confstr(65537, (char *)v55, 0x400uLL))
    {
      v7 = realpath_DARWIN_EXTSN((const char *)v55, 0);
      if (v7)
      {
        free(v7);
        +[NSError _setFileNameLocalizationEnabled:](NSError, "_setFileNameLocalizationEnabled:", 0);
        *(_QWORD *)buf = 0;
        if (!vproc_swap_integer(0, 5, 0, buf) && *(_QWORD *)buf)
        {
          v10 = __biome_log_for_category(11);
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v55 = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "biomesyncd launched", v55, 2u);
          }

          v53 = 0;
          if (!vproc_swap_integer(0, 1, 0, &v53))
          {
            v12 = __biome_log_for_category(11);
            v13 = objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v55 = 134217984;
              v56 = v53;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "biomesyncd last exit status: %lld", v55, 0xCu);
            }

          }
          v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v15 = objc_claimAutoreleasedReturnValue(v14);
          v16 = dispatch_queue_create("com.apple.biomesyncd", v15);

          v17 = -[BMSyncCore initWithQueue:]([BMSyncCore alloc], "initWithQueue:", v16);
          v18 = -[BMSyncServiceServer initWithQueue:core:]([BMSyncServiceServer alloc], "initWithQueue:core:", v16, v17);
          v19 = (void *)qword_10007BDF0;
          qword_10007BDF0 = (uint64_t)v18;

          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_100012438;
          handler[3] = &unk_100068E30;
          v20 = v16;
          v51 = v20;
          v21 = v17;
          v52 = v21;
          xpc_activity_register("com.apple.biomesyncd.metrics-collection", XPC_ACTIVITY_CHECK_IN, handler);
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472;
          v47[2] = sub_100012668;
          v47[3] = &unk_100068E30;
          v22 = v20;
          v48 = v22;
          v23 = v21;
          v49 = v23;
          xpc_activity_register("com.apple.biomesyncd.database-maintenance", XPC_ACTIVITY_CHECK_IN, v47);
          sub_100012840("com.apple.biomesyncd.post-install-immediate-sync", 7, v22, v23);
          sub_100012840("com.apple.biomesyncd.periodic-sync", 1, v22, v23);
          v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          v26 = dispatch_queue_create("com.apple.biomesyncd.cascde", v25);

          v27 = objc_msgSend(objc_alloc((Class)CCRapportSyncEngine), "initWithQueue:", v26);
          sub_1000128F8(v27);
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_100012980;
          v44[3] = &unk_100068E30;
          v28 = v22;
          v45 = v28;
          v29 = v23;
          v46 = v29;
          xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, v44);
          v37 = _NSConcreteStackBlock;
          v38 = 3221225472;
          v39 = sub_100012C14;
          v40 = &unk_100068EA8;
          v41 = v27;
          v42 = v28;
          v43 = v29;
          v30 = v29;
          v31 = v28;
          v32 = v27;
          xpc_set_event_stream_handler("com.apple.rapport.matching", 0, &v37);
          v33 = objc_claimAutoreleasedReturnValue(+[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager", v37, v38, v39, v40));
          v34 = (void *)qword_10007BDF8;
          qword_10007BDF8 = v33;

          signal(15, (void (__cdecl *)(int))1);
          v35 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
          v36 = (void *)qword_10007BE00;
          qword_10007BE00 = (uint64_t)v35;

          dispatch_source_set_event_handler((dispatch_source_t)qword_10007BE00, &stru_100068EC8);
          dispatch_activate((dispatch_object_t)qword_10007BE00);

          objc_autoreleasePoolPop(v0);
          dispatch_main();
        }
LABEL_9:
        exit(1);
      }
      v8 = __biome_log_for_category(11);
      v2 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v9 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v9;
        v4 = "failed to resolve temporary directory: %{darwin.errno}d";
        goto LABEL_7;
      }
    }
    else
    {
      v1 = __biome_log_for_category(11);
      v2 = objc_claimAutoreleasedReturnValue(v1);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v3;
        v4 = "failed to initialize temporary directory: %{darwin.errno}d";
LABEL_7:
        _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, v4, buf, 8u);
      }
    }
  }
  else
  {
    v5 = __biome_log_for_category(11);
    v2 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v6 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v6;
      v4 = "failed to set user dir suffix: %{darwin.errno}d";
      goto LABEL_7;
    }
  }

  goto LABEL_9;
}

void sub_100012438(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  _xpc_activity_s *v19;
  uint8_t buf[16];

  v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    v4 = objc_autoreleasePoolPush();
    if (xpc_activity_should_defer(v3))
    {
      if (!xpc_activity_set_state(v3, 3))
      {
        v5 = __biome_log_for_category(11);
        v6 = objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_100041E28(v6, v7, v8, v9, v10, v11, v12, v13);

        xpc_activity_set_state(v3, 5);
      }
    }
    else
    {
      v14 = __biome_log_for_category(11);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "biome activity fired \"com.apple.biomesyncd.metrics-collection\"", buf, 2u);
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100012588;
      v17[3] = &unk_100068E08;
      v16 = *(NSObject **)(a1 + 32);
      v18 = *(id *)(a1 + 40);
      v19 = v3;
      dispatch_sync(v16, v17);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void sub_100012588(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(a1 + 32), "start");
  v4 = __biome_log_for_category(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "biome running activity \"com.apple.biomesyncd.metrics-collection\"", v7, 2u);
    }

    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "primaryDatabase"));
    -[NSObject runMetricsCollectionTask:](v5, "runMetricsCollectionTask:", *(_QWORD *)(a1 + 40));
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Database unavailable for activity \"com.apple.biomesyncd.metrics-collection\"", buf, 2u);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100012668(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    v4 = objc_autoreleasePoolPush();
    v5 = __biome_log_for_category(11);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "biome activity fired \"com.apple.biomesyncd.database-maintenance\"", buf, 2u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100012760;
    v8[3] = &unk_100068E08;
    v7 = *(NSObject **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = v3;
    dispatch_sync(v7, v8);

    objc_autoreleasePoolPop(v4);
  }

}

void sub_100012760(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(a1 + 32), "start");
  v4 = __biome_log_for_category(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "biome running activity \"com.apple.biomesyncd.database-maintenance\"", v7, 2u);
    }

    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "primaryDatabase"));
    -[NSObject runVacuumingTask:](v5, "runVacuumingTask:", *(_QWORD *)(a1 + 40));
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "database unavailable for activity \"com.apple.biomesyncd.database-maintenance\"", buf, 2u);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100012840(const char *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100012FF0;
  v9[3] = &unk_100068F18;
  v10 = a3;
  v11 = a4;
  v12 = a1;
  v13 = a2;
  v7 = v11;
  v8 = v10;
  xpc_activity_register(a1, XPC_ACTIVITY_CHECK_IN, v9);

}

void sub_1000128F8(void *a1)
{
  id v1;
  _QWORD handler[4];
  id v3;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100013300;
  handler[3] = &unk_100068F40;
  v3 = a1;
  v1 = v3;
  xpc_activity_register("com.apple.biomesyncd.cascade.periodic-sync", XPC_ACTIVITY_CHECK_IN, handler);

}

void sub_100012980(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *string;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  const char *v19;
  uint8_t buf[4];
  const char *v21;

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary
    && (string = xpc_dictionary_get_string(v3, "Notification")) != 0)
  {
    v13 = string;
    v14 = __biome_log_for_category(11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Received com.apple.notifyd.matching: %s", buf, 0xCu);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100012AE0;
    v17[3] = &unk_100068E58;
    v19 = v13;
    v16 = *(NSObject **)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    dispatch_sync(v16, v17);
    v5 = v18;
  }
  else
  {
    v4 = __biome_log_for_category(11);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_100041E98((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }

}

void sub_100012AE0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v2 = __biome_log_for_category(11);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 136315138;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handling com.apple.notifyd.matching: %s", (uint8_t *)&v7, 0xCu);
  }

  if (!strcmp(*(const char **)(a1 + 40), "com.apple.rapport.CompanionLinkDeviceAdded"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "start") & 1) != 0)
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "syncScheduler"));
      -[NSObject syncNowIfPolicyAllowsWithReason:transportType:activity:](v5, "syncNowIfPolicyAllowsWithReason:transportType:activity:", 3, 2, 0);
    }
    else
    {
      v6 = __biome_log_for_category(11);
      v5 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Database unavailable to handle \"com.apple.rapport.CompanionLinkDeviceAdded\"", (uint8_t *)&v7, 2u);
      }
    }

  }
}

void sub_100012C14(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *string;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[4];
  id v18;
  id v19;
  const char *v20;
  uint8_t buf[4];
  const char *v22;

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary
    && (string = xpc_dictionary_get_string(v3, _xpc_event_key_name)) != 0)
  {
    v13 = string;
    v14 = __biome_log_for_category(11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Received com.apple.rapport.matching: %s", buf, 0xCu);
    }

    if (!strcmp(v13, "CascadeRapportWake"))
    {
      objc_msgSend(*(id *)(a1 + 32), "startServer");
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100012DB0;
      block[3] = &unk_100068E80;
      v20 = v13;
      v16 = *(NSObject **)(a1 + 40);
      v18 = *(id *)(a1 + 48);
      v19 = v3;
      dispatch_sync(v16, block);

    }
  }
  else
  {
    v4 = __biome_log_for_category(11);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_100041EFC((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  }
}

void sub_100012DB0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v12;

  v2 = objc_autoreleasePoolPush();
  v3 = __biome_log_for_category(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315138;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling com.apple.rapport.matching: %s", buf, 0xCu);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "start") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rapportSyncEngine"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100012F24;
    v9[3] = &unk_100068B38;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v6, "_startServerWithCompletion:", v9);

    v7 = v10;
  }
  else
  {
    v8 = __biome_log_for_category(11);
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Database unavailable to handle RapportWake", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100012F24(uint64_t a1)
{
  xpc_object_t reply;
  id v3;

  if (xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "replyRequired"))
  {
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      v3 = reply;
      xpc_dictionary_send_reply();
      reply = v3;
    }

  }
}

void sub_100012F84(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = __biome_log_for_category(11);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received SIGTERM", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_100012FF0(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD block[4];
  id v21;
  __int128 *p_buf;
  uint64_t v23;
  __int128 buf;
  uint64_t v25;
  char v26;

  v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    v4 = objc_autoreleasePoolPush();
    if (xpc_activity_should_defer(v3))
    {
      if (!xpc_activity_set_state(v3, 3))
      {
        v5 = __biome_log_for_category(11);
        v6 = objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_100041F60(a1, v6, v7, v8, v9, v10, v11, v12);

        xpc_activity_set_state(v3, 5);
      }
    }
    else
    {
      v13 = __biome_log_for_category(11);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = *(_QWORD *)(a1 + 48);
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "biome activity fired \"%s\"", (uint8_t *)&buf, 0xCu);
      }

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v25 = 0x2020000000;
      v26 = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000131EC;
      block[3] = &unk_100068EF0;
      v16 = *(NSObject **)(a1 + 32);
      v17 = *(id *)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      p_buf = &buf;
      v23 = v18;
      v21 = v17;
      dispatch_sync(v16, block);
      if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "syncScheduler"));
        objc_msgSend(v19, "syncAllTransportsNowIfPolicyAllowsWithReason:activity:", *(_QWORD *)(a1 + 56), v3);

      }
      _Block_object_dispose(&buf, 8);
    }
    objc_autoreleasePoolPop(v4);
  }

}

void sub_1000131CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000131EC(uint64_t a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "start");
  v3 = __biome_log_for_category(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 48);
      v8 = 136315138;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "biome running activity \"%s\"", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 136315138;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Database unavailable for activity \"%s\"", (uint8_t *)&v8, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_100013300(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[4];
  _xpc_activity_s *v20;
  uint8_t buf[4];
  const char *v22;

  v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    v4 = objc_autoreleasePoolPush();
    if (xpc_activity_should_defer(v3))
    {
      if (!xpc_activity_set_state(v3, 3))
      {
        v5 = __biome_log_for_category(17);
        v6 = objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_100041FC8(v6, v7, v8, v9, v10, v11, v12, v13);

        xpc_activity_set_state(v3, 5);
      }
    }
    else
    {
      v14 = __biome_log_for_category(17);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "com.apple.biomesyncd.cascade.periodic-sync";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "cascade activity fired \"%s\"", buf, 0xCu);
      }

      if ((_os_feature_enabled_impl("Biome", "CascadeSync") & 1) != 0)
      {
        xpc_activity_set_state(v3, 4);
        objc_msgSend(*(id *)(a1 + 32), "startClient");
        v16 = *(void **)(a1 + 32);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100013500;
        v19[3] = &unk_100068C78;
        v20 = v3;
        objc_msgSend(v16, "syncNowWithReason:activity:completionHandler:", 1, v20, v19);

      }
      else
      {
        v17 = __biome_log_for_category(17);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "cascade sync feature flag not enabled, returning from periodic sync", buf, 2u);
        }

      }
    }
    objc_autoreleasePoolPop(v4);
  }

}

BOOL sub_100013500(uint64_t a1)
{
  return xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
}

void sub_100013514(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t sub_1000144CC(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_10001477C(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_100014A70(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

void sub_100014DD0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v14 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timestamp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "siteIdentifier"));
  objc_msgSend(v3, "setSiteIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timestamp"));
  objc_msgSend(v6, "setClock:", objc_msgSend(v7, "clockValue"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timestamp"));
  objc_msgSend(v8, "setModifier:", objc_msgSend(v9, "modifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timestamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timestamp"));
  objc_msgSend(v10, "setUnordered:", objc_msgSend(v11, "unordered"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "references"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100014FBC;
  v15[3] = &unk_100068F68;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v12, "appendWithProxyBlock:", v15);

  objc_msgSend(v14, "setAtomType:", objc_msgSend(*(id *)(a1 + 32), "type"));
  if (!objc_msgSend(*(id *)(a1 + 32), "type"))
  {
    v13 = 0;
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "type") == (id)2 || objc_msgSend(*(id *)(a1 + 32), "type") == (id)1)
  {
    v13 = 1;
LABEL_6:
    objc_msgSend(v14, "setAtomBehavior:", v13);
  }
  objc_msgSend(v14, "setValue:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v14, "setVersion:", *(_QWORD *)(a1 + 48));

}

void sub_100014FBC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
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
  id v20;

  v3 = a2;
  objc_msgSend(v3, "setType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "causalReference"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v4, "setIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "causalReference"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timestamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "siteIdentifier"));
  objc_msgSend(v8, "setSiteIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "causalReference"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timestamp"));
  objc_msgSend(v12, "setClock:", objc_msgSend(v14, "clockValue"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "causalReference"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "timestamp"));
  objc_msgSend(v15, "setModifier:", objc_msgSend(v17, "modifier"));

  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "causalReference"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "timestamp"));
  objc_msgSend(v20, "setUnordered:", objc_msgSend(v19, "unordered"));

}

void sub_100015184(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "siteIdentifierObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "distributedSiteIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  objc_msgSend(v7, "setIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timestamp"));
  objc_msgSend(v9, "setClock:", objc_msgSend(v10, "clockValue"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "references"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000152F4;
  v13[3] = &unk_100068F68;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v11, "appendWithProxyBlock:", v13);

  objc_msgSend(v4, "setAtomType:", objc_msgSend(*(id *)(a1 + 32), "type"));
  objc_msgSend(v4, "setValue:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setVersion:", *(_QWORD *)(a1 + 48));

}

void sub_1000152F4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
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
  id v16;

  v3 = a2;
  objc_msgSend(v3, "setType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "causalReference"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mergeableValueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v4, "setIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "causalReference"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timestamp"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "siteIdentifierObject"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "distributedSiteIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  objc_msgSend(v11, "setIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "causalReference"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timestamp"));
  objc_msgSend(v13, "setClock:", objc_msgSend(v15, "clockValue"));

}

void sub_100015DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  uint64_t v47;

  _Block_object_dispose(&a20, 8);
  _Block_object_dispose((const void *)(v47 - 224), 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v47 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100015E40(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100015E50(uint64_t a1)
{

}

uint64_t sub_100015E58(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

void sub_100015E6C(uint64_t a1, _BYTE *a2)
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  int v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "bookmark"));
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v5)
    goto LABEL_18;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "frame"));
  v7 = objc_msgSend(v6, "state");

  if (v7 == 1)
  {
    v8 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v38 = 138412546;
      v39 = v10;
      v40 = 2048;
      v41 = objc_msgSend(v4, "offset");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "read new appended BMStoreEvent: %@ at offset %lu", (uint8_t *)&v38, 0x16u);
    }

    v11 = a1 + 32;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ckAtomTableRecordForEvent:ofType:atBookmark:previousTableRecord:siteIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0, v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40)));
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    if ((objc_msgSend(*(id *)(*(_QWORD *)v11 + 48), "addCKAtomRow:inStream:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)v11 + 16)) & 1) == 0)
    {
      v15 = __biome_log_for_category(11);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      goto LABEL_17;
    }
LABEL_12:
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "location"));
    v24 = objc_msgSend(v23, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

    if ((v24 & 1) == 0)
    {
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "location"));
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "syncPolicy"));
      v29 = objc_msgSend(v28, "supportsTransport:direction:", 3, 3);

      if ((v29 & 1) != 0)
        objc_msgSend(*(id *)(*(_QWORD *)v11 + 48), "upsertCKRecordWithLocation:inStream:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)v11 + 16));
    }
    goto LABEL_15;
  }
  if ((v7 & 0xFFFFFFFE) == 2)
  {
    v17 = __biome_log_for_category(11);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v38 = 138412546;
      v39 = v19;
      v40 = 2048;
      v41 = objc_msgSend(v4, "offset");
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "read new deleted BMStoreEvent: %@ at offset %lu", (uint8_t *)&v38, 0x16u);
    }

    v11 = a1 + 32;
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ckAtomTableRecordForEvent:ofType:atBookmark:previousTableRecord:siteIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0, v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40)));
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    if ((objc_msgSend(*(id *)(*(_QWORD *)v11 + 48), "addCKAtomRow:inStream:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)v11 + 16)) & 1) == 0)
    {
      v33 = __biome_log_for_category(11);
      v16 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_20:
        v34 = *(_QWORD *)(a1 + 56);
        v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v36 = *(void **)(*(_QWORD *)(v34 + 8) + 40);
        v37 = objc_msgSend(v4, "offset");
        v38 = 138412802;
        v39 = v35;
        v40 = 2112;
        v41 = v36;
        v42 = 2048;
        v43 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to insert record %@ for BMStoreEvent: %@ at offset %lu", (uint8_t *)&v38, 0x20u);
      }
LABEL_17:

LABEL_18:
      *a2 = 1;
      goto LABEL_19;
    }
    goto LABEL_12;
  }
LABEL_15:
  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "nextEvent"));
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v32 = *(void **)(v31 + 40);
  *(_QWORD *)(v31 + 40) = v30;

LABEL_19:
}

void sub_1000162AC(uint64_t a1, _BYTE *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  NSObject *v32;
  unint64_t v33;
  _QWORD block[5];
  _BYTE buf[24];
  unint64_t v36;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nextEvent"));
  v5 = v4;
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookmark"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventBody"));
    v10 = objc_alloc((Class)BMStoreBookmark);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "segmentName"));
    v13 = objc_msgSend(v10, "initWithStream:segment:iterationStartTime:offset:", v11, v12, objc_msgSend(v9, "offset"), 1.79769313e308);

    v14 = __biome_log_for_category(11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "read BMStoreEvent tombstone: %@ at tombstone bookmark %@", buf, 0x16u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventBody"));
    v18 = (unint64_t)objc_msgSend(v17, "deletionReason");

    if (v18 == 1)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v9);
    }
    else if ((v18 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      v19 = __biome_log_for_category(11);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v36) = 16;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000166D4;
      block[3] = &unk_100068AA0;
      block[4] = buf;
      if (qword_10007BE28 != -1)
        dispatch_once(&qword_10007BE28, block);
      v21 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v20, v21))
      {
        v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2048;
        v36 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "BMStoreEvent tombstone: %@ at tombstone bookmark: %@ with unexpected deletion reason %lu", buf, 0x20u);
      }

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "ckAtomTableRecordForEvent:ofType:atBookmark:previousTableRecord:siteIdentifier:", 0, 2, v13, 0, *(_QWORD *)(a1 + 48)));
      if (v23)
      {
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "addCKAtomRow:inStream:", v23, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16)) & 1) != 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "location"));
          v25 = objc_msgSend(v24, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

          if ((v25 & 1) == 0)
          {
            v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "location"));
            v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            v28 = *(void **)(v27 + 40);
            *(_QWORD *)(v27 + 40) = v26;

            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "syncPolicy"));
            v30 = objc_msgSend(v29, "supportsTransport:direction:", 3, 3);

            if (v30)
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "upsertCKRecordWithLocation:inStream:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
          }
        }
        else
        {
          v31 = __biome_log_for_category(11);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v9;
            *(_WORD *)&buf[22] = 2112;
            v36 = v33;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "failed to insert record %@ for BMStoreEvent tombstone: %@ at tombstone bookmark: %@", buf, 0x20u);
          }

          *a2 = 1;
        }
      }

    }
  }
  else
  {
    *a2 = 1;
  }

}

uint64_t sub_1000166D4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

void sub_100016C78(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  NSObject *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  unsigned __int8 v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  unsigned __int8 v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD block[5];
  _BYTE buf[24];
  void *v56;

  v5 = a2;
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1000421B0();

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
  v9 = objc_msgSend(v8, "state");

  if (v9 == (id)2)
  {
    if (objc_msgSend(v5, "type"))
    {
      v10 = 0;
      goto LABEL_41;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "location"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "siteIdentifier"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10));
    if (!v14)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "readerForSiteIdentifier:", v10));
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v10);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bookmarkForAtomRow:", v5));
    if (!v15)
    {
      v21 = __biome_log_for_category(11);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v56) = 16;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100017404;
      block[3] = &unk_100068AA0;
      block[4] = buf;
      if (qword_10007BE30 != -1)
        dispatch_once(&qword_10007BE30, block);
      v23 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v5;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "BMSyncCKAtomRow missing bookmark %@", buf, 0xCu);
      }

      goto LABEL_43;
    }
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "segmentName"));
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("DOA"));

    if ((v18 & 1) != 0)
    {
      v19 = __biome_log_for_category(11);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "bookmark is DOA, not attempting to resolve event", buf, 2u);
      }
      goto LABEL_39;
    }
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v10));
    if (!v24)
    {
      v30 = objc_msgSend(v14, "newEnumeratorFromBookmark:options:", v16, 7);
LABEL_30:
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v30, v10);
      v20 = v30;
      goto LABEL_31;
    }
    v20 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bookmark](v24, "bookmark"));
    v26 = objc_msgSend(v25, "isEqual:", v16);

    if ((v26 & 1) == 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bookmark](v20, "bookmark"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "segmentName"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "segmentName"));
      if (objc_msgSend(v28, "isEqualToString:", v29))
      {

LABEL_25:
        v32 = __biome_log_for_category(11);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        LOBYTE(v56) = 16;
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_100017418;
        v53[3] = &unk_100068AA0;
        v53[4] = buf;
        if (qword_10007BE38 != -1)
          dispatch_once(&qword_10007BE38, v53);
        v34 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v33, v34))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bookmark](v20, "bookmark"));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          _os_log_impl((void *)&_mh_execute_header, v33, v34, "Next enumerator bookmark %@ doesn't match expected %@", buf, 0x16u);

        }
        v30 = objc_msgSend(v14, "newEnumeratorFromBookmark:options:", v16, 7);

        goto LABEL_30;
      }
      v50 = v27;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentFrameStore](v20, "currentFrameStore"));
      v48 = objc_msgSend(v31, "offsetIsStartOfFrameStore:", objc_msgSend(v16, "offset"));

      if ((v48 & 1) == 0)
        goto LABEL_25;
    }
LABEL_31:
    v36 = objc_claimAutoreleasedReturnValue(-[NSObject nextEvent](v20, "nextEvent"));
    v37 = __biome_log_for_category(11);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject eventBodyData](v36, "eventBodyData"));
      v47 = objc_msgSend(v51, "length");
      v46 = objc_msgSend(v16, "offset");
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timestamp"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bm_description"));
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v46;
      *(_WORD *)&buf[22] = 2112;
      v56 = v45;
      _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Read event of size %llu at offset %lu for atom %@", buf, 0x20u);

    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bookmark](v36, "bookmark"));
    v40 = objc_msgSend(v39, "isEqual:", v16);

    if ((v40 & 1) != 0)
      goto LABEL_40;
    v41 = __biome_log_for_category(11);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v56) = 16;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10001742C;
    v52[3] = &unk_100068AA0;
    v52[4] = buf;
    if (qword_10007BE40 != -1)
      dispatch_once(&qword_10007BE40, v52);
    v43 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v42, v43))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "populateAtomBatch missing event for bookmark %@, adding a placeholder append", buf, 0xCu);
    }

LABEL_39:
    v36 = 0;
LABEL_40:

    v10 = v36;
LABEL_41:
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "atomValueFromEvent:ofType:version:", v10, objc_msgSend(v5, "type"), *(_QWORD *)(a1 + 72)));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "serialize"));

    if ((objc_msgSend(*(id *)(a1 + 40), "addAtomToAtomBatch:ifChunkerAllows:fromAtomTableRecord:atomValueData:version:atomValueVersion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v5, v14, *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 72)) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 64), "setMoreComing:", 1);
      *a3 = 1;
    }
LABEL_43:

    goto LABEL_44;
  }
  v11 = __biome_log_for_category(11);
  v10 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ location is not active", buf, 0xCu);
  }
LABEL_44:

}

uint64_t sub_100017404(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_100017418(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_10001742C(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

id sub_100017640(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void sub_10001764C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v6 = a2;
  v7 = __biome_log_for_category(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "creating new batch with location %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ckMergeableValueIDWithFormatVersion:", 0));

  v15 = 0;
  v11 = objc_msgSend(objc_alloc((Class)CKAtomBatch), "initWriterWithMergeableValueID:metadata:formatVersion:error:", v10, 0, 2, &v15);
  v12 = v15;
  if (v12)
  {
    v13 = __biome_log_for_category(11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100042210();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "populateAtomBatch:withAtomsInClockVector:forLocation:ckFormatVersion:valueVersion:chunker:", v11, *(_QWORD *)(a1 + 40), v6, *(unsigned __int8 *)(a1 + 64), 0, *(_QWORD *)(a1 + 48));
    if (objc_msgSend(v11, "count"))
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    *a4 = objc_msgSend(*(id *)(a1 + 48), "moreComing");
  }

}

void sub_100017BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017BD8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bookmarkForAtomRow:", v3));
  v5 = v4;
  if (v4
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "segmentName")),
        v7 = objc_msgSend(v6, "isEqual:", CFSTR("DOA")),
        v6,
        !v7))
  {
    v10 = __biome_log_for_category(11);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "deleting event at bookmark %@", buf, 0xCu);
    }

    v12 = *(void **)(a1 + 40);
    v18 = 0;
    v13 = objc_msgSend(v12, "deleteEventAtBookmark:outTombstoneBookmark:", v5, &v18);
    v14 = v18;
    if ((v13 & 1) == 0)
    {
      v15 = __biome_log_for_category(11);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        sub_100042270();

    }
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(NSObject **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v14;
  }
  else
  {
    v8 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "bookmark is nil, presumably because the referenced atom was a placeholder append (dead on arrival) %@", buf, 0xCu);
    }
  }

}

void sub_100018814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;
  char a71;

  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void sub_1000188A4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BMStreamCRDTLocation *v37;
  BMStreamCRDTLocation *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  BMSyncCKAtomRow *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  BMSyncCKAtomRow *v53;
  BMSyncCKAtomRow *v54;
  uint64_t v55;
  NSObject *v56;
  BMStreamCRDTLocation *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  BMSyncCKAtomRow *v65;
  void *v66;
  BMStreamCRDTLocation *v67;
  _BYTE *v68;
  void *v69;
  uint8_t buf[4];
  id v71;
  __int16 v72;
  uint64_t v73;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "markOperationStarted");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timestamp"));

  v9 = a1 + 40;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "containsCKAtomRowWithTimestamp:inStream:onDisk:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 1))
  {
    v10 = __biome_log_for_category(11);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bm_description"));
      v13 = *(_QWORD *)(*(_QWORD *)v9 + 8);
      *(_DWORD *)buf = 138412546;
      v71 = v12;
      v72 = 2112;
      v73 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Warning: dropping atom %@ in stream %@ because it is already merged", buf, 0x16u);

    }
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "originatingSiteIdentifier"));
    v15 = objc_alloc((Class)NSString);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "siteIdentifier"));
    v18 = objc_msgSend(v15, "initWithData:encoding:", v17, 4);

    v19 = *(_QWORD *)(a1 + 40);
    v20 = *(void **)(v19 + 80);
    v21 = *(_QWORD *)(v19 + 16);
    v22 = objc_msgSend(v18, "length");
    v23 = v18;
    if (!v22)
      v23 = *(id *)(a1 + 56);
    objc_msgSend(v20, "recordAtomMergeResult:inStream:ownerSite:originatingSite:eventCreatedAt:sessionContext:", 1, v21, v23, v14, *(_QWORD *)(a1 + 48), 0.0);
    goto LABEL_10;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)v9 + 48), "containsCKAtomRowWithTimestamp:inStream:onDisk:", v8, *(_QWORD *)(*(_QWORD *)v9 + 16), 0))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "references"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "proxyAtIndex:", 0));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "reference"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject timestamp](v14, "timestamp"));
    v29 = objc_msgSend(v28, "clockValue");

    if (v29)
    {
      v30 = objc_claimAutoreleasedReturnValue(-[NSObject mergeableValueID](v14, "mergeableValueID"));
      if (!v30
        || (v31 = (void *)v30,
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mergeableValueID](v14, "mergeableValueID")),
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier")),
            v33,
            v32,
            v31,
            !v33))
      {
        v45 = __biome_log_for_category(11);
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
          sub_1000425DC();

        *a4 = 1;
        goto LABEL_11;
      }
      v34 = *(void **)(a1 + 64);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mergeableValueID](v14, "mergeableValueID"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "name"));
      v37 = (BMStreamCRDTLocation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", v36));

      if (!v37)
      {
        v38 = [BMStreamCRDTLocation alloc];
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mergeableValueID](v14, "mergeableValueID"));
        v37 = -[BMStreamCRDTLocation initWithCKMergeableValueID:streamName:](v38, "initWithCKMergeableValueID:streamName:", v39, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));

        v40 = *(void **)(a1 + 64);
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mergeableValueID](v14, "mergeableValueID"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "name"));
        objc_msgSend(v40, "setObject:forKey:", v37, v42);

      }
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v37));
      v68 = a4;
      v69 = v8;
      v67 = v37;
      if (!v37 || v43)
      {
        v44 = v43;
      }
      else
      {
        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)v9 + 48), "locationRowWithLocation:", v37));
        if (!v44)
        {
          v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)v9 + 48), "insertLocationIfNotExists:withState:", v37, 1));
          if (!v44)
          {
            v62 = __biome_log_for_category(11);
            v63 = objc_claimAutoreleasedReturnValue(v62);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
              sub_100042608();

            *a4 = 1;
            goto LABEL_11;
          }
        }
        objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v44, v37);
      }
    }
    else
    {
      v68 = a4;
      v69 = v8;

      v44 = 0;
      v67 = 0;
      v14 = 0;
    }
    v47 = [BMSyncCKAtomRow alloc];
    v64 = *(_QWORD *)(a1 + 80);
    v65 = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "timestamp"));
    v50 = objc_msgSend(v6, "atomType");
    v51 = objc_msgSend(v6, "version");
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
    v53 = v65;
    v66 = (void *)v44;
    v54 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:valueVersion:valueData:](v53, "initWithLocation:timestamp:referenceLocation:causalReference:type:valueVersion:valueData:", v64, v49, v44, v14, v50, v51, v52);

    v55 = __biome_log_for_category(11);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      sub_1000424E8(v54, v56);

    if ((objc_msgSend(*(id *)(*(_QWORD *)v9 + 48), "addCKAtomRow:inStream:", v54, *(_QWORD *)(*(_QWORD *)v9 + 16)) & 1) != 0)
    {
      v58 = v66;
      v57 = v67;
      if ((objc_msgSend(*(id *)(a1 + 32), "markOperationComplete") & 1) != 0)
      {
LABEL_37:

        v8 = v69;
        goto LABEL_11;
      }
      v59 = __biome_log_for_category(11);
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        sub_1000423C4();
    }
    else
    {
      v61 = __biome_log_for_category(11);
      v60 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        sub_1000423F0(v54, v9, v60);
      v58 = v66;
      v57 = v67;
    }

    *v68 = 1;
    goto LABEL_37;
  }
  v24 = __biome_log_for_category(11);
  v14 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bm_description"));
    v25 = *(_QWORD *)(*(_QWORD *)v9 + 8);
    *(_DWORD *)buf = 138412546;
    v71 = v18;
    v72 = 2112;
    v73 = v25;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Warning: atom %@ in stream %@ already in table but not on disk", buf, 0x16u);
LABEL_10:

  }
LABEL_11:

}

void sub_100018ECC(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
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
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  BMSyncCKAtomRow *v27;
  BMSyncCKAtomRow *v28;
  void *v29;
  void *v30;
  void *v31;
  _BYTE *v32;
  uint8_t buf[4];
  id v34;

  v5 = a2;
  if (!objc_msgSend(v5, "type"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "frame"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "data"));

    LODWORD(v6) = bm_generateChecksum(objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BMSyncAtomValue atomValueFromData:version:](BMSyncAtomValue, "atomValueFromData:version:", v8, objc_msgSend(v5, "valueVersion")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventData"));
    if ((_DWORD)v6 == bm_generateChecksum(objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length")))
    {
      v29 = v10;
      v30 = v9;
      v31 = v7;
      v32 = a3;
      v27 = [BMSyncCKAtomRow alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timestamp"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "referenceLocation"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "causalReference"));
      v26 = objc_msgSend(v5, "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "bookmark"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "segmentName"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "bookmark"));
      v28 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:](v27, "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:", v12, v13, v14, v15, v26, v17, objc_msgSend(v18, "offset"));

      v19 = __biome_log_for_category(11);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v5;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "updating row for atom inferred to be applied to disk %@", buf, 0xCu);
      }

      v7 = v31;
      a3 = v32;
      v10 = v29;
      v9 = v30;
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "updateCKAtomRow:inStream:") & 1) == 0)
      {
        v21 = __biome_log_for_category(11);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_10004266C();

      }
    }

  }
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "nextEvent"));
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    *a3 = 1;

}

void sub_1000191F4(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  unsigned __int8 v26;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unsigned __int8 v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  BMSyncCKAtomRow *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  _BYTE *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  uint8_t buf[4];
  void *v71;

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "originatingSiteIdentifier"));
  v7 = objc_alloc((Class)NSString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "siteIdentifierObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v11 = objc_msgSend(v7, "initWithData:encoding:", v10, 4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "causalReference"));
  v13 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "isEqualToReference:", v12);
  if (!v12)
    goto LABEL_8;
  if ((v13 & 1) != 0)
    goto LABEL_8;
  v14 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timestamp"));
  LOBYTE(v14) = objc_msgSend(v14, "containsCKAtomRowWithTimestamp:inStream:onDisk:", v15, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 1);

  if ((v14 & 1) != 0)
    goto LABEL_8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "referenceLocation"));
  v17 = (char *)objc_msgSend(v16, "state");

  v18 = __biome_log_for_category(11);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if ((unint64_t)(v17 - 3) <= 1)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "referenceLocation"));
      *(_DWORD *)buf = 138412290;
      v71 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "causal reference location %@ points to dead location, not a violation", buf, 0xCu);

    }
LABEL_8:
    v22 = __biome_log_for_category(11);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      sub_10004277C(v5, v23);

    if (objc_msgSend(v5, "type"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      v24 = *(void **)(a1 + 40);
      v25 = *(_QWORD *)(a1 + 56);
      v67 = 0;
      v68 = 0;
      v26 = objc_msgSend(v24, "handleDeleteAtomRow:usingPruner:outBookmark:outTombstoneBookmark:", v5, v25, &v68, &v67);
      v27 = (unint64_t)v68;
      v28 = v67;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "saveLatestTombstoneBookmark:forSiteIdentifier:inStream:", v28, *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
      v29 = 0;
      if ((v26 & 1) == 0)
      {
LABEL_28:
        v60 = __biome_log_for_category(11);
        v44 = objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          sub_1000426CC(v5, v44);
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueData"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[BMSyncAtomValue atomValueFromData:version:](BMSyncAtomValue, "atomValueFromData:version:", v30, objc_msgSend(v5, "valueVersion")));

      if (!v29)
      {
        v27 = 0;
        v28 = 0;
        goto LABEL_28;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      v31 = *(void **)(a1 + 40);
      v32 = *(_QWORD *)(a1 + 48);
      v69 = 0;
      v33 = objc_msgSend(v31, "writeAtomValue:fromAtomRow:usingWriter:outBookmark:", v29, v5, v32, &v69);
      v27 = (unint64_t)v69;
      v28 = 0;
      if ((v33 & 1) == 0)
        goto LABEL_28;
    }
    v61 = a3;
    v62 = v28;
    v64 = v12;
    v65 = v11;
    v66 = v6;
    v63 = v29;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "value"));
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "eventData"));
    v36 = v35 | v27;

    if (!v36)
      v27 = (unint64_t)objc_msgSend(objc_alloc((Class)BMStoreBookmark), "initWithStream:segment:iterationStartTime:offset:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("DOA"), clock_gettime_nsec_np(_CLOCK_MONOTONIC), 0.0);
    v37 = [BMSyncCKAtomRow alloc];
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timestamp"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "referenceLocation"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "causalReference"));
    v42 = objc_msgSend(v5, "type");
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v27, "segmentName"));
    v44 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:](v37, "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:", v38, v39, v40, v41, v42, v43, objc_msgSend((id)v27, "offset"));

    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "updateCKAtomRow:inStream:", v44, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16)) & 1) != 0)
    {
      v11 = v65;
      v28 = v62;
      if (!objc_msgSend(v5, "type"))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "location"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "ckMergeableValueIDWithFormatVersion:", 0));

        v48 = objc_alloc((Class)CKAtomReference);
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timestamp"));
        v50 = objc_msgSend(v48, "initWithMergeableValueID:timestamp:type:", v47, v49, 0);
        v51 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v52 = *(void **)(v51 + 40);
        *(_QWORD *)(v51 + 40) = v50;

      }
      v53 = *(_QWORD *)(a1 + 40);
      v54 = *(void **)(v53 + 80);
      v55 = *(_QWORD *)(v53 + 16);
      v29 = v63;
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "value"));
      objc_msgSend(v56, "dataTimestamp");
      v57 = v55;
      v6 = v66;
      objc_msgSend(v54, "recordAtomMergeResult:inStream:ownerSite:originatingSite:eventCreatedAt:sessionContext:", 3, v57, v65, v66, *(_QWORD *)(a1 + 32));

      v12 = v64;
    }
    else
    {
      v58 = __biome_log_for_category(11);
      v59 = objc_claimAutoreleasedReturnValue(v58);
      v11 = v65;
      v28 = v62;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        sub_10004266C();

      *v61 = 1;
      v6 = v66;
      v29 = v63;
      v12 = v64;
    }
    goto LABEL_30;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_10004282C(v5, v12, v20);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "recordAtomMergeResult:inStream:ownerSite:originatingSite:eventCreatedAt:sessionContext:", 2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), v11, v6, *(_QWORD *)(a1 + 32), 0.0);
  *a3 = 1;
LABEL_31:

}

void sub_1000198E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void sub_1000198FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_10001990C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100019954()
{
  void *v0;

  return objc_msgSend(v0, "type");
}

uint64_t sub_100019960(uint64_t result)
{
  if (result)
  {
    if ((*(_BYTE *)(result + 24) & 1) != 0)
      return *(unsigned int *)(result + 8);
    else
      return 0;
  }
  return result;
}

uint64_t sub_10001998C(uint64_t result, int a2)
{
  if (result)
  {
    *(_BYTE *)(result + 24) |= 1u;
    *(_DWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_1000199B4(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 24) = *(_BYTE *)(result + 24) & 0xFE | a2;
  return result;
}

uint64_t sub_1000199D4(uint64_t result)
{
  if (result)
    return *(_BYTE *)(result + 24) & 1;
  return result;
}

__CFString *sub_1000199EC(void *a1, uint64_t a2)
{
  if (a1)
  {
    if (a2 < 5)
      return off_100069148[(int)a2];
    a1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), a2));
  }
  return (__CFString *)a1;
}

uint64_t sub_100019A3C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Append")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TTLDelete")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RandomDelete")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Modify")) & 1) != 0)
    {
      v6 = 3;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Unknown")))
    {
      v6 = 4;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL sub_100019B10(_BOOL8 result)
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

uint64_t sub_100019CA0(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  char v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BMPBStoreEventAtomValue *v17;
  uint64_t result;
  _QWORD v19[2];

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      v9 = v5++ >= 9;
      if (v9)
      {
        v6 = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v6 = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    if ((v6 >> 3) == 2)
    {
      v17 = objc_alloc_init(BMPBStoreEventAtomValue);
      objc_storeStrong((id *)(a1 + 16), v17);
      v19[0] = 0;
      v19[1] = 0;
      if (!PBReaderPlaceMark(a2, v19) || (sub_100035C44((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark(a2, v19);

    }
    else if ((v6 >> 3) == 1)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      *(_BYTE *)(a1 + 24) |= 1u;
      while (1)
      {
        v15 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          break;
        v16 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0)
          goto LABEL_32;
        v12 += 7;
        v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_34;
        }
      }
      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
        LODWORD(v14) = 0;
LABEL_34:
      *(_DWORD *)(a1 + 8) = v14;
    }
    else
    {
      result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result)
        return result;
    }
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100019FA4(uint64_t a1, void *a2)
{
  _DWORD *v3;
  void *v4;
  _DWORD *v5;

  v3 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 24) & 1) != 0)
    {
      v3[2] = *(_DWORD *)(a1 + 8);
      *((_BYTE *)v3 + 24) |= 1u;
    }
    v4 = *(void **)(a1 + 16);
    if (v4)
    {
      v5 = v3;
      sub_10001A01C((uint64_t)v3, v4);
      v3 = v5;
    }
  }

}

void sub_10001A01C(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

void sub_10001A1D0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((*((_BYTE *)v3 + 24) & 1) != 0)
    {
      *(_DWORD *)(a1 + 8) = *((_DWORD *)v3 + 2);
      *(_BYTE *)(a1 + 24) |= 1u;
    }
    v5 = (void *)*((_QWORD *)v3 + 2);
    if (*(_QWORD *)(a1 + 16))
    {
      if (v5)
      {
        v6 = v3;
        sub_1000362AC(*(_QWORD *)(a1 + 16), v5);
LABEL_9:
        v4 = v6;
      }
    }
    else if (v5)
    {
      v6 = v3;
      objc_storeStrong((id *)(a1 + 16), v5);
      goto LABEL_9;
    }
  }

}

uint64_t sub_10001A26C(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

id sub_10001AD90(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = __biome_log_for_category(11);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BMRapportManager: received SIGTERM", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void sub_10001AF8C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  if (v3)
  {
    v4 = __biome_log_for_category(11);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100042958((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 8);
    *(_QWORD *)(v12 + 8) = 0;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void sub_10001B020(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  if (v3)
  {
    v4 = __biome_log_for_category(11);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000429C0((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 16);
    *(_QWORD *)(v12 + 16) = 0;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void sub_10001B0B4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSErrorUserInfoKey v8;
  uint64_t v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)v2 > 1)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v8 = NSMultipleUnderlyingErrorsKey;
    v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 1, v5));
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);

  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
}

void sub_10001B9D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_10001BA38(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateClientWithError:", 0);

}

void sub_10001BA68(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleActivationForDevice:error:", v5, v4);

}

void sub_10001C040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001C06C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  unsigned int v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (objc_msgSend(v9, "code") == (id)-71148
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain")),
        v6 = objc_msgSend(v5, "isEqualToString:", RPErrorDomain),
        v5,
        v6))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "invalidateClientWithError:", v9);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v8, "sendNextRequestToDevice:", WeakRetained);
  }

}

void sub_10001E624(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForColumnIndex:", 0));
  v4 = objc_alloc((Class)CKDistributedSiteIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));
  v6 = objc_msgSend(v4, "initWithIdentifier:", v5);

  v7 = objc_alloc((Class)NSIndexSet);
  v8 = objc_msgSend(v3, "unsignedLongLongIntForColumnIndex:", 1);

  v9 = objc_msgSend(v7, "initWithIndex:", v8);
  objc_msgSend(*(id *)(a1 + 32), "addClockValuesInIndexSet:forSiteIdentifier:", v9, v6);

}

void sub_10001E92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E950(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001E960(uint64_t a1)
{

}

void sub_10001E968(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v15 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringForColumn:", CFSTR("site")));
  v4 = objc_alloc((Class)CKDistributedSiteIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));
  v6 = objc_msgSend(v4, "initWithIdentifier:", v5);

  v7 = objc_msgSend(v15, "intForColumn:", CFSTR("type"));
  v8 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndex:", (int)objc_msgSend(v15, "intForColumn:", CFSTR("clock")));
  if (v7 == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addClockValuesInIndexSet:withAtomState:forSiteIdentifier:", v8, 1, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringForColumn:", CFSTR("ref_site")));
    v10 = v9;
    if (v9 && objc_msgSend(v9, "length"))
    {
      v11 = objc_alloc((Class)CKDistributedSiteIdentifier);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));
      v13 = objc_msgSend(v11, "initWithIdentifier:", v12);

      v14 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndex:", (int)objc_msgSend(v15, "intForColumn:", CFSTR("ref_clock")));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addClockValuesInIndexSet:withAtomState:forSiteIdentifier:", v14, 2, v13);

    }
  }
  else if (!v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addClockValuesInIndexSet:withAtomState:forSiteIdentifier:", v8, 1, v6);
  }

}

void sub_10001FBA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  BMSyncCKAtomRow *v5;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = -[BMSyncCKAtomRow initWithFMResultSet:]([BMSyncCKAtomRow alloc], "initWithFMResultSet:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, BMSyncCKAtomRow *, uint64_t))(v4 + 16))(v4, v5, a3);

}

void sub_10001FE38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  BMSyncCKAtomRow *v5;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = -[BMSyncCKAtomRow initWithFMResultSet:]([BMSyncCKAtomRow alloc], "initWithFMResultSet:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, BMSyncCKAtomRow *, uint64_t))(v4 + 16))(v4, v5, a3);

}

void sub_1000204E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_100020504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  const __CFString *v6;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;

  if (a3 == 1)
  {
    v5 = *(void **)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v6 = CFSTR("AND clock = ? ");
    else
      v6 = CFSTR("OR clock = ? ");
LABEL_9:
    objc_msgSend(v5, "addObject:", v6);
    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a2));
    v11 = v9;
    goto LABEL_14;
  }
  v8 = sub_100008428(a2, a3);
  v5 = *(void **)(a1 + 32);
  if (v8)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v6 = CFSTR("AND clock >= ? ");
    else
      v6 = CFSTR("OR clock >= ? ");
    goto LABEL_9;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v12 = CFSTR("AND clock BETWEEN ? ");
  else
    v12 = CFSTR("OR clock BETWEEN ? ");
  objc_msgSend(v5, "addObject:", v12);
  v13 = *(void **)(a1 + 32);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a2));
  objc_msgSend(v13, "addObject:", v14);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR(" AND ?"));
  v15 = *(void **)(a1 + 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3 + a2 - 1));
  v11 = v15;
LABEL_14:
  objc_msgSend(v11, "addObject:", v10);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void sub_100020658(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:HAVING:ORDER_BY:LIMIT:", CFSTR("CKAtom"), &off_10006E690, &off_10006E6A8, *(_QWORD *)(a1 + 40), &off_10006E6C0, 0, &off_10006E6D8, 0));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020730;
  v5[3] = &unk_100069240;
  v3 = *(id *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  objc_msgSend(v4, "enumerateWithBlock:", v5);
  objc_msgSend(v4, "close");

}

void sub_100020730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  BMSyncCRDTLocationRow *v5;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]([BMSyncCRDTLocationRow alloc], "initWithFMResultSet:modifier:", *(_QWORD *)(a1 + 32), 1);
  (*(void (**)(uint64_t, BMSyncCRDTLocationRow *, uint64_t))(v4 + 16))(v4, v5, a3);

}

void sub_100020B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_100020B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  const __CFString *v6;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;

  if (a3 == 1)
  {
    v5 = *(void **)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v6 = CFSTR("AND clock = ? ");
    else
      v6 = CFSTR("OR clock = ? ");
LABEL_9:
    objc_msgSend(v5, "addObject:", v6);
    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a2));
    v11 = v9;
    goto LABEL_14;
  }
  v8 = sub_100008428(a2, a3);
  v5 = *(void **)(a1 + 32);
  if (v8)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v6 = CFSTR("AND clock >= ? ");
    else
      v6 = CFSTR("OR clock >= ? ");
    goto LABEL_9;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v12 = CFSTR("AND clock BETWEEN ? ");
  else
    v12 = CFSTR("OR clock BETWEEN ? ");
  objc_msgSend(v5, "addObject:", v12);
  v13 = *(void **)(a1 + 32);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a2));
  objc_msgSend(v13, "addObject:", v14);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR(" AND ?"));
  v15 = *(void **)(a1 + 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3 + a2 - 1));
  v11 = v15;
LABEL_14:
  objc_msgSend(v11, "addObject:", v10);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void sub_100020CB0(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  void *v8;
  id v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:", *(_QWORD *)(a1 + 40), &off_10006E6F0, 0));
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_100020D58;
  v8 = &unk_100069240;
  v3 = *(id *)(a1 + 48);
  v9 = v2;
  v10 = v3;
  v4 = v2;
  objc_msgSend(v4, "enumerateWithBlock:", &v5);
  objc_msgSend(v4, "close", v5, v6, v7, v8);

}

void sub_100020D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  BMSyncCKAtomRow *v5;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = -[BMSyncCKAtomRow initWithFMResultSet:]([BMSyncCKAtomRow alloc], "initWithFMResultSet:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, BMSyncCKAtomRow *, uint64_t))(v4 + 16))(v4, v5, a3);

}

void sub_1000211A0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1000214EC(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if ((objc_msgSend(*(id *)(a1[4] + 8), "start") & 1) == 0)
  {
    v2 = a1[5];
    if (v2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", BMSyncErrorDomain, 2, 0));
      (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

    }
    v4 = a1[6];
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", BMSyncErrorDomain, 2, 0));
      v7 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
      (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, &__NSArray0__struct, v6);

    }
  }
}

uint64_t sub_100021604(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100021618(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void sub_1000216D8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  void *v11;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "start") & 1) != 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "syncScheduler"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100021870;
    v9[3] = &unk_1000692B8;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v2, "syncRapportNowIfPolicyAllowsWithReason:activity:completionHandler:", 5, 0, v9);

    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
    v4 = v10;
    goto LABEL_9;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", BMSyncErrorDomain, 2, 0));
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", BMSyncErrorDomain, 2, 0));
    v11 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, &__NSArray0__struct, v8);

LABEL_9:
  }
}

uint64_t sub_100021870(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100021958(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  void *v12;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "start") & 1) != 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "syncScheduler"));
    v3 = *(_QWORD *)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100021AF8;
    v10[3] = &unk_1000692B8;
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v2, "syncRapportNowIfPolicyAllowsWithDevices:reason:activity:completionHandler:", v3, 5, 0, v10);

    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
    v5 = v11;
    goto LABEL_9;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", BMSyncErrorDomain, 2, 0));
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", BMSyncErrorDomain, 2, 0));
    v12 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, &__NSArray0__struct, v9);

LABEL_9:
  }
}

uint64_t sub_100021AF8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100021C1C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100021D60(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100021E6C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100021FC0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000220E4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000221F0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100022280(uint64_t a1)
{
  void *v2;
  BMSyncDevicePeerStatusTracker *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *v27;
  void *v28;
  id v29;
  id obj;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "start") & 1) != 0)
  {
    v26 = a1;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "primaryDatabase"));
    v3 = -[BMSyncDevicePeerStatusTracker initWithDatabase:]([BMSyncDevicePeerStatusTracker alloc], "initWithDatabase:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeerStatusTracker localDeviceIdentifierCreatingIfNecessary](v3, "localDeviceIdentifierCreatingIfNecessary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeerStatusTracker allPeers](v3, "allPeers"));

    v6 = objc_opt_new(NSMutableArray);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      v27 = v6;
      v28 = v4;
      do
      {
        v10 = 0;
        v29 = v8;
        do
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceIdentifier"));
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if ((v13 & 1) == 0)
          {
            v31 = objc_alloc((Class)BMDevice);
            v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceIdentifier"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idsDeviceIdentifier"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
            v19 = v9;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "model"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
            v22 = (void *)v14;
            v23 = objc_msgSend(v31, "initWithDeviceIdentifier:idsDeviceIdentifier:name:model:platform:", v14, v15, v17, v20, objc_msgSend(v21, "platform"));

            v9 = v19;
            v8 = v29;

            v4 = v28;
            v6 = v27;
            -[NSMutableArray addObject:](v27, "addObject:", v23);

          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v8);
    }

    v24 = *(_QWORD *)(v26 + 40);
    if (v24)
      (*(void (**)(uint64_t, NSMutableArray *, _QWORD))(v24 + 16))(v24, v6, 0);

  }
  else
  {
    v25 = *(_QWORD *)(a1 + 40);
    if (v25)
    {
      v32 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", BMSyncErrorDomain, 2, 0));
      (*(void (**)(uint64_t, void *))(v25 + 16))(v25, &__NSArray0__struct);

    }
  }
}

void sub_10002262C(uint64_t a1)
{
  BMSyncDevicePeerStatusTracker *v2;
  void *v3;
  BMSyncDevicePeerStatusTracker *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t Description;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  BMSyncDevicePeerStatusTracker *v22;
  uint64_t v23;
  id obj;
  id obja;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "start") & 1) != 0)
  {
    v2 = [BMSyncDevicePeerStatusTracker alloc];
    v23 = a1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "primaryDatabase"));
    v4 = -[BMSyncDevicePeerStatusTracker initWithDatabase:](v2, "initWithDatabase:", v3);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeerStatusTracker allPeers](v4, "allPeers"));
    v22 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeerStatusTracker localDeviceIdentifierCreatingIfNecessary](v4, "localDeviceIdentifierCreatingIfNecessary"));
    v7 = objc_opt_new(NSMutableArray);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dictionaryRepresentation"));
          v14 = objc_msgSend(v13, "mutableCopy");

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceIdentifier"));
          v16 = objc_msgSend(v15, "isEqual:", v6);

          if (v16)
            objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("isMe"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadata"));
          Description = BMDevicePlatformGetDescription(objc_msgSend(v17, "platform"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(Description);
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("platformDescription"));

          -[NSMutableArray addObject:](v7, "addObject:", v14);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v9);
    }

    v20 = *(_QWORD *)(v23 + 40);
    if (v20)
      (*(void (**)(uint64_t, NSMutableArray *, _QWORD))(v20 + 16))(v20, v7, 0);

  }
  else
  {
    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
    {
      obja = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", BMSyncErrorDomain, 2, 0));
      (*(void (**)(uint64_t, void *))(v21 + 16))(v21, &__NSArray0__struct);

    }
  }
}

void sub_100022984(id a1)
{
  BMSyncDevice *v1;
  void *v2;
  id v3;

  v1 = objc_alloc_init(BMSyncDevice);
  v2 = (void *)qword_10007BE48;
  qword_10007BE48 = (uint64_t)v1;

  v3 = +[BMDeviceMetadataUtils platform](BMDeviceMetadataUtils, "platform");
  *(_QWORD *)(qword_10007BE48 + 8) = v3;
}

__CFString *BMRapportErrorToString(unint64_t a1)
{
  if (a1 >= 0xE)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown error (code %ld)"), a1));
  else
    return off_1000693A0[a1];
}

id sub_100022CA4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_validateDevice:", a2);
}

id sub_1000250CC(unint64_t a1)
{
  id v1;

  if (a1 >= 5)
    v1 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("BMSyncAtomType(%llu)"), a1);
  else
    v1 = *(&off_100069438 + a1);
  return v1;
}

uint64_t sub_100025610(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_1000258A0(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_1000258B4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_100025E24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_opt_class(a1, a2, a3, a4);
}

void sub_100025E90(id a1)
{
  id v1;
  __int128 v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _UNKNOWN **v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _UNKNOWN **v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  __int128 v33;
  id obj;
  void *v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];

  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[BMStreamSyncPolicy syncableStreamConfigurations](BMStreamSyncPolicy, "syncableStreamConfigurations"));
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v1)
  {
    v3 = v1;
    v4 = *(_QWORD *)v39;
    v5 = BMUseCaseLegacy;
    v6 = &BMDevicePlatformFromModelString_ptr;
    *(_QWORD *)&v2 = 138412546;
    v33 = v2;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v4)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storeConfig", v33));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "datastorePath"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "streamIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v11));

        v13 = objc_msgSend(v6[30], "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:", v12, v5, 0, getuid());
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = objc_claimAutoreleasedReturnValue(+[BMStoreDirectory remoteDevices](BMStoreDirectory, "remoteDevices"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", v15));

        v37 = 0;
        LOBYTE(v15) = objc_msgSend(v14, "removeDirectoryAtPath:error:", v16, &v37);
        v17 = v37;
        v18 = v17;
        if ((v15 & 1) == 0)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
          v35 = v18;
          v20 = v14;
          v21 = v6;
          v22 = v3;
          v23 = v5;
          v24 = v4;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", NSUnderlyingErrorKey));
          v36 = v16;
          v26 = v8;
          v27 = objc_msgSend(v25, "code");

          v4 = v24;
          v5 = v23;
          v3 = v22;
          v6 = v21;
          v14 = v20;
          v18 = v35;

          v28 = v27 == (id)2;
          v29 = v26;
          v16 = v36;
          if (!v28)
          {
            v30 = __biome_log_for_category(11);
            v31 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "streamIdentifier"));
              *(_DWORD *)buf = v33;
              v43 = v32;
              v44 = 2112;
              v45 = v35;
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "failed to delete remotes for stream %@: %@", buf, 0x16u);

            }
          }
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v3);
  }

}

void sub_1000262E8(uint64_t a1)
{
  id v1;
  __int128 v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BMFileManager *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];

  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[BMStreamSyncPolicy syncableStreamConfigurations](BMStreamSyncPolicy, "syncableStreamConfigurations"));
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v1)
  {
    v3 = v1;
    v26 = *(_QWORD *)v31;
    v25 = BMUseCaseLegacy;
    *(_QWORD *)&v2 = 138412802;
    v23 = v2;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[BMPaths pathForSharedSyncWithAccount:streamType:domain:](BMPaths, "pathForSharedSyncWithAccount:streamType:domain:", *(_QWORD *)(a1 + 32), 2, 0, v23));
        v7 = +[BMFileManager fileManagerWithMediatedAccessToDirectory:useCase:domain:user:](BMFileManager, "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:", v6, v25, 0, getuid());
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v9 = objc_claimAutoreleasedReturnValue(+[BMStoreDirectory remoteDevices](BMStoreDirectory, "remoteDevices"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v9));

        v29 = 0;
        LOBYTE(v9) = objc_msgSend(v8, "removeDirectoryAtPath:error:", v10, &v29);
        v11 = v29;
        v12 = v11;
        if ((v9 & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
          v27 = v8;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSUnderlyingErrorKey));
          v15 = v5;
          v16 = v10;
          v17 = objc_msgSend(v14, "code");

          v8 = v27;
          v18 = v17 == (id)2;
          v10 = v16;
          if (!v18)
          {
            v19 = __biome_log_for_category(11);
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "streamIdentifier"));
              v22 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = v23;
              v35 = v21;
              v36 = 2112;
              v37 = v22;
              v38 = 2112;
              v39 = v12;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to delete remotes for stream %@ BM Account %@: %@", buf, 0x20u);

              v8 = v27;
            }

          }
        }

        v4 = (char *)v4 + 1;
      }
      while (v3 != v4);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v3);
  }

}

id sub_1000267D0(id result)
{
  void *v1;
  id v2;

  if (result)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(result, "syncPolicy"));
    v2 = objc_msgSend(v1, "supportsTransport:direction:", 3, 3);

    return v2;
  }
  return result;
}

__CFString *sub_100026870(unint64_t a1)
{
  __CFString *v2;
  uint64_t v3;
  NSObject *v4;

  if (a1 >= 4)
  {
    v3 = __biome_log_for_category(11);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      sub_100043284();

    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %lu)"), a1));
  }
  else
  {
    v2 = off_100069758[a1];
  }
  return v2;
}

uint64_t sub_1000268F8(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("syncRecord")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("zoneVersion")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("highestDeletedLocation")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_100026F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100026F4C(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSMutableSet *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "syncSessionDidStartWithReason:", *(_QWORD *)(a1 + 48));
  v5 = objc_opt_new(NSMutableSet);
  v6 = (void *)WeakRetained[3];
  WeakRetained[3] = v5;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027014;
  v8[3] = &unk_1000694E0;
  v8[4] = WeakRetained;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v7 = v3;
  objc_msgSend(WeakRetained, "fetchChangesWithError:", v8);

}

void sub_100027014(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000270C4;
  v6[3] = &unk_1000694B8;
  v7 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v5 = v7;
  objc_msgSend(v3, "uploadChangesWithError:", v6);

}

void sub_1000270C4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v3, "addObject:");
  if (v7)
    objc_msgSend(v4, "addObject:", v7);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "allObjects"));
  (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "syncSessionDidEnd");

}

void sub_1000272D0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027360;
  block[3] = &unk_100069530;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_sync(v5, block);

}

uint64_t sub_100027360(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100027BF4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "recordIDsToSave"));
  if (objc_msgSend(v4, "count"))
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "recordIDsToDelete"));
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      v17 = *(void **)(a1 + 40);
      v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100027E9C;
      block[3] = &unk_100069530;
      v21 = v3;
      v22 = v17;
      v19 = v3;
      dispatch_sync(v18, block);

      v16 = v22;
      goto LABEL_7;
    }
  }
  v7 = __biome_log_for_category(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "recordIDsToSave"));
    v10 = objc_msgSend(v9, "count");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "recordIDsToDelete"));
    *(_DWORD *)buf = 134218240;
    v27 = v10;
    v28 = 2048;
    v29 = objc_msgSend(v11, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "after modifying changes, we have %lu records to sync and %lu records to delete as a result of error handling", buf, 0x16u);

  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v14 = *(void **)(v12 + 80);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100027E04;
  v23[3] = &unk_100069580;
  v23[4] = v12;
  v24 = v3;
  v25 = v13;
  v15 = v3;
  objc_msgSend(v14, "modifyPendingChangesWithCompletionHandler:", v23);

  v16 = v25;
LABEL_7:

}

void sub_100027E04(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100027E8C;
  v3[3] = &unk_100069530;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  dispatch_sync(v2, v3);

}

uint64_t sub_100027E8C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_100027E9C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10002819C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000281B4(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[8] || !v2[9] || !v2[10])
  {
    v3 = (void *)objc_opt_new(CKContainerOptions);
    objc_msgSend(v3, "setFetchChangesForMergeableValues:", 1);
    v4 = objc_msgSend(objc_alloc((Class)CKContainerID), "initWithContainerIdentifier:environment:", CFSTR("com.apple.biome.sync"), 1);
    v5 = objc_msgSend(objc_alloc((Class)CKContainer), "initWithContainerID:options:", v4, v3);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 64);
    *(_QWORD *)(v6 + 64) = v5;

    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
    {
      v8 = __biome_log_for_category(11);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000434B4();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "handleTransitionToNewMergeableValueRecordValueKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "ckSyncEngineMetaData"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
      {

        v10 = 0;
      }
      v13 = objc_alloc((Class)CKSyncEngineConfiguration);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "privateCloudDatabase"));
      v15 = objc_msgSend(v13, "initWithDatabase:dataSource:metadata:", v14, *(_QWORD *)(a1 + 32), v10);
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 72);
      *(_QWORD *)(v16 + 72) = v15;

      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
      {
        v18 = __biome_log_for_category(11);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_100043488();

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      }

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setAutomaticSyncingEnabled:", 0);
        v20 = objc_msgSend(objc_alloc((Class)CKSyncEngine), "initWithConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
        v21 = *(_QWORD *)(a1 + 32);
        v22 = *(void **)(v21 + 80);
        *(_QWORD *)(v21 + 80) = v20;

        if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
        {
          v23 = __biome_log_for_category(11);
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            sub_10004345C();

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        }
      }
    }

  }
}

void sub_100028428(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = __biome_log_for_category(11);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000434E0();

  }
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "isManateeAvailable:", v5), v6);

}

void sub_100028A74(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deleteCKRecordAtLocation:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_100028D24(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BMStreamCRDTLocation *v15;
  BMStreamCRDTLocation *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  NSObject *v33;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("crdtDeleted")));
  v9 = *(void **)(a1 + 40);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "streamConfigurationForZoneID:", v11));

  if (!objc_msgSend(v8, "isEqual:", &__kCFBooleanFalse))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "resetMetadataForRecord:zoneName:", v4, v7);
    v15 = 0;
    goto LABEL_10;
  }
  if (sub_1000267D0(v12)
    && objc_msgSend(*(id *)(a1 + 40), "isRecordNewerThanMostRecentDeleteForSiteIdentifier:", *(_QWORD *)(a1 + 32)))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "encryptedValues"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "mergeableRecordValueKey"));
    v15 = (BMStreamCRDTLocation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

    if (!v15)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "encryptedValues"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("biomeCRDT")));

      if (v25)
        goto LABEL_20;
      v26 = __biome_log_for_category(11);
      v16 = (BMStreamCRDTLocation *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_FAULT))
        sub_1000435A0();
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
    v27 = 0;
    v16 = (BMStreamCRDTLocation *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v27));
    v17 = v27;
    if (v17)
    {
      v18 = v17;
      v19 = __biome_log_for_category(11);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        v29 = v4;
        v30 = 2114;
        v31 = v7;
        v32 = 2114;
        v33 = v18;
        _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Error encoding serverValue for %{public}@ %{public}@, %{public}@", buf, 0x20u);
      }

LABEL_18:
      goto LABEL_19;
    }

    v15 = v16;
LABEL_10:
    v16 = -[BMStreamCRDTLocation initWithZoneName:recordName:]([BMStreamCRDTLocation alloc], "initWithZoneName:recordName:", v7, v4);
    if (v16)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "insertLocationIfNotExists:withState:", v16, 2));
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "saveCKRecordServerMergeableValue:recordName:zoneName:locationRow:", v15, v4, v7, v18) & 1) == 0)
      {
        v21 = __biome_log_for_category(11);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          sub_100043660();

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "saveSystemFieldsDataForRecord:syncToCloudKit:recordType:crdtDeleted:", *(_QWORD *)(a1 + 32), 0, 1, 0);
    }
    else
    {
      v23 = __biome_log_for_category(11);
      v18 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        sub_100043600();
    }
    goto LABEL_18;
  }
LABEL_21:

  objc_autoreleasePoolPop(v2);
}

void sub_10002914C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "ckZoneForZoneName:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("zoneVersionUUID")));
  if (!v7 || (objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "resetCKRecordsMetaDataAndSetToSyncForZone:", v5))objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "ckZoneSetZoneVersionUUID:forZoneName:", v8, v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "saveSystemFieldsDataForRecord:syncToCloudKit:recordType:crdtDeleted:", *(_QWORD *)(a1 + 32), 0, 2, 0);

  objc_autoreleasePoolPop(v2);
}

void sub_1000292D0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  BMStreamCRDTLocation *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordName"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "highestDeletedLocationForSiteIdentifier:inStream:", v7, v5));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "day"));
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = (uint64_t)v12;

  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("day")));
  v15 = objc_msgSend(v14, "longValue");

  if (v13 < (uint64_t)v15)
  {
    v16 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)v15);
    v17 = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:]([BMStreamCRDTLocation alloc], "initWithStreamName:siteIdentifier:day:", v5, v7, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "distributedSyncManagers"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v5));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "streamCRDT"));
    objc_msgSend(v20, "handleDeletedLocation:deleteCKRecord:", v17, 1);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "ckRecordForRecordName:zoneName:recordType:", v7, v5, 3));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "locationRowWithLocation:", v17));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "saveCKRecordHighestDeletedLocationRow:recordName:zoneName:recordExists:", v22, v7, v5, v21 != 0);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "saveSystemFieldsDataForRecord:syncToCloudKit:recordType:crdtDeleted:", *(_QWORD *)(a1 + 32), 0, 3, 0);

  objc_autoreleasePoolPop(v2);
}

void sub_100029770(_QWORD *a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1[4] + 16), "saveSystemFieldsDataForRecord:syncToCloudKit:recordType:crdtDeleted:", a1[5], 0, 2, 0);
  objc_msgSend(*(id *)(a1[4] + 16), "ckZoneSetZoneVersionUUID:forZoneName:", a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

void sub_10002983C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "saveSystemFieldsDataForRecord:syncToCloudKit:recordType:crdtDeleted:", *(_QWORD *)(a1 + 40), 0, 3, 0);
  objc_autoreleasePoolPop(v2);
}

void sub_1000299B4(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  void **v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  BMStreamCRDTLocation *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*((id *)a1[4] + 2), "saveSystemFieldsDataForRecord:syncToCloudKit:recordType:crdtDeleted:", a1[5], &__kCFBooleanFalse, 1, a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "encryptedValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "mergeableRecordValueKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    v6 = a1 + 7;
    v7 = a1 + 8;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)a1[4] + 2), "ckRecordForRecordName:zoneName:recordType:", a1[7], a1[8], 1));
    v9 = v8;
    if (v8)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[NSObject localMergeableValue](v8, "localMergeableValue"));
      if (v10)
      {
        v12 = (void *)v10;
        v13 = objc_opt_class(CKMergeableRecordValue, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localMergeableValue](v9, "localMergeableValue"));
        v39 = 0;
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v13, v14, &v39));
        v16 = v39;

        if (v16)
        {
          v17 = __biome_log_for_category(11);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            v33 = *v6;
            v34 = *v7;
            *(_DWORD *)buf = 138543874;
            v41 = v33;
            v42 = 2114;
            v43 = v34;
            v44 = 2114;
            v45 = v16;
            _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "handleDidSaveRecordSyncRecord: Unable to unarchive localMergeableValue for %{public}@ %{public}@ %{public}@", buf, 0x20u);
          }

        }
        if (v15)
        {
LABEL_9:
          if ((objc_msgSend(v15, "isEqual:", v5) & 1) == 0)
          {
            v38 = 0;
            objc_msgSend(v15, "mergeRecordValue:error:", v5, &v38);
            v19 = v38;
            if (v19)
            {
              v20 = __biome_log_for_category(11);
              v21 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
              {
                v35 = *v6;
                v36 = *v7;
                *(_DWORD *)buf = 138544130;
                v41 = v5;
                v42 = 2114;
                v43 = v35;
                v44 = 2114;
                v45 = v36;
                v46 = 2114;
                v47 = v19;
                _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Error [localRecordValue mergeRecordValue:serverValue] for serverValue:%{public}@ record:%{public}@ zone:%{public}@ %{public}@", buf, 0x2Au);
              }

            }
            goto LABEL_27;
          }
LABEL_26:
          v19 = 0;
LABEL_27:
          v37 = v19;
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v37));
          v22 = v37;

          if (v22)
          {
            v29 = __biome_log_for_category(11);
            v30 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
              sub_100043858();
          }
          else
          {
            v31 = (void *)*((_QWORD *)a1[4] + 2);
            v32 = -[BMStreamCRDTLocation initWithZoneName:recordName:]([BMStreamCRDTLocation alloc], "initWithZoneName:recordName:", a1[8], a1[7]);
            v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "locationRowWithLocation:", v32));

            objc_msgSend(*((id *)a1[4] + 2), "saveCKRecordLocalMergeableValue:recordName:zoneName:locationRow:", v28, a1[7], a1[8], v30);
          }

          goto LABEL_32;
        }
      }
      else
      {
        v15 = (id)objc_opt_new(CKMergeableRecordValue);
        if (v15)
          goto LABEL_9;
      }
      v26 = __biome_log_for_category(11);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        sub_1000438B8();

      v15 = v5;
      goto LABEL_26;
    }
    v23 = __biome_log_for_category(11);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      sub_1000437F0();

LABEL_21:
    v22 = 0;
LABEL_32:

    goto LABEL_33;
  }
  if ((objc_msgSend(a1[6], "isEqual:", &__kCFBooleanTrue) & 1) == 0)
  {
    v25 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_100043788();
    goto LABEL_21;
  }
  v22 = 0;
LABEL_33:

  objc_autoreleasePoolPop(v2);
}

void sub_10002A154(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "ckZoneForZoneName:", *(_QWORD *)(a1 + 40)));
  if (objc_msgSend(v3, "recoveryState"))
  {
    v4 = objc_autoreleasePoolPush();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "ckZoneSetAttemptingRecoveryForZoneName:state:", *(_QWORD *)(a1 + 40), 0);
    objc_autoreleasePoolPop(v4);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002A240(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "saveCKSyncEngineMetaData:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10002A4B0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  unsigned int v10;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "ckZoneForZoneName:", *(_QWORD *)(a1 + 40)));
  if (objc_msgSend(v3, "recoveryState"))
  {
    v4 = __biome_log_for_category(11);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138543618;
      v8 = v6;
      v9 = 1026;
      v10 = objc_msgSend(v3, "recoveryState");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "failedToSaveRecordZone: %{public}@ and recoveryState:%{public}d", (uint8_t *)&v7, 0x12u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "ckZoneSetAttemptingRecoveryForZoneName:state:", *(_QWORD *)(a1 + 40), 0);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002A710(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_autoreleasePoolPush();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "recordID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "recordID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
  objc_msgSend(v3, "resetMetadataForRecord:zoneName:", v5, v8);

  objc_autoreleasePoolPop(v2);
}

void sub_10002A9D8(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "saveSystemFieldsDataForRecord:syncToCloudKit:recordType:crdtDeleted:", *(_QWORD *)(a1 + 40), 0, 1, 0);
  objc_autoreleasePoolPop(v2);
}

void sub_10002AB00(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  BMStreamCRDTLocation *v34;
  void *v35;
  void *v36;
  void *v37;
  BMStreamCRDTLocation *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CKRecordChangedErrorServerRecordKey));

  if (v4)
  {
    v49 = v2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CKRecordChangedErrorClientRecordKey));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encryptedValues"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "mergeableRecordValueKey"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encryptedValues"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "mergeableRecordValueKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

    v13 = __biome_log_for_category(11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    v47 = v12;
    v48 = v6;
    if (v9)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v55 = v12;
        v56 = 2114;
        v57 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Handling handleFailedToSaveSyncRecordServerRecordChanged: Merging clientCRDT into serverCRDT %{public}@ -> %{public}@", buf, 0x16u);
      }

      if ((objc_msgSend(v9, "isEqual:", v12) & 1) == 0)
      {
        v51 = 0;
        objc_msgSend(v9, "mergeRecordValue:error:", v12, &v51);
        v16 = v51;
        if (v16)
        {
          v17 = v16;
          v18 = __biome_log_for_category(11);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            sub_100043B40();

        }
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        sub_100043AC8((uint64_t *)a1 + 4, v15, v22);

      v9 = v12;
      if (!v9)
      {
        v24 = 0;
        v23 = 0;
LABEL_19:
        v33 = (void *)*((_QWORD *)a1[5] + 2);
        v34 = [BMStreamCRDTLocation alloc];
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "zoneName"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "recordName"));
        v38 = -[BMStreamCRDTLocation initWithZoneName:recordName:](v34, "initWithZoneName:recordName:", v35, v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "locationRowWithLocation:", v38));

        v40 = (void *)*((_QWORD *)a1[5] + 2);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "recordName"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "zoneName"));
        objc_msgSend(v40, "saveCKRecordLocalMergeableValue:recordName:zoneName:locationRow:", v23, v42, v43, v39);

        objc_msgSend(*((id *)a1[5] + 2), "saveSystemFieldsDataForRecord:syncToCloudKit:recordType:crdtDeleted:", v4, &__kCFBooleanFalse, 1, 0);
        v44 = (void *)*((_QWORD *)a1[5] + 10);
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
        v53 = v45;
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
        objc_msgSend(v44, "addRecordIDsToSave:recordIDsToDelete:", v46, 0);

        v21 = v48;
        v2 = v49;
        goto LABEL_20;
      }
    }
    v50 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v50));
    v24 = v50;
    if (v24)
    {
      v25 = __biome_log_for_category(11);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        sub_100043A60((uint64_t)(a1 + 4), v26, v27, v28, v29, v30, v31, v32);

    }
    goto LABEL_19;
  }
  objc_msgSend(*((id *)a1[5] + 2), "saveSystemFieldsDataForRecord:syncToCloudKit:recordType:crdtDeleted:", a1[7], &__kCFBooleanFalse, 1, 0);
  v20 = (void *)*((_QWORD *)a1[5] + 10);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[7], "recordID"));
  v52 = v21;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
  objc_msgSend(v20, "addRecordIDsToSave:recordIDsToDelete:", v9, 0);
LABEL_20:

  objc_autoreleasePoolPop(v2);
}

void sub_10002B0FC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = objc_autoreleasePoolPush();
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "zoneName"));
  objc_msgSend(v3, "handleZoneReset:", v4);

  objc_autoreleasePoolPop(v2);
}

void sub_10002B32C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "saveSystemFieldsDataForRecord:syncToCloudKit:recordType:crdtDeleted:", *(_QWORD *)(a1 + 40), 0, 2, 0);
  objc_autoreleasePoolPop(v2);
}

void sub_10002B480(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "saveSystemFieldsDataForRecord:syncToCloudKit:recordType:crdtDeleted:", *(_QWORD *)(a1 + 40), 0, 3, 0);
  objc_autoreleasePoolPop(v2);
}

void sub_10002B920()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(v3, "handleFailedToSaveRecordSyncRecord:error:", v1, v2);

}

uint64_t sub_10002BA78(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002BA88(uint64_t a1)
{

}

void sub_10002BA90(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  BMStreamCRDTLocation *v20;
  void *v21;
  NSDate *v22;
  BMStreamCRDTLocation *v23;
  void *v24;
  void *v25;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordName"));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoneID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "streamConfigurationForZoneID:", v5));

  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syncIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ckRecordForRecordName:zoneName:recordType:", v3, v8, 3));

  v10 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locationID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "locationRowWithLocationID:", v11));

  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "createCKRecordFromRecordID:newRecord:recordType:", *(_QWORD *)(a1 + 32), 0, 3));
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "location"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "day"));
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (uint64_t)v18));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v19, CFSTR("day"));

    v20 = [BMStreamCRDTLocation alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syncIdentifier"));
    v22 = objc_opt_new(NSDate);
    v23 = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:](v20, "initWithStreamName:siteIdentifier:day:", v21, v3, v22);

    -[BMStreamCRDTLocation secondsUntilExpirationWithStreamConfiguration:](v23, "secondsUntilExpirationWithStreamConfiguration:", v6);
    v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v24, "setExpirationAfterTimeInterval:", v25);

  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002BD78(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init((Class)NSUUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));

  v5 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("zoneVersion"), *(_QWORD *)(a1 + 32));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v4, CFSTR("zoneVersionUUID"));
  objc_autoreleasePoolPop(v2);
}

void sub_10002BFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002BFEC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BMStreamCRDTLocation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  BMStreamCKRecordCRDT *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
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
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  double v50;
  void *v51;
  uint64_t v52;
  unsigned __int8 v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  double v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  void *v63;
  id v64;
  NSObject *v65;
  id v66;
  unsigned __int8 v67;
  uint8_t buf[4];
  double v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  NSObject *v73;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "distributedSyncManagers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

  v5 = -[BMStreamCRDTLocation initWithZoneName:recordName:]([BMStreamCRDTLocation alloc], "initWithZoneName:recordName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "locationRowWithLocation:", v5));
  v7 = v6;
  if (!v6)
  {
    v29 = __biome_log_for_category(11);
    v19 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100043CC0(a1, v19, v30, v31, v32, v33, v34, v35);
    goto LABEL_36;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "streamConfiguration"));
  objc_msgSend(v8, "secondsUntilExpirationWithStreamConfiguration:", v9);
  v11 = v10;

  if (v11 <= 60.0)
  {
    v36 = __biome_log_for_category(11);
    v19 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v37 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134218242;
      v69 = v11;
      v70 = 2114;
      v71 = v37;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "record is almost expired: %f, not saving recordID: %{public}@ because it will be TTL'd", buf, 0x16u);
    }
    goto LABEL_36;
  }
  v67 = 0;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "createCKRecordFromRecordID:newRecord:recordType:", *(_QWORD *)(a1 + 56), &v67, 1));
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v15 = __biome_log_for_category(11);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v69) = v67;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "recordToSaveForRecordID: newRecord? %d", buf, 8u);
    }

    if (v67)
    {
      v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
      objc_msgSend(v17, "setExpirationAfterTimeInterval:", v18);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "isSiriCloudSyncEnabled"))
    {
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "streamCRDT"));
      if (v19)
      {
        v20 = -[BMStreamCKRecordCRDT initWithStreamCRDT:locationRow:database:queue:maxDeltaSize:sessionContext:]([BMStreamCKRecordCRDT alloc], "initWithStreamCRDT:locationRow:database:queue:maxDeltaSize:sessionContext:", v19, v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), +[CKMergeableDelta suggestedDeltaSizeForContainer:](CKMergeableDelta, "suggestedDeltaSizeForContainer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64)), 0);
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v20;

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "ckRecordForRecordName:zoneName:recordType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 1));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localMergeableValue"));
        v63 = v23;
        if (v25)
        {
          v26 = objc_opt_class(CKMergeableRecordValue, v24);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localMergeableValue", v23));
          v66 = 0;
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v26, v23, &v66));
          v28 = v66;
        }
        else
        {
          v27 = (void *)objc_opt_new(CKMergeableRecordValue);
          v28 = 0;
        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v27);
        if (v25)
        {

          v27 = v23;
        }

        if (v28)
        {
          v43 = __biome_log_for_category(11);
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            v60 = *(_QWORD *)(a1 + 40);
            v59 = *(double *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v69 = v59;
            v70 = 2114;
            v71 = v60;
            v72 = 2114;
            v73 = v28;
            _os_log_fault_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, "handleSyncRecordRecordToSaveForRecordID: Unable to unarchive localMergeableValue for %{public}@ %{public}@ %{public}@", buf, 0x20u);
          }

          v45 = objc_opt_new(CKMergeableRecordValue);
          v46 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v47 = *(void **)(v46 + 40);
          *(_QWORD *)(v46 + 40) = v45;

        }
        v48 = __biome_log_for_category(11);
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          *(_DWORD *)buf = 138543362;
          v69 = v50;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "recordValue %{public}@", buf, 0xCu);
        }

        v51 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        v52 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        v65 = v28;
        v53 = objc_msgSend(v51, "addDeltasToSaveFromMergeable:error:", v52, &v65);
        v40 = v65;

        if ((v53 & 1) == 0)
        {
          v54 = __biome_log_for_category(11);
          v55 = objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
          {
            v62 = *(_QWORD *)(a1 + 40);
            v61 = *(double *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v69 = v61;
            v70 = 2114;
            v71 = v62;
            v72 = 2114;
            v73 = v40;
            _os_log_fault_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_FAULT, "Error adding deltas to save for %{public}@ %{public}@ %{public}@", buf, 0x20u);
          }

        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("crdtDeleted"), v63);
        v56 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                           + 40), "encryptedValues"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mergeableRecordValueKey"));
        objc_msgSend(v57, "setObject:forKeyedSubscript:", v56, v58);

      }
      else
      {
        v41 = __biome_log_for_category(11);
        v40 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v42 = *(double *)(a1 + 56);
          *(_DWORD *)buf = 138412290;
          v69 = v42;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "streamCRDT is nil %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v38 = __biome_log_for_category(11);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Sync to iCloud for Siri disabled", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("crdtDeleted"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                             + 40), "encryptedValues"));
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mergeableRecordValueKey"));
      -[NSObject setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", 0, v40);
    }

LABEL_36:
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002C958(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "ckZoneForZoneName:", *(_QWORD *)(a1 + 40)));
  if (objc_msgSend(v3, "recoveryState"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "ckZoneSetAttemptingRecoveryForZoneName:state:", *(_QWORD *)(a1 + 40), 0);

  objc_autoreleasePoolPop(v2);
}

void sub_10002CAE4(_QWORD *a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  id v26;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 16), "ckZoneForZoneName:", a1[5]));
  v4 = objc_msgSend(v3, "recoveryState");
  v5 = __biome_log_for_category(11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4 == 1)
  {
    if (v7)
    {
      v8 = (void *)a1[5];
      v22 = 138543362;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "didDeleteRecordZoneWithID re-creating zone:%{public}@", (uint8_t *)&v22, 0xCu);
    }

    v9 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneName:", a1[5]);
    v10 = *(void **)(a1[4] + 80);
    v26 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    objc_msgSend(v10, "addRecordZonesToSave:recordZoneIDsToDelete:", v11, 0);

    v12 = objc_alloc_init((Class)NSMutableArray);
    v13 = (void *)a1[4];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
    v15 = objc_msgSend(v13, "newZoneVersionRecordIDForZone:", v14);

    objc_msgSend(v12, "addObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 16), "ckRecordsToSyncToCloudKitForZone:", a1[5]));
    if (objc_msgSend(v16, "count"))
    {
      v17 = __biome_log_for_category(11);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = objc_msgSend(v16, "count");
        v20 = a1[5];
        v22 = 134218242;
        v23 = v19;
        v24 = 2114;
        v25 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "didDeleteRecordZoneWithID syncing %lu records for zone:%{public}@", (uint8_t *)&v22, 0x16u);
      }

      objc_msgSend(v12, "addObjectsFromArray:", v16);
    }
    objc_msgSend(*(id *)(a1[4] + 80), "addRecordIDsToSave:recordIDsToDelete:", v12, 0);
    objc_msgSend(*(id *)(a1[4] + 16), "ckZoneSetAttemptingRecoveryForZoneName:state:", a1[5], 2);

  }
  else
  {
    if (v7)
    {
      v21 = (void *)a1[5];
      v22 = 138543362;
      v23 = v21;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "didDeleteRecordZoneWithID not re-creating zone:%{public}@, removing all local records in zone", (uint8_t *)&v22, 0xCu);
    }

    objc_msgSend(*(id *)(a1[4] + 16), "deleteAllCKRecordsInZone:", a1[6]);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002CEAC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_autoreleasePoolPush();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "zoneName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ckZoneForZoneName:", v4));

  if (!objc_msgSend(v5, "recoveryState"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deleteAllCKRecordsInZone:", *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

void sub_10002CFA0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BMStreamCRDTLocation *v8;
  void *v9;
  BMStreamCRDTLocation *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoneID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "distributedSyncManagers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "streamCRDT"));
  v8 = [BMStreamCRDTLocation alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordName"));
  v10 = -[BMStreamCRDTLocation initWithZoneName:recordName:](v8, "initWithZoneName:recordName:", v4, v9);

  if (v7)
  {
    objc_msgSend(v7, "handleDeletedLocation:deleteCKRecord:", v10, 1);
  }
  else
  {
    v11 = __biome_log_for_category(11);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138543362;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "streamCRDT is nil %{public}@", (uint8_t *)&v14, 0xCu);
    }

  }
  objc_autoreleasePoolPop(v2);
}

void sub_10002D344(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002D3B4;
  v5[3] = &unk_100069710;
  v5[4] = v3;
  objc_msgSend(v4, "enumerateRecordsWithBlock:", v5);
  objc_autoreleasePoolPop(v2);
}

void sub_10002D3B4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BMStreamCRDTLocation *v32;
  void *v33;
  void *v34;
  BMStreamCRDTLocation *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  BMStreamCKRecordCRDT *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  BMStreamCRDTLocation *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  BMStreamCRDTLocation *v72;
  void *v73;
  BMStreamCKRecordCRDT *v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  _BYTE *v79;
  uint64_t *v80;
  id v81;
  uint64_t v82;
  _QWORD v83[4];
  id v84;
  uint8_t v85[4];
  BMStreamCRDTLocation *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  id v90;
  _BYTE buf[24];
  NSObject *v92;

  v3 = a2;
  v82 = 0;
  v83[0] = &v82;
  v83[1] = 0x3032000000;
  v83[2] = sub_10002BA78;
  v83[3] = sub_10002BA88;
  v84 = 0;
  v4 = __biome_log_for_category(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordName"));
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "*** recordName:%{public}@", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localMergeableValue"));

  if (v7)
  {
    v9 = objc_opt_class(CKMergeableRecordValue, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localMergeableValue"));
    v81 = 0;
    v11 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v9, v10, &v81));
    v12 = v81;
    v13 = *(void **)(v83[0] + 40);
    *(_QWORD *)(v83[0] + 40) = v11;

    if (v12)
    {
      v14 = __biome_log_for_category(11);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordName"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "streamIdentifier"));
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v17;
        *(_WORD *)&buf[22] = 2114;
        v92 = v12;
        _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "syncEngineDidEndFetchingChanges: Unable to unarchive localMergeableValue for %{public}@ %{public}@ %{public}@", buf, 0x20u);

      }
    }
    else
    {
      v19 = __biome_log_for_category(11);
      v15 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v20 = *(_QWORD *)(v83[0] + 40);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Has a localMergeableValue: %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
    v18 = __biome_log_for_category(11);
    v12 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Has no localMergeableValue", buf, 2u);
    }
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v92) = 0;
  v21 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "streamIdentifier"));
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_10002DD4C;
  v77[3] = &unk_1000696E8;
  v79 = buf;
  v24 = v3;
  v78 = v24;
  v80 = &v82;
  objc_msgSend(v21, "enumerateMergeableRecordValuesForRecordName:zoneName:withBlock:", v22, v23, v77);

  v25 = __biome_log_for_category(11);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      v27 = "YES";
    else
      v27 = "NO";
    *(_DWORD *)v85 = 136446210;
    v86 = (BMStreamCRDTLocation *)v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Were there mergeableRecordValues: %{public}s", v85, 0xCu);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "distributedSyncManagers"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "streamIdentifier"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v29));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "streamCRDT"));

  v32 = [BMStreamCRDTLocation alloc];
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "streamIdentifier"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordName"));
  v35 = -[BMStreamCRDTLocation initWithZoneName:recordName:](v32, "initWithZoneName:recordName:", v33, v34);

  v36 = __biome_log_for_category(11);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v85 = 138543362;
    v86 = v35;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "syncEngineDidEndFetchingChanges location: %{public}@", v85, 0xCu);
  }

  if (v35)
  {
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "locationRowWithLocation:", v35));
    v39 = __biome_log_for_category(11);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v85 = 138543362;
      v86 = (BMStreamCRDTLocation *)v38;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "syncEngineDidEndFetchingChanges locationRow: %{public}@", v85, 0xCu);
    }

    if (v38)
    {
      v41 = +[CKMergeableDelta suggestedDeltaSizeForContainer:](CKMergeableDelta, "suggestedDeltaSizeForContainer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
      v42 = [BMStreamCKRecordCRDT alloc];
      v43 = *(_QWORD **)(a1 + 32);
      v44 = v43[2];
      v45 = v43[6];
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "sessionContext"));
      v74 = -[BMStreamCKRecordCRDT initWithStreamCRDT:locationRow:database:queue:maxDeltaSize:sessionContext:](v42, "initWithStreamCRDT:locationRow:database:queue:maxDeltaSize:sessionContext:", v31, v38, v44, v45, v41, v46);

      v47 = __biome_log_for_category(11);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        v49 = *(BMStreamCRDTLocation **)(v83[0] + 40);
        *(_DWORD *)v85 = 138543362;
        v86 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "recordValue %{public}@", v85, 0xCu);
      }

      v50 = objc_autoreleasePoolPush();
      v51 = *(void **)(v83[0] + 40);
      v76 = 0;
      objc_msgSend(v51, "mergeIntoMergeable:error:", v74, &v76);
      v52 = v76;
      objc_autoreleasePoolPop(v50);
      if (v52)
      {
        v53 = __biome_log_for_category(11);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
        {
          v72 = (BMStreamCRDTLocation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordName"));
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "streamIdentifier"));
          *(_DWORD *)v85 = 138543874;
          v86 = v72;
          v87 = 2114;
          v88 = v73;
          v89 = 2114;
          v90 = v52;
          _os_log_fault_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_FAULT, "Unable to  [recordValue mergeIntoMergeable:recordCRDT] for recordName:%{public}@ site:%{public}@ error:%{public}@", v85, 0x20u);

        }
      }
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation streamName](v35, "streamName"));

      if (*(_QWORD *)(v83[0] + 40))
      {
        v56 = objc_autoreleasePoolPush();
        v57 = *(_QWORD *)(v83[0] + 40);
        v75 = 0;
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v57, 1, &v75));
        v59 = v75;
        objc_autoreleasePoolPop(v56);
        if (v59)
        {
          v60 = __biome_log_for_category(11);
          v61 = objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
            sub_100043DEC((uint64_t)v83, (uint64_t)v59, v61);
        }
        else
        {
          v66 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordName"));
          objc_msgSend(v66, "saveCKRecordLocalMergeableValue:recordName:zoneName:locationRow:", v58, v61, v55, v38);
          v59 = 0;
        }

      }
      else
      {
        v59 = 0;
        v58 = 0;
      }
      v67 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation siteIdentifier](v35, "siteIdentifier"));
      objc_msgSend(v67, "addObject:", v68);

      v69 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordName"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "streamIdentifier"));
      objc_msgSend(v69, "clearCKMergeableRecordValueServerMergeableValuesForRecordName:zoneName:", v70, v71);

    }
    else
    {
      v65 = __biome_log_for_category(11);
      v59 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
        sub_100043D8C();
    }

  }
  else
  {
    v62 = __biome_log_for_category(11);
    v38 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "streamIdentifier"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordName"));
      sub_100043D28(v63, v64, (uint64_t)v85, v38);
    }
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v82, 8);

}

void sub_10002DCB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002DD4C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v3 = a2;
  v24 = 0;
  v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(CKMergeableRecordValue, v4), v3, &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = v24;
  if (v7)
  {
    v8 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_100043F08(a1, (uint64_t)v7, v9);

    v10 = objc_opt_new(CKMergeableRecordValue);
    v6 = (void *)v10;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(_QWORD *)(v11 + 40);
  v12 = (id *)(v11 + 40);
  if (!v13)
    objc_storeStrong(v12, v6);
  v14 = __biome_log_for_category(11);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138543362;
    v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Merging recordValue %{public}@", buf, 0xCu);
  }

  v17 = __biome_log_for_category(11);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Merging serverValue %{public}@", buf, 0xCu);
  }

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isEqual:", v6) & 1) == 0)
  {
    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v23 = v7;
    objc_msgSend(v19, "mergeRecordValue:error:", v6, &v23);
    v20 = v23;

    v7 = v20;
  }
  if (v7)
  {
    v21 = __biome_log_for_category(11);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      sub_100043E64(a1, (uint64_t)v7, v22);

  }
}

void sub_10002E0B8(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v2 = objc_autoreleasePoolPush();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10002BA78;
  v11 = sub_10002BA88;
  v12 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_autoreleasePoolPush();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002E1D4;
  v6[3] = &unk_100069738;
  v6[4] = v4;
  v6[5] = &v7;
  objc_msgSend(v5, "enumerateZonesWithBlock:", v6);
  objc_autoreleasePoolPop(v3);
  if (objc_msgSend((id)v8[5], "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addRecordZonesToSave:recordZoneIDsToDelete:", &__NSArray0__struct, v8[5]);
  _Block_object_dispose(&v7, 8);

  objc_autoreleasePoolPop(v2);
}

void sub_10002E1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002E1D4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "recoveryState") == 1)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
    objc_msgSend(v3, "resetCKRecordsMetaDataAndSetToSyncForZone:", v4);

    v5 = objc_alloc((Class)CKRecordZoneID);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
    v7 = objc_msgSend(v5, "initWithZoneName:ownerName:", v6, CKCurrentUserDefaultName);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);
  }

}

void sub_10002E3BC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_10002E3D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void sub_10002E42C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x20u);
}

uint64_t sub_10002EBDC(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

void sub_10002ED6C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  id v10;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  v10 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataWithError:", &v10));
  v6 = v10;
  if (v6)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (v7)
  {
    v8 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100043FAC((uint64_t)v3, (uint64_t)v6, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

  objc_autoreleasePoolPop(v4);
}

void sub_100030DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100030E0C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  v7 = (id *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_handleRequestID:request:options:responseHandler:", *(_QWORD *)(a1 + 32), v10, v9, v8);

}

void sub_1000335A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000335B8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000335C8(uint64_t a1)
{

}

void sub_1000335D0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSMutableSet *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = v3;
  if (!v4)
  {
    v5 = objc_opt_new(NSMutableSet);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v8;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v4, "addObject:", v3);

}

id sub_100033FB0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isExecuting"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isExecuting"));
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isFinished"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isFinished"));
}

void sub_100034460(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000344E0;
  v4[3] = &unk_100068C78;
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "syncRapportNowIfPolicyAllowsWithReason:activity:completionHandler:", v3, v2, v4);

}

void sub_1000344E0(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000344E8(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

BOOL sub_1000344F0(_BOOL8 result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    v2 = __biome_log_for_category(11);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "syncNowIfPolicyAllowsWithReason: group_notify done", v4, 2u);
    }

    return xpc_activity_set_state(*(xpc_activity_t *)(v1 + 32), 5);
  }
  return result;
}

void sub_100034A80(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 40));
  v7 = __biome_log_for_category(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Rapport syncNowWithCompletionHandler %@, errors: %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(*(id *)(a1[4] + 32), "clearCachedStatements");
  v9 = (id)objc_opt_self(a1[5]);
  v10 = a1[6];
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

void sub_100034EDC(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 40));
  v7 = __biome_log_for_category(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Rapport syncNowWithDevicesCompletionHandler %@, errors: %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(*(id *)(a1[4] + 32), "clearCachedStatements");
  v9 = (id)objc_opt_self(a1[5]);
  v10 = a1[6];
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

void sub_100035120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003513C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10003514C(uint64_t a1)
{

}

void sub_100035154(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lastCloudKitSyncAttemptDate"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_autoreleasePoolPop(v2);
}

void sub_1000353F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100035414(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  void *v11;

  v2 = objc_autoreleasePoolPush();
  if ((objc_msgSend(*(id *)(a1[4] + 32), "open") & 1) == 0)
  {
    v3 = __biome_log_for_category(11);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unable to perform CloudKit sync now, because database is not currently accessible", v10, 2u);
    }

    v5 = objc_msgSend(*(id *)(a1[4] + 32), "state");
    v6 = a1[5];
    if (v6)
    {
      if (v5 == (id)2)
        v7 = 2;
      else
        v7 = 3;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", BMSyncErrorDomain, v7, 0));
      v11 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v9);

    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10003556C(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setLastCloudKitSyncAttemptDate:", v3);

  objc_autoreleasePoolPop(v2);
}

void sub_1000355C4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  NSErrorUserInfoKey v21;
  void *v22;

  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v4 + 16);
    v7 = *(_QWORD *)(a1 + 64);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000357B8;
    v15[3] = &unk_1000697F8;
    v15[4] = v4;
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    objc_msgSend(v6, "syncNowWithReason:activity:completionHandler:", v7, v5, v15);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[BMCloudKitSyncEngine start] failed: %@"), a3));
    v21 = NSLocalizedDescriptionKey;
    v22 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMSyncScheduler"), 1, v9));

    v11 = __biome_log_for_category(11);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    v13 = *(_QWORD *)(a1 + 56);
    if (v13)
    {
      v18 = v10;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
      (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, &__NSArray0__struct, v14);

    }
  }
}

void sub_1000357B8(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = __biome_log_for_category(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CloudKit syncNowWithCompletionHandler %@, errors: %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(*(id *)(a1[4] + 32), "clearCachedStatements");
  v9 = (id)objc_opt_self(a1[5]);
  v10 = a1[6];
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

void sub_1000358C0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "metricsCollector"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sessionContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionID"));
  objc_msgSend(v3, "recordSessionStart:transport:reason:isReciprocal:", v5, 3, 2, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lastCloudKitSyncDate"));
  objc_msgSend(v3, "recordSessionEnd:lastSyncDate:", v6, v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "clearCachedStatements");
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_1000359E4(uint64_t result, int a2)
{
  if (result)
  {
    *(_BYTE *)(result + 32) |= 2u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

uint64_t sub_100035A0C(uint64_t result, int a2)
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xFD | v2;
  }
  return result;
}

uint64_t sub_100035A38(uint64_t result)
{
  if (result)
    return (*(unsigned __int8 *)(result + 32) >> 1) & 1;
  return result;
}

uint64_t sub_100035A50(uint64_t result, double a2)
{
  if (result)
  {
    *(_BYTE *)(result + 32) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_100035A78(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xFE | a2;
  return result;
}

uint64_t sub_100035A98(uint64_t result)
{
  if (result)
    return *(_BYTE *)(result + 32) & 1;
  return result;
}

BOOL sub_100035AB0(_BOOL8 result)
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

uint64_t sub_100035C44(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  unint64_t v13;
  char v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t Data;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t result;

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      v8 = v7 + 1;
      if (v7 == -1 || v8 > *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v9 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      v10 = v5++ >= 9;
      if (v10)
      {
        v6 = 0;
        v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v6 = 0;
LABEL_13:
    if (v11 || (v6 & 7) == 4)
      break;
    v13 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      Data = PBReaderReadData(a2);
      v21 = objc_claimAutoreleasedReturnValue(Data);
      v22 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v21;

    }
    else if ((_DWORD)v13 == 2)
    {
      *(_BYTE *)(a1 + 32) |= 1u;
      v23 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        v24 = *(_QWORD *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
        *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 8;
      }
      else
      {
        *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        v24 = 0;
      }
      *(_QWORD *)(a1 + 8) = v24;
    }
    else if ((_DWORD)v13 == 1)
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_BYTE *)(a1 + 32) |= 2u;
      while (1)
      {
        v17 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          break;
        v19 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
        *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18;
        v16 |= (unint64_t)(v19 & 0x7F) << v14;
        if ((v19 & 0x80) == 0)
          goto LABEL_34;
        v14 += 7;
        v10 = v15++ >= 9;
        if (v10)
        {
          LODWORD(v16) = 0;
          goto LABEL_36;
        }
      }
      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_34:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
        LODWORD(v16) = 0;
LABEL_36:
      *(_DWORD *)(a1 + 16) = v16;
    }
    else
    {
      result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result)
        return result;
    }
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100035F84(uint64_t a1, void *a2)
{
  _DWORD *v3;
  char v4;
  void *v5;
  _DWORD *v6;

  v3 = a2;
  if (a1)
  {
    v4 = *(_BYTE *)(a1 + 32);
    if ((v4 & 2) != 0)
    {
      v3[4] = *(_DWORD *)(a1 + 16);
      *((_BYTE *)v3 + 32) |= 2u;
      v4 = *(_BYTE *)(a1 + 32);
    }
    if ((v4 & 1) != 0)
    {
      *((_QWORD *)v3 + 1) = *(_QWORD *)(a1 + 8);
      *((_BYTE *)v3 + 32) |= 1u;
    }
    v5 = *(void **)(a1 + 24);
    if (v5)
    {
      v6 = v3;
      sub_100036024((uint64_t)v3, v5);
      v3 = v6;
    }
  }

}

void sub_100036024(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

void sub_1000362AC(uint64_t a1, void *a2)
{
  _BYTE *v3;
  char v4;
  void *v5;
  _BYTE *v6;

  v3 = a2;
  if (a1)
  {
    v4 = v3[32];
    if ((v4 & 2) != 0)
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
      *(_BYTE *)(a1 + 32) |= 2u;
      v4 = v3[32];
    }
    if ((v4 & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = *((_QWORD *)v3 + 1);
      *(_BYTE *)(a1 + 32) |= 1u;
    }
    v5 = (void *)*((_QWORD *)v3 + 3);
    if (v5)
    {
      v6 = v3;
      objc_storeStrong((id *)(a1 + 24), v5);
      v3 = v6;
    }
  }

}

uint64_t sub_100036350(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

double sub_100036364(uint64_t a1)
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

uint64_t sub_100036380(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

uint64_t sub_1000363A8()
{
  return 28;
}

CFStringRef sub_1000363B0()
{
  return (id)CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, aCreateTableMet, 0x8000100u, kCFAllocatorNull);
}

id sub_1000363EC()
{
  BMSyncDatabaseSQLStatementMigration *v0;
  BMSyncDatabaseCustomFunctionMigration *v1;
  BMSyncDatabaseSQLStatementMigration *v2;
  BMSyncDatabaseSQLStatementMigration *v3;
  BMSyncDatabaseSQLStatementMigration *v4;
  BMSyncDatabaseSQLStatementMigration *v5;
  BMSyncDatabaseSQLStatementMigration *v6;
  BMSyncDatabaseSQLStatementMigration *v7;
  BMSyncDatabaseCustomFunctionMigration *v8;
  void *v9;
  BMSyncDatabaseSQLStatementMigration *v11;
  BMSyncDatabaseSQLStatementMigration *v12;
  BMSyncDatabaseSQLStatementMigration *v13;
  BMSyncDatabaseCustomFunctionMigration *v14;
  _QWORD v15[14];
  _QWORD v16[14];

  v15[0] = &off_10006EB28;
  v14 = -[BMSyncDatabaseCustomFunctionMigration initWithCustomFunctionName:]([BMSyncDatabaseCustomFunctionMigration alloc], "initWithCustomFunctionName:", CFSTR("migration_StarSkySchema11ToSydRoSchema12"));
  v16[0] = v14;
  v15[1] = &off_10006EB40;
  v13 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]([BMSyncDatabaseSQLStatementMigration alloc], "initWithSQLStatements:", &off_10006E948);
  v16[1] = v13;
  v15[2] = &off_10006EB58;
  v12 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]([BMSyncDatabaseSQLStatementMigration alloc], "initWithSQLStatements:", &off_10006E960);
  v16[2] = v12;
  v15[3] = &off_10006EB70;
  v11 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]([BMSyncDatabaseSQLStatementMigration alloc], "initWithSQLStatements:", &off_10006E978);
  v16[3] = v11;
  v15[4] = &off_10006EB88;
  v0 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]([BMSyncDatabaseSQLStatementMigration alloc], "initWithSQLStatements:", &off_10006E990);
  v16[4] = v0;
  v16[5] = &__NSArray0__struct;
  v15[5] = &off_10006EBA0;
  v15[6] = &off_10006EBB8;
  v1 = -[BMSyncDatabaseCustomFunctionMigration initWithCustomFunctionName:]([BMSyncDatabaseCustomFunctionMigration alloc], "initWithCustomFunctionName:", CFSTR("migration_Schema20ToSchema21"));
  v16[6] = v1;
  v15[7] = &off_10006EBD0;
  v2 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]([BMSyncDatabaseSQLStatementMigration alloc], "initWithSQLStatements:", &off_10006E9A8);
  v16[7] = v2;
  v15[8] = &off_10006EBE8;
  v3 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]([BMSyncDatabaseSQLStatementMigration alloc], "initWithSQLStatements:", &off_10006E9C0);
  v16[8] = v3;
  v15[9] = &off_10006EC00;
  v4 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]([BMSyncDatabaseSQLStatementMigration alloc], "initWithSQLStatements:", &off_10006E9D8);
  v16[9] = v4;
  v15[10] = &off_10006EC18;
  v5 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]([BMSyncDatabaseSQLStatementMigration alloc], "initWithSQLStatements:", &off_10006E9F0);
  v16[10] = v5;
  v15[11] = &off_10006EC30;
  v6 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]([BMSyncDatabaseSQLStatementMigration alloc], "initWithSQLStatements:", &off_10006EA08);
  v16[11] = v6;
  v15[12] = &off_10006EC48;
  v7 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]([BMSyncDatabaseSQLStatementMigration alloc], "initWithSQLStatements:", &off_10006EA20);
  v16[12] = v7;
  v15[13] = &off_10006EC60;
  v8 = -[BMSyncDatabaseCustomFunctionMigration initWithCustomFunctionName:]([BMSyncDatabaseCustomFunctionMigration alloc], "initWithCustomFunctionName:", CFSTR("migration_Schema27ToSchema28"));
  v16[13] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 14));

  return v9;
}

void sub_1000378F8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_100037918(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1000378CCLL);
}

void sub_100037DE4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

BOOL sub_100038EF8(uint64_t a1)
{
  _BOOL4 should_defer;

  should_defer = xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
  if (should_defer)
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  return !should_defer;
}

void sub_100039DE4(id a1)
{
  BMDateFormatterVendor *v1;
  void *v2;

  v1 = objc_opt_new(BMDateFormatterVendor);
  v2 = (void *)qword_10007BE78;
  qword_10007BE78 = (uint64_t)v1;

}

void sub_10003ADAC(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  int v10;
  id v11;
  id v12;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "FMDBUserVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(".")));
  v3 = objc_msgSend(v2, "count");

  if ((unint64_t)v3 > 2)
  {
    v6 = v1;
  }
  else
  {
    do
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "stringByAppendingString:", CFSTR(".0")));

      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(".")));
      v5 = objc_msgSend(v4, "count");

      v6 = v11;
      v1 = v11;
    }
    while ((unint64_t)v5 < 3);
  }
  v12 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(".")));
  for (i = 0; i != 3; ++i)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", i));
    v10 = objc_msgSend(v9, "intValue");

    if (v10 >= 16)
    {
      NSLog(CFSTR("FMDBVersion is invalid: Please use FMDBUserVersion instead."));
      v10 = 15;
    }
    dword_10007BE90 = v10 | (16 * dword_10007BE90);
  }

}

uint64_t sub_10003B21C(void *a1, int a2)
{
  double *v3;
  double v4;
  double v5;
  double v6;
  uint32_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if (a2)
  {
    v5 = v4 - v3[3];
    objc_msgSend(v3, "maxBusyRetryTimeInterval");
    if (v5 >= v6)
    {
      v10 = 0;
      goto LABEL_8;
    }
    v7 = arc4random_uniform(0x32u);
    v8 = v7 + 50;
    v9 = sqlite3_sleep(v7 + 50);
    if ((_DWORD)v9 != (_DWORD)v8)
      NSLog(CFSTR("WARNING: Requested sleep of %i milliseconds, but SQLite returned %i. Maybe SQLite wasn't built with HAVE_USLEEP=1?"), v8, v9);
  }
  else
  {
    v3[3] = v4;
  }
  v10 = 1;
LABEL_8:

  return v10;
}

BOOL sub_10003B6C8(id a1, _bmFMStatement *a2, BOOL *a3)
{
  BOOL result;

  result = !-[_bmFMStatement inUse](a2, "inUse");
  *a3 = result;
  return result;
}

void *sub_10003CEBC(void *result, int a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  if (result)
  {
    v7 = objc_retainBlock(result);
    v8 = a2;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", a2));
    if (a2 >= 1)
    {
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *a4));
        if (*a3)
          v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
        else
          v11 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        v12 = (void *)v11;
        if (!v11)
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v9, "setObject:forKey:", v12, v10);

        ++a3;
        ++a4;
        --v8;
      }
      while (v8);
    }
    v13 = v7[2](v7, v9);

    return (void *)v13;
  }
  return result;
}

void sub_10003D848(sqlite3_context *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void (**v8)(id, sqlite3_context *, uint64_t, uint64_t);

  v6 = sqlite3_user_data(a1);
  v8 = (void (**)(id, sqlite3_context *, uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(v6);
  if (v8)
  {
    v7 = objc_autoreleasePoolPush();
    v8[2](v8, a1, a2, a3);
    objc_autoreleasePoolPop(v7);
  }

}

void sub_10003DD90()
{
  __assert_rtn("-[_bmFMDatabase initWithPath:]", "FMDatabase.m", 73, "sqlite3_threadsafe()");
}

void sub_10003DDB8(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1, a2, CFSTR("FMDatabase.m"), 550, CFSTR("The _bmFMDatabase %@ is currently in use."), a2);

  abort();
}

void sub_10003DE14(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1, a2, CFSTR("FMDatabase.m"), 564, CFSTR("The _bmFMDatabase %@ is not open."), a2);

  abort();
}

void sub_10003DE70(void *a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = objc_msgSend(a1, "lastErrorCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lastErrorMessage"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FMDatabase.m"), 875, CFSTR("DB Error: %d \"%@\""), v5, v6);

  abort();
}

void sub_10003DEF4(void *a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lastErrorMessage"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FMDatabase.m"), 1351, CFSTR("%@"), v5);

  abort();
}

id sub_10003FCDC(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("Database already in pool"), CFSTR("The _bmFMDatabase being put back into the pool is already present in the pool"), 0));
    objc_msgSend(v2, "raise");

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

void sub_10003FDF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003FE10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10003FE20(uint64_t a1)
{

}

void sub_10003FE28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastObject"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(_QWORD *)(v7 + 40);
  if (v8)
  {
    objc_msgSend(*(id *)(v6 + 24), "addObject:", *(_QWORD *)(v7 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeLastObject");
  }
  else
  {
    if (*(_QWORD *)(v6 + 56))
    {
      v9 = (char *)objc_msgSend(*(id *)(v6 + 24), "count");
      v10 = &v9[(_QWORD)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count")];
      v6 = *(_QWORD *)(a1 + 32);
      if ((unint64_t)v10 >= *(_QWORD *)(v6 + 56))
      {
        NSLog(CFSTR("Maximum number of databases (%ld) has already been reached!"), v10);
        return;
      }
    }
    v11 = objc_msgSend(objc_msgSend((id)objc_opt_class(v6, v5), "databaseClass"), "databaseWithPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "openWithFlags:vfs:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v16 = *(_QWORD *)(a1 + 32);
  if (!v15)
  {
    NSLog(CFSTR("Could not open up the database at path %@"), *(_QWORD *)(v16 + 40));
LABEL_17:
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;

    return;
  }
  if ((objc_opt_respondsToSelector(*(_QWORD *)(v16 + 48), "databasePool:shouldAddDatabaseToPool:") & 1) != 0
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "databasePool:shouldAddDatabaseToPool:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "close");
    goto LABEL_17;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    if (!v8
      && (objc_opt_respondsToSelector(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), "databasePool:didAddDatabase:") & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "databasePool:didAddDatabase:");
    }
  }
}

void sub_1000400A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000400B8(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100040174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10004018C(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100040248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100040260(uint64_t a1)
{
  char *v2;
  id result;

  v2 = (char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = &v2[(_QWORD)result];
  return result;
}

id sub_1000402F8(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

void sub_100040AB4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "close");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

void sub_100040C5C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (objc_msgSend(v2, "hasOpenResultSets"))
    NSLog(CFSTR("Warning: there is at least one open result set around after performing [_bmFMDatabaseQueue inDatabase:]"));

}

void sub_100040D48(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v8 = 0;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
    objc_msgSend(v3, "beginImmediateTransaction");
  }
  else if (v2 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
    objc_msgSend(v3, "beginDeferredTransaction");
  }
  else
  {
    if (v2)
      goto LABEL_8;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
    objc_msgSend(v3, "beginTransaction");
  }

LABEL_8:
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
  (*(void (**)(uint64_t, void *, unsigned __int8 *))(v4 + 16))(v4, v5, &v8);

  LODWORD(v4) = v8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
  v7 = v6;
  if ((_DWORD)v4)
    objc_msgSend(v6, "rollback");
  else
    objc_msgSend(v6, "commit");

}

uint64_t sub_100040F2C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100040F3C(uint64_t a1)
{

}

void sub_100040F44(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id obj;
  char v17;

  v2 = objc_alloc((Class)NSString);
  v3 = qword_10007BEA8++;
  v4 = objc_msgSend(v2, "initWithFormat:", CFSTR("savePoint%ld"), v3);
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v5, "startSavePointWithName:error:", v4, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
    (*(void (**)(uint64_t, void *, char *))(v8 + 16))(v8, v9, &v17);

    if (v17)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(id *)(v11 + 40);
      objc_msgSend(v10, "rollbackToSavePointWithName:error:", v4, &v15);
      objc_storeStrong((id *)(v11 + 40), v15);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(id *)(v13 + 40);
    objc_msgSend(v12, "releaseSavePointWithName:error:", v4, &v14);
    objc_storeStrong((id *)(v13 + 40), v14);

  }
}

void sub_100041198(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "database"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "checkpoint:name:logFrameCount:checkpointCount:error:", *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

void sub_100041268()
{
  __assert_rtn("-[_bmFMDatabaseQueue inDatabase:]", "FMDatabaseQueue.m", 185, "currentSyncQueue != self && \"inDatabase: was called reentrantly on the same queue, which would lead to a deadlock\"");
}

void sub_100041290(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BMRapportClient[%@]: invalidated", (uint8_t *)&v3, 0xCu);
}

void sub_100041308(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "BMRapportClient[%@]: Must be inactive before creating and activating companion link client", (uint8_t *)&v3, 0xCu);
}

void sub_100041380(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "locationRow is nil, returning empty state vector", v1, 2u);
}

void sub_1000413C0(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a2 = 0;
  sub_100006D04((void *)&_mh_execute_header, a3, (uint64_t)a3, "BMStreamCKRecordCRDT: failed to calculate batch size with error %@", a1);
}

void sub_1000413FC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = 0;
  sub_100006D04((void *)&_mh_execute_header, a1, a3, "BMStreamCKRecordCRDT: failed to split atom batch with error %@", (uint8_t *)&v3);
}

void sub_10004146C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unexpected modifier %lu", (uint8_t *)&v2, 0xCu);
}

void sub_1000414E0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "BMMultiStreamVectorClockConverter found nil modifier on siteIdentifier: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100041554(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  id v7;

  v7 = objc_msgSend(a2, "count");
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_fault_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_FAULT, "Expected only one value in indexSet of timestampClockVector, found %lu", a1, 0xCu);
}

void sub_1000415BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000093D8((void *)&_mh_execute_header, a1, a3, "sessionContext is nil", a5, a6, a7, a8, 0);
}

void sub_1000415F0()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000097FC();
  sub_1000097E8((void *)&_mh_execute_header, v0, v1, "BMCoordinationXPCSyncEventReporter: stream %@: failed to notify coordination service of changes: %@");
}

void sub_100041654()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000097FC();
  sub_1000097E8((void *)&_mh_execute_header, v0, v1, "BMCoordinationXPCSyncEventReporter: stream %@: failed to notify coordination service of user deletions: %@");
}

void sub_1000416B8()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10000F330();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v0, "siteSuffix"));
  sub_10000F318();
  sub_10000F2F4((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: fetchAtomBatchRequest is nil, skip sending request to device: %@", v4, v5, v6, v7, v8);

  sub_10000F308();
}

void sub_100041738()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  sub_10000F330();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "siteSuffix"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "account"));
  sub_10000F2F4((void *)&_mh_execute_header, v3, v4, "BMRapportSyncEngine%@: unable to create a sync manager for account %@", v5, v6, v7, v8, 2u);

  sub_10000F308();
}

void sub_1000417D8()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_10000F330();
  v1 = objc_msgSend((id)sub_10000F354(v0), "siteSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000F318();
  sub_10000F2F4((void *)&_mh_execute_header, v3, v4, "BMRapportSyncEngine%@: unable to determine sender model info: %@", v5, v6, v7, v8, v9);

  sub_10000F308();
}

void sub_100041854()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_10000F330();
  v1 = objc_msgSend((id)sub_10000F354(v0), "siteSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000F33C();
  sub_10000F2F4((void *)&_mh_execute_header, v3, v4, "BMRapportSyncEngine%@: unable to determine platform for model %{public}@", v5, v6, v7, v8, v9);

  sub_10000F308();
}

void sub_1000418D0()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_10000F330();
  v1 = objc_msgSend((id)sub_10000F354(v0), "siteSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000F318();
  sub_10000F2F4((void *)&_mh_execute_header, v3, v4, "BMRapportSyncEngine%@: rejecting request from communal device to sync outside home %@", v5, v6, v7, v8, v9);

  sub_10000F308();
}

void sub_10004194C()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10000F330();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v0, "siteSuffix"));
  sub_10000F33C();
  sub_10000F2F4((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: unable to create sync manager for %{public}@", v4, v5, v6, v7, v8);

  sub_10000F308();
}

void sub_1000419CC()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_10000F330();
  v1 = objc_msgSend((id)sub_10000F354(v0), "siteSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000F318();
  sub_10000F2F4((void *)&_mh_execute_header, v3, v4, "BMRapportSyncEngine%@: rejecting request from personal device to sync cross account %@", v5, v6, v7, v8, v9);

  sub_10000F308();
}

void sub_100041A48()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10000F330();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "siteSuffix"));
  sub_10000F33C();
  sub_10000F2F4((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: unable to create sync manager for %{public}@", v4, v5, v6, v7, v8);

  sub_10000F308();
}

void sub_100041AC4()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10000F330();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "siteSuffix"));
  sub_10000F318();
  sub_10000F2F4((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: fetchAtomBatchRequest is nil, skip sending request to device: %@", v4, v5, v6, v7, v8);

  sub_10000F308();
}

void sub_100041B40()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10000F330();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "siteSuffix"));
  sub_10000F318();
  sub_10000F2F4((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: createDistributedSyncManagerFromOptions unable to determine sender account info: %@", v4, v5, v6, v7, v8);

  sub_10000F308();
}

void sub_100041BBC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to access sync resources with error %@", (uint8_t *)&v2, 0xCu);
}

void sub_100041C30(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A04((void *)&_mh_execute_header, a2, a3, "BMRapportDiscoveryManager: skipping RPCompanionLinkDevice missing identifier: %@", a5, a6, a7, a8, 2u);
}

void sub_100041C98(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A04((void *)&_mh_execute_header, a2, a3, "BMRapportDiscoveryManager: skipping RPCompanionLinkDevice missing model: %@", a5, a6, a7, a8, 2u);
}

void sub_100041D00(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint8_t v7[24];

  v4 = (objc_class *)objc_opt_class(a1, a2);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000F318();
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@ - has validStreamNames: %@", v7, 0x16u);

  sub_10000F308();
}

void sub_100041D94(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint8_t v7[24];

  v4 = (objc_class *)objc_opt_class(a1, a2);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000F318();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@ could not archive state vector: %@", v7, 0x16u);

  sub_10000F308();
}

void sub_100041E28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A04((void *)&_mh_execute_header, a1, a3, "Tried to defer activity %s, but failed", a5, a6, a7, a8, 2u);
  sub_10001350C();
}

void sub_100041E98(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100013514((void *)&_mh_execute_header, a2, a3, "Received unexpected object on com.apple.notifyd.matching: %@", a5, a6, a7, a8, 2u);
  sub_10001350C();
}

void sub_100041EFC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100013514((void *)&_mh_execute_header, a2, a3, "Received unexpected object on com.apple.rapport.matching: %@", a5, a6, a7, a8, 2u);
  sub_10001350C();
}

void sub_100041F60(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A04((void *)&_mh_execute_header, a2, a3, "Tried to defer activity %s, but failed", a5, a6, a7, a8, 2u);
  sub_10001350C();
}

void sub_100041FC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A04((void *)&_mh_execute_header, a1, a3, "Tried to defer activity %s, but failed", a5, a6, a7, a8, 2u);
  sub_10001350C();
}

void sub_100042038()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_10001990C((void *)&_mh_execute_header, v0, v1, "adding %@ to atomBatch", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100042098()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000093D8((void *)&_mh_execute_header, v0, v1, "failed to batch ingest deletions", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_1000420C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000093D8((void *)&_mh_execute_header, v0, v1, "failed to batch ingest changes", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_1000420F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "failed to delete atoms with location: %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100042150()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "populateAndEnumerateAtomBatches could not finish writing atomBatch with err: %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_1000421B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_10001990C((void *)&_mh_execute_header, v0, v1, "Populating atom batch with record %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100042210()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "could not create new batch with location %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100042270()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000198DC();
  sub_1000198E8((void *)&_mh_execute_header, v0, v1, "failed to delete event at bookmark %@", v2);
  sub_10001350C();
}

void sub_1000422D4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mergeableValueID"));
  sub_1000198DC();
  sub_1000198E8((void *)&_mh_execute_header, a2, v4, "location is unexpectedly nil, unable to parse from mergeableValueID %@", v5);

}

void sub_10004235C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000198FC((void *)&_mh_execute_header, v0, v1, "location is unexpectedly nil", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_100042388(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "storing atom batches operations failed to commit transactions", buf, 2u);
}

void sub_1000423C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000093D8((void *)&_mh_execute_header, v0, v1, "storing atom batches failed to commit transaction during operation, stopping early", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_1000423F0(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bm_description"));
  v8 = sub_1000250CC((unint64_t)objc_msgSend(a1, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = *(_QWORD *)(*(_QWORD *)a2 + 16);
  v11 = 138413058;
  v12 = v7;
  v13 = 2112;
  v14 = v9;
  v15 = 2112;
  v16 = v10;
  v17 = 2112;
  v18 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to insert record for atom: %@ (%@), stream: %@, record: %@", (uint8_t *)&v11, 0x2Au);

}

void sub_1000424E8(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[14];
  void *v11;
  __int16 v12;
  uint64_t v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bm_description"));
  v6 = sub_1000250CC((unint64_t)objc_msgSend(a1, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "valueData"));
  objc_msgSend(v8, "length");
  sub_100019940();
  v11 = v7;
  v12 = 2048;
  v13 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Received atom: %@ (%@), size: %llu", v10, 0x20u);

}

void sub_1000425DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000198FC((void *)&_mh_execute_header, v0, v1, "causalReference location is unexpectedly nil", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_100042608()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000198DC();
  sub_1000198E8((void *)&_mh_execute_header, v0, v1, "failed to insert referenceLocationRow for location %@", v2);
  sub_10001350C();
}

void sub_10004266C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "failed to update row: %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_1000426CC(void *a1, NSObject *a2)
{
  void *v2;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint8_t v8[24];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "timestamp"));
  objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bm_description"));
  v5 = sub_100019954();
  v6 = sub_1000250CC((unint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_10001991C();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to apply atom %@ (%@) to disk", v8, 0x16u);

  sub_10000F308();
}

void sub_10004277C(void *a1, NSObject *a2)
{
  void *v2;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint8_t v8[24];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "timestamp"));
  objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bm_description"));
  v5 = sub_100019954();
  v6 = sub_1000250CC((unint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_10001991C();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Applying atom to disk: %@ (%@)", v8, 0x16u);

  sub_10000F308();
}

void sub_10004282C(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint8_t v15[14];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bm_description"));
  v8 = sub_1000250CC((unint64_t)objc_msgSend(a1, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "timestamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bm_description"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "referenceLocation"));
  sub_100019940();
  v16 = v9;
  v17 = v13;
  v18 = v11;
  v19 = v13;
  v20 = a1;
  v21 = v13;
  v22 = v14;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "causal reference violation: %@ -(%@)-> %@\nAtom: %@\nReference location: %@", v15, 0x34u);

}

void sub_100042958(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A04((void *)&_mh_execute_header, a2, a3, "Failed to activate requests manager %@", a5, a6, a7, a8, 2u);
}

void sub_1000429C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A04((void *)&_mh_execute_header, a2, a3, "Failed to activate discovery manager %@", a5, a6, a7, a8, 2u);
}

void sub_100042A28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000198FC((void *)&_mh_execute_header, v0, v1, "sendRequest:request:device:options:responseHandler: passed nil device", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_100042A54()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100019934();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "handleActivationForDevice:error: passed nil device", v1, 2u);
  sub_1000198F4();
}

void sub_100042A8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000198FC((void *)&_mh_execute_header, v0, v1, "sendNextRequestToDevice: passed nil device", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_100042AB8(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "shortenedRapportIdentifier"));
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "BMRapportDevice[%@]: expected request id and response handler in %@", (uint8_t *)&v6, 0x16u);

}

void sub_100042B68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000198FC((void *)&_mh_execute_header, v0, v1, "finishedSendingRequestsToDevice: passed nil device", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_100042B94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100013514((void *)&_mh_execute_header, v0, v1, "failed to unarchive BMMultiStreamVectorClock with error %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100042BF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100013514((void *)&_mh_execute_header, v0, v1, "failed to archive BMMultiStreamVectorClock with error %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100042C54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100013514((void *)&_mh_execute_header, v0, v1, "failed to unarchive BMMultiStreamAtomBatches with error %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100042CB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100013514((void *)&_mh_execute_header, v0, v1, "failed to archive BMMultiStreamAtomBatches with error %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100042D14(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "lastErrorMessage"));
  sub_1000198DC();
  sub_1000211A0((void *)&_mh_execute_header, v2, v3, "Failed to insert: %@", v4, v5, v6, v7, v8);

  sub_1000211B4();
}

void sub_100042D90(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "lastErrorMessage"));
  sub_1000198DC();
  sub_1000211A0((void *)&_mh_execute_header, v2, v3, "Failed to update: %@", v4, v5, v6, v7, v8);

  sub_1000211B4();
}

void sub_100042E0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "clock vector is empty %@", v2, v3, v4, v5, v6);
}

void sub_100042E70()
{
  uint64_t v0;
  os_log_t v1;

  sub_100022EC8();
  sub_1000097E8((void *)&_mh_execute_header, v0, v1, "BMRapportManager[%@]: skipping RPCompanionLinkDevice missing identifier: %@");
  sub_10001350C();
}

void sub_100042EE0()
{
  uint64_t v0;
  os_log_t v1;

  sub_100022EC8();
  sub_1000097E8((void *)&_mh_execute_header, v0, v1, "BMRapportManager[%@]: skipping RPCompanionLinkDevice missing model: %@");
  sub_10001350C();
}

void sub_100042F50()
{
  uint64_t v0;
  os_log_t v1;

  sub_100022EC8();
  sub_1000097E8((void *)&_mh_execute_header, v0, v1, "BMRapportManager[%@]: skipping RPCompanionLinkDevice failed validation: %@");
  sub_10001350C();
}

void sub_100042FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (objc_class *)sub_100025E24(a1, a2, a3, a4);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_1000198DC();
  sub_1000211A0((void *)&_mh_execute_header, v7, v8, "%@: tried to initialize a BMPBSyncAtomValue proto, missing type or value", v9, v10, v11, v12, v13);

  sub_1000211B4();
}

void sub_100043038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (objc_class *)sub_100025E24(a1, a2, a3, a4);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_1000198DC();
  sub_1000211A0((void *)&_mh_execute_header, v7, v8, "%@: tried to initialize with a non-BMPBSyncAtomValue proto", v9, v10, v11, v12, v13);

  sub_1000211B4();
}

void sub_1000430B0()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_1000198DC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "cannot deserialize atom value of version %lu", v1, 0xCu);
}

void sub_100043120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (objc_class *)sub_100025E24(a1, a2, a3, a4);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_1000198DC();
  sub_1000211A0((void *)&_mh_execute_header, v7, v8, "%@: tried to initialize a BMPBStoreEventAtomValue proto: missing dataVersion or dataTimestamp", v9, v10, v11, v12, v13);

  sub_1000211B4();
}

void sub_100043198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (objc_class *)sub_100025E24(a1, a2, a3, a4);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_1000198DC();
  sub_1000211A0((void *)&_mh_execute_header, v7, v8, "%@: tried to initialize with a non-BMPBStoreEventAtomValue proto", v9, v10, v11, v12, v13);

  sub_1000211B4();
}

void sub_100043210(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "failed to open database for account: %@", a1, 0xCu);

}

void sub_100043284()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100013514((void *)&_mh_execute_header, v0, v1, "unknown value in BMCloudKitRecordTypeString: %lu", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_1000432E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000093D8((void *)&_mh_execute_header, v0, v1, "unable to obtain Manatee accountInfo", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_100043310()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "iCloud account status: %ld", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100043370()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "CloudKit container is not accessible. Status: %ld", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_1000433D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "iCloud account doesn't support end-to-end encryption: %ld", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100043430()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000093D8((void *)&_mh_execute_header, v0, v1, "account status is CKAccountStatusTemporarilyUnavailable", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_10004345C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000093D8((void *)&_mh_execute_header, v0, v1, "unable to initialize ckSyncEngine", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_100043488()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000093D8((void *)&_mh_execute_header, v0, v1, "unable to initialize CloudKit configuration", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_1000434B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100019934();
  sub_1000093D8((void *)&_mh_execute_header, v0, v1, "unable to initialize CloudKit container", v2, v3, v4, v5, v6);
  sub_1000198F4();
}

void sub_1000434E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "accountInfoWithCompletionHandler returned error: %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100043540()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100013514((void *)&_mh_execute_header, v0, v1, "isRecordNewerThanMostRecentDeleteForSiteIdentifier: Could not create location from CKRecord: %{public}@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_1000435A0()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002E3DC();
  sub_10002E3BC((void *)&_mh_execute_header, v0, v1, "Error serverValue is nil for delta %{public}@ %{public}@");
  sub_10001350C();
}

void sub_100043600()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002E3DC();
  sub_10002E3BC((void *)&_mh_execute_header, v0, v1, "handleSyncRecordDidFetchRecord: Can't build location from record stream:%{public}@ recordName:%{public}@");
  sub_10001350C();
}

void sub_100043660()
{
  __int16 v0;
  NSObject *v1;
  uint8_t v2[22];
  __int16 v3;
  uint64_t v4;

  sub_10002E3DC();
  v3 = v0;
  v4 = 0;
  sub_10002E42C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Error saving [saveCKRecordServerMergeableValue:serverValueData] for %{public}@ %{public}@, %{public}@", v2);
}

void sub_1000436D4(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "recordID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "recordType"));
  v8 = 138543618;
  v9 = v5;
  sub_10002E438();
  sub_10002E3D0((void *)&_mh_execute_header, a2, v7, "didFetchRecord: unknown record %{public}@ type: %{public}@", (uint8_t *)&v8);

  sub_10000F308();
}

void sub_100043788()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002E3F4();
  sub_10002E3D0((void *)&_mh_execute_header, v0, v1, "handleDidSaveRecordSyncRecord: serverValue nil for %{public}@ %{public}@", v2);
  sub_10001350C();
}

void sub_1000437F0()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002E3F4();
  sub_10002E3BC((void *)&_mh_execute_header, v0, v1, "handleDidSaveRecordSyncRecord: unable to find record on db:%{public}@ %{public}@");
  sub_10001350C();
}

void sub_100043858()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002E3DC();
  sub_10002E3BC((void *)&_mh_execute_header, v0, v1, "Error encoding localValue for %{public}@ %{public}@");
  sub_10001350C();
}

void sub_1000438B8()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002E3F4();
  sub_10002E3BC((void *)&_mh_execute_header, v0, v1, "nil value for localValue for %{public}@ %{public}@");
  sub_10001350C();
}

void sub_100043920(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "recordID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordName"));
  sub_1000198DC();
  sub_100006D04((void *)&_mh_execute_header, a2, v5, "Zone ID is nil; record dropped %{public}@", v6);

  sub_10000F308();
}

void sub_1000439B4(void *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "zoneName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "recordID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordName"));
  sub_10002E438();
  sub_10000F2F4((void *)&_mh_execute_header, v6, v7, "Add zone and add record request made %{public}@ %{public}@.", v8, v9, v10, v11, 2u);

  sub_10000F308();
}

void sub_100043A60(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100013514((void *)&_mh_execute_header, a2, a3, "handleFailedToSaveSyncRecordServerRecordChanged: error archiving serverCRDT error: %{public}@", a5, a6, a7, a8, 2u);
  sub_10001350C();
}

void sub_100043AC8(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *a1;
  v4 = 138543618;
  v5 = 0;
  v6 = 2114;
  v7 = v3;
  sub_10002E3D0((void *)&_mh_execute_header, a2, a3, "handleFailedToSaveSyncRecordServerRecordChanged: serverCRDT is nil for record: %{public}@ for error: %{public}@", (uint8_t *)&v4);
  sub_10001350C();
}

void sub_100043B40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "Error handleFailedToSaveSyncRecordServerRecordChanged: [serverCRDT mergeRecordValue:clientCRDT]; error: %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_10001350C();
}

void sub_100043BA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100013514((void *)&_mh_execute_header, v0, v1, "Error not handled: failedToSaveRecord, error: %{public}@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100043C00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100013514((void *)&_mh_execute_header, v0, v1, "Error not handled: failedToSaveRecord, zoneVersion error: %{public}@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100043C60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100013514((void *)&_mh_execute_header, v0, v1, "Error not handled: failedToSaveRecord, hightestDeletedLocation error: %{public}@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100043CC0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A04((void *)&_mh_execute_header, a2, a3, "locationID can not be found for recordID %{public}@", a5, a6, a7, a8, 2u);
  sub_10001350C();
}

void sub_100043D28(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  sub_10002E3D0((void *)&_mh_execute_header, a4, a3, "syncEngineDidEndFetchingChanges: Can't build location from record stream:%{public}@ recordName:%{public}@", (uint8_t *)a3);

}

void sub_100043D8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100013514((void *)&_mh_execute_header, v0, v1, "locationRow is unexpectly nil for location %{public}@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100043DEC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(*(_QWORD *)a1 + 40);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  sub_10002E3BC((void *)&_mh_execute_header, a2, a3, "Unable to archive recordValue %{public}@ %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_10001350C();
}

void sub_100043E64(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[40];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "streamIdentifier"));
  sub_10002E40C();
  sub_10002E42C((void *)&_mh_execute_header, a3, v7, "Unable to [recordValue mergeRecordValue:serverValue for %{public}@ %{public}@ %{public}@", v8);

  sub_10002E448();
}

void sub_100043F08(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[40];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "streamIdentifier"));
  sub_10002E40C();
  sub_10002E42C((void *)&_mh_execute_header, a3, v7, "syncEngineDidEndFetchingChanges: Unable to unarchive mergeableRecordValue for %{public}@ %{public}@ %{public}@", v8);

  sub_10002E448();
}

void sub_100043FAC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not generate atom data from atomBatch: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100044030()
{
  uint64_t Description;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  Description = BMDevicePlatformGetDescription(0);
  v1 = (void *)objc_claimAutoreleasedReturnValue(Description);
  sub_1000211A0((void *)&_mh_execute_header, v2, v3, "BMRapportManager: could not determine appropriate control flags for device platform: %@", v4, v5, v6, v7, 2u);

  sub_1000211B4();
}

void sub_1000440B0(uint64_t a1)
{
  uint64_t Description;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  Description = BMDevicePlatformGetDescription(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(Description);
  sub_1000211A0((void *)&_mh_execute_header, v3, v4, "BMRapportManager: could not determine appropriate control flags for device platform: %@", v5, v6, v7, v8, 2u);

  sub_1000211B4();
}

void sub_10004412C(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BMRapportClient[%@]: Requests must be added before activation", (uint8_t *)&v3, 0xCu);
}

void sub_1000441B0(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "BMRapportClient[%@]: Requests must be registered during activation", (uint8_t *)&v3, 0xCu);
}

void sub_100044234()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "Unable to create unarchiver %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100044294()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000198DC();
  sub_1000198E8((void *)&_mh_execute_header, v0, v1, "unable to create a record with initWithRecordType for %@", v2);
  sub_10001350C();
}

void sub_1000442F8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000198DC();
  sub_1000198E8((void *)&_mh_execute_header, v0, v1, "Unable to create a record from systemFieldsData for %@", v2);
  sub_10001350C();
}

void sub_10004435C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000198DC();
  sub_10002E3BC((void *)&_mh_execute_header, v0, v1, "Error saving via saveSystemFieldsDataForRecord: for %{public}@ %{public}@");
  sub_10001350C();
}

void sub_1000443C8()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000097FC();
  sub_1000097E8((void *)&_mh_execute_header, v0, v1, "Failed to clear metadata for record %@ in zone %@");
  sub_10001350C();
}

void sub_100044428()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000097FC();
  sub_10002E3BC((void *)&_mh_execute_header, v0, v1, "Error saving CKRecord in saveCKRecordServerMergeableValue: for %@ %@");
  sub_10001350C();
}

void sub_100044488()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "Problems updating CKRecords at or before location %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_1000444E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "Problems deleting CKRecords at or before location %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100044548()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "Failed to delete CKRecords for streamName:%@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_1000445A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000198DC();
  sub_100010A04((void *)&_mh_execute_header, v0, v1, "Can not delete CKRecord at location %@", v2, v3, v4, v5, v6);
  sub_10001350C();
}

void sub_100044608(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "zoneName"));
  sub_1000198DC();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to delete all data associated with zone %@", v4, 0xCu);

  sub_1000211B4();
}

void sub_100044690(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "lastErrorMessage"));
  sub_1000198DC();
  sub_1000198E8((void *)&_mh_execute_header, a2, v4, "Failed to insert: %@", v5);

  sub_1000211B4();
}

void sub_100044714()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000097FC();
  sub_1000097E8((void *)&_mh_execute_header, v0, v1, "Problems updating CKRecords in stream: %@ site: %@");
  sub_10001350C();
}

void sub_100044774()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100037DE4(__stack_chk_guard);
  sub_100022EC8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "BMSyncDatabase%@ error: %@", v1, 0x16u);
  sub_10001350C();
}

void sub_1000447E4()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  const __CFString *v3;
  _BYTE v4[24];

  sub_100037DE4(__stack_chk_guard);
  v3 = CFSTR("unknown");
  if (v0)
    v3 = (const __CFString *)v0;
  *(_DWORD *)v4 = 138412546;
  *(_QWORD *)&v4[4] = v2;
  *(_WORD *)&v4[12] = 2112;
  *(_QWORD *)&v4[14] = v3;
  sub_10002E3BC((void *)&_mh_execute_header, v0, v1, "BMSyncDatabase%@ unrecoverable error: %@", *(_QWORD *)v4, *(_QWORD *)&v4[8], *(_QWORD *)&v4[16]);
  sub_10001350C();
}

void sub_100044864()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100037DE4(__stack_chk_guard);
  sub_100013514((void *)&_mh_execute_header, v0, v1, "BMSyncDatabase%@ database corrupt", v2, v3, v4, v5, 2u);
  sub_10001350C();
}

void sub_1000448C8()
{
  uint64_t v0;
  os_log_t v1;

  sub_100037DE4(__stack_chk_guard);
  sub_100022EC8();
  sub_10002E3BC((void *)&_mh_execute_header, v0, v1, "BMSyncDatabase%@ database corrupt: %@");
  sub_10001350C();
}

void sub_100044928()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100037DE4(__stack_chk_guard);
  sub_100013514((void *)&_mh_execute_header, v0, v1, "BMSyncDatabase%@ state queried while opening", v2, v3, v4, v5, 2u);
  sub_10001350C();
}

void sub_10004498C(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a2, "lastError"));
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "BMSyncDatabase%@ failed to close db %@", (uint8_t *)&v6, 0x16u);

}

void sub_100044A3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000093D8((void *)&_mh_execute_header, a1, a3, "failed to commit transcation", a5, a6, a7, a8, 0);
  sub_1000198F4();
}

void sub_100044A6C(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = objc_opt_class(a1, a2);
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%@ received nil deviceIdentifier", (uint8_t *)&v3, 0xCu);
}

void sub_100044AF4(uint64_t a1, NSObject *a2)
{
  const __CFString *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = sub_100008ED8(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Merge result: %@", (uint8_t *)&v5, 0xCu);

}

void sub_100044B88(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A04((void *)&_mh_execute_header, a2, a3, "vacuumWithShouldContinueBlock querying freelist_count: %@", a5, a6, a7, a8, 2u);
  sub_10001350C();
}

void sub_100044BEC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A04((void *)&_mh_execute_header, a2, a3, "vacuumWithShouldContinueBlock querying page_count: %@", a5, a6, a7, a8, 2u);
  sub_10001350C();
}

void sub_100044C50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000093D8((void *)&_mh_execute_header, a1, a3, "vacuumWithShouldContinueBlock error running incremental_vacuum", a5, a6, a7, a8, 0);
  sub_1000198F4();
}

void sub_100044C80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000093D8((void *)&_mh_execute_header, a1, a3, "vacuumWithShouldContinueBlock error running initial VACUUM", a5, a6, a7, a8, 0);
  sub_1000198F4();
}

void sub_100044CB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000093D8((void *)&_mh_execute_header, a1, a3, "vacuumWithShouldContinueBlock error setting auto_vacuum", a5, a6, a7, a8, 0);
  sub_1000198F4();
}

void sub_100044CE0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010A04((void *)&_mh_execute_header, a2, a3, "vacuumWithShouldContinueBlock error querying auto_vacuum: %@", a5, a6, a7, a8, 2u);
  sub_10001350C();
}

void sub_100044D44(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "can not determine streamName", v1, 2u);
}

void sub_100044D84(_QWORD *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 24);
  if (*a1)
    v4 = CFSTR("empty");
  else
    v4 = CFSTR("nil");
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "_streamName is %@ for %@", (uint8_t *)&v5, 0x16u);
}

void sub_100044E28(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "unknown mergeable value ID format version %lu", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_CKAtomRowSiteIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKAtomRowSiteIdentifiers");
}

id objc_msgSend_DELETE_FROM_WHERE_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DELETE_FROM:WHERE:");
}

id objc_msgSend_FMDBUserVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FMDBUserVersion");
}

id objc_msgSend_INSERT_INTO_VALUES_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "INSERT_INTO:VALUES:");
}

id objc_msgSend_SELECT_ATOMS_WHERE_ORDER_BY_LIMIT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:");
}

id objc_msgSend_SELECT_FROM_COLUMNS_JOIN_WHERE_GROUP_BY_HAVING_ORDER_BY_LIMIT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:HAVING:ORDER_BY:LIMIT:");
}

id objc_msgSend_SELECT_FROM_COLUMNS_JOIN_WHERE_ORDER_BY_LIMIT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SELECT_FROM:COLUMNS:JOIN:WHERE:ORDER_BY:LIMIT:");
}

id objc_msgSend_SELECT_FROM_COLUMNS_WHERE_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SELECT_FROM:COLUMNS:WHERE:");
}

id objc_msgSend_SELECT_FROM_COLUMNS_WHERE_GROUP_BY_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SELECT_FROM:COLUMNS:WHERE:GROUP_BY:");
}

id objc_msgSend_SELECT_FROM_COLUMNS_WHERE_ORDER_BY_LIMIT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:");
}

id objc_msgSend_UPDATE_SET_WHERE_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UPDATE:SET:WHERE:");
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

id objc_msgSend__SELECT_FROM_COLUMNS_JOIN_WHERE_GROUP_BY_ORDER_BY_LIMIT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:ORDER_BY:LIMIT:");
}

id objc_msgSend__cloudKitSyncWithSyncTriggeredHandler_syncCompletedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cloudKitSyncWithSyncTriggeredHandler:syncCompletedHandler:");
}

id objc_msgSend__companionLinkClientActivatedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_companionLinkClientActivatedWithError:");
}

id objc_msgSend__companionLinkClientDiscoveredDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_companionLinkClientDiscoveredDevice:");
}

id objc_msgSend__companionLinkClientInvalidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_companionLinkClientInvalidated");
}

id objc_msgSend__companionLinkClientLostDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_companionLinkClientLostDevice:");
}

id objc_msgSend__createAndActivateCompanionLinkClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createAndActivateCompanionLinkClient");
}

id objc_msgSend__deregisterRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deregisterRequests");
}

id objc_msgSend__handleRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleRequestID:request:options:responseHandler:");
}

id objc_msgSend__handleResponseUUID_response_options_error_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleResponseUUID:response:options:error:handler:");
}

id objc_msgSend__initWithType_controlFlags_serviceName_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithType:controlFlags:serviceName:queue:");
}

id objc_msgSend__numPagesToVacuum(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_numPagesToVacuum");
}

id objc_msgSend__pas_filteredArrayWithTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pas_filteredArrayWithTest:");
}

id objc_msgSend__rapportSyncWithDevices_syncTriggeredHandler_syncCompletedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rapportSyncWithDevices:syncTriggeredHandler:syncCompletedHandler:");
}

id objc_msgSend__rapportSyncWithSyncTriggeredHandler_syncCompletedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rapportSyncWithSyncTriggeredHandler:syncCompletedHandler:");
}

id objc_msgSend__registerRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerRequests");
}

id objc_msgSend__reinitializeSiteIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reinitializeSiteIdentifier:");
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}

id objc_msgSend__sizeOfFileInKilobytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sizeOfFileInKilobytes:");
}

id objc_msgSend__startServerWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startServerWithCompletion:");
}

id objc_msgSend__validateDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateDevice:");
}

id objc_msgSend__writeEventData_dataVersion_timestamp_outBookmark_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeEventData:dataVersion:timestamp:outBookmark:");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "account");
}

id objc_msgSend_accountAltDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountAltDSID");
}

id objc_msgSend_accountFromRapportOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountFromRapportOptions:");
}

id objc_msgSend_accountInfoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountInfoWithCompletionHandler:");
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountStatus");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accounts");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activeDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeDevices");
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activity");
}

id objc_msgSend_addAtomToAtomBatch_ifChunkerAllows_fromAtomTableRecord_atomValueData_version_atomValueVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAtomToAtomBatch:ifChunkerAllows:fromAtomTableRecord:atomValueData:version:atomValueVersion:");
}

id objc_msgSend_addAtomWithValueData_toAtomBatch_fromAtomTableRecord_version_atomValueVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAtomWithValueData:toAtomBatch:fromAtomTableRecord:version:atomValueVersion:");
}

id objc_msgSend_addCKAtomRow_inStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCKAtomRow:inStream:");
}

id objc_msgSend_addClockValuesInIndexSet_forSiteIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addClockValuesInIndexSet:forSiteIdentifier:");
}

id objc_msgSend_addClockValuesInIndexSet_withAtomState_forSiteIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addClockValuesInIndexSet:withAtomState:forSiteIdentifier:");
}

id objc_msgSend_addDeltasToSaveFromMergeable_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDeltasToSaveFromMergeable:error:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addRecordIDsToSave_recordIDsToDelete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRecordIDsToSave:recordIDsToDelete:");
}

id objc_msgSend_addRecordZonesToSave_recordZoneIDsToDelete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRecordZonesToSave:recordZoneIDsToDelete:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allPeers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allPeers");
}

id objc_msgSend_allSiteIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allSiteIdentifiers");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appendAtomWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendAtomWithBlock:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appendWithProxyBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendWithProxyBlock:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_atomBatchBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomBatchBytes");
}

id objc_msgSend_atomBatchVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomBatchVersion");
}

id objc_msgSend_atomBatches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomBatches");
}

id objc_msgSend_atomBatchesInClockVector_ckFormatVersion_chunker_transportType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomBatchesInClockVector:ckFormatVersion:chunker:transportType:");
}

id objc_msgSend_atomBatchesInClockVector_targetPlatform_transportType_direction_ckFormatVersion_chunker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomBatchesInClockVector:targetPlatform:transportType:direction:ckFormatVersion:chunker:");
}

id objc_msgSend_atomRowsInTimestampClockVector_forLocation_inStream_enumerateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomRowsInTimestampClockVector:forLocation:inStream:enumerateWithBlock:");
}

id objc_msgSend_atomRowsNotOnDiskReferencingSiteIdentifier_inStream_enumerateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomRowsNotOnDiskReferencingSiteIdentifier:inStream:enumerateWithBlock:");
}

id objc_msgSend_atomType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomType");
}

id objc_msgSend_atomValueFromData_version_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomValueFromData:version:");
}

id objc_msgSend_atomValueFromEvent_ofType_version_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomValueFromEvent:ofType:version:");
}

id objc_msgSend_atomsAtOrBeforeLocation_ofType_enumerateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomsAtOrBeforeLocation:ofType:enumerateWithBlock:");
}

id objc_msgSend_atomsInClockVector_ckFormatVersion_chunker_transportType_enumerateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomsInClockVector:ckFormatVersion:chunker:transportType:enumerateWithBlock:");
}

id objc_msgSend_attemptedRecoveryDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptedRecoveryDate");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_batchSequenceNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batchSequenceNumber");
}

id objc_msgSend_beginDeferredTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginDeferredTransaction");
}

id objc_msgSend_beginImmediateTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginImmediateTransaction");
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginTransaction");
}

id objc_msgSend_bindObject_toColumn_inStatement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bindObject:toColumn:inStatement:");
}

id objc_msgSend_bindStatement_WithArgumentsInArray_orDictionary_orVAList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bindStatement:WithArgumentsInArray:orDictionary:orVAList:");
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "block");
}

id objc_msgSend_bmDeviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bmDeviceIdentifier");
}

id objc_msgSend_bm_companionLinkDeviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bm_companionLinkDeviceIdentifier");
}

id objc_msgSend_bm_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bm_description");
}

id objc_msgSend_bookmark(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bookmark");
}

id objc_msgSend_bookmarkForAtomRow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bookmarkForAtomRow:");
}

id objc_msgSend_BOOLForColumnIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForColumnIndex:");
}

id objc_msgSend_BOOLForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForEntitlement:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_buildAtomBatchRequestWithIsReciprocal_syncReason_sequenceNumber_transportType_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildAtomBatchRequestWithIsReciprocal:syncReason:sequenceNumber:transportType:device:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cachedStatementForQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedStatementForQuery:");
}

id objc_msgSend_cachedStatements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedStatements");
}

id objc_msgSend_canAddAtomWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canAddAtomWithData:");
}

id objc_msgSend_canPerformCloudKitSyncWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canPerformCloudKitSyncWithReason:");
}

id objc_msgSend_canPerformRapportSyncWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canPerformRapportSyncWithReason:");
}

id objc_msgSend_causalReference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "causalReference");
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "charValue");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_checkpoint_name_logFrameCount_checkpointCount_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkpoint:name:logFrameCount:checkpointCount:error:");
}

id objc_msgSend_ckAtomRowForAtomWithBookmark_type_forSiteIdentifier_inStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckAtomRowForAtomWithBookmark:type:forSiteIdentifier:inStream:");
}

id objc_msgSend_ckAtomRowWithTimestamp_inStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckAtomRowWithTimestamp:inStream:");
}

id objc_msgSend_ckAtomTableRecordForEvent_ofType_atBookmark_previousTableRecord_siteIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckAtomTableRecordForEvent:ofType:atBookmark:previousTableRecord:siteIdentifier:");
}

id objc_msgSend_ckMergeableValueID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckMergeableValueID");
}

id objc_msgSend_ckMergeableValueIDWithFormatVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckMergeableValueIDWithFormatVersion:");
}

id objc_msgSend_ckRecordExists_zoneName_recordType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckRecordExists:zoneName:recordType:");
}

id objc_msgSend_ckRecordForRecordName_zoneName_recordType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckRecordForRecordName:zoneName:recordType:");
}

id objc_msgSend_ckRecordsToSyncToCloudKitForZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckRecordsToSyncToCloudKitForZone:");
}

id objc_msgSend_ckSyncEngineMetaData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckSyncEngineMetaData");
}

id objc_msgSend_ckZoneExists_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckZoneExists:");
}

id objc_msgSend_ckZoneForZoneName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckZoneForZoneName:");
}

id objc_msgSend_ckZoneSetAttemptedRecoveryDate_state_forZoneName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckZoneSetAttemptedRecoveryDate:state:forZoneName:");
}

id objc_msgSend_ckZoneSetAttemptingRecoveryForZoneName_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckZoneSetAttemptingRecoveryForZoneName:state:");
}

id objc_msgSend_ckZoneSetZoneVersionUUID_forZoneName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckZoneSetZoneVersionUUID:forZoneName:");
}

id objc_msgSend_clearCKMergeableRecordValueServerMergeableValuesForRecordName_zoneName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearCKMergeableRecordValueServerMergeableValuesForRecordName:zoneName:");
}

id objc_msgSend_clearCKMergeableRecordValueServerMergeableValuesForZoneName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearCKMergeableRecordValueServerMergeableValuesForZoneName:");
}

id objc_msgSend_clearCKRecordLocalMergeableValueAndSetToSyncForZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearCKRecordLocalMergeableValueAndSetToSyncForZone:");
}

id objc_msgSend_clearCKSyncEngineMetaData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearCKSyncEngineMetaData");
}

id objc_msgSend_clearCachedStatements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearCachedStatements");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "client");
}

id objc_msgSend_clientForCommunicatingWithDevice_serviceName_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientForCommunicatingWithDevice:serviceName:queue:");
}

id objc_msgSend_clientForHandlingRequestsWithServiceName_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientForHandlingRequestsWithServiceName:queue:");
}

id objc_msgSend_clientForSameAccountDiscoveryWithServiceName_delegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientForSameAccountDiscoveryWithServiceName:delegate:queue:");
}

id objc_msgSend_clientForSharedHomeDiscoveryWithServiceName_delegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientForSharedHomeDiscoveryWithServiceName:delegate:queue:");
}

id objc_msgSend_clockValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clockValue");
}

id objc_msgSend_clockValuesForSiteIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clockValuesForSiteIdentifier:");
}

id objc_msgSend_clockVector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clockVector");
}

id objc_msgSend_clockVectorForStreamsSupportingTransportType_direction_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clockVectorForStreamsSupportingTransportType:direction:device:");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_closeOpenResultSets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeOpenResultSets");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_columnIndexForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "columnIndexForName:");
}

id objc_msgSend_columnNameToIndexMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "columnNameToIndexMap");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commit");
}

id objc_msgSend_compactAndDeleteSessionLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compactAndDeleteSessionLogs");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_compareToTimestampVector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compareToTimestampVector:");
}

id objc_msgSend_compareToVector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compareToVector:");
}

id objc_msgSend_completeRequest_deliveredToDevices_withErrors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeRequest:deliveredToDevices:withErrors:");
}

id objc_msgSend_completeRequestIfDeliveredToAllNearbyDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeRequestIfDeliveredToAllNearbyDevices:");
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionHandler");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_computeAndSendAggregatedMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeAndSendAggregatedMetrics");
}

id objc_msgSend_computeAndSendStateVectorMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeAndSendStateVectorMetrics");
}

id objc_msgSend_computeHighestLocationToDeleteUpToBookmark_forSiteIdentifier_inStream_offsetsIncrease_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeHighestLocationToDeleteUpToBookmark:forSiteIdentifier:inStream:offsetsIncrease:");
}

id objc_msgSend_computeStateVectorMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeStateVectorMetrics");
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "config");
}

id objc_msgSend_containsCKAtomRowWithSegment_inStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsCKAtomRowWithSegment:inStream:");
}

id objc_msgSend_containsCKAtomRowWithTimestamp_inStream_onDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsCKAtomRowWithTimestamp:inStream:onDisk:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsVector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsVector");
}

id objc_msgSend_controlFlagsForMessagingDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controlFlagsForMessagingDevice:");
}

id objc_msgSend_controlFlagsForSameAccountDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controlFlagsForSameAccountDiscovery");
}

id objc_msgSend_controlFlagsForSharedHomeDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controlFlagsForSharedHomeDiscovery");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyWithRemoteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithRemoteName:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_corruptionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "corruptionHandler");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_crashOnErrors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "crashOnErrors");
}

id objc_msgSend_createCKRecordFromRecordID_newRecord_recordType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createCKRecordFromRecordID:newRecord:recordType:");
}

id objc_msgSend_createDatabaseForAccount_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDatabaseForAccount:queue:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDistributedSyncManagerForAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDistributedSyncManagerForAccount:");
}

id objc_msgSend_createPrimaryDatabaseWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPrimaryDatabaseWithQueue:");
}

id objc_msgSend_currentFrameStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentFrameStore");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentlyInGameMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentlyInGameMode");
}

id objc_msgSend_customFunctionName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customFunctionName");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataForColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataForColumn:");
}

id objc_msgSend_dataForColumnIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataForColumnIndex:");
}

id objc_msgSend_dataTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTimestamp");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataVersion");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithError:");
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "database");
}

id objc_msgSend_databaseClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseClass");
}

id objc_msgSend_databaseExists(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseExists");
}

id objc_msgSend_databasePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databasePath");
}

id objc_msgSend_databasePool_shouldAddDatabaseToPool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databasePool:shouldAddDatabaseToPool:");
}

id objc_msgSend_databaseQueueWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseQueueWithPath:");
}

id objc_msgSend_databaseQueueWithPath_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseQueueWithPath:flags:");
}

id objc_msgSend_databaseSizeInKilobytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseSizeInKilobytes");
}

id objc_msgSend_databaseWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseWithPath:");
}

id objc_msgSend_datastorePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "datastorePath");
}

id objc_msgSend_dateForColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateForColumn:");
}

id objc_msgSend_dateForColumnIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateForColumnIndex:");
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFormatter");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateOfLastVacuum(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateOfLastVacuum");
}

id objc_msgSend_dateToRelativePositionDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateToRelativePositionDictionary");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_db(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "db");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteAllAtomsAtOrBeforeLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAllAtomsAtOrBeforeLocation:");
}

id objc_msgSend_deleteAllCKRecordsInZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAllCKRecordsInZone:");
}

id objc_msgSend_deleteAtOrBeforeHighestDeletedLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAtOrBeforeHighestDeletedLocation:");
}

id objc_msgSend_deleteCKRecordAtLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteCKRecordAtLocation:");
}

id objc_msgSend_deleteCKRecordsAtOrBeforeLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteCKRecordsAtOrBeforeLocation:");
}

id objc_msgSend_deleteEventAtBookmark_outTombstoneBookmark_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteEventAtBookmark:outTombstoneBookmark:");
}

id objc_msgSend_deleteLocationsUpToTTLAtTombstone_siteIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteLocationsUpToTTLAtTombstone:siteIdentifier:");
}

id objc_msgSend_deletedExpiredBufferedLocationsForSiteIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deletedExpiredBufferedLocationsForSiteIdentifier:");
}

id objc_msgSend_deletedLocations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deletedLocations");
}

id objc_msgSend_deletedLocationsForTransportType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deletedLocationsForTransportType:");
}

id objc_msgSend_deletionReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deletionReason");
}

id objc_msgSend_deliveredToDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deliveredToDevices");
}

id objc_msgSend_deregisterRequestID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterRequestID:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deserialize_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deserialize:error:");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIdentifier");
}

id objc_msgSend_devicePeerMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicePeerMetadata");
}

id objc_msgSend_deviceToDeviceEncryptionAvailability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceToDeviceEncryptionAvailability");
}

id objc_msgSend_deviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceWithIdentifier:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithSyncDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithSyncDatabase:");
}

id objc_msgSend_didAddAtomWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didAddAtomWithData:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_disableAllCKSyncRecordsForSite_stream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableAllCKSyncRecordsForSite:stream:");
}

id objc_msgSend_disableStatementCachingForBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableStatementCachingForBlock:");
}

id objc_msgSend_discoveredDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveredDevices");
}

id objc_msgSend_discoveryManager_didDiscoverDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryManager:didDiscoverDevice:");
}

id objc_msgSend_discoveryManager_didLoseDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryManager:didLoseDevice:");
}

id objc_msgSend_discoveryManager_supportsDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryManager:supportsDevice:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_distributedContextManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distributedContextManager");
}

id objc_msgSend_distributedSiteIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distributedSiteIdentifier");
}

id objc_msgSend_distributedSyncManagers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distributedSyncManagers");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleForColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleForColumn:");
}

id objc_msgSend_doubleForColumnIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleForColumnIndex:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enableAllCKSyncRecordsPreviouslyDisabledForSite_stream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableAllCKSyncRecordsPreviouslyDisabledForSite:stream:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeSystemFieldsWithCoder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeSystemFieldsWithCoder:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedData");
}

id objc_msgSend_encryptedValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptedValues");
}

id objc_msgSend_enforceMaxSessionLogPrunePolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enforceMaxSessionLogPrunePolicy");
}

id objc_msgSend_enumerateAllClockValuesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateAllClockValuesUsingBlock:");
}

id objc_msgSend_enumerateAtomsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateAtomsWithOptions:usingBlock:");
}

id objc_msgSend_enumerateCKSyncRecordRecordsSetForDeletingUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateCKSyncRecordRecordsSetForDeletingUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateMergeableRecordValuesForRecordName_zoneName_withBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateMergeableRecordValuesForRecordName:zoneName:withBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateRangesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateRangesUsingBlock:");
}

id objc_msgSend_enumerateRecordsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateRecordsWithBlock:");
}

id objc_msgSend_enumerateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateWithBlock:");
}

id objc_msgSend_enumerateZonesWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateZonesWithBlock:");
}

id objc_msgSend_errorFromDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorFromDevice");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorWithMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithMessage:");
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventBody");
}

id objc_msgSend_eventBodyData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventBodyData");
}

id objc_msgSend_eventClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventClass");
}

id objc_msgSend_eventData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventData");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_executeLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeLocked:");
}

id objc_msgSend_executeOperationWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeOperationWithBlock:");
}

id objc_msgSend_executeQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeQuery:");
}

id objc_msgSend_executeQuery_withArgumentsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeQuery:withArgumentsInArray:");
}

id objc_msgSend_executeQuery_withArgumentsInArray_orDictionary_orVAList_shouldBind_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeQuery:withArgumentsInArray:orDictionary:orVAList:shouldBind:");
}

id objc_msgSend_executeStatements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeStatements:");
}

id objc_msgSend_executeUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeUpdate:");
}

id objc_msgSend_executeUpdate_error_withArgumentsInArray_orDictionary_orVAList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeUpdate:error:withArgumentsInArray:orDictionary:orVAList:");
}

id objc_msgSend_executeUpdate_withArgumentsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeUpdate:withArgumentsInArray:");
}

id objc_msgSend_extractSQL_argumentsList_intoString_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractSQL:argumentsList:intoString:arguments:");
}

id objc_msgSend_fetchAtomBatchesIsReciprocal_reason_activity_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAtomBatchesIsReciprocal:reason:activity:completionHandler:");
}

id objc_msgSend_fetchAtomBatchesRequestHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAtomBatchesRequestHandler");
}

id objc_msgSend_fetchChangesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchChangesWithCompletionHandler:");
}

id objc_msgSend_fetchChangesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchChangesWithError:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileManagerWithMediatedAccessToDirectory_useCase_domain_user_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_finishRequest_toDevice_withError_peerInfo_peerStatusTracker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishRequest:toDevice:withError:peerInfo:peerStatusTracker:");
}

id objc_msgSend_finishWritingWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWritingWithError:");
}

id objc_msgSend_finishedSendingRequestsToDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedSendingRequestsToDevice:");
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstIndex");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_gatherAllCKSyncRecordRecordsToBeDeleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gatherAllCKSyncRecordRecordsToBeDeleted");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getLatestTombstoneBookmarkForSiteIdentifier_inStream_segmentName_segmentOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLatestTombstoneBookmarkForSiteIdentifier:inStream:segmentName:segmentOffset:");
}

id objc_msgSend_getSegmentVersion_config_stream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSegmentVersion:config:stream:");
}

id objc_msgSend_getSystemFieldsDataForRecordName_zoneName_recordType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSystemFieldsDataForRecordName:zoneName:recordType:");
}

id objc_msgSend_getTableSchema_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTableSchema:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_handleActivationForDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleActivationForDevice:error:");
}

id objc_msgSend_handleDeleteAtomRow_usingPruner_outBookmark_outTombstoneBookmark_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDeleteAtomRow:usingPruner:outBookmark:outTombstoneBookmark:");
}

id objc_msgSend_handleDeletedLocation_deleteCKRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDeletedLocation:deleteCKRecord:");
}

id objc_msgSend_handleDidSaveRecordHighestDeletedLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDidSaveRecordHighestDeletedLocation:");
}

id objc_msgSend_handleDidSaveRecordSyncRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDidSaveRecordSyncRecord:");
}

id objc_msgSend_handleDidSaveRecordZoneVersionRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDidSaveRecordZoneVersionRecord:");
}

id objc_msgSend_handleFailedToSaveRecordHighestDeletedLocation_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailedToSaveRecordHighestDeletedLocation:error:");
}

id objc_msgSend_handleFailedToSaveRecordSyncRecord_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailedToSaveRecordSyncRecord:error:");
}

id objc_msgSend_handleFailedToSaveRecordZoneVersion_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailedToSaveRecordZoneVersion:error:");
}

id objc_msgSend_handleFailedToSaveSyncRecordResaveRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailedToSaveSyncRecordResaveRecord:");
}

id objc_msgSend_handleFailedToSaveSyncRecordServerManateeDecryptionError_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailedToSaveSyncRecordServerManateeDecryptionError:error:");
}

id objc_msgSend_handleFailedToSaveSyncRecordServerRecordChanged_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailedToSaveSyncRecordServerRecordChanged:error:");
}

id objc_msgSend_handleFailedToSaveSyncRecordUnknownItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailedToSaveSyncRecordUnknownItem:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleFetchAtomBatchesResponse_options_error_fromDevice_forRequest_isReciprocal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFetchAtomBatchesResponse:options:error:fromDevice:forRequest:isReciprocal:");
}

id objc_msgSend_handleHighestDeletedLocationDidFetchRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleHighestDeletedLocationDidFetchRecord:");
}

id objc_msgSend_handleHighestDeletedLocationRecordToSaveForRecordID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleHighestDeletedLocationRecordToSaveForRecordID:");
}

id objc_msgSend_handleInvalidationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleInvalidationWithError:");
}

id objc_msgSend_handleRecordWithIDDeletedSyncRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleRecordWithIDDeletedSyncRecord:");
}

id objc_msgSend_handleServerRecordChangedForHighestDeletedLocationError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleServerRecordChangedForHighestDeletedLocationError:");
}

id objc_msgSend_handleSyncRecordDidFetchRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSyncRecordDidFetchRecord:");
}

id objc_msgSend_handleSyncRecordRecordToSaveForRecordID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSyncRecordRecordToSaveForRecordID:");
}

id objc_msgSend_handleTransitionToNewMergeableValueRecordValueKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleTransitionToNewMergeableValueRecordValueKey");
}

id objc_msgSend_handleZoneReset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleZoneReset:");
}

id objc_msgSend_handleZoneVersionDidFetchRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleZoneVersionDidFetchRecord:");
}

id objc_msgSend_handleZoneVersionRecordToSaveForRecordID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleZoneVersionRecordToSaveForRecordID:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handler");
}

id objc_msgSend_hasDateFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDateFormatter");
}

id objc_msgSend_hasOpenResultSets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasOpenResultSets");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_highestDeletedLocationForSiteIdentifier_inStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "highestDeletedLocationForSiteIdentifier:inStream:");
}

id objc_msgSend_highestDeletedLocationsForStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "highestDeletedLocationsForStream:");
}

id objc_msgSend_highestLocationWithBufferedAtomsOlderThan_forSiteIdentifier_inStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "highestLocationWithBufferedAtomsOlderThan:forSiteIdentifier:inStream:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsDeviceIdentifier");
}

id objc_msgSend_ignoreDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ignoreDevice:");
}

id objc_msgSend_inFlightToDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inFlightToDevices");
}

id objc_msgSend_inUse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inUse");
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSetWithIndex:");
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSetWithIndexesInRange:");
}

id objc_msgSend_ingestNewChangesForSite_transportType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ingestNewChangesForSite:transportType:");
}

id objc_msgSend_ingestNewChangesFromAllSitesInVectorClock_transportType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ingestNewChangesFromAllSitesInVectorClock:transportType:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFromDictionary:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithAccountIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccountIdentifier:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAssignerPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAssignerPolicy:");
}

id objc_msgSend_initWithAsyncOperationBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAsyncOperationBlock:");
}

id objc_msgSend_initWithAtomBatch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAtomBatch:error:");
}

id objc_msgSend_initWithAtomType_value_version_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAtomType:value:version:");
}

id objc_msgSend_initWithCKMergeableValueID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCKMergeableValueID:");
}

id objc_msgSend_initWithCKMergeableValueID_streamName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCKMergeableValueID:streamName:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithChunkerPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChunkerPolicy:");
}

id objc_msgSend_initWithCoder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoder:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithContainerID_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainerID:options:");
}

id objc_msgSend_initWithContainerIdentifier_environment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainerIdentifier:environment:");
}

id objc_msgSend_initWithCustomFunctionName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCustomFunctionName:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:error:");
}

id objc_msgSend_initWithDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDatabase:");
}

id objc_msgSend_initWithDatabase_activity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDatabase:activity:");
}

id objc_msgSend_initWithDatabase_dataSource_metadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDatabase:dataSource:metadata:");
}

id objc_msgSend_initWithDatabase_transcationBatchSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDatabase:transcationBatchSize:");
}

id objc_msgSend_initWithDeviceIdentifier_idsDeviceIdentifier_name_model_platform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceIdentifier:idsDeviceIdentifier:name:model:platform:");
}

id objc_msgSend_initWithDeviceIdentifier_metadata_protocolVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceIdentifier:metadata:protocolVersion:");
}

id objc_msgSend_initWithDistributedSyncManagers_peerStatusTracker_accountDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDistributedSyncManagers:peerStatusTracker:accountDatabase:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithEventData_dataVersion_dataTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventData:dataVersion:dataTimestamp:");
}

id objc_msgSend_initWithFMResultSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFMResultSet:");
}

id objc_msgSend_initWithFMResultSet_modifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFMResultSet:modifier:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_modifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:modifier:");
}

id objc_msgSend_initWithIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIndex:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithLocation_state_primaryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocation:state:primaryKey:");
}

id objc_msgSend_initWithLocation_timestamp_referenceLocation_causalReference_type_segmentName_segmentOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:");
}

id objc_msgSend_initWithLocation_timestamp_referenceLocation_causalReference_type_valueVersion_valueData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocation:timestamp:referenceLocation:causalReference:type:valueVersion:valueData:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMaxBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMaxBytes:");
}

id objc_msgSend_initWithMergeableDelta_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMergeableDelta:error:");
}

id objc_msgSend_initWithMergeableValueID_timestamp_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMergeableValueID:timestamp:type:");
}

id objc_msgSend_initWithName_model_platform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:model:platform:");
}

id objc_msgSend_initWithName_zoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:zoneID:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithPath_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:flags:");
}

id objc_msgSend_initWithPath_flags_vfs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:flags:vfs:");
}

id objc_msgSend_initWithPath_options_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:options:queue:");
}

id objc_msgSend_initWithProto_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProto:");
}

id objc_msgSend_initWithProtoData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProtoData:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_core_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:core:");
}

id objc_msgSend_initWithQueue_multiStreamManager_database_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:multiStreamManager:database:");
}

id objc_msgSend_initWithQueue_primarySyncManager_primaryDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:primarySyncManager:primaryDatabase:");
}

id objc_msgSend_initWithRPCompanionLinkDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRPCompanionLinkDevice:");
}

id objc_msgSend_initWithRapportSyncEngine_cloudKitSyncEngine_peerStatusTracker_database_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRapportSyncEngine:cloudKitSyncEngine:peerStatusTracker:database:queue:");
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordName:zoneID:");
}

id objc_msgSend_initWithRecordType_recordID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordType:recordID:");
}

id objc_msgSend_initWithSQLStatements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSQLStatements:");
}

id objc_msgSend_initWithServiceName_delegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:delegate:queue:");
}

id objc_msgSend_initWithSiteIdentifierObject_clockValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSiteIdentifierObject:clockValue:");
}

id objc_msgSend_initWithStream_config_eventDataClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStream:config:eventDataClass:");
}

id objc_msgSend_initWithStream_permission_config_includeTombstones_eventDataClass_useCase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStream:permission:config:includeTombstones:eventDataClass:useCase:");
}

id objc_msgSend_initWithStream_segment_iterationStartTime_offset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStream:segment:iterationStartTime:offset:");
}

id objc_msgSend_initWithStreamCRDT_locationRow_database_queue_maxDeltaSize_sessionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStreamCRDT:locationRow:database:queue:maxDeltaSize:sessionContext:");
}

id objc_msgSend_initWithStreamConfiguration_locationAssignerPolicy_localSiteIdentifier_database_changeReporter_account_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStreamConfiguration:locationAssignerPolicy:localSiteIdentifier:database:changeReporter:account:");
}

id objc_msgSend_initWithStreamConfiguration_streamCRDT_database_localSiteIdentifier_changeReporter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStreamConfiguration:streamCRDT:database:localSiteIdentifier:changeReporter:");
}

id objc_msgSend_initWithStreamName_siteIdentifier_day_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStreamName:siteIdentifier:day:");
}

id objc_msgSend_initWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_initWithTimestamps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimestamps:");
}

id objc_msgSend_initWithTriple_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTriple:");
}

id objc_msgSend_initWithType_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:name:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUUID_activity_requestBlock_queue_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUID:activity:requestBlock:queue:completionHandler:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUseCase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUseCase:");
}

id objc_msgSend_initWithZoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithZoneID:");
}

id objc_msgSend_initWithZoneName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithZoneName:");
}

id objc_msgSend_initWithZoneName_ownerName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithZoneName:ownerName:");
}

id objc_msgSend_initWithZoneName_recordName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithZoneName:recordName:");
}

id objc_msgSend_initWriterWithMergeableValueID_metadata_formatVersion_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWriterWithMergeableValueID:metadata:formatVersion:error:");
}

id objc_msgSend_insertLocationIfNotExists_withState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertLocationIfNotExists:withState:");
}

id objc_msgSend_intForColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intForColumn:");
}

id objc_msgSend_intForColumnIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intForColumnIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalState");
}

id objc_msgSend_internalStepWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalStepWithError:");
}

id objc_msgSend_interrupt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interrupt");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateClientWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateClientWithError:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isEnabledForDataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabledForDataclass:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToReference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToReference:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInTransaction");
}

id objc_msgSend_isManateeAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isManateeAvailable:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isOpen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOpen");
}

id objc_msgSend_isReciprocalRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReciprocalRequest");
}

id objc_msgSend_isRecordNewerThanMostRecentDeleteForSiteIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRecordNewerThanMostRecentDeleteForSiteIdentifier:");
}

id objc_msgSend_isSiriCloudSyncEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSiriCloudSyncEnabled");
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubsetOfSet:");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_lastCloudKitSyncAttemptDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastCloudKitSyncAttemptDate");
}

id objc_msgSend_lastCloudKitSyncDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastCloudKitSyncDate");
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastError");
}

id objc_msgSend_lastErrorCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastErrorCode");
}

id objc_msgSend_lastErrorMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastErrorMessage");
}

id objc_msgSend_lastIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastIndex");
}

id objc_msgSend_lastInsertRowId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastInsertRowId");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastRapportSyncAttemptDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRapportSyncAttemptDate");
}

id objc_msgSend_lastRapportSyncDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRapportSyncDate");
}

id objc_msgSend_lastSyncDateFromAnyDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastSyncDateFromAnyDevice");
}

id objc_msgSend_latestCKAtomRowOfType_forSiteIdentifier_inStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestCKAtomRowOfType:forSiteIdentifier:inStream:");
}

id objc_msgSend_latestDistributedTimestampForSiteIdentifier_inStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestDistributedTimestampForSiteIdentifier:inStream:");
}

id objc_msgSend_legacyDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "legacyDescriptor");
}

id objc_msgSend_legacyNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "legacyNames");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localDevice");
}

id objc_msgSend_localDeviceIdentifierCreatingIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localDeviceIdentifierCreatingIfNecessary");
}

id objc_msgSend_localDeviceUpdatingIfNeccesaryWithProtocolVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localDeviceUpdatingIfNeccesaryWithProtocolVersion:");
}

id objc_msgSend_localMergeableValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localMergeableValue");
}

id objc_msgSend_localSiteIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localSiteIdentifier");
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedFailureReason");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "location");
}

id objc_msgSend_locationID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationID");
}

id objc_msgSend_locationRow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationRow");
}

id objc_msgSend_locationRowWithLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationRowWithLocation:");
}

id objc_msgSend_locationRowWithLocationID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationRowWithLocationID:");
}

id objc_msgSend_locationWithStreamName_siteIdentifier_timestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationWithStreamName:siteIdentifier:timestamp:");
}

id objc_msgSend_locationsInClockVector_inStream_enumerateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationsInClockVector:inStream:enumerateWithBlock:");
}

id objc_msgSend_locationsWithState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationsWithState:");
}

id objc_msgSend_logsErrors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logsErrors");
}

id objc_msgSend_longForColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longForColumn:");
}

id objc_msgSend_longForColumnIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longForColumnIndex:");
}

id objc_msgSend_longLongIntForColumnIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongIntForColumnIndex:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_markAllOperationsComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markAllOperationsComplete");
}

id objc_msgSend_markAsDeliveredToDevice_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markAsDeliveredToDevice:withError:");
}

id objc_msgSend_markAsInFlightToDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markAsInFlightToDevice:");
}

id objc_msgSend_markCKRecordsAtOrBeforeLocationToBeDeletedOnSync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:");
}

id objc_msgSend_markOperationComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markOperationComplete");
}

id objc_msgSend_markOperationStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markOperationStarted");
}

id objc_msgSend_maxAge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxAge");
}

id objc_msgSend_maxBusyRetryTimeInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxBusyRetryTimeInterval");
}

id objc_msgSend_mergeAtomBatch_deletedLocations_sessionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeAtomBatch:deletedLocations:sessionContext:");
}

id objc_msgSend_mergeAtomBatch_sessionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeAtomBatch:sessionContext:");
}

id objc_msgSend_mergeAtomBatches_deletedLocations_sessionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeAtomBatches:deletedLocations:sessionContext:");
}

id objc_msgSend_mergeAtomBatches_sessionContext_forLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeAtomBatches:sessionContext:forLocation:");
}

id objc_msgSend_mergeIntoMergeable_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeIntoMergeable:error:");
}

id objc_msgSend_mergeRecordValue_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeRecordValue:error:");
}

id objc_msgSend_mergeableRecordValueKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeableRecordValueKey");
}

id objc_msgSend_mergeableValueID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeableValueID");
}

id objc_msgSend_messageID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageID");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "methodForSelector:");
}

id objc_msgSend_metricsCollector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metricsCollector");
}

id objc_msgSend_minimumTimeBetweenSyncsAttemptsForTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumTimeBetweenSyncsAttemptsForTransport:");
}

id objc_msgSend_minimumTimeBetweenSyncsForTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumTimeBetweenSyncsForTransport:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "model");
}

id objc_msgSend_modifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifier");
}

id objc_msgSend_modifyPendingChangesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifyPendingChangesWithCompletionHandler:");
}

id objc_msgSend_moreComing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moreComing");
}

id objc_msgSend_multiStreamManagerWithPrimaryDatabase_account_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiStreamManagerWithPrimaryDatabase:account:queue:");
}

id objc_msgSend_multiStreamRangeClockVectorFromIndexClockVectors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiStreamRangeClockVectorFromIndexClockVectors:");
}

id objc_msgSend_multiStreamTimestampClockVectorToVectorClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiStreamTimestampClockVectorToVectorClock:");
}

id objc_msgSend_multiStreamVectorClockToTimestampVectorClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiStreamVectorClockToTimestampVectorClock:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newDiscoveryClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newDiscoveryClients");
}

id objc_msgSend_newEnumeratorFromBookmark_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newEnumeratorFromBookmark:options:");
}

id objc_msgSend_newEnumeratorFromBookmark_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newEnumeratorFromBookmark:options:error:");
}

id objc_msgSend_newEnumeratorFromStartTime_endTime_maxEvents_lastN_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:");
}

id objc_msgSend_newEnumeratorFromStartTime_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newEnumeratorFromStartTime:options:");
}

id objc_msgSend_newEnumeratorStartingAfterBookmark_reader_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newEnumeratorStartingAfterBookmark:reader:");
}

id objc_msgSend_newHighestDeletedLocationRecordIDFor_stream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newHighestDeletedLocationRecordIDFor:stream:");
}

id objc_msgSend_newTombstoneEnumeratorFromBookmark_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newTombstoneEnumeratorFromBookmark:");
}

id objc_msgSend_newTombstoneEnumeratorFromStartTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newTombstoneEnumeratorFromStartTime:");
}

id objc_msgSend_newZoneVersionRecordIDForZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newZoneVersionRecordIDForZone:");
}

id objc_msgSend_next(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "next");
}

id objc_msgSend_nextEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextEvent");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nextWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextWithError:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numRowsInTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numRowsInTable:");
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

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objCType");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForColumnIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForColumnIndex:");
}

id objc_msgSend_objectForColumnName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForColumnName:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectsPassingTest:");
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offset");
}

id objc_msgSend_offsetIsStartOfFrameStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offsetIsStartOfFrameStore:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open");
}

id objc_msgSend_openWithFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openWithFlags:");
}

id objc_msgSend_openWithFlags_vfs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openWithFlags:vfs:");
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operatingSystemVersion");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_originatingSiteIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originatingSiteIdentifier");
}

id objc_msgSend_osBuildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "osBuildVersion");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathForSharedSyncWithAccount_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForSharedSyncWithAccount:domain:");
}

id objc_msgSend_pathForSharedSyncWithAccount_streamType_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForSharedSyncWithAccount:streamType:domain:");
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peer");
}

id objc_msgSend_peerStatusTracker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerStatusTracker");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platform");
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerValue");
}

id objc_msgSend_popFirstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popFirstObject");
}

id objc_msgSend_populateAtomBatch_withAtomsInClockVector_forLocation_ckFormatVersion_valueVersion_chunker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateAtomBatch:withAtomsInClockVector:forLocation:ckFormatVersion:valueVersion:chunker:");
}

id objc_msgSend_primaryDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryDatabase");
}

id objc_msgSend_primaryDatabasePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryDatabasePath");
}

id objc_msgSend_primaryKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryKey");
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateCloudDatabase");
}

id objc_msgSend_processWithXPCConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processWithXPCConnection:");
}

id objc_msgSend_proto(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proto");
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protocolVersion");
}

id objc_msgSend_proxyAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyAtIndex:");
}

id objc_msgSend_pruningPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pruningPolicy");
}

id objc_msgSend_pushDatabaseBackInPool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushDatabaseBackInPool:");
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise");
}

id objc_msgSend_rangeTimestampClockVectorFromIndexClockVector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeTimestampClockVectorFromIndexClockVector:");
}

id objc_msgSend_rapportClient_didDiscoverDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rapportClient:didDiscoverDevice:");
}

id objc_msgSend_rapportClient_didLoseDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rapportClient:didLoseDevice:");
}

id objc_msgSend_rapportIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rapportIdentifier");
}

id objc_msgSend_rapportManager_didDiscoverBMRapportDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rapportManager:didDiscoverBMRapportDevice:");
}

id objc_msgSend_rapportManager_didLoseNearbyBMRapportDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rapportManager:didLoseNearbyBMRapportDevice:");
}

id objc_msgSend_rapportManager_isDeviceSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rapportManager:isDeviceSupported:");
}

id objc_msgSend_rapportSyncEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rapportSyncEngine");
}

id objc_msgSend_readerForSiteIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readerForSiteIdentifier:");
}

id objc_msgSend_recordAtomMergeResult_inStream_ownerSite_originatingSite_eventCreatedAt_sessionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordAtomMergeResult:inStream:ownerSite:originatingSite:eventCreatedAt:sessionContext:");
}

id objc_msgSend_recordAtomMergeResult_inStream_sessionID_messageID_ownerSite_originatingSite_eventCreatedAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordAtomMergeResult:inStream:sessionID:messageID:ownerSite:originatingSite:eventCreatedAt:");
}

id objc_msgSend_recordChangeTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordChangeTag");
}

id objc_msgSend_recordFromSystemFieldsData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordFromSystemFieldsData:");
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordID");
}

id objc_msgSend_recordIDsToDelete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordIDsToDelete");
}

id objc_msgSend_recordIDsToSave(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordIDsToSave");
}

id objc_msgSend_recordMessageToDeviceIdentifier_reachable_bytes_isReciprocal_sessionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordMessageToDeviceIdentifier:reachable:bytes:isReciprocal:sessionContext:");
}

id objc_msgSend_recordMessageToDeviceIdentifier_sessionID_messageID_reachable_bytes_isReciprocal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordMessageToDeviceIdentifier:sessionID:messageID:reachable:bytes:isReciprocal:");
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordName");
}

id objc_msgSend_recordSessionEnd_lastSyncDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordSessionEnd:lastSyncDate:");
}

id objc_msgSend_recordSessionEnd_timeSincePreviousSync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordSessionEnd:timeSincePreviousSync:");
}

id objc_msgSend_recordSessionStart_transport_reason_isReciprocal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordSessionStart:transport:reason:isReciprocal:");
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordType");
}

id objc_msgSend_recoveryState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recoveryState");
}

id objc_msgSend_reference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reference");
}

id objc_msgSend_referenceLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referenceLocation");
}

id objc_msgSend_references(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "references");
}

id objc_msgSend_registerForSigterm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForSigterm");
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerRequestID:options:handler:");
}

id objc_msgSend_registerRequestID_options_requestHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerRequestID:options:requestHandler:");
}

id objc_msgSend_registerRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerRequests");
}

id objc_msgSend_rekeyWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rekeyWithData:");
}

id objc_msgSend_releaseSavePointWithName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseSavePointWithName:error:");
}

id objc_msgSend_remoteDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteDevices");
}

id objc_msgSend_remoteName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteName");
}

id objc_msgSend_removeAllDeletedLocationsBeforeHighestDeletedLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllDeletedLocationsBeforeHighestDeletedLocation:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDirectoryAtPath:error:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_requestAccessToResource_mode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestAccessToResource:mode:error:");
}

id objc_msgSend_requestBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestBlock");
}

id objc_msgSend_requestQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestQueue");
}

id objc_msgSend_requestTimeoutDidFire(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestTimeoutDidFire");
}

id objc_msgSend_requestTimeoutHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestTimeoutHandler");
}

id objc_msgSend_resaveRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resaveRecord:");
}

id objc_msgSend_resaveRecordOnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resaveRecordOnError:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resetCKRecordsMetaDataAndSetToSyncForZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetCKRecordsMetaDataAndSetToSyncForZone:");
}

id objc_msgSend_resetEagerExitTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetEagerExitTimer");
}

id objc_msgSend_resetMetadataForRecord_zoneName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetMetadataForRecord:zoneName:");
}

id objc_msgSend_resultDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultDictionary");
}

id objc_msgSend_resultSetDidClose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultSetDidClose:");
}

id objc_msgSend_resultSetWithStatement_usingParentDatabase_shouldAutoClose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultSetWithStatement:usingParentDatabase:shouldAutoClose:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_rollback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rollback");
}

id objc_msgSend_rollbackToSavePointWithName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rollbackToSavePointWithName:error:");
}

id objc_msgSend_runMetricsCollectionTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runMetricsCollectionTask:");
}

id objc_msgSend_runRequest_onDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runRequest:onDevice:");
}

id objc_msgSend_runRequestOnDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runRequestOnDevice:");
}

id objc_msgSend_runVacuumingTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runVacuumingTask:");
}

id objc_msgSend_saveCKMergeableRecordValueRecordName_zoneName_mergeableRecordValueData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCKMergeableRecordValueRecordName:zoneName:mergeableRecordValueData:");
}

id objc_msgSend_saveCKRecordHighestDeletedLocationRow_recordName_zoneName_recordExists_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCKRecordHighestDeletedLocationRow:recordName:zoneName:recordExists:");
}

id objc_msgSend_saveCKRecordLocalMergeableValue_recordName_zoneName_locationRow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCKRecordLocalMergeableValue:recordName:zoneName:locationRow:");
}

id objc_msgSend_saveCKRecordServerMergeableValue_recordName_zoneName_locationRow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCKRecordServerMergeableValue:recordName:zoneName:locationRow:");
}

id objc_msgSend_saveCKSyncEngineMetaData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCKSyncEngineMetaData:");
}

id objc_msgSend_saveLatestTombstoneBookmark_forSiteIdentifier_inStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveLatestTombstoneBookmark:forSiteIdentifier:inStream:");
}

id objc_msgSend_saveSystemFieldsDataForRecord_syncToCloudKit_recordType_crdtDeleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveSystemFieldsDataForRecord:syncToCloudKit:recordType:crdtDeleted:");
}

id objc_msgSend_secondsUntilExpirationWithStreamConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsUntilExpirationWithStreamConfiguration:");
}

id objc_msgSend_segmentName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "segmentName");
}

id objc_msgSend_segmentOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "segmentOffset");
}

id objc_msgSend_sendCKRecordCRDTLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendCKRecordCRDTLog:");
}

id objc_msgSend_sendEvent_payload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEvent:payload:");
}

id objc_msgSend_sendFetchAtomBatchesRequest_toDevice_forRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendFetchAtomBatchesRequest:toDevice:forRequest:");
}

id objc_msgSend_sendNextRequestToDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendNextRequestToDevice:");
}

id objc_msgSend_sendRequest_request_device_options_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRequest:request:device:options:responseHandler:");
}

id objc_msgSend_sendRequest_request_toDevice_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRequest:request:toDevice:responseHandler:");
}

id objc_msgSend_sendRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRequestID:request:options:responseHandler:");
}

id objc_msgSend_sendSyncDatabaseSummaryWithDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSyncDatabaseSummaryWithDatabase:");
}

id objc_msgSend_serialize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialize");
}

id objc_msgSend_serialize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialize:");
}

id objc_msgSend_serializeProto(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializeProto");
}

id objc_msgSend_serviceTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceTypes");
}

id objc_msgSend_sessionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionContext");
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionID");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAtomBatchVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAtomBatchVersion:");
}

id objc_msgSend_setAtomBatches_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAtomBatches:");
}

id objc_msgSend_setAtomBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAtomBehavior:");
}

id objc_msgSend_setAtomType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAtomType:");
}

id objc_msgSend_setAutomaticSyncingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutomaticSyncingEnabled:");
}

id objc_msgSend_setBatchSequenceNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatchSequenceNumber:");
}

id objc_msgSend_setBatchSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatchSize:");
}

id objc_msgSend_setBmDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBmDeviceIdentifier:");
}

id objc_msgSend_setCachedStatement_forQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachedStatement:forQuery:");
}

id objc_msgSend_setCachedStatements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachedStatements:");
}

id objc_msgSend_setClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClient:");
}

id objc_msgSend_setClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClock:");
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setControlFlags:");
}

id objc_msgSend_setCorruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCorruptionHandler:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateOfLastVacuum_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateOfLastVacuum:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeletedLocations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeletedLocations:");
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

id objc_msgSend_setDisconnectHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisconnectHandler:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setErrorFlagsChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrorFlagsChangedHandler:");
}

id objc_msgSend_setExpirationAfterTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExpirationAfterTimeInterval:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFetchChangesForMergeableValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchChangesForMergeableValues:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdsDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdsDeviceIdentifier:");
}

id objc_msgSend_setInUse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInUse:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsReciprocalRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsReciprocalRequest:");
}

id objc_msgSend_setKeyWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyWithData:");
}

id objc_msgSend_setLastCloudKitSyncAttemptDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastCloudKitSyncAttemptDate:");
}

id objc_msgSend_setLastCloudKitSyncDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastCloudKitSyncDate:");
}

id objc_msgSend_setLastRapportSyncAttemptDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastRapportSyncAttemptDate:");
}

id objc_msgSend_setLastRapportSyncDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastRapportSyncDate:");
}

id objc_msgSend_setLastSyncDate_forDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastSyncDate:forDeviceWithIdentifier:");
}

id objc_msgSend_setLocalDeviceUpdatedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalDeviceUpdatedHandler:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setMaxBusyRetryTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxBusyRetryTimeInterval:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMergeableRecordValueKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMergeableRecordValueKey:");
}

id objc_msgSend_setMessageID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageID:");
}

id objc_msgSend_setMetricsCollector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetricsCollector:");
}

id objc_msgSend_setModifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModifier:");
}

id objc_msgSend_setMoreComing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMoreComing:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsToFetchChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsToFetchChanges");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOriginatingSiteIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginatingSiteIdentifier:");
}

id objc_msgSend_setParentDB_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParentDB:");
}

id objc_msgSend_setPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeer:");
}

id objc_msgSend_setProtocolVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtocolVersion:");
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQuery:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequestID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestID:");
}

id objc_msgSend_setRequestTimeoutHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestTimeoutHandler:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setSessionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionContext:");
}

id objc_msgSend_setSessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionID:");
}

id objc_msgSend_setShouldAutoClose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldAutoClose:");
}

id objc_msgSend_setShouldCacheStatements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCacheStatements:");
}

id objc_msgSend_setShouldCacheStatementsWithoutClearingExistingStatements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCacheStatementsWithoutClearingExistingStatements:");
}

id objc_msgSend_setSiteIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSiteIdentifier:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setState_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:error:");
}

id objc_msgSend_setState_errorFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:errorFormat:");
}

id objc_msgSend_setStateUpdatedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateUpdatedHandler:");
}

id objc_msgSend_setStatement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatement:");
}

id objc_msgSend_setSyncReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSyncReason:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setUnordered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnordered:");
}

id objc_msgSend_setUnseenPeers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnseenPeers:");
}

id objc_msgSend_setUseCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseCount:");
}

id objc_msgSend_setUserVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserVersion:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forMetadataKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forMetadataKey:");
}

id objc_msgSend_setVectorClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVectorClock:");
}

id objc_msgSend_setVectorClockTo_forStreamIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVectorClockTo:forStreamIdentifier:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setWalltime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWalltime:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortValue");
}

id objc_msgSend_shortenedRapportIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortenedRapportIdentifier");
}

id objc_msgSend_siteIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siteIdentifier");
}

id objc_msgSend_siteIdentifierObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siteIdentifierObject");
}

id objc_msgSend_siteSuffix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siteSuffix");
}

id objc_msgSend_size_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size:error:");
}

id objc_msgSend_sizeOfSerializedStateVectorInBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeOfSerializedStateVectorInBytes:");
}

id objc_msgSend_sizeOfTableInKilobytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeOfTableInKilobytes:");
}

id objc_msgSend_splitWithMaximumSize_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "splitWithMaximumSize:error:");
}

id objc_msgSend_sqlStatements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sqlStatements");
}

id objc_msgSend_sqliteHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sqliteHandle");
}

id objc_msgSend_sqlitePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sqlitePath");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startClient");
}

id objc_msgSend_startRequestTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRequestTimeout");
}

id objc_msgSend_startSavePointWithName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSavePointWithName:error:");
}

id objc_msgSend_startServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startServer");
}

id objc_msgSend_startWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithCompletion:");
}

id objc_msgSend_startWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithCompletionBlock:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stateVectorForLocationRow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateVectorForLocationRow:");
}

id objc_msgSend_statement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statement");
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusFlags");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopRequestTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopRequestTimeout");
}

id objc_msgSend_storeConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeConfig");
}

id objc_msgSend_streamCRDT(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamCRDT");
}

id objc_msgSend_streamConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamConfiguration");
}

id objc_msgSend_streamConfigurationForZoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamConfigurationForZoneID:");
}

id objc_msgSend_streamConfigurationFromSyncIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamConfigurationFromSyncIdentifier:");
}

id objc_msgSend_streamIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamIdentifier");
}

id objc_msgSend_streamName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamName");
}

id objc_msgSend_streamRemoteIdentifierForStreamName_deviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamRemoteIdentifierForStreamName:deviceIdentifier:");
}

id objc_msgSend_streamUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamUUID");
}

id objc_msgSend_streamUpdatedForStreamName_deviceIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamUpdatedForStreamName:deviceIdentifier:error:");
}

id objc_msgSend_streamUpdatedWithStreamName_isDelete_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamUpdatedWithStreamName:isDelete:error:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringForColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForColumn:");
}

id objc_msgSend_stringForColumnIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForColumnIndex:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_suggestedDeltaSizeForContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedDeltaSizeForContainer:");
}

id objc_msgSend_supportsSyncingWithPlatform_overTransport_inDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSyncingWithPlatform:overTransport:inDirection:");
}

id objc_msgSend_supportsTransport_direction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsTransport:direction:");
}

id objc_msgSend_syncAllTransportsNowIfPolicyAllowsWithReason_activity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncAllTransportsNowIfPolicyAllowsWithReason:activity:");
}

id objc_msgSend_syncCloudKitNowIfPolicyAllowsWithReason_activity_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncCloudKitNowIfPolicyAllowsWithReason:activity:completionHandler:");
}

id objc_msgSend_syncDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncDirectory");
}

id objc_msgSend_syncIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncIdentifier");
}

id objc_msgSend_syncIdentifierForTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncIdentifierForTransport:");
}

id objc_msgSend_syncNowIfPolicyAllowsWithReason_transportType_activity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncNowIfPolicyAllowsWithReason:transportType:activity:");
}

id objc_msgSend_syncNowWithDevices_reason_activity_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncNowWithDevices:reason:activity:completionHandler:");
}

id objc_msgSend_syncNowWithReason_activity_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncNowWithReason:activity:completionHandler:");
}

id objc_msgSend_syncPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncPolicy");
}

id objc_msgSend_syncRapportNowIfPolicyAllowsWithDevices_reason_activity_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncRapportNowIfPolicyAllowsWithDevices:reason:activity:completionHandler:");
}

id objc_msgSend_syncRapportNowIfPolicyAllowsWithReason_activity_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncRapportNowIfPolicyAllowsWithReason:activity:completionHandler:");
}

id objc_msgSend_syncReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncReason");
}

id objc_msgSend_syncScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncScheduler");
}

id objc_msgSend_syncSessionDidEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncSessionDidEnd");
}

id objc_msgSend_syncSessionDidStartWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncSessionDidStartWithReason:");
}

id objc_msgSend_syncableStreamConfigurations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncableStreamConfigurations");
}

id objc_msgSend_tableExists_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableExists:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
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

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_timestampClockVectorForStreamIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestampClockVectorForStreamIdentifier:");
}

id objc_msgSend_timestampClockVectorToTimeStampVector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestampClockVectorToTimeStampVector:");
}

id objc_msgSend_timestampCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestampCount");
}

id objc_msgSend_timestampCountForSiteIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestampCountForSiteIdentifier:");
}

id objc_msgSend_timestampCountForStateVector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestampCountForStateVector:");
}

id objc_msgSend_timestampFromSegmentName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestampFromSegmentName:");
}

id objc_msgSend_timestampVectorToTimeStampClockVector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestampVectorToTimeStampClockVector:");
}

id objc_msgSend_timestamps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamps");
}

id objc_msgSend_tombstoneEnumeratorFromStoredBookmarkForSiteIdentifier_fromDatastore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tombstoneEnumeratorFromStoredBookmarkForSiteIdentifier:fromDatastore:");
}

id objc_msgSend_truncateDateToDay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "truncateDateToDay:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unordered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unordered");
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedCharValue");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongIntForColumnIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongIntForColumnIndex:");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:");
}

id objc_msgSend_updateAllLocationsAtOrBefore_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAllLocationsAtOrBefore:state:");
}

id objc_msgSend_updateCKAtomRow_inStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCKAtomRow:inStream:");
}

id objc_msgSend_updateClockVectorByUnionWithUnseenSiteIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateClockVectorByUnionWithUnseenSiteIdentifiers:");
}

id objc_msgSend_updateLocationState_forLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLocationState:forLocation:");
}

id objc_msgSend_uploadChangesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadChangesWithError:");
}

id objc_msgSend_upsertCKRecordWithLocation_inStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upsertCKRecordWithLocation:inStream:");
}

id objc_msgSend_upsertLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upsertLocation:");
}

id objc_msgSend_upsertSyncDevicePeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upsertSyncDevicePeer:");
}

id objc_msgSend_upsertSyncDevicePeer_isMe_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upsertSyncDevicePeer:isMe:");
}

id objc_msgSend_useCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useCount");
}

id objc_msgSend_userDeletesForStreamName_deviceIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userDeletesForStreamName:deviceIdentifier:error:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userVersion");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_vacuumWithShouldContinueBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vacuumWithShouldContinueBlock:");
}

id objc_msgSend_validStreamNameMapping(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validStreamNameMapping");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_valueData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueData");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForMetadataKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForMetadataKey:");
}

id objc_msgSend_valueVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueVersion");
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_vectorClock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vectorClock");
}

id objc_msgSend_vectorClockForStreamIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vectorClockForStreamIdentifier:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_walSizeInKilobytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walSizeInKilobytes");
}

id objc_msgSend_warnInUse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "warnInUse");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_writeAtomValue_fromAtomRow_usingWriter_outBookmark_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeAtomValue:fromAtomRow:usingWriter:outBookmark:");
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoneID");
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoneName");
}

id objc_msgSend_zoneUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoneUUID");
}
