BOOL sub_230AF1E08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_230AF1E20()
{
  sub_230B0372C();
  sub_230B03738();
  return sub_230B03744();
}

uint64_t sub_230AF1E68()
{
  return sub_230B03738();
}

uint64_t sub_230AF1E98()
{
  sub_230B0372C();
  sub_230B03738();
  return sub_230B03744();
}

_QWORD *sub_230AF1EDC@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result)
    v2 = 2;
  else
    v2 = 1;
  if (*result == 1)
    v3 = 0;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

void sub_230AF1EFC(_QWORD *a1@<X8>)
{
  _BYTE *v1;

  *a1 = (*v1 & 1) == 0;
}

uint64_t sub_230AF1F14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_230B03054();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t MetricTemplateView.init(dragRefresh:)@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
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
  uint64_t result;
  uint64_t v32;
  __int128 v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v34 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1320);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1328);
  v5 = *(_QWORD *)(v33 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_230B0303C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v33 - v13;
  v35 = sub_230B0324C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1330);
  sub_230B034EC();
  v15 = v37;
  *(_QWORD *)(a2 + 8) = v36;
  *(_QWORD *)(a2 + 16) = v15;
  v16 = (int *)type metadata accessor for MetricTemplateView(0);
  sub_230B03030();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  sub_230B034EC();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  v17 = v16[7];
  *(_QWORD *)(a2 + v17) = _s6People19MessagePersonStatusV0A2UIE14iconForeground05SwiftE05ColorVvg_0();
  v18 = v16[8];
  *(_QWORD *)(a2 + v18) = sub_230B03474();
  v19 = v16[9];
  sub_230AF22D8();
  sub_230B031BC();
  sub_230B02FF4();
  (*(void (**)(char *, _QWORD))(v5 + 8))(v7, v33);
  v20 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  v21 = sub_230B03678();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v4, 1, 1, v21);
  v22 = sub_230B0366C();

  sub_230AF9568((uint64_t)v4, &qword_255EA1320);
  v36 = v22;
  sub_230B03660();
  sub_230AF911C(&qword_255EA1340, (uint64_t (*)(uint64_t))MEMORY[0x24BDD01C8], MEMORY[0x24BDD01B0]);
  v23 = sub_230B03330();
  swift_release();
  *(_QWORD *)(a2 + v19) = v23;
  v24 = v16[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1348);
  v25 = swift_allocObject();
  v33 = xmmword_230B03B10;
  *(_OWORD *)(v25 + 16) = xmmword_230B03B10;
  *(_QWORD *)(v25 + 32) = sub_230B031A4();
  *(_QWORD *)(v25 + 40) = v26;
  *(_QWORD *)(v25 + 48) = sub_230B031B0();
  *(_QWORD *)(v25 + 56) = v27;
  *(_QWORD *)(a2 + v24) = v25;
  v28 = v16[11];
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = v33;
  *(_QWORD *)(v29 + 32) = sub_230B03228();
  *(_QWORD *)(v29 + 40) = v30;
  result = sub_230B03234();
  *(_QWORD *)(v29 + 48) = result;
  *(_QWORD *)(v29 + 56) = v32;
  *(_QWORD *)(a2 + v28) = v29;
  *(_BYTE *)a2 = v34;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348BEDA8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for MetricTemplateView(uint64_t a1)
{
  return sub_230AF9028(a1, (uint64_t *)&unk_255EA13E8);
}

unint64_t sub_230AF22D8()
{
  unint64_t result;

  result = qword_255EA1338;
  if (!qword_255EA1338)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255EA1338);
  }
  return result;
}

uint64_t sub_230AF2314()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void (*v20)(char *, uint64_t);
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  char *v28;
  void (*v29)(char *, uint64_t, uint64_t);
  char *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;

  v39 = sub_230B030C0();
  v34 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v1 = (char *)&v32 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1630);
  MEMORY[0x24BDAC7A8](v2);
  v37 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_230B0303C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v41 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - v8;
  v10 = sub_230B030CC();
  v11 = *(_QWORD *)(v10 - 8);
  v33 = v10;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v32 - v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16D0);
  v17 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v36 = *(_QWORD *)(v5 + 72);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_230B03B10;
  v38 = v18;
  v19 = v18 + v17;
  sub_230B030B4();
  sub_230B03030();
  v35 = v19;
  sub_230B03090();
  v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v9, v4);
  v21 = *(void (**)(char *, uint64_t))(v11 + 8);
  v21(v16, v10);
  v40 = v14;
  sub_230B030B4();
  sub_230B030B4();
  v22 = v34;
  v23 = v39;
  (*(void (**)(char *, _QWORD, uint64_t))(v34 + 104))(v1, *MEMORY[0x24BDCF220], v39);
  sub_230B03030();
  v24 = (uint64_t)v37;
  sub_230B030A8();
  v25 = v9;
  v26 = v20;
  v20(v25, v4);
  v27 = v33;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v1, v23);
  v21(v16, v27);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v24, 1, v4) == 1)
  {
    v28 = v41;
    sub_230B03030();
    sub_230AF9568(v24, &qword_255EA1630);
  }
  else
  {
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 32);
    v28 = v41;
    v29(v41, v24, v4);
  }
  v30 = v40;
  sub_230B03090();
  v26(v28, v4);
  v21(v30, v27);
  return v38;
}

uint64_t sub_230AF260C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
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
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  int v38;
  char *v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t result;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  char *v61;
  char v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD v66[2];
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;

  v73 = sub_230B030CC();
  v67 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v72 = (char *)v66 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for ActionPoint(0);
  v80 = *(_QWORD *)(v2 - 8);
  v81 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v71 = (uint64_t)v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v66 - v6;
  v8 = MEMORY[0x24BDAC7A8](v5);
  v79 = (char *)v66 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v85 = (uint64_t)v66 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1630);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_230B0303C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v78 = (char *)v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v84 = (char *)v66 - v18;
  v19 = type metadata accessor for MetricTemplateView(0);
  v20 = *(int *)(v19 + 40);
  v87 = v0;
  v21 = *(_QWORD *)(v0 + v20);
  v22 = *(_QWORD *)(v21 + 16);
  v23 = MEMORY[0x24BEE4AF8];
  v68 = v7;
  v74 = v22;
  if (v22)
  {
    v70 = *(int *)(v19 + 44);
    v69 = v21 + 32;
    v66[1] = v21;
    swift_bridgeObjectRetain_n();
    v24 = 0;
    v25 = MEMORY[0x24BEE4AF8];
    v82 = v15;
    v83 = MEMORY[0x24BEE4AD8] + 8;
    v77 = v13;
    while (1)
    {
      v26 = *(_QWORD *)(v87 + v70);
      v27 = *(_QWORD *)(v26 + 16);
      if (v27)
        break;
LABEL_4:
      if (++v24 == v74)
      {
        swift_bridgeObjectRelease_n();
        v55 = v67;
        v7 = v68;
        v23 = MEMORY[0x24BEE4AF8];
        goto LABEL_24;
      }
    }
    v86 = v25;
    v76 = v24;
    v28 = (uint64_t *)(v69 + 16 * v24);
    v29 = v28[1];
    v88 = *v28;
    swift_bridgeObjectRetain_n();
    v89 = v29;
    swift_bridgeObjectRetain();
    v75 = v26;
    v30 = v26 + 40;
    while (1)
    {
      swift_bridgeObjectRetain();
      v31 = sub_230B0321C();
      v33 = v32;
      v34 = *(_QWORD *)(v87 + 16);
      v90 = *(_QWORD *)(v87 + 8);
      v91 = v34;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1580);
      sub_230B034F8();
      v35 = v92;
      if (*(_QWORD *)(v92 + 16) && (v36 = sub_230AFDFC4(v31, v33), (v37 & 1) != 0))
      {
        sub_230AF9404(*(_QWORD *)(v35 + 56) + 32 * v36, (uint64_t)&v93);
      }
      else
      {
        v93 = 0u;
        v94 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v94 + 1))
      {
        v38 = swift_dynamicCast();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v13, v38 ^ 1u, 1, v14);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
        {
          v39 = v84;
          (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v84, v13, v14);
          v40 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
          v41 = v78;
          v40(v78, v39, v14);
          v42 = v14;
          v43 = v89;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v44 = (uint64_t)v79;
          sub_230B03048();
          v45 = v81;
          v46 = (_QWORD *)(v44 + *(int *)(v81 + 20));
          *v46 = v88;
          v46[1] = v43;
          v14 = v42;
          v40((char *)(v44 + *(int *)(v45 + 24)), v41, v42);
          v47 = sub_230B03594();
          v49 = v48;
          swift_bridgeObjectRelease();
          *(_QWORD *)&v93 = v47;
          *((_QWORD *)&v93 + 1) = v49;
          v90 = 0x656E696C656D6974;
          v91 = 0xE800000000000000;
          sub_230AF93A0();
          LOBYTE(v47) = sub_230B0369C();
          v50 = *(void (**)(char *, uint64_t))(v82 + 8);
          v50(v41, v42);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *(_BYTE *)(v44 + *(int *)(v45 + 28)) = (v47 & 1) == 0;
          sub_230AF94E0(v44, v85, type metadata accessor for ActionPoint);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
            v51 = v86;
          else
            v51 = sub_230AFD23C(0, *(_QWORD *)(v86 + 16) + 1, 1, v86);
          v53 = *(_QWORD *)(v51 + 16);
          v52 = *(_QWORD *)(v51 + 24);
          v15 = v82;
          v13 = v77;
          if (v53 >= v52 >> 1)
            v51 = sub_230AFD23C(v52 > 1, v53 + 1, 1, v51);
          *(_QWORD *)(v51 + 16) = v53 + 1;
          v54 = (*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80);
          v86 = v51;
          sub_230AF94E0(v85, v51 + v54 + *(_QWORD *)(v80 + 72) * v53, type metadata accessor for ActionPoint);
          v50(v84, v14);
          goto LABEL_9;
        }
      }
      else
      {
        sub_230AF9568((uint64_t)&v93, &qword_255EA1638);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
      }
      sub_230AF9568((uint64_t)v13, &qword_255EA1630);
LABEL_9:
      v30 += 16;
      swift_bridgeObjectRelease();
      if (!--v27)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        v25 = v86;
        v24 = v76;
        goto LABEL_4;
      }
    }
  }
  v25 = MEMORY[0x24BEE4AF8];
  v55 = v67;
LABEL_24:
  *(_QWORD *)&v93 = v23;
  v56 = *(_QWORD *)(v25 + 16);
  result = swift_bridgeObjectRetain();
  if (v56)
  {
    v58 = 0;
    while (v58 < *(_QWORD *)(result + 16))
    {
      v59 = (*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80);
      v60 = *(_QWORD *)(v80 + 72);
      sub_230AF949C(result + v59 + v60 * v58, (uint64_t)v7, type metadata accessor for ActionPoint);
      v61 = v72;
      sub_230B030B4();
      v62 = sub_230B0309C();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v61, v73);
      if ((v62 & 1) != 0)
      {
        sub_230AF94E0((uint64_t)v7, v71, type metadata accessor for ActionPoint);
        v63 = v93;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_230AFDBDC(0, *(_QWORD *)(v63 + 16) + 1, 1);
          v63 = v93;
        }
        v65 = *(_QWORD *)(v63 + 16);
        v64 = *(_QWORD *)(v63 + 24);
        if (v65 >= v64 >> 1)
        {
          sub_230AFDBDC(v64 > 1, v65 + 1, 1);
          v63 = v93;
        }
        *(_QWORD *)(v63 + 16) = v65 + 1;
        sub_230AF94E0(v71, v63 + v59 + v65 * v60, type metadata accessor for ActionPoint);
        v7 = v68;
      }
      else
      {
        sub_230AF95E4((uint64_t)v7, type metadata accessor for ActionPoint);
      }
      ++v58;
      result = v25;
      if (v56 == v58)
        goto LABEL_35;
    }
    __break(1u);
  }
  else
  {
LABEL_35:
    swift_bridgeObjectRelease_n();
    result = v93;
    if (!*(_QWORD *)(v93 + 16))
    {
      swift_release();
      return 0;
    }
  }
  return result;
}

uint64_t sub_230AF2D8C()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  int v30;
  int v31;
  uint64_t v32;
  int64_t v33;
  unint64_t v34;
  unint64_t v35;
  void (*v36)(char *, unint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  _QWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;

  v1 = v0;
  v59 = sub_230B030CC();
  v71 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v70 = (char *)v58 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = sub_230B0303C();
  v77 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v74 = (char *)v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SignalPoint(0);
  v78 = *(_QWORD *)(v4 - 8);
  v79 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v69 = (uint64_t)v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v68 = (uint64_t)v58 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v58 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16C8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_230B03264();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BEE4AF8];
  v85 = MEMORY[0x24BEE4AF8];
  v20 = MEMORY[0x2348BE5EC](v16);
  v72 = *(_QWORD *)(v20 + 16);
  if (v72)
  {
    v67 = v20 + 32;
    v58[1] = v20;
    swift_bridgeObjectRetain();
    v21 = 0;
    v66 = MEMORY[0x24BEE4AD8] + 8;
    v64 = v18;
    v62 = v1;
    v61 = v13;
    v60 = v14;
    v63 = v15;
    while (1)
    {
      v73 = v21;
      v23 = (uint64_t *)(v67 + 16 * v21);
      v25 = *v23;
      v24 = v23[1];
      v26 = *(_QWORD *)(v1 + 16);
      v80 = *(_QWORD *)(v1 + 8);
      v81 = v26;
      swift_bridgeObjectRetain_n();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1580);
      sub_230B034F8();
      v27 = v82;
      if (*(_QWORD *)(v82 + 16) && (v28 = sub_230AFDFC4(v25, v24), (v29 & 1) != 0))
      {
        sub_230AF9404(*(_QWORD *)(v27 + 56) + 32 * v28, (uint64_t)&v83);
      }
      else
      {
        v83 = 0u;
        v84 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v84 + 1))
      {
        v30 = swift_dynamicCast();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v13, v30 ^ 1u, 1, v14);
        v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14);
        v22 = v73;
        if (v31 != 1)
        {
          (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v13, v14);
          v32 = sub_230B03258();
          v33 = *(_QWORD *)(v32 + 16);
          if (v33)
          {
            *(_QWORD *)&v83 = v19;
            sub_230AFDC08(0, v33, 0);
            v34 = (*(unsigned __int8 *)(v77 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
            v65 = v32;
            v35 = v32 + v34;
            v76 = *(_QWORD *)(v77 + 72);
            v36 = *(void (**)(char *, unint64_t, uint64_t))(v77 + 16);
            v37 = v25;
            do
            {
              v39 = v74;
              v38 = v75;
              v36(v74, v35, v75);
              v40 = v79;
              v36(&v10[*(int *)(v79 + 24)], (unint64_t)v39, v38);
              swift_bridgeObjectRetain();
              sub_230B03048();
              v41 = (uint64_t *)&v10[*(int *)(v40 + 20)];
              *v41 = v25;
              v41[1] = v24;
              (*(void (**)(char *, uint64_t))(v77 + 8))(v39, v38);
              v42 = v83;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_230AFDC08(0, *(_QWORD *)(v42 + 16) + 1, 1);
                v42 = v83;
              }
              v44 = *(_QWORD *)(v42 + 16);
              v43 = *(_QWORD *)(v42 + 24);
              if (v44 >= v43 >> 1)
              {
                sub_230AFDC08(v43 > 1, v44 + 1, 1);
                v42 = v83;
              }
              *(_QWORD *)(v42 + 16) = v44 + 1;
              sub_230AF94E0((uint64_t)v10, v42+ ((*(unsigned __int8 *)(v78 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80))+ *(_QWORD *)(v78 + 72) * v44, type metadata accessor for SignalPoint);
              v35 += v76;
              --v33;
              v25 = v37;
            }
            while (v33);
            swift_bridgeObjectRelease();
            v1 = v62;
            v19 = MEMORY[0x24BEE4AF8];
            v13 = v61;
            v14 = v60;
          }
          else
          {
            swift_bridgeObjectRelease();
            v42 = v19;
          }
          v15 = v63;
          sub_230AF345C(v42);
          v18 = v64;
          (*(void (**)(char *, uint64_t))(v15 + 8))(v64, v14);
          v22 = v73;
          goto LABEL_5;
        }
      }
      else
      {
        sub_230AF9568((uint64_t)&v83, &qword_255EA1638);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
        v22 = v73;
      }
      sub_230AF9568((uint64_t)v13, &qword_255EA16C8);
LABEL_5:
      v21 = v22 + 1;
      swift_bridgeObjectRelease();
      if (v21 == v72)
      {
        swift_bridgeObjectRelease_n();
        v45 = v85;
        goto LABEL_24;
      }
    }
  }
  swift_bridgeObjectRelease();
  v45 = MEMORY[0x24BEE4AF8];
LABEL_24:
  v46 = v59;
  *(_QWORD *)&v83 = v19;
  v47 = *(_QWORD *)(v45 + 16);
  result = swift_bridgeObjectRetain();
  if (v47)
  {
    v49 = 0;
    while (v49 < *(_QWORD *)(v45 + 16))
    {
      v50 = (*(unsigned __int8 *)(v78 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
      v51 = *(_QWORD *)(v78 + 72);
      v52 = v68;
      sub_230AF949C(v45 + v50 + v51 * v49, v68, type metadata accessor for SignalPoint);
      v53 = v70;
      sub_230B030B4();
      v54 = sub_230B0309C();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v53, v46);
      if ((v54 & 1) != 0)
      {
        sub_230AF94E0(v52, v69, type metadata accessor for SignalPoint);
        v55 = v83;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_230AFDC08(0, *(_QWORD *)(v55 + 16) + 1, 1);
          v55 = v83;
        }
        v57 = *(_QWORD *)(v55 + 16);
        v56 = *(_QWORD *)(v55 + 24);
        if (v57 >= v56 >> 1)
        {
          sub_230AFDC08(v56 > 1, v57 + 1, 1);
          v55 = v83;
        }
        *(_QWORD *)(v55 + 16) = v57 + 1;
        result = sub_230AF94E0(v69, v55 + v50 + v57 * v51, type metadata accessor for SignalPoint);
      }
      else
      {
        result = sub_230AF95E4(v52, type metadata accessor for SignalPoint);
      }
      if (v47 == ++v49)
      {
        v19 = v83;
        goto LABEL_36;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_36:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!*(_QWORD *)(v19 + 16))
    {
      swift_release();
      return 0;
    }
    return v19;
  }
  return result;
}

uint64_t sub_230AF345C(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_230AFD250(isUniquelyReferenced_nonNull_native, v24, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = type metadata accessor for SignalPoint(0);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_230B036F0();
  __break(1u);
  return result;
}

uint64_t sub_230AF35D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10[2];
  uint64_t v11;
  unint64_t v12;

  v11 = 0;
  v12 = 0xE000000000000000;
  v1 = MEMORY[0x2348BE5EC]();
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (uint64_t *)(v1 + 40);
    do
    {
      v4 = *v3;
      v10[0] = *(v3 - 1);
      v10[1] = v4;
      sub_230AF36C8(v10, v0, (uint64_t)&v11);
      v3 += 2;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    v6 = v11;
    v5 = v12;
  }
  else
  {
    swift_bridgeObjectRelease();
    v6 = 0;
    v5 = 0xE000000000000000;
  }
  v7 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0)
    v7 = v6 & 0xFFFFFFFFFFFFLL;
  if (v7)
  {
    swift_bridgeObjectRetain();
    v8 = sub_230B035AC();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0x2064657461647055;
  }
  return v8;
}

uint64_t sub_230AF36C8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  int v29;
  uint64_t result;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;

  v7 = sub_230B030CC();
  v63 = *(_QWORD *)(v7 - 8);
  v64 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v62 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1630);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_230B0303C();
  v53 = *(_QWORD *)(v58 - 8);
  v12 = MEMORY[0x24BDAC7A8](v58);
  v61 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v60 = (char *)&v47 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16C8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_230B03264();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v51 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *a1;
  v21 = a1[1];
  v23 = *(_QWORD *)(a2 + 16);
  v65 = *(_QWORD *)(a2 + 8);
  v66 = v23;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1580);
  sub_230B034F8();
  v24 = v69;
  v25 = *(_QWORD *)(v69 + 16);
  v52 = v21;
  if (v25 && (v26 = sub_230AFDFC4(v22, v21), (v27 & 1) != 0))
  {
    sub_230AF9404(*(_QWORD *)(v24 + 56) + 32 * v26, (uint64_t)&v67);
  }
  else
  {
    v67 = 0u;
    v68 = 0u;
  }
  v28 = v58;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v68 + 1))
  {
    sub_230AF9568((uint64_t)&v67, &qword_255EA1638);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
    return sub_230AF9568((uint64_t)v17, &qword_255EA16C8);
  }
  v29 = swift_dynamicCast();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v17, v29 ^ 1u, 1, v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
    return sub_230AF9568((uint64_t)v17, &qword_255EA16C8);
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v51, v17, v18);
  result = sub_230B03258();
  *(_QWORD *)&v67 = MEMORY[0x24BEE4AF8];
  v57 = *(_QWORD *)(result + 16);
  v50 = v3;
  v47 = a3;
  v49 = v18;
  v48 = v19;
  v59 = result;
  if (v57)
  {
    v31 = 0;
    v32 = (uint64_t)v11;
    v55 = v22;
    v56 = v11;
    v33 = v53;
    v34 = v60;
    while (v31 < *(_QWORD *)(result + 16))
    {
      v35 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
      v36 = *(_QWORD *)(v33 + 72);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v33 + 16))(v32, result + v35 + v36 * v31, v28);
      v54 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56);
      v54(v32, 0, 1, v28);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v32, 1, v28) == 1)
        goto LABEL_23;
      v37 = *(void (**)(char *, uint64_t, uint64_t))(v33 + 32);
      v37(v34, v32, v28);
      v38 = v33;
      v39 = v62;
      sub_230B030B4();
      v40 = v28;
      v41 = sub_230B0309C();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v39, v64);
      if ((v41 & 1) != 0)
      {
        v37(v61, (uint64_t)v34, v40);
        v42 = v67;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_230AFDC34(0, *(_QWORD *)(v42 + 16) + 1, 1);
          v42 = v67;
        }
        v44 = *(_QWORD *)(v42 + 16);
        v43 = *(_QWORD *)(v42 + 24);
        if (v44 >= v43 >> 1)
        {
          sub_230AFDC34(v43 > 1, v44 + 1, 1);
          v42 = v67;
        }
        *(_QWORD *)(v42 + 16) = v44 + 1;
        v28 = v58;
        v37((char *)(v42 + v35 + v44 * v36), (uint64_t)v61, v58);
        *(_QWORD *)&v67 = v42;
        v32 = (uint64_t)v56;
        v33 = v53;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v38 + 8))(v34, v40);
        v28 = v40;
        v33 = v38;
        v32 = (uint64_t)v56;
      }
      ++v31;
      v22 = v55;
      result = v59;
      if (v57 == v31)
      {
        v54(v32, 1, 1, v28);
        goto LABEL_23;
      }
    }
    __break(1u);
  }
  else
  {
    v32 = (uint64_t)v11;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56))(v11, 1, 1, v28);
