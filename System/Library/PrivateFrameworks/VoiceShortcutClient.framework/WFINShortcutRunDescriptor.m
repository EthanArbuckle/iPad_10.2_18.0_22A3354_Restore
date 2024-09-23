@implementation WFINShortcutRunDescriptor

- (WFINShortcutRunDescriptor)initWithShortcut:(id)a3
{
  id v6;
  WFINShortcutRunDescriptor *v7;
  WFINShortcutRunDescriptor *v8;
  WFINShortcutRunDescriptor *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowRunDescriptors.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcut"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFINShortcutRunDescriptor;
  v7 = -[WFINShortcutRunDescriptor init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_shortcut, a3);
    v9 = v8;
  }

  return v8;
}

- (WFINShortcutRunDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFINShortcutRunDescriptor *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcut"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFINShortcutRunDescriptor initWithShortcut:](self, "initWithShortcut:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFINShortcutRunDescriptor shortcut](self, "shortcut");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("shortcut"));

}

- (id)kind
{
  return CFSTR("INShortcut");
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
