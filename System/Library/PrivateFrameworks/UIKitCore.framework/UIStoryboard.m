@implementation UIStoryboard

- (BOOL)containsNibNamed:(id)a3
{
  return -[NSBundle pathForResource:ofType:inDirectory:](-[UIStoryboard bundle](self, "bundle"), "pathForResource:ofType:inDirectory:", a3, CFSTR("nib"), -[UIStoryboard storyboardFileName](self, "storyboardFileName")) != 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStoryboard;
  -[UIStoryboard dealloc](&v3, sel_dealloc);
}

- (id)nibForStoryboardNibNamed:(id)a3
{
  UINib *v6;

  if (!objc_msgSend(a3, "length"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboard.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[nibName length] > 0"));
  v6 = -[UINib initWithNibName:directory:bundle:]([UINib alloc], "initWithNibName:directory:bundle:", a3, -[UIStoryboard storyboardFileName](self, "storyboardFileName"), -[UIStoryboard bundle](self, "bundle"));
  -[UINib setIdentifierForStringsFile:](v6, "setIdentifierForStringsFile:", -[UIStoryboard identifierForStringsFile](self, "identifierForStringsFile"));
  return v6;
}

- (NSString)name
{
  return -[NSString stringByDeletingPathExtension](-[UIStoryboard storyboardFileName](self, "storyboardFileName"), "stringByDeletingPathExtension");
}

- (NSString)storyboardFileName
{
  return self->storyboardFileName;
}

- (id)identifierForStringsFile
{
  return -[NSBundle pathForResource:ofType:](-[UIStoryboard bundle](self, "bundle"), "pathForResource:ofType:", -[UIStoryboard name](self, "name"), CFSTR("storyboardc"));
}

- (NSBundle)bundle
{
  return self->bundle;
}

+ (UIStoryboard)storyboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil
{
  NSString *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  UIStoryboard *v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  if (-[NSString length](name, "length"))
  {
    if (storyboardBundleOrNil)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIStoryboard.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[name length] > 0"));
  if (!storyboardBundleOrNil)
LABEL_3:
    storyboardBundleOrNil = (NSBundle *)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
LABEL_4:
  v8 = -[NSBundle pathForResource:ofType:](storyboardBundleOrNil, "pathForResource:ofType:", name, CFSTR("storyboardc"));
  if (!v8)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not find a storyboard named '%@' in bundle %@"), name, storyboardBundleOrNil);
    v17 = v14;
    v18 = v15;
    goto LABEL_12;
  }
  v9 = v8;
  v10 = -[NSString stringByAppendingPathExtension:](name, "stringByAppendingPathExtension:", CFSTR("storyboardc"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", -[NSString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", CFSTR("Info-8.0+.plist")));
  if (!v11)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", -[NSString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", CFSTR("Info.plist")));
    if (!v11)
    {
      v19 = (void *)MEMORY[0x1E0C99DA0];
      v20 = *MEMORY[0x1E0C99778];
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("There doesn't seem to be a valid compiled storyboard at path '%@'"), v9);
      v17 = v19;
      v18 = v20;
LABEL_12:
      objc_exception_throw((id)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v16, 0));
    }
  }
  v12 = (UIStoryboard *)objc_autorelease((id)objc_msgSend(objc_alloc((Class)a1), "initWithBundle:storyboardFileName:identifierToNibNameMap:identifierToExternalStoryboardReferenceMap:designatedEntryPointIdentifier:designatedMenuIdentifier:", storyboardBundleOrNil, v10, objc_msgSend(v11, "objectForKey:", CFSTR("UIViewControllerIdentifiersToNibNames")), objc_msgSend(v11, "objectForKey:", CFSTR("UIViewControllerIdentifiersToExternalStoryboardReferences")), objc_msgSend(v11, "objectForKey:", CFSTR("UIStoryboardDesignatedEntryPointIdentifier")), objc_msgSend(v11,
                                                 "objectForKey:",
                                                 CFSTR("UIStoryboardDesignatedMenuIdentifier"))));

  return v12;
}

