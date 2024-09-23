uint64_t static PNKeyPickerProcessor.keyPick(from:options:)(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  id v8;
  unint64_t v9;
  uint64_t v10;

  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    v8 = a2;
    v9 = swift_bridgeObjectRetain();
    v3 = (uint64_t)sub_244054F14(v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = a1 & 0xFFFFFFFFFFFFFF8;
    v4 = a2;
    swift_bridgeObjectRetain();
  }
  v10 = v3;
  sub_244054E78(&v10, a2);
  v5 = v10;
  if (v10 < 0 || (v10 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v6 = sub_244069074();
    OUTLINED_FUNCTION_0();
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = *(_QWORD *)(v10 + 16);
    if (!v6)
    {
LABEL_10:
      OUTLINED_FUNCTION_0();
      return v6;
    }
  }
  if ((v5 & 0xC000000000000001) != 0)
  {
    v6 = MEMORY[0x249506E84](0, v5);
    goto LABEL_10;
  }
  if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v6 = *(_QWORD *)(v5 + 32);
    swift_unknownObjectRetain();
    goto LABEL_10;
  }
  __break(1u);
  result = OUTLINED_FUNCTION_0();
  __break(1u);
  return result;
}

id sub_2440549AC(id *a1, void **a2, void *a3)
{
  id v4;
  void *v5;
  unsigned int v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  double v26;
  double v27;
  double v28;
  float v30;
  float v31;
  float v32;

  v4 = *a1;
  v5 = *a2;
  v6 = objc_msgSend(*a1, sel_favorite);
  if (v6 != objc_msgSend(v5, sel_favorite))
    return objc_msgSend(v4, sel_favorite);
  objc_msgSend(v4, sel_curationScore);
  v9 = v8;
  objc_msgSend(v5, sel_curationScore);
  v11 = vabdd_f64(v9, v10);
  objc_msgSend(a3, sel_comparableCurationScoreThreshold);
  if (v12 <= v11)
  {
    objc_msgSend(v4, sel_curationScore);
    v27 = v26;
    objc_msgSend(v5, sel_curationScore);
    return (id)(v28 < v27);
  }
  objc_msgSend(v4, sel_overallAestheticScore);
  v14 = v13;
  objc_msgSend(v5, sel_overallAestheticScore);
  if (v14 != v15)
  {
    objc_msgSend(v4, sel_overallAestheticScore);
    v31 = v30;
    objc_msgSend(v5, sel_overallAestheticScore);
    return (id)(v32 < v31);
  }
  v16 = objc_msgSend(v4, sel_identifier);
  v17 = sub_244068F48();
  v19 = v18;

  v20 = objc_msgSend(v5, sel_identifier);
  v21 = sub_244068F48();
  v23 = v22;

  if (v17 == v21 && v19 == v23)
  {
    swift_bridgeObjectRelease_n();
    return 0;
  }
  else
  {
    v25 = sub_2440690B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (id)(v25 & 1);
  }
}

PNKeyPickerProcessor __swiftcall PNKeyPickerProcessor.init()()
{
  return (PNKeyPickerProcessor)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id PNKeyPickerProcessor.init()()
{
  objc_super v1;

  v1.super_class = (Class)PNKeyPickerProcessor;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_244054C60(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_244069068();
    __break(1u);
  }
  else if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257337910);
    result = sub_244068F78();
    *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10) = a1;
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

char *sub_244054D08(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_244069080();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_244054D8C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v3 = a1 + 8 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_244069080();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257337910);
    return swift_arrayInitWithCopy();
  }
  return result;
}

void sub_244054E78(uint64_t *a1, void *a2)
{
  uint64_t v3;
  id v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  id v7;
  uint64_t v8[2];

  v3 = *a1;
  v4 = a2;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_244056608();
  v6 = *(_QWORD *)(v3 + 16);
  v8[0] = v3 + 32;
  v8[1] = v6;
  v7 = v4;
  sub_244055028(v8, v7);
  sub_24406905C();

}

