id AccessCheckerHasBundleSubscription(_:to:lineNumber:)(void *a1, uint64_t a2, void *a3, int a4)
{
  id v4;
  char *v7;
  void *v8;
  unint64_t v9;
  id v10;
  unsigned int v11;
  id v12;
  id v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[24];
  uint64_t v20;

  v4 = a3;
  if (a3)
  {
    v7 = (char *)objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
    swift_unknownObjectRelease();
    if (objc_getAssociatedObject(v7, v7 + 1))
    {
      sub_247AAF04C();
      swift_unknownObjectRelease();
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
    }
    sub_247A938C4((uint64_t)&v17, (uint64_t)v19);
    if (v20)
    {
      sub_247A9399C();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v8 = v16;
        v9 = (unint64_t)objc_msgSend(v16, sel_integerValue);
        if (v9 == -1)
          goto LABEL_19;
        goto LABEL_11;
      }
    }
    else
    {
      sub_247A93960((uint64_t)v19);
    }
    v8 = 0;
    v9 = 0;
LABEL_11:
    if (objc_getAssociatedObject(v7, (const void *)~v9))
    {
      sub_247AAF04C();
      swift_unknownObjectRelease();
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
    }
    sub_247A938C4((uint64_t)&v17, (uint64_t)v19);
    if (v20)
    {
      sub_247A9399C();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v10 = v16;
        v11 = objc_msgSend(v10, sel_integerValue);

        if ((((v11 - a4) ^ ((_DWORD)v9 + a4)) & 1) == 0)
          return 0;
        goto LABEL_17;
      }
    }
    else
    {
      sub_247A93960((uint64_t)v19);
    }
LABEL_19:

    if (((((_DWORD)v9 + a4) ^ a4) & 1) == 0)
      return 0;
LABEL_17:
    v12 = objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
    swift_unknownObjectRelease();
    v13 = objc_msgSend(v12, sel_bundleChannelIDs);

    v14 = (void *)sub_247AAEEE4();
    v4 = objc_msgSend(v13, sel_containsObject_, v14);

  }
  return v4;
}

uint64_t sub_247A938C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_247A93908();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_247A93908()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254454408)
  {
    v0 = sub_247AAF040();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254454408);
  }
}

uint64_t sub_247A93960(uint64_t a1)
{
  uint64_t v2;

  sub_247A93908();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_247A9399C()
{
  unint64_t result;

  result = qword_254454320;
  if (!qword_254454320)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254454320);
  }
  return result;
}

BOOL AccessCheckerHasAccess(_:toItemPaid:isBundlePaid:channelID:lineNumber:)(id a1, char a2, char a3, uint64_t a4, uint64_t a5, int a6)
{
  id v11;
  id v12;
  uint64_t v13;
  char *v14;
  void *v15;
  unint64_t v16;
  id v17;
  unsigned int v18;
  id v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  id v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[24];
  uint64_t v28;

  if ((a2 & 1) != 0)
  {
    v11 = objc_msgSend(a1, sel_purchaseProvider);
    if (!a5)
    {
      swift_unknownObjectRelease();
      return 0;
    }
    v12 = objc_msgSend(v11, sel_purchasedTagIDs);
    v13 = sub_247AAEFC8();

    LOBYTE(v12) = sub_247A94888(a4, a5, v13);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
      if ((a3 & 1) == 0)
        return 0;
      goto LABEL_8;
    }
    return 1;
  }
  if ((a3 & 1) == 0)
    return 1;
  if (!a5)
    return 0;
LABEL_8:
  v14 = (char *)objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
  swift_unknownObjectRelease();
  if (objc_getAssociatedObject(v14, v14 + 1))
  {
    sub_247AAF04C();
    swift_unknownObjectRelease();
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  sub_247A938C4((uint64_t)&v25, (uint64_t)v27);
  if (!v28)
  {
    sub_247A93960((uint64_t)v27);
    goto LABEL_17;
  }
  sub_247A9399C();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_17:
    v15 = 0;
    v16 = 0;
    goto LABEL_18;
  }
  v15 = v24;
  v16 = (unint64_t)objc_msgSend(v24, sel_integerValue);
  if (v16 == -1)
  {
LABEL_26:

    if (((((_DWORD)v16 + a6) ^ a6) & 1) == 0)
      return 0;
    goto LABEL_27;
  }
LABEL_18:
  if (objc_getAssociatedObject(v14, (const void *)~v16))
  {
    sub_247AAF04C();
    swift_unknownObjectRelease();
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  sub_247A938C4((uint64_t)&v25, (uint64_t)v27);
  if (!v28)
  {
    sub_247A93960((uint64_t)v27);
    goto LABEL_26;
  }
  sub_247A9399C();
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_26;
  v17 = v24;
  v18 = objc_msgSend(v17, sel_integerValue);

  if ((((v18 - a6) ^ ((_DWORD)v16 + a6)) & 1) == 0)
    return 0;
LABEL_27:
  v19 = objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
  swift_unknownObjectRelease();
  v20 = objc_msgSend(v19, sel_bundleChannelIDs);

  v21 = (void *)sub_247AAEEE4();
  v22 = objc_msgSend(v20, sel_containsObject_, v21);

  return (v22 & 1) != 0;
}

BOOL AccessCheckerHasAccess(_:to:lineNumber:)(void *a1, id a2, int a3)
{
  unsigned __int8 v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  char *v17;
  void *v18;
  unint64_t v19;
  id v20;
  unsigned int v21;
  id v22;
  id v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[24];
  uint64_t v30;

  v6 = objc_msgSend(a2, sel_isPaid);
  if ((objc_msgSend(a2, sel_respondsToSelector_, sel_isBundlePaid) & 1) != 0)
    v7 = objc_msgSend(a2, sel_isBundlePaid);
  else
    v7 = 0;
  v8 = objc_msgSend(a2, sel_sourceChannel);
  v9 = (uint64_t)v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, sel_identifier);
    swift_unknownObjectRelease();
    v11 = sub_247AAEEF0();
    v9 = v12;

    if ((v6 & 1) != 0)
      goto LABEL_6;
LABEL_11:
    if ((v7 & 1) != 0)
      goto LABEL_15;
    goto LABEL_12;
  }
  v11 = 0;
  if ((v6 & 1) == 0)
    goto LABEL_11;
LABEL_6:
  v13 = objc_msgSend(a1, sel_purchaseProvider);
  if (v9)
  {
    v14 = objc_msgSend(v13, sel_purchasedTagIDs);
    v15 = sub_247AAEFC8();

    LOBYTE(v14) = sub_247A94888(v11, v9, v15);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      if (!v7)
        goto LABEL_35;
      goto LABEL_15;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 1;
  }
  swift_unknownObjectRelease();
  if (!v7)
    goto LABEL_35;
LABEL_15:
  if (v9)
  {
    v17 = (char *)objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
    swift_unknownObjectRelease();
    if (objc_getAssociatedObject(v17, v17 + 1))
    {
      sub_247AAF04C();
      swift_unknownObjectRelease();
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
    }
    sub_247A938C4((uint64_t)&v27, (uint64_t)v29);
    if (v30)
    {
      sub_247A9399C();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v18 = v26;
        v19 = (unint64_t)objc_msgSend(v26, sel_integerValue);
        if (v19 == -1)
        {
LABEL_34:

          if (((((_DWORD)v19 + a3) ^ a3) & 1) == 0)
            goto LABEL_35;
          goto LABEL_31;
        }
        goto LABEL_25;
      }
    }
    else
    {
      sub_247A93960((uint64_t)v29);
    }
    v18 = 0;
    v19 = 0;
LABEL_25:
    if (objc_getAssociatedObject(v17, (const void *)~v19))
    {
      sub_247AAF04C();
      swift_unknownObjectRelease();
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
    }
    sub_247A938C4((uint64_t)&v27, (uint64_t)v29);
    if (!v30)
    {
      sub_247A93960((uint64_t)v29);
      goto LABEL_34;
    }
    sub_247A9399C();
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_34;
    v20 = v26;
    v21 = objc_msgSend(v20, sel_integerValue);

    if ((((v21 - a3) ^ ((_DWORD)v19 + a3)) & 1) != 0)
    {
LABEL_31:
      v22 = objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
      swift_unknownObjectRelease();
      v23 = objc_msgSend(v22, sel_bundleChannelIDs);

      v24 = (void *)sub_247AAEEE4();
      v25 = objc_msgSend(v23, sel_containsObject_, v24);
      swift_bridgeObjectRelease();

      return (v25 & 1) != 0;
    }
LABEL_35:
    swift_bridgeObjectRelease();
  }
  return 0;
}

{
  unsigned __int8 v6;
  unsigned __int8 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char *v14;
  void *v16;
  unint64_t v17;
  id v18;
  unsigned int v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[24];
  uint64_t v27;

  v6 = objc_msgSend(a2, sel_isPaid);
  v7 = objc_msgSend(a2, sel_isBundlePaid);
  v8 = objc_msgSend(objc_msgSend(a2, sel_sourceChannel), sel_identifier);
  swift_unknownObjectRelease();
  v9 = sub_247AAEEF0();
  v11 = v10;

  if ((v6 & 1) == 0)
  {
    if ((v7 & 1) != 0)
      goto LABEL_6;
LABEL_8:
    swift_bridgeObjectRelease();
    return 1;
  }
  v12 = objc_msgSend(objc_msgSend(a1, sel_purchaseProvider), sel_purchasedTagIDs);
  v13 = sub_247AAEFC8();

  LOBYTE(v12) = sub_247A94888(v9, v11, v13);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
    goto LABEL_8;
  if ((v7 & 1) == 0)
    goto LABEL_27;
LABEL_6:
  v14 = (char *)objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
  swift_unknownObjectRelease();
  if (objc_getAssociatedObject(v14, v14 + 1))
  {
    sub_247AAF04C();
    swift_unknownObjectRelease();
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  sub_247A938C4((uint64_t)&v24, (uint64_t)v26);
  if (!v27)
  {
    sub_247A93960((uint64_t)v26);
    goto LABEL_16;
  }
  sub_247A9399C();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_16:
    v16 = 0;
    v17 = 0;
    goto LABEL_17;
  }
  v16 = v23;
  v17 = (unint64_t)objc_msgSend(v23, sel_integerValue);
  if (v17 == -1)
  {
LABEL_26:

    if (((((_DWORD)v17 + a3) ^ a3) & 1) == 0)
      goto LABEL_27;
    goto LABEL_23;
  }
LABEL_17:
  if (objc_getAssociatedObject(v14, (const void *)~v17))
  {
    sub_247AAF04C();
    swift_unknownObjectRelease();
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  sub_247A938C4((uint64_t)&v24, (uint64_t)v26);
  if (!v27)
  {
    sub_247A93960((uint64_t)v26);
    goto LABEL_26;
  }
  sub_247A9399C();
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_26;
  v18 = v23;
  v19 = objc_msgSend(v18, sel_integerValue);

  if ((((v19 - a3) ^ ((_DWORD)v17 + a3)) & 1) != 0)
  {
LABEL_23:
    v20 = objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
    swift_unknownObjectRelease();
    v21 = objc_msgSend(v20, sel_bundleChannelIDs);

    v22 = (void *)sub_247AAEEE4();
    LOBYTE(v20) = objc_msgSend(v21, sel_containsObject_, v22);
    swift_bridgeObjectRelease();

    return (v20 & 1) != 0;
  }
LABEL_27:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t AccessCheckerHasAccess(_:with:lineNumber:)(void *a1, void *a2, int a3)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  char *v15;
  void *v16;
  unint64_t v17;
  id v18;
  unsigned int v19;
  id v20;
  id v21;
  id v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[24];
  uint64_t v27;

  v6 = objc_msgSend(a1, sel_purchaseProvider);
  if (objc_msgSend((id)swift_unknownObjectRetain(), sel_tagType) == (id)3)
  {
    v7 = objc_msgSend(a2, sel_asSection);
    if (!v7
      || (v8 = objc_msgSend(v7, sel_parentID), swift_unknownObjectRelease(), !v8))
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      goto LABEL_8;
    }
  }
  else
  {
    v8 = objc_msgSend(a2, sel_identifier);
  }
  v9 = sub_247AAEEF0();
  v11 = v10;

  v12 = objc_msgSend(v6, sel_purchasedTagIDs);
  v13 = sub_247AAEFC8();

  LOBYTE(v12) = sub_247A94888(v9, v11, v13);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
    return 1;
LABEL_8:
  v15 = (char *)objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
  swift_unknownObjectRelease();
  if (objc_getAssociatedObject(v15, v15 + 1))
  {
    sub_247AAF04C();
    swift_unknownObjectRelease();
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  sub_247A938C4((uint64_t)&v24, (uint64_t)v26);
  if (v27)
  {
    sub_247A9399C();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v16 = v23;
      v17 = (unint64_t)objc_msgSend(v23, sel_integerValue);
      if (v17 == -1)
        goto LABEL_27;
      goto LABEL_17;
    }
  }
  else
  {
    sub_247A93960((uint64_t)v26);
  }
  v16 = 0;
  v17 = 0;
LABEL_17:
  if (objc_getAssociatedObject(v15, (const void *)~v17))
  {
    sub_247AAF04C();
    swift_unknownObjectRelease();
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  sub_247A938C4((uint64_t)&v24, (uint64_t)v26);
  if (v27)
  {
    sub_247A9399C();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v18 = v23;
      v19 = objc_msgSend(v18, sel_integerValue);

      if ((((v19 - a3) ^ ((_DWORD)v17 + a3)) & 1) == 0)
        return 0;
      goto LABEL_23;
    }
  }
  else
  {
    sub_247A93960((uint64_t)v26);
  }
LABEL_27:

  if (((((_DWORD)v17 + a3) ^ a3) & 1) == 0)
    return 0;
LABEL_23:
  v20 = objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
  swift_unknownObjectRelease();
  v21 = objc_msgSend(a2, sel_identifier);
  if (!v21)
  {
    sub_247AAEEF0();
    v21 = (id)sub_247AAEEE4();
    swift_bridgeObjectRelease();
  }
  v14 = objc_msgSend(v20, sel_containsTagID_, v21);

  return (uint64_t)v14;
}

uint64_t sub_247A94888(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_247AAF1A8();
    sub_247AAEF2C();
    v6 = sub_247AAF1C0();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_247AAF160() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_247AAF160() & 1) != 0)
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

uint64_t Assembly.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = swift_allocObject();
  sub_247A94AC0();
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_247AAF690;
  v2 = type metadata accessor for StocksTabiAssembly();
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 56) = v2;
  *(_QWORD *)(v1 + 64) = sub_247A94B68();
  *(_QWORD *)(v1 + 32) = v3;
  *(_QWORD *)(v0 + 16) = v1;
  return v0;
}

uint64_t Assembly.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_247A94AC0();
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_247AAF690;
  v2 = type metadata accessor for StocksTabiAssembly();
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 56) = v2;
  *(_QWORD *)(v1 + 64) = sub_247A94B68();
  *(_QWORD *)(v1 + 32) = v3;
  *(_QWORD *)(v0 + 16) = v1;
  return v0;
}

void sub_247A94AC0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2544543A0)
  {
    sub_247A94B14();
    v0 = sub_247AAF148();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2544543A0);
  }
}

unint64_t sub_247A94B14()
{
  unint64_t result;

  result = qword_2544538B8[0];
  if (!qword_2544538B8[0])
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_2544538B8);
  }
  return result;
}

unint64_t sub_247A94B68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544540C0;
  if (!qword_2544540C0)
  {
    v1 = type metadata accessor for StocksTabiAssembly();
    result = MEMORY[0x24958A948](&unk_247AB0444, v1);
    atomic_store(result, (unint64_t *)&qword_2544540C0);
  }
  return result;
}

uint64_t Assembly.assemblies.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Assembly.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Assembly.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_247A94BF8()
{
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for Assembly()
{
  return objc_opt_self();
}

uint64_t method lookup function for Assembly()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Assembly.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t StocksTabiUserEventHistoryScoringService.score<A>(items:identifiedBy:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34[2];
  __int128 v35[2];
  uint64_t v36;

  v3 = v2;
  v28 = a2;
  v5 = sub_247AAECD4();
  v31 = *(_QWORD *)(v5 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v30 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_247AAE6F8();
  v32 = *(_QWORD *)(v7 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v29 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - v10;
  v12 = (int *)type metadata accessor for StocksTabiArticleScoringWork();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v35[0] = a1;
  v15 = sub_247AAEFBC();
  MEMORY[0x24958A948](MEMORY[0x24BEE12E0], v15);
  if ((sub_247AAEFD4() & 1) != 0)
    return sub_247A95218(MEMORY[0x24BEE4AF8]);
  v17 = *(_QWORD *)(v2 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_workService);
  v26 = v5;
  v27 = v17;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
  v18(v11, v28, v7);
  v19 = *(_BYTE *)(v2 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_isSubscribed);
  sub_247A95910(0, &qword_2544540F0);
  v20 = sub_247AAF094();
  sub_247A954CC(v3 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_articleFeaturesFactory, (uint64_t)v35);
  sub_247A954CC(v3 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_userEmbeddingProvider, (uint64_t)v34);
  v21 = *(_QWORD *)(v3
                  + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_paidAccessChecker);
  v18(v14, (uint64_t)v11, v7);
  v14[v12[5]] = v19;
  v33 = v20;
  sub_247A958B0(0, &qword_2544542A8, &qword_2544540F0, (uint64_t)&protocol descriptor for StocksTabiArticleDataType, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_247A957AC();
  swift_unknownObjectRetain();
  v22 = sub_247AAEF98();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v14[v12[6]] = v22;
  v18(v29, (uint64_t)v11, v7);
  v23 = v30;
  sub_247AAECC8();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v7);
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(&v14[v12[10]], v23, v26);
  sub_247A95814(v35, (uint64_t)&v14[v12[7]]);
  sub_247A95814(v34, (uint64_t)&v14[v12[8]]);
  *(_QWORD *)&v14[v12[9]] = v21;
  sub_247A95C38(0, &qword_254454280, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x24BEE0460]);
  sub_247A9582C();
  sub_247AAEDB8();
  sub_247A95874((uint64_t)v14);
  return v36;
}

unint64_t sub_247A950DC(uint64_t a1)
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
  sub_247A95B14();
  v2 = sub_247AAF0D0();
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
    sub_247A95B7C(v6, (uint64_t)v15, (uint64_t (*)(_QWORD))sub_247A95BC0);
    result = sub_247AA06C8((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_247A95C28(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_247A95218(uint64_t a1)
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
  sub_247A95C38(0, &qword_2576DA600, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x24BEE30A0]);
  v2 = (_QWORD *)sub_247AAF0D0();
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
    result = sub_247AA06F8(v5, v6);
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

unint64_t sub_247A95334(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t result;
  char v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[2];

  sub_247A95A2C();
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (_QWORD *)((char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_247A95A90();
  v7 = sub_247AAF0D0();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = (char *)v6 + *(int *)(v3 + 48);
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v26[1] = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v4 + 72);
  swift_retain();
  while (1)
  {
    sub_247A95B7C(v13, (uint64_t)v6, (uint64_t (*)(_QWORD))sub_247A95A2C);
    v15 = *v6;
    v16 = v6[1];
    result = sub_247AA06F8(*v6, v16);
    if ((v18 & 1) != 0)
      break;
    v19 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v20 = (uint64_t *)(v8[6] + 16 * result);
    *v20 = v15;
    v20[1] = v16;
    v21 = v8[7];
    v22 = sub_247AAEE60();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v19, v10, v22);
    v23 = v8[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_11;
    v8[2] = v25;
    v13 += v14;
    if (!--v9)
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

uint64_t sub_247A954CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t StocksTabiUserEventHistoryScoringService.prepareForUse()()
{
  sub_247A959A8();
  swift_allocObject();
  return sub_247AAEBD8();
}

uint64_t sub_247A9555C(void (*a1)(void))
{
  uint64_t v2;
  id v3;

  v2 = qword_254454230;
  swift_retain();
  if (v2 != -1)
    swift_once();
  v3 = (id)qword_254454220;
  sub_247AAEFF8();
  sub_247AAED88();

  a1();
  return swift_release();
}

uint64_t StocksTabiUserEventHistoryScoringService.prepareForUse(completionHandler:)(uint64_t (*a1)(void))
{
  id v2;

  if (qword_254454230 != -1)
    swift_once();
  v2 = (id)qword_254454220;
  sub_247AAEFF8();
  sub_247AAED88();

  return a1();
}

id StocksTabiUserEventHistoryScoringService.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void StocksTabiUserEventHistoryScoringService.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id StocksTabiUserEventHistoryScoringService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_247A957AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544542B0;
  if (!qword_2544542B0)
  {
    sub_247A958B0(255, &qword_2544542A8, &qword_2544540F0, (uint64_t)&protocol descriptor for StocksTabiArticleDataType, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x24958A948](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2544542B0);
  }
  return result;
}

uint64_t sub_247A95814(__int128 *a1, uint64_t a2)
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

unint64_t sub_247A9582C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254454110;
  if (!qword_254454110)
  {
    v1 = type metadata accessor for StocksTabiArticleScoringWork();
    result = MEMORY[0x24958A948](&unk_247AB0394, v1);
    atomic_store(result, (unint64_t *)&qword_254454110);
  }
  return result;
}

uint64_t sub_247A95874(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for StocksTabiArticleScoringWork();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_247A958B0(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_247A95910(255, a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_247A95910(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_247A9595C()
{
  unint64_t result;

  result = qword_254454278;
  if (!qword_254454278)
  {
    result = MEMORY[0x24958A948](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254454278);
  }
  return result;
}

uint64_t sub_247A959A0(void (*a1)(void))
{
  return sub_247A9555C(a1);
}

void sub_247A959A8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254454050)
  {
    v0 = sub_247AAEBE4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254454050);
  }
}

uint64_t type metadata accessor for StocksTabiUserEventHistoryScoringService()
{
  return objc_opt_self();
}

uint64_t method lookup function for StocksTabiUserEventHistoryScoringService()
{
  return swift_lookUpClassMethod();
}

void sub_247A95A2C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_254454290)
  {
    sub_247AAEE60();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_254454290);
  }
}

void sub_247A95A90()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254454358)
  {
    sub_247AAEE60();
    v0 = sub_247AAF0DC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254454358);
  }
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

void sub_247A95B14()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576DA5F0)
  {
    v0 = sub_247AAF0DC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576DA5F0);
  }
}

uint64_t sub_247A95B7C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_247A95BC0()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_2576DA5F8)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_2576DA5F8);
  }
}

_OWORD *sub_247A95C28(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_247A95C38(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, MEMORY[0x24BEE0D00], MEMORY[0x24BEE13C8], MEMORY[0x24BEE0D10]);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_247A95C94()
{
  return sub_247A95E64(&qword_254454138, (uint64_t (*)(uint64_t))type metadata accessor for StocksTabiEventAggregationWork, (uint64_t)&unk_247AAF798);
}

uint64_t type metadata accessor for StocksTabiEventAggregationWork()
{
  uint64_t result;

  result = qword_254454148;
  if (!qword_254454148)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247A95CFC()
{
  return sub_247A95E64(&qword_254454140, (uint64_t (*)(uint64_t))type metadata accessor for StocksTabiEventAggregationWork, (uint64_t)&unk_247AAF818);
}

unint64_t sub_247A95D2C()
{
  unint64_t result;

  result = qword_2544541B0;
  if (!qword_2544541B0)
  {
    result = MEMORY[0x24958A948](&protocol conformance descriptor for TabiConfiguration, &type metadata for TabiConfiguration);
    atomic_store(result, (unint64_t *)&qword_2544541B0);
  }
  return result;
}

uint64_t sub_247A95D70()
{
  return sub_247A95E64((unint64_t *)&unk_254453FD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
}

uint64_t sub_247A95D9C()
{
  return sub_247A95E64((unint64_t *)&unk_254454090, MEMORY[0x24BE6D0C0], MEMORY[0x24BE6D0B8]);
}

unint64_t sub_247A95DC8()
{
  return 0xD000000000000011;
}

uint64_t sub_247A95DE4()
{
  return 0;
}

uint64_t sub_247A95DEC()
{
  return sub_247AAECEC();
}

uint64_t sub_247A95E14@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  *a2 = a1;
  return swift_retain();
}

uint64_t sub_247A95E30()
{
  return 1;
}

uint64_t sub_247A95E38()
{
  return sub_247A95E64(&qword_2576DA608, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_247A95E64(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24958A948](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247A95EA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_247AAE6F8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t *sub_247A95EDC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_247AAE6F8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_247AAED04();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_247A95F84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_247AAE6F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_247AAED04();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_247A95FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_247AAE6F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247AAED04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_247A9605C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_247AAE6F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247AAED04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_247A960D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_247AAE6F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247AAED04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_247A96154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_247AAE6F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247AAED04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_247A961D0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247A961DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_247AAE6F8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_247AAED04();
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_247A96250()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247A9625C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_247AAE6F8();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_247AAED04();
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_247A962D8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_247AAE6F8();
  if (v1 <= 0x3F)
  {
    result = sub_247AAED04();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_247A9635C(uint64_t a1)
{
  uint64_t result;

  result = sub_247A95E64(&qword_254454138, (uint64_t (*)(uint64_t))type metadata accessor for StocksTabiEventAggregationWork, (uint64_t)&unk_247AAF798);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

_UNKNOWN **sub_247A96398()
{
  return &protocol witness table for HeadlineScores.Cohort;
}

_UNKNOWN **sub_247A963A4()
{
  return &protocol witness table for HeadlineScores.StockEntityCohort;
}

id sub_247A963D0(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_class *ObjectType;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  objc_super v15;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v3[OBJC_IVAR____TtC21StocksPersonalization36StocksTabiWorkServiceUnloaderService_configurationManager] = a1;
  *(_QWORD *)&v3[OBJC_IVAR____TtC21StocksPersonalization36StocksTabiWorkServiceUnloaderService_workService] = a2;
  v15.receiver = v3;
  v15.super_class = ObjectType;
  swift_retain();
  swift_retain();
  v7 = objc_msgSendSuper2(&v15, sel_init);
  v8 = (void *)objc_opt_self();
  v9 = v7;
  v10 = objc_msgSend(v8, sel_defaultCenter, v15.receiver, v15.super_class);
  objc_msgSend(v10, sel_addObserver_selector_name_object_, v9, sel_applicationDidEnterBackground_, *MEMORY[0x24BEBDF98], 0);

  v11 = objc_msgSend(v8, sel_defaultCenter);
  v12 = *MEMORY[0x24BEBDF88];
  v13 = v9;
  objc_msgSend(v11, sel_addObserver_selector_name_object_, v13, sel_applicationDidBecomeActive_, v12, 0);

  swift_release();
  swift_release();
  return v13;
}

void sub_247A96530()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v1 = v0;
  v2 = sub_247AAE818();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2544541E8 != -1)
    swift_once();
  v6 = (void *)qword_2544541D8;
  sub_247A96CB8();
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_247AAF690;
  sub_247AAE614();
  sub_247A96D60();
  v8 = v6;
  v9 = sub_247AAF13C();
  v11 = v10;
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 64) = sub_247A9595C();
  *(_QWORD *)(v7 + 32) = v9;
  *(_QWORD *)(v7 + 40) = v11;
  sub_247AAEFF8();
  sub_247AAED88();

  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v1+ OBJC_IVAR____TtC21StocksPersonalization36StocksTabiWorkServiceUnloaderService_configurationManager)+ OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager), *(_QWORD *)(*(_QWORD *)(v1+ OBJC_IVAR____TtC21StocksPersonalization36StocksTabiWorkServiceUnloaderService_configurationManager)+ OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager+ 24));
  sub_247AAE9E0();
  v12 = sub_247AAE800();
  if (v12)
  {
    v13 = v12;
    sub_247AA506C(v12);
    sub_247AA51E8(v13);
    sub_247AA5548(v13);
    v14 = sub_247AA596C(v13);
    v15 = sub_247AA5F64(v13);
    v16 = sub_247AA655C(v13);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    LOBYTE(v13) = objc_msgSend(v16, sel_enabled);
    if ((v13 & 1) == 0)
    {
      v17 = (id)qword_2544541D8;
      sub_247AAEFF8();
      sub_247AAED88();

      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v18 = (id)qword_2544541D8;
  sub_247AAEFF8();
  sub_247AAED88();

  sub_247AAEDA0();
}

void sub_247A96848()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v1 = v0;
  v2 = sub_247AAE818();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2544541E8 != -1)
    swift_once();
  v6 = (void *)qword_2544541D8;
  sub_247A96CB8();
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_247AAF690;
  sub_247AAE614();
  sub_247A96D60();
  v8 = v6;
  v9 = sub_247AAF13C();
  v11 = v10;
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 64) = sub_247A9595C();
  *(_QWORD *)(v7 + 32) = v9;
  *(_QWORD *)(v7 + 40) = v11;
  sub_247AAEFF8();
  sub_247AAED88();

  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v1+ OBJC_IVAR____TtC21StocksPersonalization36StocksTabiWorkServiceUnloaderService_configurationManager)+ OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager), *(_QWORD *)(*(_QWORD *)(v1+ OBJC_IVAR____TtC21StocksPersonalization36StocksTabiWorkServiceUnloaderService_configurationManager)+ OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager+ 24));
  sub_247AAE9E0();
  v12 = sub_247AAE800();
  if (v12)
  {
    v13 = v12;
    sub_247AA506C(v12);
    sub_247AA51E8(v13);
    sub_247AA5548(v13);
    v14 = sub_247AA596C(v13);
    v15 = sub_247AA5F64(v13);
    v16 = sub_247AA655C(v13);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    LOBYTE(v13) = objc_msgSend(v16, sel_enabled);
    if ((v13 & 1) == 0)
    {
      v17 = (id)qword_2544541D8;
      sub_247AAEFF8();
      sub_247AAED88();

      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v18 = (id)qword_2544541D8;
  sub_247AAEFF8();
  sub_247AAED88();

  sub_247AAED94();
}

uint64_t sub_247A96B60(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v12;

  v6 = sub_247AAE614();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AAE608();
  v10 = a1;
  a4(v9);

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id sub_247A96C2C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StocksTabiWorkServiceUnloaderService()
{
  return objc_opt_self();
}

void sub_247A96CB8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2544543E0)
  {
    sub_247A96D0C();
    v0 = sub_247AAF148();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2544543E0);
  }
}

unint64_t sub_247A96D0C()
{
  unint64_t result;

  result = qword_2544543F8;
  if (!qword_2544543F8)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_2544543F8);
  }
  return result;
}

unint64_t sub_247A96D60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254453F90;
  if (!qword_254453F90)
  {
    v1 = sub_247AAE614();
    result = MEMORY[0x24958A948](MEMORY[0x24BDCB950], v1);
    atomic_store(result, (unint64_t *)&qword_254453F90);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_247A96DCC()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StocksTabiUserEventHistoryFeaturesFactory()
{
  return objc_opt_self();
}

unint64_t sub_247A96E14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254454130;
  if (!qword_254454130)
  {
    v1 = type metadata accessor for StocksTabiEventAggregationWork();
    result = MEMORY[0x24958A948](&unk_247AAF770, v1);
    atomic_store(result, (unint64_t *)&qword_254454130);
  }
  return result;
}

uint64_t sub_247A96E5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(uint64_t, char *, uint64_t);
  uint64_t v14;
  uint64_t v16;

  v2 = sub_247AAED04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_247AAE6F8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v16 - v11;
  sub_247AAE6EC();
  v13 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 16);
  v13(a1, v12, v6);
  v13((uint64_t)v10, v12, v6);
  swift_retain();
  sub_247AAECF8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  v14 = type metadata accessor for StocksTabiEventAggregationWork();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1 + *(int *)(v14 + 20), v5, v2);
}

BOOL sub_247A96FA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_247A96FBC()
{
  sub_247AAF1A8();
  sub_247AAF1B4();
  return sub_247AAF1C0();
}

uint64_t sub_247A97000()
{
  return sub_247AAF1B4();
}

uint64_t sub_247A97028()
{
  sub_247AAF1A8();
  sub_247AAF1B4();
  return sub_247AAF1C0();
}

uint64_t TabiConfiguration.packageIDs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TabiConfiguration.mlComputeUnits.getter()
{
  uint64_t v0;

  if ((unint64_t)(*(_QWORD *)(v0 + 24) - 1) >= 3)
    return 0;
  else
    return *(_QWORD *)(v0 + 24);
}

uint64_t TabiConfiguration.version.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TabiConfiguration.init(version:packageAssetIDs:mlComputeUnits:eventAggregationConfiguration:feedPersonalizationConfiguration:unloadGraphOnBackgroundConfiguration:)@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v9 = 0x4649434550534E55;
  if (a2)
    v9 = result;
  v10 = 0xEB00000000444549;
  v11 = MEMORY[0x24BEE4AF8];
  if (a2)
    v10 = a2;
  if (a3)
    v11 = a3;
  *a9 = v9;
  a9[1] = v10;
  if ((a5 & 1) != 0)
    a4 = 0;
  a9[2] = v11;
  a9[3] = a4;
  a9[4] = a6;
  a9[5] = a7;
  a9[6] = a8;
  return result;
}

uint64_t sub_247A97114(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_247A97148 + 4 * byte_247AAF9C0[a1]))(0x6E6F6973726576, 0xE700000000000000);
}

uint64_t sub_247A97148()
{
  return 0x416567616B636170;
}

uint64_t sub_247A9716C()
{
  return 0x7475706D6F436C6DLL;
}

unint64_t sub_247A97190()
{
  return 0xD00000000000001DLL;
}

unint64_t sub_247A971AC()
{
  return 0xD000000000000020;
}

uint64_t sub_247A971E4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_247A97218 + 4 * byte_247AAF9C6[a1]))(0x6E6F6973726576, 0xE700000000000000);
}

uint64_t sub_247A97218()
{
  return 0x416567616B636170;
}

uint64_t sub_247A9723C()
{
  return 0x7475706D6F436C6DLL;
}

unint64_t sub_247A97260()
{
  return 0xD00000000000001DLL;
}

unint64_t sub_247A9727C()
{
  return 0xD000000000000020;
}

void sub_247A972B4(char *a1)
{
  sub_247A972C0(*a1);
}

void sub_247A972C0(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_247A97310(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_247A973C8 + 4 * byte_247AAF9D2[a2]))(0x416567616B636170);
}

uint64_t sub_247A973C8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x416567616B636170 && v1 == 0xEF73444974657373)
    v2 = 1;
  else
    v2 = sub_247AAF160();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_247A974B4()
{
  char *v0;

  sub_247A974BC(*v0);
}

void sub_247A974BC(char a1)
{
  sub_247AAF1A8();
  __asm { BR              X10 }
}

uint64_t sub_247A9750C()
{
  sub_247AAEF2C();
  swift_bridgeObjectRelease();
  return sub_247AAF1C0();
}

