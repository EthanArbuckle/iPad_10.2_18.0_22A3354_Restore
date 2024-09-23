@implementation SBDisplayItem

+ (SBDisplayItem)displayItemWithType:(int64_t)a3 bundleIdentifier:(id)a4 uniqueIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:bundleIdentifier:uniqueIdentifier:", a3, v9, v8);

  return (SBDisplayItem *)v10;
}

- (SBDisplayItem)initWithType:(int64_t)a3 bundleIdentifier:(id)a4 uniqueIdentifier:(id)a5
{
  id v9;
  id v10;
  SBDisplayItem *v11;
  SBDisplayItem *v12;
  uint64_t v13;
  NSString *bundleIdentifier;
  uint64_t v15;
  NSString *uniqueIdentifier;
  uint64_t v17;
  NSString *uniqueStringRepresentation;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  objc_super v25;

  v9 = a4;
  v10 = a5;
  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayItem.m"), 206, CFSTR("Must have type & identifier %@, %@"), 0, v9);

    if (v9)
    {
LABEL_3:
      if (a3)
        goto LABEL_6;
      goto LABEL_4;
    }
  }
  else if (v9)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if ((unint64_t)a3 > 7)
    v23 = 0;
  else
    v23 = off_1E8EA42C0[a3];
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayItem.m"), 207, CFSTR("Must have type & identifier %@, %@"), v23, 0);

  if (a3)
    goto LABEL_6;
LABEL_4:
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.webapp")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayItem.m"), 208, CFSTR("Web App Bundle ID must be accompanied by SBDisplayItemTypeWebApp type"));

  }
LABEL_6:
  v25.receiver = self;
  v25.super_class = (Class)SBDisplayItem;
  v11 = -[SBDisplayItem init](&v25, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v13 = objc_msgSend(v9, "copy");
    bundleIdentifier = v12->_bundleIdentifier;
    v12->_bundleIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    uniqueIdentifier = v12->_uniqueIdentifier;
    v12->_uniqueIdentifier = (NSString *)v15;

    -[SBDisplayItem _calculateUniqueStringRepresentation](v12, "_calculateUniqueStringRepresentation");
    v17 = objc_claimAutoreleasedReturnValue();
    uniqueStringRepresentation = v12->_uniqueStringRepresentation;
    v12->_uniqueStringRepresentation = (NSString *)v17;

  }
  return v12;
}

- (id)_calculateUniqueStringRepresentation
{
  void *v3;
  unint64_t type;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  type = self->_type;
  if (type > 7)
    v5 = 0;
  else
    v5 = off_1E8EA42C0[type];
  -[SBDisplayItem bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayItem uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_uniqueStringRepresentation, "hash");
}

