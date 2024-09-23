uint64_t sub_229A1EF44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(unint64_t, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;

  v21 = a3;
  v22 = a1;
  v24 = a4;
  v7 = sub_229A2C2FC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v21 - v12;
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v23((char *)&v21 - v12, a1, v7);
  v14 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a2;
  *(_QWORD *)(v15 + 24) = a3;
  v16 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
  v16(v15 + v14, v13, v7);
  v17 = v22;
  v23(v11, v22, v7);
  v18 = swift_allocObject();
  v19 = v21;
  *(_QWORD *)(v18 + 16) = a2;
  *(_QWORD *)(v18 + 24) = v19;
  v16(v18 + v14, v11, v7);
  sub_229A2C38C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v17, v7);
}

uint64_t sub_229A1F0C0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  a3[3] = a1;
  a3[4] = v4;
  __swift_allocate_boxed_opaque_existential_1(a3);
  v5 = sub_229A2C2FC();
  return MEMORY[0x22E2D4574](v5);
}

uint64_t sub_229A1F114@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  sub_229A2C2FC();
  return sub_229A1F0C0(v3, v4, a1);
}

uint64_t sub_229A1F168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  _BYTE v20[40];

  v5 = sub_229A2C59C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = &v20[-v8 - 8];
  v10 = *(_QWORD *)(a3 - 8);
  v11 = MEMORY[0x24BDAC7A8](v7);
  v13 = &v20[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x24BDAC7A8](v11);
  v15 = &v20[-v14 - 8];
  sub_229A1F418(a1, (uint64_t)v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A870F0);
  v16 = swift_dynamicCast();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  if ((v16 & 1) != 0)
  {
    v17(v9, 0, 1, a3);
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v9, a3);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, a3);
    sub_229A2C2FC();
    sub_229A2C2F0();
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, a3);
  }
  else
  {
    v17(v9, 1, 1, a3);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    sub_229A2C410();
    sub_229A2C2FC();
    return sub_229A2C2F0();
  }
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = sub_229A2C2FC();
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  v4 = v0 + ((v3 + 32) & ~v3);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v4 + *(int *)(v2 + 32), v1);
  return swift_deallocObject();
}

uint64_t sub_229A1F3C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_229A2C2FC() - 8) + 80);
  return sub_229A1F168(a1, v1 + ((v4 + 32) & ~v4), v3);
}

uint64_t sub_229A1F418(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2D4B74]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t JUComponentView.init(presenting:for:with:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a5, a1, AssociatedTypeWitness);
  v12 = a5 + *(int *)(type metadata accessor for JUComponentView(0, a3, a4, v11) + 36);
  swift_getAssociatedTypeWitness();
  v13 = sub_229A2C2FC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12, a2, v13);
}

uint64_t type metadata accessor for JUComponentView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JUComponentView);
}

uint64_t sub_229A1F5B0(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;

  swift_getAssociatedTypeWitness();
  v3 = sub_229A2C2FC();
  return a2(v3);
}

uint64_t sub_229A1F610(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  int64_t v37;
  unint64_t v38;
  unint64_t i;
  int64_t v40;
  unint64_t v41;
  int64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t result;
  _QWORD *v51;
  uint64_t v52;
  _QWORD v53[3];
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v4 = *v2;
  v5 = (uint64_t *)((char *)v2 + *(_QWORD *)(*v2 + 112));
  swift_beginAccess();
  v6 = swift_bridgeObjectRetain();
  v7 = sub_229A1FA68(v6);
  v56 = v7;
  v8 = *(_QWORD *)(a1 + 16);
  if (v8)
  {
    v9 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_229A1F418(v9, (uint64_t)v53);
      __swift_project_boxed_opaque_existential_1(v53, v54);
      v11 = sub_229A2C074();
      swift_unknownObjectRelease();
      swift_beginAccess();
      if (*(_QWORD *)(*v5 + 16))
      {
        sub_229A21680(v11);
        if ((v12 & 1) != 0)
          goto LABEL_5;
      }
      swift_endAccess();
      v13 = v54;
      v14 = v55;
      __swift_project_boxed_opaque_existential_1(v53, v54);
      v15 = sub_229A1FBD8(a2, v13, *(_QWORD *)(v4 + 80), v14, *(_QWORD *)(v4 + 88));
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = *v5;
      v51 = (_QWORD *)*v5;
      *v5 = 0x8000000000000000;
      v19 = sub_229A21680(v11);
      v20 = *(_QWORD *)(v17 + 16);
      v21 = (v18 & 1) == 0;
      v22 = v20 + v21;
      if (__OFADD__(v20, v21))
        goto LABEL_48;
      v23 = v18;
      if (*(_QWORD *)(v17 + 24) >= v22)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v26 = v51;
          if ((v18 & 1) == 0)
            goto LABEL_15;
        }
        else
        {
          sub_229A21D8C();
          v26 = v51;
          if ((v23 & 1) == 0)
            goto LABEL_15;
        }
      }
      else
      {
        sub_229A21944(v22, isUniquelyReferenced_nonNull_native);
        v24 = sub_229A21680(v11);
        if ((v23 & 1) != (v25 & 1))
          goto LABEL_51;
        v19 = v24;
        v26 = v51;
        if ((v23 & 1) == 0)
        {
LABEL_15:
          v26[(v19 >> 6) + 8] |= 1 << v19;
          v27 = 8 * v19;
          *(_QWORD *)(v26[6] + v27) = v11;
          *(_QWORD *)(v26[7] + v27) = v15;
          v28 = v26[2];
          v29 = __OFADD__(v28, 1);
          v30 = v28 + 1;
          if (v29)
            goto LABEL_49;
          v26[2] = v30;
          goto LABEL_4;
        }
      }
      v10 = v26[7];
      swift_release();
      *(_QWORD *)(v10 + 8 * v19) = v15;
LABEL_4:
      *v5 = (uint64_t)v26;
      swift_bridgeObjectRelease();
LABEL_5:
      swift_endAccess();
      sub_229A21844(v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
      v9 += 40;
      if (!--v8)
      {
        swift_bridgeObjectRelease();
        v31 = v56;
        goto LABEL_21;
      }
    }
  }
  v31 = v7;
LABEL_21:
  v32 = 0;
  v33 = v31 + 56;
  v34 = 1 << *(_BYTE *)(v31 + 32);
  v35 = -1;
  if (v34 < 64)
    v35 = ~(-1 << v34);
  v36 = v35 & *(_QWORD *)(v31 + 56);
  v37 = (unint64_t)(v34 + 63) >> 6;
  if (v36)
    goto LABEL_26;
LABEL_27:
  v40 = v32 + 1;
  if (!__OFADD__(v32, 1))
  {
    if (v40 < v37)
    {
      v41 = *(_QWORD *)(v33 + 8 * v40);
      ++v32;
      if (v41)
        goto LABEL_40;
      v32 = v40 + 1;
      if (v40 + 1 >= v37)
        return swift_release();
      v41 = *(_QWORD *)(v33 + 8 * v32);
      if (v41)
        goto LABEL_40;
      v32 = v40 + 2;
      if (v40 + 2 >= v37)
        return swift_release();
      v41 = *(_QWORD *)(v33 + 8 * v32);
      if (v41)
      {
LABEL_40:
        v36 = (v41 - 1) & v41;
        for (i = __clz(__rbit64(v41)) + (v32 << 6); ; i = v38 | (v32 << 6))
        {
          v43 = *(_QWORD *)(*(_QWORD *)(v31 + 48) + 8 * i);
          swift_beginAccess();
          v44 = sub_229A21680(v43);
          if ((v45 & 1) != 0)
          {
            v46 = v44;
            v47 = swift_isUniquelyReferenced_nonNull_native();
            v48 = *v5;
            v52 = *v5;
            *v5 = 0x8000000000000000;
            if (!v47)
            {
              sub_229A21D8C();
              v48 = v52;
            }
            sub_229A21BF8(v46, v48);
            *v5 = v48;
            swift_bridgeObjectRelease();
            swift_endAccess();
            sub_229A2C4E8();
            swift_release();
            if (!v36)
              goto LABEL_27;
          }
          else
          {
            swift_endAccess();
            if (!v36)
              goto LABEL_27;
          }
LABEL_26:
          v38 = __clz(__rbit64(v36));
          v36 &= v36 - 1;
        }
      }
      v42 = v40 + 3;
      if (v42 < v37)
      {
        v41 = *(_QWORD *)(v33 + 8 * v42);
        if (v41)
        {
          v32 = v42;
          goto LABEL_40;
        }
        while (1)
        {
          v32 = v42 + 1;
          if (__OFADD__(v42, 1))
            goto LABEL_50;
          if (v32 >= v37)
            return swift_release();
          v41 = *(_QWORD *)(v33 + 8 * v32);
          ++v42;
          if (v41)
            goto LABEL_40;
        }
      }
    }
    return swift_release();
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  result = sub_229A2C698();
  __break(1u);
  return result;
}

uint64_t sub_229A1FA68(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = sub_229A2C4F4();
  v3 = 0;
  v15 = result;
  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        goto LABEL_23;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          goto LABEL_23;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
        {
          v3 = v11 + 3;
          if (v11 + 3 >= v8)
            goto LABEL_23;
          v12 = *(_QWORD *)(v4 + 8 * v3);
          if (!v12)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    result = sub_229A2174C(&v14, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10));
  }
  v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  v12 = *(_QWORD *)(v4 + 8 * v13);
  if (v12)
  {
    v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_229A1FBD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v25 = a3;
  v26 = a5;
  v24 = a1;
  v7 = type metadata accessor for JUComponentReloader(0, a3, a5, a4);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A872C8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_229A2C488();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = sub_229A2C074();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v24, v7);
  sub_229A2C464();
  v16 = sub_229A2C458();
  v17 = (*(unsigned __int8 *)(v8 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v18 = (char *)swift_allocObject();
  v19 = MEMORY[0x24BEE6930];
  *((_QWORD *)v18 + 2) = v16;
  *((_QWORD *)v18 + 3) = v19;
  v20 = v25;
  *((_QWORD *)v18 + 4) = a2;
  *((_QWORD *)v18 + 5) = v20;
  v21 = v26;
  *((_QWORD *)v18 + 6) = a4;
  *((_QWORD *)v18 + 7) = v21;
  *((_QWORD *)v18 + 8) = v15;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v18[v17], v10, v7);
  return sub_229A21484((uint64_t)v13, (uint64_t)&unk_255A872D8, (uint64_t)v18);
}

uint64_t JUComponentView.Coordinator.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_229A250C8(v0 + 16, &qword_255A870F8);
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 104);
  swift_getAssociatedTypeWitness();
  v2 = sub_229A2C59C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t JUComponentView.Coordinator.__deallocating_deinit()
{
  JUComponentView.Coordinator.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_229A1FE1C()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_229A1FE50();
  return v0;
}

uint64_t *sub_229A1FE50()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v4;

  v1 = *v0;
  *((_OWORD *)v0 + 1) = 0u;
  *((_OWORD *)v0 + 2) = 0u;
  v0[6] = 0;
  v2 = (uint64_t)v0 + *(_QWORD *)(v1 + 104);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v2, 1, 1, AssociatedTypeWitness);
  v4 = *(_QWORD *)(*v0 + 112);
  *(uint64_t *)((char *)v0 + v4) = sub_229A230E4(MEMORY[0x24BEE4AF8]);
  return v0;
}

uint64_t JUComponentView.makeCoordinator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_229A231E8(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a3, a4);
}

void *JUComponentView.makeView(context:)()
{
  return sub_229A23228();
}

uint64_t JUComponentView.updateView(_:context:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t AssociatedConformanceWitness;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t, uint64_t);
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  unsigned int (*v63)(char *, uint64_t, uint64_t);
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  uint64_t result;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  char *v88;
  uint64_t v89;
  unsigned int v90;
  char *v91;
  void (*v92)(char *, uint64_t);
  uint64_t v93;
  char *v94;
  void (*v95)(char *, uint64_t);
  void (*v96)(char *, uint64_t);
  char *v97;
  char *v98;
  char *v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t TupleTypeMetadata2;
  char *v104;
  char *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  char *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  _OWORD v137[2];
  uint64_t v138;
  _QWORD v139[5];
  _QWORD v140[3];
  uint64_t v141;
  __int128 v142;
  __int128 v143;
  uint64_t v144;
  _BYTE v145[40];
  uint64_t v146;
  _QWORD v147[6];

  v136 = a2;
  v120 = a1;
  v7 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(a3 + 24);
  v8 = type metadata accessor for JUComponentReloader(0, v7, v6, a4);
  v108 = *(_QWORD *)(v8 - 8);
  v109 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v107 = (uint64_t)&v97 - v9;
  v10 = sub_229A2C164();
  v117 = *(_QWORD *)(v10 - 8);
  v118 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v116 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = sub_229A2C2FC();
  MEMORY[0x24BDAC7A8](v13);
  v114 = (char *)&v97 - v14;
  v15 = sub_229A2C398();
  MEMORY[0x24BDAC7A8](v15);
  v115 = (uint64_t)&v97 - v16;
  v17 = swift_getAssociatedTypeWitness();
  v111 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v112 = (char *)&v97 - v18;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v119 = v6;
  v130 = v7;
  v20 = swift_getAssociatedConformanceWitness();
  v140[0] = v17;
  v140[1] = AssociatedTypeWitness;
  v140[2] = AssociatedConformanceWitness;
  v141 = v20;
  v123 = v20;
  v21 = sub_229A2C068();
  v121 = *(_QWORD *)(v21 - 8);
  v122 = v21;
  v22 = MEMORY[0x24BDAC7A8](v21);
  v106 = (char *)&v97 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v113 = (char *)&v97 - v25;
  v26 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v24);
  v99 = (char *)&v97 - v27;
  v131 = AssociatedTypeWitness;
  v28 = sub_229A2C59C();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v101 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v29 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v102 = (char *)&v97 - v30;
  v125 = *(_QWORD *)(v28 - 8);
  v31 = MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)&v97 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v31);
  v100 = (char *)&v97 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v104 = (char *)&v97 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v105 = (char *)&v97 - v38;
  MEMORY[0x22E2D4B8C](&protocol conformance descriptor for JUComponentView<A>, a3);
  v39 = sub_229A2C224();
  v126 = *(_QWORD *)(v39 - 8);
  v40 = MEMORY[0x24BDAC7A8](v39);
  v42 = (char *)&v97 - v41;
  v135 = a3;
  v128 = *(_QWORD *)(a3 - 8);
  v43 = MEMORY[0x24BDAC7A8](v40);
  v127 = (char *)&v97 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = AssociatedConformanceWitness;
  v133 = v4;
  v45 = v43;
  v110 = v17;
  sub_229A2C35C();
  sub_229A2C20C();
  v46 = v146;
  swift_beginAccess();
  sub_229A23298(v46 + 16, (uint64_t)v145);
  swift_release();
  sub_229A23298((uint64_t)v147, (uint64_t)v140);
  sub_229A23298((uint64_t)v145, (uint64_t)&v142);
  v134 = v45;
  v129 = v26;
  v124 = v28;
  if (!v141)
  {
    sub_229A250C8((uint64_t)v145, &qword_255A870F8);
    sub_229A250C8((uint64_t)v147, &qword_255A870F8);
    v48 = v127;
    if (!*((_QWORD *)&v143 + 1))
    {
      sub_229A250C8((uint64_t)v140, &qword_255A870F8);
      (*(void (**)(char *, uint64_t, uint64_t))(v128 + 16))(v48, v133, v135);
      (*(void (**)(char *, uint64_t, uint64_t))(v126 + 16))(v42, v136, v45);
      goto LABEL_7;
    }
LABEL_11:
    sub_229A250C8((uint64_t)v140, &qword_255A87100);
    v49 = v128;
    (*(void (**)(char *, uint64_t, uint64_t))(v128 + 16))(v48, v133, v135);
    v50 = v126;
    (*(void (**)(char *))(v126 + 16))(v42);
LABEL_12:
    (*(void (**)(char *, uint64_t))(v50 + 8))(v42, v45);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v135);
    v65 = v124;
    v67 = v129;
    goto LABEL_13;
  }
  sub_229A23298((uint64_t)v140, (uint64_t)v139);
  if (!*((_QWORD *)&v143 + 1))
  {
    sub_229A250C8((uint64_t)v145, &qword_255A870F8);
    sub_229A250C8((uint64_t)v147, &qword_255A870F8);
    sub_229A23328((uint64_t)v139);
    v48 = v127;
    goto LABEL_11;
  }
  v137[0] = v142;
  v137[1] = v143;
  v138 = v144;
  v47 = MEMORY[0x22E2D4868](v139, v137);
  sub_229A23328((uint64_t)v137);
  sub_229A250C8((uint64_t)v145, &qword_255A870F8);
  sub_229A250C8((uint64_t)v147, &qword_255A870F8);
  sub_229A23328((uint64_t)v139);
  sub_229A250C8((uint64_t)v140, &qword_255A870F8);
  v48 = v127;
  v49 = v128;
  (*(void (**)(char *, uint64_t, uint64_t))(v128 + 16))(v127, v133, v135);
  v50 = v126;
  (*(void (**)(char *))(v126 + 16))(v42);
  if ((v47 & 1) == 0)
    goto LABEL_12;