void sub_247A975D0(uint64_t a1)
{
  char *v1;

  sub_247A975D8(a1, *v1);
}

void sub_247A975D8(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_247A97618()
{
  sub_247AAEF2C();
  return swift_bridgeObjectRelease();
}

void sub_247A976C8(uint64_t a1)
{
  char *v1;

  sub_247A976D0(a1, *v1);
}

void sub_247A976D0(uint64_t a1, char a2)
{
  sub_247AAF1A8();
  __asm { BR              X10 }
}

uint64_t sub_247A9771C()
{
  sub_247AAEF2C();
  swift_bridgeObjectRelease();
  return sub_247AAF1C0();
}

uint64_t sub_247A977E0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_247A995DC();
  *a1 = result;
  return result;
}

uint64_t sub_247A9780C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_247A97114(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_247A97834()
{
  unsigned __int8 *v0;

  return sub_247A971E4(*v0);
}

uint64_t sub_247A9783C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_247A995DC();
  *a1 = result;
  return result;
}

uint64_t sub_247A97860()
{
  return 0;
}

void sub_247A9786C(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_247A97878()
{
  sub_247A97EA8();
  return sub_247AAF1E4();
}

uint64_t sub_247A978A0()
{
  sub_247A97EA8();
  return sub_247AAF1F0();
}

uint64_t TabiConfiguration.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  char *v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  char *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  char *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t (**v51)(_QWORD, _QWORD);
  char v52;
  id v53;
  unint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  sub_247A982D0(0, &qword_2576DA620, MEMORY[0x24BEE3520]);
  v5 = *(uint64_t (***)(_QWORD, _QWORD))(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v46 - v6;
  v8 = (uint64_t (**)(_QWORD, _QWORD))v1[2];
  v50 = v1[3];
  v51 = v8;
  v9 = (void *)v1[4];
  v48 = (void *)v1[5];
  v49 = v9;
  v47 = (id)v1[6];
  v10 = a1[3];
  v11 = a1;
  v13 = v12;
  __swift_project_boxed_opaque_existential_1(v11, v10);
  sub_247A97EA8();
  sub_247AAF1D8();
  LOBYTE(v53) = 0;
  v14 = v7;
  sub_247AAF118();
  if (v2)
    return ((uint64_t (**)(char *, uint64_t))v5)[1](v14, v13);
  v15 = v49;
  v16 = v48;
  v53 = v51;
  v52 = 1;
  sub_247A97EEC();
  sub_247A9832C(&qword_2576DA628, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
  sub_247AAF130();
  LOBYTE(v53) = 2;
  sub_247AAF124();
  v46 = v7;
  if (v15)
  {
    v51 = v5;
    v18 = objc_msgSend(v15, sel_dictionary);
    sub_247AAEEC0();

    v19 = (void *)objc_opt_self();
    v20 = (void *)sub_247AAEEB4();
    swift_bridgeObjectRelease();
    v53 = 0;
    v21 = objc_msgSend(v19, sel_dataWithJSONObject_options_error_, v20, 0, &v53);

    v22 = v53;
    if (!v21)
    {
      v26 = v22;
      sub_247AAE620();

      swift_willThrow();
      return ((uint64_t (**)(char *, uint64_t))v51)[1](v46, v13);
    }
    v23 = (void *)sub_247AAE6A4();
    v25 = v24;

    v53 = v23;
    v54 = v25;
    v52 = 3;
    sub_247A97F40();
    sub_247AAF130();
    sub_247A97F84((uint64_t)v23, v25);
  }
  if (v16)
  {
    v27 = objc_msgSend(v16, sel_dictionary);
    sub_247AAEEC0();

    v28 = (void *)objc_opt_self();
    v29 = (void *)sub_247AAEEB4();
    swift_bridgeObjectRelease();
    v53 = 0;
    v30 = objc_msgSend(v28, sel_dataWithJSONObject_options_error_, v29, 0, &v53);

    v31 = v53;
    if (!v30)
    {
      v35 = v31;
      sub_247AAE620();

      swift_willThrow();
      return ((uint64_t (**)(char *, uint64_t))v5)[1](v46, v13);
    }
    v32 = (void *)sub_247AAE6A4();
    v34 = v33;

    v53 = v32;
    v54 = v34;
    v52 = 4;
    sub_247A97F40();
    v14 = v46;
    sub_247AAF130();
    sub_247A97F84((uint64_t)v32, v34);
  }
  else
  {
    v14 = v46;
  }
  if (!v47)
    return ((uint64_t (**)(char *, uint64_t))v5)[1](v14, v13);
  v36 = v14;
  v37 = objc_msgSend(v47, sel_dictionary);
  sub_247AAEEC0();

  v38 = (void *)objc_opt_self();
  v39 = (void *)sub_247AAEEB4();
  swift_bridgeObjectRelease();
  v53 = 0;
  v40 = objc_msgSend(v38, sel_dataWithJSONObject_options_error_, v39, 0, &v53);

  v41 = v53;
  if (v40)
  {
    v42 = (void *)sub_247AAE6A4();
    v44 = v43;

    v53 = v42;
    v54 = v44;
    v52 = 5;
    sub_247A97F40();
    sub_247AAF130();
    sub_247A97F84((uint64_t)v42, v44);
  }
  else
  {
    v45 = v41;
    sub_247AAE620();

    swift_willThrow();
  }
  return ((uint64_t (**)(char *, uint64_t))v5)[1](v36, v13);
}

unint64_t sub_247A97EA8()
{
  unint64_t result;

  result = qword_254454198;
  if (!qword_254454198)
  {
    result = MEMORY[0x24958A948](&unk_247AAFCAC, &type metadata for TabiConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254454198);
  }
  return result;
}

void sub_247A97EEC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2544542B8)
  {
    v0 = sub_247AAEFBC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2544542B8);
  }
}

unint64_t sub_247A97F40()
{
  unint64_t result;

  result = qword_2576DA630;
  if (!qword_2576DA630)
  {
    result = MEMORY[0x24958A948](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2576DA630);
  }
  return result;
}

uint64_t sub_247A97F84(uint64_t a1, unint64_t a2)
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

uint64_t TabiConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  Class *v23;
  uint64_t v24;
  Class *v25;
  Class *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  char v32;

  sub_247A982D0(0, (unint64_t *)&unk_254454368, MEMORY[0x24BEE33E0]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v24 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A97EA8();
  sub_247AAF1CC();
  if (!v2)
  {
    v32 = 0;
    v10 = sub_247AAF0F4();
    v12 = v11;
    sub_247A97EEC();
    v31 = 1;
    sub_247A9832C((unint64_t *)&unk_2544542C8, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_247AAF10C();
    v28 = v29;
    v30 = 2;
    v13 = sub_247AAF100();
    v15 = v14;
    v27 = v13;
    v26 = sub_247A98388((uint64_t)v9, 3, (Class *)0x24BE6CC60);
    v25 = sub_247A98388((uint64_t)v9, 4, (Class *)0x24BE6CC68);
    v17 = sub_247A985C4();
    v18 = 0x4649434550534E55;
    if (v12)
      v18 = v10;
    v24 = v18;
    if (!v12)
      v12 = 0xEB00000000444549;
    if (v28)
      v19 = v28;
    else
      v19 = MEMORY[0x24BEE4AF8];
    if ((v15 & 1) != 0)
      v20 = 0;
    else
      v20 = v27;
    v21 = *(void (**)(char *, uint64_t))(v7 + 8);
    v22 = (uint64_t)v17;
    v21(v9, v6);
    *a2 = v24;
    a2[1] = v12;
    a2[2] = v19;
    a2[3] = v20;
    v23 = v25;
    a2[4] = (uint64_t)v26;
    a2[5] = (uint64_t)v23;
    a2[6] = v22;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_247A982D0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_247A97EA8();
    v7 = a3(a1, &type metadata for TabiConfiguration.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_247A9832C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    sub_247A97EEC();
    v8 = a2;
    result = MEMORY[0x24958A948](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

Class *sub_247A98388(uint64_t a1, char a2, Class *a3)
{
  uint64_t v3;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _BYTE *v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  LOBYTE(v15) = a2;
  sub_247A982D0(0, (unint64_t *)&unk_254454368, MEMORY[0x24BEE33E0]);
  sub_247A99624();
  sub_247AAF10C();
  if (!v3)
  {
    v6 = v17;
    if (v17 >> 60 != 15)
    {
      v7 = (uint64_t)v16;
      v8 = (void *)objc_opt_self();
      v9 = (void *)sub_247AAE698();
      v16 = 0;
      v10 = objc_msgSend(v8, sel_JSONObjectWithData_options_error_, v9, 0, &v16, v15);

      if (v10)
      {
        v11 = v16;
        sub_247AAF04C();
        swift_unknownObjectRelease();
        sub_247A996C0();
        if ((swift_dynamicCast() & 1) != 0)
        {
          v12 = objc_allocWithZone(*a3);
          v13 = (void *)sub_247AAEEB4();
          swift_bridgeObjectRelease();
          a3 = (Class *)objc_msgSend(v12, sel_initWithDictionary_, v13);

          sub_247A996AC(v7, v6);
          return a3;
        }
        sub_247A9889C();
        swift_allocError();
        *v14 = 0;
      }
      else
      {
        a3 = (Class *)v16;
        sub_247AAE620();

      }
      swift_willThrow();
      sub_247A996AC(v7, v6);
      return a3;
    }
    return 0;
  }
  return a3;
}

id sub_247A985C4()
{
  uint64_t v0;
  id v1;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _BYTE *v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  LOBYTE(v12) = 5;
  sub_247A982D0(0, (unint64_t *)&unk_254454368, MEMORY[0x24BEE33E0]);
  sub_247A99624();
  sub_247AAF10C();
  if (!v0)
  {
    v3 = v14;
    if (v14 >> 60 != 15)
    {
      v4 = (uint64_t)v13;
      v5 = (void *)objc_opt_self();
      sub_247A99668((uint64_t)v13, v14);
      v6 = (void *)sub_247AAE698();
      v13 = 0;
      v7 = objc_msgSend(v5, sel_JSONObjectWithData_options_error_, v6, 0, &v13, v12);

      if (v7)
      {
        v8 = v13;
        sub_247AAF04C();
        swift_unknownObjectRelease();
        sub_247A996C0();
        v1 = (id)(MEMORY[0x24BEE4AD8] + 8);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v9 = objc_allocWithZone(MEMORY[0x24BE6CC70]);
          v10 = (void *)sub_247AAEEB4();
          swift_bridgeObjectRelease();
          v1 = objc_msgSend(v9, sel_initWithDictionary_, v10);

          sub_247A996AC(v4, v3);
          sub_247A996AC(v4, v3);
          return v1;
        }
        sub_247A9889C();
        swift_allocError();
        *v11 = 0;
      }
      else
      {
        v1 = v13;
        sub_247AAE620();

      }
      swift_willThrow();
      sub_247A996AC(v4, v3);
      sub_247A996AC(v4, v3);
      return v1;
    }
    return objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6CC70]), sel_initWithDictionary_, 0, v12);
  }
  return v1;
}

uint64_t TabiConfiguration.init(with:)()
{
  _BYTE *v0;

  swift_bridgeObjectRelease();
  sub_247A9889C();
  swift_allocError();
  *v0 = 1;
  return swift_willThrow();
}

unint64_t sub_247A9889C()
{
  unint64_t result;

  result = qword_2576DA638;
  if (!qword_2576DA638)
  {
    result = MEMORY[0x24958A948](&unk_247AAFC6C, &type metadata for TabiConfiguration.Errors);
    atomic_store(result, (unint64_t *)&qword_2576DA638);
  }
  return result;
}

uint64_t sub_247A988E4(_QWORD *a1, _QWORD *a2)
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
  if (v5 || (v6 = sub_247AAF160(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_247AAF160() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_247A989AC()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_247A989D8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_247A989E8()
{
  _BYTE *v0;

  swift_bridgeObjectRelease();
  sub_247A9889C();
  swift_allocError();
  *v0 = 1;
  return swift_willThrow();
}

uint64_t sub_247A98A3C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return TabiConfiguration.init(from:)(a1, a2);
}

uint64_t sub_247A98A50(_QWORD *a1)
{
  return TabiConfiguration.encode(to:)(a1);
}

id _s21StocksPersonalization17TabiConfigurationV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  id v22;
  void *v23;

  v2 = (_QWORD *)a1[2];
  v4 = a1[3];
  v3 = (void *)a1[4];
  v6 = (void *)a1[5];
  v5 = (void *)a1[6];
  v7 = (_QWORD *)a2[2];
  v8 = a2[3];
  if (*a1 == *a2 && a1[1] == a2[1] || (v9 = 0, (sub_247AAF160() & 1) != 0))
  {
    v9 = 0;
    if ((sub_247A988E4(v2, v7) & 1) != 0 && v4 == v8)
    {
      if (v3)
      {
        v10 = objc_msgSend(v3, sel_dictionary);
        sub_247AAEEC0();

      }
      else
      {
        sub_247A950DC(MEMORY[0x24BEE4AF8]);
      }
      v11 = (void *)sub_247AAEEB4();
      swift_bridgeObjectRelease();
      if (v3)
      {
        v12 = objc_msgSend(v3, sel_dictionary);
        sub_247AAEEC0();

      }
      else
      {
        sub_247A950DC(MEMORY[0x24BEE4AF8]);
      }
      v13 = (void *)sub_247AAEEB4();
      swift_bridgeObjectRelease();
      v14 = objc_msgSend(v11, sel_isEqualToDictionary_, v13);

      if (!v14)
        return 0;
      if (v6)
      {
        v15 = objc_msgSend(v6, sel_dictionary);
        sub_247AAEEC0();

      }
      else
      {
        sub_247A950DC(MEMORY[0x24BEE4AF8]);
      }
      v16 = (void *)sub_247AAEEB4();
      swift_bridgeObjectRelease();
      if (v6)
      {
        v17 = objc_msgSend(v6, sel_dictionary);
        sub_247AAEEC0();

      }
      else
      {
        sub_247A950DC(MEMORY[0x24BEE4AF8]);
      }
      v18 = (void *)sub_247AAEEB4();
      swift_bridgeObjectRelease();
      v19 = objc_msgSend(v16, sel_isEqualToDictionary_, v18);

      if (v19)
      {
        if (v5)
        {
          v20 = objc_msgSend(v5, sel_dictionary);
          sub_247AAEEC0();

        }
        else
        {
          sub_247A950DC(MEMORY[0x24BEE4AF8]);
        }
        v21 = (void *)sub_247AAEEB4();
        swift_bridgeObjectRelease();
        if (v5)
        {
          v22 = objc_msgSend(v5, sel_dictionary);
          sub_247AAEEC0();

        }
        else
        {
          sub_247A950DC(MEMORY[0x24BEE4AF8]);
        }
        v23 = (void *)sub_247AAEEB4();
        swift_bridgeObjectRelease();
        v9 = objc_msgSend(v21, sel_isEqualToDictionary_, v23);

      }
      else
      {
        return 0;
      }
    }
  }
  return v9;
}

unint64_t sub_247A98E48()
{
  unint64_t result;

  result = qword_2544541C0;
  if (!qword_2544541C0)
  {
    result = MEMORY[0x24958A948](&protocol conformance descriptor for TabiConfiguration, &type metadata for TabiConfiguration);
    atomic_store(result, (unint64_t *)&qword_2544541C0);
  }
  return result;
}

unint64_t sub_247A98E90()
{
  unint64_t result;

  result = qword_2544541B8;
  if (!qword_2544541B8)
  {
    result = MEMORY[0x24958A948](&protocol conformance descriptor for TabiConfiguration, &type metadata for TabiConfiguration);
    atomic_store(result, (unint64_t *)&qword_2544541B8);
  }
  return result;
}

unint64_t sub_247A98ED8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576DA640;
  if (!qword_2576DA640)
  {
    v1 = sub_247AAEC5C();
    result = MEMORY[0x24958A948](MEMORY[0x24BE6CFF8], v1);
    atomic_store(result, (unint64_t *)&qword_2576DA640);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TabiConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for TabiConfiguration(id *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

_QWORD *initializeWithCopy for TabiConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = (void *)a2[4];
  v6 = (void *)a2[5];
  a1[4] = v5;
  a1[5] = v6;
  v7 = (void *)a2[6];
  a1[6] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = v5;
  v9 = v6;
  v10 = v7;
  return a1;
}

_QWORD *assignWithCopy for TabiConfiguration(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  v4 = (void *)a1[4];
  v5 = (void *)a2[4];
  a1[4] = v5;
  v6 = v5;

  v7 = (void *)a1[5];
  v8 = (void *)a2[5];
  a1[5] = v8;
  v9 = v8;

  v10 = (void *)a1[6];
  v11 = (void *)a2[6];
  a1[6] = v11;
  v12 = v11;

  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TabiConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  v4 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  v5 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

  return a1;
}

uint64_t getEnumTagSinglePayload for TabiConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TabiConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TabiConfiguration()
{
  return &type metadata for TabiConfiguration;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TabiConfiguration.Errors(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TabiConfiguration.Errors(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247A992C0 + 4 * byte_247AAF9EF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_247A992F4 + 4 * byte_247AAF9EA[v4]))();
}

uint64_t sub_247A992F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247A992FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247A99304);
  return result;
}

uint64_t sub_247A99310(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247A99318);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_247A9931C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247A99324(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247A99330(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_247A9933C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TabiConfiguration.Errors()
{
  return &type metadata for TabiConfiguration.Errors;
}

uint64_t getEnumTagSinglePayload for TabiConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TabiConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247A99434 + 4 * byte_247AAF9F9[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_247A99468 + 4 * byte_247AAF9F4[v4]))();
}

uint64_t sub_247A99468(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247A99470(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247A99478);
  return result;
}

uint64_t sub_247A99484(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247A9948CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_247A99490(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247A99498(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_247A994A4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TabiConfiguration.CodingKeys()
{
  return &type metadata for TabiConfiguration.CodingKeys;
}

unint64_t sub_247A994C0()
{
  unint64_t result;

  result = qword_2576DA648;
  if (!qword_2576DA648)
  {
    result = MEMORY[0x24958A948](&unk_247AAFBDC, &type metadata for TabiConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576DA648);
  }
  return result;
}

unint64_t sub_247A99508()
{
  unint64_t result;

  result = qword_2576DA650;
  if (!qword_2576DA650)
  {
    result = MEMORY[0x24958A948](&unk_247AAFC44, &type metadata for TabiConfiguration.Errors);
    atomic_store(result, &qword_2576DA650);
  }
  return result;
}

unint64_t sub_247A99550()
{
  unint64_t result;

  result = qword_2544541A8;
  if (!qword_2544541A8)
  {
    result = MEMORY[0x24958A948](&unk_247AAFB14, &type metadata for TabiConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2544541A8);
  }
  return result;
}

unint64_t sub_247A99598()
{
  unint64_t result;

  result = qword_2544541A0;
  if (!qword_2544541A0)
  {
    result = MEMORY[0x24958A948](&unk_247AAFB3C, &type metadata for TabiConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2544541A0);
  }
  return result;
}

uint64_t sub_247A995DC()
{
  unint64_t v0;

  v0 = sub_247AAF0E8();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

unint64_t sub_247A99624()
{
  unint64_t result;

  result = qword_254453FC8;
  if (!qword_254453FC8)
  {
    result = MEMORY[0x24958A948](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254453FC8);
  }
  return result;
}

uint64_t sub_247A99668(uint64_t a1, unint64_t a2)
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

uint64_t sub_247A996AC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_247A97F84(a1, a2);
  return a1;
}

void sub_247A996C0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254454288)
  {
    v0 = sub_247AAEECC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254454288);
  }
}

uint64_t sub_247A99728(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a2;
  return swift_task_switch();
}

uint64_t sub_247A99740()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_247A99790;
  return sub_247AAEDC4();
}

uint64_t sub_247A99790()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t type metadata accessor for StocksTabiWorkServiceStartupTask()
{
  return objc_opt_self();
}

uint64_t sub_247A99800@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BEB45A0];
  v3 = sub_247AAEB78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_247A99844()
{
  sub_247A959A8();
  swift_retain();
  return sub_247AAEBB4();
}

uint64_t sub_247A99888()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_247A998E4;
  v2[2] = v0;
  return swift_task_switch();
}

uint64_t sub_247A998E4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of StocksCohortType.clicks.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of StocksCohortType.impressions.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StocksEntityCohortType.stockEntityID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StocksCohortDataType.globalCohort.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of StocksCohortDataType.sourceChannelCohort.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of StocksCohortDataType.stockEntityCohorts.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of StocksEntityMetadataType.stockEntityID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of StocksEntityMetadataType.prior.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of StocksTabiArticleDataType.originEntityID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of StocksTabiArticleDataType.newsData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_247A9997C@<X0>(_QWORD *a1@<X0>, int a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t AssociatedConformanceWitness;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  float v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  float v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  float v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  float v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  char v81;
  unint64_t v82;
  uint64_t v83;
  _BOOL8 v84;
  uint64_t v85;
  char v86;
  unint64_t v87;
  char v88;
  uint64_t *v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char isUniquelyReferenced_nonNull_native;
  char v112;
  unint64_t v113;
  uint64_t v114;
  _BOOL8 v115;
  uint64_t v116;
  char v117;
  unint64_t v118;
  char v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t result;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  int v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  uint64_t *v136;
  _QWORD *v137;
  _QWORD *v138;
  __int128 v139[2];
  __int128 v140;
  uint64_t v141;
  uint64_t v142;
  __int128 v143;
  uint64_t AssociatedTypeWitness;
  uint64_t v145;

  v132 = a2;
  v131 = type metadata accessor for StocksTabiArticleFeatures();
  MEMORY[0x24BDAC7A8](v131);
  v136 = (uint64_t *)((char *)&v129 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = a1[3];
  v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 40))(v8, v9);
  v12 = v11;
  v13 = a1[3];
  v14 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v13);
  (*(void (**)(uint64_t, uint64_t))(v14 + 56))(v13, v14);
  swift_getAssociatedTypeWitness();
  v133 = sub_247A95910(0, &qword_2544540D8);
  v15 = sub_247AAF094();
  swift_bridgeObjectRelease();
  v16 = sub_247A9A810(v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_247A9B02C(v16, v10, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247A9B198();
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_247AAF690;
  *(_QWORD *)(v17 + 32) = v10;
  *(_QWORD *)(v17 + 40) = v12;
  swift_bridgeObjectRetain();
  if (__OFSUB__(objc_msgSend(a3, sel_maxTopicIds), 1))
    goto LABEL_50;
  v130 = a4;
  v18 = sub_247AAEFB0();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v143 = v17;
  sub_247A9AF44(v18);
  v19 = v136;
  *v136 = v10;
  v19[1] = v12;
  v20 = v19;
  *(_QWORD *)&v143 = 0;
  *((_QWORD *)&v143 + 1) = 0xE000000000000000;
  v135 = a3;
  objc_msgSend(a3, sel_maxTopicIds);
  v21 = sub_247AAEFA4();
  swift_bridgeObjectRelease();
  v20[2] = v21;
  v22 = a1[3];
  v23 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v22);
  v24 = *(void (**)(uint64_t, uint64_t))(v23 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v145 = AssociatedConformanceWitness;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v143);
  v137 = a1;
  v134 = v21;
  swift_bridgeObjectRetain();
  v24(v22, v23);
  v26 = AssociatedTypeWitness;
  v27 = v145;
  __swift_project_boxed_opaque_existential_1(&v143, AssociatedTypeWitness);
  v28 = *(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 40);
  v29 = swift_getAssociatedTypeWitness();
  v141 = v29;
  v30 = swift_getAssociatedConformanceWitness();
  v142 = v30;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v140);
  v28(v26, v27);
  v31 = (*(double (**)(uint64_t, uint64_t))(v30 + 8))(v29, v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v140);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v143);
  *((float *)v20 + 6) = v31;
  v32 = v137[3];
  v33 = v137[4];
  __swift_project_boxed_opaque_existential_1(v137, v32);
  v34 = *(void (**)(uint64_t, uint64_t))(v33 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v35 = swift_getAssociatedConformanceWitness();
  v145 = v35;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v143);
  v34(v32, v33);
  v36 = AssociatedTypeWitness;
  v37 = v145;
  __swift_project_boxed_opaque_existential_1(&v143, AssociatedTypeWitness);
  v38 = *(void (**)(uint64_t, uint64_t))(v35 + 40);
  v39 = swift_getAssociatedTypeWitness();
  v141 = v39;
  v40 = swift_getAssociatedConformanceWitness();
  v142 = v40;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v140);
  v38(v36, v37);
  v41 = (*(double (**)(uint64_t, uint64_t))(v40 + 16))(v39, v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v140);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v143);
  *((float *)v20 + 7) = v41;
  v42 = v137[3];
  v43 = v137[4];
  __swift_project_boxed_opaque_existential_1(v137, v42);
  v44 = *(void (**)(uint64_t, uint64_t))(v43 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v45 = swift_getAssociatedConformanceWitness();
  v145 = v45;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v143);
  v44(v42, v43);
  v46 = AssociatedTypeWitness;
  v47 = v145;
  __swift_project_boxed_opaque_existential_1(&v143, AssociatedTypeWitness);
  v48 = *(void (**)(uint64_t, uint64_t))(v45 + 48);
  v49 = swift_getAssociatedTypeWitness();
  v141 = v49;
  v50 = swift_getAssociatedConformanceWitness();
  v142 = v50;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v140);
  v48(v46, v47);
  v51 = (*(double (**)(uint64_t, uint64_t))(v50 + 8))(v49, v50);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v140);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v143);
  *((float *)v20 + 8) = v51;
  v52 = v137[3];
  v53 = v137[4];
  __swift_project_boxed_opaque_existential_1(v137, v52);
  v54 = *(void (**)(uint64_t, uint64_t))(v53 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v55 = swift_getAssociatedConformanceWitness();
  v145 = v55;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v143);
  v54(v52, v53);
  v56 = AssociatedTypeWitness;
  v57 = v145;
  __swift_project_boxed_opaque_existential_1(&v143, AssociatedTypeWitness);
  v58 = *(void (**)(uint64_t, uint64_t))(v55 + 48);
  v59 = swift_getAssociatedTypeWitness();
  v141 = v59;
  v60 = swift_getAssociatedConformanceWitness();
  v142 = v60;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v140);
  v58(v56, v57);
  v61 = v59;
  v62 = v137;
  v63 = (*(double (**)(uint64_t, uint64_t))(v60 + 16))(v61, v60);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v140);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v143);
  *((float *)v20 + 9) = v63;
  v64 = v62[3];
  v65 = v62[4];
  __swift_project_boxed_opaque_existential_1(v62, v64);
  v66 = *(void (**)(uint64_t, uint64_t))(v65 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v67 = swift_getAssociatedConformanceWitness();
  v145 = v67;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v143);
  v66(v64, v65);
  v68 = AssociatedTypeWitness;
  v69 = v145;
  __swift_project_boxed_opaque_existential_1(&v143, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v67 + 56))(v68, v69);
  swift_getAssociatedTypeWitness();
  sub_247A95910(0, &qword_2544540C8);
  v70 = sub_247AAF094();
  swift_bridgeObjectRelease();
  v71 = *(_QWORD *)(v70 + 16);
  if (!v71)
  {
    v73 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_19:
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v143);
    v93 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)&v143 = MEMORY[0x24BEE4AF8];
    *((_QWORD *)&v143 + 1) = MEMORY[0x24BEE4AF8];
    v94 = v134;
    v95 = *(_QWORD *)(v134 + 16);
    v96 = (uint64_t)v136;
    if (v95)
    {
      swift_bridgeObjectRetain_n();
      v97 = (uint64_t *)(v94 + 40);
      do
      {
        v98 = *v97;
        *(_QWORD *)&v140 = *(v97 - 1);
        *((_QWORD *)&v140 + 1) = v98;
        swift_bridgeObjectRetain();
        sub_247A9A92C((char **)&v143, (uint64_t *)&v140, (uint64_t)v73);
        v97 += 2;
        swift_bridgeObjectRelease();
        --v95;
      }
      while (v95);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    *(_OWORD *)(v96 + 40) = v143;
    v99 = v62[3];
    v100 = v62[4];
    __swift_project_boxed_opaque_existential_1(v62, v99);
    (*(void (**)(uint64_t, uint64_t))(v100 + 56))(v99, v100);
    swift_getAssociatedTypeWitness();
    v101 = sub_247AAF094();
    swift_bridgeObjectRelease();
    v102 = *(_QWORD *)(v101 + 16);
    if (!v102)
    {
      v104 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_41:
      swift_bridgeObjectRelease();
      *(_QWORD *)&v143 = v93;
      *((_QWORD *)&v143 + 1) = v93;
      v123 = *(_QWORD *)(v94 + 16);
      if (v123)
      {
        swift_bridgeObjectRetain();
        v124 = (uint64_t *)(v94 + 40);
        do
        {
          v125 = *v124;
          *(_QWORD *)&v140 = *(v124 - 1);
          *((_QWORD *)&v140 + 1) = v125;
          swift_bridgeObjectRetain();
          sub_247A9AC40((char **)&v143, (uint64_t *)&v140, (uint64_t)v104);
          v124 += 2;
          swift_bridgeObjectRelease();
          --v123;
        }
        while (v123);
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_OWORD *)(v96 + 56) = v143;
      v126 = v62[3];
      v127 = v62[4];
      __swift_project_boxed_opaque_existential_1(v62, v126);
      (*(void (**)(uint64_t, uint64_t))(v127 + 64))(v126, v127);
      sub_247AAEC98();
      sub_247A9B228(v96, v130);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
    }
    v103 = v101 + 32;
    v133 = v101;
    swift_bridgeObjectRetain();
    v104 = (_QWORD *)MEMORY[0x24BEE4B00];
    while (1)
    {
      sub_247A954CC(v103, (uint64_t)&v143);
      v106 = AssociatedTypeWitness;
      v107 = v145;
      __swift_project_boxed_opaque_existential_1(&v143, AssociatedTypeWitness);
      v108 = (*(uint64_t (**)(uint64_t, uint64_t))(v107 + 8))(v106, v107);
      v110 = v109;
      sub_247A954CC((uint64_t)&v143, (uint64_t)&v140);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)&v139[0] = v104;
      v113 = sub_247AA06F8(v108, v110);
      v114 = v104[2];
      v115 = (v112 & 1) == 0;
      v116 = v114 + v115;
      if (__OFADD__(v114, v115))
        goto LABEL_47;
      v117 = v112;
      if (v104[3] >= v116)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v104 = *(_QWORD **)&v139[0];
          if ((v112 & 1) == 0)
            goto LABEL_35;
        }
        else
        {
          sub_247AA1974();
          v104 = *(_QWORD **)&v139[0];
          if ((v117 & 1) == 0)
            goto LABEL_35;
        }
      }
      else
      {
        sub_247AA0F98(v116, isUniquelyReferenced_nonNull_native);
        v118 = sub_247AA06F8(v108, v110);
        if ((v117 & 1) != (v119 & 1))
          goto LABEL_51;
        v113 = v118;
        v104 = *(_QWORD **)&v139[0];
        if ((v117 & 1) == 0)
        {
LABEL_35:
          v104[(v113 >> 6) + 8] |= 1 << v113;
          v120 = (uint64_t *)(v104[6] + 16 * v113);
          *v120 = v108;
          v120[1] = v110;
          sub_247A95814(&v140, v104[7] + 40 * v113);
          v121 = v104[2];
          v91 = __OFADD__(v121, 1);
          v122 = v121 + 1;
          if (v91)
            goto LABEL_49;
          v104[2] = v122;
          swift_bridgeObjectRetain();
          goto LABEL_27;
        }
      }
      v105 = v104[7] + 40 * v113;
      __swift_destroy_boxed_opaque_existential_1(v105);
      sub_247A95814(&v140, v105);
