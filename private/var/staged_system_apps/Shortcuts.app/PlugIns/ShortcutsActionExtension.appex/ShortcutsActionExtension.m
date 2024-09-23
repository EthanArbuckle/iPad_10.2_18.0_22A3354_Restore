uint64_t sub_1000041A4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

void sub_1000041B4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = WFHandoffSourceKey;
  v4 = a2;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));
  v6 = (void *)v5;
  v7 = (void *)WFWorkflowRunSourceHandoff;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", WFHandoffWorkflowControllerStateKey));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100004260(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "parameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("type")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("webpageURL")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("userInfoURL")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000438C;
  v12[3] = &unk_100008360;
  v8 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v14 = v5;
  v15 = v9;
  v13 = v4;
  v10 = v5;
  v11 = v4;
  objc_msgSend(v8, "deserializeUserInfoAtURL:completionHandler:", v7, v12);

}

uint64_t sub_10000438C(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

void sub_100004998(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100004F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100005024(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithOutput:error:cancelled:", 0, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void sub_100005038(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(a3, "conformsToProtocol:", &OBJC_PROTOCOL___NSSecureCoding) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v5);

}

id sub_10000508C(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_retainBlock(*(id *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_1000050B4(uint64_t a1)
{

}

void sub_1000050BC(uint64_t a1, char a2)
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *);
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  dispatch_semaphore_t v10;

  if ((a2 & 1) == 0)
  {
    v3 = dispatch_semaphore_create(0);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000528C;
    v9[3] = &unk_100008538;
    v10 = v3;
    v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
    v6 = v3;
    v5(v4, v9);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
}

void sub_100005174(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD *);
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WFBackgroundAssertion backgroundAssertionWithName:expirationHandler:](WFBackgroundAssertion, "backgroundAssertionWithName:expirationHandler:", CFSTR("is.workflow.my.app.actionextension.cancelcleanup"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionContext"));
  objc_msgSend(v5, "cancelRequestWithError:", *(_QWORD *)(a1 + 40));

  v6 = *(_QWORD *)(a1 + 48);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005250;
  v10[3] = &unk_100008588;
  v11 = v4;
  v12 = v3;
  v7 = *(void (**)(uint64_t, _QWORD *))(v6 + 16);
  v8 = v3;
  v9 = v4;
  v7(v6, v10);

}

uint64_t sub_100005250(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "end");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

intptr_t sub_10000528C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005294(id a1, id a2)
{
  if (a2)
    (*((void (**)(id))a2 + 2))(a2);
}

NSExtensionItem *__cdecl sub_1000052A8(id a1, WFContentItem *a2, unint64_t a3)
{
  WFContentItem *v3;
  Class v4;
  Class v5;
  void *v6;

  v3 = a2;
  v4 = NSClassFromString(CFSTR("WFEvernoteContentItem"));
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    || (v5 = NSClassFromString(CFSTR("WFDropboxItemContentItem")), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFContentItem minimalExtensionItem](v3, "minimalExtensionItem"));
  }

  return (NSExtensionItem *)v6;
}

void sub_100005320(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v18 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "runnerClient"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "runnerClient"));
      objc_msgSend(v9, "stop");

    }
    v10 = objc_alloc((Class)WFActionExtensionWorkflowRunnerClient);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "workflowID"));
    v12 = objc_msgSend(v10, "initWithWorkflowIdentifier:input:javaScriptRunners:", v11, v18, *(_QWORD *)(a1 + 48));
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 24);
    *(_QWORD *)(v13 + 24) = v12;

    v15 = *(void **)(a1 + 32);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "runnerClient"));
    objc_msgSend(v16, "setDelegate:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "runnerClient"));
    objc_msgSend(v17, "start");

  }
  else
  {
    objc_msgSend(v7, "finishWithOutput:error:cancelled:", 0, a4, 0);
  }

}

void sub_100005428(uint64_t a1, void *a2)
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a2;
  v4 = objc_opt_new(NSMutableDictionary);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), (_QWORD)v13);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentItems"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[WFContentCollection collectionWithItems:](WFContentCollection, "collectionWithItems:", v11));

  objc_msgSend(WeakRetained, "runWorkflow:withInput:javaScriptRunners:", *(_QWORD *)(a1 + 32), v12, v4);
}

void sub_100005590(id a1, WFNSExtensionItemContentItem *a2, unint64_t a3, id a4)
{
  -[WFNSExtensionItemContentItem preloadImportantItemsWithCompletionHandler:](a2, "preloadImportantItemsWithCompletionHandler:", a4);
}

id sub_10000559C(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = sub_1000055F4();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v1, v1, 0));

  return v4;
}

id sub_1000055F4()
{
  if (qword_10000CC88 != -1)
    dispatch_once(&qword_10000CC88, &stru_100008618);
  return (id)qword_10000CC80;
}