LABEL_7:
  v97 = v33;
  v51 = v42;
  v52 = v105;
  sub_229A1F5B0(v135, (uint64_t (*)(uint64_t))MEMORY[0x24BDF47B0]);
  v53 = v129;
  v54 = v131;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v129 + 56))(v52, 0, 1, v131);
  v98 = v51;
  sub_229A2C20C();
  v55 = v140[0] + *(_QWORD *)(*(_QWORD *)v140[0] + 104);
  swift_beginAccess();
  v56 = v125;
  v57 = *(void (**)(char *, uint64_t, uint64_t))(v125 + 16);
  v58 = v104;
  v59 = v55;
  v60 = v124;
  v57(v104, v59, v124);
  swift_release();
  v61 = v102;
  v62 = &v102[*(int *)(TupleTypeMetadata2 + 48)];
  v57(v102, (uint64_t)v52, v60);
  v57(v62, (uint64_t)v58, v60);
  v63 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48);
  if (v63(v61, 1, v54) == 1)
  {
    v64 = *(void (**)(char *, uint64_t))(v56 + 8);
    v64(v58, v60);
    v64(v52, v60);
    (*(void (**)(char *, uint64_t))(v126 + 8))(v98, v134);
    (*(void (**)(char *, uint64_t))(v128 + 8))(v127, v135);
    v65 = v60;
    if (v63(v62, 1, v131) == 1)
      return ((uint64_t (*)(char *, uint64_t))v64)(v61, v60);
  }
  else
  {
    v88 = v100;
    v57(v100, (uint64_t)v61, v60);
    v89 = v131;
    v90 = v63(v62, 1, v131);
    v91 = v98;
    if (v90 != 1)
    {
      v93 = v129;
      v94 = v99;
      (*(void (**)(char *, char *, uint64_t))(v129 + 32))(v99, v62, v89);
      LODWORD(TupleTypeMetadata2) = sub_229A2C41C();
      v95 = *(void (**)(char *, uint64_t))(v93 + 8);
      v95(v94, v89);
      v96 = *(void (**)(char *, uint64_t))(v56 + 8);
      v96(v104, v60);
      v96(v105, v60);
      (*(void (**)(char *, uint64_t))(v126 + 8))(v91, v134);
      (*(void (**)(char *, uint64_t))(v128 + 8))(v127, v135);
      v95(v88, v89);
      v67 = v93;
      result = ((uint64_t (*)(char *, uint64_t))v96)(v102, v60);
      v33 = v97;
      v65 = v60;
      if ((TupleTypeMetadata2 & 1) != 0)
        return result;
      goto LABEL_13;
    }
    v92 = *(void (**)(char *, uint64_t))(v56 + 8);
    v92(v104, v60);
    v92(v105, v60);
    (*(void (**)(char *, uint64_t))(v126 + 8))(v91, v134);
    (*(void (**)(char *, uint64_t))(v128 + 8))(v127, v135);
    (*(void (**)(char *, uint64_t))(v129 + 8))(v88, v89);
    v65 = v60;
  }
  (*(void (**)(char *, uint64_t))(v101 + 8))(v61, TupleTypeMetadata2);
  v67 = v129;
  v33 = v97;
LABEL_13:
  sub_229A2C20C();
  v68 = v139[0];
  v69 = v133;
  v70 = v110;
  sub_229A2C35C();
  swift_beginAccess();
  sub_229A232E0((uint64_t)v140, v68 + 16);
  swift_endAccess();
  swift_release();
  sub_229A2C20C();
  v71 = v147[0];
  v72 = v135;
  sub_229A1F5B0(v135, (uint64_t (*)(uint64_t))MEMORY[0x24BDF47B0]);
  v73 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v67 + 56);
  v74 = v131;
  v73(v33, 0, 1, v131);
  v75 = v71 + *(_QWORD *)(*(_QWORD *)v71 + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v125 + 40))(v75, v33, v65);
  swift_endAccess();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v111 + 16))(v112, v69, v70);
  v76 = (uint64_t)v114;
  sub_229A1F5B0(v72, MEMORY[0x24BDF47E0]);
  sub_229A1EF44(v76, v74, v123, v115);
  v77 = v116;
  sub_229A2C218();
  sub_229A20AC4();
  (*(void (**)(char *, uint64_t))(v117 + 8))(v77, v118);
  v78 = v113;
  sub_229A2C05C();
  v80 = v119;
  v79 = v120;
  sub_229A2C02C();
  v81 = *(_QWORD *)(sub_229A2C020() + 16);
  swift_bridgeObjectRelease();
  if (!v81)
    return (*(uint64_t (**)(char *, uint64_t))(v121 + 8))(v78, v122);
  v82 = v122;
  __swift_instantiateConcreteTypeFromMangledName(qword_255A87108);
  swift_retain();
  v83 = sub_229A2C368();
  swift_release();
  v84 = v121;
  v85 = (uint64_t)v106;
  (*(void (**)(char *, char *, uint64_t))(v121 + 16))(v106, v78, v82);
  v86 = v107;
  sub_229A20B80(v85, (uint64_t)v79, v130, v80, v107);
  v87 = v79;
  sub_229A2C20C();
  sub_229A1F610(v83, v86);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v86, v109);
  return (*(uint64_t (**)(char *, uint64_t))(v84 + 8))(v78, v82);
}

uint64_t sub_229A20AC4()
{
  uint64_t v0;
  __int128 v2;
  uint64_t v3;
  _QWORD v4[4];

  sub_229A2C11C();
  if (v3)
  {
    sub_229A25104(&v2, (uint64_t)v4);
    __swift_project_boxed_opaque_existential_1(v4, v4[3]);
    v0 = sub_229A2BFC0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    sub_229A250C8((uint64_t)&v2, qword_255A87300);
    sub_229A2C380();
    return sub_229A2C374();
  }
  return v0;
}

uint64_t sub_229A20B80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  v10 = sub_229A2C068();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a5, a1, v10);
  result = type metadata accessor for JUComponentReloader(0, a3, a4, v11);
  *(_QWORD *)(a5 + *(int *)(result + 36)) = a2;
  return result;
}

void *sub_229A20C98()
{
  return sub_229A23228();
}

uint64_t sub_229A20CA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = MEMORY[0x22E2D4B8C](&protocol conformance descriptor for JUComponentView<A>);
  return JetViewRepresentable.makeUIView(context:)(a1, a2, v4);
}

uint64_t sub_229A20CE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = MEMORY[0x22E2D4B8C](&protocol conformance descriptor for JUComponentView<A>, a3);
  return JetViewRepresentable.updateUIView(_:context:)(a1, a2, a3, v6);
}

uint64_t sub_229A20D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = MEMORY[0x22E2D4B8C](&protocol conformance descriptor for JUComponentView<A>, a3);
  return static JetViewRepresentable.dismantleUIView(_:coordinator:)(a1, a2, a3, v6);
}

uint64_t sub_229A20D80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t result;

  result = sub_229A231E8(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2, a3);
  *a4 = result;
  return result;
}

uint64_t sub_229A20DB0()
{
  return sub_229A2C17C();
}

uint64_t sub_229A20DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2D4B8C](&protocol conformance descriptor for JUComponentView<A>, a3);
  return sub_229A2C1DC();
}

uint64_t sub_229A20E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2D4B8C](&protocol conformance descriptor for JUComponentView<A>, a3);
  return sub_229A2C188();
}

uint64_t sub_229A20EA8()
{
  return sub_229A2C26C();
}

void sub_229A20EC0(uint64_t a1)
{
  MEMORY[0x22E2D4B8C](&protocol conformance descriptor for JUComponentView<A>, a1);
  sub_229A2C1D0();
  __break(1u);
}

uint64_t sub_229A20EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v8[6] = a8;
  v8[7] = v14;
  v8[4] = a6;
  v8[5] = a7;
  v8[2] = a4;
  v8[3] = a5;
  v8[8] = swift_getAssociatedTypeWitness();
  v8[9] = swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[10] = AssociatedTypeWitness;
  v8[11] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8[12] = swift_task_alloc();
  sub_229A2C59C();
  v8[13] = swift_task_alloc();
  v10 = sub_229A2C4D0();
  v8[14] = v10;
  v8[15] = *(_QWORD *)(v10 - 8);
  v8[16] = swift_task_alloc();
  v11 = sub_229A2C4C4();
  v8[17] = v11;
  v8[18] = *(_QWORD *)(v11 - 8);
  v8[19] = swift_task_alloc();
  v8[20] = sub_229A2C464();
  v8[21] = sub_229A2C458();
  v8[22] = sub_229A2C44C();
  v8[23] = v12;
  return swift_task_switch();
}

uint64_t sub_229A2108C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[15];
  v1 = v0[16];
  v3 = v0[14];
  swift_checkMetadataState();
  sub_229A2C350();
  sub_229A2C4AC();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[24] = sub_229A2C458();
  v4 = (_QWORD *)swift_task_alloc();
  v0[25] = v4;
  *v4 = v0;
  v4[1] = sub_229A21158;
  return sub_229A2C4B8();
}

uint64_t sub_229A21158()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_229A211AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 56);
    v6 = *(_QWORD *)(v0 + 40);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(*(_QWORD *)(v0 + 96), v1, v3);
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    sub_229A2C500();
    v7 = sub_229A2C5C0();
    swift_bridgeObjectRelease();
    type metadata accessor for JUComponentReloader(0, v6, v5, v8);
    sub_229A213CC(v7);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 192) = sub_229A2C458();
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v9;
    *v9 = v0;
    v9[1] = sub_229A21158;
    return sub_229A2C4B8();
  }
}

uint64_t sub_229A213CC(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t result;

  v2 = sub_229A2C020();
  if (!*(_QWORD *)(sub_229A22844(a1, v2) + 16))
    return swift_release();
  v3 = sub_229A2C014();
  result = swift_release();
  if ((v3 & 1) == 0)
    return sub_229A2C02C();
  return result;
}

uint64_t sub_229A21484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_229A2C488();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_229A2C47C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_229A250C8(a1, &qword_255A872C8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_229A2C44C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_229A215D0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_229A21634;
  return v6(a1);
}

uint64_t sub_229A21634()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_229A21680(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_229A2C6A4();
  return sub_229A216B0(a1, v2);
}

