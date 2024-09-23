@implementation FMPFSKPatternNode

- (_TtC10TVRemoteUI17FMPFSKPatternNode)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized FMPFSKPatternNode.init(coder:)();
}

- (NSString)description
{
  _TtC10TVRemoteUI17FMPFSKPatternNode *v2;
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

- (_TtC10TVRemoteUI17FMPFSKPatternNode)init
{
  _TtC10TVRemoteUI17FMPFSKPatternNode *result;

  result = (_TtC10TVRemoteUI17FMPFSKPatternNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[11];
  unsigned __int8 v9;

  v3 = *(_OWORD *)&self->experienceType[OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_config];
  v8[8] = *(_OWORD *)((char *)&self->super._focusBehavior + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_config);
  v8[9] = v3;
  v8[10] = *(_OWORD *)&self->style[OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_config + 15];
  v9 = self->style[OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_config + 31];
  v4 = *(_OWORD *)((char *)&self->super._attributeValues + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_config);
  v8[4] = *(_OWORD *)((char *)&self->super._keyedSubSprites + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_config);
  v8[5] = v4;
  v5 = *(_OWORD *)((char *)&self->super._version + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_config);
  v8[6] = *(_OWORD *)((char *)&self->super._userData + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_config);
  v8[7] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_config);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_config);
  v8[1] = v6;
  v7 = *(_OWORD *)((char *)&self->super._actions + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_config);
  v8[2] = *(_OWORD *)((char *)&self->super._parent + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_config);
  v8[3] = v7;
  outlined retain of FMPFSKPatternNodeConfig((uint64_t)v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of FMPFSKLabelNodeStyle?);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_canvasDebugNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_canvasInsideBorderBezierNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_canvasDiskBezierNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_canvasPatternSpinesNode));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_patternFragmentsNode));
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_noonDotColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_pointeeDotColor));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_conformationFactorSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_conformedToExplodedFactorSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_energeticAngleSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_lethargicAngleSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_centerFactorSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_lookoutSpring));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_labelsOpacitySpring));
  outlined destroy of weak FMPFSKPatternNodeDelegate?((uint64_t)self + OBJC_IVAR____TtC10TVRemoteUI17FMPFSKPatternNode_delegate);
}

@end