LABEL_23:
    swift_bridgeObjectRelease();
    sub_230AF9568(v32, &qword_255EA1630);
    v45 = v67;
    if (*(_QWORD *)(v67 + 16))
    {
      *(_QWORD *)&v67 = v22;
      *((_QWORD *)&v67 + 1) = v52;
      swift_bridgeObjectRetain();
      sub_230B035D0();
      v46 = *(_QWORD *)(v45 + 16);
      swift_release();
      v65 = v46;
      sub_230B03708();
      sub_230B035D0();
      swift_bridgeObjectRelease();
      sub_230B035D0();
      sub_230B035D0();
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v51, v49);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v48 + 8))(v51, v49);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_230AF3C88(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1630);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_230B0303C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230AF9524(a1, (uint64_t)v4, &qword_255EA1630);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_230AF9568((uint64_t)v4, &qword_255EA1630);
    return 0x6E776F6E6B6E55;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
    objc_msgSend(v10, sel_setTimeStyle_, 2);
    objc_msgSend(v10, sel_setDateStyle_, 1);
    v11 = (void *)sub_230B03024();
    v12 = objc_msgSend(v10, sel_stringFromDate_, v11);

    v9 = sub_230B0357C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9;
}

uint64_t sub_230AF3E38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[3];
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1630);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_230B0321C();
  v6 = v5;
  v7 = *(_QWORD *)(v0 + 16);
  v16[1] = *(_QWORD *)(v0 + 8);
  v16[2] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1580);
  sub_230B034F8();
  v8 = v17;
  if (*(_QWORD *)(v17 + 16) && (v9 = sub_230AFDFC4(v4, v6), (v10 & 1) != 0))
  {
    sub_230AF9404(*(_QWORD *)(v8 + 56) + 32 * v9, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v19 + 1))
  {
    v11 = sub_230B0303C();
    v12 = swift_dynamicCast();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v3, v12 ^ 1u, 1, v11);
  }
  else
  {
    sub_230AF9568((uint64_t)&v18, &qword_255EA1638);
    v13 = sub_230B0303C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v3, 1, 1, v13);
  }
  v14 = sub_230AF3C88((uint64_t)v3);
  sub_230AF9568((uint64_t)v3, &qword_255EA1630);
  return v14;
}

unint64_t sub_230AF3FE8()
{
  sub_230B031A4();
  sub_230B03228();
  sub_230AF3E38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B031B0();
  sub_230B03228();
  sub_230AF3E38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B031A4();
  sub_230B03234();
  sub_230AF3E38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B031B0();
  sub_230B03234();
  sub_230AF3E38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B036A8();
  swift_bridgeObjectRelease();
  sub_230B035D0();
  swift_bridgeObjectRelease();
  sub_230B035D0();
  sub_230B036A8();
  swift_bridgeObjectRelease();
  sub_230B035D0();
  swift_bridgeObjectRelease();
  sub_230B035D0();
  swift_bridgeObjectRetain();
  sub_230B035D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_230B035D0();
  swift_bridgeObjectRelease();
  sub_230B036A8();
  swift_bridgeObjectRelease();
  sub_230B035D0();
  swift_bridgeObjectRelease();
  sub_230B035D0();
  swift_bridgeObjectRetain();
  sub_230B035D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B036A8();
  swift_bridgeObjectRelease();
  sub_230B035D0();
  swift_bridgeObjectRelease();
  sub_230B035D0();
  swift_bridgeObjectRetain();
  sub_230B035D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0xD000000000000017;
}

uint64_t sub_230AF4360(void (*a1)(void), void (*a2)(void))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  a1();
  a2();
  v4 = sub_230B0321C();
  v6 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)&v12 = *(_QWORD *)(v2 + 8);
  *((_QWORD *)&v12 + 1) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1580);
  sub_230B034F8();
  if (*(_QWORD *)(v11 + 16) && (v8 = sub_230AFDFC4(v4, v6), (v9 & 1) != 0))
  {
    sub_230AF9404(*(_QWORD *)(v11 + 56) + 32 * v8, (uint64_t)&v12);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v13 + 1))
  {
    if (swift_dynamicCast())
      return v11;
  }
  else
  {
    sub_230AF9568((uint64_t)&v12, &qword_255EA1638);
  }
  return 0;
}

uint64_t sub_230AF4488@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (**v18)(uint64_t);
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = a1;
  v2 = type metadata accessor for MetricTemplateView(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1588);
  v24 = *(_QWORD *)(v6 - 8);
  v25 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1368);
  MEMORY[0x24BDAC7A8](v27);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1590);
  sub_230AF95A4(&qword_255EA1598, &qword_255EA1590, MEMORY[0x24BDF5428]);
  sub_230B0339C();
  v11 = *(int *)(v2 + 36);
  v23 = v1;
  v12 = *(_QWORD *)(v1 + v11);
  sub_230AF949C(v1, (uint64_t)v5, type metadata accessor for MetricTemplateView);
  v13 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v14 = swift_allocObject();
  sub_230AF94E0((uint64_t)v5, v14 + v13, type metadata accessor for MetricTemplateView);
  v16 = v24;
  v15 = v25;
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v10, v8, v25);
  v17 = v27;
  *(_QWORD *)&v10[*(int *)(v27 + 52)] = v12;
  v18 = (uint64_t (**)(uint64_t))&v10[*(int *)(v17 + 56)];
  *v18 = sub_230AF9250;
  v18[1] = (uint64_t (*)(uint64_t))v14;
  v19 = *(void (**)(char *, uint64_t))(v16 + 8);
  swift_retain();
  v19(v8, v15);
  sub_230AF949C(v23, (uint64_t)v5, type metadata accessor for MetricTemplateView);
  v20 = swift_allocObject();
  sub_230AF94E0((uint64_t)v5, v20 + v13, type metadata accessor for MetricTemplateView);
  sub_230AF95A4(&qword_255EA1370, &qword_255EA1368, MEMORY[0x24BDEDA68]);
  sub_230B03420();
  swift_release();
  return sub_230AF9568((uint64_t)v10, &qword_255EA1368);
}

uint64_t sub_230AF4708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  char *v35;
  void (*v36)(uint64_t, char *, uint64_t);
  uint64_t v37;
  int *v38;
  char *v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  void (*v43)(char *, uint64_t);
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  void (*v47)(char *, char *, uint64_t);
  void (*v48)(char *, char *, uint64_t);
  void (*v49)(char *, char *, uint64_t);
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v56 = a2;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA15B0);
  v67 = *(_QWORD *)(v55 - 8);
  v3 = MEMORY[0x24BDAC7A8](v55);
  v68 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v60 = (char *)&v47 - v5;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA15B8);
  v66 = *(_QWORD *)(v54 - 8);
  v6 = MEMORY[0x24BDAC7A8](v54);
  v63 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v47 - v8;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA15C0);
  v64 = *(_QWORD *)(v61 - 8);
  v10 = MEMORY[0x24BDAC7A8](v61);
  v59 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v47 - v12;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA15C8);
  v62 = *(_QWORD *)(v53 - 8);
  v14 = MEMORY[0x24BDAC7A8](v53);
  v65 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v58 = (char *)&v47 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v57 = (char *)&v47 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v47 - v20;
  v73 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA15D0);
  v22 = MEMORY[0x24BDF5428];
  sub_230AF95A4(&qword_255EA15D8, &qword_255EA15D0, MEMORY[0x24BDF5428]);
  v52 = v21;
  sub_230B0351C();
  v72 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA15E0);
  sub_230AF9304();
  v51 = v13;
  sub_230B0351C();
  v71 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1600);
  sub_230AF95A4(&qword_255EA1608, &qword_255EA1600, v22);
  v23 = v9;
  v50 = v9;
  sub_230B0351C();
  v70 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1610);
  sub_230AF95A4(&qword_255EA1618, &qword_255EA1610, v22);
  v24 = v60;
  sub_230B0351C();
  v69 = a1;
  v25 = v57;
  sub_230B0351C();
  v47 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
  v26 = v58;
  v27 = v53;
  v47(v58, v21, v53);
  v48 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
  v28 = v59;
  v29 = v13;
  v30 = v61;
  v48(v59, v29, v61);
  v49 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
  v31 = v63;
  v32 = v54;
  v49(v63, v23, v54);
  v33 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  v34 = v55;
  v33(v68, v24, v55);
  v35 = v25;
  v36 = (void (*)(uint64_t, char *, uint64_t))v47;
  v47(v65, v35, v27);
  v37 = v56;
  v36(v56, v26, v27);
  v38 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_255EA1620);
  v48((char *)(v37 + v38[12]), v28, v30);
  v49((char *)(v37 + v38[16]), v31, v32);
  v33((char *)(v37 + v38[20]), v68, v34);
  v39 = v65;
  v36(v37 + v38[24], v65, v27);
  v40 = *(void (**)(char *, uint64_t))(v62 + 8);
  v41 = v27;
  v40(v57, v27);
  v42 = *(void (**)(char *, uint64_t))(v67 + 8);
  v42(v60, v34);
  v43 = *(void (**)(char *, uint64_t))(v66 + 8);
  v43(v50, v32);
  v44 = *(void (**)(char *, uint64_t))(v64 + 8);
  v45 = v61;
  v44(v51, v61);
  v40(v52, v41);
  v40(v39, v41);
  v42(v68, v34);
  v43(v63, v32);
  v44(v59, v45);
  return ((uint64_t (*)(char *, uint64_t))v40)(v58, v41);
}

uint64_t sub_230AF4CE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1630);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_230B033B4();
  v27 = v6;
  v28 = v5;
  v29 = v7;
  HIDWORD(v26) = v8 & 1;
  type metadata accessor for MetricTemplateView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1380);
  sub_230B034F8();
  v9 = sub_230B0303C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v4, 0, 1, v9);
  sub_230AF3C88((uint64_t)v4);
  sub_230AF9568((uint64_t)v4, &qword_255EA1630);
  v30 = 0x203A646564616F4CLL;
  v31 = 0xE800000000000000;
  sub_230B035D0();
  swift_bridgeObjectRelease();
  sub_230AF93A0();
  v10 = sub_230B033D8();
  v12 = v11;
  LOBYTE(v4) = v13 & 1;
  sub_230B0336C();
  v14 = sub_230B033C0();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  swift_release();
  v18 &= 1u;
  sub_230AF93E4(v10, v12, (char)v4);
  swift_bridgeObjectRelease();
  v21 = BYTE4(v26);
  LOBYTE(v30) = BYTE4(v26);
  v23 = v27;
  v22 = v28;
  *(_QWORD *)a1 = v28;
  *(_QWORD *)(a1 + 8) = v23;
  *(_BYTE *)(a1 + 16) = v21;
  *(_QWORD *)(a1 + 24) = v29;
  *(_QWORD *)(a1 + 32) = v14;
  *(_QWORD *)(a1 + 40) = v16;
  *(_BYTE *)(a1 + 48) = v18;
  *(_QWORD *)(a1 + 56) = v20;
  v24 = v22;
  sub_230AF93F4(v22, v23, v21);
  swift_bridgeObjectRetain();
  sub_230AF93F4(v14, v16, v18);
  swift_bridgeObjectRetain();
  sub_230AF93E4(v14, v16, v18);
  swift_bridgeObjectRelease();
  sub_230AF93E4(v24, v23, v30);
  return swift_bridgeObjectRelease();
}

uint64_t sub_230AF4F3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v13[16];
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA15F8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1740);
  sub_230AF9628();
  sub_230B03114();
  sub_230B03528();
  sub_230B0333C();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v5 + 16))(a2, v7, v4);
  v8 = (_OWORD *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255EA15E0) + 36));
  v9 = v20;
  v8[4] = v19;
  v8[5] = v9;
  v8[6] = v21;
  v10 = v16;
  *v8 = v15;
  v8[1] = v10;
  v11 = v18;
  v8[2] = v17;
  v8[3] = v11;
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_230AF5090@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t);
  void (*v58)(char *, char *, uint64_t);
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  void (*v68)(char *, char *, uint64_t);
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  void (*v76)(char *, uint64_t);
  uint64_t v78;
  void (*v79)(char *, uint64_t);
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  char *v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  char *v94;
  char *v95;
  char *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  char *v110;

  v82 = a1;
  v98 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1750);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v97 = (char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v89 = (char *)&v78 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v85 = (char *)&v78 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v80 = (char *)&v78 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16D8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v92 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v87 = (char *)&v78 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v83 = (char *)&v78 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v106 = sub_230B03138();
  v100 = *(_QWORD *)(v106 - 8);
  v17 = MEMORY[0x24BDAC7A8](v106);
  v94 = (char *)&v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v88 = (char *)&v78 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v84 = (char *)&v78 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v78 - v23;
  v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1758);
  v105 = *(_QWORD *)(v99 - 8);
  v25 = MEMORY[0x24BDAC7A8](v99);
  v96 = (char *)&v78 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v95 = (char *)&v78 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v93 = (char *)&v78 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v104 = (char *)&v78 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v90 = (char *)&v78 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v91 = (char *)&v78 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v86 = (char *)&v78 - v38;
  v39 = MEMORY[0x24BDAC7A8](v37);
  v103 = (char *)&v78 - v40;
  v41 = MEMORY[0x24BDAC7A8](v39);
  v81 = (char *)&v78 - v42;
  v43 = MEMORY[0x24BDAC7A8](v41);
  v102 = (char *)&v78 - v44;
  v45 = MEMORY[0x24BDAC7A8](v43);
  v47 = (char *)&v78 - v46;
  MEMORY[0x24BDAC7A8](v45);
  v101 = (char *)&v78 - v48;
  sub_230B03348();
  v107 = 0xD000000000000010;
  v108 = 0x8000000230B04600;
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B03348();
  v49 = v82;
  v107 = sub_230AF4360((void (*)(void))MEMORY[0x24BE71680], MEMORY[0x24BE71738]);
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B0312C();
  v50 = type metadata accessor for MetricTemplateView(0);
  v80 = (char *)*(int *)(v50 + 28);
  v51 = v49;
  v107 = *(_QWORD *)&v80[v49];
  v52 = v106;
  sub_230B030FC();
  v79 = *(void (**)(char *, uint64_t))(v100 + 8);
  v79(v24, v52);
  v100 = *(_QWORD *)(v105 + 32);
  v53 = v99;
  ((void (*)(char *, char *))v100)(v101, v47);
  sub_230B03348();
  v107 = 0xD000000000000011;
  v108 = 0x8000000230B04620;
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B03348();
  v107 = sub_230AF4360((void (*)(void))MEMORY[0x24BE71680], MEMORY[0x24BE71740]);
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v54 = v84;
  sub_230B0312C();
  v85 = (char *)*(int *)(v50 + 32);
  v107 = *(_QWORD *)&v85[v51];
  v55 = v81;
  v56 = v106;
  sub_230B030FC();
  v57 = v79;
  v79(v54, v56);
  v58 = (void (*)(char *, char *, uint64_t))v100;
  ((void (*)(char *, char *, uint64_t))v100)(v102, v55, v53);
  sub_230B03348();
  v107 = 0xD000000000000012;
  v108 = 0x8000000230B04640;
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B03348();
  v107 = sub_230AF4360((void (*)(void))MEMORY[0x24BE71688], MEMORY[0x24BE71738]);
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v59 = v88;
  sub_230B0312C();
  v107 = *(_QWORD *)&v80[v51];
  v60 = v86;
  v61 = v106;
  sub_230B030FC();
  v57(v59, v61);
  v62 = v99;
  v58(v103, v60, v99);
  sub_230B03348();
  v107 = 0xD000000000000013;
  v108 = 0x8000000230B04660;
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B03348();
  v107 = sub_230AF4360((void (*)(void))MEMORY[0x24BE71688], MEMORY[0x24BE71740]);
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v63 = v94;
  sub_230B0312C();
  v107 = *(_QWORD *)&v85[v51];
  v64 = v90;
  sub_230B030FC();
  v57(v63, v61);
  v65 = v91;
  ((void (*)(char *, char *, uint64_t))v100)(v91, v64, v62);
  v66 = v104;
  v67 = v105;
  v68 = *(void (**)(char *, char *, uint64_t))(v105 + 16);
  v69 = v101;
  v68(v104, v101, v62);
  v107 = (uint64_t)v66;
  v70 = v93;
  v71 = v102;
  v68(v93, v102, v62);
  v108 = (unint64_t)v70;
  v72 = v95;
  v73 = v103;
  v68(v95, v103, v62);
  v109 = v72;
  v74 = v72;
  v75 = v96;
  v68(v96, v65, v62);
  v110 = v75;
  sub_230AF5C24(&v107, v98);
  v76 = *(void (**)(char *, uint64_t))(v67 + 8);
  v76(v65, v62);
  v76(v73, v62);
  v76(v71, v62);
  v76(v69, v62);
  v76(v75, v62);
  v76(v74, v62);
  v76(v70, v62);
  return ((uint64_t (*)(char *, uint64_t))v76)(v104, v62);
}

uint64_t sub_230AF5C24@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  int *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, _QWORD, uint64_t);
  char *v10;
  char *v11;
  char *v12;
  void (*v13)(uint64_t, char *, uint64_t);
  uint64_t v15;

  v4 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_255EA1760);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1758);
  sub_230B03138();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(void (**)(char *, _QWORD, uint64_t))(v8 + 16);
  v9(v6, *a1, v7);
  v10 = &v6[v4[12]];
  v9(v10, a1[1], v7);
  v11 = &v6[v4[16]];
  v9(v11, a1[2], v7);
  v12 = &v6[v4[20]];
  v9(v12, a1[3], v7);
  v13 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v13(a2, v6, v7);
  v13(a2 + v4[12], v10, v7);
  v13(a2 + v4[16], v11, v7);
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v13)(a2 + v4[20], v12, v7);
}

uint64_t sub_230AF5D6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t OpaqueTypeConformance2;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;

  v81 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1648);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v66 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16E8);
  v4 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v6 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16F0);
  v7 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16F8);
  v10 = *(_QWORD *)(v80 - 8);
  v11 = MEMORY[0x24BDAC7A8](v80);
  v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v66 - v14;
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1700);
  MEMORY[0x24BDAC7A8](v71);
  v17 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1708);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v79 = (uint64_t)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v78 = (char *)&v66 - v21;
  v22 = sub_230B033B4();
  v75 = v23;
  v76 = v22;
  v73 = v24;
  v77 = v25;
  v26 = sub_230AF260C();
  if (v26)
  {
    v82 = v26;
    v70 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1720);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1690);
    v69 = v7;
    sub_230AF95A4(&qword_255EA1728, &qword_255EA1720, MEMORY[0x24BEE12D8]);
    v83 = sub_230B03150();
    v84 = MEMORY[0x24BEE0D00];
    v85 = MEMORY[0x24BDB8320];
    v86 = MEMORY[0x24BDB84A8];
    swift_getOpaqueTypeConformance2();
    v67 = v4;
    sub_230AF911C(&qword_255EA1730, type metadata accessor for ActionPoint, (uint64_t)&unk_230B03C04);
    sub_230B03120();
    v83 = sub_230AF2314();
    v27 = sub_230B0315C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v3, 1, 1, v27);
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16B0);
    v29 = sub_230AF95A4(&qword_255EA1710, &qword_255EA16E8, MEMORY[0x24BDB8148]);
    v30 = sub_230AF9440();
    v68 = v10;
    v31 = v72;
    sub_230B033F0();
    sub_230AF9568((uint64_t)v3, &qword_255EA1648);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v6, v31);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1738);
    v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_230B03B10;
    *(_QWORD *)(v32 + 32) = sub_230B031A4();
    *(_QWORD *)(v32 + 40) = v33;
    *(_QWORD *)(v32 + 48) = _s6People22MissedCallPersonStatusV0A2UIE14iconForeground05SwiftF05ColorVvg_0();
    *(_QWORD *)(v32 + 56) = sub_230B031B0();
    *(_QWORD *)(v32 + 64) = v34;
    *(_QWORD *)(v32 + 72) = sub_230B034A4();
    v83 = v31;
    v84 = v28;
    v85 = v29;
    v86 = v30;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v36 = v74;
    v37 = MEMORY[0x24BEE0D00];
    v38 = MEMORY[0x24BDB84A8];
    sub_230B033FC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v9, v36);
    v39 = v68;
    v40 = v70;
    v41 = v80;
    (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v70, v13, v80);
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v17, v40, v41);
    swift_storeEnumTagMultiPayload();
    v83 = v36;
    v84 = v37;
    v85 = MEMORY[0x24BDF3E48];
    v86 = OpaqueTypeConformance2;
    v87 = v38;
    v88 = MEMORY[0x24BDF3E18];
    swift_getOpaqueTypeConformance2();
    v42 = (uint64_t)v78;
    sub_230B03354();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v41);
  }
  else
  {
    sub_230B03348();
    v43 = sub_230B033CC();
    v45 = v44;
    v47 = v46 & 1;
    _s6People22MissedCallPersonStatusV0A2UIE12iconFontSize05SwiftF00H0Vvg_0();
    v48 = sub_230B033C0();
    v50 = v49;
    v52 = v51;
    v54 = v53;
    swift_release();
    sub_230AF93E4(v43, v45, v47);
    swift_bridgeObjectRelease();
    *(_QWORD *)v17 = v48;
    *((_QWORD *)v17 + 1) = v50;
    v17[16] = v52 & 1;
    *((_QWORD *)v17 + 3) = v54;
    swift_storeEnumTagMultiPayload();
    v55 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255EA16B0);
    v56 = sub_230AF95A4(&qword_255EA1710, &qword_255EA16E8, MEMORY[0x24BDB8148]);
    v57 = sub_230AF9440();
    v83 = v72;
    v84 = v55;
    v85 = v56;
    v86 = v57;
    v58 = swift_getOpaqueTypeConformance2();
    v83 = v74;
    v84 = MEMORY[0x24BEE0D00];
    v85 = MEMORY[0x24BDF3E48];
    v86 = v58;
    v87 = MEMORY[0x24BDB84A8];
    v88 = MEMORY[0x24BDF3E18];
    swift_getOpaqueTypeConformance2();
    v42 = (uint64_t)v78;
    sub_230B03354();
  }
  v59 = v73 & 1;
  v60 = v79;
  sub_230AF9524(v42, v79, &qword_255EA1708);
  v61 = v81;
  v63 = v75;
  v62 = v76;
  *v81 = v76;
  v61[1] = v63;
  *((_BYTE *)v61 + 16) = v59;
  v61[3] = v77;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1718);
  sub_230AF9524(v60, (uint64_t)v61 + *(int *)(v64 + 48), &qword_255EA1708);
  sub_230AF93F4(v62, v63, v59);
  swift_bridgeObjectRetain();
  sub_230AF9568(v42, &qword_255EA1708);
  sub_230AF9568(v60, &qword_255EA1708);
  sub_230AF93E4(v62, v63, v59);
  return swift_bridgeObjectRelease();
}

