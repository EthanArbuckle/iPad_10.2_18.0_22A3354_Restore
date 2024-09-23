@implementation GestureController

- (void)didDetectedWithHeadGesture:(id)a3
{
  id v4;
  _TtC17SiriGestureBridge17GestureController *v5;

  v4 = a3;
  v5 = self;
  sub_24636B280();

}

- (void)didDetectedError
{
  _TtC17SiriGestureBridge17GestureController *v2;

  v2 = self;
  sub_24636C344();

}

- (void)didStartStreamingWithIsStreaming:(BOOL)a3
{
  _TtC17SiriGestureBridge17GestureController *v4;

  v4 = self;
  sub_24636C3B8(a3);

}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  int v5;
  int v6;
  id v8;
  _TtC17SiriGestureBridge17GestureController *v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = self;
  sub_24636FF1C((uint64_t)v9, v6, v5);

}

- (_TtC17SiriGestureBridge17GestureController)init
{
  sub_246371F70();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_123(OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue);
  sub_246372774((uint64_t)self + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionState, (uint64_t *)&unk_2544203C8);
  sub_246372774((uint64_t)self + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_gestureMapping, &qword_25756D7B0);
  sub_246372728((uint64_t)self + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_delegate);
  OUTLINED_FUNCTION_123(OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserver);
  sub_24637274C((uint64_t)self + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureDeduper, type metadata accessor for EventDeduper);
  OUTLINED_FUNCTION_123(OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager);
  sub_246372774((uint64_t)self + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastPromptInfo, (uint64_t *)&unk_2544200E0);
  OUTLINED_FUNCTION_123(OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserverQueue);
  sub_246372774((uint64_t)self + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastActionEventId, &qword_2544203B0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_requestContextData));
}

@end
