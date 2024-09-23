@implementation PreviewSceneAgentProxy.SceneDelegate

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v6;
  id v7;
  _TtCC15PreviewShellKit22PreviewSceneAgentProxyP33_3E64D4B6ABF6A6AD0F98F116D965CFCA13SceneDelegate *v8;

  sub_24470758C();
  sub_24470665C(&qword_25737D310, (uint64_t (*)(uint64_t))sub_24470758C, MEMORY[0x24BEE5BD8]);
  v6 = sub_244795310();
  v7 = a3;
  v8 = self;
  sub_2447070B0(v6);

  swift_bridgeObjectRelease();
}

- (void)sceneDidInvalidate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtCC15PreviewShellKit22PreviewSceneAgentProxyP33_3E64D4B6ABF6A6AD0F98F116D965CFCA13SceneDelegate *v10;
  _QWORD v11[2];

  swift_getObjectType();
  v5 = sub_244794608();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244795208();
  v9 = a3;
  v10 = self;
  sub_2447951FC();
  sub_2447951E4();
  swift_release();
  v11[1] = v10;
  sub_2447945FC();
  sub_24470665C(&qword_25737D2F0, type metadata accessor for PreviewSceneAgentProxy.SceneDelegate, (uint64_t)&unk_24479648C);
  sub_24479459C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtCC15PreviewShellKit22PreviewSceneAgentProxyP33_3E64D4B6ABF6A6AD0F98F116D965CFCA13SceneDelegate *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_2447073A4(v10, a6);

}

- (_TtCC15PreviewShellKit22PreviewSceneAgentProxyP33_3E64D4B6ABF6A6AD0F98F116D965CFCA13SceneDelegate)init
{
  _TtCC15PreviewShellKit22PreviewSceneAgentProxyP33_3E64D4B6ABF6A6AD0F98F116D965CFCA13SceneDelegate *result;

  result = (_TtCC15PreviewShellKit22PreviewSceneAgentProxyP33_3E64D4B6ABF6A6AD0F98F116D965CFCA13SceneDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtCC15PreviewShellKit22PreviewSceneAgentProxyP33_3E64D4B6ABF6A6AD0F98F116D965CFCA13SceneDelegate_clientSettingsUpdates;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737D070);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

@end
