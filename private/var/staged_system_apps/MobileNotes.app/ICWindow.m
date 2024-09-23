@implementation ICWindow

- (id)nextResponder
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICWindow;
  v3 = -[ICWindow nextResponder](&v9, "nextResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindow viewControllerManager](self, "viewControllerManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyboardHandler"));

  if (v6)
  {
    objc_msgSend(v6, "setParentResponder:", v4);
    v7 = v6;

    v4 = v7;
  }

  return v4;
}

- (_TtC11MobileNotes19ICDebugStatusWindow)debugWindow
{
  ICWindow *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1001C8AF0();

  return (_TtC11MobileNotes19ICDebugStatusWindow *)v3;
}

- (void)setDebugWindow:(id)a3
{
  id v5;
  ICWindow *v6;
  _BYTE v7[24];

  swift_beginAccess(&unk_1005D3440, v7, 32, 0);
  v5 = a3;
  v6 = self;
  objc_setAssociatedObject(v6, &unk_1005D3440, v5, (void *)1);
  swift_endAccess(v7);

}

- (BOOL)isDebugWindowVisible
{
  ICWindow *v2;
  _TtC11MobileNotes19ICDebugStatusWindow *v3;

  v2 = self;
  v3 = -[ICWindow debugWindow](v2, "debugWindow");

  if (v3)
  return v3 != 0;
}

- (void)setUpDebugStatusWindow
{
  ICWindow *v2;

  v2 = self;
  sub_1001C8C90();

}

- (void)hideDebugStatusWindow:(id)a3
{
  ICWindow *v3;
  ICWindow *v5;
  uint64_t v6;
  uint64_t v7;
  ICWindow *v8;
  _TtC11MobileNotes19ICDebugStatusWindow *v9;
  _TtC11MobileNotes19ICDebugStatusWindow *v10;
  __int128 v11;
  __int128 v12;

  v3 = self;
  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(&v11, v6);
    swift_unknownObjectRelease(a3, v7);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v8 = self;
  }
  v9 = -[ICWindow debugWindow](v3, "debugWindow", v11, v12);
  if (v9)
  {
    v10 = v9;
    -[ICDebugStatusWindow setHidden:](v9, "setHidden:", 1);
    -[ICDebugStatusWindow setWindowScene:](v10, "setWindowScene:", 0);
    -[ICWindow setDebugWindow:](v3, "setDebugWindow:", 0);

    v3 = (ICWindow *)v10;
  }

  sub_1000160C8((uint64_t)&v11);
}

- (void)showDebugStatusWindow:(id)a3
{
  ICWindow *v5;
  uint64_t v6;
  uint64_t v7;
  ICWindow *v8;
  uint64_t v9;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    v8 = (ICWindow *)swift_unknownObjectRelease(a3, v7);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = self;
  }
  sub_1001C8FB8((uint64_t)v8, v9);

  sub_1000160C8((uint64_t)v10);
}

- (void)toggleDebugStatusWindowVisible:(id)a3
{
  ICWindow *v5;
  uint64_t v6;
  uint64_t v7;
  ICWindow *v8;
  id v9;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3, v7);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = self;
  }
  v9 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  objc_msgSend(v9, "set_ICDebugWindowEnabled:", objc_msgSend(v9, "_ICDebugWindowEnabled") ^ 1);

  sub_1000160C8((uint64_t)v10);
}

@end
