@implementation _ICQDetailFollowupSpecification

- (_ICQDetailFollowupSpecification)initWithServerDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  _ICQDetailFollowupSpecification *v6;
  _ICQDetailFollowupSpecification *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[16];

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "request for detail notification object", buf, 2u);
  }

  v13.receiver = self;
  v13.super_class = (Class)_ICQDetailFollowupSpecification;
  v6 = -[_ICQFollowupSpecification initWithServerDictionary:](&v13, sel_initWithServerDictionary_, v4);
  v7 = v6;
  if (v6)
  {
    -[_ICQDetailFollowupSpecification setBundleId:](v6, "setBundleId:", CFSTR("com.apple.mobileslideshow"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lockScreenInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lockScreenInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQDetailFollowupSpecification setLockScreenInfo:](v7, "setLockScreenInfo:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followUpInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followUpInfo"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQDetailFollowupSpecification setFollowUpInfo:](v7, "setFollowUpInfo:", v11);

    }
  }

  return v7;
}

- (void)setLockScreenInfo:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  int v37;
  void *v38;
  const __CFString *v39;
  NSObject *v40;
  const __CFString *v41;
  NSObject *v42;
  const __CFString *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_lockScreenInfo, a3);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lockTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lockTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ICQHelperFunctions parseTemplates:](_ICQHelperFunctions, "parseTemplates:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQDetailFollowupSpecification setTitleTemplates:](self, "setTitleTemplates:", v9);

  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lockTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      v43 = CFSTR("default");
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lockTitle"));
      v12 = objc_claimAutoreleasedReturnValue();
      v44[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQDetailFollowupSpecification setTitleTemplates:](self, "setTitleTemplates:", v13);

    }
    else
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v37) = 0;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "\"lockTitle\" field not present or of undefined type in lockScreenInfo", (uint8_t *)&v37, 2u);
      }
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lockSubTitle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lockSubTitle"));
    v16 = objc_claimAutoreleasedReturnValue();
    +[_ICQHelperFunctions parseTemplates:](_ICQHelperFunctions, "parseTemplates:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v20 = (void *)v17;
    -[_ICQDetailFollowupSpecification setSubTitleTemplates:](self, "setSubTitleTemplates:", v17);

    goto LABEL_13;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lockSubTitle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v19 = objc_opt_isKindOfClass();

  if ((v19 & 1) != 0)
  {
    v41 = CFSTR("default");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lockSubTitle"));
    v16 = objc_claimAutoreleasedReturnValue();
    v42 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  _ICQGetLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v37) = 0;
    _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, "\"lockSubTitle\" field not present or of undefined type in lockScreenInfo", (uint8_t *)&v37, 2u);
  }
LABEL_13:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lockMessage"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lockMessage"));
    v23 = objc_claimAutoreleasedReturnValue();
    +[_ICQHelperFunctions parseTemplates:](_ICQHelperFunctions, "parseTemplates:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v27 = (void *)v24;
    -[_ICQDetailFollowupSpecification setMesgTemplates:](self, "setMesgTemplates:", v24);

    goto LABEL_18;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lockMessage"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v26 = objc_opt_isKindOfClass();

  if ((v26 & 1) != 0)
  {
    v39 = CFSTR("default");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lockMessage"));
    v23 = objc_claimAutoreleasedReturnValue();
    v40 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  _ICQGetLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v37) = 0;
    _os_log_impl(&dword_1CDEBD000, v23, OS_LOG_TYPE_DEFAULT, "\"lockMessage\" field not present or of undefined type in lockScreenInfo", (uint8_t *)&v37, 2u);
  }
LABEL_18:

  v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("actParams"));
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("action"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("actParams"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", v32, CFSTR("actParams"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("action"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", v33, CFSTR("action"));

      objc_msgSend(v28, "setObject:forKey:", &stru_1E8B3C468, CFSTR("display"));
      _ICQLinkForServerMessageParameter(v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQFollowupSpecification setNoteActivateLink:](self, "setNoteActivateLink:", v34);

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", ICQFollowupNotifyingAppIdKey);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    _ICQGetLogSystem();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 138412290;
      v38 = v35;
      _os_log_impl(&dword_1CDEBD000, v36, OS_LOG_TYPE_DEFAULT, "Lockscreen info contains notifyingAppId %@", (uint8_t *)&v37, 0xCu);
    }

    -[_ICQFollowupSpecification setNotifyingAppId:](self, "setNotifyingAppId:", v35);
  }

}

