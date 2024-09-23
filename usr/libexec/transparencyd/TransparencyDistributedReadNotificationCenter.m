@implementation TransparencyDistributedReadNotificationCenter

+ (id)defaultCenter
{
  id v3;
  id v4;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A7A00);
  v3 = (id)qword_1002A79F8;
  if (!v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A7A00);
    v4 = objc_alloc_init((Class)a1);
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A7A00);
    if (qword_1002A79F8)
    {
      v3 = (id)qword_1002A79F8;
    }
    else
    {
      v3 = v4;
      v4 = (id)qword_1002A79F8;
      qword_1002A79F8 = (uint64_t)v3;
    }

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A7A00);
  return v3;
}

- (TransparencyDistributedReadNotificationCenter)init
{
  TransparencyDistributedReadNotificationCenter *v2;
  void *v3;
  id v4;
  void *v5;
  TransparencyDistributedReadNotificationCenter *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TransparencyDistributedReadNotificationCenter;
  v2 = -[TransparencyDistributedReadNotificationCenter init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    -[TransparencyDistributedReadNotificationCenter setNsDNC:](v2, "setNsDNC:", v3);

    v4 = objc_alloc_init((Class)NSNotificationCenter);
    -[TransparencyDistributedReadNotificationCenter setLocalNC:](v2, "setLocalNC:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[TransparencyDistributedReadNotificationCenter setCachedNotification:](v2, "setCachedNotification:", v5);

    v6 = v2;
  }

  return v2;
}

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a5;
  if (v8)
  {
    v15 = v8;
    v9 = a3;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A7A00);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyDistributedReadNotificationCenter cachedNotification](self, "cachedNotification"));
    v11 = objc_msgSend(v10, "containsObject:", v15);

    if ((v11 & 1) != 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A7A00);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyDistributedReadNotificationCenter cachedNotification](self, "cachedNotification"));
      objc_msgSend(v12, "addObject:", v15);

      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A7A00);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyDistributedReadNotificationCenter nsDNC](self, "nsDNC"));
      objc_msgSend(v13, "addObserver:selector:name:object:", self, "notificationProxyMethod:", v15, 0);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyDistributedReadNotificationCenter localNC](self, "localNC"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v9, a4, v15, 0);

    v8 = v15;
  }

}

- (void)notificationProxyMethod:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyDistributedReadNotificationCenter localNC](self, "localNC"));
  objc_msgSend(v5, "postNotification:", v4);

}

- (void)removeObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyDistributedReadNotificationCenter localNC](self, "localNC"));
    objc_msgSend(v8, "removeObserver:name:object:", v7, v6, 0);

  }
}

- (NSDistributedNotificationCenter)nsDNC
{
  return (NSDistributedNotificationCenter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNsDNC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNotificationCenter)localNC
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocalNC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableSet)cachedNotification
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedNotification, 0);
  objc_storeStrong((id *)&self->_localNC, 0);
  objc_storeStrong((id *)&self->_nsDNC, 0);
}

@end
