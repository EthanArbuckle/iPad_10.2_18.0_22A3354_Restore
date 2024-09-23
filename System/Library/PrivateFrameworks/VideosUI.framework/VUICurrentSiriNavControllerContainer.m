@implementation VUICurrentSiriNavControllerContainer

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_1 != -1)
    dispatch_once(&sharedInstance___onceToken_1, &__block_literal_global_14);
  return (id)sharedInstance___sharedInstance_0;
}

void __54__VUICurrentSiriNavControllerContainer_sharedInstance__block_invoke()
{
  VUICurrentSiriNavControllerContainer *v0;
  void *v1;

  v0 = objc_alloc_init(VUICurrentSiriNavControllerContainer);
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;

}

- (VUICurrentSiriNavControllerContainer)init
{
  VUICurrentSiriNavControllerContainer *v2;
  uint64_t v3;
  NSPointerArray *activeNavigationControllers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUICurrentSiriNavControllerContainer;
  v2 = -[VUICurrentSiriNavControllerContainer init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    activeNavigationControllers = v2->_activeNavigationControllers;
    v2->_activeNavigationControllers = (NSPointerArray *)v3;

  }
  return v2;
}

+ (BOOL)isRunningInSiriPluggin
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri"));
  return (char)v2;
}

- (void)setCurrentSiriNavController:(id)a3
{
  NSPointerArray *activeNavigationControllers;
  id v5;

  activeNavigationControllers = self->_activeNavigationControllers;
  v5 = a3;
  -[NSPointerArray compact](activeNavigationControllers, "compact");
  -[NSPointerArray addPointer:](self->_activeNavigationControllers, "addPointer:", v5);

}

- (id)currentSiriNavController
{
  void *v3;
  void *v4;

  -[NSPointerArray compact](self->_activeNavigationControllers, "compact");
  -[NSPointerArray allObjects](self->_activeNavigationControllers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSPointerArray)activeNavigationControllers
{
  return self->_activeNavigationControllers;
}

- (void)setActiveNavigationControllers:(id)a3
{
  objc_storeStrong((id *)&self->_activeNavigationControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeNavigationControllers, 0);
}

@end