uint64_t sub_230AF64E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;

  v30 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16D8);
  v28 = *(_QWORD *)(v3 - 8);
  v29 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v21 = (char *)&v21 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16E0);
  MEMORY[0x24BDAC7A8](v7);
  v23 = sub_230B03150();
  v27 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1690);
  v24 = *(_QWORD *)(v10 - 8);
  v25 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v22 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B03348();
  v12 = type metadata accessor for ActionPoint(0);
  sub_230B0303C();
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B03348();
  v13 = 0x656E696C656D6954;
  if (*(_BYTE *)(a1 + *(int *)(v12 + 28)))
  {
    v13 = 0x74736575716552;
    v14 = 0xE700000000000000;
  }
  else
  {
    v14 = 0xE800000000000000;
  }
  v31 = v13;
  v32 = v14;
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B03144();
  sub_230B03348();
  v15 = (uint64_t *)(a1 + *(int *)(v12 + 20));
  v16 = v15[1];
  v31 = *v15;
  v32 = v16;
  swift_bridgeObjectRetain();
  v17 = v26;
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = v22;
  v18 = v23;
  sub_230B030F0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v29);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v18);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v30, v19, v25);
}

uint64_t sub_230AF684C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  int v27;
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
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  char *v56;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  int v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1640);
  MEMORY[0x24BDAC7A8](v4);
  v83 = (char *)&v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1648);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1650);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1658);
  v13 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v15 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1660);
  v93 = *(_QWORD *)(v16 - 8);
  v94 = v16;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v92 = (char *)&v79 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v95 = (char *)&v79 - v19;
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1668);
  MEMORY[0x24BDAC7A8](v84);
  v86 = (uint64_t *)((char *)&v79 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1670);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v91 = (uint64_t)&v79 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v90 = (char *)&v79 - v24;
  v25 = sub_230B033B4();
  v87 = v26;
  v88 = v25;
  v85 = v27;
  v89 = v28;
  v82 = a1;
  v29 = sub_230AF2D8C();
  if (v29)
  {
    v100 = v29;
    v80 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1688);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1690);
    sub_230AF95A4(&qword_255EA1698, &qword_255EA1688, MEMORY[0x24BEE12D8]);
    v96 = sub_230B03150();
    v97 = MEMORY[0x24BEE0D00];
    v98 = MEMORY[0x24BDB8320];
    v99 = MEMORY[0x24BDB84A8];
    swift_getOpaqueTypeConformance2();
    v79 = v4;
    sub_230AF911C(&qword_255EA16A0, type metadata accessor for SignalPoint, (uint64_t)&unk_230B03C3C);
    sub_230B03120();
    v30 = sub_230AF95A4(&qword_255EA16A8, &qword_255EA1650, MEMORY[0x24BDB8148]);
    sub_230B033E4();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    v100 = sub_230AF2314();
    v31 = sub_230B0315C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v8, 1, 1, v31);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16B0);
    v96 = v9;
    v97 = v30;
    swift_getOpaqueTypeConformance2();
    sub_230AF9440();
    v32 = v92;
    v33 = v81;
    sub_230B033F0();
    sub_230AF9568((uint64_t)v8, &qword_255EA1648);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v33);
    (*(void (**)(char *, char *, uint64_t))(v93 + 32))(v95, v32, v94);
    v96 = sub_230AF35D0();
    v97 = v34;
    sub_230AF93A0();
    v35 = sub_230B033D8();
    v37 = v36;
    v39 = v38 & 1;
    _s6People22MissedCallPersonStatusV0A2UIE12iconFontSize05SwiftF00H0Vvg_0();
    v40 = sub_230B033C0();
    v42 = v41;
    v44 = v43;
    swift_release();
    LOBYTE(v32) = v44 & 1;
    sub_230AF93E4(v35, v37, v39);
    swift_bridgeObjectRelease();
    sub_230B034B0();
    v45 = sub_230B033A8();
    v47 = v46;
    LOBYTE(v37) = v48;
    swift_release();
    LOBYTE(v35) = v37 & 1;
    sub_230AF93E4(v40, v42, (char)v32);
    swift_bridgeObjectRelease();
    v49 = sub_230B033B4();
    v51 = v50;
    v53 = v52;
    v55 = v54 & 1;
    sub_230AF93E4(v45, v47, v35);
    swift_bridgeObjectRelease();
    v56 = v92;
    v57 = v93;
    v58 = *(void (**)(char *, char *, uint64_t))(v93 + 16);
    v59 = v94;
    v58(v92, v95, v94);
    v60 = (uint64_t)v83;
    v58(v83, v56, v59);
    v61 = v60 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255EA16C0) + 48);
    *(_QWORD *)v61 = v49;
    *(_QWORD *)(v61 + 8) = v51;
    *(_BYTE *)(v61 + 16) = v55;
    *(_QWORD *)(v61 + 24) = v53;
    sub_230AF93F4(v49, v51, v55);
    swift_bridgeObjectRetain();
    sub_230AF93F4(v49, v51, v55);
    swift_bridgeObjectRetain();
    sub_230AF93E4(v49, v51, v55);
    swift_bridgeObjectRelease();
    v62 = *(void (**)(char *, uint64_t))(v57 + 8);
    v62(v56, v59);
    sub_230AF9524(v60, (uint64_t)v86, &qword_255EA1640);
    swift_storeEnumTagMultiPayload();
    sub_230AF95A4(&qword_255EA1678, &qword_255EA1640, MEMORY[0x24BDF5428]);
    v63 = (uint64_t)v90;
    sub_230B03354();
    sub_230AF9568(v60, &qword_255EA1640);
    v64 = v51;
    a2 = v80;
    sub_230AF93E4(v49, v64, v55);
    swift_bridgeObjectRelease();
    v62(v95, v59);
  }
  else
  {
    _s6People22MissedCallPersonStatusV0A2UIE12iconFontSize05SwiftF00H0Vvg_0();
    v65 = sub_230B033C0();
    v67 = v66;
    v69 = v68;
    v71 = v70;
    swift_release();
    v72 = v86;
    *v86 = v65;
    v72[1] = v67;
    *((_BYTE *)v72 + 16) = v69 & 1;
    v72[3] = v71;
    swift_storeEnumTagMultiPayload();
    sub_230AF95A4(&qword_255EA1678, &qword_255EA1640, MEMORY[0x24BDF5428]);
    v63 = (uint64_t)v90;
    sub_230B03354();
  }
  v73 = v85 & 1;
  v74 = v91;
  sub_230AF9524(v63, v91, &qword_255EA1670);
  v76 = v87;
  v75 = v88;
  *(_QWORD *)a2 = v88;
  *(_QWORD *)(a2 + 8) = v76;
  *(_BYTE *)(a2 + 16) = v73;
  *(_QWORD *)(a2 + 24) = v89;
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1680);
  sub_230AF9524(v74, a2 + *(int *)(v77 + 48), &qword_255EA1670);
  sub_230AF93F4(v75, v76, v73);
  swift_bridgeObjectRetain();
  sub_230AF9568(v63, &qword_255EA1670);
  sub_230AF9568(v74, &qword_255EA1670);
  sub_230AF93E4(v75, v76, v73);
  return swift_bridgeObjectRelease();
}

uint64_t sub_230AF708C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v20 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16D8);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA16E0);
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_230B03150();
  v8 = *(_QWORD *)(v7 - 8);
  v18 = v7;
  v19 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v17 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B03348();
  v10 = type metadata accessor for SignalPoint(0);
  sub_230B0303C();
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230B03348();
  v11 = (uint64_t *)(a1 + *(int *)(v10 + 20));
  v13 = v11[1];
  v23 = *v11;
  v12 = v23;
  v24 = v13;
  swift_bridgeObjectRetain();
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = v17;
  sub_230B03144();
  sub_230B03348();
  v23 = v12;
  v24 = v13;
  swift_bridgeObjectRetain();
  sub_230B03108();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15 = v18;
  sub_230B030F0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v22);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v14, v15);
}

uint64_t sub_230AF7354@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = sub_230B033B4();
  v20 = v3;
  v21 = v2;
  v22 = v4;
  v19 = v5 & 1;
  sub_230AF3FE8();
  sub_230AF93A0();
  v6 = sub_230B033D8();
  v8 = v7;
  v10 = v9 & 1;
  sub_230B0336C();
  v11 = sub_230B033C0();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  swift_release();
  v15 &= 1u;
  sub_230AF93E4(v6, v8, v10);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v21;
  *(_QWORD *)(a1 + 8) = v20;
  *(_BYTE *)(a1 + 16) = v19;
  *(_QWORD *)(a1 + 24) = v22;
  *(_QWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 40) = v13;
  *(_BYTE *)(a1 + 48) = v15;
  *(_QWORD *)(a1 + 56) = v17;
  sub_230AF93F4(v21, v20, v19);
  swift_bridgeObjectRetain();
  sub_230AF93F4(v11, v13, v15);
  swift_bridgeObjectRetain();
  sub_230AF93E4(v11, v13, v15);
  swift_bridgeObjectRelease();
  sub_230AF93E4(v21, v20, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_230AF74E0(uint64_t a1, uint64_t a2)
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
  _QWORD v13[4];

  v3 = sub_230B0303C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v13 - v8;
  v10 = sub_230B0324C();
  v11 = *(_QWORD *)(a2 + 16);
  v13[2] = *(_QWORD *)(a2 + 8);
  v13[3] = v11;
  v13[1] = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1580);
  sub_230B03504();
  sub_230B03030();
  type metadata accessor for MetricTemplateView(0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1380);
  sub_230B03504();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t sub_230AF75E8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[5] = a1;
  v2 = sub_230B0303C();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  sub_230B0363C();
  v1[10] = sub_230B03630();
  sub_230B03624();
  return swift_task_switch();
}

uint64_t MetricTemplateView.body.getter@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t OpaqueTypeConformance2;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v32 = a1;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1350);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for MetricTemplateView(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1358);
  v28 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1360);
  v9 = *(_QWORD *)(v30 - 8);
  v10 = MEMORY[0x24BDAC7A8](v30);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v27 - v13;
  v15 = *v1;
  sub_230AF4488((uint64_t)v8);
  if (v15 == 1)
  {
    sub_230AF949C((uint64_t)v1, (uint64_t)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for MetricTemplateView);
    v16 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v17 = swift_allocObject();
    sub_230AF94E0((uint64_t)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, type metadata accessor for MetricTemplateView);
    v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255EA1368);
    v19 = sub_230AF95A4(&qword_255EA1370, &qword_255EA1368, MEMORY[0x24BDEDA68]);
    v33 = v18;
    v34 = v19;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_230B03420();
    swift_release();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v6);
    v21 = v30;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v12, v30);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v31, v14, v21);
    swift_storeEnumTagMultiPayload();
    v33 = v6;
    v34 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    sub_230B03354();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v21);
  }
  else
  {
    v23 = v28;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v31, v8, v6);
    swift_storeEnumTagMultiPayload();
    v24 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255EA1368);
    v25 = sub_230AF95A4(&qword_255EA1370, &qword_255EA1368, MEMORY[0x24BDEDA68]);
    v33 = v24;
    v34 = v25;
    v26 = swift_getOpaqueTypeConformance2();
    v33 = v6;
    v34 = v26;
    swift_getOpaqueTypeConformance2();
    sub_230B03354();
    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v8, v6);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348BEDB4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_230AF7A40(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[5] = a1;
  v2 = sub_230B0303C();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  sub_230B0363C();
  v1[10] = sub_230B03630();
  sub_230B03624();
  return swift_task_switch();
}

uint64_t sub_230AF7AE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  swift_release();
  v6 = sub_230B0324C();
  v7 = *(_QWORD *)(v5 + 16);
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v5 + 8);
  *(_QWORD *)(v0 + 24) = v7;
  *(_QWORD *)(v0 + 32) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1580);
  sub_230B03504();
  sub_230B03030();
  type metadata accessor for MetricTemplateView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1380);
  sub_230B03504();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_230AF7BD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MetricTemplateView(0) - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_230AF7C34;
  return sub_230AF7A40(v3);
}

uint64_t sub_230AF7C34()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_230AF7C7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_230AF7C94()
{
  return sub_230B0342C();
}

uint64_t *initializeBufferWithCopyOfBuffer for MetricTemplateView(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    v8 = a3[6];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_230B0303C();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    v12(v9, v10, v11);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1380);
    *(_QWORD *)&v9[*(int *)(v13 + 28)] = *(_QWORD *)&v10[*(int *)(v13 + 28)];
    v14 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)v4 + v14) = *(uint64_t *)((char *)a2 + v14);
    v15 = a3[10];
    *(uint64_t *)((char *)v4 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)v4 + v15) = *(uint64_t *)((char *)a2 + v15);
    *(uint64_t *)((char *)v4 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for MetricTemplateView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_230B0303C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1380);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MetricTemplateView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_230B0303C();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  v11(v8, v9, v10);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1380);
  *(_QWORD *)(v8 + *(int *)(v12 + 28)) = *(_QWORD *)(v9 + *(int *)(v12 + 28));
  v13 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  v14 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MetricTemplateView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_230B0303C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1380);
  *(_QWORD *)(v7 + *(int *)(v10 + 28)) = *(_QWORD *)(v8 + *(int *)(v10 + 28));
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MetricTemplateView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_230B0303C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1380);
  *(_QWORD *)(v7 + *(int *)(v10 + 28)) = *(_QWORD *)(v8 + *(int *)(v10 + 28));
  v11 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  v12 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithTake for MetricTemplateView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_230B0303C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1380);
  *(_QWORD *)(v7 + *(int *)(v10 + 28)) = *(_QWORD *)(v8 + *(int *)(v10 + 28));
  swift_release();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_release();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_release();
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_release();
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MetricTemplateView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_230AF82D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1380);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MetricTemplateView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_230AF8360(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1380);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

void sub_230AF83D8()
{
  unint64_t v0;

  sub_230AF8474();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_230AF8474()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255EA13F8[0])
  {
    sub_230B0303C();
    v0 = sub_230B03510();
    if (!v1)
      atomic_store(v0, qword_255EA13F8);
  }
}

unint64_t sub_230AF84CC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];
  uint64_t OpaqueTypeConformance2;

  result = qword_255EA1440;
  if (!qword_255EA1440)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_255EA1448);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255EA1358);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255EA1368);
    sub_230AF95A4(&qword_255EA1370, &qword_255EA1368, MEMORY[0x24BDEDA68]);
    v3[2] = v2;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = OpaqueTypeConformance2;
    result = MEMORY[0x2348BEDC0](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255EA1440);
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_230AF85B4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_230AF85D4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_230AF96E4(a1, qword_2540E6420);
}

uint64_t initializeBufferWithCopyOfBuffer for ContactImage(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_230AF864C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_230AF866C(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_230AF96E4(a1, &qword_2540E6418);
}

uint64_t *sub_230AF86AC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_230B03054();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (char *)a1 + v9;
    v14 = (char *)a2 + v9;
    v15 = sub_230B0303C();
    v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_230AF877C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v6 = sub_230B03054();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  v14 = sub_230B0303C();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  return a1;
}

uint64_t sub_230AF881C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_230B03054();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 24);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_230B0303C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_230AF88C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_230B03054();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_230B0303C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_230AF8948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_230B03054();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 24);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_230B0303C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_230AF89E0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_230AF89F0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for SignalPoint(uint64_t a1)
{
  return sub_230AF9028(a1, qword_255EA14A8);
}

uint64_t sub_230AF8A14()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_230B03054();
  if (v1 <= 0x3F)
  {
    result = sub_230B0303C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

_QWORD *sub_230AF8AA0(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_230B03054();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (_QWORD *)((char *)a1 + v8);
    v11 = (_QWORD *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (char *)a1 + v9;
    v14 = (char *)a2 + v9;
    v15 = sub_230B0303C();
    v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  }
  return a1;
}

uint64_t sub_230AF8B80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_230B03054();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  v5 = a1 + *(int *)(a2 + 24);
  v6 = sub_230B0303C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_230AF8BEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v6 = sub_230B03054();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  v14 = sub_230B0303C();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_230AF8CA0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_230B03054();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_230B0303C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_230AF8D5C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_230B03054();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_230B0303C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_230AF8DF4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_230B03054();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_230B0303C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_230AF8EA0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_index_3Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_230B03054();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_230B0303C();
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_230AF8F5C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_index_4Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_230B03054();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
      return result;
    }
    v10 = sub_230B0303C();
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for ActionPoint(uint64_t a1)
{
  return sub_230AF9028(a1, qword_255EA1540);
}

uint64_t sub_230AF9028(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_230AF905C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_230B03054();
  if (v1 <= 0x3F)
  {
    result = sub_230B0303C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_230AF90F0()
{
  return sub_230AF911C(&qword_2540E63E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_230AF911C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2348BEDC0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_230AF915C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_230AF4708(*(_QWORD *)(v1 + 16), a1);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for MetricTemplateView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_release();
  v4 = v3 + *(int *)(v1 + 24);
  v5 = sub_230B0303C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1380);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_230AF9250(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MetricTemplateView(0) - 8) + 80);
  return sub_230AF74E0(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_230AF9290()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MetricTemplateView(0) - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_230AF98F8;
  return sub_230AF75E8(v3);
}

uint64_t sub_230AF92F4@<X0>(uint64_t a1@<X8>)
{
  return sub_230AF4CE4(a1);
}

uint64_t sub_230AF92FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_230AF4F3C(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_230AF9304()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255EA15E8;
  if (!qword_255EA15E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255EA15E0);
    v2[0] = sub_230AF95A4(&qword_255EA15F0, &qword_255EA15F8, MEMORY[0x24BDB8148]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2348BEDC0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255EA15E8);
  }
  return result;
}

uint64_t sub_230AF9388@<X0>(uint64_t *a1@<X8>)
{
  return sub_230AF5D6C(a1);
}

uint64_t sub_230AF9390@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_230AF684C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_230AF9398@<X0>(uint64_t a1@<X8>)
{
  return sub_230AF7354(a1);
}

unint64_t sub_230AF93A0()
{
  unint64_t result;

  result = qword_255EA1628;
  if (!qword_255EA1628)
  {
    result = MEMORY[0x2348BEDC0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255EA1628);
  }
  return result;
}

uint64_t sub_230AF93E4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_230AF93F4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_230AF9404(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_230AF9440()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255EA16B8;
  if (!qword_255EA16B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255EA16B0);
    v2 = MEMORY[0x24BDB7A98];
    result = MEMORY[0x2348BEDC0](MEMORY[0x24BDB84B8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255EA16B8);
  }
  return result;
}

uint64_t sub_230AF949C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_230AF94E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_230AF9524(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_230AF9568(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_230AF95A4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2348BEDC0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_230AF95E4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_230AF9620@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_230AF5090(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_230AF9628()
{
  unint64_t result;
  uint64_t v1;
  _QWORD *v2;
  _QWORD v3[4];

  result = qword_255EA1748;
  if (!qword_255EA1748)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255EA1740);
    sub_230B03138();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = v3[0];
    v3[2] = v3[0];
    v3[3] = v3[0];
    v2 = v3;
    result = MEMORY[0x2348BEDC0](MEMORY[0x24BDB7B80], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255EA1748);
  }
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_230AF96E4(a1, &qword_255EA1768);
}

void sub_230AF96E4(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ActionPoint.Action(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ActionPoint.Action(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_230AF9810 + 4 * byte_230B03B25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_230AF9844 + 4 * byte_230B03B20[v4]))();
}

uint64_t sub_230AF9844(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230AF984C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230AF9854);
  return result;
}

uint64_t sub_230AF9860(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230AF9868);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_230AF986C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230AF9874(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230AF9880(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_230AF988C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ActionPoint.Action()
{
  return &type metadata for ActionPoint.Action;
}

unint64_t sub_230AF98AC()
{
  unint64_t result;

  result = qword_255EA1770;
  if (!qword_255EA1770)
  {
    result = MEMORY[0x2348BEDC0](&unk_230B03CFC, &type metadata for ActionPoint.Action);
    atomic_store(result, (unint64_t *)&qword_255EA1770);
  }
  return result;
}

uint64_t ContactImage.avatar.getter()
{
  return swift_retain();
}

uint64_t ContactImage.avatarLuminance.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t ContactImage.avatarLuminance.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 8) = result;
  *(_BYTE *)(v2 + 16) = a2 & 1;
  return result;
}

uint64_t (*ContactImage.avatarLuminance.modify())()
{
  return nullsub_1;
}

uint64_t ContactImage.avatarSaturation.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t ContactImage.avatarSaturation.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = result;
  *(_BYTE *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t (*ContactImage.avatarSaturation.modify())()
{
  return nullsub_1;
}

int64x2_t ContactImage.init(contactImageData:)@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  Class isa;
  Class v15;
  uint64_t v16;
  double v17;
  int64x2_t result;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  __C::CGRect v23;

  v6 = objc_allocWithZone(MEMORY[0x24BEBD640]);
  sub_230AF9E18(a1, a2);
  v7 = (void *)sub_230B0300C();
  v8 = objc_msgSend(v6, sel_initWithData_, v7);

  if (v8)
  {
    v9 = sub_230B034C8();
    sub_230AF9E5C(a1, a2);
  }
  else
  {
    sub_230AF9E5C(a1, a2);
    v9 = 0;
  }
  v10 = objc_allocWithZone(MEMORY[0x24BEBD640]);
  sub_230AF9E18(a1, a2);
  v11 = (void *)sub_230B0300C();
  v12 = objc_msgSend(v10, sel_initWithData_, v11);
  sub_230AF9E5C(a1, a2);

  if (v12)
  {
    v13 = (void *)MEMORY[0x2348BEB80]();
    v23.origin.x = 0.3;
    v23.origin.y = 0.9;
    v23.size.width = 0.4;
    v23.size.height = 0.05;
    isa = UIImage.crop(relativeTo:)(v23).super.isa;
    v15 = UIImage.resize(to:)((CGSize)__PAIR128__(0x4059000000000000, 0x4059000000000000)).super.isa;
    -[objc_class _calculateStatistics](v15, sel__calculateStatistics);
    v16 = v22;

    v17 = v19 * 0.2126 + v20 * 0.7152 + v21 * 0.0722;
    objc_autoreleasePoolPop(v13);
    sub_230AF9E5C(a1, a2);

  }
  else
  {
    sub_230AF9E5C(a1, a2);
    v16 = 0;
    v17 = 0.0;
  }
  *(_QWORD *)a3 = v9;
  *(double *)(a3 + 8) = v17;
  *(_BYTE *)(a3 + 16) = v12 == 0;
  *(_QWORD *)(a3 + 24) = v16;
  *(_BYTE *)(a3 + 32) = v12 == 0;
  *(_OWORD *)(a3 + 40) = xmmword_230B03D60;
  *(_OWORD *)(a3 + 56) = xmmword_230B03D70;
  result = vdupq_n_s64(0x4059000000000000uLL);
  *(int64x2_t *)(a3 + 72) = result;
  return result;
}

uint64_t _s6People22ContactFetcherProtocolP0A2UIE03getB9ImageData3for4size6locale10Foundation0H0VSgSo9CNContactCSg_So6CGSizeVAD06LocaleD0_ptF_0(void *a1, _QWORD *a2, double a3, double a4)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  UIImage *v28;
  NSData *v29;
  uint64_t v30;
  _QWORD v32[3];
  uint64_t v33;
  uint64_t v34;

  if (!a1)
    return 0;
  v8 = objc_allocWithZone(MEMORY[0x24BDBAE38]);
  v9 = a1;
  v10 = objc_msgSend(v8, sel_init);
  v11 = a2[3];
  v12 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v11);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
  v15 = v14;
  sub_230AFA120((uint64_t)a2, (uint64_t)v32);
  if (v15)
  {
    v16 = v33;
    v17 = v34;
    __swift_project_boxed_opaque_existential_1(v32, v33);
    v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 16))(v13, v15, v16, v17);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    v19 = v18 == 2;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    v19 = 0;
  }
  v20 = (void *)objc_opt_self();
  v21 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v21, sel_scale);
  v23 = v22;

  v24 = objc_msgSend(v20, sel_scopeWithPointSize_scale_rightToLeft_style_backgroundStyle_, v19, 0, 0, a3, a4, v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1778);
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_230B03D80;
  *(_QWORD *)(v25 + 32) = v9;
  v32[0] = v25;
  sub_230B03618();
  sub_230AFA184();
  v26 = v9;
  v27 = (void *)sub_230B0360C();
  swift_bridgeObjectRelease();
  v28 = (UIImage *)objc_msgSend(v10, sel_avatarImageForContacts_scope_, v27, v24);

  v29 = UIImagePNGRepresentation(v28);
  if (!v29)
  {

    swift_unknownObjectRelease();
    return 0;
  }
  v30 = sub_230B03018();

  swift_unknownObjectRelease();
  return v30;
}

