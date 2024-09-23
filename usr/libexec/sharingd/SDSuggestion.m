@implementation SDSuggestion

+ (id)placeholderSuggestion
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setIsPlaceholder:", 1);
  objc_msgSend(v2, "setTransportBundleIdentifier:", CFSTR("SDSuggestionTransportIdentifierPlaceholder"));
  return v2;
}

- (SDSuggestion)initWithSuggestion:(id)a3
{
  id v5;
  SDSuggestion *v6;
  SDSuggestion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SDSuggestion;
  v6 = -[SDSuggestion init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestion, a3);
    -[SDSuggestion _configure](v7, "_configure");
  }

  return v7;
}

- (void)_configure
{
  SDSuggestion *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *i;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  const __CFString *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  SDSuggestion *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id obj;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  char v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];

  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestion suggestion](self, "suggestion"));
  if (!v4)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SDSuggestion.m"), 69, CFSTR("suggestion must be set."));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupName"));
  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v5, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF != %@"), v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipients"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("handle")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:", v9));
    v13 = v6;
    v14 = objc_msgSend(v12, "mutableCopy");

    v15 = v14;
    v16 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipients"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("contact")));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filteredArrayUsingPredicate:", v9));
    v20 = objc_msgSend(v19, "mutableCopy");

    v21 = 0;
    v22 = v15;
    goto LABEL_65;
  }
  v78 = v6;
  v79 = v7;
  v72 = v5;
  v73 = v3;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipients"));
  v24 = objc_msgSend(v23, "count");

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v75 = v4;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipients"));
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
  if (!v25)
  {
    v76 = 0;
    v82 = 0;
    v28 = 0;
    goto LABEL_52;
  }
  v26 = v25;
  v76 = 0;
  v27 = 0;
  v83 = 0;
  v82 = 0;
  v28 = 0;
  v84 = *(_QWORD *)v86;
  if ((unint64_t)v24 <= 1)
    v29 = 0;
  else
    v29 = 1000;
  v74 = v29;
  do
  {
    for (i = 0; i != v26; i = (char *)i + 1)
    {
      if (*(_QWORD *)v86 != v84)
        objc_enumerationMutation(obj);
      v31 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i);
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "displayName"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "contact"));
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "handle"));
      v35 = (void *)v34;
      if (v33)
      {
        objc_msgSend(v81, "addObject:", v33);
      }
      else if (v34)
      {
        v36 = objc_msgSend(objc_alloc((Class)CNMutableContact), "initWithIdentifier:", v34);
        objc_msgSend(v81, "addObject:", v36);
        ++v76;

      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identifier"));
      if (v37)
        objc_msgSend(v80, "addObject:", v37);

      if (objc_msgSend((id)v32, "length"))
        goto LABEL_23;
      if (objc_msgSend(v33, "isKeyAvailable:", CNContactNicknameKey))
      {
        v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "nickname"));

        v32 = v38;
      }
      if (objc_msgSend((id)v32, "length"))
      {
LABEL_23:
        if (!v35)
          goto LABEL_29;
      }
      else
      {
        v47 = objc_msgSend(v33, "mutableCopy");
        objc_msgSend(v47, "setMiddleName:", &stru_10072FE60);
        v48 = objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v47, v74));

        v32 = v48;
        if (!v35)
          goto LABEL_29;
      }
      if (v32
        && (v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "bundleID")),
            v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.mobilemail")),
            v39,
            v40))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ <%@>"), v32, v35));
        objc_msgSend(v78, "addObject:", v41);

      }
      else
      {
        objc_msgSend(v78, "addObject:", v35);
      }
      objc_msgSend(v79, "addObject:", v35);
LABEL_29:
      if ((v27 & 1) != 0)
      {
        if ((v83 & 1) != 0)
          goto LABEL_34;
        if (!v28 && v32)
        {
          v28 = (uint64_t)(id)v32;
LABEL_34:
          v27 = 1;
          v83 = 1;
          goto LABEL_48;
        }
        if (!(v28 | v32))
          v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "handle"));
        v83 = 0;
        v27 = 1;
      }
      else if (v32)
      {
        if (v82)
          v42 = v82;
        else
          v42 = (void *)v28;
        v43 = v42;

        v44 = (id)v32;
        v27 = 1;
        v82 = v44;
        v28 = (uint64_t)v43;
      }
      else
      {
        v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "handle"));
        v46 = v45;
        if (v82)
        {

          v27 = 0;
          v28 = v46;
        }
        else
        {
          v27 = 0;
          v82 = (void *)v45;
        }
      }
LABEL_48:

    }
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
  }
  while (v26);
