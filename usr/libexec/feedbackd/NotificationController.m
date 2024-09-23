@implementation NotificationController

- (_TtC9feedbackd22NotificationController)init
{
  return (_TtC9feedbackd22NotificationController *)sub_1000225C0();
}

- (void).cxx_destruct
{

}

- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 didReceiveNotificationResponse:(UNNotificationResponse *)a4 withCompletionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  UNUserNotificationCenter *v17;
  UNNotificationResponse *v18;
  _TtC9feedbackd22NotificationController *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100005D4C(&qword_10006FB00);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10006A350, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10006A378, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10006FB10;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10006A3A0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10006FB20;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1000291F8((uint64_t)v11, (uint64_t)&unk_10006FB30, (uint64_t)v16);
  swift_release(v20);
}

@end
