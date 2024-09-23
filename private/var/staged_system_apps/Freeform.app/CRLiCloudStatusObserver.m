@implementation CRLiCloudStatusObserver

+ (void)qa_resetConnectICloudDialog:(id)a3
{
  uint64_t v4;
  id v5;
  NSString v6;
  _OWORD v7[2];

  if (a3)
  {
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7, v4);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  v5 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  sub_1004CB800((uint64_t)v7, &qword_1013E0230);
}

@end
