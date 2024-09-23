@implementation ScriptUpdateServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC24MusicScriptUpdateService27ScriptUpdateServiceDelegate *v10;
  id v11;
  id v12;

  v7 = (void *)objc_opt_self(NSXPCInterface);
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = objc_msgSend(v7, "interfaceWithProtocol:", &OBJC_PROTOCOL____TtP24MusicScriptUpdateService32MusicScriptUpdateServiceProtocol_);
  objc_msgSend(v9, "setExportedInterface:", v11);

  v12 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MusicScriptUpdateService(0)), "init");
  objc_msgSend(v9, "setExportedObject:", v12);

  objc_msgSend(v9, "resume");
  return 1;
}

- (_TtC24MusicScriptUpdateService27ScriptUpdateServiceDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ScriptUpdateServiceDelegate();
  return -[ScriptUpdateServiceDelegate init](&v3, "init");
}

@end
