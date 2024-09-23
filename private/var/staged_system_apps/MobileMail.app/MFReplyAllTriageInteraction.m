@implementation MFReplyAllTriageInteraction

- (MFReplyAllTriageInteraction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFReplyAllTriageInteraction;
  return -[MFReplyTriageInteraction init](&v3, "init");
}

- (void)_performInteraction_Internal
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction emailMessage](self, "emailMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction daemonInterface](self, "daemonInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactionLogger"));
  objc_msgSend(v4, "composeReplyStartedForMessage:", v8);

  v5 = objc_alloc((Class)_MFMailCompositionContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction message](self, "message"));
  v7 = objc_msgSend(v5, "initReplyAllToMessage:legacyMessage:isEML:", v8, v6, -[MFMessageCompositionTriageInteraction isActingOnEML](self, "isActingOnEML"));

  -[MFMessageCompositionTriageInteraction presentComposeWithContext:](self, "presentComposeWithContext:", v7);
}

- (BOOL)isPermitted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *i;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction emailMessage](self, "emailMessage"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction emailMessage](self, "emailMessage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFEmailSet set](MFEmailSet, "set"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toList"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_map:", &stru_100522648));
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ccList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_map:", &stru_100522668));
    objc_msgSend(v5, "addObjectsFromArray:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderList"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_map:", &stru_100522688));
    objc_msgSend(v5, "addObjectsFromArray:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountsProvider"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "account"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "legacyMailAccountForObjectID:", v17));
    v19 = v18;
    if (v18)
      v20 = v18;
    else
      v20 = (id)objc_claimAutoreleasedReturnValue(+[MailAccount defaultMailAccountForDelivery](MailAccount, "defaultMailAccountForDelivery"));
    v23 = v20;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "emailAddressesAndAliasesList", 0));
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v26)
            objc_enumerationMutation(v24);
          objc_msgSend(v5, "removeObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i));
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v25);
    }

    v22 = objc_msgSend(v5, "count") != 0;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction message](self, "message"));
    v22 = objc_msgSend(v21, "canReplyAll");

  }
  return v22;
}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("REPLY_ALL"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerReplyAll;
}

- (id)_iconImageName
{
  return MFImageGlyphReplyAllFill;
}

- (id)_previewImageName
{
  return MFImageGlyphReplyAll;
}

@end
