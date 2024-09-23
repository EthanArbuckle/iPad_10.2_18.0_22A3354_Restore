uint64_t sub_24A631518(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v19;

  v14 = sub_24A6338E8();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A631630(a2, a3);
  sub_24A6338DC();
  sub_24A6318A0(a1, (uint64_t)v17, a4, a5, a6, a7);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_24A631630(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

void sub_24A631848(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_24A6338A0();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

void sub_24A6318A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  objc_class *v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28[2];
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];
  objc_super v32;

  v29 = a5;
  v30 = a6;
  v28[0] = a1;
  v10 = sub_24A6338E8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28[1] = (id)(v6 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_lastPresenter);
  swift_unknownObjectWeakAssign();
  v14 = (uint64_t *)(v6 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  v15 = *(_QWORD *)(v6 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  *v14 = a3;
  v14[1] = a4;
  swift_retain();
  sub_24A631B1C(v15);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v16(v13, a2, v10);
  v17 = (objc_class *)type metadata accessor for WorkoutHostingRemoteViewController();
  v18 = (char *)objc_allocWithZone(v17);
  v19 = (uint64_t *)&v18[OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion];
  *v19 = 0;
  v19[1] = 0;
  *(_QWORD *)&v18[OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_presentedRemoteViewController] = 0;
  v16(&v18[OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_workout], (uint64_t)v13, v10);
  v20 = *v19;
  *v19 = a3;
  v19[1] = a4;
  swift_retain_n();
  sub_24A631B1C(v20);
  v32.receiver = v18;
  v32.super_class = v17;
  v21 = objc_msgSendSuper2(&v32, sel_initWithNibName_bundle_, 0, 0);
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v22 = v28[0];
  v23 = objc_msgSend(v22, sel_presentedViewController);
  if (v23)
  {
    do
    {
      v24 = v23;

      v23 = objc_msgSend(v24, sel_presentedViewController);
      v22 = v24;
    }
    while (v23);
  }
  else
  {
    v24 = v22;
  }
  swift_unknownObjectWeakAssign();
  v25 = swift_allocObject();
  v26 = v30;
  *(_QWORD *)(v25 + 16) = v29;
  *(_QWORD *)(v25 + 24) = v26;
  aBlock[4] = sub_24A631B8C;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A631BB4;
  aBlock[3] = &block_descriptor;
  v27 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v24, sel_presentViewController_animated_completion_, v21, 1, v27);
  _Block_release(v27);

}

uint64_t sub_24A631B1C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for WorkoutHostingRemoteViewController()
{
  uint64_t result;

  result = qword_2579441A8;
  if (!qword_2579441A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24A631B68()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A631B8C()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 16))(1, 0);
}

uint64_t sub_24A631BB4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_24A631BF8(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;

  v2 = objc_msgSend(a1, sel_presentedViewController);
  if (v2)
  {
    v3 = v2;
    type metadata accessor for WorkoutHostingRemoteViewController();
    v4 = (void *)swift_dynamicCastClass();
    if (v4)
      objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

  }
  swift_unknownObjectWeakAssign();
  v5 = (_QWORD *)(v1 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  *v5 = 0;
  v5[1] = 0;
  return sub_24A631B1C(v6);
}

uint64_t sub_24A631CD8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  v1 = (void *)MEMORY[0x24BD158C8](v0 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_lastPresenter);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_presentedViewController);
    if (v3)
    {
      v4 = v3;
      type metadata accessor for WorkoutHostingRemoteViewController();
      v5 = (void *)swift_dynamicCastClass();
      if (v5)
        objc_msgSend(v5, sel_dismissViewControllerAnimated_completion_, 1, 0);

    }
    else
    {
      v4 = v2;
    }

  }
  swift_unknownObjectWeakAssign();
  v6 = (uint64_t *)(v0 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  v7 = *(void (**)(uint64_t))(v0
                                      + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  if (v7)
  {
    v8 = swift_retain();
    v7(v8);
    sub_24A631B1C((uint64_t)v7);
    v9 = *v6;
  }
  else
  {
    v9 = 0;
  }
  *v6 = 0;
  v6[1] = 0;
  return sub_24A631B1C(v9);
}

id WorkoutRemoteViewServiceAdaptor.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id WorkoutRemoteViewServiceAdaptor.init()()
{
  char *v0;
  char *v1;
  objc_class *v2;
  objc_super v4;

  swift_unknownObjectWeakInit();
  v1 = &v0[OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion];
  v2 = (objc_class *)type metadata accessor for WorkoutRemoteViewServiceAdaptor();
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  v4.receiver = v0;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for WorkoutRemoteViewServiceAdaptor()
{
  return objc_opt_self();
}

id WorkoutRemoteViewServiceAdaptor.__deallocating_deinit(uint64_t a1)
{
  return sub_24A632AAC(a1, type metadata accessor for WorkoutRemoteViewServiceAdaptor);
}

uint64_t method lookup function for WorkoutRemoteViewServiceAdaptor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WorkoutRemoteViewServiceAdaptor.presentRemoteViewController(on:with:dismissCompletion:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of WorkoutRemoteViewServiceAdaptor.dismissRemoteViewController(on:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

id sub_24A632018()
{
  void *v0;
  void *v1;
  id v2;
  id result;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  objc_super v24;

  v1 = v0;
  v24.receiver = v0;
  v24.super_class = (Class)type metadata accessor for WorkoutHostingRemoteViewController();
  objc_msgSendSuper2(&v24, sel_viewDidLoad);
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD398]), sel_init);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  result = objc_msgSend(v0, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  v4 = result;
  objc_msgSend(result, sel_addSubview_, v2);

  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v5 = result;
  v6 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
  objc_msgSend(v5, sel_setBackgroundColor_, v6);

  objc_msgSend(v2, sel_startAnimating);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579441B8);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_24A633DA0;
  v8 = objc_msgSend(v2, sel_centerXAnchor);
  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v9 = result;
  v10 = objc_msgSend(result, sel_centerXAnchor);

  v11 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v10);
  *(_QWORD *)(v7 + 32) = v11;
  v12 = objc_msgSend(v2, sel_centerYAnchor);
  result = objc_msgSend(v1, sel_view);
  if (result)
  {
    v13 = result;
    v14 = (void *)objc_opt_self();
    v15 = objc_msgSend(v13, sel_centerYAnchor);

    v16 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v15);
    *(_QWORD *)(v7 + 40) = v16;
    sub_24A633918();
    sub_24A632C08();
    v17 = (void *)sub_24A63390C();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_activateConstraints_, v17);

    type metadata accessor for WorkoutRemoteViewController();
    v18 = (uint64_t)v1 + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_workout;
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = v1;
    v20 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = v20;
    *(_QWORD *)(v21 + 24) = v2;
    v22 = v1;
    swift_retain();
    v23 = v2;
    sub_24A632DE0(v18, (uint64_t)sub_24A632C44, v19, (uint64_t)sub_24A632C9C, v21);

    swift_release();
    swift_release();
    return (id)swift_release();
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_24A632390(uint64_t result)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(result
                                      + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion);
  if (v1)
  {
    v2 = swift_retain();
    v1(v2);
    return sub_24A631B1C((uint64_t)v1);
  }
  return result;
}

