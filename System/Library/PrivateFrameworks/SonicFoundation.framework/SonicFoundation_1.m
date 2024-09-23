uint64_t sub_247720BC4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v28;
  uint64_t v29;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  unint64_t v41;
  int64_t v43;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v52 = type metadata accessor for ActorQueue.QueuedTask();
  v8 = MEMORY[0x24BDAC7A8](v52);
  v51 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v50 = (uint64_t)&v45 - v11;
  v13 = *(_QWORD *)(v12 + 72);
  if (!v13)
  {
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  v14 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v13 == -1)
    goto LABEL_75;
  v16 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v13 == -1)
    goto LABEL_76;
  v18 = v14 / v13;
  v19 = v16 / v13;
  if (v14 / v13 >= v16 / v13)
  {
    result = sub_2476B2110(a2, v16 / v13, a4);
    v29 = v19 * v13;
    v20 = a4 + v19 * v13;
    if (v29 < 1 || a1 >= a2)
      goto LABEL_69;
    v48 = a4;
    v49 = -v13;
    v46 = v13;
    v47 = a1;
    while (1)
    {
      v31 = a3;
      v32 = v49;
      v33 = v50;
      a3 += v49;
      v34 = v20 + v49;
      sub_24771F988(v20 + v49, v50);
      v35 = a2 + v32;
      v36 = a2 + v32;
      v37 = v51;
      sub_24771F988(v36, v51);
      v38 = sub_24772CDCC();
      sub_24771F09C(v37);
      result = sub_24771F09C(v33);
      if ((v38 & 1) != 0)
      {
        if (v31 >= a2 && a3 < a2)
        {
          v41 = v47;
          a4 = v48;
          if (v31 != a2)
            result = swift_arrayInitWithTakeBackToFront();
          a2 = v35;
          v13 = v46;
          goto LABEL_65;
        }
        result = swift_arrayInitWithTakeFrontToBack();
        a2 = v35;
      }
      else
      {
        if (v31 >= v20 && a3 < v20)
        {
          a4 = v48;
          if (v31 != v20)
            result = swift_arrayInitWithTakeBackToFront();
          v20 = v34;
          goto LABEL_64;
        }
        result = swift_arrayInitWithTakeFrontToBack();
        v20 = v34;
      }
      a4 = v48;
LABEL_64:
      v13 = v46;
      v41 = v47;
LABEL_65:
      if (v20 <= a4 || a2 <= v41)
        goto LABEL_69;
    }
  }
  result = sub_2476B2110(a1, v14 / v13, a4);
  v20 = a4 + v18 * v13;
  if (v18 * v13 >= 1 && a2 < a3)
  {
    do
    {
      v22 = v50;
      sub_24771F988(a2, v50);
      v23 = v51;
      sub_24771F988(a4, v51);
      v24 = sub_24772CDCC();
      sub_24771F09C(v23);
      result = sub_24771F09C(v22);
      if ((v24 & 1) != 0)
      {
        v25 = a2 + v13;
        if (a1 < a2 || a1 >= v25)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != a2)
        {
          result = swift_arrayInitWithTakeBackToFront();
        }
      }
      else
      {
        if (a1 < a4 || a1 >= a4 + v13)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != a4)
        {
          result = swift_arrayInitWithTakeBackToFront();
        }
        v25 = a2;
        a4 += v13;
      }
      a1 += v13;
      v28 = a4 >= v20 || v25 >= a3;
      a2 = v25;
    }
    while (!v28);
  }
  a2 = a1;
LABEL_69:
  v43 = v20 - a4;
  if (v13 != -1 || v43 != 0x8000000000000000)
  {
    sub_2476B2110(a4, v43 / v13, a2);
    return 1;
  }
LABEL_77:
  __break(1u);
  return result;
}

char *sub_247720F4C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_2476CA9B4(0, &qword_2576B8220, (uint64_t (*)(uint64_t))sub_2476C79CC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_247721054(uint64_t a1)
{
  return sub_247720F4C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_247721068(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  char v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  _BYTE v16[8];
  uint64_t v17;

  sub_24771FEBC(a1, a2, a3, a4, (uint64_t)&v11);
  v8 = v14 | (v13 == 0);
  if (v14 & 1 | (v13 == 0))
    v9 = 0;
  else
    v9 = v12;
  v15 = v11;
  sub_2477212D4((uint64_t)&v15, (uint64_t)v16, (uint64_t (*)(_QWORD))sub_247722150);
  sub_2477212D4((uint64_t)v16, (uint64_t)&v17, (uint64_t (*)(_QWORD))sub_247722150);
  if (v17)
  {
    sub_2476B443C(0, (unint64_t *)&qword_2576B7C30);
    swift_arrayDestroy();
  }
  if (!(v8 & 1 | (v9 == 0)))
  {
    sub_2476B443C(0, (unint64_t *)&qword_2576B7C30);
    swift_arrayDestroy();
  }
  return sub_24772134C(a1, a2, a3, a4);
}

uint64_t sub_247721190(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t a4)
{
  char v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  _BYTE v16[8];
  uint64_t v17;

  sub_24771FF38(a1, a2, a3, a4, (uint64_t)&v11);
  v8 = v14 | (v13 == 0);
  if (v14 & 1 | (v13 == 0))
    v9 = 0;
  else
    v9 = v12;
  v15 = v11;
  sub_2477212D4((uint64_t)&v15, (uint64_t)v16, (uint64_t (*)(_QWORD))sub_247721314);
  sub_2477212D4((uint64_t)v16, (uint64_t)&v17, (uint64_t (*)(_QWORD))sub_247721314);
  if (v17)
  {
    type metadata accessor for ActorQueue.QueuedTask();
    swift_arrayDestroy();
  }
  if (!(v8 & 1 | (v9 == 0)))
  {
    type metadata accessor for ActorQueue.QueuedTask();
    swift_arrayDestroy();
  }
  return sub_24772189C(a1, a2, a3, a4);
}

void sub_247721298(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6;

  if (!*a1)
  {
    v6 = a3(a2);
    atomic_store(MEMORY[0x2495822A8](a4, v6), a1);
  }
  OUTLINED_FUNCTION_35();
}

void sub_2477212D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_35();
}

void sub_247721314(uint64_t a1)
{
  sub_2476CA9B4(a1, &qword_2576B9898, (uint64_t (*)(uint64_t))sub_247721330, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

void sub_247721330(uint64_t a1)
{
  sub_2476CA9B4(a1, &qword_2576B98A0, (uint64_t (*)(uint64_t))type metadata accessor for ActorQueue.QueuedTask, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE0960]);
}

uint64_t sub_24772134C(uint64_t result, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  if (v4 < 1)
    return result;
  v6 = result;
  v8 = a3[1];
  v7 = a3[2];
  v9 = *a3;
  if (v7 + result >= *a3)
    v10 = *a3;
  else
    v10 = 0;
  if (v7 + a2 >= v9)
    v11 = *a3;
  else
    v11 = 0;
  v12 = v8 - a2;
  if (__OFSUB__(v8, a2))
    goto LABEL_84;
  v14 = v7 + result - v10;
  v15 = v7 + a2 - v11;
  result = a3[2];
  if (v12 > v6)
  {
    result = sub_24771FBF4(result, v4, a3);
    v12 = result;
    if (!v6)
      goto LABEL_68;
    if (v15 <= 0)
      v16 = v9;
    else
      v16 = v15;
    if (v14 <= 0)
      v17 = v9;
    else
      v17 = v14;
    if (v7 >= v17)
    {
      if (v16 >= result)
      {
        if (__OFSUB__(0, v14))
        {
LABEL_90:
          __break(1u);
LABEL_91:
          __break(1u);
          goto LABEL_92;
        }
        if (v14 > 0)
        {
          v15 -= v14;
          sub_2476B1D90(a4, v14, a4 + 40 * v15);
          sub_24771FBF4(0, v14, a3);
          result = sub_24771FBF4(v15, v14, a3);
        }
        v18 = __OFSUB__(v6, v14);
        v6 -= v14;
        if (v18)
          goto LABEL_91;
        goto LABEL_65;
      }
      if (v14 > 0)
      {
        sub_2476B1D90(a4, v14, a4 + 40 * v4);
        sub_24771FBF4(0, v14, a3);
        sub_24771FBF4(v4, v14, a3);
      }
      v14 = *a3 - v4;
      sub_2476B1D90(a4 + 40 * v14, v4, a4);
      sub_24771FBF4(v14, v4, a3);
      result = sub_24771FBF4(0, v4, a3);
      v18 = __OFSUB__(v6, v15);
      v6 -= v15;
      if (!v18)
        goto LABEL_65;
      __break(1u);
      goto LABEL_50;
    }
    if (v16 >= result)
    {
      if (v6 > 0)
      {
        sub_2476B1D90(a4 + 40 * v7, v6, a4 + 40 * result);
        v30 = v7;
LABEL_67:
        sub_24771FBF4(v30, v6, a3);
        result = sub_24771FBF4(v12, v6, a3);
      }
LABEL_68:
      a3[2] = v12;
      v31 = a3[1];
      v18 = __OFSUB__(v31, v4);
      v32 = v31 - v4;
      if (!v18)
        goto LABEL_81;
      __break(1u);
      goto LABEL_71;
    }
    if (v15 > 0)
    {
      v14 = v9 - v4;
      sub_2476B1D90(a4 + 40 * (v9 - v4), v15, a4);
      sub_24771FBF4(v9 - v4, v15, a3);
      result = sub_24771FBF4(0, v15, a3);
    }
    v18 = __OFSUB__(v6, v15);
    v6 -= v15;
    if (!v18)
    {
LABEL_65:
      if (v6 >= 1)
      {
        v14 = a3[2];
        sub_2476B1D90(a4 + 40 * v14, v6, a4 + 40 * v12);
        v30 = v14;
        goto LABEL_67;
      }
      goto LABEL_68;
    }
    __break(1u);
  }
  result = sub_24771FBF4(result, v8, a3);
  v19 = v8 - v4;
  if (__OFSUB__(v8, v4))
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  v8 = v4;
  v20 = v19 + v7;
  if (v20 >= v9)
    v21 = v9;
  else
    v21 = 0;
  if (!v12)
    goto LABEL_80;
  v6 = result;
  v4 = v20 - v21;
  if (v20 - v21 <= 0)
    v22 = v9;
  else
    v22 = v20 - v21;
  if (result <= 0)
    v23 = v9;
  else
    v23 = result;
  if (v15 < v23)
  {
    if (v22 >= v14)
    {
LABEL_71:
      if (v12 <= 0)
        goto LABEL_80;
      sub_2476B1D90(a4 + 40 * v15, v12, a4 + 40 * v14);
      sub_24771FBF4(v15, v12, a3);
      v25 = v14;
      v29 = v12;
      goto LABEL_79;
    }
    v24 = v9 - v14;
    if (__OFSUB__(v9, v14))
    {
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
      goto LABEL_89;
    }
    if (v24 > 0)
    {
      sub_2476B1D90(a4 + 40 * v15, v9 - v14, a4 + 40 * v14);
      v15 = sub_24771FBF4(v15, v9 - v14, a3);
      result = sub_24771FBF4(v14, v9 - v14, a3);
    }
    v18 = __OFSUB__(v12, v24);
    v6 = v12 - v24;
    if (v18)
      goto LABEL_88;
    if (v6 >= 1)
    {
      sub_2476B1D90(a4 + 40 * v15, v6, a4);
      sub_24771FBF4(v15, v6, a3);
      v25 = 0;
LABEL_78:
      v29 = v6;
      goto LABEL_79;
    }
    goto LABEL_80;
  }
LABEL_50:
  v26 = v9 - v15;
  v27 = __OFSUB__(v9, v15);
  if (v22 >= v14)
  {
    if (v27)
    {
LABEL_92:
      __break(1u);
      return result;
    }
    if (v26 > 0)
    {
      sub_2476B1D90(a4 + 40 * v15, v9 - v15, a4 + 40 * v14);
      sub_24771FBF4(v15, v9 - v15, a3);
      result = sub_24771FBF4(v14, v9 - v15, a3);
      v14 = result;
    }
    if (v6 >= 1)
    {
      sub_2476B1D90(a4, v6, a4 + 40 * v14);
      sub_24771FBF4(0, v6, a3);
      v25 = v14;
      goto LABEL_78;
    }
  }
  else
  {
    if (v27)
    {
LABEL_89:
      __break(1u);
      goto LABEL_90;
    }
    if (v26 > 0)
    {
      sub_2476B1D90(a4 + 40 * v15, v9 - v15, a4 + 40 * v14);
      sub_24771FBF4(v15, v9 - v15, a3);
      v14 = sub_24771FBF4(v14, v9 - v15, a3);
    }
    sub_2476B1D90(a4, v8, a4 + 40 * v14);
    v28 = sub_24771FBF4(0, v8, a3);
    result = sub_24771FBF4(v14, v8, a3);
    if (v4 >= 1)
    {
      sub_2476B1D90(a4 + 40 * v28, v4, a4);
      sub_24771FBF4(v28, v4, a3);
      v25 = 0;
      v29 = v4;
LABEL_79:
      result = sub_24771FBF4(v25, v29, a3);
    }
  }
LABEL_80:
  v33 = a3[1];
  v18 = __OFSUB__(v33, v8);
  v32 = v33 - v8;
  if (v18)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
LABEL_81:
  a3[1] = v32;
  return result;
}

uint64_t sub_24772189C(uint64_t result, uint64_t a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
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
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  if (v4 < 1)
    return result;
  v6 = result;
  v8 = a3[1];
  v7 = a3[2];
  v9 = *a3;
  if (v7 + result >= *a3)
    v10 = *a3;
  else
    v10 = 0;
  if (v7 + a2 >= v9)
    v11 = *a3;
  else
    v11 = 0;
  v12 = v8 - a2;
  if (__OFSUB__(v8, a2))
    goto LABEL_85;
  v14 = v7 + result - v10;
  v15 = v7 + a2 - v11;
  result = a3[2];
  if (v12 > v6)
  {
    result = sub_24771FBF4(result, v4, a3);
    v12 = result;
    if (!v6)
      goto LABEL_69;
    if (v15 <= 0)
      v16 = v9;
    else
      v16 = v15;
    if (v14 <= 0)
      v17 = v9;
    else
      v17 = v14;
    if (v7 >= v17)
    {
      if (v16 < result)
      {
        if (v14 > 0)
        {
          v31 = type metadata accessor for ActorQueue.QueuedTask();
          sub_2476B2110(a4, v14, a4 + *(_QWORD *)(*(_QWORD *)(v31 - 8) + 72) * v4);
          sub_24771FBF4(0, v14, a3);
          sub_24771FBF4(v4, v14, a3);
        }
        v14 = *a3 - v4;
        v32 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for ActorQueue.QueuedTask() - 8) + 72);
        sub_2476B2110(a4 + v32 * v14, v4, a4);
        sub_24771FBF4(v14, v4, a3);
        result = sub_24771FBF4(0, v4, a3);
        v19 = __OFSUB__(v6, v15);
        v6 -= v15;
        if (v19)
          goto LABEL_90;
        if (v6 < 1)
          goto LABEL_69;
        v14 = a3[2];
        v33 = a4 + v32 * v12;
        v34 = a4 + v14 * v32;
        goto LABEL_67;
      }
      if (__OFSUB__(0, v14))
      {
LABEL_92:
        __break(1u);
LABEL_93:
        __break(1u);
        goto LABEL_94;
      }
      if (v14 > 0)
      {
        v15 -= v14;
        v43 = type metadata accessor for ActorQueue.QueuedTask();
        sub_2476B2110(a4, v14, a4 + *(_QWORD *)(*(_QWORD *)(v43 - 8) + 72) * v15);
        sub_24771FBF4(0, v14, a3);
        result = sub_24771FBF4(v15, v14, a3);
      }
      v19 = __OFSUB__(v6, v14);
      v6 -= v14;
      if (v19)
        goto LABEL_93;
      goto LABEL_65;
    }
    if (v16 >= result)
    {
      if (v6 > 0)
      {
        v41 = type metadata accessor for ActorQueue.QueuedTask();
        sub_2476B2110(a4 + *(_QWORD *)(*(_QWORD *)(v41 - 8) + 72) * v7, v6, a4 + *(_QWORD *)(*(_QWORD *)(v41 - 8) + 72) * v12);
        v42 = v7;
LABEL_68:
        sub_24771FBF4(v42, v6, a3);
        result = sub_24771FBF4(v12, v6, a3);
        goto LABEL_69;
      }
      goto LABEL_69;
    }
    if (v15 > 0)
    {
      v14 = v9 - v4;
      v18 = type metadata accessor for ActorQueue.QueuedTask();
      sub_2476B2110(a4 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * (v9 - v4), v15, a4);
      sub_24771FBF4(v9 - v4, v15, a3);
      result = sub_24771FBF4(0, v15, a3);
    }
    v19 = __OFSUB__(v6, v15);
    v6 -= v15;
    if (!v19)
    {
LABEL_65:
      if (v6 >= 1)
      {
        v14 = a3[2];
        v44 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for ActorQueue.QueuedTask() - 8) + 72);
        v33 = a4 + v44 * v12;
        v34 = a4 + v44 * v14;
LABEL_67:
        sub_2476B2110(v34, v6, v33);
        v42 = v14;
        goto LABEL_68;
      }
LABEL_69:
      a3[2] = v12;
      v45 = a3[1];
      v19 = __OFSUB__(v45, v4);
      v46 = v45 - v4;
      if (!v19)
        goto LABEL_82;
      __break(1u);
      goto LABEL_72;
    }
    __break(1u);
  }
  result = sub_24771FBF4(result, v8, a3);
  v20 = v8 - v4;
  if (__OFSUB__(v8, v4))
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  v8 = v4;
  v21 = v20 + v7;
  if (v21 >= v9)
    v22 = v9;
  else
    v22 = 0;
  if (v12)
  {
    v23 = result;
    v24 = v21 - v22;
    if (v21 - v22 <= 0)
      v25 = v9;
    else
      v25 = v21 - v22;
    if (result <= 0)
      v26 = v9;
    else
      v26 = result;
    if (v15 >= v26)
    {
      v35 = v9 - v15;
      v36 = __OFSUB__(v9, v15);
      if (v25 >= v14)
      {
        if (v36)
        {
LABEL_94:
          __break(1u);
          return result;
        }
        if (v35 > 0)
        {
          v48 = type metadata accessor for ActorQueue.QueuedTask();
          sub_2476B2110(a4 + *(_QWORD *)(*(_QWORD *)(v48 - 8) + 72) * v15, v9 - v15, a4 + *(_QWORD *)(*(_QWORD *)(v48 - 8) + 72) * v14);
          sub_24771FBF4(v15, v9 - v15, a3);
          result = sub_24771FBF4(v14, v9 - v15, a3);
          v14 = result;
        }
        if (v23 >= 1)
        {
          v49 = type metadata accessor for ActorQueue.QueuedTask();
          sub_2476B2110(a4, v23, a4 + *(_QWORD *)(*(_QWORD *)(v49 - 8) + 72) * v14);
          sub_24771FBF4(0, v23, a3);
          v30 = v14;
          goto LABEL_79;
        }
      }
      else
      {
        if (v36)
        {
LABEL_91:
          __break(1u);
          goto LABEL_92;
        }
        if (v35 > 0)
        {
          v37 = type metadata accessor for ActorQueue.QueuedTask();
          sub_2476B2110(a4 + *(_QWORD *)(*(_QWORD *)(v37 - 8) + 72) * v15, v9 - v15, a4 + *(_QWORD *)(*(_QWORD *)(v37 - 8) + 72) * v14);
          sub_24771FBF4(v15, v9 - v15, a3);
          v14 = sub_24771FBF4(v14, v9 - v15, a3);
        }
        v38 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for ActorQueue.QueuedTask() - 8) + 72);
        sub_2476B2110(a4, v8, a4 + v38 * v14);
        v39 = sub_24771FBF4(0, v8, a3);
        result = sub_24771FBF4(v14, v8, a3);
        if (v24 >= 1)
        {
          sub_2476B2110(a4 + v39 * v38, v24, a4);
          sub_24771FBF4(v39, v24, a3);
          v30 = 0;
          v40 = v24;
LABEL_80:
          result = sub_24771FBF4(v30, v40, a3);
        }
      }
    }
    else
    {
      if (v25 >= v14)
      {
LABEL_72:
        if (v12 <= 0)
          goto LABEL_81;
        v47 = type metadata accessor for ActorQueue.QueuedTask();
        sub_2476B2110(a4 + *(_QWORD *)(*(_QWORD *)(v47 - 8) + 72) * v15, v12, a4 + *(_QWORD *)(*(_QWORD *)(v47 - 8) + 72) * v14);
        sub_24771FBF4(v15, v12, a3);
        v30 = v14;
        v40 = v12;
        goto LABEL_80;
      }
      v27 = v9 - v14;
      if (__OFSUB__(v9, v14))
      {
LABEL_88:
        __break(1u);
LABEL_89:
        __break(1u);
LABEL_90:
        __break(1u);
        goto LABEL_91;
      }
      if (v27 > 0)
      {
        v28 = type metadata accessor for ActorQueue.QueuedTask();
        sub_2476B2110(a4 + *(_QWORD *)(*(_QWORD *)(v28 - 8) + 72) * v15, v9 - v14, a4 + *(_QWORD *)(*(_QWORD *)(v28 - 8) + 72) * v14);
        v15 = sub_24771FBF4(v15, v9 - v14, a3);
        result = sub_24771FBF4(v14, v9 - v14, a3);
      }
      v19 = __OFSUB__(v12, v27);
      v23 = v12 - v27;
      if (v19)
        goto LABEL_89;
      if (v23 >= 1)
      {
        v29 = type metadata accessor for ActorQueue.QueuedTask();
        sub_2476B2110(a4 + *(_QWORD *)(*(_QWORD *)(v29 - 8) + 72) * v15, v23, a4);
        sub_24771FBF4(v15, v23, a3);
        v30 = 0;
LABEL_79:
        v40 = v23;
        goto LABEL_80;
      }
    }
  }
