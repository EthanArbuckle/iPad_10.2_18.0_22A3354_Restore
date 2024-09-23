@implementation UISceneOpenURLOptions

+ (id)_optionsFromPayload:(id)a3 sourceProcessHandle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  UIEventAttribution *v21;
  void *v22;
  UIEventAttribution *v23;
  id v24;
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  uint8_t buf[16];
  uint8_t v32[16];

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("UIApplicationLaunchOptionsSourceApplicationKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("UIApplicationOpenURLOptionsAnnotationKey"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("UIApplicationLaunchOptionsAnnotationKey"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_fault_impl(&dword_185066000, v29, OS_LOG_TYPE_FAULT, "Unexpected transition context. Annotation data set for both annotation keys", v32, 2u);
      }

    }
    else
    {
      v27 = _optionsFromPayload_sourceProcessHandle____s_category;
      if (!_optionsFromPayload_sourceProcessHandle____s_category)
      {
        v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v27, (unint64_t *)&_optionsFromPayload_sourceProcessHandle____s_category);
      }
      v28 = *(NSObject **)(v27 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Unexpected transition context. Annotation data set for both annotation keys", buf, 2u);
      }
    }
  }
  v30 = (void *)v8;
  if (v10)
    v12 = v10;
  else
    v12 = (void *)v8;
  v13 = *MEMORY[0x1E0CA5818];
  v14 = v12;
  objc_msgSend(v5, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("_UISceneConnectionOptionsOpenAsDownload"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("_UIApplicationOpenURLOptionsManagedContentKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "integerValue");

  v21 = [UIEventAttribution alloc];
  objc_msgSend(v5, "objectForKey:", CFSTR("UIApplicationLaunchOptionsEventAttributionKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[UIEventAttribution initWithUISClickAttribution:](v21, "initWithUISClickAttribution:", v22);

  v24 = -[UISceneOpenURLOptions _initWithSourceApplication:processHandle:annotation:openInPlace:eventAttribution:openAsDownload:contentOwner:]([UISceneOpenURLOptions alloc], "_initWithSourceApplication:processHandle:annotation:openInPlace:eventAttribution:openAsDownload:contentOwner:", v7, v6, v14, v16, v23, v18, v20);
  return v24;
}

+ (id)_optionsFromDictionary:(id)a3
{
  return +[UISceneOpenURLOptions _optionsFromPayload:sourceProcessHandle:](UISceneOpenURLOptions, "_optionsFromPayload:sourceProcessHandle:", a3, 0);
}

- (id)_initWithSourceApplication:(id)a3 processHandle:(id)a4 annotation:(id)a5 openInPlace:(BOOL)a6
{
  return -[UISceneOpenURLOptions _initWithSourceApplication:processHandle:annotation:openInPlace:eventAttribution:openAsDownload:contentOwner:](self, "_initWithSourceApplication:processHandle:annotation:openInPlace:eventAttribution:openAsDownload:contentOwner:", a3, a4, a5, a6, 0, 0, 0);
}

- (id)_initWithSourceApplication:(id)a3 processHandle:(id)a4 annotation:(id)a5 openInPlace:(BOOL)a6 eventAttribution:(id)a7 openAsDownload:(BOOL)a8 contentOwner:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  UISceneOpenURLOptions *v19;
  UISceneOpenURLOptions *v20;
  id v22;
  objc_super v23;

  v16 = a3;
  v17 = a4;
  v22 = a5;
  v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)UISceneOpenURLOptions;
  v19 = -[UISceneOpenURLOptions init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sourceApp, a3);
    objc_storeStrong((id *)&v20->_sourceProcessHandle, a4);
    objc_storeStrong((id *)&v20->_annotation, a5);
    v20->_openInPlace = a6;
    objc_storeStrong((id *)&v20->_eventAttribution, a7);
    v20->_openAsDownload = a8;
    v20->_contentOwner = a9;
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  UISceneOpenURLOptions *v4;
  UISceneOpenURLOptions *v5;
  UISceneOpenURLOptions *v6;
  void *v7;
  unint64_t v8;
  NSString *sourceApp;
  BSProcessHandle *sourceProcessHandle;
  _BOOL4 openInPlace;
  UIEventAttribution *eventAttribution;
  UIEventAttribution *v13;
  _BOOL4 openAsDownload;
  int64_t contentOwner;
  BOOL v16;

  v4 = (UISceneOpenURLOptions *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
  }
  else
  {
    v6 = v4;
    v7 = (void *)objc_opt_class();
    if (objc_msgSend(v7, "isEqual:", objc_opt_class())
      && (v8 = -[UISceneOpenURLOptions hash](self, "hash"), v8 == -[UISceneOpenURLOptions hash](v6, "hash"))
      && ((sourceApp = self->_sourceApp, sourceApp == v6->_sourceApp)
       || sourceApp && -[NSString isEqual:](sourceApp, "isEqual:"))
      && ((sourceProcessHandle = self->_sourceProcessHandle, sourceProcessHandle == v6->_sourceProcessHandle)
       || sourceProcessHandle && -[BSProcessHandle isEqual:](sourceProcessHandle, "isEqual:"))
      && self->_annotation == v6->_annotation
      && (openInPlace = self->_openInPlace, openInPlace == -[UISceneOpenURLOptions openInPlace](v6, "openInPlace")))
    {
      eventAttribution = self->_eventAttribution;
      -[UISceneOpenURLOptions eventAttribution](v6, "eventAttribution");
      v13 = (UIEventAttribution *)objc_claimAutoreleasedReturnValue();
      if (eventAttribution == v13
        && (openAsDownload = self->_openAsDownload,
            openAsDownload == -[UISceneOpenURLOptions _openAsDownload](v6, "_openAsDownload")))
      {
        contentOwner = self->_contentOwner;
        v16 = contentOwner == -[UISceneOpenURLOptions _contentOwner](v6, "_contentOwner");
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  BSProcessHandle *sourceProcessHandle;

  v3 = -[NSString hash](self->_sourceApp, "hash");
  v4 = -[NSObject hash](self->_annotation, "hash") ^ v3;
  sourceProcessHandle = self->_sourceProcessHandle;
  if (sourceProcessHandle)
    v4 ^= -[BSProcessHandle hash](sourceProcessHandle, "hash");
  return -[UIEventAttribution hash](self->_eventAttribution, "hash") ^ v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  if (self->_openInPlace)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; sourceApp: %@; annotation: %@; openInPlace: %@"),
    v4,
    self,
    self->_sourceApp,
    self->_annotation,
    v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; _eventAttribution: %@"), self->_eventAttribution);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR(">"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)sourceApplication
{
  return self->_sourceApp;
}

- (BSProcessHandle)_sourceProcessHandle
{
  return self->_sourceProcessHandle;
}

- (id)annotation
{
  return self->_annotation;
}

- (BOOL)openInPlace
{
  return self->_openInPlace;
}

- (BOOL)_openAsDownload
{
  return self->_openAsDownload;
}

- (int64_t)_contentOwner
{
  return self->_contentOwner;
}

- (UIEventAttribution)eventAttribution
{
  return self->_eventAttribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAttribution, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_sourceProcessHandle, 0);
  objc_storeStrong((id *)&self->_sourceApp, 0);
}

@end
