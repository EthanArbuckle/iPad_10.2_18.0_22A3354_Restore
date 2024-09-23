@implementation TipPreviewView

- (_TtC13TipsQuicklook14TipPreviewView)initWithFrame:(CGRect)a3
{
  return (_TtC13TipsQuicklook14TipPreviewView *)TipPreviewView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13TipsQuicklook14TipPreviewView)initWithCoder:(id)a3
{
  return (_TtC13TipsQuicklook14TipPreviewView *)TipPreviewView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->tipsContentModel[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_currentTipIdentifier]);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_cancellables));
  swift_release(*(_QWORD *)&self->tipsContentModel[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_completionHandler]);
  sub_100004C9C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler), *(_QWORD *)&self->tipsContentModel[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler]);
}

@end
