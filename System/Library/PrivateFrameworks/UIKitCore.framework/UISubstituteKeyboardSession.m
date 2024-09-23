@implementation UISubstituteKeyboardSession

- (UISubstituteKeyboardSession)init
{
  return (UISubstituteKeyboardSession *)sub_18571ACB8();
}

+ (UISubstituteKeyboardSession)activeSession
{
  return (UISubstituteKeyboardSession *)(id)qword_1EDD89188;
}

+ (id)sharedSession
{
  swift_getObjCClassMetadata();
  return sub_18571AD64();
}

- (BOOL)isPresented
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___UISubstituteKeyboardSession_presentationController);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, sel_state) == (id)2;
  return (char)v2;
}

- (BOOL)isPresenting
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___UISubstituteKeyboardSession_presentationController);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, sel_state) == (id)1;
  return (char)v2;
}

- (void)showForResponder:(id)a3 sender:(id)a4
{
  id v6;
  UISubstituteKeyboardSession *v7;
  id v8;
  UISubstituteKeyboardSession *v9;
  _OWORD v10[2];

  if (a4)
  {
    v6 = a3;
    v7 = self;
    swift_unknownObjectRetain();
    sub_186507B1C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a3;
    v9 = self;
  }
  sub_185719C28();

  sub_1855BDE94((uint64_t)v10);
}

- (void)hide
{
  UISubstituteKeyboardSession *v2;

  v2 = self;
  sub_185719F84();

}

- (void)hideForResponder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  unsigned __int8 v8;
  UISubstituteKeyboardSession *v9;

  v5 = MEMORY[0x186DCA138]((char *)self + OBJC_IVAR___UISubstituteKeyboardSession_responder, a2);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = a3;
    v9 = self;
    v8 = objc_msgSend(v6, sel_isEqual_, v7);

    if ((v8 & 1) != 0)
      sub_185719F84();

  }
}

- (void)cancel
{
  UISubstituteKeyboardSession *v2;

  v2 = self;
  sub_185719F84();

}

- (void)updateUserInterfaceStyle
{
  UISubstituteKeyboardSession *v2;

  v2 = self;
  sub_18571A368();

}

- (void)firstResponderDidChange:(id)a3
{
  sub_18571B130(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_18571A95C);
}

- (void)keyboardAboutToHide:(id)a3
{
  sub_18571B130(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_18571AA8C);
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  UISubstituteKeyboardSession *v12;
  void *v13;

  v8 = qword_1EDD83C28;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  if (v8 != -1)
    swift_once();
  if (byte_1EDD89180 == 1)
  {
    v13 = *(Class *)((char *)&v12->super.isa + OBJC_IVAR___UISubstituteKeyboardSession_animationController);
    swift_unknownObjectRetain();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  uint64_t v4;
  id v5;
  UISubstituteKeyboardSession *v6;
  void *v7;

  v4 = qword_1EDD83C28;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once();
  if (byte_1EDD89180 == 1)
  {
    v7 = *(Class *)((char *)&v6->super.isa + OBJC_IVAR___UISubstituteKeyboardSession_animationController);
    swift_unknownObjectRetain();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  UISubstituteKeyboardSession *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (id)sub_18571E658((uint64_t)v8, (uint64_t)a4);

  return v12;
}

- (void)dimmingViewWasTapped:(id)a3
{
  id v4;
  UISubstituteKeyboardSession *v5;

  v4 = a3;
  v5 = self;
  sub_185719F84();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  UISubstituteKeyboardSession *v5;

  v4 = a3;
  v5 = self;
  sub_18571B480(v4);

}

@end
