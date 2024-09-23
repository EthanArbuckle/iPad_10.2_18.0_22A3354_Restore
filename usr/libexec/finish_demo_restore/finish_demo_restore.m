void sub_100001DE8(id a1)
{
  MSDLogModel *v1;
  void *v2;

  v1 = objc_alloc_init(MSDLogModel);
  v2 = (void *)qword_10000C730;
  qword_10000C730 = (uint64_t)v1;

}

void sub_100002134(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000024E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000024F8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002508(uint64_t a1)
{

}

void sub_100002510(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stringByAppendingFormat:", CFSTR("/%@"), a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "description"));
  NSLog(CFSTR("Checking existing log file (full path) %@ against %@"), v14, v6);

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "attributesOfItemAtPath:error:", v14, 0));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fileCreationDate"));
  v11 = objc_msgSend(v10, "compare:", *(_QWORD *)(a1 + 40));

  if (v11 == (id)-1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fileCreationDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
    NSLog(CFSTR("Removing %@ whose creation date is %@."), v14, v13);

    objc_msgSend(*(id *)(a1 + 48), "removeItemAtPath:error:", v14, 0);
  }
  *a4 = 0;

}

void sub_1000027D8(id a1)
{
  MSDDemoVolumeManager *v1;
  void *v2;

  v1 = objc_alloc_init(MSDDemoVolumeManager);
  v2 = (void *)qword_10000C740;
  qword_10000C740 = (uint64_t)v1;

}

id sub_100003664(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = objc_msgSend(v2, "fileExistsAtPath:", v1);

  return v3;
}

uint64_t start()
{
  __objc2_class **v0;
  void *v1;

  if ((sub_100003664(CFSTR("/private/var/demo_bundle")) & 1) != 0)
  {
    v0 = off_100008088;
LABEL_5:
    v1 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](*v0, "sharedInstance"));
    objc_msgSend(v1, "finishInstallContent");

    return 0;
  }
  if (sub_100003664(CFSTR("/private/var/demo_backup")))
  {
    v0 = &off_100008090;
    goto LABEL_5;
  }
  return 0;
}

void sub_100003764(id a1)
{
  FDRContentInstaller *v1;
  void *v2;

  v1 = objc_alloc_init(FDRContentInstaller);
  v2 = (void *)qword_10000C750;
  qword_10000C750 = (uint64_t)v1;

}

void sub_100003E78(id a1)
{
  MSDContentInstaller *v1;
  void *v2;

  v1 = objc_alloc_init(MSDContentInstaller);
  v2 = (void *)qword_10000C760;
  qword_10000C760 = (uint64_t)v1;

}

void sub_100004D44(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004D70(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100004D80(uint64_t a1)
{

}

void sub_100004D88(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingPathComponent:", a2));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  objc_msgSend(v9, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%s - intermediatePath:  %@"), "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  if ((objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) & 1) != 0)return;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/demo_backup/backup"), "stringByAppendingPathComponent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)));
  v11 = *(void **)(a1 + 32);
  v24 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attributesOfItemAtPath:error:", v10, &v24));
  v13 = v24;
  if (!v12)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
    objc_msgSend(v20, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%s - Failed to read attributes of folder:  %@ - Error:  %@"), "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", v10, v22);

    goto LABEL_8;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fileType"));
  v15 = objc_msgSend(v14, "isEqualToString:", NSFileTypeDirectory);

  if (!v15)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    objc_msgSend(v20, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%s - Intermediate path:  %@ must be folder."), "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    goto LABEL_8;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  objc_msgSend(v16, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%s - Creating directory:  %@"), "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v17 = *(void **)(a1 + 32);
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v23 = v13;
  LOBYTE(v16) = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 0, v12, &v23);
  v19 = v23;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)v16;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedDescription"));
    objc_msgSend(v20, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%s - Failed to create directory:  %@ - Error:  %@"), "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", v21);

    v13 = v19;
LABEL_8:

    v19 = v13;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_adjustContentUnder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustContentUnder:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createIntermdediateDirectoriesInPathAndRestoreAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createIntermdediateDirectoriesInPathAndRestoreAttributes:");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_enableLogToFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableLogToFile:");
}

id objc_msgSend_enableLogToFilesUnder_prefix_expireDays_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableLogToFilesUnder:prefix:expireDays:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileCreationDate");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileNameForTodayUnder_prefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileNameForTodayUnder:prefix:");
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

id objc_msgSend_findAPFSVolumeMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findAPFSVolumeMountPoint:");
}

id objc_msgSend_finishInstallContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishInstallContent");
}

id objc_msgSend_hasInheritanceACL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasInheritanceACL:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasXattr_path_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasXattr:path:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_isContentRoot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isContentRoot:");
}

id objc_msgSend_isContentRootToRemove_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isContentRootToRemove:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isNotExtracted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNotExtracted:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_logMessage_prefix_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logMessage:prefix:message:");
}

id objc_msgSend_lookupAPFSVolumeDevByName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupAPFSVolumeDevByName:");
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "month");
}

id objc_msgSend_mountAPFSVolume_atMountPoint_withAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountAPFSVolume:atMountPoint:withAttributes:");
}

id objc_msgSend_mountDemoVolume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountDemoVolume");
}

id objc_msgSend_moveDataFromShelterToFinal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveDataFromShelterToFinal");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_moveStagingToFinal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveStagingToFinal:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_originalPathFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalPathFor:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeXattr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeXattr:");
}

id objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByExpandingTildeInPath");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_updateContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContent:");
}

id objc_msgSend_userHomePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userHomePath");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "year");
}
