@implementation APPCMetricsView

- (void)setPromotedContentInfo:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___APPCMetricsView_promotedContentInfo);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MetricsView();
  v7 = v10.receiver;
  -[APPCMetricsView setFrame:](&v10, sel_setFrame_, x, y, width, height);
  sub_1B12C929C();
  v8 = objc_msgSend(v7, sel_superview, v10.receiver, v10.super_class);

  if (v8 || (v9 = objc_msgSend(v7, sel_window), v9, v9))
    sub_1B12F51B8(0, 0);

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MetricsView();
  -[APPCMetricsView frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)unloadAdViewIfRequired
{
  APPCMetricsView *v2;

  v2 = self;
  sub_1B12EC5A0();

}

- (void)willEnterforeground
{
  APPCMetricsView *v2;

  v2 = self;
  sub_1B12EC80C();

}

- (void)appWillResignActive:(id)a3
{
  sub_1B12ECD20(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1B12EC96C);
}

- (void)appBackgrounded:(id)a3
{
  sub_1B12ECD20(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1B12ECA28);
}

- (void)appForegrounded:(id)a3
{
  sub_1B12ECD20(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1B12ECB58);
}

- (void)applicationWillTerminate
{
  APPCMetricsView *v2;

  v2 = self;
  sub_1B12ECDC0();

}

- (APPCMetricsInteractionPresentationDelegate)interactionPresentationDelegate
{
  return (APPCMetricsInteractionPresentationDelegate *)sub_1B12F6098((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCMetricsView_interactionPresentationDelegate);
}

- (void)setInteractionPresentationDelegate:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = (char *)self + OBJC_IVAR___APPCMetricsView_interactionPresentationDelegate;
  swift_beginAccess();
  v5 = swift_unknownObjectWeakAssign();
  v6 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0x408))(v5);
  if (v6)
  {
    v7 = (void *)v6;
    MEMORY[0x1B5E1B0F0](v4);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

- (BOOL)ready
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___APPCMetricsView_ready;
  swift_beginAccess();
  return *v2;
}

- (void)setReady:(BOOL)a3
{
  BOOL *v5;
  APPCMetricsView *v6;

  v5 = (BOOL *)self + OBJC_IVAR___APPCMetricsView_ready;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_1B12F5BAC();

}

- (APPrivacyMarker)privacyMarkerView
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0x408))();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(id *)(v2 + OBJC_IVAR___APPCPromotedContentView_privacyMarkerView);

  }
  else
  {
    v4 = 0;
  }
  return (APPrivacyMarker *)v4;
}

- (CGRect)privacyMarkerFrame
{
  uint64_t v3;
  void *v4;
  void *v5;
  APPCMetricsView *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0x408))();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = *(void **)(v3 + OBJC_IVAR___APPCPromotedContentView_privacyMarkerView);
    v6 = self;
    v7 = v5;

    objc_msgSend(v7, sel_frame);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v13 = 0.0;
    v15 = 0.0;
    v9 = 0.0;
    v11 = 0.0;
  }
  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (APPCMetricsViewReadyDelegate)readyDelegate
{
  return (APPCMetricsViewReadyDelegate *)sub_1B12F6098((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCMetricsView_readyDelegate);
}

- (void)setReadyDelegate:(id)a3
{
  APPCMetricsView *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B12FD414();

  swift_unknownObjectRelease();
}

- (APPCDiagnosticMetricsHelping)diagnosticMetricHelper
{
  return (APPCDiagnosticMetricsHelping *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___APPCMetricsView_promotedContent), sel_diagnosticMetricHelper);
}

- (APPCPromotedContentInfo)promotedContentInfo
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___APPCMetricsView_promotedContentInfo);
  swift_beginAccess();
  return (APPCPromotedContentInfo *)*v2;
}

- (UIEdgeInsets)metricsViewEdgeInsets
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  double (*v6)(void);
  APPCMetricsView *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  APPCMetricsView *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = (_QWORD *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0x408))();
  if (v4)
  {
    v5 = v4;
    v6 = *(double (**)(void))((*v3 & *v4) + 0x278);
    v7 = self;
    v8 = v6();
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v15 = qword_1ED388970;
    v16 = self;
    if (v15 != -1)
      swift_once();
    v10 = *((double *)&xmmword_1ED38B710 + 1);
    v8 = *(double *)&xmmword_1ED38B710;
    v12 = qword_1ED38B720;
    v14 = unk_1ED38B728;

  }
  v17 = v8;
  v18 = v10;
  v19 = *(double *)&v12;
  v20 = v14;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (APPCMetricsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s17PromotedContentUI11MetricsViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  APPCMetricsView *v2;

  v2 = self;
  MetricsView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectWeakDestroy();
  sub_1B12DB4F4((uint64_t)self + OBJC_IVAR___APPCMetricsView_interactionPresentationDelegate);
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B12DB4F4((uint64_t)self + OBJC_IVAR___APPCMetricsView_readyDelegate);
  swift_bridgeObjectRelease();
}

- (void)expand
{
  APPCMetricsView *v2;

  v2 = self;
  sub_1B12F6D00();

}

- (BOOL)safeExpandAndReturnError:(id *)a3
{
  APPCMetricsView *v3;

  v3 = self;
  sub_1B12F6D00();

  return 1;
}

- (BOOL)safeCollapseAndReturnError:(id *)a3
{
  -[APPCMetricsView collapse](self, sel_collapse, a3);
  return 1;
}

- (void)willMoveToSuperview:(id)a3
{
  id v5;
  APPCMetricsView *v6;

  v5 = a3;
  v6 = self;
  sub_1B12F7698(a3);

}

- (void)didMoveToSuperview
{
  APPCMetricsView *v2;

  v2 = self;
  sub_1B12F7D20("MetricsView super view changed, the superview is %{private}s. PC Identifier: %{private}s", (SEL *)&selRef_didMoveToSuperview, (SEL *)&selRef_superview);

}

- (void)didMoveToWindow
{
  APPCMetricsView *v2;

  v2 = self;
  sub_1B12F7D20("MetricsView is being moved to a new window, the superview is %{private}s. PC Identifier: %{private}s", (SEL *)&selRef_didMoveToWindow, (SEL *)&selRef_window);

}

- (void)didBecomeVisible
{
  APPCMetricsView *v2;

  v2 = self;
  sub_1B12F8F18();

}

- (APPCMetricsView)initWithFrame:(CGRect)a3
{
  APPCMetricsView *result;

  result = (APPCMetricsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)registerHandlerForAllMetricsWithClosure:(id)a3
{
  void *v4;
  uint64_t v5;
  APPCMetricsView *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  MetricsView.registerHandlerForAllMetrics(closure:)((uint64_t)sub_1B12FDD90, v5);

  swift_release();
}

- (void)removeHandler
{
  void *v2;
  APPCMetricsView *v3;
  id v4;
  void *v5;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___APPCMetricsView_promotedContent);
  v3 = self;
  v4 = objc_msgSend(v2, sel_metricsHelper);
  v5 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v5)
    objc_msgSend(v5, sel_removeHandler);

  swift_unknownObjectRelease();
}

- (void)collapse
{
  APPCMetricsView *v2;

  v2 = self;
  MetricsView.collapse()();

}

@end
