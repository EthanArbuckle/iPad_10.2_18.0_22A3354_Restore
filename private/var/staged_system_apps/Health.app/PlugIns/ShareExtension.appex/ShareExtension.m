void sub_10000477C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7 && (v6 = objc_opt_class(NSURL), (objc_opt_isKindOfClass(v7, v6) & 1) != 0))
    objc_msgSend(*(id *)(a1 + 32), "_extractZipContent:", v7);
  else
    objc_msgSend(*(id *)(a1 + 32), "_logError:message:", v5, CFSTR("Failed to deliver zip contents to share extension"));
  objc_msgSend(*(id *)(a1 + 32), "_shareProviderFinished");

}

void sub_10000480C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7 && (v6 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v7, v6) & 1) != 0))
    objc_msgSend(*(id *)(a1 + 32), "_prepareXMLData:", v7);
  else
    objc_msgSend(*(id *)(a1 + 32), "_logError:message:", v5, CFSTR("Failed to deliver XML content to share extension"));
  objc_msgSend(*(id *)(a1 + 32), "_shareProviderFinished");

}

void sub_100004980(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathname"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR(".xml"));

  v6 = v10;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataWithMaxSizeBytes:error:", 4999999, 0));
    v8 = objc_msgSend(*(id *)(a1 + 32), "_containsPasswordProtectedData:", v7);
    v9 = *(void **)(a1 + 32);
    if ((v8 & 1) != 0)
      objc_msgSend(v9, "_passwordProtectedZip");
    else
      objc_msgSend(v9, "_prepareXMLData:", v7);

    v6 = v10;
  }

}

id sub_10000512C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postDocumentPreview");
}

id sub_100005134(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissShareExtension");
}

id sub_10000513C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissShareExtension");
}

id sub_100005144(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissShareExtension");
}

void sub_100005438(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v3[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v3[1] = v2;
  v3[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v1, "setTransform:", v3);

}

void sub_10000554C(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000055D4;
  block[3] = &unk_1000082A8;
  v9 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_1000055D4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  if (*(_BYTE *)(a1 + 48))
    goto LABEL_2;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (!v3)
  {
    objc_msgSend(v2, "_logError:message:", 0, CFSTR("Failed to save documents in health kit -- no error provided"));
LABEL_2:
    objc_msgSend(*(id *)(a1 + 32), "_dismissShareExtension");
    return;
  }
  objc_msgSend(v2, "_logError:message:", v3, CFSTR("Failed to save documents in health kit"));
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CDA_SHARE_ALERT_TITLE"), &stru_100008528, CFSTR("HealthUI-Localizable")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localizedDescription"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000056F8;
  v8[3] = &unk_100008280;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "_importAlertWithTitle:message:doneHandler:", v6, v7, v8);

}

id sub_1000056F8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissShareExtension");
}

void sub_100005784(uint64_t a1)
{
  void *v2;
  CGFloat v3;
  void *v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "frame");
  CGAffineTransformMakeTranslation(&v6, 0.0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v5 = v6;
  objc_msgSend(v4, "setTransform:", &v5);

}

void sub_1000057FC(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionContext"));
  objc_msgSend(v1, "completeRequestReturningItems:completionHandler:", 0, 0);

}

uint64_t sub_100005970(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100005A80(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t *sub_100005AF4(uint64_t a1)
{
  uint64_t *result;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  result = *(uint64_t **)(a1 + 32);
  if (result[3] <= 0)
    return (uint64_t *)objc_msgSend(result, "_allShareProvidersFinished");
  return result;
}

id sub_100005BA0(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_100005C0C(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

uint64_t sub_100005C80(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

id sub_100005E8C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "startAnimating");
}

void sub_100005EE8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100005EF4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100005F00(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  sub_100005EF4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Error enumerating contents of %@: %@", (uint8_t *)&v3);
}

void sub_100005F7C(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "localizedDescription"));
  v8 = 138412546;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  sub_100005EF4((void *)&_mh_execute_header, v5, v7, "Share extension problem: %@: %@", (uint8_t *)&v8);

}

void sub_100006030(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  v6 = 138412290;
  v7 = v4;
  sub_100005EE8((void *)&_mh_execute_header, v3, v5, "Share extension problem: %@", (uint8_t *)&v6);

}

void sub_1000060CC(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100005EE8((void *)&_mh_execute_header, a2, a3, "Share extension problem: %@", (uint8_t *)&v3);
}

id objc_msgSend_CDADocumentSampleWithData_startDate_endDate_metadata_validationError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CDADocumentSampleWithData:startDate:endDate:metadata:validationError:");
}

id objc_msgSend__addDocumentForPreview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addDocumentForPreview:");
}

id objc_msgSend__containsPasswordProtectedData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_containsPasswordProtectedData:");
}

id objc_msgSend__dismissShareExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissShareExtension");
}

id objc_msgSend__extractFirstOccurrenceOfTagRule_extactor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extractFirstOccurrenceOfTagRule:extactor:");
}

id objc_msgSend__extractZipContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extractZipContent:");
}

id objc_msgSend__fetchShareData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchShareData");
}

id objc_msgSend__importAlertWithTitle_message_doneHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_importAlertWithTitle:message:doneHandler:");
}

id objc_msgSend__incomingDocument(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_incomingDocument");
}

id objc_msgSend__logError_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logError:message:");
}

id objc_msgSend__passwordProtectedZip(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_passwordProtectedZip");
}

id objc_msgSend__preflightForCDA_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preflightForCDA:");
}

id objc_msgSend__prepareXMLData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareXMLData:");
}

id objc_msgSend__shareProviderFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shareProviderFinished");
}

id objc_msgSend__shareProviderLoading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shareProviderLoading");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addTagSpecificationForExtraction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTagSpecificationForExtraction:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachments");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_completeRequestReturningItems_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeRequestReturningItems:completionHandler:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithMaxSizeBytes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithMaxSizeBytes:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSource");
}

id objc_msgSend_enabledSamples(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabledSamples");
}

id objc_msgSend_enumerateEntriesWithError_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateEntriesWithError:block:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_getDataForTagSpecification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDataForTagSpecification:");
}

id objc_msgSend_hasItemConformingToTypeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasItemConformingToTypeIdentifier:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDocuments_presentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDocuments:presentationStyle:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithPathname_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPathname:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputItems");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadItemForTypeIdentifier_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadItemForTypeIdentifier:options:completionHandler:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_parseWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseWithData:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathname(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathname");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_registeredTypeIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registeredTypeIdentifiers");
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightBarButtonItem");
}

id objc_msgSend_saveObjects_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveObjects:withCompletion:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setHidesWhenStopped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidesWhenStopped:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewControllers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllers:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}
