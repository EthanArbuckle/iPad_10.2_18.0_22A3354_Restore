id sub_1000022A0()
{
  if (qword_100008720 != -1)
    dispatch_once(&qword_100008720, &stru_1000041C8);
  return (id)qword_100008718;
}

void sub_1000022E0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.tv.TVIntents", "Default");
  v2 = (void *)qword_100008718;
  qword_100008718 = (uint64_t)v1;

}

void sub_100002428(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v4, "setObject:forKey:", &__kCFBooleanTrue, FBSOpenApplicationOptionKeyPromptUnlockDevice);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v17 = 0;
    v6 = objc_msgSend(v5, "openURL:withOptions:error:", v3, v4, &v17);
    v7 = v17;

    v8 = *(_QWORD *)(a1 + 32);
    v9 = objc_alloc((Class)INPlayMediaIntentResponse);
    if (v6)
    {
      v10 = objc_msgSend(v9, "initWithCode:userActivity:", 4, 0);
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);

      v11 = sub_1000022A0();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_100002D44();
    }
    else
    {
      v15 = objc_msgSend(v9, "initWithCode:userActivity:", 6, 0);
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v15);

      v16 = sub_1000022A0();
      v12 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_100002D70(v7);
    }

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = objc_msgSend(objc_alloc((Class)INPlayMediaIntentResponse), "initWithCode:userActivity:", 6, 0);
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v14);

  }
}

void sub_1000026CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000026EC(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  NSObject *v55;
  id v56;
  id v57;
  void *v58;
  uint64_t v59;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];

  v1 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "response"));
  v4 = v3;
  if (!v3)
  {
    (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
    v38 = sub_1000022A0();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_100002DE8();
    goto LABEL_54;
  }
  v57 = WeakRetained;
  v58 = v3;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (!v5)
  {
LABEL_50:

    WeakRetained = v57;
LABEL_51:
    (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
    v56 = sub_1000022A0();
    v39 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_100002E14();
    goto LABEL_53;
  }
  v6 = v5;
  v7 = *(_QWORD *)v62;
  v59 = v1;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v62 != v7)
      objc_enumerationMutation(obj);
    v9 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "movieOrShowContent"));
    v11 = objc_msgSend(v10, "contentType");

    if (v11 == (id)4)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "movieOrShowContent"));
      v19 = objc_opt_class(WLKBasicEpisodeMetadata);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
      {

        goto LABEL_22;
      }
      v20 = *(void **)(v1 + 32);
      v21 = v18;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mediaContainer"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "canonicalShowID"));

      v25 = objc_msgSend(v23, "isEqualToString:", v24);
      if ((v25 & 1) == 0)
        goto LABEL_22;
    }
    else if (v11 == (id)2)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "mediaContainer"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "movieOrShowContent"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "canonicalID"));
      v30 = objc_msgSend(v27, "isEqualToString:", v29);

      if (!v30)
        goto LABEL_22;
    }
    else
    {
      if (v11 != (id)1)
        goto LABEL_22;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 32), "mediaItems"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "movieOrShowContent"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canonicalID"));
      v17 = objc_msgSend(v14, "isEqualToString:", v16);

      v1 = v59;
      if ((v17 & 1) == 0)
        goto LABEL_22;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playable"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "playPunchoutURL"));
    if (v32)
    {
      v33 = (void *)v32;
      goto LABEL_30;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "openPunchoutURL"));
    if (v34)
      goto LABEL_29;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playable"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "tvAppDeeplinkURL"));
    if (v36)
      break;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentTVAppDeeplinkURL"));

    v1 = v59;
    if (v37)
      goto LABEL_31;
LABEL_22:
    if (v6 == (id)++v8)
    {
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      if (v6)
        goto LABEL_4;
      goto LABEL_50;
    }
  }

  v1 = v59;
LABEL_29:

LABEL_30:
LABEL_31:
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playable"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "playPunchoutURL"));

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playable"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "tvAppDeeplinkURL"));

  if (!v43)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playable"));
    if (objc_msgSend(v48, "isEntitled"))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playable"));
      if ((objc_msgSend(v49, "isAppInstalled") & 1) != 0)
      {
        v50 = objc_msgSend(v41, "length");

        if (v50)
        {
          v39 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v41));
          v51 = sub_1000022A0();
          v47 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            sub_100002EE4();
LABEL_44:
          WeakRetained = v57;
          goto LABEL_45;
        }
