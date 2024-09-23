@implementation SUAudioPlayerSessionManager

- (SUAudioPlayerSessionManager)init
{
  SUAudioPlayerSessionManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUAudioPlayerSessionManager;
  v2 = -[SUAudioPlayerSessionManager init](&v4, sel_init);
  if (v2)
    v2->_sessions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SUAudioPlayerStatusChangeNotification"), 0);

  v3.receiver = self;
  v3.super_class = (Class)SUAudioPlayerSessionManager;
  -[SUAudioPlayerSessionManager dealloc](&v3, sel_dealloc);
}

+ (id)sessionManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUAudioPlayerSessionManager_sessionManager__block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = a1;
  if (sessionManager_sOnce != -1)
    dispatch_once(&sessionManager_sOnce, block);
  return (id)sessionManager_sManager;
}

id __45__SUAudioPlayerSessionManager_sessionManager__block_invoke()
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  sessionManager_sManager = (uint64_t)result;
  return result;
}

- (NSArray)allSessionURLs
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_sessions, "allKeys");
}

- (id)audioPlayerForURL:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:", a3);
}

- (id)endSessionForURL:(id)a3
{
  id v5;
  void *v6;

  v5 = (id)-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:");
  if (v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("SUAudioPlayerStatusChangeNotification"), v5);
    -[NSMutableDictionary removeObjectForKey:](self->_sessions, "removeObjectForKey:", a3);
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("SUAudioPlayerSessionsChangedNotification"), self);
    if (!-[NSMutableDictionary count](self->_sessions, "count"))
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endReceivingRemoteControlEvents");
  }
  return v5;
}

- (id)startSessionWithURL:(id)a3
{
  SUAudioPlayer *v5;
  void *v6;

  v5 = (SUAudioPlayer *)(id)-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:");
  if (!v5)
  {
    v5 = -[SUAudioPlayer initWithURL:]([SUAudioPlayer alloc], "initWithURL:", a3);
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__audioPlayerStatusChangeNotification_, CFSTR("SUAudioPlayerStatusChangeNotification"), v5);
    if (!-[NSMutableDictionary count](self->_sessions, "count"))
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginReceivingRemoteControlEvents");
    -[NSMutableDictionary setObject:forKey:](self->_sessions, "setObject:forKey:", v5, a3);
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("SUAudioPlayerSessionsChangedNotification"), self);
  }
  return v5;
}

- (id)stopAllAudioPlayerSessions
{
  void *v3;
  void *v4;
  NSMutableDictionary *sessions;
  _QWORD v7[7];

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (-[NSMutableDictionary count](self->_sessions, "count"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    sessions = self->_sessions;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __57__SUAudioPlayerSessionManager_stopAllAudioPlayerSessions__block_invoke;
    v7[3] = &unk_24DE7DF58;
    v7[4] = v4;
    v7[5] = self;
    v7[6] = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessions, "enumerateKeysAndObjectsUsingBlock:", v7);
    -[NSMutableDictionary removeAllObjects](self->_sessions, "removeAllObjects");
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("SUAudioPlayerSessionsChangedNotification"), self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endReceivingRemoteControlEvents");
  }
  return v3;
}

uint64_t __57__SUAudioPlayerSessionManager_stopAllAudioPlayerSessions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(*(id *)(a1 + 32), "removeObserver:name:object:", *(_QWORD *)(a1 + 40), CFSTR("SUAudioPlayerStatusChangeNotification"), a3);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", a3);
  return objc_msgSend(a3, "stop");
}

- (void)_audioPlayerStatusChangeNotification:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "object");
  if ((objc_msgSend((id)objc_msgSend(v4, "playerStatus"), "playerState") & 0xFFFFFFFFFFFFFFFELL) == 4)
    -[SUAudioPlayerSessionManager endSessionForURL:](self, "endSessionForURL:", objc_msgSend(v4, "URL"));
}

@end
