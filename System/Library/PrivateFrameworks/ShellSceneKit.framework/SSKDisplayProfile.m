@implementation SSKDisplayProfile

- (SSKDisplayProfile)initWithPriority:(unint64_t)a3 displayTransformer:(id)a4 provider:(id)a5 delegate:(id)a6
{
  id v12;
  id v13;
  id v14;
  SSKDisplayProfile *v15;
  SSKDisplayProfile *v16;
  void *v18;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfile.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayTransformer"));

  }
  v19.receiver = self;
  v19.super_class = (Class)SSKDisplayProfile;
  v15 = -[SSKDisplayProfile init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_priorityLevel = a3;
    objc_storeStrong((id *)&v15->_displayTransformer, a4);
    objc_storeStrong((id *)&v16->_provider, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
  }

  return v16;
}

- (SSKDisplayProfile)initWithSwiftConfiguration:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SSKSceneHostingDisplayControllerProvider *v9;
  SSKDisplayProfile *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfile.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[swiftProfileConfiguration isKindOfClass:[SSKDisplayProfileConfiguration class]]"));

  }
  v9 = -[SSKSceneHostingDisplayControllerProvider initWithProfileConfiguration:]([SSKSceneHostingDisplayControllerProvider alloc], "initWithProfileConfiguration:", v7);
  v10 = -[SSKDisplayProfile initWithPriority:displayTransformer:provider:delegate:](self, "initWithPriority:displayTransformer:provider:delegate:", objc_msgSend(v7, "priority"), v7, v9, v8);

  if (v10)
    -[SSKSceneHostingDisplayControllerProvider setDelegate:](v9, "setDelegate:", v10);

  return v10;
}

+ (id)sceneHostingProfileWithDelegate:(id)a3 builder:(id)a4
{
  void (**v6)(id, SSKLegacyDisplayProfileBuilder *);
  id v7;
  SSKLegacyDisplayProfileBuilder *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = (void (**)(id, SSKLegacyDisplayProfileBuilder *))a4;
  v7 = a3;
  v8 = objc_alloc_init(SSKLegacyDisplayProfileBuilder);
  v6[2](v6, v8);

  v9 = objc_alloc((Class)a1);
  -[SSKLegacyDisplayProfileBuilder createDisplayProfileConfiguration](v8, "createDisplayProfileConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithSwiftConfiguration:delegate:", v10, v7);

  return v11;
}

+ (id)mirroringMainDisplayProfileWithDelegate:(id)a3
{
  id v4;
  SSKMirroredDisplayControllerProvider *v5;
  SSKMirroredDisplayTransformer *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(SSKMirroredDisplayControllerProvider);
  v6 = objc_alloc_init(SSKMirroredDisplayTransformer);
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPriority:displayTransformer:provider:delegate:", 1, v6, v5, v4);

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE0BE10], "descriptionForRootObject:", self);
}

- (unint64_t)priorityLevel
{
  return self->_priorityLevel;
}

- (unint64_t)deactivationReasonsWhenActive
{
  return 0;
}

- (id)displayControllerForDisplay:(id)a3 configuration:(id)a4
{
  return (id)-[SSKDisplayControllerProviding displayControllerForDisplay:configuration:](self->_provider, "displayControllerForDisplay:configuration:", a3, a4);
}

- (id)provider:(id)a3 rootSceneWindowForDisplayConfiguration:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "displayProfile:rootSceneWindowForDisplayConfiguration:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)provider:(id)a3 modifyInitialSceneParameters:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "displayProfile:modifyInitialSceneParameters:", self, v6);

}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SSKDisplayProfile *v14;
  _QWORD v15[4];
  id v16;
  SSKDisplayProfile *v17;

  v4 = a3;
  v5 = objc_opt_class();
  v11 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v11;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "appendProem:block:", self, &__block_literal_global_2);
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __50__SSKDisplayProfile_appendDescriptionToFormatter___block_invoke_2;
  v15[3] = &unk_25171C128;
  v9 = v7;
  v16 = v9;
  v17 = self;
  objc_msgSend(v9, "appendBodySectionWithName:block:", CFSTR("transformer"), v15);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __50__SSKDisplayProfile_appendDescriptionToFormatter___block_invoke_3;
  v12[3] = &unk_25171C128;
  v13 = v9;
  v14 = self;
  v10 = v9;
  objc_msgSend(v10, "appendBodySectionWithName:block:", CFSTR("provider"), v12);

}

id __50__SSKDisplayProfile_appendDescriptionToFormatter___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 0);
}

id __50__SSKDisplayProfile_appendDescriptionToFormatter___block_invoke_3(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), 0);
}

- (void)transformPhysicalDisplayWithBuilder:(id)a3
{
  -[SSKDisplayControllerTransforming transformPhysicalDisplayWith:](self->_displayTransformer, "transformPhysicalDisplayWith:", a3);
}

- (BOOL)evaluatePhysicalDisplay:(id)a3
{
  id v5;
  void *v6;
  char v7;
  id WeakRetained;
  char v9;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isRootIdentity");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfile.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[rootDisplayConfiguration identity] isRootIdentity]"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(WeakRetained, "displayProfile:shouldConnectToDisplay:", self, v5);

  return v9;
}

- (BOOL)usesRootDisplay
{
  return -[SSKDisplayControllerTransforming derivesDisplays](self->_displayTransformer, "derivesDisplays") ^ 1;
}

- (BOOL)shouldTransformConnectingDisplays
{
  return -[SSKDisplayControllerTransforming shouldTransformConnectingDisplays](self->_displayTransformer, "shouldTransformConnectingDisplays");
}

- (SSKDisplayProfileDelegate)delegate
{
  return (SSKDisplayProfileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_displayTransformer, 0);
}

@end
