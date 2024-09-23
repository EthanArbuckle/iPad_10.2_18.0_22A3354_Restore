@implementation SBUISystemApertureElementPresentationSession

- (void)activateWithElementProvider:(id)a3
{
  void *v5;
  SBSSystemApertureScenePresentationSessionClient *v6;
  SBSSystemApertureScenePresentationSessionClient *client;
  void *v8;
  id obj;

  obj = a3;
  if ((SBUIIsSystemApertureEnabled() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleSourceDidConnect_, CFSTR("SBUISystemApertureElementSourceDidConnectNotification"), 0);

    objc_storeWeak((id *)&self->_elementProvider, obj);
    v6 = (SBSSystemApertureScenePresentationSessionClient *)objc_alloc_init(MEMORY[0x1E0DAB008]);
    client = self->_client;
    self->_client = v6;

    -[SBSSystemApertureScenePresentationSessionClient requestScene](self->_client, "requestScene");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("requested system aperture sscene when system aperture not available."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBUISystemApertureElementPresentationSession activateWithElementProvider:].cold.1(a2, (uint64_t)self, (uint64_t)v8);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)dealloc
{
  void *v3;
  SBSSystemApertureScenePresentationSessionClient *client;
  objc_super v5;

  -[SBSSystemApertureScenePresentationSessionClient connection](self->_client, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  client = self->_client;
  self->_client = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBUISystemApertureElementPresentationSession;
  -[SBUISystemApertureElementPresentationSession dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  -[SBSSystemApertureScenePresentationSessionClient destroyScene](self->_client, "destroyScene");
}

- (void)_handleSourceDidConnect:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "identityToken");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[SBUISystemApertureElementPresentationSession _associateWithSourceWithIdentityToken:](self, "_associateWithSourceWithIdentityToken:", v9);
}

- (void)_associateWithSourceIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  void *v8;
  id obj;

  v4 = a3;
  if (v4)
  {
    obj = v4;
    objc_msgSend(v4, "systemApertureElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = obj;
    if (!v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_associatedSource);

      if (!WeakRetained)
      {
        objc_storeWeak((id *)&self->_associatedSource, obj);
        v7 = objc_loadWeakRetained((id *)&self->_elementProvider);
        objc_msgSend(obj, "setSystemApertureElementViewControllerProvider:", v7);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("SBUISystemApertureElementSourceDidConnectNotification"), 0);

      v4 = obj;
    }
  }

}

- (void)_associateWithSourceWithIdentityToken:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  +[SBUISystemApertureElementSource openSources](SBUISystemApertureElementSource, "openSources", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "identityToken");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSSystemApertureScenePresentationSessionClient identityToken](self->_client, "identityToken");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (v12)
        {
          -[SBUISystemApertureElementPresentationSession _associateWithSourceIfNeeded:](self, "_associateWithSourceIfNeeded:", v9);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_associatedSource);
  objc_destroyWeak((id *)&self->_elementProvider);
}

- (void)activateWithElementProvider:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBUISystemApertureElementPresentationSession.m");
  v16 = 1024;
  v17 = 27;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1A471F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
