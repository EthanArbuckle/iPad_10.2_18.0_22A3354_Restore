@implementation SUScriptMusicPlayerNativeObject

- (void)destroyNativeObject
{
  id v3;
  void *v4;
  objc_super v5;

  v3 = -[SUScriptNativeObject object](self, "object");
  objc_msgSend(v3, "endGeneratingPlaybackNotifications");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDDC428], v3);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDDC430], v3);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDDC440], v3);
  v5.receiver = self;
  v5.super_class = (Class)SUScriptMusicPlayerNativeObject;
  -[SUScriptNativeObject destroyNativeObject](&v5, sel_destroyNativeObject);
}

- (void)setupNativeObject
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v3 = -[SUScriptNativeObject object](self, "object");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = *MEMORY[0x24BDDC428];
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__nowPlayingChangeNotification_, *MEMORY[0x24BDDC428], v3);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__playbackStateChangeNotification_, *MEMORY[0x24BDDC430], v3);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__volumeChangeNotification_, v5, v3);
  objc_msgSend(v3, "beginGeneratingPlaybackNotifications");
  v6.receiver = self;
  v6.super_class = (Class)SUScriptMusicPlayerNativeObject;
  -[SUScriptNativeObject setupNativeObject](&v6, sel_setupNativeObject);
}

- (void)_nowPlayingChangeNotification:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "dispatchEvent:forName:", 0, CFSTR("nowplayingitemchange"));
}

- (void)_playbackStateChangeNotification:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "dispatchEvent:forName:", 0, CFSTR("playbackstatechange"));
}

- (void)_volumeChangeNotification:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "dispatchEvent:forName:", 0, CFSTR("volumechange"));
}

@end