uint64_t sub_230AF9E18(uint64_t a1, unint64_t a2)
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

uint64_t sub_230AF9E5C(uint64_t a1, unint64_t a2)
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

uint64_t destroy for ContactImage()
{
  return swift_release();
}

uint64_t initializeWithCopy for ContactImage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ContactImage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  v4 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for ContactImage(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactImage(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 88))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactImage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 88) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 88) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactImage()
{
  return &type metadata for ContactImage;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_230AFA120(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

unint64_t sub_230AFA184()
{
  unint64_t result;

  result = qword_255EA1780;
  if (!qword_255EA1780)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255EA1780);
  }
  return result;
}

uint64_t static PeopleWidgetConstants.maxAdditionalBadges.getter()
{
  return 2;
}

double static PeopleWidgetConstants.statusBadgeSize.getter()
{
  return 24.0;
}

int64x2_t sub_230AFA1D4()
{
  int64x2_t result;

  result = vdupq_n_s64(0x4055800000000000uLL);
  xmmword_2540E63F8 = (__int128)result;
  return result;
}

double static PeopleWidgetConstants.maxContactAvatarSize.getter()
{
  if (qword_2540E6408 != -1)
    swift_once();
  return *(double *)&xmmword_2540E63F8;
}

double static PeopleWidgetConstants.statusBadgeAccessibilitySize.getter()
{
  return 36.0;
}

void sub_230AFA244()
{
  qword_255EA1788 = 0x4040000000000000;
}

double static PeopleWidgetConstants.widgetPadding.getter()
{
  return sub_230AFA29C(&qword_255EA1250, (uint64_t)&qword_255EA1788);
}

void sub_230AFA270()
{
  qword_255EA1790 = 0x4022000000000000;
}

double static PeopleWidgetConstants.avatarAndStatusSpacing.getter()
{
  return sub_230AFA29C(&qword_255EA1258, (uint64_t)&qword_255EA1790);
}

double sub_230AFA29C(_QWORD *a1, uint64_t a2)
{
  if (*a1 != -1)
    swift_once();
  return *(double *)a2;
}

uint64_t sub_230AFA2D4(uint64_t a1)
{
  return sub_230AFA864(0.584313725, 0.580392157, 0.6, a1, &qword_255EA1798);
}

uint64_t static PeopleWidgetConstants.nameForegroundColor.getter()
{
  return sub_230AFA350(&qword_255EA1260);
}

uint64_t sub_230AFA318(uint64_t a1)
{
  return sub_230AFA864(0.93, 0.93, 0.93, a1, &qword_255EA17A0);
}

uint64_t static PeopleWidgetConstants.kettleGradientColor.getter()
{
  return sub_230AFA350(&qword_255EA1268);
}

uint64_t sub_230AFA350(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_230AFA388(uint64_t a1)
{
  return sub_230AFA864(0.39, 0.39, 0.4, a1, &qword_255EA17A8);
}

uint64_t static PeopleWidgetConstants.motionGradientColor.getter()
{
  return sub_230AFA350(&qword_255EA1270);
}

uint64_t sub_230AFA3C4(uint64_t a1)
{
  return sub_230AFA864(0.46, 0.45, 0.9, a1, &qword_255EA17B0);
}

uint64_t static PeopleWidgetConstants.screenTimeGradientColor2.getter()
{
  return sub_230AFA350(&qword_255EA1278);
}

uint64_t sub_230AFA404()
{
  uint64_t result;

  result = _s6People24AvailabilityPersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0();
  qword_255EA17B8 = result;
  return result;
}

uint64_t static PeopleWidgetConstants.screenTimeGradientColor1.getter()
{
  return sub_230AFA350(&qword_255EA1280);
}

uint64_t sub_230AFA43C()
{
  uint64_t result;

  result = _s6People19MessagePersonStatusV0A2UIE14iconForeground05SwiftE05ColorVvg_0();
  qword_255EA17C0 = result;
  return result;
}

uint64_t static PeopleWidgetConstants.askToBuyAppstoreGradientColor1.getter()
{
  return sub_230AFA350(&qword_255EA1288);
}

uint64_t sub_230AFA474(uint64_t a1)
{
  return sub_230AFA864(0.0, 0.7, 1.0, a1, &qword_255EA17C8);
}

uint64_t static PeopleWidgetConstants.askToBuyAppstoreGradientColor2.getter()
{
  return sub_230AFA350(&qword_255EA1290);
}

uint64_t sub_230AFA4B0()
{
  uint64_t result;

  result = sub_230B03498();
  qword_255EA17D0 = result;
  return result;
}

uint64_t static PeopleWidgetConstants.askToBuyBooksGradientColor1.getter()
{
  return sub_230AFA350(&qword_255EA1298);
}

uint64_t sub_230AFA4E8(uint64_t a1)
{
  return sub_230AFA864(0.992156863, 0.615686275, 0.0, a1, &qword_255EA17D8);
}

uint64_t static PeopleWidgetConstants.askToBuyBooksGradientColor2.getter()
{
  return sub_230AFA350(&qword_255EA12A0);
}

uint64_t sub_230AFA524(uint64_t a1)
{
  return sub_230AFA864(0.815686275, 0.255230126, 1.0, a1, &qword_255EA17E0);
}

uint64_t static PeopleWidgetConstants.askToBuyITunesGradientColor1.getter()
{
  return sub_230AFA350(&qword_255EA12A8);
}

uint64_t sub_230AFA560(uint64_t a1)
{
  return sub_230AFA864(0.988235294, 0.356862745, 0.768627451, a1, &qword_255EA17E8);
}

uint64_t static PeopleWidgetConstants.askToBuyITunesGradientColor2.getter()
{
  return sub_230AFA350(&qword_255EA12B0);
}

uint64_t sub_230AFA5A0(uint64_t a1)
{
  return sub_230AFA864(0.93, 0.93, 0.93, a1, &qword_255EA17F0);
}

uint64_t static PeopleWidgetConstants.locationGradientColor2.getter()
{
  return sub_230AFA350(&qword_255EA12B8);
}

uint64_t sub_230AFA5D8(uint64_t a1)
{
  return sub_230AFA864(0.643137255, 0.858823529, 0.909803922, a1, &qword_255EA17F8);
}

uint64_t static PeopleWidgetConstants.locationGradientColor1.getter()
{
  return sub_230AFA350(&qword_255EA12C0);
}

uint64_t sub_230AFA618(uint64_t a1)
{
  return sub_230AFA864(0.156862745, 0.274509804, 1.0, a1, &qword_255EA1800);
}

uint64_t static PeopleWidgetConstants.locationColor.getter()
{
  return sub_230AFA350(&qword_255EA12C8);
}

uint64_t sub_230AFA654()
{
  uint64_t result;

  result = _s6People19MessagePersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0();
  qword_255EA1808 = result;
  return result;
}

uint64_t static PeopleWidgetConstants.onDemandDowntimeForegroundColor.getter()
{
  return sub_230AFA350(&qword_255EA12D0);
}

uint64_t sub_230AFA68C()
{
  uint64_t result;

  result = _s6People24AvailabilityPersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0();
  qword_255EA1810 = result;
  return result;
}

uint64_t static PeopleWidgetConstants.onDemandGradientColor1.getter()
{
  return sub_230AFA350(&qword_255EA12D8);
}

uint64_t sub_230AFA6C4(uint64_t a1)
{
  return sub_230AFA864(0.458823529, 0.450980392, 0.898039216, a1, &qword_255EA1818);
}

uint64_t static PeopleWidgetConstants.onDemandGradientColor2.getter()
{
  return sub_230AFA350(&qword_255EA12E0);
}

uint64_t sub_230AFA704(uint64_t a1)
{
  return sub_230AFA864(0.262745098, 0.258823529, 0.639215686, a1, &qword_255EA1820);
}

uint64_t static PeopleWidgetConstants.onDemandShadow.getter()
{
  return sub_230AFA350(&qword_255EA12E8);
}

uint64_t sub_230AFA744(uint64_t a1)
{
  return sub_230AFA864(0.196078431, 0.674509804, 0.901960784, a1, &qword_255EA1828);
}

uint64_t static PeopleWidgetConstants.subscriptionBadgeColor.getter()
{
  return sub_230AFA350(&qword_255EA12F0);
}

uint64_t sub_230AFA784(uint64_t a1)
{
  return sub_230AFA864(0.36, 0.97, 0.47, a1, &qword_255EA1830);
}

uint64_t static PeopleWidgetConstants.phoneGradientColor2.getter()
{
  return sub_230AFA350(&qword_255EA12F8);
}

uint64_t sub_230AFA7C4(uint64_t a1)
{
  return sub_230AFA864(0.2, 0.85, 0.31, a1, &qword_255EA1838);
}

uint64_t static PeopleWidgetConstants.phoneGradientColor1.getter()
{
  return sub_230AFA350(&qword_255EA1300);
}

uint64_t sub_230AFA808(uint64_t a1)
{
  return sub_230AFA864(0.05, 0.75, 0.17, a1, &qword_255EA1840);
}

uint64_t static PeopleWidgetConstants.phoneShadowColor.getter()
{
  return sub_230AFA350(&qword_255EA1308);
}

uint64_t sub_230AFA844(uint64_t a1)
{
  return sub_230AFA864(1.0, 0.203921569, 0.164705882, a1, &qword_255EA1848);
}

uint64_t sub_230AFA864(double a1, double a2, double a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v9 = sub_230B03438();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v12 + 104))(v11, *MEMORY[0x24BDF3C28]);
  result = MEMORY[0x2348BE868](v11, a1, a2, a3, 1.0);
  *a5 = result;
  return result;
}

uint64_t static PeopleWidgetConstants.calendarForegroundColor.getter()
{
  return sub_230AFA350(&qword_255EA1310);
}

float static PeopleWidgetConstants.adjustmentForWidgetSuggester.getter()
{
  return 0.1;
}

uint64_t sub_230AFA938()
{
  uint64_t v0;

  v0 = sub_230B0354C();
  __swift_allocate_value_buffer(v0, qword_255EA1850);
  __swift_project_value_buffer(v0, (uint64_t)qword_255EA1850);
  return sub_230B03540();
}

uint64_t static PeopleWidgetConstants.minimumTimelineRelevance.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_255EA1318 != -1)
    swift_once();
  v2 = sub_230B0354C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_255EA1850);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

ValueMetadata *type metadata accessor for PeopleWidgetConstants()
{
  return &type metadata for PeopleWidgetConstants;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void ContactFetcherProtocol.contactImage(for:locale:)(void *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  unsigned __int8 v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  if (qword_2540E6408 != -1)
    swift_once();
  v6 = _s6People22ContactFetcherProtocolP0A2UIE03getB9ImageData3for4size6locale10Foundation0H0VSgSo9CNContactCSg_So6CGSizeVAD06LocaleD0_ptF_0(a1, a2, *(double *)&xmmword_2540E63F8, *((double *)&xmmword_2540E63F8 + 1));
  if (v7 >> 60 == 15)
  {
    v8 = 0;
    *(_QWORD *)a3 = 1;
    v9 = 0uLL;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_QWORD *)(a3 + 40) = 0;
    v10 = 0uLL;
  }
  else
  {
    ContactImage.init(contactImageData:)(v6, v7, (uint64_t)&v15);
    v11 = v16;
    v12 = v17;
    v13 = v18;
    v14 = v19;
    v9 = v20;
    v10 = v21;
    v8 = v22;
    *(_OWORD *)a3 = v15;
    *(_QWORD *)(a3 + 16) = v11;
    *(_QWORD *)(a3 + 24) = v12;
    *(_QWORD *)(a3 + 32) = v13;
    *(_QWORD *)(a3 + 40) = v14;
  }
  *(_OWORD *)(a3 + 48) = v9;
  *(_OWORD *)(a3 + 64) = v10;
  *(_QWORD *)(a3 + 80) = v8;
}

NSLocaleLanguageDirection __swiftcall Locale.characterDirection(forLanguage:)(Swift::String forLanguage)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  NSLocaleLanguageDirection v5;
  uint64_t v7;

  v1 = sub_230B03084();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_230B0306C();
  v5 = sub_230B03078();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v5;
}

uint64_t sub_230AFAC0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_230B03084();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_230B0306C();
  v4 = sub_230B03078();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t PersonInfo.person.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_230B03324();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t PersonInfo.contactImage.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
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

  v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for PersonInfo() + 20));
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = v3[4];
  v9 = v3[5];
  v10 = v3[6];
  v11 = v3[7];
  v12 = v3[8];
  v13 = v3[9];
  v14 = v3[10];
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  a1[9] = v13;
  a1[10] = v14;
  return sub_230AFAD94(v4);
}

uint64_t type metadata accessor for PersonInfo()
{
  uint64_t result;

  result = qword_2540E64A8;
  if (!qword_2540E64A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_230AFAD94(uint64_t result)
{
  if (result != 1)
    return swift_retain();
  return result;
}

__n128 PersonInfo.init(person:contactImage:)@<Q0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __n128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v13 = *a2;
  v11 = a2[2];
  v12 = a2[1];
  v9 = (__n128)a2[4];
  v10 = a2[3];
  v5 = *((_QWORD *)a2 + 10);
  v6 = sub_230B03324();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  v7 = a3 + *(int *)(type metadata accessor for PersonInfo() + 20);
  *(_OWORD *)v7 = v13;
  *(_OWORD *)(v7 + 16) = v12;
  *(_OWORD *)(v7 + 32) = v11;
  *(_OWORD *)(v7 + 48) = v10;
  result = v9;
  *(__n128 *)(v7 + 64) = v9;
  *(_QWORD *)(v7 + 80) = v5;
  return result;
}

uint64_t static PersonInfo.urlForPerson(personInfo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;

  v4 = sub_230B03324();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1868);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1870);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v22 - v15;
  sub_230AFB08C(a1, (uint64_t)v10);
  v17 = type metadata accessor for PersonInfo();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 48))(v10, 1, v17) == 1)
  {
    sub_230AF9568((uint64_t)v10, &qword_255EA1868);
    v18 = sub_230B03000();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
    sub_230AFB0D4((uint64_t)v10);
    sub_230B0330C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v18 = sub_230B03000();
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(a2, v16, v18);
  }
  sub_230B03318();
  sub_230B03000();
  v20 = *(_QWORD *)(v18 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v14, 1, v18);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(a2, v14, v18);
    return sub_230AF9568((uint64_t)v16, &qword_255EA1870);
  }
  return result;
}

uint64_t sub_230AFB08C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1868);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_230AFB0D4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PersonInfo();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of LocaleProtocol.languageCode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of LocaleProtocol.characterDirection(forLanguage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t *initializeBufferWithCopyOfBuffer for PersonInfo(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
LABEL_6:
    swift_retain();
    return a1;
  }
  v7 = sub_230B03324();
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  if (*(_QWORD *)v10 != 1)
  {
    v14 = *((_QWORD *)v10 + 1);
    *(_QWORD *)v9 = *(_QWORD *)v10;
    *((_QWORD *)v9 + 1) = v14;
    v9[16] = v10[16];
    *((_QWORD *)v9 + 3) = *((_QWORD *)v10 + 3);
    v9[32] = v10[32];
    *(_OWORD *)(v9 + 40) = *(_OWORD *)(v10 + 40);
    *(_OWORD *)(v9 + 56) = *(_OWORD *)(v10 + 56);
    *(_OWORD *)(v9 + 72) = *(_OWORD *)(v10 + 72);
    goto LABEL_6;
  }
  v11 = *((_OWORD *)v10 + 3);
  *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
  *((_OWORD *)v9 + 3) = v11;
  *((_OWORD *)v9 + 4) = *((_OWORD *)v10 + 4);
  *((_QWORD *)v9 + 10) = *((_QWORD *)v10 + 10);
  v12 = *((_OWORD *)v10 + 1);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v12;
  return a1;
}

uint64_t destroy for PersonInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_230B03324();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  result = *(_QWORD *)(a1 + *(int *)(a2 + 20));
  if (result != 1)
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for PersonInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v6 = sub_230B03324();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  if (*(_QWORD *)v9 == 1)
  {
    v10 = *(_OWORD *)(v9 + 48);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v8 + 48) = v10;
    *(_OWORD *)(v8 + 64) = *(_OWORD *)(v9 + 64);
    *(_QWORD *)(v8 + 80) = *(_QWORD *)(v9 + 80);
    v11 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v11;
  }
  else
  {
    v12 = *(_QWORD *)(v9 + 8);
    *(_QWORD *)v8 = *(_QWORD *)v9;
    *(_QWORD *)(v8 + 8) = v12;
    *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
    *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
    *(_BYTE *)(v8 + 32) = *(_BYTE *)(v9 + 32);
    *(_OWORD *)(v8 + 40) = *(_OWORD *)(v9 + 40);
    *(_OWORD *)(v8 + 56) = *(_OWORD *)(v9 + 56);
    *(_OWORD *)(v8 + 72) = *(_OWORD *)(v9 + 72);
    swift_retain();
  }
  return a1;
}

