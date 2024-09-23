@implementation PPRankableSocialHighlightUtils

+ (int)socialContactSourceForContactSource:(unsigned __int8)a3
{
  int v3;

  if (a3 == 2)
    v3 = 1;
  else
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

+ (id)rankableHighlightFromSyncedItem:(id)a3 applicationIdentifiers:(id)a4 clientIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
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
  void *v20;
  void *v21;
  void *v22;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "highlight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHighlightIdentifier:", v12);

  objc_msgSend(v9, "highlight");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "score");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v10, "setScore:");

  v15 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v10, "setApplicationIdentifiers:", v15);

  objc_msgSend(v10, "setClientIdentifier:", v7);
  objc_msgSend(v9, "highlight");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resourceURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResourceUrl:", v18);

  objc_msgSend(v9, "highlight");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timestamp");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "setSyndicationSecondsSinceReferenceDate:");

  objc_msgSend(v9, "originatingDeviceId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOriginatingDeviceId:", v21);

  objc_msgSend(v9, "rankingDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "setRankingSecondsSinceReferenceDate:");

  return v10;
}

+ (id)rankableHighlightFromSearchableItem:(id)a3 attribution:(id)a4 autoDonatingChats:(id)a5 applicationIdentifiers:(id)a6 clientIdentifier:(id)a7 variant:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
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
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  uint8_t buf[4];
  id v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a7;
  v19 = (void *)objc_opt_new();
  v20 = (void *)objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v19, "setApplicationIdentifiers:", v20);

  objc_msgSend(v19, "setClientIdentifier:", v18);
  objc_msgSend(v19, "setVariant:", v17);

  objc_msgSend(v13, "attributeSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "absoluteString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setResourceUrl:", v23);

  objc_msgSend(v19, "resourceUrl");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v13, "attributeSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "attributeForKey:", CFSTR("com_apple_mobilesms_resolvedURL"));
    v26 = objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v19, "setResolvedUrl:", v26);
    }
    objc_msgSend(v13, "attributeSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "URL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "resolvedUrl");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29 && objc_msgSend(v28, "nr_isNewsURL"))
    {
      v30 = objc_alloc(MEMORY[0x1E0C99E98]);
      objc_msgSend(v19, "resolvedUrl");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "initWithString:", v31);

      v28 = (void *)v32;
    }
    objc_msgSend(v28, "_lp_simplifiedURLStringForFuzzyMatching");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      objc_msgSend(v28, "absoluteString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v34)
      {
        v33 = v34;
      }
      else
      {
        objc_msgSend(v13, "attributeSet");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "URL");
        v84 = v26;
        v38 = v16;
        v39 = v28;
        v40 = v15;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "absoluteString");
        v33 = (id)objc_claimAutoreleasedReturnValue();

        v15 = v40;
        v28 = v39;
        v16 = v38;
        v26 = v84;

      }
    }
    v86 = v28;
    pp_private_log_handle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v88 = v33;
      _os_log_debug_impl(&dword_1C392E000, v42, OS_LOG_TYPE_DEBUG, "RankableSocialHighlight using comparisonURL: '%@'", buf, 0xCu);
    }

    objc_msgSend(v33, "dataUsingEncoding:", 4);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D70D00], "Sha256ForData:withSalt:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "base64EncodedStringWithOptions:", 0);
    v44 = objc_claimAutoreleasedReturnValue();

    v83 = (void *)v44;
    objc_msgSend(v19, "setHighlightIdentifier:", v44);
    if (objc_msgSend(v14, "isStarred"))
      v45 = 2;
    else
      v45 = 1;
    objc_msgSend(v19, "setHighlightType:", v45);
    objc_msgSend(v13, "attributeSet");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "contentCreationDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "timeIntervalSinceReferenceDate");
    objc_msgSend(v19, "setContentCreationSecondsSinceReferenceDate:");

    objc_msgSend(v14, "timestamp");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "timeIntervalSinceReferenceDate");
    objc_msgSend(v19, "setSyndicationSecondsSinceReferenceDate:");
    objc_msgSend(v13, "bundleID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSourceBundleId:", v48);

    objc_msgSend(v19, "sourceBundleId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      v81 = v15;
      objc_msgSend(v14, "groupDisplayName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDisplayName:", v50);

      objc_msgSend(v14, "groupPhotoPath");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "dataRepresentation");
      v52 = objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        objc_msgSend(MEMORY[0x1E0D70D00], "Sha256ForData:withSalt:", v52, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "base64EncodedStringWithOptions:", 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "substringToIndex:", 8);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setGroupPhotoPathDigest:", v55);

      }
      objc_msgSend(v14, "identifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAttributionIdentifier:", v56);

      objc_msgSend(v14, "conversationIdentifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDomainIdentifier:", v57);

      v58 = (void *)objc_opt_new();
      objc_msgSend(v58, "setIsMe:", objc_msgSend(v14, "isFromMe"));
      objc_msgSend(v14, "sender");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "handle");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setHandle:", v60);

      objc_msgSend(v58, "setIsSignificant:", 0);
      objc_msgSend(v19, "setSender:", v58);
      objc_msgSend(v14, "conversationIdentifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      {
        objc_msgSend(v14, "conversationIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setIsConversationAutoDonating:", objc_msgSend(v81, "containsObject:", v62));

      }
      objc_msgSend(v13, "attributeSet");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "filename");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setContentDisplayName:", v64);

      objc_msgSend(v19, "contentDisplayName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v65)
      {
        objc_msgSend(v13, "attributeSet");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "contentSnippet");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setContentDisplayName:", v67);

      }
      objc_msgSend(v13, "attributeSet");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "contentType");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setContentType:", v69);

      objc_msgSend(v13, "attributeSet");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "attributeForKey:", CFSTR("com_apple_mobilesms_collaborationIdentifier"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCollaborationIdentifier:", v71);

      objc_msgSend(v19, "setIsCollaboration:", +[PPRankableSocialHighlightUtils isSearchableItemCollaboration:](PPRankableSocialHighlightUtils, "isSearchableItemCollaboration:", v13));
      objc_msgSend(v13, "attributeSet");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "fileProviderID");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFileProviderId:", v73);

      objc_msgSend(v13, "attributeSet");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "attributeForKey:", CFSTR("com_apple_mobilesms_localIdentity"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setLocalIdentity:", v75);

      objc_msgSend(v13, "attributeSet");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "attributeForKey:", CFSTR("com_apple_mobilesms_localIdentityProof"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setLocalIdentityProof:", v77);

      objc_msgSend(v19, "setFromMeEntitlementOverrideIsPresent:", objc_msgSend(v16, "containsObject:", CFSTR("fromMe")));
      if (objc_msgSend(v16, "containsObject:", CFSTR("com.apple.private.sociallayer.highlights")))
      {
        objc_msgSend(v13, "attributeSet");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "attributeForKey:", CFSTR("com_apple_mobilesms_handleToIdentityMap"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setHandleToIdentityMap:", v79);

      }
      v36 = v19;

      v15 = v81;
      v28 = v86;
    }
    else
    {
      pp_default_log_handle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C392E000, v52, OS_LOG_TYPE_FAULT, "RankableSocialHighlight attribute error: bundleID on CSSI is nil", buf, 2u);
      }
      v36 = 0;
    }

  }
  else
  {
    pp_default_log_handle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C392E000, v26, OS_LOG_TYPE_FAULT, "RankableSocialHighlight attribute error: resourceURL cannot be nil on CSSI", buf, 2u);
    }
    v36 = 0;
  }

  return v36;
}

+ (BOOL)isSearchableItemCollaboration:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", *MEMORY[0x1E0CA6408]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)(objc_msgSend(v4, "unsignedIntegerValue") - 1) < 2;

  return v5;
}

@end
