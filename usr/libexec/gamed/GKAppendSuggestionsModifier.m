@implementation GKAppendSuggestionsModifier

- (GKAppendSuggestionsModifier)initWithSettings:(id)a3 suggestionsProvider:(id)a4
{
  id v7;
  id v8;
  GKAppendSuggestionsModifier *v9;
  id v10;
  id suggestionsProvider;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GKAppendSuggestionsModifier;
  v9 = -[GKAppendSuggestionsModifier init](&v13, "init");
  if (v9)
  {
    v10 = objc_retainBlock(v8);
    suggestionsProvider = v9->_suggestionsProvider;
    v9->_suggestionsProvider = v10;

    objc_storeStrong((id *)&v9->_settings, a3);
  }

  return v9;
}

- (id)modifySuggestions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _BYTE *v9;
  int64_t v10;
  uint64_t (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKAppendSuggestionsModifier settings](self, "settings"));
  v7 = objc_msgSend(v6, "mininumIDsForContactAssociationIDsOnly");

  if (v5 >= v7)
  {
    v24 = v4;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKAppendSuggestionsModifier settings](self, "settings"));
    v9 = objc_msgSend(v8, "suggestionsLimit");
    v10 = v9 - (_BYTE *)objc_msgSend(v4, "count");

    v11 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[GKAppendSuggestionsModifier suggestionsProvider](self, "suggestionsProvider"));
    v12 = v11[2](v11, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkDistinctValuesForKeyPath:", CFSTR("contactID")));
    v15 = objc_msgSend(v4, "mutableCopy");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contactID", (_QWORD)v26));
          v23 = objc_msgSend(v14, "containsObject:", v22);

          if ((v23 & 1) == 0)
            objc_msgSend(v15, "addObject:", v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
    }

    v24 = objc_msgSend(v15, "copy");
  }

  return v24;
}

- (GKFriendSuggesterSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (id)suggestionsProvider
{
  return self->_suggestionsProvider;
}

- (void)setSuggestionsProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suggestionsProvider, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
