@implementation PUAirPlayContentRegistry

- (PUAirPlayContentRegistry)init
{
  PUAirPlayContentRegistry *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAirPlayContentRegistry;
  v2 = -[PUAirPlayContentRegistry init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAirPlayContentRegistry _setContentProviders:](v2, "_setContentProviders:", v3);

  }
  return v2;
}

- (void)addContentProvider:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[PUAirPlayContentRegistry _indexOfContentProvider:](self, "_indexOfContentProvider:") == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PUAirPlayContentRegistry _contentProviders](self, "_contentProviders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addPointer:", v5);

    -[PUAirPlayContentRegistry _invalidateCurrentContent](self, "_invalidateCurrentContent");
  }

}

- (BOOL)isContentProviderRegistered:(id)a3
{
  return -[PUAirPlayContentRegistry _indexOfContentProvider:](self, "_indexOfContentProvider:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)removeContentProvider:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[PUAirPlayContentRegistry _indexOfContentProvider:](self, "_indexOfContentProvider:", v8);
  v5 = v8;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    if (-[PUAirPlayContentRegistry isCurrentContentProvider:](self, "isCurrentContentProvider:", v8))
      -[PUAirPlayContentRegistry _invalidateCurrentContent](self, "_invalidateCurrentContent");
    -[PUAirPlayContentRegistry _contentProviders](self, "_contentProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removePointerAtIndex:", v6);

    v5 = v8;
  }

}

- (unint64_t)_indexOfContentProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PUAirPlayContentRegistry _contentProviders](self, "_contentProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__PUAirPlayContentRegistry__indexOfContentProvider___block_invoke;
  v10[3] = &unk_1E58A8250;
  v11 = v4;
  v7 = v4;
  v8 = objc_msgSend(v6, "indexOfObjectWithOptions:passingTest:", 2, v10);

  return v8;
}

- (void)_invalidateCurrentContent
{
  -[PUAirPlayContentRegistry _setCachedCurrentContent:](self, "_setCachedCurrentContent:", 0);
}

- (PHAirPlayControllerContentProvider)currentContentProvider
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];

  -[PUAirPlayContentRegistry _contentProviders](self, "_contentProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4 - 1 < 0)
  {
LABEL_7:
    v8 = 0;
  }
  else
  {
    v5 = v4;
    while (1)
    {
      objc_msgSend(v3, "pointerAtIndex:", --v5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
        break;
      PXAssertGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_error_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "An AirPlay content provider deallocated without deregistering as a provider.", v10, 2u);
      }

      if (v5 <= 0)
        goto LABEL_7;
    }
    v8 = (void *)v6;
  }
  if ((void *)-[PUAirPlayContentRegistry lastContentProviderPtr](self, "lastContentProviderPtr") != v8)
  {
    -[PUAirPlayContentRegistry setLastContentProviderPtr:](self, "setLastContentProviderPtr:", v8);
    -[PUAirPlayContentRegistry _invalidateCurrentContent](self, "_invalidateCurrentContent");
  }

  return (PHAirPlayControllerContentProvider *)v8;
}

- (BOOL)isCurrentContentProvider:(id)a3
{
  return -[PUAirPlayContentRegistry lastContentProviderPtr](self, "lastContentProviderPtr") == (_QWORD)a3;
}

- (id)contentForController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUAirPlayContentRegistry _cachedCurrentContent](self, "_cachedCurrentContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PUAirPlayContentRegistry currentContentProvider](self, "currentContentProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentViewControllerForAirPlayController:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAirPlayContentRegistry _setCachedCurrentContent:](self, "_setCachedCurrentContent:", v5);

  }
  return v5;
}

- (void)clearContent
{
  -[PUAirPlayContentRegistry _setCachedCurrentContent:](self, "_setCachedCurrentContent:", 0);
}

- (NSPointerArray)_contentProviders
{
  return self->__contentProviders;
}

- (void)_setContentProviders:(id)a3
{
  objc_storeStrong((id *)&self->__contentProviders, a3);
}

- (UIViewController)_cachedCurrentContent
{
  return self->__cachedCurrentContent;
}

- (void)_setCachedCurrentContent:(id)a3
{
  objc_storeStrong((id *)&self->__cachedCurrentContent, a3);
}

- (unint64_t)lastContentProviderPtr
{
  return self->_lastContentProviderPtr;
}

- (void)setLastContentProviderPtr:(unint64_t)a3
{
  self->_lastContentProviderPtr = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedCurrentContent, 0);
  objc_storeStrong((id *)&self->__contentProviders, 0);
}

BOOL __52__PUAirPlayContentRegistry__indexOfContentProvider___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  result = *(_QWORD *)(a1 + 32) == a2;
  *a4 = result;
  return result;
}

@end