LABEL_81:
  v50 = a3[1];
  v19 = __OFSUB__(v50, v8);
  v46 = v50 - v8;
  if (v19)
  {
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
LABEL_82:
  a3[1] = v46;
  return result;
}

uint64_t sub_247721E9C(uint64_t a1)
{
  uint64_t *v1;

  return sub_24771E530(a1, v1[2], v1[3], v1[4]);
}

void sub_247721EA8(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6[2];

  v2 = a1[2];
  v3 = a1[1] + v2;
  if (*a1 >= v3)
  {
    if (v3 < v2)
    {
      __break(1u);
    }
    else
    {
      v5 = type metadata accessor for ActorQueue.QueuedTask();
      if (!__OFSUB__(v3, v2))
      {
        v6[0] = a2 + *(_QWORD *)(*(_QWORD *)(v5 - 8) + 72) * v2;
        v6[1] = v3 - v2;
        sub_2477200A0(v6);
        return;
      }
    }
    __break(1u);
  }
}

uint64_t sub_247721F44(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v5;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;

  v5 = a5;
  if (a5)
    v5 = a5 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for ActorQueue.QueuedTask() - 8) + 72) * a3;
  if (a1)
  {
    if (a2)
    {
      if (a4 - a3 < a2)
      {
LABEL_17:
        __break(1u);
LABEL_18:
        result = sub_24772D3B4();
        __break(1u);
        return result;
      }
      if (v5)
      {
        if (a2 < 0)
          goto LABEL_18;
        v10 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for ActorQueue.QueuedTask() - 8) + 72) * a2;
        v11 = v5 + v10;
        v12 = a1 + v10;
        if (v11 > a1 && v12 > v5)
          goto LABEL_18;
        swift_arrayInitWithCopy();
      }
    }
  }
  else
  {
    a2 = 0;
  }
  result = a3 + a2;
  if (__OFADD__(a3, a2))
  {
    __break(1u);
    goto LABEL_17;
  }
  return result;
}

void sub_247722094(uint64_t a1)
{
  sub_2476CA9B4(a1, &qword_2576B98A8, (uint64_t (*)(uint64_t))sub_2477220B0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

void sub_2477220B0(uint64_t a1)
{
  sub_2476CA9B4(a1, &qword_2576B98B0, (uint64_t (*)(uint64_t))type metadata accessor for ActorQueue.QueuedTask, MEMORY[0x24BEE09B0]);
}

uint64_t sub_2477220CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ActorQueue.QueuedTask();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_247722110()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_60_8();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_157(v0);
  v2 = OUTLINED_FUNCTION_34_9(v1);
  return OUTLINED_FUNCTION_24_15(v2, v3, v4, v5);
}

void sub_247722150(uint64_t a1)
{
  sub_2476CA9B4(a1, &qword_2576B98E8, (uint64_t (*)(uint64_t))sub_24772216C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

void sub_24772216C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576B98F0)
  {
    sub_2476B443C(255, (unint64_t *)&qword_2576B7C30);
    v0 = sub_24772C9D0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576B98F0);
  }
}

uint64_t OUTLINED_FUNCTION_6_18()
{
  return swift_task_switch();
}

void OUTLINED_FUNCTION_8_19(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  sub_24771F0D8((_QWORD *)(*(_QWORD *)(v2 + 120) + 16), *(_QWORD *)(v2 + 120) + ((*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)), a1);
}

uint64_t OUTLINED_FUNCTION_9_17()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_13_20()
{
  return sub_2476CA280();
}

uint64_t OUTLINED_FUNCTION_15_16@<X0>(uint64_t a1@<X8>)
{
  return sub_24770A900(0, 15, 0xD000000000000040, (a1 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_21_10()
{
  return sub_2476CA280();
}

void OUTLINED_FUNCTION_22_8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_2477212D4(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_24_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24771E3A4(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_25_9()
{
  uint64_t v0;

  return sub_24771F09C(v0);
}

uint64_t OUTLINED_FUNCTION_31_8()
{
  return sub_24772D504();
}

uint64_t OUTLINED_FUNCTION_32_7()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_34_9(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_35_10()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_37_9()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_38_10()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_40_8()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_42_10(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  a1[2] = v2;
  a1[3] = v1;
  a1[4] = v3;
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_43_9()
{
  return sub_24772CB8C();
}

void OUTLINED_FUNCTION_44_10(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 160) = a1;
  sub_2476C3718();
}

uint64_t OUTLINED_FUNCTION_46_9()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_47_10()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_48_9(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 168);
}

uint64_t OUTLINED_FUNCTION_52_8()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_54_10()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_57_7()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 352) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_58_6()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 344) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_59_8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_61_8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 368) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_62_8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 312) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_63_5()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 304) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_64_6()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 360) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_65_4()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_68_6(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 168);
}

uint64_t OUTLINED_FUNCTION_72_5()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 120);
}

uint64_t OUTLINED_FUNCTION_75_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void))
{
  return a7();
}

uint64_t OUTLINED_FUNCTION_77_4()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_79_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 168);
}

void OUTLINED_FUNCTION_80_3(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  sub_247721298(a1, 255, a3, a4);
}

uint64_t OUTLINED_FUNCTION_84_2()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_85_3()
{
  return swift_bridgeObjectRelease();
}

_QWORD *OUTLINED_FUNCTION_86_2(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result[2] = v2;
  result[3] = v1;
  result[4] = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_88_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_93_3(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 168);
}

void OUTLINED_FUNCTION_94_4()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 128) = 1;
}

uint64_t OUTLINED_FUNCTION_96_3()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 224);
}

uint64_t OUTLINED_FUNCTION_97_2()
{
  return sub_24772CDF0();
}

uint64_t WeakCache.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  WeakCache.init()();
  return v0;
}

uint64_t WeakCache.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[7] = *v3;
  return swift_task_switch();
}

uint64_t sub_2477226A0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;

  v1 = *(_QWORD **)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 40);
  v6 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 64) = *(_QWORD *)(*(_QWORD *)(v0 + 48) + 16);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v3;
  *(_QWORD *)(v3 + 16) = v1[10];
  v4 = v1[11];
  *(_QWORD *)(v0 + 80) = v4;
  *(_QWORD *)(v3 + 24) = v4;
  *(_QWORD *)(v3 + 32) = v1[12];
  *(_OWORD *)(v3 + 40) = v6;
  *(_QWORD *)(v3 + 56) = v2;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_247722730()
{
  uint64_t v0;

  sub_24772D018();
  ActorBox.withValue<A>(_:)();
  *(_QWORD *)(v0 + 88) = 0;
  swift_release();
  OUTLINED_FUNCTION_81();
  return OUTLINED_FUNCTION_5();
}

uint64_t sub_2477227B4()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_81();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t WeakCache.clean(keys:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[16];
  uint64_t v7;
  uint64_t v8;

  v3 = sub_24772CE08();
  MEMORY[0x24BDAC7A8](v3);
  v7 = v1;
  v8 = a1;
  sub_247723324((uint64_t)&v6[-v4]);
  return sub_24772CE5C();
}

uint64_t sub_247722890()
{
  swift_unknownObjectWeakInit();
  return swift_unknownObjectRelease();
}

_QWORD *WeakCache.init()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for WeakCache.WeakRef(255, *(_QWORD *)(*v0 + 80), *(_QWORD *)(*v0 + 88), *(_QWORD *)(*v0 + 96));
  v1 = sub_24772C94C();
  type metadata accessor for ActorBox(0, v1, v2, v3);
  v6 = sub_24772C8C8();
  ActorBox.__allocating_init(value:)((uint64_t)&v6);
  v0[2] = v4;
  return v0;
}

uint64_t sub_24772295C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, uint64_t *a7@<X8>)
{
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t *v32;
  char v33[8];
  char v34;
  _QWORD v35[2];
  uint64_t (*v36)(uint64_t);

  v31 = a4;
  v32 = a7;
  v27 = *(_QWORD *)(a5 - 8);
  v12 = (uint64_t *)MEMORY[0x24BDAC7A8](a1);
  v29 = v14;
  v30 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v12;
  v18 = type metadata accessor for WeakCache.WeakRef(0, v16, v14, v17);
  v28 = a2;
  MEMORY[0x249580CC4](v35, a2, v15, a5, v18, a6);
  v19 = sub_24772D018();
  v20 = *(_QWORD *)(v19 - 8);
  (*(void (**)(char *, _QWORD *, uint64_t))(v20 + 16))(v33, v35, v19);
  if (v34 == 1)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v33, v19);
  }
  else
  {
    v21 = MEMORY[0x249582458](v33);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v33, v18);
    if (v21)
    {
      result = (*(uint64_t (**)(_QWORD *, uint64_t))(v20 + 8))(v35, v19);
      goto LABEL_9;
    }
  }
  if (a3)
  {
    v26[1] = a1;
    v23 = swift_retain();
    v24 = (uint64_t)v36;
    v25 = a3(v23);
    if (v24)
    {
      (*(void (**)(_QWORD *, uint64_t))(v20 + 8))(v35, v19);
      return sub_2476BF020((uint64_t)a3);
    }
    v21 = v25;
    v36 = a3;
    if (v25)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v30, v28, a5);
      swift_unknownObjectRetain();
      sub_247722890();
      v34 = 0;
      sub_24772C94C();
      sub_24772C964();
      sub_2476BF020((uint64_t)v36);
      result = (*(uint64_t (**)(_QWORD *, uint64_t))(v20 + 8))(v35, v19);
    }
    else
    {
      (*(void (**)(_QWORD *, uint64_t))(v20 + 8))(v35, v19);
      result = sub_2476BF020((uint64_t)v36);
    }
  }
  else
  {
    result = (*(uint64_t (**)(_QWORD *, uint64_t))(v20 + 8))(v35, v19);
    v21 = 0;
  }
LABEL_9:
  *v32 = v21;
  return result;
}

uint64_t sub_247722BBC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_24772295C(a1, *(_QWORD *)(v2 + 40), *(uint64_t (**)(uint64_t))(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 32), a2);
}

uint64_t sub_247722BDC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;

  v19 = a3;
  v5 = *a2;
  v6 = *(_QWORD *)(*a2 + 80);
  v7 = sub_24772CE2C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - v9;
  sub_2476CB854();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_24772CDF0();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  v15 = (*(unsigned __int8 *)(v8 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v16 = (char *)swift_allocObject();
  *((_QWORD *)v16 + 2) = 0;
  *((_QWORD *)v16 + 3) = 0;
  *((_QWORD *)v16 + 4) = v6;
  *((_QWORD *)v16 + 5) = *(_QWORD *)(v5 + 88);
  *((_QWORD *)v16 + 6) = *(_QWORD *)(v5 + 96);
  *((_QWORD *)v16 + 7) = a2;
  *((_QWORD *)v16 + 8) = v19;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v16[v15], v10, v7);
  sub_24772C91C();
  swift_retain();
  sub_2476BD3CC();
  return swift_release();
}

uint64_t sub_247722D50(uint64_t a1)
{
  uint64_t v1;

  return sub_247722BDC(a1, *(uint64_t **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_247722D58(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = *a4;
  return swift_task_switch();
}

uint64_t sub_247722D7C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = v0[4];
  v1 = (_QWORD *)v0[5];
  v3 = v0[3];
  v0[6] = *(_QWORD *)(v0[2] + 16);
  v4 = (_QWORD *)swift_task_alloc();
  v0[7] = v4;
  v5 = v1[10];
  v0[8] = v5;
  v4[2] = v5;
  v4[3] = v1[11];
  v4[4] = v1[12];
  v4[5] = v3;
  v4[6] = v2;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_247722DFC()
{
  uint64_t v0;

  ActorBox.withValue<A>(_:)();
  *(_QWORD *)(v0 + 72) = 0;
  swift_release();
  OUTLINED_FUNCTION_81();
  return OUTLINED_FUNCTION_5();
}

uint64_t sub_247722E70()
{
  uint64_t v0;

  sub_24772CE2C();
  sub_24772CE20();
  return OUTLINED_FUNCTION_10(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_247722EA8()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_81();
  return OUTLINED_FUNCTION_10(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_247722ED8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  char v26;
  void (*v27)(char *, unint64_t, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  char v50[8];
  uint64_t v51;

  v43 = a3;
  v11 = sub_24772CDFC();
  v41 = *(_QWORD *)(v11 - 8);
  v42 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v40 = (char *)&v38 - v13;
  v14 = *(_QWORD *)(a4 - 8);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v39 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v38 - v18;
  v38 = v20;
  MEMORY[0x24BDAC7A8](v17);
  v46 = (char *)&v38 - v21;
  v47 = a1;
  if (a2)
  {
    v22 = a2;
  }
  else
  {
    type metadata accessor for WeakCache.WeakRef(0, a4, a5, a6);
    v48 = sub_24772C91C();
    v23 = sub_24772C910();
    MEMORY[0x2495822A8](MEMORY[0x24BEE0310], v23);
    v22 = sub_24772CD54();
  }
  sub_24772C91C();
  sub_24772C91C();
  v24 = sub_24772CC88();
  swift_bridgeObjectRelease();
  v51 = v24;
  if (v24 == MEMORY[0x249581090](v22, a4))
    return swift_bridgeObjectRelease();
  v44 = a5;
  v45 = v19;
  while (1)
  {
    v26 = sub_24772CD00();
    sub_24772CCB8();
    if ((v26 & 1) == 0)
      break;
    v27 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    v28 = v46;
    v27(v46, v22+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(_QWORD *)(v14 + 72) * v24, a4);
LABEL_9:
    sub_24772C91C();
    MEMORY[0x24958109C](&v51, v22, a4);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v28, a4);
    v29 = *v47;
    v30 = type metadata accessor for WeakCache.WeakRef(0, a4, a5, a6);
    MEMORY[0x249580CC4](&v48, v19, v29, a4, v30, a6);
    if ((v49 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, a4);
      v31 = sub_24772D018();
      (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v31 - 8) + 8))(&v48, v31);
    }
    else
    {
      v32 = a6;
      v33 = *(_QWORD *)(v30 - 8);
      (*(void (**)(char *, uint64_t *, uint64_t))(v33 + 32))(v50, &v48, v30);
      v34 = MEMORY[0x249582458](v50);
      swift_unknownObjectRelease();
      if (v34)
      {
        (*(void (**)(char *, uint64_t))(v33 + 8))(v50, v30);
        (*(void (**)(char *, uint64_t))(v14 + 8))(v19, a4);
        a6 = v32;
      }
      else
      {
        v35 = v39;
        v27(v39, (unint64_t)v45, a4);
        v48 = 0;
        v49 = 1;
        sub_24772C94C();
        sub_24772C964();
        v27(v35, (unint64_t)v45, a4);
        sub_24772CE2C();
        v36 = v40;
        v19 = v45;
        sub_24772CE14();
        (*(void (**)(char *, uint64_t))(v41 + 8))(v36, v42);
        v37 = *(void (**)(char *, uint64_t))(v33 + 8);
        a6 = v32;
        v37(v50, v30);
        (*(void (**)(char *, uint64_t))(v14 + 8))(v19, a4);
      }
      a5 = v44;
    }
    v24 = v51;
    if (v24 == MEMORY[0x249581090](v22, a4))
      return swift_bridgeObjectRelease();
  }
  result = sub_24772D1A4();
  if (v38 == 8)
  {
    v48 = result;
    v27 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    v28 = v46;
    v27(v46, (unint64_t)&v48, a4);
    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_247723324@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BEE6A10];
  v3 = sub_24772CE08();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t type metadata accessor for WeakCache.WeakRef(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakCache.WeakRef);
}

uint64_t WeakCache.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t WeakCache.__deallocating_deinit()
{
  WeakCache.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2477233B4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for WeakCache(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakCache);
}

uint64_t method lookup function for WeakCache()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WeakCache.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_24772342C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = OUTLINED_FUNCTION_3_24();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2477234AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_3_24() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = (_QWORD *)v1[7];
  v8 = v1[8];
  v9 = (uint64_t)v1 + ((v4 + 72) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_2476BD38C;
  return sub_247722D58(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_247723540(uint64_t *a1)
{
  uint64_t *v1;

  return sub_247722ED8(a1, v1[5], v1[6], v1[2], v1[3], v1[4]);
}

uint64_t OUTLINED_FUNCTION_3_24()
{
  return sub_24772CE2C();
}

uint64_t sub_24772356C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void **v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    sub_24772D228();
    v4 = (void **)(a1 + 32);
    do
    {
      v5 = *v4++;
      v6 = v5;
      v7 = v5;
      sub_2476B443C(0, (unint64_t *)&qword_25444C3A8);
      sub_2476DBC64();
      swift_dynamicCast();
      MEMORY[0x2495821C4](v5);
      sub_24772D204();
      sub_24772D234();
      sub_24772D240();
      sub_24772D210();
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t wrappingErrors<A, B>(in:_:_:)(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t (*v17)(uint64_t);
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v13 = *(_QWORD *)(a7 - 8);
  v14 = MEMORY[0x24BDAC7A8](a1);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v17(v14);
  if (v8)
  {
    v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a1, a7);
    v20 = a2(v19);
    v22 = v21;
    sub_247726B9C(0, &qword_2576B81F0, (unint64_t *)&qword_25444C3A8, MEMORY[0x24BEE3EE0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_24772E730;
    *(_QWORD *)(v23 + 32) = v8;
    v25 = type metadata accessor for SonicError(0, a7, a8, v24);
    MEMORY[0x2495822A8](&protocol conformance descriptor for SonicError<A>, v25);
    swift_allocError();
    _s15SonicFoundation0A5ErrorV4code_16underlyingErrorsACyxGx_SSSays0C0_pGtcfC_0((uint64_t)v16, v20, v22, v23, a7, a8, v26);
    return swift_willThrow();
  }
  return result;
}

uint64_t wrappingErrors<A, B>(in:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;

  v8[5] = a8;
  v8[6] = v14;
  v8[3] = a3;
  v8[4] = a4;
  v8[2] = a2;
  v8[7] = *(_QWORD *)(a8 - 8);
  v8[8] = swift_task_alloc();
  v13 = (uint64_t (*)(uint64_t))((char *)a5 + *a5);
  v11 = (_QWORD *)swift_task_alloc();
  v8[9] = v11;
  *v11 = v8;
  v11[1] = sub_24772386C;
  return v13(a1);
}

uint64_t sub_24772386C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2477238E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  v4 = *(void (**)(uint64_t))(v0 + 24);
  v5 = OUTLINED_FUNCTION_37_7(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 16), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 56) + 16));
  v4(v5);
  v7 = v6;
  sub_247726B9C(0, &qword_2576B81F0, (unint64_t *)&qword_25444C3A8, MEMORY[0x24BEE3EE0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_24772E730;
  *(_QWORD *)(v8 + 32) = v1;
  v10 = type metadata accessor for SonicError(0, v3, v2, v9);
  MEMORY[0x2495822A8](&protocol conformance descriptor for SonicError<A>, v10);
  OUTLINED_FUNCTION_36();
  v11 = OUTLINED_FUNCTION_123_0();
  _s15SonicFoundation0A5ErrorV4code_16underlyingErrorsACyxGx_SSSays0C0_pGtcfC_0(v11, v12, v7, v8, v3, v2, v13);
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2477239F8()
{
  return static SonicErrorCode.domainName.getter();
}

uint64_t static SonicErrorCode.domainName.getter()
{
  swift_getMetatypeMetadata();
  return sub_24772CA6C();
}

uint64_t sub_247723A38(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v7 = (char *)v9 - v6;
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  (*(void (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  sub_24772CAFC();
  swift_bridgeObjectRelease();
  sub_24772CAFC();
  sub_24772D4D4();
  sub_24772CAFC();
  sub_24772CC40();
  swift_getAssociatedConformanceWitness();
  sub_24772D4E0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
  sub_24772CAFC();
  return v9[0];
}

void SonicError.init(stringLiteral:)()
{
  sub_24772CACC();
  SonicError.Interpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_247723BD4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  Swift::String v22;
  uint64_t v24[10];

  v22._countAndFlagsBits = v21;
  v22._object = v20;
  SonicError.Interpolation.appendLiteral(_:)(v22);
  OUTLINED_FUNCTION_42_1();
  v24[0] = v24[1];
  return SonicError.init(stringInterpolation:)(v24, v19, v18);
}

void SonicError.Interpolation.init(literalCapacity:interpolationCount:)()
{
  type metadata accessor for SonicError.Interpolation.State();
}

void sub_247723C58(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_11_18();
  MEMORY[0x24BDAC7A8](v4);
  *v1 = MEMORY[0x24BEE4AF8];
  sub_247724330(v3, v3, v2, v2);
}

void sub_247723CC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_2476D5680();
  sub_2476D5704(*(_QWORD *)(*(_QWORD *)v0 + 16));
  OUTLINED_FUNCTION_61_2(v1, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  OUTLINED_FUNCTION_10_6();
}

void sub_247723CF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_247725CD0(v3, v4, v2, v1, a1);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v1);
  OUTLINED_FUNCTION_18_3();
}

Swift::Void __swiftcall SonicError.Interpolation.appendLiteral(_:)(Swift::String a1)
{
  uint64_t *v1;
  uint64_t *v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD *, _QWORD);
  uint64_t v21;
  _QWORD v22[4];

  v2 = v1;
  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v5 = sub_24772C358();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_4_6();
  v9 = v8 - v7;
  v22[0] = countAndFlagsBits;
  v22[1] = object;
  sub_24772C34C();
  sub_2476B5B30();
  v10 = sub_24772D078();
  v12 = v11;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  swift_bridgeObjectRelease();
  v13 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0)
    v13 = v10 & 0xFFFFFFFFFFFFLL;
  if (!v13)
    goto LABEL_8;
  v14 = *v2;
  v15 = *(_QWORD *)(*v2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v2 = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) != 0)
  {
    if (v15)
      goto LABEL_6;
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_247719260(v14);
  v14 = v21;
  *v2 = v21;
  if (!v15)
    goto LABEL_10;
LABEL_6:
  if (v15 <= *(_QWORD *)(v14 + 16))
  {
    v17 = v14 + 40 * (v15 - 1);
    v18 = *(_QWORD *)(v17 + 56);
    v19 = *(_QWORD *)(v17 + 64);
    __swift_mutable_project_boxed_opaque_existential_1(v17 + 32, v18);
    v20 = (void (*)(_QWORD *, _QWORD))(*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v19 + 64))(v22, v18, v19);
    sub_24772CAFC();
    v20(v22, 0);
    *v2 = v14;
LABEL_8:
    OUTLINED_FUNCTION_18_3();
    return;
  }
LABEL_11:
  __break(1u);
}

uint64_t SonicError.init(stringInterpolation:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD *, uint64_t, uint64_t);
  id v12;
  void (*v13)(_QWORD *, _QWORD);
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  _QWORD v27[3];
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  v4 = *a1;
  v5 = *(_QWORD *)(*a1 + 16);
  if (v5)
  {
    v7 = 0;
    v8 = v4 + 40 * v5 - 8;
    while (v5 <= *(_QWORD *)(v4 + 16))
    {
      sub_2476B3F38(v8, (uint64_t)v30);
      if (v7)
      {
        v9 = v31;
        v10 = v32;
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v30, v31);
        v11 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v10 + 88);
        v12 = v7;
        v13 = (void (*)(_QWORD *, _QWORD))v11(v27, v9, v10);
        v15 = v14;
        v16 = *v14;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *v15 = v16;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          OUTLINED_FUNCTION_23_14();
          v16 = v22;
          *v15 = v22;
        }
        v18 = *(_QWORD *)(v16 + 16);
        if (v18 >= *(_QWORD *)(v16 + 24) >> 1)
        {
          OUTLINED_FUNCTION_23_14();
          v16 = v23;
          *v15 = v23;
        }
        *(_QWORD *)(v16 + 16) = v18 + 1;
        *(_QWORD *)(v16 + 8 * v18 + 32) = v7;
        v13(v27, 0);
      }
      --v5;
      sub_2476B3F38((uint64_t)v30, (uint64_t)v27);
      v19 = v28;
      v20 = v29;
      v21 = __swift_project_boxed_opaque_existential_1(v27, v28);
      v3 = sub_247724C78((uint64_t)v21, a2, v19, a3, v20);
      MEMORY[0x2495821C4](v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      v8 -= 40;
      v7 = (void *)v3;
      if (!v5)
        goto LABEL_13;
    }
    __break(1u);
LABEL_13:
    result = swift_bridgeObjectRelease();
    if (v3)
    {
      v30[0] = v3;
      sub_2476B443C(0, (unint64_t *)&qword_25444C3A8);
      type metadata accessor for SonicError(0, a2, a3, v25);
      return swift_dynamicCast();
    }
  }
  else
  {
    result = swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void static SonicError.+ infix(_:_:)(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v8 = type metadata accessor for SonicError(0, a3, a4, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, a1, v8);
  v9 = (uint64_t *)(a5 + *(int *)(v8 + 40));
  v10 = a2;
  sub_2476D568C();
  v11 = *(_QWORD *)(*v9 + 16);
  sub_2476D5710(v11);
  v12 = *v9;
  *(_QWORD *)(v12 + 16) = v11 + 1;
  *(_QWORD *)(v12 + 8 * v11 + 32) = a2;
  *v9 = v12;
  OUTLINED_FUNCTION_44();
}

uint64_t SonicError.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;

  v7 = type metadata accessor for SonicError(0, a2, a3, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a5, a1, v7);
}

uint64_t type metadata accessor for SonicError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SonicError);
}

