uint64_t sub_244EE73DC()
{
  sub_244F1BD00();
  sub_244F1B880();
  swift_bridgeObjectRelease();
  return sub_244F1BD18();
}

uint64_t sub_244EE7478()
{
  sub_244F1B880();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244EE74E8()
{
  sub_244F1BD00();
  sub_244F1B880();
  swift_bridgeObjectRelease();
  return sub_244F1BD18();
}

uint64_t sub_244EE7580@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244EE7D20();
  *a1 = result;
  return result;
}

void sub_244EE75AC(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = 0x702D6F626D697761;
  v3 = 0xE700000000000000;
  if (*v1 == 1)
    v3 = 0xEA0000000000636DLL;
  else
    v2 = 0x65636172746170;
  if (*v1)
    v4 = v2;
  else
    v4 = 0x702D6F626D697761;
  if (*v1)
    v5 = v3;
  else
    v5 = 0xEA0000000000696DLL;
  *a1 = v4;
  a1[1] = v5;
}

uint64_t sub_244EE7610(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_244F0485C(*a1, *a2);
}

unint64_t sub_244EE761C(unint64_t a1)
{
  if (a1 >> 62)
  {
    if (a1 >> 62 != 1)
      return 0xD000000000000011;
    sub_244F1BAB4();
    sub_244F1B8A4();
    swift_bridgeObjectRelease();
    sub_244F1B8A4();
  }
  else
  {
    sub_244F1BAB4();
    sub_244F1B8A4();
    swift_bridgeObjectRelease();
  }
  sub_244F1B8A4();
  return 0;
}

uint64_t sub_244EE77DC(uint64_t a1, uint64_t a2)
{
  return sub_244EE7D68(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16));
}

unint64_t sub_244EE77F8()
{
  unint64_t *v0;

  return sub_244EE761C(*v0);
}

unint64_t sub_244EE7804(uint64_t a1, unint64_t a2)
{
  uint64_t v5;

  if (a1 == 2)
    return 0xD00000000000005ELL;
  sub_244F1BAB4();
  if (a1)
  {
    if (a1 == 1)
    {
      v5 = 0x65636172544150;
      swift_bridgeObjectRelease();
    }
    else
    {
      MEMORY[0x24952A5DC](a1, MEMORY[0x24BEE0D00]);
      sub_244F1B8A4();
      swift_bridgeObjectRelease();
      sub_244F1B8A4();
      swift_bridgeObjectRelease();
      v5 = 0x28206D6F74737563;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v5 = 0x746963696C706D69;
  }
  sub_244F1B8A4();
  if (a2 > 1)
  {
    MEMORY[0x24952A5DC](a2, MEMORY[0x24BEE0D00]);
    sub_244F1B8A4();
    swift_bridgeObjectRelease();
    sub_244F1B8A4();
  }
  sub_244F1B8A4();
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_244EE79EC()
{
  uint64_t v0;

  return sub_244EE7804(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
}

uint64_t sub_244EE7A10(uint64_t a1, uint64_t a2)
{
  __int16 v2;
  __int16 v3;

  if (*(_BYTE *)(a1 + 25))
    v2 = 256;
  else
    v2 = 0;
  if (*(_BYTE *)(a2 + 25))
    v3 = 256;
  else
    v3 = 0;
  return sub_244EE7FE8(*(_QWORD **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), v2 | *(unsigned __int8 *)(a1 + 24), *(_QWORD **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), v3 | *(unsigned __int8 *)(a2 + 24));
}

void sub_244EE7A60()
{
  __int128 *v0;
  _BYTE v1[40];

  sub_244EE9854(v0, (uint64_t)v1);
  __asm { BR              X10 }
}

uint64_t sub_244EE7ABC()
{
  uint64_t v1;

  sub_244F1BAB4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  return v1;
}

void sub_244EE7CEC()
{
  __int128 *v0;
  _BYTE v1[40];

  sub_244EE9854(v0, (uint64_t)v1);
  sub_244EE7A60();
}

uint64_t sub_244EE7D20()
{
  unint64_t v0;

  v0 = sub_244F1BB98();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_244EE7D68(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t result;
  char v23;
  char v24;

  if (!(a1 >> 62))
  {
    if (a4 >> 62)
      return 0;
    v16 = 0x702D6F626D697761;
    v17 = 0xEA0000000000696DLL;
    v18 = a1;
    if ((_BYTE)a1)
    {
      if (a1 == 1)
        v19 = 0x702D6F626D697761;
      else
        v19 = 0x65636172746170;
      if (v18 == 1)
        v20 = 0xEA0000000000636DLL;
      else
        v20 = 0xE700000000000000;
      v21 = a4;
      if (!(_BYTE)a4)
        goto LABEL_30;
    }
    else
    {
      v19 = 0x702D6F626D697761;
      v20 = 0xEA0000000000696DLL;
      v21 = a4;
      if (!(_BYTE)a4)
        goto LABEL_30;
    }
    if (v21 == 1)
    {
      v17 = 0xEA0000000000636DLL;
    }
    else
    {
      v16 = 0x65636172746170;
      v17 = 0xE700000000000000;
    }
LABEL_30:
    if (v19 == v16 && v20 == v17)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
    else
    {
      v24 = sub_244F1BCA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v24 & 1;
    }
  }
  if (a1 >> 62 != 1)
    return a4 >> 62 == 2 && a4 == 0x8000000000000000 && !(a6 | a5);
  if (a4 >> 62 != 1)
    return 0;
  v10 = 0x702D6F626D697761;
  v11 = 0xEA0000000000696DLL;
  v12 = a1;
  if ((_BYTE)a1)
  {
    if (a1 == 1)
      v13 = 0x702D6F626D697761;
    else
      v13 = 0x65636172746170;
    if (v12 == 1)
      v14 = 0xEA0000000000636DLL;
    else
      v14 = 0xE700000000000000;
    v15 = a4;
    if (!(_BYTE)a4)
      goto LABEL_15;
    goto LABEL_12;
  }
  v13 = 0x702D6F626D697761;
  v14 = 0xEA0000000000696DLL;
  v15 = a4;
  if ((_BYTE)a4)
  {
LABEL_12:
    if (v15 == 1)
    {
      v11 = 0xEA0000000000636DLL;
    }
    else
    {
      v10 = 0x65636172746170;
      v11 = 0xE700000000000000;
    }
  }
LABEL_15:
  if (v13 == v10 && v14 == v11)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v23 = sub_244F1BCA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v23 & 1) == 0)
      return result;
  }
  if (a2 == a5 && a3 == a6)
    return 1;
  return sub_244F1BCA0();
}

uint64_t sub_244EE7FE8(_QWORD *a1, uint64_t a2, uint64_t a3, __int16 a4, _QWORD *a5, uint64_t a6, uint64_t a7, __int16 a8)
{
  if (a1)
  {
    if (a1 == (_QWORD *)1)
    {
      if (a5 != (_QWORD *)1)
        return 0;
    }
    else if ((unint64_t)a5 < 2 || (sub_244EF17F8(a1, a5) & 1) == 0)
    {
      return 0;
    }
  }
  else if (a5)
  {
    return 0;
  }
  if ((a4 & 1) != 0)
  {
    if ((a8 & 1) != 0)
      return ((a4 & 0x100) == 0) ^ ((unsigned __int16)(a8 & 0x100) >> 8);
    return 0;
  }
  if ((a8 & 1) != 0 || (sub_244F1BD54() & 1) == 0)
    return 0;
  return ((a4 & 0x100) == 0) ^ ((unsigned __int16)(a8 & 0x100) >> 8);
}

uint64_t sub_244EE8098(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i;
  char v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  unint64_t v22;
  BOOL v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  unint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  unint64_t v52;
  char v53;
  char v54;
  char v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v61;
  _OWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[5];
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  const char *v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  char *v77;
  int v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  int64_t v87;
  uint64_t v88;
  _QWORD v89[3];
  uint64_t v90;

  v76 = 0;
  v84 = 0;
  v85 = 0;
  v2 = 0;
  v3 = 0;
  v4 = 0;
  v78 = 0;
  v79 = 0;
  v82 = 0;
  v5 = *(_QWORD *)(a1 + 64);
  v86 = a1 + 64;
  v6 = 1;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & v5;
  v87 = (unint64_t)(v7 + 63) >> 6;
  v88 = a1;
  v10 = 0x8000000000000000;
  v77 = "ms";
  v80 = 0x8000000244F1F670;
  v73 = "awimbo-pmc-sched";
  v74 = 0x8000000244F1F6B0;
  v75 = (unint64_t)"awimbo-pmc-config";
LABEL_4:
  v81 = v6;
LABEL_5:
  for (i = v3; ; i = 0)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v4 << 6);
      goto LABEL_22;
    }
    if (__OFADD__(v4++, 1))
    {
      __break(1u);
      goto LABEL_120;
    }
    if (v4 >= v87)
      goto LABEL_103;
    v16 = *(_QWORD *)(v86 + 8 * v4);
    if (!v16)
      break;
LABEL_21:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v4 << 6);
LABEL_22:
    v18 = 16 * v14;
    v19 = (uint64_t *)(*(_QWORD *)(v88 + 48) + v18);
    v20 = v19[1];
    v21 = (uint64_t *)(*(_QWORD *)(v88 + 56) + v18);
    v1 = *v21;
    v22 = v21[1];
    v23 = *v19 == 1701080941 && v20 == 0xE400000000000000;
    if (!v23)
    {
      v90 = *v19;
      if ((sub_244F1BCA0() & 1) == 0)
      {
        v31 = v90 == 0x702D6F626D697761 && v20 == 0xEF656C69662D696DLL;
        v70 = v2;
        v72 = v20;
        if (v31 || (v32 = v90, v33 = sub_244F1BCA0(), (v33 & 1) != 0))
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          if ((v10 & 0x8000000000000000) == 0)
          {
            if ((_BYTE)v10)
            {
              v69 = i;
              v54 = sub_244F1BCA0();
              swift_bridgeObjectRelease();
              i = v69;
              if ((v54 & 1) == 0)
                goto LABEL_123;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
            sub_244EE8FE4(v10);
          }
          v10 = 0x4000000000000000;
          v76 = v1;
          v84 = v22;
          v6 = v81;
          v3 = v72;
          v2 = v90;
        }
        else
        {
          v3 = v72;
          if (v32 == 0xD000000000000011 && v72 == v80 || (v33 = sub_244F1BCA0(), v34 = v90, (v33 & 1) != 0))
          {
            v71 = v10;
            v89[0] = 58;
            v89[1] = 0xE100000000000000;
            MEMORY[0x24BDAC7A8](v33);
            v68[2] = v89;
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            v35 = v83;
            v36 = sub_244F072D4(0x7FFFFFFFFFFFFFFFLL, 1, sub_244EE9068, (uint64_t)v68, v1, v22);
            v83 = v35;
            swift_bridgeObjectRelease();
            v37 = *(_QWORD *)(v36 + 16);
            if (v37)
            {
              v69 = i;
              v89[0] = MEMORY[0x24BEE4AF8];
              sub_244F172C0(0, v37, 0);
              v38 = v89[0];
              v68[4] = v36;
              v39 = (uint64_t *)(v36 + 56);
              do
              {
                v41 = *(v39 - 3);
                v40 = *(v39 - 2);
                v42 = *(v39 - 1);
                v43 = *v39;
                swift_bridgeObjectRetain();
                v1 = MEMORY[0x24952A4EC](v41, v40, v42, v43);
                v45 = v44;
                swift_bridgeObjectRelease();
                v89[0] = v38;
                v47 = *(_QWORD *)(v38 + 16);
                v46 = *(_QWORD *)(v38 + 24);
                if (v47 >= v46 >> 1)
                {
                  sub_244F172C0(v46 > 1, v47 + 1, 1);
                  v38 = v89[0];
                }
                *(_QWORD *)(v38 + 16) = v47 + 1;
                v48 = v38 + 16 * v47;
                *(_QWORD *)(v48 + 32) = v1;
                *(_QWORD *)(v48 + 40) = v45;
                v39 += 4;
                --v37;
              }
              while (v37);
              swift_bridgeObjectRelease();
              v10 = v71;
              v3 = v72;
              i = v69;
            }
            else
            {
              swift_bridgeObjectRelease();
              v38 = MEMORY[0x24BEE4AF8];
              v10 = v71;
            }
            if ((v10 & 0x8000000000000000) != 0)
              goto LABEL_68;
            if ((_BYTE)v10)
            {
              v2 = v70;
              if (v10 == 1)
              {
                swift_bridgeObjectRelease();
                goto LABEL_67;
              }
            }
            else
            {
              v2 = v70;
            }
            v1 = sub_244F1BCA0();
            swift_bridgeObjectRelease();
            v10 = v71;
            if ((v1 & 1) != 0)
            {
LABEL_67:
              sub_244EE8FE4(v10);
LABEL_68:
              v10 = 0x4000000000000001;
              sub_244EE9040(v85);
              v85 = v38;
              v2 = v90;
              goto LABEL_5;
            }
LABEL_120:
            sub_244EE8FFC();
            swift_allocError();
            *(_QWORD *)v63 = v10;
            *(_QWORD *)(v63 + 8) = v2;
            *(_QWORD *)(v63 + 16) = i;
            *(_QWORD *)(v63 + 24) = 1;
            *(_BYTE *)(v63 + 32) = 2;
            sub_244EE9050(v10);
            swift_willThrow();
            swift_release();
            swift_bridgeObjectRelease();
            sub_244EE8FE4(v10);
            swift_bridgeObjectRelease();
LABEL_121:
            swift_bridgeObjectRelease();
LABEL_112:
            v59 = v85;
LABEL_113:
            sub_244EE9040(v59);
            return v1;
          }
          if ((v90 != 0xD000000000000010 || v72 != (v75 | 0x8000000000000000)) && (sub_244F1BCA0() & 1) == 0)
          {
            v23 = v34 == 0xD000000000000013;
            v49 = v72;
            if (v23 && v72 == v74 || (sub_244F1BCA0() & 1) != 0)
            {
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              v50 = sub_244EECDD8(v1, v22);
              if ((v51 & 1) == 0)
              {
                v52 = v50;
                swift_bridgeObjectRelease();
                if ((v10 & 0x8000000000000000) == 0)
                {
                  if ((_BYTE)v10)
                  {
                    if (v10 == 1)
                    {
                      swift_bridgeObjectRelease();
                      goto LABEL_84;
                    }
                    v1 = v10;
                  }
                  else
                  {
                    v1 = v10;
                  }
                  v53 = sub_244F1BCA0();
                  swift_bridgeObjectRelease();
                  v10 = v1;
                  if ((v53 & 1) == 0)
                  {
                    sub_244EE8FFC();
                    swift_allocError();
                    *(_QWORD *)v66 = v1;
                    *(_QWORD *)(v66 + 8) = v2;
                    *(_QWORD *)(v66 + 16) = i;
                    *(_QWORD *)(v66 + 24) = 1;
                    *(_BYTE *)(v66 + 32) = 2;
                    sub_244EE9050(v1);
                    swift_willThrow();
                    swift_release();
                    swift_bridgeObjectRelease();
                    sub_244EE8FE4(v1);
                    goto LABEL_121;
                  }
LABEL_84:
                  sub_244EE8FE4(v10);
                }
                v6 = 0;
                v10 = 0x4000000000000001;
                v79 = 1000000000000 * v52;
                v82 = (v52 * (unsigned __int128)0xE8D4A51000uLL) >> 64;
                v3 = v72;
                v2 = v90;
                goto LABEL_4;
              }
              swift_bridgeObjectRelease();
              sub_244EE8FE4(v10);
              swift_bridgeObjectRelease();
              sub_244EE8FFC();
              swift_allocError();
              *(_QWORD *)v56 = v1;
              *(_QWORD *)(v56 + 8) = v22;
              *(_QWORD *)(v56 + 16) = 0xD00000000000001ALL;
              *(_QWORD *)(v56 + 24) = 0x8000000244F1F6D0;
              v57 = 3;
LABEL_101:
              *(_BYTE *)(v56 + 32) = v57;
            }
            else
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              sub_244EE8FE4(v10);
              swift_bridgeObjectRelease();
              sub_244EE8FFC();
              swift_allocError();
              *(_QWORD *)v65 = v90;
              *(_QWORD *)(v65 + 8) = v49;
              *(_QWORD *)(v65 + 16) = 0;
              *(_QWORD *)(v65 + 24) = 0;
              *(_BYTE *)(v65 + 32) = 0;
            }
            swift_willThrow();
            swift_release();
            goto LABEL_112;
          }
          if ((v10 & 0x8000000000000000) != 0)
          {
            swift_bridgeObjectRetain();
          }
          else
          {
            v69 = i;
            v1 = v10;
            if (v10 == 1)
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              sub_244EE8FE4(v10);
            }
            else
            {
              v55 = sub_244F1BCA0();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              if ((v55 & 1) == 0)
              {
                sub_244EE8FFC();
                swift_allocError();
                *(_QWORD *)v67 = v10;
                *(_QWORD *)(v67 + 8) = v2;
                *(_QWORD *)(v67 + 16) = v69;
                *(_QWORD *)(v67 + 24) = 1;
                *(_BYTE *)(v67 + 32) = 2;
                sub_244EE9050(v10);
                swift_willThrow();
                swift_release();
                swift_bridgeObjectRelease();
                sub_244EE8FE4(v10);
                goto LABEL_121;
              }
              sub_244EE8FE4(v10);
            }
          }
          v6 = v81;
          v3 = v72;
          v78 = 1;
          v10 = 0x4000000000000001;
          v2 = v90;
        }
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRetain_n();
    v24 = sub_244F1BB98();
    swift_bridgeObjectRelease();
    if (v24 >= 3)
    {
      swift_bridgeObjectRelease();
      sub_244EE8FE4(v10);
      sub_244EE8FFC();
      swift_allocError();
      *(_QWORD *)v56 = v1;
      *(_QWORD *)(v56 + 8) = v22;
      *(_QWORD *)(v56 + 16) = 0;
      *(_QWORD *)(v56 + 24) = 0;
      v57 = 1;
      goto LABEL_101;
    }
    swift_bridgeObjectRelease();
    if ((v10 & 0x8000000000000000) == 0)
    {
      v25 = 0xEA0000000000696DLL;
      if ((_BYTE)v10)
      {
        if (v10 == 1)
        {
          v26 = 0x702D6F626D697761;
          v1 = 0xEA0000000000636DLL;
        }
        else
        {
          v1 = 0xE700000000000000;
          v26 = 0x65636172746170;
        }
      }
      else
      {
        v26 = 0x702D6F626D697761;
        v1 = 0xEA0000000000696DLL;
      }
      v27 = v2;
      v28 = i;
      if ((_BYTE)v24)
      {
        if (v24 == 1)
        {
          v29 = 0x702D6F626D697761;
          v25 = 0xEA0000000000636DLL;
        }
        else
        {
          v25 = 0xE700000000000000;
          v29 = 0x65636172746170;
        }
      }
      else
      {
        v29 = 0x702D6F626D697761;
      }
      v30 = v10;
      if (v26 == v29 && v1 == v25)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v12 = sub_244F1BCA0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v12 & 1) == 0)
        {
          sub_244EE8FFC();
          swift_allocError();
          *(_QWORD *)v58 = v30;
          *(_QWORD *)(v58 + 8) = v27;
          *(_QWORD *)(v58 + 16) = v28;
          *(_QWORD *)(v58 + 24) = v24;
          *(_BYTE *)(v58 + 32) = 2;
          sub_244EE9050(v30);
          swift_willThrow();
          swift_release();
          swift_bridgeObjectRelease();
          sub_244EE8FE4(v30);
          goto LABEL_112;
        }
      }
      sub_244EE8FE4(v30);
    }
    v2 = 0;
    v10 = v24;
  }
  v17 = v4 + 1;
  if (v4 + 1 >= v87)
    goto LABEL_103;
  v16 = *(_QWORD *)(v86 + 8 * v17);
  if (v16)
    goto LABEL_20;
  v17 = v4 + 2;
  if (v4 + 2 >= v87)
    goto LABEL_103;
  v16 = *(_QWORD *)(v86 + 8 * v17);
  if (v16)
  {
LABEL_20:
    v4 = v17;
    goto LABEL_21;
  }
  v17 = v4 + 3;
  if (v4 + 3 < v87)
  {
    v16 = *(_QWORD *)(v86 + 8 * v17);
    if (!v16)
    {
      while (1)
      {
        v4 = v17 + 1;
        if (__OFADD__(v17, 1))
          break;
        if (v4 >= v87)
          goto LABEL_103;
        v16 = *(_QWORD *)(v86 + 8 * v4);
        ++v17;
        if (v16)
          goto LABEL_21;
      }
      __break(1u);
LABEL_123:
      sub_244EE8FFC();
      swift_allocError();
      v1 = v70;
      *(_QWORD *)v64 = v10;
      *(_QWORD *)(v64 + 8) = v1;
      *(_QWORD *)(v64 + 16) = i;
      *(_QWORD *)(v64 + 24) = 0;
      *(_BYTE *)(v64 + 32) = 2;
      sub_244EE9050(v10);
      swift_willThrow();
      swift_release();
      sub_244EE8FE4(v10);
      swift_bridgeObjectRelease();
      goto LABEL_121;
    }
    goto LABEL_20;
  }
LABEL_103:
  swift_release();
  v1 = v85;
  if (v10 >> 62)
  {
    if (v10 >> 62 != 1)
    {
      swift_bridgeObjectRelease();
      sub_244EE8FFC();
      swift_allocError();
      *(_OWORD *)v61 = 0u;
      *(_OWORD *)(v61 + 16) = 0u;
      *(_BYTE *)(v61 + 32) = 4;
      swift_willThrow();
      v59 = v1;
      goto LABEL_113;
    }
    sub_244EE8FE4(v10);
  }
  if ((_BYTE)v10)
  {
    if (v10 == 1)
    {
      swift_bridgeObjectRelease();
      if (!(v78 & 1 | ((v81 & 1) == 0)) && !v1)
      {
        sub_244EE9084();
        swift_allocError();
        *v62 = xmmword_244F1C560;
        swift_willThrow();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_244EE9040(v1);
      return 1;
    }
  }
  else
  {
    sub_244EE9040(v1);
    return v76;
  }
  return v1;
}

unint64_t sub_244EE8FE4(unint64_t result)
{
  if (result >> 62 == 1)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_244EE8FFC()
{
  unint64_t result;

  result = qword_25742BAB8;
  if (!qword_25742BAB8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1C3D4, &type metadata for ProviderOptions.UsageError);
    atomic_store(result, (unint64_t *)&qword_25742BAB8);
  }
  return result;
}

unint64_t sub_244EE9040(unint64_t result)
{
  if (result >= 2)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_244EE9050(unint64_t result)
{
  if (result >> 62 == 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_244EE9068(_QWORD *a1)
{
  uint64_t v1;

  return sub_244F0A5F8(a1, *(_QWORD **)(v1 + 16)) & 1;
}

unint64_t sub_244EE9084()
{
  unint64_t result;

  result = qword_25742BAC0;
  if (!qword_25742BAC0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1C394, &type metadata for AwimboPMCOptions.UsageError);
    atomic_store(result, (unint64_t *)&qword_25742BAC0);
  }
  return result;
}

unint64_t destroy for AwimboPMCOptions.UsageError(unint64_t *a1)
{
  unint64_t result;
  int v3;

  result = *a1;
  v3 = -1;
  if (result < 0xFFFFFFFF)
    v3 = result;
  if (v3 - 2 < 0)
  {
    if (result >= 2)
      swift_bridgeObjectRelease();
    result = a1[1];
    if (result >= 2)
      return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *_s7Recount16AwimboPMCOptionsV10UsageErrorOwCP_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *a2;
  LODWORD(v5) = -1;
  if (*a2 < 0xFFFFFFFF)
    v5 = *a2;
  if ((int)v5 - 2 < 0)
  {
    if (v4 >= 2)
      v4 = swift_bridgeObjectRetain();
    *a1 = v4;
    v6 = a2[1];
    if (v6 >= 2)
      v6 = swift_bridgeObjectRetain();
    a1[1] = v6;
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

unint64_t *assignWithCopy for AwimboPMCOptions.UsageError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t *v12;
  unint64_t v13;

  v4 = *a1;
  LODWORD(v5) = -1;
  if (*a1 >= 0xFFFFFFFF)
    LODWORD(v6) = -1;
  else
    v6 = *a1;
  v7 = v6 - 2;
  v8 = *a2;
  if (*a2 < 0xFFFFFFFF)
    v5 = *a2;
  v9 = v5 - 2;
  if ((v7 & 0x80000000) == 0)
  {
    if (v9 < 0)
    {
      if (v8 >= 2)
        v8 = swift_bridgeObjectRetain();
      *a1 = v8;
      v10 = a2[1];
      if (v10 >= 2)
        v10 = swift_bridgeObjectRetain();
      a1[1] = v10;
      return a1;
    }
LABEL_18:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if ((v9 & 0x80000000) == 0)
  {
    if (v4 >= 2)
      swift_bridgeObjectRelease();
    if (a1[1] >= 2)
      swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  if (v4 >= 2)
  {
    if (v8 >= 2)
    {
      *a1 = v8;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_244EE92E8((uint64_t)a1);
      *a1 = *a2;
    }
  }
  else
  {
    *a1 = v8;
    if (v8 >= 2)
      swift_bridgeObjectRetain();
  }
  v12 = a1 + 1;
  v13 = a2[1];
  if (a1[1] >= 2)
  {
    if (v13 >= 2)
    {
      *v12 = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_244EE92E8((uint64_t)(a1 + 1));
      *v12 = a2[1];
    }
  }
  else
  {
    *v12 = v13;
    if (v13 >= 2)
      swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_244EE92E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742BAC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24952AE10]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

unint64_t *assignWithTake for AwimboPMCOptions.UsageError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  int v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v4 = *a1;
  v5 = -1;
  if (v4 < 0xFFFFFFFF)
    v5 = v4;
  if (v5 - 2 >= 0)
    goto LABEL_4;
  v7 = *a2;
  LODWORD(v8) = -1;
  if (*a2 < 0xFFFFFFFF)
    v8 = *a2;
  if ((int)v8 - 2 >= 0)
  {
    if (v4 >= 2)
      swift_bridgeObjectRelease();
    if (a1[1] >= 2)
      swift_bridgeObjectRelease();
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 >= 2)
  {
    if (v7 >= 2)
    {
      *a1 = v7;
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
    sub_244EE92E8((uint64_t)a1);
  }
  *a1 = v7;
LABEL_18:
  v9 = a1 + 1;
  v10 = a2[1];
  if (a1[1] >= 2)
  {
    if (v10 >= 2)
    {
      *v9 = v10;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_244EE92E8((uint64_t)(a1 + 1));
  }
  *v9 = v10;
  return a1;
}

uint64_t getEnumTagSinglePayload for AwimboPMCOptions.UsageError(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 2;
  if (v4 < 0)
    v4 = -1;
  if ((v4 + 1) >= 2)
    return v4;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AwimboPMCOptions.UsageError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 2;
  }
  return result;
}

uint64_t sub_244EE950C(uint64_t *a1)
{
  uint64_t v1;
  int v2;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 2;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

_QWORD *sub_244EE9534(_QWORD *result, unsigned int a2)
{
  uint64_t v2;

  if (a2 > 0x7FFFFFFD)
  {
    v2 = a2 - 2147483646;
    result[1] = 0;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 + 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AwimboPMCOptions.UsageError()
{
  return &type metadata for AwimboPMCOptions.UsageError;
}

unint64_t sub_244EE9578(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
      goto LABEL_2;
    case 2:
      result = sub_244EE9050(result);
      break;
    case 3:
      swift_bridgeObjectRetain();
LABEL_2:
      result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

unint64_t destroy for ProviderOptions.UsageError(uint64_t a1)
{
  return sub_244EE95EC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

unint64_t sub_244EE95EC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
      goto LABEL_2;
    case 2:
      result = sub_244EE8FE4(result);
      break;
    case 3:
      swift_bridgeObjectRelease();
LABEL_2:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for ProviderOptions.UsageError(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_244EE9578(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for ProviderOptions.UsageError(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_244EE9578(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_244EE95EC(v8, v9, v10, v11, v12);
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

uint64_t assignWithTake for ProviderOptions.UsageError(uint64_t a1, uint64_t a2)
{
  char v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_244EE95EC(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProviderOptions.UsageError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ProviderOptions.UsageError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_244EE9808(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 3u)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_244EE9820(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 4;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ProviderOptions.UsageError()
{
  return &type metadata for ProviderOptions.UsageError;
}

uint64_t sub_244EE9854(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ModeName(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ModeName(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244EE9958 + 4 * byte_244F1C2C2[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_244EE998C + 4 * byte_244F1C2BD[v4]))();
}

uint64_t sub_244EE998C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EE9994(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244EE999CLL);
  return result;
}

uint64_t sub_244EE99A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244EE99B0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_244EE99B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EE99BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EE99C8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_244EE99D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ModeName()
{
  return &type metadata for ModeName;
}

unint64_t destroy for ModeSelection(unint64_t *a1)
{
  return sub_244EE8FE4(*a1);
}

unint64_t *_s7Recount13ModeSelectionOwCP_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_244EE9050(*a2);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

unint64_t *assignWithCopy for ModeSelection(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_244EE9050(*a2);
  v6 = *a1;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_244EE8FE4(v6);
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

unint64_t *assignWithTake for ModeSelection(unint64_t *a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *a1;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_244EE8FE4(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModeSelection(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)a1 >> 2;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ModeSelection(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = 0;
      *(_QWORD *)result = 4 * -a2;
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_244EE9B84(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return (*(_QWORD *)a1 & 3 | (4 * *(_DWORD *)(a1 + 8))) + 2;
}

_QWORD *sub_244EE9BA4(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

_QWORD *sub_244EE9BB4(_QWORD *result, uint64_t a2)
{
  if (a2 < 2)
  {
    *result = *result & 3 | (a2 << 62);
  }
  else
  {
    result[1] = (unint64_t)(a2 - 2) >> 2;
    result[2] = 0;
    *result = ((_BYTE)a2 - 2) & 3 | 0x8000000000000000;
  }
  return result;
}

ValueMetadata *type metadata accessor for ModeSelection()
{
  return &type metadata for ModeSelection;
}

uint64_t initializeBufferWithCopyOfBuffer for ModeOption(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

unint64_t sub_244EE9C28(unint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  if (a4 < 0)
    return sub_244EE9C38(a1);
  else
    return swift_bridgeObjectRetain();
}

unint64_t sub_244EE9C38(unint64_t result)
{
  if (result >= 2)
    return swift_bridgeObjectRetain();
  return result;
}

unint64_t destroy for ModeOption(uint64_t a1)
{
  return sub_244EE9C5C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_WORD *)(a1 + 24));
}

unint64_t sub_244EE9C5C(unint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  if (a4 < 0)
    return sub_244EE9040(a1);
  else
    return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ModeOption(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int16 v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_WORD *)(a2 + 24);
  sub_244EE9C28(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_WORD *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ModeOption(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int16 v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_WORD *)(a2 + 24);
  sub_244EE9C28(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_WORD *)(a1 + 24);
  *(_WORD *)(a1 + 24) = v6;
  sub_244EE9C5C(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy26_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 10) = *(_OWORD *)(a2 + 10);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ModeOption(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int16 v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_WORD *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_WORD *)(a1 + 24);
  *(_WORD *)(a1 + 24) = v4;
  sub_244EE9C5C(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModeOption(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x3FFF && *(_BYTE *)(a1 + 26))
    return (*(_DWORD *)a1 + 0x3FFF);
  v3 = (*(_WORD *)(a1 + 24) & 0xFE | (*(unsigned __int16 *)(a1 + 24) >> 15) | (*(unsigned __int16 *)(a1 + 24) >> 1) & 0x3F00) ^ 0x3FFF;
  if (v3 >= 0x3FFE)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ModeOption(uint64_t result, unsigned int a2, unsigned int a3)
{
  unsigned int v3;

  if (a2 > 0x3FFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x3FFF;
    if (a3 >= 0x3FFF)
      *(_BYTE *)(result + 26) = 1;
  }
  else
  {
    if (a3 >= 0x3FFF)
      *(_BYTE *)(result + 26) = 0;
    if (a2)
    {
      v3 = ((-a2 >> 1) & 0x1FFF) - (a2 << 13);
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = 0;
      *(_WORD *)(result + 24) = (4 * v3) & 0xFE00 | (2 * (v3 & 0x7F));
    }
  }
  return result;
}

uint64_t sub_244EE9E70(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 24) >> 15;
}

uint64_t sub_244EE9E7C(uint64_t result)
{
  *(_WORD *)(result + 24) &= ~0x8000u;
  return result;
}

uint64_t sub_244EE9E8C(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 24) = *(_WORD *)(result + 24) & 0x101 | (a2 << 15);
  return result;
}

ValueMetadata *type metadata accessor for ModeOption()
{
  return &type metadata for ModeOption;
}

unint64_t sub_244EE9EB4()
{
  unint64_t result;

  result = qword_25742BAD0;
  if (!qword_25742BAD0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1C488, &type metadata for ModeName);
    atomic_store(result, (unint64_t *)&qword_25742BAD0);
  }
  return result;
}

unint64_t destroy for AwimboPMCOptions(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 2)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for AwimboPMCOptions(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)a2;
  if (*(_QWORD *)a2 >= 2uLL)
    v4 = swift_bridgeObjectRetain();
  *(_QWORD *)a1 = v4;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  return a1;
}

uint64_t assignWithCopy for AwimboPMCOptions(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)a2;
  if (v4 >= 2)
  {
    if (v5 >= 2)
    {
      *(_QWORD *)a1 = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_244EE92E8(a1);
      *(_QWORD *)a1 = *(_QWORD *)a2;
    }
  }
  else
  {
    *(_QWORD *)a1 = v5;
    if (v5 >= 2)
      swift_bridgeObjectRetain();
  }
  v6 = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  return a1;
}

uint64_t assignWithTake for AwimboPMCOptions(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  v4 = *(_QWORD *)a2;
  if (*(_QWORD *)a1 >= 2uLL)
  {
    if (v4 >= 2)
    {
      *(_QWORD *)a1 = v4;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_244EE92E8(a1);
  }
  *(_QWORD *)a1 = v4;
LABEL_6:
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  return a1;
}

uint64_t getEnumTagSinglePayload for AwimboPMCOptions(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFFD && *((_BYTE *)a1 + 26))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 2;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AwimboPMCOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD)
      *(_BYTE *)(result + 26) = 1;
  }
  else
  {
    if (a3 > 0x7FFFFFFD)
      *(_BYTE *)(result + 26) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for AwimboPMCOptions()
{
  return &type metadata for AwimboPMCOptions;
}

uint64_t TraceProvider.__allocating_init(options:session:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  TraceProvider.init(options:session:)(a1, a2);
  return v4;
}

_QWORD *TraceProvider.init(options:session:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  _QWORD *v19;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  __int128 v53;
  uint64_t v54;
  _UNKNOWN **v55;
  _BYTE v56[48];
  uint64_t v57;
  unint64_t v58;
  _QWORD v59[5];
  int v60;

  v51 = a2;
  v4 = sub_244F1B6F4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742BBA0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_244F1B754();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_244EE8098(a1);
  if (v2)
  {
    v19 = v52;
    type metadata accessor for TraceProvider();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v21 = v17;
    v43 = v10;
    v44 = v5;
    v45 = v4;
    v46 = v14;
    v47 = v7;
    v48 = v12;
    v22 = v18;
    if (v18 < 0)
    {
      sub_244EF3000(v15, v16, v17, v18 & 0x101, (uint64_t)v59);
      v23 = type metadata accessor for AwimboPMC(0);
      swift_allocObject();
      sub_244EEA820(v59);
      v28 = sub_244EEEAE0((uint64_t)v59);
      v54 = v23;
      v55 = &off_2515F13E8;
      sub_244EEA910(v59);
    }
    else
    {
      v49 = v15;
      v50 = v16;
      sub_244F02C08((uint64_t)v56);
      sub_244EEAA3C((uint64_t)v56);
      v24 = sub_244EF77A8((uint64_t)v56);
      v60 = v22;
      if (v50)
      {
        v42 = v24;
        v41 = v57;
        v25 = v58;
        v26 = v48;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v48 + 56))(v43, 1, 1, v11);
        (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v47, *MEMORY[0x24BDCD7A0], v45);
        swift_bridgeObjectRetain();
        v27 = v46;
        sub_244F1B73C();
        v32 = sub_244F1B760();
        v34 = v33;
        (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v11);
        v35 = type metadata accessor for AwimboPMI(0);
        swift_allocObject();
        v36 = swift_retain();
        v28 = sub_244EEFA00(v36, v25, v41, v32, v34);
        swift_release();
        sub_244EE9C5C(v49, v50, v21, v60);
      }
      else
      {
        v29 = v57;
        v30 = v58;
        v31 = v24;
        v35 = type metadata accessor for AwimboPMI(0);
        swift_allocObject();
        v28 = sub_244EEFA00(v31, v30, v29, 0, 0xF000000000000000);
      }
      sub_244EEAA84((uint64_t)v56);
      type metadata accessor for AwimboPMI(0);
      v55 = &off_2515F13C0;
      v54 = v35;
    }
    *(_QWORD *)&v53 = v28;
    v19 = v52;
    sub_244EEAA00(&v53, (uint64_t)(v52 + 2));
    v37 = v51;
    v38 = v19[5];
    v39 = v19[6];
    __swift_project_boxed_opaque_existential_1(v19 + 2, v38);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 8))(v37, v38, v39);
  }
  return v19;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> TraceProvider.activate()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> TraceProvider.cancel()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> TraceProvider.append(file:)(Swift::OpaquePointer file)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1[5];
  v4 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v3);
  (*(void (**)(void *, uint64_t, uint64_t))(v4 + 32))(file._rawValue, v3, v4);
}

uint64_t TraceProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t TraceProvider.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TraceProvider()
{
  return objc_opt_self();
}

_QWORD *sub_244EEA820(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  swift_bridgeObjectRetain();
  sub_244EEA88C(v2, v3);
  sub_244EEA8E4(v4);
  return a1;
}

uint64_t sub_244EEA88C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_244EEA8A0(a1, a2);
  return a1;
}

uint64_t sub_244EEA8A0(uint64_t a1, unint64_t a2)
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

uint64_t sub_244EEA8E4(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

_QWORD *sub_244EEA910(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  swift_bridgeObjectRelease();
  sub_244EEA97C(v2, v3);
  sub_244EEA9D4(v4);
  return a1;
}

uint64_t sub_244EEA97C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_244EEA990(a1, a2);
  return a1;
}

uint64_t sub_244EEA990(uint64_t a1, unint64_t a2)
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

uint64_t sub_244EEA9D4(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_244EEAA00(__int128 *a1, uint64_t a2)
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

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_244EEAA3C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244EEAA84(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_244EEAACC()
{
  unint64_t result;

  result = qword_25742BBA8;
  if (!qword_25742BBA8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1C9A0, &type metadata for AwimboPMIError);
    atomic_store(result, (unint64_t *)&qword_25742BBA8);
  }
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

char *sub_244EEAB30(int a1)
{
  char *result;

  sub_244F1BAB4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_244F1B8A4();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  result = strerror(a1);
  if (result)
  {
    sub_244F1B8B0();
    sub_244F1B8A4();
    swift_bridgeObjectRelease();
    return (char *)543387755;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_244EEABFC()
{
  int *v0;

  return sub_244EEAB30(*v0);
}

uint64_t sub_244EEAC08(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  unint64_t v25;
  char *v26;
  size_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  unint64_t v31;
  char *v32;
  size_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  unint64_t v37;
  char *v38;
  size_t v39;
  uint64_t result;
  uint64_t v41;
  int v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;

  v5 = v4;
  v10 = sub_244F1B784();
  v45 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244F1B778();
  swift_bridgeObjectRetain();
  sub_244EEA8E4(a3);
  swift_bridgeObjectRetain();
  sub_244EEA8E4(a3);
  v44 = v12;
  v13 = sub_244F1B76C();
  v14 = sub_244F1B9AC();
  if (os_log_type_enabled(v13, v14))
  {
    v42 = a1;
    v43 = v10;
    v15 = swift_slowAlloc();
    v41 = swift_slowAlloc();
    v48 = v41;
    *(_DWORD *)v15 = 136315394;
    v16 = swift_bridgeObjectRetain();
    v17 = MEMORY[0x24952A5DC](v16, MEMORY[0x24BEE4568]);
    v19 = v18;
    swift_bridgeObjectRelease();
    v46 = sub_244EF18BC(v17, v19, &v48);
    sub_244F1BA54();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    if (a3)
    {
      v46 = 2112112;
      v47 = 0xE300000000000000;
      MEMORY[0x24952A5DC](a3, MEMORY[0x24BEE4568]);
      sub_244F1B8A4();
      swift_bridgeObjectRelease();
      sub_244F1B8A4();
      MEMORY[0x24952A5DC](a4, MEMORY[0x24BEE44F0]);
      sub_244F1B8A4();
      swift_bridgeObjectRelease();
      v20 = v46;
      v21 = v47;
    }
    else
    {
      v21 = 0xE400000000000000;
      v20 = 1701736302;
    }
    v46 = sub_244EF18BC(v20, v21, &v48);
    sub_244F1BA54();
    swift_bridgeObjectRelease();
    sub_244EEA9D4(a3);
    sub_244EEA9D4(a3);
    _os_log_impl(&dword_244EE6000, v13, v14, "configs: %s, samplers: %s", (uint8_t *)v15, 0x16u);
    v22 = v41;
    swift_arrayDestroy();
    MEMORY[0x24952AE88](v22, -1, -1);
    MEMORY[0x24952AE88](v15, -1, -1);

    v10 = v43;
    a1 = v42;
  }
  else
  {
    swift_bridgeObjectRelease_n();

    sub_244EEA9D4(a3);
    sub_244EEA9D4(a3);
  }
  *(_DWORD *)(v5 + 16) = a1;
  v23 = *(_QWORD *)(a2 + 16);
  if (v23 >> 60)
  {
    __break(1u);
    goto LABEL_30;
  }
  v24 = (char *)swift_slowAlloc();
  *(_QWORD *)(v5 + 24) = v24;
  *(_QWORD *)(v5 + 32) = v23;
  v25 = *(_QWORD *)(a2 + 16);
  if (!v25)
    goto LABEL_13;
  if (v23 < v25)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v26 = (char *)(a2 + 32);
  v27 = 8 * v25;
  if (a2 + 32 < (unint64_t)&v24[8 * v25] && v24 < &v26[v27])
    goto LABEL_35;
  memcpy(v24, v26, v27);
LABEL_13:
  swift_bridgeObjectRelease();
  if (!a3)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v10);
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_BYTE *)(v5 + 72) = 1;
    return v5;
  }
  v28 = *(_QWORD *)(a3 + 16);
  if (v28 >> 60)
    goto LABEL_31;
  v29 = (char *)swift_slowAlloc();
  v30 = v29;
  v31 = *(_QWORD *)(a3 + 16);
  if (v31)
  {
    if (v28 < v31)
    {
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    v32 = (char *)(a3 + 32);
    v33 = 8 * v31;
    if (a3 + 32 < (unint64_t)&v29[8 * v31] && v29 < &v32[v33])
      goto LABEL_35;
    memcpy(v29, v32, v33);
  }
  swift_bridgeObjectRelease();
  v34 = *(_QWORD *)(a4 + 16);
  if (v34 >> 61)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v35 = (char *)swift_slowAlloc();
  v36 = v35;
  v37 = *(_QWORD *)(a4 + 16);
  if (!v37)
  {
LABEL_26:
    (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v10);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v5 + 40) = v30;
    *(_QWORD *)(v5 + 48) = v28;
    *(_QWORD *)(v5 + 56) = v36;
    *(_QWORD *)(v5 + 64) = v34;
    *(_BYTE *)(v5 + 72) = 0;
    return v5;
  }
  if (v34 < v37)
    goto LABEL_34;
  v38 = (char *)(a4 + 32);
  v39 = 4 * v37;
  if (a4 + 32 >= (unint64_t)&v35[4 * v37] || v35 >= &v38[v39])
  {
    memcpy(v35, v38, v39);
    goto LABEL_26;
  }
LABEL_35:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244EEB0E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1)
    MEMORY[0x24952AE88](v1, -1, -1);
  if ((*(_BYTE *)(v0 + 72) & 1) == 0)
  {
    v2 = *(_QWORD *)(v0 + 40);
    v3 = *(_QWORD *)(v0 + 56);
    if (v2)
      MEMORY[0x24952AE88](v2, -1, -1);
    if (v3)
      MEMORY[0x24952AE88](v3, -1, -1);
  }
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for KPCSet()
{
  return objc_opt_self();
}

uint64_t sub_244EEB170()
{
  uint64_t v0;
  uint64_t result;
  int v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  result = kpc_set_config();
  if ((_DWORD)result)
  {
    v2 = MEMORY[0x24952A414]();
    sub_244EEBF90();
    swift_allocError();
    *(_DWORD *)v3 = v2;
    v4 = 0xEA00000000006769;
    v5 = 0x666E6F632D746573;
LABEL_3:
    *(_QWORD *)(v3 + 8) = v5;
    *(_QWORD *)(v3 + 16) = v4;
    return swift_willThrow();
  }
  if ((*(_BYTE *)(v0 + 72) & 1) == 0)
  {
    if (kpc_set_period())
    {
      v6 = MEMORY[0x24952A414]();
      sub_244EEBF90();
      swift_allocError();
      *(_DWORD *)v3 = v6;
      v5 = 0x697265702D746573;
      v4 = 0xEA0000000000646FLL;
      goto LABEL_3;
    }
    result = kpc_set_actionid();
    if ((_DWORD)result)
    {
      v7 = MEMORY[0x24952A414]();
      sub_244EEBF90();
      swift_allocError();
      *(_DWORD *)v3 = v7;
      v4 = 0xEC00000064696E6FLL;
      v5 = 0x697463612D746573;
      goto LABEL_3;
    }
  }
  return result;
}

uint64_t sub_244EEB2C0(unint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  dispatch_semaphore_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  uint64_t v41;

  v5 = v4;
  v35 = sub_244F1B7A8();
  v32 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v34 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_244F1B7C0();
  v31 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_244F1B9C4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v5 + 72) = 0;
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = a1;
  swift_bridgeObjectRetain();
  v17 = dispatch_semaphore_create(0);
  *(_QWORD *)(v5 + 40) = a2;
  *(_QWORD *)(v5 + 48) = a3;
  *(_BYTE *)(v5 + 56) = a4 & 1;
  v18 = *(_QWORD *)(v5 + 72);
  *(_QWORD *)(v5 + 64) = v17;
  *(_QWORD *)(v5 + 72) = 0;
  MEMORY[0x24952ADC8](v18);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_244F1BB5C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v19 < 2)
  {
    *(_QWORD *)(v5 + 32) = 0;
  }
  else
  {
    sub_244EEBFD4();
    aBlock = MEMORY[0x24BEE4AF8];
    sub_244EEC0A8(&qword_25742BE48, (uint64_t (*)(uint64_t))MEMORY[0x24BEE57C0], MEMORY[0x24BEE57D0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742BE50);
    sub_244EEC0E8(&qword_25742BE58, &qword_25742BE50);
    sub_244F1BA6C();
    v20 = sub_244F1B9D0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    *(_QWORD *)(v5 + 32) = v20;
    swift_getObjectType();
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = v5;
    *(_QWORD *)(v21 + 24) = v20;
    v40 = sub_244EEC080;
    v41 = v21;
    aBlock = MEMORY[0x24BDAC760];
    v37 = 1107296256;
    v38 = sub_244EEB908;
    v39 = &block_descriptor;
    v22 = _Block_copy(&aBlock);
    swift_unknownObjectRetain_n();
    swift_retain();
    v23 = v12;
    sub_244F1B7B4();
    v24 = v34;
    sub_244EEB9D0();
    sub_244F1B9DC();
    _Block_release(v22);
    v32 = *(_QWORD *)(v32 + 8);
    v25 = v35;
    ((void (*)(char *, uint64_t))v32)(v24, v35);
    v26 = *(void (**)(char *, uint64_t))(v31 + 8);
    v27 = v12;
    v28 = v33;
    v26(v27, v33);
    swift_release();
    v40 = sub_244EEC0A0;
    v41 = v5;
    aBlock = MEMORY[0x24BDAC760];
    v37 = 1107296256;
    v38 = sub_244EEB908;
    v39 = &block_descriptor_3;
    v29 = _Block_copy(&aBlock);
    swift_retain();
    sub_244F1B7B4();
    sub_244EEB9D0();
    sub_244F1B9E8();
    _Block_release(v29);
    swift_unknownObjectRelease();
    ((void (*)(char *, uint64_t))v32)(v24, v25);
    v26(v23, v28);
    swift_release();
  }
  return v5;
}

uint64_t sub_244EEB69C(_QWORD *a1)
{
  unint64_t v1;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  if (kpc_set_counting())
  {
    v3 = MEMORY[0x24952A414]();
    sub_244EEBF90();
    v4 = swift_allocError();
    *(_DWORD *)v5 = v3;
    *(_QWORD *)(v5 + 8) = 0xD000000000000010;
    *(_QWORD *)(v5 + 16) = 0x8000000244F1F9E0;
    swift_willThrow();
LABEL_20:
    v15 = a1[9];
    a1[9] = v4;
    MEMORY[0x24952ADD4](v4);
    MEMORY[0x24952ADC8](v15);
    swift_getObjectType();
    sub_244F1B9F4();
    goto LABEL_28;
  }
  v6 = a1[2];
  v7 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
  }
  else
  {
    a1[2] = v7;
    v1 = a1[3];
    if (!(v1 >> 62))
    {
      v8 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRetain();
  v8 = sub_244F1BB5C();
  swift_bridgeObjectRelease();
LABEL_6:
  v9 = v1 & 0xC000000000000001;
  if (v7 >= v8)
    goto LABEL_10;
  v10 = a1[2];
  if (v9)
    goto LABEL_24;
  if ((v10 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_10:
    v10 = 0;
    a1[2] = 0;
    if (!v9)
      goto LABEL_11;
LABEL_24:
    MEMORY[0x24952A750](v10, v1);
    v11 = 0;
    goto LABEL_13;
  }
LABEL_11:
  if (v10 >= *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_26;
  }
  swift_retain();
  v11 = 1;
LABEL_13:
  sub_244EEB170();
  swift_release();
  v12 = a1[2];
  if (v11)
  {
    if ((v12 & 0x8000000000000000) == 0)
    {
      if (v12 < *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        swift_retain();
        goto LABEL_18;
      }
LABEL_27:
      __break(1u);
LABEL_28:
      JUMPOUT(0x24952ADC8);
    }
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  MEMORY[0x24952A750](v12, v1);
LABEL_18:
  if (kpc_set_counting())
  {
    v13 = MEMORY[0x24952A414]();
    sub_244EEBF90();
    v4 = swift_allocError();
    *(_DWORD *)v14 = v13;
    *(_QWORD *)(v14 + 8) = 0x6E756F632D746573;
    *(_QWORD *)(v14 + 16) = 0xEF6E6F20676E6974;
    swift_willThrow();
    swift_release();
    goto LABEL_20;
  }
  return swift_release();
}

uint64_t sub_244EEB908(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_244EEB934(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (kpc_set_counting())
  {
    v2 = MEMORY[0x24952A414]();
    sub_244EEBF90();
    v3 = swift_allocError();
    *(_DWORD *)v4 = v2;
    *(_QWORD *)(v4 + 8) = 0xD000000000000010;
    *(_QWORD *)(v4 + 16) = 0x8000000244F1F9E0;
    swift_willThrow();
    v5 = *(_QWORD *)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v3;
    MEMORY[0x24952ADC8](v5);
  }
  return sub_244F1BA18();
}

uint64_t sub_244EEB9D0()
{
  sub_244F1B7A8();
  sub_244EEC0A8(&qword_25742BE60, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742BE68);
  sub_244EEC0E8((unint64_t *)&unk_25742BE70, &qword_25742BE68);
  return sub_244F1BA6C();
}

uint64_t sub_244EEBA7C(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(_QWORD);
  char *v23;
  uint64_t *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t ObjectType;
  char *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t *, uint64_t);
  _QWORD v39[2];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  char *v44;
  uint64_t v45;
  uint64_t *v46;
  void (*v47)(_QWORD);
  unsigned int v48;

  v2 = v1;
  v48 = a1;
  v3 = sub_244F1B7E4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v39 - v8;
  v10 = sub_244F1B79C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v39 - v15;
  result = kpc_force_all_ctrs_set();
  if ((_DWORD)result)
  {
    v18 = MEMORY[0x24952A414]();
    sub_244EEBF90();
    swift_allocError();
    *(_DWORD *)v19 = v18;
    strcpy((char *)(v19 + 8), "force-counters");
    *(_BYTE *)(v19 + 23) = -18;
    return swift_willThrow();
  }
  v45 = v11;
  v46 = (uint64_t *)v14;
  v43 = (uint64_t *)v16;
  v44 = v9;
  v40 = v4;
  v41 = v10;
  v20 = *(_QWORD *)(v2 + 24);
  v42 = v3;
  if ((v20 & 0xC000000000000001) != 0)
  {
    MEMORY[0x24952A750](0, v20);
    v23 = v7;
    v21 = v48;
    v22 = v47;
  }
  else
  {
    v21 = v48;
    v22 = v47;
    if (!*(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_23;
    }
    v23 = v7;
    swift_retain();
  }
  sub_244EEB170();
  result = swift_release();
  v24 = v46;
  if (v22)
    return result;
  if ((v21 & 1) == 0)
  {
    if ((v20 & 0xC000000000000001) != 0)
    {
      MEMORY[0x24952A750](0, v20);
    }
    else
    {
      if (!*(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_25:
        __break(1u);
        return result;
      }
      swift_retain();
    }
    if (kpc_set_counting())
    {
      v25 = MEMORY[0x24952A414]();
      sub_244EEBF90();
      swift_allocError();
      *(_DWORD *)v26 = v25;
      *(_QWORD *)(v26 + 8) = 0x6E756F632D746573;
      *(_QWORD *)(v26 + 16) = 0xEF6E6F20676E6974;
      swift_willThrow();
      return swift_release();
    }
    result = swift_release();
  }
  if ((*(_BYTE *)(v2 + 56) & 1) == 0 && *(_QWORD *)(v2 + 32))
  {
    swift_unknownObjectRetain();
    result = sub_244F1BD3C();
    v28 = 1000000000 * result;
    if ((unsigned __int128)(result * (__int128)1000000000) >> 64 == (1000000000 * result) >> 63)
    {
      v29 = __OFADD__(v28, v27 / 1000000000);
      v30 = v28 + v27 / 1000000000;
      v32 = v44;
      v31 = v45;
      v33 = v43;
      if (!v29)
      {
        *v43 = v30;
        v48 = *MEMORY[0x24BEE5400];
        v47 = *(void (**)(_QWORD))(v31 + 104);
        v34 = v41;
        v47(v33);
        ObjectType = swift_getObjectType();
        v39[1] = ObjectType;
        sub_244F1B7CC();
        sub_244F1B7D8();
        v40 = *(_QWORD *)(v40 + 8);
        v36 = v23;
        v37 = v42;
        ((void (*)(char *, uint64_t))v40)(v36, v42);
        *v24 = 0;
        ((void (*)(uint64_t *, _QWORD, uint64_t))v47)(v24, v48, v34);
        MEMORY[0x24952A6A8](v32, v33, v24, ObjectType);
        v38 = *(uint64_t (**)(uint64_t *, uint64_t))(v45 + 8);
        v38(v24, v34);
        ((void (*)(char *, uint64_t))v40)(v32, v37);
        sub_244F1BA00();
        swift_unknownObjectRelease();
        return v38(v33, v34);
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  return result;
}

uint64_t sub_244EEBE48()
{
  uint64_t v0;
  uint64_t result;
  int v2;
  uint64_t v3;

  if (*(_QWORD *)(v0 + 32))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_244F1B9F4();
    sub_244F1BA0C();
    if (*(_QWORD *)(v0 + 72))
    {
      MEMORY[0x24952ADD4](*(_QWORD *)(v0 + 72));
      swift_willThrow();
    }
    return swift_unknownObjectRelease();
  }
  else
  {
    result = kpc_set_counting();
    if ((_DWORD)result)
    {
      v2 = MEMORY[0x24952A414]();
      sub_244EEBF90();
      swift_allocError();
      *(_DWORD *)v3 = v2;
      *(_QWORD *)(v3 + 8) = 0xD000000000000010;
      *(_QWORD *)(v3 + 16) = 0x8000000244F1F9E0;
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_244EEBF34()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  MEMORY[0x24952ADC8](*(_QWORD *)(v0 + 72));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for KPCConfiguration()
{
  return objc_opt_self();
}

unint64_t sub_244EEBF90()
{
  unint64_t result;

  result = qword_25742BE38;
  if (!qword_25742BE38)
  {
    result = MEMORY[0x24952AE28](&unk_244F1C684, &type metadata for KPCError);
    atomic_store(result, (unint64_t *)&qword_25742BE38);
  }
  return result;
}

unint64_t sub_244EEBFD4()
{
  unint64_t result;

  result = qword_25742BE40;
  if (!qword_25742BE40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25742BE40);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24952AE1C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_244EEC054()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_244EEC080()
{
  uint64_t v0;

  return sub_244EEB69C(*(_QWORD **)(v0 + 16));
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

uint64_t sub_244EEC0A0()
{
  uint64_t v0;

  return sub_244EEB934(v0);
}

uint64_t sub_244EEC0A8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24952AE28](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_244EEC0E8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24952AE28](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for KPCError()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s7Recount8KPCErrorVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for KPCError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for KPCError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for KPCError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for KPCError(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for KPCError()
{
  return &type metadata for KPCError;
}

char *sub_244EEC28C(int a1)
{
  char *result;

  sub_244F1BAB4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_244F1B8A4();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  result = strerror(a1);
  if (result)
  {
    sub_244F1B8B0();
    sub_244F1B8A4();
    swift_bridgeObjectRelease();
    return (char *)0x20667265706BLL;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_244EEC35C()
{
  int *v0;

  return sub_244EEC28C(*v0);
}

unint64_t sub_244EEC368()
{
  sub_244F1BAB4();
  swift_bridgeObjectRelease();
  sub_244F1BC94();
  sub_244F1B8A4();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  return 0xD000000000000010;
}

unint64_t sub_244EEC420()
{
  return sub_244EEC368();
}

uint64_t sub_244EEC428()
{
  int v0;
  uint64_t v1;
  const char *v2;
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  unint64_t *v8;

  if (kperf_timer_action_set())
  {
    v0 = MEMORY[0x24952A414]();
    sub_244EEC77C();
    swift_allocError();
    *(_DWORD *)v1 = v0;
    v2 = "timer-action-set";
LABEL_3:
    *(_QWORD *)(v1 + 8) = 0xD000000000000010;
    *(_QWORD *)(v1 + 16) = (unint64_t)(v2 - 32) | 0x8000000000000000;
    return swift_willThrow();
  }
  v4 = sub_244F1BD3C();
  if ((v4 & 0x8000000000000000) != 0)
    goto LABEL_16;
  if (!is_mul_ok(v4, 0xF4240uLL))
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_16:
    result = sub_244F1BB44();
    __break(1u);
    return result;
  }
  v6 = 1000000 * v4 + v5 / 0x3B9ACA00;
  if (__CFADD__(1000000 * v4, v5 / 0x3B9ACA00))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (!kperf_ns_to_ticks())
  {
    sub_244EEC9C4();
    swift_allocError();
    *v8 = v6;
    return swift_willThrow();
  }
  result = kperf_timer_period_set();
  if ((_DWORD)result)
  {
    v7 = MEMORY[0x24952A414]();
    sub_244EEC77C();
    swift_allocError();
    *(_DWORD *)v1 = v7;
    v2 = "timer-period-set";
    goto LABEL_3;
  }
  return result;
}

uint64_t sub_244EEC5E4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    if (kperf_kdebug_filter_add_debugid())
    {
LABEL_6:
      v4 = MEMORY[0x24952A414]();
      sub_244EEC77C();
      swift_allocError();
      *(_DWORD *)v5 = v4;
      *(_QWORD *)(v5 + 8) = 0xD000000000000019;
      *(_QWORD *)(v5 + 16) = 0x8000000244F1FAC0;
      swift_willThrow();
    }
    else
    {
      v2 = 0;
      v3 = v1 - 1;
      while (v3 != v2)
      {
        ++v2;
        if (kperf_kdebug_filter_add_debugid())
          goto LABEL_6;
      }
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_244EEC6BC()
{
  int v0;
  uint64_t v1;
  const char *v2;
  uint64_t result;
  int v4;

  if (kperf_kdebug_filter_set())
  {
    v0 = MEMORY[0x24952A414]();
    sub_244EEC77C();
    swift_allocError();
    *(_DWORD *)v1 = v0;
    v2 = "kdebug-filter-set";
  }
  else
  {
    result = kperf_kdebug_action_set();
    if (!(_DWORD)result)
      return result;
    v4 = MEMORY[0x24952A414]();
    sub_244EEC77C();
    swift_allocError();
    *(_DWORD *)v1 = v4;
    v2 = "kdebug-action-set";
  }
  *(_QWORD *)(v1 + 8) = 0xD000000000000011;
  *(_QWORD *)(v1 + 16) = (unint64_t)(v2 - 32) | 0x8000000000000000;
  return swift_willThrow();
}

unint64_t sub_244EEC77C()
{
  unint64_t result;

  result = qword_25742BE80;
  if (!qword_25742BE80)
  {
    result = MEMORY[0x24952AE28](&unk_244F1C7B0, &type metadata for KPerfError);
    atomic_store(result, (unint64_t *)&qword_25742BE80);
  }
  return result;
}

uint64_t sub_244EEC7C0()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  v0 = kperf_kdebug_filter_get();
  if (v0 || (result = kperf_kdebug_filter_create(), (v0 = result) != 0))
  {
    if (kperf_kdebug_action_get())
    {
      v0 = MEMORY[0x24952A414]();
      sub_244EEC77C();
      swift_allocError();
      *(_DWORD *)v2 = v0;
      *(_QWORD *)(v2 + 8) = 0xD000000000000011;
      *(_QWORD *)(v2 + 16) = 0x8000000244F1FAE0;
      swift_willThrow();
    }
    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_244EEC89C()
{
  char v0;
  int v1;
  uint64_t v2;

  if (kperf_kdebug_filter_get_n_filters())
  {
    if (kperf_kdebug_filter_get_filter())
    {
      v1 = MEMORY[0x24952A414]();
      sub_244EEC77C();
      swift_allocError();
      *(_DWORD *)v2 = v1;
      *(_QWORD *)(v2 + 8) = 0x746C69662D746567;
      *(_QWORD *)(v2 + 16) = 0xEA00000000007265;
      swift_willThrow();
    }
    else
    {
      v0 = 1;
    }
  }
  else
  {
    v0 = 0;
  }
  return v0 & 1;
}

unint64_t sub_244EEC9C4()
{
  unint64_t result;

  result = qword_25742BE88;
  if (!qword_25742BE88)
  {
    result = MEMORY[0x24952AE28](&unk_244F1C770, &type metadata for KPerfTimer.Err);
    atomic_store(result, (unint64_t *)&qword_25742BE88);
  }
  return result;
}

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t storeEnumTagSinglePayload for KPerfTimer(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for KPerfTimer()
{
  return &type metadata for KPerfTimer;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for KPerfTimer.Err(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_244EECA78()
{
  return 0;
}

ValueMetadata *type metadata accessor for KPerfTimer.Err()
{
  return &type metadata for KPerfTimer.Err;
}

ValueMetadata *type metadata accessor for KPerfError()
{
  return &type metadata for KPerfError;
}

void sub_244EECAAC(char a1)
{
  sub_244F1BD00();
  __asm { BR              X10 }
}

uint64_t sub_244EECB0C()
{
  sub_244F1B880();
  swift_bridgeObjectRelease();
  return sub_244F1BD18();
}

uint64_t sub_244EECB7C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t inited;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v28 = MEMORY[0x24BEE4AF8];
  sub_244F173B4(0, v1, 0);
  v2 = v28;
  result = sub_244F13CB0(a1);
  v6 = result;
  v7 = 0;
  v8 = a1 + 64;
  v25 = v1;
  v26 = v5;
  v27 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a1 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != v5)
      goto LABEL_24;
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v6);
    v13 = *v12;
    v14 = v12[1];
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C128);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_244F1D140;
    *(_QWORD *)(inited + 32) = v13;
    *(_QWORD *)(inited + 40) = v14;
    *(_QWORD *)(inited + 48) = v15;
    swift_bridgeObjectRetain_n();
    v17 = sub_244F04CF4(inited);
    result = swift_bridgeObjectRelease();
    v19 = *(_QWORD *)(v28 + 16);
    v18 = *(_QWORD *)(v28 + 24);
    if (v19 >= v18 >> 1)
      result = sub_244F173B4(v18 > 1, v19 + 1, 1);
    *(_QWORD *)(v28 + 16) = v19 + 1;
    *(_QWORD *)(v28 + 8 * v19 + 32) = v17;
    v9 = 1 << *(_BYTE *)(a1 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = a1 + 64;
    v20 = *(_QWORD *)(v27 + 8 * v11);
    if ((v20 & (1 << v6)) == 0)
      goto LABEL_26;
    v5 = v26;
    if (*(_DWORD *)(a1 + 36) != v26)
      goto LABEL_27;
    v21 = v20 & (-2 << (v6 & 0x3F));
    if (v21)
    {
      v9 = __clz(__rbit64(v21)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v25;
    }
    else
    {
      v22 = v11 + 1;
      v23 = (unint64_t)(v9 + 63) >> 6;
      v10 = v25;
      if (v11 + 1 < v23)
      {
        v24 = *(_QWORD *)(v27 + 8 * v22);
        if (v24)
        {
LABEL_20:
          v9 = __clz(__rbit64(v24)) + (v22 << 6);
        }
        else
        {
          while (v23 - 2 != v11)
          {
            v24 = *(_QWORD *)(a1 + 80 + 8 * v11++);
            if (v24)
            {
              v22 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    v6 = v9;
    if (v7 == v10)
      return v2;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_244EECDD8(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned int v13;
  BOOL v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  uint64_t v18;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  _QWORD v23[3];

  v4 = HIBYTE(a2) & 0xF;
  v5 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v6 = v4;
  else
    v6 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v6)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    v8 = (unint64_t)sub_244EF1F74(a1, a2, 10);
    v10 = v22;
    goto LABEL_39;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v7 = (unsigned __int8 *)sub_244F1BAF0();
    v8 = (unint64_t)sub_244EF2058(v7, v5, 10);
    v10 = v9 & 1;
    goto LABEL_39;
  }
  v23[0] = a1;
  v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a1 == 43)
  {
    if (!v4)
      goto LABEL_52;
    if (v4 == 1 || (BYTE1(a1) - 48) > 9u)
      goto LABEL_36;
    v8 = (BYTE1(a1) - 48);
    v15 = v4 - 2;
    if (v15)
    {
      v16 = (unsigned __int8 *)v23 + 2;
      while (1)
      {
        v17 = *v16 - 48;
        if (v17 > 9)
          goto LABEL_36;
        if (!is_mul_ok(v8, 0xAuLL))
          goto LABEL_36;
        v14 = __CFADD__(10 * v8, v17);
        v8 = 10 * v8 + v17;
        if (v14)
          goto LABEL_36;
        v10 = 0;
        ++v16;
        if (!--v15)
          goto LABEL_39;
      }
    }
LABEL_38:
    v10 = 0;
    goto LABEL_39;
  }
  if (a1 != 45)
  {
    if (!v4 || (a1 - 48) > 9u)
      goto LABEL_36;
    v8 = (a1 - 48);
    v18 = v4 - 1;
    if (v18)
    {
      v20 = (unsigned __int8 *)v23 + 1;
      while (1)
      {
        v21 = *v20 - 48;
        if (v21 > 9)
          goto LABEL_36;
        if (!is_mul_ok(v8, 0xAuLL))
          goto LABEL_36;
        v14 = __CFADD__(10 * v8, v21);
        v8 = 10 * v8 + v21;
        if (v14)
          goto LABEL_36;
        v10 = 0;
        ++v20;
        if (!--v18)
          goto LABEL_39;
      }
    }
    goto LABEL_38;
  }
  if (v4)
  {
    if (v4 != 1 && (BYTE1(a1) - 48) <= 9u)
    {
      v2 = 0;
      v8 = -(uint64_t)(BYTE1(a1) - 48);
      if (BYTE1(a1) == 48)
      {
        v11 = v4 - 2;
        if (v11)
        {
          v12 = (unsigned __int8 *)v23 + 2;
          while (1)
          {
            v13 = *v12 - 48;
            if (v13 > 9)
              goto LABEL_36;
            if (!is_mul_ok(v8, 0xAuLL))
              goto LABEL_36;
            v14 = 10 * v8 >= v13;
            v8 = 10 * v8 - v13;
            if (!v14)
              goto LABEL_36;
            v10 = 0;
            ++v12;
            if (!--v11)
              goto LABEL_39;
          }
        }
        goto LABEL_38;
      }
      goto LABEL_53;
    }
LABEL_36:
    v8 = 0;
    v10 = 1;
    goto LABEL_39;
  }
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  v10 = 1;
  v8 = v2;
LABEL_39:
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
    return 0;
  else
    return v8;
}

uint64_t sub_244EED034()
{
  return 1;
}

uint64_t sub_244EED03C()
{
  sub_244F1BD00();
  sub_244F1B880();
  return sub_244F1BD18();
}

uint64_t sub_244EED090()
{
  return sub_244F1B880();
}

uint64_t sub_244EED0AC()
{
  sub_244F1BD00();
  sub_244F1B880();
  return sub_244F1BD18();
}

uint64_t sub_244EED0FC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_244F1BB98();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_244EED14C(_QWORD *a1@<X8>)
{
  *a1 = 0x69666E6F4343504BLL;
  a1[1] = 0xE900000000000067;
}

uint64_t sub_244EED16C()
{
  return 0x69666E6F4343504BLL;
}

uint64_t sub_244EED188@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_244F1BB98();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_244EED1DC()
{
  return 0;
}

void sub_244EED1E8(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_244EED1F4()
{
  sub_244EF46A8();
  return sub_244F1BD60();
}

uint64_t sub_244EED21C()
{
  sub_244EF46A8();
  return sub_244F1BD6C();
}

uint64_t sub_244EED244(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[5];
  uint64_t v12;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C190);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EF46A8();
  sub_244F1BD30();
  v8 = *(_OWORD *)(v2 + 48);
  v11[2] = *(_OWORD *)(v2 + 32);
  v11[3] = v8;
  v11[4] = *(_OWORD *)(v2 + 64);
  v12 = *(_QWORD *)(v2 + 80);
  v9 = *(_OWORD *)(v2 + 16);
  v11[0] = *(_OWORD *)v2;
  v11[1] = v9;
  sub_244EF46EC();
  sub_244F1BC64();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_244EED358(_QWORD *a1)
{
  return sub_244EED244(a1);
}

BOOL sub_244EED36C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_244EED380()
{
  sub_244F1BD00();
  sub_244F1BD0C();
  return sub_244F1BD18();
}

uint64_t sub_244EED3C4()
{
  return sub_244F1BD0C();
}

uint64_t sub_244EED3EC()
{
  sub_244F1BD00();
  sub_244F1BD0C();
  return sub_244F1BD18();
}

uint64_t sub_244EED42C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD v11[2];
  char v12;
  char v13;
  char v14;

  v11[0] = a3;
  v11[1] = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C180);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EF4664();
  sub_244F1BD30();
  v14 = 0;
  sub_244F1BC7C();
  if (!v4)
  {
    v13 = 1;
    sub_244F1BC34();
    v12 = 2;
    sub_244F1BC7C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_244EED578(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244EED5B8 + 4 * byte_244F1C7F4[a1]))(0xD00000000000001ALL, 0x8000000244F1F4A0);
}

unint64_t sub_244EED5B8()
{
  return 0xD000000000000010;
}

uint64_t sub_244EED5D4()
{
  uint64_t v0;

  return v0 + 17;
}

uint64_t sub_244EED5FC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244EED63C + 4 * byte_244F1C7F8[a1]))(0xD00000000000001ALL, 0x8000000244F1F4A0);
}

unint64_t sub_244EED63C()
{
  return 0xD000000000000010;
}

uint64_t sub_244EED658()
{
  uint64_t v0;

  return v0 + 17;
}

uint64_t sub_244EED680(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C0A8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EF1444();
  sub_244F1BD30();
  v14 = a2;
  v13 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C0B8);
  sub_244EF32A4(&qword_25742C0C0, &qword_25742C0B8, sub_244EF1488, MEMORY[0x24BEE12A0]);
  sub_244F1BC64();
  if (!v3)
  {
    v14 = a3;
    v13 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C098);
    sub_244EF13E8();
    sub_244F1BC64();
    LOBYTE(v14) = 2;
    sub_244F1BC4C();
    LOBYTE(v14) = 3;
    sub_244F1BC4C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_244EED860(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244EED89C + 4 * byte_244F1C7FC[a1]))(0x6D615372656D6954, 0xEC00000073656C70);
}

unint64_t sub_244EED89C()
{
  return 0xD000000000000011;
}

unint64_t sub_244EED8E0()
{
  return 0xD000000000000010;
}

uint64_t sub_244EED934(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244EED970 + 4 * byte_244F1C803[a1]))(0x6D615372656D6954, 0xEC00000073656C70);
}

unint64_t sub_244EED970()
{
  return 0xD000000000000011;
}

unint64_t sub_244EED9B4()
{
  return 0xD000000000000010;
}

uint64_t sub_244EEDA08()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1701667182;
  if (*v0 != 1)
    v1 = 0x646F69726570;
  if (*v0)
    return v1;
  else
    return 1701080931;
}

uint64_t sub_244EEDA50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244EF44A8(a1, a2);
  *a3 = result;
  return result;
}

void sub_244EEDA74(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_244EEDA80()
{
  sub_244EF4664();
  return sub_244F1BD60();
}

uint64_t sub_244EEDAA8()
{
  sub_244EF4664();
  return sub_244F1BD6C();
}

uint64_t sub_244EEDAD0(_QWORD *a1)
{
  uint64_t *v1;

  return sub_244EED42C(a1, *v1, v1[1], v1[2]);
}

void sub_244EEDAEC(char *a1)
{
  sub_244F04300(*a1);
}

void sub_244EEDAF8()
{
  char *v0;

  sub_244EECAAC(*v0);
}

void sub_244EEDB00(uint64_t a1)
{
  char *v1;

  sub_244F03C30(a1, *v1);
}

void sub_244EEDB08(uint64_t a1)
{
  char *v1;

  sub_244F03EDC(a1, *v1);
}

uint64_t sub_244EEDB10@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244EF45D4();
  *a1 = result;
  return result;
}

uint64_t sub_244EEDB3C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_244EED578(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_244EEDB64()
{
  unsigned __int8 *v0;

  return sub_244EED5FC(*v0);
}

uint64_t sub_244EEDB6C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244EF45D4();
  *a1 = result;
  return result;
}

void sub_244EEDB90(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_244EEDB9C()
{
  sub_244EF1444();
  return sub_244F1BD60();
}

uint64_t sub_244EEDBC4()
{
  sub_244EF1444();
  return sub_244F1BD6C();
}

uint64_t sub_244EEDBEC(_QWORD *a1)
{
  uint64_t *v1;

  return sub_244EED680(a1, *v1, v1[1]);
}

void sub_244EEDC08(char *a1)
{
  sub_244F04448(*a1);
}

void sub_244EEDC14()
{
  char *v0;

  sub_244F03DC8(0, *v0);
}

void sub_244EEDC20(uint64_t a1)
{
  char *v1;

  sub_244F03CD4(a1, *v1);
}

void sub_244EEDC28(uint64_t a1)
{
  char *v1;

  sub_244F03DC8(a1, *v1);
}

uint64_t sub_244EEDC30@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244EF461C();
  *a1 = result;
  return result;
}

uint64_t sub_244EEDC5C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_244EED860(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_244EEDC84()
{
  unsigned __int8 *v0;

  return sub_244EED934(*v0);
}

uint64_t sub_244EEDC8C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244EF461C();
  *a1 = result;
  return result;
}

void sub_244EEDCB0(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_244EEDCBC()
{
  sub_244EF131C();
  return sub_244F1BD60();
}

uint64_t sub_244EEDCE4()
{
  sub_244EF131C();
  return sub_244F1BD6C();
}

unint64_t sub_244EEDD0C()
{
  __int128 *v0;
  uint64_t v2;

  sub_244EEAA00(v0, (uint64_t)&v2);
  sub_244F1BAB4();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  sub_244F1B8A4();
  sub_244F1BC94();
  sub_244F1B8A4();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  sub_244F1B8A4();
  return 0xD000000000000011;
}

unint64_t sub_244EEDE1C()
{
  __int128 *v0;
  _BYTE v2[40];

  sub_244EEAA00(v0, (uint64_t)v2);
  return sub_244EEDD0C();
}

uint64_t sub_244EEDE50(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[32];
  _BYTE v15[8];
  uint64_t v16;
  _OWORD v17[2];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C070);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EF131C();
  sub_244F1BD30();
  LOBYTE(v12) = 4;
  sub_244F1BC70();
  if (!v2)
  {
    LOBYTE(v12) = 3;
    sub_244F1BC70();
    LOBYTE(v12) = 0;
    sub_244F1BC58();
    LOBYTE(v12) = 5;
    sub_244F1BC58();
    LOBYTE(v12) = 1;
    sub_244F1BC40();
    sub_244EF1360(v3, (uint64_t)v15, &qword_25742C080);
    sub_244EF1360((uint64_t)v15, (uint64_t)&v16, &qword_25742C080);
    if (v16)
    {
      *(_QWORD *)&v12 = v16;
      v11 = 2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C098);
      sub_244EF13E8();
      sub_244F1BC64();
    }
    sub_244EF1360(v3 + 56, (uint64_t)v14, &qword_25742C088);
    sub_244EF1360((uint64_t)v14, (uint64_t)v17, &qword_25742C088);
    if (*(_QWORD *)&v17[0])
    {
      v12 = v17[0];
      v13 = v17[1];
      v11 = 6;
      sub_244EF13A4();
      sub_244F1BC64();
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_244EEE0D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __asm { BR              X9 }
}

uint64_t sub_244EEE144()
{
  uint64_t result;
  int v2;

  result = ktrace_file_append_chunk();
  if (!result)
  {
    v2 = MEMORY[0x24952A414]();
    if (strerror(v2))
      sub_244F1B8B0();
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_244EEE364(_QWORD *a1)
{
  return sub_244EEDE50(a1);
}

uint64_t sub_244EEE3AC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int64_t v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14[4];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a3)
  {
    v7 = &unk_2515F0568;
LABEL_5:
    v8 = a1[6];
    v9 = a1[7];
    v4 = a1[8];
    swift_retain();
    sub_244EFE27C(v8, v9, v4, (uint64_t)v7, a2, v14);
    if (!v3)
    {
      v17 = v15;
      v10 = sub_244EFE4F8(v14[1], v14[3], v15);
      v12 = v11;
      v16 = v14[0];
      sub_244EF3370((uint64_t)&v16);
      sub_244EF3370((uint64_t)&v17);
      v4 = sub_244EFA568(v8, v9, v4, v10, v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    return v4;
  }
  if (a3 == 1)
  {
    v7 = &unk_2515F0608;
    goto LABEL_5;
  }
  swift_retain();
  sub_244EF2C60(a3, a2);
  swift_release();
  if (!v3)
    return 2;
  return v4;
}

unint64_t sub_244EEE4F4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;

  if (!(a3 >> 62))
  {
    MEMORY[0x24952ADD4](a3);
    sub_244F1BAB4();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v6 = a1;
    sub_244F1B8A4();
    MEMORY[0x24952ADD4](a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C0E0);
    sub_244F1B850();
    sub_244F1B8A4();
    swift_bridgeObjectRelease();
    MEMORY[0x24952ADC8](a3);
    return v6;
  }
  if (a3 >> 62 == 1)
  {
    sub_244F1BAB4();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v6 = a1;
    sub_244F1B8A4();
    return v6;
  }
  return 0xD000000000000027;
}

unint64_t sub_244EEE644()
{
  uint64_t v0;

  return sub_244EEE4F4(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16));
}

uint64_t *sub_244EEE650@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  char v16;
  unsigned __int8 v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned int v23;
  uint64_t v24;
  unsigned __int8 *v25;
  unsigned int v26;
  unsigned __int8 v27;
  unint64_t v28;
  uint64_t v29;
  unsigned __int8 *v30;
  unsigned int v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  _QWORD v36[2];

  v7 = *result;
  v6 = result[1];
  v8 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    v9 = sub_244F11EF0(v7, v6);
    if ((v10 & 1) != 0)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 32 * v9 + 16);
      result = (uint64_t *)swift_bridgeObjectRelease();
      *a4 = v11;
      return result;
    }
    result = (uint64_t *)swift_bridgeObjectRelease();
  }
  v12 = HIBYTE(v6) & 0xF;
  v13 = v7 & 0xFFFFFFFFFFFFLL;
  if ((v6 & 0x2000000000000000) != 0)
    v14 = HIBYTE(v6) & 0xF;
  else
    v14 = v7 & 0xFFFFFFFFFFFFLL;
  if (!v14)
    goto LABEL_64;
  if ((v6 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v18 = (unint64_t)sub_244EF1F74(v7, v6, 10);
    v33 = v32;
    result = (uint64_t *)swift_bridgeObjectRelease();
    if ((v33 & 1) == 0)
      goto LABEL_43;
    goto LABEL_64;
  }
  if ((v6 & 0x2000000000000000) == 0)
  {
    if ((v7 & 0x1000000000000000) != 0)
      v15 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v15 = (unsigned __int8 *)sub_244F1BAF0();
    result = (uint64_t *)sub_244EF2058(v15, v13, 10);
    if ((v16 & 1) == 0)
    {
      *a4 = result;
      return result;
    }
    goto LABEL_64;
  }
  v36[0] = v7;
  v36[1] = v6 & 0xFFFFFFFFFFFFFFLL;
  if (v7 == 43)
  {
    if (!v12)
      goto LABEL_68;
    if (v12 == 1)
      goto LABEL_66;
    if ((BYTE1(v7) - 48) > 9u)
      goto LABEL_38;
    v18 = (BYTE1(v7) - 48);
    if (v12 != 2)
    {
      if ((BYTE2(v7) - 48) > 9u)
        goto LABEL_38;
      v18 = 10 * (BYTE1(v7) - 48) + (BYTE2(v7) - 48);
      v21 = v12 - 3;
      if (v12 != 3)
      {
        v22 = (unsigned __int8 *)v36 + 3;
        while (1)
        {
          v23 = *v22 - 48;
          if (v23 > 9)
            goto LABEL_38;
          if (!is_mul_ok(v18, 0xAuLL))
            goto LABEL_38;
          v19 = __CFADD__(10 * v18, v23);
          v18 = 10 * v18 + v23;
          if (v19)
            goto LABEL_38;
          LOBYTE(v12) = 0;
          ++v22;
          if (!--v21)
            goto LABEL_42;
        }
      }
    }
LABEL_41:
    LOBYTE(v12) = 0;
    goto LABEL_42;
  }
  if (v7 != 45)
  {
    if (!v12 || (v7 - 48) > 9u)
      goto LABEL_38;
    v18 = (v7 - 48);
    if (v12 != 1)
    {
      if ((BYTE1(v7) - 48) > 9u)
        goto LABEL_38;
      v18 = 10 * (v7 - 48) + (BYTE1(v7) - 48);
      v24 = v12 - 2;
      if (v12 != 2)
      {
        v25 = (unsigned __int8 *)v36 + 2;
        while (1)
        {
          v26 = *v25 - 48;
          if (v26 > 9)
            goto LABEL_38;
          if (!is_mul_ok(v18, 0xAuLL))
            goto LABEL_38;
          v19 = __CFADD__(10 * v18, v26);
          v18 = 10 * v18 + v26;
          if (v19)
            goto LABEL_38;
          LOBYTE(v12) = 0;
          ++v25;
          if (!--v24)
            goto LABEL_42;
        }
      }
    }
    goto LABEL_41;
  }
  if (v12)
  {
    if (v12 != 1)
    {
      v17 = BYTE1(v7) - 48;
      if ((BYTE1(v7) - 48) <= 9u)
      {
        v18 = 0;
        v19 = v17 == 0;
        v20 = -(uint64_t)v17;
        if (!v19)
          goto LABEL_39;
        if (v12 == 2)
        {
          LOBYTE(v12) = 0;
          v18 = v20;
          goto LABEL_42;
        }
        v27 = BYTE2(v7) - 48;
        if ((BYTE2(v7) - 48) <= 9u && is_mul_ok(v20, 0xAuLL))
        {
          v28 = 10 * v20;
          v18 = v28 - v27;
          if (v28 >= v27)
          {
            v29 = v12 - 3;
            if (v12 != 3)
            {
              v30 = (unsigned __int8 *)v36 + 3;
              while (1)
              {
                v31 = *v30 - 48;
                if (v31 > 9)
                  goto LABEL_38;
                if (!is_mul_ok(v18, 0xAuLL))
                  goto LABEL_38;
                v19 = 10 * v18 >= v31;
                v18 = 10 * v18 - v31;
                if (!v19)
                  goto LABEL_38;
                LOBYTE(v12) = 0;
                ++v30;
                if (!--v29)
                  goto LABEL_42;
              }
            }
            goto LABEL_41;
          }
        }
      }
LABEL_38:
      v18 = 0;
LABEL_39:
      LOBYTE(v12) = 1;
      goto LABEL_42;
    }
LABEL_66:
    v18 = 0;
LABEL_42:
    if ((v12 & 1) == 0)
    {
LABEL_43:
      *a4 = v18;
      return result;
    }
LABEL_64:
    sub_244EF2790();
    v34 = swift_allocError();
    *v35 = v7;
    v35[1] = v6;
    v35[2] = 0x4000000000000000;
    swift_bridgeObjectRetain();
    result = (uint64_t *)swift_willThrow();
    *a3 = v34;
    return result;
  }
  __break(1u);
LABEL_68:
  __break(1u);
  return result;
}

uint64_t sub_244EEE9F4(_QWORD **a1, _QWORD **a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = *a2;
  if (!v2)
    return !v3;
  if (v2 == (_QWORD *)1)
    return v3 == (_QWORD *)1;
  if ((unint64_t)v3 < 2)
    return 0;
  return sub_244EF17F8(v2, v3);
}

uint64_t sub_244EEEA34()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if (!*v0)
    return 0x746963696C706D69;
  if (v1 == 1)
    return 0x65636172544150;
  MEMORY[0x24952A5DC](v1, MEMORY[0x24BEE0D00]);
  sub_244F1B8A4();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  return 0x28206D6F74737563;
}

uint64_t sub_244EEEAE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _BYTE v25[8];
  uint64_t v26;

  v3 = v1;
  v5 = sub_244F1B784();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244F1B778();
  v9 = v3 + OBJC_IVAR____TtC7Recount9AwimboPMC_logger;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v3 + OBJC_IVAR____TtC7Recount9AwimboPMC_logger, v8, v5);
  v10 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 72) = v10;
  *(_OWORD *)(v3 + 88) = *(_OWORD *)(a1 + 64);
  *(_QWORD *)(v3 + 104) = *(_QWORD *)(a1 + 80);
  v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v3 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 40) = v11;
  sub_244EF1360(a1, (uint64_t)v25, &qword_25742C080);
  result = sub_244EF1360((uint64_t)v25, (uint64_t)&v26, &qword_25742C080);
  v13 = v26;
  if (v26)
  {
    type metadata accessor for KPCSet();
    swift_allocObject();
    sub_244EEA820((_QWORD *)a1);
    sub_244EF3348((uint64_t)v25);
    v14 = sub_244EEAC08(3, v13, 0, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C138);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_244F1D150;
    *(_QWORD *)(v15 + 32) = v14;
    v24 = v15;
    sub_244F1B964();
    v16 = v24;
    type metadata accessor for KPCConfiguration();
    swift_allocObject();
    swift_retain();
    v17 = sub_244EEB2C0(v16, 0, 0, 1);
    if (v2)
    {
      sub_244EEA910((_QWORD *)a1);
      swift_release();
      v18 = *(_QWORD *)(v3 + 64);
      v19 = *(_QWORD *)(v3 + 72);
      v22 = v5;
      v23 = v9;
      v20 = *(_QWORD *)(v3 + 80);
      swift_bridgeObjectRelease();
      sub_244EEA97C(v18, v19);
      sub_244EEA9D4(v20);
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v23, v22);
      type metadata accessor for AwimboPMC(0);
      swift_deallocPartialClassInstance();
    }
    else
    {
      v21 = v17;
      sub_244EEA910((_QWORD *)a1);
      swift_release();
      *(_QWORD *)(v3 + 16) = v21;
    }
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_244EEED70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  char v7;
  void *v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t i;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unsigned int *v31;
  _DWORD *v32;
  int v33;
  uint64_t v34;
  _QWORD *v35;
  unsigned int v36;
  void *v37;
  int v38;
  const char *v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t aBlock;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void *v47;
  uint64_t (*v48)();
  uint64_t v49;
  int v50;
  uint64_t v51;

  v2 = v1;
  v3 = v0;
  v51 = *MEMORY[0x24BDAC8D0];
  v50 = 0;
  if (kperf_sample_get())
  {
    v4 = MEMORY[0x24952A414]();
    sub_244EEC77C();
    swift_allocError();
    *(_DWORD *)v5 = v4;
    *(_QWORD *)(v5 + 8) = 0x672D656C706D6173;
    *(_QWORD *)(v5 + 16) = 0xEA00000000007465;
    swift_willThrow();
    return;
  }
  v6 = *(unsigned __int8 *)(v0 + 49);
  if (v6 == 1)
  {
    sub_244EEC7C0();
    if (v1)
      return;
    v7 = sub_244EEC89C();
    v2 = 0;
    if ((v7 & 1) == 0)
    {
      aBlock = MEMORY[0x24BEE4AF8];
      sub_244F173E0(0, 4, 0);
      v15 = aBlock;
      v17 = *(_QWORD *)(aBlock + 16);
      v16 = *(_QWORD *)(aBlock + 24);
      v18 = v16 >> 1;
      v19 = v17 + 1;
      if (v16 >> 1 <= v17)
      {
        sub_244F173E0(v16 > 1, v17 + 1, 1);
        v19 = v17 + 1;
        v15 = aBlock;
        v16 = *(_QWORD *)(aBlock + 24);
        v18 = v16 >> 1;
      }
      *(_QWORD *)(v15 + 16) = v19;
      *(_DWORD *)(v15 + 4 * v17 + 32) = 20971520;
      v20 = v17 + 2;
      if (v18 < v20)
      {
        v41 = v19;
        sub_244F173E0(v16 > 1, v20, 1);
        v19 = v41;
        v15 = aBlock;
      }
      *(_QWORD *)(v15 + 16) = v20;
      *(_DWORD *)(v15 + 4 * v19 + 32) = 20971528;
      v22 = *(_QWORD *)(v15 + 16);
      v21 = *(_QWORD *)(v15 + 24);
      v23 = v22 + 1;
      if (v22 >= v21 >> 1)
      {
        sub_244F173E0(v21 > 1, v22 + 1, 1);
        v23 = v22 + 1;
      }
      v24 = aBlock;
      *(_QWORD *)(aBlock + 16) = v23;
      *(_DWORD *)(v24 + 4 * v22 + 32) = 20971708;
      v25 = *(_QWORD *)(v24 + 24);
      v26 = v22 + 2;
      if ((uint64_t)(v22 + 2) > (uint64_t)(v25 >> 1))
      {
        v42 = v23;
        sub_244F173E0(v25 > 1, v22 + 2, 1);
        v26 = v22 + 2;
        v23 = v42;
        v24 = aBlock;
      }
      *(_QWORD *)(v24 + 16) = v26;
      *(_DWORD *)(v24 + 4 * v23 + 32) = 20971556;
      sub_244EEC5E4(v24);
      if (!*(_QWORD *)(v24 + 16))
        __break(1u);
      swift_release();
      v48 = nullsub_1;
      v49 = 0;
      aBlock = MEMORY[0x24BDAC760];
      v45 = 1107296256;
      v46 = sub_244EEF534;
      v47 = &block_descriptor_6;
      v37 = _Block_copy(&aBlock);
      ktrace_events_single();
      _Block_release(v37);
    }
    LODWORD(aBlock) = 0;
    if (kperf_action_samplers_get() && kperf_action_count_set())
      goto LABEL_50;
    if ((aBlock & 0x20) == 0 && kperf_action_samplers_set())
      goto LABEL_57;
    sub_244EEC6BC();
  }
  if ((*(_BYTE *)(v3 + 48) & 1) != 0)
    goto LABEL_9;
  if (kperf_timer_count_get())
  {
    v9 = MEMORY[0x24952A414]();
    sub_244EEC77C();
    swift_allocError();
    *(_DWORD *)v10 = v9;
    v11 = 0x6F632D72656D6974;
    v12 = 0x65672D746E75;
LABEL_13:
    v13 = v12 & 0xFFFFFFFFFFFFLL | 0xEF74000000000000;
LABEL_14:
    *(_QWORD *)(v10 + 8) = v11;
    *(_QWORD *)(v10 + 16) = v13;
LABEL_15:
    swift_willThrow();
    goto LABEL_16;
  }
  if (kperf_timer_count_set())
  {
    v14 = MEMORY[0x24952A414]();
    sub_244EEC77C();
    swift_allocError();
    *(_DWORD *)v10 = v14;
    v11 = 0x6F632D72656D6974;
    v12 = 0x65732D746E75;
    goto LABEL_13;
  }
  v43 = MEMORY[0x24BEE4AF8];
  sub_244F17488(0, 8, 0);
  for (i = 0; i != 8; ++i)
  {
    if (kperf_timer_action_get())
    {
      v33 = MEMORY[0x24952A414]();
      sub_244EEC77C();
      swift_allocError();
      *(_DWORD *)v34 = v33;
      *(_QWORD *)(v34 + 8) = 0xD000000000000010;
      *(_QWORD *)(v34 + 16) = 0x8000000244F1FCE0;
      swift_willThrow();
      swift_release();
      goto LABEL_16;
    }
    v29 = *(_QWORD *)(v43 + 16);
    v28 = *(_QWORD *)(v43 + 24);
    v30 = v29 + 1;
    if (v29 >= v28 >> 1)
    {
      sub_244F17488(v28 > 1, v29 + 1, 1);
      v30 = v29 + 1;
    }
    *(_QWORD *)(v43 + 16) = v30;
    v31 = (unsigned int *)(v43 + 32);
    v32 = (_DWORD *)(v43 + 32 + 8 * v29);
    *v32 = i;
    v32[1] = 0;
  }
  if (*(_DWORD *)(v43 + 36))
  {
    if (!v29)
    {
LABEL_42:
      swift_release();
      sub_244EF2790();
      swift_allocError();
      *v35 = 0;
      v35[1] = 0;
      v35[2] = 0x8000000000000000;
      goto LABEL_15;
    }
    v31 = (unsigned int *)(v43 + 40);
    while (v31[1])
    {
      v31 += 2;
      if (!--v29)
        goto LABEL_42;
    }
  }
  v36 = *v31;
  swift_release();
  aBlock = v36;
  if ((v6 & 1) == 0)
  {
    if (kperf_action_samplers_get() && kperf_action_count_set())
    {
LABEL_50:
      v38 = MEMORY[0x24952A414]();
      sub_244EEC77C();
      swift_allocError();
      *(_DWORD *)v10 = v38;
      v11 = 0xD000000000000010;
      v39 = "action-count-set";
LABEL_58:
      v13 = (unint64_t)(v39 - 32) | 0x8000000000000000;
      goto LABEL_14;
    }
    if (kperf_action_samplers_set())
    {
LABEL_57:
      v40 = MEMORY[0x24952A414]();
      sub_244EEC77C();
      swift_allocError();
      *(_DWORD *)v10 = v40;
      v11 = 0xD000000000000013;
      v39 = "action-samplers-set";
      goto LABEL_58;
    }
  }
  sub_244EEC428();
  if (v2)
  {
LABEL_16:
    if (v50)
      goto LABEL_17;
    return;
  }
LABEL_9:
  v48 = nullsub_1;
  v49 = 0;
  aBlock = MEMORY[0x24BDAC760];
  v45 = 1107296256;
  v46 = sub_244EEF534;
  v47 = &block_descriptor_3_0;
  v8 = _Block_copy(&aBlock);
  ktrace_events_range();
  _Block_release(v8);
  if (v50)
LABEL_17:
    kperf_sample_on();
}

uint64_t sub_244EEF534(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_244EEF570(uint64_t a1)
{
  return sub_244EF0BC8(a1);
}

uint64_t sub_244EEF584()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  swift_release();
  v1 = v0[8];
  v2 = v0[9];
  v3 = v0[10];
  swift_bridgeObjectRelease();
  sub_244EEA97C(v1, v2);
  sub_244EEA9D4(v3);
  v4 = (char *)v0 + OBJC_IVAR____TtC7Recount9AwimboPMC_logger;
  v5 = sub_244F1B784();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocClassInstance();
}

uint64_t sub_244EEF628()
{
  return type metadata accessor for AwimboPMC(0);
}

uint64_t type metadata accessor for AwimboPMC(uint64_t a1)
{
  return sub_244EF0ED0(a1, qword_25742BEB8);
}

uint64_t sub_244EEF644()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244F1B784();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_244EEF6C8()
{
  sub_244EEED70();
}

uint64_t sub_244EEF6E8()
{
  return sub_244EEBA7C(0);
}

uint64_t sub_244EEF710()
{
  return sub_244EEBE48();
}

uint64_t sub_244EEF734(uint64_t a1)
{
  return sub_244EEF570(a1);
}

unint64_t sub_244EEF754(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;

  if (!(a3 >> 62))
  {
    MEMORY[0x24952ADD4](a3);
    sub_244F1BAB4();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v6 = a1;
    sub_244F1B8A4();
    MEMORY[0x24952ADD4](a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C0E0);
    sub_244F1B850();
    sub_244F1B8A4();
    swift_bridgeObjectRelease();
    MEMORY[0x24952ADC8](a3);
    return v6;
  }
  if (a3 >> 62 == 1)
  {
    sub_244F1BAB4();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v6 = a1;
    sub_244F1B8A4();
    return v6;
  }
  return 0xD000000000000020;
}

unint64_t sub_244EEF8A4()
{
  uint64_t v0;

  return sub_244EEF754(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16));
}

void sub_244EEF8B0()
{
  qword_257432C50 = (uint64_t)&unk_2515F0428;
}

uint64_t sub_244EEF8C4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

BOOL sub_244EEF8F0(__int128 *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  _OWORD v8[2];

  v2 = a1[1];
  v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 12) = *(__int128 *)((char *)a1 + 28);
  v3 = a2[1];
  v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 12) = *(__int128 *)((char *)a2 + 28);
  return sub_244EF2A84((uint64_t)&v5, (uint64_t)&v7);
}

void sub_244EEF938(uint64_t a1, uint64_t a2, char a3)
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *(double *)&a2;
  if ((a3 & 1) != 0)
    v3 = *(double *)&a2 / (double)a1;
  v4 = floor(v3);
  v5 = fmod(v3, 1.0);
  if (v4 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v4 >= 9.22337204e18)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if ((*(_QWORD *)&v4 & 0x7FF0000000000000) == 0x7FF0000000000000)
    goto LABEL_12;
  v6 = v5 * 1.0e18;
  if ((*(_QWORD *)&v6 & 0x7FF0000000000000) == 0x7FF0000000000000)
    goto LABEL_12;
  if (v6 <= -9.22337204e18)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v6 < 9.22337204e18)
  {
    sub_244F1BD48();
    return;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_244EEFA00(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  char v26;
  unint64_t v27;
  char v28;
  unint64_t v30;
  uint64_t result;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  double v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  _BOOL4 v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t *v79;
  int64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t *v85;
  int64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  _DWORD *v91;
  int v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int64_t v112;
  uint64_t v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  _OWORD v129[5];
  uint64_t v130;

  v7 = v6;
  v8 = v5;
  v124 = a3;
  v120 = a2;
  v121 = a1;
  v125 = sub_244F1BAE4();
  v116 = *(_QWORD *)(v125 - 8);
  MEMORY[0x24BDAC7A8](v125);
  v12 = (char *)&v111 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_244F1B784();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  *(_QWORD *)(v8 + 112) = 0;
  sub_244F1B778();
  v118 = v14;
  v15 = *(void (**)(void))(v14 + 32);
  v119 = v8 + OBJC_IVAR____TtC7Recount9AwimboPMI_logger;
  v117 = v13;
  v15();
  v122 = a5;
  v123 = a4;
  if (a5 >> 60 == 15)
  {
    if (qword_25742BA20 != -1)
LABEL_121:
      swift_once();
    v16 = qword_257432C50;
    swift_bridgeObjectRetain();
    v114 = 0;
    v115 = 0x3FE0000000000000;
    v17 = v7;
  }
  else
  {
    sub_244F1B5C8();
    swift_allocObject();
    sub_244EEA8A0(a4, a5);
    v18 = sub_244F1B5BC();
    sub_244F1B58C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C108);
    sub_244EF3240();
    sub_244F1B5B0();
    if (v6)
    {
      v127 = v6;
      MEMORY[0x24952ADD4](v6);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C0E0);
      v19 = v125;
      if ((swift_dynamicCast() & 1) == 0)
      {
        v21 = v122;
        v22 = v123;
        sub_244EEA97C(v123, v122);
        swift_release();
        swift_release();
        sub_244EEA97C(v22, v21);
        MEMORY[0x24952ADC8](v127);
        goto LABEL_110;
      }
      MEMORY[0x24952ADC8](v6);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C118);
      sub_244EF32A4(&qword_25742C120, &qword_25742C118, (uint64_t (*)(void))sub_244EF3240, MEMORY[0x24BEE12D0]);
      v20 = v123;
      sub_244F1B5B0();
      v17 = 0;
      v128 = (_QWORD *)v126;
      (*(void (**)(char *, uint64_t))(v116 + 8))(v12, v19);
      MEMORY[0x24952ADC8](v127);
      v23 = v128;
    }
    else
    {
      v23 = (_QWORD *)sub_244EECB7C(v127);
      v17 = 0;
      swift_bridgeObjectRelease();
      v128 = v23;
      v20 = v123;
    }
    v112 = v8;
    v24 = v23[2];
    if (v24)
    {
      v113 = 0;
      swift_bridgeObjectRetain();
      v8 = 0;
      v7 = 32;
      v25 = "FixedCounterPMIs";
      do
      {
        if (*(_QWORD *)(*(_QWORD *)((char *)v23 + v7) + 16))
        {
          swift_bridgeObjectRetain();
          sub_244F11EF0(0xD000000000000021, 0x8000000244F1F4E0);
          if ((v26 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v27 = -v8;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v23 = sub_244F137AC(v23);
            if (v27 >= v23[2])
            {
              __break(1u);
              goto LABEL_124;
            }
            result = sub_244EF27D4(0xD000000000000021, 0x8000000244F1F4E0);
            v115 = result;
            v128 = v23;
            if ((v32 & 1) != 0)
              goto LABEL_130;
            v30 = v122;
            v20 = v123;
            if (v27 < v23[2])
            {
              if (!*(_QWORD *)(*(_QWORD *)((char *)v23 + v7) + 16))
              {
                sub_244EF09BC(-v8);
                swift_bridgeObjectRelease();
              }
              v114 = 1;
              goto LABEL_40;
            }
LABEL_124:
            __break(1u);
LABEL_125:
            v23 = sub_244F137AC(v23);
LABEL_34:
            v20 = v123;
            if (v27 >= v23[2])
            {
              __break(1u);
              goto LABEL_127;
            }
            result = sub_244EF27D4(0xD000000000000016, (unint64_t)v25 | 0x8000000000000000);
            v115 = result;
            v128 = v23;
            if ((v33 & 1) == 0)
            {
              v30 = v122;
              if (v27 < v23[2])
              {
                if (!*(_QWORD *)(v23[v27 + 4] + 16))
                {
                  sub_244EF09BC(v27);
                  swift_bridgeObjectRelease();
                }
                v114 = 0;
LABEL_40:
                v17 = v113;
                goto LABEL_41;
              }
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              result = swift_bridgeObjectRelease();
              __break(1u);
LABEL_130:
              __break(1u);
            }
            __break(1u);
            return result;
          }
          swift_bridgeObjectRelease();
        }
        --v8;
        v7 += 8;
      }
      while (-v24 != v8);
      swift_bridgeObjectRelease();
      v7 = v23[2];
      if (v7)
      {
        swift_bridgeObjectRetain();
        v27 = 0;
        v25 = "tersPeriodSeconds";
        while (1)
        {
          if (*(_QWORD *)(v23[v27 + 4] + 16))
          {
            swift_bridgeObjectRetain();
            sub_244F11EF0(0xD000000000000016, 0x8000000244F1F510);
            if ((v28 & 1) != 0)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                goto LABEL_125;
              goto LABEL_34;
            }
            swift_bridgeObjectRelease();
          }
          if (__OFADD__(v27++, 1))
          {
LABEL_120:
            __break(1u);
            goto LABEL_121;
          }
          if (v27 == v7)
          {
            swift_bridgeObjectRelease();
            break;
          }
        }
      }
      v114 = 0;
      v115 = 0x3FE0000000000000;
      v17 = v113;
      v30 = v122;
      v20 = v123;
    }
    else
    {
      v114 = 0;
      v115 = 0x3FE0000000000000;
      v30 = v122;
    }
LABEL_41:
    v34 = (uint64_t)v128;
    v8 = v128[2];
    if (v8)
    {
      v125 = v18;
      v113 = v17;
      v127 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_244F17398(0, v8, 0);
      v35 = v34;
      v36 = 0;
      v16 = v127;
      v116 = v35;
      v37 = v35 + 32;
      while (1)
      {
        v38 = *(_QWORD *)(v37 + 8 * v36);
        v39 = *(_BYTE *)(v38 + 32);
        v40 = 1 << v39;
        v41 = *(_QWORD *)(v38 + 64);
        if (v41)
        {
          v42 = 0;
        }
        else
        {
          v43 = v39 & 0x3F;
          if (v43 < 7)
            goto LABEL_128;
          v41 = *(_QWORD *)(v38 + 72);
          if (v41)
          {
            v42 = 1;
          }
          else
          {
            if (v43 < 8)
              goto LABEL_128;
            v41 = *(_QWORD *)(v38 + 80);
            if (v41)
            {
              v42 = 2;
            }
            else
            {
              v41 = *(_QWORD *)(v38 + 88);
              if (!v41)
              {
                v44 = 0;
                v45 = (unint64_t)(v40 + 63) >> 6;
                if (v45 <= 4)
                  v45 = 4;
                v46 = v45 - 4;
                while (v46 != v44)
                {
                  v41 = *(_QWORD *)(v38 + 96 + 8 * v44++);
                  if (v41)
                  {
                    v42 = v44 + 3;
                    goto LABEL_59;
                  }
                }
                goto LABEL_128;
              }
              v42 = 3;
            }
          }
        }
LABEL_59:
        v47 = __clz(__rbit64(v41));
        v48 = v47 + (v42 << 6);
        if (v48 == v40)
          goto LABEL_128;
        if (v48 < 0)
        {
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
          goto LABEL_120;
        }
        if (v48 >= v40)
          goto LABEL_114;
        if (((*(_QWORD *)(v38 + 64 + (((unint64_t)v48 >> 3) & 0xFFFFFFFFFFFFF8)) >> v47) & 1) == 0)
          goto LABEL_115;
        if (!*(_QWORD *)(v38 + 16))
          goto LABEL_116;
        v49 = (uint64_t *)(*(_QWORD *)(v38 + 48) + 16 * v48);
        v7 = *v49;
        v50 = v49[1];
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        v51 = sub_244F11EF0(v7, v50);
        if ((v52 & 1) == 0)
          goto LABEL_129;
        v53 = *(double *)(*(_QWORD *)(v38 + 56) + 8 * v51);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((~*(_QWORD *)&v53 & 0x7FF0000000000000) == 0)
          goto LABEL_117;
        if (v53 <= -9.22337204e18)
          goto LABEL_118;
        if (v53 >= 9.22337204e18)
          goto LABEL_119;
        v127 = v16;
        v55 = *(_QWORD *)(v16 + 16);
        v54 = *(_QWORD *)(v16 + 24);
        if (v55 >= v54 >> 1)
        {
          sub_244F17398(v54 > 1, v55 + 1, 1);
          v16 = v127;
        }
        ++v36;
        *(_QWORD *)(v16 + 16) = v55 + 1;
        v56 = (_QWORD *)(v16 + 24 * v55);
        v56[4] = v7;
        v56[5] = v50;
        v56[6] = (uint64_t)v53;
        if (v36 == v8)
        {
          swift_release();
          sub_244EEA97C(v123, v122);
          swift_bridgeObjectRelease_n();
          v8 = v112;
          v17 = v113;
          goto LABEL_73;
        }
      }
    }
    swift_bridgeObjectRetain();
    swift_release();
    sub_244EEA97C(v20, v30);
    swift_bridgeObjectRelease_n();
    v16 = MEMORY[0x24BEE4AF8];
    v8 = v112;
  }
LABEL_73:
  v57 = sub_244EF2B2C(v16, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t))sub_244EF31DC);
  if (v17)
  {
    sub_244EEA97C(v123, v122);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    v58 = v57;
    swift_bridgeObjectRelease();
    v59 = sub_244EFA694(v58, v120, v124, 1);
    v113 = 0;
    swift_bridgeObjectRetain_n();
    v60 = sub_244F1B76C();
    v61 = sub_244F1B9B8();
    v62 = os_log_type_enabled(v60, v61);
    v112 = v8;
    if (v62)
    {
      v63 = (uint8_t *)swift_slowAlloc();
      v64 = swift_slowAlloc();
      v128 = (_QWORD *)v64;
      *(_DWORD *)v63 = 136315138;
      v125 = (uint64_t)(v63 + 4);
      v65 = swift_bridgeObjectRetain();
      v66 = v113;
      v67 = sub_244EF1578(v65);
      v113 = v66;
      swift_bridgeObjectRelease();
      v127 = v67;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742BAC8);
      sub_244EF31F4();
      v68 = sub_244F1B7F0();
      v70 = v69;
      swift_bridgeObjectRelease();
      v127 = sub_244EF18BC(v68, v70, (uint64_t *)&v128);
      v8 = v112;
      sub_244F1BA54();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_244EE6000, v60, v61, "Placing events at %s", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952AE88](v64, -1, -1);
      MEMORY[0x24952AE88](v63, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v71 = *(_QWORD *)(v59 + 16);
    v72 = MEMORY[0x24BEE4AF8];
    if (v71)
    {
      v128 = (_QWORD *)MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_244F1BB14();
      v73 = 0;
      v111 = v59;
      v120 = v59 + 32;
      v116 = v71;
      do
      {
        v74 = *(_QWORD *)(v120 + 8 * v73);
        v75 = *(_QWORD *)(v74 + 16);
        if (v75)
        {
          v124 = v73;
          v127 = v72;
          swift_bridgeObjectRetain();
          sub_244F173FC(0, v75, 0);
          v76 = v127;
          v77 = v74;
          v78 = *(_QWORD *)(v127 + 16);
          v125 = v77;
          v79 = (uint64_t *)(v77 + 48);
          v80 = v75;
          do
          {
            if (*(v79 - 1))
              v81 = *v79;
            else
              v81 = 0;
            v127 = v76;
            v82 = *(_QWORD *)(v76 + 24);
            if (v78 >= v82 >> 1)
            {
              sub_244F173FC(v82 > 1, v78 + 1, 1);
              v76 = v127;
            }
            v79 += 6;
            *(_QWORD *)(v76 + 16) = v78 + 1;
            *(_QWORD *)(v76 + 8 * v78++ + 32) = v81;
            --v80;
          }
          while (v80);
          v127 = MEMORY[0x24BEE4AF8];
          sub_244F173FC(0, v75, 0);
          v83 = v127;
          v84 = *(_QWORD *)(v127 + 16);
          v85 = (uint64_t *)(v125 + 64);
          v86 = v75;
          do
          {
            if (*(v85 - 3))
              v87 = *v85;
            else
              v87 = 0;
            v127 = v83;
            v88 = *(_QWORD *)(v83 + 24);
            if (v84 >= v88 >> 1)
            {
              sub_244F173FC(v88 > 1, v84 + 1, 1);
              v83 = v127;
            }
            v85 += 6;
            *(_QWORD *)(v83 + 16) = v84 + 1;
            *(_QWORD *)(v83 + 8 * v84++ + 32) = v87;
            --v86;
          }
          while (v86);
          v72 = MEMORY[0x24BEE4AF8];
          v127 = MEMORY[0x24BEE4AF8];
          sub_244F173E0(0, v75, 0);
          v89 = v127;
          v90 = *(_QWORD *)(v127 + 16);
          v91 = (_DWORD *)(v125 + 72);
          do
          {
            if (*((_QWORD *)v91 - 4))
              v92 = *v91;
            else
              v92 = 0;
            v127 = v89;
            v93 = *(_QWORD *)(v89 + 24);
            if (v90 >= v93 >> 1)
            {
              sub_244F173E0(v93 > 1, v90 + 1, 1);
              v89 = v127;
            }
            v91 += 12;
            *(_QWORD *)(v89 + 16) = v90 + 1;
            *(_DWORD *)(v89 + 4 * v90++ + 32) = v92;
            --v75;
          }
          while (v75);
          v71 = v116;
          v73 = v124;
        }
        else
        {
          swift_bridgeObjectRetain();
          v89 = v72;
          v83 = v72;
          v76 = v72;
        }
        ++v73;
        type metadata accessor for KPCSet();
        swift_allocObject();
        sub_244EEAC08(2, v76, v83, v89);
        swift_bridgeObjectRelease();
        sub_244F1BAFC();
        sub_244F1BB20();
        sub_244F1BB2C();
        sub_244F1BB08();
      }
      while (v73 != v71);
      v72 = (unint64_t)v128;
      v59 = v111;
      swift_bridgeObjectRelease();
      v8 = v112;
    }
    v94 = *(_QWORD *)(v121 + 24);
    v95 = *(_QWORD *)(v121 + 32);
    sub_244EEA88C(v94, v95);
    sub_244EF2D7C(v59, *(double *)&v115, v114, v94, v95, (uint64_t)v129);
    v96 = v129[3];
    *(_OWORD *)(v8 + 56) = v129[2];
    *(_OWORD *)(v8 + 72) = v96;
    *(_OWORD *)(v8 + 88) = v129[4];
    *(_QWORD *)(v8 + 104) = v130;
    v97 = v129[1];
    *(_OWORD *)(v8 + 24) = v129[0];
    *(_OWORD *)(v8 + 40) = v97;
    v98 = v123;
    if (v72 >> 62)
    {
      swift_bridgeObjectRetain();
      v99 = sub_244F1BB5C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v99 = *(_QWORD *)((v72 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    sub_244EEF938(v99, v115, v114);
    v101 = v100;
    v103 = v102;
    type metadata accessor for KPCConfiguration();
    swift_allocObject();
    v104 = v113;
    v105 = sub_244EEB2C0(v72, v101, v103, 0);
    if (!v104)
    {
      v110 = v105;
      sub_244EEA97C(v98, v122);
      swift_release();
      *(_QWORD *)(v8 + 16) = v110;
      return v8;
    }
    sub_244EEA97C(v98, v122);
    swift_release();
    v106 = *(_QWORD *)(v8 + 64);
    v107 = *(_QWORD *)(v8 + 72);
    v108 = *(_QWORD *)(v8 + 80);
    swift_bridgeObjectRelease();
    sub_244EEA97C(v106, v107);
    sub_244EEA9D4(v108);
  }
LABEL_110:
  v109 = v118;
  MEMORY[0x24952ADC8](*(_QWORD *)(v8 + 112));
  (*(void (**)(int64_t, uint64_t))(v109 + 8))(v119, v117);
  type metadata accessor for AwimboPMI(0);
  swift_deallocPartialClassInstance();
  return v8;
}

uint64_t sub_244EF09BC(unint64_t a1)
{
  _QWORD **v1;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;

  v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_244F137AC(v3);
  v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    v5 = v4 - 1;
    v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      v7 = &v3[a1];
      v8 = v7[4];
      memmove(v7 + 4, v7 + 5, 8 * v6);
      v3[2] = v5;
      *v1 = v3;
      return v8;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244EF0A8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  unint64_t v10;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t *v18;

  v8 = *(_QWORD *)(a4 + 16);
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_6;
  swift_bridgeObjectRetain();
  v10 = sub_244F11EF0(a1, a2);
  if ((v11 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    sub_244EF2790();
    swift_allocError();
    *v18 = a1;
    v18[1] = a2;
    v18[2] = 0x4000000000000000;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  v12 = (uint64_t *)(*(_QWORD *)(v8 + 56) + 32 * v10);
  v14 = *v12;
  v13 = v12[1];
  v15 = v12[2];
  v16 = v12[3];
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  if (a3 < 0)
  {
    result = sub_244F1BB44();
    __break(1u);
  }
  else
  {
    *(_QWORD *)a5 = v14;
    *(_QWORD *)(a5 + 8) = v13;
    *(_QWORD *)(a5 + 16) = v15;
    *(_QWORD *)(a5 + 24) = v16;
    *(_QWORD *)(a5 + 32) = a3;
    *(_DWORD *)(a5 + 40) = 16;
  }
  return result;
}

uint64_t sub_244EF0BC8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = v1[8];
  v3 = v1[9];
  v5 = v1[10];
  if (v3 >> 60 == 15
    || (sub_244EEA8A0(v4, v3),
        sub_244EEE0D4(a1, 20992, 0x696C70207065706BLL, 0xEA00000000007473, v4, v3),
        result = sub_244EEA97C(v4, v3),
        !v2))
  {
    sub_244F1B6D0();
    swift_allocObject();
    sub_244F1B6C4();
    swift_bridgeObjectRetain();
    sub_244EEA88C(v4, v3);
    sub_244EEA8E4(v5);
    sub_244EF14F0();
    v8 = sub_244F1B6B8();
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_release();
      sub_244EEA97C(v4, v3);
      return sub_244EEA9D4(v5);
    }
    else
    {
      v10 = v8;
      v11 = v9;
      sub_244EEE0D4(a1, 20482, 0x6174656D20434D50, 0xEC00000061746164, v8, v9);
      sub_244EEA990(v10, v11);
      swift_bridgeObjectRelease();
      sub_244EEA97C(v4, v3);
      sub_244EEA9D4(v5);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_244EF0E08()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  swift_release();
  v1 = v0[8];
  v2 = v0[9];
  v3 = v0[10];
  swift_bridgeObjectRelease();
  sub_244EEA97C(v1, v2);
  sub_244EEA9D4(v3);
  MEMORY[0x24952ADC8](v0[14]);
  v4 = (char *)v0 + OBJC_IVAR____TtC7Recount9AwimboPMI_logger;
  v5 = sub_244F1B784();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocClassInstance();
}

uint64_t sub_244EF0EB4()
{
  return type metadata accessor for AwimboPMI(0);
}

uint64_t type metadata accessor for AwimboPMI(uint64_t a1)
{
  return sub_244EF0ED0(a1, qword_25742BF98);
}

uint64_t sub_244EF0ED0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_244EF0F04()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244F1B784();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_244EF0FA0(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

uint64_t sub_244EF0FD4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
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

ValueMetadata *type metadata accessor for AwimboConfiguration()
{
  return &type metadata for AwimboConfiguration;
}

uint64_t destroy for AwimboPMIMultiplexing()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AwimboPMIMultiplexing(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AwimboPMIMultiplexing(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
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

_OWORD *assignWithTake for AwimboPMIMultiplexing(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for AwimboPMIMultiplexing(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AwimboPMIMultiplexing(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AwimboPMIMultiplexing()
{
  return &type metadata for AwimboPMIMultiplexing;
}

uint64_t *sub_244EF1200(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_244EF3554(*a2, v4, v5);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

ValueMetadata *type metadata accessor for AwimboPMIError()
{
  return &type metadata for AwimboPMIError;
}

void sub_244EF1270()
{
  void *v0;
  _QWORD v1[5];

  v1[4] = nullsub_1;
  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 1107296256;
  v1[2] = sub_244EEF534;
  v1[3] = &block_descriptor_0;
  v0 = _Block_copy(v1);
  ktrace_events_range();
  _Block_release(v0);
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

unint64_t sub_244EF131C()
{
  unint64_t result;

  result = qword_25742C078;
  if (!qword_25742C078)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CE40, &type metadata for AwimboConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C078);
  }
  return result;
}

uint64_t sub_244EF1360(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_244EF13A4()
{
  unint64_t result;

  result = qword_25742C090;
  if (!qword_25742C090)
  {
    result = MEMORY[0x24952AE28](&unk_244F1C950, &type metadata for AwimboPMIMultiplexing);
    atomic_store(result, (unint64_t *)&qword_25742C090);
  }
  return result;
}

unint64_t sub_244EF13E8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25742C0A0;
  if (!qword_25742C0A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742C098);
    v2 = MEMORY[0x24BEE4570];
    result = MEMORY[0x24952AE28](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25742C0A0);
  }
  return result;
}

unint64_t sub_244EF1444()
{
  unint64_t result;

  result = qword_25742C0B0;
  if (!qword_25742C0B0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CDF0, &type metadata for AwimboPMIMultiplexing.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C0B0);
  }
  return result;
}

uint64_t sub_244EF1488()
{
  return sub_244EF32A4(&qword_25742C0C8, &qword_25742C0D0, (uint64_t (*)(void))sub_244EF14AC, MEMORY[0x24BEE12A0]);
}

unint64_t sub_244EF14AC()
{
  unint64_t result;

  result = qword_25742C0D8;
  if (!qword_25742C0D8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CDC8, &type metadata for AwimboEvent);
    atomic_store(result, (unint64_t *)&qword_25742C0D8);
  }
  return result;
}

unint64_t sub_244EF14F0()
{
  unint64_t result;

  result = qword_25742C0E8;
  if (!qword_25742C0E8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CDA0, &type metadata for AwimboInfo);
    atomic_store(result, (unint64_t *)&qword_25742C0E8);
  }
  return result;
}

unint64_t sub_244EF1534()
{
  unint64_t result;

  result = qword_25742C0F0;
  if (!qword_25742C0F0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CD60, &type metadata for AwimboConfiguration.Err);
    atomic_store(result, (unint64_t *)&qword_25742C0F0);
  }
  return result;
}

uint64_t sub_244EF1578(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v12 = MEMORY[0x24BEE4AF8];
  sub_244F172C0(0, 0, 0);
  v2 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    v3 = 0;
    do
    {
      v4 = *(_QWORD *)(a1 + 32 + 8 * v3);
      swift_bridgeObjectRetain();
      v5 = sub_244EF167C(v3, v4);
      v7 = v6;
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(v12 + 16);
      v8 = *(_QWORD *)(v12 + 24);
      if (v9 >= v8 >> 1)
        sub_244F172C0(v8 > 1, v9 + 1, 1);
      ++v3;
      *(_QWORD *)(v12 + 16) = v9 + 1;
      v10 = v12 + 16 * v9;
      *(_QWORD *)(v10 + 32) = v5;
      *(_QWORD *)(v10 + 40) = v7;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_244EF167C(uint64_t a1, uint64_t a2)
{
  int64_t v3;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v12 = sub_244F1BC94();
  sub_244F1B8A4();
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_244F172C0(0, v3, 0);
    v4 = (unint64_t *)(a2 + 40);
    do
    {
      if (*v4)
      {
        v5 = *(v4 - 1);
        v6 = *v4;
      }
      else
      {
        v6 = 0xE100000000000000;
        v5 = 45;
      }
      v8 = *(_QWORD *)(v11 + 16);
      v7 = *(_QWORD *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1)
        sub_244F172C0(v7 > 1, v8 + 1, 1);
      *(_QWORD *)(v11 + 16) = v8 + 1;
      v9 = v11 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v5;
      *(_QWORD *)(v9 + 40) = v6;
      v4 += 6;
      --v3;
    }
    while (v3);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742BAC8);
  sub_244EF31F4();
  sub_244F1B7F0();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  return v12;
}

uint64_t sub_244EF17F8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_244F1BCA0(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_244F1BCA0() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_244EF18BC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_244EF198C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_244EF3308((uint64_t)v12, *a3);
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
      sub_244EF3308((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_244EF198C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_244F1BA60();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_244EF1B44(a5, a6);
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
  v8 = sub_244F1BAF0();
  if (!v8)
  {
    sub_244F1BB44();
    __break(1u);
LABEL_17:
    result = sub_244F1BB8C();
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

uint64_t sub_244EF1B44(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_244EF1BD8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_244EF1E28(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_244EF1E28(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_244EF1BD8(uint64_t a1, unint64_t a2)
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
      v3 = sub_244EF1D4C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_244F1BAC0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_244F1BB44();
      __break(1u);
LABEL_10:
      v2 = sub_244F1B8BC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_244F1BB8C();
    __break(1u);
LABEL_14:
    result = sub_244F1BB44();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_244EF1D4C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C130);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_244EF1DB0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_244F1B8F8();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x24952A558](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_244EF1E28(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C130);
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
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

unsigned __int8 *sub_244EF1F74(uint64_t a1, uint64_t a2, int64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_244F1B910();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_244EF22D4();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_244F1BAF0();
  }
LABEL_7:
  v11 = sub_244EF2058(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_244EF2058(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  unint64_t v13;
  unsigned __int8 v14;
  BOOL v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unint64_t v28;
  unsigned int v29;
  char v30;
  unint64_t v31;
  unsigned __int8 v32;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              if (!is_mul_ok(v9, a3))
                return 0;
              v13 = v9 * a3;
              v14 = v11 + v12;
              v15 = v13 >= v14;
              v9 = v13 - v14;
              if (!v15)
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      v25 = a3 + 48;
      v26 = a3 + 55;
      v27 = a3 + 87;
      if (a3 > 10)
      {
        v25 = 58;
      }
      else
      {
        v27 = 97;
        v26 = 65;
      }
      if (result)
      {
        v28 = 0;
        do
        {
          v29 = *result;
          if (v29 < 0x30 || v29 >= v25)
          {
            if (v29 < 0x41 || v29 >= v26)
            {
              if (v29 < 0x61 || v29 >= v27)
                return 0;
              v30 = -87;
            }
            else
            {
              v30 = -55;
            }
          }
          else
          {
            v30 = -48;
          }
          if (!is_mul_ok(v28, a3))
            return 0;
          v31 = v28 * a3;
          v32 = v29 + v30;
          v15 = __CFADD__(v31, v32);
          v28 = v31 + v32;
          if (v15)
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v28;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  v16 = a2 - 1;
  if (a2 == 1)
    return 0;
  v17 = a3 + 48;
  v18 = a3 + 55;
  v19 = a3 + 87;
  if (a3 > 10)
  {
    v17 = 58;
  }
  else
  {
    v19 = 97;
    v18 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v20 = result + 1;
  do
  {
    v21 = *v20;
    if (v21 < 0x30 || v21 >= v17)
    {
      if (v21 < 0x41 || v21 >= v18)
      {
        if (v21 < 0x61 || v21 >= v19)
          return 0;
        v22 = -87;
      }
      else
      {
        v22 = -55;
      }
    }
    else
    {
      v22 = -48;
    }
    if (!is_mul_ok(v9, a3))
      return 0;
    v23 = v9 * a3;
    v24 = v21 + v22;
    v15 = __CFADD__(v23, v24);
    v9 = v23 + v24;
    if (v15)
      return 0;
    ++v20;
    --v16;
  }
  while (v16);
  return (unsigned __int8 *)v9;
}

uint64_t sub_244EF22D4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_244F1B91C();
  v4 = sub_244EF2350(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_244EF2350(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_244EF2494(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_244EF1D4C(v9, 0);
      v12 = sub_244EF2580((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x24952A4F8](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x24952A4F8);
LABEL_9:
      sub_244F1BAF0();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24952A4F8]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_244EF2494(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_244EF1DB0(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_244EF1DB0(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_244F1B8E0();
  }
  __break(1u);
  return result;
}

unint64_t sub_244EF2580(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_244EF1DB0(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_244F1B8EC();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_244F1BAF0();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_244EF1DB0(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_244F1B8C8();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_244EF2790()
{
  unint64_t result;

  result = qword_25742C0F8;
  if (!qword_25742C0F8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CD20, &type metadata for AwimboPMCError);
    atomic_store(result, (unint64_t *)&qword_25742C0F8);
  }
  return result;
}

uint64_t sub_244EF27D4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_244F11EF0(a1, a2);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_244F12930();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_244EF28B0(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_244EF28B0(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_244F1BA78();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_244F1BD00();
        swift_bridgeObjectRetain();
        sub_244F1B880();
        v9 = sub_244F1BD18();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

BOOL sub_244EF2A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
  {
    if (v4 != v7 || v5 != v6)
      return 0;
LABEL_16:
    if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32))
      return *(_DWORD *)(a1 + 40) == *(_DWORD *)(a2 + 40);
    return 0;
  }
  v9 = sub_244F1BCA0();
  result = 0;
  if ((v9 & 1) != 0 && v4 == v7 && v5 == v6)
    goto LABEL_16;
  return result;
}

uint64_t sub_244EF2B2C(uint64_t a1, void (*a2)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  __int128 v18;
  _OWORD v19[2];
  uint64_t v20;

  v3 = v2;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v20 = MEMORY[0x24BEE4AF8];
    sub_244F1737C(0, v4, 0);
    v5 = v20;
    v8 = (uint64_t *)(a1 + 48);
    while (1)
    {
      v9 = *(v8 - 2);
      v10 = *(v8 - 1);
      v11 = *v8;
      swift_bridgeObjectRetain();
      a2(&v18, v9, v10, v11);
      if (v3)
        break;
      swift_bridgeObjectRelease();
      v20 = v5;
      v13 = *(_QWORD *)(v5 + 16);
      v12 = *(_QWORD *)(v5 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_244F1737C(v12 > 1, v13 + 1, 1);
        v5 = v20;
      }
      v8 += 3;
      *(_QWORD *)(v5 + 16) = v13 + 1;
      v14 = (_OWORD *)(v5 + 48 * v13);
      v15 = v18;
      v16 = v19[0];
      *(_OWORD *)((char *)v14 + 60) = *(_OWORD *)((char *)v19 + 12);
      v14[2] = v15;
      v14[3] = v16;
      if (!--v4)
        return v5;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_244EF2C60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15[2];
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_244F173FC(0, v4, 0);
    v5 = v17;
    v8 = (uint64_t *)(a1 + 40);
    while (1)
    {
      v9 = *v8;
      v15[0] = *(v8 - 1);
      v15[1] = v9;
      swift_bridgeObjectRetain();
      sub_244EEE650(v15, a2, &v14, &v16);
      if (v3)
        break;
      v3 = 0;
      swift_bridgeObjectRelease();
      v10 = v16;
      v17 = v5;
      v12 = *(_QWORD *)(v5 + 16);
      v11 = *(_QWORD *)(v5 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_244F173FC(v11 > 1, v12 + 1, 1);
        v5 = v17;
      }
      v8 += 2;
      *(_QWORD *)(v5 + 16) = v12 + 1;
      *(_QWORD *)(v5 + 8 * v12 + 32) = v10;
      if (!--v4)
        return v5;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_244EF2D7C@<X0>(uint64_t a1@<X0>, double a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int counter_count;
  int64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t result;
  double v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  int v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  counter_count = kpc_get_counter_count();
  v39 = kpc_get_counter_count();
  v13 = *(_QWORD *)(a1 + 16);
  v14 = a2 / (double)v13;
  if ((a3 & 1) == 0)
    v14 = a2;
  v38 = v14;
  if ((a3 & 1) != 0)
    v15 = a2;
  else
    v15 = a2 * (double)v13;
  v16 = MEMORY[0x24BEE4AF8];
  if (v13)
  {
    v33 = v15;
    v34 = counter_count;
    v35 = a4;
    v36 = a6;
    v37 = a5;
    v44 = MEMORY[0x24BEE4AF8];
    sub_244F172DC(0, v13, 0);
    v17 = 0;
    v18 = v44;
    v41 = a1 + 32;
    v40 = v13;
    do
    {
      v19 = *(_QWORD *)(v41 + 8 * v17);
      v20 = *(_QWORD *)(v19 + 16);
      if (v20)
      {
        v42 = v17;
        v43 = v18;
        swift_bridgeObjectRetain();
        sub_244F17308(0, v20, 0);
        v21 = v16;
        v22 = (uint64_t *)(v19 + 64);
        do
        {
          if (*(v22 - 3))
          {
            v23 = *v22;
            v24 = *(v22 - 2);
            v25 = *(v22 - 3);
            v26 = *(v22 - 4);
          }
          else
          {
            v24 = 0;
            v25 = 0xE800000000000000;
            v26 = 0x544E4556455F4F4ELL;
            v23 = 1000000000;
          }
          v28 = *(_QWORD *)(v21 + 16);
          v27 = *(_QWORD *)(v21 + 24);
          swift_bridgeObjectRetain();
          if (v28 >= v27 >> 1)
            sub_244F17308(v27 > 1, v28 + 1, 1);
          *(_QWORD *)(v21 + 16) = v28 + 1;
          v29 = (_QWORD *)(v21 + 32 * v28);
          v29[4] = v24;
          v29[5] = v26;
          v29[6] = v25;
          v29[7] = v23;
          v22 += 6;
          --v20;
        }
        while (v20);
        swift_bridgeObjectRelease();
        v13 = v40;
        v16 = MEMORY[0x24BEE4AF8];
        v17 = v42;
        v18 = v43;
      }
      else
      {
        v21 = v16;
      }
      v31 = *(_QWORD *)(v18 + 16);
      v30 = *(_QWORD *)(v18 + 24);
      if (v31 >= v30 >> 1)
        sub_244F172DC(v30 > 1, v31 + 1, 1);
      ++v17;
      *(_QWORD *)(v18 + 16) = v31 + 1;
      *(_QWORD *)(v18 + 8 * v31 + 32) = v21;
    }
    while (v17 != v13);
    result = swift_bridgeObjectRelease();
    a6 = v36;
    a5 = v37;
    a4 = v35;
    counter_count = v34;
    v15 = v33;
  }
  else
  {
    result = swift_bridgeObjectRelease();
    v18 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)a6 = 0;
  *(_QWORD *)(a6 + 8) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_BYTE *)(a6 + 24) = 1;
  *(_WORD *)(a6 + 25) = 256;
  *(_DWORD *)(a6 + 28) = counter_count;
  *(_DWORD *)(a6 + 32) = v39;
  *(_QWORD *)(a6 + 40) = a4;
  *(_QWORD *)(a6 + 48) = a5;
  *(_QWORD *)(a6 + 56) = v18;
  *(_QWORD *)(a6 + 64) = v16;
  *(double *)(a6 + 72) = v15;
  *(double *)(a6 + 80) = v38;
  return result;
}

unint64_t sub_244EF3000@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int16 a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  unint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  char v18;
  _QWORD v19[10];
  int counter_count;
  int v21;

  sub_244F02C08((uint64_t)v19);
  if (v5)
    return sub_244EE9040(a1);
  sub_244EEAA3C((uint64_t)v19);
  v12 = sub_244EF77A8((uint64_t)v19);
  sub_244EEE3AC(v19, v12, a1);
  v14 = v13;
  v21 = a4;
  sub_244EEAA84((uint64_t)v19);
  sub_244EE9040(a1);
  v15 = *(_QWORD *)(v12 + 24);
  v16 = *(_QWORD *)(v12 + 32);
  sub_244EEA88C(v15, v16);
  sub_244EEA88C(v15, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  counter_count = kpc_get_counter_count();
  v17 = kpc_get_counter_count();
  swift_release();
  swift_bridgeObjectRetain();
  sub_244EEA88C(v15, v16);
  sub_244EEA8E4(0);
  sub_244EEA97C(v15, v16);
  swift_bridgeObjectRelease_n();
  sub_244EEA97C(v15, v16);
  result = sub_244EEA9D4(0);
  *(_QWORD *)a5 = v14;
  *(_QWORD *)(a5 + 8) = a2;
  *(_QWORD *)(a5 + 16) = a3;
  v18 = BYTE1(v21);
  *(_BYTE *)(a5 + 24) = v21 & 1;
  *(_BYTE *)(a5 + 25) = v18 & 1;
  *(_BYTE *)(a5 + 26) = 0;
  *(_DWORD *)(a5 + 28) = counter_count;
  *(_DWORD *)(a5 + 32) = v17;
  *(_QWORD *)(a5 + 40) = v15;
  *(_QWORD *)(a5 + 48) = v16;
  *(_OWORD *)(a5 + 56) = 0u;
  *(_OWORD *)(a5 + 72) = 0u;
  return result;
}

uint64_t sub_244EF31DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;

  return sub_244EF0A8C(a1, a2, a3, v4, a4);
}

unint64_t sub_244EF31F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25742C100;
  if (!qword_25742C100)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742BAC8);
    result = MEMORY[0x24952AE28](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_25742C100);
  }
  return result;
}

unint64_t sub_244EF3240()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25742C110;
  if (!qword_25742C110)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742C108);
    v2[0] = MEMORY[0x24BEE0D38];
    v2[1] = MEMORY[0x24BEE1400];
    result = MEMORY[0x24952AE28](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25742C110);
  }
  return result;
}

uint64_t sub_244EF32A4(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x24952AE28](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_244EF3308(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_244EF3348(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244EF3370(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t destroy for Event()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EventSampler(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EventSampler(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy44_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 28) = *(_OWORD *)(a2 + 28);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for EventSampler(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for EventSampler(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 44))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EventSampler(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 44) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 44) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EventSampler()
{
  return &type metadata for EventSampler;
}

uint64_t sub_244EF3554(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a3 >> 62 == 1)
    return swift_bridgeObjectRetain();
  if (!(a3 >> 62))
  {
    swift_bridgeObjectRetain();
    JUMPOUT(0x24952ADD4);
  }
  return result;
}

uint64_t destroy for AwimboPMCError(uint64_t a1)
{
  return sub_244EF35B8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t sub_244EF35B8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a3 >> 62 == 1)
    return swift_bridgeObjectRelease();
  if (!(a3 >> 62))
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x24952ADC8);
  }
  return result;
}

uint64_t *_s7Recount14AwimboPMIErrorOwca_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_244EF3554(*a2, v4, v5);
  v6 = *a1;
  v7 = a1[1];
  v8 = a1[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_244EF35B8(v6, v7, v8);
  return a1;
}

uint64_t *_s7Recount14AwimboPMIErrorOwta_0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *a1;
  v6 = a1[1];
  v5 = a1[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_244EF35B8(v4, v6, v5);
  return a1;
}

uint64_t _s7Recount14AwimboPMIErrorOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 126);
  v3 = (((*(_QWORD *)(a1 + 16) >> 57) >> 5) | (4
                                                           * ((*(_QWORD *)(a1 + 16) >> 57) & 0x18 | *(_QWORD *)(a1 + 16) & 7))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t _s7Recount14AwimboPMIErrorOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7D)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_244EF3744(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16) >> 62;
  if (v1 <= 1)
    return v1;
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_244EF3760(uint64_t result)
{
  *(_QWORD *)(result + 16) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_244EF3770(uint64_t result, uint64_t a2)
{
  if (a2 < 2)
  {
    *(_QWORD *)(result + 16) = *(_QWORD *)(result + 16) & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  }
  else
  {
    *(_QWORD *)result = (a2 - 2);
    *(_OWORD *)(result + 8) = xmmword_244F1D160;
  }
  return result;
}

ValueMetadata *type metadata accessor for AwimboPMCError()
{
  return &type metadata for AwimboPMCError;
}

uint64_t destroy for AwimboConfiguration.Err()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AwimboConfiguration.Err(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AwimboConfiguration.Err(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
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

_QWORD *assignWithTake for AwimboConfiguration.Err(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for AwimboConfiguration.Err(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AwimboConfiguration.Err(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AwimboConfiguration.Err()
{
  return &type metadata for AwimboConfiguration.Err;
}

uint64_t _s7Recount19AwimboConfigurationVwxx_0(uint64_t *a1)
{
  unint64_t v2;
  uint64_t result;

  swift_bridgeObjectRelease();
  v2 = a1[6];
  if (v2 >> 60 != 15)
    sub_244EEA990(a1[5], v2);
  result = a1[7];
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s7Recount19AwimboConfigurationVwcp_0(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(_QWORD *)(a1 + 28) = *(_QWORD *)(a2 + 28);
  v4 = (_OWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  if (v5 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 40) = *v4;
  }
  else
  {
    v6 = *(_QWORD *)v4;
    sub_244EEA8A0(v6, v5);
    *(_QWORD *)(a1 + 40) = v6;
    *(_QWORD *)(a1 + 48) = v5;
  }
  v7 = *(_QWORD *)(a2 + 56);
  if (v7)
  {
    v8 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v7;
    *(_QWORD *)(a1 + 64) = v8;
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v9;
  }
  return a1;
}

uint64_t _s7Recount19AwimboConfigurationVwca_0(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _OWORD *v11;
  uint64_t v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_BYTE *)(a1 + 26) = *(_BYTE *)(a2 + 26);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  v5 = (uint64_t *)(a2 + 40);
  v6 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(a1 + 48) >> 60 == 15)
  {
    if (v6 >> 60 != 15)
    {
      v7 = *v5;
      sub_244EEA8A0(*v5, *(_QWORD *)(a2 + 48));
      *(_QWORD *)(a1 + 40) = v7;
      *(_QWORD *)(a1 + 48) = v6;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 >> 60 == 15)
  {
    sub_244EF0FA0(a1 + 40);
LABEL_6:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v5;
    goto LABEL_8;
  }
  v8 = *v5;
  sub_244EEA8A0(*v5, *(_QWORD *)(a2 + 48));
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v6;
  sub_244EEA990(v9, v10);
LABEL_8:
  v11 = (_OWORD *)(a1 + 56);
  v13 = (_OWORD *)(a2 + 56);
  v12 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56))
  {
    if (v12)
    {
      *(_QWORD *)(a1 + 56) = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    }
    else
    {
      sub_244EF0FD4(a1 + 56);
      v14 = *(_OWORD *)(a2 + 72);
      *v11 = *v13;
      *(_OWORD *)(a1 + 72) = v14;
    }
  }
  else if (v12)
  {
    *(_QWORD *)(a1 + 56) = v12;
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v15 = *(_OWORD *)(a2 + 72);
    *v11 = *v13;
    *(_OWORD *)(a1 + 72) = v15;
  }
  return a1;
}

uint64_t _s7Recount19AwimboConfigurationVwta_0(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_BYTE *)(a1 + 26) = *(_BYTE *)(a2 + 26);
  *(_QWORD *)(a1 + 28) = *(_QWORD *)(a2 + 28);
  v4 = (_OWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 >> 60 == 15)
    goto LABEL_4;
  v6 = *(_QWORD *)(a2 + 48);
  if (v6 >> 60 == 15)
  {
    sub_244EF0FA0(a1 + 40);
LABEL_4:
    *(_OWORD *)(a1 + 40) = *v4;
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)v4;
  *(_QWORD *)(a1 + 48) = v6;
  sub_244EEA990(v7, v5);
LABEL_6:
  v8 = *(_QWORD *)(a2 + 56);
  if (!*(_QWORD *)(a1 + 56))
  {
LABEL_10:
    v9 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v9;
    return a1;
  }
  if (!v8)
  {
    sub_244EF0FD4(a1 + 56);
    goto LABEL_10;
  }
  *(_QWORD *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  return a1;
}

uint64_t _s7Recount19AwimboConfigurationVwet_0(uint64_t *a1, unsigned int a2)
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

uint64_t _s7Recount19AwimboConfigurationVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for AwimboInfo()
{
  return &type metadata for AwimboInfo;
}

uint64_t getEnumTagSinglePayload for AwimboPMIMultiplexing.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AwimboPMIMultiplexing.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244EF3EF4 + 4 * byte_244F1C80F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_244EF3F28 + 4 * byte_244F1C80A[v4]))();
}

uint64_t sub_244EF3F28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EF3F30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244EF3F38);
  return result;
}

uint64_t sub_244EF3F44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244EF3F4CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_244EF3F50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EF3F58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AwimboPMIMultiplexing.CodingKeys()
{
  return &type metadata for AwimboPMIMultiplexing.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AwimboConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AwimboConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_244EF4050 + 4 * byte_244F1C819[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_244EF4084 + 4 * byte_244F1C814[v4]))();
}

uint64_t sub_244EF4084(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EF408C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244EF4094);
  return result;
}

uint64_t sub_244EF40A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244EF40A8);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_244EF40AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EF40B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AwimboConfiguration.CodingKeys()
{
  return &type metadata for AwimboConfiguration.CodingKeys;
}

uint64_t initializeWithCopy for AwimboEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AwimboEvent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for AwimboEvent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for AwimboEvent(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AwimboEvent(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AwimboEvent()
{
  return &type metadata for AwimboEvent;
}

unint64_t sub_244EF4240()
{
  unint64_t result;

  result = qword_25742C140;
  if (!qword_25742C140)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CB0C, &type metadata for AwimboConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C140);
  }
  return result;
}

unint64_t sub_244EF4288()
{
  unint64_t result;

  result = qword_25742C148;
  if (!qword_25742C148)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CBFC, &type metadata for AwimboPMIMultiplexing.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C148);
  }
  return result;
}

unint64_t sub_244EF42D4(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_244EF4300();
  result = sub_244EF4344();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_244EF4300()
{
  unint64_t result;

  result = qword_25742C150;
  if (!qword_25742C150)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CCDC, &type metadata for EventSampler);
    atomic_store(result, (unint64_t *)&qword_25742C150);
  }
  return result;
}

unint64_t sub_244EF4344()
{
  unint64_t result;

  result = qword_25742C158;
  if (!qword_25742C158)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CCB4, &type metadata for EventSampler);
    atomic_store(result, (unint64_t *)&qword_25742C158);
  }
  return result;
}

unint64_t sub_244EF438C()
{
  unint64_t result;

  result = qword_25742C160;
  if (!qword_25742C160)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CB34, &type metadata for AwimboPMIMultiplexing.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C160);
  }
  return result;
}

unint64_t sub_244EF43D4()
{
  unint64_t result;

  result = qword_25742C168;
  if (!qword_25742C168)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CB5C, &type metadata for AwimboPMIMultiplexing.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C168);
  }
  return result;
}

unint64_t sub_244EF441C()
{
  unint64_t result;

  result = qword_25742C170;
  if (!qword_25742C170)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CA44, &type metadata for AwimboConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C170);
  }
  return result;
}

unint64_t sub_244EF4464()
{
  unint64_t result;

  result = qword_25742C178;
  if (!qword_25742C178)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CA6C, &type metadata for AwimboConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C178);
  }
  return result;
}

uint64_t sub_244EF44A8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701080931 && a2 == 0xE400000000000000;
  if (v2 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x646F69726570 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_244F1BCA0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_244EF45D4()
{
  unint64_t v0;

  v0 = sub_244F1BB98();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_244EF461C()
{
  unint64_t v0;

  v0 = sub_244F1BB98();
  swift_bridgeObjectRelease();
  if (v0 >= 7)
    return 7;
  else
    return v0;
}

unint64_t sub_244EF4664()
{
  unint64_t result;

  result = qword_25742C188;
  if (!qword_25742C188)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D0E8, &type metadata for AwimboEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C188);
  }
  return result;
}

unint64_t sub_244EF46A8()
{
  unint64_t result;

  result = qword_25742C198;
  if (!qword_25742C198)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D098, &type metadata for AwimboInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C198);
  }
  return result;
}

unint64_t sub_244EF46EC()
{
  unint64_t result;

  result = qword_25742C1A0;
  if (!qword_25742C1A0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1C978, &type metadata for AwimboConfiguration);
    atomic_store(result, (unint64_t *)&qword_25742C1A0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AwimboInfo.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AwimboInfo.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_244EF47C4 + 4 * byte_244F1C81E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_244EF47E4 + 4 * byte_244F1C823[v4]))();
}

_BYTE *sub_244EF47C4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_244EF47E4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244EF47EC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244EF47F4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244EF47FC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244EF4804(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AwimboInfo.CodingKeys()
{
  return &type metadata for AwimboInfo.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for AwimboEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244EF486C + 4 * byte_244F1C82D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_244EF48A0 + 4 * byte_244F1C828[v4]))();
}

uint64_t sub_244EF48A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EF48A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244EF48B0);
  return result;
}

uint64_t sub_244EF48BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244EF48C4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_244EF48C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EF48D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AwimboEvent.CodingKeys()
{
  return &type metadata for AwimboEvent.CodingKeys;
}

uint64_t *initializeBufferWithCopyOfBuffer for AwimboPMCEvents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v3 = swift_bridgeObjectRetain();
  *a1 = v3;
  return a1;
}

unint64_t destroy for AwimboPMCEvents(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t *assignWithCopy for AwimboPMCEvents(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF)
      swift_bridgeObjectRetain();
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

unint64_t *assignWithTake for AwimboPMCEvents(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  if (*a1 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AwimboPMCEvents(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AwimboPMCEvents(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_244EF4AD0(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_244EF4AE8(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AwimboPMCEvents()
{
  return &type metadata for AwimboPMCEvents;
}

unint64_t sub_244EF4B1C()
{
  unint64_t result;

  result = qword_25742C1A8;
  if (!qword_25742C1A8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CF80, &type metadata for AwimboEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C1A8);
  }
  return result;
}

unint64_t sub_244EF4B64()
{
  unint64_t result;

  result = qword_25742C1B0;
  if (!qword_25742C1B0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D070, &type metadata for AwimboInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C1B0);
  }
  return result;
}

unint64_t sub_244EF4BAC()
{
  unint64_t result;

  result = qword_25742C1B8;
  if (!qword_25742C1B8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CFA8, &type metadata for AwimboInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C1B8);
  }
  return result;
}

unint64_t sub_244EF4BF4()
{
  unint64_t result;

  result = qword_25742C1C0;
  if (!qword_25742C1C0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CFD0, &type metadata for AwimboInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C1C0);
  }
  return result;
}

unint64_t sub_244EF4C3C()
{
  unint64_t result;

  result = qword_25742C1C8;
  if (!qword_25742C1C8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CEF0, &type metadata for AwimboEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C1C8);
  }
  return result;
}

unint64_t sub_244EF4C84()
{
  unint64_t result;

  result = qword_25742C1D0;
  if (!qword_25742C1D0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1CF18, &type metadata for AwimboEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C1D0);
  }
  return result;
}

uint64_t sub_244EF4CE0()
{
  return sub_244EEF6E8();
}

uint64_t sub_244EF4CF4()
{
  return sub_244EEF710();
}

uint64_t sub_244EF4D18(uint64_t a1)
{
  return sub_244EEF734(a1);
}

uint64_t destroy for MetricSpec()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for MetricSpec(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for MetricSpec(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

_QWORD *assignWithTake for MetricSpec(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  return a1;
}

uint64_t getEnumTagSinglePayload for MetricSpec(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MetricSpec(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MetricSpec()
{
  return &type metadata for MetricSpec;
}

uint64_t sub_244EF5064(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244EF5090 + 4 * byte_244F1D180[a1]))(1701667182, 0xE400000000000000);
}

uint64_t sub_244EF5090()
{
  return 0x4E79616C70736964;
}

unint64_t sub_244EF50B0()
{
  return 0xD000000000000012;
}

unint64_t sub_244EF50E8()
{
  return 0xD000000000000011;
}

uint64_t sub_244EF5104()
{
  return 0x4379616C70736964;
}

uint64_t sub_244EF5124()
{
  return 0x4F79616C70736964;
}

uint64_t sub_244EF5144(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C1E8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EF5BE0();
  sub_244F1BD30();
  v8[15] = 0;
  sub_244F1BC34();
  if (!v1)
  {
    v8[14] = 1;
    sub_244F1BC34();
    v8[13] = 2;
    sub_244F1BC34();
    v8[12] = 3;
    sub_244F1BC34();
    v8[11] = 4;
    sub_244F1BC28();
    v8[10] = 5;
    sub_244F1BC34();
    v8[9] = 6;
    sub_244F1BC58();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_244EF5320()
{
  unsigned __int8 *v0;

  return sub_244EF5064(*v0);
}

uint64_t sub_244EF5328@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244EF540C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244EF534C()
{
  sub_244EF5BE0();
  return sub_244F1BD60();
}

uint64_t sub_244EF5374()
{
  sub_244EF5BE0();
  return sub_244F1BD6C();
}

__n128 sub_244EF539C@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[6];
  uint64_t v8;

  sub_244EF5710(a1, (uint64_t *)v7);
  if (!v2)
  {
    v5 = v7[5];
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_OWORD *)(a2 + 80) = v5;
    *(_QWORD *)(a2 + 96) = v8;
    v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
    result = (__n128)v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_244EF53F8(_QWORD *a1)
{
  return sub_244EF5144(a1);
}

uint64_t sub_244EF540C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000244F1F610 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000244F1FFB0 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000244F1FFD0 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x4379616C70736964 && a2 == 0xEC000000726F6C6FLL || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x4F79616C70736964 && a2 == 0xEC00000072656472)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_244F1BCA0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t sub_244EF5710@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t result;
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
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C1D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EF5BE0();
  sub_244F1BD24();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v48 = 0;
  v9 = sub_244F1BBD4();
  v11 = v10;
  v41 = v9;
  v47 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_244F1BBD4();
  v14 = v13;
  v39 = v12;
  v40 = v11;
  v46 = 2;
  swift_bridgeObjectRetain();
  v36 = sub_244F1BBD4();
  v38 = v14;
  v45 = 3;
  v16 = v15;
  swift_bridgeObjectRetain();
  v17 = sub_244F1BBD4();
  v37 = v18;
  v33 = v17;
  v44 = 4;
  swift_bridgeObjectRetain();
  v35 = 0;
  v32 = sub_244F1BBBC();
  v43 = 5;
  v20 = v19;
  swift_bridgeObjectRetain();
  v21 = sub_244F1BBD4();
  v34 = v20;
  v30 = v21;
  v31 = v22;
  v42 = 6;
  swift_bridgeObjectRetain();
  v23 = sub_244F1BBE0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v24 = v31;
  swift_bridgeObjectRelease();
  v25 = v34;
  swift_bridgeObjectRelease();
  v26 = v37;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v27 = v38;
  swift_bridgeObjectRelease();
  v28 = v40;
  result = swift_bridgeObjectRelease();
  *a2 = v41;
  a2[1] = v28;
  a2[2] = v39;
  a2[3] = v27;
  a2[4] = v36;
  a2[5] = v16;
  a2[6] = v33;
  a2[7] = v26;
  a2[8] = v32;
  a2[9] = v25;
  a2[10] = v30;
  a2[11] = v24;
  a2[12] = v23;
  return result;
}

unint64_t sub_244EF5BE0()
{
  unint64_t result;

  result = qword_25742C1E0;
  if (!qword_25742C1E0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D2B0, &type metadata for MetricSpec.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C1E0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MetricSpec.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_244EF5C70 + 4 * byte_244F1D18C[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_244EF5CA4 + 4 * byte_244F1D187[v4]))();
}

uint64_t sub_244EF5CA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EF5CAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244EF5CB4);
  return result;
}

uint64_t sub_244EF5CC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244EF5CC8);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_244EF5CCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EF5CD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MetricSpec.CodingKeys()
{
  return &type metadata for MetricSpec.CodingKeys;
}

unint64_t sub_244EF5CF4()
{
  unint64_t result;

  result = qword_25742C1F0;
  if (!qword_25742C1F0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D288, &type metadata for MetricSpec.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C1F0);
  }
  return result;
}

unint64_t sub_244EF5D3C()
{
  unint64_t result;

  result = qword_25742C1F8;
  if (!qword_25742C1F8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D1F8, &type metadata for MetricSpec.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C1F8);
  }
  return result;
}

unint64_t sub_244EF5D84()
{
  unint64_t result;

  result = qword_25742C200;
  if (!qword_25742C200)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D220, &type metadata for MetricSpec.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C200);
  }
  return result;
}

BOOL sub_244EF5DC8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  _BOOL8 result;

  v2 = a1[2];
  v3 = a1[3];
  v5 = a2[2];
  v4 = a2[3];
  if (*a1 == *a2 && a1[1] == a2[1])
  {
    if (v2 != v5)
      return 0;
    return v3 == v4;
  }
  v7 = sub_244F1BCA0();
  result = 0;
  if ((v7 & 1) != 0 && v2 == v5)
    return v3 == v4;
  return result;
}

uint64_t sub_244EF5E4C()
{
  return sub_244F1BD0C();
}

unint64_t sub_244EF5E74()
{
  _OWORD *v0;
  __int128 v2;

  sub_244EF8C78(v0, &v2);
  sub_244F1BAB4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_244F1B8A4();
  swift_bridgeObjectRelease();
  return 0xD000000000000026;
}

unint64_t sub_244EF5F08()
{
  _OWORD *v0;
  _OWORD v2[5];

  sub_244EF8C78(v0, v2);
  return sub_244EF5E74();
}

uint64_t sub_244EF5F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  char isUniquelyReferenced_nonNull_native;
  char v32;
  unint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  int v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  char v46;
  uint64_t result;
  char v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;

  swift_bridgeObjectRetain();
  v6 = sub_244EF74F0(a4, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_244EF7E70);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v6 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C2C8);
    v7 = sub_244F1BB80();
  }
  else
  {
    v7 = MEMORY[0x24BEE4B00];
  }
  v51 = (_QWORD *)v7;
  v8 = swift_bridgeObjectRetain();
  sub_244EF6FA8(v8, 1, (uint64_t *)&v51);
  swift_bridgeObjectRelease();
  v9 = v51;
  v10 = a3 + 64;
  v11 = 1 << *(_BYTE *)(a3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(a3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  swift_bridgeObjectRetain();
  v15 = 0;
  while (1)
  {
    while (v13)
    {
      v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v17 = v16 | (v15 << 6);
      if (v9[2])
      {
LABEL_24:
        v21 = 16 * v17;
        v22 = (uint64_t *)(*(_QWORD *)(a3 + 48) + v21);
        v23 = (uint64_t *)(*(_QWORD *)(a3 + 56) + v21);
        v25 = *v22;
        v24 = v22[1];
        v27 = *v23;
        v26 = v23[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v28 = sub_244F11EF0(v27, v26);
        if ((v29 & 1) != 0)
        {
          v30 = v9[7] + 32 * v28;
          v49 = *(_QWORD *)(v30 + 16);
          v50 = *(_QWORD *)(v30 + 24);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain_n();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v51 = v9;
          v33 = sub_244F11EF0(v25, v24);
          v34 = v9[2];
          v35 = (v32 & 1) == 0;
          v36 = v34 + v35;
          if (__OFADD__(v34, v35))
            goto LABEL_40;
          if (v9[3] >= v36)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              v46 = v32;
              sub_244F1276C();
              v32 = v46;
            }
          }
          else
          {
            v48 = v32;
            sub_244F12E3C(v36, isUniquelyReferenced_nonNull_native);
            v37 = sub_244F11EF0(v25, v24);
            v39 = v38 & 1;
            v32 = v48;
            if ((v48 & 1) != v39)
              goto LABEL_42;
            v33 = v37;
          }
          v9 = v51;
          if ((v32 & 1) != 0)
          {
            v40 = (uint64_t *)(v51[7] + 32 * v33);
            swift_bridgeObjectRelease();
            *v40 = v25;
            v40[1] = v24;
            v40[2] = v49;
            v40[3] = v50;
          }
          else
          {
            v51[(v33 >> 6) + 8] |= 1 << v33;
            v41 = (uint64_t *)(v9[6] + 16 * v33);
            *v41 = v25;
            v41[1] = v24;
            v42 = (uint64_t *)(v9[7] + 32 * v33);
            *v42 = v25;
            v42[1] = v24;
            v42[2] = v49;
            v42[3] = v50;
            v43 = v9[2];
            v44 = __OFADD__(v43, 1);
            v45 = v43 + 1;
            if (v44)
              goto LABEL_41;
            v9[2] = v45;
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
    }
    v18 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v18 >= v14)
      goto LABEL_37;
    v19 = *(_QWORD *)(v10 + 8 * v18);
    ++v15;
    if (!v19)
    {
      v15 = v18 + 1;
      if (v18 + 1 >= v14)
        goto LABEL_37;
      v19 = *(_QWORD *)(v10 + 8 * v15);
      if (!v19)
      {
        v15 = v18 + 2;
        if (v18 + 2 >= v14)
          goto LABEL_37;
        v19 = *(_QWORD *)(v10 + 8 * v15);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v13 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v15 << 6);
    if (v9[2])
      goto LABEL_24;
  }
  v20 = v18 + 3;
  if (v20 >= v14)
  {
LABEL_37:
    swift_release();
    return (uint64_t)v9;
  }
  v19 = *(_QWORD *)(v10 + 8 * v20);
  if (v19)
  {
    v15 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v15 >= v14)
      goto LABEL_37;
    v19 = *(_QWORD *)(v10 + 8 * v15);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  sub_244F1BCC4();
  __break(1u);
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_244EF62F0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_244EEA97C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for EventStore()
{
  return objc_opt_self();
}

uint64_t initializeWithCopy for Event(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Event(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for Event(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for Event(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Event(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Event()
{
  return &type metadata for Event;
}

unint64_t sub_244EF64A0()
{
  uint64_t v0;
  unint64_t v1;
  _QWORD v3[5];
  unint64_t v4;
  unint64_t v5;
  _BYTE v6[40];
  __int128 v7[2];

  sub_244EF8C38(v0, (uint64_t)v7);
  sub_244EEAA00(v7, (uint64_t)v6);
  v3[0] = 0;
  v3[1] = 0xE000000000000000;
  sub_244F1BAB4();
  swift_bridgeObjectRelease();
  v4 = 0xD00000000000001ELL;
  v5 = 0x8000000244F200E0;
  sub_244EF7FCC((uint64_t)v6, (uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C2E0);
  sub_244F1B850();
  sub_244F1B8A4();
  swift_bridgeObjectRelease();
  v1 = v4;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v1;
}

uint64_t sub_244EF6560(char *a1, char *a2)
{
  return sub_244F0462C(*a1, *a2);
}

uint64_t sub_244EF656C()
{
  sub_244F1BD00();
  sub_244F1B880();
  swift_bridgeObjectRelease();
  return sub_244F1BD18();
}

uint64_t sub_244EF65F4()
{
  sub_244F1B880();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244EF6658()
{
  sub_244F1BD00();
  sub_244F1B880();
  swift_bridgeObjectRelease();
  return sub_244F1BD18();
}

uint64_t sub_244EF66DC@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_244F1BB98();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_244EF6738(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x7265626D756ELL;
  if (*v1)
    v2 = 0x737265746E756F63;
  v3 = 0xE600000000000000;
  if (*v1)
    v3 = 0xED00006B73616D5FLL;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_244EF6780()
{
  _BYTE *v0;

  if (*v0)
    return 0x737265746E756F63;
  else
    return 0x7265626D756ELL;
}

uint64_t sub_244EF67C4@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_244F1BB98();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_244EF6824(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_244EF6830()
{
  sub_244EF9478();
  return sub_244F1BD60();
}

uint64_t sub_244EF6858()
{
  sub_244EF9478();
  return sub_244F1BD6C();
}

uint64_t sub_244EF6880@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v5;
  uint64_t v6;
  char v7;

  result = sub_244EF8564(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_BYTE *)(a2 + 8) = v5 & 1;
    *(_QWORD *)(a2 + 16) = v6;
    *(_BYTE *)(a2 + 24) = v7 & 1;
  }
  return result;
}

void sub_244EF68BC(char *a1)
{
  sub_244F046D8(*a1);
}

void sub_244EF68C8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244F1BD00();
  __asm { BR              X9 }
}

uint64_t sub_244EF6920()
{
  sub_244F1B880();
  swift_bridgeObjectRelease();
  return sub_244F1BD18();
}

void sub_244EF6998()
{
  __asm { BR              X10 }
}

uint64_t sub_244EF69E0()
{
  sub_244F1B880();
  return swift_bridgeObjectRelease();
}

void sub_244EF6A44()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244F1BD00();
  __asm { BR              X9 }
}

uint64_t sub_244EF6A98()
{
  sub_244F1B880();
  swift_bridgeObjectRelease();
  return sub_244F1BD18();
}

uint64_t sub_244EF6B10@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244EF86D4();
  *a1 = result;
  return result;
}

uint64_t sub_244EF6B3C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_244EF6B78 + 4 * byte_244F1D30C[*v0]))();
}

void sub_244EF6B78(_QWORD *a1@<X8>)
{
  *a1 = 0x635F6769666E6F63;
  a1[1] = 0xEF737265746E756FLL;
}

void sub_244EF6BA0(_QWORD *a1@<X8>)
{
  *a1 = 0x73657361696C61;
  a1[1] = 0xE700000000000000;
}

void sub_244EF6BBC(_QWORD *a1@<X8>)
{
  *a1 = 0x73746E657665;
  a1[1] = 0xE600000000000000;
}

uint64_t sub_244EF6BD4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244EF6C10 + 4 * byte_244F1D310[*v0]))(0x6F635F6465786966, 0xEE00737265746E75);
}

uint64_t sub_244EF6C10()
{
  return 0x635F6769666E6F63;
}

uint64_t sub_244EF6C34()
{
  return 0x73657361696C61;
}

uint64_t sub_244EF6C4C()
{
  return 0x73746E657665;
}

uint64_t sub_244EF6C60@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244EF86D4();
  *a1 = result;
  return result;
}

uint64_t sub_244EF6C84()
{
  sub_244EF9110();
  return sub_244F1BD60();
}

uint64_t sub_244EF6CAC()
{
  sub_244EF9110();
  return sub_244F1BD6C();
}

uint64_t sub_244EF6CD4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_244EF871C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_244EF6D00()
{
  return 7696483;
}

uint64_t sub_244EF6D10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 7696483 && a2 == 0xE300000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_244F1BCA0();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_244EF6D94()
{
  sub_244EF8DF0();
  return sub_244F1BD60();
}

uint64_t sub_244EF6DBC()
{
  sub_244EF8DF0();
  return sub_244F1BD6C();
}

_QWORD *sub_244EF6DE4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_244EF8950(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_244EF6E10()
{
  sub_244F1BD00();
  sub_244F1BD0C();
  return sub_244F1BD18();
}

uint64_t sub_244EF6E50()
{
  sub_244F1BD00();
  sub_244F1BD0C();
  return sub_244F1BD18();
}

uint64_t sub_244EF6E8C()
{
  return 0x6D6574737973;
}

uint64_t sub_244EF6EA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6D6574737973 && a2 == 0xE600000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_244F1BCA0();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_244EF6F2C()
{
  sub_244EF8BB0();
  return sub_244F1BD60();
}

uint64_t sub_244EF6F54()
{
  sub_244EF8BB0();
  return sub_244F1BD6C();
}

_QWORD *sub_244EF6F7C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_244EF8A80(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_244EF6FA8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t result;
  uint64_t v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *i;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  char v44;
  _QWORD *v45;
  uint64_t *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t *v53;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return swift_bridgeObjectRelease();
  v6 = (_QWORD *)swift_bridgeObjectRetain();
  v8 = v6[4];
  v7 = v6[5];
  v10 = v6[6];
  v9 = v6[7];
  v51 = v6[8];
  v52 = v6;
  v50 = v6[9];
  v53 = a3;
  v11 = *a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = sub_244F11EF0(v8, v7);
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
    goto LABEL_23;
  v17 = v12;
  if (*(_QWORD *)(v11 + 24) >= v16)
  {
    if ((a2 & 1) != 0)
    {
      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_244F1276C();
      if ((v17 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v22 = a3;
    v23 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v13 >> 6) + 64) |= 1 << v13;
    v24 = (uint64_t *)(v23[6] + 16 * v13);
    *v24 = v8;
    v24[1] = v7;
    v25 = (_QWORD *)(v23[7] + 32 * v13);
    *v25 = v10;
    v25[1] = v9;
    v25[2] = v51;
    v25[3] = v50;
    v26 = v23[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v23[2] = v28;
    v29 = v3 - 1;
    if (v3 == 1)
      return swift_bridgeObjectRelease_n();
    for (i = v52 + 15; ; i += 6)
    {
      v32 = *(i - 5);
      v31 = *(i - 4);
      v34 = *(i - 3);
      v33 = *(i - 2);
      v35 = *(i - 1);
      v36 = *i;
      v37 = *v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v38 = sub_244F11EF0(v32, v31);
      v40 = *(_QWORD *)(v37 + 16);
      v41 = (v39 & 1) == 0;
      v27 = __OFADD__(v40, v41);
      v42 = v40 + v41;
      if (v27)
        break;
      v43 = v39;
      if (*(_QWORD *)(v37 + 24) < v42)
      {
        sub_244F12E3C(v42, 1);
        v38 = sub_244F11EF0(v32, v31);
        if ((v43 & 1) != (v44 & 1))
          goto LABEL_25;
      }
      if ((v43 & 1) != 0)
        goto LABEL_10;
      v22 = v53;
      v45 = (_QWORD *)*v53;
      *(_QWORD *)(*v53 + 8 * (v38 >> 6) + 64) |= 1 << v38;
      v46 = (uint64_t *)(v45[6] + 16 * v38);
      *v46 = v32;
      v46[1] = v31;
      v47 = (_QWORD *)(v45[7] + 32 * v38);
      *v47 = v34;
      v47[1] = v33;
      v47[2] = v35;
      v47[3] = v36;
      v48 = v45[2];
      v27 = __OFADD__(v48, 1);
      v49 = v48 + 1;
      if (v27)
        goto LABEL_24;
      v45[2] = v49;
      if (!--v29)
        return swift_bridgeObjectRelease_n();
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_244F12E3C(v16, a2 & 1);
  v18 = sub_244F11EF0(v8, v7);
  if ((v17 & 1) == (v19 & 1))
  {
    v13 = v18;
    if ((v17 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v21 = swift_allocError();
    swift_willThrow();
    MEMORY[0x24952ADD4](v21);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C0E0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return MEMORY[0x24952ADC8](v21);
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_244F1BCC4();
  __break(1u);
LABEL_26:
  sub_244F1BAB4();
  sub_244F1B8A4();
  sub_244F1BB38();
  sub_244F1B8A4();
  result = sub_244F1BB50();
  __break(1u);
  return result;
}

uint64_t sub_244EF7378(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _BYTE v7[40];
  __int128 v8;
  uint64_t v9;

  sub_244F1B6AC();
  swift_allocObject();
  sub_244F1B6A0();
  sub_244EF7F44();
  sub_244F1B694();
  if (v2)
  {
    v9 = v2;
    MEMORY[0x24952ADD4](v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C0E0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C2E0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      MEMORY[0x24952ADC8](v2);
      sub_244EEAA00(&v8, (uint64_t)v7);
      sub_244EF7F88();
      swift_allocError();
      sub_244EF7FCC((uint64_t)v7, v5);
      swift_willThrow();
      swift_release();
      sub_244EEA990(a1, a2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    }
    else
    {
      sub_244EEA990(a1, a2);
      swift_release();
    }
    return MEMORY[0x24952ADC8](v9);
  }
  else
  {
    sub_244EEA990(a1, a2);
    swift_release();
    return v8;
  }
}

uint64_t sub_244EF74F0(uint64_t a1, void (*a2)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  unint64_t v6;
  unint64_t i;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  int64_t v32;
  int64_t v35;
  _QWORD v36[6];
  char v37[8];
  uint64_t v38;
  char v39;

  v31 = a1 + 64;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v32 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v35 = 0;
  v30 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!v4)
    goto LABEL_7;
LABEL_4:
  v6 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  for (i = v6 | (v35 << 6); ; i = __clz(__rbit64(v23)) + (v24 << 6))
  {
    v8 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v9 = *v8;
    v10 = v8[1];
    v11 = *(_QWORD *)(a1 + 56) + 32 * i;
    v12 = *(_QWORD *)v11;
    v13 = *(unsigned __int8 *)(v11 + 8);
    v14 = *(_QWORD *)(v11 + 16);
    v15 = *(_BYTE *)(v11 + 24);
    swift_bridgeObjectRetain();
    v39 = v13;
    a2(v36, v9, v10, v12, v13, v14, v15);
    v16 = v36[0];
    v17 = v36[1];
    v19 = v36[2];
    v18 = v36[3];
    v21 = v36[4];
    v20 = v36[5];
    swift_bridgeObjectRelease();
    result = sub_244EF7EFC((uint64_t)v36, (uint64_t)v37);
    if (v38)
    {
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_244F079D4(0, v30[2] + 1, 1, v30);
        v30 = (_QWORD *)result;
      }
      v27 = v30[2];
      v26 = v30[3];
      v28 = v27 + 1;
      if (v27 >= v26 >> 1)
      {
        result = (uint64_t)sub_244F079D4((_QWORD *)(v26 > 1), v27 + 1, 1, v30);
        v28 = v27 + 1;
        v30 = (_QWORD *)result;
      }
      v30[2] = v28;
      v29 = &v30[6 * v27];
      v29[4] = v16;
      v29[5] = v17;
      v29[6] = v19;
      v29[7] = v18;
      v29[8] = v21;
      v29[9] = v20;
      if (v4)
        goto LABEL_4;
    }
    else if (v4)
    {
      goto LABEL_4;
    }
LABEL_7:
    v22 = v35 + 1;
    if (__OFADD__(v35, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v22 >= v32)
      goto LABEL_29;
    v23 = *(_QWORD *)(v31 + 8 * v22);
    v24 = v35 + 1;
    if (!v23)
    {
      v24 = v35 + 2;
      if (v35 + 2 >= v32)
        goto LABEL_29;
      v23 = *(_QWORD *)(v31 + 8 * v24);
      if (!v23)
      {
        v24 = v35 + 3;
        if (v35 + 3 >= v32)
          goto LABEL_29;
        v23 = *(_QWORD *)(v31 + 8 * v24);
        if (!v23)
        {
          v24 = v35 + 4;
          if (v35 + 4 >= v32)
            goto LABEL_29;
          v23 = *(_QWORD *)(v31 + 8 * v24);
          if (!v23)
            break;
        }
      }
    }
LABEL_22:
    v4 = (v23 - 1) & v23;
    v35 = v24;
  }
  v25 = v35 + 5;
  if (v35 + 5 >= v32)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v30;
  }
  v23 = *(_QWORD *)(v31 + 8 * v25);
  if (v23)
  {
    v24 = v35 + 5;
    goto LABEL_22;
  }
  while (1)
  {
    v24 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v24 >= v32)
      goto LABEL_29;
    v23 = *(_QWORD *)(v31 + 8 * v24);
    ++v25;
    if (v23)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_244EF77A8(uint64_t a1)
{
  uint64_t v1;
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
  void (*v25)(char *, uint64_t, uint64_t);
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  char *v39;
  char *v40;
  id v41;
  char *v42;
  void *v43;
  id v44;
  void *v45;
  unsigned __int8 v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void (*v53)(char *, uint64_t);
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t, uint64_t);
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;

  v1 = a1;
  v83 = *(_QWORD *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v81 = *(_QWORD *)(a1 + 16);
  v82 = v2;
  v80 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v79 = *(_DWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v77 = *(_QWORD *)(a1 + 56);
  v78 = v4;
  v5 = *(_QWORD *)(a1 + 64);
  v75 = *(_QWORD *)(a1 + 72);
  v76 = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742BBA0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244F1B6F4();
  v87 = *(_QWORD *)(v9 - 8);
  v10 = v87;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_244F1B754();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v88 = (char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v90 = (char *)&v75 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v92 = (char *)&v75 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v93 = (char *)&v75 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v91 = (char *)&v75 - v23;
  v24 = *MEMORY[0x24BDCD790];
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v25(v12, v24, v9);
  v89 = v14;
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v26(v8, 1, 1, v13);
  sub_244F1B73C();
  v27 = v9;
  v25(v12, v24, v9);
  v85 = v13;
  v86 = v25;
  v26(v8, 1, 1, v13);
  sub_244F1B73C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C2B0);
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_244F1DAD0;
  v29 = MEMORY[0x24BEE44F0];
  v30 = *(_DWORD *)(v1 + 36);
  *(_DWORD *)(v28 + 32) = *(_DWORD *)(v1 + 32);
  v31 = MEMORY[0x24BEE4558];
  *(_QWORD *)(v28 + 56) = v29;
  *(_QWORD *)(v28 + 64) = v31;
  *(_QWORD *)(v28 + 96) = v29;
  *(_QWORD *)(v28 + 104) = v31;
  *(_DWORD *)(v28 + 72) = v30;
  v32 = *(_DWORD *)(v1 + 40);
  *(_QWORD *)(v28 + 136) = v29;
  *(_QWORD *)(v28 + 144) = v31;
  *(_DWORD *)(v28 + 112) = v32;
  v33 = sub_244F1B820();
  v35 = v34;
  v94 = v33;
  v95 = v34;
  v36 = *MEMORY[0x24BDCD7A0];
  v25(v12, v36, v27);
  sub_244EF7DE8();
  sub_244F1B748();
  v37 = *(void (**)(char *, uint64_t))(v87 + 8);
  v37(v12, v27);
  v94 = v33;
  v95 = v35;
  v86(v12, v36, v27);
  v38 = v90;
  sub_244F1B748();
  v39 = v12;
  v40 = v38;
  v37(v39, v27);
  swift_bridgeObjectRelease();
  v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1580]), sel_init);
  v42 = v92;
  sub_244F1B730();
  v43 = (void *)sub_244F1B7FC();
  swift_bridgeObjectRelease();
  LOBYTE(v35) = objc_msgSend(v41, sel_fileExistsAtPath_, v43);

  if ((v35 & 1) == 0)
  {
    v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1580]), sel_init);
    sub_244F1B730();
    v45 = (void *)sub_244F1B7FC();
    swift_bridgeObjectRelease();
    v46 = objc_msgSend(v44, sel_fileExistsAtPath_, v45);

    v42 = v38;
    if ((v46 & 1) == 0)
    {
      sub_244EF7E2C();
      swift_allocError();
      v64 = v82;
      *(_QWORD *)v65 = v83;
      *(_QWORD *)(v65 + 8) = v64;
      v66 = v80;
      *(_QWORD *)(v65 + 16) = v81;
      *(_QWORD *)(v65 + 24) = v66;
      *(_QWORD *)(v65 + 32) = v3;
      *(_DWORD *)(v65 + 40) = v79;
      v67 = v77;
      *(_QWORD *)(v65 + 48) = v78;
      *(_QWORD *)(v65 + 56) = v67;
      v68 = v75;
      *(_QWORD *)(v65 + 64) = v76;
      *(_QWORD *)(v65 + 72) = v68;
      swift_willThrow();
      v53 = *(void (**)(char *, uint64_t))(v89 + 8);
      v49 = v85;
      v54 = v91;
      v55 = v92;
      v56 = v93;
      v63 = v40;
      goto LABEL_7;
    }
  }
  sub_244EEAA84(v1);
  v48 = v88;
  v47 = v89;
  v49 = v85;
  (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v88, v42, v85);
  v50 = v84;
  v51 = sub_244F1B760();
  if (v50)
  {
    v53 = *(void (**)(char *, uint64_t))(v47 + 8);
    v53(v48, v49);
    v54 = v91;
    v55 = v92;
    v56 = v93;
    v63 = v90;
LABEL_7:
    v53(v63, v49);
    v53(v55, v49);
    v53(v56, v49);
    v53(v54, v49);
    return v1;
  }
  v57 = v51;
  v58 = v52;
  sub_244EEA8A0(v51, v52);
  v59 = sub_244EF7378(v57, v58);
  v60 = v91;
  v61 = v92;
  v62 = v93;
  v87 = v70;
  v73 = sub_244EF5F3C(v59, v71, v70, v72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for EventStore();
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v73;
  *(_QWORD *)(v1 + 24) = v57;
  *(_QWORD *)(v1 + 32) = v58;
  v74 = *(void (**)(char *, uint64_t))(v89 + 8);
  v74(v88, v49);
  v74(v90, v49);
  v74(v61, v49);
  v74(v62, v49);
  v74(v60, v49);
  return v1;
}

unint64_t sub_244EF7DE8()
{
  unint64_t result;

  result = qword_25742C2B8;
  if (!qword_25742C2B8)
  {
    result = MEMORY[0x24952AE28](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25742C2B8);
  }
  return result;
}

unint64_t sub_244EF7E2C()
{
  unint64_t result;

  result = qword_25742C2C0;
  if (!qword_25742C2C0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D4DC, &type metadata for EventStoreError);
    atomic_store(result, (unint64_t *)&qword_25742C2C0);
  }
  return result;
}

uint64_t sub_244EF7E70@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t *a7@<X8>)
{
  uint64_t v7;
  uint64_t v11;

  if ((a4 & 1) != 0)
  {
    v11 = 0;
    a2 = 0;
    a3 = 0;
    a5 = 0;
  }
  else
  {
    v11 = result;
    if ((a6 & 1) != 0)
      a5 = *(_QWORD *)(v7 + 24);
    result = swift_bridgeObjectRetain_n();
  }
  *a7 = v11;
  a7[1] = a2;
  a7[2] = v11;
  a7[3] = a2;
  a7[4] = a3;
  a7[5] = a5;
  return result;
}

uint64_t sub_244EF7EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C2D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_244EF7F44()
{
  unint64_t result;

  result = qword_25742C2D8;
  if (!qword_25742C2D8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D4B4, &type metadata for KPEPPropertyList);
    atomic_store(result, (unint64_t *)&qword_25742C2D8);
  }
  return result;
}

unint64_t sub_244EF7F88()
{
  unint64_t result;

  result = qword_25742C2E8;
  if (!qword_25742C2E8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D474, &type metadata for KPEPError);
    atomic_store(result, (unint64_t *)&qword_25742C2E8);
  }
  return result;
}

uint64_t sub_244EF7FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t initializeWithCopy for KPEPError(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for KPEPError(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
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

uint64_t assignWithTake for KPEPError(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for KPEPError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for KPEPError(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for KPEPError()
{
  return &type metadata for KPEPError;
}

ValueMetadata *type metadata accessor for KPEPPropertyList()
{
  return &type metadata for KPEPPropertyList;
}

uint64_t destroy for Silicon()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Silicon(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Silicon(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for Silicon(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Silicon(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Silicon(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EventStoreError()
{
  return &type metadata for EventStoreError;
}

uint64_t sub_244EF8564(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  char v8;
  char v9;
  char v11;
  char v12;
  _BYTE v13[32];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C3A8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_244EF9478();
  sub_244F1BD24();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v13[31] = 0;
    v7 = sub_244F1BBC8();
    v9 = v8;
    v13[30] = 1;
    sub_244F1BBC8();
    v12 = v11;
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    v13[24] = v9 & 1;
    v13[8] = v12 & 1;
  }
  return v7;
}

uint64_t sub_244EF86D4()
{
  unint64_t v0;

  v0 = sub_244F1BB98();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_244EF871C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C358);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_244EF9110();
  sub_244F1BD24();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    LOBYTE(v11) = 0;
    v7 = sub_244F1BC04();
    LOBYTE(v11) = 1;
    sub_244F1BC04();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C368);
    v10 = 2;
    sub_244EF9154();
    sub_244F1BBEC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C378);
    v10 = 3;
    sub_244EF91B0();
    swift_bridgeObjectRetain();
    sub_244F1BBEC();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

_QWORD *sub_244EF8950(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD *v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C328);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EF8DF0();
  sub_244F1BD24();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_244EF8E34();
    sub_244F1BBEC();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = v9;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

_QWORD *sub_244EF8A80(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD *v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C2F0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EF8BB0();
  sub_244F1BD24();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_244EF8BF4();
    sub_244F1BBEC();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = v9;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_244EF8BB0()
{
  unint64_t result;

  result = qword_25742C2F8;
  if (!qword_25742C2F8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D688, &type metadata for KPEPPropertyList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C2F8);
  }
  return result;
}

unint64_t sub_244EF8BF4()
{
  unint64_t result;

  result = qword_25742C300;
  if (!qword_25742C300)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D660, &type metadata for KPEPPropertyList.SystemList);
    atomic_store(result, (unint64_t *)&qword_25742C300);
  }
  return result;
}

uint64_t sub_244EF8C38(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_244EF8C78(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;

  *a2 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[4];
  a2[3] = a1[3];
  a2[4] = v4;
  a2[1] = v2;
  a2[2] = v3;
  return a2;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.CodingKeys()
{
  return &type metadata for KPEPPropertyList.CodingKeys;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.SystemList()
{
  return &type metadata for KPEPPropertyList.SystemList;
}

ValueMetadata *type metadata accessor for EventSource()
{
  return &type metadata for EventSource;
}

unint64_t sub_244EF8CD4()
{
  unint64_t result;

  result = qword_25742C308;
  if (!qword_25742C308)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D580, &type metadata for EventSource);
    atomic_store(result, (unint64_t *)&qword_25742C308);
  }
  return result;
}

unint64_t sub_244EF8D1C()
{
  unint64_t result;

  result = qword_25742C310;
  if (!qword_25742C310)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D638, &type metadata for KPEPPropertyList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C310);
  }
  return result;
}

unint64_t sub_244EF8D64()
{
  unint64_t result;

  result = qword_25742C318;
  if (!qword_25742C318)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D5A8, &type metadata for KPEPPropertyList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C318);
  }
  return result;
}

unint64_t sub_244EF8DAC()
{
  unint64_t result;

  result = qword_25742C320;
  if (!qword_25742C320)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D5D0, &type metadata for KPEPPropertyList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C320);
  }
  return result;
}

unint64_t sub_244EF8DF0()
{
  unint64_t result;

  result = qword_25742C330;
  if (!qword_25742C330)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D7C0, &type metadata for KPEPPropertyList.SystemList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C330);
  }
  return result;
}

unint64_t sub_244EF8E34()
{
  unint64_t result;

  result = qword_25742C338;
  if (!qword_25742C338)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D798, &type metadata for KPEPPropertyList.System);
    atomic_store(result, (unint64_t *)&qword_25742C338);
  }
  return result;
}

uint64_t _s7Recount11EventSourceOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_244EF8EB8 + 4 * byte_244F1D314[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_244EF8ED8 + 4 * byte_244F1D319[v4]))();
}

_BYTE *sub_244EF8EB8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_244EF8ED8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244EF8EE0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244EF8EE8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244EF8EF0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244EF8EF8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.SystemList.CodingKeys()
{
  return &type metadata for KPEPPropertyList.SystemList.CodingKeys;
}

uint64_t _s7Recount16KPEPPropertyListV6SystemVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s7Recount16KPEPPropertyListV6SystemVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s7Recount16KPEPPropertyListV6SystemVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *_s7Recount16KPEPPropertyListV6SystemVwta_0(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.System()
{
  return &type metadata for KPEPPropertyList.System;
}

unint64_t sub_244EF903C()
{
  unint64_t result;

  result = qword_25742C340;
  if (!qword_25742C340)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D770, &type metadata for KPEPPropertyList.SystemList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C340);
  }
  return result;
}

unint64_t sub_244EF9084()
{
  unint64_t result;

  result = qword_25742C348;
  if (!qword_25742C348)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D6E0, &type metadata for KPEPPropertyList.SystemList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C348);
  }
  return result;
}

unint64_t sub_244EF90CC()
{
  unint64_t result;

  result = qword_25742C350;
  if (!qword_25742C350)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D708, &type metadata for KPEPPropertyList.SystemList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C350);
  }
  return result;
}

unint64_t sub_244EF9110()
{
  unint64_t result;

  result = qword_25742C360;
  if (!qword_25742C360)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D934, &type metadata for KPEPPropertyList.System.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C360);
  }
  return result;
}

unint64_t sub_244EF9154()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25742C370;
  if (!qword_25742C370)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742C368);
    v2[0] = MEMORY[0x24BEE0D38];
    v2[1] = MEMORY[0x24BEE0D38];
    result = MEMORY[0x24952AE28](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25742C370);
  }
  return result;
}

unint64_t sub_244EF91B0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_25742C380;
  if (!qword_25742C380)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742C378);
    v2 = sub_244EF921C();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x24952AE28](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25742C380);
  }
  return result;
}

unint64_t sub_244EF921C()
{
  unint64_t result;

  result = qword_25742C388;
  if (!qword_25742C388)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D90C, &type metadata for KPEPPropertyList.KPEPEvent);
    atomic_store(result, (unint64_t *)&qword_25742C388);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for KPEPPropertyList.System.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244EF92AC + 4 * byte_244F1D323[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_244EF92E0 + 4 * byte_244F1D31E[v4]))();
}

uint64_t sub_244EF92E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EF92E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244EF92F0);
  return result;
}

uint64_t sub_244EF92FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244EF9304);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_244EF9308(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EF9310(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.System.CodingKeys()
{
  return &type metadata for KPEPPropertyList.System.CodingKeys;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for KPEPPropertyList.KPEPEvent(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for KPEPPropertyList.KPEPEvent(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 25) = v3;
  return result;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.KPEPEvent()
{
  return &type metadata for KPEPPropertyList.KPEPEvent;
}

unint64_t sub_244EF93A4()
{
  unint64_t result;

  result = qword_25742C390;
  if (!qword_25742C390)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D8E4, &type metadata for KPEPPropertyList.System.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C390);
  }
  return result;
}

unint64_t sub_244EF93EC()
{
  unint64_t result;

  result = qword_25742C398;
  if (!qword_25742C398)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D81C, &type metadata for KPEPPropertyList.System.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C398);
  }
  return result;
}

unint64_t sub_244EF9434()
{
  unint64_t result;

  result = qword_25742C3A0;
  if (!qword_25742C3A0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D844, &type metadata for KPEPPropertyList.System.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C3A0);
  }
  return result;
}

unint64_t sub_244EF9478()
{
  unint64_t result;

  result = qword_25742C3B0;
  if (!qword_25742C3B0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DA74, &type metadata for KPEPPropertyList.KPEPEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C3B0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for KPEPPropertyList.KPEPEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for KPEPPropertyList.KPEPEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244EF9598 + 4 * byte_244F1D32D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_244EF95CC + 4 * byte_244F1D328[v4]))();
}

uint64_t sub_244EF95CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EF95D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244EF95DCLL);
  return result;
}

uint64_t sub_244EF95E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244EF95F0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_244EF95F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EF95FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_244EF9608(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for KPEPPropertyList.KPEPEvent.CodingKeys()
{
  return &type metadata for KPEPPropertyList.KPEPEvent.CodingKeys;
}

unint64_t sub_244EF9628()
{
  unint64_t result;

  result = qword_25742C3B8;
  if (!qword_25742C3B8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DA4C, &type metadata for KPEPPropertyList.KPEPEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C3B8);
  }
  return result;
}

unint64_t sub_244EF9670()
{
  unint64_t result;

  result = qword_25742C3C0;
  if (!qword_25742C3C0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D984, &type metadata for KPEPPropertyList.KPEPEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C3C0);
  }
  return result;
}

unint64_t sub_244EF96B8()
{
  unint64_t result;

  result = qword_25742C3C8;
  if (!qword_25742C3C8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D9AC, &type metadata for KPEPPropertyList.KPEPEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C3C8);
  }
  return result;
}

uint64_t destroy for ModeSpec()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ModeSpec(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ModeSpec(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ModeSpec(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ModeSpec()
{
  return &type metadata for ModeSpec;
}

uint64_t sub_244EF993C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244EF9968 + 4 * byte_244F1DAE0[a1]))(1701667182, 0xE400000000000000);
}

uint64_t sub_244EF9968()
{
  return 0x4E79616C70736964;
}

unint64_t sub_244EF9988()
{
  return 0xD000000000000012;
}

unint64_t sub_244EF99A4()
{
  return 0xD000000000000014;
}

uint64_t sub_244EF99C4()
{
  return 0x7363697274656DLL;
}

uint64_t sub_244EF99DC()
{
  return 1937007987;
}

uint64_t sub_244EF99E8()
{
  unsigned __int8 *v0;

  return sub_244EF993C(*v0);
}

uint64_t sub_244EF99F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244EF9AB8(a1, a2);
  *a3 = result;
  return result;
}

void sub_244EF9A14(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_244EF9A20()
{
  sub_244EFA1F8();
  return sub_244F1BD60();
}

uint64_t sub_244EF9A48()
{
  sub_244EFA1F8();
  return sub_244F1BD6C();
}

__n128 sub_244EF9A70@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[5];

  sub_244EF9D24(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_244EF9AB8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000244F1F610 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000244F1FFB0 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7363697274656DLL && a2 == 0xE700000000000000 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 1937007987 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_244F1BCA0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_244EF9D24@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C3D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EFA1F8();
  sub_244F1BD24();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v35) = 0;
  v9 = sub_244F1BBD4();
  v11 = v10;
  LOBYTE(v35) = 1;
  swift_bridgeObjectRetain();
  v31 = sub_244F1BBD4();
  v32 = v9;
  LOBYTE(v35) = 2;
  v13 = v12;
  swift_bridgeObjectRetain();
  v14 = sub_244F1BBD4();
  v33 = v15;
  v27 = v14;
  v29 = v13;
  LOBYTE(v35) = 3;
  swift_bridgeObjectRetain();
  v28 = 0;
  v26 = sub_244F1BBD4();
  v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C3E0);
  v34 = 4;
  sub_244EFA280(&qword_25742C3E8, &qword_25742C3E0, (uint64_t (*)(void))sub_244EFA23C);
  v30 = v17;
  swift_bridgeObjectRetain();
  sub_244F1BBEC();
  v18 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C3F8);
  v34 = 5;
  sub_244EFA280(&qword_25742C400, &qword_25742C3F8, (uint64_t (*)(void))sub_244EFA2E4);
  v25 = v18;
  swift_bridgeObjectRetain();
  sub_244F1BBEC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v19 = v35;
  swift_bridgeObjectRetain();
  v20 = v29;
  swift_bridgeObjectRetain();
  v21 = v33;
  swift_bridgeObjectRetain();
  v22 = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  v23 = v25;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a2 = v32;
  a2[1] = v11;
  a2[2] = v31;
  a2[3] = v20;
  a2[4] = v27;
  a2[5] = v21;
  a2[6] = v26;
  a2[7] = v22;
  a2[8] = v23;
  a2[9] = v19;
  return result;
}

unint64_t sub_244EFA1F8()
{
  unint64_t result;

  result = qword_25742C3D8;
  if (!qword_25742C3D8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DBE8, &type metadata for ModeSpec.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C3D8);
  }
  return result;
}

unint64_t sub_244EFA23C()
{
  unint64_t result;

  result = qword_25742C3F0;
  if (!qword_25742C3F0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D1C4, &type metadata for MetricSpec);
    atomic_store(result, (unint64_t *)&qword_25742C3F0);
  }
  return result;
}

uint64_t sub_244EFA280(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    result = MEMORY[0x24952AE28](MEMORY[0x24BEE12D0], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_244EFA2E4()
{
  unint64_t result;

  result = qword_25742C408;
  if (!qword_25742C408)
  {
    result = MEMORY[0x24952AE28](&unk_244F1EF2C, &type metadata for SetSpec);
    atomic_store(result, (unint64_t *)&qword_25742C408);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ModeSpec.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ModeSpec.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_244EFA404 + 4 * byte_244F1DAEB[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_244EFA438 + 4 * byte_244F1DAE6[v4]))();
}

uint64_t sub_244EFA438(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EFA440(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244EFA448);
  return result;
}

uint64_t sub_244EFA454(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244EFA45CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_244EFA460(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EFA468(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ModeSpec.CodingKeys()
{
  return &type metadata for ModeSpec.CodingKeys;
}

unint64_t sub_244EFA488()
{
  unint64_t result;

  result = qword_25742C410;
  if (!qword_25742C410)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DBC0, &type metadata for ModeSpec.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C410);
  }
  return result;
}

unint64_t sub_244EFA4D0()
{
  unint64_t result;

  result = qword_25742C418;
  if (!qword_25742C418)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DB30, &type metadata for ModeSpec.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C418);
  }
  return result;
}

unint64_t sub_244EFA518()
{
  unint64_t result;

  result = qword_25742C420;
  if (!qword_25742C420)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DB58, &type metadata for ModeSpec.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C420);
  }
  return result;
}

uint64_t Settings.kpc.getter()
{
  uint64_t *v0;

  return sub_244EFE4F8(v0[1], v0[3], v0[4]);
}

uint64_t sub_244EFA568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = a4;
  if ((a4 & 1) != 0)
  {
    v8 = a1 - a2;
    if (__OFSUB__(a1, a2))
    {
      __break(1u);
    }
    else
    {
      v5 = *(_QWORD *)(a5 + 16);
      if (v5 >= v8)
      {
        if ((v8 & 0x8000000000000000) == 0)
        {
          sub_244F1BCAC();
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain_n();
          v9 = swift_dynamicCastClass();
          if (!v9)
          {
            swift_bridgeObjectRelease();
            v9 = MEMORY[0x24BEE4AF8];
          }
          v10 = *(_QWORD *)(v9 + 16);
          swift_release();
          if (v10 == v5 - v8)
          {
            if (!swift_dynamicCastClass())
              swift_bridgeObjectRelease();
            goto LABEL_11;
          }
LABEL_16:
          swift_bridgeObjectRelease();
          sub_244F08A5C(a5, a5 + 32, v8, (2 * v5) | 1);
LABEL_11:
          swift_bridgeObjectRelease();
          v7 = v7 & 0xFFFFFFFE;
          goto LABEL_12;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
LABEL_12:
  swift_bridgeObjectRetain();
  return v7;
}

uint64_t sub_244EFA694(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t inited;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  char v59;
  _QWORD *v60;
  uint64_t result;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  _DWORD *v69;
  unint64_t v70;
  uint64_t v71;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  _QWORD *v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  int v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  BOOL v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD *v104;
  _OWORD v105[3];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v5 = a3 - a2;
  if (__OFSUB__(a3, a2))
    goto LABEL_110;
  v6 = v4;
  v7 = a3;
  v9 = sub_244F04F38(0, a3 - a2);
  v104 = (_QWORD *)v9;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10)
  {
    v11 = (_QWORD *)v9;
    v97 = v4;
    v98 = v7;
    v12 = a2;
    v96 = -(uint64_t)a2;
    swift_bridgeObjectRetain();
    v13 = 0;
    v14 = -1;
    do
    {
      if (v13 >= *(_QWORD *)(a1 + 16))
      {
LABEL_103:
        __break(1u);
LABEL_104:
        __break(1u);
LABEL_105:
        __break(1u);
        goto LABEL_106;
      }
      if (a2 - 65 > 0xFFFFFFFFFFFFFF7ELL)
      {
        v15 = *(_QWORD *)(a1 + 32 + 48 * v13 + 24);
        if ((v12 & 0x8000000000000000) != 0)
        {
          if (v12 > 0xFFFFFFFFFFFFFFC0)
          {
            v16 = v15 << v96;
            if (v15 << v96)
            {
LABEL_10:
              swift_bridgeObjectRetain();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v11 = sub_244F13784(v11);
              v17 = v11 + 4;
              v18 = v11[2];
              while (1)
              {
                v19 = __clz(__rbit64(v16));
                if (v19 >= v18)
                  break;
                v20 = v17[v19];
                v21 = __OFADD__(v20, 1);
                v22 = v20 + 1;
                if (v21)
                  goto LABEL_98;
                v17[v19] = v22;
                if (v19 >= 0x40)
                  v23 = -1;
                else
                  v23 = (-1 << v19) - 1;
                v16 &= v23;
                if (!v16)
                {
                  swift_bridgeObjectRelease();
                  v104 = v11;
                  v12 = a2;
                  goto LABEL_4;
                }
              }
              __break(1u);
LABEL_98:
              __break(1u);
LABEL_99:
              v67 = MEMORY[0x24BEE4AF8];
LABEL_100:
              swift_bridgeObjectRelease();
              v78 = sub_244EFB704(v67);
              swift_release();
              swift_release();
              sub_244EFF3C4();
              swift_allocError();
              *v79 = v96;
              v79[1] = v97;
              v79[2] = (uint64_t)v78;
              swift_willThrow();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              return v14;
            }
          }
        }
        else if (v12 < 0x40)
        {
          v16 = v15 >> v12;
          if (v15 >> v12)
            goto LABEL_10;
        }
      }
LABEL_4:
      ++v13;
    }
    while (v13 != v10);
    swift_bridgeObjectRelease();
    v6 = v97;
    v7 = v98;
  }
  v24 = v6;
  v25 = sub_244EFDAF4(a1, a2, (uint64_t)&v104);
  swift_bridgeObjectRelease();
  v103 = v25;
  swift_bridgeObjectRetain();
  sub_244EFC108(&v103, (uint64_t (*)(uint64_t))sub_244EFDACC, sub_244EFC180);
  if (v24)
    goto LABEL_114;
  swift_bridgeObjectRelease();
  v26 = v103;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C528);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_244F1D140;
  memset(v105, 0, 44);
  *(_QWORD *)(v14 + 32) = sub_244F05020((uint64_t)v105, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4C8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_244F1D140;
  v28 = 1 << v5;
  if (v5 >= 0x40)
    v28 = 0;
  if (v5 > 0x40)
    v28 = 0;
  v29 = v28 != 0;
  v30 = v28 - 1;
  if (!v29)
    goto LABEL_111;
  v31 = (_QWORD *)inited;
  *(_QWORD *)(inited + 32) = v30;
  v83 = *(_QWORD *)(v26 + 16);
  if (!v83)
    goto LABEL_77;
  v32 = 0;
  v33 = a2;
  v82 = v26 + 32;
  if (v5 + 64 >= 0x80)
    v34 = 0;
  else
    v34 = 1 << v5;
  v99 = v34 - 1;
  v101 = v34 == 0;
  v80 = ~a2 + v7;
  v81 = v26;
LABEL_36:
  if (v32 >= *(_QWORD *)(v26 + 16))
    goto LABEL_104;
  v35 = v82 + 56 * v32;
  v36 = *(_QWORD *)(v35 + 32);
  if (a2 - 65 > 0xFFFFFFFFFFFFFF7ELL)
  {
    v38 = v36 >> v33;
    if ((unint64_t)v33 >= 0x40)
      v38 = 0;
    v39 = v36 << -(char)a2;
    if ((unint64_t)v33 <= 0xFFFFFFFFFFFFFFC0)
      v39 = 0;
    if (v33 < 0)
      v37 = v39;
    else
      v37 = v38;
  }
  else
  {
    v37 = 0;
  }
  v40 = v31[2];
  if (!v40)
    goto LABEL_105;
  v42 = *(_QWORD *)(v35 + 8);
  v41 = *(_QWORD *)(v35 + 16);
  v43 = *(_QWORD *)(v35 + 24);
  v44 = *(_QWORD *)(v35 + 40);
  v45 = *(_DWORD *)(v35 + 48);
  v46 = v31[4];
  v47 = v46 & v37;
  v96 = v42;
  v97 = v41;
  v92 = v44;
  v94 = v36;
  v90 = v45;
  v88 = v43;
  if ((a4 & 1) == 0)
  {
    if (v47)
    {
LABEL_68:
      v56 = __clz(__rbit64(v47));
      swift_bridgeObjectRetain();
      v48 = 0;
      goto LABEL_69;
    }
    if (!*(_QWORD *)(v14 + 16))
      goto LABEL_112;
    v62 = *(_QWORD *)(v14 + 32);
    v63 = *(_QWORD *)(v62 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v63)
      goto LABEL_99;
    v64 = 0;
    v65 = v62 + 72;
    v66 = v63 - 1;
    v67 = MEMORY[0x24BEE4AF8];
    do
    {
      if (v64 <= v63)
        v68 = v63;
      else
        v68 = v64;
      v69 = (_DWORD *)(v65 + 48 * v64);
      v70 = v64;
      while (1)
      {
        if (v68 == v70)
          goto LABEL_109;
        if (v70 <= 0x3F && ((v37 >> v70) & 1) != 0)
          break;
        ++v70;
        v69 += 12;
        if (v63 == v70)
          goto LABEL_100;
      }
      v100 = v66;
      v102 = v65;
      v71 = *((_QWORD *)v69 - 5);
      v91 = *((_QWORD *)v69 - 2);
      v93 = *((_QWORD *)v69 - 3);
      v89 = *((_QWORD *)v69 - 1);
      v87 = *v69;
      v95 = *((_QWORD *)v69 - 4);
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v103 = v67;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_244F17324(0, *(_QWORD *)(v67 + 16) + 1, 1);
        v67 = v103;
      }
      v66 = v100;
      v65 = v102;
      v74 = *(_QWORD *)(v67 + 16);
      v73 = *(_QWORD *)(v67 + 24);
      v75 = v74 + 1;
      if (v74 >= v73 >> 1)
      {
        v84 = *(_QWORD *)(v67 + 16);
        v77 = v74 + 1;
        sub_244F17324(v73 > 1, v74 + 1, 1);
        v75 = v77;
        v74 = v84;
        v66 = v100;
        v65 = v102;
        v67 = v103;
      }
      v64 = v70 + 1;
      *(_QWORD *)(v67 + 16) = v75;
      v76 = v67 + 56 * v74;
      *(_QWORD *)(v76 + 32) = v70;
      *(_QWORD *)(v76 + 40) = v71;
      *(_QWORD *)(v76 + 48) = v95;
      *(_QWORD *)(v76 + 56) = v93;
      *(_QWORD *)(v76 + 64) = v91;
      *(_QWORD *)(v76 + 72) = v89;
      *(_DWORD *)(v76 + 80) = v87;
    }
    while (v66 != v70);
    goto LABEL_100;
  }
  if (v47)
    goto LABEL_68;
  swift_bridgeObjectRetain();
  v48 = 0;
  while (1)
  {
    if (++v48 < *(_QWORD *)(v14 + 16))
      goto LABEL_64;
    if ((v5 & 0x8000000000000000) != 0)
      break;
    if (v5)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C530);
      v49 = sub_244F1B97C();
      *(_QWORD *)(v49 + 16) = v5;
      sub_244EFF55C((uint64_t)v105, v49 + 32);
      if (v5 != 1)
      {
        v50 = v49 + 80;
        v51 = v80;
        do
        {
          sub_244EFF55C((uint64_t)v105, v50);
          v50 += 48;
          --v51;
        }
        while (v51);
      }
    }
    else
    {
      v49 = MEMORY[0x24BEE4AF8];
    }
    v53 = *(_QWORD *)(v14 + 16);
    v52 = *(_QWORD *)(v14 + 24);
    if (v53 >= v52 >> 1)
      v14 = (uint64_t)sub_244F07E5C((_QWORD *)(v52 > 1), v53 + 1, 1, (_QWORD *)v14);
    *(_QWORD *)(v14 + 16) = v53 + 1;
    *(_QWORD *)(v14 + 8 * v53 + 32) = v49;
    if (v101)
      goto LABEL_102;
    v55 = v31[2];
    v54 = v31[3];
    v40 = v55 + 1;
    if (v55 >= v54 >> 1)
      v31 = sub_244F07AF8((_QWORD *)(v54 > 1), v55 + 1, 1, v31);
    v31[2] = v40;
    v31[v55 + 4] = v99;
LABEL_64:
    if (v48 >= v40)
    {
      __break(1u);
LABEL_102:
      __break(1u);
      goto LABEL_103;
    }
    v46 = v31[v48 + 4];
    if ((v46 & v37) != 0)
    {
      v56 = __clz(__rbit64(v46 & v37));
      if (v48 >= v40)
      {
LABEL_106:
        __break(1u);
LABEL_107:
        __break(1u);
        goto LABEL_108;
      }
LABEL_69:
      v31[v48 + 4] = v46 & ((-1 << v56) - 1);
      v57 = *(_QWORD *)(v14 + 16);
      swift_bridgeObjectRetain();
      if (v48 >= v57)
        goto LABEL_107;
      v58 = *(_QWORD **)(v14 + 32 + 8 * v48);
      v59 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v14 + 32 + 8 * v48) = v58;
      if ((v59 & 1) == 0)
      {
        v58 = sub_244F13798(v58);
        *(_QWORD *)(v14 + 32 + 8 * v48) = v58;
      }
      v26 = v81;
      if (v56 < v58[2])
      {
        ++v32;
        v60 = &v58[6 * v56];
        swift_bridgeObjectRelease();
        v60[4] = v96;
        v60[5] = v97;
        v60[6] = v88;
        v60[7] = v94;
        v60[8] = v92;
        *((_DWORD *)v60 + 18) = v90;
        swift_bridgeObjectRelease();
        v33 = a2;
        if (v32 == v83)
        {
LABEL_77:
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v14;
        }
        goto LABEL_36;
      }
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
    }
  }
  sub_244F1BB44();
  __break(1u);
LABEL_114:
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_244EFAEF4(_QWORD *a1, int64_t a2, uint64_t a3, int a4)
{
  char *v4;
  unint64_t v5;
  char *v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t i;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t inited;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  char v56;
  _QWORD *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t result;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t *v69;
  unint64_t v70;
  unint64_t v71;
  int64_t v72;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v74;
  unint64_t v75;
  _QWORD *v76;
  unint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t *v80;
  char v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  size_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  __int128 v98;
  unint64_t v99;
  uint64_t v100;
  _QWORD v101[8];

  v101[6] = *MEMORY[0x24BDAC8D0];
  v5 = a3 - a2;
  if (__OFSUB__(a3, a2))
    goto LABEL_107;
  v6 = v4;
  v96 = a3;
  v92 = a2;
  v9 = sub_244F04F38(0, a3 - a2);
  v101[0] = v9;
  v10 = a1[2];
  v99 = v5;
  if (v10)
  {
    v11 = (_QWORD *)v9;
    v12 = a4;
    v97 = v4;
    *(_QWORD *)&v98 = a1 + 4;
    v13 = v92;
    v14 = v92 - 65;
    v95 = -v92;
    swift_bridgeObjectRetain();
    for (i = 0; i != v10; ++i)
    {
      if (i >= a1[2])
      {
LABEL_100:
        __break(1u);
LABEL_101:
        __break(1u);
LABEL_102:
        __break(1u);
        goto LABEL_103;
      }
      if (v14 > 0xFFFFFFFFFFFFFF7ELL)
      {
        v16 = *(_QWORD *)(v98 + 32 * i + 24);
        if ((v13 & 0x8000000000000000) != 0)
        {
          if (v13 > 0xFFFFFFFFFFFFFFC0)
          {
            v17 = v16 << v95;
            if (v16 << v95)
            {
LABEL_10:
              swift_bridgeObjectRetain();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v11 = sub_244F13784(v11);
              v18 = v11 + 4;
              v19 = v11[2];
              while (1)
              {
                v20 = __clz(__rbit64(v17));
                if (v20 >= v19)
                  break;
                v21 = v18[v20];
                v22 = __OFADD__(v21, 1);
                v23 = v21 + 1;
                if (v22)
                  goto LABEL_95;
                v18[v20] = v23;
                if (v20 >= 0x40)
                  v24 = -1;
                else
                  v24 = (-1 << v20) - 1;
                v17 &= v24;
                if (!v17)
                {
                  swift_bridgeObjectRelease();
                  v101[0] = v11;
                  v13 = v92;
                  goto LABEL_4;
                }
              }
              __break(1u);
LABEL_95:
              __break(1u);
LABEL_96:
              v67 = MEMORY[0x24BEE4AF8];
LABEL_97:
              swift_bridgeObjectRelease();
              v78 = sub_244EFB81C(v67);
              swift_release();
              swift_release();
              sub_244EFF3C4();
              swift_allocError();
              v79 = v96;
              *v80 = v95;
              v80[1] = v79;
              v80[2] = (uint64_t)v78;
              swift_willThrow();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              return (uint64_t)a1;
            }
          }
        }
        else if (v13 < 0x40)
        {
          v17 = v16 >> v13;
          if (v16 >> v13)
            goto LABEL_10;
        }
      }
LABEL_4:
      ;
    }
    swift_bridgeObjectRelease();
    a4 = v12;
    v5 = v99;
    v6 = v97;
  }
  v25 = sub_244EFDE38((uint64_t)a1, v92, (uint64_t)v101);
  swift_bridgeObjectRelease();
  v100 = v25;
  swift_bridgeObjectRetain();
  sub_244EFC108(&v100, (uint64_t (*)(uint64_t))sub_244EFDAE0, sub_244EFC904);
  if (v6)
    goto LABEL_111;
  swift_bridgeObjectRelease();
  v26 = v100;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4C0);
  a1 = (_QWORD *)swift_allocObject();
  v98 = xmmword_244F1D140;
  *((_OWORD *)a1 + 1) = xmmword_244F1D140;
  a1[4] = sub_244F05148(0, 0, 0, 0, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4C8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v98;
  v28 = 1 << v5;
  if (v5 >= 0x40)
    v28 = 0;
  if (v5 > 0x40)
    v28 = 0;
  v29 = v28 != 0;
  v30 = v28 - 1;
  if (!v29)
    goto LABEL_108;
  v31 = (_QWORD *)inited;
  *(_QWORD *)(inited + 32) = v30;
  v91 = *(_QWORD *)(v26 + 16);
  if (!v91)
    goto LABEL_75;
  v84 = 0;
  v32 = 0;
  v33 = v92;
  v89 = v92 - 65;
  v90 = v26 + 32;
  v86 = -v92;
  if (v5 + 64 >= 0x80)
    v34 = 0;
  else
    v34 = 1 << v5;
  v97 = (char *)(v34 - 1);
  LODWORD(v98) = v34 == 0;
  v87 = 32 * (~v92 + v96);
  v88 = v26;
  v85 = a4;
LABEL_36:
  if (v32 >= *(_QWORD *)(v26 + 16))
    goto LABEL_101;
  v35 = (_QWORD *)(v90 + 40 * v32);
  v36 = v35[4];
  if (v89 > 0xFFFFFFFFFFFFFF7ELL)
  {
    v38 = v36 >> v33;
    if ((unint64_t)v33 >= 0x40)
      v38 = 0;
    v39 = v36 << v86;
    if ((unint64_t)v33 <= 0xFFFFFFFFFFFFFFC0)
      v39 = 0;
    if (v33 < 0)
      v37 = v39;
    else
      v37 = v38;
  }
  else
  {
    v37 = 0;
  }
  v40 = v31[2];
  if (!v40)
    goto LABEL_102;
  v42 = v35[1];
  v41 = v35[2];
  v43 = v35[3];
  v44 = v31[4];
  v45 = v44 & v37;
  v95 = v42;
  v96 = v41;
  v93 = v43;
  v94 = v36;
  if ((a4 & 1) == 0)
  {
    if (v45)
    {
LABEL_66:
      v53 = __clz(__rbit64(v45));
      swift_bridgeObjectRetain();
      v46 = 0;
      goto LABEL_67;
    }
    if (!a1[2])
      goto LABEL_109;
    v61 = &v81;
    v62 = a1[4];
    v63 = *(_QWORD *)(v62 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v63)
      goto LABEL_96;
    v64 = 0;
    v65 = v63 - 1;
    v66 = v62 + 56;
    v67 = MEMORY[0x24BEE4AF8];
    do
    {
      if (v64 <= v63)
        v68 = v63;
      else
        v68 = v64;
      v69 = (uint64_t *)(v66 + 32 * v64);
      v70 = v64;
      while (1)
      {
        if (v68 == v70)
          goto LABEL_106;
        if (v70 <= 0x3F && ((v37 >> v70) & 1) != 0)
          break;
        ++v70;
        v69 += 4;
        if (v63 == v70)
          goto LABEL_97;
      }
      *(_QWORD *)&v98 = v66;
      v99 = v65;
      v71 = *(v69 - 3);
      v93 = *(v69 - 2);
      v94 = v71;
      v72 = *(v69 - 1);
      v91 = *v69;
      v92 = v72;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v100 = v67;
      v97 = v61;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_244F17434(0, *(_QWORD *)(v67 + 16) + 1, 1);
        v67 = v100;
      }
      v65 = v99;
      v75 = *(_QWORD *)(v67 + 16);
      v74 = *(_QWORD *)(v67 + 24);
      v66 = v98;
      if (v75 >= v74 >> 1)
      {
        sub_244F17434(v74 > 1, v75 + 1, 1);
        v66 = v98;
        v65 = v99;
        v67 = v100;
      }
      v64 = v70 + 1;
      *(_QWORD *)(v67 + 16) = v75 + 1;
      v76 = (_QWORD *)(v67 + 40 * v75);
      v77 = v94;
      v76[4] = v70;
      v76[5] = v77;
      v76[6] = v93;
      v76[7] = v92;
      v76[8] = v91;
      v61 = v97;
    }
    while (v65 != v70);
    goto LABEL_97;
  }
  if (v45)
    goto LABEL_66;
  swift_bridgeObjectRetain();
  v46 = 0;
  while (1)
  {
    if (v46 + 1 < a1[2])
      goto LABEL_62;
    if ((v5 & 0x8000000000000000) != 0)
      break;
    if (v5)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4D8);
      v47 = sub_244F1B97C();
      v48 = v47;
      *(_QWORD *)(v47 + 16) = v5;
      *(_OWORD *)(v47 + 32) = 0u;
      *(_OWORD *)(v47 + 48) = 0u;
      if (v5 != 1)
        bzero((void *)(v47 + 64), v87);
    }
    else
    {
      v48 = MEMORY[0x24BEE4AF8];
    }
    v50 = a1[2];
    v49 = a1[3];
    if (v50 >= v49 >> 1)
      a1 = sub_244F081CC((_QWORD *)(v49 > 1), v50 + 1, 1, a1);
    a1[2] = v50 + 1;
    a1[v50 + 4] = v48;
    if ((v98 & 1) != 0)
      goto LABEL_99;
    v52 = v31[2];
    v51 = v31[3];
    v40 = v52 + 1;
    if (v52 >= v51 >> 1)
      v31 = sub_244F07AF8((_QWORD *)(v51 > 1), v52 + 1, 1, v31);
    v5 = v99;
    v31[2] = v40;
    v31[v52 + 4] = v97;
LABEL_62:
    if (v46 + 1 >= v40)
    {
      __break(1u);
LABEL_99:
      __break(1u);
      goto LABEL_100;
    }
    v44 = v31[v46++ + 5];
    if ((v44 & v37) != 0)
    {
      v53 = __clz(__rbit64(v44 & v37));
      LOBYTE(a4) = v85;
      if (v46 >= v40)
      {
LABEL_103:
        __break(1u);
LABEL_104:
        __break(1u);
        goto LABEL_105;
      }
LABEL_67:
      v31[v46 + 4] = v44 & ((-1 << v53) - 1);
      v54 = a1[2];
      swift_bridgeObjectRetain();
      if (v46 >= v54)
        goto LABEL_104;
      v55 = (_QWORD *)a1[v46 + 4];
      v56 = swift_isUniquelyReferenced_nonNull_native();
      a1[v46 + 4] = v55;
      if ((v56 & 1) == 0)
      {
        v55 = sub_244F137C0(v55);
        a1[v46 + 4] = v55;
      }
      v5 = v99;
      v26 = v88;
      if (v53 < v55[2])
      {
        ++v32;
        v57 = &v55[4 * v53];
        swift_bridgeObjectRelease();
        v58 = v96;
        v57[4] = v95;
        v57[5] = v58;
        v59 = v94;
        v57[6] = v93;
        v57[7] = v59;
        swift_bridgeObjectRelease();
        v33 = v92;
        if (v32 == v91)
        {
LABEL_75:
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return (uint64_t)a1;
        }
        goto LABEL_36;
      }
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
    }
  }
  v83 = 0;
  v82 = 936;
  v81 = 2;
  sub_244F1BB44();
  __break(1u);
LABEL_111:
  result = swift_release();
  __break(1u);
  return result;
}

_QWORD *sub_244EFB704(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v9;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v2 = (_QWORD *)(swift_bridgeObjectRetain() + 48);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v5 = *v2;
    if (*v2)
    {
      v9 = *((_OWORD *)v2 - 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_244F07C18(0, v3[2] + 1, 1, v3);
      v7 = v3[2];
      v6 = v3[3];
      if (v7 >= v6 >> 1)
        v3 = sub_244F07C18((_QWORD *)(v6 > 1), v7 + 1, 1, v3);
      v3[2] = v7 + 1;
      v4 = &v3[3 * v7];
      *((_OWORD *)v4 + 2) = v9;
      v4[6] = v5;
    }
    v2 += 7;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

_QWORD *sub_244EFB81C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v9;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v2 = (_QWORD *)(swift_bridgeObjectRetain() + 48);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v5 = *v2;
    if (*v2)
    {
      v9 = *((_OWORD *)v2 - 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_244F07C18(0, v3[2] + 1, 1, v3);
      v7 = v3[2];
      v6 = v3[3];
      if (v7 >= v6 >> 1)
        v3 = sub_244F07C18((_QWORD *)(v6 > 1), v7 + 1, 1, v3);
      v3[2] = v7 + 1;
      v4 = &v3[3 * v7];
      *((_OWORD *)v4 + 2) = v9;
      v4[6] = v5;
    }
    v2 += 5;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_244EFB934(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  char v13;
  char v14;
  char v15;

  v12[0] = a5;
  v12[1] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4A0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EFF380();
  sub_244F1BD30();
  v15 = 0;
  sub_244F1BC34();
  if (!v5)
  {
    v14 = 1;
    sub_244F1BC58();
    v13 = 2;
    sub_244F1BC7C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_244EFBA8C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x7265746E756F63;
  if (*v0 != 1)
    v1 = 0x726F7463656C6573;
  if (*v0)
    return v1;
  else
    return 1701667182;
}

uint64_t sub_244EFBAE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244EFE724(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244EFBB04()
{
  sub_244EFF380();
  return sub_244F1BD60();
}

uint64_t sub_244EFBB2C()
{
  sub_244EFF380();
  return sub_244F1BD6C();
}

uint64_t sub_244EFBB54@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_244EFE868(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_244EFBB80(_QWORD *a1)
{
  uint64_t *v1;

  return sub_244EFB934(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t KPCSettings.config.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t KPCSettings.periods.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_244EFBBB0()
{
  sub_244F1BAB4();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  sub_244F1B8A4();
  return 0xD00000000000001ALL;
}

unint64_t sub_244EFBC50()
{
  return sub_244EFBBB0();
}

uint64_t sub_244EFBC58(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_244F1BCA0();
}

uint64_t sub_244EFBC88(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;

  v14 = MEMORY[0x24BEE4AF8];
  sub_244F17418(0, 0, 0);
  v2 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v13 = v2;
  if (v2)
  {
    v3 = 0;
    v4 = (uint64_t *)(a1 + 48);
    do
    {
      v5 = *(v4 - 1);
      if (v5)
        v6 = *(v4 - 2);
      else
        v6 = 0;
      if (v5)
        v7 = v3;
      else
        v7 = 0;
      if (v5)
        v8 = *v4;
      else
        v8 = 0;
      v10 = *(_QWORD *)(v14 + 16);
      v9 = *(_QWORD *)(v14 + 24);
      swift_bridgeObjectRetain();
      if (v10 >= v9 >> 1)
        sub_244F17418(v9 > 1, v10 + 1, 1);
      ++v3;
      v4 += 4;
      *(_QWORD *)(v14 + 16) = v10 + 1;
      v11 = (_QWORD *)(v14 + 32 * v10);
      v11[4] = v6;
      v11[5] = v5;
      v11[6] = v7;
      v11[7] = v8;
    }
    while (v13 != v3);
  }
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_244EFBDA0()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6F666E49756D70;
  if (*v0 != 1)
    v1 = 0x746553746E657665;
  if (*v0)
    return v1;
  else
    return 0x436F5473656D616ELL;
}

uint64_t sub_244EFBE14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244EFEA28(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244EFBE38()
{
  sub_244EFE634();
  return sub_244F1BD60();
}

uint64_t sub_244EFBE60()
{
  sub_244EFE634();
  return sub_244F1BD6C();
}

uint64_t Settings.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;
  uint64_t v11;
  char v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C428);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EFE634();
  sub_244F1BD30();
  *(_QWORD *)&v10 = *(_QWORD *)v3;
  v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C438);
  sub_244EFF44C(&qword_25742C440, MEMORY[0x24BEE0D08], MEMORY[0x24BEE1770], MEMORY[0x24BEE04C0]);
  sub_244F1BC64();
  if (!v2)
  {
    v10 = *(_OWORD *)(v3 + 8);
    v11 = *(_QWORD *)(v3 + 24);
    v12 = 1;
    sub_244EFE678();
    sub_244F1BC64();
    *(_QWORD *)&v10 = *(_QWORD *)(v3 + 32);
    v12 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C450);
    sub_244EF32A4(&qword_25742C458, &qword_25742C450, sub_244EFE6BC, MEMORY[0x24BEE12A0]);
    sub_244F1BC64();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double Settings.init(from:)@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  sub_244EFEBC4(a1, v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

double sub_244EFC0B0@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  sub_244EFEBC4(a1, v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_244EFC0F4(_QWORD *a1)
{
  return Settings.encode(to:)(a1);
}

uint64_t sub_244EFC108(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(_QWORD *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = a2(v6);
  v7 = *(_QWORD *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  result = a3(v9);
  *a1 = v6;
  return result;
}

uint64_t sub_244EFC180(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  int8x8_t *v15;
  int8x8_t v16;
  int8x8_t *v17;
  uint8x8_t v18;
  unint64_t v19;
  uint8x8_t v20;
  _BOOL4 v21;
  BOOL v22;
  int v23;
  int8x8_t *v24;
  int8x8_t *v25;
  int8x8_t v26;
  uint8x8_t v27;
  unint64_t v28;
  uint8x8_t v29;
  _BOOL4 v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int8x8_t v52;
  uint8x8_t v53;
  unint64_t v54;
  uint8x8_t v55;
  _BOOL4 v56;
  _BOOL4 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  __int128 v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  BOOL v89;
  uint64_t v90;
  char v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int8x8_t *__dst;
  uint64_t v130;

  v3 = a1[1];
  result = sub_244F1BC88();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_136;
    if (v3)
      return sub_244EFD064(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_144;
  v6 = result;
  v130 = v1;
  v123 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (int8x8_t *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_102:
      v114 = v12;
      v125 = v9;
      if (v13 >= 2)
      {
        v115 = *v123;
        do
        {
          v116 = v13 - 2;
          if (v13 < 2)
            goto LABEL_131;
          if (!v115)
            goto LABEL_143;
          v117 = v114;
          v118 = *(_QWORD *)&v114[16 * v116 + 32];
          v119 = *(_QWORD *)&v114[16 * v13 + 24];
          sub_244EFD208((int8x8_t *)(v115 + 56 * v118), (int8x8_t *)(v115 + 56 * *(_QWORD *)&v114[16 * v13 + 16]), v115 + 56 * v119, __dst);
          if (v130)
            break;
          if (v119 < v118)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v117 = sub_244EFDAB8((uint64_t)v117);
          if (v116 >= *((_QWORD *)v117 + 2))
            goto LABEL_133;
          v120 = &v117[16 * v116 + 32];
          *(_QWORD *)v120 = v118;
          *((_QWORD *)v120 + 1) = v119;
          v121 = *((_QWORD *)v117 + 2);
          if (v13 > v121)
            goto LABEL_134;
          memmove(&v117[16 * v13 + 16], &v117[16 * v13 + 32], 16 * (v121 - v13));
          v114 = v117;
          *((_QWORD *)v117 + 2) = v121 - 1;
          v13 = v121 - 1;
        }
        while (v121 > 2);
      }
LABEL_99:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v125 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v125 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C538);
    v8 = sub_244F1B97C();
    *(_QWORD *)(v8 + 16) = v7;
    v125 = v8;
    __dst = (int8x8_t *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v124 = *a1 + 88;
  v122 = *a1 - 56;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v126 = v6;
  v127 = v3;
  v128 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = (int8x8_t *)(v11 + 56 * v10);
      v16 = *v15;
      v17 = (int8x8_t *)(v11 + 56 * v14);
      v18 = (uint8x8_t)vcnt_s8(v15[4]);
      v18.i16[0] = vaddlv_u8(v18);
      v19 = v18.u32[0];
      v20 = (uint8x8_t)vcnt_s8(v17[4]);
      v20.i16[0] = vaddlv_u8(v20);
      v21 = *(_QWORD *)&v16 < *(uint64_t *)v17;
      v22 = v19 == v20.u32[0];
      v23 = v19 < v20.u32[0];
      if (v22)
        v23 = v21;
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v24 = (int8x8_t *)(v124 + 56 * v14);
        v25 = v24;
        while (1)
        {
          v26 = v25[7];
          v25 += 7;
          v27 = (uint8x8_t)vcnt_s8(v26);
          v27.i16[0] = vaddlv_u8(v27);
          v28 = v27.u32[0];
          v29 = (uint8x8_t)vcnt_s8(*v24);
          v29.i16[0] = vaddlv_u8(v29);
          v30 = *(_QWORD *)&v24[3] < *(_QWORD *)&v24[-4];
          v31 = v28 < v29.u32[0];
          if (v28 == v29.u32[0])
            v31 = v30;
          if (v23 != v31)
            break;
          ++v10;
          v24 = v25;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v23)
      {
        if (v10 < v14)
          goto LABEL_137;
        if (v14 < v10)
        {
          v32 = 56 * v10;
          v33 = v10;
          v34 = v14;
          v35 = 56 * v14;
          do
          {
            if (v34 != --v33)
            {
              if (!v11)
                goto LABEL_142;
              v36 = v11 + v35;
              v37 = *(_QWORD *)(v11 + v35 + 16);
              v38 = v11 + v32;
              v39 = *(_QWORD *)(v11 + v35 + 40);
              v40 = *(_DWORD *)(v11 + v35 + 48);
              v41 = *(_OWORD *)(v11 + v35);
              v42 = *(_OWORD *)(v11 + v35 + 24);
              v43 = *(_OWORD *)(v11 + v32 - 40);
              v44 = *(_OWORD *)(v11 + v32 - 24);
              v45 = *(_OWORD *)(v11 + v32 - 56);
              *(_QWORD *)(v36 + 48) = *(_QWORD *)(v11 + v32 - 8);
              *(_OWORD *)(v36 + 16) = v43;
              *(_OWORD *)(v36 + 32) = v44;
              *(_OWORD *)v36 = v45;
              *(_OWORD *)(v38 - 56) = v41;
              *(_QWORD *)(v38 - 40) = v37;
              *(_OWORD *)(v38 - 32) = v42;
              *(_QWORD *)(v38 - 16) = v39;
              *(_DWORD *)(v38 - 8) = v40;
            }
            ++v34;
            v32 -= 56;
            v35 += 56;
          }
          while (v34 < v33);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_52;
    if (__OFSUB__(v10, v14))
      goto LABEL_135;
    if (v10 - v14 >= v6)
      goto LABEL_52;
    v46 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_138;
    if (v46 >= v3)
      v46 = v3;
    if (v46 < v14)
      break;
    if (v10 != v46)
    {
      v47 = v122 + 56 * v10;
      do
      {
        v48 = v14;
        v49 = v47;
        do
        {
          v50 = v49 + 56;
          v51 = *(_QWORD *)(v49 + 56);
          v52 = *(int8x8_t *)(v49 + 88);
          v53 = (uint8x8_t)vcnt_s8(v52);
          v53.i16[0] = vaddlv_u8(v53);
          v54 = v53.u32[0];
          v55 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(v49 + 32));
          v55.i16[0] = vaddlv_u8(v55);
          v56 = v51 < *(_QWORD *)v49;
          v22 = v54 == v55.u32[0];
          v57 = v54 < v55.u32[0];
          if (!v22)
            v56 = v57;
          if (!v56)
            break;
          if (!v11)
            goto LABEL_140;
          v58 = *(_OWORD *)(v49 + 64);
          v59 = *(_QWORD *)(v49 + 80);
          v60 = *(_QWORD *)(v49 + 96);
          v61 = *(_DWORD *)(v49 + 104);
          v62 = *(_OWORD *)(v49 + 16);
          *(_OWORD *)v50 = *(_OWORD *)v49;
          *(_OWORD *)(v49 + 72) = v62;
          *(_OWORD *)(v49 + 88) = *(_OWORD *)(v49 + 32);
          v63 = *(_QWORD *)(v49 + 48);
          *(_QWORD *)v49 = v51;
          *(_OWORD *)(v49 + 8) = v58;
          *(_QWORD *)(v49 + 24) = v59;
          *(int8x8_t *)(v49 + 32) = v52;
          *(_QWORD *)(v49 + 40) = v60;
          *(_DWORD *)(v49 + 48) = v61;
          v49 -= 56;
          ++v48;
          *(_QWORD *)(v50 + 48) = v63;
        }
        while (v10 != v48);
        ++v10;
        v47 += 56;
      }
      while (v10 != v46);
      v10 = v46;
    }
LABEL_52:
    if (v10 < v14)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_244EFD84C(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v65 = *((_QWORD *)v12 + 2);
    v64 = *((_QWORD *)v12 + 3);
    v13 = v65 + 1;
    v11 = v128;
    if (v65 >= v64 >> 1)
    {
      v113 = sub_244EFD84C((char *)(v64 > 1), v65 + 1, 1, v12);
      v11 = v128;
      v12 = v113;
    }
    *((_QWORD *)v12 + 2) = v13;
    v66 = v12 + 32;
    v67 = &v12[16 * v65 + 32];
    *(_QWORD *)v67 = v14;
    *((_QWORD *)v67 + 1) = v10;
    if (v65)
    {
      while (1)
      {
        v68 = v13 - 1;
        if (v13 >= 4)
        {
          v73 = &v66[16 * v13];
          v74 = *((_QWORD *)v73 - 8);
          v75 = *((_QWORD *)v73 - 7);
          v79 = __OFSUB__(v75, v74);
          v76 = v75 - v74;
          if (v79)
            goto LABEL_119;
          v78 = *((_QWORD *)v73 - 6);
          v77 = *((_QWORD *)v73 - 5);
          v79 = __OFSUB__(v77, v78);
          v71 = v77 - v78;
          v72 = v79;
          if (v79)
            goto LABEL_120;
          v80 = v13 - 2;
          v81 = &v66[16 * v13 - 32];
          v83 = *(_QWORD *)v81;
          v82 = *((_QWORD *)v81 + 1);
          v79 = __OFSUB__(v82, v83);
          v84 = v82 - v83;
          if (v79)
            goto LABEL_122;
          v79 = __OFADD__(v71, v84);
          v85 = v71 + v84;
          if (v79)
            goto LABEL_125;
          if (v85 >= v76)
          {
            v103 = &v66[16 * v68];
            v105 = *(_QWORD *)v103;
            v104 = *((_QWORD *)v103 + 1);
            v79 = __OFSUB__(v104, v105);
            v106 = v104 - v105;
            if (v79)
              goto LABEL_129;
            v96 = v71 < v106;
            goto LABEL_89;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v97 = *((_QWORD *)v12 + 4);
            v98 = *((_QWORD *)v12 + 5);
            v79 = __OFSUB__(v98, v97);
            v90 = v98 - v97;
            v91 = v79;
            goto LABEL_83;
          }
          v70 = *((_QWORD *)v12 + 4);
          v69 = *((_QWORD *)v12 + 5);
          v79 = __OFSUB__(v69, v70);
          v71 = v69 - v70;
          v72 = v79;
        }
        if ((v72 & 1) != 0)
          goto LABEL_121;
        v80 = v13 - 2;
        v86 = &v66[16 * v13 - 32];
        v88 = *(_QWORD *)v86;
        v87 = *((_QWORD *)v86 + 1);
        v89 = __OFSUB__(v87, v88);
        v90 = v87 - v88;
        v91 = v89;
        if (v89)
          goto LABEL_124;
        v92 = &v66[16 * v68];
        v94 = *(_QWORD *)v92;
        v93 = *((_QWORD *)v92 + 1);
        v79 = __OFSUB__(v93, v94);
        v95 = v93 - v94;
        if (v79)
          goto LABEL_127;
        if (__OFADD__(v90, v95))
          goto LABEL_128;
        if (v90 + v95 >= v71)
        {
          v96 = v71 < v95;
LABEL_89:
          if (v96)
            v68 = v80;
          goto LABEL_91;
        }
LABEL_83:
        if ((v91 & 1) != 0)
          goto LABEL_123;
        v99 = &v66[16 * v68];
        v101 = *(_QWORD *)v99;
        v100 = *((_QWORD *)v99 + 1);
        v79 = __OFSUB__(v100, v101);
        v102 = v100 - v101;
        if (v79)
          goto LABEL_126;
        if (v102 < v90)
          goto LABEL_15;
LABEL_91:
        v107 = v68 - 1;
        if (v68 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11)
          goto LABEL_141;
        v108 = &v66[16 * v107];
        v109 = *(_QWORD *)v108;
        v110 = &v66[16 * v68];
        v111 = *((_QWORD *)v110 + 1);
        sub_244EFD208((int8x8_t *)(v11 + 56 * *(_QWORD *)v108), (int8x8_t *)(v11 + 56 * *(_QWORD *)v110), v11 + 56 * v111, __dst);
        if (v130)
          goto LABEL_99;
        if (v111 < v109)
          goto LABEL_116;
        if (v68 > *((_QWORD *)v12 + 2))
          goto LABEL_117;
        *(_QWORD *)v108 = v109;
        *(_QWORD *)&v66[16 * v107 + 8] = v111;
        v112 = *((_QWORD *)v12 + 2);
        if (v68 >= v112)
          goto LABEL_118;
        v13 = v112 - 1;
        memmove(&v66[16 * v68], v110 + 16, 16 * (v112 - 1 - v68));
        *((_QWORD *)v12 + 2) = v112 - 1;
        v11 = v128;
        if (v112 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v126;
    v3 = v127;
    if (v10 >= v127)
    {
      v9 = v125;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  result = sub_244F1BB44();
  __break(1u);
  return result;
}

uint64_t sub_244EFC904(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int8x8_t v17;
  int8x8_t *v18;
  uint8x8_t v19;
  unint64_t v20;
  uint8x8_t v21;
  _BOOL4 v22;
  int v23;
  int8x8_t *v24;
  int8x8_t v25;
  int8x8_t v26;
  uint8x8_t v27;
  unint64_t v28;
  uint8x8_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  int8x8_t *v44;
  int8x8_t v45;
  int8x8_t v46;
  uint8x8_t v47;
  unint64_t v48;
  uint64_t v49;
  int8x8_t *v50;
  uint8x8_t v51;
  _BOOL4 v52;
  int8x8_t *v53;
  int8x8_t v54;
  int8x8_t v55;
  int8x8_t v56;
  __int128 v57;
  int8x8_t v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  char *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  unint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  char v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  unint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  int8x8_t *__dst;
  uint64_t v125;

  v3 = a1[1];
  result = sub_244F1BC88();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_136;
    if (v3)
      return sub_244EFD140(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_144;
  v6 = result;
  v125 = v1;
  v118 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (int8x8_t *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_102:
      v109 = v12;
      v120 = v9;
      if (v13 >= 2)
      {
        v110 = *v118;
        do
        {
          v111 = v13 - 2;
          if (v13 < 2)
            goto LABEL_131;
          if (!v110)
            goto LABEL_143;
          v112 = v109;
          v113 = *(_QWORD *)&v109[16 * v111 + 32];
          v114 = *(_QWORD *)&v109[16 * v13 + 24];
          sub_244EFD534((int8x8_t *)(v110 + 40 * v113), (int8x8_t *)(v110 + 40 * *(_QWORD *)&v109[16 * v13 + 16]), v110 + 40 * v114, __dst);
          if (v125)
            break;
          if (v114 < v113)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v112 = sub_244EFDAB8((uint64_t)v112);
          if (v111 >= *((_QWORD *)v112 + 2))
            goto LABEL_133;
          v115 = &v112[16 * v111 + 32];
          *(_QWORD *)v115 = v113;
          *((_QWORD *)v115 + 1) = v114;
          v116 = *((_QWORD *)v112 + 2);
          if (v13 > v116)
            goto LABEL_134;
          memmove(&v112[16 * v13 + 16], &v112[16 * v13 + 32], 16 * (v116 - v13));
          v109 = v112;
          *((_QWORD *)v112 + 2) = v116 - 1;
          v13 = v116 - 1;
        }
        while (v116 > 2);
      }
LABEL_99:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v120 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v120 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4E0);
    v8 = sub_244F1B97C();
    *(_QWORD *)(v8 + 16) = v7;
    v120 = v8;
    __dst = (int8x8_t *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v119 = *a1 + 112;
  v117 = *a1 - 8;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v121 = v6;
  v122 = v3;
  v123 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = (uint64_t *)(v11 + 40 * v10);
      v16 = *v15;
      v17 = (int8x8_t)v15[4];
      v18 = (int8x8_t *)(v11 + 40 * v14);
      v19 = (uint8x8_t)vcnt_s8(v17);
      v19.i16[0] = vaddlv_u8(v19);
      v20 = v19.u32[0];
      v21 = (uint8x8_t)vcnt_s8(v18[4]);
      v21.i16[0] = vaddlv_u8(v21);
      v22 = v16 < *(_QWORD *)v18;
      v23 = v20 < v21.u32[0];
      if (v20 == v21.u32[0])
        v23 = v22;
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v24 = (int8x8_t *)(v119 + 40 * v14);
        while (1)
        {
          v25 = v24[-4];
          v26 = *v24;
          v27 = (uint8x8_t)vcnt_s8(*v24);
          v27.i16[0] = vaddlv_u8(v27);
          v28 = v27.u32[0];
          v29 = (uint8x8_t)vcnt_s8(v17);
          v29.i16[0] = vaddlv_u8(v29);
          v30 = *(_QWORD *)&v25 < v16;
          if (v28 != v29.u32[0])
            v30 = v28 < v29.u32[0];
          if (v23 != v30)
            break;
          v24 += 5;
          ++v10;
          v17 = v26;
          v16 = (uint64_t)v25;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v23)
      {
        if (v10 < v14)
          goto LABEL_137;
        if (v14 < v10)
        {
          v31 = 40 * v10;
          v32 = 40 * v14;
          v33 = v10;
          v34 = v14;
          do
          {
            if (v34 != --v33)
            {
              if (!v11)
                goto LABEL_142;
              v35 = v11 + v32;
              v36 = *(_QWORD *)(v11 + v32 + 16);
              v37 = v11 + v31;
              v38 = *(_OWORD *)(v11 + v32);
              v39 = *(_OWORD *)(v11 + v32 + 24);
              v40 = *(_QWORD *)(v11 + v31 - 8);
              v41 = *(_OWORD *)(v11 + v31 - 24);
              *(_OWORD *)v35 = *(_OWORD *)(v11 + v31 - 40);
              *(_OWORD *)(v35 + 16) = v41;
              *(_QWORD *)(v35 + 32) = v40;
              *(_OWORD *)(v37 - 40) = v38;
              *(_QWORD *)(v37 - 24) = v36;
              *(_OWORD *)(v37 - 16) = v39;
            }
            ++v34;
            v31 -= 40;
            v32 += 40;
          }
          while (v34 < v33);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_52;
    if (__OFSUB__(v10, v14))
      goto LABEL_135;
    if (v10 - v14 >= v6)
      goto LABEL_52;
    v42 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_138;
    if (v42 >= v3)
      v42 = v3;
    if (v42 < v14)
      break;
    if (v10 != v42)
    {
      v43 = v117 + 40 * v10;
      do
      {
        v44 = (int8x8_t *)(v11 + 40 * v10);
        v45 = *v44;
        v46 = v44[4];
        v47 = (uint8x8_t)vcnt_s8(v46);
        v47.i16[0] = vaddlv_u8(v47);
        v48 = v47.u32[0];
        v49 = v14;
        v50 = (int8x8_t *)v43;
        do
        {
          v51 = (uint8x8_t)vcnt_s8(*v50);
          v51.i16[0] = vaddlv_u8(v51);
          v52 = *(_QWORD *)&v45 < *(_QWORD *)&v50[-4];
          if (v48 != v51.u32[0])
            v52 = v48 < v51.u32[0];
          if (!v52)
            break;
          if (!v11)
            goto LABEL_140;
          v53 = v50 + 1;
          v54 = v50[2];
          v55 = v50[3];
          v56 = v50[4];
          v57 = *(_OWORD *)v50[-2].i8;
          *(_OWORD *)v50[1].i8 = *(_OWORD *)v50[-4].i8;
          *(_OWORD *)v50[3].i8 = v57;
          v58 = *v50;
          v50[-4] = v45;
          v50[-3] = v54;
          v50[-2] = v55;
          v50[-1] = v56;
          *v50 = v46;
          v50 -= 5;
          ++v49;
          v53[4] = v58;
        }
        while (v10 != v49);
        ++v10;
        v43 += 40;
      }
      while (v10 != v42);
      v10 = v42;
    }
LABEL_52:
    if (v10 < v14)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_244EFD84C(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v60 = *((_QWORD *)v12 + 2);
    v59 = *((_QWORD *)v12 + 3);
    v13 = v60 + 1;
    v11 = v123;
    if (v60 >= v59 >> 1)
    {
      v108 = sub_244EFD84C((char *)(v59 > 1), v60 + 1, 1, v12);
      v11 = v123;
      v12 = v108;
    }
    *((_QWORD *)v12 + 2) = v13;
    v61 = v12 + 32;
    v62 = &v12[16 * v60 + 32];
    *(_QWORD *)v62 = v14;
    *((_QWORD *)v62 + 1) = v10;
    if (v60)
    {
      while (1)
      {
        v63 = v13 - 1;
        if (v13 >= 4)
        {
          v68 = &v61[16 * v13];
          v69 = *((_QWORD *)v68 - 8);
          v70 = *((_QWORD *)v68 - 7);
          v74 = __OFSUB__(v70, v69);
          v71 = v70 - v69;
          if (v74)
            goto LABEL_119;
          v73 = *((_QWORD *)v68 - 6);
          v72 = *((_QWORD *)v68 - 5);
          v74 = __OFSUB__(v72, v73);
          v66 = v72 - v73;
          v67 = v74;
          if (v74)
            goto LABEL_120;
          v75 = v13 - 2;
          v76 = &v61[16 * v13 - 32];
          v78 = *(_QWORD *)v76;
          v77 = *((_QWORD *)v76 + 1);
          v74 = __OFSUB__(v77, v78);
          v79 = v77 - v78;
          if (v74)
            goto LABEL_122;
          v74 = __OFADD__(v66, v79);
          v80 = v66 + v79;
          if (v74)
            goto LABEL_125;
          if (v80 >= v71)
          {
            v98 = &v61[16 * v63];
            v100 = *(_QWORD *)v98;
            v99 = *((_QWORD *)v98 + 1);
            v74 = __OFSUB__(v99, v100);
            v101 = v99 - v100;
            if (v74)
              goto LABEL_129;
            v91 = v66 < v101;
            goto LABEL_89;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v92 = *((_QWORD *)v12 + 4);
            v93 = *((_QWORD *)v12 + 5);
            v74 = __OFSUB__(v93, v92);
            v85 = v93 - v92;
            v86 = v74;
            goto LABEL_83;
          }
          v65 = *((_QWORD *)v12 + 4);
          v64 = *((_QWORD *)v12 + 5);
          v74 = __OFSUB__(v64, v65);
          v66 = v64 - v65;
          v67 = v74;
        }
        if ((v67 & 1) != 0)
          goto LABEL_121;
        v75 = v13 - 2;
        v81 = &v61[16 * v13 - 32];
        v83 = *(_QWORD *)v81;
        v82 = *((_QWORD *)v81 + 1);
        v84 = __OFSUB__(v82, v83);
        v85 = v82 - v83;
        v86 = v84;
        if (v84)
          goto LABEL_124;
        v87 = &v61[16 * v63];
        v89 = *(_QWORD *)v87;
        v88 = *((_QWORD *)v87 + 1);
        v74 = __OFSUB__(v88, v89);
        v90 = v88 - v89;
        if (v74)
          goto LABEL_127;
        if (__OFADD__(v85, v90))
          goto LABEL_128;
        if (v85 + v90 >= v66)
        {
          v91 = v66 < v90;
LABEL_89:
          if (v91)
            v63 = v75;
          goto LABEL_91;
        }
LABEL_83:
        if ((v86 & 1) != 0)
          goto LABEL_123;
        v94 = &v61[16 * v63];
        v96 = *(_QWORD *)v94;
        v95 = *((_QWORD *)v94 + 1);
        v74 = __OFSUB__(v95, v96);
        v97 = v95 - v96;
        if (v74)
          goto LABEL_126;
        if (v97 < v85)
          goto LABEL_15;
LABEL_91:
        v102 = v63 - 1;
        if (v63 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11)
          goto LABEL_141;
        v103 = &v61[16 * v102];
        v104 = *(_QWORD *)v103;
        v105 = &v61[16 * v63];
        v106 = *((_QWORD *)v105 + 1);
        sub_244EFD534((int8x8_t *)(v11 + 40 * *(_QWORD *)v103), (int8x8_t *)(v11 + 40 * *(_QWORD *)v105), v11 + 40 * v106, __dst);
        if (v125)
          goto LABEL_99;
        if (v106 < v104)
          goto LABEL_116;
        if (v63 > *((_QWORD *)v12 + 2))
          goto LABEL_117;
        *(_QWORD *)v103 = v104;
        *(_QWORD *)&v61[16 * v102 + 8] = v106;
        v107 = *((_QWORD *)v12 + 2);
        if (v63 >= v107)
          goto LABEL_118;
        v13 = v107 - 1;
        memmove(&v61[16 * v63], v105 + 16, 16 * (v107 - 1 - v63));
        *((_QWORD *)v12 + 2) = v107 - 1;
        v11 = v123;
        if (v107 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v121;
    v3 = v122;
    if (v10 >= v122)
    {
      v9 = v120;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  result = sub_244F1BB44();
  __break(1u);
  return result;
}

uint64_t sub_244EFD064(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int8x8_t v10;
  uint8x8_t v11;
  unint64_t v12;
  uint8x8_t v13;
  _BOOL4 v14;
  BOOL v15;
  _BOOL4 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  __int128 v21;
  uint64_t v22;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 56 * a3 - 56;
LABEL_5:
    v6 = result;
    v7 = v5;
    while (1)
    {
      v8 = v7 + 56;
      v9 = *(_QWORD *)(v7 + 56);
      v10 = *(int8x8_t *)(v7 + 88);
      v11 = (uint8x8_t)vcnt_s8(v10);
      v11.i16[0] = vaddlv_u8(v11);
      v12 = v11.u32[0];
      v13 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(v7 + 32));
      v13.i16[0] = vaddlv_u8(v13);
      v14 = v9 < *(_QWORD *)v7;
      v15 = v12 == v13.u32[0];
      v16 = v12 < v13.u32[0];
      if (!v15)
        v14 = v16;
      if (!v14)
      {
LABEL_4:
        ++a3;
        v5 += 56;
        if (a3 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v4)
        break;
      v17 = *(_OWORD *)(v7 + 64);
      v18 = *(_QWORD *)(v7 + 80);
      v19 = *(_QWORD *)(v7 + 96);
      v20 = *(_DWORD *)(v7 + 104);
      v21 = *(_OWORD *)(v7 + 16);
      *(_OWORD *)v8 = *(_OWORD *)v7;
      *(_OWORD *)(v7 + 72) = v21;
      *(_OWORD *)(v7 + 88) = *(_OWORD *)(v7 + 32);
      v22 = *(_QWORD *)(v7 + 48);
      *(_QWORD *)v7 = v9;
      *(_OWORD *)(v7 + 8) = v17;
      *(_QWORD *)(v7 + 24) = v18;
      *(int8x8_t *)(v7 + 32) = v10;
      *(_QWORD *)(v7 + 40) = v19;
      *(_DWORD *)(v7 + 48) = v20;
      v7 -= 56;
      ++v6;
      *(_QWORD *)(v8 + 48) = v22;
      if (a3 == v6)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_244EFD140(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int8x8_t v8;
  uint8x8_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8x8_t v13;
  _BOOL4 v14;
  int8x8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  int8x8_t v20;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 40 * a3 - 8;
LABEL_5:
    v6 = (uint64_t *)(v4 + 40 * a3);
    v7 = *v6;
    v8 = (int8x8_t)v6[4];
    v9 = (uint8x8_t)vcnt_s8(v8);
    v9.i16[0] = vaddlv_u8(v9);
    v10 = v9.u32[0];
    v11 = result;
    v12 = v5;
    while (1)
    {
      v13 = (uint8x8_t)vcnt_s8(*(int8x8_t *)v12);
      v13.i16[0] = vaddlv_u8(v13);
      v14 = v7 < *(_QWORD *)(v12 - 32);
      if (v10 != v13.u32[0])
        v14 = v10 < v13.u32[0];
      if (!v14)
      {
LABEL_4:
        ++a3;
        v5 += 40;
        if (a3 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v4)
        break;
      v15 = (int8x8_t *)(v12 + 8);
      v16 = *(_QWORD *)(v12 + 16);
      v17 = *(_QWORD *)(v12 + 24);
      v18 = *(_QWORD *)(v12 + 32);
      v19 = *(_OWORD *)(v12 - 16);
      *(_OWORD *)(v12 + 8) = *(_OWORD *)(v12 - 32);
      *(_OWORD *)(v12 + 24) = v19;
      v20 = *(int8x8_t *)v12;
      *(_QWORD *)(v12 - 32) = v7;
      *(_QWORD *)(v12 - 24) = v16;
      *(_QWORD *)(v12 - 16) = v17;
      *(_QWORD *)(v12 - 8) = v18;
      *(int8x8_t *)v12 = v8;
      v12 -= 40;
      ++v11;
      v15[4] = v20;
      if (a3 == v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_244EFD208(int8x8_t *__src, int8x8_t *a2, unint64_t a3, int8x8_t *__dst)
{
  int8x8_t *v4;
  int8x8_t *v6;
  int8x8_t *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  int8x8_t *v13;
  uint8x8_t v14;
  unint64_t v15;
  uint8x8_t v16;
  _BOOL4 v17;
  int8x8_t *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  int8x8_t *v26;
  unint64_t v27;
  int8x8_t *v28;
  int8x8_t *v29;
  int8x8_t v30;
  uint8x8_t v31;
  unint64_t v32;
  uint8x8_t v33;
  _BOOL4 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t result;
  int8x8_t *v42;
  int8x8_t *v43;
  int8x8_t *v44;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = (char *)a2 - (char *)__src;
  v9 = ((char *)a2 - (char *)__src) / 56;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 56;
  v43 = __dst;
  v44 = __src;
  if (v9 >= v11)
  {
    if (v10 >= -55)
    {
      v25 = 7 * v11;
      if (__dst != a2 || &a2[v25] <= __dst)
        memmove(__dst, a2, 56 * v11);
      v26 = &v4[v25];
      v42 = &v4[v25];
      v44 = v6;
      if (v7 < v6 && v10 >= 56)
      {
        v27 = a3 - 56;
        v28 = v6;
        while (1)
        {
          v29 = (int8x8_t *)(v27 + 56);
          v30 = v28[-7];
          v28 -= 7;
          v31 = (uint8x8_t)vcnt_s8(v26[-3]);
          v31.i16[0] = vaddlv_u8(v31);
          v32 = v31.u32[0];
          v33 = (uint8x8_t)vcnt_s8(v28[4]);
          v33.i16[0] = vaddlv_u8(v33);
          v34 = *(_QWORD *)&v26[-7] < *(_QWORD *)&v30;
          if (v32 != v33.u32[0])
            v34 = v32 < v33.u32[0];
          if (v34)
          {
            if (v29 != v6 || v27 >= (unint64_t)v6)
            {
              v35 = *(_OWORD *)v28->i8;
              v36 = *(_OWORD *)v28[2].i8;
              v37 = *(_OWORD *)v28[4].i8;
              *(int8x8_t *)(v27 + 48) = v28[6];
              *(_OWORD *)(v27 + 16) = v36;
              *(_OWORD *)(v27 + 32) = v37;
              *(_OWORD *)v27 = v35;
            }
            v44 = v28;
            if (v28 <= v7)
              goto LABEL_42;
          }
          else
          {
            v42 = v26 - 7;
            if (v29 < v26 || v27 >= (unint64_t)v26 || v29 != v26)
            {
              v38 = *(_OWORD *)v26[-7].i8;
              v39 = *(_OWORD *)v26[-5].i8;
              v40 = *(_OWORD *)v26[-3].i8;
              *(int8x8_t *)(v27 + 48) = v26[-1];
              *(_OWORD *)(v27 + 16) = v39;
              *(_OWORD *)(v27 + 32) = v40;
              *(_OWORD *)v27 = v38;
            }
            v28 = v6;
            v26 -= 7;
            if (v6 <= v7)
              goto LABEL_42;
          }
          v27 -= 56;
          v6 = v28;
          if (v26 <= v4)
            goto LABEL_42;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -55)
  {
    v12 = 7 * v9;
    if (__dst != __src || &__src[v12] <= __dst)
      memmove(__dst, __src, v12 * 8);
    v13 = &v4[v12];
    v42 = &v4[v12];
    if ((unint64_t)v6 < a3 && v8 >= 56)
    {
      do
      {
        v14 = (uint8x8_t)vcnt_s8(v6[4]);
        v14.i16[0] = vaddlv_u8(v14);
        v15 = v14.u32[0];
        v16 = (uint8x8_t)vcnt_s8(v4[4]);
        v16.i16[0] = vaddlv_u8(v16);
        v17 = *(uint64_t *)v6 < *(_QWORD *)v4;
        if (v15 != v16.u32[0])
          v17 = v15 < v16.u32[0];
        if (v17)
        {
          v18 = v6 + 7;
          if (v7 < v6 || v7 >= v18 || v7 != v6)
          {
            v19 = *(_OWORD *)v6->i8;
            v20 = *(_OWORD *)v6[2].i8;
            v21 = *(_OWORD *)v6[4].i8;
            v7[6] = v6[6];
            *(_OWORD *)v7[2].i8 = v20;
            *(_OWORD *)v7[4].i8 = v21;
            *(_OWORD *)v7->i8 = v19;
          }
        }
        else
        {
          if (v7 != v4)
          {
            v22 = *(_OWORD *)v4->i8;
            v23 = *(_OWORD *)v4[2].i8;
            v24 = *(_OWORD *)v4[4].i8;
            v7[6] = v4[6];
            *(_OWORD *)v7[2].i8 = v23;
            *(_OWORD *)v7[4].i8 = v24;
            *(_OWORD *)v7->i8 = v22;
          }
          v4 += 7;
          v43 = v4;
          v18 = v6;
        }
        v7 += 7;
        if (v4 >= v13)
          break;
        v6 = v18;
      }
      while ((unint64_t)v18 < a3);
      v44 = v7;
    }
LABEL_42:
    sub_244EFD944((void **)&v44, (const void **)&v43, &v42);
    return 1;
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244EFD534(int8x8_t *__src, int8x8_t *a2, unint64_t a3, int8x8_t *__dst)
{
  int8x8_t *v4;
  int8x8_t *v6;
  int8x8_t *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  int8x8_t *v12;
  uint8x8_t v13;
  unint64_t v14;
  uint8x8_t v15;
  _BOOL4 v16;
  int8x8_t *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  int8x8_t *v22;
  unint64_t v23;
  int8x8_t *v24;
  int8x8_t *v25;
  int8x8_t v26;
  uint8x8_t v27;
  unint64_t v28;
  uint8x8_t v29;
  _BOOL4 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t result;
  char *v36;
  int8x8_t *v37;
  int8x8_t *v38;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = (char *)a2 - (char *)__src;
  v9 = ((char *)a2 - (char *)__src) / 40;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 40;
  v38 = __src;
  v37 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -39)
    {
      if (__dst != a2 || &a2[5 * v11] <= __dst)
        memmove(__dst, a2, 40 * v11);
      v22 = &v4[5 * v11];
      v36 = (char *)v22;
      v38 = v6;
      if (v7 < v6 && v10 >= 40)
      {
        v23 = a3 - 40;
        v24 = v6;
        while (1)
        {
          v25 = (int8x8_t *)(v23 + 40);
          v26 = v24[-5];
          v24 -= 5;
          v27 = (uint8x8_t)vcnt_s8(v22[-1]);
          v27.i16[0] = vaddlv_u8(v27);
          v28 = v27.u32[0];
          v29 = (uint8x8_t)vcnt_s8(v24[4]);
          v29.i16[0] = vaddlv_u8(v29);
          v30 = *(_QWORD *)&v22[-5] < *(_QWORD *)&v26;
          if (v28 != v29.u32[0])
            v30 = v28 < v29.u32[0];
          if (v30)
          {
            if (v25 != v6 || v23 >= (unint64_t)v6)
            {
              v31 = *(_OWORD *)v24->i8;
              v32 = *(_OWORD *)v24[2].i8;
              *(int8x8_t *)(v23 + 32) = v24[4];
              *(_OWORD *)v23 = v31;
              *(_OWORD *)(v23 + 16) = v32;
            }
            v38 = v24;
            if (v24 <= v7)
              goto LABEL_42;
          }
          else
          {
            v36 = (char *)&v22[-5];
            if (v25 < v22 || v23 >= (unint64_t)v22 || v25 != v22)
            {
              v33 = *(_OWORD *)v22[-5].i8;
              v34 = *(_OWORD *)v22[-3].i8;
              *(int8x8_t *)(v23 + 32) = v22[-1];
              *(_OWORD *)v23 = v33;
              *(_OWORD *)(v23 + 16) = v34;
            }
            v24 = v6;
            v22 -= 5;
            if (v6 <= v7)
              goto LABEL_42;
          }
          v23 -= 40;
          v6 = v24;
          if (v22 <= v4)
            goto LABEL_42;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -39)
  {
    if (__dst != __src || &__src[5 * v9] <= __dst)
      memmove(__dst, __src, 40 * v9);
    v12 = &v4[5 * v9];
    v36 = (char *)v12;
    if ((unint64_t)v6 < a3 && v8 >= 40)
    {
      do
      {
        v13 = (uint8x8_t)vcnt_s8(v6[4]);
        v13.i16[0] = vaddlv_u8(v13);
        v14 = v13.u32[0];
        v15 = (uint8x8_t)vcnt_s8(v4[4]);
        v15.i16[0] = vaddlv_u8(v15);
        v16 = *(uint64_t *)v6 < *(_QWORD *)v4;
        if (v14 != v15.u32[0])
          v16 = v14 < v15.u32[0];
        if (v16)
        {
          v17 = v6 + 5;
          if (v7 < v6 || v7 >= v17 || v7 != v6)
          {
            v18 = *(_OWORD *)v6->i8;
            v19 = *(_OWORD *)v6[2].i8;
            v7[4] = v6[4];
            *(_OWORD *)v7->i8 = v18;
            *(_OWORD *)v7[2].i8 = v19;
          }
        }
        else
        {
          if (v7 != v4)
          {
            v20 = *(_OWORD *)v4->i8;
            v21 = *(_OWORD *)v4[2].i8;
            v7[4] = v4[4];
            *(_OWORD *)v7->i8 = v20;
            *(_OWORD *)v7[2].i8 = v21;
          }
          v4 += 5;
          v37 = v4;
          v17 = v6;
        }
        v7 += 5;
        if (v4 >= v12)
          break;
        v6 = v17;
      }
      while ((unint64_t)v17 < a3);
      v38 = v7;
    }
LABEL_42:
    sub_244EFDA00((void **)&v38, (const void **)&v37, &v36);
    return 1;
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

char *sub_244EFD84C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4E8);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_244EFD944(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  size_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -56)
  {
    result = (char *)sub_244F1BB8C();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = 56 * (v4 / 56);
    if (result != v3 || result >= &v3[v6])
      return (char *)memmove(result, v3, v6);
  }
  return result;
}

char *sub_244EFDA00(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -40)
  {
    result = (char *)sub_244F1BB8C();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = v4 / 40;
    if (result != v3 || result >= &v3[40 * v6])
      return (char *)memmove(result, v3, 40 * v6);
  }
  return result;
}

char *sub_244EFDAB8(uint64_t a1)
{
  return sub_244EFD84C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_244EFDACC(_QWORD *a1)
{
  return sub_244F1788C(0, a1[2], 0, a1);
}

uint64_t sub_244EFDAE0(_QWORD *a1)
{
  return sub_244F184C8(0, a1[2], 0, a1);
}

uint64_t sub_244EFDAF4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  int64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = MEMORY[0x24BEE4AF8];
  if (!v3)
    return v4;
  v30 = MEMORY[0x24BEE4AF8];
  result = sub_244F17350(0, v3, 0);
  v8 = 0;
  v4 = v30;
  v27 = a2 - 65;
  v28 = a1 + 32;
  v24 = -(uint64_t)a2;
  v26 = a2;
  while (1)
  {
    v9 = (uint64_t *)(v28 + 48 * v8);
    v11 = *v9;
    v10 = v9[1];
    v12 = v9[2];
    v13 = *(_OWORD *)(v9 + 3);
    v14 = *((_DWORD *)v9 + 10);
    if (v27 <= 0xFFFFFFFFFFFFFF7ELL)
      goto LABEL_17;
    if ((a2 & 0x8000000000000000) != 0)
      break;
    if (a2 < 0x40)
    {
      v15 = (unint64_t)v13 >> a2;
      if ((unint64_t)v13 >> a2)
        goto LABEL_7;
    }
LABEL_17:
    v16 = 0;
LABEL_18:
    v29 = v13;
    v21 = *(_QWORD *)(v30 + 16);
    v22 = *(_QWORD *)(v30 + 24);
    result = swift_bridgeObjectRetain();
    if (v21 >= v22 >> 1)
      result = sub_244F17350(v22 > 1, v21 + 1, 1);
    ++v8;
    *(_QWORD *)(v30 + 16) = v21 + 1;
    v23 = v30 + 56 * v21;
    *(_QWORD *)(v23 + 32) = v16;
    *(_QWORD *)(v23 + 40) = v11;
    *(_QWORD *)(v23 + 48) = v10;
    *(_QWORD *)(v23 + 56) = v12;
    *(_OWORD *)(v23 + 64) = v29;
    *(_DWORD *)(v23 + 80) = v14;
    a2 = v26;
    if (v8 == v3)
      return v4;
  }
  if (a2 <= 0xFFFFFFFFFFFFFFC0)
    goto LABEL_17;
  v15 = (_QWORD)v13 << v24;
  if (!((_QWORD)v13 << v24))
    goto LABEL_17;
LABEL_7:
  v16 = 0;
  while (1)
  {
    v17 = __clz(__rbit64(v15));
    if (v17 >= *(_QWORD *)(*(_QWORD *)a3 + 16))
      break;
    v18 = *(_QWORD *)(*(_QWORD *)a3 + 32 + 8 * v17);
    v19 = __OFADD__(v16, v18);
    v16 += v18;
    if (v19)
      goto LABEL_23;
    if (v17 >= 0x40)
      v20 = -1;
    else
      v20 = (-1 << v17) - 1;
    v15 &= v20;
    if (!v15)
      goto LABEL_18;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_244EFDCC8(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  __int128 v18;
  uint64_t v19;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v19 = MEMORY[0x24BEE4AF8];
    sub_244F1746C(0, v2, 0);
    v3 = v19;
    v6 = *(_QWORD *)(a2 + 16);
    v7 = (uint64_t *)(a1 + 40);
    while (1)
    {
      v9 = *(v7 - 1);
      v8 = *v7;
      v10 = *(_QWORD *)(v6 + 16);
      swift_bridgeObjectRetain();
      if (!v10)
        break;
      swift_bridgeObjectRetain();
      v11 = sub_244F11EF0(v9, v8);
      if ((v12 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        break;
      }
      v18 = *(_OWORD *)(*(_QWORD *)(v6 + 56) + 32 * v11 + 16);
      swift_bridgeObjectRelease();
      v14 = *(_QWORD *)(v19 + 16);
      v13 = *(_QWORD *)(v19 + 24);
      if (v14 >= v13 >> 1)
        sub_244F1746C(v13 > 1, v14 + 1, 1);
      v7 += 2;
      *(_QWORD *)(v19 + 16) = v14 + 1;
      v15 = v19 + 32 * v14;
      *(_QWORD *)(v15 + 32) = v9;
      *(_QWORD *)(v15 + 40) = v8;
      *(_OWORD *)(v15 + 48) = v18;
      if (!--v2)
        return v3;
    }
    sub_244EFF408();
    swift_allocError();
    *v16 = v9;
    v16[1] = v8;
    swift_willThrow();
    swift_release();
  }
  return v3;
}

uint64_t sub_244EFDE38(uint64_t a1, unint64_t a2, uint64_t a3)
{
  int64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  uint64_t v25;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = MEMORY[0x24BEE4AF8];
  if (!v3)
    return v4;
  v25 = MEMORY[0x24BEE4AF8];
  result = sub_244F17450(0, v3, 0);
  v8 = 0;
  v4 = v25;
  v22 = -(uint64_t)a2;
  while (1)
  {
    v9 = a1 + 32 + 32 * v8;
    v10 = *(_QWORD *)v9;
    v11 = *(_QWORD *)(v9 + 8);
    v12 = *(_OWORD *)(v9 + 16);
    if (a2 - 65 <= 0xFFFFFFFFFFFFFF7ELL)
      goto LABEL_17;
    if ((a2 & 0x8000000000000000) != 0)
      break;
    if (a2 < 0x40)
    {
      v13 = *((_QWORD *)&v12 + 1) >> a2;
      if (*((_QWORD *)&v12 + 1) >> a2)
        goto LABEL_7;
    }
LABEL_17:
    v14 = 0;
LABEL_18:
    v24 = v12;
    v20 = *(_QWORD *)(v25 + 16);
    v19 = *(_QWORD *)(v25 + 24);
    result = swift_bridgeObjectRetain();
    if (v20 >= v19 >> 1)
      result = sub_244F17450(v19 > 1, v20 + 1, 1);
    ++v8;
    *(_QWORD *)(v25 + 16) = v20 + 1;
    v21 = v25 + 40 * v20;
    *(_QWORD *)(v21 + 32) = v14;
    *(_QWORD *)(v21 + 40) = v10;
    *(_QWORD *)(v21 + 48) = v11;
    *(_OWORD *)(v21 + 56) = v24;
    if (v8 == v3)
      return v4;
  }
  if (a2 <= 0xFFFFFFFFFFFFFFC0)
    goto LABEL_17;
  v13 = *((_QWORD *)&v12 + 1) << v22;
  if (!(*((_QWORD *)&v12 + 1) << v22))
    goto LABEL_17;
LABEL_7:
  v14 = 0;
  while (1)
  {
    v15 = __clz(__rbit64(v13));
    if (v15 >= *(_QWORD *)(*(_QWORD *)a3 + 16))
      break;
    v16 = *(_QWORD *)(*(_QWORD *)a3 + 32 + 8 * v15);
    v17 = __OFADD__(v14, v16);
    v14 += v16;
    if (v17)
      goto LABEL_23;
    if (v15 >= 0x40)
      v18 = -1;
    else
      v18 = (-1 << v15) - 1;
    v13 &= v18;
    if (!v13)
      goto LABEL_18;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

_QWORD *sub_244EFDFFC(_QWORD *result, char a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  char v34;
  unint64_t v35;
  char v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v3 = result[2];
  if (v3)
  {
    v6 = result;
    v8 = result[4];
    v7 = result[5];
    v41 = result[6];
    v9 = (_QWORD *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = sub_244F11EF0(v8, v7);
    v12 = v9[2];
    v13 = (v10 & 1) == 0;
    v14 = v12 + v13;
    if (__OFADD__(v12, v13))
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v15 = v10;
    if (v9[3] < v14)
    {
      sub_244F13168(v14, a2 & 1);
      v16 = sub_244F11EF0(v8, v7);
      if ((v15 & 1) != (v17 & 1))
      {
LABEL_28:
        result = (_QWORD *)sub_244F1BCC4();
        __break(1u);
        return result;
      }
      v11 = v16;
      v18 = (_QWORD *)*a3;
      if ((v15 & 1) == 0)
        goto LABEL_12;
LABEL_9:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v18[7] + 8 * v11) = v41;
      v19 = v3 - 1;
      if (v3 == 1)
        return (_QWORD *)swift_bridgeObjectRelease();
LABEL_16:
      for (i = v6 + 9; ; i += 3)
      {
        v26 = *(i - 2);
        v25 = *(i - 1);
        v27 = *i;
        v28 = (_QWORD *)*a3;
        swift_bridgeObjectRetain();
        v30 = sub_244F11EF0(v26, v25);
        v31 = v28[2];
        v32 = (v29 & 1) == 0;
        v33 = v31 + v32;
        if (__OFADD__(v31, v32))
          break;
        v34 = v29;
        if (v28[3] < v33)
        {
          sub_244F13168(v33, 1);
          v35 = sub_244F11EF0(v26, v25);
          if ((v34 & 1) != (v36 & 1))
            goto LABEL_28;
          v30 = v35;
        }
        v37 = (_QWORD *)*a3;
        if ((v34 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          *(_QWORD *)(v37[7] + 8 * v30) = v27;
        }
        else
        {
          v37[(v30 >> 6) + 8] |= 1 << v30;
          v38 = (uint64_t *)(v37[6] + 16 * v30);
          *v38 = v26;
          v38[1] = v25;
          *(_QWORD *)(v37[7] + 8 * v30) = v27;
          v39 = v37[2];
          v22 = __OFADD__(v39, 1);
          v40 = v39 + 1;
          if (v22)
            goto LABEL_27;
          v37[2] = v40;
        }
        if (!--v19)
          return (_QWORD *)swift_bridgeObjectRelease();
      }
      goto LABEL_26;
    }
    if ((a2 & 1) != 0)
    {
      v18 = (_QWORD *)*a3;
      if ((v10 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_244F12ADC();
      v18 = (_QWORD *)*a3;
      if ((v15 & 1) != 0)
        goto LABEL_9;
    }
LABEL_12:
    v18[(v11 >> 6) + 8] |= 1 << v11;
    v20 = (uint64_t *)(v18[6] + 16 * v11);
    *v20 = v8;
    v20[1] = v7;
    *(_QWORD *)(v18[7] + 8 * v11) = v41;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v18[2] = v23;
    v19 = v3 - 1;
    if (v3 == 1)
      return (_QWORD *)swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_244EFE27C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  swift_retain();
  v13 = (_QWORD *)sub_244EFDCC8(a4, a5);
  swift_bridgeObjectRelease();
  swift_release();
  if (v6)
    return swift_release();
  v14 = sub_244EFAEF4(v13, a3, a1, 0);
  if (*(_QWORD *)(v14 + 16))
  {
    v31 = a1;
    v16 = *(_QWORD *)(v14 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v17 = sub_244EFBC88(v16);
    swift_bridgeObjectRelease();
    v18 = *(_QWORD *)(v17 + 16);
    v32 = v17;
    if (v18)
    {
      v28 = a2;
      v29 = a6;
      v30 = a3;
      swift_bridgeObjectRetain_n();
      v19 = (uint64_t *)(v17 + 48);
      v20 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        v22 = *(v19 - 1);
        if (v22)
        {
          v23 = *(v19 - 2);
          v24 = *v19;
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v20 = sub_244F07F9C(0, v20[2] + 1, 1, v20);
          v26 = v20[2];
          v25 = v20[3];
          if (v26 >= v25 >> 1)
            v20 = sub_244F07F9C((_QWORD *)(v25 > 1), v26 + 1, 1, v20);
          v20[2] = v26 + 1;
          v21 = &v20[3 * v26];
          v21[4] = v23;
          v21[5] = v22;
          v21[6] = v24;
        }
        v19 += 4;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease_n();
      a6 = v29;
      a3 = v30;
      a2 = v28;
      if (v20[2])
        goto LABEL_15;
    }
    else
    {
      v20 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
      {
LABEL_15:
        __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4B8);
        v27 = sub_244F1BB80();
LABEL_18:
        v33 = v27;
        sub_244EFDFFC(v20, 1, &v33);
        swift_release();
        result = swift_bridgeObjectRelease();
        *a6 = v33;
        a6[1] = v31;
        a6[2] = a2;
        a6[3] = a3;
        a6[4] = v32;
        return result;
      }
    }
    v27 = MEMORY[0x24BEE4B00];
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();
  __break(1u);
  swift_bridgeObjectRelease();
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_244EFE4F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;

  v3 = a1 - a2;
  if (__OFSUB__(a1, a2))
  {
LABEL_17:
    __break(1u);
  }
  else if ((v3 & 0x8000000000000000) == 0)
  {
    if (v3)
    {
      v5 = sub_244F1B97C();
      *(_QWORD *)(v5 + 16) = v3;
      bzero((void *)(v5 + 32), 8 * v3);
      v6 = *(_QWORD *)(a3 + 16);
      if (!v6)
        return 3;
    }
    else
    {
      v5 = MEMORY[0x24BEE4AF8];
      v6 = *(_QWORD *)(a3 + 16);
      if (!v6)
        return 3;
    }
    swift_bridgeObjectRetain();
    v7 = (uint64_t *)(a3 + 56);
    while (1)
    {
      if (*(v7 - 2))
      {
        v8 = *(v7 - 1);
        v9 = *v7;
        swift_bridgeObjectRetain();
        if ((v8 & 0x8000000000000000) != 0)
        {
          __break(1u);
          goto LABEL_17;
        }
        if (v8 >= *(_QWORD *)(v5 + 16))
        {
          __break(1u);
LABEL_14:
          swift_bridgeObjectRelease();
          return 3;
        }
        *(_QWORD *)(v5 + 32 + 8 * v8) = v9;
        swift_bridgeObjectRelease();
      }
      v7 += 4;
      if (!--v6)
        goto LABEL_14;
    }
  }
  result = sub_244F1BB44();
  __break(1u);
  return result;
}

unint64_t sub_244EFE634()
{
  unint64_t result;

  result = qword_25742C430;
  if (!qword_25742C430)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DE14, &type metadata for Settings.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C430);
  }
  return result;
}

unint64_t sub_244EFE678()
{
  unint64_t result;

  result = qword_25742C448;
  if (!qword_25742C448)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E4FC, &type metadata for PMUInfo);
    atomic_store(result, (unint64_t *)&qword_25742C448);
  }
  return result;
}

uint64_t sub_244EFE6BC()
{
  return sub_244EF32A4(&qword_25742C460, &qword_25742C468, (uint64_t (*)(void))sub_244EFE6E0, MEMORY[0x24BEE4AA8]);
}

unint64_t sub_244EFE6E0()
{
  unint64_t result;

  result = qword_25742C470;
  if (!qword_25742C470)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DDEC, &type metadata for EventSetting);
    atomic_store(result, (unint64_t *)&qword_25742C470);
  }
  return result;
}

uint64_t sub_244EFE724(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265746E756F63 && a2 == 0xE700000000000000 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x726F7463656C6573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_244F1BCA0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_244EFE868(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  char v11;
  char v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4B0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EFF380();
  sub_244F1BD24();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v12 = 0;
    v7 = sub_244F1BBD4();
    v11 = 1;
    swift_bridgeObjectRetain();
    sub_244F1BBE0();
    v10 = 2;
    sub_244F1BC04();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_244EFEA28(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x436F5473656D616ELL && a2 == 0xEF737265746E756FLL;
  if (v2 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F666E49756D70 && a2 == 0xE700000000000000 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746553746E657665 && a2 == 0xED000073676E6974)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_244F1BCA0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_244EFEBC4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EFE634();
  sub_244F1BD24();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C438);
  v20 = 0;
  sub_244EFF44C(&qword_25742C500, MEMORY[0x24BEE0D38], MEMORY[0x24BEE1798], MEMORY[0x24BEE04E0]);
  sub_244F1BBEC();
  v9 = v17;
  v20 = 1;
  sub_244EFF4B0();
  swift_bridgeObjectRetain();
  sub_244F1BBEC();
  v15 = v18;
  v16 = v17;
  v14 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C450);
  v20 = 2;
  sub_244EF32A4(&qword_25742C510, &qword_25742C450, sub_244EFF4F4, MEMORY[0x24BEE12D0]);
  sub_244F1BBEC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = v17;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v12 = v16;
  *a2 = v9;
  a2[1] = v12;
  v13 = v14;
  a2[2] = v15;
  a2[3] = v13;
  a2[4] = v10;
  return result;
}

uint64_t destroy for KPCSettings()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s7Recount11KPCSettingsVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for KPCSettings(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for KPCSettings(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for KPCSettings(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for KPCSettings(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for KPCSettings()
{
  return &type metadata for KPCSettings;
}

uint64_t destroy for Settings()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Settings(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Settings(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Settings(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Settings(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Settings(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Settings()
{
  return &type metadata for Settings;
}

ValueMetadata *type metadata accessor for EventSetting()
{
  return &type metadata for EventSetting;
}

ValueMetadata *type metadata accessor for Settings.CodingKeys()
{
  return &type metadata for Settings.CodingKeys;
}

unint64_t sub_244EFF1F8()
{
  unint64_t result;

  result = qword_25742C478;
  if (!qword_25742C478)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DD58, &type metadata for Settings.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C478);
  }
  return result;
}

unint64_t sub_244EFF23C(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_244EFF268();
  result = sub_244EFF2AC();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_244EFF268()
{
  unint64_t result;

  result = qword_25742C480;
  if (!qword_25742C480)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D364, &type metadata for Event);
    atomic_store(result, (unint64_t *)&qword_25742C480);
  }
  return result;
}

unint64_t sub_244EFF2AC()
{
  unint64_t result;

  result = qword_25742C488;
  if (!qword_25742C488)
  {
    result = MEMORY[0x24952AE28](&unk_244F1D38C, &type metadata for Event);
    atomic_store(result, (unint64_t *)&qword_25742C488);
  }
  return result;
}

unint64_t sub_244EFF2F4()
{
  unint64_t result;

  result = qword_25742C490;
  if (!qword_25742C490)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DCC8, &type metadata for Settings.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C490);
  }
  return result;
}

unint64_t sub_244EFF33C()
{
  unint64_t result;

  result = qword_25742C498;
  if (!qword_25742C498)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DCF0, &type metadata for Settings.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C498);
  }
  return result;
}

unint64_t sub_244EFF380()
{
  unint64_t result;

  result = qword_25742C4A8;
  if (!qword_25742C4A8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DFD8, &type metadata for EventSetting.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C4A8);
  }
  return result;
}

unint64_t sub_244EFF3C4()
{
  unint64_t result;

  result = qword_25742C4D0;
  if (!qword_25742C4D0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E044, &type metadata for PlacementError);
    atomic_store(result, (unint64_t *)&qword_25742C4D0);
  }
  return result;
}

unint64_t sub_244EFF408()
{
  unint64_t result;

  result = qword_25742C4F0;
  if (!qword_25742C4F0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DF98, &type metadata for Settings.EventError);
    atomic_store(result, (unint64_t *)&qword_25742C4F0);
  }
  return result;
}

uint64_t sub_244EFF44C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742C438);
    v10[0] = a2;
    v10[1] = a3;
    result = MEMORY[0x24952AE28](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_244EFF4B0()
{
  unint64_t result;

  result = qword_25742C508;
  if (!qword_25742C508)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E4D4, &type metadata for PMUInfo);
    atomic_store(result, (unint64_t *)&qword_25742C508);
  }
  return result;
}

uint64_t sub_244EFF4F4()
{
  return sub_244EF32A4(&qword_25742C518, &qword_25742C468, (uint64_t (*)(void))sub_244EFF518, MEMORY[0x24BEE4AC0]);
}

unint64_t sub_244EFF518()
{
  unint64_t result;

  result = qword_25742C520;
  if (!qword_25742C520)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DDA8, &type metadata for EventSetting);
    atomic_store(result, (unint64_t *)&qword_25742C520);
  }
  return result;
}

uint64_t sub_244EFF55C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *initializeBufferWithCopyOfBuffer for Settings.EventError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Settings.EventError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for Settings.EventError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Settings.EventError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Settings.EventError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Settings.EventError()
{
  return &type metadata for Settings.EventError;
}

uint64_t _s7Recount8SettingsV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244EFF720 + 4 * byte_244F1DC3D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_244EFF754 + 4 * byte_244F1DC38[v4]))();
}

uint64_t sub_244EFF754(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EFF75C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244EFF764);
  return result;
}

uint64_t sub_244EFF770(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244EFF778);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_244EFF77C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244EFF784(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EventSetting.CodingKeys()
{
  return &type metadata for EventSetting.CodingKeys;
}

unint64_t sub_244EFF7A4()
{
  unint64_t result;

  result = qword_25742C540;
  if (!qword_25742C540)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DF00, &type metadata for EventSetting.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C540);
  }
  return result;
}

unint64_t sub_244EFF7F0()
{
  unint64_t result;

  result = qword_25742C548;
  if (!qword_25742C548)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DE70, &type metadata for EventSetting.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C548);
  }
  return result;
}

unint64_t sub_244EFF838()
{
  unint64_t result;

  result = qword_25742C550;
  if (!qword_25742C550)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DE98, &type metadata for EventSetting.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C550);
  }
  return result;
}

_QWORD *sub_244EFF890(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for PlacementError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PlacementError(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PlacementError()
{
  return &type metadata for PlacementError;
}

BOOL static CPUKind.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t CPUKind.hash(into:)()
{
  return sub_244F1BD0C();
}

uint64_t sub_244EFF9B8()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6E65696369666665;
  if (*v0 != 1)
    v1 = 0x616D726F66726570;
  if (*v0)
    return v1;
  else
    return 0x647261646E617473;
}

uint64_t sub_244EFFA20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244EFFFC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244EFFA44()
{
  sub_244EFFE20();
  return sub_244F1BD60();
}

uint64_t sub_244EFFA6C()
{
  sub_244EFFE20();
  return sub_244F1BD6C();
}

uint64_t sub_244EFFA94()
{
  return 0;
}

uint64_t sub_244EFFAA0()
{
  sub_244EFFEA8();
  return sub_244F1BD60();
}

uint64_t sub_244EFFAC8()
{
  sub_244EFFEA8();
  return sub_244F1BD6C();
}

uint64_t sub_244EFFAF0()
{
  sub_244EFFE64();
  return sub_244F1BD60();
}

uint64_t sub_244EFFB18()
{
  sub_244EFFE64();
  return sub_244F1BD6C();
}

uint64_t sub_244EFFB40@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_244EFFB6C()
{
  sub_244EFFEEC();
  return sub_244F1BD60();
}

uint64_t sub_244EFFB94()
{
  sub_244EFFEEC();
  return sub_244F1BD6C();
}

uint64_t CPUKind.encode(to:)(_QWORD *a1, int a2)
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
  char *v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char v25;
  char v26;
  char v27;

  v24 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C558);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v20 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C560);
  v18 = *(_QWORD *)(v5 - 8);
  v19 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C568);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C570);
  v23 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EFFE20();
  sub_244F1BD30();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      v26 = 1;
      sub_244EFFEA8();
      sub_244F1BC1C();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v19);
    }
    else
    {
      v27 = 2;
      sub_244EFFE64();
      v15 = v20;
      sub_244F1BC1C();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v22);
    }
  }
  else
  {
    v25 = 0;
    sub_244EFFEEC();
    sub_244F1BC1C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v12);
}

unint64_t sub_244EFFE20()
{
  unint64_t result;

  result = qword_25742C578;
  if (!qword_25742C578)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E470, &type metadata for CPUKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C578);
  }
  return result;
}

unint64_t sub_244EFFE64()
{
  unint64_t result;

  result = qword_25742C580;
  if (!qword_25742C580)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E420, &type metadata for CPUKind.PerformanceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C580);
  }
  return result;
}

unint64_t sub_244EFFEA8()
{
  unint64_t result;

  result = qword_25742C588;
  if (!qword_25742C588)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E3D0, &type metadata for CPUKind.EfficiencyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C588);
  }
  return result;
}

unint64_t sub_244EFFEEC()
{
  unint64_t result;

  result = qword_25742C590;
  if (!qword_25742C590)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E380, &type metadata for CPUKind.StandardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C590);
  }
  return result;
}

uint64_t CPUKind.hashValue.getter()
{
  sub_244F1BD00();
  sub_244F1BD0C();
  return sub_244F1BD18();
}

_QWORD *CPUKind.init(from:)(_QWORD *a1)
{
  return sub_244F00140(a1);
}

_QWORD *sub_244EFFF88@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_244F00140(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_244EFFFB0(_QWORD *a1)
{
  unsigned __int8 *v1;

  return CPUKind.encode(to:)(a1, *v1);
}

uint64_t sub_244EFFFC8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x647261646E617473 && a2 == 0xE800000000000000;
  if (v2 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65696369666665 && a2 == 0xEA00000000007963 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x616D726F66726570 && a2 == 0xEB0000000065636ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_244F1BCA0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

_QWORD *sub_244F00140(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  _QWORD *v30;
  char v31;
  char v32;
  char v33;

  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C5E8);
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C5F0);
  v23 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C5F8);
  v4 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C600);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244EFFE20();
  v11 = (uint64_t)v30;
  sub_244F1BD24();
  if (v11)
    goto LABEL_7;
  v21 = v4;
  v22 = v8;
  v12 = v29;
  v30 = a1;
  v13 = v10;
  v14 = sub_244F1BC10();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v18 = sub_244F1BAE4();
    swift_allocError();
    v10 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C608);
    *v10 = &type metadata for CPUKind;
    sub_244F1BBB0();
    sub_244F1BAD8();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v10, *MEMORY[0x24BEE26D0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v10;
  }
  v10 = (_QWORD *)*(unsigned __int8 *)(v14 + 32);
  if (*(_BYTE *)(v14 + 32))
  {
    if ((_DWORD)v10 == 1)
    {
      v32 = 1;
      sub_244EFFEA8();
      v16 = v28;
      sub_244F1BBA4();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v26);
    }
    else
    {
      v33 = 2;
      sub_244EFFE64();
      sub_244F1BBA4();
      v17 = v22;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v27);
    }
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v17 + 8))(v13, v15);
  }
  else
  {
    v31 = 0;
    sub_244EFFEEC();
    sub_244F1BBA4();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v13, v7);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v10;
}

unint64_t sub_244F0051C()
{
  unint64_t result;

  result = qword_25742C598;
  if (!qword_25742C598)
  {
    result = MEMORY[0x24952AE28](&protocol conformance descriptor for CPUKind, &type metadata for CPUKind);
    atomic_store(result, (unint64_t *)&qword_25742C598);
  }
  return result;
}

ValueMetadata *type metadata accessor for CPUKind()
{
  return &type metadata for CPUKind;
}

uint64_t _s7Recount7CPUKindOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244F005C0 + 4 * byte_244F1E095[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_244F005F4 + 4 * byte_244F1E090[v4]))();
}

uint64_t sub_244F005F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F005FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244F00604);
  return result;
}

uint64_t sub_244F00610(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244F00618);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_244F0061C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F00624(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CPUKind.CodingKeys()
{
  return &type metadata for CPUKind.CodingKeys;
}

ValueMetadata *type metadata accessor for CPUKind.StandardCodingKeys()
{
  return &type metadata for CPUKind.StandardCodingKeys;
}

ValueMetadata *type metadata accessor for CPUKind.EfficiencyCodingKeys()
{
  return &type metadata for CPUKind.EfficiencyCodingKeys;
}

ValueMetadata *type metadata accessor for CPUKind.PerformanceCodingKeys()
{
  return &type metadata for CPUKind.PerformanceCodingKeys;
}

unint64_t sub_244F00674()
{
  unint64_t result;

  result = qword_25742C5A0;
  if (!qword_25742C5A0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E358, &type metadata for CPUKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C5A0);
  }
  return result;
}

unint64_t sub_244F006BC()
{
  unint64_t result;

  result = qword_25742C5A8;
  if (!qword_25742C5A8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E278, &type metadata for CPUKind.StandardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C5A8);
  }
  return result;
}

unint64_t sub_244F00704()
{
  unint64_t result;

  result = qword_25742C5B0;
  if (!qword_25742C5B0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E2A0, &type metadata for CPUKind.StandardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C5B0);
  }
  return result;
}

unint64_t sub_244F0074C()
{
  unint64_t result;

  result = qword_25742C5B8;
  if (!qword_25742C5B8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E228, &type metadata for CPUKind.EfficiencyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C5B8);
  }
  return result;
}

unint64_t sub_244F00794()
{
  unint64_t result;

  result = qword_25742C5C0;
  if (!qword_25742C5C0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E250, &type metadata for CPUKind.EfficiencyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C5C0);
  }
  return result;
}

unint64_t sub_244F007DC()
{
  unint64_t result;

  result = qword_25742C5C8;
  if (!qword_25742C5C8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E1D8, &type metadata for CPUKind.PerformanceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C5C8);
  }
  return result;
}

unint64_t sub_244F00824()
{
  unint64_t result;

  result = qword_25742C5D0;
  if (!qword_25742C5D0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E200, &type metadata for CPUKind.PerformanceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C5D0);
  }
  return result;
}

unint64_t sub_244F0086C()
{
  unint64_t result;

  result = qword_25742C5D8;
  if (!qword_25742C5D8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E2C8, &type metadata for CPUKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C5D8);
  }
  return result;
}

unint64_t sub_244F008B4()
{
  unint64_t result;

  result = qword_25742C5E0;
  if (!qword_25742C5E0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E2F0, &type metadata for CPUKind.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C5E0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PMUInfo(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PMUInfo(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PMUInfo()
{
  return &type metadata for PMUInfo;
}

uint64_t sub_244F00958(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];
  char v11;
  char v12;
  char v13;

  v10[1] = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C610);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244F00BC4();
  sub_244F1BD30();
  v13 = 0;
  sub_244F1BC58();
  if (!v3)
  {
    v12 = 1;
    sub_244F1BC58();
    v11 = 2;
    sub_244F1BC58();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_244F00AA4()
{
  _BYTE *v0;
  int v1;
  unint64_t v2;

  v1 = *v0;
  v2 = 0xD000000000000011;
  if (v1 != 1)
    v2 = 0xD000000000000012;
  if (*v0)
    return v2;
  else
    return 0x437265746E756F63;
}

uint64_t sub_244F00B08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244F00C08(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244F00B2C()
{
  sub_244F00BC4();
  return sub_244F1BD60();
}

uint64_t sub_244F00B54()
{
  sub_244F00BC4();
  return sub_244F1BD6C();
}

uint64_t sub_244F00B7C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_244F00D68(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_244F00BA8(_QWORD *a1)
{
  uint64_t *v1;

  return sub_244F00958(a1, *v1, v1[1]);
}

unint64_t sub_244F00BC4()
{
  unint64_t result;

  result = qword_25742C618;
  if (!qword_25742C618)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E5E8, &type metadata for PMUInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C618);
  }
  return result;
}

uint64_t sub_244F00C08(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x437265746E756F63 && a2 == 0xEC000000746E756FLL;
  if (v2 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000244F201F0 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000244F20210)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_244F1BCA0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_244F00D68(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE v8[16];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C620);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244F00BC4();
  sub_244F1BD24();
  v8[15] = 0;
  v6 = sub_244F1BBE0();
  v8[14] = 1;
  sub_244F1BBE0();
  v8[13] = 2;
  sub_244F1BBE0();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v6;
}

uint64_t storeEnumTagSinglePayload for PMUInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244F00F2C + 4 * byte_244F1E4C5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_244F00F60 + 4 * byte_244F1E4C0[v4]))();
}

uint64_t sub_244F00F60(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F00F68(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244F00F70);
  return result;
}

uint64_t sub_244F00F7C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244F00F84);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_244F00F88(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F00F90(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PMUInfo.CodingKeys()
{
  return &type metadata for PMUInfo.CodingKeys;
}

unint64_t sub_244F00FB0()
{
  unint64_t result;

  result = qword_25742C628;
  if (!qword_25742C628)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E5C0, &type metadata for PMUInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C628);
  }
  return result;
}

unint64_t sub_244F00FF8()
{
  unint64_t result;

  result = qword_25742C630;
  if (!qword_25742C630)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E530, &type metadata for PMUInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C630);
  }
  return result;
}

unint64_t sub_244F01040()
{
  unint64_t result;

  result = qword_25742C638;
  if (!qword_25742C638)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E558, &type metadata for PMUInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C638);
  }
  return result;
}

uint64_t Metric.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Metric.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Metric.displayDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Metric.displayColor.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Metric.displayOrder.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t Metric.displayDocumentation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Metric.displayCommentary.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Metric.expression.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_244F011C0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244F011EC + 4 * byte_244F1E638[a1]))(1701667182, 0xE400000000000000);
}

uint64_t sub_244F011EC()
{
  return 0x4E79616C70736964;
}

unint64_t sub_244F0120C()
{
  return 0xD000000000000012;
}

unint64_t sub_244F01284()
{
  return 0xD000000000000011;
}

uint64_t sub_244F012A0()
{
  return 0x6973736572707865;
}

uint64_t sub_244F012BC()
{
  unsigned __int8 *v0;

  return sub_244F011C0(*v0);
}

uint64_t sub_244F012C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244F01668(a1, a2);
  *a3 = result;
  return result;
}

void sub_244F012E8(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_244F012F4()
{
  sub_244F01548();
  return sub_244F1BD60();
}

uint64_t sub_244F0131C()
{
  sub_244F01548();
  return sub_244F1BD6C();
}

uint64_t Metric.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C640);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244F01548();
  sub_244F1BD30();
  v8[15] = 0;
  sub_244F1BC34();
  if (!v1)
  {
    v8[14] = 1;
    sub_244F1BC34();
    v8[13] = 2;
    sub_244F1BC34();
    v8[12] = 3;
    sub_244F1BC34();
    v8[11] = 4;
    sub_244F1BC58();
    v8[10] = 5;
    sub_244F1BC34();
    v8[9] = 6;
    sub_244F1BC28();
    v8[8] = 7;
    sub_244F1BC34();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_244F01548()
{
  unint64_t result;

  result = qword_25742C648;
  if (!qword_25742C648)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E76C, &type metadata for Metric.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C648);
  }
  return result;
}

double Metric.init(from:)@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  sub_244F019DC(a1, (uint64_t *)v8);
  if (!v2)
  {
    v5 = v12;
    *(_OWORD *)(a2 + 64) = v11;
    *(_OWORD *)(a2 + 80) = v5;
    *(_OWORD *)(a2 + 96) = v13;
    *(_QWORD *)(a2 + 112) = v14;
    v6 = v8[1];
    *(_OWORD *)a2 = v8[0];
    *(_OWORD *)(a2 + 16) = v6;
    result = *(double *)&v9;
    v7 = v10;
    *(_OWORD *)(a2 + 32) = v9;
    *(_OWORD *)(a2 + 48) = v7;
  }
  return result;
}

double sub_244F015F0@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  sub_244F019DC(a1, (uint64_t *)v8);
  if (!v2)
  {
    v5 = v12;
    *(_OWORD *)(a2 + 64) = v11;
    *(_OWORD *)(a2 + 80) = v5;
    *(_OWORD *)(a2 + 96) = v13;
    *(_QWORD *)(a2 + 112) = v14;
    v6 = v8[1];
    *(_OWORD *)a2 = v8[0];
    *(_OWORD *)(a2 + 16) = v6;
    result = *(double *)&v9;
    v7 = v10;
    *(_OWORD *)(a2 + 32) = v9;
    *(_OWORD *)(a2 + 48) = v7;
  }
  return result;
}

uint64_t sub_244F01654(_QWORD *a1)
{
  return Metric.encode(to:)(a1);
}

uint64_t sub_244F01668(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000244F1F610 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4379616C70736964 && a2 == 0xEC000000726F6C6FLL || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4F79616C70736964 && a2 == 0xEC00000072656472 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000244F1FFB0 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000244F1FFD0 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6973736572707865 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_244F1BCA0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_244F019DC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
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
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C668);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244F01548();
  sub_244F1BD24();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v53 = 0;
  v9 = sub_244F1BBD4();
  v11 = v10;
  v52 = 1;
  swift_bridgeObjectRetain();
  v43 = sub_244F1BBD4();
  v44 = v9;
  v51 = 2;
  v13 = v12;
  swift_bridgeObjectRetain();
  v14 = sub_244F1BBD4();
  v45 = v13;
  v42 = v14;
  v50 = 3;
  v16 = v15;
  swift_bridgeObjectRetain();
  v40 = sub_244F1BBD4();
  v41 = v16;
  v49 = 4;
  v18 = v17;
  swift_bridgeObjectRetain();
  v38 = sub_244F1BBE0();
  v48 = 5;
  v37 = sub_244F1BBD4();
  v47 = 6;
  v39 = v19;
  swift_bridgeObjectRetain();
  v35 = sub_244F1BBBC();
  v36 = v20;
  v46 = 7;
  swift_bridgeObjectRetain();
  v21 = sub_244F1BBD4();
  v23 = v22;
  v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  v34 = v21;
  v24(v8, v5);
  swift_bridgeObjectRetain();
  v25 = v45;
  swift_bridgeObjectRetain();
  v26 = v41;
  swift_bridgeObjectRetain();
  v27 = v18;
  swift_bridgeObjectRetain();
  v28 = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  v29 = v36;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a2 = v44;
  a2[1] = v11;
  a2[2] = v43;
  a2[3] = v25;
  a2[4] = v42;
  a2[5] = v26;
  a2[6] = v40;
  a2[7] = v27;
  v31 = v37;
  a2[8] = v38;
  a2[9] = v31;
  v32 = v35;
  a2[10] = v28;
  a2[11] = v32;
  v33 = v34;
  a2[12] = v29;
  a2[13] = v33;
  a2[14] = v23;
  return result;
}

uint64_t destroy for Metric()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metric(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v8;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Metric(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for Metric(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metric(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Metric(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Metric()
{
  return &type metadata for Metric;
}

uint64_t getEnumTagSinglePayload for Metric.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Metric.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_244F02394 + 4 * byte_244F1E645[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_244F023C8 + 4 * byte_244F1E640[v4]))();
}

uint64_t sub_244F023C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F023D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244F023D8);
  return result;
}

uint64_t sub_244F023E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244F023ECLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_244F023F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F023F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Metric.CodingKeys()
{
  return &type metadata for Metric.CodingKeys;
}

unint64_t sub_244F02418()
{
  unint64_t result;

  result = qword_25742C650;
  if (!qword_25742C650)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E744, &type metadata for Metric.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C650);
  }
  return result;
}

unint64_t sub_244F02460()
{
  unint64_t result;

  result = qword_25742C658;
  if (!qword_25742C658)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E6B4, &type metadata for Metric.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C658);
  }
  return result;
}

unint64_t sub_244F024A8()
{
  unint64_t result;

  result = qword_25742C660;
  if (!qword_25742C660)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E6DC, &type metadata for Metric.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C660);
  }
  return result;
}

__n128 Silicon.init()@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v4;
  _OWORD v5[5];

  sub_244F02C08((uint64_t)v5);
  if (!v1)
  {
    v4 = v5[3];
    *(_OWORD *)(a1 + 32) = v5[2];
    *(_OWORD *)(a1 + 48) = v4;
    *(_OWORD *)(a1 + 64) = v5[4];
    result = (__n128)v5[1];
    *(_OWORD *)a1 = v5[0];
    *(__n128 *)(a1 + 16) = result;
  }
  return result;
}

uint64_t Silicon.marketingName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Silicon.platform.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

char *sub_244F0258C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  char *result;
  unint64_t v5;

  if ((a3 & 0x100000000) == 0)
  {
    sub_244F1BAB4();
    swift_bridgeObjectRelease();
    v5 = 0xD00000000000001DLL;
    sub_244F1B8A4();
    return (char *)v5;
  }
  v3 = a3;
  sub_244F1BAB4();
  swift_bridgeObjectRelease();
  v5 = 0xD000000000000010;
  sub_244F1B8A4();
  sub_244F1B8A4();
  result = strerror(v3);
  if (result)
  {
    sub_244F1B8B0();
    sub_244F1B8A4();
    swift_bridgeObjectRelease();
    return (char *)v5;
  }
  __break(1u);
  return result;
}

char *sub_244F026AC()
{
  uint64_t v0;

  return sub_244F0258C(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32));
}

uint64_t sub_244F026D0()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned int v7;
  size_t v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v8[0] = 4;
  v7 = 0;
  sub_244F1B8A4();
  v0 = sub_244F1B85C();
  v1 = sysctlbyname((const char *)(v0 + 32), &v7, v8, 0, 0);
  v2 = v7;
  swift_release();
  if (v1 < 0)
  {
    v3 = swift_bridgeObjectRetain();
    v4 = MEMORY[0x24952A414](v3);
    sub_244F038E0();
    swift_allocError();
    *(_QWORD *)v5 = 0x206C7463737973;
    *(_QWORD *)(v5 + 8) = 0xE700000000000000;
    *(_DWORD *)(v5 + 16) = v4;
    *(_BYTE *)(v5 + 20) = 1;
    swift_willThrow();
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_244F027FC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244F02838 + 4 * byte_244F1E7C0[*v0]))(0x6E6974656B72616DLL, 0xED0000656D614E67);
}

uint64_t sub_244F02838()
{
  return 0x6D726F6674616C70;
}

uint64_t sub_244F02850()
{
  return 0x65707954757063;
}

uint64_t sub_244F02868()
{
  return 0x7974627553757063;
}

uint64_t sub_244F02884()
{
  return 0x6C696D6146757063;
}

uint64_t sub_244F028A4()
{
  return 1970106467;
}

uint64_t sub_244F028B4()
{
  return 0x746E6174736E6F63;
}

uint64_t sub_244F028D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244F02FA4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244F028F4()
{
  sub_244F02EDC();
  return sub_244F1BD60();
}

uint64_t sub_244F0291C()
{
  sub_244F02EDC();
  return sub_244F1BD6C();
}

uint64_t Silicon.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  __int128 v12;
  uint64_t v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C670);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244F02EDC();
  sub_244F1BD30();
  LOBYTE(v12) = 0;
  sub_244F1BC34();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_244F1BC34();
    LOBYTE(v12) = 2;
    sub_244F1BC70();
    LOBYTE(v12) = 3;
    sub_244F1BC70();
    LOBYTE(v12) = 4;
    sub_244F1BC70();
    v12 = *(_OWORD *)(v3 + 48);
    v13 = *(_QWORD *)(v3 + 64);
    v11 = 5;
    sub_244EFE678();
    sub_244F1BC64();
    *(_QWORD *)&v12 = *(_QWORD *)(v3 + 72);
    v11 = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C680);
    sub_244F02F20();
    sub_244F1BC64();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

__n128 Silicon.init(from:)@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[5];

  sub_244F032B8(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

__n128 sub_244F02BAC@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[5];

  sub_244F032B8(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_244F02BF4(_QWORD *a1)
{
  return Silicon.encode(to:)(a1);
}

void sub_244F02C08(uint64_t a1@<X8>)
{
  uint64_t v1;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unsigned int counter_count;

  v3 = (id)MobileGestalt_get_current_device();
  if (!v3 || (v4 = (id)MobileGestalt_copy_hardwarePlatform_obj()) == 0)
  {
    sub_244F038E0();
    swift_allocError();
    *(_QWORD *)v16 = 0xD000000000000010;
    *(_QWORD *)(v16 + 8) = 0x8000000244F20230;
    *(_DWORD *)(v16 + 16) = 0;
    *(_BYTE *)(v16 + 20) = 0;
    swift_willThrow();

    return;
  }
  v5 = v4;
  v6 = sub_244F1B808();
  v8 = v7;

  swift_bridgeObjectRetain();
  v9 = (id)MobileGestalt_copy_marketingSOCNameString_obj();
  if (!v9)
  {
    v9 = (id)MobileGestalt_copy_physicalHardwareNameString_obj();
    if (!v9)
    {
      swift_bridgeObjectRelease();
      sub_244F038E0();
      swift_allocError();
      *(_QWORD *)v17 = 0xD000000000000030;
      *(_QWORD *)(v17 + 8) = 0x8000000244F20250;
      *(_DWORD *)(v17 + 16) = 0;
      *(_BYTE *)(v17 + 20) = 0;
      swift_willThrow();
      goto LABEL_8;
    }
  }
  v10 = sub_244F1B808();
  v12 = v11;

  swift_bridgeObjectRetain();
  v13 = sub_244F026D0();
  if (v1)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
LABEL_8:

    swift_bridgeObjectRelease();
    return;
  }
  v14 = v13;
  v15 = sub_244F026D0();
  v22 = sub_244F026D0();
  counter_count = kpc_get_counter_count();
  v18 = kpc_get_counter_count();
  v21 = counter_count + v18;
  if (__CFADD__(counter_count, v18))
  {
    __break(1u);
  }
  else
  {
    v20 = v18;
    v19 = sub_244F04BDC(MEMORY[0x24BEE4AF8]);

    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_QWORD *)a1 = v10;
    *(_QWORD *)(a1 + 8) = v12;
    *(_QWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 24) = v8;
    *(_DWORD *)(a1 + 32) = v14;
    *(_DWORD *)(a1 + 36) = v15;
    *(_DWORD *)(a1 + 40) = v22;
    *(_QWORD *)(a1 + 48) = v21;
    *(_QWORD *)(a1 + 56) = counter_count;
    *(_QWORD *)(a1 + 64) = v20;
    *(_QWORD *)(a1 + 72) = v19;
  }
}

unint64_t sub_244F02EDC()
{
  unint64_t result;

  result = qword_25742C678;
  if (!qword_25742C678)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E8FC, &type metadata for Silicon.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C678);
  }
  return result;
}

unint64_t sub_244F02F20()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25742C688;
  if (!qword_25742C688)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742C680);
    v2 = sub_244F03880(&qword_25742C690, MEMORY[0x24BEE13D8], MEMORY[0x24BEE12A0]);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x24952AE28](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25742C688);
  }
  return result;
}

uint64_t sub_244F02FA4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6974656B72616DLL && a2 == 0xED0000656D614E67;
  if (v2 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65707954757063 && a2 == 0xE700000000000000 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7974627553757063 && a2 == 0xEA00000000006570 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C696D6146757063 && a2 == 0xE900000000000079 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 1970106467 && a2 == 0xE400000000000000 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x746E6174736E6F63 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_244F1BCA0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t sub_244F032B8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  char v33;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C6B8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244F02EDC();
  sub_244F1BD24();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v29) = 0;
  v9 = sub_244F1BBD4();
  v11 = v10;
  v28 = v9;
  LOBYTE(v29) = 1;
  swift_bridgeObjectRetain();
  v12 = sub_244F1BBD4();
  v14 = v13;
  v26 = v12;
  v27 = v11;
  LOBYTE(v29) = 2;
  swift_bridgeObjectRetain();
  v15 = v14;
  v16 = sub_244F1BBF8();
  LOBYTE(v29) = 3;
  v32 = sub_244F1BBF8();
  LOBYTE(v29) = 4;
  v25 = sub_244F1BBF8();
  v33 = 5;
  sub_244EFF4B0();
  sub_244F1BBEC();
  v23 = v30;
  v24 = v29;
  v22 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C680);
  v33 = 6;
  sub_244F037FC();
  sub_244F1BBEC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v17 = v29;
  v18 = v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v28;
  *(_QWORD *)(a2 + 8) = v18;
  *(_QWORD *)(a2 + 16) = v26;
  *(_QWORD *)(a2 + 24) = v15;
  v20 = v32;
  *(_DWORD *)(a2 + 32) = v16;
  *(_DWORD *)(a2 + 36) = v20;
  *(_DWORD *)(a2 + 40) = v25;
  v21 = v23;
  *(_QWORD *)(a2 + 48) = v24;
  *(_QWORD *)(a2 + 56) = v21;
  *(_QWORD *)(a2 + 64) = v22;
  *(_QWORD *)(a2 + 72) = v17;
  return result;
}

ValueMetadata *type metadata accessor for Silicon()
{
  return &type metadata for Silicon;
}

uint64_t storeEnumTagSinglePayload for Silicon.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_244F036A4 + 4 * byte_244F1E7CC[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_244F036D8 + 4 * byte_244F1E7C7[v4]))();
}

uint64_t sub_244F036D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F036E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244F036E8);
  return result;
}

uint64_t sub_244F036F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244F036FCLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_244F03700(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F03708(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Silicon.CodingKeys()
{
  return &type metadata for Silicon.CodingKeys;
}

unint64_t sub_244F03728()
{
  unint64_t result;

  result = qword_25742C6A0;
  if (!qword_25742C6A0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E8D4, &type metadata for Silicon.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C6A0);
  }
  return result;
}

unint64_t sub_244F03770()
{
  unint64_t result;

  result = qword_25742C6A8;
  if (!qword_25742C6A8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E844, &type metadata for Silicon.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C6A8);
  }
  return result;
}

unint64_t sub_244F037B8()
{
  unint64_t result;

  result = qword_25742C6B0;
  if (!qword_25742C6B0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E86C, &type metadata for Silicon.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C6B0);
  }
  return result;
}

unint64_t sub_244F037FC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25742C6C0;
  if (!qword_25742C6C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742C680);
    v2 = sub_244F03880(&qword_25742C6C8, MEMORY[0x24BEE1400], MEMORY[0x24BEE12D0]);
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x24952AE28](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25742C6C0);
  }
  return result;
}

uint64_t sub_244F03880(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742C698);
    v8 = a2;
    result = MEMORY[0x24952AE28](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_244F038E0()
{
  unint64_t result;

  result = qword_25742C6D0;
  if (!qword_25742C6D0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1E9AC, &type metadata for Silicon.CurrentSiliconError);
    atomic_store(result, (unint64_t *)&qword_25742C6D0);
  }
  return result;
}

uint64_t sub_244F03928()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for Silicon.CurrentSiliconError()
{
  return sub_244F03944();
}

uint64_t sub_244F03944()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s7Recount7SiliconV19CurrentSiliconErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  char v6;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_DWORD *)a2 + 4);
  v6 = *((_BYTE *)a2 + 20);
  sub_244F03928();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 20) = v6;
  return a1;
}

uint64_t assignWithCopy for Silicon.CurrentSiliconError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  char v6;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_DWORD *)a2 + 4);
  v6 = *((_BYTE *)a2 + 20);
  sub_244F03928();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 20) = v6;
  sub_244F03944();
  return a1;
}

__n128 __swift_memcpy21_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_QWORD *)(a1 + 13) = *(_QWORD *)(a2 + 13);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Silicon.CurrentSiliconError(uint64_t a1, uint64_t a2)
{
  int v3;
  char v4;

  v3 = *(_DWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 20);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 20) = v4;
  sub_244F03944();
  return a1;
}

uint64_t getEnumTagSinglePayload for Silicon.CurrentSiliconError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 21))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 20);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Silicon.CurrentSiliconError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 20) = 0;
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 21) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 21) = 0;
    if (a2)
      *(_BYTE *)(result + 20) = -(char)a2;
  }
  return result;
}

uint64_t sub_244F03B08(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 20);
}

uint64_t sub_244F03B10(uint64_t result, char a2)
{
  *(_BYTE *)(result + 20) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Silicon.CurrentSiliconError()
{
  return &type metadata for Silicon.CurrentSiliconError;
}

void sub_244F03B30(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_244F03B68()
{
  sub_244F1B880();
  return swift_bridgeObjectRelease();
}

void sub_244F03C30(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_244F03C7C()
{
  sub_244F1B880();
  return swift_bridgeObjectRelease();
}

void sub_244F03CD4(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_244F03D1C()
{
  sub_244F1B880();
  return swift_bridgeObjectRelease();
}

void sub_244F03DC8(uint64_t a1, char a2)
{
  sub_244F1BD00();
  __asm { BR              X10 }
}

uint64_t sub_244F03E1C()
{
  sub_244F1B880();
  swift_bridgeObjectRelease();
  return sub_244F1BD18();
}

void sub_244F03EDC(uint64_t a1, char a2)
{
  sub_244F1BD00();
  __asm { BR              X10 }
}

uint64_t sub_244F03F38()
{
  sub_244F1B880();
  swift_bridgeObjectRelease();
  return sub_244F1BD18();
}

void sub_244F03FA8(uint64_t a1, char a2)
{
  sub_244F1BD00();
  __asm { BR              X10 }
}

uint64_t sub_244F03FEC()
{
  sub_244F1B880();
  swift_bridgeObjectRelease();
  return sub_244F1BD18();
}

void sub_244F040C8(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_244F04108(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244F041D8 + 4 * byte_244F1EA1E[a2]))(0x4E79616C70736964);
}

uint64_t sub_244F041D8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x4E79616C70736964 && v1 == 0xEB00000000656D61)
    v2 = 1;
  else
    v2 = sub_244F1BCA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_244F04300(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_244F04350(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244F043B4 + 4 * byte_244F1EA2A[a2]))(0xD000000000000010);
}

uint64_t sub_244F043B4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000010 && v1 == 0x8000000244F1F4C0)
    v2 = 1;
  else
    v2 = sub_244F1BCA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_244F04448(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_244F044B4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244F04554 + 4 * byte_244F1EA35[a2]))(0xD000000000000011);
}

uint64_t sub_244F04554(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000011 && v1 == 0x8000000244F1F540)
    v2 = 1;
  else
    v2 = sub_244F1BCA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_244F0462C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x737265746E756F63;
  else
    v3 = 0x7265626D756ELL;
  if (v2)
    v4 = 0xE600000000000000;
  else
    v4 = 0xED00006B73616D5FLL;
  if ((a2 & 1) != 0)
    v5 = 0x737265746E756F63;
  else
    v5 = 0x7265626D756ELL;
  if ((a2 & 1) != 0)
    v6 = 0xED00006B73616D5FLL;
  else
    v6 = 0xE600000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_244F1BCA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_244F046D8(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_244F04744(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244F047AC + 4 * byte_244F1EA40[a2]))(0x635F6769666E6F63);
}

uint64_t sub_244F047AC(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x635F6769666E6F63 && v1 == 0xEF737265746E756FLL)
    v2 = 1;
  else
    v2 = sub_244F1BCA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_244F0485C(unsigned __int8 a1, unsigned __int8 a2)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0x702D6F626D697761;
  v3 = 0xEA0000000000696DLL;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0x702D6F626D697761;
    else
      v5 = 0x65636172746170;
    if (v4 == 1)
      v6 = 0xEA0000000000636DLL;
    else
      v6 = 0xE700000000000000;
    v7 = a2;
    if (!a2)
      goto LABEL_12;
  }
  else
  {
    v5 = 0x702D6F626D697761;
    v6 = 0xEA0000000000696DLL;
    v7 = a2;
    if (!a2)
      goto LABEL_12;
  }
  if (v7 == 1)
  {
    v3 = 0xEA0000000000636DLL;
  }
  else
  {
    v2 = 0x65636172746170;
    v3 = 0xE700000000000000;
  }
LABEL_12:
  if (v5 == v2 && v6 == v3)
    v8 = 1;
  else
    v8 = sub_244F1BCA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_244F0494C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  int64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v2 = v1;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = MEMORY[0x24BEE4AF8];
  if (!v3)
    return v4;
  v5 = a1;
  v40 = MEMORY[0x24BEE4AF8];
  sub_244F17568(0, v3, 0);
  v4 = v40;
  result = sub_244F13CB0(v5);
  v8 = result;
  v9 = 0;
  v10 = v5 + 64;
  v34 = v5 + 80;
  v35 = v3;
  v37 = v5 + 64;
  v38 = v5;
  v36 = v7;
  while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << *(_BYTE *)(v5 + 32))
  {
    v13 = (unint64_t)v8 >> 6;
    if ((*(_QWORD *)(v10 + 8 * ((unint64_t)v8 >> 6)) & (1 << v8)) == 0)
      goto LABEL_25;
    if (*(_DWORD *)(v5 + 36) != v7)
      goto LABEL_26;
    v39 = v9;
    v14 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v8);
    v15 = *v14;
    v16 = v14[1];
    v17 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v8);
    v18 = *v17;
    v19 = v17[1];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v20 = (_QWORD *)sub_244F04E04(MEMORY[0x24BEE4AF8]);
    v21 = sub_244F19904(v18, v19, v20);
    if (v2)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v4;
    }
    v23 = v21;
    v24 = v22;
    result = swift_bridgeObjectRelease();
    v26 = *(_QWORD *)(v40 + 16);
    v25 = *(_QWORD *)(v40 + 24);
    v27 = v26 + 1;
    if (v26 >= v25 >> 1)
    {
      result = sub_244F17568(v25 > 1, v26 + 1, 1);
      v27 = v26 + 1;
    }
    *(_QWORD *)(v40 + 16) = v27;
    v28 = (_QWORD *)(v40 + 32 * v26);
    v28[4] = v15;
    v28[5] = v16;
    v28[6] = v23;
    v28[7] = v24;
    v5 = v38;
    v11 = 1 << *(_BYTE *)(v38 + 32);
    if (v8 >= v11)
      goto LABEL_27;
    v10 = v37;
    v29 = *(_QWORD *)(v37 + 8 * v13);
    if ((v29 & (1 << v8)) == 0)
      goto LABEL_28;
    v7 = v36;
    if (*(_DWORD *)(v38 + 36) != v36)
      goto LABEL_29;
    v30 = v29 & (-2 << (v8 & 0x3F));
    if (v30)
    {
      v11 = __clz(__rbit64(v30)) | v8 & 0xFFFFFFFFFFFFFFC0;
      v2 = 0;
      v12 = v35;
    }
    else
    {
      v31 = v13 + 1;
      v32 = (unint64_t)(v11 + 63) >> 6;
      v2 = 0;
      v12 = v35;
      if (v13 + 1 < v32)
      {
        v33 = *(_QWORD *)(v37 + 8 * v31);
        if (v33)
        {
LABEL_21:
          v11 = __clz(__rbit64(v33)) + (v31 << 6);
        }
        else
        {
          while (v32 - 2 != v13)
          {
            v33 = *(_QWORD *)(v34 + 8 * v13++);
            if (v33)
            {
              v31 = v13 + 1;
              goto LABEL_21;
            }
          }
        }
      }
    }
    v9 = v39 + 1;
    v8 = v11;
    if (v39 + 1 == v12)
      return v4;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

unint64_t sub_244F04BDC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C868);
  v2 = (_QWORD *)sub_244F1BB80();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_244F11EF0(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_244F04CF4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C838);
  v2 = (_QWORD *)sub_244F1BB80();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_244F11EF0(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_244F04E04(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  __int128 v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7F0);
  v2 = (_QWORD *)sub_244F1BB80();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v13 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_244F11EF0(v5, v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = (uint64_t *)(v2[6] + 16 * result);
    *v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
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

uint64_t sub_244F04F38(unint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  unint64_t v6;
  int64x2_t v7;
  int64x2_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_244F1BB44();
    __break(1u);
    return result;
  }
  if (!a2)
    return MEMORY[0x24BEE4AF8];
  result = sub_244F1B97C();
  *(_QWORD *)(result + 16) = a2;
  v5 = (unint64_t *)(result + 32);
  if (a2 < 4)
  {
    v6 = 0;
LABEL_9:
    v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v5 += a2 & 0xFFFFFFFFFFFFFFFCLL;
  v7 = vdupq_n_s64(a1);
  v8 = (int64x2_t *)(result + 48);
  v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v6 != a2)
    goto LABEL_9;
  return result;
}

uint64_t sub_244F05020(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_244F1BB44();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C530);
      v4 = sub_244F1B97C();
      *(_QWORD *)(v4 + 16) = a2;
      sub_244EF1360(a1, v4 + 32, &qword_25742C530);
      if (a2 != 1)
      {
        sub_244EF1360(a1, v4 + 80, &qword_25742C530);
        v5 = a2 - 2;
        if (a2 != 2)
        {
          v6 = v4 + 128;
          do
          {
            sub_244F0F9EC(a1);
            sub_244EF1360(a1, v6, &qword_25742C530);
            v6 += 48;
            --v5;
          }
          while (v5);
        }
        sub_244F0F9EC(a1);
      }
    }
    else
    {
      sub_244F0FA14(a1);
      return MEMORY[0x24BEE4AF8];
    }
    return v4;
  }
  return result;
}

uint64_t sub_244F05148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t result;

  if (a5 < 0)
  {
    result = sub_244F1BB44();
    __break(1u);
  }
  else
  {
    if (a5)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4D8);
      v10 = (_QWORD *)sub_244F1B97C();
      v11 = v10;
      v10[2] = a5;
      v10[4] = a1;
      v10[5] = a2;
      v10[6] = a3;
      v10[7] = a4;
      if (a5 != 1)
      {
        v10[8] = a1;
        v10[9] = a2;
        v10[10] = a3;
        v10[11] = a4;
        v12 = a5 - 2;
        if (v12)
        {
          v13 = v10 + 15;
          do
          {
            *(v13 - 3) = a1;
            *(v13 - 2) = a2;
            *(v13 - 1) = a3;
            *v13 = a4;
            swift_bridgeObjectRetain();
            v13 += 4;
            --v12;
          }
          while (v12);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x24BEE4AF8];
    }
    return (uint64_t)v11;
  }
  return result;
}

uint64_t sub_244F05264(int a1, size_t a2)
{
  uint64_t v4;
  uint64_t result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_244F1BB44();
    __break(1u);
  }
  else
  {
    if (!a2)
      return MEMORY[0x24BEE4AF8];
    v4 = sub_244F1B97C();
    *(_QWORD *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_244F0531C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t result;

  if (a3 < 0)
  {
    result = sub_244F1BB44();
    __break(1u);
  }
  else
  {
    if (a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7A8);
      v6 = (_QWORD *)sub_244F1B97C();
      v7 = v6;
      v6[2] = a3;
      v6[4] = a1;
      v6[5] = a2;
      if (a3 != 1)
      {
        v6[6] = a1;
        v6[7] = a2;
        v8 = a3 - 2;
        if (v8)
        {
          v9 = v6 + 9;
          do
          {
            *(v9 - 1) = a1;
            *v9 = a2;
            swift_bridgeObjectRetain();
            v9 += 2;
            --v8;
          }
          while (v8);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x24BEE4AF8];
    }
    return (uint64_t)v7;
  }
  return result;
}

uint64_t sub_244F0541C(unint64_t a1, double a2)
{
  uint64_t result;
  double *v4;
  unint64_t v5;
  double v6;
  int64x2_t v7;
  int64x2_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a1 & 0x8000000000000000) != 0)
  {
    result = sub_244F1BB44();
    __break(1u);
    return result;
  }
  if (!a1)
    return MEMORY[0x24BEE4AF8];
  result = sub_244F1B97C();
  *(_QWORD *)(result + 16) = a1;
  v4 = (double *)(result + 32);
  if (a1 < 4)
  {
    v5 = 0;
    v6 = a2;
LABEL_9:
    v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  v5 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v4 += a1 & 0xFFFFFFFFFFFFFFFCLL;
  v6 = a2;
  v7 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  v8 = (int64x2_t *)(result + 48);
  v9 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v5 != a1)
    goto LABEL_9;
  return result;
}

uint64_t sub_244F0550C()
{
  _OWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  sub_244F0FE44(v0, &v5);
  if (v6 < 0)
  {
    v6 &= ~0x8000000000000000;
    v2 = v5;
    sub_244F1BAB4();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v4 = v2;
    sub_244F1B8A4();
  }
  else
  {
    v1 = v5;
    sub_244F1BAB4();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v4 = v1;
    sub_244F1B8A4();
    swift_bridgeObjectRetain();
    sub_244F1B8A4();
    swift_bridgeObjectRelease();
  }
  sub_244F1B8A4();
  return v4;
}

uint64_t sub_244F0564C()
{
  _OWORD *v0;
  _OWORD v2[6];

  sub_244F0FE44(v0, v2);
  return sub_244F0550C();
}

uint64_t Mode.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Mode.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Mode.displayDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Mode.metrics.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Mode.silicon.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_244F05718(v1 + 56, a1);
}

uint64_t sub_244F05718(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for Silicon(a2, a1);
  return a2;
}

uint64_t Mode.settings.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v1 + 160);
  v3 = *(_QWORD *)(v1 + 168);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 136);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 144);
  *(_QWORD *)(a1 + 24) = v2;
  *(_QWORD *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t Mode.supportedPlatforms.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Mode.specification.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 192);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_244F057C0()
{
  void *v0;
  id v1;

  v0 = (void *)sub_244F1B7FC();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  if (v1)
    qword_257432C68 = (uint64_t)v1;
  else
    __break(1u);
}

uint64_t sub_244F05834()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  uint64_t result;
  void (*v18)(char *, uint64_t);
  _QWORD v19[2];

  v0 = sub_244F1B6F4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742BBA0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_244F1B754();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)v19 - v13;
  __swift_allocate_value_buffer(v12, qword_257432C70);
  __swift_project_value_buffer(v7, (uint64_t)qword_257432C70);
  if (qword_25742BA28 != -1)
    swift_once();
  v15 = objc_msgSend((id)qword_257432C68, sel_resourceURL);
  if (v15)
  {
    v16 = v15;
    sub_244F1B724();

    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v11, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
    if ((_DWORD)result != 1)
    {
      v19[0] = 0x7365646F4DLL;
      v19[1] = 0xE500000000000000;
      (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDCD790], v0);
      sub_244EF7DE8();
      sub_244F1B748();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      swift_bridgeObjectRelease();
      v18 = *(void (**)(char *, uint64_t))(v8 + 8);
      v18(v6, v7);
      sub_244F1B6E8();
      return ((uint64_t (*)(char *, uint64_t))v18)(v14, v7);
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }
  __break(1u);
  return result;
}

uint64_t sub_244F05AA4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742BBA0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_244F1B6F4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_244F1B754();
  __swift_allocate_value_buffer(v7, qword_257432C88);
  __swift_project_value_buffer(v7, (uint64_t)qword_257432C88);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCD790], v3);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v2, 1, 1, v7);
  return sub_244F1B73C();
}

uint64_t sub_244F05BCC(uint64_t a1)
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
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;

  result = sub_244F1B9A0();
  v3 = 0;
  v18 = result;
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
    v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      v3 = v14 + 1;
      if (v14 + 1 >= v8)
        goto LABEL_23;
      v15 = *(_QWORD *)(v4 + 8 * v3);
      if (!v15)
      {
        v3 = v14 + 2;
        if (v14 + 2 >= v8)
          goto LABEL_23;
        v15 = *(_QWORD *)(v4 + 8 * v3);
        if (!v15)
        {
          v3 = v14 + 3;
          if (v14 + 3 >= v8)
            goto LABEL_23;
          v15 = *(_QWORD *)(v4 + 8 * v3);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_244F08CA8(&v17, v12, v13);
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v3);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_244F05D60(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = result;
  v3 = 0;
  v18 = a2;
  v4 = result + 64;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 64);
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
    v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      v3 = v14 + 1;
      if (v14 + 1 >= v8)
        goto LABEL_23;
      v15 = *(_QWORD *)(v4 + 8 * v3);
      if (!v15)
      {
        v3 = v14 + 2;
        if (v14 + 2 >= v8)
          goto LABEL_23;
        v15 = *(_QWORD *)(v4 + 8 * v3);
        if (!v15)
        {
          v3 = v14 + 3;
          if (v14 + 3 >= v8)
            goto LABEL_23;
          v15 = *(_QWORD *)(v4 + 8 * v3);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_244F08CA8(&v17, v12, v13);
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v3);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t Mode.metricValues(cpuKind:counterValues:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v8;

  v8 = sub_244F0541C(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 16), 0.0);
  sub_244F119AC(a1, a2, &v8);
  v6 = v8;
  if (v3)
    swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_244F05F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_244F1BD00();
    sub_244F1B880();
    v6 = sub_244F1BD18();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_244F1BCA0() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_244F1BCA0() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_244F0608C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_244F07F9C(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[3 * v8 + 4];
  if (a1 + 32 < v9 + 24 * v2 && v9 < a1 + 32 + 24 * v2)
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C790);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F061F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_244F083F8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F06344(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
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
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_244F08504(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8)
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7A8);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F064B0(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  int64_t v35;
  int64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  uint64_t v39;
  int64_t v40;
  unint64_t v41;

  v3 = *(_QWORD *)(result + 16);
  v4 = *(_QWORD **)v1;
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = result;
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v9 = v4[3] >> 1, v9 < v6))
  {
    if (v5 <= v6)
      v10 = v5 + v3;
    else
      v10 = v5;
    v4 = sub_244F083F8(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    v9 = v4[3] >> 1;
  }
  v11 = v4[2];
  v12 = v9 - v11;
  result = sub_244F0A64C((uint64_t)v38, &v4[2 * v11 + 4], v9 - v11, v7);
  if (result < v3)
    goto LABEL_15;
  if (result)
  {
    v14 = v4[2];
    v15 = __OFADD__(v14, result);
    v16 = v14 + result;
    if (v15)
    {
      __break(1u);
      goto LABEL_48;
    }
    v4[2] = v16;
  }
  if (result != v12)
  {
LABEL_13:
    result = sub_244F0F80C();
    *(_QWORD *)v1 = v4;
    return result;
  }
LABEL_16:
  v2 = v4[2];
  v3 = v38[0];
  v37 = v38[1];
  v13 = v39;
  v6 = v40;
  if (v41)
  {
    v17 = (v41 - 1) & v41;
    v18 = __clz(__rbit64(v41)) | (v40 << 6);
    v36 = (unint64_t)(v39 + 64) >> 6;
    goto LABEL_18;
  }
LABEL_48:
  v32 = v6 + 1;
  if (__OFADD__(v6, 1))
    goto LABEL_66;
  v36 = (unint64_t)(v13 + 64) >> 6;
  if (v32 >= v36)
    goto LABEL_13;
  v33 = *(_QWORD *)(v37 + 8 * v32);
  v34 = v6 + 1;
  if (!v33)
  {
    v34 = v6 + 2;
    if (v6 + 2 >= v36)
      goto LABEL_13;
    v33 = *(_QWORD *)(v37 + 8 * v34);
    if (!v33)
    {
      v34 = v6 + 3;
      if (v6 + 3 >= v36)
        goto LABEL_13;
      v33 = *(_QWORD *)(v37 + 8 * v34);
      if (!v33)
      {
        v34 = v6 + 4;
        if (v6 + 4 >= v36)
          goto LABEL_13;
        v33 = *(_QWORD *)(v37 + 8 * v34);
        if (!v33)
        {
          v34 = v6 + 5;
          if (v6 + 5 >= v36)
            goto LABEL_13;
          v33 = *(_QWORD *)(v37 + 8 * v34);
          if (!v33)
          {
            v35 = v6 + 6;
            do
            {
              if (v36 == v35)
                goto LABEL_13;
              v33 = *(_QWORD *)(v37 + 8 * v35++);
            }
            while (!v33);
            v34 = v35 - 1;
          }
        }
      }
    }
  }
  v17 = (v33 - 1) & v33;
  v18 = __clz(__rbit64(v33)) + (v34 << 6);
  v6 = v34;
LABEL_18:
  v19 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v18);
  v21 = *v19;
  v20 = v19[1];
  result = swift_bridgeObjectRetain();
  while (1)
  {
    v22 = v4[3];
    v23 = v22 >> 1;
    if ((uint64_t)(v22 >> 1) < v2 + 1)
      break;
    if (v2 < v23)
      goto LABEL_23;
LABEL_20:
    v4[2] = v2;
  }
  result = (uint64_t)sub_244F083F8((_QWORD *)(v22 > 1), v2 + 1, 1, v4);
  v4 = (_QWORD *)result;
  v23 = *(_QWORD *)(result + 24) >> 1;
  if (v2 >= v23)
    goto LABEL_20;
  while (1)
  {
LABEL_23:
    v24 = &v4[2 * v2 + 4];
    *v24 = v21;
    v24[1] = v20;
    ++v2;
    if (v17)
    {
      v25 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v26 = v25 | (v6 << 6);
      goto LABEL_41;
    }
    v27 = v6 + 1;
    if (__OFADD__(v6, 1))
      break;
    if (v27 >= v36)
      goto LABEL_45;
    v28 = *(_QWORD *)(v37 + 8 * v27);
    v29 = v6 + 1;
    if (!v28)
    {
      v29 = v6 + 2;
      if (v6 + 2 >= v36)
        goto LABEL_45;
      v28 = *(_QWORD *)(v37 + 8 * v29);
      if (!v28)
      {
        v29 = v6 + 3;
        if (v6 + 3 >= v36)
          goto LABEL_45;
        v28 = *(_QWORD *)(v37 + 8 * v29);
        if (!v28)
        {
          v29 = v6 + 4;
          if (v6 + 4 >= v36)
            goto LABEL_45;
          v28 = *(_QWORD *)(v37 + 8 * v29);
          if (!v28)
          {
            v29 = v6 + 5;
            if (v6 + 5 >= v36)
              goto LABEL_45;
            v28 = *(_QWORD *)(v37 + 8 * v29);
            if (!v28)
            {
              v30 = v6 + 6;
              while (v36 != v30)
              {
                v28 = *(_QWORD *)(v37 + 8 * v30++);
                if (v28)
                {
                  v29 = v30 - 1;
                  goto LABEL_40;
                }
              }
LABEL_45:
              v4[2] = v2;
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_40:
    v17 = (v28 - 1) & v28;
    v26 = __clz(__rbit64(v28)) + (v29 << 6);
    v6 = v29;
LABEL_41:
    v31 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v26);
    v21 = *v31;
    v20 = v31[1];
    if (v2 >= v23)
    {
      result = swift_bridgeObjectRetain();
      goto LABEL_20;
    }
    result = swift_bridgeObjectRetain();
  }
  __break(1u);
LABEL_66:
  __break(1u);
  return result;
}

uint64_t sub_244F06878(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_244F08610(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[4 * v8 + 4];
  if (a1 + 32 < v9 + 32 * v2 && v9 < a1 + 32 + 32 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F069C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_244F08828(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = &v3[v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[v2] && (unint64_t)v9 < a1 + 32 + 8 * v2)
    goto LABEL_24;
  memcpy(v9, (const void *)(a1 + 32), 8 * v2);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F06B0C(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
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
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_244F08934(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[26 * v9 + 4];
  if (a1 + 32 < v10 + 208 * v8 && v10 < a1 + 32 + 208 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F06C68(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244F06C94 + 4 * byte_244F1EA44[a1]))(1701667182, 0xE400000000000000);
}

uint64_t sub_244F06C94()
{
  return 0x4E79616C70736964;
}

unint64_t sub_244F06CB4()
{
  return 0xD000000000000012;
}

uint64_t sub_244F06D24()
{
  return 0x6369666963657073;
}

uint64_t sub_244F06D48(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244F06D74 + 4 * byte_244F1EA4C[a1]))(1701667182, 0xE400000000000000);
}

uint64_t sub_244F06D74()
{
  return 0x4E79616C70736964;
}

unint64_t sub_244F06D94()
{
  return 0xD000000000000012;
}

uint64_t sub_244F06E04()
{
  return 0x6369666963657073;
}

void sub_244F06E28(char *a1)
{
  sub_244F040C8(*a1);
}

void sub_244F06E34()
{
  char *v0;

  sub_244F03FA8(0, *v0);
}

void sub_244F06E40(uint64_t a1)
{
  char *v1;

  sub_244F03B30(a1, *v1);
}

void sub_244F06E48(uint64_t a1)
{
  char *v1;

  sub_244F03FA8(a1, *v1);
}

uint64_t sub_244F06E50@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244F0DB0C();
  *a1 = result;
  return result;
}

uint64_t sub_244F06E7C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_244F06C68(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_244F06EA4()
{
  unsigned __int8 *v0;

  return sub_244F06D48(*v0);
}

uint64_t sub_244F06EAC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244F0DB0C();
  *a1 = result;
  return result;
}

uint64_t sub_244F06ED0()
{
  sub_244F0E990();
  return sub_244F1BD60();
}

uint64_t sub_244F06EF8()
{
  sub_244F0E990();
  return sub_244F1BD6C();
}

__n128 Mode.init(from:)@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[13];

  result.n128_u64[0] = sub_244F0DB54(a1, (uint64_t)v10).n128_u64[0];
  if (!v2)
  {
    v5 = v10[11];
    *(_OWORD *)(a2 + 160) = v10[10];
    *(_OWORD *)(a2 + 176) = v5;
    *(_OWORD *)(a2 + 192) = v10[12];
    v6 = v10[7];
    *(_OWORD *)(a2 + 96) = v10[6];
    *(_OWORD *)(a2 + 112) = v6;
    v7 = v10[9];
    *(_OWORD *)(a2 + 128) = v10[8];
    *(_OWORD *)(a2 + 144) = v7;
    v8 = v10[3];
    *(_OWORD *)(a2 + 32) = v10[2];
    *(_OWORD *)(a2 + 48) = v8;
    v9 = v10[5];
    *(_OWORD *)(a2 + 64) = v10[4];
    *(_OWORD *)(a2 + 80) = v9;
    result = (__n128)v10[1];
    *(_OWORD *)a2 = v10[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t Mode.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C6D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244F0E990();
  sub_244F1BD30();
  LOBYTE(v13) = 0;
  sub_244F1BC34();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_244F1BC34();
    LOBYTE(v13) = 2;
    sub_244F1BC34();
    *(_QWORD *)&v13 = *(_QWORD *)(v3 + 48);
    v18 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C6E8);
    sub_244F0F858(&qword_25742C6F0, (uint64_t (*)(void))sub_244F0E9D4, MEMORY[0x24BEE12A0]);
    sub_244F1BC64();
    v9 = *(_OWORD *)(v3 + 152);
    v13 = *(_OWORD *)(v3 + 136);
    v14 = v9;
    *(_QWORD *)&v15 = *(_QWORD *)(v3 + 168);
    v18 = 4;
    sub_244F0EA18();
    sub_244F1BC64();
    v10 = *(_OWORD *)(v3 + 72);
    v11 = *(_OWORD *)(v3 + 104);
    v15 = *(_OWORD *)(v3 + 88);
    v16 = v11;
    v17 = *(_OWORD *)(v3 + 120);
    v13 = *(_OWORD *)(v3 + 56);
    v14 = v10;
    v18 = 5;
    sub_244F0EA5C();
    sub_244F1BC64();
    *(_QWORD *)&v13 = *(_QWORD *)(v3 + 184);
    v18 = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742BAC8);
    sub_244F0F98C(&qword_25742C710, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_244F1BC64();
    LOBYTE(v13) = 7;
    sub_244F1BC34();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

__n128 sub_244F07258@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[13];

  result.n128_u64[0] = sub_244F0DB54(a1, (uint64_t)v10).n128_u64[0];
  if (!v2)
  {
    v5 = v10[11];
    *(_OWORD *)(a2 + 160) = v10[10];
    *(_OWORD *)(a2 + 176) = v5;
    *(_OWORD *)(a2 + 192) = v10[12];
    v6 = v10[7];
    *(_OWORD *)(a2 + 96) = v10[6];
    *(_OWORD *)(a2 + 112) = v6;
    v7 = v10[9];
    *(_OWORD *)(a2 + 128) = v10[8];
    *(_OWORD *)(a2 + 144) = v7;
    v8 = v10[3];
    *(_OWORD *)(a2 + 32) = v10[2];
    *(_OWORD *)(a2 + 48) = v8;
    v9 = v10[5];
    *(_OWORD *)(a2 + 64) = v10[4];
    *(_OWORD *)(a2 + 80) = v9;
    result = (__n128)v10[1];
    *(_OWORD *)a2 = v10[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_244F072C0(_QWORD *a1)
{
  return Mode.encode(to:)(a1);
}

uint64_t sub_244F072D4(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
    goto LABEL_42;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_244F07770(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  v42 = a1;
  v43 = v10;
  v48 = 4 * v12;
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_244F1B904();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      break;
    v14 = sub_244F1B898();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_244F1B898();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_244F1B91C();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_244F078C8(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_244F078C8((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_244F1B898();
  v14 = v29;
  *(_QWORD *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    v15 = v29;
    v16 = v29;
    goto LABEL_9;
  }
  v16 = v29;
  v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = sub_244F1B91C();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_244F078C8(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_244F078C8((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
    v13[2] = v39 + 1;
    v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(_QWORD *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_244F1BB44();
  __break(1u);
LABEL_42:
  result = sub_244F1BB44();
  __break(1u);
  return result;
}

uint64_t sub_244F07770(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_244F1B91C();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_244F078C8(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_244F078C8((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_244F1BB44();
  __break(1u);
  return result;
}

_QWORD *sub_244F078C8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C740);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244F0A848(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F079D4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C858);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_244F0AE0C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F07AF8(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_244F07B10(a1, a2, a3, a4, &qword_25742C4C8);
}

_QWORD *sub_244F07B04(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_244F07B10(a1, a2, a3, a4, &qword_25742C7B8);
}

_QWORD *sub_244F07B10(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    v8 = a2;
    goto LABEL_8;
  }
  v7 = a4[3];
  v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2)
    goto LABEL_8;
  if (v8 + 0x4000000000000000 >= 0)
  {
    v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v8 = a2;
LABEL_8:
    v9 = a4[2];
    if (v8 <= v9)
      v10 = a4[2];
    else
      v10 = v8;
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v11 = (_QWORD *)swift_allocObject();
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 25;
      v11[2] = v9;
      v11[3] = 2 * (v13 >> 3);
      v14 = v11 + 4;
      if ((v6 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v14 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[v9 + 4])
          memmove(v14, a4 + 4, 8 * v9);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244F0B130(0, v9, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F07C18(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7C8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_244F0B024(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F07D3C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C850);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_244F0AF18(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F07E5C(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_244F07E84(a1, a2, a3, a4, &qword_25742C528, &qword_25742C848);
}

_QWORD *sub_244F07E70(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_244F07E84(a1, a2, a3, a4, &qword_25742C840, &qword_25742C108);
}

_QWORD *sub_244F07E84(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;
  _QWORD *v16;

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
      v15 = v14 - 32;
      if (v14 < 32)
        v15 = v14 - 25;
      v13[2] = v11;
      v13[3] = 2 * (v15 >> 3);
      v16 = v13 + 4;
      if ((v8 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v16 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[v11 + 4])
          memmove(v16, a4 + 4, 8 * v11);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244F0B9EC(0, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F07F9C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C798);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_244F0B320(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F080C0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7D8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244F0B218(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F081CC(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_244F07E84(a1, a2, a3, a4, &qword_25742C4C0, &qword_25742C7C0);
}

char *sub_244F081E0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7A0);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_244F0B818(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F082D8(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_244F07E84(a1, a2, a3, a4, &qword_25742C780, &qword_25742C698);
}

_QWORD *sub_244F082EC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C788);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244F0B8FC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F083F8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C778);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244F0B620(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F08504(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7B0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244F0B710(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F08610(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7E8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244F0AD1C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F0871C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7E0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244F0AC34(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F08828(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C830);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244F0B130(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_244F08934(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C748);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 208);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[26 * v8 + 4])
          memmove(v12, a4 + 4, 208 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_244F0C818(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_244F08A5C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5)
      return MEMORY[0x24BEE4AF8];
    v8 = 8 * v5;
    if (v5 <= 0)
    {
      v9 = (char *)MEMORY[0x24BEE4AF8];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0)
          goto LABEL_19;
        v12 = v9 + 32;
        v13 = (char *)(a2 + 8 * a3);
        if (v13 < &v9[v8 + 32] && v12 < &v13[v8])
          goto LABEL_19;
        memcpy(v12, v13, 8 * v5);
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4C8);
      v9 = (char *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 25;
      *((_QWORD *)v9 + 2) = v5;
      *((_QWORD *)v9 + 3) = 2 * (v11 >> 3);
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

_QWORD *sub_244F08BC4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C778);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_244F0A64C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_244F0F80C();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_244F08CA8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_244F1BD00();
  swift_bridgeObjectRetain();
  sub_244F1B880();
  v8 = sub_244F1BD18();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_244F1BCA0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_244F1BCA0() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_244F0A460(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_244F08E54(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v14 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      v8 = v14 + 1;
      if (v14 + 1 >= v7)
        return swift_release();
      v15 = *(_QWORD *)(v3 + 8 * v8);
      if (!v15)
      {
        v8 = v14 + 2;
        if (v14 + 2 >= v7)
          return swift_release();
        v15 = *(_QWORD *)(v3 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v7)
            return swift_release();
          v15 = *(_QWORD *)(v3 + 8 * v8);
          if (!v15)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_244F09450(v12, v13);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v7)
    return swift_release();
  v15 = *(_QWORD *)(v3 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_244F08FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t isStackAllocationSafe;
  char v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;

  v2 = a2;
  v43 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v37 = a1 + 56;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v35 = ~v5;
    if (-v5 < 64)
      v6 = ~(-1 << -(char)v5);
    else
      v6 = -1;
    v7 = v6 & v4;
    v36 = (unint64_t)(63 - v5) >> 6;
    v8 = a2 + 56;
    swift_bridgeObjectRetain();
    v9 = 0;
    while (1)
    {
      if (v7)
      {
        v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v11 = v10 | (v9 << 6);
      }
      else
      {
        v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36)
          goto LABEL_47;
        v13 = *(_QWORD *)(v37 + 8 * v12);
        v14 = v9 + 1;
        if (!v13)
        {
          v14 = v9 + 2;
          if (v9 + 2 >= v36)
            goto LABEL_47;
          v13 = *(_QWORD *)(v37 + 8 * v14);
          if (!v13)
          {
            v14 = v9 + 3;
            if (v9 + 3 >= v36)
              goto LABEL_47;
            v13 = *(_QWORD *)(v37 + 8 * v14);
            if (!v13)
            {
              v14 = v9 + 4;
              if (v9 + 4 >= v36)
                goto LABEL_47;
              v13 = *(_QWORD *)(v37 + 8 * v14);
              if (!v13)
              {
                v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_244F0F80C();
                  return v2;
                }
                v13 = *(_QWORD *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      break;
                    if (v14 >= v36)
                      goto LABEL_47;
                    v13 = *(_QWORD *)(v37 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_24;
                  }
LABEL_49:
                  __break(1u);
                }
                v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        v7 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v9 = v14;
      }
      v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      sub_244F1BD00();
      swift_bridgeObjectRetain();
      sub_244F1B880();
      v19 = sub_244F1BD18();
      v20 = -1 << *(_BYTE *)(v2 + 32);
      v21 = v19 & ~v20;
      if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
        break;
LABEL_6:
      swift_bridgeObjectRelease();
    }
    v22 = *(_QWORD *)(v2 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_244F1BCA0() & 1) != 0)
    {
      isStackAllocationSafe = swift_bridgeObjectRelease();
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
    }
    else
    {
      v25 = ~v20;
      do
      {
        v21 = (v21 + 1) & v25;
        if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          goto LABEL_6;
        v26 = (_QWORD *)(v22 + 16 * v21);
        v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_244F1BCA0() & 1) == 0);
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
      isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    v29 = *(_BYTE *)(v2 + 32);
    v30 = (unint64_t)((1 << v29) + 63) >> 6;
    v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x24BDAC7A8](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      v32 = sub_244F098B8((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_244F0F80C();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      v32 = sub_244F098B8((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_244F0F80C();
      MEMORY[0x24952AE88](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
}

uint64_t sub_244F09450(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_244F1BD00();
  swift_bridgeObjectRetain();
  sub_244F1B880();
  v6 = sub_244F1BD18();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_244F1BCA0() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_244F1BCA0() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_244F09E40();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_244F0A29C(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_244F095DC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C770);
  v3 = sub_244F1BA90();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_244F1BD00();
      sub_244F1B880();
      result = sub_244F1BD18();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_244F098B8(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t i;
  unint64_t v33;
  _QWORD *v34;
  BOOL v35;
  int64_t v36;
  uint64_t v38;
  unint64_t *v39;
  uint64_t v40;

  v7 = *(_QWORD *)(a3 + 16);
  v39 = (unint64_t *)result;
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v8 = v7 - 1;
  v40 = a3 + 56;
  while (2)
  {
    v38 = v8;
    do
    {
      while (1)
      {
        v9 = a5[3];
        v10 = a5[4];
        if (v10)
        {
          v11 = (v10 - 1) & v10;
          v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_16;
        }
        v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        v14 = (unint64_t)(a5[2] + 64) >> 6;
        v15 = a5[3];
        if (v13 >= v14)
          goto LABEL_45;
        v16 = a5[1];
        v17 = *(_QWORD *)(v16 + 8 * v13);
        if (!v17)
        {
          v18 = v9 + 2;
          v15 = v9 + 1;
          if (v9 + 2 >= v14)
            goto LABEL_45;
          v17 = *(_QWORD *)(v16 + 8 * v18);
          if (!v17)
          {
            v15 = v9 + 2;
            if (v9 + 3 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              v13 = v9 + 3;
              goto LABEL_15;
            }
            v18 = v9 + 4;
            v15 = v9 + 3;
            if (v9 + 4 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * v18);
            if (!v17)
            {
              v13 = v9 + 5;
              v15 = v9 + 4;
              if (v9 + 5 >= v14)
                goto LABEL_45;
              v17 = *(_QWORD *)(v16 + 8 * v13);
              if (!v17)
              {
                v15 = v14 - 1;
                v36 = v9 + 6;
                while (v14 != v36)
                {
                  v17 = *(_QWORD *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return sub_244F09BAC(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          v13 = v18;
        }
LABEL_15:
        v11 = (v17 - 1) & v17;
        v12 = __clz(__rbit64(v17)) + (v13 << 6);
        v9 = v13;
LABEL_16:
        v19 = (uint64_t *)(*(_QWORD *)(*a5 + 48) + 16 * v12);
        v21 = *v19;
        v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_244F1BD00();
        swift_bridgeObjectRetain();
        sub_244F1B880();
        v22 = sub_244F1BD18();
        v23 = -1 << *(_BYTE *)(a3 + 32);
        v24 = v22 & ~v23;
        v25 = v24 >> 6;
        v26 = 1 << v24;
        if (((1 << v24) & *(_QWORD *)(v40 + 8 * (v24 >> 6))) == 0)
          goto LABEL_3;
        v27 = *(_QWORD *)(a3 + 48);
        v28 = (_QWORD *)(v27 + 16 * v24);
        v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_244F1BCA0() & 1) != 0)
          break;
        v31 = ~v23;
        for (i = v24 + 1; ; i = v33 + 1)
        {
          v33 = i & v31;
          if (((*(_QWORD *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0)
            break;
          v34 = (_QWORD *)(v27 + 16 * v33);
          v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_244F1BCA0() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v25 = v33 >> 6;
            v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        result = swift_bridgeObjectRelease();
      }
      result = swift_bridgeObjectRelease();
LABEL_23:
      v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1)
      continue;
    return MEMORY[0x24BEE4B08];
  }
}

uint64_t sub_244F09BAC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C770);
  result = sub_244F1BA9C();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_244F1BD00();
    swift_bridgeObjectRetain();
    sub_244F1B880();
    result = sub_244F1BD18();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

void *sub_244F09E40()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C770);
  v2 = *v0;
  v3 = sub_244F1BA84();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_244F09FF0()
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
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C770);
  v3 = sub_244F1BA90();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
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
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_244F1BD00();
    swift_bridgeObjectRetain();
    sub_244F1B880();
    result = sub_244F1BD18();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_244F0A29C(unint64_t result)
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
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_244F1BA78();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_244F1BD00();
        swift_bridgeObjectRetain();
        sub_244F1B880();
        v10 = sub_244F1BD18();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
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
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_244F0A460(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_244F095DC();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_244F09E40();
      goto LABEL_22;
    }
    sub_244F09FF0();
  }
  v11 = *v4;
  sub_244F1BD00();
  sub_244F1B880();
  result = sub_244F1BD18();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_244F1BCA0(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_244F1BCB8();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_244F1BCA0();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_244F0A5F8(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_244F1BCA0() & 1;
}

uint64_t sub_244F0A64C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_244F0A848(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F0A938(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int64_t v3;
  uint64_t v4;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v42 = MEMORY[0x24BEE4AF8];
    sub_244F17584(0, v3, 0);
    v4 = v42;
    v6 = (uint64_t *)(a1 + 64);
    while (1)
    {
      v38 = v3;
      v8 = *(v6 - 4);
      v7 = *(v6 - 3);
      v9 = *(v6 - 1);
      v10 = v6[1];
      v34 = *v6;
      v35 = *(v6 - 2);
      v11 = v6[3];
      v36 = v6[4];
      v37 = v6[2];
      v12 = v6[7];
      v32 = v6[8];
      v33 = v6[6];
      v13 = *(_QWORD *)(a2 + 16);
      v40 = v6[5];
      swift_bridgeObjectRetain();
      v39 = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v41 = v9;
      if (!v13)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_11;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v14 = v10;
      swift_bridgeObjectRetain();
      v15 = v11;
      swift_bridgeObjectRetain();
      v16 = sub_244F11EF0(v8, v7);
      if ((v17 & 1) == 0)
        break;
      v31 = v8;
      v18 = (uint64_t *)(*(_QWORD *)(a2 + 56) + 16 * v16);
      v20 = *v18;
      v19 = v18[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v22 = *(_QWORD *)(v4 + 16);
      v21 = *(_QWORD *)(v4 + 24);
      v23 = v4;
      if (v22 >= v21 >> 1)
      {
        sub_244F17584(v21 > 1, v22 + 1, 1);
        v23 = v4;
      }
      *(_QWORD *)(v23 + 16) = v22 + 1;
      v24 = (_QWORD *)(v23 + 120 * v22);
      v24[4] = v31;
      v24[5] = v7;
      v24[6] = v35;
      v24[7] = v41;
      v24[8] = v34;
      v24[9] = v14;
      v24[10] = v33;
      v24[11] = v39;
      v24[12] = v32;
      v24[13] = v37;
      v24[14] = v15;
      v24[15] = v36;
      v24[16] = v40;
      v24[17] = v20;
      v6 += 13;
      v24[18] = v19;
      v3 = v38 - 1;
      v4 = v23;
      if (v38 == 1)
        return v4;
    }
    swift_bridgeObjectRelease();
LABEL_11:
    v26 = *a3;
    v25 = a3[1];
    swift_bridgeObjectRetain();
    sub_244F1BAB4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_244F1B8A4();
    swift_bridgeObjectRelease();
    sub_244F0F814();
    swift_allocError();
    *(_QWORD *)v27 = v26;
    *(_QWORD *)(v27 + 8) = v25;
    *(_QWORD *)(v27 + 16) = 0xD000000000000017;
    *(_QWORD *)(v27 + 24) = 0x8000000244F203F0;
    *(_QWORD *)(v27 + 32) = 0;
    *(_QWORD *)(v27 + 40) = 0;
    *(_QWORD *)(v27 + 48) = 0;
    *(_QWORD *)(v27 + 56) = 0x8000000000000000;
    *(_OWORD *)(v27 + 64) = 0u;
    *(_OWORD *)(v27 + 80) = 0u;
    swift_willThrow();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

char *sub_244F0AC34(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F0AD1C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F0AE0C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C860);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F0AF18(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C530);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F0B024(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7D0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

char *sub_244F0B130(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F0B218(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4D8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F0B320(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C790);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F0B42C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t result;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;

  v15 = *(_QWORD *)(a1 + 16);
  if (v15)
  {
    v2 = 0;
    v16 = a1 + 32;
    while (1)
    {
      v3 = v16 + 24 * v2;
      v4 = *(_QWORD **)v3;
      v5 = *(_QWORD *)(*(_QWORD *)v3 + 16);
      if (v5)
      {
        v6 = *(_QWORD *)(a2 + 16);
        v7 = *(_QWORD *)(a2 + 24);
        v8 = v4[4] == v6 && v4[5] == v7;
        if (v8 || (result = sub_244F1BCA0(), (result & 1) != 0))
        {
LABEL_20:
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          return (uint64_t)v4;
        }
        if (v5 != 1)
          break;
      }
LABEL_3:
      if (++v2 == v15)
        return 0;
    }
    v10 = v4 + 7;
    v11 = 1;
    while (1)
    {
      v12 = v11 + 1;
      if (__OFADD__(v11, 1))
        break;
      if (*(v10 - 1) == v6 && *v10 == v7)
        goto LABEL_20;
      result = sub_244F1BCA0();
      if ((result & 1) != 0)
        goto LABEL_20;
      v10 += 2;
      ++v11;
      if (v12 == v5)
        goto LABEL_3;
    }
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t sub_244F0B58C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_244F1B9A0();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_244F08CA8(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_244F0B620(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F0B710(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7A8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

char *sub_244F0B818(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F0B8FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F0B9EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
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
    v6 = a4 + 8 * a1 + 32;
    v7 = a3 + 8 * v5;
    if (v6 >= v7 || v6 + 8 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F0BAF0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  _QWORD *v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  unsigned int v127;
  unsigned int v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _OWORD v150[13];
  uint64_t v151;
  __int128 v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  unsigned int v162;
  unsigned int v163;
  int v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  _OWORD v178[17];
  __int128 v179;
  uint64_t v180[4];
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  uint64_t v189;

  v189 = a4;
  v135 = a5;
  v8 = *a3;
  v131 = a3[1];
  v132 = v8;
  v9 = a3[2];
  v129 = a3[3];
  v130 = v9;
  LODWORD(v9) = *((_DWORD *)a3 + 8);
  v127 = *((_DWORD *)a3 + 9);
  v128 = v9;
  v126 = *((_DWORD *)a3 + 10);
  v10 = a3[6];
  v124 = a3[7];
  v125 = v10;
  v11 = a3[8];
  v122 = a3[9];
  v123 = v11;
  v12 = sub_244F1B844();
  MEMORY[0x24BDAC7A8](v12);
  v121 = (char *)&v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C750);
  v133 = *(_QWORD *)(v14 - 8);
  v134 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_244F1B598();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v98 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244F1B5C8();
  swift_allocObject();
  v21 = sub_244F1B5BC();
  sub_244F1B58C();
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, *MEMORY[0x24BDCB1A0], v17);
  sub_244F1B5A4();
  sub_244F0F4EC();
  v22 = v136;
  sub_244F1B5B0();
  if (v22)
  {
    swift_release();
    sub_244EEA990(a1, a2);
    swift_release();
    return sub_244EEAA84((uint64_t)a3);
  }
  v115 = v16;
  v187 = v178[16];
  v188 = v179;
  v185 = v178[14];
  v186 = v178[15];
  v184 = v178[13];
  v24 = *((_QWORD *)&v179 + 1);
  v25 = sub_244F0B42C(*((uint64_t *)&v179 + 1), (uint64_t)a3);
  if (!v25)
  {
    swift_release();
    sub_244EEA990(a1, a2);
    sub_244EEAA84((uint64_t)a3);
    swift_release();
    sub_244F0F530((uint64_t)&v184);
    sub_244F0F5A0(&v152);
    sub_244EF1360((uint64_t)&v152, (uint64_t)v178, &qword_25742C738);
    return sub_244EF1360((uint64_t)v178, v135, &qword_25742C738);
  }
  v118 = a2;
  v119 = a3;
  v111 = v24;
  v116 = v21;
  v117 = a1;
  v28 = *((_QWORD *)&v184 + 1);
  v29 = *((_QWORD *)&v185 + 1);
  v113 = v184;
  v114 = v185;
  v30 = *((_QWORD *)&v186 + 1);
  v112 = v186;
  v31 = v25;
  v32 = v26;
  v33 = v27;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v136 = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v120 = v33;
  swift_bridgeObjectRetain();
  sub_244F0F5C4((uint64_t)&v184);
  v34 = swift_bridgeObjectRetain();
  v35 = sub_244F0A938(v34, v32, (uint64_t *)&v184);
  v109 = v29;
  v110 = v30;
  sub_244F0F530((uint64_t)&v184);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v152 = v35;
  swift_getKeyPath();
  v36 = v115;
  sub_244F1B688();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C6E8);
  sub_244F0F634(&qword_25742C760, &qword_25742C6E8, MEMORY[0x24BEE12C8]);
  sub_244F0F634(&qword_25742C768, &qword_25742C750, MEMORY[0x24BDCC6C8]);
  v37 = v134;
  v38 = sub_244F1B928();
  (*(void (**)(char *, uint64_t))(v133 + 8))(v36, v37);
  swift_bridgeObjectRelease();
  v39 = v119;
  v115 = (char *)v119[1];
  v108 = v119[3];
  v40 = v119[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_244EEAA3C((uint64_t)v39);
  v41 = sub_244F0494C(v32);
  v42 = 0;
  v133 = v40;
  v134 = v38;
  v43 = v41;
  v105 = 0;
  v106 = v28;
  swift_bridgeObjectRelease();
  v44 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v152 = MEMORY[0x24BEE4AF8];
  v45 = *(_QWORD *)(v43 + 16);
  if (v45)
  {
    swift_bridgeObjectRetain();
    v46 = 56;
    v47 = v119;
    do
    {
      v48 = swift_bridgeObjectRetain();
      sub_244F064B0(v48);
      v46 += 32;
      --v45;
    }
    while (v45);
    swift_bridgeObjectRelease();
    v44 = v152;
  }
  else
  {
    v47 = v119;
  }
  v49 = sub_244F0B58C(v44);
  swift_bridgeObjectRelease();
  v104 = swift_bridgeObjectRetain();
  v50 = sub_244F05BCC(v104);
  v51 = swift_bridgeObjectRetain();
  v52 = sub_244F05D60(v51, v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v53 = *(_QWORD *)(v52 + 16);
  v54 = *(_QWORD *)(v49 + 16);
  v55 = v118;
  v107 = v43;
  if (v53 <= v54 >> 3)
  {
    *(_QWORD *)&v152 = v49;
    sub_244F08E54(v52);
    swift_bridgeObjectRelease();
    v56 = v152;
  }
  else
  {
    v56 = sub_244F08FE8(v52, v49);
    swift_bridgeObjectRelease();
  }
  v57 = v47[6];
  v58 = v47[7];
  v59 = v47[8];
  v60 = sub_244F08BC4(v56);
  swift_bridgeObjectRelease();
  v61 = v189;
  swift_retain();
  sub_244EFE27C(v57, v58, v59, (uint64_t)v60, v61, v180);
  v101 = v180[2];
  v102 = v180[1];
  v62 = v181;
  v100 = v180[3];
  v182 = v180[0];
  v183 = v181;
  v136 = v180[0];
  sub_244EF3348((uint64_t)&v183);
  sub_244EF3348((uint64_t)&v182);
  v63 = sub_244F0531C(0, 0, v59);
  v64 = *(_QWORD *)(v62 + 16);
  v65 = MEMORY[0x24BEE4AF8];
  v103 = 0;
  v120 = v62;
  if (v64)
  {
    v99 = v63;
    *(_QWORD *)&v152 = MEMORY[0x24BEE4AF8];
    sub_244F1754C(0, v64, 0);
    v65 = v152;
    v66 = (uint64_t *)(v62 + 40);
    v67 = v104;
    do
    {
      v68 = *v66;
      if (*v66)
        v69 = *(v66 - 1);
      else
        v69 = 0;
      *(_QWORD *)&v152 = v65;
      v71 = *(_QWORD *)(v65 + 16);
      v70 = *(_QWORD *)(v65 + 24);
      swift_bridgeObjectRetain();
      if (v71 >= v70 >> 1)
      {
        sub_244F1754C(v70 > 1, v71 + 1, 1);
        v65 = v152;
      }
      v66 += 4;
      *(_QWORD *)(v65 + 16) = v71 + 1;
      v72 = v65 + 16 * v71;
      *(_QWORD *)(v72 + 32) = v69;
      *(_QWORD *)(v72 + 40) = v68;
      --v64;
    }
    while (v64);
    v42 = v103;
    v55 = v118;
    v63 = v99;
  }
  else
  {
    v67 = v104;
  }
  *(_QWORD *)&v152 = v63;
  sub_244F06344(v65);
  v73 = v152;
  v74 = v134;
  v75 = *(_QWORD *)(v134 + 16);
  v76 = MEMORY[0x24BEE4AF8];
  if (v75)
  {
    v104 = v152;
    *(_QWORD *)&v152 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_244F172C0(0, v75, 0);
    v77 = v152;
    v78 = (uint64_t *)(v74 + 40);
    do
    {
      v79 = *(v78 - 1);
      v80 = *v78;
      *(_QWORD *)&v152 = v77;
      v82 = *(_QWORD *)(v77 + 16);
      v81 = *(_QWORD *)(v77 + 24);
      swift_bridgeObjectRetain();
      if (v82 >= v81 >> 1)
      {
        sub_244F172C0(v81 > 1, v82 + 1, 1);
        v77 = v152;
      }
      v78 += 15;
      *(_QWORD *)(v77 + 16) = v82 + 1;
      v83 = v77 + 16 * v82;
      *(_QWORD *)(v83 + 32) = v79;
      *(_QWORD *)(v83 + 40) = v80;
      --v75;
    }
    while (v75);
    v74 = v134;
    swift_bridgeObjectRelease();
    v42 = v103;
    v73 = v104;
    v55 = v118;
    v76 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v77 = MEMORY[0x24BEE4AF8];
  }
  type metadata accessor for Evaluator();
  swift_allocObject();
  swift_bridgeObjectRetain();
  v84 = sub_244F10A0C(v107, v77, v67, v73);
  v85 = v114;
  if (!v42)
  {
    v133 = v84;
    swift_retain();
    sub_244F1B838();
    result = sub_244F1B814();
    if (!v87)
    {
      __break(1u);
      return result;
    }
    v88 = v87;
    v134 = result;
    v103 = 0;
    v151 = v76;
    v89 = *(_QWORD *)(v111 + 16);
    if (v89)
    {
      swift_bridgeObjectRetain_n();
      v121 = v88;
      swift_bridgeObjectRetain();
      v90 = 32;
      do
      {
        v91 = swift_bridgeObjectRetain();
        sub_244F061F4(v91);
        v90 += 24;
        --v89;
      }
      while (v89);
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      v189 = v151;
      v88 = v121;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_release();
      swift_release();
      v189 = MEMORY[0x24BEE4AF8];
    }
    sub_244EEA990(v117, v118);
    sub_244F0F530((uint64_t)&v184);
    swift_bridgeObjectRelease();
    v92 = v106;
    *(_QWORD *)&v137 = v113;
    *((_QWORD *)&v137 + 1) = v106;
    v94 = v109;
    v93 = v110;
    *(_QWORD *)&v138 = v85;
    *((_QWORD *)&v138 + 1) = v109;
    *(_QWORD *)&v139 = v112;
    *((_QWORD *)&v139 + 1) = v110;
    *(_QWORD *)&v140 = v74;
    *((_QWORD *)&v140 + 1) = v132;
    *(_QWORD *)&v141 = v131;
    *((_QWORD *)&v141 + 1) = v130;
    *(_QWORD *)&v142 = v129;
    *((_QWORD *)&v142 + 1) = __PAIR64__(v127, v128);
    LODWORD(v143) = v126;
    *((_QWORD *)&v143 + 1) = v125;
    *(_QWORD *)&v144 = v124;
    *((_QWORD *)&v144 + 1) = v123;
    *(_QWORD *)&v145 = v122;
    v95 = v136;
    *((_QWORD *)&v145 + 1) = v136;
    *(_QWORD *)&v146 = v102;
    *((_QWORD *)&v146 + 1) = v101;
    *(_QWORD *)&v147 = v100;
    v96 = v120;
    v97 = v133;
    *((_QWORD *)&v147 + 1) = v120;
    *(_QWORD *)&v148 = v133;
    *((_QWORD *)&v148 + 1) = v189;
    *(_QWORD *)&v149 = v134;
    *((_QWORD *)&v149 + 1) = v88;
    sub_244F0F674((uint64_t)&v137);
    swift_release();
    swift_bridgeObjectRelease();
    sub_244EF3370((uint64_t)&v182);
    sub_244EF3370((uint64_t)&v183);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_244EEAA84((uint64_t)v119);
    v150[10] = v147;
    v150[11] = v148;
    v150[12] = v149;
    v150[6] = v143;
    v150[7] = v144;
    v150[8] = v145;
    v150[9] = v146;
    v150[2] = v139;
    v150[3] = v140;
    v150[4] = v141;
    v150[5] = v142;
    v150[0] = v137;
    v150[1] = v138;
    nullsub_1(v150);
    *(_QWORD *)&v152 = v113;
    *((_QWORD *)&v152 + 1) = v92;
    v153 = v114;
    v154 = v94;
    v155 = v112;
    v156 = v93;
    v157 = v74;
    v158 = v132;
    v159 = v131;
    v160 = v130;
    v161 = v129;
    v162 = v128;
    v163 = v127;
    v164 = v126;
    v165 = v125;
    v166 = v124;
    v167 = v123;
    v168 = v122;
    v169 = v95;
    v170 = v102;
    v171 = v101;
    v172 = v100;
    v173 = v96;
    v174 = v97;
    v175 = v189;
    v176 = v134;
    v177 = v88;
    sub_244F0F740((uint64_t)&v152);
    sub_244EF1360((uint64_t)v150, (uint64_t)v178, &qword_25742C738);
    return sub_244EF1360((uint64_t)v178, v135, &qword_25742C738);
  }
  swift_release();
  sub_244EEA990(v117, v55);
  sub_244EF3370((uint64_t)&v182);
  sub_244EF3370((uint64_t)&v183);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_244EEAA84((uint64_t)v119);
  swift_bridgeObjectRelease();
  sub_244F0F530((uint64_t)&v184);
  swift_release();
  v86 = v105;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v86)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244F0C818(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 208 * a1 + 32;
    v6 = a3 + 208 * v4;
    if (v5 >= v6 || v5 + 208 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

_QWORD *sub_244F0C908(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  _QWORD *v47;
  uint64_t *v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  void (*v62)(char *, unint64_t, uint64_t);
  _QWORD *v63;
  unint64_t v64;
  void *v65;
  id v66;
  void *v67;
  unsigned int v68;
  id v69;
  void *v70;
  id v71;
  _QWORD *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  BOOL v89;
  unint64_t v90;
  _QWORD *v91;
  BOOL v92;
  unint64_t v93;
  unint64_t v94;
  char *v95;
  uint64_t v96;
  int64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  char *v107;
  _QWORD *v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  void (*v115)(char *, char *, uint64_t);
  int v116;
  char *v117;
  void (*v118)(char *, char *, uint64_t);
  char *v119;
  char *v120;
  _QWORD *v121;
  uint64_t v122;
  _QWORD *v123;
  uint64_t v124;
  unint64_t v125;
  void (*v126)(char *, uint64_t);
  unint64_t v127;
  unint64_t v128;
  _QWORD *v129;
  _OWORD *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  int has_internal_content;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void (*v144)(unint64_t, uint64_t, uint64_t);
  char *v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  void (*v150)(char *, uint64_t);
  id v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  char *v156;
  char *v157;
  unint64_t v158;
  char *v159;
  _QWORD *v160;
  uint64_t v161;
  char *v162;
  char *v163;
  char *v164;
  unint64_t v165;
  _QWORD *v166;
  _QWORD *v167;
  char *v168;
  char *v169;
  char *v170;
  uint64_t v171;
  unint64_t v172;
  _QWORD *v173;
  char *v174;
  uint64_t v175;
  char *v176;
  char *v177;
  _QWORD *v178;
  void (*v179)(char *, char *, uint64_t);
  uint64_t v180;
  uint64_t v181;
  char *v182;
  uint64_t v183;
  _QWORD *v184;
  _OWORD v185[13];
  id v186[26];
  _QWORD v187[26];
  _QWORD v188[28];

  v166 = (_QWORD *)a2;
  v188[26] = *MEMORY[0x24BDAC8D0];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742BBA0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v154 = (char *)&v153 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v153 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v153 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v176 = (char *)&v153 - v12;
  v178 = (_QWORD *)sub_244F1B6F4();
  v13 = *(v178 - 1);
  MEMORY[0x24BDAC7A8](v178);
  v15 = (uint64_t *)((char *)&v153 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = sub_244F1B754();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v164 = (char *)&v153 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v163 = (char *)&v153 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v177 = (char *)&v153 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v174 = (char *)&v153 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v168 = (char *)&v153 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v170 = (char *)&v153 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v159 = (char *)&v153 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v153 - v32;
  sub_244F1B844();
  v34 = MEMORY[0x24BDAC7A8](a1);
  v181 = v16;
  v169 = v8;
  if (v34)
  {
    v160 = (_QWORD *)v34;
    swift_bridgeObjectRetain();
    v35 = (unint64_t)v166;
    goto LABEL_3;
  }
  v182 = v33;
  v173 = v15;
  v175 = v13;
  if (getenv("RECOUNT_MODES_PATH") && (sub_244F1B838(), v39 = sub_244F1B82C(), v40))
  {
    v41 = v39;
    v42 = v40;
    v186[0] = (id)59;
    v186[1] = (id)0xE100000000000000;
    MEMORY[0x24BDAC7A8](v39);
    *(&v153 - 2) = (uint64_t)v186;
    swift_bridgeObjectRetain();
    v43 = v41;
    v44 = v171;
    v45 = sub_244F072D4(0x7FFFFFFFFFFFFFFFLL, 1, sub_244F0F424, (uint64_t)(&v153 - 4), v43, v42);
    v36 = (_QWORD *)v44;
    swift_bridgeObjectRelease();
    v46 = *(_QWORD *)(v45 + 16);
    v35 = (unint64_t)v166;
    if (v46)
    {
      v171 = v44;
      v156 = v11;
      v186[0] = (id)MEMORY[0x24BEE4AF8];
      v179 = (void (*)(char *, char *, uint64_t))v46;
      sub_244F175A0(0, v46, 0);
      v47 = v186[0];
      LODWORD(v172) = *MEMORY[0x24BDCD7B0];
      v167 = (_QWORD *)v45;
      v48 = (uint64_t *)(v45 + 56);
      v49 = v178;
      v180 = v17;
      v50 = v173;
      do
      {
        v52 = *(v48 - 3);
        v51 = *(v48 - 2);
        v53 = v17;
        v55 = *(v48 - 1);
        v54 = *v48;
        swift_bridgeObjectRetain();
        MEMORY[0x24952A4EC](v52, v51, v55, v54);
        (*(void (**)(_QWORD *, _QWORD, _QWORD *))(v175 + 104))(v50, v172, v49);
        v56 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56);
        v57 = v181;
        v56(v176, 1, 1, v181);
        sub_244F1B73C();
        swift_bridgeObjectRelease();
        v186[0] = v47;
        v58 = v57;
        v60 = v47[2];
        v59 = v47[3];
        if (v60 >= v59 >> 1)
        {
          sub_244F175A0(v59 > 1, v60 + 1, 1);
          v47 = v186[0];
        }
        v47[2] = v60 + 1;
        v61 = v180;
        (*(void (**)(unint64_t, char *, uint64_t))(v180 + 32))((unint64_t)v47+ ((*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80))+ *(_QWORD *)(v180 + 72) * v60, v182, v58);
        v48 += 4;
        v49 = v178;
        v179 = (void (*)(char *, char *, uint64_t))((char *)v179 - 1);
        v16 = v58;
        v17 = v61;
      }
      while (v179);
      v160 = v47;
      swift_bridgeObjectRelease();
      v35 = (unint64_t)v166;
      v11 = v156;
      v8 = v169;
      goto LABEL_3;
    }
    swift_bridgeObjectRelease();
    v160 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v16 = v181;
  }
  else
  {
    has_internal_content = os_variant_has_internal_content();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C730);
    v62 = *(void (**)(char *, unint64_t, uint64_t))(v17 + 72);
    v141 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    v35 = (unint64_t)v166;
    v36 = (_QWORD *)v171;
    if (has_internal_content)
    {
      v142 = swift_allocObject();
      *(_OWORD *)(v142 + 16) = xmmword_244F1ECC0;
      v160 = (_QWORD *)v142;
      v38 = v142 + v141;
      if (qword_25742BA38 != -1)
        goto LABEL_105;
      goto LABEL_89;
    }
    v147 = swift_allocObject();
    *(_OWORD *)(v147 + 16) = xmmword_244F1D140;
    v160 = (_QWORD *)v147;
    v148 = v147 + v141;
    if (qword_25742BA30 != -1)
      swift_once();
    v16 = v181;
    v149 = __swift_project_value_buffer(v181, (uint64_t)qword_257432C70);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 16))(v148, v149, v16);
  }
LABEL_4:
  v184 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v183 = MEMORY[0x24BEE4B08];
  sub_244EEAA3C(v35);
  v37 = sub_244EF77A8(v35);
  v38 = (unint64_t)v159;
  v167 = v36;
  if (v36)
    goto LABEL_5;
  v62 = (void (*)(char *, unint64_t, uint64_t))v37;
  v63 = v160;
  v155 = v160[2];
  if (!v155)
  {
    v176 = *(char **)(v17 + 56);
LABEL_93:
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v176)(v11, 1, 1, v16);
    swift_release();
    goto LABEL_100;
  }
  v64 = 0;
  v165 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v156 = v11;
  v157 = (char *)v160 + v165;
  v35 = 0x2515F4000;
  v180 = v17;
  v162 = (char *)v37;
  while (1)
  {
    if (v64 >= v63[2])
      goto LABEL_104;
    v182 = *(char **)(v17 + 72);
    v179 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    v179(v11, &v157[(_QWORD)v182 * v64], v16);
    v176 = *(char **)(v17 + 56);
    ((void (*)(char *, _QWORD, uint64_t, uint64_t))v176)(v11, 0, 1, v16);
    v175 = *(_QWORD *)(v17 + 48);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v175)(v11, 1, v16) == 1)
    {
      swift_release();
LABEL_100:
      swift_bridgeObjectRelease();
      v38 = (unint64_t)v184;
      swift_bridgeObjectRelease();
      return (_QWORD *)v38;
    }
    v158 = v64;
    v178 = *(_QWORD **)(v17 + 32);
    ((void (*)(unint64_t, char *, uint64_t))v178)(v38, v11, v16);
    v65 = (void *)objc_opt_self();
    v66 = objc_msgSend(v65, *(SEL *)(v35 + 2800));
    sub_244F1B730();
    v67 = (void *)sub_244F1B7FC();
    swift_bridgeObjectRelease();
    v68 = objc_msgSend(v66, sel_fileExistsAtPath_, v67);

    if (v68)
      break;
    v62 = (void (*)(char *, unint64_t, uint64_t))v162;
    v17 = v180;
LABEL_17:
    v38 = (unint64_t)v159;
    v64 = v158 + 1;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v159, v16);
    v11 = v156;
    v63 = v160;
    v35 = (unint64_t)&off_2515F4000;
    if (v64 == v155)
      goto LABEL_93;
  }
  v69 = objc_msgSend(v65, (SEL)(v35 + 695));
  v70 = (void *)sub_244F1B718();
  v186[0] = 0;
  v71 = objc_msgSend(v69, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v70, 0, 0, v186);

  v38 = (unint64_t)v186[0];
  v11 = v170;
  if (!v71)
  {
    v152 = v186[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v38 = sub_244F1B6DC();

    v167 = (_QWORD *)v38;
    swift_willThrow();
    swift_release();
    (*(void (**)(char *, uint64_t))(v180 + 8))(v159, v16);
    goto LABEL_5;
  }
  v17 = sub_244F1B94C();
  v72 = (id)v38;

  *(_QWORD *)&v185[0] = MEMORY[0x24BEE4AF8];
  v173 = *(_QWORD **)(v17 + 16);
  if (v173)
  {
    v35 = 0;
    v171 = v17;
    v172 = v17 + v165;
    v73 = v168;
    v62 = (void (*)(char *, unint64_t, uint64_t))v179;
    do
    {
      if (v35 >= *(_QWORD *)(v17 + 16))
      {
        __break(1u);
LABEL_104:
        __break(1u);
LABEL_105:
        swift_once();
LABEL_89:
        v16 = v181;
        v143 = __swift_project_value_buffer(v181, (uint64_t)qword_257432C88);
        v144 = *(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 16);
        v144(v38, v143, v16);
        v145 = (char *)v62 + v38;
        if (qword_25742BA30 != -1)
          swift_once();
        v146 = __swift_project_value_buffer(v16, (uint64_t)qword_257432C70);
        v144((unint64_t)v145, v146, v16);
LABEL_3:
        v36 = (_QWORD *)v171;
        goto LABEL_4;
      }
      v62(v8, v172 + v35 * (_QWORD)v182, v16);
      ((void (*)(char *, _QWORD, uint64_t, uint64_t))v176)(v8, 0, 1, v16);
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v175)(v8, 1, v16) == 1)
        goto LABEL_59;
      ((void (*)(char *, char *, uint64_t))v178)(v11, v8, v16);
      if (sub_244F1B700() == 1852797802 && v75 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
        v62(v73, (unint64_t)v11, v16);
      }
      else
      {
        v76 = v8;
        v77 = sub_244F1BCA0();
        swift_bridgeObjectRelease();
        v62(v73, (unint64_t)v11, v16);
        if ((v77 & 1) == 0)
        {
          v8 = v76;
          v74 = v180;
          goto LABEL_25;
        }
      }
      v78 = v183;
      swift_bridgeObjectRetain();
      v79 = sub_244F1B70C();
      v81 = v80;
      if (!*(_QWORD *)(v78 + 16))
        goto LABEL_52;
      v82 = v79;
      sub_244F1BD00();
      sub_244F1B880();
      v83 = sub_244F1BD18();
      v84 = -1 << *(_BYTE *)(v78 + 32);
      v85 = v83 & ~v84;
      v86 = v78 + 56;
      if (((*(_QWORD *)(v78 + 56 + ((v85 >> 3) & 0xFFFFFFFFFFFFF8)) >> v85) & 1) == 0)
      {
LABEL_51:
        v16 = v181;
LABEL_52:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v73 = v168;
        (*(void (**)(char *, uint64_t))(v180 + 8))(v168, v16);
        v11 = v170;
        ((void (*)(char *, char *, uint64_t))v178)(v174, v170, v16);
        v38 = *(_QWORD *)&v185[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_244F175A0(0, *(_QWORD *)(v38 + 16) + 1, 1);
          v38 = *(_QWORD *)&v185[0];
        }
        v8 = v169;
        v17 = v171;
        v94 = *(_QWORD *)(v38 + 16);
        v93 = *(_QWORD *)(v38 + 24);
        if (v94 >= v93 >> 1)
        {
          sub_244F175A0(v93 > 1, v94 + 1, 1);
          v38 = *(_QWORD *)&v185[0];
        }
        *(_QWORD *)(v38 + 16) = v94 + 1;
        v95 = (char *)(v38 + v165 + v94 * (_QWORD)v182);
        v16 = v181;
        ((void (*)(char *, char *, uint64_t))v178)(v95, v174, v181);
        *(_QWORD *)&v185[0] = v38;
        v62 = (void (*)(char *, unint64_t, uint64_t))v179;
        goto LABEL_26;
      }
      v87 = *(_QWORD *)(v78 + 48);
      v88 = (_QWORD *)(v87 + 16 * v85);
      v89 = *v88 == v82 && v88[1] == v81;
      if (v89 || (sub_244F1BCA0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v16 = v181;
      }
      else
      {
        v161 = ~v84;
        v90 = (v85 + 1) & ~v84;
        if (((*(_QWORD *)(v86 + ((v90 >> 3) & 0xFFFFFFFFFFFFF8)) >> v90) & 1) == 0)
          goto LABEL_51;
        v16 = v181;
        while (1)
        {
          v91 = (_QWORD *)(v87 + 16 * v90);
          v92 = *v91 == v82 && v91[1] == v81;
          if (v92 || (sub_244F1BCA0() & 1) != 0)
            break;
          v90 = (v90 + 1) & v161;
          if (((*(_QWORD *)(v86 + ((v90 >> 3) & 0xFFFFFFFFFFFFF8)) >> v90) & 1) == 0)
            goto LABEL_52;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v74 = v180;
      v73 = v168;
      v8 = v169;
      v11 = v170;
LABEL_25:
      v38 = *(_QWORD *)(v74 + 8);
      ((void (*)(char *, uint64_t))v38)(v73, v16);
      ((void (*)(char *, uint64_t))v38)(v11, v16);
      v62 = (void (*)(char *, unint64_t, uint64_t))v179;
      v17 = v171;
LABEL_26:
      ++v35;
    }
    while ((_QWORD *)v35 != v173);
  }
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v176)(v8, 1, 1, v16);
LABEL_59:
  swift_bridgeObjectRelease();
  sub_244F0F1C8((uint64_t)v8);
  v96 = *(_QWORD *)&v185[0];
  v97 = *(_QWORD *)(*(_QWORD *)&v185[0] + 16);
  v172 = *(_QWORD *)&v185[0];
  if (v97)
  {
    v186[0] = (id)MEMORY[0x24BEE4AF8];
    sub_244F172C0(0, v97, 0);
    v98 = (char *)(v96 + v165);
    do
    {
      v99 = v177;
      v179(v177, v98, v16);
      v100 = sub_244F1B70C();
      v102 = v101;
      (*(void (**)(char *, uint64_t))(v180 + 8))(v99, v16);
      v103 = v186[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_244F172C0(0, v103[2] + 1, 1);
        v103 = v186[0];
      }
      v105 = v103[2];
      v104 = v103[3];
      v106 = v105 + 1;
      if (v105 >= v104 >> 1)
      {
        sub_244F172C0(v104 > 1, v105 + 1, 1);
        v103 = v186[0];
      }
      v103[2] = v106;
      v107 = (char *)&v103[2 * v105];
      *((_QWORD *)v107 + 4) = v100;
      *((_QWORD *)v107 + 5) = v102;
      v16 = v181;
      v98 = &v182[(_QWORD)v98];
      --v97;
    }
    while (v97);
    v108 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_68:
    v109 = v103 + 5;
    do
    {
      v110 = *(v109 - 1);
      v111 = *v109;
      swift_bridgeObjectRetain();
      sub_244F08CA8((uint64_t *)v186, v110, v111);
      swift_bridgeObjectRelease();
      v109 += 2;
      --v106;
    }
    while (v106);
  }
  else
  {
    v108 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v106 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    v103 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (v106)
      goto LABEL_68;
  }
  swift_bridgeObjectRelease();
  v112 = *(_QWORD *)(v172 + 16);
  if (!v112)
  {
    sub_244EEAA3C((uint64_t)v166);
    swift_retain();
    swift_retain();
    v173 = v108;
    v17 = v180;
    v114 = v154;
LABEL_74:
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v176)(v114, 1, 1, v16);
    goto LABEL_75;
  }
  v113 = v172 + v165;
  sub_244EEAA3C((uint64_t)v166);
  swift_retain();
  swift_retain();
  v114 = v154;
  v115 = v179;
  v179(v154, (char *)v113, v16);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v176)(v114, 0, 1, v16);
  v116 = ((uint64_t (*)(char *, uint64_t, uint64_t))v175)(v114, 1, v16);
  v17 = v180;
  if (v116 == 1)
  {
    v173 = v108;
LABEL_75:
    v62 = (void (*)(char *, unint64_t, uint64_t))v162;
    swift_release();
    swift_release();
    sub_244EEAA84((uint64_t)v166);
    swift_release();
    sub_244F06B0C((uint64_t)v173);
    v8 = v169;
    goto LABEL_17;
  }
  v117 = &v182[v113];
  v173 = v108;
  v118 = v115;
  while (1)
  {
    v120 = v163;
    ((void (*)(char *, char *, uint64_t))v178)(v163, v114, v16);
    v118(v164, v120, v16);
    v121 = v166;
    sub_244EEAA3C((uint64_t)v166);
    v122 = (uint64_t)v162;
    swift_retain();
    v123 = v167;
    v124 = sub_244F1B760();
    if (v123)
      break;
    sub_244F0BAF0(v124, v125, v121, v122, (uint64_t)v187);
    v167 = 0;
    sub_244EF1360((uint64_t)v187, (uint64_t)v186, &qword_25742C738);
    sub_244F0F2EC(v187, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_244F0F208);
    v126 = *(void (**)(char *, uint64_t))(v17 + 8);
    v126(v164, v16);
    sub_244EF1360((uint64_t)v187, (uint64_t)v188, &qword_25742C738);
    if (sub_244F0F2D4((uint64_t)v188) == 1)
    {
      v126(v163, v16);
      if (!--v112)
        goto LABEL_74;
    }
    else
    {
      sub_244F0F2EC(v187, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_244F0F358);
      v126(v163, v16);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v173 = sub_244F08934(0, v173[2] + 1, 1, v173);
      v128 = v173[2];
      v127 = v173[3];
      if (v128 >= v127 >> 1)
        v173 = sub_244F08934((_QWORD *)(v127 > 1), v128 + 1, 1, v173);
      sub_244EF1360((uint64_t)v186, (uint64_t)v185, &qword_25742C738);
      v129 = v173;
      v173[2] = v128 + 1;
      v130 = &v129[26 * v128];
      v130[2] = v185[0];
      v131 = v185[4];
      v133 = v185[1];
      v132 = v185[2];
      v130[5] = v185[3];
      v130[6] = v131;
      v130[3] = v133;
      v130[4] = v132;
      v134 = v185[8];
      v136 = v185[5];
      v135 = v185[6];
      v130[9] = v185[7];
      v130[10] = v134;
      v130[7] = v136;
      v130[8] = v135;
      v137 = v185[12];
      v139 = v185[9];
      v138 = v185[10];
      v130[13] = v185[11];
      v130[14] = v137;
      v130[11] = v139;
      v130[12] = v138;
      v16 = v181;
      if (!--v112)
        goto LABEL_74;
    }
    v119 = &v182[(_QWORD)v117];
    v118 = v179;
    v179(v114, v117, v16);
    ((void (*)(char *, _QWORD, uint64_t, uint64_t))v176)(v114, 0, 1, v16);
    v117 = v119;
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v175)(v114, 1, v16) == 1)
      goto LABEL_75;
  }
  v167 = v123;
  sub_244EEAA84((uint64_t)v121);
  swift_release();
  v150 = *(void (**)(char *, uint64_t))(v17 + 8);
  v150(v164, v16);
  v150(v163, v16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_244EEAA84((uint64_t)v121);
  v150(v159, v16);
  swift_bridgeObjectRelease();
  v38 = (unint64_t)v184;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
LABEL_5:
  swift_bridgeObjectRelease();
  return (_QWORD *)v38;
}

uint64_t sub_244F0DB0C()
{
  unint64_t v0;

  v0 = sub_244F1BB98();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

__n128 sub_244F0DB54@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  __n128 result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
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
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  unsigned int v79;
  unsigned int v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  __int128 v110;
  __n128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  unsigned int v134;
  unsigned int v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char v150;
  uint64_t v151;

  v106 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C750);
  v107 = *(_QWORD *)(v3 - 8);
  v108 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742C800);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244F0E990();
  v10 = (uint64_t)v109;
  sub_244F1BD24();
  if (v10)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v109 = v5;
    v12 = v108;
    v104 = a1;
    v105 = v7;
    LOBYTE(v123) = 0;
    v13 = sub_244F1BBD4();
    v15 = v14;
    LOBYTE(v123) = 1;
    swift_bridgeObjectRetain();
    v16 = sub_244F1BBD4();
    v103 = v17;
    v94 = v16;
    LOBYTE(v123) = 2;
    swift_bridgeObjectRetain();
    v102 = 0;
    v88 = sub_244F1BBD4();
    v89 = v13;
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C6E8);
    LOBYTE(v110) = 3;
    sub_244F0F858(&qword_25742C808, (uint64_t (*)(void))sub_244F0F8C0, MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    sub_244F1BBEC();
    v101 = v19;
    v87 = v15;
    *(_QWORD *)&v110 = v123;
    swift_getKeyPath();
    v20 = (uint64_t)v109;
    sub_244F1B688();
    sub_244F0F634(&qword_25742C760, &qword_25742C6E8, MEMORY[0x24BEE12C8]);
    sub_244F0F634(&qword_25742C768, &qword_25742C750, MEMORY[0x24BDCC6C8]);
    v21 = sub_244F1B928();
    (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v20, v12);
    swift_bridgeObjectRelease();
    LOBYTE(v110) = 4;
    sub_244F0F904();
    swift_bridgeObjectRetain();
    sub_244F1BBEC();
    v108 = v21;
    v22 = v123;
    v86 = v124;
    v23 = v125;
    v24 = v126;
    v25 = v9;
    v26 = v127;
    LOBYTE(v110) = 5;
    sub_244F0F948();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_244F1BBEC();
    v100 = v22;
    v107 = v26;
    v82 = v24;
    v83 = v23;
    v84 = v25;
    v85 = v6;
    v74 = v123;
    v27 = v126;
    v28 = v108;
    v29 = *(_QWORD *)(v108 + 16);
    v98 = v124;
    v99 = v132;
    v97 = v126;
    v81 = v125;
    v79 = HIDWORD(v127);
    v80 = v127;
    v78 = v128;
    v76 = v130;
    v77 = v129;
    v75 = v131;
    if (v29)
    {
      v123 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_244F17568(0, v29, 0);
      v109 = (char *)v123;
      v30 = (uint64_t *)(v28 + 144);
      do
      {
        v31 = *(v30 - 13);
        v90 = *(v30 - 14);
        v91 = v29;
        v32 = *(v30 - 11);
        v33 = *(v30 - 2);
        v92 = *(v30 - 1);
        v93 = v33;
        v34 = *v30;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        v95 = v31;
        swift_bridgeObjectRetain_n();
        v96 = v32;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v35 = sub_244F19904(v92, v34, MEMORY[0x24BEE4B00]);
        v92 = v36;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v37 = v95;
        swift_bridgeObjectRelease();
        v38 = (uint64_t)v109;
        v123 = (uint64_t)v109;
        v40 = *((_QWORD *)v109 + 2);
        v39 = *((_QWORD *)v109 + 3);
        if (v40 >= v39 >> 1)
        {
          sub_244F17568(v39 > 1, v40 + 1, 1);
          v38 = v123;
        }
        v30 += 15;
        *(_QWORD *)(v38 + 16) = v40 + 1;
        v109 = (char *)v38;
        v41 = (_QWORD *)(v38 + 32 * v40);
        v41[4] = v90;
        v41[5] = v37;
        v43 = v91;
        v42 = v92;
        v41[6] = v35;
        v41[7] = v42;
        v29 = v43 - 1;
      }
      while (v29);
      swift_bridgeObjectRelease();
      v44 = v87;
      v22 = v100;
      v27 = v97;
    }
    else
    {
      v44 = v87;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v109 = (char *)MEMORY[0x24BEE4AF8];
    }
    v45 = *(_QWORD *)(v107 + 16);
    if (v45)
    {
      v123 = MEMORY[0x24BEE4AF8];
      v46 = v107;
      sub_244F1754C(0, v45, 0);
      v47 = v123;
      v48 = (uint64_t *)(v46 + 40);
      do
      {
        v49 = *v48;
        if (*v48)
          v50 = *(v48 - 1);
        else
          v50 = 0;
        v123 = v47;
        v52 = *(_QWORD *)(v47 + 16);
        v51 = *(_QWORD *)(v47 + 24);
        swift_bridgeObjectRetain();
        if (v52 >= v51 >> 1)
        {
          sub_244F1754C(v51 > 1, v52 + 1, 1);
          v47 = v123;
        }
        v48 += 4;
        *(_QWORD *)(v47 + 16) = v52 + 1;
        v53 = v47 + 16 * v52;
        *(_QWORD *)(v53 + 32) = v50;
        *(_QWORD *)(v53 + 40) = v49;
        --v45;
      }
      while (v45);
      swift_bridgeObjectRelease();
      v44 = v87;
      v22 = v100;
      v27 = v97;
    }
    else
    {
      swift_bridgeObjectRelease();
      v47 = MEMORY[0x24BEE4AF8];
    }
    type metadata accessor for Evaluator();
    swift_allocObject();
    v54 = sub_244F10A0C((uint64_t)v109, 0, v99, v47);
    LOBYTE(v123) = 7;
    v55 = v54;
    swift_retain();
    v56 = v84;
    v57 = v85;
    v58 = sub_244F1BBD4();
    v96 = v55;
    v109 = (char *)v58;
    v60 = v59;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742BAC8);
    v150 = 6;
    sub_244F0F98C(&qword_25742C828, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    v95 = v60;
    swift_bridgeObjectRetain();
    sub_244F1BBEC();
    (*(void (**)(char *, uint64_t))(v105 + 8))(v56, v57);
    v105 = v151;
    *(_QWORD *)&v110 = v89;
    *((_QWORD *)&v110 + 1) = v44;
    v111.n128_u64[0] = v94;
    v111.n128_u64[1] = v103;
    v61 = v101;
    *(_QWORD *)&v112 = v88;
    *((_QWORD *)&v112 + 1) = v101;
    v62 = v108;
    *(_QWORD *)&v113 = v108;
    *((_QWORD *)&v113 + 1) = v74;
    *(_QWORD *)&v114 = v98;
    *((_QWORD *)&v114 + 1) = v81;
    *(_QWORD *)&v115 = v27;
    *((_QWORD *)&v115 + 1) = __PAIR64__(v79, v80);
    LODWORD(v116) = v78;
    *((_QWORD *)&v116 + 1) = v77;
    *(_QWORD *)&v117 = v76;
    *((_QWORD *)&v117 + 1) = v75;
    *(_QWORD *)&v118 = v99;
    *((_QWORD *)&v118 + 1) = v22;
    *(_QWORD *)&v119 = v86;
    *((_QWORD *)&v119 + 1) = v83;
    *(_QWORD *)&v120 = v82;
    *((_QWORD *)&v120 + 1) = v107;
    *(_QWORD *)&v121 = v96;
    *((_QWORD *)&v121 + 1) = v151;
    *(_QWORD *)&v122 = v109;
    *((_QWORD *)&v122 + 1) = v95;
    sub_244F0F674((uint64_t)&v110);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v63 = v98;
    swift_bridgeObjectRelease();
    v64 = v107;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v65 = v96;
    swift_release();
    v66 = v95;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v104);
    v123 = v89;
    v124 = v87;
    v125 = v94;
    v126 = v103;
    v127 = v88;
    v128 = v61;
    v129 = v62;
    v130 = v74;
    v131 = v63;
    v132 = v81;
    v133 = v97;
    v134 = v80;
    v135 = v79;
    v136 = v78;
    v137 = v77;
    v138 = v76;
    v139 = v75;
    v140 = v99;
    v141 = v22;
    v142 = v86;
    v143 = v83;
    v144 = v82;
    v145 = v64;
    v146 = v65;
    v147 = v105;
    v148 = (uint64_t)v109;
    v149 = v66;
    sub_244F0F740((uint64_t)&v123);
    v67 = v121;
    v68 = v106;
    *(_OWORD *)(v106 + 160) = v120;
    *(_OWORD *)(v68 + 176) = v67;
    *(_OWORD *)(v68 + 192) = v122;
    v69 = v117;
    *(_OWORD *)(v68 + 96) = v116;
    *(_OWORD *)(v68 + 112) = v69;
    v70 = v119;
    *(_OWORD *)(v68 + 128) = v118;
    *(_OWORD *)(v68 + 144) = v70;
    v71 = v113;
    *(_OWORD *)(v68 + 32) = v112;
    *(_OWORD *)(v68 + 48) = v71;
    v72 = v115;
    *(_OWORD *)(v68 + 64) = v114;
    *(_OWORD *)(v68 + 80) = v72;
    result = v111;
    *(_OWORD *)v68 = v110;
    *(__n128 *)(v68 + 16) = result;
  }
  return result;
}

unint64_t sub_244F0E990()
{
  unint64_t result;

  result = qword_25742C6E0;
  if (!qword_25742C6E0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1EBB4, &type metadata for Mode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C6E0);
  }
  return result;
}

unint64_t sub_244F0E9D4()
{
  unint64_t result;

  result = qword_25742C6F8;
  if (!qword_25742C6F8)
  {
    result = MEMORY[0x24952AE28](&protocol conformance descriptor for Metric, &type metadata for Metric);
    atomic_store(result, (unint64_t *)&qword_25742C6F8);
  }
  return result;
}

unint64_t sub_244F0EA18()
{
  unint64_t result;

  result = qword_25742C700;
  if (!qword_25742C700)
  {
    result = MEMORY[0x24952AE28](&protocol conformance descriptor for Settings, &type metadata for Settings);
    atomic_store(result, (unint64_t *)&qword_25742C700);
  }
  return result;
}

unint64_t sub_244F0EA5C()
{
  unint64_t result;

  result = qword_25742C708;
  if (!qword_25742C708)
  {
    result = MEMORY[0x24952AE28](&protocol conformance descriptor for Silicon, &type metadata for Silicon);
    atomic_store(result, (unint64_t *)&qword_25742C708);
  }
  return result;
}

uint64_t destroy for Mode()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Mode(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  v8 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v8;
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  v9 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v9;
  v10 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v10;
  v11 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Mode(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy208_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  result = *(__n128 *)(a2 + 144);
  v9 = *(_OWORD *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v10;
  *(__n128 *)(a1 + 144) = result;
  *(_OWORD *)(a1 + 160) = v9;
  return result;
}

uint64_t assignWithTake for Mode(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  swift_release();
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Mode(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 208))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Mode(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 200) = 0;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 208) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 208) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Mode()
{
  return &type metadata for Mode;
}

uint64_t storeEnumTagSinglePayload for Mode.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_244F0F058 + 4 * byte_244F1EA59[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_244F0F08C + 4 * byte_244F1EA54[v4]))();
}

uint64_t sub_244F0F08C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F0F094(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244F0F09CLL);
  return result;
}

uint64_t sub_244F0F0A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244F0F0B0);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_244F0F0B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F0F0BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Mode.CodingKeys()
{
  return &type metadata for Mode.CodingKeys;
}

unint64_t sub_244F0F0DC()
{
  unint64_t result;

  result = qword_25742C718;
  if (!qword_25742C718)
  {
    result = MEMORY[0x24952AE28](&unk_244F1EB8C, &type metadata for Mode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C718);
  }
  return result;
}

unint64_t sub_244F0F124()
{
  unint64_t result;

  result = qword_25742C720;
  if (!qword_25742C720)
  {
    result = MEMORY[0x24952AE28](&unk_244F1EAC4, &type metadata for Mode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C720);
  }
  return result;
}

unint64_t sub_244F0F16C()
{
  unint64_t result;

  result = qword_25742C728;
  if (!qword_25742C728)
  {
    result = MEMORY[0x24952AE28](&unk_244F1EAEC, &type metadata for Mode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742C728);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_244F0F1C8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742BBA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244F0F208(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_244F0F2D4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_244F0F2EC(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21],
    a1[22],
    a1[23],
    a1[24],
    a1[25]);
  return a1;
}

uint64_t sub_244F0F358(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_244F0F424(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_244F1BCA0() & 1;
}

uint64_t sub_244F0F478()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_244F0F49C()
{
  return swift_deallocObject();
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

unint64_t sub_244F0F4EC()
{
  unint64_t result;

  result = qword_25742C758;
  if (!qword_25742C758)
  {
    result = MEMORY[0x24952AE28](&unk_244F1DAFC, &type metadata for ModeSpec);
    atomic_store(result, (unint64_t *)&qword_25742C758);
  }
  return result;
}

uint64_t sub_244F0F530(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

double sub_244F0F5A0(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_244F0F5C4(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244F0F634(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24952AE28](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_244F0F674(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244F0F740(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_244F0F80C()
{
  return swift_release();
}

unint64_t sub_244F0F814()
{
  unint64_t result;

  result = qword_25742C7F8;
  if (!qword_25742C7F8)
  {
    result = MEMORY[0x24952AE28](&unk_244F1EC78, &type metadata for ModeError);
    atomic_store(result, (unint64_t *)&qword_25742C7F8);
  }
  return result;
}

uint64_t sub_244F0F858(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742C6E8);
    v8 = a2();
    result = MEMORY[0x24952AE28](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_244F0F8C0()
{
  unint64_t result;

  result = qword_25742C810;
  if (!qword_25742C810)
  {
    result = MEMORY[0x24952AE28](&protocol conformance descriptor for Metric, &type metadata for Metric);
    atomic_store(result, (unint64_t *)&qword_25742C810);
  }
  return result;
}

unint64_t sub_244F0F904()
{
  unint64_t result;

  result = qword_25742C818;
  if (!qword_25742C818)
  {
    result = MEMORY[0x24952AE28](&protocol conformance descriptor for Settings, &type metadata for Settings);
    atomic_store(result, (unint64_t *)&qword_25742C818);
  }
  return result;
}

unint64_t sub_244F0F948()
{
  unint64_t result;

  result = qword_25742C820;
  if (!qword_25742C820)
  {
    result = MEMORY[0x24952AE28](&protocol conformance descriptor for Silicon, &type metadata for Silicon);
    atomic_store(result, (unint64_t *)&qword_25742C820);
  }
  return result;
}

uint64_t sub_244F0F98C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742BAC8);
    v8 = a2;
    result = MEMORY[0x24952AE28](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_244F0F9EC(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244F0FA14(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_244F0FA3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a8 & 0x8000000000000000) == 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t destroy for ModeError(uint64_t *a1)
{
  return sub_244F0FACC(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t sub_244F0FACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((a8 & 0x8000000000000000) == 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *initializeWithCopy for ModeError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = a2[7];
  v11 = a2[8];
  v13 = a2[9];
  v14 = a2[10];
  v15 = a2[11];
  sub_244F0FA3C(*a2, v4, v5, v6, v7, v8, v9, v10);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v13;
  a1[10] = v14;
  a1[11] = v15;
  return a1;
}

uint64_t *assignWithCopy for ModeError(uint64_t *a1, uint64_t *a2)
{
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = a2[7];
  v11 = a2[8];
  v21 = a2[9];
  v22 = a2[10];
  v23 = a2[11];
  sub_244F0FA3C(*a2, v4, v5, v6, v7, v8, v9, v10);
  v12 = *a1;
  v13 = a1[1];
  v14 = a1[2];
  v15 = a1[3];
  v16 = a1[4];
  v17 = a1[5];
  v18 = a1[6];
  v19 = a1[7];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v21;
  a1[10] = v22;
  a1[11] = v23;
  sub_244F0FACC(v12, v13, v14, v15, v16, v17, v18, v19);
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
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
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for ModeError(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v3 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v11;
  v12 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v12;
  v13 = a2[5];
  *(_OWORD *)(a1 + 64) = a2[4];
  *(_OWORD *)(a1 + 80) = v13;
  sub_244F0FACC(v3, v5, v4, v6, v7, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModeError(uint64_t a1, int a2)
{
  unsigned int v2;
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  HIDWORD(v3) = *(_DWORD *)(a1 + 60);
  LODWORD(v3) = HIDWORD(v3);
  v2 = v3 >> 31;
  if (v2 > 0x80000000)
    v4 = ~v2;
  else
    v4 = -1;
  return (v4 + 1);
}

double storeEnumTagSinglePayload for ModeError(uint64_t a1, int a2, int a3)
{
  double result;
  unint64_t v4;

  if (a2 < 0)
  {
    *(_QWORD *)(a1 + 88) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(a1 + 96) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      result = 0.0;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
      HIDWORD(v4) = -a2;
      LODWORD(v4) = -a2;
      *(_OWORD *)a1 = 0u;
      *(_QWORD *)(a1 + 48) = 0;
      *(_QWORD *)(a1 + 56) = (unint64_t)(v4 >> 1) << 32;
      *(_OWORD *)(a1 + 64) = 0u;
      *(_OWORD *)(a1 + 80) = 0u;
      return result;
    }
    *(_BYTE *)(a1 + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_244F0FE08(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56) >> 63;
}

uint64_t sub_244F0FE14(uint64_t result)
{
  *(_QWORD *)(result + 56) &= ~0x8000000000000000;
  return result;
}

uint64_t sub_244F0FE24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 60) = a2 << 31;
  return result;
}

ValueMetadata *type metadata accessor for ModeError()
{
  return &type metadata for ModeError;
}

_OWORD *sub_244F0FE44(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[5];
  a2[4] = a1[4];
  a2[5] = v5;
  a2[2] = v3;
  a2[3] = v4;
  return a2;
}

uint64_t sub_244F0FE64(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v3 = a1;
  v30 = MEMORY[0x24BEE4AF8];
  sub_244F17514(0, v1, 0);
  v2 = v30;
  result = sub_244F13CB4(v3);
  v6 = result;
  v7 = 0;
  v8 = v3 + 64;
  v24 = v3 + 80;
  v25 = v1;
  v26 = v5;
  v27 = v3 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(v3 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(v3 + 36) != v5)
      goto LABEL_24;
    v28 = v7;
    v12 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v6);
    v13 = v12[1];
    v29 = *v12;
    v14 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v6);
    v15 = v3;
    v17 = *(_QWORD *)(v30 + 16);
    v16 = *(_QWORD *)(v30 + 24);
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    if (v17 >= v16 >> 1)
      result = sub_244F17514(v16 > 1, v17 + 1, 1);
    *(_QWORD *)(v30 + 16) = v17 + 1;
    v18 = (_QWORD *)(v30 + 24 * v17);
    v18[4] = v29;
    v18[5] = v13;
    v18[6] = v14;
    v9 = 1 << *(_BYTE *)(v15 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = v27;
    v19 = *(_QWORD *)(v27 + 8 * v11);
    if ((v19 & (1 << v6)) == 0)
      goto LABEL_26;
    v3 = v15;
    v5 = v26;
    if (*(_DWORD *)(v15 + 36) != v26)
      goto LABEL_27;
    v20 = v19 & (-2 << (v6 & 0x3F));
    if (v20)
    {
      v9 = __clz(__rbit64(v20)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v25;
    }
    else
    {
      v21 = v11 + 1;
      v22 = (unint64_t)(v9 + 63) >> 6;
      v10 = v25;
      if (v11 + 1 < v22)
      {
        v23 = *(_QWORD *)(v27 + 8 * v21);
        if (v23)
        {
LABEL_20:
          v9 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v11)
          {
            v23 = *(_QWORD *)(v24 + 8 * v11++);
            if (v23)
            {
              v21 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    v7 = v28 + 1;
    v6 = v9;
    if (v28 + 1 == v10)
      return v2;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_244F10090(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;

  v2 = MEMORY[0x24BEE4AF8];
  v13 = MEMORY[0x24BEE4AF8];
  sub_244F1BB14();
  v3 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v3)
  {
    type metadata accessor for ExpressionNode();
    v12 = v3;
    v4 = 0;
    v5 = (uint64_t *)(a1 + 56);
    do
    {
      v7 = *(v5 - 1);
      v6 = *v5;
      v9 = *(v5 - 3);
      v8 = *(v5 - 2);
      v10 = (_QWORD *)swift_allocObject();
      v10[2] = v9;
      v10[3] = v8;
      v10[4] = v7;
      v10[5] = v6;
      v10[6] = v4;
      v10[7] = v2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_244F1BAFC();
      sub_244F1BB20();
      sub_244F1BB2C();
      sub_244F1BB08();
      v5 += 4;
      ++v4;
    }
    while (v12 != v4);
  }
  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_244F101B0()
{
  uint64_t *v0;

  return sub_244F1499C(*v0, v0[1], v0[2]);
}

uint64_t sub_244F101BC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ExpressionNode()
{
  return objc_opt_self();
}

unint64_t sub_244F1022C(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = MEMORY[0x24BEE4AF8];
  v3 = a1 >> 62;
  if (a1 >> 62)
    goto LABEL_23;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_244F05264(0, v4);
  v6 = v5 + 16;
  if (v3)
  {
    swift_bridgeObjectRetain();
    v7 = sub_244F1BB5C();
    if (v7)
      goto LABEL_5;
  }
  else
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
    {
LABEL_5:
      swift_beginAccess();
      v3 = 4;
      do
      {
        v8 = v3 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v9 = MEMORY[0x24952A750](v3 - 4, a1);
          v10 = __OFADD__(v8, 1);
          v11 = v3 - 3;
          if (v10)
            goto LABEL_20;
        }
        else
        {
          v9 = *(_QWORD *)(a1 + 8 * v3);
          swift_retain();
          v10 = __OFADD__(v8, 1);
          v11 = v3 - 3;
          if (v10)
          {
LABEL_20:
            __break(1u);
LABEL_21:
            __break(1u);
LABEL_22:
            __break(1u);
LABEL_23:
            swift_bridgeObjectRetain();
            v4 = sub_244F1BB5C();
            swift_bridgeObjectRelease();
            goto LABEL_3;
          }
        }
        v12 = *(_QWORD *)(v9 + 48);
        if ((v12 & 0x8000000000000000) != 0)
          goto LABEL_21;
        if (v12 >= *(_QWORD *)(*(_QWORD *)v6 + 16))
          goto LABEL_22;
        if (!*(_BYTE *)(*(_QWORD *)v6 + v12 + 32))
        {
          sub_244F10470(v9, v5, v14);
          if (v1)
          {
            swift_release();
            swift_release();
            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
        }
        swift_release();
        ++v3;
      }
      while (v11 != v7);
    }
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  a1 = *(_QWORD *)(v14 + 16);
  swift_bridgeObjectRetain();
  swift_release();
LABEL_19:
  swift_release();
  return a1;
}

uint64_t sub_244F10470(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;

  v5 = a1;
  v6 = (uint64_t *)(a2 + 16);
  v7 = *(_QWORD *)(a1 + 48);
  swift_beginAccess();
  v8 = *(_QWORD *)(a2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a2 + 16) = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_24;
  if ((v7 & 0x8000000000000000) == 0)
    goto LABEL_3;
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
  do
  {
    swift_bridgeObjectRetain();
    v10 = sub_244F1BB5C();
    v23 = v7;
    if (!v10)
      goto LABEL_28;
LABEL_6:
    v5 = v8 & 0xC000000000000001;
    swift_beginAccess();
    v7 = 4;
    while (1)
    {
      v11 = v7 - 4;
      if (!v5)
        break;
      v12 = MEMORY[0x24952A750](v7 - 4, v8);
      v13 = __OFADD__(v11, 1);
      v14 = v7 - 3;
      if (v13)
        goto LABEL_21;
LABEL_14:
      v15 = *(_QWORD *)(v12 + 48);
      if ((v15 & 0x8000000000000000) != 0)
        goto LABEL_22;
      if (v15 >= *(_QWORD *)(*v6 + 16))
        goto LABEL_23;
      v16 = *(unsigned __int8 *)(*v6 + v15 + 32);
      if (v16)
      {
        if (v16 != 2)
        {
          swift_bridgeObjectRelease();
          v18 = *(_QWORD *)(v24 + 16);
          v17 = *(_QWORD *)(v24 + 24);
          sub_244F14AB8();
          swift_allocError();
          *(_QWORD *)v19 = v18;
          *(_QWORD *)(v19 + 8) = v17;
          *(_OWORD *)(v19 + 16) = 0u;
          *(_OWORD *)(v19 + 32) = 0u;
          *(_BYTE *)(v19 + 48) = 0;
          swift_bridgeObjectRetain();
          swift_willThrow();
          return swift_release();
        }
      }
      else
      {
        sub_244F10470(v12, a2, a3);
        if (v3)
        {
          swift_bridgeObjectRelease();
          return swift_release();
        }
      }
      swift_release();
      ++v7;
      if (v14 == v10)
        goto LABEL_28;
    }
    v12 = *(_QWORD *)(v8 + 8 * v7);
    swift_retain();
    v13 = __OFADD__(v11, 1);
    v14 = v7 - 3;
    if (!v13)
      goto LABEL_14;
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    v8 = (unint64_t)sub_244F137D4(v8);
    *v6 = v8;
    if ((v7 & 0x8000000000000000) != 0)
      goto LABEL_25;
LABEL_3:
    if (v7 >= *(_QWORD *)(v8 + 16))
      goto LABEL_26;
    *(_BYTE *)(v8 + v7 + 32) = 1;
    swift_endAccess();
    v24 = v5;
    v8 = *(_QWORD *)(v5 + 56);
  }
  while (v8 >> 62);
  v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v23 = v7;
  if (v10)
    goto LABEL_6;
LABEL_28:
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v21 = swift_retain();
  MEMORY[0x24952A5C4](v21);
  if (*(_QWORD *)((*(_QWORD *)(a3 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(a3 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_244F1B970();
  sub_244F1B988();
  sub_244F1B964();
  swift_endAccess();
  swift_beginAccess();
  v22 = *v6;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v6 = v22;
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_244F137D4(v22);
    v22 = result;
    *v6 = result;
  }
  if (v23 >= *(_QWORD *)(v22 + 16))
  {
    __break(1u);
  }
  else
  {
    *(_BYTE *)(v22 + v23 + 32) = 2;
    return swift_endAccess();
  }
  return result;
}

void sub_244F10784()
{
  __int128 *v0;
  _BYTE v1[56];

  sub_244F14FC4(v0, (uint64_t)v1);
  __asm { BR              X10 }
}

unint64_t sub_244F107C8()
{
  sub_244F1BAB4();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  sub_244F1B8A4();
  return 0xD000000000000011;
}

void sub_244F10990()
{
  __int128 *v0;
  _BYTE v1[56];

  sub_244F14FC4(v0, (uint64_t)v1);
  sub_244F10784();
}

uint64_t sub_244F109C4(__int128 *a1, __int128 *a2)
{
  char v3;
  __int128 v5[3];
  _BYTE v6[56];

  sub_244F14FC4(a1, (uint64_t)v5);
  sub_244F14FC4(a2, (uint64_t)v6);
  sub_244F13D3C(v5);
  return v3 & 1;
}

uint64_t sub_244F10A0C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  unint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  int64_t v71;
  _QWORD *v72;
  unsigned __int8 *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  _QWORD *v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  _QWORD *v118;
  unint64_t v119;
  uint64_t v120;
  _QWORD *v121;
  _QWORD *v122;
  _QWORD *v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  int64_t v136;
  uint64_t v137;

  v6 = v4;
  v10 = swift_bridgeObjectRetain();
  v132 = sub_244F10090(v10);
  v129 = a1;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a4 + 16);
  v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v130 = a4;
  if (v11)
  {
    v127 = a3;
    v13 = v6;
    swift_bridgeObjectRetain();
    v14 = (uint64_t *)(a4 + 40);
    do
    {
      v16 = *v14;
      if (*v14)
      {
        v17 = *(v14 - 1);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v12 = sub_244F083F8(0, v12[2] + 1, 1, v12);
        v19 = v12[2];
        v18 = v12[3];
        if (v19 >= v18 >> 1)
          v12 = sub_244F083F8((_QWORD *)(v18 > 1), v19 + 1, 1, v12);
        v12[2] = v19 + 1;
        v15 = &v12[2 * v19];
        v15[4] = v17;
        v15[5] = v16;
      }
      v14 += 2;
      --v11;
    }
    while (v11);
    a4 = v130;
    swift_bridgeObjectRelease();
    v6 = v13;
    a3 = v127;
  }
  v20 = sub_244F0B58C((uint64_t)v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21 = sub_244F13EE4(v132, v20, a3);
  if (v5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v22 = (_QWORD *)v21;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v23 = swift_bridgeObjectRetain();
  v24 = sub_244F13824(v23, v20);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v24 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v137 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CA00);
    sub_244F14A6C();
    sub_244EF7DE8();
    v25 = sub_244F1B934();
    v27 = v26;
    swift_release();
    sub_244F14AB8();
    swift_allocError();
    *(_OWORD *)v28 = xmmword_244F1EEB0;
    *(_OWORD *)(v28 + 16) = xmmword_244F1EEC0;
    *(_QWORD *)(v28 + 32) = v25;
    *(_QWORD *)(v28 + 40) = v27;
    *(_BYTE *)(v28 + 48) = 2;
    swift_willThrow();
    goto LABEL_15;
  }
  swift_release();
  if (v22[2])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CA18);
    v30 = sub_244F1BB80();
  }
  else
  {
    v30 = MEMORY[0x24BEE4B00];
  }
  v137 = v30;
  sub_244F123B0(v22, 1, &v137);
  v31 = v132;
  v32 = v137;
  if (v132 >> 62)
  {
    swift_bridgeObjectRetain();
    v33 = sub_244F1BB5C();
    v123 = v6;
    if (v33)
      goto LABEL_22;
  }
  else
  {
    v33 = *(_QWORD *)((v132 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v123 = v6;
    if (v33)
    {
LABEL_22:
      if (v33 < 1)
        goto LABEL_112;
      v34 = 0;
      do
      {
        if ((v132 & 0xC000000000000001) != 0)
        {
          v35 = MEMORY[0x24952A750](v34, v132);
        }
        else
        {
          v35 = *(_QWORD *)(v132 + 8 * v34 + 32);
          swift_retain();
        }
        ++v34;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        v36 = swift_bridgeObjectRetain();
        v37 = sub_244F14344(v36, a3, v20, v32);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        *(_QWORD *)(v35 + 56) = v37;
        swift_release();
        swift_bridgeObjectRelease();
        a4 = v130;
      }
      while (v33 != v34);
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v125 = sub_244F1022C(v132);
  swift_bridgeObjectRelease();
  v38 = sub_244F0FE64(a3);
  v137 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  sub_244F17398(0, 0, 0);
  v39 = v137;
  v120 = v38;
  v126 = *(_QWORD *)(v38 + 16);
  v127 = a3;
  if (v126)
  {
    swift_bridgeObjectRetain();
    v40 = 0;
    v41 = (uint64_t *)(v38 + 40);
    do
    {
      v43 = *(v41 - 1);
      v42 = *v41;
      v137 = v39;
      v45 = *(_QWORD *)(v39 + 16);
      v44 = *(_QWORD *)(v39 + 24);
      swift_bridgeObjectRetain();
      if (v45 >= v44 >> 1)
      {
        sub_244F17398(v44 > 1, v45 + 1, 1);
        v39 = v137;
      }
      v41 += 3;
      *(_QWORD *)(v39 + 16) = v45 + 1;
      v46 = (_QWORD *)(v39 + 24 * v45);
      v46[5] = v42;
      v46[6] = v40;
      v46[4] = v43;
      ++v40;
    }
    while (v126 != v40);
    swift_bridgeObjectRelease();
    a3 = v127;
    a4 = v130;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v47 = swift_bridgeObjectRetain();
  v48 = sub_244F147F4(v47, a3);
  swift_bridgeObjectRelease();
  v49 = swift_bridgeObjectRelease();
  MEMORY[0x24BDAC7A8](v49);
  v50 = sub_244F146AC(a4, sub_244F14AFC);
  swift_bridgeObjectRelease();
  v137 = v39;
  sub_244F0608C(v48);
  sub_244F0608C((uint64_t)v50);
  if (*(_QWORD *)(v137 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4B8);
    v51 = sub_244F1BB80();
  }
  else
  {
    v51 = MEMORY[0x24BEE4B00];
  }
  v137 = v51;
  v52 = (_QWORD *)swift_bridgeObjectRetain();
  sub_244F12034(v52, 1, &v137);
  v31 = v125;
  swift_bridgeObjectRelease();
  v124 = v137;
  if (v125 >> 62)
    goto LABEL_113;
  v53 = *(_QWORD *)((v125 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v6 = v123;
    v54 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v131 = v53;
    if (v53)
    {
      v137 = MEMORY[0x24BEE4AF8];
      sub_244F174F8(0, v53 & ~(v53 >> 63), 0);
      if (v53 < 0)
      {
        __break(1u);
LABEL_115:
        __break(1u);
        goto LABEL_116;
      }
      v55 = (_QWORD *)v137;
      v31 = v125;
      if ((v125 & 0xC000000000000001) != 0)
      {
        v56 = 0;
        do
        {
          v57 = v55;
          v133 = *(_OWORD *)(MEMORY[0x24952A750](v56, v31) + 32);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_unknownObjectRelease();
          v55 = v57;
          v137 = (uint64_t)v57;
          v58 = v57[2];
          v59 = v55[3];
          if (v58 >= v59 >> 1)
          {
            sub_244F174F8(v59 > 1, v58 + 1, 1);
            v31 = v125;
            v55 = (_QWORD *)v137;
          }
          ++v56;
          v55[2] = v58 + 1;
          *(_OWORD *)&v55[2 * v58 + 4] = v133;
        }
        while (v131 != v56);
      }
      else
      {
        v60 = v125 + 32;
        v61 = v53;
        do
        {
          v134 = *(_OWORD *)(*(_QWORD *)v60 + 32);
          v137 = (uint64_t)v55;
          v63 = v55[2];
          v62 = v55[3];
          v64 = v55;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v63 >= v62 >> 1)
          {
            sub_244F174F8(v62 > 1, v63 + 1, 1);
            v31 = v125;
            v64 = (_QWORD *)v137;
          }
          v64[2] = v63 + 1;
          *(_OWORD *)&v64[2 * v63 + 4] = v134;
          v60 += 8;
          --v61;
          v55 = v64;
        }
        while (v61);
      }
      v6 = v123;
      v54 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      v55 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v65 = v55[2];
    if (!v65)
    {
LABEL_72:
      v122 = v55;
      swift_release();
      v6[2] = v122;
      if (v126)
      {
        v136 = *(_QWORD *)(v120 + 16);
        if (!v136)
        {
LABEL_116:
          __break(1u);
          goto LABEL_117;
        }
        v85 = *(_QWORD **)(*(_QWORD *)(v120 + 48) + 16);
        swift_bridgeObjectRetain();
        if (v85)
        {
          v6 = 0;
          v86 = v54;
LABEL_76:
          v87 = a3;
          v88 = (unint64_t)v6;
          v6 = (_QWORD *)((char *)v6 + 1);
          v137 = MEMORY[0x24BEE4AF8];
          a3 = v136;
          sub_244F174DC(0, v136, 0);
          v89 = v137;
          v90 = 48;
          v91 = v120;
          while (1)
          {
            v92 = *(_QWORD *)(v91 + v90);
            if (v88 >= *(_QWORD *)(v92 + 16))
              break;
            v93 = *(_QWORD *)(v92 + 8 * v88 + 32);
            v137 = v89;
            v95 = *(_QWORD *)(v89 + 16);
            v94 = *(_QWORD *)(v89 + 24);
            if (v95 >= v94 >> 1)
            {
              sub_244F174DC(v94 > 1, v95 + 1, 1);
              v91 = v120;
              v89 = v137;
            }
            *(_QWORD *)(v89 + 16) = v95 + 1;
            *(_QWORD *)(v89 + 8 * v95 + 32) = v93;
            v90 += 24;
            if (!--a3)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v86 = sub_244F082D8(0, v86[2] + 1, 1, v86);
              a3 = v87;
              v97 = v86[2];
              v96 = v86[3];
              if (v97 >= v96 >> 1)
                v86 = sub_244F082D8((_QWORD *)(v96 > 1), v97 + 1, 1, v86);
              v86[2] = v97 + 1;
              v86[v97 + 4] = v89;
              if (v6 == v85)
              {
                swift_bridgeObjectRelease();
                v6 = v123;
                v31 = v125;
                v54 = (_QWORD *)MEMORY[0x24BEE4AF8];
                goto LABEL_92;
              }
              goto LABEL_76;
            }
          }
          __break(1u);
          goto LABEL_103;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      v86 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_92:
      if (a2)
      {
        swift_bridgeObjectRetain();
        v99 = sub_244F14160(v31, a2);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_109;
      }
      if (v131)
      {
        v100 = a3;
        v137 = (uint64_t)v54;
        sub_244F174C0(0, v131 & ~(v131 >> 63), 0);
        v101 = v131;
        if (v131 < 0)
        {
LABEL_117:
          __break(1u);
          result = swift_unexpectedError();
          __break(1u);
          return result;
        }
        v102 = v6;
        v99 = v137;
        if ((v125 & 0xC000000000000001) != 0)
        {
          v103 = 0;
          do
          {
            v104 = *(_QWORD *)(MEMORY[0x24952A750](v103, v125) + 48);
            swift_unknownObjectRelease();
            v137 = v99;
            v106 = *(_QWORD *)(v99 + 16);
            v105 = *(_QWORD *)(v99 + 24);
            if (v106 >= v105 >> 1)
            {
              sub_244F174C0(v105 > 1, v106 + 1, 1);
              v99 = v137;
            }
            ++v103;
            *(_QWORD *)(v99 + 16) = v106 + 1;
            v107 = v99 + 16 * v106;
            *(_QWORD *)(v107 + 32) = v104;
            *(_BYTE *)(v107 + 40) = 0;
          }
          while (v131 != v103);
        }
        else
        {
          v108 = 0;
          v109 = *(_QWORD *)(v137 + 16);
          v110 = 16 * v109;
          do
          {
            v111 = *(_QWORD *)(*(_QWORD *)(v125 + 8 * v108 + 32) + 48);
            v137 = v99;
            v112 = *(_QWORD *)(v99 + 24);
            v113 = v109 + v108 + 1;
            if (v109 + v108 >= v112 >> 1)
            {
              sub_244F174C0(v112 > 1, v109 + v108 + 1, 1);
              v101 = v131;
              v99 = v137;
            }
            ++v108;
            *(_QWORD *)(v99 + 16) = v113;
            v114 = v99 + v110;
            *(_QWORD *)(v114 + 32) = v111;
            *(_BYTE *)(v114 + 40) = 0;
            v110 += 16;
          }
          while (v101 != v108);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v6 = v102;
        a3 = v100;
        goto LABEL_109;
      }
LABEL_103:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v99 = MEMORY[0x24BEE4AF8];
LABEL_109:
      v6[5] = v99;
      v6[3] = v86;
      v115 = *(_QWORD *)(a3 + 16);
      swift_bridgeObjectRelease();
      v116 = *(_QWORD *)(v129 + 16);
      swift_bridgeObjectRelease();
      if (!__OFADD__(v115, v116))
      {
        v6[4] = v115 + v116;
        return (uint64_t)v6;
      }
      goto LABEL_115;
    }
    v66 = 0;
    v117 = v55[2];
LABEL_56:
    v121 = v55;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v121 = sub_244F137E8(v121);
    if (v66 < v121[2])
      break;
    __break(1u);
LABEL_112:
    __break(1u);
LABEL_113:
    swift_bridgeObjectRetain();
    v53 = sub_244F1BB5C();
    swift_bridgeObjectRelease();
  }
  v67 = &v121[2 * v66];
  v70 = v67[4];
  v69 = v67 + 4;
  v68 = v70;
  v71 = *(_QWORD *)(v70 + 16);
  if (!v71)
  {
    v72 = v54;
LABEL_71:
    ++v66;
    swift_bridgeObjectRelease();
    *v69 = v72;
    v55 = v121;
    v6 = v123;
    if (v66 == v65)
      goto LABEL_72;
    goto LABEL_56;
  }
  v118 = v69;
  v119 = v66;
  v137 = (uint64_t)v54;
  swift_bridgeObjectRetain();
  sub_244F174A4(0, v71, 0);
  v31 = v125;
  v72 = (_QWORD *)v137;
  v73 = (unsigned __int8 *)(v68 + 56);
  while (1)
  {
    v74 = *((_QWORD *)v73 - 3);
    v75 = *((_QWORD *)v73 - 2);
    v76 = *((_QWORD *)v73 - 1);
    v77 = *v73;
    v135 = v74;
    if (v77 != 1)
    {
      sub_244F14B04(v74, v75, v76, v77);
      goto LABEL_66;
    }
    v78 = *(_QWORD *)(v124 + 16);
    sub_244F14B04(v74, v75, v76, 1u);
    if (!v78)
    {
      swift_bridgeObjectRetain();
      goto LABEL_89;
    }
    sub_244F14B04(v74, v75, v76, 1u);
    swift_bridgeObjectRetain();
    v79 = sub_244F11EF0(v74, v75);
    if ((v80 & 1) == 0)
      break;
    v81 = *(_QWORD *)(*(_QWORD *)(v124 + 56) + 8 * v79);
    sub_244F14B20(v74, v75, v76, 1u);
    sub_244F14B20(v74, v75, v76, 1u);
    LOBYTE(v77) = 2;
    v76 = v81;
    v31 = v125;
LABEL_66:
    v137 = (uint64_t)v72;
    v83 = v72[2];
    v82 = v72[3];
    if (v83 >= v82 >> 1)
    {
      sub_244F174A4(v82 > 1, v83 + 1, 1);
      v31 = v125;
      v72 = (_QWORD *)v137;
    }
    v73 += 32;
    v72[2] = v83 + 1;
    v84 = &v72[4 * v83];
    v84[4] = v135;
    v84[5] = v75;
    v84[6] = v76;
    *((_BYTE *)v84 + 56) = v77;
    --v71;
    a3 = v127;
    if (!v71)
    {
      swift_bridgeObjectRelease();
      v69 = v118;
      v66 = v119;
      v54 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v65 = v117;
      goto LABEL_71;
    }
  }
  sub_244F14B20(v74, v75, v76, 1u);
LABEL_89:
  sub_244F14B3C();
  swift_allocError();
  *(_QWORD *)v98 = v74;
  *(_QWORD *)(v98 + 8) = v75;
  *(_BYTE *)(v98 + 16) = 0;
  swift_willThrow();
  sub_244F14B20(v74, v75, v76, 1u);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = v123;
LABEL_15:
  type metadata accessor for Evaluator();
  swift_deallocPartialClassInstance();
  return (uint64_t)v6;
}

uint64_t sub_244F11940(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  if (!a3)
  {
    a2 = 0;
LABEL_6:
    swift_bridgeObjectRetain();
    return a2;
  }
  v5 = *(_QWORD *)(a4 + 16);
  v6 = *(_QWORD *)(a5 + 16);
  v7 = __OFADD__(v5, v6);
  v8 = v5 + v6;
  if (v7)
  {
    __break(1u);
  }
  else if (!__OFADD__(v8, result))
  {
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_244F119AC(unsigned __int8 a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _BOOL8 v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;

  v5 = v4;
  v6 = v3;
  v9 = a1 > 1u;
  v10 = v3[3];
  v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(v10 + 16) > (unint64_t)v9)
  {
    v12 = *(_QWORD **)(v10 + 8 * v9 + 32);
    swift_bridgeObjectRetain();
  }
  v13 = v3[4];
  v37 = v12[2];
  if (__OFSUB__(v13, v37))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v14 = sub_244F0541C(v13 - v37, 0.0);
  v40 = v12;
  swift_bridgeObjectRetain();
  sub_244F069C8(v14);
  v15 = swift_bridgeObjectRetain();
  sub_244F069C8(v15);
  v3 = v12;
  a2 = v6[2];
  v36 = *(_QWORD *)(a2 + 16);
  if (v36)
  {
    v16 = (_QWORD *)*a3;
    swift_bridgeObjectRetain();
    v39 = v16;
    v34 = a3;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
LABEL_6:
      v17 = 0;
      v38 = a2 + 32;
      v35 = a2;
      v33 = v6;
      while (1)
      {
        v18 = *(_QWORD *)(v38 + 16 * v17);
        v40 = v11;
        v19 = *(_QWORD *)(v18 + 16);
        if (v19)
        {
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v20 = (unsigned __int8 *)(v18 + 56);
          while (1)
          {
            v21 = *((_QWORD *)v20 - 3);
            v22 = *((_QWORD *)v20 - 2);
            v23 = *((_QWORD *)v20 - 1);
            v24 = *v20;
            sub_244F14B04(v21, v22, v23, *v20);
            sub_244F16228((uint64_t)&v40, (uint64_t)v3, v21, v22, v23, v24);
            if (v5)
              break;
            v20 += 32;
            sub_244F14B20(v21, v22, v23, v24);
            if (!--v19)
            {
              swift_bridgeObjectRelease();
              v25 = v40;
              v6 = v33;
              v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
              a2 = v35;
              goto LABEL_13;
            }
          }
          sub_244F14B20(v21, v22, v23, v24);
          swift_bridgeObjectRelease();
          *v34 = v39;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v25 = v11;
LABEL_13:
        v26 = v25[2];
        if (!v26)
        {
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
        v27 = v25[4];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if (v26 != 1)
          goto LABEL_29;
        v29 = v6[5];
        if (v17 >= *(_QWORD *)(v29 + 16))
          goto LABEL_30;
        v30 = v29 + 16 * v17;
        if ((*(_BYTE *)(v30 + 40) & 1) == 0)
        {
          v31 = *(_QWORD *)(v30 + 32);
          if ((v31 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_35:
            __break(1u);
            return result;
          }
          if (v31 >= v39[2])
            goto LABEL_35;
          v39[v31 + 4] = v27;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v3 = sub_244F13810(v3);
        v32 = v37 + v17;
        if (v37 + v17 >= v3[2])
          goto LABEL_31;
        ++v17;
        v3[v32 + 4] = v27;
        if (v17 == v36)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          *v34 = v39;
          return result;
        }
      }
    }
LABEL_33:
    v39 = sub_244F13810(v39);
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244F11D40()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Evaluator()
{
  return objc_opt_self();
}

uint64_t destroy for NamedExpression()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for NamedExpression(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for NamedExpression(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NamedExpression(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for NamedExpression()
{
  return &type metadata for NamedExpression;
}

unint64_t sub_244F11EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_244F1BD00();
  sub_244F1B880();
  v4 = sub_244F1BD18();
  return sub_244F11F54(a1, a2, v4);
}

unint64_t sub_244F11F54(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_244F1BCA0() & 1) == 0)
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
      while (!v14 && (sub_244F1BCA0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_244F12034(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  uint64_t result;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  char v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a1[2];
  if (!v4)
    return swift_bridgeObjectRelease();
  v8 = a1[4];
  v7 = a1[5];
  v42 = a1[6];
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  v11 = sub_244F11EF0(v8, v7);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_23;
  v15 = v10;
  if (v9[3] >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_244F12ADC();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v21 = (uint64_t *)(v20[6] + 16 * v11);
    *v21 = v8;
    v21[1] = v7;
    *(_QWORD *)(v20[7] + 8 * v11) = v42;
    v22 = v20[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    v25 = v4 - 1;
    if (v4 == 1)
      return swift_bridgeObjectRelease_n();
    for (i = a1 + 9; ; i += 3)
    {
      v28 = *(i - 2);
      v27 = *(i - 1);
      v29 = *i;
      v30 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      v31 = sub_244F11EF0(v28, v27);
      v33 = v30[2];
      v34 = (v32 & 1) == 0;
      v23 = __OFADD__(v33, v34);
      v35 = v33 + v34;
      if (v23)
        break;
      v36 = v32;
      if (v30[3] < v35)
      {
        sub_244F13168(v35, 1);
        v31 = sub_244F11EF0(v28, v27);
        if ((v36 & 1) != (v37 & 1))
          goto LABEL_25;
      }
      if ((v36 & 1) != 0)
        goto LABEL_10;
      v38 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      v39 = (uint64_t *)(v38[6] + 16 * v31);
      *v39 = v28;
      v39[1] = v27;
      *(_QWORD *)(v38[7] + 8 * v31) = v29;
      v40 = v38[2];
      v23 = __OFADD__(v40, 1);
      v41 = v40 + 1;
      if (v23)
        goto LABEL_24;
      v38[2] = v41;
      if (!--v25)
        return swift_bridgeObjectRelease_n();
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_244F13168(v14, a2 & 1);
  v16 = sub_244F11EF0(v8, v7);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v19 = swift_allocError();
    swift_willThrow();
    MEMORY[0x24952ADD4](v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C0E0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return MEMORY[0x24952ADC8](v19);
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_244F1BCC4();
  __break(1u);
LABEL_26:
  sub_244F1BAB4();
  sub_244F1B8A4();
  sub_244F1BB38();
  sub_244F1B8A4();
  result = sub_244F1BB50();
  __break(1u);
  return result;
}

uint64_t sub_244F123B0(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *i;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  char v39;
  _QWORD *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  if (!a1[2])
    return swift_bridgeObjectRelease();
  v44 = a1[2];
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  swift_retain();
  v11 = sub_244F11EF0(v6, v7);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_23;
  v15 = v10;
  if (v9[3] >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_244F12C88();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v23 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v24 = (uint64_t *)(v23[6] + 16 * v11);
    *v24 = v6;
    v24[1] = v7;
    *(_QWORD *)(v23[7] + 8 * v11) = v8;
    v25 = v23[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v23[2] = v27;
    v28 = v44 - 1;
    if (v44 == 1)
      return swift_bridgeObjectRelease_n();
    for (i = a1 + 9; ; i += 3)
    {
      v30 = *(i - 2);
      v31 = *(i - 1);
      v8 = *i;
      v32 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      swift_retain();
      v33 = sub_244F11EF0(v30, v31);
      v35 = v32[2];
      v36 = (v34 & 1) == 0;
      v26 = __OFADD__(v35, v36);
      v37 = v35 + v36;
      if (v26)
        break;
      v38 = v34;
      if (v32[3] < v37)
      {
        sub_244F13470(v37, 1);
        v33 = sub_244F11EF0(v30, v31);
        if ((v38 & 1) != (v39 & 1))
          goto LABEL_25;
      }
      if ((v38 & 1) != 0)
        goto LABEL_10;
      v40 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v33 >> 6) + 64) |= 1 << v33;
      v41 = (uint64_t *)(v40[6] + 16 * v33);
      *v41 = v30;
      v41[1] = v31;
      *(_QWORD *)(v40[7] + 8 * v33) = v8;
      v42 = v40[2];
      v26 = __OFADD__(v42, 1);
      v43 = v42 + 1;
      if (v26)
        goto LABEL_24;
      v40[2] = v43;
      if (!--v28)
        return swift_bridgeObjectRelease_n();
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_244F13470(v14, a2 & 1);
  v16 = sub_244F11EF0(v6, v7);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v20 = *(_QWORD *)(v8 + 16);
    v19 = *(_QWORD *)(v8 + 24);
    sub_244F14AB8();
    v21 = swift_allocError();
    *(_QWORD *)v22 = v20;
    *(_QWORD *)(v22 + 8) = v19;
    *(_OWORD *)(v22 + 16) = 0u;
    *(_OWORD *)(v22 + 32) = 0u;
    *(_BYTE *)(v22 + 48) = 1;
    swift_bridgeObjectRetain();
    swift_willThrow();
    MEMORY[0x24952ADD4](v21);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C0E0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return MEMORY[0x24952ADC8](v21);
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_244F1BCC4();
  __break(1u);
LABEL_26:
  sub_244F1BAB4();
  sub_244F1B8A4();
  sub_244F1BB38();
  sub_244F1B8A4();
  result = sub_244F1BB50();
  __break(1u);
  return result;
}

void *sub_244F1276C()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C2C8);
  v2 = *v0;
  v3 = sub_244F1BB68();
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
    v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      v9 = v27 + 1;
      if (v27 + 1 >= v13)
        goto LABEL_26;
      v28 = *(_QWORD *)(v6 + 8 * v9);
      if (!v28)
        break;
    }
LABEL_25:
    v12 = (v28 - 1) & v28;
    v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_QWORD *)(v21 + 8);
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v25 = *(_OWORD *)(v21 + 16);
    *v24 = v19;
    v24[1] = v18;
    v26 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v26 = v22;
    *(_QWORD *)(v26 + 8) = v23;
    *(_OWORD *)(v26 + 16) = v25;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v29 = v27 + 2;
  if (v29 >= v13)
    goto LABEL_26;
  v28 = *(_QWORD *)(v6 + 8 * v29);
  if (v28)
  {
    v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v9);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244F12930()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C838);
  v2 = *v0;
  v3 = sub_244F1BB68();
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244F12ADC()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4B8);
  v2 = *v0;
  v3 = sub_244F1BB68();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244F12C88()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742CA18);
  v2 = *v0;
  v3 = sub_244F1BB68();
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_244F12E3C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  uint64_t v39;
  char v40;
  __int128 v41;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C2C8);
  v40 = a2;
  v6 = sub_244F1BB74();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v39 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v37 = v2;
  v38 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v38)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v39 + 8 * v22);
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v38)
        goto LABEL_33;
      v24 = *(_QWORD *)(v39 + 8 * v13);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v38)
        {
LABEL_33:
          swift_release();
          v3 = v37;
          if ((v40 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v39 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v13 >= v38)
              goto LABEL_33;
            v24 = *(_QWORD *)(v39 + 8 * v13);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v13 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(v5 + 56) + 32 * v21;
    v34 = *(_QWORD *)v33;
    v35 = *(_QWORD *)(v33 + 8);
    v41 = *(_OWORD *)(v33 + 16);
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_244F1BD00();
    sub_244F1B880();
    result = sub_244F1BD18();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v16 == v27;
        if (v16 == v27)
          v16 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v32;
    v18[1] = v31;
    v19 = *(_QWORD *)(v7 + 56) + 32 * v17;
    *(_QWORD *)v19 = v34;
    *(_QWORD *)(v19 + 8) = v35;
    *(_OWORD *)(v19 + 16) = v41;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v37;
  v23 = (_QWORD *)(v5 + 64);
  if ((v40 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_244F13168(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4B8);
  v37 = a2;
  v6 = sub_244F1BB74();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_244F1BD00();
    sub_244F1B880();
    result = sub_244F1BD18();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_244F13470(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742CA18);
  v36 = a2;
  v6 = sub_244F1BB74();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_244F1BD00();
    sub_244F1B880();
    result = sub_244F1BD18();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

_QWORD *sub_244F13784(_QWORD *a1)
{
  return sub_244F07B04(0, a1[2], 0, a1);
}

_QWORD *sub_244F13798(_QWORD *a1)
{
  return sub_244F07D3C(0, a1[2], 0, a1);
}

_QWORD *sub_244F137AC(_QWORD *a1)
{
  return sub_244F07E70(0, a1[2], 0, a1);
}

_QWORD *sub_244F137C0(_QWORD *a1)
{
  return sub_244F080C0(0, a1[2], 0, a1);
}

char *sub_244F137D4(uint64_t a1)
{
  return sub_244F081E0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_244F137E8(_QWORD *a1)
{
  return sub_244F082EC(0, a1[2], 0, a1);
}

_QWORD *sub_244F137FC(_QWORD *a1)
{
  return sub_244F0871C(0, a1[2], 0, a1);
}

_QWORD *sub_244F13810(_QWORD *a1)
{
  return sub_244F08828(0, a1[2], 0, a1);
}

uint64_t sub_244F13824(uint64_t isStackAllocationSafe, uint64_t a2)
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
    v7 = sub_244F139A4((_QWORD *)((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, v3, a2);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_244F139A4((unint64_t *)v8, v5, v3, a2);
    swift_release();
    MEMORY[0x24952AE88](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_244F139A4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  BOOL v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t i;
  unint64_t v29;
  _QWORD *v30;
  BOOL v31;
  uint64_t v33;
  uint64_t v35;
  int64_t v36;
  uint64_t v39;

  v35 = a3 + 64;
  v4 = 1 << *(_BYTE *)(a3 + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a3 + 64);
  v36 = (unint64_t)(v4 + 63) >> 6;
  v39 = a4 + 56;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  v9 = 0;
LABEL_5:
  v33 = v8;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_25;
    }
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_48;
    }
    if (v12 >= v36)
      goto LABEL_46;
    v13 = *(_QWORD *)(v35 + 8 * v12);
    ++v9;
    if (!v13)
    {
      v9 = v12 + 1;
      if (v12 + 1 >= v36)
        goto LABEL_46;
      v13 = *(_QWORD *)(v35 + 8 * v9);
      if (!v13)
      {
        v9 = v12 + 2;
        if (v12 + 2 >= v36)
          goto LABEL_46;
        v13 = *(_QWORD *)(v35 + 8 * v9);
        if (!v13)
        {
          v9 = v12 + 3;
          if (v12 + 3 >= v36)
            goto LABEL_46;
          v13 = *(_QWORD *)(v35 + 8 * v9);
          if (!v13)
            break;
        }
      }
    }
LABEL_24:
    v6 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_25:
    v15 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v11);
    v17 = *v15;
    v16 = v15[1];
    sub_244F1BD00();
    swift_bridgeObjectRetain();
    sub_244F1B880();
    v18 = sub_244F1BD18();
    v19 = -1 << *(_BYTE *)(a4 + 32);
    v20 = v18 & ~v19;
    v21 = v20 >> 6;
    v22 = 1 << v20;
    if (((1 << v20) & *(_QWORD *)(v39 + 8 * (v20 >> 6))) == 0)
      goto LABEL_6;
    v23 = *(_QWORD *)(a4 + 48);
    v24 = (_QWORD *)(v23 + 16 * v20);
    v25 = *v24 == v17 && v24[1] == v16;
    if (v25 || (sub_244F1BCA0() & 1) != 0)
    {
      result = swift_bridgeObjectRelease();
LABEL_32:
      v26 = a1[v21];
      a1[v21] = v22 | v26;
      if ((v22 & v26) == 0)
      {
        v8 = v33 + 1;
        if (!__OFADD__(v33, 1))
          goto LABEL_5;
        __break(1u);
LABEL_46:
        swift_release();
        swift_retain();
        return sub_244F09BAC(a1, a2, v33, a4);
      }
    }
    else
    {
      v27 = ~v19;
      for (i = v20 + 1; ; i = v29 + 1)
      {
        v29 = i & v27;
        if (((*(_QWORD *)(v39 + (((i & v27) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v27)) & 1) == 0)
          break;
        v30 = (_QWORD *)(v23 + 16 * v29);
        v31 = *v30 == v17 && v30[1] == v16;
        if (v31 || (sub_244F1BCA0() & 1) != 0)
        {
          result = swift_bridgeObjectRelease();
          v21 = v29 >> 6;
          v22 = 1 << v29;
          goto LABEL_32;
        }
      }
LABEL_6:
      result = swift_bridgeObjectRelease();
    }
  }
  v14 = v12 + 4;
  if (v14 >= v36)
    goto LABEL_46;
  v13 = *(_QWORD *)(v35 + 8 * v14);
  if (v13)
  {
    v9 = v14;
    goto LABEL_24;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v36)
      goto LABEL_46;
    v13 = *(_QWORD *)(v35 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_24;
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_244F13CB4(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

void sub_244F13D3C(__int128 *a1)
{
  _BYTE v1[56];

  sub_244F14FC4(a1, (uint64_t)v1);
  __asm { BR              X10 }
}

uint64_t sub_244F13D84()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  char v4;
  _QWORD v6[6];
  char v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v8;
  v2 = v9;
  sub_244F14FC4(v0, (uint64_t)v6);
  if (v7)
  {
    v4 = 0;
  }
  else if (v1 == v6[0] && v2 == v6[1])
  {
    v4 = 1;
  }
  else
  {
    v4 = sub_244F1BCA0();
  }
  return v4 & 1;
}

uint64_t sub_244F13EE4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  if (a1 >> 62)
    goto LABEL_22;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x24BEE4AF8];
    if (!v5)
      return result;
    v21 = MEMORY[0x24BEE4AF8];
    result = sub_244F17530(0, v5 & ~(v5 >> 63), 0);
    if (v5 < 0)
    {
      __break(1u);
      return result;
    }
    v19 = v5;
    v7 = 0;
    result = v21;
    while (v5 != v7)
    {
      v8 = result;
      if ((a1 & 0xC000000000000001) != 0)
      {
        v9 = MEMORY[0x24952A750](v7, a1);
      }
      else
      {
        v9 = *(_QWORD *)(a1 + 8 * v7 + 32);
        swift_retain();
      }
      v11 = *(_QWORD *)(v9 + 16);
      v10 = *(_QWORD *)(v9 + 24);
      swift_bridgeObjectRetain();
      if ((sub_244F05F58(v11, v10, a2) & 1) != 0)
      {
        sub_244F14AB8();
        swift_allocError();
        *(_QWORD *)v17 = 0x746E657665;
        v18 = 0xE500000000000000;
LABEL_19:
        *(_QWORD *)(v17 + 8) = v18;
        *(_OWORD *)(v17 + 16) = xmmword_244F1EED0;
        *(_QWORD *)(v17 + 32) = v11;
        *(_QWORD *)(v17 + 40) = v10;
        *(_BYTE *)(v17 + 48) = 2;
        swift_willThrow();
        swift_release();
        return swift_release();
      }
      if (*(_QWORD *)(a3 + 16))
      {
        swift_bridgeObjectRetain();
        sub_244F11EF0(v11, v10);
        v13 = v12;
        swift_bridgeObjectRelease();
        if ((v13 & 1) != 0)
        {
          sub_244F14AB8();
          swift_allocError();
          *(_QWORD *)v17 = 0x746E6174736E6F63;
          v18 = 0xE800000000000000;
          goto LABEL_19;
        }
      }
      result = v8;
      v22 = v8;
      v14 = *(_QWORD *)(v8 + 16);
      v15 = *(_QWORD *)(result + 24);
      if (v14 >= v15 >> 1)
      {
        sub_244F17530(v15 > 1, v14 + 1, 1);
        result = v22;
      }
      ++v7;
      *(_QWORD *)(result + 16) = v14 + 1;
      v16 = (_QWORD *)(result + 24 * v14);
      v16[4] = v11;
      v16[5] = v10;
      v16[6] = v9;
      v5 = v19;
      if (v19 == v7)
        return result;
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
    v5 = sub_244F1BB5C();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_244F14160(unint64_t a1, unint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v15;
  char v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;

  v3 = a1;
  if (a1 >> 62)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    v4 = sub_244F1BB5C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v5 = MEMORY[0x24BEE4AF8];
  if (!v4)
    return v5;
  v24 = MEMORY[0x24BEE4AF8];
  result = sub_244F174C0(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    v7 = 0;
    v5 = v24;
    v8 = *(_QWORD *)(a2 + 16);
    v20 = v3 + 32;
    v21 = v4;
    v22 = (_QWORD *)(a2 + 40);
    v23 = v3 & 0xC000000000000001;
    while (1)
    {
      if (v7 == v4)
      {
        __break(1u);
        goto LABEL_26;
      }
      if (v23)
      {
        v9 = MEMORY[0x24952A750](v7, v3);
        if (v8)
          goto LABEL_9;
      }
      else
      {
        v9 = *(_QWORD *)(v20 + 8 * v7);
        swift_retain();
        if (v8)
        {
LABEL_9:
          v10 = v3;
          v11 = 0;
          v12 = *(_QWORD *)(v9 + 16);
          v13 = *(_QWORD *)(v9 + 24);
          v14 = v22;
          while (1)
          {
            v15 = v12 == *(v14 - 1) && v13 == *v14;
            if (v15 || (sub_244F1BCA0() & 1) != 0)
              break;
            v14 += 2;
            if (v8 == ++v11)
            {
              v11 = 0;
              v16 = 1;
              goto LABEL_18;
            }
          }
          v16 = 0;
LABEL_18:
          v3 = v10;
          v4 = v21;
          goto LABEL_21;
        }
      }
      v11 = 0;
      v16 = 1;
LABEL_21:
      swift_release();
      v18 = *(_QWORD *)(v24 + 16);
      v17 = *(_QWORD *)(v24 + 24);
      a2 = v18 + 1;
      if (v18 >= v17 >> 1)
        sub_244F174C0(v17 > 1, v18 + 1, 1);
      ++v7;
      *(_QWORD *)(v24 + 16) = a2;
      v19 = v24 + 16 * v18;
      *(_QWORD *)(v19 + 32) = v11;
      *(_BYTE *)(v19 + 40) = v16;
      if (v7 == v4)
        return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_244F14344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  char v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v38;

  v34 = a1 + 56;
  v38 = MEMORY[0x24BEE4AF8];
  v6 = 1 << *(_BYTE *)(a1 + 32);
  if (v6 < 64)
    v7 = ~(-1 << v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a1 + 56);
  v35 = (unint64_t)(v6 + 63) >> 6;
  v36 = a3 + 56;
  swift_bridgeObjectRetain();
  v9 = 0;
  if (v8)
    goto LABEL_7;
LABEL_8:
  while (2)
  {
    v12 = v9 + 1;
    if (!__OFADD__(v9, 1))
    {
      if (v12 < v35)
      {
        v13 = *(_QWORD *)(v34 + 8 * v12);
        ++v9;
        if (v13)
          goto LABEL_22;
        v9 = v12 + 1;
        if (v12 + 1 >= v35)
          goto LABEL_46;
        v13 = *(_QWORD *)(v34 + 8 * v9);
        if (v13)
          goto LABEL_22;
        v9 = v12 + 2;
        if (v12 + 2 >= v35)
          goto LABEL_46;
        v13 = *(_QWORD *)(v34 + 8 * v9);
        if (v13)
          goto LABEL_22;
        v9 = v12 + 3;
        if (v12 + 3 >= v35)
          goto LABEL_46;
        v13 = *(_QWORD *)(v34 + 8 * v9);
        if (v13)
        {
LABEL_22:
          v8 = (v13 - 1) & v13;
          for (i = __clz(__rbit64(v13)) + (v9 << 6); ; i = v10 | (v9 << 6))
          {
            v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
            v17 = *v15;
            v16 = v15[1];
            v18 = *(_QWORD *)(a2 + 16);
            swift_bridgeObjectRetain();
            if (v18)
            {
              swift_bridgeObjectRetain();
              sub_244F11EF0(v17, v16);
              v20 = v19;
              swift_bridgeObjectRelease();
              if ((v20 & 1) != 0)
                break;
            }
            if (*(_QWORD *)(a3 + 16))
            {
              sub_244F1BD00();
              sub_244F1B880();
              v21 = sub_244F1BD18();
              v22 = -1 << *(_BYTE *)(a3 + 32);
              v23 = v21 & ~v22;
              if (((*(_QWORD *)(v36 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) != 0)
              {
                v24 = *(_QWORD *)(a3 + 48);
                v25 = (_QWORD *)(v24 + 16 * v23);
                v26 = *v25 == v17 && v25[1] == v16;
                if (v26 || (sub_244F1BCA0() & 1) != 0)
                  break;
                v27 = ~v22;
                while (1)
                {
                  v23 = (v23 + 1) & v27;
                  if (((*(_QWORD *)(v36 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
                    break;
                  v28 = (_QWORD *)(v24 + 16 * v23);
                  v29 = *v28 == v17 && v28[1] == v16;
                  if (v29 || (sub_244F1BCA0() & 1) != 0)
                    goto LABEL_6;
                }
              }
            }
            if (!*(_QWORD *)(a4 + 16))
            {
              __break(1u);
              goto LABEL_48;
            }
            swift_bridgeObjectRetain();
            sub_244F11EF0(v17, v16);
            if ((v30 & 1) == 0)
              goto LABEL_50;
            swift_retain();
            v31 = swift_bridgeObjectRelease_n();
            MEMORY[0x24952A5C4](v31);
            if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_244F1B970();
            sub_244F1B988();
            sub_244F1B964();
            if (!v8)
              goto LABEL_8;
LABEL_7:
            v10 = __clz(__rbit64(v8));
            v8 &= v8 - 1;
          }
LABEL_6:
          swift_bridgeObjectRelease();
          if (!v8)
            continue;
          goto LABEL_7;
        }
        v14 = v12 + 4;
        if (v14 < v35)
        {
          v13 = *(_QWORD *)(v34 + 8 * v14);
          v9 = v14;
          if (!v13)
          {
            while (1)
            {
              v9 = v14 + 1;
              if (__OFADD__(v14, 1))
                goto LABEL_49;
              if (v9 >= v35)
                goto LABEL_46;
              v13 = *(_QWORD *)(v34 + 8 * v9);
              ++v14;
              if (v13)
                goto LABEL_22;
            }
          }
          goto LABEL_22;
        }
      }
LABEL_46:
      swift_release();
      return v38;
    }
    break;
  }
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

_QWORD *sub_244F146AC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;

  v16 = *(_QWORD *)(a1 + 16);
  if (!v16)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v2 = 0;
  v3 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v7 = *(v3 - 1);
    v6 = *v3;
    swift_bridgeObjectRetain();
    v8 = a2(v2, v7, v6);
    v10 = v9;
    v12 = v11;
    swift_bridgeObjectRelease();
    if (v10)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v4 = sub_244F07F9C(0, v4[2] + 1, 1, v4);
      v14 = v4[2];
      v13 = v4[3];
      if (v14 >= v13 >> 1)
        v4 = sub_244F07F9C((_QWORD *)(v13 > 1), v14 + 1, 1, v4);
      v4[2] = v14 + 1;
      v5 = &v4[3 * v14];
      v5[4] = v8;
      v5[5] = v10;
      v5[6] = v12;
    }
    ++v2;
    v3 += 2;
  }
  while (v16 != v2);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_244F147F4(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;

  v19 = MEMORY[0x24BEE4AF8];
  sub_244F17398(0, 0, 0);
  if (a1 >> 62)
    goto LABEL_18;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v3)
  {
    while (1)
    {
      v4 = 0;
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
      v17 = a1 & 0xC000000000000001;
      v15 = a1;
      while (v17)
      {
        v5 = MEMORY[0x24952A750](v4, a1);
        v6 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_17;
LABEL_7:
        v7 = *(_QWORD *)(a2 + 16);
        v8 = v7 + v4;
        if (__OFADD__(v7, v4))
          goto LABEL_16;
        v9 = *(_QWORD *)(v5 + 16);
        v10 = *(_QWORD *)(v5 + 24);
        swift_bridgeObjectRetain();
        swift_release();
        v12 = *(_QWORD *)(v19 + 16);
        v11 = *(_QWORD *)(v19 + 24);
        if (v12 >= v11 >> 1)
          sub_244F17398(v11 > 1, v12 + 1, 1);
        *(_QWORD *)(v19 + 16) = v12 + 1;
        v13 = (_QWORD *)(v19 + 24 * v12);
        v13[4] = v9;
        v13[5] = v10;
        v13[6] = v8;
        ++v4;
        a1 = v15;
        if (v6 == v3)
          goto LABEL_19;
      }
      if (v4 < *(_QWORD *)(v16 + 16))
        break;
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      swift_bridgeObjectRetain();
      v3 = sub_244F1BB5C();
      if (!v3)
        goto LABEL_19;
    }
    v5 = *(_QWORD *)(a1 + 8 * v4 + 32);
    swift_retain();
    v6 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_17;
    goto LABEL_7;
  }
LABEL_19:
  swift_bridgeObjectRelease();
  return v19;
}

unint64_t sub_244F1499C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_244F1BAB4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_244F1B8A4();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  sub_244F1ABD4(a3);
  sub_244F1B8A4();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  return 0xD000000000000011;
}

unint64_t sub_244F14A6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25742CA08;
  if (!qword_25742CA08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742CA00);
    result = MEMORY[0x24952AE28](MEMORY[0x24BEE1718], v1);
    atomic_store(result, (unint64_t *)&qword_25742CA08);
  }
  return result;
}

unint64_t sub_244F14AB8()
{
  unint64_t result;

  result = qword_25742CA10;
  if (!qword_25742CA10)
  {
    result = MEMORY[0x24952AE28](&unk_244F1EE68, &type metadata for EvaluatorError);
    atomic_store(result, (unint64_t *)&qword_25742CA10);
  }
  return result;
}

uint64_t sub_244F14AFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_244F11940(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t sub_244F14B04(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t result;

  if (a4 - 1 <= 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_244F14B20(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t result;

  if (a4 - 1 <= 1)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_244F14B3C()
{
  unint64_t result;

  result = qword_25742CA20;
  if (!qword_25742CA20)
  {
    result = MEMORY[0x24952AE28](&unk_244F1F274, &type metadata for Expression.EvaluationError);
    atomic_store(result, (unint64_t *)&qword_25742CA20);
  }
  return result;
}

uint64_t sub_244F14B80()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t storeEnumTagSinglePayload for VisitState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244F14BF0 + 4 * byte_244F1ECDD[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_244F14C24 + 4 * byte_244F1ECD8[v4]))();
}

uint64_t sub_244F14C24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F14C2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244F14C34);
  return result;
}

uint64_t sub_244F14C40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244F14C48);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_244F14C4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F14C54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VisitState()
{
  return &type metadata for VisitState;
}

uint64_t sub_244F14C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 a7)
{
  uint64_t result;

  if (a7 >= 2u && a7 != 3)
  {
    if (a7 != 2)
      return result;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t destroy for EvaluatorError(uint64_t a1)
{
  return sub_244F14CE8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

uint64_t sub_244F14CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 a7)
{
  uint64_t result;

  if (a7 >= 2u && a7 != 3)
  {
    if (a7 != 2)
      return result;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EvaluatorError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_244F14C70(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for EvaluatorError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_244F14C70(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9);
  v10 = *(_QWORD *)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v16 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_244F14CE8(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for EvaluatorError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  unsigned __int8 v11;

  v3 = *(_BYTE *)(a2 + 48);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v3;
  sub_244F14CE8(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for EvaluatorError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 49))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for EvaluatorError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_BYTE *)(result + 48) = -(char)a2;
  }
  return result;
}

uint64_t sub_244F14F58(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48);
}

uint64_t sub_244F14F60(uint64_t result, char a2)
{
  *(_BYTE *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for EvaluatorError()
{
  return &type metadata for EvaluatorError;
}

unint64_t sub_244F14F80()
{
  unint64_t result;

  result = qword_25742CA28;
  if (!qword_25742CA28)
  {
    result = MEMORY[0x24952AE28](&unk_244F1EE40, &type metadata for VisitState);
    atomic_store(result, (unint64_t *)&qword_25742CA28);
  }
  return result;
}

uint64_t sub_244F14FC4(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  *(_BYTE *)(a2 + 48) = *((_BYTE *)a1 + 48);
  *(_OWORD *)(a2 + 16) = v3;
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v2;
  return a2;
}

_QWORD *ModeList.init(for:modesDirectories:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  v3 = sub_244F0C908(a2, a1);
  swift_bridgeObjectRelease();
  sub_244EEAA84(a1);
  return v3;
}

uint64_t ModeList.init(decoding:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  sub_244F1B5C8();
  swift_allocObject();
  sub_244F1B5BC();
  sub_244F1B58C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742CA30);
  sub_244F15220(&qword_25742CA38, (uint64_t (*)(void))sub_244F151DC, MEMORY[0x24BEE12D0]);
  sub_244F1B5B0();
  sub_244EEA990(a1, a2);
  result = swift_release();
  if (!v2)
    return v6;
  return result;
}

uint64_t ModeList.encode()()
{
  uint64_t v0;

  sub_244F1B5EC();
  swift_allocObject();
  sub_244F1B5E0();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742CA30);
  sub_244F15220(&qword_25742CA48, (uint64_t (*)(void))sub_244F15288, MEMORY[0x24BEE12A0]);
  v0 = sub_244F1B5D4();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_244F151DC()
{
  unint64_t result;

  result = qword_25742CA40;
  if (!qword_25742CA40)
  {
    result = MEMORY[0x24952AE28](&protocol conformance descriptor for Mode, &type metadata for Mode);
    atomic_store(result, (unint64_t *)&qword_25742CA40);
  }
  return result;
}

uint64_t sub_244F15220(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742CA30);
    v8 = a2();
    result = MEMORY[0x24952AE28](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_244F15288()
{
  unint64_t result;

  result = qword_25742CA50;
  if (!qword_25742CA50)
  {
    result = MEMORY[0x24952AE28](&protocol conformance descriptor for Mode, &type metadata for Mode);
    atomic_store(result, (unint64_t *)&qword_25742CA50);
  }
  return result;
}

ValueMetadata *type metadata accessor for ModeList()
{
  return &type metadata for ModeList;
}

uint64_t destroy for SetSpec()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s7Recount7SetSpecVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SetSpec(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SetSpec(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SetSpec(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SetSpec(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SetSpec()
{
  return &type metadata for SetSpec;
}

uint64_t sub_244F154B4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v13 = a3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742CA68);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244F15BC4();
  sub_244F1BD30();
  v15 = a2;
  v14 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742BAC8);
  sub_244F0F98C(&qword_25742C710, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
  sub_244F1BC64();
  if (!v4)
  {
    v15 = v13;
    v14 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C368);
    sub_244F15C08(&qword_25742CA70, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
    sub_244F1BC64();
    v15 = a4;
    v14 = 2;
    sub_244F1BC64();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_244F15684()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6973736572707865;
  if (*v0 != 1)
    v1 = 0x746E6174736E6F63;
  if (*v0)
    return v1;
  else
    return 0x6D726F6674616C70;
}

uint64_t sub_244F156E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244F157A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244F1570C()
{
  sub_244F15BC4();
  return sub_244F1BD60();
}

uint64_t sub_244F15734()
{
  sub_244F15BC4();
  return sub_244F1BD6C();
}

uint64_t sub_244F1575C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_244F15928(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_244F15788(_QWORD *a1)
{
  uint64_t *v1;

  return sub_244F154B4(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_244F157A4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6D726F6674616C70 && a2 == 0xE900000000000073;
  if (v2 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6973736572707865 && a2 == 0xEB00000000736E6FLL || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E6174736E6F63 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_244F1BCA0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_244F15928(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742CA58);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_244F15BC4();
  sub_244F1BD24();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742BAC8);
    v10 = 0;
    sub_244F0F98C(&qword_25742C828, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_244F1BBEC();
    v7 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C368);
    v10 = 1;
    sub_244F15C08((unint64_t *)&qword_25742C370, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
    swift_bridgeObjectRetain();
    sub_244F1BBEC();
    v10 = 2;
    swift_bridgeObjectRetain();
    sub_244F1BBEC();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_244F15BC4()
{
  unint64_t result;

  result = qword_25742CA60;
  if (!qword_25742CA60)
  {
    result = MEMORY[0x24952AE28](&unk_244F1F018, &type metadata for SetSpec.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742CA60);
  }
  return result;
}

uint64_t sub_244F15C08(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742C368);
    v8[0] = a2;
    v8[1] = a2;
    result = MEMORY[0x24952AE28](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SetSpec.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244F15CB4 + 4 * byte_244F1EEF5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_244F15CE8 + 4 * asc_244F1EEF0[v4]))();
}

uint64_t sub_244F15CE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F15CF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244F15CF8);
  return result;
}

uint64_t sub_244F15D04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244F15D0CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_244F15D10(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F15D18(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SetSpec.CodingKeys()
{
  return &type metadata for SetSpec.CodingKeys;
}

unint64_t sub_244F15D38()
{
  unint64_t result;

  result = qword_25742CA78;
  if (!qword_25742CA78)
  {
    result = MEMORY[0x24952AE28](&unk_244F1EFF0, &type metadata for SetSpec.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742CA78);
  }
  return result;
}

unint64_t sub_244F15D80()
{
  unint64_t result;

  result = qword_25742CA80;
  if (!qword_25742CA80)
  {
    result = MEMORY[0x24952AE28](&unk_244F1EF60, &type metadata for SetSpec.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742CA80);
  }
  return result;
}

unint64_t sub_244F15DC8()
{
  unint64_t result;

  result = qword_25742CA88;
  if (!qword_25742CA88)
  {
    result = MEMORY[0x24952AE28](&unk_244F1EF88, &type metadata for SetSpec.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25742CA88);
  }
  return result;
}

_QWORD *sub_244F15E10(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Expression(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for Expression(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Expression(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Expression(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Expression()
{
  return &type metadata for Expression;
}

uint64_t sub_244F15F70(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      v2 = v13 + 1;
      if (v13 + 1 >= v7)
        return swift_release();
      v14 = *(_QWORD *)(v3 + 8 * v2);
      if (!v14)
      {
        v2 = v13 + 2;
        if (v13 + 2 >= v7)
          return swift_release();
        v14 = *(_QWORD *)(v3 + 8 * v2);
        if (!v14)
        {
          v2 = v13 + 3;
          if (v13 + 3 >= v7)
            return swift_release();
          v14 = *(_QWORD *)(v3 + 8 * v2);
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    v10 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v9);
    v11 = *v10;
    v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_244F08CA8(&v16, v11, v12);
    result = swift_bridgeObjectRelease();
  }
  v15 = v13 + 4;
  if (v15 >= v7)
    return swift_release();
  v14 = *(_QWORD *)(v3 + 8 * v15);
  if (v14)
  {
    v2 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v2);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_244F160DC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 43 && a2 == 0xE100000000000000 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 45 && a2 == 0xE100000000000000 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 42 && a2 == 0xE100000000000000 || (sub_244F1BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 47 && a2 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v5 = sub_244F1BCA0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

void sub_244F16228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  __asm { BR              X10 }
}

uint64_t sub_244F16268()
{
  _QWORD **v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  unint64_t v8;

  v2 = *v0;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_244F08828(0, v2[2] + 1, 1, v2);
    v2 = (_QWORD *)result;
  }
  v4 = v2[2];
  v5 = v2[3];
  v6 = v4 + 1;
  if (v4 >= v5 >> 1)
  {
    v7 = v2;
    v8 = v2[2];
    result = (uint64_t)sub_244F08828((_QWORD *)(v5 > 1), v4 + 1, 1, v7);
    v4 = v8;
    v2 = (_QWORD *)result;
  }
  v2[2] = v6;
  v2[v4 + 4] = v1;
  *v0 = v2;
  return result;
}

void sub_244F164E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  __asm { BR              X10 }
}

uint64_t sub_244F1651C()
{
  sub_244F1B994();
  return 0;
}

uint64_t sub_244F165E0()
{
  unsigned __int8 v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)&loc_244F165F4 + *((int *)qword_244F166B0 + v0)))(43, 0xE100000000000000);
}

void sub_244F16604()
{
  JUMPOUT(0x244F165CCLL);
}

void sub_244F16680()
{
  JUMPOUT(0x244F165CCLL);
}

void sub_244F16688()
{
  JUMPOUT(0x244F165CCLL);
}

void sub_244F16690()
{
  JUMPOUT(0x244F165CCLL);
}

void sub_244F166C8()
{
  uint64_t v0;

  sub_244F164E4(0, *(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void sub_244F166DC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  __asm { BR              X10 }
}

uint64_t sub_244F16738()
{
  sub_244F1BAB4();
  swift_bridgeObjectRelease();
  sub_244F1BC94();
  sub_244F1B8A4();
  swift_bridgeObjectRelease();
  sub_244F1B8A4();
  return 14897;
}

void sub_244F16930()
{
  uint64_t v0;

  sub_244F166DC(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_244F16940(uint64_t a1)
{
  return sub_244F19848(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t sub_244F16964(uint64_t a1)
{
  return sub_244F16990(a1, qword_257432CA0);
}

uint64_t sub_244F1697C(uint64_t a1)
{
  return sub_244F16990(a1, qword_257432CB8);
}

uint64_t sub_244F16990(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_244F1B634();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_244F1B604();
}

uint64_t sub_244F169EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  v0 = sub_244F1B634();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v10 - v6;
  __swift_allocate_value_buffer(v5, qword_257432CD0);
  __swift_project_value_buffer(v0, (uint64_t)qword_257432CD0);
  sub_244F1B5F8();
  if (qword_25742BA40 != -1)
    swift_once();
  __swift_project_value_buffer(v0, (uint64_t)qword_257432CA0);
  sub_244F1B610();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  if (qword_25742BA48 != -1)
    swift_once();
  __swift_project_value_buffer(v0, (uint64_t)qword_257432CB8);
  sub_244F1B610();
  return ((uint64_t (*)(char *, uint64_t))v8)(v7, v0);
}

uint64_t sub_244F16B34(uint64_t a1, uint64_t a2, char a3, _QWORD *a4, uint64_t a5, _QWORD *a6, uint64_t a7, _QWORD *a8)
{
  _QWORD *v8;
  unint64_t v13;
  uint64_t v16;
  _BYTE *i;
  BOOL v18;
  uint64_t v19;
  double v20;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v22;
  unint64_t v23;
  double *v24;
  unint64_t v25;
  char v26;
  unint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t result;
  _BYTE *v44;
  _BYTE v46[16];
  double *v47;
  double v48;
  uint64_t v49;
  _QWORD v50[4];

  v8 = a8;
  LOBYTE(v13) = a3;
  v47 = &v48;
  v48 = 0.0;
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    swift_bridgeObjectRetain();
    sub_244F1BAA8();
    goto LABEL_8;
  }
  if ((a2 & 0x2000000000000000) != 0)
  {
    v50[0] = a1;
    v50[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    switch((char)a1)
    {
      case 0:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 32:
        swift_bridgeObjectRetain();
        goto LABEL_11;
      default:
        swift_bridgeObjectRetain();
        v44 = (_BYTE *)_swift_stdlib_strtod_clocale();
        if (v44)
          v18 = *v44 == 0;
        else
LABEL_11:
          v18 = 0;
        LOBYTE(v49) = v18;
        swift_bridgeObjectRelease();
        break;
    }
    goto LABEL_13;
  }
  if ((a1 & 0x1000000000000000) == 0)
    goto LABEL_45;
  v16 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
  swift_bridgeObjectRetain();
LABEL_6:
  v8 = v46;
  for (i = (_BYTE *)v16; ; i = 0)
  {
    sub_244F1AED0(i, (BOOL *)v50);
    LOBYTE(v49) = v50[0];
LABEL_8:
    swift_bridgeObjectRelease();
LABEL_13:
    a4 += 2;
    v19 = a5 + 16;
    if ((v49 & 1) != 0)
    {
      if ((v13 & 1) != 0)
        v20 = -v48;
      else
        v20 = v48;
      swift_beginAccess();
      if (__OFADD__(*a4, 1))
      {
        __break(1u);
      }
      else
      {
        ++*a4;
        swift_beginAccess();
        v8 = *(_QWORD **)v19;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)v19 = v8;
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
LABEL_19:
          v23 = v8[2];
          v22 = v8[3];
          v13 = v23 + 1;
          if (v23 >= v22 >> 1)
          {
            v8 = sub_244F08610((_QWORD *)(v22 > 1), v23 + 1, 1, v8);
            *(_QWORD *)v19 = v8;
          }
          v8[2] = v13;
          v24 = (double *)&v8[4 * v23];
          v24[4] = v20;
          v24[5] = 0.0;
          v24[6] = 0.0;
          *((_BYTE *)v24 + 56) = 0;
          goto LABEL_38;
        }
      }
      v8 = sub_244F08610(0, v8[2] + 1, 1, v8);
      *(_QWORD *)v19 = v8;
      goto LABEL_19;
    }
    a7 += 16;
    if (a6[2])
    {
      swift_bridgeObjectRetain();
      v8 = a6;
      v25 = sub_244F11EF0(a1, a2);
      if ((v26 & 1) != 0)
      {
        v27 = (unint64_t *)(a6[7] + 16 * v25);
        v13 = *v27;
        a6 = (_QWORD *)v27[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_beginAccess();
        if (!__OFADD__(*a4, 1))
        {
          ++*a4;
          swift_beginAccess();
          v28 = swift_bridgeObjectRetain();
          sub_244F15F70(v28);
          swift_endAccess();
          swift_beginAccess();
          v29 = swift_bridgeObjectRetain();
          sub_244F06878(v29);
          swift_endAccess();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_39;
        }
        __break(1u);
LABEL_52:
        v8 = sub_244F08610(0, v8[2] + 1, 1, v8);
        *(_QWORD *)v19 = v8;
LABEL_33:
        v36 = v8[2];
        v35 = v8[3];
        v13 = v36 + 1;
        if (v36 >= v35 >> 1)
        {
          v8 = sub_244F08610((_QWORD *)(v35 > 1), v36 + 1, 1, v8);
          *(_QWORD *)v19 = v8;
        }
        v8[2] = v13;
        v37 = &v8[4 * v36];
        v37[5] = 0;
        v37[6] = 0;
        v37[4] = 0xBFF0000000000000;
        *((_BYTE *)v37 + 56) = 0;
        v38 = *(_QWORD **)v19;
        v40 = *(_QWORD *)(*(_QWORD *)v19 + 16);
        v39 = *(_QWORD *)(*(_QWORD *)v19 + 24);
        if (v40 >= v39 >> 1)
        {
          v38 = sub_244F08610((_QWORD *)(v39 > 1), v40 + 1, 1, v38);
          *(_QWORD *)v19 = v38;
        }
        v38[2] = v40 + 1;
        v41 = &v38[4 * v40];
        v41[5] = 0;
        v41[6] = 0;
        v41[4] = 4;
        *((_BYTE *)v41 + 56) = 3;
LABEL_38:
        swift_endAccess();
        goto LABEL_39;
      }
      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    if (__OFADD__(*a4, 1))
    {
      __break(1u);
    }
    else
    {
      ++*a4;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_244F08CA8(&v49, a1, a2);
      swift_endAccess();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      v8 = *(_QWORD **)v19;
      swift_bridgeObjectRetain();
      v30 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)v19 = v8;
      if ((v30 & 1) != 0)
        goto LABEL_29;
    }
    v8 = sub_244F08610(0, v8[2] + 1, 1, v8);
    *(_QWORD *)v19 = v8;
LABEL_29:
    v32 = v8[2];
    v31 = v8[3];
    a6 = (_QWORD *)(v32 + 1);
    if (v32 >= v31 >> 1)
    {
      v8 = sub_244F08610((_QWORD *)(v31 > 1), v32 + 1, 1, v8);
      *(_QWORD *)v19 = v8;
    }
    v8[2] = a6;
    v33 = &v8[4 * v32];
    v33[4] = a1;
    v33[5] = a2;
    v33[6] = 0;
    *((_BYTE *)v33 + 56) = 1;
    swift_endAccess();
    if ((v13 & 1) != 0)
    {
      swift_beginAccess();
      v8 = *(_QWORD **)v19;
      v34 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)v19 = v8;
      if ((v34 & 1) != 0)
        goto LABEL_33;
      goto LABEL_52;
    }
LABEL_39:
    v42 = sub_244F1B88C();
    result = swift_beginAccess();
    if (!__OFADD__(a8[2], v42))
      break;
    __break(1u);
LABEL_45:
    v16 = sub_244F1BAF0();
    swift_bridgeObjectRetain();
    if (v16)
      goto LABEL_6;
    v8 = v46;
  }
  a8[2] += v42;
  return result;
}

unint64_t sub_244F17168(unint64_t a1, uint64_t a2, char a3)
{
  unint64_t v5;

  if ((a3 & 1) != 0)
  {
    sub_244F1BAB4();
    swift_bridgeObjectRelease();
    v5 = 0xD000000000000013;
    sub_244F1BC94();
    sub_244F1B8A4();
    swift_bridgeObjectRelease();
    sub_244F1B8A4();
    sub_244F1BC94();
    sub_244F1B8A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_244F1BAB4();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v5 = a1;
    sub_244F1B8A4();
  }
  return v5;
}

unint64_t sub_244F172AC()
{
  uint64_t v0;

  return sub_244F17168(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_244F172B8()
{
  uint64_t *v0;

  return sub_244F1ABD4(*v0);
}

uint64_t sub_244F172C0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F175BC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F172DC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244F17D5C(a1, a2, a3, (_QWORD *)*v3, &qword_25742CB10, &qword_25742C0D0);
  *v3 = result;
  return result;
}

uint64_t sub_244F17308(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F17724(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F17324(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244F178A0(a1, a2, a3, (_QWORD *)*v3, &qword_25742CB18, &qword_25742CB20);
  *v3 = result;
  return result;
}

uint64_t sub_244F17350(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244F178A0(a1, a2, a3, (_QWORD *)*v3, &qword_25742CB28, &qword_25742C538);
  *v3 = result;
  return result;
}

uint64_t sub_244F1737C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F17A40(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F17398(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244F17BB8(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_244F173B4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244F17D5C(a1, a2, a3, (_QWORD *)*v3, &qword_25742C840, &qword_25742C108);
  *v3 = result;
  return result;
}

uint64_t sub_244F173E0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F17EE8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F173FC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F18044(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F17418(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244F181A0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_244F17434(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244F18328(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_244F17450(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244F184C8(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_244F1746C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F18668(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F17488(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F187D0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F174A4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F1892C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F174C0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F18A90(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F174DC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F18BE8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F174F8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F18D44(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F17514(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244F18EAC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_244F17530(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244F19050(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_244F1754C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244F191F4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_244F17568(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F1937C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F17584(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244F194E4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244F175A0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244F19668(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_244F175BC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C778);
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
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F17724(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CB08);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F1788C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_244F178A0(a1, a2, a3, a4, &qword_25742CB28, &qword_25742C538);
}

uint64_t sub_244F178A0(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  _QWORD *v15;
  _QWORD *v16;
  size_t v17;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 56);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v15 = v13 + 4;
  v16 = a4 + 4;
  v17 = 7 * v11;
  if ((a1 & 1) != 0)
  {
    if (v13 != a4 || v15 >= &v16[v17])
      memmove(v13 + 4, a4 + 4, v17 * 8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= &v15[v17] || v15 >= &v16[v17])
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F17A40(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CB30);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 48 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F17BB8(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C798);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C790);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F17D5C(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    v15 = v14 - 32;
    if (v14 < 32)
      v15 = v14 - 25;
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v16 = (unint64_t)(v13 + 4);
  v17 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v13 != a4 || v16 >= v17 + 8 * v11)
      memmove(v13 + 4, a4 + 4, 8 * v11);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v17 >= v16 + 8 * v11 || v16 >= v17 + 8 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_32:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F17EE8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CA90);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F18044(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4C8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F181A0(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CAC8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 32 * v8)
      memmove(v10 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 32 * v8 || v13 >= v14 + 32 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C468);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F18328(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CAD0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CAD8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F184C8(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CAE0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C4E0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F18668(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CAE8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F187D0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CA98);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F1892C(char a1, int64_t a2, char a3, char *a4)
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
  size_t v15;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7E8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  v15 = 32 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F18A90(char a1, int64_t a2, char a3, char *a4)
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
  size_t v15;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CAA0);
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
  v15 = 16 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    memcpy(v13, v14, v15);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F18BE8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C830);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F18D44(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C788);
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
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F18EAC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CAA8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CAB0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F19050(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CAB8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CAC0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F191F4(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7B0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8)
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742C7A8);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F1937C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CAF8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F194E4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742CB00);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 120);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[120 * v8])
      memmove(v12, v13, 120 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[120 * v8] || v12 >= &v13[120 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F19668(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742C730);
  v10 = *(_QWORD *)(sub_244F1B754() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_244F1B754() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_244F1BB8C();
  __break(1u);
  return result;
}

uint64_t sub_244F19848(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  return ((uint64_t (*)(void))((char *)sub_244F19864 + 4 * byte_244F1F06D[a4]))();
}

BOOL sub_244F19864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  return !a8 && a1 == a5;
}

uint64_t sub_244F19904(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD *v16;
  unint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  unsigned __int8 v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned __int8 v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t *v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  unsigned __int8 *v69;
  unsigned __int8 *v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t *v78;
  _QWORD *v79;
  uint64_t v80;
  unsigned __int8 v81;
  _QWORD *v82;
  uint64_t v83;
  _QWORD *v84;
  int v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  _QWORD *v89;
  _QWORD *v90;
  unint64_t v91;
  unint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  _QWORD *v103;
  _QWORD **v104;
  _QWORD *v105;
  unint64_t v106;
  unint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  _QWORD *v114;
  _QWORD **v115;
  _QWORD *v116;
  unint64_t v117;
  unint64_t v118;
  _QWORD *v119;
  _QWORD *v120;
  uint64_t v121;
  uint64_t v122;
  unsigned __int8 *v123;
  _QWORD *v124;
  _QWORD **v125;
  _QWORD *v126;
  unint64_t v127;
  unint64_t v128;
  _QWORD *v129;
  uint64_t *v130;
  _QWORD **v131;
  _QWORD *v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  _QWORD *v136;
  _QWORD *v137;
  uint64_t v138;
  unsigned int v139;
  uint64_t v140;
  char v141;
  unint64_t *v142;
  uint64_t v143;
  char v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  void (*v148)(uint64_t, uint64_t);
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;
  _QWORD v154[3];
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  id v158;
  uint64_t *v159;
  _QWORD *v160;
  uint64_t v161;
  _QWORD *v162;
  _QWORD *v163;
  _QWORD *v164;
  void (*v165)(char *, uint64_t);
  char *v166;
  _BOOL4 v167;
  _QWORD *v168;
  uint64_t v169;
  unint64_t *v170;

  v164 = a3;
  v3 = sub_244F1B634();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v154[0] = (char *)v154 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v154 - v7;
  v9 = swift_allocObject();
  v156 = v9;
  *(_QWORD *)(v9 + 16) = MEMORY[0x24BEE4AF8];
  v168 = (_QWORD *)(v9 + 16);
  v10 = (_QWORD *)swift_allocObject();
  v163 = v10;
  v10[2] = 0;
  v159 = v10 + 2;
  v11 = objc_allocWithZone(MEMORY[0x24BDD17A8]);
  v12 = (void *)sub_244F1B7FC();
  swift_bridgeObjectRelease();
  v13 = v11;
  v14 = v3;
  v15 = objc_msgSend(v13, sel_initWithString_, v12);

  objc_msgSend(v15, sel_setCharactersToBeSkipped_, 0);
  v16 = (_QWORD *)swift_allocObject();
  v162 = v16;
  v16[2] = 1;
  v17 = v16 + 2;
  sub_244F1B5F8();
  sub_244F1BA3C();
  v19 = v18;
  v165 = *(void (**)(char *, uint64_t))(v4 + 8);
  v166 = v8;
  v165(v8, v3);
  if (v19)
  {
    v20 = sub_244F1B88C();
    result = swift_bridgeObjectRelease();
    if (__OFADD__(*v17, v20))
      goto LABEL_185;
    *v17 += v20;
  }
  v22 = swift_allocObject();
  v161 = v22;
  *(_QWORD *)(v22 + 16) = MEMORY[0x24BEE4B08];
  v154[1] = v22 + 16;
  v170 = v17;
  swift_beginAccess();
  swift_beginAccess();
  v23 = objc_msgSend(v15, sel_isAtEnd);
  v160 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v24 = v156;
  if ((v23 & 1) != 0)
  {
LABEL_5:
    swift_bridgeObjectRelease();
    v25 = v160[2];
    v26 = (unint64_t)v159;
    result = swift_beginAccess();
    v27 = *(_QWORD *)v26 - v25;
    if (__OFSUB__(*(_QWORD *)v26, v25))
      goto LABEL_181;
    *(_QWORD *)v26 = v27;
    if (v27 >= 1)
    {
      result = (uint64_t)v160;
      if (v27 != 1)
      {
        swift_bridgeObjectRelease();
        sub_244F1AE8C();
        swift_allocError();
        *(_QWORD *)(v140 + 8) = 0;
        *(_QWORD *)(v140 + 16) = 0;
        *(_QWORD *)v140 = 0;
        v141 = 4;
LABEL_159:
        *(_BYTE *)(v140 + 24) = v141;
        goto LABEL_160;
      }
      if (!v25)
      {
        swift_bridgeObjectRelease();
        v32 = MEMORY[0x24BEE4AF8];
LABEL_155:
        v145 = v156;
        swift_beginAccess();
        sub_244F06878(v32);
        swift_endAccess();

        v26 = *(_QWORD *)(v145 + 16);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        return v26;
      }
      if (*((_BYTE *)v160 + 32))
      {
        v28 = v25 - 1;
        if (v25 == 1)
        {
LABEL_16:
          v169 = MEMORY[0x24BEE4AF8];
          swift_bridgeObjectRetain();
          result = sub_244F174A4(0, v25, 0);
          v32 = v169;
          v33 = 16 * v25 + 16;
          while (v28 != -1)
          {
            if (v28 >= v160[2])
              goto LABEL_177;
            v34 = *((unsigned __int8 *)v160 + v33);
            v169 = v32;
            v36 = *(_QWORD *)(v32 + 16);
            v35 = *(_QWORD *)(v32 + 24);
            if (v36 >= v35 >> 1)
            {
              result = sub_244F174A4(v35 > 1, v36 + 1, 1);
              v32 = v169;
            }
            *(_QWORD *)(v32 + 16) = v36 + 1;
            v37 = v32 + 32 * v36;
            *(_QWORD *)(v37 + 40) = 0;
            *(_QWORD *)(v37 + 48) = 0;
            *(_QWORD *)(v37 + 32) = v34;
            *(_BYTE *)(v37 + 56) = 3;
            --v28;
            v33 -= 16;
            if (v28 == -1)
            {
              swift_bridgeObjectRelease_n();
              goto LABEL_155;
            }
          }
          goto LABEL_176;
        }
        v29 = v160 + 7;
        v30 = 1;
        while (1)
        {
          v31 = v30 + 1;
          if (__OFADD__(v30, 1))
            goto LABEL_182;
          if (!*((_BYTE *)v29 - 8))
            goto LABEL_157;
          v29 += 2;
          ++v30;
          if (v31 == v25)
            goto LABEL_16;
        }
      }
      v29 = v160 + 5;
LABEL_157:
      v26 = *v29;
      swift_bridgeObjectRelease();
LABEL_158:
      sub_244F1AE8C();
      swift_allocError();
      *(_QWORD *)(v140 + 8) = 0;
      *(_QWORD *)(v140 + 16) = 0;
      *(_QWORD *)v140 = v26;
      v141 = 1;
      goto LABEL_159;
    }
    if (v25)
    {
      v139 = *((unsigned __int8 *)v160 + 32);
      v26 = v160[5];
      swift_bridgeObjectRelease();
      if (v139 <= 1)
        goto LABEL_158;
    }
    else
    {
      swift_bridgeObjectRelease();
      v142 = v170;
      swift_beginAccess();
      v26 = *v142;
    }
    sub_244F1AE8C();
    swift_allocError();
    *(_QWORD *)(v143 + 8) = 0;
    *(_QWORD *)(v143 + 16) = 0;
    *(_QWORD *)v143 = v26;
    v144 = 2;
LABEL_153:
    *(_BYTE *)(v143 + 24) = v144;
LABEL_160:
    swift_willThrow();
    swift_release();
    swift_release();
    swift_release();
    swift_release();

    return v26;
  }
  v160 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v167 = 1;
  v158 = v15;
  v157 = v3;
  while (1)
  {
    while (1)
    {
      sub_244F1BA30();
      v39 = v38;
      swift_bridgeObjectRelease();
      if (v39)
      {
        v58 = *v170;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) != 0)
        {
          v59 = v160;
        }
        else
        {
          result = (uint64_t)sub_244F0871C(0, v160[2] + 1, 1, v160);
          v59 = (_QWORD *)result;
        }
        v61 = v59[2];
        v60 = v59[3];
        v62 = (uint64_t *)v170;
        if (v61 >= v60 >> 1)
        {
          result = (uint64_t)sub_244F0871C((_QWORD *)(v60 > 1), v61 + 1, 1, v59);
          v62 = (uint64_t *)v170;
          v59 = (_QWORD *)result;
        }
        v59[2] = v61 + 1;
        v63 = &v59[2 * v61];
        *((_BYTE *)v63 + 32) = 0;
        v63[5] = v58;
        v64 = *v62 + 1;
        if (__OFADD__(*v62, 1))
          goto LABEL_186;
        v160 = v59;
        v167 = 0;
        *v62 = v64;
        goto LABEL_88;
      }
      sub_244F1BA30();
      v41 = v40;
      swift_bridgeObjectRelease();
      if (!v41)
        break;
      if (!v160[2])
        goto LABEL_169;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) != 0)
      {
        v65 = v160;
      }
      else
      {
        result = (uint64_t)sub_244F137FC(v160);
        v65 = (_QWORD *)result;
      }
      v67 = v65 + 2;
      v66 = v65[2];
      if (!v66)
        goto LABEL_178;
      v68 = v66 - 1;
      v69 = (unsigned __int8 *)(v65 + 4);
      v70 = (unsigned __int8 *)&v65[2 * v68 + 4];
      v71 = *v70;
      v26 = *((_QWORD *)v70 + 1);
      v65[2] = v68;
      LODWORD(v72) = 1;
      if ((_DWORD)v71)
      {
        if ((_DWORD)v71 != 1)
        {
          v114 = v65;
          v115 = (_QWORD **)v168;
          swift_beginAccess();
          v116 = *v115;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v116 = sub_244F08610(0, v116[2] + 1, 1, v116);
          v15 = v158;
          v118 = v116[2];
          v117 = v116[3];
          if (v118 >= v117 >> 1)
            v116 = sub_244F08610((_QWORD *)(v117 > 1), v118 + 1, 1, v116);
          v116[2] = v118 + 1;
          v119 = &v116[4 * v118];
          v119[5] = 0;
          v119[6] = 0;
          v119[4] = v71;
          *((_BYTE *)v119 + 56) = 3;
          *v168 = v116;
          result = swift_endAccess();
          if (__OFSUB__(*v159, 1))
            goto LABEL_180;
          --*v159;
          if (*v67)
          {
            v71 = v26;
            v120 = v114;
            do
            {
              v65 = v120;
              result = swift_isUniquelyReferenced_nonNull_native();
              if ((result & 1) == 0)
              {
                result = (uint64_t)sub_244F137FC(v120);
                v65 = (_QWORD *)result;
              }
              v67 = v65 + 2;
              v121 = v65[2];
              if (!v121)
                goto LABEL_178;
              v122 = v121 - 1;
              v69 = (unsigned __int8 *)(v65 + 4);
              v123 = (unsigned __int8 *)&v65[2 * v122 + 4];
              v72 = *v123;
              v26 = *((_QWORD *)v123 + 1);
              v65[2] = v122;
              if (!(_DWORD)v72)
                goto LABEL_130;
              if ((_DWORD)v72 == 1)
              {
                v160 = v65;
                LODWORD(v72) = 0;
                goto LABEL_132;
              }
              v124 = v65;
              v125 = (_QWORD **)v168;
              swift_beginAccess();
              v126 = *v125;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v126 = sub_244F08610(0, v126[2] + 1, 1, v126);
              v15 = v158;
              v128 = v126[2];
              v127 = v126[3];
              if (v128 >= v127 >> 1)
                v126 = sub_244F08610((_QWORD *)(v127 > 1), v128 + 1, 1, v126);
              v126[2] = v128 + 1;
              v129 = &v126[4 * v128];
              v129[5] = 0;
              v129[6] = 0;
              v129[4] = v72;
              *((_BYTE *)v129 + 56) = 3;
              *v168 = v126;
              result = swift_endAccess();
              v14 = v157;
              if (__OFSUB__(*v159, 1))
                goto LABEL_180;
              --*v159;
              v71 = v26;
              v120 = v124;
            }
            while (*v67);
          }
LABEL_169:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v26 = *v170;
          sub_244F1AE8C();
          swift_allocError();
          *(_QWORD *)(v153 + 8) = 0;
          *(_QWORD *)(v153 + 16) = 0;
          *(_QWORD *)v153 = v26;
          *(_BYTE *)(v153 + 24) = 0;
          goto LABEL_160;
        }
        v160 = v65;
        v71 = 0;
LABEL_132:
        v131 = (_QWORD **)v168;
        swift_beginAccess();
        v132 = *v131;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v132 = sub_244F08610(0, v132[2] + 1, 1, v132);
        v26 = v132[2];
        v133 = v132[3];
        v134 = v133 >> 1;
        v135 = v26 + 1;
        if (v133 >> 1 <= v26)
        {
          v132 = sub_244F08610((_QWORD *)(v133 > 1), v26 + 1, 1, v132);
          v133 = v132[3];
          v134 = v133 >> 1;
        }
        v132[2] = v135;
        v136 = &v132[4 * v26];
        v136[5] = 0;
        v136[6] = 0;
        v136[4] = 0xBFF0000000000000;
        *((_BYTE *)v136 + 56) = 0;
        if (v134 <= v135)
          v132 = sub_244F08610((_QWORD *)(v133 > 1), v26 + 2, 1, v132);
        v132[2] = v26 + 2;
        v137 = &v132[4 * v135];
        v137[5] = 0;
        v137[6] = 0;
        v137[4] = 4;
        *((_BYTE *)v137 + 56) = 3;
        *v168 = v132;
        result = swift_endAccess();
        v130 = (uint64_t *)v170;
        v65 = v160;
      }
      else
      {
LABEL_130:
        v130 = (uint64_t *)v170;
      }
      if (*v159 < 1)
      {
        swift_bridgeObjectRelease();
        if (*v67)
        {
          v26 = *v69;
          v71 = v65[5];
          swift_bridgeObjectRelease();
          if (v26 <= 1)
          {
            sub_244F1AE8C();
            swift_allocError();
            *(_QWORD *)(v152 + 8) = 0;
            *(_QWORD *)(v152 + 16) = 0;
            *(_QWORD *)v152 = v71;
            *(_BYTE *)(v152 + 24) = 1;
            v15 = v158;
            goto LABEL_160;
          }
          v15 = v158;
        }
        else
        {
          swift_bridgeObjectRelease();
          v15 = v158;
          if ((_DWORD)v72)
            v71 = *v170;
        }
        sub_244F1AE8C();
        swift_allocError();
        *(_QWORD *)(v140 + 16) = 0;
        *(_QWORD *)v140 = v71;
LABEL_150:
        *(_QWORD *)(v140 + 8) = 0;
        v141 = 2;
        goto LABEL_159;
      }
      v138 = *v130 + 1;
      if (__OFADD__(*v130, 1))
        goto LABEL_188;
      v160 = v65;
      v167 = 0;
      *v130 = v138;
      v24 = v156;
      v15 = v158;
LABEL_89:
      v98 = v166;
      sub_244F1B5F8();
      sub_244F1BA3C();
      v100 = v99;
      v165(v98, v14);
      if (v100)
      {
        v101 = sub_244F1B88C();
        result = swift_bridgeObjectRelease();
        if (__OFADD__(*v170, v101))
          goto LABEL_179;
        *v170 += v101;
        v167 = 1;
      }
      if (objc_msgSend(v15, sel_isAtEnd))
        goto LABEL_5;
    }
    if (qword_25742BA40 != -1)
      swift_once();
    __swift_project_value_buffer(v14, (uint64_t)qword_257432CA0);
    v42 = sub_244F1BA3C();
    if (!v43)
      goto LABEL_58;
    v44 = v42;
    v45 = v43;
    swift_bridgeObjectRetain();
    v46 = sub_244F160DC(v44, v45);
    if (v46 - 2 >= 2)
    {
      if (v46 != 6)
      {
LABEL_71:
        v167 = 0;
        v50 = 0;
        goto LABEL_72;
      }
      swift_bridgeObjectRelease();
LABEL_58:
      if (qword_25742BA50 != -1)
        swift_once();
      __swift_project_value_buffer(v14, (uint64_t)qword_257432CD0);
      v73 = sub_244F1BA48();
      if (!v74)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v146 = v166;
        sub_244F1B628();
        v147 = v154[0];
        sub_244F1B61C();
        v148 = (void (*)(uint64_t, uint64_t))v165;
        v165(v146, v14);
        v26 = sub_244F1BA3C();
        v150 = v149;
        v148(v147, v14);
        if (!v150)
        {
          v26 = 0;
          v150 = 0xE000000000000000;
        }
        v151 = *v170;
        sub_244F1AE8C();
        swift_allocError();
        *(_QWORD *)v143 = v151;
        *(_QWORD *)(v143 + 8) = v26;
        *(_QWORD *)(v143 + 16) = v150;
        v144 = 3;
        goto LABEL_153;
      }
      sub_244F16B34(v73, v74, 0, v163, v24, v164, v161, v162);
      swift_bridgeObjectRelease();
      v167 = 0;
      goto LABEL_89;
    }
    v47 = v166;
    sub_244F1B5F8();
    sub_244F1BA3C();
    v49 = v48;
    v165(v47, v14);
    if (v49)
    {
      v50 = sub_244F1B88C();
      swift_bridgeObjectRelease();
      if (!v167 || v50 != 0)
        goto LABEL_63;
    }
    else if (!v167)
    {
      goto LABEL_71;
    }
    if ((objc_msgSend(v15, sel_isAtEnd) & 1) != 0)
      break;
    v51 = sub_244F1B88C();
    v52 = *v170 + v51;
    if (__OFADD__(*v170, v51))
    {
      __break(1u);
      goto LABEL_169;
    }
    *v170 = v52;
    sub_244F1BA30();
    v54 = v53;
    swift_bridgeObjectRelease();
    if (v54)
    {
      swift_bridgeObjectRelease();
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) != 0)
      {
        v75 = v160;
      }
      else
      {
        result = (uint64_t)sub_244F0871C(0, v160[2] + 1, 1, v160);
        v75 = (_QWORD *)result;
      }
      v77 = v75[2];
      v76 = v75[3];
      v78 = (uint64_t *)v170;
      if (v77 >= v76 >> 1)
      {
        result = (uint64_t)sub_244F0871C((_QWORD *)(v76 > 1), v77 + 1, 1, v75);
        v78 = (uint64_t *)v170;
        v75 = (_QWORD *)result;
      }
      v75[2] = v77 + 1;
      v79 = &v75[2 * v77];
      *((_BYTE *)v79 + 32) = 1;
      v79[5] = v52;
      v80 = *v78 + 1;
      if (__OFADD__(*v78, 1))
        goto LABEL_187;
      v160 = v75;
      *v78 = v80;
      v81 = objc_msgSend(v15, sel_isAtEnd);
      v24 = v156;
      if ((v81 & 1) != 0)
        goto LABEL_5;
    }
    else
    {
      if (qword_25742BA50 != -1)
        swift_once();
      __swift_project_value_buffer(v14, (uint64_t)qword_257432CD0);
      v55 = sub_244F1BA48();
      v50 = v56;
      if (!v56)
        goto LABEL_63;
      v57 = v55;
      swift_bridgeObjectRelease();
      sub_244F16B34(v57, v50, v46 == 3, v163, v24, v164, v161, v162);
      swift_bridgeObjectRelease();
      if ((objc_msgSend(v15, sel_isAtEnd) & 1) != 0)
        goto LABEL_5;
    }
  }
  v50 = 0;
LABEL_63:
  v167 = v50 != 0;
LABEL_72:
  v82 = v160;
  v83 = v160[2];
  if (!v83)
    goto LABEL_81;
  v160 = (v46 - 2) > 3u ? 0 : (_QWORD *)qword_244F1F2B8[(char)(v46 - 2)];
  v84 = &v82[2 * v83];
  v85 = *((unsigned __int8 *)v84 + 16);
  v86 = v84[3];
  if ((v85 - 2) < 2)
  {
    v87 = 5;
  }
  else
  {
    if ((v85 - 4) < 2)
      goto LABEL_95;
    v87 = 0;
  }
  if (v87 < (unint64_t)v160)
  {
LABEL_81:
    v88 = *v170;
    v89 = v82;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      v90 = v89;
    else
      v90 = sub_244F0871C(0, v89[2] + 1, 1, v89);
    v92 = v90[2];
    v91 = v90[3];
    if (v92 >= v91 >> 1)
      v90 = sub_244F0871C((_QWORD *)(v91 > 1), v92 + 1, 1, v90);
    v90[2] = v92 + 1;
    v160 = v90;
    v93 = &v90[2 * v92];
    *((_BYTE *)v93 + 32) = v46;
    v93[5] = v88;
    v94 = sub_244F1B88C();
    result = swift_bridgeObjectRelease();
    v95 = v94 + v50;
    if (__OFADD__(v94, v50))
      goto LABEL_183;
    v96 = __OFADD__(*v170, v95);
    v97 = *v170 + v95;
    if (v96)
      goto LABEL_184;
    *v170 = v97;
LABEL_88:
    v24 = v156;
    goto LABEL_89;
  }
  while (1)
  {
LABEL_95:
    v155 = v86;
    v103 = v82;
    v104 = (_QWORD **)v168;
    swift_beginAccess();
    v105 = *v104;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v105 = sub_244F08610(0, v105[2] + 1, 1, v105);
    v107 = v105[2];
    v106 = v105[3];
    if (v107 >= v106 >> 1)
      v105 = sub_244F08610((_QWORD *)(v106 > 1), v107 + 1, 1, v105);
    v105[2] = v107 + 1;
    v108 = &v105[4 * v107];
    v108[5] = 0;
    v108[6] = 0;
    v108[4] = v85;
    *((_BYTE *)v108 + 56) = 3;
    *v168 = v105;
    result = swift_endAccess();
    v82 = v103;
    if (v103[2])
    {
      result = swift_isUniquelyReferenced_nonNull_native();
      v15 = v158;
      v14 = v157;
      if ((result & 1) != 0)
      {
        v82 = v103;
      }
      else
      {
        result = (uint64_t)sub_244F137FC(v103);
        v82 = (_QWORD *)result;
      }
      v109 = v82[2];
      v110 = v159;
      if (!v109)
        goto LABEL_175;
      v82[2] = v109 - 1;
    }
    else
    {
      v15 = v158;
      v14 = v157;
      v110 = v159;
    }
    v111 = *v110 - 1;
    if (__OFSUB__(*v110, 1))
      break;
    *v110 = v111;
    if (v111 < 0)
    {
      v26 = (unint64_t)v82;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_244F1AE8C();
      swift_allocError();
      *(_QWORD *)(v140 + 16) = 0;
      *(_QWORD *)v140 = v155;
      goto LABEL_150;
    }
    v112 = v82[2];
    if (v112)
    {
      v113 = &v82[2 * v112];
      LOBYTE(v85) = *((_BYTE *)v113 + 16);
      v102 = (v85 - 2) <= 3u ? qword_244F1F2B8[(char)(v85 - 2)] : 0;
      v86 = v113[3];
      if (v102 >= (unint64_t)v160)
        continue;
    }
    goto LABEL_81;
  }
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  __break(1u);
LABEL_177:
  __break(1u);
LABEL_178:
  __break(1u);
LABEL_179:
  __break(1u);
LABEL_180:
  __break(1u);
LABEL_181:
  __break(1u);
LABEL_182:
  __break(1u);
LABEL_183:
  __break(1u);
LABEL_184:
  __break(1u);
LABEL_185:
  __break(1u);
LABEL_186:
  __break(1u);
LABEL_187:
  __break(1u);
LABEL_188:
  __break(1u);
  return result;
}

uint64_t sub_244F1ABD4(uint64_t a1)
{
  int64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_244F172C0(0, v1, 0);
    __asm { BR              X9 }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742BAC8);
  sub_244EF31F4();
  v3 = sub_244F1B7F0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_244F1AE58()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_244F1AE7C()
{
  return swift_deallocObject();
}

unint64_t sub_244F1AE8C()
{
  unint64_t result;

  result = qword_25742CAF0;
  if (!qword_25742CAF0)
  {
    result = MEMORY[0x24952AE28](&unk_244F1F234, &type metadata for Expression.ParseError);
    atomic_store(result, (unint64_t *)&qword_25742CAF0);
  }
  return result;
}

_BYTE *sub_244F1AED0@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t storeEnumTagSinglePayload for Operator(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_244F1AF88 + 4 * byte_244F1F081[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_244F1AFBC + 4 * byte_244F1F07C[v4]))();
}

uint64_t sub_244F1AFBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F1AFC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244F1AFCCLL);
  return result;
}

uint64_t sub_244F1AFD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244F1AFE0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_244F1AFE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244F1AFEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Operator()
{
  return &type metadata for Operator;
}

uint64_t sub_244F1B008(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if (a4 == 3)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for Expression.ParseError(uint64_t a1)
{
  return sub_244F1B034(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t sub_244F1B034(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if (a4 == 3)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for Expression.ParseError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_244F1B344(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_244F1B008);
}

uint64_t *assignWithCopy for Expression.ParseError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_244F1B3B8(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_244F1B008, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_244F1B034);
}

uint64_t *assignWithTake for Expression.ParseError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_244F1B438(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_244F1B034);
}

uint64_t getEnumTagSinglePayload for Expression.ParseError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Expression.ParseError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_244F1B108(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 3u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_244F1B120(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 4;
  if (a2 >= 4)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 4;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Expression.ParseError()
{
  return &type metadata for Expression.ParseError;
}

uint64_t sub_244F1B150(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for Expression.EvaluationError(uint64_t a1)
{
  return sub_244F1B170(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_244F1B170(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s7Recount10ExpressionV15EvaluationErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_244F1B150(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Expression.EvaluationError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_244F1B150(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_244F1B170(v6, v7, v8);
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

uint64_t assignWithTake for Expression.EvaluationError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_244F1B170(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Expression.EvaluationError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Expression.EvaluationError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_244F1B300(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_244F1B308(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Expression.EvaluationError()
{
  return &type metadata for Expression.EvaluationError;
}

uint64_t destroy for Operation(uint64_t a1)
{
  return sub_244F14B20(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for Operation(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_244F1B344(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_244F14B04);
}

uint64_t sub_244F1B344(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *a2;
  v6 = a2[1];
  v7 = a2[2];
  v8 = *((unsigned __int8 *)a2 + 24);
  a4(*a2, v6, v7, v8);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  *(_BYTE *)(a1 + 24) = v8;
  return a1;
}

uint64_t *assignWithCopy for Operation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_244F1B3B8(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_244F14B04, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_244F14B20);
}

uint64_t *sub_244F1B3B8(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = *a2;
  v8 = a2[1];
  v9 = a2[2];
  v10 = *((unsigned __int8 *)a2 + 24);
  a4(*a2, v8, v9, v10);
  v11 = *a1;
  v12 = a1[1];
  v13 = a1[2];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  v14 = *((unsigned __int8 *)a1 + 24);
  *((_BYTE *)a1 + 24) = v10;
  a5(v11, v12, v13, v14);
  return a1;
}

uint64_t *assignWithTake for Operation(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_244F1B438(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_244F14B20);
}

uint64_t *sub_244F1B438(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_BYTE *)(a2 + 24);
  v8 = *a1;
  v10 = a1[1];
  v9 = a1[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v6;
  v11 = *((unsigned __int8 *)a1 + 24);
  *((_BYTE *)a1 + 24) = v7;
  a4(v8, v10, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for Operation(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Operation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_244F1B518(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_244F1B520(uint64_t result, char a2)
{
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Operation()
{
  return &type metadata for Operation;
}

unint64_t sub_244F1B544()
{
  unint64_t result;

  result = qword_25742CB38;
  if (!qword_25742CB38)
  {
    result = MEMORY[0x24952AE28](&unk_244F1F20C, &type metadata for Operator);
    atomic_store(result, (unint64_t *)&qword_25742CB38);
  }
  return result;
}

uint64_t sub_244F1B58C()
{
  return MEMORY[0x24BDCB198]();
}

uint64_t sub_244F1B598()
{
  return MEMORY[0x24BDCB1A8]();
}

uint64_t sub_244F1B5A4()
{
  return MEMORY[0x24BDCB1B0]();
}

uint64_t sub_244F1B5B0()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_244F1B5BC()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_244F1B5C8()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_244F1B5D4()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_244F1B5E0()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_244F1B5EC()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_244F1B5F8()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_244F1B604()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t sub_244F1B610()
{
  return MEMORY[0x24BDCB6D8]();
}

uint64_t sub_244F1B61C()
{
  return MEMORY[0x24BDCB720]();
}

uint64_t sub_244F1B628()
{
  return MEMORY[0x24BDCB740]();
}

uint64_t sub_244F1B634()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_244F1B640()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_244F1B64C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_244F1B658()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_244F1B664()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_244F1B670()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_244F1B67C()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_244F1B688()
{
  return MEMORY[0x24BDCC6B8]();
}

uint64_t sub_244F1B694()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_244F1B6A0()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_244F1B6AC()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_244F1B6B8()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_244F1B6C4()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_244F1B6D0()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_244F1B6DC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_244F1B6E8()
{
  return MEMORY[0x24BDCD750]();
}

uint64_t sub_244F1B6F4()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_244F1B700()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_244F1B70C()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_244F1B718()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_244F1B724()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_244F1B730()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_244F1B73C()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_244F1B748()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_244F1B754()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_244F1B760()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_244F1B76C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_244F1B778()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_244F1B784()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_244F1B790()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_244F1B79C()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_244F1B7A8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_244F1B7B4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_244F1B7C0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_244F1B7CC()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_244F1B7D8()
{
  return MEMORY[0x24BEE5578]();
}

uint64_t sub_244F1B7E4()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_244F1B7F0()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_244F1B7FC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_244F1B808()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_244F1B814()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_244F1B820()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_244F1B82C()
{
  return MEMORY[0x24BDCFA80]();
}

uint64_t sub_244F1B838()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_244F1B844()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_244F1B850()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_244F1B85C()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_244F1B868()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_244F1B874()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_244F1B880()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_244F1B88C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_244F1B898()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_244F1B8A4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_244F1B8B0()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_244F1B8BC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_244F1B8C8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_244F1B8D4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_244F1B8E0()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_244F1B8EC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_244F1B8F8()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_244F1B904()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_244F1B910()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_244F1B91C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_244F1B928()
{
  return MEMORY[0x24BDCFB60]();
}

uint64_t sub_244F1B934()
{
  return MEMORY[0x24BEE0F40]();
}

uint64_t sub_244F1B940()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_244F1B94C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_244F1B958()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_244F1B964()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_244F1B970()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_244F1B97C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_244F1B988()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_244F1B994()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_244F1B9A0()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_244F1B9AC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_244F1B9B8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_244F1B9C4()
{
  return MEMORY[0x24BEE57C0]();
}

uint64_t sub_244F1B9D0()
{
  return MEMORY[0x24BEE5828]();
}

uint64_t sub_244F1B9DC()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_244F1B9E8()
{
  return MEMORY[0x24BEE58C0]();
}

uint64_t sub_244F1B9F4()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_244F1BA00()
{
  return MEMORY[0x24BEE58E8]();
}

uint64_t sub_244F1BA0C()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_244F1BA18()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_244F1BA24()
{
  return MEMORY[0x24BEE5958]();
}

uint64_t sub_244F1BA30()
{
  return MEMORY[0x24BDD0410]();
}

uint64_t sub_244F1BA3C()
{
  return MEMORY[0x24BDD0438]();
}

uint64_t sub_244F1BA48()
{
  return MEMORY[0x24BDD0448]();
}

uint64_t sub_244F1BA54()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_244F1BA60()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_244F1BA6C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_244F1BA78()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_244F1BA84()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_244F1BA90()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_244F1BA9C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_244F1BAA8()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_244F1BAB4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_244F1BAC0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_244F1BACC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_244F1BAD8()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_244F1BAE4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_244F1BAF0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_244F1BAFC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_244F1BB08()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_244F1BB14()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_244F1BB20()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_244F1BB2C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_244F1BB38()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_244F1BB44()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_244F1BB50()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_244F1BB5C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_244F1BB68()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_244F1BB74()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_244F1BB80()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_244F1BB8C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_244F1BB98()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_244F1BBA4()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_244F1BBB0()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_244F1BBBC()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_244F1BBC8()
{
  return MEMORY[0x24BEE3348]();
}

uint64_t sub_244F1BBD4()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_244F1BBE0()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_244F1BBEC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_244F1BBF8()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_244F1BC04()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_244F1BC10()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_244F1BC1C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_244F1BC28()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_244F1BC34()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_244F1BC40()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_244F1BC4C()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_244F1BC58()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_244F1BC64()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_244F1BC70()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_244F1BC7C()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_244F1BC88()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_244F1BC94()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_244F1BCA0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_244F1BCAC()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_244F1BCB8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_244F1BCC4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_244F1BCD0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_244F1BCDC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_244F1BCE8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_244F1BCF4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_244F1BD00()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_244F1BD0C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_244F1BD18()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_244F1BD24()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_244F1BD30()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_244F1BD3C()
{
  return MEMORY[0x24BEE4828]();
}

uint64_t sub_244F1BD48()
{
  return MEMORY[0x24BEE4848]();
}

uint64_t sub_244F1BD54()
{
  return MEMORY[0x24BEE4880]();
}

uint64_t sub_244F1BD60()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_244F1BD6C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t MobileGestalt_copy_hardwarePlatform_obj()
{
  return MEMORY[0x24BED8510]();
}

uint64_t MobileGestalt_copy_marketingSOCNameString_obj()
{
  return MEMORY[0x24BED8530]();
}

uint64_t MobileGestalt_copy_physicalHardwareNameString_obj()
{
  return MEMORY[0x24BED8540]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

uint64_t kpc_force_all_ctrs_set()
{
  return MEMORY[0x24BECDC70]();
}

uint64_t kpc_get_counter_count()
{
  return MEMORY[0x24BECDC78]();
}

uint64_t kpc_set_actionid()
{
  return MEMORY[0x24BECDC88]();
}

uint64_t kpc_set_config()
{
  return MEMORY[0x24BECDC90]();
}

uint64_t kpc_set_counting()
{
  return MEMORY[0x24BECDC98]();
}

uint64_t kpc_set_period()
{
  return MEMORY[0x24BECDCA0]();
}

uint64_t kperf_action_count_set()
{
  return MEMORY[0x24BECDCB0]();
}

uint64_t kperf_action_samplers_get()
{
  return MEMORY[0x24BECDCC0]();
}

uint64_t kperf_action_samplers_set()
{
  return MEMORY[0x24BECDCC8]();
}

uint64_t kperf_kdebug_action_get()
{
  return MEMORY[0x24BECDD38]();
}

uint64_t kperf_kdebug_action_set()
{
  return MEMORY[0x24BECDD40]();
}

uint64_t kperf_kdebug_filter_add_debugid()
{
  return MEMORY[0x24BECDD60]();
}

uint64_t kperf_kdebug_filter_create()
{
  return MEMORY[0x24BECDD68]();
}

uint64_t kperf_kdebug_filter_get()
{
  return MEMORY[0x24BECDD78]();
}

uint64_t kperf_kdebug_filter_get_filter()
{
  return MEMORY[0x24BECDD80]();
}

uint64_t kperf_kdebug_filter_get_n_filters()
{
  return MEMORY[0x24BECDD88]();
}

uint64_t kperf_kdebug_filter_set()
{
  return MEMORY[0x24BECDD90]();
}

uint64_t kperf_ns_to_ticks()
{
  return MEMORY[0x24BECDDD8]();
}

uint64_t kperf_sample_get()
{
  return MEMORY[0x24BECDDE8]();
}

uint64_t kperf_sample_off()
{
  return MEMORY[0x24BECDDF0]();
}

uint64_t kperf_sample_on()
{
  return MEMORY[0x24BECDDF8]();
}

uint64_t kperf_timer_action_get()
{
  return MEMORY[0x24BECDE00]();
}

uint64_t kperf_timer_action_set()
{
  return MEMORY[0x24BECDE08]();
}

uint64_t kperf_timer_count_get()
{
  return MEMORY[0x24BECDE10]();
}

uint64_t kperf_timer_count_set()
{
  return MEMORY[0x24BECDE18]();
}

uint64_t kperf_timer_period_set()
{
  return MEMORY[0x24BECDE20]();
}

uint64_t ktrace_events_range()
{
  return MEMORY[0x24BECDF98]();
}

uint64_t ktrace_events_single()
{
  return MEMORY[0x24BECDFA0]();
}

uint64_t ktrace_file_append_chunk()
{
  return MEMORY[0x24BECDFA8]();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