void sub_24A6323E0(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (*v14)(void);
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t aBlock;
  uint64_t v57;
  void *v58;
  void *v59;
  id (*v60)();
  uint64_t v61;

  v7 = a3 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x24BD158C8](v7);
  if (v8)
  {
    v9 = (char *)v8;
    if (a2 || !a1)
    {
      v10 = *(void (**)(uint64_t))(v8
                                           + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion);
      if (!v10)
      {
LABEL_6:

        return;
      }
      v11 = swift_retain();
      v10(v11);
    }
    else
    {
      v15 = a1;
      v16 = objc_msgSend(v15, sel_view);
      if (v16)
      {
        v17 = v16;
        v18 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
        v19 = objc_msgSend(v18, sel_userInterfaceIdiom);

        if (v19 == (id)1)
        {
          objc_msgSend(v15, sel_setModalPresentationStyle_, 2);
          objc_msgSend(v15, sel_setPreferredContentSize_, 0.0, 0.0);
        }
        objc_msgSend(v9, sel_addChildViewController_, v15);
        objc_msgSend(v17, sel_setAlpha_, 0.0);
        objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        v20 = objc_msgSend(v9, sel_view);
        if (v20)
        {
          v21 = v20;
          objc_msgSend(v20, sel_addSubview_, v17);

          __swift_instantiateConcreteTypeFromMangledName(&qword_2579441B8);
          v22 = swift_allocObject();
          *(_OWORD *)(v22 + 16) = xmmword_24A633DB0;
          v23 = objc_msgSend(v17, sel_leadingAnchor);
          v24 = objc_msgSend(v9, sel_view);
          if (v24)
          {
            v25 = v24;
            v26 = objc_msgSend(v24, sel_leadingAnchor);

            v27 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v26);
            *(_QWORD *)(v22 + 32) = v27;
            v28 = objc_msgSend(v17, sel_trailingAnchor);
            v29 = objc_msgSend(v9, sel_view);
            if (v29)
            {
              v30 = v29;
              v31 = objc_msgSend(v29, sel_trailingAnchor);

              v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);
              *(_QWORD *)(v22 + 40) = v32;
              v33 = objc_msgSend(v17, sel_topAnchor);
              v34 = objc_msgSend(v9, sel_view);
              if (v34)
              {
                v35 = v34;
                v36 = objc_msgSend(v34, sel_topAnchor);

                v37 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v36);
                *(_QWORD *)(v22 + 48) = v37;
                v38 = objc_msgSend(v17, sel_bottomAnchor);
                v39 = objc_msgSend(v9, sel_view);
                if (v39)
                {
                  v40 = v39;
                  v41 = (void *)objc_opt_self();
                  v42 = objc_msgSend(v40, sel_bottomAnchor);

                  v43 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v42);
                  *(_QWORD *)(v22 + 56) = v43;
                  sub_24A633918();
                  sub_24A632C08();
                  v44 = (void *)sub_24A63390C();
                  swift_bridgeObjectRelease();
                  objc_msgSend(v41, sel_activateConstraints_, v44);

                  objc_msgSend(v15, sel_didMoveToParentViewController_, v9);
                  v45 = (void *)objc_opt_self();
                  v46 = swift_allocObject();
                  *(_QWORD *)(v46 + 16) = v17;
                  *(_QWORD *)(v46 + 24) = a4;
                  v60 = sub_24A632CE0;
                  v61 = v46;
                  v47 = MEMORY[0x24BDAC760];
                  aBlock = MEMORY[0x24BDAC760];
                  v57 = 1107296256;
                  v58 = sub_24A631BB4;
                  v59 = &block_descriptor_15;
                  v48 = _Block_copy(&aBlock);
                  v49 = v17;
                  v50 = a4;
                  swift_release();
                  v51 = swift_allocObject();
                  *(_QWORD *)(v51 + 16) = v50;
                  v60 = sub_24A632D3C;
                  v61 = v51;
                  aBlock = v47;
                  v57 = 1107296256;
                  v58 = sub_24A6329FC;
                  v59 = &block_descriptor_21;
                  v52 = _Block_copy(&aBlock);
                  v53 = v50;
                  swift_release();
                  objc_msgSend(v45, sel_animateWithDuration_animations_completion_, v48, v52, 0.2);
                  _Block_release(v52);
                  _Block_release(v48);
                  v54 = *(void **)&v9[OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_presentedRemoteViewController];
                  *(_QWORD *)&v9[OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_presentedRemoteViewController] = a1;

                  return;
                }
LABEL_28:
                __break(1u);
                return;
              }
LABEL_27:
              __break(1u);
              goto LABEL_28;
            }
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_26;
      }
      v10 = *(void (**)(uint64_t))&v9[OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion];
      if (!v10)
      {

        return;
      }
      v55 = swift_retain();
      v10(v55);

    }
    sub_24A631B1C((uint64_t)v10);
    goto LABEL_6;
  }
  swift_beginAccess();
  v12 = MEMORY[0x24BD158C8](v7);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = *(void (**)(void))(v12 + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion);
    sub_24A632CA4((uint64_t)v14);

    if (v14)
    {
      v14();
      sub_24A631B1C((uint64_t)v14);
    }
  }
}

