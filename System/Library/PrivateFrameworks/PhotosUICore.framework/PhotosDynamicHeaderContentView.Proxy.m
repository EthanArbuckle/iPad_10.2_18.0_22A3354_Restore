@implementation PhotosDynamicHeaderContentView.Proxy

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _TtCC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView5Proxy *v11;
  BOOL v12;

  v7 = MEMORY[0x1A85CED04]((char *)self+ OBJC_IVAR____TtCC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView5Proxy_target, a2);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = a3;
    v10 = a4;
    v11 = self;
    v12 = sub_1A6BA0FB8(v9);

  }
  else
  {
    return 0;
  }
  return v12;
}

- (id)makeInternalMenuWithPresentationEnvironment:(id)a3
{
  _TtCC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView5Proxy *v5;
  id v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1A6B9BAF8((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (_TtCC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView5Proxy)init
{
  _TtCC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView5Proxy *result;

  result = (_TtCC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView5Proxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
