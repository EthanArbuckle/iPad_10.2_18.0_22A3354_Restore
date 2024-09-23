void sub_2295CD294(CGPathRef path)
{
  uint64_t v1;
  void *v2;
  CGMutablePathRef MutableCopy;
  void *v4;
  id v5;

  v2 = *(void **)(v1 + 32);
  if (v2)
  {
    v5 = v2;
    sub_2295E16D8();

  }
  else
  {
    MutableCopy = CGPathCreateMutableCopy(path);
    v4 = *(void **)(v1 + 32);
    *(_QWORD *)(v1 + 32) = MutableCopy;

  }
}

void sub_2295CD304(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  CGMutablePathRef v3;
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
  CGMutablePathRef Mutable;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  double v36;
  uint64_t v37;
  uint64_t v38;
  CGMutablePathRef v40;
  uint64_t v41;

  v5 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55510);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2();
  v10 = v9 - v8;
  v11 = type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2();
  v15 = v14 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55518);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_2();
  v19 = v18 - v17;
  Mutable = CGPathCreateMutable();
  v21 = *a1;
  v22 = *(_QWORD *)(v21 + 16);
  if (!v22)
  {

    return;
  }
  v40 = Mutable;
  v37 = v15;
  v38 = v2;
  sub_2295CD748(v21, v19);
  if (__swift_getEnumTagSinglePayload(v19, 1, v5) == 1)
  {
    __break(1u);
  }
  else
  {
    sub_2295CDFB0(v19, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
    sub_2295E16E4();
    sub_2295CD7B8(1, v21);
    v26 = (v25 >> 1) - v24;
    if (v25 >> 1 == v24)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      if ((uint64_t)(v25 >> 1) <= v24)
      {
        __break(1u);
LABEL_24:
        OUTLINED_FUNCTION_3();
LABEL_21:
        sub_2295E16A8();
        sub_2295E1690();

        sub_2295CDFB0(v26, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
        *(_QWORD *)(v21 + 80) = v41;
        swift_bridgeObjectRelease();
        return;
      }
      v27 = v23;
      v28 = v24;
      v29 = *(_QWORD *)(v6 + 72);
      swift_bridgeObjectRetain();
      v30 = v27 + v28 * v29;
      do
      {
        sub_2295CDEA0(v30, (uint64_t)v3);
        sub_2295E16F0();
        sub_2295CDFB0((uint64_t)v3, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
        v30 += v29;
        --v26;
      }
      while (v26);
    }
    swift_unknownObjectRelease();
    v21 = v38;
    v31 = *(void **)(v38 + 40);
    *(_QWORD *)(v38 + 40) = v40;
    v3 = v40;

    *(_QWORD *)(v38 + 48) = v22;
    *(_BYTE *)(v38 + 56) = 0;
    sub_2295CDEE4(a2, v10);
    if (__swift_getEnumTagSinglePayload(v10, 1, v11) == 1)
    {

      sub_2295CDF2C(v10);
      return;
    }
    v26 = v37;
    sub_2295CDF6C(v10, v37);
    v32 = *(_QWORD *)v37;
    if (*(_QWORD *)(*(_QWORD *)v37 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A55520);
      v33 = swift_allocObject();
      *(_OWORD *)(v33 + 16) = xmmword_2295E2040;
      sub_2295CDFEC(0, (unint64_t *)&unk_255A55EB0);
      *(_QWORD *)(v33 + 32) = sub_2295E17B0();
      v41 = v33;
      sub_2295E1690();
      v34 = *(_QWORD *)(v32 + 16);
      if (v34)
      {
        swift_bridgeObjectRetain();
        for (i = 0; i != v34; ++i)
        {
          v36 = *(double *)(v32 + 8 * i + 32);
          if (v36 > -1.0)
          {
            objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v36);
            MEMORY[0x22E2CC520]();
            if (*(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              OUTLINED_FUNCTION_3();
            sub_2295E16A8();
            sub_2295E1690();
          }
        }
        swift_bridgeObjectRelease();
        v26 = v37;
        v21 = v38;
      }
      sub_2295E17B0();
      MEMORY[0x22E2CC520]();
      if (*(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        goto LABEL_21;
      goto LABEL_24;
    }
    sub_2295CDFB0(v37, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);

  }
}

uint64_t sub_2295CD748@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  v6 = v5;
  if (v4)
  {
    v7 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
    sub_2295CDEA0(a1 + ((v7 + 32) & ~v7), a2);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v8, 1, v6);
}

uint64_t sub_2295CD7B8(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;

  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(a2 + 16);
  result = sub_2295CE0B4(0, result, v3);
  if ((v4 & 1) != 0)
    v5 = v3;
  else
    v5 = result;
  if (v3 < v5)
    goto LABEL_9;
  if ((v5 & 0x8000000000000000) == 0)
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
    return a2;
  }
LABEL_10:
  __break(1u);
  return result;
}

double sub_2295CD844()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  if (*(_BYTE *)(v0 + 56))
    v3 = 1;
  else
    v3 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  v4 = sub_2295E037C(v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4 / *(double *)(v0 + 96);
}

uint64_t sub_2295CD8AC()
{
  uint64_t v0;
  double v1;
  double v2;
  uint64_t result;

  if (*(_QWORD *)(v0 + 120) == 1)
    return 200;
  v1 = *(double *)(v0 + 112);
  if (v1 <= -1.0)
    return 200;
  v2 = v1 * 1000.0;
  if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) != 0)
  {
    if (v2 > -9.22337204e18)
    {
      if (v2 < 9.22337204e18)
        return (uint64_t)v2;
      goto LABEL_10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_2295CD920()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2295CE10C(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
  return v0;
}

uint64_t sub_2295CD968()
{
  sub_2295CD920();
  return swift_deallocClassInstance();
}

uint64_t sub_2295CD988()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;

  v1 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  v2 = objc_msgSend(v1, sel_CGColor);

  *(_QWORD *)(v0 + 16) = v2;
  sub_2295D8C7C();
  *(_QWORD *)(v0 + 24) = v3;
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  *(_BYTE *)(v0 + 56) = 1;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0;
  *(_QWORD *)(v0 + 80) = 0;
  *(_QWORD *)(v0 + 88) = 200;
  *(_QWORD *)(v0 + 96) = 0x3FF0000000000000;
  *(_QWORD *)(v0 + 104) = 0;
  *(_QWORD *)(v0 + 112) = 0;
  *(_QWORD *)(v0 + 120) = 1;
  return v0;
}

float variable initialization expression of _ProtoStrokeAnimationRepresentation.Point.x()
{
  return 0.0;
}

float variable initialization expression of _ProtoStrokeAnimationRepresentation.Point.y()
{
  return 0.0;
}

uint64_t variable initialization expression of _ProtoStrokeAnimationRepresentation.AnimationPoints.points()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.value()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of _ProtoStrokeAnimationRepresentation.Color.rgb()
{
  return 0;
}

double variable initialization expression of _ProtoStrokeAnimationRepresentation.Color.alpha()
{
  return 0.0;
}

uint64_t variable initialization expression of _ProtoStrokeAnimationRepresentation.Color.name()
{
  return 0;
}

uint64_t variable initialization expression of _ProtoStrokeAnimationRepresentation._storage()
{
  if (qword_255A55228 != -1)
    swift_once();
  return swift_retain();
}

id variable initialization expression of StrokeView.backgroundView()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
}

id variable initialization expression of StrokeView.backgroundImageView()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_init);
}

id variable initialization expression of StrokeView.strokeData()
{
  id v0;

  v0 = objc_allocWithZone((Class)type metadata accessor for StrokeData());
  return StrokeData.init(characters:strokeAnimationRepresention:strokeNames:pronunciations:)();
}

uint64_t variable initialization expression of StrokeView.isAnimating()
{
  return 0;
}

uint64_t variable initialization expression of StrokeView.backgroundImageUrl()
{
  return 0;
}

uint64_t variable initialization expression of StrokeView.queue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = sub_2295E1720();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2();
  v4 = v3 - v2;
  sub_2295E1708();
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_5();
  sub_2295E15A0();
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2();
  sub_2295CDFEC(0, (unint64_t *)&unk_255A552B0);
  sub_2295E1594();
  sub_2295CDCF4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A552C0);
  sub_2295CDD74();
  sub_2295E1804();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BEE5750], v0);
  return sub_2295E1744();
}

unint64_t sub_2295CDCF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A55E70;
  if (!qword_255A55E70)
  {
    v1 = sub_2295E1708();
    result = MEMORY[0x22E2CCC34](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_255A55E70);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2CCC1C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2295CDD74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A55E80;
  if (!qword_255A55E80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255A552C0);
    result = MEMORY[0x22E2CCC34](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255A55E80);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2CCC28](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of StrokeView.timers()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t type metadata accessor for StrokePathInfo()
{
  return objc_opt_self();
}

void type metadata accessor for CGPath(uint64_t a1)
{
  sub_2295CE23C(a1, qword_255A554C8);
}

void type metadata accessor for CGMutablePath(uint64_t a1)
{
  sub_2295CE23C(a1, &qword_255A55500);
}

uint64_t sub_2295CDE50(uint64_t a1)
{
  uint64_t v2;

  type metadata accessor for CGPath(255);
  *(_QWORD *)(a1 + 16) = v2;
  return 0;
}

void type metadata accessor for CGColor(uint64_t a1)
{
  sub_2295CE23C(a1, &qword_255A55508);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_2295CDEA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2295CDEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55510);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2295CDF2C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55510);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2295CDF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2295CDFB0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2295CDFEC(uint64_t a1, unint64_t *a2)
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

void sub_2295CE024(_DWORD *a1@<X8>)
{
  unsigned int *v1;

  *a1 = nullsub_1(*v1);
  OUTLINED_FUNCTION_4();
}

void sub_2295CE048(_DWORD *a1@<X8>)
{
  unsigned int *v1;

  *a1 = nullsub_2(*v1);
  OUTLINED_FUNCTION_4();
}

void sub_2295CE06C(_DWORD *a1@<X8>)
{
  unsigned int *v1;

  *a1 = nullsub_3(*v1);
  OUTLINED_FUNCTION_4();
}

void sub_2295CE090(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = nullsub_23(*v1);
  OUTLINED_FUNCTION_4();
}

uint64_t sub_2295CE0B4(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v5;

  v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2)
      return 0;
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  v5 = __OFADD__(result, a2);
  result += a2;
  if (v5)
    goto LABEL_14;
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2295CE10C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_2295CE120(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_2295CE168(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2295CE188(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
  sub_2295CE23C(a1, &qword_255A55530);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2295CE1E0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2295CE200(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_2295CE23C(a1, &qword_255A55538);
}

void sub_2295CE23C(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return sub_2295E169C();
}

double _ProtoStrokeAnimationRepresentation.Point.toCGPoint(by:)(double a1)
{
  float *v1;

  return *v1 * a1;
}

uint64_t _ProtoStrokeAnimationRepresentation.strokeAnimationRepresentation(from:)@<X0>(uint64_t a1@<X8>)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v5;

  sub_2295E13CC();
  MEMORY[0x24BDAC7A8]();
  sub_2295E1378();
  if (v2 >> 60 == 15)
  {
    v3 = type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v3);
  }
  else
  {
    v5 = type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
    sub_2295E13C0();
    sub_2295CE434();
    sub_2295E1480();
    return __swift_storeEnumTagSinglePayload(a1, 0, 1, v5);
  }
}

unint64_t sub_2295CE434()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A56060;
  if (!qword_255A56060)
  {
    v1 = type metadata accessor for _ProtoStrokeAnimationRepresentation(255);
    result = MEMORY[0x22E2CCC34](&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation, v1);
    atomic_store(result, (unint64_t *)&qword_255A56060);
  }
  return result;
}

UIColor_optional __swiftcall _ProtoStrokeAnimationRepresentation.Color.toUIColor()()
{
  uint64_t v0;
  double v1;
  unint64_t v2;
  uint64_t v3;
  Swift::Bool v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  objc_class *v14;
  objc_class *v15;
  _QWORD v16[2];
  UIColor_optional result;

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (*(double *)(v0 + 16) == 0.0)
    v1 = 1.0;
  else
    v1 = *(double *)(v0 + 16);
  v3 = *(_QWORD *)v0;
  v2 = *(_QWORD *)(v0 + 8);
  if (sub_2295E1618() < 1 || (sub_2295E1648() & 1) == 0)
  {
    if (*(_BYTE *)(v0 + 32) == 1)
      __asm { BR              X9 }
    goto LABEL_13;
  }
  v5 = sub_2295E1624();
  swift_bridgeObjectRetain();
  v6 = sub_2295CE81C(v5, v3, v2);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_bridgeObjectRelease();
  MEMORY[0x22E2CC4CC](v6, v8, v10, v12);
  swift_bridgeObjectRelease();
  if (sub_2295E1618() != 6)
  {
    swift_bridgeObjectRelease();
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  sub_2295CE868();
  v13 = sub_2295CE8A4();
  v16[0] = 0;
  if (!objc_msgSend(v13, sel_scanHexLongLong_, v16))
  {

    goto LABEL_13;
  }
  v14 = (objc_class *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, (double)BYTE2(v16[0]) / 255.0, (double)BYTE1(v16[0]) / 255.0, (double)LOBYTE(v16[0]) / 255.0, v1);

LABEL_14:
  v15 = v14;
  result.value.super.isa = v15;
  result.is_nil = v4;
  return result;
}

unint64_t sub_2295CE81C(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return sub_2295E1654();
  __break(1u);
  return result;
}

unint64_t sub_2295CE868()
{
  unint64_t result;

  result = qword_255A55600;
  if (!qword_255A55600)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A55600);
  }
  return result;
}

id sub_2295CE8A4()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2295E15E8();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithString_, v1);

  return v2;
}

id OUTLINED_FUNCTION_0_0(id a1, SEL a2)
{
  double v2;

  return objc_msgSend(a1, a2, v2);
}

CFDataRef sub_2295CE91C(void *a1)
{
  const __CFAllocator *v1;
  id v2;
  CFDataRef result;
  CFDataRef v4;
  uint64_t v5;

  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v2 = objc_retainAutorelease(a1);
  result = CFDataCreate(v1, (const UInt8 *)objc_msgSend(v2, sel_bytes), (CFIndex)objc_msgSend(v2, sel_length));
  if (result)
  {
    v4 = result;
    v5 = CGSVGDocumentCreateFromData();

    return (CFDataRef)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

double sub_2295CE9A0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat Height;
  CGFloat tx;
  CGFloat ty;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  __int128 v19;
  __int128 v20;
  CGAffineTransform aBlock;
  CGRect v22;
  CGRect v23;

  v0 = sub_2295E154C();
  MEMORY[0x24BDAC7A8](v0);
  sub_2295E1798();
  if (qword_255A55298 != -1)
    swift_once();
  sub_2295E1540();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0();
  v1 = OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v1 + 16) = MEMORY[0x24BEE4AF8];
  v2 = (id)CGSVGDocumentGetRootNode();
  if (v2)
  {
    v3 = v2;
    CGSVGViewBoxNodeGetViewbox();
    v4 = sub_2295D8CEC();
    v22.origin.x = OUTLINED_FUNCTION_1_0();
    v5 = v4 / CGRectGetWidth(v22);
    sub_2295D8CEC();
    v7 = v6;
    v23.origin.x = OUTLINED_FUNCTION_1_0();
    Height = CGRectGetHeight(v23);
    CGAffineTransformMakeScale(&aBlock, v5, v7 / Height);
    v19 = *(_OWORD *)&aBlock.c;
    v20 = *(_OWORD *)&aBlock.a;
    tx = aBlock.tx;
    ty = aBlock.ty;
    v11 = (_QWORD *)OUTLINED_FUNCTION_2_0();
    v11[2] = 0x3FF0000000000000;
    v11[3] = 0;
    v11[4] = 0;
    v11[5] = 0x3FF0000000000000;
    v11[6] = 0;
    v11[7] = 0;
    v12 = OUTLINED_FUNCTION_2_0();
    *(_QWORD *)(v12 + 16) = v11;
    *(_OWORD *)(v12 + 24) = v20;
    *(_OWORD *)(v12 + 40) = v19;
    *(CGFloat *)(v12 + 56) = tx;
    *(CGFloat *)(v12 + 64) = ty;
    *(_QWORD *)(v12 + 72) = v1;
    *(_QWORD *)&aBlock.tx = sub_2295CF0D4;
    *(_QWORD *)&aBlock.ty = v12;
    *(_QWORD *)&aBlock.a = MEMORY[0x24BDAC760];
    *(_QWORD *)&aBlock.b = 1107296256;
    *(_QWORD *)&aBlock.c = sub_2295CEFE4;
    *(_QWORD *)&aBlock.d = &block_descriptor;
    v13 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    CGSVGNodeEnumerate();

    _Block_release(v13);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_255A55280 != -1)
      swift_once();
    v14 = sub_2295E1564();
    __swift_project_value_buffer(v14, (uint64_t)qword_255A56218);
    v15 = sub_2295E1558();
    v16 = sub_2295E16CC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2295CB000, v15, v16, "invalid svg doc", v17, 2u);
      MEMORY[0x22E2CCC94](v17, -1, -1);
    }
    swift_release();

    v5 = 1.0;
  }
  sub_2295E178C();
  sub_2295E1540();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0();
  return v5;
}

void sub_2295CED2C(uint64_t a1, int a2, uint64_t a3, _OWORD *a4, CGFloat *a5, uint64_t a6)
{
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  int Primitive;
  __int128 v19;
  id v20;
  void *v21;
  void *CGPath;
  void *v23;
  _QWORD *v24;
  const CGPath *v25;
  uint64_t v26;
  id v27;
  CGAffineTransform v28;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v8 = *a5;
    v9 = a5[1];
    v10 = a5[2];
    v11 = a5[3];
    v13 = a5[4];
    v12 = a5[5];
    if (CGSVGNodeGetType() == 1)
    {
      v14 = (id)CGSVGNodeGetAttributeMap();
      if (v14)
      {
        v27 = v14;
        v15 = (id)CGSVGAttributeMapGetAttribute();
        if (v15)
        {
          v16 = v15;
          swift_beginAccess();
          v17 = v16;
          CGSVGAttributeGetTransform();
          swift_endAccess();

        }
      }
    }
    else if (CGSVGNodeGetType() == 2)
    {
      Primitive = CGSVGShapeNodeGetPrimitive();
      swift_beginAccess();
      v19 = a4[2];
      *(_OWORD *)&t1.a = a4[1];
      *(_OWORD *)&t1.c = v19;
      *(_OWORD *)&t1.tx = a4[3];
      t2.a = v8;
      t2.b = v9;
      t2.c = v10;
      t2.d = v11;
      t2.tx = v13;
      t2.ty = v12;
      CGAffineTransformConcat(&v28, &t1, &t2);
      v31 = v28;
      if (Primitive == 42)
      {
        v20 = (id)CGSVGShapeNodeGetPath();
        if (v20)
        {
          v21 = v20;
          CGPath = (void *)CGSVGPathCreateCGPath();
          v23 = (void *)MEMORY[0x22E2CC7B4](CGPath, &v31);
          type metadata accessor for StrokePathInfo();
          swift_allocObject();
          sub_2295CD988();
          if (v23)
          {
            v24 = (_QWORD *)(a6 + 16);
            v25 = v23;
            sub_2295CD294(v25);

            swift_beginAccess();
            v26 = swift_retain();
            MEMORY[0x22E2CC520](v26);
            sub_2295DF3D4(*(_QWORD *)((*v24 & 0xFFFFFFFFFFFFF8) + 0x10));
            sub_2295E16A8();
            sub_2295E1690();
            swift_endAccess();
            swift_release();

          }
          else
          {
            __break(1u);
          }
        }
      }
    }
  }
}

void sub_2295CEFE4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_2295CF050()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2295CF098()
{
  return swift_deallocObject();
}

uint64_t sub_2295CF0A8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_2295CF0D4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;

  sub_2295CED2C(a1, a2, a3, *(_OWORD **)(v3 + 16), (CGFloat *)(v3 + 24), *(_QWORD *)(v3 + 72));
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

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_2295E1534();
}

double OUTLINED_FUNCTION_1_0()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

BOOL sub_2295CF134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

void _ProtoStrokeAnimationRepresentation.strokeContours.getter()
{
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23();
}

uint64_t type metadata accessor for _ProtoStrokeAnimationRepresentation(uint64_t a1)
{
  return sub_2295D2064(a1, qword_255A557B0);
}

void _ProtoStrokeAnimationRepresentation.strokeContours.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_72();
  if ((OUTLINED_FUNCTION_13() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_2();
    v3 = (_QWORD *)OUTLINED_FUNCTION_6();
    *(_QWORD *)(v1 + v2) = OUTLINED_FUNCTION_48(v3);
    OUTLINED_FUNCTION_11();
  }
  v4 = *(_QWORD *)(v1 + v2);
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v4 + 16) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_2295CF1EC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(int *)(type metadata accessor for _ProtoStrokeAnimationRepresentation(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation._StorageClass(0);
    swift_allocObject();
    v2 = (_QWORD *)swift_retain();
    *(_QWORD *)(v0 + v1) = sub_2295D18B0(v2);
    swift_release();
  }
  return swift_retain();
}

uint64_t type metadata accessor for _ProtoStrokeAnimationRepresentation._StorageClass(uint64_t a1)
{
  return sub_2295D2064(a1, (uint64_t *)&unk_255A55A60);
}

void _ProtoStrokeAnimationRepresentation.strokeContours.modify()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0((uint64_t)v2);
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v1 + 72) = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12();
}

void sub_2295CF2C4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_17();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_27();
    if ((OUTLINED_FUNCTION_25() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_2();
      v3 = (_QWORD *)OUTLINED_FUNCTION_5_0();
      v4 = OUTLINED_FUNCTION_19(v3);
      OUTLINED_FUNCTION_7((uint64_t)v4);
    }
    v5 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_1_1();
    *(_QWORD *)(v5 + 16) = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((OUTLINED_FUNCTION_25() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_2();
      v6 = (_QWORD *)OUTLINED_FUNCTION_5_0();
      v7 = OUTLINED_FUNCTION_19(v6);
      OUTLINED_FUNCTION_7((uint64_t)v7);
    }
    v8 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_1_1();
    *(_QWORD *)(v8 + 16) = v1;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_1((void *)v0);
}

void _ProtoStrokeAnimationRepresentation.animationPoints.getter()
{
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23();
}

void _ProtoStrokeAnimationRepresentation.animationPoints.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_72();
  if ((OUTLINED_FUNCTION_13() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_2();
    v3 = (_QWORD *)OUTLINED_FUNCTION_6();
    *(_QWORD *)(v1 + v2) = OUTLINED_FUNCTION_48(v3);
    OUTLINED_FUNCTION_11();
  }
  v4 = *(_QWORD *)(v1 + v2);
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v4 + 24) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
}

void _ProtoStrokeAnimationRepresentation.animationPoints.modify()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0((uint64_t)v2);
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v1 + 72) = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12();
}

void sub_2295CF474()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_17();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_27();
    if ((OUTLINED_FUNCTION_25() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_2();
      v3 = (_QWORD *)OUTLINED_FUNCTION_5_0();
      v4 = OUTLINED_FUNCTION_19(v3);
      OUTLINED_FUNCTION_7((uint64_t)v4);
    }
    v5 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_1_1();
    *(_QWORD *)(v5 + 24) = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((OUTLINED_FUNCTION_25() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_2();
      v6 = (_QWORD *)OUTLINED_FUNCTION_5_0();
      v7 = OUTLINED_FUNCTION_19(v6);
      OUTLINED_FUNCTION_7((uint64_t)v7);
    }
    v8 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_1_1();
    *(_QWORD *)(v8 + 24) = v1;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_1((void *)v0);
}

void _ProtoStrokeAnimationRepresentation.strokeFeatures.getter()
{
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23();
}

void _ProtoStrokeAnimationRepresentation.strokeFeatures.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_72();
  if ((OUTLINED_FUNCTION_13() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_2();
    v3 = (_QWORD *)OUTLINED_FUNCTION_6();
    *(_QWORD *)(v1 + v2) = OUTLINED_FUNCTION_48(v3);
    OUTLINED_FUNCTION_11();
  }
  v4 = *(_QWORD *)(v1 + v2);
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v4 + 32) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
}

void _ProtoStrokeAnimationRepresentation.strokeFeatures.modify()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0((uint64_t)v2);
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v1 + 72) = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12();
}

void sub_2295CF624()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_17();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_27();
    if ((OUTLINED_FUNCTION_25() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_2();
      v3 = (_QWORD *)OUTLINED_FUNCTION_5_0();
      v4 = OUTLINED_FUNCTION_19(v3);
      OUTLINED_FUNCTION_7((uint64_t)v4);
    }
    v5 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_1_1();
    *(_QWORD *)(v5 + 32) = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((OUTLINED_FUNCTION_25() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_2();
      v6 = (_QWORD *)OUTLINED_FUNCTION_5_0();
      v7 = OUTLINED_FUNCTION_19(v6);
      OUTLINED_FUNCTION_7((uint64_t)v7);
    }
    v8 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_1_1();
    *(_QWORD *)(v8 + 32) = v1;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_1((void *)v0);
}

double _ProtoStrokeAnimationRepresentation.speedRate.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_1_1();
  return *(double *)(v0 + 40);
}

uint64_t _ProtoStrokeAnimationRepresentation.speedRate.setter(double a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;

  v3 = *(int *)(OUTLINED_FUNCTION_98() + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_2();
    v4 = (_QWORD *)OUTLINED_FUNCTION_6();
    *(_QWORD *)(v1 + v3) = sub_2295D18B0(v4);
    OUTLINED_FUNCTION_11();
  }
  v5 = *(_QWORD *)(v1 + v3);
  result = OUTLINED_FUNCTION_1_1();
  *(double *)(v5 + 40) = a1;
  return result;
}

void _ProtoStrokeAnimationRepresentation.speedRate.modify()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0((uint64_t)v2);
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v1 + 72) = *(_QWORD *)(v0 + 40);
  OUTLINED_FUNCTION_12();
}

void sub_2295CF7F8(uint64_t *a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v3 = *a1;
  v4 = *(_QWORD *)(*a1 + 72);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if ((a2 & 1) == 0)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    v6 = *(int *)(v3 + 88);
    v7 = *(_QWORD *)(v3 + 80);
    OUTLINED_FUNCTION_0_2();
    v8 = (_QWORD *)OUTLINED_FUNCTION_6();
    *(_QWORD *)(v7 + v6) = OUTLINED_FUNCTION_48(v8);
    OUTLINED_FUNCTION_11();
  }
LABEL_4:
  v9 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 80) + *(int *)(v3 + 88)) + 40);
  OUTLINED_FUNCTION_1_1();
  *v9 = v4;
  free((void *)v3);
}

void _ProtoStrokeAnimationRepresentation.strokeWidth.getter()
{
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23();
}

void _ProtoStrokeAnimationRepresentation.strokeWidth.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_72();
  if ((OUTLINED_FUNCTION_13() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_2();
    v3 = (_QWORD *)OUTLINED_FUNCTION_6();
    *(_QWORD *)(v1 + v2) = OUTLINED_FUNCTION_48(v3);
    OUTLINED_FUNCTION_11();
  }
  v4 = *(_QWORD *)(v1 + v2);
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v4 + 48) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
}

void _ProtoStrokeAnimationRepresentation.strokeWidth.modify()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0((uint64_t)v2);
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v1 + 72) = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12();
}

void sub_2295CF990()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_17();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_27();
    if ((OUTLINED_FUNCTION_25() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_2();
      v3 = (_QWORD *)OUTLINED_FUNCTION_5_0();
      v4 = OUTLINED_FUNCTION_19(v3);
      OUTLINED_FUNCTION_7((uint64_t)v4);
    }
    v5 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_1_1();
    *(_QWORD *)(v5 + 48) = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((OUTLINED_FUNCTION_25() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_2();
      v6 = (_QWORD *)OUTLINED_FUNCTION_5_0();
      v7 = OUTLINED_FUNCTION_19(v6);
      OUTLINED_FUNCTION_7((uint64_t)v7);
    }
    v8 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_1_1();
    *(_QWORD *)(v8 + 48) = v1;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_1((void *)v0);
}

void _ProtoStrokeAnimationRepresentation.animationControlValues.getter()
{
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23();
}

void _ProtoStrokeAnimationRepresentation.animationControlValues.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_72();
  if ((OUTLINED_FUNCTION_13() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_2();
    v3 = (_QWORD *)OUTLINED_FUNCTION_6();
    *(_QWORD *)(v1 + v2) = OUTLINED_FUNCTION_48(v3);
    OUTLINED_FUNCTION_11();
  }
  v4 = *(_QWORD *)(v1 + v2);
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v4 + 56) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
}

void _ProtoStrokeAnimationRepresentation.animationControlValues.modify()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0((uint64_t)v2);
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v1 + 72) = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12();
}