uint64_t type metadata accessor for SonicError.Interpolation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SonicError.Interpolation);
}

void type metadata accessor for SonicError.Interpolation.State()
{
  JUMPOUT(0x249582248);
}

uint64_t _s15SonicFoundation0A5ErrorV4code_16underlyingErrorsACyxGx_SSSays0C0_pGtcfC_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(a7, a1, a5);
  result = type metadata accessor for SonicError(0, a5, a6, v13);
  v15 = (_QWORD *)(a7 + *(int *)(result + 36));
  *v15 = a2;
  v15[1] = a3;
  *(_QWORD *)(a7 + *(int *)(result + 40)) = a4;
  return result;
}

uint64_t sub_2477241E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[2];

  v3 = v2;
  v6 = sub_24772C358();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 24);
  MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v13, v2, v11);
  v15 = (_QWORD *)(v2 + *(int *)(a1 + 52));
  v16 = v15[1];
  v21[0] = *v15;
  v21[1] = v16;
  sub_24772C91C();
  sub_24772C34C();
  sub_2476B5B30();
  v17 = sub_24772D078();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  swift_bridgeObjectRelease();
  _s15SonicFoundation0A5ErrorV4code_16underlyingErrorsACyxGx_SSSays0C0_pGtcfC_0((uint64_t)v13, v17, v19, *(_QWORD *)(v3 + *(int *)(a1 + 56)), v11, *(_QWORD *)(a1 + 40), a2);
  return sub_24772C91C();
}

void sub_247724330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(uint64_t, uint64_t))(a4 + 32))(a2, a4);
  type metadata accessor for SonicError.Interpolation.State();
}

uint64_t sub_247724380(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 + *(int *)(result + 52));
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  *(_QWORD *)(v1 + *(int *)(result + 56)) = MEMORY[0x24BEE4AF8];
  return result;
}

void sub_2477243B8(uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for SonicError.Interpolation.State();
}

uint64_t sub_247724420(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v5 = (_QWORD *)(v4 + *(int *)(result + 52));
  *v5 = v3;
  v5[1] = v2;
  *(_QWORD *)(v4 + *(int *)(result + 56)) = v1;
  return result;
}

double (*sub_247724450())(_QWORD)
{
  return nullsub_1;
}

double (*sub_247724464())(_QWORD)
{
  return nullsub_1;
}

void SonicError.Interpolation.appendInterpolation(code:)(uint64_t a1)
{
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_4_6();
  type metadata accessor for SonicError.Interpolation.State();
}

void sub_2477244E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t);
  char v31;

  v16 = sub_24772D018();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&a9 - v19;
  *(_QWORD *)(v14 - 136) = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_11_18();
  v22 = MEMORY[0x24BDAC7A8](v21);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&a9 - v24;
  *(_QWORD *)(v14 - 144) = v12;
  v26 = *v12;
  v27 = *(_QWORD *)(*v12 + 16);
  if (v27)
  {
    *(_QWORD *)(v14 - 152) = v23;
    sub_2476B3F38(v26 + 40 * v27 - 8, v14 - 120);
    sub_2476B443C(0, &qword_2576B8200);
    if (swift_dynamicCast())
    {
      OUTLINED_FUNCTION_22_9((uint64_t)v20, 0);
      v28 = OUTLINED_FUNCTION_123_0();
      OUTLINED_FUNCTION_40_1(v28, v29, v30);
      (*(void (**)(uint64_t, uint64_t))(v10 + 32))(v9, v10);
      swift_getAssociatedTypeWitness();
      swift_getAssociatedConformanceWitness();
      v31 = sub_24772D54C();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v13, v9);
      if ((v31 & 1) != 0)
      {
        OUTLINED_FUNCTION_37_7((uint64_t)v25, *(_QWORD *)(v14 - 128), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 24));
        *(_QWORD *)(v14 - 96) = a1;
        OUTLINED_FUNCTION_27_8();
      }
      OUTLINED_FUNCTION_37_7(v13, *(_QWORD *)(v14 - 128), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
      OUTLINED_FUNCTION_4_19();
    }
    OUTLINED_FUNCTION_22_9((uint64_t)v20, 1);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    OUTLINED_FUNCTION_37_7(v13, *(_QWORD *)(v14 - 128), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
    OUTLINED_FUNCTION_4_19();
  }
  __break(1u);
  JUMPOUT(0x24772486CLL);
}

void SonicError.Interpolation.appendInterpolation<A>(underlying:)(uint64_t a1)
{
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_4_6();
  type metadata accessor for SonicError.Interpolation.State();
}

void sub_2477248F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;

  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_11_18();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&a9 - v14;
  OUTLINED_FUNCTION_37_7(v9, *(_QWORD *)(v12 - 120), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
  sub_2477243B8(v9, v11, (uint64_t)v15);
}

void sub_247724978()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;

  sub_2476D5680();
  v7 = *(_QWORD *)(*v0 + 16);
  sub_2476D5704(v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v6, v4, v3);
  v8 = MEMORY[0x2495822A8](&unk_2477336D0, v3);
  sub_247725CD0(v7, v6, v0, v3, v8);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v3);
  v9._countAndFlagsBits = sub_247723A38(v2, v5);
  OUTLINED_FUNCTION_16_16(v9);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_24_3();
}

void SonicError.Interpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_BYTE *, _QWORD);
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[32];

  v5 = v3;
  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_3_10();
  v8 = *(_QWORD *)(*v5 + 16);
  (*(void (**)(uint64_t))(v7 + 16))(v4);
  v9 = sub_24772D4C8();
  if (v9)
  {
    v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, a3);
  }
  else
  {
    v10 = OUTLINED_FUNCTION_36();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v11, v4, a3);
  }
  v12 = *v5;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v5 = v12;
  if ((isUniquelyReferenced_nonNull_native & 1) != 0)
  {
    if (v8)
      goto LABEL_6;
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  sub_247719260(v12);
  v12 = v22;
  *v5 = v22;
  if (!v8)
    goto LABEL_9;
LABEL_6:
  if (v8 <= *(_QWORD *)(v12 + 16))
  {
    v14 = v12 + 40 * v8;
    v15 = *(_QWORD *)(v14 + 16);
    v16 = *(_QWORD *)(v14 + 24);
    __swift_mutable_project_boxed_opaque_existential_1(v14 - 8, v15);
    v17 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v16 + 88))(v23, v15, v16);
    v19 = v18;
    sub_2476D568C();
    v20 = *(_QWORD *)(*v19 + 16);
    sub_2476D5710(v20);
    v21 = *v19;
    *(_QWORD *)(v21 + 16) = v20 + 1;
    *(_QWORD *)(v21 + 8 * v20 + 32) = v10;
    v17(v23, 0);
    *v5 = v12;
    OUTLINED_FUNCTION_18_3();
    return;
  }
LABEL_10:
  __break(1u);
}

uint64_t SonicError.Interpolation.appendInterpolation<A>(_:)()
{
  Swift::String v1;

  v1._countAndFlagsBits = sub_24772D480();
  OUTLINED_FUNCTION_16_16(v1);
  return swift_bridgeObjectRelease();
}

void SonicError.Interpolation.appendInterpolation<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;

  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_4_6();
  (*(void (**)(uint64_t))(v3 + 16))(v2 - v1);
  v4._countAndFlagsBits = sub_24772CA54();
  SonicError.Interpolation.appendLiteral(_:)(v4);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_44();
}

uint64_t SonicError.Interpolation.appendInterpolation(_:)()
{
  Swift::String v0;

  sub_247725D48();
  v0._countAndFlagsBits = sub_24772CA54();
  SonicError.Interpolation.appendLiteral(_:)(v0);
  return swift_bridgeObjectRelease();
}

void sub_247724C60()
{
  SonicError.Interpolation.init(literalCapacity:interpolationCount:)();
}

void sub_247724C6C(Swift::String *a1)
{
  SonicError.Interpolation.appendLiteral(_:)(*a1);
}

uint64_t sub_247724C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v7)(uint64_t, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = *(void (**)(uint64_t, uint64_t))(a5 + 96);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v11 = type metadata accessor for SonicError(0, AssociatedTypeWitness, AssociatedConformanceWitness, v10);
  MEMORY[0x2495822A8](&protocol conformance descriptor for SonicError<A>, v11);
  v12 = swift_allocError();
  v7(a3, a5);
  return v12;
}

uint64_t SonicError.code.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t SonicError.code.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 40))(v2, a1);
}

double (*SonicError.code.modify())(_QWORD)
{
  return nullsub_1;
}

uint64_t SonicError.debugMessage.getter()
{
  sub_24772C91C();
  return OUTLINED_FUNCTION_123_0();
}

void SonicError.debugMessage.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *(int *)(a3 + 36));
  swift_bridgeObjectRelease();
  *v6 = a1;
  v6[1] = a2;
  OUTLINED_FUNCTION_44();
}

double (*SonicError.debugMessage.modify())(_QWORD)
{
  return nullsub_1;
}

uint64_t SonicError.underlyingErrors.getter()
{
  return sub_24772C91C();
}

void SonicError.underlyingErrors.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(int *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + v4) = a1;
  OUTLINED_FUNCTION_44();
}

double (*SonicError.underlyingErrors.modify())(_QWORD)
{
  return nullsub_1;
}

void SonicError.withUnderlyingErrors(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_61_2(v3, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  sub_24772C91C();
  sub_2476C9C3C();
  OUTLINED_FUNCTION_10_6();
}

uint64_t sub_247724EB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_61_2(v3, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32));
  return v2;
}

