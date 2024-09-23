@implementation CACCustomCommandEditorPresentationManager

- (BOOL)showCustomCommandEditorWithGesture:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    -[CACCustomCommandEditorPresentationManager _showCustomCommandEditorWithContextKey:contextValue:](self, "_showCustomCommandEditorWithContextKey:contextValue:", *MEMORY[0x24BDFFE80], v4);
  }
  else
  {
    CACLogPreferences();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CACCustomCommandEditorPresentationManager showCustomCommandEditorWithGesture:].cold.1();

  }
  return v4 != 0;
}

- (BOOL)showCustomCommandEditorWithTextToInsert:(id)a3
{
  -[CACCustomCommandEditorPresentationManager _showCustomCommandEditorWithContextKey:contextValue:](self, "_showCustomCommandEditorWithContextKey:contextValue:", *MEMORY[0x24BDFFE88], a3);
  return 1;
}

- (BOOL)showCustomCommandEditorWithRecordedUserActionFlow:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    -[CACCustomCommandEditorPresentationManager _showCustomCommandEditorWithContextKey:contextValue:](self, "_showCustomCommandEditorWithContextKey:contextValue:", *MEMORY[0x24BDFFE90], v4);
  }
  else
  {
    CACLogPreferences();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CACCustomCommandEditorPresentationManager showCustomCommandEditorWithGesture:].cold.1();

  }
  return v4 != 0;
}

- (BOOL)showCustomCommandEditorWithShortcutsWorkflow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortcutForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CACCustomCommandEditorPresentationManager _showCustomCommandEditorWithContextKey:contextValue:](self, "_showCustomCommandEditorWithContextKey:contextValue:", CFSTR("ShortcutWorkflow"), v4);
  }
  else
  {
    CACLogShortcuts();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CACCustomCommandEditorPresentationManager showCustomCommandEditorWithShortcutsWorkflow:].cold.1(v7);

  }
  return v6 != 0;
}

- (void)_showCustomCommandEditorWithContextKey:(id)a3 contextValue:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x24BDBCED8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v7);

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "installedApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDFFE78]);

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "showRemoteView:withData:", 3, v11);

}

+ (int64_t)remoteViewType
{
  return 3;
}

+ (int)axNotification
{
  return 2028;
}

- (void)handleAXNotificationData:(void *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  NSObject *v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFEE70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFEE68]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setProperties:forCommandIdentifier:](v8, "setProperties:forCommandIdentifier:", v6, v4);
  }
  else
  {
    CACLogPreferences();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CACCustomCommandEditorPresentationManager handleAXNotificationData:].cold.1((uint64_t)v3, v8);
  }

}

- (void)showCustomCommandEditorWithGesture:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_229A40000, v0, v1, "Unable to serialize %@: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)showCustomCommandEditorWithShortcutsWorkflow:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229A40000, log, OS_LOG_TYPE_ERROR, "Unable to find shortcut with identifier", v1, 2u);
}

- (void)handleAXNotificationData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_229A40000, a2, OS_LOG_TYPE_ERROR, "Unexpected data from command editor: %{private}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