_QWORD *sub_244054F14(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  size_t v4;
  unint64_t v5;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_8;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257337918);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v3[2] = v2;
      v3[3] = (2 * ((uint64_t)(v4 - 32) / 8)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_2440563F8((uint64_t)(v3 + 4), v2, v1);
    v1 = v5;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    v2 = sub_244069074();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

unint64_t sub_244055004(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void sub_244055028(uint64_t *a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  __objc2_ivar_list **p_ivars;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  float v26;
  float v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  char v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  float v42;
  float v43;
  float v44;
  float v45;
  int v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  unsigned int v60;
  unsigned __int8 v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  float v67;
  float v68;
  float v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v79;
  double v80;
  double v81;
  double v82;
  double v83;
  float v84;
  float v85;
  float v86;
  float v87;
  void *v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  BOOL v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  BOOL v116;
  uint64_t v117;
  char v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  BOOL v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  unint64_t v140;
  char *v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  char *v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  char *__dst;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  void *v161;
  unsigned int v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  id v167;
  uint64_t v168;

  v3 = a1[1];
  v4 = a2;
  v5 = sub_2440690A4();
  if (v5 >= v3)
  {
    if (v3 < 0)
      goto LABEL_168;
    if (v3)
      sub_244055BC0(0, v3, 1, a1, v4);
    else

    goto LABEL_145;
  }
  v6 = v5;
  v7 = sub_244054C60(v3 / 2);
  __dst = v8;
  v168 = v7;
  v161 = v4;
  v153 = v3;
  v149 = a1;
  if (v3 <= 0)
    goto LABEL_129;
  v150 = v6;
  v9 = 0;
  v10 = *a1;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v148 = *a1 - 8;
  p_ivars = (__objc2_ivar_list **)(&CLSSDModel__classData + 48);
  v159 = *a1;
  while (1)
  {
    v13 = v9 + 1;
    v156 = v9;
    if (v9 + 1 >= v3)
      goto LABEL_39;
    v151 = v11;
    v167 = *(id *)(v10 + 8 * v13);
    v166 = *(void **)(v10 + 8 * v9);
    v14 = v9;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v162 = sub_2440549AC(&v167, &v166, v4);
    if (v160)
    {
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
LABEL_127:
      if (v3 >= -1)
      {
LABEL_144:
        *(_QWORD *)((v168 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
        sub_244068F6C();

        swift_bridgeObjectRelease();
LABEL_145:

        return;
      }
      __break(1u);
LABEL_129:
      v11 = (char *)MEMORY[0x24BEE4AF8];
      v91 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_130:
      v141 = v11;
      if (v91 >= 2)
      {
        v142 = *v149;
        v165 = *v149;
        do
        {
          v143 = v91 - 2;
          if (v91 < 2)
            goto LABEL_163;
          if (!v142)
            goto LABEL_177;
          v144 = *(_QWORD *)&v141[16 * v143 + 32];
          v145 = *(_QWORD *)&v141[16 * v91 + 24];
          sub_244055E90((char *)(v142 + 8 * v144), (char *)(v142 + 8 * *(_QWORD *)&v141[16 * v91 + 16]), v142 + 8 * v145, __dst, v161);
          v4 = v160;
          if (v160)
            goto LABEL_126;
          if (v145 < v144)
            goto LABEL_164;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v141 = sub_244056274((uint64_t)v141);
          if (v143 >= *((_QWORD *)v141 + 2))
            goto LABEL_165;
          v146 = &v141[16 * v143 + 32];
          *(_QWORD *)v146 = v144;
          *((_QWORD *)v146 + 1) = v145;
          v147 = *((_QWORD *)v141 + 2);
          if (v91 > v147)
            goto LABEL_166;
          memmove(&v141[16 * v91 + 16], &v141[16 * v91 + 32], 16 * (v147 - v91));
          *((_QWORD *)v141 + 2) = v147 - 1;
          v91 = v147 - 1;
          v4 = v161;
          v142 = v165;
          v3 = v153;
        }
        while (v147 > 2);
      }
      swift_bridgeObjectRelease();
      if (v3 < -1)
        goto LABEL_173;
      goto LABEL_144;
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v13 = v14 + 2;
    if (v14 + 2 >= v3)
      goto LABEL_28;
    while (1)
    {
      v15 = v10 + 8 * v14;
      v17 = *(void **)(v15 + 8);
      v16 = *(void **)(v15 + 16);
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      v18 = objc_msgSend(v16, sel_favorite);
      if (v18 != objc_msgSend(v17, sel_favorite))
      {
        v19 = objc_msgSend(v16, sel_favorite);
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if (((v162 ^ v19) & 1) != 0)
          goto LABEL_28;
        goto LABEL_26;
      }
      objc_msgSend(v16, sel_curationScore);
      v21 = v20;
      objc_msgSend(v17, sel_curationScore);
      v23 = vabdd_f64(v21, v22);
      objc_msgSend(v4, sel_comparableCurationScoreThreshold);
      if (v24 <= v23)
      {
        objc_msgSend(v16, sel_curationScore);
        v38 = v37;
        objc_msgSend(v17, sel_curationScore);
        v40 = v39;
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        v41 = v40 < v38;
        goto LABEL_19;
      }
      objc_msgSend(v16, sel_overallAestheticScore);
      v26 = v25;
      objc_msgSend(v17, sel_overallAestheticScore);
      if (v26 != v27)
      {
        objc_msgSend(v16, sel_overallAestheticScore);
        v43 = v42;
        objc_msgSend(v17, sel_overallAestheticScore);
        v45 = v44;
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        v41 = v45 < v43;
LABEL_19:
        v46 = !v41;
        if (((v162 ^ v46) & 1) == 0)
          goto LABEL_28;
        goto LABEL_26;
      }
      v28 = objc_msgSend(v16, sel_identifier);
      v157 = sub_244068F48();
      v30 = v29;

      v31 = objc_msgSend(v17, sel_identifier);
      v32 = sub_244068F48();
      v34 = v33;

      v35 = v157 == v32 && v30 == v34;
      v36 = v35 ? 0 : sub_2440690B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      v47 = v162 ^ v36;
      v4 = v161;
      v10 = v159;
      if ((v47 & 1) != 0)
        break;
LABEL_26:
      ++v13;
      v48 = v14 + 3;
      ++v14;
      if (v48 >= v3)
      {
        v13 = v3;
        goto LABEL_28;
      }
    }
    v13 = v14 + 2;
LABEL_28:
    if ((v162 & 1) == 0)
    {
      v11 = v151;
      p_ivars = &CLSSDModel__classData.ivars;
      goto LABEL_38;
    }
    v9 = v156;
    v11 = v151;
    if (v13 < v156)
      goto LABEL_172;
    p_ivars = (__objc2_ivar_list **)(&CLSSDModel__classData + 48);
    if (v156 < v13)
    {
      v49 = (uint64_t *)(v148 + 8 * v13);
      v50 = v13;
      v51 = v156;
      v52 = (uint64_t *)(v10 + 8 * v156);
      do
      {
        if (v51 != --v50)
        {
          if (!v10)
            goto LABEL_176;
          v53 = *v52;
          *v52 = *v49;
          *v49 = v53;
        }
        ++v51;
        --v49;
        ++v52;
      }
      while (v51 < v50);
LABEL_38:
      v9 = v156;
    }
LABEL_39:
    if (v13 < v3)
      break;
LABEL_71:
    if (v13 < v9)
      goto LABEL_167;
    v164 = v13;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_244056180(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v90 = *((_QWORD *)v11 + 2);
    v89 = *((_QWORD *)v11 + 3);
    v91 = v90 + 1;
    v92 = v10;
    if (v90 >= v89 >> 1)
      v11 = sub_244056180((char *)(v89 > 1), v90 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v91;
    v93 = v11 + 32;
    v94 = &v11[16 * v90 + 32];
    *(_QWORD *)v94 = v156;
    *((_QWORD *)v94 + 1) = v13;
    if (v90)
    {
      while (1)
      {
        v95 = v91 - 1;
        if (v91 >= 4)
        {
          v100 = &v93[16 * v91];
          v101 = *((_QWORD *)v100 - 8);
          v102 = *((_QWORD *)v100 - 7);
          v106 = __OFSUB__(v102, v101);
          v103 = v102 - v101;
          if (v106)
            goto LABEL_152;
          v105 = *((_QWORD *)v100 - 6);
          v104 = *((_QWORD *)v100 - 5);
          v106 = __OFSUB__(v104, v105);
          v98 = v104 - v105;
          v99 = v106;
          if (v106)
            goto LABEL_153;
          v107 = v91 - 2;
          v108 = &v93[16 * v91 - 32];
          v110 = *(_QWORD *)v108;
          v109 = *((_QWORD *)v108 + 1);
          v106 = __OFSUB__(v109, v110);
          v111 = v109 - v110;
          if (v106)
            goto LABEL_154;
          v106 = __OFADD__(v98, v111);
          v112 = v98 + v111;
          if (v106)
            goto LABEL_156;
          if (v112 >= v103)
          {
            v130 = &v93[16 * v95];
            v132 = *(_QWORD *)v130;
            v131 = *((_QWORD *)v130 + 1);
            v106 = __OFSUB__(v131, v132);
            v133 = v131 - v132;
            if (v106)
              goto LABEL_162;
            v123 = v98 < v133;
            goto LABEL_108;
          }
        }
        else
        {
          if (v91 != 3)
          {
            v124 = *((_QWORD *)v11 + 4);
            v125 = *((_QWORD *)v11 + 5);
            v106 = __OFSUB__(v125, v124);
            v117 = v125 - v124;
            v118 = v106;
            goto LABEL_102;
          }
          v97 = *((_QWORD *)v11 + 4);
          v96 = *((_QWORD *)v11 + 5);
          v106 = __OFSUB__(v96, v97);
          v98 = v96 - v97;
          v99 = v106;
        }
        if ((v99 & 1) != 0)
          goto LABEL_155;
        v107 = v91 - 2;
        v113 = &v93[16 * v91 - 32];
        v115 = *(_QWORD *)v113;
        v114 = *((_QWORD *)v113 + 1);
        v116 = __OFSUB__(v114, v115);
        v117 = v114 - v115;
        v118 = v116;
        if (v116)
          goto LABEL_157;
        v119 = &v93[16 * v95];
        v121 = *(_QWORD *)v119;
        v120 = *((_QWORD *)v119 + 1);
        v106 = __OFSUB__(v120, v121);
        v122 = v120 - v121;
        if (v106)
          goto LABEL_159;
        if (__OFADD__(v117, v122))
          goto LABEL_161;
        if (v117 + v122 >= v98)
        {
          v123 = v98 < v122;
LABEL_108:
          if (v123)
            v95 = v107;
          goto LABEL_110;
        }
LABEL_102:
        if ((v118 & 1) != 0)
          goto LABEL_158;
        v126 = &v93[16 * v95];
        v128 = *(_QWORD *)v126;
        v127 = *((_QWORD *)v126 + 1);
        v106 = __OFSUB__(v127, v128);
        v129 = v127 - v128;
        if (v106)
          goto LABEL_160;
        if (v129 < v117)
          goto LABEL_119;
LABEL_110:
        v134 = v95 - 1;
        if (v95 - 1 >= v91)
        {
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
          goto LABEL_171;
        }
        if (!v92)
          goto LABEL_175;
        v135 = v92;
        v136 = &v93[16 * v134];
        v137 = *(_QWORD *)v136;
        v4 = (id)v95;
        v138 = &v93[16 * v95];
        v139 = *((_QWORD *)v138 + 1);
        sub_244055E90((char *)(v135 + 8 * *(_QWORD *)v136), (char *)(v135 + 8 * *(_QWORD *)v138), v135 + 8 * v139, __dst, v161);
        if (v160)
        {
LABEL_126:
          swift_bridgeObjectRelease();
          v4 = v161;
          v3 = v153;
          goto LABEL_127;
        }
        if (v139 < v137)
          goto LABEL_149;
        if ((unint64_t)v4 > *((_QWORD *)v11 + 2))
          goto LABEL_150;
        *(_QWORD *)v136 = v137;
        *(_QWORD *)&v93[16 * v134 + 8] = v139;
        v140 = *((_QWORD *)v11 + 2);
        if ((unint64_t)v4 >= v140)
          goto LABEL_151;
        v91 = v140 - 1;
        memmove(v138, v138 + 16, 16 * (v140 - 1 - (_QWORD)v4));
        *((_QWORD *)v11 + 2) = v140 - 1;
        v4 = v161;
        v92 = v159;
        p_ivars = (__objc2_ivar_list **)(&CLSSDModel__classData + 48);
        if (v140 <= 2)
          goto LABEL_119;
      }
    }
    v91 = 1;
LABEL_119:
    v3 = v153;
    v9 = v164;
    v10 = v92;
    if (v164 >= v153)
      goto LABEL_130;
  }
  if (__OFSUB__(v13, v9))
    goto LABEL_169;
  if (v13 - v9 >= v150)
  {
LABEL_70:
    v9 = v156;
    goto LABEL_71;
  }
  if (__OFADD__(v156, v150))
    goto LABEL_170;
  if (v156 + v150 >= v3)
    v54 = v3;
  else
    v54 = v156 + v150;
  if (v54 >= v156)
  {
    if (v13 == v54)
    {
      v9 = v156;
      goto LABEL_71;
    }
    v152 = v11;
    v55 = v148 + 8 * v13;
    v154 = v54;
LABEL_50:
    v163 = v13;
    v56 = *(void **)(v10 + 8 * v13);
    v57 = v156;
    v158 = v55;
    v58 = v55;
    while (1)
    {
      v59 = *(void **)v58;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      v60 = objc_msgSend(v56, (SEL)p_ivars[257]);
      if (v60 == objc_msgSend(v59, (SEL)p_ivars[257]))
      {
        objc_msgSend(v56, sel_curationScore);
        v63 = v62;
        objc_msgSend(v59, sel_curationScore);
        v65 = vabdd_f64(v63, v64);
        objc_msgSend(v4, sel_comparableCurationScoreThreshold);
        if (v66 <= v65)
        {
          objc_msgSend(v56, sel_curationScore);
          v81 = v80;
          objc_msgSend(v59, sel_curationScore);
          v83 = v82;
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          if (v83 >= v81)
            goto LABEL_67;
        }
        else
        {
          objc_msgSend(v56, sel_overallAestheticScore);
          v68 = v67;
          objc_msgSend(v59, sel_overallAestheticScore);
          if (v68 == v69)
          {
            v70 = objc_msgSend(v56, sel_identifier);
            v71 = sub_244068F48();
            v73 = v72;

            v74 = objc_msgSend(v59, sel_identifier);
            v75 = sub_244068F48();
            v77 = v76;

            if (v71 == v75 && v73 == v77)
            {
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease_n();
              v4 = v161;
              v10 = v159;
              p_ivars = (__objc2_ivar_list **)(&CLSSDModel__classData + 48);
LABEL_67:
              v13 = v163 + 1;
              v55 = v158 + 8;
              if (v163 + 1 == v154)
              {
                v13 = v154;
                v11 = v152;
                goto LABEL_70;
              }
              goto LABEL_50;
            }
            v79 = sub_2440690B0();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v4 = v161;
            v10 = v159;
            p_ivars = (__objc2_ivar_list **)(&CLSSDModel__classData + 48);
            if ((v79 & 1) == 0)
              goto LABEL_67;
          }
          else
          {
            objc_msgSend(v56, sel_overallAestheticScore);
            v85 = v84;
            objc_msgSend(v59, sel_overallAestheticScore);
            v87 = v86;
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            if (v87 >= v85)
              goto LABEL_67;
          }
        }
      }
      else
      {
        v61 = objc_msgSend(v56, (SEL)p_ivars[257]);
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if ((v61 & 1) == 0)
          goto LABEL_67;
      }
      if (!v10)
        goto LABEL_174;
      v88 = *(void **)v58;
      v56 = *(void **)(v58 + 8);
      *(_QWORD *)v58 = v56;
      *(_QWORD *)(v58 + 8) = v88;
      v58 -= 8;
      if (v163 == ++v57)
        goto LABEL_67;
    }
  }
LABEL_171:
  __break(1u);
LABEL_172:
  __break(1u);
LABEL_173:
  __break(1u);
LABEL_174:

  __break(1u);
LABEL_175:

  __break(1u);
LABEL_176:

  __break(1u);
LABEL_177:

  __break(1u);
}

void sub_244055BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  unsigned __int8 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;
  float v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  float v37;
  float v38;
  float v39;
  void *v40;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;

  v5 = a5;
  if (a3 == a2)
    goto LABEL_2;
  v6 = a3;
  v7 = *a4;
  v8 = *a4 + 8 * a3 - 8;
  v44 = *a4;
  while (2)
  {
    v9 = *(void **)(v7 + 8 * v6);
    v10 = a1;
    v43 = v8;
    v46 = v6;
    while (1)
    {
      v11 = *(void **)v8;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      v12 = objc_msgSend(v9, sel_favorite);
      if (v12 == objc_msgSend(v11, sel_favorite))
        break;
      v13 = objc_msgSend(v9, sel_favorite);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if ((v13 & 1) == 0)
        goto LABEL_21;
LABEL_19:
      if (!v7)
      {
        __break(1u);
        return;
      }
      v40 = *(void **)v8;
      v9 = *(void **)(v8 + 8);
      *(_QWORD *)v8 = v9;
      *(_QWORD *)(v8 + 8) = v40;
      v8 -= 8;
      if (v6 == ++v10)
        goto LABEL_21;
    }
    objc_msgSend(v9, sel_curationScore);
    v15 = v14;
    objc_msgSend(v11, sel_curationScore);
    v17 = vabdd_f64(v15, v16);
    objc_msgSend(v5, sel_comparableCurationScoreThreshold);
    if (v18 <= v17)
    {
      objc_msgSend(v9, sel_curationScore);
      v33 = v32;
      objc_msgSend(v11, sel_curationScore);
      v35 = v34;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if (v35 >= v33)
        goto LABEL_21;
      goto LABEL_19;
    }
    objc_msgSend(v9, sel_overallAestheticScore);
    v20 = v19;
    objc_msgSend(v11, sel_overallAestheticScore);
    if (v20 != v21)
    {
      objc_msgSend(v9, sel_overallAestheticScore);
      v37 = v36;
      objc_msgSend(v11, sel_overallAestheticScore);
      v39 = v38;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if (v39 >= v37)
        goto LABEL_21;
      goto LABEL_19;
    }
    v22 = objc_msgSend(v9, sel_identifier);
    v23 = sub_244068F48();
    v25 = v24;

    v26 = objc_msgSend(v11, sel_identifier);
    v27 = sub_244068F48();
    v29 = v28;

    if (v23 != v27 || v25 != v29)
    {
      v31 = sub_2440690B0();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v7 = v44;
      v5 = a5;
      v6 = v46;
      if ((v31 & 1) == 0)
        goto LABEL_21;
      goto LABEL_19;
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
    v7 = v44;
    v5 = a5;
    v6 = v46;
LABEL_21:
    ++v6;
    v8 = v43 + 8;
    if (v6 != a2)
      continue;
    break;
  }
LABEL_2:

}

uint64_t sub_244055E90(char *__src, char *a2, unint64_t a3, char *__dst, void *a5)
{
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char *v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v16;
  BOOL v17;
  id *v19;
  char *v20;
  unint64_t v21;
  char *v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  _QWORD *v25;
  char *v26;
  BOOL v27;
  char *v28;
  void *v29;
  unint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  void *v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  char *v37;
  BOOL v38;
  BOOL v39;
  char *v40;
  char *__srca;
  void *v43;
  id v44;

  v6 = __dst;
  v7 = a3;
  v9 = __src;
  v10 = a2 - __src;
  v11 = (a2 - __src) / 8;
  v12 = a3 - (_QWORD)a2;
  v13 = (uint64_t)(a3 - (_QWORD)a2) / 8;
  if (v11 >= v13)
  {
    sub_244054D08(a2, (uint64_t)(a3 - (_QWORD)a2) / 8, __dst);
    v14 = &v6[8 * v13];
    v17 = v9 >= a2 || v12 < 8;
    v16 = a2;
    if (v17)
      goto LABEL_13;
    v40 = v9;
    __srca = v6;
    v28 = (char *)(v7 - 8);
    v29 = a5;
    v20 = &v6[8 * v13];
    while (1)
    {
      v30 = (unint64_t)v20;
      v31 = v20 - 8;
      v44 = (id)*((_QWORD *)v20 - 1);
      v32 = v16;
      v34 = (void *)*((_QWORD *)v16 - 1);
      v33 = v16 - 8;
      v43 = v34;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      v35 = sub_2440549AC(&v44, &v43, v29);
      if (v5)
      {
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        sub_244054D08(__srca, (uint64_t)(v30 - (_QWORD)__srca) / 8, v32);
        goto LABEL_15;
      }
      v36 = v35;
      v37 = v28 + 8;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if ((v36 & 1) != 0)
      {
        v38 = v37 != v32 || v28 >= v32;
        v32 = v33;
        if (v38)
          goto LABEL_38;
      }
      else
      {
        v39 = v37 != (char *)v30 || (unint64_t)v28 >= v30;
        v33 = v31;
        v30 = (unint64_t)v31;
        if (v39)
LABEL_38:
          *(_QWORD *)v28 = *(_QWORD *)v33;
      }
      v16 = v32;
      v6 = __srca;
      v29 = a5;
      if (v32 <= v40)
      {
        v20 = (char *)v30;
        goto LABEL_14;
      }
      v28 -= 8;
      v20 = (char *)v30;
      if (v30 <= (unint64_t)__srca)
        goto LABEL_14;
    }
  }
  sub_244054D08(__src, (a2 - __src) / 8, __dst);
  v14 = &v6[8 * v11];
  if ((unint64_t)a2 < v7 && v10 >= 8)
  {
    v19 = (id *)a2;
    v20 = &v6[8 * v11];
    while (1)
    {
      v21 = v7;
      v22 = v9;
      v44 = *v19;
      v43 = *(void **)v6;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      v23 = sub_2440549AC(&v44, &v43, a5);
      if (v5)
      {
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        sub_244054D08(v6, (v20 - v6) / 8, v9);
        v29 = a5;
        goto LABEL_15;
      }
      v24 = v23;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if ((v24 & 1) == 0)
        break;
      v25 = v19;
      v26 = v22;
      v27 = v22 == (char *)v19++;
      if (!v27)
        goto LABEL_22;
LABEL_23:
      v9 = v26 + 8;
      if (v6 < v20)
      {
        v7 = v21;
        if ((unint64_t)v19 < v21)
          continue;
      }
      v16 = v9;
      v29 = a5;
      goto LABEL_14;
    }
    v25 = v6;
    v26 = v22;
    v27 = v22 == v6;
    v6 += 8;
    if (v27)
      goto LABEL_23;
LABEL_22:
    *(_QWORD *)v26 = *v25;
    goto LABEL_23;
  }
  v16 = v9;
LABEL_13:
  v29 = a5;
  v20 = v14;
LABEL_14:
  sub_244054D08(v6, (v20 - v6) / 8, v16);
LABEL_15:

  return 1;
}

char *sub_244056180(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257337930);
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

char *sub_244056274(uint64_t a1)
{
  return sub_244056180(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void (*sub_244056288(uint64_t **a1, unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t *v6;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_244056308(v6, a2, a3);
  return sub_2440562DC;
}

void sub_2440562DC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_244056308(uint64_t *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6;
  uint64_t v7;

  v6 = a3 & 0xC000000000000001;
  sub_244055004(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = MEMORY[0x249506E84](a2, a3);
  else
    v7 = swift_unknownObjectRetain();
  *a1 = v7;
  return sub_244056374;
}

uint64_t sub_244056374()
{
  return swift_unknownObjectRelease();
}

unint64_t type metadata accessor for PNKeyPickerProcessor()
{
  unint64_t result;

  result = qword_2573378A8;
  if (!qword_2573378A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2573378A8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249507334]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2440563F8(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_244069074();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_244069074();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_244056580();
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_257337920);
            v10 = sub_244056288(v13, i, a3);
            v12 = *v11;
            swift_unknownObjectRetain();
            ((void (*)(uint64_t **, _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_244054D8C((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_244056580()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257337928;
  if (!qword_257337928)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257337920);
    result = MEMORY[0x24950734C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_257337928);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249507340](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_244056608()
{
  JUMPOUT(0x249506ECCLL);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_release();
}

BOOL sub_244056624(uint64_t a1)
{
  return a1 != 0;
}

uint64_t sub_244056638()
{
  sub_2440690D4();
  sub_2440690E0();
  return sub_2440690EC();
}

uint64_t sub_244056678()
{
  return sub_2440567D8();
}

uint64_t sub_244056684(char a1)
{
  sub_2440690D4();
  sub_244056A04(a1);
  sub_244068F54();
  swift_bridgeObjectRelease();
  return sub_2440690EC();
}

uint64_t sub_2440566E8(uint64_t a1, char a2)
{
  sub_244056A04(a2);
  sub_244068F54();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244056728()
{
  return sub_2440690E0();
}

uint64_t sub_24405674C()
{
  sub_244068F54();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2440567D8()
{
  sub_2440690D4();
  sub_244068F54();
  swift_bridgeObjectRelease();
  return sub_2440690EC();
}

uint64_t sub_244056884()
{
  sub_2440690D4();
  sub_2440690E0();
  return sub_2440690EC();
}

uint64_t sub_2440568C0(uint64_t a1, char a2)
{
  sub_2440690D4();
  sub_244056A04(a2);
  sub_244068F54();
  swift_bridgeObjectRelease();
  return sub_2440690EC();
}

uint64_t sub_24405691C()
{
  unint64_t v0;

  sub_24406908C();
  OUTLINED_FUNCTION_0_0();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_24405695C(char a1)
{
  if (!a1)
    return 0xD00000000000001BLL;
  if (a1 == 1)
    return 0xD000000000000018;
  return 0x6E6974617265706FLL;
}

uint64_t sub_2440569C4()
{
  unint64_t v0;

  sub_24406908C();
  OUTLINED_FUNCTION_0_0();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_244056A04(char a1)
{
  return *(_QWORD *)&aNone_1[8 * a1];
}

BOOL sub_244056A24@<W0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  _BOOL8 result;

  result = sub_244056624(*a1);
  *a2 = result;
  return result;
}

void sub_244056A54(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void sub_244056A5C(unsigned __int8 *a1, char *a2)
{
  sub_24405BF70(*a1, *a2);
}

uint64_t sub_244056A68()
{
  return sub_244056678();
}

uint64_t sub_244056A70()
{
  return sub_24405674C();
}

uint64_t sub_244056A78()
{
  return sub_2440567D8();
}

uint64_t sub_244056A80@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24405691C();
  *a1 = result;
  return result;
}

uint64_t sub_244056AAC@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_24405695C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_244056AD4(char *a1, char *a2)
{
  sub_24405BEF0(*a1, *a2);
}

uint64_t sub_244056AE0()
{
  char *v0;

  return sub_244056684(*v0);
}

uint64_t sub_244056AE8(uint64_t a1)
{
  char *v1;

  return sub_2440566E8(a1, *v1);
}

uint64_t sub_244056AF0(uint64_t a1)
{
  char *v1;

  return sub_2440568C0(a1, *v1);
}

uint64_t sub_244056AF8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2440569C4();
  *a1 = result;
  return result;
}

uint64_t sub_244056B24@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_244056A04(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_244056B4C(uint64_t a1, char a2, char a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_BYTE *)(v4 + 24) = a2;
  *(_BYTE *)(v4 + 25) = a3;
  *(_QWORD *)(v4 + 32) = a4;
  return v4;
}

uint64_t sub_244056B64()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SceneConfiguration()
{
  return objc_opt_self();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_244056BB8(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_244056C40(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244056C8C + 4 * byte_24406C0C5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_244056CC0 + 4 * byte_24406C0C0[v4]))();
}

uint64_t sub_244056CC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244056CC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244056CD0);
  return result;
}

uint64_t sub_244056CDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244056CE4);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_244056CE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244056CF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for BoundingBoxSizeType()
{
  OUTLINED_FUNCTION_1();
}

uint64_t sub_244056D0C(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 2) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_244056D94(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_244056DE0 + 4 * byte_24406C0CF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_244056E14 + 4 * byte_24406C0CA[v4]))();
}

uint64_t sub_244056E14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244056E1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244056E24);
  return result;
}

uint64_t sub_244056E30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244056E38);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_244056E3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244056E44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244056E50(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_244056E58(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for ThresholdType()
{
  OUTLINED_FUNCTION_1();
}

uint64_t sub_244056E70(unsigned int *a1, int a2)
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

uint64_t sub_244056EC0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_244056F00 + 4 * byte_24406C0D4[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_244056F20 + 4 * byte_24406C0D9[v4]))();
}

_BYTE *sub_244056F00(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_244056F20(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244056F28(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244056F30(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244056F38(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244056F40(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_244056F4C()
{
  return 0;
}

void type metadata accessor for ConfigurationType()
{
  OUTLINED_FUNCTION_1();
}

unint64_t sub_244056F64()
{
  unint64_t result;

  result = qword_2573379A0;
  if (!qword_2573379A0)
  {
    result = MEMORY[0x24950734C](&unk_24406C20C, &unk_25149AFC8);
    atomic_store(result, (unint64_t *)&qword_2573379A0);
  }
  return result;
}

unint64_t sub_244056FA4()
{
  unint64_t result;

  result = qword_2573379A8;
  if (!qword_2573379A8)
  {
    result = MEMORY[0x24950734C](&unk_24406C2AC, &unk_25149AF38);
    atomic_store(result, (unint64_t *)&qword_2573379A8);
  }
  return result;
}

unint64_t sub_244056FE4()
{
  unint64_t result;

  result = qword_2573379B0;
  if (!qword_2573379B0)
  {
    result = MEMORY[0x24950734C](&unk_24406C34C, &unk_25149B0F0);
    atomic_store(result, (unint64_t *)&qword_2573379B0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_bridgeObjectRelease();
}

void PNAssetGroupOptions.groupByDifferentOrientation.getter()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
}

void PNAssetGroupOptions.groupByDifferentOrientation.setter(char a1)
{
  _BYTE *v1;

  OUTLINED_FUNCTION_1_0();
  *v1 = a1;
  OUTLINED_FUNCTION_2();
}

void PNAssetGroupOptions.groupBySharedLibraryParticipationState.getter()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
}

void PNAssetGroupOptions.groupBySharedLibraryParticipationState.setter(char a1)
{
  _BYTE *v1;

  OUTLINED_FUNCTION_1_0();
  *v1 = a1;
  OUTLINED_FUNCTION_2();
}

double PNAssetGroupOptions.comparableCurationScoreThreshold.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_1();
  return *(double *)v0;
}

uint64_t PNAssetGroupOptions.comparableCurationScoreThreshold.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___PNAssetGroupOptions_comparableCurationScoreThreshold);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

void PNAssetGroupOptions.distanceThreshold.getter()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
}

void PNAssetGroupOptions.distanceThreshold.setter(int a1)
{
  _DWORD *v1;

  OUTLINED_FUNCTION_1_0();
  *v1 = a1;
  OUTLINED_FUNCTION_2();
}

void PNAssetGroupOptions.distanceFromFirstThreshold.getter()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
}

void PNAssetGroupOptions.distanceFromFirstThreshold.setter(int a1)
{
  _DWORD *v1;

  OUTLINED_FUNCTION_1_0();
  *v1 = a1;
  OUTLINED_FUNCTION_2();
}

void PNAssetGroupOptions.distanceIfAdjustedDiffersThreshold.getter()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
}

void PNAssetGroupOptions.distanceIfAdjustedDiffersThreshold.setter(int a1)
{
  _DWORD *v1;

  OUTLINED_FUNCTION_1_0();
  *v1 = a1;
  OUTLINED_FUNCTION_2();
}

void __swiftcall PNAssetGroupOptions.init()(PNAssetGroupOptions *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id PNAssetGroupOptions.init()()
{
  uint64_t v0;
  objc_super v2;

  *(_BYTE *)(v0 + OBJC_IVAR___PNAssetGroupOptions_groupByDifferentOrientation) = 1;
  *(_BYTE *)(v0 + OBJC_IVAR___PNAssetGroupOptions_groupBySharedLibraryParticipationState) = 1;
  *(_QWORD *)(v0 + OBJC_IVAR___PNAssetGroupOptions_comparableCurationScoreThreshold) = 0x3FA999999999999ALL;
  *(_DWORD *)(v0 + OBJC_IVAR___PNAssetGroupOptions_distanceThreshold) = 150;
  *(_DWORD *)(v0 + OBJC_IVAR___PNAssetGroupOptions_distanceFromFirstThreshold) = -1;
  *(_DWORD *)(v0 + OBJC_IVAR___PNAssetGroupOptions_distanceIfAdjustedDiffersThreshold) = -1;
  v2.super_class = (Class)PNAssetGroupOptions;
  return objc_msgSendSuper2(&v2, sel_init);
}

char *keypath_get_selector_groupByDifferentOrientation()
{
  return sel_groupByDifferentOrientation;
}

void sub_2440574C0(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1), sel_groupByDifferentOrientation);
  OUTLINED_FUNCTION_4();
}

id sub_2440574E8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGroupByDifferentOrientation_, *a1);
}

char *keypath_get_selector_groupBySharedLibraryParticipationState()
{
  return sel_groupBySharedLibraryParticipationState;
}

void sub_244057508(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1), sel_groupBySharedLibraryParticipationState);
  OUTLINED_FUNCTION_4();
}

id sub_244057530(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGroupBySharedLibraryParticipationState_, *a1);
}

char *keypath_get_selector_comparableCurationScoreThreshold()
{
  return sel_comparableCurationScoreThreshold;
}

void sub_244057550(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  objc_msgSend((id)OUTLINED_FUNCTION_5(a1), sel_comparableCurationScoreThreshold);
  *v1 = v2;
  OUTLINED_FUNCTION_4();
}

id sub_244057578(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setComparableCurationScoreThreshold_, *a1);
}

char *keypath_get_selector_distanceThreshold()
{
  return sel_distanceThreshold;
}

void sub_244057598(uint64_t a1)
{
  _DWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1), sel_distanceThreshold);
  OUTLINED_FUNCTION_4();
}

id sub_2440575C0(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDistanceThreshold_, *a1);
}

char *keypath_get_selector_distanceFromFirstThreshold()
{
  return sel_distanceFromFirstThreshold;
}

void sub_2440575E0(uint64_t a1)
{
  _DWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1), sel_distanceFromFirstThreshold);
  OUTLINED_FUNCTION_4();
}