void sub_2295CFB40()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_17();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_27();
    if ((OUTLINED_FUNCTION_25() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_2();
      v3 = (_QWORD *)OUTLINED_FUNCTION_5_0();
      v4 = OUTLINED_FUNCTION_19(v3);
      OUTLINED_FUNCTION_7((uint64_t)v4);
    }
    v5 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_1_1();
    *(_QWORD *)(v5 + 56) = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((OUTLINED_FUNCTION_25() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_2();
      v6 = (_QWORD *)OUTLINED_FUNCTION_5_0();
      v7 = OUTLINED_FUNCTION_19(v6);
      OUTLINED_FUNCTION_7((uint64_t)v7);
    }
    v8 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_1_1();
    *(_QWORD *)(v8 + 56) = v1;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_1((void *)v0);
}

void _ProtoStrokeAnimationRepresentation.contourColor.getter(uint64_t a1@<X8>)
{
  sub_2295CFD2C(&OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor, a1);
}

void _ProtoStrokeAnimationRepresentation.Color.init()(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_40();
}

uint64_t _ProtoStrokeAnimationRepresentation.contourColor.setter()
{
  return sub_2295CFE18();
}

void _ProtoStrokeAnimationRepresentation.contourColor.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_65((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  v3 = OUTLINED_FUNCTION_53(v2);
  *(_QWORD *)(v0 + 40) = OUTLINED_FUNCTION_20((uint64_t)v3);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_37();
  if (v4)
  {
    v5 = OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_85(v5, &qword_255A55610);
  }
  else
  {
    OUTLINED_FUNCTION_55();
  }
  OUTLINED_FUNCTION_41();
}

void sub_2295CFCFC()
{
  sub_2295D04E8();
}

void _ProtoStrokeAnimationRepresentation.hasContourColor.getter()
{
  sub_2295CFFE0((uint64_t)&OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor);
}

Swift::Void __swiftcall _ProtoStrokeAnimationRepresentation.clearContourColor()()
{
  sub_2295D009C();
}

void _ProtoStrokeAnimationRepresentation.backgroundColor.getter(uint64_t a1@<X8>)
{
  sub_2295CFD2C(&OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor, a1);
}

void sub_2295CFD2C(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  OUTLINED_FUNCTION_47();
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_32();
  v7 = v6 + *a1;
  OUTLINED_FUNCTION_1_1();
  sub_2295D1EF8(v7, (uint64_t)v5);
  v8 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v8) == 1)
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0xE000000000000000;
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a2 + 24) = 0;
    *(_BYTE *)(a2 + 32) = 1;
    OUTLINED_FUNCTION_69();
    sub_2295D7D18((uint64_t)v5, &qword_255A55610);
  }
  else
  {
    sub_2295D1F54((uint64_t)v5, a2);
  }
  OUTLINED_FUNCTION_35();
}

uint64_t _ProtoStrokeAnimationRepresentation.backgroundColor.setter()
{
  return sub_2295CFE18();
}

uint64_t sub_2295CFE18()
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
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_34();
  v13 = v2;
  v14 = v3;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  OUTLINED_FUNCTION_47();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v12 - v6;
  v8 = *(int *)(OUTLINED_FUNCTION_98() + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_2();
    v9 = (_QWORD *)OUTLINED_FUNCTION_6();
    *(_QWORD *)(v1 + v8) = sub_2295D18B0(v9);
    OUTLINED_FUNCTION_11();
  }
  sub_2295D1F54(v5, (uint64_t)v7);
  v10 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v10);
  sub_2295D1F98((uint64_t)v7, v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_86();
  swift_endAccess();
  return swift_release();
}

void _ProtoStrokeAnimationRepresentation.backgroundColor.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_65((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  v3 = OUTLINED_FUNCTION_53(v2);
  *(_QWORD *)(v0 + 40) = OUTLINED_FUNCTION_20((uint64_t)v3);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_37();
  if (v4)
  {
    v5 = OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_85(v5, &qword_255A55610);
  }
  else
  {
    OUTLINED_FUNCTION_55();
  }
  OUTLINED_FUNCTION_41();
}

void sub_2295CFFC8()
{
  sub_2295D04E8();
}

void _ProtoStrokeAnimationRepresentation.hasBackgroundColor.getter()
{
  sub_2295CFFE0((uint64_t)&OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor);
}

void sub_2295CFFE0(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  OUTLINED_FUNCTION_47();
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_1_1();
  sub_2295D1EF8(a1, (uint64_t)v3);
  v4 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  __swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4);
  sub_2295D7D18((uint64_t)v3, &qword_255A55610);
  OUTLINED_FUNCTION_39();
}

Swift::Void __swiftcall _ProtoStrokeAnimationRepresentation.clearBackgroundColor()()
{
  sub_2295D009C();
}

void sub_2295D009C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  OUTLINED_FUNCTION_47();
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((OUTLINED_FUNCTION_44() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_2();
    v4 = (_QWORD *)OUTLINED_FUNCTION_5_0();
    *(_QWORD *)(v0 + v1) = OUTLINED_FUNCTION_19(v4);
    OUTLINED_FUNCTION_11();
  }
  v5 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v5);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_86();
  swift_endAccess();
  swift_release();
  OUTLINED_FUNCTION_73();
}

void _ProtoStrokeAnimationRepresentation.compoundAnimationEffects.getter()
{
  sub_2295D01EC();
}

void _ProtoStrokeAnimationRepresentation.compoundAnimationEffects.setter()
{
  sub_2295D0238();
}

void _ProtoStrokeAnimationRepresentation.compoundAnimationEffects.modify()
{
  void *v0;

  v0 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9((uint64_t)v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_70();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12();
}

void sub_2295D01D4()
{
  sub_2295D0308();
}

void _ProtoStrokeAnimationRepresentation.animationDelays.getter()
{
  sub_2295D01EC();
}

void sub_2295D01EC()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23();
}

void _ProtoStrokeAnimationRepresentation.animationDelays.setter()
{
  sub_2295D0238();
}

void sub_2295D0238()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  OUTLINED_FUNCTION_72();
  v3 = v2;
  v5 = v4;
  if ((OUTLINED_FUNCTION_44() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_2();
    v6 = (_QWORD *)OUTLINED_FUNCTION_5_0();
    *(_QWORD *)(v0 + v1) = OUTLINED_FUNCTION_19(v6);
    OUTLINED_FUNCTION_11();
  }
  v7 = (_QWORD *)(*(_QWORD *)(v0 + v1) + *v3);
  OUTLINED_FUNCTION_1_1();
  *v7 = v5;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
}

void _ProtoStrokeAnimationRepresentation.animationDelays.modify()
{
  void *v0;

  v0 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9((uint64_t)v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_70();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12();
}

void sub_2295D02FC()
{
  sub_2295D0308();
}

void sub_2295D0308()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  OUTLINED_FUNCTION_34();
  v1 = v0;
  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 72);
  if ((v5 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v6 = *(int *)(v3 + 88);
      v7 = *(_QWORD *)(v3 + 80);
      OUTLINED_FUNCTION_0_2();
      v8 = (_QWORD *)OUTLINED_FUNCTION_6();
      *(_QWORD *)(v7 + v6) = sub_2295D18B0(v8);
      OUTLINED_FUNCTION_11();
    }
    v9 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 80) + *(int *)(v3 + 88)) + *v1);
    OUTLINED_FUNCTION_1_1();
    *v9 = v4;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v10 = *(int *)(v3 + 88);
      v11 = *(_QWORD *)(v3 + 80);
      OUTLINED_FUNCTION_0_2();
      v12 = (_QWORD *)OUTLINED_FUNCTION_6();
      *(_QWORD *)(v11 + v10) = sub_2295D18B0(v12);
      OUTLINED_FUNCTION_11();
    }
    v13 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 80) + *(int *)(v3 + 88)) + *v1);
    OUTLINED_FUNCTION_1_1();
    *v13 = v4;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_1((void *)v3);
}

void _ProtoStrokeAnimationRepresentation.strokeColor.getter(uint64_t a1@<X8>)
{
  sub_2295CFD2C(&OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor, a1);
}

uint64_t _ProtoStrokeAnimationRepresentation.strokeColor.setter()
{
  return sub_2295CFE18();
}

void _ProtoStrokeAnimationRepresentation.strokeColor.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_65((uint64_t)v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  v3 = OUTLINED_FUNCTION_53(v2);
  *(_QWORD *)(v0 + 40) = OUTLINED_FUNCTION_20((uint64_t)v3);
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_37();
  if (v4)
  {
    v5 = OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_85(v5, &qword_255A55610);
  }
  else
  {
    OUTLINED_FUNCTION_55();
  }
  OUTLINED_FUNCTION_41();
}

void sub_2295D04DC()
{
  sub_2295D04E8();
}

void sub_2295D04E8()
{
  uint64_t v0;
  void (*v1)(void *);
  void (*v2)(void *);
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_34();
  v2 = v1;
  v3 = *(void **)v0;
  v4 = *(void **)(*(_QWORD *)v0 + 40);
  v5 = *(void **)(*(_QWORD *)v0 + 48);
  v6 = *(void **)(*(_QWORD *)v0 + 32);
  if ((v7 & 1) != 0)
  {
    v8 = OUTLINED_FUNCTION_82();
    sub_2295D7684(v8, v9, (void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
    v2(v4);
    sub_2295D76B8((uint64_t)v5, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
  }
  else
  {
    v1(*(void **)(*(_QWORD *)v0 + 48));
  }
  free(v5);
  free(v4);
  free(v6);
  OUTLINED_FUNCTION_2_1(v3);
}

void _ProtoStrokeAnimationRepresentation.hasStrokeColor.getter()
{
  sub_2295CFFE0((uint64_t)&OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor);
}

Swift::Void __swiftcall _ProtoStrokeAnimationRepresentation.clearStrokeColor()()
{
  sub_2295D009C();
}

uint64_t _ProtoStrokeAnimationRepresentation.backgroundURL.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_32();
  v1 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
  OUTLINED_FUNCTION_1_1();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

void _ProtoStrokeAnimationRepresentation.backgroundURL.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  OUTLINED_FUNCTION_72();
  v3 = v2;
  v5 = v4;
  if ((OUTLINED_FUNCTION_44() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_2();
    v6 = (_QWORD *)OUTLINED_FUNCTION_5_0();
    *(_QWORD *)(v0 + v1) = OUTLINED_FUNCTION_19(v6);
    OUTLINED_FUNCTION_11();
  }
  v7 = (_QWORD *)(*(_QWORD *)(v0 + v1)
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
  OUTLINED_FUNCTION_1_1();
  *v7 = v5;
  v7[1] = v3;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
}

void _ProtoStrokeAnimationRepresentation.backgroundURL.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[11] = v1;
  v4 = *(int *)(type metadata accessor for _ProtoStrokeAnimationRepresentation(0) + 20);
  *((_DWORD *)v3 + 24) = v4;
  v5 = (_QWORD *)(*(_QWORD *)(v1 + v4)
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
  OUTLINED_FUNCTION_1_1();
  v6 = v5[1];
  v3[9] = *v5;
  v3[10] = v6;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12();
}

void sub_2295D06C4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  OUTLINED_FUNCTION_34();
  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 72);
  v3 = *(_QWORD *)(*v0 + 80);
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_27();
    if ((OUTLINED_FUNCTION_25() & 1) == 0)
    {
      v5 = *(int *)(v1 + 96);
      v6 = *(_QWORD *)(v1 + 88);
      OUTLINED_FUNCTION_0_2();
      v7 = (_QWORD *)OUTLINED_FUNCTION_5_0();
      *(_QWORD *)(v6 + v5) = OUTLINED_FUNCTION_19(v7);
      OUTLINED_FUNCTION_11();
    }
    v8 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + *(int *)(v1 + 96))
                  + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
    OUTLINED_FUNCTION_1_1();
    *v8 = v2;
    v8[1] = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((OUTLINED_FUNCTION_25() & 1) == 0)
    {
      v9 = *(int *)(v1 + 96);
      v10 = *(_QWORD *)(v1 + 88);
      OUTLINED_FUNCTION_0_2();
      v11 = (_QWORD *)OUTLINED_FUNCTION_5_0();
      *(_QWORD *)(v10 + v9) = OUTLINED_FUNCTION_19(v11);
      OUTLINED_FUNCTION_11();
    }
    v12 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + *(int *)(v1 + 96))
                   + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
    OUTLINED_FUNCTION_1_1();
    *v12 = v2;
    v12[1] = v3;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_1((void *)v1);
}

void _ProtoStrokeAnimationRepresentation.customEaseInValues.getter()
{
  sub_2295D01EC();
}

void _ProtoStrokeAnimationRepresentation.customEaseInValues.setter()
{
  sub_2295D0238();
}

void _ProtoStrokeAnimationRepresentation.customEaseInValues.modify()
{
  void *v0;

  v0 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9((uint64_t)v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_70();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12();
}

void sub_2295D0834()
{
  sub_2295D0308();
}

void _ProtoStrokeAnimationRepresentation.customEaseOutValues.getter()
{
  sub_2295D01EC();
}

void _ProtoStrokeAnimationRepresentation.customEaseOutValues.setter()
{
  sub_2295D0238();
}

void _ProtoStrokeAnimationRepresentation.customEaseOutValues.modify()
{
  void *v0;

  v0 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9((uint64_t)v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_70();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12();
}

void sub_2295D08A8()
{
  sub_2295D0308();
}

void _ProtoStrokeAnimationRepresentation.customEaseInOutValues.getter()
{
  sub_2295D01EC();
}

void _ProtoStrokeAnimationRepresentation.customEaseInOutValues.setter()
{
  sub_2295D0238();
}

void _ProtoStrokeAnimationRepresentation.customEaseInOutValues.modify()
{
  void *v0;

  v0 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9((uint64_t)v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_70();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12();
}

void sub_2295D091C()
{
  sub_2295D0308();
}

uint64_t _ProtoStrokeAnimationRepresentation.unknownFields.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8();
  v0 = OUTLINED_FUNCTION_16();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

uint64_t _ProtoStrokeAnimationRepresentation.unknownFields.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8();
  v0 = OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

uint64_t (*_ProtoStrokeAnimationRepresentation.unknownFields.modify())()
{
  return nullsub_4;
}

void _ProtoStrokeAnimationRepresentation.AnimationEffect.init(rawValue:)()
{
  OUTLINED_FUNCTION_78();
}

void sub_2295D0990(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

void sub_2295D09A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2295D0F0C(a1, a2, a3, (uint64_t (*)(void))_ProtoStrokeAnimationRepresentation.AnimationEffect.init(rawValue:));
}

uint64_t sub_2295D09AC()
{
  uint64_t v0;

  return _ProtoStrokeAnimationRepresentation.AnimationEffect.rawValue.getter(*(_QWORD *)v0, *(unsigned __int8 *)(v0 + 8));
}

void sub_2295D09B8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  sub_2295D0F38(a1, a2, a3, (uint64_t (*)(_QWORD))_ProtoStrokeAnimationRepresentation.AnimationEffect.init(rawValue:));
}

uint64_t sub_2295D09C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = _ProtoStrokeAnimationRepresentation.AnimationEffect.rawValue.getter(*(_QWORD *)v1, *(unsigned __int8 *)(v1 + 8));
  *a1 = result;
  return result;
}

void sub_2295D09F0()
{
  uint64_t v0;

  sub_2295D0A1C(*(_QWORD *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_2295D6060);
}

void sub_2295D0A1C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_99();
  a3(v4);
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_94();
}

uint64_t sub_2295D0A5C()
{
  sub_2295D7608();
  return sub_2295E13F0();
}

void sub_2295D0A94(uint64_t a1)
{
  uint64_t v1;

  sub_2295D0AC0(a1, *(_QWORD *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_2295D6060);
}

void sub_2295D0AC0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;

  v5 = sub_2295E18B8();
  a4(v5);
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_94();
}

BOOL sub_2295D0B04(uint64_t a1, uint64_t *a2)
{
  return sub_2295CF134(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

float _ProtoStrokeAnimationRepresentation.Point.x.getter()
{
  uint64_t v0;

  return *(float *)v0;
}

void _ProtoStrokeAnimationRepresentation.Point.x.setter(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Point.x.modify())()
{
  return nullsub_5;
}

float _ProtoStrokeAnimationRepresentation.Point.y.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 4);
}

void _ProtoStrokeAnimationRepresentation.Point.y.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 4) = a1;
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Point.y.modify())()
{
  return nullsub_6;
}

uint64_t _ProtoStrokeAnimationRepresentation.Point.unknownFields.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  OUTLINED_FUNCTION_8();
  v0 = OUTLINED_FUNCTION_16();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

uint64_t _ProtoStrokeAnimationRepresentation.Point.unknownFields.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  OUTLINED_FUNCTION_8();
  v0 = OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Point.unknownFields.modify())()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  return nullsub_7;
}

void _ProtoStrokeAnimationRepresentation.Point.init()(_QWORD *a1@<X8>)
{
  *a1 = 0;
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_40();
}