LABEL_41:
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentTVAppDeeplinkURL"));

        if (!v52)
        {

          goto LABEL_50;
        }
        v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentTVAppDeeplinkURL"));
        v53 = sub_1000022A0();
        v47 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          sub_100002E6C(v39);
        goto LABEL_44;
      }

    }
    goto LABEL_41;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playable"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "tvAppDeeplinkURL"));
  v39 = objc_claimAutoreleasedReturnValue(+[WLKPlayableUtilities _punchoutURLForDirectPlayback:ignoreExtras:](WLKPlayableUtilities, "_punchoutURLForDirectPlayback:ignoreExtras:", v45, 1));

  v46 = sub_1000022A0();
  v47 = objc_claimAutoreleasedReturnValue(v46);
  WeakRetained = v57;
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    sub_100002F54(v39);
LABEL_45:

  if (!v39)
    goto LABEL_51;
  (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  v54 = sub_1000022A0();
  v55 = objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    sub_100002E40();

LABEL_53:
  v4 = v58;
LABEL_54:

}

void sub_100002CC8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100002CD8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002D18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002D00();
  sub_100002CC8((void *)&_mh_execute_header, v0, v1, "confirmPlayMedia - success", v2, v3, v4, v5, v6);
  sub_100002CEC();
}

void sub_100002D44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002D00();
  sub_100002CC8((void *)&_mh_execute_header, v0, v1, "handlePlayMedia - success", v2, v3, v4, v5, v6);
  sub_100002CEC();
}

void sub_100002D70(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100002D0C();
  sub_100002CD8((void *)&_mh_execute_header, v2, v3, "handlePlayMedia - failure: %@", v4, v5, v6, v7, v8);

  sub_100002CF4();
}

void sub_100002DE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002D00();
  sub_100002CC8((void *)&_mh_execute_header, v0, v1, "buildPlayUrlForIntent - failure - no response", v2, v3, v4, v5, v6);
  sub_100002CEC();
}

void sub_100002E14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002D00();
  sub_100002CC8((void *)&_mh_execute_header, v0, v1, "buildPlayUrlForIntent - failure - no play url", v2, v3, v4, v5, v6);
  sub_100002CEC();
}

void sub_100002E40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002D00();
  sub_100002CC8((void *)&_mh_execute_header, v0, v1, "buildPlayUrlForIntent - success", v2, v3, v4, v5, v6);
  sub_100002CEC();
}

void sub_100002E6C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "absoluteString"));
  sub_100002D0C();
  sub_100002CD8((void *)&_mh_execute_header, v2, v3, "buildPlayUrlForIntent - fall back to content's url _playUrlString: %@", v4, v5, v6, v7, v8);

  sub_100002CF4();
}

void sub_100002EE4()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100002D0C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "buildPlayUrlForIntent - 3rd party _playUrlString: %@", v1, 0xCu);
}

void sub_100002F54(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "absoluteString"));
  sub_100002D0C();
  sub_100002CD8((void *)&_mh_execute_header, v2, v3, "buildPlayUrlForIntent - 1st party _playUrlString: %@", v4, v5, v6, v7, v8);

  sub_100002CF4();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__buildPlayUrlForIntent_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_buildPlayUrlForIntent:completion:");
}

id objc_msgSend__punchoutURLForDirectPlayback_ignoreExtras_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_punchoutURLForDirectPlayback:ignoreExtras:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_canonicalID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canonicalID");
}

id objc_msgSend_canonicalShowID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canonicalShowID");
}

id objc_msgSend_contentTVAppDeeplinkURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentTVAppDeeplinkURL");
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentType");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithCode_userActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCode:userActivity:");
}

id objc_msgSend_isAppInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppInstalled");
}

id objc_msgSend_isEntitled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEntitled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "items");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_mediaContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaContainer");
}

id objc_msgSend_mediaItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaItems");
}

id objc_msgSend_movieOrShowContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "movieOrShowContent");
}

id objc_msgSend_openPunchoutURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openPunchoutURL");
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:withOptions:error:");
}

id objc_msgSend_playPunchoutURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playPunchoutURL");
}

id objc_msgSend_playable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playable");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "response");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_tvAppDeeplinkURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tvAppDeeplinkURL");
}

id objc_msgSend_wlkDefaultQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wlkDefaultQueue");
}