unint64_t sub_229A216B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_229A2174C(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v3 = v2;
  v6 = *v2;
  v7 = sub_229A2C6A4();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_229A22724(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_QWORD *)(v10 + 8 * v9) != a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v10 + 8 * v9) != a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_229A21844(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v2 = v1;
  v4 = *v2;
  v5 = sub_229A2C6A4();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(v4 + 48);
  if (*(_QWORD *)(v8 + 8 * v7) != a1)
  {
    v9 = ~v6;
    do
    {
      v7 = (v7 + 1) & v9;
      if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
        return 0;
    }
    while (*(_QWORD *)(v8 + 8 * v7) != a1);
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v2;
  v14 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_229A21F2C();
    v11 = v14;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v7);
  sub_229A225A0(v7);
  *v2 = v14;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_229A21944(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A872C0);
  result = sub_229A2C65C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v31 = -1 << v10;
    v32 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33)
          goto LABEL_33;
        v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v33)
            goto LABEL_33;
          v22 = v9[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v32 >= 64)
                  bzero((void *)(v5 + 64), 8 * v33);
                else
                  *v9 = v31;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v8 >= v33)
                  goto LABEL_33;
                v22 = v9[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = 8 * v20;
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v28);
      v30 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v28);
      if ((a2 & 1) == 0)
        swift_retain();
      result = sub_229A2C6A4();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = 8 * v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v29;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_229A21BF8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_229A2C5B4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_229A2C6A4();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = (_QWORD *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1)
              *v14 = *v10;
            v15 = *(_QWORD *)(a2 + 56);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_229A21D8C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A872C0);
  v2 = *v0;
  v3 = sub_229A2C650();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_retain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_229A21F2C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A872F8);
  v2 = *v0;
  v3 = sub_229A2C5E4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_229A220C0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A872F8);
  result = sub_229A2C5F0();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    result = sub_229A2C6A4();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v26;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_229A22320()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A872F8);
  result = sub_229A2C5F0();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (uint64_t *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    v26 = -1 << v7;
    v27 = v1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v28 = 1 << *(_BYTE *)(v2 + 32);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64)
                  bzero((void *)(v2 + 56), 8 * v10);
                else
                  *v6 = v26;
                v1 = v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      result = sub_229A2C6A4();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_229A225A0(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_229A2C5B4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(v3 + 48);
        v11 = (_QWORD *)(v10 + 8 * v6);
        v12 = sub_229A2C6A4() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= v12)
          {
LABEL_16:
            v15 = (_QWORD *)(v10 + 8 * v2);
            if (v2 != v6 || (v2 = v6, v15 >= v11 + 1))
            {
              *v15 = *v11;
              v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v16 = *(_QWORD *)(v3 + 16);
  v17 = __OFSUB__(v16, 1);
  v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_229A22724(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_229A22320();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_229A21F2C();
      goto LABEL_14;
    }
    sub_229A220C0();
  }
  v8 = *v3;
  result = sub_229A2C6A4();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_229A2C68C();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t sub_229A22844(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_229A229C4((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_229A229C4((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x22E2D4BEC](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_229A229C4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  BOOL v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unint64_t *v42;
  uint64_t v43;
  _BYTE v44[40];
  _OWORD v45[2];
  uint64_t v46;
  _OWORD v47[2];
  uint64_t v48;
  int64_t v49;

  v42 = (unint64_t *)result;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v43 = 0;
    v6 = 0;
    v40 = a4 + 56;
    v7 = 1 << *(_BYTE *)(a4 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(a4 + 56);
    v49 = (unint64_t)(v7 + 63) >> 6;
    v10 = a3 + 56;
    do
    {
      while (1)
      {
        if (v9)
        {
          v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          v12 = v11 | (v6 << 6);
        }
        else
        {
          v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
LABEL_62:
            __break(1u);
            goto LABEL_63;
          }
          if (v13 >= v49)
            goto LABEL_60;
          v14 = *(_QWORD *)(v40 + 8 * v13);
          ++v6;
          if (!v14)
          {
            v6 = v13 + 1;
            if (v13 + 1 >= v49)
              goto LABEL_60;
            v14 = *(_QWORD *)(v40 + 8 * v6);
            if (!v14)
            {
              v6 = v13 + 2;
              if (v13 + 2 >= v49)
                goto LABEL_60;
              v14 = *(_QWORD *)(v40 + 8 * v6);
              if (!v14)
              {
                v15 = v13 + 3;
                if (v15 >= v49)
                {
LABEL_60:
                  swift_retain();
                  return sub_229A22E64(v42, a2, v43, a3);
                }
                v14 = *(_QWORD *)(v40 + 8 * v15);
                if (!v14)
                {
                  while (1)
                  {
                    v6 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      break;
                    if (v6 >= v49)
                      goto LABEL_60;
                    v14 = *(_QWORD *)(v40 + 8 * v6);
                    ++v15;
                    if (v14)
                      goto LABEL_22;
                  }
LABEL_63:
                  __break(1u);
                  goto LABEL_64;
                }
                v6 = v15;
              }
            }
          }
LABEL_22:
          v9 = (v14 - 1) & v14;
          v12 = __clz(__rbit64(v14)) + (v6 << 6);
        }
        sub_229A2508C(*(_QWORD *)(a4 + 48) + 40 * v12, (uint64_t)v47);
        v45[0] = v47[0];
        v45[1] = v47[1];
        v46 = v48;
        v16 = sub_229A2C5CC();
        v17 = -1 << *(_BYTE *)(a3 + 32);
        v18 = v16 & ~v17;
        if (((*(_QWORD *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
          break;
LABEL_6:
        result = sub_229A23328((uint64_t)v45);
      }
      v19 = ~v17;
      while (1)
      {
        sub_229A2508C(*(_QWORD *)(a3 + 48) + 40 * v18, (uint64_t)v44);
        v20 = MEMORY[0x22E2D4868](v44, v45);
        sub_229A23328((uint64_t)v44);
        if ((v20 & 1) != 0)
          break;
        v18 = (v18 + 1) & v19;
        if (((*(_QWORD *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
          goto LABEL_6;
      }
      result = sub_229A23328((uint64_t)v45);
      *(unint64_t *)((char *)v42 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v21 = __OFADD__(v43++, 1);
    }
    while (!v21);
    __break(1u);
  }
  v43 = 0;
  v22 = 0;
  v39 = a3 + 56;
  v23 = 1 << *(_BYTE *)(a3 + 32);
  if (v23 < 64)
    v24 = ~(-1 << v23);
  else
    v24 = -1;
  v25 = v24 & *(_QWORD *)(a3 + 56);
  v41 = (unint64_t)(v23 + 63) >> 6;
  v26 = a4 + 56;
  while (v25)
  {
    v27 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    v49 = v22;
    v28 = v27 | (v22 << 6);
LABEL_52:
    sub_229A2508C(*(_QWORD *)(a3 + 48) + 40 * v28, (uint64_t)v47);
    v33 = sub_229A2C5CC();
    v34 = -1 << *(_BYTE *)(a4 + 32);
    v35 = v33 & ~v34;
    if (((*(_QWORD *)(v26 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) != 0)
    {
      v36 = ~v34;
      while (1)
      {
        sub_229A2508C(*(_QWORD *)(a4 + 48) + 40 * v35, (uint64_t)v45);
        v37 = MEMORY[0x22E2D4868](v45, v47);
        sub_229A23328((uint64_t)v45);
        if ((v37 & 1) != 0)
          break;
        v35 = (v35 + 1) & v36;
        if (((*(_QWORD *)(v26 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) == 0)
          goto LABEL_35;
      }
      result = sub_229A23328((uint64_t)v47);
      *(unint64_t *)((char *)v42 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
      v21 = __OFADD__(v43++, 1);
      v22 = v49;
      if (v21)
      {
        __break(1u);
        goto LABEL_60;
      }
    }
    else
    {
LABEL_35:
      result = sub_229A23328((uint64_t)v47);
      v22 = v49;
    }
  }
  v29 = v22 + 1;
  if (__OFADD__(v22, 1))
    goto LABEL_62;
  if (v29 >= v41)
    goto LABEL_60;
  v30 = *(_QWORD *)(v39 + 8 * v29);
  v31 = v22 + 1;
  if (v30)
    goto LABEL_51;
  v31 = v22 + 2;
  if (v22 + 2 >= v41)
    goto LABEL_60;
  v30 = *(_QWORD *)(v39 + 8 * v31);
  if (v30)
    goto LABEL_51;
  v31 = v22 + 3;
  if (v22 + 3 >= v41)
    goto LABEL_60;
  v30 = *(_QWORD *)(v39 + 8 * v31);
  if (v30)
  {
LABEL_51:
    v25 = (v30 - 1) & v30;
    v49 = v31;
    v28 = __clz(__rbit64(v30)) + (v31 << 6);
    goto LABEL_52;
  }
  v32 = v22 + 4;
  if (v22 + 4 >= v41)
    goto LABEL_60;
  v30 = *(_QWORD *)(v39 + 8 * v32);
  if (v30)
  {
    v31 = v22 + 4;
    goto LABEL_51;
  }
  while (1)
  {
    v31 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    if (v31 >= v41)
      goto LABEL_60;
    v30 = *(_QWORD *)(v39 + 8 * v31);
    ++v32;
    if (v30)
      goto LABEL_51;
  }
LABEL_64:
  __break(1u);
  return result;
}

uint64_t sub_229A22E64(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  unint64_t *v30;
  _OWORD v31[2];
  uint64_t v32;

  if (!a3)
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A872F0);
  result = sub_229A2C5FC();
  v6 = result;
  v30 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= a2)
      {
LABEL_37:
        swift_release();
        return v6;
      }
      v16 = v30[v15];
      ++v11;
      if (!v16)
      {
        v11 = v15 + 1;
        if (v15 + 1 >= a2)
          goto LABEL_37;
        v16 = v30[v11];
        if (!v16)
        {
          v11 = v15 + 2;
          if (v15 + 2 >= a2)
            goto LABEL_37;
          v16 = v30[v11];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= a2)
              goto LABEL_37;
            v16 = v30[v17];
            if (!v16)
            {
              while (1)
              {
                v11 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v11 >= a2)
                  goto LABEL_37;
                v16 = v30[v11];
                ++v17;
                if (v16)
                  goto LABEL_24;
              }
            }
            v11 = v17;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    sub_229A2508C(*(_QWORD *)(a4 + 48) + 40 * v14, (uint64_t)v31);
    result = sub_229A2C5CC();
    v18 = -1 << *(_BYTE *)(v6 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v12 + 8 * (v19 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v12 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v12 + 8 * v20);
      }
      while (v25 == -1);
      v21 = __clz(__rbit64(~v25)) + (v20 << 6);
    }
    *(_QWORD *)(v12 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    v26 = *(_QWORD *)(v6 + 48) + 40 * v21;
    v27 = v31[0];
    v28 = v31[1];
    *(_QWORD *)(v26 + 32) = v32;
    *(_OWORD *)v26 = v27;
    *(_OWORD *)(v26 + 16) = v28;
    ++*(_QWORD *)(v6 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      goto LABEL_37;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

unint64_t sub_229A230E4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  unint64_t result;
  char v5;
  __int128 *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;
  char v12;
  __int128 v13;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A872C0);
  v3 = (_QWORD *)sub_229A2C668();
  v13 = *(_OWORD *)(a1 + 32);
  result = sub_229A21680(*(_QWORD *)(a1 + 32));
  if ((v5 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  v6 = (__int128 *)(a1 + 48);
  v7 = v1 - 1;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v13;
    *(_QWORD *)(v3[7] + 8 * result) = *((_QWORD *)&v13 + 1);
    v8 = v3[2];
    v9 = __OFADD__(v8, 1);
    v10 = v8 + 1;
    if (v9)
      break;
    v3[2] = v10;
    if (!v7)
      goto LABEL_8;
    v11 = *v6++;
    v13 = v11;
    swift_retain();
    result = sub_229A21680(v11);
    --v7;
    if ((v12 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_229A231E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for JUComponentView.Coordinator(0, a1, a2, a4);
  v4 = swift_allocObject();
  sub_229A1FE50();
  return v4;
}

void *sub_229A23228()
{
  void *v0;
  double v1;
  double v2;

  v0 = (void *)sub_229A2C038();
  LODWORD(v1) = 1132068864;
  objc_msgSend(v0, sel_setContentCompressionResistancePriority_forAxis_, 0, v1);
  LODWORD(v2) = 1132068864;
  objc_msgSend(v0, sel_setContentHuggingPriority_forAxis_, 0, v2);
  return v0;
}

uint64_t type metadata accessor for JUComponentReloader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JUComponentReloader);
}

uint64_t sub_229A23298(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A870F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_229A232E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A870F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_229A23328(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_229A2335C(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2D4B8C](&protocol conformance descriptor for JUComponentView<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_229A23388()
{
  JUMPOUT(0x22E2D4B8CLL);
}

uint64_t sub_229A23398()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_229A233A4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_229A233AC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    result = sub_229A2C2FC();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_229A23478(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v10 = (v9 | 7) + v6;
  v11 = v9 | 7 | *(_DWORD *)(v5 + 80);
  if (v11 != 7
    || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || ((v9 + 16) & ~v9) + *(_QWORD *)(v8 + 64) + (v10 & ~(v9 | 7uLL)) > 0x18)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v11 + 16) & ~v11));
    swift_retain();
  }
  else
  {
    v15 = v7;
    v16 = ~(v9 | 7);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    v17 = (_QWORD *)(((unint64_t)a1 + v10) & v16);
    v18 = (_QWORD *)(((unint64_t)a2 + v10) & v16);
    *v17 = *v18;
    v19 = (_QWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
    v20 = (_QWORD *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v19 = *v20;
    v21 = ((unint64_t)v19 + v9 + 8) & ~v9;
    v22 = ((unint64_t)v20 + v9 + 8) & ~v9;
    v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    swift_retain();
    swift_retain();
    v23(v21, v22, v15);
  }
  return a1;
}

uint64_t sub_229A235F4(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
  v4 = *(_QWORD *)(v3 + 64) + a1;
  v5 = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(unint64_t, uint64_t))(v6 + 8))((v7 + ((((v4 + (v7 | 7)) & ~(v7 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v7, v5);
}

uint64_t sub_229A236C0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 | 7) + v6;
  v11 = (_QWORD *)((v10 + a1) & ~(v9 | 7));
  v12 = (_QWORD *)((v10 + a2) & ~(v9 | 7));
  *v11 = *v12;
  v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v15 = ((unint64_t)v13 + v9 + 8) & ~v9;
  v16 = ((unint64_t)v14 + v9 + 8) & ~v9;
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  swift_retain();
  swift_retain();
  v17(v15, v16, v7);
  return a1;
}

uint64_t sub_229A237C4(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 | 7) + v6;
  v11 = (_QWORD *)((v10 + a1) & ~(v9 | 7));
  v12 = (_QWORD *)((v10 + a2) & ~(v9 | 7));
  *v11 = *v12;
  swift_retain();
  swift_release();
  v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  swift_retain();
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, v7);
  return a1;
}

uint64_t sub_229A238DC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 | 7) + v6;
  v11 = (_QWORD *)((v10 + a1) & ~(v9 | 7));
  v12 = (_QWORD *)((v10 + a2) & ~(v9 | 7));
  *v11 = *v12;
  v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, v7);
  return a1;
}

uint64_t sub_229A239C8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 | 7) + v6;
  v11 = (_QWORD *)((v10 + a1) & ~(v9 | 7));
  v12 = (_QWORD *)((v10 + a2) & ~(v9 | 7));
  *v11 = *v12;
  swift_release();
  v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, v7);
  return a1;
}

uint64_t sub_229A23AC8(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int v17;
  unsigned int v19;
  int v20;
  int v21;
  unint64_t *v22;
  unint64_t v23;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= 0x7FFFFFFF)
    v10 = 0x7FFFFFFF;
  else
    v10 = *(_DWORD *)(v8 + 84);
  if (v10 <= v6)
    v11 = v6;
  else
    v11 = v10;
  if (!a2)
    return 0;
  v12 = *(unsigned __int8 *)(v8 + 80);
  v13 = v12 | 7;
  v14 = (v12 | 7) + *(_QWORD *)(v5 + 64);
  if (a2 <= v11)
    goto LABEL_27;
  v15 = ((v12 + 16) & ~v12) + *(_QWORD *)(v8 + 64) + (v14 & ~v13);
  v16 = 8 * v15;
  if (v15 <= 3)
  {
    v19 = ((a2 - v11 + ~(-1 << v16)) >> v16) + 1;
    if (HIWORD(v19))
    {
      v17 = *(_DWORD *)(a1 + v15);
      if (!v17)
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v19 > 0xFF)
    {
      v17 = *(unsigned __int16 *)(a1 + v15);
      if (!*(_WORD *)(a1 + v15))
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v19 < 2)
    {
LABEL_27:
      if (v6 >= v10)
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, v6, AssociatedTypeWitness);
      v22 = (unint64_t *)((((v14 + a1) & ~v13) + 15) & 0xFFFFFFFFFFFFFFF8);
      if ((v9 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(((unint64_t)v22 + v12 + 8) & ~v12, v9, v7);
      v23 = *v22;
      if (v23 >= 0xFFFFFFFF)
        LODWORD(v23) = -1;
      return (v23 + 1);
    }
  }
  v17 = *(unsigned __int8 *)(a1 + v15);
  if (!*(_BYTE *)(a1 + v15))
    goto LABEL_27;
LABEL_18:
  v20 = (v17 - 1) << v16;
  if (v15 > 3)
    v20 = 0;
  if ((_DWORD)v15)
  {
    if (v15 <= 3)
      v21 = v15;
    else
      v21 = 4;
    __asm { BR              X12 }
  }
  return v11 + v20 + 1;
}

void sub_229A23CF4(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  size_t v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  int v15;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v8 + 84) <= 0x7FFFFFFFu)
    v9 = 0x7FFFFFFF;
  else
    v9 = *(_DWORD *)(v8 + 84);
  if (v9 <= v7)
    v10 = v7;
  else
    v10 = v9;
  v11 = (((*(unsigned __int8 *)(v8 + 80) | 7) + *(_QWORD *)(v6 + 64)) & ~(*(unsigned __int8 *)(v8 + 80) | 7))
      + ((*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
      + *(_QWORD *)(v8 + 64);
  if (a3 <= v10)
  {
    v12 = 0;
  }
  else if (v11 <= 3)
  {
    v14 = ((a3 - v10 + ~(-1 << (8 * v11))) >> (8 * v11)) + 1;
    if (HIWORD(v14))
    {
      v12 = 4u;
    }
    else if (v14 >= 0x100)
    {
      v12 = 2;
    }
    else
    {
      v12 = v14 > 1;
    }
  }
  else
  {
    v12 = 1u;
  }
  if (v10 < a2)
  {
    v13 = ~v10 + a2;
    if (v11 < 4)
    {
      if ((_DWORD)v11)
      {
        v15 = v13 & ~(-1 << (8 * v11));
        bzero(a1, v11);
        if ((_DWORD)v11 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if ((_DWORD)v11 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

uint64_t sub_229A24030()
{
  uint64_t result;
  unint64_t v1;

  swift_getAssociatedTypeWitness();
  result = sub_229A2C59C();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for JUComponentView.Coordinator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JUComponentView.Coordinator);
}

uint64_t method lookup function for JUComponentView.Coordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_229A240EC()
{
  uint64_t result;
  unint64_t v1;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  result = sub_229A2C068();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_229A24208(char *a1, char *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  char *v7;
  uint64_t AssociatedTypeWitness;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *(_QWORD *)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (char *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedConformanceWitness();
    swift_bridgeObjectRetain();
    v9 = (int *)sub_229A2C068();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(&v7[v9[13]], &a2[v9[13]], AssociatedTypeWitness);
    v10 = v9[14];
    v11 = &v7[v10];
    v12 = &a2[v10];
    v13 = sub_229A2C398();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    *(_QWORD *)&v7[v9[15]] = *(_QWORD *)&a2[v9[15]];
    v14 = *(int *)(a3 + 36);
    v15 = *(void **)&a2[v14];
    *(_QWORD *)&v7[v14] = v15;
    swift_retain();
    v16 = v15;
  }
  return v7;
}

void sub_229A243A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;

  swift_bridgeObjectRelease();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  v4 = sub_229A2C068();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1 + *(int *)(v4 + 52), AssociatedTypeWitness);
  v5 = a1 + *(int *)(v4 + 56);
  v6 = sub_229A2C398();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();

}

char *sub_229A244E0(char *a1, char *a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  swift_bridgeObjectRetain();
  v7 = (int *)sub_229A2C068();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(&a1[v7[13]], &a2[v7[13]], AssociatedTypeWitness);
  v8 = v7[14];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_229A2C398();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  *(_QWORD *)&a1[v7[15]] = *(_QWORD *)&a2[v7[15]];
  v12 = *(int *)(a3 + 36);
  v13 = *(void **)&a2[v12];
  *(_QWORD *)&a1[v12] = v13;
  swift_retain();
  v14 = v13;
  return a1;
}

char *sub_229A24650(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t AssociatedTypeWitness;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  v6 = (int *)sub_229A2C068();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 24))(&a1[v6[13]], &a2[v6[13]], AssociatedTypeWitness);
  v7 = v6[14];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_229A2C398();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_QWORD *)&a1[v6[15]] = *(_QWORD *)&a2[v6[15]];
  swift_retain();
  swift_release();
  v11 = *(int *)(a3 + 36);
  v12 = *(void **)&a2[v11];
  v13 = *(void **)&a1[v11];
  *(_QWORD *)&a1[v11] = v12;
  v14 = v12;

  return a1;
}

char *sub_229A247D8(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  v6 = (int *)sub_229A2C068();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(&a1[v6[13]], &a2[v6[13]], AssociatedTypeWitness);
  v7 = v6[14];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_229A2C398();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_QWORD *)&a1[v6[15]] = *(_QWORD *)&a2[v6[15]];
  *(_QWORD *)&a1[*(int *)(a3 + 36)] = *(_QWORD *)&a2[*(int *)(a3 + 36)];
  return a1;
}

char *sub_229A24934(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t AssociatedTypeWitness;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  v6 = (int *)sub_229A2C068();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 40))(&a1[v6[13]], &a2[v6[13]], AssociatedTypeWitness);
  v7 = v6[14];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_229A2C398();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_QWORD *)&a1[v6[15]] = *(_QWORD *)&a2[v6[15]];
  swift_release();
  v11 = *(int *)(a3 + 36);
  v12 = *(void **)&a1[v11];
  *(_QWORD *)&a1[v11] = *(_QWORD *)&a2[v11];

  return a1;
}

uint64_t sub_229A24AA8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_229A24AB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  v6 = sub_229A2C068();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_229A24BDC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_229A24BE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  result = sub_229A2C068();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36)) = (a2 - 1);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

uint64_t sub_229A24D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;

  v5 = type metadata accessor for JUComponentReloader(0, *(_QWORD *)(v4 + 40), *(_QWORD *)(v4 + 56), a4);
  v6 = (*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v7 = v4 + v6;
  swift_bridgeObjectRelease();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  v8 = sub_229A2C068();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v7 + *(int *)(v8 + 52), AssociatedTypeWitness);
  v9 = v7 + *(int *)(v8 + 56);
  v10 = sub_229A2C398();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_229A24EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v7 = v4[4];
  v8 = v4[5];
  v9 = v4[6];
  v10 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for JUComponentReloader(0, v8, v4[7], a4) - 8) + 80);
  v11 = v4[2];
  v12 = v4[3];
  v13 = v4[8];
  v14 = (uint64_t)v4 + ((v10 + 72) & ~v10);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v15;
  *v15 = v5;
  v15[1] = sub_229A24FB0;
  return sub_229A20EF0(a1, v11, v12, v13, v14, v7, v8, v9);
}

uint64_t sub_229A24FB0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_229A24FF8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229A2501C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_229A24FB0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255A872E0 + dword_255A872E0))(a1, v4);
}

uint64_t sub_229A2508C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_229A250C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_229A25104(__int128 *a1, uint64_t a2)
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

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22E2D4B20](a1, v6, a5);
}