+ (id)displayItemForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    objc_msgSend(a3, "workspaceEntity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isApplicationSceneEntity"))
    {
      objc_msgSend(v3, "applicationSceneEntity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sceneHandle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v3, "isAppClipPlaceholderEntity"))
      {
        objc_msgSend(v3, "appClipPlaceholderEntity");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "futureSceneIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 0, v7, v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_11:

        return v6;
      }
      if (!objc_msgSend(v3, "isCaptureExtensionEntity"))
      {
        +[SBDisplayItem homeScreenDisplayItem](SBDisplayItem, "homeScreenDisplayItem");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      objc_msgSend(v3, "captureExtensionEntity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hostableEntity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v5;
    objc_msgSend(v5, "displayItemRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v6 = 0;
  return v6;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueStringRepresentation;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uniqueStringRepresentation = self->_uniqueStringRepresentation;
    objc_msgSend(v4, "uniqueStringRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqual:](uniqueStringRepresentation, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)uniqueStringRepresentation
{
  return self->_uniqueStringRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong(&self->_sceneIdentifierFromBundleIdentifierGenerator, 0);
  objc_storeStrong((id *)&self->_uniqueStringRepresentation, 0);
}

+ (id)applicationDisplayItemWithBundleIdentifier:(id)a3 sceneIdentifier:(id)a4
{
  return +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 0, a3, a4);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBDisplayItem descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  unint64_t type;
  __CFString *v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  type = self->_type;
  if (type > 7)
    v6 = 0;
  else
    v6 = off_1E8EA42C0[type];
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("type"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  return v4;
}

+ (id)homeScreenDisplayItem
{
  void *v2;
  void *v3;

  FBSystemAppBundleID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 1, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)remoteAlertDisplayItemWithServiceBundleIdentifier:(id)a3
{
  return +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 2, a3, 0);
}

+ (id)switcherServiceDisplayItemWithServiceIdentifier:(id)a3
{
  return +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 3, a3, 0);
}

+ (id)webAppDisplayItemWithWebAppIdentifier:(id)a3
{
  return +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 5, CFSTR("com.apple.webapp"), a3);
}

- (SBDisplayItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayItem.m"), 201, CFSTR("use initWithType:..."));

  return 0;
}

- (SBDisplayItem)initWithPlistRepresentation:(id)a3
{
  return (SBDisplayItem *)-[SBDisplayItem _initWithPlistRepresentation:sceneIdentifierFromBundleIdentifierGenerator:](self, "_initWithPlistRepresentation:sceneIdentifierFromBundleIdentifierGenerator:", a3, 0);
}

- (id)_initWithPlistRepresentation:(id)a3 sceneIdentifierFromBundleIdentifierGenerator:(id)a4
{
  id v6;
  void *v7;
  id sceneIdentifierFromBundleIdentifierGenerator;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  sceneIdentifierFromBundleIdentifierGenerator = self->_sceneIdentifierFromBundleIdentifierGenerator;
  self->_sceneIdentifierFromBundleIdentifierGenerator = v7;

  v9 = objc_opt_class();
  v10 = v6;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  if (v12)
  {
    v13 = -[SBDisplayItem _initWithDictionaryPlistRepresentation:](self, "_initWithDictionaryPlistRepresentation:", v12);
  }
  else
  {
    v14 = objc_opt_class();
    v15 = v10;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v17 = v16;

    v13 = -[SBDisplayItem _initWithArrayPlistRepresentation:](self, "_initWithArrayPlistRepresentation:", v17);
  }
  v18 = v13;

  return v18;
}

- (id)_initWithDictionaryPlistRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBDisplayItem *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("itemType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("bundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v5 && v6)
  {
    v9 = SBDisplayItemTypeFromLegacyType(v5);
    if (v9 == 5)
    {
      +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:](SBWebApplication, "_webAppIdentifierFromWebClipIdentifier:", v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    self = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:](self, "initWithType:bundleIdentifier:uniqueIdentifier:", v9, v6, v7);
    v8 = self;
  }

  return v8;
}

- (id)_initWithArrayPlistRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  __CFString *v10;
  id v11;
  id v12;
  SBDisplayItem *v13;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;

  v4 = a3;
  v5 = v4;
  if (v4 && (unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v12 = v9;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    v17 = v15;
    if (v16)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v10 = v18;

    if ((unint64_t)objc_msgSend(v5, "count") < 3)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_class();
      v21 = v19;
      if (v20)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
      }
      else
      {
        v22 = 0;
      }
      v11 = v22;

    }
    v13 = 0;
    if (v12 && v10)
    {
      v23 = SBDisplayItemTypeFromLegacyType(v12);
      v24 = v23;
      if (v23 || v11)
      {
        if (v23 == 5)
        {
          if (v11)
          {
            +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:](SBWebApplication, "_webAppIdentifierFromWebClipIdentifier:", v11);
            v25 = objc_claimAutoreleasedReturnValue();

            v11 = (id)v25;
          }
          else
          {
            +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:](SBWebApplication, "_webAppIdentifierFromWebClipIdentifier:", v10);
            v11 = (id)objc_claimAutoreleasedReturnValue();
            v26 = CFSTR("com.apple.webapp");

            v10 = v26;
          }
        }
      }
      else
      {
        v11 = -[SBDisplayItem _newSceneIdentifierForBundleIdentifier:](self, "_newSceneIdentifierForBundleIdentifier:", v10);
      }
      self = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:](self, "initWithType:bundleIdentifier:uniqueIdentifier:", v24, v10, v11);
      v13 = self;
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }

  return v13;
}