id sub_244057608(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDistanceFromFirstThreshold_, *a1);
}

char *keypath_get_selector_distanceIfAdjustedDiffersThreshold()
{
  return sel_distanceIfAdjustedDiffersThreshold;
}

void sub_244057628(uint64_t a1)
{
  _DWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1), sel_distanceIfAdjustedDiffersThreshold);
  OUTLINED_FUNCTION_4();
}

id sub_244057650(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDistanceIfAdjustedDiffersThreshold_, *a1);
}

unint64_t type metadata accessor for PNAssetGroupOptions()
{
  unint64_t result;

  result = qword_2573379E8;
  if (!qword_2573379E8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2573379E8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t sub_244057710()
{
  uint64_t v0;

  v0 = sub_244068F30();
  __swift_allocate_value_buffer(v0, qword_257338090);
  __swift_project_value_buffer(v0, (uint64_t)qword_257338090);
  return sub_244068F24();
}

uint64_t static ProgressReporter<>.ignore.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for RootProgressReporter(0);
  swift_allocObject();
  result = RootProgressReporter.init(_:)((uint64_t)nullsub_1, 0);
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for RootProgressReporter;
  *a1 = result;
  return result;
}

uint64_t dispatch thunk of ProgressReporter.start()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ProgressReporter.report(progress:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ProgressReporter.complete()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ProgressReporter.canProceed(progress:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ProgressReporter.child(from:to:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ProgressReporter.child(from:to:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of ProgressReporter.split(at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of ProgressReporter.split(at:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t dispatch thunk of ProgressReporter.split(at:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 72))();
}

uint64_t dispatch thunk of ProgressReporter.split(at:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 80))();
}

uint64_t dispatch thunk of ProgressReporter.split(at:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 88))();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void RootProgressReporter.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  sub_2440592B0(a1, a2, (void (*)(uint64_t, uint64_t))RootProgressReporter.init(_:));
}

{
  sub_2440592B0(a1, a2, (void (*)(uint64_t, uint64_t))RootProgressReporter.init(_:));
}

uint64_t sub_2440578DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint8_t *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = v2;
  sub_244068E94();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244068F30();
  v24 = *(_QWORD *)(v9 - 8);
  v25 = v9;
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v23 - v13;
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2) & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t))(a2 + 72))(a1, a2);
    v15 = sub_244068F18();
    v16 = sub_244068FD8();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v23[1] = v3;
      v18 = v17;
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_244052000, v15, v16, "Progress reporter has already been started", v17, 2u);
      MEMORY[0x2495073B8](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v25);
  }
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2) & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t))(a2 + 72))(a1, a2);
    v19 = sub_244068F18();
    v20 = sub_244068FD8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_244052000, v19, v20, "Progress reporter has already completed", v21, 2u);
      MEMORY[0x2495073B8](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v25);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 32))(1, a1, a2);
  (*(void (**)(uint64_t, uint64_t, double))(a2 + 88))(a1, a2, 0.0);
  sub_244068E88();
  (*(void (**)(char *, uint64_t, uint64_t))(a2 + 112))(v8, a1, a2);
  v26 = v4;
  return (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)(a2 + 8) + 16))(a1, 0.0);
}

uint64_t sub_244057B88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint8_t *v18;
  uint8_t *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint8_t *v24;
  uint8_t *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = v3;
  v5 = v2;
  v8 = sub_244068F30();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v27 - v13;
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2) & 1) == 0)
  {
    v28 = v8;
    (*(void (**)(uint64_t, uint64_t))(a2 + 72))(a1, a2);
    v15 = sub_244068F18();
    v16 = sub_244068FD8();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v27 = v3;
      v18 = v17;
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_244052000, v15, v16, "Progress reporter has not been started", v17, 2u);
      v19 = v18;
      v4 = v27;
      MEMORY[0x2495073B8](v19, -1, -1);
    }

    v8 = v28;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v28);
  }
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2) & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t))(a2 + 72))(a1, a2);
    v20 = sub_244068F18();
    v21 = sub_244068FD8();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v28 = v8;
      v23 = v4;
      v24 = v22;
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_244052000, v20, v21, "Progress reporter has already completed", v22, 2u);
      v25 = v24;
      v4 = v23;
      v8 = v28;
      MEMORY[0x2495073B8](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  v29 = v5;
  result = (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)(a2 + 8) + 16))(a1, 1.0);
  if (!v4)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 56))(1, a1, a2);
  return result;
}