uint64_t assignWithCopy for PersonInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v6 = sub_230B03324();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7);
  if (*(_QWORD *)(a1 + v7) == 1)
  {
    if (v10 == 1)
    {
      v11 = *(_OWORD *)(v9 + 16);
      *(_OWORD *)v8 = *(_OWORD *)v9;
      *(_OWORD *)(v8 + 16) = v11;
      v12 = *(_OWORD *)(v9 + 32);
      v13 = *(_OWORD *)(v9 + 48);
      v14 = *(_OWORD *)(v9 + 64);
      *(_QWORD *)(v8 + 80) = *(_QWORD *)(v9 + 80);
      *(_OWORD *)(v8 + 48) = v13;
      *(_OWORD *)(v8 + 64) = v14;
      *(_OWORD *)(v8 + 32) = v12;
    }
    else
    {
      *(_QWORD *)v8 = v10;
      v19 = *(_QWORD *)(v9 + 8);
      *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
      *(_QWORD *)(v8 + 8) = v19;
      v20 = *(_QWORD *)(v9 + 24);
      *(_BYTE *)(v8 + 32) = *(_BYTE *)(v9 + 32);
      *(_QWORD *)(v8 + 24) = v20;
      v21 = *(_OWORD *)(v9 + 40);
      *(_OWORD *)(v8 + 56) = *(_OWORD *)(v9 + 56);
      *(_OWORD *)(v8 + 40) = v21;
      *(_OWORD *)(v8 + 72) = *(_OWORD *)(v9 + 72);
      swift_retain();
    }
  }
  else if (v10 == 1)
  {
    sub_230AFB4A0(a1 + v7);
    v15 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v15;
    v17 = *(_OWORD *)(v9 + 48);
    v16 = *(_OWORD *)(v9 + 64);
    v18 = *(_OWORD *)(v9 + 32);
    *(_QWORD *)(v8 + 80) = *(_QWORD *)(v9 + 80);
    *(_OWORD *)(v8 + 48) = v17;
    *(_OWORD *)(v8 + 64) = v16;
    *(_OWORD *)(v8 + 32) = v18;
  }
  else
  {
    *(_QWORD *)v8 = v10;
    swift_retain();
    swift_release();
    v22 = *(_QWORD *)(v9 + 8);
    *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
    *(_QWORD *)(v8 + 8) = v22;
    v23 = *(_QWORD *)(v9 + 24);
    *(_BYTE *)(v8 + 32) = *(_BYTE *)(v9 + 32);
    *(_QWORD *)(v8 + 24) = v23;
    *(_QWORD *)(v8 + 40) = *(_QWORD *)(v9 + 40);
    *(_QWORD *)(v8 + 48) = *(_QWORD *)(v9 + 48);
    *(_QWORD *)(v8 + 56) = *(_QWORD *)(v9 + 56);
    *(_QWORD *)(v8 + 64) = *(_QWORD *)(v9 + 64);
    *(_QWORD *)(v8 + 72) = *(_QWORD *)(v9 + 72);
    *(_QWORD *)(v8 + 80) = *(_QWORD *)(v9 + 80);
  }
  return a1;
}

uint64_t sub_230AFB4A0(uint64_t a1)
{
  destroy for ContactImage();
  return a1;
}

uint64_t initializeWithTake for PersonInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v6 = sub_230B03324();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  *(_OWORD *)(v8 + 48) = v10;
  *(_OWORD *)(v8 + 64) = *(_OWORD *)(v9 + 64);
  *(_QWORD *)(v8 + 80) = *(_QWORD *)(v9 + 80);
  v11 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v11;
  return a1;
}

uint64_t assignWithTake for PersonInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v6 = sub_230B03324();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  if (*(_QWORD *)(a1 + v7) != 1)
  {
    if (*(_QWORD *)v9 != 1)
    {
      *(_QWORD *)v8 = *(_QWORD *)v9;
      swift_release();
      *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
      *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
      *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
      *(_BYTE *)(v8 + 32) = *(_BYTE *)(v9 + 32);
      *(_OWORD *)(v8 + 40) = *(_OWORD *)(v9 + 40);
      *(_OWORD *)(v8 + 56) = *(_OWORD *)(v9 + 56);
      *(_OWORD *)(v8 + 72) = *(_OWORD *)(v9 + 72);
      return a1;
    }
    sub_230AFB4A0(v8);
  }
  v10 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  *(_OWORD *)(v8 + 48) = v10;
  *(_OWORD *)(v8 + 64) = *(_OWORD *)(v9 + 64);
  *(_QWORD *)(v8 + 80) = *(_QWORD *)(v9 + 80);
  v11 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v11;
  return a1;
}

uint64_t getEnumTagSinglePayload for PersonInfo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_230AFB63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_230B03324();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return ((_DWORD)v9 - 1) & ~(((int)v9 - 1) >> 31);
}

uint64_t storeEnumTagSinglePayload for PersonInfo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_230AFB6C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_230B03324();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 + 1);
  return result;
}

uint64_t sub_230AFB740()
{
  uint64_t result;
  unint64_t v1;

  result = sub_230B03324();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t PersonStatusSet.badge.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_230AF9524(v1, a1, &qword_2540E6410);
}

uint64_t PersonStatusSet.text.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_230AF9524(v1 + 40, a1, &qword_255EA1878);
}

uint64_t PersonStatusSet.additionalBadges.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PersonStatusSet.init(badge:text:additionalBadges:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;

  sub_230AFF00C(a1, a4, &qword_2540E6410);
  result = sub_230AFF00C(a2, a4 + 40, &qword_255EA1878);
  *(_QWORD *)(a4 + 80) = a3;
  return result;
}

uint64_t sub_230AFB854@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t result;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint8_t *v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t *v37;
  char *v38;
  char v39;
  BOOL v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  unsigned int *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  void (*v59)(char *, uint64_t, uint64_t);
  uint64_t v60;
  char v61;
  char *v62;
  NSObject *v63;
  os_log_type_t v64;
  int v65;
  uint8_t *v66;
  _QWORD *v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  _QWORD *v73;
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  char *v82;
  int64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  char *v98;
  NSObject *v99;
  os_log_type_t v100;
  uint8_t *v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  uint64_t *v111;
  _BYTE *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint8_t *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  char *v126;
  _QWORD *v127;
  char *v128;
  uint64_t v129;
  void (*v130)(char *, uint64_t);
  uint64_t v131[5];
  char *v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  uint64_t v141;
  __int128 v142;
  __int128 v143;
  uint64_t v144;
  __int128 v145;
  _BYTE v146[40];
  uint64_t v147;
  _QWORD v148[4];

  v120 = a2;
  v5 = sub_230B030E4();
  v114 = *(_QWORD *)(v5 - 8);
  v115 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v110 = (char *)&v108 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v108 - v8;
  v10 = sub_230B03168();
  v118 = *(_QWORD *)(v10 - 8);
  v119 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v117 = (char *)&v108 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_230B031C8();
  v124 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v122 = (char *)&v108 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (uint64_t *)((char *)&v108 - v16);
  result = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v108 - v19;
  v21 = *(char **)(a1 + 16);
  if (!v21)
  {
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_QWORD *)(a3 + 80) = MEMORY[0x24BEE4AF8];
    return result;
  }
  v109 = v9;
  v113 = a3;
  v22 = a1 + 32;
  sub_230AFA120(a1 + 32, (uint64_t)v148);
  v145 = xmmword_230B03B10;
  v112 = v146;
  sub_230AFA120((uint64_t)v148, (uint64_t)v146);
  v111 = &v147;
  v116 = a1;
  swift_bridgeObjectRetain();
  v23 = 0;
  v129 = v12;
  v125 = v21;
  v123 = a1 + 32;
  while (1)
  {
    v126 = v23;
    sub_230AFA120(v22 + 40 * (_QWORD)v23, (uint64_t)&v142);
    __swift_project_boxed_opaque_existential_1(v148, v148[3]);
    v24 = sub_230B031E0();
    __swift_project_boxed_opaque_existential_1(&v142, *((uint64_t *)&v143 + 1));
    v25 = (uint8_t *)v24;
    sub_230B031EC();
    v26 = *(uint64_t **)(v24 + 16);
    if (v26)
    {
      v27 = v124;
      v28 = (*(unsigned __int8 *)(v124 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v124 + 80);
      v128 = *(char **)(v124 + 16);
      ((void (*)(char *, uint8_t *, uint64_t))v128)((char *)v17, &v25[v28], v12);
      v29 = sub_230AFF050(&qword_255EA1890, MEMORY[0x24BE716B0]);
      swift_bridgeObjectRetain();
      v127 = (_QWORD *)v29;
      v30 = sub_230B03570();
      v31 = *(_QWORD *)(v27 + 8);
      ((void (*)(char *, uint64_t))v31)((char *)v17, v12);
      if ((v30 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v32 = 1;
      }
      else
      {
        if (v26 != (uint64_t *)1)
        {
          v130 = (void (*)(char *, uint64_t))v31;
          v33 = v25;
          v34 = *(_QWORD *)(v124 + 72);
          v121 = v33;
          v35 = &v33[v34 + v28];
          v31 = 1;
          while (1)
          {
            ((void (*)(char *, uint8_t *, uint64_t))v128)((char *)v17, v35, v12);
            v36 = v12;
            v37 = (uint64_t *)(v31 + 1);
            if (__OFADD__(v31, 1))
              break;
            v38 = v20;
            v39 = sub_230B03570();
            v130((char *)v17, v36);
            if ((v39 & 1) != 0)
            {
              swift_bridgeObjectRelease();
              v32 = 1;
              v12 = v129;
              v31 = (uint64_t)v130;
              v20 = v38;
              goto LABEL_16;
            }
            ++v31;
            v35 += v34;
            v40 = v37 == v26;
            v12 = v129;
            v20 = v38;
            if (v40)
            {
              swift_bridgeObjectRelease();
              v32 = 0;
              v31 = (uint64_t)v130;
              v130(v38, v12);
              goto LABEL_17;
            }
          }
          __break(1u);
          goto LABEL_83;
        }
        swift_bridgeObjectRelease();
        v32 = 0;
      }
LABEL_16:
      ((void (*)(char *, uint64_t))v31)(v20, v12);
    }
    else
    {
      v32 = 0;
      v31 = *(_QWORD *)(v124 + 8);
      ((void (*)(char *, uint64_t))v31)(v20, v12);
    }
LABEL_17:
    swift_bridgeObjectRelease();
    v22 = v123;
    if ((v32 & 1) != 0)
      break;
    v23 = v126 + 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v142);
    if (v23 == v125)
    {
      swift_bridgeObjectRelease();
      v26 = v111;
      v111[4] = 0;
      *(_OWORD *)v26 = 0u;
      *((_OWORD *)v26 + 1) = 0u;
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease();
  v26 = v111;
  sub_230AFD1E8(&v142, (uint64_t)v111);
LABEL_22:
  sub_230AF9524((uint64_t)v112, (uint64_t)&v142, &qword_255EA1898);
  sub_230AFF00C((uint64_t)&v142, (uint64_t)&v136, &qword_255EA1898);
  v20 = v125;
  if (!*((_QWORD *)&v137 + 1))
  {
    sub_230AF9568((uint64_t)&v136, &qword_255EA1898);
    v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_28;
  }
  sub_230AFD1E8(&v136, (uint64_t)&v139);
  sub_230AFD1E8(&v139, (uint64_t)&v136);
  v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_83:
    v17 = sub_230AFD470(0, v17[2] + 1, 1, (char *)v17, &qword_255EA18D0, &qword_255EA18A0);
  v42 = v17[2];
  v41 = v17[3];
  if (v42 >= v41 >> 1)
    v17 = sub_230AFD470((_QWORD *)(v41 > 1), v42 + 1, 1, (char *)v17, &qword_255EA18D0, &qword_255EA18A0);
  v17[2] = v42 + 1;
  sub_230AFD1E8(&v136, (uint64_t)&v17[5 * v42 + 4]);
LABEL_28:
  sub_230AF9524((uint64_t)v26, (uint64_t)&v142, &qword_255EA1898);
  sub_230AFF00C((uint64_t)&v142, (uint64_t)&v136, &qword_255EA1898);
  if (*((_QWORD *)&v137 + 1))
  {
    sub_230AFD1E8(&v136, (uint64_t)&v139);
    sub_230AFD1E8(&v139, (uint64_t)&v136);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v17 = sub_230AFD470(0, v17[2] + 1, 1, (char *)v17, &qword_255EA18D0, &qword_255EA18A0);
    v44 = v17[2];
    v43 = v17[3];
    if (v44 >= v43 >> 1)
      v17 = sub_230AFD470((_QWORD *)(v43 > 1), v44 + 1, 1, (char *)v17, &qword_255EA18D0, &qword_255EA18A0);
    v17[2] = v44 + 1;
    sub_230AFD1E8(&v136, (uint64_t)&v17[5 * v44 + 4]);
  }
  else
  {
    sub_230AF9568((uint64_t)&v136, &qword_255EA1898);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1898);
  swift_arrayDestroy();
  v45 = (char *)v17[2];
  v130 = (void (*)(char *, uint64_t))v31;
  v127 = v17;
  v128 = v45;
  if (!v45)
  {
LABEL_45:
    v142 = 0u;
    v143 = 0u;
    v144 = 0;
    v52 = v129;
    goto LABEL_46;
  }
  v46 = (uint64_t)(v17 + 4);
  swift_bridgeObjectRetain();
  v47 = v128;
  while (2)
  {
    sub_230AFA120(v46, (uint64_t)&v142);
    sub_230AFA120((uint64_t)&v142, (uint64_t)&v133);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA18A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA18A8);
    if (!swift_dynamicCast())
    {
      v138 = 0;
      v136 = 0u;
      v137 = 0u;
      sub_230AF9568((uint64_t)&v136, &qword_2540E6410);
      goto LABEL_38;
    }
    v49 = *((_QWORD *)&v137 + 1);
    v48 = v138;
    __swift_project_boxed_opaque_existential_1(&v136, *((uint64_t *)&v137 + 1));
    v50 = v49;
    v20 = v125;
    v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v48 + 48))(v50, v48);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v136);
    swift_release();
    if (!v51)
    {
LABEL_38:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v142);
      v46 += 40;
      if (!--v47)
      {
        v17 = v127;
        swift_bridgeObjectRelease();
        goto LABEL_45;
      }
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  sub_230AFD1E8(&v142, (uint64_t)&v139);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v144 = 0;
    v142 = 0u;
    v143 = 0u;
  }
  v52 = v129;
  v17 = v127;
LABEL_46:
  v53 = (char *)MEMORY[0x24BEE4AF8];
  sub_230AF9524((uint64_t)&v142, (uint64_t)&v136, &qword_2540E6410);
  v54 = (unsigned int *)MEMORY[0x24BE71628];
  if (!*((_QWORD *)&v137 + 1))
  {
    sub_230AF9568((uint64_t)&v136, &qword_2540E6410);
    v56 = *v54;
    v76 = v118;
    v59 = *(void (**)(char *, uint64_t, uint64_t))(v118 + 104);
    goto LABEL_53;
  }
  v55 = v17;
  sub_230AFD1E8(&v136, (uint64_t)&v139);
  v56 = *v54;
  v58 = v117;
  v57 = v118;
  v59 = *(void (**)(char *, uint64_t, uint64_t))(v118 + 104);
  v60 = v119;
  v59(v117, v56, v119);
  v61 = sub_230B032C4();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v60);
  if ((v61 & 1) == 0)
  {
LABEL_52:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v139);
    v76 = v118;
    v53 = (char *)MEMORY[0x24BEE4AF8];
    v17 = v55;
    goto LABEL_53;
  }
  v62 = v109;
  sub_230B03174();
  sub_230AFA120((uint64_t)&v139, (uint64_t)&v136);
  v63 = sub_230B030D8();
  v64 = sub_230B03648();
  v65 = v64;
  if (!os_log_type_enabled(v63, v64))
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v136);
    (*(void (**)(char *, uint64_t))(v114 + 8))(v62, v115);
    goto LABEL_52;
  }
  LODWORD(v126) = v65;
  v66 = (uint8_t *)swift_slowAlloc();
  v124 = swift_slowAlloc();
  *(_QWORD *)&v133 = v124;
  v121 = v66;
  *(_DWORD *)v66 = 136315138;
  v112 = v66 + 4;
  __swift_project_boxed_opaque_existential_1(&v136, *((uint64_t *)&v137 + 1));
  v67 = v55;
  v68 = v122;
  sub_230B031EC();
  sub_230AFF050(&qword_255EA18B8, MEMORY[0x24BE716B8]);
  v69 = sub_230B03708();
  v71 = v70;
  v72 = v68;
  v73 = v67;
  v20 = v125;
  v130(v72, v52);
  v131[0] = sub_230AFD59C(v69, v71, (uint64_t *)&v133);
  sub_230B03684();
  v17 = v73;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v136);
  v74 = v121;
  _os_log_impl(&dword_230AF0000, v63, (os_log_type_t)v126, "Primary badge: %s", v121, 0xCu);
  v75 = v124;
  swift_arrayDestroy();
  MEMORY[0x2348BEE2C](v75, -1, -1);
  MEMORY[0x2348BEE2C](v74, -1, -1);

  (*(void (**)(char *, uint64_t))(v114 + 8))(v109, v115);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v139);
  v76 = v118;
  v53 = (char *)MEMORY[0x24BEE4AF8];
LABEL_53:
  v132 = v53;
  v77 = v117;
  v78 = v56;
  v79 = v119;
  v59(v117, v78, v119);
  v80 = sub_230B032C4();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v77, v79);
  if ((v80 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v81 = v123;
    do
    {
      sub_230AFC7C4(v81, (uint64_t)&v142, (uint64_t)&v132);
      v81 += 40;
      --v20;
    }
    while (v20);
    swift_bridgeObjectRelease();
    v82 = v132;
    v83 = *((_QWORD *)v132 + 2);
    if (v83)
    {
      *(_QWORD *)&v136 = v53;
      swift_bridgeObjectRetain();
      sub_230AFDC60(0, v83, 0);
      v126 = v82;
      v84 = (uint64_t)(v82 + 32);
      v85 = MEMORY[0x24BE716B8];
      do
      {
        sub_230AFA120(v84, (uint64_t)&v139);
        __swift_project_boxed_opaque_existential_1(&v139, *((uint64_t *)&v140 + 1));
        v86 = v122;
        sub_230B031EC();
        sub_230AFF050(&qword_255EA18B8, v85);
        v87 = v129;
        v88 = sub_230B03708();
        v90 = v89;
        v130(v86, v87);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v139);
        v91 = v136;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_230AFDC60(0, *(_QWORD *)(v91 + 16) + 1, 1);
          v91 = v136;
        }
        v93 = *(_QWORD *)(v91 + 16);
        v92 = *(_QWORD *)(v91 + 24);
        if (v93 >= v92 >> 1)
        {
          sub_230AFDC60(v92 > 1, v93 + 1, 1);
          v91 = v136;
        }
        *(_QWORD *)(v91 + 16) = v93 + 1;
        v94 = v91 + 16 * v93;
        *(_QWORD *)(v94 + 32) = v88;
        *(_QWORD *)(v94 + 40) = v90;
        v84 += 40;
        --v83;
      }
      while (v83);
      swift_bridgeObjectRelease();
      *(_QWORD *)&v139 = v91;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255EA18C0);
      sub_230AFF090();
      v95 = sub_230B03564();
      v97 = v96;
      swift_release();
      v98 = v110;
      sub_230B03174();
      swift_bridgeObjectRetain();
      v99 = sub_230B030D8();
      v100 = sub_230B03648();
      if (os_log_type_enabled(v99, v100))
      {
        v101 = (uint8_t *)swift_slowAlloc();
        v102 = swift_slowAlloc();
        *(_QWORD *)&v139 = v102;
        *(_DWORD *)v101 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)&v136 = sub_230AFD59C(v95, v97, (uint64_t *)&v139);
        sub_230B03684();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_230AF0000, v99, v100, "Other badges: %s", v101, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348BEE2C](v102, -1, -1);
        MEMORY[0x2348BEE2C](v101, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v114 + 8))(v98, v115);
      v17 = v127;
    }
  }
  v103 = v128;
  if (v128)
  {
    v104 = (uint64_t)(v17 + 4);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_230AFA120(v104, (uint64_t)&v139);
      sub_230AFA120((uint64_t)&v139, (uint64_t)v131);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255EA18A0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255EA18B0);
      if (swift_dynamicCast())
      {
        __swift_project_boxed_opaque_existential_1(&v133, *((uint64_t *)&v134 + 1));
        sub_230B031D4();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v133);
      }
      else
      {
        v135 = 0;
        v133 = 0u;
        v134 = 0u;
        sub_230AF9568((uint64_t)&v133, &qword_255EA1878);
      }
      sub_230B035C4();
      v106 = v105;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v106)
        break;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v139);
      v104 += 40;
      if (!--v103)
      {
        swift_bridgeObjectRelease();
        goto LABEL_75;
      }
    }
    swift_bridgeObjectRelease();
    sub_230AFD1E8(&v139, (uint64_t)&v136);
  }
  else
  {
LABEL_75:
    v138 = 0;
    v136 = 0u;
    v137 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v137 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA18A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA18B0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      v141 = 0;
      v139 = 0u;
      v140 = 0u;
    }
  }
  else
  {
    sub_230AF9568((uint64_t)&v136, &qword_255EA1898);
    v139 = 0u;
    v140 = 0u;
    v141 = 0;
  }
  v107 = v113;
  sub_230AF9524((uint64_t)&v142, v113, &qword_2540E6410);
  sub_230AF9524((uint64_t)&v139, v107 + 40, &qword_255EA1878);
  *(_QWORD *)(v107 + 80) = v132;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v148);
  sub_230AF9568((uint64_t)&v139, &qword_255EA1878);
  swift_bridgeObjectRelease();
  return sub_230AF9568((uint64_t)&v142, &qword_2540E6410);
}

