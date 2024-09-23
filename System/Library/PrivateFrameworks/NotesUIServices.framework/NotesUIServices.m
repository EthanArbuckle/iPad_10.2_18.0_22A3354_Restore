unint64_t sub_24314B7B0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257287860);
  v2 = sub_243157C90();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_24314C1F0(v6, (uint64_t)v15, &qword_257287868);
    result = sub_24314BA64((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_24314C234(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

ICNotesSharedIndexedViewHelper __swiftcall ICNotesSharedIndexedViewHelper.init()()
{
  return (ICNotesSharedIndexedViewHelper)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id ICNotesSharedIndexedViewHelper.init()()
{
  objc_super v1;

  v1.super_class = (Class)ICNotesSharedIndexedViewHelper;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t sub_24314BA64(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_243157C54();
  return sub_24314BA94(a1, v2);
}

unint64_t sub_24314BA94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_24314C244(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2494F3A84](v9, a1);
      sub_24314C280((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

id _sSo30ICNotesSharedIndexedViewHelperC15NotesUIServicesE020makeNoteSearchResultD04with13attachmentURLSo28CSSearchableItemAttributeSetCSgSo017ICSearchIndexableI0_p_10Foundation0N0VSgtFZ_0(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  id v26;
  char *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char *v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v38 = a2;
  v3 = sub_243157738();
  v39 = *(_QWORD *)(v3 - 8);
  v40 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_2543BD0C0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD038);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v38 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v38 - v14;
  sub_24314B7B0(MEMORY[0x24BEE4AF8]);
  v16 = objc_allocWithZone(MEMORY[0x24BDC2480]);
  v17 = (void *)sub_243157BB8();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend(v16, sel_initWithAttributes_, v17);

  v19 = (void *)objc_opt_self();
  v20 = objc_msgSend((id)objc_opt_self(), sel_noteSortTypeDefaultAscending);
  v21 = objc_msgSend(v19, sel_dateForCurrentSortTypeForNote_folderNoteSortType_, a1, v20);

  if (v21)
  {
    sub_2431577E0();

    v22 = sub_2431577EC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v13, 0, 1, v22);
  }
  else
  {
    v23 = sub_2431577EC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v13, 1, 1, v23);
  }
  sub_24314C088((uint64_t)v13, (uint64_t)v15);
  sub_24314C1F0((uint64_t)v15, (uint64_t)v10, &qword_2543BD038);
  if ((objc_msgSend(a1, sel_isSharedViaICloud) & 1) != 0)
    v24 = 1;
  else
    v24 = objc_msgSend(a1, sel_isSharedViaICloudFolder, v38);
  v25 = sub_2431577C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v7, 1, 1, v25);
  v26 = objc_allocWithZone((Class)type metadata accessor for NotesIndexSharedModel(0));
  v27 = (char *)NotesIndexSharedModel.init(date:showCollaboratorBadge:notesFolder:attachmentURL:hasUnreadChanges:)((uint64_t)v10, v24, 0, 0, (uint64_t)v7, 0);
  sub_24314C1F0(v38, (uint64_t)v7, qword_2543BD0C0);
  v28 = (uint64_t)&v27[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL];
  swift_beginAccess();
  sub_24314C0D0((uint64_t)v7, v28);
  swift_endAccess();
  v29 = objc_msgSend(a1, sel_folderName);
  if (v29)
  {
    v30 = v29;
    v31 = sub_243157BE8();
    v33 = v32;

  }
  else
  {
    v31 = 0;
    v33 = 0;
  }
  v34 = (uint64_t *)&v27[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder];
  swift_beginAccess();
  *v34 = v31;
  v34[1] = v33;
  swift_bridgeObjectRelease();
  LOBYTE(v34) = objc_msgSend(a1, sel_hasUnreadChanges);
  v35 = &v27[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges];
  v36 = swift_beginAccess();
  *v35 = (char)v34;
  MEMORY[0x24BDAC7A8](v36);
  *(&v38 - 2) = (uint64_t)v27;
  type metadata accessor for NotesSharedIndexedSearchView(0);
  sub_24314C1B0(&qword_2543BCFE0, type metadata accessor for NotesSharedIndexedSearchView, (uint64_t)&protocol conformance descriptor for NotesSharedIndexedSearchView);
  sub_24315772C();
  sub_243157C30();

  (*(void (**)(char *, uint64_t))(v39 + 8))(v5, v40);
  sub_24314C174((uint64_t)v15, &qword_2543BD038);
  return v18;
}

unint64_t type metadata accessor for ICNotesSharedIndexedViewHelper()
{
  unint64_t result;

  result = qword_257287858;
  if (!qword_257287858)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257287858);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494F3E38]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24314C088(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD038);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24314C0D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2543BD0C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_24314C118@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  id v5;

  v5 = *(id *)(v1 + 16);
  v3 = sub_24314C1B0(&qword_2543BD078, type metadata accessor for NotesIndexSharedModel, (uint64_t)&protocol conformance descriptor for NotesIndexSharedModel);
  NotesSharedIndexedSearchView.init(model:)((uint64_t)v5, v3, a1);
  return v5;
}

uint64_t sub_24314C174(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24314C1B0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2494F3E50](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24314C1F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_24314C234(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24314C244(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_24314C280(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for NotesYellowHeaderView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_24314C2F4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24314C314(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_257287870)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_257287870);
  }
}

uint64_t MathNotesUpdateSafeAreaInsetsAction.performAction(forSceneController:)(void *a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  char v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33[2];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _QWORD v38[5];

  v2 = objc_msgSend(a1, sel_delegate);
  if (!v2
    || (v38[0] = v2,
        __swift_instantiateConcreteTypeFromMangledName(&qword_2572878E8),
        __swift_instantiateConcreteTypeFromMangledName(&qword_2572878F0),
        (swift_dynamicCast() & 1) == 0))
  {
    v37 = 0;
    v35 = 0u;
    v36 = 0u;
    return sub_24314C174((uint64_t)&v35, &qword_2572878E0);
  }
  if (!*((_QWORD *)&v36 + 1))
    return sub_24314C174((uint64_t)&v35, &qword_2572878E0);
  sub_24314C8C0(&v35, (uint64_t)v38);
  v3 = objc_msgSend(v1, sel_info);
  if (!v3)
    goto LABEL_15;
  v4 = v3;
  v5 = objc_msgSend(v3, sel_objectForSetting_, 1);

  if (v5)
  {
    sub_243157C48();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)v33 = 0u;
    v34 = 0u;
  }
  sub_24314C8F8((uint64_t)v33, (uint64_t)&v35);
  if (!*((_QWORD *)&v36 + 1))
    goto LABEL_16;
  sub_24314E41C(0, &qword_257287900);
  if ((swift_dynamicCast() & 1) == 0)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  v7 = v33[0];
  objc_msgSend(v33[0], sel_UIEdgeInsetsValue);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = objc_msgSend(v1, sel_info);
  if (!v16)
  {
LABEL_15:
    v35 = 0u;
    v36 = 0u;
LABEL_16:
    sub_24314C174((uint64_t)&v35, &qword_2572878F8);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  }
  v17 = v16;
  v18 = objc_msgSend(v16, sel_objectForSetting_, 0);

  if (v18)
  {
    sub_243157C48();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)v33 = 0u;
    v34 = 0u;
  }
  sub_24314C8F8((uint64_t)v33, (uint64_t)&v35);
  if (!*((_QWORD *)&v36 + 1))
    goto LABEL_16;
  sub_24314E41C(0, &qword_257287908);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v19 = v33[0];
    v20 = objc_msgSend(v33[0], sel_BOOLValue);

    v21 = objc_msgSend(v1, sel_info);
    if (v21)
    {
      v22 = v21;
      v23 = objc_msgSend(v21, sel_objectForSetting_, 2);

      if (v23)
      {
        sub_243157C48();
        swift_unknownObjectRelease();
      }
      else
      {
        *(_OWORD *)v33 = 0u;
        v34 = 0u;
      }
      sub_24314C8F8((uint64_t)v33, (uint64_t)&v35);
      if (*((_QWORD *)&v36 + 1))
      {
        sub_24314E41C(0, &qword_257287918);
        if (swift_dynamicCast())
          v24 = v33[0];
        else
          v24 = 0;
LABEL_31:
        v25 = objc_msgSend(v1, sel_info, v33[0], v33[1], v34, v35, (_QWORD)v36);
        if (v25)
        {
          v26 = v25;
          v27 = objc_msgSend(v25, sel_objectForSetting_, 3);

          if (v27)
          {
            sub_243157C48();
            swift_unknownObjectRelease();
          }
          else
          {
            *(_OWORD *)v33 = 0u;
            v34 = 0u;
          }
          sub_24314C8F8((uint64_t)v33, (uint64_t)&v35);
          if (*((_QWORD *)&v36 + 1))
          {
            if (swift_dynamicCast())
            {
              v28 = v33[0];
              goto LABEL_41;
            }
LABEL_40:
            v28 = 0;
LABEL_41:
            v29 = objc_msgSend(v1, sel_info, v33[0], v33[1], v34, v35, (_QWORD)v36);
            if (v29)
            {
              v30 = v29;
              v31 = objc_msgSend(v29, sel_objectForSetting_, 4);

              if (v31)
              {
                sub_243157C48();
                swift_unknownObjectRelease();
              }
              else
              {
                *(_OWORD *)v33 = 0u;
                v34 = 0u;
              }
              sub_24314C8F8((uint64_t)v33, (uint64_t)&v35);
              if (*((_QWORD *)&v36 + 1))
              {
                sub_24314E41C(0, &qword_257287910);
                if (swift_dynamicCast())
                  v32 = v33[0];
                else
                  v32 = 0;
                goto LABEL_51;
              }
            }
            else
            {
              v35 = 0u;
              v36 = 0u;
            }
            sub_24314C174((uint64_t)&v35, &qword_2572878F8);
            v32 = 0;
LABEL_51:
            __swift_project_boxed_opaque_existential_1(v38, v38[3]);
            sub_24314DB54(v20, v24, (uint64_t)v32, v9, v11, v13, v15, *(double *)&v28);

            return __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
          }
        }
        else
        {
          v35 = 0u;
          v36 = 0u;
        }
        sub_24314C174((uint64_t)&v35, &qword_2572878F8);
        goto LABEL_40;
      }
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
    }
    sub_24314C174((uint64_t)&v35, &qword_2572878F8);
    v24 = 0;
    goto LABEL_31;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
}

uint64_t sub_24314C8C0(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24314C8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572878F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

id MathNotesUpdateSafeAreaInsetsAction.__allocating_init(safeAreaInsets:isModeButtonHidden:animationSettings:animationDuration:animationFenceHandle:)(double a1, double a2, double a3, double a4, uint64_t a5, void *a6, void *a7)
{
  objc_class *v7;
  objc_class *v8;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v8 = v7;
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE40]), sel_init);
  sub_24314E41C(0, &qword_257287908);
  v16 = (void *)sub_243157C3C();
  objc_msgSend(v15, sel_setObject_forSetting_, v16, 0);

  v17 = objc_msgSend((id)objc_opt_self(), sel_valueWithUIEdgeInsets_, a1, a2, a3, a4);
  objc_msgSend(v15, sel_setObject_forSetting_, v17, 1);

  objc_msgSend(v15, sel_setObject_forSetting_, a6, 2);
  v18 = (void *)sub_243157C18();
  objc_msgSend(v15, sel_setObject_forSetting_, v18, 3);

  if (a7)
    objc_msgSend(v15, sel_setObject_forSetting_, a7, 4);
  v19 = objc_allocWithZone(v8);
  v20 = v15;
  v21 = objc_msgSend(v19, sel_initWithInfo_responder_, v20, 0);

  return v21;
}

id MathNotesUpdateSafeAreaInsetsAction.__allocating_init(info:responder:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithInfo_responder_, a1, a2);

  return v5;
}

id MathNotesUpdateSafeAreaInsetsAction.init(info:responder:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)swift_getObjectType();
  v5 = objc_msgSendSuper2(&v7, sel_initWithInfo_responder_, a1, a2);

  return v5;
}

id MathNotesUpdateSafeAreaInsetsAction.__allocating_init(info:timeout:forResponseOn:withHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  objc_class *v5;
  objc_class *v6;
  void *v10;
  id v11;
  _QWORD v13[6];

  v6 = v5;
  if (a3)
  {
    v13[4] = a3;
    v13[5] = a4;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 1107296256;
    v13[2] = sub_24314CD38;
    v13[3] = &block_descriptor;
    v10 = _Block_copy(v13);
    swift_release();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, a1, a2, v10, a5);

  _Block_release(v10);
  return v11;
}

void sub_24314CD38(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id MathNotesUpdateSafeAreaInsetsAction.init(info:timeout:forResponseOn:withHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  void *v5;
  void *v6;
  objc_class *ObjectType;
  void *v13;
  id v14;
  _QWORD v16[6];
  objc_super v17;

  v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v16[4] = a3;
    v16[5] = a4;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 1107296256;
    v16[2] = sub_24314CD38;
    v16[3] = &block_descriptor_3;
    v13 = _Block_copy(v16);
    swift_retain();
    swift_release();
  }
  else
  {
    v13 = 0;
  }
  v17.receiver = v6;
  v17.super_class = ObjectType;
  v14 = objc_msgSendSuper2(&v17, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, a1, a2, v13, a5);
  sub_24314DDBC(a3);

  _Block_release(v13);
  return v14;
}

