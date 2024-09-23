@implementation XpcSubscriptionClientProtocolServer

- (void)request:(id)a3 withReply:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = qword_25539D198;
  v8 = a3;
  swift_retain();
  if (v7 != -1)
    swift_once();
  v9 = sub_21DB968C0();
  __swift_project_value_buffer(v9, (uint64_t)qword_2553A16E8);
  sub_21DB96884();
  v10 = (uint64_t)v8 + *MEMORY[0x24BEC74C0];
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_21DB93430;
  *(_QWORD *)(v11 + 24) = v6;
  swift_retain();
  XpcSubscriptionClientProtocolServer.request(_:withReply:)(v10, (uint64_t)sub_21DB940E4, v11);

  swift_release();
  swift_release();
  swift_release();
}

@end
