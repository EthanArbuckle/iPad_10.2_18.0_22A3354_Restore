@implementation UISystemNavigationAction

- (UISystemNavigationAction)initWithDestinationContexts:(id)a3 forResponseOnQueue:(id)a4 withHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  UISystemNavigationAction *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  UISystemNavigationAction *v24;
  id v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v26 = a4;
  v10 = a5;
  if (v9)
  {
    objc_msgSend(v9, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", &unk_1E1A97C08);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISystemNavigationAction.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!destinationsToContexts || [[destinationsToContexts allKeys] containsObject:@(UISystemNavigationActionResponseDestinationPrimary)]"));

    }
  }
  v14 = self;
  v15 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "integerValue") == 1)
          v23 = 2;
        else
          v23 = 1;
        objc_msgSend(v15, "setObject:forSetting:", v22, v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v18);
  }

  v27.receiver = v14;
  v27.super_class = (Class)UISystemNavigationAction;
  v24 = -[UISystemNavigationAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v27, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v15, v26, v10, 0.0);

  return v24;
}

- (UISystemNavigationAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return -[UISystemNavigationAction initWithDestinationContexts:forResponseOnQueue:withHandler:](self, "initWithDestinationContexts:forResponseOnQueue:withHandler:", 0, a5, a6, a4);
}

- (NSArray)destinations
{
  NSArray *destinations;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v11[4];
  NSArray *v12;

  destinations = self->_destinations;
  if (!destinations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemNavigationAction info](self, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__UISystemNavigationAction_destinations__block_invoke;
    v11[3] = &unk_1E16C7550;
    v7 = v4;
    v12 = v7;
    objc_msgSend(v6, "enumerateRangesUsingBlock:", v11);

    v8 = self->_destinations;
    self->_destinations = v7;
    v9 = v7;

    destinations = self->_destinations;
  }
  return destinations;
}

void __40__UISystemNavigationAction_destinations__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v5;
  void *v6;
  void *v7;

  if (a2 < a2 + a3)
  {
    v3 = a3;
    v5 = a2 - 2;
    do
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5 == 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      ++v5;
      --v3;
    }
    while (v3);
  }
}

- (id)titleForDestination:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[UISystemNavigationAction _destinationContextForResponseDestination:](self, "_destinationContextForResponseDestination:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bundleIdForDestination:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[UISystemNavigationAction _destinationContextForResponseDestination:](self, "_destinationContextForResponseDestination:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)URLForDestination:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[UISystemNavigationAction _destinationContextForResponseDestination:](self, "_destinationContextForResponseDestination:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sceneIdentifierForDestination:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[UISystemNavigationAction _destinationContextForResponseDestination:](self, "_destinationContextForResponseDestination:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)sendResponseForDestination:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[UISystemNavigationAction _destinationContextForResponseDestination:](self, "_destinationContextForResponseDestination:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D017D0]);
    v7 = v6;
    if (a3 == 1)
      v8 = 2;
    else
      v8 = 1;
    objc_msgSend(v6, "setObject:forSetting:", MEMORY[0x1E0C9AAB0], v8);
    objc_msgSend(MEMORY[0x1E0D016A8], "responseWithInfo:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemNavigationAction sendResponse:](self, "sendResponse:", v9);

  }
  return v5 != 0;
}

- (id)_destinationContextForResponseDestination:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (a3 == 1)
    v3 = 2;
  else
    v3 = 1;
  -[UISystemNavigationAction info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)UIActionType
{
  return 16;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("secondaryDestinationContext");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("primaryDestinationContext");
  else
    return (id)v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  void *v5;
  void *v6;

  -[UISystemNavigationAction _destinationContextForResponseDestination:](self, "_destinationContextForResponseDestination:", a5, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinations, 0);
}

@end
