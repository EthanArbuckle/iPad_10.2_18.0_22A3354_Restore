@implementation FMPFSKScene

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  @objc FMPFSKScene.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, specialized FMPFSKScene.touchesBegan(_:with:));
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  @objc FMPFSKScene.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, specialized FMPFSKScene.touchesMoved(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  @objc FMPFSKScene.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, specialized FMPFSKScene.touchesEnded(_:with:));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  @objc FMPFSKScene.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, specialized FMPFSKScene.touchesCancelled(_:with:));
}

- (_TtC10TVRemoteUI11FMPFSKScene)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized FMPFSKScene.init(coder:)();
}

- (void)dealloc
{
  _TtC10TVRemoteUI11FMPFSKScene *v2;

  v2 = self;
  FMPFSKScene.__deallocating_deinit();
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[11];
  char v9;

  v3 = *(_OWORD *)((char *)&self->super.super._skcEffectNode + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_config);
  v8[8] = *(_OWORD *)((char *)&self->super.super.super._focusBehavior + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_config);
  v8[9] = v3;
  v8[10] = *(_OWORD *)((char *)&self->super._pausedTime + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_config);
  v9 = *((_BYTE *)&self->super._visibleRect.origin.y + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_config);
  v4 = *(_OWORD *)((char *)&self->super.super.super._attributeValues + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_config);
  v8[4] = *(_OWORD *)((char *)&self->super.super.super._keyedSubSprites
                    + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_config);
  v8[5] = v4;
  v5 = *(_OWORD *)((char *)&self->super.super.super._version + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_config);
  v8[6] = *(_OWORD *)((char *)&self->super.super.super._userData + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_config);
  v8[7] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_config);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_config);
  v8[1] = v6;
  v7 = *(_OWORD *)((char *)&self->super.super.super._actions + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_config);
  v8[2] = *(_OWORD *)((char *)&self->super.super.super._parent + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_config);
  v8[3] = v7;
  outlined retain of FMPFSKPatternNodeConfig((uint64_t)v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of FMPFSKLabelNodeStyle?);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_ringView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_axisesNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_patternNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_motionManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_dotCountObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_debugModeObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_opacitySpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_isolationQueue));
  outlined destroy of weak FMPFSKPatternNodeDelegate?((uint64_t)self + OBJC_IVAR____TtC10TVRemoteUI11FMPFSKScene_altDelegate);
}

- (NSString)description
{
  _TtC10TVRemoteUI11FMPFSKScene *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = FMR1HapticsController.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x22075C584](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)update:(double)a3
{
  _TtC10TVRemoteUI11FMPFSKScene *v4;

  v4 = self;
  FMPFSKScene.update(_:)(a3);

}

- (CGSize)size
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMPFSKScene();
  -[SKScene size](&v4, sel_size);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double height;
  double width;
  _TtC10TVRemoteUI11FMPFSKScene *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  FMPFSKScene.size.setter(width, height);

}

- (_TtC10TVRemoteUI11FMPFSKScene)initWithSize:(CGSize)a3
{
  _TtC10TVRemoteUI11FMPFSKScene *result;

  result = (_TtC10TVRemoteUI11FMPFSKScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10TVRemoteUI11FMPFSKScene)init
{
  _TtC10TVRemoteUI11FMPFSKScene *result;

  result = (_TtC10TVRemoteUI11FMPFSKScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