id MathNotesUpdateSafeAreaInsetsAction.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id MathNotesUpdateSafeAreaInsetsAction.__allocating_init(xpcDictionary:)(uint64_t a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_msgSend(objc_allocWithZone(v1), sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v2;
}

id MathNotesUpdateSafeAreaInsetsAction.init(xpcDictionary:)(uint64_t a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  v3 = objc_msgSendSuper2(&v5, sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v3;
}

id MathNotesUpdateSafeAreaInsetsAction.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id MathNotesUpdateSafeAreaInsetsAction.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_24314D0DC(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id MathNotesUpdateSafeAreaInsetsAction.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id MathNotesHostingViewController.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MathNotesHostingViewController.init()()
{
  char *v0;
  char *v1;
  objc_class *v2;
  objc_super v4;

  *(_QWORD *)&v0[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_sceneHostingController] = 0;
  v1 = &v0[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate];
  v2 = (objc_class *)type metadata accessor for MathNotesHostingViewController();
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_QWORD *)v1 + 4) = 0;
  v4.receiver = v0;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t sub_24314D2D4(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  sub_24314DDEC(a1, (uint64_t)v5);
  v3 = *a2 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  swift_beginAccess();
  sub_24314DE34((uint64_t)v5, v3);
  return swift_endAccess();
}

uint64_t sub_24314D338@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  swift_beginAccess();
  return sub_24314DDEC(v3, a1);
}

uint64_t sub_24314D388(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  swift_beginAccess();
  sub_24314DE34(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_24314D3E0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_24314D47C()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;

  v1 = v0;
  v2 = (id)ICNotesAppBundleIdentifier();
  sub_243157BE8();

  v3 = (void *)sub_243157BDC();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend((id)objc_opt_self(), sel_identityForEmbeddedApplicationIdentifier_, v3);

  v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NKNotesSceneSpecification()), sel_init);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDCF8]), sel_initWithProcessIdentity_sceneSpecification_, v4, v5);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDD08]), sel_init);
  objc_msgSend(v6, sel_setActivationController_, v7);

  objc_msgSend(v6, sel_setDelegate_, v1);
  v8 = objc_msgSend(v6, sel_sceneViewController);
  objc_msgSend(v1, sel_addChildViewController_, v8);

  v9 = objc_msgSend(v6, sel_sceneView);
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v10 = objc_msgSend(v6, sel_sceneViewController);
  objc_msgSend(v10, sel_loadViewIfNeeded);

  v11 = objc_msgSend(v1, sel_view);
  if (!v11)
  {
    __break(1u);
    goto LABEL_8;
  }
  v12 = v11;
  v47 = v5;
  v13 = objc_msgSend(v6, sel_sceneView);
  objc_msgSend(v12, sel_addSubview_, v13);

  __swift_instantiateConcreteTypeFromMangledName(&qword_257287938);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_243158270;
  v15 = objc_msgSend(v6, sel_sceneView);
  v16 = objc_msgSend(v15, sel_leadingAnchor);

  v17 = objc_msgSend(v1, sel_view);
  if (!v17)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v18 = v17;
  v19 = objc_msgSend(v17, sel_leadingAnchor);

  v20 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v19);
  *(_QWORD *)(v14 + 32) = v20;
  v21 = objc_msgSend(v6, sel_sceneView);
  v22 = objc_msgSend(v21, sel_trailingAnchor);

  v23 = objc_msgSend(v1, sel_view);
  if (!v23)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v24 = v23;
  v46 = v4;
  v25 = objc_msgSend(v23, sel_trailingAnchor);

  v26 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v25);
  *(_QWORD *)(v14 + 40) = v26;
  v27 = objc_msgSend(v6, sel_sceneView);
  v28 = objc_msgSend(v27, sel_bottomAnchor);

  v29 = objc_msgSend(v1, sel_view);
  if (!v29)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v30 = v29;
  v31 = objc_msgSend(v29, sel_bottomAnchor);

  v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);
  *(_QWORD *)(v14 + 48) = v32;
  v33 = objc_msgSend(v6, sel_sceneView);
  v34 = objc_msgSend(v33, sel_topAnchor);

  v35 = objc_msgSend(v1, sel_view);
  if (v35)
  {
    v36 = v35;
    v37 = (void *)objc_opt_self();
    v38 = objc_msgSend(v36, sel_topAnchor);

    v39 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v38);
    *(_QWORD *)(v14 + 56) = v39;
    sub_243157C0C();
    sub_24314E41C(0, (unint64_t *)&unk_257287940);
    v40 = (void *)sub_243157C00();
    swift_bridgeObjectRelease();
    objc_msgSend(v37, sel_activateConstraints_, v40);

    v41 = objc_msgSend(v6, sel_sceneViewController);
    objc_msgSend(v41, sel_didMoveToParentViewController_, v1);

    v42 = *(void **)&v1[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_sceneHostingController];
    *(_QWORD *)&v1[OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_sceneHostingController] = v6;
    v43 = v6;

    v44 = objc_msgSend(v43, sel_sceneView);
    v45 = objc_msgSend((id)objc_opt_self(), sel_systemOrangeColor);
    objc_msgSend(v44, sel_setTintColor_, v45);

    return;
  }
LABEL_11:
  __break(1u);
}

id MathNotesHostingViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_243157BDC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void MathNotesHostingViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MathNotesHostingViewController.__deallocating_deinit(uint64_t a1)
{
  return sub_24314E288(a1, type metadata accessor for MathNotesHostingViewController);
}

void sub_24314DB54(char a1, void *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8)
{
  void *v8;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  void (*v32)();
  uint64_t v33;

  v17 = objc_msgSend(v8, sel_view);
  if (v17)
  {
    v18 = v17;
    v19 = objc_msgSend(v17, sel_window);

    if (v19)
    {
      v20 = objc_msgSend(v19, sel_windowScene);

      if (v20)
      {
        if (a3)
          objc_msgSend(v20, sel__synchronizeDrawingWithFence_, a3);

      }
    }
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = v8;
    *(double *)(v21 + 24) = a4;
    *(double *)(v21 + 32) = a5;
    *(double *)(v21 + 40) = a6;
    *(double *)(v21 + 48) = a7;
    *(_BYTE *)(v21 + 56) = a1 & 1;
    *(_QWORD *)(v21 + 64) = a2;
    v22 = (void *)objc_opt_self();
    if (a2)
    {
      v32 = sub_24314E480;
      v33 = v21;
      v28 = MEMORY[0x24BDAC760];
      v29 = 1107296256;
      v30 = sub_24314DFBC;
      v31 = &block_descriptor_12;
      v23 = _Block_copy(&v28);
      v24 = a2;
      v25 = v8;
      swift_retain();
      swift_release();
      objc_msgSend(v22, sel__animateWithAnimationSettings_animations_completion_, v24, v23, 0);
      swift_release();
      _Block_release(v23);

    }
    else
    {
      v32 = sub_24314E480;
      v33 = v21;
      v28 = MEMORY[0x24BDAC760];
      v29 = 1107296256;
      v30 = sub_24314DFBC;
      v31 = &block_descriptor_9;
      v26 = _Block_copy(&v28);
      v27 = v8;
      swift_retain();
      swift_release();
      objc_msgSend(v22, sel_animateWithDuration_animations_, v26, a8);
      swift_release();
      _Block_release(v26);
    }
  }
  else
  {
    __break(1u);
  }
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

uint64_t sub_24314DDBC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for MathNotesHostingViewController()
{
  return objc_opt_self();
}

uint64_t sub_24314DDEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24314DE34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_24314DE7C(void *a1, char a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[24];
  uint64_t v23;

  v14 = (uint64_t)a1 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  swift_beginAccess();
  sub_24314DDEC(v14, (uint64_t)v22);
  if (v23)
  {
    sub_24314E498((uint64_t)v22, (uint64_t)v19);
    sub_24314C174((uint64_t)v22, &qword_257287930);
    v15 = v20;
    v16 = v21;
    __swift_project_boxed_opaque_existential_1(v19, v20);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t, uint64_t, double, double, double, double))(v16 + 16))(a1, a2 & 1, a3, v15, v16, a4, a5, a6, a7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  }
  else
  {
    sub_24314C174((uint64_t)v22, &qword_257287930);
  }
  v17 = objc_msgSend(a1, sel_view);
  if (v17)
  {
    v18 = v17;
    objc_msgSend(v17, sel_layoutIfNeeded);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24314DFBC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24314DFF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24314E2B8(a1, a3, a4, a5);
}

uint64_t MathNotesHostingViewControllerDelegate.mathNotesHostingViewController(_:updateAdditionalSafeAreaInsets:isModeButtonHidden:animationSettings:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24314E2B8(a1, a3, a4, a5);
}

uint64_t UIScene.hostApplicationIdentifier.getter()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  v1 = objc_msgSend(v0, sel__FBSScene);
  v2 = objc_msgSend(v1, sel_hostHandle);

  if (!v2)
  {
    v8 = 0u;
    v9 = 0u;
LABEL_11:
    sub_24314C174((uint64_t)&v8, &qword_2572878F8);
    return 0;
  }
  v3 = objc_msgSend(v2, sel_auditToken);

  v4 = (void *)sub_243157BDC();
  v5 = objc_msgSend(v3, sel_valueForEntitlement_, v4);

  if (v5)
  {
    sub_243157C48();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_24314C8F8((uint64_t)v7, (uint64_t)&v8);
  if (!*((_QWORD *)&v9 + 1))
    goto LABEL_11;
  if (swift_dynamicCast())
    return *(_QWORD *)&v7[0];
  else
    return 0;
}

id sub_24314E210()
{
  return sub_24314E288(0, type metadata accessor for NKNotesSceneSpecification);
}

id sub_24314E278()
{
  return sub_24314E288(0, type metadata accessor for NKNotesWindowScene);
}

id sub_24314E288(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_24314E2B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_24314E2C0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC15NotesUIServices30MathNotesHostingViewController_delegate;
  swift_beginAccess();
  return sub_24314DDEC(v3, a2);
}

uint64_t type metadata accessor for MathNotesUpdateSafeAreaInsetsAction()
{
  return objc_opt_self();
}

uint64_t method lookup function for MathNotesHostingViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MathNotesHostingViewController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MathNotesHostingViewController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MathNotesHostingViewController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of MathNotesHostingViewControllerDelegate.mathNotesHostingViewController(_:updateAdditionalSafeAreaInsets:animationSettings:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of MathNotesHostingViewControllerDelegate.mathNotesHostingViewController(_:updateAdditionalSafeAreaInsets:isModeButtonHidden:animationSettings:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t type metadata accessor for NKNotesSceneSpecification()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for NKNotesWindowScene()
{
  return objc_opt_self();
}

uint64_t sub_24314E3E8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_24314E40C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_24314E41C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_24314E454()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_24314E480()
{
  uint64_t v0;

  sub_24314DE7C(*(void **)(v0 + 16), *(_BYTE *)(v0 + 56), *(_QWORD *)(v0 + 64), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_24314E498(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id NotesIndexSharedModel.__allocating_init(date:showCollaboratorBadge:notesFolder:attachmentURL:hasUnreadChanges:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  objc_class *v6;
  id v13;

  v13 = objc_allocWithZone(v6);
  return NotesIndexSharedModel.init(date:showCollaboratorBadge:notesFolder:attachmentURL:hasUnreadChanges:)(a1, a2, a3, a4, a5, a6);
}

uint64_t NotesSharedIndexedSearchView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t result;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;

  *(_QWORD *)a3 = swift_getKeyPath();
  *(_BYTE *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = swift_getKeyPath();
  *(_QWORD *)(a3 + 24) = 0;
  *(_BYTE *)(a3 + 32) = 0;
  v6 = (int *)type metadata accessor for NotesSharedIndexedSearchView(0);
  v7 = (uint64_t *)(a3 + v6[6]);
  *v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFF8);
  swift_storeEnumTagMultiPayload();
  v8 = (uint64_t *)(a3 + v6[7]);
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD008);
  result = swift_storeEnumTagMultiPayload();
  *(_QWORD *)(a3 + v6[9]) = 0x404A000000000000;
  *(_QWORD *)(a3 + v6[10]) = 0x4020000000000000;
  *(_QWORD *)(a3 + v6[11]) = 0x402C000000000000;
  *(_QWORD *)(a3 + v6[12]) = 0x402C000000000000;
  v10 = (_QWORD *)(a3 + v6[13]);
  *v10 = 0;
  v10[1] = 0xE000000000000000;
  v11 = (_QWORD *)(a3 + v6[14]);
  *v11 = 0;
  v11[1] = 0xE000000000000000;
  v12 = (_QWORD *)(a3 + v6[8]);
  *v12 = a1;
  v12[1] = a2;
  return result;
}

uint64_t sub_24314E68C@<X0>(uint64_t a1@<X8>)
{
  return sub_24314E9F4(&OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date, &qword_2543BD038, a1);
}

uint64_t sub_24314E6A0(uint64_t a1)
{
  return sub_24314EA64(a1, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date, &qword_2543BD038);
}

uint64_t (*sub_24314E6B4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24314E6F8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_showCollaboratorBadge);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24314E73C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_showCollaboratorBadge);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_24314E784())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24314E7C8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24314E830()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_24314E884(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24314E8E0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_24314E924(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t *a5, _QWORD *a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;

  v10 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24314C1F0(a1, (uint64_t)v12, a5);
  v13 = *a2 + *a6;
  swift_beginAccess();
  sub_243153D14((uint64_t)v12, v13, a5);
  return swift_endAccess();
}

uint64_t sub_24314E9E0@<X0>(uint64_t a1@<X8>)
{
  return sub_24314E9F4(&OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL, qword_2543BD0C0, a1);
}

uint64_t sub_24314E9F4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;

  v6 = v3 + *a1;
  swift_beginAccess();
  return sub_24314C1F0(v6, a3, a2);
}

uint64_t sub_24314EA50(uint64_t a1)
{
  return sub_24314EA64(a1, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL, qword_2543BD0C0);
}

uint64_t sub_24314EA64(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;

  v6 = v3 + *a2;
  swift_beginAccess();
  sub_243153D14(a1, v6, a3);
  return swift_endAccess();
}

uint64_t (*sub_24314EAC8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24314EB0C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24314EB50(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_24314EB98())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id NotesIndexSharedModel.init(date:showCollaboratorBadge:notesFolder:attachmentURL:hasUnreadChanges:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  char *v6;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  objc_super v21;

  v12 = (uint64_t)&v6[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date];
  v13 = sub_2431577EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v14 = &v6[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = (uint64_t)&v6[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL];
  v16 = sub_2431577C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  swift_beginAccess();
  v17 = v6;
  sub_243153D58(a1, v12, &qword_2543BD038);
  swift_endAccess();
  v17[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_showCollaboratorBadge] = a2;
  swift_beginAccess();
  *(_QWORD *)v14 = a3;
  *((_QWORD *)v14 + 1) = a4;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_243153D58(a5, v15, qword_2543BD0C0);
  swift_endAccess();
  v17[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges] = a6;

  v21.receiver = v17;
  v21.super_class = (Class)type metadata accessor for NotesIndexSharedModel(0);
  v18 = objc_msgSendSuper2(&v21, sel_init);
  sub_24314C174(a5, qword_2543BD0C0);
  sub_24314C174(a1, &qword_2543BD038);
  return v18;
}

id NotesIndexSharedModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void NotesIndexSharedModel.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_24314EE08(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24314EE34
                                                            + 4 * asc_2431583C0[a1]))(1702125924, 0xE400000000000000);
}

unint64_t sub_24314EE34()
{
  return 0xD000000000000015;
}

uint64_t sub_24314EE58()
{
  return 0x6C6F467365746F6ELL;
}

uint64_t sub_24314EE78()
{
  return 0x656D686361747461;
}

unint64_t sub_24314EE9C()
{
  return 0xD000000000000010;
}

BOOL sub_24314EEB8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24314EECC()
{
  sub_243157D08();
  sub_243157D14();
  return sub_243157D20();
}

uint64_t sub_24314EF10()
{
  return sub_243157D14();
}

uint64_t sub_24314EF38()
{
  sub_243157D08();
  sub_243157D14();
  return sub_243157D20();
}

uint64_t sub_24314EF78()
{
  unsigned __int8 *v0;

  return sub_24314EE08(*v0);
}

uint64_t sub_24314EF80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_243156628(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24314EFA4()
{
  return 0;
}

void sub_24314EFB0(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24314EFBC()
{
  sub_243153DE4();
  return sub_243157D44();
}

uint64_t sub_24314EFE4()
{
  sub_243153DE4();
  return sub_243157D50();
}

id NotesIndexSharedModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotesIndexSharedModel(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24314F0A0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2543BD0C0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD038);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD018);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243153DE4();
  sub_243157D38();
  v14 = v2 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date;
  swift_beginAccess();
  sub_24314C1F0(v14, (uint64_t)v9, &qword_2543BD038);
  v22 = 0;
  sub_2431577EC();
  sub_24314C1B0(&qword_2543BCFD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
  v15 = v18;
  sub_243157CD8();
  sub_24314C174((uint64_t)v9, &qword_2543BD038);
  if (!v15)
  {
    swift_beginAccess();
    v21 = 1;
    sub_243157CE4();
    swift_beginAccess();
    v20 = 2;
    swift_bridgeObjectRetain();
    sub_243157CCC();
    swift_bridgeObjectRelease();
    v17 = v2 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL;
    swift_beginAccess();
    sub_24314C1F0(v17, (uint64_t)v6, qword_2543BD0C0);
    v19 = 3;
    sub_2431577C8();
    sub_24314C1B0(&qword_2543BCFD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    sub_243157CD8();
    sub_24314C174((uint64_t)v6, qword_2543BD0C0);
    swift_beginAccess();
    v23 = 4;
    sub_243157CE4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

id NotesIndexSharedModel.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return NotesIndexSharedModel.init(from:)(a1);
}

id NotesIndexSharedModel.init(from:)(_QWORD *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t, uint64_t);
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;
  char v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  objc_class *v35;
  id v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  objc_super v45;
  char v46;
  char v47;
  uint64_t *v48;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2543BD0C0);
  MEMORY[0x24BDAC7A8](v4);
  v37 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD038);
  MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFC0);
  v8 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = &v2[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date];
  v12 = sub_2431577EC();
  v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
  v43 = (uint64_t)v11;
  v13(v11, 1, 1, v12);
  v14 = &v2[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v48 = (uint64_t *)v14;
  v15 = &v2[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL];
  v16 = sub_2431577C8();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v40 = v15;
  v17(v15, 1, 1, v16);
  v18 = a1[3];
  v41 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_243153DE4();
  v42 = v2;
  v19 = v44;
  sub_243157D2C();
  if (v19)
  {
    v23 = v42;
    v24 = v43;
    v36 = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
    sub_24314C174(v24, &qword_2543BD038);
    swift_bridgeObjectRelease();
    sub_24314C174((uint64_t)v36, qword_2543BD0C0);

    type metadata accessor for NotesIndexSharedModel(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    v20 = v8;
    v47 = 0;
    sub_24314C1B0(&qword_2543BCFB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    v22 = (uint64_t)v38;
    v21 = v39;
    sub_243157CA8();
    v26 = v43;
    swift_beginAccess();
    sub_243153D14(v22, v26, &qword_2543BD038);
    swift_endAccess();
    v47 = 1;
    v27 = sub_243157CB4();
    v28 = v42;
    v42[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_showCollaboratorBadge] = v27 & 1;
    v47 = 2;
    v29 = sub_243157C9C();
    v31 = v30;
    v32 = v48;
    v44 = v29;
    swift_beginAccess();
    *v32 = v44;
    v32[1] = v31;
    swift_bridgeObjectRelease();
    v46 = 3;
    sub_24314C1B0(&qword_2543BCFB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
    v33 = (uint64_t)v37;
    sub_243157CA8();
    v34 = (uint64_t)v40;
    swift_beginAccess();
    sub_243153D14(v33, v34, qword_2543BD0C0);
    swift_endAccess();
    v46 = 4;
    v28[OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges] = sub_243157CB4() & 1;

    v35 = (objc_class *)type metadata accessor for NotesIndexSharedModel(0);
    v45.receiver = v28;
    v45.super_class = v35;
    v36 = objc_msgSendSuper2(&v45, sel_init);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  }
  return v36;
}

uint64_t sub_24314F904@<X0>(uint64_t a1@<X8>)
{
  return sub_24314F92C(&OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date, &qword_2543BD038, a1);
}

uint64_t sub_24314F918@<X0>(uint64_t a1@<X8>)
{
  return sub_24314F92C(&OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL, qword_2543BD0C0, a1);
}

uint64_t sub_24314F92C@<X0>(_QWORD *a1@<X2>, uint64_t *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;

  v6 = v3 + *a1;
  swift_beginAccess();
  return sub_24314C1F0(v6, a3, a2);
}

id sub_24314F988@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v5;
  id result;

  v5 = objc_allocWithZone((Class)type metadata accessor for NotesIndexSharedModel(0));
  result = NotesIndexSharedModel.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_24314F9DC(_QWORD *a1)
{
  return sub_24314F0A0(a1);
}

uint64_t NotesYellowHeaderView.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t result;
  uint64_t v14;

  v2 = sub_243157AF8();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *MEMORY[0x24BDF3C28];
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v7(v4, v5, v2);
  v8 = MEMORY[0x2494F3958](v4, 1.0, 0.85, 0.0, 1.0);
  v7(v4, v5, v2);
  v9 = MEMORY[0x2494F3958](v4, 0.98, 0.73, 0.0, 1.0);
  v7(v4, v5, v2);
  v10 = MEMORY[0x2494F3958](v4, 0.24, 0.24, 0.26, 1.0);
  v7(v4, v5, v2);
  MEMORY[0x2494F3958](v4, 0.47, 0.47, 0.5, 1.0);
  v11 = sub_243157B10();
  swift_release();
  v12 = objc_msgSend((id)objc_opt_self(), sel_quaternaryLabelColor);
  result = MEMORY[0x2494F3964](v12);
  *a1 = v8;
  a1[1] = v9;
  a1[2] = v10;
  a1[3] = v11;
  a1[4] = result;
  return result;
}

uint64_t NotesYellowHeaderView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v3;
  uint64_t v4;
  _OWORD v6[2];
  uint64_t v7;

  v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  v7 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)a1 = sub_2431579B4();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCDB8);
  return sub_24314FBEC((uint64_t)v6, a1 + *(int *)(v4 + 44));
}

