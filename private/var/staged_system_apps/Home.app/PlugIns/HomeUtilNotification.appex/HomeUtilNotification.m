void sub_10000285C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000289C(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "announcementsBrowserViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v28[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "announcementsBrowserViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v28[1] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "announcementsBrowserViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v3));
  v28[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "announcementsBrowserViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  v28[3] = v10;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));

  return v12;
}

id objc_msgSend__presentNotificationExtensionForNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentNotificationExtensionForNotification:");
}

id objc_msgSend_activateIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateIfNeeded");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_announcementsBrowserViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "announcementsBrowserViewController");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
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

id objc_msgSend_dismissNotificationContentExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissNotificationContentExtension");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontDescriptorByAddingAttributes:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_initWithNotificationPayload_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNotificationPayload:delegate:");
}

id objc_msgSend_initWithOwningView_constraintBuilder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOwningView:constraintBuilder:");
}

id objc_msgSend_isTearingDown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTearingDown");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_notificationPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationPayload");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_setAnnouncementsBrowserViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnnouncementsBrowserViewController:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setStaticConstraintSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStaticConstraintSet:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_staticConstraintSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "staticConstraintSet");
}

id objc_msgSend_tearDownAudioActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tearDownAudioActivity");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}