uint64_t sub_230AFC7C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  int v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  char *v32;
  _QWORD *v33;
  unint64_t v34;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v36;
  unint64_t v37;
  _QWORD v38[2];
  char *v39;
  uint64_t v40;
  __int128 v41[2];
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  _QWORD v45[3];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v48 = a2;
  v6 = sub_230B031C8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v39 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540E63F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540E63E8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v40 = (uint64_t)v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v38 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v38 - v18;
  sub_230AFA120(a1, (uint64_t)&v43);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA18A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA18A8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v42 = 0;
    memset(v41, 0, sizeof(v41));
    return sub_230AF9568((uint64_t)v41, &qword_2540E6410);
  }
  v38[0] = a3;
  v38[1] = v3;
  sub_230AFD1E8(v41, (uint64_t)v45);
  v20 = v46;
  v21 = v47;
  __swift_project_boxed_opaque_existential_1(v45, v46);
  v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 48))(v20, v21);
  swift_release();
  if (v22)
  {
    __swift_project_boxed_opaque_existential_1(v45, v46);
    sub_230B031EC();
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v23(v19, 0, 1, v6);
    sub_230AF9524(v48, (uint64_t)&v43, &qword_2540E6410);
    if (v44)
    {
      __swift_project_boxed_opaque_existential_1(&v43, v44);
      sub_230B031EC();
      v23(v17, 0, 1, v6);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v43);
    }
    else
    {
      sub_230AF9568((uint64_t)&v43, &qword_2540E6410);
      v23(v17, 1, 1, v6);
    }
    v25 = (uint64_t)&v11[*(int *)(v9 + 48)];
    sub_230AF9524((uint64_t)v19, (uint64_t)v11, &qword_2540E63E8);
    sub_230AF9524((uint64_t)v17, v25, &qword_2540E63E8);
    v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
    v27 = v26(v11, 1, v6);
    v28 = v38[0];
    if (v27 == 1)
    {
      sub_230AF9568((uint64_t)v17, &qword_2540E63E8);
      sub_230AF9568((uint64_t)v19, &qword_2540E63E8);
      if (v26((char *)v25, 1, v6) == 1)
      {
        sub_230AF9568((uint64_t)v11, &qword_2540E63E8);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
      }
    }
    else
    {
      v29 = v40;
      sub_230AF9524((uint64_t)v11, v40, &qword_2540E63E8);
      if (v26((char *)v25, 1, v6) != 1)
      {
        v30 = v39;
        (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v39, v25, v6);
        sub_230AFF050(&qword_255EA1890, MEMORY[0x24BE716B0]);
        LODWORD(v48) = sub_230B03570();
        v31 = *(void (**)(char *, uint64_t))(v7 + 8);
        v32 = v30;
        v28 = v38[0];
        v31(v32, v6);
        sub_230AF9568((uint64_t)v17, &qword_2540E63E8);
        sub_230AF9568((uint64_t)v19, &qword_2540E63E8);
        v31((char *)v29, v6);
        sub_230AF9568((uint64_t)v11, &qword_2540E63E8);
        if ((v48 & 1) != 0)
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
LABEL_14:
        v33 = *(_QWORD **)v28;
        v34 = *(_QWORD *)(*(_QWORD *)v28 + 16);
        if (v34 <= 1)
        {
          sub_230AFA120((uint64_t)v45, (uint64_t)&v43);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)v28 = v33;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v33 = sub_230AFD470(0, v34 + 1, 1, v33, &qword_255EA18E0, &qword_255EA18A8);
            *(_QWORD *)v28 = v33;
          }
          v37 = v33[2];
          v36 = v33[3];
          if (v37 >= v36 >> 1)
          {
            v33 = sub_230AFD470((_QWORD *)(v36 > 1), v37 + 1, 1, v33, &qword_255EA18E0, &qword_255EA18A8);
            *(_QWORD *)v28 = v33;
          }
          v33[2] = v37 + 1;
          sub_230AFD1E8(&v43, (uint64_t)&v33[5 * v37 + 4]);
        }
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
      }
      sub_230AF9568((uint64_t)v17, &qword_2540E63E8);
      sub_230AF9568((uint64_t)v19, &qword_2540E63E8);
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v29, v6);
    }
    sub_230AF9568((uint64_t)v11, &qword_2540E63F0);
    goto LABEL_14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
}

uint64_t static StatusCompatiblePicker.statusForDisplay(from:featureFlags:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *boxed_opaque_existential_1;
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
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  int64_t v36;
  uint64_t result;
  int64_t v38;
  unint64_t v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  int64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[24];
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  _OWORD v57[2];
  _OWORD v58[3];
  uint64_t v59;

  v6 = sub_230B031C8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230AFB854(a1, a2, (uint64_t)v57);
  sub_230AF9524((uint64_t)v57, (uint64_t)&v51, &qword_2540E6410);
  if (v52)
  {
    sub_230AFD1E8(&v51, (uint64_t)&v54);
    __swift_project_boxed_opaque_existential_1(&v54, v55);
    sub_230B031EC();
    v10 = v55;
    v11 = v56;
    v12 = __swift_project_boxed_opaque_existential_1(&v54, v55);
    v52 = v10;
    v53 = *(_QWORD *)(v11 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v51);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(boxed_opaque_existential_1, v12, v10);
    sub_230AFD1E8(&v51, (uint64_t)v48);
    v14 = MEMORY[0x24BEE4B00];
    LOBYTE(v12) = swift_isUniquelyReferenced_nonNull_native();
    v47 = v14;
    v15 = v49;
    v16 = v50;
    v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v48, v49);
    MEMORY[0x24BDAC7A8](v17);
    v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v20 + 16))(v19);
    sub_230AFE888((uint64_t)v19, (uint64_t)v9, (char)v12, &v47, v15, v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    v21 = v47;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
  }
  else
  {
    sub_230AF9568((uint64_t)&v51, &qword_2540E6410);
    v21 = MEMORY[0x24BEE4B00];
  }
  sub_230AF9524((uint64_t)v58 + 8, (uint64_t)&v51, &qword_255EA1878);
  if (v52)
  {
    sub_230AFD1E8(&v51, (uint64_t)&v54);
    __swift_project_boxed_opaque_existential_1(&v54, v55);
    sub_230B031EC();
    v22 = v55;
    v23 = v56;
    v24 = __swift_project_boxed_opaque_existential_1(&v54, v55);
    v52 = v22;
    v53 = *(_QWORD *)(v23 + 8);
    v25 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v51);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v25, v24, v22);
    sub_230AFD1E8(&v51, (uint64_t)v48);
    LOBYTE(v22) = swift_isUniquelyReferenced_nonNull_native();
    v47 = v21;
    v26 = v49;
    v27 = v50;
    v28 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v48, v49);
    MEMORY[0x24BDAC7A8](v28);
    v30 = (char *)&v46 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v31 + 16))(v30);
    sub_230AFE888((uint64_t)v30, (uint64_t)v9, v22, &v47, v26, v27);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    v21 = v47;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
  }
  else
  {
    sub_230AF9568((uint64_t)&v51, &qword_255EA1878);
  }
  v32 = v21 + 64;
  v33 = 1 << *(_BYTE *)(v21 + 32);
  v34 = -1;
  if (v33 < 64)
    v34 = ~(-1 << v33);
  v35 = v34 & *(_QWORD *)(v21 + 64);
  v36 = (unint64_t)(v33 + 63) >> 6;
  result = swift_bridgeObjectRetain_n();
  v38 = 0;
  while (1)
  {
    if (v35)
    {
      v39 = __clz(__rbit64(v35));
      v35 &= v35 - 1;
      v40 = v39 | (v38 << 6);
      goto LABEL_11;
    }
    v41 = v38 + 1;
    if (__OFADD__(v38, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v41 >= v36)
      goto LABEL_31;
    v42 = *(_QWORD *)(v32 + 8 * v41);
    ++v38;
    if (!v42)
    {
      v38 = v41 + 1;
      if (v41 + 1 >= v36)
        goto LABEL_31;
      v42 = *(_QWORD *)(v32 + 8 * v38);
      if (!v42)
      {
        v38 = v41 + 2;
        if (v41 + 2 >= v36)
          goto LABEL_31;
        v42 = *(_QWORD *)(v32 + 8 * v38);
        if (!v42)
        {
          v38 = v41 + 3;
          if (v41 + 3 >= v36)
            goto LABEL_31;
          v42 = *(_QWORD *)(v32 + 8 * v38);
          if (!v42)
          {
            v38 = v41 + 4;
            if (v41 + 4 >= v36)
              goto LABEL_31;
            v42 = *(_QWORD *)(v32 + 8 * v38);
            if (!v42)
              break;
          }
        }
      }
    }
LABEL_30:
    v35 = (v42 - 1) & v42;
    v40 = __clz(__rbit64(v42)) + (v38 << 6);
LABEL_11:
    sub_230AFA120(*(_QWORD *)(v21 + 56) + 40 * v40, (uint64_t)&v54);
    sub_230AFD1E8(&v54, (uint64_t)&v51);
    sub_230B03198();
    sub_230B0318C();
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v51);
  }
  v43 = v41 + 5;
  if (v43 >= v36)
  {
LABEL_31:
    swift_release();
    swift_bridgeObjectRelease();
    v44 = v58[1];
    *(_OWORD *)(a3 + 32) = v58[0];
    *(_OWORD *)(a3 + 48) = v44;
    *(_OWORD *)(a3 + 64) = v58[2];
    *(_QWORD *)(a3 + 80) = v59;
    v45 = v57[1];
    *(_OWORD *)a3 = v57[0];
    *(_OWORD *)(a3 + 16) = v45;
    return swift_bridgeObjectRelease();
  }
  v42 = *(_QWORD *)(v32 + 8 * v43);
  if (v42)
  {
    v38 = v43;
    goto LABEL_30;
  }
  while (1)
  {
    v38 = v43 + 1;
    if (__OFADD__(v43, 1))
      break;
    if (v38 >= v36)
      goto LABEL_31;
    v42 = *(_QWORD *)(v32 + 8 * v38);
    ++v43;
    if (v42)
      goto LABEL_30;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_230AFD1E8(__int128 *a1, uint64_t a2)
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

uint64_t sub_230AFD23C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_230AFD264(a1, a2, a3, a4, &qword_255EA18F0, type metadata accessor for ActionPoint);
}

uint64_t sub_230AFD250(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_230AFD264(a1, a2, a3, a4, &qword_255EA18E8, type metadata accessor for SignalPoint);
}

uint64_t sub_230AFD264(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_230B036CC();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_230AFF0DC(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

_QWORD *sub_230AFD470(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  _QWORD *v15;

  v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    v10 = a2;
    goto LABEL_8;
  }
  v9 = a4[3];
  v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2)
    goto LABEL_8;
  if (v10 + 0x4000000000000000 >= 0)
  {
    v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v10 = a2;
LABEL_8:
    v11 = a4[2];
    if (v10 <= v11)
      v12 = a4[2];
    else
      v12 = v10;
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v13 = (_QWORD *)swift_allocObject();
      v14 = _swift_stdlib_malloc_size(v13);
      v13[2] = v11;
      v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
      v15 = v13 + 4;
      if ((v8 & 1) != 0)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[5 * v11 + 4])
          memmove(v15, a4 + 4, 40 * v11);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v15 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_230AFF1F8(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_230AFD59C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_230AFD66C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_230AF9404((uint64_t)v12, *a3);
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
      sub_230AF9404((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_230AFD66C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_230B03690();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_230AFD824(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_230B036C0();
  if (!v8)
  {
    sub_230B036CC();
    __break(1u);
LABEL_17:
    result = sub_230B036F0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_230AFD824(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_230AFD8B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_230AFDA90(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_230AFDA90(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_230AFD8B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_230AFDA2C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_230B036B4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_230B036CC();
      __break(1u);
LABEL_10:
      v2 = sub_230B035DC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_230B036F0();
    __break(1u);
LABEL_14:
    result = sub_230B036CC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_230AFDA2C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA18D8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_230AFDA90(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA18D8);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_230B036F0();
  __break(1u);
  return result;
}

uint64_t sub_230AFDBDC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_230AFDC7C(a1, a2, a3, (_QWORD *)*v3, &qword_255EA18F0, type metadata accessor for ActionPoint);
  *v3 = result;
  return result;
}

uint64_t sub_230AFDC08(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_230AFDC7C(a1, a2, a3, (_QWORD *)*v3, &qword_255EA18E8, type metadata accessor for SignalPoint);
  *v3 = result;
  return result;
}

uint64_t sub_230AFDC34(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_230AFDC7C(a1, a2, a3, (_QWORD *)*v3, &qword_255EA16D0, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
  *v3 = result;
  return result;
}

uint64_t sub_230AFDC60(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_230AFDE5C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_230AFDC7C(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_230B036F0();
  __break(1u);
  return result;
}

uint64_t sub_230AFDE5C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1348);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_230B036F0();
  __break(1u);
  return result;
}

unint64_t sub_230AFDFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_230B0372C();
  sub_230B035A0();
  v4 = sub_230B03744();
  return sub_230AFE08C(a1, a2, v4);
}

unint64_t sub_230AFE028(uint64_t a1)
{
  uint64_t v2;

  sub_230B031C8();
  sub_230AFF050(&qword_255EA1888, MEMORY[0x24BE716A8]);
  v2 = sub_230B03558();
  return sub_230AFE16C(a1, v2);
}

unint64_t sub_230AFE08C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_230B03714() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_230B03714() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_230AFE16C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_230B031C8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_230AFF050(&qword_255EA1890, MEMORY[0x24BE716B0]);
      v14 = sub_230B03570();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_230AFE2A4(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  int v40;
  __int128 v41[2];

  v3 = v2;
  v5 = sub_230B031C8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1880);
  v40 = a2;
  v10 = sub_230B036E4();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v39 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v37 = v2;
  v38 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  while (1)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v38)
      break;
    v23 = v39;
    v24 = v39[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v38)
        goto LABEL_34;
      v24 = v39[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v38)
        {
LABEL_34:
          swift_release();
          v3 = v37;
          if ((v40 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v39[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v38)
              goto LABEL_34;
            v24 = v39[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v40 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      sub_230AFD1E8((__int128 *)(*(_QWORD *)(v9 + 56) + 40 * v21), (uint64_t)v41);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      sub_230AFA120(*(_QWORD *)(v9 + 56) + 40 * v21, (uint64_t)v41);
    }
    sub_230AFF050(&qword_255EA1888, MEMORY[0x24BE716A8]);
    result = sub_230B03558();
    v28 = -1 << *(_BYTE *)(v11 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v16 + 8 * v30);
      }
      while (v34 == -1);
      v19 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    result = sub_230AFD1E8(v41, *(_QWORD *)(v11 + 56) + 40 * v19);
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v37;
  v23 = v39;
  if ((v40 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v9 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

void *sub_230AFE648()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  __int128 v27[2];

  v1 = v0;
  v2 = sub_230B031C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1880);
  v6 = *v0;
  v7 = sub_230B036D8();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v26 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v21 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v26 + 8 * v21);
    ++v12;
    if (!v22)
    {
      v12 = v21 + 1;
      if (v21 + 1 >= v16)
        goto LABEL_26;
      v22 = *(_QWORD *)(v26 + 8 * v12);
      if (!v22)
        break;
    }
LABEL_25:
    v15 = (v22 - 1) & v22;
    v18 = __clz(__rbit64(v22)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    v20 = 40 * v18;
    sub_230AFA120(*(_QWORD *)(v6 + 56) + v20, (uint64_t)v27);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v19, v5, v2);
    result = (void *)sub_230AFD1E8(v27, *(_QWORD *)(v8 + 56) + v20);
  }
  v23 = v21 + 2;
  if (v23 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v22 = *(_QWORD *)(v26 + 8 * v23);
  if (v22)
  {
    v12 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v26 + 8 * v12);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_230AFE888(uint64_t a1, uint64_t a2, char a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t result;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v12 = sub_230B031C8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = a5;
  v37 = a6;
  v34 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v35);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(boxed_opaque_existential_1, a1, a5);
  v17 = (_QWORD *)*a4;
  v19 = sub_230AFE028(a2);
  v20 = v17[2];
  v21 = (v18 & 1) == 0;
  v22 = v20 + v21;
  if (__OFADD__(v20, v21))
  {
    __break(1u);
    goto LABEL_14;
  }
  v23 = v18;
  v24 = v17[3];
  if (v24 >= v22 && (a3 & 1) != 0)
  {
LABEL_7:
    v25 = (_QWORD *)*a4;
    if ((v23 & 1) != 0)
    {
LABEL_8:
      v26 = v25[7] + 40 * v19;
      __swift_destroy_boxed_opaque_existential_1(v26);
      return sub_230AFD1E8(&v35, v26);
    }
    goto LABEL_11;
  }
  if (v24 >= v22 && (a3 & 1) == 0)
  {
    sub_230AFE648();
    goto LABEL_7;
  }
  sub_230AFE2A4(v22, a3 & 1);
  v28 = sub_230AFE028(a2);
  if ((v23 & 1) != (v29 & 1))
  {
LABEL_14:
    result = sub_230B03720();
    __break(1u);
    return result;
  }
  v19 = v28;
  v25 = (_QWORD *)*a4;
  if ((v23 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a2, v12);
  v30 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v35, v36);
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)&v34 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v33 + 16))(v32);
  sub_230AFEF3C(v19, (uint64_t)v15, (uint64_t)v32, v25, a5, v34);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t destroy for PersonStatusSet(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  if (*(_QWORD *)(a1 + 64))
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PersonStatusSet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  v7 = (_OWORD *)(a1 + 40);
  v8 = (_OWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 64);
  if (v9)
  {
    v10 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 64) = v9;
    *(_QWORD *)(a1 + 72) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }
  else
  {
    v11 = *(_OWORD *)(a2 + 56);
    *v7 = *v8;
    *(_OWORD *)(a1 + 56) = v11;
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  }
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PersonStatusSet(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  v4 = *((_QWORD *)a2 + 3);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else if (v4)
  {
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
    goto LABEL_8;
  }
  v5 = *a2;
  v6 = a2[1];
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  *(_OWORD *)a1 = v5;
  *(_OWORD *)(a1 + 16) = v6;
LABEL_8:
  v7 = *((_QWORD *)a2 + 8);
  if (!*(_QWORD *)(a1 + 64))
  {
    if (v7)
    {
      *(_QWORD *)(a1 + 64) = v7;
      *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, (uint64_t)a2 + 40);
      goto LABEL_15;
    }
LABEL_14:
    v8 = *(__int128 *)((char *)a2 + 40);
    v9 = *(__int128 *)((char *)a2 + 56);
    *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
    *(_OWORD *)(a1 + 40) = v8;
    *(_OWORD *)(a1 + 56) = v9;
    goto LABEL_15;
  }
  if (!v7)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
    goto LABEL_14;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)a2 + 5);
LABEL_15:
  *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

uint64_t assignWithTake for PersonStatusSet(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 64))
    __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PersonStatusSet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 80);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PersonStatusSet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 80) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PersonStatusSet()
{
  return &type metadata for PersonStatusSet;
}

ValueMetadata *type metadata accessor for StatusCompatiblePicker()
{
  return &type metadata for StatusCompatiblePicker;
}

uint64_t sub_230AFEF3C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v19 = a5;
  v20 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(boxed_opaque_existential_1, a3, a5);
  a4[(a1 >> 6) + 8] |= 1 << a1;
  v12 = a4[6];
  v13 = sub_230B031C8();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12 + *(_QWORD *)(*(_QWORD *)(v13 - 8) + 72) * a1, a2, v13);
  result = sub_230AFD1E8(&v18, a4[7] + 40 * a1);
  v15 = a4[2];
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (v16)
    __break(1u);
  else
    a4[2] = v17;
  return result;
}

uint64_t sub_230AFF00C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_230AFF050(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_230B031C8();
    result = MEMORY[0x2348BEDC0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_230AFF090()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EA18C8;
  if (!qword_255EA18C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255EA18C0);
    result = MEMORY[0x2348BEDC0](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_255EA18C8);
  }
  return result;
}

uint64_t sub_230AFF0DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_230B036F0();
  __break(1u);
  return result;
}

uint64_t sub_230AFF1F8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v6 = a4 + 40 * a1 + 32;
    v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  result = sub_230B036F0();
  __break(1u);
  return result;
}

UIImage __swiftcall UIImage.crop(relativeTo:)(__C::CGRect relativeTo)
{
  void *v1;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGSize v12;
  id v13;
  id v14;
  CGFloat *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  UIImage result;
  CGAffineTransform v21;
  CGSize v22;
  CGRect v23;
  CGRect v24;

  height = relativeTo.size.height;
  width = relativeTo.size.width;
  y = relativeTo.origin.y;
  x = relativeTo.origin.x;
  objc_msgSend(v1, sel_size);
  v7 = v6;
  v9 = v8;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v10 = CGRectGetWidth(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v11 = CGRectGetHeight(v24);
  CGAffineTransformMakeScale(&v21, v10, v11);
  v22.width = v7;
  v22.height = v9;
  v12 = CGSizeApplyAffineTransform(v22, &v21);
  sub_230AFF778();
  v13 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultFormat);
  objc_msgSend(v1, sel_scale);
  objc_msgSend(v13, sel_setScale_);
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD618]), sel_initWithSize_format_, v13, v12.width, v12.height);

  v15 = (CGFloat *)swift_allocObject();
  v15[2] = x;
  v15[3] = y;
  v15[4] = width;
  v15[5] = height;
  *((_QWORD *)v15 + 6) = v1;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_230AFF86C;
  *(_QWORD *)(v16 + 24) = v15;
  *(_QWORD *)&v21.tx = sub_230AFF88C;
  *(_QWORD *)&v21.ty = v16;
  *(_QWORD *)&v21.a = MEMORY[0x24BDAC760];
  *(_QWORD *)&v21.b = 1107296256;
  *(_QWORD *)&v21.c = sub_230AFF8AC;
  *(_QWORD *)&v21.d = &block_descriptor;
  v17 = _Block_copy(&v21);
  v18 = v1;
  swift_retain();
  swift_release();
  v19 = objc_msgSend(v14, sel_imageWithActions_, v17);

  _Block_release(v17);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result.super.isa = (Class)swift_release();
  if ((v14 & 1) == 0)
    return (UIImage)v19;
  __break(1u);
  return result;
}

UIImage __swiftcall UIImage.resize(to:)(CGSize to)
{
  void *v1;
  double height;
  double width;
  id v4;
  id v5;
  double *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  UIImage result;
  _QWORD v12[6];

  height = to.height;
  width = to.width;
  sub_230AFF778();
  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultFormat);
  objc_msgSend(v1, sel_scale);
  objc_msgSend(v4, sel_setScale_);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD618]), sel_initWithSize_format_, v4, width, height);

  v6 = (double *)swift_allocObject();
  *((_QWORD *)v6 + 2) = v1;
  v6[3] = width;
  v6[4] = height;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_230AFF91C;
  *(_QWORD *)(v7 + 24) = v6;
  v12[4] = sub_230AFF950;
  v12[5] = v7;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_230AFF8AC;
  v12[3] = &block_descriptor_13;
  v8 = _Block_copy(v12);
  v9 = v1;
  swift_retain();
  swift_release();
  v10 = objc_msgSend(v5, sel_imageWithActions_, v8);

  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result.super.isa = (Class)swift_release();
  if ((v5 & 1) == 0)
    return (UIImage)v10;
  __break(1u);
  return result;
}

UIGraphicsImageRendererFormat __swiftcall UIImage.renderingFormat()()
{
  void *v0;
  id v1;

  sub_230AFF778();
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultFormat);
  objc_msgSend(v0, sel_scale);
  objc_msgSend(v1, sel_setScale_);
  return (UIGraphicsImageRendererFormat)v1;
}