uint64_t sub_24314FBEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v23 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE80);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v22 - v7;
  v9 = *(_OWORD *)(a1 + 16);
  v24 = *(_OWORD *)a1;
  v25 = v9;
  v26 = *(_QWORD *)(a1 + 32);
  sub_24314FD98((uint64_t)&v22 - v7);
  v10 = swift_allocObject();
  v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 32) = v11;
  *(_QWORD *)(v10 + 48) = *(_QWORD *)(a1 + 32);
  sub_2431575F4(a1);
  sub_243157B88();
  sub_243157864();
  v12 = v24;
  v13 = BYTE8(v24);
  v14 = v25;
  v15 = BYTE8(v25);
  v17 = v26;
  v16 = v27;
  v22 = v6;
  sub_24314C1F0((uint64_t)v8, (uint64_t)v6, &qword_2543BCE80);
  v18 = (uint64_t)v6;
  v19 = v23;
  sub_24314C1F0(v18, v23, &qword_2543BCE80);
  v20 = v19 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE88) + 48);
  *(_QWORD *)v20 = sub_2431575EC;
  *(_QWORD *)(v20 + 8) = v10;
  *(_QWORD *)(v20 + 16) = v12;
  *(_BYTE *)(v20 + 24) = v13;
  *(_QWORD *)(v20 + 32) = v14;
  *(_BYTE *)(v20 + 40) = v15;
  *(_QWORD *)(v20 + 48) = v17;
  *(_QWORD *)(v20 + 56) = v16;
  swift_retain();
  sub_24314C174((uint64_t)v8, &qword_2543BCE80);
  swift_release();
  return sub_24314C174((uint64_t)v22, &qword_2543BCE80);
}

uint64_t sub_24314FD98@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD *v45;
  __int128 v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;

  v65 = a1;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE90);
  MEMORY[0x24BDAC7A8](v64);
  v63 = (uint64_t)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2431578A0();
  MEMORY[0x24BDAC7A8](v3);
  v57 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_243157B94();
  v5 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v54 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE78);
  MEMORY[0x24BDAC7A8](v55);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE20);
  MEMORY[0x24BDAC7A8](v58);
  v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE50);
  MEMORY[0x24BDAC7A8](v61);
  v59 = (uint64_t)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE70);
  MEMORY[0x24BDAC7A8](v62);
  v60 = (uint64_t)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *v1;
  v13 = v1[1];
  v50 = v1[2];
  v53 = v1[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFA8);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_243158B20;
  *(_QWORD *)(v15 + 32) = v14;
  *(_QWORD *)(v15 + 40) = v13;
  *(_QWORD *)&v76 = v15;
  sub_243157C0C();
  v16 = v76;
  swift_retain();
  swift_retain();
  sub_243157BA0();
  sub_243157BAC();
  MEMORY[0x2494F3994](v16);
  sub_24315787C();
  v51 = v66;
  v52 = v67;
  v17 = v68;
  v18 = v69;
  swift_retain();
  sub_243157B88();
  sub_243157864();
  v48 = v70;
  LOBYTE(v14) = v71;
  v19 = v72;
  v20 = v73;
  v22 = v74;
  v21 = v75;
  v23 = *MEMORY[0x24BDF5080];
  v49 = v5;
  v24 = v54;
  v25 = v56;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 104))(v54, v23, v56);
  v26 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v27 = (uint64_t)v57;
  v26(v57, v24, v25);
  sub_243157310(v27, (uint64_t)&v8[*(int *)(v55 + 36)], (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
  *(_QWORD *)v8 = v48;
  v8[8] = v14;
  *((_QWORD *)v8 + 2) = v19;
  v8[24] = v20;
  *((_QWORD *)v8 + 4) = v22;
  *((_QWORD *)v8 + 5) = v21;
  *((_OWORD *)v8 + 3) = xmmword_243158B30;
  *((_QWORD *)v8 + 8) = v53;
  *((_QWORD *)v8 + 9) = 0;
  *((_QWORD *)v8 + 10) = 0;
  *((_QWORD *)v8 + 11) = 0xBFF0000000000000;
  swift_retain_n();
  sub_243157354(v27, (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v24, v25);
  swift_release();
  v28 = sub_243157B7C();
  v30 = v29;
  v31 = v63;
  sub_24314C1F0((uint64_t)v8, v63, &qword_2543BCE78);
  v32 = (uint64_t *)(v31 + *(int *)(v64 + 36));
  *v32 = v28;
  v32[1] = v30;
  sub_24314C1F0(v31, (uint64_t)&v10[*(int *)(v58 + 36)], &qword_2543BCE90);
  *(_QWORD *)v10 = v51;
  *(_OWORD *)(v10 + 8) = v52;
  *((_QWORD *)v10 + 3) = v17;
  *((_QWORD *)v10 + 4) = v18;
  *((_QWORD *)v10 + 5) = v50;
  *((_OWORD *)v10 + 3) = xmmword_243158B40;
  *((_QWORD *)v10 + 8) = 0x3FF0000000000000;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24314C174(v31, &qword_2543BCE90);
  sub_24314C174((uint64_t)v8, &qword_2543BCE78);
  swift_release();
  swift_bridgeObjectRelease();
  v33 = v59;
  sub_24314C1F0((uint64_t)v10, v59, &qword_2543BCE20);
  *(_WORD *)(v33 + *(int *)(v61 + 36)) = 0;
  sub_24314C174((uint64_t)v10, &qword_2543BCE20);
  LOBYTE(v28) = sub_2431579E4();
  sub_24315781C();
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = v60;
  sub_24314C1F0(v33, v60, &qword_2543BCE50);
  v43 = v42 + *(int *)(v62 + 36);
  *(_BYTE *)v43 = v28;
  *(_QWORD *)(v43 + 8) = v35;
  *(_QWORD *)(v43 + 16) = v37;
  *(_QWORD *)(v43 + 24) = v39;
  *(_QWORD *)(v43 + 32) = v41;
  *(_BYTE *)(v43 + 40) = 0;
  sub_24314C174(v33, &qword_2543BCE50);
  sub_243157B88();
  sub_243157864();
  v44 = v65;
  sub_24314C1F0(v42, v65, &qword_2543BCE70);
  v45 = (_OWORD *)(v44 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE80) + 36));
  v46 = v77;
  *v45 = v76;
  v45[1] = v46;
  v45[2] = v78;
  return sub_24314C174(v42, &qword_2543BCE70);
}

double sub_2431503A8@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_243157A68();
  v4 = *(_QWORD *)(a1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFA0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_243158B20;
  *(_OWORD *)(v5 + 32) = xmmword_243158B50;
  swift_retain();
  sub_243157834();
  v6 = sub_243157B88();
  *(_OWORD *)a2 = v9;
  *(_QWORD *)(a2 + 16) = v10;
  *(_QWORD *)(a2 + 24) = v11;
  *(_BYTE *)(a2 + 32) = v12;
  result = v14;
  *(_QWORD *)(a2 + 40) = v13;
  *(double *)(a2 + 48) = v14;
  *(_QWORD *)(a2 + 56) = v15;
  *(_QWORD *)(a2 + 64) = v16;
  *(_QWORD *)(a2 + 72) = v17;
  *(_QWORD *)(a2 + 80) = v4;
  *(_WORD *)(a2 + 88) = 256;
  *(_QWORD *)(a2 + 96) = v6;
  *(_QWORD *)(a2 + 104) = v8;
  return result;
}

uint64_t sub_2431504C0()
{
  long double v0;
  uint64_t result;
  double v2;
  double v3;
  long double v4;

  sub_243157870();
  remainder(v0, 4.0);
  sub_243157A50();
  result = sub_243157870();
  v3 = v2 * 0.25;
  if ((~*(_QWORD *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v3 >= 9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((unint64_t)((uint64_t)v3 - 0x2000000000000000) >> 62 == 3)
  {
    sub_243157870();
    remainder(v4, 4.0);
    return sub_243157A5C();
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_2431505B8()
{
  return sub_243157AE0();
}

uint64_t sub_2431505D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v3;
  uint64_t v4;
  _OWORD v6[2];
  uint64_t v7;

  v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  v7 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)a1 = sub_2431579B4();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCDB8);
  return sub_24314FBEC((uint64_t)v6, a1 + *(int *)(v4 + 44));
}

uint64_t NotesSharedIndexedSearchView.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  char *v7;
  uint64_t *v8;
  uint64_t *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;

  v19 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFC8);
  v20 = *(_QWORD *)(v3 - 8);
  v21 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v24 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (int *)type metadata accessor for NotesSharedIndexedSearchView(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v7 = swift_getKeyPath();
  v7[8] = 0;
  *((_QWORD *)v7 + 2) = swift_getKeyPath();
  *((_QWORD *)v7 + 3) = 0;
  v7[32] = 0;
  v8 = (uint64_t *)&v7[v5[6]];
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFF8);
  v22 = v8;
  swift_storeEnumTagMultiPayload();
  v9 = (uint64_t *)&v7[v5[7]];
  *v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD008);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)&v7[v5[9]] = 0x404A000000000000;
  *(_QWORD *)&v7[v5[10]] = 0x4020000000000000;
  *(_QWORD *)&v7[v5[11]] = 0x402C000000000000;
  *(_QWORD *)&v7[v5[12]] = 0x402C000000000000;
  v10 = &v7[v5[13]];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0xE000000000000000;
  v11 = &v7[v5[14]];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0xE000000000000000;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243153E28();
  v12 = (uint64_t)v23;
  sub_243157D2C();
  if (v12)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    sub_243153E6C(*(id *)v7, v7[8]);
    sub_243153E78(*((_QWORD *)v7 + 2), *((_QWORD *)v7 + 3), v7[32]);
    sub_24314C174((uint64_t)v22, &qword_257287950);
    sub_24314C174((uint64_t)v9, &qword_257287958);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v23 = a1;
    type metadata accessor for NotesIndexSharedModel(0);
    sub_24314C1B0((unint64_t *)&unk_2543BD068, type metadata accessor for NotesIndexSharedModel, (uint64_t)&protocol conformance descriptor for NotesIndexSharedModel);
    v13 = v21;
    v14 = v24;
    sub_243157CC0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v13);
    v15 = v25;
    v16 = sub_24314C1B0(&qword_2543BD078, type metadata accessor for NotesIndexSharedModel, (uint64_t)&protocol conformance descriptor for NotesIndexSharedModel);
    v17 = &v7[v5[8]];
    *(_QWORD *)v17 = v15;
    *((_QWORD *)v17 + 1) = v16;
    sub_243157310((uint64_t)v7, v19, type metadata accessor for NotesSharedIndexedSearchView);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    return sub_243157354((uint64_t)v7, type metadata accessor for NotesSharedIndexedSearchView);
  }
}