- (UIStoryboard)initWithBundle:(id)a3 storyboardFileName:(id)a4 identifierToNibNameMap:(id)a5 identifierToExternalStoryboardReferenceMap:(id)a6 designatedEntryPointIdentifier:(id)a7 designatedMenuIdentifier:(id)a8
{
  UIStoryboard *v16;
  objc_super v18;

  if (a3)
  {
    if (a5)
      goto LABEL_3;
LABEL_8:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboard.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nibNameMap != nil"));
    if (a4)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboard.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aBundle != nil"));
  if (!a5)
    goto LABEL_8;
LABEL_3:
  if (a4)
    goto LABEL_4;
LABEL_9:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboard.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialStoryboardFileName != nil"));
LABEL_4:
  v18.receiver = self;
  v18.super_class = (Class)UIStoryboard;
  v16 = -[UIStoryboard init](&v18, sel_init);
  if (v16)
  {
    v16->bundle = (NSBundle *)a3;
    v16->storyboardFileName = (NSString *)objc_msgSend(a4, "copy");
    v16->identifierToNibNameMap = (NSDictionary *)objc_msgSend(a5, "copy");
    v16->identifierToExternalStoryboardReferenceMap = (NSDictionary *)objc_msgSend(a6, "copy");
    v16->designatedEntryPointIdentifier = (NSString *)objc_msgSend(a7, "copy");
    v16->designatedMenuIdentifier = (NSString *)objc_msgSend(a8, "copy");
  }
  return v16;
}

- (UIViewController)instantiateInitialViewController
{
  return -[UIStoryboard instantiateInitialViewControllerWithCreator:](self, "instantiateInitialViewControllerWithCreator:", 0);
}

- (UIViewController)instantiateInitialViewControllerWithCreator:(UIStoryboardViewControllerCreator)block
{
  return (UIViewController *)-[UIStoryboard _instantiateInitialViewControllerWithCreator:storyboardSegueTemplate:sender:](self, "_instantiateInitialViewControllerWithCreator:storyboardSegueTemplate:sender:", block, 0, 0);
}

- (id)_instantiateViewControllerWithIdentifier:(id)a3 creator:(id)a4 storyboardSegueTemplate:(id)a5 sender:(id)a6
{
  UIViewController *v10;

  -[UIStoryboard set__currentStoryboardSegueTemplate:](self, "set__currentStoryboardSegueTemplate:", a5);
  -[UIStoryboard set__currentSender:](self, "set__currentSender:", a6);
  -[UIStoryboard set__currentStoryboardSegueCreator:](self, "set__currentStoryboardSegueCreator:", a4);
  v10 = -[UIStoryboard instantiateViewControllerWithIdentifier:](self, "instantiateViewControllerWithIdentifier:", a3);
  -[UIStoryboard set__currentStoryboardSegueCreator:](self, "set__currentStoryboardSegueCreator:", 0);
  -[UIStoryboard set__currentStoryboardSegueTemplate:](self, "set__currentStoryboardSegueTemplate:", 0);
  -[UIStoryboard set__currentSender:](self, "set__currentSender:", 0);
  return v10;
}

- (void)set__currentStoryboardSegueTemplate:(id)a3
{
  self->___currentStoryboardSegueTemplate = (UIStoryboardSegueTemplate *)a3;
}

- (void)set__currentStoryboardSegueCreator:(id)a3
{
  self->___currentStoryboardSegueCreator = a3;
}

- (void)set__currentSender:(id)a3
{
  self->___currentSender = a3;
}

- (UIViewController)instantiateViewControllerWithIdentifier:(NSString *)identifier
{
  UIStoryboardSegueTemplate *v5;
  id v6;
  id v7;

  v5 = -[UIStoryboard __currentStoryboardSegueTemplate](self, "__currentStoryboardSegueTemplate");
  v6 = -[UIStoryboard __currentSender](self, "__currentSender");
  v7 = -[UIStoryboard __currentStoryboardSegueCreator](self, "__currentStoryboardSegueCreator");
  -[UIStoryboard set__currentStoryboardSegueCreator:](self, "set__currentStoryboardSegueCreator:", 0);
  -[UIStoryboard set__currentStoryboardSegueTemplate:](self, "set__currentStoryboardSegueTemplate:", 0);
  -[UIStoryboard set__currentSender:](self, "set__currentSender:", 0);
  return (UIViewController *)-[UIStoryboard __reallyInstantiateViewControllerWithIdentifier:creator:storyboardSegueTemplate:sender:](self, "__reallyInstantiateViewControllerWithIdentifier:creator:storyboardSegueTemplate:sender:", identifier, v7, v5, v6);
}

- (id)__reallyInstantiateViewControllerWithIdentifier:(id)a3 creator:(id)a4 storyboardSegueTemplate:(id)a5 sender:(id)a6
{
  id v12;
  void *v13;
  UIStoryboardScene *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v12 = -[UIStoryboard nibForViewControllerWithIdentifier:](self, "nibForViewControllerWithIdentifier:");
  if (!v12)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Storyboard (%@) doesn't contain a view controller with identifier '%@'"), self, a3), 0));
  v13 = v12;
  v14 = objc_alloc_init(UIStoryboardScene);
  v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", self, CFSTR("UIStoryboardPlaceholder"));
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v15, CFSTR("UINibExternalObjects"));
  v17 = v16;
  if (a5)
    objc_msgSend(v16, "setObject:forKey:", a5, CFSTR("UINibSourceSegueTemplate"));
  if (a6)
    objc_msgSend(v17, "setObject:forKey:", a6, CFSTR("UINibPerformSegueSender"));
  if (a4)
    objc_msgSend(v17, "setObject:forKey:", a4, CFSTR("UINibPerformSegueCreator"));
  objc_msgSend(v13, "instantiateWithOwner:options:", v14, v17);
  objc_msgSend(v17, "removeAllObjects");
  v18 = -[UIStoryboardScene sceneViewController](v14, "sceneViewController");
  if (!v18)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboard.m"), 238, CFSTR("Could not load the scene view controller for identifier '%@'"), a3);
  if (!objc_msgSend(v18, "storyboardIdentifier"))
    objc_msgSend(v18, "setStoryboardIdentifier:", a3);
  return v18;
}

