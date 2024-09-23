@implementation SBSApplicationShortcutIcon

- (id)_initForSubclass
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSApplicationShortcutIcon;
  return -[SBSApplicationShortcutIcon init](&v3, sel_init);
}

- (SBSApplicationShortcutIcon)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ does not support initialization."), v6);

  return (SBSApplicationShortcutIcon *)-[SBSApplicationShortcutIcon _initForSubclass](self, "_initForSubclass");
}

- (SBSApplicationShortcutIcon)initWithXPCDictionary:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (SBSApplicationShortcutIcon *)-[SBSApplicationShortcutIcon _initForSubclass](self, "_initForSubclass");
}

- (void)encodeWithXPCDictionary:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end
