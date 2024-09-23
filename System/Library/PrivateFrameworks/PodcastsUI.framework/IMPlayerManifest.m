@implementation IMPlayerManifest

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  id v5;

  -[IMPlayerManifest assertIndexInBounds:](self, "assertIndexInBounds:");
  self->_currentIndex = a3;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[IMPlayerManifest setCurrentItem:](self, "setCurrentItem:", 0);
  }
  else
  {
    -[IMPlayerManifest objectAtIndex:](self, "objectAtIndex:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[IMPlayerManifest setCurrentItem:](self, "setCurrentItem:", v5);

  }
}

- (void)setCurrentItem:(id)a3
{
  IMPlayerItem *v5;
  IMPlayerItem *currentItem;
  BOOL v7;
  void *v8;
  void *v9;
  IMPlayerItem *v10;

  v5 = (IMPlayerItem *)a3;
  currentItem = self->_currentItem;
  if (currentItem != v5)
  {
    v10 = v5;
    v7 = -[IMPlayerItem isEqual:](currentItem, "isEqual:", v5);
    v5 = v10;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_currentItem, a3);
      -[IMPlayerManifest activity](self, "activity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPlayerItem updateActivity:](v10, "updateActivity:", v8);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("IMPlayerManifestCurrentItemDidChange"), self);

      v5 = v10;
    }
  }

}

- (void)postManifestDidChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("IMPlayerManifestDidChange"), self);

}

- (NSUserActivity)activity
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  NSUserActivity *v7;
  NSUserActivity *activity;
  NSUserActivity *v9;
  void *v10;
  NSUserActivity *v11;
  NSUserActivity *v12;
  void *v13;
  NSUserActivity *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!self->_activity)
    {
      v4 = objc_msgSend(MEMORY[0x1E0D7F278], "isRunningOnTV");
      v5 = objc_alloc(MEMORY[0x1E0CA5920]);
      v6 = v5;
      if ((v4 & 1) != 0)
      {
        v7 = (NSUserActivity *)objc_msgSend(v5, "initWithActivityType:", v3);
        activity = self->_activity;
        self->_activity = v7;

      }
      else
      {
        v19 = *MEMORY[0x1E0DC5ED0];
        v20[0] = MEMORY[0x1E0C9AAA0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (NSUserActivity *)objc_msgSend(v6, "_initWithTypeIdentifier:suggestedActionType:options:", v3, 1, v10);
        v12 = self->_activity;
        self->_activity = v11;

      }
      -[NSUserActivity setContentUserAction:](self->_activity, "setContentUserAction:", *MEMORY[0x1E0CB3410]);
    }
    -[IMPlayerManifest title](self, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = self->_activity;
      -[IMPlayerManifest title](self, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserActivity setValue:forKey:](v14, "setValue:forKey:", v15, CFSTR("IMPlayerManifestTitle"));

    }
    -[IMPlayerManifest currentItem](self, "currentItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[IMPlayerManifest currentItem](self, "currentItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "updateActivity:", self->_activity);

    }
    v9 = self->_activity;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (IMPlayerItem)currentItem
{
  return self->_currentItem;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

uint64_t __25__IMPlayerManifest_load___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_load:", *(_QWORD *)(a1 + 40));
}

- (IMPlayerManifest)init
{
  IMPlayerManifest *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  IMPlayerItem *currentItem;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IMPlayerManifest;
  v2 = -[IMPlayerManifest init](&v13, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.worker_queue"), v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    -[IMPlayerManifest setQueue:](v2, "setQueue:", v7);

    currentItem = v2->_currentItem;
    v2->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
    v2->_currentItem = 0;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v10;

  }
  return v2;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

+ (void)registerManifestForRestoration:(Class)a3
{
  void *v4;
  void *v5;

  if (registerManifestForRestoration__onceToken != -1)
    dispatch_once(&registerManifestForRestoration__onceToken, &__block_literal_global_4);
  -[objc_class _activityType](a3, "_activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend((id)_activityTypeToClassMap, "setObject:forKey:", a3, v4);
    v4 = v5;
  }

}

+ (id)_activityType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "activityTypeSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.playback.%@"), v4, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_load:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

+ (id)supportedActivityTypes
{
  return (id)objc_msgSend((id)_activityTypeToClassMap, "allKeys");
}

- (void)load:(id)a3
{
  void (**v4)(_QWORD);
  IMPlayerManifest *v5;
  _QWORD v6[5];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[IMPlayerManifest isLoaded](self, "isLoaded"))
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    if (-[IMPlayerManifest isLoaded](v5, "isLoaded"))
    {
      if (v4)
        v4[2](v4);
    }
    else
    {
      -[IMPlayerManifest setIsLoaded:](v5, "setIsLoaded:", 1);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __25__IMPlayerManifest_load___block_invoke;
      v6[3] = &unk_1EA0C5048;
      v6[4] = v5;
      v7 = v4;
      +[IMAVPlayer performOnMainQueue:](IMAVPlayer, "performOnMainQueue:", v6);

    }
    objc_sync_exit(v5);

  }
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

void __47__IMPlayerManifest_restoreActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("IMPlayerManifestTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

void __51__IMPlayerManifest_registerManifestForRestoration___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_activityTypeToClassMap;
  _activityTypeToClassMap = (uint64_t)v0;

}

+ (void)restoreActivity:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)_activityTypeToClassMap;
  objc_msgSend(v5, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "objectForKey:", v8);

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__IMPlayerManifest_restoreActivity_completion___block_invoke;
    v10[3] = &unk_1EA0C5338;
    v11 = v5;
    v12 = v6;
    objc_msgSend(v9, "createManifestForActivity:completion:", v11, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (BOOL)hasNext
{
  unint64_t v3;

  v3 = -[IMPlayerManifest currentIndex](self, "currentIndex") + 1;
  return v3 < -[IMPlayerManifest count](self, "count");
}

- (void)next
{
  unint64_t v3;

  if (-[IMPlayerManifest hasNext](self, "hasNext"))
    v3 = -[IMPlayerManifest currentIndex](self, "currentIndex") + 1;
  else
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  -[IMPlayerManifest setCurrentIndex:](self, "setCurrentIndex:", v3);
}

- (BOOL)hasPrevious
{
  return -[IMPlayerManifest currentIndex](self, "currentIndex") != 0;
}

- (void)previous
{
  unint64_t v3;

  if (-[IMPlayerManifest hasPrevious](self, "hasPrevious"))
    v3 = -[IMPlayerManifest currentIndex](self, "currentIndex") - 1;
  else
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  -[IMPlayerManifest setCurrentIndex:](self, "setCurrentIndex:", v3);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)count
{
  return 0;
}

- (void)nextManifest:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

+ (id)activityTypeSuffix
{
  return 0;
}

- (void)postLoadedAdditionalItemsNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("IMPlayerManifestDidLoadAdditionalItems"), self);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMPlayerManifest count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("index");
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMPlayerManifest currentIndex](self, "currentIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)IMPlayerManifest;
  -[IMPlayerManifest description](&v11, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@\n%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