uint64_t (*_ProtoStrokeAnimationRepresentation.AnimationPoints.points.modify())()
{
  return nullsub_8;
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationPoints.unknownFields.getter()
{
  return sub_2295D0CD0((void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationPoints.unknownFields.setter(uint64_t a1)
{
  return sub_2295D0D10(a1, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
}

uint64_t (*_ProtoStrokeAnimationRepresentation.AnimationPoints.unknownFields.modify())()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(0);
  return nullsub_9;
}

void _ProtoStrokeAnimationRepresentation.AnimationPoints.init()(_QWORD *a1@<X8>)
{
  sub_2295D0D70((void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, a1);
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.value.getter()
{
  return swift_bridgeObjectRetain();
}

void _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.value.setter(uint64_t a1)
{
  _QWORD *v1;

  swift_bridgeObjectRelease();
  *v1 = a1;
  OUTLINED_FUNCTION_40();
}

uint64_t (*_ProtoStrokeAnimationRepresentation.StrokeKeyTimes.value.modify())()
{
  return nullsub_10;
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.unknownFields.getter()
{
  return sub_2295D0CD0((void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
}

uint64_t sub_2295D0CD0(void (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  a1(0);
  OUTLINED_FUNCTION_8();
  v1 = OUTLINED_FUNCTION_16();
  return OUTLINED_FUNCTION_3_1(v1, v2, v3, v4);
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.unknownFields.setter(uint64_t a1)
{
  return sub_2295D0D10(a1, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
}

uint64_t sub_2295D0D10(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_91(a1, a2);
  OUTLINED_FUNCTION_8();
  v2 = OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_3_1(v2, v3, v4, v5);
}

uint64_t (*_ProtoStrokeAnimationRepresentation.StrokeKeyTimes.unknownFields.modify())()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
  return nullsub_11;
}

void _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.init()(_QWORD *a1@<X8>)
{
  sub_2295D0D70((void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, a1);
}

void sub_2295D0D70(void (*a1)(_QWORD)@<X0>, _QWORD *a2@<X8>)
{
  *a2 = MEMORY[0x24BEE4AF8];
  a1(0);
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_40();
}

void _ProtoStrokeAnimationRepresentation.Color.rgb.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_57();
}

void _ProtoStrokeAnimationRepresentation.Color.rgb.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_35();
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Color.rgb.modify())()
{
  return nullsub_12;
}

double _ProtoStrokeAnimationRepresentation.Color.alpha.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void _ProtoStrokeAnimationRepresentation.Color.alpha.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Color.alpha.modify())()
{
  return nullsub_13;
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.name.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.name.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = result;
  *(_BYTE *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Color.name.modify())()
{
  return nullsub_14;
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.unknownFields.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  OUTLINED_FUNCTION_8();
  v0 = OUTLINED_FUNCTION_16();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.unknownFields.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  OUTLINED_FUNCTION_8();
  v0 = OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Color.unknownFields.modify())()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  return nullsub_15;
}

void _ProtoStrokeAnimationRepresentation.Color.Name.init(rawValue:)()
{
  OUTLINED_FUNCTION_78();
}

void sub_2295D0F00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2295D0F0C(a1, a2, a3, (uint64_t (*)(void))_ProtoStrokeAnimationRepresentation.Color.Name.init(rawValue:));
}

void sub_2295D0F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  __int16 v5;

  v4 = a4();
  OUTLINED_FUNCTION_87(v4, v5);
  OUTLINED_FUNCTION_40();
}

void sub_2295D0F2C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  sub_2295D0F38(a1, a2, a3, (uint64_t (*)(_QWORD))_ProtoStrokeAnimationRepresentation.Color.Name.init(rawValue:));
}

void sub_2295D0F38(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  __int16 v5;

  v4 = a4(*a1);
  OUTLINED_FUNCTION_87(v4, v5);
  OUTLINED_FUNCTION_40();
}

void sub_2295D0F5C()
{
  uint64_t v0;

  sub_2295D0A1C(*(_QWORD *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_2295D6120);
}

uint64_t sub_2295D0F88()
{
  sub_2295D6020();
  return sub_2295E13F0();
}

void sub_2295D0FC0(uint64_t a1)
{
  uint64_t v1;

  sub_2295D0AC0(a1, *(_QWORD *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_2295D6120);
}

uint64_t _ProtoStrokeAnimationRepresentation.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  v2 = *(int *)(OUTLINED_FUNCTION_98() + 20);
  if (qword_255A55228 != -1)
    swift_once();
  *(_QWORD *)(a1 + v2) = qword_255A55608;
  return swift_retain();
}

void sub_2295D1048()
{
  static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases = (uint64_t)&unk_24F256768;
}

uint64_t *_ProtoStrokeAnimationRepresentation.AnimationEffect.allCases.unsafeMutableAddressor()
{
  if (qword_255A55210 != -1)
    swift_once();
  return &static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases;
}

void static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases.getter()
{
  sub_2295D11C0();
}

void static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases.setter(uint64_t a1)
{
  sub_2295D1220(a1, &qword_255A55210, &static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases);
}

void static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases.modify()
{
  if (qword_255A55210 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_57();
}

void sub_2295D113C(_QWORD *a1@<X8>)
{
  sub_2295D12F4((void (*)(void))_ProtoStrokeAnimationRepresentation.AnimationEffect.allCases.unsafeMutableAddressor, &static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases, a1);
}

void sub_2295D1150()
{
  static _ProtoStrokeAnimationRepresentation.Color.Name.allCases = (uint64_t)&unk_24F2567D8;
}

uint64_t *_ProtoStrokeAnimationRepresentation.Color.Name.allCases.unsafeMutableAddressor()
{
  if (qword_255A55218 != -1)
    swift_once();
  return &static _ProtoStrokeAnimationRepresentation.Color.Name.allCases;
}

void static _ProtoStrokeAnimationRepresentation.Color.Name.allCases.getter()
{
  sub_2295D11C0();
}

void sub_2295D11C0()
{
  char v0;

  OUTLINED_FUNCTION_90();
  if (!v0)
    OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23();
}

void static _ProtoStrokeAnimationRepresentation.Color.Name.allCases.setter(uint64_t a1)
{
  sub_2295D1220(a1, &qword_255A55218, &static _ProtoStrokeAnimationRepresentation.Color.Name.allCases);
}

void sub_2295D1220(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_1();
  *a3 = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_93();
}

void static _ProtoStrokeAnimationRepresentation.Color.Name.allCases.modify()
{
  if (qword_255A55218 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_57();
}

void sub_2295D12E0(_QWORD *a1@<X8>)
{
  sub_2295D12F4((void (*)(void))_ProtoStrokeAnimationRepresentation.Color.Name.allCases.unsafeMutableAddressor, &static _ProtoStrokeAnimationRepresentation.Color.Name.allCases, a1);
}

void sub_2295D12F4(void (*a1)(void)@<X2>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  a1();
  OUTLINED_FUNCTION_1_1();
  *a3 = *a2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_93();
}

void *_ProtoStrokeAnimationRepresentation.protoMessageName.unsafeMutableAddressor()
{
  return &static _ProtoStrokeAnimationRepresentation.protoMessageName;
}

unint64_t static _ProtoStrokeAnimationRepresentation.protoMessageName.getter()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_2295D1360()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  unint64_t v9;
  _QWORD *v10;
  char *v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;
  _QWORD *v22;
  char *v23;
  _QWORD *v24;
  char *v25;
  _QWORD *v26;
  char *v27;
  _QWORD *v28;
  char *v29;
  _QWORD *v30;
  char *v31;
  _QWORD *v32;
  char *v33;
  _QWORD *v34;
  char *v35;
  uint64_t v37;

  v0 = sub_2295E1528();
  __swift_allocate_value_buffer(v0, static _ProtoStrokeAnimationRepresentation._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static _ProtoStrokeAnimationRepresentation._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D00);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D08);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_2295E2180;
  v5 = v37 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v37 + v4) = 1;
  *(_QWORD *)v5 = "strokeContours";
  *(_QWORD *)(v5 + 8) = 14;
  *(_BYTE *)(v5 + 16) = 2;
  v6 = *MEMORY[0x24BE5C318];
  v7 = sub_2295E1510();
  v8 = *(void (**)(void))(*(_QWORD *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  v9 = v37 + v4 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v37 + v4 + v3) = 2;
  *(_QWORD *)v9 = "animationPoints";
  *(_QWORD *)(v9 + 8) = 15;
  *(_BYTE *)(v9 + 16) = 2;
  v8();
  v10 = (_QWORD *)(v37 + v4 + 2 * v3);
  v11 = (char *)v10 + *(int *)(v1 + 48);
  *v10 = 3;
  *(_QWORD *)v11 = "strokeFeatures";
  *((_QWORD *)v11 + 1) = 14;
  v11[16] = 2;
  v8();
  v12 = (_QWORD *)(v37 + v4 + 3 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 4;
  *(_QWORD *)v13 = "speedRate";
  *((_QWORD *)v13 + 1) = 9;
  v13[16] = 2;
  v8();
  v14 = (_QWORD *)(v37 + v4 + 4 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 5;
  *(_QWORD *)v15 = "strokeWidth";
  *((_QWORD *)v15 + 1) = 11;
  v15[16] = 2;
  v8();
  v16 = (_QWORD *)(v37 + v4 + 5 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 6;
  *(_QWORD *)v17 = "animationControlValues";
  *((_QWORD *)v17 + 1) = 22;
  v17[16] = 2;
  v8();
  v18 = (_QWORD *)(v37 + v4 + 6 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 7;
  *(_QWORD *)v19 = "contourColor";
  *((_QWORD *)v19 + 1) = 12;
  v19[16] = 2;
  v8();
  v20 = (_QWORD *)(v37 + v4 + 7 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 8;
  *(_QWORD *)v21 = "backgroundColor";
  *((_QWORD *)v21 + 1) = 15;
  v21[16] = 2;
  v8();
  v22 = (_QWORD *)(v37 + v4 + 8 * v3);
  v23 = (char *)v22 + *(int *)(v1 + 48);
  *v22 = 10;
  *(_QWORD *)v23 = "compoundAnimationEffects";
  *((_QWORD *)v23 + 1) = 24;
  v23[16] = 2;
  v8();
  v24 = (_QWORD *)(v37 + v4 + 9 * v3);
  v25 = (char *)v24 + *(int *)(v1 + 48);
  *v24 = 11;
  *(_QWORD *)v25 = "animationDelays";
  *((_QWORD *)v25 + 1) = 15;
  v25[16] = 2;
  v8();
  v26 = (_QWORD *)(v37 + v4 + 10 * v3);
  v27 = (char *)v26 + *(int *)(v1 + 48);
  *v26 = 12;
  *(_QWORD *)v27 = "strokeColor";
  *((_QWORD *)v27 + 1) = 11;
  v27[16] = 2;
  v8();
  v28 = (_QWORD *)(v37 + v4 + 11 * v3);
  v29 = (char *)v28 + *(int *)(v1 + 48);
  *v28 = 13;
  *(_QWORD *)v29 = "backgroundUrl";
  *((_QWORD *)v29 + 1) = 13;
  v29[16] = 2;
  v8();
  v30 = (_QWORD *)(v37 + v4 + 12 * v3);
  v31 = (char *)v30 + *(int *)(v1 + 48);
  *v30 = 14;
  *(_QWORD *)v31 = "customEaseInValues";
  *((_QWORD *)v31 + 1) = 18;
  v31[16] = 2;
  v8();
  v32 = (_QWORD *)(v37 + v4 + 13 * v3);
  v33 = (char *)v32 + *(int *)(v1 + 48);
  *v32 = 15;
  *(_QWORD *)v33 = "customEaseOutValues";
  *((_QWORD *)v33 + 1) = 19;
  v33[16] = 2;
  v8();
  v34 = (_QWORD *)(v37 + v4 + 14 * v3);
  v35 = (char *)v34 + *(int *)(v1 + 48);
  *v34 = 16;
  *(_QWORD *)v35 = "customEaseInOutValues";
  *((_QWORD *)v35 + 1) = 21;
  v35[16] = 2;
  v8();
  return sub_2295E151C();
}

uint64_t _ProtoStrokeAnimationRepresentation._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_2295D41FC((uint64_t)&unk_255A55220, (uint64_t)static _ProtoStrokeAnimationRepresentation._protobuf_nameMap);
}

uint64_t static _ProtoStrokeAnimationRepresentation._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2295D424C((uint64_t)static _ProtoStrokeAnimationRepresentation._protobuf_nameMap, a1);
}

void sub_2295D179C()
{
  OUTLINED_FUNCTION_0_2();
  qword_255A55608 = (uint64_t)sub_2295D17C4();
  OUTLINED_FUNCTION_40();
}

_QWORD *sub_2295D17C4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = MEMORY[0x24BEE4AF8];
  v0[2] = MEMORY[0x24BEE4AF8];
  v0[3] = v1;
  v0[4] = v1;
  v0[5] = 0;
  v0[6] = v1;
  v0[7] = v1;
  v2 = (uint64_t)v0
     + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
  v3 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v3);
  __swift_storeEnumTagSinglePayload((uint64_t)v0+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor, 1, 1, v3);
  *(_QWORD *)((char *)v0
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects) = v1;
  *(_QWORD *)((char *)v0
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays) = v1;
  __swift_storeEnumTagSinglePayload((uint64_t)v0+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor, 1, 1, v3);
  v4 = (_QWORD *)((char *)v0
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(_QWORD *)((char *)v0
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInValues) = v1;
  *(_QWORD *)((char *)v0
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseOutValues) = v1;
  *(_QWORD *)((char *)v0
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInOutValues) = v1;
  return v0;
}

_QWORD *sub_2295D18B0(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v44;
  _QWORD *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  _QWORD *v49;
  _QWORD *v50;
  char *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  MEMORY[0x24BDAC7A8]();
  v47 = (uint64_t)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BEE4AF8];
  v1[2] = MEMORY[0x24BEE4AF8];
  v1[3] = v5;
  v1[4] = v5;
  v1[5] = 0;
  v44 = v1 + 5;
  v1[6] = v5;
  v1[7] = v5;
  v45 = v1 + 7;
  v6 = (uint64_t)v1
     + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
  v46 = (char *)v1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
  v7 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v7);
  v48 = (char *)v1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
  __swift_storeEnumTagSinglePayload((uint64_t)v1+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor, 1, 1, v7);
  v49 = (_QWORD *)((char *)v1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects);
  *v49 = v5;
  v50 = (_QWORD *)((char *)v1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays);
  *v50 = v5;
  v51 = (char *)v1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
  __swift_storeEnumTagSinglePayload((uint64_t)v1+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor, 1, 1, v7);
  v8 = (_QWORD *)((char *)v1
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
  *v8 = 0;
  v8[1] = 0xE000000000000000;
  v52 = v8;
  v53 = (_QWORD *)((char *)v1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInValues);
  *v53 = v5;
  v54 = (_QWORD *)((char *)v1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseOutValues);
  *v54 = v5;
  v55 = (_QWORD *)((char *)v1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInOutValues);
  *v55 = v5;
  swift_beginAccess();
  v9 = a1[2];
  swift_beginAccess();
  v1[2] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v10 = a1[3];
  swift_beginAccess();
  v1[3] = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v11 = a1[4];
  swift_beginAccess();
  v1[4] = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v12 = a1[5];
  v13 = v44;
  swift_beginAccess();
  *v13 = v12;
  swift_beginAccess();
  v14 = a1[6];
  swift_beginAccess();
  v2[6] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v15 = a1[7];
  v16 = v45;
  swift_beginAccess();
  *v16 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = (uint64_t)a1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
  swift_beginAccess();
  v18 = v47;
  sub_2295D1EF8(v17, v47);
  v19 = (uint64_t)v46;
  swift_beginAccess();
  sub_2295D1FE0(v18, v19);
  swift_endAccess();
  v20 = (uint64_t)a1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
  swift_beginAccess();
  sub_2295D1EF8(v20, v18);
  v21 = (uint64_t)v48;
  swift_beginAccess();
  sub_2295D1FE0(v18, v21);
  swift_endAccess();
  v22 = (_QWORD *)((char *)a1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects);
  swift_beginAccess();
  v23 = *v22;
  v24 = v49;
  swift_beginAccess();
  *v24 = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v25 = (_QWORD *)((char *)a1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays);
  swift_beginAccess();
  v26 = *v25;
  v27 = v50;
  swift_beginAccess();
  *v27 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = (uint64_t)a1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
  swift_beginAccess();
  sub_2295D1EF8(v28, v18);
  v29 = (uint64_t)v51;
  swift_beginAccess();
  sub_2295D1FE0(v18, v29);
  swift_endAccess();
  v30 = (_QWORD *)((char *)a1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
  swift_beginAccess();
  v32 = *v30;
  v31 = v30[1];
  v33 = v52;
  swift_beginAccess();
  *v33 = v32;
  v33[1] = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = (_QWORD *)((char *)a1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInValues);
  swift_beginAccess();
  v35 = *v34;
  v36 = v53;
  swift_beginAccess();
  *v36 = v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = (_QWORD *)((char *)a1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseOutValues);
  swift_beginAccess();
  v38 = *v37;
  v39 = v54;
  swift_beginAccess();
  *v39 = v38;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = (_QWORD *)((char *)a1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInOutValues);
  swift_beginAccess();
  v41 = *v40;
  swift_bridgeObjectRetain();
  swift_release();
  v42 = v55;
  swift_beginAccess();
  *v42 = v41;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_2295D1EF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1)
{
  return sub_2295D2064(a1, qword_255A559F8);
}

uint64_t sub_2295D1F54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2295D1F98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2295D1FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(uint64_t a1)
{
  return sub_2295D2064(a1, qword_255A55840);
}

uint64_t type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(uint64_t a1)
{
  return sub_2295D2064(a1, qword_255A558D8);
}

uint64_t type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(uint64_t a1)
{
  return sub_2295D2064(a1, qword_255A55968);
}

uint64_t sub_2295D2064(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2295D2094()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2295D7D18(v0+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor, &qword_255A55610);
  sub_2295D7D18(v0+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor, &qword_255A55610);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2295D7D18(v0+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor, &qword_255A55610);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2295D2180()
{
  sub_2295D2094();
  return swift_deallocClassInstance();
}

void _ProtoStrokeAnimationRepresentation.decodeMessage<A>(decoder:)()
{
  sub_2295CF1EC();
  swift_release();
  type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_79();
  sub_2295D2208();
  swift_release();
  OUTLINED_FUNCTION_42();
}

uint64_t sub_2295D2208()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_2295E13FC();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_2295D245C();
          break;
        case 2:
          sub_2295D24D8();
          break;
        case 3:
          sub_2295D2584();
          break;
        case 4:
          sub_2295D2600();
          break;
        case 5:
          sub_2295D267C();
          break;
        case 6:
          sub_2295D26F8();
          break;
        case 7:
        case 8:
        case 12:
          sub_2295D2838();
          break;
        case 10:
          sub_2295D27A4();
          break;
        case 11:
        case 14:
        case 15:
        case 16:
          sub_2295D293C();
          break;
        case 13:
          sub_2295D28B8();
          break;
        default:
          break;
      }
      result = sub_2295E13FC();
    }
  }
  return result;
}

uint64_t sub_2295D245C()
{
  swift_beginAccess();
  sub_2295E1438();
  return swift_endAccess();
}

uint64_t sub_2295D24D8()
{
  swift_beginAccess();
  type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(0);
  sub_2295D3FAC(&qword_255A55718, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
  sub_2295E145C();
  return swift_endAccess();
}

uint64_t sub_2295D2584()
{
  swift_beginAccess();
  sub_2295E1438();
  return swift_endAccess();
}

uint64_t sub_2295D2600()
{
  swift_beginAccess();
  sub_2295E1444();
  return swift_endAccess();
}

uint64_t sub_2295D267C()
{
  swift_beginAccess();
  sub_2295E142C();
  return swift_endAccess();
}

uint64_t sub_2295D26F8()
{
  swift_beginAccess();
  type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
  sub_2295D3FAC(&qword_255A55730, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
  sub_2295E145C();
  return swift_endAccess();
}

uint64_t sub_2295D27A4()
{
  swift_beginAccess();
  sub_2295D7608();
  sub_2295E1408();
  return swift_endAccess();
}

uint64_t sub_2295D2838()
{
  OUTLINED_FUNCTION_26();
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  sub_2295D3FAC(&qword_255A55748, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color);
  sub_2295E1468();
  return OUTLINED_FUNCTION_80();
}

uint64_t sub_2295D28B8()
{
  swift_beginAccess();
  sub_2295E1450();
  return swift_endAccess();
}

uint64_t sub_2295D293C()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_81();
  return OUTLINED_FUNCTION_80();
}

uint64_t _ProtoStrokeAnimationRepresentation.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  swift_retain();
  OUTLINED_FUNCTION_68();
  sub_2295D2A0C(v5, v6, v7, a3);
  result = swift_release();
  if (!v3)
  {
    OUTLINED_FUNCTION_82();
    return sub_2295E139C();
  }
  return result;
}

void sub_2295D2A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int EnumTagSinglePayload;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[3];
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v5 = v4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v55 = (uint64_t)v51 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v57 = (uint64_t)v51 - v15;
  v56 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  v16 = MEMORY[0x24BDAC7A8](v56);
  v18 = (char *)v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v53 = (uint64_t)v51 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v54 = (uint64_t)v51 - v21;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16))
  {
    swift_bridgeObjectRetain();
    sub_2295E14D4();
    if (v4)
      goto LABEL_19;
    v52 = v18;
    v22 = a3;
    v23 = a4;
    swift_bridgeObjectRelease();
  }
  else
  {
    v52 = v18;
    v22 = a3;
    v23 = a4;
  }
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16))
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(0);
    sub_2295D3FAC(&qword_255A55718, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
    swift_bridgeObjectRetain();
    v24 = v23;
    sub_2295E14F8();
    if (v4)
      goto LABEL_19;
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = v23;
  }
  swift_beginAccess();
  v25 = v22;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    swift_bridgeObjectRetain();
    sub_2295E14D4();
    if (v4)
      goto LABEL_19;
    v26 = (uint64_t)v12;
    swift_bridgeObjectRelease();
  }
  else
  {
    v26 = (uint64_t)v12;
  }
  swift_beginAccess();
  if (*(double *)(a1 + 40) != 0.0)
  {
    sub_2295E14E0();
    if (v4)
      return;
  }
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 16))
  {
    swift_bridgeObjectRetain();
    sub_2295E14B0();
    if (!v4)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_17:
  swift_beginAccess();
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16);
  v51[2] = v24;
  if (v27)
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
    sub_2295D3FAC(&qword_255A55730, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
    swift_bridgeObjectRetain();
    sub_2295E14F8();
    if (v4)
      goto LABEL_19;
    swift_bridgeObjectRelease();
  }
  v28 = v56;
  v29 = a1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
  swift_beginAccess();
  v30 = v29;
  v31 = v57;
  sub_2295D1EF8(v30, v57);
  if (__swift_getEnumTagSinglePayload(v31, 1, v28) == 1)
  {
    sub_2295D7D18(v31, &qword_255A55610);
  }
  else
  {
    v32 = v31;
    v33 = v54;
    sub_2295D1F54(v32, v54);
    sub_2295D3FAC(&qword_255A55748, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color);
    sub_2295E1504();
    if (v4)
    {
      sub_2295D76B8(v33, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
      return;
    }
    sub_2295D76B8(v33, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
  }
  v34 = a1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
  swift_beginAccess();
  v35 = v34;
  v36 = v55;
  sub_2295D1EF8(v35, v55);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v36, 1, v28);
  v51[1] = v25;
  if (EnumTagSinglePayload == 1)
  {
    sub_2295D7D18(v36, &qword_255A55610);
  }
  else
  {
    v38 = v53;
    sub_2295D1F54(v36, v53);
    sub_2295D3FAC(&qword_255A55748, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color);
    sub_2295E1504();
    sub_2295D76B8(v38, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
    if (v4)
      return;
  }
  v39 = a1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects;
  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)v39 + 16)
    || (sub_2295D7608(), swift_bridgeObjectRetain(), sub_2295E14A4(), swift_bridgeObjectRelease(), !v4))
  {
    v40 = a1
        + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays;
    swift_beginAccess();
    if (!*(_QWORD *)(*(_QWORD *)v40 + 16)
      || (swift_bridgeObjectRetain(), sub_2295E14B0(), swift_bridgeObjectRelease(), !v4))
    {
      v41 = a1
          + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
      swift_beginAccess();
      sub_2295D1EF8(v41, v26);
      if (__swift_getEnumTagSinglePayload(v26, 1, v28) == 1)
      {
        sub_2295D7D18(v26, &qword_255A55610);
      }
      else
      {
        v42 = v26;
        v43 = (uint64_t)v52;
        sub_2295D1F54(v42, (uint64_t)v52);
        sub_2295D3FAC(&qword_255A55748, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color);
        sub_2295E1504();
        sub_2295D76B8(v43, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
        if (v4)
          return;
      }
      v44 = (uint64_t *)(a1
                      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
      swift_beginAccess();
      v45 = *v44;
      v46 = v44[1];
      v47 = HIBYTE(v46) & 0xF;
      if ((v46 & 0x2000000000000000) == 0)
        v47 = v45 & 0xFFFFFFFFFFFFLL;
      if (!v47 || (swift_bridgeObjectRetain(), sub_2295E14EC(), swift_bridgeObjectRelease(), !v5))
      {
        v48 = a1
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInValues;
        swift_beginAccess();
        if (!*(_QWORD *)(*(_QWORD *)v48 + 16)
          || (swift_bridgeObjectRetain(), sub_2295E14B0(), swift_bridgeObjectRelease(), !v5))
        {
          v49 = a1
              + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseOutValues;
          swift_beginAccess();
          if (!*(_QWORD *)(*(_QWORD *)v49 + 16)
            || (swift_bridgeObjectRetain(), sub_2295E14B0(), swift_bridgeObjectRelease(), !v5))
          {
            v50 = a1
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInOutValues;
            swift_beginAccess();
            if (*(_QWORD *)(*(_QWORD *)v50 + 16))
            {
              swift_bridgeObjectRetain();
              sub_2295E14B0();
              goto LABEL_19;
            }
          }
        }
      }
    }
  }
}

uint64_t static _ProtoStrokeAnimationRepresentation.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  char v14;

  v6 = OUTLINED_FUNCTION_8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_50();
  v9 = *(int *)(type metadata accessor for _ProtoStrokeAnimationRepresentation(0) + 20);
  v10 = *(_QWORD *)(a1 + v9);
  v11 = *(_QWORD *)(a2 + v9);
  if (v10 == v11
    || (swift_retain(), swift_retain(), v12 = sub_2295D337C(v10, v11), swift_release(), swift_release(), v12))
  {
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v13(v3, a1, v6);
    v13(v2, a2, v6);
    sub_2295D3FAC(&qword_255A55660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_45(v2);
    OUTLINED_FUNCTION_45(v3);
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

BOOL sub_2295D337C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  _QWORD *v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int EnumTagSinglePayload;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  int v46;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  char v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t *v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;

  v113 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  MEMORY[0x24BDAC7A8](v113);
  v5 = (char *)&v106 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D10);
  v6 = MEMORY[0x24BDAC7A8](v114);
  v8 = (char *)&v106 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v112 = (uint64_t)&v106 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v106 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v109 = (uint64_t)&v106 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v110 = (uint64_t)&v106 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v111 = (uint64_t)&v106 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v106 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v106 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v106 - v26;
  swift_beginAccess();
  v28 = *(_QWORD **)(a1 + 16);
  swift_beginAccess();
  if ((sub_2295D76D8(v28, *(_QWORD **)(a2 + 16)) & 1) != 0)
  {
    v107 = v8;
    v108 = v5;
    swift_beginAccess();
    v29 = *(_QWORD *)(a1 + 24);
    swift_beginAccess();
    v30 = *(_QWORD *)(a2 + 24);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v31 = sub_2295D77A4(v29, v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0)
      goto LABEL_22;
    swift_beginAccess();
    v32 = *(_QWORD **)(a1 + 32);
    swift_beginAccess();
    if ((sub_2295D76D8(v32, *(_QWORD **)(a2 + 32)) & 1) == 0)
      goto LABEL_22;
    swift_beginAccess();
    v33 = *(double *)(a1 + 40);
    swift_beginAccess();
    if (v33 != *(double *)(a2 + 40))
      goto LABEL_22;
    swift_beginAccess();
    v34 = *(_QWORD *)(a1 + 48);
    swift_beginAccess();
    if (!sub_2295D5FAC(v34, *(_QWORD *)(a2 + 48)))
      goto LABEL_22;
    swift_beginAccess();
    v35 = *(_QWORD *)(a1 + 56);
    swift_beginAccess();
    v36 = *(_QWORD *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v37 = sub_2295D7AFC(v35, v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v37 & 1) == 0)
      goto LABEL_22;
    v38 = a1
        + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
    swift_beginAccess();
    sub_2295D1EF8(v38, (uint64_t)v27);
    v39 = a2
        + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
    swift_beginAccess();
    v40 = (uint64_t)&v12[*(int *)(v114 + 48)];
    sub_2295D1EF8((uint64_t)v27, (uint64_t)v12);
    sub_2295D1EF8(v39, v40);
    v41 = v113;
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v113) == 1)
    {
      sub_2295D7D18((uint64_t)v27, &qword_255A55610);
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v40, 1, v41);
      v43 = (uint64_t)v108;
      if (EnumTagSinglePayload == 1)
      {
        sub_2295D7D18((uint64_t)v12, &qword_255A55610);
        goto LABEL_15;
      }
    }
    else
    {
      sub_2295D1EF8((uint64_t)v12, (uint64_t)v25);
      v45 = v40;
      v46 = __swift_getEnumTagSinglePayload(v40, 1, v41);
      v47 = (uint64_t)v108;
      if (v46 != 1)
      {
        sub_2295D1F54(v45, (uint64_t)v108);
        static _ProtoStrokeAnimationRepresentation.Color.== infix(_:_:)((uint64_t)v25, v47, v49, v50, v51, v52, v53, v54, v106, (uint64_t)v107);
        v56 = v55;
        sub_2295D76B8(v47, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
        sub_2295D7D18((uint64_t)v27, &qword_255A55610);
        v41 = v113;
        sub_2295D76B8((uint64_t)v25, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
        v43 = (uint64_t)v108;
        sub_2295D7D18((uint64_t)v12, &qword_255A55610);
        if ((v56 & 1) == 0)
          goto LABEL_22;
LABEL_15:
        v57 = a1
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
        swift_beginAccess();
        sub_2295D1EF8(v57, (uint64_t)v22);
        v58 = a2
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
        swift_beginAccess();
        v59 = v112;
        v60 = v112 + *(int *)(v114 + 48);
        sub_2295D1EF8((uint64_t)v22, v112);
        sub_2295D1EF8(v58, v60);
        if (__swift_getEnumTagSinglePayload(v59, 1, v41) == 1)
        {
          sub_2295D7D18((uint64_t)v22, &qword_255A55610);
          if (__swift_getEnumTagSinglePayload(v60, 1, v41) == 1)
          {
            sub_2295D7D18(v59, &qword_255A55610);
LABEL_26:
            v71 = (uint64_t *)(a1
                            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects);
            swift_beginAccess();
            v72 = *v71;
            v73 = (uint64_t *)(a2
                            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects);
            swift_beginAccess();
            if ((sub_2295D7D40(v72, *v73) & 1) == 0)
              goto LABEL_22;
            v74 = (uint64_t *)(a1
                            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays);
            swift_beginAccess();
            v75 = *v74;
            v76 = (uint64_t *)(a2
                            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays);
            swift_beginAccess();
            if (!sub_2295D5FAC(v75, *v76))
              goto LABEL_22;
            v77 = a1
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
            swift_beginAccess();
            v78 = v110;
            sub_2295D1EF8(v77, v110);
            v79 = a2
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
            swift_beginAccess();
            v80 = (uint64_t)v107;
            v81 = (uint64_t)&v107[*(int *)(v114 + 48)];
            sub_2295D1EF8(v78, (uint64_t)v107);
            sub_2295D1EF8(v79, v81);
            if (__swift_getEnumTagSinglePayload(v80, 1, v41) == 1)
            {
              sub_2295D7D18(v78, &qword_255A55610);
              if (__swift_getEnumTagSinglePayload(v81, 1, v41) == 1)
              {
                sub_2295D7D18((uint64_t)v107, &qword_255A55610);
LABEL_35:
                v92 = (uint64_t *)(a1
                                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
                swift_beginAccess();
                v93 = *v92;
                v94 = v92[1];
                v95 = (_QWORD *)(a2
                               + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
                swift_beginAccess();
                if (v93 != *v95 || v94 != v95[1])
                {
                  v44 = 0;
                  if ((sub_2295E18AC() & 1) == 0)
                    goto LABEL_23;
                }
                v97 = (uint64_t *)(a1
                                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInValues);
                swift_beginAccess();
                v98 = *v97;
                v99 = (uint64_t *)(a2
                                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInValues);
                swift_beginAccess();
                if (sub_2295D5FAC(v98, *v99))
                {
                  v100 = (uint64_t *)(a1
                                   + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseOutValues);
                  swift_beginAccess();
                  v101 = *v100;
                  v102 = (uint64_t *)(a2
                                   + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseOutValues);
                  swift_beginAccess();
                  if (sub_2295D5FAC(v101, *v102))
                  {
                    v103 = (uint64_t *)(a1
                                     + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInOutValues);
                    swift_beginAccess();
                    v104 = *v103;
                    v105 = (uint64_t *)(a2
                                     + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInOutValues);
                    swift_beginAccess();
                    v44 = sub_2295D5FAC(v104, *v105);
                    goto LABEL_23;
                  }
                }
LABEL_22:
                v44 = 0;
LABEL_23:
                swift_release();
                swift_release();
                return v44;
              }
            }
            else
            {
              v82 = v109;
              sub_2295D1EF8(v80, v109);
              if (__swift_getEnumTagSinglePayload(v81, 1, v41) != 1)
              {
                v83 = (uint64_t)v108;
                sub_2295D1F54(v81, (uint64_t)v108);
                static _ProtoStrokeAnimationRepresentation.Color.== infix(_:_:)(v82, v83, v84, v85, v86, v87, v88, v89, v106, (uint64_t)v107);
                v91 = v90;
                sub_2295D76B8(v83, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
                sub_2295D7D18(v78, &qword_255A55610);
                sub_2295D76B8(v82, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
                sub_2295D7D18(v80, &qword_255A55610);
                if ((v91 & 1) == 0)
                  goto LABEL_22;
                goto LABEL_35;
              }
              sub_2295D7D18(v78, &qword_255A55610);
              sub_2295D76B8(v82, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
            }
            v48 = (uint64_t)v107;
LABEL_21:
            sub_2295D7D18(v48, &qword_255A55D10);
            goto LABEL_22;
          }
        }
        else
        {
          v61 = v111;
          sub_2295D1EF8(v59, v111);
          if (__swift_getEnumTagSinglePayload(v60, 1, v41) != 1)
          {
            sub_2295D1F54(v60, v43);
            static _ProtoStrokeAnimationRepresentation.Color.== infix(_:_:)(v61, v43, v63, v64, v65, v66, v67, v68, v106, (uint64_t)v107);
            v70 = v69;
            sub_2295D76B8(v43, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
            sub_2295D7D18((uint64_t)v22, &qword_255A55610);
            sub_2295D76B8(v61, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
            sub_2295D7D18(v59, &qword_255A55610);
            if ((v70 & 1) == 0)
              goto LABEL_22;
            goto LABEL_26;
          }
          sub_2295D7D18((uint64_t)v22, &qword_255A55610);
          sub_2295D76B8(v61, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
        }
        v48 = v59;
        goto LABEL_21;
      }
      sub_2295D7D18((uint64_t)v27, &qword_255A55610);
      sub_2295D76B8((uint64_t)v25, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
    }
    v48 = (uint64_t)v12;
    goto LABEL_21;
  }
  return 0;
}

uint64_t _ProtoStrokeAnimationRepresentation.hashValue.getter()
{
  return sub_2295D5818(type metadata accessor for _ProtoStrokeAnimationRepresentation, &qword_255A55668, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation);
}

unint64_t sub_2295D3DE4()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_2295D3E04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_2295E13B4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_2295D3E3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_2295E13B4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*sub_2295D3E74())()
{
  return nullsub_16;
}

void sub_2295D3E88()
{
  _ProtoStrokeAnimationRepresentation.decodeMessage<A>(decoder:)();
}

uint64_t sub_2295D3E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _ProtoStrokeAnimationRepresentation.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_2295D3EB4()
{
  sub_2295D3FAC(&qword_255A55CF0, type metadata accessor for _ProtoStrokeAnimationRepresentation, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation);
  return sub_2295E13E4();
}

uint64_t sub_2295D3F08(uint64_t a1, uint64_t a2)
{
  return sub_2295D5DA4(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_2295D3F14()
{
  sub_2295D3FAC((unint64_t *)&qword_255A56060, type metadata accessor for _ProtoStrokeAnimationRepresentation, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation);
  return sub_2295E148C();
}

uint64_t sub_2295D3F58()
{
  sub_2295D3FAC((unint64_t *)&qword_255A56060, type metadata accessor for _ProtoStrokeAnimationRepresentation, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation);
  return sub_2295E1498();
}

void sub_2295D3FAC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x22E2CCC34](a3, v5), a1);
  }
  OUTLINED_FUNCTION_58();
}

uint64_t sub_2295D3FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;

  v0 = sub_2295E1528();
  __swift_allocate_value_buffer(v0, static _ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static _ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D00);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D08);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2295E2190;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 0;
  *(_QWORD *)v7 = "DEFAULT";
  *(_QWORD *)(v7 + 8) = 7;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2295E1510();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 1;
  *(_QWORD *)v11 = "PLAIN";
  *(_QWORD *)(v11 + 8) = 5;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "EASEIN";
  *((_QWORD *)v13 + 1) = 6;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 3;
  *(_QWORD *)v15 = "EASEOUT";
  *((_QWORD *)v15 + 1) = 7;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 4;
  *(_QWORD *)v17 = "EASEINOUT";
  *((_QWORD *)v17 + 1) = 9;
  v17[16] = 2;
  v10();
  return sub_2295E151C();
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_2295D41FC((uint64_t)&unk_255A55230, (uint64_t)static _ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap);
}

uint64_t sub_2295D41FC(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;

  OUTLINED_FUNCTION_90();
  if (!v3)
    OUTLINED_FUNCTION_89();
  v4 = OUTLINED_FUNCTION_77();
  return __swift_project_value_buffer(v4, a2);
}

uint64_t static _ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2295D424C((uint64_t)static _ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap, a1);
}

uint64_t sub_2295D424C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  char v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_90();
  if (!v4)
    OUTLINED_FUNCTION_89();
  v5 = OUTLINED_FUNCTION_77();
  v6 = __swift_project_value_buffer(v5, a1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v6, v5);
}

uint64_t sub_2295D42A8(uint64_t a1, uint64_t a2)
{
  return sub_2295D5DA4(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap.unsafeMutableAddressor);
}

void sub_2295D42B4(uint64_t a1)
{
  sub_2295D5210(a1, 0x746E696F502ELL, 0xE600000000000000, static _ProtoStrokeAnimationRepresentation.Point.protoMessageName, &static _ProtoStrokeAnimationRepresentation.Point.protoMessageName[1]);
}

_QWORD *_ProtoStrokeAnimationRepresentation.Point.protoMessageName.unsafeMutableAddressor()
{
  if (qword_255A55238 != -1)
    swift_once();
  return static _ProtoStrokeAnimationRepresentation.Point.protoMessageName;
}

void static _ProtoStrokeAnimationRepresentation.Point.protoMessageName.getter()
{
  sub_2295D48F0();
}

uint64_t sub_2295D4334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_2295E1528();
  __swift_allocate_value_buffer(v0, static _ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static _ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D00);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D08);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2295E21A0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "x";
  *(_QWORD *)(v7 + 8) = 1;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2295E1510();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "y";
  *((_QWORD *)v11 + 1) = 1;
  v11[16] = 2;
  v10();
  return sub_2295E151C();
}

uint64_t _ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_2295D41FC((uint64_t)&unk_255A55240, (uint64_t)static _ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap);
}

uint64_t static _ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2295D424C((uint64_t)static _ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap, a1);
}

void _ProtoStrokeAnimationRepresentation.Point.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_43();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 2 || v1 == 1)
      {
        OUTLINED_FUNCTION_68();
        sub_2295E1420();
      }
      v1 = OUTLINED_FUNCTION_83();
    }
  }
  OUTLINED_FUNCTION_42();
}

void _ProtoStrokeAnimationRepresentation.Point.traverse<A>(visitor:)()
{
  float *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_36();
  if (*v0 == 0.0 || (OUTLINED_FUNCTION_63(), !v1))
  {
    if (*(float *)(v2 + 4) == 0.0 || (OUTLINED_FUNCTION_63(), !v1))
    {
      type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
      OUTLINED_FUNCTION_28();
    }
  }
  OUTLINED_FUNCTION_75();
}

void static _ProtoStrokeAnimationRepresentation.Point.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  float *v2;
  float *v3;
  float *v4;
  float *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_34();
  v3 = v2;
  v5 = v4;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_88();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_50();
  if (*v5 == *v3 && v5[1] == v3[1])
  {
    v8 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
    OUTLINED_FUNCTION_49(v1, (uint64_t)v5 + *(int *)(v8 + 24));
    OUTLINED_FUNCTION_38(*(int *)(v8 + 24));
    sub_2295D3FAC(&qword_255A55660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_45(v0);
    OUTLINED_FUNCTION_45(v1);
  }
  OUTLINED_FUNCTION_33();
}

uint64_t _ProtoStrokeAnimationRepresentation.Point.hashValue.getter()
{
  return sub_2295D5818(type metadata accessor for _ProtoStrokeAnimationRepresentation.Point, &qword_255A55670, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Point);
}

void sub_2295D468C(uint64_t a1, uint64_t a2)
{
  sub_2295D58A4(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.Point.protoMessageName.unsafeMutableAddressor);
}

uint64_t sub_2295D46A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 24);
  v5 = sub_2295E13B4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_2295D46E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 24);
  v5 = sub_2295E13B4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_2295D4728())()
{
  return nullsub_17;
}

void sub_2295D4740()
{
  _ProtoStrokeAnimationRepresentation.Point.decodeMessage<A>(decoder:)();
}