uint64_t JUDiffableDataReader.init(observing:content:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t JUDiffableDataReader.body.getter@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  __int128 *v2;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  void (*v24)(char *, uint64_t);
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v34 = a2;
  v4 = a1[2];
  v33 = a1[4];
  swift_getAssociatedTypeWitness();
  v5 = sub_229A2C344();
  swift_getAssociatedTypeWitness();
  v6 = sub_229A2C344();
  v7 = MEMORY[0x24BE5CAE0];
  v37 = v5;
  v38 = v6;
  v39 = MEMORY[0x22E2D4B8C](MEMORY[0x24BE5CAE0], v5);
  v40 = MEMORY[0x22E2D4B8C](v7, v6);
  sub_229A2C098();
  v8 = sub_229A2C32C();
  v32 = a1[3];
  v9 = sub_229A2C0F8();
  v10 = sub_229A2C200();
  v30 = v8;
  v29 = MEMORY[0x22E2D4B8C](MEMORY[0x24BE5C5C8], v8);
  v36[0] = a1[5];
  v11 = v36[0];
  v36[1] = MEMORY[0x24BDF0910];
  v35[0] = v36[0];
  v35[1] = MEMORY[0x22E2D4B8C](MEMORY[0x24BDED308], v9, v36);
  v31 = v10;
  v28 = MEMORY[0x22E2D4B8C](MEMORY[0x24BDEF3E0], v10, v35);
  v37 = v8;
  v38 = v10;
  v39 = v29;
  v40 = v28;
  v12 = sub_229A2BFE4();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v26 - v17;
  v19 = *((_QWORD *)v2 + 2);
  v26 = *v2;
  v20 = v33;
  v27 = sub_229A2C044();
  v21 = swift_allocObject();
  v22 = v32;
  *(_QWORD *)(v21 + 16) = v4;
  *(_QWORD *)(v21 + 24) = v22;
  *(_QWORD *)(v21 + 32) = v20;
  *(_QWORD *)(v21 + 40) = v11;
  *(_OWORD *)(v21 + 48) = v26;
  *(_QWORD *)(v21 + 64) = v19;
  swift_unknownObjectRetain();
  swift_retain();
  sub_229A2BFF0();
  MEMORY[0x22E2D4B8C](MEMORY[0x24BEC6660], v12);
  v23 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v23(v18, v16, v12);
  v24 = *(void (**)(char *, uint64_t))(v13 + 8);
  v24(v16, v12);
  v23(v34, v18, v12);
  return ((uint64_t (*)(char *, uint64_t))v24)(v18, v12);
}

uint64_t sub_229A25418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(_QWORD)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(_QWORD);
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t);
  char *v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  void (*v54)(char *, uint64_t, uint64_t);
  void (*v55)(uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v60[3];
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(_QWORD);
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[6];

  v77 = a8;
  v72 = a4;
  v70 = a3;
  v64 = a2;
  v68 = a1;
  v78 = a9;
  v75 = *(_QWORD *)(a6 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v61 = (char *)v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v76 = (char *)v60 - v14;
  v15 = sub_229A2C0F8();
  v65 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v67 = (char *)v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v66 = (char *)v60 - v18;
  swift_getAssociatedTypeWitness();
  v19 = sub_229A2C344();
  v63 = a7;
  v62 = a5;
  swift_getAssociatedTypeWitness();
  v20 = sub_229A2C344();
  v21 = MEMORY[0x24BE5CAE0];
  v22 = MEMORY[0x22E2D4B8C](MEMORY[0x24BE5CAE0], v19);
  v23 = MEMORY[0x22E2D4B8C](v21, v20);
  v60[2] = v19;
  v82[2] = v19;
  v82[3] = v20;
  v60[1] = v22;
  v82[4] = v22;
  v82[5] = v23;
  v60[0] = v23;
  v24 = sub_229A2C098();
  v25 = sub_229A2C59C();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v60 - v28;
  v30 = *(_QWORD *)(v24 - 8);
  v31 = MEMORY[0x24BDAC7A8](v27);
  v33 = (char *)v60 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)v60 - v34;
  v69 = v15;
  v36 = sub_229A2C200();
  v73 = *(_QWORD *)(v36 - 8);
  v74 = v36;
  MEMORY[0x24BDAC7A8](v36);
  v71 = (char *)v60 - v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v29, v68, v25);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v29, 1, v24) == 1)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v25);
    sub_229A2C08C();
    v38 = v76;
    v39 = v72;
    v40 = v70;
    v70(v33);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v24);
    v41 = (_QWORD *)swift_allocObject();
    v41[2] = v62;
    v41[3] = a6;
    v42 = v77;
    v41[4] = v63;
    v41[5] = v42;
    v41[6] = v64;
    v41[7] = v40;
    v41[8] = v39;
    swift_unknownObjectRetain();
    swift_retain();
    v43 = (uint64_t)v67;
    sub_229A2C284();
    swift_release();
    (*(void (**)(char *, uint64_t))(v75 + 8))(v38, a6);
    v82[0] = v42;
    v82[1] = MEMORY[0x24BDF0910];
    v44 = v69;
    MEMORY[0x22E2D4B8C](MEMORY[0x24BDED308], v69, v82);
    v45 = v65;
    v46 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
    v47 = v66;
    v46(v66, v43, v44);
    v48 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
    v48(v43, v44);
    v46((char *)v43, (uint64_t)v47, v44);
    v49 = v44;
    v50 = v71;
    sub_229A25B28(v43, a6, v44);
    v48(v43, v44);
    v48((uint64_t)v47, v44);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v35, v29, v24);
    v51 = (uint64_t)v61;
    v70(v35);
    v52 = v75;
    v53 = v76;
    v54 = *(void (**)(char *, uint64_t, uint64_t))(v75 + 16);
    v54(v76, v51, a6);
    v55 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
    v55(v51, a6);
    v54((char *)v51, (uint64_t)v53, a6);
    v42 = v77;
    v79[0] = v77;
    v79[1] = MEMORY[0x24BDF0910];
    v49 = v69;
    MEMORY[0x22E2D4B8C](MEMORY[0x24BDED308], v69, v79);
    v50 = v71;
    sub_229A25A64(v51, a6);
    v55(v51, a6);
    v55((uint64_t)v53, a6);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v35, v24);
  }
  v81[0] = v42;
  v81[1] = MEMORY[0x24BDF0910];
  v56 = MEMORY[0x22E2D4B8C](MEMORY[0x24BDED308], v49, v81);
  v80[0] = v42;
  v80[1] = v56;
  v57 = v74;
  MEMORY[0x22E2D4B8C](MEMORY[0x24BDEF3E0], v74, v80);
  v58 = v73;
  (*(void (**)(uint64_t, char *, uint64_t))(v73 + 16))(v78, v50, v57);
  return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v50, v57);
}

uint64_t sub_229A25A04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_229A25418(a1, *(_QWORD *)(v2 + 48), *(void (**)(_QWORD))(v2 + 56), *(_QWORD *)(v2 + 64), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

uint64_t sub_229A25A18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_229A25A30()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_229A25A64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_229A2C1E8();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_229A2C1F4();
}

uint64_t sub_229A25B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_229A2C1E8();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_229A2C1F4();
}

uint64_t sub_229A25BF8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_229A25C04()
{
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_229A25C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *sub_229A25C6C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_229A25CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_unknownObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t sub_229A25D20(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_229A25D68(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for JUDiffableDataReader()
{
  JUMPOUT(0x22E2D4B20);
}

uint64_t sub_229A25DB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(a1 + 24);
  swift_getAssociatedTypeWitness();
  v2 = sub_229A2C344();
  swift_getAssociatedTypeWitness();
  v3 = sub_229A2C344();
  v4 = MEMORY[0x24BE5CAE0];
  v14 = v2;
  v15 = v3;
  v16 = MEMORY[0x22E2D4B8C](MEMORY[0x24BE5CAE0], v2);
  v17 = MEMORY[0x22E2D4B8C](v4, v3);
  sub_229A2C098();
  v5 = sub_229A2C32C();
  v6 = sub_229A2C0F8();
  v7 = sub_229A2C200();
  v8 = MEMORY[0x22E2D4B8C](MEMORY[0x24BE5C5C8], v5);
  v13[0] = v1;
  v13[1] = MEMORY[0x24BDF0910];
  v12[0] = v1;
  v12[1] = MEMORY[0x22E2D4B8C](MEMORY[0x24BDED308], v6, v13);
  v9 = MEMORY[0x22E2D4B8C](MEMORY[0x24BDEF3E0], v7, v12);
  v14 = v5;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v10 = sub_229A2BFE4();
  return MEMORY[0x22E2D4B8C](MEMORY[0x24BEC6660], v10);
}

uint64_t objectdestroyTm_0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229A25F60()
{
  return sub_229A2C050();
}

void JUPresenterView.init(presenter:content:)()
{
  type metadata accessor for JUPresenterView();
}

uint64_t sub_229A25FE8(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t result;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;

  v10 = (uint64_t *)(v2 + a1[16]);
  *v10 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A87390);
  swift_storeEnumTagMultiPayload();
  v11 = v2 + a1[17];
  *(_QWORD *)v11 = swift_getKeyPath();
  *(_QWORD *)(v11 + 8) = 0;
  *(_WORD *)(v11 + 16) = 0;
  v12 = v2 + a1[18];
  *(_QWORD *)v12 = sub_229A260E0();
  *(_BYTE *)(v12 + 8) = v13 & 1;
  *(_QWORD *)(v12 + 16) = v14;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v4;
  v15[3] = v7;
  v15[4] = v3;
  v15[5] = v5;
  v15[6] = v1;
  v15[7] = v8;
  v15[8] = v6;
  result = sub_229A2C0BC();
  *(_QWORD *)v2 = result;
  *(_QWORD *)(v2 + 8) = v17;
  *(_BYTE *)(v2 + 16) = v18 & 1;
  *(_QWORD *)(v2 + 24) = v19;
  *(_QWORD *)(v2 + 32) = v20;
  return result;
}

void type metadata accessor for JUPresenterView()
{
  JUMPOUT(0x22E2D4B20);
}

uint64_t sub_229A260E0()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A875A8);
  sub_229A2C290();
  return v1;
}

uint64_t sub_229A2612C(uint64_t (*a1)(void))
{
  void *v2;
  uint64_t v4;

  v2 = (void *)MEMORY[0x22E2D4970]();
  v4 = a1();
  objc_autoreleasePoolPop(v2);
  sub_229A2C404();
  swift_unknownObjectRetain();
  sub_229A2C3A4();
  swift_unknownObjectRelease();
  return v4;
}

