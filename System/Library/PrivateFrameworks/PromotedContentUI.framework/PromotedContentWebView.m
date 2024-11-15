@implementation PromotedContentWebView

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PromotedContentWebView();
  -[PromotedContentWebView frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  _TtC17PromotedContentUI22PromotedContentWebView *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  objc_super v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for PromotedContentWebView();
  v19.receiver = self;
  v19.super_class = v8;
  v9 = self;
  -[PromotedContentWebView frame](&v19, sel_frame);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18.receiver = v9;
  v18.super_class = v8;
  -[PromotedContentWebView setFrame:](&v18, sel_setFrame_, x, y, width, height);
  sub_1B13669A0(v11, v13, v15, v17);

}

- (void)didMoveToSuperview
{
  _TtC17PromotedContentUI22PromotedContentWebView *v2;

  v2 = self;
  sub_1B1366B50();

}

- (_TtC17PromotedContentUI22PromotedContentWebView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B1368168();
}

- (void)dealloc
{
  _TtC17PromotedContentUI22PromotedContentWebView *v2;
  void *v3;
  objc_super v4;

  v2 = self;
  sub_1B1372D84();
  sub_1B12CE6BC();
  v3 = (void *)sub_1B1372F70();
  sub_1B1372988();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for PromotedContentWebView();
  -[PromotedContentWebView dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1B12DB4F4((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate);
  swift_unknownObjectRelease();
  sub_1B1309A88((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_remoteObjectInterface);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock));
}

- (_TtC17PromotedContentUI22PromotedContentWebView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  id v4;
  _TtC17PromotedContentUI22PromotedContentWebView *result;

  v4 = a4;
  result = (_TtC17PromotedContentUI22PromotedContentWebView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)webProcessPlugInDidCreateBrowserContextController
{
  _TtC17PromotedContentUI22PromotedContentWebView *v2;

  v2 = self;
  sub_1B13673C4();

}

- (void)webProcessPlugInWillDestroyBrowserContextController
{
  _TtC17PromotedContentUI22PromotedContentWebView *v2;

  v2 = self;
  sub_1B1367558();

}

- (void)webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame
{
  sub_1B1367D9C(self, (uint64_t)a2, (SEL *)&selRef_webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame);
}

- (void)webProcessMRAIDJSODidCallClose
{
  sub_1B1367D9C(self, (uint64_t)a2, (SEL *)&selRef_webProcessMRAIDJSODidCallClose);
}

- (void)webProcessDiagnosticJSOStatusReported:(id)a3 status:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _TtC17PromotedContentUI22PromotedContentWebView *v9;

  sub_1B1372B98();
  sub_1B1372B98();
  v9 = self;
  v5 = (void *)sub_1B1366784();
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, sel_respondsToSelector_, sel_webProcessDiagnosticJSOStatusReported_status_) & 1) != 0)
    {
      v7 = (void *)sub_1B1372B74();
      v8 = (void *)sub_1B1372B74();
      objc_msgSend(v6, sel_webProcessDiagnosticJSOStatusReported_status_, v7, v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();

    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

}

- (void)webProcessMRAIDJSODidCallExpand:(id)a3 withMaximumWidth:(double)a4 andHeight:(double)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC17PromotedContentUI22PromotedContentWebView *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v8 = sub_1B1371DC4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371D94();
  v12 = self;
  v13 = (void *)sub_1B1366784();
  if (v13)
  {
    v14 = v13;
    if ((objc_msgSend(v13, sel_respondsToSelector_, sel_webProcessMRAIDJSODidCallExpand_withMaximumWidth_andHeight_) & 1) != 0)
    {
      v15 = (void *)sub_1B1371D88();
      objc_msgSend(v14, sel_webProcessMRAIDJSODidCallExpand_withMaximumWidth_andHeight_, v15, a4, a5);

      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
    }
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)webProcessMRAIDJSODidCallCreateCalendarEvent:(id)a3
{
  _TtC17PromotedContentUI22PromotedContentWebView *v4;
  void *v5;
  void *v6;
  id v7;

  sub_1B1372B20();
  v4 = self;
  v5 = (void *)sub_1B1366784();
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, sel_respondsToSelector_, sel_webProcessMRAIDJSODidCallCreateCalendarEvent_) & 1) != 0)
    {
      v7 = (id)sub_1B1372B08();
      objc_msgSend(v6, sel_webProcessMRAIDJSODidCallCreateCalendarEvent_, v7);

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();

    }
    else
    {

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)webProcessMRAIDJSODidCallOpen:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC17PromotedContentUI22PromotedContentWebView *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = sub_1B1371DC4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371D94();
  v8 = self;
  v9 = (void *)sub_1B1366784();
  if (v9)
  {
    v10 = v9;
    if ((objc_msgSend(v9, sel_respondsToSelector_, sel_webProcessMRAIDJSODidCallOpen_) & 1) != 0)
    {
      v11 = (void *)sub_1B1371D88();
      objc_msgSend(v10, sel_webProcessMRAIDJSODidCallOpen_, v11);

      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
    }
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)webProcessVideoAdJSOGetVideoInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC17PromotedContentUI22PromotedContentWebView *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = (void *)sub_1B1366784();
  if (v7)
  {
    v8 = v7;
    if ((objc_msgSend(v7, sel_respondsToSelector_, sel_webProcessVideoAdJSOGetVideoInfo_) & 1) != 0)
    {
      v10[4] = sub_1B13680D0;
      v10[5] = v5;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 1107296256;
      v10[2] = sub_1B1367B84;
      v10[3] = &unk_1E62F9988;
      v9 = _Block_copy(v10);
      swift_retain();
      objc_msgSend(v8, sel_webProcessVideoAdJSOGetVideoInfo_, v9);
      _Block_release(v9);

      swift_release();
      swift_unknownObjectRelease();
      swift_release();
    }
    else
    {

      swift_release();
      swift_unknownObjectRelease();
    }
  }
  else
  {

    swift_release();
  }
}

