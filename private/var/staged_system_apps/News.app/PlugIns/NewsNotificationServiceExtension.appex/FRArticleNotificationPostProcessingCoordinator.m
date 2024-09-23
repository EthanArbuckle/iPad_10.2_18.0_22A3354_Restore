@implementation FRArticleNotificationPostProcessingCoordinator

- (FRArticleNotificationPostProcessingCoordinator)init
{
  return (FRArticleNotificationPostProcessingCoordinator *)sub_100008668();
}

- (void)notificationArrived:(UNNotificationContent *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  UNNotificationContent *v15;
  FRArticleNotificationPostProcessingCoordinator *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008628(&qword_100029DC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100025148, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100025170, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100029E38;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100025198, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100029E48;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10000A0B0((uint64_t)v9, (uint64_t)&unk_100029E58, (uint64_t)v14);
  swift_release(v17);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___FRArticleNotificationPostProcessingCoordinator_processors));
}

@end
