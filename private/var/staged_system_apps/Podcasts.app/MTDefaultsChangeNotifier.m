@implementation MTDefaultsChangeNotifier

- (MTDefaultsChangeNotifier)initWithProperties:(id)a3 defaults:(id)a4
{
  id v7;
  MTDefaultsChangeNotifier *v8;
  MTDefaultsChangeNotifier *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTDefaultsChangeNotifier;
  v8 = -[MTDictionaryDiff initWithProperties:](&v11, "initWithProperties:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_defaults, a4);

  return v9;
}

- (void)start
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (!-[MTDefaultsChangeNotifier isRunning](self, "isRunning"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTDictionaryDiff properties](self, "properties", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_defaults, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), 0, self);
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    -[MTDefaultsChangeNotifier setRunning:](self, "setRunning:", 1);
    -[MTDefaultsChangeNotifier _defaultsChanged](self, "_defaultsChanged");
  }
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)_defaultsChanged
{
  MTDefaultsChangeNotifier *v2;
  void *v3;
  objc_super v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryRepresentation](v2->_defaults, "dictionaryRepresentation"));
  v4.receiver = v2;
  v4.super_class = (Class)MTDefaultsChangeNotifier;
  -[MTDictionaryDiff setDictionary:](&v4, "setDictionary:", v3);

  objc_sync_exit(v2);
}

- (void)dealloc
{
  objc_super v3;

  -[MTDefaultsChangeNotifier stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)MTDefaultsChangeNotifier;
  -[MTDefaultsChangeNotifier dealloc](&v3, "dealloc");
}

- (void)stop
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (-[MTDefaultsChangeNotifier isRunning](self, "isRunning"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTDictionaryDiff properties](self, "properties", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[NSUserDefaults removeObserver:forKeyPath:context:](self->_defaults, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), self);
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    -[MTDefaultsChangeNotifier setRunning:](self, "setRunning:", 0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == self)
    objc_msgSend(a6, "_defaultsChanged", a3, a4, a5);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
