void sub_100005620(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[8];

  v3[0] = CFSTR("uid");
  v3[1] = CFSTR("alternateDSID");
  v3[2] = CFSTR("username");
  v3[3] = CFSTR("givenName");
  v3[4] = CFSTR("familyName");
  v3[5] = CFSTR("displayName");
  v3[6] = CFSTR("photoURL");
  v3[7] = CFSTR("userAuxiliaryString");
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 8));
  v2 = (void *)qword_100010BF8;
  qword_100010BF8 = v1;

}

void sub_1000057A4(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[6];

  v3[0] = CFSTR("personastring");
  v3[1] = CFSTR("personatype");
  v3[2] = CFSTR("bundleid");
  v3[3] = CFSTR("imagepath");
  v3[4] = CFSTR("puid");
  v3[5] = CFSTR("ptestcount");
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 6));
  v2 = (void *)qword_100010C08;
  qword_100010C08 = v1;

}

uint64_t start()
{
  void *v0;
  void *v1;
  unsigned __int8 v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v8;

  v0 = objc_autoreleasePoolPush();
  +[UMTestPrint println](UMTestPrint, "println");
  v1 = (void *)objc_opt_class(UMTool);
  v8 = 0;
  v2 = objc_msgSend(v1, "executeWithOutError:", &v8);
  v3 = v8;
  v4 = v3;
  if ((v2 & 1) == 0)
  {
    if (v3)
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
    else
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "helpDetailsForDepth:", 0));
    v6 = (void *)v5;
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("%@"), v5);

  }
  +[UMTestPrint println](UMTestPrint, "println");

  objc_autoreleasePoolPop(v0);
  return 0;
}

void sub_100006F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006FB4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006FC4(uint64_t a1)
{

}

void sub_100006FCC(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id sub_100007728(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a2;
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v12, (_QWORD)v17));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12));
      v15 = objc_msgSend(v13, "compare:options:", v14, 64);

      if (v15)
        break;
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v15 = 0;
  }

  return v15;
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__dataSizeStringFromBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dataSizeStringFromBytes:");
}

id objc_msgSend__passcodeIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_passcodeIndex");
}

id objc_msgSend__personaAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_personaAttributes");
}

id objc_msgSend__printDivider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printDivider");
}

id objc_msgSend__printInfoForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printInfoForUser:");
}

id objc_msgSend__printSyncBubbleInfoForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printSyncBubbleInfoForUser:");
}

id objc_msgSend__spaceForDepth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_spaceForDepth:");
}

id objc_msgSend__userAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_userAttributes");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allUsers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allUsers");
}

id objc_msgSend_allUsersUnfiltered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allUsersUnfiltered");
}

id objc_msgSend_alternateDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternateDSID");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applyAttributes_toUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyAttributes:toUser:");
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arguments");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "creationDate");
}

id objc_msgSend_dataQuota(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataQuota");
}

id objc_msgSend_dataUsed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsed");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_debugErrorCausingLogout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugErrorCausingLogout");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_diskNode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskNode");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorWithMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithMessage:");
}

id objc_msgSend_examples(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "examples");
}

id objc_msgSend_executeWithOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeWithOutError:");
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "familyName");
}

id objc_msgSend_fetchAllPersonasForAllUsersWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAllPersonasForAllUsersWithCompletionHandler:");
}

id objc_msgSend_fileInfoPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileInfoPath");
}

id objc_msgSend_firstLoginEndDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstLoginEndDate");
}

id objc_msgSend_firstLoginStartDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstLoginStartDate");
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstName");
}

id objc_msgSend_getLayoutAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLayoutAttributes");
}

id objc_msgSend_getNextArgument(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNextArgument");
}

id objc_msgSend_getPersonaAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPersonaAttributes");
}

id objc_msgSend_getProvisionAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProvisionAttributes");
}

id objc_msgSend_getUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUser");
}

id objc_msgSend_getUserAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUserAttributes");
}

id objc_msgSend_gid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gid");
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "givenName");
}

id objc_msgSend_goToPreviousArgument(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "goToPreviousArgument");
}

id objc_msgSend_gracePeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gracePeriod");
}

id objc_msgSend_hasDataToSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDataToSync");
}

id objc_msgSend_helpDetailsForDepth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "helpDetailsForDepth:");
}

id objc_msgSend_homeDirPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeDirPath");
}

id objc_msgSend_homeDirectoryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeDirectoryURL");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isAdminUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAdminUser");
}

id objc_msgSend_isAuditor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAuditor");
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDataSeparatedPersona");
}

id objc_msgSend_isDefaultPersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDefaultPersona");
}

id objc_msgSend_isDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDisabled");
}

id objc_msgSend_isEnterprisePersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnterprisePersona");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEqualToUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToUser:");
}

id objc_msgSend_isLoginUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLoginUser");
}

id objc_msgSend_isPersonalPersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPersonalPersona");
}

id objc_msgSend_isPrimaryUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPrimaryUser");
}

id objc_msgSend_isSystemPersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemPersona");
}

id objc_msgSend_isTransientUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTransientUser");
}

id objc_msgSend_isUniversalPersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUniversalPersona");
}

id objc_msgSend_languages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "languages");
}

id objc_msgSend_lastCachedLoginEndDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastCachedLoginEndDate");
}

id objc_msgSend_lastCachedLoginStartDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastCachedLoginStartDate");
}

id objc_msgSend_lastLoginDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastLoginDate");
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastName");
}

id objc_msgSend_lastRemoteAuthDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRemoteAuthDate");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_libInfoPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "libInfoPath");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
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

id objc_msgSend_passcodeLockGracePeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeLockGracePeriod");
}

id objc_msgSend_passcodeType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeType");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_personaLayoutPathURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaLayoutPathURL");
}

id objc_msgSend_photoURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoURL");
}

id objc_msgSend_printInfoForUsers_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printInfoForUsers:outError:");
}

id objc_msgSend_printSyncBubbleInfoForUsers_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printSyncBubbleInfoForUsers:outError:");
}

id objc_msgSend_printTable_withColumns_rows_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printTable:withColumns:rows:");
}

id objc_msgSend_println(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "println");
}

id objc_msgSend_println_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "println:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_setAlternateDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlternateDSID:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setFamilyName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFamilyName:");
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGivenName:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPhotoURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhotoURL:");
}

id objc_msgSend_setUid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUid:");
}

id objc_msgSend_setUserAuxiliaryString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserAuxiliaryString:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_stringForUserType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForUserType:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subcommands(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subcommands");
}

id objc_msgSend_syncBubbleMachServiceNamesForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncBubbleMachServiceNamesForUser:");
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uid");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_userAuxiliaryString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAuxiliaryString");
}

id objc_msgSend_userPersonaBundleIDList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonaBundleIDList");
}

id objc_msgSend_userPersonaDisplayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonaDisplayName");
}

id objc_msgSend_userPersonaNickName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonaNickName");
}

id objc_msgSend_userPersonaType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonaType");
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonaUniqueString");
}

id objc_msgSend_userPersona_id(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersona_id");
}

id objc_msgSend_userType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userType");
}

id objc_msgSend_userUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userUUID");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_volumeUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeUUID");
}
