@implementation SBHFeatureIntroductionManager

- (SBHFeatureIntroductionManager)init
{
  SBHFeatureIntroductionManager *v2;
  uint64_t v3;
  NSMutableDictionary *allFeatureIntroductionItems;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHFeatureIntroductionManager;
  v2 = -[SBHFeatureIntroductionManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    allFeatureIntroductionItems = v2->_allFeatureIntroductionItems;
    v2->_allFeatureIntroductionItems = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)featureLocationKeyFromLocation:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return off_1E8D880F0[a3 - 1];
}

- (unint64_t)featureLocationFromMask:(unint64_t)a3
{
  unint64_t v3;
  __int128 v4;

  *((_QWORD *)&v4 + 1) = a3;
  *(_QWORD *)&v4 = a3 - 2;
  v3 = v4 >> 1;
  if (v3 > 7)
    return 0;
  else
    return qword_1D0190F60[v3];
}

- (id)featureIntroductionItemsSetAtLocation:(unint64_t)a3
{
  NSMutableDictionary *allFeatureIntroductionItems;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;

  allFeatureIntroductionItems = self->_allFeatureIntroductionItems;
  -[SBHFeatureIntroductionManager featureLocationKeyFromLocation:](self, "featureLocationKeyFromLocation:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](allFeatureIntroductionItems, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_allFeatureIntroductionItems;
    -[SBHFeatureIntroductionManager featureLocationKeyFromLocation:](self, "featureLocationKeyFromLocation:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](v8, "setValue:forKey:", v7, v9);

  }
  return v7;
}

- (void)addFeatureIntroductionItem:(id)a3 atLocations:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10 || !a4)
    goto LABEL_8;
  if ((a4 & 2) != 0)
  {
    -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

    if ((a4 & 4) == 0)
    {
LABEL_5:
      if ((a4 & 8) == 0)
        goto LABEL_6;
LABEL_11:
      -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

      if ((a4 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((a4 & 4) == 0)
  {
    goto LABEL_5;
  }
  -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v10);

  if ((a4 & 8) != 0)
    goto LABEL_11;
LABEL_6:
  if ((a4 & 0x10) != 0)
  {
LABEL_7:
    -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
LABEL_8:

}

- (void)removeFeatureIntroductionItem:(id)a3 atLocations:(unint64_t)a4
{
  char v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  if ((v4 & 2) != 0)
  {
    -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v10);

    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
LABEL_9:
      -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v10);

      if ((v4 & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v10);

  if ((v4 & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 0x10) != 0)
  {
LABEL_5:
    -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v10);

  }
LABEL_6:

}

- (void)removeFeatureIntroductionAtAllLocationsWithItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 8));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v4);

  -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 16));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v4);

}

- (void)removeAllFeatureIntroductionsAtLocations:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if ((a3 & 2) != 0)
  {
    -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 2));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_3;
  }
  -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      return;
LABEL_9:
    -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 16));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllObjects");

    return;
  }
LABEL_8:
  -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", 8));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  if ((v3 & 0x10) != 0)
    goto LABEL_9;
}

- (id)featureIntroductionItemAtLocation:(unint64_t)a3
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = 4;
  v4 = a3 & 0x10;
  if ((a3 & 8) != 0)
    v4 = 8;
  if ((a3 & 4) == 0)
    v3 = v4;
  if ((a3 & 2) != 0)
    v5 = 2;
  else
    v5 = v3;
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[SBHFeatureIntroductionManager featureIntroductionItemsSetAtLocation:](self, "featureIntroductionItemsSetAtLocation:", -[SBHFeatureIntroductionManager featureLocationFromMask:](self, "featureLocationFromMask:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)featureIntroductionItemAtLocation:(unint64_t)a3 withIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SBHFeatureIntroductionManager featureIntroductionItemAtLocation:](self, "featureIntroductionItemAtLocation:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "featureIntroductionIdentifier", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v6);

        if ((v15 & 1) != 0)
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (NSString)description
{
  return (NSString *)-[SBHFeatureIntroductionManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHFeatureIntroductionManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_allFeatureIntroductionItems, CFSTR("_allFeatureIntroductionItems"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHFeatureIntroductionManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allFeatureIntroductionItems, 0);
}

@end
