@implementation WBSWebExtensionCommandShortcutConflict

- (WBSWebExtensionCommandShortcutConflict)initWithShortcut:(id)a3 extensionDisplayName:(id)a4 extensionDisplayShortName:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSWebExtensionCommandShortcutConflict *v11;
  uint64_t v12;
  NSString *shortcut;
  uint64_t v14;
  NSString *extensionDisplayName;
  uint64_t v16;
  NSString *extensionDisplayShortName;
  WBSWebExtensionCommandShortcutConflict *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSWebExtensionCommandShortcutConflict;
  v11 = -[WBSWebExtensionCommandShortcutConflict init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    shortcut = v11->_shortcut;
    v11->_shortcut = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    extensionDisplayName = v11->_extensionDisplayName;
    v11->_extensionDisplayName = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    extensionDisplayShortName = v11->_extensionDisplayShortName;
    v11->_extensionDisplayShortName = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; shortcut = %@; extensionDisplayName = %@ extensionDisplayShortName = %@>"),
               objc_opt_class(),
               self,
               self->_shortcut,
               self->_extensionDisplayName,
               self->_extensionDisplayShortName);
}

- (NSString)shortcut
{
  return self->_shortcut;
}

- (NSString)extensionDisplayName
{
  return self->_extensionDisplayName;
}

- (NSString)extensionDisplayShortName
{
  return self->_extensionDisplayShortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionDisplayShortName, 0);
  objc_storeStrong((id *)&self->_extensionDisplayName, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
}

@end