LABEL_27:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v143);
      v103 += 40;
      if (!--v102)
      {
        swift_bridgeObjectRelease();
        v62 = v137;
        v96 = (uint64_t)v136;
        v94 = v134;
        v93 = MEMORY[0x24BEE4AF8];
        goto LABEL_41;
      }
    }
  }
  v72 = v70 + 32;
  v129 = v70;
  swift_bridgeObjectRetain();
  v73 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    sub_247A954CC(v72, (uint64_t)&v140);
    v75 = v141;
    v76 = v142;
    __swift_project_boxed_opaque_existential_1(&v140, v141);
    v77 = (*(uint64_t (**)(uint64_t, uint64_t))(v76 + 16))(v75, v76);
    v79 = v78;
    sub_247A954CC((uint64_t)&v140, (uint64_t)v139);
    v80 = swift_isUniquelyReferenced_nonNull_native();
    v138 = v73;
    v82 = sub_247AA06F8(v77, v79);
    v83 = v73[2];
    v84 = (v81 & 1) == 0;
    v85 = v83 + v84;
    if (__OFADD__(v83, v84))
      break;
    v86 = v81;
    if (v73[3] >= v85)
    {
      if ((v80 & 1) != 0)
      {
        v73 = v138;
        if ((v81 & 1) == 0)
          goto LABEL_13;
      }
      else
      {
        sub_247AA1998();
        v73 = v138;
        if ((v86 & 1) == 0)
          goto LABEL_13;
      }
    }
    else
    {
      sub_247AA0FBC(v85, v80);
      v87 = sub_247AA06F8(v77, v79);
      if ((v86 & 1) != (v88 & 1))
        goto LABEL_51;
      v82 = v87;
      v73 = v138;
      if ((v86 & 1) == 0)
      {
LABEL_13:
        v73[(v82 >> 6) + 8] |= 1 << v82;
        v89 = (uint64_t *)(v73[6] + 16 * v82);
        *v89 = v77;
        v89[1] = v79;
        sub_247A95814(v139, v73[7] + 40 * v82);
        v90 = v73[2];
        v91 = __OFADD__(v90, 1);
        v92 = v90 + 1;
        if (v91)
          goto LABEL_48;
        v73[2] = v92;
        swift_bridgeObjectRetain();
        goto LABEL_5;
      }
    }
    v74 = v73[7] + 40 * v82;
    __swift_destroy_boxed_opaque_existential_1(v74);
    sub_247A95814(v139, v74);
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v140);
    v72 += 40;
    if (!--v71)
    {
      swift_bridgeObjectRelease();
      v62 = v137;
      goto LABEL_19;
    }
  }
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_51:
  result = sub_247AAF16C();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for StocksTabiArticleFeatures()
{
  uint64_t result;

  result = qword_2544540F8;
  if (!qword_2544540F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247A9A810(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_247AA0900(0, v1, 0);
    v2 = v14;
    v4 = (_QWORD *)(a1 + 32);
    do
    {
      v5 = v4[3];
      v6 = v4[4];
      __swift_project_boxed_opaque_existential_1(v4, v5);
      v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
      v9 = v8;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_247AA0900(0, *(_QWORD *)(v14 + 16) + 1, 1);
      v11 = *(_QWORD *)(v14 + 16);
      v10 = *(_QWORD *)(v14 + 24);
      if (v11 >= v10 >> 1)
        sub_247AA0900((char *)(v10 > 1), v11 + 1, 1);
      *(_QWORD *)(v14 + 16) = v11 + 1;
      v12 = v14 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v9;
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_247A9A92C(char **a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  float v24;
  uint64_t result;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  unint64_t v33;
  char *v34;
  char *v35;
  unint64_t v36;
  char *v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _QWORD v41[3];
  uint64_t v42;
  uint64_t v43;

  if (*(_QWORD *)(a3 + 16))
  {
    v5 = *a2;
    v6 = a2[1];
    swift_bridgeObjectRetain();
    v7 = sub_247AA06F8(v5, v6);
    if ((v8 & 1) != 0)
    {
      sub_247A954CC(*(_QWORD *)(a3 + 56) + 40 * v7, (uint64_t)&v38);
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v39 + 1))
      {
        sub_247A95814(&v38, (uint64_t)v41);
        v10 = v42;
        v9 = v43;
        __swift_project_boxed_opaque_existential_1(v41, v42);
        v11 = (*(double (**)(uint64_t))(*(_QWORD *)(v9 + 8) + 8))(v10);
        v12 = *a1;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v12 = sub_247AA6BD8(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
        v13 = *((_QWORD *)v12 + 2);
        v14 = *((_QWORD *)v12 + 3);
        v15 = v13 + 1;
        if (v13 >= v14 >> 1)
        {
          v32 = v12;
          v33 = *((_QWORD *)v12 + 2);
          v34 = sub_247AA6BD8((char *)(v14 > 1), v13 + 1, 1, v32);
          v13 = v33;
          v12 = v34;
        }
        v16 = v11;
        *((_QWORD *)v12 + 2) = v15;
        *(float *)&v12[4 * v13 + 32] = v16;
        *a1 = v12;
        v18 = v42;
        v17 = v43;
        __swift_project_boxed_opaque_existential_1(v41, v42);
        v19 = (*(double (**)(uint64_t))(*(_QWORD *)(v17 + 8) + 16))(v18);
        v20 = a1[1];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v20 = sub_247AA6BD8(0, *((_QWORD *)v20 + 2) + 1, 1, v20);
        v21 = *((_QWORD *)v20 + 2);
        v22 = *((_QWORD *)v20 + 3);
        v23 = v21 + 1;
        if (v21 >= v22 >> 1)
        {
          v35 = v20;
          v36 = *((_QWORD *)v20 + 2);
          v37 = sub_247AA6BD8((char *)(v22 > 1), v21 + 1, 1, v35);
          v21 = v36;
          v20 = v37;
        }
        v24 = v19;
        *((_QWORD *)v20 + 2) = v23;
        *(float *)&v20[4 * v21 + 32] = v24;
        a1[1] = v20;
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
      }
    }
    else
    {
      v40 = 0;
      v38 = 0u;
      v39 = 0u;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v40 = 0;
    v38 = 0u;
    v39 = 0u;
  }
  sub_247A9B26C((uint64_t)&v38, &qword_2544540D0, &qword_2544540C8);
  v26 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v26 = sub_247AA6BD8(0, *((_QWORD *)v26 + 2) + 1, 1, v26);
  v28 = *((_QWORD *)v26 + 2);
  v27 = *((_QWORD *)v26 + 3);
  if (v28 >= v27 >> 1)
    v26 = sub_247AA6BD8((char *)(v27 > 1), v28 + 1, 1, v26);
  *((_QWORD *)v26 + 2) = v28 + 1;
  *(_DWORD *)&v26[4 * v28 + 32] = 0;
  *a1 = v26;
  v29 = (uint64_t)a1[1];
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_247AA6BD8(0, *(_QWORD *)(v29 + 16) + 1, 1, (char *)v29);
    v29 = result;
  }
  v31 = *(_QWORD *)(v29 + 16);
  v30 = *(_QWORD *)(v29 + 24);
  if (v31 >= v30 >> 1)
  {
    result = (uint64_t)sub_247AA6BD8((char *)(v30 > 1), v31 + 1, 1, (char *)v29);
    v29 = result;
  }
  *(_QWORD *)(v29 + 16) = v31 + 1;
  *(_DWORD *)(v29 + 4 * v31 + 32) = 0;
  a1[1] = (char *)v29;
  return result;
}

uint64_t sub_247A9AC40(char **a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  float v22;
  uint64_t result;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _QWORD v33[3];
  uint64_t v34;
  uint64_t v35;

  if (*(_QWORD *)(a3 + 16))
  {
    v5 = *a2;
    v6 = a2[1];
    swift_bridgeObjectRetain();
    v7 = sub_247AA06F8(v5, v6);
    if ((v8 & 1) != 0)
    {
      sub_247A954CC(*(_QWORD *)(a3 + 56) + 40 * v7, (uint64_t)&v30);
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v31 + 1))
      {
        sub_247A95814(&v30, (uint64_t)v33);
        v9 = v34;
        v10 = v35;
        __swift_project_boxed_opaque_existential_1(v33, v34);
        v11 = (*(double (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10);
        v12 = *a1;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v12 = sub_247AA6BD8(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
        v14 = *((_QWORD *)v12 + 2);
        v13 = *((_QWORD *)v12 + 3);
        if (v14 >= v13 >> 1)
          v12 = sub_247AA6BD8((char *)(v13 > 1), v14 + 1, 1, v12);
        v15 = v11;
        *((_QWORD *)v12 + 2) = v14 + 1;
        *(float *)&v12[4 * v14 + 32] = v15;
        *a1 = v12;
        v16 = v34;
        v17 = v35;
        __swift_project_boxed_opaque_existential_1(v33, v34);
        v18 = (*(double (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
        v19 = a1[1];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v19 = sub_247AA6BD8(0, *((_QWORD *)v19 + 2) + 1, 1, v19);
        v21 = *((_QWORD *)v19 + 2);
        v20 = *((_QWORD *)v19 + 3);
        if (v21 >= v20 >> 1)
          v19 = sub_247AA6BD8((char *)(v20 > 1), v21 + 1, 1, v19);
        v22 = v18;
        *((_QWORD *)v19 + 2) = v21 + 1;
        *(float *)&v19[4 * v21 + 32] = v22;
        a1[1] = v19;
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
      }
    }
    else
    {
      v32 = 0;
      v30 = 0u;
      v31 = 0u;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v32 = 0;
    v30 = 0u;
    v31 = 0u;
  }
  sub_247A9B26C((uint64_t)&v30, (unint64_t *)&unk_2544540E0, &qword_2544540D8);
  v24 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v24 = sub_247AA6BD8(0, *((_QWORD *)v24 + 2) + 1, 1, v24);
  v26 = *((_QWORD *)v24 + 2);
  v25 = *((_QWORD *)v24 + 3);
  if (v26 >= v25 >> 1)
    v24 = sub_247AA6BD8((char *)(v25 > 1), v26 + 1, 1, v24);
  *((_QWORD *)v24 + 2) = v26 + 1;
  *(_DWORD *)&v24[4 * v26 + 32] = 0;
  *a1 = v24;
  v27 = (uint64_t)a1[1];
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_247AA6BD8(0, *(_QWORD *)(v27 + 16) + 1, 1, (char *)v27);
    v27 = result;
  }
  v29 = *(_QWORD *)(v27 + 16);
  v28 = *(_QWORD *)(v27 + 24);
  if (v29 >= v28 >> 1)
  {
    result = (uint64_t)sub_247AA6BD8((char *)(v28 > 1), v29 + 1, 1, (char *)v27);
    v27 = result;
  }
  *(_QWORD *)(v27 + 16) = v29 + 1;
  *(_DWORD *)(v27 + 4 * v29 + 32) = 0;
  a1[1] = (char *)v27;
  return result;
}

uint64_t sub_247A9AF44(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = (uint64_t)sub_247AA6ACC((char *)result, v10, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v7 = *(_QWORD *)(v3 + 16);
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    *(_QWORD *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_247A9B02C(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *i;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v3 = *(_QWORD *)(result + 16);
  if (!v3)
    return MEMORY[0x24BEE4AF8];
  v6 = 0;
  v7 = result + 40;
  v8 = -(uint64_t)v3;
  v9 = MEMORY[0x24BEE4AF8];
  v19 = result + 40;
  do
  {
    if (v6 <= v3)
      v10 = v3;
    else
      v10 = v6;
    v11 = -(uint64_t)v10;
    for (i = (uint64_t *)(v7 + 16 * v6++); ; i += 2)
    {
      if (v11 + v6 == 1)
      {
        __break(1u);
        return result;
      }
      v13 = *(i - 1);
      v14 = *i;
      if (v13 != a2 || v14 != a3)
      {
        result = sub_247AAF160();
        if ((result & 1) == 0)
          break;
      }
      ++v6;
      if (v8 + v6 == 1)
        return v9;
    }
    swift_bridgeObjectRetain();
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
      result = (uint64_t)sub_247AA0900(0, *(_QWORD *)(v9 + 16) + 1, 1);
    v17 = *(_QWORD *)(v9 + 16);
    v16 = *(_QWORD *)(v9 + 24);
    if (v17 >= v16 >> 1)
      result = (uint64_t)sub_247AA0900((char *)(v16 > 1), v17 + 1, 1);
    *(_QWORD *)(v9 + 16) = v17 + 1;
    v18 = v9 + 16 * v17;
    *(_QWORD *)(v18 + 32) = v13;
    *(_QWORD *)(v18 + 40) = v14;
    v3 = v20;
    v7 = v19;
  }
  while (v8 + v6);
  return v9;
}

void sub_247A9B198()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254454720)
  {
    v0 = sub_247AAF148();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254454720);
  }
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

uint64_t sub_247A9B228(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StocksTabiArticleFeatures();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247A9B26C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t v4;

  sub_247A9B2A8(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_247A9B2A8(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_247A95910(255, a3);
    v4 = sub_247AAF040();
    if (!v5)
      atomic_store(v4, a2);
  }
}

_QWORD *sub_247A9B2FC(uint64_t a1, uint64_t *a2, uint64_t a3)
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
  uint64_t v14;

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
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    v6 = a2[6];
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_QWORD *)(a1 + 48) = v6;
    v7 = a2[8];
    v8 = *(int *)(a3 + 56);
    v14 = a1 + v8;
    v9 = (uint64_t)a2 + v8;
    *(_QWORD *)(a1 + 56) = a2[7];
    *(_QWORD *)(a1 + 64) = v7;
    v10 = sub_247AAECA4();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v14, v9, v10);
  }
  return v3;
}

uint64_t sub_247A9B3FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 56);
  v5 = sub_247AAECA4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_247A9B46C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  v7 = *(int *)(a3 + 56);
  v12 = a1 + v7;
  v8 = a2 + v7;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  v9 = sub_247AAECA4();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v12, v8, v9);
  return a1;
}

uint64_t sub_247A9B540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 56);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_247AAECA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_247A9B654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v4 = *(int *)(a3 + 56);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_247AAECA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_247A9B6D0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 56);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247AAECA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_247A9B794()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247A9B7A0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_247AAECA4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 56), a2, v8);
  }
}

uint64_t sub_247A9B81C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247A9B828(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_247AAECA4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 56), a2, a2, v7);
  }
  return result;
}

uint64_t sub_247A9B89C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247AAECA4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_247A9B944(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_247AA0900(0, v1, 0);
    v2 = v13;
    v4 = *(_QWORD *)(type metadata accessor for StocksTabiArticleFeatures() - 8);
    v5 = *(_QWORD *)(v4 + 72);
    v6 = (uint64_t *)(((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + a1 + 8);
    do
    {
      v8 = *(v6 - 1);
      v7 = *v6;
      v10 = *(_QWORD *)(v13 + 16);
      v9 = *(_QWORD *)(v13 + 24);
      swift_bridgeObjectRetain();
      if (v10 >= v9 >> 1)
        sub_247AA0900((char *)(v9 > 1), v10 + 1, 1);
      v6 = (uint64_t *)((char *)v6 + v5);
      *(_QWORD *)(v13 + 16) = v10 + 1;
      v11 = v13 + 16 * v10;
      *(_QWORD *)(v11 + 32) = v8;
      *(_QWORD *)(v11 + 40) = v7;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_247A9BA38(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_247AA0948(0, v1, 0);
    v2 = v11;
    v4 = *(_QWORD *)(type metadata accessor for StocksTabiArticleFeatures() - 8);
    v5 = *(_QWORD *)(v4 + 72);
    v6 = (int *)(a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 24);
    do
    {
      v7 = *v6;
      v9 = *(_QWORD *)(v11 + 16);
      v8 = *(_QWORD *)(v11 + 24);
      if (v9 >= v8 >> 1)
        sub_247AA0948((char *)(v8 > 1), v9 + 1, 1);
      *(_QWORD *)(v11 + 16) = v9 + 1;
      *(_DWORD *)(v11 + 4 * v9 + 32) = v7;
      v6 = (int *)((char *)v6 + v5);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_247A9BB2C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_247AA0948(0, v1, 0);
    v2 = v11;
    v4 = *(_QWORD *)(type metadata accessor for StocksTabiArticleFeatures() - 8);
    v5 = *(_QWORD *)(v4 + 72);
    v6 = (int *)(a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 28);
    do
    {
      v7 = *v6;
      v9 = *(_QWORD *)(v11 + 16);
      v8 = *(_QWORD *)(v11 + 24);
      if (v9 >= v8 >> 1)
        sub_247AA0948((char *)(v8 > 1), v9 + 1, 1);
      *(_QWORD *)(v11 + 16) = v9 + 1;
      *(_DWORD *)(v11 + 4 * v9 + 32) = v7;
      v6 = (int *)((char *)v6 + v5);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_247A9BC20(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_247AA0948(0, v1, 0);
    v2 = v11;
    v4 = *(_QWORD *)(type metadata accessor for StocksTabiArticleFeatures() - 8);
    v5 = *(_QWORD *)(v4 + 72);
    v6 = (int *)(a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 32);
    do
    {
      v7 = *v6;
      v9 = *(_QWORD *)(v11 + 16);
      v8 = *(_QWORD *)(v11 + 24);
      if (v9 >= v8 >> 1)
        sub_247AA0948((char *)(v8 > 1), v9 + 1, 1);
      *(_QWORD *)(v11 + 16) = v9 + 1;
      *(_DWORD *)(v11 + 4 * v9 + 32) = v7;
      v6 = (int *)((char *)v6 + v5);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_247A9BD14(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_247AA0948(0, v1, 0);
    v2 = v11;
    v4 = *(_QWORD *)(type metadata accessor for StocksTabiArticleFeatures() - 8);
    v5 = *(_QWORD *)(v4 + 72);
    v6 = (int *)(a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 36);
    do
    {
      v7 = *v6;
      v9 = *(_QWORD *)(v11 + 16);
      v8 = *(_QWORD *)(v11 + 24);
      if (v9 >= v8 >> 1)
        sub_247AA0948((char *)(v8 > 1), v9 + 1, 1);
      *(_QWORD *)(v11 + 16) = v9 + 1;
      *(_DWORD *)(v11 + 4 * v9 + 32) = v7;
      v6 = (int *)((char *)v6 + v5);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_247A9BE08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  unint64_t v13;
  unint64_t v14;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = sub_247AAECA4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = MEMORY[0x24BEE4AF8];
  if (v7)
  {
    v16[1] = v1;
    v19 = MEMORY[0x24BEE4AF8];
    sub_247AA091C(0, v7, 0);
    v8 = v19;
    v9 = type metadata accessor for StocksTabiArticleFeatures();
    v10 = *(_QWORD *)(v9 - 8);
    v11 = a1 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    v17 = *(_QWORD *)(v10 + 72);
    v18 = v9;
    v12 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    do
    {
      v12(v6, v11 + *(int *)(v18 + 56), v3);
      v19 = v8;
      v14 = *(_QWORD *)(v8 + 16);
      v13 = *(_QWORD *)(v8 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_247AA091C(v13 > 1, v14 + 1, 1);
        v8 = v19;
      }
      *(_QWORD *)(v8 + 16) = v14 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v14, v6, v3);
      v11 += v17;
      --v7;
    }
    while (v7);
  }
  return v8;
}

char *sub_247A9BF78(uint64_t a1, uint64_t a2)
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *result;
  uint64_t v48;
  uint64_t v49;
  int64_t v50;
  int64_t v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  int64_t v67;
  int64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int64_t v81;
  int64_t v82;
  int64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  int64_t v93;
  int64_t v94;
  int64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;

  v104 = a2;
  v3 = type metadata accessor for StocksTabiArticleFeatures();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v113 = (uint64_t)&v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v112 = (char *)&v100 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v114 = (char *)&v100 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v100 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v100 - v14;
  sub_247A9CA5C();
  sub_247A95A2C();
  v17 = v16;
  v18 = *(_QWORD *)(v16 - 8);
  v19 = *(_QWORD *)(v18 + 72);
  v20 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_247AAFEC0;
  v102 = v21;
  v22 = (_QWORD *)(v21 + v20);
  v111 = v17;
  *v22 = 0xD000000000000025;
  v22[1] = 0x8000000247AB0B30;
  v23 = 0;
  sub_247A9B944(a1);
  sub_247AAEE54();
  swift_bridgeObjectRelease();
  v109 = v22;
  v110 = v19;
  v24 = (_QWORD *)((char *)v22 + v19);
  *v24 = 0xD000000000000020;
  v24[1] = 0x8000000247AB0B60;
  v25 = *(_QWORD *)(a1 + 16);
  v107 = v25;
  v108 = v4;
  v106 = a1;
  if (v25)
  {
    v101 = v24;
    v105 = 0;
    v26 = v4;
    v27 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v28 = *(_QWORD *)(v26 + 72);
    swift_bridgeObjectRetain();
    v29 = (char *)MEMORY[0x24BEE4AF8];
    v30 = v25;
    do
    {
      sub_247A9CAB0(v27, (uint64_t)v15);
      v115 = *((_QWORD *)v15 + 2);
      sub_247A97EEC();
      sub_247A9CAF4();
      swift_bridgeObjectRetain();
      v31 = sub_247AAEED8();
      v33 = v32;
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v29 = sub_247AA6ACC(0, *((_QWORD *)v29 + 2) + 1, 1, v29);
      v35 = *((_QWORD *)v29 + 2);
      v34 = *((_QWORD *)v29 + 3);
      if (v35 >= v34 >> 1)
        v29 = sub_247AA6ACC((char *)(v34 > 1), v35 + 1, 1, v29);
      *((_QWORD *)v29 + 2) = v35 + 1;
      v36 = &v29[16 * v35];
      *((_QWORD *)v36 + 4) = v31;
      *((_QWORD *)v36 + 5) = v33;
      sub_247A9CB3C((uint64_t)v15);
      v27 += v28;
      --v30;
    }
    while (v30);
    a1 = v106;
    swift_bridgeObjectRelease();
    v25 = v107;
    v23 = v105;
  }
  sub_247AAEE54();
  swift_bridgeObjectRelease();
  v37 = v109;
  v38 = v110;
  v39 = (_QWORD *)((char *)v109 + 2 * v110);
  *v39 = 0xD00000000000002DLL;
  v39[1] = 0x8000000247AB0B90;
  sub_247A9BA38(a1);
  sub_247AAEE48();
  swift_bridgeObjectRelease();
  v40 = (_QWORD *)((char *)v37 + 3 * v38);
  v105 = 0xD000000000000032;
  *v40 = 0xD000000000000032;
  v40[1] = 0x8000000247AB0BC0;
  sub_247A9BB2C(a1);
  sub_247AAEE48();
  swift_bridgeObjectRelease();
  v41 = (_QWORD *)((char *)v37 + 4 * v38);
  *v41 = 0xD000000000000030;
  v41[1] = 0x8000000247AB0C00;
  sub_247A9BC20(a1);
  sub_247AAEE48();
  swift_bridgeObjectRelease();
  v42 = (_QWORD *)((char *)v37 + 5 * v38);
  *v42 = 0xD000000000000035;
  v42[1] = 0x8000000247AB0C40;
  sub_247A9BD14(a1);
  v101 = (_QWORD *)v23;
  sub_247AAEE48();
  swift_bridgeObjectRelease();
  v43 = (_QWORD *)((char *)v37 + 6 * v38);
  *v43 = 0xD00000000000002DLL;
  v43[1] = 0x8000000247AB0C80;
  if (!v25)
  {
LABEL_27:
    v57 = v108;
    sub_247AAEE48();
    swift_bridgeObjectRelease();
    v58 = (_QWORD *)((char *)&v109[v110] - v110);
    *v58 = v105;
    v58[1] = 0x8000000247AB0CB0;
    if (v25)
    {
      v59 = a1 + ((*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80));
      v60 = *(_QWORD *)(v57 + 72);
      swift_bridgeObjectRetain();
      v61 = (char *)MEMORY[0x24BEE4AF8];
      v62 = v25;
      v63 = (uint64_t)v114;
      do
      {
        result = (char *)sub_247A9CAB0(v59, v63);
        v64 = *(_QWORD *)(v63 + 48);
        v65 = *(_QWORD *)(v64 + 16);
        v66 = *((_QWORD *)v61 + 2);
        v67 = v66 + v65;
        if (__OFADD__(v66, v65))
          goto LABEL_83;
        swift_bridgeObjectRetain();
        result = (char *)swift_isUniquelyReferenced_nonNull_native();
        if (!(_DWORD)result || v67 > *((_QWORD *)v61 + 3) >> 1)
        {
          if (v66 <= v67)
            v68 = v66 + v65;
          else
            v68 = v66;
          result = sub_247AA6BD8(result, v68, 1, v61);
          v61 = result;
        }
        v63 = (uint64_t)v114;
        if (*(_QWORD *)(v64 + 16))
        {
          v69 = *((_QWORD *)v61 + 2);
          if ((*((_QWORD *)v61 + 3) >> 1) - v69 < v65)
            goto LABEL_90;
          result = (char *)memcpy(&v61[4 * v69 + 32], (const void *)(v64 + 32), 4 * v65);
          if (v65)
          {
            v70 = *((_QWORD *)v61 + 2);
            v55 = __OFADD__(v70, v65);
            v71 = v70 + v65;
            if (v55)
              goto LABEL_94;
            *((_QWORD *)v61 + 2) = v71;
          }
        }
        else if (v65)
        {
          goto LABEL_85;
        }
        swift_bridgeObjectRelease();
        sub_247A9CB3C(v63);
        v59 += v60;
        --v62;
      }
      while (v62);
      swift_bridgeObjectRelease();
      v72 = v113;
      v25 = v107;
      v57 = v108;
    }
    else
    {
      v72 = v113;
    }
    sub_247AAEE48();
    swift_bridgeObjectRelease();
    v73 = &v109[v110];
    *v73 = 0xD00000000000002DLL;
    v73[1] = 0x8000000247AB0CF0;
    if (v25)
    {
      v74 = a1 + ((*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80));
      v75 = *(_QWORD *)(v57 + 72);
      swift_bridgeObjectRetain();
      v76 = (char *)MEMORY[0x24BEE4AF8];
      v77 = v25;
      v78 = (uint64_t)v112;
      do
      {
        result = (char *)sub_247A9CAB0(v74, v78);
        v79 = *(_QWORD *)(v78 + 56);
        v80 = *(_QWORD *)(v79 + 16);
        v81 = *((_QWORD *)v76 + 2);
        v82 = v81 + v80;
        if (__OFADD__(v81, v80))
          goto LABEL_84;
        swift_bridgeObjectRetain();
        result = (char *)swift_isUniquelyReferenced_nonNull_native();
        if (!(_DWORD)result || v82 > *((_QWORD *)v76 + 3) >> 1)
        {
          if (v81 <= v82)
            v83 = v81 + v80;
          else
            v83 = v81;
          result = sub_247AA6BD8(result, v83, 1, v76);
          v76 = result;
        }
        v78 = (uint64_t)v112;
        if (*(_QWORD *)(v79 + 16))
        {
          v84 = *((_QWORD *)v76 + 2);
          if ((*((_QWORD *)v76 + 3) >> 1) - v84 < v80)
            goto LABEL_91;
          result = (char *)memcpy(&v76[4 * v84 + 32], (const void *)(v79 + 32), 4 * v80);
          if (v80)
          {
            v85 = *((_QWORD *)v76 + 2);
            v55 = __OFADD__(v85, v80);
            v86 = v85 + v80;
            if (v55)
              goto LABEL_95;
            *((_QWORD *)v76 + 2) = v86;
          }
        }
        else if (v80)
        {
          goto LABEL_86;
        }
        swift_bridgeObjectRelease();
        sub_247A9CB3C(v78);
        v74 += v75;
        --v77;
      }
      while (v77);
      swift_bridgeObjectRelease();
      v72 = v113;
      v25 = v107;
      v57 = v108;
    }
    sub_247AAEE48();
    swift_bridgeObjectRelease();
    v87 = (_QWORD *)((char *)v109 + 9 * v110);
    *v87 = 0xD000000000000023;
    v87[1] = 0x8000000247AB0D20;
    if (!v25)
    {
LABEL_80:
      sub_247AAEE48();
      swift_bridgeObjectRelease();
      sub_247A95334(v102);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v103 + 16), *(_QWORD *)(v103 + 40));
      sub_247A9BE08(a1);
      sub_247AAED58();
      swift_bridgeObjectRelease();
      sub_247AAEE60();
      v99 = sub_247AAEB48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (char *)v99;
    }
    v88 = a1 + ((*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80));
    v89 = *(_QWORD *)(v57 + 72);
    swift_bridgeObjectRetain();
    v90 = (char *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      result = (char *)sub_247A9CAB0(v88, v72);
      v91 = *(_QWORD *)(v72 + 64);
      v92 = *(_QWORD *)(v91 + 16);
      v93 = *((_QWORD *)v90 + 2);
      v94 = v93 + v92;
      if (__OFADD__(v93, v92))
        goto LABEL_87;
      swift_bridgeObjectRetain();
      result = (char *)swift_isUniquelyReferenced_nonNull_native();
      if ((_DWORD)result && v94 <= *((_QWORD *)v90 + 3) >> 1)
      {
        if (*(_QWORD *)(v91 + 16))
          goto LABEL_75;
      }
      else
      {
        if (v93 <= v94)
          v95 = v93 + v92;
        else
          v95 = v93;
        result = sub_247AA6BD8(result, v95, 1, v90);
        v90 = result;
        if (*(_QWORD *)(v91 + 16))
        {
LABEL_75:
          v96 = *((_QWORD *)v90 + 2);
          if ((*((_QWORD *)v90 + 3) >> 1) - v96 < v92)
            goto LABEL_92;
          result = (char *)memcpy(&v90[4 * v96 + 32], (const void *)(v91 + 32), 4 * v92);
          if (v92)
          {
            v97 = *((_QWORD *)v90 + 2);
            v55 = __OFADD__(v97, v92);
            v98 = v97 + v92;
            if (v55)
              goto LABEL_96;
            *((_QWORD *)v90 + 2) = v98;
          }
          goto LABEL_65;
        }
      }
      if (v92)
        goto LABEL_88;
LABEL_65:
      swift_bridgeObjectRelease();
      v72 = v113;
      sub_247A9CB3C(v113);
      v88 += v89;
      if (!--v25)
      {
        swift_bridgeObjectRelease();
        goto LABEL_80;
      }
    }
  }
  v44 = a1 + ((*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80));
  v45 = *(_QWORD *)(v108 + 72);
  swift_bridgeObjectRetain();
  v46 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    result = (char *)sub_247A9CAB0(v44, (uint64_t)v13);
    v48 = *((_QWORD *)v13 + 5);
    v49 = *(_QWORD *)(v48 + 16);
    v50 = *((_QWORD *)v46 + 2);
    v51 = v50 + v49;
    if (__OFADD__(v50, v49))
      goto LABEL_82;
    swift_bridgeObjectRetain();
    result = (char *)swift_isUniquelyReferenced_nonNull_native();
    if ((_DWORD)result && v51 <= *((_QWORD *)v46 + 3) >> 1)
    {
      if (*(_QWORD *)(v48 + 16))
        goto LABEL_22;
    }
    else
    {
      if (v50 <= v51)
        v52 = v50 + v49;
      else
        v52 = v50;
      result = sub_247AA6BD8(result, v52, 1, v46);
      v46 = result;
      if (*(_QWORD *)(v48 + 16))
      {
LABEL_22:
        v53 = *((_QWORD *)v46 + 2);
        if ((*((_QWORD *)v46 + 3) >> 1) - v53 < v49)
          goto LABEL_89;
        result = (char *)memcpy(&v46[4 * v53 + 32], (const void *)(v48 + 32), 4 * v49);
        if (v49)
        {
          v54 = *((_QWORD *)v46 + 2);
          v55 = __OFADD__(v54, v49);
          v56 = v54 + v49;
          if (v55)
            goto LABEL_93;
          *((_QWORD *)v46 + 2) = v56;
        }
        goto LABEL_12;
      }
    }
    if (v49)
      break;
LABEL_12:
    swift_bridgeObjectRelease();
    sub_247A9CB3C((uint64_t)v13);
    v44 += v45;
    if (!--v25)
    {
      a1 = v106;
      swift_bridgeObjectRelease();
      v25 = v107;
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  __break(1u);
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

uint64_t sub_247A9CA18()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StocksTabiArticleFeaturesFactory()
{
  return objc_opt_self();
}

void sub_247A9CA5C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2544543C0)
  {
    sub_247A95A2C();
    v0 = sub_247AAF148();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2544543C0);
  }
}

uint64_t sub_247A9CAB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StocksTabiArticleFeatures();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_247A9CAF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544542C0;
  if (!qword_2544542C0)
  {
    sub_247A97EEC();
    result = MEMORY[0x24958A948](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2544542C0);
  }
  return result;
}

uint64_t sub_247A9CB3C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for StocksTabiArticleFeatures();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_247A9CB78(uint64_t a1, uint64_t a2)
{
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
  char *v13;
  int *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  __int128 v32[2];
  __int128 v33[2];
  uint64_t v34;

  v29 = a2;
  v4 = sub_247AAECD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v30 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_247AAE6F8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v25 - v12;
  v14 = (int *)type metadata accessor for StocksTabiArticleScoringWork();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
    return sub_247A95218(MEMORY[0x24BEE4AF8]);
  v17 = *(_QWORD *)(v2 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_workService);
  v27 = v5;
  v28 = v17;
  v26 = v8;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v18(v13, v29, v7);
  v19 = *(_BYTE *)(v2 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_isSubscribed);
  v20 = sub_247A9D000(a1);
  v29 = v4;
  v21 = v20;
  sub_247A954CC(v2 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_articleFeaturesFactory, (uint64_t)v33);
  sub_247A954CC(v2 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_userEmbeddingProvider, (uint64_t)v32);
  v25 = *(_QWORD *)(v2
                  + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_paidAccessChecker);
  v18(v16, (uint64_t)v13, v7);
  v16[v14[5]] = v19;
  v31 = v21;
  sub_247A958B0(0, &qword_2544542A8, &qword_2544540F0, (uint64_t)&protocol descriptor for StocksTabiArticleDataType, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_247A957AC();
  swift_unknownObjectRetain();
  v22 = sub_247AAEF98();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v16[v14[6]] = v22;
  v18(v11, (uint64_t)v13, v7);
  v23 = v30;
  sub_247AAECC8();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v7);
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(&v16[v14[10]], v23, v29);
  sub_247A95814(v33, (uint64_t)&v16[v14[7]]);
  sub_247A95814(v32, (uint64_t)&v16[v14[8]]);
  *(_QWORD *)&v16[v14[9]] = v25;
  sub_247AA3B0C(0, &qword_254454280, MEMORY[0x24BEE13C8], (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD))MEMORY[0x24BEE0460]);
  sub_247A95E64((unint64_t *)&qword_254454110, (uint64_t (*)(uint64_t))type metadata accessor for StocksTabiArticleScoringWork, (uint64_t)&unk_247AB0394);
  sub_247AAEDB8();
  sub_247AA3BEC((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for StocksTabiArticleScoringWork);
  return v34;
}

uint64_t sub_247A9D000(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  __int128 v14;
  uint64_t v15;
  _UNKNOWN **v16;
  uint64_t v17;

  v2 = type metadata accessor for StocksTabiArticleData(0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_247AA0964(0, v6, 0);
    v7 = v17;
    v8 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v9 = *(_QWORD *)(v3 + 72);
    do
    {
      sub_247AA3BA8(v8, (uint64_t)v5);
      v17 = v7;
      v11 = *(_QWORD *)(v7 + 16);
      v10 = *(_QWORD *)(v7 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_247AA0964((_QWORD *)(v10 > 1), v11 + 1, 1);
        v7 = v17;
      }
      v15 = v2;
      v16 = &off_254453A38;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v14);
      sub_247AA3BA8((uint64_t)v5, (uint64_t)boxed_opaque_existential_1);
      *(_QWORD *)(v7 + 16) = v11 + 1;
      sub_247A95814(&v14, v7 + 40 * v11 + 32);
      sub_247AA3BEC((uint64_t)v5, type metadata accessor for StocksTabiArticleData);
      v8 += v9;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_247A9D15C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  unint64_t v11;
  unint64_t v12;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v14;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = sub_247AAE7A0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v19 = MEMORY[0x24BEE4AF8];
    sub_247AA09F0(0, v6, 0);
    v7 = v19;
    v8 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v9 = *(_QWORD *)(v3 + 72);
    v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v10(v5, v8, v2);
      v19 = v7;
      v12 = *(_QWORD *)(v7 + 16);
      v11 = *(_QWORD *)(v7 + 24);
      if (v12 >= v11 >> 1)
        sub_247AA09F0((_QWORD *)(v11 > 1), v12 + 1, 1);
      v17 = v2;
      v18 = MEMORY[0x24BEB1668];
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v16);
      v10((char *)boxed_opaque_existential_1, (uint64_t)v5, v2);
      v14 = v19;
      *(_QWORD *)(v19 + 16) = v12 + 1;
      sub_247A95814(&v16, v14 + 40 * v12 + 32);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v7 = v19;
      v8 += v9;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t NewsHeadlineScorerFactory.stockEntityService.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_247A954CC(v1 + 16, a1);
}

uint64_t NewsHeadlineScorerFactory.watchlistManager.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_247A954CC(v1 + 56, a1);
}

uint64_t NewsHeadlineScorerFactory.appConfigurationManager.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_247A954CC(v1 + 96, a1);
}

uint64_t NewsHeadlineScorerFactory.newsPersonalizationScorer.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_247A954CC(v1 + 136, a1);
}

void *NewsHeadlineScorerFactory.tabiScorer.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 176);
  v2 = v1;
  return v1;
}