LABEL_52:

  v16 = v72;
  if (objc_msgSend(v72, "length"))
  {
    v4 = v75;
    v20 = v81;
    v22 = v78;
    goto LABEL_64;
  }
  v4 = v75;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "recipients"));
  v50 = objc_msgSend(v49, "count");

  v20 = v81;
  v22 = v78;
  if (v50 != (id)1)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "recipients"));
    v53 = objc_msgSend(v52, "count");

    if (v53 == (id)2)
    {
      v55 = CFSTR("SUGGESTED_CONVERSATION_TWO_PARTICIPANTS");
    }
    else
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "recipients"));
      v57 = objc_msgSend(v56, "count");

      if (v57 != (id)3)
      {
        v60 = SFLocalizedStringForKey(CFSTR("SUGGESTED_CONVERSATION_MORE_PARTICIPANTS"), v54);
        v59 = objc_claimAutoreleasedReturnValue(v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "recipients"));
        v51 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v59, v82, v28, (char *)objc_msgSend(v61, "count") - 2));

        goto LABEL_62;
      }
      v55 = CFSTR("SUGGESTED_CONVERSATION_THREE_PARTICIPANTS");
    }
    v58 = SFLocalizedStringForKey(v55, v54);
    v59 = objc_claimAutoreleasedReturnValue(v58);
    v51 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v59, v82, v28));

LABEL_62:
    v16 = (void *)v59;
    goto LABEL_63;
  }
  v51 = v82;
LABEL_63:

  v16 = v51;
LABEL_64:

  v3 = v73;
  v15 = v79;
  v21 = v76;
LABEL_65:
  -[SDSuggestion setDisplayName:](v3, "setDisplayName:", v16);
  -[SDSuggestion setFormattedHandles:](v3, "setFormattedHandles:", v22);
  -[SDSuggestion setHandles:](v3, "setHandles:", v15);
  -[SDSuggestion setContactsIdentifiers:](v3, "setContactsIdentifiers:", v80);
  -[SDSuggestion setContacts:](v3, "setContacts:", v20);
  -[SDSuggestion setTransientContactsCount:](v3, "setTransientContactsCount:", v21);
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestion _caseSensitiveBundleIDFromBundleID:](v3, "_caseSensitiveBundleIDFromBundleID:", v62));
  -[SDSuggestion setTransportBundleIdentifier:](v3, "setTransportBundleIdentifier:", v63);

  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipients"));
  -[SDSuggestion setRecipients:](v3, "setRecipients:", v64);

  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversationIdentifier"));
  -[SDSuggestion setConversationIdentifier:](v3, "setConversationIdentifier:", v65);

  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "derivedIntentIdentifier"));
  -[SDSuggestion setDerivedIntentIdentifier:](v3, "setDerivedIntentIdentifier:", v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupName"));
  -[SDSuggestion setGroupName:](v3, "setGroupName:", v67);

  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));
  -[SDSuggestion setImage:](v3, "setImage:", v68);

  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reason"));
  if (v69)
  {
    -[SDSuggestion setReason:](v3, "setReason:", v69);
  }
  else
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reasonType"));
    -[SDSuggestion setReason:](v3, "setReason:", v70);

  }
}

- (id)_caseSensitiveBundleIDFromBundleID:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  __CFString *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilesms"));

  if ((v5 & 1) != 0)
    v6 = CFSTR("com.apple.MobileSMS");
  else
    v6 = (__CFString *)v3;

  return v6;
}

- (id)createPeopleSuggestion
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestion conversationIdentifier](self, "conversationIdentifier"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", 24, 12));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lowercaseString"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestion image](self, "image"));
  v10 = objc_alloc((Class)SFPeopleSuggestion);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestion displayName](self, "displayName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestion transportBundleIdentifier](self, "transportBundleIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestion contacts](self, "contacts"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDSuggestion formattedHandles](self, "formattedHandles"));
  LOBYTE(v17) = -[SDSuggestion isPlaceholder](self, "isPlaceholder");
  v15 = objc_msgSend(v10, "initWithIdentifier:displayName:transportBundleIdentifier:contacts:formattedHandles:donatedImage:placeholder:", v5, v11, v12, v13, v14, v9, v17);

  if (v9)
    -[SDSuggestion _requestSandboxExtensionForDonatedImage:](self, "_requestSandboxExtensionForDonatedImage:", v9);

  return v15;
}

- (void)_requestSandboxExtensionForDonatedImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  NSData *v9;
  void *v10;
  id v11;
  NSObject *v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_imageData"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_uri"));
    if (objc_msgSend(v5, "isFileURL"))
    {
      v6 = APP_SANDBOX_READ;
      v7 = objc_retainAutorelease(v5);
      v8 = (const char *)sandbox_extension_issue_file(v6, objc_msgSend(v7, "fileSystemRepresentation"), 0);
      if (v8)
      {
        v9 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v8, strlen(v8) + 1, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        objc_msgSend(v3, "_setSandboxExtensionData:", v10);

      }
      else
      {
        v11 = share_sheet_log();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_100023DC0(v7, v12);

      }
    }

  }
}

- (_PSSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)formattedHandles
{
  return self->_formattedHandles;
}

- (void)setFormattedHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)contactsIdentifiers
{
  return self->_contactsIdentifiers;
}

- (void)setContactsIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)transportBundleIdentifier
{
  return self->_transportBundleIdentifier;
}

- (void)setTransportBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (void)setConversationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)derivedIntentIdentifier
{
  return self->_derivedIntentIdentifier;
}

- (void)setDerivedIntentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)transientContactsCount
{
  return self->_transientContactsCount;
}

- (void)setTransientContactsCount:(int64_t)a3
{
  self->_transientContactsCount = a3;
}

- (INImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_derivedIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_transportBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contactsIdentifiers, 0);
  objc_storeStrong((id *)&self->_formattedHandles, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