uint64_t sub_243150930()
{
  return 1;
}

uint64_t sub_243150938()
{
  sub_243157D08();
  sub_243157D14();
  return sub_243157D20();
}

uint64_t sub_243150978()
{
  return sub_243157D14();
}

uint64_t sub_24315099C()
{
  sub_243157D08();
  sub_243157D14();
  return sub_243157D20();
}

uint64_t sub_2431509D8()
{
  return 0x6C65646F6DLL;
}

uint64_t sub_2431509EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_243157CFC();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_243150A78(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_243150A84()
{
  sub_243153E28();
  return sub_243157D44();
}

uint64_t sub_243150AAC()
{
  sub_243153E28();
  return sub_243157D50();
}

uint64_t NotesSharedIndexedSearchView.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD020);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243153E28();
  sub_243157D38();
  v8 = *(_QWORD *)(v2 + *(int *)(type metadata accessor for NotesSharedIndexedSearchView(0) + 32));
  swift_getObjectType();
  v10[1] = v8;
  sub_243157CF0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t NotesSharedIndexedSearchView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  id v20;
  id v21;
  id v22;
  unsigned int *v23;
  uint64_t v24;
  uint64_t KeyPath;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = a1;
  v30 = sub_243157828();
  v2 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF38);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE10);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE48);
  MEMORY[0x24BDAC7A8](v31);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v7 = sub_2431579B4();
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v13 = (uint64_t *)&v7[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2543BCDB0) + 44)];
  v29 = v1;
  sub_243150EE4(v1, v13);
  v14 = sub_243157B88();
  v16 = v15;
  v17 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
  v18 = MEMORY[0x2494F3910](v17);
  sub_24314C1F0((uint64_t)v7, (uint64_t)v10, &qword_2543BCF38);
  v19 = (uint64_t *)&v10[*(int *)(v8 + 36)];
  *v19 = v18;
  v19[1] = v14;
  v19[2] = v16;
  sub_24314C174((uint64_t)v7, &qword_2543BCF38);
  v20 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  v21 = objc_msgSend(v20, sel_traitCollection);

  v22 = objc_msgSend(v21, sel_userInterfaceStyle);
  if (v22 == (id)1)
  {
    v23 = (unsigned int *)MEMORY[0x24BDEB400];
  }
  else
  {
    if (v22 != (id)2)
    {
      type metadata accessor for NotesSharedIndexedSearchView(0);
      sub_2431541E8((uint64_t)v4);
      v24 = v30;
      goto LABEL_7;
    }
    v23 = (unsigned int *)MEMORY[0x24BDEB3F0];
  }
  v24 = v30;
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *v23, v30);
LABEL_7:
  KeyPath = swift_getKeyPath();
  v26 = (uint64_t *)&v12[*(int *)(v31 + 36)];
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF00);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))((char *)v26 + *(int *)(v27 + 28), v4, v24);
  *v26 = KeyPath;
  sub_24314C1F0((uint64_t)v10, (uint64_t)v12, &qword_2543BCE10);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v24);
  sub_24314C174((uint64_t)v10, &qword_2543BCE10);
  return sub_243157528((uint64_t)v12, v32, &qword_2543BCE48);
}

uint64_t sub_243150EE4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF08);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE00);
  MEMORY[0x24BDAC7A8](v60);
  v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE38);
  MEMORY[0x24BDAC7A8](v62);
  v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE68);
  v11 = MEMORY[0x24BDAC7A8](v64);
  v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v63 = (uint64_t)&v57 - v14;
  v15 = sub_243157AF8();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *MEMORY[0x24BDF3C28];
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 104);
  v20(v17, v18, v15);
  v61 = MEMORY[0x2494F3958](v17, 1.0, 0.85, 0.0, 1.0);
  v20(v17, v18, v15);
  v59 = MEMORY[0x2494F3958](v17, 0.98, 0.73, 0.0, 1.0);
  v20(v17, v18, v15);
  v58 = MEMORY[0x2494F3958](v17, 0.24, 0.24, 0.26, 1.0);
  v20(v17, v18, v15);
  MEMORY[0x2494F3958](v17, 0.47, 0.47, 0.5, 1.0);
  v57 = sub_243157B10();
  swift_release();
  v21 = objc_msgSend((id)objc_opt_self(), sel_quaternaryLabelColor);
  v22 = MEMORY[0x2494F3964](v21);
  *(_QWORD *)v6 = sub_243157948();
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCDA8);
  sub_2431513D0(a1, &v6[*(int *)(v23 + 44)]);
  LOBYTE(v20) = sub_2431579FC();
  type metadata accessor for NotesSharedIndexedSearchView(0);
  sub_24315781C();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  sub_24314C1F0((uint64_t)v6, (uint64_t)v8, &qword_2543BCF08);
  v32 = &v8[*(int *)(v60 + 36)];
  *v32 = (char)v20;
  *((_QWORD *)v32 + 1) = v25;
  *((_QWORD *)v32 + 2) = v27;
  *((_QWORD *)v32 + 3) = v29;
  *((_QWORD *)v32 + 4) = v31;
  v32[40] = 0;
  sub_24314C174((uint64_t)v6, &qword_2543BCF08);
  LOBYTE(v20) = sub_243157A08();
  sub_24315781C();
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  sub_24314C1F0((uint64_t)v8, (uint64_t)v10, &qword_2543BCE00);
  v41 = &v10[*(int *)(v62 + 36)];
  *v41 = (char)v20;
  *((_QWORD *)v41 + 1) = v34;
  *((_QWORD *)v41 + 2) = v36;
  *((_QWORD *)v41 + 3) = v38;
  *((_QWORD *)v41 + 4) = v40;
  v41[40] = 0;
  sub_24314C174((uint64_t)v8, &qword_2543BCE00);
  LOBYTE(v20) = sub_2431579F0();
  sub_24315781C();
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  sub_24314C1F0((uint64_t)v10, (uint64_t)v13, &qword_2543BCE38);
  v50 = &v13[*(int *)(v64 + 36)];
  *v50 = (char)v20;
  *((_QWORD *)v50 + 1) = v43;
  *((_QWORD *)v50 + 2) = v45;
  *((_QWORD *)v50 + 3) = v47;
  *((_QWORD *)v50 + 4) = v49;
  v50[40] = 0;
  sub_24314C174((uint64_t)v10, &qword_2543BCE38);
  v51 = v63;
  sub_243157528((uint64_t)v13, v63, &qword_2543BCE68);
  sub_24314C1F0(v51, (uint64_t)v13, &qword_2543BCE68);
  v52 = v58;
  v53 = v59;
  *a2 = v61;
  a2[1] = v53;
  v54 = v57;
  a2[2] = v52;
  a2[3] = v54;
  a2[4] = v22;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCD88);
  sub_24314C1F0((uint64_t)v13, (uint64_t)a2 + *(int *)(v55 + 48), &qword_2543BCE68);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24314C174(v51, &qword_2543BCE68);
  sub_24314C174((uint64_t)v13, &qword_2543BCE68);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_2431513D0@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t ObjectType;
  char v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  char v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _OWORD v95[2];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _OWORD v106[2];
  __int128 v107;
  _OWORD v108[11];
  __int128 v109;
  _OWORD v110[11];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _OWORD v121[2];
  _OWORD v122[10];
  uint64_t v123;
  _OWORD v124[11];
  char v125;
  uint64_t v126;
  char v127;
  uint64_t v128;
  char v129;
  __int128 v130;
  _OWORD v131[13];

  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCEB0);
  MEMORY[0x24BDAC7A8](v78);
  v80 = (uint64_t *)((char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF78);
  MEMORY[0x24BDAC7A8](v79);
  v77 = (uint64_t *)((char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF18);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v75 = (uint64_t)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v76 = (uint64_t *)((char *)&v71 - v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2543BD0C0);
  MEMORY[0x24BDAC7A8](v10);
  v81 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCEE0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v71 - v16;
  v18 = *(int *)(type metadata accessor for NotesSharedIndexedSearchView(0) + 32);
  v83 = a1;
  v19 = (uint64_t *)(a1 + v18);
  v20 = *v19;
  v21 = v19[1];
  ObjectType = swift_getObjectType();
  v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 32))(ObjectType, v21);
  v82 = v15;
  v84 = v17;
  if ((v23 & 1) != 0)
  {
    v24 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 56);
    v73 = ObjectType;
    v74 = v20;
    v72 = v21;
    if ((v24(ObjectType, v21) & 1) != 0)
    {
      v25 = sub_2431579B4();
      sub_243151EC4((uint64_t)&v109);
      v26 = v110[0];
      v27 = *(_QWORD *)&v110[1];
      v28 = *(_QWORD *)&v110[3];
      v29 = *(_QWORD *)&v110[4];
      v30 = *(_OWORD *)((char *)&v110[1] + 8);
      v31 = v110[5];
      v32 = v109;
      LOBYTE(v131[0]) = 0;
      LOBYTE(v96) = BYTE8(v110[2]);
      LOBYTE(v85) = BYTE8(v110[3]);
      LOBYTE(v124[0]) = BYTE8(v110[4]);
      *(_QWORD *)&v109 = v25;
      *((_QWORD *)&v109 + 1) = 0x4010000000000000;
      LOBYTE(v110[0]) = 0;
      *(_OWORD *)((char *)v110 + 8) = v32;
      *(_OWORD *)((char *)&v110[1] + 8) = v26;
      *((_QWORD *)&v110[2] + 1) = v27;
      v110[3] = v30;
      LOBYTE(v110[4]) = v96;
      *((_QWORD *)&v110[4] + 1) = v28;
      LOBYTE(v110[5]) = v85;
      *((_QWORD *)&v110[5] + 1) = v29;
      LOBYTE(v110[6]) = v124[0];
      *(_OWORD *)((char *)&v110[6] + 8) = v31;
      sub_243156E5C((uint64_t)&v109);
      sub_243157528((uint64_t)&v109, (uint64_t)&v107, &qword_257287978);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF48);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF58);
      v33 = MEMORY[0x24BDF4700];
      sub_2431576E4(&qword_2543BCF40, &qword_2543BCF48, MEMORY[0x24BDF4700]);
      sub_2431576E4(&qword_2543BCF50, &qword_2543BCF58, v33);
    }
    else
    {
      v37 = sub_2431579C0();
      sub_243152054((uint64_t)&v96);
      *(_OWORD *)((char *)&v131[7] + 7) = v103;
      *(_OWORD *)((char *)&v131[6] + 7) = v102;
      *(_OWORD *)((char *)&v131[3] + 7) = v99;
      *(_OWORD *)((char *)&v131[2] + 7) = v98;
      *(_OWORD *)((char *)&v131[8] + 7) = v104;
      *(_OWORD *)((char *)&v131[9] + 7) = v105;
      *(_OWORD *)((char *)&v131[4] + 7) = v100;
      *(_OWORD *)((char *)&v131[5] + 7) = v101;
      *(_OWORD *)((char *)v131 + 7) = v96;
      *(_OWORD *)((char *)&v131[1] + 7) = v97;
      *(_OWORD *)((char *)&v110[7] + 1) = v131[7];
      *(_OWORD *)((char *)&v110[8] + 1) = v131[8];
      *(_OWORD *)((char *)&v110[9] + 1) = v131[9];
      *(_OWORD *)((char *)&v110[3] + 1) = v131[3];
      *(_OWORD *)((char *)&v110[4] + 1) = v131[4];
      *(_OWORD *)((char *)&v110[5] + 1) = v131[5];
      *(_OWORD *)((char *)&v110[6] + 1) = v131[6];
      *(_OWORD *)((char *)v110 + 1) = v131[0];
      *(_OWORD *)((char *)&v110[1] + 1) = v131[1];
      LOBYTE(v85) = 0;
      v109 = (unint64_t)v37;
      LOBYTE(v110[0]) = 0;
      *(_QWORD *)&v110[10] = *((_QWORD *)&v105 + 1);
      *(_OWORD *)((char *)&v110[2] + 1) = v131[2];
      sub_243156E48((uint64_t)&v109);
      sub_243157528((uint64_t)&v109, (uint64_t)&v107, &qword_257287978);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF48);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF58);
      v38 = MEMORY[0x24BDF4700];
      sub_2431576E4(&qword_2543BCF40, &qword_2543BCF48, MEMORY[0x24BDF4700]);
      sub_2431576E4(&qword_2543BCF50, &qword_2543BCF58, v38);
    }
    sub_2431579CC();
    v110[7] = v119;
    v110[8] = v120;
    v110[9] = v121[0];
    *(_OWORD *)((char *)&v110[9] + 9) = *(_OWORD *)((char *)v121 + 9);
    v110[3] = v115;
    v110[4] = v116;
    v110[5] = v117;
    v110[6] = v118;
    v109 = v111;
    v110[0] = v112;
    v110[1] = v113;
    v110[2] = v114;
    sub_243156E54((uint64_t)&v109);
    sub_243157528((uint64_t)&v109, (uint64_t)&v107, &qword_2543BCEB8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCED8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF28);
    sub_243156968();
    sub_2431576E4(&qword_2543BCF20, &qword_2543BCF28, MEMORY[0x24BDF4700]);
    sub_2431579CC();
    v35 = v83;
    v36 = (uint64_t)v81;
    ObjectType = v73;
    v21 = v72;
  }
  else
  {
    v34 = sub_2431579B4();
    sub_243157B88();
    sub_243157864();
    v109 = (unint64_t)v34;
    LOBYTE(v110[0]) = 1;
    *((_QWORD *)&v110[0] + 1) = 0;
    LOBYTE(v110[1]) = 1;
    *((_QWORD *)&v110[1] + 1) = v126;
    LOBYTE(v110[2]) = v127;
    *((_QWORD *)&v110[2] + 1) = v128;
    LOBYTE(v110[3]) = v129;
    *(_OWORD *)((char *)&v110[3] + 8) = v130;
    sub_24315695C((uint64_t)&v109);
    sub_243157528((uint64_t)&v109, (uint64_t)&v107, &qword_2543BCEB8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCED8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF28);
    sub_243156968();
    sub_2431576E4(&qword_2543BCF20, &qword_2543BCF28, MEMORY[0x24BDF4700]);
    sub_2431579CC();
    v35 = v83;
    v36 = (uint64_t)v81;
  }
  v39 = sub_2431579C0();
  sub_2431522A0(v35, (uint64_t)v122);
  *(_OWORD *)((char *)&v124[7] + 7) = v122[7];
  *(_OWORD *)((char *)&v124[8] + 7) = v122[8];
  *(_OWORD *)((char *)&v124[9] + 7) = v122[9];
  *(_OWORD *)((char *)&v124[3] + 7) = v122[3];
  *(_OWORD *)((char *)&v124[4] + 7) = v122[4];
  *(_OWORD *)((char *)&v124[5] + 7) = v122[5];
  *(_OWORD *)((char *)&v124[6] + 7) = v122[6];
  *(_OWORD *)((char *)v124 + 7) = v122[0];
  *(_OWORD *)((char *)&v124[1] + 7) = v122[1];
  v125 = 0;
  *(_QWORD *)((char *)&v124[10] + 7) = v123;
  *(_OWORD *)((char *)&v124[2] + 7) = v122[2];
  (*(void (**)(uint64_t, uint64_t))(v21 + 48))(ObjectType, v21);
  v40 = sub_2431577C8();
  v41 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 48))(v36, 1, v40);
  sub_24314C174(v36, qword_2543BD0C0);
  v83 = v39;
  LODWORD(v81) = 0;
  if (v41 == 1)
  {
    v42 = v80;
    *v80 = 0;
    *((_BYTE *)v42 + 8) = 1;
    swift_storeEnumTagMultiPayload();
    sub_2431576E4(&qword_2543BCF70, &qword_2543BCF78, MEMORY[0x24BDF5428]);
    v43 = (uint64_t)v84;
    sub_2431579CC();
  }
  else
  {
    v44 = sub_2431579B4();
    v45 = (uint64_t)v76;
    *v76 = v44;
    *(_QWORD *)(v45 + 8) = 0;
    *(_BYTE *)(v45 + 16) = 1;
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCDC0);
    sub_24315327C(v35, v45 + *(int *)(v46 + 44));
    v47 = v75;
    sub_24314C1F0(v45, v75, &qword_2543BCF18);
    v48 = (uint64_t)v77;
    *v77 = 0;
    *(_BYTE *)(v48 + 8) = 1;
    v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF10);
    sub_24314C1F0(v47, v48 + *(int *)(v49 + 48), &qword_2543BCF18);
    sub_24314C174(v47, &qword_2543BCF18);
    sub_24314C1F0(v48, (uint64_t)v80, &qword_2543BCF78);
    swift_storeEnumTagMultiPayload();
    sub_2431576E4(&qword_2543BCF70, &qword_2543BCF78, MEMORY[0x24BDF5428]);
    v43 = (uint64_t)v84;
    sub_2431579CC();
    sub_24314C174(v48, &qword_2543BCF78);
    sub_24314C174(v45, &qword_2543BCF18);
  }
  v93 = v131[8];
  v94 = v131[9];
  v95[0] = v131[10];
  *(_OWORD *)((char *)v95 + 10) = *(_OWORD *)((char *)&v131[10] + 10);
  v89 = v131[4];
  v90 = v131[5];
  v91 = v131[6];
  v92 = v131[7];
  v85 = v131[0];
  v86 = v131[1];
  v87 = v131[2];
  v88 = v131[3];
  v50 = (uint64_t)v82;
  sub_24314C1F0(v43, (uint64_t)v82, &qword_2543BCEE0);
  v51 = v94;
  v104 = v93;
  v105 = v94;
  v52 = v95[0];
  v106[0] = v95[0];
  *(_OWORD *)((char *)v106 + 10) = *(_OWORD *)((char *)v95 + 10);
  v53 = v89;
  v54 = v90;
  v100 = v89;
  v101 = v90;
  v55 = v91;
  v56 = v92;
  v102 = v91;
  v103 = v92;
  v57 = v85;
  v58 = v86;
  v96 = v85;
  v97 = v86;
  v59 = v87;
  v60 = v88;
  v98 = v87;
  v99 = v88;
  a2[8] = v93;
  a2[9] = v51;
  a2[10] = v52;
  *(_OWORD *)((char *)a2 + 170) = *(_OWORD *)((char *)v95 + 10);
  a2[4] = v53;
  a2[5] = v54;
  a2[6] = v55;
  a2[7] = v56;
  *a2 = v57;
  a2[1] = v58;
  a2[2] = v59;
  a2[3] = v60;
  *(_OWORD *)((char *)&v108[7] + 1) = v124[7];
  *(_OWORD *)((char *)&v108[8] + 1) = v124[8];
  *(_OWORD *)((char *)&v108[9] + 1) = v124[9];
  v108[10] = *(_OWORD *)((char *)&v124[9] + 15);
  *(_OWORD *)((char *)&v108[3] + 1) = v124[3];
  *(_OWORD *)((char *)&v108[4] + 1) = v124[4];
  *(_OWORD *)((char *)&v108[5] + 1) = v124[5];
  *(_OWORD *)((char *)&v108[6] + 1) = v124[6];
  *(_OWORD *)((char *)v108 + 1) = v124[0];
  v61 = v83;
  *(_QWORD *)&v107 = v83;
  *((_QWORD *)&v107 + 1) = 0x4010000000000000;
  v62 = (char)v81;
  LOBYTE(v108[0]) = (_BYTE)v81;
  *(_OWORD *)((char *)&v108[1] + 1) = v124[1];
  *(_OWORD *)((char *)&v108[2] + 1) = v124[2];
  v63 = v108[8];
  a2[20] = v108[7];
  a2[21] = v63;
  v64 = v108[10];
  a2[22] = v108[9];
  a2[23] = v64;
  v65 = v108[4];
  a2[16] = v108[3];
  a2[17] = v65;
  v66 = v108[6];
  a2[18] = v108[5];
  a2[19] = v66;
  v67 = v108[0];
  a2[12] = v107;
  a2[13] = v67;
  v68 = v108[2];
  a2[14] = v108[1];
  a2[15] = v68;
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCEE8);
  sub_24314C1F0(v50, (uint64_t)a2 + *(int *)(v69 + 64), &qword_2543BCEE0);
  sub_243156CE4((uint64_t)&v96, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _WORD))sub_243156A0C);
  sub_243156AF4((uint64_t)&v107);
  sub_24314C174((uint64_t)v84, &qword_2543BCEE0);
  sub_24314C174(v50, &qword_2543BCEE0);
  *(_OWORD *)((char *)&v110[7] + 1) = v124[7];
  *(_OWORD *)((char *)&v110[8] + 1) = v124[8];
  *(_OWORD *)((char *)&v110[9] + 1) = v124[9];
  v110[10] = *(_OWORD *)((char *)&v124[9] + 15);
  *(_OWORD *)((char *)&v110[3] + 1) = v124[3];
  *(_OWORD *)((char *)&v110[4] + 1) = v124[4];
  *(_OWORD *)((char *)&v110[5] + 1) = v124[5];
  *(_OWORD *)((char *)&v110[6] + 1) = v124[6];
  *(_OWORD *)((char *)v110 + 1) = v124[0];
  *(_OWORD *)((char *)&v110[1] + 1) = v124[1];
  *(_QWORD *)&v109 = v61;
  *((_QWORD *)&v109 + 1) = 0x4010000000000000;
  LOBYTE(v110[0]) = v62;
  *(_OWORD *)((char *)&v110[2] + 1) = v124[2];
  sub_243156BEC((uint64_t)&v109);
  v119 = v93;
  v120 = v94;
  v121[0] = v95[0];
  *(_OWORD *)((char *)v121 + 10) = *(_OWORD *)((char *)v95 + 10);
  v115 = v89;
  v116 = v90;
  v117 = v91;
  v118 = v92;
  v111 = v85;
  v112 = v86;
  v113 = v87;
  v114 = v88;
  return sub_243156CE4((uint64_t)&v111, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _WORD))sub_243156D60);
}

