@implementation ActionRequestHandler

- (BOOL)_requiredAppInstalled
{
  id v2;
  void *v3;
  id v4;
  uint64_t v6;

  v2 = objc_alloc((Class)LSApplicationRecord);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EKConferenceUtils FacetimeAppBundleID](EKConferenceUtils, "FacetimeAppBundleID"));
  v6 = 0;
  v4 = objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v6);

  return v4 != 0;
}

- (BOOL)_requiredServiceAvailable
{
  return +[TUCallCapabilities supportsFaceTimeVideoCalls](TUCallCapabilities, "supportsFaceTimeVideoCalls");
}

- (void)fetchAvailableRoomTypesWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, id);
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSErrorUserInfoKey v19;
  void *v20;
  id v21;

  v4 = (void (**)(id, void *, id))a3;
  if (!-[ActionRequestHandler _requiredAppInstalled](self, "_requiredAppInstalled"))
  {
    v19 = NSLocalizedDescriptionKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Application not installed"), &stru_100004270, 0));
    v20 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

    v13 = EKVirtualConferenceProviderErrorDomain;
    v14 = 0;
LABEL_6:
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, v14, v12));

    v4[2](v4, &__NSArray0__struct, v8);
    goto LABEL_7;
  }
  if (!-[ActionRequestHandler _requiredServiceAvailable](self, "_requiredServiceAvailable"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", NSLocalizedDescriptionKey));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Service is not available"), &stru_100004270, 0));
    v18 = v16;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

    v13 = EKVirtualConferenceProviderErrorDomain;
    v14 = 1;
    goto LABEL_6;
  }
  v5 = objc_alloc((Class)EKVirtualConferenceRoomTypeDescriptor);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FaceTime"), &stru_100004270, 0));
  v8 = objc_msgSend(v5, "initWithTitle:identifier:", v7, CFSTR("facetime_identifier"));

  v21 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v4[2](v4, v9, 0);

LABEL_7:
}

- (void)fetchVirtualConferenceForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("facetime_identifier")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionRequestHandler _conversationManager](self, "_conversationManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000294C;
    v10[3] = &unk_100004170;
    v11 = v6;
    objc_msgSend(v7, "generateLinkWithInvitedMemberHandles:completionHandler:", v8, v10);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", EKVirtualConferenceProviderErrorDomain, 3, 0));
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v9);

  }
}

- (void)invalidateURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUConversationLink conversationLinkForURL:](TUConversationLink, "conversationLinkForURL:", a3));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionRequestHandler _conversationManager](self, "_conversationManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100002BD8;
    v10[3] = &unk_100004198;
    v11 = v6;
    objc_msgSend(v8, "invalidateLink:completionHandler:", v7, v10);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", EKVirtualConferenceProviderErrorDomain, 4, 0));
    (*((void (**)(id, void *))v6 + 2))(v6, v9);

  }
}

- (void)extendExpirationOfURL:(id)a3 toExpirationDate:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUConversationLink conversationLinkForURL:](TUConversationLink, "conversationLinkForURL:", a3));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100002D18;
  v13[3] = &unk_1000041E8;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  -[ActionRequestHandler _retrieveFullLinkFromLink:completion:](self, "_retrieveFullLinkFromLink:completion:", v10, v13);

}

- (id)_conversationManager
{
  TUConversationManager *conversationManager;
  TUConversationManager *v4;
  TUConversationManager *v5;

  conversationManager = self->_conversationManager;
  if (!conversationManager)
  {
    v4 = (TUConversationManager *)objc_alloc_init((Class)TUConversationManager);
    v5 = self->_conversationManager;
    self->_conversationManager = v4;

    conversationManager = self->_conversationManager;
  }
  return conversationManager;
}

- (void)_retrieveFullLinkFromLink:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000030E0;
  v7[3] = &unk_100004170;
  v8 = a4;
  v6 = v8;
  -[ActionRequestHandler _getFullLinkFromLink:completion:](self, "_getFullLinkFromLink:completion:", a3, v7);

}

- (void)_getFullLinkFromLink:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (self->_linksOwnedByThisUser)
  {
    -[ActionRequestHandler __findFullLinkForLink:completion:](self, "__findFullLinkForLink:completion:", v6, v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionRequestHandler _conversationManager](self, "_conversationManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000031D4;
    v9[3] = &unk_100004210;
    v11 = v7;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(v8, "getActiveLinksWithCreatedOnly:completionHandler:", 1, v9);

  }
}

- (void)__findFullLinkForLink:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_linksOwnedByThisUser;
  v9 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isEquivalentToConversationLink:", v13, (_QWORD)v14))
        {
          v7[2](v7, v13, 0);

          goto LABEL_11;
        }
      }
      v10 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }

  v7[2](v7, 0, 0);
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linksOwnedByThisUser, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
}

@end