void sub_2295D4754()
{
  _ProtoStrokeAnimationRepresentation.Point.traverse<A>(visitor:)();
}

uint64_t sub_2295D476C()
{
  sub_2295D3FAC(&qword_255A55CE8, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Point);
  return sub_2295E13E4();
}

uint64_t sub_2295D47C0(uint64_t a1, uint64_t a2)
{
  return sub_2295D5DA4(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_2295D47CC()
{
  sub_2295D3FAC(&qword_255A55678, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Point);
  return sub_2295E148C();
}

uint64_t sub_2295D4810()
{
  sub_2295D3FAC(&qword_255A55678, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Point);
  return sub_2295E1498();
}

void sub_2295D4868(uint64_t a1)
{
  sub_2295D5210(a1, 0xD000000000000010, 0x80000002295E3250, static _ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName, &static _ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName[1]);
}

_QWORD *_ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName.unsafeMutableAddressor()
{
  if (qword_255A55248 != -1)
    swift_once();
  return static _ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName;
}

void static _ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName.getter()
{
  sub_2295D48F0();
}

void sub_2295D48F0()
{
  char v0;

  OUTLINED_FUNCTION_90();
  if (!v0)
    swift_once();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_57();
}

void sub_2295D492C(uint64_t a1)
{
  sub_2295D4D5C(a1, static _ProtoStrokeAnimationRepresentation.AnimationPoints._protobuf_nameMap, (uint64_t)"points", 6);
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationPoints._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_2295D41FC((uint64_t)&unk_255A55250, (uint64_t)static _ProtoStrokeAnimationRepresentation.AnimationPoints._protobuf_nameMap);
}

uint64_t static _ProtoStrokeAnimationRepresentation.AnimationPoints._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2295D424C((uint64_t)static _ProtoStrokeAnimationRepresentation.AnimationPoints._protobuf_nameMap, a1);
}

void _ProtoStrokeAnimationRepresentation.AnimationPoints.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  OUTLINED_FUNCTION_64(a1, a2);
  while (1)
  {
    v3 = sub_2295E13FC();
    if (v2 || (v4 & 1) != 0)
      break;
    if (v3 == 1)
    {
      OUTLINED_FUNCTION_79();
      sub_2295D49C8();
    }
    OUTLINED_FUNCTION_82();
  }
  OUTLINED_FUNCTION_84();
}

uint64_t sub_2295D49C8()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  sub_2295D3FAC(&qword_255A55678, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Point);
  return sub_2295E145C();
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationPoints.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  if (!*(_QWORD *)(*(_QWORD *)v0 + 16)
    || (type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0),
        sub_2295D3FAC(&qword_255A55678, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Point), result = sub_2295E14F8(), !v1))
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(0);
    return sub_2295E139C();
  }
  return result;
}

void static _ProtoStrokeAnimationRepresentation.AnimationPoints.== infix(_:_:)()
{
  sub_2295D4F3C();
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationPoints.hashValue.getter()
{
  return sub_2295D5818(type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, &qword_255A55680, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
}

void sub_2295D4B50(uint64_t a1, uint64_t a2)
{
  sub_2295D58A4(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName.unsafeMutableAddressor);
}

uint64_t (*sub_2295D4B74())()
{
  return nullsub_18;
}

void sub_2295D4B8C(uint64_t a1, uint64_t a2)
{
  _ProtoStrokeAnimationRepresentation.AnimationPoints.decodeMessage<A>(decoder:)(a1, a2);
}

uint64_t sub_2295D4BA0()
{
  return _ProtoStrokeAnimationRepresentation.AnimationPoints.traverse<A>(visitor:)();
}

uint64_t sub_2295D4BB8()
{
  sub_2295D3FAC(&qword_255A55CE0, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
  return sub_2295E13E4();
}

uint64_t sub_2295D4C0C(uint64_t a1, uint64_t a2)
{
  return sub_2295D5DA4(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.AnimationPoints._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_2295D4C18()
{
  sub_2295D3FAC(&qword_255A55718, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
  return sub_2295E148C();
}

uint64_t sub_2295D4C5C()
{
  sub_2295D3FAC(&qword_255A55718, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
  return sub_2295E1498();
}

void sub_2295D4CB4(uint64_t a1)
{
  sub_2295D5210(a1, 0x4B656B6F7274532ELL, 0xEF73656D69547965, static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName, &static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName[1]);
}

_QWORD *_ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName.unsafeMutableAddressor()
{
  if (qword_255A55258 != -1)
    swift_once();
  return static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName;
}

void static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName.getter()
{
  sub_2295D48F0();
}

void sub_2295D4D44(uint64_t a1)
{
  sub_2295D4D5C(a1, static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes._protobuf_nameMap, (uint64_t)"value", 5);
}

void sub_2295D4D5C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = OUTLINED_FUNCTION_77();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D00);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D08);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80);
  v10 = (v9 + 32) & ~v9;
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_2295E21B0;
  v12 = v11 + v10 + *(int *)(v8 + 48);
  *(_QWORD *)(v11 + v10) = 1;
  *(_QWORD *)v12 = a3;
  *(_QWORD *)(v12 + 8) = a4;
  *(_BYTE *)(v12 + 16) = 2;
  v13 = *MEMORY[0x24BE5C318];
  sub_2295E1510();
  OUTLINED_FUNCTION_71();
  (*(void (**)(uint64_t, uint64_t))(v14 + 104))(v12, v13);
  sub_2295E151C();
  OUTLINED_FUNCTION_73();
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_2295D41FC((uint64_t)&unk_255A55260, (uint64_t)static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes._protobuf_nameMap);
}

uint64_t static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2295D424C((uint64_t)static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes._protobuf_nameMap, a1);
}

void _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  OUTLINED_FUNCTION_64(a1, a2);
  while (1)
  {
    v3 = sub_2295E13FC();
    if (v2 || (v4 & 1) != 0)
      break;
    if (v3 == 1)
      OUTLINED_FUNCTION_81();
    OUTLINED_FUNCTION_82();
  }
  OUTLINED_FUNCTION_84();
}

void _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_36();
  if (!*(_QWORD *)(*(_QWORD *)v1 + 16) || (OUTLINED_FUNCTION_79(), sub_2295E14B0(), !v0))
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
    OUTLINED_FUNCTION_28();
  }
  OUTLINED_FUNCTION_75();
}

void static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.== infix(_:_:)()
{
  sub_2295D4F3C();
}

void sub_2295D4F3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(_QWORD);
  uint64_t (*v3)(_QWORD);
  uint64_t (*v4)(_QWORD, _QWORD);
  uint64_t (*v5)(_QWORD, _QWORD);
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_34();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = OUTLINED_FUNCTION_8();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_50();
  if ((v5(*v9, *v7) & 1) != 0)
  {
    v12 = v3(0);
    OUTLINED_FUNCTION_49(v1, (uint64_t)v9 + *(int *)(v12 + 20));
    OUTLINED_FUNCTION_38(*(int *)(v12 + 20));
    sub_2295D3FAC(&qword_255A55660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_45(v0);
    OUTLINED_FUNCTION_45(v1);
  }
  OUTLINED_FUNCTION_33();
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.hashValue.getter()
{
  return sub_2295D5818(type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, &qword_255A55688, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
}

void sub_2295D503C(uint64_t a1, uint64_t a2)
{
  sub_2295D58A4(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName.unsafeMutableAddressor);
}

uint64_t sub_2295D505C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8();
  v0 = OUTLINED_FUNCTION_16();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

uint64_t sub_2295D5088()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8();
  v0 = OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

uint64_t (*sub_2295D50B0())()
{
  return nullsub_19;
}

void sub_2295D50C8(uint64_t a1, uint64_t a2)
{
  _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.decodeMessage<A>(decoder:)(a1, a2);
}

void sub_2295D50DC()
{
  _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.traverse<A>(visitor:)();
}

uint64_t sub_2295D50F4()
{
  sub_2295D3FAC(&qword_255A55CD8, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
  return sub_2295E13E4();
}

uint64_t sub_2295D5148(uint64_t a1, uint64_t a2)
{
  return sub_2295D5DA4(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.StrokeKeyTimes._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_2295D5154()
{
  sub_2295D3FAC(&qword_255A55730, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
  return sub_2295E148C();
}

uint64_t sub_2295D5198()
{
  sub_2295D3FAC(&qword_255A55730, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
  return sub_2295E1498();
}

void sub_2295D51F0(uint64_t a1)
{
  sub_2295D5210(a1, 0x726F6C6F432ELL, 0xE600000000000000, static _ProtoStrokeAnimationRepresentation.Color.protoMessageName, &static _ProtoStrokeAnimationRepresentation.Color.protoMessageName[1]);
}

void sub_2295D5210(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  sub_2295E1630();
  *a4 = 0xD00000000000002DLL;
  *a5 = 0x80000002295E3010;
  OUTLINED_FUNCTION_93();
}

_QWORD *_ProtoStrokeAnimationRepresentation.Color.protoMessageName.unsafeMutableAddressor()
{
  if (qword_255A55268 != -1)
    swift_once();
  return static _ProtoStrokeAnimationRepresentation.Color.protoMessageName;
}

void static _ProtoStrokeAnimationRepresentation.Color.protoMessageName.getter()
{
  sub_2295D48F0();
}

uint64_t sub_2295D52D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  _QWORD *v12;
  char *v13;

  v0 = sub_2295E1528();
  __swift_allocate_value_buffer(v0, static _ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static _ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D00);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D08);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2295E21C0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "rgb";
  *(_QWORD *)(v7 + 8) = 3;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2295E1510();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "alpha";
  *((_QWORD *)v11 + 1) = 5;
  v11[16] = 2;
  v10();
  v12 = (_QWORD *)((char *)v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "name";
  *((_QWORD *)v13 + 1) = 4;
  v13[16] = 2;
  v10();
  return sub_2295E151C();
}

uint64_t _ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_2295D41FC((uint64_t)&unk_255A55270, (uint64_t)static _ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap);
}

uint64_t static _ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2295D424C((uint64_t)static _ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap, a1);
}

void _ProtoStrokeAnimationRepresentation.Color.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_43();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 3:
          OUTLINED_FUNCTION_79();
          sub_2295D5524();
          break;
        case 2:
          OUTLINED_FUNCTION_68();
          sub_2295E1444();
          break;
        case 1:
          OUTLINED_FUNCTION_68();
          sub_2295E1450();
          break;
      }
      v1 = OUTLINED_FUNCTION_83();
    }
  }
  OUTLINED_FUNCTION_42();
}

uint64_t sub_2295D5524()
{
  sub_2295D6020();
  return sub_2295E1414();
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.traverse<A>(visitor:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;

  OUTLINED_FUNCTION_36();
  v3 = v1[1];
  v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v4 = *v1 & 0xFFFFFFFFFFFFLL;
  if (!v4 || (result = sub_2295E14EC(), !v0))
  {
    if (*(double *)(v2 + 16) == 0.0 || (OUTLINED_FUNCTION_68(), result = sub_2295E14E0(), !v0))
    {
      if (!*(_QWORD *)(v2 + 24) || (sub_2295D6020(), result = sub_2295E14BC(), !v0))
      {
        type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
        return OUTLINED_FUNCTION_28();
      }
    }
  }
  return result;
}

void static _ProtoStrokeAnimationRepresentation.Color.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
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
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_34();
  v15 = v14;
  v17 = v16;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_88();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_50();
  v22 = *(_QWORD *)v17;
  v23 = *(_QWORD *)(v17 + 8);
  v24 = *v15;
  v25 = v15[1];
  v26 = *(_QWORD *)v17 == *v15 && v23 == v25;
  if (v26 || (v22 = sub_2295E18AC(), (v22 & 1) != 0))
  {
    if (*(double *)(v17 + 16) == *((double *)v15 + 2))
    {
      v27 = v15[3];
      if (*((_BYTE *)v15 + 32) == 1)
      {
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_2295D571C + 4 * byte_2295E21F0[v27]))(v22, v23, v24, v25, v18, v19, v20, v21, a9, a10);
        return;
      }
      if (*(_QWORD *)(v17 + 24) == v27)
      {
        v28 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
        OUTLINED_FUNCTION_49(v12, v17 + *(int *)(v28 + 28));
        OUTLINED_FUNCTION_38(*(int *)(v28 + 28));
        sub_2295D3FAC(&qword_255A55660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
        OUTLINED_FUNCTION_22();
        v29 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
        v29(v10, v11);
        v29(v12, v11);
      }
    }
  }
  OUTLINED_FUNCTION_33();
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.hashValue.getter()
{
  return sub_2295D5818(type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, &qword_255A55698, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color);
}

uint64_t sub_2295D5818(uint64_t (*a1)(uint64_t), unint64_t *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_99();
  a1(0);
  sub_2295D3FAC(a2, a1, a3);
  sub_2295E15D0();
  return OUTLINED_FUNCTION_76();
}

void sub_2295D588C(uint64_t a1, uint64_t a2)
{
  sub_2295D58A4(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.Color.protoMessageName.unsafeMutableAddressor);
}

void sub_2295D58A4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_57();
}

uint64_t sub_2295D58D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 28);
  v5 = sub_2295E13B4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_2295D5914(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 28);
  v5 = sub_2295E13B4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_2295D5954())()
{
  return nullsub_20;
}

void sub_2295D596C()
{
  _ProtoStrokeAnimationRepresentation.Color.decodeMessage<A>(decoder:)();
}

uint64_t sub_2295D5980()
{
  return _ProtoStrokeAnimationRepresentation.Color.traverse<A>(visitor:)();
}

uint64_t sub_2295D5998()
{
  sub_2295D3FAC(&qword_255A55CD0, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color);
  return sub_2295E13E4();
}

uint64_t sub_2295D59EC(uint64_t a1, uint64_t a2)
{
  return sub_2295D5DA4(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_2295D59F8()
{
  sub_2295D3FAC(&qword_255A55748, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color);
  return sub_2295E148C();
}

uint64_t sub_2295D5A3C()
{
  sub_2295D3FAC(&qword_255A55748, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color);
  return sub_2295E1498();
}

void sub_2295D5A90()
{
  sub_2295E18B8();
  sub_2295E15D0();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_94();
}

uint64_t sub_2295D5ADC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  unint64_t v10;
  _QWORD *v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  _QWORD *v15;
  char *v16;
  _QWORD *v17;
  char *v18;
  _QWORD *v19;
  char *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v24;

  v0 = sub_2295E1528();
  __swift_allocate_value_buffer(v0, static _ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static _ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D00);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D08);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_2295E21D0;
  v5 = v24 + v4;
  v6 = v24 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v24 + v4) = 0;
  *(_QWORD *)v6 = "DEFAULT";
  *(_QWORD *)(v6 + 8) = 7;
  *(_BYTE *)(v6 + 16) = 2;
  v7 = *MEMORY[0x24BE5C318];
  v8 = sub_2295E1510();
  v9 = *(void (**)(void))(*(_QWORD *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  v10 = v5 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v3) = 1;
  *(_QWORD *)v10 = "CLEAR";
  *(_QWORD *)(v10 + 8) = 5;
  *(_BYTE *)(v10 + 16) = 2;
  v9();
  v11 = (_QWORD *)(v5 + 2 * v3);
  v12 = (char *)v11 + *(int *)(v1 + 48);
  *v11 = 2;
  *(_QWORD *)v12 = "BLACK";
  *((_QWORD *)v12 + 1) = 5;
  v12[16] = 2;
  v9();
  v13 = (_QWORD *)(v5 + 3 * v3);
  v14 = (char *)v13 + *(int *)(v1 + 48);
  *v13 = 3;
  *(_QWORD *)v14 = "WHITE";
  *((_QWORD *)v14 + 1) = 5;
  v14[16] = 2;
  v9();
  v15 = (_QWORD *)(v5 + 4 * v3);
  v16 = (char *)v15 + *(int *)(v1 + 48);
  *v15 = 4;
  *(_QWORD *)v16 = "GRAY";
  *((_QWORD *)v16 + 1) = 4;
  v16[16] = 2;
  v9();
  v17 = (_QWORD *)(v5 + 5 * v3);
  v18 = (char *)v17 + *(int *)(v1 + 48);
  *v17 = 5;
  *(_QWORD *)v18 = "RED";
  *((_QWORD *)v18 + 1) = 3;
  v18[16] = 2;
  v9();
  v19 = (_QWORD *)(v5 + 6 * v3);
  v20 = (char *)v19 + *(int *)(v1 + 48);
  *v19 = 6;
  *(_QWORD *)v20 = "GREEN";
  *((_QWORD *)v20 + 1) = 5;
  v20[16] = 2;
  v9();
  v21 = (_QWORD *)(v5 + 7 * v3);
  v22 = (char *)v21 + *(int *)(v1 + 48);
  *v21 = 7;
  *(_QWORD *)v22 = "BLUE";
  *((_QWORD *)v22 + 1) = 4;
  v22[16] = 2;
  v9();
  return sub_2295E151C();
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_2295D41FC((uint64_t)&unk_255A55278, (uint64_t)static _ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap);
}

uint64_t static _ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2295D424C((uint64_t)static _ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap, a1);
}

uint64_t sub_2295D5D98(uint64_t a1, uint64_t a2)
{
  return sub_2295D5DA4(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_2295D5DA4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  a3();
  OUTLINED_FUNCTION_77();
  v3 = OUTLINED_FUNCTION_16();
  return OUTLINED_FUNCTION_3_1(v3, v4, v5, v6);
}

uint64_t sub_2295D5DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float *v7;
  uint64_t v8;
  uint64_t v9;
  float *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;

  v4 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (float *)((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5);
  v10 = (float *)((char *)&v18 - v9);
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 != *(_QWORD *)(a2 + 16))
  {
LABEL_15:
    v14 = 0;
    return v14 & 1;
  }
  if (v11 && a1 != a2)
  {
    v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v19 = *(_QWORD *)(v8 + 72);
    v13 = v11 - 1;
    while (1)
    {
      sub_2295D7684(a1 + v12, (uint64_t)v10, (void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
      sub_2295D7684(a2 + v12, (uint64_t)v7, (void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
      if (*v10 != *v7 || v10[1] != v7[1])
        break;
      sub_2295E13B4();
      sub_2295D3FAC(&qword_255A55660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v14 = sub_2295E15DC();
      sub_2295D76B8((uint64_t)v7, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
      sub_2295D76B8((uint64_t)v10, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
      v16 = v13-- != 0;
      if ((v14 & 1) != 0)
      {
        v12 += v19;
        if (v16)
          continue;
      }
      return v14 & 1;
    }
    sub_2295D76B8((uint64_t)v7, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
    sub_2295D76B8((uint64_t)v10, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
    goto LABEL_15;
  }
  v14 = 1;
  return v14 & 1;
}

BOOL sub_2295D5FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  double *v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (*(double *)(a1 + 32) != *(double *)(a2 + 32))
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = (double *)(a1 + 40);
  v6 = (double *)(a2 + 40);
  do
  {
    v7 = *v5++;
    v8 = v7;
    v9 = *v6++;
    v10 = v9;
    v12 = v4-- != 0;
    result = v8 == v10;
  }
  while (v8 == v10 && v12);
  return result;
}

unint64_t sub_2295D6020()
{
  unint64_t result;

  result = qword_255A55690;
  if (!qword_255A55690)
  {
    result = MEMORY[0x22E2CCC34](&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color.Name, &type metadata for _ProtoStrokeAnimationRepresentation.Color.Name);
    atomic_store(result, (unint64_t *)&qword_255A55690);
  }
  return result;
}

unint64_t sub_2295D6060()
{
  unint64_t result;

  result = qword_255A556A0;
  if (!qword_255A556A0)
  {
    result = MEMORY[0x22E2CCC34](&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationEffect, &type metadata for _ProtoStrokeAnimationRepresentation.AnimationEffect);
    atomic_store(result, (unint64_t *)&qword_255A556A0);
  }
  return result;
}

unint64_t sub_2295D60A0()
{
  unint64_t result;

  result = qword_255A556A8;
  if (!qword_255A556A8)
  {
    result = MEMORY[0x22E2CCC34](&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationEffect, &type metadata for _ProtoStrokeAnimationRepresentation.AnimationEffect);
    atomic_store(result, (unint64_t *)&qword_255A556A8);
  }
  return result;
}

unint64_t sub_2295D60E0()
{
  unint64_t result;

  result = qword_255A556B0;
  if (!qword_255A556B0)
  {
    result = MEMORY[0x22E2CCC34](&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationEffect, &type metadata for _ProtoStrokeAnimationRepresentation.AnimationEffect);
    atomic_store(result, (unint64_t *)&qword_255A556B0);
  }
  return result;
}

unint64_t sub_2295D6120()
{
  unint64_t result;

  result = qword_255A556B8;
  if (!qword_255A556B8)
  {
    result = MEMORY[0x22E2CCC34](&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color.Name, &type metadata for _ProtoStrokeAnimationRepresentation.Color.Name);
    atomic_store(result, (unint64_t *)&qword_255A556B8);
  }
  return result;
}

unint64_t sub_2295D6160()
{
  unint64_t result;

  result = qword_255A556C0;
  if (!qword_255A556C0)
  {
    result = MEMORY[0x22E2CCC34](&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color.Name, &type metadata for _ProtoStrokeAnimationRepresentation.Color.Name);
    atomic_store(result, (unint64_t *)&qword_255A556C0);
  }
  return result;
}

unint64_t sub_2295D61A0()
{
  unint64_t result;

  result = qword_255A556C8;
  if (!qword_255A556C8)
  {
    result = MEMORY[0x22E2CCC34](&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color.Name, &type metadata for _ProtoStrokeAnimationRepresentation.Color.Name);
    atomic_store(result, (unint64_t *)&qword_255A556C8);
  }
  return result;
}

void sub_2295D61DC()
{
  sub_2295D6224(&qword_255A556D0, &qword_255A556D8);
}

void sub_2295D6200()
{
  sub_2295D6224(&qword_255A556E0, &qword_255A556E8);
}

void sub_2295D6224(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x22E2CCC34](MEMORY[0x24BEE12E0], v3), a1);
  }
  OUTLINED_FUNCTION_58();
}

void sub_2295D6260()
{
  sub_2295D3FAC(&qword_255A556F0, type metadata accessor for _ProtoStrokeAnimationRepresentation, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation);
}

void sub_2295D628C()
{
  sub_2295D3FAC((unint64_t *)&qword_255A56060, type metadata accessor for _ProtoStrokeAnimationRepresentation, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation);
}

void sub_2295D62B8()
{
  sub_2295D3FAC(&qword_255A55668, type metadata accessor for _ProtoStrokeAnimationRepresentation, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation);
}

void sub_2295D62E4()
{
  sub_2295D3FAC(&qword_255A556F8, type metadata accessor for _ProtoStrokeAnimationRepresentation, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation);
}

void sub_2295D6310()
{
  sub_2295D3FAC(&qword_255A55700, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Point);
}

void sub_2295D633C()
{
  sub_2295D3FAC(&qword_255A55678, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Point);
}

void sub_2295D6368()
{
  sub_2295D3FAC(&qword_255A55670, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Point);
}

void sub_2295D6394()
{
  sub_2295D3FAC(&qword_255A55708, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Point);
}

void sub_2295D63C0()
{
  sub_2295D3FAC(&qword_255A55710, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
}

void sub_2295D63EC()
{
  sub_2295D3FAC(&qword_255A55718, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
}

void sub_2295D6418()
{
  sub_2295D3FAC(&qword_255A55680, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
}

void sub_2295D6444()
{
  sub_2295D3FAC(&qword_255A55720, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
}

void sub_2295D6470()
{
  sub_2295D3FAC(&qword_255A55728, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
}

void sub_2295D649C()
{
  sub_2295D3FAC(&qword_255A55730, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
}

void sub_2295D64C8()
{
  sub_2295D3FAC(&qword_255A55688, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
}

void sub_2295D64F4()
{
  sub_2295D3FAC(&qword_255A55738, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
}

void sub_2295D6520()
{
  sub_2295D3FAC(&qword_255A55740, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color);
}

void sub_2295D654C()
{
  sub_2295D3FAC(&qword_255A55748, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color);
}

void sub_2295D6578()
{
  sub_2295D3FAC(&qword_255A55698, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color);
}

void sub_2295D65A4()
{
  sub_2295D3FAC(&qword_255A55750, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.Color);
}

uint64_t *initializeBufferWithCopyOfBuffer for _ProtoStrokeAnimationRepresentation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_2295E13B4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t destroy for _ProtoStrokeAnimationRepresentation(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2295E13B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t initializeWithCopy for _ProtoStrokeAnimationRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2295E13B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for _ProtoStrokeAnimationRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2295E13B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for _ProtoStrokeAnimationRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2295E13B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for _ProtoStrokeAnimationRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2295E13B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_2295D6834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = OUTLINED_FUNCTION_8();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    OUTLINED_FUNCTION_29(a1, a2, v6);
  }
  else
  {
    OUTLINED_FUNCTION_51(*(_QWORD *)(a1 + *(int *)(a3 + 20)));
    OUTLINED_FUNCTION_39();
  }
}

uint64_t storeEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2295D6898(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_DWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_8() - 8) + 84) == a3)
  {
    v7 = OUTLINED_FUNCTION_92();
    OUTLINED_FUNCTION_30(v7, v8, v9, v10);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
    OUTLINED_FUNCTION_35();
  }
}

uint64_t sub_2295D68EC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2295E13B4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.AnimationEffect(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.AnimationEffect(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_2295D69C4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2295D69E4(uint64_t result, int a2)
{
  char v2;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  *(_BYTE *)(result + 8) = v2;
  return result;
}

ValueMetadata *type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationEffect()
{
  return &type metadata for _ProtoStrokeAnimationRepresentation.AnimationEffect;
}

uint64_t *initializeBufferWithCopyOfBuffer for _ProtoStrokeAnimationRepresentation.Point(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v5 = *(int *)(a3 + 24);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_2295E13B4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for _ProtoStrokeAnimationRepresentation.Point(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 24);
  v3 = sub_2295E13B4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_QWORD *initializeWithCopy for _ProtoStrokeAnimationRepresentation.Point(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2295E13B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithCopy for _ProtoStrokeAnimationRepresentation.Point(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2295E13B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_QWORD *initializeWithTake for _ProtoStrokeAnimationRepresentation.Point(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2295E13B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for _ProtoStrokeAnimationRepresentation.Point(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2295E13B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.Point()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2295D6C58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 24);
  v5 = OUTLINED_FUNCTION_8();
  return __swift_getEnumTagSinglePayload(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.Point()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2295D6C98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_8();
  v0 = OUTLINED_FUNCTION_92();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_2295D6CC4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2295E13B4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.AnimationPoints()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.AnimationPoints()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void _s15StrokeAnimation35_ProtoStrokeAnimationRepresentationV15AnimationPointsVwCP_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v3;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_6();
  }
  else
  {
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_52();
    OUTLINED_FUNCTION_67();
  }
  OUTLINED_FUNCTION_74();
}

uint64_t _s15StrokeAnimation35_ProtoStrokeAnimationRepresentationV15AnimationPointsVwxx_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = OUTLINED_FUNCTION_8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

void _s15StrokeAnimation35_ProtoStrokeAnimationRepresentationV15AnimationPointsVwcp_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_74();
}

void _s15StrokeAnimation35_ProtoStrokeAnimationRepresentationV15AnimationPointsVwca_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_56(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24));
  OUTLINED_FUNCTION_54();
}

void _s15StrokeAnimation35_ProtoStrokeAnimationRepresentationV15AnimationPointsVwtk_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;

  *a1 = *a2;
  v3 = *(int *)(a3 + 20);
  v4 = (char *)a1 + v3;
  v5 = (char *)a2 + v3;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_71();
  (*(void (**)(char *, char *))(v6 + 32))(v4, v5);
  OUTLINED_FUNCTION_54();
}

void _s15StrokeAnimation35_ProtoStrokeAnimationRepresentationV15AnimationPointsVwta_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_56(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40));
  OUTLINED_FUNCTION_54();
}

uint64_t getEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void __swift_get_extra_inhabitant_index_3Tm(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_51(*a1);
    OUTLINED_FUNCTION_39();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_29((uint64_t)a1 + *(int *)(a3 + 20), a2, v6);
  }
}

uint64_t storeEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void __swift_store_extra_inhabitant_index_4Tm()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_95();
  if (v3)
  {
    *v1 = (v0 - 1);
    OUTLINED_FUNCTION_35();
  }
  else
  {
    v4 = v2;
    v5 = OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_30((uint64_t)v1 + *(int *)(v4 + 20), v0, v0, v5);
  }
}

uint64_t sub_2295D7040()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2295E13B4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    v7 = *(int *)(a3 + 28);
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    v10 = sub_2295E13B4();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_2295E13B4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2295E13B4();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

uint64_t assignWithCopy for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2295E13B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(int *)(a3 + 28);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_2295E13B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2295E13B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.Color()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_2295D73BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_51(*(_QWORD *)(a1 + 8));
    OUTLINED_FUNCTION_39();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_29(a1 + *(int *)(a3 + 28), a2, v6);
  }
}

uint64_t storeEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.Color()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2295D741C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_95();
  if (v3)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    OUTLINED_FUNCTION_35();
  }
  else
  {
    v4 = v2;
    v5 = OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_30(v1 + *(int *)(v4 + 28), v0, v0, v5);
  }
}

uint64_t sub_2295D7468()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2295E13B4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for _ProtoStrokeAnimationRepresentation.Color.Name()
{
  return &type metadata for _ProtoStrokeAnimationRepresentation.Color.Name;
}

uint64_t sub_2295D7508()
{
  return type metadata accessor for _ProtoStrokeAnimationRepresentation._StorageClass(0);
}

void sub_2295D7510()
{
  unint64_t v0;

  sub_2295D75B4();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_2295D75B4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255A55A70)
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(255);
    v0 = sub_2295E17D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255A55A70);
  }
}

