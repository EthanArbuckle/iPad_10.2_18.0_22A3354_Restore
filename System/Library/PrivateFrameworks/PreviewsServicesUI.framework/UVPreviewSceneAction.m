@implementation UVPreviewSceneAction

- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)initWithCoder:(id)a3
{
  return (_TtC18PreviewsServicesUI20UVPreviewSceneAction *)sub_22AE4B7E8(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)initWithXPCDictionary:(id)a3
{
  return (_TtC18PreviewsServicesUI20UVPreviewSceneAction *)sub_22AE4B7E8(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  _TtC18PreviewsServicesUI20UVPreviewSceneAction *result;

  _Block_copy(a6);
  result = (_TtC18PreviewsServicesUI20UVPreviewSceneAction *)sub_22AE5E1F8();
  __break(1u);
  return result;
}

+ (id)new
{
  id result;

  result = (id)sub_22AE5E1F8();
  __break(1u);
  return result;
}

- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)init
{
  _TtC18PreviewsServicesUI20UVPreviewSceneAction *result;

  result = (_TtC18PreviewsServicesUI20UVPreviewSceneAction *)sub_22AE5E1F8();
  __break(1u);
  return result;
}

- (id)keyDescriptionForSetting:(int64_t)a3
{
  void *v3;

  if ((unint64_t)a3 > 2)
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)sub_22AE5E0C0();
    swift_bridgeObjectRelease();
  }
  return v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5
{
  _TtC18PreviewsServicesUI20UVPreviewSceneAction *v7;
  _TtC18PreviewsServicesUI20UVPreviewSceneAction *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _OWORD v13[2];

  if (a4)
  {
    v7 = self;
    swift_unknownObjectRetain();
    sub_22AE5E198();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v8 = self;
  }
  sub_22AE4C638((uint64_t)v13, a5);
  v10 = v9;

  sub_22AE4C830((uint64_t)v13, &qword_255B535F0);
  if (!v10)
    return 0;
  v11 = (void *)sub_22AE5E0C0();
  swift_bridgeObjectRelease();
  return v11;
}

- (_TtC18PreviewsServicesUI20UVPreviewSceneAction)initWithInfo:(id)a3 responder:(id)a4
{
  id v5;
  id v6;
  _TtC18PreviewsServicesUI20UVPreviewSceneAction *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC18PreviewsServicesUI20UVPreviewSceneAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