uint64_t sub_243151EC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  __int128 v20;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287980);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_243157B4C();
  v6 = sub_243157B04();
  v7 = sub_243157B4C();
  v8 = sub_243157A20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v4, 1, 1, v8);
  v9 = sub_243157A2C();
  sub_24314C174((uint64_t)v4, &qword_257287980);
  KeyPath = swift_getKeyPath();
  sub_243157B88();
  sub_243157864();
  v11 = v16;
  v12 = v17;
  v13 = v18;
  v14 = v19;
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = 0x3FE0000000000000;
  *(_QWORD *)(a1 + 32) = KeyPath;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 56) = 1;
  *(_QWORD *)(a1 + 64) = v11;
  *(_BYTE *)(a1 + 72) = v12;
  *(_QWORD *)(a1 + 80) = v13;
  *(_BYTE *)(a1 + 88) = v14;
  *(_OWORD *)(a1 + 96) = v20;
  swift_retain();
  return swift_release();
}

double sub_243152054@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  double result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  double v31[2];
  _BYTE v32[7];
  char v33;
  _BYTE v34[7];
  char v35;
  _BYTE v36[7];
  _BYTE v37[7];
  _BYTE v38[7];
  _BYTE v39[7];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287980);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243157B88();
  sub_243157864();
  v5 = v21;
  v6 = v22;
  v7 = v23;
  v8 = v24;
  v19 = v26;
  v20 = v25;
  v9 = sub_243157B4C();
  v10 = sub_243157A20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v4, 1, 1, v10);
  v11 = sub_243157A2C();
  sub_24314C174((uint64_t)v4, &qword_257287980);
  KeyPath = swift_getKeyPath();
  sub_243157B88();
  sub_243157864();
  v13 = v27;
  v14 = v29;
  v35 = v28;
  v33 = v30;
  *(_DWORD *)(a1 + 9) = *(_DWORD *)v39;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)&v39[3];
  *(_DWORD *)(a1 + 25) = *(_DWORD *)v38;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)&v38[3];
  *(_DWORD *)(a1 + 44) = *(_DWORD *)&v37[3];
  *(_DWORD *)(a1 + 41) = *(_DWORD *)v37;
  *(_DWORD *)(a1 + 108) = *(_DWORD *)&v36[3];
  *(_DWORD *)(a1 + 105) = *(_DWORD *)v36;
  v15 = v35;
  *(_DWORD *)(a1 + 124) = *(_DWORD *)&v34[3];
  *(_DWORD *)(a1 + 121) = *(_DWORD *)v34;
  v16 = v33;
  *(_DWORD *)(a1 + 137) = *(_DWORD *)v32;
  *(_DWORD *)(a1 + 140) = *(_DWORD *)&v32[3];
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  v17 = v19;
  *(_QWORD *)(a1 + 48) = v20;
  *(_QWORD *)(a1 + 56) = v17;
  *(_QWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = 0x3FE0000000000000;
  *(_QWORD *)(a1 + 80) = KeyPath;
  *(_QWORD *)(a1 + 88) = v11;
  *(_QWORD *)(a1 + 96) = 0;
  *(_BYTE *)(a1 + 104) = 1;
  *(_QWORD *)(a1 + 112) = v13;
  *(_BYTE *)(a1 + 120) = v15;
  *(_QWORD *)(a1 + 128) = v14;
  *(_BYTE *)(a1 + 136) = v16;
  result = v31[0];
  *(_OWORD *)(a1 + 144) = *(_OWORD *)v31;
  return result;
}

uint64_t sub_2431522A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;

  sub_2431524E0(&v33);
  v4 = v33;
  v5 = v35;
  v32 = v36;
  v30 = v34;
  v31 = v37;
  v26 = v38;
  v6 = v39;
  v25 = sub_24315793C();
  sub_243152DDC(a1, &v33);
  v7 = v33;
  v8 = v35;
  v28 = v34;
  v29 = v36;
  KeyPath = swift_getKeyPath();
  v9 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for NotesSharedIndexedSearchView(0) + 32) + 8);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v9 + 40))(ObjectType, v9);
  if (v11)
  {
    sub_24315279C((uint64_t)&v33);
    swift_bridgeObjectRelease();
    v12 = v33;
    v13 = v34;
    v14 = v35;
    v15 = v36;
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }
  LOBYTE(v33) = v5;
  v16 = v4;
  v23 = v4;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v30;
  *(_BYTE *)(a2 + 16) = v5;
  v17 = v5;
  v24 = v5;
  *(_QWORD *)(a2 + 24) = v32;
  *(_QWORD *)(a2 + 32) = v31;
  *(_QWORD *)(a2 + 40) = v26;
  *(_BYTE *)(a2 + 48) = v6;
  *(_QWORD *)(a2 + 56) = v25;
  *(_QWORD *)(a2 + 64) = 0;
  *(_BYTE *)(a2 + 72) = 1;
  *(_QWORD *)(a2 + 80) = v7;
  *(_QWORD *)(a2 + 88) = v28;
  *(_BYTE *)(a2 + 96) = v8;
  *(_QWORD *)(a2 + 104) = v29;
  *(_QWORD *)(a2 + 112) = KeyPath;
  *(_QWORD *)(a2 + 120) = 1;
  *(_BYTE *)(a2 + 128) = 0;
  *(_QWORD *)(a2 + 136) = v12;
  *(_QWORD *)(a2 + 144) = v13;
  *(_QWORD *)(a2 + 152) = v14;
  *(_QWORD *)(a2 + 160) = v15;
  v18 = v12;
  v19 = v13;
  v20 = v14;
  v21 = v15;
  sub_243156BAC(v16, v30, v17);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_243156BAC(v7, v28, v8);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_243156BBC(v18, v19, v20, v21);
  sub_243156CB4(v18, v19, v20, v21);
  sub_243156CA4(v7, v28, v8);
  swift_release();
  swift_bridgeObjectRelease();
  sub_243156CA4(v23, v30, v24);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2431524E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  char v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t KeyPath;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;

  v42 = a1;
  v2 = type metadata accessor for NotesSharedIndexedSearchView(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24315775C();
  v43 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v40 - v9;
  v11 = *(id *)v1;
  v12 = *(_BYTE *)(v1 + 8);
  sub_2431554D8(*(id *)v1, v12);
  v13 = sub_243153E88(v11, v12);
  sub_243153E6C(v11, v12);
  v14 = objc_msgSend(v13, sel_displayName);

  if (!v14)
  {
    sub_243157310(v1, (uint64_t)v4, type metadata accessor for NotesSharedIndexedSearchView);
LABEL_5:
    v15 = *(_QWORD *)&v4[*(int *)(v2 + 52)];
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  v15 = sub_243157BE8();
  v17 = v16;

  sub_243157310(v1, (uint64_t)v4, type metadata accessor for NotesSharedIndexedSearchView);
  if (!v17)
    goto LABEL_5;
LABEL_6:
  sub_243157354((uint64_t)v4, type metadata accessor for NotesSharedIndexedSearchView);
  v18 = sub_243157B1C();
  sub_243152970(v15, v18, (uint64_t)v10);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v8, v10, v5);
  v19 = sub_243157AB0();
  v21 = v20;
  v23 = v22 & 1;
  sub_243157A44();
  v24 = sub_243157A98();
  v26 = v25;
  v28 = v27;
  v41 = v5;
  swift_release();
  sub_243156CA4(v19, v21, v23);
  swift_bridgeObjectRelease();
  v29 = sub_243157A8C();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  sub_243156CA4(v24, v26, v28 & 1);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v37 = v41;
  v38 = v42;
  *v42 = v29;
  v38[1] = v31;
  *((_BYTE *)v38 + 16) = v33 & 1;
  v38[3] = v35;
  v38[4] = KeyPath;
  v38[5] = 1;
  *((_BYTE *)v38 + 48) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v10, v37);
}