void JUPresenterView.init<A>(presenter:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a5;
  v16[3] = a6;
  v16[4] = a7;
  v16[5] = a8;
  v16[6] = a1;
  v16[7] = a2;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a5;
  v17[3] = a7;
  v17[4] = a8;
  v17[5] = a3;
  v17[6] = a4;
  v19 = type metadata accessor for _JUObservedPresenter(0, a6, *(_QWORD *)(a8 + 8), v18);
  MEMORY[0x22E2D4B8C](&protocol conformance descriptor for _JUObservedPresenter<A>, v19);
  v20 = a8;
  MEMORY[0x22E2D4B8C](&protocol conformance descriptor for <> _JUObservedPresenter<A>, v19, &v20);
  JUPresenterView.init(presenter:content:)();
}

uint64_t _JUObservedPresenter.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t sub_229A2633C@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  uint64_t v16;

  v7 = *(_QWORD *)(a3 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v16 - v11;
  v13 = swift_unknownObjectRetain();
  a2(v13);
  swift_unknownObjectRelease();
  sub_229A25F88((uint64_t)v10, a3, (uint64_t)v12);
  v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v10, a3);
  sub_229A25A18((uint64_t)v12, a3, a4);
  return ((uint64_t (*)(char *, uint64_t))v14)(v12, a3);
}

uint64_t _JUObservedPresenter.base.getter()
{
  sub_229A28458();
  return swift_unknownObjectRetain();
}

uint64_t sub_229A26448()
{
  return sub_229A2C140();
}

uint64_t sub_229A26468(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A873B8);
  MEMORY[0x24BDAC7A8](v2);
  sub_229A298B8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_255A873B8);
  return sub_229A2C14C();
}

uint64_t sub_229A264EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v2 = v1 + *(int *)(a1 + 68);
  v3 = *(_QWORD *)v2;
  v4 = *(_QWORD *)(v2 + 8);
  v5 = *(unsigned __int8 *)(v2 + 16);
  v6 = *(unsigned __int8 *)(v2 + 17);
  sub_229A28AB0(*(_QWORD *)v2, v4, v5, *(_BYTE *)(v2 + 17));
  v7 = sub_229A27E50(v3, v4, v5 | (v6 << 8));
  sub_229A28474(v3, v4, v5, v6);
  return v7;
}

uint64_t sub_229A26588@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;

  result = sub_229A2C128();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_229A265B4(uint64_t *a1)
{
  sub_229A28ABC(*a1, a1[1]);
  return sub_229A2C134();
}

uint64_t sub_229A26600()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229A26624()
{
  uint64_t v0;

  return sub_229A2612C(*(uint64_t (**)(void))(v0 + 56));
}

uint64_t sub_229A26634()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229A26658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t result;

  v5 = (uint64_t (*)(void))v4[6];
  type metadata accessor for _JUObservedPresenter(0, v4[3], *(_QWORD *)(v4[5] + 8), a4);
  v6 = v5();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v6;
  return result;
}

uint64_t sub_229A266B0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229A266D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_229A2633C(a1, *(void (**)(uint64_t))(v2 + 40), *(_QWORD *)(v2 + 16), a2);
}

uint64_t type metadata accessor for _JUObservedPresenter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _JUObservedPresenter);
}

uint64_t sub_229A266F0()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A875A0);
  sub_229A2C29C();
  return v1;
}

uint64_t sub_229A26750()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A875A0);
  return sub_229A2C2A8();
}

uint64_t JUPresenterView.body.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  void (*v20)(void);
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  char *v33;
  char *v34;
  void (*v35)(char *, char *, _QWORD *);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  void (*v55)(char *, char *, _QWORD *);
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, uint64_t, _QWORD *);
  uint64_t v77;
  char *v78;
  char *v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[3];

  v72 = a2;
  v4 = sub_229A2C488();
  v70 = *(_QWORD *)(v4 - 8);
  v71 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v69 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(a1 - 1);
  v74 = *(_QWORD *)(v7 + 64);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1[3] - 8);
  v77 = a1[3];
  v60 = v11;
  MEMORY[0x24BDAC7A8](v8);
  v56 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_229A2C0F8();
  v63 = *(_QWORD *)(v13 - 8);
  v61 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v78 = (char *)&v55 - v14;
  v15 = sub_229A2C0F8();
  v67 = *(_QWORD *)(v15 - 8);
  v64 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v79 = (char *)&v55 - v16;
  sub_229A2C0D4();
  v66 = sub_229A2C0F8();
  v68 = *(_QWORD *)(v66 - 8);
  v17 = MEMORY[0x24BDAC7A8](v66);
  v62 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v65 = (uint64_t)&v55 - v19;
  v20 = *(void (**)(void))(v2 + 24);
  v75 = v2;
  v21 = a1[2];
  v22 = a1[4];
  sub_229A2C0C8();
  v20();
  swift_unknownObjectRelease();
  v76 = *(void (**)(char *, uint64_t, _QWORD *))(v7 + 16);
  v23 = v10;
  v76(v10, v2, a1);
  v24 = *(unsigned __int8 *)(v7 + 80);
  v25 = (v24 + 56) & ~v24;
  v73 = v25 + v74;
  v74 = v24 | 7;
  v26 = (char *)swift_allocObject();
  *((_QWORD *)v26 + 2) = v21;
  v27 = v21;
  v28 = v77;
  *((_QWORD *)v26 + 3) = v77;
  *((_QWORD *)v26 + 4) = v22;
  v30 = a1[5];
  v29 = a1[6];
  v57 = v22;
  *((_QWORD *)v26 + 5) = v30;
  *((_QWORD *)v26 + 6) = v29;
  v58 = v30;
  v59 = v25;
  v55 = *(void (**)(char *, char *, _QWORD *))(v7 + 32);
  v55(&v26[v25], v23, a1);
  v31 = v56;
  sub_229A2C284();
  swift_release();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v31, v28);
  v76(v23, v75, a1);
  v32 = (_QWORD *)swift_allocObject();
  v32[2] = v27;
  v32[3] = v28;
  v32[4] = v22;
  v32[5] = v30;
  v33 = (char *)v32 + v25;
  v32[6] = v29;
  v34 = v23;
  v35 = v55;
  v55(v33, v23, a1);
  v36 = MEMORY[0x24BDF0910];
  v82[0] = v29;
  v82[1] = MEMORY[0x24BDF0910];
  v37 = v61;
  v38 = MEMORY[0x22E2D4B8C](MEMORY[0x24BDED308], v61, v82);
  v39 = v78;
  sub_229A2C260();
  swift_release();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v39, v37);
  v76(v34, v75, a1);
  v40 = (_QWORD *)swift_allocObject();
  v41 = v77;
  v40[2] = v27;
  v40[3] = v41;
  v42 = v58;
  v40[4] = v57;
  v40[5] = v42;
  v43 = (char *)v40 + v59;
  v40[6] = v29;
  v35(v43, v34, a1);
  v81[0] = v38;
  v81[1] = v36;
  v44 = MEMORY[0x24BDED308];
  v45 = v64;
  v46 = MEMORY[0x22E2D4B8C](MEMORY[0x24BDED308], v64, v81);
  v47 = v69;
  sub_229A2C470();
  v48 = (uint64_t)v62;
  v49 = v79;
  sub_229A2C278();
  swift_release();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v47, v71);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v49, v45);
  v50 = sub_229A297A4(&qword_255A873B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC4E0], MEMORY[0x24BDEC4C8]);
  v80[0] = v46;
  v80[1] = v50;
  v51 = v66;
  MEMORY[0x22E2D4B8C](v44, v66, v80);
  v52 = v65;
  sub_229A25F88(v48, v51, v65);
  v53 = *(void (**)(uint64_t, uint64_t))(v68 + 8);
  v53(v48, v51);
  sub_229A25A18(v52, v51, v72);
  return ((uint64_t (*)(uint64_t, uint64_t))v53)(v52, v51);
}

void sub_229A26D00()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_229A2C0EC();
  MEMORY[0x24BDAC7A8](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A873B8);
  MEMORY[0x24BDAC7A8](v1);
  type metadata accessor for JUPresenterView();
}

uint64_t sub_229A26DC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_229A266F0();
  if ((v4 & 1) != 0)
  {
    sub_229A27C54(v2);
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A87398);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v2, 1, v5) == 1)
    {
      sub_229A250C8(v2, &qword_255A873B8);
    }
    else
    {
      MEMORY[0x22E2D4574](v5);
      sub_229A250C8(v2, &qword_255A87398);
      sub_229A2C0E0();
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
    }
    sub_229A26750();
  }
  sub_229A2C0C8();
  sub_229A2C3BC();
  swift_unknownObjectRelease();
  sub_229A2C0C8();
  sub_229A2C3B0();
  return swift_unknownObjectRelease();
}

void sub_229A26F00()
{
  uint64_t v0;
  uint64_t v1;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A873B8);
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_229A2C3F8();
  MEMORY[0x24BDAC7A8](v1);
  type metadata accessor for JUPresenterView();
}

uint64_t sub_229A26FC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_229A266F0();
  sub_229A27C54(v3);
  sub_229A264EC(a1);
  sub_229A2C3EC();
  sub_229A2C0C8();
  sub_229A2C3D4();
  swift_unknownObjectRelease();
  sub_229A2C0C8();
  sub_229A2C3C8();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v2, *(_QWORD *)(v4 - 128));
}

uint64_t sub_229A270A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A874D0);
  v6[8] = v7;
  v6[9] = *(_QWORD *)(v7 - 8);
  v6[10] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A874D8);
  v6[11] = v8;
  v6[12] = *(_QWORD *)(v8 - 8);
  v6[13] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A874E0);
  v6[14] = v9;
  v6[15] = *(_QWORD *)(v9 - 8);
  v6[16] = swift_task_alloc();
  v6[17] = sub_229A2C464();
  v6[18] = sub_229A2C458();
  v6[19] = sub_229A2C44C();
  v6[20] = v10;
  return swift_task_switch();
}

uint64_t sub_229A271A0()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[12] + 104))(v0[13], *MEMORY[0x24BEE6A10], v0[11]);
  sub_229A2C4DC();
  sub_229A2C4AC();
  v0[21] = 0;
  v0[22] = sub_229A2C458();
  v1 = (_QWORD *)swift_task_alloc();
  v0[23] = v1;
  *v1 = v0;
  v1[1] = sub_229A27288;
  return sub_229A2C4B8();
}

uint64_t sub_229A27288()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_229A272DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_BYTE *)(v0 + 208) != 1)
    return swift_task_switch();
  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 64);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_229A273A4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 192) = sub_229A2C458();
  sub_229A2C44C();
  return swift_task_switch();
}

void sub_229A27404()
{
  swift_release();
  sub_229A279CC();
}

uint64_t sub_229A27458()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 200) = v0;
  return swift_task_switch();
}

uint64_t sub_229A27484()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[21] = v0[25];
  v0[22] = sub_229A2C458();
  v1 = (_QWORD *)swift_task_alloc();
  v0[23] = v1;
  *v1 = v0;
  v1[1] = sub_229A27288;
  return sub_229A2C4B8();
}

uint64_t sub_229A2750C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  char *v19;
  char *v20;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v23 = a1;
  v1 = sub_229A2C308();
  v28 = *(_QWORD *)(v1 - 8);
  v29 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v25 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_229A2C320();
  v26 = *(_QWORD *)(v3 - 8);
  v27 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v24 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A874E8);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v22 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_229A2C560();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229A29670();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A874F8);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_229A2CC90;
  sub_229A2C548();
  sub_229A2C554();
  aBlock[0] = v12;
  sub_229A297A4(&qword_255A87500, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5868], MEMORY[0x24BEE5888]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A87508);
  sub_229A297E4(&qword_255A87510, &qword_255A87508);
  sub_229A2C5A8();
  v13 = sub_229A2C56C();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  *(_QWORD *)(swift_allocObject() + 16) = v13;
  swift_unknownObjectRetain();
  v14 = v23;
  sub_229A2C494();
  swift_getObjectType();
  v15 = v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v22, v14, v5);
  v16 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v16, v15, v5);
  aBlock[4] = sub_229A2975C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_229A278F4;
  aBlock[3] = &block_descriptor;
  v18 = _Block_copy(aBlock);
  v19 = v24;
  sub_229A2C314();
  v20 = v25;
  sub_229A27920();
  sub_229A2C578();
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v20, v29);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v19, v27);
  swift_release();
  sub_229A2C590();
  return swift_unknownObjectRelease();
}

uint64_t sub_229A27878()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A87590);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229A2C4A0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_229A278F4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_229A27920()
{
  sub_229A2C308();
  sub_229A297A4(&qword_255A87578, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A87580);
  sub_229A297E4(&qword_255A87588, &qword_255A87580);
  return sub_229A2C5A8();
}

void sub_229A279CC()
{
  type metadata accessor for JUPresenterView();
}

uint64_t sub_229A27A08()
{
  sub_229A2C0C8();
  sub_229A2C3E0();
  return swift_unknownObjectRelease();
}

uint64_t _JUObservedPresenter.init(_:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t _JUObservedPresenter.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t _JUObservedPresenter.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_229A27AA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_229A2C0A4();
  *a1 = result;
  return result;
}

uint64_t _JUObservedPresenter<>.viewDidLoad()(uint64_t a1)
{
  return sub_229A27B54(a1, (void (*)(uint64_t, uint64_t))MEMORY[0x24BE5D9B8]);
}

uint64_t _JUObservedPresenter<>.viewWillAppear()(uint64_t a1)
{
  return sub_229A27B54(a1, (void (*)(uint64_t, uint64_t))MEMORY[0x24BE5D9C8]);
}

uint64_t _JUObservedPresenter<>.viewDidAppear()(uint64_t a1)
{
  return sub_229A27B54(a1, (void (*)(uint64_t, uint64_t))MEMORY[0x24BE5D9C0]);
}

uint64_t _JUObservedPresenter<>.viewWillDisappear(forReason:)()
{
  swift_unknownObjectRetain();
  sub_229A2C3D4();
  return swift_unknownObjectRelease();
}

uint64_t _JUObservedPresenter<>.viewDidDisappear()(uint64_t a1)
{
  return sub_229A27B54(a1, (void (*)(uint64_t, uint64_t))MEMORY[0x24BE5D9D0]);
}

uint64_t _JUObservedPresenter<>.viewDidReceiveMemoryWarning()(uint64_t a1)
{
  return sub_229A27B54(a1, (void (*)(uint64_t, uint64_t))MEMORY[0x24BE5D9E0]);
}