uint64_t sub_24A6329FC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_24A632A9C()
{
  return sub_24A632AAC(0, type metadata accessor for WorkoutHostingRemoteViewController);
}

id sub_24A632AAC(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_24A632B40()
{
  return type metadata accessor for WorkoutHostingRemoteViewController();
}

uint64_t sub_24A632B48()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24A6338E8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD15850]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_24A632C08()
{
  unint64_t result;

  result = qword_2579441C0;
  if (!qword_2579441C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2579441C0);
  }
  return result;
}

uint64_t sub_24A632C44()
{
  uint64_t v0;

  return sub_24A632390(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24A632C4C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_24A632C70()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_24A632C9C(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_24A6323E0(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_24A632CA4(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_24A632CB4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_24A632CE0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 24);
  objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, 1.0);
  return objc_msgSend(v1, sel_setAlpha_, 0.0);
}

uint64_t sub_24A632D18()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_24A632D3C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_removeFromSuperview);
}

uint64_t sub_24A632D4C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_24A632D70()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_24A632D7C(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_24A631848(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_24A632D84(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

void sub_24A632DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id ObjCClassFromMetadata;
  _QWORD aBlock[6];

  v19 = a4;
  v20 = a2;
  v8 = sub_24A6338E8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8]();
  ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  v11 = (void *)sub_24A6338F4();
  v12 = (void *)sub_24A6338F4();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v19;
  *(_QWORD *)(v14 + 24) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v13, (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v15 = (_QWORD *)(v14 + ((v10 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v15 = v20;
  v15[1] = a3;
  aBlock[4] = sub_24A633690;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A63339C;
  aBlock[3] = &block_descriptor_0;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  v17 = objc_msgSend(ObjCClassFromMetadata, sel_requestViewController_fromServiceWithBundleIdentifier_connectionHandler_, v11, v12, v16);
  _Block_release(v16);

}

uint64_t sub_24A632FC0()
{
  return 1;
}

uint64_t sub_24A632FC8()
{
  sub_24A633960();
  sub_24A63396C();
  return sub_24A633978();
}

uint64_t sub_24A633008()
{
  return sub_24A63396C();
}

uint64_t sub_24A63302C()
{
  sub_24A633960();
  sub_24A63396C();
  return sub_24A633978();
}

id sub_24A633090(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, *a3);
}

void sub_24A633154(void *a1, void *a2, void (*a3)(char *, void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  char *v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  id v31;

  v12 = sub_24A6338D0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v16 = a2;
    a3(0, a2);

  }
  else if (a1 && (type metadata accessor for WorkoutRemoteViewController(), (v17 = swift_dynamicCastClass()) != 0))
  {
    v18 = (char *)v17;
    (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDFB698], v12);
    v31 = a1;
    v19 = sub_24A6338C4();
    v29 = v21;
    v30 = v19;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v22 = WorkoutRemoteViewServiceInterfaceFunc(objc_msgSend(v18, sel_serviceViewControllerProxy));
    swift_unknownObjectRelease();
    v24 = v29;
    v23 = v30;
    if (v22)
    {
      v25 = (void *)sub_24A6338AC();
      objc_msgSend(v22, sel_presentWorkoutDataRepresentation_, v25);

      swift_unknownObjectRelease();
    }
    v26 = &v18[OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler];
    v27 = *(_QWORD *)&v18[OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler];
    *(_QWORD *)v26 = a6;
    *((_QWORD *)v26 + 1) = a7;
    swift_retain();
    sub_24A631B1C(v27);
    v28 = v31;
    a3(v18, 0);
    sub_24A632D84(v23, v24);

  }
  else
  {
    sub_24A633710();
    v20 = (void *)swift_allocError();
    a3(0, v20);

  }
}

void sub_24A63339C(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

id sub_24A633528()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorkoutRemoteViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WorkoutRemoteViewController()
{
  return objc_opt_self();
}

uint64_t sub_24A6335FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_24A6338E8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

void sub_24A633690(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;

  v5 = *(_QWORD *)(sub_24A6338E8() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (uint64_t *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_24A633154(a1, a2, *(void (**)(char *, void *))(v2 + 16), *(_QWORD *)(v2 + 24), v2 + v6, *v7, v7[1]);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_24A633710()
{
  unint64_t result;

  result = qword_2579442C0;
  if (!qword_2579442C0)
  {
    result = MEMORY[0x24BD1585C](&unk_24A633F20, &type metadata for WorkoutRemoteViewError);
    atomic_store(result, (unint64_t *)&qword_2579442C0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WorkoutRemoteViewError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for WorkoutRemoteViewError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_24A6337F0 + 4 * byte_24A633E60[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24A633810 + 4 * byte_24A633E65[v4]))();
}

_BYTE *sub_24A6337F0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24A633810(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24A633818(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24A633820(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24A633828(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24A633830(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_24A63383C()
{
  return 0;
}

ValueMetadata *type metadata accessor for WorkoutRemoteViewError()
{
  return &type metadata for WorkoutRemoteViewError;
}

unint64_t sub_24A63385C()
{
  unint64_t result;

  result = qword_2579442C8;
  if (!qword_2579442C8)
  {
    result = MEMORY[0x24BD1585C](&unk_24A633EF8, &type metadata for WorkoutRemoteViewError);
    atomic_store(result, (unint64_t *)&qword_2579442C8);
  }
  return result;
}

uint64_t sub_24A6338A0()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_24A6338AC()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_24A6338B8()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_24A6338C4()
{
  return MEMORY[0x24BDFB690]();
}

uint64_t sub_24A6338D0()
{
  return MEMORY[0x24BDFB6A0]();
}

uint64_t sub_24A6338DC()
{
  return MEMORY[0x24BDFB6B8]();
}

uint64_t sub_24A6338E8()
{
  return MEMORY[0x24BDFB700]();
}

uint64_t sub_24A6338F4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24A633900()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24A63390C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_24A633918()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24A633924()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24A633930()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24A63393C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24A633948()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24A633954()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24A633960()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24A63396C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24A633978()
{
  return MEMORY[0x24BEE4328]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