uint64_t sub_24315279C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;

  v2 = sub_243157984();
  MEMORY[0x24BDAC7A8](v2);
  sub_243157978();
  sub_24315796C();
  sub_243157B4C();
  sub_243157954();
  swift_release();
  sub_24315796C();
  sub_243157960();
  sub_24315796C();
  sub_24315799C();
  v3 = sub_243157AA4();
  v5 = v4;
  v7 = v6 & 1;
  sub_243157A38();
  v8 = sub_243157A98();
  v10 = v9;
  v12 = v11;
  swift_release();
  v13 = v12 & 1;
  sub_243156CA4(v3, v5, v7);
  swift_bridgeObjectRelease();
  sub_243157B28();
  v14 = sub_243157A74();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  swift_release();
  sub_243156CA4(v8, v10, v13);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v14;
  *(_QWORD *)(a1 + 8) = v16;
  *(_BYTE *)(a1 + 16) = v18 & 1;
  *(_QWORD *)(a1 + 24) = v20;
  return result;
}

uint64_t sub_243152970@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD *, _QWORD);
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t KeyPath;
  _QWORD v46[5];

  v4 = v3;
  v42 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCD80);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24315775C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF90);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCF88);
  v18 = *(_QWORD *)(v17 - 8);
  v43 = v17;
  v44 = v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v41 = (uint64_t)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v40 = (uint64_t)&v39 - v21;
  v22 = sub_24315778C();
  MEMORY[0x24BDAC7A8](v22);
  swift_bridgeObjectRetain();
  sub_243157780();
  sub_243157768();
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  v46[0] = a2;
  v23 = sub_24315744C();
  swift_retain();
  v39 = v23;
  sub_243157750();
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v42 = a3;
  v24(v13, a3, v10);
  v25 = *(_QWORD *)(v4 + 16);
  v26 = *(_QWORD *)(v4 + 24);
  LOBYTE(a2) = *(_BYTE *)(v4 + 32);
  sub_2431554E4(v25, v26, a2);
  v27 = sub_24315403C(v25, v26, a2);
  v29 = v28;
  sub_243153E78(v25, v26, a2);
  v46[0] = v27;
  v46[1] = v29;
  v30 = sub_2431577F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v9, 1, 1, v30);
  sub_24314C1B0(&qword_2543BCD78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC588]);
  sub_2431573EC();
  sub_2431577B0();
  v31 = v43;
  sub_24314C174((uint64_t)v9, &qword_2543BCD80);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v16, 1, v31) == 1)
  {
    v32 = &qword_2543BCF90;
    v33 = (uint64_t)v16;
  }
  else
  {
    v34 = v40;
    sub_243157528((uint64_t)v16, v40, &qword_2543BCF88);
    v35 = v41;
    sub_24314C1F0(v34, v41, &qword_2543BCF88);
    v36 = swift_getKeyPath();
    *(&v39 - 2) = MEMORY[0x24BDAC7A8](v36);
    swift_getKeyPath();
    v46[4] = sub_243157B04();
    sub_2431576E4(&qword_2543BCF98, &qword_2543BCF88, MEMORY[0x24BEE1BC0]);
    v37 = (void (*)(_QWORD *, _QWORD))sub_243157774();
    sub_243157798();
    v37(v46, 0);
    sub_24314C174(v35, &qword_2543BCF88);
    v33 = v34;
    v32 = &qword_2543BCF88;
  }
  return sub_24314C174(v33, v32);
}

uint64_t sub_243152D84()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257287988);
  return sub_243157BD0() & 1;
}

uint64_t sub_243152DDC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  id v42;
  char v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char v68;
  uint64_t result;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  _QWORD *v78;
  uint64_t v79;
  unint64_t v80;

  v4 = type metadata accessor for NotesSharedIndexedSearchView(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24315775C();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD038);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = v4;
  v13 = *(_QWORD *)(a1 + *(int *)(v4 + 32) + 8);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v13 + 24))(ObjectType, v13);
  v15 = sub_2431577EC();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v12, 1, v15);
  v77 = v9;
  v78 = a2;
  v76 = v6;
  if (v17 == 1)
  {
    sub_24314C174((uint64_t)v12, &qword_2543BD038);
    v18 = 0;
    v19 = 0xE000000000000000;
  }
  else
  {
    v18 = sub_2431577D4();
    v19 = v20;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v15);
  }
  v79 = v18;
  v80 = v19;
  sub_2431573EC();
  v21 = sub_243157ABC();
  v23 = v22;
  v25 = v24 & 1;
  sub_243157A14();
  v26 = sub_243157A98();
  v28 = v27;
  v30 = v29;
  swift_release();
  v31 = v30 & 1;
  sub_243156CA4(v21, v23, v25);
  swift_bridgeObjectRelease();
  sub_243157990();
  v32 = sub_243157AA4();
  v34 = v33;
  v36 = v35 & 1;
  v37 = sub_243157A80();
  v73 = v38;
  v74 = v37;
  v40 = v39;
  v75 = v41;
  sub_243156CA4(v32, v34, v36);
  swift_bridgeObjectRelease();
  sub_243156CA4(v26, v28, v31);
  swift_bridgeObjectRelease();
  v42 = *(id *)a1;
  v43 = *(_BYTE *)(a1 + 8);
  sub_2431554D8(*(id *)a1, v43);
  v44 = sub_243153E88(v42, v43);
  sub_243153E6C(v42, v43);
  v45 = objc_msgSend(v44, sel_contentDescription);

  if (!v45)
  {
    v49 = (uint64_t)v76;
    sub_243157310(a1, (uint64_t)v76, type metadata accessor for NotesSharedIndexedSearchView);
    v50 = (uint64_t)v77;
LABEL_8:
    v46 = *(_QWORD *)(v49 + *(int *)(v72 + 56));
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
  v46 = sub_243157BE8();
  v48 = v47;

  v49 = (uint64_t)v76;
  sub_243157310(a1, (uint64_t)v76, type metadata accessor for NotesSharedIndexedSearchView);
  v50 = (uint64_t)v77;
  if (!v48)
    goto LABEL_8;
LABEL_9:
  LODWORD(v72) = v40 & 1;
  sub_243157354(v49, type metadata accessor for NotesSharedIndexedSearchView);
  v51 = sub_243157B28();
  sub_243152970(v46, v51, v50);
  swift_bridgeObjectRelease();
  swift_release();
  v52 = sub_243157AB0();
  v54 = v53;
  v56 = v55 & 1;
  sub_243157A14();
  v57 = sub_243157A98();
  v59 = v58;
  v61 = v60;
  swift_release();
  sub_243156CA4(v52, v54, v56);
  swift_bridgeObjectRelease();
  v62 = v73;
  v63 = v74;
  LOBYTE(v52) = v72;
  v76 = (char *)sub_243157A80();
  v77 = v64;
  v66 = v65;
  v68 = v67;
  sub_243156CA4(v57, v59, v61 & 1);
  swift_bridgeObjectRelease();
  sub_243156CA4(v63, v62, v52);
  result = swift_bridgeObjectRelease();
  v70 = v78;
  *v78 = v76;
  v70[1] = v66;
  *((_BYTE *)v70 + 16) = v68 & 1;
  v70[3] = v77;
  return result;
}

uint64_t sub_24315327C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t ObjectType;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD v23[2];

  v23[1] = a2;
  v3 = type metadata accessor for NotesSharedIndexedSearchView(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v23 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2543BD0C0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v23 - v14;
  v16 = *(_QWORD *)(a1 + *(int *)(v3 + 32) + 8);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v16 + 48))(ObjectType, v16);
  sub_243157310(a1, (uint64_t)v9, type metadata accessor for NotesSharedIndexedSearchView);
  v18 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v19 = swift_allocObject();
  sub_243156EB8((uint64_t)v9, v19 + v18);
  sub_243157310(a1, (uint64_t)v7, type metadata accessor for NotesSharedIndexedSearchView);
  v20 = swift_allocObject();
  sub_243156EB8((uint64_t)v7, v20 + v18);
  sub_24314C1F0((uint64_t)v15, (uint64_t)v13, qword_2543BD0C0);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = sub_243156EFC;
  v21[3] = v19;
  v21[4] = sub_243157098;
  v21[5] = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCEC8);
  sub_24315710C();
  sub_243157810();
  return sub_24314C174((uint64_t)v15, qword_2543BD0C0);
}

uint64_t sub_2431534A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v22)(void);
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t v35;

  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCDA0);
  MEMORY[0x24BDAC7A8](v29);
  v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_243157894();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (_OWORD *)((char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_243157B58();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDF3FD0], v7);
  v11 = sub_243157B64();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  type metadata accessor for NotesSharedIndexedSearchView(0);
  sub_243157B88();
  sub_243157864();
  v12 = v30;
  LOBYTE(v7) = v31;
  v13 = v32;
  v28 = v33;
  v26 = v35;
  v27 = v34;
  v14 = (char *)v6 + *(int *)(v4 + 20);
  v15 = *MEMORY[0x24BDEEB68];
  v16 = sub_2431579A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  __asm { FMOV            V0.2D, #5.0 }
  *v6 = _Q0;
  v22 = MEMORY[0x24BDED998];
  sub_243157310((uint64_t)v6, (uint64_t)v3, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)&v3[*(int *)(v29 + 36)] = 256;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE60);
  sub_24314C1F0((uint64_t)v3, a1 + *(int *)(v23 + 36), &qword_2543BCDA0);
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + 8) = v12;
  *(_BYTE *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v13;
  *(_BYTE *)(a1 + 32) = v28;
  v24 = v26;
  *(_QWORD *)(a1 + 40) = v27;
  *(_QWORD *)(a1 + 48) = v24;
  swift_retain();
  sub_24314C174((uint64_t)v3, &qword_2543BCDA0);
  sub_243157354((uint64_t)v6, (uint64_t (*)(_QWORD))v22);
  return swift_release();
}

uint64_t sub_243153710@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v22)(void);
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;

  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCDA0);
  MEMORY[0x24BDAC7A8](v29);
  v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_243157894();
  MEMORY[0x24BDAC7A8](v28);
  v5 = (_OWORD *)((char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_243157B58();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243157B4C();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDF3FD0], v6);
  v10 = sub_243157B64();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  type metadata accessor for NotesSharedIndexedSearchView(0);
  sub_243157B88();
  sub_243157864();
  v11 = v30;
  LOBYTE(v6) = v31;
  v12 = v32;
  v13 = v33;
  v26 = v35;
  v27 = v34;
  v14 = (char *)v5 + *(int *)(v28 + 20);
  v15 = *MEMORY[0x24BDEEB68];
  v16 = sub_2431579A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  __asm { FMOV            V0.2D, #5.0 }
  *v5 = _Q0;
  v22 = MEMORY[0x24BDED998];
  sub_243157310((uint64_t)v5, (uint64_t)v3, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)&v3[*(int *)(v29 + 36)] = 256;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE60);
  sub_24314C1F0((uint64_t)v3, a1 + *(int *)(v23 + 36), &qword_2543BCDA0);
  *(_QWORD *)a1 = v10;
  *(_QWORD *)(a1 + 8) = v11;
  *(_BYTE *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v12;
  *(_BYTE *)(a1 + 32) = v13;
  v24 = v26;
  *(_QWORD *)(a1 + 40) = v27;
  *(_QWORD *)(a1 + 48) = v24;
  swift_retain();
  sub_24314C174((uint64_t)v3, &qword_2543BCDA0);
  sub_243157354((uint64_t)v5, (uint64_t (*)(_QWORD))v22);
  return swift_release();
}

uint64_t sub_24315399C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return NotesSharedIndexedSearchView.init(from:)(a1, a2);
}

uint64_t sub_2431539B0(_QWORD *a1)
{
  return NotesSharedIndexedSearchView.encode(to:)(a1);
}

uint64_t sub_2431539C8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double *v13;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCDD8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCEF0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v6, a1, v7);
  v8 = &v6[*(int *)(v4 + 36)];
  *(_QWORD *)v8 = 0;
  *((_WORD *)v8 + 4) = 257;
  sub_243157870();
  v10 = v9 * 0.5;
  sub_243157870();
  v12 = v11 * 0.5;
  sub_24314C1F0((uint64_t)v6, a2, &qword_2543BCDD8);
  v13 = (double *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE18) + 36));
  *v13 = v10;
  v13[1] = v12;
  return sub_24314C174((uint64_t)v6, &qword_2543BCDD8);
}

uint64_t sub_243153AD0()
{
  return sub_243157858();
}

uint64_t sub_243153AE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCEF0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(_QWORD *)a2 = sub_2431568CC;
  *(_QWORD *)(a2 + 8) = v8;
  *(_QWORD *)(a2 + 16) = 0x3FF0000000000000;
  *(_WORD *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_243153BC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2431578AC();
  *a1 = result;
  return result;
}

uint64_t sub_243153BEC(id *a1)
{
  id v1;

  v1 = *a1;
  return sub_2431578B8();
}

uint64_t sub_243153C14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2431578C4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_243153C3C()
{
  swift_bridgeObjectRetain();
  return sub_2431578D0();
}

uint64_t type metadata accessor for NotesSharedIndexedSearchView(uint64_t a1)
{
  return sub_243153DB0(a1, (uint64_t *)&unk_2543BCFE8);
}

uint64_t sub_243153C8C()
{
  return sub_2431578DC();
}

uint64_t sub_243153CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2431549F8(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDFBAE8], MEMORY[0x24BDFBB50]);
}

uint64_t sub_243153CD0()
{
  return sub_2431578E8();
}

uint64_t sub_243153CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2431549F8(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDEB418], MEMORY[0x24BDEDEF8]);
}

uint64_t sub_243153D14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_243153D58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 24))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for NotesIndexSharedModel(uint64_t a1)
{
  return sub_243153DB0(a1, (uint64_t *)&unk_2543BD080);
}

uint64_t sub_243153DB0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_243153DE4()
{
  unint64_t result;

  result = qword_2543BD048;
  if (!qword_2543BD048)
  {
    result = MEMORY[0x2494F3E50](&unk_2431589B0, &type metadata for NotesIndexSharedModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2543BD048);
  }
  return result;
}

unint64_t sub_243153E28()
{
  unint64_t result;

  result = qword_2543BD090;
  if (!qword_2543BD090)
  {
    result = MEMORY[0x2494F3E50](&unk_243158960, &type metadata for NotesSharedIndexedSearchView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2543BD090);
  }
  return result;
}

void sub_243153E6C(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_release();
}

uint64_t sub_243153E78(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  else
    return swift_release();
}