- (void)setFollowUpInfo:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  uint8_t v21[8];
  const __CFString *v22;
  NSObject *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_followUpInfo, a3);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ICQHelperFunctions parseTemplates:](_ICQHelperFunctions, "parseTemplates:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQDetailFollowupSpecification setFollowupTitleTemplates:](self, "setFollowupTitleTemplates:", v9);

  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      v24 = CFSTR("default");
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
      v12 = objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQDetailFollowupSpecification setFollowupTitleTemplates:](self, "setFollowupTitleTemplates:", v13);

    }
    else
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "\"title\" field not present or of undefined type in followups", v21, 2u);
      }
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mesg"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mesg"));
    v16 = objc_claimAutoreleasedReturnValue();
    +[_ICQHelperFunctions parseTemplates:](_ICQHelperFunctions, "parseTemplates:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v20 = (void *)v17;
    -[_ICQDetailFollowupSpecification setFollowupMesgTemplates:](self, "setFollowupMesgTemplates:", v17);

    goto LABEL_13;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mesg"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v19 = objc_opt_isKindOfClass();

  if ((v19 & 1) != 0)
  {
    v22 = CFSTR("default");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mesg"));
    v16 = objc_claimAutoreleasedReturnValue();
    v23 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  _ICQGetLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, "\"mesg\" field not present or of undefined type in followups", v21, 2u);
  }
LABEL_13:

}

+ (id)replaceWordsIn:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(v6, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v12, v13);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)titleWithKey:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v4 = (__CFString *)a3;
  -[_ICQDetailFollowupSpecification titleTemplates](self, "titleTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ICQDetailFollowupSpecification titleTemplates](self, "titleTemplates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = v4;
  else
    v9 = CFSTR("default");
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)subTitleWithKey:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v4 = (__CFString *)a3;
  -[_ICQDetailFollowupSpecification subTitleTemplates](self, "subTitleTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ICQDetailFollowupSpecification subTitleTemplates](self, "subTitleTemplates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = v4;
  else
    v9 = CFSTR("default");
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)mesgWithKey:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v4 = (__CFString *)a3;
  -[_ICQDetailFollowupSpecification mesgTemplates](self, "mesgTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ICQDetailFollowupSpecification mesgTemplates](self, "mesgTemplates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = v4;
  else
    v9 = CFSTR("default");
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)postFollowupWithController:(id)a3 replaceExisting:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "Posting detail notification", buf, 2u);
  }

  -[_ICQDetailFollowupSpecification bundleId](self, "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89___ICQDetailFollowupSpecification_postFollowupWithController_replaceExisting_completion___block_invoke;
  v14[3] = &unk_1E8B3A288;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  +[_ICQDeviceInfo getInfoWithBundleId:completion:](_ICQDeviceInfo, "getInfoWithBundleId:completion:", v11, v14);

}

- (NSDictionary)lockScreenInfo
{
  return self->_lockScreenInfo;
}

- (NSDictionary)followUpInfo
{
  return self->_followUpInfo;
}

- (NSDictionary)mesgTemplates
{
  return self->_mesgTemplates;
}

- (void)setMesgTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_mesgTemplates, a3);
}

- (NSDictionary)titleTemplates
{
  return self->_titleTemplates;
}

- (void)setTitleTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_titleTemplates, a3);
}

- (NSDictionary)subTitleTemplates
{
  return self->_subTitleTemplates;
}

- (void)setSubTitleTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_subTitleTemplates, a3);
}

- (NSDictionary)followupMesgTemplates
{
  return self->_followupMesgTemplates;
}

- (void)setFollowupMesgTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_followupMesgTemplates, a3);
}

- (NSDictionary)followupTitleTemplates
{
  return self->_followupTitleTemplates;
}

- (void)setFollowupTitleTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_followupTitleTemplates, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_followupTitleTemplates, 0);
  objc_storeStrong((id *)&self->_followupMesgTemplates, 0);
  objc_storeStrong((id *)&self->_subTitleTemplates, 0);
  objc_storeStrong((id *)&self->_titleTemplates, 0);
  objc_storeStrong((id *)&self->_mesgTemplates, 0);
  objc_storeStrong((id *)&self->_followUpInfo, 0);
  objc_storeStrong((id *)&self->_lockScreenInfo, 0);
}

@end
