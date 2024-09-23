@implementation ICMathNotesWindowSceneDelegate

- (void)ic_setupWithScene:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  ICMathNotesWindowSceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1003C9F28((uint64_t)v6);

}

- (void)ic_sceneDidDisconnect:(id)a3
{
  -[ICCommonWindowSceneDelegate sharedDisconnect](self, "sharedDisconnect", a3);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  ICMathNotesWindowSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1003C9A40(v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  ICMathNotesWindowSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1003C9CFC(v4);

}

- (ICMathNotesWindowSceneDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MathNotesSceneDelegate();
  return -[ICMathNotesWindowSceneDelegate init](&v3, "init");
}

@end