unint64_t sub_2295D7608()
{
  unint64_t result;

  result = qword_255A55CF8;
  if (!qword_255A55CF8)
  {
    result = MEMORY[0x22E2CCC34](&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation.AnimationEffect, &type metadata for _ProtoStrokeAnimationRepresentation.AnimationEffect);
    atomic_store(result, (unint64_t *)&qword_255A55CF8);
  }
  return result;
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

void sub_2295D7684(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v3;

  a3(0);
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_56(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16));
  OUTLINED_FUNCTION_58();
}

void sub_2295D76B8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_91(a1, a2);
  OUTLINED_FUNCTION_59(v2);
  OUTLINED_FUNCTION_58();
}

uint64_t sub_2295D76D8(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  uint64_t result;
  char v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    v7 = sub_2295E18AC();
    result = 0;
    if ((v7 & 1) == 0)
      return result;
  }
  if (v2 == 1)
    return 1;
  v8 = a1 + 7;
  v9 = a2 + 7;
  v10 = 1;
  while (v10 < v2)
  {
    result = *(v8 - 1);
    if (result != *(v9 - 1) || *v8 != *v9)
    {
      result = sub_2295E18AC();
      if ((result & 1) == 0)
        return 0;
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10)
      return 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_2295D77A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float *v7;
  uint64_t v8;
  float *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v40 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  v4 = *(_QWORD *)(v40 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (float *)((char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5);
  v9 = (float *)((char *)&v29 - v8);
  v10 = type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (uint64_t *)((char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v29 - v15;
  v17 = *(_QWORD *)(a1 + 16);
  if (v17 != *(_QWORD *)(a2 + 16))
  {
LABEL_19:
    v27 = 0;
    return v27 & 1;
  }
  if (v17 && a1 != a2)
  {
    v30 = v4;
    v31 = v17;
    v18 = 0;
    v19 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    v34 = a2 + v19;
    v35 = a1 + v19;
    v20 = *(_QWORD *)(v14 + 72);
    v32 = v10;
    v33 = v20;
    v36 = (char *)&v29 - v15;
    v37 = v13;
    while (1)
    {
      v38 = v18;
      v21 = v33 * v18;
      sub_2295D7684(v35 + v33 * v18, (uint64_t)v16, (void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
      sub_2295D7684(v34 + v21, (uint64_t)v13, (void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
      v22 = *(_QWORD *)v16;
      v23 = *v13;
      v24 = *(_QWORD *)(*(_QWORD *)v16 + 16);
      if (v24 != *(_QWORD *)(v23 + 16))
        break;
      if (v24 && v22 != v23)
      {
        v25 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
        v39 = *(_QWORD *)(v30 + 72);
        while (1)
        {
          sub_2295D7684(v22 + v25, (uint64_t)v9, (void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
          sub_2295D7684(v23 + v25, (uint64_t)v7, (void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
          if (*v9 != *v7 || v9[1] != v7[1])
            break;
          sub_2295E13B4();
          sub_2295D3FAC(&qword_255A55660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
          v26 = sub_2295E15DC();
          sub_2295D76B8((uint64_t)v7, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
          sub_2295D76B8((uint64_t)v9, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
          if ((v26 & 1) == 0)
            goto LABEL_18;
          v25 += v39;
          if (!--v24)
            goto LABEL_13;
        }
        sub_2295D76B8((uint64_t)v7, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
        sub_2295D76B8((uint64_t)v9, type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
        break;
      }
LABEL_13:
      v16 = v36;
      v13 = v37;
      sub_2295E13B4();
      sub_2295D3FAC(&qword_255A55660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v27 = sub_2295E15DC();
      sub_2295D76B8((uint64_t)v13, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
      sub_2295D76B8((uint64_t)v16, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
      if ((v27 & 1) != 0)
      {
        v18 = v38 + 1;
        if (v38 + 1 != v31)
          continue;
      }
      return v27 & 1;
    }
LABEL_18:
    sub_2295D76B8((uint64_t)v37, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
    sub_2295D76B8((uint64_t)v36, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
    goto LABEL_19;
  }
  v27 = 1;
  return v27 & 1;
}

uint64_t sub_2295D7AFC(uint64_t a1, uint64_t a2)
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
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  double *v20;
  double *v21;
  char v22;
  uint64_t v24;
  uint64_t v25;

  v4 = type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v24 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 != *(_QWORD *)(a2 + 16))
  {
LABEL_20:
    v22 = 0;
    return v22 & 1;
  }
  if (v11 && a1 != a2)
  {
    v12 = 0;
    v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v24 = a2 + v13;
    v25 = a1 + v13;
    v14 = *(_QWORD *)(v8 + 72);
    while (1)
    {
      sub_2295D7684(v25 + v14 * v12, (uint64_t)v10, (void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
      sub_2295D7684(v24 + v14 * v12, (uint64_t)v7, (void (*)(_QWORD))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
      v15 = *(_QWORD *)v10;
      v16 = *(_QWORD *)v7;
      v17 = *(_QWORD *)(*(_QWORD *)v10 + 16);
      if (v17 != *(_QWORD *)(*(_QWORD *)v7 + 16))
        break;
      if (v17)
        v18 = v15 == v16;
      else
        v18 = 1;
      if (!v18)
      {
        if (*(double *)(v15 + 32) != *(double *)(v16 + 32))
          break;
        v19 = v17 - 1;
        if (v19)
        {
          v20 = (double *)(v15 + 40);
          v21 = (double *)(v16 + 40);
          while (*v20 == *v21)
          {
            ++v20;
            ++v21;
            if (!--v19)
              goto LABEL_15;
          }
          break;
        }
      }
LABEL_15:
      sub_2295E13B4();
      sub_2295D3FAC(&qword_255A55660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v22 = sub_2295E15DC();
      sub_2295D76B8((uint64_t)v7, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
      sub_2295D76B8((uint64_t)v10, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
      if ((v22 & 1) != 0 && ++v12 != v11)
        continue;
      return v22 & 1;
    }
    sub_2295D76B8((uint64_t)v7, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
    sub_2295D76B8((uint64_t)v10, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
    goto LABEL_20;
  }
  v22 = 1;
  return v22 & 1;
}

void sub_2295D7D18(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_59(v2);
  OUTLINED_FUNCTION_58();
}

uint64_t sub_2295D7D40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  _BYTE *i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v3 = (uint64_t *)(a1 + 32);
  for (i = (_BYTE *)(a2 + 40); ; i += 16)
  {
    v6 = *v3;
    v3 += 2;
    v5 = v6;
    v7 = *((_QWORD *)i - 1);
    if (*i == 1)
      break;
    if (v5 != v7)
      return 0;
    if (!--v2)
      return 1;
  }
  return ((uint64_t (*)(void))((char *)&loc_2295D7D90 + 4 * byte_2295E21F8[v7]))();
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation._StorageClass(0);
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_2_1(void *a1)
{
  free(a1);
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t result;

  *v1 = a1;
  *(_QWORD *)(a1 + 80) = v2;
  result = type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(result + 20);
  return result;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + v1) = a1;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_2295E13B4();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t result;

  *v1 = a1;
  *(_QWORD *)(a1 + 80) = v2;
  result = type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(result + 20);
  return result;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_13()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  return swift_isUniquelyReferenced_nonNull_native();
}

void *OUTLINED_FUNCTION_14()
{
  return malloc(0x60uLL);
}

uint64_t OUTLINED_FUNCTION_16()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_18()
{
  uint64_t v0;

  return v0;
}

_QWORD *OUTLINED_FUNCTION_19(_QWORD *a1)
{
  return sub_2295D18B0(a1);
}

void *OUTLINED_FUNCTION_20(uint64_t a1)
{
  uint64_t v1;
  size_t v2;

  *(_QWORD *)(v1 + 32) = a1;
  v2 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0) - 8) + 64);
  return malloc(v2);
}

uint64_t OUTLINED_FUNCTION_21()
{
  char v0;
  uint64_t v1;

  *(_QWORD *)v1 = 0;
  *(_QWORD *)(v1 + 8) = 0xE000000000000000;
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  *(_BYTE *)(v1 + 32) = v0;
  return _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_2295E15DC();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_2295E139C();
}

uint64_t OUTLINED_FUNCTION_29(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_31()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
}

uint64_t OUTLINED_FUNCTION_37()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(v1, v3 + a1, v2);
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_2295E13FC();
}

uint64_t OUTLINED_FUNCTION_44()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_45(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void *OUTLINED_FUNCTION_46()
{
  size_t v0;

  return malloc(v0);
}

_QWORD *OUTLINED_FUNCTION_48(_QWORD *a1)
{
  return sub_2295D18B0(a1);
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_51@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_bridgeObjectRetain();
}

void *OUTLINED_FUNCTION_53(uint64_t a1)
{
  return malloc(*(_QWORD *)(*(_QWORD *)(a1 - 8) + 64));
}

uint64_t OUTLINED_FUNCTION_55()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2295D1F54(v0, v1);
}

uint64_t OUTLINED_FUNCTION_56@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_59(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_60()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2295D1EF8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_61()
{
  return sub_2295E15D0();
}

void *OUTLINED_FUNCTION_62()
{
  return malloc(0x38uLL);
}

uint64_t OUTLINED_FUNCTION_63()
{
  return sub_2295E14C8();
}

uint64_t OUTLINED_FUNCTION_64(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_65(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = result;
  *(_QWORD *)(result + 24) = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_66()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_67()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_69()
{
  return _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t OUTLINED_FUNCTION_70()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;

  result = *v0;
  *(_QWORD *)(v1 + 72) = *v0;
  return result;
}

uint64_t OUTLINED_FUNCTION_76()
{
  return sub_2295E18C4();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return sub_2295E1528();
}

uint64_t OUTLINED_FUNCTION_80()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_81()
{
  return sub_2295E142C();
}

uint64_t OUTLINED_FUNCTION_82()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_83()
{
  return sub_2295E13FC();
}

void OUTLINED_FUNCTION_85(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_2295D7D18(v2, a2);
}

uint64_t OUTLINED_FUNCTION_86()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2295D1FE0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_87(uint64_t result, __int16 a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2;
  *(_BYTE *)(v2 + 9) = HIBYTE(a2) & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_89()
{
  return swift_once();
}

uint64_t OUTLINED_FUNCTION_91(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  return a2(0);
}

uint64_t OUTLINED_FUNCTION_92()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_97()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_98()
{
  return type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
}

uint64_t OUTLINED_FUNCTION_99()
{
  return sub_2295E18B8();
}

id sub_2295D8490(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  sub_2295DFBD4(a1, a2, v4);
  objc_msgSend(v4, sel_setTextAlignment_, 1);
  v5 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_, 22.0);
  objc_msgSend(v4, sel_setFont_, v5);

  return v4;
}

id StrokeData.__allocating_init(characters:strokeAnimationRepresention:strokeNames:pronunciations:)()
{
  objc_class *v0;
  id v1;

  OUTLINED_FUNCTION_0_3();
  v1 = objc_allocWithZone(v0);
  return StrokeData.init(characters:strokeAnimationRepresention:strokeNames:pronunciations:)();
}

id StrokeData.init(characters:strokeAnimationRepresention:strokeNames:pronunciations:)()
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
  char *v10;
  objc_super v12;

  OUTLINED_FUNCTION_0_3();
  v5 = OBJC_IVAR___SAStrokeDataInternal_characters;
  *(_QWORD *)&v1[OBJC_IVAR___SAStrokeDataInternal_characters] = 0;
  v6 = OBJC_IVAR___SAStrokeDataInternal_strokeNames;
  *(_QWORD *)&v1[OBJC_IVAR___SAStrokeDataInternal_strokeNames] = 0;
  v7 = OBJC_IVAR___SAStrokeDataInternal_pronunciations;
  *(_QWORD *)&v1[OBJC_IVAR___SAStrokeDataInternal_pronunciations] = 0;
  *(_QWORD *)&v1[v5] = v8;
  v9 = v1;
  swift_bridgeObjectRelease();
  v10 = &v9[OBJC_IVAR___SAStrokeDataInternal_strokeAnimationRepresention];
  *(_QWORD *)v10 = v4;
  *((_QWORD *)v10 + 1) = v3;
  *(_QWORD *)&v1[v6] = v2;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v1[v7] = v0;

  swift_bridgeObjectRelease();
  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for StrokeData();
  return objc_msgSendSuper2(&v12, sel_init);
}

uint64_t type metadata accessor for StrokeData()
{
  return objc_opt_self();
}

uint64_t sub_2295D872C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[2];

  strcpy((char *)v3, "character is:");
  HIWORD(v3[1]) = -4864;
  if (*(_QWORD *)(v0 + OBJC_IVAR___SAStrokeDataInternal_characters))
  {
    v1 = swift_bridgeObjectRetain();
    MEMORY[0x22E2CC544](v1, MEMORY[0x24BEE0D00]);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55D60);
  sub_2295E1600();
  sub_2295E1630();
  swift_bridgeObjectRelease();
  return v3[0];
}

id StrokeData.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void StrokeData.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id StrokeData.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StrokeData();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t initializeBufferWithCopyOfBuffer for StrokeAnimatingExtraInfo(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for StrokeAnimatingExtraInfo()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for StrokeAnimatingExtraInfo(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for StrokeAnimatingExtraInfo(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StrokeAnimatingExtraInfo(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StrokeAnimatingExtraInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for StrokeAnimatingExtraInfo()
{
  return &type metadata for StrokeAnimatingExtraInfo;
}

double sub_2295D8A74(uint64_t a1, uint64_t a2)
{
  double v2;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for _ProtoStrokeAnimationRepresentation(0) + 20));
  v6 = (uint64_t *)(v5
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects);
  OUTLINED_FUNCTION_0_4();
  v7 = *v6;
  if (*(_QWORD *)(*v6 + 16) <= a2
    || (v8 = v5
           + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays,
        OUTLINED_FUNCTION_0_4(),
        *(_QWORD *)(*(_QWORD *)v8 + 16) <= a2))
  {
    v2 = -100.0;
  }
  else
  {
    if (a2 < 0)
    {
      __break(1u);
      JUMPOUT(0x2295D8C00);
    }
    v9 = v7 + 16 * a2;
    v10 = *(_QWORD *)(v9 + 32);
    if (*(_BYTE *)(v9 + 40) == 1)
      __asm { BR              X10 }
    OUTLINED_FUNCTION_2_2();
    if (v10 == 4 || v10 == 3 || v10 == 2)
    {
      OUTLINED_FUNCTION_0_4();
      OUTLINED_FUNCTION_1_2();
    }
  }
  sub_2295D8C14(a1);
  return v2;
}

uint64_t sub_2295D8C14(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_bridgeObjectRetain();
}

void sub_2295D8C7C()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  objc_msgSend(v0, sel_userInterfaceIdiom);

}

double sub_2295D8CEC()
{
  id v0;
  id v1;
  double result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  result = 200.0;
  if (!v1)
    return 140.0;
  return result;
}

id sub_2295D8D5C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id result;
  void *v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15StrokeAnimation20StrokeAnimatingLayer_strokePathData] = v1;
  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for StrokeAnimatingLayer();
  swift_retain();
  v3 = objc_msgSendSuper2(&v14, sel_init);
  sub_2295D9548(0x6E41656B6F727453, 0xEF6E6F6974616D69, v3);
  v4 = OUTLINED_FUNCTION_1_3(v3, sel_setFrame_);
  v5 = OUTLINED_FUNCTION_2_3((uint64_t)v4, sel_setPath_);
  OUTLINED_FUNCTION_2_3((uint64_t)v5, sel_setStrokeColor_);
  v6 = OUTLINED_FUNCTION_2_3((uint64_t)objc_msgSend(v3, sel_setLineWidth_, *(double *)(v2 + 24), v14.receiver, v14.super_class), sel_setLineCap_);
  v7 = OUTLINED_FUNCTION_2_3((uint64_t)v6, sel_setLineJoin_);
  v8 = OUTLINED_FUNCTION_5_1((uint64_t)v7, sel_setFillColor_);
  result = OUTLINED_FUNCTION_5_1((uint64_t)v8, sel_setBackgroundColor_);
  v10 = *(void **)(v2 + 32);
  if (v10)
  {
    v11 = v10;
    v12 = sub_2295D9084((uint64_t)v11);

    objc_msgSend(v3, sel_setMask_, v12);
    v13 = v3;
    objc_msgSend(v13, sel_setStrokeEnd_, 0.0);

    swift_release();
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2295D8EEC()
{
  OUTLINED_FUNCTION_0_5();
  __break(1u);
}

void sub_2295D8F38()
{
  char *v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  double v7;
  void *v8;
  id v9;

  v1 = v0;
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC15StrokeAnimation20StrokeAnimatingLayer_strokePathData];
  v3 = *(_QWORD *)(v2 + 80);
  if (v3)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain_n();
      v4 = sub_2295E1888();
      swift_bridgeObjectRelease();
    }
    else
    {
      v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    if (v4 >= 3)
    {
      v5 = v4 - 2;
      v6 = 1;
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
    v3 = 0;
  }
  v5 = 0;
  v6 = 0;
LABEL_8:
  v7 = sub_2295CD844();
  v8 = *(void **)(v2 + 40);
  if (v8)
  {
    if ((v6 & 1) != 0)
    {
      v9 = sub_2295E0570((uint64_t)v8, v3, v3, v7);
      sub_2295D9534(v3, v5, 0);
    }
    else
    {
      v9 = sub_2295E03F0((uint64_t)v8, v3, v7);
    }

    sub_2295DFC68((uint64_t)v9, 0x656B6F7274535253, 0xE800000000000000, v1);
  }
  else
  {
    __break(1u);
  }
}

id sub_2295D9084(uint64_t a1)
{
  void *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5758]), sel_init);
  objc_msgSend(v1, sel_frame);
  objc_msgSend(v3, sel_setFrame_);

  objc_msgSend(v3, sel_setPath_, a1);
  return v3;
}

void sub_2295D9104()
{
  OUTLINED_FUNCTION_3_2();
  __break(1u);
}

void sub_2295D9138()
{
  OUTLINED_FUNCTION_3_2();
  __break(1u);
}

id sub_2295D916C()
{
  return sub_2295D94E4(type metadata accessor for StrokeAnimatingLayer);
}

uint64_t type metadata accessor for StrokeAnimatingLayer()
{
  return objc_opt_self();
}

uint64_t sub_2295D91A8()
{
  void *v0;
  void *v1;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  id v5;
  CGMutablePathRef Mutable;
  CGMutablePathRef v7;
  uint64_t v8;
  CGPath *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;
  void *v14;
  id v15;
  BOOL v16;
  id v17;
  id v18;
  id v19;
  CGPath *v20;
  void *v21;
  unint64_t v22;
  objc_super v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  v4 = v3;
  v23.receiver = v0;
  v23.super_class = (Class)type metadata accessor for StrokeContourLayer();
  v5 = objc_msgSendSuper2(&v23, sel_init);
  OUTLINED_FUNCTION_1_3(v5, sel_setFrame_);
  Mutable = CGPathCreateMutable();
  v7 = Mutable;
  v21 = v2;
  if (!(v4 >> 62))
  {
    v8 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v9 = Mutable;
    swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_3;
LABEL_11:

    swift_bridgeObjectRelease_n();
    objc_msgSend(v5, sel_setPath_, v7);
    v17 = v21;
    if (!v21)
    {
      v18 = objc_msgSend((id)objc_opt_self(), sel_systemRedColor);
      v19 = objc_msgSend(v18, sel_colorWithAlphaComponent_, 0.4);

      v17 = objc_msgSend(v19, sel_CGColor);
    }
    objc_msgSend(v5, sel_setFillColor_, v17);

    return (uint64_t)v5;
  }
LABEL_15:
  v20 = v7;
  swift_bridgeObjectRetain();
  v8 = sub_2295E1888();
  if (!v8)
    goto LABEL_11;
LABEL_3:
  v22 = v4 & 0xC000000000000001;
  v10 = 4;
  v11 = v4;
  while (1)
  {
    if (v22)
    {
      result = MEMORY[0x22E2CC6DC](v10 - 4, v4);
      v13 = result;
    }
    else
    {
      v13 = *(_QWORD *)(v4 + 8 * v10);
      result = swift_retain();
    }
    v4 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
    {
      __break(1u);
      goto LABEL_15;
    }
    v14 = *(void **)(v13 + 32);
    if (!v14)
      break;
    v25 = 0;
    v26 = 0;
    v24 = 0x3FF0000000000000;
    v27 = 0x3FF0000000000000;
    v28 = 0;
    v29 = 0;
    v15 = v14;
    sub_2295E16D8();
    swift_release();

    ++v10;
    v16 = v4 == v8;
    v4 = v11;
    if (v16)
      goto LABEL_11;
  }
  __break(1u);
  return result;
}

void sub_2295D93E8()
{
  OUTLINED_FUNCTION_0_5();
  __break(1u);
}

void sub_2295D9434()
{
  OUTLINED_FUNCTION_3_2();
  __break(1u);
}

void sub_2295D9468()
{
  OUTLINED_FUNCTION_3_2();
  __break(1u);
}

void sub_2295D949C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;

  swift_unknownObjectRetain();
  sub_2295E17F8();
  v5 = swift_unknownObjectRelease();
  a4(v5);
  JUMPOUT(0x2295D94D4);
}

id sub_2295D94D8()
{
  return sub_2295D94E4(type metadata accessor for StrokeContourLayer);
}

id sub_2295D94E4(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for StrokeContourLayer()
{
  return objc_opt_self();
}

uint64_t sub_2295D9534(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_2295D9548(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2295E15E8();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setName_, v4);

}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return sub_2295E187C();
}

id OUTLINED_FUNCTION_1_3(id a1, SEL a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  return objc_msgSend(a1, a2, v5, v4, v3, v2);
}

id OUTLINED_FUNCTION_2_3(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

id OUTLINED_FUNCTION_5_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2, 0);
}

uint64_t sub_2295D95F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v4 = v3;
  v6 = sub_2295E1354();
  v26 = *(_QWORD *)(v6 - 8);
  v27 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55DC0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2295E136C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v26 - v17;
  objc_msgSend(v4, sel_setImage_, a3);
  sub_2295E1360();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
    return sub_2295D989C((uint64_t)v11);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  sub_2295E1348();
  sub_2295E133C();
  v20 = objc_msgSend((id)objc_opt_self(), sel_sharedSession);
  v21 = (void *)sub_2295E1330();
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v4;
  aBlock[4] = sub_2295D9DF4;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2295D9E70;
  aBlock[3] = &block_descriptor_0;
  v23 = _Block_copy(aBlock);
  v24 = v4;
  swift_release();
  v25 = objc_msgSend(v20, sel_dataTaskWithRequest_completionHandler_, v21, v23);
  _Block_release(v23);

  objc_msgSend(v25, sel_resume);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v27);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

uint64_t sub_2295D989C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55DC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2295D98DC(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  id v20;
  id v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  _QWORD aBlock[6];

  v10 = sub_2295E1588();
  v11 = *(NSObject **)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2295E15A0();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    if (qword_255A55280 != -1)
      swift_once();
    v19 = sub_2295E1564();
    __swift_project_value_buffer(v19, (uint64_t)qword_255A56218);
    v20 = a4;
    v21 = a4;
    v46 = sub_2295E1558();
    v22 = sub_2295E16CC();
    if (os_log_type_enabled(v46, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v23 = 138412290;
      v25 = a4;
      v26 = _swift_stdlib_bridgeErrorToNSError();
      aBlock[0] = v26;
      sub_2295E17E0();
      *v24 = v26;

      _os_log_impl(&dword_2295CB000, v46, v22, "download Image failed:%@", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A55DD8);
      swift_arrayDestroy();
      MEMORY[0x22E2CCC94](v24, -1, -1);
      MEMORY[0x22E2CCC94](v23, -1, -1);

      return;
    }

  }
  else
  {
    v45 = v16;
    v46 = v11;
    if (a3)
    {
      objc_opt_self();
      v27 = swift_dynamicCastObjCClass();
      if (v27)
      {
        v28 = (void *)v27;
        v29 = a3;
        if ((char *)objc_msgSend(v28, sel_statusCode) - 300 >= (char *)0xFFFFFFFFFFFFFF9CLL && a2 >> 60 != 15)
        {
          sub_2295D9FD4(0, &qword_255A55DC8);
          sub_2295D9F90(a1, a2);
          sub_2295D9F90(a1, a2);
          v44 = a1;
          v31 = sub_2295D9DFC(a1, a2);
          if (v31)
          {
            v32 = v31;
            v42 = a2;
            sub_2295D9FD4(0, (unint64_t *)&unk_255A552B0);
            v43 = sub_2295E172C();
            v33 = swift_allocObject();
            *(_QWORD *)(v33 + 16) = a5;
            *(_QWORD *)(v33 + 24) = v32;
            aBlock[4] = sub_2295DA038;
            aBlock[5] = v33;
            aBlock[0] = MEMORY[0x24BDAC760];
            aBlock[1] = 1107296256;
            aBlock[2] = sub_2295DA2CC;
            aBlock[3] = &block_descriptor_6;
            v34 = _Block_copy(aBlock);
            v35 = a5;
            v36 = v32;
            swift_release();
            sub_2295E1594();
            aBlock[0] = MEMORY[0x24BEE4AF8];
            sub_2295DA048();
            __swift_instantiateConcreteTypeFromMangledName(&qword_255A55DD0);
            sub_2295DA088();
            sub_2295E1804();
            v37 = (void *)v43;
            MEMORY[0x22E2CC5F8](0, v18, v13, v34);

            _Block_release(v34);
            sub_2295D9F38(v44, v42);
            ((void (*)(char *, uint64_t))v46[1].isa)(v13, v10);
            (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v45);
            return;
          }
          sub_2295D9F38(v44, a2);
        }

      }
    }
    if (qword_255A55280 != -1)
      swift_once();
    v38 = sub_2295E1564();
    __swift_project_value_buffer(v38, (uint64_t)qword_255A56218);
    v46 = sub_2295E1558();
    v39 = sub_2295E16CC();
    if (os_log_type_enabled(v46, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_2295CB000, v46, v39, "image is nil or invalid image data.", v40, 2u);
      MEMORY[0x22E2CCC94](v40, -1, -1);
    }
  }

}

uint64_t sub_2295D9DD0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2295D9DF4(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v4;

  sub_2295D98DC(a1, a2, a3, a4, *(void **)(v4 + 16));
}

id sub_2295D9DFC(uint64_t a1, unint64_t a2)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_2295E1384();
  v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_2295D9F4C(a1, a2);

  return v6;
}

uint64_t sub_2295D9E70(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  void (*v7)(void *, unint64_t, void *, void *);
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;

  v6 = a2;
  v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v8 = v6;
    v6 = (void *)sub_2295E1390();
    v10 = v9;

  }
  else
  {
    swift_retain();
    v10 = 0xF000000000000000;
  }
  v11 = a3;
  v12 = a4;
  v7(v6, v10, a3, a4);

  sub_2295D9F38((uint64_t)v6, v10);
  return swift_release();
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

uint64_t sub_2295D9F38(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2295D9F4C(a1, a2);
  return a1;
}

uint64_t sub_2295D9F4C(uint64_t a1, unint64_t a2)
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

uint64_t sub_2295D9F90(uint64_t a1, unint64_t a2)
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

uint64_t sub_2295D9FD4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2295DA00C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_2295DA038()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setImage_, *(_QWORD *)(v0 + 24));
}

unint64_t sub_2295DA048()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A55E90;
  if (!qword_255A55E90)
  {
    v1 = sub_2295E1588();
    result = MEMORY[0x22E2CCC34](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_255A55E90);
  }
  return result;
}

unint64_t sub_2295DA088()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A55EA0;
  if (!qword_255A55EA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A55DD0);
    result = MEMORY[0x22E2CCC34](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255A55EA0);
  }
  return result;
}

uint64_t sub_2295DA0D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_2295E1564();
  __swift_allocate_value_buffer(v0, qword_255A56218);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255A56218);
  if (qword_255A55290 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255A56230);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_2295DA164()
{
  uint64_t result;

  sub_2295DA290();
  result = sub_2295E17C8();
  qword_255A55DE0 = result;
  return result;
}

uint64_t sub_2295DA1C0()
{
  uint64_t v0;
  id v1;

  v0 = sub_2295E1564();
  __swift_allocate_value_buffer(v0, qword_255A56230);
  __swift_project_value_buffer(v0, (uint64_t)qword_255A56230);
  if (qword_255A55288 != -1)
    swift_once();
  v1 = (id)qword_255A55DE0;
  return sub_2295E1570();
}

uint64_t sub_2295DA240()
{
  uint64_t result;

  sub_2295DA290();
  result = sub_2295E17C8();
  qword_255A56248 = result;
  return result;
}

unint64_t sub_2295DA290()
{
  unint64_t result;

  result = qword_255A55DE8;
  if (!qword_255A55DE8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A55DE8);
  }
  return result;
}

uint64_t sub_2295DA2CC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = OUTLINED_FUNCTION_29_0();
  v1(v2);
  return swift_release();
}

void StrokeView.__allocating_init(with:frame:)()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_36_0();
  StrokeView.init(with:frame:)();
}

void StrokeView.init(with:frame:)()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;

  OUTLINED_FUNCTION_5_2();
  v32 = v1;
  OUTLINED_FUNCTION_23_0();
  v2 = OUTLINED_FUNCTION_44_0();
  v30 = *(_QWORD *)(v2 - 8);
  v31 = v2;
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_31_0();
  v29 = v3;
  OUTLINED_FUNCTION_21_0();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_15_0();
  sub_2295E15A0();
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_19_0();
  *(_QWORD *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers] = 0;
  v7 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView;
  v8 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v9 = v0;
  *(_QWORD *)&v0[v7] = objc_msgSend(v8, sel_init);
  v10 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView;
  *(_QWORD *)&v9[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v11 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView;
  *(_QWORD *)&v9[v11] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_init);
  v12 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData;
  v13 = objc_allocWithZone((Class)OUTLINED_FUNCTION_46_0());
  v14 = OUTLINED_FUNCTION_4_2();
  *(_QWORD *)&v9[v12] = v14;
  *(_QWORD *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel] = 0;
  v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeContourLayer] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor] = 0;
  v15 = &v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageUrl];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v16 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_queue;
  OUTLINED_FUNCTION_12_0((uint64_t)v14, (unint64_t *)&unk_255A552B0);
  sub_2295E1594();
  v33 = MEMORY[0x24BEE4AF8];
  sub_2295DFFE4((unint64_t *)&qword_255A55E70, v4, MEMORY[0x24BEE5698]);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_24_0((unint64_t *)&qword_255A55E80);
  sub_2295E1804();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v30 + 104))(v29, *MEMORY[0x24BEE5750], v31);
  OUTLINED_FUNCTION_41_0();
  *(_QWORD *)&v9[v16] = sub_2295E1744();
  *(_QWORD *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_timers] = MEMORY[0x24BEE4AF8];
  v17 = *(void **)&v9[v12];
  *(_QWORD *)&v9[v12] = v32;
  v18 = v32;

  if (qword_255A55280 != -1)
    swift_once();
  v19 = OUTLINED_FUNCTION_45_0();
  __swift_project_value_buffer(v19, (uint64_t)qword_255A56218);
  v20 = v18;
  v21 = sub_2295E1558();
  v22 = sub_2295E16C0();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)OUTLINED_FUNCTION_26_0();
    v33 = OUTLINED_FUNCTION_26_0();
    *(_DWORD *)v23 = 136315138;
    v24 = sub_2295D872C();
    sub_2295DF414(v24, v25, &v33);
    sub_2295E17E0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2295CB000, v21, v22, "strokeData is:%s", v23, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8_0();
  }

  v27 = (char *)OUTLINED_FUNCTION_13_0(v26, sel_initWithFrame_);
  sub_2295DA784();
  sub_2295DA8A4();
  sub_2295DBAD0();
  if (*(_QWORD *)&v27[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos])
  {
    v28 = OUTLINED_FUNCTION_27_0();
    sub_2295DBC3C(v28);
    OUTLINED_FUNCTION_18_0();
  }
  sub_2295DC084();

  OUTLINED_FUNCTION_6_0();
}