uint64_t SonicError.codeDescription.getter(uint64_t a1)
{
  return sub_247723A38(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_247724EF8(uint64_t a1)
{
  MEMORY[0x2495822A8](&protocol conformance descriptor for SonicError<A>, a1);
  return sub_24772D5A0();
}

uint64_t sub_247724F2C(uint64_t a1)
{
  MEMORY[0x2495822A8](&protocol conformance descriptor for SonicError<A>, a1);
  return sub_24772D594();
}

uint64_t sub_247724F60(uint64_t *a1, uint64_t a2)
{
  return SonicError.init(stringInterpolation:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

void sub_247724F74()
{
  SonicError.init(stringLiteral:)();
}

uint64_t static SonicError.errorDomain.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t SonicError.errorCode.getter()
{
  uint64_t AssociatedTypeWitness;
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t i;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  char v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;

  swift_getAssociatedTypeWitness();
  v53 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(swift_getAssociatedConformanceWitness() + 8) + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v52 = (char *)&v50 - v1;
  v2 = swift_checkMetadataState();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_11_18();
  v51 = v3 - v4;
  OUTLINED_FUNCTION_59_2();
  MEMORY[0x24BDAC7A8](v5);
  v54 = (char *)&v50 - v6;
  OUTLINED_FUNCTION_59_2();
  MEMORY[0x24BDAC7A8](v7);
  v57 = (uint64_t)&v50 - v8;
  OUTLINED_FUNCTION_59_2();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v50 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v56 = (uint64_t)&v50 - v13;
  OUTLINED_FUNCTION_59_2();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v50 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v50 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v50 - v21;
  v24 = v23;
  sub_24772CC40();
  v25 = OUTLINED_FUNCTION_1_21();
  OUTLINED_FUNCTION_6_19((uint64_t)v20);
  v55 = v24;
  if ((v25 & 1) == 0)
  {
    v27 = (uint64_t)v20;
    goto LABEL_7;
  }
  v26 = OUTLINED_FUNCTION_2_23();
  OUTLINED_FUNCTION_0_25((uint64_t)v20);
  if (v26 <= 64)
    goto LABEL_8;
  OUTLINED_FUNCTION_6_19((uint64_t)v17);
  v59 = 0x8000000000000000;
  if ((OUTLINED_FUNCTION_1_21() & 1) != 0)
  {
    if (OUTLINED_FUNCTION_2_23() < 64)
    {
LABEL_27:
      v44 = OUTLINED_FUNCTION_7_24();
      result = OUTLINED_FUNCTION_0_25((uint64_t)v17);
      if (v44 < v59)
        goto LABEL_33;
LABEL_8:
      v28 = OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_6_19((uint64_t)v12);
      if (v28 < 65)
      {
        v29 = OUTLINED_FUNCTION_2_23();
        OUTLINED_FUNCTION_0_25((uint64_t)v12);
        if (v29 != 64 || (OUTLINED_FUNCTION_1_21() & 1) != 0)
          goto LABEL_20;
      }
      else
      {
        OUTLINED_FUNCTION_0_25((uint64_t)v12);
      }
      v30 = v57;
      OUTLINED_FUNCTION_6_19(v57);
      v59 = 0x7FFFFFFFFFFFFFFFLL;
      v31 = OUTLINED_FUNCTION_1_21();
      v32 = OUTLINED_FUNCTION_2_23();
      if ((v31 & 1) != 0)
      {
        if (v32 > 64)
        {
          sub_2476D980C();
          v33 = v56;
          OUTLINED_FUNCTION_5_18();
          v34 = sub_24772C9B8();
          OUTLINED_FUNCTION_0_25(v33);
          for (i = v30; ; i = v37)
          {
            OUTLINED_FUNCTION_0_25(i);
            if ((v34 & 1) == 0)
              break;
LABEL_17:
            __break(1u);
LABEL_18:
            v58 = 0x7FFFFFFFFFFFFFFFLL;
            v37 = v56;
            OUTLINED_FUNCTION_40_1(v56, v30, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v55 + 32));
            sub_2476D980C();
            v30 = (uint64_t)v54;
            OUTLINED_FUNCTION_5_18();
            v34 = sub_24772C9B8();
            OUTLINED_FUNCTION_0_25(v30);
          }
          goto LABEL_20;
        }
      }
      else if (v32 > 63)
      {
        goto LABEL_18;
      }
      v36 = OUTLINED_FUNCTION_7_24();
      OUTLINED_FUNCTION_0_25(v30);
      if (v59 < v36)
        goto LABEL_17;
LABEL_20:
      v38 = OUTLINED_FUNCTION_7_24();
      OUTLINED_FUNCTION_0_25((uint64_t)v22);
      return v38;
    }
    goto LABEL_23;
  }
  v40 = OUTLINED_FUNCTION_1_21();
  v41 = OUTLINED_FUNCTION_2_23();
  if ((v40 & 1) == 0)
  {
    if (v41 < 64)
      goto LABEL_27;
    v27 = (uint64_t)v17;
LABEL_7:
    OUTLINED_FUNCTION_0_25(v27);
    goto LABEL_8;
  }
  if (v41 > 64)
  {
LABEL_23:
    sub_2476D980C();
    v42 = v56;
    OUTLINED_FUNCTION_5_18();
    v43 = OUTLINED_FUNCTION_14_17();
    OUTLINED_FUNCTION_0_25(v42);
    result = OUTLINED_FUNCTION_0_25((uint64_t)v17);
    if ((v43 & 1) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
  swift_getAssociatedConformanceWitness();
  sub_24772D564();
  v45 = v56;
  sub_24772D4EC();
  v46 = OUTLINED_FUNCTION_14_17();
  OUTLINED_FUNCTION_0_25(v45);
  v47 = v51;
  OUTLINED_FUNCTION_40_1(v51, (uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v55 + 32));
  if ((v46 & 1) == 0)
  {
    v48 = v59;
    v49 = OUTLINED_FUNCTION_7_24();
    result = OUTLINED_FUNCTION_0_25(v47);
    if (v49 < v48)
      goto LABEL_33;
    goto LABEL_8;
  }
  result = OUTLINED_FUNCTION_0_25(v47);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t SonicError.errorUserInfo.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  v2 = v1;
  v4 = MEMORY[0x24BEE0D00];
  v15 = sub_24772C904();
  v5 = (uint64_t *)(v2 + *(int *)(a1 + 36));
  v7 = *v5;
  v6 = v5[1];
  v8 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0)
    v8 = v7 & 0xFFFFFFFFFFFFLL;
  if (v8)
  {
    sub_24772CA18();
    v14 = v4;
    v13[0] = v7;
    v13[1] = v6;
    sub_24772C91C();
    sub_2476D9EF0((uint64_t)v13);
  }
  v9 = *(_QWORD *)(v2 + *(int *)(a1 + 40));
  if (*(_QWORD *)(v9 + 16))
  {
    sub_24772CA18();
    v10 = sub_24772356C(v9);
    sub_247725D84();
    v14 = v11;
    v13[0] = v10;
    sub_2476D9EF0((uint64_t)v13);
  }
  return v15;
}

uint64_t sub_2477255F8(uint64_t a1)
{
  return static SonicError.errorDomain.getter(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

void SonicError.description.getter()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  OUTLINED_FUNCTION_10_6();
}

uint64_t sub_24772565C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v3 = (void *)OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_61_2(v4, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16));
  sub_2477256E0(v3, 0, v2);
  MEMORY[0x2495821C4](v3);
  swift_beginAccess();
  sub_24772C91C();
  swift_release();
  return OUTLINED_FUNCTION_123_0();
}

void sub_2477256E0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
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
  BOOL v19;
  uint64_t v20;
  void **v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void **v35;
  void *v36;
  id v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;

  if (a2 < 0)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  *(_QWORD *)&v43 = 0;
  *((_QWORD *)&v43 + 1) = 0xE000000000000000;
  if (a2)
  {
    v6 = a2;
    do
    {
      sub_24772CAFC();
      --v6;
    }
    while (v6);
    v46 = v43;
    if (a2 > 0)
    {
      swift_beginAccess();
      sub_24772CAFC();
      swift_endAccess();
      sub_24772CAFC();
    }
  }
  else
  {
    *(_QWORD *)&v46 = 0;
    *((_QWORD *)&v46 + 1) = 0xE000000000000000;
  }
  *(_QWORD *)&v38 = a1;
  v7 = a1;
  sub_2476B443C(0, (unint64_t *)&qword_25444C3A8);
  sub_2476B443C(0, &qword_25444C380);
  if (swift_dynamicCast())
  {
    sub_2476B3F20(&v40, (uint64_t)&v43);
    v8 = v44;
    v9 = v45;
    __swift_project_boxed_opaque_existential_1(&v43, v44);
    (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v8, v9);
    v10 = v44;
    v11 = v45;
    __swift_project_boxed_opaque_existential_1(&v43, v44);
    v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 16))(v10, v11);
    v14 = v13;
    swift_beginAccess();
    sub_24772CAFC();
    swift_endAccess();
    swift_bridgeObjectRelease();
    if ((sub_24772CB5C() & 1) == 0)
    {
      *(_QWORD *)&v40 = v12;
      *((_QWORD *)&v40 + 1) = v14;
      sub_24772C91C();
      sub_24772CAFC();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_24772CAFC();
      swift_endAccess();
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_24772CAFC();
    swift_endAccess();
    swift_bridgeObjectRelease();
    v16 = v44;
    v15 = v45;
    __swift_project_boxed_opaque_existential_1(&v43, v44);
    v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v15 + 8) + 8))(v16);
    v18 = *(_QWORD *)(v17 + 16);
    if (!v18)
      goto LABEL_27;
    v19 = __OFADD__(a2, 1);
    v20 = a2 + 1;
    if (!v19)
    {
      v21 = (void **)(v17 + 32);
      do
      {
        v22 = *v21++;
        v23 = v22;
        sub_2477256E0(v22, v20, a3);
        MEMORY[0x2495821C4](v22);
        --v18;
      }
      while (v18);
      goto LABEL_27;
    }
    goto LABEL_29;
  }
  v42 = 0;
  v40 = 0u;
  v41 = 0u;
  sub_247726B40((uint64_t)&v40);
  v24 = (void *)sub_24772C490();
  v25 = objc_msgSend(v24, sel_userInfo, (_QWORD)v38);
  v26 = sub_24772C8F8();

  sub_24772CA18();
  sub_2476C4988(v26, &v40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v41 + 1))
  {
    sub_2476B5E48(&v40, &v43);
  }
  else
  {
    v27 = objc_msgSend(v24, sel_userInfo);
    v28 = MEMORY[0x24BEE0D00];
    v29 = sub_24772C8F8();

    sub_24772CA18();
    sub_2476C4988(v29, &v38);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v39)
    {
      sub_2476B5E48(&v38, &v43);
    }
    else
    {
      v44 = v28;
      *(_QWORD *)&v43 = 0xD00000000000001ELL;
      *((_QWORD *)&v43 + 1) = 0x8000000247736710;
      sub_2476DC4D4((uint64_t)&v38);
    }
    sub_2476DC4D4((uint64_t)&v40);
  }
  *(_QWORD *)&v40 = 0;
  *((_QWORD *)&v40 + 1) = 0xE000000000000000;
  sub_24772CAFC();
  swift_bridgeObjectRelease();
  v30 = objc_msgSend(v24, sel_domain);
  sub_24772CA18();

  sub_24772CAFC();
  swift_bridgeObjectRelease();
  sub_24772CAFC();
  *(_QWORD *)&v38 = objc_msgSend(v24, sel_code);
  sub_24772D480();
  sub_24772CAFC();
  swift_bridgeObjectRelease();
  sub_24772CAFC();
  sub_24772D300();
  swift_beginAccess();
  sub_24772CAFC();
  swift_endAccess();
  swift_bridgeObjectRelease();
  v31 = objc_msgSend(v24, sel_underlyingErrors);
  v32 = sub_24772CC7C();

  v33 = *(_QWORD *)(v32 + 16);
  if (!v33)
  {
LABEL_26:

LABEL_27:
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v43);
    return;
  }
  v19 = __OFADD__(a2, 1);
  v34 = a2 + 1;
  if (!v19)
  {
    v35 = (void **)(v32 + 32);
    do
    {
      v36 = *v35++;
      v37 = v36;
      sub_2477256E0(v36, v34, a3);
      MEMORY[0x2495821C4](v36);
      --v33;
    }
    while (v33);
    goto LABEL_26;
  }
LABEL_30:
  __break(1u);
}

uint64_t sub_247725CD0(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_0;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v14 = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_0, a2, a4);
  v10 = *a3;
  *(_QWORD *)(v10 + 16) = a1 + 1;
  return sub_2476B3F20(&v12, v10 + 40 * a1 + 32);
}

unint64_t sub_247725D48()
{
  unint64_t result;

  result = qword_2576B9A18[0];
  if (!qword_2576B9A18[0])
  {
    result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, qword_2576B9A18);
  }
  return result;
}

void sub_247725D84()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25444C390)
  {
    sub_2476DBC64();
    v0 = sub_24772CD48();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25444C390);
  }
}

uint64_t sub_247725DD8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_247725DFC()
{
  return MEMORY[0x24BEE0D80];
}

void sub_247725E08()
{
  JUMPOUT(0x2495822A8);
}

void sub_247725E18()
{
  JUMPOUT(0x2495822A8);
}

void sub_247725E28()
{
  JUMPOUT(0x2495822A8);
}

void sub_247725E38()
{
  JUMPOUT(0x2495822A8);
}

uint64_t sub_247725E48()
{
  return MEMORY[0x24BEE0D90];
}

uint64_t sub_247725E54()
{
  return MEMORY[0x24BEE0D88];
}

void sub_247725E60()
{
  JUMPOUT(0x2495822A8);
}

uint64_t dispatch thunk of static SonicErrorCode.domainName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static SonicErrorCode.unknown.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_247725E80()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_247725F04(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v10 = *v11;
    v10[1] = v11[1];
    *(_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFF8);
    sub_24772C91C();
    sub_24772C91C();
  }
  return v4;
}

uint64_t sub_247725FE8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247726038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  sub_24772C91C();
  sub_24772C91C();
  return a1;
}