unint64_t sub_230AFF778()
{
  unint64_t result;

  result = qword_255EA18F8;
  if (!qword_255EA18F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255EA18F8);
  }
  return result;
}

id sub_230AFF7B4(int a1, id a2, double a3, double a4)
{
  double v7;
  CGFloat v8;
  double v9;
  CGPoint v10;
  CGAffineTransform v12;
  CGPoint v13;

  objc_msgSend(a2, sel_size);
  v8 = -(v7 * a3);
  objc_msgSend(a2, sel_size);
  CGAffineTransformMakeTranslation(&v12, v8, -(v9 * a4));
  v13.x = 0.0;
  v13.y = 0.0;
  v10 = CGPointApplyAffineTransform(v13, &v12);
  return objc_msgSend(a2, sel_drawAtPoint_, v10.x, v10.y);
}

uint64_t sub_230AFF848()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_230AFF86C(int a1)
{
  uint64_t v1;

  return sub_230AFF7B4(a1, *(id *)(v1 + 48), *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_230AFF87C()
{
  return swift_deallocObject();
}

uint64_t sub_230AFF88C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_230AFF8AC(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

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

uint64_t sub_230AFF8F8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_230AFF91C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_drawInRect_, 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_230AFF938()
{
  return swift_deallocObject();
}

uint64_t WidgetFamily.chsFamily.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t v9;

  v1 = v0;
  v2 = sub_230B03534();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BDFAED8])
    return 1;
  if (v6 == *MEMORY[0x24BDFAEE0])
    return 2;
  if (v6 == *MEMORY[0x24BDFAED0])
    return 3;
  if (v6 == *MEMORY[0x24BDFAEF8])
    return 4;
  if (v6 != *MEMORY[0x24BDFAF00])
  {
    if (v6 != *MEMORY[0x24BDFAF08] && v6 != *MEMORY[0x24BDFAEF0])
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 1;
  }
  return 10;
}

uint64_t WidgetFamily.analyticSize.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  unsigned int *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  int v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_230B03534();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x24BDFAED8])
  {
    v9 = (unsigned int *)MEMORY[0x24BE71650];
LABEL_7:
    v11 = *v9;
    v12 = sub_230B03180();
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104);
    v14 = a1;
    v15 = v11;
    return v13(v14, v15, v12);
  }
  v10 = v8;
  if (v8 == *MEMORY[0x24BDFAEE0])
  {
    v9 = (unsigned int *)MEMORY[0x24BE71658];
    goto LABEL_7;
  }
  if (v8 == *MEMORY[0x24BDFAED0])
  {
    v9 = (unsigned int *)MEMORY[0x24BE71648];
    goto LABEL_7;
  }
  v17 = *MEMORY[0x24BDFAEF8];
  v12 = sub_230B03180();
  v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104);
  if (v10 != v17)
  {
    v13(a1, *MEMORY[0x24BE71650], v12);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v15 = *MEMORY[0x24BE71660];
  v14 = a1;
  return v13(v14, v15, v12);
}

uint64_t sub_230AFFC10(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x7468676972;
  else
    v3 = 1952867692;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE500000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x7468676972;
  else
    v5 = 1952867692;
  if ((a2 & 1) != 0)
    v6 = 0xE500000000000000;
  else
    v6 = 0xE400000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_230B03714();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_230AFFCA4()
{
  sub_230B0372C();
  sub_230B035A0();
  swift_bridgeObjectRelease();
  return sub_230B03744();
}

uint64_t sub_230AFFD18()
{
  sub_230B035A0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_230AFFD64()
{
  sub_230B0372C();
  sub_230B035A0();
  swift_bridgeObjectRelease();
  return sub_230B03744();
}

double sub_230AFFDD4()
{
  return 0.0;
}

double BadgeStatus.iconOffset.getter()
{
  return 0.0;
}

uint64_t sub_230AFFDEC()
{
  return 0;
}

uint64_t BadgeStatus.useIconAsTextPrefix.getter()
{
  return 0;
}

uint64_t sub_230AFFDFC()
{
  return 0;
}

uint64_t BadgeStatus.accessibilityText.getter()
{
  return 0;
}

uint64_t PositionInLockScreenCircularAccessory.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x7468676972;
  else
    return 1952867692;
}

uint64_t PositionInLockScreenCircularAccessory.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x7468676972;
  else
    return 1952867692;
}

PeopleUI::PositionInLockScreenCircularAccessory_optional __swiftcall PositionInLockScreenCircularAccessory.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  PeopleUI::PositionInLockScreenCircularAccessory_optional result;
  char v5;

  v2 = v1;
  v3 = sub_230B036FC();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

void *static PositionInLockScreenCircularAccessory.allCases.getter()
{
  return &unk_24FED3B10;
}

uint64_t sub_230AFFEE0(char *a1, char *a2)
{
  return sub_230AFFC10(*a1, *a2);
}

uint64_t sub_230AFFEEC()
{
  return sub_230AFFCA4();
}

uint64_t sub_230AFFEF4()
{
  return sub_230AFFD18();
}

uint64_t sub_230AFFEFC()
{
  return sub_230AFFD64();
}

PeopleUI::PositionInLockScreenCircularAccessory_optional sub_230AFFF04(Swift::String *a1)
{
  return PositionInLockScreenCircularAccessory.init(rawValue:)(*a1);
}

uint64_t sub_230AFFF10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PositionInLockScreenCircularAccessory.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_230AFFF34()
{
  sub_230B02F2C();
  return sub_230B03600();
}

uint64_t sub_230AFFF90()
{
  sub_230B02F2C();
  return sub_230B035F4();
}

void sub_230AFFFE0(_QWORD *a1@<X8>)
{
  *a1 = &unk_24FED3B38;
}

uint64_t sub_230AFFFF4()
{
  return sub_230B034D4();
}

uint64_t sub_230B00010()
{
  return sub_230B034D4();
}

uint64_t sub_230B00030()
{
  if (sub_230B03294() < 1)
    return 0;
  else
    return sub_230B034D4();
}

uint64_t LockScreenBadgeStatus.iconForLockScreenCircularAccessory.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 8) + 48))();
}

uint64_t AvailabilityPersonStatus.accessibilityText.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t);
  char v9;
  void (*v10)(char *, uint64_t);
  _QWORD v12[4];

  v0 = sub_230B03270();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BE71788];
  v2 = *(_QWORD *)(v0 - 8);
  v3 = MEMORY[0x24BDAC7A8](v0);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v12 - v6;
  sub_230B032F4();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BE71780], v0);
  sub_230AF911C(&qword_255EA1900, v1, MEMORY[0x24BE71790]);
  sub_230B035E8();
  sub_230B035E8();
  if (v12[2] == v12[0] && v12[3] == v12[1])
  {
    swift_bridgeObjectRelease_n();
    v8 = *(void (**)(char *, uint64_t))(v2 + 8);
    v8(v5, v0);
    v8(v7, v0);
    return 0x4420746F4E206F44;
  }
  v9 = sub_230B03714();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = *(void (**)(char *, uint64_t))(v2 + 8);
  v10(v5, v0);
  v10(v7, v0);
  if ((v9 & 1) != 0)
    return 0x4420746F4E206F44;
  return 0;
}

uint64_t AvailabilityPersonStatus.icon.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t);
  char v9;
  void (*v10)(char *, uint64_t);
  _QWORD v12[4];

  v0 = sub_230B03270();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BE71788];
  v2 = *(_QWORD *)(v0 - 8);
  v3 = MEMORY[0x24BDAC7A8](v0);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v12 - v6;
  sub_230B032F4();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BE71780], v0);
  sub_230AF911C(&qword_255EA1900, v1, MEMORY[0x24BE71790]);
  sub_230B035E8();
  sub_230B035E8();
  if (v12[2] == v12[0] && v12[3] == v12[1])
  {
    swift_bridgeObjectRelease_n();
    v8 = *(void (**)(char *, uint64_t))(v2 + 8);
    v8(v5, v0);
    v8(v7, v0);
    return sub_230B034D4();
  }
  v9 = sub_230B03714();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = *(void (**)(char *, uint64_t))(v2 + 8);
  v10(v5, v0);
  v10(v7, v0);
  if ((v9 & 1) != 0)
    return sub_230B034D4();
  return 0;
}

uint64_t AvailabilityPersonStatus.iconBackground.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t);
  char v9;
  void (*v10)(char *, uint64_t);
  uint64_t v11;
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;

  v0 = sub_230B03270();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BE71788];
  v2 = *(_QWORD *)(v0 - 8);
  v3 = MEMORY[0x24BDAC7A8](v0);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v13 - v6;
  sub_230B032F4();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BE71780], v0);
  sub_230AF911C(&qword_255EA1900, v1, MEMORY[0x24BE71790]);
  sub_230B035E8();
  sub_230B035E8();
  if (v14 == v13[0] && v15 == v13[1])
  {
    swift_bridgeObjectRelease_n();
    v8 = *(void (**)(char *, uint64_t))(v2 + 8);
    v8(v5, v0);
    v8(v7, v0);
  }
  else
  {
    v9 = sub_230B03714();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v10 = *(void (**)(char *, uint64_t))(v2 + 8);
    v10(v5, v0);
    v10(v7, v0);
    if ((v9 & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
      v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_230B03FB0;
      *(_QWORD *)(v11 + 32) = sub_230B03468();
      goto LABEL_9;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_230B03B10;
  if (qword_255EA1268 != -1)
    swift_once();
  *(_QWORD *)(v11 + 32) = qword_255EA17A0;
  swift_retain();
  *(_QWORD *)(v11 + 40) = _s6People19MessagePersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0();
LABEL_9:
  v14 = v11;
  sub_230B03618();
  return v14;
}

double AvailabilityPersonStatus.iconOffset.getter()
{
  return 0.0;
}

double sub_230B00628()
{
  return 0.0;
}

uint64_t AskToBuyRequestPersonStatus.localizedDisplayString.getter()
{
  return sub_230B00C80(MEMORY[0x24BE718D0], MEMORY[0x24BE718C8], 0x7975426F546B7341, 0xE800000000000000);
}

uint64_t AskToBuyRequestPersonStatus.icon.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t v6;

  v0 = sub_230B03654();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B03300();
  v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 != *MEMORY[0x24BE71958]
    && v4 != *MEMORY[0x24BE71960]
    && v4 != *MEMORY[0x24BE71968]
    && v4 != *MEMORY[0x24BE71950])
  {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return sub_230B034E0();
}

uint64_t AskToBuyRequestPersonStatus.iconBackground.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v0 = sub_230B03654();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B03300();
  v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x24BE71958])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_230B03B10;
    if (qword_255EA1298 != -1)
      swift_once();
    *(_QWORD *)(v5 + 32) = qword_255EA17D0;
    v6 = qword_255EA12A0;
    swift_retain();
    if (v6 != -1)
      swift_once();
    v7 = qword_255EA17D8;
LABEL_24:
    *(_QWORD *)(v5 + 40) = v7;
    v15 = v5;
    sub_230B03618();
    v11 = v15;
    goto LABEL_25;
  }
  if (v4 == *MEMORY[0x24BE71960])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_230B03B10;
    if (qword_255EA12A8 != -1)
      swift_once();
    *(_QWORD *)(v5 + 32) = qword_255EA17E0;
    v8 = qword_255EA12B0;
    swift_retain();
    if (v8 != -1)
      swift_once();
    v7 = qword_255EA17E8;
    goto LABEL_24;
  }
  if (v4 == *MEMORY[0x24BE71968])
  {
LABEL_19:
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_230B03B10;
    if (qword_255EA1288 != -1)
      swift_once();
    *(_QWORD *)(v5 + 32) = qword_255EA17C0;
    v12 = qword_255EA1290;
    swift_retain();
    if (v12 != -1)
      swift_once();
    v7 = qword_255EA17C8;
    goto LABEL_24;
  }
  if (v4 != *MEMORY[0x24BE71950])
  {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_230B03B10;
  if (qword_255EA12F0 != -1)
    swift_once();
  v10 = qword_255EA1828;
  *(_QWORD *)(v9 + 32) = qword_255EA1828;
  *(_QWORD *)(v9 + 40) = v10;
  v15 = v9;
  sub_230B03618();
  v11 = v15;
  swift_retain();
LABEL_25:
  swift_retain();
  return v11;
}

uint64_t AskToBuyRequestPersonStatus.iconShadow.getter()
{
  sub_230B026A4();
  return swift_retain();
}

double AskToBuyRequestPersonStatus.iconOffset.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_230B03654();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B03300();
  if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) != *MEMORY[0x24BE71958])
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0.0;
}

uint64_t sub_230B00B90()
{
  sub_230B026A4();
  return swift_retain();
}

double sub_230B00BA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_230B03654();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B03300();
  if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) != *MEMORY[0x24BE71958])
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0.0;
}

uint64_t ScreenTimeRequestPersonStatus.localizedDisplayString.getter()
{
  return sub_230B00C80(MEMORY[0x24BE718F8], MEMORY[0x24BE718F0], 0x69546E6565726353, 0xEA0000000000656DLL);
}

uint64_t sub_230B00C80(void (*a1)(uint64_t), void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v22;
  void (*v23)(uint64_t);

  v22 = a4;
  v23 = a2;
  v5 = sub_230B03168();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_230B03210();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v22 - v15;
  a1(v14);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v16, v9);
  if ((_DWORD)v17 == *MEMORY[0x24BE71720])
  {
    v23(v17);
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BE71630], v5);
    v18 = sub_230B032C4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if ((v18 & 1) != 0)
      return 0;
    else
      return sub_230B035B8();
  }
  else
  {
    a1(v17);
    sub_230B03204();
    v20 = *(void (**)(char *, uint64_t))(v10 + 8);
    v20(v13, v9);
    v19 = sub_230B035B8();
    swift_bridgeObjectRelease();
    v20(v16, v9);
  }
  return v19;
}

uint64_t ScreenTimeRequestPersonStatus.icon.getter()
{
  return sub_230B034D4();
}

uint64_t ScreenTimeRequestPersonStatus.iconBackground.getter()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_230B03B10;
  if (qword_255EA1280 != -1)
    swift_once();
  *(_QWORD *)(v0 + 32) = qword_255EA17B8;
  v1 = qword_255EA1278;
  swift_retain();
  if (v1 != -1)
    swift_once();
  *(_QWORD *)(v0 + 40) = qword_255EA17B0;
  sub_230B03618();
  swift_retain();
  return v0;
}

uint64_t ScreenTimeRequestPersonStatus.iconShadow.getter()
{
  return sub_230AFA350(&qword_255EA1278);
}

uint64_t sub_230B00F6C()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_230B03B10;
  if (qword_255EA1280 != -1)
    swift_once();
  *(_QWORD *)(v0 + 32) = qword_255EA17B8;
  v1 = qword_255EA1278;
  swift_retain();
  if (v1 != -1)
    swift_once();
  *(_QWORD *)(v0 + 40) = qword_255EA17B0;
  sub_230B03618();
  swift_retain();
  return v0;
}

uint64_t sub_230B01044(uint64_t a1, uint64_t a2)
{
  return sub_230B02654(a1, a2, &qword_255EA1278);
}

uint64_t sub_230B01060()
{
  return ScreenTimeRequestPersonStatus.icon.getter();
}

uint64_t ChildStatePersonStatus.accessibilityText.getter()
{
  return sub_230B035B8();
}

uint64_t ChildStatePersonStatus.localizedDisplayString.getter()
{
  return sub_230B035B8();
}

uint64_t ChildStatePersonStatus.icon.getter()
{
  return sub_230B034E0();
}

uint64_t ChildStatePersonStatus.iconBackground.getter()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_230B03B10;
  if (qword_255EA12D8 != -1)
    swift_once();
  *(_QWORD *)(v0 + 32) = qword_255EA1810;
  v1 = qword_255EA12E0;
  swift_retain();
  if (v1 != -1)
    swift_once();
  *(_QWORD *)(v0 + 40) = qword_255EA1818;
  sub_230B03618();
  swift_retain();
  return v0;
}

uint64_t ChildStatePersonStatus.iconForeground.getter()
{
  return sub_230AFA350(&qword_255EA12D0);
}

uint64_t ChildStatePersonStatus.iconShadow.getter()
{
  return sub_230AFA350(&qword_255EA12E8);
}

uint64_t ChildStatePersonStatus.iconFontSize.getter()
{
  uint64_t v0;

  _s6People19MessagePersonStatusV0A2UIE12iconFontSize05SwiftE00G0Vvg_0();
  v0 = sub_230B03360();
  swift_release();
  return v0;
}

double ChildStatePersonStatus.iconOffset.getter()
{
  return 0.0;
}

uint64_t sub_230B0121C()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_230B03B10;
  if (qword_255EA12D8 != -1)
    swift_once();
  *(_QWORD *)(v0 + 32) = qword_255EA1810;
  v1 = qword_255EA12E0;
  swift_retain();
  if (v1 != -1)
    swift_once();
  *(_QWORD *)(v0 + 40) = qword_255EA1818;
  sub_230B03618();
  swift_retain();
  return v0;
}

uint64_t sub_230B012F4(uint64_t a1, uint64_t a2)
{
  return sub_230B02654(a1, a2, &qword_255EA12D0);
}

uint64_t sub_230B01310(uint64_t a1, uint64_t a2)
{
  return sub_230B02654(a1, a2, &qword_255EA12E8);
}

uint64_t sub_230B0132C()
{
  uint64_t v0;

  _s6People19MessagePersonStatusV0A2UIE12iconFontSize05SwiftE00G0Vvg_0();
  v0 = sub_230B03360();
  swift_release();
  return v0;
}

uint64_t sub_230B01360()
{
  return ChildStatePersonStatus.icon.getter();
}

double sub_230B01374()
{
  return 0.0;
}

uint64_t sub_230B01388()
{
  return sub_230B035B8();
}

uint64_t LocationPersonStatus.iconBackground.getter()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_230B03B10;
  if (qword_255EA12C0 != -1)
    swift_once();
  *(_QWORD *)(v0 + 32) = qword_255EA17F8;
  v1 = qword_255EA12B8;
  swift_retain();
  if (v1 != -1)
    swift_once();
  *(_QWORD *)(v0 + 40) = qword_255EA17F0;
  sub_230B03618();
  swift_retain();
  return v0;
}

uint64_t LocationPersonStatus.iconForeground.getter()
{
  return sub_230AFA350(&qword_255EA12C8);
}

uint64_t LocationPersonStatus.iconShadow.getter()
{
  return sub_230AFA350(&qword_255EA12B8);
}

uint64_t LocationPersonStatus.icon.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t result;
  uint64_t v6;

  v0 = sub_230B03168();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B032D0();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BE71620], v0);
  v4 = sub_230B032C4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  result = 0;
  if ((v4 & 1) != 0)
    return sub_230B034D4();
  return result;
}

uint64_t LocationPersonStatus.iconForLockScreenCircularAccessory.getter()
{
  return sub_230B034D4();
}

uint64_t sub_230B015AC()
{
  return sub_230B034D4();
}

uint64_t sub_230B015CC()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_230B03B10;
  if (qword_255EA12C0 != -1)
    swift_once();
  *(_QWORD *)(v0 + 32) = qword_255EA17F8;
  v1 = qword_255EA12B8;
  swift_retain();
  if (v1 != -1)
    swift_once();
  *(_QWORD *)(v0 + 40) = qword_255EA17F0;
  sub_230B03618();
  swift_retain();
  return v0;
}

uint64_t sub_230B016A4(uint64_t a1, uint64_t a2)
{
  return sub_230B02654(a1, a2, &qword_255EA12C8);
}

uint64_t sub_230B016C0(uint64_t a1, uint64_t a2)
{
  return sub_230B02654(a1, a2, &qword_255EA12B8);
}

uint64_t MotionPersonStatus.accessibilityText.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  unsigned int v5;
  uint64_t v7;

  v0 = sub_230B031F8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B0327C();
  v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x24BE71700])
  {
    v5 = 1852732786;
  }
  else if (v4 == *MEMORY[0x24BE716F8])
  {
    v5 = 1818458467;
  }
  else if (v4 == *MEMORY[0x24BE716E8])
  {
    v5 = 1986622052;
  }
  else
  {
    if (v4 != *MEMORY[0x24BE71708])
    {
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      return 0;
    }
    v5 = 1802264951;
  }
  return v5 | 0x676E6900000000;
}

uint64_t MotionPersonStatus.icon.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t v6;

  v0 = sub_230B031F8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B0327C();
  v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x24BE71700])
    return sub_230B034E0();
  if (v4 == *MEMORY[0x24BE716F8]
    || v4 == *MEMORY[0x24BE716E8]
    || v4 == *MEMORY[0x24BE71708]
    || v4 == *MEMORY[0x24BE716F0])
  {
    return sub_230B034D4();
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

uint64_t MotionPersonStatus.iconBackground.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = MotionPersonStatus.icon.getter();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  if (v0)
  {
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_230B03B10;
    if (qword_255EA1270 != -1)
      swift_once();
    *(_QWORD *)(v1 + 32) = qword_255EA17A8;
    swift_retain();
    *(_QWORD *)(v1 + 40) = sub_230B0345C();
  }
  else
  {
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_230B03FB0;
    *(_QWORD *)(v1 + 32) = sub_230B03468();
  }
  sub_230B03618();
  return v1;
}

uint64_t MotionPersonStatus.iconForeground.getter()
{
  uint64_t v0;

  v0 = MotionPersonStatus.icon.getter();
  swift_release();
  if (v0)
    return _s6People19MessagePersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0();
  else
    return sub_230B03468();
}

uint64_t MotionPersonStatus.iconShadow.getter()
{
  return sub_230AFA350(&qword_255EA1270);
}

uint64_t MotionPersonStatus.iconFontSize.getter()
{
  CTFontRef UIFontForLanguage;
  const __CTFont *v1;
  uint64_t v2;

  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, 10.0, 0);
  if (UIFontForLanguage)
  {
    v1 = UIFontForLanguage;
    sub_230B03390();
    v2 = sub_230B03360();

  }
  else
  {
    _s6People19MessagePersonStatusV0A2UIE12iconFontSize05SwiftE00G0Vvg_0();
    v2 = sub_230B03360();
  }
  swift_release();
  return v2;
}