- (SBDisplayItem)initWithLegacyPlistRepresentation:(id)a3
{
  return (SBDisplayItem *)-[SBDisplayItem _initWithLegacyPlistRepresentation:sceneIdentifierFromBundleIdentifierGenerator:](self, "_initWithLegacyPlistRepresentation:sceneIdentifierFromBundleIdentifierGenerator:", a3, 0);
}

- (id)_initWithLegacyPlistRepresentation:(id)a3 sceneIdentifierFromBundleIdentifierGenerator:(id)a4
{
  id v6;
  void *v7;
  id sceneIdentifierFromBundleIdentifierGenerator;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  id v17;
  SBDisplayItem *v18;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  sceneIdentifierFromBundleIdentifierGenerator = self->_sceneIdentifierFromBundleIdentifierGenerator;
  self->_sceneIdentifierFromBundleIdentifierGenerator = v7;

  v9 = objc_opt_class();
  SBSafeCast(v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "count") == 2)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = SBDisplayItemTypeFromLegacyType(v11);
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 == 5)
    {
      v15 = CFSTR("com.apple.webapp");
      +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:](SBWebApplication, "_webAppIdentifierFromWebClipIdentifier:", v14);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
      v16 = 0;
      if (v12)
      {
LABEL_9:
        self = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:](self, "initWithType:bundleIdentifier:uniqueIdentifier:", v12, v15, v16);

        v18 = self;
        goto LABEL_10;
      }
      v15 = v13;
      v17 = -[SBDisplayItem _newSceneIdentifierForBundleIdentifier:](self, "_newSceneIdentifierForBundleIdentifier:", v15);
    }
    v16 = v17;
    goto LABEL_9;
  }
  v18 = 0;
LABEL_10:

  return v18;
}

- (id)_newSceneIdentifierForBundleIdentifier:(id)a3
{
  _QWORD *sceneIdentifierFromBundleIdentifierGenerator;
  void (*v4)(_QWORD *, id);
  id v5;
  void *v6;
  id v7;

  sceneIdentifierFromBundleIdentifierGenerator = self->_sceneIdentifierFromBundleIdentifierGenerator;
  if (sceneIdentifierFromBundleIdentifierGenerator)
  {
    v4 = (void (*)(_QWORD *, id))sceneIdentifierFromBundleIdentifierGenerator[2];
    v5 = a3;
    v4(sceneIdentifierFromBundleIdentifierGenerator, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = a3;
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "newSceneIdentifierForBundleIdentifier:", v7);

  }
  return v6;
}