uint64_t sub_244057DEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v10;
  double (*v11)(uint64_t, uint64_t, double);
  double v12;
  double v13;
  uint64_t v14;
  uint64_t result;

  v10 = (*(uint64_t (**)(void))(a2 + 16))();
  v11 = *(double (**)(uint64_t, uint64_t, double))(a2 + 128);
  v12 = v11(a1, a2, a4);
  v13 = v11(a1, a2, a5);
  v14 = type metadata accessor for ChildProgressReporter(0);
  swift_allocObject();
  result = sub_244059D04(v10, v12, v13);
  a3[3] = v14;
  a3[4] = (uint64_t)&off_25149B2E8;
  *a3 = result;
  return result;
}

uint64_t sub_244057EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, double, double))(*(_QWORD *)(a5 + 8) + 40))(a4, (double)a1 / (double)a3, (double)a2 / (double)a3);
}

uint64_t sub_244057EF0(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  double (*v12)(uint64_t, uint64_t, double);
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t result;

  v10 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 16);
  v11 = v10(a3, a4);
  v12 = *(double (**)(uint64_t, uint64_t, double))(a4 + 128);
  v13 = v12(a3, a4, 0.0);
  v14 = v12(a3, a4, a5);
  v15 = type metadata accessor for ChildProgressReporter(0);
  swift_allocObject();
  v16 = sub_244059D04(v11, v13, v14);
  a1[3] = v15;
  a1[4] = (uint64_t)&off_25149B2E8;
  *a1 = v16;
  v17 = v10(a3, a4);
  v18 = v12(a3, a4, a5);
  v19 = v12(a3, a4, 1.0);
  swift_allocObject();
  result = sub_244059D04(v17, v18, v19);
  a2[3] = v15;
  a2[4] = (uint64_t)&off_25149B2E8;
  *a2 = result;
  return result;
}

uint64_t sub_244058034(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  double (*v15)(uint64_t, uint64_t, double);
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t result;

  v13 = *(uint64_t (**)(uint64_t, uint64_t))(a5 + 16);
  v14 = v13(a4, a5);
  v15 = *(double (**)(uint64_t, uint64_t, double))(a5 + 128);
  v16 = v15(a4, a5, 0.0);
  v17 = v15(a4, a5, a6);
  v18 = type metadata accessor for ChildProgressReporter(0);
  swift_allocObject();
  v19 = sub_244059D04(v14, v16, v17);
  a1[3] = v18;
  a1[4] = (uint64_t)&off_25149B2E8;
  *a1 = v19;
  v20 = v13(a4, a5);
  v21 = v15(a4, a5, a6);
  v22 = v15(a4, a5, a7);
  swift_allocObject();
  v23 = sub_244059D04(v20, v21, v22);
  a2[3] = v18;
  a2[4] = (uint64_t)&off_25149B2E8;
  *a2 = v23;
  v24 = v13(a4, a5);
  v25 = v15(a4, a5, a7);
  v26 = v15(a4, a5, 1.0);
  swift_allocObject();
  result = sub_244059D04(v24, v25, v26);
  a3[3] = v18;
  a3[4] = (uint64_t)&off_25149B2E8;
  *a3 = result;
  return result;
}

uint64_t sub_2440581F4(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9)
{
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  double (*v18)(uint64_t, uint64_t, double);
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t result;

  v16 = *(uint64_t (**)(uint64_t, uint64_t))(a6 + 16);
  v17 = v16(a5, a6);
  v18 = *(double (**)(uint64_t, uint64_t, double))(a6 + 128);
  v19 = v18(a5, a6, 0.0);
  v20 = v18(a5, a6, a7);
  v21 = type metadata accessor for ChildProgressReporter(0);
  swift_allocObject();
  v22 = sub_244059D04(v17, v19, v20);
  a1[3] = v21;
  a1[4] = (uint64_t)&off_25149B2E8;
  *a1 = v22;
  v23 = v16(a5, a6);
  v24 = v18(a5, a6, a7);
  v25 = v18(a5, a6, a8);
  swift_allocObject();
  v26 = sub_244059D04(v23, v24, v25);
  a2[3] = v21;
  a2[4] = (uint64_t)&off_25149B2E8;
  *a2 = v26;
  v27 = v16(a5, a6);
  v28 = v18(a5, a6, a8);
  v29 = v18(a5, a6, a9);
  swift_allocObject();
  v30 = sub_244059D04(v27, v28, v29);
  a3[3] = v21;
  a3[4] = (uint64_t)&off_25149B2E8;
  *a3 = v30;
  v31 = v16(a5, a6);
  v32 = v18(a5, a6, a9);
  v33 = v18(a5, a6, 1.0);
  swift_allocObject();
  result = sub_244059D04(v31, v32, v33);
  a4[3] = v21;
  a4[4] = (uint64_t)&off_25149B2E8;
  *a4 = result;
  return result;
}

uint64_t sub_24405842C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10, double a11)
{
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  double (*v21)(uint64_t, uint64_t, double);
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  uint64_t result;

  v19 = *(uint64_t (**)(uint64_t, uint64_t))(a7 + 16);
  v20 = v19(a6, a7);
  v21 = *(double (**)(uint64_t, uint64_t, double))(a7 + 128);
  v22 = v21(a6, a7, 0.0);
  v23 = v21(a6, a7, a8);
  v24 = type metadata accessor for ChildProgressReporter(0);
  swift_allocObject();
  v25 = sub_244059D04(v20, v22, v23);
  a1[3] = v24;
  a1[4] = (uint64_t)&off_25149B2E8;
  *a1 = v25;
  v26 = v19(a6, a7);
  v27 = v21(a6, a7, a8);
  v28 = v21(a6, a7, a9);
  swift_allocObject();
  v29 = sub_244059D04(v26, v27, v28);
  a2[3] = v24;
  a2[4] = (uint64_t)&off_25149B2E8;
  *a2 = v29;
  v30 = v19(a6, a7);
  v31 = v21(a6, a7, a9);
  v32 = v21(a6, a7, a10);
  swift_allocObject();
  v33 = sub_244059D04(v30, v31, v32);
  a3[3] = v24;
  a3[4] = (uint64_t)&off_25149B2E8;
  *a3 = v33;
  v34 = v19(a6, a7);
  v35 = v21(a6, a7, a10);
  v36 = v21(a6, a7, a11);
  swift_allocObject();
  v37 = sub_244059D04(v34, v35, v36);
  a4[3] = v24;
  a4[4] = (uint64_t)&off_25149B2E8;
  *a4 = v37;
  v38 = v19(a6, a7);
  v39 = v21(a6, a7, a11);
  v40 = v21(a6, a7, 1.0);
  swift_allocObject();
  result = sub_244059D04(v38, v39, v40);
  a5[3] = v24;
  a5[4] = (uint64_t)&off_25149B2E8;
  *a5 = result;
  return result;
}

uint64_t sub_2440586E0(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13)
{
  uint64_t (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  double (*v24)(uint64_t, uint64_t, double);
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  uint64_t result;

  v22 = *(uint64_t (**)(uint64_t, uint64_t))(a8 + 16);
  v23 = v22(a7, a8);
  v24 = *(double (**)(uint64_t, uint64_t, double))(a8 + 128);
  v25 = v24(a7, a8, 0.0);
  v26 = v24(a7, a8, a9);
  v27 = type metadata accessor for ChildProgressReporter(0);
  swift_allocObject();
  v28 = sub_244059D04(v23, v25, v26);
  a1[3] = v27;
  a1[4] = (uint64_t)&off_25149B2E8;
  *a1 = v28;
  v29 = v22(a7, a8);
  v30 = v24(a7, a8, a9);
  v31 = v24(a7, a8, a10);
  swift_allocObject();
  v32 = sub_244059D04(v29, v30, v31);
  a2[3] = v27;
  a2[4] = (uint64_t)&off_25149B2E8;
  *a2 = v32;
  v33 = v22(a7, a8);
  v34 = v24(a7, a8, a10);
  v35 = v24(a7, a8, a11);
  swift_allocObject();
  v36 = sub_244059D04(v33, v34, v35);
  a3[3] = v27;
  a3[4] = (uint64_t)&off_25149B2E8;
  *a3 = v36;
  v37 = v22(a7, a8);
  v38 = v24(a7, a8, a11);
  v39 = v24(a7, a8, a12);
  swift_allocObject();
  v40 = sub_244059D04(v37, v38, v39);
  a4[3] = v27;
  a4[4] = (uint64_t)&off_25149B2E8;
  *a4 = v40;
  v41 = v22(a7, a8);
  v42 = v24(a7, a8, a12);
  v43 = v24(a7, a8, a13);
  swift_allocObject();
  v44 = sub_244059D04(v41, v42, v43);
  a5[3] = v27;
  a5[4] = (uint64_t)&off_25149B2E8;
  *a5 = v44;
  v45 = v22(a7, a8);
  v46 = v24(a7, a8, a13);
  v47 = v24(a7, a8, 1.0);
  swift_allocObject();
  result = sub_244059D04(v45, v46, v47);
  a6[3] = v27;
  a6[4] = (uint64_t)&off_25149B2E8;
  *a6 = result;
  return result;
}

uint64_t sub_244058A04(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  double v12;
  double v13;
  NSObject *v14;
  os_log_type_t v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  double v22;
  double v23;
  void (*v24)(char *, uint64_t);
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint8_t *v28;
  uint8_t *v29;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;

  v2 = v1;
  v4 = sub_244068E94();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v31 - v9;
  v11 = OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastProgress;
  v12 = *(double *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastProgress);
  if (v12 > a1)
  {
    v13 = v12 - a1;
    swift_retain();
    v14 = sub_244068F18();
    if (v13 <= 0.001)
      v15 = sub_244068FC0();
    else
      v15 = sub_244068FD8();
    v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      v17 = v11;
      v18 = swift_slowAlloc();
      *(_DWORD *)v18 = 134218240;
      v34 = *(double *)(v2 + v17);
      sub_244069008();
      swift_release();
      *(_WORD *)(v18 + 12) = 2048;
      v34 = a1;
      sub_244069008();
      _os_log_impl(&dword_244052000, v14, v16, "Progress going backwards, from %f to %f", (uint8_t *)v18, 0x16u);
      v19 = v18;
      v11 = v17;
      MEMORY[0x2495073B8](v19, -1, -1);

    }
    else
    {

      swift_release();
    }
  }
  sub_244068E88();
  v20 = v2 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastReportDate;
  swift_beginAccess();
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v21(v8, v20, v4);
  sub_244068E7C();
  v23 = v22;
  v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  v24(v8, v4);
  if (v23 > 1.0)
  {
    v32 = v11;
    v25 = sub_244068F18();
    v26 = sub_244068FD8();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v31 = v5;
      v28 = v27;
      *(_DWORD *)v27 = 134217984;
      v33 = v23;
      sub_244069008();
      _os_log_impl(&dword_244052000, v25, v26, "Progress wasn't called for %f seconds", v28, 0xCu);
      v29 = v28;
      v5 = v31;
      MEMORY[0x2495073B8](v29, -1, -1);
    }

    v11 = v32;
  }
  *(double *)(v2 + v11) = a1;
  v21(v8, (uint64_t)v10, v4);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v20, v8, v4);
  swift_endAccess();
  return ((uint64_t (*)(char *, uint64_t))v24)(v10, v4);
}

uint64_t sub_244058D34(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  double v12;
  double v13;
  NSObject *v14;
  os_log_type_t v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  double v22;
  double v23;
  void (*v24)(char *, uint64_t);
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint8_t *v28;
  uint8_t *v29;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;

  v2 = v1;
  v4 = sub_244068E94();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v31 - v9;
  v11 = OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_lastProgress;
  v12 = *(double *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_lastProgress);
  if (v12 > a1)
  {
    v13 = v12 - a1;
    swift_retain();
    v14 = sub_244068F18();
    if (v13 <= 0.001)
      v15 = sub_244068FC0();
    else
      v15 = sub_244068FD8();
    v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      v17 = v11;
      v18 = swift_slowAlloc();
      *(_DWORD *)v18 = 134218240;
      v34 = *(double *)(v2 + v17);
      sub_244069008();
      swift_release();
      *(_WORD *)(v18 + 12) = 2048;
      v34 = a1;
      sub_244069008();
      _os_log_impl(&dword_244052000, v14, v16, "Progress going backwards, from %f to %f", (uint8_t *)v18, 0x16u);
      v19 = v18;
      v11 = v17;
      MEMORY[0x2495073B8](v19, -1, -1);

    }
    else
    {

      swift_release();
    }
  }
  sub_244068E88();
  v20 = v2 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_lastReportDate;
  swift_beginAccess();
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v21(v8, v20, v4);
  sub_244068E7C();
  v23 = v22;
  v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  v24(v8, v4);
  if (v23 > 1.0)
  {
    v32 = v11;
    v25 = sub_244068F18();
    v26 = sub_244068FD8();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v31 = v5;
      v28 = v27;
      *(_DWORD *)v27 = 134217984;
      v33 = v23;
      sub_244069008();
      _os_log_impl(&dword_244052000, v25, v26, "Progress wasn't called for %f seconds", v28, 0xCu);
      v29 = v28;
      v5 = v31;
      MEMORY[0x2495073B8](v29, -1, -1);
    }

    v11 = v32;
  }
  *(double *)(v2 + v11) = a1;
  v21(v8, (uint64_t)v10, v4);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v20, v8, v4);
  swift_endAccess();
  return ((uint64_t (*)(char *, uint64_t))v24)(v10, v4);
}

uint64_t static RootProgressReporter.ignore.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = type metadata accessor for RootProgressReporter(0);
  v3 = swift_allocObject();
  result = RootProgressReporter.init(_:)((uint64_t)nullsub_1, 0);
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for RootProgressReporter;
  *a1 = v3;
  return result;
}

