@implementation BKCloseBookAnimator

- (UIImage)coverImage
{
  id v2;

  if (self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_crossFadeContent + 8])
    v2 = 0;
  else
    v2 = *(id *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent);
  return (UIImage *)v2;
}

- (void)setCoverImage:(id)a3
{
  char *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;

  if (a3)
  {
    v3 = (char *)self + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent;
    v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent);
    v5 = *(_QWORD *)&self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_crossFadeContent];
    *(_QWORD *)v3 = a3;
    *((_QWORD *)v3 + 1) = 0;
    v6 = v3[16];
    v3[16] = 0;
    v7 = a3;
    sub_1003C3308(v4, v5, v6);
  }
}

- (id)spreadSnapshot
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent);
  if (self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_crossFadeContent + 8] != 1)
    return 0;
  v3 = v2[1];
  v7[4] = *v2;
  v8 = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_1003C3520;
  v7[3] = &unk_100902558;
  v4 = _Block_copy(v7);
  v5 = v8;
  swift_retain(v3);
  swift_release(v5);
  return v4;
}

- (void)setSpreadSnapshot:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  char v10;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_100902518, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = (char *)self + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent;
    v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent);
    v8 = *(_QWORD *)&self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_crossFadeContent];
    *(_QWORD *)v7 = sub_1003C5730;
    *((_QWORD *)v7 + 1) = v6;
    v10 = v7[16];
    v7[16] = 1;
    sub_1003C3308(v9, v8, v10);
  }
}

- (id)animationComplete
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD aBlock[5];
  uint64_t v8;
  _BYTE v9[24];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_animationComplete);
  swift_beginAccess((char *)self + OBJC_IVAR___BKCloseBookAnimator_animationComplete, v9, 0, 0);
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  v8 = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000147F0;
  aBlock[3] = &unk_1009024E0;
  v4 = _Block_copy(aBlock);
  v5 = v8;
  swift_retain(v3);
  swift_release(v5);
  return v4;
}

- (void)setAnimationComplete:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_1009024C8, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_10004DE24;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKCloseBookAnimator_animationComplete);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10002AD00(v7, v8);
}

- (BKCloseBookAnimator)initWithContentHelper:(id)a3 coverSource:(id)a4
{
  char *v6;
  _QWORD *v7;
  objc_super v9;

  v6 = (char *)self + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent;
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 2;
  v7 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_animationComplete);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_contentHelper) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_coverSource) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CloseBookAnimator();
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  return -[BKCloseBookAnimator init](&v9, "init");
}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  BKCloseBookAnimator *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  CloseBookAnimator.animateTransition(using:)(a3);
  swift_unknownObjectRelease(a3);

}

- (BKCloseBookAnimator)init
{
  BKCloseBookAnimator *result;

  result = (BKCloseBookAnimator *)_swift_stdlib_reportUnimplementedInitializer("Books.CloseBookAnimator", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1003C3308(*(void **)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent), *(_QWORD *)&self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_crossFadeContent], self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_crossFadeContent + 8]);
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_animationComplete), *(_QWORD *)&self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_animationComplete]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_contentHelper));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_coverSource));
}

@end
