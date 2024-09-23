@implementation BKSceneProviderBridge

- (void)registerWindowScene:(id)a3 containerHost:(id)a4
{
  id v6;
  id v7;
  BKSceneProviderBridge *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000145A0(v17);
  v9 = v18;
  v10 = v19;
  sub_10003F198(v17, v18);
  v11 = sub_10004CFD4(&qword_1009F3B38);
  dispatch thunk of ResolverType.resolve<A>(_:)(v11, v11, v9, v10);
  v12 = v15;
  if (v15)
  {
    v13 = v16;
    sub_10003F198(v14, v15);
    dispatch thunk of SceneProviderType.register(_:)(v6, v12, v13);
    _s5Books15CurrentPageViewVwxx_0(v14);
    _s5Books15CurrentPageViewVwxx_0(v17);

  }
  else
  {
    __break(1u);
  }
}

- (BKSceneProviderBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneProviderBridge();
  return -[BKSceneProviderBridge init](&v3, "init");
}

@end