id sub_243153E88(void *a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  os_log_type_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v15;
  uint64_t v16;

  v15 = a1;
  v3 = sub_243157930();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return v15;
  swift_retain();
  v7 = sub_243157C24();
  v8 = sub_2431579D8();
  v9 = v7;
  if (os_log_type_enabled(v8, v7))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v16 = v11;
    *(_DWORD *)v10 = 136315138;
    sub_24315756C();
    v12 = sub_243157D5C();
    *(_QWORD *)(v10 + 4) = sub_243154594(v12, v13, &v16);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243149000, v8, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2494F3EB0](v11, -1, -1);
    MEMORY[0x2494F3EB0](v10, -1, -1);
  }

  sub_243157924();
  swift_getAtKeyPath();
  sub_243153E6C(v15, 0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (id)v16;
}

uint64_t sub_24315403C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  os_log_type_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v6 = sub_243157930();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 1) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    v10 = sub_243157C24();
    v11 = sub_2431579D8();
    if (os_log_type_enabled(v11, v10))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      v15 = v13;
      *(_DWORD *)v12 = 136315138;
      *(_QWORD *)(v12 + 4) = sub_243154594(0x676E69727453, 0xE600000000000000, &v15);
      _os_log_impl(&dword_243149000, v11, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2494F3EB0](v13, -1, -1);
      MEMORY[0x2494F3EB0](v12, -1, -1);
    }

    sub_243157924();
    swift_getAtKeyPath();
    sub_243153E78(a1, a2, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v15;
  }
  return a1;
}

uint64_t sub_2431541E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_243157930();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD008);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24314C1F0(v2, (uint64_t)v10, &qword_2543BD008);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_243157828();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_243157C24();
    v14 = sub_2431579D8();
    if (os_log_type_enabled(v14, v13))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      *(_QWORD *)(v15 + 4) = sub_243154594(0x686353726F6C6F43, 0xEB00000000656D65, &v18);
      _os_log_impl(&dword_243149000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2494F3EB0](v16, -1, -1);
      MEMORY[0x2494F3EB0](v15, -1, -1);
    }

    sub_243157924();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2431543FC@<X0>(void (*a1)(void)@<X1>, void (*a2)(void)@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];

  v12[1] = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCEA8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCE60);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_243157888())
  {
    a1();
    sub_24314C1F0((uint64_t)v10, (uint64_t)v7, &qword_2543BCE60);
    swift_storeEnumTagMultiPayload();
    sub_243157170();
    sub_2431579CC();
    swift_release();
  }
  else
  {
    a2();
    sub_24314C1F0((uint64_t)v10, (uint64_t)v7, &qword_2543BCE60);
    swift_storeEnumTagMultiPayload();
    sub_243157170();
    sub_2431579CC();
  }
  return sub_24314C174((uint64_t)v10, &qword_2543BCE60);
}

unint64_t sub_243154594(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_243154664(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24315691C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_24315691C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

unint64_t sub_243154664(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_243154760(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_243157C78();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_243154760(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2431547F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2431548F0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2431548F0((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2431547F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_24315488C(v2, 0);
      result = sub_243157C6C();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_243157BF4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_24315488C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257287970);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2431548F0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257287970);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2431549D8()
{
  return sub_2431578E8();
}

uint64_t sub_2431549F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_243154A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2431549F8(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDEB418], MEMORY[0x24BDEDEF8]);
}

uint64_t sub_243154A98(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_24314C1B0((unint64_t *)&unk_2543BD068, type metadata accessor for NotesIndexSharedModel, (uint64_t)&protocol conformance descriptor for NotesIndexSharedModel);
  result = sub_24314C1B0(&qword_2543BD060, type metadata accessor for NotesIndexSharedModel, (uint64_t)&protocol conformance descriptor for NotesIndexSharedModel);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_243154AF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_243154B04()
{
  return sub_24314C1B0(&qword_2543BD0B8, type metadata accessor for NotesSharedIndexedSearchView, (uint64_t)&protocol conformance descriptor for NotesSharedIndexedSearchView);
}

uint64_t sub_243154B30()
{
  return sub_24314C1B0(&qword_2543BD0B0, type metadata accessor for NotesSharedIndexedSearchView, (uint64_t)&protocol conformance descriptor for NotesSharedIndexedSearchView);
}

uint64_t sub_243154B5C()
{
  return sub_24314C1B0(&qword_2543BD0A8, type metadata accessor for NotesSharedIndexedSearchView, (uint64_t)&protocol conformance descriptor for NotesSharedIndexedSearchView);
}

uint64_t sub_243154B88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_243154B98@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_17Tm(a1, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date, &qword_2543BD038, a2);
}

uint64_t sub_243154BAC(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_24314E924(a1, a2, a3, a4, &qword_2543BD038, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_date);
}

uint64_t sub_243154BD0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_19Tm(a1, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_showCollaboratorBadge, a2);
}

uint64_t sub_243154BDC(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_20Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_showCollaboratorBadge);
}

uint64_t sub_243154BE8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_notesFolder);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_243154C40@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_17Tm(a1, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL, qword_2543BD0C0, a2);
}

uint64_t keypath_get_17Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, uint64_t *a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v6;

  v6 = *a1 + *a2;
  swift_beginAccess();
  return sub_24314C1F0(v6, a4, a3);
}

uint64_t sub_243154CB4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_24314E924(a1, a2, a3, a4, qword_2543BD0C0, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_attachmentURL);
}

uint64_t sub_243154CD8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_19Tm(a1, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges, a2);
}

uint64_t keypath_get_19Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _BYTE *a3@<X8>)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_243154D30(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_20Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC15NotesUIServices21NotesIndexSharedModel_hasUnreadChanges);
}

uint64_t keypath_set_20Tm(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_BYTE *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t dispatch thunk of NotesIndexModeling.date.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NotesIndexModeling.showCollaboratorBadge.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of NotesIndexModeling.notesFolder.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of NotesIndexModeling.attachmentURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of NotesIndexModeling.hasUnreadChanges.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_243154DAC()
{
  return type metadata accessor for NotesIndexSharedModel(0);
}

void sub_243154DB4()
{
  unint64_t v0;
  unint64_t v1;

  sub_243155FFC(319, &qword_2543BD040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
  {
    sub_243155FFC(319, (unint64_t *)&unk_2543BD028, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BEE1C68]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for NotesIndexSharedModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NotesIndexSharedModel.date.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.date.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.date.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.showCollaboratorBadge.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.showCollaboratorBadge.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.showCollaboratorBadge.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.notesFolder.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.notesFolder.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.notesFolder.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.attachmentURL.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.attachmentURL.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.attachmentURL.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.hasUnreadChanges.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.hasUnreadChanges.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.hasUnreadChanges.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.__allocating_init(date:showCollaboratorBadge:notesFolder:attachmentURL:hasUnreadChanges:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of NotesIndexSharedModel.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t destroy for NotesYellowHeaderView()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for NotesYellowHeaderView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for NotesYellowHeaderView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NotesYellowHeaderView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesYellowHeaderView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NotesYellowHeaderView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NotesYellowHeaderView()
{
  return &type metadata for NotesYellowHeaderView;
}

char *initializeBufferWithCopyOfBuffer for NotesSharedIndexedSearchView(char *a1, char **a2, int *a3)
{
  int v5;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  _QWORD *v31;
  uint64_t v32;
  id v33;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v16[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = *((_BYTE *)a2 + 8);
    sub_2431554D8(*a2, v8);
    *(_QWORD *)a1 = v7;
    a1[8] = v8;
    v9 = (uint64_t)a2[2];
    v10 = (uint64_t)a2[3];
    v11 = *((_BYTE *)a2 + 32);
    sub_2431554E4(v9, v10, v11);
    *((_QWORD *)a1 + 2) = v9;
    *((_QWORD *)a1 + 3) = v10;
    a1[32] = v11;
    v12 = a3[6];
    v13 = &a1[v12];
    v14 = (char **)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFF8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_243157804();
      (*(void (**)(char *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *(_QWORD *)v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v17 = a3[7];
    v18 = &a1[v17];
    v19 = (char **)((char *)a2 + v17);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD008);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v20 = sub_243157828();
      (*(void (**)(char *, _QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *(_QWORD *)v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v21 = a3[8];
    v22 = a3[9];
    v23 = *(_OWORD *)((char *)a2 + v21);
    *(_OWORD *)&a1[v21] = v23;
    *(_QWORD *)&a1[v22] = *(char **)((char *)a2 + v22);
    v24 = a3[11];
    *(_QWORD *)&a1[a3[10]] = *(char **)((char *)a2 + a3[10]);
    *(_QWORD *)&a1[v24] = *(char **)((char *)a2 + v24);
    v25 = a3[13];
    *(_QWORD *)&a1[a3[12]] = *(char **)((char *)a2 + a3[12]);
    v26 = &a1[v25];
    v27 = (char **)((char *)a2 + v25);
    v28 = v27[1];
    *(_QWORD *)v26 = *v27;
    *((_QWORD *)v26 + 1) = v28;
    v29 = a3[14];
    v30 = &a1[v29];
    v31 = (char **)((char *)a2 + v29);
    v32 = v31[1];
    *(_QWORD *)v30 = *v31;
    *((_QWORD *)v30 + 1) = v32;
    v33 = (id)v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

id sub_2431554D8(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_retain();
}

uint64_t sub_2431554E4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  else
    return swift_retain();
}

uint64_t destroy for NotesSharedIndexedSearchView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_243153E6C(*(id *)a1, *(_BYTE *)(a1 + 8));
  sub_243153E78(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  v4 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFF8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_243157804();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v6 = a1 + a2[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD008);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_243157828();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NotesSharedIndexedSearchView(uint64_t a1, uint64_t a2, int *a3)
{
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  id v31;

  v6 = *(id *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_2431554D8(*(id *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_BYTE *)(a2 + 32);
  sub_2431554E4(v8, v9, v10);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  *(_BYTE *)(a1 + 32) = v10;
  v11 = a3[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFF8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_243157804();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v15 = a3[7];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD008);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = sub_243157828();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    *v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v19 = a3[8];
  v20 = a3[9];
  v21 = *(_OWORD *)(a2 + v19);
  *(_OWORD *)(a1 + v19) = v21;
  *(_QWORD *)(a1 + v20) = *(_QWORD *)(a2 + v20);
  v22 = a3[11];
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v22) = *(_QWORD *)(a2 + v22);
  v23 = a3[13];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  v24 = (_QWORD *)(a1 + v23);
  v25 = (_QWORD *)(a2 + v23);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  v27 = a3[14];
  v28 = (_QWORD *)(a1 + v27);
  v29 = (_QWORD *)(a2 + v27);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v31 = (id)v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NotesSharedIndexedSearchView(uint64_t a1, uint64_t a2, int *a3)
{
  id v6;
  char v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;

  v6 = *(id *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_2431554D8(*(id *)a2, v7);
  v8 = *(void **)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_243153E6C(v8, v9);
  v10 = *(_QWORD *)(a2 + 16);
  v11 = *(_QWORD *)(a2 + 24);
  v12 = *(_BYTE *)(a2 + 32);
  sub_2431554E4(v10, v11, v12);
  v13 = *(_QWORD *)(a1 + 16);
  v14 = *(_QWORD *)(a1 + 24);
  v15 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 24) = v11;
  *(_BYTE *)(a1 + 32) = v12;
  sub_243153E78(v13, v14, v15);
  if (a1 != a2)
  {
    v16 = a3[6];
    v17 = (_QWORD *)(a1 + v16);
    v18 = (_QWORD *)(a2 + v16);
    sub_24314C174(a1 + v16, &qword_2543BCFF8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFF8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_243157804();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v20 = a3[7];
    v21 = (_QWORD *)(a1 + v20);
    v22 = (_QWORD *)(a2 + v20);
    sub_24314C174(a1 + v20, &qword_2543BD008);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD008);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v23 = sub_243157828();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      *v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v24 = a3[8];
  v25 = a1 + v24;
  v26 = a2 + v24;
  v27 = *(void **)v26;
  v28 = *(_QWORD *)(v26 + 8);
  v29 = *(void **)v25;
  *(_QWORD *)v25 = *(_QWORD *)v26;
  v30 = v27;

  *(_QWORD *)(v25 + 8) = v28;
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  v31 = a3[13];
  v32 = (_QWORD *)(a1 + v31);
  v33 = (_QWORD *)(a2 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = a3[14];
  v35 = (_QWORD *)(a1 + v34);
  v36 = (_QWORD *)(a2 + v34);
  *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for NotesSharedIndexedSearchView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFF8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_243157804();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[7];
  v12 = (void *)(a1 + v11);
  v13 = (const void *)(a2 + v11);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD008);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_243157828();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  v16 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);
  v17 = a3[11];
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  v18 = a3[13];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_OWORD *)(a1 + v18) = *(_OWORD *)(a2 + v18);
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  return a1;
}

uint64_t assignWithTake for NotesSharedIndexedSearchView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char v7;
  void *v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(void **)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_243153E6C(v8, v9);
  v10 = *((_BYTE *)a2 + 32);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_BYTE *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(_BYTE *)(a1 + 32) = v10;
  sub_243153E78(v11, v12, v13);
  if ((uint64_t *)a1 != a2)
  {
    v14 = a3[6];
    v15 = (void *)(a1 + v14);
    v16 = (char *)a2 + v14;
    sub_24314C174(a1 + v14, &qword_2543BCFF8);
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFF8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v18 = sub_243157804();
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v15, v16, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    v19 = a3[7];
    v20 = (void *)(a1 + v19);
    v21 = (char *)a2 + v19;
    sub_24314C174(a1 + v19, &qword_2543BD008);
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD008);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v23 = sub_243157828();
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v20, v21, v23);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
  }
  v24 = a3[8];
  v25 = a1 + v24;
  v26 = (uint64_t *)((char *)a2 + v24);
  v27 = *v26;
  v28 = v26[1];
  v29 = *(void **)v25;
  *(_QWORD *)v25 = v27;

  *(_QWORD *)(v25 + 8) = v28;
  v30 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
  *(_QWORD *)(a1 + v30) = *(uint64_t *)((char *)a2 + v30);
  v31 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
  *(_QWORD *)(a1 + v31) = *(uint64_t *)((char *)a2 + v31);
  v32 = a3[13];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (uint64_t *)((char *)a2 + v32);
  v36 = *v34;
  v35 = v34[1];
  *v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  v37 = a3[14];
  v38 = (_QWORD *)(a1 + v37);
  v39 = (uint64_t *)((char *)a2 + v37);
  v41 = *v39;
  v40 = v39[1];
  *v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesSharedIndexedSearchView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_243155DB4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287950);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287958);
  v7 = *(_QWORD *)(v10 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v10;
    v9 = a3[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v12 = *(_QWORD *)(a1 + a3[8]);
  if (v12 >= 0xFFFFFFFF)
    LODWORD(v12) = -1;
  return (v12 + 1);
}

uint64_t storeEnumTagSinglePayload for NotesSharedIndexedSearchView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_243155E6C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287950);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = a4[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_257287958);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  *(_QWORD *)(a1 + a4[8]) = (a2 - 1);
  return result;
}

void sub_243155F14()
{
  unint64_t v0;
  unint64_t v1;

  sub_243155FFC(319, &qword_2543BD000, (uint64_t (*)(uint64_t))MEMORY[0x24BDFBAE8], MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_243155FFC(319, &qword_2543BD010, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_243155FFC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_243156054()
{
  return sub_2431576E4(&qword_2543BCF60, &qword_2543BCF68, MEMORY[0x24BDF4700]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494F3E44](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2431560C8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2543BCE40;
  if (!qword_2543BCE40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543BCE48);
    v2[0] = sub_24315614C();
    v2[1] = sub_2431576E4(&qword_2543BCEF8, &qword_2543BCF00, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2494F3E50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2543BCE40);
  }
  return result;
}

unint64_t sub_24315614C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2543BCE08;
  if (!qword_2543BCE08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543BCE10);
    v2[0] = sub_2431576E4(&qword_2543BCF30, &qword_2543BCF38, MEMORY[0x24BDF4700]);
    v2[1] = sub_2431576E4(&qword_2543BCE98, &qword_2543BCEA0, MEMORY[0x24BDEF370]);
    result = MEMORY[0x2494F3E50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2543BCE08);
  }
  return result;
}

ValueMetadata *type metadata accessor for SquareCropModifier()
{
  return &type metadata for SquareCropModifier;
}

uint64_t getEnumTagSinglePayload for NotesSharedIndexedSearchView.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NotesSharedIndexedSearchView.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24315628C + 4 * byte_2431583C5[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2431562AC + 4 * byte_2431583CA[v4]))();
}

_BYTE *sub_24315628C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2431562AC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2431562B4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2431562BC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2431562C4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2431562CC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2431562D8()
{
  return 0;
}

ValueMetadata *type metadata accessor for NotesSharedIndexedSearchView.CodingKeys()
{
  return &type metadata for NotesSharedIndexedSearchView.CodingKeys;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NotesIndexSharedModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NotesIndexSharedModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_2431563D8 + 4 * byte_2431583D4[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24315640C + 4 * byte_2431583CF[v4]))();
}

uint64_t sub_24315640C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_243156414(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24315641CLL);
  return result;
}

uint64_t sub_243156428(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x243156430);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_243156434(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24315643C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_243156448(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_243156450(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NotesIndexSharedModel.CodingKeys()
{
  return &type metadata for NotesIndexSharedModel.CodingKeys;
}

unint64_t sub_24315646C()
{
  unint64_t result;

  result = qword_257287960;
  if (!qword_257287960)
  {
    result = MEMORY[0x2494F3E50](&unk_243158830, &type metadata for NotesIndexSharedModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257287960);
  }
  return result;
}

unint64_t sub_2431564B4()
{
  unint64_t result;

  result = qword_257287968;
  if (!qword_257287968)
  {
    result = MEMORY[0x2494F3E50](&unk_2431588E8, &type metadata for NotesSharedIndexedSearchView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257287968);
  }
  return result;
}

uint64_t sub_2431564F8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24315650C()
{
  unint64_t result;

  result = qword_2543BD0A0;
  if (!qword_2543BD0A0)
  {
    result = MEMORY[0x2494F3E50](&unk_243158858, &type metadata for NotesSharedIndexedSearchView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2543BD0A0);
  }
  return result;
}

unint64_t sub_243156554()
{
  unint64_t result;

  result = qword_2543BD098;
  if (!qword_2543BD098)
  {
    result = MEMORY[0x2494F3E50](&unk_243158880, &type metadata for NotesSharedIndexedSearchView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2543BD098);
  }
  return result;
}

unint64_t sub_24315659C()
{
  unint64_t result;

  result = qword_2543BD058;
  if (!qword_2543BD058)
  {
    result = MEMORY[0x2494F3E50](&unk_2431587A0, &type metadata for NotesIndexSharedModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2543BD058);
  }
  return result;
}

unint64_t sub_2431565E4()
{
  unint64_t result;

  result = qword_2543BD050;
  if (!qword_2543BD050)
  {
    result = MEMORY[0x2494F3E50](&unk_2431587C8, &type metadata for NotesIndexSharedModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2543BD050);
  }
  return result;
}

uint64_t sub_243156628(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_243157CFC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000243158F30 || (sub_243157CFC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6F467365746F6ELL && a2 == 0xEB00000000726564 || (sub_243157CFC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656D686361747461 && a2 == 0xED00004C5255746ELL || (sub_243157CFC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000243158F60)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_243157CFC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_243156868()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCEF0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2431568CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2543BCEF0) - 8) + 80);
  return sub_2431539C8(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_24315691C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24315695C(uint64_t result)
{
  *(_BYTE *)(result + 185) = 1;
  return result;
}

unint64_t sub_243156968()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2543BCED0;
  if (!qword_2543BCED0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543BCED8);
    v2 = MEMORY[0x24BDF4700];
    v3[0] = sub_2431576E4(&qword_2543BCF40, &qword_2543BCF48, MEMORY[0x24BDF4700]);
    v3[1] = sub_2431576E4(&qword_2543BCF50, &qword_2543BCF58, v2);
    result = MEMORY[0x2494F3E50](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2543BCED0);
  }
  return result;
}

uint64_t sub_243156A0C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,char a25)
{
  if ((a25 & 1) == 0)
    return sub_243156A8C(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24 & 1);
  return result;
}

uint64_t sub_243156A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if ((a24 & 1) == 0)
  {
    swift_retain();
    swift_retain();
  }
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_243156AF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 104);
  v3 = *(_QWORD *)(a1 + 112);
  v4 = *(_BYTE *)(a1 + 120);
  v5 = *(_QWORD *)(a1 + 160);
  v6 = *(_QWORD *)(a1 + 168);
  v8 = *(_QWORD *)(a1 + 184);
  v9 = *(_QWORD *)(a1 + 176);
  sub_243156BAC(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_243156BAC(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_243156BBC(v5, v6, v9, v8);
  return a1;
}

uint64_t sub_243156BAC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_243156BBC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_243156BAC(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_243156BEC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 104);
  v3 = *(_QWORD *)(a1 + 112);
  v4 = *(_BYTE *)(a1 + 120);
  v5 = *(_QWORD *)(a1 + 160);
  v6 = *(_QWORD *)(a1 + 168);
  v8 = *(_QWORD *)(a1 + 184);
  v9 = *(_QWORD *)(a1 + 176);
  sub_243156CA4(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  sub_243156CA4(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  sub_243156CB4(v5, v6, v9, v8);
  return a1;
}

uint64_t sub_243156CA4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_243156CB4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_243156CA4(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_243156CE4(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _WORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_WORD *)(a1 + 184));
  return a1;
}

uint64_t sub_243156D60(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,char a25)
{
  if ((a25 & 1) == 0)
    return sub_243156DE0(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24 & 1);
  return result;
}

uint64_t sub_243156DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if ((a24 & 1) == 0)
  {
    swift_release();
    swift_release();
  }
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_243156E48(uint64_t result)
{
  *(_BYTE *)(result + 184) = 1;
  return result;
}

uint64_t sub_243156E54(uint64_t result)
{
  *(_BYTE *)(result + 185) = 0;
  return result;
}

uint64_t sub_243156E5C(uint64_t result)
{
  *(_BYTE *)(result + 184) = 0;
  return result;
}

uint64_t sub_243156E64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2431578F4();
  *a1 = result;
  return result;
}

uint64_t sub_243156E8C()
{
  swift_retain();
  return sub_243157900();
}

uint64_t sub_243156EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NotesSharedIndexedSearchView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_243156EFC@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for NotesSharedIndexedSearchView(0);
  return sub_2431534A4(a1);
}

uint64_t objectdestroy_34Tm()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (int *)type metadata accessor for NotesSharedIndexedSearchView(0);
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  sub_243153E6C(*(id *)v3, *(_BYTE *)(v3 + 8));
  sub_243153E78(*(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_BYTE *)(v3 + 32));
  v4 = v3 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BCFF8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_243157804();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v6 = v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543BD008);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_243157828();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_243157098@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for NotesSharedIndexedSearchView(0);
  return sub_243153710(a1);
}

uint64_t sub_2431570D4()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_243157100@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2431543FC(*(void (**)(void))(v1 + 16), *(void (**)(void))(v1 + 32), a1);
}

unint64_t sub_24315710C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2543BCEC0;
  if (!qword_2543BCEC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543BCEC8);
    v2[0] = sub_243157170();
    v2[1] = v2[0];
    result = MEMORY[0x2494F3E50](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2543BCEC0);
  }
  return result;
}