uint64_t sub_2477260C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  sub_24772C91C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  sub_24772C91C();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24772615C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2477261C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247726254(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (v7 >= a2)
  {
    if (v6 < 0x7FFFFFFF)
    {
      v13 = *(_QWORD *)(((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8) + 8);
      if (v13 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
    else
    {
      return __swift_getEnumTagSinglePayload(a1, v6, v4);
    }
  }
  else
  {
    if (((((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
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
    return ((uint64_t (*)(void))((char *)&loc_2477262D8 + 4 * byte_2477333D0[v11]))();
  }
}

void sub_247726358(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
  }
  if (a2 > v6)
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v10 = ~v6 + a2;
      bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8);
      *a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_24772644C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;

  *(_BYTE *)(v5 + v6) = 0;
  if ((_DWORD)a2)
  {
    if (a3 < 0x7FFFFFFF)
    {
      v8 = (_QWORD *)((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
      if ((a2 & 0x80000000) != 0)
      {
        *v8 = a2 ^ 0x80000000;
        v8[1] = 0;
      }
      else
      {
        v8[1] = (a2 - 1);
      }
    }
    else
    {
      return __swift_storeEnumTagSinglePayload(v5, a2, a3, a4);
    }
  }
  return result;
}

uint64_t sub_2477264DC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2477264E4()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_247726568(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v10 = *v11;
    v10[1] = v11[1];
    *(_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFF8);
    sub_24772C91C();
    sub_24772C91C();
  }
  return v4;
}

uint64_t sub_24772664C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24772669C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  sub_24772C91C();
  sub_24772C91C();
  return a1;
}

uint64_t sub_247726724(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  sub_24772C91C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  sub_24772C91C();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2477267C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24772682C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  *(_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2477268B8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (v7 >= a2)
  {
    if (v6 < 0x7FFFFFFF)
    {
      v13 = *(_QWORD *)(((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8) + 8);
      if (v13 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
    else
    {
      return __swift_getEnumTagSinglePayload(a1, v6, v4);
    }
  }
  else
  {
    if (((((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
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
    return ((uint64_t (*)(void))((char *)&loc_24772693C + 4 * byte_2477333DF[v11]))();
  }
}

void sub_2477269BC(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
  }
  if (a2 > v6)
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v10 = ~v6 + a2;
      bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8);
      *a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_247726AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;

  *(_BYTE *)(v5 + v6) = 0;
  if ((_DWORD)a2)
  {
    if (a3 < 0x7FFFFFFF)
    {
      v8 = (_QWORD *)((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
      if ((a2 & 0x80000000) != 0)
      {
        *v8 = a2 ^ 0x80000000;
        v8[1] = 0;
      }
      else
      {
        v8[1] = (a2 - 1);
      }
    }
    else
    {
      return __swift_storeEnumTagSinglePayload(v5, a2, a3, a4);
    }
  }
  return result;
}

uint64_t sub_247726B40(uint64_t a1)
{
  uint64_t v2;

  sub_247726B9C(0, &qword_25444C388, &qword_25444C380, (uint64_t)&protocol descriptor for _SonicError, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_247726B9C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_2476B443C(255, a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t OUTLINED_FUNCTION_0_25(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_1_21()
{
  return sub_24772D0D8();
}

uint64_t OUTLINED_FUNCTION_2_23()
{
  return sub_24772D0CC();
}

void OUTLINED_FUNCTION_4_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_2477243B8(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_5_18()
{
  return sub_24772D0B4();
}

uint64_t OUTLINED_FUNCTION_6_19(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_7_24()
{
  return sub_24772D0C0();
}

uint64_t OUTLINED_FUNCTION_14_17()
{
  return sub_24772C9B8();
}

void OUTLINED_FUNCTION_16_16(Swift::String a1)
{
  SonicError.Interpolation.appendLiteral(_:)(a1);
}

uint64_t OUTLINED_FUNCTION_18_16()
{
  uint64_t v0;
  uint64_t v1;

  return sub_247723A38(v0, v1);
}

uint64_t OUTLINED_FUNCTION_20_12()
{
  uint64_t v0;

  return sub_2476D5704(*(_QWORD *)(*(_QWORD *)v0 + 16));
}

uint64_t OUTLINED_FUNCTION_21_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v6;

  return sub_247725CD0(a1, a2, v5, v6, a5);
}

uint64_t OUTLINED_FUNCTION_22_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_23_14()
{
  sub_2476C6380();
}

uint64_t OUTLINED_FUNCTION_24_16()
{
  return sub_2476D5680();
}

void OUTLINED_FUNCTION_27_8()
{
  JUMPOUT(0x2495822A8);
}

void OUTLINED_FUNCTION_29_13(Swift::String a1)
{
  SonicError.Interpolation.appendLiteral(_:)(a1);
}

char *sub_247726D08(int a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v10;
  char *result;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v3 = sub_24772CA18();
  v5 = v4;
  OUTLINED_FUNCTION_14_4(v3, (unint64_t *)&qword_2576B88A0, (uint64_t (*)(uint64_t))sub_2476DBC08, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24772F870;
  *(_QWORD *)(inited + 32) = sub_24772CA18();
  *(_QWORD *)(inited + 40) = v7;
  v8 = sub_24772C544();
  *(_QWORD *)(inited + 72) = v8;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 48));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(boxed_opaque_existential_0, v1, v8);
  *(_QWORD *)(inited + 80) = sub_24772CA18();
  *(_QWORD *)(inited + 88) = v10;
  result = strerror(a1);
  if (result)
  {
    v12 = MEMORY[0x249580DFC]();
    *(_QWORD *)(inited + 120) = MEMORY[0x24BEE0D00];
    if (!v13)
    {
      sub_24772D144();
      swift_bridgeObjectRelease();
      sub_24772D480();
      sub_24772CAFC();
      swift_bridgeObjectRelease();
      v12 = 0xD000000000000013;
      v13 = 0x8000000247736730;
    }
    *(_QWORD *)(inited + 96) = v12;
    *(_QWORD *)(inited + 104) = v13;
    v14 = a1;
    v15 = sub_24772C904();
    v16 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    return (char *)sub_2477277E0(v3, v5, v14, v15);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t URL.coreURL.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  OUTLINED_FUNCTION_14_4(a1, &qword_2576B9B20, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBB78], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  OUTLINED_FUNCTION_9_9();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - v4;
  v6 = sub_24772C400();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24772C3B8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    sub_247727B54((uint64_t)v5, &qword_2576B9B20, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBB78]);
    v10 = sub_24772C544();
    return __swift_storeEnumTagSinglePayload(a2, 1, 1, v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    OUTLINED_FUNCTION_6_20();
    sub_24772C3D0();
    OUTLINED_FUNCTION_6_20();
    sub_24772C3F4();
    OUTLINED_FUNCTION_6_20();
    sub_24772C3DC();
    OUTLINED_FUNCTION_6_20();
    sub_24772C3E8();
    sub_24772C3C4();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_247727020()
{
  uint64_t v0;
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  id v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t inited;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t result;
  char v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int v44;
  char *v45;
  char *v46;
  char v47;
  char v48;
  char *v49;
  char v50;
  char v51;
  BOOL v52;
  char *v53;
  char v54;
  char v55;
  char v56;
  char v57;
  uint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  char *v65;
  char *v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  _OWORD v71[2];
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  v1 = v0;
  sub_2476CA9B4(0, &qword_2576B9028, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  OUTLINED_FUNCTION_9_9();
  MEMORY[0x24BDAC7A8](v2);
  v66 = (char *)&v58 - v3;
  v4 = sub_24772C544();
  v70 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v69 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24772C484();
  v67 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v65 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v68 = (char *)&v58 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v58 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v58 - v14;
  v16 = (char *)objc_opt_self();
  v17 = objc_msgSend(v16, sel_defaultManager);
  sub_24772C508();
  v18 = (void *)sub_24772C9F4();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v17, sel_fileExistsAtPath_, v18);

  if (!v19)
    return 0;
  v60 = v13;
  v61 = v16;
  v62 = v4;
  v63 = v6;
  sub_2476CA9B4(0, &qword_2576B92C0, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v21 = v20;
  inited = swift_initStackObject();
  v64 = xmmword_247733700;
  *(_OWORD *)(inited + 16) = xmmword_247733700;
  v23 = (void *)*MEMORY[0x24BDBCC98];
  v24 = (void *)*MEMORY[0x24BDBCCE8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCC98];
  *(_QWORD *)(inited + 40) = v24;
  v25 = (void *)*MEMORY[0x24BDBCC48];
  *(_QWORD *)(inited + 48) = *MEMORY[0x24BDBCC48];
  v26 = v23;
  v27 = v24;
  v28 = v25;
  sub_247727900(inited);
  v29 = v74;
  sub_24772C4CC();
  swift_bridgeObjectRelease();
  v74 = v29;
  if (v29)
    return v27;
  v59 = v15;
  v31 = sub_24772C460();
  if (v31 == 2)
    goto LABEL_37;
  v32 = v63;
  if ((v31 & 1) == 0)
  {
    v33 = swift_initStackObject();
    *(_OWORD *)(v33 + 16) = v64;
    *(_QWORD *)(v33 + 32) = v26;
    *(_QWORD *)(v33 + 40) = v27;
    *(_QWORD *)(v33 + 48) = v28;
    v34 = v26;
    v35 = (id)v27;
    v36 = v28;
    sub_247727900(v33);
    v38 = v37;
    v39 = objc_msgSend(v61, sel_defaultManager);
    v40 = sub_24772C91C();
    sub_247703E8C(v40);
    v42 = v41;
    *(_QWORD *)&v64 = v38;
    swift_bridgeObjectRelease();
    v43 = (void *)sub_24772CFAC();

    swift_release();
    if (!v43)
    {
      v27 = 0;
      v72 = 0u;
      v73 = 0u;
      OUTLINED_FUNCTION_1_22();
LABEL_32:
      sub_2476DC4D4((uint64_t)&v72);
      OUTLINED_FUNCTION_8_20(v42, 1);
LABEL_34:
      OUTLINED_FUNCTION_4_20();

      (*(void (**)(char *, uint64_t))(v21 + 8))(v59, v32);
      sub_247727B54(v42, &qword_2576B9028, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
      return v27;
    }
    v61 = 0;
    OUTLINED_FUNCTION_1_22();
    while (1)
    {
      while (1)
      {
        if (objc_msgSend(v43, sel_nextObject))
        {
          sub_24772D0E4();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v71, 0, sizeof(v71));
        }
        sub_247727B94((uint64_t)v71, (uint64_t)&v72);
        if (!*((_QWORD *)&v73 + 1))
        {
          v27 = (uint64_t)v61;
          goto LABEL_32;
        }
        v44 = swift_dynamicCast();
        OUTLINED_FUNCTION_8_20(v42, v44 ^ 1u);
        if (__swift_getEnumTagSinglePayload(v42, 1, (uint64_t)v26) == 1)
        {
          v27 = (uint64_t)v61;
          goto LABEL_34;
        }
        v27 = v32;
        (*(void (**)(char *, uint64_t, id))(v70 + 32))(v69, v42, v26);
        v45 = v68;
        sub_24772C4CC();
        if (v1)
        {
          v74 = v1;
          OUTLINED_FUNCTION_4_20();

          OUTLINED_FUNCTION_0_26();
          (*(void (**)(char *, uint64_t))(v21 + 8))(v59, v27);
          return v27;
        }
        if ((sub_24772C460() & 1) != 0)
          break;
        v46 = v45;
        v32 = v27;
        (*(void (**)(char *, uint64_t))(v21 + 8))(v46, v27);
        OUTLINED_FUNCTION_0_26();
      }
      v74 = sub_24772C46C();
      v48 = v47;
      v49 = v45;
      v32 = v27;
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v65, v49, v27);
      if ((v48 & 1) == 0)
        break;
      v74 = sub_24772C478();
      v51 = v50;
      OUTLINED_FUNCTION_3_25();
      if ((v51 & 1) != 0)
      {
        ((void (*)(char *, uint64_t))v21)(v68, v27);
        OUTLINED_FUNCTION_0_26();
        v21 = v67;
        v42 = (uint64_t)v66;
      }
      else
      {
LABEL_21:
        if (v74 < 0)
          goto LABEL_39;
        ((void (*)(char *, uint64_t))v21)(v68, v27);
        OUTLINED_FUNCTION_0_26();
        v52 = __CFADD__(v61, v74);
        v61 += v74;
        v42 = (uint64_t)v66;
        if (v52)
        {
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        v21 = v67;
      }
    }
    OUTLINED_FUNCTION_3_25();
    goto LABEL_21;
  }
  v53 = v59;
  v27 = sub_24772C46C();
  v55 = v54;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v60, v53, v32);
  if ((v55 & 1) != 0)
  {
    v27 = sub_24772C478();
    v57 = v56;
    OUTLINED_FUNCTION_2_24();
    if ((v57 & 1) != 0)
      goto LABEL_38;
  }
  else
  {
    OUTLINED_FUNCTION_2_24();
  }
  if ((v27 & 0x8000000000000000) == 0)
  {
    ((void (*)(char *, uint64_t))v53)(v59, v32);
    return v27;
  }
LABEL_39:
  result = sub_24772D348();
  __break(1u);
  return result;
}

uint64_t sub_247727718()
{
  id v0;
  void *v1;
  unsigned int v2;
  unsigned __int8 v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_24772C508();
  v1 = (void *)sub_24772C9F4();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_fileExistsAtPath_isDirectory_, v1, &v4);

  if (v2)
    return v4;
  else
    return 2;
}

id sub_2477277E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)sub_24772C9F4();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v8 = (void *)sub_24772C8EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

uint64_t sub_24772788C()
{
  uint64_t v0;

  sub_24772CA18();
  sub_24772D600();
  sub_24772CAC0();
  v0 = sub_24772D624();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_247727900(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = a1;
  if (!*(_QWORD *)(a1 + 16) || (sub_247727BD8(), v2 = sub_24772D12C(), v3 = v2, (v32 = *(_QWORD *)(v1 + 16)) == 0))
  {
LABEL_24:
    swift_bridgeObjectRelease();
    return;
  }
  v4 = 0;
  v5 = v2 + 56;
  v30 = v1;
  v31 = v1 + 32;
  while (v4 < *(_QWORD *)(v1 + 16))
  {
    v6 = *(void **)(v31 + 8 * v4);
    sub_24772CA18();
    sub_24772D600();
    v7 = v6;
    sub_24772CAC0();
    v8 = sub_24772D624();
    swift_bridgeObjectRelease();
    v9 = -1 << *(_BYTE *)(v3 + 32);
    v10 = v8 & ~v9;
    v11 = v10 >> 6;
    v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
    v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      v14 = sub_24772CA18();
      v16 = v15;
      if (v14 == sub_24772CA18() && v16 == v17)
      {
LABEL_21:
        swift_bridgeObjectRelease_n();
LABEL_22:

        goto LABEL_23;
      }
      v19 = sub_24772D4F8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
        goto LABEL_22;
      v20 = ~v9;
      while (1)
      {
        v10 = (v10 + 1) & v20;
        v11 = v10 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
        v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0)
          break;
        v21 = sub_24772CA18();
        v23 = v22;
        if (v21 == sub_24772CA18() && v23 == v24)
          goto LABEL_21;
        v26 = sub_24772D4F8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v26 & 1) != 0)
          goto LABEL_22;
      }
    }
    *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v10) = v7;
    v27 = *(_QWORD *)(v3 + 16);
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
      goto LABEL_26;
    *(_QWORD *)(v3 + 16) = v29;
LABEL_23:
    ++v4;
    v1 = v30;
    if (v4 == v32)
      goto LABEL_24;
  }
  __break(1u);
LABEL_26:
  __break(1u);
}

uint64_t sub_247727B54(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  OUTLINED_FUNCTION_14_4(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_247727B94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24770EF5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_247727BD8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576B9B28)
  {
    type metadata accessor for URLResourceKey(255);
    sub_247727C38();
    v0 = sub_24772D138();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576B9B28);
  }
}

unint64_t sub_247727C38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576B7CB0;
  if (!qword_2576B7CB0)
  {
    type metadata accessor for URLResourceKey(255);
    result = MEMORY[0x2495822A8](&unk_24772E3B8, v1);
    atomic_store(result, (unint64_t *)&qword_2576B7CB0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_26()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(v1 - 280) + 8))(*(_QWORD *)(v1 - 288), v0);
}

uint64_t OUTLINED_FUNCTION_2_24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_3_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_4_20()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_20()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_8_20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t Sequence<>.hexString.getter()
{
  uint64_t v0;

  sub_24772CBC8();
  sub_2477139F4();
  sub_2476C5830();
  v0 = sub_24772C9AC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_247727D8C@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v3 = *a1;
  sub_2476F8D74();
  v4 = swift_allocObject();
  v5 = MEMORY[0x24BEE4260];
  *(_OWORD *)(v4 + 16) = xmmword_24772E730;
  v6 = MEMORY[0x24BEE42B0];
  *(_QWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 64) = v6;
  *(_BYTE *)(v4 + 32) = v3;
  result = sub_24772CA30();
  *a2 = result;
  a2[1] = v8;
  return result;
}

uint64_t sub_247727E0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD v12[2];
  uint64_t v13;

  v3 = sub_24772C370();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = MEMORY[0x24BEE4AF8];
  if (v7)
  {
    v12[1] = v1;
    v13 = MEMORY[0x24BEE4AF8];
    sub_2476B31C0();
    v8 = v13;
    v9 = a1 + 56;
    do
    {
      sub_24772C91C();
      sub_24772C91C();
      sub_24772C364();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v13 = v8;
      v10 = *(_QWORD *)(v8 + 16);
      if (v10 >= *(_QWORD *)(v8 + 24) >> 1)
      {
        sub_2476B31C0();
        v8 = v13;
      }
      v9 += 32;
      *(_QWORD *)(v8 + 16) = v10 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v10, v6, v3);
      --v7;
    }
    while (v7);
  }
  return v8;
}

uint64_t URLQueryItemCollection.init<A>(contentsOf:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  sub_24772C370();
  v8 = sub_24772CD54();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  *a3 = v8;
  return result;
}

uint64_t URLQueryItemCollection.queryItems.getter()
{
  return sub_24772C91C();
}

uint64_t URLQueryItemCollection.queryItems.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

double (*URLQueryItemCollection.queryItems.modify())(_QWORD)
{
  return nullsub_1;
}

uint64_t URLQueryItemCollection.init(dictionaryLiteral:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_247727E0C(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t URLQueryItemCollection.init(arrayLiteral:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t URL.appending(queryItems:)()
{
  return sub_24772C520();
}

uint64_t URL.append(queryItems:)()
{
  return sub_24772C514();
}

ValueMetadata *type metadata accessor for URLQueryItemCollection()
{
  return &type metadata for URLQueryItemCollection;
}

uint64_t sub_2477280E8()
{
  uint64_t result;
  unsigned int v1;
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  result = sub_247727718();
  if ((result & 1) != 0)
  {
    v2 = 0;
    sub_247728514(&v2, 0x80084A02uLL, &v1);
    result = v1;
    if (v1)
    {
      sub_247726D08(v1);
      return OUTLINED_FUNCTION_1_23();
    }
  }
  return result;
}

void sub_24772817C(int *a1, char *a2)
{
  int v2;
  uint64_t v3;
  id v4;
  void *v5;
  unsigned int v6;
  int v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = *a2;
  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_24772C508();
  v5 = (void *)sub_24772C9F4();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_fileExistsAtPath_, v5);

  if (v6)
  {
    if (v2 < 0)
    {
      sub_24772D348();
      __break(1u);
    }
    else
    {
      v8 = v2 | dword_2477310A0[v3] | 0x10000;
      OUTLINED_FUNCTION_0_27(&v8, &v7);
      if (v7)
      {
        sub_247726D08(v7);
        OUTLINED_FUNCTION_1_23();
      }
    }
  }
}

uint64_t sub_2477282D8()
{
  uint64_t result;
  unsigned int v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v2[0] = 0;
  OUTLINED_FUNCTION_0_27(v2, &v1);
  result = v1;
  if (v1)
  {
    sub_247726D08(v1);
    return OUTLINED_FUNCTION_1_23();
  }
  return result;
}

void static URL.PurgeContentType.music.getter(_DWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_2_25(a1);
}

void static URL.PurgeContentType.podcasts.getter(_DWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_2_25(a1);
}

void static URL.PurgeContentType.data.getter(_DWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_2_25(a1);
}

BOOL static URL.PurgeUrgency.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t URL.PurgeUrgency.hash(into:)()
{
  return sub_24772D60C();
}

uint64_t URL.PurgeUrgency.hashValue.getter()
{
  sub_24772D600();
  sub_24772D60C();
  return sub_24772D624();
}

unint64_t sub_2477283FC()
{
  unint64_t result;

  result = qword_2576B9B30;
  if (!qword_2576B9B30)
  {
    result = MEMORY[0x2495822A8](&protocol conformance descriptor for URL.PurgeUrgency, &type metadata for URL.PurgeUrgency);
    atomic_store(result, &qword_2576B9B30);
  }
  return result;
}

ValueMetadata *type metadata accessor for URL.PurgeContentType()
{
  return &type metadata for URL.PurgeContentType;
}

uint64_t _s12PurgeUrgencyOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_247728494 + 4 * byte_2477337B5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2477284C8 + 4 * asc_2477337B0[v4]))();
}

uint64_t sub_2477284C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2477284D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2477284D8);
  return result;
}

uint64_t sub_2477284E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2477284ECLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2477284F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2477284F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for URL.PurgeUrgency()
{
  return &type metadata for URL.PurgeUrgency;
}

uint64_t sub_247728514@<X0>(void *a1@<X0>, unint64_t a2@<X3>, _DWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  int v13;
  uint64_t v14;
  uint64_t result;
  _QWORD v16[2];

  v6 = sub_24772CA48();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = sub_24772C508();
  v16[1] = v10;
  sub_24772CA3C();
  sub_2476B5B30();
  v11 = sub_24772D090();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  if (v11)
    v12 = (const char *)(v11 + 32);
  else
    v12 = 0;
  v13 = fsctl(v12, a2, a1, 0);
  v14 = swift_bridgeObjectRelease();
  if (v13)
    result = MEMORY[0x249580B14](v14);
  else
    result = 0;
  *a3 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_27@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_247728514(a1, 0xC0084A44uLL, a2);
}

uint64_t OUTLINED_FUNCTION_1_23()
{
  return swift_willThrow();
}

void OUTLINED_FUNCTION_2_25(_DWORD *a1@<X8>)
{
  int v1;

  *a1 = v1;
}

uint64_t SQL.init(stringLiteral:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_BYTE *)(a3 + 32) = 0;
  return result;
}

void SQL.Interpolation.init(literalCapacity:interpolationCount:)(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  a2[1] = 0;
  a2[2] = 0;
  a2[3] = MEMORY[0x24BEE4AF8];
  if (__OFADD__(a1, 2))
  {
    __break(1u);
  }
  else
  {
    sub_2476C5B34();
    *a2 = v3;
  }
}

Swift::Void __swiftcall SQL.Interpolation.appendLiteral(_:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  Swift::String v4;
  char v5;

  v4 = a1;
  v5 = 0;
  sub_24772C91C();
  sub_2476D5674();
  OUTLINED_FUNCTION_2_26();
  v3 = *v2;
  *(_QWORD *)(v3 + 16) = v1 + 1;
  sub_2476E18A8(&v4, (void *)(v3 + 80 * v1 + 32));
  *v2 = v3;
  OUTLINED_FUNCTION_0_28();
}

void SQL.Interpolation.appendInterpolation<A>(unsafe:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[9];
  char v6;

  v2 = v0;
  v5[0] = sub_24772D480();
  v5[1] = v3;
  v6 = 0;
  sub_2476D5674();
  OUTLINED_FUNCTION_4_21();
  v4 = *v0;
  *(_QWORD *)(v4 + 16) = v1 + 1;
  sub_2476E18A8(v5, (void *)(v4 + 80 * v1 + 32));
  *v2 = v4;
  OUTLINED_FUNCTION_0_28();
}

uint64_t SQL.init(stringInterpolation:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v7 = *a1;
  v8 = *(_OWORD *)(a1 + 1);
  v9 = a1[3];
  sub_247728928();
  result = v9;
  v4 = *(_QWORD *)(v9 + 16);
  if (v4)
  {
    v5 = v7;
    v6 = v8;
LABEL_5:
    *(_QWORD *)a2 = v5;
    *(_OWORD *)(a2 + 8) = v6;
    *(_QWORD *)(a2 + 24) = result;
    *(_BYTE *)(a2 + 32) = v4 != 0;
    return result;
  }
  if (*((_QWORD *)&v8 + 1))
  {
    v5 = v8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    v6 = *((unint64_t *)&v8 + 1);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

SonicFoundation::LiteralSQL __swiftcall LiteralSQL.init(stringLiteral:)(SonicFoundation::LiteralSQL stringLiteral)
{
  SonicFoundation::LiteralSQL *v1;

  *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t SQL.Interpolation.appendInterpolation(_:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = a1[3];
  v3 = a1[4];
  v4 = __swift_project_boxed_opaque_existential_1(a1, v2);
  return sub_247729C80((uint64_t)v4, v1, v2, v3);
}

SonicFoundation::LiteralSQL_optional __swiftcall LiteralSQL.init(rawValue:)(SonicFoundation::LiteralSQL_optional rawValue)
{
  SonicFoundation::LiteralSQL_optional *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t LiteralSQL.sql.getter@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *(_QWORD *)a1 = *v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 0;
  return sub_24772C91C();
}

uint64_t LiteralSQL.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_11_2();
  return v1;
}

uint64_t LiteralSQL.rawValue.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

double (*LiteralSQL.rawValue.modify())(_QWORD)
{
  return nullsub_1;
}

uint64_t sub_2477288D8(Swift::String *a1)
{
  return LiteralSQL.init(rawValue:)(*a1).value.rawValue._countAndFlagsBits;
}

uint64_t sub_2477288E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = LiteralSQL.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_247728908(uint64_t *a1, uint64_t *a2)
{
  return sub_2476E5BBC(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_24772891C(Swift::String *a1)
{
  return LiteralSQL.init(stringLiteral:)(*a1).rawValue._countAndFlagsBits;
}

uint64_t sub_247728928()
{
  uint64_t *v0;
  uint64_t *v1;
  unint64_t v2;
  uint64_t v3;
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
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t __src;
  char __srca[8];
  char __srcb[8];
  uint64_t v32;
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
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  unint64_t v52;

  v1 = v0;
  v2 = 0xE000000000000000;
  v51 = 0;
  v52 = 0xE000000000000000;
  v3 = *(_QWORD *)(*v1 + 16);
  if (v3)
  {
    v4 = *v1 + 32;
    v26 = *v1;
    sub_24772C91C();
    v5 = MEMORY[0x24BEE4AF8];
    do
    {
      v6 = sub_24772AB7C(v4, (uint64_t)&v47);
      if (v50)
      {
        if (v50 == 1)
        {
          OUTLINED_FUNCTION_11_19(v6, v7, v8, v9, v10, v11, v12, v13, v26, __src, v32, v33, v34, v35, v36, v37, v38, v39, v40,
            v41,
            v42,
            v43,
            v44,
            v45,
            v46,
            v47);
          sub_24772CAFC();
          *(_QWORD *)__srca = *(_QWORD *)(v5 + 16) + 1;
          v32 = 0;
          LOBYTE(v33) = 0;
          sub_2476B3F38((uint64_t)&v42, (uint64_t)&v34);
          LOBYTE(v41) = 0;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_1_24();
            v5 = v20;
          }
          v14 = *(_QWORD *)(v5 + 16);
          if (v14 >= *(_QWORD *)(v5 + 24) >> 1)
          {
            OUTLINED_FUNCTION_1_24();
            v5 = v21;
          }
          *(_QWORD *)(v5 + 16) = v14 + 1;
          OUTLINED_FUNCTION_9_18(v5 + 88 * v14, v27, __srca[0]);
        }
        else
        {
          v15 = v48;
          v16 = v49;
          OUTLINED_FUNCTION_11_19(v6, v7, v8, v9, v10, v11, v12, v13, v26, __src, v32, v33, v34, v35, v36, v37, v38, v39, v40,
            v41,
            v42,
            v43,
            v44,
            v45,
            v46,
            v47);
          sub_24772CAFC();
          sub_24772CAFC();
          swift_bridgeObjectRelease();
          *(_QWORD *)__srcb = *(_QWORD *)(v5 + 16) + 1;
          v32 = 0;
          LOBYTE(v33) = 0;
          v17 = v45;
          v18 = __swift_project_boxed_opaque_existential_1(&v42, v45);
          sub_247728C24((uint64_t)v18, v17, &v34);
          v39 = v15;
          v40 = v16;
          LOBYTE(v41) = 1;
          swift_retain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2476C5BE0();
            v5 = v22;
          }
          v19 = *(_QWORD *)(v5 + 16);
          if (v19 >= *(_QWORD *)(v5 + 24) >> 1)
          {
            OUTLINED_FUNCTION_1_24();
            v5 = v23;
          }
          *(_QWORD *)(v5 + 16) = v19 + 1;
          OUTLINED_FUNCTION_9_18(v5 + 88 * v19, v28, __srcb[0]);
          swift_release();
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v42);
      }
      else
      {
        sub_24772CAFC();
        swift_bridgeObjectRelease();
      }
      v4 += 80;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    v24 = v51;
    v2 = v52;
  }
  else
  {
    v24 = 0;
    v5 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v1[1] = v24;
  v1[2] = v2;
  if (!*(_QWORD *)(v5 + 16))
    return swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v1[3] = v5;
  return result;
}

void SQL.Interpolation.appendInterpolation(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[9];
  char v8;

  v4 = *a1;
  if ((a1[4] & 1) != 0)
  {
    sub_24772C91C();
    sub_2476C9CD4();
  }
  else
  {
    v5 = a1[1];
    v7[0] = v4;
    v7[1] = v5;
    v8 = 0;
    sub_24772C91C();
    sub_2476D5674();
    OUTLINED_FUNCTION_2_26();
    v6 = *v2;
    *(_QWORD *)(v6 + 16) = v1 + 1;
    sub_2476E18A8(v7, (void *)(v6 + 80 * v1 + 32));
    *v2 = v6;
    OUTLINED_FUNCTION_0_28();
  }
}

void sub_247728C24(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _s12ReferenceBoxCMa(0, v9, v10, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  sub_2476E5BD8((uint64_t)v8);
  a3[3] = v12;
  a3[4] = &off_2518DE068;
  *a3 = v13;
}

uint64_t sub_247728CC4()
{
  uint64_t *v0;
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
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  __int128 v36;
  char v37;
  _QWORD v38[2];

  v1 = *v0;
  v38[0] = 0;
  v38[1] = 0xE000000000000000;
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = v1 + 32;
    sub_24772C91C();
    do
    {
      v4 = sub_24772AB7C(v3, (uint64_t)&v36);
      if (v37)
      {
        if (v37 == 1)
        {
          OUTLINED_FUNCTION_14_18(v4, v5, v6, v7, v8, v9, v10, v11, v26, v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t)v35, v36);
          v12 = v34;
          v13 = (uint64_t)v35;
          __swift_project_boxed_opaque_existential_1(&v31, v34);
          (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v13 + 16))(&v29, v12, v13);
          OUTLINED_FUNCTION_6_3();
          OUTLINED_FUNCTION_5_19();
          swift_endAccess();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          v14 = swift_release();
          OUTLINED_FUNCTION_14_18(v14, v15, v16, v17, v18, v19, v20, v21, v26, v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t)v35, v36);
          v22 = v34;
          v23 = v35;
          v24 = __swift_project_boxed_opaque_existential_1(&v31, v34);
          sub_247728E18((uint64_t)v24, (uint64_t)v38, v22, v23);
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);
      }
      else
      {
        OUTLINED_FUNCTION_6_3();
        OUTLINED_FUNCTION_5_19();
        swift_endAccess();
        swift_bridgeObjectRelease();
      }
      v3 += 80;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_6_3();
  return v38[0];
}

uint64_t sub_247728E18(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  char *v10;
  uint64_t TupleTypeMetadata2;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  void (*v27)(_QWORD *__return_ptr, _QWORD *, char *, uint64_t, _QWORD *);
  uint64_t *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD v35[2];
  uint64_t v36;
  _QWORD *v37;
  char **v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  _QWORD v52[3];
  uint64_t v53;
  _QWORD v54[3];
  uint64_t v55;
  uint64_t v56;

  v4 = a4;
  v7 = *(_QWORD *)(a4[1] + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v44 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)v35 - v9;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v46 = sub_24772D018();
  v43 = *(_QWORD *)(v46 - 8);
  v12 = MEMORY[0x24BDAC7A8](v46);
  v45 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char **)((char *)v35 - v14);
  v42 = (void (*)(char *, char *, uint64_t))sub_24772D384();
  MEMORY[0x24BDAC7A8](v42);
  v41 = (char *)v35 - v16;
  v48 = sub_24772D378();
  v36 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v47 = (char *)v35 - v17;
  swift_beginAccess();
  sub_24772CAFC();
  swift_endAccess();
  v18 = ((uint64_t (*)(uint64_t, _QWORD *))v4[2])(a3, v4);
  v19 = *(char **)(v18 + 16);
  v40 = AssociatedTypeWitness;
  v39 = TupleTypeMetadata2;
  v38 = v15;
  v50 = v18;
  v51 = v19;
  if (v19)
  {
    v35[0] = v7;
    v35[1] = a1;
    v37 = v4;
    v20 = sub_24772C91C();
    v21 = 0;
    v49 = v19 - 1;
    v22 = v20 + 40;
    do
    {
      v23 = v21 + 1;
      v54[0] = 0x6E6D756C6F63;
      v54[1] = 0xE600000000000000;
      v52[0] = v21 + 1;
      sub_24772C91C();
      sub_24772D480();
      sub_24772CAFC();
      swift_bridgeObjectRelease();
      sub_24772CAFC();
      sub_24772CAFC();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_24772CAFC();
      swift_endAccess();
      swift_bridgeObjectRelease();
      if (v49 != v21)
      {
        swift_beginAccess();
        sub_24772CAFC();
        swift_endAccess();
      }
      v22 += 24;
      ++v21;
    }
    while (v51 != v23);
    swift_bridgeObjectRelease();
    v4 = v37;
    AssociatedTypeWitness = v40;
    TupleTypeMetadata2 = v39;
    v15 = v38;
  }
  swift_beginAccess();
  sub_24772CAFC();
  swift_endAccess();
  sub_24772CBD4();
  sub_24772D360();
  v24 = v45;
  sub_24772D36C();
  v43 = *(_QWORD *)(v43 + 32);
  ((void (*)(char **, char *, uint64_t))v43)(v15, v24, v46);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, TupleTypeMetadata2) != 1)
  {
    v42 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
    v41 = v51 - 1;
    v37 = (_QWORD *)(v50 + 40);
    do
    {
      v25 = *v15;
      v42(v10, (char *)v15 + *(int *)(TupleTypeMetadata2 + 48), AssociatedTypeWitness);
      swift_beginAccess();
      sub_24772CAFC();
      swift_endAccess();
      v26 = v51;
      if (v51)
      {
        v49 = v25;
        v27 = (void (*)(_QWORD *__return_ptr, _QWORD *, char *, uint64_t, _QWORD *))v4[4];
        sub_24772C91C();
        v28 = v37;
        v29 = v26;
        do
        {
          v30 = *v28;
          v52[0] = *(v28 - 1);
          v52[1] = v30;
          sub_24772C91C();
          v27(v54, v52, v10, a3, v4);
          swift_bridgeObjectRelease();
          v32 = v55;
          v31 = v56;
          __swift_project_boxed_opaque_existential_1(v54, v55);
          (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)(v31 + 8) + 8))(&v53, v32);
          swift_beginAccess();
          sub_24772CAFC();
          swift_endAccess();
          swift_bridgeObjectRelease();
          if (v29 != (char *)1)
          {
            swift_beginAccess();
            sub_24772CAFC();
            swift_endAccess();
          }
          v28 += 3;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
          --v29;
        }
        while (v29);
        swift_bridgeObjectRelease();
        AssociatedTypeWitness = v40;
        TupleTypeMetadata2 = v39;
        v15 = v38;
        v25 = v49;
      }
      swift_beginAccess();
      sub_24772CAFC();
      swift_endAccess();
      if (v25 != v41)
      {
        swift_beginAccess();
        sub_24772CAFC();
        swift_endAccess();
      }
      (*(void (**)(char *, uint64_t))(v44 + 8))(v10, AssociatedTypeWitness);
      v33 = v45;
      sub_24772D36C();
      ((void (*)(char **, char *, uint64_t))v43)(v15, v33, v46);
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, TupleTypeMetadata2) != 1);
  }
  (*(void (**)(char *, uint64_t))(v36 + 8))(v47, v48);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_24772CAFC();
  return swift_endAccess();
}

void sub_247729524(Swift::String *a1)
{
  SQL.Interpolation.appendLiteral(_:)(*a1);
}

uint64_t SQL.debugSQL.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = sub_24772C358();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)v0;
  v5 = *(_QWORD *)(v0 + 8);
  if ((*(_BYTE *)(v0 + 32) & 1) != 0)
  {
    v8 = *(_QWORD *)(v0 + 16);
    v7 = *(_QWORD *)(v0 + 24);
    v12 = *(_QWORD *)v0;
    v13 = v5;
    v14 = v8;
    v15 = v7;
    v6 = sub_247728CC4();
    v5 = v9;
  }
  else
  {
    sub_24772C91C();
  }
  v12 = v6;
  v13 = v5;
  sub_24772C34C();
  sub_2476B5B30();
  v10 = sub_24772D078();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24772961C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return SQL.init(stringLiteral:)(*a1, a1[1], a2);
}

void Array<A>.joined(by:)(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  _BYTE *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  char v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;

  v7 = *(_QWORD *)(a2 + 16);
  if (v7)
  {
    v33 = a1[1];
    v34 = *a1;
    v32 = *((_BYTE *)a1 + 32);
    sub_24772C91C();
    OUTLINED_FUNCTION_8_21();
    v9 = (_BYTE *)(a2 + 64);
    v10 = 0xE000000000000000;
    do
    {
      v35 = v10;
      v36 = v7;
      v11 = *((_QWORD *)v9 - 4);
      v12 = *((_QWORD *)v9 - 3);
      v14 = *((_QWORD *)v9 - 2);
      v13 = *((_QWORD *)v9 - 1);
      v15 = *v9;
      v40 = v4;
      v41 = v10;
      v42 = v5;
      v43 = v3;
      v44 = v6 & 1;
      *(_QWORD *)&v37 = v11;
      *((_QWORD *)&v37 + 1) = v12;
      *(_QWORD *)&v38 = v14;
      *((_QWORD *)&v38 + 1) = v13;
      v39 = v15;
      OUTLINED_FUNCTION_15_17();
      sub_2476B3E14(v16, v17, v18, v19, v20);
      static SQL.+ infix(_:_:)((uint64_t)&v40, (uint64_t)&v37, (uint64_t)&v45);
      OUTLINED_FUNCTION_7_25(v4, v35);
      OUTLINED_FUNCTION_15_17();
      sub_2476B3EAC(v21, v22, v23, v24, v25);
      v4 = v45;
      v10 = v46;
      v5 = v47;
      v3 = v48;
      v6 = v49;
      if (v36 != 1)
      {
        v40 = v45;
        v41 = v46;
        v42 = v47;
        v43 = v48;
        v44 = v49;
        v37 = v34;
        v38 = v33;
        v39 = v32;
        v26 = v45;
        v27 = v46;
        static SQL.+ infix(_:_:)((uint64_t)&v40, (uint64_t)&v37, (uint64_t)&v45);
        OUTLINED_FUNCTION_7_25(v26, v27);
        v4 = v45;
        v10 = v46;
        v5 = v47;
        v3 = v48;
        v6 = v49;
      }
      v9 += 40;
      v7 = v36 - 1;
    }
    while (v36 != 1);
    v28 = v10;
    swift_bridgeObjectRelease();
    v29 = v28;
    v30 = a3;
  }
  else
  {
    OUTLINED_FUNCTION_8_21();
    v29 = 0xE000000000000000;
  }
  *(_QWORD *)v30 = v4;
  *(_QWORD *)(v30 + 8) = v29;
  *(_QWORD *)(v30 + 16) = v5;
  *(_QWORD *)(v30 + 24) = v3;
  *(_BYTE *)(v30 + 32) = v6;
}

double static SQL.+= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;
  char v10;
  double result;
  __int128 v12;
  _OWORD v13[2];
  char v14;
  _QWORD v15[4];
  char v16;
  _OWORD v17[2];
  char v18;

  v3 = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  v15[0] = *(_QWORD *)a1;
  v4 = v15[0];
  v15[1] = v5;
  v15[2] = v6;
  v15[3] = v7;
  v16 = v8;
  v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  v14 = v3;
  static SQL.+ infix(_:_:)((uint64_t)v15, (uint64_t)v13, (uint64_t)v17);
  sub_2476B3EAC(v4, v5, v6, v7, v8);
  v10 = v18;
  result = *(double *)v17;
  v12 = v17[1];
  *(_OWORD *)a1 = v17[0];
  *(_OWORD *)(a1 + 16) = v12;
  *(_BYTE *)(a1 + 32) = v10;
  return result;
}

uint64_t static SQL.+ infix(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 32) & 1) == 0)
    {
      v10 = *(_QWORD *)(a2 + 16);
      sub_247729D28();
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24772E730;
      *(_QWORD *)(inited + 32) = v5;
      *(_QWORD *)(inited + 40) = v6;
      *(_BYTE *)(inited + 104) = 0;
      v17 = v4;
      OUTLINED_FUNCTION_10_18(v5, v6, v10);
      OUTLINED_FUNCTION_11_2();
      goto LABEL_8;
    }
    v17 = *(_QWORD *)a1;
    OUTLINED_FUNCTION_11_2();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 8);
    if ((*(_BYTE *)(a2 + 32) & 1) == 0)
    {
      sub_24772C91C();
      result = sub_24772CAFC();
      v16 = 0;
      v15 = 0;
      v13 = v4;
      v14 = v7;
      goto LABEL_10;
    }
    v8 = *(_QWORD *)(a1 + 16);
    sub_247729D28();
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_24772E730;
    *(_QWORD *)(v9 + 32) = v4;
    *(_QWORD *)(v9 + 40) = v7;
    *(_BYTE *)(v9 + 104) = 0;
    v17 = v9;
    OUTLINED_FUNCTION_10_18(v4, v7, v8);
  }
  sub_24772C91C();