uint64_t sub_2440590C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_logger;
  v4 = sub_244068F30();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_244059108()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasStarted);
}

uint64_t sub_244059118(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasStarted) = result;
  return result;
}

uint64_t sub_244059128()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasCompleted);
}

uint64_t sub_244059138(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasCompleted) = result;
  return result;
}

void sub_244059148(double a1)
{
  uint64_t v1;

  *(double *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastProgress) = a1;
}

void sub_244059158(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastReportDate;
  OUTLINED_FUNCTION_8();
  v4 = sub_244068E94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  swift_endAccess();
  OUTLINED_FUNCTION_2();
}

uint64_t sub_2440591B8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled);
  OUTLINED_FUNCTION_8();
  return *v1;
}

void sub_2440591F8(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled);
  OUTLINED_FUNCTION_8();
  *v3 = a1;
  OUTLINED_FUNCTION_2();
}

uint64_t (*sub_244059234())()
{
  OUTLINED_FUNCTION_8();
  return j__swift_endAccess;
}

double sub_244059278()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastProgress);
}

uint64_t RootProgressReporter.init(_:)(uint64_t a1, uint64_t a2)
{
  return sub_244059300(a1, a2, 0);
}

{
  return sub_244059300(a1, a2, 1);
}

uint64_t type metadata accessor for RootProgressReporter(uint64_t a1)
{
  return sub_24405A2F8(a1, (uint64_t *)&unk_257337A30);
}

void sub_2440592B0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  swift_allocObject();
  a3(a1, a2);
  OUTLINED_FUNCTION_16();
}

uint64_t sub_244059300(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_logger;
  if (qword_2573378A0 != -1)
    swift_once();
  v8 = sub_244068F30();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_257338090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v3 + v7, v9, v8);
  *(_BYTE *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasStarted) = 0;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasCompleted) = 0;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastProgress) = 0;
  sub_244068E88();
  *(_BYTE *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled) = 0;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  *(_BYTE *)(v3 + 32) = a3 & 1;
  return v3;
}

void sub_2440593E8(double a1)
{
  char *v1;
  void *v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char *v16;
  uint64_t (*v17)(uint64_t, double);
  char v18;
  uint64_t v19;
  char *v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  char *v26;
  _QWORD v27[7];
  id v28;

  v3 = v1;
  v5 = sub_244068F84();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v1[OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasStarted] & 1) == 0)
  {
    OUTLINED_FUNCTION_21();
    v9 = OUTLINED_FUNCTION_20();
    if (OUTLINED_FUNCTION_4_0(v9))
    {
      *(_WORD *)OUTLINED_FUNCTION_11() = 0;
      OUTLINED_FUNCTION_9(&dword_244052000, v10, v11, "Progress reporter has not been started");
      OUTLINED_FUNCTION_3();
    }

  }
  if (v1[OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasCompleted] == 1)
  {
    OUTLINED_FUNCTION_21();
    v12 = OUTLINED_FUNCTION_20();
    if (OUTLINED_FUNCTION_4_0(v12))
    {
      *(_WORD *)OUTLINED_FUNCTION_11() = 0;
      OUTLINED_FUNCTION_9(&dword_244052000, v13, v14, "Progress reporter has completed");
      OUTLINED_FUNCTION_3();
    }

  }
  sub_244068F9C();
  if (v2)
  {
    v15 = v2;
  }
  else
  {
    v16 = &v1[OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled];
    swift_beginAccess();
    if (*v16 != 1)
    {
      sub_244058A04(a1);
      v17 = (uint64_t (*)(uint64_t, double))*((_QWORD *)v3 + 2);
      v18 = v3[32];
      v19 = swift_retain();
      if ((v18 & 1) != 0)
      {
        if ((v17(v19, a1) & 1) == 0)
        {
          sub_2440597D8();
          v15 = (void *)OUTLINED_FUNCTION_0_2();
          OUTLINED_FUNCTION_10();
          swift_willThrow();
          sub_24405A15C();
          goto LABEL_17;
        }
      }
      else
      {
        v17(v19, a1);
      }
      sub_24405A15C();
      return;
    }
    sub_2440597D8();
    v15 = (void *)OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_10();
    swift_willThrow();
  }
LABEL_17:
  v28 = v15;
  OUTLINED_FUNCTION_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257337A18);
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_7();
    v20 = &v3[OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled];
    OUTLINED_FUNCTION_14();
    *v20 = 1;
    sub_2440597D8();
    OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_10();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v21 = v28;
  }
  else
  {

    v22 = &v3[OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_logger];
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_13();
    sub_244068F18();
    v23 = OUTLINED_FUNCTION_20();
    if (OUTLINED_FUNCTION_4_0(v23))
    {
      v24 = (uint8_t *)OUTLINED_FUNCTION_11();
      v27[0] = OUTLINED_FUNCTION_11();
      *(_DWORD *)v24 = 138412290;
      OUTLINED_FUNCTION_13();
      v25 = _swift_stdlib_bridgeErrorToNSError();
      v27[4] = v25;
      sub_244069008();
      *(_QWORD *)v27[0] = v25;
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
      _os_log_impl(&dword_244052000, v22, (os_log_type_t)v2, "Unexpected error thrown from progress block: %@", v24, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257337A28);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_7();
    v26 = &v3[OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled];
    OUTLINED_FUNCTION_14();
    *v26 = 1;
    sub_2440597D8();
    OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_10();
    swift_willThrow();
    v21 = v15;
  }

}

unint64_t sub_2440597D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257337A20;
  if (!qword_257337A20)
  {
    v1 = sub_244068F84();
    result = MEMORY[0x24950734C](MEMORY[0x24BEE6848], v1);
    atomic_store(result, (unint64_t *)&qword_257337A20);
  }
  return result;
}

BOOL sub_244059818(double a1)
{
  uint64_t v1;
  uint64_t v3;
  BOOL *v4;
  BOOL v5;
  uint64_t (*v6)(uint64_t, double);
  int v7;
  uint64_t v8;
  char v9;

  v3 = sub_244068F84();
  MEMORY[0x24BDAC7A8](v3);
  v4 = (BOOL *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled);
  OUTLINED_FUNCTION_8();
  if (*v4 || (sub_244068F90() & 1) != 0)
  {
    v5 = 0;
    *v4 = 1;
  }
  else
  {
    sub_244058A04(a1);
    v6 = *(uint64_t (**)(uint64_t, double))(v1 + 16);
    v7 = *(unsigned __int8 *)(v1 + 32);
    v8 = swift_retain();
    if (v7 == 1)
    {
      v9 = v6(v8, a1);
      sub_24405A15C();
      *v4 = (v9 & 1) == 0;
    }
    else
    {
      v6(v8, a1);
      sub_24405A15C();
    }
    return !*v4;
  }
  return v5;
}

uint64_t RootProgressReporter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_24405A15C();
  v1 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_1(v1);
  v2 = OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1_1(v2);
  return v0;
}

uint64_t RootProgressReporter.__deallocating_deinit()
{
  return sub_244059E80((void (*)(void))RootProgressReporter.deinit);
}

uint64_t sub_244059B30(uint64_t a1)
{
  return sub_2440578DC(a1, (uint64_t)&off_25149B260);
}

void sub_244059B58(double a1)
{
  sub_2440593E8(a1);
}

uint64_t sub_244059B78(uint64_t a1)
{
  return sub_244057B88(a1, (uint64_t)&off_25149B260);
}

BOOL sub_244059BA0(double a1)
{
  return sub_244059818(a1);
}

uint64_t sub_244059BC4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  return sub_244057DEC(a1, (uint64_t)&off_25149B260, a2, a3, a4);
}

uint64_t sub_244059BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_244057EA4(a1, a2, a3, a4, (uint64_t)&off_25149B260);
}

uint64_t sub_244059C14(uint64_t *a1, uint64_t *a2, uint64_t a3, double a4)
{
  return sub_244057EF0(a1, a2, a3, (uint64_t)&off_25149B260, a4);
}

uint64_t sub_244059C3C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4, double a5, double a6)
{
  return sub_244058034(a1, a2, a3, a4, (uint64_t)&off_25149B260, a5, a6);
}

uint64_t sub_244059C64(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t a5, double a6, double a7, double a8)
{
  return sub_2440581F4(a1, a2, a3, a4, a5, (uint64_t)&off_25149B260, a6, a7, a8);
}

uint64_t sub_244059C8C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t a6, double a7, double a8, double a9, double a10)
{
  return sub_24405842C(a1, a2, a3, a4, a5, a6, (uint64_t)&off_25149B260, a7, a8, a9, a10);
}

uint64_t sub_244059CB4(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, uint64_t a7, double a8, double a9, double a10, double a11, double a12)
{
  return sub_2440586E0(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&off_25149B260, a8, a9, a10, a11, a12);
}

uint64_t sub_244059CDC()
{
  return swift_retain();
}

uint64_t sub_244059D04(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_hasStarted) = 0;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_hasCompleted) = 0;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_lastProgress) = 0;
  sub_244068E88();
  *(_QWORD *)(v3 + 16) = a1;
  *(double *)(v3 + 24) = a2;
  *(double *)(v3 + 32) = a3;
  v7 = a1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_logger;
  v8 = v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_logger;
  v9 = sub_244068F30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, v7, v9);
  return v3;
}

void sub_244059DB0(double a1)
{
  double v1;

  sub_244058D34(a1);
  v1 = OUTLINED_FUNCTION_6();
  sub_2440593E8(v1);
}

double sub_244059DE8(double a1)
{
  uint64_t v1;

  return *(double *)(v1 + 24) + (*(double *)(v1 + 32) - *(double *)(v1 + 24)) * a1;
}

BOOL sub_244059DFC(double a1)
{
  double v1;

  sub_244058D34(a1);
  v1 = OUTLINED_FUNCTION_6();
  return sub_244059818(v1);
}

uint64_t sub_244059E30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_1(v1);
  v2 = OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1_1(v2);
  return v0;
}

uint64_t sub_244059E74()
{
  return sub_244059E80((void (*)(void))sub_244059E30);
}

uint64_t sub_244059E80(void (*a1)(void))
{
  a1();
  return swift_deallocClassInstance();
}

uint64_t sub_244059EA4(uint64_t a1)
{
  return sub_2440578DC(a1, (uint64_t)&off_25149B348);
}

void sub_244059ECC(double a1)
{
  sub_244059DB0(a1);
}

uint64_t sub_244059EEC(uint64_t a1)
{
  return sub_244057B88(a1, (uint64_t)&off_25149B348);
}

BOOL sub_244059F14(double a1)
{
  return sub_244059DFC(a1);
}

uint64_t sub_244059F38@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  return sub_244057DEC(a1, (uint64_t)&off_25149B348, a2, a3, a4);
}

uint64_t sub_244059F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_244057EA4(a1, a2, a3, a4, (uint64_t)&off_25149B348);
}

uint64_t sub_244059F88(uint64_t *a1, uint64_t *a2, uint64_t a3, double a4)
{
  return sub_244057EF0(a1, a2, a3, (uint64_t)&off_25149B348, a4);
}

uint64_t sub_244059FB0(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4, double a5, double a6)
{
  return sub_244058034(a1, a2, a3, a4, (uint64_t)&off_25149B348, a5, a6);
}

uint64_t sub_244059FD8(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t a5, double a6, double a7, double a8)
{
  return sub_2440581F4(a1, a2, a3, a4, a5, (uint64_t)&off_25149B348, a6, a7, a8);
}

uint64_t sub_24405A000(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t a6, double a7, double a8, double a9, double a10)
{
  return sub_24405842C(a1, a2, a3, a4, a5, a6, (uint64_t)&off_25149B348, a7, a8, a9, a10);
}

uint64_t sub_24405A028(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, uint64_t a7, double a8, double a9, double a10, double a11, double a12)
{
  return sub_2440586E0(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&off_25149B348, a8, a9, a10, a11, a12);
}

uint64_t sub_24405A050()
{
  return swift_retain();
}

uint64_t sub_24405A058()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_hasStarted);
}

uint64_t sub_24405A068(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_hasStarted) = result;
  return result;
}

uint64_t sub_24405A078()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_hasCompleted);
}

uint64_t sub_24405A088(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_hasCompleted) = result;
  return result;
}

uint64_t sub_24405A098@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_logger;
  v4 = sub_244068F30();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

void sub_24405A0DC(double a1)
{
  uint64_t v1;

  *(double *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_lastProgress) = a1;
}

uint64_t sub_24405A0EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_lastReportDate;
  swift_beginAccess();
  v4 = sub_244068E94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t sub_24405A15C()
{
  return swift_release();
}

uint64_t sub_24405A164@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2440591B8();
  *a1 = result & 1;
  return result;
}

void sub_24405A190(char *a1)
{
  sub_2440591F8(*a1);
}

uint64_t sub_24405A1B4()
{
  return type metadata accessor for RootProgressReporter(0);
}

