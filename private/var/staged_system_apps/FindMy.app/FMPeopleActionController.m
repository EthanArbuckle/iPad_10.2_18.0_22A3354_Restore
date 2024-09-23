@implementation FMPeopleActionController

- (void)dismissPresentedVCWithSender:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  swift_retain(self);
  _bridgeAnyObjectToAny(_:)(v9, a3);
  swift_unknownObjectRelease(a3);
  v5 = *(void **)self->presentedModalViewController;
  if (v5)
  {
    v8[4] = State.rawValue.getter;
    v8[5] = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_100037DF8;
    v8[3] = &unk_100544DB0;
    v6 = _Block_copy(v8);
    v7 = v5;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v6);
    _Block_release(v6);
    swift_release(self);

  }
  else
  {
    swift_release(self);
  }
  sub_100029574(v9);
}

@end
