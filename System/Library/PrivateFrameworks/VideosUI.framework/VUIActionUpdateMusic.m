@implementation VUIActionUpdateMusic

- (VUIActionUpdateMusic)initWithContextData:(id)a3
{
  id v4;
  VUIActionUpdateMusic *v5;
  uint64_t v6;
  NSString *itemID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIActionUpdateMusic;
  v5 = -[VUIActionUpdateMusic init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("itemID"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v6;

    v5->_isExplicit = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("isExplicit"), 0);
  }

  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t);
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  VUIActionUpdateMusic *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, uint64_t))a4;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIActionUpdateMusic itemID](self, "itemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIActionUpdateMusic::(%p) perform action, itemId: %@", (uint8_t *)&v10, 0x16u);

  }
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "musicManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSongToMusicWithSongId:isExplicit:", self->_itemID, self->_isExplicit);

  v5[2](v5, 1);
}

- (BOOL)isAccountRequired
{
  return 1;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end
