@implementation NSURL

+ (id)mf_URLForMessageLibraryID:(id)a3 externalID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSURLComponents);
  objc_msgSend(v7, "setScheme:", EMAppleMailURLScheme);
  objc_msgSend(v7, "setHost:", CFSTR("message"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@"), v5));
  objc_msgSend(v7, "setPath:", v8);

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("uuid"), v6));
    v13 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    objc_msgSend(v7, "setQueryItems:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));

  return v11;
}

+ (id)mf_fileURLInTempAppendingTimestampedPathComponent:(id)a3 withExtension:(id)a4
{
  id v5;
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_URLByAppendingTimestampedPathComponent:withExtension:", v5, v6));

  return v10;
}

- (BOOL)mf_isInternallyHandleable
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
  if (objc_msgSend(v3, "caseInsensitiveCompare:", EMMailToURLScheme)
    && objc_msgSend(v3, "caseInsensitiveCompare:", EMAppleMailReplyURLScheme)
    && objc_msgSend(v3, "caseInsensitiveCompare:", EMAppleMailForwardURLScheme)
    && objc_msgSend(v3, "caseInsensitiveCompare:", EMMessageIDURLScheme)
    && objc_msgSend(v3, "caseInsensitiveCompare:", EMAppleMailHandoffPayloadURLScheme)
    && objc_msgSend(v3, "caseInsensitiveCompare:", EMAppleMailShowVIPMessagesURLScheme)
    && objc_msgSend(v3, "caseInsensitiveCompare:", EMAppleMailShowVIPSettingsURLScheme))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL searchResultIdentifier](self, "searchResultIdentifier"));
    v5 = v4 == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)mf_isDocumentURL
{
  void *v3;
  BOOL v4;

  if (!-[NSURL ef_hasScheme:](self, "ef_hasScheme:", EMAppleMailURLScheme)
    || !-[NSURL ef_hasHost:](self, "ef_hasHost:", CFSTR("document")))
  {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (BOOL)mf_isOAuthRedirectURL
{
  void *v3;
  void *v4;

  if (qword_10003FBB0 != -1)
    dispatch_once(&qword_10003FBB0, &stru_1000351B8);
  v3 = (void *)qword_10003FBA8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
  LOBYTE(v3) = objc_msgSend(v3, "ef_caseInsensitiveIsEqualToString:", v4);

  return (char)v3;
}

- (id)mf_messageCriterion
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL em_internalMessageID](self, "em_internalMessageID"));
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%lld"), objc_msgSend(v3, "databaseID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion criterionForLibraryID:](MFMessageCriterion, "criterionForLibraryID:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "externalID"));
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc((Class)MFMessageCriterion), "initWithType:qualifier:expression:", 36, 3, v6);
      v13[0] = v5;
      v13[1] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
      v9 = (id)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v8));

    }
    else
    {
      v9 = v5;
    }

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL em_messageIDHeader](self, "em_messageIDHeader"));
    if (v10)
    {
      v9 = objc_msgSend(objc_alloc((Class)MFMessageCriterion), "initWithType:qualifier:expression:", 1, 3, v10);
      objc_msgSend(v9, "setCriterionIdentifier:", ECMessageHeaderKeyMessageID);
    }
    else if (-[NSURL mf_isDocumentURL](self, "mf_isDocumentURL"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](self, "lastPathComponent"));
      if (!v11)
      {
        v9 = 0;
        goto LABEL_13;
      }
      v9 = (id)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion criterionForDocumentID:](MFMessageCriterion, "criterionForDocumentID:", v11));

    }
    else
    {
      v9 = 0;
    }

  }
LABEL_13:

  return v9;
}

- (id)mf_conversationCriterion
{
  void *v3;
  void *v4;
  id v5;

  if (-[NSURL ef_hasScheme:](self, "ef_hasScheme:", EMAppleMailURLScheme)
    && -[NSURL ef_hasHost:](self, "ef_hasHost:", CFSTR("conversation")))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL pathComponents](self, "pathComponents"));
    if (objc_msgSend(v3, "count") == (id)2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
      v5 = objc_msgSend(objc_alloc((Class)MFMessageCriterion), "initWithType:qualifier:expression:", 34, 3, v4);

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