uint64_t sub_24405A1BC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_244068F30();
  if (v1 <= 0x3F)
  {
    result = sub_244068E94();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for RootProgressReporter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RootProgressReporter.isCancelled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of RootProgressReporter.isCancelled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of RootProgressReporter.isCancelled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of RootProgressReporter.progress.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of RootProgressReporter.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of RootProgressReporter.report(progress:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of RootProgressReporter.canProceed(progress:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t sub_24405A2DC()
{
  return type metadata accessor for ChildProgressReporter(0);
}

uint64_t type metadata accessor for ChildProgressReporter(uint64_t a1)
{
  return sub_24405A2F8(a1, qword_257337A60);
}

uint64_t sub_24405A2F8(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24405A328()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_244068F30();
  if (v1 <= 0x3F)
  {
    result = sub_244068E94();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_24405A3E0()
{
  return swift_retain();
}

uint64_t destroy for RootProgressReporter.CallbackType()
{
  return sub_24405A15C();
}

void _s22PhotosIntelligenceCore20RootProgressReporterC12CallbackTypeOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_24405A3E0();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  OUTLINED_FUNCTION_16();
}

uint64_t assignWithCopy for RootProgressReporter.CallbackType(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_24405A3E0();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_24405A15C();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RootProgressReporter.CallbackType(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_24405A15C();
  return a1;
}

uint64_t getEnumTagSinglePayload for RootProgressReporter.CallbackType(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for RootProgressReporter.CallbackType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_24405A568(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_24405A570(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RootProgressReporter.CallbackType()
{
  return &type metadata for RootProgressReporter.CallbackType;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

void OUTLINED_FUNCTION_2_0()
{
  void *v0;

  sub_24405A15C();

}

void OUTLINED_FUNCTION_3()
{
  JUMPOUT(0x2495073B8);
}

BOOL OUTLINED_FUNCTION_4_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_5_0()
{
  void *v0;

}

double OUTLINED_FUNCTION_6()
{
  uint64_t v0;
  double v1;

  return *(double *)(v0 + 24) + (*(double *)(v0 + 32) - *(double *)(v0 + 24)) * v1;
}

void OUTLINED_FUNCTION_7()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_244068F3C();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_slowAlloc();
}

id OUTLINED_FUNCTION_12()
{
  void *v0;

  return v0;
}

id OUTLINED_FUNCTION_13()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_244068F30();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return sub_244068E94();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_244068FD8();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_244068F18();
}

uint64_t sub_24405A69C(uint64_t a1)
{
  BOOL v2;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  if ((unint64_t)(a1 - 1664) < 2)
  {
    v8 = 0;
    v9 = 2;
    goto LABEL_23;
  }
  if (a1 != 287 && a1 != 421)
  {
    if (a1 == 595)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC768);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24406C520;
      v5 = 595;
      goto LABEL_19;
    }
    if (a1 != 839)
    {
      if (a1 == 881)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC768);
        v7 = swift_initStackObject();
        *(_OWORD *)(v7 + 16) = xmmword_24406C520;
        *(_QWORD *)(v7 + 32) = 881;
        v6 = sub_24405D960(v7);
        v9 = 0;
        v8 = 2;
        goto LABEL_24;
      }
      if (a1 != 910 && a1 != 1086 && a1 != 1533)
      {
        v2 = a1 == 1663 || a1 == 15291;
        if (!v2 && a1 != 10932)
        {
          v8 = 0;
          v9 = 0;
LABEL_23:
          v6 = MEMORY[0x24BEE4B08];
          goto LABEL_24;
        }
      }
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC768);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24406C520;
  v5 = 492;
LABEL_19:
  *(_QWORD *)(inited + 32) = v5;
  v6 = sub_24405D960(inited);
  v9 = 0;
  v8 = 1;
LABEL_24:
  type metadata accessor for UtilitySceneConfiguration();
  swift_allocObject();
  return sub_244056B4C(a1, v9, v8, v6);
}

id sub_24405A814(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, *off_25149B5B8[*(char *)(v1 + 24)]);
}

double sub_24405A82C()
{
  uint64_t v0;

  return dbl_24406C550[*(char *)(v0 + 25)];
}

uint64_t type metadata accessor for UtilitySceneConfiguration()
{
  return objc_opt_self();
}

uint64_t sub_24405A860(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v2 = sub_244068FB4();
  v9 = v2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v5 = *(_QWORD *)(a1 + 8 * i + 32);
      sub_24405ABE0(&v8, v5);
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    v6 = v2;
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_24405A8F4(uint64_t a1)
{
  uint64_t result;
  uint64_t inited;
  uint64_t v4;

  result = MEMORY[0x24BEE4B08];
  switch(a1)
  {
    case 1:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC768);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24406C580;
      *(_OWORD *)(inited + 32) = xmmword_24406C590;
      *(_OWORD *)(inited + 48) = xmmword_24406C5A0;
      *(_OWORD *)(inited + 64) = xmmword_24406C5B0;
      *(_QWORD *)(inited + 80) = 1663;
      return sub_24405A860(inited);
    case 2:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC768);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24406C520;
      v4 = 1086;
      goto LABEL_10;
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    case 4:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC768);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24406C5C0;
      *(_OWORD *)(inited + 32) = xmmword_24406C5D0;
      *(_OWORD *)(inited + 48) = xmmword_24406C5E0;
      *(_OWORD *)(inited + 64) = xmmword_24406C5F0;
      *(_OWORD *)(inited + 80) = xmmword_24406C600;
      *(_OWORD *)(inited + 96) = xmmword_24406C610;
      *(_OWORD *)(inited + 112) = xmmword_24406C620;
      *(_OWORD *)(inited + 128) = xmmword_24406C630;
      *(_OWORD *)(inited + 144) = xmmword_24406C640;
      *(_OWORD *)(inited + 160) = xmmword_24406C650;
      return sub_24405A860(inited);
    case 8:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC768);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24406C520;
      v4 = 1664;
      goto LABEL_10;
    default:
      if (a1 == 16)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC768);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_24406C520;
        v4 = 2147482095;
      }
      else
      {
        if (a1 != 32)
          return result;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC768);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_24406C520;
        v4 = 839;
      }
LABEL_10:
      *(_QWORD *)(inited + 32) = v4;
      return sub_24405A860(inited);
  }
}

uint64_t sub_24405AAC0(uint64_t a1)
{
  _OWORD *inited;

  if (a1 == 4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC768);
    inited = (_OWORD *)swift_initStackObject();
    inited[1] = xmmword_24406C660;
    inited[2] = xmmword_24406C670;
    inited[3] = xmmword_24406C680;
    inited[4] = xmmword_24406C690;
    inited[5] = xmmword_24406C6A0;
    return sub_24405A860((uint64_t)inited);
  }
  if (a1 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC768);
    inited = (_OWORD *)swift_initStackObject();
    inited[1] = xmmword_24406C6B0;
    inited[2] = xmmword_24406C6C0;
    inited[3] = xmmword_24406C6D0;
    inited[4] = xmmword_24406C6E0;
    inited[5] = xmmword_24406C6F0;
    inited[6] = xmmword_24406C700;
    inited[7] = xmmword_24406C710;
    inited[8] = xmmword_24406C720;
    return sub_24405A860((uint64_t)inited);
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_24405ABB0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UtilityTypeConfiguration()
{
  return objc_opt_self();
}

uint64_t sub_24405ABE0(uint64_t *a1, uint64_t a2)
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
  v7 = sub_2440690C8();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_24405B394(a2, v9, isUniquelyReferenced_nonNull_native);
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

uint64_t sub_24405ACD8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  char isUniquelyReferenced_nonNull_native;
  __int128 v13;
  uint64_t v15;
  _BYTE v16[40];

  v3 = v2;
  v6 = *v2;
  swift_bridgeObjectRetain();
  v7 = sub_244069014();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
  {
    v10 = ~v8;
    while (1)
    {
      sub_24405BBF4(*(_QWORD *)(v6 + 48) + 40 * v9, (uint64_t)v16);
      v11 = MEMORY[0x249506E54](v16, a2);
      sub_24405BC30((uint64_t)v16);
      if ((v11 & 1) != 0)
        break;
      v9 = (v9 + 1) & v10;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_5;
    }
    swift_bridgeObjectRelease();
    sub_24405BC30(a2);
    sub_24405BBF4(*(_QWORD *)(*v3 + 48) + 40 * v9, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24405BBF4(a2, (uint64_t)v16);
    v15 = *v3;
    *v3 = 0x8000000000000000;
    sub_24405B4B4((uint64_t)v16, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v15;
    swift_bridgeObjectRelease();
    v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    return 1;
  }
}

uint64_t sub_24405AE50()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_2543DC7B0);
  result = sub_244069038();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v7 = (uint64_t *)(v2 + 56);
    v6 = *(_QWORD *)(v2 + 56);
    v8 = 1 << *(_BYTE *)(v2 + 32);
    v27 = -1 << v8;
    v28 = v1;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & v6;
    v29 = 1 << *(_BYTE *)(v2 + 32);
    v11 = (unint64_t)(v8 + 63) >> 6;
    v12 = result + 56;
    if ((v9 & v6) == 0)
      goto LABEL_7;
LABEL_6:
    v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v13 | (v5 << 6); ; i = __clz(__rbit64(v16)) + (v5 << 6))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
      result = sub_2440690C8();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) == 0)
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          v25 = v21 == v24;
          if (v21 == v24)
            v21 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v21);
          if (v26 != -1)
          {
            v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v22) = v18;
      ++*(_QWORD *)(v4 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v15 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_38;
      if (v15 >= v11)
        goto LABEL_32;
      v16 = v7[v15];
      ++v5;
      if (!v16)
      {
        v5 = v15 + 1;
        if (v15 + 1 >= v11)
          goto LABEL_32;
        v16 = v7[v5];
        if (!v16)
        {
          v5 = v15 + 2;
          if (v15 + 2 >= v11)
            goto LABEL_32;
          v16 = v7[v5];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v11)
            {
LABEL_32:
              if (v29 > 63)
                sub_24405B61C(0, v11, (_QWORD *)(v2 + 56));
              else
                *v7 = v27;
              v1 = v28;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v16 = v7[v17];
            if (!v16)
            {
              while (1)
              {
                v5 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_39;
                if (v5 >= v11)
                  goto LABEL_32;
                v16 = v7[v5];
                ++v17;
                if (v16)
                  goto LABEL_20;
              }
            }
            v5 = v17;
          }
        }
      }
LABEL_20:
      v10 = (v16 - 1) & v16;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_24405B0D0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_2543DC7D0);
  v3 = sub_244069038();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    if (!v8)
      goto LABEL_7;
LABEL_6:
    v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      v18 = *(_QWORD *)(v2 + 48) + 40 * i;
      v29 = *(_OWORD *)v18;
      v30 = *(_OWORD *)(v18 + 16);
      v31 = *(_QWORD *)(v18 + 32);
      result = sub_244069014();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6))) == 0)
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          v25 = v21 == v24;
          if (v21 == v24)
            v21 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      v27 = *(_QWORD *)(v4 + 48) + 40 * v22;
      *(_OWORD *)v27 = v29;
      *(_OWORD *)(v27 + 16) = v30;
      *(_QWORD *)(v27 + 32) = v31;
      ++*(_QWORD *)(v4 + 16);
      if (v8)
        goto LABEL_6;
LABEL_7:
      v15 = v12 + 1;
      if (__OFADD__(v12, 1))
        goto LABEL_38;
      if (v15 >= v9)
        goto LABEL_32;
      v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        v12 = v15 + 1;
        if (v15 + 1 >= v9)
          goto LABEL_32;
        v16 = v6[v12];
        if (!v16)
        {
          v12 = v15 + 2;
          if (v15 + 2 >= v9)
            goto LABEL_32;
          v16 = v6[v12];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v28 = 1 << *(_BYTE *)(v2 + 32);
              if (v28 > 63)
                sub_24405B61C(0, (unint64_t)(v28 + 63) >> 6, (_QWORD *)(v2 + 56));
              else
                *v6 = -1 << v28;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                v12 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_39;
                if (v12 >= v9)
                  goto LABEL_32;
                v16 = v6[v12];
                ++v17;
                if (v16)
                  goto LABEL_20;
              }
            }
            v12 = v17;
          }
        }
      }
LABEL_20:
      v8 = (v16 - 1) & v16;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_24405B394(uint64_t result, unint64_t a2, char a3)
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
    sub_24405AE50();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_24405B638();
      goto LABEL_14;
    }
    sub_24405B998();
  }
  v8 = *v3;
  result = sub_2440690C8();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_2440690BC();
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

uint64_t sub_24405B4B4(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  _BYTE v19[40];

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_24405B0D0();
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_24405B7CC();
      goto LABEL_12;
    }
    sub_24405BC64();
  }
  v9 = *v3;
  result = sub_244069014();
  v10 = -1 << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v11 = ~v10;
    do
    {
      sub_24405BBF4(*(_QWORD *)(v9 + 48) + 40 * a2, (uint64_t)v19);
      v12 = MEMORY[0x249506E54](v19, v6);
      result = sub_24405BC30((uint64_t)v19);
      if ((v12 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v11;
    }
    while (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v13 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  v14 = *(_QWORD *)(v13 + 48) + 40 * a2;
  v15 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v6;
  *(_OWORD *)(v14 + 16) = v15;
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(v6 + 32);
  v16 = *(_QWORD *)(v13 + 16);
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (!v17)
  {
    *(_QWORD *)(v13 + 16) = v18;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_2440690BC();
  __break(1u);
  return result;
}

uint64_t sub_24405B61C(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

void *sub_24405B638()
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
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_2543DC7B0);
  v2 = *v0;
  v3 = sub_24406902C();
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
  if (!v12)
    goto LABEL_12;
LABEL_11:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v14 | (v9 << 6); ; i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * i) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    if (v12)
      goto LABEL_11;
LABEL_12:
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
LABEL_25:
    v12 = (v17 - 1) & v17;
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_25;
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
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24405B7CC()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[2];
  uint64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_2543DC7D0);
  v2 = *v0;
  v3 = sub_24406902C();
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
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = 5 * i;
    result = (void *)sub_24405BBF4(*(_QWORD *)(v2 + 48) + 40 * i, (uint64_t)v24);
    v21 = *(_QWORD *)(v4 + 48) + 8 * v20;
    v22 = v24[0];
    v23 = v24[1];
    *(_QWORD *)(v21 + 32) = v25;
    *(_OWORD *)v21 = v22;
    *(_OWORD *)(v21 + 16) = v23;
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24405B998()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_2543DC7B0);
  result = sub_244069038();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v9)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (i = v12 | (v5 << 6); ; i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    result = sub_2440690C8();
    v18 = -1 << *(_BYTE *)(v4 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v21) = v17;
    ++*(_QWORD *)(v4 + 16);
    if (v9)
      goto LABEL_6;
LABEL_7:
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
      goto LABEL_36;
    if (v14 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v14 + 1;
      if (v14 + 1 >= v10)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v5);
      if (!v15)
      {
        v5 = v14 + 2;
        if (v14 + 2 >= v10)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v5);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v9 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    result = swift_release();
    v1 = v26;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24405BBF4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_24405BC30(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_24405BC64()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
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
  _OWORD v29[2];
  uint64_t v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_2543DC7D0);
  v3 = sub_244069038();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    sub_24405BBF4(*(_QWORD *)(v2 + 48) + 40 * i, (uint64_t)v29);
    result = sub_244069014();
    v18 = -1 << *(_BYTE *)(v4 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v10 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v10 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v10 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v10 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    v26 = *(_QWORD *)(v4 + 48) + 40 * v21;
    v27 = v29[0];
    v28 = v29[1];
    *(_QWORD *)(v26 + 32) = v30;
    *(_OWORD *)v26 = v27;
    *(_OWORD *)(v26 + 16) = v28;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v15 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_36;
    if (v15 >= v9)
      goto LABEL_32;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      v12 = v15 + 1;
      if (v15 + 1 >= v9)
        goto LABEL_32;
      v16 = *(_QWORD *)(v6 + 8 * v12);
      if (!v16)
      {
        v12 = v15 + 2;
        if (v15 + 2 >= v9)
          goto LABEL_32;
        v16 = *(_QWORD *)(v6 + 8 * v12);
        if (!v16)
          break;
      }
    }
LABEL_20:
    v8 = (v16 - 1) & v16;
  }
  v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    v12 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v12 >= v9)
      goto LABEL_32;
    v16 = *(_QWORD *)(v6 + 8 * v12);
    ++v17;
    if (v16)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_24405BEF0(char a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = sub_244056A04(a1);
  v5 = v4;
  if (v3 != sub_244056A04(a2) || v5 != v6)
    sub_2440690B0();
  OUTLINED_FUNCTION_4_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16();
}