uint64_t NewsHeadlineScorerFactory.__allocating_init(stockEntityService:watchlistManager:appConfigurationManager:newsPersonalizationScorer:tabiScorer:)(__int128 *a1, __int128 *a2, __int128 *a3, __int128 *a4, uint64_t a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  sub_247A95814(a1, v10 + 16);
  sub_247A95814(a2, v10 + 56);
  sub_247A95814(a3, v10 + 96);
  sub_247A95814(a4, v10 + 136);
  *(_QWORD *)(v10 + 176) = a5;
  return v10;
}

uint64_t NewsHeadlineScorerFactory.init(stockEntityService:watchlistManager:appConfigurationManager:newsPersonalizationScorer:tabiScorer:)(__int128 *a1, __int128 *a2, __int128 *a3, __int128 *a4, uint64_t a5)
{
  uint64_t v5;

  sub_247A95814(a1, v5 + 16);
  sub_247A95814(a2, v5 + 56);
  sub_247A95814(a3, v5 + 96);
  sub_247A95814(a4, v5 + 136);
  *(_QWORD *)(v5 + 176) = a5;
  return v5;
}

uint64_t NewsHeadlineScorerFactory.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);

  return v0;
}

uint64_t NewsHeadlineScorerFactory.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);

  return swift_deallocClassInstance();
}

uint64_t NewsHeadlineScorerFactory.fetchHeadlineScorer()()
{
  void *v0;
  void *v1;
  uint64_t v2;

  sub_247AA2D88(0, qword_2544544F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB1BE0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_247AAEBF0();
  swift_retain();
  v0 = (void *)sub_247AAEB9C();
  sub_247A9D84C();
  sub_247AAEBC0();
  swift_release();
  swift_release();

  swift_retain();
  v1 = (void *)sub_247AAEB9C();
  sub_247A95910(0, &qword_2544546A0);
  v2 = sub_247AAEBC0();
  swift_release();
  swift_release();

  return v2;
}

uint64_t sub_247A9D5D0()
{
  return sub_247AA39C0();
}

uint64_t sub_247A9D5E4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v27[3];
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[3];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v33 = sub_247AAEA28();
  v5 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  sub_247A954CC(a2 + 16, (uint64_t)v34);
  v9 = v35;
  v10 = v36;
  v11 = __swift_project_boxed_opaque_existential_1(v34, v35);
  v12 = *(_QWORD *)(v8 + 16);
  if (v12)
  {
    v27[0] = v11;
    v27[1] = v10;
    v27[2] = v9;
    v29 = v2;
    v37 = MEMORY[0x24BEE4AF8];
    sub_247AA0900(0, v12, 0);
    v13 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v28 = v8;
    v14 = v8 + v13;
    v15 = *(_QWORD *)(v5 + 72);
    v30 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v31 = v15;
    v32 = v5;
    do
    {
      v16 = v33;
      v30(v7, v14, v33);
      v17 = sub_247AAEA1C();
      v19 = v18;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
      v20 = v37;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_247AA0900(0, *(_QWORD *)(v20 + 16) + 1, 1);
        v20 = v37;
      }
      v22 = *(_QWORD *)(v20 + 16);
      v21 = *(_QWORD *)(v20 + 24);
      if (v22 >= v21 >> 1)
      {
        sub_247AA0900((char *)(v21 > 1), v22 + 1, 1);
        v20 = v37;
      }
      *(_QWORD *)(v20 + 16) = v22 + 1;
      v23 = v20 + 16 * v22;
      *(_QWORD *)(v23 + 32) = v17;
      *(_QWORD *)(v23 + 40) = v19;
      v5 = v32;
      v14 += v31;
      --v12;
    }
    while (v12);
    v8 = v28;
  }
  sub_247AAE9B0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  swift_bridgeObjectRetain();
  v24 = (void *)sub_247AAEB9C();
  sub_247A9D84C();
  v25 = sub_247AAEBCC();
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  return v25;
}

uint64_t sub_247A9D834(uint64_t *a1)
{
  uint64_t v1;

  return sub_247A9D5E4(a1, v1);
}

void sub_247A9D84C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_2544546F8)
  {
    sub_247AA2D88(255, qword_2544544F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB1BE0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    sub_247AAE884();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_2544546F8);
  }
}

uint64_t sub_247A9D8D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;

  sub_247A9D84C();
  v7 = (char *)a3 + *(int *)(v6 + 48);
  *a3 = a2;
  v8 = sub_247AAE884();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v7, a1, v8);
  return swift_bridgeObjectRetain();
}

uint64_t sub_247A9D948(uint64_t *a1, _QWORD *a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  void (*v23)(char *, uint64_t);
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  __int128 v48[2];
  char *v49;

  v4 = sub_247AAE818();
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v43 = (char *)&v40 - v7;
  v8 = sub_247AAE884();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v41 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v49 = (char *)&v40 - v12;
  sub_247A9D84C();
  v14 = v13;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (uint64_t *)((char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = *(int *)(v15 + 48);
  v19 = (char *)v17 + v18;
  v20 = (char *)a1 + v18;
  v21 = *a1;
  *v17 = v21;
  v42 = v21;
  v22 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v22((char *)v17 + v18, v20, v8);
  v47 = *(void (**)(char *, uint64_t))(v9 + 8);
  v23 = v47;
  swift_bridgeObjectRetain();
  v23(v19, v8);
  v24 = (char *)v17 + *(int *)(v14 + 48);
  v22(v24, v20, v8);
  v25 = v49;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v49, v24, v8);
  __swift_project_boxed_opaque_existential_1(a2 + 12, a2[15]);
  v26 = v43;
  sub_247AAE9E0();
  v27 = (uint64_t)v41;
  v22(v41, v25, v8);
  v28 = (uint64_t)v44;
  v29 = v45;
  v30 = v26;
  v31 = v26;
  v32 = v46;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v44, v30, v46);
  sub_247A954CC((uint64_t)(a2 + 17), (uint64_t)v48);
  v33 = (void *)a2[22];
  type metadata accessor for NewsHeadlineScorer(0);
  v34 = swift_allocObject();
  v35 = v33;
  NewsHeadlineScorer.init(stocks:stockEntities:appConfiguration:newsPersonalizationScorer:tabiScorer:)(v42, v27, v28, v48, (uint64_t)v33);
  sub_247AAEBF0();
  v36 = swift_allocObject();
  *(_QWORD *)(v36 + 16) = sub_247AA3D64;
  *(_QWORD *)(v36 + 24) = v34;
  swift_retain();
  v37 = (void *)sub_247AAEB9C();
  sub_247A95910(0, &qword_2544546A0);
  v38 = sub_247AAEBCC();
  swift_release();
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v32);
  v47(v49, v8);
  return v38;
}

uint64_t sub_247A9DC6C(uint64_t *a1)
{
  _QWORD *v1;

  return sub_247A9D948(a1, v1);
}

uint64_t NewsHeadlineScorer.__allocating_init(stocks:stockEntities:appConfiguration:newsPersonalizationScorer:tabiScorer:)(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  NewsHeadlineScorer.init(stocks:stockEntities:appConfiguration:newsPersonalizationScorer:tabiScorer:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t NewsHeadlineScorer.prepareForUse()()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer), *(_QWORD *)(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer + 24));
  return sub_247AAE9BC();
}

uint64_t sub_247A9DD38()
{
  void *v0;
  void *v1;
  uint64_t v2;

  sub_247AA2D88(0, qword_2544544F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB1BE0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_247AAEBF0();
  swift_retain();
  v0 = (void *)sub_247AAEB9C();
  sub_247A9D84C();
  sub_247AAEBC0();
  swift_release();
  swift_release();

  swift_retain();
  v1 = (void *)sub_247AAEB9C();
  sub_247A95910(0, &qword_2544546A0);
  v2 = sub_247AAEBC0();
  swift_release();
  swift_release();

  return v2;
}

uint64_t NewsHeadlineScorer.stockEntities.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247A9DE64(&OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_stockEntities, (uint64_t (*)(_QWORD))MEMORY[0x24BEB1798], a1);
}

uint64_t NewsHeadlineScorer.appConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247A9DE64(&OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_appConfiguration, (uint64_t (*)(_QWORD))MEMORY[0x24BEB16F8], a1);
}

uint64_t sub_247A9DE64@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = v3 + *a1;
  v6 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, v5, v6);
}

uint64_t NewsHeadlineScorer.subscribedStockEntities.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NewsHeadlineScorer.articleScorer.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_247A954CC(v1 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_articleScorer, a1);
}

uint64_t NewsHeadlineScorer.newsPersonalizationScorer.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_247A954CC(v1 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer, a1);
}

void *NewsHeadlineScorer.tabiScorer.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_tabiScorer);
  v2 = v1;
  return v1;
}

uint64_t NewsHeadlineScorer.init(stocks:stockEntities:appConfiguration:newsPersonalizationScorer:tabiScorer:)(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _BYTE v21[16];
  uint64_t v22;
  uint64_t v23[5];
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v6 = v5;
  v10 = sub_247AAE6D4();
  MEMORY[0x24BDAC7A8](v10);
  v11 = v6 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_stockEntities;
  v12 = sub_247AAE884();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, a2, v12);
  v14 = v6 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_appConfiguration;
  v15 = sub_247AAE818();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, a3, v15);
  v22 = a2;
  v17 = sub_247A9E168((void (*)(uint64_t *__return_ptr, uint64_t))sub_247A9E108, (uint64_t)v21, a1);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v6 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_subscribedStockEntities) = v17;
  v23[3] = sub_247AAEA10();
  v23[4] = MEMORY[0x24BEB1A18];
  __swift_allocate_boxed_opaque_existential_1(v23);
  swift_bridgeObjectRetain();
  sub_247AAE80C();
  sub_247AAE6C8();
  v25 = sub_247AAE728();
  v26 = MEMORY[0x24BEB15C0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v24);
  sub_247AAE710();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a2, v12);
  sub_247A95814(&v24, v6 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_articleScorer);
  sub_247A95814(a4, v6 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer);
  *(_QWORD *)(v6 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_tabiScorer) = a5;
  return v6;
}

uint64_t sub_247A9E108@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  sub_247AAEA1C();
  v2 = sub_247AAE878();
  v4 = v3;
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

char *sub_247A9E168(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t *__return_ptr, uint64_t);

  v18 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  if (!v4)
    return (char *)MEMORY[0x24BEE4AF8];
  v6 = *(_QWORD *)(sub_247AAEA28() - 8);
  v7 = a3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  v15 = *(_QWORD *)(v6 + 72);
  swift_bridgeObjectRetain();
  v8 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    v18(&v16, v7);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8;
    }
    v10 = v17;
    if (v17)
    {
      v11 = v16;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_247AA6ACC(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
      v13 = *((_QWORD *)v8 + 2);
      v12 = *((_QWORD *)v8 + 3);
      if (v13 >= v12 >> 1)
        v8 = sub_247AA6ACC((char *)(v12 > 1), v13 + 1, 1, v8);
      *((_QWORD *)v8 + 2) = v13 + 1;
      v9 = &v8[16 * v13];
      *((_QWORD *)v9 + 4) = v11;
      *((_QWORD *)v9 + 5) = v10;
    }
    v7 += v15;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t NewsHeadlineScorer.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_stockEntities;
  v2 = sub_247AAE884();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_appConfiguration;
  v4 = sub_247AAE818();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_articleScorer);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer);

  return v0;
}

uint64_t NewsHeadlineScorer.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_stockEntities;
  v2 = sub_247AAE884();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_appConfiguration;
  v4 = sub_247AAE818();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_articleScorer);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer);

  return swift_deallocClassInstance();
}

uint64_t NewsHeadlineScorer.scoreHeadlines(_:origin:)(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  void *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  id *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  char *v39;
  void (*v40)(char *, char *, uint64_t);
  int isUniquelyReferenced_nonNull_native;
  char v42;
  unint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  _QWORD *v50;
  uint64_t *v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t result;
  _QWORD v56[2];
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  id *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;

  v3 = v2;
  v6 = sub_247AAE704();
  MEMORY[0x24BDAC7A8](v6);
  v60 = (char *)v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_247AAE998();
  v67 = *(_QWORD *)(v8 - 8);
  v68 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v66 = (char *)v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v59 = (char *)v56 - v11;
  v62 = type metadata accessor for ScorableHeadline(0);
  MEMORY[0x24BDAC7A8](v62);
  v61 = (id *)((char *)v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v58 = sub_247AAE6F8();
  v13 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v15 = (char *)v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (char *)sub_247A9E9C4(a2);
  v18 = v17;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer), *(_QWORD *)(v3 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer + 24));
  v19 = sub_247AAE9C8();
  swift_bridgeObjectRetain();
  v64 = v16;
  v65 = a1;
  v20 = sub_247AA1FB4(a1, (uint64_t)v16, v18);
  swift_bridgeObjectRelease();
  v63 = v3;
  v21 = *(void **)(v3 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_tabiScorer);
  if (v21)
  {
    v22 = v21;
    sub_247AAE6EC();
    v23 = sub_247A9CB78(v20, (uint64_t)v15);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v58);
  }
  else
  {
    v23 = sub_247A95218(MEMORY[0x24BEE4AF8]);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_247AA2188(v65, v64, v18, v19, v23);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v63 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_articleScorer), *(_QWORD *)(v63 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_articleScorer + 24));
  sub_247A95E64((unint64_t *)&unk_2544546B8, type metadata accessor for ScorableHeadline, (uint64_t)&protocol conformance descriptor for ScorableHeadline);
  v24 = sub_247AAE890();
  swift_bridgeObjectRelease();
  v25 = *(char **)(v24 + 16);
  v26 = v61;
  if (v25)
  {
    sub_247AA2374();
    v28 = *(_QWORD *)(v27 - 8);
    v29 = v24 + ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80));
    v57 = *(_QWORD *)(v28 + 72);
    v58 = v27;
    v56[1] = v24;
    swift_bridgeObjectRetain();
    v30 = (_QWORD *)MEMORY[0x24BEE4B00];
    while (1)
    {
      v64 = v25;
      sub_247AAE740();
      v31 = objc_msgSend(*v26, sel_identifier);
      v65 = sub_247AAEEF0();
      v33 = v32;

      v34 = v63;
      swift_retain();
      v35 = swift_bridgeObjectRetain();
      sub_247AA2A38(v35, v34);
      swift_bridgeObjectRelease();
      swift_release();
      v36 = v29;
      v37 = v65;
      sub_247AAE734();
      v38 = *(id *)((char *)v26 + *(int *)(v62 + 60));
      v39 = v59;
      sub_247AAE914();
      v40 = *(void (**)(char *, char *, uint64_t))(v67 + 32);
      v40(v66, v39, v68);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v69 = v30;
      v43 = sub_247AA06F8(v37, v33);
      v44 = v30[2];
      v45 = (v42 & 1) == 0;
      v46 = v44 + v45;
      if (__OFADD__(v44, v45))
        break;
      v47 = v42;
      if (v30[3] >= v46)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_247AA1B9C();
      }
      else
      {
        sub_247AA12F4(v46, isUniquelyReferenced_nonNull_native);
        v48 = sub_247AA06F8(v37, v33);
        if ((v47 & 1) != (v49 & 1))
          goto LABEL_22;
        v43 = v48;
      }
      v26 = v61;
      v50 = v69;
      if ((v47 & 1) != 0)
      {
        (*(void (**)(unint64_t, char *, uint64_t))(v67 + 40))(v69[7] + *(_QWORD *)(v67 + 72) * v43, v66, v68);
      }
      else
      {
        v69[(v43 >> 6) + 8] |= 1 << v43;
        v51 = (uint64_t *)(v50[6] + 16 * v43);
        *v51 = v37;
        v51[1] = v33;
        v40((char *)(v50[7] + *(_QWORD *)(v67 + 72) * v43), v66, v68);
        v52 = v50[2];
        v53 = __OFADD__(v52, 1);
        v54 = v52 + 1;
        if (v53)
          goto LABEL_21;
        v50[2] = v54;
        swift_bridgeObjectRetain();
      }
      v30 = v69;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_247AA3BEC((uint64_t)v26, type metadata accessor for ScorableHeadline);
      v29 = v36 + v57;
      v25 = v64 - 1;
      if (v64 == (char *)1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    result = sub_247AAF16C();
    __break(1u);
  }
  else
  {
    v30 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_19:
    swift_bridgeObjectRelease();
    return (uint64_t)v30;
  }
  return result;
}

uint64_t type metadata accessor for ScorableHeadline(uint64_t a1)
{
  return sub_247AA3B74(a1, (uint64_t *)&unk_2544546C8);
}

uint64_t sub_247A9E9C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v16;

  v2 = sub_247AAEA28();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_247AAE758();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v10 == *MEMORY[0x24BEB1630])
  {
    (*(void (**)(char *, uint64_t))(v7 + 96))(v9, v6);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v9, v2);
    sub_247AAEA1C();
    v11 = sub_247AAE878();
    v13 = v12;
    swift_bridgeObjectRelease();
    if (!v13)
      v11 = 0;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    if (v10 != *MEMORY[0x24BEB1620] && v10 != *MEMORY[0x24BEB1628])
    {
      result = sub_247AAF154();
      __break(1u);
      return result;
    }
    return 0;
  }
  return v11;
}

uint64_t sub_247A9EB64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  int *v16;
  uint64_t v18;
  uint64_t v19;

  v4 = v3;
  v18 = a2;
  v19 = a1;
  v6 = sub_247AAE86C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_247AAE7F4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_247AA0130((uint64_t)v13);
  sub_247AAF010();
  v14 = sub_247AAE860();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v15 = v18;
  *(_QWORD *)a3 = v19;
  *((_QWORD *)a3 + 1) = v15;
  v16 = (int *)type metadata accessor for StocksTabiArticleData(0);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&a3[v16[5]], v13, v10);
  *(_QWORD *)&a3[v16[6]] = v14;
  *(_QWORD *)&a3[v16[7]] = v4;
  return swift_unknownObjectRetain();
}

void sub_247A9ECB0(void **a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  void *v20;
  id v21;
  unint64_t v22;
  char v23;
  int v24;
  double v25;

  v9 = *a1;
  swift_getObjectType();
  v10 = objc_msgSend(v9, sel_articleID);
  v11 = sub_247AAEEF0();
  v13 = v12;

  v14 = objc_msgSend(v9, sel_articleID);
  v15 = sub_247AAEEF0();
  v17 = v16;

  if (*(_QWORD *)(a4 + 16) && (v18 = sub_247AA06F8(v15, v17), (v19 & 1) != 0))
  {
    v20 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v18);
    v21 = v20;
  }
  else
  {
    v20 = 0;
  }
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a5 + 16) && (v22 = sub_247AA06F8(v11, v13), (v23 & 1) != 0))
  {
    v24 = 0;
    v25 = *(double *)(*(_QWORD *)(a5 + 56) + 8 * v22);
  }
  else
  {
    v25 = 0.0;
    v24 = 1;
  }
  swift_bridgeObjectRelease();
  FCHeadlineProviding.scorable(withOrigin:newsScoreProfile:tabiScore:)(a2, a3, v20, v25, v24, a6);

}

uint64_t FCHeadlineProviding.scorable(withOrigin:newsScoreProfile:tabiScore:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, double a4@<X3>, int a5@<W4>, _QWORD *a6@<X8>)
{
  void *v6;
  void *v7;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  id v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void (*v42)(char *, unint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t, uint64_t);
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  id v65;
  void *v66;
  void *v67;
  char *v68;
  void (*v69)(char *, char *, uint64_t);
  uint64_t v70;
  char *v71;
  char *v72;
  id v73;
  double v74;
  double v75;
  uint64_t v76;
  int *v77;
  id v78;
  _QWORD v80[2];
  _QWORD *v81;
  void *v82;
  void *v83;
  char *v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  int v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;

  v7 = v6;
  v100 = a5;
  v99 = a4;
  v102 = a1;
  v103 = a2;
  v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_247AA2D88(0, &qword_254454668, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v11);
  v95 = (char *)v80 - v12;
  v98 = sub_247AAE6D4();
  v13 = *(_QWORD *)(v98 - 8);
  v14 = MEMORY[0x24BDAC7A8](v98);
  v84 = (char *)v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v96 = (char *)v80 - v16;
  v17 = sub_247AAE848();
  v18 = *(_QWORD *)(v17 - 8);
  v104 = v17;
  v105 = v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AA2D88(0, (unint64_t *)&unk_254454680, v21, v10);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v86 = (uint64_t)v80 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v85 = (char *)v80 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)v80 - v27;
  v94 = sub_247AAE86C();
  v93 = *(_QWORD *)(v94 - 8);
  MEMORY[0x24BDAC7A8](v94);
  v30 = (char *)v80 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_247AAE7F4();
  v91 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v32 = (char *)v80 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AA0130((uint64_t)v32);
  sub_247AAF010();
  v102 = v30;
  sub_247AAE854();
  v108 = sub_247AAE7E8();
  v109 = MEMORY[0x24BEB16A8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v107);
  sub_247AAE770();
  v90 = v32;
  v33 = sub_247AAE7AC();
  v89 = sub_247A9D15C(v33);
  swift_bridgeObjectRelease();
  v34 = objc_msgSend(v6, sel_sourceChannelID);
  v97 = v13;
  if (v34)
  {
    v35 = v34;
    v88 = sub_247AAEEF0();
    v87 = v36;

  }
  else
  {
    v88 = 0;
    v87 = 0xE000000000000000;
  }
  v37 = sub_247AAE860();
  v38 = *(_QWORD *)(v37 + 16);
  v101 = v28;
  v39 = v105;
  if (v38)
  {
    v81 = a6;
    v82 = a3;
    v83 = v6;
    v106 = MEMORY[0x24BEE4AF8];
    sub_247AA0900(0, v38, 0);
    v40 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
    v80[1] = v37;
    v41 = v37 + v40;
    v103 = *(_QWORD *)(v39 + 72);
    v42 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 16);
    do
    {
      v43 = v104;
      v42(v20, v41, v104);
      v44 = sub_247AAE824();
      v46 = v45;
      (*(void (**)(char *, uint64_t))(v105 + 8))(v20, v43);
      v47 = v106;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_247AA0900(0, *(_QWORD *)(v47 + 16) + 1, 1);
        v47 = v106;
      }
      v49 = *(_QWORD *)(v47 + 16);
      v48 = *(_QWORD *)(v47 + 24);
      if (v49 >= v48 >> 1)
      {
        sub_247AA0900((char *)(v48 > 1), v49 + 1, 1);
        v47 = v106;
      }
      *(_QWORD *)(v47 + 16) = v49 + 1;
      v50 = v47 + 16 * v49;
      *(_QWORD *)(v50 + 32) = v44;
      *(_QWORD *)(v50 + 40) = v46;
      v41 += v103;
      --v38;
    }
    while (v38);
    swift_bridgeObjectRelease();
    v7 = v83;
    a3 = v82;
    a6 = v81;
    v28 = v101;
    v39 = v105;
  }
  else
  {
    swift_bridgeObjectRelease();
    v47 = MEMORY[0x24BEE4AF8];
  }
  v51 = (uint64_t)v85;
  objc_msgSend(v7, sel_globalUserFeedback);
  v53 = v52;
  sub_247AA2DE0((uint64_t)v28, v51);
  v54 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48);
  v55 = v104;
  v56 = v54(v51, 1, v104);
  v57 = v97;
  if (v56 == 1)
  {
    sub_247AA3C8C(v51, (unint64_t *)&unk_254454680, (uint64_t (*)(uint64_t))MEMORY[0x24BEB1758]);
    v58 = 0;
  }
  else
  {
    sub_247AAE830();
    v58 = v59;
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v51, v55);
  }
  v60 = v86;
  sub_247AA2DE0((uint64_t)v28, v86);
  if (v54(v60, 1, v55) == 1)
  {
    sub_247AA3C8C(v60, (unint64_t *)&unk_254454680, (uint64_t (*)(uint64_t))MEMORY[0x24BEB1758]);
    v61 = 0;
  }
  else
  {
    sub_247AAE83C();
    v61 = v62;
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v60, v55);
  }
  v63 = v98;
  v64 = v100;
  v65 = objc_msgSend(v7, sel_publishDate);
  if (v65)
  {
    v66 = v65;
    v67 = a3;
    v68 = v84;
    sub_247AAE6BC();

    v69 = *(void (**)(char *, char *, uint64_t))(v57 + 32);
    v70 = (uint64_t)v95;
    v71 = v68;
    a3 = v67;
    v69(v95, v71, v63);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v57 + 56))(v70, 0, 1, v63);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v70, 1, v63) != 1)
    {
      v72 = v96;
      v69(v96, (char *)v70, v63);
      goto LABEL_24;
    }
  }
  else
  {
    v70 = (uint64_t)v95;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56))(v95, 1, 1, v63);
  }
  v72 = v96;
  sub_247AAE6C8();
  sub_247AA3C8C(v70, &qword_254454668, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
LABEL_24:
  v73 = objc_msgSend(v7, sel_feedHalfLifeMilliseconds);
  sub_247AA3C8C((uint64_t)v101, (unint64_t *)&unk_254454680, (uint64_t (*)(uint64_t))MEMORY[0x24BEB1758]);
  (*(void (**)(char *, uint64_t))(v93 + 8))(v102, v94);
  (*(void (**)(char *, uint64_t))(v91 + 8))(v90, v92);
  if ((v64 & 1) != 0)
    v74 = 0.0;
  else
    v74 = v99;
  v75 = (double)(unint64_t)v73;
  *a6 = v7;
  sub_247A95814(&v107, (uint64_t)(a6 + 1));
  v76 = v88;
  a6[6] = v89;
  a6[7] = v76;
  a6[8] = v87;
  a6[9] = v47;
  a6[10] = v53;
  a6[11] = v58;
  a6[12] = v61;
  v77 = (int *)type metadata accessor for ScorableHeadline(0);
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))((char *)a6 + v77[12], v72, v63);
  *(double *)((char *)a6 + v77[13]) = v75;
  *((_BYTE *)a6 + v77[14]) = 0;
  *(_QWORD *)((char *)a6 + v77[15]) = a3;
  *(double *)((char *)a6 + v77[16]) = v74;
  v78 = a3;
  return swift_unknownObjectRetain();
}

uint64_t NewsHeadlineScorer.applyImportanceScoreRankPenalty(_:remainingSymbols:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char *v8;
  uint64_t v9;
  _BYTE v11[16];

  v4 = sub_247AAEA10();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_247AAE80C();
  sub_247AAE9F8();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  swift_retain();
  v8 = sub_247AA2E3C(a2);
  swift_release();
  swift_bridgeObjectRetain();
  v9 = sub_247AA23EC(a1, v8);
  swift_bridgeObjectRelease_n();
  return v9;
}

uint64_t sub_247A9F698@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, char *a3@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  unsigned int v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  char *v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t (*v34)(char *, uint64_t);
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  BOOL v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[2];
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v65 = a3;
  v66 = a2;
  v4 = sub_247AAE848();
  v69 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v52 - v8;
  v10 = sub_247AAE86C();
  v67 = *(_QWORD *)(v10 - 8);
  v68 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v64 = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_247AAE998();
  v62 = *(_QWORD *)(v12 - 8);
  v63 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_247AAEA34();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v19(v18, a1, v15);
  v20 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v18, v15);
  if (v20 != *MEMORY[0x24BEB1C08])
  {
    v19(v65, a1, v15);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  v55 = v20;
  v56 = v16;
  v21 = *(void (**)(char *, uint64_t))(v16 + 96);
  v57 = v15;
  v21(v18, v15);
  v22 = *(_QWORD *)v18;
  sub_247AA3A08();
  v24 = v23;
  (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v14, &v18[*(int *)(v23 + 48)], v63);
  v58 = v14;
  sub_247AAE89C();
  v26 = v25;
  swift_getObjectType();
  v27 = v64;
  sub_247AAF010();
  v28 = sub_247AAE860();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v27, v68);
  v29 = *(char **)(v28 + 16);
  if (v29)
  {
    v53 = v24;
    v54 = v22;
    v68 = v28 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
    v67 = *(_QWORD *)(v69 + 72);
    v30 = *(void (**)(char *, uint64_t, uint64_t))(v69 + 16);
    v52[1] = v28;
    swift_bridgeObjectRetain();
    v31 = 0;
    v32 = 0;
    v52[0] = v66 + 9;
    v33 = v65;
    v64 = v29;
    while (1)
    {
      v30(v9, v68 + v67 * (_QWORD)v31, v4);
      sub_247AAE830();
      v36 = v35;
      v30(v7, (uint64_t)v9, v4);
      if (v26 >= v36)
        goto LABEL_5;
      v37 = sub_247AAE824();
      v39 = v38;
      v40 = v66[2];
      if (!v40)
        goto LABEL_4;
      v41 = v37;
      if ((v66[4] != v37 || v66[5] != v38) && (sub_247AAF160() & 1) == 0)
      {
        if (v40 == 1)
          goto LABEL_4;
        if (v66[6] != v41 || v66[7] != v39)
        {
          result = sub_247AAF160();
          if ((result & 1) == 0)
            break;
        }
      }
LABEL_12:
      swift_bridgeObjectRelease();
      v34 = *(uint64_t (**)(char *, uint64_t))(v69 + 8);
      result = v34(v7, v4);
      v43 = __OFADD__(v32++, 1);
      v33 = v65;
      if (v43)
      {
        __break(1u);
        goto LABEL_34;
      }
      v29 = v64;
LABEL_6:
      ++v31;
      v34(v9, v4);
      if (v31 == v29)
      {
        swift_bridgeObjectRelease_n();
        v22 = v54;
        v47 = v32;
        v24 = v53;
        goto LABEL_31;
      }
    }
    if (v40 != 2)
    {
      v44 = (_QWORD *)v52[0];
      v45 = 2;
      while (!__OFADD__(v45, 1))
      {
        if (*(v44 - 1) == v41 && *v44 == v39)
          goto LABEL_12;
        v60 = v45;
        v61 = v44;
        v59 = v45 + 1;
        result = sub_247AAF160();
        if ((result & 1) != 0)
          goto LABEL_12;
        v44 = v61 + 2;
        v45 = v60 + 1;
        if (v59 == v40)
          goto LABEL_4;
      }
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
      return result;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    v29 = v64;
    v33 = v65;
LABEL_5:
    v34 = *(uint64_t (**)(char *, uint64_t))(v69 + 8);
    v34(v7, v4);
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  v47 = 0;
  v33 = v65;
LABEL_31:
  v69 = *(int *)(v24 + 48);
  *(_QWORD *)v33 = v22;
  swift_unknownObjectRetain();
  v48 = v58;
  sub_247AAE974();
  sub_247AAE8D8();
  sub_247AAE908();
  sub_247AAE8FC();
  sub_247AAE8E4();
  v68 = sub_247AAE950();
  sub_247AAE92C();
  sub_247AAE8CC();
  sub_247AAE71C();
  v50 = v49;
  sub_247AAE8C0();
  sub_247AAE71C();
  v67 = v51;
  sub_247AAE8B4();
  sub_247AAE71C();
  sub_247AAE8F0();
  sub_247AAE920();
  sub_247AAE95C();
  result = sub_247AAE8A8();
  if (__OFADD__(result, v47))
    goto LABEL_35;
  sub_247AAE98C();
  v69 = v50;
  sub_247AAE980();
  sub_247AAE968();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v48, v63);
  return (*(uint64_t (**)(char *, _QWORD, uint64_t))(v56 + 104))(v33, v55, v57);
}

uint64_t NewsHeadlineScorer.applyChannelDiversificationPenalty(_:priorChannelIDs:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  char v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  char v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t result;
  _QWORD v35[2];
  uint64_t v36;
  _QWORD *v37;

  v4 = sub_247AAEA10();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AAE80C();
  sub_247AAEA04();
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v10 = *(_QWORD *)(a2 + 16);
  if (!v10)
  {
    v12 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_24:
    swift_bridgeObjectRetain();
    v33 = sub_247AA2554(a1, (uint64_t)v12, v9);
    swift_bridgeObjectRelease_n();
    return v33;
  }
  v36 = a1;
  swift_bridgeObjectRetain();
  v35[1] = a2;
  v11 = (uint64_t *)(a2 + 40);
  v12 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    v14 = *(v11 - 1);
    v13 = *v11;
    v15 = v12[2];
    swift_bridgeObjectRetain_n();
    if (!v15 || (v16 = sub_247AA06F8(v14, v13), (v17 & 1) == 0))
    {
      v19 = 1;
      goto LABEL_11;
    }
    v18 = *(_QWORD *)(v12[7] + 8 * v16);
    v19 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
LABEL_11:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v37 = v12;
    v22 = sub_247AA06F8(v14, v13);
    v23 = v12[2];
    v24 = (v21 & 1) == 0;
    v25 = v23 + v24;
    if (__OFADD__(v23, v24))
      goto LABEL_25;
    v26 = v21;
    if (v12[3] >= v25)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v12 = v37;
        if ((v21 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_247AA1DF4();
        v12 = v37;
        if ((v26 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_247AA1658(v25, isUniquelyReferenced_nonNull_native);
      v27 = sub_247AA06F8(v14, v13);
      if ((v26 & 1) != (v28 & 1))
        goto LABEL_27;
      v22 = v27;
      v12 = v37;
      if ((v26 & 1) != 0)
      {
LABEL_3:
        *(_QWORD *)(v12[7] + 8 * v22) = v19;
        goto LABEL_4;
      }
    }
    v12[(v22 >> 6) + 8] |= 1 << v22;
    v29 = (uint64_t *)(v12[6] + 16 * v22);
    *v29 = v14;
    v29[1] = v13;
    *(_QWORD *)(v12[7] + 8 * v22) = v19;
    v30 = v12[2];
    v31 = __OFADD__(v30, 1);
    v32 = v30 + 1;
    if (v31)
      goto LABEL_26;
    v12[2] = v32;
    swift_bridgeObjectRetain();
LABEL_4:
    v11 += 2;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    if (!--v10)
    {
      swift_bridgeObjectRelease();
      a1 = v36;
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  result = sub_247AAF16C();
  __break(1u);
  return result;
}

uint64_t sub_247A9FF44()
{
  _QWORD *v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer), *(_QWORD *)(*v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer + 24));
  return sub_247AAE9BC();
}

uint64_t sub_247A9FF90(unint64_t a1, uint64_t a2)
{
  return NewsHeadlineScorer.scoreHeadlines(_:origin:)(a1, a2);
}

uint64_t sub_247A9FFB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char *v8;
  uint64_t v9;
  _BYTE v11[16];

  v4 = sub_247AAEA10();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_247AAE80C();
  sub_247AAE9F8();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  swift_retain();
  v8 = sub_247AA2E3C(a2);
  swift_release();
  swift_bridgeObjectRetain();
  v9 = sub_247AA23EC(a1, v8);
  swift_bridgeObjectRelease_n();
  return v9;
}

uint64_t sub_247AA00B8(uint64_t a1, uint64_t a2)
{
  return NewsHeadlineScorer.applyChannelDiversificationPenalty(_:priorChannelIDs:)(a1, a2);
}

uint64_t sub_247AA00D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = sub_247AAE7F4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_247AA0118()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_247AA0124()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_247AA0130@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v3 = sub_247AAE7E8();
  v4 = MEMORY[0x24BDAC7A8](v3);
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_247AAEF14();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AA2D88(0, &qword_254454678, (uint64_t (*)(uint64_t))MEMORY[0x24BEB16C0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v20 - v10;
  if ((objc_msgSend(v1, sel_respondsToSelector_, sel_stocksFields) & 1) != 0
    && (v12 = objc_msgSend(v1, sel_stocksFields)) != 0
    && (v13 = objc_msgSend(v12, sel_stocksScoresJSON),
        swift_unknownObjectRelease(),
        v13))
  {
    v20[0] = a1;
    sub_247AAEEF0();

    sub_247AAE5D8();
    swift_allocObject();
    sub_247AAE5CC();
    sub_247AAEF08();
    v14 = sub_247AAEEFC();
    v16 = v15;
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if (v16 >> 60 == 15)
    {
      __break(1u);
    }
    else
    {
      v18 = sub_247AAE7F4();
      sub_247A95E64((unint64_t *)&unk_254453FF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB16C0], MEMORY[0x24BEB16D0]);
      sub_247AAE5C0();
      sub_247A996AC(v14, v16);
      swift_release();
      v19 = *(_QWORD *)(v18 - 8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v11, 0, 1, v18);
      return (*(uint64_t (**)(_QWORD, char *, uint64_t))(v19 + 32))(v20[0], v11, v18);
    }
  }
  else
  {
    sub_247AAE7D0();
    sub_247AAE7D0();
    return sub_247AAE764();
  }
  return result;
}

uint64_t ScorableHeadline.headline.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t ScorableHeadline.globalCohort.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_247A954CC(v1 + 8, a1);
}