uint64_t MotionPersonStatus.iconForLockScreenCircularAccessory.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  BOOL v5;
  uint64_t v8;

  v0 = sub_230B031F8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B0327C();
  v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  v5 = v4 == *MEMORY[0x24BE71700] || v4 == *MEMORY[0x24BE716F8];
  if (v5 || v4 == *MEMORY[0x24BE716E8])
    return sub_230B034D4();
  if (v4 == *MEMORY[0x24BE71708] || v4 == *MEMORY[0x24BE716F0])
    return sub_230B034D4();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

void MotionPersonStatus.positionInCircularAccessory.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

double MotionPersonStatus.iconOffset.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_230B031F8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B0327C();
  if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) != *MEMORY[0x24BE71700])
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0.0;
}

void sub_230B01CEC(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_230B01CF8()
{
  uint64_t v0;

  v0 = MotionPersonStatus.icon.getter();
  swift_release();
  if (v0)
    return _s6People19MessagePersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0();
  else
    return sub_230B03468();
}

uint64_t sub_230B01D2C(uint64_t a1, uint64_t a2)
{
  return sub_230B02654(a1, a2, &qword_255EA1270);
}

uint64_t sub_230B01D48()
{
  CTFontRef UIFontForLanguage;
  const __CTFont *v1;
  uint64_t v2;

  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, 10.0, 0);
  if (UIFontForLanguage)
  {
    v1 = UIFontForLanguage;
    sub_230B03390();
    v2 = sub_230B03360();

  }
  else
  {
    _s6People19MessagePersonStatusV0A2UIE12iconFontSize05SwiftE00G0Vvg_0();
    v2 = sub_230B03360();
  }
  swift_release();
  return v2;
}

double sub_230B01DBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_230B031F8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B0327C();
  if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) != *MEMORY[0x24BE71700])
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0.0;
}

uint64_t MissedCallPersonStatus.localizedDisplayString.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t);
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  _QWORD v12[4];

  v0 = sub_230B03288();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BE717C0];
  v2 = *(_QWORD *)(v0 - 8);
  v3 = MEMORY[0x24BDAC7A8](v0);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v12 - v6;
  sub_230B032E8();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BE717B8], v0);
  sub_230AF911C(&qword_255EA1910, v1, MEMORY[0x24BE717C8]);
  sub_230B035E8();
  sub_230B035E8();
  if (v12[2] == v12[0] && v12[3] == v12[1])
  {
    swift_bridgeObjectRelease_n();
    v8 = *(void (**)(char *, uint64_t))(v2 + 8);
    v8(v5, v0);
    v8(v7, v0);
  }
  else
  {
    sub_230B03714();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v9 = *(void (**)(char *, uint64_t))(v2 + 8);
    v9(v5, v0);
    v9(v7, v0);
  }
  v10 = sub_230B035B8();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t MissedCallPersonStatus.icon.getter()
{
  return sub_230B034D4();
}

uint64_t MissedCallPersonStatus.useIconAsTextPrefix.getter()
{
  return 1;
}

uint64_t MissedCallPersonStatus.iconBackground.getter()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_230B03B10;
  if (qword_255EA1300 != -1)
    swift_once();
  *(_QWORD *)(v0 + 32) = qword_255EA1838;
  v1 = qword_255EA12F8;
  swift_retain();
  if (v1 != -1)
    swift_once();
  *(_QWORD *)(v0 + 40) = qword_255EA1830;
  sub_230B03618();
  swift_retain();
  return v0;
}

uint64_t MissedCallPersonStatus.iconShadow.getter()
{
  return sub_230AFA350(&qword_255EA1308);
}

double MissedCallPersonStatus.iconOffset.getter()
{
  return 0.0;
}

uint64_t sub_230B0218C()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_230B03B10;
  if (qword_255EA1300 != -1)
    swift_once();
  *(_QWORD *)(v0 + 32) = qword_255EA1838;
  v1 = qword_255EA12F8;
  swift_retain();
  if (v1 != -1)
    swift_once();
  *(_QWORD *)(v0 + 40) = qword_255EA1830;
  sub_230B03618();
  swift_retain();
  return v0;
}

uint64_t sub_230B02268(uint64_t a1, uint64_t a2)
{
  return sub_230B02654(a1, a2, &qword_255EA1308);
}

uint64_t sub_230B02288()
{
  return MissedCallPersonStatus.icon.getter();
}

uint64_t sub_230B0229C()
{
  return 1;
}

uint64_t MessagePersonStatus.icon.getter()
{
  if (sub_230B03294() < 1)
    return 0;
  else
    return sub_230B034D4();
}

uint64_t MessagePersonStatus.localizedDisplayString.getter()
{
  uint64_t result;

  result = sub_230B03294();
  if (result)
    return sub_230B035B8();
  return result;
}

uint64_t MessagePersonStatus.useIconAsTextPrefix.getter()
{
  return 1;
}

uint64_t MessagePersonStatus.iconBackground.getter()
{
  return sub_230B023B4(MEMORY[0x24BDF3D18]);
}

void MessagePersonStatus.positionInCircularAccessory.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void sub_230B02364(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_230B02374(uint64_t a1, uint64_t a2)
{
  return sub_230B025D4(a1, a2, MEMORY[0x24BDF3D18]);
}

uint64_t CalendarPersonStatus.icon.getter()
{
  return sub_230B034D4();
}

uint64_t CalendarPersonStatus.iconBackground.getter()
{
  return sub_230B023B4(MEMORY[0x24BDF3D30]);
}

uint64_t sub_230B023B4(uint64_t (*a1)(void))
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_230B03FB0;
  *(_QWORD *)(v2 + 32) = a1();
  sub_230B03618();
  return v2;
}

uint64_t CalendarPersonStatus.iconForeground.getter()
{
  return sub_230AFA350(&qword_255EA1310);
}

uint64_t CalendarPersonStatus.localizedDisplayString.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v0 = sub_230B032A0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B032AC();
  v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x24BE717F8] || v4 == *MEMORY[0x24BE71800])
    goto LABEL_6;
  if (v4 != *MEMORY[0x24BE717F0])
  {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
LABEL_6:
    sub_230B035B8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1918);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_230B03FB0;
    v7 = _s6People20LocationPersonStatusV0A2UIE22localizedDisplayStringSSvg_0();
    v9 = v8;
    *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v6 + 64) = sub_230B02848();
    *(_QWORD *)(v6 + 32) = v7;
    *(_QWORD *)(v6 + 40) = v9;
    v5 = sub_230B03588();
    swift_bridgeObjectRelease();
    return v5;
  }
  return _s6People20LocationPersonStatusV0A2UIE22localizedDisplayStringSSvg_0();
}

double CalendarPersonStatus.iconOffset.getter()
{
  return 0.0;
}

uint64_t sub_230B025C8(uint64_t a1, uint64_t a2)
{
  return sub_230B025D4(a1, a2, MEMORY[0x24BDF3D30]);
}

uint64_t sub_230B025D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA1908);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_230B03FB0;
  *(_QWORD *)(v4 + 32) = a3();
  sub_230B03618();
  return v4;
}

uint64_t sub_230B02638(uint64_t a1, uint64_t a2)
{
  return sub_230B02654(a1, a2, &qword_255EA1310);
}

uint64_t sub_230B02654(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (*a3 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_230B02690()
{
  return CalendarPersonStatus.icon.getter();
}

uint64_t sub_230B026A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t *v5;
  uint64_t v7;

  v0 = sub_230B03654();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230B03300();
  v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x24BE71958])
  {
    if (qword_255EA1298 != -1)
      swift_once();
    v5 = &qword_255EA17D0;
    return *v5;
  }
  if (v4 == *MEMORY[0x24BE71960])
  {
    if (qword_255EA12A8 != -1)
      swift_once();
    v5 = &qword_255EA17E0;
    return *v5;
  }
  if (v4 != *MEMORY[0x24BE71968])
  {
    if (v4 == *MEMORY[0x24BE71950])
    {
      if (qword_255EA12F0 != -1)
        swift_once();
      v5 = &qword_255EA1828;
      return *v5;
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  if (qword_255EA1288 != -1)
    swift_once();
  v5 = &qword_255EA17C0;
  return *v5;
}

unint64_t sub_230B02848()
{
  unint64_t result;

  result = qword_255EA1920;
  if (!qword_255EA1920)
  {
    result = MEMORY[0x2348BEDC0](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255EA1920);
  }
  return result;
}

unint64_t sub_230B02890()
{
  unint64_t result;

  result = qword_255EA1928;
  if (!qword_255EA1928)
  {
    result = MEMORY[0x2348BEDC0](&protocol conformance descriptor for PositionInLockScreenCircularAccessory, &type metadata for PositionInLockScreenCircularAccessory);
    atomic_store(result, (unint64_t *)&qword_255EA1928);
  }
  return result;
}

unint64_t sub_230B028D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EA1930;
  if (!qword_255EA1930)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255EA1938);
    result = MEMORY[0x2348BEDC0](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255EA1930);
  }
  return result;
}

uint64_t sub_230B02924(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA1940, MEMORY[0x24BE718B0], (uint64_t)&protocol conformance descriptor for AvailabilityPersonStatus);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02960(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA1948, MEMORY[0x24BE718B0], MEMORY[0x24BE718A8]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B0299C(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA1950, MEMORY[0x24BE718E0], (uint64_t)&protocol conformance descriptor for AskToBuyRequestPersonStatus);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B029D8()
{
  return sub_230AF911C(&qword_255EA1958, MEMORY[0x24BE718E0], MEMORY[0x24BE718D8]);
}

uint64_t sub_230B02A04(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA1958, MEMORY[0x24BE718E0], MEMORY[0x24BE718D8]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02A40(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA1960, MEMORY[0x24BE71908], (uint64_t)&protocol conformance descriptor for ScreenTimeRequestPersonStatus);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02A7C()
{
  return sub_230AF911C(&qword_255EA1968, MEMORY[0x24BE71908], MEMORY[0x24BE71900]);
}

uint64_t sub_230B02AA8(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA1968, MEMORY[0x24BE71908], MEMORY[0x24BE71900]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02AE4(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA1970, MEMORY[0x24BE71870], MEMORY[0x24BE71868]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02B20()
{
  return sub_230AF911C(&qword_255EA1970, MEMORY[0x24BE71870], MEMORY[0x24BE71868]);
}

uint64_t sub_230B02B4C(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA1978, MEMORY[0x24BE71858], (uint64_t)&protocol conformance descriptor for LocationPersonStatus);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02B88()
{
  return sub_230AF911C(&qword_255EA1980, MEMORY[0x24BE71858], MEMORY[0x24BE71850]);
}

uint64_t sub_230B02BB4(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA1980, MEMORY[0x24BE71858], MEMORY[0x24BE71850]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02BF0(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA1988, MEMORY[0x24BE717A8], (uint64_t)&protocol conformance descriptor for MotionPersonStatus);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02C2C(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA1990, MEMORY[0x24BE717A8], MEMORY[0x24BE717A0]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02C68(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA1998, MEMORY[0x24BE71890], (uint64_t)&protocol conformance descriptor for MissedCallPersonStatus);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02CA4()
{
  return sub_230AF911C(&qword_255EA19A0, MEMORY[0x24BE71890], MEMORY[0x24BE71888]);
}

uint64_t sub_230B02CD0(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA19A0, MEMORY[0x24BE71890], MEMORY[0x24BE71888]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02D0C(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA19A8, MEMORY[0x24BE717E0], (uint64_t)&protocol conformance descriptor for MessagePersonStatus);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02D48()
{
  return sub_230AF911C(&qword_255EA19B0, MEMORY[0x24BE717E0], MEMORY[0x24BE717D8]);
}

uint64_t sub_230B02D74(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA19B0, MEMORY[0x24BE717E0], MEMORY[0x24BE717D8]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_230B02DB0()
{
  return sub_230AF911C(&qword_255EA19B8, MEMORY[0x24BE71828], MEMORY[0x24BE71820]);
}

uint64_t sub_230B02DDC(uint64_t a1)
{
  uint64_t result;

  result = sub_230AF911C(&qword_255EA19B8, MEMORY[0x24BE71828], MEMORY[0x24BE71820]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of BadgeStatus.iconBackground.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BadgeStatus.iconForeground.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of BadgeStatus.iconShadow.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of BadgeStatus.iconFontSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of BadgeStatus.icon.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of BadgeStatus.iconOffset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of BadgeStatus.useIconAsTextPrefix.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of BadgeStatus.accessibilityText.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t storeEnumTagSinglePayload for PositionInLockScreenCircularAccessory(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_230B02EA4 + 4 * byte_230B03FD5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_230B02ED8 + 4 * byte_230B03FD0[v4]))();
}

uint64_t sub_230B02ED8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230B02EE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230B02EE8);
  return result;
}

uint64_t sub_230B02EF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230B02EFCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_230B02F00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230B02F08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PositionInLockScreenCircularAccessory()
{
  return &type metadata for PositionInLockScreenCircularAccessory;
}

uint64_t dispatch thunk of LockScreenBadgeStatus.positionInCircularAccessory.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

unint64_t sub_230B02F2C()
{
  unint64_t result;

  result = qword_255EA19C0;
  if (!qword_255EA19C0)
  {
    result = MEMORY[0x2348BEDC0](&protocol conformance descriptor for PositionInLockScreenCircularAccessory, &type metadata for PositionInLockScreenCircularAccessory);
    atomic_store(result, (unint64_t *)&qword_255EA19C0);
  }
  return result;
}

uint64_t sub_230B02FC4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_230B02FF4()
{
  return MEMORY[0x24BE71618]();
}

uint64_t sub_230B03000()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_230B0300C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_230B03018()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_230B03024()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_230B03030()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_230B0303C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_230B03048()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_230B03054()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_230B03060()
{
  return MEMORY[0x24BDCEBA0]();
}

uint64_t sub_230B0306C()
{
  return MEMORY[0x24BDCEDD0]();
}

uint64_t sub_230B03078()
{
  return MEMORY[0x24BDCEE00]();
}

uint64_t sub_230B03084()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_230B03090()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_230B0309C()
{
  return MEMORY[0x24BDCF008]();
}

uint64_t sub_230B030A8()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_230B030B4()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_230B030C0()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_230B030CC()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_230B030D8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_230B030E4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_230B030F0()
{
  return MEMORY[0x24BDB7C10]();
}

uint64_t sub_230B030FC()
{
  return MEMORY[0x24BDB7C20]();
}

uint64_t sub_230B03108()
{
  return MEMORY[0x24BDB7E78]();
}

uint64_t sub_230B03114()
{
  return MEMORY[0x24BDB8120]();
}

uint64_t sub_230B03120()
{
  return MEMORY[0x24BDB8140]();
}

uint64_t sub_230B0312C()
{
  return MEMORY[0x24BDB8150]();
}

uint64_t sub_230B03138()
{
  return MEMORY[0x24BDB8170]();
}

uint64_t sub_230B03144()
{
  return MEMORY[0x24BDB8318]();
}

uint64_t sub_230B03150()
{
  return MEMORY[0x24BDB8328]();
}

uint64_t sub_230B0315C()
{
  return MEMORY[0x24BDB8338]();
}

uint64_t sub_230B03168()
{
  return MEMORY[0x24BE71638]();
}

uint64_t sub_230B03174()
{
  return MEMORY[0x24BE71640]();
}

uint64_t sub_230B03180()
{
  return MEMORY[0x24BE71668]();
}

uint64_t sub_230B0318C()
{
  return MEMORY[0x24BE71670]();
}

uint64_t sub_230B03198()
{
  return MEMORY[0x24BE71678]();
}

uint64_t sub_230B031A4()
{
  return MEMORY[0x24BE71680]();
}

uint64_t sub_230B031B0()
{
  return MEMORY[0x24BE71688]();
}

uint64_t sub_230B031BC()
{
  return MEMORY[0x24BE71690]();
}

uint64_t sub_230B031C8()
{
  return MEMORY[0x24BE71698]();
}

uint64_t sub_230B031D4()
{
  return MEMORY[0x24BE716C8]();
}

uint64_t sub_230B031E0()
{
  return MEMORY[0x24BE716D8]();
}

uint64_t sub_230B031EC()
{
  return MEMORY[0x24BE716E0]();
}

uint64_t sub_230B031F8()
{
  return MEMORY[0x24BE71710]();
}

uint64_t sub_230B03204()
{
  return MEMORY[0x24BE71718]();
}

uint64_t sub_230B03210()
{
  return MEMORY[0x24BE71728]();
}

uint64_t sub_230B0321C()
{
  return MEMORY[0x24BE71730]();
}

uint64_t sub_230B03228()
{
  return MEMORY[0x24BE71748]();
}

uint64_t sub_230B03234()
{
  return MEMORY[0x24BE71750]();
}

uint64_t sub_230B03240()
{
  return MEMORY[0x24BE71758]();
}

uint64_t sub_230B0324C()
{
  return MEMORY[0x24BE71760]();
}

uint64_t sub_230B03258()
{
  return MEMORY[0x24BE71768]();
}

uint64_t sub_230B03264()
{
  return MEMORY[0x24BE71770]();
}

uint64_t sub_230B03270()
{
  return MEMORY[0x24BE71788]();
}

uint64_t sub_230B0327C()
{
  return MEMORY[0x24BE71798]();
}

uint64_t sub_230B03288()
{
  return MEMORY[0x24BE717C0]();
}

uint64_t sub_230B03294()
{
  return MEMORY[0x24BE717D0]();
}

uint64_t sub_230B032A0()
{
  return MEMORY[0x24BE71808]();
}

uint64_t sub_230B032AC()
{
  return MEMORY[0x24BE71810]();
}

uint64_t _s6People20LocationPersonStatusV0A2UIE22localizedDisplayStringSSvg_0()
{
  return MEMORY[0x24BE71818]();
}

uint64_t sub_230B032C4()
{
  return MEMORY[0x24BE71838]();
}

uint64_t sub_230B032D0()
{
  return MEMORY[0x24BE71840]();
}

uint64_t sub_230B032DC()
{
  return MEMORY[0x24BE71848]();
}

uint64_t sub_230B032E8()
{
  return MEMORY[0x24BE71880]();
}

uint64_t sub_230B032F4()
{
  return MEMORY[0x24BE718A0]();
}

uint64_t sub_230B03300()
{
  return MEMORY[0x24BE718C0]();
}

uint64_t sub_230B0330C()
{
  return MEMORY[0x24BE71918]();
}

uint64_t sub_230B03318()
{
  return MEMORY[0x24BE71920]();
}

uint64_t sub_230B03324()
{
  return MEMORY[0x24BE71928]();
}

uint64_t sub_230B03330()
{
  return MEMORY[0x24BDB9D18]();
}

uint64_t sub_230B0333C()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_230B03348()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_230B03354()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_230B03360()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_230B0336C()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t _s6People22MissedCallPersonStatusV0A2UIE12iconFontSize05SwiftF00H0Vvg_0()
{
  return MEMORY[0x24BDF1820]();
}

uint64_t _s6People19MessagePersonStatusV0A2UIE12iconFontSize05SwiftE00G0Vvg_0()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_230B03390()
{
  return MEMORY[0x24BDF1950]();
}

uint64_t sub_230B0339C()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_230B033A8()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_230B033B4()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_230B033C0()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_230B033CC()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_230B033D8()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_230B033E4()
{
  return MEMORY[0x24BDB8398]();
}

uint64_t sub_230B033F0()
{
  return MEMORY[0x24BDB83A8]();
}

uint64_t sub_230B033FC()
{
  return MEMORY[0x24BDB8468]();
}

uint64_t sub_230B03408()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_230B03414()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_230B03420()
{
  return MEMORY[0x24BDF2400]();
}

uint64_t sub_230B0342C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_230B03438()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t _s6People22MissedCallPersonStatusV0A2UIE14iconForeground05SwiftF05ColorVvg_0()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t _s6People19MessagePersonStatusV0A2UIE14iconForeground05SwiftE05ColorVvg_0()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_230B0345C()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_230B03468()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_230B03474()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t _s6People19MessagePersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t _s6People24AvailabilityPersonStatusV0A2UIE10iconShadow05SwiftE05ColorVvg_0()
{
  return MEMORY[0x24BDF3D40]();
}

uint64_t sub_230B03498()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_230B034A4()
{
  return MEMORY[0x24BDF3D58]();
}

uint64_t sub_230B034B0()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_230B034BC()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_230B034C8()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_230B034D4()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_230B034E0()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_230B034EC()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_230B034F8()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_230B03504()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_230B03510()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_230B0351C()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_230B03528()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_230B03534()
{
  return MEMORY[0x24BDFAF10]();
}

uint64_t sub_230B03540()
{
  return MEMORY[0x24BDFB268]();
}

uint64_t sub_230B0354C()
{
  return MEMORY[0x24BDFB270]();
}

uint64_t sub_230B03558()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_230B03564()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_230B03570()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_230B0357C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_230B03588()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_230B03594()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_230B035A0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_230B035AC()
{
  return MEMORY[0x24BE71938]();
}

uint64_t sub_230B035B8()
{
  return MEMORY[0x24BE71940]();
}

uint64_t sub_230B035C4()
{
  return MEMORY[0x24BE71948]();
}

uint64_t sub_230B035D0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_230B035DC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_230B035E8()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_230B035F4()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_230B03600()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_230B0360C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_230B03618()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_230B03624()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_230B03630()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_230B0363C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_230B03648()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_230B03654()
{
  return MEMORY[0x24BE71970]();
}

uint64_t sub_230B03660()
{
  return MEMORY[0x24BDD01C8]();
}

uint64_t sub_230B0366C()
{
  return MEMORY[0x24BDD01D8]();
}

uint64_t sub_230B03678()
{
  return MEMORY[0x24BDD03C0]();
}

uint64_t sub_230B03684()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_230B03690()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_230B0369C()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_230B036A8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_230B036B4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_230B036C0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_230B036CC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_230B036D8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_230B036E4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_230B036F0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_230B036FC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_230B03708()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_230B03714()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_230B03720()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_230B0372C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_230B03738()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_230B03744()
{
  return MEMORY[0x24BEE4328]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGPoint result;

  MEMORY[0x24BDBEF90](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGSize result;

  MEMORY[0x24BDBF128](t, (__n128)size, *(__n128 *)&size.height);
  result.height = v3;
  result.width = v2;
  return result;
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x24BDC47A8](*(_QWORD *)&uiType, language, size);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
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