LABEL_8:
  sub_2476C9CD4();
  v18 = MEMORY[0x24BEE4AF8];
  result = sub_247728928();
  v13 = v17;
  v14 = 0;
  v15 = 1;
  v16 = v18;
LABEL_10:
  *(_QWORD *)a3 = v13;
  *(_QWORD *)(a3 + 8) = v14;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = v16;
  *(_BYTE *)(a3 + 32) = v15;
  return result;
}

void *SQL.Interpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  void *result;
  uint64_t v10[9];
  char v11;

  v5 = v4;
  v10[3] = swift_getAssociatedTypeWitness();
  v10[4] = a4;
  __swift_allocate_boxed_opaque_existential_0(v10);
  sub_24772CC40();
  v11 = 1;
  sub_2476D5674();
  OUTLINED_FUNCTION_4_21();
  v8 = *v5;
  *(_QWORD *)(v8 + 16) = a3 + 1;
  result = sub_2476E18A8(v10, (void *)(v8 + 80 * a3 + 32));
  *v5 = v8;
  return result;
}

void SQL.Interpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11[9];
  char v12;

  v11[3] = a2;
  v11[4] = a3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(boxed_opaque_existential_0, a1, a2);
  v11[5] = sub_2476E5CCC();
  v11[6] = v8;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  *(_QWORD *)(v9 + 24) = a3;
  v11[7] = (uint64_t)&unk_2576B9B40;
  v11[8] = v9;
  v12 = 2;
  sub_2476D5674();
  OUTLINED_FUNCTION_2_26();
  v10 = *v3;
  *(_QWORD *)(v10 + 16) = a3 + 1;
  sub_2476E18A8(v11, (void *)(v10 + 80 * a3 + 32));
  *v3 = v10;
  OUTLINED_FUNCTION_0_28();
}

uint64_t sub_247729B10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[3] = a3;
  v4[4] = a4;
  v4[2] = a1;
  return swift_task_switch();
}

uint64_t sub_247729B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v5 = _s15CollectionTableVMa(0, v4[3], v4[4], a4);
  v6 = sub_2476E5CCC();
  v8 = v7;
  v4[5] = v7;
  v9 = (_QWORD *)swift_task_alloc();
  v4[6] = (uint64_t)v9;
  v10 = MEMORY[0x2495822A8](&unk_24772FB48, v5);
  *v9 = v4;
  v9[1] = sub_247729BE0;
  return SQLDatabase.registerFunction<A>(_:named:)(v5, v6, v8, v5, v10);
}

uint64_t sub_247729BE0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_247729C54()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_10(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_247729C80(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_0;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[80];
  uint64_t v12[5];

  v12[3] = a3;
  v12[4] = a4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(boxed_opaque_existential_0, a1, a3);
  sub_2476B3F38((uint64_t)v12, (uint64_t)v11);
  v11[72] = 1;
  sub_2476D5674();
  v8 = *(_QWORD *)(*a2 + 16);
  sub_2476D56F8(v8);
  v9 = *a2;
  *(_QWORD *)(v9 + 16) = v8 + 1;
  sub_2476E18A8(v11, (void *)(v9 + 80 * v8 + 32));
  *a2 = v9;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

void sub_247729D28()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576B8248)
  {
    v0 = sub_24772D48C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576B8248);
  }
}

uint64_t sub_247729D70()
{
  return swift_deallocObject();
}

uint64_t sub_247729D80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v7 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_2476BD38C;
  return sub_247729B10(a1, a2, v7, v6);
}

unint64_t sub_247729DEC()
{
  unint64_t result;

  result = qword_2576B9B48;
  if (!qword_2576B9B48)
  {
    result = MEMORY[0x2495822A8](&protocol conformance descriptor for LiteralSQL, &type metadata for LiteralSQL);
    atomic_store(result, (unint64_t *)&qword_2576B9B48);
  }
  return result;
}

unint64_t sub_247729E2C()
{
  unint64_t result;

  result = qword_2576B9B50;
  if (!qword_2576B9B50)
  {
    result = MEMORY[0x2495822A8](&protocol conformance descriptor for LiteralSQL, &type metadata for LiteralSQL);
    atomic_store(result, (unint64_t *)&qword_2576B9B50);
  }
  return result;
}

unint64_t sub_247729E6C()
{
  unint64_t result;

  result = qword_2576B9B58;
  if (!qword_2576B9B58)
  {
    result = MEMORY[0x2495822A8](&protocol conformance descriptor for SQL, &type metadata for SQL);
    atomic_store(result, (unint64_t *)&qword_2576B9B58);
  }
  return result;
}

unint64_t sub_247729EAC()
{
  unint64_t result;

  result = qword_2576B9B60;
  if (!qword_2576B9B60)
  {
    result = MEMORY[0x2495822A8](&protocol conformance descriptor for SQL, &type metadata for SQL);
    atomic_store(result, (unint64_t *)&qword_2576B9B60);
  }
  return result;
}

unint64_t sub_247729EEC()
{
  unint64_t result;

  result = qword_2576B9B68;
  if (!qword_2576B9B68)
  {
    result = MEMORY[0x2495822A8](&protocol conformance descriptor for SQL.Interpolation, &type metadata for SQL.Interpolation);
    atomic_store(result, (unint64_t *)&qword_2576B9B68);
  }
  return result;
}

unint64_t sub_247729F2C()
{
  unint64_t result;

  result = qword_2576B9B70;
  if (!qword_2576B9B70)
  {
    result = MEMORY[0x2495822A8](&protocol conformance descriptor for SQL, &type metadata for SQL);
    atomic_store(result, (unint64_t *)&qword_2576B9B70);
  }
  return result;
}

void type metadata accessor for LiteralSQL()
{
  OUTLINED_FUNCTION_92_0();
}

uint64_t destroy for SQL(uint64_t a1)
{
  return sub_2476B3EAC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for SQL(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_2476B3E14(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for SQL(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_2476B3E14(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  sub_2476B3EAC(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SQL(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 32) = v3;
  sub_2476B3EAC(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQL(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 1)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQL(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_24772A13C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_24772A144(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2 & 1;
  return result;
}

void type metadata accessor for SQL()
{
  OUTLINED_FUNCTION_92_0();
}

uint64_t destroy for SQL.Interpolation()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SQL.Interpolation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  sub_24772C91C();
  sub_24772C91C();
  sub_24772C91C();
  return a1;
}

_QWORD *assignWithCopy for SQL.Interpolation(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_24772C91C();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  sub_24772C91C();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  sub_24772C91C();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SQL.Interpolation(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQL.Interpolation(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQL.Interpolation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SQL.Interpolation()
{
  OUTLINED_FUNCTION_92_0();
}

uint64_t sub_24772A334(uint64_t a1)
{
  unsigned int v2;

  v2 = *(unsigned __int8 *)(a1 + 80);
  if (v2 >= 2)
    v2 = *(_DWORD *)a1 + 2;
  sub_2476C3810(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  if (v2 != 1)
    return __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  return swift_release();
}

uint64_t sub_24772A394(uint64_t a1, uint64_t *a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  __int128 v8;
  uint64_t v9;
  char v10;

  v4 = *((unsigned __int8 *)a2 + 80);
  if (v4 >= 2)
    v4 = *(_DWORD *)a2 + 2;
  v5 = *a2;
  v6 = a2[1];
  v7 = *((_BYTE *)a2 + 16);
  sub_24771A7E4(*a2, v6, v7);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v7;
  v8 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 48) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 24, (uint64_t)(a2 + 3));
  if (v4 == 1)
  {
    v9 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v9;
    swift_retain();
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  *(_BYTE *)(a1 + 80) = v10;
  return a1;
}

uint64_t sub_24772A458(uint64_t a1, uint64_t *a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  if ((uint64_t *)a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 80);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    sub_2476C3810(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
    __swift_destroy_boxed_opaque_existential_1(a1 + 24);
    if (v4 == 1)
      swift_release();
    v5 = *((unsigned __int8 *)a2 + 80);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    v6 = *a2;
    v7 = a2[1];
    v8 = *((_BYTE *)a2 + 16);
    sub_24771A7E4(*a2, v7, v8);
    *(_QWORD *)a1 = v6;
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = v8;
    v9 = a2[6];
    *(_QWORD *)(a1 + 48) = v9;
    *(_QWORD *)(a1 + 56) = a2[7];
    (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 24, (uint64_t)(a2 + 3));
    if (v5 == 1)
    {
      v10 = a2[9];
      *(_QWORD *)(a1 + 64) = a2[8];
      *(_QWORD *)(a1 + 72) = v10;
      *(_BYTE *)(a1 + 80) = 1;
      swift_retain();
    }
    else
    {
      *(_BYTE *)(a1 + 80) = 0;
    }
  }
  return a1;
}

void *__swift_memcpy81_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x51uLL);
}

uint64_t sub_24772A574(uint64_t a1, _OWORD *a2)
{
  unsigned int v4;
  unsigned int v5;
  char v6;
  __int128 v7;
  __int128 v8;

  if ((_OWORD *)a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 80);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    sub_2476C3810(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
    __swift_destroy_boxed_opaque_existential_1(a1 + 24);
    if (v4 == 1)
      swift_release();
    v5 = *((unsigned __int8 *)a2 + 80);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      memcpy((void *)a1, a2, 0x50uLL);
      v6 = 1;
    }
    else
    {
      v6 = 0;
      v7 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v7;
      v8 = a2[3];
      *(_OWORD *)(a1 + 32) = a2[2];
      *(_OWORD *)(a1 + 48) = v8;
    }
    *(_BYTE *)(a1 + 80) = v6;
  }
  return a1;
}

uint64_t sub_24772A634(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 81))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 >= 2)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t sub_24772A670(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 80) = 0;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_BYTE *)(result + 80) = -(char)a2;
  }
  return result;
}

uint64_t sub_24772A6C4(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 80);
  if (result >= 2)
    return (*(_DWORD *)a1 + 2);
  return result;
}

uint64_t sub_24772A6E0(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 80) = a2;
  return result;
}

void type metadata accessor for SQL.BindStrategy()
{
  OUTLINED_FUNCTION_92_0();
}

uint64_t destroy for SQL.Interpolation.Token(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 72);
  if (v1 >= 3)
    v1 = *(_DWORD *)a1 + 3;
  if (v1 == 2)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else if (v1 == 1)
  {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for SQL.Interpolation.Token(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(unsigned __int8 *)(a2 + 72);
  if (v4 >= 3)
    v4 = *(_DWORD *)a2 + 3;
  if (v4 == 2)
  {
    v6 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v6;
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    v7 = *(_QWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 64) = v7;
    *(_BYTE *)(a1 + 72) = 2;
    sub_24772C91C();
    swift_retain();
  }
  else if (v4 == 1)
  {
    v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
    *(_BYTE *)(a1 + 72) = 1;
  }
  else
  {
    v8 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 72) = 0;
    sub_24772C91C();
  }
  return a1;
}

uint64_t assignWithCopy for SQL.Interpolation.Token(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 72);
    if (v4 >= 3)
      v4 = *(_DWORD *)a1 + 3;
    if (v4 == 2)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
      swift_bridgeObjectRelease();
      swift_release();
    }
    else if (v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v5 = *(unsigned __int8 *)(a2 + 72);
    if (v5 >= 3)
      v5 = *(_DWORD *)a2 + 3;
    if (v5 == 2)
    {
      v7 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v7;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      v8 = *(_QWORD *)(a2 + 56);
      v9 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v8;
      *(_QWORD *)(a1 + 64) = v9;
      *(_BYTE *)(a1 + 72) = 2;
      sub_24772C91C();
      swift_retain();
    }
    else if (v5 == 1)
    {
      v6 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v6;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      *(_BYTE *)(a1 + 72) = 1;
    }
    else
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      *(_BYTE *)(a1 + 72) = 0;
      sub_24772C91C();
    }
  }
  return a1;
}