- (id)nibForViewControllerWithIdentifier:(id)a3
{
  id v6;
  id v7;
  NSMutableDictionary *identifierToUINibMap;

  if (!objc_msgSend(a3, "length"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboard.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[identifier length] > 0"));
  v6 = (id)-[NSMutableDictionary objectForKey:](self->identifierToUINibMap, "objectForKey:", a3);
  if (!v6)
  {
    v7 = -[NSDictionary objectForKey:](-[UIStoryboard identifierToNibNameMap](self, "identifierToNibNameMap"), "objectForKey:", a3);
    if (v7)
    {
      v6 = -[UIStoryboard nibForStoryboardNibNamed:](self, "nibForStoryboardNibNamed:", v7);
      identifierToUINibMap = self->identifierToUINibMap;
      if (!identifierToUINibMap)
      {
        identifierToUINibMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        self->identifierToUINibMap = identifierToUINibMap;
      }
      -[NSMutableDictionary setObject:forKey:](identifierToUINibMap, "setObject:forKey:", v6, a3);

    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (NSDictionary)identifierToNibNameMap
{
  return self->identifierToNibNameMap;
}

- (UIStoryboardSegueTemplate)__currentStoryboardSegueTemplate
{
  return self->___currentStoryboardSegueTemplate;
}

- (id)__currentStoryboardSegueCreator
{
  return self->___currentStoryboardSegueCreator;
}

- (id)__currentSender
{
  return self->___currentSender;
}

- (id)_instantiateInitialViewControllerWithCreator:(id)a3 storyboardSegueTemplate:(id)a4 sender:(id)a5
{
  id result;

  result = -[UIStoryboard designatedEntryPointIdentifier](self, "designatedEntryPointIdentifier");
  if (result)
    return -[UIStoryboard _instantiateViewControllerWithIdentifier:creator:storyboardSegueTemplate:sender:](self, "_instantiateViewControllerWithIdentifier:creator:storyboardSegueTemplate:sender:", -[UIStoryboard designatedEntryPointIdentifier](self, "designatedEntryPointIdentifier"), a3, a4, a5);
  return result;
}

- (NSString)designatedEntryPointIdentifier
{
  return self->designatedEntryPointIdentifier;
}

- (id)_instantiateInitialMenu
{
  id result;
  id v5;
  id v6;
  UIStoryboardScene *v7;

  result = -[UIStoryboard designatedMenuIdentifier](self, "designatedMenuIdentifier");
  if (result)
  {
    v5 = result;
    result = -[UIStoryboard nibForViewControllerWithIdentifier:](self, "nibForViewControllerWithIdentifier:", result);
    if (result)
    {
      v6 = result;
      v7 = objc_alloc_init(UIStoryboardScene);
      objc_msgSend(v6, "instantiateWithOwner:options:", v7, 0);
      result = -[UIStoryboardScene sceneViewController](v7, "sceneViewController");
      if (!result)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboard.m"), 186, CFSTR("Could not load the scene command menu for identifier '%@'"), v5);
        return 0;
      }
    }
  }
  return result;
}

- (NSString)designatedMenuIdentifier
{
  return self->designatedMenuIdentifier;
}

- (id)referencedStoryboardForExternalReferenceInfo:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSBundle *v8;

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("UIReferencedStoryboardName"));
  if (!v5)
    return self;
  v6 = v5;
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("UIReferencedBundleIdentifier"));
  if (v7)
    v8 = (NSBundle *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v7);
  else
    v8 = -[UIStoryboard bundle](self, "bundle");
  return +[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", v6, v8);
}

- (id)_instantiateViewControllerReferencedByPlaceholderWithIdentifier:(id)a3 storyboardSegueTemplate:(id)a4 sender:(id)a5
{
  id v10;
  id v11;
  uint64_t v12;

  v10 = -[NSDictionary objectForKey:](-[UIStoryboard identifierToExternalStoryboardReferenceMap](self, "identifierToExternalStoryboardReferenceMap"), "objectForKey:", a3);
  if (!v10)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboard.m"), 169, CFSTR("Could not find reference info for placeholder with identifier '%@'"), a3);
  v11 = -[UIStoryboard referencedStoryboardForExternalReferenceInfo:](self, "referencedStoryboardForExternalReferenceInfo:", v10);
  v12 = objc_msgSend(v10, "objectForKey:", CFSTR("UIReferencedControllerIdentifier"));
  if (v12)
    return (id)objc_msgSend(v11, "_instantiateViewControllerWithIdentifier:creator:storyboardSegueTemplate:sender:", v12, 0, a4, a5);
  else
    return (id)objc_msgSend(v11, "_instantiateInitialViewControllerWithCreator:storyboardSegueTemplate:sender:", 0, a4, a5);
}

- (UIViewController)instantiateViewControllerWithIdentifier:(NSString *)identifier creator:(UIStoryboardViewControllerCreator)block
{
  return (UIViewController *)-[UIStoryboard _instantiateViewControllerWithIdentifier:creator:storyboardSegueTemplate:sender:](self, "_instantiateViewControllerWithIdentifier:creator:storyboardSegueTemplate:sender:", identifier, block, 0, 0);
}

- (NSDictionary)identifierToExternalStoryboardReferenceMap
{
  return self->identifierToExternalStoryboardReferenceMap;
}

- (NSMutableDictionary)identifierToUINibMap
{
  return self->identifierToUINibMap;
}

@end