void sub_100005634(id a1)
{
  BOOL v1;
  uint64_t WFGeneralLogObject;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  Dl_info v7;
  uint8_t buf[4];
  const char *v9;

  memset(&v7, 0, sizeof(v7));
  if (dladdr(sub_1000055F4, &v7))
    v1 = v7.dli_fname == 0;
  else
    v1 = 1;
  if (v1)
  {
    WFGeneralLogObject = getWFGeneralLogObject();
    v3 = objc_claimAutoreleasedReturnValue(WFGeneralLogObject);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "WFCurrentBundle_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s WFLocalizedString failed to locate current bundle", buf, 0xCu);
    }
  }
  else
  {
    v3 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v7.dli_fname, 0, 0);
    v4 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    v5 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v4));
    v6 = (void *)qword_10000CC80;
    qword_10000CC80 = v5;

  }
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLForSimulatingHandoffWithActivityType_userInfo_webpageURL_fromSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForSimulatingHandoffWithActivityType:userInfo:webpageURL:fromSource:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__extensionHostAuditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extensionHostAuditToken");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessSpecifierForAuditToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessSpecifierForAuditToken:");
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

id objc_msgSend_associatedAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedAppBundleIdentifier");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachments");
}

id objc_msgSend_attributedContentText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedContentText");
}

id objc_msgSend_attributedTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedTitle");
}

id objc_msgSend_backgroundAssertionWithName_expirationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundAssertionWithName:expirationHandler:");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_cancelRequestWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelRequestWithError:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collectionWithItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionWithItems:");
}

id objc_msgSend_completeRequestReturningItems_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeRequestReturningItems:completionHandler:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_contentItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentItems");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_defaultDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultDatabase");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_deserializeUserInfoAtURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deserializeUserInfoAtURL:completionHandler:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_effectiveInputClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveInputClasses");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "end");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileWithURL_options_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileWithURL:options:ofType:");
}

id objc_msgSend_finishWithItems_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithItems:error:");
}

id objc_msgSend_finishWithOutput_error_cancelled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithOutput:error:cancelled:");
}

id objc_msgSend_generateCollectionByCoercingToItemClasses_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateCollectionByCoercingToItemClasses:completionHandler:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_if_compactMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "if_compactMap:");
}

id objc_msgSend_if_mapAsynchronously_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "if_mapAsynchronously:completionHandler:");
}

id objc_msgSend_initFileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_initWithActivityType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityType:");
}

id objc_msgSend_initWithWorkflowIdentifier_input_javaScriptRunners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWorkflowIdentifier:input:javaScriptRunners:");
}

id objc_msgSend_initializeProcessWithDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeProcessWithDatabase:");
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputItems");
}

id objc_msgSend_instantiateWorkflowFromSingleUseToken_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instantiateWorkflowFromSingleUseToken:error:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFileURL");
}

id objc_msgSend_itemWithObject_sourceAppBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemWithObject:sourceAppBundleIdentifier:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "items");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mappedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mappedData");
}

id objc_msgSend_minimalExtensionItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimalExtensionItem");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameters");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_processAndRunWorkflow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processAndRunWorkflow:");
}

id objc_msgSend_proposedSharedTemporaryFileURLForFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proposedSharedTemporaryFileURLForFilename:");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_referenceForWorkflowID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referenceForWorkflowID:");
}

id objc_msgSend_registerHandler_forIncomingRequestsWithAction_scheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerHandler:forIncomingRequestsWithAction:scheme:");
}

id objc_msgSend_registeredTypeIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registeredTypeIdentifiers");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_runWorkflow_withInput_javaScriptRunners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runWorkflow:withInput:javaScriptRunners:");
}

id objc_msgSend_runnerClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runnerClient");
}

id objc_msgSend_setContentItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentItems:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExtensionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtensionContext:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedAppGroupDirectoryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAppGroupDirectoryURL");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_systemShortcutsUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemShortcutsUserDefaults");
}

id objc_msgSend_temporaryFileURLBySerializingUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporaryFileURLBySerializingUserInfo:");
}

id objc_msgSend_typeWithUTType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeWithUTType:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_wf_isContainedByDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wf_isContainedByDirectoryAtURL:");
}

id objc_msgSend_wf_securelyArchivedDataWithRootObject_deletionResponsibility_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wf_securelyArchivedDataWithRootObject:deletionResponsibility:");
}

id objc_msgSend_wf_securelyUnarchiveObjectWithData_allowedClasses_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:");
}

id objc_msgSend_workflowID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflowID");
}

id objc_msgSend_workflowIdentifierConsumingSingleUseToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflowIdentifierConsumingSingleUseToken:");
}

id objc_msgSend_workflowWithReference_database_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflowWithReference:database:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}