uint64_t sub_229A27B54(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  swift_unknownObjectRetain();
  a2(v5, a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_229A27BA0(uint64_t a1, uint64_t a2)
{
  return _JUObservedPresenter<>.viewDidLoad()(*(_QWORD *)(a2 - 8));
}

uint64_t sub_229A27BA8(uint64_t a1, uint64_t a2)
{
  return _JUObservedPresenter<>.viewWillAppear()(*(_QWORD *)(a2 - 8));
}

uint64_t sub_229A27BB0(uint64_t a1, uint64_t a2)
{
  return _JUObservedPresenter<>.viewDidAppear()(*(_QWORD *)(a2 - 8));
}

uint64_t sub_229A27BB8()
{
  return _JUObservedPresenter<>.viewWillDisappear(forReason:)();
}

uint64_t sub_229A27BC0(uint64_t a1, uint64_t a2)
{
  return _JUObservedPresenter<>.viewDidDisappear()(*(_QWORD *)(a2 - 8));
}

uint64_t sub_229A27BC8(uint64_t a1, uint64_t a2)
{
  return _JUObservedPresenter<>.viewDidReceiveMemoryWarning()(*(_QWORD *)(a2 - 8));
}

uint64_t _JUObservedPresenter.description.getter()
{
  sub_229A2C680();
  return 0;
}

uint64_t sub_229A27C18()
{
  return _JUObservedPresenter.description.getter();
}

unint64_t sub_229A27C38()
{
  return 0xD000000000000032;
}

uint64_t sub_229A27C54@<X0>(uint64_t a1@<X8>)
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
  os_log_type_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v4 = sub_229A2C164();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A87390);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229A298B8(v2, (uint64_t)v10, &qword_255A87390);
  if (swift_getEnumCaseMultiPayload() == 1)
    return sub_229A29864((uint64_t)v10, a1);
  v12 = sub_229A2C53C();
  v13 = sub_229A2C230();
  if (os_log_type_enabled(v13, v12))
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v17 = v15;
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = sub_229A28014(0xD000000000000021, 0x8000000229A2E3D0, &v17);
    _os_log_impl(&dword_229A1D000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2D4BEC](v15, -1, -1);
    MEMORY[0x22E2D4BEC](v14, -1, -1);
  }

  sub_229A2C158();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_229A27E50(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v16;

  v6 = sub_229A2C164();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 0x100) != 0)
  {
    sub_229A28ABC(a1, a2);
  }
  else
  {
    swift_retain();
    v10 = sub_229A2C53C();
    v11 = sub_229A2C230();
    if (os_log_type_enabled(v11, v10))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      v16 = v13;
      *(_DWORD *)v12 = 136315138;
      *(_QWORD *)(v12 + 4) = sub_229A28014(0xD000000000000017, 0x8000000229A2E3B0, &v16);
      _os_log_impl(&dword_229A1D000, v11, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E2D4BEC](v13, -1, -1);
      MEMORY[0x22E2D4BEC](v12, -1, -1);
    }

    sub_229A2C158();
    swift_getAtKeyPath();
    sub_229A28474(a1, a2, a3, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v16;
  }
  return a1;
}

unint64_t sub_229A28014(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_229A280E4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_229A29824((uint64_t)v12, *a3);
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
      sub_229A29824((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

unint64_t sub_229A280E4(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_229A281E0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_229A2C614();
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

uint64_t sub_229A281E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_229A28274(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_229A28370(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_229A28370((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_229A28274(uint64_t a1, unint64_t a2)
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
      v3 = sub_229A2830C(v2, 0);
      result = sub_229A2C608();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_229A2C428();
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

_QWORD *sub_229A2830C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A87598);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_229A28370(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A87598);
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

uint64_t sub_229A28458()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_229A28464(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_unknownObjectRelease();
  else
    return swift_release();
}

uint64_t sub_229A28474(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) != 0)
    return sub_229A28480(a1, a2);
  else
    return swift_release();
}

uint64_t sub_229A28480(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_229A284B0()
{
  sub_229A284CC();
}

void sub_229A284C0()
{
  sub_229A284CC();
}

void sub_229A284CC()
{
  type metadata accessor for JUPresenterView();
}

uint64_t sub_229A28508(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v7 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v9(v2 + ((v7 + 56) & ~v7), v1, v3, v4, v5, v6);
}

void objectdestroy_12Tm()
{
  type metadata accessor for JUPresenterView();
}

uint64_t sub_229A28588(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v4 = v1 + ((v3 + 56) & ~v3);
  sub_229A28464(*(_QWORD *)v4, *(_QWORD *)(v4 + 8), *(_BYTE *)(v4 + 16));
  swift_release();
  v5 = v4 + *(int *)(a1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A87390);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A87398);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 1, v6))
    {
      swift_release();
      swift_release();
      v7 = v5 + *(int *)(v6 + 32);
      v8 = sub_229A2C0EC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
    }
  }
  else
  {
    swift_release();
  }
  sub_229A28474(*(_QWORD *)(v4 + *(int *)(a1 + 68)), *(_QWORD *)(v4 + *(int *)(a1 + 68) + 8), *(unsigned __int8 *)(v4 + *(int *)(a1 + 68) + 16), *(_BYTE *)(v4 + *(int *)(a1 + 68) + 17));
  swift_release();
  return swift_deallocObject();
}

void sub_229A286A8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v0[3];
  v3 = v0[4];
  v4 = v0[5];
  v5 = v0[6];
  v1[2] = v0[2];
  v1[3] = v2;
  v1[4] = v3;
  v1[5] = v4;
  v1[6] = v5;
  type metadata accessor for JUPresenterView();
}

uint64_t sub_229A286E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v9 = v2 + ((v8 + 56) & ~v8);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 56) = v10;
  *v10 = v4;
  v10[1] = sub_229A2874C;
  return sub_229A270A4(v9, v1, v3, v5, v6, v7);
}

uint64_t sub_229A2874C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_229A28794()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_229A287D0()
{
  return MEMORY[0x24BDB9D70];
}

void sub_229A287DC()
{
  JUMPOUT(0x22E2D4B8CLL);
}

uint64_t sub_229A287EC()
{
  return swift_allocateGenericValueMetadata();
}

void sub_229A287F4()
{
  unint64_t v0;

  sub_229A29490();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t sub_229A28888(unint64_t a1, uint64_t a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v32)(char *, char *, uint64_t);
  char *v33;
  char *v34;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_QWORD *)(a2 + 8);
    v9 = *(_BYTE *)(a2 + 16);
    sub_229A28AA0(*(_QWORD *)a2, v8, v9);
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = v9;
    v10 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = v10;
    v11 = a3[16];
    v12 = (_QWORD *)(a1 + v11);
    v13 = (_QWORD *)(a2 + v11);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A87390);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A87398);
      v15 = *(_QWORD *)(v14 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
        v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A873B8);
        memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      else
      {
        v18 = v13[1];
        *v12 = *v13;
        v12[1] = v18;
        v19 = *(int *)(v14 + 32);
        v33 = (char *)v13 + v19;
        v34 = (char *)v12 + v19;
        v20 = sub_229A2C0EC();
        v32 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
        swift_retain();
        swift_retain();
        v32(v34, v33, v20);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
    }
    else
    {
      *v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v21 = a3[17];
    v22 = a1 + v21;
    v23 = a2 + v21;
    v24 = *(_QWORD *)v23;
    v25 = *(_QWORD *)(v23 + 8);
    v26 = *(_BYTE *)(v23 + 17);
    v27 = *(_BYTE *)(v23 + 16);
    sub_229A28AB0(*(_QWORD *)v23, v25, v27, v26);
    *(_QWORD *)v22 = v24;
    *(_QWORD *)(v22 + 8) = v25;
    *(_BYTE *)(v22 + 16) = v27;
    *(_BYTE *)(v22 + 17) = v26;
    v28 = a3[18];
    v29 = a1 + v28;
    v30 = a2 + v28;
    *(_QWORD *)v29 = *(_QWORD *)v30;
    *(_BYTE *)(v29 + 8) = *(_BYTE *)(v30 + 8);
    *(_QWORD *)(v29 + 16) = *(_QWORD *)(v30 + 16);
  }
  swift_retain();
  return a1;
}

uint64_t sub_229A28AA0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_unknownObjectRetain();
  else
    return swift_retain();
}

uint64_t sub_229A28AB0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) != 0)
    return sub_229A28ABC(a1, a2);
  else
    return swift_retain();
}

uint64_t sub_229A28ABC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_229A28AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_229A28464(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release();
  v4 = a1 + *(int *)(a2 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A87390);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A87398);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
    {
      swift_release();
      swift_release();
      v6 = v4 + *(int *)(v5 + 32);
      v7 = sub_229A2C0EC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
    }
  }
  else
  {
    swift_release();
  }
  sub_229A28474(*(_QWORD *)(a1 + *(int *)(a2 + 68)), *(_QWORD *)(a1 + *(int *)(a2 + 68) + 8), *(unsigned __int8 *)(a1 + *(int *)(a2 + 68) + 16), *(_BYTE *)(a1 + *(int *)(a2 + 68) + 17));
  return swift_release();
}

uint64_t sub_229A28BE0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unsigned __int8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  char *v32;

  v6 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_BYTE *)(a2 + 16);
  sub_229A28AA0(*(_QWORD *)a2, v7, v8);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  v9 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v9;
  v10 = a3[16];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A87390);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A87398);
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A873B8);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      v16 = v12[1];
      *v11 = *v12;
      v11[1] = v16;
      v17 = *(int *)(v13 + 32);
      v31 = (char *)v12 + v17;
      v32 = (char *)v11 + v17;
      v18 = sub_229A2C0EC();
      v30 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
      swift_retain();
      swift_retain();
      v30(v32, v31, v18);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
  }
  else
  {
    *v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v19 = a3[17];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = *(_QWORD *)v21;
  v23 = *(_QWORD *)(v21 + 8);
  v24 = *(_BYTE *)(v21 + 17);
  v25 = *(_BYTE *)(v21 + 16);
  sub_229A28AB0(*(_QWORD *)v21, v23, v25, v24);
  *(_QWORD *)v20 = v22;
  *(_QWORD *)(v20 + 8) = v23;
  *(_BYTE *)(v20 + 16) = v25;
  *(_BYTE *)(v20 + 17) = v24;
  v26 = a3[18];
  v27 = a1 + v26;
  v28 = a2 + v26;
  *(_QWORD *)v27 = *(_QWORD *)v28;
  *(_BYTE *)(v27 + 8) = *(_BYTE *)(v28 + 8);
  *(_QWORD *)(v27 + 16) = *(_QWORD *)(v28 + 16);
  swift_retain();
  return a1;
}

uint64_t sub_229A28DD0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  char *v39;

  v6 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_BYTE *)(a2 + 16);
  sub_229A28AA0(*(_QWORD *)a2, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  sub_229A28464(v9, v10, v11);
  v12 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v12;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v13 = a3[16];
    v14 = (_QWORD *)(a1 + v13);
    v15 = (_QWORD *)(a2 + v13);
    sub_229A250C8(a1 + v13, &qword_255A87390);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A87390);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A87398);
      v17 = *(_QWORD *)(v16 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
      {
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A873B8);
        memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
      }
      else
      {
        *v14 = *v15;
        v14[1] = v15[1];
        v19 = *(int *)(v16 + 32);
        v38 = (char *)v15 + v19;
        v39 = (char *)v14 + v19;
        v20 = sub_229A2C0EC();
        v37 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
        swift_retain();
        swift_retain();
        v37(v39, v38, v20);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      }
    }
    else
    {
      *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v21 = a3[17];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = *(_QWORD *)v23;
  v25 = *(_QWORD *)(v23 + 8);
  v26 = *(_BYTE *)(v23 + 17);
  v27 = *(_BYTE *)(v23 + 16);
  sub_229A28AB0(*(_QWORD *)v23, v25, v27, v26);
  v28 = *(_QWORD *)v22;
  v29 = *(_QWORD *)(v22 + 8);
  v30 = *(_BYTE *)(v22 + 17);
  *(_QWORD *)v22 = v24;
  *(_QWORD *)(v22 + 8) = v25;
  v31 = *(unsigned __int8 *)(v22 + 16);
  *(_BYTE *)(v22 + 16) = v27;
  *(_BYTE *)(v22 + 17) = v26;
  sub_229A28474(v28, v29, v31, v30);
  v32 = a3[18];
  v33 = a1 + v32;
  v34 = (uint64_t *)(a2 + v32);
  v35 = *v34;
  *(_BYTE *)(v33 + 8) = *((_BYTE *)v34 + 8);
  *(_QWORD *)v33 = v35;
  *(_QWORD *)(v33 + 16) = v34[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_229A29014(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = a3[16];
  v7 = (_QWORD *)(a1 + v6);
  v8 = (_QWORD *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A87390);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A87398);
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A873B8);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      v13 = v8[1];
      *v7 = *v8;
      v7[1] = v13;
      v14 = *(int *)(v10 + 32);
      v15 = (char *)v7 + v14;
      v16 = (char *)v8 + v14;
      v17 = sub_229A2C0EC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v18 = a3[17];
  v19 = a3[18];
  v20 = a1 + v18;
  v21 = a2 + v18;
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *(_WORD *)(v20 + 16) = *(_WORD *)(v21 + 16);
  v22 = a1 + v19;
  v23 = a2 + v19;
  *(_OWORD *)v22 = *(_OWORD *)v23;
  *(_QWORD *)(v22 + 16) = *(_QWORD *)(v23 + 16);
  return a1;
}

uint64_t sub_229A2919C(uint64_t a1, uint64_t a2, int *a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  sub_229A28464(v7, v8, v9);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  if (a1 != a2)
  {
    v10 = a3[16];
    v11 = (_QWORD *)(a1 + v10);
    v12 = (_QWORD *)(a2 + v10);
    sub_229A250C8(a1 + v10, &qword_255A87390);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A87390);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A87398);
      v15 = *(_QWORD *)(v14 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14))
      {
        v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A873B8);
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      else
      {
        v17 = v12[1];
        *v11 = *v12;
        v11[1] = v17;
        v18 = *(int *)(v14 + 32);
        v19 = (char *)v11 + v18;
        v20 = (char *)v12 + v18;
        v21 = sub_229A2C0EC();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v19, v20, v21);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
  }
  v22 = a3[17];
  v23 = a1 + v22;
  v24 = a2 + v22;
  v25 = *(_BYTE *)(v24 + 16);
  v26 = *(_BYTE *)(v24 + 17);
  v27 = *(_QWORD *)v23;
  v28 = *(_QWORD *)(v23 + 8);
  v29 = *(_BYTE *)(v23 + 17);
  *(_OWORD *)v23 = *(_OWORD *)v24;
  v30 = *(unsigned __int8 *)(v23 + 16);
  *(_BYTE *)(v23 + 16) = v25;
  *(_BYTE *)(v23 + 17) = v26;
  sub_229A28474(v27, v28, v30, v29);
  v31 = a3[18];
  v32 = a1 + v31;
  v33 = a2 + v31;
  *(_QWORD *)v32 = *(_QWORD *)v33;
  *(_BYTE *)(v32 + 8) = *(_BYTE *)(v33 + 8);
  *(_QWORD *)(v32 + 16) = *(_QWORD *)(v33 + 16);
  swift_release();
  return a1;
}

uint64_t sub_229A29380()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_229A2938C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_255A873C0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 64), a2, v8);
  }
}

uint64_t sub_229A2940C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_229A29418(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_255A873C0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 64), a2, a2, v7);
  }
  return result;
}

void sub_229A29490()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255A87448[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A873B8);
    v0 = sub_229A2C0B0();
    if (!v1)
      atomic_store(v0, qword_255A87448);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2D4B80](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_229A2952C()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for _JUObservedPresenter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _JUObservedPresenter.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_229A29580(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = sub_229A2C0F8();
  v3 = sub_229A2C0F8();
  sub_229A2C0D4();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEC4E0];
  v5 = sub_229A2C0F8();
  v6 = MEMORY[0x24BDF0910];
  v11[0] = v1;
  v11[1] = MEMORY[0x24BDF0910];
  v7 = MEMORY[0x24BDED308];
  v10[0] = MEMORY[0x22E2D4B8C](MEMORY[0x24BDED308], v2, v11);
  v10[1] = v6;
  v9[0] = MEMORY[0x22E2D4B8C](v7, v3, v10);
  v9[1] = sub_229A297A4(&qword_255A873B0, v4, MEMORY[0x24BDEC4C8]);
  return MEMORY[0x22E2D4B8C](v7, v5, v9);
}

unint64_t sub_229A29670()
{
  unint64_t result;

  result = qword_255A874F0;
  if (!qword_255A874F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A874F0);
  }
  return result;
}

