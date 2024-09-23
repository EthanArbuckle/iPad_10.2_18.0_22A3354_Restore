void sub_10000294C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));

  if (v7)
  {
    v8 = objc_alloc((Class)EKVirtualConferenceURLDescriptor);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FaceTime"), &stru_100004270, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));
    v12 = objc_msgSend(v8, "initWithTitle:URL:", v10, v11);

    v13 = objc_alloc((Class)EKVirtualConferenceDescriptor);
    v16 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    v15 = objc_msgSend(v13, "initWithTitle:URLDescriptors:conferenceDetails:", 0, v14, 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100002BD8(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5 && (a2 & 1) == 0)
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", EKVirtualConferenceProviderErrorDomain, 4, 0));
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100002D18(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6 && (objc_msgSend(v5, "isLocallyCreated") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "_conversationManager"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100002E20;
    v11[3] = &unk_1000041C0;
    v9 = a1[5];
    v10 = a1[4];
    v12 = v9;
    v13 = v10;
    v14 = v5;
    v15 = a1[6];
    objc_msgSend(v8, "checkLinkValidity:completionHandler:", v14, v11);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

void sub_100002E20(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  NSErrorUserInfoKey v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || !a2)
  {
    if (!a2)
    {
      v10 = v8;
      if (v10)
        goto LABEL_7;
      goto LABEL_6;
    }
LABEL_9:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_conversationManager"));
    v15 = *(_QWORD *)(a1 + 32);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100003000;
    v17[3] = &unk_100004198;
    v16 = *(_QWORD *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v14, "renewLink:expirationDate:reason:completionHandler:", v16, v15, 1, v17);

    v10 = v18;
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32)) == (id)-1)
    goto LABEL_9;
  v10 = v9;
  if (v10 || (a2 & 1) != 0)
    goto LABEL_7;
LABEL_6:
  v19 = NSLocalizedDescriptionKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("URL is invalid, possibly expired. Unable to renew."), &stru_100004270, 0));
  v20 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", EKVirtualConferenceProviderErrorDomain, 5, v13));
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_10:

}

uint64_t sub_100003000(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000030E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000031D4(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
    objc_msgSend(*(id *)(a1 + 32), "__findFullLinkForLink:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

id objc_msgSend_FacetimeAppBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FacetimeAppBundleID");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend___findFullLinkForLink_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__findFullLinkForLink:completion:");
}

id objc_msgSend__conversationManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_conversationManager");
}

id objc_msgSend__getFullLinkFromLink_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getFullLinkFromLink:completion:");
}

id objc_msgSend__requiredAppInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requiredAppInstalled");
}

id objc_msgSend__requiredServiceAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requiredServiceAvailable");
}

id objc_msgSend__retrieveFullLinkFromLink_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_retrieveFullLinkFromLink:completion:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_checkLinkValidity_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkLinkValidity:completionHandler:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_conversationLinkForURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationLinkForURL:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_generateLinkWithInvitedMemberHandles_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateLinkWithInvitedMemberHandles:completionHandler:");
}

id objc_msgSend_getActiveLinksWithCreatedOnly_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getActiveLinksWithCreatedOnly:completionHandler:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithTitle_URL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:URL:");
}

id objc_msgSend_initWithTitle_URLDescriptors_conferenceDetails_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:URLDescriptors:conferenceDetails:");
}

id objc_msgSend_initWithTitle_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:identifier:");
}

id objc_msgSend_invalidateLink_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateLink:completionHandler:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEquivalentToConversationLink_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEquivalentToConversationLink:");
}

id objc_msgSend_isLocallyCreated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocallyCreated");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_renewLink_expirationDate_reason_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renewLink:expirationDate:reason:completionHandler:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}
