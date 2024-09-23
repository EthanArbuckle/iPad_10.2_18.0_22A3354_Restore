@implementation UISApplicationInitializationContextParameters

- (UISApplicationInitializationContextParameters)init
{
  UISApplicationInitializationContextParameters *v2;
  UISApplicationInitializationContextParameters *v3;
  NSArray *deviceFamilies;
  NSArray *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISApplicationInitializationContextParameters;
  v2 = -[UISApplicationInitializationContextParameters init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    deviceFamilies = v2->_deviceFamilies;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_supportedInterfaceOrientations = 0;
    v2->_deviceFamilies = v5;

    *(_WORD *)&v3->_requiresFullScreen = 0;
    v3->_initialCGDirectDisplayID = 0;
    v3->_usableDisplaySizeHint = (CGSize)*MEMORY[0x1E0C9D820];
    *(_WORD *)&v3->_preferSmallerDisplaySize = 0;
  }
  return v3;
}

- (UISApplicationInitializationContextParameters)initWithXPCDictionary:(id)a3
{
  id v4;
  UISApplicationInitializationContextParameters *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *deviceFamilies;
  double v10;
  double v11;
  _QWORD applier[5];
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UISApplicationInitializationContextParameters;
  v5 = -[UISApplicationInitializationContextParameters init](&v14, sel_init);
  if (v5)
  {
    v5->_supportedInterfaceOrientations = xpc_dictionary_get_int64(v4, "supportedInterfaceOrientations");
    xpc_dictionary_get_array(v4, "deviceFamilies");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __71__UISApplicationInitializationContextParameters_initWithXPCDictionary___block_invoke;
      applier[3] = &unk_1E2CAFA38;
      applier[4] = v7;
      xpc_array_apply(v6, applier);
      v8 = objc_msgSend(v7, "copyWithZone:", 0);
      deviceFamilies = v5->_deviceFamilies;
      v5->_deviceFamilies = (NSArray *)v8;

    }
    else
    {
      v7 = v5->_deviceFamilies;
      v5->_deviceFamilies = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    v5->_requiresFullScreen = xpc_dictionary_get_BOOL(v4, "requiresFullScreen");
    v5->_supportsMultiwindow = xpc_dictionary_get_BOOL(v4, "supportsMultiwindow");
    v5->_initialCGDirectDisplayID = xpc_dictionary_get_uint64(v4, "initialCGDirectDisplayID");
    v10 = xpc_dictionary_get_double(v4, "usableDisplaySizeHint_w");
    v11 = xpc_dictionary_get_double(v4, "usableDisplaySizeHint_h");
    v5->_usableDisplaySizeHint.width = v10;
    v5->_usableDisplaySizeHint.height = v11;
    v5->_preferSmallerDisplaySize = xpc_dictionary_get_BOOL(v4, "preferSmallerDisplaySize");
    v5->_useTrueDisplaySize = xpc_dictionary_get_BOOL(v4, "useTrueDisplaySize");

  }
  return v5;
}

uint64_t __71__UISApplicationInitializationContextParameters_initWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (MEMORY[0x194010E50]() == MEMORY[0x1E0C81328])
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_int64_get_value(v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  return 1;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  xpc_dictionary_set_int64(v4, "supportedInterfaceOrientations", self->_supportedInterfaceOrientations);
  if (self->_deviceFamilies)
  {
    v5 = xpc_array_create(0, 0);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_deviceFamilies;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          xpc_array_set_int64(v5, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "integerValue", (_QWORD)v11));
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    xpc_dictionary_set_value(v4, "deviceFamilies", v5);
  }
  xpc_dictionary_set_BOOL(v4, "requiresFullScreen", self->_requiresFullScreen);
  xpc_dictionary_set_BOOL(v4, "supportsMultiwindow", self->_supportsMultiwindow);
  xpc_dictionary_set_uint64(v4, "initialCGDirectDisplayID", self->_initialCGDirectDisplayID);
  xpc_dictionary_set_double(v4, "usableDisplaySizeHint_w", self->_usableDisplaySizeHint.width);
  xpc_dictionary_set_double(v4, "usableDisplaySizeHint_h", self->_usableDisplaySizeHint.height);
  xpc_dictionary_set_BOOL(v4, "preferSmallerDisplaySize", self->_preferSmallerDisplaySize);
  xpc_dictionary_set_BOOL(v4, "useTrueDisplaySize", self->_useTrueDisplaySize);

}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

- (NSArray)deviceFamilies
{
  return self->_deviceFamilies;
}

- (void)setDeviceFamilies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)requiresFullScreen
{
  return self->_requiresFullScreen;
}

- (void)setRequiresFullScreen:(BOOL)a3
{
  self->_requiresFullScreen = a3;
}

- (BOOL)supportsMultiwindow
{
  return self->_supportsMultiwindow;
}

- (void)setSupportsMultiwindow:(BOOL)a3
{
  self->_supportsMultiwindow = a3;
}

- (unsigned)initialCGDirectDisplayID
{
  return self->_initialCGDirectDisplayID;
}

- (void)setInitialCGDirectDisplayID:(unsigned int)a3
{
  self->_initialCGDirectDisplayID = a3;
}

- (CGSize)usableDisplaySizeHint
{
  double width;
  double height;
  CGSize result;

  width = self->_usableDisplaySizeHint.width;
  height = self->_usableDisplaySizeHint.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setUsableDisplaySizeHint:(CGSize)a3
{
  self->_usableDisplaySizeHint = a3;
}

- (BOOL)preferSmallerDisplaySize
{
  return self->_preferSmallerDisplaySize;
}

- (void)setPreferSmallerDisplaySize:(BOOL)a3
{
  self->_preferSmallerDisplaySize = a3;
}

- (BOOL)useTrueDisplaySize
{
  return self->_useTrueDisplaySize;
}

- (void)setUseTrueDisplaySize:(BOOL)a3
{
  self->_useTrueDisplaySize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceFamilies, 0);
}

@end