- (void)webProcessVideoAdJSOCreativeViewLoaded
{
  sub_1B1367D9C(self, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSOCreativeViewLoaded);
}

- (void)webProcessVideoAdJSODidCallPlayStarted:(float)a3 volume:(float)a4
{
  sub_1B1368008(self, a3, a4, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallPlayStarted_volume_);
}

- (void)webProcessVideoAdJSODidCallPlayResumed:(float)a3 volume:(float)a4
{
  sub_1B1368008(self, a3, a4, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallPlayResumed_volume_);
}

- (void)webProcessVideoAdJSODidCallPlayPaused:(float)a3 volume:(float)a4
{
  sub_1B1368008(self, a3, a4, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallPlayPaused_volume_);
}

- (void)webProcessVideoAdJSODidCallPlayProgressed:(float)a3 volume:(float)a4
{
  sub_1B1368008(self, a3, a4, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallPlayProgressed_volume_);
}

- (void)webProcessVideoAdJSODidCallPlayCompletedWithVolume:(float)a3
{
  sub_1B1367F24(self, a3, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallPlayCompletedWithVolume_);
}

- (void)webProcessVideoAdJSODidCallViewabilityChanged:(BOOL)a3 playTime:(float)a4 volume:(float)a5
{
  _BOOL8 v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _TtC17PromotedContentUI22PromotedContentWebView *v12;

  v7 = a3;
  v12 = self;
  v8 = (void *)sub_1B1366784();
  if (v8)
  {
    v9 = v8;
    if ((objc_msgSend(v8, sel_respondsToSelector_, sel_webProcessVideoAdJSODidCallViewabilityChanged_playTime_volume_) & 1) != 0)
    {
      *(float *)&v10 = a4;
      *(float *)&v11 = a5;
      objc_msgSend(v9, sel_webProcessVideoAdJSODidCallViewabilityChanged_playTime_volume_, v7, v10, v11);
    }

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)webProcessVideoAdJSODidCallVolumeChanged:(float)a3 playTime:(float)a4
{
  sub_1B1368008(self, a3, a4, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallVolumeChanged_playTime_);
}

- (void)webProcessVideoAdJSODidCallAudioMuted:(float)a3
{
  sub_1B1367F24(self, a3, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallAudioMuted_);
}

- (void)webProcessVideoAdJSODidCallAudioUnmuted:(float)a3 volume:(float)a4
{
  sub_1B1368008(self, a3, a4, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallAudioUnmuted_volume_);
}

- (void)webProcessVideoAdJSODidCallMoreInfoTapped:(float)a3 volume:(float)a4
{
  sub_1B1368008(self, a3, a4, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallMoreInfoTapped_volume_);
}

- (void)webProcessVideoAdJSODidCallVideoTapped:(float)a3 volume:(float)a4
{
  sub_1B1368008(self, a3, a4, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallVideoTapped_volume_);
}

- (void)webProcessVideoAdJSODidCallSkipAdTapped:(float)a3 volume:(float)a4
{
  sub_1B1368008(self, a3, a4, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallSkipAdTapped_volume_);
}

- (void)webProcessVideoAdJSODidCallFullScreenTapped:(float)a3 volume:(float)a4
{
  sub_1B1368008(self, a3, a4, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallFullScreenTapped_volume_);
}

- (void)webProcessVideoAdJSODidCallExitFullScreenTapped:(float)a3 volume:(float)a4
{
  sub_1B1368008(self, a3, a4, (uint64_t)a2, (SEL *)&selRef_webProcessVideoAdJSODidCallExitFullScreenTapped_volume_);
}

@end
