@implementation CHNotificationConsentController

+ (void)updateAuthorization
{
  id v2;
  void *v3;
  _QWORD v4[6];

  if ((objc_msgSend((id)objc_opt_self(UIApplication), "isRunningInStoreDemoMode") & 1) == 0)
  {
    v2 = objc_msgSend((id)objc_opt_self(UNUserNotificationCenter), "currentNotificationCenter");
    v4[4] = sub_10000E1EC;
    v4[5] = 0;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 1107296256;
    v4[2] = sub_1000064EC;
    v4[3] = &unk_10079FED8;
    v3 = _Block_copy(v4);
    objc_msgSend(v2, "requestAuthorizationWithOptions:completionHandler:", 39, v3);

    _Block_release(v3);
  }
}

+ (id)makeNotificationConsentViewController:(BOOL)a3 buttonHandler:(id)a4
{
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  unsigned int *v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;

  v5 = a3;
  v6 = type metadata accessor for ContentAvailability(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v12 = (char *)&v19 - v11;
  v13 = _Block_copy(a4);
  if (v13)
  {
    v14 = swift_allocObject(&unk_10079FF38, 24, 7);
    *(_QWORD *)(v14 + 16) = v13;
    v13 = sub_100106890;
  }
  else
  {
    v14 = 0;
  }
  v15 = (unsigned int *)&enum case for ContentAvailability.available(_:);
  if (!v5)
    v15 = (unsigned int *)&enum case for ContentAvailability.unavailableStoreFront(_:);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v12, *v15, v6);
  type metadata accessor for NotificationConsentViewController(0);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  v16 = (void *)NotificationConsentViewController.__allocating_init(contentAvailability:)(v9);
  v17 = swift_allocObject(&unk_10079FF10, 32, 7);
  *(_QWORD *)(v17 + 16) = v13;
  *(_QWORD *)(v17 + 24) = v14;
  sub_10003AFE0((uint64_t)v13, v14);
  NotificationConsentViewController.continueButtonHandler.setter(sub_100355F10, v17);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  sub_100022BA4((uint64_t)v13, v14);
  return v16;
}

- (CHNotificationConsentController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NotificationConsentController();
  return -[CHNotificationConsentController init](&v3, "init");
}

@end