- (NSString)webClipIdentifier
{
  void *v3;
  void *v4;

  if (-[SBDisplayItem type](self, "type") == 5)
  {
    -[SBDisplayItem uniqueIdentifier](self, "uniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:](SBWebApplication, "_webClipIdentifierFromWebAppIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (id)plistRepresentation
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = -[SBDisplayItem type](self, "type");
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  v12[0] = CFSTR("itemType");
  if (v3 > 7)
    v6 = 0;
  else
    v6 = off_1E8EA42C0[v3];
  v13[0] = v6;
  v12[1] = CFSTR("bundleID");
  -[SBDisplayItem bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 5)
    -[SBDisplayItem webClipIdentifier](self, "webClipIdentifier");
  else
    -[SBDisplayItem uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("uniqueID"));

  return v9;
}

+ (SBDisplayItem)displayItemWithProtobufRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    switch(-[SBPBDisplayItem type]((uint64_t)v3))
    {
      case 1u:
        v5 = 1;
        goto LABEL_9;
      case 2u:
        v5 = 2;
        goto LABEL_9;
      case 3u:
        v5 = 3;
        goto LABEL_9;
      case 4u:
        v5 = 4;
        goto LABEL_9;
      case 5u:
        -[SBPBDisplayItem bundleIdentifier]((uint64_t)v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBPBDisplayItem webClipIdentifier]((uint64_t)v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:](SBWebApplication, "_webAppIdentifierFromWebClipIdentifier:", v10);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = 0;
        }

        v5 = 5;
        goto LABEL_10;
      default:
        v5 = 0;
LABEL_9:
        -[SBPBDisplayItem bundleIdentifier]((uint64_t)v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBPBDisplayItem sceneIdentifier]((uint64_t)v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", v5, v7, v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        break;
    }
  }
  else
  {
    v6 = 0;
  }

  return (SBDisplayItem *)v6;
}

- (id)protobufRepresentation
{
  SBPBDisplayItem *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v4 = objc_alloc_init(SBPBDisplayItem);
  v5 = -[SBDisplayItem type](self, "type");
  v6 = protobufDisplayItemTypeFromType(v5);
  -[SBPBDisplayItem setType:]((uint64_t)v4, v6);
  -[SBDisplayItem bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPBDisplayItem setBundleIdentifier:]((uint64_t)v4, v7);

  if (v5 == 5)
  {
    -[SBDisplayItem webClipIdentifier](self, "webClipIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayItem.m"), 371, CFSTR("Malformed display item"));

    }
    -[SBDisplayItem webClipIdentifier](self, "webClipIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPBDisplayItem setWebClipIdentifier:]((uint64_t)v4, v9);
  }
  else
  {
    -[SBDisplayItem uniqueIdentifier](self, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPBDisplayItem setSceneIdentifier:]((uint64_t)v4, v9);
  }

  return v4;
}

- (BOOL)isHomeScreenDisplayItem
{
  void *v3;
  void *v4;
  char v5;

  if (-[SBDisplayItem type](self, "type") != 1)
    return 0;
  -[SBDisplayItem bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FBSystemAppBundleID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast((uint64_t)v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SBDisplayItem uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compare:", v8);

    if (!v9)
    {
      v10 = -[SBDisplayItem type](self, "type");
      if (v10 <= objc_msgSend(v6, "type"))
      {
        v11 = -[SBDisplayItem type](self, "type");
        if (v11 >= objc_msgSend(v6, "type"))
          v9 = 0;
        else
          v9 = -1;
      }
      else
      {
        v9 = 1;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)-[SBDisplayItem descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDisplayItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayItemForFloatingDockSuggestionsComparison
{
  void *v3;
  unint64_t v4;
  SBDisplayItem *v5;
  SBDisplayItem *v6;

  -[SBDisplayItem bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBDisplayItem type](self, "type");
  if (v4 > 7)
  {
    v6 = 0;
  }
  else
  {
    if (((1 << v4) & 0xEE) != 0)
    {
      v5 = self;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 0, v3, 0);
      v5 = (SBDisplayItem *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
  }

  return v6;
}

- (BOOL)isEqualToDisplayItemForFloatingDockSuggestions:(id)a3
{
  id v4;
  BOOL v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  unsigned int v10;

  v4 = a3;
  if (-[SBDisplayItem isEqual:](self, "isEqual:", v4))
  {
    v5 = 1;
  }
  else
  {
    v6 = -[SBDisplayItem type](self, "type");
    if (v6 == objc_msgSend(v4, "type"))
    {
      -[SBDisplayItem bundleIdentifier](self, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = BSEqualObjects();
      v10 = (0x11u >> v6) & 1;
      if (v6 > 7)
        LOBYTE(v10) = 0;
      if (v9)
        v5 = v10;
      else
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end
