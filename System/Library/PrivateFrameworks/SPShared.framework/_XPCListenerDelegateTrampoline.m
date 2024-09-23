@implementation _XPCListenerDelegateTrampoline

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7;
  id v8;
  _TtC8SPSharedP33_4DFE191C45A702EAD1213F8D530A798030_XPCListenerDelegateTrampoline *v9;

  swift_unownedRetainStrong();
  v7 = a3;
  v8 = a4;
  v9 = self;
  LOBYTE(a3) = sub_1B695647C(v8);

  swift_release();
  return a3 & 1;
}

- (_TtC8SPSharedP33_4DFE191C45A702EAD1213F8D530A798030_XPCListenerDelegateTrampoline)init
{
  _TtC8SPSharedP33_4DFE191C45A702EAD1213F8D530A798030_XPCListenerDelegateTrampoline *result;

  result = (_TtC8SPSharedP33_4DFE191C45A702EAD1213F8D530A798030_XPCListenerDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unownedRelease();
}

@end
