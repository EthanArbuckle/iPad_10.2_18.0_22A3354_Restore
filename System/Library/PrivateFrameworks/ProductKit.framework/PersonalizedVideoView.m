@implementation PersonalizedVideoView

- (_TtC10ProductKit21PersonalizedVideoView)initWithFrame:(CGRect)a3
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _TtC10ProductKit21PersonalizedVideoView *result;

  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_startedHandler);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_completedHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_featureHandler);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_sceneDriver) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_hasSetUpSceneDriver) = 0;

  result = (_TtC10ProductKit21PersonalizedVideoView *)sub_213B2C38C();
  __break(1u);
  return result;
}

- (_TtC10ProductKit21PersonalizedVideoView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  _TtC10ProductKit21PersonalizedVideoView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_startedHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_completedHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_featureHandler);
  *v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_sceneDriver) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_hasSetUpSceneDriver) = 0;
  v7 = a3;

  result = (_TtC10ProductKit21PersonalizedVideoView *)sub_213B2C38C();
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC10ProductKit21PersonalizedVideoView *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_sceneView);
  v5 = self;
  objc_msgSend(v4, sel_setDelegate_, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[PersonalizedVideoView dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_213AD529C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_startedHandler));
  sub_213AD529C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_completedHandler));
  sub_213AD529C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_featureHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_sceneView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_sceneDriver));
  sub_213AD53FC((uint64_t)self + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_configuration, type metadata accessor for VideoViewConfiguration);
}

- (void)willMoveToSuperview:(id)a3
{
  id v5;
  _TtC10ProductKit21PersonalizedVideoView *v6;

  v5 = a3;
  v6 = self;
  sub_213AD05A8((uint64_t)a3);

}

@end