void *__swift_memcpy73_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x49uLL);
}

uint64_t assignWithTake for SQL.Interpolation.Token(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  char v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 72);
    if (v4 >= 3)
      v4 = *(_DWORD *)a1 + 3;
    if (v4 == 2)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
      swift_bridgeObjectRelease();
      swift_release();
    }
    else if (v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v5 = *(unsigned __int8 *)(a2 + 72);
    if (v5 >= 3)
      v5 = *(_DWORD *)a2 + 3;
    if (v5 == 2)
    {
      memcpy((void *)a1, (const void *)a2, 0x48uLL);
      v7 = 2;
    }
    else if (v5 == 1)
    {
      v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      v7 = 1;
    }
    else
    {
      v7 = 0;
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    *(_BYTE *)(a1 + 72) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SQL.Interpolation.Token(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 73))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 72);
  if (v3 >= 3)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SQL.Interpolation.Token(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 57) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 73) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 73) = 0;
    if (a2)
      *(_BYTE *)(result + 72) = -(char)a2;
  }
  return result;
}

uint64_t sub_24772AB24(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 72);
  if (result >= 3)
    return (*(_DWORD *)a1 + 3);
  return result;
}

uint64_t sub_24772AB40(uint64_t result, unsigned int a2)
{
  if (a2 > 2)
  {
    *(_QWORD *)(result + 64) = 0;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 72) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQL.Interpolation.Token()
{
  return &type metadata for SQL.Interpolation.Token;
}

uint64_t sub_24772AB7C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for SQL.Interpolation.Token(a2, a1);
  return a2;
}

void *sub_24772ABB0(void *__src, void *__dst)
{
  return memcpy(__dst, __src, 0x51uLL);
}

void OUTLINED_FUNCTION_1_24()
{
  sub_2476C5BE0();
}

uint64_t OUTLINED_FUNCTION_2_26()
{
  uint64_t v0;

  return sub_2476D56F8(*(_QWORD *)(*(_QWORD *)v0 + 16));
}

uint64_t OUTLINED_FUNCTION_4_21()
{
  uint64_t v0;

  return sub_2476D56F8(*(_QWORD *)(*(_QWORD *)v0 + 16));
}

uint64_t OUTLINED_FUNCTION_5_19()
{
  return sub_24772CAFC();
}

uint64_t OUTLINED_FUNCTION_7_25(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  return sub_2476B3EAC(a1, a2, v3, v2, v4);
}

void *OUTLINED_FUNCTION_9_18@<X0>(uint64_t a1@<X8>, uint64_t a2, char __src)
{
  return sub_24772ABB0(&__src, (void *)(a1 + 32));
}

uint64_t OUTLINED_FUNCTION_10_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2476B3E14(a1, a2, a3, v3, 0);
}

uint64_t OUTLINED_FUNCTION_11_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,__int128 a26)
{
  return sub_2476B3F20(&a26, (uint64_t)&a21);
}

uint64_t OUTLINED_FUNCTION_14_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 a19)
{
  return sub_2476B3F20(&a19, (uint64_t)&a14);
}

uint64_t sub_24772AC84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = sub_24772C328();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }
  return result;
}

uint64_t sub_24772ACB0()
{
  return sub_24772C304();
}

uint64_t static SQLCodable<>.encoder.getter(uint64_t a1, uint64_t a2)
{
  return sub_24772AD08(a1, a2, (void (*)(_QWORD))MEMORY[0x24BDCB410], MEMORY[0x24BDCB400]);
}

uint64_t static SQLCodable<>.decoder.getter(uint64_t a1, uint64_t a2)
{
  return sub_24772AD08(a1, a2, (void (*)(_QWORD))MEMORY[0x24BDCB268], MEMORY[0x24BDCB260]);
}

uint64_t sub_24772AD08(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t (*a4)(void))
{
  a3(0);
  swift_allocObject();
  return a4();
}

uint64_t SQLCodable<>.init(nativeValue:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a4 + 72))(&v7, a3, a4);
  sub_24772C304();
  sub_2476D5F88(a1, a2);
  return swift_release();
}

uint64_t SQLCodable<>.nativeValue.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  (*(void (**)(uint64_t *__return_ptr))(a2 + 64))(&v4);
  v2 = sub_24772C328();
  swift_release();
  return v2;
}

