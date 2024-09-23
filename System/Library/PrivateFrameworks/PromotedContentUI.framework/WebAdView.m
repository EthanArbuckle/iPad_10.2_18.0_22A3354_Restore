@implementation WebAdView

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC17PromotedContentUI9WebAdView *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  v15 = (void *)sub_1B130D1C8(v12);

  return v15;
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v6;
  id v7;
  _TtC17PromotedContentUI9WebAdView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s17PromotedContentUI9WebAdViewC03webF0_29didStartProvisionalNavigationySo05WKWebF0C_So12WKNavigationCSgtF_0();

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  _TtC17PromotedContentUI9WebAdView *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_1B131842C((uint64_t)v11, (uint64_t)"[PCUI] promoted content (%{public}@) failed provisional navigation at %{public}.8f", 82);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  _TtC17PromotedContentUI9WebAdView *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_1B131842C((uint64_t)v11, (uint64_t)"[PCUI] promoted content (%{public}@) failed navigation at %{public}.8f", 70);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  id v7;
  _TtC17PromotedContentUI9WebAdView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s17PromotedContentUI9WebAdViewC03webF0_9didFinishySo05WKWebF0C_So12WKNavigationCSgtF_0(v6);

}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  id v4;
  _TtC17PromotedContentUI9WebAdView *v5;

  v4 = a3;
  v5 = self;
  _s17PromotedContentUI9WebAdViewC03webfdB19ProcessDidTerminateyySo05WKWebF0CF_0();

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC17PromotedContentUI9WebAdView *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1B1318F54(v10, v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame
{
  _TtC17PromotedContentUI9WebAdView *v2;

  v2 = self;
  WebAdView.webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame()();

}

- (void)webProcessDiagnosticJSOStatusReported:(id)a3 status:(id)a4
{
  void *v5;
  _TtC17PromotedContentUI9WebAdView *v6;
  id v7;
  void *v8;
  id v9;

  sub_1B1372B98();
  sub_1B1372B98();
  v5 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_promotedContent);
  v6 = self;
  v7 = objc_msgSend(v5, sel_diagnosticMetricHelper);
  v8 = (void *)sub_1B1372B74();
  v9 = (id)sub_1B1372B74();
  objc_msgSend(v7, sel_templateMetricWithName_argument_, v8, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

}

- (void)webProcessMRAIDJSODidCallClose
{
  _TtC17PromotedContentUI9WebAdView *v2;

  v2 = self;
  WebAdView.webProcessMRAIDJSODidCallClose()();

}

- (void)webProcessMRAIDJSODidCallExpand:(id)a3 withMaximumWidth:(double)a4 andHeight:(double)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC17PromotedContentUI9WebAdView *v12;
  uint64_t v13;

  v8 = sub_1B1371DC4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371D94();
  v12 = self;
  WebAdView.webProcessMRAIDJSODidCallExpand(_:withMaximumWidth:andHeight:)((uint64_t)v11, a4, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)webProcessMRAIDJSODidCallCreateCalendarEvent:(id)a3
{
  uint64_t v4;
  _TtC17PromotedContentUI9WebAdView *v5;

  v4 = sub_1B1372B20();
  v5 = self;
  WebAdView.webProcessMRAIDJSODidCallCreateCalendarEvent(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)webProcessMRAIDJSODidCallOpen:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC17PromotedContentUI9WebAdView *v8;
  uint64_t v9;

  v4 = sub_1B1371DC4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371D94();
  v8 = self;
  WebAdView.webProcessMRAIDJSODidCallOpen(_:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)webProcessVideoAdJSOGetVideoInfo:(id)a3
{
  void *v4;
  _TtC17PromotedContentUI9WebAdView *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1B133929C((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)webProcessVideoAdJSOMediaPlaybackFailedWithErrorDescription:(id)a3
{
  void *v4;
  _TtC17PromotedContentUI9WebAdView *v5;
  id v6;
  id v7;

  sub_1B1372B98();
  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_promotedContent);
  v5 = self;
  v6 = objc_msgSend(v4, sel_diagnosticMetricHelper);
  v7 = (id)sub_1B1372B74();
  objc_msgSend(v6, sel_mediaPlaybackFailedWithReason_, v7);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

}

- (void)webProcessVideoAdJSOCreativeViewLoaded
{
  void *v2;
  id v3;
  _TtC17PromotedContentUI9WebAdView *v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_promotedContent);
  v4 = self;
  v3 = objc_msgSend(v2, sel_mediaMetricHelper);
  if (v3)
  {
    objc_msgSend(v3, sel_mediaLoaded);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)webProcessVideoAdJSODidCallPlayStarted:(float)a3 volume:(float)a4
{
  _TtC17PromotedContentUI9WebAdView *v4;

  v4 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoE21JSODidCallPlayStarted_6volumeySf_SftF_0();

}

- (void)webProcessVideoAdJSODidCallPlayResumed:(float)a3 volume:(float)a4
{
  _TtC17PromotedContentUI9WebAdView *v5;

  v5 = self;
  sub_1B1339BF8((SEL *)&selRef_mediaPlayedAtPosition_, a3);

}

- (void)webProcessVideoAdJSODidCallPlayPaused:(float)a3 volume:(float)a4
{
  _TtC17PromotedContentUI9WebAdView *v5;

  v5 = self;
  sub_1B1339BF8((SEL *)&selRef_mediaPausedAtPosition_, a3);

}

- (void)webProcessVideoAdJSODidCallPlayProgressed:(float)a3 volume:(float)a4
{
  _TtC17PromotedContentUI9WebAdView *v5;

  v5 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoE24JSODidCallPlayProgressed_6volumeySf_SftF_0(a3);

}

- (void)webProcessVideoAdJSODidCallPlayCompletedWithVolume:(float)a3
{
  void *v3;
  id v4;
  _TtC17PromotedContentUI9WebAdView *v5;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_promotedContent);
  v5 = self;
  v4 = objc_msgSend(v3, sel_mediaMetricHelper);
  if (v4)
  {
    objc_msgSend(v4, sel_mediaFinished);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)webProcessVideoAdJSODidCallViewabilityChanged:(BOOL)a3 playTime:(float)a4 volume:(float)a5
{
  _TtC17PromotedContentUI9WebAdView *v6;

  v6 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoE28JSODidCallViewabilityChanged_8playTime6volumeySb_S2ftF_0(a3);

}

- (void)webProcessVideoAdJSODidCallVolumeChanged:(float)a3 playTime:(float)a4
{
  _TtC17PromotedContentUI9WebAdView *v5;

  v5 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoE23JSODidCallVolumeChanged_8playTimeySf_SftF_0(a3);

}

- (void)webProcessVideoAdJSODidCallAudioMuted:(float)a3
{
  _TtC17PromotedContentUI9WebAdView *v4;

  v4 = self;
  WebAdView.webProcessVideoAdJSODidCallAudioMuted(_:)(a3);

}

- (void)webProcessVideoAdJSODidCallAudioUnmuted:(float)a3 volume:(float)a4
{
  _TtC17PromotedContentUI9WebAdView *v5;

  v5 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoE22JSODidCallAudioUnmuted_6volumeySf_SftF_0(a3);

}

- (void)webProcessVideoAdJSODidCallMoreInfoTapped:(float)a3 volume:(float)a4
{
  _TtC17PromotedContentUI9WebAdView *v4;

  v4 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoE24JSODidCallMoreInfoTapped_6volumeySf_SftF_0();

}

- (void)webProcessVideoAdJSODidCallVideoTapped:(float)a3 volume:(float)a4
{
  _TtC17PromotedContentUI9WebAdView *v5;

  v5 = self;
  _s17PromotedContentUI9WebAdViewC015webProcessVideoe10JSODidCallI6Tapped_6volumeySf_SftF_0(a3);

}

- (void)webProcessVideoAdJSODidCallSkipAdTapped:(float)a3 volume:(float)a4
{
  _TtC17PromotedContentUI9WebAdView *v5;

  v5 = self;
  sub_1B1339BF8((SEL *)&selRef_mediaSkippedAtPosition_, a3);

}

- (void)webProcessVideoAdJSODidCallFullScreenTapped:(float)a3 volume:(float)a4
{
  _TtC17PromotedContentUI9WebAdView *v5;

  v5 = self;
  sub_1B133AD88((SEL *)&selRef_mediaExpandedAtPosition_fullScreen_, a3);

}

- (void)webProcessVideoAdJSODidCallExitFullScreenTapped:(float)a3 volume:(float)a4
{
  _TtC17PromotedContentUI9WebAdView *v5;

  v5 = self;
  sub_1B133AD88((SEL *)&selRef_mediaContractedAtPosition_fullScreen_, a3);

}

- (void)dealloc
{
  _TtC17PromotedContentUI9WebAdView *v2;

  v2 = self;
  WebAdView.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_unfairLock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_navigationCoordinator));
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
  v6.super_class = (Class)type metadata accessor for WebAdView();
  -[APPCPromotedContentView frame](&v6, sel_frame);
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
  _TtC17PromotedContentUI9WebAdView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1B136464C(x, y, width, height);

}

- (void)sizeCategoryChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC17PromotedContentUI9WebAdView *v8;
  uint64_t v9;

  v4 = sub_1B1371C68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371C5C();
  v8 = self;
  sub_1B1364CB0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
