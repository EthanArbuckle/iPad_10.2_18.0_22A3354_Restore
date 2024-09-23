@implementation TUCollaborationHighlightProvider

- (TUCollaborationHighlightProvider)init
{
  TUCollaborationHighlightProvider *v2;
  void *v3;
  objc_class *v4;
  SWHighlightCenter *v5;
  SWHighlightCenter *highlightCenter;
  uint64_t v7;
  NSMutableDictionary *collaborationIdentifierToPendingCollaborations;
  uint64_t v9;
  NSMutableDictionary *collaborationIdentifierToBundleIDs;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v12.receiver = self;
  v12.super_class = (Class)TUCollaborationHighlightProvider;
  v2 = -[TUCollaborationHighlightProvider init](&v12, sel_init);
  if (v2)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v3 = (void *)getSWHighlightCenterClass_softClass;
    v17 = getSWHighlightCenterClass_softClass;
    if (!getSWHighlightCenterClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getSWHighlightCenterClass_block_invoke;
      v13[3] = &unk_1E38A1710;
      v13[4] = &v14;
      __getSWHighlightCenterClass_block_invoke((uint64_t)v13);
      v3 = (void *)v15[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v14, 8);
    v5 = (SWHighlightCenter *)objc_alloc_init(v4);
    highlightCenter = v2->_highlightCenter;
    v2->_highlightCenter = v5;

    -[SWHighlightCenter setDelegate:](v2->_highlightCenter, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    collaborationIdentifierToPendingCollaborations = v2->_collaborationIdentifierToPendingCollaborations;
    v2->_collaborationIdentifierToPendingCollaborations = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    collaborationIdentifierToBundleIDs = v2->_collaborationIdentifierToBundleIDs;
    v2->_collaborationIdentifierToBundleIDs = (NSMutableDictionary *)v9;

  }
  return v2;
}

- (id)collaborationHighlightForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[TUCollaborationHighlightProvider collaborationIdentifierToPendingCollaborations](self, "collaborationIdentifierToPendingCollaborations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[TUCollaborationHighlightProvider highlightCenter](self, "highlightCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[TUCollaborationHighlightProvider highlightCenter](self, "highlightCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "collaborationHighlightForIdentifier:error:", v4, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[TUCollaborationHighlightProvider highlightCenter](self, "highlightCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fetchAttributionsForHighlight:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        getSWCollaborationHighlightClass();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;

          v6 = v12;
        }

      }
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)ckBundleIDForCollaborationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[TUCollaborationHighlightProvider collaborationIdentifierToBundleIDs](self, "collaborationIdentifierToBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[TUCollaborationHighlightProvider collaborationHighlightForIdentifier:](self, "collaborationHighlightForIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collaborationMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ckAppBundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "highlights");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "collaborationsDidChange highlights: %@", buf, 0xCu);

  }
  v21 = v4;

  -[TUCollaborationHighlightProvider collaborationIdentifierToPendingCollaborations](self, "collaborationIdentifierToPendingCollaborations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[TUCollaborationHighlightProvider highlightCenter](self, "highlightCenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "collaborationHighlightForIdentifier:error:", v14, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          TUDefaultLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v14;
            _os_log_impl(&dword_19A50D000, v17, OS_LOG_TYPE_DEFAULT, "Collaboration populated for: %@", buf, 0xCu);
          }

          -[TUCollaborationHighlightProvider collaborationIdentifierToPendingCollaborations](self, "collaborationIdentifierToPendingCollaborations");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeObjectForKey:", v14);

          -[TUCollaborationHighlightProvider collaborationIdentifierToBundleIDs](self, "collaborationIdentifierToBundleIDs");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObjectForKey:", v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  -[TUCollaborationHighlightProvider delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "collaborationsDidChange:", self);

}

- (id)addTemporaryCollaboration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ci"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCollaborationHighlightProvider collaborationHighlightForIdentifier:](self, "collaborationHighlightForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Not adding temporary collaboration, already populated", (uint8_t *)&v19, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (v8)
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Adding temporary collaboration", (uint8_t *)&v19, 2u);
  }

  v6 = (void *)objc_msgSend(objc_alloc((Class)getSWCollaborationHighlightClass()), "initWithDictionary:", v4);
  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Collaboration highlight: %@  collaboration Identifier: %@", (uint8_t *)&v19, 0x16u);
  }

  if (v5 && v6)
  {
    -[TUCollaborationHighlightProvider collaborationIdentifierToPendingCollaborations](self, "collaborationIdentifierToPendingCollaborations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v5);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ckAppBundleIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      TUDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ckAppBundleIDs"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v13;
        _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "Collaboration bundleIDS: %@", (uint8_t *)&v19, 0xCu);

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ckAppBundleIDs"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");
      -[TUCollaborationHighlightProvider collaborationIdentifierToBundleIDs](self, "collaborationIdentifierToBundleIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v5);

    }
    -[TUCollaborationHighlightProvider delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject collaborationsDidChange:](v7, "collaborationsDidChange:", self);
    goto LABEL_15;
  }
LABEL_16:
  v17 = v6;

  return v17;
}

- (TUCollaborationProviderDelegate)delegate
{
  return (TUCollaborationProviderDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (SWHighlightCenter)highlightCenter
{
  return self->_highlightCenter;
}

- (NSMutableDictionary)collaborationIdentifierToPendingCollaborations
{
  return self->_collaborationIdentifierToPendingCollaborations;
}

- (NSMutableDictionary)collaborationIdentifierToBundleIDs
{
  return self->_collaborationIdentifierToBundleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationIdentifierToBundleIDs, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifierToPendingCollaborations, 0);
  objc_storeStrong((id *)&self->_highlightCenter, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