uint64_t dispatch thunk of TopLevelEncoder.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of TopLevelDecoder.decode<A>(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

_UNKNOWN **sub_24772AE90()
{
  return &protocol witness table for JSONDecoder;
}

_UNKNOWN **sub_24772AE9C()
{
  return &protocol witness table for JSONEncoder;
}

uint64_t dispatch thunk of static SQLCodable.encoder.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of static SQLCodable.decoder.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

void sub_24772AEBC()
{
  sub_24772B37C();
}

void sub_24772AEC8()
{
  OUTLINED_FUNCTION_79_0();
  OUTLINED_FUNCTION_5_20();
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

void sub_24772AEF4()
{
  OUTLINED_FUNCTION_79_0();
  OUTLINED_FUNCTION_5_20();
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

void sub_24772AF2C()
{
  OUTLINED_FUNCTION_79_0();
  OUTLINED_FUNCTION_5_20();
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

void sub_24772AF5C()
{
  OUTLINED_FUNCTION_79_0();
  OUTLINED_FUNCTION_5_20();
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

void sub_24772AF94()
{
  OUTLINED_FUNCTION_79_0();
  OUTLINED_FUNCTION_11_20();
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

void sub_24772AFBC()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_79_0();
  OUTLINED_FUNCTION_14_19(v0);
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

void sub_24772AFE4()
{
  sub_24772B314();
}

uint64_t sub_24772AFF0()
{
  sub_24772D600();
  sub_24772C91C();
  sub_24772CAC0();
  swift_bridgeObjectRelease();
  return sub_24772D624();
}

void sub_24772B04C()
{
  sub_24772D60C();
  OUTLINED_FUNCTION_35();
}

void sub_24772B070()
{
  sub_24772D60C();
  OUTLINED_FUNCTION_35();
}

void sub_24772B09C()
{
  sub_24772D60C();
  OUTLINED_FUNCTION_35();
}

uint64_t sub_24772B0C8()
{
  sub_24772C91C();
  sub_24772CAC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24772B110()
{
  OUTLINED_FUNCTION_9_19();
  return OUTLINED_FUNCTION_4_22();
}

uint64_t sub_24772B15C()
{
  OUTLINED_FUNCTION_9_19();
  return OUTLINED_FUNCTION_4_22();
}

void sub_24772B1AC(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_24772B1E8()
{
  OUTLINED_FUNCTION_9_19();
  return OUTLINED_FUNCTION_4_22();
}

void sub_24772B254()
{
  sub_24772D60C();
  OUTLINED_FUNCTION_35();
}

void sub_24772B274()
{
  sub_24772D618();
  OUTLINED_FUNCTION_35();
}

void sub_24772B294()
{
  OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_11_20();
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

void sub_24772B2C0()
{
  OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_5_20();
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

void sub_24772B2EC()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_14_19(v0);
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

void sub_24772B314()
{
  OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_9_19();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

void sub_24772B37C()
{
  OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_9_19();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

uint64_t sub_24772B3E0()
{
  sub_24772D600();
  sub_24772C91C();
  sub_24772CAC0();
  swift_bridgeObjectRelease();
  return sub_24772D624();
}

void sub_24772B438()
{
  OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_5_20();
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

void sub_24772B470()
{
  OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_5_20();
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

void sub_24772B4A8()
{
  OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_5_20();
  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_14_2();
}

SonicFoundation::SQLColumnName __swiftcall SQLColumnName.init(stringLiteral:)(SonicFoundation::SQLColumnName stringLiteral)
{
  SonicFoundation::SQLColumnName *v1;

  *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t sub_24772B4E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  unint64_t v12;

  v1 = v0;
  v2 = sub_24772C544();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SQLDatabase.Location(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24772BA04(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    v9 = sub_24772C4C0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    v11 = 0;
    v12 = 0xE000000000000000;
    sub_24772D144();
    swift_bridgeObjectRelease();
    v11 = 0x3A656C6966;
    v12 = 0xE500000000000000;
    sub_24772CAFC();
    swift_bridgeObjectRelease();
    sub_24772CAFC();
    return v11;
  }
  return v9;
}

uint64_t SQLDatabase.__allocating_init(location:options:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  char *v3;

  swift_allocObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_62_7(v1, (uint64_t)sub_24772B6AC);
  return SQLDatabase.init(location:options:)(v2, v3);
}

uint64_t sub_24772B6AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_3_26();
  if (!v1)
    v3 = v0;
  return OUTLINED_FUNCTION_32_0(v3, *(uint64_t (**)(void))(v2 + 8));
}

uint64_t static SQLDatabase.Location.memory()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;

  sub_24770A900(0, 15, 0xD000000000000040, 0x8000000247734C80);
  sub_2476C3718();
  sub_24770AD58();
  *a1 = sub_24772CB8C();
  a1[1] = v2;
  type metadata accessor for SQLDatabase.Location(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t SQLDatabase.location.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24772BA04(v1 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_location, a1);
}

uint64_t SQLDatabase.init(location:options:)(uint64_t a1, char *a2)
{
  uint64_t v2;
  _QWORD *v3;
  char v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _QWORD *v11;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;

  v3[2] = a1;
  v3[3] = v2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  v20 = a2[4];
  v21 = *a2;
  v18 = a2[6];
  v19 = a2[5];
  v16 = a2[8];
  v17 = a2[7];
  v14 = a2[10];
  v15 = a2[9];
  v13 = a2[11];
  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_connection) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_attachedLocations) = MEMORY[0x24BEE4AF8];
  v8 = OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_scalarFunctions;
  _s14ScalarFunctionCMa();
  *(_QWORD *)(v2 + v8) = OUTLINED_FUNCTION_10_19();
  v9 = OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_tableFunctions;
  _s13TableFunctionCMa();
  *(_QWORD *)(v2 + v9) = OUTLINED_FUNCTION_10_19();
  sub_24772BA04(a1, v2 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_location);
  v10 = (_BYTE *)(v2 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_options);
  *v10 = v21;
  v10[1] = v5;
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = v20;
  v10[5] = v19;
  v10[6] = v18;
  v10[7] = v17;
  v10[8] = v16;
  v10[9] = v15;
  v10[10] = v14;
  v10[11] = v13;
  _s10ConnectionCMa();
  swift_allocObject();
  swift_retain();
  v11 = (_QWORD *)swift_task_alloc();
  v3[4] = v11;
  *v11 = v3;
  v11[1] = sub_24772B944;
  return sub_2476F1770(v2);
}

uint64_t sub_24772B944(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v2;
  swift_task_dealloc();
  v6 = *(_QWORD *)(v4 + 16);
  v5 = *(_QWORD *)(v4 + 24);
  if (v1)
  {
    swift_release();
    sub_24772BA48(v6);
    return (*(uint64_t (**)(void))(v4 + 8))();
  }
  else
  {
    sub_24772BA48(*(_QWORD *)(v4 + 16));
    *(_QWORD *)(v5 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_connection) = a1;
    swift_release();
    return (*(uint64_t (**)(_QWORD))(v4 + 8))(*(_QWORD *)(v4 + 24));
  }
}

uint64_t type metadata accessor for SQLDatabase.Location(uint64_t a1)
{
  return sub_2476FF82C(a1, qword_2576B9BB8);
}

uint64_t sub_24772BA04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SQLDatabase.Location(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24772BA48(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SQLDatabase.Location(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SQLDatabase.attachedLocations.getter()
{
  swift_beginAccess();
  return sub_24772C91C();
}

uint64_t SQLDatabase.deinit()
{
  uint64_t v0;

  sub_24772BA48(v0 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_location);
  swift_release();
  OUTLINED_FUNCTION_12_14();
  OUTLINED_FUNCTION_12_14();
  OUTLINED_FUNCTION_12_14();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t SQLDatabase.__deallocating_deinit()
{
  SQLDatabase.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t SQLDatabase.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_24772BB50()
{
  return SQLDatabase.unownedExecutor.getter();
}

uint64_t SQLColumnName.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_24772C91C();
  return v1;
}

uint64_t SQLColumnName.rawValue.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

double (*SQLColumnName.rawValue.modify())(_QWORD)
{
  return nullsub_1;
}

uint64_t static SQLColumnName.ROWID.getter()
{
  return 0x4449574F52;
}

unint64_t sub_24772BBF0()
{
  unint64_t result;

  result = qword_2576B9B88;
  if (!qword_2576B9B88)
  {
    result = MEMORY[0x2495822A8](&protocol conformance descriptor for SQLColumnName, &type metadata for SQLColumnName);
    atomic_store(result, (unint64_t *)&qword_2576B9B88);
  }
  return result;
}

uint64_t sub_24772BC2C()
{
  return sub_24772AFF0();
}

uint64_t sub_24772BC34()
{
  return sub_24772B0C8();
}

uint64_t sub_24772BC3C()
{
  return sub_24772B3E0();
}

uint64_t sub_24772BC44@<X0>(Swift::String *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = SQLColumnName.init(stringLiteral:)(*a1).rawValue._countAndFlagsBits;
  *a2 = v4;
  a2[1] = v5;
  return result;
}

void sub_24772BC80(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = SQLColumnName.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_35();
}

unint64_t sub_24772BCA4()
{
  unint64_t result;

  result = qword_2576B9B90;
  if (!qword_2576B9B90)
  {
    result = MEMORY[0x2495822A8](&protocol conformance descriptor for SQLColumnName, &type metadata for SQLColumnName);
    atomic_store(result, (unint64_t *)&qword_2576B9B90);
  }
  return result;
}

uint64_t sub_24772BCE0(Swift::String *a1)
{
  return SQLColumnName.init(stringLiteral:)(*a1).rawValue._countAndFlagsBits;
}

uint64_t sub_24772BCEC(_QWORD *a1, _QWORD *a2)
{
  return sub_2476EA144(*a1, a1[1], *a2, a2[1]);
}

unint64_t sub_24772BD04()
{
  unint64_t result;

  result = qword_2576B9B98;
  if (!qword_2576B9B98)
  {
    result = MEMORY[0x2495822A8](&protocol conformance descriptor for SQLColumnName, &type metadata for SQLColumnName);
    atomic_store(result, (unint64_t *)&qword_2576B9B98);
  }
  return result;
}

uint64_t type metadata accessor for SQLDatabase(uint64_t a1)
{
  return sub_2476FF82C(a1, (uint64_t *)&unk_2576B9BA0);
}

uint64_t sub_24772BD54()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SQLDatabase.Location(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SQLDatabase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SQLDatabase.__allocating_init(location:options:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))(**(int **)(v0 + 136) + *(_QWORD *)(v0 + 136));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  v3 = OUTLINED_FUNCTION_62_7(v2, (uint64_t)sub_24772BE5C);
  return v5(v3);
}

uint64_t sub_24772BE5C()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_3_26();
  return OUTLINED_FUNCTION_32_0(v0, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t *initializeBufferWithCopyOfBuffer for SQLDatabase.Location(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_24772C544();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      sub_24772C91C();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SQLDatabase.Location(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_bridgeObjectRelease();
  v2 = sub_24772C544();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

_QWORD *initializeWithCopy for SQLDatabase.Location(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_24772C544();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    sub_24772C91C();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for SQLDatabase.Location(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_24772BA48((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = sub_24772C544();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      sub_24772C91C();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for SQLDatabase.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_24772C544();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for SQLDatabase.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_24772BA48((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_24772C544();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_24772C1FC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24772C20C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24772C544();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLColumnName()
{
  return &type metadata for SQLColumnName;
}

uint64_t OUTLINED_FUNCTION_3_26()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4_22()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_20()
{
  return sub_24772D60C();
}

uint64_t OUTLINED_FUNCTION_9_19()
{
  return sub_24772CAC0();
}

uint64_t OUTLINED_FUNCTION_10_19()
{
  return sub_24772C904();
}

uint64_t OUTLINED_FUNCTION_11_20()
{
  return sub_24772D618();
}

uint64_t OUTLINED_FUNCTION_12_14()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_14_19(uint64_t a1, ...)
{
  char v1;
  va_list va;

  va_start(va, a1);
  sub_24772B1AC((uint64_t)va, v1);
}

uint64_t sub_24772C304()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_24772C310()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_24772C31C()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_24772C328()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_24772C334()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_24772C340()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_24772C34C()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_24772C358()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_24772C364()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_24772C370()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_24772C37C()
{
  return MEMORY[0x24BDCB9C0]();
}

uint64_t sub_24772C388()
{
  return MEMORY[0x24BDCB9C8]();
}

uint64_t sub_24772C394()
{
  return MEMORY[0x24BDCB9D0]();
}

uint64_t sub_24772C3A0()
{
  return MEMORY[0x24BDCB9D8]();
}

uint64_t sub_24772C3AC()
{
  return MEMORY[0x24BDCB9E8]();
}

uint64_t sub_24772C3B8()
{
  return MEMORY[0x24BDCBAB0]();
}

uint64_t sub_24772C3C4()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_24772C3D0()
{
  return MEMORY[0x24BDCBB00]();
}

uint64_t sub_24772C3DC()
{
  return MEMORY[0x24BDCBB10]();
}

uint64_t sub_24772C3E8()
{
  return MEMORY[0x24BDCBB50]();
}

uint64_t sub_24772C3F4()
{
  return MEMORY[0x24BDCBB60]();
}

uint64_t sub_24772C400()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_24772C40C()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_24772C418()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_24772C424()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_24772C430()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_24772C43C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_24772C448()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_24772C454()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_24772C460()
{
  return MEMORY[0x24BDCC738]();
}

uint64_t sub_24772C46C()
{
  return MEMORY[0x24BDCC7B8]();
}

uint64_t sub_24772C478()
{
  return MEMORY[0x24BDCC7E8]();
}

uint64_t sub_24772C484()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_24772C490()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_24772C49C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_24772C4A8()
{
  return MEMORY[0x24BDCD748]();
}

uint64_t sub_24772C4B4()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_24772C4C0()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_24772C4CC()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_24772C4D8()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_24772C4E4()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_24772C4F0()
{
  return MEMORY[0x24BDCD8F0]();
}

uint64_t sub_24772C4FC()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_24772C508()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_24772C514()
{
  return MEMORY[0x24BDCDA28]();
}

uint64_t sub_24772C520()
{
  return MEMORY[0x24BDCDA90]();
}

uint64_t sub_24772C52C()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_24772C538()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_24772C544()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24772C550()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_24772C55C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_24772C568()
{
  return MEMORY[0x24BDCDC68]();
}

uint64_t sub_24772C574()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_24772C580()
{
  return MEMORY[0x24BDCDD00]();
}

uint64_t sub_24772C58C()
{
  return MEMORY[0x24BDCDD08]();
}

uint64_t sub_24772C598()
{
  return MEMORY[0x24BDCDD10]();
}

uint64_t sub_24772C5A4()
{
  return MEMORY[0x24BDCDD68]();
}

uint64_t sub_24772C5B0()
{
  return MEMORY[0x24BDCDE70]();
}

uint64_t sub_24772C5BC()
{
  return MEMORY[0x24BDCDE98]();
}

uint64_t sub_24772C5C8()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_24772C5D4()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_24772C5E0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24772C5EC()
{
  return MEMORY[0x24BDCEA10]();
}

uint64_t sub_24772C5F8()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_24772C604()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_24772C610()
{
  return MEMORY[0x24BE18B58]();
}

uint64_t sub_24772C61C()
{
  return MEMORY[0x24BE18B90]();
}

uint64_t sub_24772C628()
{
  return MEMORY[0x24BE18B98]();
}

uint64_t sub_24772C634()
{
  return MEMORY[0x24BE18BA0]();
}

uint64_t sub_24772C640()
{
  return MEMORY[0x24BE18BA8]();
}

uint64_t sub_24772C64C()
{
  return MEMORY[0x24BE18BB0]();
}

uint64_t sub_24772C658()
{
  return MEMORY[0x24BE18BB8]();
}

uint64_t sub_24772C664()
{
  return MEMORY[0x24BE18BC0]();
}

uint64_t sub_24772C670()
{
  return MEMORY[0x24BE18BC8]();
}

uint64_t sub_24772C67C()
{
  return MEMORY[0x24BE18BD0]();
}

uint64_t sub_24772C688()
{
  return MEMORY[0x24BE18BD8]();
}

uint64_t sub_24772C694()
{
  return MEMORY[0x24BE18BE0]();
}

uint64_t sub_24772C6A0()
{
  return MEMORY[0x24BE18C18]();
}

uint64_t sub_24772C6AC()
{
  return MEMORY[0x24BE18C20]();
}

uint64_t sub_24772C6B8()
{
  return MEMORY[0x24BE18C28]();
}

uint64_t sub_24772C6C4()
{
  return MEMORY[0x24BE18C30]();
}

uint64_t sub_24772C6D0()
{
  return MEMORY[0x24BE18C38]();
}

uint64_t sub_24772C6DC()
{
  return MEMORY[0x24BE18C58]();
}

uint64_t sub_24772C6E8()
{
  return MEMORY[0x24BE18C80]();
}

uint64_t sub_24772C6F4()
{
  return MEMORY[0x24BE18C88]();
}

uint64_t sub_24772C700()
{
  return MEMORY[0x24BE18CA0]();
}

uint64_t sub_24772C70C()
{
  return MEMORY[0x24BE18CA8]();
}

uint64_t sub_24772C718()
{
  return MEMORY[0x24BE18CB0]();
}

uint64_t sub_24772C724()
{
  return MEMORY[0x24BE18CC8]();
}

uint64_t sub_24772C730()
{
  return MEMORY[0x24BE18CD0]();
}

uint64_t sub_24772C73C()
{
  return MEMORY[0x24BE18CF8]();
}

uint64_t sub_24772C748()
{
  return MEMORY[0x24BE18D18]();
}

uint64_t sub_24772C754()
{
  return MEMORY[0x24BE18D28]();
}

uint64_t sub_24772C760()
{
  return MEMORY[0x24BE18D30]();
}

uint64_t sub_24772C76C()
{
  return MEMORY[0x24BE18D48]();
}

uint64_t sub_24772C778()
{
  return MEMORY[0x24BE18D58]();
}

uint64_t sub_24772C784()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24772C790()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24772C79C()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_24772C7A8()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_24772C7B4()
{
  return MEMORY[0x24BEE76E0]();
}

uint64_t sub_24772C7C0()
{
  return MEMORY[0x24BEE76C8]();
}

uint64_t sub_24772C7CC()
{
  return MEMORY[0x24BEE76D0]();
}

uint64_t sub_24772C7D8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_24772C7E4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_24772C7F0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24772C7FC()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_24772C808()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_24772C814()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_24772C820()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_24772C82C()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_24772C838()
{
  return MEMORY[0x24BE82AA0]();
}

uint64_t sub_24772C844()
{
  return MEMORY[0x24BE82AA8]();
}

uint64_t sub_24772C850()
{
  return MEMORY[0x24BE82AB0]();
}

uint64_t sub_24772C85C()
{
  return MEMORY[0x24BE82AC0]();
}

uint64_t sub_24772C868()
{
  return MEMORY[0x24BE82AC8]();
}

uint64_t sub_24772C874()
{
  return MEMORY[0x24BE82AD8]();
}

uint64_t sub_24772C880()
{
  return MEMORY[0x24BE82AE0]();
}

uint64_t sub_24772C88C()
{
  return MEMORY[0x24BE82AE8]();
}

uint64_t sub_24772C898()
{
  return MEMORY[0x24BE82AF8]();
}

uint64_t sub_24772C8A4()
{
  return MEMORY[0x24BE82B00]();
}

uint64_t sub_24772C8B0()
{
  return MEMORY[0x24BE82B28]();
}

uint64_t sub_24772C8BC()
{
  return MEMORY[0x24BE82B30]();
}

uint64_t sub_24772C8C8()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_24772C8D4()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_24772C8E0()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_24772C8EC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_24772C8F8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_24772C904()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_24772C910()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_24772C91C()
{
  return MEMORY[0x24BEE0328]();
}

uint64_t sub_24772C928()
{
  return MEMORY[0x24BEE03D0]();
}

uint64_t sub_24772C934()
{
  return MEMORY[0x24BEE0418]();
}

uint64_t sub_24772C940()
{
  return MEMORY[0x24BEE0420]();
}

uint64_t sub_24772C94C()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_24772C958()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_24772C964()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_24772C970()
{
  return MEMORY[0x24BEE0500]();
}

uint64_t sub_24772C97C()
{
  return MEMORY[0x24BEE05F8]();
}

uint64_t sub_24772C988()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_24772C994()
{
  return MEMORY[0x24BEE07B0]();
}

uint64_t sub_24772C9A0()
{
  return MEMORY[0x24BEE07C0]();
}

uint64_t sub_24772C9AC()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_24772C9B8()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_24772C9C4()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_24772C9D0()
{
  return MEMORY[0x24BEE0960]();
}

uint64_t sub_24772C9DC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24772C9E8()
{
  return MEMORY[0x24BDCF880]();
}

uint64_t sub_24772C9F4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24772CA00()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_24772CA0C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_24772CA18()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24772CA24()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_24772CA30()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_24772CA3C()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_24772CA48()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_24772CA54()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_24772CA60()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_24772CA6C()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_24772CA78()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_24772CA84()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_24772CA90()
{
  return MEMORY[0x24BEE0A60]();
}

uint64_t sub_24772CA9C()
{
  return MEMORY[0x24BEE0A70]();
}

uint64_t sub_24772CAA8()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_24772CAB4()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_24772CAC0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24772CACC()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_24772CAD8()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_24772CAE4()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_24772CAF0()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_24772CAFC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24772CB08()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_24772CB14()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24772CB20()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_24772CB2C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_24772CB38()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_24772CB44()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_24772CB50()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_24772CB5C()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_24772CB68()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_24772CB74()
{
  return MEMORY[0x24BEE0CE8]();
}

uint64_t sub_24772CB80()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_24772CB8C()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_24772CB98()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_24772CBA4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_24772CBB0()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_24772CBBC()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_24772CBC8()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_24772CBD4()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_24772CBE0()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_24772CBEC()
{
  return MEMORY[0x24BEE0E68]();
}

uint64_t sub_24772CBF8()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_24772CC04()
{
  return MEMORY[0x24BEE0E90]();
}

uint64_t sub_24772CC10()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_24772CC1C()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t sub_24772CC28()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t sub_24772CC34()
{
  return MEMORY[0x24BEE0EC8]();
}

uint64_t sub_24772CC40()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_24772CC4C()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_24772CC58()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_24772CC64()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_24772CC70()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t sub_24772CC7C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24772CC88()
{
  return MEMORY[0x24BEE1118]();
}

uint64_t sub_24772CC94()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_24772CCA0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24772CCAC()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_24772CCB8()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_24772CCC4()
{
  return MEMORY[0x24BEE1150]();
}

uint64_t sub_24772CCD0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_24772CCDC()
{
  return MEMORY[0x24BEE1170]();
}

uint64_t sub_24772CCE8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_24772CCF4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_24772CD00()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_24772CD0C()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_24772CD18()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_24772CD24()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_24772CD30()
{
  return MEMORY[0x24BEE1230]();
}

uint64_t sub_24772CD3C()
{
  return MEMORY[0x24BEE1240]();
}

uint64_t sub_24772CD48()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_24772CD54()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_24772CD60()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_24772CD6C()
{
  return MEMORY[0x24BEE6808]();
}

uint64_t sub_24772CD78()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_24772CD84()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_24772CD90()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_24772CD9C()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_24772CDA8()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_24772CDB4()
{
  return MEMORY[0x24BEE6908]();
}

uint64_t sub_24772CDC0()
{
  return MEMORY[0x24BEE6938]();
}

uint64_t sub_24772CDCC()
{
  return MEMORY[0x24BEE6950]();
}

uint64_t sub_24772CDD8()
{
  return MEMORY[0x24BEE6980]();
}

uint64_t sub_24772CDE4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_24772CDF0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_24772CDFC()
{
  return MEMORY[0x24BEE69E8]();
}

uint64_t sub_24772CE08()
{
  return MEMORY[0x24BEE6A18]();
}

uint64_t sub_24772CE14()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_24772CE20()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_24772CE2C()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t sub_24772CE38()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_24772CE44()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_24772CE50()
{
  return MEMORY[0x24BEE6A90]();
}

uint64_t sub_24772CE5C()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_24772CE68()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_24772CE74()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_24772CE80()
{
  return MEMORY[0x24BEE6B00]();
}

uint64_t sub_24772CE8C()
{
  return MEMORY[0x24BEE6B18]();
}

uint64_t sub_24772CE98()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_24772CEA4()
{
  return MEMORY[0x24BEE6B28]();
}

uint64_t sub_24772CEB0()
{
  return MEMORY[0x24BEE6B58]();
}

uint64_t sub_24772CEBC()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_24772CEC8()
{
  return MEMORY[0x24BEE6C40]();
}

uint64_t sub_24772CED4()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_24772CEE0()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_24772CEEC()
{
  return MEMORY[0x24BEE1478]();
}

uint64_t sub_24772CEF8()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t sub_24772CF04()
{
  return MEMORY[0x24BEE1808]();
}

uint64_t sub_24772CF10()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_24772CF1C()
{
  return MEMORY[0x24BEE7618]();
}

uint64_t sub_24772CF28()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_24772CF34()
{
  return MEMORY[0x24BEE18F8]();
}

uint64_t sub_24772CF40()
{
  return MEMORY[0x24BEE1900]();
}

uint64_t sub_24772CF4C()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_24772CF58()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_24772CF64()
{
  return MEMORY[0x24BEE1948]();
}

uint64_t sub_24772CF70()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_24772CF7C()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_24772CF88()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_24772CF94()
{
  return MEMORY[0x24BEE7640]();
}

uint64_t sub_24772CFA0()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_24772CFAC()
{
  return MEMORY[0x24BDCFF40]();
}

uint64_t sub_24772CFB8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24772CFC4()
{
  return MEMORY[0x24BEE5830]();
}

uint64_t sub_24772CFD0()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_24772CFDC()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_24772CFE8()
{
  return MEMORY[0x24BEE58D8]();
}

uint64_t sub_24772CFF4()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_24772D000()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_24772D00C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_24772D018()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24772D024()
{
  return MEMORY[0x24BEE1DB8]();
}

uint64_t sub_24772D030()
{
  return MEMORY[0x24BEE1DF0]();
}

uint64_t sub_24772D03C()
{
  return MEMORY[0x24BEE1E58]();
}

uint64_t sub_24772D048()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_24772D054()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_24772D060()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24772D06C()
{
  return MEMORY[0x24BEE1F68]();
}

uint64_t sub_24772D078()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_24772D084()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_24772D090()
{
  return MEMORY[0x24BDD0618]();
}

uint64_t sub_24772D09C()
{
  return MEMORY[0x24BDD0630]();
}

uint64_t sub_24772D0A8()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_24772D0B4()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_24772D0C0()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_24772D0CC()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_24772D0D8()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_24772D0E4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24772D0F0()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_24772D0FC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24772D108()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_24772D114()
{
  return MEMORY[0x24BEE2390]();
}

uint64_t sub_24772D120()
{
  return MEMORY[0x24BEE6D58]();
}

uint64_t sub_24772D12C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24772D138()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_24772D144()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24772D150()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24772D15C()
{
  return MEMORY[0x24BEE2588]();
}

uint64_t sub_24772D168()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_24772D174()
{
  return MEMORY[0x24BEE25F0]();
}

uint64_t sub_24772D180()
{
  return MEMORY[0x24BEE25F8]();
}

uint64_t sub_24772D18C()
{
  return MEMORY[0x24BEE2600]();
}

uint64_t sub_24772D198()
{
  return MEMORY[0x24BEE2610]();
}

uint64_t sub_24772D1A4()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_24772D1B0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24772D1BC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_24772D1C8()
{
  return MEMORY[0x24BEE2788]();
}

uint64_t sub_24772D1D4()
{
  return MEMORY[0x24BEE27B0]();
}

uint64_t sub_24772D1E0()
{
  return MEMORY[0x24BEE27E8]();
}

uint64_t sub_24772D1EC()
{
  return MEMORY[0x24BEE27F0]();
}

uint64_t sub_24772D1F8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24772D204()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_24772D210()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_24772D21C()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_24772D228()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_24772D234()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_24772D240()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_24772D24C()
{
  return MEMORY[0x24BEE2990]();
}

uint64_t sub_24772D258()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_24772D264()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_24772D270()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_24772D27C()
{
  return MEMORY[0x24BEE2A80]();
}

uint64_t sub_24772D288()
{
  return MEMORY[0x24BEE6D80]();
}

uint64_t sub_24772D294()
{
  return MEMORY[0x24BEE6D90]();
}

uint64_t sub_24772D2A0()
{
  return MEMORY[0x24BEE6DB8]();
}

uint64_t sub_24772D2AC()
{
  return MEMORY[0x24BEE6DC0]();
}

uint64_t sub_24772D2B8()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_24772D2C4()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_24772D2D0()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_24772D2DC()
{
  return MEMORY[0x24BEE2B20]();
}

uint64_t sub_24772D2E8()
{
  return MEMORY[0x24BEE2BA8]();
}

uint64_t sub_24772D2F4()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_24772D300()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_24772D30C()
{
  return MEMORY[0x24BEE6F00]();
}

uint64_t sub_24772D318()
{
  return MEMORY[0x24BEE2C00]();
}

uint64_t sub_24772D324()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_24772D330()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_24772D33C()
{
  return MEMORY[0x24BEE2E90]();
}

uint64_t sub_24772D348()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24772D354()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24772D360()
{
  return MEMORY[0x24BEE2F90]();
}

uint64_t sub_24772D36C()
{
  return MEMORY[0x24BEE2F98]();
}

uint64_t sub_24772D378()
{
  return MEMORY[0x24BEE2FA0]();
}

uint64_t sub_24772D384()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_24772D390()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24772D39C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24772D3A8()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_24772D3B4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24772D3C0()
{
  return MEMORY[0x24BEE3168]();
}

uint64_t sub_24772D3CC()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_24772D3D8()
{
  return MEMORY[0x24BEE3230]();
}

uint64_t sub_24772D3E4()
{
  return MEMORY[0x24BEE3238]();
}

uint64_t sub_24772D3F0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_24772D3FC()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_24772D408()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_24772D414()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_24772D420()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_24772D42C()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_24772D438()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_24772D444()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_24772D450()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_24772D45C()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_24772D468()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_24772D474()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_24772D480()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24772D48C()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_24772D498()
{
  return MEMORY[0x24BEE35C8]();
}

uint64_t sub_24772D4A4()
{
  return MEMORY[0x24BEE3610]();
}

uint64_t sub_24772D4B0()
{
  return MEMORY[0x24BEE3668]();
}

uint64_t sub_24772D4BC()
{
  return MEMORY[0x24BEE3730]();
}

uint64_t sub_24772D4C8()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_24772D4D4()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_24772D4E0()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_24772D4EC()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_24772D4F8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24772D504()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_24772D510()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_24772D51C()
{
  return MEMORY[0x24BEE3AC8]();
}

uint64_t sub_24772D528()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_24772D534()
{
  return MEMORY[0x24BEE3B68]();
}

uint64_t sub_24772D540()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_24772D54C()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_24772D558()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_24772D564()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_24772D570()
{
  return MEMORY[0x24BEE3E08]();
}

uint64_t sub_24772D57C()
{
  return MEMORY[0x24BEE3E18]();
}

uint64_t sub_24772D588()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24772D594()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_24772D5A0()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_24772D5AC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_24772D5B8()
{
  return MEMORY[0x24BEE3EF0]();
}

uint64_t sub_24772D5C4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24772D5D0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24772D5DC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24772D5E8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24772D5F4()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_24772D600()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24772D60C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24772D618()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_24772D624()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24772D630()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_24772D63C()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_24772D648()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_24772D654()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_24772D660()
{
  return MEMORY[0x24BEE45C8]();
}

uint64_t sub_24772D66C()
{
  return MEMORY[0x24BEE45F0]();
}

uint64_t sub_24772D678()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_24772D684()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24772D690()
{
  return MEMORY[0x24BEE4620]();
}

uint64_t sub_24772D69C()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_24772D6A8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_24772D6B4()
{
  return MEMORY[0x24BEE4828]();
}

uint64_t sub_24772D6C0()
{
  return MEMORY[0x24BEE4860]();
}

uint64_t sub_24772D6CC()
{
  return MEMORY[0x24BEE49E8]();
}

uint64_t sub_24772D6D8()
{
  return MEMORY[0x24BEE49F0]();
}

uint64_t sub_24772D6E4()
{
  return MEMORY[0x24BEE49F8]();
}

uint64_t sub_24772D6F0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24772D6FC()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_24772D708()
{
  return MEMORY[0x24BEE7160]();
}

uint64_t sub_24772D714()
{
  return MEMORY[0x24BEE7178]();
}

uint64_t sub_24772D720()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t sub_24772D72C()
{
  return MEMORY[0x24BEE4AA0]();
}

uint64_t MobileGestalt_copy_nVRAMDictionary_obj()
{
  return MEMORY[0x24BED8538]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x24BED8588]();
}

uint64_t MobileGestalt_get_isSimulator()
{
  return MEMORY[0x24BED8620]();
}

uint64_t MobileGestalt_get_isVirtualDevice()
{
  return MEMORY[0x24BED8630]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE4D0](a1, a2, a3, *(_QWORD *)&a4);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

int isprint(int _c)
{
  return MEMORY[0x24BDAE900](*(_QWORD *)&_c);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x24BDAF8A8](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF50](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDDF78](a1);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x24BEDDF80](a1, zName);
}

int sqlite3_bind_pointer(sqlite3_stmt *a1, int a2, void *a3, const char *a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF90](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_text64(sqlite3_stmt *a1, int a2, const char *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *), unsigned __int8 encoding)
{
  return MEMORY[0x24BEDDFA8](a1, *(_QWORD *)&a2, a3, a4, a5, encoding);
}

int sqlite3_bind_value(sqlite3_stmt *a1, int a2, const sqlite3_value *a3)
{
  return MEMORY[0x24BEDDFB0](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE008](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x24BEDE018](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x24BEDE060](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

sqlite3_value *__cdecl sqlite3_column_value(sqlite3_stmt *a1, int iCol)
{
  return (sqlite3_value *)MEMORY[0x24BEDE080](a1, *(_QWORD *)&iCol);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x24BEDE0B0](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_module_v2(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData, void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x24BEDE0B8](db, zName, p, pClientData, xDestroy);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return MEMORY[0x24BEDE0F0](a1, zSQL);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x24BEDE110](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x24BEDE120](pStmt);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE128](db);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x24BEDE130](a1, *(_QWORD *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x24BEDE148](a1);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x24BEDE180](a1);
}

void *__cdecl sqlite3_malloc64(sqlite3_uint64 a1)
{
  return (void *)MEMORY[0x24BEDE1A0](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v3(sqlite3 *db, const char *zSql, int nByte, unsigned int prepFlags, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D8](db, zSql, *(_QWORD *)&nByte, *(_QWORD *)&prepFlags, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

void sqlite3_result_blob64(sqlite3_context *a1, const void *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE1F0](a1, a2, a3, a4);
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
  MEMORY[0x24BEDE1F8](a1, a2);
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
  MEMORY[0x24BEDE200](a1, a2, *(_QWORD *)&a3);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
  MEMORY[0x24BEDE210](a1, *(_QWORD *)&a2);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
  MEMORY[0x24BEDE218](a1, a2);
}

void sqlite3_result_null(sqlite3_context *a1)
{
  MEMORY[0x24BEDE220](a1);
}

void sqlite3_result_pointer(sqlite3_context *a1, void *a2, const char *a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE228](a1, a2, a3, a4);
}

void sqlite3_result_text64(sqlite3_context *a1, const char *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *), unsigned __int8 encoding)
{
  MEMORY[0x24BEDE248](a1, a2, a3, a4, encoding);
}

void sqlite3_result_value(sqlite3_context *a1, sqlite3_value *a2)
{
  MEMORY[0x24BEDE250](a1, a2);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x24BEDE300](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x24BEDE308](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE310](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  double result;

  MEMORY[0x24BEDE320](a1);
  return result;
}

sqlite3_value *__cdecl sqlite3_value_dup(const sqlite3_value *a1)
{
  return (sqlite3_value *)MEMORY[0x24BEDE328](a1);
}

void sqlite3_value_free(sqlite3_value *a1)
{
  MEMORY[0x24BEDE330](a1);
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE338](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE340](a1);
}

void *__cdecl sqlite3_value_pointer(sqlite3_value *a1, const char *a2)
{
  return (void *)MEMORY[0x24BEDE348](a1, a2);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE358](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE368](a1);
}

char *__cdecl sqlite3_vmprintf(const char *a1, va_list a2)
{
  return (char *)MEMORY[0x24BEDE380](a1, a2);
}

int sqlite3_vtab_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x24BEDE388](a1, *(_QWORD *)&op);
}

int sqlite3_vtab_rhs_value(sqlite3_index_info *a1, int a2, sqlite3_value **ppVal)
{
  return MEMORY[0x24BEDE390](a1, *(_QWORD *)&a2, ppVal);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_allocateMetadataPack()
{
  return MEMORY[0x24BEE4B88]();
}

uint64_t swift_allocateWitnessTablePack()
{
  return MEMORY[0x24BEE4B90]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x24BEE4D20]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D30]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x24BEE4E80]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x24BDB0210](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