uint64_t sub_24405BF68()
{
  return 1;
}

void sub_24405BF70(unsigned __int8 a1, char a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = 0x800000024406ABB0;
  v3 = a1;
  if (a1)
  {
    if (a1 == 1)
      v4 = 0xD000000000000018;
    else
      v4 = 0x6E6974617265706FLL;
    if (v3 == 1)
      v5 = 0x800000024406ABD0;
    else
      v5 = 0xEE00746E696F5067;
  }
  else
  {
    v4 = 0xD00000000000001BLL;
    v5 = 0x800000024406ABB0;
  }
  if (a2)
  {
    if (a2 == 1)
      v6 = 0xD000000000000018;
    else
      v6 = 0x6E6974617265706FLL;
    if (a2 == 1)
      v2 = 0x800000024406ABD0;
    else
      v2 = 0xEE00746E696F5067;
  }
  else
  {
    v6 = 0xD00000000000001BLL;
  }
  if (v4 != v6 || v5 != v2)
    sub_2440690B0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_16();
}

uint64_t sub_24405C06C(uint64_t a1)
{
  return sub_24405C0A4(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], qword_2543DC790, (uint64_t (*)(unint64_t, unint64_t, unint64_t, unint64_t))MEMORY[0x24BEE78C0]);
}

uint64_t sub_24405C088(uint64_t a1)
{
  return sub_24405C0A4(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BEE77F0], qword_2543DC778, MEMORY[0x24BEE77C8]);
}

uint64_t sub_24405C0A4(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, uint64_t (*a4)(unint64_t, unint64_t, unint64_t, unint64_t))
{
  uint64_t v6;

  v6 = a2(0);
  __swift_allocate_value_buffer(v6, a3);
  __swift_project_value_buffer(v6, (uint64_t)a3);
  return a4(0xD000000000000021, 0x800000024406B080, 0xD000000000000015, 0x800000024406B2E0);
}

void sub_24405C12C()
{
  off_2543DCC90 = &unk_25149B3D0;
}

uint64_t static PNUtilityTypeClassifier.supportedUtilityTypes.getter()
{
  if (qword_2543DC7C8 != -1)
    swift_once();
  OUTLINED_FUNCTION_8();
  return swift_bridgeObjectRetain();
}

uint64_t static PNUtilityTypeClassifier.supportedUtilityTypes.setter(void *a1)
{
  if (qword_2543DC7C8 != -1)
    swift_once();
  OUTLINED_FUNCTION_8();
  off_2543DCC90 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static PNUtilityTypeClassifier.supportedUtilityTypes.modify())()
{
  if (qword_2543DC7C8 != -1)
    swift_once();
  OUTLINED_FUNCTION_8();
  return j__swift_endAccess;
}

uint64_t static PNUtilityTypeClassifier.latestVersion()()
{
  return 9;
}

uint64_t static PNUtilityTypeClassifier.screenshotInferred(in:usingSceneModel:)(uint64_t a1, void *a2)
{
  uint64_t inited;
  uint64_t v4;
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC768);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24406C520;
  *(_QWORD *)(inited + 32) = 1665;
  v4 = sub_24405D960(inited);
  v5 = OUTLINED_FUNCTION_6_0(v4, sel_sceneClassifications);
  v6 = sub_244068FA8();

  if (*(_QWORD *)(v6 + 16))
  {
    v7 = sub_24405C410(v4, MEMORY[0x24BEE4B08], v6, a2);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_5_1();
  }
  else
  {
    OUTLINED_FUNCTION_5_1();
    swift_bridgeObjectRelease();
    if (qword_2543DC7A8 != -1)
      swift_once();
    v8 = sub_244068F30();
    __swift_project_value_buffer(v8, (uint64_t)qword_2543DC790);
    v9 = sub_244068F18();
    v10 = sub_244068FCC();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_244052000, v9, v10, "[Inferred Screenshot] Empty sceneClassifications", v11, 2u);
      OUTLINED_FUNCTION_3();
    }

    v7 = 0;
  }
  return v7 & 1;
}

uint64_t sub_24405C410(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  id v17;
  uint64_t v18;
  _BOOL4 v19;
  double v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  char v27;
  id v28;
  __int128 v29;

  v23 = sub_24405CFD4(a3);
  v5 = a3 + 56;
  v6 = 1 << *(_BYTE *)(a3 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a3 + 56);
  v9 = (unint64_t)(v6 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v27 = 0;
  v11 = 0;
  while (v8)
  {
    v12 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v13 = v12 | (v11 << 6);
LABEL_20:
    sub_24405BBF4(*(_QWORD *)(a3 + 48) + 40 * v13, (uint64_t)&v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC770);
    result = swift_dynamicCast();
    if ((_DWORD)result)
    {
      if (((unint64_t)objc_msgSend(v28, sel_classificationType) & 0xFFFFFFFFFFFFFFFDLL) != 0)
        goto LABEL_22;
      v17 = objc_msgSend(v28, sel_sceneIdentifier);
      v18 = (uint64_t)v17;
      v19 = (v27 & 1) == 0 && *(_QWORD *)(a1 + 16) && sub_24405D2E8((uint64_t)v17, a1);
      if (*(_QWORD *)(a2 + 16))
      {
        if (((v19 | sub_24405D2E8(v18, a2)) & 1) == 0)
          goto LABEL_22;
      }
      else if (!v19)
      {
        goto LABEL_22;
      }
      objc_msgSend(v28, sel_confidence, v23);
      if (sub_24405D3B0(v18, a4, v20))
      {
        if (sub_24405D2E8(v18, a2))
          goto LABEL_40;
        v21 = sub_24405D534(v18, v28, v23);
        result = swift_unknownObjectRelease();
        v22 = *(_QWORD *)(a2 + 16);
        v27 = v22 != 0 && v21;
        if (!v22 && v21)
        {
          swift_bridgeObjectRelease();
          swift_release();
          v27 = 1;
          return v27 & 1;
        }
      }
      else
      {
LABEL_22:
        result = swift_unknownObjectRelease();
      }
    }
  }
  v14 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
LABEL_40:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    v27 = 0;
    return v27 & 1;
  }
  if (v14 >= v9)
    goto LABEL_37;
  v15 = *(_QWORD *)(v5 + 8 * v14);
  ++v11;
  if (v15)
    goto LABEL_19;
  v11 = v14 + 1;
  if (v14 + 1 >= v9)
    goto LABEL_37;
  v15 = *(_QWORD *)(v5 + 8 * v11);
  if (v15)
    goto LABEL_19;
  v11 = v14 + 2;
  if (v14 + 2 >= v9)
    goto LABEL_37;
  v15 = *(_QWORD *)(v5 + 8 * v11);
  if (v15)
  {
LABEL_19:
    v8 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v11 << 6);
    goto LABEL_20;
  }
  v16 = v14 + 3;
  if (v16 >= v9)
  {
LABEL_37:
    swift_bridgeObjectRelease();
    swift_release();
    return v27 & 1;
  }
  v15 = *(_QWORD *)(v5 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v9)
      goto LABEL_37;
    v15 = *(_QWORD *)(v5 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t static PNUtilityTypeClassifier.utilityTypesDetected(in:usingSceneModel:)(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v27;

  v27 = 0;
  v3 = objc_msgSend(a1, sel_sceneClassifications);
  v4 = sub_244068FA8();

  v5 = *(_QWORD *)(v4 + 16);
  swift_bridgeObjectRelease();
  if (!v5)
    return 0;
  if (qword_2543DC7A8 != -1)
    swift_once();
  v6 = sub_244068F30();
  __swift_project_value_buffer(v6, (uint64_t)qword_2543DC790);
  swift_unknownObjectRetain_n();
  v7 = sub_244068F18();
  v8 = sub_244068FCC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_DWORD *)v9 = 134217984;
    v10 = OUTLINED_FUNCTION_6_0((uint64_t)v9, sel_sceneClassifications);
    sub_244068FA8();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    sub_244069008();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_7_0(&dword_244052000, v7, v8, "sceneClassifications.count: %ld", v9);
    OUTLINED_FUNCTION_3();
  }

  v12 = swift_unknownObjectRelease_n();
  v13 = OUTLINED_FUNCTION_6_0(v12, sel_sceneClassifications);
  v14 = sub_244068FA8();

  if (qword_2543DC7C8 != -1)
    swift_once();
  OUTLINED_FUNCTION_8();
  v15 = off_2543DCC90;
  v16 = *((_QWORD *)off_2543DCC90 + 2);
  if (v16)
  {
    swift_bridgeObjectRetain();
    v17 = 0;
    for (i = 0; i != v16; ++i)
    {
      v19 = v15[i + 4];
      v20 = sub_244068F18();
      v21 = sub_244068FCC();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = OUTLINED_FUNCTION_1_2();
        *(_DWORD *)v22 = 134217984;
        *(_QWORD *)(v22 + 4) = v19;
        OUTLINED_FUNCTION_7_0(&dword_244052000, v20, v21, "utilityType: %lu", (uint8_t *)v22);
        OUTLINED_FUNCTION_3();
      }

      if ((static PNUtilityTypeClassifier.utilityOfType(_:detectedInSceneClassifications:hasQRCodeData:isAIImageFromGenerativePlayground:using:)(v19, v14, (int)objc_msgSend(a1, sel_hasQRCodeData), (int)objc_msgSend(a1, sel_isAIImageFromGenerativePlayground), a2) & 1) != 0)
      {
        v17 |= v19;
        v27 = v17;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v23 = sub_244068F18();
  v24 = sub_244068FCC();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_DWORD *)v25 = 134217984;
    sub_244069008();
    OUTLINED_FUNCTION_7_0(&dword_244052000, v23, v24, "detectedUtilityTypes: %lu", v25);
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_8();
  return v27;
}

uint64_t static PNUtilityTypeClassifier.utilityOfType(_:detectedInSceneClassifications:hasQRCodeData:isAIImageFromGenerativePlayground:using:)(uint64_t a1, uint64_t a2, int a3, int a4, void *a5)
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
  NSObject *v15;
  os_signpost_type_t v16;
  uint8_t *v17;
  uint8_t *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_signpost_type_t v26;
  char *v27;
  uint64_t v28;
  const char *v29;
  uint8_t *v30;
  os_signpost_id_t v31;
  _QWORD v33[2];
  void *v34;
  int v35;
  int v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;

  v34 = a5;
  v35 = a4;
  v36 = a3;
  v41 = a1;
  v6 = sub_244068EDC();
  v39 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244068EB8();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v42 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  MEMORY[0x24BDAC7A8](v12);
  if (qword_2543DC760 != -1)
    swift_once();
  v37 = a2;
  v38 = v8;
  v13 = sub_244068ED0();
  v14 = __swift_project_value_buffer(v13, (uint64_t)qword_2543DC778);
  sub_244068EAC();
  v40 = v14;
  v15 = sub_244068EC4();
  v16 = sub_244068FF0();
  if ((sub_244068FFC() & 1) != 0)
  {
    OUTLINED_FUNCTION_3_0();
    v17 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    v33[1] = v9;
    v18 = v17;
    *(_DWORD *)v17 = 134217984;
    v43 = v41;
    sub_244069008();
    v19 = sub_244068EA0();
    _os_signpost_emit_with_name_impl(&dword_244052000, v15, v16, v19, "[UT] utilityOfType", "type: %lu", v18, 0xCu);
    OUTLINED_FUNCTION_3();
  }

  v20 = v41;
  OUTLINED_FUNCTION_3_0();
  sub_244068F00();
  swift_allocObject();
  sub_244068EF4();
  OUTLINED_FUNCTION_10_0();
  if (v20 == 16)
  {
    v21 = v36;
  }
  else if (v20 == 4 && (v35 & 1) != 0)
  {
    v21 = 1;
  }
  else
  {
    v22 = v37;
    if (*(_QWORD *)(v37 + 16))
    {
      type metadata accessor for UtilityTypeConfiguration();
      v23 = sub_24405A8F4(v20);
      v24 = sub_24405AAC0(v20);
      v21 = sub_24405C410(v23, v24, v22, v34);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_5_1();
    }
    else
    {
      v21 = 0;
    }
  }
  v25 = sub_244068EC4();
  sub_244068EE8();
  v26 = sub_244068FE4();
  if ((sub_244068FFC() & 1) != 0)
  {
    swift_retain();
    v27 = v38;
    sub_244068F0C();
    swift_release();
    v28 = v39;
    if ((*(unsigned int (**)(char *, uint64_t))(v39 + 88))(v27, v6) == *MEMORY[0x24BEE7810])
    {
      v29 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v6);
      v29 = "";
    }
    v30 = (uint8_t *)OUTLINED_FUNCTION_9_0();
    *(_WORD *)v30 = 0;
    v31 = sub_244068EA0();
    _os_signpost_emit_with_name_impl(&dword_244052000, v25, v26, v31, "[UT] utilityOfType", v29, v30, 2u);
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_10_0();
  swift_release();
  return v21 & 1;
}