uint64_t ScorableHeadline.cohorts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScorableHeadline.sourceChannelID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScorableHeadline.topics.getter()
{
  return swift_bridgeObjectRetain();
}

double ScorableHeadline.globalScore.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 80);
}

double ScorableHeadline.importanceScore.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 88);
}

double ScorableHeadline.publisherPrior.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 96);
}

uint64_t ScorableHeadline.publishedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ScorableHeadline(0) + 48);
  v4 = sub_247AAE6D4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

double ScorableHeadline.halfLife.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for ScorableHeadline(0) + 52));
}

uint64_t ScorableHeadline.hasBeenRead.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ScorableHeadline(0) + 56));
}

void *ScorableHeadline.newsScoreProfile.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for ScorableHeadline(0) + 60));
  v2 = v1;
  return v1;
}

double ScorableHeadline.tabiScore.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for ScorableHeadline(0) + 64));
}

double ScorableHeadline.newsPersonalizationScore.getter()
{
  uint64_t v0;
  void *v1;
  double result;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for ScorableHeadline(0) + 60));
  if (!v1)
    return 0.0;
  objc_msgSend(v1, sel_personalizationScore);
  return result;
}

uint64_t sub_247AA05D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_247A954CC(v1 + 8, a1);
}

uint64_t sub_247AA05F0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_247AA05F8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_247AA0624()
{
  return swift_bridgeObjectRetain();
}

double sub_247AA062C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  double result;

  v2 = *(void **)(v1 + *(int *)(a1 + 60));
  if (!v2)
    return 0.0;
  objc_msgSend(v2, sel_personalizationScore);
  return result;
}

double sub_247AA064C()
{
  uint64_t v0;

  return *(double *)(v0 + 80);
}

double sub_247AA0654(uint64_t a1)
{
  uint64_t v1;

  return *(double *)(v1 + *(int *)(a1 + 64));
}

double sub_247AA0660()
{
  uint64_t v0;

  return *(double *)(v0 + 88);
}

double sub_247AA0668()
{
  uint64_t v0;

  return *(double *)(v0 + 96);
}

uint64_t sub_247AA0670@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 48);
  v5 = sub_247AAE6D4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

double sub_247AA06B0(uint64_t a1)
{
  uint64_t v1;

  return *(double *)(v1 + *(int *)(a1 + 52));
}

uint64_t sub_247AA06BC(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 56));
}

unint64_t sub_247AA06C8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_247AAF064();
  return sub_247AA075C(a1, v2);
}

unint64_t sub_247AA06F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_247AAF1A8();
  sub_247AAEF2C();
  v4 = sub_247AAF1C0();
  return sub_247AA0820(a1, a2, v4);
}

unint64_t sub_247AA075C(uint64_t a1, uint64_t a2)
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
      sub_247AA3E38(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x24958A4B0](v9, a1);
      sub_247AA3E74((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_247AA0820(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_247AAF160() & 1) == 0)
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
      while (!v14 && (sub_247AAF160() & 1) == 0);
    }
  }
  return v6;
}

char *sub_247AA0900(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_247AA0AA8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_247AA091C(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_247AA0E14(a1, a2, a3, (_QWORD *)*v3, &qword_2544543A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D048]);
  *v3 = result;
  return result;
}

char *sub_247AA0948(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_247AA0BB4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_247AA0964(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_247AA0CB8(a1, a2, a3, *v3, &qword_2544543B0, &qword_2544540F0, (uint64_t)&protocol descriptor for StocksTabiArticleDataType);
  *v3 = result;
  return result;
}

size_t sub_247AA0998(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_247AA0E14(a1, a2, a3, (_QWORD *)*v3, &qword_254454718, type metadata accessor for ScorableHeadline);
  *v3 = result;
  return result;
}

size_t sub_247AA09C4(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_247AA0E14(a1, a2, a3, (_QWORD *)*v3, &qword_254454710, type metadata accessor for StocksTabiArticleData);
  *v3 = result;
  return result;
}

_QWORD *sub_247AA09F0(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_247AA0CB8(a1, a2, a3, *v3, &qword_254454388, (unint64_t *)&unk_254453FE0, MEMORY[0x24BEB15A8]);
  *v3 = result;
  return result;
}

size_t sub_247AA0A24(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_247AA0E14(a1, a2, a3, (_QWORD *)*v3, &qword_254454398, (uint64_t (*)(uint64_t))MEMORY[0x24BEB1C10]);
  *v3 = result;
  return result;
}

size_t sub_247AA0A50(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_247AA0E14(a1, a2, a3, (_QWORD *)*v3, &qword_2544543B8, (uint64_t (*)(uint64_t))type metadata accessor for StocksTabiArticleFeatures);
  *v3 = result;
  return result;
}

size_t sub_247AA0A7C(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_247AA0E14(a1, a2, a3, (_QWORD *)*v3, &qword_254454380, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  *v3 = result;
  return result;
}

char *sub_247AA0AA8(char *result, int64_t a2, char a3, char *a4)
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
    sub_247AA3AC8(0, (unint64_t *)&qword_254454720);
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_247AA0BB4(char *result, int64_t a2, char a3, char *a4)
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
    sub_247AA3AC8(0, (unint64_t *)&unk_2544543D0);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

_QWORD *sub_247AA0CB8(_QWORD *result, int64_t a2, char a3, _QWORD *a4, unint64_t *a5, unint64_t *a6, uint64_t a7)
{
  char v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;

  v9 = (char)result;
  if ((a3 & 1) != 0)
  {
    v10 = a4[3];
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
  v12 = a4[2];
  if (v11 <= v12)
    v13 = a4[2];
  else
    v13 = v11;
  if (v13)
  {
    sub_247A958B0(0, a5, a6, a7, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v14 = (_QWORD *)swift_allocObject();
    v15 = _swift_stdlib_malloc_size(v14);
    v14[2] = v12;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 40);
  }
  else
  {
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v9 & 1) != 0)
  {
    if (v14 != a4 || v14 + 4 >= &a4[5 * v12 + 4])
      memmove(v14 + 4, a4 + 4, 40 * v12);
    a4[2] = 0;
  }
  else
  {
    sub_247A95910(0, a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v14;
}

size_t sub_247AA0E14(size_t result, int64_t a2, char a3, _QWORD *a4, unint64_t *a5, uint64_t (*a6)(uint64_t))
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  unint64_t v19;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
  sub_247AA2D88(0, a5, a6, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_29;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  v18 = *(_QWORD *)(a6(0) - 8);
  if ((v8 & 1) != 0)
  {
    if (v16 < a4
      || (v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(_QWORD *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v16;
}

uint64_t sub_247AA0F98(uint64_t a1, char a2)
{
  return sub_247AA0FE0(a1, a2, &qword_254454350, &qword_2544540D8, (uint64_t)&protocol descriptor for StocksEntityMetadataType, (void (*)(uint64_t, _BYTE *))sub_247A95814);
}

uint64_t sub_247AA0FBC(uint64_t a1, char a2)
{
  return sub_247AA0FE0(a1, a2, (unint64_t *)&unk_254454340, &qword_2544540C8, (uint64_t)&protocol descriptor for StocksEntityCohortType, (void (*)(uint64_t, _BYTE *))sub_247A95814);
}

uint64_t sub_247AA0FE0(uint64_t a1, char a2, unint64_t *a3, unint64_t *a4, uint64_t a5, void (*a6)(uint64_t, _BYTE *))
{
  uint64_t *v6;
  uint64_t *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  _BYTE v43[40];

  v8 = v6;
  v10 = *v6;
  sub_247AA395C(0, a3, a4);
  v42 = a2;
  v11 = sub_247AAF0C4();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_39;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v40 = v6;
  v41 = v10 + 64;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  else
    v14 = -1;
  v15 = v14 & *(_QWORD *)(v10 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  result = swift_retain();
  v19 = 0;
  while (1)
  {
    if (v15)
    {
      v22 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v23 = v22 | (v19 << 6);
      goto LABEL_20;
    }
    if (__OFADD__(v19++, 1))
      goto LABEL_41;
    if (v19 >= v16)
      break;
    v25 = (_QWORD *)(v10 + 64);
    v26 = *(_QWORD *)(v41 + 8 * v19);
    if (!v26)
    {
      v27 = v19 + 1;
      if (v19 + 1 >= v16)
      {
LABEL_32:
        swift_release();
        v8 = v40;
        if ((v42 & 1) == 0)
          goto LABEL_39;
        goto LABEL_35;
      }
      v26 = *(_QWORD *)(v41 + 8 * v27);
      if (!v26)
      {
        while (1)
        {
          v19 = v27 + 1;
          if (__OFADD__(v27, 1))
            break;
          if (v19 >= v16)
            goto LABEL_32;
          v26 = *(_QWORD *)(v41 + 8 * v19);
          ++v27;
          if (v26)
            goto LABEL_19;
        }
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      ++v19;
    }
LABEL_19:
    v15 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v19 << 6);
LABEL_20:
    v28 = (uint64_t *)(*(_QWORD *)(v10 + 48) + 16 * v23);
    v30 = *v28;
    v29 = v28[1];
    v31 = *(_QWORD *)(v10 + 56) + 40 * v23;
    if ((v42 & 1) != 0)
    {
      a6(v31, v43);
    }
    else
    {
      sub_247A954CC(v31, (uint64_t)v43);
      swift_bridgeObjectRetain();
    }
    sub_247AAF1A8();
    sub_247AAEF2C();
    result = sub_247AAF1C0();
    v32 = -1 << *(_BYTE *)(v12 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v17 + 8 * (v33 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v17 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v17 + 8 * v34);
      }
      while (v38 == -1);
      v20 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    v21 = (_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v20);
    *v21 = v30;
    v21[1] = v29;
    result = ((uint64_t (*)(_BYTE *, unint64_t))a6)(v43, *(_QWORD *)(v12 + 56) + 40 * v20);
    ++*(_QWORD *)(v12 + 16);
  }
  swift_release();
  v8 = v40;
  v25 = (_QWORD *)(v10 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_39;
LABEL_35:
  v39 = 1 << *(_BYTE *)(v10 + 32);
  if (v39 >= 64)
    bzero(v25, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v39;
  *(_QWORD *)(v10 + 16) = 0;
LABEL_39:
  result = swift_release();
  *v8 = v12;
  return result;
}

uint64_t sub_247AA12F4(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;

  v3 = v2;
  v45 = sub_247AAE998();
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  sub_247AA3C28();
  v43 = a2;
  v8 = sub_247AAF0C4();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v43 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v7 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = v7;
      v26 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
      v28 = *v26;
      v27 = v26[1];
      v29 = *(_QWORD *)(v5 + 72);
      v30 = v24 + v29 * v20;
      if ((v43 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v44, v30, v45);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v30, v45);
        swift_bridgeObjectRetain();
      }
      sub_247AAF1A8();
      sub_247AAEF2C();
      result = sub_247AAF1C0();
      v31 = -1 << *(_BYTE *)(v9 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v14 + 8 * v33);
        }
        while (v37 == -1);
        v17 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v17);
      *v18 = v28;
      v18[1] = v27;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v9 + 56) + v29 * v17, v44, v45);
      ++*(_QWORD *)(v9 + 16);
      v7 = v25;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

uint64_t sub_247AA1658(uint64_t a1, char a2)
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
  sub_247AA3B0C(0, &qword_254454360, MEMORY[0x24BEE1768], (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD))MEMORY[0x24BEE30A0]);
  v37 = a2;
  v6 = sub_247AAF0C4();
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
    sub_247AAF1A8();
    sub_247AAEF2C();
    result = sub_247AAF1C0();
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

void *sub_247AA1974()
{
  return sub_247AA19BC(&qword_254454350, &qword_2544540D8, (uint64_t)&protocol descriptor for StocksEntityMetadataType, (void (*)(_BYTE *, uint64_t))sub_247A95814);
}

void *sub_247AA1998()
{
  return sub_247AA19BC((unint64_t *)&unk_254454340, &qword_2544540C8, (uint64_t)&protocol descriptor for StocksEntityCohortType, (void (*)(_BYTE *, uint64_t))sub_247A95814);
}

void *sub_247AA19BC(unint64_t *a1, unint64_t *a2, uint64_t a3, void (*a4)(_BYTE *, uint64_t))
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  _BYTE v31[40];

  v5 = v4;
  sub_247AA395C(0, a1, a2);
  v6 = *v4;
  v7 = sub_247AAF0B8();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_26:
    *v5 = v8;
    return result;
  }
  v29 = v5;
  result = (void *)(v7 + 64);
  v10 = v6 + 64;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 64), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 64);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v13++, 1))
      goto LABEL_28;
    if (v13 >= v17)
    {
LABEL_24:
      result = (void *)swift_release();
      v5 = v29;
      goto LABEL_26;
    }
    v27 = *(_QWORD *)(v10 + 8 * v13);
    if (!v27)
      break;
LABEL_23:
    v16 = (v27 - 1) & v27;
    v19 = __clz(__rbit64(v27)) + (v13 << 6);
LABEL_12:
    v20 = 16 * v19;
    v21 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v19);
    v22 = *v21;
    v23 = v21[1];
    v24 = 40 * v19;
    sub_247A954CC(*(_QWORD *)(v6 + 56) + 40 * v19, (uint64_t)v31);
    v25 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v20);
    *v25 = v22;
    v25[1] = v23;
    a4(v31, *(_QWORD *)(v8 + 56) + v24);
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v13 + 1;
  if (v13 + 1 >= v17)
    goto LABEL_24;
  v27 = *(_QWORD *)(v10 + 8 * v28);
  if (v27)
  {
    ++v13;
    goto LABEL_23;
  }
  while (1)
  {
    v13 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v13 >= v17)
      goto LABEL_24;
    v27 = *(_QWORD *)(v10 + 8 * v13);
    ++v28;
    if (v27)
      goto LABEL_23;
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

void *sub_247AA1B9C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_247AAE998();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AA3C28();
  v31 = v0;
  v4 = *v0;
  v5 = sub_247AAF0B8();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_247AA1DF4()
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
  sub_247AA3B0C(0, &qword_254454360, MEMORY[0x24BEE1768], (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD))MEMORY[0x24BEE30A0]);
  v2 = *v0;
  v3 = sub_247AAF0B8();
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

size_t sub_247AA1FB4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  size_t result;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = v3;
  v19 = a2;
  v20 = a3;
  v6 = type metadata accessor for StocksTabiArticleData(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_15;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    if (!v10)
      return v11;
    v21 = MEMORY[0x24BEE4AF8];
    result = sub_247AA09C4(0, v10 & ~(v10 >> 63), 0);
    if (v10 < 0)
      break;
    v13 = 0;
    v11 = v21;
    v17 = v4;
    v18 = a1 & 0xC000000000000001;
    v14 = a1;
    while (v10 != v13)
    {
      if (v18)
        MEMORY[0x24958A4BC](v13, a1);
      else
        swift_unknownObjectRetain();
      swift_getObjectType();
      sub_247A9EB64(v19, v20, v9);
      swift_unknownObjectRelease();
      v21 = v11;
      v16 = *(_QWORD *)(v11 + 16);
      v15 = *(_QWORD *)(v11 + 24);
      v4 = v16 + 1;
      if (v16 >= v15 >> 1)
      {
        sub_247AA09C4(v15 > 1, v16 + 1, 1);
        v11 = v21;
      }
      ++v13;
      *(_QWORD *)(v11 + 16) = v4;
      sub_247AA3CD0((uint64_t)v9, v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v16, type metadata accessor for StocksTabiArticleData);
      a1 = v14;
      if (v10 == v13)
        return v11;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v10 = sub_247AAF0AC();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

size_t sub_247AA2188(unint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  size_t result;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;

  v6 = v5;
  v22 = a4;
  v23 = a5;
  v20 = a2;
  v21 = a3;
  v8 = type metadata accessor for ScorableHeadline(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (unint64_t *)((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a1 >> 62)
    goto LABEL_18;
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v13 = MEMORY[0x24BEE4AF8];
    if (!v12)
      return v13;
    v25 = MEMORY[0x24BEE4AF8];
    result = sub_247AA0998(0, v12 & ~(v12 >> 63), 0);
    if (v12 < 0)
      break;
    v15 = 0;
    v13 = v25;
    v19 = a1 & 0xC000000000000001;
    while (v12 != v15)
    {
      if (v19)
      {
        v16 = (void *)MEMORY[0x24958A4BC](v15, a1);
      }
      else
      {
        v16 = *(void **)(a1 + 8 * v15 + 32);
        swift_unknownObjectRetain();
      }
      v24 = v16;
      sub_247A9ECB0(&v24, v20, v21, v22, v23, v11);
      if (v6)
      {
        swift_release();
        swift_unknownObjectRelease();
        return v13;
      }
      v6 = 0;
      swift_unknownObjectRelease();
      v25 = v13;
      v18 = *(_QWORD *)(v13 + 16);
      v17 = *(_QWORD *)(v13 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_247AA0998(v17 > 1, v18 + 1, 1);
        v13 = v25;
      }
      ++v15;
      *(_QWORD *)(v13 + 16) = v18 + 1;
      sub_247AA3CD0((uint64_t)v11, v13+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v18, type metadata accessor for ScorableHeadline);
      if (v12 == v15)
        return v13;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    v12 = sub_247AAF0AC();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_247AA2374()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254454670)
  {
    type metadata accessor for ScorableHeadline(255);
    sub_247A95E64((unint64_t *)&unk_2544546B8, type metadata accessor for ScorableHeadline, (uint64_t)&protocol conformance descriptor for ScorableHeadline);
    v0 = sub_247AAE74C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254454670);
  }
}

uint64_t sub_247AA23EC(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  v3 = v2;
  v17 = a2;
  v16 = sub_247AAEA34();
  v5 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  if (v8)
  {
    v18 = MEMORY[0x24BEE4AF8];
    sub_247AA0A24(0, v8, 0);
    v9 = v18;
    v15 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v10 = a1 + v15;
    v11 = *(_QWORD *)(v5 + 72);
    while (1)
    {
      sub_247A9F698(v10, v17, v7);
      if (v3)
        break;
      v3 = 0;
      v18 = v9;
      v13 = *(_QWORD *)(v9 + 16);
      v12 = *(_QWORD *)(v9 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_247AA0A24(v12 > 1, v13 + 1, 1);
        v9 = v18;
      }
      *(_QWORD *)(v9 + 16) = v13 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v15 + v13 * v11, v7, v16);
      v10 += v11;
      if (!--v8)
        return v9;
    }
    swift_release();
  }
  return v9;
}

uint64_t sub_247AA2554(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *, uint64_t, uint64_t);
  uint64_t v17;
  int v18;
  void *v19;
  void **v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  BOOL v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD v42[9];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void **v50;
  unsigned int v51;
  char *v52;
  void (*v53)(_QWORD *, uint64_t, uint64_t);
  _QWORD *v54;
  uint64_t v55;

  *(double *)&v42[1] = a3;
  v46 = a2;
  v43 = sub_247AAE998();
  v47 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v6 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_247AAEA34();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (void **)((char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v54 = (_QWORD *)((char *)v42 - v12);
  v13 = *(_QWORD *)(a1 + 16);
  v14 = MEMORY[0x24BEE4AF8];
  if (!v13)
    return v14;
  v42[0] = v3;
  v55 = MEMORY[0x24BEE4AF8];
  sub_247AA0A24(0, v13, 0);
  v14 = v55;
  v49 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v15 = a1 + v49;
  v48 = *(_QWORD *)(v8 + 72);
  v16 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v8 + 16);
  v51 = *MEMORY[0x24BEB1C08];
  v17 = v43;
  v52 = v6;
  v53 = v16;
  v50 = v11;
  v44 = v7;
  v45 = v8;
  while (1)
  {
    v16(v11, v15, v7);
    v18 = (*(uint64_t (**)(void **, uint64_t))(v8 + 88))(v11, v7);
    if (v18 != v51)
    {
      v16(v54, v15, v7);
      (*(void (**)(void **, uint64_t))(v8 + 8))(v11, v7);
      goto LABEL_13;
    }
    (*(void (**)(void **, uint64_t))(v8 + 96))(v11, v7);
    v19 = *v11;
    sub_247AA3A08();
    v20 = v11;
    v21 = v47;
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v6, (char *)v20 + *(int *)(v22 + 48), v17);
    v23 = objc_msgSend(v19, sel_sourceChannelID);
    if (!v23)
    {
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v17);
      goto LABEL_12;
    }
    v24 = v23;
    v25 = sub_247AAEEF0();
    v27 = v26;

    if (!*(_QWORD *)(v46 + 16) || (v28 = sub_247AA06F8(v25, v27), (v29 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      v17 = v43;
      (*(void (**)(char *, uint64_t))(v47 + 8))(v52, v43);
      swift_unknownObjectRelease();
LABEL_12:
      v7 = v44;
      v8 = v45;
      v53(v54, v15, v44);
      goto LABEL_13;
    }
    v30 = *(_QWORD *)(*(_QWORD *)(v46 + 56) + 8 * v28);
    swift_bridgeObjectRelease();
    *v54 = v19;
    v42[8] = v19;
    swift_unknownObjectRetain();
    v31 = v52;
    v42[7] = sub_247AAE974();
    sub_247AAE8D8();
    sub_247AAE908();
    sub_247AAE8FC();
    sub_247AAE8E4();
    v42[6] = sub_247AAE950();
    sub_247AAE89C();
    sub_247AAE92C();
    sub_247AAE8CC();
    v33 = v32;
    sub_247AAE8C0();
    v42[5] = v34;
    sub_247AAE8B4();
    sub_247AAE71C();
    v42[4] = sub_247AAE8F0();
    sub_247AAE920();
    result = sub_247AAE95C();
    v36 = __OFADD__(result, v30);
    v37 = result + v30;
    v7 = v44;
    v8 = v45;
    if (v36)
      break;
    v42[3] = v37;
    sub_247AAE8A8();
    sub_247AAE98C();
    v42[2] = v33;
    sub_247AAE980();
    sub_247AAE968();
    swift_unknownObjectRelease();
    v38 = v31;
    v17 = v43;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v38, v43);
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v8 + 104))(v54, v51, v7);
LABEL_13:
    v55 = v14;
    v40 = *(_QWORD *)(v14 + 16);
    v39 = *(_QWORD *)(v14 + 24);
    if (v40 >= v39 >> 1)
    {
      sub_247AA0A24(v39 > 1, v40 + 1, 1);
      v17 = v43;
      v14 = v55;
    }
    *(_QWORD *)(v14 + 16) = v40 + 1;
    v41 = v48;
    (*(void (**)(unint64_t, _QWORD *, uint64_t))(v8 + 32))(v14 + v49 + v40 * v48, v54, v7);
    v15 += v41;
    --v13;
    v6 = v52;
    v16 = v53;
    v11 = v50;
    if (!v13)
      return v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_247AA2A38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[3];
  _QWORD *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  sub_247AA2D88(0, (unint64_t *)&unk_254454690, (uint64_t (*)(uint64_t))MEMORY[0x24BEB1828], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v32 - v6;
  v40 = sub_247AAE944();
  v39 = *(_QWORD *)(v40 - 8);
  v8 = MEMORY[0x24BDAC7A8](v40);
  v35 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v34 = (char *)v32 - v10;
  v38 = *(_QWORD *)(a1 + 16);
  if (!v38)
    return MEMORY[0x24BEE4AF8];
  v32[1] = a1;
  v32[2] = v2;
  v36 = a1 + 32;
  v11 = *(_QWORD **)(a2 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_subscribedStockEntities);
  swift_bridgeObjectRetain();
  v12 = 0;
  v33 = v11 + 7;
  v37 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v13 = v11[2];
    if (!v13)
      goto LABEL_3;
    v14 = (uint64_t *)(v36 + 16 * v12);
    v16 = *v14;
    v15 = v14[1];
    if (v11[4] != *v14 || v11[5] != v15)
    {
      result = sub_247AAF160();
      if ((result & 1) == 0)
        break;
    }
LABEL_12:
    swift_bridgeObjectRetain_n();
    sub_247AAE938();
    v19 = v39;
    v20 = v40;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v7, 0, 1, v40);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v7, 1, v20) != 1)
    {
      v21 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
      v22 = v34;
      v23 = v40;
      v21(v34, v7, v40);
      v21(v35, v22, v23);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
        v24 = v37;
      else
        v24 = (_QWORD *)sub_247AA6CDC(0, v37[2] + 1, 1, v37);
      v26 = v24[2];
      v25 = v24[3];
      if (v26 >= v25 >> 1)
        v24 = (_QWORD *)sub_247AA6CDC(v25 > 1, v26 + 1, 1, v24);
      v24[2] = v26 + 1;
      v27 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
      v37 = v24;
      v21((char *)v24 + v27 + *(_QWORD *)(v39 + 72) * v26, v35, v40);
      goto LABEL_5;
    }
LABEL_4:
    sub_247AA3C8C((uint64_t)v7, (unint64_t *)&unk_254454690, (uint64_t (*)(uint64_t))MEMORY[0x24BEB1828]);
LABEL_5:
    if (++v12 == v38)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v37;
    }
  }
  if (v13 == 1)
  {
LABEL_3:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v7, 1, 1, v40);
    goto LABEL_4;
  }
  v28 = v33;
  v29 = 1;
  while (1)
  {
    v30 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (*(v28 - 1) == v16 && *v28 == v15)
      goto LABEL_12;
    result = sub_247AAF160();
    if ((result & 1) != 0)
      goto LABEL_12;
    v28 += 2;
    ++v29;
    if (v30 == v13)
      goto LABEL_3;
  }
  __break(1u);
  return result;
}

void sub_247AA2D88(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_247AA2DE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_247AA2D88(0, (unint64_t *)&unk_254454680, (uint64_t (*)(uint64_t))MEMORY[0x24BEB1758], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_247AA2E3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (char *)MEMORY[0x24BEE4AF8];
  v2 = swift_bridgeObjectRetain() + 40;
  v3 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    swift_bridgeObjectRetain();
    v5 = sub_247AAE878();
    v7 = v6;
    swift_bridgeObjectRelease();
    if (v7)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_247AA6ACC(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
      v9 = *((_QWORD *)v3 + 2);
      v8 = *((_QWORD *)v3 + 3);
      if (v9 >= v8 >> 1)
        v3 = sub_247AA6ACC((char *)(v8 > 1), v9 + 1, 1, v3);
      *((_QWORD *)v3 + 2) = v9 + 1;
      v4 = &v3[16 * v9];
      *((_QWORD *)v4 + 4) = v5;
      *((_QWORD *)v4 + 5) = v7;
    }
    v2 += 16;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t type metadata accessor for NewsHeadlineScorerFactory()
{
  return objc_opt_self();
}

uint64_t method lookup function for NewsHeadlineScorerFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NewsHeadlineScorerFactory.__allocating_init(stockEntityService:watchlistManager:appConfigurationManager:newsPersonalizationScorer:tabiScorer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_247AA2F94()
{
  return type metadata accessor for NewsHeadlineScorer(0);
}

uint64_t type metadata accessor for NewsHeadlineScorer(uint64_t a1)
{
  return sub_247AA3B74(a1, qword_2544546E0);
}

uint64_t sub_247AA2FB0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_247AAE884();
  if (v1 <= 0x3F)
  {
    result = sub_247AAE818();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for NewsHeadlineScorer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NewsHeadlineScorer.__allocating_init(stocks:stockEntities:appConfiguration:newsPersonalizationScorer:tabiScorer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t initializeBufferWithCopyOfBuffer for ScorableHeadline(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4;
  uint64_t v5;
  uint64_t *v8;
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    v8 = a2 + 1;
    v9 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v9;
    v10 = v9;
    v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_unknownObjectRetain();
    v11(a1 + 8, v8, v10);
    v12 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v12;
    v13 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v13;
    v14 = *((_OWORD *)a2 + 5);
    *(_QWORD *)(a1 + 96) = a2[12];
    v15 = a3[12];
    v16 = a1 + v15;
    v17 = (uint64_t)a2 + v15;
    *(_OWORD *)(a1 + 80) = v14;
    v18 = sub_247AAE6D4();
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19(v16, v17, v18);
    v20 = a3[14];
    *(_QWORD *)(a1 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
    *(_BYTE *)(a1 + v20) = *((_BYTE *)a2 + v20);
    v21 = a3[15];
    v22 = a3[16];
    v23 = *(void **)((char *)a2 + v21);
    *(_QWORD *)(a1 + v21) = v23;
    *(_QWORD *)(a1 + v22) = *(uint64_t *)((char *)a2 + v22);
    v24 = v23;
  }
  return a1;
}

void destroy for ScorableHeadline(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 48);
  v5 = sub_247AAE6D4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

}

uint64_t initializeWithCopy for ScorableHeadline(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = a2 + 8;
  v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_unknownObjectRetain();
  v9(a1 + 8, v6, v8);
  v10 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v10;
  v11 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v11;
  v12 = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v13 = a3[12];
  v14 = a1 + v13;
  v15 = a2 + v13;
  *(_OWORD *)(a1 + 80) = v12;
  v16 = sub_247AAE6D4();
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17(v14, v15, v16);
  v18 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v18) = *(_BYTE *)(a2 + v18);
  v19 = a3[15];
  v20 = a3[16];
  v21 = *(void **)(a2 + v19);
  *(_QWORD *)(a1 + v19) = v21;
  *(_QWORD *)(a1 + v20) = *(_QWORD *)(a2 + v20);
  v22 = v21;
  return a1;
}

_QWORD *assignWithCopy for ScorableHeadline(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  v6 = a3[12];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247AAE6D4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
  v10 = a3[15];
  v11 = *(void **)((char *)a1 + v10);
  v12 = *(void **)((char *)a2 + v10);
  *(_QWORD *)((char *)a1 + v10) = v12;
  v13 = v12;

  *(_QWORD *)((char *)a1 + a3[16]) = *(_QWORD *)((char *)a2 + a3[16]);
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

uint64_t initializeWithTake for ScorableHeadline(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v7 = a3[12];
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  v10 = sub_247AAE6D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  v12 = a3[16];
  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  return a1;
}

uint64_t assignWithTake for ScorableHeadline(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v8 = a3[12];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_247AAE6D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v12) = *(_BYTE *)(a2 + v12);
  v13 = a3[15];
  v14 = *(void **)(a1 + v13);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);

  *(_QWORD *)(a1 + a3[16]) = *(_QWORD *)(a2 + a3[16]);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScorableHeadline()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247AA379C(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_247AAE6D4();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 48)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ScorableHeadline()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_247AA3824(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_247AAE6D4();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 48)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_247AA3898()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247AAE6D4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_247AA395C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_247A95910(255, a3);
    v4 = sub_247AAF0DC();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_247AA39C0()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
  return sub_247AAE9A4();
}

void sub_247AA3A08()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_2544542F8)
  {
    sub_247AA3A74();
    sub_247AAE998();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_2544542F8);
  }
}

unint64_t sub_247AA3A74()
{
  unint64_t result;

  result = qword_2544542F0;
  if (!qword_2544542F0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_2544542F0);
  }
  return result;
}

void sub_247AA3AC8(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_247AAF148();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_247AA3B0C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, _QWORD, uint64_t, _QWORD))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, MEMORY[0x24BEE0D00], a3, MEMORY[0x24BEE0D10]);
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t type metadata accessor for StocksTabiArticleData(uint64_t a1)
{
  return sub_247AA3B74(a1, (uint64_t *)&unk_2544546A8);
}

uint64_t sub_247AA3B74(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247AA3BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StocksTabiArticleData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247AA3BEC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_247AA3C28()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254454708)
  {
    sub_247AAE998();
    v0 = sub_247AAF0DC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254454708);
  }
}

uint64_t sub_247AA3C8C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_247AA2D88(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_247AA3CD0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_247AA3D14()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer), *(_QWORD *)(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer + 24));
  return sub_247AAE9BC();
}

uint64_t sub_247AA3D64@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  a1[3] = *v1;
  a1[4] = sub_247A95E64(&qword_2544546D8, type metadata accessor for NewsHeadlineScorer, (uint64_t)&protocol conformance descriptor for NewsHeadlineScorer);
  *a1 = v1;
  return swift_retain();
}

uint64_t sub_247AA3DB0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247AA3DD4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_247AA3DFC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_247AA3E20@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_247A9D8D0(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_247AA3E38(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_247AA3E74(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t *sub_247AA3EA8(uint64_t *a1, uint64_t *a2, int *a3)
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

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_247AAE7F4();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)v4 + v13) = *(uint64_t *)((char *)a2 + v13);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
  }
  return v4;
}

uint64_t sub_247AA3F74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_247AAE7F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

_QWORD *sub_247AA3FDC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_247AAE7F4();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

_QWORD *sub_247AA407C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247AAE7F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

