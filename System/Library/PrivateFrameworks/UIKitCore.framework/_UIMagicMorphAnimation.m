@implementation _UIMagicMorphAnimation

- (UIView)morphContainer
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____UIMagicMorphAnimation_morphView));
}

- (void)morphTo:(id)a3 parameters:(id)a4 completion:(id)a5
{
  uint64_t (*v8)();
  _QWORD *v9;
  id (*v10)();
  id v11;
  _UIMagicMorphAnimation *v12;

  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = v8;
    v8 = sub_1855E0294;
  }
  else
  {
    v9 = 0;
  }
  v10 = (id (*)())a3;
  v11 = a4;
  v12 = self;
  sub_18564B44C(v10, (uint64_t)v11, v8, v9);
  sub_18518D718((uint64_t)v8);

}

- (void)morphTo:(id)a3 reparentWithoutAnimation:(BOOL)a4 completion:(id)a5
{
  uint64_t (*v8)();
  _QWORD *v9;
  id (*v10)();
  _UIMagicMorphAnimation *v11;

  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = v8;
    v8 = sub_1855E0294;
  }
  else
  {
    v9 = 0;
  }
  v10 = (id (*)())a3;
  v11 = self;
  sub_18564D9F4(v10, a4, v8, v9);
  sub_18518D718((uint64_t)v8);

}

- (id)newInteractionAssertion
{
  _UIMagicMorphAnimation *v2;
  id v3;

  v2 = self;
  v3 = sub_18564B398();

  return v3;
}

- (void)cancel
{
  _UIMagicMorphAnimation *v2;

  v2 = self;
  sub_18564B190();

}

- (void)geometryTrackingDisplayLinkDidFire:(id)a3
{
  id v4;
  _UIMagicMorphAnimation *v5;

  v4 = a3;
  v5 = self;
  sub_18564F350();

}

- (void)animateWith:(id)a3 tracking:(BOOL)a4 animations:(id)a5 completion:(id)a6
{
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _UIMagicMorphAnimation *v14;

  v10 = _Block_copy(a5);
  v11 = _Block_copy(a6);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  if (v11)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v11;
    v11 = sub_1855E0294;
  }
  else
  {
    v13 = 0;
  }
  swift_unknownObjectRetain();
  v14 = self;
  sub_18564AF0C(a3, a4, (uint64_t)sub_1855A956C, v12, (uint64_t)v11, v13);
  sub_18518D718((uint64_t)v11);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)performCompletionsAsGroup:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  _UIMagicMorphAnimation *v7;

  v4 = (void (**)(_QWORD))_Block_copy(a3);
  v5 = OBJC_IVAR____UIMagicMorphAnimation_groupCompletion;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIMagicMorphAnimation_groupCompletion);
  v7 = self;
  objc_msgSend(v6, sel_increment);
  v4[2](v4);
  objc_msgSend(*(id *)((char *)&self->super.isa + v5), sel_complete);
  _Block_release(v4);

}

- (_UIMagicMorphAnimation)init
{
  return (_UIMagicMorphAnimation *)sub_18564E5D8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____UIMagicMorphAnimation____lazy_storage___geometryTrackingDisplayLink));

}

@end
