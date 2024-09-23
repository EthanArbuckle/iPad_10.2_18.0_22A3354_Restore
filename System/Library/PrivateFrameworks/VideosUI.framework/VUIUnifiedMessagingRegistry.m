@implementation VUIUnifiedMessagingRegistry

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1)
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_64);
  return (id)sharedInstance__registry;
}

void __45__VUIUnifiedMessagingRegistry_sharedInstance__block_invoke()
{
  VUIUnifiedMessagingRegistry *v0;
  void *v1;

  v0 = objc_alloc_init(VUIUnifiedMessagingRegistry);
  v1 = (void *)sharedInstance__registry;
  sharedInstance__registry = (uint64_t)v0;

}

- (VUIUnifiedMessagingRegistry)init
{
  VUIUnifiedMessagingRegistry *v2;
  uint64_t v3;
  NSPointerArray *buttonViews;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIUnifiedMessagingRegistry;
  v2 = -[VUIUnifiedMessagingRegistry init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    buttonViews = v2->_buttonViews;
    v2->_buttonViews = (NSPointerArray *)v3;

  }
  return v2;
}

- (BOOL)hasActiveButtons
{
  VUIUnifiedMessagingRegistry *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[VUIUnifiedMessagingRegistry _hasActiveButtonsNoLock](v2, "_hasActiveButtonsNoLock");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_hasActiveButtonsNoLock
{
  void *v3;
  void *v4;

  -[VUIUnifiedMessagingRegistry buttonViews](self, "buttonViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "compact");

  -[VUIUnifiedMessagingRegistry buttonViews](self, "buttonViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "count") != 0;

  return (char)v3;
}

- (void)registerDownloadButton:(id)a3
{
  VUIUnifiedMessagingRegistry *v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[VUIUnifiedMessagingRegistry _hasActiveButtonsNoLock](v4, "_hasActiveButtonsNoLock");
  -[VUIUnifiedMessagingRegistry buttonViews](v4, "buttonViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addPointer:", v7);

  objc_sync_exit(v4);
  if (!v5)
    -[VUIUnifiedMessagingRegistry _notifyButtonsChanged](v4, "_notifyButtonsChanged");

}

- (void)unRegisterDownloadButton:(id)a3
{
  VUIUnifiedMessagingRegistry *v4;
  unint64_t i;
  id v6;
  BOOL v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  for (i = 0; i < -[NSPointerArray count](v4->_buttonViews, "count"); ++i)
  {
    -[NSPointerArray pointerAtIndex:](v4->_buttonViews, "pointerAtIndex:", i);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v8)
    {
      if (i != 0x7FFFFFFFFFFFFFFFLL)
        -[NSPointerArray removePointerAtIndex:](v4->_buttonViews, "removePointerAtIndex:", i);
      break;
    }
  }
  v7 = -[VUIUnifiedMessagingRegistry _hasActiveButtonsNoLock](v4, "_hasActiveButtonsNoLock");
  objc_sync_exit(v4);

  if (!v7)
    -[VUIUnifiedMessagingRegistry _notifyButtonsChanged](v4, "_notifyButtonsChanged");

}

- (void)_notifyButtonsChanged
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__notifyButtonsChangedAction, self);
  -[VUIUnifiedMessagingRegistry performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__notifyButtonsChangedAction, self, 0.5);
}

- (void)_notifyButtonsChangedAction
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("VUIUnifiedMessagingRegistryActiveButtonsDidChange"), self);

}

- (void)register:(int64_t)a3 newTeamsAdded:(BOOL)a4 teamsRemoved:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v8;
  NSNumber *hasFavoriteTeams;
  VUIUnifiedMessagingRegistry *obj;

  v5 = a5;
  v6 = a4;
  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = objc_claimAutoreleasedReturnValue();
  hasFavoriteTeams = obj->_hasFavoriteTeams;
  obj->_hasFavoriteTeams = (NSNumber *)v8;

  if (v6)
    obj->_newTeamsAdded = 1;
  if (v5)
    obj->_teamsRemoved = 1;
  objc_sync_exit(obj);

}

- (void)postNotificationFavoriteTeamsDidChange
{
  VUIUnifiedMessagingRegistry *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v7[0] = CFSTR("VUIUnifiedMessagingRegistryFavoriteTeamsAdded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2->_newTeamsAdded);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("VUIUnifiedMessagingRegistryFavoriteTeamsRemoved");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2->_teamsRemoved);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("VUIUnifiedMessagingRegistryHasFavoriteTeamsDidChange"), v5);

  *(_WORD *)&v2->_newTeamsAdded = 0;
  objc_sync_exit(v2);

}

- (NSNumber)hasFavoriteTeams
{
  return self->_hasFavoriteTeams;
}

- (NSPointerArray)buttonViews
{
  return self->_buttonViews;
}

- (void)setButtonViews:(id)a3
{
  objc_storeStrong((id *)&self->_buttonViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonViews, 0);
  objc_storeStrong((id *)&self->_hasFavoriteTeams, 0);
}

@end