void sub_2295DA784()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v1 = v0;
  sub_2295DCA84(1);
  sub_2295E00C8(0, (unint64_t *)&unk_255A56070);
  v2 = sub_2295D8490(0, 0xE000000000000000);
  objc_msgSend(v2, sel_setFrame_, 0.0, 20.0, sub_2295D8CEC(), 40.0);
  objc_msgSend(v1, sel_addSubview_, v2);
  v3 = *(void **)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel];
  *(_QWORD *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel] = v2;
  v8 = v2;

  v4 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView;
  v5 = *(id *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView];
  v6 = sub_2295D8CEC();
  sub_2295D8CEC();
  objc_msgSend(v5, sel_setFrame_, 0.0, 65.0, v6, v7);

  objc_msgSend(v1, sel_addSubview_, *(_QWORD *)&v1[v4]);
}

void sub_2295DA8A4()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  uint64_t *v48;
  uint8_t *v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  id v60;
  CFDataRef v61;
  const __CFData *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  uint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  unint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  BOOL v101;
  uint64_t v102;
  id v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  id v109;
  id v110;
  double v111;
  uint64_t v112;
  double v113;
  uint64_t v114;
  _QWORD *v115;
  void *v116;
  id v117;
  void *v118;
  uint64_t v119;
  double v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  _QWORD *v133;
  unint64_t v134;
  void *v135;
  uint64_t v136;
  int EnumTagSinglePayload;
  const __CFData *v138;
  unint64_t v139;
  void *v140;
  uint64_t *v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  _QWORD *v147;
  unint64_t v148;
  uint64_t v149;
  const __CFData *v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  _QWORD *v156;
  char *v157;
  uint64_t v158;
  _QWORD *v159;
  int64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  unint64_t v167;
  uint64_t v168;
  _DWORD *v169;
  unint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  char *v175;
  uint64_t v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  _QWORD *v180;
  char *v181;
  uint64_t v182;
  uint64_t *v183;
  uint64_t v184;
  _OWORD v185[2];
  uint64_t v186;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55610);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v175 = (char *)&v148 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v173 = (uint64_t)&v148 - v4;
  MEMORY[0x24BDAC7A8](v3);
  v181 = (char *)&v148 - v5;
  v6 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v148 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v148 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v148 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A55510);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v148 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(0);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (uint64_t *)((char *)&v148 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = sub_2295E13CC();
  MEMORY[0x24BDAC7A8](v22);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A56058);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v148 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v29 = MEMORY[0x24BDAC7A8](v28);
  if (*(_QWORD *)(v182 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos))
    return;
  v171 = v32;
  v172 = (uint64_t)v25;
  v174 = v29;
  v176 = v31;
  v177 = v17;
  v155 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos;
  v156 = v12;
  v183 = v21;
  v179 = v19;
  v180 = v14;
  v178 = v6;
  v157 = v9;
  v163 = (uint64_t)&v148 - v30;
  swift_bridgeObjectRetain();
  v33 = sub_2295E1378();
  v35 = v34;
  swift_bridgeObjectRelease();
  if (v35 >> 60 == 15)
  {
    if (qword_255A55280 != -1)
      goto LABEL_95;
    goto LABEL_4;
  }
  v186 = 0;
  memset(v185, 0, sizeof(v185));
  sub_2295D9F90(v33, v35);
  sub_2295E13C0();
  sub_2295DFFE4((unint64_t *)&qword_255A56060, type metadata accessor for _ProtoStrokeAnimationRepresentation, (uint64_t)&protocol conformance descriptor for _ProtoStrokeAnimationRepresentation);
  v39 = v172;
  v153 = v33;
  v154 = v35;
  v40 = v174;
  sub_2295E1480();
  __swift_storeEnumTagSinglePayload(v39, 0, 1, v40);
  v41 = v163;
  sub_2295E009C(v39, v163, type metadata accessor for _ProtoStrokeAnimationRepresentation);
  if (qword_255A55280 != -1)
    swift_once();
  v42 = sub_2295E1564();
  v43 = __swift_project_value_buffer(v42, (uint64_t)qword_255A56218);
  v44 = v171;
  sub_2295E0020(v41, v171, type metadata accessor for _ProtoStrokeAnimationRepresentation);
  v45 = sub_2295E1558();
  v46 = sub_2295E16C0();
  v47 = os_log_type_enabled(v45, v46);
  v48 = v183;
  if (v47)
  {
    v49 = (uint8_t *)swift_slowAlloc();
    v170 = swift_slowAlloc();
    *(_QWORD *)&v185[0] = v170;
    *(_DWORD *)v49 = 136315138;
    v169 = v49 + 4;
    v172 = v43;
    v50 = v49;
    v51 = v174;
    v52 = sub_2295E148C();
    v184 = sub_2295DF414(v52, v53, (uint64_t *)v185);
    sub_2295E17E0();
    swift_bridgeObjectRelease();
    sub_2295E0074(v44, type metadata accessor for _ProtoStrokeAnimationRepresentation);
    _os_log_impl(&dword_2295CB000, v45, v46, "strokeAnimation is:%s", v50, 0xCu);
    v54 = v170;
    swift_arrayDestroy();
    MEMORY[0x22E2CCC94](v54, -1, -1);
    MEMORY[0x22E2CCC94](v50, -1, -1);

  }
  else
  {
    sub_2295E0074(v44, type metadata accessor for _ProtoStrokeAnimationRepresentation);

    v51 = v174;
  }
  v55 = v163;
  v174 = *(int *)(v51 + 20);
  v56 = *(_QWORD **)(v163 + v174);
  swift_beginAccess();
  if (!*(_QWORD *)(v56[2] + 16))
  {
    __break(1u);
    goto LABEL_97;
  }
  swift_bridgeObjectRetain();
  v57 = sub_2295E1378();
  v59 = v58;
  swift_bridgeObjectRelease();
  if (v59 >> 60 == 15)
  {
    __break(1u);
    goto LABEL_103;
  }
  sub_2295E00C8(0, &qword_255A56068);
  sub_2295D9F90(v57, v59);
  v151 = v57;
  v60 = sub_2295DD59C(v57, v59);
  v61 = sub_2295CE91C(v60);

  if (!v61)
  {
LABEL_103:
    __break(1u);
    return;
  }
  v62 = v61;
  sub_2295CE9A0();
  v64 = v63;
  v150 = v62;

  swift_beginAccess();
  v65 = v56[3];
  if (!*(_QWORD *)(v65 + 16))
  {
    swift_bridgeObjectRelease();
    v76 = sub_2295E1558();
    v77 = sub_2295E16B4();
    if (os_log_type_enabled(v76, v77))
    {
      v78 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v78 = 0;
      _os_log_impl(&dword_2295CB000, v76, v77, "no animation points, so just render contour path", v78, 2u);
      MEMORY[0x22E2CCC94](v78, -1, -1);
    }

    sub_2295D9F38(v151, v59);
    sub_2295D9F38(v153, v154);
LABEL_90:
    sub_2295E0074(v55, type metadata accessor for _ProtoStrokeAnimationRepresentation);
    return;
  }
  v148 = v59;
  swift_beginAccess();
  v66 = v56[4];
  swift_beginAccess();
  v67 = v56[6];
  swift_beginAccess();
  v68 = v56[7];
  v69 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v149 = v65;
  swift_bridgeObjectRetain();
  v164 = v66;
  swift_bridgeObjectRetain();
  v161 = v67;
  swift_bridgeObjectRetain();
  v162 = v68;
  swift_bridgeObjectRetain();
  v152 = v69;
  v70 = objc_msgSend(v69, sel_sharedPreferences);
  v71 = v64;
  v72 = objc_msgSend(v70, sel_outputVoice);

  v172 = v71;
  if (v72)
  {
    v73 = objc_msgSend(v72, sel_VSSpeechGender);

    v56 = v180;
    if (v73 == (id)1)
    {
      v171 = 100;
      v74 = v179;
      v71 = v172;
      v75 = v148;
      if (v172 < 0)
      {
        v79 = v175;
        goto LABEL_101;
      }
      v79 = v175;
    }
    else
    {
      v101 = v73 == (id)2;
      v74 = v179;
      v75 = v148;
      if (v101)
        v80 = 200;
      else
        v80 = 150;
      v171 = v80;
      v79 = v175;
      v71 = v172;
      if (v172 < 0)
        goto LABEL_101;
    }
  }
  else
  {
    v171 = 150;
    v56 = v180;
    if (v71 < 0)
      goto LABEL_99;
    v79 = v175;
    v74 = v179;
    v75 = v148;
  }
  if ((v71 & 0x4000000000000000) != 0)
    goto LABEL_101;
  v81 = *(_QWORD *)((v71 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v82 = v182;
    if (!v81)
    {
      v129 = v75;
      swift_bridgeObjectRelease();
      v126 = v172;
      swift_bridgeObjectRelease();
      v128 = (uint64_t)v157;
      v127 = (uint64_t)v79;
LABEL_80:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v82 + v155) = v126;
      swift_bridgeObjectRelease();
      v130 = *(_QWORD *)(v55 + v174)
           + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
      swift_beginAccess();
      v131 = v173;
      sub_2295D1EF8(v130, v173);
      v132 = v178;
      if (__swift_getEnumTagSinglePayload(v131, 1, v178) == 1)
      {
        v133 = v156;
        *v156 = 0;
        v133[1] = 0xE000000000000000;
        v133[2] = 0;
        v133[3] = 0;
        *((_BYTE *)v133 + 32) = 1;
        _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
        sub_2295E004C(v131, &qword_255A55610);
      }
      else
      {
        v133 = v156;
        sub_2295E009C(v131, (uint64_t)v156, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
      }
      v134 = (unint64_t)_ProtoStrokeAnimationRepresentation.Color.toUIColor()();
      sub_2295E0074((uint64_t)v133, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
      v135 = *(void **)(v82 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor);
      *(_QWORD *)(v82 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor) = v134;

      v136 = *(_QWORD *)(v55 + v174)
           + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
      swift_beginAccess();
      sub_2295D1EF8(v136, v127);
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v127, 1, v132);
      v138 = v150;
      if (EnumTagSinglePayload == 1)
      {
        *(_QWORD *)v128 = 0;
        *(_QWORD *)(v128 + 8) = 0xE000000000000000;
        *(_QWORD *)(v128 + 16) = 0;
        *(_QWORD *)(v128 + 24) = 0;
        *(_BYTE *)(v128 + 32) = 1;
        _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
        sub_2295E004C(v127, &qword_255A55610);
      }
      else
      {
        sub_2295E009C(v127, v128, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
      }
      v139 = (unint64_t)_ProtoStrokeAnimationRepresentation.Color.toUIColor()();
      sub_2295E0074(v128, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
      v140 = *(void **)(v82 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView);
      *(_QWORD *)(v82 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView) = v139;

      v141 = (uint64_t *)(*(_QWORD *)(v55 + v174)
                       + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
      swift_beginAccess();
      v143 = *v141;
      v142 = v141[1];
      swift_bridgeObjectRetain();

      sub_2295D9F38(v151, v129);
      sub_2295D9F38(v153, v154);
      swift_bridgeObjectRelease();
      v144 = HIBYTE(v142) & 0xF;
      if ((v142 & 0x2000000000000000) == 0)
        v144 = v143 & 0xFFFFFFFFFFFFLL;
      if (v144)
      {
        v146 = *v141;
        v145 = v141[1];
        swift_bridgeObjectRetain();
        sub_2295E0074(v55, type metadata accessor for _ProtoStrokeAnimationRepresentation);
        v147 = (_QWORD *)(v82 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageUrl);
        *v147 = v146;
        v147[1] = v145;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_90;
    }
    v83 = v81;
    v84 = v81 - 1;
    if (v81 < 1)
    {
LABEL_97:
      __break(1u);
      goto LABEL_98;
    }
    v85 = (uint64_t)v177;
    if (v84 < *(_QWORD *)(v149 + 16))
      break;
LABEL_98:
    __break(1u);
LABEL_99:
    v79 = v175;
    v75 = v148;
LABEL_101:
    swift_bridgeObjectRetain();
    v74 = v179;
    v81 = sub_2295E1888();
  }
  v86 = 0;
  v170 = v172 & 0xC000000000000001;
  v87 = *(_QWORD *)(v164 + 16);
  v169 = (_DWORD *)(v149 + ((*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80)));
  v160 = v87 - 1;
  v88 = *(_QWORD *)(v162 + 16);
  v167 = v87;
  v168 = v88;
  v158 = v161 + 32;
  v159 = v56 + 2;
  v166 = *(_QWORD *)(v161 + 16);
  v89 = (_QWORD *)(v164 + 56);
  v165 = v83;
  while (1)
  {
    if (v170)
    {
      v90 = MEMORY[0x22E2CC6DC](v86, v172);
    }
    else
    {
      v90 = *(_QWORD *)(v172 + 8 * v86 + 32);
      swift_retain();
    }
    sub_2295E0020((uint64_t)v169 + *(_QWORD *)(v74 + 72) * v86, (uint64_t)v48, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
    if (!v168)
    {
      v95 = type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
      v93 = v85;
      v94 = 1;
      goto LABEL_42;
    }
    v91 = v162;
    if (v86 >= *(_QWORD *)(v162 + 16))
      break;
    v92 = type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
    sub_2295E0020(v91+ ((*(unsigned __int8 *)(*(_QWORD *)(v92 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v92 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v92 - 8) + 72) * v86, v85, type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
    v93 = v85;
    v94 = 0;
    v95 = v92;
LABEL_42:
    __swift_storeEnumTagSinglePayload(v93, v94, 1, v95);
    v96 = v86 + 1;
    v97 = v183;
    sub_2295CD304(v183, v85);
    sub_2295E004C(v85, &qword_255A55510);
    sub_2295E0074((uint64_t)v97, type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
    *(_QWORD *)(v90 + 88) = v171;
    v98 = v55;
    v99 = (uint64_t)v181;
    if (v86 < v167)
    {
      if (v86 >= *(_QWORD *)(v164 + 16))
        goto LABEL_92;
      v100 = *(v89 - 2);
      *(_QWORD *)(v90 + 64) = *(v89 - 3);
      *(_QWORD *)(v90 + 72) = v100;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if ((uint64_t)v86 < v160)
      {
        if (v96 >= *(_QWORD *)(v164 + 16))
          goto LABEL_94;
        v101 = *(v89 - 1) == 68 && *v89 == 0xE100000000000000;
        if (v101 || (sub_2295E18AC() & 1) != 0)
          v102 = 50;
        else
          v102 = 0;
        swift_bridgeObjectRetain();
        v103 = objc_msgSend(v152, sel_sharedPreferences);
        v104 = objc_msgSend(v103, sel_outputVoice);

        if (v104)
        {
          v105 = objc_msgSend(v104, sel_VSSpeechGender);
          swift_bridgeObjectRelease();

          if (v105 != (id)1)
          {
            v56 = v180;
            if (v105 == (id)2)
              v106 = 200;
            else
              v106 = 150;
            v107 = v106 - v102;
            v98 = v163;
            goto LABEL_62;
          }
          v107 = 100 - v102;
        }
        else
        {
          swift_bridgeObjectRelease();
          v107 = 150;
        }
        v98 = v163;
        v56 = v180;
LABEL_62:
        *(_QWORD *)(v90 + 88) = v107;
      }
    }
    if (v86 < v166)
    {
      if (v86 >= *(_QWORD *)(v161 + 16))
        goto LABEL_93;
      v108 = *(double *)(v158 + 8 * v86);
      if (v108 > 0.0)
      {
        v109 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
        v110 = objc_msgSend(v109, sel_userInterfaceIdiom);

        v111 = v108 * 1.42857143;
        v101 = v110 == 0;
        v56 = v180;
        if (v101)
          v111 = v108;
        *(double *)(v90 + 24) = v111;
      }
    }
    v112 = *(_QWORD *)(v98 + v174);
    swift_beginAccess();
    v113 = *(double *)(v112 + 40);
    if (v113 > 0.0)
      *(double *)(v90 + 96) = v113;
    v114 = v112
         + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
    swift_beginAccess();
    sub_2295D1EF8(v114, v99);
    if (__swift_getEnumTagSinglePayload(v99, 1, v178) == 1)
    {
      *v56 = 0;
      v56[1] = 0xE000000000000000;
      v115 = v159;
      *v159 = 0;
      v115[1] = 0;
      *((_BYTE *)v56 + 32) = 1;
      _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
      sub_2295E004C(v99, &qword_255A55610);
    }
    else
    {
      sub_2295E009C(v99, (uint64_t)v56, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
    }
    v116 = (void *)_ProtoStrokeAnimationRepresentation.Color.toUIColor()();
    sub_2295E0074((uint64_t)v56, type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
    if (v116)
    {
      v117 = objc_msgSend(v116, sel_CGColor);

      v118 = *(void **)(v90 + 16);
      *(_QWORD *)(v90 + 16) = v117;
      v56 = v180;

    }
    v55 = v98;
    v119 = v176;
    sub_2295E0020(v98, v176, type metadata accessor for _ProtoStrokeAnimationRepresentation);
    v120 = sub_2295D8A74(v119, v86);
    v121 = *(_QWORD *)(v90 + 104);
    v122 = *(_QWORD *)(v90 + 112);
    v123 = *(_QWORD *)(v90 + 120);
    *(_QWORD *)(v90 + 104) = v124;
    *(double *)(v90 + 112) = v120;
    *(_QWORD *)(v90 + 120) = v125;
    sub_2295CE10C(v121, v122, v123);
    swift_release();
    v89 += 2;
    ++v86;
    v101 = v165 == v96;
    v85 = (uint64_t)v177;
    v74 = v179;
    v48 = v183;
    if (v101)
    {
      swift_bridgeObjectRelease();
      v126 = v172;
      swift_bridgeObjectRelease();
      v82 = v182;
      v127 = (uint64_t)v175;
      v128 = (uint64_t)v157;
      v129 = v148;
      goto LABEL_80;
    }
  }
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  swift_once();
LABEL_4:
  v36 = sub_2295E1564();
  __swift_project_value_buffer(v36, (uint64_t)qword_255A56218);
  v183 = (uint64_t *)sub_2295E1558();
  v37 = sub_2295E16CC();
  if (os_log_type_enabled((os_log_t)v183, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v38 = 0;
    _os_log_impl(&dword_2295CB000, (os_log_t)v183, v37, "invalid strokeData", v38, 2u);
    MEMORY[0x22E2CCC94](v38, -1, -1);
  }

}

void sub_2295DBAD0()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v1 = *(_QWORD **)(*(_QWORD *)(v0 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData)
                  + OBJC_IVAR___SAStrokeDataInternal_pronunciations);
  if (v1 && v1[2])
  {
    v2 = *(void **)(v0 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel);
    if (v2)
    {
      v4 = v1[4];
      v3 = v1[5];
      swift_bridgeObjectRetain();
      v5 = v2;
      sub_2295DFBD4(v4, v3, v5);

      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_2295DCE08();
    v6 = *(id *)(v0 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView);
    v7 = sub_2295D8CEC();
    sub_2295D8CEC();
    objc_msgSend(v6, sel_setFrame_, 0.0, 40.0, v7, v8);

  }
  v9 = *(void **)(v0 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView);
  if (v9)
  {
    v10 = *(void **)(v0 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer);
    if (v10)
    {
      v13 = v9;
      v11 = v10;
      v12 = objc_msgSend(v13, sel_CGColor);
      objc_msgSend(v11, sel_setFillColor_, v12);

    }
  }
}

uint64_t sub_2295DBC3C(unint64_t a1)
{
  uint64_t v1;
  __objc2_meth *v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v31;

  v3 = v1;
  v5 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView;
  v6 = sub_2295DFD20(objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                                           + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView), sel_layer)));
  if (v6)
  {
    v7 = v6;
    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      v8 = sub_2295E1888();
      if (v8)
        goto LABEL_4;
    }
    else
    {
      v8 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v8)
      {
LABEL_4:
        if (v8 < 1)
          goto LABEL_35;
        for (i = 0; i != v8; ++i)
        {
          if ((v7 & 0xC000000000000001) != 0)
            v10 = (id)MEMORY[0x22E2CC6DC](i, v7);
          else
            v10 = *(id *)(v7 + 8 * i + 32);
          v11 = v10;
          objc_msgSend(v10, sel_removeFromSuperlayer);

        }
      }
    }
    swift_bridgeObjectRelease_n();
  }
  sub_2295D8CEC();
  sub_2295D8CEC();
  v12 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor;
  v13 = *(void **)(v3 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor);
  v2 = &stru_24F258000;
  if (!v13)
  {
LABEL_19:
    v22 = objc_allocWithZone((Class)type metadata accessor for StrokeContourLayer());
    swift_bridgeObjectRetain();
    v23 = sub_2295D91A8();
    v24 = objc_msgSend(*(id *)(v3 + v5), sel_layer);
    objc_msgSend(v24, sel_addSublayer_, v23);

    v8 = *(_QWORD *)(v3 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeContourLayer);
    *(_QWORD *)(v3 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeContourLayer) = v23;
    goto LABEL_20;
  }
  sub_2295E00C8(0, &qword_255A56020);
  v14 = objc_opt_self();
  v8 = v13;
  v15 = objc_msgSend((id)v14, sel_clearColor);
  LOBYTE(v14) = sub_2295E17BC();

  if ((v14 & 1) == 0)
  {

    v20 = *(void **)(v3 + v12);
    if (v20)
      v21 = objc_msgSend(v20, sel_CGColor);
    goto LABEL_19;
  }
  if (qword_255A55280 != -1)
    goto LABEL_36;
  while (1)
  {
    v16 = sub_2295E1564();
    __swift_project_value_buffer(v16, (uint64_t)qword_255A56218);
    v17 = sub_2295E1558();
    v18 = sub_2295E16B4();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2295CB000, v17, v18, "no contour color for stroke animation!", v19, 2u);
      MEMORY[0x22E2CCC94](v19, -1, -1);
    }

LABEL_20:
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v8 = sub_2295E1888();
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v25 = MEMORY[0x24BEE4AF8];
    if (!v8)
      break;
    v31 = MEMORY[0x24BEE4AF8];
    sub_2295E184C();
    if ((v8 & 0x8000000000000000) == 0)
    {
      v26 = 0;
      do
      {
        if ((a1 & 0xC000000000000001) != 0)
          MEMORY[0x22E2CC6DC](v26, a1);
        else
          swift_retain();
        ++v26;
        v27 = objc_allocWithZone((Class)type metadata accessor for StrokeAnimatingLayer());
        swift_retain();
        v28 = sub_2295D8D5C();
        v29 = objc_msgSend(*(id *)(v3 + v5), sel_layer);
        objc_msgSend(v29, v2[70].name, v28);
        swift_release();

        sub_2295E1834();
        sub_2295E1858();
        sub_2295E1864();
        sub_2295E1840();
      }
      while (v8 != v26);
      v25 = v31;
      break;
    }
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_once();
  }
  *(_QWORD *)(v3 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers) = v25;
  return swift_bridgeObjectRelease();
}

void sub_2295DC084()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD aBlock[6];
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers);
  if (v1)
  {
    v18 = 150;
    v19 = 0;
    if (v1 >> 62)
      goto LABEL_25;
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_38_0();
    if (v2)
    {
      while (1)
      {
        v15 = v2 - 1;
        if (v2 < 1)
          break;
        v3 = 0;
        v4 = 0;
        v5 = *(NSObject **)(v16 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_queue);
        while (1)
        {
          if ((v1 & 0xC000000000000001) != 0)
            OUTLINED_FUNCTION_40_0();
          v6 = *(id *)(v1 + 8 * v4 + 32);
          v7 = OUTLINED_FUNCTION_14_0();
          swift_unknownObjectWeakInit();
          v8 = (_QWORD *)OUTLINED_FUNCTION_14_0();
          v8[2] = v7;
          v8[3] = &v19;
          v8[4] = &v18;
          v8[5] = v6;
          v8[6] = v1;
          OUTLINED_FUNCTION_27_0();
          swift_retain();
          v9 = v6;
          sub_2295DFF24((uint64_t)v3);
          v10 = OUTLINED_FUNCTION_14_0();
          *(_QWORD *)(v10 + 16) = sub_2295DFF14;
          *(_QWORD *)(v10 + 24) = v8;
          aBlock[4] = sub_2295DFF44;
          aBlock[5] = v10;
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_2295DDE84;
          aBlock[3] = &block_descriptor_12;
          v11 = _Block_copy(aBlock);
          OUTLINED_FUNCTION_29_0();
          swift_release();
          swift_release();
          dispatch_sync(v5, v11);
          _Block_release(v11);
          LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
          OUTLINED_FUNCTION_43_0();
          if ((v11 & 1) != 0)
            break;
          OUTLINED_FUNCTION_29_0();
          v12 = sub_2295CD844();
          OUTLINED_FUNCTION_43_0();
          v13 = v12 * 1000.0;
          if ((~COERCE__INT64(v12 * 1000.0) & 0x7FF0000000000000) == 0)
            goto LABEL_20;
          if (v13 <= -9.22337204e18)
            goto LABEL_21;
          if (v13 >= 9.22337204e18)
            goto LABEL_22;
          if (__OFADD__(v19, (uint64_t)v13))
            goto LABEL_23;
          v19 += (uint64_t)v13;
          OUTLINED_FUNCTION_29_0();

          v14 = sub_2295CD8AC();
          OUTLINED_FUNCTION_43_0();
          if (__OFADD__(v18, v14))
            goto LABEL_24;
          v18 += v14;
          if (v15 == v4)
          {
            swift_release();
            goto LABEL_17;
          }
          ++v4;
          v3 = sub_2295DFF14;
        }
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        OUTLINED_FUNCTION_38_0();
        v2 = sub_2295E1888();
        if (!v2)
          goto LABEL_17;
      }
      __break(1u);
    }
    else
    {
LABEL_17:
      swift_bridgeObjectRelease_n();
    }
  }
}

id StrokeView.__allocating_init(frame:)()
{
  Class v0;
  id v1;
  double v2;
  id v3;
  SEL v4;

  OUTLINED_FUNCTION_5_2();
  v1 = objc_allocWithZone(v0);
  v2 = OUTLINED_FUNCTION_36_0();
  return objc_msgSend(v3, v4, v2);
}

void StrokeView.init(frame:)()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_23_0();
  v1 = OUTLINED_FUNCTION_44_0();
  v21 = *(_QWORD *)(v1 - 8);
  v22 = v1;
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_31_0();
  v20 = v2;
  OUTLINED_FUNCTION_21_0();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_19_0();
  *(_QWORD *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers] = 0;
  v6 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView;
  v7 = OUTLINED_FUNCTION_25_0();
  v8 = v0;
  *(_QWORD *)&v0[v6] = objc_msgSend(v7, sel_init);
  v9 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView;
  v10 = OUTLINED_FUNCTION_25_0();
  *(_QWORD *)&v8[v9] = OUTLINED_FUNCTION_17_0(v10);
  v11 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView;
  *(_QWORD *)&v8[v11] = OUTLINED_FUNCTION_17_0(objc_allocWithZone(MEMORY[0x24BEBD668]));
  v12 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData;
  v13 = objc_allocWithZone((Class)OUTLINED_FUNCTION_46_0());
  v14 = OUTLINED_FUNCTION_4_2();
  *(_QWORD *)&v8[v12] = v14;
  *(_QWORD *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel] = 0;
  v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeContourLayer] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor] = 0;
  v15 = &v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageUrl];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v16 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_queue;
  OUTLINED_FUNCTION_12_0((uint64_t)v14, (unint64_t *)&unk_255A552B0);
  sub_2295E1594();
  v17 = MEMORY[0x24BEE4AF8];
  sub_2295DFFE4((unint64_t *)&qword_255A55E70, v3, MEMORY[0x24BEE5698]);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_24_0((unint64_t *)&qword_255A55E80);
  sub_2295E1804();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v21 + 104))(v20, *MEMORY[0x24BEE5750], v22);
  OUTLINED_FUNCTION_41_0();
  *(_QWORD *)&v8[v16] = sub_2295E1744();
  *(_QWORD *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_timers] = v17;

  v19 = OUTLINED_FUNCTION_13_0(v18, sel_initWithFrame_);
  sub_2295DA784();
  sub_2295DC6BC();

  OUTLINED_FUNCTION_6_0();
}