_OWORD *sub_247AA4138(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247AAE7F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  return a1;
}

_QWORD *sub_247AA41B8(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_247AAE7F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_247AA4254()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247AA4260(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_247AAE7F4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_247AA42DC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247AA42E8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_247AAE7F4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_247AA435C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247AAE7F4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_UNKNOWN **sub_247AA43E8()
{
  return &protocol witness table for HeadlineScores;
}

_UNKNOWN **sub_247AA43F4()
{
  return &protocol witness table for HeadlineMetadata.StockEntityMetadata;
}

uint64_t sub_247AA4400@<X0>(uint64_t *a1@<X8>)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  char v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;

  v2 = 0xEB00000000444549;
  v3 = 0x4649434550534E55;
  result = sub_247AAE800();
  v5 = (char *)MEMORY[0x24BEE4AF8];
  if (result)
  {
    v6 = result;
    v17 = sub_247AA506C(result);
    v8 = v7;
    v9 = sub_247AA51E8(v6);
    v16 = sub_247AA5548(v6);
    v15 = v10;
    v11 = sub_247AA596C(v6);
    v12 = sub_247AA5F64(v6);
    v13 = sub_247AA655C(v6);
    result = swift_bridgeObjectRelease();
    if (v8)
    {
      v3 = v17;
      v2 = v8;
    }
    if (v9)
      v5 = v9;
    v14 = v16;
    if ((v15 & 1) != 0)
      v14 = 0;
  }
  else
  {
    v14 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }
  *a1 = v3;
  a1[1] = v2;
  a1[2] = (uint64_t)v5;
  a1[3] = v14;
  a1[4] = (uint64_t)v11;
  a1[5] = (uint64_t)v12;
  a1[6] = (uint64_t)v13;
  return result;
}

uint64_t sub_247AA4514@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = sub_247AAEC38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_247AAE68C();
  v8 = v7;
  sub_247AAE5D8();
  swift_allocObject();
  sub_247AAE5CC();
  sub_247A95E64(&qword_2576DA6E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6CFD0], MEMORY[0x24BE6CFD8]);
  sub_247AAE5C0();
  swift_release();
  v9 = sub_247AAEC2C();
  v22 = v10;
  v23 = v9;
  v21 = sub_247AAEC14();
  v20 = sub_247AAEC20();
  v11 = (void *)sub_247AAEC08();
  v12 = objc_msgSend(v11, sel_eventAggregationConfiguration);

  v13 = (void *)sub_247AAEC08();
  v14 = objc_msgSend(v13, sel_feedPersonalizationConfiguration);

  v15 = (void *)sub_247AAEC08();
  v16 = objc_msgSend(v15, sel_unloadGraphOnBackgroundConfiguration);

  sub_247A97F84(v6, v8);
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v18 = v22;
  *a1 = v23;
  a1[1] = v18;
  v19 = v20;
  a1[2] = v21;
  a1[3] = v19;
  a1[4] = (uint64_t)v12;
  a1[5] = (uint64_t)v14;
  a1[6] = (uint64_t)v16;
  return result;
}

uint64_t sub_247AA4950(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 + 88) = a2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = sub_247AAE818();
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 48) = swift_task_alloc();
  *(_QWORD *)(v3 + 56) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247AA49C4()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v6;

  v1 = *(unsigned __int8 *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 24)+ OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager), *(_QWORD *)(*(_QWORD *)(v0 + 24)+ OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager+ 24));
  if (v1 == 1)
  {
    sub_247AAE9E0();
    v2 = *(_QWORD *)(v0 + 56);
    v3 = *(_QWORD *)(v0 + 32);
    v4 = *(_QWORD *)(v0 + 40);
    sub_247AA4400(*(uint64_t **)(v0 + 16));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 64) = sub_247AAE9EC();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v6;
    *v6 = v0;
    v6[1] = sub_247AA4ABC;
    return sub_247AAEBA8();
  }
}

uint64_t sub_247AA4ABC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_247AA4B28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  sub_247AA4400(*(uint64_t **)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247AA4B8C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_247AA4BD4(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *))
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  char v12;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[7];

  v4 = 0xEB00000000444549;
  v5 = 0x4649434550534E55;
  v6 = sub_247AAE800();
  v7 = (char *)MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v8 = v6;
    v18 = sub_247AA506C(v6);
    v10 = v9;
    v11 = sub_247AA51E8(v8);
    v17 = sub_247AA5548(v8);
    v13 = v12;
    v14 = sub_247AA596C(v8);
    v15 = sub_247AA5F64(v8);
    v19 = sub_247AA655C(v8);
    swift_bridgeObjectRelease();
    if (v10)
    {
      v5 = v18;
      v4 = v10;
    }
    if (v11)
      v7 = v11;
    v16 = v17;
    if ((v13 & 1) != 0)
      v16 = 0;
  }
  else
  {
    v16 = 0;
    v14 = 0;
    v15 = 0;
    v19 = 0;
  }
  v20[0] = v5;
  v20[1] = v4;
  v20[2] = v7;
  v20[3] = v16;
  v20[4] = v14;
  v20[5] = v15;
  v20[6] = v19;
  a3(v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t sub_247AA4D28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_bundledConfigurationURL;
  v2 = sub_247AAE680();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager);
  return swift_deallocClassInstance();
}

uint64_t sub_247AA4D88()
{
  return type metadata accessor for TabiConfigurationManager();
}

uint64_t type metadata accessor for TabiConfigurationManager()
{
  uint64_t result;

  result = qword_254454208;
  if (!qword_254454208)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247AA4DCC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247AAE680();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_247AA4E40@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v3 = sub_247AAE818();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*v1 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager), *(_QWORD *)(*v1 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager + 24));
  sub_247AAE9E0();
  sub_247AA4400(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_247AA4F04@<X0>(uint64_t *a1@<X8>)
{
  return sub_247AA4514(a1);
}

uint64_t sub_247AA4F24(uint64_t a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_247A998E4;
  return sub_247AA4950(a1, a2);
}

uint64_t sub_247AA4F88(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  _BYTE v7[40];

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*v2 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager), *(_QWORD *)(*v2 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager + 24));
  sub_247AAE9D4();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  swift_retain();
  sub_247AAEB00();
  swift_release();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

uint64_t sub_247AA5040()
{
  swift_release();
  return swift_deallocObject();
}

void sub_247AA5064(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_247AA4BD4(a1, a2, *(void (**)(_QWORD *))(v2 + 16));
}

uint64_t sub_247AA506C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  v2 = sub_247AAEB84();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16))
  {
    v6 = sub_247AA06F8(0x6E6F6973726576, 0xE700000000000000);
    if ((v7 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(a1 + 56) + *(_QWORD *)(v3 + 72) * v6, v2);
      if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v5, v2) == *MEMORY[0x24BEB45F0])
      {
        (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
        v8 = *(_QWORD *)(*(_QWORD *)v5 + 16);
        swift_bridgeObjectRetain();
        swift_release();
        return v8;
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  if (qword_254454190 != -1)
    swift_once();
  v9 = (id)qword_254454188;
  sub_247AAEFEC();
  sub_247AAED88();

  return 0;
}

char *sub_247AA51E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  void (*v15)(char *, unint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  void (*v20)(char *, uint64_t);
  int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  id v27;
  _QWORD v29[2];
  void (*v30)(char *, unint64_t, uint64_t);
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  int v34;
  uint64_t (*v35)(char *, uint64_t);

  v2 = sub_247AAEB84();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)v29 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v29 - v10;
  if (*(_QWORD *)(a1 + 16))
  {
    v12 = sub_247AA06F8(0x416567616B636170, 0xEF73444974657373);
    if ((v13 & 1) != 0)
    {
      v14 = *(_QWORD *)(v3 + 72);
      v15 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
      v15(v11, *(_QWORD *)(a1 + 56) + v14 * v12, v2);
      v35 = *(uint64_t (**)(char *, uint64_t))(v3 + 88);
      if (v35(v11, v2) == *MEMORY[0x24BEB45D8])
      {
        v32 = *(void (**)(char *, uint64_t))(v3 + 96);
        v32(v11, v2);
        v16 = *(_QWORD *)(*(_QWORD *)v11 + 16);
        swift_bridgeObjectRetain();
        swift_release();
        v17 = *(_QWORD *)(v16 + 16);
        if (v17)
        {
          v18 = v16 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
          v34 = *MEMORY[0x24BEB45F0];
          v29[1] = v16;
          swift_bridgeObjectRetain();
          v19 = (char *)MEMORY[0x24BEE4AF8];
          v30 = v15;
          v31 = v14;
          do
          {
            v15(v9, v18, v2);
            v15(v6, (unint64_t)v9, v2);
            v21 = v35(v6, v2);
            if (v21 == v34)
            {
              v32(v6, v2);
              v22 = v3;
              v23 = *(_QWORD *)(*(_QWORD *)v6 + 24);
              v33 = *(_QWORD *)(*(_QWORD *)v6 + 16);
              swift_bridgeObjectRetain();
              swift_release();
              (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v2);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v19 = sub_247AA6ACC(0, *((_QWORD *)v19 + 2) + 1, 1, v19);
              v25 = *((_QWORD *)v19 + 2);
              v24 = *((_QWORD *)v19 + 3);
              if (v25 >= v24 >> 1)
                v19 = sub_247AA6ACC((char *)(v24 > 1), v25 + 1, 1, v19);
              *((_QWORD *)v19 + 2) = v25 + 1;
              v26 = &v19[16 * v25];
              *((_QWORD *)v26 + 4) = v33;
              *((_QWORD *)v26 + 5) = v23;
              v3 = v22;
              v15 = v30;
              v14 = v31;
            }
            else
            {
              v20 = *(void (**)(char *, uint64_t))(v3 + 8);
              v20(v6, v2);
              v20(v9, v2);
            }
            v18 += v14;
            --v17;
          }
          while (v17);
          swift_bridgeObjectRelease_n();
        }
        else
        {
          swift_bridgeObjectRelease();
          return (char *)MEMORY[0x24BEE4AF8];
        }
        return v19;
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
    }
  }
  if (qword_254454190 != -1)
    swift_once();
  v27 = (id)qword_254454188;
  sub_247AAEFEC();
  sub_247AAED88();

  return 0;
}

uint64_t sub_247AA5548(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *v27;
  unsigned int v28;
  uint64_t v29;
  id v30;
  char v31;
  _QWORD v33[3];

  v2 = sub_247AAEB84();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v33[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_57;
  v6 = sub_247AA06F8(0x7475706D6F436C6DLL, 0xEE007374696E5565);
  if ((v7 & 1) == 0)
    goto LABEL_57;
  (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(a1 + 56) + *(_QWORD *)(v3 + 72) * v6, v2);
  if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v5, v2) != *MEMORY[0x24BEB45E0])
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    goto LABEL_57;
  }
  (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
  v8 = *(_QWORD *)v5;
  v10 = *(_QWORD *)(*(_QWORD *)v5 + 16);
  v9 = *(_QWORD *)(v8 + 24);
  swift_bridgeObjectRetain();
  result = swift_release();
  v12 = HIBYTE(v9) & 0xF;
  v13 = v10 & 0xFFFFFFFFFFFFLL;
  if ((v9 & 0x2000000000000000) != 0)
    v14 = HIBYTE(v9) & 0xF;
  else
    v14 = v10 & 0xFFFFFFFFFFFFLL;
  if (!v14)
  {
    swift_bridgeObjectRelease();
    goto LABEL_57;
  }
  if ((v9 & 0x1000000000000000) != 0)
  {
    v16 = (uint64_t)sub_247AA6E4C(v10, v9, 10);
    LOBYTE(v10) = v31;
    goto LABEL_48;
  }
  if ((v9 & 0x2000000000000000) == 0)
  {
    if ((v10 & 0x1000000000000000) != 0)
      v15 = (unsigned __int8 *)((v9 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v15 = (unsigned __int8 *)sub_247AAF088();
    v16 = (uint64_t)sub_247AA6F30(v15, v13, 10);
    LOBYTE(v10) = v17 & 1;
LABEL_48:
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
      return v16;
LABEL_57:
    if (qword_254454190 != -1)
      swift_once();
    v30 = (id)qword_254454188;
    sub_247AAEFEC();
    sub_247AAED88();

    return 0;
  }
  v33[0] = v10;
  v33[1] = v9 & 0xFFFFFFFFFFFFFFLL;
  if (v10 == 43)
  {
    if (!v12)
      goto LABEL_64;
    if (v12 == 1 || (BYTE1(v10) - 48) > 9u)
      goto LABEL_35;
    v16 = (BYTE1(v10) - 48);
    if (v12 != 2)
    {
      if ((BYTE2(v10) - 48) > 9u)
        goto LABEL_35;
      v16 = 10 * (BYTE1(v10) - 48) + (BYTE2(v10) - 48);
      v18 = v12 - 3;
      if (v18)
      {
        v19 = (unsigned __int8 *)v33 + 3;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_35;
          v21 = 10 * v16;
          if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63)
            goto LABEL_35;
          v16 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_35;
          LOBYTE(v10) = 0;
          ++v19;
          if (!--v18)
            goto LABEL_48;
        }
      }
    }
LABEL_47:
    LOBYTE(v10) = 0;
    goto LABEL_48;
  }
  if (v10 != 45)
  {
    if (!v12 || (v10 - 48) > 9u)
      goto LABEL_35;
    v16 = (v10 - 48);
    if (v12 != 1)
    {
      if ((BYTE1(v10) - 48) > 9u)
        goto LABEL_35;
      v16 = 10 * (v10 - 48) + (BYTE1(v10) - 48);
      v22 = v12 - 2;
      if (v22)
      {
        v23 = (unsigned __int8 *)v33 + 2;
        while (1)
        {
          v24 = *v23 - 48;
          if (v24 > 9)
            goto LABEL_35;
          v25 = 10 * v16;
          if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63)
            goto LABEL_35;
          v16 = v25 + v24;
          if (__OFADD__(v25, v24))
            goto LABEL_35;
          LOBYTE(v10) = 0;
          ++v23;
          if (!--v22)
            goto LABEL_48;
        }
      }
    }
    goto LABEL_47;
  }
  if (v12)
  {
    if (v12 != 1 && (BYTE1(v10) - 48) <= 9u)
    {
      if (v12 == 2)
      {
        LOBYTE(v10) = 0;
        v16 = -(uint64_t)(BYTE1(v10) - 48);
        goto LABEL_48;
      }
      if ((BYTE2(v10) - 48) <= 9u)
      {
        v16 = -10 * (BYTE1(v10) - 48) - (BYTE2(v10) - 48);
        v26 = v12 - 3;
        if (!v26)
          goto LABEL_47;
        v27 = (unsigned __int8 *)v33 + 3;
        while (1)
        {
          v28 = *v27 - 48;
          if (v28 > 9)
            break;
          v29 = 10 * v16;
          if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63)
            break;
          v16 = v29 - v28;
          if (__OFSUB__(v29, v28))
            break;
          LOBYTE(v10) = 0;
          ++v27;
          if (!--v26)
            goto LABEL_48;
        }
      }
    }
LABEL_35:
    v16 = 0;
    LOBYTE(v10) = 1;
    goto LABEL_48;
  }
  __break(1u);
LABEL_64:
  __break(1u);
  return result;
}

id sub_247AA596C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  void (*v15)(char *, unint64_t, uint64_t);
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void (*v20)(char *, uint64_t);
  id v21;
  id v22;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v37[4];
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = sub_247AAEB84();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)v37 - v8 + 8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v37 - v10 + 8;
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_9;
  v12 = sub_247AA06F8(0xD00000000000001DLL, 0x8000000247AB0510);
  if ((v13 & 1) == 0)
    goto LABEL_9;
  v14 = *(_QWORD *)(a1 + 56) + *(_QWORD *)(v3 + 72) * v12;
  v15 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
  v15(v9, v14, v2);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v11, v9, v2);
  v15(v6, (unint64_t)v11, v2);
  if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v6, v2) != *MEMORY[0x24BEB45E8])
  {
    v20 = *(void (**)(char *, uint64_t))(v3 + 8);
    v20(v11, v2);
    v20(v6, v2);
LABEL_9:
    if (qword_254454190 != -1)
      swift_once();
    v21 = (id)qword_254454188;
    sub_247AAEFEC();
    sub_247AAED88();

    return 0;
  }
  (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
  swift_release();
  sub_247AAE5FC();
  swift_allocObject();
  sub_247AAE5F0();
  sub_247A95E64(&qword_254454048, (uint64_t (*)(uint64_t))MEMORY[0x24BEB45F8], MEMORY[0x24BEB4600]);
  v24 = sub_247AAE5E4();
  v26 = v25;
  swift_release();
  v27 = (void *)objc_opt_self();
  v28 = (void *)sub_247AAE698();
  v37[0] = 0;
  v29 = objc_msgSend(v27, sel_JSONObjectWithData_options_error_, v28, 0, v37);

  v30 = v37[0];
  if (!v29)
  {
    v33 = v30;
    v34 = (void *)sub_247AAE620();

    swift_willThrow();
    sub_247A97F84(v24, v26);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
    if (qword_254454190 != -1)
      swift_once();
    v16 = (id)qword_254454188;
    sub_247AAEFEC();
    sub_247A96CB8();
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_247AAF690;
    v38 = 0;
    v39 = 0xE000000000000000;
    v37[0] = v34;
    sub_247A95910(0, &qword_2544543F0);
    sub_247AAF0A0();
    v18 = v38;
    v19 = v39;
    *(_QWORD *)(v17 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v17 + 64) = sub_247A9595C();
    *(_QWORD *)(v17 + 32) = v18;
    *(_QWORD *)(v17 + 40) = v19;
    sub_247AAED88();

    swift_bridgeObjectRelease();
    return 0;
  }
  sub_247AAF04C();
  swift_unknownObjectRelease();
  sub_247AA6A90((uint64_t)&v38, (uint64_t)v37);
  sub_247A996C0();
  if (swift_dynamicCast())
  {
    v31 = objc_allocWithZone(MEMORY[0x24BE6CC60]);
    v32 = (void *)sub_247AAEEB4();
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v31, sel_initWithDictionary_, v32);

    if (v22)
    {
      sub_247A97F84(v24, v26);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v38);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
      return v22;
    }
    if (qword_254454190 == -1)
      goto LABEL_22;
  }
  else if (qword_254454190 == -1)
  {
    goto LABEL_22;
  }
  swift_once();
LABEL_22:
  v35 = (id)qword_254454188;
  sub_247AAEFEC();
  sub_247AAED88();
  sub_247A97F84(v24, v26);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v38);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
  return 0;
}

id sub_247AA5F64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  void (*v15)(char *, unint64_t, uint64_t);
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void (*v20)(char *, uint64_t);
  id v21;
  id v22;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v37[4];
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = sub_247AAEB84();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)v37 - v8 + 8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v37 - v10 + 8;
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_9;
  v12 = sub_247AA06F8(0xD000000000000020, 0x8000000247AB0530);
  if ((v13 & 1) == 0)
    goto LABEL_9;
  v14 = *(_QWORD *)(a1 + 56) + *(_QWORD *)(v3 + 72) * v12;
  v15 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
  v15(v9, v14, v2);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v11, v9, v2);
  v15(v6, (unint64_t)v11, v2);
  if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v6, v2) != *MEMORY[0x24BEB45E8])
  {
    v20 = *(void (**)(char *, uint64_t))(v3 + 8);
    v20(v11, v2);
    v20(v6, v2);
LABEL_9:
    if (qword_254454190 != -1)
      swift_once();
    v21 = (id)qword_254454188;
    sub_247AAEFEC();
    sub_247AAED88();

    return 0;
  }
  (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
  swift_release();
  sub_247AAE5FC();
  swift_allocObject();
  sub_247AAE5F0();
  sub_247A95E64(&qword_254454048, (uint64_t (*)(uint64_t))MEMORY[0x24BEB45F8], MEMORY[0x24BEB4600]);
  v24 = sub_247AAE5E4();
  v26 = v25;
  swift_release();
  v27 = (void *)objc_opt_self();
  v28 = (void *)sub_247AAE698();
  v37[0] = 0;
  v29 = objc_msgSend(v27, sel_JSONObjectWithData_options_error_, v28, 0, v37);

  v30 = v37[0];
  if (!v29)
  {
    v33 = v30;
    v34 = (void *)sub_247AAE620();

    swift_willThrow();
    sub_247A97F84(v24, v26);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
    if (qword_254454190 != -1)
      swift_once();
    v16 = (id)qword_254454188;
    sub_247AAEFEC();
    sub_247A96CB8();
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_247AAF690;
    v38 = 0;
    v39 = 0xE000000000000000;
    v37[0] = v34;
    sub_247A95910(0, &qword_2544543F0);
    sub_247AAF0A0();
    v18 = v38;
    v19 = v39;
    *(_QWORD *)(v17 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v17 + 64) = sub_247A9595C();
    *(_QWORD *)(v17 + 32) = v18;
    *(_QWORD *)(v17 + 40) = v19;
    sub_247AAED88();

    swift_bridgeObjectRelease();
    return 0;
  }
  sub_247AAF04C();
  swift_unknownObjectRelease();
  sub_247AA6A90((uint64_t)&v38, (uint64_t)v37);
  sub_247A996C0();
  if (swift_dynamicCast())
  {
    v31 = objc_allocWithZone(MEMORY[0x24BE6CC68]);
    v32 = (void *)sub_247AAEEB4();
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v31, sel_initWithDictionary_, v32);

    if (v22)
    {
      sub_247A97F84(v24, v26);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v38);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
      return v22;
    }
    if (qword_254454190 == -1)
      goto LABEL_22;
  }
  else if (qword_254454190 == -1)
  {
    goto LABEL_22;
  }
  swift_once();
LABEL_22:
  v35 = (id)qword_254454188;
  sub_247AAEFEC();
  sub_247AAED88();
  sub_247A97F84(v24, v26);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v38);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
  return 0;
}

id sub_247AA655C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  void (*v15)(char *, unint64_t, uint64_t);
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void (*v21)(char *, uint64_t);
  id v22;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v35[4];
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = sub_247AAEB84();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)v35 - v8 + 8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v35 - v10 + 8;
  if (*(_QWORD *)(a1 + 16))
  {
    v12 = sub_247AA06F8(0xD000000000000024, 0x8000000247AB0560);
    if ((v13 & 1) != 0)
    {
      v14 = *(_QWORD *)(a1 + 56) + *(_QWORD *)(v3 + 72) * v12;
      v15 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
      v15(v9, v14, v2);
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v11, v9, v2);
      v15(v6, (unint64_t)v11, v2);
      if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v6, v2) == *MEMORY[0x24BEB45E8])
      {
        (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
        swift_release();
        sub_247AAE5FC();
        swift_allocObject();
        sub_247AAE5F0();
        sub_247A95E64(&qword_254454048, (uint64_t (*)(uint64_t))MEMORY[0x24BEB45F8], MEMORY[0x24BEB4600]);
        v24 = sub_247AAE5E4();
        v26 = v25;
        swift_release();
        v27 = (void *)objc_opt_self();
        v28 = (void *)sub_247AAE698();
        v35[0] = 0;
        v29 = objc_msgSend(v27, sel_JSONObjectWithData_options_error_, v28, 0, v35);

        v30 = v35[0];
        if (v29)
        {
          sub_247AAF04C();
          swift_unknownObjectRelease();
          sub_247AA6A90((uint64_t)&v36, (uint64_t)v35);
          sub_247A996C0();
          if ((swift_dynamicCast() & 1) != 0)
          {
            v31 = (void *)sub_247AAEEB4();
            swift_bridgeObjectRelease();
          }
          else
          {
            v31 = 0;
          }
          v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6CC70]), sel_initWithDictionary_, v31);

          sub_247A97F84(v24, v26);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
          (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
        }
        else
        {
          v32 = v30;
          v33 = (void *)sub_247AAE620();

          swift_willThrow();
          sub_247A97F84(v24, v26);
          (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
          if (qword_254454190 != -1)
            swift_once();
          v16 = (id)qword_254454188;
          sub_247AAEFEC();
          sub_247A96CB8();
          v17 = swift_allocObject();
          *(_OWORD *)(v17 + 16) = xmmword_247AAF690;
          v36 = 0;
          v37 = 0xE000000000000000;
          v35[0] = v33;
          sub_247A95910(0, &qword_2544543F0);
          sub_247AAF0A0();
          v18 = v36;
          v19 = v37;
          *(_QWORD *)(v17 + 56) = MEMORY[0x24BEE0D00];
          *(_QWORD *)(v17 + 64) = sub_247A9595C();
          *(_QWORD *)(v17 + 32) = v18;
          *(_QWORD *)(v17 + 40) = v19;
          sub_247AAED88();

          swift_bridgeObjectRelease();
          v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6CC70]), sel_initWithDictionary_, 0);

        }
        return v20;
      }
      v21 = *(void (**)(char *, uint64_t))(v3 + 8);
      v21(v11, v2);
      v21(v6, v2);
    }
  }
  if (qword_254454190 != -1)
    swift_once();
  v22 = (id)qword_254454188;
  sub_247AAEFEC();
  sub_247AAED88();

  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6CC70]), sel_initWithDictionary_, 0);
}

uint64_t sub_247AA6A90(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_247AA6ACC(char *result, int64_t a2, char a3, char *a4)
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
    sub_247AA3AC8(0, (unint64_t *)&qword_254454720);
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
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_247AA6BD8(char *result, int64_t a2, char a3, char *a4)
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
    sub_247AA3AC8(0, (unint64_t *)&unk_2544543D0);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_247AA6CDC(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  sub_247AA7750();
  v10 = *(_QWORD *)(sub_247AAE944() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_247AAE944() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

unsigned __int8 *sub_247AA6E4C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v5 = sub_247AAEF80();
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
  v5 = sub_247AA71AC();
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
    v7 = (unsigned __int8 *)sub_247AAF088();
  }
LABEL_7:
  v11 = sub_247AA6F30(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_247AA6F30(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

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
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
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
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_247AA71AC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_247AAEF8C();
  v4 = sub_247AA7228(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_247AA7228(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_247AA736C(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_247AA7458(v9, 0);
      v12 = sub_247AA74C8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x24958A360](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x24958A360);
LABEL_9:
      sub_247AAF088();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24958A360]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_247AA736C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_247AA76D8(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_247AA76D8(a2, a3, a4);
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
    return sub_247AAEF5C();
  }
  __break(1u);
  return result;
}

_QWORD *sub_247AA7458(uint64_t a1, uint64_t a2)
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
  sub_247AA3AC8(0, &qword_2576DA6D8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_247AA74C8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_247AA76D8(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_247AAEF68();
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
          result = sub_247AAF088();
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
    result = sub_247AA76D8(v12, a6, a7);
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
    v12 = sub_247AAEF44();
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

uint64_t sub_247AA76D8(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_247AAEF74();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x24958A390](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

void sub_247AA7750()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254454390)
  {
    sub_247AAE944();
    v0 = sub_247AAF148();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254454390);
  }
}

uint64_t sub_247AA77A4(uint64_t a1)
{
  return sub_247AA784C(a1, 0x6154736B636F7453, 0xEA00000000006962, &qword_254454188);
}

unint64_t sub_247AA77C8()
{
  unint64_t result;

  result = qword_254454330;
  if (!qword_254454330)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254454330);
  }
  return result;
}

uint64_t sub_247AA7804(uint64_t a1)
{
  return sub_247AA784C(a1, 0xD000000000000013, 0x8000000247AB1280, &qword_2544541D8);
}

uint64_t sub_247AA7828(uint64_t a1)
{
  return sub_247AA784C(a1, 0xD000000000000021, 0x8000000247AB12A0, &qword_254454220);
}

uint64_t sub_247AA784C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  id v5;
  id v6;
  uint64_t result;

  v5 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v6 = objc_msgSend(v5, sel_bundleIdentifier);

  if (v6)
  {
    sub_247AAEEF0();

  }
  sub_247AA77C8();
  result = sub_247AAF034();
  *a4 = result;
  return result;
}

_QWORD *sub_247AA7928(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_247AAE6F8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
    v9 = a3[7];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = *(_OWORD *)((char *)a2 + v9 + 24);
    *(_OWORD *)((char *)a1 + v9 + 24) = v12;
    v13 = v12;
    v14 = **(void (***)(char *, char *, uint64_t))(v12 - 8);
    swift_bridgeObjectRetain();
    v14(v10, v11, v13);
    v15 = a3[8];
    v16 = *(_OWORD *)((char *)a2 + v15 + 24);
    *(_OWORD *)((char *)a1 + v15 + 24) = v16;
    (**(void (***)(void))(v16 - 8))();
    v17 = a3[10];
    *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = sub_247AAECD4();
    v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    swift_unknownObjectRetain();
    v21(v18, v19, v20);
  }
  return a1;
}

uint64_t sub_247AA7A60(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_247AAE6F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[7]);
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[8]);
  swift_unknownObjectRelease();
  v5 = a1 + a2[10];
  v6 = sub_247AAECD4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_247AA7AEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);

  v6 = sub_247AAE6F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = *(_OWORD *)(a2 + v8 + 24);
  *(_OWORD *)(a1 + v8 + 24) = v11;
  v12 = v11;
  v13 = **(void (***)(uint64_t, uint64_t, uint64_t))(v11 - 8);
  swift_bridgeObjectRetain();
  v13(v9, v10, v12);
  v14 = a3[8];
  v15 = *(_OWORD *)(a2 + v14 + 24);
  *(_OWORD *)(a1 + v14 + 24) = v15;
  (**(void (***)(void))(v15 - 8))();
  v16 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_247AAECD4();
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
  swift_unknownObjectRetain();
  v20(v17, v18, v19);
  return a1;
}

uint64_t sub_247AA7BF8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_247AAE6F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[7]), (uint64_t *)(a2 + a3[7]));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[8]), (uint64_t *)(a2 + a3[8]));
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v7 = a3[10];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247AAECD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_247AA7CD8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = sub_247AAE6F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[7];
  v9 = a3[8];
  v10 = a1 + v8;
  v11 = (__int128 *)(a2 + v8);
  v12 = *v11;
  v13 = v11[1];
  *(_QWORD *)(v10 + 32) = *((_QWORD *)v11 + 4);
  *(_OWORD *)v10 = v12;
  *(_OWORD *)(v10 + 16) = v13;
  v14 = a1 + v9;
  v15 = a2 + v9;
  v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(v15 + 32);
  v17 = a3[9];
  v18 = a3[10];
  v19 = a1 + v18;
  v20 = a2 + v18;
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  v21 = sub_247AAECD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v19, v20, v21);
  return a1;
}

uint64_t sub_247AA7DA4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_247AAE6F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_bridgeObjectRelease();
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  __swift_destroy_boxed_opaque_existential_1(a1 + v8);
  v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(v10 + 32);
  v12 = a3[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  __swift_destroy_boxed_opaque_existential_1(a1 + v12);
  v15 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v15;
  *(_QWORD *)(v13 + 32) = *(_QWORD *)(v14 + 32);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_unknownObjectRelease();
  v16 = a3[10];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_247AAECD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t sub_247AA7EA0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247AA7EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_247AAE6F8();
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
    v8 = sub_247AAECD4();
    v10 = a1 + *(int *)(a3 + 40);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_247AA7F54()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247AA7F60(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_247AAE6F8();
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
      *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return result;
    }
    v10 = sub_247AAECD4();
    v12 = a1 + *(int *)(a4 + 40);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for StocksTabiArticleScoringWork()
{
  uint64_t result;

  result = qword_254454120;
  if (!qword_254454120)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247AA8040()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_247AAE6F8();
  if (v1 <= 0x3F)
  {
    result = sub_247AAECD4();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_247AA80F0(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v15 = MEMORY[0x24BEE4AF8];
    sub_247AA0900(0, v1, 0);
    v2 = v15;
    v4 = (_QWORD *)(a1 + 32);
    do
    {
      v5 = v4[3];
      v6 = v4[4];
      __swift_project_boxed_opaque_existential_1(v4, v5);
      v7 = objc_msgSend((id)(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 64))(v5, v6), sel_itemID);
      v8 = sub_247AAEEF0();
      v10 = v9;
      swift_unknownObjectRelease();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_247AA0900(0, *(_QWORD *)(v15 + 16) + 1, 1);
      v12 = *(_QWORD *)(v15 + 16);
      v11 = *(_QWORD *)(v15 + 24);
      if (v12 >= v11 >> 1)
        sub_247AA0900((char *)(v11 > 1), v12 + 1, 1);
      *(_QWORD *)(v15 + 16) = v12 + 1;
      v13 = v15 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v8;
      *(_QWORD *)(v13 + 40) = v10;
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_247AA8240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t i;
  unint64_t v13;
  unint64_t v14;
  _QWORD v16[2];
  uint64_t v17;

  v4 = v3;
  v16[0] = a1;
  v16[1] = a2;
  v6 = type metadata accessor for StocksTabiArticleFeatures();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_247AA0A50(0, v10, 0);
    v11 = v17;
    for (i = a3 + 32; ; i += 40)
    {
      ((void (*)(uint64_t))v16[0])(i);
      if (v4)
        break;
      v4 = 0;
      v17 = v11;
      v14 = *(_QWORD *)(v11 + 16);
      v13 = *(_QWORD *)(v11 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_247AA0A50(v13 > 1, v14 + 1, 1);
        v11 = v17;
      }
      *(_QWORD *)(v11 + 16) = v14 + 1;
      sub_247A9B228((uint64_t)v9, v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v14);
      if (!--v10)
        return v11;
    }
    swift_release();
  }
  return v11;
}

void sub_247AA8388(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  v5 = objc_msgSend((id)(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 64))(v3, v4), sel_itemID);
  v6 = sub_247AAEEF0();
  v8 = v7;
  swift_unknownObjectRelease();

  *a2 = v6;
  a2[1] = v8;
}

uint64_t sub_247AA8414(uint64_t a1)
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
  char *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char v33[16];
  uint64_t v34;
  uint64_t v35;

  v2 = v1;
  sub_247AA2D88(0, (unint64_t *)&unk_254454258, (uint64_t (*)(uint64_t))MEMORY[0x24BEB4238], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v29 - v5;
  v7 = sub_247AAEE60();
  v31 = *(_QWORD *)(v7 - 8);
  v32 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v30 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_247AAED7C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (int *)type metadata accessor for StocksTabiArticleScoringWork();
  v14 = *(_QWORD *)(v2 + v13[6]);
  v34 = v2;
  v35 = a1;
  swift_bridgeObjectRetain();
  v15 = sub_247AA8240((uint64_t)sub_247AA8ABC, (uint64_t)v33, v14);
  swift_bridgeObjectRelease();
  sub_247AAEE84();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + v13[7]), *(_QWORD *)(v2 + v13[7] + 24));
  sub_247AAF01C();
  sub_247A9BF78(v15, (uint64_t)v12);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v16 = sub_247AAEE6C();
  swift_bridgeObjectRelease();
  v17 = (_QWORD *)(v2 + v13[8]);
  v19 = v31;
  v18 = v32;
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  sub_247AAED40();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v6, 1, v18) == 1)
  {
    sub_247AA8AD8((uint64_t)v6);
  }
  else
  {
    v20 = v30;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v30, v6, v18);
    sub_247AA2D88(0, (unint64_t *)&qword_2544543C0, (uint64_t (*)(uint64_t))sub_247A95A2C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    sub_247A95A2C();
    v22 = v21;
    v23 = *(unsigned __int8 *)(*(_QWORD *)(v21 - 8) + 80);
    v24 = (v23 + 32) & ~v23;
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_247AAF690;
    v26 = (_QWORD *)(v25 + v24);
    v27 = v25 + v24 + *(int *)(v22 + 48);
    *v26 = 0xD00000000000001DLL;
    v26[1] = 0x8000000247AB12F0;
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v27, v20, v18);
    sub_247A95334(v25);
    sub_247AAEE6C();
    swift_bridgeObjectRelease();
    sub_247AAEE78();
    swift_release();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v18);
  }
  return v16;
}

