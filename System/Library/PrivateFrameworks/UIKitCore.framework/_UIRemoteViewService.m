@implementation _UIRemoteViewService

+ (_UIRemoteViewService)allocWithZone:(_NSZone *)a3
{
  objc_super v6;
  _QWORD block[6];

  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38___UIRemoteViewService_allocWithZone___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a3;
    block[5] = a1;
    if (qword_1ECD79F68 != -1)
      dispatch_once(&qword_1ECD79F68, block);
    return (_UIRemoteViewService *)(id)_MergedGlobals_1_24;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS____UIRemoteViewService;
    return (_UIRemoteViewService *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIRemoteViewService;
  return -[_UIRemoteViewService init](&v3, sel_init);
}

- (_UIRemoteViewService)initWithPlugIn:(id)a3 andContextToken:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _UIRemoteViewService *v12;
  void *v14;
  void *v15;
  id v16;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB35D8];
  objc_msgSend(a3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v8, "extensionWithIdentifier:error:", v9, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIRemoteViewService.m"), 48, CFSTR("extension was nil - error %@"), v15);

  }
  v12 = -[_UIRemoteViewService initWithExtension:andContextToken:](self, "initWithExtension:andContextToken:", v10, v7);

  return v12;
}

- (_UIRemoteViewService)initWithExtension:(id)a3 andContextToken:(id)a4
{
  id v6;
  id v7;
  _UIConcreteRemoteViewService *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_UIConcreteRemoteViewService initWithExtension:andContextToken:]([_UIConcreteRemoteViewService alloc], "initWithExtension:andContextToken:", v7, v6);

  return &v8->super;
}

- (_UIRemoteViewService)init
{
  _UIConcreteRemoteViewService *v3;

  v3 = objc_alloc_init(_UIConcreteRemoteViewService);

  return &v3->super;
}

- (PKPlugIn)plugin
{
  return 0;
}

- (void)beginUsing:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIRemoteViewService.m"), 79, CFSTR("Abstract method called %s"), "-[_UIRemoteViewService beginUsing:]");

}

- (void)endUsing:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIRemoteViewService.m"), 83, CFSTR("Abstract method called %s"), "-[_UIRemoteViewService endUsing:]");

}

@end