void sub_2295DC6BC()
{
  void *v0;
  id v1;
  id v2;
  _QWORD v3[4];

  v3[3] = swift_getObjectType();
  v3[0] = v0;
  objc_allocWithZone(MEMORY[0x24BEBDA20]);
  v1 = v0;
  v2 = sub_2295DF280(v3, (uint64_t)sel__didTapView_);
  objc_msgSend(v1, sel_addGestureRecognizer_, v2);

}

void StrokeView.__allocating_init(coder:)()
{
  void *v0;

  objc_msgSend(OUTLINED_FUNCTION_39_0(), sel_initWithCoder_, v0);

  OUTLINED_FUNCTION_10_0();
}

void StrokeView.init(coder:)()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = OUTLINED_FUNCTION_44_0();
  v19 = *(_QWORD *)(v2 - 8);
  v20 = v2;
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_31_0();
  v18 = v3;
  OUTLINED_FUNCTION_21_0();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_19_0();
  *(_QWORD *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers] = 0;
  v7 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView;
  v8 = OUTLINED_FUNCTION_25_0();
  *(_QWORD *)&v1[v7] = OUTLINED_FUNCTION_17_0(v8);
  v9 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView;
  v10 = OUTLINED_FUNCTION_25_0();
  *(_QWORD *)&v1[v9] = OUTLINED_FUNCTION_17_0(v10);
  v11 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView;
  *(_QWORD *)&v1[v11] = OUTLINED_FUNCTION_17_0(objc_allocWithZone(MEMORY[0x24BEBD668]));
  v12 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData;
  v13 = objc_allocWithZone((Class)OUTLINED_FUNCTION_46_0());
  v14 = OUTLINED_FUNCTION_4_2();
  *(_QWORD *)&v1[v12] = v14;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel] = 0;
  v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeContourLayer] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor] = 0;
  v15 = &v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageUrl];
  *v15 = 0;
  v15[1] = 0;
  v16 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_queue;
  OUTLINED_FUNCTION_12_0((uint64_t)v14, (unint64_t *)&unk_255A552B0);
  sub_2295E1594();
  v17 = MEMORY[0x24BEE4AF8];
  sub_2295DFFE4((unint64_t *)&qword_255A55E70, v4, MEMORY[0x24BEE5698]);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_24_0((unint64_t *)&qword_255A55E80);
  sub_2295E1804();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v19 + 104))(v18, *MEMORY[0x24BEE5750], v20);
  *(_QWORD *)&v1[v16] = sub_2295E1744();
  *(_QWORD *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_timers] = v17;

  sub_2295E187C();
  __break(1u);
}

void sub_2295DCA84(char a1)
{
  char *v1;
  char *v2;
  id v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  const CGPath *v15;
  id v16;
  double MinX;
  double MaxX;
  CGPath *v19;
  id v20;
  CGMutablePathRef v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  double v29;
  CGMutablePathRef MutableCopy;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5758]), sel_init);
  v5 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView;
  v6 = *(id *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView];
  v7 = sub_2295D8CEC();
  sub_2295D8CEC();
  v9 = v8 + 40.0;
  if ((a1 & 1) == 0)
    v9 = v8;
  objc_msgSend(v6, sel_setFrame_, 0.0, 20.0, v7 + 10.0, v9 + 10.0);

  objc_msgSend(*(id *)&v2[v5], sel_bounds);
  v14 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithRoundedRect_cornerRadius_, v10, v11, v12, v13, 5.0);
  v15 = (const CGPath *)objc_msgSend(v14, sel_CGPath);

  MutableCopy = CGPathCreateMutableCopy(v15);
  if ((a1 & 1) == 0)
    goto LABEL_6;
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD420]), sel_init);
  objc_msgSend(*(id *)&v2[v5], sel_bounds);
  MinX = CGRectGetMinX(v31);
  objc_msgSend(*(id *)&v2[v5], sel_bounds);
  objc_msgSend(v16, sel_moveToPoint_, MinX, CGRectGetMinY(v32) + 40.0);
  objc_msgSend(*(id *)&v2[v5], sel_bounds);
  MaxX = CGRectGetMaxX(v33);
  objc_msgSend(*(id *)&v2[v5], sel_bounds);
  objc_msgSend(v16, sel_addLineToPoint_, MaxX, CGRectGetMinY(v34) + 40.0);
  if (MutableCopy)
  {
    v19 = MutableCopy;
    v20 = objc_msgSend(v16, sel_CGPath);
    sub_2295E16D8();

LABEL_6:
    v21 = MutableCopy;
    goto LABEL_8;
  }

  v21 = 0;
LABEL_8:
  objc_msgSend(v4, sel_setPath_, v21);
  v22 = objc_msgSend((id)objc_opt_self(), sel_tertiaryLabelColor);
  v23 = objc_msgSend(v22, sel_CGColor);

  objc_msgSend(v4, sel_setStrokeColor_, v23);
  v24 = objc_msgSend(v2, sel_layer);
  v25 = objc_msgSend(v24, sel_backgroundColor);

  objc_msgSend(v4, sel_setFillColor_, v25);
  v26 = objc_msgSend(*(id *)&v2[v5], sel_layer);
  objc_msgSend(v26, sel_addSublayer_, v4);

  v27 = *(void **)&v2[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer];
  *(_QWORD *)&v2[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer] = v4;
  v28 = v4;

  v29 = 40.0;
  if ((a1 & 1) == 0)
    v29 = 0.0;
  sub_2295DD220(v29);
  objc_msgSend(v2, sel_addSubview_, *(_QWORD *)&v2[v5]);

}

void sub_2295DCE08()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *ObjCClassFromMetadata;
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  const CGPath *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v35;
  CGMutablePathRef MutableCopy;

  v1 = v0;
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageUrl + 8];
  if (!v2)
  {
    v14 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView;
    v15 = *(id *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView];
    v16 = sub_2295D8CEC();
    sub_2295D8CEC();
    objc_msgSend(v15, sel_setFrame_, 0.0, 40.0, v16, v17);

    objc_msgSend(*(id *)&v1[v14], sel_bounds);
    v22 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithRoundedRect_cornerRadius_, v18, v19, v20, v21, 5.0);
    v23 = (const CGPath *)objc_msgSend(v22, sel_CGPath);

    MutableCopy = CGPathCreateMutableCopy(v23);
    v24 = sub_2295DFD20(objc_msgSend(*(id *)&v1[v14], sel_layer));
    if (v24)
    {
      v25 = v24;
      v26 = *(void **)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer];
      if (v26)
        objc_msgSend(v26, sel_setPath_, MutableCopy);
      if (v25 >> 62)
        goto LABEL_27;
      v27 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
      while (v27)
      {
        v28 = 4;
        while (1)
        {
          v29 = (v25 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x22E2CC6DC](v28 - 4, v25)
              : *(id *)(v25 + 8 * v28);
          v30 = v29;
          v31 = v28 - 3;
          if (__OFADD__(v28 - 4, 1))
            break;
          v32 = sub_2295DFD94(v29);
          if (v33)
          {
            if (v32 == 0x645F656B6F727473 && v33 == 0xEA0000000000746FLL)
            {
              swift_bridgeObjectRelease();
LABEL_23:
              swift_bridgeObjectRelease();
              objc_msgSend(v30, sel_removeFromSuperlayer);

              goto LABEL_24;
            }
            v35 = sub_2295E18AC();
            swift_bridgeObjectRelease();
            if ((v35 & 1) != 0)
              goto LABEL_23;
          }

          ++v28;
          if (v31 == v27)
            goto LABEL_21;
        }
        __break(1u);
LABEL_27:
        swift_bridgeObjectRetain();
        v27 = sub_2295E1888();
        swift_bridgeObjectRelease();
      }
LABEL_21:
      swift_bridgeObjectRelease();
LABEL_24:
      sub_2295DD220(0.0);
    }
    goto LABEL_25;
  }
  v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageUrl];
  swift_getObjectType();
  v4 = *(void **)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView];
  swift_bridgeObjectRetain();
  objc_msgSend(v4, sel_removeFromSuperview);
  v5 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView;
  v6 = *(void **)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView];
  sub_2295E00C8(0, &qword_255A55DC8);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v8 = v6;
  v9 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, objc_msgSend(ObjCClassFromMetadata, sel_classForCoder));
  v10 = sub_2295DD51C(26466, 0xE200000000000000, v9, 0);
  if (v10)
  {
    v11 = v10;
    sub_2295D95F8(v3, v2, (uint64_t)v10);

    swift_bridgeObjectRelease();
    objc_msgSend(*(id *)&v1[v5], sel_setContentMode_, 2);
    objc_msgSend(v1, sel_insertSubview_belowSubview_, *(_QWORD *)&v1[v5], *(_QWORD *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView]);
    MutableCopy = (CGMutablePathRef)*(id *)&v1[v5];
    v12 = sub_2295D8CEC() + 60.0;
    sub_2295D8CEC();
    -[CGPath setFrame:](MutableCopy, sel_setFrame_, 0.0, 10.0, v12, v13 + 60.0);
LABEL_25:

    return;
  }
  __break(1u);
}

void sub_2295DD220(double a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  CGMutablePathRef Mutable;
  uint64_t v6;
  uint64_t v7;
  CGFloat MinX;
  CGFloat MidY;
  CGFloat MaxX;
  CGFloat v11;
  uint64_t v12;
  CGFloat MidX;
  CGFloat MinY;
  CGFloat v15;
  CGFloat MaxY;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5758]), sel_init);
  Mutable = CGPathCreateMutable();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A56050);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2295E21A0;
  v7 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView), sel_bounds);
  MinX = CGRectGetMinX(v21);
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  MidY = CGRectGetMidY(v22);
  *(CGFloat *)(v6 + 32) = MinX;
  *(double *)(v6 + 40) = a1 * 0.5 + MidY;
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  MaxX = CGRectGetMaxX(v23);
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  v11 = CGRectGetMidY(v24);
  *(CGFloat *)(v6 + 48) = MaxX;
  *(double *)(v6 + 56) = a1 * 0.5 + v11;
  sub_2295E16FC();
  swift_bridgeObjectRelease();
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2295E21A0;
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  MidX = CGRectGetMidX(v25);
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  MinY = CGRectGetMinY(v26);
  *(CGFloat *)(v12 + 32) = MidX;
  *(CGFloat *)(v12 + 40) = MinY + a1;
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  v15 = CGRectGetMidX(v27);
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  MaxY = CGRectGetMaxY(v28);
  *(CGFloat *)(v12 + 48) = v15;
  *(CGFloat *)(v12 + 56) = MaxY;
  sub_2295E16FC();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setPath_, Mutable);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A55520);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_2295E2D60;
  sub_2295E00C8(0, (unint64_t *)&unk_255A55EB0);
  *(_QWORD *)(v17 + 32) = sub_2295E17B0();
  *(_QWORD *)(v17 + 40) = sub_2295E17B0();
  sub_2295E1690();
  sub_2295DFCBC(v17, v4, (SEL *)&selRef_setLineDashPattern_);
  v18 = objc_msgSend((id)objc_opt_self(), sel_tertiaryLabelColor);
  v19 = objc_msgSend(v18, sel_CGColor);

  objc_msgSend(v4, sel_setStrokeColor_, v19);
  sub_2295D9548(0x645F656B6F727473, 0xEA0000000000746FLL, v4);
  v20 = objc_msgSend(*(id *)(v2 + v7), sel_layer);
  objc_msgSend(v20, sel_addSublayer_, v4);

}

id sub_2295DD51C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;

  v6 = (void *)sub_2295E15E8();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v6, a3, a4);

  return v7;
}

id sub_2295DD59C(uint64_t a1, unint64_t a2)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_2295E1384();
  v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_2295D9F4C(a1, a2);

  return v6;
}

uint64_t sub_2295DD610(uint64_t a1, _QWORD *a2, _QWORD *a3, void *a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  uint64_t ObjectType;
  uint64_t result;
  uint64_t v29;
  char *v30;
  void (*v31)(_QWORD *, uint64_t);
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD aBlock[6];

  v54 = a5;
  v53 = a4;
  v63 = a2;
  v64 = a3;
  v6 = sub_2295E1588();
  v60 = *(_QWORD *)(v6 - 8);
  v61 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v59 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_2295E15A0();
  v57 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v56 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2295E157C();
  v48 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v51 = (uint64_t *)((char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v10);
  v13 = (uint64_t *)((char *)&v47 - v12);
  v50 = sub_2295E15B8();
  v47 = *(_QWORD *)(v50 - 8);
  v14 = MEMORY[0x24BDAC7A8](v50);
  v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v49 = (char *)&v47 - v17;
  v18 = sub_2295E1750();
  v62 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = a1;
  swift_beginAccess();
  v52 = a1 + 16;
  v21 = MEMORY[0x22E2CCCE8](a1 + 16);
  v22 = MEMORY[0x24BEE4AF8];
  if (v21)
  {
    v23 = (void *)v21;
    v24 = (_QWORD *)(v21 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_timers);
    swift_beginAccess();
    *v24 = v22;

    swift_bridgeObjectRelease();
  }
  sub_2295E00C8(0, &qword_255A56028);
  sub_2295E00C8(0, (unint64_t *)&unk_255A552B0);
  v25 = (void *)sub_2295E172C();
  aBlock[0] = v22;
  sub_2295DFFE4(&qword_255A56030, (uint64_t (*)(uint64_t))MEMORY[0x24BEE57C0], MEMORY[0x24BEE57D0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A56038);
  sub_2295DFF60((unint64_t *)&unk_255A56040, &qword_255A56038);
  sub_2295E1804();
  v26 = sub_2295E175C();

  (*(void (**)(char *, uint64_t))(v62 + 8))(v20, v18);
  ObjectType = swift_getObjectType();
  result = sub_2295E15AC();
  if (__OFADD__(*v63, *v64))
  {
    __break(1u);
  }
  else
  {
    *v13 = *v63 + *v64;
    v29 = v48;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v48 + 104))(v13, *MEMORY[0x24BEE5410], v9);
    v30 = v49;
    MEMORY[0x22E2CC484](v16, v13);
    v31 = *(void (**)(_QWORD *, uint64_t))(v29 + 8);
    v31(v13, v9);
    v32 = *(void (**)(char *, uint64_t))(v47 + 8);
    v33 = v50;
    v32(v16, v50);
    sub_2295DDBD8((uint64_t)v13);
    v34 = v51;
    sub_2295DDC1C(v51);
    MEMORY[0x22E2CC664](v30, v13, v34, ObjectType);
    v31(v34, v9);
    v31(v13, v9);
    v32(v30, v33);
    v35 = (_QWORD *)swift_allocObject();
    v36 = v53;
    v35[2] = v53;
    v35[3] = v26;
    v37 = v55;
    v35[4] = v54;
    v35[5] = v37;
    aBlock[4] = sub_2295DFFD8;
    aBlock[5] = v35;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2295DA2CC;
    aBlock[3] = &block_descriptor_18;
    v38 = _Block_copy(aBlock);
    v39 = v36;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v40 = v56;
    sub_2295E1594();
    v41 = v59;
    sub_2295DDDD8();
    sub_2295E1768();
    _Block_release(v38);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v41, v61);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v40, v58);
    swift_release();
    sub_2295E1780();
    v42 = v52;
    swift_beginAccess();
    v43 = MEMORY[0x22E2CCCE8](v42);
    if (v43)
    {
      v44 = (void *)v43;
      v45 = (_QWORD *)(v43 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_timers);
      swift_beginAccess();
      v46 = swift_unknownObjectRetain();
      MEMORY[0x22E2CC520](v46);
      sub_2295DF3D8(*(_QWORD *)((*v45 & 0xFFFFFFFFFFFFF8) + 0x10));
      sub_2295E16A8();
      sub_2295E1690();
      swift_endAccess();

    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_2295DDBD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BEE5418];
  v3 = sub_2295E157C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_2295DDC1C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = 0;
  v2 = *MEMORY[0x24BEE5400];
  v3 = sub_2295E157C();
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

void sub_2295DDC64(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _BYTE *v14;

  sub_2295D8F38();
  swift_getObjectType();
  sub_2295E1774();
  if (!(a3 >> 62))
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v7 = sub_2295E1888();
  if (!v7)
    goto LABEL_11;
LABEL_3:
  v8 = __OFSUB__(v7, 1);
  v9 = v7 - 1;
  if (v8)
  {
    __break(1u);
  }
  else
  {
    sub_2295DF3B0(v9, (a3 & 0xC000000000000001) == 0, a3);
    if ((a3 & 0xC000000000000001) == 0)
    {
      v10 = *(id *)(a3 + 8 * v9 + 32);
      goto LABEL_6;
    }
  }
  v10 = (id)MEMORY[0x22E2CC6DC](v9, a3);
LABEL_6:
  v11 = v10;
  swift_bridgeObjectRelease();
  type metadata accessor for StrokeAnimatingLayer();
  v12 = a1;
  v13 = v11;
  LOBYTE(v11) = sub_2295E17BC();

  if ((v11 & 1) != 0)
  {
    swift_beginAccess();
    v14 = (_BYTE *)MEMORY[0x22E2CCCE8](a4 + 16);
    if (v14)
    {
      v14[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating] = 0;

    }
  }
}

uint64_t sub_2295DDDD8()
{
  sub_2295E1588();
  sub_2295DFFE4((unint64_t *)&qword_255A55E90, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55DD0);
  sub_2295DFF60((unint64_t *)&qword_255A55EA0, &qword_255A55DD0);
  return sub_2295E1804();
}

uint64_t sub_2295DDE84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_2295DDEA4(void *a1)
{
  uint64_t v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t i;
  id v16;
  void *v17;
  unint64_t v18;
  CGPoint v19;
  CGRect v20;

  objc_msgSend(a1, sel_locationInView_, v1);
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView), sel_frame);
  v19.x = v3;
  v19.y = v5;
  if (CGRectContainsPoint(v20, v19)
    && (*(_BYTE *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating) & 1) == 0)
  {
    v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers);
    if (v6)
    {
      if (v6 >> 62)
      {
LABEL_25:
        swift_bridgeObjectRetain_n();
        v7 = sub_2295E1888();
        if (v7)
          goto LABEL_6;
      }
      else
      {
        v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        if (v7)
        {
LABEL_6:
          v8 = v6 & 0xC000000000000001;
          v9 = 4;
          while (1)
          {
            if (v8)
              v10 = (id)MEMORY[0x22E2CC6DC](v9 - 4, v6);
            else
              v10 = *(id *)(v6 + 8 * v9);
            v11 = v10;
            v12 = v9 - 3;
            if (__OFADD__(v9 - 4, 1))
            {
              __break(1u);
              goto LABEL_25;
            }
            v13 = (void *)sub_2295E15E8();
            v14 = objc_msgSend(v11, sel_animationForKey_, v13);

            if (v14)
              break;
            ++v9;
            if (v12 == v7)
            {
              swift_bridgeObjectRelease();
              if (v7 >= 1)
              {
                swift_bridgeObjectRetain();
                for (i = 0; i != v7; ++i)
                {
                  if (v8)
                    v16 = (id)MEMORY[0x22E2CC6DC](i, v6);
                  else
                    v16 = *(id *)(v6 + 8 * i + 32);
                  v17 = v16;
                  objc_msgSend(v16, sel_removeAllAnimations);

                }
                goto LABEL_19;
              }
              __break(1u);
LABEL_28:
              __break(1u);
              return;
            }
          }
          swift_bridgeObjectRelease_n();
          if (*(_QWORD *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos))
          {
            v18 = swift_bridgeObjectRetain();
            sub_2295DBC3C(v18);
            goto LABEL_23;
          }
          goto LABEL_28;
        }
      }
LABEL_19:
      swift_bridgeObjectRelease();
LABEL_23:
      swift_bridgeObjectRelease();
      StrokeView.startAnimationRepeating(_:)(0);
    }
  }
}

Swift::Void __swiftcall StrokeView.startAnimationRepeating(_:)(Swift::Bool a1)
{
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
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
  _QWORD aBlock[6];

  v3 = sub_2295E1588();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2295E15A0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_30_0();
  v9 = sub_2295E157C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = sub_2295E15B8();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v15 = MEMORY[0x24BDAC7A8](v14);
  if ((v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating] & 1) == 0)
  {
    v46 = v10;
    v47 = v2;
    v48 = v8;
    v49 = v7;
    v50 = v6;
    v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating] = 1;
    v19 = *(_QWORD *)(*(_QWORD *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData]
                    + OBJC_IVAR___SAStrokeDataInternal_strokeNames);
    v20 = v1;
    if (v19)
    {
      v21 = v18;
      v41 = v17;
      v42 = (char *)&v41 - v16;
      v43 = v15;
      v44 = v4;
      v45 = v3;
      v22 = (void *)MEMORY[0x22E2CCCE8](&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationDelegate]);
      if (v22)
      {
        v23 = v22;
        v24 = objc_msgSend(v22, sel_respondsToSelector_, sel_animationDidStart);
        swift_bridgeObjectRetain();
        v25 = v47;
        if ((v24 & 1) != 0)
          objc_msgSend(v23, sel_animationDidStart);
        swift_unknownObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
        v25 = v47;
      }
      v26 = *(_QWORD *)(v19 + 16);
      v27 = swift_bridgeObjectRelease();
      v28 = 3090;
      if (v26 > 0x14)
        v28 = 3400;
      if (v26 >= 0xA)
        v29 = v28;
      else
        v29 = 2450;
      OUTLINED_FUNCTION_12_0(v27, (unint64_t *)&unk_255A552B0);
      v47 = sub_2295E172C();
      sub_2295E15AC();
      *v12 = v29;
      v30 = v46;
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(v46 + 104))(v12, *MEMORY[0x24BEE5410], v9);
      v31 = v42;
      MEMORY[0x22E2CC484](v21, v12);
      (*(void (**)(uint64_t *, uint64_t))(v30 + 8))(v12, v9);
      v32 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
      v33 = v43;
      v32(v21, v43);
      v34 = OUTLINED_FUNCTION_14_0();
      *(_QWORD *)(v34 + 16) = v20;
      aBlock[4] = sub_2295DF508;
      aBlock[5] = v34;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2295DA2CC;
      aBlock[3] = &block_descriptor_1;
      v35 = _Block_copy(aBlock);
      v36 = v20;
      swift_release();
      sub_2295E1594();
      aBlock[0] = MEMORY[0x24BEE4AF8];
      sub_2295DFFE4((unint64_t *)&qword_255A55E90, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_24_0((unint64_t *)&qword_255A55EA0);
      v37 = v50;
      v38 = v25;
      v39 = v45;
      sub_2295E1804();
      v40 = (void *)v47;
      MEMORY[0x22E2CC5D4](v31, v38, v37, v35);
      _Block_release(v35);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v37, v39);
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v38, v49);
      v32((uint64_t)v31, v33);
    }
    else
    {
      sub_2295DC084();
    }
  }
}

Swift::Void __swiftcall StrokeView.layoutSubviews()()
{
  char *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = v0;
  v6.super_class = (Class)OUTLINED_FUNCTION_23_0();
  objc_msgSendSuper2(&v6, sel_layoutSubviews);
  v1 = OUTLINED_FUNCTION_35_0(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_4();

  v2 = OUTLINED_FUNCTION_35_0(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_4();

  v3 = *(void **)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel];
  if (v3)
  {
    v4 = v3;
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_2_4();

  }
  v5 = OUTLINED_FUNCTION_35_0(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_4();

  sub_2295DC6BC();
}

CGSize __swiftcall StrokeView.sizeThatFits(_:)(CGSize a1)
{
  uint64_t v1;
  CGFloat width;
  double v3;
  double v4;
  void *v5;
  id v6;
  _BOOL4 v7;
  double v8;
  double v9;
  CGSize result;
  CGRect v11;
  CGRect v12;

  width = a1.width;
  sub_2295D8CEC();
  v4 = v3 + 40.0 + 10.0;
  v5 = *(void **)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v6, sel_bounds);
    v12.origin.x = 0.0;
    v12.origin.y = 0.0;
    v12.size.width = 0.0;
    v12.size.height = 0.0;
    v7 = CGRectEqualToRect(v11, v12);

    if (!v7)
      v4 = v4 + 40.0;
  }
  v8 = width;
  v9 = v4;
  result.height = v9;
  result.width = v8;
  return result;
}

Swift::Void __swiftcall StrokeView.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  char *v1;
  char *v2;
  Class isa;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  uint64_t i;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  char *v40;
  uint64_t v41;
  objc_super v42;

  v2 = v1;
  isa = a1.value.super.isa;
  v42.receiver = v1;
  v42.super_class = (Class)OUTLINED_FUNCTION_23_0();
  objc_msgSendSuper2(&v42, sel_traitCollectionDidChange_, isa);
  v4 = objc_msgSend(v1, sel_traitCollection);
  v5 = (unint64_t)objc_msgSend(v4, sel_hasDifferentColorAppearanceComparedToTraitCollection_, isa);

  if ((_DWORD)v5)
  {
    v6 = *(_QWORD *)&v2[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers];
    if (v6)
    {
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
      v40 = v2;
      if ((unint64_t)v6 >> 62)
        goto LABEL_35;
      v8 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v9 = swift_bridgeObjectRetain();
      if (v8)
        goto LABEL_5;
LABEL_11:
      OUTLINED_FUNCTION_34_0();
      v21 = *(void **)&v40[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer];
      if (v21)
      {
        v22 = (void *)objc_opt_self();
        v23 = v21;
        v24 = objc_msgSend(v22, sel_tertiaryLabelColor);
        v25 = objc_msgSend(v24, sel_CGColor);

        objc_msgSend(v23, sel_setStrokeColor_, v25);
      }
      v26 = sub_2295DFD20(objc_msgSend(*(id *)&v40[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView], sel_layer));
      if (v26)
      {
        v5 = v26;
        if (v26 >> 62)
          goto LABEL_41;
        for (i = *(_QWORD *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10); i; i = sub_2295E1888())
        {
          v28 = 4;
          while (1)
          {
            if ((v5 & 0xC000000000000001) != 0)
              OUTLINED_FUNCTION_40_0();
            v29 = *(id *)(v5 + 8 * v28);
            v6 = (uint64_t)v29;
            v30 = v28 - 3;
            if (__OFADD__(v28 - 4, 1))
              break;
            v31 = sub_2295DFD94(v29);
            if (v32)
            {
              if (v31 == 0x645F656B6F727473 && v32 == 0xEA0000000000746FLL)
              {
                swift_bridgeObjectRelease();
              }
              else
              {
                v34 = sub_2295E18AC();
                swift_bridgeObjectRelease();
                if ((v34 & 1) == 0)
                  goto LABEL_30;
              }
              objc_opt_self();
              v35 = swift_dynamicCastObjCClass();
              if (!v35)
              {
                OUTLINED_FUNCTION_18_0();

                return;
              }
              v36 = (void *)v35;
              v37 = (void *)objc_opt_self();
              v38 = (id)v6;
              v39 = objc_msgSend(v37, sel_tertiaryLabelColor);
              v6 = (uint64_t)objc_msgSend(v39, sel_CGColor);

              objc_msgSend(v36, sel_setStrokeColor_, v6);
            }
LABEL_30:

            ++v28;
            if (v30 == i)
              goto LABEL_31;
          }
          __break(1u);
LABEL_35:
          if (v6 >= 0)
            v5 = v7;
          else
            v5 = v6;
          swift_bridgeObjectRetain();
          v9 = sub_2295E1888();
          v8 = v9;
          if (!v9)
            goto LABEL_11;
LABEL_5:
          if (v8 >= 1)
          {
            v41 = OUTLINED_FUNCTION_12_0(v9, &qword_255A55EA8);
            OUTLINED_FUNCTION_12_0(v41, (unint64_t *)&unk_255A55EB0);
            v10 = (void *)objc_opt_self();
            v11 = 0;
            v12 = *MEMORY[0x24BDE5978];
            do
            {
              if ((v6 & 0xC000000000000001) != 0)
                v13 = (id)MEMORY[0x22E2CC6DC](v11, v6);
              else
                v13 = *(id *)(v6 + 8 * v11 + 32);
              v14 = v13;
              ++v11;
              v15 = sub_2295DF218(0x6F43656B6F727473, 0xEB00000000726F6CLL);
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A55520);
              v16 = OUTLINED_FUNCTION_14_0();
              *(_OWORD *)(v16 + 16) = xmmword_2295E2040;
              *(_QWORD *)(v16 + 32) = sub_2295E17B0();
              sub_2295E1690();
              sub_2295DFCBC(v16, v15, (SEL *)&selRef_setKeyTimes_);
              __swift_instantiateConcreteTypeFromMangledName(&qword_255A55EC0);
              v17 = OUTLINED_FUNCTION_14_0();
              *(_OWORD *)(v17 + 16) = xmmword_2295E21B0;
              v18 = objc_msgSend(v10, sel_labelColor);
              v19 = objc_msgSend(v18, sel_CGColor);

              type metadata accessor for CGColor(0);
              *(_QWORD *)(v17 + 56) = v20;
              *(_QWORD *)(v17 + 32) = v19;
              sub_2295DFC10(v17, v15);
              objc_msgSend(v15, sel_setFillMode_, v12);
              objc_msgSend(v15, sel_setRemovedOnCompletion_, 0);
              sub_2295DFC68((uint64_t)v15, 0x656B6F7274535253, 0xED0000726F6C6F43, v14);

            }
            while (v8 != v11);
            goto LABEL_11;
          }
          __break(1u);
LABEL_41:
          ;
        }
LABEL_31:
        OUTLINED_FUNCTION_18_0();
      }
    }
  }
}

