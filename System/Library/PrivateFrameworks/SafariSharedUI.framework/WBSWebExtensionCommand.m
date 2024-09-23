@implementation WBSWebExtensionCommand

- (WBSWebExtensionCommand)initWithProperties:(id)a3 extensionComposedIdentifier:(id)a4 outErrorMessage:(id *)a5
{
  id v6;
  id v7;
  WBSWebExtensionCommand *result;

  v6 = a3;
  v7 = a4;
  result = (WBSWebExtensionCommand *)36;
  __break(0xC471u);
  return result;
}

- (WBSWebExtensionCommand)initWithWebKitCommand:(id)a3
{
  id v5;
  WBSWebExtensionCommand *v6;
  WBSWebExtensionCommand *v7;
  uint64_t v8;
  NSString *commandName;
  uint64_t v10;
  NSString *commandDescription;
  uint64_t v12;
  NSString *shortcut;
  WBSWebExtensionCommand *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSWebExtensionCommand;
  v6 = -[WBSWebExtensionCommand init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webKitCommand, a3);
    objc_msgSend(v5, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    commandName = v7->_commandName;
    v7->_commandName = (NSString *)v8;

    objc_msgSend(v5, "discoverabilityTitle");
    v10 = objc_claimAutoreleasedReturnValue();
    commandDescription = v7->_commandDescription;
    v7->_commandDescription = (NSString *)v10;

    objc_msgSend(v5, "_shortcut");
    v12 = objc_claimAutoreleasedReturnValue();
    shortcut = v7->_shortcut;
    v7->_shortcut = (NSString *)v12;

    v14 = v7;
  }

  return v7;
}

- (void)_parseShortcut:(id)a3
{
  id v3;

  v3 = a3;
  __break(0xC471u);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_WKWebExtensionCommand debugDescription](self->_webKitCommand, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; webKitCommand = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIKeyCommand)keyCommand
{
  return (UIKeyCommand *)-[_WKWebExtensionCommand keyCommand](self->_webKitCommand, "keyCommand");
}

- (_WKWebExtensionCommand)webKitCommand
{
  return self->_webKitCommand;
}

- (NSString)commandName
{
  return self->_commandName;
}

- (NSString)commandDescription
{
  return self->_commandDescription;
}

- (NSString)shortcut
{
  return self->_shortcut;
}

- (NSString)extensionComposedIdentifier
{
  return self->_extensionComposedIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionComposedIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_commandDescription, 0);
  objc_storeStrong((id *)&self->_commandName, 0);
  objc_storeStrong((id *)&self->_webKitCommand, 0);
  objc_storeStrong((id *)&self->_keyCommand, 0);
  objc_storeStrong((id *)&self->_modifiers, 0);
  objc_storeStrong((id *)&self->_shortcutKey, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
