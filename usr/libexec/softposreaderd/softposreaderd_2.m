uint64_t sub_100127498()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001274D4 + 4 * byte_100162E40[*v0]))(0x6F43737365636361, 0xED00006C6F72746ELL);
}

uint64_t sub_1001274D4()
{
  return 0x626F6C4279656BLL;
}

uint64_t sub_1001274EC()
{
  return 0x6369666974726563;
}

uint64_t sub_10012750C()
{
  return 0x73656D695479656BLL;
}

uint64_t sub_10012752C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100129670(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100127550(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100129EE8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100127578(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100129EE8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001275A0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;

  v3 = v1;
  v5 = sub_100003A2C(&qword_1001B3830);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100005EF8(a1, v9);
  v11 = sub_100129EE8();
  v12 = v9;
  v13 = v3;
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for SESSigningIdentity.CodingKeys, &type metadata for SESSigningIdentity.CodingKeys, v11, v12, v10);
  result = SecAccessControlCopyData(*(_QWORD *)(v3 + 80));
  if (result)
  {
    v15 = (void *)result;
    v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)(result);
    v18 = v17;

    v28 = v16;
    v29 = v18;
    v30 = 0;
    v19 = sub_1000D590C();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v28, &v30, v5, &type metadata for Data, v19);
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    else
    {
      v26 = v13;
      v27 = v6;
      v21 = *(_QWORD *)(v13 + 64);
      v20 = *(_QWORD *)(v13 + 72);
      v28 = v21;
      v29 = v20;
      v30 = 1;
      sub_100005D9C(v21, v20);
      KeyedEncodingContainer.encode<A>(_:forKey:)(&v28, &v30, v5, &type metadata for Data, v19);
      sub_100005DE0(v21, v20);
      v22 = *(_QWORD *)(v26 + 24);
      v23 = *(_QWORD *)(v26 + 32);
      v28 = v22;
      v29 = v23;
      v30 = 2;
      sub_100005D9C(v22, v23);
      KeyedEncodingContainer.encode<A>(_:forKey:)(&v28, &v30, v5, &type metadata for Data, v19);
      sub_100005DE0(v22, v23);
      v24 = *(_QWORD *)(v26 + 56);
      LODWORD(v28) = *(_DWORD *)(v26 + 48);
      v29 = v24;
      v30 = 3;
      v25 = sub_100129F70();
      KeyedEncodingContainer.encode<A>(_:forKey:)(&v28, &v30, v5, &type metadata for SPRTimestamp, v25);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v5);
    }
    return sub_100005DE0(v16, v18);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100127830(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a2[4];
  v8 = a2[5];
  v9 = v5 == v7 && v6 == v8;
  if (v9 || (v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, v7, v8, 0), result = 0, (v10 & 1) != 0))
  {
    v12 = v2 - 1;
    if (!v12)
      return 1;
    v13 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      v15 = *(i - 1);
      v16 = *i;
      v17 = *(v13 - 1);
      v18 = *v13;
      v19 = v15 == v17 && v16 == v18;
      if (!v19 && (_stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, v17, v18, 0) & 1) == 0)
        break;
      v13 += 2;
      if (!--v12)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_1001278F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *i;
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
  BOOL v15;
  char v17;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (uint64_t *)(a2 + 64);
    for (i = (uint64_t *)(a1 + 64); ; i += 5)
    {
      v5 = *(i - 4);
      v6 = *(i - 3);
      v7 = *(i - 2);
      v8 = *(i - 1);
      v9 = *i;
      v10 = *(v3 - 4);
      v11 = *(v3 - 3);
      v12 = *(v3 - 2);
      v13 = *(v3 - 1);
      v14 = *v3;
      v15 = v5 == v10 && v6 == v11;
      if (!v15 && (_stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, v10, v11, 0) & 1) == 0)
        break;
      if (v7 == v12 && v8 == v13)
      {
        if (v9 != v14)
          return 0;
      }
      else
      {
        v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, v12, v13, 0);
        result = 0;
        if ((v17 & 1) == 0 || v9 != v14)
          return result;
      }
      v3 += 5;
      if (!--v2)
        return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t sub_1001279E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2)
  {
    if (a1 != a2)
      __asm { BR              X8 }
  }
  return 1;
}

uint64_t sub_1001282F8(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  void *v21;
  char v22;
  unint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  SEL v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  SEL v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  unint64_t v43;
  unint64_t v44;

  v4 = (unint64_t)a1 >> 62;
  if (!((unint64_t)a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = (void *)((unint64_t)a2 >> 62);
    if (!((unint64_t)a2 >> 62))
      goto LABEL_3;
LABEL_38:
    if (a2 < 0)
      v34 = a2;
    else
      v34 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v35 = _CocoaArrayWrapper.endIndex.getter(v34);
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a2, v36, v37, v38, v39, v40, v41, v42);
    if (v5 == v35)
      goto LABEL_4;
    return 0;
  }
  if (a1 < 0)
    v26 = a1;
  else
    v26 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v5 = _CocoaArrayWrapper.endIndex.getter(v26);
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a1, v27, v28, v29, v30, v31, v32, v33);
  v6 = (void *)((unint64_t)a2 >> 62);
  if ((unint64_t)a2 >> 62)
    goto LABEL_38;
LABEL_3:
  if (v5 != *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
    return 0;
LABEL_4:
  if (!v5)
    return 1;
  v7 = a1 & 0xFFFFFFFFFFFFFF8;
  v8 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a1 < 0)
    v7 = a1;
  if (v4)
    v8 = v7;
  v9 = a2 & 0xFFFFFFFFFFFFFF8;
  v10 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0)
    v9 = a2;
  if (v6)
    v10 = v9;
  if (v8 == v10)
    return 1;
  if (v5 < 0)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v44 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
LABEL_47:
    result = specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
    goto LABEL_18;
  }
  if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_49;
  }
  result = (uint64_t)*(id *)(a1 + 32);
LABEL_18:
  v6 = (void *)result;
  v43 = a2 & 0xC000000000000001;
  if ((a2 & 0xC000000000000001) != 0)
  {
LABEL_49:
    v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a2);
LABEL_21:
    v13 = v12;
    type metadata accessor for SecCertificate(0);
    v15 = v14;
    v16 = sub_10012A158(&qword_1001B3858, 255, (uint64_t (*)(uint64_t))type metadata accessor for SecCertificate, (uint64_t)&unk_10015D17C);
    v17 = static _CFObject.== infix(_:_:)(v6, v13, v15, v16);

    if ((v17 & 1) != 0)
    {
      v18 = 1 - v5;
      for (i = 5; ; ++i)
      {
        v5 = v18 + i == 5;
        if (v18 + i == 5)
          break;
        v23 = i - 4;
        if (v44)
        {
          v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, a1);
        }
        else
        {
          if (v23 >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_45:
            __break(1u);
            goto LABEL_46;
          }
          v24 = *(id *)(a1 + 8 * i);
        }
        v25 = v24;
        if (v43)
        {
          v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, a2);
        }
        else
        {
          if (v23 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_45;
          v20 = *(id *)(a2 + 8 * i);
        }
        v21 = v20;
        v22 = static _CFObject.== infix(_:_:)(v25, v20, v15, v16);

        if ((v22 & 1) == 0)
          return v5;
      }
      return v5;
    }
    return 0;
  }
  if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v12 = *(id *)(a2 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

void sub_1001285A4()
{
  uint64_t v0;
  SEL v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  sub_100005DE0(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(v0 + 40), v1, v2, v3, v4, v5, v6, v7);
  sub_100005DE0(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));

}

uint64_t sub_1001285D0()
{
  uint64_t v0;
  SEL v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  sub_100005DE0(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(v0 + 40), v1, v2, v3, v4, v5, v6, v7);
  sub_100005DE0(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));

  return swift_deallocClassInstance(v0, 89, 7);
}

uint64_t type metadata accessor for SESSigningIdentity()
{
  return objc_opt_self(_TtC9SPREngine18SESSigningIdentity);
}

uint64_t sub_10012862C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 24);
  sub_100005D9C(v1, *(_QWORD *)(*(_QWORD *)v0 + 32));
  return v1;
}

uint64_t sub_100128660()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)v0 + 40));
}

BOOL sub_10012866C(uint64_t *a1, uint64_t *a2)
{
  return sub_100128B58(*a1, *a2);
}

uint64_t sub_100128678()
{
  return sub_100126BA4();
}

void sub_100128698(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  sub_10012987C(a1);
  if (!v2)
    *a2 = v4;
}

uint64_t sub_1001286C0(_QWORD *a1)
{
  return sub_1001275A0(a1);
}

uint64_t sub_1001286E0(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  a1[1] = sub_10012A158(&qword_1001AE070, a2, (uint64_t (*)(uint64_t))type metadata accessor for SESSigningIdentity, (uint64_t)&unk_100162EBC);
  a1[2] = sub_10012A158(&qword_1001AE058, v3, (uint64_t (*)(uint64_t))type metadata accessor for SESSigningIdentity, (uint64_t)&unk_100162E94);
  result = sub_10012A158(&qword_1001B3810, v4, (uint64_t (*)(uint64_t))type metadata accessor for SESSigningIdentity, (uint64_t)&unk_100162F0C);
  a1[3] = result;
  return result;
}

uint64_t sub_100128758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_10013A124((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_10012882C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = __DataStorage._bytes.getter();
  v11 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = __DataStorage._length.getter();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_10013A124(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_1001288E0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_10012892C()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_100128960 + *((int *)qword_100128B38 + (v0 >> 62))))();
}

uint64_t sub_100128970@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

BOOL sub_100128B58(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  char v10;
  _TtC14softposreaderd12RemoteReader *v11;
  _TtC14softposreaderd12RemoteReader *v12;
  char v13;
  SEL v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SEL v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  sub_1001288E0(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  if ((v4 & 1) == 0)
    return 0;
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  sub_100005D9C(v5, v6);
  sub_100005D9C(v7, v8);
  sub_1001288E0(v5, v6);
  v10 = v9;
  sub_100005DE0(v7, v8);
  sub_100005DE0(v5, v6);
  if ((v10 & 1) == 0)
    return 0;
  v11 = *(_TtC14softposreaderd12RemoteReader **)(a1 + 40);
  v12 = *(_TtC14softposreaderd12RemoteReader **)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = sub_1001279E4((uint64_t)v11, (uint64_t)v12);
  swift_bridgeObjectRelease(v11, v14, v15, v16, v17, v18, v19, v20);
  swift_bridgeObjectRelease(v12, v21, v22, v23, v24, v25, v26, v27);
  return (v13 & 1) != 0 && *(_DWORD *)(a1 + 48) == *(_DWORD *)(a2 + 48) && *(double *)(a1 + 56) == *(double *)(a2 + 56);
}

uint64_t sub_100128C5C(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, int a7, double a8)
{
  uint64_t v8;
  id v14;
  unint64_t v15;
  unint64_t v16;
  _BYTE v18[24];

  *(_BYTE *)(v8 + 88) = 0;
  *(_QWORD *)(v8 + 72) = a3;
  *(_QWORD *)(v8 + 80) = a1;
  *(_QWORD *)(v8 + 64) = a2;
  *(_QWORD *)(v8 + 24) = a4;
  *(_QWORD *)(v8 + 32) = a5;
  *(_QWORD *)(v8 + 40) = a6;
  *(_DWORD *)(v8 + 48) = a7;
  *(double *)(v8 + 56) = a8;
  swift_beginAccess(&qword_1001B4FC0, v18, 33, 0);
  v14 = a1;
  sub_100005D9C(a2, a3);
  sub_100005D9C(a4, a5);
  do
  {
    v15 = __ldxr(&qword_1001B4FC0);
    v16 = v15 + 1;
  }
  while (__stxr(v15 + 1, &qword_1001B4FC0));
  swift_endAccess(v18);
  *(_QWORD *)(v8 + 16) = v16;
  return v8;
}

uint64_t sub_100128D1C(uint64_t a1, _TtC14softposreaderd12RemoteReader *a2, uint64_t a3, uint32_t *p_align, uint64_t a5, unint64_t a6)
{
  unint64_t v6;
  unint64_t v7;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  unint64_t v17;
  NSObject *v18;
  unint64_t v19;
  Class isa;
  NSString v21;
  SEL v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  Class v29;
  SEL v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  Class v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  SEL v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  SEL v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  NSObject *v74;
  uint8_t *v75;
  uint8_t *v76;
  uint64_t v77;
  NSObject *v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint64_t v82;
  Class v83;
  uint64_t v84;
  NSObject *v85;
  uint64_t v86;
  NSObject *v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  SEL v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  SEL v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  const char *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  uint64_t v117;
  SEL v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  uint64_t v126;
  uint8_t *v127;
  unint64_t *v128;
  NSObject *v129;
  uint64_t v130;
  _QWORD *v131;
  NSObject *v132;
  void *v133;
  uint64_t v134;
  unint64_t v135;
  NSObject *v136;
  uint64_t v137;

  v7 = v6;
  if (qword_1001AD210 != -1)
    swift_once(&qword_1001AD210, sub_100115468);
  v136 = 0;
  v13 = objc_msgSend((id)qword_1001B4F20, "canEvaluatePolicy:error:", 2, &v136);
  v14 = (uint64_t)v136;
  if (v13)
  {
    v134 = a5;
    v135 = a6;
    v15 = v136;
    v16 = (id)SESKeyCreate(a3, &v136);
    v17 = (unint64_t)v136;
    v18 = v136;

    v133 = (void *)a3;
    if (!v16)
    {
      if (qword_1001AD298 == -1)
        goto LABEL_25;
      goto LABEL_49;
    }
    while (1)
    {
      a3 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v16);
      v7 = v19;

      sub_100005D9C(a3, v7);
      isa = Data._bridgeToObjectiveC()().super.isa;
      sub_100005DE0(a3, v7);
      v21 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(a2, v22, v23, v24, v25, v26, v27, v28);
      a2 = (_TtC14softposreaderd12RemoteReader *)Data._bridgeToObjectiveC()().super.isa;
      v29 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)p_align, v30, v31, v32, v33, v34, v35, v36);
      v37 = Int._bridgeToObjectiveC()().super.super.isa;
      v136 = v18;
      v38 = (id)SESKeyAttestWithSEBAA(isa, v21, a2, v29, v37, &v136);

      v39 = (uint64_t)v136;
      v40 = v136;

      if (!v38)
        break;
      v18 = v40;
      v41 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v38);
      v17 = v42;

      sub_100005D9C(a3, v7);
      if (qword_1001AD308 != -1)
        swift_once(&qword_1001AD308, sub_10013E994);
      v43 = static GlobalState.shared;
      p_align = &stru_1001A9FE8.align;
      objc_msgSend(*(id *)(static GlobalState.shared + 72), "lock", v127);
      while (*(uint64_t *)(v43 + 96) > 0 || *(_BYTE *)(v43 + 80) == 1)
        objc_msgSend(*(id *)(v43 + 72), "wait");
      v44 = *(_QWORD *)(v43 + 88);
      v45 = __OFADD__(v44, 1);
      v46 = v44 + 1;
      if (v45)
      {
        __break(1u);
      }
      else
      {
        *(_QWORD *)(v43 + 88) = v46;
        a2 = (_TtC14softposreaderd12RemoteReader *)&stru_1001A9FE8.align;
        objc_msgSend(*(id *)(v43 + 72), "unlock");
        if (*(_BYTE *)(v43 + 56))
          v47 = 0;
        else
          v47 = *(_DWORD *)(v43 + 52);
        objc_msgSend(*(id *)(v43 + 72), "lock");
        v48 = *(_QWORD *)(v43 + 88);
        v45 = __OFSUB__(v48, 1);
        v49 = v48 - 1;
        if (!v45)
        {
          *(_QWORD *)(v43 + 88) = v49;
          if (!v49)
            objc_msgSend(*(id *)(v43 + 72), "broadcast");
          v50 = TMGetKernelMonotonicClock(objc_msgSend(*(id *)(v43 + 72), "unlock"));
          v51 = type metadata accessor for SESSigningIdentity();
          swift_allocObject(v51, 89, 7);
          v52 = sub_100128C5C(v133, a3, v7, v41, v17, (uint64_t)&_swiftEmptyArrayStorage, v47, v50);
          sub_100005DE0(v41, v17);
          sub_10000A9B0(a3, v7);

          sub_100005DE0(v134, v135);
          sub_10000A9B0(a3, v7);

          return v52;
        }
      }
      __break(1u);
LABEL_49:
      swift_once(&qword_1001AD298, sub_100126EEC);
LABEL_25:
      v71 = type metadata accessor for Logger(0);
      v130 = sub_100003A14(v71, (uint64_t)qword_1001B3718);
      v72 = Logger.logObject.getter(v130);
      v73 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v72, v73))
      {
        v74 = v18;
        v75 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v75 = 0;
        _os_log_impl((void *)&_mh_execute_header, v72, v73, "keyBlob nil from SESKeyCreate", v75, 2u);
        v76 = v75;
        v18 = v74;
        swift_slowDealloc(v76, -1, -1);
      }

      if (v18)
      {
        v129 = v18;
        v78 = v18;
        v79 = Logger.logObject.getter(v78);
        v80 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v79, v80))
        {
          v81 = (uint8_t *)swift_slowAlloc(12, -1);
          v128 = (unint64_t *)swift_slowAlloc(8, -1);
          *(_DWORD *)v81 = 138412290;
          v127 = v81 + 4;
          v136 = v78;
          v78 = v78;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v136, &v137, v81 + 4, v81 + 12);
          *v128 = v17;

          _os_log_impl((void *)&_mh_execute_header, v79, v80, "Error from SESKeyCreate: %@", v81, 0xCu);
          v82 = sub_100003A2C((uint64_t *)&unk_1001AE430);
          swift_arrayDestroy(v128, 1, v82);
          swift_slowDealloc(v128, -1, -1);
          swift_slowDealloc(v81, -1, -1);
        }
        else
        {

          v79 = v78;
        }

        a3 = (uint64_t)v133;
        v18 = v129;
      }
      v92 = Logger.logObject.getter(v77);
      v93 = static os_log_type_t.default.getter();
      v52 = v93;
      if (os_log_type_enabled(v92, v93))
      {
        v94 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v94 = 0;
        _os_log_impl((void *)&_mh_execute_header, v92, (os_log_type_t)v52, "Restore SE pairing and retry", v94, 2u);
        swift_slowDealloc(v94, -1, -1);
      }

      sub_10009B408();
      if (v7)
      {
        sub_100005DE0(v134, v135);

        swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)p_align, v95, v96, v97, v98, v99, v100, v101);
        swift_bridgeObjectRelease(a2, v102, v103, v104, v105, v106, v107, v108);
        goto LABEL_21;
      }
      v136 = v18;
      v16 = (id)SESKeyCreate(a3, &v136);
      v52 = v136;

      if (!v16)
      {
        swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)p_align, v109, v110, v111, v112, v113, v114, v115);
        swift_bridgeObjectRelease(a2, v118, v119, v120, v121, v122, v123, v124);
        v125 = (id)v52;
        sub_10002460C(10001, 0, 0, v52);

        swift_willThrow(v126);
        sub_100005DE0(v134, v135);

        goto LABEL_21;
      }
      v18 = v52;
    }
    sub_100005D9C(a3, v7);
    v83 = Data._bridgeToObjectiveC()().super.isa;
    sub_10000A9B0(a3, v7);
    v136 = 0;
    SESKeyDelete(v83, &v136);

    v69 = v136;
    if (v136)
    {
      v132 = v40;
      v84 = qword_1001AD298;
      v85 = v136;
      if (v84 != -1)
        swift_once(&qword_1001AD298, sub_100126EEC);
      v86 = type metadata accessor for Logger(0);
      sub_100003A14(v86, (uint64_t)qword_1001B3718);
      v87 = v85;
      v88 = Logger.logObject.getter(v87);
      v89 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v88, v89))
      {
        v90 = (uint8_t *)swift_slowAlloc(12, -1);
        v131 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v90 = 138412290;
        v136 = v87;
        v87 = v87;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v136, &v137, v90 + 4, v90 + 12);
        *v131 = v69;

        _os_log_impl((void *)&_mh_execute_header, v88, v89, "Failed to delete SES key (init): %@", v90, 0xCu);
        v91 = sub_100003A2C((uint64_t *)&unk_1001AE430);
        swift_arrayDestroy(v131, 1, v91);
        swift_slowDealloc(v131, -1, -1);
        swift_slowDealloc(v90, -1, -1);
      }
      else
      {

        v88 = v87;
      }
      v40 = v132;

    }
    v116 = v40;
    v52 = sub_10002460C(10002, 0, 0, v39);

    swift_willThrow(v117);
    sub_100005DE0(v134, v135);

    sub_10000A9B0(a3, v7);
  }
  else
  {
    v53 = v136;
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)p_align, v54, v55, v56, v57, v58, v59, v60);
    swift_bridgeObjectRelease(a2, v61, v62, v63, v64, v65, v66, v67);
    v52 = v53;
    sub_10002460C(10003, 0xD000000000000014, (void *)0x8000000100170ED0, v14);

    swift_willThrow(v68);
    sub_100005DE0(a5, a6);

LABEL_21:
    v69 = (id)a3;
  }

  return v52;
}

uint64_t sub_100129670(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  char v9;

  if (a1 == 0x6F43737365636361 && a2 == 0xED00006C6F72746ELL)
  {
    v5 = 0xED00006C6F72746ELL;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6F43737365636361, 0xED00006C6F72746ELL, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x626F6C4279656BLL && a2 == 0xE700000000000000)
  {
    v7 = 0xE700000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x626F6C4279656BLL, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x6369666974726563 && a2 == 0xEB00000000657461)
  {
    v8 = 0xEB00000000657461;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6369666974726563, 0xEB00000000657461, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x73656D695479656BLL && a2 == 0xEC000000706D6174)
  {
    swift_bridgeObjectRelease(0xEC000000706D6174);
    return 3;
  }
  else
  {
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73656D695479656BLL, 0xEC000000706D6174, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

void sub_10012987C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  Class isa;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  _QWORD v59[2];
  uint64_t v60;
  unint64_t v61;
  char v62;
  uint64_t v63;

  v2 = v1;
  v4 = type metadata accessor for DecodingError(0);
  v56 = *(_QWORD *)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v55 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v57 = (unint64_t)&v48 - v7;
  v8 = sub_100003A2C(&qword_1001B3818);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v12 = a1[4];
  sub_100005EF8(a1, v13);
  v14 = sub_100129EE8();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for SESSigningIdentity.CodingKeys, &type metadata for SESSigningIdentity.CodingKeys, v14, v13, v12);
  if (!v1)
  {
    v54 = v9;
    LOBYTE(v59[0]) = 0;
    v15 = sub_1000D5840();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, v59, v8, &type metadata for Data, v15);
    v16 = v8;
    v24 = v61;
    v63 = 0;
    v53 = v60;
    isa = Data._bridgeToObjectiveC()().super.isa;
    v26 = (void *)SecAccessControlCreateFromData(kCFAllocatorDefault, isa, &v63);

    if (v26)
    {
      v52 = v26;
      LOBYTE(v59[0]) = 3;
      v27 = sub_100129F2C();
      KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v60, &type metadata for SPRTimestamp, v59, v16, &type metadata for SPRTimestamp, v27);
      if ((v62 & 1) != 0)
      {
        if (qword_1001AD308 != -1)
          swift_once(&qword_1001AD308, sub_10013E994);
        v35 = static GlobalState.shared;
        objc_msgSend(*(id *)(static GlobalState.shared + 72), "lock");
        while (*(uint64_t *)(v35 + 96) > 0 || *(_BYTE *)(v35 + 80) == 1)
          objc_msgSend(*(id *)(v35 + 72), "wait");
        v36 = *(_QWORD *)(v35 + 88);
        v37 = __OFADD__(v36, 1);
        v38 = v36 + 1;
        if (v37)
        {
          __break(1u);
        }
        else
        {
          *(_QWORD *)(v35 + 88) = v38;
          objc_msgSend(*(id *)(v35 + 72), "unlock");
          v39 = *(_DWORD *)(v35 + 52);
          if (*(_BYTE *)(v35 + 56))
            v39 = 0;
          v51 = v39;
          objc_msgSend(*(id *)(v35 + 72), "lock");
          v40 = *(_QWORD *)(v35 + 88);
          v37 = __OFSUB__(v40, 1);
          v41 = v40 - 1;
          if (!v37)
          {
            *(_QWORD *)(v35 + 88) = v41;
            if (!v41)
              objc_msgSend(*(id *)(v35 + 72), "broadcast");
            v42 = TMGetKernelMonotonicClock(objc_msgSend(*(id *)(v35 + 72), "unlock"));
            goto LABEL_25;
          }
        }
        __break(1u);
      }
      v42 = *(double *)&v61;
      v51 = v60;
LABEL_25:
      LOBYTE(v59[0]) = 1;
      KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, v59, v16, &type metadata for Data, v15);
      v49 = v61;
      v50 = v60;
      v58 = 2;
      KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v58, v16, &type metadata for Data, v15);
      v56 = v59[0];
      v57 = v24;
      v43 = v59[1];
      v44 = type metadata accessor for SESSigningIdentity();
      swift_allocObject(v44, 89, 7);
      v45 = v49;
      v46 = v50;
      v47 = v56;
      sub_100128C5C(v52, v50, v49, v56, v43, (uint64_t)&_swiftEmptyArrayStorage, v51, v42);
      sub_100005DE0(v47, v43);
      sub_100005DE0(v46, v45);

      sub_100005DE0(v53, v57);
      (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v16);
      sub_100005D3C(a1);
      return;
    }
    v28 = v63;
    if (!v63)
    {
      __break(1u);
      return;
    }
    type metadata accessor for CFError(0);
    v30 = v29;
    v31 = sub_10012A158((unint64_t *)&qword_1001B1F58, 255, (uint64_t (*)(uint64_t))type metadata accessor for CFError, (uint64_t)&protocol conformance descriptor for CFErrorRef);
    v32 = swift_allocError(v30, v31, 0, 0);
    *v33 = v28;
    v2 = sub_10002460C(10005, 0x6320737365636361, (void *)0xEE006C6F72746E6FLL, v32);
    v34 = swift_errorRelease();
    swift_willThrow(v34);
    sub_100005DE0(v53, v24);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v16);
  }
  v17 = v57;
  v60 = v2;
  swift_errorRetain();
  v18 = sub_100003A2C((uint64_t *)&unk_1001B1280);
  if (swift_dynamicCast(v17, &v60, v18, v4, 0))
  {
    swift_errorRelease();
    v20 = v55;
    v19 = v56;
    (*(void (**)(char *, unint64_t, uint64_t))(v56 + 32))(v55, v17, v4);
    v21 = swift_allocError(v4, &protocol witness table for DecodingError, 0, 0);
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v22, v20, v4);
    sub_10002460C(10005, 0xD000000000000010, (void *)0x8000000100170EB0, v21);
    v23 = swift_errorRelease();
    swift_willThrow(v23);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v4);
  }
  swift_errorRelease();
  sub_100005D3C(a1);
}

unint64_t sub_100129EE8()
{
  unint64_t result;

  result = qword_1001B3820;
  if (!qword_1001B3820)
  {
    result = swift_getWitnessTable(&unk_100163014, &type metadata for SESSigningIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B3820);
  }
  return result;
}

unint64_t sub_100129F2C()
{
  unint64_t result;

  result = qword_1001B3828;
  if (!qword_1001B3828)
  {
    result = swift_getWitnessTable(&unk_100163A54, &type metadata for SPRTimestamp);
    atomic_store(result, (unint64_t *)&qword_1001B3828);
  }
  return result;
}

unint64_t sub_100129F70()
{
  unint64_t result;

  result = qword_1001B3838;
  if (!qword_1001B3838)
  {
    result = swift_getWitnessTable(&unk_100163A2C, &type metadata for SPRTimestamp);
    atomic_store(result, (unint64_t *)&qword_1001B3838);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SESSigningIdentity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10012A000 + 4 * byte_100162E49[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10012A034 + 4 * byte_100162E44[v4]))();
}

uint64_t sub_10012A034(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10012A03C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10012A044);
  return result;
}

uint64_t sub_10012A050(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10012A058);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10012A05C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10012A064(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SESSigningIdentity.CodingKeys()
{
  return &type metadata for SESSigningIdentity.CodingKeys;
}

unint64_t sub_10012A084()
{
  unint64_t result;

  result = qword_1001B3840;
  if (!qword_1001B3840)
  {
    result = swift_getWitnessTable(&unk_100162FEC, &type metadata for SESSigningIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B3840);
  }
  return result;
}

unint64_t sub_10012A0CC()
{
  unint64_t result;

  result = qword_1001B3848;
  if (!qword_1001B3848)
  {
    result = swift_getWitnessTable(&unk_100162F5C, &type metadata for SESSigningIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B3848);
  }
  return result;
}

unint64_t sub_10012A114()
{
  unint64_t result;

  result = qword_1001B3850;
  if (!qword_1001B3850)
  {
    result = swift_getWitnessTable(&unk_100162F84, &type metadata for SESSigningIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B3850);
  }
  return result;
}

uint64_t sub_10012A158(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10012A198()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = sub_1000ED9E8(&off_1001966C8);
  v1 = sub_100003A2C(&qword_1001B3860);
  result = swift_arrayDestroy(&unk_1001966E8, 4, v1);
  qword_1001B4FE0 = v0;
  return result;
}

uint64_t sub_10012A1EC(uint64_t *a1)
{
  return _sSC17SPRDepotErrorCodeLeV9SPREngineE9errorName4codeSSSoAAV_tFZ_0(*a1);
}

uint64_t _sSC17SPRDepotErrorCodeLeV9SPREngineE9errorName4codeSSSoAAV_tFZ_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t *v5;
  uint64_t v6;
  Swift::String v7;
  void *object;

  if (qword_1001AD2B0 != -1)
    swift_once(&qword_1001AD2B0, sub_10012A198);
  v2 = qword_1001B4FE0;
  if (*(_QWORD *)(qword_1001B4FE0 + 16) && (v3 = sub_10013A38C(a1), (v4 & 1) != 0))
  {
    v5 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 16 * v3);
    v6 = *v5;
    swift_bridgeObjectRetain(v5[1]);
  }
  else
  {
    v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    object = v7._object;
    String.append(_:)(v7);
    swift_bridgeObjectRelease(object);
    return 0x727245746F706544;
  }
  return v6;
}

unint64_t sub_10012A2D0(uint64_t a1)
{
  unint64_t result;

  result = sub_10012A2F4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10012A2F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1001AD6E0;
  if (!qword_1001AD6E0)
  {
    type metadata accessor for DepotError(255);
    result = swift_getWitnessTable(&unk_10015BA08, v1);
    atomic_store(result, (unint64_t *)&qword_1001AD6E0);
  }
  return result;
}

uint64_t type metadata accessor for MPOCOfflineMonitorBackend()
{
  return objc_opt_self(_TtC9SPREngine25MPOCOfflineMonitorBackend);
}

void *sub_10012A35C@<X0>(void *a1@<X8>)
{
  uint64_t v1;
  void *result;
  uint64_t v4;
  _BYTE __dst[272];
  _QWORD v6[37];
  _QWORD __src[34];

  result = sub_1000D2C04(0xD0000000000001CALL, 0x8000000100170F20, __src);
  if (!v1)
  {
    memcpy(__dst, __src, sizeof(__dst));
    result = (void *)BitString.init(data:unusedBits:)(__dst);
    v4 = __src[13];
    if ((__src[13] & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      sub_100054A14((uint64_t)__dst, (uint64_t)v6);
      v6[34] = v4;
      LOBYTE(v6[35]) = 0;
      v6[36] = 0;
      return memcpy(a1, v6, 0x128uLL);
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for MPOCMonitorBatch(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for MPOCMonitorBatch(_QWORD *a1)
{
  return swift_release(*a1);
}

uint64_t *assignWithCopy for MPOCMonitorBatch(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  a1[1] = a2[1];
  return a1;
}

uint64_t *assignWithTake for MPOCMonitorBatch(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  a1[1] = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for MPOCMonitorBatch()
{
  return &type metadata for MPOCMonitorBatch;
}

ValueMetadata *type metadata accessor for MPOCMonitorLoggerError()
{
  return &type metadata for MPOCMonitorLoggerError;
}

uint64_t sub_10012A4E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_1000039D4(v0, qword_1001B3920);
  v1 = sub_100003A14(v0, (uint64_t)qword_1001B3920);
  if (qword_1001AD158 != -1)
    swift_once(&qword_1001AD158, sub_1000CC540);
  v2 = sub_100003A14(v0, (uint64_t)qword_1001B4DF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_10012A570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;

  v0 = type metadata accessor for String.Encoding(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String.Encoding.utf8.getter(v2);
  v5 = String.data(using:allowLossyConversion:)(v4, 0, 0x65566D6574737973, 0xED00006E6F697372);
  v7 = v6;
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  if (v7 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    qword_1001B4FE8 = v5;
    unk_1001B4FF0 = v7;
  }
  return result;
}

uint64_t sub_10012A63C@<X0>(char a1@<W0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  uint64_t result;
  _QWORD v14[5];

  v4 = v2;
  v7 = v4[12];
  v8 = *(_BYTE *)(*sub_100005EF8(v4 + 2, v4[5]) + OBJC_IVAR____TtC9SPREngine11Environment_isStorageTemporary);
  v9 = (objc_class *)type metadata accessor for CoreDataWrapper();
  v10 = objc_allocWithZone(v9);
  swift_retain();
  v11 = sub_100136E80(0x676E6967676F4CLL, 0xE700000000000000, v7, v8, a1);
  swift_release(v7);
  v14[3] = v9;
  v14[4] = &off_1001A0950;
  v14[0] = v11;
  v12 = v11;
  sub_10012A74C(v14);
  if (v3)
  {

    return sub_100005D3C(v14);
  }
  else
  {
    result = sub_100005D3C(v14);
    a2[3] = v9;
    a2[4] = &off_1001A0950;
    *a2 = v12;
  }
  return result;
}

uint64_t sub_10012A74C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  _TtC14softposreaderd12RemoteReader *v11;
  _TtC14softposreaderd12RemoteReader *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  SEL v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  Swift::String v23;
  SEL v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _TtC14softposreaderd12RemoteReader *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _TtC14softposreaderd12RemoteReader *v60;
  char v62;
  SEL v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  SEL v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  SEL v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  Swift::String v84;
  unint64_t v85;
  _TtC14softposreaderd12RemoteReader *object;
  SEL v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  SEL v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  _TtC14softposreaderd12RemoteReader *v108;
  uint64_t v109;

  v3 = v2;
  v5 = type metadata accessor for String.Encoding(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v105 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100005EF8((_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 80));
  v10 = sub_10007CBF0(*(_QWORD *)(*v9 + 16), *(_QWORD *)(*v9 + 24), *(_QWORD *)(*v9 + 32));
  v12 = v11;
  static String.Encoding.utf8.getter(v10);
  v13 = String.data(using:allowLossyConversion:)(v8, 0, v10, v12);
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v15 >> 60 == 15)
  {
    v107 = 0;
    v108 = (_TtC14softposreaderd12RemoteReader *)0xE000000000000000;
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease(v108, v16, v17, v18, v19, v20, v21, v22);
    v107 = 0xD00000000000002CLL;
    v108 = (_TtC14softposreaderd12RemoteReader *)0x8000000100171140;
    v23._countAndFlagsBits = v10;
    v23._object = v12;
    String.append(_:)(v23);
    swift_bridgeObjectRelease(v12, v24, v25, v26, v27, v28, v29, v30);
    v31 = sub_1000243B8(6002, v107, v108, 0);
    return swift_willThrow(v31);
  }
  v109 = v13;
  v34 = a1[3];
  v33 = a1[4];
  sub_100005EF8(a1, v34);
  if (qword_1001AD2C0 != -1)
    swift_once(&qword_1001AD2C0, sub_10012A570);
  v35 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v33 + 32))(qword_1001B4FE8, unk_1001B4FF0, v34, v33);
  if (v2)
  {
    swift_bridgeObjectRelease(v12, v36, v37, v38, v39, v40, v41, v42);
  }
  else
  {
    v50 = v35;
    v51 = (unint64_t)v36;
    static String.Encoding.utf8.getter(v35);
    v52 = String.init(data:encoding:)(v50, v51, v8);
    if (v53)
    {
      v60 = v53;
      if (v52 == v10 && v53 == v12)
      {
        swift_bridgeObjectRelease(v53, (SEL)v53, v54, v55, v56, v57, v58, v59);
        swift_bridgeObjectRelease(v12, v94, v95, v96, v97, v98, v99, v100);
      }
      else
      {
        v106 = v51;
        v62 = _stringCompareWithSmolCheck(_:_:expecting:)(v52, v53, v10, v12, 0);
        swift_bridgeObjectRelease(v60, v63, v64, v65, v66, v67, v68, v69);
        swift_bridgeObjectRelease(v12, v70, v71, v72, v73, v74, v75, v76);
        if ((v62 & 1) == 0)
        {
          v101 = a1[3];
          v102 = a1[4];
          sub_100005EF8(a1, v101);
          (*(void (**)(uint64_t, uint64_t))(v102 + 64))(v101, v102);
          v103 = a1[3];
          v104 = a1[4];
          sub_100005EF8(a1, v103);
          (*(void (**)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t))(v104 + 40))(qword_1001B4FE8, unk_1001B4FF0, v109, v15, v103, v104);
        }
        v51 = v106;
      }
      sub_100005DE0(v50, v51);
      goto LABEL_20;
    }
    swift_bridgeObjectRelease(v12, 0, v54, v55, v56, v57, v58, v59);
    v107 = 0;
    v108 = (_TtC14softposreaderd12RemoteReader *)0xE000000000000000;
    _StringGuts.grow(_:)(47);
    swift_bridgeObjectRelease(v108, v77, v78, v79, v80, v81, v82, v83);
    v107 = 0xD00000000000002DLL;
    v108 = (_TtC14softposreaderd12RemoteReader *)0x8000000100171170;
    v84 = Data.hexString()();
    v85 = v51;
    object = (_TtC14softposreaderd12RemoteReader *)v84._object;
    String.append(_:)(v84);
    swift_bridgeObjectRelease(object, v87, v88, v89, v90, v91, v92, v93);
    v3 = sub_1000243B8(6002, v107, v108, 0);
    swift_willThrow(v3);
    sub_100005DE0(v50, v85);
  }
  _s3__C4CodeOMa_8(0);
  v44 = v43;
  v107 = 6000;
  swift_errorRetain();
  v45 = sub_1000549A0();
  LOBYTE(v44) = static _ErrorCodeProtocol.~= infix(_:_:)(&v107, v3, v44, v45);
  swift_errorRelease();
  if ((v44 & 1) == 0)
  {
LABEL_20:
    v49 = v109;
    return sub_10000A9B0(v49, v15);
  }
  swift_errorRelease();
  v46 = a1[3];
  v47 = a1[4];
  sub_100005EF8(a1, v46);
  v48 = v109;
  (*(void (**)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t))(v47 + 40))(qword_1001B4FE8, unk_1001B4FF0, v109, v15, v46, v47);
  v49 = v48;
  return sub_10000A9B0(v49, v15);
}

uint64_t sub_10012AB54()
{
  _QWORD *v0;

  sub_100005D3C(v0 + 2);
  sub_100005D3C(v0 + 7);
  swift_release(v0[12]);
  return swift_deallocClassInstance(v0, 104, 7);
}

uint64_t type metadata accessor for PersistenceFactory()
{
  return objc_opt_self(_TtC9SPREngine18PersistenceFactory);
}

uint64_t sub_10012ABA8@<X0>(char a1@<W0>, _QWORD *a2@<X8>)
{
  return sub_10012A63C(a1, a2);
}

uint64_t sub_10012ABC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  BOOL v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSURL **v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint8_t *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint8_t *v46;
  _QWORD *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
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
  id v64;
  _QWORD v65[5];
  _QWORD v66[3];
  uint64_t v67;
  _UNKNOWN **v68;

  v59 = a4;
  v61 = a3;
  v60 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v60 - 8);
  __chkstk_darwin(v60);
  v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URLResourceValues(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = type metadata accessor for Environment(0);
  v68 = &off_10019CC18;
  v66[0] = a1;
  v65[3] = type metadata accessor for SystemInfo();
  v65[4] = &off_10019F8A0;
  v65[0] = a2;
  if (qword_1001AD2B8 != -1)
    swift_once(&qword_1001AD2B8, sub_10012A4E0);
  v13 = type metadata accessor for Logger(0);
  v14 = sub_100003A14(v13, (uint64_t)qword_1001B3920);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.debug.getter();
  v17 = os_log_type_enabled(v15, v16);
  v58 = v14;
  if (v17)
  {
    v18 = (uint8_t *)swift_slowAlloc(12, -1);
    v19 = (void *)swift_slowAlloc(32, -1);
    v64 = v19;
    v57 = v12;
    *(_DWORD *)v18 = 136315138;
    v62 = sub_1000056EC(0xD00000000000002DLL, 0x80000001001711A0, (uint64_t *)&v64);
    v12 = v57;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v18 + 4, v18 + 12);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "PersistenceFactory.%s", v18, 0xCu);
    swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1, -1);
    swift_slowDealloc(v18, -1, -1);
  }

  v20 = v59;
  sub_100008390((uint64_t)v66, v59 + 16);
  sub_100008390((uint64_t)v65, v20 + 56);
  v21 = v61;
  *(_QWORD *)(v20 + 96) = v61;
  v22 = (void *)objc_opt_self(NSFileManager);
  swift_retain(v21);
  v23 = objc_msgSend(v22, "defaultManager");
  v24 = (NSURL **)sub_100005EF8(v66, v67);
  URL._bridgeToObjectiveC()(*v24);
  v26 = v25;
  v64 = 0;
  v27 = objc_msgSend(v23, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v25, 1, 0, &v64);

  v28 = v64;
  if (v27)
  {
    v29 = Logger.logObject.getter(v64);
    v30 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Storage folder created", v31, 2u);
      swift_slowDealloc(v31, -1, -1);
    }

  }
  else
  {
    v32 = v64;
    v33 = _convertNSErrorToError(_:)(v28);

    swift_willThrow(v34);
    swift_errorRetain(v33);
    v35 = swift_errorRetain(v33);
    v36 = Logger.logObject.getter(v35);
    v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v54 = v8;
      v38 = swift_slowAlloc(12, -1);
      v57 = v12;
      v39 = (uint8_t *)v38;
      v40 = (void *)swift_slowAlloc(32, -1);
      v64 = v40;
      v55 = v6;
      v56 = v9;
      *(_DWORD *)v39 = 136315138;
      v62 = v33;
      swift_errorRetain(v33);
      v41 = sub_100003A2C((uint64_t *)&unk_1001B1280);
      v42 = String.init<A>(describing:)(&v62, v41);
      v44 = v43;
      v62 = sub_1000056EC(v42, v43, (uint64_t *)&v64);
      v6 = v55;
      v9 = v56;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v39 + 4, v39 + 12);
      v45 = v44;
      v8 = v54;
      swift_bridgeObjectRelease(v45);
      swift_errorRelease(v33);
      swift_errorRelease(v33);
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Unable to create storage folder: %s", v39, 0xCu);
      swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1, -1);
      v46 = v39;
      v12 = v57;
      swift_slowDealloc(v46, -1, -1);

      swift_errorRelease(v33);
    }
    else
    {
      swift_errorRelease(v33);
      swift_errorRelease(v33);
      swift_errorRelease(v33);

    }
  }
  URLResourceValues.init()();
  URLResourceValues.isExcludedFromBackup.setter(1);
  v47 = sub_100005EF8(v66, v67);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, *v47 + OBJC_IVAR____TtC9SPREngine11Environment_storageURL, v60);
  v48 = URL.setResourceValues(_:)(v12);
  v49 = Logger.logObject.getter(v48);
  v50 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v51 = 0;
    _os_log_impl((void *)&_mh_execute_header, v49, v50, "Storage folder excluded from backup", v51, 2u);
    swift_slowDealloc(v51, -1, -1);
  }

  swift_release(v61);
  sub_100005D3C(v65);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v60);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_100005D3C(v66);
  return v59;
}

uint64_t sub_10012B3B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[3];
  uint64_t v19;
  _UNKNOWN **v20;
  _QWORD v21[3];
  uint64_t v22;
  _UNKNOWN **v23;

  v22 = type metadata accessor for Environment(0);
  v23 = &off_10019CC18;
  v21[0] = a1;
  v19 = type metadata accessor for SystemInfo();
  v20 = &off_10019F8A0;
  v18[0] = a2;
  v6 = type metadata accessor for PersistenceFactory();
  v7 = swift_allocObject(v6, 104, 7);
  v8 = sub_10001A64C((uint64_t)v21, v22);
  __chkstk_darwin(v8);
  v10 = (_QWORD *)((char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v11 + 16))(v10);
  v12 = sub_10001A64C((uint64_t)v18, v19);
  __chkstk_darwin(v12);
  v14 = (_QWORD *)((char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v15 + 16))(v14);
  v16 = sub_10012ABC8(*v10, *v14, a3, v7);
  sub_100005D3C(v18);
  sub_100005D3C(v21);
  return v16;
}

uint64_t sub_10012B504(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];

  sub_1000DEDE4();
  if (v1)
  {
    swift_release(a1);
  }
  else
  {
    sub_1000DF314();
    v5 = sub_1000E319C();
    v6 = sub_10001A64C((uint64_t)v15, v15[3]);
    __chkstk_darwin(v6);
    v8 = (_QWORD *)((char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v9 + 16))(v8);
    v10 = sub_10001A64C((uint64_t)v14, v14[3]);
    __chkstk_darwin(v10);
    v12 = (_QWORD *)((char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v13 + 16))(v12);
    v2 = sub_10012B3B8(*v8, *v12, v5);
    sub_100005D3C(v14);
    sub_100005D3C(v15);
    swift_release(a1);
  }
  return v2;
}

uint64_t sub_10012B690()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_1000039D4(v0, qword_1001B3A10);
  v1 = sub_100003A14(v0, (uint64_t)qword_1001B3A10);
  if (qword_1001AD180 != -1)
    swift_once(&qword_1001AD180, sub_1000CC92C);
  v2 = sub_100003A14(v0, (uint64_t)qword_1001B4E70);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_10012B720()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_1000039D4(v0, qword_1001B3A28);
  v1 = sub_100003A14(v0, (uint64_t)qword_1001B3A28);
  if (qword_1001AD168 != -1)
    swift_once(&qword_1001AD168, sub_1000CC6D0);
  v2 = sub_100003A14(v0, (uint64_t)qword_1001B4E28);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

unint64_t sub_10012B7B0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  Swift::String v3;
  Swift::String v4;
  void *v5;
  uint64_t v6;
  Swift::String v7;
  Swift::String v8;

  _StringGuts.grow(_:)(23);
  swift_bridgeObjectRelease(0xE000000000000000);
  v1 = v0[2];
  v2 = (void *)v0[3];
  swift_bridgeObjectRetain(v2);
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(v2);
  v4._countAndFlagsBits = 0x203A656C6F72202CLL;
  v4._object = (void *)0xE800000000000000;
  String.append(_:)(v4);
  v6 = v0[5];
  v5 = (void *)v0[6];
  swift_bridgeObjectRetain(v5);
  v7._countAndFlagsBits = v6;
  v7._object = v5;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(v5);
  v8._countAndFlagsBits = 41;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  return 0xD000000000000011;
}

uint64_t sub_10012B88C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SEL v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  SEL v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  SEL v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v41;
  uint64_t v42;

  v1 = v0;
  if (qword_1001AD2D0 != -1)
    swift_once(&qword_1001AD2D0, sub_10012B720);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100003A14(v2, (uint64_t)qword_1001B3A28);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v42 = v7;
    *(_DWORD *)v6 = 136315138;
    v41 = sub_1000056EC(0x656E676953414142, 0xE900000000000072, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v6 + 4, v6 + 12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s deinit", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }

  v8 = *(_QWORD *)(v1 + 352);
  v9 = swift_retain();
  dispatch thunk of DispatchWorkItem.cancel()(v9);
  swift_release(v8);
  v10 = *(_QWORD *)(v1 + 88);
  v11 = *(_QWORD *)(v1 + 96);
  sub_100005EF8((_QWORD *)(v1 + 64), v10);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v10, v11) & 1) != 0)
    sub_10012DD18();
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(v1 + 24), v12, v13, v14, v15, v16, v17, v18);
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(v1 + 48), v19, v20, v21, v22, v23, v24, v25);
  swift_release(*(_QWORD *)(v1 + 56));
  sub_100005D3C((_QWORD *)(v1 + 64));
  sub_100005D3C((_QWORD *)(v1 + 104));

  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(v1 + 160), v26, v27, v28, v29, v30, v31, v32);
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(v1 + 176), v33, v34, v35, v36, v37, v38, v39);
  sub_100005D3C((_QWORD *)(v1 + 184));
  sub_100005D3C((_QWORD *)(v1 + 224));
  sub_100005D3C((_QWORD *)(v1 + 264));
  swift_release(*(_QWORD *)(v1 + 304));
  sub_100005D3C((_QWORD *)(v1 + 312));
  swift_release(*(_QWORD *)(v1 + 352));
  return v1;
}

uint64_t sub_10012BAC8()
{
  uint64_t v0;

  sub_10012B88C();
  return swift_deallocClassInstance(v0, 368, 7);
}

uint64_t type metadata accessor for BAASigner()
{
  return objc_opt_self(_TtC9SPREngine9BAASigner);
}

void sub_10012BB08(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t (*a6)(uint64_t, uint64_t, uint64_t)@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v36;

  v9 = v7;
  v12 = *(_QWORD *)(a1 + 56);
  if (v12)
  {
    v13 = *(_QWORD *)(v12 + 24);
    v14 = *(_QWORD *)(v12 + 32);
    swift_retain();
    sub_100005D9C(v13, v14);
    v15 = sub_10012F6DC();
    sub_100005DE0(v13, v14);
    if ((v15 & 1) != 0)
    {
      v16 = a6(a2, a3, a4);
      if (!v7)
      {
        *a7 = v16;
        a7[1] = v17;
        a7[2] = v12;
        return;
      }
      type metadata accessor for Code(0);
      v19 = v18;
      v36 = 10004;
      swift_errorRetain();
      v20 = sub_100005F1C(&qword_1001AC6C8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_10015BEC0);
      LOBYTE(v19) = static _ErrorCodeProtocol.~= infix(_:_:)(&v36, v7, v19, v20);
      swift_errorRelease();
      if ((v19 & 1) == 0 || (a5 & 1) == 0)
      {
        swift_release(v12);
        return;
      }
      swift_errorRelease();
      if (qword_1001AD2D0 != -1)
        swift_once(&qword_1001AD2D0, sub_10012B720);
      v21 = type metadata accessor for Logger(0);
      v22 = sub_100003A14(v21, (uint64_t)qword_1001B3A28);
      v23 = Logger.logObject.getter(v22);
      v24 = static os_log_type_t.error.getter(v23);
      if (os_log_type_enabled(v23, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Recoverable signature failure", v25, 2u);
        swift_slowDealloc(v25, -1, -1);
      }

      v9 = 0;
    }
    sub_10012DD18();
    swift_release(v12);
  }
  if ((a5 & 1) != 0)
  {
    sub_10012C888();
    if (!v9)
    {
      v27 = v26;
      v28 = a6(a2, a3, a4);
      v30 = v29;
      sub_10012D6F4(v27);
      sub_10012E180(v27, v32);
      *a7 = v28;
      a7[1] = v30;
      a7[2] = v27;
    }
  }
  else
  {
    v31 = sub_10002460C(10006, 0, 0, 0);
    swift_willThrow(v31);
  }
}

void sub_10012BDC8(_QWORD *a1@<X0>, BOOL *a2@<X8>, double a3@<D0>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  SecCertificateRef v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _TtC14softposreaderd12RemoteReader *v33;
  SEL v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  BOOL v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  double v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  BOOL *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v7 = sub_100003A2C(&qword_1001AD9E0);
  __chkstk_darwin(v7);
  v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Date(0, v10);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v12);
  v18 = a1[7];
  if (v18)
  {
    v57 = v17;
    v58 = (char *)&v55 - v16;
    v56 = v15;
    v59 = a2;
    type metadata accessor for SecCertificate(0);
    v19 = *(_QWORD *)(v18 + 24);
    v20 = *(_QWORD *)(v18 + 32);
    swift_retain();
    sub_100005D9C(v19, v20);
    v21 = static SecCertificateRef.parse(derRepresentation:)();
    sub_100005DE0(v19, v20);
    if (v21)
    {
      v22 = a1[36];
      v23 = a1[37];
      sub_100005EF8(a1 + 33, v22);
      (*(void (**)(SecCertificateRef, uint64_t, uint64_t))(v23 + 8))(v21, v22, v23);
      if (v3)
      {
        v58 = (char *)v21;
        if (qword_1001AD2D0 != -1)
          swift_once(&qword_1001AD2D0, sub_10012B720);
        v24 = type metadata accessor for Logger(0);
        sub_100003A14(v24, (uint64_t)qword_1001B3A28);
        swift_errorRetain();
        v25 = swift_errorRetain();
        v26 = Logger.logObject.getter(v25);
        v27 = static os_log_type_t.error.getter(v26);
        if (os_log_type_enabled(v26, v27))
        {
          v28 = (uint8_t *)swift_slowAlloc(12, -1);
          v29 = swift_slowAlloc(32, -1);
          v62 = v29;
          *(_DWORD *)v28 = 136315138;
          v60 = v3;
          swift_errorRetain();
          v30 = sub_100003A2C((uint64_t *)&unk_1001B1280);
          v31 = String.init<A>(describing:)(&v60, v30);
          v33 = (_TtC14softposreaderd12RemoteReader *)v32;
          v60 = sub_1000056EC(v31, v32, &v62);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v28 + 4, v28 + 12);
          swift_bridgeObjectRelease(v33, v34, v35, v36, v37, v38, v39, v40);
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "Certificate verification failed: %s", v28, 0xCu);
          swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v29, -1, -1);
          swift_slowDealloc(v28, -1, -1);

          swift_release(v18);
          swift_errorRelease();
        }
        else
        {

          swift_release(v18);
          swift_errorRelease();
          swift_errorRelease();
          swift_errorRelease();

        }
        v41 = 0;
      }
      else
      {
        SecCertificateNotValidAfter(v21);
        v42 = v58;
        Date.init(timeIntervalSinceReferenceDate:)(v43);
        sub_100005EF8(a1 + 28, a1[31]);
        sub_10001E61C((uint64_t)v9);
        v44 = v56;
        v45 = v57;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v9, 1, v56) == 1)
        {
          v46 = v44;
          sub_10001A448((uint64_t)v9);
          if (qword_1001AD2D0 != -1)
            swift_once(&qword_1001AD2D0, sub_10012B720);
          v47 = type metadata accessor for Logger(0);
          v48 = sub_100003A14(v47, (uint64_t)qword_1001B3A28);
          v49 = Logger.logObject.getter(v48);
          v50 = static os_log_type_t.error.getter(v49);
          if (os_log_type_enabled(v49, v50))
          {
            v51 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v51 = 0;
            _os_log_impl((void *)&_mh_execute_header, v49, v50, "Could not calculate secure now", v51, 2u);
            v45 = v57;
            swift_slowDealloc(v51, -1, -1);
          }

          swift_release(v18);
          (*(void (**)(char *, uint64_t))(v45 + 8))(v58, v46);
          v41 = 0;
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v14, v9, v44);
          v52 = Date.timeIntervalSince(_:)(v14);

          swift_release(v18);
          v53 = v44;
          v54 = *(void (**)(char *, uint64_t))(v45 + 8);
          v54(v14, v53);
          v54(v42, v53);
          v41 = v52 > a3;
        }
      }
      a2 = v59;
    }
    else
    {
      swift_release(v18);
      v41 = 0;
      a2 = v59;
    }
  }
  else
  {
    v41 = 0;
  }
  *a2 = v41;
}

void sub_10012C2BC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _TtC14softposreaderd12RemoteReader *v30;
  SEL v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  _QWORD v47[3];
  char v48[8];
  uint64_t v49;

  v2 = v1;
  v4 = sub_100003A2C(&qword_1001AD9E0);
  __chkstk_darwin(v4);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Date(0, v7);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v45 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001AD2D0 != -1)
    swift_once(&qword_1001AD2D0, sub_10012B720);
  v11 = type metadata accessor for Logger(0);
  v12 = sub_100003A14(v11, (uint64_t)qword_1001B3A28);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v42 = v9;
    v15 = swift_slowAlloc(12, -1);
    v43 = v8;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc(32, -1);
    v44 = v1;
    v18 = v17;
    v49 = v17;
    *(_DWORD *)v16 = 136315138;
    v46 = sub_1000056EC(0x656E676953414142, 0xE900000000000072, &v49);
    v9 = v42;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, v47, v16 + 4, v16 + 12);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s.renewImmediately()", v16, 0xCu);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    v19 = v18;
    v2 = v44;
    swift_slowDealloc(v19, -1, -1);
    v20 = v16;
    v8 = v43;
    swift_slowDealloc(v20, -1, -1);
  }

  v21 = a1[7];
  if (v21)
  {
    sub_100005EF8(a1 + 28, a1[31]);
    swift_retain();
    sub_10001E61C((uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
    {
      v38 = (uint64_t)v45;
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v45, v6, v8);
      sub_10012E560(*(void ***)(v21 + 16), v38, 0);
      swift_release(v21);
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v38, v8);
      return;
    }
    swift_release(v21);
    sub_10001A448((uint64_t)v6);
  }
  sub_10012C888();
  if (v2)
  {
    swift_errorRetain();
    v23 = swift_errorRetain();
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = swift_slowAlloc(32, -1);
      v49 = v27;
      *(_DWORD *)v26 = 136315138;
      swift_getErrorValue(v2, v48, v47);
      v28 = Error.localizedDescription.getter(v47[1], v47[2]);
      v30 = (_TtC14softposreaderd12RemoteReader *)v29;
      v46 = sub_1000056EC(v28, v29, &v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, v47, v26 + 4, v26 + 12);
      swift_bridgeObjectRelease(v30, v31, v32, v33, v34, v35, v36, v37);
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Error creating identity: %s", v26, 0xCu);
      swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();

    }
  }
  else
  {
    v39 = v22;
    sub_10012D6F4(v22);
    sub_10012E180(v39, v40);
    swift_release(v39);
  }
}

void sub_10012C888()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  _QWORD *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  NSObject *v51;
  uint64_t isa;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t inited;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  Swift::String v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint8_t *v69;
  uint64_t v70;
  _QWORD *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v2 = v0;
  v3 = type metadata accessor for UUID(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001AD2D0 != -1)
    swift_once(&qword_1001AD2D0, sub_10012B720);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100003A14(v6, (uint64_t)qword_1001B3A28);
  v8 = swift_retain_n(v2, 2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.debug.getter();
  v11 = os_log_type_enabled(v9, v10);
  v70 = v7;
  v71 = v1;
  v72 = v5;
  if (v11)
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v75 = v13;
    *(_DWORD *)v12 = 136315138;
    v69 = v12 + 4;
    swift_retain(v2);
    v14 = sub_10012B7B0();
    v16 = v15;
    swift_release(v2);
    v74 = sub_1000056EC(v14, v16, &v75);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v69, v12 + 12);
    swift_release_n(v2, 2);
    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s.createIdentity()", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

    swift_release_n(v2, 2);
  }
  v17 = *(_QWORD *)(v2 + 160);
  v18 = *(_QWORD *)(v2 + 360);
  v19 = (void **)*(id *)(v2 + 152);
  v20 = swift_bridgeObjectRetain(v17);
  UUID.init()(v20);
  if (qword_1001AD308 != -1)
    swift_once(&qword_1001AD308, sub_10013E994);
  v21 = static GlobalState.shared;
  objc_msgSend(*(id *)(static GlobalState.shared + 72), "lock");
  while (*(uint64_t *)(v21 + 96) > 0 || *(_BYTE *)(v21 + 80) == 1)
    objc_msgSend(*(id *)(v21 + 72), "wait");
  v22 = *(_QWORD *)(v21 + 88);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
  {
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  *(_QWORD *)(v21 + 88) = v24;
  objc_msgSend(*(id *)(v21 + 72), "unlock");
  if (*(_BYTE *)(v21 + 56))
    v25 = 0;
  else
    v25 = *(_DWORD *)(v21 + 52);
  objc_msgSend(*(id *)(v21 + 72), "lock");
  v26 = *(_QWORD *)(v21 + 88);
  v23 = __OFSUB__(v26, 1);
  v27 = v26 - 1;
  if (v23)
    goto LABEL_32;
  *(_QWORD *)(v21 + 88) = v27;
  if (!v27)
    objc_msgSend(*(id *)(v21 + 72), "broadcast");
  TMGetKernelMonotonicClock(objc_msgSend(*(id *)(v21 + 72), "unlock"));
  v28 = static Data.randomBytes(count:)(0x10uLL);
  v29 = (uint64_t)v71;
  v31 = sub_1001429CC((uint64_t)v72, v25, v19, v17, v28, v30, v18);
  v32 = v31;
  if (!v29)
  {
    isa = (uint64_t)v31[3].isa;
    v53 = (unint64_t)v31[4].isa;
    sub_100005D9C(isa, v53);
    sub_10012FA10(isa, v53);
    sub_100005DE0(isa, v53);
    v54 = *(_QWORD *)(v2 + 128);
    v72 = *(char **)(v2 + 136);
    v71 = sub_100005EF8((_QWORD *)(v2 + 104), v54);
    v55 = sub_100003A2C(&qword_1001ADA18);
    inited = swift_initStackObject(v55, &v73);
    *(_OWORD *)(inited + 16) = xmmword_10015A6C0;
    *(_QWORD *)(inited + 32) = 1701605234;
    *(_QWORD *)(inited + 40) = 0xE400000000000000;
    v57 = *(_QWORD *)(v2 + 32);
    *(_QWORD *)(inited + 72) = &type metadata for Int;
    *(_QWORD *)(inited + 80) = &protocol witness table for Int;
    *(_QWORD *)(inited + 48) = v57;
    *(_QWORD *)(inited + 88) = 0x747365676964;
    *(_QWORD *)(inited + 96) = 0xE600000000000000;
    v58 = (uint64_t)v32[3].isa;
    v59 = (unint64_t)v32[4].isa;
    swift_retain(v32);
    sub_100005D9C(v58, v59);
    Data.sha256Digest.getter(v58, v59);
    v61 = v60;
    v63 = v62;
    sub_100005DE0(v58, v59);
    v64 = Data.base64EncodedString(options:)(0);
    sub_100005DE0(v61, v63);
    swift_release(v32);
    *(_QWORD *)(inited + 128) = &type metadata for String;
    *(_QWORD *)(inited + 136) = &protocol witness table for String;
    *(Swift::String *)(inited + 104) = v64;
    v65 = sub_1000E84EC(inited);
    sub_100115684(8, v65, v54, (uint64_t)v72);
    swift_bridgeObjectRelease(v65);
    return;
  }
  v33 = *(_QWORD *)(v2 + 128);
  v34 = *(_QWORD *)(v2 + 136);
  sub_100005EF8((_QWORD *)(v2 + 104), v33);
  v35 = sub_100003A2C(&qword_1001ADA18);
  v36 = swift_initStackObject(v35, &v76);
  *(_OWORD *)(v36 + 16) = xmmword_10015A6C0;
  *(_QWORD *)(v36 + 32) = 1701605234;
  *(_QWORD *)(v36 + 40) = 0xE400000000000000;
  v37 = *(_QWORD *)(v2 + 32);
  *(_QWORD *)(v36 + 72) = &type metadata for Int;
  *(_QWORD *)(v36 + 80) = &protocol witness table for Int;
  *(_QWORD *)(v36 + 48) = v37;
  *(_QWORD *)(v36 + 88) = 0x726F727265;
  *(_QWORD *)(v36 + 96) = 0xE500000000000000;
  v75 = v29;
  swift_errorRetain(v29);
  v38 = sub_100003A2C((uint64_t *)&unk_1001B1280);
  v39 = String.init<A>(describing:)(&v75, v38);
  *(_QWORD *)(v36 + 128) = &type metadata for String;
  *(_QWORD *)(v36 + 136) = &protocol witness table for String;
  *(_QWORD *)(v36 + 104) = v39;
  *(_QWORD *)(v36 + 112) = v40;
  v41 = sub_1000E84EC(v36);
  sub_100115684(10, v41, v33, v34);
  swift_bridgeObjectRelease(v41);
  v75 = v29;
  swift_errorRetain(v29);
  type metadata accessor for SecurityError(0);
  v43 = v42;
  v44 = swift_dynamicCast(&v74, &v75, v38, v42, 6);
  if ((v44 & 1) == 0)
    goto LABEL_30;
  v45 = v74;
  v46 = sub_100005F1C((unint64_t *)&qword_1001AC6E8, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_10015BE48);
  v47 = _BridgedStoredNSError.code.getter(&v75, v43, v46);
  if (v75 != 10002)
  {

LABEL_30:
    swift_willThrow(v44);
    return;
  }
  v48 = Logger.logObject.getter(v47);
  v49 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "BAA certificate creation failed, increase validity for next attempt", v50, 2u);
    swift_slowDealloc(v50, -1, -1);
    v51 = v45;
  }
  else
  {
    v51 = v48;
    v48 = v45;
  }

  v66 = *(_QWORD *)(v2 + 360);
  v23 = __OFADD__(v66, 86400);
  v67 = v66 + 86400;
  if (!v23)
  {
    if (v67 <= 600000)
      *(_QWORD *)(v2 + 360) = v67;
    goto LABEL_30;
  }
LABEL_33:
  __break(1u);
}

uint64_t sub_10012CF58()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  void *v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t result;
  uint64_t v29;
  unint64_t v30;
  _QWORD v31[4];
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v1 = v0;
  v35 = type metadata accessor for String.Encoding(0);
  v2 = *(_QWORD *)(v35 - 8);
  __chkstk_darwin(v35);
  v34 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001AD2D0 != -1)
    swift_once(&qword_1001AD2D0, sub_10012B720);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100003A14(v4, (uint64_t)qword_1001B3A28);
  v6 = swift_retain_n(v1, 2);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.debug.getter();
  v9 = os_log_type_enabled(v7, v8);
  v31[3] = v5;
  v33 = v2;
  if (v9)
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v36 = v11;
    *(_DWORD *)v10 = 136315138;
    swift_retain(v1);
    v12 = sub_10012B7B0();
    v14 = v13;
    swift_release(v1);
    v38 = sub_1000056EC(v12, v14, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v10 + 4, v10 + 12);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s.loadIdentity()", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

    swift_release_n(v1, 2);
  }
  v15 = v1[11];
  v32 = v1[12];
  v31[1] = v1 + 8;
  sub_100005EF8(v1 + 8, v15);
  v16 = v1[3];
  v31[0] = v1[2];
  v36 = v31[0];
  v37 = v16;
  swift_bridgeObjectRetain(v16);
  v17._countAndFlagsBits = 58;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  v18 = v1[5];
  v19 = (void *)v1[6];
  swift_bridgeObjectRetain(v19);
  v31[2] = v18;
  v20._countAndFlagsBits = v18;
  v20._object = v19;
  String.append(_:)(v20);
  v21 = swift_bridgeObjectRelease(v19);
  v22 = v36;
  v23 = v37;
  v24 = v34;
  static String.Encoding.utf8.getter(v21);
  v25 = String.data(using:allowLossyConversion:)(v24, 0, v22, v23);
  v27 = v26;
  swift_bridgeObjectRelease(v23);
  result = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v24, v35);
  if (v27 >> 60 == 15)
  {
    __break(1u);
    __break(1u);
  }
  else
  {
    v29 = sub_100003A2C(&qword_1001B3CA8);
    v30 = sub_10013202C();
    sub_1000BC0E8(v25, v27, v15, v29, v32, v30);
    sub_10000A9B0(v25, v27);
    return v38;
  }
  return result;
}

uint64_t sub_10012D6F4(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t result;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  void *v39;
  uint64_t v40;
  Swift::String v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t inited;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  Swift::String v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  _QWORD *v70;
  unint64_t v71;
  char v72[144];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v2 = v1;
  v4 = type metadata accessor for String.Encoding(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = (_QWORD *)type metadata accessor for JSONEncoder.OutputFormatting(0);
  v69 = *(v70 - 1);
  __chkstk_darwin(v70);
  v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001AD2D0 != -1)
    swift_once(&qword_1001AD2D0, sub_10012B720);
  v10 = type metadata accessor for Logger(0);
  sub_100003A14(v10, (uint64_t)qword_1001B3A28);
  swift_retain_n(v1, 2);
  v11 = swift_retain_n(a1, 2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.debug.getter();
  v14 = os_log_type_enabled(v12, v13);
  v68 = (_QWORD *)v4;
  v67 = v5;
  if (v14)
  {
    v15 = swift_slowAlloc(22, -1);
    v66 = v7;
    v16 = v15;
    v65 = swift_slowAlloc(64, -1);
    v73 = v65;
    *(_DWORD *)v16 = 136315394;
    swift_retain(v1);
    v17 = sub_10012B7B0();
    v19 = v18;
    swift_release(v2);
    v75 = sub_1000056EC(v17, v19, &v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v16 + 4, v16 + 12);
    v20 = v2;
    swift_release_n(v2, 2);
    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v16 + 12) = 2080;
    v21 = sub_10014114C();
    v23 = v22;
    v75 = sub_1000056EC(v21, v22, &v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v16 + 14, v16 + 22);
    swift_release_n(a1, 2);
    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s.saveIdentity(identity: %s)", (uint8_t *)v16, 0x16u);
    v24 = v65;
    swift_arrayDestroy(v65, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    v25 = v16;
    v7 = v66;
    swift_slowDealloc(v25, -1, -1);

  }
  else
  {

    swift_release_n(a1, 2);
    v20 = v1;
    swift_release_n(v1, 2);
  }
  type metadata accessor for JSONEncoder(0);
  v73 = a1;
  v26 = type metadata accessor for BAASigningIdentity(0);
  v27 = sub_100005F1C(&qword_1001B3CA0, type metadata accessor for BAASigningIdentity, (uint64_t)&unk_100163D50);
  default argument 1 of static JSONEncoder.encodeClean<A>(_:outputFormatting:)();
  v28 = v71;
  static JSONEncoder.encodeClean<A>(_:outputFormatting:)((uint64_t)&v73, (uint64_t)v9, v26, v27);
  if (v28)
    return (*(uint64_t (**)(char *, _QWORD *))(v69 + 8))(v9, v70);
  v32 = v29;
  v71 = v30;
  v66 = (char *)a1;
  (*(void (**)(char *, _QWORD *))(v69 + 8))(v9, v70);
  v33 = v20;
  v34 = v20 + 8;
  v35 = v20[11];
  v36 = v33[12];
  sub_100005EF8(v34, v35);
  v37 = v33[3];
  v73 = v33[2];
  v74 = v37;
  swift_bridgeObjectRetain(v37);
  v38._countAndFlagsBits = 58;
  v38._object = (void *)0xE100000000000000;
  String.append(_:)(v38);
  v70 = v33;
  v40 = v33[5];
  v39 = (void *)v33[6];
  swift_bridgeObjectRetain(v39);
  v41._countAndFlagsBits = v40;
  v41._object = v39;
  String.append(_:)(v41);
  v42 = swift_bridgeObjectRelease(v39);
  v43 = v73;
  v44 = v74;
  static String.Encoding.utf8.getter(v42);
  v45 = String.data(using:allowLossyConversion:)(v7, 0, v43, v44);
  v46 = v7;
  v47 = v45;
  v49 = v48;
  swift_bridgeObjectRelease(v44);
  result = (*(uint64_t (**)(char *, _QWORD *))(v67 + 8))(v46, v68);
  if (v49 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v36 + 40))(v47, v49, v32, v71, v35, v36);
    sub_10000A9B0(v47, v49);
    v50 = v70;
    v51 = v70[16];
    v69 = v70[17];
    v68 = sub_100005EF8(v70 + 13, v51);
    v52 = sub_100003A2C(&qword_1001ADA18);
    inited = swift_initStackObject(v52, v72);
    *(_OWORD *)(inited + 16) = xmmword_10015A6C0;
    *(_QWORD *)(inited + 32) = 1701605234;
    *(_QWORD *)(inited + 40) = 0xE400000000000000;
    v54 = v50[4];
    *(_QWORD *)(inited + 72) = &type metadata for Int;
    *(_QWORD *)(inited + 80) = &protocol witness table for Int;
    *(_QWORD *)(inited + 48) = v54;
    *(_QWORD *)(inited + 88) = 0x747365676964;
    *(_QWORD *)(inited + 96) = 0xE600000000000000;
    v55 = v66;
    v67 = v32;
    v56 = *((_QWORD *)v66 + 3);
    v57 = *((_QWORD *)v66 + 4);
    swift_retain(v66);
    sub_100005D9C(v56, v57);
    Data.sha256Digest.getter(v56, v57);
    v59 = v58;
    v61 = v60;
    sub_100005DE0(v56, v57);
    v62 = Data.base64EncodedString(options:)(0);
    sub_100005DE0(v59, v61);
    swift_release(v55);
    *(_QWORD *)(inited + 128) = &type metadata for String;
    *(_QWORD *)(inited + 136) = &protocol witness table for String;
    *(Swift::String *)(inited + 104) = v62;
    v63 = sub_1000E84EC(inited);
    sub_100115684(9, v63, v51, v69);
    sub_100005DE0(v67, v71);
    swift_bridgeObjectRelease(v63);
    v64 = v50[7];
    v50[7] = v55;
    swift_retain(v55);
    return swift_release(v64);
  }
  return result;
}

void sub_10012DD18()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  void *v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v1 = v0;
  v2 = type metadata accessor for String.Encoding(0);
  v31 = *(_QWORD *)(v2 - 8);
  v32 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001AD2D0 != -1)
    swift_once(&qword_1001AD2D0, sub_10012B720);
  v5 = type metadata accessor for Logger(0);
  v6 = sub_100003A14(v5, (uint64_t)qword_1001B3A28);
  v7 = swift_retain_n(v1, 2);
  v30[1] = v6;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v35 = v11;
    *(_DWORD *)v10 = 136315138;
    swift_retain(v1);
    v12 = sub_10012B7B0();
    v14 = v13;
    swift_release(v1);
    v33 = sub_1000056EC(v12, v14, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v10 + 4, v10 + 12);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s.deleteIdentity()", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    v15 = v1[7];
    if (!v15)
      return;
  }
  else
  {

    swift_release_n(v1, 2);
    v15 = v1[7];
    if (!v15)
      return;
  }
  v16 = v1[11];
  v17 = v1[12];
  sub_100005EF8(v1 + 8, v16);
  v18 = v1[3];
  v35 = v1[2];
  v36 = v18;
  swift_retain(v15);
  swift_bridgeObjectRetain(v18);
  v19._countAndFlagsBits = 58;
  v19._object = (void *)0xE100000000000000;
  String.append(_:)(v19);
  v20 = v1[5];
  v21 = (void *)v1[6];
  swift_bridgeObjectRetain(v21);
  v22._countAndFlagsBits = v20;
  v22._object = v21;
  String.append(_:)(v22);
  v23 = swift_bridgeObjectRelease(v21);
  v24 = v35;
  v25 = v36;
  static String.Encoding.utf8.getter(v23);
  v26 = String.data(using:allowLossyConversion:)(v4, 0, v24, v25);
  v28 = v27;
  swift_bridgeObjectRelease(v25);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v4, v32);
  if (v28 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v17 + 48))(v26, v28, v16, v17);
    sub_10000A9B0(v26, v28);
    sub_100140460();
    swift_release(v15);
    v29 = v1[7];
    v1[7] = 0;
    swift_release(v29);
  }
}

void sub_10012E180(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  SecCertificateRef v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v3 = v2;
  v5 = type metadata accessor for Date(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001AD2D0 != -1)
    swift_once(&qword_1001AD2D0, sub_10012B720);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_100003A14(v9, (uint64_t)qword_1001B3A28);
  v11 = swift_retain(v3);
  v37 = v10;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(22, -1);
    v15 = swift_slowAlloc(64, -1);
    v36 = a1;
    v34 = v15;
    v39 = v15;
    *(_DWORD *)v14 = 136315394;
    v35 = v8;
    v38 = sub_1000056EC(0x656E676953414142, 0xE900000000000072, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v14 + 4, v14 + 12);
    *(_WORD *)(v14 + 12) = 2080;
    v16 = v6;
    v17 = v5;
    v19 = *(_QWORD *)(v3 + 40);
    v18 = *(_QWORD *)(v3 + 48);
    swift_bridgeObjectRetain(v18);
    v20 = v19;
    v5 = v17;
    v6 = v16;
    v38 = sub_1000056EC(v20, v18, &v39);
    v8 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v14 + 14, v14 + 22);
    swift_release(v3);
    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "scheduleRenewal of %s for %s", (uint8_t *)v14, 0x16u);
    v21 = v34;
    swift_arrayDestroy(v34, 2, (char *)&type metadata for Any + 8);
    a1 = v36;
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v14, -1, -1);

  }
  else
  {

    swift_release(v3);
  }
  type metadata accessor for SecCertificate(0);
  v22 = *(_QWORD *)(a1 + 24);
  v23 = *(_QWORD *)(a1 + 32);
  sub_100005D9C(v22, v23);
  v24 = static SecCertificateRef.parse(derRepresentation:)();
  sub_100005DE0(v22, v23);
  if (v24)
  {
    v25 = SecCertificateNotValidAfter(v24);
    Date.init(timeIntervalSinceReferenceDate:)(v25);
    sub_10012E560(*(void ***)(a1 + 16), (uint64_t)v8, 0);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    v26 = swift_retain_n(a1, 2);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = swift_slowAlloc(32, -1);
      v39 = v30;
      *(_DWORD *)v29 = 136315138;
      v31 = sub_10014114C();
      v33 = v32;
      v38 = sub_1000056EC(v31, v32, &v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v29 + 4, v29 + 12);
      swift_release_n(a1, 2);
      swift_bridgeObjectRelease(v33);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Invalid X.509 format (BAA). Not renewing: %s", v29, 0xCu);
      swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);

    }
    else
    {

      swift_release_n(a1, 2);
    }
  }
}

void sub_10012E560(void **a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
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
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  void **v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void **v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  void (*v49)(char *, uint64_t, uint64_t);
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  double v56;
  char *v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  void **v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  void (*v73)(char *, uint64_t);
  void **v74;
  char *v75;
  uint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  uint8_t *v79;
  void **v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  double *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  double *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  void (*v102)(char *, uint64_t);
  char *v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(char *, char *, uint64_t);
  uint64_t v107;
  _QWORD *v108;
  void (*v109)(char *, void **);
  uint64_t v110;
  char *v111;
  uint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  char *v118;
  char *v119;
  uint64_t (*v120)(char *, uint64_t, uint64_t);
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  void **v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void **aBlock;
  _QWORD v130[4];
  double *v131;

  v4 = v3;
  v112 = a3;
  v117 = type metadata accessor for DispatchTime(0);
  v115 = *(_QWORD *)(v117 - 8);
  v7 = __chkstk_darwin(v117);
  v114 = (char *)&v106 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v116 = (char *)&v106 - v9;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  __chkstk_darwin(v10);
  v113 = (char *)&v106 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100003A2C(&qword_1001AD9E0);
  __chkstk_darwin(v12);
  v123 = (uint64_t)&v106 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Date(0, v14);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = __chkstk_darwin(v15);
  v111 = (char *)&v106 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __chkstk_darwin(v17);
  v118 = (char *)&v106 - v20;
  v21 = __chkstk_darwin(v19);
  v119 = (char *)&v106 - v22;
  v23 = __chkstk_darwin(v21);
  v25 = (char *)&v106 - v24;
  v110 = v26;
  __chkstk_darwin(v23);
  v28 = (char *)&v106 - v27;
  if (qword_1001AD2D0 != -1)
    swift_once(&qword_1001AD2D0, sub_10012B720);
  v29 = type metadata accessor for Logger(0);
  v30 = sub_100003A14(v29, (uint64_t)qword_1001B3A28);
  v120 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v31 = v120(v28, a2, v15);
  v121 = v30;
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.info.getter();
  v34 = os_log_type_enabled(v32, v33);
  v122 = v25;
  v124 = a2;
  if (v34)
  {
    v35 = swift_slowAlloc(22, -1);
    v108 = v4;
    v125 = (void **)v15;
    v36 = v35;
    v37 = (void **)swift_slowAlloc(64, -1);
    aBlock = v37;
    *(_DWORD *)v36 = 136315394;
    v126 = sub_1000056EC(0x656E676953414142, 0xE900000000000072, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, &v127, v36 + 4, v36 + 12);
    *(_WORD *)(v36 + 12) = 2080;
    v38 = sub_100005F1C((unint64_t *)&qword_1001ADA00, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    v39 = dispatch thunk of CustomStringConvertible.description.getter(v125, v38);
    v41 = v40;
    v126 = sub_1000056EC(v39, v40, (uint64_t *)&aBlock);
    a2 = v124;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, &v127, v36 + 14, v36 + 22);
    swift_bridgeObjectRelease(v41);
    v109 = *(void (**)(char *, void **))(v16 + 8);
    v109(v28, v125);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "%s.scheduleRenewal using expirationDate: %s", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy(v37, 2, (char *)&type metadata for Any + 8);
    v42 = v37;
    v25 = v122;
    swift_slowDealloc(v42, -1, -1);
    v43 = v36;
    v15 = (uint64_t)v125;
    v4 = v108;
    swift_slowDealloc(v43, -1, -1);
  }
  else
  {
    v109 = *(void (**)(char *, void **))(v16 + 8);
    v109(v28, (void **)v15);
  }

  sub_100005EF8(v4 + 28, v4[31]);
  v44 = v123;
  sub_10001E61C(v123);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v44, 1, v15) == 1)
  {
    v45 = sub_10001A448(v44);
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v48 = 134217984;
      aBlock = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v130, v48 + 4, v48 + 12);
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Aborting identity #%lld renewal. Could not calculate secure now", v48, 0xCu);
      swift_slowDealloc(v48, -1, -1);
    }

    return;
  }
  v49 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 32);
  v49(v25, v44, v15);
  v50 = Date.timeIntervalSince(_:)(v25);
  if ((~*(_QWORD *)&v50 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (v50 <= -9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v50 >= 9.22337204e18)
  {
LABEL_26:
    __break(1u);
    return;
  }
  v51 = 86400;
  v107 = v16;
  v108 = v4 + 28;
  v106 = (void (*)(char *, char *, uint64_t))v49;
  if ((uint64_t)v50 <= 86400 && (v51 = (uint64_t)v50, (uint64_t)v50 < 301))
  {
    v125 = (void **)v15;
    v76 = swift_retain(v4);
    v77 = Logger.logObject.getter(v76);
    v78 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v77, v78))
    {
      v79 = (uint8_t *)swift_slowAlloc(12, -1);
      v80 = (void **)swift_slowAlloc(32, -1);
      aBlock = v80;
      *(_DWORD *)v79 = 136315138;
      v81 = v4[5];
      v82 = v4[6];
      swift_bridgeObjectRetain(v82);
      v126 = sub_1000056EC(v81, v82, (uint64_t *)&aBlock);
      a2 = v124;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, &v127, v79 + 4, v79 + 12);
      swift_release(v4);
      swift_bridgeObjectRelease(v82);
      _os_log_impl((void *)&_mh_execute_header, v77, v78, "Certificate for %s will be renewed immediately", v79, 0xCu);
      swift_arrayDestroy(v80, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v80, -1, -1);
      swift_slowDealloc(v79, -1, -1);

    }
    else
    {

      swift_release(v4);
    }
    v56 = 0.0;
    v15 = (uint64_t)v125;
    v73 = (void (*)(char *, uint64_t))v109;
  }
  else
  {
    v126 = 300;
    v127 = v51;
    swift_beginAccess(v4 + 23, &aBlock, 33, 0);
    v52 = sub_10001A64C((uint64_t)(v4 + 23), v4[26]);
    sub_100006140();
    v53 = v52;
    a2 = v124;
    static FixedWidthInteger.random<A>(in:using:)(&v128, &v126, v53);
    v54 = swift_endAccess(&aBlock);
    v55 = v119;
    Date.addingTimeInterval(_:)(v54, -(double)v128);
    v56 = Date.timeIntervalSince(_:)(v25);
    v57 = v118;
    v120(v118, (uint64_t)v55, v15);
    v58 = swift_retain_n(v4, 2);
    v59 = Logger.logObject.getter(v58);
    v60 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = swift_slowAlloc(32, -1);
      v125 = (void **)swift_slowAlloc(64, -1);
      aBlock = v125;
      *(_DWORD *)v61 = 136315650;
      v62 = a1;
      v63 = v15;
      v64 = v4[5];
      v65 = v4[6];
      swift_bridgeObjectRetain(v65);
      v126 = sub_1000056EC(v64, v65, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, &v127, v61 + 4, v61 + 12);
      swift_release_n(v4, 2);
      v66 = v65;
      v15 = v63;
      a1 = v62;
      swift_bridgeObjectRelease(v66);
      *(_WORD *)(v61 + 12) = 2080;
      v67 = sub_100005F1C((unint64_t *)&qword_1001ADA00, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
      v68 = v118;
      v69 = dispatch thunk of CustomStringConvertible.description.getter(v15, v67);
      v71 = v70;
      v126 = sub_1000056EC(v69, v70, (uint64_t *)&aBlock);
      a2 = v124;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, &v127, v61 + 14, v61 + 22);
      swift_bridgeObjectRelease(v71);
      v72 = v68;
      v73 = (void (*)(char *, uint64_t))v109;
      v109(v72, (void **)v15);
      *(_WORD *)(v61 + 22) = 2048;
      v126 = *(_QWORD *)&v56;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, &v127, v61 + 24, v61 + 32);
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "Certificate for %s will be renewed on %s (in %f seconds)", (uint8_t *)v61, 0x20u);
      v74 = v125;
      swift_arrayDestroy(v125, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v74, -1, -1);
      swift_slowDealloc(v61, -1, -1);

      v75 = v119;
    }
    else
    {

      v73 = (void (*)(char *, uint64_t))v109;
      v109(v57, (void **)v15);
      swift_release_n(v4, 2);
      v75 = v55;
    }
    v73(v75, v15);
  }
  v83 = v4[44];
  v84 = swift_retain(v83);
  dispatch thunk of DispatchWorkItem.cancel()(v84);
  v85 = swift_release(v83);
  v86 = v113;
  static DispatchWorkItemFlags.barrier.getter(v85);
  v87 = swift_allocObject(&unk_1001A05F8, 24, 7);
  swift_weakInit(v87 + 16, v4);
  v88 = v111;
  v120(v111, a2, v15);
  v89 = *(unsigned __int8 *)(v107 + 80);
  v90 = (v89 + 48) & ~v89;
  v91 = (double *)swift_allocObject(&unk_1001A0620, v90 + v110, v89 | 7);
  *((_QWORD *)v91 + 2) = v87;
  *((_QWORD *)v91 + 3) = a1;
  v91[4] = v56;
  *((_QWORD *)v91 + 5) = v112;
  v106((char *)v91 + v90, v88, v15);
  v130[3] = sub_100131FDC;
  v131 = v91;
  aBlock = _NSConcreteStackBlock;
  v130[0] = 1107296256;
  v130[1] = sub_1000043B8;
  v130[2] = &unk_1001A0638;
  v92 = _Block_copy(&aBlock);
  v93 = type metadata accessor for DispatchWorkItem(0);
  swift_allocObject(v93, *(unsigned int *)(v93 + 48), *(unsigned __int16 *)(v93 + 52));
  swift_retain(v87);
  v94 = DispatchWorkItem.init(flags:block:)(v86, v92);
  v95 = v131;
  swift_release(v87);
  swift_release(v95);
  v96 = v4[44];
  v4[44] = v94;
  swift_release(v96);
  v98 = v4[31];
  v97 = v4[32];
  sub_100005EF8(v108, v98);
  v99 = v15;
  v100 = v114;
  (*(void (**)(uint64_t))(*(_QWORD *)(v97 + 8) + 16))(v98);
  v101 = v116;
  + infix(_:_:)(v100);
  v102 = *(void (**)(char *, uint64_t))(v115 + 8);
  v103 = v100;
  v104 = v117;
  v102(v103, v117);
  v105 = v4[44];
  swift_retain(v105);
  OS_dispatch_queue.asyncAfter(deadline:execute:)(v101, v105);
  swift_release(v105);
  v102(v101, v104);
  v73(v122, v99);
}

void sub_10012F0DC(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  double v21;
  uint64_t v22;
  _BYTE v23[24];

  v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v23, 0, 0);
  Strong = swift_weakLoadStrong(v5);
  if (Strong)
  {
    v7 = Strong;
    v8 = *(_QWORD *)(Strong + 56);
    if (v8 && *(_QWORD *)(v8 + 16) == a2)
    {
      if (qword_1001AD2D0 != -1)
        swift_once(&qword_1001AD2D0, sub_10012B720);
      v9 = type metadata accessor for Logger(0);
      v10 = sub_100003A14(v9, (uint64_t)qword_1001B3A28);
      v11 = Logger.logObject.getter(v10);
      v12 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = swift_slowAlloc(22, -1);
        *(_DWORD *)v13 = 134218240;
        v21 = *(double *)&a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v13 + 4, v13 + 12);
        *(_WORD *)(v13 + 12) = 2048;
        v21 = a3;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v13 + 14, v13 + 22);
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "renew identity #%lld after %fs", (uint8_t *)v13, 0x16u);
        swift_slowDealloc(v13, -1, -1);
      }

      sub_10012DD18();
      sub_10012C888();
      v15 = v14;
      sub_10012D6F4(v14);
      sub_10012E180(v15);
      swift_release(v15);
      swift_release(v7);
      return;
    }
    swift_release(Strong);
  }
  if (qword_1001AD2D0 != -1)
    swift_once(&qword_1001AD2D0, sub_10012B720);
  v16 = type metadata accessor for Logger(0);
  v17 = sub_100003A14(v16, (uint64_t)qword_1001B3A28);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "identity mismatch, abort renewal", v20, 2u);
    swift_slowDealloc(v20, -1, -1);
  }

}

uint64_t sub_10012F6DC()
{
  _QWORD *v0;
  SecCertificateRef v1;
  SecCertificateRef v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24[2];

  type metadata accessor for SecCertificate(0);
  v1 = static SecCertificateRef.parse(derRepresentation:)();
  if (v1)
  {
    v2 = v1;
    v3 = sub_100130CE8();
    if (!v3)
    {
      v10 = v0[36];
      v11 = v0[37];
      sub_100005EF8(v0 + 33, v10);
      (*(void (**)(SecCertificateRef, uint64_t, uint64_t))(v11 + 8))(v2, v10, v11);

      return 1;
    }
    v4 = v3;
    swift_willThrow(v3);

  }
  else
  {
    if (qword_1001AD2D0 != -1)
      swift_once(&qword_1001AD2D0, sub_10012B720);
    v5 = type metadata accessor for Logger(0);
    v6 = sub_100003A14(v5, (uint64_t)qword_1001B3A28);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Invalid X.509 format (BAA)", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

    v4 = sub_10002460C(10005, 0, 0, 0);
    swift_willThrow(v4);
  }
  if (qword_1001AD2D0 != -1)
    swift_once(&qword_1001AD2D0, sub_10012B720);
  v12 = type metadata accessor for Logger(0);
  sub_100003A14(v12, (uint64_t)qword_1001B3A28);
  swift_errorRetain(v4);
  v13 = swift_errorRetain(v4);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(12, -1);
    v17 = swift_slowAlloc(32, -1);
    v23 = v4;
    v24[0] = v17;
    *(_DWORD *)v16 = 136315138;
    swift_errorRetain(v4);
    v18 = sub_100003A2C((uint64_t *)&unk_1001B1280);
    v19 = String.init<A>(describing:)(&v23, v18);
    v21 = v20;
    v23 = sub_1000056EC(v19, v20, v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24, v16 + 4, v16 + 12);
    swift_bridgeObjectRelease(v21);
    swift_errorRelease(v4);
    swift_errorRelease(v4);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Certificate verification failed: %s", v16, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v16, -1, -1);

    swift_errorRelease(v4);
  }
  else
  {
    swift_errorRelease(v4);
    swift_errorRelease(v4);
    swift_errorRelease(v4);

  }
  return 0;
}

uint64_t sub_10012FA10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  __SecCertificate *v6;
  __SecCertificate *v7;
  __SecKey *v8;
  __SecKey *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  Swift::String v45;
  void *object;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  Swift::String v75;
  void *v76;
  Swift::String v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  Swift::String v82;
  void *v83;
  Swift::String v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  Swift::String v103;
  void *v104;
  Swift::String v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  Swift::String v110;
  void *v111;
  Swift::String v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  BOOL v117;
  Swift::String v118;
  Swift::String v119;
  void *v120;
  Swift::String v121;
  Swift::String v122;
  Swift::String v123;
  Swift::String v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  unint64_t v140;
  uint64_t v141;
  char v142;
  Swift::String v143;
  Swift::String v144;
  Swift::String v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  Swift::String v151;
  Swift::String v152;
  Swift::String v153;
  uint64_t v154;
  unint64_t v155;
  unint64_t v156;
  uint64_t v157;
  char v158;
  Swift::String v159;
  Swift::String v160;
  Swift::String v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  char v176;
  _QWORD *v177;

  v3 = v2;
  v177 = _swiftEmptyArrayStorage;
  type metadata accessor for SecCertificate(0);
  v6 = static SecCertificateRef.parse(derRepresentation:)();
  if (v6)
  {
    v7 = v6;
    v8 = SecCertificateCopyKey(v6);
    if (v8)
    {
      v9 = v8;
      if (!SecKeyIsAlgorithmSupported(v8, kSecKeyOperationTypeVerify, kSecKeyAlgorithmECDSASignatureMessageX962SHA1))
      {
        v10 = sub_10002460C(10005, 0xD00000000000001CLL, (void *)0x8000000100168BE0, 0);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v12 = v177[2];
        v11 = v177[3];
        if (v12 >= v11 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v11 > 1, v12 + 1, 1);
        v13 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v12, v10);
        specialized Array._endMutation()(v13);
      }

    }
    else
    {
      v19 = sub_10002460C(10005, 0x696C627570206F4ELL, (void *)0xED000079656B2063, 0);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v21 = v177[2];
      v20 = v177[3];
      if (v21 >= v20 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v20 > 1, v21 + 1, 1);
      v22 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v21, v19);
      specialized Array._endMutation()(v22);
    }
    v23 = (void *)sub_100130CE8();
    if (v23)
    {
      v24 = v23;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v26 = v177[2];
      v25 = v177[3];
      if (v26 >= v25 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
      v27 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v26, v24);
      specialized Array._endMutation()(v27);

    }
    v28 = (void *)sub_100130F04();
    if (v28)
    {
      v29 = v28;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v31 = v177[2];
      v30 = v177[3];
      if (v31 >= v30 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1);
      v32 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v29);
      specialized Array._endMutation()(v32);

    }
    v33 = (void *)sub_100131120();
    if (v33)
    {
      v34 = v33;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v36 = v177[2];
      v35 = v177[3];
      if (v36 >= v35 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v35 > 1, v36 + 1, 1);
      v37 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v36, v34);
      specialized Array._endMutation()(v37);

    }
    sub_10009A2C0((uint64_t)&v169);
    v38 = v170;
    v39 = v172;
    v40 = v175;
    v41 = v176;
    swift_bridgeObjectRelease(v174);
    swift_bridgeObjectRelease(v39);
    swift_bridgeObjectRelease(v38);
    if ((v41 & 1) != 0)
    {
      v42 = 0xD00000000000001DLL;
      v43 = (void *)0x8000000100168A70;
      v44 = 10005;
    }
    else
    {
      if (!v40)
        goto LABEL_33;
      v169 = 0;
      v170 = (void *)0xE000000000000000;
      _StringGuts.grow(_:)(42);
      swift_bridgeObjectRelease(v170);
      v169 = 0xD000000000000028;
      v170 = (void *)0x8000000100171430;
      v45._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
      object = v45._object;
      String.append(_:)(v45);
      swift_bridgeObjectRelease(object);
      v42 = v169;
      v43 = v170;
      v44 = 10010;
    }
    v47 = sub_10002460C(v44, v42, v43, 0);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v49 = v177[2];
    v48 = v177[3];
    if (v49 >= v48 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v48 > 1, v49 + 1, 1);
    v50 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v49, v47);
    specialized Array._endMutation()(v50);
LABEL_33:
    sub_100099A80(&v169);
    v52 = v169;
    v51 = v170;
    v53 = v172;
    swift_bridgeObjectRelease(v174);
    swift_bridgeObjectRelease(v53);
    if (v51)
    {
      sub_100099A80(&v169);
      v54 = v170;
      v55 = v171;
      v56 = v172;
      swift_bridgeObjectRelease(v174);
      swift_bridgeObjectRelease(v54);
      if (v56)
      {
        v166 = v55;
        v168 = a1;
        sub_100099A80(&v169);
        v57 = v170;
        v58 = v173;
        v59 = v174;
        swift_bridgeObjectRelease(v172);
        swift_bridgeObjectRelease(v57);
        if (v59)
        {
          v167 = a2;
          v60 = *(_QWORD *)(v3 + 168);
          v61 = *(void **)(v3 + 176);
          if (v58 == v60 && v59 == v61
            || (_stringCompareWithSmolCheck(_:_:expecting:)(v58, v59, *(_QWORD *)(v3 + 168), *(_QWORD *)(v3 + 176), 0) & 1) != 0)
          {
            swift_bridgeObjectRelease(v59);
          }
          else
          {
            v169 = 0;
            v170 = (void *)0xE000000000000000;
            _StringGuts.grow(_:)(32);
            swift_bridgeObjectRelease(v170);
            v169 = 0xD000000000000015;
            v170 = (void *)0x8000000100168BC0;
            v122._countAndFlagsBits = v58;
            v122._object = v59;
            String.append(_:)(v122);
            swift_bridgeObjectRelease(v59);
            v123._countAndFlagsBits = 0x203A6469657320;
            v123._object = (void *)0xE700000000000000;
            String.append(_:)(v123);
            swift_bridgeObjectRetain(v61);
            v124._countAndFlagsBits = v60;
            v124._object = v61;
            String.append(_:)(v124);
            swift_bridgeObjectRelease(v61);
            v125 = sub_10002460C(10010, v169, v170, 0);
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
            v127 = v177[2];
            v126 = v177[3];
            if (v127 >= v126 >> 1)
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v126 > 1, v127 + 1, 1);
            v128 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v127, v125);
            specialized Array._endMutation()(v128);
          }
          sub_10009A8C8(&v169);
          v129 = v170;
          v165 = v169;
          v130 = v172;
          swift_bridgeObjectRelease(v174);
          swift_bridgeObjectRelease(v130);
          if (v129)
          {
            sub_10009A8C8(&v169);
            v131 = v170;
            v163 = v171;
            v132 = v172;
            swift_bridgeObjectRelease(v174);
            swift_bridgeObjectRelease(v131);
            v164 = v132;
            if (v132)
            {
              v162 = v52;
              sub_10009A8C8(&v169);
              v133 = v170;
              v134 = v173;
              v135 = v174;
              swift_bridgeObjectRelease(v172);
              swift_bridgeObjectRelease(v133);
              if (v135)
              {
                v136 = v134;
                if (v134 == v60 && v135 == v61)
                {
                  swift_bridgeObjectRelease(v135);
                  a2 = v167;
                  v137 = v162;
                }
                else
                {
                  v142 = _stringCompareWithSmolCheck(_:_:expecting:)(v134, v135, v60, v61, 0);
                  v137 = v162;
                  if ((v142 & 1) != 0)
                  {
                    swift_bridgeObjectRelease(v135);
                  }
                  else
                  {
                    v169 = 0;
                    v170 = (void *)0xE000000000000000;
                    _StringGuts.grow(_:)(31);
                    swift_bridgeObjectRelease(v170);
                    v169 = 0xD000000000000014;
                    v170 = (void *)0x80000001001713D0;
                    v143._countAndFlagsBits = v136;
                    v143._object = v135;
                    String.append(_:)(v143);
                    swift_bridgeObjectRelease(v135);
                    v144._countAndFlagsBits = 0x203A6469657320;
                    v144._object = (void *)0xE700000000000000;
                    String.append(_:)(v144);
                    swift_bridgeObjectRetain(v61);
                    v145._countAndFlagsBits = v60;
                    v145._object = v61;
                    String.append(_:)(v145);
                    swift_bridgeObjectRelease(v61);
                    v146 = sub_10002460C(10010, v169, v170, 0);
                    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                    v148 = v177[2];
                    v147 = v177[3];
                    if (v148 >= v147 >> 1)
                      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v147 > 1, v148 + 1, 1);
                    v149 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v148, v146);
                    specialized Array._endMutation()(v149);
                  }
                  a2 = v167;
                }
                v150 = v166;
                if (v137 == v165 && v51 == v129
                  || (_stringCompareWithSmolCheck(_:_:expecting:)(v137, v51, v165, v129, 0) & 1) != 0)
                {
                  swift_bridgeObjectRelease(v129);
                  swift_bridgeObjectRelease(v51);
                  a1 = v168;
                }
                else
                {
                  v169 = 0;
                  v170 = (void *)0xE000000000000000;
                  _StringGuts.grow(_:)(32);
                  swift_bridgeObjectRelease(v170);
                  v169 = 0xD000000000000015;
                  v170 = (void *)0x80000001001713F0;
                  v151._countAndFlagsBits = v137;
                  v151._object = v51;
                  String.append(_:)(v151);
                  swift_bridgeObjectRelease(v51);
                  v152._countAndFlagsBits = 0x203A616162202CLL;
                  v152._object = (void *)0xE700000000000000;
                  String.append(_:)(v152);
                  v153._countAndFlagsBits = v165;
                  v153._object = v129;
                  String.append(_:)(v153);
                  swift_bridgeObjectRelease(v129);
                  v154 = sub_10002460C(10010, v169, v170, 0);
                  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                  v156 = v177[2];
                  v155 = v177[3];
                  if (v156 >= v155 >> 1)
                    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v155 > 1, v156 + 1, 1);
                  v157 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v156, v154);
                  specialized Array._endMutation()(v157);
                  a1 = v168;
                  v150 = v166;
                }
                if (v150 == v163 && v56 == v164)
                {
                  swift_bridgeObjectRelease(v56);
                  swift_bridgeObjectRelease(v164);
                  goto LABEL_46;
                }
                v158 = _stringCompareWithSmolCheck(_:_:expecting:)(v150, v56, v163, v164, 0);
                swift_bridgeObjectRelease(v164);
                if ((v158 & 1) != 0)
                {
                  swift_bridgeObjectRelease(v56);
                  goto LABEL_46;
                }
                v169 = 0;
                v170 = (void *)0xE000000000000000;
                _StringGuts.grow(_:)(32);
                swift_bridgeObjectRelease(v170);
                v169 = 0xD000000000000015;
                v170 = (void *)0x8000000100171410;
                v159._countAndFlagsBits = v150;
                v159._object = v56;
                String.append(_:)(v159);
                v160._countAndFlagsBits = 0x203A616162202CLL;
                v160._object = (void *)0xE700000000000000;
                String.append(_:)(v160);
                v161._countAndFlagsBits = v150;
                v161._object = v56;
                String.append(_:)(v161);
                swift_bridgeObjectRelease(v56);
                v62 = v169;
                v63 = v170;
                v64 = 10010;
                goto LABEL_43;
              }
              swift_bridgeObjectRelease(v129);
              v129 = v164;
            }
            swift_bridgeObjectRelease(v129);
          }
          swift_bridgeObjectRelease(v56);
          swift_bridgeObjectRelease(v51);
          v138 = sub_10002460C(10005, 0xD00000000000001DLL, (void *)0x80000001001713B0, 0);
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          v140 = v177[2];
          v139 = v177[3];
          if (v140 >= v139 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v139 > 1, v140 + 1, 1);
          v141 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v140, v138);
          specialized Array._endMutation()(v141);
          a2 = v167;
          a1 = v168;
LABEL_46:
          v69 = sub_100099EE4();
          if ((v70 & 1) != 0 || (v71 = v69, sub_100099EE4(), (v73 & 1) != 0))
          {
            v85 = 0xD00000000000001ALL;
            v86 = (void *)0x8000000100168B50;
            v87 = 10005;
          }
          else
          {
            v74 = v72;
            if (v71)
            {
              v169 = 0;
              v170 = (void *)0xE000000000000000;
              _StringGuts.grow(_:)(49);
              swift_bridgeObjectRelease(v170);
              v169 = 0xD000000000000022;
              v170 = (void *)0x8000000100168B70;
              v75._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
              v76 = v75._object;
              String.append(_:)(v75);
              swift_bridgeObjectRelease(v76);
              v77._countAndFlagsBits = 0x746365707865202CLL;
              v77._object = (void *)0xED000030203A6465;
              String.append(_:)(v77);
              v78 = sub_10002460C(10010, v169, v170, 0);
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              v80 = v177[2];
              v79 = v177[3];
              if (v80 >= v79 >> 1)
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v79 > 1, v80 + 1, 1);
              v81 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v80, v78);
              specialized Array._endMutation()(v81);
            }
            if (v74 == 1)
            {
LABEL_58:
              sub_10009AD30((uint64_t)&v169);
              if ((v170 & 1) != 0
                || (v92 = v169, sub_10009AD30((uint64_t)&v169), (v172 & 1) != 0)
                || (v93 = v171, sub_10009AD30((uint64_t)&v169), (v174 & 1) != 0))
              {
                v94 = 0xD00000000000001BLL;
                v95 = (void *)0x8000000100171310;
                v96 = 10005;
              }
              else
              {
                v101 = a2;
                v102 = v173;
                if (v92 != 1)
                {
                  v169 = 0;
                  v170 = (void *)0xE000000000000000;
                  _StringGuts.grow(_:)(39);
                  swift_bridgeObjectRelease(v170);
                  v169 = 0xD000000000000018;
                  v170 = (void *)0x8000000100171330;
                  v103._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
                  v104 = v103._object;
                  String.append(_:)(v103);
                  swift_bridgeObjectRelease(v104);
                  v105._countAndFlagsBits = 0x746365707865202CLL;
                  v105._object = (void *)0xED000031203A6465;
                  String.append(_:)(v105);
                  v106 = sub_10002460C(10010, v169, v170, 0);
                  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                  v108 = v177[2];
                  v107 = v177[3];
                  if (v108 >= v107 >> 1)
                    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v107 > 1, v108 + 1, 1);
                  v109 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v108, v106);
                  specialized Array._endMutation()(v109);
                }
                if (v93 != 1)
                {
                  v169 = 0;
                  v170 = (void *)0xE000000000000000;
                  _StringGuts.grow(_:)(47);
                  swift_bridgeObjectRelease(v170);
                  v169 = 0xD000000000000020;
                  v170 = (void *)0x8000000100171350;
                  v110._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
                  v111 = v110._object;
                  String.append(_:)(v110);
                  swift_bridgeObjectRelease(v111);
                  v112._countAndFlagsBits = 0x746365707865202CLL;
                  v112._object = (void *)0xED000031203A6465;
                  String.append(_:)(v112);
                  v113 = sub_10002460C(10010, v169, v170, 0);
                  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                  v115 = v177[2];
                  v114 = v177[3];
                  if (v115 >= v114 >> 1)
                    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v114 > 1, v115 + 1, 1);
                  v116 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v115, v113);
                  specialized Array._endMutation()(v116);
                }
                v117 = v102 == 1;
                a2 = v101;
                if (v117)
                  goto LABEL_65;
                v169 = 0;
                v170 = (void *)0xE000000000000000;
                _StringGuts.grow(_:)(60);
                v118._countAndFlagsBits = 0xD00000000000002DLL;
                v118._object = (void *)0x8000000100171380;
                String.append(_:)(v118);
                v119._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
                v120 = v119._object;
                String.append(_:)(v119);
                swift_bridgeObjectRelease(v120);
                v121._countAndFlagsBits = 0x746365707865202CLL;
                v121._object = (void *)0xED000031203A6465;
                String.append(_:)(v121);
                v94 = v169;
                v95 = v170;
                v96 = 10010;
              }
              v97 = sub_10002460C(v96, v94, v95, 0);
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              v99 = v177[2];
              v98 = v177[3];
              if (v99 >= v98 >> 1)
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v98 > 1, v99 + 1, 1);
              v100 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v99, v97);
              specialized Array._endMutation()(v100);
LABEL_65:

              sub_100130A38((uint64_t)&v177, v3, a1, a2);
              return swift_bridgeObjectRelease(v177);
            }
            v169 = 0;
            v170 = (void *)0xE000000000000000;
            _StringGuts.grow(_:)(44);
            swift_bridgeObjectRelease(v170);
            v169 = 0xD00000000000001DLL;
            v170 = (void *)0x8000000100168BA0;
            v82._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
            v83 = v82._object;
            String.append(_:)(v82);
            swift_bridgeObjectRelease(v83);
            v84._countAndFlagsBits = 0x746365707865202CLL;
            v84._object = (void *)0xED000031203A6465;
            String.append(_:)(v84);
            v85 = v169;
            v86 = v170;
            v87 = 10010;
          }
          v88 = sub_10002460C(v87, v85, v86, 0);
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          v90 = v177[2];
          v89 = v177[3];
          if (v90 >= v89 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v89 > 1, v90 + 1, 1);
          v91 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v90, v88);
          specialized Array._endMutation()(v91);
          goto LABEL_58;
        }
        swift_bridgeObjectRelease(v51);
        v51 = v56;
        a1 = v168;
      }
      swift_bridgeObjectRelease(v51);
    }
    v62 = 0xD00000000000001ELL;
    v63 = (void *)0x8000000100168B30;
    v64 = 10005;
LABEL_43:
    v65 = sub_10002460C(v64, v62, v63, 0);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v67 = v177[2];
    v66 = v177[3];
    if (v67 >= v66 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v66 > 1, v67 + 1, 1);
    v68 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v67, v65);
    specialized Array._endMutation()(v68);
    goto LABEL_46;
  }
  v14 = sub_10002460C(10005, 0xD00000000000001ALL, (void *)0x80000001001712F0, 0);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v16 = v177[2];
  v15 = v177[3];
  if (v16 >= v15 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v15 > 1, v16 + 1, 1);
  v17 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v16, v14);
  specialized Array._endMutation()(v17);
  sub_100130A38((uint64_t)&v177, v2, a1, a2);
  return swift_bridgeObjectRelease(v177);
}

uint64_t sub_100130A38(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  _QWORD *v42;
  char v43[200];
  _QWORD v44[3];
  uint64_t v45;
  uint64_t v46;

  if (*(_QWORD *)(*(_QWORD *)result + 16))
  {
    v7 = result;
    sub_100008390(a2 + 104, (uint64_t)v44);
    v8 = v45;
    v9 = v46;
    sub_100005EF8(v44, v45);
    v10 = sub_100003A2C(&qword_1001ADA18);
    inited = swift_initStackObject(v10, v43);
    *(_OWORD *)(inited + 16) = xmmword_10015E090;
    *(_QWORD *)(inited + 32) = 1701605234;
    *(_QWORD *)(inited + 40) = 0xE400000000000000;
    v12 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(inited + 72) = &type metadata for Int;
    *(_QWORD *)(inited + 80) = &protocol witness table for Int;
    *(_QWORD *)(inited + 48) = v12;
    *(_QWORD *)(inited + 88) = 0x747365676964;
    *(_QWORD *)(inited + 96) = 0xE600000000000000;
    Data.sha256Digest.getter(a3, a4);
    v14 = v13;
    v16 = v15;
    *(_QWORD *)(inited + 128) = &type metadata for Data;
    v17 = sub_100024884();
    *(_QWORD *)(inited + 104) = v14;
    *(_QWORD *)(inited + 112) = v16;
    *(_QWORD *)(inited + 136) = v17;
    *(_QWORD *)(inited + 144) = 0x73726F727265;
    v38 = (_QWORD *)inited;
    *(_QWORD *)(inited + 152) = 0xE600000000000000;
    v18 = *(_QWORD *)v7;
    v19 = *(_QWORD *)(*(_QWORD *)v7 + 16);
    v20 = _swiftEmptyArrayStorage;
    if (v19)
    {
      v36 = v9;
      v37 = v8;
      v42 = _swiftEmptyArrayStorage;
      swift_bridgeObjectRetain(v18);
      sub_100091C44(0, v19, 0);
      v20 = _swiftEmptyArrayStorage;
      type metadata accessor for SecurityError(0);
      v22 = v21;
      v23 = 0;
      do
      {
        v24 = *(_QWORD *)(v18 + 8 * v23 + 32);
        v40 = 0;
        v41 = 0xE000000000000000;
        v39 = v24;
        _print_unlocked<A, B>(_:_:)(&v39, &v40, v22, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        v25 = v40;
        v26 = v41;
        v42 = v20;
        v28 = v20[2];
        v27 = v20[3];
        if (v28 >= v27 >> 1)
        {
          sub_100091C44(v27 > 1, v28 + 1, 1);
          v20 = v42;
        }
        ++v23;
        v20[2] = v28 + 1;
        v29 = &v20[2 * v28];
        v29[4] = v25;
        v29[5] = v26;
      }
      while (v19 != v23);
      swift_bridgeObjectRelease(v18);
      v9 = v36;
      v8 = v37;
    }
    v40 = v20;
    v30 = sub_100003A2C((uint64_t *)&unk_1001AE460);
    v31 = sub_100030828((unint64_t *)&qword_1001B12B0, (uint64_t *)&unk_1001AE460, (uint64_t)&protocol conformance descriptor for [A]);
    v32 = BidirectionalCollection<>.joined(separator:)(8236, 0xE200000000000000, v30, v31);
    v34 = v33;
    swift_bridgeObjectRelease(v20);
    v38[23] = &type metadata for String;
    v38[24] = &protocol witness table for String;
    v38[20] = v32;
    v38[21] = v34;
    v35 = sub_1000E84EC((uint64_t)v38);
    sub_100115684(41, v35, v8, v9);
    swift_bridgeObjectRelease(v35);
    return sub_100005D3C(v44);
  }
  return result;
}

uint64_t sub_100130CE8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  Swift::String v15;
  Swift::String v16;
  void *object;
  Swift::String v18;
  _QWORD *v19;
  Swift::String v20;
  void *v21;
  Swift::String v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  Swift::String v26;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v1 = v0;
  sub_10009A2C0((uint64_t)&v28);
  v3 = v28;
  v2 = (void *)v29;
  v4 = v30;
  swift_bridgeObjectRelease(v31);
  swift_bridgeObjectRelease(v4);
  if (!v2)
  {
    v23 = 0xD00000000000001DLL;
    v24 = (void *)0x8000000100168A70;
LABEL_13:
    v25 = 10005;
    return sub_10002460C(v25, v23, v24, 0);
  }
  swift_bridgeObjectRetain(v2);
  v5 = sub_10007E718(v3, (unint64_t)v2);
  if ((v8 & 1) != 0)
  {
    v28 = 0;
    v29 = 0xE000000000000000;
    _StringGuts.grow(_:)(34);
    swift_bridgeObjectRelease(v29);
    v28 = 0xD000000000000020;
    v29 = 0x8000000100168A90;
    v26._countAndFlagsBits = v3;
    v26._object = v2;
    String.append(_:)(v26);
    swift_bridgeObjectRelease(v2);
    v23 = v28;
    v24 = (void *)v29;
    goto LABEL_13;
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  swift_bridgeObjectRelease(v2);
  v12 = sub_100005EF8((_QWORD *)(v1 + 312), *(_QWORD *)(v1 + 336));
  if (v9 == *(_QWORD *)(*v12 + 16) && v10 == *(_QWORD *)(*v12 + 24) && v11 == *(_QWORD *)(*v12 + 32))
    return 0;
  v28 = 0;
  v29 = 0xE000000000000000;
  _StringGuts.grow(_:)(69);
  v15._countAndFlagsBits = 0xD00000000000002CLL;
  v15._object = (void *)0x8000000100168AC0;
  String.append(_:)(v15);
  v16._countAndFlagsBits = sub_10007CBF0(v9, v10, v11);
  object = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(object);
  v18._object = (void *)0x8000000100168AF0;
  v18._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v18);
  v19 = sub_100005EF8((_QWORD *)(v1 + 312), *(_QWORD *)(v1 + 336));
  v20._countAndFlagsBits = sub_10007CBF0(*(_QWORD *)(*v19 + 16), *(_QWORD *)(*v19 + 24), *(_QWORD *)(*v19 + 32));
  v21 = v20._object;
  String.append(_:)(v20);
  swift_bridgeObjectRelease(v21);
  v22._countAndFlagsBits = 46;
  v22._object = (void *)0xE100000000000000;
  String.append(_:)(v22);
  v23 = v28;
  v24 = (void *)v29;
  v25 = 10010;
  return sub_10002460C(v25, v23, v24, 0);
}

uint64_t sub_100130F04()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  Swift::String v15;
  Swift::String v16;
  void *object;
  Swift::String v18;
  _QWORD *v19;
  Swift::String v20;
  void *v21;
  Swift::String v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  Swift::String v26;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;

  v1 = v0;
  sub_10009A2C0((uint64_t)&v28);
  v2 = v29;
  v3 = v30;
  v4 = v31;
  swift_bridgeObjectRelease(v32);
  swift_bridgeObjectRelease(v2);
  if (!v4)
  {
    v23 = 0xD00000000000001FLL;
    v24 = (void *)0x8000000100171270;
LABEL_13:
    v25 = 10005;
    return sub_10002460C(v25, v23, v24, 0);
  }
  swift_bridgeObjectRetain(v4);
  v5 = sub_10007E718(v3, (unint64_t)v4);
  if ((v8 & 1) != 0)
  {
    v28 = 0;
    v29 = 0xE000000000000000;
    _StringGuts.grow(_:)(36);
    swift_bridgeObjectRelease(v29);
    v28 = 0xD000000000000022;
    v29 = 0x8000000100171290;
    v26._countAndFlagsBits = v3;
    v26._object = v4;
    String.append(_:)(v26);
    swift_bridgeObjectRelease(v4);
    v23 = v28;
    v24 = (void *)v29;
    goto LABEL_13;
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  swift_bridgeObjectRelease(v4);
  v12 = sub_100005EF8((_QWORD *)(v1 + 312), *(_QWORD *)(v1 + 336));
  if (v9 == *(_QWORD *)(*v12 + 16) && v10 == *(_QWORD *)(*v12 + 24) && v11 == *(_QWORD *)(*v12 + 32))
    return 0;
  v28 = 0;
  v29 = 0xE000000000000000;
  _StringGuts.grow(_:)(71);
  v15._countAndFlagsBits = 0xD00000000000002ELL;
  v15._object = (void *)0x80000001001712C0;
  String.append(_:)(v15);
  v16._countAndFlagsBits = sub_10007CBF0(v9, v10, v11);
  object = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(object);
  v18._object = (void *)0x8000000100168AF0;
  v18._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v18);
  v19 = sub_100005EF8((_QWORD *)(v1 + 312), *(_QWORD *)(v1 + 336));
  v20._countAndFlagsBits = sub_10007CBF0(*(_QWORD *)(*v19 + 16), *(_QWORD *)(*v19 + 24), *(_QWORD *)(*v19 + 32));
  v21 = v20._object;
  String.append(_:)(v20);
  swift_bridgeObjectRelease(v21);
  v22._countAndFlagsBits = 46;
  v22._object = (void *)0xE100000000000000;
  String.append(_:)(v22);
  v23 = v28;
  v24 = (void *)v29;
  v25 = 10010;
  return sub_10002460C(v25, v23, v24, 0);
}

uint64_t sub_100131120()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  Swift::String v15;
  Swift::String v16;
  void *object;
  Swift::String v18;
  _QWORD *v19;
  Swift::String v20;
  void *v21;
  Swift::String v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  Swift::String v26;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  v1 = v0;
  sub_10009A2C0((uint64_t)&v28);
  v2 = v29;
  v3 = v31;
  v4 = v32;
  swift_bridgeObjectRelease(v30);
  swift_bridgeObjectRelease(v2);
  if (!v4)
  {
    v23 = 0xD00000000000001FLL;
    v24 = (void *)0x80000001001711F0;
LABEL_13:
    v25 = 10005;
    return sub_10002460C(v25, v23, v24, 0);
  }
  swift_bridgeObjectRetain(v4);
  v5 = sub_10007E718(v3, (unint64_t)v4);
  if ((v8 & 1) != 0)
  {
    v28 = 0;
    v29 = 0xE000000000000000;
    _StringGuts.grow(_:)(36);
    swift_bridgeObjectRelease(v29);
    v28 = 0xD000000000000022;
    v29 = 0x8000000100171210;
    v26._countAndFlagsBits = v3;
    v26._object = v4;
    String.append(_:)(v26);
    swift_bridgeObjectRelease(v4);
    v23 = v28;
    v24 = (void *)v29;
    goto LABEL_13;
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  swift_bridgeObjectRelease(v4);
  v12 = sub_100005EF8((_QWORD *)(v1 + 312), *(_QWORD *)(v1 + 336));
  if (v9 == *(_QWORD *)(*v12 + 16) && v10 == *(_QWORD *)(*v12 + 24) && v11 == *(_QWORD *)(*v12 + 32))
    return 0;
  v28 = 0;
  v29 = 0xE000000000000000;
  _StringGuts.grow(_:)(71);
  v15._countAndFlagsBits = 0xD00000000000002ELL;
  v15._object = (void *)0x8000000100171240;
  String.append(_:)(v15);
  v16._countAndFlagsBits = sub_10007CBF0(v9, v10, v11);
  object = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(object);
  v18._object = (void *)0x8000000100168AF0;
  v18._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v18);
  v19 = sub_100005EF8((_QWORD *)(v1 + 312), *(_QWORD *)(v1 + 336));
  v20._countAndFlagsBits = sub_10007CBF0(*(_QWORD *)(*v19 + 16), *(_QWORD *)(*v19 + 24), *(_QWORD *)(*v19 + 32));
  v21 = v20._object;
  String.append(_:)(v20);
  swift_bridgeObjectRelease(v21);
  v22._countAndFlagsBits = 46;
  v22._object = (void *)0xE100000000000000;
  String.append(_:)(v22);
  v23 = v28;
  v24 = (void *)v29;
  v25 = 10010;
  return sub_10002460C(v25, v23, v24, 0);
}

uint64_t sub_10013133C(_QWORD *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100131374(a1, a2, a3, a4, a5, a6, a7, (uint64_t)sub_100131F04);
}

uint64_t sub_100131358(_QWORD *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100131374(a1, a2, a3, a4, a5, a6, a7, (uint64_t)sub_100131680);
}

uint64_t sub_100131374(_QWORD *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  _QWORD *v21;
  uint64_t v22;
  _BYTE v23[16];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  _QWORD v29[5];

  v21 = a1;
  v22 = a8;
  v13 = type metadata accessor for DispatchWorkItemFlags(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DispatchWorkItemFlags.barrier.getter(v15);
  v24 = v8;
  v25 = a2;
  v26 = a3;
  v27 = a5;
  v28 = a4;
  v18 = sub_100003A2C(&qword_1001B3C98);
  v19 = v29[4];
  OS_dispatch_queue.sync<A>(flags:execute:)(v29, v17, v22, v23, v18);
  if (v19)
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  result = v29[0];
  *v21 = v29[2];
  return result;
}

uint64_t sub_100131488(double a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v9[16];
  uint64_t v10;
  double v11;
  uint64_t v12;

  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static DispatchWorkItemFlags.barrier.getter(v5);
  v10 = v1;
  v11 = a1;
  OS_dispatch_queue.sync<A>(flags:execute:)(&v12, v7, sub_100131664, v9, &type metadata for Bool);
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);
  return v12;
}

uint64_t sub_10013154C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];
  _QWORD *v9;
  uint64_t v10;

  v1 = *v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static DispatchWorkItemFlags.barrier.getter(v4);
  v9 = v0;
  v10 = v1;
  OS_dispatch_queue.sync<A>(flags:execute:)(&type metadata for (), v6, sub_10013164C, v8, &type metadata for () + 1);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v6, v2);
}

unint64_t sub_100131600()
{
  return sub_10012B7B0();
}

uint64_t sub_100131620()
{
  return sub_100005F1C(&qword_1001B3C50, type metadata accessor for BAASigningIdentity, (uint64_t)&unk_100163DA0);
}

void sub_10013164C()
{
  uint64_t v0;

  sub_10012C2BC(*(_QWORD **)(v0 + 16));
}

void sub_100131664(BOOL *a1@<X8>)
{
  uint64_t v1;

  sub_10012BDC8(*(_QWORD **)(v1 + 16), a1, *(double *)(v1 + 24));
}

void sub_100131680(uint64_t *a1@<X8>)
{
  sub_100131F20((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100140C78, a1);
}

_QWORD *sub_10013169C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t a7, _QWORD *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, _QWORD *a17, uint64_t a18, uint64_t a19)
{
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD aBlock[6];
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[5];
  _QWORD v66[5];

  v59 = a8;
  v60 = a6;
  v54 = a5;
  v53 = a4;
  v52 = a3;
  v51 = a2;
  v50 = a1;
  v57 = a16;
  v55 = a15;
  v58 = a13;
  v56 = a12;
  v20 = type metadata accessor for DispatchWorkItemFlags(0);
  __chkstk_darwin(v20);
  v22 = (char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66[3] = a18;
  v66[4] = a19;
  v23 = sub_1000778C8(v66);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(a18 - 8) + 32))(v23, a7, a18);
  v65[3] = &type metadata for SystemRandomNumberGenerator;
  v65[4] = &protocol witness table for SystemRandomNumberGenerator;
  v64[3] = type metadata accessor for SystemInfo();
  v64[4] = &off_10019F8A0;
  v64[0] = a10;
  v63[3] = type metadata accessor for DefaultSecureTimeKeeper();
  v63[4] = &off_10019C0A0;
  aBlock[5] = 0;
  v63[0] = a11;
  a17[7] = 0;
  aBlock[4] = BitString.init(data:unusedBits:);
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000043B8;
  aBlock[3] = &unk_1001A0660;
  v24 = _Block_copy(aBlock);
  v61 = _swiftEmptyArrayStorage;
  v25 = sub_100005F1C((unint64_t *)&qword_1001B1260, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v26 = sub_100003A2C((uint64_t *)&unk_1001AE400);
  v27 = sub_100030828((unint64_t *)&qword_1001B1270, (uint64_t *)&unk_1001AE400, (uint64_t)&protocol conformance descriptor for [A]);
  v28 = v26;
  v29 = v59;
  v30 = v25;
  v31 = v60;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v61, v28, v27, v20, v30);
  v32 = type metadata accessor for DispatchWorkItem(0);
  swift_allocObject(v32, *(unsigned int *)(v32 + 48), *(unsigned __int16 *)(v32 + 52));
  a17[44] = DispatchWorkItem.init(flags:block:)(v22, v24);
  a17[45] = 600000;
  v33 = v51;
  a17[2] = v50;
  a17[3] = v33;
  v34 = v53;
  a17[4] = v52;
  a17[5] = v34;
  a17[6] = v54;
  sub_100008390((uint64_t)v31, (uint64_t)(a17 + 8));
  sub_100008390((uint64_t)v66, (uint64_t)(a17 + 13));
  sub_100008390((uint64_t)v29, (uint64_t)(a17 + 33));
  a17[38] = a9;
  sub_100008390((uint64_t)v64, (uint64_t)(a17 + 39));
  sub_100008390((uint64_t)v63, (uint64_t)(a17 + 28));
  v35 = v55;
  a17[18] = a14;
  a17[19] = v35;
  v36 = v56;
  a17[20] = v57;
  a17[21] = v36;
  a17[22] = v58;
  sub_100008390((uint64_t)v65, (uint64_t)(a17 + 23));
  swift_retain(a9);
  v37 = a14;
  v38 = v35;
  v39 = sub_10012CF58();
  if (!v39)
    goto LABEL_5;
  v40 = v39;
  v41 = *(_QWORD *)(v39 + 24);
  v42 = *(_QWORD *)(v39 + 32);
  sub_100005D9C(v41, v42);
  v43 = sub_10012F6DC();
  sub_100005DE0(v41, v42);
  if ((v43 & 1) == 0)
  {
    sub_10012DD18();
    swift_release(v40);
LABEL_5:
    v58 = v37;
    sub_10012C888();
    v47 = v46;
    sub_10012D6F4(v46);
    sub_10012E180(v47, v48);
    swift_release(a9);

    swift_release(v47);
    goto LABEL_6;
  }
  v44 = a17[7];
  a17[7] = v40;
  swift_retain(v40);
  swift_release(v44);
  sub_10012E180(v40, v45);
  swift_release(v40);
  swift_release(a9);

LABEL_6:
  sub_100005D3C(v65);
  sub_100005D3C(v63);
  sub_100005D3C(v64);
  sub_100005D3C(v29);
  sub_100005D3C(v66);
  sub_100005D3C(v31);
  return a17;
}

void sub_100131F04(uint64_t *a1@<X8>)
{
  sub_100131F20((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1001407A8, a1);
}

void sub_100131F20(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  sub_10012BB08(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_BYTE *)(v2 + 48), a1, a2);
}

uint64_t sub_100131F44()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100131F68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = type metadata accessor for Date(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 48) & ~v5;
  v7 = v6 + *(_QWORD *)(v4 + 64);
  v8 = v5 | 7;
  swift_release(*(_QWORD *)(v2 + 16));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2 + v6, v3);
  return swift_deallocObject(v2, v7, v8);
}

void sub_100131FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  type metadata accessor for Date(0, a2);
  sub_10012F0DC(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(double *)(v2 + 32));
}

uint64_t sub_100132014(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100132024(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10013202C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1001B3CB0;
  if (!qword_1001B3CB0)
  {
    v1 = sub_100003A6C(&qword_1001B3CA8);
    sub_100005F1C(&qword_1001B3CB8, type metadata accessor for BAASigningIdentity, (uint64_t)&unk_100163D78);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_1001B3CB0);
  }
  return result;
}

_QWORD *sub_1001320A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t a7, _QWORD *a8, uint64_t a9, uint64_t a10, uint64_t a11, __int128 a12, __int128 a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD v45[3];
  uint64_t v46;
  _UNKNOWN **v47;
  _QWORD v48[6];

  v43 = a6;
  v44 = a8;
  v41 = a4;
  v42 = a5;
  v39 = a2;
  v40 = a3;
  v38 = a1;
  v37 = a12;
  v35 = a13;
  v36 = a9;
  v17 = *(_QWORD *)(a15 - 8);
  __chkstk_darwin(a1);
  v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for SystemInfo();
  v48[3] = v20;
  v48[4] = &off_10019F8A0;
  v48[0] = a10;
  v46 = type metadata accessor for DefaultSecureTimeKeeper();
  v47 = &off_10019C0A0;
  v45[0] = a11;
  v21 = type metadata accessor for BAASigner();
  v22 = (_QWORD *)swift_allocObject(v21, 368, 7);
  v23 = sub_10001A64C((uint64_t)v48, v20);
  __chkstk_darwin(v23);
  v25 = (uint64_t *)((char *)&v35 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  v27 = sub_10001A64C((uint64_t)v45, v46);
  __chkstk_darwin(v27);
  v29 = (uint64_t *)((char *)&v35 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v30 + 16))(v29);
  v31 = *v25;
  v32 = *v29;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a7, a15);
  v33 = sub_10013169C(v38, v39, v40, v41, v42, v43, (uint64_t)v19, v44, v36, v31, v32, v37, *((void **)&v37 + 1), (void *)v35, *((void **)&v35 + 1), a14, v22, a15, a16);
  sub_100005D3C(v45);
  sub_100005D3C(v48);
  return v33;
}

void destroy for CertificateTrustVerifier(uint64_t a1)
{
  SEL v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  sub_100005D3C((_QWORD *)a1);
  swift_unknownObjectRelease(*(_QWORD *)(a1 + 40));
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(a1 + 48), v2, v3, v4, v5, v6, v7, v8);
}

uint64_t initializeWithCopy for CertificateTrustVerifier(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_unknownObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  return a1;
}

_QWORD *assignWithCopy for CertificateTrustVerifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _TtC14softposreaderd12RemoteReader *v6;
  SEL v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  sub_1001323AC(a1, a2);
  v4 = a2[5];
  v5 = a1[5];
  a1[5] = v4;
  swift_unknownObjectRetain(v4);
  swift_unknownObjectRelease(v5);
  v6 = (_TtC14softposreaderd12RemoteReader *)a1[6];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v6, v7, v8, v9, v10, v11, v12, v13);
  a1[7] = a2[7];
  return a1;
}

_QWORD *sub_1001323AC(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];

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
        v11 = *result;
        v12 = *a2;
        swift_retain(*a2);
        result = (_QWORD *)swift_release(v11);
        *v3 = v12;
      }
      else
      {
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD))(v9 + 24))(result, a2, result[3]);
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
        v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          v14 = *a2;
          *v3 = *a2;
          swift_retain(v14);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (_QWORD *)swift_release(v10);
      }
      else
      {
        (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          v13 = *a2;
          *v3 = *a2;
          swift_retain(v13);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (_QWORD *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }
  return result;
}

uint64_t assignWithTake for CertificateTrustVerifier(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  _TtC14softposreaderd12RemoteReader *v7;
  SEL v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  sub_100005D3C((_QWORD *)a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_unknownObjectRelease(v6);
  v7 = *(_TtC14softposreaderd12RemoteReader **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease(v7, v8, v9, v10, v11, v12, v13, v14);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for CertificateTrustVerifier(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CertificateTrustVerifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CertificateTrustVerifier()
{
  return &type metadata for CertificateTrustVerifier;
}

uint64_t destroy for CertificateTimeVerifier(uint64_t a1)
{
  return sub_100005D3C((_QWORD *)(a1 + 8));
}

uint64_t initializeWithCopy for CertificateTimeVerifier(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a1 + 8, a2 + 8);
  return a1;
}

_QWORD *assignWithCopy for CertificateTimeVerifier(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_1001323AC(a1 + 1, a2 + 1);
  return a1;
}

uint64_t assignWithTake for CertificateTimeVerifier(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  sub_100005D3C((_QWORD *)(a1 + 8));
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for CertificateTimeVerifier(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CertificateTimeVerifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CertificateTimeVerifier()
{
  return &type metadata for CertificateTimeVerifier;
}

uint64_t sub_10013277C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_1000039D4(v0, qword_1001B3CC0);
  v1 = sub_100003A14(v0, (uint64_t)qword_1001B3CC0);
  if (qword_1001AD168 != -1)
    swift_once(&qword_1001AD168, sub_1000CC6D0);
  v2 = sub_100003A14(v0, (uint64_t)qword_1001B4E28);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_10013280C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint8_t *v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  Swift::String v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  double v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;

  v2 = v1;
  v4 = sub_100003A2C(&qword_1001AD9E0);
  __chkstk_darwin(v4);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Date(0, v7);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)(v1 + 8);
  sub_100005EF8((_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 32));
  sub_10001E61C((uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) == 1)
  {
    sub_10001A448((uint64_t)v6);
    if (qword_1001AD2D8 != -1)
      swift_once(&qword_1001AD2D8, sub_10013277C);
    v13 = type metadata accessor for Logger(0);
    v14 = sub_100003A14(v13, (uint64_t)qword_1001B3CC0);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(2, -1);
      v41 = v9;
      v18 = a1;
      v19 = v17;
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "CertificateTimeVerifier using wall time to verify certificate", v17, 2u);
      v20 = v19;
      a1 = v18;
      v9 = v41;
      swift_slowDealloc(v20, -1, -1);
    }

    v22 = *(_QWORD *)(v2 + 32);
    v21 = *(_QWORD *)(v2 + 40);
    sub_100005EF8(v12, v22);
    (*(void (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 8))(v22);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v6, v8);
  }
  v23 = SecCertificateNotValidBefore(a1);
  v25 = v24 - Date.timeIntervalSinceReferenceDate.getter(v23);
  if (v25 > 5.0)
  {
    v42 = 0;
    v43 = 0xE000000000000000;
    _StringGuts.grow(_:)(16);
    Double.write<A>(to:)(&v42, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, v25);
    v26._countAndFlagsBits = 0x73646E6F63657320;
    v26._object = (void *)0xEE00796C72616520;
    String.append(_:)(v26);
    v27 = v42;
    v28 = (void *)v43;
    v29 = 10011;
LABEL_21:
    v38 = sub_10002460C(v29, v27, v28, 0);
    swift_willThrow(v38);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  if (v25 > 0.0)
  {
    if (qword_1001AD2D8 != -1)
      swift_once(&qword_1001AD2D8, sub_10013277C);
    v30 = type metadata accessor for Logger(0);
    v31 = sub_100003A14(v30, (uint64_t)qword_1001B3CC0);
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v41 = v9;
      v34 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v34 = 134217984;
      v9 = v41;
      v42 = *(_QWORD *)&v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v34 + 4, v34 + 12);
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Certificate valid with allowed drift: %f", v34, 0xCu);
      swift_slowDealloc(v34, -1, -1);
    }

  }
  v35 = SecCertificateNotValidAfter(a1);
  v37 = v35 - Date.timeIntervalSinceReferenceDate.getter(v36);
  if (v37 < 0.0)
  {
    v29 = 10012;
LABEL_20:
    v27 = 0;
    v28 = 0;
    goto LABEL_21;
  }
  if (v37 < *(double *)v2)
  {
    v29 = 10014;
    goto LABEL_20;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_100132C0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if ((unint64_t)a1 >> 62)
    goto LABEL_13;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n(a1, 2);
  for (; v3; v3 = _CocoaArrayWrapper.endIndex.getter(v8))
  {
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, a1)
         : *(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      sub_10013280C((uint64_t)v5);
      if (v1)
      {
        swift_bridgeObjectRelease_n(a1, 2);

        return;
      }

      ++v4;
      if (v7 == v3)
        goto LABEL_10;
    }
    __break(1u);
LABEL_13:
    if (a1 < 0)
      v8 = a1;
    else
      v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n(a1, 2);
  }
LABEL_10:
  swift_bridgeObjectRelease_n(a1, 2);
}

uint64_t sub_100132D10(uint64_t a1)
{
  return sub_10013280C(a1);
}

void sub_100132D24(uint64_t a1)
{
  sub_100132C0C(a1);
}

void sub_100132D38(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  void *AuthorityKeyID;
  uint64_t v19;
  _TtC14softposreaderd12RemoteReader *v20;
  id v21;
  uint64_t v22;
  void *v23;
  SEL v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  Class isa;
  SEL v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  OSStatus v43;
  const char *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __SecTrust *v51;
  const __CFArray *v52;
  OSStatus v53;
  const char *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  OSStatus v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  SEL v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  SEL v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  const __CFDate *v95;
  void (*v96)(char *, uint64_t);
  OSStatus v97;
  uint64_t v98;
  CFErrorRef v99;
  __CFError *v100;
  const __CFString *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __CFString *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  CFIndex Code;
  OSStatus v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  __CFError **v117;
  __CFError *v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  __CFError **v125;
  __CFError *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  unint64_t v133;
  CFErrorRef error;
  SecTrustRef trust;

  v4 = v1;
  v6 = sub_100003A2C(&qword_1001AD9E0);
  __chkstk_darwin(v6);
  v8 = (char *)&v129 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Date(0, v9);
  v132 = *(_QWORD *)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v129 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v129 - v14;
  v133 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v128 = a1;
    else
      v128 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v16 = _CocoaArrayWrapper.endIndex.getter(v128);
  }
  else
  {
    v16 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v130 = v10;
  v131 = v15;
  if (v16 != 1)
    goto LABEL_14;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
LABEL_7:
    v2 = v17;
    AuthorityKeyID = (void *)SecCertificateGetAuthorityKeyID();
    if (!AuthorityKeyID)
    {

      goto LABEL_14;
    }
    v19 = qword_1001AD2E0;
    v3 = AuthorityKeyID;
    if (v19 == -1)
      goto LABEL_9;
    goto LABEL_55;
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v17 = *(id *)(a1 + 32);
    goto LABEL_7;
  }
  __break(1u);
LABEL_55:
  swift_once(&qword_1001AD2E0, sub_100133480);
LABEL_9:
  v20 = (_TtC14softposreaderd12RemoteReader *)qword_1001B4FF8;
  v21 = v3;
  v22 = swift_bridgeObjectRetain();
  v23 = sub_100133658(v22, (uint64_t)v21);

  swift_bridgeObjectRelease(v20, v24, v25, v26, v27, v28, v29, v30);
  if (v23)
  {
    v31 = v23;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v31);
    v33 = *(_QWORD *)((v133 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v32 = *(_QWORD *)((v133 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v33 >= v32 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v32 > 1, v33 + 1, 1);
    v34 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v33, v31);
    specialized Array._endMutation()(v34);

    a1 = v133;
  }
LABEL_14:
  trust = 0;
  type metadata accessor for SecCertificate(0);
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a1, v36, v37, v38, v39, v40, v41, v42);
  v43 = SecTrustCreateWithCertificates(isa, *(CFTypeRef *)(v4 + 40), &trust);

  v51 = trust;
  if (v43 || !trust)
  {
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a1, v44, v45, v46, v47, v48, v49, v50);
    v63 = sub_1000D7930(v43, 0);
    swift_willThrow(v63);
    goto LABEL_21;
  }
  v51 = trust;
  v52 = Array._bridgeToObjectiveC()().super.isa;
  v53 = SecTrustSetAnchorCertificates(v51, v52);

  if (v53)
  {
LABEL_19:
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v133, v54, v55, v56, v57, v58, v59, v60);
    v62 = sub_1000D7930(v53, 0);
    swift_willThrow(v62);

LABEL_21:
    return;
  }
  v61 = SecTrustSetAnchorCertificatesOnly(v51, 0);
  if (v61)
  {
    v53 = v61;
    goto LABEL_19;
  }
  sub_100005EF8((_QWORD *)v4, *(_QWORD *)(v4 + 24));
  sub_10001E61C((uint64_t)v8);
  v64 = v132;
  v65 = v130;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v132 + 48))(v8, 1, v130) == 1)
  {
    sub_10001A448((uint64_t)v8);
    v73 = v131;
    if (qword_1001AD2D8 != -1)
      swift_once(&qword_1001AD2D8, sub_10013277C);
    v74 = type metadata accessor for Logger(0);
    v75 = sub_100003A14(v74, (uint64_t)qword_1001B3CC0);
    v76 = Logger.logObject.getter(v75);
    v77 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v76, v77))
    {
      v78 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v78 = 0;
      swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v133, v79, v80, v81, v82, v83, v84, v85);
      _os_log_impl((void *)&_mh_execute_header, v76, v77, "CertificateTrustVerifier using wall time to verify certificate", v78, 2u);
      swift_slowDealloc(v78, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v133, v86, v87, v88, v89, v90, v91, v92);
    }
    v93 = *(_QWORD *)(v4 + 24);
    v94 = *(_QWORD *)(v4 + 32);
    sub_100005EF8((_QWORD *)v4, v93);
    (*(void (**)(uint64_t))(*(_QWORD *)(v94 + 8) + 8))(v93);
    v64 = v132;
  }
  else
  {
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v133, v66, v67, v68, v69, v70, v71, v72);
    v73 = v131;
    (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v131, v8, v65);
  }
  static Date.+ infix(_:_:)(v73, *(double *)(v4 + 56));
  v95 = Date._bridgeToObjectiveC()().super.isa;
  v96 = *(void (**)(char *, uint64_t))(v64 + 8);
  v96(v13, v65);
  v97 = SecTrustSetVerifyDate(v51, v95);

  if (v97)
  {
    v98 = sub_1000D7930(v97, 0);
    swift_willThrow(v98);

    v96(v73, v65);
LABEL_48:
    v51 = trust;
    goto LABEL_21;
  }
  error = 0;
  if (!SecTrustEvaluateWithError(v51, &error))
  {
    v99 = error;
    if (!error)
    {
      v109 = 0;
LABEL_46:
      v126 = v99;
      sub_10002460C(10997, 0, 0, v109);
      v127 = swift_errorRelease();
      swift_willThrow(v127);

      v120 = v131;
      v121 = v65;
      goto LABEL_47;
    }
    v100 = error;
    v101 = (id)CFErrorGetDomain(v100);
    if (v101)
    {
      v102 = (void *)v101;
      if (kCFErrorDomainOSStatus)
      {
        type metadata accessor for CFString(0);
        v104 = v103;
        v105 = sub_100005F1C(&qword_1001B3CD8, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10015D998);
        v106 = (id)kCFErrorDomainOSStatus;
        v107 = v102;
        v108 = v105;
        v65 = v130;
        LOBYTE(v104) = static _CFObject.== infix(_:_:)(v107, v106, v104, v108);

        v102 = v100;
        if ((v104 & 1) == 0)
          goto LABEL_45;
LABEL_41:
        Code = CFErrorGetCode(v100);
        if (Code < (uint64_t)0xFFFFFFFF80000000)
        {
          __break(1u);
        }
        else
        {
          v111 = Code;
          v112 = v131;
          if (Code <= 0x7FFFFFFF)
          {
            type metadata accessor for CFError(0);
            v114 = v113;
            v115 = sub_100005F1C((unint64_t *)&qword_1001B1F58, (uint64_t (*)(uint64_t))type metadata accessor for CFError, (uint64_t)&protocol conformance descriptor for CFErrorRef);
            v116 = swift_allocError(v114, v115, 0, 0);
            *v117 = v100;
            v118 = v100;
            sub_1000D7930(v111, v116);
            v119 = swift_errorRelease();
            swift_willThrow(v119);

            v120 = v112;
            v121 = v130;
LABEL_47:
            v96(v120, v121);

            goto LABEL_48;
          }
        }
        __break(1u);
      }

    }
    else
    {
      v102 = v100;
      if (!kCFErrorDomainOSStatus)
        goto LABEL_41;
    }
LABEL_45:

    type metadata accessor for CFError(0);
    v123 = v122;
    v124 = sub_100005F1C((unint64_t *)&qword_1001B1F58, (uint64_t (*)(uint64_t))type metadata accessor for CFError, (uint64_t)&protocol conformance descriptor for CFErrorRef);
    v109 = swift_allocError(v123, v124, 0, 0);
    *v125 = v100;
    goto LABEL_46;
  }
  v96(v73, v65);

}

SecCertificateRef sub_100133480()
{
  uint64_t v0;
  uint64_t v1;
  SecCertificateRef result;

  v0 = sub_100003A2C((uint64_t *)&unk_1001AE490);
  v1 = swift_allocObject(v0, 72, 7);
  *(_OWORD *)(v1 + 16) = xmmword_10015E3D0;
  type metadata accessor for SecCertificate(0);
  result = static SecCertificateRef.parse(base64Encoded:)(0xD0000000000003FFLL);
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  *(_QWORD *)(v1 + 32) = result;
  result = static SecCertificateRef.parse(base64Encoded:)(0xD000000000000434);
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  *(_QWORD *)(v1 + 40) = result;
  result = static SecCertificateRef.parse(base64Encoded:)(0xD0000000000003F3);
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  *(_QWORD *)(v1 + 48) = result;
  result = static SecCertificateRef.parse(base64Encoded:)(0xD000000000000428);
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  *(_QWORD *)(v1 + 56) = result;
  result = static SecCertificateRef.parse(base64Encoded:)(0xD000000000000465);
  if (result)
  {
    *(_QWORD *)(v1 + 64) = result;
    result = (SecCertificateRef)specialized Array._endMutation()(result);
    qword_1001B4FF8 = v1;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

void sub_1001335B4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _TtC14softposreaderd12RemoteReader *v12;

  v2 = sub_100003A2C((uint64_t *)&unk_1001AE490);
  v3 = swift_allocObject(v2, 40, 7);
  *(_OWORD *)(v3 + 16) = xmmword_10015E4E0;
  *(_QWORD *)(v3 + 32) = a1;
  v12 = (_TtC14softposreaderd12RemoteReader *)v3;
  specialized Array._endMutation()(v3);
  v4 = a1;
  sub_100132D38((uint64_t)v12);
  swift_bridgeObjectRelease(v12, v5, v6, v7, v8, v9, v10, v11);
}

void sub_100133644(uint64_t a1)
{
  sub_100132D38(a1);
}

void *sub_100133658(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t SubjectKeyID;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;

  if ((unint64_t)a1 >> 62)
    goto LABEL_14;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = _CocoaArrayWrapper.endIndex.getter(v28))
  {
    v11 = 4;
    while (1)
    {
      v12 = (a1 & 0xC000000000000001) != 0
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v11 - 4, a1)
          : *(id *)(a1 + 8 * v11);
      v13 = v12;
      v14 = v11 - 3;
      if (__OFADD__(v11 - 4, 1))
        break;
      SubjectKeyID = SecCertificateGetSubjectKeyID(v12);
      if (SubjectKeyID)
      {
        v16 = (void *)SubjectKeyID;
        type metadata accessor for CFData(0);
        v18 = v17;
        v19 = sub_100005F1C(&qword_1001B3CE0, (uint64_t (*)(uint64_t))type metadata accessor for CFData, (uint64_t)&unk_10015DE2C);
        v20 = v16;
        LOBYTE(v18) = static _CFObject.== infix(_:_:)(v20, a2, v18, v19);

        if ((v18 & 1) != 0)
        {
          swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a1, v21, v22, v23, v24, v25, v26, v27);
          return v13;
        }
      }

      ++v11;
      if (v14 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_14:
    if (a1 < 0)
      v28 = a1;
    else
      v28 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a1, v4, v5, v6, v7, v8, v9, v10);
  return 0;
}

_TtC14softposreaderd12RemoteReader *sub_1001337D4(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  _TtC14softposreaderd12RemoteReader *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  _TtC14softposreaderd12RemoteReader *v21;

  v4 = v3;
  v19 = a1;
  v20 = a2;
  v6 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = &_swiftEmptyArrayStorage;
  if (v10)
  {
    v21 = &_swiftEmptyArrayStorage;
    sub_100091CA8(0, v10, 0);
    v11 = v21;
    v18 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v12 = a3 + v18;
    v13 = *(_QWORD *)(v7 + 72);
    while (1)
    {
      v19(v12);
      if (v4)
        break;
      v4 = 0;
      v21 = v11;
      v15 = *(_QWORD *)&v11->instance[8];
      v14 = *(_QWORD *)&v11->instance[16];
      if (v15 >= v14 >> 1)
      {
        sub_100091CA8(v14 > 1, v15 + 1, 1);
        v11 = v21;
      }
      *(_QWORD *)&v11->instance[8] = v15 + 1;
      sub_100134F6C((uint64_t)v9, (uint64_t)v11 + v18 + v15 * v13);
      v12 += v13;
      if (!--v10)
        return v11;
    }
    swift_release(v11);
  }
  return v11;
}

uint64_t sub_100133924()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_1000039D4(v0, qword_1001B3CE8);
  v1 = sub_100003A14(v0, (uint64_t)qword_1001B3CE8);
  if (qword_1001AD158 != -1)
    swift_once(&qword_1001AD158, sub_1000CC540);
  v2 = sub_100003A14(v0, (uint64_t)qword_1001B4DF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_1001339B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;
  uint64_t v4;
  uint64_t v5;
  _TtC14softposreaderd12RemoteReader *object;
  _TtC14softposreaderd12RemoteReader *v7;
  _TtC14softposreaderd12RemoteReader *v8;
  SEL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  Swift::String v16;
  uint64_t countAndFlagsBits;
  Swift::String v18;
  _TtC14softposreaderd12RemoteReader *v19;
  SEL v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v28;

  v1 = type metadata accessor for UUID(0);
  v2 = sub_100005F1C(&qword_1001B3E18, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v28 = dispatch thunk of CustomStringConvertible.description.getter(v1, v2);
  v3._countAndFlagsBits = 8236;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  v4 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0);
  if (*(_BYTE *)(v0 + *(int *)(v4 + 20)))
    v5 = 0x657669746361;
  else
    v5 = 0x6576697463616E69;
  object = (_TtC14softposreaderd12RemoteReader *)0xE800000000000000;
  if (*(_BYTE *)(v0 + *(int *)(v4 + 20)))
    v7 = (_TtC14softposreaderd12RemoteReader *)0xE600000000000000;
  else
    v7 = (_TtC14softposreaderd12RemoteReader *)0xE800000000000000;
  v8 = v7;
  String.append(_:)(*(Swift::String *)&v5);
  swift_bridgeObjectRelease(v7, v9, v10, v11, v12, v13, v14, v15);
  v16._countAndFlagsBits = 8236;
  v16._object = (void *)0xE200000000000000;
  String.append(_:)(v16);
  if (*(_QWORD *)(v0 + *(int *)(v4 + 24) + 8))
  {
    v18 = String.redactedToken()();
    countAndFlagsBits = v18._countAndFlagsBits;
    object = (_TtC14softposreaderd12RemoteReader *)v18._object;
  }
  else
  {
    countAndFlagsBits = 0x6E656B6F74206F6ELL;
  }
  v19 = object;
  String.append(_:)(*(Swift::String *)&countAndFlagsBits);
  swift_bridgeObjectRelease(object, v20, v21, v22, v23, v24, v25, v26);
  return v28;
}

uint64_t sub_100133AE0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char v21;
  char v22;
  char v23;

  v3 = v1;
  v5 = sub_100003A2C(&qword_1001B3EE0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100005EF8(a1, v9);
  v11 = sub_100135700();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys, &type metadata for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys, v11, v9, v10);
  v23 = 0;
  v12 = type metadata accessor for UUID(0);
  v13 = sub_100005F1C(&qword_1001B16E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v3, &v23, v5, v12, v13);
  if (!v2)
  {
    v14 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0);
    v15 = *(unsigned __int8 *)(v3 + *(int *)(v14 + 20));
    v22 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v15, &v22, v5);
    v16 = (uint64_t *)(v3 + *(int *)(v14 + 24));
    v17 = *v16;
    v18 = v16[1];
    v21 = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v17, v18, &v21, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_100133C64(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  SEL v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  SEL v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char v48;
  char v49;
  char v50;

  v41 = a2;
  v42 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v42 - 8);
  __chkstk_darwin(v42);
  v43 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_100003A2C(&qword_1001B3EF0);
  v5 = *(_QWORD *)(v45 - 8);
  __chkstk_darwin(v45);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = &v11[*(int *)(v9 + 24)];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v46 = v12;
  v13 = a1[3];
  v14 = a1[4];
  sub_100005EF8(a1, v13);
  v15 = sub_100135700();
  v44 = v7;
  v16 = v47;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys, &type metadata for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys, v15, v13, v14);
  if (v16)
  {
    sub_100005D3C(a1);
    swift_bridgeObjectRelease(*((_TtC14softposreaderd12RemoteReader **)v46 + 1), v22, v23, v24, v25, v26, v27, v28);
  }
  else
  {
    v17 = v8;
    v18 = v5;
    v50 = 0;
    v19 = sub_100005F1C(&qword_1001B16D0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v21 = v42;
    v20 = v43;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v42, &v50, v45, v42, v19);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v11, v20, v21);
    v49 = 1;
    v11[*(int *)(v17 + 20)] = KeyedDecodingContainer.decode(_:forKey:)(&v49, v45) & 1;
    v48 = 2;
    v29 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v48, v45);
    v31 = v30;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v44, v45);
    v32 = (uint64_t *)v46;
    swift_bridgeObjectRelease(*((_TtC14softposreaderd12RemoteReader **)v46 + 1), v33, v34, v35, v36, v37, v38, v39);
    *v32 = v29;
    v32[1] = v31;
    sub_10010E59C((uint64_t)v11, v41);
    sub_100005D3C(a1);
    sub_10010E5E0((uint64_t)v11);
  }
}

uint64_t sub_100133F10()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0x6576697463417369;
  if (*v0 != 1)
    v1 = 0xD000000000000010;
  if (*v0)
    return v1;
  else
    return 0x64697074666173;
}

uint64_t sub_100133F70@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1001358E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100133F94(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100135700();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100133FBC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100135700();
  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_100133FE4(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100133C64(a1, a2);
}

uint64_t sub_100133FF8(_QWORD *a1)
{
  return sub_100133AE0(a1);
}

uint64_t sub_100134010()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = v0 + 4;
  v3 = v0[7];
  v4 = v1[8];
  sub_100005EF8(v2, v3);
  v5 = v1[2];
  v6 = v1[3];
  v7 = sub_100003A2C(&qword_1001B3E20);
  v8 = sub_100134FCC(&qword_1001B3E38, &qword_1001B3E40, (uint64_t)&unk_100163418, (uint64_t)&protocol conformance descriptor for <A> [A]);
  sub_1000BC0E8(v5, v6, v3, v7, v4, v8);
  v9 = v25;
  if (qword_1001AD2E8 != -1)
    swift_once(&qword_1001AD2E8, sub_100133924);
  v10 = type metadata accessor for Logger(0);
  sub_100003A14(v10, (uint64_t)qword_1001B3CE8);
  v11 = swift_bridgeObjectRetain_n(v25, 2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = swift_slowAlloc(32, -1);
    v25 = v15;
    *(_DWORD *)v14 = 136315138;
    v16 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0);
    v17 = swift_bridgeObjectRetain(v9);
    v18 = Array.description.getter(v17, v16);
    v20 = v19;
    swift_bridgeObjectRelease(v9);
    v23 = sub_1000056EC(v18, v20, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease_n(v9, 2);
    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "SAF candidate list from persistence: %s", v14, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v25, 2);
  }
  v21 = v1[9];
  v1[9] = v9;
  return swift_bridgeObjectRelease(v21);
}

void sub_100134320()
{
  _QWORD *v0;
  _TtC14softposreaderd12RemoteReader *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  _TtC14softposreaderd12RemoteReader *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  SEL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v2 = v0[8];
  v1 = (_TtC14softposreaderd12RemoteReader *)v0[9];
  v3 = v0[7];
  sub_100005EF8(v0 + 4, v3);
  v5 = v0[2];
  v4 = v0[3];
  v34 = (uint64_t)v1;
  swift_bridgeObjectRetain();
  v6 = sub_100003A2C(&qword_1001B3E20);
  v7 = sub_100134FCC(&qword_1001B3E28, &qword_1001B3E30, (uint64_t)&unk_100163440, (uint64_t)&protocol conformance descriptor for <A> [A]);
  sub_1000BBFB0(v5, v4, (uint64_t)&v34, v3, v6, v2, v7);
  if (qword_1001AD2E8 != -1)
    swift_once(&qword_1001AD2E8, sub_100133924);
  v8 = type metadata accessor for Logger(0);
  sub_100003A14(v8, (uint64_t)qword_1001B3CE8);
  v9 = swift_bridgeObjectRetain();
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v34 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0);
    v15 = swift_bridgeObjectRetain();
    v16 = Array.description.getter(v15, v14);
    v18 = (_TtC14softposreaderd12RemoteReader *)v17;
    swift_bridgeObjectRelease(v1, v17, v19, v20, v21, v22, v23, v24);
    v32 = sub_1000056EC(v16, (unint64_t)v18, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease_n(v1, 2);
    swift_bridgeObjectRelease(v18, v25, v26, v27, v28, v29, v30, v31);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Updated stored SAF candidate list: %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v1, 2);
  }
}

void sub_1001346F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _TtC14softposreaderd12RemoteReader *v7;
  unint64_t v8;
  SEL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  _TtC14softposreaderd12RemoteReader *v27;
  _BYTE v28[16];
  uint64_t v29;
  char *v30;
  char v31;

  v3 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v28[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v31 = 0;
  v7 = *(_TtC14softposreaderd12RemoteReader **)(v1 + 72);
  v29 = a1;
  v30 = &v31;
  swift_bridgeObjectRetain();
  v8 = (unint64_t)sub_1001337D4((void (*)(uint64_t))sub_100134FB0, (uint64_t)v28, (uint64_t)v7);
  swift_bridgeObjectRelease(v7, v9, v10, v11, v12, v13, v14, v15);
  if ((v31 & 1) == 0)
  {
    v23 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v6, a1, v23);
    v6[*(int *)(v3 + 20)] = 1;
    v24 = &v6[*(int *)(v3 + 24)];
    *v24 = 0;
    v24[1] = 0;
    if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0)
      v8 = sub_1000916B0(0, *(_QWORD *)(v8 + 16) + 1, 1, v8);
    v26 = *(_QWORD *)(v8 + 16);
    v25 = *(_QWORD *)(v8 + 24);
    if (v26 >= v25 >> 1)
      v8 = sub_1000916B0(v25 > 1, v26 + 1, 1, v8);
    *(_QWORD *)(v8 + 16) = v26 + 1;
    sub_100134F6C((uint64_t)v6, v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v26);
  }
  v27 = *(_TtC14softposreaderd12RemoteReader **)(v1 + 72);
  *(_QWORD *)(v1 + 72) = v8;
  swift_bridgeObjectRelease(v27, v16, v17, v18, v19, v20, v21, v22);
  sub_100134320();
}

uint64_t sub_100134874@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X2>, uint64_t a4@<X8>)
{
  char v7;
  uint64_t result;

  v7 = static UUID.== infix(_:_:)(a1, a2);
  result = sub_10010E59C(a1, a4);
  if ((v7 & 1) != 0)
  {
    result = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0);
    *(_BYTE *)(a4 + *(int *)(result + 20)) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t sub_1001348E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v4;
  uint64_t result;

  v4 = static UUID.== infix(_:_:)();
  result = sub_10010E59C(a1, a2);
  if ((v4 & 1) != 0)
  {
    result = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0);
    *(_BYTE *)(a2 + *(int *)(result + 20)) = 0;
  }
  return result;
}

void sub_100134938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _TtC14softposreaderd12RemoteReader *v11;
  unint64_t v12;
  SEL v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  unint64_t v30;
  _TtC14softposreaderd12RemoteReader *v31;
  _BYTE v32[16];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char v37;

  v7 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v32[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v37 = 0;
  v11 = *(_TtC14softposreaderd12RemoteReader **)(v3 + 72);
  v33 = a1;
  v34 = a2;
  v35 = a3;
  v36 = &v37;
  swift_bridgeObjectRetain();
  v12 = (unint64_t)sub_1001337D4((void (*)(uint64_t))sub_100134F4C, (uint64_t)v32, (uint64_t)v11);
  swift_bridgeObjectRelease(v11, v13, v14, v15, v16, v17, v18, v19);
  if ((v37 & 1) == 0)
  {
    v27 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v10, a1, v27);
    v10[*(int *)(v7 + 20)] = 0;
    v28 = &v10[*(int *)(v7 + 24)];
    *v28 = a2;
    v28[1] = a3;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native(v12) & 1) == 0)
      v12 = sub_1000916B0(0, *(_QWORD *)(v12 + 16) + 1, 1, v12);
    v30 = *(_QWORD *)(v12 + 16);
    v29 = *(_QWORD *)(v12 + 24);
    if (v30 >= v29 >> 1)
      v12 = sub_1000916B0(v29 > 1, v30 + 1, 1, v12);
    *(_QWORD *)(v12 + 16) = v30 + 1;
    sub_100134F6C((uint64_t)v10, v12+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v30);
  }
  v31 = *(_TtC14softposreaderd12RemoteReader **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v12;
  swift_bridgeObjectRelease(v31, v20, v21, v22, v23, v24, v25, v26);
  sub_100134320();
}

void sub_100134AD4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _BYTE *a5@<X4>, uint64_t a6@<X8>)
{
  char v11;
  _QWORD *v12;
  _TtC14softposreaderd12RemoteReader *v13;
  SEL v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v11 = static UUID.== infix(_:_:)(a1, a2);
  sub_10010E59C(a1, a6);
  if ((v11 & 1) != 0)
  {
    v12 = (_QWORD *)(a6
                   + *(int *)(type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0)
                            + 24));
    v13 = (_TtC14softposreaderd12RemoteReader *)v12[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease(v13, v14, v15, v16, v17, v18, v19, v20);
    *v12 = a3;
    v12[1] = a4;
    *a5 = 1;
  }
}

uint64_t sub_100134B68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  Swift::String v38;
  uint64_t v39;
  _TtC14softposreaderd12RemoteReader *object;
  _TtC14softposreaderd12RemoteReader *v41;
  _TtC14softposreaderd12RemoteReader *v42;
  SEL v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  Swift::String v50;
  uint64_t countAndFlagsBits;
  Swift::String v52;
  _TtC14softposreaderd12RemoteReader *v53;
  SEL v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _TtC14softposreaderd12RemoteReader *v61;
  SEL v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t v70;
  uint64_t v71;
  _TtC14softposreaderd12RemoteReader *v72;
  uint64_t v73;

  v3 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v9 = (char *)&v70 - v8;
  v10 = *(_QWORD *)(v1 + 72);
  v11 = *(_QWORD *)(v10 + 16);
  if (!v11)
    return 0;
  v12 = v10 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  v13 = *(_QWORD *)(v7 + 72);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_10010E59C(v12, (uint64_t)v9);
    if ((static UUID.== infix(_:_:)(v9, a1) & 1) != 0)
      break;
    sub_10010E5E0((uint64_t)v9);
    v12 += v13;
    if (!--v11)
    {
      swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v10, v21, v22, v23, v24, v25, v26, v27);
      return 0;
    }
  }
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v10, v14, v15, v16, v17, v18, v19, v20);
  if (qword_1001AD2E8 != -1)
    swift_once(&qword_1001AD2E8, sub_100133924);
  v29 = type metadata accessor for Logger(0);
  sub_100003A14(v29, (uint64_t)qword_1001B3CE8);
  v30 = sub_10010E59C((uint64_t)v9, (uint64_t)v6);
  v31 = Logger.logObject.getter(v30);
  v32 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc(12, -1);
    v34 = swift_slowAlloc(32, -1);
    v73 = v34;
    *(_DWORD *)v33 = 136315138;
    v35 = type metadata accessor for UUID(0);
    v36 = sub_100005F1C(&qword_1001B3E18, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v71 = dispatch thunk of CustomStringConvertible.description.getter(v35, v36);
    v72 = (_TtC14softposreaderd12RemoteReader *)v37;
    v38._countAndFlagsBits = 8236;
    v38._object = (void *)0xE200000000000000;
    String.append(_:)(v38);
    if (v6[*(int *)(v3 + 20)])
      v39 = 0x657669746361;
    else
      v39 = 0x6576697463616E69;
    object = (_TtC14softposreaderd12RemoteReader *)0xE800000000000000;
    if (v6[*(int *)(v3 + 20)])
      v41 = (_TtC14softposreaderd12RemoteReader *)0xE600000000000000;
    else
      v41 = (_TtC14softposreaderd12RemoteReader *)0xE800000000000000;
    v42 = v41;
    String.append(_:)(*(Swift::String *)&v39);
    swift_bridgeObjectRelease(v41, v43, v44, v45, v46, v47, v48, v49);
    v50._countAndFlagsBits = 8236;
    v50._object = (void *)0xE200000000000000;
    String.append(_:)(v50);
    if (*(_QWORD *)&v6[*(int *)(v3 + 24) + 8])
    {
      v52 = String.redactedToken()();
      countAndFlagsBits = v52._countAndFlagsBits;
      object = (_TtC14softposreaderd12RemoteReader *)v52._object;
    }
    else
    {
      countAndFlagsBits = 0x6E656B6F74206F6ELL;
    }
    v53 = object;
    String.append(_:)(*(Swift::String *)&countAndFlagsBits);
    swift_bridgeObjectRelease(object, v54, v55, v56, v57, v58, v59, v60);
    v61 = v72;
    v71 = sub_1000056EC(v71, (unint64_t)v72, &v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v33 + 4, v33 + 12);
    swift_bridgeObjectRelease(v61, v62, v63, v64, v65, v66, v67, v68);
    sub_10010E5E0((uint64_t)v6);
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "found %s", v33, 0xCu);
    swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    swift_slowDealloc(v33, -1, -1);
  }
  else
  {
    sub_10010E5E0((uint64_t)v6);
  }

  v28 = *(_QWORD *)&v9[*(int *)(v3 + 24)];
  swift_bridgeObjectRetain();
  sub_10010E5E0((uint64_t)v9);
  return v28;
}

uint64_t sub_100134EBC()
{
  uint64_t v0;
  SEL v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  sub_100005DE0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  sub_100005D3C((_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(v0 + 72), v1, v2, v3, v4, v5, v6, v7);
  return swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for StoreAndForwardSelector()
{
  return objc_opt_self(_TtC9SPREngine23StoreAndForwardSelector);
}

uint64_t type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(uint64_t a1)
{
  uint64_t result;

  result = qword_1001B3EA0;
  if (!qword_1001B3EA0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for StoreAndForwardSelector.StoreAndForwardProfileCandidate);
  return result;
}

void sub_100134F4C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_100134AD4(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_BYTE **)(v2 + 40), a2);
}

uint64_t sub_100134F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100134FB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100134874(a1, *(_QWORD *)(v2 + 16), *(_BYTE **)(v2 + 24), a2);
}

uint64_t sub_100134FCC(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v9 = sub_100003A6C(&qword_1001B3E20);
    sub_100005F1C(a2, type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate, a3);
    result = swift_getWitnessTable(a4, v9);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *sub_100135050(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15[2];
  uint64_t v16[3];
  uint64_t v17;
  uint64_t v18;

  if (qword_1001AD2E8 != -1)
    swift_once(&qword_1001AD2E8, sub_100133924);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_100003A14(v3, (uint64_t)qword_1001B3CE8);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v16[0] = v8;
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)&v15[0] = sub_1000056EC(0x7065642874696E69, 0xEC000000293A746FLL, v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v15, (char *)v15 + 8, v7 + 4, v7 + 12);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "StoreAndForwardSelector.%s", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }

  v9 = a1;
  sub_1000DBA54();
  if (v1)
  {
    swift_release(a1);
  }
  else
  {
    v10 = v17;
    v11 = v18;
    sub_100005EF8(v16, v17);
    sub_10001CA88(v10, v11);
    v12 = type metadata accessor for StoreAndForwardSelector();
    v9 = (_QWORD *)swift_allocObject(v12, 80, 7);
    v9[2] = sub_1000FA224(0xD000000000000017, 0x8000000100163340);
    v9[3] = v13;
    sub_10001A674(v15, (uint64_t)(v9 + 4));
    v9[9] = _swiftEmptyArrayStorage;
    swift_retain(v9);
    sub_100134010();
    swift_release(v9);
    swift_release(a1);
    sub_100005D3C(v16);
  }
  return v9;
}

_QWORD *sub_1001352B0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = type metadata accessor for UUID(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain(v11);
  }
  return a1;
}

uint64_t sub_10013534C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(a2 + 24) + 8));
}

uint64_t sub_100135394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  return a1;
}

uint64_t sub_100135404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v7 = *(int *)(a3 + 24);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v10 = v9[1];
  v11 = v8[1];
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  return a1;
}

uint64_t sub_10013548C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_1001354F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  v12 = v8[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease(v12);
  return a1;
}

uint64_t sub_100135564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100135570);
}

uint64_t sub_100135570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_1001355FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100135608);
}

uint64_t sub_100135608(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  return result;
}

uint64_t sub_100135684(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_1001633C0;
    v4[2] = &unk_1001633D8;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

unint64_t sub_100135700()
{
  unint64_t result;

  result = qword_1001B3EE8;
  if (!qword_1001B3EE8)
  {
    result = swift_getWitnessTable(&unk_10016352C, &type metadata for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B3EE8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100135790 + 4 * byte_100163315[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1001357C4 + 4 * byte_100163310[v4]))();
}

uint64_t sub_1001357C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001357CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1001357D4);
  return result;
}

uint64_t sub_1001357E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1001357E8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1001357EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001357F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys()
{
  return &type metadata for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys;
}

unint64_t sub_100135814()
{
  unint64_t result;

  result = qword_1001B3EF8;
  if (!qword_1001B3EF8)
  {
    result = swift_getWitnessTable(&unk_100163504, &type metadata for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B3EF8);
  }
  return result;
}

unint64_t sub_10013585C()
{
  unint64_t result;

  result = qword_1001B3F00;
  if (!qword_1001B3F00)
  {
    result = swift_getWitnessTable(&unk_100163474, &type metadata for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B3F00);
  }
  return result;
}

unint64_t sub_1001358A4()
{
  unint64_t result;

  result = qword_1001B3F08;
  if (!qword_1001B3F08)
  {
    result = swift_getWitnessTable(&unk_10016349C, &type metadata for StoreAndForwardSelector.StoreAndForwardProfileCandidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B3F08);
  }
  return result;
}

uint64_t sub_1001358E8(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  char v8;

  if (a1 == 0x64697074666173 && a2 == 0xE700000000000000)
  {
    v5 = 0xE700000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x64697074666173, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6576697463417369 && a2 == 0xE800000000000000)
  {
    v7 = 0xE800000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6576697463417369, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0xD000000000000010 && a2 == 0x80000001001708D0)
  {
    swift_bridgeObjectRelease(0x80000001001708D0);
    return 2;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010, 0x80000001001708D0, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_100135A38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_1000039D4(v0, qword_1001B3F10);
  v1 = sub_100003A14(v0, (uint64_t)qword_1001B3F10);
  if (qword_1001AD158 != -1)
    swift_once(&qword_1001AD158, sub_1000CC540);
  v2 = sub_100003A14(v0, (uint64_t)qword_1001B4DF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_100135AC8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_100135AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  if ((a2 & 0xFF000000000000) != 0)
  {
    __chkstk_darwin(a1);
    result = sub_1001369E0();
    if (!v2)
      return *(_QWORD *)(v3 - 32);
  }
  else
  {
    v5 = sub_1000243B8(6001, 0, 0, 0);
    return swift_willThrow(v5);
  }
  return result;
}

void sub_100135BA0(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t countAndFlagsBits;
  _TtC14softposreaderd12RemoteReader *object;
  Swift::String v25;
  _TtC14softposreaderd12RemoteReader *v26;
  SEL v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v7 = type metadata accessor for String.Encoding(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100136F64();
  if (!v3)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, "storedValue");
    if (v12)
    {
      v13 = v12;
      v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v12);
      v16 = v15;

      *a3 = v14;
      a3[1] = v16;
    }
    else
    {
      if (qword_1001AD2F0 != -1)
        swift_once(&qword_1001AD2F0, sub_100135A38);
      v17 = type metadata accessor for Logger(0);
      sub_100003A14(v17, (uint64_t)qword_1001B3F10);
      sub_100005D9C(a1, a2);
      v18 = sub_100005D9C(a1, a2);
      v19 = Logger.logObject.getter(v18);
      v20 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc(12, -1);
        v22 = swift_slowAlloc(32, -1);
        v38 = v22;
        *(_DWORD *)v21 = 136315138;
        static String.Encoding.utf8.getter(v22);
        countAndFlagsBits = String.init(data:encoding:)(a1, a2, v9);
        if (!object)
        {
          v25 = Data.hexString()();
          object = (_TtC14softposreaderd12RemoteReader *)v25._object;
          countAndFlagsBits = v25._countAndFlagsBits;
        }
        v26 = object;
        v36 = sub_1000056EC(countAndFlagsBits, (unint64_t)object, &v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v21 + 4, v21 + 12);
        swift_bridgeObjectRelease(v26, v27, v28, v29, v30, v31, v32, v33);
        sub_100005DE0(a1, a2);
        sub_100005DE0(a1, a2);
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "CoreDataWrapper: Failed to retrieve data for key: \"%s\"", v21, 0xCu);
        swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v22, -1, -1);
        swift_slowDealloc(v21, -1, -1);
      }
      else
      {
        sub_100005DE0(a1, a2);
        sub_100005DE0(a1, a2);
      }

      v34 = sub_1000243B8(6002, 0, 0, 0);
      swift_willThrow(v34);

    }
  }
}

void sub_100135E48(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_100135E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  if ((a2 & 0xFF000000000000) != 0)
    __asm { BR              X11 }
  v4 = sub_1000243B8(6001, 0, 0, 0);
  return swift_willThrow(v4);
}

void sub_100135F6C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t countAndFlagsBits;
  _TtC14softposreaderd12RemoteReader *object;
  Swift::String v27;
  _TtC14softposreaderd12RemoteReader *v28;
  SEL v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  Class v38;
  uint64_t v39;
  id v40;
  Class isa;
  Class v42;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v11 = type metadata accessor for String.Encoding(0);
  __chkstk_darwin(v11);
  v13 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void **)(a1 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_context);
  sub_100136F64();
  if (v5)
  {
    _s3__C4CodeOMa_8(0);
    v17 = v16;
    v46 = 6000;
    swift_errorRetain();
    v18 = sub_1000549A0();
    LOBYTE(v17) = static _ErrorCodeProtocol.~= infix(_:_:)(&v46, v5, v17, v18);
    swift_errorRelease();
    if ((v17 & 1) == 0)
      return;
    swift_errorRelease();
    if (qword_1001AD2F0 != -1)
      swift_once(&qword_1001AD2F0, sub_100135A38);
    v19 = type metadata accessor for Logger(0);
    sub_100003A14(v19, (uint64_t)qword_1001B3F10);
    sub_100005D9C(a2, a3);
    v20 = sub_100005D9C(a2, a3);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v43[1] = a4;
      v23 = (uint8_t *)swift_slowAlloc(12, -1);
      v24 = swift_slowAlloc(32, -1);
      v43[0] = v24;
      v46 = v24;
      *(_DWORD *)v23 = 136315138;
      static String.Encoding.utf8.getter(v24);
      countAndFlagsBits = String.init(data:encoding:)(a2, a3, v13);
      v43[2] = a5;
      if (!object)
      {
        v27 = Data.hexString()();
        object = (_TtC14softposreaderd12RemoteReader *)v27._object;
        countAndFlagsBits = v27._countAndFlagsBits;
      }
      v28 = object;
      v44 = sub_1000056EC(countAndFlagsBits, (unint64_t)object, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v23 + 4, v23 + 12);
      swift_bridgeObjectRelease(v28, v29, v30, v31, v32, v33, v34, v35);
      sub_100005DE0(a2, a3);
      sub_100005DE0(a2, a3);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "CoreDataWrapper: Insert data for key: \"%s\"", v23, 0xCu);
      v36 = v43[0];
      swift_arrayDestroy(v43[0], 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v23, -1, -1);

    }
    else
    {
      sub_100005DE0(a2, a3);
      sub_100005DE0(a2, a3);

    }
    v39 = type metadata accessor for Logging();
    v40 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v39)), "initWithContext:", v14);
    isa = Data._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v40, "setStoredKey:", isa);

    v42 = Data._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v40, "setStoredValue:", v42);

    objc_msgSend(v40, "setWillBeRemovedAfterUpdate:", *(unsigned __int8 *)(a1 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_willBeRemovedAfterUpdate));
  }
  else
  {
    v37 = v15;
    v38 = Data._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v37, "setStoredValue:", v38);

  }
  sub_1001371C0(v14);
}

void sub_1001362F8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_100136320(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if ((a2 & 0xFF000000000000) != 0)
  {
    __chkstk_darwin(a1);
    return sub_100136B60();
  }
  else
  {
    v3 = sub_1000243B8(6001, 0, 0, 0);
    return swift_willThrow(v3);
  }
}

void sub_1001363C0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t countAndFlagsBits;
  _TtC14softposreaderd12RemoteReader *object;
  Swift::String v23;
  _TtC14softposreaderd12RemoteReader *v24;
  SEL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;

  v7 = type metadata accessor for String.Encoding(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)(a1 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_context);
  sub_100136F64();
  if (v3)
  {
    _s3__C4CodeOMa_8(0);
    v13 = v12;
    v34 = 6000;
    swift_errorRetain();
    v14 = sub_1000549A0();
    LOBYTE(v13) = static _ErrorCodeProtocol.~= infix(_:_:)(&v34, v3, v13, v14);
    swift_errorRelease();
    if ((v13 & 1) != 0)
    {
      swift_errorRelease();
      if (qword_1001AD2F0 != -1)
        swift_once(&qword_1001AD2F0, sub_100135A38);
      v15 = type metadata accessor for Logger(0);
      sub_100003A14(v15, (uint64_t)qword_1001B3F10);
      sub_100005D9C(a2, a3);
      v16 = sub_100005D9C(a2, a3);
      v17 = Logger.logObject.getter(v16);
      v18 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = (uint8_t *)swift_slowAlloc(12, -1);
        v20 = swift_slowAlloc(32, -1);
        v34 = v20;
        *(_DWORD *)v19 = 136315138;
        static String.Encoding.utf8.getter(v20);
        countAndFlagsBits = String.init(data:encoding:)(a2, a3, v9);
        if (!object)
        {
          v23 = Data.hexString()();
          object = (_TtC14softposreaderd12RemoteReader *)v23._object;
          countAndFlagsBits = v23._countAndFlagsBits;
        }
        v24 = object;
        v33 = sub_1000056EC(countAndFlagsBits, (unint64_t)object, &v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v19 + 4, v19 + 12);
        swift_bridgeObjectRelease(v24, v25, v26, v27, v28, v29, v30, v31);
        sub_100005DE0(a2, a3);
        sub_100005DE0(a2, a3);
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "CoreDataWrapper: key:\n\"%s\" does not exist, cannot delete", v19, 0xCu);
        swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v20, -1, -1);
        swift_slowDealloc(v19, -1, -1);
      }
      else
      {
        sub_100005DE0(a2, a3);
        sub_100005DE0(a2, a3);
      }

    }
  }
  else
  {
    v32 = v11;
    objc_msgSend(v10, "deleteObject:", v11);

    sub_1001371C0(v10);
  }
}

void sub_100136680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  sub_100136B60();
  if (!v0)
  {
    if (qword_1001AD2F0 != -1)
      swift_once(&qword_1001AD2F0, sub_100135A38);
    v1 = type metadata accessor for Logger(0);
    v2 = sub_100003A14(v1, (uint64_t)qword_1001B3F10);
    v3 = Logger.logObject.getter(v2);
    v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "CoreDataWrapper: deleted after update", v5, 2u);
      swift_slowDealloc(v5, -1, -1);
    }

  }
}

void sub_100136774(uint64_t a1)
{
  uint64_t v1;
  id v3;
  NSString v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  void *v24;
  uint64_t v25;
  SEL v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v3 = objc_allocWithZone((Class)NSFetchRequest);
  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend(v3, "initWithEntityName:", v4);

  sub_100005E24(0, &qword_1001AFDB0, NSPredicate_ptr);
  v6 = sub_100003A2C((uint64_t *)&unk_1001B1300);
  v7 = swift_allocObject(v6, 72, 7);
  *(_OWORD *)(v7 + 16) = xmmword_10015A5F0;
  v8 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", 1);
  *(_QWORD *)(v7 + 56) = sub_100005E24(0, &qword_1001AF6D0, NSNumber_ptr);
  *(_QWORD *)(v7 + 64) = sub_100137354(&qword_1001B3F78, &qword_1001AF6D0, NSNumber_ptr);
  *(_QWORD *)(v7 + 32) = v8;
  v9 = (void *)NSPredicate.init(format:_:)(0xD00000000000001ELL, 0x8000000100172A20, v7);
  objc_msgSend(v5, "setPredicate:", v9);

  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 1);
  v10 = *(void **)(a1 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_context);
  v11 = type metadata accessor for Logging();
  v12 = NSManagedObjectContext.fetch<A>(_:)(v5, v11);
  if (v1)
    goto LABEL_15;
  v20 = v12;
  if (!((unint64_t)v12 >> 62))
  {
    v21 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v21)
      goto LABEL_4;
LABEL_14:
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v20, v13, v14, v15, v16, v17, v18, v19);
    sub_1001371C0(v10);
LABEL_15:

    return;
  }
  if (v12 < 0)
    v25 = v12;
  else
    v25 = v12 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v21 = _CocoaArrayWrapper.endIndex.getter(v25);
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v20, v26, v27, v28, v29, v30, v31, v32);
  if (!v21)
    goto LABEL_14;
LABEL_4:
  if (v21 >= 1)
  {
    for (i = 0; i != v21; ++i)
    {
      if ((v20 & 0xC000000000000001) != 0)
        v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v20);
      else
        v23 = *(id *)(v20 + 8 * i + 32);
      v24 = v23;
      objc_msgSend(v10, "deleteObject:", v23);

    }
    goto LABEL_14;
  }
  __break(1u);
}

uint64_t sub_1001369E0()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  SEL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_context), "persistentStoreCoordinator");
  if (!v1)
    goto LABEL_6;
  v2 = v1;
  v3 = objc_msgSend(v1, "persistentStores");

  v4 = sub_100005E24(0, &qword_1001B33D8, NSPersistentStore_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  if ((unint64_t)v5 >> 62)
  {
    v17 = v5 < 0 ? v5 : v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v13 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v5, v18, v19, v20, v21, v22, v23, v24);
  }
  else
  {
    v13 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v5, v6, v7, v8, v9, v10, v11, v12);
  if (v13)
  {
    __chkstk_darwin(v14);
    return NSManagedObjectContext.performAndWait<A>(_:)(sub_100136E58);
  }
  else
  {
LABEL_6:
    v16 = sub_1000243B8(6998, 0xD000000000000018, (void *)0x8000000100172A00, 0);
    return swift_willThrow(v16);
  }
}

uint64_t sub_100136B60()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  SEL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_context), "persistentStoreCoordinator");
  if (!v1)
    goto LABEL_6;
  v2 = v1;
  v3 = objc_msgSend(v1, "persistentStores");

  v4 = sub_100005E24(0, &qword_1001B33D8, NSPersistentStore_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  if ((unint64_t)v5 >> 62)
  {
    v17 = v5 < 0 ? v5 : v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v13 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v5, v18, v19, v20, v21, v22, v23, v24);
  }
  else
  {
    v13 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v5, v6, v7, v8, v9, v10, v11, v12);
  if (v13)
  {
    __chkstk_darwin(v14);
    return NSManagedObjectContext.performAndWait<A>(_:)(sub_100136E58);
  }
  else
  {
LABEL_6:
    v16 = sub_1000243B8(6998, 0xD000000000000018, (void *)0x8000000100172A00, 0);
    return swift_willThrow(v16);
  }
}

id sub_100136D10()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CoreDataWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CoreDataWrapper()
{
  return objc_opt_self(_TtC9SPREngine15CoreDataWrapper);
}

uint64_t sub_100136DAC()
{
  _QWORD *v0;

  return *(unsigned __int8 *)(*v0 + OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_isTransient);
}

void sub_100136DC0(uint64_t a1, uint64_t a2)
{
  sub_100135AC8(a1, a2);
}

void sub_100136DE0(uint64_t a1, uint64_t a2)
{
  sub_100135E48(a1, a2);
}

void sub_100136E00(uint64_t a1, uint64_t a2)
{
  sub_1001362F8(a1, a2);
}

void sub_100136E20()
{
  sub_100136680();
}

void sub_100136E40()
{
  uint64_t v0;

  sub_100136774(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100136E58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v0 + 16))();
  if (v1)
    return swift_willThrow(result);
  return result;
}

id sub_100136E80(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  char *v5;
  char *v8;
  void *v9;
  char *v10;
  id v11;
  objc_super v13;

  v8 = &v5[OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_entityName];
  *(_QWORD *)v8 = a1;
  *((_QWORD *)v8 + 1) = a2;
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_manager] = a3;
  v9 = *(void **)(a3 + 56);
  v10 = v5;
  swift_retain();
  v11 = objc_msgSend(v9, "newBackgroundContext");
  objc_msgSend(v11, "setStalenessInterval:", 0.0);
  objc_msgSend(v11, "setUndoManager:", 0);
  *(_QWORD *)&v10[OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_context] = v11;
  v10[OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_isTransient] = a4;
  v10[OBJC_IVAR____TtC9SPREngine15CoreDataWrapper_willBeRemovedAfterUpdate] = a5;

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for CoreDataWrapper();
  return objc_msgSendSuper2(&v13, "init");
}

void sub_100136F64()
{
  uint64_t v0;
  id v1;
  NSString v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  SEL v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  SEL v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;

  v1 = objc_allocWithZone((Class)NSFetchRequest);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "initWithEntityName:", v2);

  sub_100005E24(0, &qword_1001AFDB0, NSPredicate_ptr);
  v4 = sub_100003A2C((uint64_t *)&unk_1001B1300);
  v5 = swift_allocObject(v4, 72, 7);
  *(_OWORD *)(v5 + 16) = xmmword_10015A5F0;
  isa = Data._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)(v5 + 56) = sub_100005E24(0, &qword_1001B3F80, NSData_ptr);
  *(_QWORD *)(v5 + 64) = sub_100137354(&qword_1001B3F88, &qword_1001B3F80, NSData_ptr);
  *(_QWORD *)(v5 + 32) = isa;
  v7 = (void *)NSPredicate.init(format:_:)(0x654B6465726F7473, 0xEF4025203D3D2079, v5);
  objc_msgSend(v3, "setPredicate:", v7);

  objc_msgSend(v3, "setFetchLimit:", 1);
  v8 = type metadata accessor for Logging();
  v9 = NSManagedObjectContext.fetch<A>(_:)(v3, v8);
  if (v0)
    goto LABEL_2;
  v17 = v9;
  if (!((unint64_t)v9 >> 62))
  {
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
LABEL_13:
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v17, v10, v11, v12, v13, v14, v15, v16);
    v35 = sub_1000243B8(6000, 0, 0, 0);
    swift_willThrow(v35);
LABEL_2:

    return;
  }
  if (v9 < 0)
    v26 = v9;
  else
    v26 = v9 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v27 = _CocoaArrayWrapper.endIndex.getter(v26);
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v17, v28, v29, v30, v31, v32, v33, v34);
  if (!v27)
    goto LABEL_13;
LABEL_5:
  if ((v17 & 0xC000000000000001) != 0)
  {
    specialized _ArrayBuffer._getElementSlowPath(_:)(0, v17);
    goto LABEL_8;
  }
  if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v18 = *(id *)(v17 + 32);
LABEL_8:

    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v17, v19, v20, v21, v22, v23, v24, v25);
    return;
  }
  __break(1u);
}

void sub_1001371C0(void *a1)
{
  unsigned int v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  id v12;

  if (objc_msgSend(a1, "hasChanges"))
  {
    v12 = 0;
    v2 = objc_msgSend(a1, "save:", &v12);
    v3 = v12;
    if (v2)
    {
      v4 = v12;
      objc_msgSend(a1, "reset");
    }
    else
    {
      v10 = v12;
      _convertNSErrorToError(_:)(v3);

      swift_willThrow(v11);
    }
  }
  else
  {
    if (qword_1001AD2F0 != -1)
      swift_once(&qword_1001AD2F0, sub_100135A38);
    v5 = type metadata accessor for Logger(0);
    v6 = sub_100003A14(v5, (uint64_t)qword_1001B3F10);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "moc has not changed", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

  }
}

void sub_100137338()
{
  uint64_t v0;

  sub_1001363C0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_100137354(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_100005E24(255, a2, a3);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_100137394()
{
  uint64_t v0;

  sub_100135F6C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

void sub_1001373B4(uint64_t *a1@<X8>)
{
  uint64_t v1;

  sub_100135BA0(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), a1);
}

uint64_t destroy for InternalTransactionData(uint64_t a1, const char *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(a1 + 16), a2, a3, a4, a5, a6, a7, a8);
  sub_100005DE0(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
  sub_100005DE0(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return sub_100005DE0(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t initializeWithCopy for InternalTransactionData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_100005D9C(v5, v6);
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 48);
  sub_100005D9C(v7, v8);
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v10 = *(_QWORD *)(a2 + 64);
  v9 = *(_QWORD *)(a2 + 72);
  sub_100005D9C(v10, v9);
  *(_QWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 72) = v9;
  return a1;
}

uint64_t assignWithCopy for InternalTransactionData(uint64_t a1, uint64_t a2)
{
  _TtC14softposreaderd12RemoteReader *v4;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_TtC14softposreaderd12RemoteReader **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = *(_QWORD *)(a2 + 24);
  v13 = *(_QWORD *)(a2 + 32);
  sub_100005D9C(v12, v13);
  v14 = *(_QWORD *)(a1 + 24);
  v15 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = v12;
  *(_QWORD *)(a1 + 32) = v13;
  sub_100005DE0(v14, v15);
  v16 = *(_QWORD *)(a2 + 40);
  v17 = *(_QWORD *)(a2 + 48);
  sub_100005D9C(v16, v17);
  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v16;
  *(_QWORD *)(a1 + 48) = v17;
  sub_100005DE0(v18, v19);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v21 = *(_QWORD *)(a2 + 64);
  v20 = *(_QWORD *)(a2 + 72);
  sub_100005D9C(v21, v20);
  v22 = *(_QWORD *)(a1 + 64);
  v23 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 64) = v21;
  *(_QWORD *)(a1 + 72) = v20;
  sub_100005DE0(v22, v23);
  return a1;
}

uint64_t assignWithTake for InternalTransactionData(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v10;
  _TtC14softposreaderd12RemoteReader *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v10 = *(_QWORD *)(a2 + 16);
  v11 = *(_TtC14softposreaderd12RemoteReader **)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v10;
  swift_bridgeObjectRelease(v11, (SEL)a2, a3, a4, a5, a6, a7, a8);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  sub_100005DE0(v12, v13);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  sub_100005DE0(v14, v15);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v16 = *(_QWORD *)(a1 + 64);
  v17 = *(_QWORD *)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  sub_100005DE0(v16, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for InternalTransactionData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InternalTransactionData(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InternalTransactionData()
{
  return &type metadata for InternalTransactionData;
}

uint64_t sub_10013765C()
{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  _TtC14softposreaderd12RemoteReader *v3;
  _TtC14softposreaderd12RemoteReader *v4;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  Swift::String v12;
  uint64_t v13;
  _TtC14softposreaderd12RemoteReader *v14;
  Swift::String v15;
  SEL v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  Swift::String v23;
  Swift::String v24;
  _TtC14softposreaderd12RemoteReader *object;
  SEL v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  Swift::String v33;
  Swift::String v34;
  _TtC14softposreaderd12RemoteReader *v35;
  SEL v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  Swift::String v43;
  uint64_t v44;
  _TtC14softposreaderd12RemoteReader *v45;
  _TtC14softposreaderd12RemoteReader *v46;
  SEL v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  Swift::String v54;
  Swift::String v55;
  _TtC14softposreaderd12RemoteReader *v56;
  SEL v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  Swift::String v64;

  _StringGuts.grow(_:)(150);
  v1._countAndFlagsBits = 0xD000000000000025;
  v1._object = (void *)0x8000000100172A60;
  String.append(_:)(v1);
  if ((*(_BYTE *)v0 & 1) != 0)
    v2 = 1702195828;
  else
    v2 = 0x65736C6166;
  if ((*(_BYTE *)v0 & 1) != 0)
    v3 = (_TtC14softposreaderd12RemoteReader *)0xE400000000000000;
  else
    v3 = (_TtC14softposreaderd12RemoteReader *)0xE500000000000000;
  v4 = v3;
  String.append(_:)(*(Swift::String *)&v2);
  swift_bridgeObjectRelease(v3, v5, v6, v7, v8, v9, v10, v11);
  v12._object = (void *)0x800000010016C180;
  v12._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v12);
  v13 = *(_QWORD *)(v0 + 8);
  v14 = *(_TtC14softposreaderd12RemoteReader **)(v0 + 16);
  swift_bridgeObjectRetain();
  v15._countAndFlagsBits = v13;
  v15._object = v14;
  String.append(_:)(v15);
  swift_bridgeObjectRelease(v14, v16, v17, v18, v19, v20, v21, v22);
  v23._countAndFlagsBits = 0xD000000000000015;
  v23._object = (void *)0x800000010016C1C0;
  String.append(_:)(v23);
  v24 = Data.hexString()();
  object = (_TtC14softposreaderd12RemoteReader *)v24._object;
  String.append(_:)(v24);
  swift_bridgeObjectRelease(object, v26, v27, v28, v29, v30, v31, v32);
  v33._countAndFlagsBits = 0x4B454B6E6970202CLL;
  v33._object = (void *)0xEE00203A68736148;
  String.append(_:)(v33);
  v34 = Data.hexString()();
  v35 = (_TtC14softposreaderd12RemoteReader *)v34._object;
  String.append(_:)(v34);
  swift_bridgeObjectRelease(v35, v36, v37, v38, v39, v40, v41, v42);
  v43._countAndFlagsBits = 0xD000000000000016;
  v43._object = (void *)0x8000000100172A90;
  String.append(_:)(v43);
  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
    v44 = 1702195828;
  else
    v44 = 0x65736C6166;
  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
    v45 = (_TtC14softposreaderd12RemoteReader *)0xE400000000000000;
  else
    v45 = (_TtC14softposreaderd12RemoteReader *)0xE500000000000000;
  v46 = v45;
  String.append(_:)(*(Swift::String *)&v44);
  swift_bridgeObjectRelease(v45, v47, v48, v49, v50, v51, v52, v53);
  v54._countAndFlagsBits = 0xD00000000000001ALL;
  v54._object = (void *)0x8000000100172AB0;
  String.append(_:)(v54);
  v55 = Data.hexString()();
  v56 = (_TtC14softposreaderd12RemoteReader *)v55._object;
  String.append(_:)(v55);
  swift_bridgeObjectRelease(v56, v57, v58, v59, v60, v61, v62, v63);
  v64._countAndFlagsBits = 41;
  v64._object = (void *)0xE100000000000000;
  String.append(_:)(v64);
  return 0;
}

uint64_t sub_10013786C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001378A8 + 4 * byte_1001635B0[a1]))(0x69757165526E6970, 0xEB00000000646572);
}

uint64_t sub_1001378A8()
{
  return 0x746361736E617274;
}

unint64_t sub_1001378CC()
{
  return 0xD000000000000011;
}

uint64_t sub_1001378E8()
{
  return 0x61484B454B6E6970;
}

unint64_t sub_100137904()
{
  return 0xD000000000000012;
}

uint64_t sub_10013793C(_QWORD *a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  __int128 v20;

  v3 = v1;
  v5 = sub_100003A2C(&qword_1001B3FA0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100005EF8(a1, v9);
  v11 = sub_100138314();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for InternalTransactionData.CodingKeys, &type metadata for InternalTransactionData.CodingKeys, v11, v9, v10);
  v12 = *v3;
  LOBYTE(v20) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, &v20, v5);
  if (!v2)
  {
    v13 = *((_QWORD *)v3 + 1);
    v14 = *((_QWORD *)v3 + 2);
    LOBYTE(v20) = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v13, v14, &v20, v5);
    v20 = *(_OWORD *)(v3 + 24);
    v19 = 2;
    v15 = sub_1000D590C();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v20, &v19, v5, &type metadata for Data, v15);
    v20 = *(_OWORD *)(v3 + 40);
    v19 = 3;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v20, &v19, v5, &type metadata for Data, v15);
    v16 = v3[56];
    LOBYTE(v20) = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v16, &v20, v5);
    v20 = *((_OWORD *)v3 + 4);
    v19 = 5;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v20, &v19, v5, &type metadata for Data, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100137B34()
{
  unsigned __int8 *v0;

  return sub_10013786C(*v0);
}

uint64_t sub_100137B3C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100137C1C(a1, a2);
  *a3 = result;
  return result;
}

void sub_100137B60(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_100137B6C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100138314();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100137B94(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100138314();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_100137BBC@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[5];

  sub_100137ECC(a1, (uint64_t)v6);
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

uint64_t sub_100137C04(_QWORD *a1)
{
  return sub_10013793C(a1);
}

uint64_t sub_100137C1C(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;

  if (a1 == 0x69757165526E6970 && a2 == 0xEB00000000646572)
  {
    v5 = 0xEB00000000646572;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x69757165526E6970, 0xEB00000000646572, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x746361736E617274 && a2 == 0xED000064496E6F69)
  {
    v7 = 0xED000064496E6F69;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x746361736E617274, 0xED000064496E6F69, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0xD000000000000011)
  {
    v8 = 0x800000010016BDB0;
    if (a2 == 0x800000010016BDB0)
      goto LABEL_19;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011, 0x800000010016BDB0, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
LABEL_19:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if (a1 == 0x61484B454B6E6970 && a2 == 0xEA00000000006873)
  {
    v9 = 0xEA00000000006873;
LABEL_25:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x61484B454B6E6970, 0xEA00000000006873, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
    goto LABEL_25;
  }
  if (a1 == 0xD000000000000012 && a2 == 0x80000001001688F0)
  {
    v10 = 0x80000001001688F0;
LABEL_31:
    swift_bridgeObjectRelease(v10);
    return 4;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012, 0x80000001001688F0, a1, a2, 0) & 1) != 0)
  {
    v10 = a2;
    goto LABEL_31;
  }
  if (a1 == 0xD000000000000016 && a2 == 0x8000000100172AD0)
  {
    swift_bridgeObjectRelease(0x8000000100172AD0);
    return 5;
  }
  else
  {
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000016, 0x8000000100172AD0, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v11 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

void sub_100137ECC(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _TtC14softposreaderd12RemoteReader *v14;
  _TtC14softposreaderd12RemoteReader *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  SEL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  SEL v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  int v50;
  char v51;

  v5 = sub_100003A2C(&qword_1001B3F90);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100005EF8(a1, v9);
  v11 = sub_100138314();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for InternalTransactionData.CodingKeys, &type metadata for InternalTransactionData.CodingKeys, v11, v9, v10);
  if (v2)
  {
    sub_100005D3C(a1);
  }
  else
  {
    LOBYTE(v48) = 0;
    v12 = KeyedDecodingContainer.decode(_:forKey:)(&v48, v5);
    LOBYTE(v48) = 1;
    v13 = KeyedDecodingContainer.decode(_:forKey:)(&v48, v5);
    v15 = v14;
    v46 = v13;
    v51 = 2;
    v16 = sub_1000D5840();
    swift_bridgeObjectRetain();
    v47 = v16;
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v51, v5, &type metadata for Data, v16);
    v51 = 3;
    v44 = v48;
    v45 = v49;
    sub_100005D9C(v48, v49);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v51, v5, &type metadata for Data, v47);
    v17 = v48;
    LOBYTE(v48) = 4;
    v42 = v49;
    v43 = v17;
    sub_100005D9C(v17, v49);
    LODWORD(v41) = KeyedDecodingContainer.decode(_:forKey:)(&v48, v5);
    v51 = 5;
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v51, v5, &type metadata for Data, v47);
    v50 = v12 & 1;
    LODWORD(v47) = v41 & 1;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v18 = v48;
    v40 = v49;
    v41 = v48;
    swift_bridgeObjectRetain();
    v20 = v44;
    v19 = v45;
    sub_100005D9C(v44, v45);
    v21 = v42;
    v22 = v43;
    sub_100005D9C(v43, v42);
    v23 = v18;
    v24 = v40;
    sub_100005D9C(v23, v40);
    sub_100005DE0(v22, v21);
    sub_100005DE0(v20, v19);
    swift_bridgeObjectRelease(v15, v25, v26, v27, v28, v29, v30, v31);
    sub_100005D3C(a1);
    swift_bridgeObjectRelease(v15, v32, v33, v34, v35, v36, v37, v38);
    sub_100005DE0(v20, v19);
    sub_100005DE0(v22, v21);
    v39 = v41;
    sub_100005DE0(v41, v24);
    *(_BYTE *)a2 = v50;
    *(_QWORD *)(a2 + 8) = v46;
    *(_QWORD *)(a2 + 16) = v15;
    *(_QWORD *)(a2 + 24) = v20;
    *(_QWORD *)(a2 + 32) = v19;
    *(_QWORD *)(a2 + 40) = v22;
    *(_QWORD *)(a2 + 48) = v21;
    *(_BYTE *)(a2 + 56) = v47;
    *(_QWORD *)(a2 + 64) = v39;
    *(_QWORD *)(a2 + 72) = v24;
  }
}

unint64_t sub_100138314()
{
  unint64_t result;

  result = qword_1001B3F98;
  if (!qword_1001B3F98)
  {
    result = swift_getWitnessTable(&unk_100163714, &type metadata for InternalTransactionData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B3F98);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for InternalTransactionData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1001383A4 + 4 * byte_1001635BB[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1001383D8 + 4 * byte_1001635B6[v4]))();
}

uint64_t sub_1001383D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001383E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1001383E8);
  return result;
}

uint64_t sub_1001383F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1001383FCLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_100138400(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100138408(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InternalTransactionData.CodingKeys()
{
  return &type metadata for InternalTransactionData.CodingKeys;
}

unint64_t sub_100138428()
{
  unint64_t result;

  result = qword_1001B3FA8;
  if (!qword_1001B3FA8)
  {
    result = swift_getWitnessTable(&unk_1001636EC, &type metadata for InternalTransactionData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B3FA8);
  }
  return result;
}

unint64_t sub_100138470()
{
  unint64_t result;

  result = qword_1001B3FB0;
  if (!qword_1001B3FB0)
  {
    result = swift_getWitnessTable(&unk_10016365C, &type metadata for InternalTransactionData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B3FB0);
  }
  return result;
}

unint64_t sub_1001384B8()
{
  unint64_t result;

  result = qword_1001B3FB8;
  if (!qword_1001B3FB8)
  {
    result = swift_getWitnessTable(&unk_100163684, &type metadata for InternalTransactionData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B3FB8);
  }
  return result;
}

void static Settings.default.getter(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  NSString v15;
  id v16;
  Swift::OpaquePointer_optional v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39[2];

  v2 = type metadata accessor for BackendSetting(0);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v37 - v6;
  v8 = type metadata accessor for Settings(0);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v37 - v12;
  v14 = objc_allocWithZone((Class)NSUserDefaults);
  v15 = String._bridgeToObjectiveC()();
  v16 = objc_msgSend(v14, "initWithSuiteName:", v15);

  if (v16)
  {
    v18 = objc_msgSend(v16, "dictionaryRepresentation");

    v16 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v18, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  }
  v17.value._rawValue = v16;
  Settings.init(dictionary:)(v17);
  if (v19)
  {
    v20 = type metadata accessor for URL(0);
    v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
    v21(v7, 1, 11, v20);
    v21(v5, 1, 11, v20);
    sub_100138A10((uint64_t)v7, (uint64_t)v5, 0, 0, 2, 2u, 0.0, 1, (uint64_t)v13, 0, 1, 0, 1, 0.0, 1, 0.0, 1, 0, 0,
      2,
      2,
      2,
      2);
    if (qword_1001AD2F8 != -1)
      swift_once(&qword_1001AD2F8, sub_100138980);
    v22 = type metadata accessor for Logger(0);
    sub_100003A14(v22, (uint64_t)qword_1001B3FC0);
    sub_100070ECC((uint64_t)v13, (uint64_t)v11, type metadata accessor for Settings);
    swift_errorRetain(v19);
    v23 = swift_errorRetain(v19);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc(22, -1);
      v27 = swift_slowAlloc(64, -1);
      v37 = a1;
      v38 = v19;
      v28 = v27;
      v39[0] = v27;
      *(_DWORD *)v26 = 136315394;
      swift_errorRetain(v19);
      v29 = sub_100003A2C((uint64_t *)&unk_1001B1280);
      v30 = String.init<A>(describing:)(&v38, v29);
      v32 = v31;
      v38 = sub_1000056EC(v30, v31, v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, v39, v26 + 4, v26 + 12);
      swift_bridgeObjectRelease(v32);
      swift_errorRelease(v19);
      swift_errorRelease(v19);
      *(_WORD *)(v26 + 12) = 2080;
      v33 = Settings.description.getter();
      v35 = v34;
      v38 = sub_1000056EC(v33, v34, v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, v39, v26 + 14, v26 + 22);
      swift_bridgeObjectRelease(v35);
      sub_100070F10((uint64_t)v11, type metadata accessor for Settings);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Invalid settings: %s\nReverting to default settings: %s", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy(v28, 2, (char *)&type metadata for Any + 8);
      v36 = v28;
      a1 = v37;
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v26, -1, -1);

      swift_errorRelease(v19);
    }
    else
    {
      swift_errorRelease(v19);
      swift_errorRelease(v19);
      swift_errorRelease(v19);
      sub_100070F10((uint64_t)v11, type metadata accessor for Settings);

    }
    sub_10013A0D8((uint64_t)v13, a1);
  }
}

uint64_t type metadata accessor for Settings(uint64_t a1)
{
  uint64_t result;

  result = qword_1001B4030;
  if (!qword_1001B4030)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Settings);
  return result;
}

uint64_t sub_100138980()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_1000039D4(v0, qword_1001B3FC0);
  v1 = sub_100003A14(v0, (uint64_t)qword_1001B3FC0);
  if (qword_1001AD158 != -1)
    swift_once(&qword_1001AD158, sub_1000CC540);
  v2 = sub_100003A14(v0, (uint64_t)qword_1001B4DF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_100138A10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unsigned __int8 a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, char a11, uint64_t a12, char a13, double a14, char a15, double a16, char a17, _QWORD *a18, _QWORD *a19, char a20,char a21,char a22,char a23)
{
  int v28;
  int *v29;
  uint64_t result;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;

  v28 = a6;
  sub_100070ECC(a1, a9, type metadata accessor for BackendSetting);
  v29 = (int *)type metadata accessor for Settings(0);
  v44 = a2;
  result = sub_100070ECC(a2, a9 + v29[5], type metadata accessor for BackendSetting);
  *(_BYTE *)(a9 + v29[7]) = (v28 == 2) | a6 & 1;
  v31 = a9 + v29[6];
  *(_QWORD *)v31 = a3;
  *(_QWORD *)(v31 + 8) = a4;
  *(_BYTE *)(v31 + 16) = a5;
  v32 = 300.0;
  v33 = fmin(fmax(a14, 120.0), 300.0);
  if ((a15 & 1) == 0)
    v32 = v33;
  *(double *)(a9 + v29[11]) = v32;
  v34 = 300.0;
  v35 = fmin(fmax(a16, 120.0), 300.0);
  if ((a17 & 1) == 0)
    v34 = v35;
  *(double *)(a9 + v29[12]) = v34;
  v36 = 3600.0;
  v37 = 3600.0;
  if (a7 <= 3600.0)
    v37 = a7;
  if (a7 >= 5.0)
    v38 = v37;
  else
    v38 = 5.0;
  if ((a8 & 1) == 0)
    v36 = v38;
  *(double *)(a9 + v29[8]) = v36;
  v39 = 86400;
  if ((a11 & 1) == 0)
    v39 = a10;
  *(_QWORD *)(a9 + v29[9]) = v39;
  if ((a13 & 1) != 0)
  {
    v41 = 81900;
    goto LABEL_20;
  }
  v40 = fmin(fmax((double)a12, 12600.0), 151200.0);
  if ((~*(_QWORD *)&v40 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  if (v40 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v40 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
    return result;
  }
  v41 = (uint64_t)v40;
LABEL_20:
  v42 = a18;
  *(_QWORD *)(a9 + v29[10]) = v41;
  if (!a18)
    v42 = _swiftEmptyArrayStorage;
  *(_QWORD *)(a9 + v29[13]) = v42;
  if (a19)
    v43 = a19;
  else
    v43 = _swiftEmptyArrayStorage;
  sub_100070F10(v44, type metadata accessor for BackendSetting);
  result = sub_100070F10(a1, type metadata accessor for BackendSetting);
  *(_QWORD *)(a9 + v29[14]) = v43;
  *(_BYTE *)(a9 + v29[15]) = (a20 == 2) | a20 & 1;
  *(_BYTE *)(a9 + v29[16]) = (a21 == 2) | a21 & 1;
  *(_BYTE *)(a9 + v29[17]) = (a22 == 2) | a22 & 1;
  *(_BYTE *)(a9 + v29[18]) = (a23 == 2) | a23 & 1;
  return result;
}

uint64_t Settings.description.getter()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;
  void *object;
  Swift::String v4;
  int *v5;
  Swift::String v6;
  void *v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  Swift::String v13;
  void *v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  void *v18;
  Swift::String v19;
  Swift::String v20;
  void *v21;
  Swift::String v22;
  Swift::String v23;
  Swift::String v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  Swift::String v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  Swift::String v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  Swift::String v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  Swift::String v40;
  _QWORD v42[2];

  v42[0] = 0;
  v42[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(333);
  v1._countAndFlagsBits = 0xD000000000000014;
  v1._object = (void *)0x8000000100172AF0;
  String.append(_:)(v1);
  sub_100116B10();
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._countAndFlagsBits = 0xD000000000000018;
  v4._object = (void *)0x8000000100172B10;
  String.append(_:)(v4);
  v5 = (int *)type metadata accessor for Settings(0);
  sub_100116B10();
  v7 = v6._object;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(v7);
  v8._countAndFlagsBits = 0x6761726F7473202CLL;
  v8._object = (void *)0xEA00000000003D65;
  String.append(_:)(v8);
  v9 = v0 + v5[6];
  v10 = *(_QWORD *)v9;
  v11 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  sub_1000E4ED8(*(_QWORD *)v9, v11, v12);
  v13._countAndFlagsBits = StorageSetting.description.getter(v10, v11, v12);
  v14 = v13._object;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v14);
  sub_10000CA58(v10, v11, v12);
  v15._countAndFlagsBits = 0xD00000000000001FLL;
  v15._object = (void *)0x8000000100172B30;
  String.append(_:)(v15);
  Double.write<A>(to:)(v42, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, *(double *)(v0 + v5[8]));
  v16._countAndFlagsBits = 0xD000000000000025;
  v16._object = (void *)0x8000000100172B50;
  String.append(_:)(v16);
  v17._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v18 = v17._object;
  String.append(_:)(v17);
  swift_bridgeObjectRelease(v18);
  v19._countAndFlagsBits = 0xD00000000000001DLL;
  v19._object = (void *)0x8000000100172B80;
  String.append(_:)(v19);
  v20._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v21 = v20._object;
  String.append(_:)(v20);
  swift_bridgeObjectRelease(v21);
  v22._countAndFlagsBits = 0xD000000000000022;
  v22._object = (void *)0x8000000100172BA0;
  String.append(_:)(v22);
  Double.write<A>(to:)(v42, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, *(double *)(v0 + v5[11]));
  v23._countAndFlagsBits = 0xD00000000000001ELL;
  v23._object = (void *)0x8000000100172BD0;
  String.append(_:)(v23);
  Double.write<A>(to:)(v42, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, *(double *)(v0 + v5[12]));
  v24._countAndFlagsBits = 0xD000000000000015;
  v24._object = (void *)0x8000000100172BF0;
  String.append(_:)(v24);
  if (*(_BYTE *)(v0 + v5[15]))
    v25 = 1702195828;
  else
    v25 = 0x65736C6166;
  if (*(_BYTE *)(v0 + v5[15]))
    v26 = 0xE400000000000000;
  else
    v26 = 0xE500000000000000;
  v27 = v26;
  String.append(_:)(*(Swift::String *)&v25);
  swift_bridgeObjectRelease(v26);
  v28._countAndFlagsBits = 0xD000000000000019;
  v28._object = (void *)0x8000000100172C10;
  String.append(_:)(v28);
  if (*(_BYTE *)(v0 + v5[16]))
    v29 = 1702195828;
  else
    v29 = 0x65736C6166;
  if (*(_BYTE *)(v0 + v5[16]))
    v30 = 0xE400000000000000;
  else
    v30 = 0xE500000000000000;
  v31 = v30;
  String.append(_:)(*(Swift::String *)&v29);
  swift_bridgeObjectRelease(v30);
  v32._object = (void *)0x8000000100172C30;
  v32._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v32);
  if (*(_BYTE *)(v0 + v5[17]))
    v33 = 1702195828;
  else
    v33 = 0x65736C6166;
  if (*(_BYTE *)(v0 + v5[17]))
    v34 = 0xE400000000000000;
  else
    v34 = 0xE500000000000000;
  v35 = v34;
  String.append(_:)(*(Swift::String *)&v33);
  swift_bridgeObjectRelease(v34);
  v36._countAndFlagsBits = 0xD00000000000001CLL;
  v36._object = (void *)0x8000000100172C50;
  String.append(_:)(v36);
  if (*(_BYTE *)(v0 + v5[18]))
    v37 = 1702195828;
  else
    v37 = 0x65736C6166;
  if (*(_BYTE *)(v0 + v5[18]))
    v38 = 0xE400000000000000;
  else
    v38 = 0xE500000000000000;
  v39 = v38;
  String.append(_:)(*(Swift::String *)&v37);
  swift_bridgeObjectRelease(v38);
  v40._countAndFlagsBits = 8200236;
  v40._object = (void *)0xE300000000000000;
  String.append(_:)(v40);
  return v42[0];
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Settings.init(dictionary:)(Swift::OpaquePointer_optional dictionary)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *rawValue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  unsigned __int8 v34;
  int v35;
  int v36;
  uint64_t v37;
  char v38;
  int v39;
  double v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  char v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  int v56;
  double v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  int v62;
  double v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  int v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  _BYTE v96[12];
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  _QWORD *v102;
  _QWORD *v103;
  int v104;
  double v105;
  int v106;
  double v107;
  int v108;
  uint64_t v109;
  int v110;
  double v111;
  int v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;

  rawValue = dictionary.value._rawValue;
  v4 = v1;
  v5 = type metadata accessor for BackendSetting(0);
  v6 = __chkstk_darwin(v5);
  v8 = &v96[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __chkstk_darwin(v6);
  v11 = &v96[-v10];
  v12 = __chkstk_darwin(v9);
  v14 = &v96[-v13];
  __chkstk_darwin(v12);
  v16 = &v96[-v15];
  if (!rawValue)
  {
    v118 = 0u;
    v119 = 0u;
    sub_1001173E0((uint64_t)&v118, (uint64_t)&v96[-v15]);
    if (!v2)
    {
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v118 = 0u;
      v119 = 0u;
LABEL_31:
      sub_100007B30((uint64_t)&v114);
      goto LABEL_32;
    }
LABEL_33:
    swift_bridgeObjectRelease(rawValue);
    return;
  }
  if (rawValue[2])
  {
    swift_bridgeObjectRetain(rawValue);
    v17 = sub_10013A408(0xD000000000000017, 0x800000010016E860, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
    if ((v18 & 1) != 0)
    {
      sub_100005D5C(rawValue[7] + 32 * v17, (uint64_t)&v118);
    }
    else
    {
      v118 = 0u;
      v119 = 0u;
    }
    swift_bridgeObjectRelease(rawValue);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  sub_1001173E0((uint64_t)&v118, (uint64_t)v16);
  if (v2)
    goto LABEL_33;
  if (rawValue[2])
  {
    swift_bridgeObjectRetain(rawValue);
    v19 = sub_10013A408(0xD00000000000001ALL, 0x800000010016E880, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
    if ((v20 & 1) != 0)
    {
      sub_100005D5C(rawValue[7] + 32 * v19, (uint64_t)&v116);
    }
    else
    {
      v116 = 0u;
      v117 = 0u;
    }
    swift_bridgeObjectRelease(rawValue);
    if (*((_QWORD *)&v117 + 1))
    {
      sub_100005D2C(&v116, &v118);
      sub_1001173E0((uint64_t)&v118, (uint64_t)v14);
      goto LABEL_35;
    }
  }
  else
  {
    v116 = 0u;
    v117 = 0u;
  }
  if (!rawValue[2])
  {
    v114 = 0u;
    v115 = 0u;
LABEL_25:
    if (rawValue[2])
    {
      swift_bridgeObjectRetain(rawValue);
      v23 = sub_10013A408(0xD000000000000016, 0x8000000100172C70, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
      if ((v24 & 1) != 0)
      {
        sub_100005D5C(rawValue[7] + 32 * v23, (uint64_t)&v118);
      }
      else
      {
        v118 = 0u;
        v119 = 0u;
      }
      swift_bridgeObjectRelease(rawValue);
    }
    else
    {
      v118 = 0u;
      v119 = 0u;
    }
    goto LABEL_31;
  }
  swift_bridgeObjectRetain(rawValue);
  v21 = sub_10013A408(0xD000000000000017, 0x800000010016E860, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v22 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v21, (uint64_t)&v114);
  }
  else
  {
    v114 = 0u;
    v115 = 0u;
  }
  swift_bridgeObjectRelease(rawValue);
  if (!*((_QWORD *)&v115 + 1))
    goto LABEL_25;
  sub_100005D2C(&v114, &v118);
LABEL_32:
  sub_100007B30((uint64_t)&v116);
  sub_1001173E0((uint64_t)&v118, (uint64_t)v14);
  if (!rawValue)
    goto LABEL_38;
LABEL_35:
  if (!rawValue[2])
  {
LABEL_38:
    v118 = 0u;
    v119 = 0u;
    goto LABEL_41;
  }
  swift_bridgeObjectRetain(rawValue);
  v25 = sub_10013A408(0xD000000000000015, 0x80000001001652D0, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v26 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v25, (uint64_t)&v118);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  swift_bridgeObjectRelease(rawValue);
LABEL_41:
  v27 = sub_100125CB8((uint64_t)&v118);
  v112 = v28;
  v113 = v29;
  v120 = v27;
  sub_100070ECC((uint64_t)v16, (uint64_t)v11, type metadata accessor for BackendSetting);
  sub_100070ECC((uint64_t)v14, (uint64_t)v8, type metadata accessor for BackendSetting);
  if (!rawValue)
  {
    v118 = 0u;
    v119 = 0u;
    sub_100007B30((uint64_t)&v118);
    v118 = 0u;
    v119 = 0u;
    sub_100007B30((uint64_t)&v118);
    v118 = 0u;
    v119 = 0u;
    sub_100007B30((uint64_t)&v118);
    v118 = 0u;
    v119 = 0u;
    sub_100007B30((uint64_t)&v118);
    v118 = 0u;
    v119 = 0u;
    sub_100007B30((uint64_t)&v118);
    v118 = 0u;
    v119 = 0u;
    sub_100007B30((uint64_t)&v118);
    v118 = 0u;
    v119 = 0u;
    sub_100007B30((uint64_t)&v118);
    v118 = 0u;
    v119 = 0u;
    sub_100007B30((uint64_t)&v118);
    v118 = 0u;
    v119 = 0u;
    sub_100007B30((uint64_t)&v118);
    v118 = 0u;
    v119 = 0u;
    sub_100007B30((uint64_t)&v118);
    v118 = 0u;
    v119 = 0u;
    sub_100007B30((uint64_t)&v118);
    v103 = 0;
    v107 = 0.0;
    v32 = 0;
    v111 = 0.0;
    v109 = 0;
    v105 = 0.0;
    v102 = 0;
    v118 = 0u;
    v119 = 0u;
    v106 = 1;
    v99 = 2;
    v101 = 2;
    v33 = 1;
    v34 = 2;
    v110 = 1;
    v108 = 1;
    v104 = 1;
    v100 = 2;
    goto LABEL_167;
  }
  if (!rawValue[2])
  {
    v118 = 0u;
    v119 = 0u;
LABEL_51:
    sub_100007B30((uint64_t)&v118);
    v36 = 2;
    goto LABEL_52;
  }
  swift_bridgeObjectRetain(rawValue);
  v30 = sub_10013A408(0xD00000000000001ALL, 0x800000010016E6A0, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v31 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v30, (uint64_t)&v118);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  swift_bridgeObjectRelease(rawValue);
  if (!*((_QWORD *)&v119 + 1))
    goto LABEL_51;
  v35 = swift_dynamicCast(&v116, &v118, (char *)&type metadata for Any + 8, &type metadata for Bool, 6);
  v36 = v116;
  if (!v35)
    v36 = 2;
LABEL_52:
  v98 = v36;
  if (!rawValue[2])
  {
    v118 = 0u;
    v119 = 0u;
LABEL_62:
    sub_100007B30((uint64_t)&v118);
    v40 = 0.0;
    v41 = 1;
    goto LABEL_63;
  }
  swift_bridgeObjectRetain(rawValue);
  v37 = sub_10013A408(0xD000000000000020, 0x800000010016E6C0, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v38 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v37, (uint64_t)&v118);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  swift_bridgeObjectRelease(rawValue);
  if (!*((_QWORD *)&v119 + 1))
    goto LABEL_62;
  v39 = swift_dynamicCast(&v116, &v118, (char *)&type metadata for Any + 8, &type metadata for Double, 6);
  if (v39)
    v40 = *(double *)&v116;
  else
    v40 = 0.0;
  v41 = v39 ^ 1;
LABEL_63:
  v42 = rawValue[2];
  v111 = v40;
  v110 = v41;
  if (!v42)
  {
    v118 = 0u;
    v119 = 0u;
LABEL_73:
    sub_100007B30((uint64_t)&v118);
    v46 = 0;
    v47 = 1;
    goto LABEL_74;
  }
  swift_bridgeObjectRetain(rawValue);
  v43 = sub_10013A408(0xD00000000000001BLL, 0x800000010016E6F0, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v44 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v43, (uint64_t)&v118);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  swift_bridgeObjectRelease(rawValue);
  if (!*((_QWORD *)&v119 + 1))
    goto LABEL_73;
  v45 = swift_dynamicCast(&v116, &v118, (char *)&type metadata for Any + 8, &type metadata for Int, 6);
  if (v45)
    v46 = v116;
  else
    v46 = 0;
  v47 = v45 ^ 1;
LABEL_74:
  v97 = v47;
  if (!rawValue[2])
  {
    v118 = 0u;
    v119 = 0u;
LABEL_84:
    sub_100007B30((uint64_t)&v118);
    v51 = 0;
    v52 = 1;
    goto LABEL_85;
  }
  swift_bridgeObjectRetain(rawValue);
  v48 = sub_10013A408(0xD000000000000018, 0x800000010016E710, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v49 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v48, (uint64_t)&v118);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  swift_bridgeObjectRelease(rawValue);
  if (!*((_QWORD *)&v119 + 1))
    goto LABEL_84;
  v50 = swift_dynamicCast(&v116, &v118, (char *)&type metadata for Any + 8, &type metadata for Int, 6);
  if (v50)
    v51 = v116;
  else
    v51 = 0;
  v52 = v50 ^ 1;
LABEL_85:
  v53 = rawValue[2];
  v109 = v51;
  v108 = v52;
  if (!v53)
  {
    v118 = 0u;
    v119 = 0u;
LABEL_95:
    sub_100007B30((uint64_t)&v118);
    v57 = 0.0;
    v58 = 1;
    goto LABEL_96;
  }
  swift_bridgeObjectRetain(rawValue);
  v54 = sub_10013A408(0xD000000000000029, 0x800000010016E730, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v55 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v54, (uint64_t)&v118);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  swift_bridgeObjectRelease(rawValue);
  if (!*((_QWORD *)&v119 + 1))
    goto LABEL_95;
  v56 = swift_dynamicCast(&v116, &v118, (char *)&type metadata for Any + 8, &type metadata for Double, 6);
  if (v56)
    v57 = *(double *)&v116;
  else
    v57 = 0.0;
  v58 = v56 ^ 1;
LABEL_96:
  v59 = rawValue[2];
  v107 = v57;
  v106 = v58;
  if (!v59)
  {
    v118 = 0u;
    v119 = 0u;
LABEL_106:
    sub_100007B30((uint64_t)&v118);
    v63 = 0.0;
    v64 = 1;
    goto LABEL_107;
  }
  swift_bridgeObjectRetain(rawValue);
  v60 = sub_10013A408(0xD000000000000025, 0x800000010016E760, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v61 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v60, (uint64_t)&v118);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  swift_bridgeObjectRelease(rawValue);
  if (!*((_QWORD *)&v119 + 1))
    goto LABEL_106;
  v62 = swift_dynamicCast(&v116, &v118, (char *)&type metadata for Any + 8, &type metadata for Double, 6);
  if (v62)
    v63 = *(double *)&v116;
  else
    v63 = 0.0;
  v64 = v62 ^ 1;
LABEL_107:
  v65 = rawValue[2];
  v105 = v63;
  v104 = v64;
  if (!v65)
  {
    v118 = 0u;
    v119 = 0u;
LABEL_116:
    sub_100007B30((uint64_t)&v118);
    v69 = 0;
    goto LABEL_117;
  }
  swift_bridgeObjectRetain(rawValue);
  v66 = sub_10013A408(0xD000000000000027, 0x800000010016E790, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v67 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v66, (uint64_t)&v118);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  swift_bridgeObjectRelease(rawValue);
  if (!*((_QWORD *)&v119 + 1))
    goto LABEL_116;
  v68 = sub_100003A2C((uint64_t *)&unk_1001AE460);
  if (swift_dynamicCast(&v116, &v118, (char *)&type metadata for Any + 8, v68, 6))
    v69 = (_QWORD *)v116;
  else
    v69 = 0;
LABEL_117:
  v70 = rawValue[2];
  v103 = v69;
  if (!v70)
  {
    v118 = 0u;
    v119 = 0u;
LABEL_126:
    sub_100007B30((uint64_t)&v118);
    v74 = 0;
    goto LABEL_127;
  }
  swift_bridgeObjectRetain(rawValue);
  v71 = sub_10013A408(0xD000000000000025, 0x800000010016E7C0, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v72 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v71, (uint64_t)&v118);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  swift_bridgeObjectRelease(rawValue);
  if (!*((_QWORD *)&v119 + 1))
    goto LABEL_126;
  v73 = sub_100003A2C((uint64_t *)&unk_1001AE460);
  if (swift_dynamicCast(&v116, &v118, (char *)&type metadata for Any + 8, v73, 6))
    v74 = (_QWORD *)v116;
  else
    v74 = 0;
LABEL_127:
  v75 = rawValue[2];
  v102 = v74;
  if (!v75)
  {
    v118 = 0u;
    v119 = 0u;
LABEL_136:
    sub_100007B30((uint64_t)&v118);
    v78 = 2;
    goto LABEL_137;
  }
  swift_bridgeObjectRetain(rawValue);
  v76 = sub_10013A408(0xD00000000000001ALL, 0x800000010016E7F0, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v77 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v76, (uint64_t)&v118);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  swift_bridgeObjectRelease(rawValue);
  if (!*((_QWORD *)&v119 + 1))
    goto LABEL_136;
  if (swift_dynamicCast(&v116, &v118, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
    v78 = v116;
  else
    v78 = 2;
LABEL_137:
  v79 = rawValue[2];
  v101 = v78;
  if (!v79)
  {
    v118 = 0u;
    v119 = 0u;
LABEL_146:
    sub_100007B30((uint64_t)&v118);
    v82 = 2;
    goto LABEL_147;
  }
  swift_bridgeObjectRetain(rawValue);
  v80 = sub_10013A408(0xD000000000000013, 0x800000010016E810, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v81 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v80, (uint64_t)&v118);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  swift_bridgeObjectRelease(rawValue);
  if (!*((_QWORD *)&v119 + 1))
    goto LABEL_146;
  if (swift_dynamicCast(&v116, &v118, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
    v82 = v116;
  else
    v82 = 2;
LABEL_147:
  v83 = rawValue[2];
  v100 = v82;
  if (!v83)
  {
    v86 = v46;
    v118 = 0u;
    v119 = 0u;
LABEL_156:
    sub_100007B30((uint64_t)&v118);
    v87 = 2;
    goto LABEL_157;
  }
  swift_bridgeObjectRetain(rawValue);
  v84 = sub_10013A408(0x2E726F74696E6F4DLL, 0xEF64656C62616E45, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
  if ((v85 & 1) != 0)
  {
    sub_100005D5C(rawValue[7] + 32 * v84, (uint64_t)&v118);
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
  }
  v86 = v46;
  swift_bridgeObjectRelease(rawValue);
  if (!*((_QWORD *)&v119 + 1))
    goto LABEL_156;
  if (swift_dynamicCast(&v116, &v118, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
    v87 = v116;
  else
    v87 = 2;
LABEL_157:
  v88 = rawValue[2];
  v99 = v87;
  if (v88)
  {
    v89 = sub_10013A408(0xD00000000000002ELL, 0x800000010016E830, (void (*)(_QWORD *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000AEEC);
    v32 = v86;
    v33 = v97;
    if ((v90 & 1) != 0)
    {
      sub_100005D5C(rawValue[7] + 32 * v89, (uint64_t)&v118);
    }
    else
    {
      v118 = 0u;
      v119 = 0u;
    }
  }
  else
  {
    v118 = 0u;
    v119 = 0u;
    v32 = v86;
    v33 = v97;
  }
  swift_bridgeObjectRelease(rawValue);
  if (*((_QWORD *)&v119 + 1))
  {
    v91 = swift_dynamicCast(&v116, &v118, (char *)&type metadata for Any + 8, &type metadata for Bool, 6);
    v92 = v116;
    if (!v91)
      v92 = 2;
    v93 = v120;
    v94 = v113;
    v95 = v112;
    v34 = v98;
    goto LABEL_168;
  }
  v34 = v98;
LABEL_167:
  sub_100007B30((uint64_t)&v118);
  v92 = 2;
  v93 = v120;
  v94 = v113;
  v95 = v112;
LABEL_168:
  sub_100138A10((uint64_t)v11, (uint64_t)v8, v93, v94, v95, v34, v111, v110, v4, v32, v33, v109, v108, v107, v106, v105, v104, v103, v102,
    v101,
    v100,
    v99,
    v92);
  sub_100070F10((uint64_t)v14, type metadata accessor for BackendSetting);
  sub_100070F10((uint64_t)v16, type metadata accessor for BackendSetting);
}

uint64_t sub_10013A0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Settings(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10013A124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_10013A184(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x10013A368);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

unint64_t sub_10013A390(Swift::UInt a1)
{
  Swift::Int v2;
  _QWORD v4[9];

  Hasher.init(_seed:)(v4);
  Hasher._combine(_:)(a1);
  v2 = Hasher._finalize()();
  return sub_10013A768(a1, v2);
}

uint64_t sub_10013A3F4(uint64_t a1, uint64_t a2)
{
  return sub_10013A408(a1, a2, (void (*)(_QWORD *, uint64_t, uint64_t))&Data.hash(into:), sub_10013A804);
}

uint64_t sub_10013A408(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, Swift::Int))
{
  Swift::Int v7;
  _QWORD v10[9];

  Hasher.init(_seed:)(v10);
  a3(v10, a1, a2);
  v7 = Hasher._finalize()();
  return a4(a1, a2, v7);
}

void sub_10013A480(char a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2);
  __asm { BR              X10 }
}

uint64_t sub_10013A4D0()
{
  uint64_t v0;
  SEL v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  Swift::Int v8;
  uint64_t v10;

  String.hash(into:)(&v10, 0x746942746E657645, 0xEB0000000070616DLL);
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)0xEB0000000070616DLL, v1, v2, v3, v4, v5, v6, v7);
  v8 = Hasher._finalize()();
  return sub_10013B194(v0, v8);
}

uint64_t sub_10013A590(uint64_t a1)
{
  return sub_10013A5CC(a1, (uint64_t (*)(uint64_t))sub_10003C138, sub_10013B3F0);
}

uint64_t sub_10013A5A4(uint64_t a1)
{
  return sub_10013A5CC(a1, (uint64_t (*)(uint64_t))sub_100024A78, sub_10013BA44);
}

uint64_t sub_10013A5B8(uint64_t a1)
{
  return sub_10013A5CC(a1, (uint64_t (*)(uint64_t))sub_10004BAE8, sub_10013BFCC);
}

uint64_t sub_10013A5CC(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(uint64_t, Swift::Int))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::Int v8;
  _QWORD v11[9];

  Hasher.init(_seed:)(v11);
  v5 = a2(a1);
  v7 = v6;
  String.hash(into:)(v11, v5, v6);
  swift_bridgeObjectRelease(v7);
  v8 = Hasher._finalize()();
  return a3(a1, v8);
}

unint64_t sub_10013A64C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:_:)(*(_QWORD *)(v1 + 40), a1);
  return sub_10013A768(a1, v3);
}

unint64_t sub_10013A680(uint64_t a1)
{
  uint64_t v2;
  _TtC14softposreaderd12RemoteReader *v3;
  _TtC14softposreaderd12RemoteReader *v4;
  Swift::Int v5;
  SEL v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[9];

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  Hasher.init(_seed:)(v14);
  String.hash(into:)(v14, v2, v4);
  v5 = Hasher._finalize()();
  swift_bridgeObjectRelease(v4, v6, v7, v8, v9, v10, v11, v12);
  return sub_10013C5A0(a1, v5);
}

unint64_t sub_10013A70C(char a1)
{
  char v2;
  Swift::Int v3;
  _QWORD v5[9];

  v2 = a1 & 1;
  Hasher.init(_seed:)(v5);
  Hasher._combine(_:)(a1 & 1);
  v3 = Hasher._finalize()();
  return sub_10013C714(v2, v3);
}

unint64_t sub_10013A768(uint64_t a1, uint64_t a2)
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

uint64_t sub_10013A804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = -1 << *(_BYTE *)(v3 + 32);
  v5 = a3 & ~v4;
  if (((*(_QWORD *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    __asm { BR              X8 }
  return a3 & ~v4;
}

uint64_t sub_10013B194(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_10013B3F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_10013BA44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_10013BFCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t sub_10013C5A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      v15 = ~v4;
      v5 = (v5 + 1) & v15;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
          v9 = v17;
          v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19)
            break;
          v21 = v19;
          v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            v5 = (v5 + 1) & v15;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_10013C714(char a1, uint64_t a2)
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
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (((((a1 & 1) == 0) ^ *(_BYTE *)(v7 + result)) & 1) != 0)
          break;
      }
    }
  }
  return result;
}

uint64_t _s9SPREngine8SettingsV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v4;
  int *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char v16;
  char v17;

  sub_1001178E4(a1, a2);
  if ((v4 & 1) == 0)
    goto LABEL_46;
  v5 = (int *)type metadata accessor for Settings(0);
  sub_1001178E4(a1 + v5[5], a2 + v5[5]);
  if ((v6 & 1) == 0)
    goto LABEL_46;
  v7 = v5[6];
  v8 = *(_QWORD *)(a1 + v7);
  v9 = *(_QWORD *)(a1 + v7 + 8);
  v10 = *(unsigned __int8 *)(a1 + v7 + 16);
  v11 = (uint64_t *)(a2 + v7);
  v12 = *v11;
  v13 = v11[1];
  v14 = *((unsigned __int8 *)v11 + 16);
  if (v10)
  {
    if (v10 != 1)
    {
      if (v8 | v9)
      {
        if (v8 ^ 1 | v9)
        {
          if (v14 != 2)
            goto LABEL_46;
          if (v12 != 2 || v13 != 0)
            goto LABEL_46;
        }
        else
        {
          if (v14 != 2)
            goto LABEL_46;
          if (v12 != 1 || v13 != 0)
            goto LABEL_46;
        }
      }
      else if (v14 != 2 || (v13 | v12) != 0)
      {
        goto LABEL_46;
      }
LABEL_35:
      if (*(unsigned __int8 *)(a1 + v5[7]) == *(unsigned __int8 *)(a2 + v5[7])
        && *(double *)(a1 + v5[8]) == *(double *)(a2 + v5[8])
        && *(_QWORD *)(a1 + v5[9]) == *(_QWORD *)(a2 + v5[9])
        && *(_QWORD *)(a1 + v5[10]) == *(_QWORD *)(a2 + v5[10])
        && *(double *)(a1 + v5[11]) == *(double *)(a2 + v5[11])
        && *(double *)(a1 + v5[12]) == *(double *)(a2 + v5[12])
        && (sub_100127830(*(_QWORD **)(a1 + v5[13]), *(_QWORD **)(a2 + v5[13])) & 1) != 0
        && (sub_100127830(*(_QWORD **)(a1 + v5[14]), *(_QWORD **)(a2 + v5[14])) & 1) != 0
        && *(unsigned __int8 *)(a1 + v5[15]) == *(unsigned __int8 *)(a2 + v5[15])
        && *(unsigned __int8 *)(a1 + v5[16]) == *(unsigned __int8 *)(a2 + v5[16])
        && *(unsigned __int8 *)(a1 + v5[17]) == *(unsigned __int8 *)(a2 + v5[17]))
      {
        v17 = *(_BYTE *)(a1 + v5[18]) ^ *(_BYTE *)(a2 + v5[18]) ^ 1;
        return v17 & 1;
      }
      goto LABEL_46;
    }
    if (v14 != 1)
      goto LABEL_46;
  }
  else if (v14)
  {
LABEL_46:
    v17 = 0;
    return v17 & 1;
  }
  if (v8 == v12 && v9 == v13)
    goto LABEL_35;
  v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v8, v9, v12, v13, 0);
  v17 = 0;
  if ((v16 & 1) != 0)
    goto LABEL_35;
  return v17 & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for Settings(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for URL(0);
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 11, v7))
    {
      v10 = type metadata accessor for BackendSetting(0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 11, v7);
    }
    v12 = a3[5];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    if (v9((uint64_t *)((char *)a2 + v12), 11, v7))
    {
      v15 = type metadata accessor for BackendSetting(0);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v14, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v13, 0, 11, v7);
    }
    v16 = a3[6];
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    v19 = *(_QWORD *)v18;
    v20 = *((_QWORD *)v18 + 1);
    v21 = v18[16];
    sub_1000E4ED8(*(_QWORD *)v18, v20, v21);
    *(_QWORD *)v17 = v19;
    *((_QWORD *)v17 + 1) = v20;
    v17[16] = v21;
    v22 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v22) = *(uint64_t *)((char *)a2 + v22);
    v23 = a3[10];
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)a1 + v23) = *(uint64_t *)((char *)a2 + v23);
    v24 = a3[12];
    *(uint64_t *)((char *)a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    *(uint64_t *)((char *)a1 + v24) = *(uint64_t *)((char *)a2 + v24);
    v25 = a3[14];
    *(uint64_t *)((char *)a1 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
    *(uint64_t *)((char *)a1 + v25) = *(uint64_t *)((char *)a2 + v25);
    v26 = a3[16];
    *((_BYTE *)a1 + a3[15]) = *((_BYTE *)a2 + a3[15]);
    *((_BYTE *)a1 + v26) = *((_BYTE *)a2 + v26);
    v27 = a3[18];
    *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
    *((_BYTE *)a1 + v27) = *((_BYTE *)a2 + v27);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

void destroy for Settings(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  SEL v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  SEL v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(a1, 11, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v7 = a1 + a2[5];
  if (!v6(v7, 11, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  sub_10000CA58(*(_QWORD *)(a1 + a2[6]), *(_QWORD *)(a1 + a2[6] + 8), *(_BYTE *)(a1 + a2[6] + 16));
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(a1 + a2[13]), v8, v9, v10, v11, v12, v13, v14);
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(a1 + a2[14]), v15, v16, v17, v18, v19, v20, v21);
}

char *initializeWithCopy for Settings(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 11, v6))
  {
    v9 = type metadata accessor for BackendSetting(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 11, v6);
  }
  v10 = a3[5];
  v11 = &a1[v10];
  v12 = &a2[v10];
  if (v8(&a2[v10], 11, v6))
  {
    v13 = type metadata accessor for BackendSetting(0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 11, v6);
  }
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = *(_QWORD *)v16;
  v18 = *((_QWORD *)v16 + 1);
  v19 = v16[16];
  sub_1000E4ED8(*(_QWORD *)v16, v18, v19);
  *(_QWORD *)v15 = v17;
  *((_QWORD *)v15 + 1) = v18;
  v15[16] = v19;
  v20 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[v20] = *(_QWORD *)&a2[v20];
  v21 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[v21] = *(_QWORD *)&a2[v21];
  v22 = a3[12];
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  *(_QWORD *)&a1[v22] = *(_QWORD *)&a2[v22];
  v23 = a3[14];
  *(_QWORD *)&a1[a3[13]] = *(_QWORD *)&a2[a3[13]];
  *(_QWORD *)&a1[v23] = *(_QWORD *)&a2[v23];
  v24 = a3[16];
  a1[a3[15]] = a2[a3[15]];
  a1[v24] = a2[v24];
  v25 = a3[18];
  a1[a3[17]] = a2[a3[17]];
  a1[v25] = a2[v25];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for Settings(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  uint64_t v27;
  _TtC14softposreaderd12RemoteReader *v28;
  SEL v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  _TtC14softposreaderd12RemoteReader *v37;
  SEL v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 11, v6);
  v10 = v8(a2, 11, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 11, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = type metadata accessor for BackendSetting(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = v8(&a1[v12], 11, v6);
  v16 = v8(v14, 11, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v13, v14, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    v17 = type metadata accessor for BackendSetting(0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v13, 0, 11, v6);
LABEL_13:
  v18 = a3[6];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = *(_QWORD *)v20;
  v22 = *((_QWORD *)v20 + 1);
  v23 = v20[16];
  sub_1000E4ED8(*(_QWORD *)v20, v22, v23);
  v24 = *(_QWORD *)v19;
  v25 = *((_QWORD *)v19 + 1);
  *(_QWORD *)v19 = v21;
  *((_QWORD *)v19 + 1) = v22;
  v26 = v19[16];
  v19[16] = v23;
  sub_10000CA58(v24, v25, v26);
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  *(_QWORD *)&a1[a3[12]] = *(_QWORD *)&a2[a3[12]];
  v27 = a3[13];
  v28 = *(_TtC14softposreaderd12RemoteReader **)&a1[v27];
  *(_QWORD *)&a1[v27] = *(_QWORD *)&a2[v27];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v28, v29, v30, v31, v32, v33, v34, v35);
  v36 = a3[14];
  v37 = *(_TtC14softposreaderd12RemoteReader **)&a1[v36];
  *(_QWORD *)&a1[v36] = *(_QWORD *)&a2[v36];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v37, v38, v39, v40, v41, v42, v43, v44);
  a1[a3[15]] = a2[a3[15]];
  a1[a3[16]] = a2[a3[16]];
  a1[a3[17]] = a2[a3[17]];
  a1[a3[18]] = a2[a3[18]];
  return a1;
}

char *initializeWithTake for Settings(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 11, v6))
  {
    v9 = type metadata accessor for BackendSetting(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 11, v6);
  }
  v10 = a3[5];
  v11 = &a1[v10];
  v12 = &a2[v10];
  if (v8(&a2[v10], 11, v6))
  {
    v13 = type metadata accessor for BackendSetting(0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 11, v6);
  }
  v14 = a3[6];
  v15 = a3[7];
  v16 = &a1[v14];
  v17 = &a2[v14];
  *(_OWORD *)v16 = *(_OWORD *)v17;
  v16[16] = v17[16];
  a1[v15] = a2[v15];
  v18 = a3[9];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  *(_QWORD *)&a1[v18] = *(_QWORD *)&a2[v18];
  v19 = a3[11];
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  *(_QWORD *)&a1[v19] = *(_QWORD *)&a2[v19];
  v20 = a3[13];
  *(_QWORD *)&a1[a3[12]] = *(_QWORD *)&a2[a3[12]];
  *(_QWORD *)&a1[v20] = *(_QWORD *)&a2[v20];
  v21 = a3[15];
  *(_QWORD *)&a1[a3[14]] = *(_QWORD *)&a2[a3[14]];
  a1[v21] = a2[v21];
  v22 = a3[17];
  a1[a3[16]] = a2[a3[16]];
  a1[v22] = a2[v22];
  a1[a3[18]] = a2[a3[18]];
  return a1;
}

char *assignWithTake for Settings(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _TtC14softposreaderd12RemoteReader *v29;
  SEL v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  _TtC14softposreaderd12RemoteReader *v38;
  SEL v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 11, v6);
  v10 = v8(a2, 11, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 11, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = type metadata accessor for BackendSetting(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = v8(&a1[v12], 11, v6);
  v16 = v8(v14, 11, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v13, v14, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    v17 = type metadata accessor for BackendSetting(0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v14, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v13, 0, 11, v6);
LABEL_13:
  v18 = a3[6];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = v20[16];
  v22 = *(_QWORD *)v19;
  v23 = *((_QWORD *)v19 + 1);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  v24 = v19[16];
  v19[16] = v21;
  sub_10000CA58(v22, v23, v24);
  v25 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[v25] = *(_QWORD *)&a2[v25];
  v26 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[v26] = *(_QWORD *)&a2[v26];
  v27 = a3[12];
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  *(_QWORD *)&a1[v27] = *(_QWORD *)&a2[v27];
  v28 = a3[13];
  v29 = *(_TtC14softposreaderd12RemoteReader **)&a1[v28];
  *(_QWORD *)&a1[v28] = *(_QWORD *)&a2[v28];
  swift_bridgeObjectRelease(v29, v30, v31, v32, v33, v34, v35, v36);
  v37 = a3[14];
  v38 = *(_TtC14softposreaderd12RemoteReader **)&a1[v37];
  *(_QWORD *)&a1[v37] = *(_QWORD *)&a2[v37];
  swift_bridgeObjectRelease(v38, v39, v40, v41, v42, v43, v44, v45);
  v46 = a3[16];
  a1[a3[15]] = a2[a3[15]];
  a1[v46] = a2[v46];
  v47 = a3[18];
  a1[a3[17]] = a2[a3[17]];
  a1[v47] = a2[v47];
  return a1;
}

uint64_t getEnumTagSinglePayload for Settings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10013D510);
}

uint64_t sub_10013D510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for BackendSetting(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 52));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for Settings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10013D598);
}

uint64_t sub_10013D598(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for BackendSetting(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
  return result;
}

uint64_t sub_10013D610(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[15];

  result = type metadata accessor for BackendSetting(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = v4[0];
    v4[2] = &unk_100163870;
    v4[3] = &unk_100163888;
    v4[4] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[5] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[6] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[7] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[8] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[9] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[10] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[11] = &unk_100163888;
    v4[12] = &unk_100163888;
    v4[13] = &unk_100163888;
    v4[14] = &unk_100163888;
    swift_initStructMetadata(a1, 256, 15, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t *GlobalState.shared.unsafeMutableAddressor()
{
  if (qword_1001AD308 != -1)
    swift_once(&qword_1001AD308, sub_10013E994);
  return &static GlobalState.shared;
}

id GlobalState.isPANPresent.setter(char a1)
{
  uint64_t v1;
  id result;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(*(id *)(v1 + 72), "lock");
  v4 = *(_QWORD *)(v1 + 96);
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 96) = v6;
    while (*(uint64_t *)(v1 + 88) > 0 || *(_BYTE *)(v1 + 80) == 1)
      result = objc_msgSend(*(id *)(v1 + 72), "wait");
    v7 = *(_QWORD *)(v1 + 96);
    v5 = __OFSUB__(v7, 1);
    v8 = v7 - 1;
    if (!v5)
    {
      *(_QWORD *)(v1 + 96) = v8;
      *(_BYTE *)(v1 + 80) = 1;
      objc_msgSend(*(id *)(v1 + 72), "unlock");
      *(_BYTE *)(v1 + 33) = a1 & 1;
      sub_10013E340();
      objc_msgSend(*(id *)(v1 + 72), "lock");
      *(_BYTE *)(v1 + 80) = 0;
      objc_msgSend(*(id *)(v1 + 72), "broadcast");
      return objc_msgSend(*(id *)(v1 + 72), "unlock");
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10013D7D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_1000039D4(v0, qword_1001B40A0);
  v1 = sub_100003A14(v0, (uint64_t)qword_1001B40A0);
  if (qword_1001AD188 != -1)
    swift_once(&qword_1001AD188, sub_1000CC9FC);
  v2 = sub_100003A14(v0, (uint64_t)static SPRLogger.xpcServer);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_10013D860(double a1)
{
  Swift::String v2;
  Swift::String v3;
  void *object;
  Swift::String v5;
  Swift::String v6;
  _QWORD v8[2];

  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(52);
  v2._countAndFlagsBits = 0xD00000000000001CLL;
  v2._object = (void *)0x8000000100172D70;
  String.append(_:)(v2);
  v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt32, &protocol witness table for UInt32);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  v5._object = (void *)0x8000000100172D90;
  v5._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v5);
  Double.write<A>(to:)(v8, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, a1);
  v6._countAndFlagsBits = 41;
  v6._object = (void *)0xE100000000000000;
  String.append(_:)(v6);
  return v8[0];
}

uint64_t sub_10013D950(_QWORD *a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;
  char v16;
  char v17;

  v7 = sub_100003A2C(&qword_1001B41D8);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1[3];
  v12 = a1[4];
  sub_100005EF8(a1, v11);
  v13 = sub_10013FA9C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for SPRTimestamp.CodingKeys, &type metadata for SPRTimestamp.CodingKeys, v13, v11, v12);
  v17 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, &v17, v7);
  if (!v3)
  {
    v16 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(&v16, v7, a3);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_10013DA6C()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000014;
  else
    return 0x7465736552637472;
}

uint64_t sub_10013DAB8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10013F838(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10013DADC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10013FA9C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10013DB04(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10013FA9C();
  return CodingKey.debugDescription.getter(a1, v2);
}

BOOL sub_10013DB2C(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2 && *(double *)(a1 + 8) == *(double *)(a2 + 8);
}

BOOL sub_10013DB58(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 < *(_DWORD *)a2)
    return 1;
  return *(double *)(a1 + 8) < *(double *)(a2 + 8) && *(_DWORD *)a2 >= *(_DWORD *)a1;
}

BOOL sub_10013DB88(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 < *(_DWORD *)a1)
    return 0;
  return *(double *)(a2 + 8) >= *(double *)(a1 + 8) || *(_DWORD *)a1 < *(_DWORD *)a2;
}

BOOL sub_10013DBB8(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 < *(_DWORD *)a2)
    return 0;
  return *(double *)(a1 + 8) >= *(double *)(a2 + 8) || *(_DWORD *)a2 < *(_DWORD *)a1;
}

BOOL sub_10013DBE8(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 < *(_DWORD *)a1)
    return 1;
  return *(double *)(a2 + 8) < *(double *)(a1 + 8) && *(_DWORD *)a1 >= *(_DWORD *)a2;
}

void sub_10013DC18(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v4;
  double v5;

  v5 = sub_10013F948(a1);
  if (!v2)
  {
    *(_DWORD *)a2 = v4;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t sub_10013DC44(_QWORD *a1)
{
  double *v1;

  return sub_10013D950(a1, *(unsigned int *)v1, v1[1]);
}

uint64_t sub_10013DC60()
{
  uint64_t v0;

  return sub_10013D860(*(double *)(v0 + 8));
}

uint64_t sub_10013DC6C()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  Swift::String v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  Swift::String v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  Swift::String v19;
  void *v20;
  unint64_t v21;
  void *v22;
  Swift::String v23;
  uint64_t v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  _BYTE v29[8];
  _BYTE v30[15];
  char v31;
  _BYTE v32[24];
  uint64_t v33;
  double v34;
  char v35;
  char v36;
  uint64_t v37;
  char v38;

  v1 = 7104878;
  v33 = 0;
  v34 = -2.68156159e154;
  _StringGuts.grow(_:)(116);
  v27 = 0;
  v28 = 0xE000000000000000;
  v2._countAndFlagsBits = 0xD000000000000038;
  v2._object = (void *)0x8000000100172DB0;
  String.append(_:)(v2);
  sub_100024374(v0, (uint64_t)v32, &qword_1001B4190);
  sub_100024374((uint64_t)v32, (uint64_t)&v33, &qword_1001B4190);
  v3 = 0xE300000000000000;
  v4 = 7104878;
  v5 = 0xE300000000000000;
  if ((v35 & 1) == 0)
  {
    v4 = sub_10013D860(v34);
    v5 = v6;
  }
  v7 = v5;
  String.append(_:)(*(Swift::String *)&v4);
  swift_bridgeObjectRelease(v5);
  v8._object = (void *)0x8000000100172DF0;
  v8._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v8);
  sub_100024374(v0 + 17, (uint64_t)&v31, &qword_1001B4198);
  sub_100024374((uint64_t)&v31, (uint64_t)&v36, &qword_1001B4198);
  v9 = 1702195828;
  if ((v36 & 1) == 0)
    v9 = 0x65736C6166;
  v10 = 0xE400000000000000;
  if ((v36 & 1) == 0)
    v10 = 0xE500000000000000;
  if (v36 == 2)
    v11 = 7104878;
  else
    v11 = v9;
  if (v36 == 2)
    v12 = 0xE300000000000000;
  else
    v12 = v10;
  v13 = v12;
  String.append(_:)(*(Swift::String *)&v11);
  swift_bridgeObjectRelease(v12);
  v14._countAndFlagsBits = 0xD000000000000013;
  v14._object = (void *)0x8000000100172E10;
  String.append(_:)(v14);
  sub_100024374(v0 + 24, (uint64_t)v30, &qword_1001B41A0);
  sub_100024374((uint64_t)v30, (uint64_t)&v37, &qword_1001B41A0);
  v15 = 7104878;
  if ((v38 & 1) == 0)
  {
    v25 = v37;
    v16 = sub_10013F680();
    v15 = BinaryInteger.description.getter(&type metadata for Int, v16);
    v3 = v17;
  }
  v18 = v3;
  String.append(_:)(*(Swift::String *)&v15);
  swift_bridgeObjectRelease(v3);
  v19._countAndFlagsBits = 0xD000000000000011;
  v19._object = (void *)0x8000000100172E30;
  String.append(_:)(v19);
  sub_100024374(v0 + 36, (uint64_t)v29, &qword_1001B41A8);
  sub_100024374((uint64_t)v29, (uint64_t)&v25, &qword_1001B41A8);
  if ((v25 & 0x100000000) != 0)
  {
    v20 = (void *)0xE300000000000000;
  }
  else
  {
    v26 = v25;
    v21 = sub_10013F63C();
    v1 = BinaryInteger.description.getter(&type metadata for UInt32, v21);
    v20 = v22;
  }
  v23._countAndFlagsBits = v1;
  v23._object = v20;
  String.append(_:)(v23);
  swift_bridgeObjectRelease(v20);
  return v27;
}

uint64_t sub_10013DF08(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  _BYTE v20[4];
  _BYTE v21[24];
  _BYTE v22[24];

  v3 = v1;
  v5 = sub_100003A2C(&qword_1001B41E0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v20[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 4];
  v9 = a1[3];
  v10 = a1[4];
  sub_100005EF8(a1, v9);
  v11 = sub_10013FAE0();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for GlobalState.PersistedInfo.CodingKeys, &type metadata for GlobalState.PersistedInfo.CodingKeys, v11, v9, v10);
  sub_100024374(v3, (uint64_t)v22, &qword_1001B4190);
  sub_100024374((uint64_t)v22, (uint64_t)v21, &qword_1001B4190);
  v20[0] = 0;
  v12 = sub_100129F70();
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v21, v20, v5, &type metadata for SPRTimestamp, v12);
  if (!v2)
  {
    v13 = *(unsigned __int8 *)(v3 + 17);
    v21[0] = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v13, v21, v5);
    v14 = *(_QWORD *)(v3 + 24);
    v15 = *(unsigned __int8 *)(v3 + 32);
    v21[0] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v14, v15, v21, v5);
    v16 = *(unsigned int *)(v3 + 36);
    v17 = *(_BYTE *)(v3 + 40);
    v21[0] = 3;
    v20[0] = v17;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v16 | ((unint64_t)v17 << 32), v21, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10013E0B8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10013E0E8 + 4 * byte_1001638A0[*v0]))(0x44464D7473616CLL, 0xE700000000000000);
}

uint64_t sub_10013E0E8()
{
  return 0x6572504E41507369;
}

uint64_t sub_10013E108()
{
  return 0x664F7265626D756ELL;
}

uint64_t sub_10013E12C()
{
  return 0x7465736552637472;
}

uint64_t sub_10013E150@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10013FB24(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10013E174(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10013FAE0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10013E19C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10013FAE0();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10013E1C4@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];

  sub_10013FD3C(a1, (uint64_t)&v6);
  if (!v2)
  {
    v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t sub_10013E204(_QWORD *a1)
{
  return sub_10013DF08(a1);
}

uint64_t sub_10013E23C()
{
  return sub_10013DC6C();
}

id GlobalState.isPANPresent.getter()
{
  uint64_t v0;
  id result;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(v0 + 72), "lock");
  while (*(uint64_t *)(v0 + 96) > 0 || *(_BYTE *)(v0 + 80) == 1)
    result = objc_msgSend(*(id *)(v0 + 72), "wait");
  v2 = *(_QWORD *)(v0 + 88);
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
    goto LABEL_11;
  }
  *(_QWORD *)(v0 + 88) = v4;
  objc_msgSend(*(id *)(v0 + 72), "unlock");
  v5 = *(_BYTE *)(v0 + 33);
  result = objc_msgSend(*(id *)(v0 + 72), "lock");
  v6 = *(_QWORD *)(v0 + 88);
  v3 = __OFSUB__(v6, 1);
  v7 = v6 - 1;
  if (v3)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  *(_QWORD *)(v0 + 88) = v7;
  if (!v7)
    objc_msgSend(*(id *)(v0 + 72), "broadcast");
  objc_msgSend(*(id *)(v0 + 72), "unlock");
  return (id)(v5 & 1);
}

void sub_10013E340()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  NSString v6;
  id v7;
  char v8;
  char v9;
  uint64_t v10;
  char v11;
  int v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  Class isa;
  NSString v24;
  uint64_t v25;
  os_log_t v26;
  __int128 v27;
  char v28;
  char v29;
  uint64_t v30;
  char v31;
  int v32;
  char v33;

  v1 = type metadata accessor for JSONEncoder.OutputFormatting(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_allocWithZone((Class)NSUserDefaults);
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v5, "initWithSuiteName:", v6);

  if (v7)
  {
    type metadata accessor for JSONEncoder(0);
    v8 = *(_BYTE *)(v0 + 32);
    v9 = *(_BYTE *)(v0 + 33);
    v10 = *(_QWORD *)(v0 + 40);
    v11 = *(_BYTE *)(v0 + 48);
    v12 = *(_DWORD *)(v0 + 52);
    v13 = *(_BYTE *)(v0 + 56);
    v27 = *(_OWORD *)(v0 + 16);
    v28 = v8;
    v29 = v9;
    v30 = v10;
    v31 = v11;
    v32 = v12;
    v33 = v13;
    v14 = sub_10013F5B4();
    default argument 1 of static JSONEncoder.encodeClean<A>(_:outputFormatting:)();
    static JSONEncoder.encodeClean<A>(_:outputFormatting:)((uint64_t)&v27, (uint64_t)v4, (uint64_t)&type metadata for GlobalState.PersistedInfo, v14);
    v20 = v19;
    v22 = v21;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    isa = Data._bridgeToObjectiveC()().super.isa;
    v24 = String._bridgeToObjectiveC()();
    objc_msgSend(v7, "setObject:forKey:", isa, v24);

    sub_100005DE0(v20, v22);
  }
  else
  {
    if (qword_1001AD300 != -1)
      swift_once(&qword_1001AD300, sub_10013D7D0);
    v15 = type metadata accessor for Logger(0);
    v16 = sub_100003A14(v15, (uint64_t)qword_1001B40A0);
    v26 = (os_log_t)Logger.logObject.getter(v16);
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v17, "Cannot access SPR user defaults", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

  }
}

id (*GlobalState.isPANPresent.modify(_QWORD *a1))(_BYTE *a1, char a2)
{
  uint64_t v1;
  _BYTE *v2;
  id (*result)(_BYTE *, char);
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = v1;
  v2 = a1 + 1;
  result = (id (*)(_BYTE *, char))objc_msgSend(*(id *)(v1 + 72), "lock");
  while (*(uint64_t *)(v1 + 96) > 0 || *(_BYTE *)(v1 + 80) == 1)
    result = (id (*)(_BYTE *, char))objc_msgSend(*(id *)(v1 + 72), "wait");
  v4 = *(_QWORD *)(v1 + 88);
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  *(_QWORD *)(v1 + 88) = v6;
  objc_msgSend(*(id *)(v1 + 72), "unlock");
  v7 = *(_BYTE *)(v1 + 33);
  result = (id (*)(_BYTE *, char))objc_msgSend(*(id *)(v1 + 72), "lock");
  v8 = *(_QWORD *)(v1 + 88);
  v5 = __OFSUB__(v8, 1);
  v9 = v8 - 1;
  if (v5)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  *(_QWORD *)(v1 + 88) = v9;
  if (!v9)
    objc_msgSend(*(id *)(v1 + 72), "broadcast");
  objc_msgSend(*(id *)(v1 + 72), "unlock");
  *v2 = v7 & 1;
  return sub_10013E86C;
}

id sub_10013E86C(_BYTE *a1, char a2)
{
  uint64_t v3;
  char v4;
  id result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)a1;
  v4 = a1[8];
  result = objc_msgSend(*(id *)(*(_QWORD *)a1 + 72), "lock");
  v6 = *(_QWORD *)(v3 + 96);
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  v9 = v7;
  if ((a2 & 1) != 0)
  {
    if ((v9 & 1) != 0)
    {
      __break(1u);
      goto LABEL_21;
    }
    *(_QWORD *)(v3 + 96) = v8;
    while (*(uint64_t *)(v3 + 88) > 0 || *(_BYTE *)(v3 + 80) == 1)
      result = objc_msgSend(*(id *)(v3 + 72), "wait");
    v10 = *(_QWORD *)(v3 + 96);
    v7 = __OFSUB__(v10, 1);
    v8 = v10 - 1;
    if (!v7)
      goto LABEL_19;
    __break(1u);
  }
  if ((v9 & 1) != 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  *(_QWORD *)(v3 + 96) = v8;
  while (*(uint64_t *)(v3 + 88) > 0 || *(_BYTE *)(v3 + 80) == 1)
    result = objc_msgSend(*(id *)(v3 + 72), "wait");
  v11 = *(_QWORD *)(v3 + 96);
  v7 = __OFSUB__(v11, 1);
  v8 = v11 - 1;
  if (!v7)
  {
LABEL_19:
    *(_QWORD *)(v3 + 96) = v8;
    *(_BYTE *)(v3 + 80) = 1;
    objc_msgSend(*(id *)(v3 + 72), "unlock");
    *(_BYTE *)(v3 + 33) = v4;
    sub_10013E340();
    objc_msgSend(*(id *)(v3 + 72), "lock");
    *(_BYTE *)(v3 + 80) = 0;
    objc_msgSend(*(id *)(v3 + 72), "broadcast");
    return objc_msgSend(*(id *)(v3 + 72), "unlock");
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_10013E994()
{
  uint64_t result;

  result = sub_10013E9B0();
  static GlobalState.shared = result;
  return result;
}

uint64_t sub_10013E9B0()
{
  id v0;
  NSString v1;
  NSObject *v2;
  NSString v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  _OWORD v32[2];
  __int128 v33;
  _OWORD v34[2];

  v0 = objc_allocWithZone((Class)NSUserDefaults);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "initWithSuiteName:", v1);

  if (!v2)
  {
    if (qword_1001AD300 != -1)
      swift_once(&qword_1001AD300, sub_10013D7D0);
    v10 = type metadata accessor for Logger(0);
    v11 = sub_100003A14(v10, (uint64_t)qword_1001B40A0);
    v2 = Logger.logObject.getter(v11);
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v2, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v12, "Cannot access SPR user defaults", v13, 2u);
      swift_slowDealloc(v13, -1, -1);
    }
    goto LABEL_8;
  }
  v3 = String._bridgeToObjectiveC()();
  v4 = -[NSObject dataForKey:](v2, "dataForKey:", v3);

  if (!v4)
  {
LABEL_8:

    v14 = type metadata accessor for GlobalState();
    v15 = swift_allocObject(v14, 104, 7);
    *(_QWORD *)(v15 + 72) = objc_msgSend(objc_allocWithZone((Class)NSCondition), "init");
    *(_BYTE *)(v15 + 80) = 0;
    *(_QWORD *)(v15 + 16) = 0;
    *(_QWORD *)(v15 + 24) = 0;
    *(_QWORD *)(v15 + 88) = 0;
    *(_QWORD *)(v15 + 96) = 0;
    *(_WORD *)(v15 + 32) = 513;
    *(_QWORD *)(v15 + 40) = 0;
    *(_BYTE *)(v15 + 48) = 1;
    *(_DWORD *)(v15 + 52) = 0;
    *(_BYTE *)(v15 + 56) = 1;
    goto LABEL_9;
  }
  v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v7 = v6;

  type metadata accessor for JSONDecoder(0);
  v8 = sub_10013F5F8();
  v9 = default argument 2 of static JSONDecoder.decodeClean<A>(_:from:userInfo:)();
  static JSONDecoder.decodeClean<A>(_:from:userInfo:)((uint64_t)&type metadata for GlobalState.PersistedInfo, v5, v7, v9, (uint64_t)&type metadata for GlobalState.PersistedInfo, v8);
  swift_bridgeObjectRelease(v9);
  v33 = v31;
  v34[0] = v32[0];
  *(_OWORD *)((char *)v34 + 9) = *(_OWORD *)((char *)v32 + 9);
  if (qword_1001AD300 != -1)
    swift_once(&qword_1001AD300, sub_10013D7D0);
  v17 = type metadata accessor for Logger(0);
  v18 = sub_100003A14(v17, (uint64_t)qword_1001B40A0);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc(12, -1);
    v22 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v31 = v22;
    *(_DWORD *)v21 = 136315138;
    v23 = sub_10013DC6C();
    v25 = v24;
    v29 = sub_1000056EC(v23, v24, (uint64_t *)&v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease(v25);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s", v21, 0xCu);
    swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v21, -1, -1);
  }

  v26 = type metadata accessor for GlobalState();
  v15 = swift_allocObject(v26, 104, 7);
  v27 = objc_msgSend(objc_allocWithZone((Class)NSCondition), "init");
  sub_100005DE0(v5, v7);

  *(_QWORD *)(v15 + 72) = v27;
  *(_BYTE *)(v15 + 80) = 0;
  *(_QWORD *)(v15 + 88) = 0;
  *(_QWORD *)(v15 + 96) = 0;
  v28 = v34[0];
  *(_OWORD *)(v15 + 16) = v33;
  *(_OWORD *)(v15 + 32) = v28;
  *(_OWORD *)(v15 + 41) = *(_OWORD *)((char *)v34 + 9);
LABEL_9:
  *(_QWORD *)(v15 + 64) = 0;
  return v15;
}

uint64_t static GlobalState.shared.getter()
{
  if (qword_1001AD308 != -1)
    swift_once(&qword_1001AD308, sub_10013E994);
  return swift_retain();
}

Swift::Void __swiftcall GlobalState.updateMFDEventTimestamp()()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  int v8;
  double v9;
  uint64_t v10;

  objc_msgSend(*(id *)(v0 + 72), "lock");
  v1 = *(_QWORD *)(v0 + 96);
  v2 = __OFADD__(v1, 1);
  v3 = v1 + 1;
  if (v2)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return;
  }
  *(_QWORD *)(v0 + 96) = v3;
  while (*(uint64_t *)(v0 + 88) > 0 || *(_BYTE *)(v0 + 80) == 1)
    objc_msgSend(*(id *)(v0 + 72), "wait");
  v4 = *(_QWORD *)(v0 + 96);
  v2 = __OFSUB__(v4, 1);
  v5 = v4 - 1;
  if (v2)
    goto LABEL_12;
  *(_QWORD *)(v0 + 96) = v5;
  *(_BYTE *)(v0 + 80) = 1;
  v6 = objc_msgSend(*(id *)(v0 + 72), "unlock");
  v7 = *(unsigned int *)(v0 + 52);
  v8 = *(unsigned __int8 *)(v0 + 56);
  v9 = TMGetKernelMonotonicClock(v6);
  if (v8)
    v10 = 0;
  else
    v10 = v7;
  *(_QWORD *)(v0 + 16) = v10;
  *(double *)(v0 + 24) = v9;
  *(_BYTE *)(v0 + 32) = 0;
  sub_10013E340();
  objc_msgSend(*(id *)(v0 + 72), "lock");
  *(_BYTE *)(v0 + 80) = 0;
  objc_msgSend(*(id *)(v0 + 72), "broadcast");
  objc_msgSend(*(id *)(v0 + 72), "unlock");
}

Swift::Void __swiftcall GlobalState.receiveTMRTCResetNotification()()
{
  uint64_t v0;
  uint32_t *p_align;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;

  v2 = v0;
  objc_msgSend(*(id *)(v0 + 72), "lock");
  v3 = *(_QWORD *)(v0 + 96);
  v4 = __OFADD__(v3, 1);
  v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    swift_once(&qword_1001AD300, sub_10013D7D0);
    goto LABEL_13;
  }
  *(_QWORD *)(v0 + 96) = v5;
  while (*(uint64_t *)(v0 + 88) > 0 || *(_BYTE *)(v0 + 80) == 1)
    objc_msgSend(*(id *)(v0 + 72), "wait");
  v6 = *(_QWORD *)(v0 + 96);
  v4 = __OFSUB__(v6, 1);
  v7 = v6 - 1;
  if (v4)
    goto LABEL_17;
  *(_QWORD *)(v0 + 96) = v7;
  *(_BYTE *)(v0 + 80) = 1;
  p_align = &stru_1001A9FE8.align;
  objc_msgSend(*(id *)(v0 + 72), "unlock");
  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
  {
    v8 = 0;
LABEL_10:
    v9 = 0;
    v10 = v8 + 1;
    goto LABEL_11;
  }
  v8 = *(_DWORD *)(v0 + 52);
  if (v8 != -1)
    goto LABEL_10;
  if (qword_1001AD300 != -1)
    goto LABEL_18;
LABEL_13:
  v11 = (_QWORD *)(v0 + 16);
  v12 = type metadata accessor for Logger(0);
  v13 = sub_100003A14(v12, (uint64_t)qword_1001B40A0);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "unexpected rtc reset count, reset GlobalState info", v16, 2u);
    swift_slowDealloc(v16, -1, -1);
  }

  v10 = 0;
  *v11 = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_WORD *)(v2 + 32) = 513;
  *(_QWORD *)(v2 + 40) = 0;
  v9 = 1;
  *(_BYTE *)(v2 + 48) = 1;
LABEL_11:
  *(_DWORD *)(v2 + 52) = v10;
  *(_BYTE *)(v2 + 56) = v9;
  sub_10013E340();
  objc_msgSend(*(id *)(v2 + 72), "lock");
  *(_BYTE *)(v2 + 80) = 0;
  objc_msgSend(*(id *)(v2 + 72), "broadcast");
  objc_msgSend(*(id *)(v2 + 72), *((SEL *)p_align + 277));
}

void __swiftcall GlobalState.updateNumberOfDeletableClients()(Swift::tuple_previous_Int_optional_current_Int_optional *__return_ptr retstr)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  __int128 *v10;
  id v11;
  NSString v12;
  unint64_t v13;
  id v14;
  unsigned int v15;
  char v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[32];

  objc_msgSend(*(id *)(v1 + 72), "lock");
  v2 = *(_QWORD *)(v1 + 96);
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return;
  }
  *(_QWORD *)(v1 + 96) = v4;
  while (*(uint64_t *)(v1 + 88) > 0 || *(_BYTE *)(v1 + 80) == 1)
    objc_msgSend(*(id *)(v1 + 72), "wait");
  v5 = *(_QWORD *)(v1 + 96);
  v3 = __OFSUB__(v5, 1);
  v6 = v5 - 1;
  if (v3)
    goto LABEL_25;
  *(_QWORD *)(v1 + 96) = v6;
  *(_BYTE *)(v1 + 80) = 1;
  objc_msgSend(*(id *)(v1 + 72), "unlock");
  v16 = *(_BYTE *)(v1 + 48);
  v7 = objc_msgSend((id)objc_opt_self(LSApplicationRecord), "enumeratorWithOptions:", 0);
  v8 = objc_msgSend(v7, "nextObject");
  if (v8)
  {
    v9 = v8;
    v17 = 0;
    while (1)
    {
      v11 = objc_msgSend(v9, "entitlements");
      v12 = String._bridgeToObjectiveC()();
      v13 = sub_10003994C();
      v14 = objc_msgSend(v11, "objectForKey:ofClass:", v12, swift_getObjCClassFromMetadata(v13));

      if (v14)
      {
        _bridgeAnyObjectToAny(_:)(&v19, v14);
        swift_unknownObjectRelease(v14);
      }
      else
      {
        v19 = 0u;
        v20 = 0u;
      }
      sub_100024374((uint64_t)&v19, (uint64_t)v21, &qword_1001B12E0);
      v15 = objc_msgSend(v9, "isDeletable");

      v10 = (__int128 *)v21;
      if (!v15)
        goto LABEL_10;
      sub_100024374((uint64_t)v21, (uint64_t)&v19, &qword_1001B12E0);
      if (!*((_QWORD *)&v20 + 1))
        break;
      if (swift_dynamicCast(&v18, &v19, (char *)&type metadata for Any + 8, &type metadata for Bool, 6)
        && (v18 & 1) != 0)
      {
        if (__OFADD__(v17, 1))
        {
          __break(1u);
          goto LABEL_24;
        }
        ++v17;
      }
LABEL_11:
      v9 = objc_msgSend(v7, "nextObject");
      if (!v9)
        goto LABEL_22;
    }
    v10 = &v19;
LABEL_10:
    sub_100007B30((uint64_t)v10);
    goto LABEL_11;
  }
  v17 = 0;
LABEL_22:
  *(_QWORD *)(v1 + 40) = v17;
  *(_BYTE *)(v1 + 48) = 0;
  sub_10013E340();
  objc_msgSend(*(id *)(v1 + 72), "lock");
  *(_BYTE *)(v1 + 80) = 0;
  objc_msgSend(*(id *)(v1 + 72), "broadcast");
  objc_msgSend(*(id *)(v1 + 72), "unlock");

  v21[0] = v16;
  LOBYTE(v19) = 0;
}

uint64_t GlobalState.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t GlobalState.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 104, 7);
}

uint64_t type metadata accessor for GlobalState()
{
  return objc_opt_self(_TtC9SPREngine11GlobalState);
}

unint64_t sub_10013F5B4()
{
  unint64_t result;

  result = qword_1001B4180;
  if (!qword_1001B4180)
  {
    result = swift_getWitnessTable(&unk_100163A04, &type metadata for GlobalState.PersistedInfo);
    atomic_store(result, (unint64_t *)&qword_1001B4180);
  }
  return result;
}

unint64_t sub_10013F5F8()
{
  unint64_t result;

  result = qword_1001B4188;
  if (!qword_1001B4188)
  {
    result = swift_getWitnessTable(&unk_1001639DC, &type metadata for GlobalState.PersistedInfo);
    atomic_store(result, (unint64_t *)&qword_1001B4188);
  }
  return result;
}

unint64_t sub_10013F63C()
{
  unint64_t result;

  result = qword_1001B41B0;
  if (!qword_1001B41B0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(result, (unint64_t *)&qword_1001B41B0);
  }
  return result;
}

unint64_t sub_10013F680()
{
  unint64_t result;

  result = qword_1001B41B8;
  if (!qword_1001B41B8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_1001B41B8);
  }
  return result;
}

__n128 initializeWithCopy for GlobalState.PersistedInfo(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for GlobalState.PersistedInfo(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 17);
  if (v3 >= 2)
    v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v4 = -2;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for GlobalState.PersistedInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 17) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for GlobalState.PersistedInfo()
{
  return &type metadata for GlobalState.PersistedInfo;
}

uint64_t getEnumTagSinglePayload for SPRTimestamp(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SPRTimestamp(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SPRTimestamp()
{
  return &type metadata for SPRTimestamp;
}

unint64_t sub_10013F7F4()
{
  unint64_t result;

  result = qword_1001B41C0;
  if (!qword_1001B41C0)
  {
    result = swift_getWitnessTable(&unk_10016398C, &type metadata for SPRTimestamp);
    atomic_store(result, (unint64_t *)&qword_1001B41C0);
  }
  return result;
}

uint64_t sub_10013F838(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v7;

  if (a1 == 0x7465736552637472 && a2 == 0xED0000746E756F43)
  {
    v5 = 0xED0000746E756F43;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7465736552637472, 0xED0000746E756F43, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0xD000000000000014 && a2 == 0x8000000100172E50)
  {
    swift_bridgeObjectRelease(0x8000000100172E50);
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014, 0x8000000100172E50, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

double sub_10013F948(_QWORD *a1)
{
  uint64_t v1;
  double v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  char v13;
  char v14;

  v4 = sub_100003A2C(&qword_1001B41C8);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_100005EF8(a1, v8);
  v10 = sub_10013FA9C();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for SPRTimestamp.CodingKeys, &type metadata for SPRTimestamp.CodingKeys, v10, v8, v9);
  if (!v1)
  {
    v14 = 0;
    KeyedDecodingContainer.decode(_:forKey:)(&v14, v4);
    v13 = 1;
    v2 = KeyedDecodingContainer.decode(_:forKey:)(&v13, v4);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_100005D3C(a1);
  return v2;
}

unint64_t sub_10013FA9C()
{
  unint64_t result;

  result = qword_1001B41D0;
  if (!qword_1001B41D0)
  {
    result = swift_getWitnessTable(&unk_100163C48, &type metadata for SPRTimestamp.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B41D0);
  }
  return result;
}

unint64_t sub_10013FAE0()
{
  unint64_t result;

  result = qword_1001B41E8;
  if (!qword_1001B41E8)
  {
    result = swift_getWitnessTable(&unk_100163BF8, &type metadata for GlobalState.PersistedInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B41E8);
  }
  return result;
}

uint64_t sub_10013FB24(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  char v9;

  if (a1 == 0x44464D7473616CLL && a2 == 0xE700000000000000)
  {
    v5 = 0xE700000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x44464D7473616CLL, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6572504E41507369 && a2 == 0xEC000000746E6573)
  {
    v7 = 0xEC000000746E6573;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6572504E41507369, 0xEC000000746E6573, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x664F7265626D756ELL && a2 == 0xEF73746E65696C43)
  {
    v8 = 0xEF73746E65696C43;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x664F7265626D756ELL, 0xEF73746E65696C43, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x7465736552637472 && a2 == 0xED0000746E756F43)
  {
    swift_bridgeObjectRelease(0xED0000746E756F43);
    return 3;
  }
  else
  {
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x7465736552637472, 0xED0000746E756F43, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_10013FD3C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  unsigned __int8 v24;
  int v25;
  char v26;

  v5 = sub_100003A2C(&qword_1001B41F0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100005EF8(a1, v9);
  v11 = sub_10013FAE0();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for GlobalState.PersistedInfo.CodingKeys, &type metadata for GlobalState.PersistedInfo.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_100005D3C(a1);
  v26 = 0;
  v12 = sub_100129F2C();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v23, &type metadata for SPRTimestamp, &v26, v5, &type metadata for SPRTimestamp, v12);
  v13 = v23[1];
  v22 = v23[0];
  v14 = v24;
  LOBYTE(v23[0]) = 1;
  HIDWORD(v20) = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v23, v5);
  v25 = v14;
  v21 = v13;
  LOBYTE(v23[0]) = 2;
  v15 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v23, v5);
  LOBYTE(v13) = v16;
  LOBYTE(v23[0]) = 3;
  v17 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v23, v5);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  result = sub_100005D3C(a1);
  v19 = v21;
  *(_QWORD *)a2 = v22;
  *(_QWORD *)(a2 + 8) = v19;
  *(_BYTE *)(a2 + 16) = v25;
  *(_BYTE *)(a2 + 17) = BYTE4(v20);
  *(_QWORD *)(a2 + 24) = v15;
  *(_BYTE *)(a2 + 32) = v13 & 1;
  *(_DWORD *)(a2 + 36) = v17;
  *(_BYTE *)(a2 + 40) = BYTE4(v17) & 1;
  return result;
}

uint64_t storeEnumTagSinglePayload for GlobalState.PersistedInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10013FF88 + 4 * byte_1001638A9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10013FFBC + 4 * byte_1001638A4[v4]))();
}

uint64_t sub_10013FFBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10013FFC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10013FFCCLL);
  return result;
}

uint64_t sub_10013FFD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10013FFE0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10013FFE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10013FFEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GlobalState.PersistedInfo.CodingKeys()
{
  return &type metadata for GlobalState.PersistedInfo.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for SPRTimestamp.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100140054 + 4 * byte_1001638B3[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100140088 + 4 * byte_1001638AE[v4]))();
}

uint64_t sub_100140088(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100140090(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100140098);
  return result;
}

uint64_t sub_1001400A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1001400ACLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1001400B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001400B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SPRTimestamp.CodingKeys()
{
  return &type metadata for SPRTimestamp.CodingKeys;
}

unint64_t sub_1001400D8()
{
  unint64_t result;

  result = qword_1001B41F8;
  if (!qword_1001B41F8)
  {
    result = swift_getWitnessTable(&unk_100163B18, &type metadata for SPRTimestamp.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B41F8);
  }
  return result;
}

unint64_t sub_100140120()
{
  unint64_t result;

  result = qword_1001B4200;
  if (!qword_1001B4200)
  {
    result = swift_getWitnessTable(&unk_100163BD0, &type metadata for GlobalState.PersistedInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B4200);
  }
  return result;
}

unint64_t sub_100140168()
{
  unint64_t result;

  result = qword_1001B4208;
  if (!qword_1001B4208)
  {
    result = swift_getWitnessTable(&unk_100163B40, &type metadata for GlobalState.PersistedInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B4208);
  }
  return result;
}

unint64_t sub_1001401B0()
{
  unint64_t result;

  result = qword_1001B4210;
  if (!qword_1001B4210)
  {
    result = swift_getWitnessTable(&unk_100163B68, &type metadata for GlobalState.PersistedInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B4210);
  }
  return result;
}

unint64_t sub_1001401F8()
{
  unint64_t result;

  result = qword_1001B4218;
  if (!qword_1001B4218)
  {
    result = swift_getWitnessTable(&unk_100163A88, &type metadata for SPRTimestamp.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B4218);
  }
  return result;
}

unint64_t sub_100140240()
{
  unint64_t result;

  result = qword_1001B4220;
  if (!qword_1001B4220)
  {
    result = swift_getWitnessTable(&unk_100163AB0, &type metadata for SPRTimestamp.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B4220);
  }
  return result;
}

uint64_t sub_100140284(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;

  if (a1 == 301)
  {
    if (a2 == 0x696C61762D666173 && a3 == 0xEE006E6F69746164)
      goto LABEL_10;
    v5 = 761684339;
  }
  else
  {
    if (a1 != 300)
    {
      if (a1 == 200
        && (a2 == 0x702D657275636573 && a3 == 0xEE0064616F6C7961
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x702D657275636573, 0xEE0064616F6C7961, a2, a3, 0) & 1) != 0))
      {
        v9 = a2;
        v10 = a3;
        swift_bridgeObjectRetain(a3);
        v6 = 0x747265632DLL;
        v7 = 0xE500000000000000;
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    if (a2 == 7596553831663430000 && a3 == 0xEE006E6F69746164)
      goto LABEL_10;
    v5 = 762210672;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(v5 | 0x696C617600000000, 0xEE006E6F69746164, a2, a3, 0) & 1) != 0)
  {
LABEL_10:
    v9 = a2;
    v10 = a3;
    swift_bridgeObjectRetain(a3);
    v6 = 0x73747265632DLL;
    v7 = 0xE600000000000000;
LABEL_16:
    String.append(_:)(*(Swift::String *)&v6);
    return sub_1000FA224(v9, v10);
  }
LABEL_17:
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000036, 0x8000000100172EA0, "SPREngine/CertificateRole.swift", 31, 2, 62, 0);
  __break(1u);
  return result;
}

void sub_100140460()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[5];
  uint64_t v25;
  char v26[136];

  v0 = sub_100003A2C(&qword_1001AE038);
  inited = swift_initStackObject(v0, v26);
  *(_OWORD *)(inited + 16) = xmmword_10015A6C0;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAAKeychainLabel);
  *(_QWORD *)(inited + 40) = v2;
  v3 = UUID.uuidString.getter();
  *(_QWORD *)(inited + 72) = &type metadata for String;
  *(_QWORD *)(inited + 48) = v3;
  *(_QWORD *)(inited + 56) = v4;
  *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAADeleteExistingKeysAndCerts);
  *(_QWORD *)(inited + 88) = v5;
  *(_QWORD *)(inited + 120) = &type metadata for Bool;
  *(_BYTE *)(inited + 96) = 1;
  v6 = sub_1000047FC(inited);
  v7 = swift_allocObject(&unk_1001A0F20, 24, 7);
  *(_QWORD *)(v7 + 16) = 0;
  v8 = sub_1001416D0(v6);
  swift_bridgeObjectRelease(v6);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  aBlock[4] = sub_100142728;
  v25 = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100142148;
  aBlock[3] = &unk_1001A0F38;
  v10 = _Block_copy(aBlock);
  v11 = v25;
  swift_retain(v7);
  swift_release(v11);
  DeviceIdentityIssueClientCertificateWithCompletion(0, isa, v10);
  _Block_release(v10);

  swift_beginAccess(v7 + 16, aBlock, 0, 0);
  if (*(_QWORD *)(v7 + 16))
  {
    if (qword_1001AD310 != -1)
      swift_once(&qword_1001AD310, sub_1001414EC);
    v12 = type metadata accessor for Logger(0);
    sub_100003A14(v12, (uint64_t)qword_1001B4228);
    v13 = swift_retain_n(v7, 2);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(12, -1);
      v17 = swift_slowAlloc(32, -1);
      v23 = v17;
      *(_DWORD *)v16 = 136315138;
      v22 = *(_QWORD *)(v7 + 16);
      swift_errorRetain(v22);
      v18 = sub_100003A2C(&qword_1001AF388);
      v19 = String.init<A>(describing:)(&v22, v18);
      v21 = v20;
      v22 = sub_1000056EC(v19, v20, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v16 + 4, v16 + 12);
      swift_release_n(v7, 2);
      swift_bridgeObjectRelease(v21);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed to delete BAA key and certificate: %s", v16, 0xCu);
      swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v16, -1, -1);
      swift_release(v7);

    }
    else
    {

      swift_release_n(v7, 3);
    }
  }
  else
  {
    swift_release(v7);
  }
}

CFDataRef sub_1001407A8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  _TtC14softposreaderd12RemoteReader *v3;
  Class isa;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __SecKey *v15;
  const __CFData *v16;
  CFDataRef v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _TtC14softposreaderd12RemoteReader *v27;
  SEL v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFData *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  id v54[4];
  CFErrorRef error;

  if (qword_1001AD210 != -1)
    swift_once(&qword_1001AD210, sub_100115468);
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_accessControl);
  v2 = (id)qword_1001B4F20;
  v3 = (_TtC14softposreaderd12RemoteReader *)sub_10000459C((uint64_t)&_swiftEmptyArrayStorage);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3, v5, v6, v7, v8, v9, v10, v11);
  v54[0] = 0;
  v12 = objc_msgSend(v2, "evaluateAccessControl:operation:options:error:", v1, 3, isa, v54);

  v13 = v54[0];
  if (v12)
  {
    v14 = v54[0];

    error = 0;
    v15 = *(__SecKey **)(v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_key);
    v16 = Data._bridgeToObjectiveC()().super.isa;
    v17 = SecKeyCreateSignature(v15, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, v16, &error);

    if (error)
    {
      if (qword_1001AD310 != -1)
        swift_once(&qword_1001AD310, sub_1001414EC);
      v18 = type metadata accessor for Logger(0);
      v19 = sub_100003A14(v18, (uint64_t)qword_1001B4228);
      v20 = Logger.logObject.getter(v19);
      v21 = static os_log_type_t.error.getter(v20);
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc(12, -1);
        v23 = swift_slowAlloc(32, -1);
        v54[0] = (id)v23;
        *(_DWORD *)v22 = 136315138;
        swift_beginAccess(&error, &v52, 0, 0);
        v53 = (uint64_t)error;
        v24 = sub_100003A2C(&qword_1001B4348);
        v25 = String.init<A>(describing:)(&v53, v24);
        v27 = (_TtC14softposreaderd12RemoteReader *)v26;
        v53 = sub_1000056EC(v25, v26, (uint64_t *)v54);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54, v22 + 4, v22 + 12);
        swift_bridgeObjectRelease(v27, v28, v29, v30, v31, v32, v33, v34);
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Error with BAA data signature: %s", v22, 0xCu);
        swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v23, -1, -1);
        swift_slowDealloc(v22, -1, -1);
      }

      swift_beginAccess(&error, v54, 0, 0);
      v53 = (uint64_t)error;
      v35 = sub_100003A2C(&qword_1001B4348);
      v36 = String.init<A>(describing:)(&v53, v35);
      v38 = v37;
      v39 = v36;
      v40 = v38;
    }
    else
    {
      if (v17)
      {
        *(_OWORD *)v54 = xmmword_10015E900;
        v44 = v17;
        static Data._conditionallyBridgeFromObjectiveC(_:result:)();

        if ((unint64_t)v54[1] >> 60 != 15)
        {
          v17 = (CFDataRef)v54[0];

          return v17;
        }
      }
      if (qword_1001AD310 != -1)
        swift_once(&qword_1001AD310, sub_1001414EC);
      v45 = type metadata accessor for Logger(0);
      v46 = sub_100003A14(v45, (uint64_t)qword_1001B4228);
      v47 = Logger.logObject.getter(v46);
      v48 = static os_log_type_t.error.getter(v47);
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v49 = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "Unexpected nil value for BAA data signature", v49, 2u);
        swift_slowDealloc(v49, -1, -1);
      }

      v40 = (void *)0x8000000100172FA0;
      v39 = 0xD000000000000015;
    }
    v50 = sub_10002460C(10004, v39, v40, 0);
    swift_willThrow(v50);

  }
  else
  {
    v17 = (CFDataRef)v54[0];
    v41 = _convertNSErrorToError(_:)(v13);

    swift_willThrow(v42);
    swift_errorRetain();
    sub_10002460C(10003, 0x617461446E676973, (void *)0xE800000000000000, v41);
    v43 = swift_errorRelease();
    swift_willThrow(v43);
    swift_errorRelease();
  }
  return v17;
}

CFDataRef sub_100140C78()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  _TtC14softposreaderd12RemoteReader *v3;
  Class isa;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __SecKey *v15;
  const __CFData *v16;
  CFDataRef v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _TtC14softposreaderd12RemoteReader *v27;
  SEL v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFData *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  id v54[4];
  CFErrorRef error;

  if (qword_1001AD210 != -1)
    swift_once(&qword_1001AD210, sub_100115468);
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_accessControl);
  v2 = (id)qword_1001B4F20;
  v3 = (_TtC14softposreaderd12RemoteReader *)sub_10000459C((uint64_t)&_swiftEmptyArrayStorage);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3, v5, v6, v7, v8, v9, v10, v11);
  v54[0] = 0;
  v12 = objc_msgSend(v2, "evaluateAccessControl:operation:options:error:", v1, 3, isa, v54);

  v13 = v54[0];
  if (v12)
  {
    v14 = v54[0];

    error = 0;
    v15 = *(__SecKey **)(v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_key);
    v16 = Data._bridgeToObjectiveC()().super.isa;
    v17 = SecKeyCreateSignature(v15, kSecKeyAlgorithmECDSASignatureDigestX962SHA256, v16, &error);

    if (error)
    {
      if (qword_1001AD310 != -1)
        swift_once(&qword_1001AD310, sub_1001414EC);
      v18 = type metadata accessor for Logger(0);
      v19 = sub_100003A14(v18, (uint64_t)qword_1001B4228);
      v20 = Logger.logObject.getter(v19);
      v21 = static os_log_type_t.error.getter(v20);
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc(12, -1);
        v23 = swift_slowAlloc(32, -1);
        v54[0] = (id)v23;
        *(_DWORD *)v22 = 136315138;
        swift_beginAccess(&error, &v52, 0, 0);
        v53 = (uint64_t)error;
        v24 = sub_100003A2C(&qword_1001B4348);
        v25 = String.init<A>(describing:)(&v53, v24);
        v27 = (_TtC14softposreaderd12RemoteReader *)v26;
        v53 = sub_1000056EC(v25, v26, (uint64_t *)v54);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54, v22 + 4, v22 + 12);
        swift_bridgeObjectRelease(v27, v28, v29, v30, v31, v32, v33, v34);
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Error with BAA digest signature: %s", v22, 0xCu);
        swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v23, -1, -1);
        swift_slowDealloc(v22, -1, -1);
      }

      swift_beginAccess(&error, v54, 0, 0);
      v53 = (uint64_t)error;
      v35 = sub_100003A2C(&qword_1001B4348);
      v36 = String.init<A>(describing:)(&v53, v35);
      v38 = v37;
      v39 = v36;
      v40 = v38;
    }
    else
    {
      if (v17)
      {
        *(_OWORD *)v54 = xmmword_10015E900;
        v44 = v17;
        static Data._conditionallyBridgeFromObjectiveC(_:result:)();

        if ((unint64_t)v54[1] >> 60 != 15)
        {
          v17 = (CFDataRef)v54[0];

          return v17;
        }
      }
      if (qword_1001AD310 != -1)
        swift_once(&qword_1001AD310, sub_1001414EC);
      v45 = type metadata accessor for Logger(0);
      v46 = sub_100003A14(v45, (uint64_t)qword_1001B4228);
      v47 = Logger.logObject.getter(v46);
      v48 = static os_log_type_t.error.getter(v47);
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v49 = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "Unexpected nil value for BAA digest signature", v49, 2u);
        swift_slowDealloc(v49, -1, -1);
      }

      v40 = (void *)0x8000000100172F80;
      v39 = 0xD000000000000017;
    }
    v50 = sub_10002460C(10004, v39, v40, 0);
    swift_willThrow(v50);

  }
  else
  {
    v17 = (CFDataRef)v54[0];
    v41 = _convertNSErrorToError(_:)(v13);

    swift_willThrow(v42);
    swift_errorRetain();
    sub_10002460C(10003, 0x656769446E676973, (void *)0xEA00000000007473, v41);
    v43 = swift_errorRelease();
    swift_willThrow(v43);
    swift_errorRelease();
  }
  return v17;
}

uint64_t sub_10014114C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  Swift::String v3;
  void *object;
  Swift::String v5;
  Swift::String v6;
  void *v7;
  Swift::String v8;
  uint64_t v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  void *v15;
  Swift::String v16;
  uint64_t v17;
  unint64_t v18;
  Swift::String v19;
  Swift::String v20;
  uint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  Swift::String v27;
  uint64_t countAndFlagsBits;
  void *v29;
  Swift::String v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  Swift::String v34;
  void *v35;
  Swift::String v36;
  Swift::String v37;
  void *v38;
  Swift::String v39;
  Swift::String v41;
  _QWORD *v42;
  _QWORD v43[2];

  v1 = v0;
  v2 = *v0;
  v43[0] = 0;
  v43[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(89);
  v3._countAndFlagsBits = _typeName(_:qualified:)(v2, 0);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  v5._countAndFlagsBits = 60;
  v5._object = (void *)0xE100000000000000;
  String.append(_:)(v5);
  v41._countAndFlagsBits = v0[2];
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
  v7 = v6._object;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(v7);
  v8._countAndFlagsBits = 0xD000000000000014;
  v8._object = (void *)0x8000000100170E50;
  String.append(_:)(v8);
  v41._countAndFlagsBits = *(uint64_t *)((char *)v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_accessControl);
  type metadata accessor for SecAccessControl(0);
  _print_unlocked<A, B>(_:_:)(&v41, v43, v9, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v10._countAndFlagsBits = 0x73614879656B202CLL;
  v10._object = (void *)0xEB00000000203A68;
  String.append(_:)(v10);
  type metadata accessor for SecKey(0);
  v12 = v11;
  v13 = sub_100005F1C(&qword_1001B4368, (uint64_t (*)(uint64_t))type metadata accessor for SecKey, (uint64_t)&unk_10015DC04);
  v41._countAndFlagsBits = _CFObject.hashValue.getter(v12, v13);
  v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v15 = v14._object;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(v15);
  v16._countAndFlagsBits = 0x203A6661656C202CLL;
  v16._object = (void *)0xE800000000000000;
  String.append(_:)(v16);
  v17 = v0[3];
  v18 = v1[4];
  sub_100005D9C(v1[3], v18);
  v19 = Data.base64EncodedString(options:)(0);
  sub_100005DE0(v17, v18);
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v19._object);
  v20._countAndFlagsBits = 0xD000000000000011;
  v20._object = (void *)0x8000000100170E70;
  String.append(_:)(v20);
  v21 = v1[5];
  v22 = *(_QWORD *)(v21 + 16);
  v23 = _swiftEmptyArrayStorage;
  if (v22)
  {
    v42 = _swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(v21);
    sub_100091C44(0, v22, 0);
    v23 = v42;
    v24 = (unint64_t *)(v21 + 40);
    do
    {
      v25 = *(v24 - 1);
      v26 = *v24;
      sub_100005D9C(v25, *v24);
      v41 = Data.base64EncodedString(options:)(0);
      v27._countAndFlagsBits = 44;
      v27._object = (void *)0xE100000000000000;
      String.append(_:)(v27);
      sub_100005DE0(v25, v26);
      v30 = v41;
      v29 = v30._object;
      countAndFlagsBits = v30._countAndFlagsBits;
      v42 = v23;
      v32 = v23[2];
      v31 = v23[3];
      if (v32 >= v31 >> 1)
      {
        sub_100091C44(v31 > 1, v32 + 1, 1);
        v23 = v42;
      }
      v24 += 2;
      v23[2] = v32 + 1;
      v33 = &v23[2 * v32];
      v33[4] = countAndFlagsBits;
      v33[5] = v29;
      --v22;
    }
    while (v22);
    swift_bridgeObjectRelease(v21);
  }
  v34._countAndFlagsBits = Array.description.getter(v23, &type metadata for String);
  v35 = v34._object;
  String.append(_:)(v34);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v35);
  v36._object = (void *)0x8000000100170E90;
  v36._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v36);
  v37._countAndFlagsBits = sub_10013D860(*(double *)((char *)v1
                                                   + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp
                                                   + 8));
  v38 = v37._object;
  String.append(_:)(v37);
  swift_bridgeObjectRelease(v38);
  v39._countAndFlagsBits = 32044;
  v39._object = (void *)0xE200000000000000;
  String.append(_:)(v39);
  return v43[0];
}

uint64_t sub_1001414EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_1000039D4(v0, qword_1001B4228);
  v1 = sub_100003A14(v0, (uint64_t)qword_1001B4228);
  if (qword_1001AD168 != -1)
    swift_once(&qword_1001AD168, sub_1000CC6D0);
  v2 = sub_100003A14(v0, (uint64_t)qword_1001B4E28);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_10014157C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v0 = sub_100003A2C((uint64_t *)&unk_1001AE410);
  v1 = swift_allocObject(v0, 112, 7);
  *(_OWORD *)(v1 + 16) = xmmword_10015E3E0;
  *(_QWORD *)(v1 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAAOIDHardwareProperties);
  *(_QWORD *)(v1 + 40) = v2;
  *(_QWORD *)(v1 + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAAOIDKeyUsageProperties);
  *(_QWORD *)(v1 + 56) = v3;
  *(_QWORD *)(v1 + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAAOIDDeviceOSInformation);
  *(_QWORD *)(v1 + 72) = v4;
  *(_QWORD *)(v1 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAAOIDDeviceIdentifiers);
  *(_QWORD *)(v1 + 88) = v5;
  result = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAAOIDUCRTDeviceIdentifiers);
  *(_QWORD *)(v1 + 96) = result;
  *(_QWORD *)(v1 + 104) = v7;
  qword_1001B5008 = v1;
  return result;
}

void sub_100141628()
{
  SecAccessControlRef v0;
  __SecAccessControl *v1;
  unint64_t v2;
  Class isa;

  v0 = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, 0x40000000uLL, 0);
  if (v0)
  {
    v1 = v0;
    v2 = sub_1000E8770((uint64_t)&off_1001984C8);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
    SecAccessControlSetConstraints(v1, isa);

    qword_1001B5010 = (uint64_t)v1;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1001416D0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[3];
  _OWORD v39[2];
  __int128 v40;
  _OWORD v41[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100003A2C(&qword_1001AC688);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v29 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v14 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v14);
    v16 = v9 + 1;
    if (!v15)
    {
      v16 = v9 + 2;
      if (v9 + 2 >= v28)
        goto LABEL_37;
      v15 = *(_QWORD *)(v29 + 8 * v16);
      if (!v15)
      {
        v16 = v9 + 3;
        if (v9 + 3 >= v28)
          goto LABEL_37;
        v15 = *(_QWORD *)(v29 + 8 * v16);
        if (!v15)
        {
          v16 = v9 + 4;
          if (v9 + 4 >= v28)
            goto LABEL_37;
          v15 = *(_QWORD *)(v29 + 8 * v16);
          if (!v15)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
    v9 = v16;
LABEL_28:
    v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v13);
    v20 = *v18;
    v19 = v18[1];
    sub_100005D5C(*(_QWORD *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(_QWORD *)&v40 = v20;
    *((_QWORD *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(_QWORD *)&v38[0] = v20;
    *((_QWORD *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7);
    sub_100005D2C(v39, v33);
    v34 = v30;
    v35 = v31;
    v36 = v32;
    sub_100005D2C(v33, v37);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    sub_100005D2C(v37, v38);
    sub_100005D2C(v38, &v34);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v21 = -1 << *((_BYTE *)v3 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)&v7[8 * v23];
      }
      while (v27 == -1);
      v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(_QWORD *)(v11 + 32) = v32;
    result = (uint64_t)sub_100005D2C(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_1000978B0(a1);
    return (uint64_t)v3;
  }
  v15 = *(_QWORD *)(v29 + 8 * v17);
  if (v15)
  {
    v16 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100141A94(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v8;
  uint64_t *v9;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  void **v23;
  void **v24;
  void **v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  _QWORD v63[3];
  void *v64;
  char v65[24];
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v8 = a1;
  v9 = (uint64_t *)(a5 + 16);
  if (a3)
  {
    if (qword_1001AD310 != -1)
      swift_once(&qword_1001AD310, sub_1001414EC);
    v11 = type metadata accessor for Logger(0);
    sub_100003A14(v11, (uint64_t)qword_1001B4228);
    swift_errorRetain(a3);
    v12 = swift_errorRetain(a3);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(12, -1);
      v16 = swift_slowAlloc(32, -1);
      v66 = v16;
      *(_DWORD *)v15 = 136315138;
      v68 = a3;
      swift_errorRetain(a3);
      v17 = sub_100003A2C(&qword_1001AF388);
      v18 = String.init<A>(describing:)(&v68, v17);
      v20 = v19;
      v68 = sub_1000056EC(v18, v19, &v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v15 + 4, v15 + 12);
      swift_bridgeObjectRelease(v20);
      swift_errorRelease(a3);
      swift_errorRelease(a3);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Error getting DeviceIdentity certificate: %s", v15, 0xCu);
      swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v15, -1, -1);
    }
    else
    {
      swift_errorRelease(a3);
      swift_errorRelease(a3);
    }

    v66 = a3;
    swift_errorRetain(a3);
    v35 = sub_100003A2C(&qword_1001AF388);
    v36 = String.init<A>(describing:)(&v66, v35);
    v38 = sub_10002460C(10001, v36, v37, 0);
    swift_beginAccess(v9, &v66, 1, 0);
    v39 = *v9;
    *v9 = v38;
    goto LABEL_29;
  }
  if (a1)
  {
    if (a2)
    {
      v22 = *(_QWORD *)(a2 + 16);
      if (v22 == 2)
      {
        v23 = (void **)(a6 + 16);
        v24 = (void **)(a7 + 16);
        v25 = (void **)(a8 + 16);
        swift_beginAccess(a6 + 16, &v68, 1, 0);
        v26 = *v23;
        *v23 = v8;
        v27 = v8;
        swift_bridgeObjectRetain(a2);

        sub_100005D5C(a2 + 32, (uint64_t)&v66);
        type metadata accessor for SecCertificate(0);
        v29 = v28;
        swift_dynamicCast(v63, &v66, (char *)&type metadata for Any + 8, v28, 7);
        v30 = (void *)v63[0];
        swift_beginAccess(v24, v65, 1, 0);
        v31 = *v24;
        *v24 = v30;

        sub_100005D5C(a2 + 64, (uint64_t)&v66);
        swift_bridgeObjectRelease(a2);

        swift_dynamicCast(&v64, &v66, (char *)&type metadata for Any + 8, v29, 7);
        v32 = v64;
        swift_beginAccess(v25, v63, 1, 0);
        v33 = *v25;
        *v25 = v32;

        OS_dispatch_semaphore.signal()();
        v34 = v27;
        return spr_releaseCFObject(v34);
      }
      v55 = qword_1001AD310;
      v8 = a1;
      swift_bridgeObjectRetain(a2);
      if (v55 != -1)
        swift_once(&qword_1001AD310, sub_1001414EC);
      v56 = type metadata accessor for Logger(0);
      sub_100003A14(v56, (uint64_t)qword_1001B4228);
      v57 = swift_bridgeObjectRetain(a2);
      v58 = Logger.logObject.getter(v57);
      v59 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v58, v59))
      {
        v60 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v60 = 134217984;
        swift_bridgeObjectRelease(a2);
        v66 = v22;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &v67, v60 + 4, v60 + 12);
        swift_bridgeObjectRelease(a2);
        _os_log_impl((void *)&_mh_execute_header, v58, v59, "BAA returned incorrect number of certificate references. Expected: 2, received: %ld", v60, 0xCu);
        swift_slowDealloc(v60, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(a2, 2);
      }
      v53 = 0xD00000000000002DLL;
      v54 = "BAA returned incorrect number of certificates";
    }
    else
    {
      v47 = qword_1001AD310;
      v8 = a1;
      if (v47 != -1)
        swift_once(&qword_1001AD310, sub_1001414EC);
      v48 = type metadata accessor for Logger(0);
      v49 = sub_100003A14(v48, (uint64_t)qword_1001B4228);
      v50 = Logger.logObject.getter(v49);
      v51 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "Failed to create certificate references", v52, 2u);
        swift_slowDealloc(v52, -1, -1);
      }

      v53 = 0xD000000000000027;
      v54 = "BAA returned nil certificate references";
    }
    v61 = sub_10002460C(10002, v53, (void *)((unint64_t)(v54 - 32) | 0x8000000000000000), 0);

    swift_beginAccess(v9, &v66, 1, 0);
    v39 = *v9;
    *v9 = v61;
LABEL_29:
    swift_errorRelease(v39);
    OS_dispatch_semaphore.signal()();
    v34 = v8;
    return spr_releaseCFObject(v34);
  }
  if (qword_1001AD310 != -1)
    swift_once(&qword_1001AD310, sub_1001414EC);
  v40 = type metadata accessor for Logger(0);
  v41 = sub_100003A14(v40, (uint64_t)qword_1001B4228);
  v42 = Logger.logObject.getter(v41);
  v43 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v44 = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "Failed to create key reference", v44, 2u);
    swift_slowDealloc(v44, -1, -1);
  }

  v45 = sub_10002460C(10001, 0xD00000000000001ELL, (void *)0x8000000100173010, 0);
  swift_beginAccess(v9, &v66, 1, 0);
  v46 = *v9;
  *v9 = v45;
  swift_errorRelease(v46);
  OS_dispatch_semaphore.signal()();
  v34 = 0;
  return spr_releaseCFObject(v34);
}

uint64_t sub_100142148(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void (*v7)(void *, uint64_t, void *);
  uint64_t v8;
  id v9;
  id v10;

  v7 = *(void (**)(void *, uint64_t, void *))(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (a3)
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  else
    v8 = 0;
  swift_retain(v6);
  v9 = a2;
  v10 = a4;
  v7(a2, v8, a4);
  swift_release(v6);

  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_1001421E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  _BYTE v8[24];

  swift_beginAccess(a4 + 16, v8, 1, 0);
  v6 = *(_QWORD *)(a4 + 16);
  *(_QWORD *)(a4 + 16) = a3;
  swift_errorRetain(a3);
  return swift_errorRelease(v6);
}

uint64_t sub_100142240()
{
  _BYTE *v0;

  if (*v0)
    return 0x73656D695479656BLL;
  else
    return 1684632949;
}

uint64_t sub_10014227C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1001436D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001422A0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100143DA4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001422C8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100143DA4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001422F0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  char v19;
  int v20;
  uint64_t v21;

  v3 = v1;
  v5 = sub_100003A2C(&qword_1001B4360);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100005EF8(a1, v9);
  v11 = sub_100143DA4();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for BAASigningIdentity.CodingKeys, &type metadata for BAASigningIdentity.CodingKeys, v11, v9, v10);
  v12 = v3 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_uuid;
  LOBYTE(v20) = 0;
  v13 = type metadata accessor for UUID(0);
  v14 = sub_100005F1C(&qword_1001B16E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v12, &v20, v5, v13, v14);
  if (!v2)
  {
    v15 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp + 8);
    v20 = *(_DWORD *)(v3 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp);
    v21 = v15;
    v19 = 1;
    v16 = sub_100129F70();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v20, &v19, v5, &type metadata for SPRTimestamp, v16);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_10014246C()
{
  uint64_t v0;
  SEL v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  sub_100005DE0(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(v0 + 40), v1, v2, v3, v4, v5, v6, v7);
  v8 = v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_uuid;
  v9 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);

}

uint64_t sub_1001424D8()
{
  uint64_t v0;
  SEL v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  sub_100005DE0(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)(v0 + 40), v1, v2, v3, v4, v5, v6, v7);
  v8 = v0 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_uuid;
  v9 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);

  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100142558()
{
  return type metadata accessor for BAASigningIdentity(0);
}

uint64_t type metadata accessor for BAASigningIdentity(uint64_t a1)
{
  uint64_t result;

  result = qword_1001B4278;
  if (!qword_1001B4278)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BAASigningIdentity);
  return result;
}

uint64_t sub_10014259C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = &unk_100163CF8;
  v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[4] = &unk_100163D10;
    v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 6, v4, a1 + 96);
    if (!result)
      return 0;
  }
  return result;
}

NSObject *sub_100142638@<X0>(_QWORD *a1@<X0>, NSObject **a2@<X8>)
{
  uint64_t v2;
  NSObject *result;

  result = sub_1001437CC(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_100142660(_QWORD *a1)
{
  return sub_1001422F0(a1);
}

BOOL sub_100142680(_QWORD **a1, _QWORD **a2)
{
  return sub_100142748(*a1, *a2);
}

uint64_t sub_10014268C(_QWORD *a1)
{
  uint64_t result;

  a1[1] = sub_100005F1C(&qword_1001B3CB8, type metadata accessor for BAASigningIdentity, (uint64_t)&unk_100163D78);
  a1[2] = sub_100005F1C(&qword_1001B3CA0, type metadata accessor for BAASigningIdentity, (uint64_t)&unk_100163D50);
  result = sub_100005F1C(&qword_1001B4340, type metadata accessor for BAASigningIdentity, (uint64_t)&unk_100163D28);
  a1[3] = result;
  return result;
}

uint64_t sub_100142704()
{
  uint64_t v0;

  swift_errorRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100142728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1001421E4(a1, a2, a3, v3);
}

uint64_t sub_100142730(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100142740(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

BOOL sub_100142748(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  char v14;
  _TtC14softposreaderd12RemoteReader *v15;
  _TtC14softposreaderd12RemoteReader *v16;
  char v17;
  SEL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  SEL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  type metadata accessor for SecKey(0);
  v5 = v4;
  v6 = *(_QWORD *)((char *)a1 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_key);
  v7 = *(_QWORD *)((char *)a2 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_key);
  v8 = sub_100005F1C(&qword_1001B4368, (uint64_t (*)(uint64_t))type metadata accessor for SecKey, (uint64_t)&unk_10015DC04);
  if ((static _CFObject.== infix(_:_:)(v6, v7, v5, v8) & 1) == 0)
    return 0;
  v9 = a1[3];
  v10 = a1[4];
  v11 = a2[3];
  v12 = a2[4];
  sub_100005D9C(v9, v10);
  sub_100005D9C(v11, v12);
  sub_1001288E0(v9, v10);
  v14 = v13;
  sub_100005DE0(v11, v12);
  sub_100005DE0(v9, v10);
  if ((v14 & 1) == 0)
    return 0;
  v15 = (_TtC14softposreaderd12RemoteReader *)a1[5];
  v16 = (_TtC14softposreaderd12RemoteReader *)a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = sub_1001279E4((uint64_t)v15, (uint64_t)v16);
  swift_bridgeObjectRelease(v15, v18, v19, v20, v21, v22, v23, v24);
  swift_bridgeObjectRelease(v16, v25, v26, v27, v28, v29, v30, v31);
  return (v17 & 1) != 0
      && *(_DWORD *)((char *)a1 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp) == *(_DWORD *)((char *)a2 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp)
      && *(double *)((char *)a1 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp + 8) == *(double *)((char *)a2 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp + 8);
}

_QWORD *sub_100142898(void *a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, int a7, double a8)
{
  _QWORD *v8;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  _BYTE v26[24];

  *(_QWORD *)((char *)v8 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_accessControl) = a1;
  v16 = (char *)v8 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_uuid;
  v17 = type metadata accessor for UUID(0);
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v16, a2, v17);
  *(_QWORD *)((char *)v8 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_key) = a3;
  v8[3] = a4;
  v8[4] = a5;
  v8[5] = a6;
  v19 = (double *)((char *)v8 + OBJC_IVAR____TtC9SPREngine18BAASigningIdentity_keyTimestamp);
  *(_DWORD *)v19 = a7;
  v19[1] = a8;
  swift_beginAccess(&qword_1001B4FC0, v26, 33, 0);
  v20 = a1;
  v21 = a3;
  sub_100005D9C(a4, a5);
  do
  {
    v22 = __ldxr(&qword_1001B4FC0);
    v23 = v22 + 1;
  }
  while (__stxr(v22 + 1, &qword_1001B4FC0));
  swift_endAccess(v26);
  v8[2] = v23;
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a2, v17);
  return v8;
}

NSObject *sub_1001429CC(uint64_t a1, int a2, void **a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  NSObject *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  int v26;
  uint8_t *v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t inited;
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
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void **v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void **v52;
  dispatch_semaphore_t v53;
  uint64_t v54;
  Class isa;
  _QWORD *v56;
  void *v57;
  _QWORD *v58;
  NSObject *v59;
  char *v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  _BOOL4 v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint8_t *v75;
  id v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  void **v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void **v84;
  void *v85;
  void **v86;
  void *v87;
  __SecCertificate *v88;
  __SecCertificate *v89;
  id v90;
  CFDataRef v91;
  unint64_t v92;
  unint64_t v93;
  CFDataRef v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  os_log_type_t v99;
  uint8_t *v100;
  uint64_t v101;
  _DWORD v103[4];
  char *v104;
  void **v105;
  void **v106;
  void **v107;
  NSObject *v108;
  void **v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  NSObject *v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void **v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id v127[5];
  _QWORD *v128;
  uint64_t v129;

  v122 = a3;
  v123 = a5;
  v121 = a4;
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for DispatchTime(0);
  v119 = *(_QWORD *)(v15 - 8);
  v120 = v15;
  v16 = __chkstk_darwin(v15);
  v117 = (char *)v103 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v118 = ((char *)v103 - v18);
  if (qword_1001AD210 != -1)
    swift_once(&qword_1001AD210, sub_100115468);
  v127[0] = 0;
  v19 = objc_msgSend((id)qword_1001B4F20, "canEvaluatePolicy:error:", 2, v127);
  v20 = v127[0];
  if (v19)
  {
    v116 = a6;
    v113 = v12;
    v112 = v127[0];
    v21 = DeviceIdentityUCRTAttestationSupported();
    v104 = v14;
    if ((v21 & 1) == 0)
    {
      if (qword_1001AD310 != -1)
        swift_once(&qword_1001AD310, sub_1001414EC);
      v22 = type metadata accessor for Logger(0);
      v23 = sub_100003A14(v22, (uint64_t)qword_1001B4228);
      v24 = Logger.logObject.getter(v23);
      v25 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = a2;
        v27 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "UCRT not supported, switching to SCRT", v27, 2u);
        v28 = v27;
        a2 = v26;
        swift_slowDealloc(v28, -1, -1);
      }

    }
    v103[3] = a2;
    v114 = v11;
    v29 = a7 / 60;
    v30 = sub_100003A2C(&qword_1001AE038);
    inited = swift_initStackObject(v30, &v129);
    *(_OWORD *)(inited + 16) = xmmword_100163CA0;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAAKeychainLabel);
    *(_QWORD *)(inited + 40) = v32;
    v115 = a1;
    v33 = UUID.uuidString.getter();
    *(_QWORD *)(inited + 72) = &type metadata for String;
    *(_QWORD *)(inited + 48) = v33;
    *(_QWORD *)(inited + 56) = v34;
    *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAAKeychainAccessGroup);
    *(_QWORD *)(inited + 88) = v35;
    *(_QWORD *)(inited + 120) = &type metadata for String;
    *(_QWORD *)(inited + 96) = 0xD000000000000017;
    *(_QWORD *)(inited + 104) = 0x800000010016B220;
    *(_QWORD *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAAIgnoreExistingKeychainItems);
    *(_QWORD *)(inited + 136) = v36;
    *(_QWORD *)(inited + 168) = &type metadata for Bool;
    *(_BYTE *)(inited + 144) = 0;
    *(_QWORD *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAANetworkTimeoutInterval);
    *(_QWORD *)(inited + 184) = v37;
    *(_QWORD *)(inited + 216) = &type metadata for Double;
    *(_QWORD *)(inited + 192) = 0x401C000000000000;
    *(_QWORD *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAAValidity);
    *(_QWORD *)(inited + 232) = v38;
    *(_QWORD *)(inited + 264) = &type metadata for Int;
    *(_QWORD *)(inited + 240) = v29;
    *(_QWORD *)(inited + 272) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAASCRTAttestation);
    *(_QWORD *)(inited + 280) = v39;
    *(_QWORD *)(inited + 312) = &type metadata for Bool;
    *(_BYTE *)(inited + 288) = v21 ^ 1;
    *(_QWORD *)(inited + 320) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAANonce);
    *(_QWORD *)(inited + 328) = v40;
    *(_QWORD *)(inited + 360) = &type metadata for Data;
    v41 = v123;
    v42 = v116;
    *(_QWORD *)(inited + 336) = v123;
    *(_QWORD *)(inited + 344) = v42;
    *(_QWORD *)(inited + 368) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAAAccessControls);
    *(_QWORD *)(inited + 376) = v43;
    type metadata accessor for SecAccessControl(0);
    *(_QWORD *)(inited + 408) = v44;
    v45 = v122;
    *(_QWORD *)(inited + 384) = v122;
    *(_QWORD *)(inited + 416) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsUseSoftwareGeneratedKey);
    *(_QWORD *)(inited + 424) = v46;
    *(_QWORD *)(inited + 456) = &type metadata for Int;
    *(_QWORD *)(inited + 432) = 0;
    *(_QWORD *)(inited + 464) = static String._unconditionallyBridgeFromObjectiveC(_:)(kMAOptionsBAAOIDSToInclude);
    *(_QWORD *)(inited + 472) = v47;
    *(_QWORD *)(inited + 504) = sub_100003A2C((uint64_t *)&unk_1001AE460);
    *(_QWORD *)(inited + 480) = v121;
    sub_100005D9C(v41, v42);
    v109 = v45;
    v48 = sub_1000047FC(inited);
    v49 = swift_allocObject(&unk_1001A0F20, 24, 7);
    *(_QWORD *)(v49 + 16) = 0;
    v108 = (v49 + 16);
    v50 = swift_allocObject(&unk_1001A0F70, 24, 7);
    *(_QWORD *)(v50 + 16) = 0;
    v107 = (void **)(v50 + 16);
    v51 = swift_allocObject(&unk_1001A0F98, 24, 7);
    *(_QWORD *)(v51 + 16) = 0;
    v106 = (void **)(v51 + 16);
    v52 = (void **)swift_allocObject(&unk_1001A0F98, 24, 7);
    v52[2] = 0;
    v105 = v52 + 2;
    v53 = dispatch_semaphore_create(0);
    v54 = sub_1001416D0(v48);
    swift_bridgeObjectRelease(v48);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v54);
    v56 = (_QWORD *)swift_allocObject(&unk_1001A0FC0, 56, 7);
    v56[2] = v53;
    v56[3] = v49;
    v56[4] = v50;
    v56[5] = v51;
    v56[6] = v52;
    v127[4] = sub_100143E50;
    v128 = v56;
    v127[0] = _NSConcreteStackBlock;
    v127[1] = (id)1107296256;
    v127[2] = sub_100142148;
    v127[3] = &unk_1001A0FD8;
    v57 = _Block_copy(v127);
    v58 = v128;
    v59 = v53;
    v110 = v49;
    swift_retain(v49);
    v111 = v50;
    swift_retain(v50);
    v121 = v51;
    swift_retain(v51);
    v122 = v52;
    swift_retain(v52);
    swift_release(v58);
    DeviceIdentityIssueClientCertificateWithCompletion(0, isa, v57);
    _Block_release(v57);

    v60 = v117;
    static DispatchTime.now()(v61);
    v62 = v118;
    + infix(_:_:)(v60);
    v63 = v120;
    v64 = *(void (**)(char *, uint64_t))(v119 + 8);
    v64(v60, v120);
    v65 = OS_dispatch_semaphore.wait(timeout:)(v62) & 1;
    v64((char *)v62, v63);
    if ((static DispatchTimeoutResult.== infix(_:_:)(v65, 1) & 1) != 0)
    {
      v66 = v59;
      if (qword_1001AD310 != -1)
        swift_once(&qword_1001AD310, sub_1001414EC);
      v67 = type metadata accessor for Logger(0);
      v68 = sub_100003A14(v67, (uint64_t)qword_1001B4228);
      v69 = Logger.logObject.getter(v68);
      v70 = static os_log_type_t.error.getter();
      v71 = os_log_type_enabled(v69, v70);
      v72 = v115;
      v73 = v116;
      v74 = v113;
      if (v71)
      {
        v75 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v75 = 0;
        _os_log_impl((void *)&_mh_execute_header, v69, v70, "Time out requesting BAA certificate.", v75, 2u);
        swift_slowDealloc(v75, -1, -1);
      }

      v20 = sub_10002460C(10002, 0xD000000000000023, (void *)0x8000000100172FE0, 0);
      swift_willThrow(v20);
      sub_100005DE0(v123, v73);

      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v72, v114);
    }
    else
    {
      v20 = v108;
      swift_beginAccess(v108, v127, 0, 0);
      if (v20->isa)
      {
        v79 = swift_errorRetain(v20->isa);
        swift_willThrow(v79);
        sub_100005DE0(v123, v116);

        (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v115, v114);
      }
      else
      {
        v80 = v107;
        swift_beginAccess(v107, &v126, 0, 0);
        v81 = *v80;
        v82 = v115;
        v83 = v113;
        if (v81)
        {
          v84 = v106;
          swift_beginAccess(v106, &v125, 0, 0);
          v85 = *v84;
          if (v85)
          {
            v86 = v105;
            swift_beginAccess(v105, &v124, 0, 0);
            v87 = *v86;
            if (*v86)
            {
              v118 = v59;
              v88 = v87;
              v89 = v85;
              v90 = v81;
              v91 = SecCertificateCopyData(v89);
              v120 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v91);
              v93 = v92;

              v94 = SecCertificateCopyData(v88);
              v95 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v94);

              v119 = v93;
              v96 = (char *)&loc_100143254 + 4 * byte_100163CB0[v93 >> 62];
              v117 = (char *)v95;
              __asm { BR              X10 }
            }
          }
        }
        if (qword_1001AD310 != -1)
          swift_once(&qword_1001AD310, sub_1001414EC);
        v97 = type metadata accessor for Logger(0);
        v98 = sub_100003A14(v97, (uint64_t)qword_1001B4228);
        v20 = Logger.logObject.getter(v98);
        v99 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v20, v99))
        {
          v100 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v100 = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, v99, "Unexpected nil value after receiving BAA certificate", v100, 2u);
          swift_slowDealloc(v100, -1, -1);
        }

        v101 = sub_10002460C(10002, 0xD000000000000014, (void *)0x8000000100172FC0, 0);
        swift_willThrow(v101);
        sub_100005DE0(v123, v116);

        (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v82, v114);
      }
    }

    swift_release(v110);
    swift_release(v111);
    swift_release(v121);
    swift_release(v122);
  }
  else
  {
    v76 = v127[0];
    swift_bridgeObjectRelease(v121);
    v77 = v76;
    sub_10002460C(10003, 0xD000000000000014, (void *)0x8000000100170ED0, (uint64_t)v20);

    swift_willThrow(v78);
    sub_100005DE0(v123, a6);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  }
  return v20;
}

uint64_t sub_1001436D4(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v7;

  if (a1 == 1684632949 && a2 == 0xE400000000000000)
  {
    v5 = 0xE400000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1684632949, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x73656D695479656BLL && a2 == 0xEC000000706D6174)
  {
    swift_bridgeObjectRelease(0xEC000000706D6174);
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73656D695479656BLL, 0xEC000000706D6174, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

NSObject *sub_1001437CC(_QWORD *a1)
{
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  __n128 v28;
  uint64_t v29;
  NSObject *result;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void **v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  NSObject *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  _QWORD *v57;
  NSObject *v58;
  uint64_t v59;
  _QWORD *v60;
  char *v61;
  char v62;
  char *v63;
  char v64;

  v59 = type metadata accessor for DecodingError(0);
  v56 = *(_QWORD *)(v59 - 8);
  v2 = __chkstk_darwin(v59);
  v55 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v58 = ((char *)&v52 - v4);
  v5 = sub_100003A2C((uint64_t *)&unk_1001B36F0);
  __chkstk_darwin(v5);
  v57 = (char **)((char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v54 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v54 - 8);
  v8 = __chkstk_darwin(v54);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v52 - v11;
  v13 = sub_100003A2C(&qword_1001B4350);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1[3];
  v18 = a1[4];
  v60 = a1;
  sub_100005EF8(a1, v17);
  v19 = sub_100143DA4();
  v20 = v61;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for BAASigningIdentity.CodingKeys, &type metadata for BAASigningIdentity.CodingKeys, v19, v17, v18);
  if (v20)
  {
    v51 = v58;
    v63 = v20;
    swift_errorRetain();
    v44 = sub_100003A2C((uint64_t *)&unk_1001B1280);
    v45 = v59;
    if (swift_dynamicCast(v51, &v63, v44, v59, 0))
    {
      swift_errorRelease();
      v47 = v55;
      v46 = v56;
      (*(void (**)(char *, NSObject *, uint64_t))(v56 + 32))(v55, v51, v45);
      v51 = swift_allocError(v45, &protocol witness table for DecodingError, 0, 0);
      (*(void (**)(uint64_t, char *, uint64_t))(v46 + 16))(v48, v47, v45);
      sub_10002460C(10005, 0xD000000000000010, (void *)0x8000000100170EB0, (uint64_t)v51);
      v49 = swift_errorRelease();
      swift_willThrow(v49);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v45);
    }
    v50 = v60;
    swift_errorRelease();
    sub_100005D3C(v50);
    return v51;
  }
  v52 = v10;
  v53 = v7;
  v61 = v12;
  LOBYTE(v63) = 0;
  v21 = sub_100005F1C(&qword_1001B16D0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v22 = v54;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v57, v54, &v63, v13, v54, v21);
  v23 = v53;
  v24 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v53 + 48))(v57, 1, v22);
  v25 = v14;
  v26 = v61;
  if ((_DWORD)v24 == 1)
  {
    UUID.init()(v24);
    sub_100124874((uint64_t)v57);
  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v23 + 32))(v61, v57, v22);
  }
  v62 = 1;
  v27 = sub_100129F2C();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v63, &type metadata for SPRTimestamp, &v62, v13, &type metadata for SPRTimestamp, v27);
  if ((v64 & 1) == 0)
  {
    v34 = (int)v63;
LABEL_21:
    v37 = v26;
    v38 = v22;
    (*(void (**)(char *, char *, uint64_t, __n128))(v23 + 16))(v52, v37, v22, v28);
    if (qword_1001AD320 != -1)
      swift_once(&qword_1001AD320, sub_100141628);
    v39 = qword_1001AD318;
    v40 = (void **)(id)qword_1001B5010;
    if (v39 != -1)
      swift_once(&qword_1001AD318, sub_10014157C);
    v41 = qword_1001B5008;
    swift_bridgeObjectRetain();
    v42 = static Data.randomBytes(count:)(0x10uLL);
    v51 = sub_1001429CC((uint64_t)v52, v34, v40, v41, v42, v43, 600000);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v61, v38);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v13);
    sub_100005D3C(v60);
    return v51;
  }
  if (qword_1001AD308 != -1)
    swift_once(&qword_1001AD308, sub_10013E994);
  v29 = static GlobalState.shared;
  result = objc_msgSend(*(id *)(static GlobalState.shared + 72), "lock");
  while (*(uint64_t *)(v29 + 96) > 0 || *(_BYTE *)(v29 + 80) == 1)
    result = objc_msgSend(*(id *)(v29 + 72), "wait");
  v31 = *(_QWORD *)(v29 + 88);
  v32 = __OFADD__(v31, 1);
  v33 = v31 + 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v29 + 88) = v33;
    objc_msgSend(*(id *)(v29 + 72), "unlock");
    if (*(_BYTE *)(v29 + 56))
      v34 = 0;
    else
      v34 = *(_DWORD *)(v29 + 52);
    result = objc_msgSend(*(id *)(v29 + 72), "lock");
    v35 = *(_QWORD *)(v29 + 88);
    v32 = __OFSUB__(v35, 1);
    v36 = v35 - 1;
    if (!v32)
    {
      *(_QWORD *)(v29 + 88) = v36;
      if (!v36)
        objc_msgSend(*(id *)(v29 + 72), "broadcast");
      v28.n128_f64[0] = TMGetKernelMonotonicClock(objc_msgSend(*(id *)(v29 + 72), "unlock"));
      v23 = v53;
      v26 = v61;
      goto LABEL_21;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_100143DA4()
{
  unint64_t result;

  result = qword_1001B4358;
  if (!qword_1001B4358)
  {
    result = swift_getWitnessTable(&unk_100163E80, &type metadata for BAASigningIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B4358);
  }
  return result;
}

uint64_t sub_100143DE8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100143E0C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100143E50(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_100141A94(a1, a2, a3, v3[2], v3[3], v3[4], v3[5], v3[6]);
}

uint64_t storeEnumTagSinglePayload for BAASigningIdentity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100143EAC + 4 * byte_100163CBD[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100143EE0 + 4 * byte_100163CB8[v4]))();
}

uint64_t sub_100143EE0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100143EE8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100143EF0);
  return result;
}

uint64_t sub_100143EFC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100143F04);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100143F08(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100143F10(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BAASigningIdentity.CodingKeys()
{
  return &type metadata for BAASigningIdentity.CodingKeys;
}

unint64_t sub_100143F30()
{
  unint64_t result;

  result = qword_1001B4370;
  if (!qword_1001B4370)
  {
    result = swift_getWitnessTable(&unk_100163E58, &type metadata for BAASigningIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B4370);
  }
  return result;
}

unint64_t sub_100143F78()
{
  unint64_t result;

  result = qword_1001B4378;
  if (!qword_1001B4378)
  {
    result = swift_getWitnessTable(&unk_100163DC8, &type metadata for BAASigningIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B4378);
  }
  return result;
}

unint64_t sub_100143FC0()
{
  unint64_t result;

  result = qword_1001B4380;
  if (!qword_1001B4380)
  {
    result = swift_getWitnessTable(&unk_100163DF0, &type metadata for BAASigningIdentity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001B4380);
  }
  return result;
}

uint64_t *PrimaryAccountWatcher.shared.unsafeMutableAddressor()
{
  if (qword_1001AD330 != -1)
    swift_once(&qword_1001AD330, sub_1001441C8);
  return &static PrimaryAccountWatcher.shared;
}

uint64_t sub_100144050()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_1000039D4(v0, qword_1001B4390);
  v1 = sub_100003A14(v0, (uint64_t)qword_1001B4390);
  if (qword_1001AD158 != -1)
    swift_once(&qword_1001AD158, sub_1000CC540);
  v2 = sub_100003A14(v0, (uint64_t)qword_1001B4DF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_1001440E0()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t result;
  unsigned __int8 v4;
  _OWORD v5[2];
  _BYTE v6[24];
  uint64_t v7;

  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "accountPropertyForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v5, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_100007AE8((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    result = swift_dynamicCast(&v4, v6, (char *)&type metadata for Any + 8, &type metadata for Bool, 6);
    if ((_DWORD)result)
      return v4;
  }
  else
  {
    sub_100007B30((uint64_t)v6);
    return 0;
  }
  return result;
}

id sub_1001441C8()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PrimaryAccountWatcher()), "init");
  static PrimaryAccountWatcher.shared = (uint64_t)result;
  return result;
}

id static PrimaryAccountWatcher.shared.getter()
{
  if (qword_1001AD330 != -1)
    swift_once(&qword_1001AD330, sub_1001441C8);
  return (id)static PrimaryAccountWatcher.shared;
}

void sub_100144234()
{
  _BYTE *v0;
  _QWORD *v1;
  objc_class *v2;
  id v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  id v7;
  _TtC14softposreaderd12RemoteReader *v8;
  id v9;
  char *v10;
  Class isa;
  SEL v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  id v27;
  _QWORD v28[5];
  uint64_t v29;
  char v30[48];
  objc_super v31;

  v0[OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_isSandboxAccount] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_store] = 0;
  v1 = &v0[OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler];
  v2 = (objc_class *)type metadata accessor for PrimaryAccountWatcher();
  *v1 = 0;
  v1[1] = 0;
  v31.receiver = v0;
  v31.super_class = v2;
  v3 = objc_msgSendSuper2(&v31, "init");
  v4 = sub_100003A2C((uint64_t *)&unk_1001AE410);
  inited = swift_initStackObject(v4, v30);
  *(_OWORD *)(inited + 16) = xmmword_10015A5F0;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(ACAccountTypeIdentifierAppleAccount);
  *(_QWORD *)(inited + 40) = v6;
  v7 = v3;
  v8 = (_TtC14softposreaderd12RemoteReader *)sub_100144F68(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 1, &type metadata for String);
  v9 = objc_allocWithZone((Class)ACMonitoredAccountStore);
  v10 = (char *)v7;
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8, v12, v13, v14, v15, v16, v17, v18);
  v19 = objc_msgSend(v9, "initWithAccountTypes:delegate:", isa, v10);

  v20 = OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_store;
  v21 = *(void **)&v10[OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_store];
  *(_QWORD *)&v10[OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_store] = v19;

  v22 = *(void **)&v10[v20];
  if (v22)
  {
    v23 = swift_allocObject(&unk_1001A1168, 24, 7);
    *(_QWORD *)(v23 + 16) = v10;
    v28[4] = sub_10014512C;
    v29 = v23;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 1107296256;
    v28[2] = sub_100144920;
    v28[3] = &unk_1001A1180;
    v24 = _Block_copy(v28);
    v25 = v29;
    v26 = v10;
    v27 = v22;
    swift_release(v25);
    objc_msgSend(v27, "registerWithCompletion:", v24);

    _Block_release(v24);
  }
  else
  {
    __break(1u);
  }
}

void sub_100144434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  _TtC14softposreaderd12RemoteReader *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SEL v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  const char *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  _TtC14softposreaderd12RemoteReader *v46;
  SEL v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  const char *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  uint64_t v69;
  SEL v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  NSObject *oslog;
  uint64_t v78;
  uint64_t v79;

  if (!a1)
  {
    v37 = a2;
    if (!a2)
    {
      if (qword_1001AD328 != -1)
        swift_once(&qword_1001AD328, sub_100144050);
      v64 = type metadata accessor for Logger(0);
      v65 = sub_100003A14(v64, (uint64_t)qword_1001B4390);
      oslog = Logger.logObject.getter(v65);
      v66 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(oslog, v66))
      {
        v67 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v67 = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, v66, "No monitored accounts", v67, 2u);
        swift_slowDealloc(v67, -1, -1);
      }
LABEL_22:

      return;
    }
    swift_errorRetain();
    if (qword_1001AD328 == -1)
    {
LABEL_8:
      v38 = type metadata accessor for Logger(0);
      sub_100003A14(v38, (uint64_t)qword_1001B4390);
      swift_errorRetain();
      v39 = swift_errorRetain();
      oslog = Logger.logObject.getter(v39);
      v40 = static os_log_type_t.error.getter(oslog);
      if (os_log_type_enabled(oslog, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc(12, -1);
        v42 = swift_slowAlloc(32, -1);
        v78 = v37;
        v79 = v42;
        *(_DWORD *)v41 = 136315138;
        swift_errorRetain();
        v43 = sub_100003A2C((uint64_t *)&unk_1001B1280);
        v44 = String.init<A>(describing:)(&v78, v43);
        v46 = (_TtC14softposreaderd12RemoteReader *)v45;
        v78 = sub_1000056EC(v44, v45, &v79);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79, v41 + 4, v41 + 12);
        swift_bridgeObjectRelease(v46, v47, v48, v49, v50, v51, v52, v53);
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, oslog, v40, "Could not register store: %s", v41, 0xCu);
        swift_arrayDestroy(v42, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v42, -1, -1);
        swift_slowDealloc(v41, -1, -1);

        swift_errorRelease();
        return;
      }
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
      goto LABEL_22;
    }
LABEL_31:
    swift_once(&qword_1001AD328, sub_100144050);
    goto LABEL_8;
  }
  v5 = qword_1001AD328;
  swift_bridgeObjectRetain();
  if (v5 != -1)
    swift_once(&qword_1001AD328, sub_100144050);
  v6 = type metadata accessor for Logger(0);
  sub_100003A14(v6, (uint64_t)qword_1001B4390);
  v7 = swift_bridgeObjectRetain_n(a1, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v79 = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = sub_10014514C();
    v13 = swift_bridgeObjectRetain();
    v14 = Array.description.getter(v13, v12);
    v16 = (_TtC14softposreaderd12RemoteReader *)v15;
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a1, v15, v17, v18, v19, v20, v21, v22);
    v78 = sub_1000056EC(v14, (unint64_t)v16, &v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v16, v23, v24, v25, v26, v27, v28, v29);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Monitored accounts: %s)", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a1, 2);
  }
  v37 = a1 & 0xFFFFFFFFFFFFFF8;
  if (!((unint64_t)a1 >> 62))
  {
    if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_13;
LABEL_27:
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a1, v30, v31, v32, v33, v34, v35, v36);
    v63 = 0;
    goto LABEL_28;
  }
  if (a1 >= 0)
    v68 = a1 & 0xFFFFFFFFFFFFFF8;
  else
    v68 = a1;
  swift_bridgeObjectRetain();
  v69 = _CocoaArrayWrapper.endIndex.getter(v68);
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a1, v70, v71, v72, v73, v74, v75, v76);
  if (!v69)
    goto LABEL_27;
LABEL_13:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v54 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
    goto LABEL_16;
  }
  if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_31;
  }
  v54 = *(id *)(a1 + 32);
LABEL_16:
  v62 = v54;
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a1, v55, v56, v57, v58, v59, v60, v61);
  v63 = sub_1001440E0();

LABEL_28:
  *(_BYTE *)(a3 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_isSandboxAccount) = v63 & 1;
}

void sub_100144920(uint64_t a1, _TtC14softposreaderd12RemoteReader *a2, void *a3)
{
  _TtC14softposreaderd12RemoteReader *v4;
  uint64_t v5;
  void (*v6)(_TtC14softposreaderd12RemoteReader *, void *);
  unint64_t v7;
  id v8;
  SEL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v4 = a2;
  v6 = *(void (**)(_TtC14softposreaderd12RemoteReader *, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v7 = sub_10014514C();
    v4 = (_TtC14softposreaderd12RemoteReader *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v7);
  }
  swift_retain();
  v8 = a3;
  v6(v4, a3);
  swift_release(v5);

  swift_bridgeObjectRelease(v4, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t PrimaryAccountWatcher.activate(changeHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler);
  v5 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler + 8);
  *v3 = a1;
  v3[1] = a2;
  swift_retain();
  return sub_10004B5D0(v4, v5);
}

Swift::Void __swiftcall PrimaryAccountWatcher.accountWasAdded(_:)(ACAccount a1)
{
  sub_100144C98(a1.super.isa, "accountWasAdded(%@)");
}

Swift::Void __swiftcall PrimaryAccountWatcher.accountWasRemoved(_:)(ACAccount a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  objc_class *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  objc_class **v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  uint64_t v17;

  v2 = v1;
  if (qword_1001AD328 != -1)
    swift_once(&qword_1001AD328, sub_100144050);
  v4 = type metadata accessor for Logger(0);
  sub_100003A14(v4, (uint64_t)qword_1001B4390);
  v5 = a1.super.isa;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (objc_class **)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v16 = v5;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v8 + 4, v8 + 12);
    *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "accountWasRemoved(%@)", v8, 0xCu);
    v11 = sub_100003A2C((uint64_t *)&unk_1001AE430);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_isSandboxAccount) == 1)
  {
    *(_BYTE *)(v2 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_isSandboxAccount) = 0;
    v12 = v2 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler;
    v13 = *(void (**)(uint64_t))(v2 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler);
    if (v13)
    {
      v14 = *(_QWORD *)(v12 + 8);
      v15 = swift_retain();
      v13(v15);
      sub_10004B5D0((uint64_t)v13, v14);
    }
  }
}

Swift::Void __swiftcall PrimaryAccountWatcher.accountWasModified(_:)(ACAccount a1)
{
  sub_100144C98(a1.super.isa, "accountWasModified(%@)");
}

uint64_t sub_100144C98(void *a1, char *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  char *format;
  id v20;
  uint64_t v21;

  v4 = v2;
  if (qword_1001AD328 != -1)
    swift_once(&qword_1001AD328, sub_100144050);
  v6 = type metadata accessor for Logger(0);
  sub_100003A14(v6, (uint64_t)qword_1001B4390);
  v7 = a1;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    format = a2;
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 138412290;
    v20 = v7;
    v12 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v10 + 4, v10 + 12);
    *v11 = v7;

    _os_log_impl((void *)&_mh_execute_header, v8, v9, format, v10, 0xCu);
    v13 = sub_100003A2C((uint64_t *)&unk_1001AE430);
    swift_arrayDestroy(v11, 1, v13);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

  }
  result = sub_1001440E0();
  if ((result & 1) != *(_BYTE *)(v4 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_isSandboxAccount))
  {
    *(_BYTE *)(v4 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_isSandboxAccount) = result & 1;
    v15 = v4 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler;
    v16 = *(void (**)(uint64_t))(v4 + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler);
    if (v16)
    {
      v17 = *(_QWORD *)(v15 + 8);
      v18 = swift_retain();
      v16(v18);
      return sub_10004B5D0((uint64_t)v16, v17);
    }
  }
  return result;
}

id PrimaryAccountWatcher.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PrimaryAccountWatcher();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PrimaryAccountWatcher()
{
  return objc_opt_self(_TtC9SPREngine21PrimaryAccountWatcher);
}

Swift::Int sub_100144F68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  _TtC14softposreaderd12RemoteReader *v7;
  uint64_t v8;
  Swift::Int result;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  const char *v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100003A2C(&qword_1001B4468);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v32 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v32 + 16 * v4);
      v8 = *v6;
      v7 = (_TtC14softposreaderd12RemoteReader *)v6[1];
      Hasher.init(_seed:)(v33);
      swift_bridgeObjectRetain();
      String.hash(into:)(v33, v8, v7);
      result = Hasher._finalize()();
      v16 = -1 << *(_BYTE *)(v3 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      v19 = *(_QWORD *)(v5 + 8 * (v17 >> 6));
      v20 = 1 << v17;
      if (((1 << v17) & v19) != 0)
      {
        v21 = *(_QWORD *)(v3 + 48);
        v22 = (_QWORD *)(v21 + 16 * v17);
        v23 = (const char *)v22[1];
        v24 = *v22 == v8 && v23 == (const char *)v7;
        if (v24 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v22, v23, v8, v7, 0), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7, v23, v10, v11, v12, v13, v14, v15);
          goto LABEL_4;
        }
        v25 = ~v16;
        while (1)
        {
          v17 = (v17 + 1) & v25;
          v18 = v17 >> 6;
          v19 = *(_QWORD *)(v5 + 8 * (v17 >> 6));
          v20 = 1 << v17;
          if ((v19 & (1 << v17)) == 0)
            break;
          v26 = (_QWORD *)(v21 + 16 * v17);
          v23 = (const char *)v26[1];
          if (*v26 != v8 || v23 != (const char *)v7)
          {
            result = _stringCompareWithSmolCheck(_:_:expecting:)(*v26, v23, v8, v7, 0);
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v18) = v20 | v19;
      v28 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v17);
      *v28 = v8;
      v28[1] = v7;
      v29 = *(_QWORD *)(v3 + 16);
      v30 = __OFADD__(v29, 1);
      v31 = v29 + 1;
      if (v30)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v31;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_100145108()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10014512C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100144434(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_100145134(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100145144(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10014514C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1001B4458;
  if (!qword_1001B4458)
  {
    v1 = objc_opt_self(ACAccount);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1001B4458);
  }
  return result;
}

uint64_t sub_100145188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_1000039D4(v0, qword_1001B4470);
  v1 = sub_100003A14(v0, (uint64_t)qword_1001B4470);
  if (qword_1001AD158 != -1)
    swift_once(&qword_1001AD158, sub_1000CC540);
  v2 = sub_100003A14(v0, (uint64_t)qword_1001B4DF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_100145218()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  unsigned int v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  unint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  unint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  unint64_t v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t v49;
  id v51;
  uint64_t v52;

  v1 = v0;
  *(_BYTE *)(v0 + 32) = 0;
  v2 = objc_msgSend((id)objc_opt_self(NFHardwareManager), "sharedHardwareManager");
  if (!v2)
    __break(1u);
  v3 = v2;
  v4 = objc_msgSend(v2, "getHwSupport");

  if (v4 != 2)
  {
    if (qword_1001AD338 != -1)
      swift_once(&qword_1001AD338, sub_100145188);
    v16 = type metadata accessor for Logger(0);
    v17 = sub_100003A14(v16, (uint64_t)qword_1001B4470);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "hw not supported at the moment. hw might recover later.", v20, 2u);
      swift_slowDealloc(v20, -1, -1);
    }

    v21 = sub_1001459A8();
    v22 = swift_allocError(&type metadata for SecureElementError, v21, 0, 0);
    *v23 = 0;
    swift_willThrow(v22);
    goto LABEL_30;
  }
  v51 = 0;
  v5 = objc_msgSend((id)objc_opt_self(NFSecureElement), "embeddedSecureElementWithError:", &v51);
  v6 = v51;
  if (!v5)
  {
    v24 = v51;
    v25 = _convertNSErrorToError(_:)(v6);

    swift_willThrow(v26);
    if (qword_1001AD338 != -1)
      swift_once(&qword_1001AD338, sub_100145188);
    v27 = type metadata accessor for Logger(0);
    sub_100003A14(v27, (uint64_t)qword_1001B4470);
    swift_errorRetain(v25);
    v28 = swift_errorRetain(v25);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(12, -1);
      v32 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v31 = 138412290;
      swift_errorRetain(v25);
      v33 = (void *)_swift_stdlib_bridgeErrorToNSError(v25);
      v51 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v31 + 4, v31 + 12);
      *v32 = v33;
      swift_errorRelease(v25);
      swift_errorRelease(v25);
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Could not get Secure Element, error from embeddedSecureElementWithError(): %@", v31, 0xCu);
      v34 = sub_100003A2C((uint64_t *)&unk_1001AE430);
      swift_arrayDestroy(v32, 1, v34);
      swift_slowDealloc(v32, -1, -1);
      swift_slowDealloc(v31, -1, -1);
    }
    else
    {
      swift_errorRelease(v25);
      swift_errorRelease(v25);
    }

    v38 = sub_1001459A8();
    v39 = swift_allocError(&type metadata for SecureElementError, v38, 0, 0);
    *v40 = 1;
    swift_willThrow(v39);
    swift_errorRelease(v25);
    goto LABEL_30;
  }
  v7 = v5;
  *(_QWORD *)(v1 + 16) = v5;
  v8 = v6;
  v9 = objc_msgSend(v7, "serialNumber");
  if (!v9)
    goto LABEL_28;

  v10 = objc_msgSend(*(id *)(v1 + 16), "info");
  if (!v10)
  {
    if (qword_1001AD338 != -1)
      swift_once(&qword_1001AD338, sub_100145188);
    v41 = type metadata accessor for Logger(0);
    v42 = sub_100003A14(v41, (uint64_t)qword_1001B4470);
    v43 = Logger.logObject.getter(v42);
    v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Could not get hardware Secure Element info.", v45, 2u);
      swift_slowDealloc(v45, -1, -1);
    }

LABEL_28:
    v46 = sub_1001459A8();
    v47 = swift_allocError(&type metadata for SecureElementError, v46, 0, 0);
    *v48 = 2;
    swift_willThrow(v47);
    goto LABEL_29;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, "platformIdentifier");
  if (!v12
    || (v12, (v13 = objc_msgSend(v11, "ecdsaCertificate")) == 0)
    || (v13,
        v14 = objc_msgSend(v11, "sequenceCounter"),
        v14,
        !v14)
    || (v15 = objc_msgSend(v11, "expectedSequenceCounter"), v15, !v15))
  {
    v35 = sub_1001459A8();
    v36 = swift_allocError(&type metadata for SecureElementError, v35, 0, 0);
    *v37 = 2;
    swift_willThrow(v36);

LABEL_29:
LABEL_30:
    v49 = type metadata accessor for SecureElement();
    swift_deallocPartialClassInstance(v1, v49, 33, 7);
    return v1;
  }
  *(_QWORD *)(v1 + 24) = v11;
  return v1;
}

id sub_1001457B8()
{
  uint64_t v0;
  void *v1;
  id result;
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  __int16 v12;
  __int16 v13;
  uint64_t v14;

  v1 = *(void **)(v0 + 24);
  result = objc_msgSend(v1, "sequenceCounter");
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  v3 = result;
  v4 = objc_msgSend(result, "unsignedShortValue");

  result = objc_msgSend(v1, "expectedSequenceCounter");
  if (!result)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v5 = result;
  v6 = objc_msgSend(result, "unsignedShortValue");

  if (qword_1001AD338 != -1)
    swift_once(&qword_1001AD338, sub_100145188);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_100003A14(v7, (uint64_t)qword_1001B4470);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc(10, -1);
    *(_DWORD *)v11 = 33554944;
    v13 = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v11 + 4, v11 + 6);
    *(_WORD *)(v11 + 6) = 512;
    v12 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v11 + 8, v11 + 10);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Current sequence counter: %hu, expected: %hu", (uint8_t *)v11, 0xAu);
    swift_slowDealloc(v11, -1, -1);
  }

  return (id)(v4 >= v6);
}

uint64_t sub_100145950()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 33, 7);
}

uint64_t type metadata accessor for SecureElement()
{
  return objc_opt_self(_TtC9SPREngine13SecureElement);
}

uint64_t sub_10014599C(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 32) = result;
  return result;
}

unint64_t sub_1001459A8()
{
  unint64_t result;

  result = qword_1001B45B0;
  if (!qword_1001B45B0)
  {
    result = swift_getWitnessTable(&unk_100163FDC, &type metadata for SecureElementError);
    atomic_store(result, (unint64_t *)&qword_1001B45B0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SecureElementError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100145A38 + 4 * byte_100163EF5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100145A6C + 4 * asc_100163EF0[v4]))();
}

uint64_t sub_100145A6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100145A74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100145A7CLL);
  return result;
}

uint64_t sub_100145A88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100145A90);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100145A94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100145A9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SecureElementError()
{
  return &type metadata for SecureElementError;
}

unint64_t sub_100145ABC()
{
  unint64_t result;

  result = qword_1001B45B8;
  if (!qword_1001B45B8)
  {
    result = swift_getWitnessTable(&unk_100163FB4, &type metadata for SecureElementError);
    atomic_store(result, (unint64_t *)&qword_1001B45B8);
  }
  return result;
}

uint64_t BitString.data.getter(uint64_t a1, unint64_t a2)
{
  sub_100005D9C(a1, a2);
  return a1;
}

uint64_t BitString.unusedBits.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t BitString.derRepresentation.getter(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  unint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v6 = sub_100003A2C(&qword_1001AC678);
  v7 = swift_allocObject(v6, 33, 7);
  *(_OWORD *)(v7 + 16) = xmmword_10015A5F0;
  *(_BYTE *)(v7 + 32) = a3;
  v8 = sub_10010DD5C(v7);
  v10 = (unint64_t)v9;
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v7, v9, v11, v12, v13, v14, v15, v16);
  sub_100005D9C(a1, a2);
  sub_100005D9C(v8, v10);
  sub_10012465C(a1, a2);
  sub_100005DE0(a1, a2);
  sub_100005DE0(v8, v10);
  return v8;
}

uint64_t sub_100145BFC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[5];
  int v16;
  __int128 v17[2];
  uint64_t v18;
  _OWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = sub_100003A2C(&qword_1001B4688);
  __chkstk_darwin(v2);
  v3 = sub_100003A2C(&qword_1001B4690);
  v4 = __chkstk_darwin(v3);
  __chkstk_darwin(v4);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 24);
  v15[4] = *(_QWORD *)(a1 + 16);
  v16 = *(unsigned __int8 *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_OWORD *)(a1 + 16);
  v19[0] = *(_OWORD *)a1;
  v19[1] = v9;
  v19[2] = *(_OWORD *)(a1 + 32);
  sub_100148034(a1);
  v10 = sub_100003A2C(&qword_1001B4698);
  v11 = sub_100003A2C(&qword_1001B2B38);
  if (!swift_dynamicCast(v17, v19, v10, v11, 6))
  {
    v18 = 0;
    memset(v17, 0, sizeof(v17));
    sub_10005218C((uint64_t)v17, &qword_1001B2B40);
    v15[2] = v15;
    v19[0] = xmmword_10015DF40;
    v15[3] = v8;
    __asm { BR              X10 }
  }
  sub_10001A674(v17, (uint64_t)&v20);
  v12 = v21;
  v13 = v22;
  sub_100005EF8(&v20, v21);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(v17, sub_10010C830, 0, &type metadata for Data._Representation, v12, v13);
  sub_100005DE0(v5, v6);
  swift_release(v7);
  v19[0] = v17[0];
  sub_100005D3C(&v20);
  return *(_QWORD *)&v19[0];
}

uint64_t sub_100146144(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[9];
  uint64_t v18;
  __int128 v19[2];
  uint64_t v20;
  _OWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v2 = sub_100003A2C(&qword_1001B4668);
  __chkstk_darwin(v2);
  v18 = sub_100003A2C(&qword_1001B4670);
  v3 = __chkstk_darwin(v18);
  __chkstk_darwin(v3);
  v5 = (char *)v17 - v4;
  v7 = *a1;
  v6 = a1[1];
  v8 = a1[3];
  v17[8] = a1[2];
  v10 = a1[4];
  v9 = a1[5];
  v11 = *((_OWORD *)a1 + 1);
  v21[0] = *(_OWORD *)a1;
  v21[1] = v11;
  v21[2] = *((_OWORD *)a1 + 2);
  sub_100147FE8((uint64_t)a1);
  v12 = sub_100003A2C(&qword_1001B4678);
  v13 = sub_100003A2C(&qword_1001B2B38);
  if (!swift_dynamicCast(v19, v21, v12, v13, 6))
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    sub_10005218C((uint64_t)v19, &qword_1001B2B40);
    v17[3] = v17;
    v21[0] = xmmword_10015DF40;
    v17[4] = v10;
    v17[5] = v5;
    v17[6] = v9;
    v17[7] = v8;
    __asm { BR              X10 }
  }
  sub_10001A674(v19, (uint64_t)&v22);
  v14 = v23;
  v15 = v24;
  sub_100005EF8(&v22, v23);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(v19, sub_10010C830, 0, &type metadata for Data._Representation, v14, v15);
  sub_100005DE0(v7, v6);
  swift_release(v9);
  swift_release(v8);
  v21[0] = v19[0];
  sub_100005D3C(&v22);
  return *(_QWORD *)&v21[0];
}

uint64_t sub_1001466C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  __int128 v15;
  __int128 v16[2];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_QWORD *)&v15 = a1;
  swift_bridgeObjectRetain();
  v1 = sub_100003A2C(&qword_1001B4660);
  v2 = sub_100003A2C(&qword_1001B2B38);
  if (!swift_dynamicCast(v16, &v15, v1, v2, 6))
  {
    v17 = 0;
    memset(v16, 0, sizeof(v16));
    sub_10005218C((uint64_t)v16, &qword_1001B2B40);
    *(_QWORD *)&v16[0] = sub_10010DCC0(*(_QWORD *)(a1 + 16));
    *((_QWORD *)&v16[0] + 1) = v12;
    __chkstk_darwin(*(_QWORD *)&v16[0]);
    sub_100147048();
    __asm { BR              X12 }
  }
  sub_10001A674(v16, (uint64_t)&v18);
  v3 = v19;
  v4 = v20;
  sub_100005EF8(&v18, v19);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(&v15, sub_10010C830, 0, &type metadata for Data._Representation, v3, v4);
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a1, v5, v6, v7, v8, v9, v10, v11);
  v16[0] = v15;
  sub_100005D3C(&v18);
  return *(_QWORD *)&v16[0];
}

void sub_1001469EC(uint64_t *a1)
{
  _s7SPRBase9BitStringV23__derived_struct_equalsySbAC_ACtFZ_0(*a1, a1[1]);
}

unint64_t sub_100146A08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = sub_100003A2C(&qword_1001B4650);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v23 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v23);
    return (unint64_t)v8;
  }
  sub_100003A2C(&qword_1001B4658);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_100147C04(v13, (uint64_t)v5);
    result = sub_1001474DC((uint64_t)v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v18 = v8[6];
    v19 = type metadata accessor for CodingUserInfoKey(0);
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v5, v19);
    result = (unint64_t)sub_100005D2C(v10, (_OWORD *)(v8[7] + 32 * v17));
    v20 = v8[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_12;
    v8[2] = v22;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v23 = v25;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t default argument 0 of IteratorProtocol<>.nextBitString(tag:)()
{
  return 3;
}

uint64_t default argument 0 of IteratorProtocol<>.nextOctetString(tag:)()
{
  return 4;
}

uint64_t default argument 0 of IteratorProtocol<>.nextOID(tag:)()
{
  return 6;
}

uint64_t static TLVTag.asn1UTF8String.getter()
{
  return 12;
}

uint64_t default argument 0 of IteratorProtocol<>.nextNull(tag:)()
{
  return 5;
}

uint64_t default argument 1 of static JSONEncoder.encodeClean<A>(_:outputFormatting:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;

  v0 = type metadata accessor for JSONEncoder.OutputFormatting(0);
  v5 = _swiftEmptyArrayStorage;
  v1 = sub_100005F1C(&qword_1001B4638, (uint64_t (*)(uint64_t))&type metadata accessor for JSONEncoder.OutputFormatting, (uint64_t)&protocol conformance descriptor for JSONEncoder.OutputFormatting);
  v2 = sub_100003A2C(&qword_1001B4640);
  v3 = sub_100030828(&qword_1001B4648, &qword_1001B4640, (uint64_t)&protocol conformance descriptor for [A]);
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v5, v2, v3, v0, v1);
}

unint64_t default argument 2 of static JSONDecoder.decodeClean<A>(_:from:userInfo:)()
{
  return sub_100146A08((uint64_t)_swiftEmptyArrayStorage);
}

uint64_t sub_100146C84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v8[6];
  _QWORD v9[2];
  __int128 v10[2];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = a1;
  v9[1] = a1;
  swift_bridgeObjectRetain();
  v2 = sub_100003A2C(&qword_1001B4660);
  v3 = sub_100003A2C(&qword_1001B2B38);
  if (!swift_dynamicCast(v10, v9, v2, v3, 6))
  {
    v11 = 0;
    memset(v10, 0, sizeof(v10));
    sub_10005218C((uint64_t)v10, &qword_1001B2B40);
    __asm { BR              X12 }
  }
  sub_10001A674(v10, (uint64_t)&v12);
  v4 = v13;
  v5 = v14;
  v6 = sub_100005EF8(&v12, v13);
  __chkstk_darwin(v6);
  v8[2] = v1;
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(&type metadata for (), sub_100147C84, v8, &type metadata for () + 1, v4, v5);
  return sub_100005D3C(&v12);
}

void sub_100147048()
{
  __asm { BR              X11 }
}

_QWORD *sub_1001470A8@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_QWORD *sub_100147334(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_100147398(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)__DataStorage._bytes.getter();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)__DataStorage._offset.getter();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = __DataStorage._length.getter();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

unint64_t sub_100147444(unsigned __int8 a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:bytes:count:)(*(_QWORD *)(v1 + 40), a1, 1);
  return sub_10014752C(a1, v3);
}

unint64_t sub_100147478(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6);
  Character.hash(into:)(v6, a1, a2);
  v4 = Hasher._finalize()();
  return sub_10000AEEC(a1, a2, v4);
}

unint64_t sub_1001474DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for CodingUserInfoKey(0);
  v6 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, &protocol witness table for CodingUserInfoKey);
  return sub_1001475CC(a1, v6);
}

unint64_t sub_10014752C(unsigned __int8 a1, uint64_t a2)
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
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_1001475CC(uint64_t a1, uint64_t a2)
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
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  v17 = a1;
  v5 = type metadata accessor for CodingUserInfoKey(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
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
      v14 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v17, v5, &protocol witness table for CodingUserInfoKey);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

_QWORD *sub_1001476F4(_QWORD *result, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int8x16_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int8x16_t *v14;
  int8x16_t v15;
  int8x16_t v16;
  _BYTE *v17;
  unint64_t v18;

  v4 = *(_QWORD *)(a4 + 16);
  if (!a2)
  {
    v5 = *(_QWORD *)(a4 + 16);
    v4 = 0;
LABEL_30:
    *result = a4;
    result[1] = v5;
    return (_QWORD *)v4;
  }
  if (!a3)
  {
    v5 = *(_QWORD *)(a4 + 16);
LABEL_29:
    v4 = a3;
    goto LABEL_30;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (!v4)
    {
LABEL_31:
      v5 = 0;
      goto LABEL_30;
    }
    v5 = v4 - 1;
    *a2 = *(_BYTE *)(a4 + v4 - 1 + 32);
    v6 = a3 - 1;
    if (a3 != 1)
    {
      v7 = a3 - 2;
      if (a3 - 2 >= v5)
        v8 = v4 - 1;
      else
        v8 = a3 - 2;
      if (v8 >= v6)
        v8 = a3 - 1;
      v9 = v8 + 1;
      if (v9 <= 0x10)
        goto LABEL_18;
      v10 = (int8x16_t *)(a2 + 1);
      if (v7 >= v5)
        v7 = v4 - 1;
      if (v7 < v6)
        v6 = v7;
      if ((unint64_t)v10 >= v4 + a4 + 31 || v4 - v6 + a4 + 30 >= (unint64_t)&a2[v6 + 2])
      {
        v12 = v9 & 0xF;
        if ((v9 & 0xF) == 0)
          v12 = 16;
        v13 = v9 - v12;
        v11 = v13 + 1;
        v5 -= v13;
        a2 += v13;
        v14 = (int8x16_t *)(v4 + a4 + 15);
        do
        {
          v15 = *v14--;
          v16 = vrev64q_s8(v15);
          *v10++ = vextq_s8(v16, v16, 8uLL);
          v13 -= 16;
        }
        while (v13);
      }
      else
      {
LABEL_18:
        v11 = 1;
      }
      v17 = a2 + 1;
      v18 = v5;
      while (a3 != v11)
      {
        if (!v18)
          goto LABEL_31;
        ++v11;
        v5 = v18 - 1;
        *v17++ = *(_BYTE *)(a4 + 31 + v18--);
        if (a3 == v11)
          goto LABEL_29;
      }
      __break(1u);
      goto LABEL_33;
    }
    goto LABEL_29;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t _s7SPRBase9BitStringV17derRepresentationACSg10Foundation4DataV_tcfC_0(uint64_t a1, unint64_t a2)
{
  __int16 v4;
  __int16 v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  unint64_t v10;

  sub_100005D9C(a1, a2);
  sub_1000BECB0(a1, a2);
  v5 = v4;
  sub_100005DE0(a1, a2);
  if ((v5 & 0x100) != 0)
  {
    v6 = a1;
    v7 = a2;
  }
  else
  {
    sub_100151CF4(1, a1, a2);
    v6 = v9;
    v7 = v10;
    if (v5 <= 7u)
      __asm { BR              X10 }
  }
  sub_100005DE0(v6, v7);
  return 0;
}

void sub_1001478EC(uint64_t a1)
{
  char v1;

  if ((int)a1 == a1 >> 32 && v1 != 0)
    JUMPOUT(0x1001478C4);
  JUMPOUT(0x1001478D4);
}

void _s7SPRBase9BitStringV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_100147970()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1001479A4 + dword_100147A64[v0 >> 62]))();
}

BOOL sub_1001479B4@<W0>(uint64_t a1@<X8>)
{
  char v1;
  char v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (a1 == BYTE6(v3) && (a1 < 1 || (sub_100005D9C(v4, v3), sub_10014FA60(v6, v5), (v7 & 1) != 0)))
    return v2 == v1;
  else
    return 0;
}

uint64_t sub_100147A78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_100005D9C(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithCopy for BitString(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_100005D9C(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  sub_100005DE0(v6, v7);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for BitString(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_100005DE0(v4, v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for BitString(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for BitString(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BitString()
{
  return &type metadata for BitString;
}

uint64_t sub_100147C04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003A2C(&qword_1001B4650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100147C4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = sub_100147EA0(a1, a2, *(_QWORD *)(v3 + 16), **(_QWORD **)(v3 + 32));
  if (!v4)
  {
    *a3 = result;
    a3[1] = v7;
    a3[2] = v8;
  }
  return result;
}

uint64_t sub_100147C84(uint64_t a1, uint64_t a2)
{
  return sub_100154A4C(a1, a2);
}

unint64_t sub_100147C9C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  char *i;
  unsigned __int8 v5;
  char v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100003A2C(&qword_1001B46B8);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
    for (i = (char *)(a1 + 33); ; i += 2)
    {
      v5 = *(i - 1);
      v6 = *i;
      result = sub_100147444(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v3[6] + result) = v5;
      *(_BYTE *)(v3[7] + result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

unint64_t sub_100147D70(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v1 = a1[2];
  if (!v1)
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  sub_100003A2C(&qword_1001B46B0);
  v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
  v4 = a1[4];
  v5 = a1[5];
  v7 = a1[6];
  v6 = a1[7];
  result = sub_100147478(v4, v5);
  if ((v9 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    return (unint64_t)v3;
  }
  v10 = a1 + 11;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v4;
    v11[1] = v5;
    v12 = (_QWORD *)(v3[7] + 16 * result);
    *v12 = v7;
    v12[1] = v6;
    v13 = v3[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      break;
    v3[2] = v15;
    if (!--v1)
      goto LABEL_8;
    v16 = v10 + 4;
    v4 = *(v10 - 3);
    v17 = *(v10 - 2);
    v7 = *(v10 - 1);
    v18 = *v10;
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    result = sub_100147478(v4, v17);
    v10 = v16;
    v6 = v18;
    v5 = v17;
    if ((v19 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_100147EA0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  if (!result)
  {
    v4 = a4;
    goto LABEL_5;
  }
  if (!__OFSUB__(a2 - result, a3))
  {
    sub_1001476F4(&v5, (_BYTE *)(result + a3), a2 - result - a3, a4);
    v4 = v5;
LABEL_5:
    swift_bridgeObjectRetain();
    return v4;
  }
  __break(1u);
  return result;
}

_QWORD *sub_100147F28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;

  v9 = **(_QWORD **)(v3 + 16);
  v8[2] = &v9;
  result = sub_100147334((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_100147F84, (uint64_t)v8, a1, a2);
  *a3 = result;
  a3[1] = v6;
  a3[2] = v7;
  return result;
}

uint64_t sub_100147F84@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[2];

  v5 = sub_1001476F4(v8, a1, a2, **(_QWORD **)(v3 + 16));
  v6 = v8[1];
  *a3 = v8[0];
  a3[1] = v6;
  a3[2] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100147FE8(uint64_t a1)
{
  sub_100005D9C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100148034(uint64_t a1)
{
  sub_100005D9C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_retain();
  return a1;
}

unint64_t sub_10014806C()
{
  unint64_t result;

  result = sub_100147C9C((uint64_t)&off_1001A1308);
  static Data.base64urlByteDecodeTable = result;
  return result;
}

uint64_t *Data.base64urlByteDecodeTable.unsafeMutableAddressor()
{
  if (qword_1001B45C0 != -1)
    swift_once(&qword_1001B45C0, sub_10014806C);
  return &static Data.base64urlByteDecodeTable;
}

uint64_t static Data.base64urlByteDecodeTable.getter()
{
  return sub_10014816C(&qword_1001B45C0, &static Data.base64urlByteDecodeTable);
}

unint64_t sub_1001480EC()
{
  unint64_t result;

  result = sub_100147C9C((uint64_t)&off_1001A1330);
  static Data.base64urlByteEncodeTable = result;
  return result;
}

uint64_t *Data.base64urlByteEncodeTable.unsafeMutableAddressor()
{
  if (qword_1001B45C8 != -1)
    swift_once(&qword_1001B45C8, sub_1001480EC);
  return &static Data.base64urlByteEncodeTable;
}

uint64_t static Data.base64urlByteEncodeTable.getter()
{
  return sub_10014816C(&qword_1001B45C8, &static Data.base64urlByteEncodeTable);
}

uint64_t sub_10014816C(_QWORD *a1, _QWORD *a2)
{
  if (*a1 != -1)
    swift_once();
  return swift_bridgeObjectRetain(*a2);
}

uint64_t sub_1001481A4(uint64_t a1)
{
  return sub_100148230(a1, &off_1001A1358, (uint64_t)&unk_1001A1378, &static Data.base64urlCharacterDecodeTable);
}

unint64_t *Data.base64urlCharacterDecodeTable.unsafeMutableAddressor()
{
  if (qword_1001B45D0 != -1)
    swift_once(&qword_1001B45D0, sub_1001481A4);
  return &static Data.base64urlCharacterDecodeTable;
}

uint64_t static Data.base64urlCharacterDecodeTable.getter()
{
  return sub_10014816C(&qword_1001B45D0, &static Data.base64urlCharacterDecodeTable);
}

uint64_t sub_100148218(uint64_t a1)
{
  return sub_100148230(a1, &off_1001A13B8, (uint64_t)&unk_1001A13D8, &static Data.base64urlCharacterEncodeTable);
}

uint64_t sub_100148230(uint64_t a1, _QWORD *a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t result;

  v6 = sub_100147D70(a2);
  v7 = sub_100003A2C(&qword_1001B46E0);
  result = swift_arrayDestroy(a3, 2, v7);
  *a4 = v6;
  return result;
}

unint64_t *Data.base64urlCharacterEncodeTable.unsafeMutableAddressor()
{
  if (qword_1001B45D8 != -1)
    swift_once(&qword_1001B45D8, sub_100148218);
  return &static Data.base64urlCharacterEncodeTable;
}

uint64_t static Data.base64urlCharacterEncodeTable.getter()
{
  return sub_10014816C(&qword_1001B45D8, &static Data.base64urlCharacterEncodeTable);
}

void Data.init(base64urlEncoded:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_100148320()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD v12[4];
  char v13;
  unint64_t v14;

  if (__OFADD__(BYTE6(v0), 3))
  {
    __break(1u);
    goto LABEL_7;
  }
  if (BYTE6(v0) + 3 < 0 != __OFSUB__(BYTE6(v0), -3))
  {
LABEL_7:
    __break(1u);
    JUMPOUT(0x10014841CLL);
  }
  v12[0] = v1;
  v12[1] = v0;
  v12[2] = sub_100148434;
  v12[3] = 0;
  v13 = 61;
  v14 = (BYTE6(v0) + 3) & 0xFFFFFFFFFFFFFFFCLL;
  sub_100005D9C(v1, v0);
  sub_100005D9C(v1, v0);
  v2 = sub_100145BFC((uint64_t)v12);
  v4 = v3;
  v8 = ((uint64_t (*)(uint64_t, unint64_t, _QWORD, uint64_t, uint64_t, uint64_t))Data.init(base64Encoded:options:))(v2, v3, 0, v5, v6, v7);
  v10 = v9;
  sub_100005DE0(v1, v0);
  sub_1000306C8(v8, v10);
  sub_100005DE0(v1, v0);
  sub_100005DE0(v2, v4);
  if (v10 >> 60 != 15)
    sub_10000A9B0(v8, v10);
  return v8;
}

unsigned __int8 *sub_100148434@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  return sub_1001485E4(a1, &qword_1001B45C0, &static Data.base64urlByteDecodeTable, (uint64_t)sub_10014806C, a2);
}

uint64_t Data.init(base64urlEncoded:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)@<X0>(uint64_t *@<X0>, uint64_t *@<X8>);
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  result = String.count.getter();
  if (__OFADD__(result, 3))
  {
    __break(1u);
    goto LABEL_7;
  }
  if (result + 3 < 0 != __OFSUB__(result, -3))
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v14 = a1;
  v15 = a2;
  v16 = sub_10014855C;
  v17 = 0;
  v18 = 61;
  v19 = 0xE100000000000000;
  v20 = (result + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v5 = sub_100003A2C(&qword_1001B46C0);
  v6 = sub_100030828(&qword_1001B46C8, &qword_1001B46C0, (uint64_t)&protocol conformance descriptor for PrefixSequence<A>);
  v14 = String.init<A>(_:)(&v14, v5, v6);
  v15 = v7;
  v8 = String.init<A>(_:)(&v14, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
  v10 = v9;
  v11 = Data.init(base64Encoded:options:)(v8);
  v13 = v12;
  sub_1000306C8(v11, v12);
  swift_bridgeObjectRelease(v10);
  if (v13 >> 60 != 15)
    sub_10000A9B0(v11, v13);
  return v11;
}

uint64_t sub_10014855C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100148734(a1, &qword_1001B45D0, (uint64_t *)&static Data.base64urlCharacterDecodeTable, (uint64_t)sub_1001481A4, a2);
}

uint64_t Data.base64urlEncodedData(options:)()
{
  uint64_t v0;
  uint64_t v2[6];

  v2[0] = Data.base64EncodedData(options:)();
  v2[1] = v0;
  v2[2] = (uint64_t)sub_1001485B8;
  v2[3] = 0;
  v2[4] = (uint64_t)sub_1001485C8;
  v2[5] = 0;
  return sub_100146144(v2);
}

BOOL sub_1001485B8(unsigned __int8 *a1)
{
  return *a1 != 61;
}

unsigned __int8 *sub_1001485C8@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  return sub_1001485E4(a1, &qword_1001B45C8, &static Data.base64urlByteEncodeTable, (uint64_t)sub_1001480EC, a2);
}

unsigned __int8 *sub_1001485E4@<X0>(unsigned __int8 *result@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, unsigned __int8 *a5@<X8>)
{
  unsigned __int8 v7;
  uint64_t v8;
  char v9;

  v7 = *result;
  if (*a2 != -1)
    result = (unsigned __int8 *)swift_once(a2, a4);
  v8 = *a3;
  if (*(_QWORD *)(v8 + 16))
  {
    result = (unsigned __int8 *)sub_100147444(v7);
    if ((v9 & 1) != 0)
      v7 = result[*(_QWORD *)(v8 + 56)];
  }
  *a5 = v7;
  return result;
}

Swift::String __swiftcall Data.base64urlEncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  Swift::String result;
  Swift::String v6;
  uint64_t (*v7)(uint64_t *);
  uint64_t v8;
  uint64_t (*v9)@<X0>(uint64_t *@<X0>, uint64_t *@<X8>);
  uint64_t v10;

  v6 = Data.base64EncodedString(options:)(options);
  v7 = sub_1001486CC;
  v8 = 0;
  v9 = sub_100148718;
  v10 = 0;
  v1 = sub_100003A2C(&qword_1001B46D0);
  v2 = sub_100030828(&qword_1001B46D8, &qword_1001B46D0, (uint64_t)&protocol conformance descriptor for LazyMapSequence<A, B>);
  v3 = String.init<A>(_:)(&v6, v1, v2);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t sub_1001486CC(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char v5;

  v2 = *a1;
  v3 = a1[1];
  if (v2 == 61 && v3 == 0xE100000000000000)
    v5 = 0;
  else
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v3, 61, 0xE100000000000000, 0) ^ 1;
  return v5 & 1;
}

uint64_t sub_100148718@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100148734(a1, &qword_1001B45D8, (uint64_t *)&static Data.base64urlCharacterEncodeTable, (uint64_t)sub_100148218, a2);
}

uint64_t sub_100148734@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t *v12;

  v7 = *a1;
  v8 = a1[1];
  if (*a2 != -1)
    swift_once(a2, a4);
  v9 = *a3;
  if (*(_QWORD *)(v9 + 16))
  {
    v10 = sub_100147478(v7, v8);
    if ((v11 & 1) != 0)
    {
      v12 = (uint64_t *)(*(_QWORD *)(v9 + 56) + 16 * v10);
      v7 = *v12;
      v8 = v12[1];
    }
  }
  *a5 = v7;
  a5[1] = v8;
  return swift_bridgeObjectRetain(v8);
}

void sub_1001487B0()
{
  off_1001B46E8 = &off_1001A1418;
}

Swift::String __swiftcall Data.hexString()()
{
  Swift::String result;

  __asm { BR              X11 }
  return result;
}

uint64_t sub_1001487F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (BYTE6(a2) + 0x4000000000000000 < 0)
  {
    __break(1u);
    JUMPOUT(0x100148874);
  }
  __chkstk_darwin(a1);
  return String.init(unsafeUninitializedCapacity:initializingUTF8With:)(v2, sub_1001491E8);
}

void sub_10014888C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = type metadata accessor for Data.Iterator(0);
  __chkstk_darwin(v5);
  __asm { BR              X10 }
}

uint64_t sub_100148910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::UInt8_optional v7;
  Swift::UInt8 value;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  BOOL v12;

  sub_100005D9C(v4, v3);
  ((void (*)(uint64_t, unint64_t, _QWORD))Data.Iterator.init(_:at:))(v4, v3, (int)v4);
  v6 = 0;
  while (1)
  {
    v7 = Data.Iterator.next()();
    if ((*(_WORD *)&v7 & 0x100) != 0)
      break;
    value = v7.value;
    if (qword_1001B45E0 != -1)
      swift_once(&qword_1001B45E0, sub_1001487B0);
    v9 = value >> 4;
    v10 = *((_QWORD *)off_1001B46E8 + 2);
    if (v10 <= v9)
    {
      __break(1u);
LABEL_12:
      __break(1u);
LABEL_13:
      __break(1u);
      JUMPOUT(0x100148A04);
    }
    v11 = (char *)off_1001B46E8 + 32;
    *(_BYTE *)(v1 + v6) = *((_BYTE *)off_1001B46E8 + v9 + 32);
    if (v10 <= (value & 0xFu))
      goto LABEL_12;
    *(_BYTE *)(v1 + v6 + 1) = v11[value & 0xF];
    v12 = __OFADD__(v6, 2);
    v6 += 2;
    if (v12)
      goto LABEL_13;
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v2);
  return v6;
}

void Data.hexDigits.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = type metadata accessor for Data.Iterator(0);
  __chkstk_darwin(v3);
  __asm { BR              X10 }
}

_TtC14softposreaderd12RemoteReader *sub_100148A90()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _TtC14softposreaderd12RemoteReader *v7;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  sub_100005D9C(v3, v2);
  sub_100005D9C(v3, v2);
  ((void (*)(uint64_t, unint64_t, _QWORD))Data.Iterator.init(_:at:))(v3, v2, (int)v3);
  sub_100005DE0(v3, v2);
  v6 = sub_100149200();
  dispatch thunk of IteratorProtocol.next()(v0, v6);
  if ((*(_BYTE *)(v5 - 65) & 1) != 0)
  {
    v7 = &_swiftEmptyArrayStorage;
  }
  else
  {
    v7 = &_swiftEmptyArrayStorage;
    do
    {
      v9 = *(unsigned __int8 *)(v5 - 66);
      if ((swift_isUniquelyReferenced_nonNull_native(v7) & 1) == 0)
        v7 = sub_10009137C(0, *(_QWORD *)&v7->instance[8] + 1, 1, (uint64_t)v7, v10, v11, v12, v13);
      v15 = *(_QWORD *)&v7->instance[8];
      v14 = *(_QWORD *)&v7->instance[16];
      v16 = v14 >> 1;
      v17 = v15 + 1;
      if (v14 >> 1 <= v15)
      {
        v7 = sub_10009137C((_TtC14softposreaderd12RemoteReader *)(v14 > 1), v15 + 1, 1, (uint64_t)v7, v10, v11, v12, v13);
        v14 = *(_QWORD *)&v7->instance[16];
        v16 = v14 >> 1;
      }
      *(_QWORD *)&v7->instance[8] = v17;
      v7->instance[v15 + 24] = v9 >> 4;
      v18 = v15 + 2;
      if (v16 < v18)
        v7 = sub_10009137C((_TtC14softposreaderd12RemoteReader *)(v14 > 1), v18, 1, (uint64_t)v7, v10, v11, v12, v13);
      *(_QWORD *)&v7->instance[8] = v18;
      v7->instance[v17 + 24] = v9 & 0xF;
      dispatch thunk of IteratorProtocol.next()(v0, v6);
    }
    while (*(_BYTE *)(v5 - 65) != 1);
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v0);
  return v7;
}

uint64_t Data.init(hexDigits:)(uint64_t a1, const char *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;

  v9 = *(_QWORD *)(a1 + 16);
  if (v9 < 2)
  {
    v16 = 0;
    v17 = 0xC000000000000000;
    if (!v9)
      goto LABEL_12;
LABEL_10:
    if (v9 != 1)
LABEL_11:
      __asm { BR              X13 }
    goto LABEL_12;
  }
  if (v9 <= 0x1D)
  {
    v17 = 0;
    goto LABEL_11;
  }
  v10 = type metadata accessor for __DataStorage(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = __DataStorage.init(capacity:)(v9 >> 1);
  if (v9 > 0xFFFFFFFD)
  {
    v14 = type metadata accessor for Data.RangeReference(0);
    v12 = swift_allocObject(v14, 32, 7);
    v13 = v11 | 0x8000000000000000;
    *(_QWORD *)(v12 + 16) = 0;
    *(_QWORD *)(v12 + 24) = 0;
  }
  else
  {
    v12 = 0;
    v13 = v11 | 0x4000000000000000;
  }
  v9 = *(_QWORD *)(a1 + 16);
  v16 = v12;
  v17 = v13;
  if (v9)
    goto LABEL_10;
LABEL_12:
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a1, a2, a3, a4, a5, a6, a7, a8);
  return v16;
}

_TtC14softposreaderd12RemoteReader *sub_100148E20(_TtC14softposreaderd12RemoteReader *a1, int64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  return sub_100148E2C(a1, a2, a3, a4, &qword_1001B46F0, a6, a7, a8);
}

_TtC14softposreaderd12RemoteReader *sub_100148E2C(_TtC14softposreaderd12RemoteReader *result, int64_t a2, void *a3, uint64_t a4, uint64_t *a5, void *a6, void *a7, void *a8)
{
  char v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC14softposreaderd12RemoteReader *v15;
  int64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  char *v19;

  v9 = (char)result;
  if ((a3 & 1) != 0)
  {
    v10 = *(_QWORD *)(a4 + 24);
    v11 = v10 >> 1;
    if ((uint64_t)(v10 >> 1) < a2)
    {
      if (v11 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v10 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v11 = a2;
    }
  }
  else
  {
    v11 = a2;
  }
  v12 = *(_QWORD *)(a4 + 16);
  if (v11 <= v12)
    v13 = *(_QWORD *)(a4 + 16);
  else
    v13 = v11;
  if (v13)
  {
    v14 = sub_100003A2C(a5);
    v15 = (_TtC14softposreaderd12RemoteReader *)swift_allocObject(v14, 8 * v13 + 32, 7);
    v16 = j__malloc_size(v15);
    v17 = v16 - 32;
    if (v16 < 32)
      v17 = v16 - 25;
    *(_QWORD *)&v15->instance[8] = v12;
    *(_QWORD *)&v15->instance[16] = 2 * (v17 >> 3);
  }
  else
  {
    v15 = &_swiftEmptyArrayStorage;
  }
  v18 = &v15->instance[24];
  v19 = (char *)(a4 + 32);
  if ((v9 & 1) != 0)
  {
    if (v15 != (_TtC14softposreaderd12RemoteReader *)a4 || v18 >= (unsigned __int8 *)&v19[8 * v12])
      memmove(v18, v19, 8 * v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    memcpy(v18, v19, 8 * v12);
  }
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a4, v19, a3, (id)a4, a5, a6, a7, a8);
  return v15;
}

uint64_t _s10Foundation4DataV7SPRBaseE9hexStringACSgSS_tcfC_0(uint64_t a1, _TtC14softposreaderd12RemoteReader *a2)
{
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _TtC14softposreaderd12RemoteReader *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  Swift::String_optional v18;
  uint64_t v19;
  SEL v20;
  char v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  _TtC14softposreaderd12RemoteReader *v33;
  uint64_t v34;
  unint64_t v36;
  uint64_t v37;
  SEL v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  unint64_t v54;

  if (((uint64_t (*)(void))String.count.getter)() < 1 || (String.count.getter(a1, a2) & 1) != 0)
  {
    v33 = a2;
LABEL_12:
    swift_bridgeObjectRelease(v33, v4, v5, v6, v7, v8, v9, v10);
    return 0;
  }
  swift_bridgeObjectRetain();
  v11 = &_swiftEmptyArrayStorage;
  while (1)
  {
    v18 = String.Iterator.next()();
    if (!v18.value._object)
      break;
    v19 = Character.hexDigitValue.getter(v18.value._countAndFlagsBits, v18.value._object);
    v21 = (char)v20;
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v18.value._object, v20, v22, v23, v24, v25, v26, v27);
    if ((v21 & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0)
        v11 = sub_100148E2C(0, *(_QWORD *)&v11->instance[8] + 1, (void *)1, (uint64_t)v11, &qword_1001B0E10, v28, v29, v30);
      v32 = *(_QWORD *)&v11->instance[8];
      v31 = *(_QWORD *)&v11->instance[16];
      if (v32 >= v31 >> 1)
        v11 = sub_100148E2C((_TtC14softposreaderd12RemoteReader *)(v31 > 1), v32 + 1, (void *)1, (uint64_t)v11, &qword_1001B0E10, v28, v29, v30);
      *(_QWORD *)&v11->instance[8] = v32 + 1;
      *(_QWORD *)&v11->instance[8 * v32 + 24] = v19;
    }
  }
  swift_bridgeObjectRelease(a2, 0, v12, v13, v14, v15, v16, v17);
  v36 = *(_QWORD *)&v11->instance[8];
  v37 = String.count.getter(a1, a2);
  swift_bridgeObjectRelease(a2, v38, v39, v40, v41, v42, v43, v44);
  if (v36 != v37)
  {
    v33 = v11;
    goto LABEL_12;
  }
  v45 = sub_1000CF274(v36 >> 1);
  if (v36)
  {
    v53 = *(_QWORD *)&v11->instance[8];
    if (v53)
    {
      if (v53 > 1)
      {
        v54 = *(_QWORD *)&v11->instance[32] | (16 * *(_QWORD *)&v11->instance[24]);
        if ((v54 & 0x8000000000000000) == 0)
        {
          if (v54 <= 0xFF)
            __asm { BR              X11 }
LABEL_26:
          __break(1u);
        }
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_25;
  }
  v34 = v45;
  swift_bridgeObjectRelease(v11, v46, v47, v48, v49, v50, v51, v52);
  return v34;
}

void sub_1001491E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10014888C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

unint64_t sub_100149200()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1001B1E28;
  if (!qword_1001B1E28)
  {
    v1 = type metadata accessor for Data.Iterator(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for Data.Iterator, v1);
    atomic_store(result, (unint64_t *)&qword_1001B1E28);
  }
  return result;
}

Swift::UInt8 __swiftcall Data.toUInt8()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  __int16 v4;
  __int16 v5;

  v2 = v1;
  v3 = v0;
  sub_100005D9C(v0, v1);
  sub_1000BECB0(v3, v2);
  v5 = v4;
  sub_100005DE0(v3, v2);
  if ((v5 & 0x100) != 0)
    return 0;
  else
    return v5;
}

void Data.toUInt16(endianness:)(char a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;

  sub_100005D9C(a2, a3);
  sub_1000FA7E0(a2, a3);
  v7 = v6 >> 62;
  if ((a1 & 1) == 0)
    __asm { BR              X10 }
  __asm { BR              X10 }
}

void sub_100149394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int16 a11, char a12, char a13, char a14, char a15)
{
  uint64_t v15;
  uint64_t v16;

  a10 = v16;
  a11 = v15;
  a12 = BYTE2(v15);
  a13 = BYTE3(v15);
  a14 = BYTE4(v15);
  a15 = BYTE5(v15);
  sub_1001495B8((unsigned __int16 *)&a10);
  JUMPOUT(0x100149530);
}

uint64_t sub_1001495B0(unsigned __int16 *a1)
{
  return *a1;
}

uint64_t sub_1001495B8(unsigned __int16 *a1)
{
  return bswap32(*a1) >> 16;
}

void Data.toUInt32(endianness:)(char a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;

  sub_100005D9C(a2, a3);
  sub_1000FA7E0(a2, a3);
  v7 = v6 >> 62;
  if ((a1 & 1) == 0)
    __asm { BR              X10 }
  __asm { BR              X10 }
}

void sub_1001496C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned int a10, char a11, char a12, char a13, char a14, __int16 a15, char a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t v20;

  LOWORD(a10) = v20;
  BYTE2(a10) = BYTE2(v20);
  HIBYTE(a10) = BYTE3(v20);
  a11 = BYTE4(v20);
  a12 = BYTE5(v20);
  a13 = BYTE6(v20);
  a14 = HIBYTE(v20);
  a15 = v19;
  a16 = BYTE2(v19);
  a17 = BYTE3(v19);
  a18 = BYTE4(v19);
  a19 = BYTE5(v19);
  sub_100149914(&a10);
  JUMPOUT(0x10014988CLL);
}

uint64_t sub_10014990C(unsigned int *a1)
{
  return *a1;
}

uint64_t sub_100149914(unsigned int *a1)
{
  return bswap32(*a1);
}

void Data.toUInt64(endianness:)(char a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;

  sub_100005D9C(a2, a3);
  sub_1000FA7E0(a2, a3);
  v7 = v6 >> 62;
  if ((a1 & 1) == 0)
    __asm { BR              X10 }
  __asm { BR              X10 }
}

void sub_100149A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, __int16 a11, char a12, char a13, char a14, char a15)
{
  uint64_t v15;
  unint64_t v16;

  a10 = v16;
  a11 = v15;
  a12 = BYTE2(v15);
  a13 = BYTE3(v15);
  a14 = BYTE4(v15);
  a15 = BYTE5(v15);
  sub_100149C6C(&a10);
  JUMPOUT(0x100149BE4);
}

uint64_t sub_100149C64(uint64_t a1)
{
  return *(_QWORD *)a1;
}

unint64_t sub_100149C6C(unint64_t *a1)
{
  return bswap64(*a1);
}

uint64_t Data.at(index:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000) == 0)
    __asm { BR              X10 }
  return 0;
}

uint64_t Data.replaceAt(index:value:)(uint64_t result)
{
  if ((result & 0x8000000000000000) == 0)
    __asm { BR              X12 }
  return result;
}

void sub_100149EF0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_100149F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  __int16 v6;
  char v7;
  char v8;
  char v9;
  char v10;

  v5 = v2;
  v6 = v3;
  v7 = BYTE2(v3);
  v8 = BYTE3(v3);
  v9 = BYTE4(v3);
  v10 = BYTE5(v3);
  return Data._Representation.replaceSubrange(_:with:count:)(v1, v0, &v5, BYTE6(v3));
}

unint64_t sub_10014A0F0()
{
  unint64_t result;

  result = qword_1001B46F8;
  if (!qword_1001B46F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data.Endianness, &type metadata for Data.Endianness);
    atomic_store(result, (unint64_t *)&qword_1001B46F8);
  }
  return result;
}

uint64_t _s10EndiannessOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10014A180 + 4 * byte_10016406D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10014A1B4 + 4 * byte_100164068[v4]))();
}

uint64_t sub_10014A1B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10014A1BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10014A1C4);
  return result;
}

uint64_t sub_10014A1D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10014A1D8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10014A1DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10014A1E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Data.Endianness()
{
  return &type metadata for Data.Endianness;
}

uint64_t sub_10014A200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = __DataStorage._bytes.getter();
  v11 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_13;
  }
  v14 = __DataStorage._length.getter();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  if (v11)
    v16 = v15;
  else
    v16 = 0;
  return Data._Representation.replaceSubrange(_:with:count:)(a5, a6, v11, v16);
}

uint64_t Range.include(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void (*v16)(char *, uint64_t, uint64_t);
  char v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v3 = v2;
  v6 = *(_QWORD *)(a2 - 8);
  v7 = __chkstk_darwin(a1);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v20 - v10;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = *(_QWORD *)(v12 + 24);
  v15 = dispatch thunk of static Comparable.<= infix(_:_:)(v3, a1, v13, v14);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v16(v11, v3, a2);
  v16(v9, a1, a2);
  if ((v15 & 1) != 0)
    v17 = dispatch thunk of static Comparable.>= infix(_:_:)(&v11[*(int *)(a2 + 36)], &v9[*(int *)(a2 + 36)], v13, v14);
  else
    v17 = 0;
  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v18(v9, a2);
  v18(v11, a2);
  return v17 & 1;
}

uint64_t TLV.tag.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

_QWORD *TLV.__allocating_init(tag:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *result;

  v6 = type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject(v6, 40, 7);
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

uint64_t type metadata accessor for TLV()
{
  return objc_opt_self(_TtC7SPRBase3TLV);
}

_QWORD *TLV.__allocating_init(tag:children:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *result;

  v4 = type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject(v4, 40, 7);
  result[2] = a1;
  result[3] = a2;
  result[4] = 0x2000000000000000;
  return result;
}

void TLV.__allocating_init(dataRepresentation:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  id v5;
  Class isa;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  id v11;
  char v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  _QWORD *v24;

  v5 = objc_allocWithZone((Class)NSInputStream);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v7 = objc_msgSend(v5, "initWithData:", isa);

  objc_msgSend(v7, "open");
  v8 = sub_10014A618();
  if (v2)
    goto LABEL_6;
  if ((v9 & 1) != 0
    || (v10 = v8, v11 = sub_10014A788(), (v12 & 1) != 0)
    || (v13 = NSInputStream.read(exactly:)((uint64_t)v11), v15 = v14, v14 >> 60 == 15))
  {
    v16 = sub_10014A744();
    v17 = swift_allocError(&type metadata for TLVError, v16, 0, 0);
    *v18 = 0;
    swift_willThrow(v17);
LABEL_6:
    sub_100005DE0(a1, a2);
LABEL_7:

    return;
  }
  v19 = (uint64_t)v13;
  if ((sub_10014A900() & 0x100) == 0)
  {
    v20 = sub_10014A744();
    v21 = swift_allocError(&type metadata for TLVError, v20, 0, 0);
    *v22 = 1;
    swift_willThrow(v21);
    sub_100005DE0(a1, a2);
    sub_10000A9B0(v19, v15);
    goto LABEL_7;
  }
  objc_msgSend(v7, "close");
  sub_100005DE0(a1, a2);

  v23 = type metadata accessor for TLV();
  v24 = (_QWORD *)swift_allocObject(v23, 40, 7);
  v24[2] = v10;
  v24[3] = v19;
  v24[4] = v15;
}

uint64_t sub_10014A618()
{
  void *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  id v4;
  unint64_t v5;
  _BYTE *v6;
  unsigned __int8 v7;

  result = sub_10014A900();
  if (!v1)
  {
    if ((result & 0x100) != 0)
      return 0;
    v3 = result;
    if ((~(_DWORD)result & 0x1F) != 0)
    {
      return result;
    }
    else
    {
      while (1)
      {
        v7 = 0;
        v4 = objc_msgSend(v0, "read:maxLength:", &v7, 1);
        if (v4 != (id)1)
          break;
        result = v7 | (unint64_t)(v3 << 8);
        v3 = result;
        if (((char)v7 & 0x80000000) == 0)
          return result;
      }
      if (v4 != (id)-1)
      {
        v5 = sub_10014A744();
        result = swift_allocError(&type metadata for TLVError, v5, 0, 0);
        *v6 = 0;
        return swift_willThrow(result);
      }
      result = (uint64_t)objc_msgSend(v0, "streamError");
      if (result)
        return swift_willThrow(result);
      __break(1u);
    }
  }
  return result;
}

unint64_t sub_10014A744()
{
  unint64_t result;

  result = qword_1001B4700;
  if (!qword_1001B4700)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TLVError, &type metadata for TLVError);
    atomic_store(result, (unint64_t *)&qword_1001B4700);
  }
  return result;
}

id sub_10014A788()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  __int16 v3;
  unsigned int v4;
  id result;
  unint64_t v6;
  _BYTE *v7;
  unsigned int v8;
  id v9;
  unint64_t v10;
  _BYTE *v11;
  unsigned __int8 v12;

  v3 = sub_10014A900();
  if (v1)
    return (id)v2;
  if ((v3 & 0x100) != 0)
    return 0;
  v4 = v3;
  if ((v3 & 0x80) == 0)
    return (id)v3;
  if (v3 == 128)
  {
    v6 = sub_10014A744();
    result = (id)swift_allocError(&type metadata for TLVError, v6, 0, 0);
    *v7 = 2;
LABEL_18:
    swift_willThrow(result);
    return (id)v2;
  }
  v2 = 0;
  v8 = 128;
  while (1)
  {
    if (v8 >= v4)
      __break(1u);
    v12 = 0;
    v9 = objc_msgSend(v0, "read:maxLength:", &v12, 1);
    if (v9 != (id)1)
      break;
    ++v8;
    v2 = v12 | (v2 << 8);
    if (v8 == v4)
      return (id)v2;
  }
  if (v9 != (id)-1)
  {
    v10 = sub_10014A744();
    result = (id)swift_allocError(&type metadata for TLVError, v10, 0, 0);
    *v11 = 0;
    goto LABEL_18;
  }
  result = objc_msgSend(v0, "streamError");
  if (result)
    goto LABEL_18;
  __break(1u);
  return result;
}

uint64_t sub_10014A900()
{
  void *v0;
  id v1;
  uint64_t result;
  unsigned __int8 v3;

  v3 = 0;
  v1 = objc_msgSend(v0, "read:maxLength:", &v3, 1);
  if (v1 == (id)1)
    return v3;
  if (v1 != (id)-1)
    return 256;
  result = (uint64_t)objc_msgSend(v0, "streamError");
  if (result)
    return swift_willThrow(result);
  __break(1u);
  return result;
}

uint64_t TLV.length.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  BOOL v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  if ((v2 & 0x2000000000000000) == 0)
    __asm { BR              X10 }
  v3 = v1 & 0xFFFFFFFFFFFFFF8;
  if ((unint64_t)v1 >> 62)
  {
LABEL_31:
    if (v1 >= 0)
      v40 = v3;
    else
      v40 = v1;
    sub_10014ACA4(v1, v2);
    swift_bridgeObjectRetain();
    v4 = _CocoaArrayWrapper.endIndex.getter(v40);
    if (v4)
      goto LABEL_5;
LABEL_35:
    sub_10014ACB0(v1, v2, v5, v6, v7, v8, v9, v10);
    sub_10014ACB0(v1, v2, v41, v42, v43, v44, v45, v46);
    return 0;
  }
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_10014ACA4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  swift_bridgeObjectRetain();
  if (!v4)
    goto LABEL_35;
LABEL_5:
  if (v4 < 1)
  {
    __break(1u);
    JUMPOUT(0x10014AC2CLL);
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v1);
      v14 = TLV.length.getter(v13);
      v15 = *(_QWORD *)(v13 + 16);
      swift_unknownObjectRelease(v13);
      if (v15)
      {
        v22 = 8 - (__clz(v15) >> 3);
        if (v14 <= 127)
        {
          v23 = 1;
          goto LABEL_13;
        }
      }
      else
      {
        v23 = 1;
        v22 = 1;
        if (v14 < 128)
          goto LABEL_13;
      }
      v23 = 9 - (__clz(v14) >> 3);
LABEL_13:
      v24 = v22 + v23;
      v25 = __OFADD__(v24, v14);
      v3 = v24 + v14;
      if (v25)
      {
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      v25 = __OFADD__(v12, v3);
      v12 += v3;
      if (v25)
        goto LABEL_28;
      if (v4 == ++v11)
        goto LABEL_26;
    }
  }
  v12 = 0;
  v26 = (uint64_t *)(v1 + 32);
  do
  {
    v27 = *v26;
    v28 = swift_retain();
    v29 = TLV.length.getter(v28);
    v30 = *(_QWORD *)(v27 + 16);
    swift_release(v27);
    if (v30)
    {
      v31 = 8 - (__clz(v30) >> 3);
      if (v29 <= 127)
      {
        v32 = 1;
        goto LABEL_23;
      }
    }
    else
    {
      v32 = 1;
      v31 = 1;
      if (v29 < 128)
        goto LABEL_23;
    }
    v32 = 9 - (__clz(v29) >> 3);
LABEL_23:
    v33 = v31 + v32;
    v25 = __OFADD__(v33, v29);
    v3 = v33 + v29;
    if (v25)
      goto LABEL_29;
    v25 = __OFADD__(v12, v3);
    v12 += v3;
    if (v25)
    {
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    ++v26;
    --v4;
  }
  while (v4);
LABEL_26:
  sub_10014ACB0(v1, v2, v16, v17, v18, v19, v20, v21);
  sub_10014ACB0(v1, v2, v34, v35, v36, v37, v38, v39);
  return v12;
}

unint64_t TLV.derSize.getter()
{
  uint64_t v0;
  int64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t result;

  v1 = TLV.length.getter();
  v2 = *(_QWORD *)(v0 + 16);
  if (v2)
  {
    v3 = 8 - (__clz(v2) >> 3);
    if (v1 < 128)
    {
      v4 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    v3 = 1;
    v4 = 1;
    if (v1 < 128)
      goto LABEL_6;
  }
  v4 = 9 - (__clz(v1) >> 3);
LABEL_6:
  v5 = v3 + v4;
  v6 = __OFADD__(v5, v1);
  result = v5 + v1;
  if (v6)
    __break(1u);
  return result;
}

uint64_t sub_10014ACA4(uint64_t result, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0)
    return swift_bridgeObjectRetain();
  else
    return sub_100005D9C(result, a2);
}

void sub_10014ACB0(uint64_t result, unint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if ((a2 & 0x2000000000000000) != 0)
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)result, (SEL)a2, a3, a4, a5, a6, a7, a8);
  else
    sub_100005DE0(result, a2);
}

uint64_t TLV.value.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t result;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _OWORD v29[2];
  _OWORD v30[2];

  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  if ((v3 & 0x2000000000000000) == 0)
  {
    sub_100005D9C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    return v2;
  }
  v4 = (void *)objc_opt_self(NSOutputStream);
  swift_bridgeObjectRetain();
  v5 = objc_msgSend(v4, "outputStreamToMemory");
  objc_msgSend(v5, "open");
  v12 = v2 & 0xFFFFFFFFFFFFFF8;
  if ((unint64_t)v2 >> 62)
    goto LABEL_16;
  v13 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v13)
  {
LABEL_5:
    v1 = 0;
    v14 = 4;
    do
    {
      v15 = v14 - 4;
      if ((v2 & 0xC000000000000001) != 0)
      {
        v16 = (unint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)(v14 - 4, v2);
        v17 = __OFADD__(v15, 1);
        v18 = v14 - 3;
        if (v17)
          goto LABEL_15;
      }
      else
      {
        v16 = *(unint64_t **)(v2 + 8 * v14);
        swift_retain();
        v17 = __OFADD__(v15, 1);
        v18 = v14 - 3;
        if (v17)
        {
LABEL_15:
          __break(1u);
LABEL_16:
          if (v2 >= 0)
            v1 = v12;
          else
            v1 = v2;
          swift_bridgeObjectRetain();
          v13 = _CocoaArrayWrapper.endIndex.getter(v1);
          sub_10014ACB0(v2, v3, v22, v23, v24, v25, v26, v27);
          if (!v13)
            break;
          goto LABEL_5;
        }
      }
      sub_10014AEBC(v16);
      swift_release(v16);
      ++v14;
    }
    while (v18 != v13);
  }
  sub_10014ACB0(v2, v3, v6, v7, v8, v9, v10, v11);
  objc_msgSend(v5, "close");
  v19 = objc_msgSend(v5, "propertyForKey:", NSStreamDataWrittenToMemoryStreamKey);
  if (v19)
  {
    v20 = v19;
    _bridgeAnyObjectToAny(_:)(v29, v19);

    swift_unknownObjectRelease(v20);
    sub_100005D2C(v29, v30);
    swift_dynamicCast(&v28, v30, (char *)&type metadata for Any + 8, &type metadata for Data, 7);
    return v28;
  }
  __break(1u);
  result = swift_unexpectedError(v1, "SPRBase/TLV.swift", 17, 1, 116);
  __break(1u);
  return result;
}

void sub_10014AEBC(unint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;

  sub_10014EBB8(a1[2]);
  if (!v1)
  {
    v3 = TLV.length.getter();
    sub_10014EF64(v3);
    v5 = a1[3];
    v4 = a1[4];
    if ((v4 & 0x2000000000000000) == 0)
    {
      sub_100005D9C(v5, v4);
      sub_10014F3F0(v5, v4);
      goto LABEL_19;
    }
    v12 = v5 & 0xFFFFFFFFFFFFFF8;
    if ((unint64_t)v5 >> 62)
      goto LABEL_15;
    v13 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (v13)
    {
      v20 = v4;
      v14 = 4;
      while (1)
      {
        v15 = v14 - 4;
        if ((v5 & 0xC000000000000001) == 0)
          break;
        v16 = specialized _ArrayBuffer._getElementSlowPath(_:)(v14 - 4, v5);
        v4 = v14 - 3;
        if (__OFADD__(v15, 1))
          goto LABEL_14;
LABEL_12:
        sub_10014AEBC(v16);
        swift_release(v16);
        ++v14;
        if (v4 == v13)
        {
          v17 = v5;
          v18 = v20;
          goto LABEL_20;
        }
      }
      v16 = *(_QWORD *)(v5 + 8 * v14);
      swift_retain();
      v4 = v14 - 3;
      if (!__OFADD__(v15, 1))
        goto LABEL_12;
LABEL_14:
      __break(1u);
LABEL_15:
      if (v5 >= 0)
        v19 = v12;
      else
        v19 = v5;
      swift_bridgeObjectRetain();
      v13 = _CocoaArrayWrapper.endIndex.getter(v19);
    }
LABEL_19:
    v17 = v5;
    v18 = v4;
LABEL_20:
    sub_10014ACB0(v17, v18, v6, v7, v8, v9, v10, v11);
  }
}

void sub_10014B03C(unint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _BYTE v21[24];
  unint64_t v22;

  sub_10014ED90(a1[2]);
  if (!v2)
  {
    v4 = TLV.length.getter();
    sub_10014F020(v4);
    v6 = a1[3];
    v5 = a1[4];
    if ((v5 & 0x2000000000000000) == 0)
    {
      swift_beginAccess(v1 + 16, v21, 33, 0);
      sub_100005D9C(v6, v5);
      sub_10012465C(v6, v5);
      swift_endAccess(v21);
      goto LABEL_19;
    }
    v13 = v6 & 0xFFFFFFFFFFFFFF8;
    if ((unint64_t)v6 >> 62)
      goto LABEL_15;
    v14 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (v14)
    {
      v22 = v5;
      v15 = 4;
      while (1)
      {
        v16 = v15 - 4;
        if ((v6 & 0xC000000000000001) == 0)
          break;
        v17 = specialized _ArrayBuffer._getElementSlowPath(_:)(v15 - 4, v6);
        v5 = v15 - 3;
        if (__OFADD__(v16, 1))
          goto LABEL_14;
LABEL_12:
        sub_10014B03C(v17);
        swift_release(v17);
        ++v15;
        if (v5 == v14)
        {
          v18 = v6;
          v19 = v22;
          goto LABEL_20;
        }
      }
      v17 = *(_QWORD *)(v6 + 8 * v15);
      swift_retain();
      v5 = v15 - 3;
      if (!__OFADD__(v16, 1))
        goto LABEL_12;
LABEL_14:
      __break(1u);
LABEL_15:
      if (v6 >= 0)
        v20 = v13;
      else
        v20 = v6;
      swift_bridgeObjectRetain();
      v14 = _CocoaArrayWrapper.endIndex.getter(v20);
    }
LABEL_19:
    v18 = v6;
    v19 = v5;
LABEL_20:
    sub_10014ACB0(v18, v19, v7, v8, v9, v10, v11, v12);
  }
}

void TLV.hexStringValue.getter()
{
  TLV.value.getter();
  __asm { BR              X11 }
}

uint64_t sub_10014B218()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (BYTE6(v0) + 0x4000000000000000 < 0)
  {
    __break(1u);
    JUMPOUT(0x10014B2B4);
  }
  __chkstk_darwin(2 * BYTE6(v0));
  v3 = String.init(unsafeUninitializedCapacity:initializingUTF8With:)(v2, sub_1001491E8);
  sub_100005DE0(v1, v0);
  return v3;
}

uint64_t TLV.children.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_10014ACA4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    sub_10014FD18(v1, v2);
    v4 = v3;
    sub_10014ACB0(v1, v2, v5, v6, v7, v8, v9, v10);
    v11 = *(_QWORD *)(v0 + 24);
    v12 = *(_QWORD *)(v0 + 32);
    *(_QWORD *)(v0 + 24) = v4;
    *(_QWORD *)(v0 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_10014ACB0(v11, v12, v13, v14, v15, v16, v17, v18);
    return v4;
  }
  return v1;
}

void static TLV.decode(from:)(uint64_t a1, unint64_t a2)
{
  sub_10014FD18(a1, a2);
}

uint64_t TLV.dataRepresentation.getter()
{
  unint64_t *v0;
  unint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;
  _BYTE v12[32];

  v1 = v0;
  v2 = TLV.derSize.getter();
  v3 = type metadata accessor for DERMemoryWriter();
  inited = swift_initStackObject(v3, v12);
  if (v2)
  {
    if (v2 <= 14)
    {
      v7 = 0;
      v8 = 0;
    }
    else
    {
      v5 = type metadata accessor for __DataStorage(0);
      swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
      v6 = __DataStorage.init(capacity:)(v2);
      if ((unint64_t)v2 > 0x7FFFFFFE)
      {
        v9 = type metadata accessor for Data.RangeReference(0);
        v7 = swift_allocObject(v9, 32, 7);
        v8 = v6 | 0x8000000000000000;
        *(_QWORD *)(v7 + 16) = 0;
        *(_QWORD *)(v7 + 24) = 0;
      }
      else
      {
        v7 = 0;
        v8 = v6 | 0x4000000000000000;
      }
    }
  }
  else
  {
    v7 = 0;
    v8 = 0xC000000000000000;
  }
  *(_QWORD *)(inited + 16) = v7;
  *(_QWORD *)(inited + 24) = v8;
  sub_10014B03C(v1);
  swift_beginAccess(inited + 16, &v11, 0, 0);
  return *(_QWORD *)(inited + 16);
}

uint64_t TLV.childrenIterator.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_10014ACA4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    sub_10014FD18(v1, v2);
    v4 = v3;
    sub_10014ACB0(v1, v2, v5, v6, v7, v8, v9, v10);
    v11 = *(_QWORD *)(v0 + 24);
    v12 = *(_QWORD *)(v0 + 32);
    *(_QWORD *)(v0 + 24) = v4;
    *(_QWORD *)(v0 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_10014ACB0(v11, v12, v13, v14, v15, v16, v17, v18);
    return v4;
  }
  return v1;
}

void TLV.hash(into:)(uint64_t a1)
{
  Swift::UInt *v1;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  Hasher._combine(_:)(v1[2]);
  v3 = v1[3];
  v4 = v1[4];
  if ((v4 & 0x2000000000000000) == 0)
  {
    sub_100005D9C(v3, v4);
    Data.hash(into:)(a1, v3, v4);
LABEL_12:
    sub_10014ACB0(v3, v4, v5, v6, v7, v8, v9, v10);
    return;
  }
  if ((unint64_t)v3 >> 62)
  {
    if (v3 >= 0)
      v16 = v3 & 0xFFFFFFFFFFFFFF8;
    else
      v16 = v1[3];
    swift_bridgeObjectRetain();
    v11 = _CocoaArrayWrapper.endIndex.getter(v16);
    if (!v11)
      goto LABEL_12;
  }
  else
  {
    v11 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v11)
      goto LABEL_12;
  }
  if (v11 >= 1)
  {
    if ((v3 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v11; ++i)
      {
        v13 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v3);
        TLV.hash(into:)(a1);
        swift_unknownObjectRelease(v13);
      }
    }
    else
    {
      v14 = (uint64_t *)(v3 + 32);
      do
      {
        v15 = *v14++;
        swift_retain();
        TLV.hash(into:)(a1);
        swift_release(v15);
        --v11;
      }
      while (v11);
    }
    goto LABEL_12;
  }
  __break(1u);
}

uint64_t TLV.debugDescription.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  SEL v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  _TtC14softposreaderd12RemoteReader *object;
  SEL v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  Swift::String v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  const char *v49;
  _TtC14softposreaderd12RemoteReader *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  SEL v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  Swift::String v67;
  _TtC14softposreaderd12RemoteReader *v68;
  SEL v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  Swift::String v76;
  Swift::String v77;
  SEL v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  Swift::String v85;
  _QWORD *v87;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  if ((v3 & 0x2000000000000000) == 0)
  {
    sub_100005D9C(v2, v3);
    _StringGuts.grow(_:)(34);
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)0xE000000000000000, v4, v5, v6, v7, v8, v9, v10);
    v11 = v0[2];
    v12 = sub_100003A2C((uint64_t *)&unk_1001B1300);
    v13 = swift_allocObject(v12, 72, 7);
    *(_OWORD *)(v13 + 16) = xmmword_10015A5F0;
    *(_QWORD *)(v13 + 56) = &type metadata for UInt;
    *(_QWORD *)(v13 + 64) = &protocol witness table for UInt;
    *(_QWORD *)(v13 + 32) = v11;
    v14._countAndFlagsBits = String.init(format:_:)(1479684133, 0xE400000000000000, v13);
    object = (_TtC14softposreaderd12RemoteReader *)v14._object;
    String.append(_:)(v14);
    swift_bridgeObjectRelease(object, v16, v17, v18, v19, v20, v21, v22);
    v23._countAndFlagsBits = 0x6874676E656C202CLL;
    v23._object = (void *)0xEA0000000000203ALL;
    String.append(_:)(v23);
    __asm { BR              X10 }
  }
  if ((unint64_t)v2 >> 62)
  {
    if (v2 >= 0)
      v45 = v2 & 0xFFFFFFFFFFFFFF8;
    else
      v45 = v0[3];
    swift_bridgeObjectRetain();
    v24 = _CocoaArrayWrapper.endIndex.getter(v45);
    if (v24)
      goto LABEL_5;
LABEL_18:
    sub_10014ACB0(v2, v3, v25, v26, v27, v28, v29, v30);
    goto LABEL_19;
  }
  v24 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v24)
    goto LABEL_18;
LABEL_5:
  sub_100091C44(0, v24 & ~(v24 >> 63), 0);
  if (v24 < 0)
  {
    __break(1u);
    JUMPOUT(0x10014BB28);
  }
  v87 = v1;
  v31 = 0;
  do
  {
    if ((v2 & 0xC000000000000001) != 0)
    {
      v32 = specialized _ArrayBuffer._getElementSlowPath(_:)(v31, v2);
    }
    else
    {
      v32 = *(_QWORD *)(v2 + 8 * v31 + 32);
      swift_retain();
    }
    v33 = TLV.debugDescription.getter();
    v35 = v34;
    swift_release(v32);
    v43 = *(_QWORD *)&_swiftEmptyArrayStorage.instance[8];
    v42 = *(_QWORD *)&_swiftEmptyArrayStorage.instance[16];
    if (v43 >= v42 >> 1)
      sub_100091C44(v42 > 1, v43 + 1, 1);
    ++v31;
    *(_QWORD *)&_swiftEmptyArrayStorage.instance[8] = v43 + 1;
    v44 = (char *)&_swiftEmptyArrayStorage + 16 * v43;
    *((_QWORD *)v44 + 4) = v33;
    *((_QWORD *)v44 + 5) = v35;
  }
  while (v24 != v31);
  sub_10014ACB0(v2, v3, v36, v37, v38, v39, v40, v41);
  v1 = v87;
LABEL_19:
  v46 = sub_100003A2C((uint64_t *)&unk_1001AE460);
  v47 = sub_1000248C8();
  v48 = BidirectionalCollection<>.joined(separator:)(8236, 0xE200000000000000, v46, v47);
  v50 = (_TtC14softposreaderd12RemoteReader *)v49;
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage, v49, v51, v52, v53, v54, v55, v56);
  _StringGuts.grow(_:)(29);
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)0xE000000000000000, v57, v58, v59, v60, v61, v62, v63);
  v64 = v1[2];
  v65 = sub_100003A2C((uint64_t *)&unk_1001B1300);
  v66 = swift_allocObject(v65, 72, 7);
  *(_OWORD *)(v66 + 16) = xmmword_10015A5F0;
  *(_QWORD *)(v66 + 56) = &type metadata for UInt;
  *(_QWORD *)(v66 + 64) = &protocol witness table for UInt;
  *(_QWORD *)(v66 + 32) = v64;
  v67._countAndFlagsBits = String.init(format:_:)(1479684133, 0xE400000000000000, v66);
  v68 = (_TtC14softposreaderd12RemoteReader *)v67._object;
  String.append(_:)(v67);
  swift_bridgeObjectRelease(v68, v69, v70, v71, v72, v73, v74, v75);
  v76._countAndFlagsBits = 0x72646C696863202CLL;
  v76._object = (void *)0xEE00205B203A6E65;
  String.append(_:)(v76);
  v77._countAndFlagsBits = v48;
  v77._object = v50;
  String.append(_:)(v77);
  swift_bridgeObjectRelease(v50, v78, v79, v80, v81, v82, v83, v84);
  v85._countAndFlagsBits = 2099272992;
  v85._object = (void *)0xE400000000000000;
  String.append(_:)(v85);
  return 0x203A676174207BLL;
}

uint64_t static TLV.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  char v9;

  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v2 = TLV.value.getter();
  v4 = v3;
  v5 = TLV.value.getter();
  v7 = v6;
  sub_1001288E0(v2, v4);
  v9 = v8;
  sub_100005DE0(v5, v7);
  sub_100005DE0(v2, v4);
  return v9 & 1;
}

uint64_t TLV.firstChild(tag:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  if ((v4 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    if ((unint64_t)v3 >> 62)
    {
LABEL_17:
      if (v3 < 0)
        v26 = v3;
      else
        v26 = v3 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      v13 = _CocoaArrayWrapper.endIndex.getter(v26);
      if (!v13)
        goto LABEL_26;
      goto LABEL_5;
    }
  }
  else
  {
    sub_10014ACA4(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
    sub_10014FD18(v3, v4);
    v6 = v5;
    sub_10014ACB0(v3, v4, v7, v8, v9, v10, v11, v12);
    v18 = *(_QWORD *)(v1 + 24);
    v19 = *(_QWORD *)(v1 + 32);
    *(_QWORD *)(v1 + 24) = v6;
    *(_QWORD *)(v1 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_10014ACB0(v18, v19, v20, v21, v22, v23, v24, v25);
    v3 = v6;
    if (v6 >> 62)
      goto LABEL_17;
  }
  v13 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v13)
  {
LABEL_26:
    swift_bridgeObjectRelease_n(v3, 2);
    return 0;
  }
LABEL_5:
  v14 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_31;
  v15 = *(_QWORD *)(v3 + 32);
  swift_retain();
  while (*(_QWORD *)(v15 + 16) != a1)
  {
    swift_release(v15);
    if (v13 == 1)
      goto LABEL_26;
    if (v14)
    {
      v14 = 1;
      while (1)
      {
        v16 = specialized _ArrayBuffer._getElementSlowPath(_:)(v14, v3);
        v17 = v14 + 1;
        if (__OFADD__(v14, 1))
          break;
        v15 = v16;
        if (*(_QWORD *)(v16 + 16) == a1)
          goto LABEL_8;
        swift_unknownObjectRelease(v16);
        ++v14;
        if (v17 == v13)
          goto LABEL_26;
      }
      __break(1u);
    }
    else
    {
      v27 = 5;
      while (1)
      {
        v28 = v27 - 3;
        if (__OFADD__(v27 - 4, 1))
          break;
        v15 = *(_QWORD *)(v3 + 8 * v27);
        if (*(_QWORD *)(v15 + 16) == a1)
        {
          swift_retain();
          goto LABEL_8;
        }
        ++v27;
        if (v28 == v13)
          goto LABEL_26;
      }
    }
    __break(1u);
LABEL_31:
    v15 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v3);
  }
LABEL_8:
  swift_bridgeObjectRelease_n(v3, 2);
  return v15;
}

void TLV.filterChildren(tag:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  SEL v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  if ((v4 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_10014ACA4(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
    sub_10014FD18(v3, v4);
    v6 = v5;
    sub_10014ACB0(v3, v4, v7, v8, v9, v10, v11, v12);
    v13 = *(_QWORD *)(v1 + 24);
    v14 = *(_QWORD *)(v1 + 32);
    *(_QWORD *)(v1 + 24) = v6;
    *(_QWORD *)(v1 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_10014ACB0(v13, v14, v15, v16, v17, v18, v19, v20);
    v3 = v6;
  }
  if (!((unint64_t)v3 >> 62))
  {
    v28 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v28)
      goto LABEL_6;
LABEL_21:
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v3, v21, v22, v23, v24, v25, v26, v27);
    return;
  }
  if (v3 < 0)
    v39 = v3;
  else
    v39 = v3 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v28 = _CocoaArrayWrapper.endIndex.getter(v39);
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v3, v40, v41, v42, v43, v44, v45, v46);
  if (!v28)
    goto LABEL_21;
LABEL_6:
  if (v28 >= 1)
  {
    if ((v3 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v28; ++i)
      {
        v32 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v3);
        v33 = v32;
        if (*(_QWORD *)(v32 + 16) == a1)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v32);
          v30 = *(_QWORD *)&_swiftEmptyArrayStorage.instance[8];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v30);
          v31 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v30, v33);
          specialized ContiguousArray._endMutation()(v31);
        }
        else
        {
          swift_unknownObjectRelease(v32);
        }
      }
    }
    else
    {
      for (j = 0; j != v28; ++j)
      {
        v35 = *(_QWORD *)(v3 + 8 * j + 32);
        if (*(_QWORD *)(v35 + 16) == a1)
        {
          v36 = swift_retain();
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v36);
          v37 = *(_QWORD *)&_swiftEmptyArrayStorage.instance[8];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v37);
          v38 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v37, v35);
          specialized ContiguousArray._endMutation()(v38);
        }
      }
    }
    goto LABEL_21;
  }
  __break(1u);
}

_QWORD *TLV.__allocating_init(tag:BOOLean:)(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD *result;

  v4 = sub_100003A2C(&qword_1001AC678);
  v5 = swift_allocObject(v4, 33, 7);
  *(_OWORD *)(v5 + 16) = xmmword_10015A5F0;
  *(_BYTE *)(v5 + 32) = a2;
  v6 = sub_10010DD5C(v5);
  v8 = v7;
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v5, v7, v9, v10, v11, v12, v13, v14);
  v15 = type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject(v15, 40, 7);
  result[2] = a1;
  result[3] = v6;
  result[4] = v8;
  return result;
}

_QWORD *TLV.__allocating_init(tag:uint16:)(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  __int16 v8;
  uint64_t v9;

  v8 = bswap32(a2) >> 16;
  v3 = sub_1000FA728((uint64_t)&v8, (uint64_t)&v9);
  v5 = v4;
  v6 = type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject(v6, 40, 7);
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

_QWORD *TLV.__allocating_init(tag:uint32:)(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  unsigned int v8;
  uint64_t v9;

  v8 = bswap32(a2);
  v3 = sub_1000FA728((uint64_t)&v8, (uint64_t)&v9);
  v5 = v4;
  v6 = type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject(v6, 40, 7);
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

_QWORD *TLV.__allocating_init(tag:uint64:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  unint64_t v8;
  uint64_t v9;

  v8 = bswap64(a2);
  v3 = sub_1000FA728((uint64_t)&v8, (uint64_t)&v9);
  v5 = v4;
  v6 = type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject(v6, 40, 7);
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

uint64_t TLV.uint8Value.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  __int16 v3;
  __int16 v4;

  v0 = TLV.value.getter();
  v2 = v1;
  sub_1000BECB0(v0, v1);
  v4 = v3;
  sub_100005DE0(v0, v2);
  return v4 & 0x1FF;
}

void TLV.uint16Value.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _OWORD v28[2];
  _OWORD v29[2];

  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  if ((v3 & 0x2000000000000000) == 0)
  {
    sub_100005D9C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    goto LABEL_14;
  }
  v4 = (void *)objc_opt_self(NSOutputStream);
  swift_bridgeObjectRetain();
  v5 = objc_msgSend(v4, "outputStreamToMemory");
  objc_msgSend(v5, "open");
  v12 = v2 & 0xFFFFFFFFFFFFFF8;
  if ((unint64_t)v2 >> 62)
    goto LABEL_16;
  v13 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v13)
  {
LABEL_12:
    sub_10014ACB0(v2, v3, v6, v7, v8, v9, v10, v11);
    objc_msgSend(v5, "close");
    v19 = objc_msgSend(v5, "propertyForKey:", NSStreamDataWrittenToMemoryStreamKey);
    if (!v19)
    {
      __break(1u);
      swift_unexpectedError(v1, "SPRBase/TLV.swift", 17, 1, 116);
      __break(1u);
      JUMPOUT(0x10014C520);
    }
    v20 = v19;
    _bridgeAnyObjectToAny(_:)(v28, v19);

    swift_unknownObjectRelease(v20);
    sub_100005D2C(v28, v29);
    swift_dynamicCast(v27, v29, (char *)&type metadata for Any + 8, &type metadata for Data, 7);
    v3 = v27[1];
LABEL_14:
    __asm { BR              X10 }
  }
LABEL_5:
  v1 = 0;
  v14 = 4;
  while (1)
  {
    v15 = v14 - 4;
    if ((v2 & 0xC000000000000001) != 0)
    {
      v16 = (unint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)(v14 - 4, v2);
      v17 = __OFADD__(v15, 1);
      v18 = v14 - 3;
      if (v17)
        goto LABEL_15;
    }
    else
    {
      v16 = *(unint64_t **)(v2 + 8 * v14);
      swift_retain();
      v17 = __OFADD__(v15, 1);
      v18 = v14 - 3;
      if (v17)
      {
LABEL_15:
        __break(1u);
LABEL_16:
        if (v2 >= 0)
          v1 = v12;
        else
          v1 = v2;
        swift_bridgeObjectRetain();
        v13 = _CocoaArrayWrapper.endIndex.getter(v1);
        sub_10014ACB0(v2, v3, v21, v22, v23, v24, v25, v26);
        if (!v13)
          goto LABEL_12;
        goto LABEL_5;
      }
    }
    sub_10014AEBC(v16);
    swift_release();
    ++v14;
    if (v18 == v13)
      goto LABEL_12;
  }
}

void TLV.uint32Value.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _OWORD v28[2];
  _OWORD v29[2];

  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  if ((v3 & 0x2000000000000000) == 0)
  {
    sub_100005D9C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    goto LABEL_14;
  }
  v4 = (void *)objc_opt_self(NSOutputStream);
  swift_bridgeObjectRetain();
  v5 = objc_msgSend(v4, "outputStreamToMemory");
  objc_msgSend(v5, "open");
  v12 = v2 & 0xFFFFFFFFFFFFFF8;
  if ((unint64_t)v2 >> 62)
    goto LABEL_16;
  v13 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v13)
  {
LABEL_12:
    sub_10014ACB0(v2, v3, v6, v7, v8, v9, v10, v11);
    objc_msgSend(v5, "close");
    v19 = objc_msgSend(v5, "propertyForKey:", NSStreamDataWrittenToMemoryStreamKey);
    if (!v19)
    {
      __break(1u);
      swift_unexpectedError(v1, "SPRBase/TLV.swift", 17, 1, 116);
      __break(1u);
      JUMPOUT(0x10014C800);
    }
    v20 = v19;
    _bridgeAnyObjectToAny(_:)(v28, v19);

    swift_unknownObjectRelease(v20);
    sub_100005D2C(v28, v29);
    swift_dynamicCast(v27, v29, (char *)&type metadata for Any + 8, &type metadata for Data, 7);
    v3 = v27[1];
LABEL_14:
    __asm { BR              X10 }
  }
LABEL_5:
  v1 = 0;
  v14 = 4;
  while (1)
  {
    v15 = v14 - 4;
    if ((v2 & 0xC000000000000001) != 0)
    {
      v16 = (unint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)(v14 - 4, v2);
      v17 = __OFADD__(v15, 1);
      v18 = v14 - 3;
      if (v17)
        goto LABEL_15;
    }
    else
    {
      v16 = *(unint64_t **)(v2 + 8 * v14);
      swift_retain();
      v17 = __OFADD__(v15, 1);
      v18 = v14 - 3;
      if (v17)
      {
LABEL_15:
        __break(1u);
LABEL_16:
        if (v2 >= 0)
          v1 = v12;
        else
          v1 = v2;
        swift_bridgeObjectRetain();
        v13 = _CocoaArrayWrapper.endIndex.getter(v1);
        sub_10014ACB0(v2, v3, v21, v22, v23, v24, v25, v26);
        if (!v13)
          goto LABEL_12;
        goto LABEL_5;
      }
    }
    sub_10014AEBC(v16);
    swift_release();
    ++v14;
    if (v18 == v13)
      goto LABEL_12;
  }
}

void TLV.uint64Value.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _OWORD v28[2];
  _OWORD v29[2];

  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  if ((v3 & 0x2000000000000000) == 0)
  {
    sub_100005D9C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    goto LABEL_14;
  }
  v4 = (void *)objc_opt_self(NSOutputStream);
  swift_bridgeObjectRetain();
  v5 = objc_msgSend(v4, "outputStreamToMemory");
  objc_msgSend(v5, "open");
  v12 = v2 & 0xFFFFFFFFFFFFFF8;
  if ((unint64_t)v2 >> 62)
    goto LABEL_16;
  v13 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v13)
  {
LABEL_12:
    sub_10014ACB0(v2, v3, v6, v7, v8, v9, v10, v11);
    objc_msgSend(v5, "close");
    v19 = objc_msgSend(v5, "propertyForKey:", NSStreamDataWrittenToMemoryStreamKey);
    if (!v19)
    {
      __break(1u);
      swift_unexpectedError(v1, "SPRBase/TLV.swift", 17, 1, 116);
      __break(1u);
      JUMPOUT(0x10014CAD4);
    }
    v20 = v19;
    _bridgeAnyObjectToAny(_:)(v28, v19);

    swift_unknownObjectRelease(v20);
    sub_100005D2C(v28, v29);
    swift_dynamicCast(v27, v29, (char *)&type metadata for Any + 8, &type metadata for Data, 7);
    v3 = v27[1];
LABEL_14:
    __asm { BR              X10 }
  }
LABEL_5:
  v1 = 0;
  v14 = 4;
  while (1)
  {
    v15 = v14 - 4;
    if ((v2 & 0xC000000000000001) != 0)
    {
      v16 = (unint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)(v14 - 4, v2);
      v17 = __OFADD__(v15, 1);
      v18 = v14 - 3;
      if (v17)
        goto LABEL_15;
    }
    else
    {
      v16 = *(unint64_t **)(v2 + 8 * v14);
      swift_retain();
      v17 = __OFADD__(v15, 1);
      v18 = v14 - 3;
      if (v17)
      {
LABEL_15:
        __break(1u);
LABEL_16:
        if (v2 >= 0)
          v1 = v12;
        else
          v1 = v2;
        swift_bridgeObjectRetain();
        v13 = _CocoaArrayWrapper.endIndex.getter(v1);
        sub_10014ACB0(v2, v3, v21, v22, v23, v24, v25, v26);
        if (!v13)
          goto LABEL_12;
        goto LABEL_5;
      }
    }
    sub_10014AEBC(v16);
    swift_release();
    ++v14;
    if (v18 == v13)
      goto LABEL_12;
  }
}

uint64_t sub_10014CAE4()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for TLV();
  result = swift_initStaticObject(v0, &unk_1001B4610);
  static TLV.null = result;
  return result;
}

uint64_t *TLV.null.unsafeMutableAddressor()
{
  if (qword_1001B45E8 != -1)
    swift_once(&qword_1001B45E8, sub_10014CAE4);
  return &static TLV.null;
}

uint64_t static TLV.null.getter()
{
  uint64_t v0;

  v0 = type metadata accessor for TLV();
  return swift_initStaticObject(v0, &unk_1001B4610);
}

_QWORD *TLV.__allocating_init<A>(tag:integer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v6;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t AssociatedConformanceWitness;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char *v48;
  uint64_t v49;
  _TtC14softposreaderd12RemoteReader *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char *v56;
  void (*v57)(unint64_t, uint64_t);
  int64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  char v69;
  unsigned int v70;
  char *v71;
  unsigned __int8 v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *result;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  void (*v89)(char *, uint64_t, uint64_t);
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  char *v94;
  _TtC14softposreaderd12RemoteReader *v95;
  uint64_t v96;
  uint64_t AssociatedTypeWitness;
  uint64_t v98;
  char *v99;
  _TtC14softposreaderd12RemoteReader *v100;
  uint64_t v101;

  v86 = a1;
  v6 = *(_QWORD **)(a4 + 8);
  v7 = *(_QWORD *)(v6[3] + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v7, a3, &protocol requirements base descriptor for ExpressibleByIntegerLiteral);
  v8 = __chkstk_darwin(AssociatedTypeWitness);
  v93 = (char *)&v86 - v9;
  v98 = *(_QWORD *)(a3 - 8);
  v10 = __chkstk_darwin(v8);
  v88 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v91 = (char *)&v86 - v13;
  v14 = __chkstk_darwin(v12);
  v92 = (char *)&v86 - v15;
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v86 - v17;
  v19 = __chkstk_darwin(v16);
  v21 = (char *)&v86 - v20;
  v22 = __chkstk_darwin(v19);
  v24 = (char *)&v86 - v23;
  __chkstk_darwin(v22);
  v94 = (char *)&v86 - v25;
  v26 = dispatch thunk of static BinaryInteger.isSigned.getter(a3, v6);
  v87 = a2;
  v96 = v7;
  v99 = v24;
  if ((v26 & 1) == 0)
  {
    v30 = dispatch thunk of static BinaryInteger.isSigned.getter(a3, v6);
    v31 = dispatch thunk of BinaryInteger.bitWidth.getter(a3, v6);
    if ((v30 & 1) == 0)
    {
      v7 = v96;
      v29 = AssociatedTypeWitness;
      if (v31 < 64)
      {
        v36 = v98;
        v35 = v99;
        (*(void (**)(char *, uint64_t, uint64_t))(v98 + 16))(v99, a2, a3);
        v37 = dispatch thunk of BinaryInteger._lowWord.getter(a3, v6);
        (*(void (**)(char *, uint64_t))(v36 + 8))(v35, a3);
        if (v37 < 0)
          goto LABEL_18;
      }
      goto LABEL_17;
    }
    if (v31 <= 64)
    {
      v39 = v96;
      v38 = AssociatedTypeWitness;
      AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v96, a3, AssociatedTypeWitness, &protocol requirements base descriptor for ExpressibleByIntegerLiteral, &associated conformance descriptor for ExpressibleByIntegerLiteral.ExpressibleByIntegerLiteral.IntegerLiteralType: _ExpressibleByBuiltinIntegerLiteral);
      v41 = v93;
      dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(&unk_1001640F0, 256, v38, AssociatedConformanceWitness);
      dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v41, a3, v39);
      LOBYTE(v38) = dispatch thunk of static Comparable.< infix(_:_:)(a2, v24, a3, *(_QWORD *)(v6[4] + 8));
      v42 = a2;
      v43 = v98;
      v44 = *(void (**)(char *, uint64_t))(v98 + 8);
      v44(v24, a3);
      (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v21, v42, a3);
      if ((v38 & 1) != 0)
      {
        v44(v21, a3);
        a2 = v87;
        v7 = v96;
        v29 = AssociatedTypeWitness;
      }
      else
      {
        v45 = dispatch thunk of BinaryInteger._lowWord.getter(a3, v6);
        v44(v21, a3);
        a2 = v87;
        v7 = v96;
        v29 = AssociatedTypeWitness;
        if ((v45 & 0x8000000000000000) == 0)
          goto LABEL_17;
      }
LABEL_18:
      v46 = swift_getAssociatedConformanceWitness(v7, a3, v29, &protocol requirements base descriptor for ExpressibleByIntegerLiteral, &associated conformance descriptor for ExpressibleByIntegerLiteral.ExpressibleByIntegerLiteral.IntegerLiteralType: _ExpressibleByBuiltinIntegerLiteral);
      v47 = &unk_100164100;
      v48 = v93;
      v49 = 257;
      goto LABEL_19;
    }
    v101 = 0;
    v32 = sub_10013F680();
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)(&v101, &type metadata for Int, v32, a3, v6);
    v33 = dispatch thunk of static Comparable.< infix(_:_:)(a2, v24, a3, *(_QWORD *)(v6[4] + 8));
    (*(void (**)(char *, uint64_t))(v98 + 8))(v24, a3);
    v7 = v96;
    goto LABEL_9;
  }
  if (dispatch thunk of BinaryInteger.bitWidth.getter(a3, v6) >= 64)
  {
    v101 = 0;
    v34 = sub_10013F680();
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)(&v101, &type metadata for Int, v34, a3, v6);
    v33 = dispatch thunk of static Comparable.< infix(_:_:)(a2, v24, a3, *(_QWORD *)(v6[4] + 8));
    (*(void (**)(char *, uint64_t))(v98 + 8))(v24, a3);
LABEL_9:
    v29 = AssociatedTypeWitness;
    if ((v33 & 1) != 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  v27 = v98;
  (*(void (**)(char *, uint64_t, uint64_t))(v98 + 16))(v24, a2, a3);
  v28 = dispatch thunk of BinaryInteger._lowWord.getter(a3, v6);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v24, a3);
  v29 = AssociatedTypeWitness;
  if (v28 < 0)
    goto LABEL_18;
LABEL_17:
  v46 = swift_getAssociatedConformanceWitness(v7, a3, v29, &protocol requirements base descriptor for ExpressibleByIntegerLiteral, &associated conformance descriptor for ExpressibleByIntegerLiteral.ExpressibleByIntegerLiteral.IntegerLiteralType: _ExpressibleByBuiltinIntegerLiteral);
  v47 = &unk_1001640F0;
  v48 = v93;
  v49 = 256;
LABEL_19:
  v95 = (_TtC14softposreaderd12RemoteReader *)v46;
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(v47, v49, v29, v46);
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v48, a3, v7);
  v89 = *(void (**)(char *, uint64_t, uint64_t))(v98 + 16);
  v89(v18, a2, a3);
  v50 = &_swiftEmptyArrayStorage;
  v90 = v18;
  v51 = v92;
  do
  {
    v100 = v50;
    v52 = v93;
    v53 = AssociatedTypeWitness;
    v50 = v95;
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(&unk_1001640F8, 2304, AssociatedTypeWitness, v95);
    v54 = (unint64_t)v99;
    v55 = v96;
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v52, a3, v96);
    v56 = v18;
    v18 = v52;
    dispatch thunk of static BinaryInteger.& infix(_:_:)(v56, v54, a3, v6);
    v57 = *(void (**)(unint64_t, uint64_t))(v98 + 8);
    v57(v54, a3);
    if ((dispatch thunk of static BinaryInteger.isSigned.getter(a3, v6) & 1) != 0)
    {
      dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(&unk_1001640F0, 256, v53, v50);
      dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v18, a3, v55);
      v58 = dispatch thunk of static Comparable.>= infix(_:_:)(v51, v54, a3, *(_QWORD *)(v6[4] + 8));
      v57(v54, a3);
      if ((v58 & 1) == 0)
      {
        __break(1u);
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
    }
    if (dispatch thunk of BinaryInteger.bitWidth.getter(a3, v6) >= 8)
    {
      v89(v91, (uint64_t)v51, a3);
      LOBYTE(v101) = -1;
      v64 = dispatch thunk of static BinaryInteger.isSigned.getter(a3, v6);
      v65 = dispatch thunk of BinaryInteger.bitWidth.getter(a3, v6);
      if ((v64 & 1) != 0)
      {
        v54 = (unint64_t)v99;
        if (v65 > 8)
        {
          v66 = sub_1000F8434();
          goto LABEL_28;
        }
        dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(&unk_1001640F0, 256, AssociatedTypeWitness, v95);
        dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v18, a3, v96);
        v68 = v91;
        v69 = dispatch thunk of static Comparable.> infix(_:_:)(v91, v54, a3, *(_QWORD *)(v6[4] + 8));
        v57(v54, a3);
        v70 = v101;
        v18 = v88;
        (*(void (**)(char *, char *, uint64_t))(v98 + 32))(v88, v68, a3);
        if ((v69 & 1) != 0)
        {
          v58 = dispatch thunk of BinaryInteger._lowWord.getter(a3, v6);
          v57((unint64_t)v18, a3);
          if (v70 < v58)
            goto LABEL_47;
        }
        else
        {
          v57((unint64_t)v18, a3);
        }
      }
      else
      {
        if (v65 >= 9)
        {
          v66 = sub_1000F8434();
          v54 = (unint64_t)v99;
LABEL_28:
          dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)(&v101, &type metadata for UInt8, v66, a3, v6);
          v67 = v91;
          v58 = dispatch thunk of static Comparable.< infix(_:_:)(v54, v91, a3, *(_QWORD *)(v6[4] + 8));
          v57(v54, a3);
          v57((unint64_t)v67, a3);
          if ((v58 & 1) != 0)
            goto LABEL_47;
          goto LABEL_36;
        }
        v71 = v91;
        v58 = dispatch thunk of BinaryInteger._lowWord.getter(a3, v6);
        v57((unint64_t)v71, a3);
        v63 = v101;
        if (v101 < v58)
          goto LABEL_47;
      }
    }
LABEL_36:
    v72 = dispatch thunk of BinaryInteger._lowWord.getter(a3, v6);
    v57((unint64_t)v51, a3);
    v50 = v100;
    if ((swift_isUniquelyReferenced_nonNull_native(v100) & 1) == 0)
      v50 = sub_10009137C(0, *(_QWORD *)&v50->instance[8] + 1, 1, (uint64_t)v50, v73, v74, v75, v76);
    v78 = *(_QWORD *)&v50->instance[8];
    v77 = *(_QWORD *)&v50->instance[16];
    if (v78 >= v77 >> 1)
      v50 = sub_10009137C((_TtC14softposreaderd12RemoteReader *)(v77 > 1), v78 + 1, 1, (uint64_t)v50, v73, v74, v75, v76);
    *(_QWORD *)&v50->instance[8] = v78 + 1;
    v50->instance[v78 + 24] = v72;
    v101 = 8;
    v79 = sub_10013F680();
    v18 = v90;
    dispatch thunk of static BinaryInteger.>>= infix<A>(_:_:)(v90, &v101, &type metadata for Int, v79, a3, v6);
  }
  while ((dispatch thunk of static Equatable.== infix(_:_:)(v18, v94, a3, *(_QWORD *)(v6[2] + 8)) & 1) == 0);
  v58 = (int64_t)v94;
  v80 = dispatch thunk of BinaryInteger._lowWord.getter(a3, v6);
  v54 = *(_QWORD *)&v50->instance[8];
  if (!v54)
  {
LABEL_48:
    __break(1u);
LABEL_49:
    v50 = sub_10009137C((_TtC14softposreaderd12RemoteReader *)(v63 > 1), v58, 1, (uint64_t)v50, v59, v60, v61, v62);
    goto LABEL_44;
  }
  LOBYTE(v51) = v80;
  if (((v50->instance[v54 + 23] ^ v80) & 0x80) == 0)
    goto LABEL_45;
  v63 = *(_QWORD *)&v50->instance[16];
  v58 = v54 + 1;
  if (v54 >= v63 >> 1)
    goto LABEL_49;
LABEL_44:
  *(_QWORD *)&v50->instance[8] = v58;
  v50->instance[v54 + 24] = v51;
LABEL_45:
  v81 = sub_1001466C0((uint64_t)v50);
  v83 = v82;
  v57(v87, a3);
  v57((unint64_t)v18, a3);
  v57((unint64_t)v94, a3);
  v84 = type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject(v84, 40, 7);
  result[2] = v86;
  result[3] = v81;
  result[4] = v83;
  return result;
}

_QWORD *TLV.__allocating_init(tag:bitString:)(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD *result;

  v8 = sub_100003A2C(&qword_1001AC678);
  v9 = swift_allocObject(v8, 33, 7);
  *(_OWORD *)(v9 + 16) = xmmword_10015A5F0;
  *(_BYTE *)(v9 + 32) = a4;
  v10 = sub_10010DD5C(v9);
  v12 = (unint64_t)v11;
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v9, v11, v13, v14, v15, v16, v17, v18);
  sub_100005D9C(a2, a3);
  sub_100005D9C(v10, v12);
  sub_10012465C(a2, a3);
  sub_100005DE0(a2, a3);
  sub_100005DE0(v10, v12);
  sub_100005DE0(a2, a3);
  v19 = type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject(v19, 40, 7);
  result[2] = a1;
  result[3] = v10;
  result[4] = v12;
  return result;
}

_QWORD *TLV.__allocating_init(tag:oid:)(uint64_t a1, _TtC14softposreaderd12RemoteReader *a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *result;

  OID.derRepresentation.getter(a2);
  v5 = v4;
  v7 = v6;
  swift_bridgeObjectRelease(a2, v6, v8, v9, v10, v11, v12, v13);
  v14 = type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject(v14, 40, 7);
  result[2] = a1;
  result[3] = v5;
  result[4] = v7;
  return result;
}

_QWORD *TLV.__allocating_init(tag:string:)(uint64_t a1, uint64_t a2, _TtC14softposreaderd12RemoteReader *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *result;
  uint64_t v21;
  uint64_t v22;

  v6 = type metadata accessor for String.Encoding(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String.Encoding.utf8.getter(v8);
  v11 = String.data(using:allowLossyConversion:)(v10, 0, a2, a3);
  v13 = v12;
  swift_bridgeObjectRelease(a3, v12, v14, v15, v16, v17, v18, v19);
  result = (_QWORD *)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  if ((unint64_t)v13 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    v21 = type metadata accessor for TLV();
    result = (_QWORD *)swift_allocObject(v21, 40, 7);
    result[2] = a1;
    result[3] = v11;
    result[4] = v13;
  }
  return result;
}

void TLV.isNull.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _OWORD v28[2];
  _OWORD v29[2];

  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  if ((v3 & 0x2000000000000000) == 0)
  {
    sub_100005D9C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    goto LABEL_14;
  }
  v4 = (void *)objc_opt_self(NSOutputStream);
  swift_bridgeObjectRetain();
  v5 = objc_msgSend(v4, "outputStreamToMemory");
  objc_msgSend(v5, "open");
  v12 = v2 & 0xFFFFFFFFFFFFFF8;
  if ((unint64_t)v2 >> 62)
    goto LABEL_16;
  v13 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v13)
  {
LABEL_12:
    sub_10014ACB0(v2, v3, v6, v7, v8, v9, v10, v11);
    objc_msgSend(v5, "close");
    v19 = objc_msgSend(v5, "propertyForKey:", NSStreamDataWrittenToMemoryStreamKey);
    if (!v19)
    {
      __break(1u);
      swift_unexpectedError(v1, "SPRBase/TLV.swift", 17, 1, 116);
      __break(1u);
      JUMPOUT(0x10014D990);
    }
    v20 = v19;
    _bridgeAnyObjectToAny(_:)(v28, v19);

    swift_unknownObjectRelease(v20);
    sub_100005D2C(v28, v29);
    swift_dynamicCast(v27, v29, (char *)&type metadata for Any + 8, &type metadata for Data, 7);
    v3 = v27[1];
LABEL_14:
    __asm { BR              X10 }
  }
LABEL_5:
  v1 = 0;
  v14 = 4;
  while (1)
  {
    v15 = v14 - 4;
    if ((v2 & 0xC000000000000001) != 0)
    {
      v16 = (unint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)(v14 - 4, v2);
      v17 = __OFADD__(v15, 1);
      v18 = v14 - 3;
      if (v17)
        goto LABEL_15;
    }
    else
    {
      v16 = *(unint64_t **)(v2 + 8 * v14);
      swift_retain();
      v17 = __OFADD__(v15, 1);
      v18 = v14 - 3;
      if (v17)
      {
LABEL_15:
        __break(1u);
LABEL_16:
        if (v2 >= 0)
          v1 = v12;
        else
          v1 = v2;
        swift_bridgeObjectRetain();
        v13 = _CocoaArrayWrapper.endIndex.getter(v1);
        sub_10014ACB0(v2, v3, v21, v22, v23, v24, v25, v26);
        if (!v13)
          goto LABEL_12;
        goto LABEL_5;
      }
    }
    sub_10014AEBC(v16);
    swift_release();
    ++v14;
    if (v18 == v13)
      goto LABEL_12;
  }
}

uint64_t TLV.BOOLeanValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  __int16 v3;
  __int16 v4;

  v0 = TLV.value.getter();
  v2 = v1;
  sub_1000BECB0(v0, v1);
  v4 = v3;
  sub_100005DE0(v0, v2);
  if ((v4 & 0x100) != 0)
    return 2;
  else
    return v4 != 0;
}

uint64_t TLV.integerValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  __int16 v4;
  __int16 v5;

  v0 = type metadata accessor for Data.Iterator(0);
  __chkstk_darwin(v0);
  v1 = TLV.value.getter();
  v3 = v2;
  sub_1000BECB0(v1, v2);
  v5 = v4;
  sub_100005DE0(v1, v3);
  if ((v5 & 0x100) == 0)
  {
    TLV.value.getter();
    __asm { BR              X10 }
  }
  return 0;
}

uint64_t TLV.bitStringValue.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = TLV.value.getter();
  return _s7SPRBase9BitStringV17derRepresentationACSg10Foundation4DataV_tcfC_0(v0, v1);
}

uint64_t TLV.oidValue.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = TLV.value.getter();
  return _s7SPRBase3OIDV17derRepresentationACSg10Foundation4DataV_tcfC_0(v0, v1);
}

uint64_t TLV.stringValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = type metadata accessor for String.Encoding(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = TLV.value.getter();
  v5 = v4;
  static String.Encoding.utf8.getter(v3);
  v6 = String.init(data:encoding:)(v3, v5, v2);
  sub_100005DE0(v3, v5);
  return v6;
}

uint64_t TLV.deinit(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v8;

  sub_10014ACB0(*(_QWORD *)(v8 + 24), *(_QWORD *)(v8 + 32), a3, a4, a5, a6, a7, a8);
  return v8;
}

uint64_t TLV.__deallocating_deinit(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v8;

  sub_10014ACB0(*(_QWORD *)(v8 + 24), *(_QWORD *)(v8 + 32), a3, a4, a5, a6, a7, a8);
  return swift_deallocClassInstance(v8, 40, 7);
}

Swift::Int TLV.hashValue.getter()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1);
  TLV.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

uint64_t sub_10014DD90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  char v9;

  if (*(_QWORD *)(*(_QWORD *)a1 + 16) != *(_QWORD *)(*(_QWORD *)a2 + 16))
    return 0;
  v2 = TLV.value.getter();
  v4 = v3;
  v5 = TLV.value.getter();
  v7 = v6;
  sub_1001288E0(v2, v4);
  v9 = v8;
  sub_100005DE0(v5, v7);
  sub_100005DE0(v2, v4);
  return v9 & 1;
}

Swift::Int sub_10014DE28()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1);
  TLV.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

void sub_10014DE68(uint64_t a1)
{
  TLV.hash(into:)(a1);
}

Swift::Int sub_10014DE88()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1);
  TLV.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

uint64_t sub_10014DEC4()
{
  return TLV.debugDescription.getter();
}

uint64_t Collection<>.dataRepresentation.getter(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = xmmword_10015DF40;
  Sequence.reduce<A>(into:_:)(&v4, &v3, sub_10014DF40, 0, a1, &type metadata for Data, *(_QWORD *)(a2 + 8));
  return v4;
}

uint64_t sub_10014DF40()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;

  v0 = TLV.dataRepresentation.getter();
  v2 = v1;
  Data.append(_:)(v0, v1);
  return sub_100005DE0(v0, v2);
}

uint64_t Collection<>.first(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[5];
  uint64_t v5;

  v4[2] = a1;
  Sequence.first(where:)(&v5, sub_10014FFDC, v4, a2, *(_QWORD *)(a3 + 8));
  return v5;
}

uint64_t Collection<>.filter(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;

  __chkstk_darwin(a1);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(&v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)], v3, a2);
  v11 = a1;
  return Sequence.filter(_:)(sub_1001500B8, v10, a2, *(_QWORD *)(a3 + 8));
}

uint64_t IteratorProtocol<>.next(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;

  dispatch thunk of IteratorProtocol.next()(a2, a3);
  result = v8;
  if (v8)
  {
    if (*(_QWORD *)(v8 + 16) == a1)
      return result;
    swift_release();
  }
  v5 = sub_10014A744();
  v6 = swift_allocError(&type metadata for TLVError, v5, 0, 0);
  *v7 = 3;
  return swift_willThrow(v6);
}

uint64_t IteratorProtocol<>.nextValue(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  result = IteratorProtocol<>.next(tag:)(a1, a2, a3);
  if (!v3)
  {
    v5 = TLV.value.getter();
    swift_release();
    return v5;
  }
  return result;
}

uint64_t IteratorProtocol<>.nextUInt8(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;

  IteratorProtocol<>.next(tag:)(a1, a2, a3);
  if (!v3)
  {
    v5 = TLV.value.getter();
    v7 = v6;
    sub_1000BECB0(v5, v6);
    v4 = v8;
    sub_100005DE0(v5, v7);
    swift_release();
    if ((v4 & 0x100) != 0)
    {
      v9 = sub_10014A744();
      v10 = swift_allocError(&type metadata for TLVError, v9, 0, 0);
      *v11 = 4;
      swift_willThrow(v10);
    }
  }
  return v4;
}

uint64_t IteratorProtocol<>.nextUInt16(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _BYTE *v8;

  IteratorProtocol<>.next(tag:)(a1, a2, a3);
  if (!v4)
  {
    TLV.uint16Value.getter();
    v3 = v5;
    swift_release();
    if ((v3 & 0x10000) != 0)
    {
      v6 = sub_10014A744();
      v7 = swift_allocError(&type metadata for TLVError, v6, 0, 0);
      *v8 = 4;
      swift_willThrow(v7);
    }
  }
  return v3;
}

uint64_t IteratorProtocol<>.nextUInt32(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _BYTE *v8;

  IteratorProtocol<>.next(tag:)(a1, a2, a3);
  if (!v4)
  {
    TLV.uint32Value.getter();
    v3 = v5;
    swift_release();
    if ((v3 & 0x100000000) != 0)
    {
      v6 = sub_10014A744();
      v7 = swift_allocError(&type metadata for TLVError, v6, 0, 0);
      *v8 = 4;
      swift_willThrow(v7);
    }
  }
  return v3;
}

uint64_t IteratorProtocol<>.nextUInt64(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10014E564(a1, a2, a3, (uint64_t (*)(void))TLV.uint64Value.getter);
}

char *IteratorProtocol<>.nextString(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;

  v7 = type metadata accessor for String.Encoding(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  IteratorProtocol<>.next(tag:)(a1, a2, a3);
  if (!v3)
  {
    v10 = TLV.value.getter();
    v12 = v11;
    static String.Encoding.utf8.getter(v10);
    v9 = (char *)String.init(data:encoding:)(v10, v12, v9);
    v14 = v13;
    sub_100005DE0(v10, v12);
    swift_release();
    if (!v14)
    {
      v16 = sub_10014A744();
      v17 = swift_allocError(&type metadata for TLVError, v16, 0, 0);
      *v18 = 4;
      swift_willThrow(v17);
    }
  }
  return v9;
}

uint64_t IteratorProtocol<>.nextNull(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  char v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;

  result = IteratorProtocol<>.next(tag:)(a1, a2, a3);
  if (!v3)
  {
    TLV.isNull.getter();
    v6 = v5;
    result = swift_release();
    if ((v6 & 1) == 0)
    {
      v7 = sub_10014A744();
      v8 = swift_allocError(&type metadata for TLVError, v7, 0, 0);
      *v9 = 4;
      return swift_willThrow(v8);
    }
  }
  return result;
}

BOOL IteratorProtocol<>.nextBoolean(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __int16 v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;
  _BYTE *v12;

  IteratorProtocol<>.next(tag:)(a1, a2, a3);
  if (!v3)
  {
    v5 = TLV.value.getter();
    v7 = v6;
    sub_1000BECB0(v5, v6);
    v9 = v8;
    sub_100005DE0(v5, v7);
    swift_release();
    if ((v9 & 0x100) != 0)
    {
      v10 = sub_10014A744();
      v11 = swift_allocError(&type metadata for TLVError, v10, 0, 0);
      *v12 = 4;
      swift_willThrow(v11);
    }
    else
    {
      return v9 != 0;
    }
  }
  return v4;
}

uint64_t IteratorProtocol<>.nextInteger(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10014E564(a1, a2, a3, TLV.integerValue.getter);
}

uint64_t sub_10014E564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t v5;
  char v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;

  IteratorProtocol<>.next(tag:)(a1, a2, a3);
  if (!v5)
  {
    v4 = a4();
    v8 = v7;
    swift_release();
    if ((v8 & 1) != 0)
    {
      v9 = sub_10014A744();
      v10 = swift_allocError(&type metadata for TLVError, v9, 0, 0);
      *v11 = 4;
      swift_willThrow(v10);
    }
  }
  return v4;
}

uint64_t IteratorProtocol<>.nextBitString(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;

  IteratorProtocol<>.next(tag:)(a1, a2, a3);
  if (!v4)
  {
    v5 = TLV.value.getter();
    v3 = _s7SPRBase9BitStringV17derRepresentationACSg10Foundation4DataV_tcfC_0(v5, v6);
    v8 = v7;
    swift_release();
    if (v8 >> 60 == 15)
    {
      v9 = sub_10014A744();
      v10 = swift_allocError(&type metadata for TLVError, v9, 0, 0);
      *v11 = 4;
      swift_willThrow(v10);
    }
  }
  return v3;
}

uint64_t IteratorProtocol<>.nextOctetString(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;

  IteratorProtocol<>.next(tag:)(a1, a2, a3);
  if (!v4)
  {
    v3 = TLV.value.getter();
    v6 = v5;
    swift_release();
    if (v6 >> 60 == 15)
    {
      v7 = sub_10014A744();
      v8 = swift_allocError(&type metadata for TLVError, v7, 0, 0);
      *v9 = 4;
      swift_willThrow(v8);
    }
  }
  return v3;
}

uint64_t IteratorProtocol<>.nextOID(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;

  IteratorProtocol<>.next(tag:)(a1, a2, a3);
  if (!v3)
  {
    v5 = TLV.value.getter();
    v4 = _s7SPRBase3OIDV17derRepresentationACSg10Foundation4DataV_tcfC_0(v5, v6);
    swift_release();
    if (!v4)
    {
      v8 = sub_10014A744();
      v9 = swift_allocError(&type metadata for TLVError, v8, 0, 0);
      *v10 = 4;
      swift_willThrow(v9);
    }
  }
  return v4;
}

uint64_t IteratorProtocol<>.nextConstructed(tag:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = IteratorProtocol<>.next(tag:)(a1, a2, a3);
  if (!v3)
  {
    v6 = v5;
    v4 = *(_QWORD *)(v5 + 24);
    v7 = *(_QWORD *)(v5 + 32);
    if ((v7 & 0x2000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_100005D9C(*(_QWORD *)(v5 + 24), v7);
      sub_10014FD18(v4, v7);
      v9 = v8;
      sub_10014ACB0(v4, v7, v10, v11, v12, v13, v14, v15);
      v16 = *(_QWORD *)(v6 + 24);
      v17 = *(_QWORD *)(v6 + 32);
      *(_QWORD *)(v6 + 24) = v9;
      *(_QWORD *)(v6 + 32) = 0x2000000000000000;
      swift_bridgeObjectRetain();
      sub_10014ACB0(v16, v17, v18, v19, v20, v21, v22, v23);
      v4 = v9;
    }
    swift_release();
  }
  return v4;
}

void SHA256.update(tlv:)(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 24);
  v1 = *(_QWORD *)(a1 + 32);
  if ((v1 & 0x2000000000000000) == 0)
    __asm { BR              X10 }
  if ((unint64_t)v2 >> 62)
  {
    if (v2 >= 0)
      v12 = v2 & 0xFFFFFFFFFFFFFF8;
    else
      v12 = *(_QWORD *)(a1 + 24);
    swift_bridgeObjectRetain();
    v3 = _CocoaArrayWrapper.endIndex.getter(v12);
    if (!v3)
      goto LABEL_11;
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v3)
      goto LABEL_11;
  }
  if (v3 < 1)
  {
    __break(1u);
    JUMPOUT(0x10014EBA0);
  }
  for (i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0)
    {
      v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v2);
    }
    else
    {
      v11 = *(_QWORD *)(v2 + 8 * i + 32);
      swift_retain();
    }
    ((void (*)(uint64_t))SHA256.update(tlv:))(v11);
    swift_release();
  }
LABEL_11:
  sub_10014ACB0(v2, v1, v4, v5, v6, v7, v8, v9);
}

void sub_10014EBB8(unint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  unint64_t v27;
  uint64_t v28;

  v3 = type metadata accessor for CocoaError.Code(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for CocoaError(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (unint64_t *)((char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a1)
  {
    v27 = bswap64(a1);
    v11 = sub_100151C68(__clz(a1) >> 3, (uint64_t)&v27, (uint64_t)&v28);
    sub_10014F7E8(v11, v12, v13, v14);
    return;
  }
  LOBYTE(v27) = 0;
  v15 = (unint64_t)objc_msgSend(v1, "write:maxLength:", &v27, 1, v8);
  if ((v15 & 0x8000000000000000) != 0)
  {
    v26 = objc_msgSend(v1, "streamError");
    if (!v26)
    {
      __break(1u);
      return;
    }
  }
  else
  {
    if (v15 == 1)
      return;
    static CocoaError.Code.fileWriteOutOfSpace.getter();
    v23 = sub_1000CEC5C((uint64_t)&_swiftEmptyArrayStorage, v16, v17, v18, v19, v20, v21, v22);
    v24 = sub_10012A158((unint64_t *)&qword_1001B2198, 255, (uint64_t (*)(uint64_t))&type metadata accessor for CocoaError, (uint64_t)&protocol conformance descriptor for CocoaError);
    v25 = _BridgedStoredNSError.init(_:userInfo:)(v10, v5, v23, v6, v24);
    CocoaError._nsError.getter(v25);
    v26 = (id)(*(uint64_t (**)(_QWORD *, uint64_t))(v7 + 8))(v10, v6);
  }
  swift_willThrow(v26);
}

uint64_t sub_10014ED90(unint64_t a1)
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
  _QWORD *v11;
  _OWORD *v12;
  __int128 v13;
  char *v14;
  _QWORD *v15;
  unint64_t v17;
  _OWORD v18[2];
  _QWORD v19[3];
  void *v20;
  void *v21;
  char v22;
  _BYTE v23[7];

  if (a1)
  {
    v17 = bswap64(a1);
    v2 = sub_100151C68(__clz(a1) >> 3, (uint64_t)&v17, (uint64_t)v18);
    v4 = v3;
    v6 = v5;
    v8 = v7;
    swift_beginAccess(v1 + 16, &v22, 33, 0);
    v9 = sub_100003A2C(&qword_1001B4888);
    v20 = (void *)v9;
    v21 = (void *)sub_100150020();
    v10 = (_QWORD *)swift_allocObject(&unk_1001A16B8, 48, 7);
    v19[0] = v10;
    v10[2] = v2;
    v10[3] = v4;
    v10[4] = v6;
    v10[5] = v8;
    v11 = sub_100005EF8(v19, v9);
    __chkstk_darwin(v11);
    v13 = v12[1];
    v18[0] = *v12;
    v18[1] = v13;
    Slice<>.withUnsafeBytes<A>(_:)(&type metadata for (), sub_1001500A4);
    sub_100005D3C(v19);
    v14 = &v22;
  }
  else
  {
    v22 = 0;
    swift_beginAccess(v1 + 16, v18, 33, 0);
    v20 = &type metadata for UnsafeRawBufferPointer;
    v21 = &protocol witness table for UnsafeRawBufferPointer;
    v19[0] = &v22;
    v19[1] = v23;
    v15 = sub_100005EF8(v19, (uint64_t)&type metadata for UnsafeRawBufferPointer);
    Data._Representation.append(contentsOf:)(*v15, v15[1]);
    sub_100005D3C(v19);
    v14 = (char *)v18;
  }
  return swift_endAccess(v14);
}

void sub_10014EF64(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (a1 > 127)
  {
    v3 = __clz(a1) >> 3;
    sub_10014F248(-120 - v3);
    if (!v1)
    {
      v8 = bswap64(a1);
      v4 = sub_100151C68(v3, (uint64_t)&v8, (uint64_t)&v9);
      sub_10014F7E8(v4, v5, v6, v7);
    }
  }
  else
  {
    if (a1 < 0)
      __break(1u);
    sub_10014F248(a1);
  }
}

uint64_t sub_10014F020(int64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  char *v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  _OWORD *v17;
  __int128 v18;
  unint64_t v20;
  _OWORD v21[2];
  char *v22;
  char *v23;
  void *v24;
  void *v25;
  char v26;
  _BYTE v27[7];

  if (a1 > 127)
  {
    v5 = __clz(a1) >> 3;
    LOBYTE(v21[0]) = -120 - v5;
    swift_beginAccess(v1 + 16, &v26, 33, 0);
    v24 = &type metadata for UnsafeRawBufferPointer;
    v25 = &protocol witness table for UnsafeRawBufferPointer;
    v22 = (char *)v21;
    v23 = (char *)v21 + 1;
    v6 = sub_100005EF8(&v22, (uint64_t)&type metadata for UnsafeRawBufferPointer);
    Data._Representation.append(contentsOf:)(*v6, v6[1]);
    sub_100005D3C(&v22);
    v20 = bswap64(a1);
    v7 = sub_100151C68(v5, (uint64_t)&v20, (uint64_t)v21);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = sub_100003A2C(&qword_1001B4888);
    v24 = (void *)v14;
    v25 = (void *)sub_100150020();
    v15 = (char *)swift_allocObject(&unk_1001A16B8, 48, 7);
    v22 = v15;
    *((_QWORD *)v15 + 2) = v7;
    *((_QWORD *)v15 + 3) = v9;
    *((_QWORD *)v15 + 4) = v11;
    *((_QWORD *)v15 + 5) = v13;
    v16 = sub_100005EF8(&v22, v14);
    __chkstk_darwin(v16);
    v18 = v17[1];
    v21[0] = *v17;
    v21[1] = v18;
    Slice<>.withUnsafeBytes<A>(_:)(&type metadata for (), sub_100147C84);
    sub_100005D3C(&v22);
    v4 = &v26;
  }
  else
  {
    if (a1 < 0)
      __break(1u);
    v26 = a1;
    swift_beginAccess(v1 + 16, v21, 33, 0);
    v24 = &type metadata for UnsafeRawBufferPointer;
    v25 = &protocol witness table for UnsafeRawBufferPointer;
    v22 = &v26;
    v23 = v27;
    v3 = sub_100005EF8(&v22, (uint64_t)&type metadata for UnsafeRawBufferPointer);
    Data._Representation.append(contentsOf:)(*v3, v3[1]);
    sub_100005D3C(&v22);
    v4 = (char *)v21;
  }
  return swift_endAccess(v4);
}

uint64_t sub_10014F248(char a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t result;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _BYTE v23[7];
  char v24;

  v2 = v1;
  v4 = type metadata accessor for CocoaError.Code(0);
  __chkstk_darwin(v4);
  v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for CocoaError(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = &v23[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = a1;
  result = (uint64_t)objc_msgSend(v2, "write:maxLength:", &v24, 1, v9);
  if (result < 0)
  {
    result = (uint64_t)objc_msgSend(v2, "streamError");
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    if (result == 1)
      return result;
    static CocoaError.Code.fileWriteOutOfSpace.getter();
    v20 = sub_1000CEC5C((uint64_t)&_swiftEmptyArrayStorage, v13, v14, v15, v16, v17, v18, v19);
    v21 = sub_10012A158((unint64_t *)&qword_1001B2198, 255, (uint64_t (*)(uint64_t))&type metadata accessor for CocoaError, (uint64_t)&protocol conformance descriptor for CocoaError);
    v22 = _BridgedStoredNSError.init(_:userInfo:)(v11, v6, v20, v7, v21);
    CocoaError._nsError.getter(v22);
    result = (*(uint64_t (**)(_QWORD *, uint64_t))(v8 + 8))(v11, v7);
  }
  return swift_willThrow(result);
}

void sub_10014F3F0(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  _QWORD v8[5];

  v3 = type metadata accessor for CocoaError.Code(0);
  __chkstk_darwin(v3);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for CocoaError(0);
  __chkstk_darwin(v6);
  v7 = (char *)&loc_10014F4A4 + *((int *)qword_10014F7D8 + (a2 >> 62));
  v8[2] = v5;
  __asm { BR              X10 }
}

uint64_t sub_10014F4B8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t result;
  uint64_t v30;
  const char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  id v42;

  *(_QWORD *)(v26 - 104) = v23;
  *(_WORD *)(v26 - 96) = v24;
  *(_BYTE *)(v26 - 94) = BYTE2(v24);
  *(_BYTE *)(v26 - 93) = BYTE3(v24);
  *(_BYTE *)(v26 - 92) = BYTE4(v24);
  *(_BYTE *)(v26 - 91) = BYTE5(v24);
  v27 = (unint64_t)objc_msgSend(v20, "write:maxLength:", v26 - 104, BYTE6(v24));
  if ((v27 & 0x8000000000000000) != 0)
  {
    v42 = objc_msgSend(v20, "streamError");
    if (!v42)
    {
      __break(1u);
      JUMPOUT(0x10014F7B0);
    }
    swift_willThrow(v42);
    return sub_100005DE0(v23, v24);
  }
  else
  {
    v28 = v27;
    result = sub_100005DE0(v23, v24);
    if (v28 != BYTE6(v24))
    {
      v30 = *(_QWORD *)(v26 - 112);
      ((void (*)(uint64_t))static CocoaError.Code.fileWriteOutOfSpace.getter)(result);
      v38 = sub_1000CEC5C((uint64_t)&_swiftEmptyArrayStorage, v31, v32, v33, v34, v35, v36, v37);
      v39 = sub_10012A158((unint64_t *)&qword_1001B2198, 255, (uint64_t (*)(uint64_t))&type metadata accessor for CocoaError, (uint64_t)&protocol conformance descriptor for CocoaError);
      v40 = _BridgedStoredNSError.init(_:userInfo:)(v22, v30, v38, v21, v39);
      CocoaError._nsError.getter(v40);
      v41 = (*(uint64_t (**)(_QWORD *, uint64_t))(v25 + 8))(v22, v21);
      return swift_willThrow(v41);
    }
  }
  return result;
}

void sub_10014F7E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _TtC14softposreaderd12RemoteReader *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _TtC14softposreaderd12RemoteReader *v26;
  __int128 v27;
  __int128 v28;
  BOOL v29;
  char *v30;
  const char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  id v44;
  SEL v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  _QWORD *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _TtC14softposreaderd12RemoteReader *v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  v5 = v4;
  v10 = type metadata accessor for CocoaError.Code(0);
  __chkstk_darwin(v10);
  v54 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for CocoaError(0);
  v55 = *(_QWORD *)(v12 - 8);
  v56 = v12;
  __chkstk_darwin(v12);
  v53 = (uint64_t *)((char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v57 = a1;
  v58 = a2;
  *(_QWORD *)&v62 = a1;
  *((_QWORD *)&v62 + 1) = a2;
  v59 = a3;
  v60 = a4;
  *(_QWORD *)&v63 = a3;
  *((_QWORD *)&v63 + 1) = a4;
  v14 = sub_100003A2C(&qword_1001B4888);
  v15 = sub_1000CEC18();
  v16 = (_TtC14softposreaderd12RemoteReader *)Slice<>.regions.getter(v14, v15);
  v24 = *(_QWORD *)&v16->instance[8];
  v61 = v16;
  v25 = 0;
  if (v24)
  {
    v26 = v16 + 1;
    while (1)
    {
      *(double *)&v27 = __chkstk_darwin(v16);
      *(&v52 - 2) = (uint64_t)v5;
      v62 = v27;
      v63 = v28;
      v16 = (_TtC14softposreaderd12RemoteReader *)Slice<>.withUnsafeBytes<A>(_:)(&v64, sub_10015008C);
      if (v64 < 0)
        break;
      v29 = __OFADD__(v25, v64);
      v25 += v64;
      if (v29)
      {
        __break(1u);
        goto LABEL_12;
      }
      v26 = (_TtC14softposreaderd12RemoteReader *)((char *)v26 + 32);
      if (!--v24)
        goto LABEL_6;
    }
    v44 = objc_msgSend(v5, "streamError");
    if (v44)
    {
      swift_willThrow(v44);
      swift_bridgeObjectRelease(v61, v45, v46, v47, v48, v49, v50, v51);
      return;
    }
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease(v61, v17, v18, v19, v20, v21, v22, v23);
    if (v25 != sub_100152790(v57, v58, v59, v60))
    {
      v30 = v54;
      static CocoaError.Code.fileWriteOutOfSpace.getter();
      v38 = sub_1000CEC5C((uint64_t)&_swiftEmptyArrayStorage, v31, v32, v33, v34, v35, v36, v37);
      v39 = sub_10012A158((unint64_t *)&qword_1001B2198, 255, (uint64_t (*)(uint64_t))&type metadata accessor for CocoaError, (uint64_t)&protocol conformance descriptor for CocoaError);
      v40 = v53;
      v41 = v56;
      v42 = _BridgedStoredNSError.init(_:userInfo:)(v53, v30, v38, v56, v39);
      CocoaError._nsError.getter(v42);
      v43 = (*(uint64_t (**)(_QWORD *, uint64_t))(v55 + 8))(v40, v41);
      swift_willThrow(v43);
    }
  }
}

void sub_10014FA60(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_10014FABC()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_10013A124((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_100005DE0(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

char *sub_10014FC84(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  char *result;
  char *v8;
  BOOL v9;
  uint64_t v10;
  id v11;

  result = (char *)__DataStorage._bytes.getter();
  v8 = result;
  if (result)
  {
    result = (char *)__DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
    v8 += a1 - (_QWORD)result;
  }
  v9 = __OFSUB__(a2, a1);
  v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  result = (char *)__DataStorage._length.getter();
  if (!v8)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if ((uint64_t)result >= v10)
    v11 = (id)v10;
  else
    v11 = result;
  return (char *)objc_msgSend(a4, "write:maxLength:", v8, v11);
}

void sub_10014FD18(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  id v5;
  Class isa;
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  id v12;
  char v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  unint64_t v25;
  _BYTE *v26;
  _TtC14softposreaderd12RemoteReader *v27;
  SEL v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  unsigned __int8 v35;
  _TtC14softposreaderd12RemoteReader *v36;

  v36 = &_swiftEmptyArrayStorage;
  v5 = objc_allocWithZone((Class)NSInputStream);
  sub_100005D9C(a1, a2);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v7 = objc_msgSend(v5, "initWithData:", isa);
  sub_100005DE0(a1, a2);

  objc_msgSend(v7, "open");
  while (1)
  {
    v35 = 0;
    v8 = objc_msgSend(v7, "read:maxLength:", &v35, 1);
    if (v8 != (id)1)
    {
      if (v8 == (id)-1)
      {
        v24 = objc_msgSend(v7, "streamError");
        if (v24)
          goto LABEL_18;
        __break(1u);
      }
      objc_msgSend(v7, "close");

      return;
    }
    v9 = v35;
    if ((~v35 & 0x1F) == 0)
      break;
    v11 = v35;
LABEL_8:
    v12 = sub_10014A788();
    if (v2)
      goto LABEL_19;
    if ((v13 & 1) != 0)
      goto LABEL_17;
    v14 = NSInputStream.read(exactly:)((uint64_t)v12);
    v16 = v15;
    if (v15 >> 60 == 15)
      goto LABEL_17;
    v17 = v14;
    v18 = type metadata accessor for TLV();
    v19 = (_QWORD *)swift_allocObject(v18, 40, 7);
    v19[2] = v11;
    v19[3] = v17;
    v19[4] = v16;
    v20 = swift_retain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v20);
    v22 = *(_QWORD *)(((unint64_t)v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v21 = *(_QWORD *)(((unint64_t)v36 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v22 >= v21 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1);
    v23 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v22, v19);
    specialized Array._endMutation()(v23);
    swift_release(v19);
  }
  while (1)
  {
    v35 = 0;
    v10 = objc_msgSend(v7, "read:maxLength:", &v35, 1);
    if (v10 != (id)1)
      break;
    v11 = v35 | (v9 << 8);
    v9 = v11;
    if (((char)v35 & 0x80000000) == 0)
      goto LABEL_8;
  }
  if (v10 != (id)-1)
  {
LABEL_17:
    v25 = sub_10014A744();
    v24 = (id)swift_allocError(&type metadata for TLVError, v25, 0, 0);
    *v26 = 0;
LABEL_18:
    swift_willThrow(v24);
LABEL_19:
    v27 = v36;

    swift_bridgeObjectRelease(v27, v28, v29, v30, v31, v32, v33, v34);
    return;
  }
  v24 = objc_msgSend(v7, "streamError");
  if (v24)
    goto LABEL_18;
  __break(1u);
}

BOOL sub_10014FFDC(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(*(_QWORD *)a1 + 16) == *(_QWORD *)(v1 + 16);
}

uint64_t sub_10014FFF4(uint64_t a1, uint64_t a2)
{
  return sub_10012A158(&qword_1001B4708, a2, (uint64_t (*)(uint64_t))type metadata accessor for TLV, (uint64_t)&protocol conformance descriptor for TLV);
}

unint64_t sub_100150020()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1001B4890;
  if (!qword_1001B4890)
  {
    v1 = sub_100003A6C(&qword_1001B4888);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> Slice<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1001B4890);
  }
  return result;
}

uint64_t sub_10015007C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 48, 7);
}

id sub_10015008C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_10015433C(*(id *)(v3 + 16), a1, a2, a3);
}

uint64_t sub_1001500A4(uint64_t a1, uint64_t a2)
{
  return sub_100147C84(a1, a2);
}

BOOL sub_1001500B8(uint64_t a1)
{
  return sub_10014FFDC(a1);
}

void sub_1001500D0(uint64_t a1, uint64_t a2)
{
  sub_1001491E8(a1, a2);
}

_QWORD *DERReader.readDERTag()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *(*v5)(uint64_t *__return_ptr, void *, void *, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v6;
  unint64_t v7;
  _QWORD *result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;

  v5 = *(_QWORD *(**)(uint64_t *__return_ptr, void *, void *, unint64_t, unint64_t, uint64_t, uint64_t))(a2 + 8);
  v6 = sub_100150228();
  v7 = sub_1000257E0();
  result = v5((uint64_t *)((char *)&v13 + 2), &type metadata for UInt8, &type metadata for UInt8, v6, v7, a1, a2);
  if (!v2)
  {
    if ((v13 & 0x1000000) != 0)
    {
      return 0;
    }
    else
    {
      v9 = BYTE2(v13);
      if ((~BYTE2(v13) & 0x1F) != 0)
      {
        return (_QWORD *)BYTE2(v13);
      }
      else
      {
        while (1)
        {
          v5(&v13, &type metadata for UInt8, &type metadata for UInt8, v6, v7, a1, a2);
          if ((v13 & 0x100) != 0)
            break;
          result = (_QWORD *)(v13 | (v9 << 8));
          v9 = (unint64_t)result;
          if (((char)v13 & 0x80000000) == 0)
            return result;
        }
        v10 = sub_10014A744();
        v11 = swift_allocError(&type metadata for TLVError, v10, 0, 0);
        *v12 = 0;
        return (_QWORD *)swift_willThrow(v11);
      }
    }
  }
  return result;
}

unint64_t sub_100150228()
{
  unint64_t result;

  result = qword_1001B4898;
  if (!qword_1001B4898)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UInt8, &type metadata for UInt8);
    atomic_store(result, (unint64_t *)&qword_1001B4898);
  }
  return result;
}

Swift::Int_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DERReader.readDERLength()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *(*v6)(uint64_t *__return_ptr, void *, void *, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  Swift::Bool v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  unsigned int v15;
  unint64_t v16;
  _BYTE *v17;
  _QWORD *(*v18)(uint64_t *__return_ptr, void *, void *, unint64_t, unint64_t, uint64_t, uint64_t);
  char v19;
  uint64_t v20;
  Swift::Int_optional result;

  v4 = v1;
  v5 = v0;
  v6 = *(_QWORD *(**)(uint64_t *__return_ptr, void *, void *, unint64_t, unint64_t, uint64_t, uint64_t))(v1 + 8);
  v7 = sub_100150228();
  v8 = sub_1000257E0();
  v9 = v6((uint64_t *)((char *)&v20 + 2), &type metadata for UInt8, &type metadata for UInt8, v7, v8, v5, v4);
  if (v2)
    goto LABEL_7;
  v19 = BYTE3(v20);
  if ((v20 & 0x1000000) != 0)
  {
    v3 = 0;
LABEL_6:
    v10 = v19;
LABEL_7:
    v9 = (_QWORD *)v3;
    goto LABEL_18;
  }
  v11 = BYTE2(v20);
  if ((v20 & 0x800000) == 0)
  {
    v3 = BYTE2(v20);
    goto LABEL_6;
  }
  if (BYTE2(v20) == 128)
  {
    v12 = sub_10014A744();
    v13 = swift_allocError(&type metadata for TLVError, v12, 0, 0);
    *v14 = 2;
LABEL_16:
    swift_willThrow(v13);
    goto LABEL_7;
  }
  v18 = v6;
  v3 = 0;
  v15 = 128;
  while (v15 < v11)
  {
    v9 = v18(&v20, &type metadata for UInt8, &type metadata for UInt8, v7, v8, v5, v4);
    if ((v20 & 0x100) != 0)
    {
      v16 = sub_10014A744();
      v13 = swift_allocError(&type metadata for TLVError, v16, 0, 0);
      *v17 = 0;
      goto LABEL_16;
    }
    ++v15;
    v3 = v20 | (v3 << 8);
    if (v15 == v11)
      goto LABEL_6;
  }
  __break(1u);
LABEL_18:
  result.value = (Swift::Int)v9;
  result.is_nil = v10;
  return result;
}

id NSInputStream.read(exactly:)(uint64_t a1)
{
  void *v1;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id result;
  __int128 v10;
  __int128 v11;

  if (a1 < 1)
    return 0;
  *(_QWORD *)&v11 = 0;
  *(_QWORD *)&v10 = 0;
  v3 = objc_msgSend(v1, "getBuffer:length:", &v11, &v10);
  v4 = v10;
  if (!v3)
    v4 = 1000000;
  if (v4 < a1)
    return 0;
  *(_QWORD *)&v10 = sub_10010DCC0(a1);
  *((_QWORD *)&v10 + 1) = v5;
  sub_100150CCC((uint64_t)&v10);
  v11 = v10;
  v6 = v1;
  sub_100150F34((uint64_t)&v11);
  v8 = v7;

  if (v8 == -1)
  {
    result = objc_msgSend(v6, "streamError");
    if (result)
    {
      swift_willThrow(result);
      return (id)sub_100005DE0(v11, *((unint64_t *)&v11 + 1));
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    result = (id)v11;
    if (v8 != a1)
    {
      sub_100005DE0(v11, *((unint64_t *)&v11 + 1));
      return 0;
    }
  }
  return result;
}

id NSInputStream.read<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  void *v3;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedConformanceWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[16];
  void *v21;

  v18 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v5, a1, &protocol requirements base descriptor for ExpressibleByIntegerLiteral);
  __chkstk_darwin(AssociatedTypeWitness);
  v8 = (char *)&v17 - v7;
  v9 = *(_QWORD *)(a1 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  __chkstk_darwin(v11);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v5, a1, AssociatedTypeWitness, &protocol requirements base descriptor for ExpressibleByIntegerLiteral, &associated conformance descriptor for ExpressibleByIntegerLiteral.ExpressibleByIntegerLiteral.IntegerLiteralType: _ExpressibleByBuiltinIntegerLiteral);
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(&unk_1001640F0, 256, AssociatedTypeWitness, AssociatedConformanceWitness);
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v8, a1, v5);
  v21 = v3;
  sub_1001508E0((uint64_t)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)sub_1001512B4, (uint64_t)v20, a1, (uint64_t)&type metadata for Never, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Never, v13);
  if (v19 == -1)
  {
    result = objc_msgSend(v3, "streamError");
    if (result)
    {
      swift_willThrow(result);
      return (id)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))((char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (v10 == v19)
    {
      v14 = v18;
      (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v18, (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
      v15 = 0;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))((char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
      v15 = 1;
      v14 = v18;
    }
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v14, v15, 1, a1);
  }
  return result;
}

Swift::Int DERReader.readDERTLV()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int_optional v5;
  Swift::Int value;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;

  v5.value = (Swift::Int)DERReader.readDERTag()(a1, a2);
  if (!v2)
  {
    if (v5.is_nil)
    {
      v5.value = 0;
    }
    else
    {
      value = v5.value;
      v5 = DERReader.readDERLength()();
      if (!v7)
      {
        if (v5.is_nil
          || (v8 = (*(uint64_t (**)(Swift::Int, uint64_t, uint64_t))(a2 + 16))(v5.value, a1, a2),
              v10 = v9,
              v9 >> 60 == 15))
        {
          v11 = sub_10014A744();
          v12 = swift_allocError(&type metadata for TLVError, v11, 0, 0);
          *v13 = 0;
          v5.value = swift_willThrow(v12);
        }
        else
        {
          v14 = v8;
          v15 = type metadata accessor for TLV();
          v5.value = swift_allocObject(v15, 40, 7);
          *(_QWORD *)(v5.value + 16) = value;
          *(_QWORD *)(v5.value + 24) = v14;
          *(_QWORD *)(v5.value + 32) = v10;
        }
      }
    }
  }
  return v5.value;
}

uint64_t NSInputStream.availableByteCount.getter()
{
  void *v0;
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  v3 = 0;
  if (objc_msgSend(v0, "getBuffer:length:", &v3, &v2))
    return v2;
  else
    return 1000000;
}

uint64_t sub_1001508E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, char *);
  uint64_t result;
  uint64_t v18;

  v11 = *(_QWORD *)(a5 - 8);
  v12 = __chkstk_darwin(a1);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v16(v12, v12 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64), v14);
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  return result;
}

id sub_100150978@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return NSInputStream.read<A>(_:)(a1, a2, a3);
}

id sub_100150998(uint64_t a1)
{
  return NSInputStream.read(exactly:)(a1);
}

uint64_t NSFileHandle.read<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;

  v5 = *(_QWORD *)(a1 - 8);
  result = NSFileHandle.read(upToCount:)(*(_QWORD *)(v5 + 64));
  if (!v2)
  {
    if (v7 >> 60 != 15)
      __asm { BR              X10 }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, a1);
  }
  return result;
}

uint64_t sub_100150B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v6 = *(_QWORD *)(a3 - 8);
  __chkstk_darwin(a1);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  UnsafeRawBufferPointer.load<A>(fromByteOffset:as:)(0, a3);
  dispatch thunk of FixedWidthInteger.bigEndian.getter(a3, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a3);
}

uint64_t NSFileHandle.read(exactly:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  unint64_t v3;

  result = NSFileHandle.read(upToCount:)(a1);
  if (!v1)
  {
    if (v3 >> 60 != 15)
      __asm { BR              X10 }
    return 0;
  }
  return result;
}

uint64_t sub_100150C8C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return NSFileHandle.read<A>(_:)(a1, a2);
}

uint64_t sub_100150CAC(uint64_t a1)
{
  return NSFileHandle.read(exactly:)(a1);
}

void sub_100150CCC(uint64_t a1)
{
  __asm { BR              X13 }
}

void *sub_100150D28(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  void *result;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;

  v30 = v25;
  LOWORD(v31) = v24;
  BYTE2(v31) = BYTE2(v24);
  HIBYTE(v31) = BYTE3(v24);
  v32 = BYTE4(v24);
  v33 = BYTE5(v24);
  v34 = BYTE6(v24);
  result = memset(&v30, v27, BYTE6(v24));
  v29 = v31 | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v34 << 48);
  *v26 = v30;
  v26[1] = v29;
  return result;
}

void sub_100150EB4(int *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  size_t v12;

  Data.InlineSlice.ensureUniqueReference()();
  v4 = *a1;
  v5 = a1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  v6 = __DataStorage._bytes.getter();
  if (!v6)
  {
LABEL_10:
    __break(1u);
    return;
  }
  v7 = v6;
  v8 = __DataStorage._offset.getter();
  v9 = v4 - v8;
  if (__OFSUB__(v4, v8))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v10 = v5 - v4;
  v11 = __DataStorage._length.getter();
  if (v11 >= v10)
    v12 = v10;
  else
    v12 = v11;
  memset((void *)(v7 + v9), a2, v12);
}

void sub_100150F34(uint64_t a1)
{
  __asm { BR              X11 }
}

id sub_100150F8C@<X0>(id a1@<X1>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  _QWORD *v18;
  uint64_t v19;
  id result;
  unint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;

  v22 = v19;
  LOWORD(v23) = a2;
  BYTE2(v23) = BYTE2(a2);
  HIBYTE(v23) = BYTE3(a2);
  v24 = BYTE4(a2);
  v25 = BYTE5(a2);
  v26 = BYTE6(a2);
  result = objc_msgSend(a1, "read:maxLength:", &v22, BYTE6(a2));
  v21 = v23 | ((unint64_t)v24 << 32) | ((unint64_t)v25 << 40) | ((unint64_t)v26 << 48);
  *v18 = v22;
  v18[1] = v21;
  return result;
}

id sub_1001512B4@<X0>(id result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  if (result)
  {
    result = objc_msgSend(*(id *)(v3 + 16), "read:maxLength:", result, a2 - (_QWORD)result);
    *a3 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1001512FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100150B2C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

BOOL static TLVError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void TLVError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int TLVError.hashValue.getter(unsigned __int8 a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t sub_100151394()
{
  unint64_t result;

  result = qword_1001B48A0;
  if (!qword_1001B48A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TLVError, &type metadata for TLVError);
    atomic_store(result, (unint64_t *)&qword_1001B48A0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TLVError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100151424 + 4 * byte_100164209[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100151458 + 4 * byte_100164204[v4]))();
}

uint64_t sub_100151458(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100151460(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100151468);
  return result;
}

uint64_t sub_100151474(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10015147CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100151480(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100151488(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TLVError()
{
  return &type metadata for TLVError;
}

Swift::Void __swiftcall UnsignedInteger.setBit(_:)(Swift::Int a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_100151698(a1, v1, v2, (void (*)(_QWORD, char *, uint64_t, uint64_t))&dispatch thunk of static BinaryInteger.|= infix(_:_:));
}

Swift::Void __swiftcall UnsignedInteger.clearBit(_:)(Swift::Int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
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
  char *v18;
  uint64_t AssociatedConformanceWitness;
  unint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  Swift::Int v23;
  uint64_t v24;
  Swift::Int v25;

  v23 = a1;
  v3 = v1;
  v4 = *(_QWORD *)(v2 + 8);
  v5 = *(_QWORD *)(*(_QWORD *)(v4 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v5, v1, &protocol requirements base descriptor for ExpressibleByIntegerLiteral);
  v7 = __chkstk_darwin(AssociatedTypeWitness);
  v9 = (char *)&v22 - v8;
  v10 = *(_QWORD *)(v3 - 8);
  v11 = __chkstk_darwin(v7);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v22 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v22 - v17;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v5, v3, AssociatedTypeWitness, &protocol requirements base descriptor for ExpressibleByIntegerLiteral, &associated conformance descriptor for ExpressibleByIntegerLiteral.ExpressibleByIntegerLiteral.IntegerLiteralType: _ExpressibleByBuiltinIntegerLiteral);
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(&unk_1001642C8, 512, AssociatedTypeWitness, AssociatedConformanceWitness);
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v9, v3, v5);
  v25 = v23;
  v20 = sub_10013F680();
  dispatch thunk of static BinaryInteger.<< infix<A>(_:_:)(v13, &v25, &type metadata for Int, v20, v3, v4);
  v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v13, v3);
  dispatch thunk of static BinaryInteger.~ prefix(_:)(v16, v3, v4);
  v21(v16, v3);
  dispatch thunk of static BinaryInteger.&= infix(_:_:)(v24, v18, v3, v4);
  v21(v18, v3);
}

Swift::Void __swiftcall UnsignedInteger.toggleBit(_:)(Swift::Int a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_100151698(a1, v1, v2, (void (*)(_QWORD, char *, uint64_t, uint64_t))&dispatch thunk of static BinaryInteger.^= infix(_:_:));
}

uint64_t sub_100151698(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, char *, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t AssociatedConformanceWitness;
  unint64_t v19;
  void (*v20)(char *, uint64_t);
  _QWORD v22[2];
  void (*v23)(_QWORD, char *, uint64_t, uint64_t);
  uint64_t v24;

  v23 = a4;
  v6 = *(_QWORD *)(a3 + 8);
  v7 = *(_QWORD *)(*(_QWORD *)(v6 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v7, a2, &protocol requirements base descriptor for ExpressibleByIntegerLiteral);
  v9 = __chkstk_darwin(AssociatedTypeWitness);
  v11 = (char *)v22 - v10;
  v12 = *(_QWORD *)(a2 - 8);
  v13 = __chkstk_darwin(v9);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)v22 - v16;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v7, a2, AssociatedTypeWitness, &protocol requirements base descriptor for ExpressibleByIntegerLiteral, &associated conformance descriptor for ExpressibleByIntegerLiteral.ExpressibleByIntegerLiteral.IntegerLiteralType: _ExpressibleByBuiltinIntegerLiteral);
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(&unk_1001642C8, 512, AssociatedTypeWitness, AssociatedConformanceWitness);
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v11, a2, v7);
  v24 = a1;
  v19 = sub_10013F680();
  dispatch thunk of static BinaryInteger.<< infix<A>(_:_:)(v15, &v24, &type metadata for Int, v19, a2, v6);
  v20 = *(void (**)(char *, uint64_t))(v12 + 8);
  v20(v15, a2);
  v23(v22[1], v17, a2, v6);
  return ((uint64_t (*)(char *, uint64_t))v20)(v17, a2);
}

Swift::Bool __swiftcall UnsignedInteger.readBit(_:)(Swift::Int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  char v23;
  uint64_t v24;
  char *v25;
  Swift::Int v26;
  char v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  char v30;
  Swift::Int v31;
  Swift::Int v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  Swift::Int v35;
  void (*v36)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  char *v40;
  unint64_t v41;
  uint64_t AssociatedConformanceWitness;
  Swift::Int v43;
  void (*v44)(char *, uint64_t);
  Swift::Int v45;

  v43 = a1;
  v3 = v1;
  v4 = *(_QWORD **)(v2 + 8);
  v5 = *(_QWORD *)(v4[3] + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v5, v1, &protocol requirements base descriptor for ExpressibleByIntegerLiteral);
  v7 = __chkstk_darwin(AssociatedTypeWitness);
  v9 = (char *)&v38 - v8;
  v10 = *(_QWORD *)(v3 - 8);
  v11 = __chkstk_darwin(v7);
  v40 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v38 - v14;
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v38 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v38 - v19;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v5, v3, AssociatedTypeWitness, &protocol requirements base descriptor for ExpressibleByIntegerLiteral, &associated conformance descriptor for ExpressibleByIntegerLiteral.ExpressibleByIntegerLiteral.IntegerLiteralType: _ExpressibleByBuiltinIntegerLiteral);
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(&unk_1001642C8, 512, AssociatedTypeWitness, AssociatedConformanceWitness);
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v9, v3, v5);
  v45 = v43;
  v41 = sub_10013F680();
  dispatch thunk of static BinaryInteger.<< infix<A>(_:_:)(v15, &v45, &type metadata for Int, v41, v3, v4);
  v39 = v10;
  v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v15, v3);
  dispatch thunk of static BinaryInteger.& infix(_:_:)(v44, v18, v3, v4);
  v43 = (Swift::Int)v18;
  v44 = v21;
  v21(v18, v3);
  if ((dispatch thunk of static BinaryInteger.isSigned.getter(v3, v4) & 1) == 0)
  {
    v22 = AssociatedConformanceWitness;
    v23 = dispatch thunk of static BinaryInteger.isSigned.getter(v3, v4);
    v24 = dispatch thunk of BinaryInteger.bitWidth.getter(v3, v4);
    v25 = v20;
    if ((v23 & 1) != 0)
    {
      if (v24 <= 64)
      {
        dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(&unk_1001640F0, 256, AssociatedTypeWitness, v22);
        v26 = v43;
        dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v9, v3, v5);
        v27 = dispatch thunk of static Comparable.>= infix(_:_:)(v20, v26, v3, *(_QWORD *)(v4[4] + 8));
        v28 = v44;
        v44((char *)v26, v3);
        v29 = v40;
        (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v40, v25, v3);
        v30 = (v27 & 1) != 0 && dispatch thunk of BinaryInteger._lowWord.getter(v3, v4) == 0;
        v28(v29, v3);
        v28(v25, v3);
        return (v30 & 1) == 0;
      }
    }
    else if (v24 < 64)
    {
LABEL_10:
      v34 = dispatch thunk of BinaryInteger._lowWord.getter(v3, v4);
      v44(v20, v3);
      v30 = v34 == 0;
      return (v30 & 1) == 0;
    }
    v45 = 0;
    v35 = v43;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)(&v45, &type metadata for Int, v41, v3, v4);
    v30 = dispatch thunk of static Equatable.== infix(_:_:)(v20, v35, v3, *(_QWORD *)(v4[2] + 8));
    v36 = v44;
    v44((char *)v35, v3);
    v36(v20, v3);
    return (v30 & 1) == 0;
  }
  if (dispatch thunk of BinaryInteger.bitWidth.getter(v3, v4) < 64)
    goto LABEL_10;
  v45 = 0;
  v31 = v43;
  dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)(&v45, &type metadata for Int, v41, v3, v4);
  v30 = dispatch thunk of static Equatable.== infix(_:_:)(v20, v31, v3, *(_QWORD *)(v4[2] + 8));
  v32 = v31;
  v33 = v44;
  v44((char *)v32, v3);
  v33(v20, v3);
  return (v30 & 1) == 0;
}

uint64_t sub_100151C68(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (result < 0)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  v5 = a3 - a2;
  if (a2)
    v6 = a3 - a2;
  else
    v6 = 0;
  result = sub_100152708(0, result, v6, a2, a3);
  if ((v7 & 1) != 0)
  {
    result = v5;
    if (!a2)
      return 0;
  }
  else if (!a2)
  {
    v5 = 0;
  }
  if (v5 < result)
    goto LABEL_13;
  return result;
}

void sub_100151CF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000) == 0)
    __asm { BR              X9 }
  __break(1u);
  JUMPOUT(0x100151E50);
}

void *SecCertificateRef.pemHeader.unsafeMutableAddressor()
{
  return &static SecCertificateRef.pemHeader;
}

unint64_t static SecCertificateRef.pemHeader.getter()
{
  return 0xD00000000000001BLL;
}

void *SecCertificateRef.pemFooter.unsafeMutableAddressor()
{
  return &static SecCertificateRef.pemFooter;
}

unint64_t static SecCertificateRef.pemFooter.getter()
{
  return 0xD000000000000019;
}

uint64_t SecCertificateRef.derRepresentation.getter()
{
  __SecCertificate *v0;
  CFDataRef v1;
  uint64_t v2;

  v1 = SecCertificateCopyData(v0);
  v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v2;
}

unint64_t SecCertificateRef.pemRepresentation.getter()
{
  __SecCertificate *v0;
  CFDataRef v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  Swift::String v5;
  _TtC14softposreaderd12RemoteReader *object;
  SEL v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  Swift::String v14;
  Swift::String v15;

  v1 = SecCertificateCopyData(v0);
  v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v4 = v3;

  v5 = Data.base64EncodedString(options:)(0x21uLL);
  object = (_TtC14softposreaderd12RemoteReader *)v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(object, v7, v8, v9, v10, v11, v12, v13);
  v14._countAndFlagsBits = 10;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  v15._object = (void *)0x80000001001731C0;
  v15._countAndFlagsBits = 0xD000000000000019;
  String.append(_:)(v15);
  sub_100005DE0(v2, v4);
  return 0xD00000000000001CLL;
}

uint64_t SecCertificateRef.fingerprint.getter()
{
  __SecCertificate *v0;
  CFDataRef v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = SecCertificateCopyData(v0);
  v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v4 = v3;

  Data.sha256Digest.getter(v2, v4);
  v6 = v5;
  sub_100005DE0(v2, v4);
  return v6;
}

SecKeyRef SecCertificateRef.publicKey.getter()
{
  __SecCertificate *v0;

  return SecCertificateCopyKey(v0);
}

SecCertificateRef static SecCertificateRef.parse(derRepresentation:)()
{
  const __CFData *isa;
  SecCertificateRef v1;

  isa = Data._bridgeToObjectiveC()().super.isa;
  v1 = SecCertificateCreateWithData(kCFAllocatorDefault, isa);

  return v1;
}

SecCertificateRef static SecCertificateRef.parse(base64Encoded:)(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  SecCertificateRef v3;
  uint64_t v4;
  unint64_t v5;
  const __CFData *isa;

  v1 = Data.init(base64Encoded:options:)(a1);
  if (v2 >> 60 == 15)
    return 0;
  v4 = v1;
  v5 = v2;
  isa = Data._bridgeToObjectiveC()().super.isa;
  v3 = SecCertificateCreateWithData(kCFAllocatorDefault, isa);

  sub_10000A9B0(v4, v5);
  return v3;
}

uint64_t static SecCertificateRef.parse(pemRepresentation:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  _TtC14softposreaderd12RemoteReader *v11;
  _TtC14softposreaderd12RemoteReader *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  const char *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  _TtC14softposreaderd12RemoteReader *v29;
  _TtC14softposreaderd12RemoteReader *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char v35;
  SEL v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  unint64_t v43;
  unint64_t v44;
  const char *v45;
  unint64_t v46;
  void *v47;
  uint64_t v48;
  _TtC14softposreaderd12RemoteReader *v49;
  _TtC14softposreaderd12RemoteReader *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  SEL v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  unint64_t v62;
  unint64_t v63;
  const char *v64;
  const char *v65;
  void *v66;
  void *v67;
  _TtC14softposreaderd12RemoteReader *v68;
  _TtC14softposreaderd12RemoteReader *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  char v74;
  unint64_t v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  void *v79;
  void *v80;
  _TtC14softposreaderd12RemoteReader *v81;
  _TtC14softposreaderd12RemoteReader *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  uint64_t v87;
  const char *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  uint64_t v95;
  SecCertificateRef v96;
  uint64_t v97;
  unint64_t v98;
  const __CFData *isa;
  _QWORD v100[2];

  v4 = type metadata accessor for CharacterSet(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100[0] = a1;
  v100[1] = a2;
  static CharacterSet.whitespacesAndNewlines.getter(v6);
  v9 = sub_1000095D0();
  v10 = StringProtocol.trimmingCharacters(in:)(v8, &type metadata for String, v9);
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v13 = String.count.getter(v10, v12);
  v14 = String.count.getter(0xD00000000000001BLL, 0x80000001001731A0);
  result = String.count.getter(0xD000000000000019, 0x80000001001731C0);
  if (__OFADD__(v14, result))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v13 < v14 + result)
    goto LABEL_11;
  swift_bridgeObjectRetain();
  v23 = String.count.getter(0xD00000000000001BLL, 0x80000001001731A0);
  v24 = sub_100152860(v23, v10, (unint64_t)v12);
  v26 = (unint64_t)v25;
  v28 = (uint64_t)v27;
  v30 = v29;
  swift_bridgeObjectRelease(v12, v25, v27, v29, v31, v32, v33, v34);
  v35 = sub_1001528E8(v24, v26, v28, (uint64_t)v30, 0xD00000000000001BLL, 0x80000001001731A0);
  swift_bridgeObjectRelease(v30, v36, v37, v38, v39, v40, v41, v42);
  if ((v35 & 1) == 0)
    goto LABEL_11;
  swift_bridgeObjectRetain();
  v43 = String.count.getter(0xD000000000000019, 0x80000001001731C0);
  v44 = sub_1000C5198(v43, v10, (unint64_t)v12);
  v46 = (unint64_t)v45;
  v48 = (uint64_t)v47;
  v50 = v49;
  swift_bridgeObjectRelease(v12, v45, v47, v49, v51, v52, v53, v54);
  LOBYTE(v44) = sub_1001528E8(v44, v46, v48, (uint64_t)v50, 0xD000000000000019, 0x80000001001731C0);
  swift_bridgeObjectRelease(v50, v55, v56, v57, v58, v59, v60, v61);
  if ((v44 & 1) == 0)
    goto LABEL_11;
  v62 = String.count.getter(0xD00000000000001BLL, 0x80000001001731A0);
  v63 = sub_1001527C4(v62, v10, (unint64_t)v12);
  v65 = v64;
  v67 = v66;
  v69 = v68;
  swift_bridgeObjectRelease(v12, v64, v66, v68, v70, v71, v72, v73);
  result = String.count.getter(0xD000000000000019, 0x80000001001731C0);
  if (result < 0)
    goto LABEL_15;
  result = Substring.index(_:offsetBy:limitedBy:)(v65, -result, v63, v63, v65, v67, v69);
  if ((v74 & 1) != 0)
    v75 = v63;
  else
    v75 = result;
  if (v75 >> 14 >= v63 >> 14)
  {
    v76 = Substring.subscript.getter(v63, v75, v63, v65, v67, v69);
    v78 = v77;
    v80 = v79;
    v82 = v81;
    swift_bridgeObjectRelease(v69, v77, v79, v81, v83, v84, v85, v86);
    v87 = static String._fromSubstring(_:)(v76, v78, v80, v82);
    v12 = (_TtC14softposreaderd12RemoteReader *)v88;
    swift_bridgeObjectRelease(v82, v88, v89, v90, v91, v92, v93, v94);
    v95 = Data.init(base64Encoded:options:)(v87);
    if (v16 >> 60 != 15)
    {
      v97 = v95;
      v98 = v16;
      isa = Data._bridgeToObjectiveC()().super.isa;
      v96 = SecCertificateCreateWithData(kCFAllocatorDefault, isa);

      sub_10000A9B0(v97, v98);
      goto LABEL_12;
    }
LABEL_11:
    v96 = 0;
LABEL_12:
    swift_bridgeObjectRelease(v12, (SEL)v16, v17, v18, v19, v20, v21, v22);
    return (uint64_t)v96;
  }
LABEL_16:
  __break(1u);
  return result;
}

_TtC14softposreaderd12RemoteReader *static SecCertificateRef.parseList(pemRepresentation:)(uint64_t a1, _TtC14softposreaderd12RemoteReader *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  NSString v8;
  SEL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  Class isa;
  _TtC14softposreaderd12RemoteReader *v18;
  Swift::String v19;
  _TtC14softposreaderd12RemoteReader *object;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  Swift::String v27;
  Swift::String_optional v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  const __CFData *v39;
  SecCertificateRef v40;
  SEL v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  Swift::String v48;
  _TtC14softposreaderd12RemoteReader *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  __SecCertificate *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _TtC14softposreaderd12RemoteReader *v60;
  const char *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v69;
  _TtC14softposreaderd12RemoteReader *v70;

  v3 = type metadata accessor for CharacterSet(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_allocWithZone((Class)NSScanner);
  swift_bridgeObjectRetain(a2);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2, v9, v10, v11, v12, v13, v14, v15);
  v16 = objc_msgSend(v7, "initWithString:", v8);

  static CharacterSet.whitespacesAndNewlines.getter();
  isa = CharacterSet._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  objc_msgSend(v16, "setCharactersToBeSkipped:", isa);

  v18 = &_swiftEmptyArrayStorage;
  v70 = &_swiftEmptyArrayStorage;
  if ((objc_msgSend(v16, "isAtEnd") & 1) != 0)
  {
LABEL_2:

  }
  else
  {
    while (1)
    {
      v19._countAndFlagsBits = 0xD00000000000001BLL;
      v19._object = (void *)0x80000001001731A0;
      object = (_TtC14softposreaderd12RemoteReader *)NSScanner.scanString(_:)(v19).value._object;
      swift_bridgeObjectRelease(object, (SEL)object, v21, v22, v23, v24, v25, v26);
      if (!object)
        goto LABEL_13;
      v27._countAndFlagsBits = 0xD000000000000019;
      v27._object = (void *)0x80000001001731C0;
      v28 = NSScanner.scanUpToString(_:)(v27);
      if (!v28.value._object)
        goto LABEL_13;
      v29 = Data.init(base64Encoded:options:)(v28.value._countAndFlagsBits);
      if (v30 >> 60 == 15)
      {
        swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v28.value._object, (SEL)v30, v31, v32, v33, v34, v35, v36);
LABEL_13:
        v60 = v70;

        goto LABEL_14;
      }
      v37 = v29;
      v38 = v30;
      v39 = Data._bridgeToObjectiveC()().super.isa;
      v40 = SecCertificateCreateWithData(kCFAllocatorDefault, v39);

      sub_10000A9B0(v37, v38);
      swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v28.value._object, v41, v42, v43, v44, v45, v46, v47);
      if (!v40)
        goto LABEL_13;
      v48._object = (void *)0x80000001001731C0;
      v48._countAndFlagsBits = 0xD000000000000019;
      v49 = (_TtC14softposreaderd12RemoteReader *)NSScanner.scanString(_:)(v48).value._object;
      swift_bridgeObjectRelease(v49, (SEL)v49, v50, v51, v52, v53, v54, v55);
      if (!v49)
        break;
      v56 = v40;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v58 = *(_QWORD *)(((unint64_t)v70 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v57 = *(_QWORD *)(((unint64_t)v70 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v58 >= v57 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v57 > 1, v58 + 1, 1);
      v59 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v58, v56);
      specialized Array._endMutation()(v59);

      if ((objc_msgSend(v16, "isAtEnd") & 1) != 0)
      {
        v18 = v70;
        goto LABEL_2;
      }
    }
    v60 = v70;

LABEL_14:
    swift_bridgeObjectRelease(v60, v61, v62, v63, v64, v65, v66, v67);
    return 0;
  }
  return v18;
}

uint64_t sub_100152708(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v5 = a5 - a4;
  if (!a4)
    v5 = 0;
  if (result < 0 || v5 < result)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (a3 < 0 || v5 < a3)
    goto LABEL_19;
  v6 = a3 - result;
  if (a2 > 0)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2)
      goto LABEL_14;
    return 0;
  }
  if (v6 <= 0 && v6 > a2)
    return 0;
LABEL_14:
  v7 = __OFADD__(result, a2);
  result += a2;
  if (v7)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  if (result < 0 || v5 < result)
    goto LABEL_21;
  return result;
}

uint64_t sub_100152790(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = a4 - a3;
  if (!a3)
    v4 = 0;
  if (result < 0 || v4 < result)
  {
    __break(1u);
  }
  else if ((a2 & 0x8000000000000000) == 0 && v4 >= a2)
  {
    return a2 - result;
  }
  __break(1u);
  return result;
}

unint64_t sub_1001527C4(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = String.index(_:offsetBy:limitedBy:)(15, result, v5);
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return String.subscript.getter();
  }
  __break(1u);
  return result;
}

uint64_t sub_100152860(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v5 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v5 = a2;
    v6 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v6 = 11;
    v7 = v6 | (v5 << 16);
    v8 = String.index(_:offsetBy:limitedBy:)(15, result, v7);
    if ((v9 & 1) != 0)
      v10 = v7;
    else
      v10 = v8;
    return String.subscript.getter(15, v10, a2, a3);
  }
  return result;
}

uint64_t sub_1001528E8(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;

  if ((a6 & 0x2000000000000000) != 0)
    v6 = HIBYTE(a6) & 0xF;
  else
    v6 = a5 & 0xFFFFFFFFFFFFLL;
  if (a3 == a5 && a4 == a6 && !(a1 >> 16) && a2 >> 16 == v6)
    return 1;
  else
    return _stringCompareInternal(_:_:_:_:expecting:)(a3) & 1;
}

void *TLVTag.asn1Null.unsafeMutableAddressor()
{
  return &static TLVTag.asn1Null;
}

void *TLVTag.asn1Boolean.unsafeMutableAddressor()
{
  return &static TLVTag.asn1Boolean;
}

void *TLVTag.asn1Integer.unsafeMutableAddressor()
{
  return &static TLVTag.asn1Integer;
}

void *TLVTag.asn1BitString.unsafeMutableAddressor()
{
  return &static TLVTag.asn1BitString;
}

void *TLVTag.asn1OctetString.unsafeMutableAddressor()
{
  return &static TLVTag.asn1OctetString;
}

void *TLVTag.asn1ObjectIdentifier.unsafeMutableAddressor()
{
  return &static TLVTag.asn1ObjectIdentifier;
}

void *TLVTag.asn1UTF8String.unsafeMutableAddressor()
{
  return &static TLVTag.asn1UTF8String;
}

uint64_t TLVTag.description.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100003A2C((uint64_t *)&unk_1001B1300);
  v3 = swift_allocObject(v2, 72, 7);
  *(_OWORD *)(v3 + 16) = xmmword_10015A5F0;
  *(_QWORD *)(v3 + 56) = &type metadata for UInt;
  *(_QWORD *)(v3 + 64) = &protocol witness table for UInt;
  *(_QWORD *)(v3 + 32) = a1;
  return String.init(format:_:)(1479684133, 0xE400000000000000, v3);
}

uint64_t TLVTag.dataRepresentation.getter(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  _TtC14softposreaderd12RemoteReader *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;

  v9 = sub_10009137C(0, 1, 1, (uint64_t)&_swiftEmptyArrayStorage, a5, a6, a7, a8);
  v14 = *(_QWORD *)&v9->instance[8];
  do
  {
    v15 = *(_QWORD *)&v9->instance[16];
    if (v14 >= v15 >> 1)
      v9 = sub_10009137C((_TtC14softposreaderd12RemoteReader *)(v15 > 1), v14 + 1, 1, (uint64_t)v9, v10, v11, v12, v13);
    *(_QWORD *)&v9->instance[8] = v14 + 1;
    v9->instance[v14++ + 24] = a1;
    v16 = a1 > 0xFF;
    a1 >>= 8;
  }
  while (v16);
  return sub_1001466C0((uint64_t)v9);
}

void *TLVTag.asn1Sequence.unsafeMutableAddressor()
{
  return &static TLVTag.asn1Sequence;
}

uint64_t static TLVTag.asn1Sequence.getter()
{
  return 48;
}

void *TLVTag.asn1Set.unsafeMutableAddressor()
{
  return &static TLVTag.asn1Set;
}

uint64_t static TLVTag.asn1Set.getter()
{
  return 49;
}

void *TLVTag.asn1PrintableString.unsafeMutableAddressor()
{
  return &static TLVTag.asn1PrintableString;
}

uint64_t static TLVTag.asn1PrintableString.getter()
{
  return 19;
}

void *TLVTag.asn1T61String.unsafeMutableAddressor()
{
  return &static TLVTag.asn1T61String;
}

uint64_t static TLVTag.asn1T61String.getter()
{
  return 20;
}

void *TLVTag.asn1IA5String.unsafeMutableAddressor()
{
  return &static TLVTag.asn1IA5String;
}

uint64_t static TLVTag.asn1IA5String.getter()
{
  return 22;
}

void *TLVTag.asn1UTCTime.unsafeMutableAddressor()
{
  return &static TLVTag.asn1UTCTime;
}

uint64_t static TLVTag.asn1UTCTime.getter()
{
  return 23;
}

void *TLVTag.applicationIdentifier.unsafeMutableAddressor()
{
  return &static TLVTag.applicationIdentifier;
}

uint64_t static TLVTag.applicationIdentifier.getter()
{
  return 79;
}

void *TLVTag.applicationLabel.unsafeMutableAddressor()
{
  return &static TLVTag.applicationLabel;
}

uint64_t static TLVTag.applicationLabel.getter()
{
  return 80;
}

void *TLVTag.transactionCurrencyCode.unsafeMutableAddressor()
{
  return &static TLVTag.transactionCurrencyCode;
}

uint64_t static TLVTag.transactionCurrencyCode.getter()
{
  return 24362;
}

void *TLVTag.languagePreference.unsafeMutableAddressor()
{
  return &static TLVTag.languagePreference;
}

uint64_t static TLVTag.languagePreference.getter()
{
  return 24365;
}

void *TLVTag.fileControlInformationTemplate.unsafeMutableAddressor()
{
  return &static TLVTag.fileControlInformationTemplate;
}

uint64_t static TLVTag.fileControlInformationTemplate.getter()
{
  return 111;
}

void *TLVTag.applicationInterchangeProfile.unsafeMutableAddressor()
{
  return &static TLVTag.applicationInterchangeProfile;
}

uint64_t static TLVTag.applicationInterchangeProfile.getter()
{
  return 130;
}

void *TLVTag.terminalVerificationResults.unsafeMutableAddressor()
{
  return &static TLVTag.terminalVerificationResults;
}

uint64_t static TLVTag.terminalVerificationResults.getter()
{
  return 149;
}

void *TLVTag.transactionDate.unsafeMutableAddressor()
{
  return &static TLVTag.transactionDate;
}

uint64_t static TLVTag.transactionDate.getter()
{
  return 154;
}

void *TLVTag.transactionType.unsafeMutableAddressor()
{
  return &static TLVTag.transactionType;
}

uint64_t static TLVTag.transactionType.getter()
{
  return 156;
}

void *TLVTag.authorizedAmount.unsafeMutableAddressor()
{
  return &static TLVTag.authorizedAmount;
}

uint64_t static TLVTag.authorizedAmount.getter()
{
  return 40706;
}

void *TLVTag.otherAmount.unsafeMutableAddressor()
{
  return &static TLVTag.otherAmount;
}

uint64_t static TLVTag.otherAmount.getter()
{
  return 40707;
}

void *TLVTag.issuerApplicationData.unsafeMutableAddressor()
{
  return &static TLVTag.issuerApplicationData;
}

uint64_t static TLVTag.issuerApplicationData.getter()
{
  return 40720;
}

void *TLVTag.applicationPreferredName.unsafeMutableAddressor()
{
  return &static TLVTag.applicationPreferredName;
}

uint64_t static TLVTag.applicationPreferredName.getter()
{
  return 40722;
}

void *TLVTag.merchantCategoryCode.unsafeMutableAddressor()
{
  return &static TLVTag.merchantCategoryCode;
}

uint64_t static TLVTag.merchantCategoryCode.getter()
{
  return 40725;
}

void *TLVTag.terminalCountryCode.unsafeMutableAddressor()
{
  return &static TLVTag.terminalCountryCode;
}

uint64_t static TLVTag.terminalCountryCode.getter()
{
  return 40730;
}

void *TLVTag.interfaceDeviceSerialNumber.unsafeMutableAddressor()
{
  return &static TLVTag.interfaceDeviceSerialNumber;
}

uint64_t static TLVTag.interfaceDeviceSerialNumber.getter()
{
  return 40734;
}

void *TLVTag.transactionTime.unsafeMutableAddressor()
{
  return &static TLVTag.transactionTime;
}

uint64_t static TLVTag.transactionTime.getter()
{
  return 40737;
}

void *TLVTag.cryptogramInformationData.unsafeMutableAddressor()
{
  return &static TLVTag.cryptogramInformationData;
}

uint64_t static TLVTag.cryptogramInformationData.getter()
{
  return 40743;
}

void *TLVTag.cvmResults.unsafeMutableAddressor()
{
  return &static TLVTag.cvmResults;
}

uint64_t static TLVTag.cvmResults.getter()
{
  return 40756;
}

void *TLVTag.unpredictableNumber.unsafeMutableAddressor()
{
  return &static TLVTag.unpredictableNumber;
}

uint64_t static TLVTag.unpredictableNumber.getter()
{
  return 40759;
}

void *TLVTag.thirdPartyData.unsafeMutableAddressor()
{
  return &static TLVTag.thirdPartyData;
}

uint64_t static TLVTag.thirdPartyData.getter()
{
  return 40814;
}

void *TLVTag.interacCardTransactionInformation.unsafeMutableAddressor()
{
  return &static TLVTag.interacCardTransactionInformation;
}

uint64_t static TLVTag.interacCardTransactionInformation.getter()
{
  return 40803;
}

void *TLVTag.cardInterfaceCapabilities.unsafeMutableAddressor()
{
  return &static TLVTag.cardInterfaceCapabilities;
}

uint64_t static TLVTag.cardInterfaceCapabilities.getter()
{
  return 40816;
}

void *TLVTag.cardProcessingRequirement.unsafeMutableAddressor()
{
  return &static TLVTag.cardProcessingRequirement;
}

uint64_t static TLVTag.cardProcessingRequirement.getter()
{
  return 40817;
}

void *TLVTag.errorIndication.unsafeMutableAddressor()
{
  return &static TLVTag.errorIndication;
}

uint64_t static TLVTag.errorIndication.getter()
{
  return 14647573;
}

void *TLVTag.userInterfaceRequestData.unsafeMutableAddressor()
{
  return &static TLVTag.userInterfaceRequestData;
}

uint64_t static TLVTag.userInterfaceRequestData.getter()
{
  return 14647574;
}

void *TLVTag.outcomeParameterSet.unsafeMutableAddressor()
{
  return &static TLVTag.outcomeParameterSet;
}

uint64_t static TLVTag.outcomeParameterSet.getter()
{
  return 14647593;
}

void *TLVTag.overrideAID.unsafeMutableAddressor()
{
  return &static TLVTag.overrideAID;
}

void *TLVTag.kernelIdentityKey.unsafeMutableAddressor()
{
  return &static TLVTag.kernelIdentityKey;
}

uint64_t static TLVTag.kernelIdentityKey.getter()
{
  return 24352;
}

void *TLVTag.sepData.unsafeMutableAddressor()
{
  return &static TLVTag.sepData;
}

uint64_t static TLVTag.sepData.getter()
{
  return 32560;
}

void *TLVTag.cipherBlob.unsafeMutableAddressor()
{
  return &static TLVTag.cipherBlob;
}

uint64_t static TLVTag.cipherBlob.getter()
{
  return 160;
}

void *TLVTag.keyBlob.unsafeMutableAddressor()
{
  return &static TLVTag.keyBlob;
}

uint64_t static TLVTag.keyBlob.getter()
{
  return 161;
}

void *TLVTag.certificateRevocationList.unsafeMutableAddressor()
{
  return &static TLVTag.certificateRevocationList;
}

uint64_t static TLVTag.certificateRevocationList.getter()
{
  return 177;
}

void *TLVTag.readerMetadata.unsafeMutableAddressor()
{
  return &static TLVTag.readerMetadata;
}

uint64_t static TLVTag.readerMetadata.getter()
{
  return 190;
}

void *TLVTag.preferredSchemes.unsafeMutableAddressor()
{
  return &static TLVTag.preferredSchemes;
}

uint64_t static TLVTag.preferredSchemes.getter()
{
  return 48946;
}

void *TLVTag.maxNumReaderConfigurations.unsafeMutableAddressor()
{
  return &static TLVTag.maxNumReaderConfigurations;
}

uint64_t static TLVTag.provisionDataFormatVersion.getter()
{
  return 193;
}

void *TLVTag.blobInformation.unsafeMutableAddressor()
{
  return &static TLVTag.blobInformation;
}

void *TLVTag.readerConfigProfileIDs.unsafeMutableAddressor()
{
  return &static TLVTag.readerConfigProfileIDs;
}

uint64_t static TLVTag.provisionDataKeyIdentifier.getter()
{
  return 194;
}

void *TLVTag.transactionKEKHash.unsafeMutableAddressor()
{
  return &static TLVTag.transactionKEKHash;
}

uint64_t static TLVTag.provisionDataEphemeralPublicKey.getter()
{
  return 196;
}

void *TLVTag.cipheredData.unsafeMutableAddressor()
{
  return &static TLVTag.cipheredData;
}

uint64_t static TLVTag.provisionDataCipherText.getter()
{
  return 197;
}

void *TLVTag.pinKEKHash.unsafeMutableAddressor()
{
  return &static TLVTag.pinKEKHash;
}

void *TLVTag.transactionAndPINKEKHashes.unsafeMutableAddressor()
{
  return &static TLVTag.transactionAndPINKEKHashes;
}

uint64_t static TLVTag.transactionAndPINKEKHashes.getter()
{
  return 200;
}

void *TLVTag.globalConfigID.unsafeMutableAddressor()
{
  return &static TLVTag.globalConfigID;
}

uint64_t static TLVTag.provisionAppletConfigID.getter()
{
  return 201;
}

void *TLVTag.payAppletVersionString.unsafeMutableAddressor()
{
  return &static TLVTag.payAppletVersionString;
}

uint64_t static TLVTag.payAppletVersionString.getter()
{
  return 208;
}

void *TLVTag.cipherBlobIVOrSalt.unsafeMutableAddressor()
{
  return &static TLVTag.cipherBlobIVOrSalt;
}

void *TLVTag.readerMetadataTransactionID.unsafeMutableAddressor()
{
  return &static TLVTag.readerMetadataTransactionID;
}

uint64_t static TLVTag.provisionDataAuthenticationTag.getter()
{
  return 209;
}

void *TLVTag.availableKernelsMap.unsafeMutableAddressor()
{
  return &static TLVTag.availableKernelsMap;
}

void *TLVTag.blobDefinition.unsafeMutableAddressor()
{
  return &static TLVTag.blobDefinition;
}

uint64_t static TLVTag.blobDefinition.getter()
{
  return 224;
}

void *TLVTag.aidOverridePerformed.unsafeMutableAddressor()
{
  return &static TLVTag.aidOverridePerformed;
}

uint64_t static TLVTag.aidOverridePerformed.getter()
{
  return 57137;
}

void *TLVTag.cardState.unsafeMutableAddressor()
{
  return &static TLVTag.cardState;
}

uint64_t static TLVTag.cardState.getter()
{
  return 57139;
}

void *TLVTag.transactionResultData.unsafeMutableAddressor()
{
  return &static TLVTag.transactionResultData;
}

uint64_t static TLVTag.transactionResultData.getter()
{
  return 14647806;
}

void *TLVTag.trxCipherAndKeyBlobs.unsafeMutableAddressor()
{
  return &static TLVTag.trxCipherAndKeyBlobs;
}

uint64_t static TLVTag.trxCipherAndKeyBlobs.getter()
{
  return 14647807;
}

void *TLVTag.analyticsData.unsafeMutableAddressor()
{
  return &static TLVTag.analyticsData;
}

uint64_t static TLVTag.analyticsData.getter()
{
  return 14647805;
}

void *TLVTag.provisionAppletVersionInfo.unsafeMutableAddressor()
{
  return &static TLVTag.provisionAppletVersionInfo;
}

void *TLVTag.provisionAppletAnalytics.unsafeMutableAddressor()
{
  return &static TLVTag.provisionAppletAnalytics;
}

uint64_t static TLVTag.provisionAppletAnalytics.getter()
{
  return 195;
}

void *TLVTag.provisionAppletConfigID.unsafeMutableAddressor()
{
  return &static TLVTag.provisionAppletConfigID;
}

void *TLVTag.provisionAppletDataBlob.unsafeMutableAddressor()
{
  return &static TLVTag.provisionAppletDataBlob;
}

uint64_t static TLVTag.provisionAppletDataBlob.getter()
{
  return 203;
}

void *TLVTag.provisionAppletPINDataBlob.unsafeMutableAddressor()
{
  return &static TLVTag.provisionAppletPINDataBlob;
}

uint64_t static TLVTag.provisionAppletPINDataBlob.getter()
{
  return 204;
}

void *TLVTag.provisionAppletTrackError.unsafeMutableAddressor()
{
  return &static TLVTag.provisionAppletTrackError;
}

uint64_t static TLVTag.provisionAppletTrackError.getter()
{
  return 205;
}

void *TLVTag.provisionDataFormatVersion.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataFormatVersion;
}

void *TLVTag.provisionDataKeyIdentifier.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataKeyIdentifier;
}

void *TLVTag.provisionDataEphemeralPublicKey.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataEphemeralPublicKey;
}

void *TLVTag.provisionDataCipherText.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataCipherText;
}

void *TLVTag.provisionDataUnpredictableNumber.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataUnpredictableNumber;
}

uint64_t static TLVTag.provisionDataUnpredictableNumber.getter()
{
  return 198;
}

void *TLVTag.provisionDataAuthenticationTag.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataAuthenticationTag;
}

void *TLVTag.provisionDataCASDSignature.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataCASDSignature;
}

uint64_t static TLVTag.provisionDataCASDSignature.getter()
{
  return 210;
}

void *TLVTag.provisionDataApplicationMetaData.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataApplicationMetaData;
}

uint64_t static TLVTag.provisionDataApplicationMetaData.getter()
{
  return 239;
}

void *TLVTag.provisionDataPlatformId.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataPlatformId;
}

void *TLVTag.provisionDataConfigId.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataConfigId;
}

void *TLVTag.provisionDataTransactionId.unsafeMutableAddressor()
{
  return &static TLVTag.provisionDataTransactionId;
}

uint64_t static TLVTag.provisionDataTransactionId.getter()
{
  return 206;
}

void *TLVTag.eventStatus.unsafeMutableAddressor()
{
  return &static TLVTag.eventStatus;
}

uint64_t static TLVTag.eventStatus.getter()
{
  return 192;
}

void *TLVTag.eventOutOpsUird.unsafeMutableAddressor()
{
  return &static TLVTag.eventOutOpsUird;
}

void *TLVTag.eventTrackError.unsafeMutableAddressor()
{
  return &static TLVTag.eventTrackError;
}

void *TLVTag.eventSelectPPSEResponse.unsafeMutableAddressor()
{
  return &static TLVTag.eventSelectPPSEResponse;
}

void *TLVTag.eventOutcome.unsafeMutableAddressor()
{
  return &static TLVTag.eventOutcome;
}

void *TLVTag.eventErrorIndication.unsafeMutableAddressor()
{
  return &static TLVTag.eventErrorIndication;
}

void *TLVTag.OFFSET_BYTE_2.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_BYTE_2;
}

void *TLVTag.OFFSET_BYTE_3.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_BYTE_3;
}

void *TLVTag.MASK_LEAST_SIG_NIBBLE.unsafeMutableAddressor()
{
  return &static TLVTag.MASK_LEAST_SIG_NIBBLE;
}

uint64_t static TLVTag.CARD_STATE_EXPIRATION_MASK.getter()
{
  return 15;
}

void *TLVTag.MASK_MOST_SIG_NIBBLE.unsafeMutableAddressor()
{
  return &static TLVTag.MASK_MOST_SIG_NIBBLE;
}

uint64_t static TLVTag.CARD_STATE_EFFECTIVE_MASK.getter()
{
  return 240;
}

void *TLVTag.TAG_9F02_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_9F02_LENGTH;
}

uint64_t sub_1001530E4()
{
  uint64_t result;
  unint64_t v1;

  result = _s10Foundation4DataV7SPRBaseE9hexStringACSgSS_tcfC_0(0x3030303030303030, (_TtC14softposreaderd12RemoteReader *)0xEC00000030303030);
  if (v1 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    static TLVTag.TAG_9F03_DEFAULT = result;
    unk_1001B5060 = v1;
  }
  return result;
}

uint64_t *TLVTag.TAG_9F03_DEFAULT.unsafeMutableAddressor()
{
  if (qword_1001B45F0 != -1)
    swift_once(&qword_1001B45F0, sub_1001530E4);
  return &static TLVTag.TAG_9F03_DEFAULT;
}

uint64_t static TLVTag.TAG_9F03_DEFAULT.getter()
{
  uint64_t v0;

  if (qword_1001B45F0 != -1)
    swift_once(&qword_1001B45F0, sub_1001530E4);
  v0 = static TLVTag.TAG_9F03_DEFAULT;
  sub_100005D9C(static TLVTag.TAG_9F03_DEFAULT, unk_1001B5060);
  return v0;
}

void *TLVTag.TAG_5F2A_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_5F2A_LENGTH;
}

void *TLVTag.TAG_9F1A_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_9F1A_LENGTH;
}

void *TLVTag.TAG_9F1E_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_9F1E_LENGTH;
}

uint64_t static TLVTag.TAG_DF8129_LENGTH.getter()
{
  return 8;
}

void *TLVTag.TAG_DF8129_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_DF8129_LENGTH;
}

void *TLVTag.OFFSET_OPS_STATUS.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_OPS_STATUS;
}

void *TLVTag.OPS_STATUS_MASK.unsafeMutableAddressor()
{
  return &static TLVTag.OPS_STATUS_MASK;
}

void *TLVTag.OFFSET_OPS_CVM.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_OPS_CVM;
}

void *TLVTag.OPS_CVM_MASK.unsafeMutableAddressor()
{
  return &static TLVTag.OPS_CVM_MASK;
}

void *TLVTag.TAG_9F34_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_9F34_LENGTH;
}

void *TLVTag.OFFSET_CVM_RESULTS_CVM_PERFORMED.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_CVM_RESULTS_CVM_PERFORMED;
}

void *TLVTag.OFFSET_CVM_RESULTS_CVM_RESULTS.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_CVM_RESULTS_CVM_RESULTS;
}

void *TLVTag.CVM_RESULTS_NO_CVM_PERFORMED.unsafeMutableAddressor()
{
  return &static TLVTag.CVM_RESULTS_NO_CVM_PERFORMED;
}

uint64_t static TLVTag.CVM_RESULTS_NO_CVM_PERFORMED.getter()
{
  return 63;
}

void *TLVTag.CVM_RESULTS_CVM_SUCCESSFUL.unsafeMutableAddressor()
{
  return &static TLVTag.CVM_RESULTS_CVM_SUCCESSFUL;
}

void *TLVTag.TAG_95_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_95_LENGTH;
}

void *TLVTag.TVR_CV_NOT_SUCCESSFUL_BIT.unsafeMutableAddressor()
{
  return &static TLVTag.TVR_CV_NOT_SUCCESSFUL_BIT;
}

uint64_t static TLVTag.TVR_CV_NOT_SUCCESSFUL_BIT.getter()
{
  return 7;
}

void *TLVTag.TAG_DF8115_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_DF8115_LENGTH;
}

void *TLVTag.OFFSET_ERROR_INDICATION_L2.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_ERROR_INDICATION_L2;
}

void *TLVTag.OFFSET_ERROR_INDICATION_SW12.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_ERROR_INDICATION_SW12;
}

uint64_t static TLVTag.OFFSET_ERROR_INDICATION_SW12.getter()
{
  return 3;
}

void *TLVTag.OFFSET_ERROR_INDICATION_MSG_ON_ERROR.unsafeMutableAddressor()
{
  return &static TLVTag.OFFSET_ERROR_INDICATION_MSG_ON_ERROR;
}

uint64_t static TLVTag.OFFSET_ERROR_INDICATION_MSG_ON_ERROR.getter()
{
  return 5;
}

void *TLVTag.TAG_9F15_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_9F15_LENGTH;
}

void *TLVTag.TAG_9F37_LENGTH.unsafeMutableAddressor()
{
  return &static TLVTag.TAG_9F37_LENGTH;
}

void *TLVTag.CARD_STATE_EXPIRATION_MASK.unsafeMutableAddressor()
{
  return &static TLVTag.CARD_STATE_EXPIRATION_MASK;
}

void *TLVTag.CARD_STATE_EFFECTIVE_MASK.unsafeMutableAddressor()
{
  return &static TLVTag.CARD_STATE_EFFECTIVE_MASK;
}

void *TLVTag.casdPublicKey.unsafeMutableAddressor()
{
  return &static TLVTag.casdPublicKey;
}

uint64_t static TLVTag.casdPublicKey.getter()
{
  return 32585;
}

void *TLVTag.casdPublicKeyData.unsafeMutableAddressor()
{
  return &static TLVTag.casdPublicKeyData;
}

uint64_t static TLVTag.casdPublicKeyData.getter()
{
  return 176;
}

uint64_t TLVTag.init(application:isConstructed:)(unint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;

  v2 = 64;
  if ((a2 & 1) != 0)
    v2 = 96;
  if (a1 <= 0x1F)
    return v2 | a1;
  v4 = v2 | 0x1F;
  if (a1 < 0x80)
    return a1 | (v4 << 8);
  do
  {
    v4 = a1 & 0x7F | (v4 << 8) | 0x80;
    v5 = a1 >> 7;
    v6 = a1 >= 0x4000;
    a1 >>= 7;
  }
  while (v6);
  return v5 | (v4 << 8);
}

uint64_t TLVTag.init(contextSpecific:isConstructed:)(unint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;

  v2 = 128;
  if ((a2 & 1) != 0)
    v2 = 160;
  if (a1 <= 0x1F)
    return v2 | a1;
  v4 = v2 | 0x1F;
  if (a1 < 0x80)
    return a1 | (v4 << 8);
  do
  {
    v4 = a1 & 0x7F | (v4 << 8) | 0x80;
    v5 = a1 >> 7;
    v6 = a1 >= 0x4000;
    a1 >>= 7;
  }
  while (v6);
  return v5 | (v4 << 8);
}

uint64_t TLVTag.init(private:isConstructed:)(unint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;

  v2 = 192;
  if ((a2 & 1) != 0)
    v2 = 224;
  if (a1 <= 0x1F)
    return v2 | a1;
  v4 = v2 | 0x1F;
  if (a1 < 0x80)
    return a1 | (v4 << 8);
  do
  {
    v4 = a1 & 0x7F | (v4 << 8) | 0x80;
    v5 = a1 >> 7;
    v6 = a1 >= 0x4000;
    a1 >>= 7;
  }
  while (v6);
  return v5 | (v4 << 8);
}

uint64_t sub_100153444()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = sub_100003A2C((uint64_t *)&unk_1001B1300);
  v3 = swift_allocObject(v2, 72, 7);
  *(_OWORD *)(v3 + 16) = xmmword_10015A5F0;
  *(_QWORD *)(v3 + 56) = &type metadata for UInt;
  *(_QWORD *)(v3 + 64) = &protocol witness table for UInt;
  *(_QWORD *)(v3 + 32) = v1;
  return String.init(format:_:)(1479684133, 0xE400000000000000, v3);
}

ValueMetadata *type metadata accessor for TLVTag()
{
  return &type metadata for TLVTag;
}

void static JSONEncoder.encodeClean<A>(_:outputFormatting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;

  v8 = objc_autoreleasePoolPush();
  sub_100153544(a2, a1, a3, a4, &v9);
  objc_autoreleasePoolPop(v8);
}

uint64_t sub_100153544@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;

  v22 = a5;
  v10 = type metadata accessor for JSONEncoder.OutputFormatting(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for JSONEncoder(0);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  v15 = JSONEncoder.init()();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  dispatch thunk of JSONEncoder.outputFormatting.setter(v13);
  v16 = dispatch thunk of JSONEncoder.encode<A>(_:)(a2, a3, a4);
  v18 = v17;
  result = swift_release(v15);
  if (!v5)
  {
    v20 = v22;
    *v22 = v16;
    v20[1] = v18;
  }
  return result;
}

void static JSONDecoder.decodeClean<A>(_:from:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v12;

  v12 = objc_autoreleasePoolPush();
  sub_1001536D8(a4, a1, a2, a3, a5, a6);
  objc_autoreleasePoolPop(v12);
}

uint64_t sub_1001536D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v12 = type metadata accessor for JSONDecoder(0);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v13 = JSONDecoder.init()();
  v14 = swift_bridgeObjectRetain(a1);
  dispatch thunk of JSONDecoder.userInfo.setter(v14);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(a2, a3, a4, a5, a6);
  return swift_release(v13);
}

void DERWriter.writeDER(tlv:)(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  Swift::Int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD *, void *, unint64_t, uint64_t, uint64_t);
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  unint64_t v29;

  DERWriter.writeDER(tag:)(a1[2], a2, a3);
  if (!v3)
  {
    v7 = TLV.length.getter();
    DERWriter.writeDER(length:)(v7);
    if (!v8)
    {
      v10 = a1[3];
      v9 = a1[4];
      if ((v9 & 0x2000000000000000) == 0)
      {
        v28[0] = a1[3];
        v28[1] = v9;
        v11 = *(void (**)(_QWORD *, void *, unint64_t, uint64_t, uint64_t))(a3 + 16);
        sub_100005D9C(v10, v9);
        v12 = sub_1000C5284();
        v11(v28, &type metadata for Data, v12, a2, a3);
        goto LABEL_20;
      }
      v19 = v10 & 0xFFFFFFFFFFFFFF8;
      if ((unint64_t)v10 >> 62)
        goto LABEL_16;
      v20 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      while (v20)
      {
        v26 = v9;
        v27 = v10;
        v29 = v10 & 0xC000000000000001;
        v21 = 4;
        while (1)
        {
          v22 = v21 - 4;
          if (!v29)
            break;
          v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v21 - 4, v10);
          v9 = v21 - 3;
          if (__OFADD__(v22, 1))
            goto LABEL_15;
LABEL_13:
          DERWriter.writeDER(tlv:)(v10, a2, a3);
          swift_release(v10);
          ++v21;
          v10 = v27;
          if (v9 == v20)
          {
            v23 = v27;
            v24 = v26;
            goto LABEL_21;
          }
        }
        v10 = *(_QWORD *)(v10 + 8 * v21);
        swift_retain();
        v9 = v21 - 3;
        if (!__OFADD__(v22, 1))
          goto LABEL_13;
LABEL_15:
        __break(1u);
LABEL_16:
        if (v10 >= 0)
          v25 = v19;
        else
          v25 = v10;
        swift_bridgeObjectRetain();
        v20 = _CocoaArrayWrapper.endIndex.getter(v25);
      }
LABEL_20:
      v23 = v10;
      v24 = v9;
LABEL_21:
      sub_10014ACB0(v23, v24, v13, v14, v15, v16, v17, v18);
    }
  }
}

uint64_t DERMemoryWriter.__allocating_init(capacity:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = swift_allocObject(v1, 32, 7);
  if (a1)
  {
    if (a1 <= 14)
    {
      v6 = 0;
      v7 = 0;
    }
    else
    {
      v4 = type metadata accessor for __DataStorage(0);
      swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
      v5 = __DataStorage.init(capacity:)(a1);
      if ((unint64_t)a1 > 0x7FFFFFFE)
      {
        v8 = type metadata accessor for Data.RangeReference(0);
        v6 = swift_allocObject(v8, 32, 7);
        v7 = v5 | 0x8000000000000000;
        *(_QWORD *)(v6 + 16) = 0;
        *(_QWORD *)(v6 + 24) = 0;
      }
      else
      {
        v6 = 0;
        v7 = v5 | 0x4000000000000000;
      }
    }
  }
  else
  {
    v6 = 0;
    v7 = 0xC000000000000000;
  }
  *(_QWORD *)(v3 + 16) = v6;
  *(_QWORD *)(v3 + 24) = v7;
  return v3;
}

uint64_t DERWriter.writeDER(tag:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v7)(unint64_t *, void *, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (a1)
  {
    v11 = bswap64(a1);
    return sub_100153C30((uint64_t)&v11, (uint64_t)&v12, v3, __clz(a1) >> 3, a2, a3, &v10);
  }
  else
  {
    LOBYTE(v11) = 0;
    v7 = *(uint64_t (**)(unint64_t *, void *, unint64_t, unint64_t, uint64_t, uint64_t))(a3 + 8);
    v8 = sub_100150228();
    v9 = sub_1000257E0();
    return v7(&v11, &type metadata for UInt8, v8, v9, a2, a3);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DERWriter.writeDER(length:)(Swift::Int length)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v8)(unint64_t *, void *, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void (*v12)(unint64_t *, void *, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v5 = v2;
  v6 = v1;
  if (length > 127)
  {
    v11 = __clz(length) >> 3;
    LOBYTE(v16) = -120 - v11;
    v12 = *(void (**)(unint64_t *, void *, unint64_t, unint64_t, uint64_t, uint64_t))(v2 + 8);
    v13 = sub_100150228();
    v14 = sub_1000257E0();
    v12(&v16, &type metadata for UInt8, v13, v14, v6, v5);
    if (!v4)
    {
      v16 = bswap64(length);
      sub_100153C30((uint64_t)&v16, (uint64_t)&v17, v3, v11, v6, v5, &v15);
    }
  }
  else
  {
    if (length < 0)
      __break(1u);
    LOBYTE(v16) = length;
    v8 = *(void (**)(unint64_t *, void *, unint64_t, unint64_t, uint64_t, uint64_t))(v2 + 8);
    v9 = sub_100150228();
    v10 = sub_1000257E0();
    v8(&v16, &type metadata for UInt8, v9, v10, v6, v5);
  }
}

uint64_t sub_100153C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *, uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  _QWORD v18[4];

  v18[0] = sub_100151C68(a4, a1, a2);
  v18[1] = v11;
  v18[2] = v12;
  v18[3] = v13;
  v14 = *(uint64_t (**)(_QWORD *, uint64_t, unint64_t, uint64_t, uint64_t))(a6 + 16);
  v15 = sub_100003A2C(&qword_1001B4888);
  v16 = sub_100154A74();
  result = v14(v18, v15, v16, a5, a6);
  if (v7)
    *a7 = v7;
  return result;
}

id NSOutputStream.write<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id result;
  char *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[16];
  void *v31;

  v6 = type metadata accessor for CocoaError.Code(0);
  __chkstk_darwin(v6);
  v27 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CocoaError(0);
  v28 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char **)((char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(_QWORD *)(a2 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  __chkstk_darwin(v13);
  dispatch thunk of FixedWidthInteger.bigEndian.getter(a2, a3);
  v31 = v3;
  sub_1001508E0((uint64_t)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)sub_100154510, (uint64_t)v30, a2, (uint64_t)&type metadata for Never, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Never, v14);
  result = (id)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))((char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  if (v29 < 0)
  {
    result = objc_msgSend(v3, "streamError");
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    if (v29 == v12)
      return result;
    v16 = v27;
    static CocoaError.Code.fileWriteOutOfSpace.getter(result);
    v24 = sub_1000CEC5C((uint64_t)&_swiftEmptyArrayStorage, v17, v18, v19, v20, v21, v22, v23);
    v25 = sub_100154960();
    v26 = _BridgedStoredNSError.init(_:userInfo:)(v10, v16, v24, v8, v25);
    CocoaError._nsError.getter(v26);
    result = (id)(*(uint64_t (**)(_QWORD *, uint64_t))(v28 + 8))(v10, v8);
  }
  return (id)swift_willThrow(result);
}

char *NSOutputStream.write<A>(contentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t AssociatedConformanceWitness;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  char *result;
  char *v32;
  const char *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v52 = a1;
  v5 = type metadata accessor for CocoaError.Code(0);
  __chkstk_darwin(v5);
  v47 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CocoaError(0);
  v48 = *(_QWORD *)(v7 - 8);
  v49 = v7;
  __chkstk_darwin(v7);
  v46 = (_QWORD **)((char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v56 = a3;
  v57 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a3, a2, &protocol requirements base descriptor for DataProtocol);
  v10 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedConformanceWitness(a3, a2, AssociatedTypeWitness, &protocol requirements base descriptor for DataProtocol, &associated conformance descriptor for DataProtocol.DataProtocol.Regions: BidirectionalCollection)+ 8)+ 8);
  v55 = v10;
  v11 = swift_getAssociatedTypeWitness(0, v10, AssociatedTypeWitness, &protocol requirements base descriptor for Sequence);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v46 - v13;
  v15 = type metadata accessor for Optional(0, v11);
  __chkstk_darwin(v15);
  v17 = (char *)&v46 - v16;
  v51 = swift_checkMetadataState(0, AssociatedTypeWitness);
  __chkstk_darwin(v51);
  v19 = swift_getAssociatedTypeWitness(0, v10, v18, &protocol requirements base descriptor for Sequence);
  v50 = *(_QWORD *)(v19 - 8);
  v20 = __chkstk_darwin(v19);
  v22 = (char *)&v46 - v21;
  dispatch thunk of DataProtocol.regions.getter(v57, v56, v20);
  v54 = v22;
  v23 = v51;
  v24 = v55;
  dispatch thunk of Sequence.makeIterator()(v51, v55);
  v55 = v19;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v24, v23, v19, &protocol requirements base descriptor for Sequence, &associated conformance descriptor for Sequence.Sequence.Iterator: IteratorProtocol);
  v26 = 0;
  while (1)
  {
    dispatch thunk of IteratorProtocol.next()(v55, AssociatedConformanceWitness);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v17, 1, v11) == 1)
      goto LABEL_7;
    v27 = (*(uint64_t (**)(char *, char *, uint64_t))(v12 + 32))(v14, v17, v11);
    __chkstk_darwin(v27);
    *(&v46 - 2) = v53;
    v28 = swift_getAssociatedConformanceWitness(v56, v57, v11, &protocol requirements base descriptor for DataProtocol, &associated conformance descriptor for DataProtocol.DataProtocol.Regions.Sequence.Element: ContiguousBytes);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(&v58, sub_100154510, &v46 - 4, &type metadata for Int, v11, v28);
    v29 = v58;
    if (v58 < 0)
      break;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v30 = __OFADD__(v26, v29);
    v26 += v29;
    if (v30)
    {
      __break(1u);
LABEL_7:
      (*(void (**)(char *, uint64_t))(v50 + 8))(v54, v55);
      result = (char *)dispatch thunk of Collection.count.getter(v57, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v56 + 8) + 8) + 8));
      if (v26 != result)
      {
        v32 = v47;
        static CocoaError.Code.fileWriteOutOfSpace.getter(result);
        v40 = sub_1000CEC5C((uint64_t)&_swiftEmptyArrayStorage, v33, v34, v35, v36, v37, v38, v39);
        v41 = sub_100154960();
        v42 = v46;
        v43 = v49;
        v44 = _BridgedStoredNSError.init(_:userInfo:)(v46, v32, v40, v49, v41);
        CocoaError._nsError.getter(v44);
        v45 = (*(uint64_t (**)(_QWORD *, uint64_t))(v48 + 8))(v42, v43);
        return (char *)swift_willThrow(v45);
      }
      return result;
    }
  }
  result = (char *)objc_msgSend(v53, "streamError");
  if (result)
  {
    swift_willThrow(result);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return (char *)(*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v54, v55);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10015433C@<X0>(id a1@<X2>, id result@<X0>, uint64_t a3@<X1>, _QWORD *a4@<X8>)
{
  if (result)
  {
    result = objc_msgSend(a1, "write:maxLength:", result, a3 - (_QWORD)result);
    *a4 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100154388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NSOutputStream.write<A>(_:)(a1, a2, a3);
}

char *sub_10015439C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NSOutputStream.write<A>(contentsOf:)(a1, a2, a3);
}

uint64_t sub_1001543B0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _BYTE v8[24];

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  swift_beginAccess(*a2 + 16, v8, 1, 0);
  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  sub_100005D9C(v2, v3);
  return sub_100005DE0(v5, v6);
}

uint64_t DERMemoryWriter.memory.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  swift_beginAccess(v0 + 16, v3, 0, 0);
  v1 = *(_QWORD *)(v0 + 16);
  sub_100005D9C(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t DERMemoryWriter.init(capacity:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v2 = v1;
  if (a1)
  {
    v3 = a1;
    if (a1 <= 14)
    {
      a1 = 0;
      v6 = 0;
    }
    else
    {
      v4 = type metadata accessor for __DataStorage(0);
      swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
      v5 = __DataStorage.init(capacity:)(v3);
      if (v3 > 0x7FFFFFFE)
      {
        v7 = type metadata accessor for Data.RangeReference(0);
        a1 = swift_allocObject(v7, 32, 7);
        v6 = v5 | 0x8000000000000000;
        *(_QWORD *)(a1 + 16) = 0;
        *(_QWORD *)(a1 + 24) = 0;
      }
      else
      {
        a1 = 0;
        v6 = v5 | 0x4000000000000000;
      }
    }
  }
  else
  {
    v6 = 0xC000000000000000;
  }
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v6;
  return v2;
}

id sub_100154510@<X0>(id result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  if (result)
  {
    result = objc_msgSend(*(id *)(v3 + 16), "write:maxLength:", result, a2 - (_QWORD)result);
    *a3 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t DERMemoryWriter.write<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = *(_QWORD *)(a2 - 8);
  __chkstk_darwin(a1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of FixedWidthInteger.bigEndian.getter(v7, v8);
  sub_1001508E0((uint64_t)v6, (uint64_t)sub_1001549A8, v2, a2, (uint64_t)&type metadata for Never, (uint64_t)(&type metadata for () + 1), (uint64_t)&protocol witness table for Never, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a2);
}

uint64_t sub_100154650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD v7[5];
  _BYTE v8[24];

  swift_beginAccess(a3 + 16, v8, 33, 0);
  v7[3] = &type metadata for UnsafeRawBufferPointer;
  v7[4] = &protocol witness table for UnsafeRawBufferPointer;
  v7[0] = a1;
  v7[1] = a2;
  v5 = sub_100005EF8(v7, (uint64_t)&type metadata for UnsafeRawBufferPointer);
  Data._Representation.append(contentsOf:)(*v5, v5[1]);
  sub_100005D3C(v7);
  return swift_endAccess(v8);
}

uint64_t DERMemoryWriter.write<A>(contentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _BYTE v8[24];

  swift_beginAccess(v3 + 16, v8, 33, 0);
  Data.append<A>(contentsOf:)(a1, a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 8) + 8) + 8) + 8));
  return swift_endAccess(v8);
}

uint64_t DERMemoryWriter.deinit()
{
  uint64_t v0;

  sub_100005DE0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return v0;
}

uint64_t DERMemoryWriter.__deallocating_deinit()
{
  uint64_t v0;

  sub_100005DE0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_1001547A0(uint64_t a1, uint64_t a2)
{
  return DERMemoryWriter.write<A>(_:)(a1, a2);
}

uint64_t sub_1001547B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return DERMemoryWriter.write<A>(contentsOf:)(a1, a2, a3);
}

uint64_t NSFileHandle.write<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[16];
  uint64_t v14;

  v4 = *(_QWORD *)(a2 - 8);
  __chkstk_darwin(a1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of FixedWidthInteger.bigEndian.getter(v7, v8);
  v14 = v2;
  v9 = sub_100003A2C((uint64_t *)&unk_1001B1280);
  sub_1001508E0((uint64_t)v6, (uint64_t)sub_1001549C4, (uint64_t)v13, a2, v9, (uint64_t)(&type metadata for () + 1), (uint64_t)&protocol self-conformance witness table for Error, (uint64_t)&v12);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a2);
}

uint64_t sub_1001548D8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  unint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v8[1] = a2;
  v8[0] = a1;
  v6 = sub_1000CEC18();
  result = NSFileHandle.write<A>(contentsOf:)(v8, &type metadata for UnsafeRawBufferPointer, v6);
  if (v4)
    *a4 = v4;
  return result;
}

uint64_t sub_100154938(uint64_t a1, uint64_t a2)
{
  return NSFileHandle.write<A>(_:)(a1, a2);
}

uint64_t sub_10015494C()
{
  return NSFileHandle.write<A>(contentsOf:)();
}

unint64_t sub_100154960()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1001B2198;
  if (!qword_1001B2198)
  {
    v1 = type metadata accessor for CocoaError(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for CocoaError, v1);
    atomic_store(result, (unint64_t *)&qword_1001B2198);
  }
  return result;
}

uint64_t sub_1001549A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100154650(a1, a2, v2);
}

uint64_t sub_1001549C4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  return sub_1001548D8(a1, a2, *(_QWORD *)(v3 + 16), a3);
}

uint64_t sub_1001549E0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE v7[24];

  v3 = *a1;
  swift_beginAccess(*a1 + 16, v7, 0, 0);
  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  *a2 = v4;
  a2[1] = v5;
  return sub_100005D9C(v4, v5);
}

uint64_t type metadata accessor for DERMemoryWriter()
{
  return objc_opt_self(_TtC7SPRBase15DERMemoryWriter);
}

uint64_t sub_100154A4C(uint64_t a1, uint64_t a2)
{
  return Data._Representation.append(contentsOf:)(a1, a2);
}

unint64_t sub_100154A74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1001B4978[0];
  if (!qword_1001B4978[0])
  {
    v1 = sub_100003A6C(&qword_1001B4888);
    sub_1000CEC18();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> Slice<A>, v1);
    atomic_store(result, qword_1001B4978);
  }
  return result;
}

uint64_t LazySequenceProtocol.padding(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;

  v8 = *(_QWORD *)(a3 + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v8, a2, &protocol requirements base descriptor for Sequence);
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  v12 = (char *)&v19 - v11;
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v17 + 16))(v16, v4, a2, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, AssociatedTypeWitness);
  return sub_100154F7C((uint64_t)v16, (uint64_t)v12, a2, v8, a4);
}

uint64_t LazyPaddedSequence.Iterator.next()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t AssociatedConformanceWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v18 = a2;
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, v4, v5, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v7 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - v9;
  v11 = swift_getAssociatedTypeWitness(0, v4, v5, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Iterator);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v4, v5, v11, &protocol requirements base descriptor for Sequence, &associated conformance descriptor for Sequence.Sequence.Iterator: IteratorProtocol);
  dispatch thunk of IteratorProtocol.next()(v11, AssociatedConformanceWitness);
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, AssociatedTypeWitness) == 1)
  {
    v14 = v2 + *(int *)(a1 + 36);
    v15 = v18;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v18, v14, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    v15 = v18;
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v18, v10, AssociatedTypeWitness);
  }
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, AssociatedTypeWitness);
}

uint64_t sub_100154D54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a4, a3, &protocol requirements base descriptor for Sequence);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a5, a1, AssociatedTypeWitness);
  v12 = a5 + *(int *)(type metadata accessor for LazyPaddedSequence.Iterator(0, a3, a4, v11) + 36);
  v13 = swift_getAssociatedTypeWitness(0, a4, a3, &protocol requirements base descriptor for Sequence);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12, a2, v13);
}

uint64_t LazyPaddedSequence.makeIterator()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  char *v18;
  uint64_t v20;
  uint64_t v21;

  v3 = v2;
  v21 = a2;
  v6 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence);
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  v10 = (char *)&v20 - v9;
  v11 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v20 - v17;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v11 + 16))(v14, v3, v6, v16);
  dispatch thunk of Sequence.makeIterator()(v6, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v3 + *(int *)(a1 + 36), AssociatedTypeWitness);
  return sub_100154D54((uint64_t)v18, (uint64_t)v10, v6, v5, v21);
}

uint64_t sub_100154F7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(a5, a1);
  v10 = a5 + *(int *)(type metadata accessor for LazyPaddedSequence(0, a3, a4, v9) + 36);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a4, a3, &protocol requirements base descriptor for Sequence);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(v10, a2, AssociatedTypeWitness);
}

uint64_t sub_10015500C(uint64_t a1)
{
  return swift_getWitnessTable(&protocol conformance descriptor for LazyPaddedSequence<A>, a1);
}

uint64_t sub_100155020(uint64_t a1)
{
  return swift_getWitnessTable(&protocol conformance descriptor for LazyPaddedSequence<A>.Iterator, a1);
}

uint64_t sub_100155030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  LazyPaddedSequence.makeIterator()(a1, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v2, a1);
}

uint64_t sub_100155060(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = j___ss30_copySequenceToContiguousArrayys0dE0Vy7ElementQzGxSTRzlF(v2, a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v2, a1);
  return v4;
}

uint64_t sub_1001550B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)(a1, a2, a4, a3);
}

uint64_t sub_1001550D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_1001550DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t AssociatedTypeWitness;
  unint64_t v6;
  _QWORD v8[2];

  v2 = swift_checkMetadataState(319, *(_QWORD *)(a1 + 16));
  v3 = v2;
  if (v4 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    AssociatedTypeWitness = swift_getAssociatedTypeWitness(319, *(_QWORD *)(a1 + 24), v2, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
    v3 = AssociatedTypeWitness;
    if (v6 <= 0x3F)
    {
      v8[1] = *(_QWORD *)(AssociatedTypeWitness - 8) + 64;
      swift_initStructMetadata(a1, 0, 2, v8, a1 + 32);
      return 0;
    }
  }
  return v3;
}

uint64_t *sub_100155184(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a3 + 24), v5, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v7 + v10;
  v12 = (*(_BYTE *)(v6 + 80) | *(_BYTE *)(v9 + 80));
  if (v12 > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0
    || (v11 & (unint64_t)~v10) + *(_QWORD *)(v9 + 64) > 0x18)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v12 + 16) & ~v12));
    swift_retain(v15);
  }
  else
  {
    v16 = AssociatedTypeWitness;
    v17 = ~v10;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v11) & v17, ((unint64_t)a2 + v11) & v17, v16);
  }
  return a1;
}

uint64_t sub_100155278(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = *(_QWORD *)(v5 + 64) + a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a2 + 24), v4, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))((v6 + *(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80), AssociatedTypeWitness);
}

uint64_t sub_1001552F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, a2, v6);
  v8 = *(_QWORD *)(v7 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a3 + 24), v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))((v8 + *(unsigned __int8 *)(v10 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (v8 + *(unsigned __int8 *)(v10 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_10015538C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6);
  v8 = *(_QWORD *)(v7 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a3 + 24), v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 24))((v8 + *(unsigned __int8 *)(v10 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (v8 + *(unsigned __int8 *)(v10 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_100155424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, a2, v6);
  v8 = *(_QWORD *)(v7 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a3 + 24), v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 32))((v8 + *(unsigned __int8 *)(v10 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (v8 + *(unsigned __int8 *)(v10 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_1001554BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, v6);
  v8 = *(_QWORD *)(v7 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a3 + 24), v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 40))((v8 + *(unsigned __int8 *)(v10 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), (v8 + *(unsigned __int8 *)(v10 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_100155554(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a3 + 24), v5, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v7)
    v11 = v7;
  else
    v11 = *(_DWORD *)(v9 + 84);
  if (!a2)
    return 0;
  v12 = *(unsigned __int8 *)(v9 + 80);
  v13 = *(_QWORD *)(v6 + 64) + v12;
  if (a2 <= v11)
    goto LABEL_23;
  v14 = (v13 & ~v12) + *(_QWORD *)(v9 + 64);
  v15 = 8 * v14;
  if (v14 <= 3)
  {
    v17 = ((a2 - v11 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      v16 = *(_DWORD *)(a1 + v14);
      if (!v16)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      v16 = *(unsigned __int16 *)(a1 + v14);
      if (!*(_WORD *)(a1 + v14))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_23:
      if (v11)
      {
        if (v7 >= v10)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, v7, v5);
        else
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))((v13 + a1) & ~v12, v10, AssociatedTypeWitness);
      }
      return 0;
    }
  }
  v16 = *(unsigned __int8 *)(a1 + v14);
  if (!*(_BYTE *)(a1 + v14))
    goto LABEL_23;
LABEL_14:
  v18 = (v16 - 1) << v15;
  if (v14 > 3)
    v18 = 0;
  if ((_DWORD)v14)
  {
    if (v14 <= 3)
      v19 = v14;
    else
      v19 = 4;
    __asm { BR              X12 }
  }
  return v11 + v18 + 1;
}

void sub_100155700(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  size_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;

  v7 = *(_QWORD *)(a4 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(swift_getAssociatedTypeWitness(0, *(_QWORD *)(a4 + 24), v7, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element)- 8);
  if (*(_DWORD *)(v10 + 84) <= v9)
    v11 = v9;
  else
    v11 = *(_DWORD *)(v10 + 84);
  v12 = ((*(_QWORD *)(v8 + 64) + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
      + *(_QWORD *)(v10 + 64);
  if (a3 <= v11)
  {
    v13 = 0;
  }
  else if (v12 <= 3)
  {
    v15 = ((a3 - v11 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
    if (HIWORD(v15))
    {
      v13 = &dword_100000004;
    }
    else if (v15 >= 0x100)
    {
      v13 = 2;
    }
    else
    {
      v13 = v15 > 1;
    }
  }
  else
  {
    v13 = &_mh_execute_header.magic + 1;
  }
  if (v11 < a2)
  {
    v14 = ~v11 + a2;
    if (v12 < 4)
    {
      if ((_DWORD)v12)
      {
        v16 = v14 & ~(-1 << (8 * v12));
        bzero(a1, v12);
        if ((_DWORD)v12 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if ((_DWORD)v12 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v12);
      *(_DWORD *)a1 = v14;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t type metadata accessor for LazyPaddedSequence(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100156300(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyPaddedSequence);
}

uint64_t sub_10015593C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  _QWORD v7[2];

  v3 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(a1 + 24);
  result = swift_getAssociatedTypeWitness(319, v2, v3, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Iterator);
  if (v5 <= 0x3F)
  {
    v7[0] = *(_QWORD *)(result - 8) + 64;
    result = swift_getAssociatedTypeWitness(319, v2, v3, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
    if (v6 <= 0x3F)
    {
      v7[1] = *(_QWORD *)(result - 8) + 64;
      swift_initStructMetadata(a1, 0, 2, v7, a1 + 32);
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1001559FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(a3 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Iterator);
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  v13 = v9 + v12;
  v14 = (*(_BYTE *)(v8 + 80) | *(_BYTE *)(v11 + 80));
  if (v14 > 7
    || ((*(_DWORD *)(v8 + 80) | *(_DWORD *)(v11 + 80)) & 0x100000) != 0
    || ((v9 + v12) & (unint64_t)~v12) + *(_QWORD *)(v11 + 64) > 0x18)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v14 + 16) & ~v14));
    swift_retain(v17);
  }
  else
  {
    v18 = v10;
    v19 = ~v12;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))(((unint64_t)a1 + v13) & v19, ((unint64_t)a2 + v13) & v19, v18);
  }
  return a1;
}

uint64_t sub_100155B18(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v3, v4, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Iterator);
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, AssociatedTypeWitness);
  v7 = *(_QWORD *)(v6 + 64) + a1;
  v8 = swift_getAssociatedTypeWitness(0, v3, v4, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))((v7 + *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80), v8);
}

uint64_t sub_100155BBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(a3 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Iterator);
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a1, a2, AssociatedTypeWitness);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))((v9 + *(unsigned __int8 *)(v11 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (v9 + *(unsigned __int8 *)(v11 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), v10);
  return a1;
}

uint64_t sub_100155C78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(a3 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Iterator);
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(a1, a2, AssociatedTypeWitness);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 24))((v9 + *(unsigned __int8 *)(v11 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (v9 + *(unsigned __int8 *)(v11 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), v10);
  return a1;
}

uint64_t sub_100155D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(a3 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Iterator);
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(a1, a2, AssociatedTypeWitness);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 32))((v9 + *(unsigned __int8 *)(v11 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (v9 + *(unsigned __int8 *)(v11 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), v10);
  return a1;
}

uint64_t sub_100155DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(a3 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Iterator);
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(a1, a2, AssociatedTypeWitness);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 40))((v9 + *(unsigned __int8 *)(v11 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (v9 + *(unsigned __int8 *)(v11 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), v10);
  return a1;
}

uint64_t sub_100155EAC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;

  v6 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(a3 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Iterator);
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = *(unsigned int *)(v8 + 84);
  v10 = swift_getAssociatedTypeWitness(0, v5, v6, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int *)(v11 + 84);
  if (v12 <= v9)
    v13 = v9;
  else
    v13 = *(_DWORD *)(v11 + 84);
  if (!a2)
    return 0;
  v14 = *(unsigned __int8 *)(v11 + 80);
  v15 = *(_QWORD *)(v8 + 64) + v14;
  if (a2 <= v13)
    goto LABEL_23;
  v16 = (v15 & ~v14) + *(_QWORD *)(v11 + 64);
  v17 = 8 * v16;
  if (v16 <= 3)
  {
    v19 = ((a2 - v13 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v19))
    {
      v18 = *(_DWORD *)(a1 + v16);
      if (!v18)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v19 > 0xFF)
    {
      v18 = *(unsigned __int16 *)(a1 + v16);
      if (!*(_WORD *)(a1 + v16))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v19 < 2)
    {
LABEL_23:
      if (v13)
      {
        if (v9 >= v12)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(a1, v9, AssociatedTypeWitness);
        else
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))((v15 + a1) & ~v14, v12, v10);
      }
      return 0;
    }
  }
  v18 = *(unsigned __int8 *)(a1 + v16);
  if (!*(_BYTE *)(a1 + v16))
    goto LABEL_23;
LABEL_14:
  v20 = (v18 - 1) << v17;
  if (v16 > 3)
    v20 = 0;
  if ((_DWORD)v16)
  {
    if (v16 <= 3)
      v21 = v16;
    else
      v21 = 4;
    __asm { BR              X12 }
  }
  return v13 + v20 + 1;
}

void sub_10015608C(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  size_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;

  v8 = *(_QWORD *)(a4 + 16);
  v7 = *(_QWORD *)(a4 + 24);
  v9 = *(_QWORD *)(swift_getAssociatedTypeWitness(0, v7, v8, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Iterator)- 8);
  v10 = *(_DWORD *)(v9 + 84);
  v11 = *(_QWORD *)(swift_getAssociatedTypeWitness(0, v7, v8, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Element)- 8);
  if (*(_DWORD *)(v11 + 84) <= v10)
    v12 = v10;
  else
    v12 = *(_DWORD *)(v11 + 84);
  v13 = ((*(_QWORD *)(v9 + 64) + *(unsigned __int8 *)(v11 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
      + *(_QWORD *)(v11 + 64);
  if (a3 <= v12)
  {
    v14 = 0;
  }
  else if (v13 <= 3)
  {
    v16 = ((a3 - v12 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
    if (HIWORD(v16))
    {
      v14 = &dword_100000004;
    }
    else if (v16 >= 0x100)
    {
      v14 = 2;
    }
    else
    {
      v14 = v16 > 1;
    }
  }
  else
  {
    v14 = &_mh_execute_header.magic + 1;
  }
  if (v12 < a2)
  {
    v15 = ~v12 + a2;
    if (v13 < 4)
    {
      if ((_DWORD)v13)
      {
        v17 = v15 & ~(-1 << (8 * v13));
        bzero(a1, v13);
        if ((_DWORD)v13 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if ((_DWORD)v13 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v13);
      *(_DWORD *)a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t type metadata accessor for LazyPaddedSequence.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100156300(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyPaddedSequence.Iterator);
}

uint64_t sub_100156300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

void Data.sha256Digest.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = type metadata accessor for SHA256(0);
  __chkstk_darwin(v3);
  v4 = type metadata accessor for SHA256Digest(0);
  __chkstk_darwin(v4);
  v5 = sub_100005F1C(&qword_1001B0C80, (uint64_t (*)(uint64_t))&type metadata accessor for SHA256, (uint64_t)&protocol conformance descriptor for SHA256);
  dispatch thunk of HashFunction.init()(v3, v5);
  __asm { BR              X10 }
}

uint64_t sub_100156430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  *(_QWORD *)(v8 - 128) = v5;
  *(_WORD *)(v8 - 120) = v4;
  *(_BYTE *)(v8 - 118) = BYTE2(v4);
  *(_BYTE *)(v8 - 117) = BYTE3(v4);
  *(_BYTE *)(v8 - 116) = BYTE4(v4);
  *(_BYTE *)(v8 - 115) = BYTE5(v4);
  dispatch thunk of HashFunction.update(bufferPointer:)(v8 - 128, v8 - 128 + BYTE6(v4), v2, v6);
  sub_100005DE0(v5, v4);
  ((void (*)(uint64_t, uint64_t))dispatch thunk of HashFunction.finalize())(v2, v6);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 160) + 8))(v3, v2);
  *(_QWORD *)(v8 - 104) = v0;
  v9 = sub_100005F1C(&qword_1001B0C78, (uint64_t (*)(uint64_t))&type metadata accessor for SHA256Digest, (uint64_t)&protocol conformance descriptor for SHA256Digest);
  *(_QWORD *)(v8 - 96) = v9;
  v10 = sub_1000778C8((_QWORD *)(v8 - 128));
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v7 + 16))(v10, v1, v0);
  sub_100005EF8((_QWORD *)(v8 - 128), *(_QWORD *)(v8 - 104));
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)((_QWORD *)(v8 - 144), sub_10010C830, 0, &type metadata for Data._Representation, v0, v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v0);
  v11 = *(_QWORD *)(v8 - 144);
  sub_100005D3C((_QWORD *)(v8 - 128));
  return v11;
}

void Data.xor(with:)()
{
  __asm { BR              X12 }
}

void sub_1001566EC()
{
  uint64_t v0;

  if (BYTE6(v0))
    __asm { BR              X12 }
}

uint64_t static Data.randomBytes(count:)(size_t a1)
{
  size_t v1;
  _QWORD *v2;
  uint64_t v3;

  if ((a1 & 0x8000000000000000) == 0)
  {
    v1 = a1;
    if (a1)
    {
      v2 = (_QWORD *)static Array._allocateBufferUninitialized(minimumCapacity:)(a1, &type metadata for UInt8);
      v2[2] = v1;
      bzero(v2 + 4, v1);
    }
    else
    {
      v2 = _swiftEmptyArrayStorage;
      v1 = _swiftEmptyArrayStorage[2];
    }
    if (!SecRandomCopyBytes(kSecRandomDefault, v1, v2 + 4))
    {
      v3 = sub_10010DD5C((uint64_t)v2);
      swift_bridgeObjectRelease(v2);
      return v3;
    }
    swift_bridgeObjectRelease(v2);
  }
  return 0;
}

Swift::String __swiftcall String.redactedToken()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _TtC14softposreaderd12RemoteReader *v4;
  _TtC14softposreaderd12RemoteReader *v5;
  uint64_t v6;
  uint64_t v7;
  Class isa;
  _TtC14softposreaderd12RemoteReader *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  Swift::String v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _TtC14softposreaderd12RemoteReader *v25;
  SEL v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  Swift::String v33;
  _TtC14softposreaderd12RemoteReader *object;
  SEL v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  SEL v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  SEL v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  Swift::String result;
  _QWORD v57[4];
  uint64_t v58;
  unint64_t v59;

  v2 = v1;
  v3 = v0;
  v58 = 46;
  v59 = 0xE100000000000000;
  v57[2] = &v58;
  swift_bridgeObjectRetain();
  v4 = (_TtC14softposreaderd12RemoteReader *)sub_10007CE10(0x7FFFFFFFFFFFFFFFLL, 1, sub_10007EA50, (uint64_t)v57, v3, v2);
  v5 = v4;
  if (*(_QWORD *)&v4->instance[8] == 3)
  {
    v6 = *(_QWORD *)&v4->instance[24];
    v7 = *(_QWORD *)&v4->instance[32];
    isa = v4[1].super.isa;
    v9 = *(_TtC14softposreaderd12RemoteReader **)v4[1].instance;
    swift_bridgeObjectRetain();
    v10 = static String._fromSubstring(_:)(v6, v7, isa, v9);
    v12 = v11;
    swift_bridgeObjectRelease(v9, v11, v13, v14, v15, v16, v17, v18);
    v58 = v10;
    v59 = (unint64_t)v12;
    v19._countAndFlagsBits = 46;
    v19._object = (void *)0xE100000000000000;
    String.append(_:)(v19);
    if (*(_QWORD *)&v5->instance[8] < 2uLL)
    {
      __break(1u);
      goto LABEL_7;
    }
    v22 = *(_QWORD *)&v5[1].instance[8];
    v23 = *(_QWORD *)&v5[1].instance[16];
    v24 = *(_QWORD *)&v5[1].instance[24];
    v25 = *(_TtC14softposreaderd12RemoteReader **)&v5[1].instance[32];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease(v5, v26, v27, v28, v29, v30, v31, v32);
    v33._countAndFlagsBits = static String._fromSubstring(_:)(v22, v23, v24, v25);
    object = (_TtC14softposreaderd12RemoteReader *)v33._object;
    String.append(_:)(v33);
    swift_bridgeObjectRelease(v25, v35, v36, v37, v38, v39, v40, v41);
    swift_bridgeObjectRelease(object, v42, v43, v44, v45, v46, v47, v48);
    v3 = v58;
    v2 = v59;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease(v5, v49, v50, v51, v52, v53, v54, v55);
  }
  v20 = v3;
  v21 = (void *)v2;
LABEL_7:
  result._object = v21;
  result._countAndFlagsBits = v20;
  return result;
}

void OID.derRepresentation.getter(_TtC14softposreaderd12RemoteReader *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v10;
  _TtC14softposreaderd12RemoteReader *v11;
  uint64_t v12;
  const char *v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SEL v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  const char *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  _TtC14softposreaderd12RemoteReader *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  SEL v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _TtC14softposreaderd12RemoteReader *v54;

  v2 = sub_100003A2C(&qword_1001AC678);
  v3 = swift_allocObject(v2, 33, 7);
  *(_OWORD *)(v3 + 16) = xmmword_10015A5F0;
  v4 = *(_QWORD *)&a1->instance[8];
  if (!v4)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v6 = &a1->instance[24];
  v5 = *(_QWORD *)&a1->instance[24];
  if (!is_mul_ok(v5, 0x28uLL))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v4 < 2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = 40 * v5;
  v8 = *(_QWORD *)&a1->instance[32];
  v9 = __CFADD__(v7, v8);
  v10 = v7 + v8;
  if (v9)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v10 > 0xFF)
  {
LABEL_25:
    __break(1u);
    return;
  }
  v11 = (_TtC14softposreaderd12RemoteReader *)v3;
  *(_BYTE *)(v3 + 32) = v10;
  v12 = sub_10010DD5C(v3);
  v14 = (unint64_t)v13;
  swift_bridgeObjectRelease(v11, v13, v15, v16, v17, v18, v19, v20);
  if (v4 >= 3)
  {
    v21 = 2;
    v54 = a1;
    swift_bridgeObjectRetain_n(a1, 2);
    sub_100005D9C(v12, v14);
    while (v21 < v4)
    {
      v36 = *(_QWORD *)&v6[8 * v21];
      v41 = sub_10009137C(0, 1, 1, (uint64_t)&_swiftEmptyArrayStorage, (uint64_t)v22, v23, v24, v25);
      v43 = *(_QWORD *)&v41->instance[8];
      v42 = *(_QWORD *)&v41->instance[16];
      if (v43 >= v42 >> 1)
        v41 = sub_10009137C((_TtC14softposreaderd12RemoteReader *)(v42 > 1), v43 + 1, 1, (uint64_t)v41, v37, v38, v39, v40);
      *(_QWORD *)&v41->instance[8] = v43 + 1;
      v41->instance[v43 + 24] = v36 & 0x7F;
      if (v36 >= 0x80)
      {
        v44 = v43 + 33;
        do
        {
          v45 = *(_QWORD *)&v41->instance[16];
          if (v44 - 32 >= v45 >> 1)
            v41 = sub_10009137C((_TtC14softposreaderd12RemoteReader *)(v45 > 1), v44 - 31, 1, (uint64_t)v41, v37, v38, v39, v40);
          v46 = v36 >> 14;
          v36 >>= 7;
          *(_QWORD *)&v41->instance[8] = v44 - 31;
          *((_BYTE *)&v41->super.isa + v44++) = v36 | 0x80;
        }
        while (v46);
      }
      ++v21;
      sub_100146C84((uint64_t)v41);
      swift_bridgeObjectRelease(v41, v26, v27, v28, v29, v30, v31, v32);
      if (v21 == v4)
      {
        swift_bridgeObjectRelease(v54, v33, v34, v35, v22, v23, v24, v25);
        sub_100005DE0(v12, v14);
        swift_bridgeObjectRelease(v54, v47, v48, v49, v50, v51, v52, v53);
        return;
      }
    }
    __break(1u);
    goto LABEL_21;
  }
}

_TtC14softposreaderd12RemoteReader *OID.init(dotRepresentation:)(uint64_t a1, _TtC14softposreaderd12RemoteReader *a2)
{
  uint64_t v4;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t *v27;
  _TtC14softposreaderd12RemoteReader *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  SEL v37;
  char v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v54[4];
  char v55;
  uint64_t v56;
  uint64_t v57;

  v56 = 46;
  v57 = 0xE100000000000000;
  v54[2] = &v56;
  swift_bridgeObjectRetain();
  v4 = sub_10007CE10(0x7FFFFFFFFFFFFFFFLL, 0, sub_1000D0F5C, (uint64_t)v54, a1, (unint64_t)a2);
  swift_bridgeObjectRelease(a2, v5, v6, v7, v8, v9, v10, v11);
  v19 = *(_QWORD *)(v4 + 16);
  if (v19)
  {
    swift_bridgeObjectRetain();
    v27 = (unint64_t *)(v4 + 56);
    v28 = &_swiftEmptyArrayStorage;
    while (1)
    {
      v30 = *(v27 - 3);
      v29 = *(v27 - 2);
      if ((v29 ^ v30) >= 0x4000)
      {
        v32 = *(v27 - 1);
        v31 = *v27;
        if ((*v27 & 0x1000000000000000) != 0)
        {
          swift_bridgeObjectRetain();
          v34 = (uint64_t)sub_100157488(v30, v29, v32, v31, 10);
          v38 = (char)v37;
          swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v31, v37, v39, v40, v41, v42, v43, v44);
          if ((v38 & 1) == 0)
            goto LABEL_12;
        }
        else
        {
          if ((v31 & 0x2000000000000000) != 0)
          {
            v56 = *(v27 - 1);
            v57 = v31 & 0xFFFFFFFFFFFFFFLL;
            v33 = &v56;
          }
          else if ((v32 & 0x1000000000000000) != 0)
          {
            v33 = (uint64_t *)((v31 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else
          {
            v33 = (uint64_t *)_StringObject.sharedUTF8.getter(*(v27 - 1), *v27);
          }
          v34 = sub_100157A00((uint64_t)v33, v30, v29, v32, v31, 10);
          v55 = v20 & 1;
          if ((v20 & 1) == 0)
          {
LABEL_12:
            if ((swift_isUniquelyReferenced_nonNull_native(v28) & 1) == 0)
              v28 = sub_100148E20(0, *(_QWORD *)&v28->instance[8] + 1, (void *)1, (uint64_t)v28, (uint64_t)v23, v24, v25, v26);
            v36 = *(_QWORD *)&v28->instance[8];
            v35 = *(_QWORD *)&v28->instance[16];
            if (v36 >= v35 >> 1)
              v28 = sub_100148E20((_TtC14softposreaderd12RemoteReader *)(v35 > 1), v36 + 1, (void *)1, (uint64_t)v28, (uint64_t)v23, v24, v25, v26);
            *(_QWORD *)&v28->instance[8] = v36 + 1;
            *(_QWORD *)&v28->instance[8 * v36 + 24] = v34;
          }
        }
      }
      v27 += 4;
      if (!--v19)
      {
        swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v4, v20, v21, v22, v23, v24, v25, v26);
        v45 = *(_QWORD *)(v4 + 16);
        goto LABEL_21;
      }
    }
  }
  v45 = 0;
  v28 = &_swiftEmptyArrayStorage;
LABEL_21:
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v4, v12, v13, v14, v15, v16, v17, v18);
  if (v45 != *(_QWORD *)&v28->instance[8])
  {
    swift_bridgeObjectRelease(v28, v46, v47, v48, v49, v50, v51, v52);
    return 0;
  }
  return v28;
}

void sub_1001571DC()
{
  static OID.commonName = (uint64_t)&off_1001A1448;
}

uint64_t *OID.commonName.unsafeMutableAddressor()
{
  if (qword_1001B45F8 != -1)
    swift_once(&qword_1001B45F8, sub_1001571DC);
  return &static OID.commonName;
}

uint64_t static OID.commonName.getter()
{
  return sub_10014816C(&qword_1001B45F8, &static OID.commonName);
}

void sub_10015724C()
{
  static OID.sha256WithEcdsa = (uint64_t)&off_1001A1488;
}

uint64_t *OID.sha256WithEcdsa.unsafeMutableAddressor()
{
  if (qword_1001B4600 != -1)
    swift_once(&qword_1001B4600, sub_10015724C);
  return &static OID.sha256WithEcdsa;
}

uint64_t static OID.sha256WithEcdsa.getter()
{
  return sub_10014816C(&qword_1001B4600, &static OID.sha256WithEcdsa);
}

uint64_t OID.dotRepresentation.getter(uint64_t a1)
{
  int64_t v1;
  uint64_t v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  SEL v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_100091C44(0, v1, 0);
    v3 = 0;
    do
    {
      v11 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt, &protocol witness table for UInt);
      v12 = v4;
      v14 = *(_QWORD *)&_swiftEmptyArrayStorage.instance[8];
      v13 = *(_QWORD *)&_swiftEmptyArrayStorage.instance[16];
      if (v14 >= v13 >> 1)
        sub_100091C44(v13 > 1, v14 + 1, 1);
      ++v3;
      *(_QWORD *)&_swiftEmptyArrayStorage.instance[8] = v14 + 1;
      v15 = (char *)&_swiftEmptyArrayStorage + 16 * v14;
      *((_QWORD *)v15 + 4) = v11;
      *((_QWORD *)v15 + 5) = v12;
    }
    while (v1 != v3);
    swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)a1, v4, v5, v6, v7, v8, v9, v10);
  }
  v16 = sub_100003A2C((uint64_t *)&unk_1001AE460);
  v17 = sub_1000248C8();
  v18 = BidirectionalCollection<>.joined(separator:)(46, 0xE100000000000000, v16, v17);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage, v19, v20, v21, v22, v23, v24, v25);
  return v18;
}

BOOL sub_100157408(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v12;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (a1[4] != a2[4])
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = a1 + 5;
  v6 = a2 + 5;
  do
  {
    v8 = *v5++;
    v7 = v8;
    v10 = *v6++;
    v9 = v10;
    v12 = v4-- != 0;
    result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

BOOL sub_10015747C(_QWORD **a1, _QWORD **a2)
{
  return sub_100157408(*a1, *a2);
}

unsigned __int8 *sub_100157488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v12;
  const char *v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  unsigned __int8 *v21;
  SEL v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v30 = a1;
  v31 = a2;
  v32 = a3;
  v33 = a4;
  v6 = sub_10007EAA4();
  swift_bridgeObjectRetain();
  v7 = String.init<A>(_:)(&v30, &type metadata for Substring, &protocol witness table for Substring, v6);
  v9 = v7;
  v10 = v8;
  if ((v8 & 0x1000000000000000) == 0)
  {
    if ((v8 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v12 = HIBYTE(v10) & 0xF;
    v30 = v9;
    v31 = v10 & 0xFFFFFFFFFFFFFFLL;
    v11 = (unsigned __int8 *)&v30;
    goto LABEL_7;
  }
  v9 = sub_10007DDE4(v7, v8);
  v14 = (unint64_t)v13;
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v10, v13, v15, v16, v17, v18, v19, v20);
  v10 = v14;
  if ((v14 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v9 & 0x1000000000000000) != 0)
  {
    v11 = (unsigned __int8 *)((v10 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v12 = v9 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v11 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v9, v10);
  }
LABEL_7:
  v21 = sub_100157578(v11, v12, a5);
  swift_bridgeObjectRelease((_TtC14softposreaderd12RemoteReader *)v10, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

unsigned __int8 *sub_100157578(unsigned __int8 *result, uint64_t a2, int64_t a3)
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
  uint64_t v13;
  unint64_t v14;
  unsigned __int8 v15;
  BOOL v16;
  uint64_t v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 *v21;
  unsigned int v22;
  char v23;
  unint64_t v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unint64_t v29;
  unsigned int v30;
  char v31;
  unint64_t v32;
  unsigned __int8 v33;

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
                  v13 = 0;
                  if (v11 < 0x61 || v11 >= v8)
                    return (unsigned __int8 *)v13;
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
              v14 = v9 * a3;
              v15 = v11 + v12;
              v16 = v14 >= v15;
              v9 = v14 - v15;
              if (!v16)
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
      goto LABEL_67;
    }
    if (a2)
    {
      v26 = a3 + 48;
      v27 = a3 + 55;
      v28 = a3 + 87;
      if (a3 > 10)
      {
        v26 = 58;
      }
      else
      {
        v28 = 97;
        v27 = 65;
      }
      if (result)
      {
        v29 = 0;
        do
        {
          v30 = *result;
          if (v30 < 0x30 || v30 >= v26)
          {
            if (v30 < 0x41 || v30 >= v27)
            {
              v13 = 0;
              if (v30 < 0x61 || v30 >= v28)
                return (unsigned __int8 *)v13;
              v31 = -87;
            }
            else
            {
              v31 = -55;
            }
          }
          else
          {
            v31 = -48;
          }
          if (!is_mul_ok(v29, a3))
            return 0;
          v32 = v29 * a3;
          v33 = v30 + v31;
          v16 = __CFADD__(v32, v33);
          v29 = v32 + v33;
          if (v16)
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v29;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_67:
    __break(1u);
    return result;
  }
  v17 = a2 - 1;
  if (a2 == 1)
    return 0;
  v18 = a3 + 48;
  v19 = a3 + 55;
  v20 = a3 + 87;
  if (a3 > 10)
  {
    v18 = 58;
  }
  else
  {
    v20 = 97;
    v19 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v21 = result + 1;
  do
  {
    v22 = *v21;
    if (v22 < 0x30 || v22 >= v18)
    {
      if (v22 < 0x41 || v22 >= v19)
      {
        v13 = 0;
        if (v22 < 0x61 || v22 >= v20)
          return (unsigned __int8 *)v13;
        v23 = -87;
      }
      else
      {
        v23 = -55;
      }
    }
    else
    {
      v23 = -48;
    }
    if (!is_mul_ok(v9, a3))
      return 0;
    v24 = v9 * a3;
    v25 = v22 + v23;
    v16 = __CFADD__(v24, v25);
    v9 = v24 + v25;
    if (v16)
      return 0;
    ++v21;
    --v17;
  }
  while (v17);
  return (unsigned __int8 *)v9;
}

uint64_t _s7SPRBase3OIDV17derRepresentationACSg10Foundation4DataV_tcfC_0(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  __int16 v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v4 = type metadata accessor for Data.Iterator(0);
  __chkstk_darwin(v4);
  sub_100005D9C(a1, a2);
  sub_1000BECB0(a1, a2);
  v6 = v5;
  sub_100005DE0(a1, a2);
  if ((v6 & 0x100) == 0)
  {
    v7 = sub_100003A2C(&qword_1001B46F0);
    v8 = swift_allocObject(v7, 48, 7);
    *(_OWORD *)(v8 + 16) = xmmword_10015A6C0;
    *(_QWORD *)(v8 + 32) = v6 / 0x28u;
    *(_QWORD *)(v8 + 40) = v6 % 0x28u;
    sub_100005D9C(a1, a2);
    sub_100151CF4(1, a1, a2);
    __asm { BR              X10 }
  }
  sub_100005DE0(a1, a2);
  return 0;
}

uint64_t sub_100157A00(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, int64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unint64_t v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  unsigned __int8 v31;
  BOOL v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 *v36;
  uint64_t v37;
  unsigned int v38;
  char v39;
  unint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned int v45;
  char v46;
  unint64_t v47;
  unsigned __int8 v48;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_10007DA00(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_96;
  result = String.UTF8View._foreignDistance(from:to:)(15, a2, a4, a5);
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_10007DA00(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_10007DA00(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_92;
  if (v17 < a3 >> 16)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  result = String.UTF8View._foreignDistance(from:to:)(v10, a3, a4, a5);
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_91;
  }
  if (v18 < v15)
  {
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v33 = a6 + 48;
        v34 = a6 + 55;
        v35 = a6 + 87;
        if (a6 > 10)
        {
          v33 = 58;
        }
        else
        {
          v35 = 97;
          v34 = 65;
        }
        if (v19)
        {
          v24 = 0;
          v36 = v19 + 1;
          v37 = result - 1;
          do
          {
            v38 = *v36;
            if (v38 < 0x30 || v38 >= v33)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                v29 = 0;
                if (v38 < 0x61 || v38 >= v35)
                  return v29;
                v39 = -87;
              }
              else
              {
                v39 = -55;
              }
            }
            else
            {
              v39 = -48;
            }
            if (!is_mul_ok(v24, a6))
              return 0;
            v40 = v24 * a6;
            v41 = v38 + v39;
            v32 = __CFADD__(v40, v41);
            v24 = v40 + v41;
            if (v32)
              return 0;
            ++v36;
            --v37;
          }
          while (v37);
          return v24;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_95;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v42 = a6 + 48;
      v43 = a6 + 55;
      v44 = a6 + 87;
      if (a6 > 10)
      {
        v42 = 58;
      }
      else
      {
        v44 = 97;
        v43 = 65;
      }
      if (v19)
      {
        v24 = 0;
        while (1)
        {
          v45 = *v19;
          if (v45 < 0x30 || v45 >= v42)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              v29 = 0;
              if (v45 < 0x61 || v45 >= v44)
                return v29;
              v46 = -87;
            }
            else
            {
              v46 = -55;
            }
          }
          else
          {
            v46 = -48;
          }
          if (!is_mul_ok(v24, a6))
            return 0;
          v47 = v24 * a6;
          v48 = v45 + v46;
          v32 = __CFADD__(v47, v48);
          v24 = v47 + v48;
          if (v32)
            return 0;
          ++v19;
          if (!--result)
            return v24;
        }
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 48;
      v22 = a6 + 55;
      v23 = a6 + 87;
      if (a6 > 10)
      {
        v21 = 58;
      }
      else
      {
        v23 = 97;
        v22 = 65;
      }
      if (v19)
      {
        v24 = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v21)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              if (v27 < 0x61 || v27 >= v23)
                return v29;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          if (!is_mul_ok(v24, a6))
            return 0;
          v30 = v24 * a6;
          v31 = v27 + v28;
          v32 = v30 >= v31;
          v24 = v30 - v31;
          if (!v32)
            return 0;
          ++v25;
          if (!--v26)
            return v24;
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for OID()
{
  return &type metadata for OID;
}