uint64_t sub_247AA8724@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[5];

  v7 = objc_msgSend(objc_msgSend(*(id *)(a2 + *(int *)(type metadata accessor for StocksTabiArticleScoringWork() + 36)), sel_bundleSubscriptionProvider), sel_bundleSubscription);
  swift_unknownObjectRelease();
  v8 = a1[3];
  v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  LODWORD(v8) = objc_msgSend(v7, sel_containsItem_, (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 64))(v8, v9));

  swift_unknownObjectRelease();
  sub_247A954CC((uint64_t)a1, (uint64_t)v11);
  return sub_247A9997C(v11, v8, a3, a4);
}

uint64_t sub_247AA882C(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 20));
}

uint64_t sub_247AA8838()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_247AA80F0(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_247AA8890(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(a1, sel_defaultHeadlineScoringOutputName);
  v2 = sub_247AAEEF0();

  return v2;
}

unint64_t sub_247AA88E0()
{
  return 0xD000000000000014;
}

uint64_t sub_247AA88FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v5[5];

  v5[3] = a2;
  v5[4] = sub_247A95E64(&qword_254454108, (uint64_t (*)(uint64_t))type metadata accessor for StocksTabiArticleScoringWork, (uint64_t)&unk_247AB0338);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v5);
  sub_247AA8A78(v2, (uint64_t)boxed_opaque_existential_1);
  sub_247AAECB0();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t sub_247AA89A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = sub_247AAECBC();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t sub_247AA89D0()
{
  return NPDeviceSupportsFeedPersonalization();
}

uint64_t sub_247AA89E4(uint64_t a1)
{
  uint64_t result;

  result = sub_247A95E64((unint64_t *)&qword_254454110, (uint64_t (*)(uint64_t))type metadata accessor for StocksTabiArticleScoringWork, (uint64_t)&unk_247AB0394);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_247AA8A20()
{
  return sub_247A95E64(&qword_254454118, (uint64_t (*)(uint64_t))type metadata accessor for StocksTabiArticleScoringWork, (uint64_t)&unk_247AB0300);
}

uint64_t sub_247AA8A4C()
{
  return sub_247A95E64(&qword_254454078, MEMORY[0x24BE6D068], MEMORY[0x24BE6D060]);
}

uint64_t sub_247AA8A78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StocksTabiArticleScoringWork();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247AA8ABC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_247AA8724(a1, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), a2);
}

uint64_t sub_247AA8AD8(uint64_t a1)
{
  uint64_t v2;

  sub_247AA2D88(0, (unint64_t *)&unk_254454258, (uint64_t (*)(uint64_t))MEMORY[0x24BEB4238], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247AA8B2C(_QWORD *a1)
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
  uint64_t result;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  _QWORD v22[2];
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _QWORD v38[3];
  uint64_t v39;
  uint64_t v40;

  sub_247AAC908(0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v22 - v6;
  v8 = sub_247AAEC74();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for TabiConfigurationManager();
  result = sub_247AAEAA0();
  if (!result)
  {
    __break(1u);
    goto LABEL_12;
  }
  v40 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A95910(0, &qword_254454088);
  result = sub_247AAEAAC();
  if (!v39)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(v38, v39);
  sub_247AAECE0();
  v13 = sub_247AAEC68();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAD0CC(0, &qword_2544541D0);
  result = sub_247AAEAAC();
  if (v34 == 1)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v28 = v33;
  v29 = v34;
  v30 = v35;
  v31 = v36;
  v32 = v37;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAEC8C();
  result = sub_247AAEAA0();
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v27 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAC8C8();
  result = sub_247AAEA94();
  v14 = v25;
  if (!v25)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v23 = v13;
  v15 = v26;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  *(_QWORD *)(v16 + 24) = v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v17 = sub_247AAE680();
  sub_247AAEA94();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  result = v19(v7, 1, v17);
  if ((_DWORD)result == 1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22[1] = sub_247AAE668();
  v20 = *(void (**)(char *, uint64_t))(v18 + 8);
  v20(v7, v17);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAEA94();
  result = v19(v5, 1, v17);
  if ((_DWORD)result == 1)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_247AAE668();
  v20(v5, v17);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for StocksTabiUserEventHistoryFeaturesFactory();
  result = sub_247AAEAA0();
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v24 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAC99C();
  result = sub_247AAEAA0();
  if (result)
  {
    sub_247AAC7C4();
    v21 = sub_247AAEDAC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
    return v21;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_247AA8FD8(_QWORD *a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[3];
  uint64_t v19;
  _UNKNOWN **v20;
  _BYTE v21[24];
  uint64_t v22;
  _BYTE v23[24];
  uint64_t v24;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AACBA4(0, &qword_254454318);
  result = sub_247AAEAA0();
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  v3 = (void *)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAC7C4();
  result = sub_247AAEAA0();
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v4 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A95910(0, &qword_254454170);
  result = sub_247AAEAAC();
  if (!v24)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A95910(0, &qword_2544540A0);
  result = sub_247AAEAAC();
  if (!v22)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AACBA4(0, (unint64_t *)&unk_254454308);
  result = sub_247AAEAA0();
  if (result)
  {
    v5 = result;
    v6 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v24);
    MEMORY[0x24BDAC7A8](v6);
    v8 = (_QWORD *)((char *)&v18[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v9 + 16))(v8);
    v10 = *v8;
    v19 = type metadata accessor for StocksTabiArticleFeaturesFactory();
    v20 = &off_25191FEF8;
    v18[0] = v10;
    v11 = (char *)objc_allocWithZone((Class)type metadata accessor for StocksTabiUserEventHistoryScoringService());
    v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v19);
    MEMORY[0x24BDAC7A8](v12);
    v14 = (_QWORD *)((char *)&v18[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v15 + 16))(v14);
    v16 = sub_247AACC1C(v3, v4, *v14, (uint64_t)v21, v5, v11);
    swift_unknownObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    return (uint64_t)v16;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_247AA9298@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAC924();
  v4 = v3;
  result = sub_247AAEAA0();
  if (result)
  {
    v6 = result;
    a2[3] = v4;
    result = sub_247A95E64((unint64_t *)&unk_2576DA6F0, (uint64_t (*)(uint64_t))sub_247AAC924, MEMORY[0x24BE6CFF0]);
    a2[4] = result;
    *a2 = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_247AA9324@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247AAB5DC(a1, (uint64_t (*)(_QWORD))type metadata accessor for StocksTabiWorkServiceUnloaderService, (uint64_t)&off_25191FBA0, a2);
}

uint64_t sub_247AA9338@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
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
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  uint64_t result;
  unint64_t v21;
  void (*v22)(unint64_t, char *, uint64_t);
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t (**v27)();
  uint64_t v28;
  uint64_t (**v29)();
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;

  v29 = a2;
  sub_247AAC908(0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v31 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v32 = (char *)&v28 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v28 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v28 - v11;
  sub_247AA2D88(0, &qword_254454378, (uint64_t (*)(uint64_t))sub_247AACA74, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  sub_247AACA74();
  v33 = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v30 = *(_QWORD *)(v14 + 72);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_247AB01E0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v17 = sub_247AAE680();
  sub_247AAEA94();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  result = v19(v12, 1, v17);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  v28 = v16;
  v21 = v16 + v15;
  v22 = *(void (**)(unint64_t, char *, uint64_t))(v18 + 32);
  v22(v21, v12, v17);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAEA94();
  result = v19(v10, 1, v17);
  if ((_DWORD)result == 1)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v22(v21 + *(int *)(v33 + 48), v10, v17);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v23 = v32;
  sub_247AAEA94();
  result = v19(v23, 1, v17);
  if ((_DWORD)result == 1)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v24 = v21 + v30;
  v22(v21 + v30, v23, v17);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v25 = v31;
  sub_247AAEA94();
  result = v19(v25, 1, v17);
  v26 = v28;
  if ((_DWORD)result != 1)
  {
    v22(v24 + *(int *)(v33 + 48), v25, v17);
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v26;
    v27 = v29;
    *v29 = sub_247AACAFC;
    v27[1] = (uint64_t (*)())result;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_247AA96AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  unint64_t v25;
  void *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  void (*v34)(char *, char *, uint64_t);
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  __int128 v64;
  int v65;
  id v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  char *v75;
  unint64_t v76;
  void *v77;
  id v78;
  unint64_t v79;
  char v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v2 = sub_247AAE680();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v64 - v7;
  sub_247AA2D88(0, &qword_254453FA8, (uint64_t (*)(uint64_t))sub_247AACA74, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v64 - v13;
  v15 = *(_QWORD *)(a1 + 16);
  v72 = a1;
  swift_bridgeObjectRetain();
  v76 = 0;
  v67 = xmmword_247AB01E0;
  v64 = xmmword_247AB0420;
  v71 = xmmword_247AAF690;
  v74 = v12;
  v75 = v6;
  v68 = v3;
  v73 = v15;
  while (1)
  {
    if (v76 == v15)
    {
      sub_247AACA74();
      v29 = v28;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v12, 1, 1, v28);
      v76 = v15;
    }
    else
    {
      if (v76 >= v15)
        __break(1u);
      sub_247AACA74();
      v29 = v30;
      v31 = *(_QWORD *)(v30 - 8);
      v32 = v76;
      sub_247AACB04(v72+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(_QWORD *)(v31 + 72) * v76, (uint64_t)v12);
      v76 = v32 + 1;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v12, 0, 1, v29);
    }
    sub_247AACB48((uint64_t)v12, (uint64_t)v14);
    sub_247AACA74();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 48))(v14, 1, v29) == 1)
      return swift_bridgeObjectRelease();
    v33 = &v14[*(int *)(v29 + 48)];
    v34 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v34(v8, v14, v2);
    v34(v6, v33, v2);
    v80 = 1;
    v35 = (void *)objc_opt_self();
    v36 = objc_msgSend(v35, sel_defaultManager);
    sub_247AAE668();
    v37 = (void *)sub_247AAEEE4();
    swift_bridgeObjectRelease();
    LODWORD(v34) = objc_msgSend(v36, sel_fileExistsAtPath_isDirectory_, v37, &v80);

    if (!(_DWORD)v34)
    {
      v55 = MEMORY[0x24BEE0D00];
      if (qword_254454190 != -1)
        swift_once();
      v56 = (void *)qword_254454188;
      sub_247A96CB8();
      v57 = swift_allocObject();
      *(_OWORD *)(v57 + 16) = v71;
      sub_247A95E64(&qword_254453FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v58 = v56;
      v59 = sub_247AAF13C();
      v61 = v60;
      *(_QWORD *)(v57 + 56) = v55;
      *(_QWORD *)(v57 + 64) = sub_247A9595C();
      *(_QWORD *)(v57 + 32) = v59;
      *(_QWORD *)(v57 + 40) = v61;
      sub_247AAEFF8();
      sub_247AAED88();

      swift_bridgeObjectRelease();
      v6 = v75;
      goto LABEL_3;
    }
    if (v80 == 1)
    {
      if (qword_254454190 != -1)
        swift_once();
      v38 = (void *)qword_254454188;
      sub_247A96CB8();
      v69 = v39;
      v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = v67;
      v41 = sub_247A95E64(&qword_254453FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v42 = v38;
      v43 = sub_247AAF13C();
      v45 = v44;
      v46 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v40 + 56) = MEMORY[0x24BEE0D00];
      v47 = sub_247A9595C();
      *(_QWORD *)(v40 + 64) = v47;
      *(_QWORD *)(v40 + 32) = v43;
      *(_QWORD *)(v40 + 40) = v45;
      v70 = v41;
      v48 = v47;
      v49 = sub_247AAF13C();
      *(_QWORD *)(v40 + 96) = v46;
      *(_QWORD *)(v40 + 104) = v48;
      *(_QWORD *)(v40 + 72) = v49;
      *(_QWORD *)(v40 + 80) = v50;
      sub_247AAEFF8();
      sub_247AAED88();

      swift_bridgeObjectRelease();
      v51 = objc_msgSend(v35, sel_defaultManager);
      v52 = (void *)sub_247AAE650();
      v53 = (void *)sub_247AAE650();
      v78 = 0;
      LODWORD(v45) = objc_msgSend(v51, sel_moveItemAtURL_toURL_error_, v52, v53, &v78);

      if (!(_DWORD)v45)
      {
        v16 = v78;
        v17 = (void *)sub_247AAE620();

        swift_willThrow();
        v66 = (id)qword_254454188;
        v65 = sub_247AAEFEC();
        v18 = swift_allocObject();
        *(_OWORD *)(v18 + 16) = v64;
        v19 = sub_247AAF13C();
        *(_QWORD *)(v18 + 56) = v46;
        *(_QWORD *)(v18 + 64) = v48;
        *(_QWORD *)(v18 + 32) = v19;
        *(_QWORD *)(v18 + 40) = v20;
        v21 = v75;
        v22 = sub_247AAF13C();
        *(_QWORD *)(v18 + 96) = v46;
        *(_QWORD *)(v18 + 104) = v48;
        *(_QWORD *)(v18 + 72) = v22;
        *(_QWORD *)(v18 + 80) = v23;
        v78 = 0;
        v79 = 0xE000000000000000;
        v77 = v17;
        sub_247A95910(0, &qword_2544543F0);
        sub_247AAF0A0();
        v24 = v78;
        v25 = v79;
        *(_QWORD *)(v18 + 136) = v46;
        *(_QWORD *)(v18 + 144) = v48;
        *(_QWORD *)(v18 + 112) = v24;
        *(_QWORD *)(v18 + 120) = v25;
        v26 = v66;
        sub_247AAED88();

        swift_bridgeObjectRelease();
        v3 = v68;
        v6 = v21;
LABEL_3:
        v15 = v73;
        v12 = v74;
        goto LABEL_4;
      }
      v54 = v78;
      v3 = v68;
      v12 = v74;
      v6 = v75;
      v15 = v73;
    }
    else
    {
      v15 = v73;
      if (qword_254454190 != -1)
        swift_once();
      v62 = (id)qword_254454188;
      sub_247AAEFEC();
      sub_247AAED88();

      v12 = v74;
    }
LABEL_4:
    v27 = *(void (**)(char *, uint64_t))(v3 + 8);
    v27(v6, v2);
    v27(v8, v2);
  }
}

uint64_t sub_247AA9DE8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD v17[4];
  __int128 v18;
  __int128 v19;
  __int128 v20;

  sub_247AA2D88(0, &qword_254453FC0, (uint64_t (*)(uint64_t))sub_247AAC908, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v17 - v5;
  v7 = sub_247AAE680();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAC908(0);
  v12 = v11;
  sub_247AAEA94();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v6, 1, v12);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    result = sub_247AACA38((uint64_t)v6);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_QWORD *)(a2 + 48) = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_247AAE5D8();
    swift_allocObject();
    sub_247AAE5CC();
    v14 = sub_247AAE68C();
    v16 = v15;
    sub_247A98E48();
    sub_247AAE5C0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_247A97F84(v14, v16);
    result = swift_release();
    *(_QWORD *)a2 = v17[3];
    *(_OWORD *)(a2 + 8) = v18;
    *(_OWORD *)(a2 + 24) = v19;
    *(_OWORD *)(a2 + 40) = v20;
  }
  return result;
}

uint64_t sub_247AAA14C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  unint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  void (*v30)(char *, _QWORD, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  _QWORD *v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  char *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  void (*v43)(void);
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v53;
  void *v54;
  unsigned int v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *, _QWORD, uint64_t);
  unsigned int v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  unint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  unsigned int (*v85)(char *, uint64_t, uint64_t);
  uint64_t v86;
  _QWORD *v87;
  char *v88;
  void (*v89)(void);
  uint64_t v90;
  _WORD v91[8];
  uint64_t v92;
  uint64_t v93;

  v78 = a2;
  v93 = *MEMORY[0x24BDAC8D0];
  v83 = sub_247AAE62C();
  v87 = *(_QWORD **)(v83 - 8);
  MEMORY[0x24BDAC7A8](v83);
  v82 = (char *)&v72 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_247AAE680();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0];
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v79 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v81 = (char *)&v72 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v84 = (char *)&v72 - v11;
  sub_247AAC908(0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v88 = (char *)&v72 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v72 - v18;
  sub_247AA2D88(0, &qword_254454380, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v20 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v90 = *(_QWORD *)(v6 + 72);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_247AB01E0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v22 = v6;
  sub_247AAEA94();
  v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  if (v23(v19, 1, v4) == 1)
  {
    __break(1u);
LABEL_31:
    __break(1u);
  }
  v77 = v21;
  v80 = v20;
  v24 = v21 + v20;
  v89 = *(void (**)(void))(v22 + 32);
  ((void (*)(unint64_t, char *, uint64_t))v89)(v24, v19, v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v25 = v88;
  sub_247AAEA94();
  v85 = v23;
  if (v23(v25, 1, v4) == 1)
    goto LABEL_31;
  v75 = v24 + v90;
  v89();
  v92 = MEMORY[0x24BEE4AF8];
  sub_247AA0A7C(0, 2, 0);
  v26 = *(char **)(v22 + 16);
  v27 = *MEMORY[0x24BDCD798];
  v28 = v81;
  v76 = v24;
  v88 = v26;
  ((void (*)(char *, unint64_t, uint64_t))v26)(v81, v24, v4);
  strcpy((char *)v91, "configuration");
  v91[7] = -4864;
  v29 = v87;
  v30 = (void (*)(char *, _QWORD, uint64_t))v87[13];
  v31 = v82;
  v74 = v27;
  v32 = v27;
  v33 = v83;
  v73 = v30;
  v30(v82, v32, v83);
  sub_247AAC9F4();
  sub_247AAE674();
  v34 = v22;
  v35 = (void (*)(char *, uint64_t))v29[1];
  v35(v31, v33);
  swift_bridgeObjectRelease();
  v36 = *(_QWORD **)(v34 + 8);
  v86 = v34;
  v87 = v36;
  ((void (*)(char *, uint64_t))v36)(v28, v4);
  v37 = v92;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v39 = v79;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_247AA0A7C(0, *(_QWORD *)(v37 + 16) + 1, 1);
    v37 = v92;
  }
  v40 = v80;
  v42 = *(_QWORD *)(v37 + 16);
  v41 = *(_QWORD *)(v37 + 24);
  if (v42 >= v41 >> 1)
  {
    sub_247AA0A7C(v41 > 1, v42 + 1, 1);
    v37 = v92;
  }
  *(_QWORD *)(v37 + 16) = v42 + 1;
  v43 = v89;
  ((void (*)(unint64_t, char *, uint64_t))v89)(v37 + v40 + v42 * v90, v84, v4);
  v92 = v37;
  v44 = v81;
  ((void (*)(char *, uint64_t, uint64_t))v88)(v81, v75, v4);
  strcpy((char *)v91, "configuration");
  v91[7] = -4864;
  v45 = v82;
  v46 = v83;
  v73(v82, v74, v83);
  sub_247AAE674();
  v35(v45, v46);
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t))v87)(v44, v4);
  v47 = v92;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_247AA0A7C(0, *(_QWORD *)(v47 + 16) + 1, 1);
    v47 = v92;
  }
  v49 = *(_QWORD *)(v47 + 16);
  v48 = *(_QWORD *)(v47 + 24);
  if (v49 >= v48 >> 1)
  {
    sub_247AA0A7C(v48 > 1, v49 + 1, 1);
    v47 = v92;
  }
  *(_QWORD *)(v47 + 16) = v49 + 1;
  v50 = v47 + v80;
  ((void (*)(unint64_t, char *, uint64_t))v43)(v47 + v80 + v49 * v90, v84, v4);
  v92 = v47;
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v51 = *(_QWORD *)(v47 + 16);
  if (v51)
  {
    while (1)
    {
      ((void (*)(char *, uint64_t, uint64_t))v88)(v15, v50, v4);
      v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v86 + 56);
      v52((uint64_t)v15, 0, 1, v4);
      if (v85(v15, 1, v4) == 1)
        break;
      ((void (*)(char *, char *, uint64_t))v89)(v39, v15, v4);
      LOBYTE(v91[0]) = 0;
      v53 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
      sub_247AAE668();
      v54 = (void *)sub_247AAEEE4();
      swift_bridgeObjectRelease();
      v55 = objc_msgSend(v53, sel_fileExistsAtPath_isDirectory_, v54, v91);

      if (v55)
      {
        swift_release();
        if ((v91[0] & 1) != 0)
        {
          if (qword_254454190 != -1)
            swift_once();
          v60 = (id)qword_254454188;
          sub_247AAEFEC();
          sub_247A96CB8();
          v61 = swift_allocObject();
          *(_OWORD *)(v61 + 16) = xmmword_247AAF690;
          sub_247A95E64(&qword_254453FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
          v62 = sub_247AAF13C();
          v64 = v63;
          *(_QWORD *)(v61 + 56) = MEMORY[0x24BEE0D00];
          *(_QWORD *)(v61 + 64) = sub_247A9595C();
          *(_QWORD *)(v61 + 32) = v62;
          *(_QWORD *)(v61 + 40) = v64;
          sub_247AAED88();

          swift_bridgeObjectRelease();
          ((void (*)(char *, uint64_t))v87)(v39, v4);
          goto LABEL_21;
        }
        if (qword_254454190 != -1)
          swift_once();
        v65 = (void *)qword_254454188;
        sub_247A96CB8();
        v66 = swift_allocObject();
        *(_OWORD *)(v66 + 16) = xmmword_247AAF690;
        sub_247A95E64(&qword_254453FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
        v67 = v65;
        v68 = sub_247AAF13C();
        v70 = v69;
        *(_QWORD *)(v66 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v66 + 64) = sub_247A9595C();
        *(_QWORD *)(v66 + 32) = v68;
        *(_QWORD *)(v66 + 40) = v70;
        sub_247AAEFF8();
        sub_247AAED88();

        swift_bridgeObjectRelease();
        v71 = v78;
        ((void (*)(uint64_t, char *, uint64_t))v89)(v78, v39, v4);
        v57 = v71;
        v58 = 0;
        return v52(v57, v58, 1, v4);
      }
      ((void (*)(char *, uint64_t))v87)(v39, v4);
      v50 += v90;
      if (!--v51)
        goto LABEL_17;
    }
  }
  else
  {
    v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v86 + 56);
LABEL_17:
    v52((uint64_t)v15, 1, 1, v4);
  }
  swift_release();
  if (qword_254454190 != -1)
    swift_once();
  v56 = (id)qword_254454188;
  sub_247AAEFF8();
  sub_247AAED88();

LABEL_21:
  v57 = v78;
  v58 = 1;
  return v52(v57, v58, 1, v4);
}

void *sub_247AAAAB8(_QWORD *a1)
{
  return sub_247AAAAF4(a1, (SEL *)&selRef_tabiResourcesContentDirectoryLegacy);
}

void *sub_247AAAAC4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_247AAABCC(a1, 0x7365722D69626174, 0xEE0073656372756FLL, a2);
}

void *sub_247AAAAE8(_QWORD *a1)
{
  return sub_247AAAAF4(a1, (SEL *)&selRef_tabiModelsContentDirectoryLegacy);
}

void *sub_247AAAAF4(_QWORD *a1, SEL *a2)
{
  void *result;
  id v4;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AACBA4(0, (unint64_t *)&unk_2544542E0);
  result = (void *)sub_247AAEAA0();
  if (result)
  {
    v4 = objc_msgSend(result, *a2);
    swift_unknownObjectRelease();
    sub_247AAEEF0();

    sub_247AAE644();
    return (void *)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_247AAABAC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_247AAABCC(a1, 0x646F6D2D69626174, 0xEB00000000736C65, a2);
}

void *sub_247AAABCC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *result;
  void *v15;
  id v16;
  _QWORD v17[4];

  v17[0] = a3;
  v17[1] = a4;
  v6 = sub_247AAE62C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_247AAE680();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAD110(0, &qword_2544542D8);
  result = (void *)sub_247AAEAA0();
  if (result)
  {
    v15 = result;
    v16 = objc_msgSend(result, sel_privateDataDirectory);

    sub_247AAEEF0();
    sub_247AAE638();
    swift_bridgeObjectRelease();
    v17[2] = a2;
    v17[3] = v17[0];
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDCD790], v6);
    sub_247AAC9F4();
    sub_247AAE674();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease();
    return (void *)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_247AAAD8C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  sub_247AAC908(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v5 = sub_247AAE680();
  sub_247AAEA94();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_247A95910(0, &qword_254454018);
    result = sub_247AAEAAC();
    if (v11)
    {
      type metadata accessor for TabiConfigurationManager();
      v8 = swift_allocObject();
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v8 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_bundledConfigurationURL, v4, v5);
      sub_247A95814(&v10, v8 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager);
      return v8;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247AAAF04@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_247AAB188(a1, 0x72756769666E6F63, 0xED00006E6F697461, MEMORY[0x24BDCD798], a2);
}

uint64_t sub_247AAAF30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t ObjCClassFromMetadata;
  id v12;
  id v13;
  uint64_t result;
  _QWORD v15[2];

  v0 = sub_247AAE62C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_247AAE680();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AAC908(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AAEBFC();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v12 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v13 = objc_msgSend(v12, sel_resourceURL);

  if (v13)
  {
    sub_247AAE65C();

    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v7, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4);
    if ((_DWORD)result != 1)
    {
      v15[0] = 0xD000000000000016;
      v15[1] = 0x8000000247AB13E0;
      (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDCD790], v0);
      sub_247AAC9F4();
      sub_247AAE674();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
  }
  __break(1u);
  return result;
}

uint64_t sub_247AAB168@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_247AAB188(a1, 0x736567616B636170, 0xE800000000000000, MEMORY[0x24BDCD790], a2);
}

uint64_t sub_247AAB188@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD v18[4];

  v18[0] = a4;
  v18[1] = a5;
  v8 = sub_247AAE62C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AAC908(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v15 = sub_247AAE680();
  sub_247AAEA94();
  v16 = *(_QWORD *)(v15 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v18[2] = a2;
    v18[3] = a3;
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *(unsigned int *)v18[0], v8);
    sub_247AAC9F4();
    sub_247AAE674();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v14, v15);
  }
  return result;
}

