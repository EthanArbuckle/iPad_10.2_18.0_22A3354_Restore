@implementation UIView.InProcessAnimationState

- (_TtCE5UIKitCSo6UIView23InProcessAnimationState)init
{
  char *v2;
  _TtCE5UIKitCSo6UIView23InProcessAnimationState *v3;
  objc_super v5;

  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView23InProcessAnimationState_updateType) = 0;
  v2 = (char *)self + OBJC_IVAR____TtCE5UIKitCSo6UIView23InProcessAnimationState_animationAndComposerGetter;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_QWORD *)v2 + 4) = 0;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView23InProcessAnimationState_isInteractive) = 0;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView23InProcessAnimationState_retargeted) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s23InProcessAnimationStateCMa();
  v3 = -[UIViewAnimationState init](&v5, sel_init);
  -[UIViewAnimationState setDisallowInheritance:](v3, sel_setDisallowInheritance_, 1);
  return v3;
}

- (BOOL)shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtCE5UIKitCSo6UIView23InProcessAnimationState *v8;
  BOOL v9;
  void *v10;
  objc_super v12;

  if (!a3)
    return 0;
  v4 = sub_1865074F8();
  v6 = v5;
  v7 = qword_1EDD830F8;
  v8 = self;
  if (v7 != -1)
    swift_once();
  if ((sub_1856EF6F8(v4, v6, qword_1EDD83100) & 1) != 0)
  {

    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v10 = (void *)sub_1865074D4();
    v12.receiver = v8;
    v12.super_class = (Class)_s23InProcessAnimationStateCMa();
    v9 = -[UIViewAnimationState shouldAnimatePropertyWithKey:](&v12, sel_shouldAnimatePropertyWithKey_, v10);

    swift_bridgeObjectRelease();
  }
  return v9;
}

- (void)setupWithDuration:(double)a3 delay:(double)a4 view:(id)a5 options:(unint64_t)a6 factory:(id)a7 parentState:(id)a8 start:(id)a9 completion:(id)a10
{
  void *v17;
  uint64_t (*v18)(char);
  uint64_t (*v19)(char);
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  _TtCE5UIKitCSo6UIView23InProcessAnimationState *v24;

  v17 = _Block_copy(a9);
  v18 = (uint64_t (*)(char))_Block_copy(a10);
  v19 = v18;
  if (!v17)
  {
    v20 = 0;
    if (v18)
      goto LABEL_3;
LABEL_5:
    v21 = 0;
    goto LABEL_6;
  }
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v17;
  v17 = sub_1855A956C;
  if (!v19)
    goto LABEL_5;
LABEL_3:
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v19;
  v19 = sub_18563AE24;
LABEL_6:
  v22 = a5;
  swift_unknownObjectRetain();
  v23 = a8;
  v24 = self;
  sub_1855EAE9C((uint64_t)a5, a6, (uint64_t)a7, (uint64_t)a8, v17, v20, v19, v21, a3, a4);
  sub_18518D718((uint64_t)v19);
  sub_18518D718((uint64_t)v17);

  swift_unknownObjectRelease();
}

- (id)actionForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtCE5UIKitCSo6UIView23InProcessAnimationState *v13;
  id v14;

  if (a4)
  {
    v8 = sub_1865074F8();
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = a3;
  v12 = a5;
  v13 = self;
  v14 = sub_1855F4C14(a3, v8, v10, a5);

  swift_bridgeObjectRelease();
  return v14;
}

- (BOOL)isInProcess
{
  return 1;
}

- (void).cxx_destruct
{
  sub_18519F088((uint64_t)self + OBJC_IVAR____TtCE5UIKitCSo6UIView23InProcessAnimationState_animationAndComposerGetter, &qword_1ECD74C70);
}

@end