unint64_t sub_243157170()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2543BCE58;
  if (!qword_2543BCE58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543BCE60);
    v2[0] = sub_2431571F4();
    v2[1] = sub_2431576E4(&qword_2543BCD98, &qword_2543BCDA0, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2494F3E50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2543BCE58);
  }
  return result;
}

unint64_t sub_2431571F4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2543BCE28;
  if (!qword_2543BCE28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543BCE30);
    v2[0] = sub_243157260();
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2494F3E50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2543BCE28);
  }
  return result;
}

unint64_t sub_243157260()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_2543BCDF0;
  if (!qword_2543BCDF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543BCDF8);
    v2 = sub_2431572CC();
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x2494F3E50](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2543BCDF0);
  }
  return result;
}

unint64_t sub_2431572CC()
{
  unint64_t result;

  result = qword_2543BCD90;
  if (!qword_2543BCD90)
  {
    result = MEMORY[0x2494F3E50](&unk_243158910, &type metadata for SquareCropModifier);
    atomic_store(result, (unint64_t *)&qword_2543BCD90);
  }
  return result;
}

uint64_t sub_243157310(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_243157354(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_243157390@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_24315790C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2431573C0()
{
  return sub_243157918();
}

unint64_t sub_2431573EC()
{
  unint64_t result;

  result = qword_2543BCF80;
  if (!qword_2543BCF80)
  {
    result = MEMORY[0x2494F3E50](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2543BCF80);
  }
  return result;
}

void sub_243157430()
{
  sub_243157744();
  __break(1u);
}

unint64_t sub_24315744C()
{
  unint64_t result;

  result = qword_2543BCD70;
  if (!qword_2543BCD70)
  {
    result = MEMORY[0x2494F3E50](MEMORY[0x24BDEACB8], MEMORY[0x24BDEACC8]);
    atomic_store(result, (unint64_t *)&qword_2543BCD70);
  }
  return result;
}

void sub_243157490()
{
  sub_24315744C();
  sub_2431577A4();
  __break(1u);
}

uint64_t sub_2431574B4()
{
  return 8;
}

uint64_t sub_2431574C0()
{
  return swift_release();
}

uint64_t sub_2431574C8(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_2431574D8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257287988);
  return sub_243157BC4();
}

_QWORD *sub_24315751C(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_243157528(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_24315756C()
{
  unint64_t result;

  result = qword_257287990;
  if (!qword_257287990)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257287990);
  }
  return result;
}

uint64_t sub_2431575A8()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

double sub_2431575EC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2431503A8(v1 + 16, a1);
}

uint64_t sub_2431575F4(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_243157654()
{
  return sub_2431504C0();
}

unint64_t sub_243157660()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2543BCDE0;
  if (!qword_2543BCDE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543BCDE8);
    v2[0] = sub_2431576E4(&qword_2543BCDC8, &qword_2543BCDD0, MEMORY[0x24BDEC6F8]);
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x2494F3E50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2543BCDE0);
  }
  return result;
}

uint64_t sub_2431576E4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2494F3E50](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24315772C()
{
  return MEMORY[0x24BDFBA80]();
}

uint64_t sub_243157738()
{
  return MEMORY[0x24BDB5DF0]();
}

uint64_t sub_243157744()
{
  return MEMORY[0x24BDEAD50]();
}

uint64_t sub_243157750()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_24315775C()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_243157768()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_243157774()
{
  return MEMORY[0x24BDCC608]();
}

uint64_t sub_243157780()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_24315778C()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_243157798()
{
  return MEMORY[0x24BDCC978]();
}

uint64_t sub_2431577A4()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_2431577B0()
{
  return MEMORY[0x24BDCD3F0]();
}

uint64_t sub_2431577BC()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2431577C8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2431577D4()
{
  return MEMORY[0x24BE6DE68]();
}

uint64_t sub_2431577E0()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2431577EC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2431577F8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_243157804()
{
  return MEMORY[0x24BDFBAE8]();
}

uint64_t sub_243157810()
{
  return MEMORY[0x24BDEAF58]();
}

uint64_t sub_24315781C()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_243157828()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_243157834()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_243157840()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_24315784C()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_243157858()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_243157864()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_243157870()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_24315787C()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_243157888()
{
  return MEMORY[0x24BDECD20]();
}

uint64_t sub_243157894()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_2431578A0()
{
  return MEMORY[0x24BDEDB60]();
}

uint64_t sub_2431578AC()
{
  return MEMORY[0x24BDFBB28]();
}

uint64_t sub_2431578B8()
{
  return MEMORY[0x24BDFBB30]();
}

uint64_t sub_2431578C4()
{
  return MEMORY[0x24BDFBB38]();
}

uint64_t sub_2431578D0()
{
  return MEMORY[0x24BDFBB40]();
}

uint64_t sub_2431578DC()
{
  return MEMORY[0x24BDFBB48]();
}

uint64_t sub_2431578E8()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_2431578F4()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_243157900()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_24315790C()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_243157918()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_243157924()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_243157930()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_24315793C()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_243157948()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_243157954()
{
  return MEMORY[0x24BDEEA08]();
}

uint64_t sub_243157960()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_24315796C()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_243157978()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_243157984()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_243157990()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_24315799C()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_2431579A8()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_2431579B4()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2431579C0()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_2431579CC()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_2431579D8()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_2431579E4()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_2431579F0()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_2431579FC()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_243157A08()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_243157A14()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_243157A20()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_243157A2C()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_243157A38()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_243157A44()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_243157A50()
{
  return MEMORY[0x24BDF1AF0]();
}

uint64_t sub_243157A5C()
{
  return MEMORY[0x24BDF1B30]();
}

uint64_t sub_243157A68()
{
  return MEMORY[0x24BDF1BD0]();
}

uint64_t sub_243157A74()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_243157A80()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_243157A8C()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_243157A98()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_243157AA4()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_243157AB0()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_243157ABC()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_243157AC8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_243157AD4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_243157AE0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_243157AEC()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_243157AF8()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_243157B04()
{
  return MEMORY[0x24BDF3D60]();
}

uint64_t sub_243157B10()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_243157B1C()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_243157B28()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_243157B34()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_243157B40()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_243157B4C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_243157B58()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_243157B64()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_243157B70()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_243157B7C()
{
  return MEMORY[0x24BDF4F00]();
}

uint64_t sub_243157B88()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_243157B94()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_243157BA0()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_243157BAC()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_243157BB8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_243157BC4()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_243157BD0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_243157BDC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_243157BE8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_243157BF4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_243157C00()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_243157C0C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_243157C18()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_243157C24()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_243157C30()
{
  return MEMORY[0x24BDB6668]();
}

uint64_t sub_243157C3C()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_243157C48()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_243157C54()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_243157C60()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_243157C6C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_243157C78()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_243157C84()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_243157C90()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_243157C9C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_243157CA8()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_243157CB4()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_243157CC0()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_243157CCC()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_243157CD8()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_243157CE4()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_243157CF0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_243157CFC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_243157D08()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_243157D14()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_243157D20()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_243157D2C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_243157D38()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_243157D44()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_243157D50()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_243157D5C()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t ICNotesAppBundleIdentifier()
{
  return MEMORY[0x24BE6DEA0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double remainder(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAFB28](__x, __y);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