uint64_t sub_229A296AC()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_229A296D0()
{
  swift_getObjectType();
  return sub_229A2C584();
}

uint64_t sub_229A296F8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A874E8);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_229A2975C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A874E8);
  return sub_229A27878();
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

uint64_t sub_229A297A4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E2D4B8C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_229A297E4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E2D4B8C](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_229A29824(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_229A29864(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A873B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_229A298AC()
{
  return sub_229A2C674();
}

uint64_t sub_229A298B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_229A29900()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  char *v2;
  uint64_t v4;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v2 = (char *)&v4 - v1;
  swift_getAssociatedConformanceWitness();
  sub_229A2C410();
  return sub_229A2AA84((uint64_t)v2);
}

uint64_t static JUComponent.component(onSelectPerform:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  swift_retain();
  return sub_229A29A20(a1, a2, a3, a4, a5);
}

uint64_t sub_229A29A20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v13 = (char *)&v17 - v12;
  *a5 = a1;
  a5[1] = a2;
  swift_getAssociatedConformanceWitness();
  sub_229A2C410();
  v15 = (char *)a5 + *(int *)(type metadata accessor for JUSelectableComponentWrapper(0, a3, a4, v14) + 36);
  *(_QWORD *)&v15[*(int *)(sub_229A2C2C0() + 28)] = 0;
  return (*(uint64_t (**)(char *, char *, uint64_t))(v11 + 32))(v15, v13, AssociatedTypeWitness);
}

void sub_229A29B30(_QWORD *a1)
{
  get_witness_table_5JetUI11JUComponentRzl01_ab6_SwiftB00C7Wrapper33_149180D85663AE4EE2CA26AC2F643FEFLLVyxG01_a7Engine_dB09ComponentHPyHCTm(a1, (void (*)(uint64_t, _QWORD, _QWORD))type metadata accessor for JUComponentWrapper);
}

uint64_t type metadata accessor for JUComponentWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JUComponentWrapper);
}

void sub_229A29B50(_QWORD *a1)
{
  get_witness_table_5JetUI11JUComponentRzl01_ab6_SwiftB00C7Wrapper33_149180D85663AE4EE2CA26AC2F643FEFLLVyxG01_a7Engine_dB09ComponentHPyHCTm(a1, (void (*)(uint64_t, _QWORD, _QWORD))type metadata accessor for JUSelectableComponentWrapper);
}

uint64_t type metadata accessor for JUSelectableComponentWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JUSelectableComponentWrapper);
}

uint64_t sub_229A29B70()
{
  uint64_t result;
  unint64_t v1;

  swift_getAssociatedTypeWitness();
  result = sub_229A2C2C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_229A29C08(_QWORD *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = ~(unint64_t)(v6 & 0xF8) & 0xFFFFFFFFFFFFFFF8;
  v8 = ((v6 & 0xF8) + 23) & v7;
  v9 = *(_QWORD *)(v5 + 64) + 7;
  v10 = *a2;
  if ((v6 & 0x1000F8) != 0 || (v9 & 0xFFFFFFFFFFFFFFF8) + v8 + 8 > 0x18)
  {
    *a1 = v10;
    a1 = (_QWORD *)(v10 + v8);
  }
  else
  {
    v12 = a2[1];
    *a1 = v10;
    a1[1] = v12;
    v13 = ((unint64_t)a1 + 23) & v7;
    v14 = ((unint64_t)a2 + 23) & v7;
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v15(v13, v14, AssociatedTypeWitness);
    *(_QWORD *)((v9 + v13) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v9 + v14) & 0xFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_229A29D00(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;

  swift_release();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = *(_DWORD *)(v3 + 80) & 0xF8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))((a1 + v4 + 16) & ~v4, AssociatedTypeWitness);
  return swift_release();
}

_QWORD *sub_229A29D8C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void (*v13)(unint64_t, unint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = *(_DWORD *)(v6 + 80) & 0xF8;
  v8 = v7 + 23;
  v9 = (unint64_t)a1 + v7 + 23;
  v10 = ~v7 & 0xFFFFFFFFFFFFFFF8;
  v11 = v9 & v10;
  v12 = ((unint64_t)a2 + v8) & v10;
  v13 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
  swift_retain();
  v13(v11, v12, AssociatedTypeWitness);
  *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v11) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v12) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

_QWORD *sub_229A29E58(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = *(_DWORD *)(v6 + 80) & 0xF8;
  v8 = v7 + 23;
  v9 = (unint64_t)a1 + v7 + 23;
  v10 = ~v7 & 0xFFFFFFFFFFFFFFF8;
  v11 = v9 & v10;
  v12 = ((unint64_t)a2 + v8) & v10;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 24))(v9 & v10, v12, AssociatedTypeWitness);
  *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v11) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v12) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_229A29F28(_OWORD *a1, _OWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  *a1 = *a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 80) & 0xF8;
  v7 = v6 + 23;
  v8 = (unint64_t)a1 + v6 + 23;
  v9 = ~v6 & 0xFFFFFFFFFFFFFFF8;
  v10 = v8 & v9;
  v11 = ((unint64_t)a2 + v7) & v9;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 32))(v8 & v9, v11, AssociatedTypeWitness);
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + v10) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + v11) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_OWORD *sub_229A29FD4(_OWORD *a1, _OWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  *a1 = *a2;
  swift_release();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 80) & 0xF8;
  v7 = v6 + 23;
  v8 = (unint64_t)a1 + v6 + 23;
  v9 = ~v6 & 0xFFFFFFFFFFFFFFF8;
  v10 = v8 & v9;
  v11 = ((unint64_t)a2 + v7) & v9;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 40))(v8 & v9, v11, AssociatedTypeWitness);
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + v11) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_229A2A094(uint64_t *a1, unsigned int a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;

  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_DWORD *)(v4 + 80) & 0xF8;
  v8 = v7 | 7;
  if (v6 < a2)
  {
    if (((((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + ((v7 + 23) & ~v8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v6 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    __asm { BR              X15 }
  }
  if ((v5 & 0x80000000) != 0)
    return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v8 + 16) & ~v8);
  v13 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v13) = -1;
  return (v13 + 1);
}

void sub_229A2A1EC(unsigned int *a1, unsigned int a2, unsigned int a3)
{
  _DWORD *v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v6 = *(_DWORD **)(swift_getAssociatedTypeWitness() - 8);
  if (v6[21] <= 0x7FFFFFFFu)
    v7 = 0x7FFFFFFF;
  else
    v7 = v6[21];
  if (v7 >= a3)
  {
    v10 = 0;
    if (a2 <= v7)
      goto LABEL_17;
  }
  else
  {
    if (((v6[16] + 7) & 0xFFFFFFF8) + (((v6[20] & 0xF8) + 23) & ~(v6[20] & 0xF8 | 7)) == -8)
      v8 = a3 - v7 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (a2 <= v7)
LABEL_17:
      __asm { BR              X13 }
  }
  if (((v6[16] + 7) & 0xFFFFFFF8) + (((v6[20] & 0xF8) + 23) & ~(v6[20] & 0xF8 | 7)) != -8)
  {
    v11 = ~v7 + a2;
    bzero(a1, ((*((_QWORD *)v6 + 8) + 7) & 0xFFFFFFFFFFFFFFF8)+ (((v6[20] & 0xF8) + 23) & ~(v6[20] & 0xF8 | 7))+ 8);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_229A2A318()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x229A2A388);
}

void sub_229A2A320()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  *(_DWORD *)(v0 + v2) = 0;
  if (v1)
    JUMPOUT(0x229A2A328);
  JUMPOUT(0x229A2A388);
}

void sub_229A2A338()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x229A2A388);
}

void sub_229A2A340()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x229A2A388);
}

void sub_229A2A348(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  *(_WORD *)(v3 + v5) = 0;
  if (v4)
  {
    if ((a3 & 0x80000000) == 0)
    {
      if ((v4 & 0x80000000) == 0)
        JUMPOUT(0x229A2A384);
      JUMPOUT(0x229A2A37CLL);
    }
    JUMPOUT(0x229A2A354);
  }
  JUMPOUT(0x229A2A388);
}

uint64_t sub_229A2A3A0()
{
  uint64_t result;
  unint64_t v1;

  swift_getAssociatedTypeWitness();
  result = sub_229A2C2C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_229A2A428(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    *(_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_229A2A4F4(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
  return swift_release();
}

uint64_t sub_229A2A558(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_229A2A5DC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_229A2A66C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_229A2A6EC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_229A2A774(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFE)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 < a2)
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    __asm { BR              X15 }
  }
  if (v5 >= 0x7FFFFFFE)
    return (*(uint64_t (**)(uint64_t))(v4 + 48))(a1);
  v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
  if (v12 >= 0xFFFFFFFF)
    LODWORD(v12) = -1;
  if ((v12 + 1) >= 2)
    return v12;
  else
    return 0;
}

void sub_229A2A8C4(unsigned int *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v6 + 84) <= 0x7FFFFFFEu)
    v7 = 2147483646;
  else
    v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    v10 = 0;
    if (a2 <= v7)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v8 = a3 - v7 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (a2 <= v7)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v11 = ~v7 + a2;
    bzero(a1, ((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_229A2A9D8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x229A2AA60);
}

void sub_229A2A9E0()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  *(_DWORD *)(v0 + v2) = 0;
  if (v1)
    JUMPOUT(0x229A2A9E8);
  JUMPOUT(0x229A2AA60);
}

void sub_229A2AA34()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x229A2AA60);
}

void sub_229A2AA3C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x229A2AA60);
}

uint64_t sub_229A2AA44@<X0>(unsigned int a1@<W2>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v4 + v6) = 0;
  if (!(_DWORD)v5)
    goto LABEL_6;
  if (a1 < 0x7FFFFFFE)
  {
    if (v5 > 0x7FFFFFFE)
      JUMPOUT(0x229A2AA50);
    *(_QWORD *)((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) = v5;
LABEL_6:
    JUMPOUT(0x229A2AA60);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(v4, v5);
}

uint64_t sub_229A2AA78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_229A2AD80(a1, a2, a3, (uint64_t)&unk_229A2D0B0);
}

uint64_t sub_229A2AA84(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - v4, a1, AssociatedTypeWitness);
  sub_229A2C290();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_229A2AB3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v23;
  uint64_t v24;

  v23 = a1;
  v24 = a3;
  v4 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = sub_229A2C2FC();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&AssociatedTypeWitness - v6;
  v8 = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&AssociatedTypeWitness - v10;
  v13 = type metadata accessor for JUComponentView(0, v4, v3, v12);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&AssociatedTypeWitness - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&AssociatedTypeWitness - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v23, v8);
  sub_229A2C2C0();
  sub_229A2C2B4();
  JUComponentView.init(presenting:for:with:)((uint64_t)v11, (uint64_t)v7, v4, v3, (uint64_t)v17);
  MEMORY[0x22E2D4B8C](&protocol conformance descriptor for JUComponentView<A>, v13);
  sub_229A25F88((uint64_t)v17, v13, (uint64_t)v19);
  v20 = *(void (**)(char *, uint64_t))(v14 + 8);
  v20(v17, v13);
  sub_229A25A18((uint64_t)v19, v13, v24);
  return ((uint64_t (*)(char *, uint64_t))v20)(v19, v13);
}

uint64_t sub_229A2AD30(uint64_t a1)
{
  MEMORY[0x22E2D4B8C](&unk_229A2D0B0, a1);
  return sub_229A2C008();
}

uint64_t sub_229A2AD74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_229A2AD80(a1, a2, a3, (uint64_t)&unk_229A2D048);
}

uint64_t sub_229A2AD80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x22E2D4B8C](a4);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_229A2ADC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
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
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v51 = a1;
  v53 = a3;
  v4 = sub_229A2C110();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED868];
  v6 = *(_QWORD *)(v4 - 8);
  v7 = v4;
  v40 = v4;
  v52 = v6;
  v8 = MEMORY[0x24BDAC7A8](v4);
  v50 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*(_QWORD *)(a2 - 8) + 64);
  v11 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v12 = *(_QWORD *)(a2 + 24);
  v44 = *(_QWORD *)(a2 + 16);
  v43 = v12;
  v46 = type metadata accessor for JUComponentView(255, v44, v12, v13);
  v45 = MEMORY[0x22E2D4B8C](&protocol conformance descriptor for JUComponentView<A>, v46);
  v14 = sub_229A2C2D8();
  v49 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v42 = (char *)&v36 - v15;
  v16 = MEMORY[0x22E2D4B8C](MEMORY[0x24BDF43B0], v14);
  v39 = v16;
  v38 = sub_229A297A4(&qword_255A87778, v5, MEMORY[0x24BDED858]);
  v58 = v14;
  v59 = v7;
  v60 = v16;
  v61 = v38;
  v17 = MEMORY[0x22E2D4B5C](0, &v58, MEMORY[0x24BDF22B8], 0);
  v47 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v37 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v41 = (uint64_t)&v36 - v20;
  v21 = v48;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v48, a2);
  v22 = v11;
  v23 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v24 = swift_allocObject();
  v25 = v44;
  v26 = v43;
  *(_QWORD *)(v24 + 16) = v44;
  *(_QWORD *)(v24 + 24) = v26;
  (*(void (**)(unint64_t, char *, uint64_t))(v22 + 32))(v24 + v23, (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  v54 = v25;
  v55 = v26;
  v56 = v51;
  v57 = v21;
  v27 = v42;
  sub_229A2C2CC();
  v28 = v50;
  sub_229A2C104();
  v29 = (uint64_t)v37;
  v30 = v40;
  v31 = v39;
  v32 = v38;
  sub_229A2C254();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v28, v30);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v27, v14);
  v58 = v14;
  v59 = v30;
  v60 = v31;
  v61 = v32;
  swift_getOpaqueTypeConformance2();
  v33 = v41;
  sub_229A25F88(v29, v17, v41);
  v34 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
  v34(v29, v17);
  sub_229A25A18(v33, v17, v53);
  return ((uint64_t (*)(uint64_t, uint64_t))v34)(v33, v17);
}

uint64_t sub_229A2B14C(void (**a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  char *v8;
  void (*v9)(char *);
  uint64_t v10;
  uint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = (char *)&v12 - v7;
  v9 = *a1;
  type metadata accessor for JUSelectableComponentWrapper(0, a2, a3, v10);
  sub_229A2C2C0();
  sub_229A2C29C();
  v9(v8);
  return sub_229A2C2A8();
}

uint64_t sub_229A2B22C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = a1;
  v27 = a2;
  v28 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = sub_229A2C2FC();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&AssociatedTypeWitness - v8;
  v10 = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&AssociatedTypeWitness - v12;
  v15 = type metadata accessor for JUComponentView(0, a3, a4, v14);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&AssociatedTypeWitness - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&AssociatedTypeWitness - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v26, v10);
  type metadata accessor for JUSelectableComponentWrapper(0, a3, a4, v22);
  sub_229A2C2C0();
  sub_229A2C2B4();
  JUComponentView.init(presenting:for:with:)((uint64_t)v13, (uint64_t)v9, a3, a4, (uint64_t)v19);
  MEMORY[0x22E2D4B8C](&protocol conformance descriptor for JUComponentView<A>, v15);
  sub_229A25F88((uint64_t)v19, v15, (uint64_t)v21);
  v23 = *(void (**)(char *, uint64_t))(v16 + 8);
  v23(v19, v15);
  sub_229A25A18((uint64_t)v21, v15, v28);
  return ((uint64_t (*)(char *, uint64_t))v23)(v21, v15);
}

uint64_t sub_229A2B434(uint64_t a1)
{
  MEMORY[0x22E2D4B8C](&unk_229A2D048, a1);
  return sub_229A2C008();
}

