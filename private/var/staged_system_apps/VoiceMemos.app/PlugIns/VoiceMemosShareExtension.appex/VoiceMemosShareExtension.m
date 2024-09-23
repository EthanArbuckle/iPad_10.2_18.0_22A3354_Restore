void sub_100001ACC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  RCSharedAudioFileInfo *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByDeletingPathExtension"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v26 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v5, 1, &v26));
    v11 = v26;

    v12 = *(void **)(a1 + 32);
    if (v10)
    {
      v23 = v8;
      objc_msgSend(v12, "setTemporaryDirectoryURL:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:", v13));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v25 = 0;
      v16 = objc_msgSend(v15, "copyItemAtURL:toURL:error:", v5, v14, &v25);
      v17 = v25;
      if (v16)
      {
        v24 = 0;
        objc_msgSend(v14, "getResourceValue:forKey:error:", &v24, NSURLCreationDateKey, 0);
        v18 = v24;
        v19 = -[RCSharedAudioFileInfo initWithURL:fileName:creationDate:]([RCSharedAudioFileInfo alloc], "initWithURL:fileName:creationDate:", v14, v23, v18);
        objc_msgSend(*(id *)(a1 + 32), "setSharedAudioFileInfo:", v19);

        v20 = *(void **)(a1 + 32);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sharedAudioFileInfo"));
        objc_msgSend(v20, "_didLoadFileInPlaceWithFileInfo:", v21);

      }
      v8 = v23;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "extensionContext"));
      objc_msgSend(v14, "cancelRequestWithError:", v11);
    }

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionContext"));
    objc_msgSend(v22, "cancelRequestWithError:", v6);

  }
}

void sub_100002190(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tableViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "fileName"));
  objc_msgSend(v2, "setSharedFileName:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "doneButtonItem"));
  objc_msgSend(v4, "setEnabled:", 1);

}

void sub_100002484(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_removeTemporaryAudioFileIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionContext"));
  v6 = v5;
  if (a2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inputItems"));
    objc_msgSend(v6, "completeRequestReturningItems:completionHandler:", v8, 0);

    +[RCAnalyticsUtilities sendReceivedSharedRecording](RCAnalyticsUtilities, "sendReceivedSharedRecording");
  }
  else
  {
    objc_msgSend(v5, "cancelRequestWithError:", v9);

  }
}

void sub_10000269C(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "-[RCShareViewController _removeTemporaryAudioFileIfNeeded]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s -- Unable to remove file. Error = %@", (uint8_t *)&v2, 0x16u);
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend__didLoadFileInPlaceWithFileInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didLoadFileInPlaceWithFileInfo:");
}

id objc_msgSend__removeTemporaryAudioFileIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeTemporaryAudioFileIfNeeded");
}

id objc_msgSend__setupTitleCellTextWithDefaultFileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupTitleCellTextWithDefaultFileName:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachments");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_cancelRequestWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelRequestWithError:");
}

id objc_msgSend_completeRequestReturningItems_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeRequestReturningItems:completionHandler:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "creationDate");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_doneButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doneButtonItem");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileName");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_hasItemConformingToTypeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasItemConformingToTypeIdentifier:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_importRecordingWithSourceAudioURL_name_date_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "importRecordingWithSourceAudioURL:name:date:completionHandler:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_initWithURL_fileName_creationDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:fileName:creationDate:");
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputItems");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_loadFileRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadFileRepresentation");
}

id objc_msgSend_loadFileRepresentationForTypeIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadFileRepresentationForTypeIdentifier:completionHandler:");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondarySystemBackgroundColor");
}

id objc_msgSend_sendReceivedSharedRecording(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendReceivedSharedRecording");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setSharedAudioFileInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSharedAudioFileInfo:");
}

id objc_msgSend_setSharedFileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSharedFileName:");
}

id objc_msgSend_setTemporaryDirectoryURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTemporaryDirectoryURL:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setupViews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupViews");
}

id objc_msgSend_sharedAudioFileInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAudioFileInfo");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_tableViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableViewController");
}

id objc_msgSend_temporaryDirectoryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporaryDirectoryURL");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_voiceMemoTitleText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceMemoTitleText");
}