uint64_t sub_24405CFD4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  CGFloat v7;
  CGFloat v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  id v16[5];
  _BYTE v17[40];
  _OWORD v18[2];
  uint64_t v19;
  _OWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  CGSize v23;
  CGSize v24;

  v22 = MEMORY[0x24BEE4B08];
  v2 = a1 + 56;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 56);
  v6 = (unint64_t)(v3 + 63) >> 6;
  v7 = *MEMORY[0x24BDBF148];
  v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_20;
    }
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v13 >= v6)
      goto LABEL_25;
    v14 = *(_QWORD *)(v2 + 8 * v13);
    ++v10;
    if (!v14)
    {
      v10 = v13 + 1;
      if (v13 + 1 >= v6)
        goto LABEL_25;
      v14 = *(_QWORD *)(v2 + 8 * v10);
      if (!v14)
      {
        v10 = v13 + 2;
        if (v13 + 2 >= v6)
          goto LABEL_25;
        v14 = *(_QWORD *)(v2 + 8 * v10);
        if (!v14)
          break;
      }
    }
LABEL_19:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v10 << 6);
LABEL_20:
    sub_24405BBF4(*(_QWORD *)(a1 + 48) + 40 * v12, (uint64_t)v20);
    v18[0] = v20[0];
    v18[1] = v20[1];
    v19 = v21;
    sub_24405BBF4((uint64_t)v18, (uint64_t)v17);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC770);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_24;
    objc_msgSend(v16[0], sel_boundingBox);
    v23.width = v7;
    v23.height = v8;
    if (CGSizeEqualToSize(v23, v24))
    {
      sub_24405BC30((uint64_t)v18);
      result = swift_unknownObjectRelease();
    }
    else
    {
      sub_24405BBF4((uint64_t)v18, (uint64_t)v16);
      sub_24405ACD8((uint64_t)v17, (uint64_t)v16);
      swift_unknownObjectRelease();
      sub_24405BC30((uint64_t)v17);
LABEL_24:
      result = sub_24405BC30((uint64_t)v18);
    }
  }
  v15 = v13 + 3;
  if (v15 >= v6)
  {
LABEL_25:
    swift_release();
    return v22;
  }
  v14 = *(_QWORD *)(v2 + 8 * v15);
  if (v14)
  {
    v10 = v15;
    goto LABEL_19;
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v6)
      goto LABEL_25;
    v14 = *(_QWORD *)(v2 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24405D214(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  _BYTE v10[40];

  if (*(_QWORD *)(a2 + 16)
    && (v4 = sub_244069014(),
        v5 = -1 << *(_BYTE *)(a2 + 32),
        v6 = v4 & ~v5,
        ((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0))
  {
    v7 = ~v5;
    do
    {
      sub_24405BBF4(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v10);
      v8 = MEMORY[0x249506E54](v10, a1);
      sub_24405BC30((uint64_t)v10);
      if ((v8 & 1) != 0)
        break;
      v6 = (v6 + 1) & v7;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

BOOL sub_24405D2E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v4 = sub_2440690C8();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(v8 + 8 * v6) == a1)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(_QWORD *)(v8 + 8 * v11);
    result = v12 == a1;
    if (v12 == a1)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

BOOL sub_24405D3B0(uint64_t a1, id a2, double a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;

  if (a1 < 0)
  {
    __break(1u);
LABEL_9:
    swift_once();
    goto LABEL_5;
  }
  v5 = objc_msgSend(a2, sel_nodeForSignalIdentifier_, a1);
  if (v5)
  {
    v6 = v5;
    type metadata accessor for UtilitySceneConfiguration();
    sub_24405A69C(a1);
    sub_24405A814(v6);
    v8 = v7;

    swift_release();
    return v8 <= a3;
  }
  if (qword_2543DC7A8 != -1)
    goto LABEL_9;
LABEL_5:
  v10 = sub_244068F30();
  __swift_project_value_buffer(v10, (uint64_t)qword_2543DC790);
  v11 = sub_244068F18();
  v12 = sub_244068FD8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v13 = 134217984;
    sub_244069008();
    _os_log_impl(&dword_244052000, v11, v12, "Cannot find utilityNode for sceneIdentifier: %llu", v13, 0xCu);
    MEMORY[0x2495073B8](v13, -1, -1);
  }

  return 0;
}

BOOL sub_24405D534(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  double v9;
  double v10;

  type metadata accessor for UtilitySceneConfiguration();
  v6 = sub_24405A69C(a1);
  if (sub_24405A82C() <= 0.0)
  {
    swift_release();
    return 1;
  }
  else
  {
    v7 = sub_24405D5F8(a2, v6, a3);
    if ((v8 & 1) != 0)
    {
      swift_release();
      return 0;
    }
    else
    {
      v9 = *(double *)&v7;
      v10 = sub_24405A82C();
      swift_release();
      return v10 <= v9;
    }
  }
}

uint64_t sub_24405D5F8(void *a1, uint64_t a2, uint64_t a3)
{
  double width;
  double height;
  _BOOL4 v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  double v22;
  double v23;
  _BOOL4 v24;
  id v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _OWORD v29[2];
  uint64_t v30;
  CGSize v31;
  CGSize v32;

  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543DC770);
  if (swift_dynamicCast())
  {
    v29[0] = v26;
    v29[1] = v27;
    v30 = v28;
    if ((sub_24405D214((uint64_t)v29, a3) & 1) != 0)
    {
      objc_msgSend(a1, sel_boundingBox);
      width = v31.width;
      height = v31.height;
      v8 = CGSizeEqualToSize(*MEMORY[0x24BDBF148], v31);
      sub_24405BC30((uint64_t)v29);
      if (v8)
        *(double *)&result = 0.0;
      else
        *(double *)&result = width * height;
    }
    else
    {
      v10 = *(_QWORD *)(a2 + 32);
      v11 = a3 + 56;
      v12 = 1 << *(_BYTE *)(a3 + 32);
      v13 = -1;
      if (v12 < 64)
        v13 = ~(-1 << v12);
      v14 = v13 & *(_QWORD *)(a3 + 56);
      v15 = (unint64_t)(v12 + 63) >> 6;
      *(double *)&result = COERCE_DOUBLE(swift_bridgeObjectRetain());
      v16 = 0;
      while (1)
      {
        do
        {
          if (v14)
          {
            v17 = __clz(__rbit64(v14));
            v14 &= v14 - 1;
            v18 = v17 | (v16 << 6);
          }
          else
          {
            v19 = v16 + 1;
            if (__OFADD__(v16, 1))
            {
              __break(1u);
LABEL_35:
              __break(1u);
              return result;
            }
            if (v19 >= v15)
              goto LABEL_29;
            v20 = *(_QWORD *)(v11 + 8 * v19);
            ++v16;
            if (!v20)
            {
              v16 = v19 + 1;
              if (v19 + 1 >= v15)
                goto LABEL_29;
              v20 = *(_QWORD *)(v11 + 8 * v16);
              if (!v20)
              {
                v16 = v19 + 2;
                if (v19 + 2 >= v15)
                  goto LABEL_29;
                v20 = *(_QWORD *)(v11 + 8 * v16);
                if (!v20)
                {
                  v21 = v19 + 3;
                  if (v21 >= v15)
                  {
LABEL_29:
                    swift_release();
                    sub_24405BC30((uint64_t)v29);
                    goto LABEL_30;
                  }
                  v20 = *(_QWORD *)(v11 + 8 * v21);
                  if (!v20)
                  {
                    while (1)
                    {
                      v16 = v21 + 1;
                      if (__OFADD__(v21, 1))
                        goto LABEL_35;
                      if (v16 >= v15)
                        goto LABEL_29;
                      v20 = *(_QWORD *)(v11 + 8 * v16);
                      ++v21;
                      if (v20)
                        goto LABEL_25;
                    }
                  }
                  v16 = v21;
                }
              }
            }
LABEL_25:
            v14 = (v20 - 1) & v20;
            v18 = __clz(__rbit64(v20)) + (v16 << 6);
          }
          sub_24405BBF4(*(_QWORD *)(a3 + 48) + 40 * v18, (uint64_t)&v26);
          *(double *)&result = COERCE_DOUBLE(swift_dynamicCast());
        }
        while ((result & 1) == 0);
        if (sub_24405D2E8((uint64_t)objc_msgSend(v25, sel_sceneIdentifier), v10))
          break;
        *(double *)&result = COERCE_DOUBLE(swift_unknownObjectRelease());
      }
      objc_msgSend(v25, sel_boundingBox);
      v22 = v32.width;
      v23 = v32.height;
      v24 = CGSizeEqualToSize(*MEMORY[0x24BDBF148], v32);
      swift_release();
      swift_unknownObjectRelease();
      sub_24405BC30((uint64_t)v29);
      if (v24)
        *(double *)&result = 0.0;
      else
        *(double *)&result = v22 * v23;
    }
  }
  else
  {
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
    sub_24405DAD0((uint64_t)&v26);
LABEL_30:
    *(double *)&result = 0.0;
  }
  return result;
}

PNUtilityTypeClassifier __swiftcall PNUtilityTypeClassifier.init()()
{
  return (PNUtilityTypeClassifier)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id PNUtilityTypeClassifier.init()()
{
  objc_super v1;

  v1.super_class = (Class)PNUtilityTypeClassifier;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_24405D960(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = MEMORY[0x24BEE4B08];
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_2543DC7B0);
  result = sub_244069044();
  v3 = result;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_13:
    OUTLINED_FUNCTION_4_1();
    return v3;
  }
  v5 = 0;
  v6 = result + 56;
  v7 = ~(-1 << *(_BYTE *)(result + 32));
  while (v5 < *(_QWORD *)(a1 + 16))
  {
    v8 = *(_QWORD *)(a1 + 32 + 8 * v5);
    result = sub_2440690C8();
    v9 = result & v7;
    v10 = (result & (unint64_t)v7) >> 6;
    v11 = *(_QWORD *)(v6 + 8 * v10);
    v12 = 1 << (result & v7);
    v13 = *(_QWORD *)(v3 + 48);
    if ((v12 & v11) != 0)
    {
      while (*(_QWORD *)(v13 + 8 * v9) != v8)
      {
        v9 = (v9 + 1) & v7;
        v10 = v9 >> 6;
        v11 = *(_QWORD *)(v6 + 8 * (v9 >> 6));
        v12 = 1 << v9;
        if ((v11 & (1 << v9)) == 0)
          goto LABEL_8;
      }
    }
    else
    {
LABEL_8:
      *(_QWORD *)(v6 + 8 * v10) = v12 | v11;
      *(_QWORD *)(v13 + 8 * v9) = v8;
      v14 = *(_QWORD *)(v3 + 16);
      v15 = __OFADD__(v14, 1);
      v16 = v14 + 1;
      if (v15)
        goto LABEL_15;
      *(_QWORD *)(v3 + 16) = v16;
    }
    if (++v5 == v4)
      goto LABEL_13;
  }
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

unint64_t type metadata accessor for PNUtilityTypeClassifier()
{
  unint64_t result;

  result = qword_257337A78;
  if (!qword_257337A78)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257337A78);
  }
  return result;
}

uint64_t sub_24405DAD0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257337AE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(v1, v3, v0);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_6_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

unint64_t PhotosIntelligenceCoreLogSubsystem.getter()
{
  return 0xD000000000000021;
}

void sub_24405F150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

const __CFString *NSStringFromPNErrorCode(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4)
    return CFSTR("Unknown Error");
  else
    return off_25149B638[a1 + 1];
}

__CFString *CLSTaxonomyBasedModelStringFromConfidenceThresholdType(unint64_t a1)
{
  if (a1 > 6)
    return 0;
  else
    return off_25149B688[a1];
}

uint64_t SimilarityModelVersionFromSceneAnalysisVersion(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 80;
  v2 = 33;
  if (a1 < 0x21)
    v2 = 0;
  if (a1 <= 0x4F)
    v1 = v2;
  if (a1 <= 0x53)
    return v1;
  else
    return 84;
}

uint64_t sub_244068E7C()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_244068E88()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_244068E94()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_244068EA0()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_244068EAC()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_244068EB8()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_244068EC4()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_244068ED0()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_244068EDC()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_244068EE8()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_244068EF4()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_244068F00()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_244068F0C()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_244068F18()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_244068F24()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_244068F30()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_244068F3C()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_244068F48()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_244068F54()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_244068F60()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_244068F6C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_244068F78()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_244068F84()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_244068F90()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_244068F9C()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_244068FA8()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_244068FB4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_244068FC0()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_244068FCC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_244068FD8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_244068FE4()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_244068FF0()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_244068FFC()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_244069008()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_244069014()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_244069020()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_24406902C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_244069038()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_244069044()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_244069050()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24406905C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_244069068()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_244069074()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_244069080()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24406908C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_244069098()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_2440690A4()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2440690B0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2440690BC()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2440690C8()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2440690D4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2440690E0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2440690EC()
{
  return MEMORY[0x24BEE4328]();
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x24BDBF138]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

uint64_t PFSceneTaxonomyNodeExtendedSceneClassId()
{
  return MEMORY[0x24BE724D0]();
}

uint64_t PFSceneTaxonomyNodeF0Point5Threshold()
{
  return MEMORY[0x24BE724D8]();
}

uint64_t PFSceneTaxonomyNodeF1Threshold()
{
  return MEMORY[0x24BE724E0]();
}

uint64_t PFSceneTaxonomyNodeF2Threshold()
{
  return MEMORY[0x24BE724E8]();
}

uint64_t PFSceneTaxonomyNodeGraphHighPrecisionThreshold()
{
  return MEMORY[0x24BE724F0]();
}

uint64_t PFSceneTaxonomyNodeGraphHighRecallThreshold()
{
  return MEMORY[0x24BE724F8]();
}

uint64_t PFSceneTaxonomyNodeName()
{
  return MEMORY[0x24BE72518]();
}

uint64_t PFSceneTaxonomyNodeNetworkId()
{
  return MEMORY[0x24BE72520]();
}

uint64_t PFSceneTaxonomyNodeSearchThreshold()
{
  return MEMORY[0x24BE72528]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