void sub_229A2B478()
{
  JUMPOUT(0x22E2D4B8CLL);
}

uint64_t sub_229A2B488()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_229A2B4BC()
{
  return sub_229A297A4(&qword_255A87770, MEMORY[0x24BEC65D0], MEMORY[0x24BEC65C8]);
}

void sub_229A2B4E8()
{
  JUMPOUT(0x22E2D4B8CLL);
}

uint64_t sub_229A2B4F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_229A2B52C()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_229A2B548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;

  v5 = type metadata accessor for JUSelectableComponentWrapper(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = v4 + ((v6 + 32) & ~v6);
  swift_release();
  v8 = v7 + *(int *)(v5 + 36);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v8, AssociatedTypeWitness);
  sub_229A2C2C0();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229A2B61C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for JUSelectableComponentWrapper(0, v5, v6, a4) - 8)
                          + 80);
  return sub_229A2B14C((void (**)(char *))(v4 + ((v7 + 32) & ~v7)), v5, v6);
}

uint64_t sub_229A2B66C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_229A2B22C(v1[4], v1[5], v1[2], v1[3], a1);
}

void sub_229A2B678(_QWORD *a1)
{
  get_witness_table_5JetUI11JUComponentRzl01_ab6_SwiftB00C7Wrapper33_149180D85663AE4EE2CA26AC2F643FEFLLVyxG01_a7Engine_dB09ComponentHPyHCTm(a1, (void (*)(uint64_t, _QWORD, _QWORD))type metadata accessor for JUComponentView);
}

void get_witness_table_5JetUI11JUComponentRzl01_ab6_SwiftB00C7Wrapper33_149180D85663AE4EE2CA26AC2F643FEFLLVyxG01_a7Engine_dB09ComponentHPyHCTm(_QWORD *a1, void (*a2)(uint64_t, _QWORD, _QWORD))
{
  a2(255, *a1, a1[1]);
  JUMPOUT(0x22E2D4B8CLL);
}

uint64_t sub_229A2B6C0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);

  v4 = type metadata accessor for JUComponentView(255, *a1, a1[1], a4);
  MEMORY[0x22E2D4B8C](&protocol conformance descriptor for JUComponentView<A>, v4);
  v5 = sub_229A2C2D8();
  sub_229A2C110();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED868];
  MEMORY[0x22E2D4B8C](MEMORY[0x24BDF43B0], v5);
  sub_229A297A4(&qword_255A87778, v6, MEMORY[0x24BDED858]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t JetViewRepresentable.makeUIView(context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t JetViewRepresentable.updateUIView(_:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t static JetViewRepresentable.dismantleUIView(_:coordinator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of JetViewRepresentable.makeView(context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of JetViewRepresentable.updateView(_:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of static JetViewRepresentable.dismantleView(_:coordinator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t ShelfCollection.init<A>(shelvesOf:spacing:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _BYTE v24[16];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t KeyPath;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;

  v14 = sub_229A2C344();
  v34 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A87780);
  v35 = MEMORY[0x22E2D4B8C](MEMORY[0x24BE5CAE0], v14);
  v36 = sub_229A2B998();
  v15 = sub_229A2C098();
  v33 = sub_229A2C080();
  v29 = a6;
  v30 = a7;
  v31 = a8;
  v32 = a9;
  v25 = a6;
  v26 = a8;
  v27 = a9;
  KeyPath = swift_getKeyPath();
  v16 = sub_229A2C440();
  v17 = MEMORY[0x22E2D4B8C](MEMORY[0x24BEE12E0], v16);
  v19 = sub_229A2BA34((void (*)(char *, char *))sub_229A2BF8C, (uint64_t)v24, v16, a7, MEMORY[0x24BEE4078], v17, MEMORY[0x24BEE40A8], v18);
  swift_release();
  swift_bridgeObjectRelease();
  v33 = v19;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a6;
  v20[3] = a7;
  v20[4] = a8;
  v20[5] = a9;
  v20[6] = a4;
  v20[7] = a5;
  v21 = sub_229A2C440();
  MEMORY[0x22E2D4B8C](MEMORY[0x24BEE12D8], v21);
  sub_229A2BFD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a1, v15);
}

unint64_t sub_229A2B998()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A87788;
  if (!qword_255A87788)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A87780);
    result = MEMORY[0x22E2D4B8C](MEMORY[0x24BE5CAE0], v1);
    atomic_store(result, (unint64_t *)&qword_255A87788);
  }
  return result;
}

uint64_t sub_229A2B9E4()
{
  sub_229A2C344();
  return sub_229A2C338();
}

uint64_t sub_229A2BA1C()
{
  return 32;
}

__n128 sub_229A2BA28(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_229A2BA34(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  void (*v24)(char *, _QWORD);
  void (*v25)(char *);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43[32];
  uint64_t v44;

  v30 = a5;
  v31 = a8;
  v38 = a1;
  v39 = a2;
  v29 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v40 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)&v29 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_getAssociatedTypeWitness();
  v32 = *(_QWORD *)(v17 - 8);
  v33 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v29 - v18;
  v20 = sub_229A2C518();
  if (!v20)
    return sub_229A2C434();
  v36 = AssociatedTypeWitness;
  v21 = v20;
  v44 = sub_229A2C638();
  v34 = sub_229A2C644();
  sub_229A2C620();
  v37 = v8;
  result = sub_229A2C50C();
  if ((v21 & 0x8000000000000000) == 0)
  {
    v23 = v21;
    v35 = v16;
    while (v23)
    {
      v41 = v23;
      v24 = (void (*)(char *, _QWORD))sub_229A2C530();
      v25 = *(void (**)(char *))(v11 + 16);
      v26 = v11;
      v27 = v36;
      v25(v14);
      v24(v43, 0);
      v28 = v42;
      v38(v14, v40);
      if (v28)
      {
        (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v31, v40, v30);
      }
      v42 = 0;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
      sub_229A2C62C();
      result = sub_229A2C524();
      v23 = v41 - 1;
      v11 = v26;
      if (v41 == 1)
      {
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        return v44;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_229A2BD24()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229A2BD48(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 48))(*a1);
}

uint64_t ShelfCollection.init<A, B>(shelvesOf:spacing:shelfContent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[16];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  v13 = sub_229A2C344();
  v31 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A87780);
  v32 = MEMORY[0x22E2D4B8C](MEMORY[0x24BE5CAE0], v13);
  v33 = sub_229A2B998();
  v14 = sub_229A2C098();
  v30 = sub_229A2C080();
  v26 = a6;
  v27 = a7;
  v28 = a8;
  v29 = a9;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  KeyPath = swift_getKeyPath();
  v15 = sub_229A2C440();
  v16 = MEMORY[0x22E2D4B8C](MEMORY[0x24BEE12E0], v15);
  v18 = sub_229A2BA34((void (*)(char *, char *))sub_229A2BF64, (uint64_t)v21, v15, a6, MEMORY[0x24BEE4078], v16, MEMORY[0x24BEE40A8], v17);
  swift_release();
  swift_bridgeObjectRelease();
  v30 = v18;
  v19 = sub_229A2C440();
  MEMORY[0x22E2D4B8C](MEMORY[0x24BEE12D8], v19);
  sub_229A2BFCC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a1, v14);
}

uint64_t sub_229A2BF14()
{
  sub_229A2C344();
  return sub_229A2C338();
}

uint64_t sub_229A2BF4C()
{
  return 32;
}

__n128 sub_229A2BF58(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_229A2BF64()
{
  return swift_getAtKeyPath();
}

uint64_t sub_229A2BF8C()
{
  return sub_229A2BF64();
}

uint64_t View.visualizeMetrics(isOn:)@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t sub_229A2BFB8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t sub_229A2BFC0()
{
  return MEMORY[0x24BEC6558]();
}

uint64_t sub_229A2BFCC()
{
  return MEMORY[0x24BEC6578]();
}

uint64_t sub_229A2BFD8()
{
  return MEMORY[0x24BEC6580]();
}

uint64_t sub_229A2BFE4()
{
  return MEMORY[0x24BEC6648]();
}

uint64_t sub_229A2BFF0()
{
  return MEMORY[0x24BEC6658]();
}

uint64_t sub_229A2BFFC()
{
  return MEMORY[0x24BEC6668]();
}

uint64_t sub_229A2C008()
{
  return MEMORY[0x24BEC6670]();
}

uint64_t sub_229A2C014()
{
  return MEMORY[0x24BE5E598]();
}

uint64_t sub_229A2C020()
{
  return MEMORY[0x24BE5E5A0]();
}

uint64_t sub_229A2C02C()
{
  return MEMORY[0x24BE5E5B8]();
}

uint64_t sub_229A2C038()
{
  return MEMORY[0x24BE5E5C0]();
}

uint64_t sub_229A2C044()
{
  return MEMORY[0x24BE5E5E0]();
}

uint64_t sub_229A2C050()
{
  return MEMORY[0x24BE5E5E8]();
}

uint64_t sub_229A2C05C()
{
  return MEMORY[0x24BE5E628]();
}

uint64_t sub_229A2C068()
{
  return MEMORY[0x24BE5E630]();
}

uint64_t sub_229A2C074()
{
  return MEMORY[0x24BE5E660]();
}

uint64_t sub_229A2C080()
{
  return MEMORY[0x24BEBC718]();
}

uint64_t sub_229A2C08C()
{
  return MEMORY[0x24BEBC740]();
}

uint64_t sub_229A2C098()
{
  return MEMORY[0x24BEBC748]();
}

uint64_t sub_229A2C0A4()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_229A2C0B0()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_229A2C0BC()
{
  return MEMORY[0x24BDEB780]();
}

uint64_t sub_229A2C0C8()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_229A2C0D4()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_229A2C0E0()
{
  return MEMORY[0x24BDEC930]();
}

uint64_t sub_229A2C0EC()
{
  return MEMORY[0x24BDEC958]();
}

uint64_t sub_229A2C0F8()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_229A2C104()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_229A2C110()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_229A2C11C()
{
  return MEMORY[0x24BEC6688]();
}

uint64_t sub_229A2C128()
{
  return MEMORY[0x24BEC66A8]();
}

uint64_t sub_229A2C134()
{
  return MEMORY[0x24BEC66B0]();
}

uint64_t sub_229A2C140()
{
  return MEMORY[0x24BEC66B8]();
}

uint64_t sub_229A2C14C()
{
  return MEMORY[0x24BEC66C0]();
}

uint64_t sub_229A2C158()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_229A2C164()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_229A2C170()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_229A2C17C()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_229A2C188()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_229A2C194()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_229A2C1A0()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_229A2C1AC()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_229A2C1B8()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_229A2C1C4()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_229A2C1D0()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_229A2C1DC()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_229A2C1E8()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_229A2C1F4()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_229A2C200()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_229A2C20C()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_229A2C218()
{
  return MEMORY[0x24BDF0AF8]();
}

uint64_t sub_229A2C224()
{
  return MEMORY[0x24BDF0B08]();
}

uint64_t sub_229A2C230()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_229A2C23C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_229A2C248()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_229A2C254()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_229A2C260()
{
  return MEMORY[0x24BDF23D8]();
}

uint64_t sub_229A2C26C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_229A2C278()
{
  return MEMORY[0x24BDF34D0]();
}

uint64_t sub_229A2C284()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_229A2C290()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_229A2C29C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_229A2C2A8()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_229A2C2B4()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_229A2C2C0()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_229A2C2CC()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_229A2C2D8()
{
  return MEMORY[0x24BDF4398]();
}

uint64_t sub_229A2C2E4()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_229A2C2F0()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_229A2C2FC()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_229A2C308()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_229A2C314()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_229A2C320()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_229A2C32C()
{
  return MEMORY[0x24BE5C5B8]();
}

uint64_t sub_229A2C338()
{
  return MEMORY[0x24BE5CAB8]();
}

uint64_t sub_229A2C344()
{
  return MEMORY[0x24BE5CAD0]();
}

uint64_t sub_229A2C350()
{
  return MEMORY[0x24BE5CB08]();
}

uint64_t sub_229A2C35C()
{
  return MEMORY[0x24BE5CD68]();
}

uint64_t sub_229A2C368()
{
  return MEMORY[0x24BE5CEF0]();
}

uint64_t sub_229A2C374()
{
  return MEMORY[0x24BE5CF58]();
}

uint64_t sub_229A2C380()
{
  return MEMORY[0x24BE5CF98]();
}

uint64_t sub_229A2C38C()
{
  return MEMORY[0x24BE5D388]();
}

uint64_t sub_229A2C398()
{
  return MEMORY[0x24BE5D390]();
}

uint64_t sub_229A2C3A4()
{
  return MEMORY[0x24BE5D9B8]();
}

uint64_t sub_229A2C3B0()
{
  return MEMORY[0x24BE5D9C0]();
}

uint64_t sub_229A2C3BC()
{
  return MEMORY[0x24BE5D9C8]();
}

uint64_t sub_229A2C3C8()
{
  return MEMORY[0x24BE5D9D0]();
}

uint64_t sub_229A2C3D4()
{
  return MEMORY[0x24BE5D9D8]();
}

uint64_t sub_229A2C3E0()
{
  return MEMORY[0x24BE5D9E0]();
}

uint64_t sub_229A2C3EC()
{
  return MEMORY[0x24BEC67A8]();
}

uint64_t sub_229A2C3F8()
{
  return MEMORY[0x24BE5DA00]();
}

uint64_t sub_229A2C404()
{
  return MEMORY[0x24BE5E288]();
}

uint64_t sub_229A2C410()
{
  return MEMORY[0x24BE5E348]();
}

uint64_t sub_229A2C41C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_229A2C428()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_229A2C434()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_229A2C440()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_229A2C44C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_229A2C458()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_229A2C464()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_229A2C470()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_229A2C47C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_229A2C488()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_229A2C494()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_229A2C4A0()
{
  return MEMORY[0x24BEE6A28]();
}

uint64_t sub_229A2C4AC()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_229A2C4B8()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_229A2C4C4()
{
  return MEMORY[0x24BEE6A78]();
}

uint64_t sub_229A2C4D0()
{
  return MEMORY[0x24BEE6A98]();
}

uint64_t sub_229A2C4DC()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_229A2C4E8()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_229A2C4F4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_229A2C500()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_229A2C50C()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_229A2C518()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_229A2C524()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_229A2C530()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_229A2C53C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_229A2C548()
{
  return MEMORY[0x24BEE5850]();
}

uint64_t sub_229A2C554()
{
  return MEMORY[0x24BEE5858]();
}

uint64_t sub_229A2C560()
{
  return MEMORY[0x24BEE5868]();
}

uint64_t sub_229A2C56C()
{
  return MEMORY[0x24BEE58A0]();
}

uint64_t sub_229A2C578()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_229A2C584()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_229A2C590()
{
  return MEMORY[0x24BEE58E8]();
}

uint64_t sub_229A2C59C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_229A2C5A8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_229A2C5B4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_229A2C5C0()
{
  return MEMORY[0x24BEE2388]();
}

uint64_t sub_229A2C5CC()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_229A2C5D8()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_229A2C5E4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_229A2C5F0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_229A2C5FC()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_229A2C608()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_229A2C614()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_229A2C620()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_229A2C62C()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_229A2C638()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_229A2C644()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_229A2C650()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_229A2C65C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_229A2C668()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_229A2C674()
{
  return MEMORY[0x24BEE3920]();
}

uint64_t sub_229A2C680()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_229A2C68C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_229A2C698()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_229A2C6A4()
{
  return MEMORY[0x24BEE42D8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

