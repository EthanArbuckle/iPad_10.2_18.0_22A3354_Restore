@implementation BEDragDismissGestureManager

- (BEDragDismissGestureDelegate)delegate
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR___BEDragDismissGestureManager_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR___BEDragDismissGestureManager_delegate, v4, 0, 0);
  return (BEDragDismissGestureDelegate *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setDelegate:(id)a3
{
  char *v4;
  _BYTE v5[24];

  v4 = (char *)self + OBJC_IVAR___BEDragDismissGestureManager_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR___BEDragDismissGestureManager_delegate, v5, 1, 0);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (UISwipeGestureRecognizer)swipeGesture
{
  return (UISwipeGestureRecognizer *)sub_17A074((char *)self, (uint64_t)a2, (SEL *)&selRef_enableSwipeToDismiss, (uint64_t (*)(void))sub_179EFC);
}

- (UIPanGestureRecognizer)panGesture
{
  return (UIPanGestureRecognizer *)sub_17A074((char *)self, (uint64_t)a2, (SEL *)&selRef_enablePullToDismiss, (uint64_t (*)(void))sub_179FB8);
}

- (BEDragDismissGestureManager)init
{
  char *v3;
  objc_super v5;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___BEDragDismissGestureManager_delegate, 0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BEDragDismissGestureManager____lazy_storage____swipeGesture) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BEDragDismissGestureManager____lazy_storage____panGesture) = 0;
  v3 = (char *)self + OBJC_IVAR___BEDragDismissGestureManager_closePanningTranslation;
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DragDismissGestureManager();
  return -[BEDragDismissGestureManager init](&v5, "init");
}

- (void).cxx_destruct
{
  sub_47418((uint64_t)self + OBJC_IVAR___BEDragDismissGestureManager_delegate);

}

- (void)swipeToDismiss:(id)a3
{
  id v4;
  BEDragDismissGestureManager *v5;

  v4 = a3;
  v5 = self;
  sub_17A348(v4);

}

- (void)dragToDismiss:(id)a3
{
  id v4;
  BEDragDismissGestureManager *v5;

  v4 = a3;
  v5 = self;
  sub_17A45C(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v6;
  id v7;
  BEDragDismissGestureManager *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = _s8BookEPUB25DragDismissGestureManagerC17gestureRecognizer_13shouldReceiveSbSo09UIGestureH0C_So7UIEventCtF_0(v6);

  return v9 & 1;
}

@end