Swift::Void __swiftcall StrokeView.updateStrokeAnimation(with:)(Swift::String with)
{
  uint64_t v1;
  unint64_t v2;

  sub_2295DA8A4();
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos))
  {
    v2 = OUTLINED_FUNCTION_27_0();
    sub_2295DBC3C(v2);
    OUTLINED_FUNCTION_18_0();
    sub_2295DC084();
  }
  else
  {
    OUTLINED_FUNCTION_42_0();
  }
}

id StrokeView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_23_0();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall StrokeView.update(with:)(SAStrokeData with)
{
  char *v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  NSObject *oslog;

  v2 = -[objc_class underlyingObject](with.super.isa, sel_underlyingObject);
  v3 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData;
  v4 = *(void **)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData];
  *(_QWORD *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData] = v2;

  v5 = (uint64_t *)(*(_QWORD *)&v1[v3] + OBJC_IVAR___SAStrokeDataInternal_strokeAnimationRepresention);
  v7 = *v5;
  v6 = v5[1];
  v8 = v7 & 0xFFFFFFFFFFFFLL;
  if ((v6 & 0x2000000000000000) != 0)
    v9 = HIBYTE(v6) & 0xF;
  else
    v9 = v8;
  if (v9)
  {
    sub_2295DA8A4();
    sub_2295DBAD0();
    if (*(_QWORD *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos])
    {
      v10 = OUTLINED_FUNCTION_27_0();
      sub_2295DBC3C(v10);
      OUTLINED_FUNCTION_18_0();
    }
    objc_msgSend(v1, sel_setNeedsLayout);
    StrokeView.startAnimationRepeating(_:)(0);
  }
  else
  {
    if (qword_255A55280 != -1)
      swift_once();
    v11 = OUTLINED_FUNCTION_45_0();
    __swift_project_value_buffer(v11, (uint64_t)qword_255A56218);
    oslog = sub_2295E1558();
    v12 = sub_2295E16CC();
    if (os_log_type_enabled(oslog, v12))
    {
      v13 = (uint8_t *)OUTLINED_FUNCTION_26_0();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2295CB000, oslog, v12, "strokeAnimationRepresention is empty,so can't render animation!", v13, 2u);
      OUTLINED_FUNCTION_8_0();
    }
    OUTLINED_FUNCTION_0_6(oslog);
  }
}

id sub_2295DEF94(id a1)
{
  return a1;
}

void StrokeView.interactionDelegate.getter()
{
  JUMPOUT(0x22E2CCCE8);
}

uint64_t StrokeView.interactionDelegate.setter()
{
  swift_unknownObjectWeakAssign();
  return OUTLINED_FUNCTION_22_0();
}

uint64_t (*StrokeView.interactionDelegate.modify(_QWORD *a1))()
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationDelegate;
  a1[1] = v1;
  a1[2] = v2;
  *a1 = MEMORY[0x22E2CCCE8](v1 + v2);
  return sub_2295DF06C;
}

uint64_t sub_2295DF06C()
{
  swift_unknownObjectWeakAssign();
  return OUTLINED_FUNCTION_22_0();
}

Swift::Void __swiftcall StrokeView.endAnimation()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  void *v7;

  v1 = v0;
  if (qword_255A55280 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_45_0();
  __swift_project_value_buffer(v2, (uint64_t)qword_255A56218);
  v3 = sub_2295E1558();
  v4 = sub_2295E16B4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_26_0();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2295CB000, v3, v4, "stop stroke animation and tell the delegate to cancel tts readout.", v5, 2u);
    OUTLINED_FUNCTION_8_0();
  }

  v6 = (void *)MEMORY[0x22E2CCCE8](v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationDelegate);
  if (v6)
  {
    v7 = v6;
    if ((objc_msgSend(v6, sel_respondsToSelector_, sel_animationDidEnd) & 1) != 0)
      objc_msgSend(v7, sel_animationDidEnd);
    swift_unknownObjectRelease();
  }
  *(_BYTE *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating) = 0;
}

id sub_2295DF218(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = (void *)sub_2295E15E8();
    OUTLINED_FUNCTION_34_0();
  }
  else
  {
    v2 = 0;
  }
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_animationWithKeyPath_, v2);

  return v3;
}

id sub_2295DF280(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v13;

  v4 = a1[3];
  if (v4)
  {
    v6 = __swift_project_boxed_opaque_existential_0(a1, a1[3]);
    v7 = *(_QWORD *)(v4 - 8);
    MEMORY[0x24BDAC7A8](v6);
    v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    v10 = sub_2295E18A0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(v2, sel_initWithTarget_action_, v10, a2);
  swift_unknownObjectRelease();
  return v11;
}

uint64_t sub_2295DF36C(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2295DF37C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unint64_t sub_2295DF3B0(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_2295DF3D8(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_2295E169C();
  return result;
}

_BYTE **sub_2295DF404(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_2295DF414(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2295DF53C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2295DFE7C((uint64_t)v12, *a3);
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
      sub_2295DFE7C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2295DF4E4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2295DF508()
{
  sub_2295DC084();
  OUTLINED_FUNCTION_42_0();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_2295DF53C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2295DF690((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2295E17EC();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2295DF754(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2295E1828();
    if (!v8)
    {
      result = sub_2295E1870();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_2295DF690(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2295E1894();
  __break(1u);
  return result;
}

uint64_t sub_2295DF754(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2295DF7E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2295DF9BC(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2295DF9BC((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2295DF7E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2295E163C();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_2295DF958(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2295E1810();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2295E1894();
  __break(1u);
LABEL_14:
  result = sub_2295E1870();
  __break(1u);
  return result;
}

_QWORD *sub_2295DF958(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A56018);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2295DF9BC(char *result, int64_t a2, char a3, uint64_t a4)
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
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A56018);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2295DFB54(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2295DFA90(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2295DFA90(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2295E1894();
  __break(1u);
  return result;
}

char *sub_2295DFB54(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2295E1894();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_2295DFBD4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;

  v4 = (void *)sub_2295E15E8();
  objc_msgSend(a3, sel_setText_, v4);
  OUTLINED_FUNCTION_0_6(v4);
}

void sub_2295DFC10(uint64_t a1, void *a2)
{
  void *v3;

  sub_2295E166C();
  OUTLINED_FUNCTION_33_0();
  objc_msgSend(a2, sel_setValues_, v3);
  OUTLINED_FUNCTION_0_6(v3);
}

void sub_2295DFC5C(uint64_t a1, void *a2)
{
  sub_2295DFCBC(a1, a2, (SEL *)&selRef_setKeyTimes_);
}

void sub_2295DFC68(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;

  sub_2295E15E8();
  OUTLINED_FUNCTION_33_0();
  objc_msgSend(a4, sel_addAnimation_forKey_, a1, v6);
  OUTLINED_FUNCTION_9_0(v6);
}

void sub_2295DFCBC(uint64_t a1, void *a2, SEL *a3)
{
  void *v5;

  OUTLINED_FUNCTION_12_0(a1, (unint64_t *)&unk_255A55EB0);
  v5 = (void *)sub_2295E166C();
  OUTLINED_FUNCTION_34_0();
  objc_msgSend(a2, *a3, v5);
  OUTLINED_FUNCTION_9_0(v5);
}

uint64_t sub_2295DFD20(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_sublayers);

  if (!v2)
    return 0;
  sub_2295E00C8(0, &qword_255A56010);
  v3 = sub_2295E1678();

  return v3;
}

uint64_t sub_2295DFD94(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_name);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2295E15F4();

  return v3;
}

uint64_t type metadata accessor for StrokeView()
{
  return objc_opt_self();
}

uint64_t sub_2295DFE14(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2295DFE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2295DFEBC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2295DFEE0()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2295DFF14()
{
  uint64_t v0;

  return sub_2295DD610(*(_QWORD *)(v0 + 16), *(_QWORD **)(v0 + 24), *(_QWORD **)(v0 + 32), *(void **)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_2295DFF24(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2295DFF34()
{
  return swift_deallocObject();
}

void sub_2295DFF44()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_42_0();
}

void sub_2295DFF60(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x22E2CCC34](MEMORY[0x24BEE12C8], v3), a1);
  }
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_2295DFF9C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_2295DFFD8()
{
  uint64_t v0;

  sub_2295DDC64(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

void sub_2295DFFE4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x22E2CCC34](a3, v5), a1);
  }
  OUTLINED_FUNCTION_10_0();
}

void sub_2295E0020(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_32_0(a1, a2, a3);
  OUTLINED_FUNCTION_37_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_10_0();
}

void sub_2295E004C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_20_0(v2);
  OUTLINED_FUNCTION_10_0();
}

void sub_2295E0074(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_20_0(v2);
  OUTLINED_FUNCTION_10_0();
}

void sub_2295E009C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_32_0(a1, a2, a3);
  OUTLINED_FUNCTION_37_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_2295E00C8(uint64_t a1, unint64_t *a2)
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

void OUTLINED_FUNCTION_0_6(id a1)
{

}

id OUTLINED_FUNCTION_1_4()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 1152));
}

id OUTLINED_FUNCTION_2_4()
{
  void *v0;
  uint64_t v1;
  double v2;

  return objc_msgSend(v0, (SEL)(v1 + 1480), v2);
}

void OUTLINED_FUNCTION_3_3(uint64_t a1@<X8>)
{
  uint64_t v1;

}

id OUTLINED_FUNCTION_4_2()
{
  return StrokeData.init(characters:strokeAnimationRepresention:strokeNames:pronunciations:)();
}

id OUTLINED_FUNCTION_7_0()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 1152));
}

void OUTLINED_FUNCTION_8_0()
{
  JUMPOUT(0x22E2CCC94);
}

void OUTLINED_FUNCTION_9_0(id a1)
{

}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return sub_2295E15A0();
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t a1, unint64_t *a2)
{
  return sub_2295E00C8(0, a2);
}

id OUTLINED_FUNCTION_13_0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;

  return objc_msgSendSuper2((objc_super *)(v2 - 136), a2, v6, v5, v4, v3);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_allocObject();
}

id OUTLINED_FUNCTION_17_0(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_20_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return sub_2295E1708();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_getObjectType();
}

void OUTLINED_FUNCTION_24_0(unint64_t *a1)
{
  uint64_t *v1;

  sub_2295DFF60(a1, v1);
}

id OUTLINED_FUNCTION_25_0()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 2816));
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_32_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_35_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(id *)(v1 + a1);
}

double OUTLINED_FUNCTION_36_0()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_37_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_bridgeObjectRetain_n();
}

id OUTLINED_FUNCTION_39_0()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

void OUTLINED_FUNCTION_40_0()
{
  JUMPOUT(0x22E2CC6DCLL);
}

unint64_t OUTLINED_FUNCTION_41_0()
{
  return 0xD00000000000001FLL;
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return sub_2295E1720();
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return sub_2295E1564();
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return type metadata accessor for StrokeData();
}

double sub_2295E037C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  double result;

  if (a2)
  {
    v3 = sub_2295E1618();
    if ((unint64_t)(v3 - 1) >= 5)
      return 0.9;
    else
      return dbl_2295E2E18[v3 - 1];
  }
  else
  {
    result = (double)a3 * 0.06;
    if (result <= 0.55)
      result = 0.55;
    if (result > 1.1)
      return 1.1;
  }
  return result;
}

id sub_2295E03F0(uint64_t a1, uint64_t a2, double a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_5_3(a1, &qword_255A55EA8);
  v5 = OUTLINED_FUNCTION_1_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A55EC0);
  v6 = OUTLINED_FUNCTION_0_7();
  v7 = MEMORY[0x24BEE1768];
  *(_OWORD *)(v6 + 16) = xmmword_2295E21A0;
  *(_QWORD *)(v6 + 32) = 0;
  *(_QWORD *)(v6 + 88) = v7;
  *(_QWORD *)(v6 + 56) = v7;
  *(_QWORD *)(v6 + 64) = 1;
  sub_2295DFC10(v6, v5);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A55520);
  v8 = OUTLINED_FUNCTION_0_7();
  *(_OWORD *)(v8 + 16) = xmmword_2295E2D60;
  OUTLINED_FUNCTION_5_3(v8, (unint64_t *)&unk_255A55EB0);
  *(_QWORD *)(v8 + 32) = sub_2295E17B0();
  *(_QWORD *)(v8 + 40) = sub_2295E17B0();
  OUTLINED_FUNCTION_4_3();
  sub_2295DFC5C(v8, v5);
  objc_msgSend(v5, sel_setDuration_, a3);
  objc_msgSend(v5, sel_setFillMode_, *MEMORY[0x24BDE5978]);
  objc_msgSend(v5, sel_setRemovedOnCompletion_, 0);
  v9 = OUTLINED_FUNCTION_6_1(a2);
  sub_2295E1188(v9, v5);
  objc_msgSend(v5, sel_setCalculationMode_, *MEMORY[0x24BDE5830]);
  return v5;
}

id sub_2295E0570(uint64_t a1, unint64_t a2, uint64_t a3, double a4)
{
  id v7;
  char *v8;
  uint64_t v9;

  OUTLINED_FUNCTION_5_3(a1, &qword_255A55EA8);
  v7 = OUTLINED_FUNCTION_1_5();
  v8 = sub_2295E0AFC(a2);
  sub_2295DFC10((uint64_t)v8, v7);
  sub_2295E11F8(a2, v7);
  objc_msgSend(v7, sel_setDuration_, a4);
  objc_msgSend(v7, sel_setFillMode_, *MEMORY[0x24BDE5978]);
  objc_msgSend(v7, sel_setRemovedOnCompletion_, 0);
  v9 = OUTLINED_FUNCTION_6_1(a3);
  sub_2295E1188(v9, v7);
  objc_msgSend(v7, sel_setCalculationMode_, *MEMORY[0x24BDE5830]);
  return v7;
}

uint64_t sub_2295E0660(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;

  if (a3)
  {
    if (a3 == 1)
    {
      v5 = *(_QWORD *)(a1 + 16);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A55520);
      v6 = OUTLINED_FUNCTION_0_7();
      *(_OWORD *)(v6 + 16) = xmmword_2295E2040;
      if (v5 == 4)
      {
        v7 = *(double *)(a1 + 32);
        v8 = *(double *)(a1 + 40);
        v9 = *(double *)(a1 + 48);
        v10 = *(double *)(a1 + 56);
        v11 = objc_allocWithZone(MEMORY[0x24BDE56F0]);
        *(float *)&v12 = v7;
        *(float *)&v13 = v8;
        *(float *)&v14 = v9;
        *(float *)&v15 = v10;
        v16 = objc_msgSend(v11, sel_initWithControlPoints__::, v12, v13, v14, v15);
LABEL_15:
        *(_QWORD *)(v6 + 32) = v16;
        OUTLINED_FUNCTION_4_3();
        return v6;
      }
      v21 = (void *)objc_opt_self();
      v22 = OUTLINED_FUNCTION_2_5(v21, sel_functionWithName_);
    }
    else
    {
LABEL_13:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A55520);
      v6 = OUTLINED_FUNCTION_0_7();
      *(_OWORD *)(v6 + 16) = xmmword_2295E2040;
      v23 = (void *)objc_opt_self();
      v22 = OUTLINED_FUNCTION_2_5(v23, sel_functionWithName_);
    }
    v16 = v22;
    goto LABEL_15;
  }
  switch(a2)
  {
    case 2:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A55520);
      v6 = OUTLINED_FUNCTION_0_7();
      *(_OWORD *)(v6 + 16) = xmmword_2295E2D60;
      if (qword_255A552A8 != -1)
        swift_once();
      v17 = (void *)qword_255A56258;
      *(_QWORD *)(v6 + 32) = qword_255A56258;
      v18 = qword_255A552A0;
      v19 = v17;
      if (v18 != -1)
        swift_once();
      v20 = (void *)qword_255A56250;
      *(_QWORD *)(v6 + 40) = qword_255A56250;
      break;
    case 3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A55520);
      v6 = OUTLINED_FUNCTION_0_7();
      *(_OWORD *)(v6 + 16) = xmmword_2295E2DE0;
      if (qword_255A552A8 == -1)
        goto LABEL_19;
      goto LABEL_29;
    case 4:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A55520);
      v6 = OUTLINED_FUNCTION_0_7();
      *(_OWORD *)(v6 + 16) = xmmword_2295E2DE0;
      if (qword_255A552A8 == -1)
        goto LABEL_19;
LABEL_29:
      swift_once();
LABEL_19:
      *(_QWORD *)(v6 + 32) = qword_255A56258;
      objc_opt_self();
      OUTLINED_FUNCTION_3_4();
      *(_QWORD *)(v6 + 40) = OUTLINED_FUNCTION_2_5(v3, sel_functionWithName_);
      if (qword_255A552A0 != -1)
        swift_once();
      v20 = (void *)qword_255A56250;
      *(_QWORD *)(v6 + 48) = qword_255A56250;
      break;
    case 5:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A55520);
      v6 = OUTLINED_FUNCTION_0_7();
      *(_OWORD *)(v6 + 16) = xmmword_2295E2DD0;
      if (qword_255A552A8 != -1)
        swift_once();
      *(_QWORD *)(v6 + 32) = qword_255A56258;
      objc_opt_self();
      v24 = OUTLINED_FUNCTION_3_4();
      *(_QWORD *)(v6 + 40) = OUTLINED_FUNCTION_2_5(v3, sel_functionWithName_);
      *(_QWORD *)(v6 + 48) = v24;
      v25 = qword_255A552A0;
      v26 = v24;
      if (v25 != -1)
        swift_once();
      v20 = (void *)qword_255A56250;
      *(_QWORD *)(v6 + 56) = qword_255A56250;
      break;
    default:
      goto LABEL_13;
  }
  OUTLINED_FUNCTION_4_3();
  v27 = v20;
  return v6;
}

char *sub_2295E0AFC(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t i;
  id v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_2295E1888();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return (char *)v3;
  v10 = MEMORY[0x24BEE4AF8];
  result = sub_2295E108C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    for (i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x22E2CC6DC](i, a1);
      else
        v6 = *(id *)(a1 + 8 * i + 32);
      sub_2295E1260(0, (unint64_t *)&unk_255A55EB0);
      swift_dynamicCast();
      v3 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2295E108C(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v10;
      }
      v8 = *(_QWORD *)(v3 + 16);
      v7 = *(_QWORD *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_2295E108C((char *)(v7 > 1), v8 + 1, 1);
        v3 = v10;
      }
      *(_QWORD *)(v3 + 16) = v8 + 1;
      sub_2295E1298(&v9, (_OWORD *)(v3 + 32 * v8 + 32));
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

double sub_2295E0C9C(char a1)
{
  return dbl_2295E2E40[a1];
}

uint64_t sub_2295E0CB0(char a1)
{
  return qword_2295E2E70[a1];
}

uint64_t sub_2295E0CC4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2295E0CEC + 4 * byte_2295E2DF0[a1]))(68, 0xE100000000000000);
}

uint64_t sub_2295E0CEC()
{
  return 72;
}

uint64_t sub_2295E0CF4()
{
  return 83;
}

uint64_t sub_2295E0CFC()
{
  return 84;
}

uint64_t sub_2295E0D04()
{
  return 80;
}

uint64_t sub_2295E0D0C()
{
  return 78;
}

uint64_t sub_2295E0D14()
{
  return 23112;
}

uint64_t sub_2295E0D20()
{
  return 18248;
}

uint64_t sub_2295E0D2C()
{
  return 20552;
}

uint64_t sub_2295E0D38()
{
  return 4676168;
}

uint64_t sub_2295E0D8C()
{
  return 1196907080;
}

uint64_t sub_2295E0E78()
{
  return 18263;
}

uint64_t sub_2295E0E84()
{
  return 18264;
}

uint64_t sub_2295E0E90()
{
  return 4681559;
}

id sub_2295E0EA0()
{
  id v0;
  double v1;
  double v2;
  double v3;
  double v4;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x24BDE56F0]);
  LODWORD(v1) = 1055957975;
  LODWORD(v2) = 1061075026;
  LODWORD(v3) = 1060571709;
  LODWORD(v4) = 0;
  result = objc_msgSend(v0, sel_initWithControlPoints__::, v1, v4, v2, v3);
  qword_255A56250 = (uint64_t)result;
  return result;
}

id sub_2295E0EEC()
{
  id v0;
  double v1;
  double v2;
  double v3;
  double v4;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x24BDE56F0]);
  LODWORD(v1) = 1053273620;
  LODWORD(v2) = 1058222899;
  LODWORD(v3) = 1058055127;
  LODWORD(v4) = 1.0;
  result = objc_msgSend(v0, sel_initWithControlPoints__::, v1, v2, v3, v4);
  qword_255A56258 = (uint64_t)result;
  return result;
}

char *sub_2295E0F38(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2295E1894();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t sub_2295E0FBC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 32 * a2 <= a1 || a1 + 32 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_2295E1894();
  __break(1u);
  return result;
}

char *sub_2295E108C(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_2295E10A8(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_2295E10A8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A55EC0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size_0(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2295E0F38(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2295E0FBC((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_2295E1188(uint64_t a1, void *a2)
{
  id v3;

  sub_2295E1260(0, &qword_255A56080);
  v3 = (id)sub_2295E166C();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setTimingFunctions_, v3);

}

void sub_2295E11F8(uint64_t a1, void *a2)
{
  id v3;

  sub_2295E1260(0, (unint64_t *)&unk_255A55EB0);
  v3 = (id)sub_2295E166C();
  objc_msgSend(a2, sel_setKeyTimes_, v3);

}

uint64_t sub_2295E1260(uint64_t a1, unint64_t *a2)
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

_OWORD *sub_2295E1298(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_allocObject();
}

id OUTLINED_FUNCTION_1_5()
{
  return sub_2295DF218(0x6E45656B6F727473, 0xE900000000000064);
}

id OUTLINED_FUNCTION_2_5(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

id OUTLINED_FUNCTION_3_4()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return sub_2295E1690();
}

uint64_t OUTLINED_FUNCTION_5_3(uint64_t a1, unint64_t *a2)
{
  return sub_2295E1260(0, a2);
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1)
{
  char v1;
  uint64_t v2;

  return sub_2295E0660(a1, v2, v1);
}

uint64_t sub_2295E1300()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_2295E1330()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_2295E133C()
{
  return MEMORY[0x24BDCB058]();
}

uint64_t sub_2295E1348()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_2295E1354()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_2295E1360()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2295E136C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2295E1378()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_2295E1384()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2295E1390()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2295E139C()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_2295E13B4()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_2295E13C0()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_2295E13CC()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_2295E13D8()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_2295E13E4()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_2295E13F0()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_2295E13FC()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_2295E1408()
{
  return MEMORY[0x24BE5C058]();
}

uint64_t sub_2295E1414()
{
  return MEMORY[0x24BE5C078]();
}

uint64_t sub_2295E1420()
{
  return MEMORY[0x24BE5C0B8]();
}

uint64_t sub_2295E142C()
{
  return MEMORY[0x24BE5C0E0]();
}

uint64_t sub_2295E1438()
{
  return MEMORY[0x24BE5C0E8]();
}

uint64_t sub_2295E1444()
{
  return MEMORY[0x24BE5C108]();
}

uint64_t sub_2295E1450()
{
  return MEMORY[0x24BE5C120]();
}

uint64_t sub_2295E145C()
{
  return MEMORY[0x24BE5C148]();
}

uint64_t sub_2295E1468()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_2295E1474()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_2295E1480()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_2295E148C()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_2295E1498()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_2295E14A4()
{
  return MEMORY[0x24BE5C230]();
}

uint64_t sub_2295E14B0()
{
  return MEMORY[0x24BE5C250]();
}

uint64_t sub_2295E14BC()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t sub_2295E14C8()
{
  return MEMORY[0x24BE5C2A0]();
}

uint64_t sub_2295E14D4()
{
  return MEMORY[0x24BE5C2C0]();
}

uint64_t sub_2295E14E0()
{
  return MEMORY[0x24BE5C2D8]();
}

uint64_t sub_2295E14EC()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t sub_2295E14F8()
{
  return MEMORY[0x24BE5C300]();
}

uint64_t sub_2295E1504()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_2295E1510()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_2295E151C()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_2295E1528()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_2295E1534()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_2295E1540()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_2295E154C()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_2295E1558()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2295E1564()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2295E1570()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2295E157C()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_2295E1588()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2295E1594()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2295E15A0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2295E15AC()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2295E15B8()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2295E15C4()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_2295E15D0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2295E15DC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2295E15E8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2295E15F4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2295E1600()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2295E160C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2295E1618()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_2295E1624()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_2295E1630()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2295E163C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2295E1648()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_2295E1654()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2295E1660()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2295E166C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2295E1678()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2295E1684()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2295E1690()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2295E169C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2295E16A8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2295E16B4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2295E16C0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2295E16CC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2295E16D8()
{
  return MEMORY[0x24BDBD7B8]();
}

uint64_t sub_2295E16E4()
{
  return MEMORY[0x24BDBD7D0]();
}

uint64_t sub_2295E16F0()
{
  return MEMORY[0x24BDBD7E8]();
}

uint64_t sub_2295E16FC()
{
  return MEMORY[0x24BDBD800]();
}

uint64_t sub_2295E1708()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2295E1714()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_2295E1720()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2295E172C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2295E1738()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2295E1744()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2295E1750()
{
  return MEMORY[0x24BEE57C0]();
}

uint64_t sub_2295E175C()
{
  return MEMORY[0x24BEE5828]();
}

uint64_t sub_2295E1768()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_2295E1774()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_2295E1780()
{
  return MEMORY[0x24BEE58D8]();
}

uint64_t sub_2295E178C()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_2295E1798()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_2295E17A4()
{
  return MEMORY[0x24BEE5958]();
}

uint64_t sub_2295E17B0()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_2295E17BC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2295E17C8()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2295E17D4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2295E17E0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2295E17EC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2295E17F8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2295E1804()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2295E1810()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2295E181C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2295E1828()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2295E1834()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2295E1840()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2295E184C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2295E1858()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2295E1864()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2295E1870()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2295E187C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2295E1888()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2295E1894()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2295E18A0()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2295E18AC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2295E18B8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2295E18C4()
{
  return MEMORY[0x24BEE4328]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEE60](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE88](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CGSVGAttributeGetTransform()
{
  return MEMORY[0x24BE28078]();
}

uint64_t CGSVGAttributeMapGetAttribute()
{
  return MEMORY[0x24BE28090]();
}

uint64_t CGSVGDocumentCreateFromData()
{
  return MEMORY[0x24BE280D8]();
}

uint64_t CGSVGDocumentGetRootNode()
{
  return MEMORY[0x24BE28108]();
}

uint64_t CGSVGNodeEnumerate()
{
  return MEMORY[0x24BE28148]();
}

uint64_t CGSVGNodeGetAttributeMap()
{
  return MEMORY[0x24BE28178]();
}

uint64_t CGSVGNodeGetType()
{
  return MEMORY[0x24BE281A8]();
}

uint64_t CGSVGPathCreateCGPath()
{
  return MEMORY[0x24BE281E8]();
}

uint64_t CGSVGShapeNodeGetPath()
{
  return MEMORY[0x24BE28238]();
}

uint64_t CGSVGShapeNodeGetPrimitive()
{
  return MEMORY[0x24BE28240]();
}

uint64_t CGSVGViewBoxNodeGetViewbox()
{
  return MEMORY[0x24BE28280]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