uint64_t sub_247AAB31C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t result;
  _QWORD v7[6];

  sub_247AAC908(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v5 = sub_247AAE680();
  sub_247AAEA94();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_247A95910(0, &qword_254454268);
    result = sub_247AAEAAC();
    if (v7[4])
    {
      sub_247AAEC8C();
      swift_allocObject();
      return sub_247AAEC80();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247AAB464@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A95910(0, (unint64_t *)&unk_2544540A8);
  result = sub_247AAEAAC();
  if (v7)
  {
    v4 = type metadata accessor for StocksTabiArticleFeaturesFactory();
    v5 = swift_allocObject();
    result = sub_247A95814(&v6, v5 + 16);
    a2[3] = v4;
    a2[4] = (uint64_t)&off_25191FEF8;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_247AAB510(_QWORD *a1)
{
  id result;
  uint64_t v3;
  uint64_t v4;
  id v5;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for TabiConfigurationManager();
  result = (id)sub_247AAEAA0();
  if (result)
  {
    v3 = (uint64_t)result;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_247AAC7C4();
    result = (id)sub_247AAEAA0();
    if (result)
    {
      v4 = (uint64_t)result;
      v5 = objc_allocWithZone((Class)type metadata accessor for StocksTabiWorkServiceUnloaderService());
      return sub_247A963D0(v3, v4);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_247AAB5C8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247AAB5DC(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE6D138], MEMORY[0x24BE6D128], a2);
}

uint64_t sub_247AAB5DC@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v7;
  uint64_t result;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v7 = a2(0);
  result = sub_247AAEAA0();
  if (result)
  {
    a4[3] = v7;
    a4[4] = a3;
    *a4 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_247AAB658(uint64_t a1)
{
  return sub_247AAB934(a1, (void (*)(_QWORD))MEMORY[0x24BE6D138], MEMORY[0x24BE6D130]);
}

uint64_t sub_247AAB66C(_QWORD *a1)
{
  return sub_247AAB778(a1, (void (*)(_QWORD))MEMORY[0x24BE6D158], (void (*)(_QWORD))type metadata accessor for StocksTabiUserEventHistoryFeaturesFactory);
}

uint64_t sub_247AAB680(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A95910(0, &qword_2544540B8);
  result = sub_247AAEAAC();
  if (v4)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_247A95910(0, &qword_254454080);
    result = sub_247AAEAAC();
    if (v3)
    {
      sub_247AAED70();
      swift_allocObject();
      return sub_247AAED64();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_247AAB764(_QWORD *a1)
{
  return sub_247AAB778(a1, (void (*)(_QWORD))sub_247AAC7C4, (void (*)(_QWORD))type metadata accessor for StocksTabiWorkServiceStartupTask);
}

uint64_t sub_247AAB778(_QWORD *a1, void (*a2)(_QWORD), void (*a3)(_QWORD))
{
  uint64_t result;
  uint64_t v6;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a2(0);
  result = sub_247AAEAA0();
  if (result)
  {
    v6 = result;
    a3(0);
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_247AAB7F8(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD v5[5];

  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  v2 = type metadata accessor for StocksTabiWorkServiceStartupTask();
  result = sub_247AAEAA0();
  if (result)
  {
    v4 = result;
    v5[3] = v2;
    v5[4] = sub_247A95E64((unint64_t *)&unk_254454160, (uint64_t (*)(uint64_t))type metadata accessor for StocksTabiWorkServiceStartupTask, (uint64_t)&unk_247AAFD44);
    v5[0] = v4;
    sub_247AAEB24();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_247AAB8A4(_QWORD *a1)
{
  uint64_t result;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247AAC7C4();
  result = sub_247AAEAA0();
  if (result)
  {
    sub_247AAC924();
    swift_allocObject();
    return sub_247AAEC44();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_247AAB920(uint64_t a1)
{
  return sub_247AAB934(a1, (void (*)(_QWORD))sub_247AAC99C, MEMORY[0x24BEB4228]);
}

uint64_t sub_247AAB934(uint64_t a1, void (*a2)(_QWORD), uint64_t (*a3)(void))
{
  a2(0);
  swift_allocObject();
  return a3();
}

uint64_t sub_247AAB96C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A95910(0, &qword_254454008);
  result = sub_247AAEAAC();
  if (!v15)
  {
    __break(1u);
    goto LABEL_8;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A95910(0, &qword_254454000);
  result = sub_247AAEAAC();
  if (!v13)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A95910(0, &qword_254454018);
  result = sub_247AAEAAC();
  if (!v11)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A95910(0, &qword_254454010);
  result = sub_247AAEAAC();
  if (!v9)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for StocksTabiUserEventHistoryScoringService();
  result = sub_247AAEAA0();
  if (result)
  {
    v5 = result;
    v6 = type metadata accessor for NewsHeadlineScorerFactory();
    v7 = swift_allocObject();
    sub_247A95814(&v14, v7 + 16);
    sub_247A95814(&v12, v7 + 56);
    sub_247A95814(&v10, v7 + 96);
    sub_247A95814(&v8, v7 + 136);
    *(_QWORD *)(v7 + 176) = v5;
    a2[3] = v6;
    result = sub_247A95E64(&qword_254454218, (uint64_t (*)(uint64_t))type metadata accessor for NewsHeadlineScorerFactory, (uint64_t)&protocol conformance descriptor for NewsHeadlineScorerFactory);
    a2[4] = result;
    *a2 = v7;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_247AABB84()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StocksTabiAssembly()
{
  return objc_opt_self();
}

uint64_t sub_247AABBB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t);
  void (*v8)(char *, uint64_t, uint64_t);
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  void (*v16)(char *, uint64_t);
  void (*v18)(char *, uint64_t, uint64_t);
  unsigned int v19;
  void (*v20)(char *, uint64_t);
  unsigned int v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];

  v0 = sub_247AAEAB8();
  v23 = *(_QWORD *)(v0 - 8);
  v24 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v22 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_247AAEB90();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AAEADC();
  sub_247AAC7C4();
  sub_247AAEB54();
  swift_release();
  v6 = *MEMORY[0x24BEB4660];
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v7(v5, v6, v2);
  v8 = v7;
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v9(v5, v2);
  sub_247AAEAE8();
  type metadata accessor for StocksTabiUserEventHistoryScoringService();
  sub_247AAEB54();
  swift_release();
  v8(v5, v6, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEADC();
  sub_247A95910(0, (unint64_t *)&unk_254454028);
  sub_247AAEB60();
  swift_release();
  swift_release();
  sub_247AAEADC();
  sub_247A95910(0, &qword_254454180);
  sub_247AAEB60();
  swift_release();
  v10 = *MEMORY[0x24BEB4658];
  ((void (*)(char *))v8)(v5);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEAE8();
  sub_247AAC8C8();
  sub_247AAEB60();
  swift_release();
  swift_release();
  sub_247AAEAE8();
  sub_247AAD0CC(0, &qword_2544541D0);
  sub_247AAEB60();
  swift_release();
  swift_release();
  sub_247AAEAE8();
  sub_247AAC908(0);
  sub_247AAEB60();
  swift_release();
  swift_release();
  sub_247AAEAE8();
  sub_247AAE680();
  sub_247AAEB60();
  swift_release();
  v8(v5, v10, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEAE8();
  sub_247AAEB60();
  swift_release();
  v8(v5, v10, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEAE8();
  sub_247AAEB60();
  swift_release();
  v21 = v10;
  v8(v5, v10, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEAE8();
  sub_247AAEB60();
  swift_release();
  v8(v5, v10, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEAE8();
  type metadata accessor for TabiConfigurationManager();
  sub_247AAEB54();
  swift_release();
  v8(v5, v6, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEAE8();
  sub_247AAEB60();
  swift_release();
  v8(v5, v6, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEAE8();
  sub_247AAEB60();
  swift_release();
  v8(v5, v6, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEAE8();
  sub_247AAEB60();
  swift_release();
  v8(v5, v6, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEAE8();
  sub_247AAEC8C();
  sub_247AAEB54();
  swift_release();
  v8(v5, v6, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEAE8();
  sub_247A95910(0, &qword_254454170);
  sub_247AAEB60();
  swift_release();
  swift_release();
  sub_247AAEAE8();
  type metadata accessor for StocksTabiWorkServiceUnloaderService();
  sub_247AAEB54();
  swift_release();
  v8(v5, v21, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEAE8();
  sub_247A95910(0, (unint64_t *)&unk_2544540A8);
  sub_247AAEB60();
  swift_release();
  swift_release();
  sub_247AAEAE8();
  sub_247AAED4C();
  sub_247AAEB54();
  swift_release();
  swift_release();
  sub_247AAEAE8();
  type metadata accessor for StocksTabiUserEventHistoryFeaturesFactory();
  sub_247AAEB54();
  swift_release();
  v19 = v6;
  v8(v5, v6, v2);
  v18 = v8;
  sub_247AAEA88();
  swift_release();
  swift_release();
  v20 = v9;
  v9(v5, v2);
  sub_247AAEAE8();
  sub_247AAED70();
  sub_247AAEB54();
  swift_release();
  v8(v5, v6, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v9(v5, v2);
  sub_247AAEAE8();
  type metadata accessor for StocksTabiWorkServiceStartupTask();
  sub_247AAEB54();
  swift_release();
  swift_release();
  sub_247AAEAF4();
  __swift_project_boxed_opaque_existential_1(v25, v25[3]);
  sub_247AAEB30();
  v11 = v22;
  v12 = v23;
  v13 = v24;
  (*(void (**)(char *, _QWORD, uint64_t))(v23 + 104))(v22, *MEMORY[0x24BEB43D0], v24);
  sub_247AAEB6C();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v11, v13);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  sub_247AAEAE8();
  sub_247AAC924();
  sub_247AAEB54();
  swift_release();
  v14 = v19;
  v15 = v18;
  v18(v5, v19, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v16 = v20;
  v20(v5, v2);
  sub_247AAEAE8();
  sub_247AAC99C();
  sub_247AAEB54();
  swift_release();
  v15(v5, v14, v2);
  sub_247AAEA88();
  swift_release();
  swift_release();
  v16(v5, v2);
  sub_247AAEADC();
  sub_247A95910(0, &qword_254454020);
  sub_247AAEB60();
  swift_release();
  return swift_release();
}

void sub_247AAC7C4()
{
  uint64_t (*v0)(uint64_t);
  unint64_t v1;
  uint64_t v2;

  if (!qword_254454248)
  {
    type metadata accessor for TabiConfigurationManager();
    type metadata accessor for StocksTabiUserEventHistoryFeaturesFactory();
    sub_247AAEC8C();
    v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BE6D030];
    sub_247A95E64(&qword_254454200, (uint64_t (*)(uint64_t))type metadata accessor for TabiConfigurationManager, (uint64_t)&unk_247AB0228);
    sub_247A95E64(&qword_254454178, (uint64_t (*)(uint64_t))type metadata accessor for StocksTabiUserEventHistoryFeaturesFactory, (uint64_t)&unk_247AAF97C);
    sub_247A95E64(&qword_254454070, v0, MEMORY[0x24BE6D020]);
    v1 = sub_247AAEDD0();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_254454248);
  }
}

unint64_t sub_247AAC8C8()
{
  unint64_t result;

  result = qword_254454418;
  if (!qword_254454418)
  {
    result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_254454418);
  }
  return result;
}

void sub_247AAC908(uint64_t a1)
{
  sub_247AA2D88(a1, &qword_254453FB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

void sub_247AAC924()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254454060)
  {
    sub_247AAC7C4();
    sub_247A95E64((unint64_t *)&unk_254454238, (uint64_t (*)(uint64_t))sub_247AAC7C4, MEMORY[0x24BEB41D8]);
    v0 = sub_247AAEC50();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254454060);
  }
}

void sub_247AAC99C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254454250)
  {
    sub_247A95D2C();
    v0 = sub_247AAEE3C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254454250);
  }
}

unint64_t sub_247AAC9F4()
{
  unint64_t result;

  result = qword_254454270;
  if (!qword_254454270)
  {
    result = MEMORY[0x24958A948](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254454270);
  }
  return result;
}

uint64_t sub_247AACA38(uint64_t a1)
{
  uint64_t v2;

  sub_247AAC908(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_247AACA74()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_254453FA0)
  {
    sub_247AAE680();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_254453FA0);
  }
}

uint64_t sub_247AACAD8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_247AACAFC()
{
  uint64_t v0;

  return sub_247AA96AC(*(_QWORD *)(v0 + 16));
}

uint64_t sub_247AACB04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_247AACA74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247AACB48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_247AA2D88(0, &qword_254453FA8, (uint64_t (*)(uint64_t))sub_247AACA74, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247AACBA4(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
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

id sub_247AACC1C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6)
{
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  char *v12;
  void *v13;
  char *v14;
  void *v15;
  unint64_t v16;
  id v17;
  unsigned __int8 v18;
  char v19;
  id v20;
  objc_class *ObjectType;
  void *v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[3];
  uint64_t v31;
  _QWORD v32[6];

  ObjectType = (objc_class *)swift_getObjectType();
  v9 = sub_247AAEB3C();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BEB4510];
  MEMORY[0x24BDAC7A8](v9);
  v32[3] = type metadata accessor for StocksTabiArticleFeaturesFactory();
  v32[4] = &off_25191FEF8;
  v32[0] = a3;
  v11 = OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_prepareForUseDeduper;
  v30[0] = MEMORY[0x24BEE4AF8];
  sub_247A95E64(&qword_254454040, v10, MEMORY[0x24BEB4518]);
  sub_247AA2D88(0, &qword_254454298, v10, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_247AAD004();
  v12 = a6;
  sub_247AAF058();
  sub_247AAD064();
  swift_allocObject();
  *(_QWORD *)&a6[v11] = sub_247AAEAC4();
  sub_247AAD110(0, (unint64_t *)&qword_254454330);
  v13 = (void *)sub_247AAF028();
  sub_247AAEFE0();
  sub_247AAED88();

  v14 = (char *)objc_msgSend(a1, sel_cachedSubscription);
  if (objc_getAssociatedObject(v14, v14 + 1))
  {
    sub_247AAF04C();
    swift_unknownObjectRelease();
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
  }
  sub_247A938C4((uint64_t)&v28, (uint64_t)v30);
  if (!v31)
  {
    sub_247A93960((uint64_t)v30);
    goto LABEL_9;
  }
  sub_247AAD110(0, (unint64_t *)&qword_254454320);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    v15 = 0;
    v16 = 0;
    goto LABEL_10;
  }
  v15 = v26;
  v16 = (unint64_t)objc_msgSend(v26, sel_integerValue);
  if (v16 == -1)
    goto LABEL_17;
LABEL_10:
  if (objc_getAssociatedObject(v14, (const void *)~v16))
  {
    sub_247AAF04C();
    swift_unknownObjectRelease();
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
  }
  sub_247A938C4((uint64_t)&v28, (uint64_t)v30);
  if (!v31)
  {
    sub_247A93960((uint64_t)v30);
    goto LABEL_17;
  }
  sub_247AAD110(0, (unint64_t *)&qword_254454320);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_17:

    v19 = -53;
    goto LABEL_18;
  }
  v17 = v26;
  v18 = objc_msgSend(v17, sel_integerValue);

  v19 = v18 - 53;
LABEL_18:
  v12[OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_isSubscribed] = ((v16 + 1) ^ v19) & 1;
  *(_QWORD *)&v12[OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_workService] = a2;
  sub_247A954CC((uint64_t)v32, (uint64_t)&v12[OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_articleFeaturesFactory]);
  sub_247A954CC(a4, (uint64_t)&v12[OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_userEmbeddingProvider]);
  *(_QWORD *)&v12[OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_paidAccessChecker] = a5;
  swift_retain();
  swift_unknownObjectRetain();

  v27.receiver = v12;
  v27.super_class = ObjectType;
  v20 = objc_msgSendSuper2(&v27, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  return v20;
}

unint64_t sub_247AAD004()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544542A0;
  if (!qword_2544542A0)
  {
    sub_247AA2D88(255, &qword_254454298, (uint64_t (*)(uint64_t))MEMORY[0x24BEB4510], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x24958A948](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2544542A0);
  }
  return result;
}

void sub_247AAD064()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254454038)
  {
    v0 = sub_247AAEAD0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254454038);
  }
}

void sub_247AAD0CC(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_247AAF040();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_247AAD110(uint64_t a1, unint64_t *a2)
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

uint64_t sub_247AAD148()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247AAD16C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for StocksTabiScoringContextEventProcessor()
{
  uint64_t result;

  result = qword_2576DA7E0;
  if (!qword_2576DA7E0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247AAD1C8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_247AAED34();
  if (v1 <= 0x3F)
  {
    result = sub_247AAE680();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_247AAD270(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t (*v23)(uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD aBlock[6];

  v2 = sub_247AAEE90();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_247AAEEA8();
  v31 = *(_QWORD *)(v6 - 8);
  v32 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AAE39C();
  v10 = v9;
  v11 = *(_QWORD *)(v9 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_247AAEE00();
  if (result)
  {
    v15 = result;
    v27 = v5;
    v16 = v30;
    v29 = *(_QWORD *)&v30[qword_2576DA7D8];
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
    v17 = *(unsigned __int8 *)(v11 + 80);
    v26 = v2;
    v18 = (v17 + 16) & ~v17;
    v19 = (v12 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
    v28 = v3;
    v20 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v20 + v18, v13, v10);
    *(_QWORD *)(v20 + v19) = v16;
    *(_QWORD *)(v20 + ((v19 + 15) & 0xFFFFFFFFFFFFFFF8)) = v15;
    aBlock[4] = sub_247AAE4A0;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247AAD934;
    aBlock[3] = &block_descriptor_9;
    v21 = _Block_copy(aBlock);
    v22 = v16;
    swift_retain();
    sub_247AAEE9C();
    v33 = MEMORY[0x24BEE4AF8];
    v23 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
    sub_247A95E64(&qword_2576DA890, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    sub_247AA2D88(0, &qword_2576DA898, v23, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    sub_247AAE33C();
    v25 = v26;
    v24 = v27;
    sub_247AAF058();
    MEMORY[0x24958A444](0, v8, v24, v21);
    _Block_release(v21);
    swift_release();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v24, v25);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v32);
    return swift_release();
  }
  return result;
}

uint64_t sub_247AAD518(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(char *, uint64_t, uint64_t);
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  void **v37;
  void *v38;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;

  v40[0] = a3;
  v43 = a2;
  v4 = sub_247AAE6F8();
  v41 = *(_QWORD *)(v4 - 8);
  v42 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for StocksTabiArticleScoringWork();
  MEMORY[0x24BDAC7A8](v7);
  v46 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AA2D88(0, &qword_2576DA8C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6C540], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v40 - v13;
  v15 = sub_247AAED28();
  v47 = *(_QWORD *)(v15 - 8);
  v48 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AAE4EC();
  v19 = v18;
  v20 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_247AAEA58();
  v49 = *(_QWORD *)(v23 - 8);
  v50 = v23;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247AAE39C();
  v45 = v26;
  v40[1] = a1;
  sub_247AAEDF4();
  sub_247AAEE24();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  v27 = sub_247AAEA4C();
  sub_247AAEA40();
  v28 = sub_247AAEA7C();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
  v31 = v30(v14, 1, v28);
  v51 = v6;
  v44 = v27;
  if (v31 == 1)
  {
    sub_247AAE564((uint64_t)v14);
  }
  else
  {
    sub_247AAEA70();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v28);
  }
  v32 = v41;
  sub_247AAEA40();
  if (v30(v12, 1, v28) == 1)
  {
    sub_247AAE564((uint64_t)v12);
  }
  else
  {
    sub_247AAEA64();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v28);
  }
  v34 = v42;
  v33 = v43;
  swift_retain();
  sub_247AAED1C();
  v35 = (uint64_t)v46;
  sub_247AAEE0C();
  v36 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v51, v35, v34);
  sub_247A95874(v35);
  sub_247AAE6E0();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v36, v34);
  swift_beginAccess();
  sub_247AAED10();
  swift_endAccess();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v17, v48);
  v37 = (void **)(v33 + qword_2576DA7D0);
  swift_beginAccess();
  v38 = *v37;
  if (v38)
  {
    swift_endAccess();
    objc_msgSend(v38, sel_tickle, v40[0]);
    return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v25, v50);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v49 + 8))(v25, v50);
    return swift_endAccess();
  }
}

uint64_t sub_247AAD934(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_247AAD960()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_247AAD98C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + qword_2576DA7C0;
  v2 = sub_247AAED34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + qword_2576DA7C8;
  v4 = sub_247AAE680();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

void sub_247AADA10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1 + qword_2576DA7C0;
  v3 = sub_247AAED34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = a1 + qword_2576DA7C8;
  v5 = sub_247AAE680();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

}

uint64_t sub_247AADA98()
{
  return type metadata accessor for StocksTabiScoringContextEventProcessor();
}

void sub_247AADAA0()
{
  uint64_t v0;
  uint64_t v1;

  sub_247AAE5FC();
  swift_allocObject();
  sub_247AAE5F0();
  sub_247AAED34();
  sub_247A95E64((unint64_t *)&unk_2576DA8A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D100], MEMORY[0x24BE6D110]);
  sub_247AAE5E4();
  v1 = v0;
  swift_release();
  if (qword_254454230 != -1)
    swift_once();
  sub_247A96CB8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_247AAF690;
  __asm { BR              X10 }
}

uint64_t sub_247AADEE8(void *a1, int a2, int a3, void *aBlock)
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = _Block_copy(aBlock);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  swift_unknownObjectRetain();
  v7 = a1;
  sub_247AADF98((uint64_t)sub_247AADF8C, v6);
  swift_unknownObjectRelease();

  return swift_release();
}

uint64_t sub_247AADF68()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_247AADF8C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_247AADF98(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD aBlock[6];

  v24 = a1;
  v25 = a2;
  v27 = sub_247AAEE90();
  v30 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_247AAEEA8();
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_247AAED34();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = *(_QWORD *)&v2[qword_2576DA7D8];
  v12 = &v2[qword_2576DA7C0];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v12, v8);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = (v10 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v15 + v13, v11, v8);
  *(_QWORD *)(v15 + v14) = v2;
  v16 = (_QWORD *)(v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8));
  v17 = v25;
  *v16 = v24;
  v16[1] = v17;
  aBlock[4] = sub_247AAE2D4;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247AAD934;
  aBlock[3] = &block_descriptor;
  v18 = _Block_copy(aBlock);
  v19 = v2;
  swift_retain();
  sub_247AAEE9C();
  v31 = MEMORY[0x24BEE4AF8];
  v20 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  sub_247A95E64(&qword_2576DA890, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  sub_247AA2D88(0, &qword_2576DA898, v20, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_247AAE33C();
  v21 = v27;
  sub_247AAF058();
  MEMORY[0x24958A444](0, v7, v4, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v4, v21);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v29);
  return swift_release();
}

uint64_t sub_247AAE244()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_247AAED34();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_release();
  return swift_deallocObject();
}

void sub_247AAE2D4()
{
  sub_247AAED34();
  sub_247AADAA0();
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

unint64_t sub_247AAE33C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576DA8A0;
  if (!qword_2576DA8A0)
  {
    sub_247AA2D88(255, &qword_2576DA898, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x24958A948](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2576DA8A0);
  }
  return result;
}

void sub_247AAE39C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576DA8B8)
  {
    type metadata accessor for StocksTabiArticleScoringWork();
    sub_247A95E64((unint64_t *)&qword_254454110, (uint64_t (*)(uint64_t))type metadata accessor for StocksTabiArticleScoringWork, (uint64_t)&unk_247AB0394);
    v0 = sub_247AAEE18();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576DA8B8);
  }
}

uint64_t sub_247AAE414()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_247AAE39C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247AAE4A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_247AAE39C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_247AAD518(v0 + v3, *(_QWORD *)(v0 + v4), *(_QWORD *)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFF8)));
}

void sub_247AAE4EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576DA8D0)
  {
    sub_247AAEC5C();
    sub_247A95E64((unint64_t *)&qword_2576DA640, (uint64_t (*)(uint64_t))MEMORY[0x24BE6D000], MEMORY[0x24BE6CFF8]);
    v0 = sub_247AAEE30();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576DA8D0);
  }
}

uint64_t sub_247AAE564(uint64_t a1)
{
  uint64_t v2;

  sub_247AA2D88(0, &qword_2576DA8C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6C540], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247AAE5C0()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_247AAE5CC()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_247AAE5D8()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_247AAE5E4()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_247AAE5F0()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_247AAE5FC()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_247AAE608()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_247AAE614()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_247AAE620()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_247AAE62C()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_247AAE638()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_247AAE644()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_247AAE650()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_247AAE65C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_247AAE668()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_247AAE674()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_247AAE680()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_247AAE68C()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_247AAE698()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_247AAE6A4()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_247AAE6B0()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_247AAE6BC()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_247AAE6C8()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_247AAE6D4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_247AAE6E0()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_247AAE6EC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_247AAE6F8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_247AAE704()
{
  return MEMORY[0x24BEB15A0]();
}

uint64_t sub_247AAE710()
{
  return MEMORY[0x24BEB15B0]();
}

uint64_t sub_247AAE71C()
{
  return MEMORY[0x24BEB15B8]();
}

uint64_t sub_247AAE728()
{
  return MEMORY[0x24BEB15C8]();
}

uint64_t sub_247AAE734()
{
  return MEMORY[0x24BEB15D8]();
}

uint64_t sub_247AAE740()
{
  return MEMORY[0x24BEB15E0]();
}

uint64_t sub_247AAE74C()
{
  return MEMORY[0x24BEB15E8]();
}

uint64_t sub_247AAE758()
{
  return MEMORY[0x24BEB1638]();
}

uint64_t sub_247AAE764()
{
  return MEMORY[0x24BEB1640]();
}

uint64_t sub_247AAE770()
{
  return MEMORY[0x24BEB1648]();
}

uint64_t sub_247AAE77C()
{
  return MEMORY[0x24BEB1650]();
}

uint64_t sub_247AAE788()
{
  return MEMORY[0x24BEB1658]();
}

uint64_t sub_247AAE794()
{
  return MEMORY[0x24BEB1660]();
}

uint64_t sub_247AAE7A0()
{
  return MEMORY[0x24BEB1670]();
}

uint64_t sub_247AAE7AC()
{
  return MEMORY[0x24BEB1680]();
}

uint64_t sub_247AAE7B8()
{
  return MEMORY[0x24BEB1688]();
}

uint64_t sub_247AAE7C4()
{
  return MEMORY[0x24BEB1690]();
}

uint64_t sub_247AAE7D0()
{
  return MEMORY[0x24BEB1698]();
}

uint64_t sub_247AAE7DC()
{
  return MEMORY[0x24BEB16A0]();
}

uint64_t sub_247AAE7E8()
{
  return MEMORY[0x24BEB16B0]();
}

uint64_t sub_247AAE7F4()
{
  return MEMORY[0x24BEB16C0]();
}

uint64_t sub_247AAE800()
{
  return MEMORY[0x24BEB16D8]();
}

uint64_t sub_247AAE80C()
{
  return MEMORY[0x24BEB16E0]();
}

uint64_t sub_247AAE818()
{
  return MEMORY[0x24BEB16F8]();
}

uint64_t sub_247AAE824()
{
  return MEMORY[0x24BEB1740]();
}

uint64_t sub_247AAE830()
{
  return MEMORY[0x24BEB1748]();
}

uint64_t sub_247AAE83C()
{
  return MEMORY[0x24BEB1750]();
}

uint64_t sub_247AAE848()
{
  return MEMORY[0x24BEB1758]();
}

uint64_t sub_247AAE854()
{
  return MEMORY[0x24BEB1768]();
}

uint64_t sub_247AAE860()
{
  return MEMORY[0x24BEB1770]();
}

uint64_t sub_247AAE86C()
{
  return MEMORY[0x24BEB1778]();
}

uint64_t sub_247AAE878()
{
  return MEMORY[0x24BEB1790]();
}

uint64_t sub_247AAE884()
{
  return MEMORY[0x24BEB1798]();
}

uint64_t sub_247AAE890()
{
  return MEMORY[0x24BEB17B0]();
}

uint64_t sub_247AAE89C()
{
  return MEMORY[0x24BEB17B8]();
}

uint64_t sub_247AAE8A8()
{
  return MEMORY[0x24BEB17C0]();
}

uint64_t sub_247AAE8B4()
{
  return MEMORY[0x24BEB17C8]();
}

uint64_t sub_247AAE8C0()
{
  return MEMORY[0x24BEB17D0]();
}

uint64_t sub_247AAE8CC()
{
  return MEMORY[0x24BEB17D8]();
}

uint64_t sub_247AAE8D8()
{
  return MEMORY[0x24BEB17E0]();
}

uint64_t sub_247AAE8E4()
{
  return MEMORY[0x24BEB17E8]();
}

uint64_t sub_247AAE8F0()
{
  return MEMORY[0x24BEB17F0]();
}

uint64_t sub_247AAE8FC()
{
  return MEMORY[0x24BEB17F8]();
}

uint64_t sub_247AAE908()
{
  return MEMORY[0x24BEB1800]();
}

uint64_t sub_247AAE914()
{
  return MEMORY[0x24BEB1808]();
}

uint64_t sub_247AAE920()
{
  return MEMORY[0x24BEB1810]();
}

uint64_t sub_247AAE92C()
{
  return MEMORY[0x24BEB1818]();
}

uint64_t sub_247AAE938()
{
  return MEMORY[0x24BEB1820]();
}

uint64_t sub_247AAE944()
{
  return MEMORY[0x24BEB1828]();
}

uint64_t sub_247AAE950()
{
  return MEMORY[0x24BEB1830]();
}

uint64_t sub_247AAE95C()
{
  return MEMORY[0x24BEB1838]();
}

uint64_t sub_247AAE968()
{
  return MEMORY[0x24BEB1840]();
}

uint64_t sub_247AAE974()
{
  return MEMORY[0x24BEB1848]();
}

uint64_t sub_247AAE980()
{
  return MEMORY[0x24BEB1850]();
}

uint64_t sub_247AAE98C()
{
  return MEMORY[0x24BEB1858]();
}

uint64_t sub_247AAE998()
{
  return MEMORY[0x24BEB1860]();
}

uint64_t sub_247AAE9A4()
{
  return MEMORY[0x24BEB18D8]();
}

uint64_t sub_247AAE9B0()
{
  return MEMORY[0x24BEB1900]();
}

uint64_t sub_247AAE9BC()
{
  return MEMORY[0x24BEB19B0]();
}

uint64_t sub_247AAE9C8()
{
  return MEMORY[0x24BEB19B8]();
}

uint64_t sub_247AAE9D4()
{
  return MEMORY[0x24BEB19E0]();
}

uint64_t sub_247AAE9E0()
{
  return MEMORY[0x24BEB19E8]();
}

uint64_t sub_247AAE9EC()
{
  return MEMORY[0x24BEB19F8]();
}

uint64_t sub_247AAE9F8()
{
  return MEMORY[0x24BEB1A08]();
}

uint64_t sub_247AAEA04()
{
  return MEMORY[0x24BEB1A10]();
}

uint64_t sub_247AAEA10()
{
  return MEMORY[0x24BEB1A20]();
}

uint64_t sub_247AAEA1C()
{
  return MEMORY[0x24BEB1BC8]();
}

uint64_t sub_247AAEA28()
{
  return MEMORY[0x24BEB1BE0]();
}

uint64_t sub_247AAEA34()
{
  return MEMORY[0x24BEB1C10]();
}

uint64_t sub_247AAEA40()
{
  return MEMORY[0x24BE6C510]();
}

uint64_t sub_247AAEA4C()
{
  return MEMORY[0x24BE6C518]();
}

uint64_t sub_247AAEA58()
{
  return MEMORY[0x24BE6C520]();
}

uint64_t sub_247AAEA64()
{
  return MEMORY[0x24BE6C530]();
}

uint64_t sub_247AAEA70()
{
  return MEMORY[0x24BE6C538]();
}

uint64_t sub_247AAEA7C()
{
  return MEMORY[0x24BE6C540]();
}

uint64_t sub_247AAEA88()
{
  return MEMORY[0x24BEB4300]();
}

uint64_t sub_247AAEA94()
{
  return MEMORY[0x24BEB4398]();
}

uint64_t sub_247AAEAA0()
{
  return MEMORY[0x24BEB43A8]();
}

uint64_t sub_247AAEAAC()
{
  return MEMORY[0x24BEB43B0]();
}

uint64_t sub_247AAEAB8()
{
  return MEMORY[0x24BEB43D8]();
}

uint64_t sub_247AAEAC4()
{
  return MEMORY[0x24BEB4418]();
}

uint64_t sub_247AAEAD0()
{
  return MEMORY[0x24BEB4420]();
}

uint64_t sub_247AAEADC()
{
  return MEMORY[0x24BEB4430]();
}

uint64_t sub_247AAEAE8()
{
  return MEMORY[0x24BEB4438]();
}

uint64_t sub_247AAEAF4()
{
  return MEMORY[0x24BEB4440]();
}

uint64_t sub_247AAEB00()
{
  return MEMORY[0x24BEB4448]();
}

uint64_t sub_247AAEB0C()
{
  return MEMORY[0x24BEB4468]();
}

uint64_t sub_247AAEB18()
{
  return MEMORY[0x24BEB4478]();
}

uint64_t sub_247AAEB24()
{
  return MEMORY[0x24BEB4500]();
}

uint64_t sub_247AAEB30()
{
  return MEMORY[0x24BEB4508]();
}

uint64_t sub_247AAEB3C()
{
  return MEMORY[0x24BEB4510]();
}

uint64_t sub_247AAEB48()
{
  return MEMORY[0x24BEB4520]();
}

uint64_t sub_247AAEB54()
{
  return MEMORY[0x24BEB4560]();
}

uint64_t sub_247AAEB60()
{
  return MEMORY[0x24BEB4568]();
}

uint64_t sub_247AAEB6C()
{
  return MEMORY[0x24BEB4590]();
}

uint64_t sub_247AAEB78()
{
  return MEMORY[0x24BEB45A8]();
}

uint64_t sub_247AAEB84()
{
  return MEMORY[0x24BEB45F8]();
}

uint64_t sub_247AAEB90()
{
  return MEMORY[0x24BEB4668]();
}

uint64_t sub_247AAEB9C()
{
  return MEMORY[0x24BEB4670]();
}

uint64_t sub_247AAEBA8()
{
  return MEMORY[0x24BEB4678]();
}

uint64_t sub_247AAEBB4()
{
  return MEMORY[0x24BEB4688]();
}

uint64_t sub_247AAEBC0()
{
  return MEMORY[0x24BEB4690]();
}

uint64_t sub_247AAEBCC()
{
  return MEMORY[0x24BEB4698]();
}

uint64_t sub_247AAEBD8()
{
  return MEMORY[0x24BEB46D0]();
}

uint64_t sub_247AAEBE4()
{
  return MEMORY[0x24BEB46D8]();
}

uint64_t sub_247AAEBF0()
{
  return MEMORY[0x24BEB46F0]();
}

uint64_t sub_247AAEBFC()
{
  return MEMORY[0x24BE6CFA8]();
}

uint64_t sub_247AAEC08()
{
  return MEMORY[0x24BE6CFB0]();
}

uint64_t sub_247AAEC14()
{
  return MEMORY[0x24BE6CFB8]();
}

uint64_t sub_247AAEC20()
{
  return MEMORY[0x24BE6CFC0]();
}

uint64_t sub_247AAEC2C()
{
  return MEMORY[0x24BE6CFC8]();
}

uint64_t sub_247AAEC38()
{
  return MEMORY[0x24BE6CFD0]();
}

uint64_t sub_247AAEC44()
{
  return MEMORY[0x24BE6CFE0]();
}

uint64_t sub_247AAEC50()
{
  return MEMORY[0x24BE6CFE8]();
}

uint64_t sub_247AAEC5C()
{
  return MEMORY[0x24BE6D000]();
}

uint64_t sub_247AAEC68()
{
  return MEMORY[0x24BE6D010]();
}

uint64_t sub_247AAEC74()
{
  return MEMORY[0x24BE6D018]();
}

uint64_t sub_247AAEC80()
{
  return MEMORY[0x24BE6D028]();
}

uint64_t sub_247AAEC8C()
{
  return MEMORY[0x24BE6D030]();
}

uint64_t sub_247AAEC98()
{
  return MEMORY[0x24BE6D040]();
}

uint64_t sub_247AAECA4()
{
  return MEMORY[0x24BE6D048]();
}

uint64_t sub_247AAECB0()
{
  return MEMORY[0x24BE6D058]();
}

uint64_t sub_247AAECBC()
{
  return MEMORY[0x24BE6D078]();
}

uint64_t sub_247AAECC8()
{
  return MEMORY[0x24BE6D080]();
}

uint64_t sub_247AAECD4()
{
  return MEMORY[0x24BE6D088]();
}

uint64_t sub_247AAECE0()
{
  return MEMORY[0x24BE6D0A8]();
}

uint64_t sub_247AAECEC()
{
  return MEMORY[0x24BE6D0B0]();
}

uint64_t sub_247AAECF8()
{
  return MEMORY[0x24BE6D0D0]();
}

uint64_t sub_247AAED04()
{
  return MEMORY[0x24BE6D0D8]();
}

uint64_t sub_247AAED10()
{
  return MEMORY[0x24BE6D0E8]();
}

uint64_t sub_247AAED1C()
{
  return MEMORY[0x24BE6D0F0]();
}

uint64_t sub_247AAED28()
{
  return MEMORY[0x24BE6D0F8]();
}

uint64_t sub_247AAED34()
{
  return MEMORY[0x24BE6D100]();
}

uint64_t sub_247AAED40()
{
  return MEMORY[0x24BE6D120]();
}

uint64_t sub_247AAED4C()
{
  return MEMORY[0x24BE6D138]();
}

uint64_t sub_247AAED58()
{
  return MEMORY[0x24BE6D148]();
}

uint64_t sub_247AAED64()
{
  return MEMORY[0x24BE6D150]();
}

uint64_t sub_247AAED70()
{
  return MEMORY[0x24BE6D158]();
}

uint64_t sub_247AAED7C()
{
  return MEMORY[0x24BE6D168]();
}

uint64_t sub_247AAED88()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_247AAED94()
{
  return MEMORY[0x24BEB4198]();
}

uint64_t sub_247AAEDA0()
{
  return MEMORY[0x24BEB41A0]();
}

uint64_t sub_247AAEDAC()
{
  return MEMORY[0x24BEB41A8]();
}

uint64_t sub_247AAEDB8()
{
  return MEMORY[0x24BEB41B0]();
}

uint64_t sub_247AAEDC4()
{
  return MEMORY[0x24BEB41B8]();
}

uint64_t sub_247AAEDD0()
{
  return MEMORY[0x24BEB41C8]();
}

uint64_t sub_247AAEDDC()
{
  return MEMORY[0x24BEB41E0]();
}

uint64_t sub_247AAEDE8()
{
  return MEMORY[0x24BEB41E8]();
}

uint64_t sub_247AAEDF4()
{
  return MEMORY[0x24BEB41F8]();
}

uint64_t sub_247AAEE00()
{
  return MEMORY[0x24BEB4200]();
}

uint64_t sub_247AAEE0C()
{
  return MEMORY[0x24BEB4208]();
}

uint64_t sub_247AAEE18()
{
  return MEMORY[0x24BEB4210]();
}

uint64_t sub_247AAEE24()
{
  return MEMORY[0x24BE6D178]();
}

uint64_t sub_247AAEE30()
{
  return MEMORY[0x24BEB4220]();
}

uint64_t sub_247AAEE3C()
{
  return MEMORY[0x24BEB4230]();
}

uint64_t sub_247AAEE48()
{
  return MEMORY[0x24BE6D180]();
}

uint64_t sub_247AAEE54()
{
  return MEMORY[0x24BE6D188]();
}

uint64_t sub_247AAEE60()
{
  return MEMORY[0x24BEB4238]();
}

uint64_t sub_247AAEE6C()
{
  return MEMORY[0x24BE6D190]();
}

uint64_t sub_247AAEE78()
{
  return MEMORY[0x24BEB4240]();
}

uint64_t sub_247AAEE84()
{
  return MEMORY[0x24BEB4248]();
}

uint64_t sub_247AAEE90()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_247AAEE9C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_247AAEEA8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_247AAEEB4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_247AAEEC0()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_247AAEECC()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_247AAEED8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_247AAEEE4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_247AAEEF0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_247AAEEFC()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_247AAEF08()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_247AAEF14()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_247AAEF20()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_247AAEF2C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_247AAEF38()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_247AAEF44()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_247AAEF50()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_247AAEF5C()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_247AAEF68()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_247AAEF74()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_247AAEF80()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_247AAEF8C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_247AAEF98()
{
  return MEMORY[0x24BEB4770]();
}

uint64_t sub_247AAEFA4()
{
  return MEMORY[0x24BE6D198]();
}

uint64_t sub_247AAEFB0()
{
  return MEMORY[0x24BE6D1A0]();
}

uint64_t sub_247AAEFBC()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_247AAEFC8()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_247AAEFD4()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_247AAEFE0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_247AAEFEC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_247AAEFF8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_247AAF004()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_247AAF010()
{
  return MEMORY[0x24BEB1C70]();
}

uint64_t sub_247AAF01C()
{
  return MEMORY[0x24BE6D1A8]();
}

uint64_t sub_247AAF028()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_247AAF034()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_247AAF040()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_247AAF04C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_247AAF058()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_247AAF064()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_247AAF070()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_247AAF07C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_247AAF088()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_247AAF094()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_247AAF0A0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_247AAF0AC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_247AAF0B8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_247AAF0C4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_247AAF0D0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_247AAF0DC()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_247AAF0E8()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_247AAF0F4()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_247AAF100()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_247AAF10C()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_247AAF118()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_247AAF124()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_247AAF130()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_247AAF13C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_247AAF148()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_247AAF154()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_247AAF160()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_247AAF16C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_247AAF178()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_247AAF184()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_247AAF190()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_247AAF19C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_247AAF1A8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_247AAF1B4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_247AAF1C0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_247AAF1CC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_247AAF1D8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_247AAF1E4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_247AAF1F0()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t NPDeviceSupportsFeedPersonalization()
{
  return MEMORY[0x24BE6D1B0]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x24BEE4D58]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

