void sub_100002974(id a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v1 = objc_alloc((Class)TFContainer);
  v2 = objc_msgSend(objc_alloc((Class)NUExtensionFrameworkAssembly), "initWithExtensionContextProvider:", 0);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  v4 = objc_msgSend(v1, "initWithBundleAssemblies:assemblies:", v3, &__NSArray0__struct);
  v5 = (void *)qword_100008840;
  qword_100008840 = (uint64_t)v4;

}

void sub_100002D88(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError naq_errorFailedValidationForIdentifier:](NSError, "naq_errorFailedValidationForIdentifier:", *(_QWORD *)(a1 + 32)));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

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

id objc_msgSend_articleContainerViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "articleContainerViewController");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_initWithBundleAssemblies_assemblies_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleAssemblies:assemblies:");
}

id objc_msgSend_initWithExtensionContextProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExtensionContextProvider:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_loadWithArticleIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadWithArticleIDs:");
}

id objc_msgSend_naq_errorFailedUnexpectedArticleLoadedWithIdentifier_expectedIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "naq_errorFailedUnexpectedArticleLoadedWithIdentifier:expectedIdentifier:");
}

id objc_msgSend_naq_errorFailedValidationForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "naq_errorFailedValidationForIdentifier:");
}

id objc_msgSend_previewItemCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previewItemCallback");
}

id objc_msgSend_previewItemIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previewItemIdentifier");
}

id objc_msgSend_resolveClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolveClass:");
}

id objc_msgSend_resolver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolver");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setLinkPreviewing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLinkPreviewing:");
}

id objc_msgSend_setPreviewItemCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviewItemCallback:");
}

id objc_msgSend_setPreviewItemIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviewItemIdentifier:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_validateSearchableItemIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateSearchableItemIdentifier:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}
