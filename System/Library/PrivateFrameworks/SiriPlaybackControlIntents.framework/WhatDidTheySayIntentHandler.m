@implementation WhatDidTheySayIntentHandler

- (_TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler)init
{
  _TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler *result;

  WhatDidTheySayIntentHandler.init()();
  return result;
}

- (void)resolveDeviceForWhatDidTheySay:(id)a3 withCompletion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_224924638);
}

- (void)handleWhatDidTheySay:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_22492581C((uint64_t)v8, (uint64_t)sub_22481A9E4, v7);

  swift_release();
}

- (void)confirmWhatDidTheySay:(id)a3 completion:(id)a4
{
  sub_2248129F4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2249270BC);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler_playbackController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler_analyticsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler_deviceState);
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26SiriPlaybackControlIntents27WhatDidTheySayIntentHandler_assertion));
}

@end
